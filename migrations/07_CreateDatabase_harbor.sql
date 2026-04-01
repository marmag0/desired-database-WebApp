-- migrate:up transaction:false

CREATE DATABASE "Harbor"
    WITH 
    OWNER = "Role.Harbor"
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;


-- migrate:down transaction:false

DROP TABLE IF EXISTS "Harbor"