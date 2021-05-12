[Project](../../../../../../startpage.md)>[Servers](../../../../../Servers.md)>[system@localhost:49154:xe](../../../../system@localhost_49154_xe.md)>[Schemas](../../../Databases.md)>[SYSTEM](../../SYSTEM.md)>[User Types](../UserTypes.md)>[Object Types](ObjectTypes.md)>LOGMNR$GSBA_GG_REC


# ![logo](../../../../../../Images/objecttype64.svg) LOGMNR$GSBA_GG_REC


## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Wrapped|False|
|Status|VALID|
|Owner|SYSTEM|
|Body Name||
|Created|2017. 01. 26. 14:06:54|
|Last Modified|2017. 01. 26. 14:06:54|


## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TYPE        SYSTEM.LOGMNR$GSBA_GG_REC AS OBJECT
(
LOGMNR_UID NUMBER,
NAME           VARCHAR2(384),
VALUE          VARCHAR2(4000),
LOGMNR_SPARE1  NUMBER,
LOGMNR_SPARE2  NUMBER,
LOGMNR_SPARE3  VARCHAR2(4000),
LOGMNR_SPARE4  DATE
);
/
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Package](../../../../../../Images/package.svg) SYS.STANDARD


## <a name="#UsedBy"></a>Used By _`1`_
- ![UserTableType](../../../../../../Images/usertabletype.svg) [LOGMNR$GSBA_GG_RECS](../TableTypes/LOGMNR$GSBA_GG_RECS.md)


||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2021 Trial