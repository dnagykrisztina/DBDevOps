[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[system@localhost:49154:xe](../../../system@localhost_49154_xe.md)>[Schemas](../../Databases.md)>[SYSTEM](../SYSTEM.md)>[Tables](Tables.md)>CAR_MAKERS


# ![logo](../../../../../Images/table64.svg) CAR_MAKERS

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
|Last Modified|2021. 04. 10. 16:35:55|


## <a name="#Columns"></a>Columns _`4`_
|Key|Name|Data Type|Data Type Owner|Length|Precision|Scale|Char Used|Not Null|Default|Default On Nulls|Nested Table|Reference|Virtual|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key CAR_MAKER_ID](../../../../../Images/primarykey.svg)](#Indexes)[![Indexes CAR_MAKER_ID](../../../../../Images/index.svg)](#Indexes)|ID|NUMBER|||5|0||True||False|False|False|False||
||MAKER|VARCHAR2||15|||Byte|False||False|False|False|False||
||FULLNAME|VARCHAR2||25|||Byte|False||False|False|False|False||
|[![Foreign Keys CAR_MAKER_COUNTRY_ID_FK: COUNTRIES](../../../../../Images/foreignkey.svg)](#ForeignKeys)|COUNTRY|NUMBER|||5|0||False||False|False|False|False||

## <a name="#Indexes"></a>Indexes _`1`_
|Key|Name|Columns|Unique|Bitmap|Reverse|Unsorted|Visible|Sort Orders|Tablespase|Partitioning|
|:---:|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key CAR_MAKER_ID](../../../../../Images/primarykey.svg)](#Indexes)|CAR_MAKER_ID|ID|True|False|False|False|True|Asc|SYSTEM|False|

## <a name="#ForeignKeys"></a>Foreign Keys _`1`_
|Name|Columns|Delete Rule|Enabled|Validate|Rely|Deferred|Deferrable|
|---|---|---|---|---|---|---|---|
|CAR_MAKER_COUNTRY_ID_FK|COUNTRYID|NO ACTION|True|True|False|IMMEDIATE|NOT DEFERRABLE|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE SYSTEM.CAR_MAKERS (
  ID NUMBER(5, 0),
  MAKER VARCHAR2(15 BYTE),
  FULLNAME VARCHAR2(25 BYTE),
  COUNTRY NUMBER(5, 0),
  CONSTRAINT CAR_MAKER_ID PRIMARY KEY (ID) USING INDEX TABLESPACE SYSTEM STORAGE ( INITIAL 64K NEXT 1M MAXEXTENTS UNLIMITED ),
  CONSTRAINT CAR_MAKER_COUNTRY_ID_FK FOREIGN KEY (COUNTRY)
    REFERENCES SYSTEM.COUNTRIES(COUNTRYID))
TABLESPACE SYSTEM
STORAGE (
  INITIAL 64K
  NEXT 1M
  MAXEXTENTS UNLIMITED
)
LOGGING;
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) [COUNTRIES](COUNTRIES.md)


## <a name="#UsedBy"></a>Used By _`1`_
- ![Table](../../../../../Images/table.svg) MODEL_DETAILS


||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2021 Trial