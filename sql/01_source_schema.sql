DROP VIEW IF EXISTS vw_bi_management_overview;
DROP VIEW IF EXISTS vw_bi_service_summary;
DROP VIEW IF EXISTS vw_bi_service_monthly;
DROP VIEW IF EXISTS mart_service_monthly;
DROP VIEW IF EXISTS int_monthly_service_costs;
DROP VIEW IF EXISTS stg_shared_cost_allocation;
DROP VIEW IF EXISTS stg_sap_shared_costs;
DROP VIEW IF EXISTS stg_sap_direct_costs;
DROP VIEW IF EXISTS stg_service_catalog;

DROP TABLE IF EXISTS src_sql_support_ticket_monthly;
DROP TABLE IF EXISTS src_sql_service_usage_monthly;
DROP TABLE IF EXISTS src_dynamics_service_requests_monthly;
DROP TABLE IF EXISTS ref_sap_cost_center_mapping;
DROP TABLE IF EXISTS src_dynamics_service_catalog;
DROP TABLE IF EXISTS src_sap_cost_postings;

CREATE TABLE src_sap_cost_postings (
    posting_id INTEGER PRIMARY KEY,
    posting_month DATE NOT NULL,
    company_code VARCHAR(10) NOT NULL,
    cost_center VARCHAR(50) NOT NULL,
    gl_account VARCHAR(20) NOT NULL,
    cost_element_name VARCHAR(100) NOT NULL,
    vendor_name VARCHAR(100),
    amount_usd NUMERIC(12, 2) NOT NULL
);

CREATE TABLE src_dynamics_service_catalog (
    service_code VARCHAR(20) PRIMARY KEY,
    service_name VARCHAR(100) NOT NULL,
    service_owner VARCHAR(100) NOT NULL,
    service_category VARCHAR(50) NOT NULL,
    unit_of_measure VARCHAR(50) NOT NULL,
    business_criticality VARCHAR(20) NOT NULL,
    capacity_users INTEGER NOT NULL
);

CREATE TABLE ref_sap_cost_center_mapping (
    cost_center VARCHAR(50) PRIMARY KEY,
    service_code VARCHAR(20),
    cost_bucket VARCHAR(50) NOT NULL,
    allocation_method VARCHAR(30) NOT NULL
);

CREATE TABLE src_dynamics_service_requests_monthly (
    request_month DATE NOT NULL,
    service_code VARCHAR(20) NOT NULL,
    total_requests INTEGER NOT NULL,
    automated_requests INTEGER NOT NULL,
    avg_fulfillment_hours NUMERIC(10, 2) NOT NULL,
    PRIMARY KEY (request_month, service_code)
);

CREATE TABLE src_sql_service_usage_monthly (
    usage_month DATE NOT NULL,
    service_code VARCHAR(20) NOT NULL,
    active_users INTEGER NOT NULL,
    usage_volume NUMERIC(18, 2) NOT NULL,
    usage_unit VARCHAR(50) NOT NULL,
    availability_pct NUMERIC(5, 2) NOT NULL,
    PRIMARY KEY (usage_month, service_code)
);

CREATE TABLE src_sql_support_ticket_monthly (
    ticket_month DATE NOT NULL,
    service_code VARCHAR(20) NOT NULL,
    opened_tickets INTEGER NOT NULL,
    resolved_tickets INTEGER NOT NULL,
    sla_met_tickets INTEGER NOT NULL,
    major_incidents INTEGER NOT NULL,
    backlog_tickets INTEGER NOT NULL,
    PRIMARY KEY (ticket_month, service_code)
);
