#### 

[Project](../../../../index.md) > [localhost](../../../index.md) > [User databases](../../index.md) > [AdventureWorks2016](../index.md) > [Views](Views.md) > Production.vProductModelInstructions

# ![Views](../../../../Images/View32.png) [Production].[vProductModelInstructions]

---

## <a name="#description"></a>MS_Description

Displays the content from each element in the xml column Instructions for each product in the Production.ProductModel table that has manufacturing instructions.

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

| Name | Data Type | Max Length (Bytes) | Identity |
|---|---|---|---|
| ProductModelID | int | 4 | 0 - 0 |
| Name | [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md) | 100 |  |
| Instructions | nvarchar(max) | max |  |
| LocationID | int | 4 |  |
| SetupHours | decimal(9,4) | 5 |  |
| MachineHours | decimal(9,4) | 5 |  |
| LaborHours | decimal(9,4) | 5 |  |
| LotSize | int | 4 |  |
| Step | nvarchar(1024) | 2048 |  |
| rowguid | uniqueidentifier | 16 |  |
| ModifiedDate | datetime | 8 |  |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE VIEW [Production].[vProductModelInstructions] 
AS 
SELECT 
    [ProductModelID] 
    ,[Name] 
    ,[Instructions].value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions"; 
        (/root/text())[1]', 'nvarchar(max)') AS [Instructions] 
    ,[MfgInstructions].ref.value('@LocationID[1]', 'int') AS [LocationID] 
    ,[MfgInstructions].ref.value('@SetupHours[1]', 'decimal(9, 4)') AS [SetupHours] 
    ,[MfgInstructions].ref.value('@MachineHours[1]', 'decimal(9, 4)') AS [MachineHours] 
    ,[MfgInstructions].ref.value('@LaborHours[1]', 'decimal(9, 4)') AS [LaborHours] 
    ,[MfgInstructions].ref.value('@LotSize[1]', 'int') AS [LotSize] 
    ,[Steps].ref.value('string(.)[1]', 'nvarchar(1024)') AS [Step] 
    ,[rowguid] 
    ,[ModifiedDate]
FROM [Production].[ProductModel] 
CROSS APPLY [Instructions].nodes(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions"; 
    /root/Location') MfgInstructions(ref)
CROSS APPLY [MfgInstructions].ref.nodes('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions"; 
    step') Steps(ref);
GO
EXEC sp_addextendedproperty N'MS_Description', N'Displays the content from each element in the xml column Instructions for each product in the Production.ProductModel table that has manufacturing instructions.', 'SCHEMA', N'Production', 'VIEW', N'vProductModelInstructions', NULL, NULL
GO

```


---

## <a name="#uses"></a>Uses

* [[Production].[ProductModel]](../Tables/ProductModel.md)
* [[dbo].[Name]](../Programmability/Types/User-Defined_Data_Types/Name.md)
* [Production](../Security/Schemas/Production.md)


---

###### Author:  dnagykrisztina

###### Copyright 2021 - All Rights Reserved

###### Created: 2021. március 21., vasárnap 18:49:30

