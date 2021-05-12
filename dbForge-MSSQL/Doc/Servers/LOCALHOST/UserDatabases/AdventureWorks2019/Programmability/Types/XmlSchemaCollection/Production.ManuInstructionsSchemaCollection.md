###### DBDevOps
___
[Project](../../../../../../../startpage.md)>[Servers](../../../../../../Servers.md)>[LOCALHOST](../../../../../LOCALHOST.md)>[User databases](../../../../UserDatabases.md)>[AdventureWorks2019](../../../AdventureWorks2019.md)>[Programmability](../../Programmability.md)>[Types](../Types.md)>[XML Schema Collections](XmlSchemaCollection.md)>Production.ManuInstructionsSchemaCollection


# ![logo](../../../../../../../Images/xmlschema.svg) Production.ManuInstructionsSchemaCollection

## <a name="#Description"></a>Description
> Collection of XML schemas for the Instructions column in the Production.ProductModel table.

## <a name="#DependentColumns"></a>Dependent Columns _`1`_
- [Production.ProductModel](../../../Tables/Production.ProductModel.md)


## <a name="#DependentFunctions"></a>Dependent Functions


## <a name="#DependentProcedures"></a>Dependent Stored Procedures


## <a name="#DependentMessageTypes"></a>Dependent Message Types


## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE XML SCHEMA COLLECTION Production.ManuInstructionsSchemaCollection AS
N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions" targetNamespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions" elementFormDefault="qualified"><xsd:element name="root"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="Location" maxOccurs="unbounded"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="step" type="t:StepType" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="LocationID" type="xsd:integer" use="required" /><xsd:attribute name="SetupHours" type="xsd:decimal" /><xsd:attribute name="MachineHours" type="xsd:decimal" /><xsd:attribute name="LaborHours" type="xsd:decimal" /><xsd:attribute name="LotSize" type="xsd:decimal" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:complexType name="StepType" mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:element name="tool" type="xsd:string" /><xsd:element name="material" type="xsd:string" /><xsd:element name="blueprint" type="xsd:string" /><xsd:element name="specs" type="xsd:string" /><xsd:element name="diag" type="xsd:string" /></xsd:choice></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:schema>'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Collection of XML schemas for the Instructions column in the Production.ProductModel table.', 'SCHEMA', N'Production', 'XML SCHEMA COLLECTION', N'ManuInstructionsSchemaCollection'
GO
```

## <a name="#DependsOn"></a>Depends On _`1`_
- [Production](../../../Security/Schemas/Production.md)


## <a name="#UsedBy"></a>Used By _`1`_
- [Production.ProductModel](../../../Tables/Production.ProductModel.md)


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial