CREATE OR REPLACE VIEW vw_bi_service_monthly AS
SELECT
    report_month,
    service_code,
    service_name,
    service_owner,
    service_category,
    business_criticality,
    direct_cost_chf,
    shared_cost_chf,
    total_cost_chf,
    active_users,
    usage_volume,
    usage_unit,
    opened_tickets,
    resolved_tickets,
    sla_met_pct,
    total_requests,
    automated_requests,
    automation_rate_pct,
    availability_pct,
    avg_fulfillment_hours,
    major_incidents,
    backlog_tickets,
    cost_per_user,
    cost_per_ticket,
    tickets_per_100_users,
    service_efficiency_index
FROM mart_service_monthly;

CREATE OR REPLACE VIEW vw_bi_service_summary AS
SELECT
    service_code,
    service_name,
    service_owner,
    service_category,
    SUM(total_cost_chf) AS total_cost_chf_qtd,
    SUM(direct_cost_chf) AS direct_cost_chf_qtd,
    SUM(shared_cost_chf) AS shared_cost_chf_qtd,
    AVG(active_users) AS avg_active_users,
    SUM(opened_tickets) AS opened_tickets_qtd,
    SUM(resolved_tickets) AS resolved_tickets_qtd,
    ROUND(SUM(total_cost_chf) / NULLIF(AVG(active_users), 0), 2) AS avg_cost_per_user,
    ROUND(SUM(total_cost_chf) / NULLIF(SUM(resolved_tickets), 0), 2) AS avg_cost_per_ticket,
    ROUND(AVG(tickets_per_100_users), 2) AS avg_tickets_per_100_users,
    ROUND(AVG(sla_met_pct), 2) AS avg_sla_met_pct,
    ROUND(AVG(automation_rate_pct), 2) AS avg_automation_rate_pct,
    ROUND(AVG(service_efficiency_index), 2) AS avg_service_efficiency_index
FROM mart_service_monthly
GROUP BY
    service_code,
    service_name,
    service_owner,
    service_category;

CREATE OR REPLACE VIEW vw_bi_management_overview AS
WITH monthly_ranked_costs AS (
    SELECT
        report_month,
        service_name,
        total_cost_chf,
        ROW_NUMBER() OVER (
            PARTITION BY report_month
            ORDER BY total_cost_chf DESC
        ) AS cost_rank
    FROM mart_service_monthly
),
monthly_top_cost_service AS (
    SELECT
        report_month,
        service_name AS highest_cost_service
    FROM monthly_ranked_costs
    WHERE cost_rank = 1
)
SELECT
    m.report_month,
    SUM(m.total_cost_chf) AS portfolio_total_cost_chf,
    SUM(m.active_users) AS portfolio_active_users,
    SUM(m.opened_tickets) AS portfolio_opened_tickets,
    ROUND(SUM(m.total_cost_chf) / NULLIF(SUM(m.active_users), 0), 2) AS portfolio_cost_per_user,
    ROUND(SUM(m.total_cost_chf) / NULLIF(SUM(m.resolved_tickets), 0), 2) AS portfolio_cost_per_ticket,
    ROUND(AVG(m.service_efficiency_index), 2) AS avg_service_efficiency_index,
    MAX(t.highest_cost_service) AS highest_cost_service
FROM mart_service_monthly m
LEFT JOIN monthly_top_cost_service t
    ON m.report_month = t.report_month
GROUP BY
    m.report_month;

