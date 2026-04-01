-- migrate:up

SET TIMEZONE='UTC';

COMMENT ON DATABASE "Panel.EmotoAgh.Production"
    IS 'Panel.EmotoAgh Production Database';
	
COMMENT ON DATABASE "Panel.EmotoAgh.Dev"
    IS 'Panel.EmotoAgh Dev Database';

COMMENT ON DATABASE "Panel.EmotoAgh.Test"
    IS 'Panel.EmotoAgh Testing Db';


-- migrate:down

COMMENT ON DATABASE "Panel.EmotoAgh.Test"
    IS NULL;
COMMENT ON DATABASE "Panel.EmotoAgh.Dev"
    IS NULL;
COMMENT ON DATABASE "Panel.EmotoAgh.Production"
    IS NULL;


