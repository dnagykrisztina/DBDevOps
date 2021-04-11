CREATE TABLE "SYSTEM".rolling$connections (
  source_rdbid NUMBER,
  dest_rdbid NUMBER,
  "ATTRIBUTES" NUMBER,
  service_name VARCHAR2(256 BYTE),
  conn_handle NUMBER,
  "CONNECT_TIME" TIMESTAMP,
  send_time TIMESTAMP,
  disconnect_time TIMESTAMP,
  update_time TIMESTAMP,
  source_pid NUMBER,
  dest_pid NUMBER,
  spare1 NUMBER,
  spare2 NUMBER,
  spare3 VARCHAR2(128 BYTE)
);