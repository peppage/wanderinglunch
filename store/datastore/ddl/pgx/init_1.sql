-- +migrate up

CREATE TABLE ads (
    id serial NOT NULL,
    name character varying(255) NOT NULL,
    value text NOT NULL,
    validuntil integer,
    views integer DEFAULT 0,
    site text NOT NULL
);

-- +migrate Down

DROP TABLE ads;