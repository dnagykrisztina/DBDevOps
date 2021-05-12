# Adventure Works Database on SQL Server 2019
FROM mcr.microsoft.com/mssql/server:2017-latest

# Note: This isn't a secure password, and please don't use this for production.
ENV SA_PASSWORD=TestPass123!
ENV ACCEPT_EULA=Y

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -yq curl apt-transport-https && \
	curl https://packages.microsoft.com/config/ubuntu/16.04/mssql-server-2017.list | tee /etc/apt/sources.list.d/mssql-server.list && \
    apt-get -y  update && \
	apt-get install -y mssql-server && \
	apt-get install -y mssql-server-ha && \
	apt-get install -y mssql-server-fts && \
	apt-get clean && \
    rm -rf /var/lib/apt/lists

COPY AdventureWorks2016.bak /var/opt/mssql/backup/

# Launch SQL Server, confirm startup is complete, restore the database, then terminate SQL Server.
RUN ( /opt/mssql/bin/sqlservr & ) | grep -q "Service Broker manager has started" \
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q 'RESTORE DATABASE AdventureWorks2016 FROM DISK = "/var/opt/mssql/backup/AdventureWorks2016.bak" WITH MOVE "AdventureWorks2016_Data" to "/var/opt/mssql/data/AdventureWorks2016_Data.mdf", MOVE "AdventureWorks2016_Log" to "/var/opt/mssql/data/AdventureWorks2016_log.ldf", NOUNLOAD, STATS = 5' \
    && pkill sqlservr

CMD ["/opt/mssql/bin/sqlservr"]