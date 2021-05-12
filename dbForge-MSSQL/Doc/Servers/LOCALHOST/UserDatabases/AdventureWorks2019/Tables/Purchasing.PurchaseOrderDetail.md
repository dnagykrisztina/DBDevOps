###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Purchasing.PurchaseOrderDetail


# ![logo](../../../../../Images/table.svg) Purchasing.PurchaseOrderDetail

## <a name="#Description"></a>Description
> Individual products associated with a specific purchase order. See PurchaseOrderHeader.
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
|Row Count (~)|8845|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_PurchaseOrderDetail_PurchaseOrderID_PurchaseOrderDetailID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_PurchaseOrderDetail_PurchaseOrderHeader_PurchaseOrderID: Purchasing.PurchaseOrderHeader](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_PurchaseOrderDetail_PurchaseOrderID_PurchaseOrderDetailID](../../../../../Images/Cluster.svg)](#Indexes)|PurchaseOrderID|int|4|10|0|True||||False|False|Primary key. Foreign key to PurchaseOrderHeader.PurchaseOrderID.|
|[![Primary Key PK_PurchaseOrderDetail_PurchaseOrderID_PurchaseOrderDetailID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_PurchaseOrderDetail_PurchaseOrderID_PurchaseOrderDetailID](../../../../../Images/Cluster.svg)](#Indexes)|PurchaseOrderDetailID|int|4|10|0|True|1 - 1|||False|False|Primary key. One line number per purchased product.|
||DueDate|datetime|8|23|3|True||||False|False|Date the product is expected to be received.|
|[![Check Constraint CK_PurchaseOrderDetail_OrderQty](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|OrderQty|smallint|2|5|0|True||||False|False|Quantity ordered.|
|[![Foreign Keys FK_PurchaseOrderDetail_Product_ProductID: Production.Product](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes IX_PurchaseOrderDetail_ProductID](../../../../../Images/index.svg)](#Indexes)|ProductID|int|4|10|0|True||||False|False|Product identification number. Foreign key to Product.ProductID.|
|[![Check Constraint CK_PurchaseOrderDetail_UnitPrice](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|UnitPrice|money|8|19|4|True||||False|False|Vendor's selling price of a single product.|
||LineTotal|money|8|19|4|True||||True|False|Per product subtotal. Computed as OrderQty * UnitPrice.|
|[![Check Constraint CK_PurchaseOrderDetail_ReceivedQty](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|ReceivedQty|decimal|5|8|2|True||||False|False|Quantity actually received from the vendor.|
|[![Check Constraint CK_PurchaseOrderDetail_RejectedQty](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|RejectedQty|decimal|5|8|2|True||||False|False|Quantity rejected during inspection.|
||StockedQty|decimal|5|9|2|True||||True|False|Quantity accepted into inventory. Computed as ReceivedQty - RejectedQty.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#ComputedColumns"></a>Computed Columns
|Name|Definition
|---|---
|LineTotal|(isnull([OrderQty]*[UnitPrice],(0.00)))|
|StockedQty|(isnull([ReceivedQty]-[RejectedQty],(0.00)))|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||IX_PurchaseOrderDetail_ProductID|ProductID|False||Nonclustered index.|
|[![Primary Key PK_PurchaseOrderDetail_PurchaseOrderID_PurchaseOrderDetailID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_PurchaseOrderDetail_PurchaseOrderID_PurchaseOrderDetailID](../../../../../Images/Cluster.svg)](#Indexes)|PK_PurchaseOrderDetail_PurchaseOrderID_PurchaseOrderDetailID|PurchaseOrderID, PurchaseOrderDetailID|True||Clustered index created by a primary key constraint.|

## <a name="#DmlTriggers"></a>Triggers
|Name|ANSI Nulls ON|Quoted Identifier ON|On|Not For Replication|Description
|---|---|---|---|---|---
|iPurchaseOrderDetail|True|True|AFTER INSERT|False|AFTER INSERT trigger that inserts a row in the TransactionHistory table and updates the PurchaseOrderHeader.SubTotal column.|
|uPurchaseOrderDetail|True|True|AFTER UPDATE|False|AFTER UPDATE trigger that inserts a row in the TransactionHistory table, updates ModifiedDate in PurchaseOrderDetail and updates the PurchaseOrderHeader.SubTotal column.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_PurchaseOrderDetail_OrderQty|OrderQty|([OrderQty]>(0))||
|CK_PurchaseOrderDetail_ReceivedQty|ReceivedQty|([ReceivedQty]>=(0.00))||
|CK_PurchaseOrderDetail_RejectedQty|RejectedQty|([RejectedQty]>=(0.00))||
|CK_PurchaseOrderDetail_UnitPrice|UnitPrice|([UnitPrice]>=(0.00))||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_PurchaseOrderDetail_Product_ProductID|ProductID|Foreign key constraint referencing Product.ProductID.|
|FK_PurchaseOrderDetail_PurchaseOrderHeader_PurchaseOrderID|PurchaseOrderID|Foreign key constraint referencing PurchaseOrderHeader.PurchaseOrderID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Purchasing.PurchaseOrderDetail (
  PurchaseOrderID int NOT NULL,
  PurchaseOrderDetailID int IDENTITY,
  DueDate datetime NOT NULL,
  OrderQty smallint NOT NULL,
  ProductID int NOT NULL,
  UnitPrice money NOT NULL,
  LineTotal AS (isnull([OrderQty]*[UnitPrice],(0.00))),
  ReceivedQty decimal(8, 2) NOT NULL,
  RejectedQty decimal(8, 2) NOT NULL,
  StockedQty AS (isnull([ReceivedQty]-[RejectedQty],(0.00))),
  ModifiedDate datetime NOT NULL CONSTRAINT DF_PurchaseOrderDetail_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_PurchaseOrderDetail_PurchaseOrderID_PurchaseOrderDetailID PRIMARY KEY CLUSTERED (PurchaseOrderID, PurchaseOrderDetailID),
  CONSTRAINT CK_PurchaseOrderDetail_OrderQty CHECK ([OrderQty]>(0)),
  CONSTRAINT CK_PurchaseOrderDetail_ReceivedQty CHECK ([ReceivedQty]>=(0.00)),
  CONSTRAINT CK_PurchaseOrderDetail_RejectedQty CHECK ([RejectedQty]>=(0.00)),
  CONSTRAINT CK_PurchaseOrderDetail_UnitPrice CHECK ([UnitPrice]>=(0.00))
)
ON [PRIMARY]
GO

CREATE INDEX IX_PurchaseOrderDetail_ProductID
  ON Purchasing.PurchaseOrderDetail (ProductID)
  ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE OR ALTER TRIGGER Purchasing.iPurchaseOrderDetail ON Purchasing.PurchaseOrderDetail 
AFTER INSERT AS
BEGIN
    DECLARE @Count int;

    SET @Count = @@ROWCOUNT;
    IF @Count = 0 
        RETURN;

    SET NOCOUNT ON;

    BEGIN TRY
        INSERT INTO [Production].[TransactionHistory]
            ([ProductID]
            ,[ReferenceOrderID]
            ,[ReferenceOrderLineID]
            ,[TransactionType]
            ,[TransactionDate]
            ,[Quantity]
            ,[ActualCost])
        SELECT 
            inserted.[ProductID]
            ,inserted.[PurchaseOrderID]
            ,inserted.[PurchaseOrderDetailID]
            ,'P'
            ,GETDATE()
            ,inserted.[OrderQty]
            ,inserted.[UnitPrice]
        FROM inserted 
            INNER JOIN [Purchasing].[PurchaseOrderHeader] 
            ON inserted.[PurchaseOrderID] = [Purchasing].[PurchaseOrderHeader].[PurchaseOrderID];

        -- Update SubTotal in PurchaseOrderHeader record. Note that this causes the 
        -- PurchaseOrderHeader trigger to fire which will update the RevisionNumber.
        UPDATE [Purchasing].[PurchaseOrderHeader]
        SET [Purchasing].[PurchaseOrderHeader].[SubTotal] = 
            (SELECT SUM([Purchasing].[PurchaseOrderDetail].[LineTotal])
                FROM [Purchasing].[PurchaseOrderDetail]
                WHERE [Purchasing].[PurchaseOrderHeader].[PurchaseOrderID] = [Purchasing].[PurchaseOrderDetail].[PurchaseOrderID])
        WHERE [Purchasing].[PurchaseOrderHeader].[PurchaseOrderID] IN (SELECT inserted.[PurchaseOrderID] FROM inserted);
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
CREATE OR ALTER TRIGGER Purchasing.uPurchaseOrderDetail ON Purchasing.PurchaseOrderDetail 
AFTER UPDATE AS 
BEGIN
    DECLARE @Count int;

    SET @Count = @@ROWCOUNT;
    IF @Count = 0 
        RETURN;

    SET NOCOUNT ON;

    BEGIN TRY
        IF UPDATE([ProductID]) OR UPDATE([OrderQty]) OR UPDATE([UnitPrice])
        -- Insert record into TransactionHistory 
        BEGIN
            INSERT INTO [Production].[TransactionHistory]
                ([ProductID]
                ,[ReferenceOrderID]
                ,[ReferenceOrderLineID]
                ,[TransactionType]
                ,[TransactionDate]
                ,[Quantity]
                ,[ActualCost])
            SELECT 
                inserted.[ProductID]
                ,inserted.[PurchaseOrderID]
                ,inserted.[PurchaseOrderDetailID]
                ,'P'
                ,GETDATE()
                ,inserted.[OrderQty]
                ,inserted.[UnitPrice]
            FROM inserted 
                INNER JOIN [Purchasing].[PurchaseOrderDetail] 
                ON inserted.[PurchaseOrderID] = [Purchasing].[PurchaseOrderDetail].[PurchaseOrderID];

            -- Update SubTotal in PurchaseOrderHeader record. Note that this causes the 
            -- PurchaseOrderHeader trigger to fire which will update the RevisionNumber.
            UPDATE [Purchasing].[PurchaseOrderHeader]
            SET [Purchasing].[PurchaseOrderHeader].[SubTotal] = 
                (SELECT SUM([Purchasing].[PurchaseOrderDetail].[LineTotal])
                    FROM [Purchasing].[PurchaseOrderDetail]
                    WHERE [Purchasing].[PurchaseOrderHeader].[PurchaseOrderID] 
                        = [Purchasing].[PurchaseOrderDetail].[PurchaseOrderID])
            WHERE [Purchasing].[PurchaseOrderHeader].[PurchaseOrderID] 
                IN (SELECT inserted.[PurchaseOrderID] FROM inserted);

            UPDATE [Purchasing].[PurchaseOrderDetail]
            SET [Purchasing].[PurchaseOrderDetail].[ModifiedDate] = GETDATE()
            FROM inserted
            WHERE inserted.[PurchaseOrderID] = [Purchasing].[PurchaseOrderDetail].[PurchaseOrderID]
                AND inserted.[PurchaseOrderDetailID] = [Purchasing].[PurchaseOrderDetail].[PurchaseOrderDetailID];
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

ALTER TABLE Purchasing.PurchaseOrderDetail
  ADD CONSTRAINT FK_PurchaseOrderDetail_Product_ProductID FOREIGN KEY (ProductID) REFERENCES Production.Product (ProductID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Product.ProductID.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderDetail', 'CONSTRAINT', N'FK_PurchaseOrderDetail_Product_ProductID'
GO

ALTER TABLE Purchasing.PurchaseOrderDetail
  ADD CONSTRAINT FK_PurchaseOrderDetail_PurchaseOrderHeader_PurchaseOrderID FOREIGN KEY (PurchaseOrderID) REFERENCES Purchasing.PurchaseOrderHeader (PurchaseOrderID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing PurchaseOrderHeader.PurchaseOrderID.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderDetail', 'CONSTRAINT', N'FK_PurchaseOrderDetail_PurchaseOrderHeader_PurchaseOrderID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'AFTER INSERT trigger that inserts a row in the TransactionHistory table and updates the PurchaseOrderHeader.SubTotal column.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderDetail', 'TRIGGER', N'iPurchaseOrderDetail'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'AFTER UPDATE trigger that inserts a row in the TransactionHistory table, updates ModifiedDate in PurchaseOrderDetail and updates the PurchaseOrderHeader.SubTotal column.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderDetail', 'TRIGGER', N'uPurchaseOrderDetail'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Individual products associated with a specific purchase order. See PurchaseOrderHeader.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderDetail'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Foreign key to PurchaseOrderHeader.PurchaseOrderID.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderDetail', 'COLUMN', N'PurchaseOrderID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. One line number per purchased product.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderDetail', 'COLUMN', N'PurchaseOrderDetailID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date the product is expected to be received.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderDetail', 'COLUMN', N'DueDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Quantity ordered.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderDetail', 'COLUMN', N'OrderQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product identification number. Foreign key to Product.ProductID.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderDetail', 'COLUMN', N'ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Vendor''s selling price of a single product.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderDetail', 'COLUMN', N'UnitPrice'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Per product subtotal. Computed as OrderQty * UnitPrice.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderDetail', 'COLUMN', N'LineTotal'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Quantity actually received from the vendor.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderDetail', 'COLUMN', N'ReceivedQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Quantity rejected during inspection.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderDetail', 'COLUMN', N'RejectedQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Quantity accepted into inventory. Computed as ReceivedQty - RejectedQty.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderDetail', 'COLUMN', N'StockedQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderDetail', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderDetail', 'INDEX', N'IX_PurchaseOrderDetail_ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderDetail', 'INDEX', N'PK_PurchaseOrderDetail_PurchaseOrderID_PurchaseOrderDetailID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderDetail', 'CONSTRAINT', N'PK_PurchaseOrderDetail_PurchaseOrderID_PurchaseOrderDetailID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [OrderQty] > (0)', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderDetail', 'CONSTRAINT', N'CK_PurchaseOrderDetail_OrderQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [ReceivedQty] >= (0.00)', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderDetail', 'CONSTRAINT', N'CK_PurchaseOrderDetail_ReceivedQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [RejectedQty] >= (0.00)', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderDetail', 'CONSTRAINT', N'CK_PurchaseOrderDetail_RejectedQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [UnitPrice] >= (0.00)', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderDetail', 'CONSTRAINT', N'CK_PurchaseOrderDetail_UnitPrice'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Purchasing', 'TABLE', N'PurchaseOrderDetail', 'CONSTRAINT', N'DF_PurchaseOrderDetail_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`6`_
- [Purchasing](../Security/Schemas/Purchasing.md)
- [Production.Product](Production.Product.md)
- [Purchasing.PurchaseOrderHeader](Purchasing.PurchaseOrderHeader.md)
- [Production.TransactionHistory](Production.TransactionHistory.md)
- [dbo.uspPrintError](../Programmability/Procedures/dbo.uspPrintError.md)
- [dbo.uspLogError](../Programmability/Procedures/dbo.uspLogError.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial