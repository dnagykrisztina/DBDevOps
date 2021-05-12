###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Sales.SalesOrderHeader


# ![logo](../../../../../Images/table.svg) Sales.SalesOrderHeader

## <a name="#Description"></a>Description
> General sales order information.
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
|Row Count (~)|31465|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_SalesOrderHeader_SalesOrderID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_SalesOrderHeader_SalesOrderID](../../../../../Images/Cluster.svg)](#Indexes)|SalesOrderID|int|4|10|0|True|1 - 1|||False|False|Primary key.|
||RevisionNumber|tinyint|1|3|0|True|||(0)|False|False|Incremental number to track changes to the sales order over time.|
||OrderDate|datetime|8|23|3|True|||(getdate())|False|False|Dates the sales order was created.|
||DueDate|datetime|8|23|3|True||||False|False|Date the order is due to the customer.|
||ShipDate|datetime|8|23|3|False||||False|False|Date the order was shipped to the customer.|
|[![Check Constraint CK_SalesOrderHeader_Status](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|Status|tinyint|1|3|0|True|||(1)|False|False|Order current status. 1 = In process; 2 = Approved; 3 = Backordered; 4 = Rejected; 5 = Shipped; 6 = Cancelled|
||OnlineOrderFlag|[dbo.Flag](../Programmability/Types/UserDefinedDataTypes/dbo.Flag.md)|1|1|0|True|||(1)|False|False|0 = Order placed by sales person. 1 = Order placed online by customer.|
|[![Indexes AK_SalesOrderHeader_SalesOrderNumber](../../../../../Images/index.svg)](#Indexes)|SalesOrderNumber|nvarchar|25|0|0|True||||True|False|Unique sales order identification number.|
||PurchaseOrderNumber|[dbo.OrderNumber](../Programmability/Types/UserDefinedDataTypes/dbo.OrderNumber.md)|25|0|0|False||||False|False|Customer purchase order number reference. |
||AccountNumber|[dbo.AccountNumber](../Programmability/Types/UserDefinedDataTypes/dbo.AccountNumber.md)|15|0|0|False||||False|False|Financial accounting number reference.|
|[![Foreign Keys FK_SalesOrderHeader_Customer_CustomerID: Sales.Customer](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes IX_SalesOrderHeader_CustomerID](../../../../../Images/index.svg)](#Indexes)|CustomerID|int|4|10|0|True||||False|False|Customer identification number. Foreign key to Customer.BusinessEntityID.|
|[![Foreign Keys FK_SalesOrderHeader_SalesPerson_SalesPersonID: Sales.SalesPerson](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes IX_SalesOrderHeader_SalesPersonID](../../../../../Images/index.svg)](#Indexes)|SalesPersonID|int|4|10|0|False||||False|False|Sales person who created the sales order. Foreign key to SalesPerson.BusinessEntityID.|
|[![Foreign Keys FK_SalesOrderHeader_SalesTerritory_TerritoryID: Sales.SalesTerritory](../../../../../Images/foreignkey.svg)](#ForeignKeys)|TerritoryID|int|4|10|0|False||||False|False|Territory in which the sale was made. Foreign key to SalesTerritory.SalesTerritoryID.|
|[![Foreign Keys FK_SalesOrderHeader_Address_BillToAddressID: Person.Address](../../../../../Images/foreignkey.svg)](#ForeignKeys)|BillToAddressID|int|4|10|0|True||||False|False|Customer billing address. Foreign key to Address.AddressID.|
|[![Foreign Keys FK_SalesOrderHeader_Address_ShipToAddressID: Person.Address](../../../../../Images/foreignkey.svg)](#ForeignKeys)|ShipToAddressID|int|4|10|0|True||||False|False|Customer shipping address. Foreign key to Address.AddressID.|
|[![Foreign Keys FK_SalesOrderHeader_ShipMethod_ShipMethodID: Purchasing.ShipMethod](../../../../../Images/foreignkey.svg)](#ForeignKeys)|ShipMethodID|int|4|10|0|True||||False|False|Shipping method. Foreign key to ShipMethod.ShipMethodID.|
|[![Foreign Keys FK_SalesOrderHeader_CreditCard_CreditCardID: Sales.CreditCard](../../../../../Images/foreignkey.svg)](#ForeignKeys)|CreditCardID|int|4|10|0|False||||False|False|Credit card identification number. Foreign key to CreditCard.CreditCardID.|
||CreditCardApprovalCode|varchar|15|0|0|False||||False|False|Approval code provided by the credit card company.|
|[![Foreign Keys FK_SalesOrderHeader_CurrencyRate_CurrencyRateID: Sales.CurrencyRate](../../../../../Images/foreignkey.svg)](#ForeignKeys)|CurrencyRateID|int|4|10|0|False||||False|False|Currency exchange rate used. Foreign key to CurrencyRate.CurrencyRateID.|
|[![Check Constraint CK_SalesOrderHeader_SubTotal](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|SubTotal|money|8|19|4|True|||(0.00)|False|False|Sales subtotal. Computed as SUM(SalesOrderDetail.LineTotal)for the appropriate SalesOrderID.|
|[![Check Constraint CK_SalesOrderHeader_TaxAmt](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|TaxAmt|money|8|19|4|True|||(0.00)|False|False|Tax amount.|
|[![Check Constraint CK_SalesOrderHeader_Freight](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|Freight|money|8|19|4|True|||(0.00)|False|False|Shipping cost.|
||TotalDue|money|8|19|4|True||||True|False|Total due from customer. Computed as Subtotal + TaxAmt + Freight.|
||Comment|nvarchar|128|0|0|False||||False|False|Sales representative comments.|
|[![Indexes AK_SalesOrderHeader_rowguid](../../../../../Images/index.svg)](#Indexes)|rowguid|uniqueidentifier|16|0|0|True|||(newid())|False|False|ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#ComputedColumns"></a>Computed Columns
|Name|Definition
|---|---
|SalesOrderNumber|(isnull(N'SO'+CONVERT([nvarchar](23),[SalesOrderID]),N'*** ERROR ***'))|
|TotalDue|(isnull(([SubTotal]+[TaxAmt])+[Freight],(0)))|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_SalesOrderHeader_rowguid|rowguid|True||Unique nonclustered index. Used to support replication samples.|
||AK_SalesOrderHeader_SalesOrderNumber|SalesOrderNumber|True||Unique nonclustered index.|
||IX_SalesOrderHeader_CustomerID|CustomerID|False||Nonclustered index.|
||IX_SalesOrderHeader_SalesPersonID|SalesPersonID|False||Nonclustered index.|
|[![Primary Key PK_SalesOrderHeader_SalesOrderID](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_SalesOrderHeader_SalesOrderID](../../../../../Images/Cluster.svg)](#Indexes)|PK_SalesOrderHeader_SalesOrderID|SalesOrderID|True||Clustered index created by a primary key constraint.|

## <a name="#DmlTriggers"></a>Triggers
|Name|ANSI Nulls ON|Quoted Identifier ON|On|Not For Replication|Description
|---|---|---|---|---|---
|uSalesOrderHeader|True|True|AFTER UPDATE|True|AFTER UPDATE trigger that updates the RevisionNumber and ModifiedDate columns in the SalesOrderHeader table.Updates the SalesYTD column in the SalesPerson and SalesTerritory tables.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_SalesOrderHeader_DueDate||([DueDate]>=[OrderDate])||
|CK_SalesOrderHeader_Freight|Freight|([Freight]>=(0.00))||
|CK_SalesOrderHeader_ShipDate||([ShipDate]>=[OrderDate] OR [ShipDate] IS NULL)||
|CK_SalesOrderHeader_Status|Status|([Status]>=(0) AND [Status]<=(8))||
|CK_SalesOrderHeader_SubTotal|SubTotal|([SubTotal]>=(0.00))||
|CK_SalesOrderHeader_TaxAmt|TaxAmt|([TaxAmt]>=(0.00))||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_SalesOrderHeader_Address_BillToAddressID|AddressID|Foreign key constraint referencing Address.AddressID.|
|FK_SalesOrderHeader_Address_ShipToAddressID|AddressID|Foreign key constraint referencing Address.AddressID.|
|FK_SalesOrderHeader_CreditCard_CreditCardID|CreditCardID|Foreign key constraint referencing CreditCard.CreditCardID.|
|FK_SalesOrderHeader_CurrencyRate_CurrencyRateID|CurrencyRateID|Foreign key constraint referencing CurrencyRate.CurrencyRateID.|
|FK_SalesOrderHeader_Customer_CustomerID|CustomerID|Foreign key constraint referencing Customer.CustomerID.|
|FK_SalesOrderHeader_SalesPerson_SalesPersonID|BusinessEntityID|Foreign key constraint referencing SalesPerson.SalesPersonID.|
|FK_SalesOrderHeader_SalesTerritory_TerritoryID|TerritoryID|Foreign key constraint referencing SalesTerritory.TerritoryID.|
|FK_SalesOrderHeader_ShipMethod_ShipMethodID|ShipMethodID|Foreign key constraint referencing ShipMethod.ShipMethodID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Sales.SalesOrderHeader (
  SalesOrderID int IDENTITY NOT FOR REPLICATION,
  RevisionNumber tinyint NOT NULL CONSTRAINT DF_SalesOrderHeader_RevisionNumber DEFAULT (0),
  OrderDate datetime NOT NULL CONSTRAINT DF_SalesOrderHeader_OrderDate DEFAULT (getdate()),
  DueDate datetime NOT NULL,
  ShipDate datetime NULL,
  Status tinyint NOT NULL CONSTRAINT DF_SalesOrderHeader_Status DEFAULT (1),
  OnlineOrderFlag dbo.Flag NOT NULL CONSTRAINT DF_SalesOrderHeader_OnlineOrderFlag DEFAULT (1),
  SalesOrderNumber AS (isnull(N'SO'+CONVERT([nvarchar](23),[SalesOrderID]),N'*** ERROR ***')),
  PurchaseOrderNumber dbo.OrderNumber NULL,
  AccountNumber dbo.AccountNumber NULL,
  CustomerID int NOT NULL,
  SalesPersonID int NULL,
  TerritoryID int NULL,
  BillToAddressID int NOT NULL,
  ShipToAddressID int NOT NULL,
  ShipMethodID int NOT NULL,
  CreditCardID int NULL,
  CreditCardApprovalCode varchar(15) NULL,
  CurrencyRateID int NULL,
  SubTotal money NOT NULL CONSTRAINT DF_SalesOrderHeader_SubTotal DEFAULT (0.00),
  TaxAmt money NOT NULL CONSTRAINT DF_SalesOrderHeader_TaxAmt DEFAULT (0.00),
  Freight money NOT NULL CONSTRAINT DF_SalesOrderHeader_Freight DEFAULT (0.00),
  TotalDue AS (isnull(([SubTotal]+[TaxAmt])+[Freight],(0))),
  Comment nvarchar(128) NULL,
  rowguid uniqueidentifier NOT NULL CONSTRAINT DF_SalesOrderHeader_rowguid DEFAULT (newid()) ROWGUIDCOL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_SalesOrderHeader_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_SalesOrderHeader_SalesOrderID PRIMARY KEY CLUSTERED (SalesOrderID),
  CONSTRAINT CK_SalesOrderHeader_DueDate CHECK ([DueDate]>=[OrderDate]),
  CONSTRAINT CK_SalesOrderHeader_Freight CHECK ([Freight]>=(0.00)),
  CONSTRAINT CK_SalesOrderHeader_ShipDate CHECK ([ShipDate]>=[OrderDate] OR [ShipDate] IS NULL),
  CONSTRAINT CK_SalesOrderHeader_Status CHECK ([Status]>=(0) AND [Status]<=(8)),
  CONSTRAINT CK_SalesOrderHeader_SubTotal CHECK ([SubTotal]>=(0.00)),
  CONSTRAINT CK_SalesOrderHeader_TaxAmt CHECK ([TaxAmt]>=(0.00))
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_SalesOrderHeader_rowguid
  ON Sales.SalesOrderHeader (rowguid)
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_SalesOrderHeader_SalesOrderNumber
  ON Sales.SalesOrderHeader (SalesOrderNumber)
  ON [PRIMARY]
GO

CREATE INDEX IX_SalesOrderHeader_CustomerID
  ON Sales.SalesOrderHeader (CustomerID)
  ON [PRIMARY]
GO

CREATE INDEX IX_SalesOrderHeader_SalesPersonID
  ON Sales.SalesOrderHeader (SalesPersonID)
  ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE OR ALTER TRIGGER Sales.uSalesOrderHeader ON Sales.SalesOrderHeader 
AFTER UPDATE NOT FOR REPLICATION AS 
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
            UPDATE [Sales].[SalesOrderHeader]
            SET [Sales].[SalesOrderHeader].[RevisionNumber] = 
                [Sales].[SalesOrderHeader].[RevisionNumber] + 1
            WHERE [Sales].[SalesOrderHeader].[SalesOrderID] IN 
                (SELECT inserted.[SalesOrderID] FROM inserted);
        END;

        -- Update the SalesPerson SalesYTD when SubTotal is updated
        IF UPDATE([SubTotal])
        BEGIN
            DECLARE @StartDate datetime,
                    @EndDate datetime

            SET @StartDate = [dbo].[ufnGetAccountingStartDate]();
            SET @EndDate = [dbo].[ufnGetAccountingEndDate]();

            UPDATE [Sales].[SalesPerson]
            SET [Sales].[SalesPerson].[SalesYTD] = 
                (SELECT SUM([Sales].[SalesOrderHeader].[SubTotal])
                FROM [Sales].[SalesOrderHeader] 
                WHERE [Sales].[SalesPerson].[BusinessEntityID] = [Sales].[SalesOrderHeader].[SalesPersonID]
                    AND ([Sales].[SalesOrderHeader].[Status] = 5) -- Shipped
                    AND [Sales].[SalesOrderHeader].[OrderDate] BETWEEN @StartDate AND @EndDate)
            WHERE [Sales].[SalesPerson].[BusinessEntityID] 
                IN (SELECT DISTINCT inserted.[SalesPersonID] FROM inserted 
                    WHERE inserted.[OrderDate] BETWEEN @StartDate AND @EndDate);

            -- Update the SalesTerritory SalesYTD when SubTotal is updated
            UPDATE [Sales].[SalesTerritory]
            SET [Sales].[SalesTerritory].[SalesYTD] = 
                (SELECT SUM([Sales].[SalesOrderHeader].[SubTotal])
                FROM [Sales].[SalesOrderHeader] 
                WHERE [Sales].[SalesTerritory].[TerritoryID] = [Sales].[SalesOrderHeader].[TerritoryID]
                    AND ([Sales].[SalesOrderHeader].[Status] = 5) -- Shipped
                    AND [Sales].[SalesOrderHeader].[OrderDate] BETWEEN @StartDate AND @EndDate)
            WHERE [Sales].[SalesTerritory].[TerritoryID] 
                IN (SELECT DISTINCT inserted.[TerritoryID] FROM inserted 
                    WHERE inserted.[OrderDate] BETWEEN @StartDate AND @EndDate);
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

ALTER TABLE Sales.SalesOrderHeader
  ADD CONSTRAINT FK_SalesOrderHeader_Address_BillToAddressID FOREIGN KEY (BillToAddressID) REFERENCES Person.Address (AddressID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Address.AddressID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'CONSTRAINT', N'FK_SalesOrderHeader_Address_BillToAddressID'
GO

ALTER TABLE Sales.SalesOrderHeader
  ADD CONSTRAINT FK_SalesOrderHeader_Address_ShipToAddressID FOREIGN KEY (ShipToAddressID) REFERENCES Person.Address (AddressID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Address.AddressID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'CONSTRAINT', N'FK_SalesOrderHeader_Address_ShipToAddressID'
GO

ALTER TABLE Sales.SalesOrderHeader
  ADD CONSTRAINT FK_SalesOrderHeader_CreditCard_CreditCardID FOREIGN KEY (CreditCardID) REFERENCES Sales.CreditCard (CreditCardID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing CreditCard.CreditCardID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'CONSTRAINT', N'FK_SalesOrderHeader_CreditCard_CreditCardID'
GO

ALTER TABLE Sales.SalesOrderHeader
  ADD CONSTRAINT FK_SalesOrderHeader_CurrencyRate_CurrencyRateID FOREIGN KEY (CurrencyRateID) REFERENCES Sales.CurrencyRate (CurrencyRateID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing CurrencyRate.CurrencyRateID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'CONSTRAINT', N'FK_SalesOrderHeader_CurrencyRate_CurrencyRateID'
GO

ALTER TABLE Sales.SalesOrderHeader
  ADD CONSTRAINT FK_SalesOrderHeader_Customer_CustomerID FOREIGN KEY (CustomerID) REFERENCES Sales.Customer (CustomerID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Customer.CustomerID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'CONSTRAINT', N'FK_SalesOrderHeader_Customer_CustomerID'
GO

ALTER TABLE Sales.SalesOrderHeader
  ADD CONSTRAINT FK_SalesOrderHeader_SalesPerson_SalesPersonID FOREIGN KEY (SalesPersonID) REFERENCES Sales.SalesPerson (BusinessEntityID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing SalesPerson.SalesPersonID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'CONSTRAINT', N'FK_SalesOrderHeader_SalesPerson_SalesPersonID'
GO

ALTER TABLE Sales.SalesOrderHeader
  ADD CONSTRAINT FK_SalesOrderHeader_SalesTerritory_TerritoryID FOREIGN KEY (TerritoryID) REFERENCES Sales.SalesTerritory (TerritoryID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing SalesTerritory.TerritoryID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'CONSTRAINT', N'FK_SalesOrderHeader_SalesTerritory_TerritoryID'
GO

ALTER TABLE Sales.SalesOrderHeader
  ADD CONSTRAINT FK_SalesOrderHeader_ShipMethod_ShipMethodID FOREIGN KEY (ShipMethodID) REFERENCES Purchasing.ShipMethod (ShipMethodID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing ShipMethod.ShipMethodID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'CONSTRAINT', N'FK_SalesOrderHeader_ShipMethod_ShipMethodID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'AFTER UPDATE trigger that updates the RevisionNumber and ModifiedDate columns in the SalesOrderHeader table.Updates the SalesYTD column in the SalesPerson and SalesTerritory tables.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'TRIGGER', N'uSalesOrderHeader'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'General sales order information.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'COLUMN', N'SalesOrderID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Incremental number to track changes to the sales order over time.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'COLUMN', N'RevisionNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Dates the sales order was created.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'COLUMN', N'OrderDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date the order is due to the customer.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'COLUMN', N'DueDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date the order was shipped to the customer.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'COLUMN', N'ShipDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Order current status. 1 = In process; 2 = Approved; 3 = Backordered; 4 = Rejected; 5 = Shipped; 6 = Cancelled', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'COLUMN', N'Status'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'0 = Order placed by sales person. 1 = Order placed online by customer.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'COLUMN', N'OnlineOrderFlag'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique sales order identification number.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'COLUMN', N'SalesOrderNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Customer purchase order number reference. ', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'COLUMN', N'PurchaseOrderNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Financial accounting number reference.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'COLUMN', N'AccountNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Customer identification number. Foreign key to Customer.BusinessEntityID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'COLUMN', N'CustomerID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Sales person who created the sales order. Foreign key to SalesPerson.BusinessEntityID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'COLUMN', N'SalesPersonID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Territory in which the sale was made. Foreign key to SalesTerritory.SalesTerritoryID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'COLUMN', N'TerritoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Customer billing address. Foreign key to Address.AddressID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'COLUMN', N'BillToAddressID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Customer shipping address. Foreign key to Address.AddressID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'COLUMN', N'ShipToAddressID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Shipping method. Foreign key to ShipMethod.ShipMethodID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'COLUMN', N'ShipMethodID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Credit card identification number. Foreign key to CreditCard.CreditCardID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'COLUMN', N'CreditCardID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Approval code provided by the credit card company.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'COLUMN', N'CreditCardApprovalCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Currency exchange rate used. Foreign key to CurrencyRate.CurrencyRateID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'COLUMN', N'CurrencyRateID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Sales subtotal. Computed as SUM(SalesOrderDetail.LineTotal)for the appropriate SalesOrderID.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'COLUMN', N'SubTotal'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Tax amount.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'COLUMN', N'TaxAmt'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Shipping cost.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'COLUMN', N'Freight'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Total due from customer. Computed as Subtotal + TaxAmt + Freight.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'COLUMN', N'TotalDue'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Sales representative comments.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'COLUMN', N'Comment'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'INDEX', N'AK_SalesOrderHeader_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'INDEX', N'AK_SalesOrderHeader_SalesOrderNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'INDEX', N'IX_SalesOrderHeader_CustomerID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'INDEX', N'IX_SalesOrderHeader_SalesPersonID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'INDEX', N'PK_SalesOrderHeader_SalesOrderID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'CONSTRAINT', N'PK_SalesOrderHeader_SalesOrderID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [DueDate] >= [OrderDate]', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'CONSTRAINT', N'CK_SalesOrderHeader_DueDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [Freight] >= (0.00)', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'CONSTRAINT', N'CK_SalesOrderHeader_Freight'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [ShipDate] >= [OrderDate] OR [ShipDate] IS NULL', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'CONSTRAINT', N'CK_SalesOrderHeader_ShipDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [Status] BETWEEN (0) AND (8)', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'CONSTRAINT', N'CK_SalesOrderHeader_Status'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [SubTotal] >= (0.00)', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'CONSTRAINT', N'CK_SalesOrderHeader_SubTotal'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [TaxAmt] >= (0.00)', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'CONSTRAINT', N'CK_SalesOrderHeader_TaxAmt'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.0', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'CONSTRAINT', N'DF_SalesOrderHeader_Freight'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'CONSTRAINT', N'DF_SalesOrderHeader_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 1 (TRUE)', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'CONSTRAINT', N'DF_SalesOrderHeader_OnlineOrderFlag'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'CONSTRAINT', N'DF_SalesOrderHeader_OrderDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'CONSTRAINT', N'DF_SalesOrderHeader_RevisionNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'CONSTRAINT', N'DF_SalesOrderHeader_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 1', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'CONSTRAINT', N'DF_SalesOrderHeader_Status'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.0', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'CONSTRAINT', N'DF_SalesOrderHeader_SubTotal'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.0', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrderHeader', 'CONSTRAINT', N'DF_SalesOrderHeader_TaxAmt'
GO
```

## <a name="#DependsOn"></a>Depends On _`15`_
- [Sales](../Security/Schemas/Sales.md)
- [Person.Address](Person.Address.md)
- [Purchasing.ShipMethod](Purchasing.ShipMethod.md)
- [Sales.CreditCard](Sales.CreditCard.md)
- [Sales.CurrencyRate](Sales.CurrencyRate.md)
- [Sales.Customer](Sales.Customer.md)
- [Sales.SalesPerson](Sales.SalesPerson.md)
- [Sales.SalesTerritory](Sales.SalesTerritory.md)
- [dbo.Flag](../Programmability/Types/UserDefinedDataTypes/dbo.Flag.md)
- [dbo.OrderNumber](../Programmability/Types/UserDefinedDataTypes/dbo.OrderNumber.md)
- [dbo.AccountNumber](../Programmability/Types/UserDefinedDataTypes/dbo.AccountNumber.md)
- [dbo.ufnGetAccountingStartDate](../Programmability/Functions/ScalarValuedFunctions/dbo.ufnGetAccountingStartDate.md)
- [dbo.ufnGetAccountingEndDate](../Programmability/Functions/ScalarValuedFunctions/dbo.ufnGetAccountingEndDate.md)
- [dbo.uspPrintError](../Programmability/Procedures/dbo.uspPrintError.md)
- [dbo.uspLogError](../Programmability/Procedures/dbo.uspLogError.md)


## <a name="#UsedBy"></a>Used By _`3`_
- [Sales.SalesOrderDetail](Sales.SalesOrderDetail.md)
- [Sales.SalesOrderHeaderSalesReason](Sales.SalesOrderHeaderSalesReason.md)
- [Sales.vSalesPersonSalesByFiscalYears](../Views/Sales.vSalesPersonSalesByFiscalYears.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial