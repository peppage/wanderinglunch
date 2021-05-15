--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5 (Ubuntu 12.5-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.5 (Ubuntu 12.5-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: images; Type: TABLE; Schema: public; Owner: mca
--

CREATE TABLE public.images (
    id text NOT NULL,
    suffix text NOT NULL,
    visibility text DEFAULT 'public'::text NOT NULL,
    truck_id text NOT NULL,
    menu boolean DEFAULT false
);


ALTER TABLE public.images OWNER TO mca;

--
-- Name: locations; Type: TABLE; Schema: public; Owner: mca
--

CREATE TABLE public.locations (
    id bigint NOT NULL,
    display text NOT NULL,
    matcher text NOT NULL,
    lat double precision NOT NULL,
    long double precision NOT NULL,
    zone text NOT NULL,
    site text NOT NULL
);


ALTER TABLE public.locations OWNER TO mca;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: mca
--

CREATE SEQUENCE public.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO mca;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mca
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: sites; Type: TABLE; Schema: public; Owner: mca
--

CREATE TABLE public.sites (
    name text NOT NULL,
    title text DEFAULT ''::text NOT NULL,
    description text DEFAULT ''::text NOT NULL,
    lat double precision NOT NULL,
    long double precision NOT NULL
);


ALTER TABLE public.sites OWNER TO mca;

--
-- Name: spots; Type: TABLE; Schema: public; Owner: mca
--

CREATE TABLE public.spots (
    truck_id text NOT NULL,
    location_id bigint NOT NULL,
    tweet_id text NOT NULL
);


ALTER TABLE public.spots OWNER TO mca;

--
-- Name: subs; Type: TABLE; Schema: public; Owner: mca
--

CREATE TABLE public.subs (
    id bigint NOT NULL,
    regex text NOT NULL,
    replacement text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.subs OWNER TO mca;

--
-- Name: subs_id_seq; Type: SEQUENCE; Schema: public; Owner: mca
--

CREATE SEQUENCE public.subs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subs_id_seq OWNER TO mca;

--
-- Name: subs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mca
--

ALTER SEQUENCE public.subs_id_seq OWNED BY public.subs.id;


--
-- Name: trucks; Type: TABLE; Schema: public; Owner: mca
--

CREATE TABLE public.trucks (
    name text NOT NULL,
    id text NOT NULL,
    web_url text DEFAULT ''::text NOT NULL,
    retweeted boolean DEFAULT false NOT NULL,
    last_update bigint DEFAULT 0 NOT NULL,
    type text DEFAULT ''::text NOT NULL,
    about text DEFAULT ''::text NOT NULL,
    foursquare text DEFAULT ''::text NOT NULL,
    site text NOT NULL,
    archive boolean DEFAULT false NOT NULL
);


ALTER TABLE public.trucks OWNER TO mca;

--
-- Name: tweets; Type: TABLE; Schema: public; Owner: mca
--

CREATE TABLE public.tweets (
    text text NOT NULL,
    "time" bigint NOT NULL,
    id text NOT NULL,
    truck_id text NOT NULL,
    done boolean DEFAULT false NOT NULL
);


ALTER TABLE public.tweets OWNER TO mca;

--
-- Name: users; Type: TABLE; Schema: public; Owner: mca
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    admin boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO mca;

--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: mca
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: subs id; Type: DEFAULT; Schema: public; Owner: mca
--

ALTER TABLE ONLY public.subs ALTER COLUMN id SET DEFAULT nextval('public.subs_id_seq'::regclass);


--
-- Name: images images_id_key; Type: CONSTRAINT; Schema: public; Owner: mca
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_id_key UNIQUE (id);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: mca
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: locations locations_display_key; Type: CONSTRAINT; Schema: public; Owner: mca
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_display_key UNIQUE (display);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: mca
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: sites sites_pkey; Type: CONSTRAINT; Schema: public; Owner: mca
--

ALTER TABLE ONLY public.sites
    ADD CONSTRAINT sites_pkey PRIMARY KEY (name);


--
-- Name: spots spots_pkey; Type: CONSTRAINT; Schema: public; Owner: mca
--

ALTER TABLE ONLY public.spots
    ADD CONSTRAINT spots_pkey PRIMARY KEY (location_id, tweet_id);


--
-- Name: subs subs_pkey; Type: CONSTRAINT; Schema: public; Owner: mca
--

ALTER TABLE ONLY public.subs
    ADD CONSTRAINT subs_pkey PRIMARY KEY (id);


--
-- Name: trucks trucks_pkey; Type: CONSTRAINT; Schema: public; Owner: mca
--

ALTER TABLE ONLY public.trucks
    ADD CONSTRAINT trucks_pkey PRIMARY KEY (id);


--
-- Name: tweets tweets_id_key; Type: CONSTRAINT; Schema: public; Owner: mca
--

ALTER TABLE ONLY public.tweets
    ADD CONSTRAINT tweets_id_key UNIQUE (id);


--
-- Name: tweets tweets_pkey; Type: CONSTRAINT; Schema: public; Owner: mca
--

ALTER TABLE ONLY public.tweets
    ADD CONSTRAINT tweets_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: mca
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: images images_truck_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mca
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_truck_id_fkey FOREIGN KEY (truck_id) REFERENCES public.trucks(id);


--
-- Name: spots spots_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mca
--

ALTER TABLE ONLY public.spots
    ADD CONSTRAINT spots_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id);


--
-- Name: spots spots_truck_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mca
--

ALTER TABLE ONLY public.spots
    ADD CONSTRAINT spots_truck_id_fkey FOREIGN KEY (truck_id) REFERENCES public.trucks(id);


--
-- Name: spots spots_tweet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mca
--

ALTER TABLE ONLY public.spots
    ADD CONSTRAINT spots_tweet_id_fkey FOREIGN KEY (tweet_id) REFERENCES public.tweets(id);


--
-- Name: tweets tweets_truck_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mca
--

ALTER TABLE ONLY public.tweets
    ADD CONSTRAINT tweets_truck_id_fkey FOREIGN KEY (truck_id) REFERENCES public.trucks(id);


--
-- PostgreSQL database dump complete
--

