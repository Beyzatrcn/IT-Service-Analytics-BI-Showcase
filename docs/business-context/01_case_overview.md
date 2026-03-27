# Case Overview

## Scenario

A fictional mid-sized enterprise operates a shared internal IT organization that delivers core workplace and support services across the business. Finance and management want better visibility into how IT service spending translates into business usage and operational effort.

The current reporting landscape is fragmented:

- SAP contains the financial truth for IT spend
- Microsoft Dynamics contains service catalog and request management context
- Local SQL databases contain service usage and support activity

As a result, managers can see isolated metrics, but they cannot easily answer integrated questions such as:

- Which services are most expensive relative to their user base?
- Which services create a disproportionate support burden?
- Where is cost rising faster than business demand?
- Which services are efficient enough to scale further?

## BI Objective

Build a simple, management-ready reporting model that combines cost, usage, and operational workload for key IT services.

The target audience is:

- CFO and finance business partners
- CIO and IT leadership
- Service owners
- Operations managers

## Analytical Scope

This showcase focuses on five example services:

- VPN
- Cloud Storage
- Email
- Identity & Access
- Service Desk

The reporting model covers:

- monthly service cost
- monthly usage volume
- user base by service
- support ticket volume
- request automation indicators
- derived efficiency KPIs

## Source Systems In Scope

### SAP

Used as the source for financial postings, including:

- direct service cost
- internal labor
- software subscriptions
- infrastructure or hosting charges
- shared IT overhead

### Microsoft Dynamics

Used as the source for:

- service catalog attributes
- service owner information
- request activity summaries
- operational context for automation and fulfillment

### Local SQL Databases

Used as the source for:

- monthly service usage metrics
- monthly support ticket metrics

## Solution Approach

The BI design follows a pragmatic pattern:

1. Standardize service identifiers across systems.
2. Map SAP cost centers to services and cost buckets.
3. Allocate shared IT costs using a transparent driver.
4. Join cost, usage, and support activity into a monthly mart.
5. Expose business-friendly reporting views for Power BI.

## Assumptions

- All values in this repository are dummy data.
- Currency is represented in USD for simplicity.
- Shared cost is allocated by active-user share.
- Monthly granularity is sufficient for management reporting.
- The sample SQL uses a PostgreSQL-style syntax for readability.

## Expected Business Value

With this model, management can:

- compare services on a common business reporting basis
- identify services with rising cost pressure
- challenge support-heavy processes
- prioritize automation or contract optimization
- improve budget discussions with service-level evidence
