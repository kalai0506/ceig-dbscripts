--Create user
CREATE ROLE ceigadmin LOGIN PASSWORD 'ceigadmin';

--Create database
--CREATE DATABASE ceigadmin
  --WITH OWNER = ceigadmin

ALTER DATABASE ceigadmin OWNER TO ceigadmin;

--Create schema
CREATE SCHEMA ceig AUTHORIZATION ceigadmin;

--Create sequences
CREATE SEQUENCE ceig.seq_appln_id
  INCREMENT 1
  MINVALUE 1;
  
CREATE SEQUENCE ceig.seq_appln_status_id
  INCREMENT 1
  MINVALUE 1;
 
CREATE SEQUENCE ceig.seq_chng_req_id
  INCREMENT 1
  MINVALUE 1;  
  
CREATE SEQUENCE ceig.seq_doc_id
  INCREMENT 1
  MINVALUE 1;
  
CREATE SEQUENCE ceig.seq_office_assign_id
  INCREMENT 1
  MINVALUE 1;
  
CREATE SEQUENCE ceig.seq_office_id
  INCREMENT 1
  MINVALUE 1;
  
CREATE SEQUENCE ceig.seq_pos_id
  INCREMENT 1
  MINVALUE 1;
  
CREATE SEQUENCE ceig.seq_status_id
  INCREMENT 1
  MINVALUE 1;
  
CREATE SEQUENCE ceig.seq_user_id
  INCREMENT 1
  MINVALUE 1;

ALTER TABLE ceig.seq_appln_id OWNER TO ceigadmin;
ALTER TABLE ceig.seq_appln_status_id OWNER TO ceigadmin;
ALTER TABLE ceig.seq_chng_req_id OWNER TO ceigadmin;
ALTER TABLE ceig.seq_doc_id OWNER TO ceigadmin;
ALTER TABLE ceig.seq_office_assign_id OWNER TO ceigadmin;
ALTER TABLE ceig.seq_office_id OWNER TO ceigadmin;
ALTER TABLE ceig.seq_pos_id OWNER TO ceigadmin;
ALTER TABLE ceig.seq_status_id OWNER TO ceigadmin;
ALTER TABLE ceig.seq_user_id OWNER TO ceigadmin;
