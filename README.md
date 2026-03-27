# IT Service Analytics BI Showcase

A portfolio-ready Business Intelligence repository that demonstrates how an IT service reporting environment can be designed for finance, management, and service leadership.

The scenario is fictional and uses dummy data only. It shows how financial data from SAP, operational context from Microsoft Dynamics, and usage/support data from local SQL databases can be combined to create management transparency on IT services.

## Portfolio Objective

This repository illustrates how a BI Specialist can:

- translate a management question into a structured reporting model
- connect multiple enterprise source systems into a coherent analytics layer
- define business KPIs with clear formulas and ownership
- design realistic SQL transformations and reporting views
- prepare a Power BI concept for executive consumption
- embed governance, data quality, and allocation logic into the solution

## Business Scenario

The fictional company wants to understand the cost, usage, and efficiency of five core IT services:

- VPN
- Cloud Storage
- Email
- Identity & Access
- Service Desk

Management wants to answer questions such as:

- Which services consume the highest spend?
- Which services create the highest operational workload?
- How does cost evolve relative to business usage?
- Which services look efficient, and which need action?

## Source Landscape

The showcase models a simple but realistic source architecture:

- SAP provides monthly cost postings by cost center and G/L account
- Dynamics provides service catalog context and service request activity
- Local SQL databases provide monthly usage and support ticket metrics

## KPI Scope

The main KPIs covered in this repository are:

- Cost per service
- Usage per service
- Cost per user
- Tickets per service
- Cost per ticket
- Service efficiency index

## Repository Structure

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
|   |-- powerbi/
|   |   |-- dashboard_concept.md
|   |   `-- dax_measures.md
|   `-- sap/
|       `-- sap_cost_mapping_logic.md
`-- sql/
    |-- 01_source_schema.sql
    |-- 02_sample_data.sql
    |-- 03_transformations.sql
    `-- 04_reporting_views.sql
```

## End-to-End Data Flow

1. SAP cost postings are mapped to services using cost center logic.
2. Shared IT costs are allocated to services using active-user shares.
3. Dynamics enriches services with ownership and request context.
4. Local SQL extracts provide usage and ticket volume by month.
5. SQL transformations generate a monthly service mart.
6. Reporting views expose business-ready KPI outputs for Power BI.

## Key Design Principles

- Business-first naming and definitions
- Transparent allocation logic for shared cost
- Lightweight, explainable SQL rather than over-engineered architecture
- Management-ready reporting outputs
- Dummy data only, with realistic structure and patterns

## How To Use This Repository

1. Review the business context and KPI documents in `docs/`.
2. Run the SQL files in order:
   1. `sql/01_source_schema.sql`
   2. `sql/02_sample_data.sql`
   3. `sql/03_transformations.sql`
   4. `sql/04_reporting_views.sql`
3. Connect Power BI to the final reporting views.
4. Use the DAX examples as a starting point for the dashboard model.

## What A Hiring Manager Should See

This portfolio project is designed to show:

- structured BI thinking from source to dashboard
- comfort with finance and management reporting concepts
- ability to document assumptions and governance
- practical SQL modeling skills
- clarity in stakeholder communication

## Disclaimer

All data, entities, findings, and business context in this repository are fictional and created for portfolio purposes only.
