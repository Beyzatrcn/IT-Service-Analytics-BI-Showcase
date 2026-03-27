# Data Governance And Quality

## Governance Objective

The purpose of governance in this showcase is to make the reporting model:

- trusted by finance and management
- understandable for business stakeholders
- sustainable for repeated monthly refreshes

## Role Model

| Role | Responsibility |
|---|---|
| Finance BI Analyst | Owns KPI definitions, reporting logic, and business validation |
| SAP Data Owner | Ensures financial postings and cost center assignments are complete |
| Dynamics Service Manager | Maintains the service catalog and request process metadata |
| IT Operations Analyst | Validates usage and support extracts from local SQL databases |
| Service Owner | Reviews service-level KPI interpretation and improvement actions |

## Core Governance Rules

### Master Data Governance

- `service_code` is the mandatory cross-system business key
- service names must remain business-friendly and stable over time
- each service must have one accountable owner in the service catalog

### Financial Governance

- SAP remains the system of record for cost
- shared cost allocation is documented separately from direct cost
- allocation logic must be consistent month over month unless formally changed

### KPI Governance

- KPI definitions must be version controlled
- any KPI formula change must be communicated before reporting release
- Power BI labels must exactly match documented KPI names

## Data Quality Checks

| Check | Rule | Action On Failure |
|---|---|---|
| Missing service code | No source record may enter the mart without a valid service code | Reject row and log for remediation |
| Duplicate monthly service row | One row per service per month per source summary | Investigate source extract |
| Negative active users | Active users must be zero or positive | Block load |
| Resolved tickets > opened tickets by large margin | Validate summary extract consistency | Review with operations owner |
| Automated requests > total requests | Not allowed | Block load |
| Unmapped SAP cost center | Every posting must map to direct or shared logic | Hold posting in exception queue |
| SLA count > resolved tickets | Not allowed | Block load |

## Refresh Cadence

- Recommended refresh frequency: monthly
- Suggested timeline:
  - Day 1 to 3: SAP close data available
  - Day 2 to 4: Dynamics and local SQL extracts refreshed
  - Day 4 to 5: BI transformation and validation
  - Day 5: management dashboard publication

## Known Design Limitations

- Shared cost is allocated using a single driver for clarity
- Usage is summarized monthly, not daily
- The sample does not include departmental chargeback or budgeting logic
- The model is designed for management transparency, not financial accounting close

## Recommended Future Enhancements

- Introduce cost center exception handling workflow
- Track budget versus actual cost in the mart
- Add service-level target thresholds for red/amber/green evaluation
- Store historical KPI definition versions
- Introduce a Power BI semantic model with certified measures
