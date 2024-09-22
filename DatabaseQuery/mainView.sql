 create procedure sp_mainViewWithDocumentstatus
 as
 begin
 SELECT base.DId, base.DartaNo, base.DocumentTitle, base.DocumentPath,base.Organization, base.MobileNo, base.StateId, base.StateName, base.DistrictId,base.District,  base.VDCMUNId, base.VDCName , base.DepartmentId,base.DepartmentName, base.Status , base.StatusId, base.documents
    FROM 
    (
        SELECT DISTINCT  stat.StateName as StateName, vdc.Name as VDCName, district.District as District, docr.*, sec.EntryDate as LatestUpdatedDate, sec.StatusId, sec.Status, sec.DepartmentId ,sec.DepartmentName, support.documents
        FROM tbl_DocumentRegistration as docr
        LEFT JOIN 
        (
            SELECT DISTINCT ds1.DocumentId, ds1.DepartmentId, ds1.ApprovedBy, ds1.StatusId, ds1.Remarks, ds1.EntryDate, ds1.UserId , dep.DepartmentName, st.Status  --HERE
            FROM tbl_DocumentStatus ds1
            JOIN 
            (
                SELECT ds2.DocumentId, ds2.DepartmentId, MAX(EntryDate) as latest																			--Just making ready to join document Registration
                FROM tbl_DocumentStatus as ds2
                GROUP BY ds2.DocumentId, ds2.DepartmentId
            ) as ds2 ON ds1.DocumentId = ds2.DocumentId AND ds1.DepartmentId = ds2.DepartmentId AND ds1.EntryDate = ds2.latest
            JOIN tbl_Department as dep ON dep.DeportId = ds2.DepartmentId																							--TO HERE 
            JOIN tbl_Status as st ON st.SId = ds1.StatusId		 
        ) as sec ON docr.DId = sec.DocumentId
		LEFT JOIN tbl_StateList as stat ON stat.StateId = docr.StateId
		LEFT JOIN tbl_Vdc as vdc ON vdc.VdcID = docr.VDCMUNId
		LEFT JOIN tbl_DistrictList as district ON district.DId = docr.DistrictId
		LEFT JOIN (
			select DocId, STRING_AGG(DocumentPath, '`') AS documents
			from tbl_SupportingDocuments
			group by DocId	
		)as support ON support.DocId = docr.DId
    ) as base
	order by DId desc, DepartmentId asc
	end

	exec sp_mainViewWithDocumentstatus
	


	create function getStatuss(@DId int )
	returns varchar(100)
	as
	begin
		 DECLARE @Result VARCHAR(100)

    IF EXISTS (SELECT * FROM tbl_DocumentStatus WHERE DocumentId = 1444 AND StatusId = 1)
        SET @Result = 'rejected'
    ELSE IF EXISTS (SELECT 1 FROM tbl_DocumentStatus WHERE DocumentId = @DId AND StatusId = 1)
        SET @Result = 'pending'
    ELSE
        SET @Result = 'approved'

    RETURN @Result
	end

	select dbo.getStatuss(1444) as status



alter FUNCTION getStatus(@DId INT)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @Result VARCHAR(100);

    WITH BaseQuery AS (
	SELECT base.DId, base.DartaNo, base.DocumentTitle, base.DocumentPath,base.Organization, base.MobileNo, base.StateId, base.StateName, base.DistrictId,base.District,  base.VDCMUNId, base.VDCName , base.DepartmentId,base.DepartmentName, base.Status , base.StatusId, base.documents
    FROM 
    (
        SELECT DISTINCT  stat.StateName as StateName, vdc.Name as VDCName, district.District as District, docr.*, sec.EntryDate as LatestUpdatedDate, sec.StatusId, sec.Status, sec.DepartmentId ,sec.DepartmentName, support.documents
        FROM tbl_DocumentRegistration as docr
        LEFT JOIN 
        (
            SELECT DISTINCT ds1.DocumentId, ds1.DepartmentId, ds1.ApprovedBy, ds1.StatusId, ds1.Remarks, ds1.EntryDate, ds1.UserId , dep.DepartmentName, st.Status  --HERE
            FROM tbl_DocumentStatus ds1
            JOIN 
            (
                SELECT ds2.DocumentId, ds2.DepartmentId, MAX(EntryDate) as latest																			--Just making ready to join document Registration
                FROM tbl_DocumentStatus as ds2
                GROUP BY ds2.DocumentId, ds2.DepartmentId
            ) as ds2 ON ds1.DocumentId = ds2.DocumentId AND ds1.DepartmentId = ds2.DepartmentId AND ds1.EntryDate = ds2.latest
            JOIN tbl_Department as dep ON dep.DeportId = ds2.DepartmentId																							--TO HERE 
            JOIN tbl_Status as st ON st.SId = ds1.StatusId		 
        ) as sec ON docr.DId = sec.DocumentId
		LEFT JOIN tbl_StateList as stat ON stat.StateId = docr.StateId
		LEFT JOIN tbl_Vdc as vdc ON vdc.VdcID = docr.VDCMUNId
		LEFT JOIN tbl_DistrictList as district ON district.DId = docr.DistrictId
		LEFT JOIN (
			select DocId, STRING_AGG(DocumentPath, '`') AS documents
			from tbl_SupportingDocuments
			group by DocId	
		)as support ON support.DocId = docr.DId
    ) as base
	)
  SELECT @Result = CASE
        WHEN EXISTS (SELECT 1 FROM BaseQuery WHERE DId = @DId AND StatusId = 3) THEN 'Rejected'
        WHEN EXISTS (SELECT 1 FROM BaseQuery WHERE DId = @DId AND StatusId = 1) THEN 'Pending'
        ELSE 'Approved'
    END;

    RETURN @Result;
     
    --Select @Result = CASE
    --    WHEN EXISTS (
    --        SELECT 1
    --        FROM BaseQuery
    --        WHERE DId = @DId AND StatusId = 3
    --    )
    --    THEN 'rejected'
    --    WHEN EXISTS (
    --        SELECT 1
    --        FROM BaseQuery
    --        WHERE DId = @DId AND StatusId = 1
    --    )
    --    THEN 'pending'
        
    --    ELSE 'approved'
	
	
END;



DECLARE @DId INT
DECLARE @Result VARCHAR(100)

SET @DId = 141 -- Set the value of @DId to the desired DocumentId

SELECT @Result = dbo.getStatus(@DId)

-- Now you can use the @Result variable in further operations or display it
SELECT @Result AS Status



