-- migrate:up

CREATE TABLE public."ConfigPage" (
    "ConfigPageId" serial,
    "UserId" UUID NOT NULL,
    "ConfigJson" JSON NOT NULL,
    PRIMARY KEY ("ConfigPageId")
);


-- migrate:down

DROP TABLE public."ConfigPage";
