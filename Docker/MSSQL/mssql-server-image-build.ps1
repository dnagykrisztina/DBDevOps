Invoke-WebRequest -Uri https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2016.bak -OutFile AdventureWorks2016.bak
docker build -t mssql-server .