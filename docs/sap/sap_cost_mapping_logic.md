# SAP Cost Mapping Logic

## Purpose

SAP postings do not always arrive in a reporting-ready service structure. This document explains how cost is translated from SAP accounting objects into service-level BI reporting.

## Mapping Strategy

The sample logic uses two layers:

1. Direct mapping from service-specific cost centers to a service code
2. Shared cost allocation for common IT overhead that cannot be directly assigned

## Cost Mapping Precedence

### 1. Direct Service Cost

If a posting belongs to a dedicated service cost center, it is assigned directly to that service.

Examples:

- `CC_VPN` -> `VPN`
- `CC_STORAGE` -> `CLOUD_STORAGE`
- `CC_EMAIL` -> `EMAIL`
- `CC_IAM` -> `IDENTITY_ACCESS`
- `CC_SVC_DESK` -> `SERVICE_DESK`

### 2. Shared IT Overhead

If a posting belongs to `CC_SHARED`, it is treated as shared cost and allocated across services using the active-user share in the same month.

This is appropriate for example costs such as:

- enterprise monitoring
- architecture overhead
- common platform administration

## Cost Buckets

The sample mapping also classifies cost into business-friendly buckets:

- Labor
- Software
- Hosting
- Shared Overhead

These buckets support management discussion without exposing overly technical SAP structures.

## Allocation Driver

The chosen allocation driver is:

`monthly active users per service / total monthly active users across all services`

This driver is simple, explainable, and easy for management to challenge or approve.

## Why Active Users?

Active users are a reasonable proxy because:

- the in-scope services are employee-facing
- management understands user-base logic intuitively
- it avoids arbitrary equal-split allocation

In a production solution, some services might require more specific drivers such as:

- storage volume
- ticket volume
- identity transactions
- server or workload consumption

## Example Allocation Logic

If shared cost in March is USD 8,100 and VPN has 860 active users out of a total 4,430, the VPN service receives:

`8,100 * (860 / 4,430) = 1,572.23 USD`

## Control Expectations

- every SAP posting must map to either a direct service or shared allocation
- mapping tables must be version controlled
- changes to allocation logic must be documented before the next reporting cycle
- direct cost and shared cost should remain separately visible in reports

## Reporting Implication

The final management dashboard should always allow users to distinguish:

- direct service spend
- shared allocated spend
- total service cost

This improves trust and prevents unnecessary debate about whether a cost is operationally owned or allocated for transparency.
