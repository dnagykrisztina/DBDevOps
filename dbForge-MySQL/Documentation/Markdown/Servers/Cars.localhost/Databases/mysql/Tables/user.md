[Project](../../../../../startpage.md)>[Servers](../../../../Servers.md)>[Cars.localhost](../../../Cars.localhost.md)>[Databases](../../Databases.md)>[mysql](../mysql.md)>[Tables](Tables.md)>user


# ![logo](../../../../../Images/table64.svg) user

## <a name="#Description"></a>Description
> Users and global privileges
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|Engine|InnoDB|
|Auto Increment|0|
|Average Row Length|0|
|Charset|utf8|
|Collation|utf8_bin|
|Row Format|Dynamic|
|Min Rows|0|
|Max Rows|0|
|Checksum|False|
|Page Checksum|True|
|Pack Keys|False|
|Delay Key Write|False|
|Is Partitioned|False|
|Encryption|False|
|Persistent Statistics|False|
|Auto Recalculate Statistics|DEFAULT|
|Sample Pages|0|
|Created|2021. 04. 10. 15:36:56|
|Last Modified|0001. 01. 01. 0:00:00|


## <a name="#Columns"></a>Columns
|Key|Name|Data Type|Length|Precision|Scale|Unsigned|Zerofill|Binary|Not Null|Auto Increment|Default|Virtual|Description|
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|Host|CHAR|255|||False|False|False|True|False|''|False||
|[![Primary Key ](../../../../../Images/primarykey.svg)](#Indexes)|User|CHAR|32|||False|False|True|True|False|''|False||
||Select_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Insert_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Update_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Delete_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Create_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Drop_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Reload_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Shutdown_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Process_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||File_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Grant_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||References_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Index_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Alter_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Show_db_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Super_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Create_tmp_table_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Lock_tables_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Execute_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Repl_slave_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Repl_client_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Create_view_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Show_view_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Create_routine_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Alter_routine_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Create_user_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Event_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Trigger_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Create_tablespace_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||ssl_type|ENUM|0|||False|False|False|True|False|''|False||
||ssl_cipher|BLOB|0|||False|False|False|True|False||False||
||x509_issuer|BLOB|0|||False|False|False|True|False||False||
||x509_subject|BLOB|0|||False|False|False|True|False||False||
||max_questions|INT||11||True|False|False|True|False|'0'|False||
||max_updates|INT||11||True|False|False|True|False|'0'|False||
||max_connections|INT||11||True|False|False|True|False|'0'|False||
||max_user_connections|INT||11||True|False|False|True|False|'0'|False||
||plugin|CHAR|64|||False|False|True|True|False|'caching_sha2_password'|False||
||authentication_string|TEXT||||False|False|True|False|False||False||
||password_expired|ENUM|0|||False|False|False|True|False|'N'|False||
||password_last_changed|TIMESTAMP|0|||False|False|False|False|False|NULL|False||
||password_lifetime|SMALLINT||6||True|False|False|False|False|NULL|False||
||account_locked|ENUM|0|||False|False|False|True|False|'N'|False||
||Create_role_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Drop_role_priv|ENUM|0|||False|False|False|True|False|'N'|False||
||Password_reuse_history|SMALLINT||6||True|False|False|False|False|NULL|False||
||Password_reuse_time|SMALLINT||6||True|False|False|False|False|NULL|False||
||Password_require_current|ENUM|0|||False|False|False|False|False|NULL|False||
||User_attributes|JSON|0|||False|False|False|False|False|NULL|False||

## <a name="#Permissions"></a>Permissions
|Action|Owner|
|---|---|
|SELECT|mysql.session@localhost|

## <a name="#SqlScript"></a>SQL Script
```SQL
CREATE TABLE user (
  Host CHAR(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  User CHAR(32) BINARY NOT NULL DEFAULT '',
  Select_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Insert_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Update_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Delete_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Create_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Drop_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Reload_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Shutdown_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Process_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  File_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Grant_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  References_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Index_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Alter_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Show_db_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Super_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Create_tmp_table_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Lock_tables_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Execute_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Repl_slave_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Repl_client_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Create_view_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Show_view_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Create_routine_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Alter_routine_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Create_user_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Event_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Trigger_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Create_tablespace_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  ssl_type ENUM('','ANY','X509','SPECIFIED') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  ssl_cipher BLOB NOT NULL,
  x509_issuer BLOB NOT NULL,
  x509_subject BLOB NOT NULL,
  max_questions INT UNSIGNED NOT NULL DEFAULT 0,
  max_updates INT UNSIGNED NOT NULL DEFAULT 0,
  max_connections INT UNSIGNED NOT NULL DEFAULT 0,
  max_user_connections INT UNSIGNED NOT NULL DEFAULT 0,
  plugin CHAR(64) BINARY NOT NULL DEFAULT 'caching_sha2_password',
  authentication_string TEXT BINARY DEFAULT NULL,
  password_expired ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  password_last_changed TIMESTAMP NULL DEFAULT NULL,
  password_lifetime SMALLINT UNSIGNED DEFAULT NULL,
  account_locked ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Create_role_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Drop_role_priv ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  Password_reuse_history SMALLINT UNSIGNED DEFAULT NULL,
  Password_reuse_time SMALLINT UNSIGNED DEFAULT NULL,
  Password_require_current ENUM('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  User_attributes JSON DEFAULT NULL,
  PRIMARY KEY (Host, User)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_bin,
COMMENT = 'Users and global privileges',
STATS_PERSISTENT = 0,
TABLESPACE mysql;
```

## <a name="#DependsOn"></a>Depends On
No items found

## <a name="#UsedBy"></a>Used By
No items found

||||
|---|---|---|
|Author: |Copyright © All Rights Reserved|Created: 10. 04. 2021|
# dbForge Studio 2020 Trial