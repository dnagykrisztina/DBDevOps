#### 

[Project](../../../../index.md) > [localhost](../../../index.md) > [User databases](../../index.md) > [AdventureWorks2016](../index.md) > [Views](Views.md) > Sales.vIndividualCustomer

# ![Views](../../../../Images/View32.png) [Sales].[vIndividualCustomer]

---

## <a name="#description"></a>MS_Description

Individual customers (names and addresses) that purchase Adventure Works Cycles products online.

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
| PhoneNumber | [[dbo].[Phone]](../Programmability/Types/User-Defined_Data_Types/Phone.md) | 50 |
| PhoneNumberType | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 |
| EmailAddress | nvarchar(50) | 100 |
| EmailPromotion | int | 4 |
| AddressType | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 |
| AddressLine1 | nvarchar(60) | 120 |
| AddressLine2 | nvarchar(60) | 120 |
| City | nvarchar(30) | 60 |
| StateProvinceName | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 |
| PostalCode | nvarchar(15) | 30 |
| CountryRegionName | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 |
| Demographics | xml | max |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE VIEW [Sales].[vIndividualCustomer] 
AS 
SELECT 
    p.[BusinessEntityID]
    ,p.[Title]
    ,p.[FirstName]
    ,p.[MiddleName]
    ,p.[LastName]
    ,p.[Suffix]
    ,pp.[PhoneNumber]
	,pnt.[Name] AS [PhoneNumberType]
    ,ea.[EmailAddress]
    ,p.[EmailPromotion]
    ,at.[Name] AS [AddressType]
    ,a.[AddressLine1]
    ,a.[AddressLine2]
    ,a.[City]
    ,[StateProvinceName] = sp.[Name]
    ,a.[PostalCode]
    ,[CountryRegionName] = cr.[Name]
    ,p.[Demographics]
FROM [Person].[Person] p
    INNER JOIN [Person].[BusinessEntityAddress] bea 
    ON bea.[BusinessEntityID] = p.[BusinessEntityID] 
    INNER JOIN [Person].[Address] a 
    ON a.[AddressID] = bea.[AddressID]
    INNER JOIN [Person].[StateProvince] sp 
    ON sp.[StateProvinceID] = a.[StateProvinceID]
    INNER JOIN [Person].[CountryRegion] cr 
    ON cr.[CountryRegionCode] = sp.[CountryRegionCode]
    INNER JOIN [Person].[AddressType] at 
    ON at.[AddressTypeID] = bea.[AddressTypeID]
	INNER JOIN [Sales].[Customer] c
	ON c.[PersonID] = p.[BusinessEntityID]
	LEFT OUTER JOIN [Person].[EmailAddress] ea
	ON ea.[BusinessEntityID] = p.[BusinessEntityID]
	LEFT OUTER JOIN [Person].[PersonPhone] pp
	ON pp.[BusinessEntityID] = p.[BusinessEntityID]
	LEFT OUTER JOIN [Person].[PhoneNumberType] pnt
	ON pnt.[PhoneNumberTypeID] = pp.[PhoneNumberTypeID]
WHERE c.StoreID IS NULL;
GO
EXEC sp_addextendedproperty N'MS_Description', N'Individual customers (names and addresses) that purchase Adventure Works Cycles products online.', 'SCHEMA', N'Sales', 'VIEW', N'vIndividualCustomer', NULL, NULL
GO

```


---

## <a name="#uses"></a>Uses

* [[Person].[Address]](../Tables/Address.md)
* [[Person].[AddressType]](../Tables/AddressType.md)
* [[Person].[BusinessEntityAddress]](../Tables/BusinessEntityAddress.md)
* [[Person].[CountryRegion]](../Tables/CountryRegion.md)
* [[Person].[EmailAddress]](../Tables/EmailAddress.md)
* [[Person].[Person]](../Tables/Person.md)
* [[Person].[PersonPhone]](../Tables/PersonPhone.md)
* [[Person].[PhoneNumberType]](../Tables/PhoneNumberType.md)
* [[Person].[StateProvince]](../Tables/StateProvince.md)
* [[Sales].[Customer]](../Tables/Customer.md)
* [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md)
* [[dbo].[Phone]](../Programmability/Types/User-Defined_Data_Types/Phone.md)
* [Sales](../Security/Schemas/Sales.md)


---

###### Author:  dnagykrisztina

###### Copyright 2021 - All Rights Reserved

###### Created: 2021. március 21., vasárnap 18:49:30

