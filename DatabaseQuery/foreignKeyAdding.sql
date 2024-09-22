
alter table tbl_DocumentStatus
add constraint FK_tbl_DocumentStatus_tbl_Status
foreign key (StatusId) references tbl_Status(SId);

alter table tbl_DocumentStatus
add constraint FK_tbl_DocumentStatus_tbl_Department
foreign key (DepartmentId) references tbl_Department(DeportId)

delete
from tbl_DocumentStatus
where DepartmentId NOT IN(1,2,3,4)

alter table tbl_DocumentStatus
add constraint FK_tbl_DocumentStatus_tbl_DocumentRegistration
foreign key (DocumentId) references tbl_DocumentRegistration(DId)

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'tbl_DocumentStatus'

alter table tbl_DocumentStatus drop constraint FK_tbl_DocumentStatus_tbl_DocumentRegistration

delete
from tbl_DocumentStatus
where DocumentId NOT IN (select DId from tbl_DocumentRegistration)

alter table tbl_SupportingDocuments
add constraint FK_tbl_SupportingDocuments_tbl_DocumentRegistration
foreign key (DocId) references tbl_DocumentRegistration(DId)

delete
from tbl_SupportingDocuments
where DocId NOT IN (select DId from tbl_DocumentRegistration)