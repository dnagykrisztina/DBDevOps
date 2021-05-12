#### 

[Project](../../../../index.md) > [localhost](../../../index.md) > [User databases](../../index.md) > [AdventureWorks2016](../index.md) > [Views](Views.md) > Sales.vSalesPerson

# ![Views](../../../../Images/View32.png) [Sales].[vSalesPerson]

---

## <a name="#description"></a>MS_Description

Sales representiatives (names and addresses) and their sales-related information.

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 17:24:52 2017. október 19., csütörtök |
| Last Modified | 17:29:01 2021. március 21., vasárnap |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| BusinessEntityID | int | 4 |
| Title | nvarchar(8) | 16 |
| FirstName | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 |
| MiddleName | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 |
| LastName | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 |
| Suffix | nvarchar(10) | 20 |
| JobTitle | nvarchar(50) | 100 |
| PhoneNumber | [[dbo].[Phone]](../Programmability/Types/User-Defined_Data_Types/Phone.md) | 50 |
| PhoneNumberType | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 |
| EmailAddress | nvarchar(50) | 100 |
| EmailPromotion | int | 4 |
| AddressLine1 | nvarchar(60) | 120 |
| AddressLine2 | nvarchar(60) | 120 |
| City | nvarchar(30) | 60 |
| StateProvinceName | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 |
| PostalCode | nvarchar(15) | 30 |
| CountryRegionName | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 |
| TerritoryName | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 |
| TerritoryGroup | nvarchar(50) | 100 |
| SalesQuota | money | 8 |
| SalesYTD | money | 8 |
| SalesLastYear | money | 8 |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE VIEW [Sales].[vSalesPerson] 
AS 
SELECT 
    s.[BusinessEntityID]
    ,p.[Title]
    ,p.[FirstName]
    ,p.[MiddleName]
    ,p.[LastName]
    ,p.[Suffix]
    ,e.[JobTitle]
    ,pp.[PhoneNumber]
	,pnt.[Name] AS [PhoneNumberType]
    ,ea.[EmailAddress]
    ,p.[EmailPromotion]
    ,a.[AddressLine1]
    ,a.[AddressLine2]
    ,a.[City]
    ,[StateProvinceName] = sp.[Name]
    ,a.[PostalCode]
    ,[CountryRegionName] = cr.[Name]
    ,[TerritoryName] = st.[Name]
    ,[TerritoryGroup] = st.[Group]
    ,s.[SalesQuota]
    ,s.[SalesYTD]
    ,s.[SalesLastYear]
FROM [Sales].[SalesPerson] s
    INNER JOIN [HumanResources].[Employee] e 
    ON e.[BusinessEntityID] = s.[BusinessEntityID]
	INNER JOIN [Person].[Person] p
	ON p.[BusinessEntityID] = s.[BusinessEntityID]
    INNER JOIN [Person].[BusinessEntityAddress] bea 
    ON bea.[BusinessEntityID] = s.[BusinessEntityID] 
    INNER JOIN [Person].[Address] a 
    ON a.[AddressID] = bea.[AddressID]
    INNER JOIN [Person].[StateProvince] sp 
    ON sp.[StateProvinceID] = a.[StateProvinceID]
    INNER JOIN [Person].[CountryRegion] cr 
    ON cr.[CountryRegionCode] = sp.[CountryRegionCode]
    LEFT OUTER JOIN [Sales].[SalesTerritory] st 
    ON st.[TerritoryID] = s.[TerritoryID]
	LEFT OUTER JOIN [Person].[EmailAddress] ea
	ON ea.[BusinessEntityID] = p.[BusinessEntityID]
	LEFT OUTER JOIN [Person].[PersonPhone] pp
	ON pp.[BusinessEntityID] = p.[BusinessEntityID]
	LEFT OUTER JOIN [Person].[PhoneNumberType] pnt
	ON pnt.[PhoneNumberTypeID] = pp.[PhoneNumberTypeID];
GO
EXEC sp_addextendedproperty N'MS_Description', N'Sales representiatives (names and addresses) and their sales-related information.', 'SCHEMA', N'Sales', 'VIEW', N'vSalesPerson', NULL, NULL
GO

```


---

## <a name="#uses"></a>Uses

* [[HumanResources].[Employee]](../Tables/Employee.md)
* [[Person].[Address]](../Tables/Address.md)
* [[Person].[BusinessEntityAddress]](../Tables/BusinessEntityAddress.md)
* [[Person].[CountryRegion]](../Tables/CountryRegion.md)
* [[Person].[EmailAddress]](../Tables/EmailAddress.md)
* [[Person].[Person]](../Tables/Person.md)
* [[Person].[PersonPhone]](../Tables/PersonPhone.md)
* [[Person].[PhoneNumberType]](../Tables/PhoneNumberType.md)
* [[Person].[StateProvince]](../Tables/StateProvince.md)
* [[Sales].[SalesPerson]](../Tables/SalesPerson.md)
* [[Sales].[SalesTerritory]](../Tables/SalesTerritory.md)
* [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md)
* [[dbo].[Phone]](../Programmability/Types/User-Defined_Data_Types/Phone.md)
* [Sales](../Security/Schemas/Sales.md)


---

###### Author:  dnagykrisztina

###### Copyright 2021 - All Rights Reserved

###### Created: 2021. március 21., vasárnap 18:49:30

