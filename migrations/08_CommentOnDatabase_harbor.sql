-- migrate:up

COMMENT ON DATABASE "Harbor"
    IS 'Harbor service Database';


-- migrate:down

COMMENT ON DATABASE "Harbor"
    IS NULL;