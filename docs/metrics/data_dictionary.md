# Data Dictionary

This data dictionary covers the primary source entities and the final reporting mart used by Power BI.

## Source Table: `src_sap_cost_postings`

| Field | Type | Description |
|---|---|---|
| posting_id | integer | Unique posting identifier |
| posting_month | date | Reporting month of the posting |
| company_code | varchar(10) | SAP company code |
| cost_center | varchar(50) | Cost center that owns the posting |
| gl_account | varchar(20) | G/L account used for financial classification |
| cost_element_name | varchar(100) | Readable description of the posting |
| vendor_name | varchar(100) | Optional external vendor |
| amount_usd | numeric(12,2) | Posting amount in USD |

## Source Table: `src_dynamics_service_catalog`

| Field | Type | Description |
|---|---|---|
| service_code | varchar(20) | Standard service identifier used across the model |
| service_name | varchar(100) | Business-facing service name |
| service_owner | varchar(100) | Accountable service owner |
| service_category | varchar(50) | Category such as Collaboration or Security |
| unit_of_measure | varchar(50) | Reporting usage unit for the service |
| business_criticality | varchar(20) | Criticality rating used for context |
| capacity_users | integer | Approximate service design capacity |

## Source Table: `src_dynamics_service_requests_monthly`

| Field | Type | Description |
|---|---|---|
| request_month | date | Reporting month |
| service_code | varchar(20) | Service identifier |
| total_requests | integer | Total requests recorded in Dynamics |
| automated_requests | integer | Requests fulfilled automatically |
| avg_fulfillment_hours | numeric(10,2) | Average time to fulfill a request |

## Source Table: `src_sql_service_usage_monthly`

| Field | Type | Description |
|---|---|---|
| usage_month | date | Reporting month |
| service_code | varchar(20) | Service identifier |
| active_users | integer | Number of active users for the month |
| usage_volume | numeric(18,2) | Service-specific usage volume |
| usage_unit | varchar(50) | Unit for the usage volume |
| availability_pct | numeric(5,2) | Monthly availability percentage |

## Source Table: `src_sql_support_ticket_monthly`

| Field | Type | Description |
|---|---|---|
| ticket_month | date | Reporting month |
| service_code | varchar(20) | Service identifier |
| opened_tickets | integer | Tickets opened in the month |
| resolved_tickets | integer | Tickets resolved in the month |
| sla_met_tickets | integer | Resolved tickets achieved within SLA |
| major_incidents | integer | Count of major incidents in the month |
| backlog_tickets | integer | Open ticket backlog at month end |

## Reference Table: `ref_sap_cost_center_mapping`

| Field | Type | Description |
|---|---|---|
| cost_center | varchar(50) | Cost center from SAP |
| service_code | varchar(20) | Target service code; null for shared cost |
| cost_bucket | varchar(50) | Cost classification such as Labor or Hosting |
| allocation_method | varchar(30) | `DIRECT` or `ACTIVE_USERS` |

## Reporting View: `vw_bi_service_monthly`

| Field | Type | Description |
|---|---|---|
| report_month | date | Month shown in Power BI |
| service_code | varchar(20) | Standard service identifier |
| service_name | varchar(100) | Business service name |
| service_owner | varchar(100) | Accountable owner |
| service_category | varchar(50) | Service grouping |
| total_cost_usd | numeric(14,2) | Total monthly cost including shared allocation |
| direct_cost_usd | numeric(14,2) | Directly assigned cost only |
| shared_cost_usd | numeric(14,2) | Allocated shared cost |
| active_users | integer | Monthly active users |
| usage_volume | numeric(18,2) | Service-specific usage metric |
| usage_unit | varchar(50) | Unit of measure for usage |
| opened_tickets | integer | Tickets opened in the month |
| resolved_tickets | integer | Tickets resolved in the month |
| sla_met_pct | numeric(6,2) | SLA achievement percentage |
| total_requests | integer | Request volume from Dynamics |
| automated_requests | integer | Automated request count |
| automation_rate_pct | numeric(6,2) | Share of automated requests |
| availability_pct | numeric(6,2) | Service availability percentage |
| cost_per_user | numeric(14,2) | Total cost divided by active users |
| cost_per_ticket | numeric(14,2) | Total cost divided by resolved tickets |
| tickets_per_100_users | numeric(14,2) | Ticket intensity relative to user base |
| service_efficiency_index | numeric(14,2) | Portfolio efficiency indicator |

## Business Key Standard

The central business key is `service_code`. Every source is aligned to this identifier before reporting outputs are created.
