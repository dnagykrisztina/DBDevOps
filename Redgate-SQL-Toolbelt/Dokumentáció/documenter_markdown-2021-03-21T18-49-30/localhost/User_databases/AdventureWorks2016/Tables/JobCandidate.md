#### 

[Project](../../../../index.md) > [localhost](../../../index.md) > [User databases](../../index.md) > [AdventureWorks2016](../index.md) > [Tables](Tables.md) > HumanResources.JobCandidate

# ![Tables](../../../../Images/Table32.png) [HumanResources].[JobCandidate]

---

## <a name="#description"></a>MS_Description

Résumés submitted to Human Resources by job applicants.

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Full Text Catalog | [AW2016FullTextCatalog](../Storage/Full_Text_Catalogs/AW2016FullTextCatalog.md) |
| Full Text Key Index | PK_JobCandidate_JobCandidateID |
| Row Count (~) | 13 |
| Created | 17:24:40 2017. október 19., csütörtök |
| Last Modified | 17:24:51 2017. október 19., csütörtök |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Full Text Indexed | Language | Identity | Default | Description |
|---|---|---|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_JobCandidate_JobCandidateID: JobCandidateID](../../../../Images/pkcluster.png)](#indexes) | JobCandidateID | int | 4 | NOT NULL |  |  | 1 - 1 |  | _Primary key for JobCandidate records._ |
| [![Indexes IX_JobCandidate_BusinessEntityID](../../../../Images/Index.png)](#indexes)[![Foreign Keys FK_JobCandidate_Employee_BusinessEntityID: [HumanResources].[Employee].BusinessEntityID](../../../../Images/fk.png)](#foreignkeys) | BusinessEntityID | int | 4 | NULL allowed |  |  |  |  | _Employee identification number if applicant was hired. Foreign key to Employee.BusinessEntityID._ |
|  | Resume | [xml([HumanResources].[HRResumeSchemaCollection])](../Programmability/Types/XML_Schema_Collections/HRResumeSchemaCollection.md) | max | NULL allowed | YES | 1033 |  |  | _Résumé in XML format._ |
|  | ModifiedDate | datetime | 8 | NOT NULL |  |  |  | (getdate()) | _Date and time the record was last updated._ |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique | Description |
|---|---|---|---|---|
| [![Cluster Primary Key PK_JobCandidate_JobCandidateID: JobCandidateID](../../../../Images/pkcluster.png)](#indexes) | PK_JobCandidate_JobCandidateID | JobCandidateID | YES | _Primary key (clustered) constraint_ |
|  | IX_JobCandidate_BusinessEntityID | BusinessEntityID |  | _Nonclustered index._ |


---

## <a name="#foreignkeys"></a>Foreign Keys

| Name | Columns | Description |
|---|---|---|
| FK_JobCandidate_Employee_BusinessEntityID | BusinessEntityID->[[HumanResources].[Employee].[BusinessEntityID]](Employee.md) | _Foreign key constraint referencing Employee.EmployeeID._ |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [HumanResources].[JobCandidate]
(
[JobCandidateID] [int] NOT NULL IDENTITY(1, 1),
[BusinessEntityID] [int] NULL,
[Resume] [xml] (CONTENT [HumanResources].[HRResumeSchemaCollection]) NULL,
[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_JobCandidate_ModifiedDate] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [HumanResources].[JobCandidate] ADD CONSTRAINT [PK_JobCandidate_JobCandidateID] PRIMARY KEY CLUSTERED  ([JobCandidateID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_JobCandidate_BusinessEntityID] ON [HumanResources].[JobCandidate] ([BusinessEntityID]) ON [PRIMARY]
GO
ALTER TABLE [HumanResources].[JobCandidate] ADD CONSTRAINT [FK_JobCandidate_Employee_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [HumanResources].[Employee] ([BusinessEntityID])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Résumés submitted to Human Resources by job applicants.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Employee identification number if applicant was hired. Foreign key to Employee.BusinessEntityID.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'COLUMN', N'BusinessEntityID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key for JobCandidate records.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'COLUMN', N'JobCandidateID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'COLUMN', N'ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Résumé in XML format.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'COLUMN', N'Resume'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'CONSTRAINT', N'DF_JobCandidate_ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Employee.EmployeeID.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'CONSTRAINT', N'FK_JobCandidate_Employee_BusinessEntityID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'CONSTRAINT', N'PK_JobCandidate_JobCandidateID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'INDEX', N'IX_JobCandidate_BusinessEntityID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'INDEX', N'PK_JobCandidate_JobCandidateID'
GO
CREATE FULLTEXT INDEX ON [HumanResources].[JobCandidate] KEY INDEX [PK_JobCandidate_JobCandidateID] ON [AW2016FullTextCatalog]
GO
ALTER FULLTEXT INDEX ON [HumanResources].[JobCandidate] ADD ([Resume] LANGUAGE 1033)
GO

```


---

## <a name="#uses"></a>Uses

* [[HumanResources].[Employee]](Employee.md)
* [HumanResources](../Security/Schemas/HumanResources.md)
* [[HumanResources].[HRResumeSchemaCollection]](../Programmability/Types/XML_Schema_Collections/HRResumeSchemaCollection.md)


---

## <a name="#usedby"></a>Used By

* [[HumanResources].[vJobCandidate]](../Views/vJobCandidate.md)
* [[HumanResources].[vJobCandidateEducation]](../Views/vJobCandidateEducation.md)
* [[HumanResources].[vJobCandidateEmployment]](../Views/vJobCandidateEmployment.md)
* [[dbo].[uspSearchCandidateResumes]](../Programmability/Stored_Procedures/uspSearchCandidateResumes.md)
* [AW2016FullTextCatalog](../Storage/Full_Text_Catalogs/AW2016FullTextCatalog.md)


---

###### Author:  dnagykrisztina

###### Copyright 2021 - All Rights Reserved

###### Created: 2021. március 21., vasárnap 18:49:30

