[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[system@localhost:49154:xe](../../../system@localhost_49154_xe.md)>[Schemas](../../Databases.md)>[SYSTEM](../SYSTEM.md)>[Sequences](Sequences.md)>LOGMNR_UIDS$


# ![logo](../../../../../Images/sequence64.svg) LOGMNR_UIDS$


## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Initial Value|100|
|Increment|1|
|Min Value|100|
|Max Value|99999|
|Cache|NOCACHE|
|Cycle|True|
|Order|True|
|Keep Values|False|
|Session|False|
|Status|VALID|
|Created|2017. 01. 26. 13:54:26|
|Last Modified|2017. 01. 26. 13:54:26|


## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE SEQUENCE SYSTEM.LOGMNR_UIDS$
  START WITH 100
  INCREMENT BY 1
  MAXVALUE 99999
  MINVALUE 100
  NOCACHE
  CYCLE
  ORDER;
```

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2021 Trial