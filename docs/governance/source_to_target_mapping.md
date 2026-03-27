# Quell-zu-Ziel-Mapping

Dieses Dokument beschreibt, wie Quellfelder in die finale monatliche Reporting-Schicht überführt werden.

## Mapping-Übersicht

| Zielfeld | Quellsystem | Quelltabelle / Feld | Transformationslogik |
|---|---|---|---|
| report_month | Mehrere | Monatsfelder aus SAP, Dynamics und lokalen SQL-Quellen | Standardisierung auf einen Reporting-Monat |
| service_code | Dynamics / lokale SQL / Mapping-Tabelle | `service_code` und `ref_sap_cost_center_mapping.service_code` | Einheitlicher fachlicher Schlüssel |
| service_name | Dynamics | `src_dynamics_service_catalog.service_name` | Direkte Zuordnung |
| service_owner | Dynamics | `src_dynamics_service_catalog.service_owner` | Direkte Zuordnung |
| service_category | Dynamics | `src_dynamics_service_catalog.service_category` | Direkte Zuordnung |
| direct_cost_usd | SAP | `src_sap_cost_postings.amount_usd` | Summe direkt zugeordneter Buchungen pro Cost Center |
| shared_cost_usd | SAP + lokale SQL | `src_sap_cost_postings.amount_usd`, `src_sql_service_usage_monthly.active_users` | Allokation gemeinsamer Buchungen anhand des Anteils aktiver User pro Monat |
| total_cost_usd | Abgeleitet | Ergebnisse aus direkter und gemeinsamer Kostenlogik | `direct_cost_usd + shared_cost_usd` |
| active_users | Lokale SQL | `src_sql_service_usage_monthly.active_users` | Direkte Zuordnung |
| usage_volume | Lokale SQL | `src_sql_service_usage_monthly.usage_volume` | Direkte Zuordnung |
| usage_unit | Lokale SQL | `src_sql_service_usage_monthly.usage_unit` | Direkte Zuordnung |
| opened_tickets | Lokale SQL | `src_sql_support_ticket_monthly.opened_tickets` | Direkte Zuordnung |
| resolved_tickets | Lokale SQL | `src_sql_support_ticket_monthly.resolved_tickets` | Direkte Zuordnung |
| sla_met_pct | Lokale SQL | `sla_met_tickets`, `resolved_tickets` | `sla_met_tickets / resolved_tickets * 100` |
| total_requests | Dynamics | `src_dynamics_service_requests_monthly.total_requests` | Direkte Zuordnung |
| automated_requests | Dynamics | `src_dynamics_service_requests_monthly.automated_requests` | Direkte Zuordnung |
| automation_rate_pct | Dynamics | `automated_requests`, `total_requests` | `automated_requests / total_requests * 100` |
| cost_per_user | Abgeleitet | Kosten- und Nutzungsfelder | `total_cost_usd / active_users` |
| cost_per_ticket | Abgeleitet | Kosten- und Supportfelder | `total_cost_usd / resolved_tickets` |
| tickets_per_100_users | Abgeleitet | Support- und Nutzungsfelder | `opened_tickets / active_users * 100` |
| service_efficiency_index | Abgeleitet | Kosten, aktive User und Ticketintensität | `((active_users / total_cost_usd) * 1000) / (1 + tickets_per_100_users)` |

## Transformationsregeln

### Regel 1: Service-Codes standardisieren

Alle Quellen müssen auf den gemeinsamen Service-Schlüssel ausgerichtet werden:

- `VPN`
- `CLOUD_STORAGE`
- `EMAIL`
- `IDENTITY_ACCESS`
- `SERVICE_DESK`

### Regel 2: Direkte und Shared SAP Costs trennen

SAP-Buchungen werden in zwei Gruppen aufgeteilt:

- direkte Servicekosten, die aus servicebezogenen Cost Centern gemappt werden
- Shared Costs, die auf einem gemeinsamen Cost Center liegen und nachgelagert verteilt werden

### Regel 3: Shared Costs transparent allokieren

Der Allokationstreiber in diesem Beispiel sind aktive User pro Monat. Das ermöglicht eine einfache und nachvollziehbare Kostenverteilung für Management-Reporting.

### Regel 4: Nutzungsmaße service-spezifisch belassen

Die Nutzung wird nicht künstlich in eine gemeinsame Einheit überführt. Stattdessen behält die finale Reporting-Schicht die jeweils passende Nutzungslogik des Services bei und ermöglicht den Vergleich über kostenbasierte KPIs.

## Nicht abgedeckte Themen

Das Beispielmodell schließt bewusst Folgendes aus:

- detaillierte Ticket-Drill-downs auf Einzelfallebene
- vendor- oder rechnungsbezogene Abstimmungen
- tägliche Event-Granularität
- Chargeback-Logik auf Fachbereichsebene

Diese Punkte wären in einer produktiven Lösung sinnvolle nächste Ausbaustufen, sind für ein managementorientiertes Portfolio-Showcase jedoch nicht zwingend erforderlich.
