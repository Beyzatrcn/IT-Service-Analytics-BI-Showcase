# Power-BI-Verbindung mit PostgreSQL

Dieses Showcase kann direkt aus Power BI mit einer lokalen PostgreSQL-Datenbank verbunden werden.

## Lokale Verbindungsdaten

- Host: `localhost`
- Port: `5432`
- Datenbank: `it_service_analytics`
- Benutzer: `postgres`
- Passwort: `postgres`

## Relevante Views fuer Power BI

- `vw_bi_service_monthly`
- `vw_bi_service_summary`
- `vw_bi_management_overview`

## Empfohlene Vorgehensweise in Power BI

1. In Power BI `Daten abrufen` waehlen.
2. `PostgreSQL-Datenbank` auswaehlen.
3. Server als `localhost:5432` eintragen.
4. Datenbankname `it_service_analytics` eintragen.
5. Mit Benutzername `postgres` und Passwort `postgres` verbinden.
6. Die drei Reporting Views laden.

## Initiales Setup

Zum Start der lokalen Datenbank und zum Laden der Showcase-Daten:

```powershell
.\scripts\setup_postgres.ps1
```
