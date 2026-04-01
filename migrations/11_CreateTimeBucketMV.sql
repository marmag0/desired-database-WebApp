-- migrate:up

CREATE MATERIALIZED VIEW measurements_per_day
WITH (timescaledb.continuous) AS
SELECT
    time_bucket('1 day', "Time") AS bucket,
    avg("Value") AS avg,
    first("Value", "Time") AS first,
    last("Value", "Time") AS last,
    max("Value") AS max,
    min("Value") AS min,
    variance("Value") AS variance,
    count("Value") AS count, -- jeśli chcemy liczyć też NULL -> count(*)
    "MachineId",
    "MeasurementTypeId"
FROM "DoubleMeasurement"
GROUP BY bucket, "MachineId", "MeasurementTypeId";

CREATE MATERIALIZED VIEW measurements_per_hour
WITH (timescaledb.continuous) AS
SELECT
    time_bucket('1 hour', "Time") AS bucket,
    avg("Value") AS avg,
    first("Value", "Time") AS first,
    last("Value", "Time") AS last,
    max("Value") AS max,
    min("Value") AS min,
    variance("Value") AS variance,
    count("Value") AS count, -- jeśli chcemy liczyć też NULL -> count(*)
    "MachineId",
    "MeasurementTypeId"
FROM "DoubleMeasurement"
GROUP BY bucket, "MachineId", "MeasurementTypeId";

CREATE MATERIALIZED VIEW measurements_per_min
WITH (timescaledb.continuous) AS
SELECT
    time_bucket('1 min', "Time") AS bucket,
    avg("Value") AS avg,
    first("Value", "Time") AS first,
    last("Value", "Time") AS last,
    max("Value") AS max,
    min("Value") AS min,
    variance("Value") AS variance,
    count("Value") AS count, -- jeśli chcemy liczyć też NULL -> count(*)
    "MachineId",
    "MeasurementTypeId"
FROM "DoubleMeasurement"
GROUP BY bucket, "MachineId", "MeasurementTypeId";

-- migrate:down

DROP MATERIALIZED VIEW IF EXISTS measurements_per_day;
DROP MATERIALIZED VIEW IF EXISTS measurements_per_hour;
DROP MATERIALIZED VIEW IF EXISTS measurements_per_min;