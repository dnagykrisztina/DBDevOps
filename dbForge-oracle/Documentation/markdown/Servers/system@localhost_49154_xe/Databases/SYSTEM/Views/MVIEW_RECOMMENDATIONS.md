[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[system@localhost:49154:xe](../../../system@localhost_49154_xe.md)>[Schemas](../../Databases.md)>[SYSTEM](../SYSTEM.md)>[Views](Views.md)>MVIEW_RECOMMENDATIONS


# ![logo](../../../../../Images/view64.svg) MVIEW_RECOMMENDATIONS

## <a name="#Description"></a>Description
> This view gives DBA access to summary recommendations
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
|ALL_TABLES|ALL_TABLES||
|FACT_TABLES|FACT_TABLES||
|GROUPING_LEVELS|GROUPING_LEVELS||
|QUERY_TEXT|QUERY_TEXT||
|RECOMMENDATION_NUMBER|RECOMMENDATION_NUMBER||
|RECOMMENDED_ACTION|RECOMMENDED_ACTION||
|MVIEW_OWNER|MVIEW_OWNER||
|MVIEW_NAME|MVIEW_NAME||
|STORAGE_IN_BYTES|STORAGE_IN_BYTES||
|PCT_PERFORMANCE_GAIN|PCT_PERFORMANCE_GAIN||
|BENEFIT_TO_COST_RATIO|BENEFIT_TO_COST_RATIO||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE VIEW SYSTEM.MVIEW_RECOMMENDATIONS (
  RUNID,
  ALL_TABLES,
  FACT_TABLES,
  GROUPING_LEVELS,
  QUERY_TEXT,
  RECOMMENDATION_NUMBER,
  RECOMMENDED_ACTION,
  MVIEW_OWNER,
  MVIEW_NAME,
  STORAGE_IN_BYTES,
  PCT_PERFORMANCE_GAIN,
  BENEFIT_TO_COST_RATIO
)
AS
  SELECT t1.runid# AS runid,
       t1.from_clause AS all_tables,
       fact_tables,
       grouping_levels,
       query_text,
       rank# AS recommendation_number,
       action_type AS recommended_action,
       summary_owner AS mview_owner,
       summary_name AS mview_name,
       storage_in_bytes,
       pct_performance_gain,
       benefit_to_cost_ratio
  FROM MVIEW$_ADV_OUTPUT t1,
       MVIEW$_ADV_LOG t2,
       ALL_USERS u
  WHERE t1.runid# = t2.runid#
    AND u.username = t2.uname
    AND u.user_id = USERENV('SCHEMAID')
    AND t1.output_type = 0
  ORDER BY t1.rank#;

COMMENT ON TABLE SYSTEM.MVIEW_RECOMMENDATIONS IS 'This view gives DBA access to summary recommendations';
```

## <a name="#DependsOn"></a>Depends On _`3`_
- ![Synonym](../../../../../Images/synonym.svg) PUBLIC.ALL_USERS
- ![Table](../../../../../Images/table.svg) MVIEW$_ADV_LOG
- ![Table](../../../../../Images/table.svg) MVIEW$_ADV_OUTPUT


## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2021 Trial