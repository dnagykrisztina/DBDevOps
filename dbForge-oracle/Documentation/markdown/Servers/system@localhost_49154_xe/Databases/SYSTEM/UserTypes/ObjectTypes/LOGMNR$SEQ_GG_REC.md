[Project](../../../../../../startpage.md)>[Servers](../../../../../Servers.md)>[system@localhost:49154:xe](../../../../system@localhost_49154_xe.md)>[Schemas](../../../Databases.md)>[SYSTEM](../../SYSTEM.md)>[User Types](../UserTypes.md)>[Object Types](ObjectTypes.md)>LOGMNR$SEQ_GG_REC


# ![logo](../../../../../../Images/objecttype64.svg) LOGMNR$SEQ_GG_REC


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
CREATE type        SYSTEM.LOGMNR$SEQ_GG_REC as object
(
LOGMNR_UID NUMBER,
OBJ# NUMBER,
NAME VARCHAR2(384),
OWNER# NUMBER,
OWNERNAME VARCHAR2(384),
FLAGS NUMBER,
MD_TAB_SEQCACHE NUMBER,
MD_TAB_SEQINCREMENTBY NUMBER,
SPARE1  NUMBER,
SPARE2  NUMBER,
SPARE3  NUMBER,
SPARE4  VARCHAR2(4000),
SPARE5  VARCHAR2(4000),
SPARE6  VARCHAR2(4000)
);
/
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Package](../../../../../../Images/package.svg) SYS.STANDARD


## <a name="#UsedBy"></a>Used By _`1`_
- ![UserTableType](../../../../../../Images/usertabletype.svg) [LOGMNR$SEQ_GG_RECS](../TableTypes/LOGMNR$SEQ_GG_RECS.md)


||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2021 Trial