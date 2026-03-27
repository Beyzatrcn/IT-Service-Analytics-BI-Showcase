# DAX Measure Examples

The examples below assume the main fact table in Power BI is named `'Service Monthly'` and is sourced from `vw_bi_service_monthly`.

## Core Financial Measures

```DAX
Total Cost :=
SUM ( 'Service Monthly'[total_cost_usd] )
```

```DAX
Direct Cost :=
SUM ( 'Service Monthly'[direct_cost_usd] )
```

```DAX
Shared Cost :=
SUM ( 'Service Monthly'[shared_cost_usd] )
```

## Usage And Support Measures

```DAX
Total Active Users :=
SUM ( 'Service Monthly'[active_users] )
```

```DAX
Total Opened Tickets :=
SUM ( 'Service Monthly'[opened_tickets] )
```

```DAX
Total Resolved Tickets :=
SUM ( 'Service Monthly'[resolved_tickets] )
```

## KPI Measures

```DAX
Cost per User :=
DIVIDE ( [Total Cost], [Total Active Users] )
```

```DAX
Cost per Ticket :=
DIVIDE ( [Total Cost], [Total Resolved Tickets] )
```

```DAX
Tickets per 100 Users :=
DIVIDE ( [Total Opened Tickets], [Total Active Users] ) * 100
```

```DAX
Automation Rate % :=
DIVIDE (
    SUM ( 'Service Monthly'[automated_requests] ),
    SUM ( 'Service Monthly'[total_requests] )
) * 100
```

```DAX
Average SLA % :=
AVERAGE ( 'Service Monthly'[sla_met_pct] )
```

```DAX
Average Service Efficiency Index :=
AVERAGE ( 'Service Monthly'[service_efficiency_index] )
```

## Trend Measures

```DAX
Previous Month Cost :=
CALCULATE (
    [Total Cost],
    DATEADD ( 'Calendar'[Date], -1, MONTH )
)
```

```DAX
Cost Variance vs Previous Month :=
[Total Cost] - [Previous Month Cost]
```

```DAX
Cost Variance % vs Previous Month :=
DIVIDE ( [Cost Variance vs Previous Month], [Previous Month Cost] )
```

## Portfolio Ranking Measures

```DAX
Service Cost Rank :=
RANKX (
    ALL ( 'Service Monthly'[service_name] ),
    [Total Cost],
    ,
    DESC
)
```

```DAX
Highest Cost Service :=
TOPN (
    1,
    VALUES ( 'Service Monthly'[service_name] ),
    [Total Cost],
    DESC
)
```

## Interpretation Guidance

- `Cost per User` supports finance comparison across services with broad employee reach.
- `Cost per Ticket` should be read together with ticket complexity and service criticality.
- `Average Service Efficiency Index` is best used as a directional management signal, not a replacement for operational root-cause analysis.
