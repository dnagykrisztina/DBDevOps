FROM quay.io/maksymbilenko/oracle-12c:latest

ENV DBCA_TOTAL_MEMORY 4096

ADD oracle-server-seed.sql /oracle-server-seed.sql
RUN ( /entrypoint.sh & ) && sleep 280 && \
    sqlplus system/oracle@localhost/xe @/oracle-server-seed.sql
