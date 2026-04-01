-- migrate:up

CREATE TABLE public."MeasurementTypeName"
(
    "MeasurementTypeNameId" serial,
    "MeasurementTypeId" integer NOT NULL,
    "MeasurementTypeName" VARCHAR (50) NOT NULL,
    PRIMARY KEY ("MeasurementTypeNameId")
);

ALTER TABLE IF EXISTS public."MeasurementTypeName"
    OWNER to "Role.Owner";

CREATE INDEX "IX_MeasurementTypeId"
    ON public."MeasurementTypeName" USING btree
    ("MeasurementTypeNameId" ASC NULLS LAST);


-- migrate:down
DROP INDEX "IX_MeasurementTypeId";
DROP TABLE public."MeasurementTypeName";
