[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[performance_schema](../performance_schema.md)>[Tables](Tables.md)>prepared_statements_instances


# ![logo](../../../../../Images/table64.svg) prepared_statements_instances

## <a name="#Description"></a>Description
> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Engine|PERFORMANCE_SCHEMA|
|Auto Increment|0|
|Average Row Length|0|
|Charset|utf8mb4|
|Collation|utf8mb4_0900_ai_ci|
|Row Format|Default|
|Min Rows|0|
|Max Rows|0|
|Checksum|False|
|Page Checksum|True|
|Pack Keys|False|
|Delay Key Write|False|
|Is Partitioned|False|
|Encryption|False|
|Persistent Statistics|DEFAULT|
|Auto Recalculate Statistics|DEFAULT|
|Sample Pages|0|
|Created|2021. 04. 10. 15:36:55|
|Last Modified|0001. 01. 01. 0:00:00|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|OBJECT_INSTANCE_BEGIN|BIGINT||20||True|False|False|True|False||False||
|[![Indexes STATEMENT_ID](../../../../../Images/index.svg)](#Indexes)|STATEMENT_ID|BIGINT||20||True|False|False|True|False||False||
|[![Indexes STATEMENT_NAME](../../../../../Images/index.svg)](#Indexes)|STATEMENT_NAME|VARCHAR|64|||False|False|False|False|False|NULL|False||
||SQL_TEXT|LONGTEXT||||False|False|False|True|False||False||
|[![Indexes OWNER_THREAD_ID](../../../../../Images/index.svg)](#Indexes)|OWNER_THREAD_ID|BIGINT||20||True|False|False|True|False||False||
|[![Indexes OWNER_THREAD_ID](../../../../../Images/index.svg)](#Indexes)|OWNER_EVENT_ID|BIGINT||20||True|False|False|True|False||False||
|[![Indexes OWNER_OBJECT_TYPE](../../../../../Images/index.svg)](#Indexes)|OWNER_OBJECT_TYPE|ENUM|0|||False|False|False|False|False|NULL|False||
|[![Indexes OWNER_OBJECT_TYPE](../../../../../Images/index.svg)](#Indexes)|OWNER_OBJECT_SCHEMA|VARCHAR|64|||False|False|False|False|False|NULL|False||
|[![Indexes OWNER_OBJECT_TYPE](../../../../../Images/index.svg)](#Indexes)|OWNER_OBJECT_NAME|VARCHAR|64|||False|False|False|False|False|NULL|False||
||TIMER_PREPARE|BIGINT||20||True|False|False|True|False||False||
||COUNT_REPREPARE|BIGINT||20||True|False|False|True|False||False||
||COUNT_EXECUTE|BIGINT||20||True|False|False|True|False||False||
||SUM_TIMER_EXECUTE|BIGINT||20||True|False|False|True|False||False||
||MIN_TIMER_EXECUTE|BIGINT||20||True|False|False|True|False||False||
||AVG_TIMER_EXECUTE|BIGINT||20||True|False|False|True|False||False||
||MAX_TIMER_EXECUTE|BIGINT||20||True|False|False|True|False||False||
||SUM_LOCK_TIME|BIGINT||20||True|False|False|True|False||False||
||SUM_ERRORS|BIGINT||20||True|False|False|True|False||False||
||SUM_WARNINGS|BIGINT||20||True|False|False|True|False||False||
||SUM_ROWS_AFFECTED|BIGINT||20||True|False|False|True|False||False||
||SUM_ROWS_SENT|BIGINT||20||True|False|False|True|False||False||
||SUM_ROWS_EXAMINED|BIGINT||20||True|False|False|True|False||False||
||SUM_CREATED_TMP_DISK_TABLES|BIGINT||20||True|False|False|True|False||False||
||SUM_CREATED_TMP_TABLES|BIGINT||20||True|False|False|True|False||False||
||SUM_SELECT_FULL_JOIN|BIGINT||20||True|False|False|True|False||False||
||SUM_SELECT_FULL_RANGE_JOIN|BIGINT||20||True|False|False|True|False||False||
||SUM_SELECT_RANGE|BIGINT||20||True|False|False|True|False||False||
||SUM_SELECT_RANGE_CHECK|BIGINT||20||True|False|False|True|False||False||
||SUM_SELECT_SCAN|BIGINT||20||True|False|False|True|False||False||
||SUM_SORT_MERGE_PASSES|BIGINT||20||True|False|False|True|False||False||
||SUM_SORT_RANGE|BIGINT||20||True|False|False|True|False||False||
||SUM_SORT_ROWS|BIGINT||20||True|False|False|True|False||False||
||SUM_SORT_SCAN|BIGINT||20||True|False|False|True|False||False||
||SUM_NO_INDEX_USED|BIGINT||20||True|False|False|True|False||False||
||SUM_NO_GOOD_INDEX_USED|BIGINT||20||True|False|False|True|False||False||

## <a name="#Indexes"></a>Indexes
|Key|Name|Columns|Unique|Type|Key Lengths|
|:---:|---|---|---|---|---|
||OWNER_THREAD_ID|OWNER_THREAD_ID, OWNER_EVENT_ID|True|None||
||STATEMENT_ID|STATEMENT_ID|False|None||
||STATEMENT_NAME|STATEMENT_NAME|False|None||
||OWNER_OBJECT_TYPE|OWNER_OBJECT_TYPE, OWNER_OBJECT_SCHEMA, OWNER_OBJECT_NAME|False|None||

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE prepared_statements_instances (
  OBJECT_INSTANCE_BEGIN BIGINT UNSIGNED NOT NULL,
  STATEMENT_ID BIGINT UNSIGNED NOT NULL,
  STATEMENT_NAME VARCHAR(64) DEFAULT NULL,
  SQL_TEXT LONGTEXT NOT NULL,
  OWNER_THREAD_ID BIGINT UNSIGNED NOT NULL,
  OWNER_EVENT_ID BIGINT UNSIGNED NOT NULL,
  OWNER_OBJECT_TYPE ENUM('EVENT','FUNCTION','PROCEDURE','TABLE','TRIGGER') DEFAULT NULL,
  OWNER_OBJECT_SCHEMA VARCHAR(64) DEFAULT NULL,
  OWNER_OBJECT_NAME VARCHAR(64) DEFAULT NULL,
  TIMER_PREPARE BIGINT UNSIGNED NOT NULL,
  COUNT_REPREPARE BIGINT UNSIGNED NOT NULL,
  COUNT_EXECUTE BIGINT UNSIGNED NOT NULL,
  SUM_TIMER_EXECUTE BIGINT UNSIGNED NOT NULL,
  MIN_TIMER_EXECUTE BIGINT UNSIGNED NOT NULL,
  AVG_TIMER_EXECUTE BIGINT UNSIGNED NOT NULL,
  MAX_TIMER_EXECUTE BIGINT UNSIGNED NOT NULL,
  SUM_LOCK_TIME BIGINT UNSIGNED NOT NULL,
  SUM_ERRORS BIGINT UNSIGNED NOT NULL,
  SUM_WARNINGS BIGINT UNSIGNED NOT NULL,
  SUM_ROWS_AFFECTED BIGINT UNSIGNED NOT NULL,
  SUM_ROWS_SENT BIGINT UNSIGNED NOT NULL,
  SUM_ROWS_EXAMINED BIGINT UNSIGNED NOT NULL,
  SUM_CREATED_TMP_DISK_TABLES BIGINT UNSIGNED NOT NULL,
  SUM_CREATED_TMP_TABLES BIGINT UNSIGNED NOT NULL,
  SUM_SELECT_FULL_JOIN BIGINT UNSIGNED NOT NULL,
  SUM_SELECT_FULL_RANGE_JOIN BIGINT UNSIGNED NOT NULL,
  SUM_SELECT_RANGE BIGINT UNSIGNED NOT NULL,
  SUM_SELECT_RANGE_CHECK BIGINT UNSIGNED NOT NULL,
  SUM_SELECT_SCAN BIGINT UNSIGNED NOT NULL,
  SUM_SORT_MERGE_PASSES BIGINT UNSIGNED NOT NULL,
  SUM_SORT_RANGE BIGINT UNSIGNED NOT NULL,
  SUM_SORT_ROWS BIGINT UNSIGNED NOT NULL,
  SUM_SORT_SCAN BIGINT UNSIGNED NOT NULL,
  SUM_NO_INDEX_USED BIGINT UNSIGNED NOT NULL,
  SUM_NO_GOOD_INDEX_USED BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (OBJECT_INSTANCE_BEGIN)
)
ENGINE = PERFORMANCE_SCHEMA,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE prepared_statements_instances 
  ADD UNIQUE INDEX OWNER_THREAD_ID(OWNER_THREAD_ID, OWNER_EVENT_ID);

ALTER TABLE prepared_statements_instances 
  ADD INDEX STATEMENT_ID(STATEMENT_ID);

ALTER TABLE prepared_statements_instances 
  ADD INDEX STATEMENT_NAME(STATEMENT_NAME);

ALTER TABLE prepared_statements_instances 
  ADD INDEX OWNER_OBJECT_TYPE(OWNER_OBJECT_TYPE, OWNER_OBJECT_SCHEMA, OWNER_OBJECT_NAME);
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial