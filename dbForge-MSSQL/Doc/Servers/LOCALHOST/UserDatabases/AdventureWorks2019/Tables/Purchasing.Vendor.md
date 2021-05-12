###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Purchasing.Vendor


# ![logo](../../../../../Images/table.svg) Purchasing.Vendor

## <a name="#Description"></a>Description
> Companies from whom Adventure Works Cycles purchases parts or other goods.
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
|Row Count (~)|104|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_Vendor_BusinessEntityID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_Vendor_BusinessEntity_BusinessEntityID: Person.BusinessEntity](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_Vendor_BusinessEntityID](../../../../../Images/Cluster.svg)](#Indexes)|BusinessEntityID|int|4|10|0|True||||False|False|Primary key for Vendor records.  Foreign key to BusinessEntity.BusinessEntityID|
|[![Indexes AK_Vendor_AccountNumber](../../../../../Images/index.svg)](#Indexes)|AccountNumber|[dbo.AccountNumber](../Programmability/Types/UserDefinedDataTypes/dbo.AccountNumber.md)|15|0|0|True||||False|False|Vendor account (identification) number.|
||Name|[dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)|50|0|0|True||||False|False|Company name.|
|[![Check Constraint CK_Vendor_CreditRating](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|CreditRating|tinyint|1|3|0|True||||False|False|1 = Superior, 2 = Excellent, 3 = Above average, 4 = Average, 5 = Below average|
||PreferredVendorStatus|[dbo.Flag](../Programmability/Types/UserDefinedDataTypes/dbo.Flag.md)|1|1|0|True|||(1)|False|False|0 = Do not use if another vendor is available. 1 = Preferred over other vendors supplying the same product.|
||ActiveFlag|[dbo.Flag](../Programmability/Types/UserDefinedDataTypes/dbo.Flag.md)|1|1|0|True|||(1)|False|False|0 = Vendor no longer used. 1 = Vendor is actively used.|
||PurchasingWebServiceURL|nvarchar|1024|0|0|False||||False|False|Vendor URL.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_Vendor_AccountNumber|AccountNumber|True||Unique nonclustered index.|
|[![Primary Key PK_Vendor_BusinessEntityID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_Vendor_BusinessEntityID](../../../../../Images/Cluster.svg)](#Indexes)|PK_Vendor_BusinessEntityID|BusinessEntityID|True||Clustered index created by a primary key constraint.|

## <a name="#DmlTriggers"></a>Triggers
|Name|ANSI Nulls ON|Quoted Identifier ON|On|Not For Replication|Description
|---|---|---|---|---|---
|dVendor|True|True|INSTEAD OF DELETE|True|INSTEAD OF DELETE trigger which keeps Vendors from being deleted.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_Vendor_CreditRating|CreditRating|([CreditRating]>=(1) AND [CreditRating]<=(5))||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_Vendor_BusinessEntity_BusinessEntityID|BusinessEntityID|Foreign key constraint referencing BusinessEntity.BusinessEntityID|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Purchasing.Vendor (
  BusinessEntityID int NOT NULL,
  AccountNumber dbo.AccountNumber NOT NULL,
  Name dbo.Name NOT NULL,
  CreditRating tinyint NOT NULL,
  PreferredVendorStatus dbo.Flag NOT NULL CONSTRAINT DF_Vendor_PreferredVendorStatus DEFAULT (1),
  ActiveFlag dbo.Flag NOT NULL CONSTRAINT DF_Vendor_ActiveFlag DEFAULT (1),
  PurchasingWebServiceURL nvarchar(1024) NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_Vendor_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_Vendor_BusinessEntityID PRIMARY KEY CLUSTERED (BusinessEntityID),
  CONSTRAINT CK_Vendor_CreditRating CHECK ([CreditRating]>=(1) AND [CreditRating]<=(5))
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_Vendor_AccountNumber
  ON Purchasing.Vendor (AccountNumber)
  ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE OR ALTER TRIGGER Purchasing.dVendor ON Purchasing.Vendor 
INSTEAD OF DELETE NOT FOR REPLICATION AS 
BEGIN
    DECLARE @Count int;

    SET @Count = @@ROWCOUNT;
    IF @Count = 0 
        RETURN;

    SET NOCOUNT ON;

    BEGIN TRY
        DECLARE @DeleteCount int;

        SELECT @DeleteCount = COUNT(*) FROM deleted;
        IF @DeleteCount > 0 
        BEGIN
            RAISERROR
                (N'Vendors cannot be deleted. They can only be marked as not active.', -- Message
                10, -- Severity.
                1); -- State.

        -- Rollback any active or uncommittable transactions
            IF @@TRANCOUNT > 0
            BEGIN
                ROLLBACK TRANSACTION;
            END
        END;
    END TRY
    BEGIN CATCH
        EXECUTE [dbo].[uspPrintError];

        -- Rollback any active or uncommittable transactions before
        -- inserting information in the ErrorLog
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END

        EXECUTE [dbo].[uspLogError];
    END CATCH;
END;
GO

ALTER TABLE Purchasing.Vendor
  ADD CONSTRAINT FK_Vendor_BusinessEntity_BusinessEntityID FOREIGN KEY (BusinessEntityID) REFERENCES Person.BusinessEntity (BusinessEntityID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing BusinessEntity.BusinessEntityID', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor', 'CONSTRAINT', N'FK_Vendor_BusinessEntity_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'INSTEAD OF DELETE trigger which keeps Vendors from being deleted.', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor', 'TRIGGER', N'dVendor'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Companies from whom Adventure Works Cycles purchases parts or other goods.', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for Vendor records.  Foreign key to BusinessEntity.BusinessEntityID', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor', 'COLUMN', N'BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Vendor account (identification) number.', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor', 'COLUMN', N'AccountNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Company name.', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'1 = Superior, 2 = Excellent, 3 = Above average, 4 = Average, 5 = Below average', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor', 'COLUMN', N'CreditRating'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'0 = Do not use if another vendor is available. 1 = Preferred over other vendors supplying the same product.', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor', 'COLUMN', N'PreferredVendorStatus'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'0 = Vendor no longer used. 1 = Vendor is actively used.', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor', 'COLUMN', N'ActiveFlag'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Vendor URL.', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor', 'COLUMN', N'PurchasingWebServiceURL'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor', 'INDEX', N'AK_Vendor_AccountNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor', 'INDEX', N'PK_Vendor_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor', 'CONSTRAINT', N'PK_Vendor_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [CreditRating] BETWEEN (1) AND (5)', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor', 'CONSTRAINT', N'CK_Vendor_CreditRating'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 1 (TRUE)', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor', 'CONSTRAINT', N'DF_Vendor_ActiveFlag'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor', 'CONSTRAINT', N'DF_Vendor_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 1 (TRUE)', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor', 'CONSTRAINT', N'DF_Vendor_PreferredVendorStatus'
GO
```

## <a name="#DependsOn"></a>Depends On _`7`_
- [Purchasing](../Security/Schemas/Purchasing.md)
- [Person.BusinessEntity](Person.BusinessEntity.md)
- [dbo.AccountNumber](../Programmability/Types/UserDefinedDataTypes/dbo.AccountNumber.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)
- [dbo.Flag](../Programmability/Types/UserDefinedDataTypes/dbo.Flag.md)
- [dbo.uspPrintError](../Programmability/Procedures/dbo.uspPrintError.md)
- [dbo.uspLogError](../Programmability/Procedures/dbo.uspLogError.md)


## <a name="#UsedBy"></a>Used By _`5`_
- [Purchasing.ProductVendor](Purchasing.ProductVendor.md)
- [Purchasing.PurchaseOrderHeader](Purchasing.PurchaseOrderHeader.md)
- [Purchasing.vVendorWithAddresses](../Views/Purchasing.vVendorWithAddresses.md)
- [Purchasing.vVendorWithContacts](../Views/Purchasing.vVendorWithContacts.md)
- [dbo.ufnGetContactInformation](../Programmability/Functions/TableValuedFunctions/dbo.ufnGetContactInformation.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial