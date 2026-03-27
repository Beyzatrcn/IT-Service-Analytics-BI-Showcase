# Datenkatalog

Dieser Datenkatalog beschreibt die wichtigsten Quellentitäten sowie den finalen Reporting Mart für Power BI.

## Quelltabelle: `src_sap_cost_postings`

| Feld | Typ | Beschreibung |
|---|---|---|
| posting_id | integer | Eindeutige ID der Buchung |
| posting_month | date | Reporting-Monat der Buchung |
| company_code | varchar(10) | SAP-Buchungskreis |
| cost_center | varchar(50) | Cost Center, dem die Buchung zugeordnet ist |
| gl_account | varchar(20) | Sachkonto zur finanziellen Klassifikation |
| cost_element_name | varchar(100) | Lesbare Beschreibung der Buchung |
| vendor_name | varchar(100) | Optionaler externer Lieferant |
| amount_chf | numeric(12,2) | Buchungsbetrag in CHF |

## Quelltabelle: `src_dynamics_service_catalog`

| Feld | Typ | Beschreibung |
|---|---|---|
| service_code | varchar(20) | Standardisierter Service-Identifier im gesamten Modell |
| service_name | varchar(100) | Fachlicher Service-Name |
| service_owner | varchar(100) | Verantwortlicher Service Owner |
| service_category | varchar(50) | Kategorie, zum Beispiel Collaboration oder Security |
| unit_of_measure | varchar(50) | Reporting-Einheit für die Nutzung |
| business_criticality | varchar(20) | Kritikalität zur fachlichen Einordnung |
| capacity_users | integer | Näherungswert für die Service-Kapazität in Usern |

## Quelltabelle: `src_dynamics_service_requests_monthly`

| Feld | Typ | Beschreibung |
|---|---|---|
| request_month | date | Reporting-Monat |
| service_code | varchar(20) | Service-Identifier |
| total_requests | integer | Gesamtzahl der in Dynamics erfassten Requests |
| automated_requests | integer | Automatisch erfüllte Requests |
| avg_fulfillment_hours | numeric(10,2) | Durchschnittliche Erfüllungszeit in Stunden |

## Quelltabelle: `src_sql_service_usage_monthly`

| Feld | Typ | Beschreibung |
|---|---|---|
| usage_month | date | Reporting-Monat |
| service_code | varchar(20) | Service-Identifier |
| active_users | integer | Anzahl aktiver User im Monat |
| usage_volume | numeric(18,2) | Service-spezifisches Nutzungsvolumen |
| usage_unit | varchar(50) | Einheit des Nutzungsvolumens |
| availability_pct | numeric(5,2) | Monatliche Verfügbarkeit in Prozent |

## Quelltabelle: `src_sql_support_ticket_monthly`

| Feld | Typ | Beschreibung |
|---|---|---|
| ticket_month | date | Reporting-Monat |
| service_code | varchar(20) | Service-Identifier |
| opened_tickets | integer | Im Monat eröffnete Tickets |
| resolved_tickets | integer | Im Monat gelöste Tickets |
| sla_met_tickets | integer | Innerhalb SLA gelöste Tickets |
| major_incidents | integer | Anzahl schwerwiegender Incidents im Monat |
| backlog_tickets | integer | Offener Ticketbestand zum Monatsende |

## Referenztabelle: `ref_sap_cost_center_mapping`

| Feld | Typ | Beschreibung |
|---|---|---|
| cost_center | varchar(50) | Cost Center aus SAP |
| service_code | varchar(20) | Ziel-Service-Code; null bei Shared Cost |
| cost_bucket | varchar(50) | Kostenklassifikation, zum Beispiel Labor oder Hosting |
| allocation_method | varchar(30) | `DIRECT` oder `ACTIVE_USERS` |

## Reporting View: `vw_bi_service_monthly`

| Feld | Typ | Beschreibung |
|---|---|---|
| report_month | date | In Power BI angezeigter Monat |
| service_code | varchar(20) | Standardisierter Service-Identifier |
| service_name | varchar(100) | Fachlicher Service-Name |
| service_owner | varchar(100) | Verantwortlicher Owner |
| service_category | varchar(50) | Service-Gruppe |
| total_cost_chf | numeric(14,2) | Gesamtkosten des Monats inklusive Shared-Cost-Allokation |
| direct_cost_chf | numeric(14,2) | Nur direkt zugeordnete Kosten |
| shared_cost_chf | numeric(14,2) | Allokierte Shared Costs |
| active_users | integer | Aktive User im Monat |
| usage_volume | numeric(18,2) | Service-spezifische Nutzungskennzahl |
| usage_unit | varchar(50) | Maßeinheit der Nutzung |
| opened_tickets | integer | Im Monat eröffnete Tickets |
| resolved_tickets | integer | Im Monat gelöste Tickets |
| sla_met_pct | numeric(6,2) | SLA-Erfüllungsquote in Prozent |
| total_requests | integer | Request-Volumen aus Dynamics |
| automated_requests | integer | Anzahl automatisierter Requests |
| automation_rate_pct | numeric(6,2) | Anteil automatisierter Requests |
| availability_pct | numeric(6,2) | Service-Verfügbarkeit in Prozent |
| cost_per_user | numeric(14,2) | Gesamtkosten geteilt durch aktive User |
| cost_per_ticket | numeric(14,2) | Gesamtkosten geteilt durch gelöste Tickets |
| tickets_per_100_users | numeric(14,2) | Ticketintensität relativ zur Nutzerbasis |
| service_efficiency_index | numeric(14,2) | Portfolio-Kennzahl zur Service-Effizienz |

## Standard des fachlichen Schlüssels

Der zentrale fachliche Schlüssel ist `service_code`. Alle Quellen werden vor der Reporting-Erstellung auf diesen Identifier ausgerichtet.

