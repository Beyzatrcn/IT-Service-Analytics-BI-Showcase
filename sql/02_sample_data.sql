INSERT INTO src_dynamics_service_catalog (
    service_code,
    service_name,
    service_owner,
    service_category,
    unit_of_measure,
    business_criticality,
    capacity_users
) VALUES
    ('VPN', 'VPN', 'Leitung Netzwerkservices', 'Connectivity', 'Durchschnittliche tägliche Verbindungen', 'High', 1200),
    ('CLOUD_STORAGE', 'Cloud Storage', 'Leitung Workplace-Plattform', 'Collaboration', 'Gespeicherte TB', 'High', 800),
    ('EMAIL', 'Email', 'Product Owner Messaging', 'Collaboration', 'Verarbeitete Nachrichten', 'High', 1300),
    ('IDENTITY_ACCESS', 'Identity & Access', 'Leitung IAM-Service', 'Security', 'Provisioning-Ereignisse', 'Critical', 1300),
    ('SERVICE_DESK', 'Service Desk', 'Leitung End User Support', 'Support', 'Bearbeitete Requests', 'High', 1300);

INSERT INTO ref_sap_cost_center_mapping (
    cost_center,
    service_code,
    cost_bucket,
    allocation_method
) VALUES
    ('CC_VPN', 'VPN', 'Software', 'DIRECT'),
    ('CC_STORAGE', 'CLOUD_STORAGE', 'Hosting', 'DIRECT'),
    ('CC_EMAIL', 'EMAIL', 'Software', 'DIRECT'),
    ('CC_IAM', 'IDENTITY_ACCESS', 'Personalkosten', 'DIRECT'),
    ('CC_SVC_DESK', 'SERVICE_DESK', 'Personalkosten', 'DIRECT'),
    ('CC_SHARED', NULL, 'Shared Overhead', 'ACTIVE_USERS');

INSERT INTO src_sap_cost_postings (
    posting_id,
    posting_month,
    company_code,
    cost_center,
    gl_account,
    cost_element_name,
    vendor_name,
    amount_chf
) VALUES
    (1, DATE '2026-01-01', 'CH01', 'CC_VPN', '620200', 'VPN-Abonnement', 'SecureNet AG', 18500.00),
    (2, DATE '2026-01-01', 'CH01', 'CC_STORAGE', '630100', 'Cloud-Storage-Hosting', 'Azure Cloud', 24000.00),
    (3, DATE '2026-01-01', 'CH01', 'CC_EMAIL', '620210', 'Lizenz Email-Plattform', 'MailWorks Ltd', 21000.00),
    (4, DATE '2026-01-01', 'CH01', 'CC_IAM', '610100', 'Personalkosten IAM-Betrieb', NULL, 16000.00),
    (5, DATE '2026-01-01', 'CH01', 'CC_SVC_DESK', '610120', 'Personalkosten Service Desk', NULL, 28000.00),
    (6, DATE '2026-01-01', 'CH01', 'CC_SHARED', '630900', 'Monitoring-Plattform', 'ObserveIT', 3000.00),
    (7, DATE '2026-01-01', 'CH01', 'CC_SHARED', '610900', 'Architektur-Gemeinkosten', NULL, 4500.00),
    (8, DATE '2026-02-01', 'CH01', 'CC_VPN', '620200', 'VPN-Abonnement', 'SecureNet AG', 18750.00),
    (9, DATE '2026-02-01', 'CH01', 'CC_STORAGE', '630100', 'Cloud-Storage-Hosting', 'Azure Cloud', 25500.00),
    (10, DATE '2026-02-01', 'CH01', 'CC_EMAIL', '620210', 'Lizenz Email-Plattform', 'MailWorks Ltd', 21250.00),
    (11, DATE '2026-02-01', 'CH01', 'CC_IAM', '610100', 'Personalkosten IAM-Betrieb', NULL, 16400.00),
    (12, DATE '2026-02-01', 'CH01', 'CC_SVC_DESK', '610120', 'Personalkosten Service Desk', NULL, 28600.00),
    (13, DATE '2026-02-01', 'CH01', 'CC_SHARED', '630900', 'Monitoring-Plattform', 'ObserveIT', 3200.00),
    (14, DATE '2026-02-01', 'CH01', 'CC_SHARED', '610900', 'Architektur-Gemeinkosten', NULL, 4700.00),
    (15, DATE '2026-03-01', 'CH01', 'CC_VPN', '620200', 'VPN-Abonnement', 'SecureNet AG', 19000.00),
    (16, DATE '2026-03-01', 'CH01', 'CC_STORAGE', '630100', 'Cloud-Storage-Hosting', 'Azure Cloud', 26800.00),
    (17, DATE '2026-03-01', 'CH01', 'CC_EMAIL', '620210', 'Lizenz Email-Plattform', 'MailWorks Ltd', 21400.00),
    (18, DATE '2026-03-01', 'CH01', 'CC_IAM', '610100', 'Personalkosten IAM-Betrieb', NULL, 16650.00),
    (19, DATE '2026-03-01', 'CH01', 'CC_SVC_DESK', '610120', 'Personalkosten Service Desk', NULL, 28950.00),
    (20, DATE '2026-03-01', 'CH01', 'CC_SHARED', '630900', 'Monitoring-Plattform', 'ObserveIT', 3300.00),
    (21, DATE '2026-03-01', 'CH01', 'CC_SHARED', '610900', 'Architektur-Gemeinkosten', NULL, 4800.00);

INSERT INTO src_dynamics_service_requests_monthly (
    request_month,
    service_code,
    total_requests,
    automated_requests,
    avg_fulfillment_hours
) VALUES
    (DATE '2026-01-01', 'VPN', 40, 18, 10.00),
    (DATE '2026-01-01', 'CLOUD_STORAGE', 26, 8, 16.00),
    (DATE '2026-01-01', 'EMAIL', 34, 14, 8.00),
    (DATE '2026-01-01', 'IDENTITY_ACCESS', 150, 90, 6.00),
    (DATE '2026-01-01', 'SERVICE_DESK', 480, 210, 14.00),
    (DATE '2026-02-01', 'VPN', 42, 19, 9.00),
    (DATE '2026-02-01', 'CLOUD_STORAGE', 28, 9, 17.00),
    (DATE '2026-02-01', 'EMAIL', 33, 14, 8.00),
    (DATE '2026-02-01', 'IDENTITY_ACCESS', 165, 102, 5.00),
    (DATE '2026-02-01', 'SERVICE_DESK', 500, 225, 13.00),
    (DATE '2026-03-01', 'VPN', 44, 20, 9.00),
    (DATE '2026-03-01', 'CLOUD_STORAGE', 30, 10, 18.00),
    (DATE '2026-03-01', 'EMAIL', 35, 15, 7.00),
    (DATE '2026-03-01', 'IDENTITY_ACCESS', 180, 118, 5.00),
    (DATE '2026-03-01', 'SERVICE_DESK', 520, 245, 12.00);

INSERT INTO src_sql_service_usage_monthly (
    usage_month,
    service_code,
    active_users,
    usage_volume,
    usage_unit,
    availability_pct
) VALUES
    (DATE '2026-01-01', 'VPN', 820, 780.00, 'Durchschnittliche tägliche Verbindungen', 99.70),
    (DATE '2026-01-01', 'CLOUD_STORAGE', 560, 122.00, 'Gespeicherte TB', 99.50),
    (DATE '2026-01-01', 'EMAIL', 980, 1200000.00, 'Verarbeitete Nachrichten', 99.90),
    (DATE '2026-01-01', 'IDENTITY_ACCESS', 990, 4200.00, 'Provisioning-Ereignisse', 99.80),
    (DATE '2026-01-01', 'SERVICE_DESK', 1000, 3100.00, 'Bearbeitete Requests', 99.20),
    (DATE '2026-02-01', 'VPN', 840, 805.00, 'Durchschnittliche tägliche Verbindungen', 99.80),
    (DATE '2026-02-01', 'CLOUD_STORAGE', 575, 128.00, 'Gespeicherte TB', 99.50),
    (DATE '2026-02-01', 'EMAIL', 985, 1240000.00, 'Verarbeitete Nachrichten', 99.90),
    (DATE '2026-02-01', 'IDENTITY_ACCESS', 995, 4380.00, 'Provisioning-Ereignisse', 99.80),
    (DATE '2026-02-01', 'SERVICE_DESK', 1000, 3250.00, 'Bearbeitete Requests', 99.30),
    (DATE '2026-03-01', 'VPN', 860, 830.00, 'Durchschnittliche tägliche Verbindungen', 99.80),
    (DATE '2026-03-01', 'CLOUD_STORAGE', 580, 134.00, 'Gespeicherte TB', 99.60),
    (DATE '2026-03-01', 'EMAIL', 990, 1260000.00, 'Verarbeitete Nachrichten', 99.90),
    (DATE '2026-03-01', 'IDENTITY_ACCESS', 1000, 4550.00, 'Provisioning-Ereignisse', 99.90),
    (DATE '2026-03-01', 'SERVICE_DESK', 1000, 3350.00, 'Bearbeitete Requests', 99.30);

INSERT INTO src_sql_support_ticket_monthly (
    ticket_month,
    service_code,
    opened_tickets,
    resolved_tickets,
    sla_met_tickets,
    major_incidents,
    backlog_tickets
) VALUES
    (DATE '2026-01-01', 'VPN', 68, 65, 61, 0, 9),
    (DATE '2026-01-01', 'CLOUD_STORAGE', 54, 52, 46, 1, 7),
    (DATE '2026-01-01', 'EMAIL', 72, 70, 66, 0, 8),
    (DATE '2026-01-01', 'IDENTITY_ACCESS', 95, 91, 79, 1, 12),
    (DATE '2026-01-01', 'SERVICE_DESK', 420, 412, 360, 2, 35),
    (DATE '2026-02-01', 'VPN', 64, 63, 60, 0, 7),
    (DATE '2026-02-01', 'CLOUD_STORAGE', 57, 55, 48, 1, 8),
    (DATE '2026-02-01', 'EMAIL', 70, 68, 64, 0, 7),
    (DATE '2026-02-01', 'IDENTITY_ACCESS', 103, 98, 83, 1, 15),
    (DATE '2026-02-01', 'SERVICE_DESK', 438, 430, 374, 2, 38),
    (DATE '2026-03-01', 'VPN', 60, 61, 58, 0, 6),
    (DATE '2026-03-01', 'CLOUD_STORAGE', 61, 58, 50, 1, 10),
    (DATE '2026-03-01', 'EMAIL', 69, 68, 65, 0, 7),
    (DATE '2026-03-01', 'IDENTITY_ACCESS', 110, 105, 87, 1, 18),
    (DATE '2026-03-01', 'SERVICE_DESK', 455, 448, 388, 2, 40);

