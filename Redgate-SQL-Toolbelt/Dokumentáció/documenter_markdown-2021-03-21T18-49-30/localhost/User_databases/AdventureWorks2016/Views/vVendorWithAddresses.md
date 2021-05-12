#### 

[Project](../../../../index.md) > [localhost](../../../index.md) > [User databases](../../index.md) > [AdventureWorks2016](../index.md) > [Views](Views.md) > Purchasing.vVendorWithAddresses

# ![Views](../../../../Images/View32.png) [Purchasing].[vVendorWithAddresses]

---

## <a name="#description"></a>MS_Description

Vendor (company) names and addresses .

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 17:24:52 2017. október 19., csütörtök |
| Last Modified | 17:24:52 2017. október 19., csütörtök |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| BusinessEntityID | int | 4 |
| Name | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 |
| AddressType | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 |
| AddressLine1 | nvarchar(60) | 120 |
| AddressLine2 | nvarchar(60) | 120 |
| City | nvarchar(30) | 60 |
| StateProvinceName | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 |
| PostalCode | nvarchar(15) | 30 |
| CountryRegionName | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE VIEW [Purchasing].[vVendorWithAddresses] AS 
SELECT 
    v.[BusinessEntityID]
    ,v.[Name]
    ,at.[Name] AS [AddressType]
    ,a.[AddressLine1] 
    ,a.[AddressLine2] 
    ,a.[City] 
    ,sp.[Name] AS [StateProvinceName] 
    ,a.[PostalCode] 
    ,cr.[Name] AS [CountryRegionName] 
FROM [Purchasing].[Vendor] v
    INNER JOIN [Person].[BusinessEntityAddress] bea 
    ON bea.[BusinessEntityID] = v.[BusinessEntityID] 
    INNER JOIN [Person].[Address] a 
    ON a.[AddressID] = bea.[AddressID]
    INNER JOIN [Person].[StateProvince] sp 
    ON sp.[StateProvinceID] = a.[StateProvinceID]
    INNER JOIN [Person].[CountryRegion] cr 
    ON cr.[CountryRegionCode] = sp.[CountryRegionCode]
    INNER JOIN [Person].[AddressType] at 
    ON at.[AddressTypeID] = bea.[AddressTypeID];
GO
EXEC sp_addextendedproperty N'MS_Description', N'Vendor (company) names and addresses .', 'SCHEMA', N'Purchasing', 'VIEW', N'vVendorWithAddresses', NULL, NULL
GO

```


---

## <a name="#uses"></a>Uses

* [[Person].[Address]](../Tables/Address.md)
* [[Person].[AddressType]](../Tables/AddressType.md)
* [[Person].[BusinessEntityAddress]](../Tables/BusinessEntityAddress.md)
* [[Person].[CountryRegion]](../Tables/CountryRegion.md)
* [[Person].[StateProvince]](../Tables/StateProvince.md)
* [[Purchasing].[Vendor]](../Tables/Vendor.md)
* [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md)
* [Purchasing](../Security/Schemas/Purchasing.md)


---

###### Author:  dnagykrisztina

###### Copyright 2021 - All Rights Reserved

###### Created: 2021. március 21., vasárnap 18:49:30

