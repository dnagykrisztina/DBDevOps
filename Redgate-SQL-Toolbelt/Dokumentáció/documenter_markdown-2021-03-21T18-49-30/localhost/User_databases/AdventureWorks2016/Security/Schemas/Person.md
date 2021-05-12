#### 

[Project](../../../../../index.md) > [localhost](../../../../index.md) > [User databases](../../../index.md) > [AdventureWorks2016](../../index.md) > [Security](../index.md) > [Schemas](Schemas.md) > Person

# ![Schemas](../../../../../Images/Schema32.png) Person

---

## <a name="#description"></a>MS_Description

Contains objects related to names and addresses of customers, vendors, and employees

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Owner | [dbo](../Users/dbo.md) |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE SCHEMA [Person]
AUTHORIZATION [dbo]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Contains objects related to names and addresses of customers, vendors, and employees', 'SCHEMA', N'Person', NULL, NULL, NULL, NULL
GO

```


---

## <a name="#usedby"></a>Used By

* [[Person].[Address]](../../Tables/Address.md)
* [[Person].[AddressType]](../../Tables/AddressType.md)
* [[Person].[BusinessEntity]](../../Tables/BusinessEntity.md)
* [[Person].[BusinessEntityAddress]](../../Tables/BusinessEntityAddress.md)
* [[Person].[BusinessEntityContact]](../../Tables/BusinessEntityContact.md)
* [[Person].[ContactType]](../../Tables/ContactType.md)
* [[Person].[CountryRegion]](../../Tables/CountryRegion.md)
* [[Person].[EmailAddress]](../../Tables/EmailAddress.md)
* [[Person].[Password]](../../Tables/Password.md)
* [[Person].[Person]](../../Tables/Person.md)
* [[Person].[PersonPhone]](../../Tables/PersonPhone.md)
* [[Person].[Pet]](../../Tables/Pet.md)
* [[Person].[PhoneNumberType]](../../Tables/PhoneNumberType.md)
* [[Person].[StateProvince]](../../Tables/StateProvince.md)
* [[Person].[vAdditionalContactInfo]](../../Views/vAdditionalContactInfo.md)
* [[Person].[vStateProvinceCountryRegion]](../../Views/vStateProvinceCountryRegion.md)
* [[Person].[AdditionalContactInfoSchemaCollection]](../../Programmability/Types/XML_Schema_Collections/AdditionalContactInfoSchemaCollection.md)
* [[Person].[IndividualSurveySchemaCollection]](../../Programmability/Types/XML_Schema_Collections/IndividualSurveySchemaCollection.md)


---

###### Author:  dnagykrisztina

###### Copyright 2021 - All Rights Reserved

###### Created: 2021. március 21., vasárnap 18:49:30

