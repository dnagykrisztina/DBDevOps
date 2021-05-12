[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[system@localhost:49154:xe](../../../system@localhost_49154_xe.md)>[Schemas](../../Databases.md)>[SYSTEM](../SYSTEM.md)>[Views](Views.md)>PRODUCT_PRIVS


# ![logo](../../../../../Images/view64.svg) PRODUCT_PRIVS

## <a name="#Description"></a>Description
> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Editioning|False|
|Status|VALID|
|Oid Text||
|Type Text||
|View Type||
|View Owner|SYSTEM|
|Restrictions||
|Constraint||
|Created|2017. 01. 26. 14:49:56|
|Last Modified|2017. 01. 26. 14:49:56|


## <a name="#Columns"></a>Columns
|Name|Alias|Description|
|---|---|---|
|PRODUCT|PRODUCT||
|USERID|USERID||
|ATTRIBUTE|ATTRIBUTE||
|SCOPE|SCOPE||
|NUMERIC_VALUE|NUMERIC_VALUE||
|CHAR_VALUE|CHAR_VALUE||
|DATE_VALUE|DATE_VALUE||
|LONG_VALUE|LONG_VALUE||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE VIEW SYSTEM.PRODUCT_PRIVS (
  PRODUCT,
  USERID,
  ATTRIBUTE,
  SCOPE,
  NUMERIC_VALUE,
  CHAR_VALUE,
  DATE_VALUE,
  LONG_VALUE
)
AS
  SELECT PRODUCT,
       USERID,
       ATTRIBUTE,
       SCOPE,
       NUMERIC_VALUE,
       CHAR_VALUE,
       DATE_VALUE,
       LONG_VALUE
  FROM SQLPLUS_PRODUCT_PROFILE
  WHERE USERID = 'PUBLIC'
    OR USER LIKE USERID;
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) SQLPLUS_PRODUCT_PROFILE


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2021 Trial