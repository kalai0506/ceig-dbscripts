--Inserting dummy office for root user 
INSERT INTO ceig.sd_office (office_id, office_name) VALUES (0, 'headoffice');
INSERT INTO ceig.sd_office (office_id, office_name) VALUES (1, 'Chief Electrical Inspector to Government - chennai');
INSERT INTO ceig.sd_office (office_id, office_name) VALUES (2, 'Chief Electrical Inspector to Government - Coimbatore');
INSERT INTO ceig.sd_office (office_id, office_name) VALUES (3, 'Senior Electrical Inspector - Coimbatore');
INSERT INTO ceig.sd_office (office_id, office_name) VALUES (4, 'Electrical Inspector - Coimbatore (Central)');

--Inserting user types identified
INSERT INTO ceig.sd_user_type (user_type_id, user_type) VALUES (1, 'ceig');
INSERT INTO ceig.sd_user_type (user_type_id, user_type) VALUES (2, 'super user');
INSERT INTO ceig.sd_user_type (user_type_id, user_type) VALUES (3, 'user');

--Inserting root user ceig
INSERT INTO ceig.sd_user_data (user_id, user_name, office_id, password, user_type_id, reporting_user_id, crt_timestamp, upd_timestamp, created_by, updated_by) VALUES (0, 'ceig', 0, 'tWcq0VdIu15NsMIP57qyfYzl7E03KtgZlii5KyLkf3f7JLEf7DeMYHYJF3wCBxIaqrEdxMSxBv0Snt8Dgd3qOw==', 1, 0, '2011-09-13 06:18:12', NULL, '0', NULL);

--Inserting application purpose identified
INSERT INTO ceig.sd_appln_purpose (purpose_id, purpose) VALUES (1, 'Drawing Scrutiny');
INSERT INTO ceig.sd_appln_purpose (purpose_id, purpose) VALUES (2, 'Permission for Energisation');

--Inserting application status identified
INSERT INTO ceig.sd_status (status_id, status_name) VALUES (1, 'In Process');
INSERT INTO ceig.sd_status (status_id, status_name) VALUES (2, 'Query Raised');
INSERT INTO ceig.sd_status (status_id, status_name) VALUES (3, 'Scrutiny Report offered');
INSERT INTO ceig.sd_status (status_id, status_name) VALUES (4, 'Proposal Returned');
INSERT INTO ceig.sd_status (status_id, status_name) VALUES (5, 'Inspection Arranged');
INSERT INTO ceig.sd_status (status_id, status_name) VALUES (6, 'Permission accorded');

ALTER SEQUENCE ceig.seq_office_id RESTART WITH 5;

--Inserting alert period for identified alerts
--Inserting alert type & period for identified alerts [no GUI]
INSERT INTO ceig.sd_alert (alert_id, alert_type,alert_period) VALUES (1, 'no action',1);
INSERT INTO ceig.sd_alert (alert_id, alert_type,alert_period) VALUES (2, 'delayed action',1);



