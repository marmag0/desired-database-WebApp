-- migrate:up

CREATE DATABASE "Harbor"
    WITH 
    OWNER = "Role.Harbor"
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE "Harbor"
    IS 'Harbor service Database';