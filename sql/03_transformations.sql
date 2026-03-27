CREATE OR REPLACE VIEW stg_service_catalog AS
SELECT
    service_code,
    service_name,
    service_owner,
    service_category,
    unit_of_measure,
    business_criticality,
    capacity_users
FROM src_dynamics_service_catalog;

CREATE OR REPLACE VIEW stg_sap_direct_costs AS
SELECT
    p.posting_month AS report_month,
    m.service_code,
    m.cost_bucket,
    SUM(p.amount_chf) AS direct_cost_chf
FROM src_sap_cost_postings p
JOIN ref_sap_cost_center_mapping m
    ON p.cost_center = m.cost_center
WHERE m.allocation_method = 'DIRECT'
GROUP BY
    p.posting_month,
    m.service_code,
    m.cost_bucket;

CREATE OR REPLACE VIEW stg_sap_shared_costs AS
SELECT
    p.posting_month AS report_month,
    SUM(p.amount_chf) AS shared_cost_pool_chf
FROM src_sap_cost_postings p
JOIN ref_sap_cost_center_mapping m
    ON p.cost_center = m.cost_center
WHERE m.allocation_method = 'ACTIVE_USERS'
GROUP BY
    p.posting_month;

CREATE OR REPLACE VIEW stg_shared_cost_allocation AS
WITH monthly_usage AS (
    SELECT
        usage_month AS report_month,
        service_code,
        active_users
    FROM src_sql_service_usage_monthly
),
monthly_totals AS (
    SELECT
        report_month,
        SUM(active_users) AS total_active_users
    FROM monthly_usage
    GROUP BY report_month
)
SELECT
    u.report_month,
    u.service_code,
    s.shared_cost_pool_chf,
    u.active_users,
    t.total_active_users,
    ROUND(
        s.shared_cost_pool_chf * (u.active_users::NUMERIC / NULLIF(t.total_active_users, 0)),
        2
    ) AS shared_cost_chf
FROM monthly_usage u
JOIN monthly_totals t
    ON u.report_month = t.report_month
JOIN stg_sap_shared_costs s
    ON u.report_month = s.report_month;

CREATE OR REPLACE VIEW int_monthly_service_costs AS
WITH direct_costs AS (
    SELECT
        report_month,
        service_code,
        SUM(direct_cost_chf) AS direct_cost_chf
    FROM stg_sap_direct_costs
    GROUP BY
        report_month,
        service_code
),
shared_costs AS (
    SELECT
        report_month,
        service_code,
        SUM(shared_cost_chf) AS shared_cost_chf
    FROM stg_shared_cost_allocation
    GROUP BY
        report_month,
        service_code
)
SELECT
    c.service_code,
    c.report_month,
    COALESCE(d.direct_cost_chf, 0) AS direct_cost_chf,
    COALESCE(s.shared_cost_chf, 0) AS shared_cost_chf,
    COALESCE(d.direct_cost_chf, 0) + COALESCE(s.shared_cost_chf, 0) AS total_cost_chf
FROM (
    SELECT DISTINCT
        usage_month AS report_month,
        service_code
    FROM src_sql_service_usage_monthly
) c
LEFT JOIN direct_costs d
    ON c.report_month = d.report_month
   AND c.service_code = d.service_code
LEFT JOIN shared_costs s
    ON c.report_month = s.report_month
   AND c.service_code = s.service_code;

CREATE OR REPLACE VIEW mart_service_monthly AS
SELECT
    u.usage_month AS report_month,
    sc.service_code,
    sc.service_name,
    sc.service_owner,
    sc.service_category,
    sc.unit_of_measure,
    sc.business_criticality,
    c.direct_cost_chf,
    c.shared_cost_chf,
    c.total_cost_chf,
    u.active_users,
    u.usage_volume,
    u.usage_unit,
    u.availability_pct,
    r.total_requests,
    r.automated_requests,
    r.avg_fulfillment_hours,
    t.opened_tickets,
    t.resolved_tickets,
    t.sla_met_tickets,
    t.major_incidents,
    t.backlog_tickets,
    ROUND(c.total_cost_chf / NULLIF(u.active_users, 0), 2) AS cost_per_user,
    ROUND(c.total_cost_chf / NULLIF(t.resolved_tickets, 0), 2) AS cost_per_ticket,
    ROUND((t.opened_tickets::NUMERIC / NULLIF(u.active_users, 0)) * 100, 2) AS tickets_per_100_users,
    ROUND((t.sla_met_tickets::NUMERIC / NULLIF(t.resolved_tickets, 0)) * 100, 2) AS sla_met_pct,
    ROUND((r.automated_requests::NUMERIC / NULLIF(r.total_requests, 0)) * 100, 2) AS automation_rate_pct,
    ROUND(
        ((u.active_users::NUMERIC / NULLIF(c.total_cost_chf, 0)) * 1000) /
        NULLIF(1 + ((t.opened_tickets::NUMERIC / NULLIF(u.active_users, 0)) * 100), 0),
        2
    ) AS service_efficiency_index
FROM src_sql_service_usage_monthly u
JOIN stg_service_catalog sc
    ON u.service_code = sc.service_code
LEFT JOIN int_monthly_service_costs c
    ON u.usage_month = c.report_month
   AND u.service_code = c.service_code
LEFT JOIN src_dynamics_service_requests_monthly r
    ON u.usage_month = r.request_month
   AND u.service_code = r.service_code
LEFT JOIN src_sql_support_ticket_monthly t
    ON u.usage_month = t.ticket_month
   AND u.service_code = t.service_code;

