# Power BI Dashboard Concept

## Dashboard Goal

Provide a compact management dashboard that makes IT services comparable on cost, usage, and operational efficiency.

## Target Audience

- CFO and finance business partners
- CIO and IT leadership
- service owners

## Recommended Report Pages

## 1. Executive Overview

Purpose:
Present the core portfolio view in one page.

Suggested visuals:

- KPI cards:
  - total IT service cost
  - total active users
  - total opened tickets
  - portfolio average cost per user
- clustered column chart: total cost by service
- line chart: monthly total cost trend
- scatter chart: cost per user versus tickets per 100 users
- matrix: service with direct cost, shared cost, cost per user, cost per ticket, efficiency index

## 2. Service Deep Dive

Purpose:
Allow a manager to inspect one service over time.

Suggested visuals:

- line chart: total cost, active users, and tickets by month
- decomposition tree: total cost by cost bucket
- bar chart: request automation rate by month
- gauge or KPI: availability percentage

## 3. Support And Efficiency

Purpose:
Focus on support burden and operational leverage.

Suggested visuals:

- bar chart: opened tickets by service
- bar chart: cost per ticket by service
- line chart: tickets per 100 users trend
- table: service owner, SLA %, automation rate, efficiency index

## 4. Cost Allocation Transparency

Purpose:
Show how much cost is direct versus shared.

Suggested visuals:

- stacked column chart: direct cost vs shared cost by service
- waterfall chart: total shared cost allocation by service
- table: allocation driver and monthly active-user share

## Core Filters

- reporting month
- service
- service owner
- service category

## Design Notes

- use business-friendly labels, not technical table names
- highlight exceptions in amber and red
- keep finance views and operational views on the same semantic model
- provide tooltip explanations for complex KPIs such as efficiency index

## Data Model Recommendation

Suggested Power BI model:

- Fact table:
  - `vw_bi_service_monthly`
- Supporting summary table:
  - `vw_bi_service_summary`
- Date dimension:
  - separate calendar table in Power BI

## Storyline For A Hiring Manager

The report should make it easy to tell a simple story:

1. where money is going
2. how much business demand each service supports
3. where support burden is high
4. which services look efficient or require action
