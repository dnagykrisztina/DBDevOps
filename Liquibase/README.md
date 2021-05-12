# Liquibase

A liquibase könnyen telepíthető a hivatalos oldalról letöltött installerrel. 

Windows: https://github.com/liquibase/liquibase/releases/download/v4.3.1/liquibase-windows-x64-installer-4.3.1.exe

Unix: https://github.com/liquibase/liquibase/releases/download/v4.3.1/liquibase-4.3.1.tar.gz

A futtatáshoz lehet hogy szükség van a telepítési/kicsomagolási útvonal PATH környezeti változóhoz adására.

Ezek után a következő képpen lehet futtani egy séma frissítést.

```{bash}
$ liquibase update
```

A csatlakozási információkhoz és a konfigurációk beállításához https://www.liquibase.org/get-started/quickstart itt található információ.

Az egyes adatbázis-kezelőkön a nevüknek megfelelő mappa tartalmát futtattam.

A Jenkins CI automatizálásához a Jenkins mappában lévő xml fájlt lehet felhasználni Job készítéséhez és a képen látható módon lehet beállítani a hozzá kellő eszközt.

