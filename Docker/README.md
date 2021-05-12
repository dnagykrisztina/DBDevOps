# Docker image-ek

A mappa tartalma az összes tesztelés során felhasznált adatbázis-kezelő konténer forrása.

A reprodukáláshoz minden mappában az {név}-server-image-build.ps1 szkriptet kell futtatni az image elkészítéséhez, és a {név}-server-start.ps1 szkriptet az elindításhoz.

MSSQL esetén az alap image a `mcr.microsoft.com/mssql/server:2017-latest`, MySQL esetén a `mysql:8.0` és Oracle esetén a `quay.io/maksymbilenko/oracle-12c:latest`, mivel nem találtam a Docker Hub-on olyan image-et, amihez ne kellett volna fizetett ügyfélnek lenni.

Javaslat: Mivel a teszt közben könnyű összekeverni a futó konténereket, a {név}-server-start.ps1 szkriptben érdemes átírni a konténer nevét a tesztnek megfelelően. Például ApexSQL tesztelése esetén az `mssql-server` helyett `mssql-server-apexsql` használata.