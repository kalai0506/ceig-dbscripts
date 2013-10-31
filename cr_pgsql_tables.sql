-- Table: ceig.sd_office
CREATE TABLE ceig.sd_office
(
  office_id integer NOT NULL,
  office_name character varying NOT NULL,
  CONSTRAINT pk_office PRIMARY KEY (office_id)
);

-- Table: ceig.sd_user_type
CREATE TABLE ceig.sd_user_type
(
  user_type_id integer NOT NULL,
  user_type character varying NOT NULL,
  CONSTRAINT pk_user_type PRIMARY KEY (user_type_id)
);

-- Table: ceig.sd_user_data
CREATE TABLE ceig.sd_user_data
(
  user_id integer NOT NULL,
  user_name character varying NOT NULL,
  office_id integer NOT NULL,
  "password" character varying NOT NULL,
  user_type_id integer NOT NULL,
  reporting_user_id integer,
  crt_timestamp timestamp without time zone NOT NULL,
  upd_timestamp timestamp without time zone,
  created_by character varying NOT NULL,
  updated_by character varying,
  CONSTRAINT pk_user_data PRIMARY KEY (user_id),
  CONSTRAINT fk_office_id FOREIGN KEY (office_id)
      REFERENCES ceig.sd_office (office_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_user_type_id FOREIGN KEY (user_type_id)
      REFERENCES ceig.sd_user_type (user_type_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT uk_user_name UNIQUE (user_name)
);

-- Table: ceig.sd_appln_purpose
CREATE TABLE ceig.sd_appln_purpose
(
  purpose_id integer NOT NULL,
  purpose character varying NOT NULL,
  CONSTRAINT pk_appln_purpose PRIMARY KEY (purpose_id)
);

-- Table: ceig.sd_status
CREATE TABLE ceig.sd_status
(
  status_id integer NOT NULL,
  status_name character varying NOT NULL,
  CONSTRAINT pk_status PRIMARY KEY (status_id)
);

-- Table: ceig.sd_alert
CREATE TABLE ceig.sd_alert
(
  alert_id integer NOT NULL,
  alert_type character varying NOT NULL,
  alert_period integer NOT NULL,
  CONSTRAINT pk_sd_alert PRIMARY KEY (alert_id)
);

-- Table: ceig.sd_clear_records_settings
CREATE TABLE ceig.sd_clear_records_settings
(
  appln_record integer,
  alert_record integer,
  change_status integer
);

-- Table: ceig.ad_user_office_assign
CREATE TABLE ceig.ad_user_office_assign
(
  assign_id integer NOT NULL,
  user_id integer NOT NULL,
  office_id integer NOT NULL,
  cr_timestamp timestamp without time zone NOT NULL,
  upd_timestamp timestamp without time zone,
  created_by integer NOT NULL,
  updated_by integer,
  CONSTRAINT pk_ad_user_office_assign PRIMARY KEY (assign_id),
  CONSTRAINT fk_assign_office_id FOREIGN KEY (office_id)
      REFERENCES ceig.sd_office (office_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT uk_user_office_assign UNIQUE (user_id, office_id)
);

-- Table: ceig.ad_appln_registration
CREATE TABLE ceig.ad_appln_registration
(
  appln_id integer NOT NULL,
  pr_number character varying NOT NULL,
  date_of_receipt date,
  file_no character varying NOT NULL,
  purpose_id integer NOT NULL,
  email_id character varying NOT NULL,
  remarks character varying,
  file_path character varying,
  cr_timestamp timestamp without time zone NOT NULL,
  upd_timestamp timestamp without time zone,
  created_by integer NOT NULL,
  updated_by integer,
  applicant_name character varying NOT NULL,
  circle integer NOT NULL,
  CONSTRAINT pk_ad_appln_reg PRIMARY KEY (appln_id),
  CONSTRAINT uk_appln_reg_pr_number UNIQUE (pr_number, circle)
);

-- Table: ceig.ad_support_doc
CREATE TABLE ceig.ad_support_doc
(
  doc_id integer NOT NULL,
  appln_id integer NOT NULL,
  "password" character varying NOT NULL,
  file_path character varying NOT NULL,
  cr_timestamp timestamp without time zone NOT NULL,
  upd_timestamp timestamp without time zone,
  created_by integer NOT NULL,
  updated_by integer,
  CONSTRAINT pk_ad_support_doc PRIMARY KEY (doc_id),
  CONSTRAINT fk_ad_support_doc_appln_id FOREIGN KEY (appln_id)
      REFERENCES ceig.ad_appln_registration (appln_id) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE NO ACTION
);

-- Table: ceig.ad_appln_status
CREATE TABLE ceig.ad_appln_status
(
  appln_status_id integer NOT NULL,
  appln_id integer NOT NULL,
  status_id integer NOT NULL,
  status_date date NOT NULL,
  cr_timestamp timestamp without time zone NOT NULL,
  upd_timestamp timestamp without time zone,
  created_by integer NOT NULL,
  updated_by integer,
  CONSTRAINT pk_appln_status PRIMARY KEY (appln_status_id),
  CONSTRAINT fk_ad_appln_status_appln_id FOREIGN KEY (appln_id)
      REFERENCES ceig.ad_appln_registration (appln_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_ad_appln_status_status_id FOREIGN KEY (status_id)
      REFERENCES ceig.sd_status (status_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT uk_ad_appln_status_appln_n_status_ids UNIQUE (appln_id, status_id)
);

-- Table: ceig.ad_change_request
CREATE TABLE ceig.ad_change_request
(
  request_id integer NOT NULL,
  user_id integer NOT NULL,
  current_status integer NOT NULL,
  new_status integer NOT NULL,
  request_date date NOT NULL,
  reason character varying,
  "position" character varying NOT NULL DEFAULT 'pending'::character varying,
  cr_timestamp timestamp without time zone NOT NULL,
  upd_timestamp timestamp without time zone,
  created_by integer NOT NULL,
  updated_by integer,
  appln_id integer NOT NULL,
  CONSTRAINT pk_chng_req PRIMARY KEY (request_id)
);

ALTER TABLE ceig.sd_office OWNER TO ceigadmin;
ALTER TABLE ceig.sd_user_type OWNER TO ceigadmin;
ALTER TABLE ceig.sd_user_data OWNER TO ceigadmin;
ALTER TABLE ceig.sd_appln_purpose OWNER TO ceigadmin;
ALTER TABLE ceig.sd_status OWNER TO ceigadmin;
ALTER TABLE ceig.sd_alert OWNER TO ceigadmin;
ALTER TABLE ceig.sd_clear_records_settings OWNER TO ceigadmin;

ALTER TABLE ceig.ad_appln_registration OWNER TO ceigadmin;
ALTER TABLE ceig.ad_appln_status OWNER TO ceigadmin;
ALTER TABLE ceig.ad_change_request OWNER TO ceigadmin;
ALTER TABLE ceig.ad_support_doc OWNER TO ceigadmin;
ALTER TABLE ceig.ad_user_office_assign OWNER TO ceigadmin;




