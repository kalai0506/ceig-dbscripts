-- Dropping tables 
DROP TABLE ceig.sd_user_data;
DROP TABLE ceig.ad_user_office_assign;
DROP TABLE ceig.sd_office;
DROP TABLE ceig.sd_user_type;
DROP TABLE ceig.sd_appln_purpose;
DROP TABLE ceig.ad_appln_status;
DROP TABLE ceig.sd_status;
DROP TABLE ceig.sd_alert;
DROP TABLE ceig.sd_clear_records_settings;
DROP TABLE ceig.ad_support_doc;
DROP TABLE ceig.ad_appln_registration;
DROP TABLE ceig.ad_change_request;

--Dropping sequences
DROP SEQUENCE ceig.seq_appln_id;
DROP SEQUENCE ceig.seq_appln_status_id;
DROP SEQUENCE ceig.seq_chng_req_id;
DROP SEQUENCE ceig.seq_doc_id;
DROP SEQUENCE ceig.seq_office_assign_id;
DROP SEQUENCE ceig.seq_office_id;
DROP SEQUENCE ceig.seq_pos_id;
DROP SEQUENCE ceig.seq_status_id;
DROP SEQUENCE ceig.seq_user_id;

--Dropping schema
DROP SCHEMA ceig;

--Dropping database
--DROP DATABASE ceigadmin;

--Dropping user
DROP ROLE ceigadmin; 

