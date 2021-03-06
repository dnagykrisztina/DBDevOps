###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Sales.SalesOrderDetail


# ![logo](../../../../../Images/table.svg) Sales.SalesOrderDetail

## <a name="#Description"></a>Description
> Individual products associated with a specific sales order. See SalesOrderHeader.
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
|Row Count (~)|121317|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID: Sales.SalesOrderHeader](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID](../../../../../Images/Cluster.svg)](#Indexes)|SalesOrderID|int|4|10|0|True||||False|False|Primary key. Foreign key to SalesOrderHeader.SalesOrderID.|
|[![Primary Key PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID](../../../../../Images/Cluster.svg)](#Indexes)|SalesOrderDetailID|int|4|10|0|True|1 - 1|||False|False|Primary key. One incremental unique number per product sold.|
||CarrierTrackingNumber|nvarchar|25|0|0|False||||False|False|Shipment tracking number supplied by the shipper.|
|[![Check Constraint CK_SalesOrderDetail_OrderQty](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|OrderQty|smallint|2|5|0|True||||False|False|Quantity ordered per product.|
|[![Foreign Keys FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID: Sales.SpecialOfferProduct](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes IX_SalesOrderDetail_ProductID](../../../../../Images/index.svg)](#Indexes)|ProductID|int|4|10|0|True||||False|False|Product sold to customer. Foreign key to Product.ProductID.|
|[![Foreign Keys FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID: Sales.SpecialOfferProduct](../../../../../Images/foreignkey.svg)](#ForeignKeys)|SpecialOfferID|int|4|10|0|True||||False|False|Promotional code. Foreign key to SpecialOffer.SpecialOfferID.|
|[![Check Constraint CK_SalesOrderDetail_UnitPrice](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|UnitPrice|money|8|19|4|True||||False|False|Selling price of a single product.|
|[![Check Constraint CK_SalesOrderDetail_UnitPriceDiscount](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|UnitPriceDiscount|money|8|19|4|True|||(0.0)|False|False|Discount amount.|
||LineTotal|numeric|17|38|6|True||||True|False|Per product subtotal. Computed as UnitPrice * (1 - UnitPriceDiscount) * OrderQty.|
|[![Indexes AK_SalesOrderDetail_rowguid](../../../../../Images/index.svg)](#Indexes)|rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#ComputedColumns"></a>Computed Columns
|Name|Definition
|---|---
|LineTotal|(isnull(([UnitPrice]*((1.0)-[UnitPriceDiscount]))*[OrderQty],(0.0)))|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_SalesOrderDetail_rowguid|rowguid|True||Unique nonclustered index. Used to support replication samples.|
||IX_SalesOrderDetail_ProductID|ProductID|False||Nonclustered index.|
|[![Primary Key PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID](../../../../../Images/Cluster.svg)](#Indexes)|PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID|SalesOrderID, SalesOrderDetailID|True||Clustered index created by a primary key constraint.|

## <a name="#DmlTriggers"></a>Triggers
|Name|ANSI Nulls ON|Quoted Identifier ON|On|Not For Replication|Description
|---|---|---|---|---|---
|iduSalesOrderDetail|True|True|AFTER INSERT, UPDATE, DELETE|False|AFTER INSERT, DELETE, UPDATE trigger that inserts a row in the TransactionHistory table, updates ModifiedDate in SalesOrderDetail and updates the SalesOrderHeader.SubTotal column.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_SalesOrderDetail_OrderQty|OrderQty|([OrderQty]>(0))||
|CK_SalesOrderDetail_UnitPrice|UnitPrice|([UnitPrice]>=(0.00))||
|CK_SalesOrderDetail_UnitPriceDiscount|UnitPriceDiscount|([UnitPriceDiscount]>=(0.00))||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID|SalesOrderID|Foreign key constraint referencing SalesOrderHeader.PurchaseOrderID.|
|FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID|SpecialOfferID, ProductID|Foreign key constraint referencing SpecialOfferProduct.SpecialOfferIDProductID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Sales.SalesOrderDetail (
  SalesOrderID int NOT NULL,
  SalesOrderDetailID int IDENTITY,
  CarrierTrackingNumber nvarchar(25) NULL,
  OrderQty smallint NOT NULL,
  ProductID int NOT NULL,
  SpecialOfferID int NOT NULL,
  UnitPrice money NOT NULL,
  UnitPriceDiscount money NOT NULL CONSTRAINT DF_SalesOrderDetail_UnitPriceDiscount DEFAULT (0.0),
  LineTotal AS (isnull(([UnitPrice]*((1.0)-[UnitPriceDiscount]))*[OrderQty],(0.0))),
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_SalesOrderDetail_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_SalesOrderDetail_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID PRIMARY KEY CLUSTERED (SalesOrderID, SalesOrderDetailID),
  CONSTRAINT CK_SalesOrderDetail_OrderQty CHECK ([OrderQty]>(0)),
  CONSTRAINT CK_SalesOrderDetail_UnitPrice CHECK ([UnitPrice]>=(0.00)),
  CONSTRAINT CK_SalesOrderDetail_UnitPriceDiscount CHECK ([UnitPriceDiscount]>=(0.00))
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_SalesOrderDetail_rowguid
  ON Sales.SalesOrderDetail (rowguid)
  ON [PRIMARY]
GO

CREATE INDEX IX_SalesOrderDetail_ProductID
  ON Sales.SalesOrderDetail (ProductID)
  ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE OR ALTER TRIGGER Sales.iduSalesOrderDetail ON Sales.SalesOrderDetail 
AFTER INSERT, DELETE, UPDATE AS 
BEGIN
    DECLARE @Count int;

    SET @Count = @@ROWCOUNT;
    IF @Count = 0 
        RETURN;

    SET NOCOUNT ON;

    BEGIN TRY
        -- If inserting or updating these columns
        IF UPDATE([ProductID]) OR UPDATE([OrderQty]) OR UPDATE([UnitPrice]) OR UPDATE([UnitPriceDiscount]) 
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
                ,inserted.[SalesOrderID]
                ,inserted.[SalesOrderDetailID]
                ,'S'
                ,GETDATE()
                ,inserted.[OrderQty]
                ,inserted.[UnitPrice]
            FROM inserted 
                INNER JOIN [Sales].[SalesOrderHeader] 
                ON inserted.[SalesOrderID] = [Sales].[SalesOrderHeader].[SalesOrderID];

            UPDATE [Person].[Person] 
            SET [Demographics].modify('declare default element namespace 
                "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
                replace value of (/IndividualSurvey/TotalPurchaseYTD)[1] 
                with data(/IndividualSurvey/TotalPurchaseYTD)[1] + sql:column ("inserted.LineTotal")') 
            FROM inserted 
                INNER JOIN [Sales].[SalesOrderHeader] AS SOH
                ON inserted.[SalesOrderID] = SOH.[SalesOrderID] 
                INNER JOIN [Sales].[Customer] AS C
                ON SOH.[CustomerID] = C.[CustomerID]
            WHERE C.[PersonID] = [Person].[Person].[BusinessEntityID];
        END;

        -- Update SubTotal in SalesOrderHeader record. Note that this causes the 
        -- SalesOrderHeader trigger to fire which will update the RevisionNumber.
        UPDATE [Sales].[SalesOrderHeader]
        SET [Sales].[SalesOrderHeader].[SubTotal] = 
            (SELECT SUM([Sales].[SalesOrderDetail].[LineTotal])
                FROM [Sales].[SalesOrderDetail]
                WHERE [Sales].[SalesOrderHeader].[SalesOrderID] = [Sales].[SalesOrderDetail].[SalesOrderID])
        WHERE [Sales].[SalesOrderHeader].[SalesOrderID] IN (SELECT inserted.[SalesOrderID] FROM inserted);

        UPDATE [Person].[Person] 
        SET [Demographics].modify('declare default element namespace 
            "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
            replace value of (/IndividualSurvey/TotalPurchaseYTD)[1] 
            with data(/IndividualSurvey/TotalPurchaseYTD)[1] - sql:column("deleted.LineTotal")') 
        FROM deleted 
            INNER JOIN [Sales].[SalesOrderHeader] 
            ON deleted.[SalesOrderID] = [Sales].[SalesOrderHeader].[SalesOrderID] 
            INNER JOIN [Sales].[Customer]
            ON [Sales].[Customer].[CustomerID] = [Sales].[SalesOrderHeader].[CustomerID]
        WHERE [Sales].[Customer].[PersonID] = [Person].[Person].[BusinessEntityID];
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

ALTER TABLE Sales.SalesOrderDetail
  ADD CONSTRAINT FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID FOREIGN KEY (SalesOrderID) REFERENCES Sales.SalesOrderHeader (SalesOrderID) ON DELETE CASCADE
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing SalesOrderHeader.PurchaseOrderID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderDetail', 'CONSTRAINT', N'FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID'
GO

ALTER TABLE Sales.SalesOrderDetail
  ADD CONSTRAINT FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID FOREIGN KEY (SpecialOfferID, ProductID) REFERENCES Sales.SpecialOfferProduct (SpecialOfferID, ProductID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing SpecialOfferProduct.SpecialOfferIDProductID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderDetail', 'CONSTRAINT', N'FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'AFTER INSERT, DELETE, UPDATE trigger that inserts a row in the TransactionHistory table, updates ModifiedDate in SalesOrderDetail and updates the SalesOrderHeader.SubTotal column.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderDetail', 'TRIGGER', N'iduSalesOrderDetail'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Individual products associated with a specific sales order. See SalesOrderHeader.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderDetail'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Foreign key to SalesOrderHeader.SalesOrderID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderDetail', 'COLUMN', N'SalesOrderID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. One incremental unique number per product sold.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderDetail', 'COLUMN', N'SalesOrderDetailID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Shipment tracking number supplied by the shipper.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderDetail', 'COLUMN', N'CarrierTrackingNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Quantity ordered per product.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderDetail', 'COLUMN', N'OrderQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product sold to customer. Foreign key to Product.ProductID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderDetail', 'COLUMN', N'ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Promotional code. Foreign key to SpecialOffer.SpecialOfferID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderDetail', 'COLUMN', N'SpecialOfferID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Selling price of a single product.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderDetail', 'COLUMN', N'UnitPrice'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Discount amount.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderDetail', 'COLUMN', N'UnitPriceDiscount'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Per product subtotal. Computed as UnitPrice * (1 - UnitPriceDiscount) * OrderQty.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderDetail', 'COLUMN', N'LineTotal'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderDetail', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderDetail', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderDetail', 'INDEX', N'AK_SalesOrderDetail_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderDetail', 'INDEX', N'IX_SalesOrderDetail_ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderDetail', 'INDEX', N'PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderDetail', 'CONSTRAINT', N'PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [OrderQty] > (0)', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderDetail', 'CONSTRAINT', N'CK_SalesOrderDetail_OrderQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [UnitPrice] >= (0.00)', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderDetail', 'CONSTRAINT', N'CK_SalesOrderDetail_UnitPrice'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [UnitPriceDiscount] >= (0.00)', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderDetail', 'CONSTRAINT', N'CK_SalesOrderDetail_UnitPriceDiscount'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderDetail', 'CONSTRAINT', N'DF_SalesOrderDetail_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderDetail', 'CONSTRAINT', N'DF_SalesOrderDetail_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.0', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderDetail', 'CONSTRAINT', N'DF_SalesOrderDetail_UnitPriceDiscount'
GO
```

## <a name="#DependsOn"></a>Depends On _`8`_
- [Sales](../Security/Schemas/Sales.md)
- [Sales.SalesOrderHeader](Sales.SalesOrderHeader.md)
- [Sales.SpecialOfferProduct](Sales.SpecialOfferProduct.md)
- [Production.TransactionHistory](Production.TransactionHistory.md)
- [Person.Person](Person.Person.md)
- [Sales.Customer](Sales.Customer.md)
- [dbo.uspPrintError](../Programmability/Procedures/dbo.uspPrintError.md)
- [dbo.uspLogError](../Programmability/Procedures/dbo.uspLogError.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright ?? All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial