###### DBDevOps
___
[Project](../../../../../../startpage.md)>[Servers](../../../../../Servers.md)>[LOCALHOST](../../../../LOCALHOST.md)>[User databases](../../../UserDatabases.md)>[AdventureWorks2019](../../AdventureWorks2019.md)>[Security](../Security.md)>[Schemas](Schemas.md)>Person


# ![logo](../../../../../../Images/schema.svg) Person

## <a name="#Description"></a>Description
> Contains objects related to names and addresses of customers, vendors, and employees
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Owner|dbo|


## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE SCHEMA Person AUTHORIZATION dbo
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Contains objects related to names and addresses of customers, vendors, and employees', 'SCHEMA', N'Person'
GO
```

## <a name="#DependsOn"></a>Depends On


## <a name="#UsedBy"></a>Used By _`18`_
- [Person.Address](../../Tables/Person.Address.md)
- [Person.AddressType](../../Tables/Person.AddressType.md)
- [Person.BusinessEntity](../../Tables/Person.BusinessEntity.md)
- [Person.BusinessEntityAddress](../../Tables/Person.BusinessEntityAddress.md)
- [Person.BusinessEntityContact](../../Tables/Person.BusinessEntityContact.md)
- [Person.ContactType](../../Tables/Person.ContactType.md)
- [Person.CountryRegion](../../Tables/Person.CountryRegion.md)
- [Person.EmailAddress](../../Tables/Person.EmailAddress.md)
- [Person.Password](../../Tables/Person.Password.md)
- [Person.Person](../../Tables/Person.Person.md)
- [Person.PersonPhone](../../Tables/Person.PersonPhone.md)
- [Person.Pet](../../Tables/Person.Pet.md)
- [Person.PhoneNumberType](../../Tables/Person.PhoneNumberType.md)
- [Person.StateProvince](../../Tables/Person.StateProvince.md)
- [Person.vAdditionalContactInfo](../../Views/Person.vAdditionalContactInfo.md)
- [Person.vStateProvinceCountryRegion](../../Views/Person.vStateProvinceCountryRegion.md)
- [Person.AdditionalContactInfoSchemaCollection](../../Programmability/Types/XmlSchemaCollection/Person.AdditionalContactInfoSchemaCollection.md)
- [Person.IndividualSurveySchemaCollection](../../Programmability/Types/XmlSchemaCollection/Person.IndividualSurveySchemaCollection.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial