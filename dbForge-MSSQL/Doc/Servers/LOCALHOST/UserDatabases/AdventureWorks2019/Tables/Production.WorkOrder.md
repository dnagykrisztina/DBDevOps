###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Production.WorkOrder


# ![logo](../../../../../Images/table.svg) Production.WorkOrder

## <a name="#Description"></a>Description
> Manufacturing work orders.
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
|Row Count (~)|72591|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_WorkOrder_WorkOrderID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_WorkOrder_WorkOrderID](../../../../../Images/Cluster.svg)](#Indexes)|WorkOrderID|int|4|10|0|True|1 - 1|||False|False|Primary key for WorkOrder records.|
|[![Foreign Keys FK_WorkOrder_Product_ProductID: Production.Product](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes IX_WorkOrder_ProductID](../../../../../Images/index.svg)](#Indexes)|ProductID|int|4|10|0|True||||False|False|Product identification number. Foreign key to Product.ProductID.|
|[![Check Constraint CK_WorkOrder_OrderQty](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|OrderQty|int|4|10|0|True||||False|False|Product quantity to build.|
||StockedQty|int|4|10|0|True||||True|False|Quantity built and put in inventory.|
|[![Check Constraint CK_WorkOrder_ScrappedQty](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|ScrappedQty|smallint|2|5|0|True||||False|False|Quantity that failed inspection.|
||StartDate|datetime|8|23|3|True||||False|False|Work order start date.|
||EndDate|datetime|8|23|3|False||||False|False|Work order end date.|
||DueDate|datetime|8|23|3|True||||False|False|Work order due date.|
|[![Foreign Keys FK_WorkOrder_ScrapReason_ScrapReasonID: Production.ScrapReason](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes IX_WorkOrder_ScrapReasonID](../../../../../Images/index.svg)](#Indexes)|ScrapReasonID|smallint|2|5|0|False||||False|False|Reason for inspection failure.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#ComputedColumns"></a>Computed Columns
|Name|Definition
|---|---
|StockedQty|(isnull([OrderQty]-[ScrappedQty],(0)))|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||IX_WorkOrder_ProductID|ProductID|False||Nonclustered index.|
||IX_WorkOrder_ScrapReasonID|ScrapReasonID|False||Nonclustered index.|
|[![Primary Key PK_WorkOrder_WorkOrderID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_WorkOrder_WorkOrderID](../../../../../Images/Cluster.svg)](#Indexes)|PK_WorkOrder_WorkOrderID|WorkOrderID|True||Clustered index created by a primary key constraint.|

## <a name="#DmlTriggers"></a>Triggers
|Name|ANSI Nulls ON|Quoted Identifier ON|On|Not For Replication|Description
|---|---|---|---|---|---
|iWorkOrder|True|True|AFTER INSERT|False|AFTER INSERT trigger that inserts a row in the TransactionHistory table.|
|uWorkOrder|True|True|AFTER UPDATE|False|AFTER UPDATE trigger that inserts a row in the TransactionHistory table, updates ModifiedDate in the WorkOrder table.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_WorkOrder_EndDate||([EndDate]>=[StartDate] OR [EndDate] IS NULL)||
|CK_WorkOrder_OrderQty|OrderQty|([OrderQty]>(0))||
|CK_WorkOrder_ScrappedQty|ScrappedQty|([ScrappedQty]>=(0))||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_WorkOrder_Product_ProductID|ProductID|Foreign key constraint referencing Product.ProductID.|
|FK_WorkOrder_ScrapReason_ScrapReasonID|ScrapReasonID|Foreign key constraint referencing ScrapReason.ScrapReasonID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Production.WorkOrder (
  WorkOrderID int IDENTITY,
  ProductID int NOT NULL,
  OrderQty int NOT NULL,
  StockedQty AS (isnull([OrderQty]-[ScrappedQty],(0))),
  ScrappedQty smallint NOT NULL,
  StartDate datetime NOT NULL,
  EndDate datetime NULL,
  DueDate datetime NOT NULL,
  ScrapReasonID smallint NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_WorkOrder_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_WorkOrder_WorkOrderID PRIMARY KEY CLUSTERED (WorkOrderID),
  CONSTRAINT CK_WorkOrder_EndDate CHECK ([EndDate]>=[StartDate] OR [EndDate] IS NULL),
  CONSTRAINT CK_WorkOrder_OrderQty CHECK ([OrderQty]>(0)),
  CONSTRAINT CK_WorkOrder_ScrappedQty CHECK ([ScrappedQty]>=(0))
)
ON [PRIMARY]
GO

CREATE INDEX IX_WorkOrder_ProductID
  ON Production.WorkOrder (ProductID)
  ON [PRIMARY]
GO

CREATE INDEX IX_WorkOrder_ScrapReasonID
  ON Production.WorkOrder (ScrapReasonID)
  ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE OR ALTER TRIGGER Production.iWorkOrder ON Production.WorkOrder 
AFTER INSERT AS 
BEGIN
    DECLARE @Count int;

    SET @Count = @@ROWCOUNT;
    IF @Count = 0 
        RETURN;

    SET NOCOUNT ON;

    BEGIN TRY
        INSERT INTO [Production].[TransactionHistory](
            [ProductID]
            ,[ReferenceOrderID]
            ,[TransactionType]
            ,[TransactionDate]
            ,[Quantity]
            ,[ActualCost])
        SELECT 
            inserted.[ProductID]
            ,inserted.[WorkOrderID]
            ,'W'
            ,GETDATE()
            ,inserted.[OrderQty]
            ,0
        FROM inserted;
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
CREATE OR ALTER TRIGGER Production.uWorkOrder ON Production.WorkOrder 
AFTER UPDATE AS 
BEGIN
    DECLARE @Count int;

    SET @Count = @@ROWCOUNT;
    IF @Count = 0 
        RETURN;

    SET NOCOUNT ON;

    BEGIN TRY
        IF UPDATE([ProductID]) OR UPDATE([OrderQty])
        BEGIN
            INSERT INTO [Production].[TransactionHistory](
                [ProductID]
                ,[ReferenceOrderID]
                ,[TransactionType]
                ,[TransactionDate]
                ,[Quantity])
            SELECT 
                inserted.[ProductID]
                ,inserted.[WorkOrderID]
                ,'W'
                ,GETDATE()
                ,inserted.[OrderQty]
            FROM inserted;
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

ALTER TABLE Production.WorkOrder
  ADD CONSTRAINT FK_WorkOrder_Product_ProductID FOREIGN KEY (ProductID) REFERENCES Production.Product (ProductID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Product.ProductID.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder', 'CONSTRAINT', N'FK_WorkOrder_Product_ProductID'
GO

ALTER TABLE Production.WorkOrder
  ADD CONSTRAINT FK_WorkOrder_ScrapReason_ScrapReasonID FOREIGN KEY (ScrapReasonID) REFERENCES Production.ScrapReason (ScrapReasonID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing ScrapReason.ScrapReasonID.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder', 'CONSTRAINT', N'FK_WorkOrder_ScrapReason_ScrapReasonID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'AFTER INSERT trigger that inserts a row in the TransactionHistory table.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder', 'TRIGGER', N'iWorkOrder'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'AFTER UPDATE trigger that inserts a row in the TransactionHistory table, updates ModifiedDate in the WorkOrder table.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder', 'TRIGGER', N'uWorkOrder'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Manufacturing work orders.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for WorkOrder records.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder', 'COLUMN', N'WorkOrderID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product identification number. Foreign key to Product.ProductID.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder', 'COLUMN', N'ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product quantity to build.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder', 'COLUMN', N'OrderQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Quantity built and put in inventory.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder', 'COLUMN', N'StockedQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Quantity that failed inspection.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder', 'COLUMN', N'ScrappedQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Work order start date.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder', 'COLUMN', N'StartDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Work order end date.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder', 'COLUMN', N'EndDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Work order due date.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder', 'COLUMN', N'DueDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Reason for inspection failure.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder', 'COLUMN', N'ScrapReasonID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder', 'INDEX', N'IX_WorkOrder_ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder', 'INDEX', N'IX_WorkOrder_ScrapReasonID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder', 'INDEX', N'PK_WorkOrder_WorkOrderID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder', 'CONSTRAINT', N'PK_WorkOrder_WorkOrderID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [EndDate] >= [StartDate] OR [EndDate] IS NULL', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder', 'CONSTRAINT', N'CK_WorkOrder_EndDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [OrderQty] > (0)', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder', 'CONSTRAINT', N'CK_WorkOrder_OrderQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [ScrappedQty] >= (0)', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder', 'CONSTRAINT', N'CK_WorkOrder_ScrappedQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder', 'CONSTRAINT', N'DF_WorkOrder_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`6`_
- [Production](../Security/Schemas/Production.md)
- [Production.Product](Production.Product.md)
- [Production.ScrapReason](Production.ScrapReason.md)
- [Production.TransactionHistory](Production.TransactionHistory.md)
- [dbo.uspPrintError](../Programmability/Procedures/dbo.uspPrintError.md)
- [dbo.uspLogError](../Programmability/Procedures/dbo.uspLogError.md)


## <a name="#UsedBy"></a>Used By _`1`_
- [Production.WorkOrderRouting](Production.WorkOrderRouting.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial