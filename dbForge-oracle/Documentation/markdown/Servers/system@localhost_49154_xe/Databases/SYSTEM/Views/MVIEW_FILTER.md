[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[system@localhost:49154:xe](../../../system@localhost_49154_xe.md)>[Schemas](../../Databases.md)>[SYSTEM](../SYSTEM.md)>[Views](Views.md)>MVIEW_FILTER


# ![logo](../../../../../Images/view64.svg) MVIEW_FILTER

## <a name="#Description"></a>Description
> Workload filter records
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
|FILTERID|FILTERID||
|SUBFILTERNUM|SUBFILTERNUM||
|SUBFILTERTYPE|SUBFILTERTYPE||
|STR_VALUE|STR_VALUE||
|NUM_VALUE1|NUM_VALUE1||
|NUM_VALUE2|NUM_VALUE2||
|DATE_VALUE1|DATE_VALUE1||
|DATE_VALUE2|DATE_VALUE2||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE VIEW SYSTEM.MVIEW_FILTER (
  FILTERID,
  SUBFILTERNUM,
  SUBFILTERTYPE,
  STR_VALUE,
  NUM_VALUE1,
  NUM_VALUE2,
  DATE_VALUE1,
  DATE_VALUE2
)
AS
  SELECT a.filterid# AS filterid,
       a.subfilternum# AS subfilternum,
       DECODE(a.subfiltertype, 1, 'APPLICATION', 2, 'CARDINALITY', 3, 'LASTUSE',
       4, 'FREQUENCY', 5, 'USER', 6, 'PRIORITY', 7, 'BASETABLE',
       8, 'RESPONSETIME', 9, 'COLLECTIONID', 10, 'TRACENAME',
       11, 'SCHEMA', 'UNKNOWN') AS subfiltertype,
       a.str_value,
       TO_NUMBER(DECODE(a.num_value1, -999, NULL, a.num_value1)) AS num_value1,
       TO_NUMBER(DECODE(a.num_value2, -999, NULL, a.num_value2)) AS num_value2,
       a.date_value1,
       a.date_value2
  FROM system.mview$_adv_filter a,
       system.mview$_adv_log b,
       ALL_USERS u
  WHERE a.filterid# = b.runid#
    AND b.uname = u.username
    AND u.user_id = USERENV('SCHEMAID');

COMMENT ON TABLE SYSTEM.MVIEW_FILTER IS 'Workload filter records';
```

## <a name="#DependsOn"></a>Depends On _`3`_
- ![Synonym](../../../../../Images/synonym.svg) PUBLIC.ALL_USERS
- ![Table](../../../../../Images/table.svg) MVIEW$_ADV_FILTER
- ![Table](../../../../../Images/table.svg) MVIEW$_ADV_LOG


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2021 Trial