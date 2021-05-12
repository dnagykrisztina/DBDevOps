[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[system@localhost:49154:xe](../../../system@localhost_49154_xe.md)>[Schemas](../../Databases.md)>[SYSTEM](../SYSTEM.md)>[Tables](Tables.md)>CAR_DETAILS


# ![logo](../../../../../Images/table64.svg) CAR_DETAILS

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
|Last Modified|2021. 04. 10. 16:39:26|


## <a name="#Columns"></a>Columns _`8`_
|Key|Name|Data Type|Data Type Owner|Length|Precision|Scale|Char Used|Not Null|Default|Default On Nulls|Nested Table|Reference|Virtual|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key CAR_DETAILS_ID_PK](../../../../../Images/primarykey.svg)](#Indexes)[![Foreign Keys CAR_DETAILS_ID_FK: CAR_NAMES](../../../../../Images/foreignkey.svg)](#ForeignKeys)[![Indexes CAR_DETAILS_ID_PK](../../../../../Images/index.svg)](#Indexes)|ID|NUMBER|||5|0||True||False|False|False|False||
||MPG|NUMBER|||5|2||False||False|False|False|False||
||CYLINDERS|NUMBER|||5|0||False||False|False|False|False||
||EDISPL|NUMBER|||10|0||False||False|False|False|False||
||HORSEPOWER|NUMBER|||10|0||False||False|False|False|False||
||WEIGHT|NUMBER|||10|0||False||False|False|False|False||
||ACCEL|NUMBER|||10|2||False||False|False|False|False||
||YEAR|NUMBER|||10|0||False||False|False|False|False||

## <a name="#Indexes"></a>Indexes _`1`_
|Key|Name|Columns|Unique|Bitmap|Reverse|Unsorted|Visible|Sort Orders|Tablespase|Partitioning|
|:---:|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key CAR_DETAILS_ID_PK](../../../../../Images/primarykey.svg)](#Indexes)|CAR_DETAILS_ID_PK|ID|True|False|False|False|True|Asc|SYSTEM|False|

## <a name="#ForeignKeys"></a>Foreign Keys _`1`_
|Name|Columns|Delete Rule|Enabled|Validate|Rely|Deferred|Deferrable|
|---|---|---|---|---|---|---|---|
|CAR_DETAILS_ID_FK|ID|NO ACTION|True|True|False|IMMEDIATE|NOT DEFERRABLE|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE SYSTEM.CAR_DETAILS (
  ID NUMBER(5, 0),
  MPG NUMBER(5, 2),
  CYLINDERS NUMBER(5, 0),
  EDISPL NUMBER(10, 0),
  HORSEPOWER NUMBER(10, 0),
  WEIGHT NUMBER(10, 0),
  ACCEL NUMBER(10, 2),
  YEAR NUMBER(10, 0),
  CONSTRAINT CAR_DETAILS_ID_PK PRIMARY KEY (ID) USING INDEX TABLESPACE SYSTEM STORAGE ( INITIAL 64K NEXT 1M MAXEXTENTS UNLIMITED ),
  CONSTRAINT CAR_DETAILS_ID_FK FOREIGN KEY (ID)
    REFERENCES SYSTEM.CAR_NAMES(ID))
TABLESPACE SYSTEM
STORAGE (
  INITIAL 64K
  NEXT 1M
  MAXEXTENTS UNLIMITED
)
LOGGING;
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) [CAR_NAMES](CAR_NAMES.md)


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2021 Trial