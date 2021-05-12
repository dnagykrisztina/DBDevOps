###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Person.Person


# ![logo](../../../../../Images/table.svg) Person.Person

## <a name="#Description"></a>Description
> Human beings involved with AdventureWorks: employees, customer contacts, and vendor contacts.
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Collation||
|File Group||
|Filestream File Group||
|Is Partitioned|False|
|Partitioned Column||
|Partition Scheme||
|File Groups||
|Filestream Partition Scheme||
|Filestream File Groups||
|Heap|False|
|Full Text Catalog||
|Full Text||
|Compression|NONE|
|Row Count (~)|19972|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2021. 03. 15. 16:32:28|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_Person_BusinessEntityID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_Person_BusinessEntity_BusinessEntityID: Person.BusinessEntity](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_Person_BusinessEntityID](../../../../../Images/Cluster.svg)](#Indexes)|BusinessEntityID|int|4|10|0|True||||False|False|Primary key for Person records.|
|[![Check Constraint CK_Person_PersonType](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|PersonType|nchar|2|0|0|True||||False|False|Primary type of person: SC = Store Contact, IN = Individual (retail) customer, SP = Sales person, EM = Employee (non-sales), VC = Vendor contact, GC = General contact|
||NameStyle|[dbo.NameStyle](../Programmability/Types/UserDefinedDataTypes/dbo.NameStyle.md)|1|1|0|True|||(0)|False|False|0 = The data in FirstName and LastName are stored in western style (first name, last name) order.  1 = Eastern style (last name, first name) order.|
|[![Indexes IX_Person_LastName_FirstName_MiddleName](../../../../../Images/index.svg)](#Indexes)|FirstName|[dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)|50|0|0|True||||False|False|First name of the person.|
|[![Indexes IX_Person_LastName_FirstName_MiddleName](../../../../../Images/index.svg)](#Indexes)|MiddleName|[dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)|50|0|0|False||||False|False|Middle name or middle initial of the person.|
|[![Indexes IX_Person_LastName_FirstName_MiddleName](../../../../../Images/index.svg)](#Indexes)|LastName|[dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)|50|0|0|True||||False|False|Last name of the person.|
|[![Check Constraint CK_Person_EmailPromotion](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|EmailPromotion|int|4|10|0|True|||(0)|False|False|0 = Contact does not wish to receive e-mail promotions, 1 = Contact does wish to receive e-mail promotions from AdventureWorks, 2 = Contact does wish to receive e-mail promotions from AdventureWorks and selected partners. |
|[![Indexes PXML_Person_AddContact](../../../../../Images/index.svg)](#Indexes)|AdditionalContactInfo|[Person.AdditionalContactInfoSchemaCollection](../Programmability/Types/XmlSchemaCollection/Person.AdditionalContactInfoSchemaCollection.md)||0|0|False||||False|False|Additional contact information about the person stored in xml format. |
|[![Indexes PXML_Person_DemographicsXMLPATH_Person_DemographicsXMLPROPERTY_Person_DemographicsXMLVALUE_Person_Demographics](../../../../../Images/index.svg)](#Indexes)|Demographics|[Person.IndividualSurveySchemaCollection](../Programmability/Types/XmlSchemaCollection/Person.IndividualSurveySchemaCollection.md)||0|0|False||||False|False|Personal information such as hobbies, and income collected from online shoppers. Used for sales analysis.|
|[![Indexes AK_Person_rowguid](../../../../../Images/index.svg)](#Indexes)|rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|
|[![Foreign Keys FK_Person_Pet_PetID: Person.Pet](../../../../../Images/foreignkey.svg)](#ForeignKeys)|PetID|int|4|10|0|False||||False|False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_Person_rowguid|rowguid|True||Unique nonclustered index. Used to support replication samples.|
||IX_Person_LastName_FirstName_MiddleName|LastName, FirstName, MiddleName|False|||
|[![Primary Key PK_Person_BusinessEntityID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_Person_BusinessEntityID](../../../../../Images/Cluster.svg)](#Indexes)|PK_Person_BusinessEntityID|BusinessEntityID|True||Clustered index created by a primary key constraint.|
||PXML_Person_AddContact|AdditionalContactInfo|False||Primary XML index.|
||PXML_Person_Demographics|Demographics|False||Primary XML index.|
||XMLPATH_Person_Demographics|Demographics|False||Secondary XML index for path.|
||XMLPROPERTY_Person_Demographics|Demographics|False||Secondary XML index for property.|
||XMLVALUE_Person_Demographics|Demographics|False||Secondary XML index for value.|

## <a name="#DmlTriggers"></a>Triggers
|Name|ANSI Nulls ON|Quoted Identifier ON|On|Not For Replication|Description
|---|---|---|---|---|---
|iuPerson|True|True|AFTER INSERT, UPDATE|True|AFTER INSERT, UPDATE trigger inserting Individual only if the Customer does not exist in the Store table and setting the ModifiedDate column in the Person table to the current date.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_Person_EmailPromotion|EmailPromotion|([EmailPromotion]>=(0) AND [EmailPromotion]<=(2))||
|CK_Person_PersonType|PersonType|([PersonType] IS NULL OR (upper([PersonType])='GC' OR upper([PersonType])='SP' OR upper([PersonType])='EM' OR upper([PersonType])='IN' OR upper([PersonType])='VC' OR upper([PersonType])='SC'))||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_Person_BusinessEntity_BusinessEntityID|BusinessEntityID|Foreign key constraint referencing BusinessEntity.BusinessEntityID.|
|FK_Person_Pet_PetID|PetID||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Person.Person (
  BusinessEntityID int NOT NULL,
  PersonType nchar(2) NOT NULL,
  NameStyle dbo.NameStyle NOT NULL CONSTRAINT DF_Person_NameStyle DEFAULT (0),
  FirstName dbo.Name NOT NULL,
  MiddleName dbo.Name NULL,
  LastName dbo.Name NOT NULL,
  EmailPromotion int NOT NULL CONSTRAINT DF_Person_EmailPromotion DEFAULT (0),
  AdditionalContactInfo xml (CONTENT Person.AdditionalContactInfoSchemaCollection) NULL,
  Demographics xml (CONTENT Person.IndividualSurveySchemaCollection) NULL,
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_Person_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_Person_ModifiedDate DEFAULT (getdate()),
  PetID int NULL,
  CONSTRAINT PK_Person_BusinessEntityID PRIMARY KEY CLUSTERED (BusinessEntityID),
  CONSTRAINT CK_Person_EmailPromotion CHECK ([EmailPromotion]>=(0) AND [EmailPromotion]<=(2)),
  CONSTRAINT CK_Person_PersonType CHECK ([PersonType] IS NULL OR (upper([PersonType])='GC' OR upper([PersonType])='SP' OR upper([PersonType])='EM' OR upper([PersonType])='IN' OR upper([PersonType])='VC' OR upper([PersonType])='SC'))
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PRIMARY XML INDEX PXML_Person_Demographics
  ON Person.Person (Demographics)
GO

CREATE PRIMARY XML INDEX PXML_Person_AddContact
  ON Person.Person (AdditionalContactInfo)
GO

CREATE UNIQUE INDEX AK_Person_rowguid
  ON Person.Person (rowguid)
  ON [PRIMARY]
GO

CREATE INDEX IX_Person_LastName_FirstName_MiddleName
  ON Person.Person (LastName, FirstName, MiddleName)
  ON [PRIMARY]
GO

CREATE XML INDEX XMLPATH_Person_Demographics
  ON Person.Person (Demographics)
  USING XML INDEX PXML_Person_Demographics FOR PATH
GO

CREATE XML INDEX XMLPROPERTY_Person_Demographics
  ON Person.Person (Demographics)
  USING XML INDEX PXML_Person_Demographics FOR PROPERTY
GO

CREATE XML INDEX XMLVALUE_Person_Demographics
  ON Person.Person (Demographics)
  USING XML INDEX PXML_Person_Demographics FOR VALUE
GO
CREATE OR ALTER TRIGGER Person.iuPerson ON Person.Person 
AFTER INSERT, UPDATE NOT FOR REPLICATION AS 
BEGIN
    DECLARE @Count int;

    SET @Count = @@ROWCOUNT;
    IF @Count = 0 
        RETURN;

    SET NOCOUNT ON;

    IF UPDATE([BusinessEntityID]) OR UPDATE([Demographics]) 
    BEGIN
        UPDATE [Person].[Person] 
        SET [Person].[Person].[Demographics] = N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"> 
            <TotalPurchaseYTD>0.00</TotalPurchaseYTD> 
            </IndividualSurvey>' 
        FROM inserted 
        WHERE [Person].[Person].[BusinessEntityID] = inserted.[BusinessEntityID] 
            AND inserted.[Demographics] IS NULL;
        
        UPDATE [Person].[Person] 
        SET [Demographics].modify(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
            insert <TotalPurchaseYTD>0.00</TotalPurchaseYTD> 
            as first 
            into (/IndividualSurvey)[1]') 
        FROM inserted 
        WHERE [Person].[Person].[BusinessEntityID] = inserted.[BusinessEntityID] 
            AND inserted.[Demographics] IS NOT NULL 
            AND inserted.[Demographics].exist(N'declare default element namespace 
                "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
                /IndividualSurvey/TotalPurchaseYTD') <> 1;
    END;
END;
GO

ALTER TABLE Person.Person
  ADD CONSTRAINT FK_Person_BusinessEntity_BusinessEntityID FOREIGN KEY (BusinessEntityID) REFERENCES Person.BusinessEntity (BusinessEntityID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing BusinessEntity.BusinessEntityID.', 'SCHEMA', N'Person', 'TABLE', N'Person', 'CONSTRAINT', N'FK_Person_BusinessEntity_BusinessEntityID'
GO

ALTER TABLE Person.Person
  ADD CONSTRAINT FK_Person_Pet_PetID FOREIGN KEY (PetID) REFERENCES Person.Pet (PetID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary XML index.', 'SCHEMA', N'Person', 'TABLE', N'Person', 'INDEX', N'PXML_Person_Demographics'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary XML index.', 'SCHEMA', N'Person', 'TABLE', N'Person', 'INDEX', N'PXML_Person_AddContact'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Secondary XML index for path.', 'SCHEMA', N'Person', 'TABLE', N'Person', 'INDEX', N'XMLPATH_Person_Demographics'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Secondary XML index for property.', 'SCHEMA', N'Person', 'TABLE', N'Person', 'INDEX', N'XMLPROPERTY_Person_Demographics'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Secondary XML index for value.', 'SCHEMA', N'Person', 'TABLE', N'Person', 'INDEX', N'XMLVALUE_Person_Demographics'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'AFTER INSERT, UPDATE trigger inserting Individual only if the Customer does not exist in the Store table and setting the ModifiedDate column in the Person table to the current date.', 'SCHEMA', N'Person', 'TABLE', N'Person', 'TRIGGER', N'iuPerson'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Human beings involved with AdventureWorks: employees, customer contacts, and vendor contacts.', 'SCHEMA', N'Person', 'TABLE', N'Person'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for Person records.', 'SCHEMA', N'Person', 'TABLE', N'Person', 'COLUMN', N'BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary type of person: SC = Store Contact, IN = Individual (retail) customer, SP = Sales person, EM = Employee (non-sales), VC = Vendor contact, GC = General contact', 'SCHEMA', N'Person', 'TABLE', N'Person', 'COLUMN', N'PersonType'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'0 = The data in FirstName and LastName are stored in western style (first name, last name) order.  1 = Eastern style (last name, first name) order.', 'SCHEMA', N'Person', 'TABLE', N'Person', 'COLUMN', N'NameStyle'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'First name of the person.', 'SCHEMA', N'Person', 'TABLE', N'Person', 'COLUMN', N'FirstName'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Middle name or middle initial of the person.', 'SCHEMA', N'Person', 'TABLE', N'Person', 'COLUMN', N'MiddleName'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Last name of the person.', 'SCHEMA', N'Person', 'TABLE', N'Person', 'COLUMN', N'LastName'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'0 = Contact does not wish to receive e-mail promotions, 1 = Contact does wish to receive e-mail promotions from AdventureWorks, 2 = Contact does wish to receive e-mail promotions from AdventureWorks and selected partners. ', 'SCHEMA', N'Person', 'TABLE', N'Person', 'COLUMN', N'EmailPromotion'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Additional contact information about the person stored in xml format. ', 'SCHEMA', N'Person', 'TABLE', N'Person', 'COLUMN', N'AdditionalContactInfo'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Personal information such as hobbies, and income collected from online shoppers. Used for sales analysis.', 'SCHEMA', N'Person', 'TABLE', N'Person', 'COLUMN', N'Demographics'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Person', 'TABLE', N'Person', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Person', 'TABLE', N'Person', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Person', 'TABLE', N'Person', 'INDEX', N'AK_Person_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Person', 'TABLE', N'Person', 'INDEX', N'PK_Person_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Person', 'TABLE', N'Person', 'CONSTRAINT', N'PK_Person_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [EmailPromotion] >= (0) AND [EmailPromotion] <= (2)', 'SCHEMA', N'Person', 'TABLE', N'Person', 'CONSTRAINT', N'CK_Person_EmailPromotion'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [PersonType] is one of SC, VC, IN, EM or SP.', 'SCHEMA', N'Person', 'TABLE', N'Person', 'CONSTRAINT', N'CK_Person_PersonType'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0', 'SCHEMA', N'Person', 'TABLE', N'Person', 'CONSTRAINT', N'DF_Person_EmailPromotion'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Person', 'TABLE', N'Person', 'CONSTRAINT', N'DF_Person_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0', 'SCHEMA', N'Person', 'TABLE', N'Person', 'CONSTRAINT', N'DF_Person_NameStyle'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Person', 'TABLE', N'Person', 'CONSTRAINT', N'DF_Person_rowguid'
GO
```

## <a name="#DependsOn"></a>Depends On _`7`_
- [Person](../Security/Schemas/Person.md)
- [Person.BusinessEntity](Person.BusinessEntity.md)
- [Person.Pet](Person.Pet.md)
- [dbo.NameStyle](../Programmability/Types/UserDefinedDataTypes/dbo.NameStyle.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)
- [Person.AdditionalContactInfoSchemaCollection](../Programmability/Types/XmlSchemaCollection/Person.AdditionalContactInfoSchemaCollection.md)
- [Person.IndividualSurveySchemaCollection](../Programmability/Types/XmlSchemaCollection/Person.IndividualSurveySchemaCollection.md)


## <a name="#UsedBy"></a>Used By _`22`_
- [HumanResources.Employee](HumanResources.Employee.md)
- [Person.BusinessEntityContact](Person.BusinessEntityContact.md)
- [Person.EmailAddress](Person.EmailAddress.md)
- [Person.Password](Person.Password.md)
- [Person.PersonPhone](Person.PersonPhone.md)
- [Person.Pet](Person.Pet.md)
- [Sales.Customer](Sales.Customer.md)
- [Sales.PersonCreditCard](Sales.PersonCreditCard.md)
- [Sales.SalesOrderDetail](Sales.SalesOrderDetail.md)
- [HumanResources.vEmployee](../Views/HumanResources.vEmployee.md)
- [HumanResources.vEmployeeDepartment](../Views/HumanResources.vEmployeeDepartment.md)
- [HumanResources.vEmployeeDepartmentHistory](../Views/HumanResources.vEmployeeDepartmentHistory.md)
- [Person.vAdditionalContactInfo](../Views/Person.vAdditionalContactInfo.md)
- [Purchasing.vVendorWithContacts](../Views/Purchasing.vVendorWithContacts.md)
- [Sales.vIndividualCustomer](../Views/Sales.vIndividualCustomer.md)
- [Sales.vPersonDemographics](../Views/Sales.vPersonDemographics.md)
- [Sales.vSalesPerson](../Views/Sales.vSalesPerson.md)
- [Sales.vSalesPersonSalesByFiscalYears](../Views/Sales.vSalesPersonSalesByFiscalYears.md)
- [Sales.vStoreWithContacts](../Views/Sales.vStoreWithContacts.md)
- [dbo.uspGetEmployeeManagers](../Programmability/Procedures/dbo.uspGetEmployeeManagers.md)
- [dbo.uspGetManagerEmployees](../Programmability/Procedures/dbo.uspGetManagerEmployees.md)
- [dbo.ufnGetContactInformation](../Programmability/Functions/TableValuedFunctions/dbo.ufnGetContactInformation.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial