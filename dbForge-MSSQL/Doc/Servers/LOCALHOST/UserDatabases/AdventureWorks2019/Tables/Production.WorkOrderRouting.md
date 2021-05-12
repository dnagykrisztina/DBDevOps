###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Production.WorkOrderRouting


# ![logo](../../../../../Images/table.svg) Production.WorkOrderRouting

## <a name="#Description"></a>Description
> Work order details.
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
|Row Count (~)|67131|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:14|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys FK_WorkOrderRouting_WorkOrder_WorkOrderID: Production.WorkOrder](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Cluster Key PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence](../../../../../Images/Cluster.svg)](#Indexes)|WorkOrderID|int|4|10|0|True||||False|False|Primary key. Foreign key to WorkOrder.WorkOrderID.|
|[![Primary Key PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence](../../../../../Images/Cluster.svg)](#Indexes)[![Indexes IX_WorkOrderRouting_ProductID](../../../../../Images/index.svg)](#Indexes)|ProductID|int|4|10|0|True||||False|False|Primary key. Foreign key to Product.ProductID.|
|[![Primary Key PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence](../../../../../Images/Cluster.svg)](#Indexes)|OperationSequence|smallint|2|5|0|True||||False|False|Primary key. Indicates the manufacturing process sequence.|
|[![Foreign Keys FK_WorkOrderRouting_Location_LocationID: Production.Location](../../../../../Images/foreignkey.svg)](#ForeignKeys)|LocationID|smallint|2|5|0|True||||False|False|Manufacturing location where the part is processed. Foreign key to Location.LocationID.|
||ScheduledStartDate|datetime|8|23|3|True||||False|False|Planned manufacturing start date.|
||ScheduledEndDate|datetime|8|23|3|True||||False|False|Planned manufacturing end date.|
||ActualStartDate|datetime|8|23|3|False||||False|False|Actual start date.|
||ActualEndDate|datetime|8|23|3|False||||False|False|Actual end date.|
|[![Check Constraint CK_WorkOrderRouting_ActualResourceHrs](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|ActualResourceHrs|decimal|5|9|4|False||||False|False|Number of manufacturing hours used.|
|[![Check Constraint CK_WorkOrderRouting_PlannedCost](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|PlannedCost|money|8|19|4|True||||False|False|Estimated manufacturing cost.|
|[![Check Constraint CK_WorkOrderRouting_ActualCost](../../../../../Images/checkconstraint.svg)](#CheckConstraints)|ActualCost|money|8|19|4|False||||False|False|Actual manufacturing cost.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||IX_WorkOrderRouting_ProductID|ProductID|False||Nonclustered index.|
|[![Primary Key PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence](../../../../../Images/Cluster.svg)](#Indexes)|PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence|WorkOrderID, ProductID, OperationSequence|True||Clustered index created by a primary key constraint.|

## <a name="#CheckConstraints"></a>Check Constraints
|Name|Columns|Condition|Description
|---|---|---|---
|CK_WorkOrderRouting_ActualCost|ActualCost|([ActualCost]>(0.00))||
|CK_WorkOrderRouting_ActualEndDate||([ActualEndDate]>=[ActualStartDate] OR [ActualEndDate] IS NULL OR [ActualStartDate] IS NULL)||
|CK_WorkOrderRouting_ActualResourceHrs|ActualResourceHrs|([ActualResourceHrs]>=(0.0000))||
|CK_WorkOrderRouting_PlannedCost|PlannedCost|([PlannedCost]>(0.00))||
|CK_WorkOrderRouting_ScheduledEndDate||([ScheduledEndDate]>=[ScheduledStartDate])||

## <a name="#ForeignKeys"></a>Foreign Keys
|Name|Columns|Description
|---|---|---
|FK_WorkOrderRouting_Location_LocationID|LocationID|Foreign key constraint referencing Location.LocationID.|
|FK_WorkOrderRouting_WorkOrder_WorkOrderID|WorkOrderID|Foreign key constraint referencing WorkOrder.WorkOrderID.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Production.WorkOrderRouting (
  WorkOrderID int NOT NULL,
  ProductID int NOT NULL,
  OperationSequence smallint NOT NULL,
  LocationID smallint NOT NULL,
  ScheduledStartDate datetime NOT NULL,
  ScheduledEndDate datetime NOT NULL,
  ActualStartDate datetime NULL,
  ActualEndDate datetime NULL,
  ActualResourceHrs decimal(9, 4) NULL,
  PlannedCost money NOT NULL,
  ActualCost money NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_WorkOrderRouting_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence PRIMARY KEY CLUSTERED (WorkOrderID, ProductID, OperationSequence),
  CONSTRAINT CK_WorkOrderRouting_ActualCost CHECK ([ActualCost]>(0.00)),
  CONSTRAINT CK_WorkOrderRouting_ActualEndDate CHECK ([ActualEndDate]>=[ActualStartDate] OR [ActualEndDate] IS NULL OR [ActualStartDate] IS NULL),
  CONSTRAINT CK_WorkOrderRouting_ActualResourceHrs CHECK ([ActualResourceHrs]>=(0.0000)),
  CONSTRAINT CK_WorkOrderRouting_PlannedCost CHECK ([PlannedCost]>(0.00)),
  CONSTRAINT CK_WorkOrderRouting_ScheduledEndDate CHECK ([ScheduledEndDate]>=[ScheduledStartDate])
)
ON [PRIMARY]
GO

CREATE INDEX IX_WorkOrderRouting_ProductID
  ON Production.WorkOrderRouting (ProductID)
  ON [PRIMARY]
GO

ALTER TABLE Production.WorkOrderRouting
  ADD CONSTRAINT FK_WorkOrderRouting_Location_LocationID FOREIGN KEY (LocationID) REFERENCES Production.Location (LocationID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Location.LocationID.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrderRouting', 'CONSTRAINT', N'FK_WorkOrderRouting_Location_LocationID'
GO

ALTER TABLE Production.WorkOrderRouting
  ADD CONSTRAINT FK_WorkOrderRouting_WorkOrder_WorkOrderID FOREIGN KEY (WorkOrderID) REFERENCES Production.WorkOrder (WorkOrderID)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing WorkOrder.WorkOrderID.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrderRouting', 'CONSTRAINT', N'FK_WorkOrderRouting_WorkOrder_WorkOrderID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Work order details.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrderRouting'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Foreign key to WorkOrder.WorkOrderID.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrderRouting', 'COLUMN', N'WorkOrderID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Foreign key to Product.ProductID.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrderRouting', 'COLUMN', N'ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Indicates the manufacturing process sequence.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrderRouting', 'COLUMN', N'OperationSequence'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Manufacturing location where the part is processed. Foreign key to Location.LocationID.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrderRouting', 'COLUMN', N'LocationID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Planned manufacturing start date.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrderRouting', 'COLUMN', N'ScheduledStartDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Planned manufacturing end date.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrderRouting', 'COLUMN', N'ScheduledEndDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Actual start date.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrderRouting', 'COLUMN', N'ActualStartDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Actual end date.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrderRouting', 'COLUMN', N'ActualEndDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Number of manufacturing hours used.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrderRouting', 'COLUMN', N'ActualResourceHrs'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Estimated manufacturing cost.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrderRouting', 'COLUMN', N'PlannedCost'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Actual manufacturing cost.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrderRouting', 'COLUMN', N'ActualCost'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrderRouting', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrderRouting', 'INDEX', N'IX_WorkOrderRouting_ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrderRouting', 'INDEX', N'PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'WorkOrderRouting', 'CONSTRAINT', N'PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [ActualCost] > (0.00)', 'SCHEMA', N'Production', 'TABLE', N'WorkOrderRouting', 'CONSTRAINT', N'CK_WorkOrderRouting_ActualCost'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [ActualEndDate] >= [ActualStartDate] OR [ActualEndDate] IS NULL OR [ActualStartDate] IS NULL', 'SCHEMA', N'Production', 'TABLE', N'WorkOrderRouting', 'CONSTRAINT', N'CK_WorkOrderRouting_ActualEndDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [ActualResourceHrs] >= (0.0000)', 'SCHEMA', N'Production', 'TABLE', N'WorkOrderRouting', 'CONSTRAINT', N'CK_WorkOrderRouting_ActualResourceHrs'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [PlannedCost] > (0.00)', 'SCHEMA', N'Production', 'TABLE', N'WorkOrderRouting', 'CONSTRAINT', N'CK_WorkOrderRouting_PlannedCost'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [ScheduledEndDate] >= [ScheduledStartDate]', 'SCHEMA', N'Production', 'TABLE', N'WorkOrderRouting', 'CONSTRAINT', N'CK_WorkOrderRouting_ScheduledEndDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'WorkOrderRouting', 'CONSTRAINT', N'DF_WorkOrderRouting_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`3`_
- [Production](../Security/Schemas/Production.md)
- [Production.Location](Production.Location.md)
- [Production.WorkOrder](Production.WorkOrder.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial