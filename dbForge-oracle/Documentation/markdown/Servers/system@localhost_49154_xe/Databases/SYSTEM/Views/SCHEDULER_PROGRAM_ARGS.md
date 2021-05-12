[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[system@localhost:49154:xe](../../../system@localhost_49154_xe.md)>[Schemas](../../Databases.md)>[SYSTEM](../SYSTEM.md)>[Views](Views.md)>SCHEDULER_PROGRAM_ARGS


# ![logo](../../../../../Images/view64.svg) SCHEDULER_PROGRAM_ARGS

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
|Created|2017. 01. 26. 14:09:14|
|Last Modified|2017. 01. 26. 14:09:14|


## <a name="#Columns"></a>Columns
|Name|Alias|Description|
|---|---|---|
|OWNER|OWNER||
|PROGRAM_NAME|PROGRAM_NAME||
|ARGUMENT_NAME|ARGUMENT_NAME||
|ARGUMENT_POSITION|ARGUMENT_POSITION||
|ARGUMENT_TYPE|ARGUMENT_TYPE||
|METADATA_ATTRIBUTE|METADATA_ATTRIBUTE||
|DEFAULT_VALUE|DEFAULT_VALUE||
|DEFAULT_ANYDATA_VALUE|DEFAULT_ANYDATA_VALUE||
|OUT_ARGUMENT|OUT_ARGUMENT||

## <a name="#Permissions"></a>Permissions
|Type|Action|Owner|
|---|---|---|
|GRANT|SELECT|SELECT_CATALOG_ROLE|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE VIEW SYSTEM.SCHEDULER_PROGRAM_ARGS (
  OWNER,
  PROGRAM_NAME,
  ARGUMENT_NAME,
  ARGUMENT_POSITION,
  ARGUMENT_TYPE,
  METADATA_ATTRIBUTE,
  DEFAULT_VALUE,
  DEFAULT_ANYDATA_VALUE,
  OUT_ARGUMENT
)
AS
  SELECT "OWNER",
       "PROGRAM_NAME",
       "ARGUMENT_NAME",
       "ARGUMENT_POSITION",
       "ARGUMENT_TYPE",
       "METADATA_ATTRIBUTE",
       "DEFAULT_VALUE",
       "DEFAULT_ANYDATA_VALUE",
       "OUT_ARGUMENT"
  FROM sys.all_scheduler_program_args;
```

## <a name="#DependsOn"></a>Depends On _`4`_
- ![View](../../../../../Images/view.svg) SYS.ALL_SCHEDULER_PROGRAM_ARGS
- ![UserTableType|ObjectType|CollectionType](../../../../../Images/folder.svg) SYS.ANYDATA
- ![Package](../../../../../Images/package.svg) SYS.DBMS_SCHEDULER
- ![Package](../../../../../Images/package.svg) SYS.STANDARD


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2021 Trial