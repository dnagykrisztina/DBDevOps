# Flyway

A Flyway https://flywaydb.org/download/community linken keresztül tölthető le, és ennek az oldalnak megfelelően tudjuk telepíteni: https://flywaydb.org/documentation/usage/commandline/#download-and-installation

A kicsomagolás után érdemes a mappát a PATH környezeti változóhoz adni, hogy könnyebb legyen használni a `flyway` parancsot.

A conf mappában található a konfigurációs fájl formátuma amivel a kapcsolódási adatokat állítottam be, és az sql mappában vannak a változtatások forrásai. A mappát felhasználva a verziók alkalmazhatók.

A Jenkins automatizáláshoz a jenkins_job_config.xml fájlt lehet felhasználni hogy Jenkins job-ot készítsünk, és a képen látható az eszköz beállítása.