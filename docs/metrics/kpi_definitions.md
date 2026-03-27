# KPI Definitions

## KPI Design Principles

The KPIs in this showcase are intentionally simple, transparent, and management-friendly. They are designed to support discussion and prioritization rather than replace detailed operational reporting.

## Core KPIs

| KPI | Business Definition | Formula | Interpretation |
|---|---|---|---|
| Cost per Service | Total monthly cost attributed to a service | `Direct Cost + Allocated Shared Cost` | Shows total financial footprint of a service |
| Usage per Service | Monthly business consumption of a service | `Usage Volume` | Shows service demand in the unit that best fits the service |
| Cost per User | Total service cost divided by active users | `Total Cost / Active Users` | Shows affordability of a service relative to the user base |
| Tickets per Service | Monthly support workload by service | `Opened Tickets` | Shows operational support burden |
| Cost per Ticket | Total service cost divided by resolved tickets | `Total Cost / Resolved Tickets` | Shows how much cost sits behind each resolved support case |
| Tickets per 100 Users | Ticket intensity normalized by user base | `(Opened Tickets / Active Users) * 100` | Allows comparison between services of different size |
| Automation Rate | Share of service requests handled automatically | `Automated Requests / Total Requests` | Indicates process maturity and operational leverage |
| Service Efficiency Index | Lightweight blended indicator of value versus cost and support burden | `((Active Users / Total Cost) * 1000) / (1 + Tickets per 100 Users)` | Higher values indicate better reach at lower cost and lower support pressure |

## KPI Notes

### Cost Per Service

This KPI includes both direct service cost and an allocated share of common IT overhead. It is intended for management transparency, not statutory accounting.

### Usage Per Service

Usage is intentionally service-specific:

- VPN: average monthly active users
- Cloud Storage: terabytes stored
- Email: messages processed
- Identity & Access: provisioning events
- Service Desk: requests handled

### Cost Per User

This KPI is especially relevant for workplace services and allows a finance audience to compare efficiency across services with broad employee reach.

### Cost Per Ticket

This metric is helpful for support-heavy services, but it should always be interpreted alongside:

- service criticality
- service complexity
- automation potential

### Service Efficiency Index

The efficiency index is a portfolio KPI rather than a finance accounting measure. It is useful because it combines:

- business reach
- cost
- support intensity

It should be used for directional comparison, not as a stand-alone decision rule.

## Suggested Threshold Logic

| KPI | Green | Amber | Red |
|---|---|---|---|
| Cost per User | Stable or decreasing | Up to 5% above baseline | More than 5% above baseline |
| Tickets per 100 Users | Below target | Slightly above target | Materially above target |
| Automation Rate | Improving trend | Flat trend | Declining trend |
| Service Efficiency Index | Above portfolio average | Near portfolio average | Below portfolio average |

## Ownership

| KPI | Primary Owner | Secondary Owner |
|---|---|---|
| Cost per Service | Finance BI | Service Owner |
| Cost per User | Finance BI | IT Leadership |
| Tickets per Service | Service Operations | Service Owner |
| Cost per Ticket | Finance BI | Service Operations |
| Service Efficiency Index | BI / Management Reporting | CIO Office |
