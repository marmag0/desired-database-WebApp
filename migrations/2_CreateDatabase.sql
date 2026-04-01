-- migrate:up

SET TIMEZONE='UTC';

CREATE DATABASE "Panel.EmotoAgh.Production"
    WITH 
    OWNER = "Role.Owner"
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

CREATE DATABASE "Panel.EmotoAgh.Dev"
    WITH 
    OWNER = "Role.Owner"
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;	

CREATE DATABASE "Panel.EmotoAgh.Test"
    WITH 
    OWNER = "Role.Owner"
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;	

COMMENT ON DATABASE "Panel.EmotoAgh.Production"
    IS 'Panel.EmotoAgh Production Database';
	
COMMENT ON DATABASE "Panel.EmotoAgh.Dev"
    IS 'Panel.EmotoAgh Dev Database';

COMMENT ON DATABASE "Panel.EmotoAgh.Test"
    IS 'Panel.EmotoAgh Testing Db';