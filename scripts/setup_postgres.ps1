param(
    [string]$ComposeFile = "docker-compose.yml",
    [string]$ContainerName = "it-service-analytics-postgres",
    [string]$DatabaseName = "it_service_analytics",
    [string]$DbUser = "postgres"
)

$ErrorActionPreference = "Stop"

function Invoke-ContainerSql {
    param(
        [string]$SqlFile
    )

    Write-Host "Lade SQL-Datei: $SqlFile"
    Get-Content $SqlFile -Raw |
        docker exec -i $ContainerName psql -U $DbUser -d $DatabaseName -v ON_ERROR_STOP=1
}

Write-Host "Starte PostgreSQL-Container..."
docker compose -f $ComposeFile up -d postgres | Out-Host

Write-Host "Warte auf PostgreSQL..."
for ($i = 0; $i -lt 60; $i++) {
    docker exec $ContainerName pg_isready -U $DbUser -d $DatabaseName | Out-Null
    if ($LASTEXITCODE -eq 0) {
        break
    }
    Start-Sleep -Seconds 2
}

docker exec $ContainerName pg_isready -U $DbUser -d $DatabaseName | Out-Host
if ($LASTEXITCODE -ne 0) {
    throw "PostgreSQL ist nicht erreichbar."
}

Invoke-ContainerSql -SqlFile "sql/01_source_schema.sql"
Invoke-ContainerSql -SqlFile "sql/02_sample_data.sql"
Invoke-ContainerSql -SqlFile "sql/03_transformations.sql"
Invoke-ContainerSql -SqlFile "sql/04_reporting_views.sql"

Write-Host ""
Write-Host "PostgreSQL ist bereit."
Write-Host "Host: localhost"
Write-Host "Port: 5432"
Write-Host "Datenbank: $DatabaseName"
Write-Host "Benutzer: $DbUser"
Write-Host "Passwort: postgres"
