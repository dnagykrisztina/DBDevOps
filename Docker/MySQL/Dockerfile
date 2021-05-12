FROM mysql:8.0

ENV MYSQL_ROOT_PASSWORD test

ADD mysql-server-seed.sql /mysql-server-seed.sql
RUN ( /entrypoint.sh --verbose & ) && sleep 25 && mysql --host=localhost -u root -p$MYSQL_ROOT_PASSWORD < /mysql-server-seed.sql