-- migrate:up

-- Dodanie extensiona wymaga ponownego otwarcia okna pgadmina

CREATE EXTENSION IF NOT EXISTS postgis SCHEMA public;
CREATE EXTENSION IF NOT EXISTS timescaledb SCHEMA public;


CREATE TABLE public."Machine"
(
    "MachineId" serial,
    "Name" text NOT NULL,
    PRIMARY KEY ("MachineId")
);

ALTER TABLE IF EXISTS public."Machine"
    OWNER to "Role.Owner";

COMMENT ON TABLE public."Machine"
    IS 'Tabela z konfiguracją Maszyny';


CREATE TABLE public."DoubleMeasurement"
(
    "MeasurementId" serial,
    "MachineId" integer NOT NULL,

    -- https://wiki.postgresql.org/wiki/Don't_Do_This#Don.27t_use_timestamp_.28without_time_zone.29
    "Time" timestamp with time zone NOT NULL DEFAULT NOW(),
    "MeasurementTypeId" integer NOT NULL,
    "Value" double precision NOT NULL,
    -- Timescale want's Time in PK
    PRIMARY KEY ("MeasurementId", "Time" ),
    CONSTRAINT "MachineId" FOREIGN KEY ("MachineId")
        REFERENCES public."Machine" ("MachineId") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT
        NOT VALID
);

ALTER TABLE IF EXISTS public."DoubleMeasurement"
    OWNER to "Role.Owner";

COMMENT ON TABLE public."DoubleMeasurement"
    IS 'Telemetria motocykli';

CREATE INDEX "IX_DoubleMeasurement_MeasurementTypeId_MachineId_Time"
    ON public."DoubleMeasurement" USING btree
    (
        "MeasurementTypeId" ASC NULLS LAST,
        "MachineId" ASC NULLS LAST,
        "Time" DESC
    );

SELECT create_hypertable('public."DoubleMeasurement"', by_range('Time'));

-- Lokalizacje

CREATE TABLE public."LocationMeasurement"
(
    "MeasurementId" serial,
    "MachineId" integer NOT NULL,
    "Time" timestamp with time zone NOT NULL DEFAULT NOW(),
    "MeasurementTypeId" integer NOT NULL,
    "Value" GEOMETRY(POINT,4326) NOT NULL,
    PRIMARY KEY ("MeasurementId", "Time"),
    CONSTRAINT "MachineId" FOREIGN KEY ("MachineId")
        REFERENCES public."Machine" ("MachineId") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT
        NOT VALID
);


ALTER TABLE IF EXISTS public."LocationMeasurement"
    OWNER to "Role.Owner";

COMMENT ON TABLE public."LocationMeasurement"
    IS 'Lokalizacja maszyn';

CREATE INDEX "IX_LocationMeasurement_MeasurementTypeId_MachineId_Time"
    ON public."DoubleMeasurement" USING btree
    (
        "MeasurementTypeId" ASC NULLS LAST,
        "MachineId" ASC NULLS LAST,
        "Time" DESC
    );

SELECT create_hypertable('public."LocationMeasurement"', by_range('Time'));

-- migrate:down
DROP INDEX "IX_LocationMeasurement_MeasurementTypeId_MachineId_Time";
DROP INDEX "IX_DoubleMeasurement_MeasurementTypeId_MachineId_Time";

DROP TABLE public."LocationMeasurement";
DROP TABLE public."DoubleMeasurement";
DROP TABLE public."Machine";
