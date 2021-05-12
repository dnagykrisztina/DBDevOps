[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[system@localhost:49154:xe](../../../system@localhost_49154_xe.md)>[Schemas](../../Databases.md)>[SYSTEM](../SYSTEM.md)>[Views](Views.md)>MVIEW_WORKLOAD


# ![logo](../../../../../Images/view64.svg) MVIEW_WORKLOAD

## <a name="#Description"></a>Description
> This view gives DBA access to shared workload
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
|Created|2017. 01. 26. 13:58:49|
|Last Modified|2017. 01. 26. 13:58:49|


## <a name="#Columns"></a>Columns
|Name|Alias|Description|
|---|---|---|
|WORKLOADID|WORKLOADID||
|IMPORT_TIME|IMPORT_TIME||
|QUERYID|QUERYID||
|APPLICATION|APPLICATION||
|CARDINALITY|CARDINALITY||
|RESULTSIZE|RESULTSIZE||
|LASTUSE|LASTUSE||
|FREQUENCY|FREQUENCY||
|OWNER|OWNER||
|PRIORITY|PRIORITY||
|QUERY|QUERY||
|RESPONSETIME|RESPONSETIME||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE VIEW SYSTEM.MVIEW_WORKLOAD (
  WORKLOADID,
  IMPORT_TIME,
  QUERYID,
  APPLICATION,
  CARDINALITY,
  RESULTSIZE,
  LASTUSE,
  FREQUENCY,
  OWNER,
  PRIORITY,
  QUERY,
  RESPONSETIME
)
AS
  SELECT a.collectionid# AS workloadid,
       a.collecttime AS import_time,
       a.queryid# AS queryid,
       a.application,
       a.cardinality,
       a.resultsize,
       a.qdate AS lastuse,
       a.frequency,
       a.uname AS owner,
       a.priority,
       a.sql_text AS query,
       a.exec_time AS responsetime
  FROM MVIEW$_ADV_WORKLOAD A,
       MVIEW$_ADV_LOG B,
       ALL_USERS D
  WHERE a.collectionid# = b.runid#
    AND b.uname = d.username
    AND d.user_id = USERENV('SCHEMAID');

COMMENT ON TABLE SYSTEM.MVIEW_WORKLOAD IS 'This view gives DBA access to shared workload';
```

## <a name="#DependsOn"></a>Depends On _`3`_
- ![Synonym](../../../../../Images/synonym.svg) PUBLIC.ALL_USERS
- ![Table](../../../../../Images/table.svg) MVIEW$_ADV_LOG
- ![Table](../../../../../Images/table.svg) MVIEW$_ADV_WORKLOAD


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2021 Trial