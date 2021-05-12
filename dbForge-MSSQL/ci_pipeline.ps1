clear;

$serverName = "localhost"
$databaseName = "AdventureWorks2016Test"


$migrationScriptsFolder = "C:\Users\dnagykrisztina\Desktop\Szakdolgozat\devart-MSSQL\git\DBDevOps\"
$unitTestsFolder = "C:\Users\dnagykrisztina\Desktop\Szakdolgozat\devart-MSSQL\UnitTest\"


$generatorFile = "C:\Users\dnagykrisztina\Desktop\Szakdolgozat\devart-MSSQL\Data\AdventureWorks2016.dgen"

$publishFileName = "Test.DevOpsAutomation.Database"
$publishOutputFolder = "C:\Users\dnagykrisztina\Desktop\Szakdolgozat\devart-MSSQL\NuGet\"



Function check {
    param($result)

    if ($result) {
        Write-Host "Success" -ForegroundColor Green; Write-host ""
    }
    else {
        Write-Host "Failed" -ForegroundColor Red;
        Exit(1)
    }
}



# Create database connection
Write-Host "Creating database connection..."
$connection = New-DevartSqlDatabaseConnection -Server $serverName -Database $databaseName -U sa -P 'TestPass123!'


# Test database connection
Write-Host "Testing database connection..."
$result = Test-DevartDatabaseConnection -Connection $connection;
check($result)


# Recreating database
Write-Host "Recreating database..."
$result = Invoke-DevartDatabaseBuild -SourceScriptsFolder $migrationScriptsFolder -Connection $connection
check($result)


# Fill database with sample data and run unit tests
Write-Host "Filling database with sample data and running unit tests..."
$result = Invoke-DevartDatabaseTests -InputObject $connection -InstalltSQLtFramework -IncludeTestData -DataGeneratorProject $generatorFile
check($result)


# Publish project
Write-Host "Publishing project..."
$project= New-DevartDatabaseProject $migrationScriptsFolder
Set-DevartPackageInfo -Project $project -Id $publishFileName -Version 3.0.0
Publish-DevartDatabaseProject -Project $project -Repository $publishOutputFolder -AutoIncrementVersion
check($result)