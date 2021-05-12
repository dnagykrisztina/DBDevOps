[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[system@localhost:49154:xe](../../../system@localhost_49154_xe.md)>[Schemas](../../Databases.md)>[SYSTEM](../SYSTEM.md)>[Views](Views.md)>MVIEW_FILTERINSTANCE


# ![logo](../../../../../Images/view64.svg) MVIEW_FILTERINSTANCE

## <a name="#Description"></a>Description
> Workload filter instance records
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
|RUNID|RUNID||
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
CREATE VIEW SYSTEM.MVIEW_FILTERINSTANCE (
  RUNID,
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
  SELECT a.runid# AS runid,
       a.filterid# AS filterid,
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
  FROM system.mview$_adv_filterinstance a;

COMMENT ON TABLE SYSTEM.MVIEW_FILTERINSTANCE IS 'Workload filter instance records';
```

## <a name="#DependsOn"></a>Depends On _`1`_
- ![Table](../../../../../Images/table.svg) MVIEW$_ADV_FILTERINSTANCE


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2021 Trial