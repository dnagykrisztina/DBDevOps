[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[system@localhost:49154:xe](../../../system@localhost_49154_xe.md)>[Schemas](../../Databases.md)>[SYSTEM](../SYSTEM.md)>[Views](Views.md)>MVIEW_LOG


# ![logo](../../../../../Images/view64.svg) MVIEW_LOG

## <a name="#Description"></a>Description
> Advisor session log
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
|ID|ID||
|FILTERID|FILTERID||
|RUN_BEGIN|RUN_BEGIN||
|RUN_END|RUN_END||
|TYPE|TYPE||
|STATUS|STATUS||
|MESSAGE|MESSAGE||
|COMPLETED|COMPLETED||
|TOTAL|TOTAL||
|ERROR_CODE|ERROR_CODE||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE VIEW SYSTEM.MVIEW_LOG (
  ID,
  FILTERID,
  RUN_BEGIN,
  RUN_END,
  TYPE,
  STATUS,
  MESSAGE,
  COMPLETED,
  TOTAL,
  ERROR_CODE
)
AS
  SELECT m.runid# AS id,
       m.filterid# AS filterid,
       m.run_begin,
       m.run_end,
       DECODE(m.run_type, 1, 'EVALUATE', 2, 'EVALUATE_W', 3, 'RECOMMEND',
       4, 'RECOMMEND_W', 5, 'VALIDATE', 6, 'WORKLOAD',
       7, 'FILTER', 'UNKNOWN') AS type,
       DECODE(m.status, 0, 'UNUSED', 1, 'CANCELLED', 2, 'IN_PROGRESS', 3, 'COMPLETED',
       4, 'ERROR', 'UNKNOWN') AS status,
       m.message,
       m.completed,
       m.total,
       m.error_code
  FROM system.mview$_adv_log m,
       all_users u
  WHERE m.uname = u.username
    AND u.user_id = USERENV('SCHEMAID');

COMMENT ON TABLE SYSTEM.MVIEW_LOG IS 'Advisor session log';
```

## <a name="#DependsOn"></a>Depends On _`2`_
- ![Synonym](../../../../../Images/synonym.svg) PUBLIC.ALL_USERS
- ![Table](../../../../../Images/table.svg) MVIEW$_ADV_LOG


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2021 Trial