###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Purchasing.PurchaseOrderHeader


# ![logo](../../../../../Images/table.svg) Purchasing.PurchaseOrderHeader

## <a name="#Description"></a>Description
> General purchase order information. See PurchaseOrderDetail.
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
|Row Count (~)|4012|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_PurchaseOrderHeader_PurchaseOrderID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_PurchaseOrderHeader_PurchaseOrderID](../../../../../Images/Cluster.svg)](#Indexes)|PurchaseOrderID|int|4|10|0|True|1 - 1|||False|False|Primary key.|
||RevisionNumber|tinyint|1|3|0|True|||(0)|False|False|Incremental number to track changes to the purchase order over time.|
|[![Check Constraint CK_PurchaseOrderHeader_Status](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|Status|tinyint|1|3|0|True|||(1)|False|False|Order current status. 1 = Pending; 2 = Approved; 3 = Rejected; 4 = Complete|
|[![Foreign Keys FK_PurchaseOrderHeader_Employee_EmployeeID: HumanResources.Employee](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes IX_PurchaseOrderHeader_EmployeeID](../../../../../Images/index.svg)](#Indexes)|EmployeeID|int|4|10|0|True||||False|False|Employee who created the purchase order. Foreign key to Employee.BusinessEntityID.|
|[![Foreign Keys FK_PurchaseOrderHeader_Vendor_VendorID: Purchasing.Vendor](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes IX_PurchaseOrderHeader_VendorID](../../../../../Images/index.svg)](#Indexes)|VendorID|int|4|10|0|True||||False|False|Vendor with whom the purchase order is placed. Foreign key to Vendor.BusinessEntityID.|
|[![Foreign Keys FK_PurchaseOrderHeader_ShipMethod_ShipMethodID: Purchasing.ShipMethod](../../../../../Images/foreignkey.svg)](#ForeignKeys)|ShipMethodID|int|4|10|0|True||||False|False|Shipping method. Foreign key to ShipMethod.ShipMethodID.|
||OrderDate|datetime|8|23|3|True|||(getdate())|False|False|Purchase order creation date.|
||ShipDate|datetime|8|23|3|False||||False|False|Estimated shipment date from the vendor.|
|[![Check Constraint CK_PurchaseOrderHeader_SubTotal](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|SubTotal|money|8|19|4|True|||(0.00)|False|False|Purchase order subtotal. Computed as SUM(PurchaseOrderDetail.LineTotal)for the appropriate PurchaseOrderID.|
|[![Check Constraint CK_PurchaseOrderHeader_TaxAmt](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|TaxAmt|money|8|19|4|True|||(0.00)|False|False|Tax amount.|
|[![Check Constraint CK_PurchaseOrderHeader_Freight](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|Freight|money|8|19|4|True|||(0.00)|False|False|Shipping cost.|
||TotalDue|money|8|19|4|True||||True|True|Total due to vendor. Computed as Subtotal + TaxAmt + Freight.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#ComputedColumns"></a>Computed Columns
|Name|Definition
|---|---
|TotalDue|(isnull(([SubTotal]+[TaxAmt])+[Freight],(0)))|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||IX_PurchaseOrderHeader_EmployeeID|EmployeeID|False||Nonclustered index.|
||IX_PurchaseOrderHeader_VendorID|VendorID|False||Nonclustered index.|
|[![Primary Key PK_PurchaseOrderHeader_PurchaseOrderID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_PurchaseOrderHeader_PurchaseOrderID](../../../../../Images/Cluster.svg)](#Indexes)|PK_PurchaseOrderHeader_PurchaseOrderID|PurchaseOrderID|True||Clustered index created by a primary key constraint.|

## <a name="#DmlTriggers"></a>Triggers
|Name|ANSI Nulls ON|Quoted Identifier ON|On|Not For Replication|Description
|---|---|---|---|---|---
|uPurchaseOrderHeader|True|True|AFTER UPDATE|False|AFTER UPDATE trigger that updates the RevisionNumber and ModifiedDate columns in the PurchaseOrderHeader table.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_PurchaseOrderHeader_Freight|Freight|([Freight]>=(0.00))||
|CK_PurchaseOrderHeader_ShipDate||([ShipDate]>=[OrderDate] OR [ShipDate] IS NULL)||
|CK_PurchaseOrderHeader_Status|Status|([Status]>=(1) AND [Status]<=(4))||
|CK_PurchaseOrderHeader_SubTotal|SubTotal|([SubTotal]>=(0.00))||
|CK_PurchaseOrderHeader_TaxAmt|TaxAmt|([TaxAmt]>=(0.00))||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_PurchaseOrderHeader_Employee_EmployeeID|BusinessEntityID|Foreign key constraint referencing Employee.EmployeeID.|
|FK_PurchaseOrderHeader_ShipMethod_ShipMethodID|ShipMethodID|Foreign key constraint referencing ShipMethod.ShipMethodID.|
|FK_PurchaseOrderHeader_Vendor_VendorID|BusinessEntityID|Foreign key constraint referencing Vendor.VendorID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE Purchasing.PurchaseOrderHeader (
  PurchaseOrderID int IDENTITY,
  RevisionNumber tinyint NOT NULL CONSTRAINT DF_PurchaseOrderHeader_RevisionNumber DEFAULT (0),
  Status tinyint NOT NULL CONSTRAINT DF_PurchaseOrderHeader_Status DEFAULT (1),
  EmployeeID int NOT NULL,
  VendorID int NOT NULL,
  ShipMethodID int NOT NULL,
  OrderDate datetime NOT NULL CONSTRAINT DF_PurchaseOrderHeader_OrderDate DEFAULT (getdate()),
  ShipDate datetime NULL,
  SubTotal money NOT NULL CONSTRAINT DF_PurchaseOrderHeader_SubTotal DEFAULT (0.00),
  TaxAmt money NOT NULL CONSTRAINT DF_PurchaseOrderHeader_TaxAmt DEFAULT (0.00),
  Freight money NOT NULL CONSTRAINT DF_PurchaseOrderHeader_Freight DEFAULT (0.00),
  TotalDue AS (isnull(([SubTotal]+[TaxAmt])+[Freight],(0))) PERSISTED NOT NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_PurchaseOrderHeader_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_PurchaseOrderHeader_PurchaseOrderID PRIMARY KEY CLUSTERED (PurchaseOrderID),
  CONSTRAINT CK_PurchaseOrderHeader_Freight CHECK ([Freight]>=(0.00)),
  CONSTRAINT CK_PurchaseOrderHeader_ShipDate CHECK ([ShipDate]>=[OrderDate] OR [ShipDate] IS NULL),
  CONSTRAINT CK_PurchaseOrderHeader_Status CHECK ([Status]>=(1) AND [Status]<=(4)),
  CONSTRAINT CK_PurchaseOrderHeader_SubTotal CHECK ([SubTotal]>=(0.00)),
  CONSTRAINT CK_PurchaseOrderHeader_TaxAmt CHECK ([TaxAmt]>=(0.00))
)
ON [PRIMARY]
GO

CREATE INDEX IX_PurchaseOrderHeader_EmployeeID
  ON Purchasing.PurchaseOrderHeader (EmployeeID)
  ON [PRIMARY]
GO

CREATE INDEX IX_PurchaseOrderHeader_VendorID
  ON Purchasing.PurchaseOrderHeader (VendorID)
  ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
CREATE OR ALTER TRIGGER Purchasing.uPurchaseOrderHeader ON Purchasing.PurchaseOrderHeader 
AFTER UPDATE AS 
BEGIN
    DECLARE @Count int;

    SET @Count = @@ROWCOUNT;
    IF @Count = 0 
        RETURN;

    SET NOCOUNT ON;

    BEGIN TRY
        -- Update RevisionNumber for modification of any field EXCEPT the Status.
        IF NOT UPDATE([Status])
        BEGIN
            UPDATE [Purchasing].[PurchaseOrderHeader]
            SET [Purchasing].[PurchaseOrderHeader].[RevisionNumber] = 
                [Purchasing].[PurchaseOrderHeader].[RevisionNumber] + 1
            WHERE [Purchasing].[PurchaseOrderHeader].[PurchaseOrderID] IN 
                (SELECT inserted.[PurchaseOrderID] FROM inserted);
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

ALTER TABLE Purchasing.PurchaseOrderHeader
  ADD CONSTRAINT FK_PurchaseOrderHeader_Employee_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES HumanResources.Employee (BusinessEntityID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Employee.EmployeeID.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'CONSTRAINT', N'FK_PurchaseOrderHeader_Employee_EmployeeID'
GO

ALTER TABLE Purchasing.PurchaseOrderHeader
  ADD CONSTRAINT FK_PurchaseOrderHeader_ShipMethod_ShipMethodID FOREIGN KEY (ShipMethodID) REFERENCES Purchasing.ShipMethod (ShipMethodID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing ShipMethod.ShipMethodID.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'CONSTRAINT', N'FK_PurchaseOrderHeader_ShipMethod_ShipMethodID'
GO

ALTER TABLE Purchasing.PurchaseOrderHeader
  ADD CONSTRAINT FK_PurchaseOrderHeader_Vendor_VendorID FOREIGN KEY (VendorID) REFERENCES Purchasing.Vendor (BusinessEntityID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Vendor.VendorID.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'CONSTRAINT', N'FK_PurchaseOrderHeader_Vendor_VendorID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'AFTER UPDATE trigger that updates the RevisionNumber and ModifiedDate columns in the PurchaseOrderHeader table.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'TRIGGER', N'uPurchaseOrderHeader'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'General purchase order information. See PurchaseOrderDetail.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'COLUMN', N'PurchaseOrderID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Incremental number to track changes to the purchase order over time.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'COLUMN', N'RevisionNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Order current status. 1 = Pending; 2 = Approved; 3 = Rejected; 4 = Complete', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'COLUMN', N'Status'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Employee who created the purchase order. Foreign key to Employee.BusinessEntityID.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'COLUMN', N'EmployeeID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Vendor with whom the purchase order is placed. Foreign key to Vendor.BusinessEntityID.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'COLUMN', N'VendorID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Shipping method. Foreign key to ShipMethod.ShipMethodID.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'COLUMN', N'ShipMethodID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Purchase order creation date.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'COLUMN', N'OrderDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Estimated shipment date from the vendor.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'COLUMN', N'ShipDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Purchase order subtotal. Computed as SUM(PurchaseOrderDetail.LineTotal)for the appropriate PurchaseOrderID.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'COLUMN', N'SubTotal'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Tax amount.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'COLUMN', N'TaxAmt'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Shipping cost.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'COLUMN', N'Freight'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Total due to vendor. Computed as Subtotal + TaxAmt + Freight.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'COLUMN', N'TotalDue'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'INDEX', N'IX_PurchaseOrderHeader_EmployeeID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'INDEX', N'IX_PurchaseOrderHeader_VendorID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'INDEX', N'PK_PurchaseOrderHeader_PurchaseOrderID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'CONSTRAINT', N'PK_PurchaseOrderHeader_PurchaseOrderID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [Freight] >= (0.00)', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'CONSTRAINT', N'CK_PurchaseOrderHeader_Freight'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [ShipDate] >= [OrderDate] OR [ShipDate] IS NULL', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'CONSTRAINT', N'CK_PurchaseOrderHeader_ShipDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [Status] BETWEEN (1) AND (4)', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'CONSTRAINT', N'CK_PurchaseOrderHeader_Status'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [SubTotal] >= (0.00)', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'CONSTRAINT', N'CK_PurchaseOrderHeader_SubTotal'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [TaxAmt] >= (0.00)', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'CONSTRAINT', N'CK_PurchaseOrderHeader_TaxAmt'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.0', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'CONSTRAINT', N'DF_PurchaseOrderHeader_Freight'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'CONSTRAINT', N'DF_PurchaseOrderHeader_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'CONSTRAINT', N'DF_PurchaseOrderHeader_OrderDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'CONSTRAINT', N'DF_PurchaseOrderHeader_RevisionNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 1', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'CONSTRAINT', N'DF_PurchaseOrderHeader_Status'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.0', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'CONSTRAINT', N'DF_PurchaseOrderHeader_SubTotal'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.0', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderHeader', 'CONSTRAINT', N'DF_PurchaseOrderHeader_TaxAmt'
GO
```

## <a name="#DependsOn"></a>Depends On _`6`_
- [Purchasing](../Security/Schemas/Purchasing.md)
- [HumanResources.Employee](HumanResources.Employee.md)
- [Purchasing.ShipMethod](Purchasing.ShipMethod.md)
- [Purchasing.Vendor](Purchasing.Vendor.md)
- [dbo.uspPrintError](../Programmability/Procedures/dbo.uspPrintError.md)
- [dbo.uspLogError](../Programmability/Procedures/dbo.uspLogError.md)


## <a name="#UsedBy"></a>Used By _`1`_
- [Purchasing.PurchaseOrderDetail](Purchasing.PurchaseOrderDetail.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial