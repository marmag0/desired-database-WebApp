-- migrate:up transaction:false

CREATE DATABASE "Keycloak"
    WITH 
    OWNER = "Role.Keycloak"
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;


-- migrate:down transaction:false

DROP TABLE IF EXISTS "Keycloak"