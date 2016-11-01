-- +migrate up

CREATE TABLE ads (
    id serial NOT NULL,
    name character varying(255) NOT NULL,
    value text NOT NULL,
    validuntil integer,
    views integer DEFAULT 0,
    site text NOT NULL
);

CREATE TABLE images (
    id text NOT NULL,
    suffix text NOT NULL,
    visibility text DEFAULT 'public'::text NOT NULL,
    twitname text NOT NULL,
    menu boolean DEFAULT false
);

-- +migrate Down

DROP TABLE ads;
DROP TABLE images;