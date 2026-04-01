-- migrate:up

CREATE DATABASE "Keycloak"
    WITH 
    OWNER = "Role.Keycloak"
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE "Keycloak"
    IS 'Keycloak service Database';