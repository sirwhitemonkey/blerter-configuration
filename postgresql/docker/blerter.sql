DROP SCHEMA IF EXISTS "public" CASCADE;

CREATE SCHEMA "public";

CREATE TABLE health (
    health_id           bigserial NOT NULL,
    health_name         varchar(255)  ,
    health_description  varchar(255)  ,
    CONSTRAINT health_pkey PRIMARY KEY ( health_id )
);

CREATE TABLE safety (
    safety_id            bigserial NOT NULL,
    safety_name          varchar(255)  ,
    safety_description   varchar(255)  ,
    safety_is_active     bool  ,
    health_id            bigint ,
    CONSTRAINT safety_pkey PRIMARY KEY ( safety_id )
);

ALTER TABLE safety ADD CONSTRAINT safety_health_constraint FOREIGN KEY ( health_id ) REFERENCES health( health_id ) ON DELETE CASCADE ON UPDATE CASCADE;

COMMENT ON CONSTRAINT safety_health_constraint ON safety IS '';

ALTER TABLE safety ADD CONSTRAINT safety_ukey UNIQUE (safety_id, health_id);

