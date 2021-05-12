###### DBDevOps
___
[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[LOCALHOST](../../../LOCALHOST.md)>[User databases](../../UserDatabases.md)>[AdventureWorks2019](../AdventureWorks2019.md)>[Tables](Tables.md)>Person.CountryRegion


# ![logo](../../../../../Images/table.svg) Person.CountryRegion

## <a name="#Description"></a>Description
> Lookup table containing the ISO standard codes for countries and regions.
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
|Row Count (~)|238|
|Created|2017. 10. 27. 14:33:01|
|Last Modified|2017. 10. 27. 14:33:15|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Not Null|Identity|Rule|Default|Computed|Persisted|Description
|---|---|---|---|---|---|---|---|---|---|---|---|---
|[![Primary Key PK_CountryRegion_CountryRegionCode](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_CountryRegion_CountryRegionCode](../../../../../Images/Cluster.svg)](#Indexes)|CountryRegionCode|nvarchar|3|0|0|True||||False|False|ISO standard code for countries and regions.|
|[![Indexes AK_CountryRegion_Name](../../../../../Images/index.svg)](#Indexes)|Name|[dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)|50|0|0|True||||False|False|Country or region name.|
||ModifiedDate|datetime|8|23|3|True|||(getdate())|False|False|Date and time the record was last updated.|

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Description
|---|---|---|---|---|---
||AK_CountryRegion_Name|Name|True||Unique nonclustered index.|
|[![Primary Key PK_CountryRegion_CountryRegionCode](../../../../../Images/primarykey.svg)](#Indexes)[![Cluster Key PK_CountryRegion_CountryRegionCode](../../../../../Images/Cluster.svg)](#Indexes)|PK_CountryRegion_CountryRegionCode|CountryRegionCode|True||Clustered index created by a primary key constraint.|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE Person.CountryRegion (
  CountryRegionCode nvarchar(3) NOT NULL,
  Name dbo.Name NOT NULL,
  ModifiedDate datetime NOT NULL CONSTRAINT DF_CountryRegion_ModifiedDate DEFAULT (getdate()),
  CONSTRAINT PK_CountryRegion_CountryRegionCode PRIMARY KEY CLUSTERED (CountryRegionCode)
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX AK_CountryRegion_Name
  ON Person.CountryRegion (Name)
  ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Lookup table containing the ISO standard codes for countries and regions.', 'SCHEMA', N'Person', 'TABLE', N'CountryRegion'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ISO standard code for countries and regions.', 'SCHEMA', N'Person', 'TABLE', N'CountryRegion', 'COLUMN', N'CountryRegionCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Country or region name.', 'SCHEMA', N'Person', 'TABLE', N'CountryRegion', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Person', 'TABLE', N'CountryRegion', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Person', 'TABLE', N'CountryRegion', 'INDEX', N'AK_CountryRegion_Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Person', 'TABLE', N'CountryRegion', 'INDEX', N'PK_CountryRegion_CountryRegionCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Person', 'TABLE', N'CountryRegion', 'CONSTRAINT', N'PK_CountryRegion_CountryRegionCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Person', 'TABLE', N'CountryRegion', 'CONSTRAINT', N'DF_CountryRegion_ModifiedDate'
GO
```

## <a name="#DependsOn"></a>Depends On _`2`_
- [Person](../Security/Schemas/Person.md)
- [dbo.Name](../Programmability/Types/UserDefinedDataTypes/dbo.Name.md)


## <a name="#UsedBy"></a>Used By _`10`_
- [Person.StateProvince](Person.StateProvince.md)
- [Sales.CountryRegionCurrency](Sales.CountryRegionCurrency.md)
- [Sales.SalesTerritory](Sales.SalesTerritory.md)
- [HumanResources.vEmployee](../Views/HumanResources.vEmployee.md)
- [Person.vAdditionalContactInfo](../Views/Person.vAdditionalContactInfo.md)
- [Person.vStateProvinceCountryRegion](../Views/Person.vStateProvinceCountryRegion.md)
- [Purchasing.vVendorWithAddresses](../Views/Purchasing.vVendorWithAddresses.md)
- [Sales.vIndividualCustomer](../Views/Sales.vIndividualCustomer.md)
- [Sales.vSalesPerson](../Views/Sales.vSalesPerson.md)
- [Sales.vStoreWithAddresses](../Views/Sales.vStoreWithAddresses.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial