[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[system@localhost:49154:xe](../../../system@localhost_49154_xe.md)>[Schemas](../../Databases.md)>[SYSTEM](../SYSTEM.md)>[Views](Views.md)>MVIEW_EVALUATIONS


# ![logo](../../../../../Images/view64.svg) MVIEW_EVALUATIONS

## <a name="#Description"></a>Description
> This view gives DBA access to summary evaluation output
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
|MVIEW_OWNER|MVIEW_OWNER||
|MVIEW_NAME|MVIEW_NAME||
|RANK|RANK||
|STORAGE_IN_BYTES|STORAGE_IN_BYTES||
|FREQUENCY|FREQUENCY||
|CUMULATIVE_BENEFIT|CUMULATIVE_BENEFIT||
|BENEFIT_TO_COST_RATIO|BENEFIT_TO_COST_RATIO||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE VIEW SYSTEM.MVIEW_EVALUATIONS (
  RUNID,
  MVIEW_OWNER,
  MVIEW_NAME,
  RANK,
  STORAGE_IN_BYTES,
  FREQUENCY,
  CUMULATIVE_BENEFIT,
  BENEFIT_TO_COST_RATIO
)
AS
  SELECT t1.runid# AS runid,
       summary_owner AS mview_owner,
       summary_name AS mview_name,
       rank# AS rank,
       storage_in_bytes,
       frequency,
       cumulative_benefit,
       benefit_to_cost_ratio
  FROM MVIEW$_ADV_OUTPUT t1,
       MVIEW$_ADV_LOG t2,
       ALL_USERS u
  WHERE t1.runid# = t2.runid#
    AND u.username = t2.uname
    AND u.user_id = USERENV('SCHEMAID')
    AND t1.output_type = 1
  ORDER BY t1.rank#;

COMMENT ON TABLE SYSTEM.MVIEW_EVALUATIONS IS 'This view gives DBA access to summary evaluation output';
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