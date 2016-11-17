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

CREATE TABLE tweets (
    text text NOT NULL,
    "time" integer NOT NULL,
    id bigint NOT NULL,
    retweeted boolean NOT NULL,
    twitname text NOT NULL
);

CREATE TABLE users (
    id serial NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    admin boolean DEFAULT false
);

CREATE TABLE subs (
    id serial NOT NULL,
    regex text NOT NULL,
    replacement text DEFAULT ''::text
);

CREATE TABLE locations (
    id serial NOT NULL,
    display text NOT NULL,
    matcher text NOT NULL,
    lat double precision NOT NULL,
    long double precision NOT NULL,
    zone text NOT NULL,
    site text NOT NULL
);

CREATE TABLE sites (
    name text NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    lat double precision NOT NULL,
    long double precision NOT NULL
);

CREATE TABLE trucks (
    id text NOT NULL,
    name text NOT NULL,
    twitname text NOT NULL,
    weburl text,
    tweet text DEFAULT ''::text NOT NULL,
    retweeted boolean DEFAULT false NOT NULL,
    lastupdate integer DEFAULT 0 NOT NULL,
    type text DEFAULT ''::text NOT NULL,
    about text DEFAULT ''::text NOT NULL,
    foursquare text,
    site text NOT NULL,
    locs bigint[],
    archive boolean DEFAULT false
);

-- +migrate Down

DROP TABLE ads;
DROP TABLE images;
DROP TABLE tweets;
DROP TABLE users;
DROP TABLE subs;
DROP TABLE locations;
DROP TABLE sites;
DROP TABLE trucks;