-- migrate:up

COMMENT ON DATABASE "Keycloak"
    IS 'Keycloak service Database';


-- migrate:down 

COMMENT ON DATABASE "Keycloak"
    IS NULL;