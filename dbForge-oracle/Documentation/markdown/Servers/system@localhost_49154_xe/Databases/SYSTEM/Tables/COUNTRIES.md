[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[system@localhost:49154:xe](../../../system@localhost_49154_xe.md)>[Schemas](../../Databases.md)>[SYSTEM](../SYSTEM.md)>[Tables](Tables.md)>COUNTRIES


# ![logo](../../../../../Images/table64.svg) COUNTRIES

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
|Last Modified|2021. 04. 10. 16:36:14|


## <a name="#Columns"></a>Columns _`3`_
|Key|Name|Data Type|Data Type Owner|Length|Precision|Scale|Char Used|Not Null|Default|Default On Nulls|Nested Table|Reference|Virtual|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key COUNTRY_ID_PK](../../../../../Images/primarykey.svg)](#Indexes)[![Indexes COUNTRY_ID_PK](../../../../../Images/index.svg)](#Indexes)|COUNTRYID|NUMBER|||5|0||True||False|False|False|False||
||COUNTRYNAME|VARCHAR2||20|||Byte|False||False|False|False|False||
|[![Foreign Keys COUNTRY_CONTINENT_ID_FK: CONTINENTS](../../../../../Images/foreignkey.svg)](#ForeignKeys)|CONTINENT|NUMBER|||5|0||False||False|False|False|False||

## <a name="#Indexes"></a>Indexes _`1`_
|Key|Name|Columns|Unique|Bitmap|Reverse|Unsorted|Visible|Sort Orders|Tablespase|Partitioning|
|:---:|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key COUNTRY_ID_PK](../../../../../Images/primarykey.svg)](#Indexes)|COUNTRY_ID_PK|COUNTRYID|True|False|False|False|True|Asc|SYSTEM|False|

## <a name="#ForeignKeys"></a>Foreign Keys _`1`_
|Name|Columns|Delete Rule|Enabled|Validate|Rely|Deferred|Deferrable|
|---|---|---|---|---|---|---|---|
|COUNTRY_CONTINENT_ID_FK|CONTID|NO ACTION|True|True|False|IMMEDIATE|NOT DEFERRABLE|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE SYSTEM.COUNTRIES (
  COUNTRYID NUMBER(5, 0),
  COUNTRYNAME VARCHAR2(20 BYTE),
  CONTINENT NUMBER(5, 0),
  CONSTRAINT COUNTRY_ID_PK PRIMARY KEY (COUNTRYID) USING INDEX TABLESPACE SYSTEM STORAGE ( INITIAL 64K NEXT 1M MAXEXTENTS UNLIMITED ),
  CONSTRAINT COUNTRY_CONTINENT_ID_FK FOREIGN KEY (CONTINENT)
    REFERENCES SYSTEM.CONTINENTS(CONTID))
TABLESPACE SYSTEM
STORAGE (
  INITIAL 64K
  NEXT 1M
  MAXEXTENTS UNLIMITED
)
LOGGING;
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) [CONTINENTS](CONTINENTS.md)


## <a name="#UsedBy"></a>Used By _`1`_
- ![Table](../../../../../Images/table.svg) [CAR_MAKERS](CAR_MAKERS.md)


||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2021 Trial