-- migrate:up transaction:false

CREATE ROLE "Role.Harbor" WITH
	LOGIN
	NOSUPERUSER
	NOCREATEDB
	NOCREATEROLE
	NOINHERIT
	NOREPLICATION
	CONNECTION LIMIT -1
	PASSWORD NULL;

COMMENT ON ROLE "Role.Harbor" IS 'Właściciel bazy Harbor';

-- migrate:down transaction:false

DROP ROLE IF EXISTS "Role.Harbor";