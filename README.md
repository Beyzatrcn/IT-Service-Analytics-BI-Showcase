# IT Service Analytics BI Showcase

Dieses Repository zeigt beispielhaft, wie eine BI-Landschaft zur Analyse von IT-Services aus Sicht von Finance, Management und Service-Steuerung in einem Schweizer Unternehmenskontext aufgebaut werden kann.

Das Szenario ist vollständig fiktiv und verwendet ausschließlich Dummy-Daten. Ziel ist es, Transparenz über Kosten, Nutzung und Effizienz zentraler IT-Services zu schaffen.

## Zielsetzung

Das Repository demonstriert einen durchgängigen BI-Ansatz von den Quellsystemen bis zur Management-Auswertung:

- fachliche Einordnung des Business Cases
- Definition zentraler KPIs
- Zuordnung und Dokumentation der Quelldaten
- SQL-basierte Transformationen und Reporting Views
- Power-BI-Konzept für Management-Reporting
- Governance-, Datenqualitäts- und Kostenallokationslogik

## Fachlicher Kontext

Im Beispiel möchte ein fiktives Unternehmen mit Sitz in der Schweiz verstehen, wie sich zentrale IT-Services hinsichtlich Kosten, Nutzung und operativer Effizienz entwickeln.

Betrachtet werden fünf Beispiel-Services:

- VPN
- Cloud Storage
- Email
- Identity & Access
- Service Desk

Typische Management-Fragen sind:

- Welche Services verursachen die höchsten Kosten?
- Welche Services erzeugen die höchste operative Belastung?
- Wie entwickeln sich Kosten im Verhältnis zur Nutzung?
- Welche Services wirken effizient und wo besteht Handlungsbedarf?

## Quellsysteme

Das Beispiel orientiert sich an einer realistischen Systemlandschaft:

- SAP liefert Finanzdaten und Kostenbuchungen
- Microsoft Dynamics liefert Servicekatalog- und Prozesskontext
- lokale SQL-Datenbanken liefern Nutzungs- und Supportdaten

## KPI-Umfang

Die wichtigsten KPIs in diesem Repository sind:

- Kosten pro Service
- Nutzung pro Service
- Kosten pro User
- Tickets pro Service
- Kosten pro Ticket
- Service Efficiency Index

Alle Finanzwerte im Repository werden in Schweizer Franken (CHF) dargestellt.

## Repository-Struktur

```text
IT-Service-Analytics-BI-Showcase/
|-- README.md
|-- docs/
|   |-- business-context/
|   |   |-- 01_case_overview.md
|   |   `-- 02_stakeholder_questions.md
|   |-- governance/
|   |   |-- data_governance_and_quality.md
|   |   `-- source_to_target_mapping.md
|   |-- management/
|   |   `-- management_summary.md
|   |-- metrics/
|   |   |-- data_dictionary.md
|   |   `-- kpi_definitions.md
|   |-- architecture/
|   |   |-- architecture_overview.md
|   |   `-- it_service_bi_architecture.svg
|   |-- powerbi/
|   |   |-- dashboard_concept.md
|   |   |-- dax_measures.md
|   |   `-- powerbi_connection.md
|   `-- sap/
|       `-- sap_cost_mapping_logic.md
|-- scripts/
|   `-- setup_postgres.ps1
|-- docker-compose.yml
`-- sql/
    |-- 01_source_schema.sql
    |-- 02_sample_data.sql
    |-- 03_transformations.sql
    `-- 04_reporting_views.sql
```

## End-to-End-Datenfluss

1. SAP-Kostenbuchungen werden per Cost-Center-Logik Services zugeordnet.
2. Gemeinkosten werden über aktive User auf Services verteilt.
3. Dynamics liefert Servicekontext, Verantwortlichkeiten und Request-Informationen.
4. Lokale SQL-Quellen liefern Nutzungs- und Ticketdaten auf Monatsebene.
5. SQL-Transformationen erzeugen ein konsolidiertes Service-Monatsmodell.
6. Reporting Views stellen die Daten für Power BI bereit.

## Lokales PostgreSQL-Setup fuer Power BI

Das Repository enthaelt eine lokale PostgreSQL-Umgebung auf Docker-Basis. Damit kann Power BI direkt auf die Reporting Views zugreifen.

Start der Datenbank und Laden aller SQL-Dateien:

```powershell
.\scripts\setup_postgres.ps1
```

Verbindungsdaten fuer Power BI:

- Host: `localhost`
- Port: `5432`
- Datenbank: `it_service_analytics`
- Benutzer: `postgres`
- Passwort: `postgres`

## Zentrale Designprinzipien

- fachlich verständliche Benennung und KPI-Definitionen
- transparente Logik für Shared-Cost-Allokation
- nachvollziehbare und realistische SQL-Modellierung
- Management-orientierte Reporting-Ausgabe
- ausschließlich fiktive Daten mit plausibler Struktur

## Nutzung des Repositorys

1. Zuerst die fachlichen Dokumente in `docs/` lesen.
2. Danach die SQL-Dateien in dieser Reihenfolge ausführen:
   1. `sql/01_source_schema.sql`
   2. `sql/02_sample_data.sql`
   3. `sql/03_transformations.sql`
   4. `sql/04_reporting_views.sql`
3. Anschließend Power BI mit den finalen Reporting Views verbinden.
4. Die DAX-Beispiele als Ausgangspunkt für das Reporting-Modell verwenden.

## Inhaltliche Schwerpunkte

Dieses Repository zeigt insbesondere:

- einen End-to-End-BI-Ansatz von Quellsystemen bis Reporting
- die Verknüpfung von Finance-, Service-Management- und Nutzungsdaten
- klar definierte KPIs für Management-Transparenz
- realistische SQL-Transformationen und Reporting Views
- dokumentierte Governance-, Mapping- und Datenqualitätslogik

## Hinweis

Alle Daten, Ergebnisse, Annahmen und fachlichen Inhalte in diesem Repository sind fiktiv und dienen ausschließlich Portfolio-Zwecken.

