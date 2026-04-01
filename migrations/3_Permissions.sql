--
-- Panel Emoto Agh PostgreSql Scheme Init
--

-- migrate:up


---
--- Low permission User
--- Domyślnie ma tylko uprawnienia CRUD
---

GRANT USAGE ON SCHEMA public TO "Role.CRUD";

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT USAGE, SELECT ON SEQUENCES TO  "Role.CRUD";

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT
SELECT, INSERT, UPDATE, DELETE
ON TABLES TO "Role.CRUD";



---
--- Dev permission User
--- Uprawnienia dla bazy, która nie jest bazą produkcyjną 
---

DO
$do$
BEGIN
    IF (SELECT current_database() != 'Panel.EmotoAgh.Production') THEN
        RAISE NOTICE 'Grant to dev user';

        ALTER DEFAULT PRIVILEGES IN SCHEMA public
        GRANT USAGE, SELECT ON SEQUENCES TO  "Role.Dev"; 

        ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT
        SELECT, INSERT, UPDATE, DELETE
        ON TABLES TO "Role.Dev";

    END IF;
END
$do$;


-- migrate:down
