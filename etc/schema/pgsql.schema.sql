/**
 * Table "icingaweb_group"
 */
CREATE TABLE "icingaweb_group" (
  "name"   character varying(64) NOT NULL,
  "parent" character varying(64) NULL DEFAULT NULL,
  "ctime"  timestamp NULL DEFAULT NULL,
  "mtime"  timestamp NULL DEFAULT NULL
);

ALTER TABLE ONLY "icingaweb_group"
  ADD CONSTRAINT pk_icingaweb_group
  PRIMARY KEY (
    "name"
);

CREATE UNIQUE INDEX idx_icingaweb_group
  ON "icingaweb_group"
  USING btree (
    lower((name)::text)
);


/**
 * Table "icingaweb_group_membership"
 */
CREATE TABLE "icingaweb_group_membership" (
  "group_name" character varying(64) NOT NULL,
  "username"   character varying(64) NOT NULL,
  "ctime"      timestamp NULL DEFAULT NULL,
  "mtime"      timestamp NULL DEFAULT NULL
);

ALTER TABLE ONLY "icingaweb_group_membership"
  ADD CONSTRAINT pk_icingaweb_group_membership
  PRIMARY KEY (
    "group_name",
    "username"
);

CREATE UNIQUE INDEX idx_icingaweb_group_membership
  ON "icingaweb_group_membership"
  USING btree (
    lower((group_name)::text),
    lower((username)::text)
);


/**
 * Table "icingaweb_user"
 */
CREATE TABLE "icingaweb_user" (
  "name"          character varying(64) NOT NULL,
  "active"        smallint NOT NULL,
  "password_hash" bytea NOT NULL,
  "ctime"         timestamp NULL DEFAULT NULL,
  "mtime"         timestamp NULL DEFAULT NULL
);

ALTER TABLE ONLY "icingaweb_user"
  ADD CONSTRAINT pk_icingaweb_user
  PRIMARY KEY (
    "name"
);

CREATE UNIQUE INDEX idx_icingaweb_user
  ON "icingaweb_user"
  USING btree (
    lower((name)::text)
);


/**
 * Table "icingaweb_user_preference"
 */
CREATE TABLE "icingaweb_user_preference" (
  "username" character varying(64) NOT NULL,
  "name"     character varying(64) NOT NULL,
  "value"    character varying(255) NOT NULL,
  "ctime"    timestamp NULL DEFAULT NULL,
  "mtime"    timestamp NULL DEFAULT NULL
);

ALTER TABLE ONLY "icingaweb_user_preference"
  ADD CONSTRAINT pk_icingaweb_user_preference
  PRIMARY KEY (
    "username",
    "name"
);

CREATE UNIQUE INDEX idx_icingaweb_user_preference
  ON "icingaweb_user_preference"
  USING btree (
    lower((username)::text),
    lower((name)::text)
);