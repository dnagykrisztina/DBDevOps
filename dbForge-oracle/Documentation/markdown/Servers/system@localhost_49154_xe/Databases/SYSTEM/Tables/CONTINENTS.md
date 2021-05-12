[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[system@localhost:49154:xe](../../../system@localhost_49154_xe.md)>[Schemas](../../Databases.md)>[SYSTEM](../SYSTEM.md)>[Tables](Tables.md)>CONTINENTS


# ![logo](../../../../../Images/table64.svg) CONTINENTS

## <a name="#Description"></a>Description
> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Index Organized|False|
|Object Based|False|
|Object Name||
|Object Owner||
|Object Identifier Is Primary Key|False|
|Temporary|False|
|Temporary Session|False|
|Cluster Name||
|Partitioned|False|
|Compression|False|
|Read Only|False|
|Status|VALID|
|Backed Up|False|
|Flashback Archive Name||
|Row Movement|False|
|Result Cache|DEFAULT|
|Owner|SYSTEM|
|Created|2021. 04. 10. 16:22:17|
|Last Modified|2021. 04. 10. 16:36:05|


## <a name="#Columns"></a>Columns _`2`_
|Key|Name|Data Type|Data Type Owner|Length|Precision|Scale|Char Used|Not Null|Default|Default On Nulls|Nested Table|Reference|Virtual|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key CONTINENT_ID_PK](../../../../../Images/primarykey.svg)](#Indexes)[![Indexes CONTINENT_ID_PK](../../../../../Images/index.svg)](#Indexes)|CONTID|NUMBER|||5|0||True||False|False|False|False||
||CONTINENT|VARCHAR2||15|||Byte|False||False|False|False|False||

## <a name="#Indexes"></a>Indexes _`1`_
|Key|Name|Columns|Unique|Bitmap|Reverse|Unsorted|Visible|Sort Orders|Tablespase|Partitioning|
|:---:|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key CONTINENT_ID_PK](../../../../../Images/primarykey.svg)](#Indexes)|CONTINENT_ID_PK|CONTID|True|False|False|False|True|Asc|SYSTEM|False|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE SYSTEM.CONTINENTS (
  CONTID NUMBER(5, 0),
  CONTINENT VARCHAR2(15 BYTE),
  CONSTRAINT CONTINENT_ID_PK PRIMARY KEY (CONTID) USING INDEX TABLESPACE SYSTEM STORAGE ( INITIAL 64K NEXT 1M MAXEXTENTS UNLIMITED ))
TABLESPACE SYSTEM
STORAGE (
  INITIAL 64K
  NEXT 1M
  MAXEXTENTS UNLIMITED
)
LOGGING;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By _`1`_
- ![Table](../../../../../Images/table.svg) [COUNTRIES](COUNTRIES.md)


||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2021 Trial