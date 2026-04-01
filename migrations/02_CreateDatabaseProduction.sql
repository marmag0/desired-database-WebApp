-- migrate:up transaction:false

CREATE DATABASE "Panel.EmotoAgh.Production"
    WITH 
    OWNER = "Role.Owner"
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;


-- migrate:down transaction:false

DROP DATABASE IF EXISTS "Panel.EmotoAgh.Production";
