# Source To Target Mapping

This document summarizes how source fields are transformed into the final monthly reporting layer.

## Mapping Overview

| Target Field | Source System | Source Table / Field | Transformation Logic |
|---|---|---|---|
| report_month | Multiple | SAP, Dynamics, local SQL month fields | Standardized to month-level reporting date |
| service_code | Dynamics / local SQL / mapping table | `service_code` and `ref_sap_cost_center_mapping.service_code` | Unified business key |
| service_name | Dynamics | `src_dynamics_service_catalog.service_name` | Direct mapping |
| service_owner | Dynamics | `src_dynamics_service_catalog.service_owner` | Direct mapping |
| service_category | Dynamics | `src_dynamics_service_catalog.service_category` | Direct mapping |
| direct_cost_usd | SAP | `src_sap_cost_postings.amount_usd` | Sum of direct postings mapped by cost center |
| shared_cost_usd | SAP + local SQL | `src_sap_cost_postings.amount_usd`, `src_sql_service_usage_monthly.active_users` | Shared postings allocated by active-user share per month |
| total_cost_usd | Derived | Direct and shared cost outputs | `direct_cost_usd + shared_cost_usd` |
| active_users | Local SQL | `src_sql_service_usage_monthly.active_users` | Direct mapping |
| usage_volume | Local SQL | `src_sql_service_usage_monthly.usage_volume` | Direct mapping |
| usage_unit | Local SQL | `src_sql_service_usage_monthly.usage_unit` | Direct mapping |
| opened_tickets | Local SQL | `src_sql_support_ticket_monthly.opened_tickets` | Direct mapping |
| resolved_tickets | Local SQL | `src_sql_support_ticket_monthly.resolved_tickets` | Direct mapping |
| sla_met_pct | Local SQL | `sla_met_tickets`, `resolved_tickets` | `sla_met_tickets / resolved_tickets * 100` |
| total_requests | Dynamics | `src_dynamics_service_requests_monthly.total_requests` | Direct mapping |
| automated_requests | Dynamics | `src_dynamics_service_requests_monthly.automated_requests` | Direct mapping |
| automation_rate_pct | Dynamics | `automated_requests`, `total_requests` | `automated_requests / total_requests * 100` |
| cost_per_user | Derived | Cost and usage fields | `total_cost_usd / active_users` |
| cost_per_ticket | Derived | Cost and support fields | `total_cost_usd / resolved_tickets` |
| tickets_per_100_users | Derived | Support and usage fields | `opened_tickets / active_users * 100` |
| service_efficiency_index | Derived | Cost, active users, ticket intensity | `((active_users / total_cost_usd) * 1000) / (1 + tickets_per_100_users)` |

## Transformation Rules

### Rule 1: Standardize Service Codes

All sources must align to the common service key:

- `VPN`
- `CLOUD_STORAGE`
- `EMAIL`
- `IDENTITY_ACCESS`
- `SERVICE_DESK`

### Rule 2: Separate Direct And Shared SAP Cost

SAP postings are split into:

- direct service cost, mapped from service cost centers
- shared cost, posted to a common cost center and allocated downstream

### Rule 3: Allocate Shared Cost Transparently

The allocation driver in this sample is monthly active users. This supports a simple and explainable cost distribution for management reporting.

### Rule 4: Keep Usage Units Service-Specific

Usage is not forced into a false common unit. Instead, the final reporting layer preserves the service-appropriate usage unit while enabling common financial comparison through cost-based KPIs.

## Exclusions

The sample model intentionally excludes:

- detailed ticket-level drill-down
- invoice-level vendor reconciliation
- daily event granularity
- chargeback logic to business departments

These would be valid next steps in a production implementation, but they are not required for a management-facing portfolio showcase.
