USE [odmsDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_trackDocument]    Script Date: 5/11/2023 2:50:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 ALTER procedure [dbo].[sp_trackDocument]
  as
  begin
	select docr.DId, ds.SId, docr.DocumentTitle, dep.DeportId, dep.DepartmentName, ds.ApprovedBy, ss.Status , docr.DocumentPath
	from tbl_DocumentRegistration as docr
	join tbl_DocumentStatus as ds on docr.DId = ds.DocumentId
	join tbl_Status as ss on ds.StatusId = ss.SId
	join tbl_Department as dep on ds.DepartmentId = dep.DeportId
	group by DId, DeportId
  end

-- returns latest status of document in the department using a extra join
SELECT docr.DId, ds.SId, docr.DocumentTitle, dep.DeportId, dep.DepartmentName, ds.ApprovedBy, ss.Status, ds.EntryDate, docr.DocumentPath, ds.*, maxds.*
FROM tbl_DocumentRegistration AS docr
JOIN tbl_DocumentStatus AS ds ON docr.DId = ds.DocumentId
JOIN tbl_Status AS ss ON ds.StatusId = ss.SId
JOIN tbl_Department AS dep ON ds.DepartmentId = dep.DeportId
JOIN (
    SELECT DocumentId, DepartmentId, MAX(EntryDate) AS MaxTimestamp
    FROM tbl_DocumentStatus
    GROUP BY DocumentId, DepartmentId
) AS maxds ON ds.DocumentId = maxds.DocumentId AND ds.DepartmentId = maxds.DepartmentId AND ds.EntryDate = maxds.MaxTimestamp

-- returns latest status of document in the department using a extra condition in where clause
SELECT docr.DId, ds.SId, docr.DocumentTitle, dep.DeportId, dep.DepartmentName, ds.ApprovedBy, ss.Status, ds.EntryDate, docr.DocumentPath
FROM tbl_DocumentRegistration AS docr
JOIN tbl_DocumentStatus AS ds ON docr.DId = ds.DocumentId
JOIN tbl_Status AS ss ON ds.StatusId = ss.SId
JOIN tbl_Department AS dep ON ds.DepartmentId = dep.DeportId
WHERE ds.EntryDate = (
    SELECT MAX(EntryDate)
    FROM tbl_DocumentStatus
    WHERE DocumentId = ds.DocumentId AND DepartmentId = ds.DepartmentId
)


--returns document status according to the each department

 ALTER procedure [dbo].[sp_trackDocumentByDepartment] (@DepartmentId int)
  as
  begin
	select docr.DId , ds.SId, docr.DocumentTitle, ds.DepartmentId, dep.DepartmentName, ds.ApprovedBy, st.Status,  docr.DocumentPath, ds.EntryDate, docr.IsActive
	from tbl_DocumentStatus ds 
	join tbl_DocumentRegistration docr on ds.DocumentId = docr.DId
	join tbl_Department dep on ds.DepartmentId = dep.DeportId
	join tbl_Status st on ds.StatusId = st.SId
	where ds.EntryDate = (
		select MAX(EntryDate)
		from tbl_DocumentStatus
		where DocumentId = ds.DocumentId AND DepartmentId = ds.DepartmentId
	) AND ds.DepartmentId = 1
	order by docr.DId, dep.DeportId ASC
  end

  -- for approve button
  --insert new data in the documentStaus table with updated status of the document
  --data other than the changed or supplied ones is same as the tuple that is updated latest
  alter procedure sp_updateDocumentStatusInDepartment (@DocumentId int, @DepartmentId int, @StatusId int, @ApprovedBy varchar(100) = NULL, @Remarks varchar(max) = NULL)
  as
  begin
	insert into tbl_DocumentStatus (DocumentId, DepartmentId, ApprovedBy, StatusId, Remarks, EntryDate, UserId) 
	select Top 1 DocumentId, DepartmentId, @ApprovedBy, @StatusId, @Remarks,  getdate(), UserId    --top 1 used as if multiple row exists with same documentid and DeparmentId  the row gets inserted exponentially
	from tbl_DocumentStatus
	where DocumentId = @DocumentId AND DepartmentId = @DepartmentId AND EntryDate = (
		Select max(EntryDate) from tbl_DocumentStatus where DocumentId = @DocumentId AND DepartmentId = @DepartmentId
		)
  end

  exec sp_updateDocumentStatusInDepartment 123, 4, 3

  --for final view
  -- it should retrive latest data of document id, departmentId, EntryDate and Status Id
  select ds.DocumentId, ds.DepartmentId, EntryDate, StatusId
  from tbl_DocumentStatus ds
  join (
	select DocumentId, DepartmentId, max(EntryDate) as latest
	from tbl_DocumentStatus ds2
	group by DocumentId, DepartmentId
	--order by DocumentId , DepartmentId asc 
  )ds2 on ds2.DepartmentId = ds.DepartmentId AND ds2.DocumentId = ds.DocumentId AND ds2.latest = ds.EntryDate
  


  --delete duplicate row from documentStatusTable
  BEGIN TRANSACTION deleteDocumentStatus
  delete from tbl_DocumentStatus
  where SId NOT IN
  (
	select max(SId) as high
	from tbl_DocumentStatus
	group by DocumentId, DepartmentId, ApprovedBy, StatusId, EntryDate, UserId, Remarks
  )

  COMMIT TRANSACTION deleteDocumentStatus


  --department-status result
  --create procedure sp_statusOfEachDocumentWithEachDepartment
--  as
--  begin
--  SELECT DId AS DocId, [1] AS Department1, [2] AS Department2, [3] AS Department3, [4] AS Department4
--FROM (													--base query must have atleast 3 columns
--	SELECT docr.DId, ds.DepartmentId, st.Status       --first column should be unique identifier second column is columns for simple view and third is for data to be shown
--	FROM tbl_DocumentStatus ds 
--	JOIN tbl_DocumentRegistration docr ON ds.DocumentId = docr.DId
--	JOIN tbl_Status st ON ds.StatusId = st.SId
--	JOIN tbl_Department dep ON ds.DepartmentId = dep.DeportId
--) AS SourceTable
--PIVOT (
--	MAX(Status)								--shows max value for a documentId respect to the departmentId to be displayed in the view
--	FOR DepartmentId IN ([1], [2], [3], [4])	--status value aggregated according to departmentId 1, 2, 3, 4
--) AS PivotTable

--end


--the correct one
 ALTER procedure [dbo].[sp_statusOfEachDocumentWithEachDepartment]
  as
  begin
  SELECT DId AS DocId, [1] AS Department1, [2] AS Department2, [3] AS Department3, [4] AS Department4
FROM (													--base query must have atleast 3 columns
	SELECT docr.DId, ds.DepartmentId, st.Status     --first column should be unique identifier second column is columns for simple view and third is for data to be shown
	FROM tbl_DocumentStatus ds 
	JOIN tbl_DocumentRegistration docr ON ds.DocumentId = docr.DId
	JOIN tbl_Status st ON ds.StatusId = st.SId
	--order by EntryDate
	JOIN(                                                                            --needed to remove duplicate tuple 
		select dss.DocumentId, dss.DepartmentId, MAX(EntryDate) as latest       
		from tbl_DocumentStatus dss
		group by DocumentId, DepartmentId
		)as dss ON ds.DocumentId = dss.DocumentId AND ds.DepartmentId = dss.DepartmentId AND ds.EntryDate = dss.latest
) AS SourceTable
PIVOT (
	MAX(Status)								--shows max value for a documentId respect to the departmentId to be displayed in the view
	FOR DepartmentId IN ([1], [2], [3], [4])	--status value aggregated according to departmentId 1, 2, 3, 4
) AS PivotTable

end

--for search feature

  select distinct docr.*, sec.EntryDate as LatestUpdatedDate, sec.StatusId, sec.Status, sec.DepartmentName
  from tbl_DocumentRegistration as docr
  left join (
	  select distinct ds1.DocumentId, ds1.DepartmentId, ds1.ApprovedBy, ds1.StatusId, ds1.Remarks, ds1.EntryDate, ds1.UserId , dep.DepartmentName, st.Status
  from tbl_DocumentStatus ds1
  join (
	select ds2.DocumentId, ds2.DepartmentId, MAX(EntryDate) as latest
	from tbl_DocumentStatus as ds2
	group by ds2.DocumentId, ds2.DepartmentId
  )as ds2 
  on ds1.DocumentId = ds2.DocumentId AND ds1.DepartmentId = ds2.DepartmentId AND ds1.EntryDate = ds2.latest
  join tbl_Department as dep on dep.DeportId = ds2.DepartmentId
  join tbl_Status as st on st.SId = ds1.StatusId
  )as sec on docr.DId = sec.DocumentId
 -- where docr.EntryDate = '2020-10-10 00:00:00.000'
 --where sec.DepartmentId = 2

 SELECT *
FROM tbl_DocumentRegistration
WHERE  Organization LIKE '%bhum%';

--search repeat
select * 
from (
	select distinct docr.*, sec.EntryDate as LatestUpdatedDate, sec.StatusId, sec.Status, sec.DepartmentName
  from tbl_DocumentRegistration as docr
  left join (
	  select distinct ds1.DocumentId, ds1.DepartmentId, ds1.ApprovedBy, ds1.StatusId, ds1.Remarks, ds1.EntryDate, ds1.UserId , dep.DepartmentName, st.Status
  from tbl_DocumentStatus ds1
  join (
	select ds2.DocumentId, ds2.DepartmentId, MAX(EntryDate) as latest
	from tbl_DocumentStatus as ds2
	group by ds2.DocumentId, ds2.DepartmentId
  )as ds2 
  on ds1.DocumentId = ds2.DocumentId AND ds1.DepartmentId = ds2.DepartmentId AND ds1.EntryDate = ds2.latest
  join tbl_Department as dep on dep.DeportId = ds2.DepartmentId
  join tbl_Status as st on st.SId = ds1.StatusId
  )as sec on docr.DId = sec.DocumentId
)as base
where base.Organization LIKE '%bhumi%' AND base.DocumentTitle LIKE '%%' AND base.StateId = 5 AND base.Email LIKE '%ggg%'

--where base.Organization LIKE '%nap%'




    
    




  