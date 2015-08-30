--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: images; Type: TABLE; Schema: public; Owner: mca; Tablespace: 
--

CREATE TABLE images (
    id text NOT NULL,
    suffix text NOT NULL,
    visibility text DEFAULT 'public'::text NOT NULL,
    twitname text NOT NULL,
    menu boolean DEFAULT false
);


ALTER TABLE images OWNER TO mca;

--
-- Name: locations; Type: TABLE; Schema: public; Owner: mca; Tablespace: 
--

CREATE TABLE locations (
    id bigint NOT NULL,
    display text NOT NULL,
    matcher text NOT NULL,
    region text NOT NULL,
    lat text NOT NULL,
    long text NOT NULL,
    hood text NOT NULL,
    zone text NOT NULL,
    site text NOT NULL
);


ALTER TABLE locations OWNER TO mca;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: mca
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE locations_id_seq OWNER TO mca;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mca
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: mca; Tablespace: 
--

CREATE TABLE messages (
    id integer NOT NULL,
    message text NOT NULL,
    date integer
);


ALTER TABLE messages OWNER TO mca;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: mca
--

CREATE SEQUENCE messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE messages_id_seq OWNER TO mca;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mca
--

ALTER SEQUENCE messages_id_seq OWNED BY messages.id;


--
-- Name: subs; Type: TABLE; Schema: public; Owner: mca; Tablespace: 
--

CREATE TABLE subs (
    id bigint NOT NULL,
    regex text NOT NULL,
    replacement text DEFAULT ''::text
);


ALTER TABLE subs OWNER TO mca;

--
-- Name: subs_id_seq; Type: SEQUENCE; Schema: public; Owner: mca
--

CREATE SEQUENCE subs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE subs_id_seq OWNER TO mca;

--
-- Name: subs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mca
--

ALTER SEQUENCE subs_id_seq OWNED BY subs.id;


--
-- Name: trucks; Type: TABLE; Schema: public; Owner: mca; Tablespace: 
--

CREATE TABLE trucks (
    id text NOT NULL,
    name text NOT NULL,
    twitname text NOT NULL,
    weburl text,
    tweet text,
    retweeted boolean,
    lasttweet integer,
    lastupdate integer,
    type text,
    about text,
    foursquare text,
    matcher text,
    loc bigint,
    matchmethod text
);


ALTER TABLE trucks OWNER TO mca;

--
-- Name: truckstats; Type: TABLE; Schema: public; Owner: mca; Tablespace: 
--

CREATE TABLE truckstats (
    id text NOT NULL,
    "time" integer NOT NULL,
    street text NOT NULL,
    region text NOT NULL,
    location text NOT NULL
);


ALTER TABLE truckstats OWNER TO mca;

--
-- Name: tweets; Type: TABLE; Schema: public; Owner: mca; Tablespace: 
--

CREATE TABLE tweets (
    contents text NOT NULL,
    "time" integer NOT NULL,
    id numeric(20,0) NOT NULL,
    retweeted boolean NOT NULL,
    twitname text NOT NULL
);


ALTER TABLE tweets OWNER TO mca;

--
-- Name: users; Type: TABLE; Schema: public; Owner: mca; Tablespace: 
--

CREATE TABLE users (
    id bigint NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    admin boolean DEFAULT false
);


ALTER TABLE users OWNER TO mca;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: mca
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO mca;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mca
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mca
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mca
--

ALTER TABLE ONLY messages ALTER COLUMN id SET DEFAULT nextval('messages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mca
--

ALTER TABLE ONLY subs ALTER COLUMN id SET DEFAULT nextval('subs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mca
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: mca
--

COPY images (id, suffix, visibility, twitname, menu) FROM stdin;
55159d3f498ef66b6de1b09c	/6096863_zt9VyCrl2nuWO8cc2KBxYq0rgIFXGJndFGmZcumdSRc.jpg	public	shuka	f
52fe5db111d2d7644f04c21e	/404119_k2pARWK6AW8sOni-GGVsAfTehHeRbbnRCBGhfeb1xZc.jpg	public	philssteaks	t
51645882e4b0bcb0cb0c7ef3	/7511393_dEJJLGO8ljFPMA_kFidoz1wpWZ-k6mHpqYnuRwoBpRg.jpg	public	philssteaks	f
507071bfe4b06e882e74b445	/1112203_qnT5k-31-4cRKDz00cUpp7Ia7HG3YTjhsC9Udo90RDI.jpg	public	philssteaks	f
5165924de4b093be3bc5cd57	/2159706_uFl3RYgA1z4EiDNp8PtjjG2HHWhTiiXDLNzJtFWPHS8.jpg	public	mactruckny	f
5151c82de4b024888079c5ea	/5003144_g8kbTzyfr6gL9vIRpMBbXz4TqBUk5EgkqIPlBP9DtsA.jpg	public	mactruckny	f
50883301e4b0904987088a20	/2361939_J2zcgauqqGFC_PZPyvkfEDoSufdDe5qE7gi_NkS1P1U.jpg	public	mactruckny	f
519bb23b498e208a0b81b7fa	/9285455_LZiJ4FLH7NOWjNUsXO9jxDRFAgLygBSB8SmSIW0z9kM.jpg	public	mactruckny	f
53becfa0498ecabf3380ad3d	/14196482__Nb-XE1Nu5U6-DjUyOaSLEZlftPX9UbGRO6ONPylCAk.jpg	public	coneyshack	t
5329e77f498ee6898be00a22	/11652594_SJ-j8bWUQDW088CP6WJV_hsoVB1X3sqlknJREVGXk-s.jpg	public	coneyshack	f
4fb29dc4e4b0e08c1e225555	/ckjwTj4Fd2cRoZvDQZw_1jYdwuBF4BsfV4ZWc5oElFo.jpg	public	eddiespizzany	f
5436c50e11d248d936eac143	/19152_M_ApacXXYJKPZC2fQRc7PP3Ft1gKho4lkea0eGMXrGY.jpg	public	latinkitchennyc	f
5410d00c11d24d29446d44c6	/10837211_UZDe_Sme56cWk-Gex8X4tfxg9bP-GHZcMWTK8imQoog.jpg	public	latinkitchennyc	f
5203bd51498ed50247ee01dd	/60805368_HlIeqCMjY2I5md2mzI5crKizc9wVPUZo_sBmC6zrPEA.jpg	public	mamuthainoodle	f
526fef71498e92d1ace459d9	/60805368_eCRrBwapYrNL8fM9tmIaLCfnlhQYb9ASU-ZkaR1Og54.jpg	public	mamuthainoodle	f
5568962e498e28889a3c79a4	/276818_apRGkmx83lAjJNn6Dbd8xPe7iW0vTSrJEwb3LCqyLCg.jpg	public	pontirossifood	f
4fda1cf4e4b0f6aceebbdb2d	/lKL7uz06jZgB680Vye9zxa_2yQfH96afFExvxaLlRpU.jpg	public	hibachiheaven	f
52e2aa07498e25b9a084ee94	/12998378_50qpDzH_XwsSlaJpw-f2fDtJsSvQg4TU_ujjdsnyWOw.jpg	public	hibachiheaven	f
51c1ea41498e372d91835cf9	/5067950_pSXIZo_RqO8Hh5AuWcomjr0p3q_pXPUMWe99W8hUGTU.jpg	public	burgersandbites	f
51a79983498e3044671cd784	/1441492_yfySwml4ChzJ_ni5DxTq-8n2UlecWBWjgxR-ygA6pYc.jpg	public	burgersandbites	f
5362891011d2b40c5f328b6e	/41834822_k1LVelyLVM9gsNt3M70sVjI-QLm_84bgv4c6hoMHPO8.jpg	public	hibachiheaven	t
52e6af38498e26e622e5398c	/4147709_E9hzkLfHAJjdgQ6RT3W29cf-cftJShyXpRthu8riZYs.jpg	public	hibachiheaven	f
504777b0e4b092e662d54688	/VDYXmY1LaQGPAFc62SGiSEqcsa9OqhqXotgvAXIkHgg.jpg	public	morristruck	t
53a1c287498edebe0e22b43f	/9446626_4q4cPL3HmqkIwu6ljinztCOxq6zm_V1V9MB_vkbZ6Qs.jpg	public	disosnyc	t
5197cb68498e8d409a89ec1b	/1847096_oRB5R_owQW40gVWlJhNNsh9_0bEq2D8Rt3Zod9HUbUg.jpg	public	disosnyc	f
4feb6e00e4b048145c547997	/wcCcDDUFo3EAkWygR8pGn29HTAv7VKEvPwJgzS6hQcw.jpg	public	andysitalianice	f
501c284be4b07d0ab63e08be	/vQv8P8_hFNwHMmpR7k6-arr8zqYmmgoSG_aAPJuz-ws.jpg	public	itizyicecream	f
51dc48a3498efe9483d8417a	/117715_dlhUlP8z_jVejqRlWaCzsJBqg0eoP6rRSjOLpszFA0Q.jpg	public	veganlunchtruck	f
51105b22e4b0a7b61fac854b	/117715_vKu0po70jlTD3qN9mXsdNiE6V5Od1hmYMVlUY9xSIP8.jpg	public	veganlunchtruck	f
516ef5ece4b0d1c83382c12f	/117715_Gt3J4FMusC7YQjSfEup4O7bAO10z8J4gxmnd0xKnZuQ.jpg	public	veganlunchtruck	f
5196816e498eebbaef53fe6b	/32050404_-lVnQ_kgFICQK3OBrfq4QydeDqXhz3ZCRD3TrCvMPxY.jpg	public	veganlunchtruck	f
535d6fe9498eeb428f0a49a5	/643701_B0msQNcQCClAiTuYbiNnskLICf99ehNmerkWdhYNR8c.jpg	public	snowday	f
533ddd9a498ebf7fb4775ca2	/36814481_r4TU0Q7tJ6Xum58iZ5olLRY6sV-P4dN3psrhw2ZZKZ8.jpg	public	snowday	f
50292d68e4b0d0acd3bb5dbb	/vv6y8qi6JFfXr9QDkIvTPP0fSmbgQ_jGXHCVwDv0c04.jpg	public	veganlunchtruck	f
508af08be4b02ba9b11cc747	/17430999_28ys6GXVoaOZoKPXLLK5GQpVEL8UrC1_1DajRIy8ia4.jpg	public	veganlunchtruck	f
51e83b4a498e0a1c64e62828	/26624_AGoljLki5SS-GJGKaAGB75mloHKRBkJ1Qj5BQCRP1_Y.jpg	public	itizyicecream	f
516ee142e4b04f28d58be309	/36812449_DjR1ynMnMpwj-KmiWPZQldmGQwJ2IEzjSwwmGevqe3U.jpg	public	sweeterynyc	f
5107e09be4b047c08ade6bf6	/760350_ZaalKVnOYdVAGoQEdugu-1Lws1LubyJBOVpZvJJD1V0.jpg	public	sweeterynyc	f
50188a43e4b0d35e6d8035b4	/b-fKh6mx2WxCybNQkr9ovk_jv4x7bwJPVFM9RF3M5T4.jpg	public	sweeterynyc	f
51424d6ce4b0041cb8df9856	/117715_oxR8_TwNSaCL-_gKDA2i2-1YoRfVVnbfT3M9Bfu4nxE.jpg	public	thepocketful	f
511a7d64e4b0c6a64118260c	/793192_Dtd9vMRk-pbBJscn1cb7n29zM87iJjZy6rojapRhODk.jpg	public	thepocketful	f
53c008f2498eb7426f809906	/8901_yT_FwBIUdR6vXYUM_nivPyu5TTVPRyYzz_45v8zawy8.jpg	public	thepocketful	t
51800af8e4b07a4a57023def	/9548073_erhzj0ShEDKaz8S8DhlDe90fDjJEIWjilIxO4_zjdGE.jpg	public	thepocketful	f
50a696b4e4b04d062582a95e	/32050404_qo6ZUnU5LQMoqrAR6YoH5Qz-PdUcD1d1jCheEJy7lng.jpg	public	thepocketful	f
51f4589a498e97316d307dab	/186827_ilvLMlb3AFqgXUQJ43S7IjsLNPxYP3Pw5LEjrqhp6wI.jpg	public	chipsykingny	f
4f7deaf5e4b0ffb6a3f2008e	/Xho5Xq8BtpNhEQvH0KRI3yX4kUstFRwTxEDj6QoawcM.jpg	public	palenquefood	f
51b8a845498e8ebdef064e0c	/761163_j9ai1NfaIpK2TLN8JzXbTwyIhVzuZevNHBV5EpQ7Fh0.jpg	public	palenquefood	f
51435e1de4b07d53cf71fd7a	/4486_lUhkecOFThYlMHKai4wDp4lXXiQSPLTq3Nno5WMIz7E.jpg	public	palenquefood	f
5008051fe4b0974c844d5003	/oNy0_bsWPyVmjrduzJXpbrAPHjQS0PVbyOCfoRSD9xE.jpg	public	shortysnyc	f
51cc5aad498ef430f84d0bb7	/6118094_NBh6M6M6nf_5mYOkO-_utfQBmnbpNZTvTRhINFWsX6s.jpg	public	nautimobile	t
51ccc251498e028212e9b1e3	/117715_ozxp6K6iPGwKCzQDARR3BgMcisplkTt0x4LEKDJdBMk.jpg	public	nautimobile	f
5022f267011cfeafe81dab9a	/7EPnN8ReXYQWoZYxzqkH9AQlOe8vFPtVP_60n65i9U4.jpg	public	nautimobile	f
4e09f3fca12d09aa881a769f	/NTSOFYDIBYVWGE4RYQTBBNIAQESPZ1LLW3Q4TC3TGMROSJPH.jpg	public	nautimobile	f
4e70e35c52b140871b6fa35f	/1TB5ROKJY5NF0GAVS4YS3WZTFCUXXHTPLLBUIK4BU0XD0QA5.jpg	public	nautimobile	f
51cb2c41498e9851cecdd49a	/5728350_vuJ4ORu0wHhd-B-f4FTNfsoIhfHgtJRMJc-QEeiYmNQ.jpg	public	taimmobile	f
55da6419498ec79aedeeda6a	/68150_xIw4p0jO4-q9xJjDv3t5DMEydCzO7Tsp0emPS9L6X_k.jpg	public	toumnyc	t
51716b5f498e03d8bc252c48	/11709298_S8klPxq0yPyZw2X9-_0IZyk6TFTn9xi5SWd_6BGCeVM.jpg	public	toumnyc	f
559eba5d498ed3b75095059e	/21832446_2POlNScZ2g8opbNsoyOSVET81dD_UbrXct5G3cioosQ.jpg	public	schnitzi1	f
5079a745e4b00277f33e4836	/34723233_tCoDnWhdhZj61xi_e00MNwJoK_UcfDXCQQ7Weat8pBM.jpg	public	valduccis	f
4fe65d6fe4b09198fde5842a	/nVmhJloDitdcBPFceYT8ajqQqgXBpB_w5GoPWse33Ks.jpg	public	valduccis	f
556f5fe0498e71287f7c3e06	/68150_DEYnBJz_XjQjQWbq4QTnfip2-TEt4cDPYPIaF4zm9lg.jpg	public	mamasheros	f
4ff318dde4b0444717bb6c21	/7p0pVfwa2IPX5eoAqan3mf43CoVnVrHHztgDqMGA6aE.jpg	public	korillabbq	t
53d2ab0c11d268858b540b4b	/6657788_kfbbBA6MbAVWizEQdvBfuvdJ1YR6JyMX4pIFYaeiblQ.jpg	public	chefsamirtruck	t
525b3a3711d2040fdcbd6fee	/52031712_DN0C9vfm3iv1geUuFX92Pt0jwgl8NhbGokLj_o0Ebjg.jpg	public	mooshugrill	f
542c2fb9498e97db2676dd30	/19152_gqmkZvFomzQsd1bmXs_VAPUX3V8eyhtOS5hHM9oHpgo.jpg	public	camionnyc	f
55da5467498e1d9f64d28c57	/68150_B2x11YLO-NbpSVy1z-s3j6Az5i0b6vSM3L3EOYB6o1Q.jpg	public	carlssteaks	t
52e456f2498ea9ece32b66e0	/25812424_w-pfXOZy2D8xWVJY37hGi4VXYiDnicBFvWRiiDOnNhE.jpg	public	carlssteaks	f
5203e16e498e9e8e0a93b61a	/702028_Fog-6PEF03KateivIPP-hx87Qn6gi7PwnaJv-wTFv3I.jpg	public	carlssteaks	f
4e94737ebe7b8f7220377349	/UABDRYTA3ON4XXTR4HQH42UGYB30IVX015FHLMFZVJ2KQASB.jpg	public	thecrepestruck	t
4fd0f054e4b0757383b97c0f	/MbR1inb3VKXu0PQMsCkHkHGftYq0E8CDbYG3BLRRGaE.jpg	public	thecrepestruck	f
5176cceb498efe500552cc9e	/21735785_zaQs-7anNinrrQlobBV2AjNxquTXs5g8ZY0NxvoxvHo.jpg	public	steaksncrepes	f
523b2edc11d265bf373f82a0	/8853695_cjpq3trk4bFpcU1oHWwj4XxwwD9ZI169sNncUyOQoM8.jpg	public	steaksncrepes	f
529ccbc511d21047117cdea2	/68150__CRf8sW9KvXZTkcAQEc4EsnYPgqXA2trmMxy-_AzobY.jpg	public	mrniceguytruck	f
52a0bef911d299250c89f9c7	/349672_Cg8dtcrfQ0WZeSo7BJR61YBG6VzsiMltZP8XIqyHiu0.jpg	public	mrniceguytruck	f
51c8a3c5498e797153ec5629	/46314126_95x6AErCZEGSi1zGZrFCY-EzgsIMyOhgO4G59l-u_Xg.jpg	public	funbunsnyc	f
5212ec18498e9494b634a94c	/814104_tUkLgiQ8zcYxovra9R8PIx7FckFhBjzNVHmirteXd58.jpg	public	funbunsnyc	f
55da612b498e7986da882759	/68150_kVXNCZMNTi6VASGjv7tgcFBneZ1Dq5OLpxfsl-WRCNI.jpg	public	neaexpress	t
551eb68a498e136a7e3dacac	/89498162_GK7wVV_VF_ZbdcpURHla6Btpz7w6ls1aYNB9Q020WxY.jpg	public	neaexpress	f
54978669498e92fb4a6b4341	/97520198_KIqmbmLkuFxboBU_HjFosEOXtwVA01QnxiBHugrwImE.jpg	public	shukanyc	t
529fe356498eb76b55781266	/68150_0fjIotER7PaMHitF9odB_GOyMyFahAZ-OHvSCE9Y2e0.jpg	public	mausamnyc	t
5239c6b7498e0f1f28af16fc	/2751553_7BX-8PVCQt3ELg-hV0rfmQhwRrGHbz9brLHsuV6IIhs.jpg	public	sweetchilinyc	t
51bf5237498e5ddfd58cd4c8	/16518471_biLXoMrblr4306jDwZDBDdJhZJ2Kz0YeORHDz_yVXSg.jpg	public	mexicoblvd	t
521e9e4511d2d8ddc5c69dbd	/117715_r7cpzyXCpOthqHouR5gdqIMX8k0TZ2KWHFun5wh-EYk.jpg	public	valduccis	f
516cdc93e4b0d6bb083f9db2	/117715_3eRUhgkRZGVpjDAYUz9TD5yQXPVFmg0iCB7iIgv_XD0.jpg	public	souvlakitruck	f
50be4929e4b0ada0df80b932	/4611139_UjW8jF3qFz_uyk0hDKT6CMZI2q3My4j6ZiwX-68QpME.jpg	public	souvlakitruck	f
50031911e4b034c2944f0c3a	/bExPPWxN-4YhYlw2nPz-T5eA3mYN-U78LUZtcIzjTRM.jpg	public	souvlakitruck	t
52373c49498e62a2930117b5	/85032_2JEjjCmOYlsUqDkchtdFaKW9WyiU0nYnCjd-0e4714k.jpg	public	domotaco	t
4ec59ebacc21b428e0de466c	/4AMXSGP5YGTUHEL3TFKTS5ROVIX4HUTU4MU5ZW1OX5E3URDD.jpg	public	domotaco	f
527d2c2711d2c984e85cb11b	/4179871_5FQ2eCC5ZeizUVRLh4tadgEAO1BnJjVQ7pSEvSDwIfQ.jpg	public	biandangnyc	f
512161e0ebca7d20d6a70104	/4574_ZC6mf3ha1jNXmFUDgtNsN3zIf-NHyqgxA3WkUkOl4mY.jpg	public	biandangnyc	f
5106b878e4b05ec869ad8b34	/814104_blIawoImaEcqf-Mg89W5A-nEHiZ5jx76BEYHVzz8dnA.jpg	public	biandangnyc	f
505c9776e4b0643aba1071c7	/5568483_yQrtG73dbug7q06p9IASJmTFnOVgGprIZKbfHjQRcso.jpg	public	biandangnyc	f
4fbfebe9e4b0a3bda0340383	/Brw9_z178IK92xMEXLCSSZrP0-99GXjutCp7dHCi5CQ.jpg	public	thetreatstruck	f
5199097e498ea36447e54093	/40899881_hbjUdavpBfT-sLaBhv3pbZydT1tgs9v-Maw12j9I3Xs.jpg	public	carpedonutnyc	f
520f87b511d2e753e7955853	/44_gUd2HlRFt-yMUFcOdI_EUCdz5NK86hKk-3kHwZhHou0.jpg	public	carpedonutnyc	f
5193f5d8498ec8ee7f53d4ff	/11919710_SXBMpZ4zTc47tVk7zEdSMJG0WmxM4HhlHDhQc7NBzsw.jpg	public	polishcuisine	t
5192873e498e63958610c2eb	/117715_Jf2pdeF9ztory7puWsPaFE26jmMzPEzjOfPopvTzSjA.jpg	public	polishcuisine	f
5244712a11d295d581384a17	/22780_QXd0BtJcOWXZwSm_ZG3oXyaNj6Qw5-p8hWQzzH121fY.jpg	public	polishcuisine	f
5410795c498e74cff2aed48e	/5864_GAP3yP3vlQyBpeK3IKyeS9azCR4R0hgVouqQiGPdTOE.jpg	public	hityourvspot	f
5507187a498e8ab5968bc213	/377760_Wcfue-MAFtEgRyWr0DDPKpXXxnCl7aqPN5ZyMAL9dUI.jpg	public	hityourvspot	f
526e8aee11d299d16e74b447	/67629862_ZPeS1alTFabw1hPqq8PCcGF1SRFynqA23OgkKg8yc00.jpg	public	lovemamak	f
521b83c411d29ec0512f89b3	/255980_1U9yRWzBKuIDLReBhmBs45qJ0mtHu7pzL_Fv4T9gTss.jpg	public	lovemamak	f
513b9b7de4b04f7024bc158a	/45519738_eDUGOpHYwiR5C3VUps1gQ1YDIq0Di3WMfuirGs2EVBk.jpg	public	rickshawtruck	f
5245b75011d28cd2725f32c4	/2982235_y79gPBpI95RkUJ_pZbhVDGujTU5g8hRoskz3BqSI44w.jpg	public	lovemamak	t
5217a7de11d2746c048106cc	/39707564_gPzbz_bNU4iuZ8B8xSD0b250GHVZPaepeD8NOUyrLI8.jpg	public	blend_express	t
556f5fda498e63fb4eda1f61	/68150_wqjx6504Fhkiz_LfsnouqTZvlLmrDMzJu96d8eZO-yw.jpg	public	mamasheros	t
51d31ab97dd28a271207af20	/59958053_5CogfmHgRpBtjkPzVkAgAjK7q9ac0bo8Z1TPwxPIFAw.jpg	public	grillonwheelsny	f
51e0320c498efa962e14eb18	/25342554_SdVvc9WOrSzlj9Rsy_0typl5IcOYEl2vOl_wKVaWoSI.jpg	public	getstuffednow	t
5180207390e7374e46b6c165	/49563206_uKsSD-Cd2jjy6FMyR9U_--7DdUBJ7ZUxtdlushxyIAg.jpg	public	freshandhearty	f
55da547a498eaf4d18cd8668	/68150_a4wUYq9FTUtdVsozCiBJOWbFfw_Mr1J8Jn6Ag9NL4-Q.jpg	public	freshandhearty	t
4f67b0d4e4b08559c4c60149	/SdNxRS0joKXurf0FEv8_SRg-GeR9lGCN098_ZB2tijA.jpg	public	mexicue	f
507efae0e4b09a52c022ec3a	/39213_nH-zcqfLCJqMvG0Nco0LWE4QuRuoL6unlEXJlJbTEF4.jpg	public	mexicue	f
4f8dc377e4b0ca2accf75652	/EKcue5yGEyaPnBymSd_HtBxWEZl4grYSOXMhw-gqpTs.jpg	public	rickshawtruck	f
4fb6bb41e4b066430032e4ca	/HHZWTU3POi_yJE4GU0zI_NjZNerm5y3MjjxddcV5ZMs.jpg	public	rickshawtruck	f
4e42ae7f7d8bec1e4d1a1c92	/RVQ54SSKH1QCVFTLGHQMPXKMGUA3QC3FCQKXU2DOVHQNRT23.jpg	public	fritesnmeats	t
51b8d7aa498e103b3a36ec2d	/47900463_7B6lLfz2PW1XyrG2vCIxp4vIq7QXWEhxufI5i75jwxE.jpg	public	delsnyc	t
51ab89bb498e83fced4cefd6	/66074_8dLzCKmVRde0Uvtx_NSl9SKROFh0kat1IQgcAvU4J3M.jpg	public	delsnyc	f
51fd732d498e415eeb8b9881	/8839239_mAp7_MVmWbbK42Xq3-W-1zmegy-MNx8NzB0P5Brf-Pw.jpg	public	delsnyc	f
520e673a11d25d1282a44199	/117715_KjwJnc6idBB7TuMKhGboHDg8IYjlGcr6h3I6_fJECmM.jpg	public	delsnyc	f
5012d0d5e4b06fc7ce735a68	/7J2g1YLtx4ma57g4A4CerJJ66OwudjGhFI67JaNl1Qw.jpg	public	seoulfoodnyc	f
4f5e6b3fe4b033732b227036	/7Pw4h0QMNateMpgFd_DAFO0uUnsIdcGzmHG_1in7Wu0.jpg	public	seoulfoodnyc	f
4fb1335de4b0f4503b23a67a	/GSQxN-iFZejvploz8v8hm2QzrWiTmg6QdgBffmHvsnc.jpg	public	seoulfoodnyc	f
514e42c7e4b0ec8b7e400875	/48992751_ibL8tx_7JPvV3aQmnEevrdibtLP0jWytaChkCdRuhG8.jpg	public	crafflesnyc	f
514e42a8e4b0d91e975b3db9	/48992751_womoOVd5bv-2KopmWjWEHA_WsyoWQITjAyXBuM4Ciz8.jpg	public	crafflesnyc	f
511d2c60e4b017a4221bec0c	/1425622_srSMuVL9KOV8rqb_UDiSQNwjvNOtMyF-zeTO7sHRZZo.jpg	public	nuchasnyc	f
50ef1f18e4b0710a5e5cb1eb	/117715_4lM2ZgzHp4Uv61-ckuWzdXXXcPVNEH2NjISpWAEjGds.jpg	public	nuchasnyc	f
4ffef65ae4b013ea5f373be1	/VqxEh6cK784gtMOJRF6Lnub985jBJPC6-FuwZwXt_y4.jpg	public	nuchasnyc	f
506dc9b9e4b0c21f078c3bb3	/22983_XN2GbKo3a5YsNY_ZpiBcjUHTD2if3TWS8r586Uq4cEk.jpg	public	blend_express	f
5033cee6e4b03e64bc749ee7	/tIyy6IAKcw2SSiX5JSPBCURstZZisntK_46plgrfdJ0.jpg	public	blend_express	f
519babe8498e355d9d35fca0	/65817_6p9jSMaQMqP9QGn3KOIyuDOG15jaLxIPvsdrpZGWdj8.jpg	public	blend_express	f
523c930a11d22e1c3012a9d3	/34169985_AiTXirGu6jTaGeWWhhOfl2QIbGVaQjdDg1QCEakqza8.jpg	public	mexicue	t
501fe830e4b0bbddce992f90	/fFBOGONZt5Zr77Vc5g8adoAiBht0f-MBut7GqorVEjo.jpg	public	mexicue	f
50784742498ec6be8cd3f88e	/155927_ebZApDyXpTKTmvOQHdBTxNc2wJrsZV2QASmpYTNAVJM.jpg	public	mexicue	f
5249c4bb498ecd25dde27c5e	/764670_x0RdEOs5TL4SEe2zGgpkzPFBFmlFV7-6UQiVtoFeHaY.jpg	public	goburger	f
51dc5a9e498ebf7ad40223ec	/1328035_Ak3fMs2e36r7NvIE_gIDK5XZ9CwrW1DEJa3g1oobp5E.jpg	public	wingnitnyc	f
545d48d2498e3e01487425a1	/8418727_ueAVzhZe5huI9alIjmHct6sTu6gQ4RyIUDXP0_qGF4M.jpg	public	kayanyc28	f
50e719c2e4b0e263423e547e	/15471_4uN0tddGW5orNGh02xhxbiAOGUpAAy3rIWEotoRgB_M.jpg	public	tacobite	f
512bbfebe4b0b8faa466c796	/1425622_4wp7wCuj7Ci1dl_FVH9syKmrJwQavMhL9uqww1b0m1o.jpg	public	philssteaks	f
527e77d111d2e66fa6a871b3	/649454_HIWthX8nL3SZAOwyMlKj9Y7ju9GCiN4OEV-wZR6IKC0.jpg	public	philssteaks	f
50f99bcee4b08ca132377f78	/4611139_CEH3eveI6uxlRVQLet5Fpa_sNfJwAzfheMTYSBplO5Q.jpg	public	thecrepestruck	f
519a7e33498e6e4ea6ff66f1	/3354_e_1JMupbEA8VtOBVXgLHAvtJGQwcpHvY2JyFESXYSjo.jpg	public	thesteelcart	f
51dc0e71498e8db4f9a8106e	/4456614_ZWvsB80ogvwYkoKIyVf6q5RfcDXwuKI4t0XJJhyLQ_I.jpg	public	thesteelcart	f
5391f2fb498eaff244578f11	/715320_7m2CfczIRBJpmjgQRa0xuWupsh_NmhZk_MrRWfnI_mQ.jpg	public	parissandwich	t
4da8977840a3582fb8c49316	/MCGIPRA0XR15JNG4O2YZJQBCRMK05UVTC4T14TOQWRTNMQFZ.jpg	public	eddiespizzany	f
4fd79157e4b071eb33a9c810	/8zrcTIejD5EBiOJzSobql1_PQWr-i2KmRfgMCYmbK-M.jpg	public	eddiespizzany	f
52013fe1498e5f476bfdcf83	/30611522_DHhazmY8dyNAbmijjHX7jyyfVBEiugL5-GJcTLuYjS4.jpg	public	getstuffednow	f
523c8b2a498e959b87f8ded2	/39707564_-WCsPSk2ExKeZ8q06DtUQrpt_vcWG9-AzvFoToSdQqY.jpg	public	getstuffednow	f
51af7257498e0c7f8979c05d	/752258_nUJpoSxZ8p9BBJMG5ISetpo3DDLzycLT_gT3z9fvJmI.jpg	public	getstuffednow	f
50ca356fe4b05b0bb93edc40	/1590381_NyRIp7fXJtGoJoXp25IcMmufNufPxxvLEj3TVYXRo5g.jpg	private	getstuffednow	f
529fe66b498e1fd14afe696f	/68150_h0wbg6xbNwrEjXD6uaE12ZDZYF_h55LN99Es520nMBI.jpg	public	mooshugrill	f
5267fa9611d2688bdc4587a2	/2136029_bvqot1MnMJ9IGYsYJkamqTiE_lL96OcfilWMxskhdU8.jpg	public	mooshugrill	f
5213a7c011d27a56f99dfba3	/11074699_K2ka1_NxiELyTqgjvY3oMN70IUxIlADqRIAb5QpzsLM.jpg	public	mooshugrill	f
5182ad6b498ef6cb59d48783	/39425123_zPh6ih4GAAygbhRJ-pyPdCr5TI3rXafgKyIEEK4HpHY.jpg	public	goburger	f
501d4734e4b0af03cf473287	/6BUHUmEyYTTh3a2SRjSYRklUlTfQBNbFnnk_hfEojYs.jpg	public	goburger	f
51dd9efb498ebbc846c11c03	/13001992_b9dLXH02o0ZX8hyUZVtpgGW6sDyzAl23vmEl-0Hj0jY.jpg	public	itizyicecream	f
4ffda271e4b03bbc7f8fd13a	/6Dtx8fj7IXT6M3O6ZV3rXryb6zKTAqPchjeOM2BJJAs.jpg	public	funbunsnyc	f
505204d6e4b02dee62bd961a	/dcOYoRoNNeCLMxvoyAN-o9gJObcw5FljMqYpS9cps84.jpg	public	funbunsnyc	f
532879fb498ec68315b3d232	/68150_KF6qgT-viSOMS5bt3lJarsNeEUjlVJn1lbAypyCl1js.jpg	public	dubpies	f
53287a0c498edd9a0567c2c0	/68150_i3UKBmIXHPN4h7gtvSQjnYfikUNmJuGRpjwKP2dLI5Q.jpg	public	dubpies	f
5345d100498eaa611b76f338	/62345083_i2VdE3VeEPlbfUgNv9mWmVmsuL19upJhcHaRX3zje1w.jpg	public	dubpies	f
5328764d498e217e55fa24e1	/68150_4QSMIi6zBoyrZ1VeH1Dqb3fEovQswz93yHAPvf2lGmQ.jpg	public	dubpies	t
555a66e0498e8835d908f1cc	/11340787_R901RT00K2RnA_8Q0b_lKvHXGgpf5ReaOYkWrBKW6qY.jpg	public	coneyshack	f
4f9c18b0e4b0b38d2f554383	/AQEKYbyPrQt5uMWhy4r4ODm2vSMCqPseJyMhcg55mtY.jpg	public	eddiespizzany	f
5197fe76498e1c056c96d21b	/117715_m462oAqyqBN12xyWCOyzYR6-1gtYrUa8BiX9r9OybE8.jpg	public	kimchitruck	f
4e3da652d4c058f9dc087a6c	/QEOIS2W35WLTHYK00QC04LKKX4X1SYW3DDI45X30HSKTJENQ.jpg	public	kimchitruck	f
501975c5e4b092f6a51ef338	/bI7RrGcK_moyn-kJICa1OCciBVuYYykwCMGlea6mcxg.jpg	public	kimchitruck	f
4e00e61aa12db1129557e99c	/WSUNYIB0YFVRCTXB13UCRCTANZUG0DO0X2FWCUYYILU4TCGB.jpg	public	kimchitruck	f
50f59e2ee4b0b31f58d6cc1f	/1922740_OhtWiNUDUcN0NE_HB3Tk8vm5qIZcvqxcP2nMDrN8dT0.jpg	public	kimchitruck	t
5286645011d228bbd12f9880	/1353667_2qCG26N4ikz7mbvEGkrFkcNLagGqrzRuNyeQ35CCDE8.jpg	public	korillabbq	f
5231f54311d26e8da5827f3b	/977282_AToQDrlKW5PTNbNGQcB24_BeJNsRMgZTeYmC9P-or38.jpg	public	korillabbq	f
528e451f11d2a93e4361f565	/977282_wEw3nDjN0NbjC4CgQ00ON0YjdtnMocrfAjXDM4UH63Q.jpg	public	korillabbq	f
53287a41498ef1dfde86d217	/68150_jBIeF8OZP2o4q5lJjB4TeUteiuuczqDDm3s4zQGipGc.jpg	public	shanghaisogo	t
530f7b7b498e225c3989957a	/20103877_gKGG5Z15ifazVa7PoBKpyKecZK7x2dWgjFIDOkwO38c.jpg	public	shanghaisogo	f
5254357b498ec4662e20c654	/2620660_kMXeinZ_B6lOrHRQnheIHMBr7p81ZxcUblWl0SQ1vEs.jpg	public	thesteelcart	f
50ad186ae4b0b639ca7ca234	/295161_qCQYG0XjW1Ji0pSDxM7fWRzxTZRbcYyZbsbPNJo12hw.jpg	public	toastmonsternyc	f
521649b811d2913e20a1ae87	/5568483_RtMp5aDM_JtBZOI1u48Jy3om4Z672obezdu1uA_UWd0.jpg	public	toastmonsternyc	f
518a82c9498e068718057964	/25979758_bGWQQ7W2SJI4v7KmU891VcYZGitov6qbSNAnIEt8HTo.jpg	public	toastmonsternyc	f
51f15b4d498ee58fec420a7c	/13285510_Q-SBXKFpfroSwQ-QJdezzrh1KaHfHAmLyicy8d5S1jU.jpg	public	parissandwich	f
5243126c498ea77b19b3a444	/65506790_31Qpx9E-ZjuNve-izmDY6vVxUCMrhgGsnOLn4-fusp4.jpg	public	parissandwich	f
51b22a0a498ec00d1c45726c	/390807_y2oeK6xR54wk9b1Sfm82Ek09Auv2lNkRTpJOzos3xjU.jpg	public	parissandwich	f
5249b1c511d23e54343ae083	/769710_HUiZ7dJrNbdnPYV-DTQRr1z0zgoxFx9KMC_Y-OQ6O2o.jpg	public	bobjotruck	t
51378e9ce4b071feb46ef7cc	/18792384_RSm8zhe_6kUOxy91taByfRjTDSLp7stH7PI41aJHOrU.jpg	public	bobjotruck	f
5249b50c11d2d415e3c6b017	/769710_HOnpTjl0b6qd4-yoPpg9lXZGBy-ZKikqzLlFWw2sQfs.jpg	public	bobjotruck	f
4fe20639e4b05dcdf7f5737c	/l9UdGGevddtOhDk6scQjcy1-TbVBX-wf8Gf56jBIRIg.jpg	public	bobjotruck	f
51c213db498e0748ab0dca3c	/53641916_5aNKp9fdHx3i_Pi15Z_X6pE3fAsTX35YBQ0nlmZGfaA.jpg	public	morristruck	f
4fc7a5d3e4b0647c52b3c26e	/iRvxK7ohXIwK9Ib6wkVgtR46VKRLsamXuElhEtOlNKc.jpg	public	andysitalianice	t
4fc2552fe4b0cec932846e84	/cjaTu8CSMM7HvFDxIUk3I2TF_I8mJyZuejfwTgYLc-c.jpg	private	andysitalianice	f
54356960498ea4b991899874	/1399116_53XPgGs7xW4ug2d4XS1CK8Wn7_vYQnkpDQpPYamcBS8.jpg	public	bigdsgrub	t
4e6513efc65b2dc8a0bfff6d	/TUQTIKBJPOALJKHN54QRKGISWMQDDOW3WTAECOGJ4FOJTPXI.jpg	public	palenquefood	f
4feb2bb8e4b0a47cf49787d7	/-CEaOy-zjgmGzmPRViSeNchwIITBbHgI3lFosreLqIE.jpg	public	shortysnyc	t
51a4ee69abd87ea53396c979	/4083549_jMzaCPEId80kWmAaq2oQ9APKf4bLvdeHhy40qPeB9j8.jpg	public	shortysnyc	f
4fa814d1e4b0d607baf8bd9d	/2drHnu4mqj-uzpwwcJa3MatYGD7KFuxjE472rButWlM.jpg	public	taimmobile	f
504a271ce4b0c65efb6b05f5	/PG0DfZvsxtqv4QM8Xpl6y8Ojahb0UanYwCPSdmuhj_E.jpg	public	taimmobile	t
520538a611d2b476431ac7f9	/117715_GMdoseCn4baUtTX9kN6_PAAfHaGIlUpjxzAitpqLAOY.jpg	public	chefsamirtruck	f
5189442c498e765ce62d5924	/2432527_5nUa0fTfy4rzjXpiIUIlkguBa2kdqFSZIG-PLvkKu2Y.jpg	public	chefsamirtruck	f
4fd0d80de4b062589043211f	/hZjMDK5KKgxjMhmOGBtaRjx_ga0SWHwppqfLfqw20Tg.jpg	public	chefsamirtruck	f
5294e76b11d2879d5217bd00	/47558447_v1SwJZbLSZ2etlJXOF9qw4H3vErpdTiVIqXxULSVTSU.jpg	public	chefsamirtruck	f
5245c79c498e057f7d5ff65d	/117715_CEghvDHaxkALy5RxQCAVW-kyM0TAZo2-fIT4e6veJeo.jpg	public	neaexpress	f
53860b95498ee26cd484fe30	/81832079_fNoLG8cvJl_IqYaTNF8p9uwsDsglMXnfF2DKZ8X0Tk4.jpg	public	mtblls	t
53e3b619498e4b9015f0bad7	/68150_s6TPzQTspWKu7AI0DXgjZai6xKrtSkWgIdJNkenXMfs.jpg	public	mtblls	f
523887bb11d2ac89551d71ff	/5568483_apwtHKsNfvYc-IjeDL1_oqXIqZsLTUGH_-l1uxxAiGo.jpg	public	mtblls	f
521f754c498ee4d6fbe8a778	/22491899_EEPqf4HeJFaaFjYabKyScGZ8symjXEgMjPUEkfpJsJk.jpg	public	morristruck	f
51856452498e6f602088cbe1	/232510_pLk3QUUWFOu82-4SX-ObtA8bw2ZPf61QBOeIuL50T-o.jpg	public	morristruck	f
51dc5fec498e4e9be748eac4	/22801_gX0atVT6Jt_H6FPXuYAqHD4VzO5jAmS4SVid_ZLkk5U.jpg	public	disosnyc	f
525c259b498ea7548cf31f8e	/769710_ZxOOtsSbFVklHIRhXVmTO7ops0Pm0EybRDTgUvGHrSY.jpg	public	disosnyc	f
500ecc9ce4b0a6d209804d9e	/d2yG6CtTrc8TQAXoEGN68UYAv3DiJIqJvKU65-ApcaU.jpg	public	lobstertruckny	f
5245c7a1498e0eb9bc097723	/1727660_xLZtYmqATL4pckN_IhgIj0AgUbDAJxywzqbf5PKEooM.jpg	public	lobstertruckny	f
507b0648e4b0109f3656e2d2	/76137_7JNe3m0dO2MZ7a9rkqa_DTlnrw0LyNitqksFG7_5IC8.jpg	public	lobstertruckny	f
508abe69e4b01ff7516d118b	/8029486_9wt2tO9BnY5d11Ef0mpAgHAqfK1QMmSvLXglU4fj6Xw.jpg	public	lobstertruckny	f
4dcbff9440a3324246c6fb7c	/YVZPSDS5D1O5DR2NK5IFQKOU0ZNOQTQMTHMRWS3ESLQIQAWK.jpg	public	lobstertruckny	t
53287c9c498e4b30223220d1	/68150_mMquObtK1F2QjX3VWuhYK2MtjUA9i5QRzexf9zWrBOQ.jpg	public	thegreenradish1	t
53287ac3498ee8ce8841a510	/68150_pNBQ4zhtsUiGR_kyfk0HziUGMzyIQwYcYpJ3VpZf7tk.jpg	public	thegreenradish1	f
50045b1be4b0004dbf67c977	/MDweBG1fBnF_fZ1tOghWyHS9qUxGNiJeOrOpoA-fBrY.jpg	public	shortysnyc	f
519fa37b498e7adf7e8ebce3	/47170230_A9xVWAtkJBP-vVqUF1q2WlK8yuZTf1CVQz0JcPrHGY0.jpg	public	taimmobile	f
4dfa4a9840a3542ff44549df	/VBAJNQCBWDMP2WKDXJ5QHQ0WYF1MKHZSLUAZZJXKDBDLDUWG.jpg	public	taimmobile	f
507dacb0e4b0d8cafc9601e0	/2361939_S3NwwSNVZD-2tAhc3bwAvsYgk9tXwYv0T0yq9ci-ihE.jpg	public	toumnyc	f
516d98b8e4b0b059e50ff5ad	/117715_BoNkQJO4jPWEtg_ef4-URb7IseoIXnYiP5vkvWJtezg.jpg	public	toumnyc	f
4e42f5ecaeb7f6be72c39c70	/JC5VO3Z50HMMMVLCCGWDQPMKF4W01VBXP1QS2LFESR55UHIX.jpg	public	fritesnmeats	f
51bf306a498ed0fde41060d6	/250434_ayEUsJHsbHDQFjUrGrR2fdlBjswuffyRTlWWFrW0-dU.jpg	public	fritesnmeats	f
5413499511d26b1c8b577c09	/4195495_Ir_R8BxT1YxyTe-VuFD3U5pw6j9CobWIBlYp1FF-TwI.jpg	public	fritesnmeats	f
4fe1fbabe4b0be4ebe6c1c52	/HNMFUfRPXDmxSDWAwh7pixJ34SFUY0fgzZFeOLAVXU8.jpg	public	funbunsnyc	t
5109aed2e4b01d2a5b69b022	/117715_0jgrjk5IsUFppNAL0NtebyMYoz1JMdzrnWAIjrLMHZw.jpg	public	schnitznthings	f
5012e555e4b0dd18ec16bd37	/mZQAOCmv5lnRZ1qOUTwDXk-MLC-X-p01AfECgfLJC2I.jpg	public	schnitznthings	f
522e088e11d2d4539942a387	/39707564_2mJZIxFUyGllfVMRjXdE86dZsCxH8cmCdUv29E4dfmE.jpg	public	schnitznthings	t
542a28a1498e4288ab95e302	/68150_E567_ql-1p2jEv5ysetaEOgtnxpMmeLwZghpwLximCw.jpg	public	papayakingtruck	f
542a28a8498e8c25fb70df8c	/68150_ru2bxW9jr0deeGFaJrvEbwBh8Bv1FRW82ZIglwoRv1M.jpg	public	papayakingtruck	f
52d32962498e318b0a9942f1	/61382883_iF5gX7tlMJ3CWlWcTkpntPniCUpS3o7H8anOau4wiKA.jpg	public	usafoodtruck	f
51dd9ddc498efb9a3437e123	/4501533_djr9d2BEP8dg7E48xJjJTa_Yjk0Iy-MmBG6hgIQBLUs.jpg	public	bigdsgrub	f
4e4e92c7b0fb088f3c0f14d5	/HTLXSW2D30RGIEYPI0JGR22LUCS5BTXQ0LXDWAOHH4PCVHM4.jpg	public	bigdsgrub	f
513101fce4b006d9c4991bdc	/17248619_XfpmI8dNgmoeHE3BXjV8bL2yuuMTqxU3FqDr4BqX7Ks.jpg	public	bigdsgrub	f
4fa2d04de4b0489ba3d7936d	/hsPbM0G5l3AsUaI3x6r_VkiSYo4pYlWTKK2S9zqh_KE.jpg	public	bigdsgrub	f
516452a5e4b0e1b216fdbaa4	/26263584_5wpEOb9FygNRBFQySA-pE1t1q_E9jVM_4mx2mnw5fAU.jpg	public	toumnyc	f
50ce2696e4b0881a7ef3ee67	/263293_lcA30Y_JnQGKaaHhRqFUio2HQ8UQkphCWP9yhW4CE3g.jpg	public	domotaco	f
520912ad11d2f941183dea9f	/13285510_v7K0PTg4FzGI822Jbc9A8K5mUHIxwJPBZB_0xNeEauE.jpg	public	domotaco	f
50ce269de4b07c1547ebfb2c	/263293_qjcLaRmf5itOMyRiq4AyYZuY2UVjVJk04lO3FTA2CMY.jpg	public	domotaco	f
531b7d5e498e3df35f261af2	/22402741_aYe825rrQDsEq6E_Pqv35za149PBn1PcT557SaJhOK4.jpg	public	brooklynpopcorn	t
5220dc78498ebd10d150f736	/29917892_nMZHXkfxBukc2QfFqtDBTZSJ1xpMkoO7VGBJmGKkwhY.jpg	public	brooklynpopcorn	f
5258d3ef11d26d03cc0563a5	/117715_GQ_O1nyBbVlKTaYpRlprc8ZdIEAEftbU4_9hDGjvxsU.jpg	public	brooklynpopcorn	f
4fbfe026e4b04422a08a40f6	/Han8Z4R-SQ615pLoN2lRdPfKEFa6UW2yudSOxXmJtts.jpg	public	thetreatstruck	f
51461b9de4b0bb73a6821e97	/1102787_UDt7OJpexNs8VPrehVDsp9EtfUJnMhKzJ2tTXuof06M.jpg	public	thetreatstruck	f
4f753600e4b07eec20023ddb	/zUb4OswXiQLnF_k2xnx7AdupnEIl1nuGyIuFcmFWf8Q.jpg	public	thetreatstruck	f
538fa2da498e8efc80bc2cb7	/26065139_jgo2VLUL2PokQdo7SP2iJ6rtca8E552GZGM3Bhu1e28.jpg	public	langostruck	f
541cd5a2498e539acbe986b1	/21832446_ZrLNVQwpCFEFosqLZcxwCuMZOAXA7BIQY7J1kYeBp3U.jpg	public	carpedonutnyc	t
5086e523e4b02ca59cae7bd4	/2361939_1JvatS0wOUdQQIaTmd4Vmk8bgr7aFYOR7LaMkRio0X8.jpg	public	mausamnyc	f
513f646ce4b0b1892aaae1bc	/13285510_LmdJLKoCS9fSwm3wy96lcieTczjsLuxAEUnU3FlZDlo.jpg	public	mausamnyc	f
51194bbae4b0cd237850b223	/793192_FQUO1SFGyLkg5NRz6VUYl3_zmFgfy0Mh8gL1unO8ijM.jpg	public	mausamnyc	f
5243206b498e78230cd0770a	/54092198_eF4CEteD3zHjOCJzaYssyRXaQElB-GEOy2sqzBFQPm4.jpg	public	thegreenradish1	f
525ee647498ef229c65969fe	/10045965_ptbEO58Zn5wDz6kgitvMVjFScmxSkkuHNbK-AguCXSM.jpg	public	thegreenradish1	f
514360f4e4b0455b303a4d66	/8626436_tfGrSomdm1qEPFKcyb0Q5atmm3DmDeao1W8MotOtOwY.jpg	public	milktrucknyc	t
4fee068ce4b0f9bd2b4041f7	/UQwqaF9knSdh4LFRzAhnh7hcl6_dSjDTg1phtqTe_7Y.jpg	public	milktrucknyc	f
5281221811d21e907e460e00	/4195495_akELCvAQ7aY-bfTfHk93g5g5_qcJnQJV7h_gH0FlKUA.jpg	public	milktrucknyc	f
4f749b3fe4b0f06c04ae2440	/rA31cWGMm0G8EuZFYZBxb3y2OrW3oEo7vCj1L2XR3AM.jpg	public	milktrucknyc	f
52052ef211d22b8ed81dd96b	/36360429_am9ha8rSYxAvCaSMU9ya6lI9MzIgcpR62DH6HS1b-uY.jpg	public	milktrucknyc	f
5239ddce11d2ab4765d5cc7f	/5568483_alwOH7sfGU8-pKfLmurfe9rt3pk2G6p90KwFyC6hq1A.jpg	public	sweetchilinyc	f
5208f543498eaeeaaad3ce52	/15629_P_UAUr_S-OO0R12wNp8LDPwr-ZbfPiWeG0Q0rrjW6Ww.jpg	public	sweetchilinyc	f
51f2be1f498e71235db5b61b	/117715_mGfGU0UGjUMhgqgwrDPf2f44NZtfMrobqJMF8ahsrjY.jpg	public	sweetchilinyc	f
50e71f82e4b07154c72fdc22	/275165_az4RUZ2U7-4cfdnQA1FlMrDLaxwCMriWtlhS_pddjEc.jpg	public	mexicoblvd	f
5140cc96e4b0ef29f4802508	/4886503_z36ZXtYKGVIHcNLCR18ZdUWtpStRrbf33rInxsr2p1Q.jpg	public	mexicoblvd	f
525de1d7498ef4b27ada0847	/31827631_CApIgPWaXupe3toLi7iJLb6NxIyn2IDTOjAG0qw-PIk.jpg	public	mexicoblvd	f
51cc7075498e8d24309aea57	/991186_cg_CePJhqcT81QY5l1L4eB3MQxy_QlsRh4zmZDk8cFM.jpg	public	biandangnyc	t
51eae36e498e58d50e5683ba	/331066_SArUzXa_cz_-YMQco1rwYAfU8a99TZCHJX9a2WA3fHg.jpg	public	gcnyc1	f
5106bdece4b051d6cb82a376	/1922740_Eqg3x5oj7wks2XGfudNYIAzcCuZHJiWpgLP1CCbonEE.jpg	public	gcnyc1	t
4fba74c1e4b0a2484fae410e	/1XmG8W_3-cY3Qc-l1GwU7YSOBlzOwyGtk2BzKOkxqYY.jpg	public	gcnyc1	f
516d80bd498e8f3b47ac90e6	/36812449_Vbw1XbeTn6HJHdJF1bzMp9TvcwrqCP5edmktYCzlW6k.jpg	public	gcnyc1	f
5280c18811d2e4df572063db	/5354893_5EtQmcwzMnTRFz9qbxjkt9FguCAC4xfW5xwUCyYIrbQ.jpg	public	waffletruck	f
4f733c44e4b039d898ce1409	/PQ9G-O3CAtCW6ixkiwHhICEaRn0L3Lz1F95zKcl_GdI.jpg	public	waffletruck	f
4fd26038e4b06145dfb72894	/zUVUqzIwbwoFsRrRenEhtDmBSbK2Ry9lzqeuYnmnHG0.jpg	public	waffletruck	f
527e823311d2db75dd831ee0	/22419482_1rrrm4nhOKXQsXN25ApmVsGDw4t2J3GyjhfeQPEbClU.jpg	public	waffletruck	f
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: mca
--

COPY locations (id, display, matcher, region, lat, long, hood, zone, site) FROM stdin;
2	26th between 11th & 12th	26th between 11th & 12th	mid	40.751356	-74.006822	Chelsea	Manhattan	nyc
3	36st & Broad	36st & broad	mid	40.751526	-73.987775	Garment District	Manhattan	nyc
4	32rd & Park	32rd & park	mid	40.745774	-73.982260	Murray Hill	Manhattan	nyc
8	39th & Broadway	39th & broadway	up	40.753642	-73.987122	Midtown West	Manhattan	nyc
36	Columbia	columbia	up	40.807371	-73.964404	Morningside Heights	Manhattan	nyc
37	Union Sq	union sq	none	40.735486	-73.991557	Union Sq	Manhattan	nyc
40	Wall & Pearl	wall & pearl	none	40.705533	-74.007926	Financial District	Manhattan	nyc
43	Hanover & Old Slip	hanover & old slip	none	40.704018	-74.008981	Financial District	Manhattan	nyc
44	Old Slip & Water	old slip & water	none	40.704038	-74.008965	Financial District	Manhattan	nyc
45	Fulton & Water	(fulton|water) & (water|fulton)	none	40.707424	-74.004114	Financial District	Manhattan	nyc
46	Starrett-Lehigh	starrettlehigh	none	40.751575	-74.006684	Chelsea	Manhattan	nyc
47	Fulton & Front	(fulton|front) & (front|fulton)	none	40.706914	-74.003792	Financial District	Manhattan	nyc
49	John & Front	(john|front) & (front|john)	none	40.706382	 -74.004601	Financial District	Manhattan	nyc
50	30th & 7th	(7th & 30th|30th & 7th)	none	40.748471	-73.992487	Chelsea	Manhattan	nyc
51	Water & Old Slip	water & old slip	none	40.704081	-74.009010	Financial District	Manhattan	nyc
53	7 Hanover sq	7 hanover sq	none	40.704557	-74.009220	Financial District	Manhattan	nyc
26	53rd & Park	53rd & park	up	40.759067	-73.972610	Midtown West	Manhattan	nyc
59	77 Water	77water	none	40.704390	-74.008419	Financial District	Manhattan	nyc
60	27th & Madison	27th & madison	mid	40.743320	-73.986189	NoMad	Manhattan	nyc
62	47th between Park & Madison	47th between (madison|park) & (park|madison)	up	40.755655	-73.976176	Midtown East	Manhattan	nyc
16	47th & Park	(park|47(th|st)?) & (47(th|st)?|park)	up	40.755332	-73.975305	Midtown East	Manhattan	nyc
9	40th & Park	(40th|park) & (park|40th)	up	40.750853	-73.978594	Murray Hill	Manhattan	nyc
10	40th & Broadway	(40th|broadway) & (broadway|40th)	up	40.754333	-73.986901	Midtown West	Manhattan	nyc
29	56th & Broadway	(broadway|56th) & (56th|broadway)	up	40.765430	-73.982088	Midtown West	Manhattan	nyc
30	58th & Broadway	(broadway|58th) & (58th|broadway)	up	40.767201	-73.981820	Midtown West	Manhattan	nyc
63	55th & 6th	55th (&|@) 6th	up	40.763047	-73.978148	Midtown East	Manhattan	nyc
64	Hudson between Houston & King	hudson between houston & king	none	40.728318	-74.007161	Hudson Square	Manhattan	nyc
65	Fulton between Water & South	fulton between water & south	none	40.706782	-74.003660	Financial District	Manhattan	nyc
21	49th between 6th & 7th	49th between (6th & 7th|6 ?& ?7)	up	40.759904	-73.982359	Midtown West	Manhattan	nyc
66	Varick between Charlton & King	varick between (king|charlton) & (charlton|king)	none	0.727513	-74.005521	Hudson Square	Manhattan	nyc
27	53rd between Park & Lexington	53rd between park & lexington	up	40.758746	-73.971748	Midtown West	Manhattan	nyc
61	52nd between 6th & 7th	52nd between 6(th)? ?(&|n)? 7(th)?	up	40.761774	-73.980945	Midtown West	Manhattan	nyc
7	38th & Broadway	38(th)? ?& ?broadway	up	40.752895	-73.987340	Midtown West	Manhattan	nyc
48	Fulton between Front & South	fulton between (south|front) & (front|south)	none	40.706510	-74.003370	Financial District	Manhattan	nyc
58	Fulton & South	((south|fulton) & (south|fulton)|seaport @ fulton)	none	40.706248	-74.003078	Financial District	Manhattan	nyc
41	Wall & William	(william|wall) & (william|wall)	none	40.706363	-74.009531	Financial District	Manhattan	nyc
23	51st between Park & Madison	51st (between )?park ?& ?madison	up	40.758212	-73.974371	Midtown East	Manhattan	nyc
39	King & Hudson	(king|hudson) & (hudson|king)	none	40.728086	-74.007317	Soho	Manhattan	nyc
11	41st between 6th & Broadway	41st between 6th (n|&) broadway	up	40.754659	-73.985726	Midtown West	Manhattan	nyc
25	52nd & 6th	52(nd)? ?(N|&) ?6(th)?	up	40.761166	-73.979443	Midtown West	Manhattan	nyc
13	46th & 6th	(w)?46(th)? ?& ?6(th)?	up	40.757418	-73.982288	Midtown West	Manhattan	nyc
38	King & Varick	(varick|king) ?& ?(king|varick)	none	40.727889	-74.005495	Soho	Manhattan	nyc
5	33rd & Park	(33(rd)?|park) & (park|33(rd)?)	mid	40.746468	-73.981828	Murray Hill	Manhattan	nyc
42	Hanover & Water	(hanover|water)( sq)? ?& ?(water|hanover)( sq)?	none	40.704089	-74.00900	Financial District	Manhattan	nyc
67	Pearl & Broad	(broad(way)?|pearl) ?& ?(pearl|broad(way)?)	none	40.703444	-74.011630	Financial District	Manhattan	nyc
70	25th & Park	25th & park	mid	40.741458	-73.985422	Flatiron	Manhattan	nyc
71	27th & Park	27th & park	mid	40.742706	-73.984531	NoMad	Manhattan	nyc
69	23rd & Park	23rd & park	mid	40.740172	-73.986363	Flatiron	Manhattan	nyc
22	50th between 6th & 7th	50(th)? between (6th ?& ?7th|6 ?& ?7)	up	40.760400	-73.981444	Midtown West	Manhattan	nyc
24	51st & Park	51(st)? ?& ?park	up	40.757830	-73.973477	Midtown East	Manhattan	nyc
68	Old Slip between Water & Front	old slip between (front|water) (&|n) (front|water)	none	40.703985	-74.008571	Financial District	Manhattan	nyc
52	10 Hanover sq	(10 hanover sq|hanover square)	none	40.704557	-74.009220	Financial District	Manhattan	nyc
90	Wall & Water	(water|wall) & (water|wall)	none	40.705131	-74.007406	Financial District	Manhattan	nyc
92	55th between 6th & 7th	55th between 6th & 7th	up	40.763653	-73.979593	Midtown West	Manhattan	nyc
94	Water & Broad	water & broad	none	40.702961	-74.011477	Financial District	Manhattan	nyc
91	Water between Wall & Gouvernour	water between wall( st)? & gouvernour	none	40.704894	-74.007785	Financial District	Manhattan	nyc
54	Dumbolot	dumbolot	bkl	40.703105	-73.986664	Brooklyn	Brooklyn	nyc
73	55 Water	55 water	none	40.703653	-74.008528	Financial District	Manhattan	nyc
74	22nd between 5th & 6th	22nd between 5th & 6th	mid	40.741546	-73.991616	Flatiron	Manhattan	nyc
77	53rd & Madison	53rd & (mad|madison)	up	40.759708	-73.974214	Midtown East	Manhattan	nyc
6	37th & Broadway	37th & broadway	up	40.752200	-73.987543	Garment District	Manhattan	nyc
12	45th & 6th	45th & 6th	up	40.757425	-73.982273	Midtown West	Manhattan	nyc
15	46th & Park	(46th & park|park & 46th)	up	40.754706	-73.975810	Midtown East	Manhattan	nyc
18	48th & 6th	48th & 6th	up	40.758650	-73.981341	Midtown West	Manhattan	nyc
19	48th between 6th & 7th	48th between 6(th)? & 7(th)?	up	40.759249	-73.982680	Midtown West	Manhattan	nyc
20	49th & 3rd	49th & 3rd	up	40.755254	-73.971262	Midtown East	Manhattan	nyc
31	56th between 2nd & 3rd	56th between 2nd & 3rd	up	40.756639	-73.968762	Midtown East	Manhattan	nyc
32	70th & York	70th & york	up	40.765542	-73.954715	Upper East Side	Manhattan	nyc
33	71st & York	71st & york	up	40.766112	-73.954221	Upper East Side	Manhattan	nyc
34	116th & Amsterdam	116th & amsterdam	up	40.806734	-73.961037	Morningside Heights	Manhattan	nyc
35	116th & Broadway	116th & broadway	up	40.808079	-73.963993	Morningside Heights	Manhattan	nyc
78	65th & Broadway	(broadway|65th) & (65th|broadway)	up	40.772945	-73.982057	Upper West Side	Manhattan	nyc
80	Vandam & Varick	(varick|vandam) & (vandam|varick)	none	40.726394	-74.005652	Soho	Manhattan	nyc
81	27th between 11th & 12th	27th between 11th & 12th	mid	40.751856	-74.006316	Chelsea	Manhattan	nyc
82	Charlton & Varick	(varick|charlton) & (charlton|varick)	none	40.727037	-74.005634	Soho	Manhattan	nyc
83	112th & Broadway	112(th)? & broadway	up	40.805448	-73.965760	Morningside Heights	Manhattan	nyc
84	Old slip & Front	(old slip|front) ?(&|@) ?(old slip|front)	none	40.703776	-74.008364	Financial District	Manhattan	nyc
86	17th & 5th	17th & 5th	mid	40.737901	-73.992212	Union Sq	Manhattan	nyc
87	53rd between Park & Madison	53rd between park ?& ?madison	up	40.759409	-73.973447	Midtown West	Manhattan	nyc
88	49th & 6th	49th & 6th	up	40.759215	-73.980893	Midtown West	Manhattan	nyc
89	Hudson between King & Charlton	hudson between king & charlton	none	40.727704	-74.007285	Hudson Square	Manhattan	nyc
93	99th & Madison	99th & madison	up	40.789202	-73.952694	Upper East Side	Manhattan	nyc
95	Gouvernour & Water	(gouvernour|water) & (gouvernour|water)	none	40.704619	-74.008153	Financial District	Manhattan	nyc
97	Houston & Broadway	(houston|broadway) & (houston|broadway)	none	40.725457	-73.996819	SoHo	Manhattan	nyc
98	58th & Madison	58th & madison	up	40.762954	-73.971847	Midtown West	Manhattan	nyc
85	46th between 6th & 7th	46(th|st)? (between( )?(6&7|6th & 7th)|\\(6&7\\))	up	40.758025	-73.983710	Midtown West	Manhattan	nyc
55	Brooklyn Navy Yard	brooklyn navy yard	bkl	40.699282	-73.972583	Brooklyn	Brooklyn	nyc
56	Jay & Front	(front|jay) & (jay|front)	bkl	40.702351	-73.986671	Brooklyn	Brooklyn	nyc
57	Jay & Water	(water|jay) & (jay|water)	bkl	40.703075	-73.986617	Brooklyn	Brooklyn	nyc
75	Front & Adams	front(s)? & adams	bkl	40.702470	-73.988548	Brooklyn	Brooklyn	nyc
76	MetroTech	metrotech	bkl	40.694219	-73.985725	Brooklyn	Brooklyn	nyc
14	46th between 5th & 6th	46(th|st)? (between )?(5th ?& ?6(th)?|5 ?& ?6|& 5~6)	up	40.756625	-73.980321	Midtown West	Manhattan	nyc
99	45th between 1st & 2nd	45th between 1st & 2nd	up	40.751243	-73.969530	Midtown East	Manhattan	nyc
100	320 West 66	320 west 66	up	40.775990	 -73.987717	Upper West Side	Manhattan	nyc
72	52nd & Park	52(st|nd)? ?&? park	up	40.758444	-73.973026	Midtown East	Manhattan	nyc
101	76th & Amsterdam	jcc	up	40.781190	-73.980043	Upper West Side	Manhattan	nyc
17	47th between Park & Lexington	47 ?(th|st)? between (lex|lexington|park) ?(n|&) ?(park|lex|lexington)	up	40.754942	-73.974389	Midtown East	Manhattan	nyc
102	Broadway between Houston & Bleeker	broadway between (bleeker|houston) & (houston|bleeker)	none	40.726014	-73.996255	SoHo	Manhattan	nyc
103	22nd & 5th	(5th|22nd) & (5th|22nd)	mid	40.740871	-73.990086	Flatiron	Manhattan	nyc
79	Hanover sq between Water & Pearl	hanover( sq)? (between )?water & pearl	none	40.704313	-74.009178	Financial District	Manhattan	nyc
96	21st & 5th	((5th|(w )?21st) & (5th|(w )?21st)| 5(th)? between (e)?20(th)?( & )?(w)?21)	mid	40.740258	-73.990499	Flatiron	Manhattan	nyc
1	20th & 5th	(5(th|ave)?|20(th)?) & (5th|20(th)?)	mid	40.739680	-73.990847	Flatiron	Manhattan	nyc
28	55th & Broadway	(broadway|(w)?55(th)?) (&|n|between) (broadway|(w)55(th)?)	up	40.764966	-73.982223	Midtown West	Manhattan	nyc
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mca
--

SELECT pg_catalog.setval('locations_id_seq', 103, true);


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: mca
--

COPY messages (id, message, date) FROM stdin;
1	  <b>Trucks added:</b><br>\n<a href="/truck/kaya">Kaya NYC</a><br>\n<a href="/truck/kettlecorn">Kettle Corn NYC</a><br>\n<b>Trucks Removed:</b><br>\nSteaks N Crepes<br>	1440441977
\.


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mca
--

SELECT pg_catalog.setval('messages_id_seq', 1, true);


--
-- Data for Name: subs; Type: TABLE DATA; Schema: public; Owner: mca
--

COPY subs (id, regex, replacement) FROM stdin;
1	\\.	 
3	&amp;	&
4	oldslip	Old Slip
6	at the corner of	and
8	 \\/ 	 & 
9	\\/	 & 
10	 and 	 & 
11	55st	55th
12	 mad 	 Madison 
13	 street 	 
14	(@dumbolot)	dumbolot
15	@starrettlehigh	starrettlehigh
18	 at 	 & 
2	-	 
17	 st(.)? 	 
19	,	
20	@ corner of	&
16	( ave | av )	 
5	(bway|bdwy)	broadway
21	!	
22	thst	
7	(btwen|btween|b & (w|t)|b\\\\/w|btwn|btw|bw)	between
\.


--
-- Name: subs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mca
--

SELECT pg_catalog.setval('subs_id_seq', 22, true);


--
-- Data for Name: trucks; Type: TABLE DATA; Schema: public; Owner: mca
--

COPY trucks (id, name, twitname, weburl, tweet, retweeted, lasttweet, lastupdate, type, about, foursquare, matcher, loc, matchmethod) FROM stdin;
miamifood	Miami Food Machine	miamimachinenyc	http://www.miamifoodmachinenyc.com/	RT @YouGotSmoked: Park Ave btw 33rd St and 32nd St from 11:00 to 3:00 today! New York Aged Cheddar Mac and Cheese! Delicious nyc http://t...	t	1437478937	1389964561	Mexican		514b53aee4b00c3e98ec25e9	\N	\N	\N
dels	Del's	delsnyc	http://instagram.com/delsnyc	We apologize for being MIA the past 2 days. We've been preparing for the hottest day of the week! Come find us at 21st & 5th Ave until 4pm	f	1435693089	1409149941	Sweets		519bb56b498ed2dfa950ace2	\N	\N	\N
seoul	Seoul Food	seoulfoodnyc	http://www.seoulfoodnyc.com	Come to 51st street, between Park and Madison - it's lunch time!!	f	1392220033	1392220033	Asian		4e74afad88775d593d9a7eb5	\N	\N	\N
craffels	Craffles	crafflesnyc	http://www.craffles.com/	Happy holidays!!!\nMake ur holidays sweet with our delicious crepe or waffles. Our location for today. Hunter college and union square.	f	1421616846	1388428190	Crepes		514e426ce4b05bcb261d910e	\N	\N	\N
shadydawg	Shady Dawg	shadydawgnyc	http://www.shadydawg.com/	\N	\N	\N	0	American	\N	536e77ea498e8b0d31167218	\N	\N	\N
vspot	Hit your V Spot	hityourvspot	https://www.facebook.com/VSPOT.TRUCK	47th and Park from 11:15am to 2:30pm !!	f	1412066274	1412066274	Vietnamese	\N	53c9479b498e2dfa7e205ff0	\N	\N	\N
nuchas	Nuchas	nuchasnyc	http://www.nuchas.com	OPEN! NuchasTruck on 5th Ave & 21st St MuchasNuchas  - http://t.co/BUSHVUJTol	f	1440959659	1440680992	Mexican		4ebd2a9bb8f7b504a754c130	\N	96	\N
schnitzel	Schnitzel & Things	schnitznthings	http://schnitzelandthings.com	The truck will be on 47th & Park.  Schnitzel time.	f	1422645854	1430322671	German		4a6640b3f964a5204cc81fe3	(schnitztruck|the truck)	16	contains
cinnamonsnail	The Cinnamon Snail	veganlunchtruck	http://www.cinnamonsnail.com/	Parked on 55th/Broadway 9:00-3:00\n*Please read note at the bottom of this post. \n\nHabanero apricot grilled tempeh... http://t.co/9ifeS1tevk	f	1440945184	1425044750	Vegan		4c263af6a852c9287537e66c	1	28	two
kimchitaco	Kimchi Taco	kimchitruck	http://kimchitacotruck.com/	RT @keithbacker: Kimchi Fish Bowl on 52nd and 6th Ave with @KimchiTruck ... no better way to end a week sowoneulmarhaebwa http://t.co/l9Ue...	f	1440942169	1440779831	Korean Fusion		4d6ee122b45b59417c6a6778	\N	25	\N
mamak	Mamak	lovemamak	http://www.lovemamak.com/	hey guys we are @smorgasburg pier 2 @BrooklynBridge_  come come come! http://t.co/llBP6I0uKb	f	1439919392	1410708157	Asian		51c4cffa498ec876f564a0b4	\N	\N	\N
blend	Blend	blend_express	http://blen02.wix.com/blendnyc	Happy Halloween.   47th and park we here.	f	1421948094	1414774175	Latin Fusion		4fa94528e4b0f8fbf13317e6	\N	16	\N
mamasheros	Mamas Heros	mamasheros		Varick street are u hungrayyyyyyy?!?!?!? Lol lunch time on Varick & Charlton	\N	1440603455	1439828702	Sandwitches		5564a8c5498efbaa697c9fb9		82	
grillwheels	Grill On Wheels	grillonwheelsny	#	GOOD MORNING NYC WHAT A BEAUTIFUL DAY TO GO OUT AND GET LUNCH AT HANOVER SQUARE!!!	f	1439939979	1437058212	Kosher		51b0bf31498e9b68db75612c	\N	52	\N
getstuffed	Momos & Buns	getstuffednow	http://www.chinesemirch.com	RT @GovIslandFood: 1/3. Only a few more days till Gov Island gourmet food market powered by @livefastgroup opens for the summer. @Getstuffe...	t	1408198481	1400698983	Chinese Fusion		4fa016cbe4b05d0fc11262c5	\N	\N	\N
freshhearty	Fresh and Hearty	freshandhearty	http://freshandheartynyc.com/	Get your Soup & Panini on with Fresh and Hearty! We parked on 46st btw 5th & 6th ave from 11am to 3pm. Call now 4 free delivery! @3474402467	f	1395241942	1390493878	Soup/Salad/Sandwich		51801f7a90e7374e46b6239f	\N	\N	\N
taipanexpress	Taipan Fusion Express	taipanexpress		Good morning we are serving lunch at 46 st between 5&6ave from 11:30 to 3pm @FoodtoEat @midtownlunch @nystfood	f	1412268299	1408622100	Thai/Chinese/Indian	\N	532b1b92498ea6c0d1026802	\N	\N	\N
mexicue	Mexicue	mexicue	http://mexicueny.com	Eating these sliders under an umbrella is like movie make-out scenes under waterfalls. \n\nCome get em at MadSqEats http://t.co/VxW4aWmiwh	f	1440540594	1410639912	Mexican		4c51a6a71c67ef3ba6b61ab9	\N	\N	\N
eggstrav	eggstravaganza	etravaganza	http://www.eggstravaganzany.com/	Happy Friday!\ndon't miss out your favorite breakfast.\nToday we've been relocated we are at northwest corner of 53rd and Park.	\N	1440765506	1440762880	Mexican	\N	4b15165ef964a52049a823e3	\N	26	\N
kaya	Kaya NYC	kayanyc28	http://www.kayanyc28.com/	Good weather for buns. Bao down today at Charlton and Varick. Get ready by 11:40. lunchbox foodie http://t.co/NwtC90nwmW	\N	1440877734	1440687850	Chinese		54342678498e669166a9d82c		82	
kettlecorn	Kettle Corn NYC	kettlecornnyc	http://www.kettlecornnyc.com/home.php	RT @NY_Places: Mentions for Lincoln Center: http://t.co/AsNuaVrOO1 - RT @KettleCornNYC Come join us at Lincoln Center\nBroadway and 65th St....	\N	1440512955	1437932785	Popcorn				78	
tacobite	Taco Bite	tacobite	http://www.tacobite.com/	Today we are on\n47th St\nBet\nPark Av / Lexington Av	f	1415029173	1406907223	Mexican		503ba49ae4b0fad35eb7a8dc	\N	\N	\N
korilla	Korilla BBQ	korillabbq	http://korillabbq.com	47th and park we will be open by 12	f	1440952898	1439826492	Korean Fusion		4cc701aa01fb236ab070baba	\N	16	\N
carls	Carl's Steaks	carlssteaks	http://carlssteaks.com/home/	We love Thursday ONE more day closer to the weekend! Old slip & water st till 3 30 @EmblemHealth @AIGinsurance... http://t.co/i3ITz7aPib	f	1440950933	1440682683	American		51a78330498e3fc1f22d771e	\N	44	\N
milktruck	Milk Truck	milktrucknyc	http://www.milktrucknyc.com	Bessie is at 53rd & Madison today! Call 646-504-6455 to preorder. Sandwiches also always at @houstonhallnyc or @theseaport!	f	1440858609	1440684009	American		4e823c0229c2dbb2b7043972	\N	77	\N
chefsamir	Comme Ci, Comme Ca	chefsamirtruck	http://www.chefsamirtruck.com	We are at the corner of 55st and Broadway!	f	1440433132	1440776939	Moroccan		4c3c85e3a9509c74b52e395b	\N	28	\N
mooshu	Moo Shu	mooshugrill	http://www.mooshugrill.com	Brought our yummy fare down to SoHo today! Catch us on Hudson & King til 2:30!	f	1418139086	1418396706	Chinese	Moo Shu grill is a slight twist on typical Chinese <a href="https://en.wikipedia.org/wiki/Moo_shu" target="_blank">moo shu</a> The three Moo Shus option is enough for lunch and you can pick and choose a different protein for each. In my opinion the chicken is the best but it is dark meat. </p><p>It's easy to order as there is one window for ordering and for picking up when your name is called.	52090e45498e5500a6bd41fb	\N	39	\N
frites	Frites 'N Meats	fritesnmeats	http://www.fritesnmeats.com/	Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE SPICY JAZZ preorder 9172929226 fidi	f	1440854393	1440768335	American	This is a good burger but this truck is interesting because of the many toppings they carry and their burger of the week. 	4ae9d217f964a520bcb621e3	\N	53	\N
elpaso	El Paso Truck	elpasotruck	http://elpasony.com/	Today we are at @Columbia between W 115th & W 116st. Stop by and get your tacos, burritos, quesadillas yummy  tacotruck FoodTruckfriday	f	1425157921	1412955921	Mexican	\N	523c911f04937624937304c5	\N	36	\N
camion	Camion	camionnyc	http://www.camionnyc.com/	47th & Park Ave. Today's special: angus beef brisket, chipotle BBQ and crispy onions midtown... https://t.co/6yDeOTHU3m	\N	1440532717	1439392038	Mexican		53eced53498ea98fb8a770e4		16	
hh3	Habachi Heaven 3	hibachiheaven	http://www.hibachiheaven.com/	midtown. Come get warm with some hot HIBACHIHEAVENNYC, find us at 33rd/Park and 47th/Park for some yumyum	f	1428064651	1414075107	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	2	5	two
phils3	Phil's Steaks	philssteaks	http://www.philssteaks.com	Happy Phil's Phriday everyone! The Jawn is on 51st and Park until 2. Hope to see you! Have a great weekend - last... http://t.co/otw5uRbnfu	f	1440259484	1440775276	American		4f15b382e4b0725660ea9f31	\N	24	\N
snowday	Snowday	snowdaytruck	http://snowdayfoodtruck.com/	.@CivilEats thanks for the great story - let the people know they can join us for a meal today in Dumbo BK (water and Jay st) till 3:30p	f	1440861549	1440605597	Comfort	\N	533ddd4a498e774b8250a69b	\N	57	\N
mactruck	MacTruck	mactruckny	http://MacTruckNYC.com	Good morning 47st!!! Between park and lex last truck on the block caboose	f	1440772182	1432730877	American	Looking to take a nap after lunch? This truck is great and the owner is incredibly friendly. Feel free to chat it up while you watch him prepare your food.  Not listed on the menu are the many condiments\\n you can get on your macaroni. The regular size is a good portion for a normal lunch.	50575ab8e4b04ed4f2197dac	\N	17	\N
crepestruck	Crepes Truck	thecrepestruck	https://www.facebook.com/thecrepestruck	Come ceck out the Brazzers promo truck in Time Square 48 & 7 ave today till 4pm. http://t.co/wUDdRIZpAh	f	1433610398	1406998102	Crepes		4dfb854918386e743d9869e3	\N	\N	\N
mrnice	Mr Nice Guy	mrniceguytruck	http://mrniceguynyc.com	71st and york... it's friday	f	1414424434	1414687317	American		520bbbb211d26afae232ec59	\N	33	\N
funbuns	Fun Buns	funbunsnyc	http://j24f.com/funbuns/	Last day to get your favorite buns this year at 50th st between 6 / 7 ave midtown Happy Halloween everyone	f	1419358370	1414768000	Asian		4f8d9663e4b021137aa2bdde	\N	22	\N
shanghai	Shanghai Sogo	shanghaisogo	http://www.shanghaisogo.com/	Happy Halloween. TGIFriday !! We r serving at water and Hanover sq!! ( 10 Hanover square ) come & get some. 11~3pm. http://t.co/VBdd8zsVAK	f	1439605325	1414769059	Asian		5258369d498e13def2bef2cb	\N	42	\N
wafelMomma	Wafels & Dinges Momma	waffletruck	http://www.wafelsanddinges.com/	DE TRUCKS:\n\nKastaar @ East 40th & Park Ave til 4pm\nMomma Truck @ Park Slope - 7th Ave Carroll St til 4pm	f	1440952041	1440771798	Belgian		4a416369f964a52036a51fe3	momma	9	before
lobsterjoint	Lobster Joint	lobsterrolling	http://www.lobsterjoint.com/food_truck.html	Good Morning NYC,\nCome enjoy a Fresh Lobster Roll & Slider & Lobster Gazpacho. We are on 21st & 5th Ave. @ClubMonaco @katespadeny @Chase	\N	1440944293	1440602811	Seafood		552d5dcd498edeb4d817ef9a		96	
neapolitan	Neapolitan Express	neaexpress	http://neapolitanexpress.com/	Find us at @dumbolot today for some authentic neapolitan pizza foodtruck	f	1440105100	1439997103	Pizza		51c8864c498e0ac96c14433e	\N	54	\N
shuka	Shuka Truck	shukanyc	https://www.facebook.com/ShukaTruckNYC	SHUKA FRIDAYS AT 46th St & 6th Av ! Shabbat Shalom and have A EggCellent weekend!  http://t.co/7CcfWCqyGL	\N	1440946525	1440774167	Israeli	\N	546a5011498e0e047a243f37	\N	13	\N
steelcart	The Steel Cart	thesteelcart	http://www.thesteelcart.com/	Makin a grand finale on Front & Jay! Stick it to the weatherman with a toasted sandwich & grits. Soup today is Rustic Chicken Noodle.	f	1436887174	1419950738	French		511d3abee4b0e188895f3697	\N	56	\N
toastmonster	Toast Monster	toastmonsternyc	http://www.toastmonsternyc.com/	Toast Monster @UrbanSpaceNYC @GarmentDstrctNY till October 17. On Broadway between 40th and 39th st.	f	1428680926	1411270224	American		50ad1829e4b087613d696bc4	\N	\N	\N
paris	Paris Sandwich	parissandwich	http://www.parissandwiches.com/	Last day in dumbo today on fronts and Adams @ 11:30 @DUMBOFoodTrucks	f	1436401880	1414764931	French/Vietnamese		519e4ed0498e4f27e64c177a	\N	75	\N
gorilla2	Gorilla Cheese 2	gcnyc1	http://t.co/4ZDqfwSH5f	G1 46 5/6\nG2 broadway / 55th \n Burger Patty Melt:\nAmerican, pickle ,caramelized onions, tomato, Ketchup (bacon optional)\nComeToTheCheeseYo	f	1440872073	1440775908	American		4dc2d3e352b1c1fb37f1e945	g2	14	before
eddiespizza	Eddie's Pizza	eddiespizzany	http://www.eddiespizzany.com/	Lunch today on 46th between 5th and 6th. Special: white pizza with bacon, pineapple and sriracha http://t.co/HTnAO3MeWz	f	1440881555	1440595176	Pizza		4c0cf412b4c6d13ae4850c30	\N	14	\N
mamuthai	Mamu Thai Noodle	mamuthainoodle	https://www.facebook.com/MamuThaiNoodle	Dumbo? Yes! @dumbolot @DUMBOFoodTrucks	f	1440782725	1439569203	Thai		5126a10ae4b0af674c85f353	\N	54	\N
dubpies	DUB Pies	dubpies	http://www.dubpies.com/	@PersistentCooki hey - yeah, as posted earlier, the truck didn't make it out today. We're usually @ Hudson/King on Friday anyway. Sorry!	f	1440949268	1440797308	New Zealand meat pies	\N	4eb825a62c5b53141b78bfb6	\N	39	\N
coneyshack	Coney Shack	coneyshack		Coney Island ,home of the warriors we're back in full swing come by for the grand re-opening  or truck located on 46th and 6th ave midtown	\N	1440943759	1440769251	Asian		524b2983498e0f789f2804cb		13	
mausam	Mausam	mausamnyc	http://www.mausamnyc.com	RT @dumbolot: Thursdays with @ToumNYC @MexicoBlvd and @mausamnyc!	f	1440946640	1440683605	Indian		50730eebe4b0f3224431dc5d	\N	54	\N
sweetchili	Sweet Chili	sweetchilinyc	http://sweetchilinyc.com/	TGIF we are @DumboLot jay & water 1130-3pm today and we wont be back till sept 11th! thaietnamese	f	1440775395	1440772201	Asian		51a8c802498e2165ca855a19	\N	54	\N
latinkitchennyc	Latin Kitchen	latinkitchennyc	http://www.latinkitchennyc.com/	HAPPY HALLOWEEN ! ! TODAY OUR LAST FRI OF 2014 ..THANK YOU WALLSTREET! !\nLOCATION 55 WATER ST (SIDE OF OLD SLIP) NYC http://t.co/RWCtK9bCEc	f	1440962334	1414768415	Mexican	\N	53878518498ef00115dbdea1	\N	73	\N
mexicoblvd	Mexico Blvd.	mexicoblvd	http://mexicoblvd.com	Muy buen y feliz dia!  @MexicoBlvd @dumbolot cocinatradicional mexicana Water&Jay	f	1440785812	1440687669	Mexican		4f4e55aee4b04c96fba5b149	\N	54	\N
bobjo	BobJo	bobjotruck	http://www.bobjo.net	Good morning we are open at 47 th st btween park and lex ave. try our korean BBQ beef(galbi)pork, shrimp. And spicy chicken bowl as well thx	f	1436371192	1440603687	\N		4e3add0c88772c3bf12772da	\N	17	\N
mtblls	Mtblls	mtblls		TGIF MTBLL LOVERS!  Stroll on by 50th bet 6&7 Aves for your weekend fix. The  will be waiting 	f	1440364380	1440168472	Italian	\N	504fb7fde4b0bc88c3a6b614	\N	22	\N
pontirossi	Ponti Rossi	pontirossifood	http://www.pontirossifood.com/	@DenaPaduano allora parli italiano!  martedi Wall Street all'angolo di water st & old slip! Ti aspettiamo	f	1440769870	1440365354	Italian	\N	542d78f4498ee5493e1a8989	\N	51	\N
schnitzelcart	Schnitzel & Things Cart	schnitznthings	http://schnitzelandthings.com	It's Schnitzel time.  The cart will be on 27th & Park serving up your favorite lunch!	f	1431702487	1426694447	German	\N	4a6640b3f964a5204cc81fe3	(schnitzcart|the cart)	71	contains
andysitalianice	Andy's Italian Ice	andysitalianice	http://andysitalianicesnyc.com/	We are now open on 55th and Broadway. Come check out our amazing new menu. @nycfoodtruck @grubstreet @FTFUSA @StreetGrubSteve	f	1440951708	1440686487	Dessert	\N	4df26c2bae609e69dd95d2fc	\N	28	\N
hh2	Habachi Heaven 2	hibachiheaven	http://www.hibachiheaven.com/	Open and ready to roll corner of Varick and King	f	1428064651	1423759572	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	1	38	two
cinnamonsnail2	The Cinnamon Snail 2	veganlunchtruck	http://www.cinnamonsnail.com/	This week:\n\nMon: 48th/6th\nTUES: water/Gouvernour Ln, AND Dinner on 4th Street near Washington Square\nWEDNESDAY:... http://t.co/ssXs1PztRI	\N	1440945184	1423425704	Vegan	\N	4c263af6a852c9287537e66c	2	95	two
papayakingtruck	Papaya King	papayakingtruck	https://www.facebook.com/papayaking	It's NationalHotDogDay and we are in Metrotech today - @DowntownBklyn http://t.co/BRqMvfs7k4	f	1440947286	1437661715	American		50952bd2e4b03898afd23fe3		76	
morris	Morris Grilled Cheese	morristruck	http://morrisgrilledcheese.com/	It's almost lunch time at metrotech downtown brooklyn! We'll be slinging grilled cheese 11:30-3 see you there!	f	1440877594	1440083124	American		4e0e0b3caeb7a5b33ee5dac1	\N	76	\N
disos	DiSO's	disosnyc	http://www.disosnyc.com/	Lunch on water st and old slip today. \n\nCall in orders to: 917-756-4145	f	1440819022	1440685920	Italian Sandwiches	These might be typical italian sandwiches but the ingredients are high quality. You need to get there early because the line can get long and they will run out of some breads. I believe the focaccia half is a normal portion for lunch while their half and hero sizes are pretty big.	519523d6498eeaa6200aad03	\N	51	\N
yankeedd	Yankee Doodle Dandy's	usafoodtruck		Happy Fryday! We're servin up the best Southern style fried chicken in NYC! Come to 46th St. b/w 5th & 6th Ave. n get you some! YDD	f	1440949261	1440775832	American	\N	52b497e1498eed13ead2b84c	\N	14	\N
sweetery	Sweetery	sweeterynyc	http://sweeterynyc.com	Get ready! The Monopoly Here & Now Food truck will be serving FREE ice cream from 3-5pm @ union square west btwn 17&16.	f	1440186799	1439922656	Sweets		4a28d919f964a52056951fe3	\N	37	\N
bigds	Big D's	bigdsgrub	http://bigdsgrub.com/	Come n' Grub! 50th Street btwn 6th and 7th Avenue http://t.co/mffhq5UCYs	f	1440699398	1440778859	Korean Fusion		4c968b907605199c2eaec2a3	\N	22	\N
lobstertruck	Red Hook Lobster	lobstertruckny	http://redhooklobster.com/	Happy Lobster Friday! BigRed is on the corner of 46th and 6th serving up lobster and sunshine http://t.co/RYBmNHFIAV	f	1440783427	1440774601	\N		4dc597c57d8b14fb462ed076	\N	13	\N
pocketful	The Pocketful	thepocketful	http://thepocketful.com/	Our cart is back on 50th between 6th and 7th. Enjoy the sunshine!	f	1438095791	1430145608	Mediterranean		4db8bcd790a0e3f61d601888	\N	22	\N
greenradish	The Green Radish	thegreenradish1	http://www.thegreenradish.com/	Good Day to GetNaked NakedBeanBurgers 47th between Park and Lexington https://t.co/4ou7IczI7R	f	1440797431	1432902203	Vegan		5229feab11d2edde794d385c	\N	17	\N
toum	Toum NYC	toumnyc	https://www.facebook.com/ToumNYC	FoodTruckFriday FalafelFriday it's all happening today on Old Slip btwn Water & Front St until 3pm! vegan falafel http://t.co/wNkVMcnRSC	f	1440947651	1440768620	Lebanese		500eedb0e4b062ee00577957	\N	68	\N
chipsy	Chipsy King	chipsykingny	http://chipsykingny.com/	Kasar truck is at 46th and 6th avenue until 7pm	f	1437241508	1436448508	Fries		51bb5c43498ee06e13d0d31f	\N	13	\N
palenque	Palenque	palenquefood	http://www.palenquehomemadecolombianfood.com	RT @KristinaMongan: @Palenquefood TY4my 1st eva Arepa! So friendly &delicious! BwayBites muy bueno! NomNom whatsnext vivacolumbia http...	f	1440365254	1434670346	Colombian Fusion		4e84f424dab45bbd2617dc62	\N	36	\N
shortys	Shortys	shortysnyc	http://www.shortysnyc.com	Up and running at SouthStreetSeaport South and Fulton Streets Cheesesteak ChickenCheesesteak RoastPork... http://t.co/awyzKOzJqw	f	1440851248	1415982867	American		4faea2cce4b08a88c5dc5d05	\N	58	\N
lukeslobster	Luke's Lobster	nautimobile	http://lukeslobster.com/	This is it, our last day on the streets of NYC. 17th st and 5th ave. So long, farewell, see ya when we see ya.	f	1440867360	1430398345	Seafood		4dc81239b0fb5556cd2f3023	\N	86	\N
taim	Taim Mobile	taimmobile	http://www.taimmobile.com/	Get fala-FULL with @TaimMobile and @lyft!  We are on 20th and 5th today!	f	1440711827	1440692367	Mediterranean		4cf2c5321d18a143951b5cec	\N	1	\N
schnitzi	Schnitzi	schnitzi1	http://www.schnitzi.com/	Get some fuel for the day with some Schnitzi's sandwich @46 and 6 order online @www.schnitzi.com schnitzitruck schnitzel kosher	\N	1440699961	1440084119	German	\N	532b25ed498eb8b1844dc14f	\N	13	\N
souvlaki	Souvlaki GR	souvlakitruck	http://www.souvlakigr.com/	@berddistheword Were on Varick/Charlton today with a little taste of Mykonos @HudsonSquareNYC	\N	1440946229	1440691410	Greek	\N	4c75c2908d70b713d5dcdaad	\N	82	\N
valduccis	Valduccis	valduccis	http://valduccis.com	RT @greenboxny: RT @Valduccis: The slices are red-hot 51st St. and Park @greenboxny @FoodtoEat @Foodtruckstars_ ... http://t.co/QCZzt1RZnq	f	1440858251	1434247434	Pizza		4df7e1aad4c02ad734170b21	\N	24	\N
carpedonut	Carpe Donut	carpedonutnyc	http://carpedonutnyc.com/	Truck open at 55th street and Broadway. Come!!!	f	1440944564	1440759415	Sweets	They only server one kind of donut here, the apple cider, but it's a pretty good one. They are fresh and still hot when you get them. They have donut ice cream sandwiches but you should know the entire thing is in the freezer so you will get a frozen donut as well.	5169892c498e0522481eea97	\N	28	\N
domo	Domo Taco	domotaco	http://www.domotaco.com	Come to Old Slip & Front for a little Fryday happiness:)	f	1440847438	1440766612	Asian Fusion		4ed90a2e77c8274efb746d83	\N	84	\N
biandang	Bian Dang	biandangnyc	http://www.biandangnyc.com/	Happy Friday from 53rd & Park! In case you miss us we're across the street between Park and Madison today!	f	1440711886	1440766562	Taiwanese		4d712874722ef04d04160d9c	\N	26	\N
brooklynpopcorn	Brooklyn Popcorn	brooklynpopcorn	http://brooklynpopcorn.com/	Good afternoon NYC hope everyone is enjoying their beautiful Wednesday! We are looking forward to seeing you on Hudson & King Street :)	f	1438960225	1434567787	Popcorn!		514a0737e4b09c3e77279d83	\N	39	\N
treats	The Treats Truck	thetreatstruck	http://www.treatstruck.com	!!! Wed,July 1st 12-3:30 45th st & 6th! Last day on 45th before our summer break! Come on by! Then 4ish-7pm 18th st & 7th ave!!!	f	1439213131	1435762655	Sweets		49e65021f964a52035641fe3	\N	12	\N
langos	Langos	langostruck	http://www.langostruck.com/	dear friends \nwe're off the road today ,because of private event\n\nsee you at Governor's Island on Sunday or Tuesday in Midtown 52st/Park Ave	f	1440684762	1440771533	Hungarian	\N	537a883c498eb7fac064409f	\N	72	\N
gorilla1	Gorilla Cheese 1	gcnyc1	http://www.gorillacheesenyc.com/	G1 46 5/6\nG2 broadway / 55th \n Burger Patty Melt:\nAmerican, pickle ,caramelized onions, tomato, Ketchup (bacon optional)\nComeToTheCheeseYo	f	1440872073	1440775908	American		4dc2d3e352b1c1fb37f1e945	g1	14	before
wafelKastaar	Wafels & Dinges Kastaar	waffletruck	http://www.wafelsanddinges.com/	DE TRUCKS:\n\nKastaar @ East 40th & Park Ave til 4pm\nMomma Truck @ Park Slope - 7th Ave Carroll St til 4pm	f	1440952041	1440771798	Belgian		4a416369f964a52036a51fe3	kastaar	9	before
polish	Old Traditional Polish Cuisine	polishcuisine	https://www.facebook.com/pages/Old-Traditional-Polish-Cuisine/315496671902708	47th bw Park & Lexington....open and ready to roll! MidtownEast lunch midtown nyc pierogitime	f	1440848828	1440773846	Polish		51435df4e4b0823a398ebc8a	\N	17	\N
\.


--
-- Data for Name: truckstats; Type: TABLE DATA; Schema: public; Owner: mca
--

COPY truckstats (id, "time", street, region, location) FROM stdin;
mamak	1395335316	21	mid	 21st and 5th ave
lobstertruck	1395335316	55	up	 55th st  & Broad
shortys	1395335316	47	up	 47th & Park 
sweetery	1395335316	none	none	Hudson / King St  
hh3	1395335316	55	up	 Broadway bet 55 & 56st 
grillwheels	1395335316	36	up	 36st off Broad
gorilla2	1395335316	50	up	 50 / 6 
palenque	1395335316	none	none	World Financial Center
gorilla1	1395335316	Hanover	none	 Hanover water / pearl 
pocketful	1395335316	50	up	 50th between 6th and 7th
domo	1395335316	dumbo	bkl	dumbolot
hh2	1395335316	Varick	none	 Varick & King  
polish	1395335316	19	mid	 5 ave and 19th st 
carls	1395335316	Hanover	none	 10 Hanover square and water st 
cinnamonsnail	1395335316	21	mid	 21st & 5th 
bobjo	1395335316	Hanover	none	 water and Hanover 
morris	1395335316	51	up	 51st btw Park and Mad
toum	1395335316	Jay & Water	bkl	 Jay & Water Str
brooklynpopcorn	1395335316	70	up	 70th and York 
lukeslobster	1395335316	23	mid	 23rd and Park    
bigds	1395335316	50	up	50th btwn 6 & 7th Ave 
mexicoblvd	1395335316	Jay & Water	bkl	 Jay & Water Str
nuchas	1395335316	55	up	 55 between 6 and 6 1
treats	1395335316	86	up	 Bway  86 & 87th 
carpedonut	1395335316	55	up	 55th and Broad
valduccis	1395335316	50	up	50th and 6th
schnitzel	1395335316	51	up	 51st between park and mad
biandang	1395335316	53	up	53rd street between Park and Lexington avenue
korilla	1395335316	47	up	 47th & Park
frites	1395335316	wfc	none	wfc
greenradish	1395335316	52	up	@52 & 6th 
kimchitaco	1395335316	Varick	none	 Varick & Charlton 11
steelcart	1395335316	56	up	Broadway & 56
mooshu	1395335316	46	up	 46th & 6th 
mactruck	1395335316	55	up	 Broadway!!! Between 55 / 56 
wafelKastaar	1395335316	23	mid	 23rd & Lex
disos	1395335316	47	up	 47th between park and lex  
chipsy	1395335316	47	up	 47th and Park aven
grillwheels	1395421201	46	up	 46th off 6th 
lobstertruck	1395421201	46	up	 46th st & 6th Ave 
dubpies	1395421201	none	none	 3 in any valid ranking  
shortys	1395421201	WFC	none	WFC
mikenwillie	1395421201	47	up	 spring and it's looking like a nice one 47th St btwn Lex
hh3	1395421201	46	up	 46st bet 5 & 6 
gorilla2	1395421201	52	up	 52 / 6 
schnitzelcart	1395421201	49	up	 49th st b / w 6th & 7th 
palenque	1395421201	Jay str & Water	bkl	 Jay str & Water str  
gorilla1	1395421201	46	up	 46 5 / 6 
pocketful	1395421201	49	up	 49th  between 6th and 7th 
domo	1395421201	49	up	 49th & 6th 
mamuthai	1395421201	dumbo	bkl	dumbolot
polish	1395421201	55	up	 55th and broad
hh2	1395421201	21	mid	 5 Ave & 21st 
carls	1395421201	56	up	 Broadway & 56th st   
cinnamonsnail	1395421201	46	up	 park ave between 46th 
morris	1395421201	WFC	none	WFC
toum	1395421201	brookfieldplny	none	brookfieldplny
phils3	1395421201	41	up	 41st n 6th  
milktruck	1395421201	wall	none	 wall & william and 
lukeslobster	1395421201	46	up	 1  Metro cards also make great toothpicks  More tips at 46th and Park n
mexicoblvd	1395421201	46	up	 46th btw  6th & 7th 
getstuffed	1395421201	none	none	 7 & 8  2014
carpedonut	1395421201	55	up	 55th and Broad
treats	1395421201	45	up	 45th & 6th  
valduccis	1395421201	26	mid	 601 26th & 11th @
kimchitaco	1395421201	52	up	 52nd St  bet  6th & 7th Ave  11
schnitzel	1395421201	WFC	none	WFC
biandang	1395421201	53	up	53rd street between Park and Lexington avenue
korilla	1395421201	dumbo	bkl	dumbolot
frites	1395421201	Hanover	none	 7 Hanover sq b / t water st & pearl  
greenradish	1395421201	56	up	 56th & Bway 11
steelcart	1395421201	Front & Jay	bkl	 Front & Jay  
mooshu	1395421201	50	up	 50th & 6th ave 
disos	1395421201	Wall	none	Wall and water st 
chefsamir	1395421201	56	up	 Broadway at 56st
shanghai	1395421201	22	mid	 22th st & 5th ave 
mactruck	1395421201	47	up	 47st  Between Park & Lex 
wafelKastaar	1395421201	40	up	 40th & Park 
chipsy	1395421201	55	up	 Broadway and 55th str
wafelMomma	1395421201	43	up	 43rd & 2nd ave 
grillwheels	1395680402	46	up	 46th off 6th 
shortys	1395680402	WFC	none	WFC
sweetery	1395680402	none	none	 Hudson / King St  
hh3	1395680402	55	up	 Broadway & 55st  
eddiespizza	1395680402	26	mid	 26th between 11th and   
gorilla2	1395680402	55	up	 Broadway / 55 
schnitzelcart	1395680402	55	up	 55th & broad
domo	1395680402	50	up	 50th & 6th 
mamuthai	1395680402	WFC	none	WFC
polish	1395680402	Varick	none	 Varick & Charlton 
hh2	1395680402	none	none	 Murray @ Greenwich 
carls	1395680402	36	up	 36th st &Broad
cinnamonsnail	1395680402	48	up	 48th between 6th and 7th  
bobjo	1395680402	46	up	 46st btw 6ave & 5ave 
morris	1395680402	52	up	 52nd & 6th and 
toum	1395680402	dumbo	bkl	dumbolot
phils3	1395680402	41	up	 41st and 6th 
milktruck	1395680402		up	@Columbia
bigds	1395680402	none	none	Hudson St and King St 
mexicoblvd	1395680402	Jay & Water	bkl	 Jay & Water St 
nuchas	1395680402	none	none	 Charlton & King 
taim	1395680402	20	mid	 20th / 5th 
treats	1395680402	none	none	 5th no truck  just deliveries! And our shop open 7
kimchitaco	1395680402	Vesey	none	 N  End Ave & Vesey St    
schnitzel	1395680402	Varick	none	 Varick & Charlton 
biandang	1395680402	53	up	53rd and park
frites	1395680402	50	up	 50th st b / t 6th & 7th av  
steelcart	1395680402	Front & Jay	bkl	Front & Jay 
mooshu	1395680402	Jay & Water	bkl	 Jay & Water
chefsamir	1395680402	old slip	none	 water st and old slip
shanghai	1395680402	VARICK	none	@VARICK & VANDAM  N
mactruck	1395680402	none	none	World Financial Center
disos	1395680402	56	up	 56th st and Broad
chipsy	1395680402	46	up	 46th and Park aven
sweetery	1395766801	none	none	 Hudson / King St  
grillwheels	1395766801	47	up	 47th off Park Ave 
eddiespizza	1395766801	none	none	World Financial Center
dubpies	1395766801	Jay St  And Water	bkl	 Jay St  And Water St  
shortys	1395766801	47	up	47th & Park   
hh3	1395766801	25	mid	 Park & 25st  
schnitzelcart	1395766801	none	none	Greenwich st & park 
gorilla1	1395766801	Varick	none	 Varick / Charlton 
pocketful	1395766801	50	up	 50th  between 6th and 7th 
domo	1395766801	55	up	 55th & B'way 
polish	1395766801	52	up	52nd b / w 6th & 7th 
hh2	1395766801	25	mid	 Park & 25st 
gorilla2	1395766801	52	up	 52 / 6 
carls	1395766801	dumbo	bkl	dumbolot
cinnamonsnail	1395766801	Wall	none	Wall st  Between Water / Pearl 9
bobjo	1395766801	Hanover	none	 water st  And Hanover 
morris	1395766801	28	mid	 28 & Lex
toum	1395766801	46	up	 46th btwn 5th & 6th  
phils3	1395766801	26	mid	 26th btw 11 / 12 
milktruck	1395766801	25	mid	 25th & Park Ave 
bigds	1395766801	WFC	none	WFC @ Vesey St & North End Ave 
mexicoblvd	1395766801	46	up	 46th between 6th ave & 7th 
biandang	1395766801	53	up	 53rd & Park 
korilla	1395766801	Varick	none	 Varick & Vandam
greenradish	1395766801	51	up	 51 & Park
mooshu	1395766801	50	up	 50th & 6th
kimchitaco	1395766801	dumbo	bkl	dumbolot
schnitzel	1395766801	52	up	 52nd & 6th  
disos	1395766801	48	up	 48th bet 6 and 7 
wafelKastaar	1395766801	none	none	 4th & Greene St 
chefsamir	1395766801	36	up	 36st and Broad
mactruck	1395766801	none	none	World financial center
grillwheels	1395853201	55	up	 55 st off Broad
yume	1395853201	55	up	 Broadway & 55th   
lobstertruck	1395853201	50	up	 50th st  & 6th Ave  
shortys	1395853201	Jay & Water	bkl	Jay & Water  
hh3	1395853201	46	up	 46st bet 5 & 6 
gorilla2	1395853201	26	mid	 26th 11 / 12 
schnitzelcart	1395853201	27	mid	 27th & Park 
palenque	1395853201	Varick	none	 Varick & Charlton Str
pocketful	1395853201	53	up	 53rd between Park and Mad
domo	1395853201	jay & water	bkl	 jay & water
polish	1395853201	46	up	 46th b / w 5th and 6th 
hh2	1395853201	Old Slip	none	 Old Slip & Water st 
carls	1395853201	49	up	 49th st bet 6 / 7th 
cinnamonsnail	1395853201	55	up	 55th & Broad
bobjo	1395853201	55	up	 Broadway btw 55st and 56st  
morris	1395853201	DUMBO	bkl	DUMBOFoodTrucks
toum	1395853201	47	up	 47th btwn Park & Lex
phils3	1395853201	41	up	41st and 6th 
milktruck	1395853201	58	up	 58th & Mad  
lukeslobster	1395853201	23	mid	 23rd and park 
bigds	1395853201	50	up	50th btwn 6 & 7th Ave 
mexicoblvd	1395853201	brookfieldplny	none	brookfieldplny
nuchas	1395853201	44	up	 Bway btwn 44 and 45 
taim	1395853201	brookfieldplny	none	brookfieldplny
carpedonut	1395853201	51	up	 51st and Park
treats	1395853201	45	up	 26th  pm 45th & 6th  4
biandang	1395853201	53	up	 53rd n Park 
korilla	1395853201	none	none	 front and gouverneur 
frites	1395853201	none	none	 Hudson & king  
greenradish	1395853201	38	up	 38th & Bway 
steelcart	1395853201	DUMBO	bkl	DUMBOFoodTrucks
mooshu	1395853201	55	up	 55th & Broad
kimchitaco	1395853201	55	up	 55th St  bet  6th & 7th Ave  11
schnitzel	1395853201	47	up	 47th b / w park and lex 
disos	1395853201	Varick	none	Varick and charlton st     
chefsamir	1395853201	52	up	 52st and park av
mausam	1395853201	WFC	none	WFC
mactruck	1395853201	28	mid	 Park ave South  Between 28th & 29th 
tacobite	1395853201	55	up	 55th st & Broad
hh3	1395939602	55	up	 broadway & 55st  
sweetery	1395939602	none	none	Hudson / King 
grillwheels	1395939602	46	up	 46th off 6th Ave 
eddiespizza	1395939602	hanover	none	 water st and hanover 
lobstertruck	1395939602	55	up	 Broadway bt  55th & 56th  
shortys	1395939602	47	up	 47th & Park  
gorilla2	1395939602	50	up	 50 / 6 
schnitzelcart	1395939602	26	mid	 26th b / w 11th & 12th 
palenque	1395939602	WFC	none	WFC
gorilla1	1395939602	Hanover	none	 Hanover water / pearl 
pocketful	1395939602	49	up	 49th between 6th and 7th
domo	1395939602	53	up	53rd & park 
polish	1395939602	55	up	 55th and Broad
hh2	1395939602	Varick	none	 Varick & King 
carls	1395939602	Hanover	none	 10 Hanover sq & Water st   
cinnamonsnail	1395939602	21	mid	 21st & 5th 9
morris	1395939602	51	up	 51st nr Mad
toum	1395939602	dumbo	bkl	dumbolot
phils3	1395939602	52	up	52nd and 6th 
milktruck	1395939602	Vesey	none	 North End Ave & Vesey  
lukeslobster	1395939602	23	mid	 23rd and park 
bigds	1395939602	50	up	50th btwn 6 & 7th Ave 
mexicoblvd	1395939602	Jay & Water	bkl	 Jay & Water St 
nuchas	1395939602	55	up	 55 b / t 6 & 6 1 / 2
taim	1395939602	20	mid	 20th and 5th 
greenradish	1395939602	52	up	 52 & 6 11
mooshu	1395939602	45	up	 45th & 6th 
schnitzel	1395939602	51	up	 51st b / w park and mad
korilla	1395939602	47	up	 47th & Park sta
frites	1395939602	WFC	none	WFC
mactruck	1395939602	55	up	 broadway!! Between 55 / 56 
disos	1395939602	47	up	 47th bet Park and Lex  
wafelKastaar	1395939602	23	mid	 23rd St betw Park & Lex 
chefsamir	1395939602	47	up	 47 St between park av and Lex
shanghai	1395939602	46	up	@46th & 5 6th 
tacobite	1395939602	55	up	 55th / 56th Broad
hh3	1396026001	47	up	 47st bet Park & Lex  
sweetery	1396026001	none	none	 Hudson / King St 
grillwheels	1396026001	46	up	 46th off 6th 
eddiespizza	1396026001	varick	none	 varick and king 
lobstertruck	1396026001	46	up	 46th St & 6th Ave  
dubpies	1396026001	Hanover	none	Hanover Square
shortys	1396026001	WFC	none	WFC
gorilla2	1396026001	52	up	 52 / 6 
valduccis	1396026001	26	mid	26th & 11th @
schnitzelcart	1396026001	49	up	 49th st between 6th & 7th 
palenque	1396026001	Jay str & Water	bkl	 Jay str & Water str  
gorilla1	1396026001	46	up	 46 5 / 6 
pocketful	1396026001	50	up	 50th  between 6th and 7th
domo	1396026001	49	up	 49th & 6th 
mamuthai	1396026001	DUMBO	bkl	DUMBOFoodTrucks
polish	1396026001	46	up	 46th b / w 5th and 6th
hh2	1396026001	21	mid	 5 Ave & 21st 
carls	1396026001	55	up	 Broadway &55th st   @
cinnamonsnail	1396026001	47	up	 47th & park 9 
bobjo	1396026001	varick	none	 varick and king st  
morris	1396026001	brookfieldplny	none	brookfieldplny
toum	1396026001	Vesey	none	 North End & Vesey St  
phils3	1396026001	41	up	 41st and 6th 
milktruck	1396026001	Wall	none	 Wall & William  
brooklynpopcorn	1396026001	none	none	 Beaver and Broad Str
lukeslobster	1396026001	46	up	 46th & Park
bigds	1396026001	50	up	 50th Street btwn 6th and 7th 
mexicoblvd	1396026001	46	up	 46th btw  6th & 7th
carpedonut	1396026001	55	up	 55th and Broad
treats	1396026001	45	up	 28th   45th & 6th  4
greenradish	1396026001	56	up	 56th & Bway 
steelcart	1396026001	Front & Jay	bkl	 Front & Jay  @
mooshu	1396026001	50	up	 50th & 6th ave
kimchitaco	1396026001	52	up	 52nd st  @KimchiTruck: Hey gorgeous midtowners  catch ya soon  52nd St  bet  6th & 7th Ave  11
schnitzel	1396026001	WFC	none	WFC
biandang	1396026001	53	up	53rd street between Park and Lexington avenue
korilla	1396026001	none	none	 Front & Gouverneur 
frites	1396026001	Hanover	none	 7 Hanover sq b / t Water st & pearl st  
chefsamir	1396026001	55	up	 Broadway at 55st
shanghai	1396026001	22	mid	@22nd st & 5th ave 
disos	1396026001	Wall	none	 Wall and water st   
wafelKastaar	1396026001	40	up	 40th & Park 
tacobite	1396026001	55	up	 55th st  & Broad
hh3	1396371601	25	mid	 Park & 25st and 
sweetery	1396371601	100	up	 100 W 33RD @ 6th AVE  
yume	1396371601	brookfieldplny	none	brookfieldplny
grillwheels	1396371601	47	up	 47st off park ave
eddiespizza	1396371601	none	none	World financial center
lobstertruck	1396371601	50	up	 50th St & 6th Ave  
dubpies	1396371601	dumbo	bkl	dumbolot
shortys	1396371601	47	up	47th & Park  
domo	1396371601	55	up	 55th & B'way 
polish	1396371601	19	mid	 6th ave b/ w 19th and 20th
gorilla2	1396371601	49	up	 49th / 6 
schnitzelcart	1396371601	none	none	 Spring is here! What a beautiful day out  Perfect schnitz weather:  stop by the cart on Greenwich and Park 
gorilla1	1396371601	Varick	none	 Varick & Charlton 
pocketful	1396371601	49	up	 49th between 6th and 7th
hh2	1396371601	25	mid	 Park & 25st and 
carls	1396371601	dumbo	bkl	dumbolot
cinnamonsnail	1396371601	Wall	none	 Wall st between Water / Pearl 
mrnice	1396371601	47	up	 47th n Park Ave  
bobjo	1396371601	Hanover	none	 water & Hanover 
morris	1396371601	29	mid	 29th & Park ave 
toum	1396371601	46	up	 46th btwn 5th & 6th
phils3	1396371601	26	mid	 26th and 11th 
milktruck	1396371601	28	mid	 28th & Park Ave 
bigds	1396371601	brookfieldplny	none	brookfieldplny
mexicoblvd	1396371601	46	up	 46th St btwn 6th & 7th 
nuchas	1396371601	none	none	 broad st and pearl st 
mooshu	1396371601	50	up	 50th & 6th
kimchitaco	1396371601	dumbo	bkl	 Spring  dumbolot Jay & Water St  11
biandang	1396371601	53	up	53rd and park
korilla	1396371601	Varick	none	 Varick & Vandam 
frites	1396371601	Hanover	none	 10 Hanover sq b / t water st & pearl st  
greenradish	1396371601	51	up	 51st btwn Park & Mad
shanghai	1396371601	55	up	@55th st & Broad
mausam	1396371601	47	up	 47st n Park Ave  
mactruck	1396371601	47	up	 47st  between Park and Lex 
steelcart	1396371601	56	up	 56th & Broad
chefsamir	1396371601	36	up	 36st and Broad
disos	1396371601	48	up	 48th between 6 and 7 
tacobite	1396371601	55	up	 55th st & Broad
hh3	1396458001	46	up	 46st bet 5 & 6 
sweetery	1396458001	none	none	 Hudson / King St 
yume	1396458001	55	up	 Broadway & 55th 
grillwheels	1396458001	55	up	 55st off broad
eddiespizza	1396458001	46	up	 46th between 5th and 6th  
lobstertruck	1396458001	51	up	 51st Street & Park Aven
shortys	1396458001	Jay & Water	bkl	 Jay & Water 
mikenwillie	1396458001	Old Slip	none	 Front St & Old Slip 
pocketful	1396458001	53	up	 53rd between Park and Mad
domo	1396458001	DUMBO	bkl	DUMBOlot
polish	1396458001	46	up	 46th b / w 5th and 6th 
gorilla2	1396458001	26	mid	 26th 11 / 12 
valduccis	1396458001	50	up	50th and 6th 
schnitzelcart	1396458001	27	mid	 27th st and park aven
palenque	1396458001	Varick	none	 Varick & Charlton str
gorilla1	1396458001	36	up	 36th / Broad
mamuthai	1396458001	WFC	none	WFC
treats	1396458001	45	up	 2nd   45th & 6th  4
carls	1396458001	49	up	 49th st betw  6th / 7th ave   @
cinnamonsnail	1396458001	55	up	 55th & Broad
toum	1396458001	47	up	 47th btwn Park & Lex
phils3	1396458001	60	up	 60 on this Whiz Wednesday! Celebrate and treat yourself to a steak from the jawn  41st and 6th 
milktruck	1396458001	40	up	 40th & 6th 
lukeslobster	1396458001	46	up	 46th and park
bigds	1396458001	50	up	 50th Street btwn 6th and 7th 
nuchas	1396458001	none	none	 Charlton and King
taim	1396458001	brookfieldplny	none	brookfieldplny
morris	1396458001	Pearl & Front	bkl	 Pearl & Front 
mooshu	1396458001	55	up	 55th & Broad
kimchitaco	1396458001	55	up	 55th St  bet  6th & 7th Ave  11
schnitzel	1396458001	47	up	 47th between park and mad
biandang	1396458001	53	up	 53rd & Park
korilla	1396458001	none	none	 Front & Gouverneur 
frites	1396458001	none	none	 Hudson & king  
greenradish	1396458001	38	up	 38 & Bway  
shanghai	1396458001	46	up	@46th st & 5 6th 
mausam	1396458001	brookfieldplny	none	brookfieldplny
mactruck	1396458001	29	mid	29st and Park Ave 
steelcart	1396458001	Front & Jay	bkl	 Front & Jay 
disos	1396458001	Varick	none	 1   late start  late lunch    Varick and charlton st
tacobite	1396458001	47	up	 47TH St Bet Park Av / Lex
chipsy	1396458001	52	up	 52nd street and 6th aven
hh3	1396544402	55	up	 Broadway & 55st  
sweetery	1396544402	none	none	 Hudson / King St  
grillwheels	1396544402	Hanover	none	 Hanover & Water St- 
lobstertruck	1396544402	55	up	 55th & Broad
dubpies	1396544402	47	up	 47th & Park  
shortys	1396544402	47	up	47th & Park  
gorilla1	1396544402	Hanover	none	 Hanover Square & Water 
pocketful	1396544402	50	up	 50th  between 6th and 7th  
domo	1396544402	53	up	53rd & Park  
polish	1396544402	55	up	 55th and Broad
gorilla2	1396544402	55	up	 55 / Broad
schnitzelcart	1396544402	26	mid	 26th between 11th & 12th 
treats	1396544402	91	up	 3rd UWS ! 2:  Columbus & 91st  4 
hh2	1396544402	Varick	none	 Varick & King 
carls	1396544402	Hanover	none	 10 Hanover sq & Water st   
cinnamonsnail	1396544402	21	mid	 21st & 5th 
phils3	1396544402	52	up	52nd and 6th 
milktruck	1396544402	Vesey	none	 North End Ave & Vesey  
brooklynpopcorn	1396544402	70	up	 70th & York 
lukeslobster	1396544402	23	mid	 23rd and Park
bigds	1396544402	50	up	50th btwn 6 & 7th Ave 
mexicoblvd	1396544402	Jay & Water	bkl	 Jay & Water St 
nuchas	1396544402	brookfieldplny	none	brookfieldplny
taim	1396544402	20	mid	 20th / 5th 
bobjo	1396544402	hanover	none	 water and hanover 
morris	1396544402	51	up	 51st & Mad  11  
toum	1396544402	dumbo	bkl	dumbolot
mooshu	1396544402	46	up	 46th & 6th
carpedonut	1396544402	51	up	 51st and Park 
schnitzel	1396544402	51	up	 51st between park and mad
biandang	1396544402	53	up	53rd street between Park and Lexington avenue
korilla	1396544402	47	up	 47th and Park
greenradish	1396544402	52	up	 52 & 6th 11
steelcart	1396544402	56	up	 56th & Broad
chefsamir	1396544402	47	up	 47 St between park av and Lex
disos	1396544402	47	up	 47th between park and lex  
wafelKastaar	1396544402	23	mid	 23rd between Park Ave and Lex
shanghai	1396544402	46	up	@46th st & 5 6th 
mactruck	1396544402	55	up	 Broadway!! Between 55 / 56 
tacobite	1396544402	55	up	 55th / 56th st & Broad
chipsy	1396544402	50	up	 50th and 6th aven
hh3	1396630801	47	up	 47st & Park  
sweetery	1396630801	none	none	 Hudson / King St 
lobstertruck	1396630801	46	up	 46th St & 6th Ave  
dubpies	1396630801	none	none	 Pine St and William
shortys	1396630801	WFC	none	WFC
snowday	1396630801	DUMBO	bkl	DUMBOFoodTrucks
schnitzelcart	1396630801	49	up	 49th between 6th & 7th  
gorilla1	1396630801	46	up	 46TH 5 / 6 
pocketful	1396630801	49	up	 49th  between 6th and 7th 
domo	1396630801	49	up	 49th & 6th  
polish	1396630801	47	up	 47th b / w Park & Lex
gorilla2	1396630801	38	up	 38th / Broad
valduccis	1396630801	26	mid	 26st 12 n 11 ave 
treats	1396630801	45	up	 4th   45th & 6th Ave  18th 
hh2	1396630801	21	mid	 5 ave & 21st  
carls	1396630801	55	up	 Broadway &55th st   @
mrnice	1396630801	none	none	 4 / 6 at 
phils3	1396630801	41	up	 41st and 6th 
milktruck	1396630801	Wall	none	 Wall & William  
lukeslobster	1396630801	46	up	 46th and Park
nuchas	1396630801	none	none	 4 / 6  at @
bigds	1396630801	50	up	 50th Street btwn 6th and 7th 
bobjo	1396630801	varick	none	 varick and king st  
morris	1396630801	Vesey	none	 N End & Vesey
toum	1396630801	Vesey	none	 350 & pick up on North End & Vesey 
mooshu	1396630801	50	up	 50th & 6th 
kimchitaco	1396630801	52	up	 52nd St  bet  6th & 7th Ave  11
carpedonut	1396630801	55	up	55th and Broad
schnitzel	1396630801	Vesey	none	 North End and Vesey sts 
biandang	1396630801	50	up	50th btwn 6 / 7th 
korilla	1396630801	DUMBO	bkl	DUMBOFoodTrucks
frites	1396630801	Hanover	none	 7 Hanover sq b / t water st & pearl  
greenradish	1396630801	56	up	 56th & Bway 
disos	1396630801	Wall	none	 Wall and water st   
shanghai	1396630801	22	mid	 22nd st & 5th ave  
steelcart	1396630801	Front & Jay	bkl	 Front & Jay 
chefsamir	1396630801	55	up	 Broadway at 55st
tacobite	1396630801	55	up	55th & Broad
hh3	1396890001	55	up	 Broadway & 55st  
sweetery	1396890001	none	none	 Hudson / King St 
grillwheels	1396890001	46	up	 46th off 6th 
shortys	1396890001	WFC	none	WFC
mikenwillie	1396890001	22	mid	 22nd St  & 5th Ave 
snowday	1396890001	none	none	 4 / 8 6
schnitzelcart	1396890001	55	up	 55th & Broad
gorilla1	1396890001	20	mid	 5th Ave  @ 20th str
domo	1396890001	50	up	50th btwn 6th and 7th 
polish	1396890001	Varick	none	 Varick & Charlton 
gorilla2	1396890001	55	up	 Broadway @ 55th st  
mamuthai	1396890001	WFC	none	WFC
hh2	1396890001	Varick	none	 Varick & King 
carls	1396890001	Varick	none	 Varick and Charlton st   30 
phils3	1396890001	41	up	41st and 6th   
milktruck	1396890001		up	@Columbia
nuchas	1396890001	none	none	 Charlton St  and King St  
bigds	1396890001	none	none	Hudson St and King St 
mexicoblvd	1396890001	Jay & Water	bkl	 Jay & Water St 
morris	1396890001	52	up	 52nd & 6th 
toum	1396890001	Jay & Water	bkl	 Jay & Water 
mooshu	1396890001	dumbo	bkl	dumbolot
kimchitaco	1396890001	Vesey	none	 N  End Ave & Vesey St  
schnitzel	1396890001	Varick	none	 Charlton between Hudson and Varick  
biandang	1396890001	53	up	 53rd & Park
korilla	1396890001		up	Columbia
frites	1396890001	50	up	 50th st b / t 6th & 7th av  
mactruck	1396890001	WFC	none	WFC
steelcart	1396890001	Front & Jay	bkl	 Front & Jay 
chefsamir	1396890001	old slip	none	 old slip and front st!
disos	1396890001	56	up	 56th and Broad
shanghai	1396890001	11	mid	 Hudson/ King St   11
tacobite	1396890001	55	up	 Broadway bet 55 / 56th 
hh3	1396976401	47	up	 47st & Park Ave  
sweetery	1396976401	none	none	 Hudson / King St 
yume	1396976401	WFC	none	WFC
grillwheels	1396976401	47	up	 Park / 47th
eddiespizza	1396976401	none	none	World financial center
lobstertruck	1396976401	50	up	 50th & 6th Ave  
dubpies	1396976401	dumbo	bkl	dumbolot
shortys	1396976401	47	up	47th & Park  
schnitzelcart	1396976401	none	none	 Greenwich & Park 
gorilla1	1396976401	Varick	none	 Varick & Charlton 
pocketful	1396976401	49	up	 49th between 6th and 7th 
domo	1396976401	55	up	 55th and Broad
polish	1396976401	52	up	 52nd b / w 6th and 7th and 
gorilla2	1396976401	49	up	 49 / 6th 
treats	1396976401	17	mid	 8th  pm 5th ave  17th & 18th st 
hh2	1396976401	25	mid	 Park & 25st 
carls	1396976401	Jay st & Water	bkl	 Jay st & Water st   
mrnice	1396976401	47	up	 47th n Park Ave  
phils3	1396976401	26	mid	 26th and 11th 
nuchas	1396976401	none	none	 Broad St & Pearl St 
bigds	1396976401	WFC	none	WFC
mexicoblvd	1396976401	46	up	 46th between 6th & 7th
taim	1396976401	14	mid	 4 / 14 @ 5
bobjo	1396976401	Hanover	none	 Hanover sq  &water st  
morris	1396976401	29	mid	 29th & Park  11 30
toum	1396976401	46	up	 46th btwn 5th & 6th
mooshu	1396976401	50	up	50th & 6th 
kimchitaco	1396976401	dumbo	bkl	dumbolot
schnitzel	1396976401	52	up	 52nd between 6th & 7th 
biandang	1396976401	53	up	53rd & park 
korilla	1396976401	Varick	none	 Varick & Vandam
frites	1396976401	Hanover	none	 10 Hanover sq b / t water st & pearl st  
chefsamir	1396976401	36	up	 36st and Broad
disos	1396976401	48	up	 48th bet 6 and 7 
wafelKastaar	1396976401	12	mid	 12th Between 5th Ave 
shanghai	1396976401	55	up	@broadway & 55 56th 
mactruck	1396976401	47	up	 47st  Celebrating my 30th Birthday at my lunch time haunt!!! Between Park and Lex
steelcart	1396976401	56	up	 56th & Broad
wafelMomma	1396976401	91	up	 91st & Columbus 
chipsy	1396976401	50	up	 50th street and 6th aven
eddiespizza	1397062802	46	up	 46th between 5th and 6th 
lobstertruck	1397062802	51	up	 51st St & Park Aven
phils3	1397062802	41	up	 41st and 6th 
frites	1397062802	none	none	 Hudson & king  
mooshu	1397062802	45	up	 45th & 6th 
mikenwillie	1397062802	Old Slip	none	 Old Slip & Front St  
carls	1397062802	49	up	 49th st bet 6th / 7th 
grillwheels	1397062802	55	up	 55 st off Broad
shortys	1397062802	Jay & Water	bkl	 Jay & Water 
nuchas	1397062802	none	none	 Kings and Charlton
schnitzel	1397062802	47	up	 47th between park and Lex
palenque	1397062802	Varick	none	 Varick St & Charlton St  
hh2	1397062802	none	none	 Broad & Water 
bigds	1397062802	50	up	 50th Street btwn 6th and 7th 
sweetery	1397062802	none	none	 Hudson / King St  
morris	1397062802	DUMBO	bkl	DUMBOFoodTrucks
toum	1397062802	47	up	 47th btwn Park & Lex  
mexicoblvd	1397062802	WFC	none	WFC
taim	1397062802	brookfieldplny	none	brookfieldplny
carpedonut	1397062802	23	mid	 23rd and Park
biandang	1397062802	53	up	53rd and park
korilla	1397062802	none	none	 Front & Gouverneur 
chefsamir	1397062802	52	up	 52st and park av
gorilla1	1397062802	26	mid	 26 11 / 12 @
kimchitaco	1397062802	55	up	 55th St  bet  6th & 7th Ave  11
disos	1397062802	varick	none	 varick and charlton st   
mactruck	1397062802	29	mid	29st and Park ave 
tacobite	1397062802	47	up	 47th st  Bet Park / lex  
schnitzelcart	1397062802	27	mid	 27th & Park Ave 
milktruck	1397062802	58	up	 58th  b / w Mad & 5th  
shanghai	1397062802	46	up	@46th bet 5 6th 
pocketful	1397062802	50	up	 50th  between 6th and 7th 
gorilla2	1397062802	36	up	 36th / 6 
valduccis	1397062802	55	up	 55 and Broad
mamuthai	1397062802	WFC	none	WFC
treats	1397062802	45	up	 9th   45th & 6th  4
steelcart	1397062802	Front & Jay	bkl	 Front & Jay 
domo	1397062802	Dumbo	bkl	DumboLot
polish	1397062802	46	up	 46th b / w 5th and 6th 
hh3	1397062802	none	none	 Broad & Water 
lobstertruck	1397149202	55	up	 55 & Broad
phils3	1397149202	52	up	 52nd and 6th 
frites	1397149202	brookfieldplny	none	brookfieldplny
mooshu	1397149202	46	up	 46th & 6th
mikenwillie	1397149202	56	up	 56th St  & Broad
carls	1397149202	Hanover	none	 10 Hanover square and water st   30 
schnitzel	1397149202	51	up	 51st between park and mad
palenque	1397149202	Vesey	none	 North End & Vesey st  
chipsy	1397149202	50	up	 50th street and 6th aven
yume	1397149202	55	up	 Broadway & 55th and 
grillwheels	1397149202	Hanover	none	 Hanover & Water St- 
shortys	1397149202	47	up	47th & Park 
lukeslobster	1397149202	23	mid	 23rd and park
taim	1397149202	20	mid	 20th / 5th 
bigds	1397149202	50	up	50th btwn 6 & 7th Ave 
sweetery	1397149202	none	none	 Hudson / King St 
bobjo	1397149202	Hanover	none	 Hanover sq  and water str
morris	1397149202	51	up	 51st btw Mad & Park 
toum	1397149202	Jay & Water	bkl	 Jay & Water 
nuchas	1397149202	brookfieldplny	none	brookfieldplny
mexicoblvd	1397149202	Water & Jay	bkl	 Water & Jay St 
carpedonut	1397149202	51	up	 51st and Park
biandang	1397149202	53	up	53rd street between Park and Lexington avenue
chefsamir	1397149202	47	up	 47 St between park av and Lex
gorilla1	1397149202	Hanover	none	 Hanover water / pearl   
disos	1397149202	47	up	 47th between park and lex  
mactruck	1397149202	55	up	 Broadway!!! Between 55 / 56 
tacobite	1397149202	55	up	 Broadway bet 55th & 56th 
dubpies	1397149202	47	up	 47th St and Park Ave  
snowday	1397149202	Jay and Water	bkl	 Jay and Water St! 
schnitzelcart	1397149202	26	mid	 26th st between 12th & 11th 
neapolitan	1397149202	52	up	 52nd and Park 
milktruck	1397149202	Vesey	none	 North End Ave & Vesey  
shanghai	1397149202	46	up	@46th st & 5 6th 
mausam	1397149202	dumbo	bkl	dumbofoodtrucks
pocketful	1397149202	50	up	 50th between 6th and 7th  
gorilla2	1397149202	49	up	 49th / 6 
valduccis	1397149202	50	up	50th & 6th  
steelcart	1397149202	Front & Jay	bkl	 Front & Jay  
domo	1397149202	47	up	 47th & Lex
polish	1397149202	55	up	 55th and Broad
hh3	1397149202	55	up	 broadway & 55st 
eddiespizza	1397235601	varick	none	 varick and king 
lobstertruck	1397235601	46	up	 46th & 6th  
phils3	1397235601	41	up	 41st and 6th 
frites	1397235601	Hanover	none	 7 Hanover sq b / t water st & pearl st  
greenradish	1397235601	17	mid	 17th & 5th 
mooshu	1397235601	50	up	 50th & 6th
mikenwillie	1397235601	47	up	47th Street & Park Ave 
carls	1397235601	55	up	 Broadway& 55th   @
wafelMomma	1397235601	49	up	 49th & 6th 
palenque	1397235601	Water Str & Jay	bkl	 Water Str & Jay Str    
grillwheels	1397235601	46	up	 46th off 6th  
shortys	1397235601	WFC	none	WFC
lukeslobster	1397235601	46	up	 46th & Park
hh2	1397235601	Varick	none	 Varick & Charlton 
sweetery	1397235601	none	none	Hudson / King St  
bobjo	1397235601	varick	none	 varick &king st  
morris	1397235601	brookfieldplny	none	brookfieldplny
toum	1397235601	brookfieldplny	none	brookfieldplny
carpedonut	1397235601	55	up	 55th and Broad
biandang	1397235601	50	up	 50th btwn 6 / 7th 
korilla	1397235601	DUMBO	bkl	DUMBOFoodTrucks
chefsamir	1397235601	55	up	 Broadway at 55st
gorilla1	1397235601	46	up	 46 5 / 6 
kimchitaco	1397235601	55	up	 55th St  bet  6th & 7th Ave 
disos	1397235601	Wall	none	 Wall and water st   
tacobite	1397235601	47	up	 47th st bet Park & Lex 
dubpies	1397235601	Hanover	none	Hanover Square
schnitzelcart	1397235601	49	up	 49th st b / w 6th & 7th 
neapolitan	1397235601	52	up	 52nd and park
milktruck	1397235601	Wall	none	 Wall & William  
wafelKastaar	1397235601	40	up	 40th & Park 
shanghai	1397235601	22	mid	 22nd & 5th ave  
mausam	1397235601	55	up	 king @55 Str and Bway  
pocketful	1397235601	50	up	 50th between 6th and 7th  
treats	1397235601	45	up	 11th   45th & 6th  4
steelcart	1397235601	Front & Jay	bkl	 Front & Jay 
domo	1397235601	49	up	 49th and 6th 
polish	1397235601	21	mid	 5th avenue & 21st str
hh3	1397235601	47	up	 47st & Park Ave  
\.


--
-- Data for Name: tweets; Type: TABLE DATA; Schema: public; Owner: mca
--

COPY tweets (contents, "time", id, retweeted, twitname) FROM stdin;
@taipanexpress is parked on 47st btw Lex & Park ave 11am to 3pm.Indian Thai fusion twist.Grand opening 50% off menu prices fusionmadness	1395241942	446303168746782721	f	freshandhearty
We have sad news today that Fresh&Hearty is no longer in business. Please follow our new truck @taipanexpress Food is amazing! 50% off menu	1395241599	446301731807563776	f	freshandhearty
@gcnyc1 best grilled cheese in town...	1393432849	438715283231211520	f	freshandhearty
Get your Soup & Panini on with Fresh and Hearty! We parked on 46st btw 5th & 6th ave from 11am to 3pm. Call now 4 free delivery! @3474402467	1390493878	426388347435491329	f	freshandhearty
Snow Snow go away come back another day cuz Fresh and Hearty have specials today! We parked on Park ave btw 32st & 33st. comegetsome	1390320902	425662831162568704	f	freshandhearty
Good Morning nYc! We are serving lunch on 46st btw 5th ave & 6th ave.Free Delivery 4 everyone!Order now 3474402467 or http://t.co/yJtXVzeOH7	1389800694	423480921153486848	f	freshandhearty
@bxlea today we are on 46 st between 5 and 6 ave	1389795912	423460864881352704	f	freshandhearty
We serving lunch on Park ave btw 33st &32st. Free delivery!Call 3474402467 for free delivery or visit http://t.co/yJtXVzeOH7 to order online	1389718699	423137012032348161	f	freshandhearty
Good Morning nYc! We are parked on 47st btw Park ave & Lexington ave.Free delivery! Place ur order http://t.co/ZQROfAbNSb or call 3474403467	1389624493	422741881672724480	f	freshandhearty
RT @randomfoodtruck: Snow shmow. The temp is in double digits and it's Friday, so let's celebrate. @Chefsamirtruck @FreshandHearty @carlsst...	1389371813	421682066108211200	f	freshandhearty
SnowY DaY! No need for you to get out cuz we are doing deliveries now! Call us now 3474402467 & get free soda with your order Bdwy55&56st	1389368713	421669062444613633	f	freshandhearty
Order now via http://t.co/8tYW0vuYUt and recieve free soda with your order. We doing deliveries now so take advantage! ordernow freesoda	1389285255	421319014057394176	f	freshandhearty
We are serving lunch on HanoverSquare btw Pearl & Water st. We doing deliveries now! Call 3474402467 to place ur order 4 pickup or delivery	1389283993	421313721747533824	f	freshandhearty
Today we are serving lunch on 46st btw 5th & 6th ave. We know its cold so you can order via online, email or phone at http://t.co/ZQROfAbNSb	1389197320	420950188724088832	f	freshandhearty
Good morning nYc! We are closed today due to this severe cold weather.We will be back tomorrow so keep hungrymyfriends goodfood staywarm	1389106294	420568397903331328	f	freshandhearty
2014 It's all about goodfood & flavors. We serving lunch today on Broadway & 55st.Order now for pickup at http://t.co/ZQROfAbNSb noline	1389024609	420225786000711680	f	freshandhearty
HappyNewYear2014 to everyone! We are back with a boom of different flavors for you! Come out and try out our new menu. FreshandHearty	1388677888	418771533297758208	f	freshandhearty
Back on the road. we are serving lunch on old slip between water st and front street from 11:30 to 2:30 Preorder before 12pm at 3474402467	1388676035	418763761240268800	f	freshandhearty
GOOD morning Monday... We are park on Broadway between 55 st and 56 st. Preorder before 12pm at 3474402467.	1388416224	417674033657020416	f	freshandhearty
Hope everyone had a wonderful Christmas! We are serving Lunch on Charlton st & corner of Varick st from 11:30am to 3pm. OrderOnlineNow	1388074894	416242393227464704	f	freshandhearty
@eric_zimm you got it	1440819022	637467300476661760	f	disosnyc
@eric_zimm yea we did actually. Tell her to come by.	1440788916	637341027439874049	f	disosnyc
@AmmanBhasin were off the steets today.. Had a event with ABC good morning America	1440773282	637275452474818560	f	disosnyc
Disos will be off the street for lunch today. Back on Monday! Have a good weekend! Ciao	1440773217	637275179119460352	f	disosnyc
We have more coming :) hope everyone enjoyed the food! Thanks for having us in the show @GMA  https://t.co/y5W0rUnMax	1440771587	637268344194863105	f	disosnyc
RT @BillyKnight2009: @DiSOSNYC  I left NYC 17 years ago.  Now I have to come back to join the Society.\nThank you GMA	1440767577	637251523383304192	f	disosnyc
Going live on @GMA today! Tune in!!! The only society you need to be a member of..	1440764871	637240173277880320	f	disosnyc
Coming up.. Tune in to Good Morning America on ABC. Disos feature..!	1440764809	637239914782851072	f	disosnyc
@foodNfest haha if you can squeeze through the crowds..	1440730598	637096421410406400	f	disosnyc
@foodNfest we'll be in Times Square shooting live on Good Morning America show..	1440724802	637072114302984193	f	disosnyc
Tune in tomorrow morning and catch your favorite society on @GMA!! Live on your TV set.. 	1440719249	637048822099656704	f	disosnyc
Tune in tomorrow morning and catch your favorite society on @GMA!! Live on your TV set.. 	1440719218	637048691086524416	f	disosnyc
RT @FiDining: Delicious, fresh ingredients on great bread. Enough said. @DiSOSNYC http://t.co/CxarMiE6ci	1440719109	637048232665817089	f	disosnyc
Lunch on water st and old slip today. \n\nCall in orders to: 917-756-4145	1440685920	636909030233931776	f	disosnyc
RT @___OJ___: just had my first bite of The Fonz from @DiSOSNYC...and cotdayum is that a good sangwhich @justin_cohen	1440611708	636597762608496640	f	disosnyc
Open for lunch. 47th bet park and lex today.\n\nCall in orders for pick up: 917-756-4145	1440604685	636568306590216192	f	disosnyc
CHANGE OF SCHEDULE TODAY : 47th bet Park and Lex.\n\nCall in orders to: 917-756-4145	1440597861	636539684764696576	f	disosnyc
@ChefDomTes @FoodNetwork thanks my Dom.. Much appreciated!	1440551582	636345575504543744	f	disosnyc
Staten Islands Very Own..... http://t.co/mPHSzjzHx2	1440523708	636228664036823040	f	disosnyc
Come have yourself a sangwich today on 48th bet 6 and 7 ave.\n\nCall in orders for pick up: 917-756-4145	1440510882	636174867495186432	f	disosnyc
GetRad The Montclair Art Museum http://t.co/FuZxwRWpl7	1440797431	637376740051054592	f	thegreenradish1
RT @MAMmontclair: Food vendors at the MAM Lawn Party Sept 12 include Cakeoholic Obsession @cheezenlife @thegreenradish1 Lost Brother's Pizza	1440768210	637254179346587648	f	thegreenradish1
2000 followers to Zero...What gives @twitter ??? @biz	1440766326	637246276812337152	f	thegreenradish1
Good night for Baked Rosemary Fries...Columbus near grove till 8pm.... With @theAngryCrabNJ and saharagrill http://t.co/Jdv8fxeeuS	1440710381	637011625493532672	f	thegreenradish1
The Green Radish | Fast Veg http://t.co/zwGuAv45n2	1440679713	636882994461061120	f	thegreenradish1
Baked Rosemary Fries to go with a 1/4lb BlackBeanBurger, now we're talking! Only thegreenradish... https://t.co/VYpr04P9iG	1440677163	636872301032677376	f	thegreenradish1
Hey All...Eat more Plants and let The Green Radish cater your next event...send your request to... http://t.co/M8RtWbbYeO	1440676667	636870219949056000	f	thegreenradish1
Hey, Montclair. We're back on 9/12, catch us at Montclair Art Museum http://t.co/TdgUWJHivR	1440676313	636868733605138432	f	thegreenradish1
Lunch is on!  JerseyCity Hudson & Columbus till 2  Baked Rosemary Fries.... hanging with @RocklandRoots @jc_eats http://t.co/yIOILs08Lx	1440607216	636578919454539777	f	thegreenradish1
Hey, JerseyCity GetRad LUNCH Wednesday...Hudson and Columbus 11-2 Mack-Cali Realty Corporation  DINNER Thursday... http://t.co/vf5gIc9X47	1440552196	636348148588380160	f	thegreenradish1
RT @thebikingvegan: @genebaur Take it from a Hilda Club member @thegreenradish1 is the best vegan foodtruck in NJ. Stop over before the ...	1440524110	636230350054817794	f	thegreenradish1
RT @thebikingvegan: New resolution: I am only visiting my JC office if the @thegreenradish1 is there! Best vegan foodtruck in NJ!	1440520318	636214443093946368	f	thegreenradish1
HeyJerseyCity lunch  Hudson&Columbus today till 2pm with our friends @TheIncrediballs @OSM_NJ @StevenFulop @jc_eats http://t.co/AInmCV6W3E	1440517043	636200708879028224	f	thegreenradish1
@thebikingvegan Hudson&Columbus for lunch	1440516871	636199985877504000	f	thegreenradish1
@genebaur How about a shout out for a NJ based Vegan Food Truck? We rock BlackBeanBurgers w/melted onions,smashed avo,chipotle mayo @biz	1440365295	635564231337881600	f	thegreenradish1
Hanging with Mr. Peabody Catskill Animal Sanctuary GetRad go Plantbased Evolve For Animals Gary L. Francione:... http://t.co/Uy8xduLvPa	1440260589	635125061670666242	f	thegreenradish1
RT @sarastewartwork: Trying out this new food truck near my apartment! jerseycity thegreenradish @ Grove Street https://t.co/ZGt1Jqednv	1440129119	634573635479580672	f	thegreenradish1
Dinner is On JerseyCity Columbus near Grove till 8pm @jc_eats @jcindependent @StevenFulop @stephenmusgrave @njdotcom http://t.co/HFqc7f4obA	1440107660	634483629398339585	f	thegreenradish1
A visit from a VIP and a true friend to animals. Keep up the good work, Neal from Evolve For Animals Hope you... http://t.co/SQ5rVGt6Er	1440106218	634477581685932032	f	thegreenradish1
A visit from a VIP - Neal from @efanimals stopped by jerseycity for a BlackBeanBurger... have dog,... https://t.co/YnjtWRgGr2	1440105460	634474402340564992	f	thegreenradish1
RT @Lovin_Trends: The 21 Most Popular Food Trucks In The US http://t.co/TyTMNKz1ej http://t.co/yH1a6Tj9OT	1440787848	637336547721879552	f	nuchasnyc
RT @ezCaterInc: Hot off the press: Our look at why you should be having pie for lunch. http://t.co/IOtGHztqOg http://t.co/khJSMWCYHP	1440694614	636945493243899905	f	nuchasnyc
OPEN! NuchasTruck on 5th Ave & 21st St MuchasNuchas  - http://t.co/BUSHVUJTol	1440680992	636888359298732032	f	nuchasnyc
@dopebrooklyn Love it!!  Can't wait for next year.	1440605605	636572163659722753	f	nuchasnyc
OPEN! NuchasTruck on 52nd St between 6th and 7th Ave until 3:30 PM then moving to 3rd Ave & E 14th St MuchasNuch - http://t.co/BUSHVUJTol	1440597091	636536452264759296	f	nuchasnyc
OPEN! NuchasTruck on Pearl St & Broad St until 11 PM! MuchasNuchas - http://t.co/BUSHVV1uMV	1440509375	636168547757092864	f	nuchasnyc
OPEN! NuchasTruck on Varick St & Charlton St until 3:30 PM, then moving to 14th St & 3rd Ave until 11 PM! Muchas - http://t.co/BUSHVV1uMV	1440425087	635815016206364672	f	nuchasnyc
RT @34thStNYC: Start your Monday on the right note with a fresh cup of @LaColombeCoffee at @NuchasNYC Greeley Square.	1440424865	635814086832484352	f	nuchasnyc
Last Song Afropunk MuchasNuchas http://t.co/j5sGUOeZpu	1440393378	635682017993035780	f	nuchasnyc
Oh yes! Still here at Afropunk MuchasNuchas http://t.co/bUl2VdMvvD	1440379660	635624482514837505	f	nuchasnyc
AFROPUNK MuchasNuchas http://t.co/CAJ1zFIHGx	1440370639	635586644834414593	f	nuchasnyc
Music fans? Or empanadas fans? MuchasNuchas Afropunk http://t.co/IWZ8OK7o0J	1440364209	635559676902526976	f	nuchasnyc
OPEN! NuchasTruck on Commodore Barry Park for the AFROPUNK FEST! - http://t.co/BUSHVV1uMV	1440345728	635482159642472449	f	nuchasnyc
OPEN! NuchasTruck on Commodore Barry Park for the AFROPUNK FEST! - http://t.co/BUSHVV1uMV	1440250436	635082478278049792	f	nuchasnyc
Which empanada would you choose? regram @livedishapp MuchasNuchas http://t.co/bdjJBlL3DO	1440090139	634410141463371776	f	nuchasnyc
OPEN! NuchasTruck on 27th St between 3rd Ave and Park Ave! - http://t.co/BUSHVV1uMV	1440085181	634389347379335168	f	nuchasnyc
Portobello twins double the flavour! MuchasNuchas regram @daydreamstine http://t.co/ntyuZnyqqx	1439922647	633707631924903936	f	nuchasnyc
OPEN! NuchasTruck on Pearl St & Board St until 1:30 PM, then JonesBeach to enjoy with @Margaritaville MuchasNuc - http://t.co/BUSHVV1uMV	1439915468	633677520001454081	f	nuchasnyc
@Hello_Davey not sure when, but we will make it there.  Any specific location?	1439898106	633604696482164736	f	nuchasnyc
New Yorkers Instagram more empanadas, soup dumplings and bacon than anyone else - http://t.co/hosnS6oX5S GoogleAlerts	1439829116	633315333353418752	f	nuchasnyc
RT @mouthfoods: Rice noodle bowls from @parissandwich! Really loving the grilled chicken and tofu/veggie toppings,... https://t.co/yZeeDkkgRF	1436401880	618940463664492545	f	parissandwich
@rikalilyhops wow. We have no affiliation with this cart. They are selling halal food and refused to take off our decals. Thanks for update	1432070671	600774057638887424	f	parissandwich
@rikalilyhops hey, we actually weren't in that area at all. Did the truck have our logo on it?	1430774397	595337088461049856	f	parissandwich
RT @BYTNYC: An NYC waffle round-up in honor of this holiest Vaffeldagen, ft. @ParisSandwich, @TheStandNYC, @SweetChickLife etc.! http://t.c...	1427325386	580870887555145728	f	parissandwich
NYC don't forget to download your Paris Sandwich App to order online loveparissandwich parissandwich... http://t.co/hNJvgE58RS	1423792624	566053411783983104	f	parissandwich
$4 off your first Paris Sandwich online order. Valid for orders $12+. Limited time only. Click here to order https://t.co/c8LkDeE5tw	1423325293	564093281886560257	f	parissandwich
RT @souvlakitruck: Happy to be on this @SunTimesNYC list of the 10 Best NYC food trucks w/ @shortysnyc + @ParisSandwich! http://t.co/Phb0kV...	1415724957	532215160459771904	f	parissandwich
@DUMBOFoodTrucks Stay tune for exciting news! Possible store front in Dumbo soon!	1414767438	528199035564601344	f	parissandwich
Last day in dumbo today on fronts and Adams @ 11:30 @DUMBOFoodTrucks	1414764931	528188523539890176	f	parissandwich
Dumbo! We Will be on fronts and Adams today @ 12pm @DUMBOFoodTrucks @jenchung	1414674605	527809665221283840	f	parissandwich
Hey dumbo! We will be in your area on fronts and Adams @ 12pm @DUMBOFoodTrucks @jenchung	1414587309	527443520593080320	f	parissandwich
We will be in dumbo today on fronts and Adams @DUMBOFoodTrucks @jenchung hope we can jumpstart your weekend :)	1414159310	525648362994147329	f	parissandwich
Will be in dumbo today @ 12pm on fronts and Adams @DUMBOFoodTrucks	1413984149	524913683244519424	f	parissandwich
We are back in dumbo today on fronts and Adams @ 12pm @DUMBOFoodTrucks	1413812927	524195529224638464	f	parissandwich
Thank you dumbo for being so supportive and patient yesterday.	1413467800	522747960300675072	f	parissandwich
We will be on fronts and Adams today 12pm @DUMBOFoodTrucks @jenchung	1413467611	522747165752696832	f	parissandwich
Will end the week in dumbo today on fronts and Adams 12pm. Have a great weekend everyone! @DUMBOFoodTrucks	1412945562	520557535502532608	f	parissandwich
Hey Dumbo join us for lunch at noon on Fronts and Adams @DUMBOFoodTrucks @jenchung	1412869650	520239137585389569	f	parissandwich
It's Pho weather NYC ! Visit us on 113 Mott street for your pho fix loveparissandwich pho http://t.co/H8vJg1SQeS	1412529452	518812241874124801	f	parissandwich
In dumbo today again, Fronts and Adams 12pm. @DUMBOFoodTrucks	1412263803	517698030091665409	f	parissandwich
Come n' Grub! 50th Street btwn 6th and 7th Avenue http://t.co/mffhq5UCYs	1440778859	637298843793686528	f	bigdsgrub
D1 is serving lunch at 50th Street btwn 6th and 7th Avenue.  Today's special: Thai Green Curry over Jasmine rice http://t.co/JNlPAZUBJa	1440771276	637267036566126592	f	bigdsgrub
Tuesday & Thursday! https://t.co/XspYFdJqJe	1440699398	636965561377914881	f	bigdsgrub
You already know what's for lunch!!\nBigD2 - 41st. Street btwn 6th and Broadway http://t.co/JSjRzP3e3X	1440681168	636889098117099520	f	bigdsgrub
It's THAT time of the week folks!!\nBigD1 - 50th Street btwn 6th and 7th Avenue http://t.co/iaPPYBsugk	1440681116	636888879619014657	f	bigdsgrub
D1 is slinging tacos other goodies at 53rd Street and Park Avenue http://t.co/kgZhQTqXFK	1440594986	636527623670243328	f	bigdsgrub
Let's do lunch!\nD2 - 50th Street btwn 6th and 7th Ave http://t.co/mINWGH5BFH	1440594923	636527361463320576	f	bigdsgrub
D2 is holding it down at 41st Street btwn 6th and Broadway (41st/6th) http://t.co/wmknFq0bpj	1440507967	636162642655191040	f	bigdsgrub
D1 is in position for TacoTuesday. 50th Street btwn 6th and 7th Avenue http://t.co/rKgv1PfQVr	1440507951	636162574250287104	f	bigdsgrub
D2 is grilling up all your Thai & Vietnamese favorites at 53rd. Street and Park Avenue http://t.co/Yy61RlUiE9	1440421979	635801981572001792	f	bigdsgrub
We're celebrating Happy Monday at Hudson/King St. (375 Hudson Street) Come celebrate!! http://t.co/LQibQLqaYh	1440421848	635801430767599616	f	bigdsgrub
We hope it was a great first time experience!  https://t.co/VsDvfm5z4S	1440175167	634766774374924290	f	bigdsgrub
11am to 2:30pm'ish https://t.co/bu1v9Hnpjz	1440168344	634738159943852034	f	bigdsgrub
D2 is grillin' it up at Jay and Water Street @dumbolot @DUMBOFoodTrucks @DUMBOBID dumbo http://t.co/CwyuSrP9IC	1440163946	634719710299467776	f	bigdsgrub
It's Friday...you know what that means!! Join us for lunch at 50th Street btwn 6th and 7th Avenue http://t.co/3mVsSh0IfH	1440163718	634718755453579265	f	bigdsgrub
It's THAT time of the week folks!!\nBigD1 is grillin' it up at 50th Street btwn 6th and 7th Avenue. http://t.co/YuoCjLW8Jk	1440079042	634363598974910464	f	bigdsgrub
D2 is catering a private event. Back out in DUMBO tomorrow	1440079012	634363471086415874	f	bigdsgrub
Let's GRUBBBB!!!	1439999601	634030399048548352	f	bigdsgrub
D1 has ALL your lunch needs at 53rd Street and Park Avenue!! http://t.co/r4oW5MWx6q	1439993769	634005935967600641	f	bigdsgrub
D2 is grillin' it up at 50th Street btwn 6th and 7th Avenue!! Come n' Grub! http://t.co/66guBgxbOu	1439993707	634005676109471744	f	bigdsgrub
@WestchesterMed check out our new menu there are tons of new flavors like Red Velvet,Key Lime Pie and more! http://t.co/f1O6jcShY7	1440764947	637240494079262720	f	andysitalianice
@WestchesterMed we are heading your way tomorrow. Make sure you check out the new menu. @ http://t.co/i4Vxcl92Jp	1440725884	637076649880748032	f	andysitalianice
Who is hanging out again tonight with us underneath the stars? @CentralParkNYC @CoolhausNY @nycfoodtruck Centralparkmovienights	1440713706	637025572091219968	f	andysitalianice
We are now open on 55th and Broadway. Come check out our amazing new menu. @nycfoodtruck @grubstreet @FTFUSA @StreetGrubSteve	1440686487	636911406147850240	f	andysitalianice
Join us again tonight @CentralParkNYC with @CoolhausNY on the Great lawn for an amazing great time movienight	1440624949	636653299018633216	f	andysitalianice
RT @gcnyc1: @CitiBikeNYC w/ @AndysItalianIce \nTill 11pm  Kent N. 11th/ N. 12th\nComeToTheCheeseYo	1440546317	636323493626413056	f	andysitalianice
RT @CentralParkNYC: .@COOLHAUS & @AndysItalianIce are here at cpcfilmfest dishing amazing treats! http://t.co/r8MBgl0Jux	1440546249	636323208627650560	f	andysitalianice
RT @CitiBikeNYC: Citi Bike + Reese's Pieces Candy = Perfect fit. http://t.co/tOgC1s21Fx	1440544581	636316210817314816	f	andysitalianice
RT @EdgeCelize: Movie night with @CitiBikeNYC  ! http://t.co/EeAk2Oxp4C	1440544571	636316167032934400	f	andysitalianice
Join us tonight on the great lawn in @CentralParkNYC also in Williamsburg   Movie night @CitiBikeNYC with the @gcnyc1 6-11pm	1440535663	636278804047114240	f	andysitalianice
@nystfood come by the truck and try some of our new ices like Red Velvet, Blueberry Cheesecake and a lot more	1440506730	636157452795408384	f	andysitalianice
@StreetGrubSteve Stop by truck for some ices	1440506665	636157177560977409	f	andysitalianice
New menu @nystfood @StreetGrubSteve @grubstreet @ChoiceEats @FTFUSA @Sexyfoodtrucks @EatThisNotThat http://t.co/MAsO6PvzFk	1440475110	636024829611606016	f	andysitalianice
We will be on 32nd park ave tomorrow. Check out our new menu and new flavors. @nycfoodtruck @grubstreet @nystfood @StreetGrubSteve	1440474985	636024305428467714	f	andysitalianice
Due to the shifty weather and us changing the menu board out. We will be off the road today. @nycfoodtruck	1440159824	634702421470629888	f	andysitalianice
Open on 55th and park till 2:30 then off to private event. @nycfoodtruck @grubstreet @nystfood	1440091515	634415915333980161	f	andysitalianice
Who is hanging out with us tomorrow? We are handing out FREE Ices @CitiBikeNYC 12-2pm @nycfoodtruck truck is booked with private events	1439945795	633804720558219264	f	andysitalianice
We are booked for privates events all afternoon. See you all in Union Square around 4pm @nycfoodtruck	1439903039	633625390263701504	f	andysitalianice
We know it's a hot one and unfortunately we need to be off the road for some maintenance. @nycfoodtruck	1439816075	633260633211867137	f	andysitalianice
@WestchesterMed we are almost there! It's a hot one today. See you soon.	1439565293	632208778784579584	f	andysitalianice
47th and Park from 11:15am to 2:30pm !!	1412066274	516869534511538176	f	hityourvspot
53rd and park today! Ready in 30mins	1412001643	516598450713276416	f	hityourvspot
47th and Park!!!!	1411729634	515457565313204225	f	hityourvspot
FRIDAY IS FINALLY HERE!! Let's end the week at our favorite spot! 47th and Park ave. 11:30 - 2:30 !!	1411116392	512885441545396224	f	hityourvspot
47th and Park again! Just can't get enough of this place. See you here :)	1411029928	512522783415623680	f	hityourvspot
Catch us on 47th and Park today!!!	1410966190	512255445114048512	f	hityourvspot
Chilly out today... Warm yourself up with a bowl of Lemongrass Curry Chicken :) 53rd and Park ave 11:30 - 2:30	1410785364	511497006414831616	f	hityourvspot
47th and Park. TGIF! Come Hit your V Spot today!!! :)	1410531048	510430330587987970	f	hityourvspot
53rd and park!  Serving at 11:30am to 2:30pm.	1410440280	510049618806472706	f	hityourvspot
Loving 47th and Park! Sorry we sold out of our lemongrass curry chicken yesterday. Now we're back today and fully loaded! See you here :)	1410342560	509639751230832640	f	hityourvspot
New spot! 47th between Park ave and Lexington.	1410268802	509330391564828673	f	hityourvspot
Start your week with some Vietnamese food at 53rd and Park!	1410185111	508979363241394176	f	hityourvspot
52nd and 6th !!! End your Friday with some savory and spicy lemongrass curry chicken!!	1409913500	507840146365222912	f	hityourvspot
53rd and park from 11:30am-2:30pm	1409837124	507519802190344192	f	hityourvspot
Back at 52nd and 6th!!! :)	1409739596	507110738453094401	f	hityourvspot
53rd and park!!	1409663789	506792782481326080	f	hityourvspot
46th and 6th! YAY Friday!!! End the week with some yummy Vietnamese food!!	1408704079	502767465747607552	f	hityourvspot
53rd and park :)	1408627853	502447749116469250	f	hityourvspot
46th and 6th today from 11am to 2:30pm. Don't come too late!! Or else that yummy lemongrass curry chicken gets sold out again!	1408533848	502053464412020736	f	hityourvspot
Private event today!	1408448881	501697087827091456	f	hityourvspot
Burger Patty Melt:\nAmerican, pickle ,4oz beef burger caramelized onions, tomato, Ketchup (bacon optional) http://t.co/qCzaCv5wTe	1440777423	637292821318340608	f	gcnyc1
G1 46 5/6\nG2 broadway / 55th \n Burger Patty Melt:\nAmerican, pickle ,caramelized onions, tomato, Ketchup (bacon optional)\nComeToTheCheeseYo	1440775908	637286466956230657	f	gcnyc1
Rent the truck for your office lunch. It's a blast..... Have your office mgr.\nEmail lunchgig@gorillacheesenyc.com	1440685281	636906347976650753	f	gcnyc1
G1 - Hanover water / pearl \nG2 - uptown \nDinner @Pier_13Hoboken	1440685046	636905365213462528	f	gcnyc1
RT @afropunk: NEW MUSIC: The Soul Stirring New Single From Rockers @SuburbanPlaza \nListen &gt; http://t.co/dh3sMoM4Cv http://t.co/eu9PKEczLp	1440638416	636709781403770880	f	gcnyc1
Gorilla dog sleeping http://t.co/MHQ0cxkJSi	1440636705	636702608523165697	f	gcnyc1
Gorilla Rockin' da cheese w/our friends @Pier_13Hoboken @PVPIZZATRUCK @TheIncrediballs @themoofoodtruck @AmandaBananasNJ\nComeToTheCheeseYo	1440631525	636680879633498112	f	gcnyc1
RT @AmandaBananasNJ: Happy NationalDogDay  BostonTerrier Nova LoveMyDog https://t.co/rxHrCNOizE	1440631054	636678906507063296	f	gcnyc1
RT @AmandaBananasNJ: Ghostbusters movienight tonight at @Pier_13Hoboken WhoYouGunnaCall Hoboken NJFoodTrucks @ChoppingBlockFT @Tota...	1440631051	636678891067846656	f	gcnyc1
RT @AmandaBananasNJ: movienight at @Pier_13Hoboken 3-1030pm Ghostbusters hoboken @ChoppingBlockFT pier13 $20 sangria bottles all night!...	1440631048	636678881177673732	f	gcnyc1
Rockin the Cheese @Pier_13Hoboken w/ NJFoodTrucks \nComeToTheCheeseYo	1440625696	636656431085789184	f	gcnyc1
@CitiBikeNYC w/ @AndysItalianIce \nTill 11pm  Kent N. 11th/ N. 12th\nComeToTheCheeseYo	1440544982	636317892892606464	f	gcnyc1
RT @AndysItalianIce: Join us tonight on the great lawn in @CentralParkNYC also in Williamsburg   Movie night @CitiBikeNYC with the @gcnyc1 ...	1440544859	636317377941082112	f	gcnyc1
G1 Hudson / king \nG2 47/Park\nRavioli melts w/yummy stuff & Bacon\nComeToTheCheeseYo	1440510484	636173196862058496	f	gcnyc1
G1 @afropunk BROOKLYN \nG2 @NikonJBT @BillboardHot100 \nComeToTheCheeseYo	1440266944	635151714954407936	f	gcnyc1
RT @afropunk: Model and actress Yaya Dacosta at our very first Fancy Dress Ball. afropunk fancydressball\n\nPhoto By Brianna Roye http://t....	1440257517	635112178484441088	f	gcnyc1
RT @afropunk: VIDEO: Steven A. Clark - 'Can't Have'  \nCheck it &gt; http://t.co/TIaRhIatsA http://t.co/2NWRva8ZsZ	1440257510	635112146590937088	f	gcnyc1
RT @afropunk: Official AfropunkFest15 Art Prints w/ @TheRealNaturel @1xRUN --&gt;  http://t.co/fLwaJs9XG8 http://t.co/n79RqKKD9i	1440257502	635112116115087360	f	gcnyc1
RT @afropunk: Grace Jones taking us to church tonight. afropunkfest FancyDress Ball http://t.co/uyRecMA8FG	1440257497	635112091280637953	f	gcnyc1
RT @afropunk: Download the AFROPUNK Festival App! \nAndroid: http://t.co/VNGlzmPDsd  \niOS: http://t.co/2fInOZ20iT http://t.co/rvpr4GYwaQ	1440257473	635111991867277313	f	gcnyc1
@keithbacker You deserve it!	1440779839	637302956161789955	f	kimchitruck
RT @keithbacker: Kimchi Fish Bowl on 52nd and 6th Ave with @KimchiTruck ... no better way to end a week sowoneulmarhaebwa http://t.co/l9Ue...	1440779831	637302921013563392	f	kimchitruck
Making magic happen on 52nd & 6th Ave. Come & get it!	1440773383	637275874077900800	f	kimchitruck
Tacos on Hudson & King St. Can we get an amen?	1440686285	636910559699595264	f	kimchitruck
@keithbacker But where's the sleeping cutie?	1440611578	636597216866660353	f	kimchitruck
Tacos on 52nd and 6th!	1440611149	636595417883508736	f	kimchitruck
We've got a date with midtown today. Woot! 52nd & 6th 11:30 - 2:30	1440597410	636537792252780544	f	kimchitruck
Korean tacos make every day a summer day. @DumboLot Jay & Water St. 11:30 - 2:30	1440510662	636173945083817985	f	kimchitruck
RT @laurablagys: Korean pork belly tacos. I've found my @KimchiTruck of Sydney. Brooklyn Sydney AllisOkay	1440510435	636172992393818112	f	kimchitruck
RT @MattAndChanel: Need this again right now. Korean BBQ Short Rib Taco from @kimchitruck.  AfroPunk http://t.co/wjud1qsTkU	1440423496	635808344884801536	f	kimchitruck
Day 2 of Afropunk! Let's do this!	1440336670	635444169490743296	f	kimchitruck
Afropunk is upon us!!! See you today!	1440248492	635074325138272256	f	kimchitruck
Never too early to start thinking about lunch, esp if lunch = tacos. 52nd & 6th Ave 11:30 - 2:30.	1440163846	634719293675040768	f	kimchitruck
On our way to Hudson & King St. Come on down!	1440077427	634356823273943040	f	kimchitruck
@keithbacker ha! Too cute.	1440009734	634072898114846720	f	kimchitruck
@keithbacker Did our bowls put him to sleep? Eep.	1440001275	634037419319369728	f	kimchitruck
RT @keithbacker: Double double duty with BarBQue Rib and Fish Bowl with @KimchiTruck sowoneulmarhaebwa http://t.co/iCVS6IVlMU	1440001220	634037191073792000	f	kimchitruck
@keithbacker 52nd & 6th for your kimchi bowl addiction ;)	1439994342	634008341057040384	f	kimchitruck
Parked! 52nd & 6th, folks. See ya soon.	1439994224	634007846720536576	f	kimchitruck
TacoTuesday, let's do this! Find us on Jay & Water @dumbolot 11:30- 2:30	1439906081	633638146048159745	f	kimchitruck
dear friends \nwe're off the road today ,because of private event\n\nsee you at Governor's Island on Sunday or Tuesday in Midtown 52st/Park Ave	1440771533	637268118411345921	f	langostruck
hi Midtown we are at 52nd.St bet 6-7 Ave\n11-2:30pm\nthank You	1440684762	636904170986045440	f	langostruck
hi Midtown\nour location is change we couldn't park @ Wall street\nlunch time @53st / Park Ave\n11-2:30pm\nThursday 52st /6Ave \n11-2:30pm\nthanks	1440592734	636518179293003777	f	langostruck
Holla Back!! We are On 51st between Park and Madison!	1391523816	430708222140645376	f	seoulfoodnyc
hi\nMonday at 55st & Broadway\n11-2:30pm\nWednesday Old Slip & Water st\nThurs 52st bet 6-7Ave\nFriday ?\nSat private event\nSun Governor's Island	1440509278	636168138590056449	f	langostruck
happy weekend for everybody\n\nyou can find us @ Governor's Island on Sat & Sunday\n11-5pm\ncalled Ligget Terrace\nenjoy & relax	1440248652	635074994293374978	f	langostruck
http://t.co/POpsdociwZ	1440169609	634743463276322816	f	langostruck
hello Midtown \nFriday lunch time\n53rd. St& Park Ave\n11-2:30pm\nSat & Sunday\nGovernor's Island\n11-5pm\nfoodtruck NYC http://t.co/ftbsNubTDi	1440156946	634690350435667969	f	langostruck
hi Midtown\nour location for lunch 52nd St bet 6-7Ave closer to 6\n11-2:30pm\nblack Angus beef stew broccoli and 2Xcous\nfoodtruck foodnetwork	1440073061	634338513929027585	f	langostruck
hi lunch time \nWed Water st & Old Slip\n11-2:30pm\n\nchicken schnitzel cucumber,radish,roasted eggplant-tomato pure,FF http://t.co/ikOoJiC2i2	1439984258	633966046647558144	f	langostruck
Langos Truck chicken schnitzel w radish ,cucumber ,roaster eggplant tomato pure ,hand cut fries. yam yam http://t.co/iXr6QZB36O	1439919576	633694749313122305	f	langostruck
Good Morning\n\nLangos Truck \nlunch hours 11-2:30pm\nat 55st/Broadway\n\nthank You\n \nfoodtruck hungarian goulash midtownwest euro	1439912080	633663307937906689	f	langostruck
Good Morning\n\nLangos Truck \nlunch hours 11-2:30pm\nTuesday at 55st/Broadway\nWednesday Water St/Old Slip\nThursday 52st/6Ave\n\nthank You	1439900187	633613427630579712	f	langostruck
hello and good morning! langos truck is off the road today, because last minute catering... see you tomorrow and Sunday on Governors Island	1439561379	632192364795285504	f	langostruck
we couldn't park on usual spot, you can find us others side of the street.\nbehind the Polish Truck	1439478396	631844305875939328	f	langostruck
hi Midtown \nyou can find us for lunch at 52nd.street bet 6-7Ave (closer to 6 )\n11-2:30pm\nthank You http://t.co/250tlXejcY	1439471177	631814030164951040	f	langostruck
hi Wall St.\n@water St & Old Slip\n11-2:30 pm\nThursday 52nd.st 6Ave\nFriday  47St.Park Ave\nsat & sun Governor's Island\n11-5pm\nfoodtruck	1439380199	631432440112906241	f	langostruck
Good morning\nwe are in Midtown 52St./6Ave\n11-2:30pm\nFriday Brooklyn Navy Yard\nBuilding 92\n11-2:30pm\nSat & Sunday\nGovernor's Island\n11-5pm	1438863748	629266287827488768	f	langostruck
Hi Fidi\nWe're on Wall St\nCorner of William St\n11-2:30pm\nThursday bet 6-7th. Ave\n11-2:30pm http://t.co/kU0S1Uihq3	1438782264	628924517549764608	f	langostruck
Hi Langos Truck is off the road today we got some technical issues\nSee you soon	1438699986	628579416944328704	f	langostruck
More info\nYou can find us on Saturday and Sunday\nGovernor's Island\n11-5pm\nLol	1438351993	627119830307631104	f	langostruck
Some taco game is more easily won than others...this one's a sweep http://t.co/EU94h1YmPh	1440540594	636299488538329088	f	mexicue
Greens & Grains | No need to overthink on a Monday http://t.co/u0miOBRYBF	1440431749	635842957766184960	f	mexicue
Yep, weekend  TreatYoSelf http://t.co/LB5zrt5iyV	1440191563	634835544598556673	f	mexicue
 (emojis are lacking, but you get the gist) TreatYoSelf http://t.co/Yvs4CWe9cK	1440105839	634475991834959873	f	mexicue
Those crispy enchilada edges tho... | Smoked Chicken, Spicy Brisket or Shrimp Jambalaya - you've got choices http://t.co/7qhEdhvQgl	1440001282	634037451141550080	f	mexicue
Treat. Yo. Self. http://t.co/8FeBsvwiXE	1439912891	633666712374767616	f	mexicue
Date Night: This burrito + your face  http://t.co/LIaAcrDJi1	1439586968	632299691171008513	f	mexicue
@tedmurphy great shot!	1439486630	631878842236424192	f	mexicue
RT @tedmurphy: Beautiful presentation @mexicue http://t.co/Ws5d8Nx8H8	1439486624	631878815514542080	f	mexicue
RT @ChekmarkEats: Cheers to some of the best mac n cheese I've ever had @Mexicue http://t.co/oULX0hewld	1439322584	631190784767840256	f	mexicue
House made tortilla strips  TreatYoSelf http://t.co/P41KFXkeJ7	1439314025	631154886613274624	f	mexicue
It might be a 'Redneck Shrimp Cocktail,' but you have to use a fork classy http://t.co/LyGhIWeTuw	1438969980	629711853476794369	f	mexicue
Tacos = life http://t.co/HhZMn57osg	1438724386	628681758440091648	f	mexicue
green and yellow green and yellow green and yellow | had to WizKhalifa this Arugula & Avocado Salad http://t.co/MMPakpfSwB	1438636817	628314468053843968	f	mexicue
Strawberry Rhubarb Mint Margarita because  http://t.co/gCqWod0OKm	1438378867	627232548805038081	f	mexicue
 Tostada got me like  http://t.co/1LfprKgiUa	1438206625	626510114174824448	f	mexicue
Feelin myself - Inner Thoughts of a Mexicue Burrito http://t.co/2Ev4fHGTqH	1438097117	626050803296546816	f	mexicue
Calm before the storm at 225 Fifth. Let's do this, Monday  http://t.co/JMIgUTxwhU	1438008181	625677777405112320	f	mexicue
All of the lights...and the drink\n\nIt's time TreatYoSelf http://t.co/KyaBKSPeGn	1437686324	624327812749524992	f	mexicue
The best kind of tacos are three tacos http://t.co/vl3doFj68D	1437493037	623517107452538881	f	mexicue
FoodTruckFriday FalafelFriday it's all happening today on Old Slip btwn Water & Front St until 3pm! vegan falafel http://t.co/wNkVMcnRSC	1440768620	637255899246149632	f	toumnyc
RT @SHSassin: NeverToumMuch with @ToumNYC it's healthy fresh vegan GlutenFree shawarma catering rent our truck	1440699103	636964324246990848	f	toumnyc
@alinutzav Welcome back! We can't wait to serve you!! 	1440689742	636925060104777728	f	toumnyc
RT @alinutzav: @ToumNYC I was gone for one full month, can't wait to have a sandwich from your truck today, they are delicious!	1440689721	636924972733210624	f	toumnyc
We're back on the road and getting ready for lunch in @DumboNYC! Join us on Jay & Water St until 3pm! LebaneseLunch	1440682000	636892588398759936	f	toumnyc
@boulosdib Our truck is in the shop :(	1440606639	636576500414849024	f	toumnyc
Start your week off right with Toum in your belly! Join us in @DumboNYC on Jay & Water St until 3pm! LebaneseLunch	1440422653	635804807090077696	f	toumnyc
Day 2 of @afropunk on this sundayfunday! Join us in Brooklyn until 10pm!	1440346732	635486371604492288	f	toumnyc
@afropunk is here! Join us in Brooklyn today and tomorrow 11am-10pm!	1440255849	635105178950234112	f	toumnyc
Sorry folks, off the road today! Catch us @afropunk tomorrow and Sunday!	1440161740	634710457467699200	f	toumnyc
RT @dumbolot: We got @ToumNYC @MexicoBlvd and @mausamnyc today!	1440079627	634366053842329600	f	toumnyc
Tabbouleh Thursday's are in effect in @DumboNYC! Join us on Jay & Water St until 3pm! vegan LebaneseEats http://t.co/xHnJ3NLB13	1440075416	634348390386651136	f	toumnyc
Okay you kafta lovers, we're getting ready for you on 46th btwn 5th & 6th! Join us until 3pm then off to the @RoyalPalmsClub until 10pm!	1439990757	633993306658242560	f	toumnyc
RT @MobilizeNY: What a busy day in Harlem today! Hope everyone enjoyed their @ToumNYC lunch and NothingICantDoATT shades from @att http:/...	1439929928	633738168483713024	f	toumnyc
RT @MobilizeNY: We're half way through our day! Come learn about GoPhone at MarcusGarveyPark & get freelunch from @ToumNYC Harlem http:...	1439919940	633696278547955712	f	toumnyc
Dont miss out! @MobilizeNY & ATT - giving away @ToumNYC today btwn 12-4 at Marcus Garvey Park! NothingICantDoATT	1439914592	633673844730011648	f	toumnyc
Were teaming up with @MobilizeNY & will be giving out Shawarma & Falafel from 12-4 at Marcus Garvey Park! GoPhone NothingICantDoATT	1439905837	633637122457604097	f	toumnyc
Got the MondayBlues? We've got the cure! Join us in @DumboNYC on Jay & Water St for a LebaneseLunch Beef Kabab http://t.co/QuawdwNt9P	1439819607	633275450480046081	f	toumnyc
We love sundayfunday at the @prospect_park foodtruckrally! Join us in Brooklyn at GrandArmyPlaza until 5pm for LebaneseEats	1439737730	632932031182319616	f	toumnyc
You know what day it is! FoodTruckFriday! Join us on Old Slip btwn Water & Front St until 3pm.	1439558533	632180426891755520	f	toumnyc
@LadyLisaTerror thank you! Glad you enjoyed!  Come again soon!	1440802634	637398564818264064	f	dubpies
RT @LadyLisaTerror: Holy pie! @dubpies so good! williamsburg nyc foodie	1440802600	637398418986561536	f	dubpies
PieTruck is at Bedford Ave and N7th until late tonight! FoodTrucks Brooklyn	1440797424	637376710472806400	f	dubpies
@RahulKadukar as per earlier update - truck didn't make it out earlier - but is rocking at Bedford Ave & N7th, tonight- Williamsburg	1440797386	637376550762057728	f	dubpies
@PersistentCooki hey - yeah, as posted earlier, the truck didn't make it out today. We're usually @ Hudson/King on Friday anyway. Sorry!	1440797308	637376223652483073	f	dubpies
PieTruck is still in dry dock. Watch this space for updates.	1440772047	637270272161280000	f	dubpies
RT @noeticsound: south slope/windsor terrace local hero @dubpies is co-sponsoring @MenInBlazers' BlazerCon football conference! http://t.c...	1440693734	636941804944945153	f	dubpies
RT @ezCaterInc: Hot off the press: Our look at why you should be having pie for lunch. http://t.co/IOtGHztqOg http://t.co/khJSMWCYHP	1440693627	636941354069819392	f	dubpies
PieTruck is still in dry dock. Sorry pie lovers. Back tomorrow;	1440687700	636916496678146048	f	dubpies
RT @NYTSports: Soccer is getting its own Con, courtesy of the @MenInBlazers. http://t.co/yMwvhjr6Jn	1440641390	636722258405257216	f	dubpies
RT @jallennyc: Most excited about the @dubpies connection here - bring on the pies! https://t.co/o4oCjn86Cz	1440641299	636721873846317056	f	dubpies
RT @davidlbecker2: @dubpies @sixpoint Resin is the best. Can't wait till they're in Idaho(hint, hint).	1440641068	636720908313456640	f	dubpies
oh @sixpoint Resin, how we love thee. Sticky buds in high octane beer-form. Yes. IIPA IPA	1440639022	636712326952042496	f	dubpies
We didn't until now! Very excited. RT @kaivai: Always wondered if @dubpies had something to do with @MenInBlazers BlazerCon	1440634354	636692747378917376	f	dubpies
PieTruck is having its ball joints replaced. Off the road today. Back tomorrow, we hope!	1440600241	636549664020529152	f	dubpies
@Cristalledesma sorry - didn't press Send on today's update - PieTruck was with mechanic having ball joints replaced! Back Wed, we hope!	1440531697	636262171584937984	f	dubpies
PieTruck is back in the mechanic shop - with any luck we'll be back by tomorrow, Wednesday!	1440531605	636261787399233536	f	dubpies
RT @kelly_o_hara: Thanks to the Thai Chicken Curry pie, I think @dubpies might be my new favorite food truck (+ the counter guy's cute acce...	1440476499	636030656129167360	f	dubpies
RT @MORGO_NZ: A most savoury endeavour .@dubpies | Idealog http://t.co/Q8P5JXYutm	1440476473	636030544397107201	f	dubpies
RT @dialogCRM: A most savoury endeavour NYC .@dubpies | Idealog http://t.co/Xrt6bPq4Lt	1440447107	635907376755929088	f	dubpies
We are at the corner of 55st and Broadway!	1440776939	637290790956437504	f	chefsamirtruck
We are at 47st between park av and Lexington av!	1440690333	636927540842639360	f	chefsamirtruck
We are at the corner of 36st and Broadway!	1440516230	636197299610370048	f	chefsamirtruck
We are on 33st between 8av and 9av !!\n@GiulianiSocial ,@SweetChiliNYC	1440433132	635848760795512832	f	chefsamirtruck
Amazing time at afropunkfest @afropunk , http://t.co/TYqXKLldXb	1440290770	635251649028734976	f	chefsamirtruck
We are so excited to be part of afropunkfest 2015,bringing the best gyros and fajitas @afropunk @Sexyfoodtrucks	1440202160	634879995077332993	f	chefsamirtruck
We are at 55st and Broadway!	1440173062	634757945704718336	f	chefsamirtruck
We are at 47st between park av and Lexington av!	1440084382	634385997216808961	f	chefsamirtruck
We are at 52st and park av!	1439998460	634025612877922304	f	chefsamirtruck
We are at the corner of 36st and Broadway!	1439911709	633661755265126400	f	chefsamirtruck
We are close today! !	1439825272	633299210390081536	f	chefsamirtruck
Take a break and visit us!!! Fresh food!  Govsball2015 chefsamirtruck https://t.co/WyBZsQPCxC	1439575347	632250950657404928	f	chefsamirtruck
Start your weekend with the best Mediterranean healthy food! !@ 55st and Broadway @EatMediteranean	1439566471	632213719515312128	f	chefsamirtruck
We are at 47st between park av and Lexington av!	1439479744	631849959697072128	f	chefsamirtruck
Couscous time! https://t.co/jmGoul8BIH	1439426889	631628271722098688	f	chefsamirtruck
Just posted a photo https://t.co/of1Cx5kQjw	1439426379	631626131553316865	f	chefsamirtruck
We are at 52st and park av! ! Come enjoy the best couscous in town! http://t.co/zbuhenW48o	1439392873	631485598772166656	f	chefsamirtruck
We are close today! !!	1439307362	631126936887160832	f	chefsamirtruck
Due to filming activity, today we are parked at 56st in the middle of the block between Broadway and 8av! @souvlakitruck @carlssteaks	1438961535	629676435687493632	f	chefsamirtruck
We are at 56 st between Broadway and 8av!	1438961406	629675894597156864	f	chefsamirtruck
Come to 51st street, between Park and Madison - it's lunch time!!	1392220033	433628363769798656	f	seoulfoodnyc
It is almost time to plan for dinner! We ate at West 4th and Greene NYU!	1392150901	433338403933794304	f	seoulfoodnyc
Is it lunchtime yet?\nWe are ready to feed you!\nWe are at 46th street between 5th and 6th !	1392128245	433243381087879168	f	seoulfoodnyc
We have landed! West 4th and Greene	1392074122	433016370708496384	f	seoulfoodnyc
Happy Monday! We are ready to feed you at\n51st street between Park and Madison !	1392044717	432893038168641536	f	seoulfoodnyc
It's Sunday and time to eat.\nWe are parked in front of The Apple store \n67th and Broadway!	1391956105	432521369742737408	f	seoulfoodnyc
We are here!\n67th and Broadway in front of Apple Store	1391870848	432163777136824320	f	seoulfoodnyc
It's almost lunchtime-\nWe are already On 51st between Park and Madison!!	1391788330	431817673001820160	f	seoulfoodnyc
Is it dinner time yet?\nWe are at West 4th and Mercer, NYU!!!	1391719998	431531067087257600	f	seoulfoodnyc
Hungry yet? We are at 51st Street between Park and Madison Ave !!!	1391700710	431450167892402176	f	seoulfoodnyc
Here now.....West 4th and Greene street!!	1391555645	430841718502457344	f	seoulfoodnyc
Are you hungry? We have arrived- West 4th and Greene street NYU...	1391465917	430465373465366528	f	seoulfoodnyc
Snow- We are at 51st between Park and Madison Ave	1391440953	430360666047000576	f	seoulfoodnyc
Super eat Sunday...we are at the Corner of 67th & Broadway in front of Apple Store, open for biz now-	1391356481	430006364795338753	f	seoulfoodnyc
Come and get it!!!\nWe are at 67th and Broadway outside Apple Store !	1391268060	429635500639408128	f	seoulfoodnyc
The sun is up an we are already to serve you for lunch!\nWe are at 51st between park and Madison....see ya real soon!	1391171021	429228490248826880	f	seoulfoodnyc
If loving you is wrong....eat!\nWe are at West 4th and Greene Street!!! Come on by and chow!	1391115690	428996417542053888	f	seoulfoodnyc
We are ready to feed you at lunchtime!! Just parked on 51st between Park Avenue and Madison Avenue	1391090268	428889788901371904	f	seoulfoodnyc
We just arrived for dinner time!! West 4th and Greene street	1391028368	428630161693487104	f	seoulfoodnyc
Our last weekend at @Gov_Island & tmrw is rainy! U know what that means- get your porkbelly sataychicken gojuchang tofu today! foodies	1408198481	500646832406818817	f	getstuffednow
Reservation Service @IKnowTheChef Hits the Hamptons http://t.co/54sl7ndfU4	1407673208	498443678977757185	f	getstuffednow
sun is shining and we r setting up for the day at @Gov_Island, bring u'r bikes and head over 2 the food court ! Picnicinthepark streetfood	1407672933	498442527306162176	f	getstuffednow
rainorshine, we r @Gov_Island dishing porkbelly, meatballs & more!	1406994778	495598137881673728	f	getstuffednow
Temple tofu was the most popular option yday at @Gov_Island , what is it gonna be 2day? veganfaire tofulove	1406469359	493394369550897152	f	getstuffednow
RT @nytimes: Three New York City waterfront hotspots this summer (Photo: Karsten Moran for NYT) http://t.co/Q7fd6pMEJa http://t.co/PaVZvGIP...	1405868430	490873890587959296	f	getstuffednow
Back at governorsisland , we were sold out at 2:30 yesterday so get here quick! @Gov_Island	1405867852	490871467148447744	f	getstuffednow
13 Best NYC parks for families (that arent Central Park): http://t.co/BDMpiMj8TM? Stop by Momos & Buns at the top pick GovernorsIsland	1404569405	485425387678072832	f	getstuffednow
Its banhmi's today at our @Gov_Island pop up today, nothing tastes better than lpickled carrot daikon & roast meats on soft semolina rolls!	1403961436	482875378113859586	f	getstuffednow
Who's hungry? We r back with some more peking duck sliders @Gov_Island ! popupstore sundaybrunch	1403448327	480723242697916417	f	getstuffednow
RT @NYCMayorsOffice: Happy Father's Day. http://t.co/D27i0IT5OR	1402846026	478197011238641665	f	getstuffednow
RT @GovIslandFood: Happy Father's Day. Come bring dad to @Gov_Island for some Jazz and great food.@SweetChiliNYC,@MayhemAndStout,@MrNiceGuy...	1402846006	478196925637095424	f	getstuffednow
RT @GovIslandFood: Who's ready for some @jazzagenyc and some great food? @SweetChiliNYC,@ElPasoTruck,@DiSOSNYC,@MrNiceGuyTruck,@Getstuffedn...	1402754477	477813027257847808	f	getstuffednow
RT @nicole_rae: We enjoyed our lunch from @Getstuffednow on @Gov_Island @GovIslandFood vegan nyc governorsisland FigmentNYC http://t.co...	1402431493	476458332199612416	f	getstuffednow
We sold out by 3pm yday, don't be disappointed 2day-get 2 us as soon as u land on the island! @GovIslandFood @Gov_Island @livefastgroup	1402238487	475648807070609408	f	getstuffednow
Todays kid special @Gov_Island pop up stand - decadent triple chocolate cookies ! weekend is 4 familytime !	1402151133	475282419512532992	f	getstuffednow
Catch us at Governors Island every weekend , The Ultimate Guide to Outdoor Dining Adventures http://t.co/b80ALbJ62h via @EaterNY	1401716842	473460870555516929	f	getstuffednow
RT @GovIslandFood: Come on over to @Gov_Island tomorrow for sunshine and great food. @SweetChiliNYC, @MayhemAndStout, @carlssteaks, @Getstu...	1401539927	472718833275650049	f	getstuffednow
This was the line for the last ferry off @Gov_Island yesterday! Come early 2day, we r slinging awesome kobe burgers! http://t.co/TXNni8IRN2	1401105843	470898153097416704	f	getstuffednow
RT @GovIslandFood: Almost 100 followers!! Our 100th follower(must be new)gets a free lunch from any one of our vendors at Gov. Island. Rede...	1401105728	470897670782210048	f	getstuffednow
W50th and 6th ave. Ready at 11:30 midtown HappyFriday	1440775639	637285337551773697	f	kayanyc28
Good weather for buns. Bao down today at Charlton and Varick. Get ready by 11:40. lunchbox foodie http://t.co/NwtC90nwmW	1440687850	636917125144309760	f	kayanyc28
Greenwich and Park Pl today. Ready by 11:30 buns lunchtime asianfoods	1440601055	636553079278706688	f	kayanyc28
popcornchicken spicymayo friedchicken taiwanese asianfoods foodies chinese crispy yummy... https://t.co/tvBP3n71oK	1440558435	636374316939112448	f	kayanyc28
RT @yankee_MSU: If you're in Midtown, shoot over to W50th and 6th ave and check out @KayaNYC28...Their Gua Baos are godly... http://t.co/E2...	1440555681	636362769558839296	f	kayanyc28
W50th and 6th ave midtown get ready by 11:45 @feistyfoodie http://t.co/CIKnkoG87f	1440517354	636202013202739200	f	kayanyc28
Front and Adams till 2:30. porkbelly @DUMBOFoodTrucks http://t.co/NVuePGKf1w	1440428308	635828527212941313	f	kayanyc28
midtown midtownlunch foodie baos pekingduck porkbelly Fridaylunch TGIF taiwanese FoodTruckFriday yummy asianfood catering	1440170889	634748831012421632	f	kayanyc28
W50th and 6th ave by Chase bank. Ready by 11:45. @feistyfoodie @NYCFoodieFinder bao midtownlunch http://t.co/RB2sS1YlvK	1440170078	634745430052630528	f	kayanyc28
Ready by 11:45 at Charlton and Varick. soho Thursday lunch baos	1440082280	634377181158879232	f	kayanyc28
@EatThisNY thank you for your video Brian.	1440022134	634124907715149824	f	kayanyc28
RT @vendyawards: Check out these gua bao (steamed buns) from @vendyawards rookie nominee @KayaNYC28 in @TurnstileTours latest video http:/...	1439997359	634020995347705856	f	kayanyc28
Greenwich and Park pl. ready by 11:45	1439996113	634015768422842368	f	kayanyc28
Charlton and Varick today. Get ready by 11:45. Come get a Bao	1439907945	633645966697082880	f	kayanyc28
RT @lauren_liles: @KayaNYC28 im totally crushing on your buns!	1439857549	633434588623278081	f	kayanyc28
Front and Adams till 2:30. Jumpstart your day with our baos. @DUMBOFoodTrucks veggie @DumboNYC http://t.co/vLE5slTtRE	1439823680	633292534727471105	f	kayanyc28
Midtown Midtownlunch Fridaylunch vendyawards foodies FoodTruckFriday foodcart baos buns porkbelly taiwanese TGIF lunchtime	1439563823	632202611849084928	f	kayanyc28
W50th btw 6th and 7th ave. Serving up steamed buns till 2:30. @vendyawards @EatThisNY @feistyfoodie http://t.co/lSXJG2pxZx	1439563502	632201266391818240	f	kayanyc28
RT @ejbergdahl: Well, okay, @KayaNYC28 just changed my life. That was some damn good lunch, guys. Thanks!	1439491870	631900821656084480	f	kayanyc28
Slinging baos at Varick and Charlton today. Ready by 11:45. foodtrucks lunch Rookie foodies	1439478368	631844188418637824	f	kayanyc28
RT @dumbolot: We got @ToumNYC @MexicoBlvd and @mausamnyc today!	1440081913	634375639706038272	f	mausamnyc
77 and Lexington we are back. Cooking all your favorite gourmet flavors fresh on location. Can't wait to see you all!!!	1438960225	629670940247461888	f	brooklynpopcorn
Beaver and Broad st we are back. Cooking all your favorite flavors Fresh on Location. Can't wait to see you all!!!	1438960211	629670882080899072	f	brooklynpopcorn
@Serah_Phi Thank you for your support LIZ :)	1438215286	626546441142427648	f	brooklynpopcorn
RT @Serah_Phi: Just drove across the city and added 20 min to my drive home for some @BrooklynPopcorn	1438214654	626543788723302401	f	brooklynpopcorn
A BIG THANK YOU to our @TwitterNYC friends for all the support and love you have given us!! Please continue to follow us in our journey :)	1438183709	626413994924974080	f	brooklynpopcorn
@GooleyChris Hope you found us today. Thanks for the support and see you soon!	1438144242	626248459323080704	f	brooklynpopcorn
RT @GripNBlaze: Eating @BrooklynPopcorn tastes so good	1438143777	626246507998670852	f	brooklynpopcorn
RT @Alitgator: YAYYY @BrooklynPopcorn at Twitter NYC - best afternoon ever! http://t.co/Ynq470ERi0	1438143688	626246133929668608	f	brooklynpopcorn
RT @laurenperini: Thanks for the afternoon snack  @BrooklynPopcorn !! http://t.co/gjmxLOSPUe	1438143671	626246063255633920	f	brooklynpopcorn
RT @SydKLION: Free @BrooklynPopcorn? Yes, please! LoveWhereYouWork @TwitterNYC http://t.co/1m2fX1Twpe	1438143664	626246035585769472	f	brooklynpopcorn
RT @kaitlyntweets: @BrooklynPopcorn thank you! Love the Brooklyn mix	1438143655	626245997786726400	f	brooklynpopcorn
@fariole @SydKLION @TwitterNYC Absolutely! We love our Canadian friends in Toronto!!	1438143586	626245706412650496	f	brooklynpopcorn
RT @fariole: @SydKLION @BrooklynPopcorn @TwitterNYC Looks delicious? Can we ship some to Toronto?	1438143534	626245487994249216	f	brooklynpopcorn
RT @JessicaS: Afternoon snack @TwitterNYC @BrooklynPopcorn http://t.co/VGe7L5PQBW	1438143443	626245110028705793	f	brooklynpopcorn
RT @ArbenPerk: Oh yeah! @BrooklynPopcorn http://t.co/F33Q7vwEfd	1438143435	626245073991258112	f	brooklynpopcorn
RT @NikiKirschner: Thanks for the afternoon snack @BrooklynPopcorn! http://t.co/ADwHHR9ibD	1438143426	626245038067064832	f	brooklynpopcorn
RT @sarahtarno: Judging by the line, @TwitterNYC is really excited about @BrooklynPopcorn! http://t.co/L8prwf2MwC	1438143420	626245011223498752	f	brooklynpopcorn
RT @irisyangg: What flavors would you like? - the hardest decision I had to make today @BrooklynPopcorn TwitterNYC http://t.co/lt69tvW2WA	1438143413	626244980747714562	f	brooklynpopcorn
RT @Alex_Garvey: A sweet end to my @twitter HQ visit today! Thanks twitter & @BrooklynPopcorn! yum  http://t.co/mSQwl822cr	1438143387	626244874656972801	f	brooklynpopcorn
RT @eileen_ann: Thanks so much for the delicious nomz this afternoon, @BrooklynPopcorn + @twitternyc! http://t.co/yksukQD519	1438143377	626244829996040192	f	brooklynpopcorn
@greggfly currently in Boston MA we should be back on the streets of NY for lunch by Monday	1440603455	636563144207417344	f	mamasheros
@ohhhhhh_god thank you glad you enjoyed your lunch 	1440019394	634113414885994496	f	mamasheros
Varick street are u hungrayyyyyyy?!?!?!? Lol lunch time on Varick & Charlton	1439828702	633313595951087617	f	mamasheros
Varick and charlton st today	1439568898	632223898592002048	f	mamasheros
@greggfly sorry due to the rain we will be there tomorrow Wednesday see you then	1439303093	631109031478865920	f	mamasheros
@greggfly thank you for the love we'll be on Varrick St and Charlton St tomorrow Tuesday and on Water St & Old Slip Ct on Thursday	1439248679	630880805137551360	f	mamasheros
@fsayed thank you for your tweet 	1437831545	624936912374116352	f	mamasheros
Another happy customer  https://t.co/LwWox4HxOO	1437831523	624936819134697472	f	mamasheros
foofighters CitiField tomorrow night mamasheros	1436994952	621427989276983296	f	mamasheros
Join us this Thursday at citifield http://t.co/P93ALcvV6c	1436901343	621035361377120256	f	mamasheros
Mini crowd forming, come get a sandwich, you really won't regret it. 46th between 5th and 6th http://t.co/EJYNaKt1MB	1436803093	620623273919971328	f	mamasheros
Hey guys! Catch us at the Fair @ The Square in Westchester Sq in the Bronx. We will be leaving at 6 pm! See you there http://t.co/l3GMs5R7eu	1434812189	612272815853699073	f	mamasheros
RT @BigMangNate: had my first @MamasHeros today, pretty damn tasty and the sandwich was huge.  Def going to work it into the truck rotation.	1433544013	606953700939169792	f	mamasheros
Thanks Nathan We Look Forward To Seeing You Again Next Wednesday Here Downtown https://t.co/dX7vmOCAdI	1433350875	606143622090788864	f	mamasheros
Catch Us On Water St & Old Slip Today Can't Miss Us! NYCFoodTruck	1433338092	606090004050407425	f	mamasheros
A Special Good Morning For Downtown Manhattan! Today We're Right On Water St & Old Slip. Come Try Us... https://t.co/gUVJXoBUKA	1433337922	606089294239956995	f	mamasheros
Today We'll Be On 46st Between 5th & 6th Avenue NYCFoodTruck TweetAboutIt FoodTruck	1433248420	605713892451467265	f	mamasheros
Shout Out To Everyone Who Came Out Today To Try Our Footlongs! Tomorrows 55th & Broadway in West Midtown	1432842531	604011470372900864	f	mamasheros
RT @randomfoodtruck: Start the long weekend off right! @Chefsamirtruck @souvlakitruck @PolishCuisine @MamasHeros @gcnyc1	1432842390	604010879483527169	f	mamasheros
RT @USMCHerk1022: I don't enjoy the termite loving of NY City, but I do love me some street food. @MamasHeros	1432842356	604010739645468672	f	mamasheros
@teaandmilk @vendyawards thanks guys i cant wait catch on that on that tea or should I say milk crack laii cha	1440788539	637339444023033856	f	coneyshack
Come over to coney island for your tacos... the boys are back in action!!! http://t.co/1ifubZzh4b	1440782909	637315832759087106	f	coneyshack
Coney Island home of the Warriors ,we're finally back and better than ever , come by for the grand re-opening or... http://t.co/tP5o0dDsUB	1440770132	637262239104274432	f	coneyshack
Coney Island ,home of the warriors we're back in full swing come by for the grand re-opening  or truck located on 46th and 6th ave midtown	1440769251	637258544933433345	f	coneyshack
@therealrook you can find us at 46th and 6th Ave tomorrow!	1440732177	637103043901792256	f	coneyshack
@therealrook Our truck was actually at 48th between 6th&7th today & our Coney Island spot will be reopened this weekend!	1440732154	637102949827645441	f	coneyshack
@_smith113 no sorry! We will be open definitely by this weekend!	1440731836	637101613564461057	f	coneyshack
@punkimeowmeow hope you enjoyed your lunch!	1440698397	636961363085148160	f	coneyshack
Breaking that cherry on 48th st and 6th ave for the 1st time, 11:30 - 3pm get ready for count down ! http://t.co/KB78l5HEpj	1440685392	636906813288509440	f	coneyshack
Very excited to be on 48th st and 6th ave for the first time. 11:30 - 3pm get ready for the count down midtown... http://t.co/80i5girGaZ	1440684922	636904845300006912	f	coneyshack
48th in between 6th and 7th ave!! Very close to our usual spot at 46th and 6th guys  http://t.co/zNpbFgv6jU	1440683547	636899076680863744	f	coneyshack
48th between 6th and 7th ave! Come swing by for your taco fix of the day 	1440679466	636881960795774976	f	coneyshack
RT @KatieKane84: 47th btwn Park & Lex is food truck heaven @ConeyShack wins for lunch today!!  nycfoodtrucks	1440617948	636623934243381248	f	coneyshack
47th &  park ave till 3pm on this gorgeous day !!	1440602772	636560281481703424	f	coneyshack
Such a gorgeous day, in midtown manhattan come by 47th and park ave and enjoy it with us !! http://t.co/Y558mp8Lso	1440597844	636539614035968000	f	coneyshack
47th and park ave till 3pm were gunning for you on this beautiful day.	1440597316	636537399120523266	f	coneyshack
Stop at 47th & Park today! Open from around 11am-2:30pm.	1440593052	636519511018078208	f	coneyshack
@MonicaFuks we should be open on Thursday! 	1440592919	636518953091792896	f	coneyshack
@MuRRizzLe hey!! We will be open at our W 8th location most likely on Thursday  sorry for the long wait	1440592889	636518828101533696	f	coneyshack
@KatieKane84 we will be at 47th & Park tomorrow ! 	1440532858	636267042044297219	f	coneyshack
@polishobsession they contain bread	1440364380	635560391381250049	f	mtblls
TGIF MTBLL LOVERS!  Stroll on by 50th bet 6&7 Aves for your weekend fix. The  will be waiting 	1440168472	634738697007665152	f	mtblls
Good Tuesday Y'all! The Mtbll  has stopped on 50th bet 6&7. Drop by for your favorite ball 	1439912826	633666437111001088	f	mtblls
Good Thursday Y'all!   The Mtbll  is waiting at 50th bet 6&7 Aves. Come on by for your favorite menu item 	1439468010	631800742903459840	f	mtblls
Happy  Day Mtbll Lovers! What a beautiful day to take a stroll to 50th bet 6&7.   Your awaits with your favorite ball.	1439390160	631474216437706752	f	mtblls
Seen y'all tomorrow http://t.co/SMUCoio2bd	1439318192	631172363636330496	f	mtblls
Good Monday Morning!   It calls for a beauty today   Perfect for a stroll to 50th bet 6&7. We are stocked up on... http://t.co/xdFtN1IlkD	1439216813	630747149681213440	f	mtblls
Good Morning Mtbll Lovers   What a beautiful day to take a stroll for your weekend fix. The  has stopped on... http://t.co/tMX91bEz7J	1438956840	629656743811923968	f	mtblls
Good Thursday Y'all! Looks to be a nice one today .  Take a stroll to 50th bet 6&7 Aves for some tasty balls. We... http://t.co/Xx9XV28v3g	1438872750	629304044939558912	f	mtblls
Good Morning Mtbll Lovers! The  is back out and about after an extended family weekend. Stop on by 50th bet 6&7... http://t.co/2l79U3HgkM	1438784100	628932217994104832	f	mtblls
I posted a new photo to Facebook http://t.co/SoIg8HNclO	1438356158	627137300460371968	f	mtblls
TGIF MTBLL Peeps!  The  has stopped on 50th bet 6&7 Aves. So come on by for your weekend fix 	1438356035	627136782962946048	f	mtblls
Happy Thursday Y'all! The Mtbll  has stopped on 50th bet 6&7 Aves.   Pass on by for your favorite menu item 	1438268369	626769087285305349	f	mtblls
Good Morning Mtbll Lovers!  Another hot one today  Come on by for some ice cold honest tea and water to refresh... http://t.co/gVFTNwEVZw	1438182542	626409101380218882	f	mtblls
Happy Terrific Tuesday Y'all .  The Mtbll  is out and about and has stopped on 50th bet 6&7. Come in by for your favorite ball 	1438093377	626035115546775552	f	mtblls
The Mtbll  will be extending our weekend. See ya all tomorrow  http://t.co/2TZe2HTo17	1438008059	625677267558113280	f	mtblls
TGIF MTBLL LOVERS!  Come on by 50th bet 6&7 Aves for your weekend fix    The Mtbll  is ready and willing to... http://t.co/FjPU16Hkpg	1437750342	624596323333869574	f	mtblls
Good Morning Y'all! Today is calling for a beauty   come on out, take a stroll to 50th bet 6&7 and get your... http://t.co/iyrN2kAYsJ	1437660689	624220293058424832	f	mtblls
It's that time of the week Mtbll Lovers! Yep its  day!  The  is stopped at 50th bet 6&7 Aves with your scrumptious faves. So come on by 	1437574595	623859185814491136	f	mtblls
Good Tuesday Y'all!   The Mtbll  is out and about stopping at 50th bet 6&7 Aves.   Come on by and get your favorite menu item.	1437490959	623508391294541824	f	mtblls
This Sunday, Smorg is moving to prospectpark. We'll be there, so come out!! \nhttp://t.co/LMfZSNdv0I	1440782248	637313059183312896	f	milktrucknyc
RT @ShanghaiMKS: A big congrats to all of our friends: http://t.co/JE4gifEmcP @KorillaBBQ @VLAIC @TheTreatsTruck @waffletruck @milktrucknyc...	1440781418	637309577369907200	f	milktrucknyc
Bessie is off the road today due to private event so visit @TheSeaport instead! did you know we cater? Info at catering@milktrucknyc.com.	1440770414	637263421327564800	f	milktrucknyc
RT @stacylondon: TONIGHT on tlc's special STACY REVEALED meet my parents as MY PARENTS AND MY DAD AS THE RECIPIENT OF... https://t.co/4ej7VnD...	1440727622	637083938708717568	f	milktrucknyc
great show @stacylondon!  & @MediaStyleNYC you look good!   tlc lovelustorrun https://t.co/TVda2SS9eu/s/eJaD	1440727250	637082380344369152	f	milktrucknyc
Bessie is at 53rd & Madison today! Call 646-504-6455 to preorder. Sandwiches also always at @houstonhallnyc or @theseaport!	1440684009	636901013312532480	f	milktrucknyc
Bessie's off the road today, but visit our @TheSeaport kiosk @ 19 Fulton St! Perks: tater tots and the Milk Truck Cuban.	1440511934	636179280897122304	f	milktrucknyc
Bessie is at 53rd & Madison today for lunch! Call 646-504-6455 to preorder. Also @TheSeaport kiosk at 19 Fulton St. open all day .	1440079209	634364299960414208	f	milktrucknyc
@CaraJoyDavid correct.	1439994327	634008276993187840	f	milktrucknyc
@CaraJoyDavid 58th & madison today!	1439993224	634003653750312960	f	milktrucknyc
Bessie is at 58th & Madison today for lunch! Call 646-504-6455 to preorder your meal. As always, @TheSeaport is open from 12-8 19 Fulton St.	1439992807	634001903244804096	f	milktrucknyc
RT @OnionBusiness: I promise that HR is toiling 16 hours a day, plus weekends, until the problem is solved. http://t.co/CltffQbaNG http:/...	1439925394	633719151421456385	f	milktrucknyc
Bessie is off the road today. Come get the sandwich you're craving at @TheSeaport from 12-8pm, 19 Fulton Street!	1439906413	633639540515717122	f	milktrucknyc
RT @nycfoodtruck: A @Prospect_Park Food Truck Rally is really all you need to have a great Sunday - We'll see you soon! http://t.co/MuD5fF3...	1439733071	632912491794812928	f	milktrucknyc
Markets today! We're at @smorgasburg in williamsburg, 11-6pm and Ft. Greene Flea from 10-5.	1439647204	632552339996438529	f	milktrucknyc
@yi_tweets wall st. and seaport.	1439564848	632206914575843329	f	milktrucknyc
Bessie is back in action! Truck is at Wall St/William St for lunch. Call 646-504-6455 to preorder. Kiosk at @TheSeaport also open all day!	1439560811	632189978764701696	f	milktrucknyc
lunch at Milk Truck HQ! BLT  https://t.co/Xe1jQg1LIE	1439495732	631917019378675717	f	milktrucknyc
The truck is closed for maintenance today, but sandwiches and other goodies always at @TheSeaport and @houstonhallnyc! All day.	1439474414	631827603796549632	f	milktrucknyc
Good morning! Our station is at Pier 5 @smorgasburg today and our @TheSeaport kiosk open all day as always. Post your pics! milktrucknyc	1439128808	630378026476269570	f	milktrucknyc
See The Subway Lines Visualized Over Aerial Photos Of NYC http://t.co/kvPXJlpZl3 via @gothamist http://t.co/q8eO1ByIdV	1440795030	637366668096860161	f	souvlakitruck
RT @randomfoodtruck: Friday lineup! @CamionNYC @CarpeDonutNYC @carlssteaks @Chefsamirtruck @gcnyc1 @souvlakitruck	1440778657	637297996070318080	f	souvlakitruck
RT @ScoutologyBosMA: Vote Now For The Best Food Truck In NYC! @ScoutologyNYC @waffletruck @PolishCuisine @TaimMobile @souvlakitruck \n\nhttp...	1440777037	637291203613040640	f	souvlakitruck
@berddistheword Were on Varick/Charlton today with a little taste of Mykonos @HudsonSquareNYC	1440691410	636932055213977600	f	souvlakitruck
Gotta love Greek Frappes! | Here's How The Rest Of The World Drinks Coffee http://t.co/7pfE5WPAZy via @huffposttaste http://t.co/VKYFT9Qnlq	1440687336	636914968428982273	f	souvlakitruck
How Millennials Are Eating Differently From Their Parents http://t.co/bhpmnAHBRk via @huffposttaste http://t.co/LMh00rj9i0	1440615342	636613005749432320	f	souvlakitruck
RT @randomfoodtruck: Fun in the sun with @souvlakitruck and @PapayaKingTruck	1440610075	636590913129738240	f	souvlakitruck
What is a Farmers Market Like in Tripoli, Greece? | @GreekReporter http://t.co/Oz38AnUf1p http://t.co/nzlUWvDszU	1440532242	636264456440414208	f	souvlakitruck
@pattoo2 So sorry to hear about that! Can you please DM us more info?	1440441756	635884932330582016	f	souvlakitruck
RT @Darrenpress: @souvlakitruck amazing!! Perfct flavorful sauce, veggies not soft & seasoned potato strips inside genius. foodtruck http:...	1440441469	635883729706188801	f	souvlakitruck
If you think we're the Best Food Truck in NYC, please vote for us! http://t.co/H0iSPthNZL @ScoutologyNYC http://t.co/6Ow2WRBBLU	1440269439	635162180497838080	f	souvlakitruck
Please vote for us to win the NYC Food Truck Fight! http://t.co/NXNn7U9fsF @ScoutologyNYC http://t.co/zV9OZL5hnX	1440095110	634430991550054402	f	souvlakitruck
Vote for us to advance to the next round! @ScoutologyNYC's Food Truck Fight: http://t.co/jSk5lenZme http://t.co/BkNUKz2c3l	1440022814	634127761494396928	f	souvlakitruck
How cool is this! | Famous Landscapes, Re-Created With Processed Foods via @FoodRepublic http://t.co/12G5inQlMU http://t.co/2msNTLFagU	1440013233	634087575431548928	f	souvlakitruck
RT @ScoutologyNYC: Vote For Your Favorite NYC Food Truck! @Scoutology @TaimMobile @KorillaBBQ @mamuthainoodle @souvlakitruck \n\nhttp://t.co...	1439998290	634024899993038848	f	souvlakitruck
The Ultimate New York City Bagel Glossary by @EaterNY: http://t.co/QruKtYJUPZ http://t.co/mwIXHrav4u	1439914241	633672373250732032	f	souvlakitruck
How to Peel an Onion in 8 Seconds http://t.co/lJc27RguuW via @TheDailyMeal http://t.co/jpMSQHL45I	1439842168	633370076285153280	f	souvlakitruck
RT @GreekReporter: Greeks Are Europes Eighth Highest Wine Consumers http://t.co/OZDwQ3Kaj3 Greece	1439769799	633066540460470274	f	souvlakitruck
See The New Brooklyn Bridge Park Sections on @Gothamist  http://t.co/UHBtspsrDC http://t.co/tjLUZWlb5r	1439671812	632655552879951872	f	souvlakitruck
Greek Summers: 6 Ideas for 6 Islands http://t.co/3L8AhQtkx7 by @GreekReporter http://t.co/Duel8oTsUr	1439574028	632245416122273792	f	souvlakitruck
We meant southwest corner and 53rd St.	1440765506	637242835398459392	f	etravaganza
Happy Friday!\ndon't miss out your favorite breakfast.\nToday we've been relocated we are at northwest corner of 53rd and Park.	1440762880	637231823303671808	f	etravaganza
The Cajun chicken,sizzling to be served over a healthy salad or or a pasty quesadilla,join us for more .\nthe truck is at 52nd and park.	1439998400	634025362326974464	f	etravaganza
Lunch is served.\njoin us at 52nd and Park.\nhappy Monday!!	1439221962	630768742893490176	f	etravaganza
Don't miss out your most important meal of the day.\nCall us for express pick up 917-657-0987	1438777687	628905319998038017	f	etravaganza
Godo Morning!\nBack to reality, 52nd and Park its location.	1438610518	628204163856506880	f	etravaganza
G.morning\nA hot one today!\nGet your fave breakfast sandwich accompanied with a fresh brewed iced coffee.\nWe are @ 52&park.	1438086818	626007606990106625	f	etravaganza
Oh!\nNot the movie..the three amigos wrap lol	1437579645	623880369465610240	f	etravaganza
Someone please explain me why three amigosis so popular?	1437579558	623880002535325697	f	etravaganza
GM again..!! It's taco Tuesday.\nlet's start with our delicious egg breakfast tacos.\nThe truck it's located at NE corner 52nd and Park Avenue	1436879209	620942527013761024	f	etravaganza
GM..!join us for a delicious breakfast taco and a freshly brewed iced coffee..it will hit the spot..!!	1436358066	618756692386426880	f	etravaganza
Rise&shine NYC have you tried our tasty protein wrap?\nThree farm fresh egg whites,chicken& cheese on a whole wheat wrap or omelette.	1436271771	618394748500488192	f	etravaganza
RT @nycfoodtruck: Win tickets @VendyAwards! Snap a pic of ur fav streetfood & tag w/ VendyCitizenJudge. Details: http://t.co/5HEkx7Dk6Q	1436219554	618175731563110401	f	etravaganza
Back to reality..!!happy Monday.\nbreakfast is served.	1436186194	618035808944136193	f	etravaganza
RT @biggayicecream: Hey NYC- happy pride! http://t.co/9Rb5SRMtsn	1435506048	615183070702927872	f	etravaganza
Thank you folks for your support!!\nIt has been a nice week.\nFor now!\ntime to wrap up,have a rest and nice weekend.\nSee you Monday.	1435347384	614517586089349121	f	etravaganza
Almost Friday!\nJoin us for a tasty tacos, Burritos, quesadillas,salad Bowls and More. Begins at 11:43	1435258188	614143473269256193	f	etravaganza
Have you tried our tasty Salad Bowls!!	1435073206	613367601503281152	f	etravaganza
Happy Friday we located on 52nd and Park Avenue.\nthree amigos wrap demand..!!join us.	1434725530	611909343349485568	f	etravaganza
In case you've missed out your breakfast tacos?do not worry!We will continue serving till 2 PM.\nlunch Begins...NOW!!	1434469605	610835914693181440	f	etravaganza
RT @explorebrooklyn: Food trucks in Brooklyn, part two: @TheTreatsTruck, @mausamnyc, @PhilsSteaks, and more http://t.co/BCKnDjTRjr eat htt...	1440690753	636929302311895040	f	mausamnyc
RT @dumbolot: Thursdays with @ToumNYC @MexicoBlvd and @mausamnyc!	1440683605	636899318105014274	f	mausamnyc
Curry Rush Thursday @dumbolot don't miss out on savory flavors http://t.co/4mjKah9jVe	1440679312	636881311819517953	f	mausamnyc
@midtownlunch 47 Street between Park & Lexington. Savory curries and bites. http://t.co/TWzOpkkw5O	1440506581	636156827961569281	f	mausamnyc
Thanks to @GovIslandFood and  @livefastgroup we'll be vending on @Gov_Island all summer http://t.co/vM6sou0Xjv	1440333201	635429616883232768	f	mausamnyc
Don't know where to spend the day with family & friends? Lots to enjoy @GovIslandFood http://t.co/Qd4UHTKqhI	1440332914	635428413684191232	f	mausamnyc
Thanks to @GovIslandFood and  @livefastgroup we'll be vending on @Gov_Island all summer http://t.co/fl5RWV0bi4	1440244989	635059630838841344	f	mausamnyc
Curry Thursday @dumbolot  savory authentic Indian spices & flavors http://t.co/aNeMbpxTOu	1440080125	634368140756000768	f	mausamnyc
@midtownlunch 47 Street between Park & Lexington Avenue.\nSavory Indian flavors http://t.co/gCLCHciqQx	1439908392	633647840309456896	f	mausamnyc
We're here! Great weekend\n Thanks to @GovIslandFood and  @livefastgroup we'll be vending on @Gov_Island all summer http://t.co/brx6WtgwZp	1439642210	632531390886768640	f	mausamnyc
RT @randomfoodtruck: Happy Friday! What to choose? @CamionNYC @gcnyc1 @CarpeDonutNYC @mausamnyc @Chefsamirtruck @carlssteaks	1439566594	632214235523719169	f	mausamnyc
Happy Friday 55 Street on Broadway @midtownlunch \nGet your favorite Indian flavor and bites http://t.co/pazTzix7vg	1439556545	632172088846090240	f	mausamnyc
Dinner on the Pier @Rooseveltisland 5-8 pm http://t.co/SrUYEbwnCg	1439493165	631906252076003328	f	mausamnyc
RT @dumbolot: Catch @ToumNYC @MexicoBlvd and @mausamnyc in the lot today!	1439478786	631845941730013184	f	mausamnyc
Curry Rush Thursday @dumbolot many savory flavors & authentic bites samosas/Kati rolls much more http://t.co/bHLiO5tPkI	1439468208	631801574965268482	f	mausamnyc
RT @mickgirl609: Beautiful night on Roosevelt Island rooseveltislander livinNYC http://t.co/ycT5KmJChH	1439409531	631555467639156737	f	mausamnyc
@Rooseveltisland on this beautiful evening. Get your dinner on the way home or enjoy the waterfront. http://t.co/7EuNj539db	1439409020	631553321606742016	f	mausamnyc
RT @BLDG92: Feeling famished need lunch in a hurry, BNYFoodTruck of the day is @mausamnyc curry! BLDG92 NYC @BklynNavyYard http://t.co/...	1439396657	631501468944723968	f	mausamnyc
RT @BLDG92: @mausamnyc is a must for lunch today! bnyfoodtruck	1439396626	631501339093278721	f	mausamnyc
We will all return from our temporary closing next week @myEZBZ	1440512955	636183563117961216	f	kettlecornnyc
http://t.co/57Rg698kjj	1439986015	633973415930687488	f	kettlecornnyc
http://t.co/hjjsCblPxv	1439898528	633606468839809024	f	kettlecornnyc
Good Morning \nWe will be temporarily closing for the rest of this month. Online orders and truck locations will resume in September.	1439814415	633253672613486592	f	kettlecornnyc
Come stock up on your kettle corn today. We will be temporarily closing for the rest of this month. Online orders... http://t.co/yWIjcEbtK2	1439755727	633007516448899072	f	kettlecornnyc
@HiFiGuy197 I'm sorry	1439750184	632984266750734337	f	kettlecornnyc
Come stock up on your kettle corn today. We will be temporarily closing for the rest of this month. Online orders... http://t.co/VsOXCn2HqH	1439735724	632923618801004544	f	kettlecornnyc
cdrewster's video https://t.co/94LkbrkMQ8	1439677484	632679340359159808	f	kettlecornnyc
http://t.co/SiZFDwaCBd	1439674036	632664881796354048	f	kettlecornnyc
Come Join Us In Queens\nWe're Located At \nForest Hills Queens \nUntil 8:30 PM\n kettlecornnyc http://t.co/0UIULM4Anz	1439672605	632658877591502848	f	kettlecornnyc
Don't forget to pick up your \n       KETTLE CORN \n      We're Located At \n     Forest Hills Queens... http://t.co/UbgTGS6xQT	1439663545	632620879432781825	f	kettlecornnyc
GOOD MORNING QUEENS \nWe're located at \nForest Hills Queens \nUntil 8:00 pm \nSee you there \nkettlecornnyc http://t.co/8ZCCOsrP20	1439651774	632571508901212160	f	kettlecornnyc
Hello New Yorkers \nDon't Forget Your Kettle Corn  \nWe're located at \n86th and Lexington Avenue  \nUntil 8:30 pm... http://t.co/9q3ozsRwJX	1439593730	632328051834159104	f	kettlecornnyc
GOOD EVENING \nUPPER EAST SIDE \nWe're located at \n86th and Lexington Avenue  \nUntil 8:30 pm \nkettlecornnyc http://t.co/7MIzZwQWKW	1439587879	632303512840441857	f	kettlecornnyc
HAPPY FRIDAY NEW YORKERS \nWe're located at \n45th Street \nBetween 5th and 6th Avenue \nUntil 3:30 pm \nSee you soon... http://t.co/JGh3v7P4au	1439569042	632224504333369345	f	kettlecornnyc
Good evening NYC \nWe relocated to \n81st and Amsterdam \nUntil 8:30 pm http://t.co/oCAw7W7K7O	1439498387	631928156010774528	f	kettlecornnyc
RT @HiFiGuy197: First on the @kettlecornnyc scene! http://t.co/5UJXChsxBx	1439479015	631846901613240320	f	kettlecornnyc
Good Afternoon NYC \nWe're located at \n45th Street \nBetween 5th and 6th avenue \nUntil 3:30 pm \nkettlecornnyc http://t.co/HlfDh0s6fA	1439478921	631846507940061185	f	kettlecornnyc
@kkptwit I'm so happy that you have been a fan for so long. We are closed today but we will be back out tomorrow afternoon. See you soon.	1439383545	631446472626688001	f	kettlecornnyc
@kkptwit I'm so sorry the confusion, On the website under Festival Schedule is where you'll find our weekly schedule.	1439383349	631445651906281472	f	kettlecornnyc
Bianca with tomatos and olives Add toppings to any of our pizzas!  pizzaoftheday neaex... http://t.co/xEZjmcwGj8 http://t.co/f4u0pOmXHj	1440105100	634472892277891073	f	neaexpress
Our in house artist @szwiebel finishing one of @wondergiulio's creations neaexpress neap... http://t.co/v0f1l25Ehl http://t.co/8NT2VuI0oB	1440089532	634407596351488000	f	neaexpress
@wondergiulio doing a little experimenting in the kitchen today pizzacreations pizzaofth... http://t.co/9r8R9TCYtO http://t.co/4hQk48bksC	1440008909	634069439231709184	f	neaexpress
Pizza with a spicy kick diavolo pizza to make it through hump day neaexpress nonGMO o... http://t.co/hPPBqq2Pmj http://t.co/MN58rXR4lJ	1440001468	634038228606029824	f	neaexpress
Find us at @dumbolot today for some authentic neapolitan pizza foodtruck	1439997103	634019921186418688	f	neaexpress
Mmmm it's nutellapizza time neaexpress neapolitanexpress NewForkCity nonGMO organic http://t.co/N7bHjQ1Xni http://t.co/19bUFUGzaH	1439953838	633838456880406532	f	neaexpress
For all the meat lovers out there salsiccia pepperoni prosciutto panuozzo neaexpress ... http://t.co/wKuaWxNbBw http://t.co/v5spE80HTu	1439918676	633690976968646657	f	neaexpress
Meaty moments neaexpress neapolitanexpress NYC organic nonGMO salsiccia WallStreet http://t.co/LPgBsBeSWx http://t.co/k8l4in8Wdb	1439918297	633689386824171521	f	neaexpress
It's finally lunchtime reclaimyourlunchbreak	1439914394	633673014777937920	f	neaexpress
A peaceful start to lunch, thanks to Sharon Suh neaexpress Harlem NYC neapolitanexpres... http://t.co/DTTPZprVRm http://t.co/lJxamQWQ59	1439826134	633302824579899392	f	neaexpress
What a truffletastic pizza Add fresh black Urbani Truffles to any of our pizzas neaexp... http://t.co/mvKuAh0sL4 http://t.co/eWaEbMtaai	1439656198	632590063071797248	f	neaexpress
We have latenight tonight! Stop by Whythe and 11th street for your nightslice in Williamsburg	1439602210	632363619443851264	f	neaexpress
Hello lunchtime rush! neaexpress neapolitanexpress organic nonGMO WallStreet http://t.co/wytdBwti5L http://t.co/bPu4BKRazu	1439575525	632251696882827264	f	neaexpress
Start off the weekend with some fresh organic nonGMO pizza from our cleanenergy foodtruck at 99th and Madison	1439568996	632224311869329408	f	neaexpress
@HedgeFunNY we would love to be there! Send us an email at socialmedia@neapolitanexpress.com	1439560529	632188796948381696	f	neaexpress
Finally that time of the week again nightslice in Williamsburg from 11pm-5am	1439514022	631993734230503426	f	neaexpress
Stop by our EastHarlem or WallStreet location for some delicious NeapolitanPizza	1439479862	631850455874838528	f	neaexpress
We hope this isn't too cheesy for lunch Join us for lunch at EastHarlem and WallStreet ... http://t.co/rcaIxS2Tq2 http://t.co/ArFbtujimQ	1439479778	631850101623922688	f	neaexpress
Way to go @ConcreteSafaris for helping with this month's basil at eastharlem organic nonGMO freshbasilfreshpizza http://t.co/JTtXTfeTX5	1439405943	631540416580558848	f	neaexpress
RT @FransmartKris: 6 Fantastic Food Trucks In Asbury Park \n http://t.co/W9gu1ziZEl @NeaExpress	1439405734	631539541061595136	f	neaexpress
On east 54th between 2nd and third from 6 to 11 pm come on by. Better than ever!!!	1439939979	633780327887020032	f	grillonwheelsny
EVENTS EVENTS EVENTS!!!! SO MANY EVENTS!!! NOT SURE WHEN WE WILL GET BACK ON THE STREETS! WE HOPE TO SEE YOU SOON!!	1439234024	630819334923911168	f	grillonwheelsny
HEY ALTHOUGH WE MISS BEING OUT ON THE STREET WITH OUR AMAZING CUSTOMERS WE HAVE THANK GOD BEEN REALLY BUSY AT PRIVATE EVENTS!!! MISSING YOU!	1438877626	629324493907980288	f	grillonwheelsny
Happy Monday!! Special Private Event Today!!!! Hopefully we'll get back to the streets with our loyal amazing customers soon!!!	1438614193	628219577097408512	f	grillonwheelsny
Happy Monday All!! We are back but we are gonna be upstate for the next 3 days See u on Thursday Be Ezrat Hashem!!!	1438007781	625676101210230784	f	grillonwheelsny
Good Morning Dearest Customers! So sorry to say that we are gonna be closed for the 9 days we hope to see you guys again next week!!	1437402087	623135637554753536	f	grillonwheelsny
TGIF!!! We are closed today due to a private event!! Shabbat Shalom!!	1437143196	622049766378242048	f	grillonwheelsny
GOOD MORNING NYC WHAT A BEAUTIFUL DAY TO GO OUT AND GET LUNCH AT HANOVER SQUARE!!!	1437058212	621693320557953024	f	grillonwheelsny
http://t.co/120K8HZcVa order online easiest way to stay as dry as possible	1436975705	621347259913998336	f	grillonwheelsny
@TheRealEvanS depends how far you can call and ask	1436972794	621335049552703488	f	grillonwheelsny
We know it may not be comfortable coming out if it rains but we got a great solution for you guys order online http://t.co/120K8HZcVa	1436971235	621328509978451970	f	grillonwheelsny
Happy Wednesday Everybody!!! The weather is not great but the enticing smell wafting from Hanover Square makes it all seem so much better!!!	1436970326	621324696978616320	f	grillonwheelsny
Tuesday is here and the skies are not exactly clear but at least there is good food at 46th street and 6th ave!! Hope to see u there!!	1436883492	620960491247116288	f	grillonwheelsny
@Martin_B_R there's an issue of parking and planning ahead I will definitely bring it up to my boss though thank you for the suggestion	1436883413	620960161163800576	f	grillonwheelsny
Happy National French Fries Day!!! Today we are at 46th street and 6th ave. Come on down and pick up some french fries with your order!!	1436797463	620599657975164928	f	grillonwheelsny
TGIF!!!! WE ARE AT HANOVER SQUARE TODAY!! SEE U THERE!! SHABBAT SHALOM!!	1436538910	619515209921789952	f	grillonwheelsny
46th and 6th ave today!! Hope to see you all there!!	1436458052	619176066284953600	f	grillonwheelsny
Happy Thursday Everyone!!! Today we are at 46th street and 6th ave!!	1436451106	619146933605650432	f	grillonwheelsny
Hey guys we are in HANOVER SQUARE today!!! Hope to see you there!!	1436373671	618822145217556480	f	grillonwheelsny
@vbguru  unfortunately as much as we try there is no where to park in bk if you can help with that please do, I am so sorry!!	1436368783	618801642587209729	f	grillonwheelsny
47th bw Park & Lexington....open and ready to roll! MidtownEast lunch midtown nyc pierogitime	1440773846	637277819957940225	f	polishcuisine
Happy friday! find us on 47th bw Park & Lexington midtown lunch	1440764332	637237914171125760	f	polishcuisine
oldtraditionalpolishcuisine lunch http://t.co/5Do7zVnTj0	1440756376	637204543604846593	f	polishcuisine
Top 3 International Food Trucks NYC as per Kitchen24 Amsterdam...find us at 7:41 (link below) NYC Food Trucks... http://t.co/38GfVBaOwd	1440722264	637061465615269888	f	polishcuisine
52nd bw 6th & 7th (closer to 6th)	1440694436	636944749765656577	f	polishcuisine
traditional Thursday on 52nd bw 6th & 7th Midtown lunch nyc	1440677416	636873362929786880	f	polishcuisine
47th bw Park & Lexington open at 11!!!  nyc PolishTruck midtown pierogitime	1440593877	636522971134361600	f	polishcuisine
47th bw Park & Lexington Wednesday midtown lunch nyc	1440591977	636515001998553088	f	polishcuisine
pierogi lunch http://t.co/dyU52Il1BH	1440590749	636509852660035584	f	polishcuisine
kielbasa http://t.co/kJq1wECN8p	1440590602	636509235371622402	f	polishcuisine
oldtraditionalpolishcuisine lunch http://t.co/kVLE7usr0G	1440587621	636496732432433152	f	polishcuisine
Find us on 52nd bw 6th & 7th (closer to 6th) midtown lunch pierogitime	1440516346	636197783083454468	f	polishcuisine
52nd bw 6th & 7th today midtown lunch nyc PolishTruck	1440504754	636149165303558144	f	polishcuisine
lunch pierogi http://t.co/1AX9D9n7Ix	1440504561	636148356239261696	f	polishcuisine
I posted a new photo to Facebook http://t.co/OJrhdNlWsb	1440504470	636147971860488192	f	polishcuisine
lunch http://t.co/XJAEWJtDQd	1440504385	636147618054320128	f	polishcuisine
Find us on Old Slip bw Front & Water downtown lunch nyc FinancialDistrict	1440430091	635836002867802112	f	polishcuisine
lunch http://t.co/ALqGvRRYP7	1440422210	635802948879163392	f	polishcuisine
I posted a new photo to Facebook http://t.co/rnbtQLWKhH	1440421999	635802065265004544	f	polishcuisine
Old slip bw Front & Water Monday downtown lunch nyc FinancialDistrict	1440419806	635792865323409408	f	polishcuisine
Good morning we are open at 47 th st btween park and lex ave. try our korean BBQ beef(galbi)pork, shrimp. And spicy chicken bowl as well thx	1440603687	636564121278881792	f	bobjotruck
Good morning we r open at water and hanover sq. try our korean BBQ beef pork shrimp and we Hav also burritos and spicy chicken rice bowl thx	1440517754	636203689603133440	f	bobjotruck
Good morning !! We r open at king and Hudson ! Try our korean BBQ:galbi,pork,shrimp and we have also bbq burritos. Come by and enjoy thanx	1440084240	634385400493154304	f	bobjotruck
Welcome Monday ! We r open@king and Hudson at. Try our korean BBQ galbi,pork,chicken plZ stop by and enjoy thank you	1439825773	633301312889835520	f	bobjotruck
Welcome friday we t open @47th st. Btween park and lex ave. try our korean BBQ beef pork shrimp please come by and enjoy.	1439567098	632216349260029952	f	bobjotruck
Hello NYC we r open @ king and Hudson st. Try our korean BBQ beef pork shrimp and burritos and we have also spicy chicken rice bowl. Thx!!	1439478971	631846718863224833	f	bobjotruck
Good morning nyc we r open at 47th st btween park and lex ave! Thank you	1439395101	631494943199096832	f	bobjotruck
Welcome Monday!! We r open at king and Hudson st. Try out Korean BBQ-beef,pork,shrimp . And we have also tofu,dumpling 4 vegetarian	1439222334	630770304856530944	f	bobjotruck
Welcome Friday! We are open and reday to serve at 47th st. Btween park and lex ave . Try our world best koean BBQ !! -bed pork shrimp !Thanx	1438962801	629681743642144768	f	bobjotruck
Hello NYC! We are ready to serve at 47th st. Btween park and lex ave. Try our world best Korean BBQ ! -Beef(GALBI) pork shrimp thank you	1438184905	626419014231805953	f	bobjotruck
Welcome Monday !! We are open @ king and Hudson . Try our korean BBQ beef(galbi)pork shrimp . And we Hav also chicken rice bowl and burritos	1438012063	625694061396119552	f	bobjotruck
Welcome Friday! We r open @ 47th st. Btween park and lex try our world best korean BBQ!! PlZ stop by an enjoy thank you!!!!	1437753693	624610379637764096	f	bobjotruck
Good morning. We r open at 47th st. Btween park and lex avenue!! PlZ come by and enjoy our world best korean BBQ ! Thank you	1437580583	623884300258291712	f	bobjotruck
Hello NYC ! We r open at 47th btween park and lex ave. try our korean BBQ galbi(beef) pork shrimp and bbq burrito as well plZ stop by enjoy	1437492865	623516386032226304	f	bobjotruck
Hello nyc we r open at king and Hudson try our korean BBQ beef(galbi)pork chicken !! PlZ stop by and enjoy	1437408085	623160795082420224	f	bobjotruck
Hello nyc we r open at 47th st. Between park ave. and Lexington ave. try our KOREAN BBQ beef, pork, shrimp  thank you very much	1436887762	620978398945521664	f	bobjotruck
Tfx gigs sbzv. Vv. vegetable	1436371192	618811747286282240	f	bobjotruck
Sunshine nyc we r open at 47th at between park and lex ave. try our world best korean BBQ(galbi,pork,shrimp) and burrito as well thank you	1436282902	618441434266529792	f	bobjotruck
Good morning nyc !! We r ready to serve at 47th st. Btween park and lex Ave. try our korean bbq beef pork and shrimp. PlZ stop by thanx	1435850648	616628428247289856	f	bobjotruck
Good morning nyc !! We r open at 47th st. Btween park and lex ave. try our korean BBQ beef,pork,shrimp !! PlZ stop by and enjoy Thx !!	1435592427	615545370697969664	f	bobjotruck
GOODMORNING BRONX NY! \nTGIF TODAY FRIDAY AUGUST 28TH\n(we are open for Lunch and dinner 12pm-11pm)\nMI... https://t.co/hPgNML7EWm	1440774650	637281192098840576	f	latinkitchennyc
THE 1 WEDNESDAY PARTY!!!!\nAFTERWORK WEDNESDAYS \n At doncoquicityisland \n565 CITY ISLAND AVE. BX... https://t.co/8AU74f058n	1440604671	636568245554802689	f	latinkitchennyc
Just posted a photo https://t.co/0hrRPS8gnM	1440602516	636559209379799040	f	latinkitchennyc
GOODMORNING BRONX NY! \nTODAY HUMPDAY WEDNESDAY AUG.26TH\nwe are open for lunch and dinner 12pm-9pm\nMI... https://t.co/azALmQYPpb	1440599122	636544972355973120	f	latinkitchennyc
Just posted a photo https://t.co/h0FAPRGweH	1440440191	635878366613250048	f	latinkitchennyc
Just posted a photo https://t.co/rNIqrnkSbQ	1440390993	635672014615891969	f	latinkitchennyc
GOODMORNING BRONX NY! \nHAPPY SUNDAY...\nTODAY AUGUST 23RD\nWE ARE OPEN FOR LATE LUNCH & DINNER... https://t.co/9Ev2XnIVru	1440348428	635493483810304002	f	latinkitchennyc
ZOO STATUS\nfoxwoodsresortcasino\nthecommissionpresents \nREUNION EXPIERIENCE \nDJ LUCHO LIVE \nTHIS IS... https://t.co/TsZeSBCyA1	1440293896	635264759881986051	f	latinkitchennyc
OPEN TODAY SATURDAY AUGUST 22ND TILL 11PM\nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX NY... https://t.co/W3hYHhnIXH	1440286682	635234505914195968	f	latinkitchennyc
2NITE  8PM\nthecommissionpresents \nTHE REUNION TOUR\nMASE/THE L.O.X/TOTAL/MARIO WINANS/ 112\nDJ LUCHO... https://t.co/EPBw6d7KQH	1440281600	635213186715807745	f	latinkitchennyc
AND ABOUT LAST NIGHT....\nCOLOMBIA QUE VIVA!!!\nfoxwoodsresortcasino \nJuanes AFTERPARTY!!! @ Foxwoods... https://t.co/awiy5eSI0k	1440278201	635198930259701761	f	latinkitchennyc
TONIGHT!!\nMASE, 112, MARIO WINANS, TOTAL, THE L.O.X\nDJ LUCHO LIVE\nfoxwoodsresortcasino \nSHOWTIME 8PM... https://t.co/1HwDdXaLjB	1440276122	635190214210813952	f	latinkitchennyc
CONNETICUT WE ABOUT TO  GET IT POPPIN..\nFOXWOODS CONNECTICUT OK LOUNGE\nJUANES AFTERPARTY! !! https://t.co/gd8zaDFAPi	1440211591	634919550232985601	f	latinkitchennyc
BRONX NY!!!\nopen today Friday Aug.21st till 11pm\nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX NY... https://t.co/ofTKmeJBp5	1440198076	634862862008233984	f	latinkitchennyc
CONNETICUT CATCH ME THIS WEEKEND FRIDAY & SATURDAY \nfoxwoodsresortcasino !!\nFri JUANES\nsat 112 .... https://t.co/AGyUl98Jxn	1440124284	634553358792138752	f	latinkitchennyc
Just posted a photo https://t.co/77JRfnPU56	1440096686	634437603937394688	f	latinkitchennyc
GOODMORNING BRONX NY! !!\nIT'S THURSDAY AUGUST 20TH\n(we are open for lunch and dinner 12pm-10pm)\nMI... https://t.co/EJkUeVKXnM	1440086171	634393500411404288	f	latinkitchennyc
THIS SATURDAY !!! CONNECTICUT,  BOSTON, MASSACHUSETTS,  NEW YORK ...YOU READY???\nWE AT FOXWOODS... https://t.co/ARIDeRuoaB	1440008970	634069693658230784	f	latinkitchennyc
1 Party on a Wednesday! !!\nDON COQUI CITY ISLAND\n565 CITY ISLAND AVE. BX NY\nAFTERWORK WEDNESDAYS... https://t.co/OIIf7larH5	1440007642	634064124692037632	f	latinkitchennyc
GOODMORNING BRONX NY! \nTODAY WEDNESDAY AUGUST 19TH (we are open for lunch & dinner from 12pm9pm)\nMI... https://t.co/MdFtyJJzhN	1440002388	634042087466500096	f	latinkitchennyc
Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE SPICY JAZZ preorder 9172929226 fidi	1440768335	637254702971899904	f	fritesnmeats
Hello Brooklyn! Lunch 2day @ front & jay st. Burger of the week THE SPICY JAZZ preorder 9172929226 dumbo @DUMBOFoodTrucks	1440683151	636897416407576578	f	fritesnmeats
Great news! Fritesnmeats restaurant/bar coming soon to williamsburg brooklyn stay in touch for updates. retweet http://t.co/GI2LWbKNDz	1440596155	636532528007020544	f	fritesnmeats
Lunch 2day @ Hudson & king st. Burger of the week THE SPICY JAZZ preorder 9172929226 soho	1440595855	636531267589246977	f	fritesnmeats
Great news! Fritesnmeats restaurant/bar coming soon to williamsburg brooklyn stay in touch with updates. retweet http://t.co/dLjq4KKQWK	1440509488	636169018265739264	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE SPICY JAZZ. Preorder 9172929226 fidi	1440508765	636165987361009664	f	fritesnmeats
@fritesnmeats Restaurant ComingSoon to 483GrandStreet  Goodnight Peeps!	1440468920	635998866677104640	f	fritesnmeats
483GrandStreet, Brooklyn, NY Brooklyn SettingUpShop FritesnmeatsRestaurant	1440468849	635998569569361920	f	fritesnmeats
What's going on peeps!  Check out our blog at http://t.co/K91NxR8o88 for some CoolNews	1440468774	635998253247541253	f	fritesnmeats
Peeps we are off the road 2day.	1440423078	635806590982049792	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE MARITAL BLISS. Preorder 9172929226 fidi	1440163700	634718678769123328	f	fritesnmeats
Hello Brooklyn, Lunch 2day @ front & jay st. Burger of the week THE MARITAL BLISS. Preorder 9172929226 dumbo @DUMBOFoodTrucks	1440078745	634362351056199680	f	fritesnmeats
Lunch 2day @ Hudson & king st. Burger of the week THE MARITAL BLISS preorder 9172929226 soho	1439991162	633995004428599296	f	fritesnmeats
Lunch 2day @ 10 Hanover sq b/t water & pearl st. Burger of the week THE MARITAL BLISS preorder 9172929226 fidi	1439906451	633639700734025728	f	fritesnmeats
Lunch 2day @ 50th st b/t 6th & 7th av. Burger of the week THE MARITAL BLISS. Preorder 9172929226 midtown	1439818389	633270341981372416	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE MARITAL BLISS. Preorder 9172929226 fidi	1439560476	632188576978075648	f	fritesnmeats
Peeps we are off the road today	1439475192	631830867896324096	f	fritesnmeats
Peeps, we r off the road today	1439387884	631464670193451008	f	fritesnmeats
Peeps, we r off the road today	1439300485	631098094139113473	f	fritesnmeats
Lunch 2day @ 50th st b/t 6th & 7th av. Burger of the week THE MARITAL BLISS preorder 9172929226 midtown	1439214585	630737804549599232	f	fritesnmeats
Tweet us a pic of your best tennis pose in front of the truck today and we will double your salad free! USOpen2015 http://t.co/qGWMSzth4f	1440775395	637284314535829504	f	sweetchilinyc
TGIF we are @DumboLot jay & water 1130-3pm today and we wont be back till sept 11th! thaietnamese	1440772201	637270919162032130	f	sweetchilinyc
http://t.co/GBtlCioPZc USOpen2015 thaietnamese http://t.co/ZsAXRnJsVg	1440716400	637036874012459009	f	sweetchilinyc
@Blitz5 yes in a few weeks!	1440691535	636932579585851392	f	sweetchilinyc
@BMP326 yes!!	1440691519	636932512980275200	f	sweetchilinyc
No truck today. Getting ready for the @usopen media tasting!	1440690072	636926442509627392	f	sweetchilinyc
humpdaymotivation we are on broadway btw Houston & Bleeker 1130-3! thaietnamese lunchtime hungry topchef foodtruck	1440603723	636564269014847488	f	sweetchilinyc
Let's go @dumbolot jay & water 1130-3! porkbelly friedegg sriracha fries topchef thaietnamese bacon sun	1440516738	636199427313635329	f	sweetchilinyc
@Junghwee2010 thanks!!!!!!	1440445067	635898819788566528	f	sweetchilinyc
RT @Junghwee2010: @SweetChiliNYC I just totally fell in love with your food since the Afropunk the sweet chilli pork belly was the best!!!	1440445067	635898818240880640	f	sweetchilinyc
HappyMonday we are in a new spot on 33rd btw 8 & 9 th ave 1130 till 3pm today! thaietnamese mondaymotivation	1440423878	635809947406745600	f	sweetchilinyc
Back @afropunk all day! Great music and great food! thaietnamese Sunday	1440349018	635495960349704192	f	sweetchilinyc
RT @GrandMarnierUSA: Our Sunday BlendOut for AfroPunk = @Thundercat + @MissChelove + @SweetChiliNYC. What's yours?	1440348872	635495348040003585	f	sweetchilinyc
Let's go! @afropunk all day today and tomorrow! thaietnamese hopscotch https://t.co/oMqdIUBENM	1440263566	635137549921583105	f	sweetchilinyc
Catch us today outside the United nations on 45th & 1st 1130-3! thaietnamese lunchtime	1440169372	634742468710412289	f	sweetchilinyc
Let's do lunch on old slip & water 1130-3 today! pre order http://t.co/6nkTKLphud to skip the line! thaietnamese lunch eatoutside spicy	1440083341	634381631516725248	f	sweetchilinyc
Where will you be this weekend? @afropunk with us of course! foodtrucks thaietnamese music Weekend plans	1440024461	634134668217073664	f	sweetchilinyc
HumpDay inspiration? Come to broadway btw Houston & Bleeker till 3! thaietnamese lunchtime hungry yum foodtruck NYC eat	1439998215	634024585801940993	f	sweetchilinyc
Come get your sweet heat on @dumbolot jay & water 1130-3! pre order http://t.co/6nkTKLphud skip the line! thaietnamese lunch eatoutside	1439910416	633656329861734400	f	sweetchilinyc
RT @dumbolot: Tuesday again with @SweetChiliNYC @carlssteaks and @KimchiTruck!	1439906414	633639544332644352	f	sweetchilinyc
Hey guys we will be on 52nd & 6th ave.	1440774327	637279834641707008	f	schnitznthings
Hey Schnitzlers we will be on 26th st. Starrett Bldg	1440691964	636934381941223424	f	schnitznthings
The Schnitzel Truck will be on 47th & Park	1440603470	636563210188013568	f	schnitznthings
Schnitzel for Lunch!  We will be on 52nd & 6th ave.	1440516736	636199419545784320	f	schnitznthings
Hey guys, stop by have some Schnitzel for lunch.  We will be on 47th & Park.	1440429187	635832211351162880	f	schnitznthings
@ATrainKickz yoji out designing Ye on these Adidas kicks. Plain and simple	1440268543	635158422988693505	f	schnitznthings
@DJSchxzo @njsneaks @BetterNikeBot got the same error message. How to fix????	1440245942	635063628392230912	f	schnitznthings
@njsneaks keeps saying sizes not live!! Been logged in for an hour. Wtf!	1440245650	635062403160506368	f	schnitznthings
@thatjaydigger we are on 52 and 6 ave	1440170804	634748475620597760	f	schnitznthings
We are on 52 street and 6 avenue,,lets go ! Tgif people,get your schnitz now!!	1440170749	634748244329934848	f	schnitznthings
@Nel_222 then I can put them into the links field in my bot? So I don't need to do twitter monitor? I have the @BetterNikeBot all inone	1440166547	634730620292329472	f	schnitznthings
@Nel_222 @JustFreshKicks by tomorrow? Isn't that too late since they drop?	1440166436	634730156431568900	f	schnitznthings
@Nel_222 how come there are no early links for the yeezy yet? I keep checking and can't find any	1440166366	634729861240721409	f	schnitznthings
RT @NikeRobots: Want to be a Robot?\n\n-One lucky RT'er will get a monthly sub for free!\n-One lucky RT'er will skip the waitlist to purchase ...	1440134226	634595057358737408	f	schnitznthings
@BetterNikeBot I sent you guys multiple emails	1440117444	634524667483656192	f	schnitznthings
@BetterNikeBot can you guys help me pls	1440117182	634523571382059010	f	schnitznthings
The Schnitzel Truck will be on 26th street West side to 11th ave.	1440084531	634386619768930304	f	schnitznthings
The Schnitzel Truck will be on 47th & Park.	1439999268	634029003179978753	f	schnitznthings
Hey Schnitzlers we will be on 52nd & 6th ave.	1439911071	633659076422074368	f	schnitznthings
Hey Schnitzlers. Come have your favorite lunch. We are on Charlton & Varick.	1439828379	633312243585843200	f	schnitznthings
RT @ShanghaiMKS: A big congrats to all of our friends: http://t.co/JE4gifEmcP @KorillaBBQ @VLAIC @TheTreatsTruck @waffletruck @milktrucknyc...	1440808424	637422849293217792	f	korillabbq
RT @Lovin_Trends: The 21 Most Popular Food Trucks In The US http://t.co/TyTMNKz1ej http://t.co/yH1a6Tj9OT	1440808309	637422366646255617	f	korillabbq
RT @theMelissaLeon: Oh @KorillaBBQ, you and I are going to have a wonderful relationship, I can tell already.	1440808297	637422316771782657	f	korillabbq
Happy FanFriday! Congrats to sherackcitybitch for winning our Korilla Fan PhotoContest with this... https://t.co/rRmocdlW1t	1440789016	637341447436533760	f	korillabbq
RT @MikeeeyT22: @KorillaBBQ @choibites @mokbar_nyc korilla rules!!	1440712883	637022120007073793	f	korillabbq
RT @chrisalexander_: Okay so Korilla's BBQ has these kimchee fries and you NEED this in your life. So much going on here.... https://t.co/hHx...	1440712878	637022099866025984	f	korillabbq
RT @kessler: Gonna be hard to top this @WeWork Summer Camp. The Weeknd, Chromeo, Chainsmokers, TJ Miller, fun, friends, food by Dinosaur BB...	1440712861	637022030035070976	f	korillabbq
RT @jeaniusNYC: Gotta get your hands on these Tiger Balls. Only at Korilla BBQ! \nTigerBalls KimchiBalls Korilla http://t.co/i55bUBsuMq	1440712856	637022009189400576	f	korillabbq
RT @timsioson: @SrirachaPeppers @ashleycanreed Korilla once you guys head up my way. It's Korean Chipotle	1440712847	637021968043245569	f	korillabbq
Burrito heads welcome. korilla korillabbq burrito burritogawdz eastvillage nyc @ Korilla BBQ https://t.co/0Z2ZvqTNml	1440694642	636945612521512961	f	korillabbq
Waffles are good but Waffle Fries are better, especially when smothered in cheddar, kimchi and pico.... https://t.co/qpCYApUBRW	1440468983	635999131442544640	f	korillabbq
Sorry guys we are still off the streets till further notice. Check in to our shop to get your fix at St marks & 3rd Ave	1440421335	635799279903354880	f	korillabbq
RT @jenashtep: MAX: Please scatter my ashes at @KorillaBBQ.\nJESSICA: Uh, please scatter mine at @tjmaxx.\n@maxbfriedman @JessicaIsNice	1440384892	635646426765111296	f	korillabbq
Kimchi + Cheddar + Waffle Fries = &lt;insert your caption here&gt;?\n \n\nKimCheeseFries kimchifries... https://t.co/svaTJG4Qh5	1440346010	635483344847904768	f	korillabbq
RT @RegularGuyNYC: Tasty Korean Tacos and Tiger Balls at Korilla BBQ NYC! http://t.co/qdX7JuhZwU KorillaBBQ Korean food foodie taco Y...	1440343138	635471296399323136	f	korillabbq
RT @MrShadowAnt: As always, Korilla completely meets my expectations. I wish I could be this satisfied by food at this price in the city mo...	1440343131	635471269526392832	f	korillabbq
RT @chrisalexander_: You must have these Kimchi Fries from Korilla BBQ on 3rd Ave in Manhattan. Glorious. wafflefries http://t.co/mFlgTgDr...	1440343117	635471210466385920	f	korillabbq
RT @chrisalexander_: If you're in NY, take your ass to Korilla BBQ for kimchi fries & purple forbidden rice. I'm going back next week. ht...	1440343098	635471129268879360	f	korillabbq
RT @GyroPhibes: FUCK. YES. Korilla fuckthatsdelicious https://t.co/OpdA8ChE5L	1440343091	635471099598344192	f	korillabbq
Who's your favorite NYCFoodTruck?  Vote here! http://t.co/rXjLrRfcFO via @Scoutology	1440342971	635470595497558016	f	korillabbq
There are over 3 million food trucks in the US alone, thank you for appreciating what we do! dingesforeveryone http://t.co/NkmXK3VpfT	1440786398	637330464374718464	f	waffletruck
For one free dinges, *smack* order your wafel as If you we're the star of a soap opera! dingesforeveryone	1440775347	637284115239333888	f	waffletruck
DE TRUCKS:\n\nKastaar @ East 40th & Park Ave til 4pm\nMomma Truck @ Park Slope - 7th Ave Carroll St til 4pm	1440771798	637269226378690560	f	waffletruck
De CARTS 2/2:\n\nBierbeek @ De Great Lawn (Central Park) til 7pm\nGoesting @ 66th & Broadway til 10pm	1440771756	637269053372022784	f	waffletruck
De CARTS 1/2:\n\nVedette @ 59th & 5th Ave (Manhattan) til 7pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm	1440771743	637268999336800256	f	waffletruck
THANK DINGES IT'S FRIDAY\nLe Cafe @ 15 Ave B til 11pm\nWafel Cabana @ 35th & Broadway til 10pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1440771718	637268893174747136	f	waffletruck
DE TRUCKS:\nKastaar @ CitiBank LIC (44th Drive btwn 23rd & Hunter St) til 4pm\nMomma Truck @ MetroTech, Lawrence St til 4pm	1440692455	636936437363965953	f	waffletruck
De CARTS 2/2:\n\nBierbeek @ De Great Lawn (Central Park) til 7pm\nGoesting @ 66th & Broadway til 10pm	1440692168	636935236291432449	f	waffletruck
De CARTS 1/2:\n\nVedette @ 59th & 5th Ave (Manhattan) til 7pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm	1440692158	636935194574917632	f	waffletruck
THAT'S TASTY THURSDAY\nLe Cafe @ 15 Ave B til 11pm\nDe Wafel Cabana @ 35th & Broadway til 10pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1440692143	636935131215728641	f	waffletruck
A very happy NationalDogDay to all! Use dogdaydinges to send us your wafel+dog pics! http://t.co/WozOj7e7hC	1440631798	636682026293137408	f	waffletruck
For one free dinges, create a new word & use it in a sentence! dingesforeveryone	1440600376	636550231996239874	f	waffletruck
DE TRUCKS:\nKastaar @ CitiBank LIC (44th Drive btwn 23rd & Hunter St) til 4pm\nMomma Truck @ 60 Wall St til 4pm	1440599570	636546851781615616	f	waffletruck
De CARTS 2/2:\n\nBierbeek @ De Great Lawn (Central Park) til 7pm\nGoesting @ 66th & Broadway til 10pm	1440599558	636546802376921089	f	waffletruck
De CARTS 1/2:\n\nVedette @ 59th & 5th Ave (Manhattan) til 7pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm	1440599549	636546761826377728	f	waffletruck
WAFEL CRUSH WEDNESDAY\nLe Cafe @ 15 Ave B til 11pm\nDe Wafel Cabana @ 35th & Broadway til 10pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1440599523	636546653995073536	f	waffletruck
RT @TheSporkful: The woman whose family brought Belgian waffles to America sits down with @waffletruck: http://t.co/Mrp1HNZEuV http://t.co/...	1440544160	636314446265217025	f	waffletruck
De CARTS 2/2:\n\nBierbeek @ De Great Lawn (Central Park) til 7pm\nGoesting @ 66th & Broadway til 10pm	1440508923	636166651822645248	f	waffletruck
De CARTS 1/2:\n\nVedette @ 59th & 5th Ave (Manhattan) til 7pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm	1440508920	636166637352275968	f	waffletruck
DE TRUCKS:\nKastaar @ 1st Ave & 45th St (United Nations) til 4pm	1440508870	636166430011080704	f	waffletruck
@DoolitleJewelry until 3ish!	1440783427	637318002766184448	f	lobstertruckny
Happy Lobster Friday! BigRed is on the corner of 46th and 6th serving up lobster and sunshine http://t.co/RYBmNHFIAV	1440774601	637280982681452544	f	lobstertruckny
BigRed is catering a private event today but don't forget to visit us at the Seaport! http://t.co/QLyLNW5qft http://t.co/WfnMyzP8lN	1440687742	636916673182834689	f	lobstertruckny
Looking for a late lunch? Visit BigRed at 53rd and Park and get your lobster on! http://t.co/xrzRSU68Bz	1440613254	636604247421898752	f	lobstertruckny
@DoolitleJewelry until about 3!	1440612505	636601102629212160	f	lobstertruckny
Happy Wednesday New York! How about a little hump day treat? BigRed is on 53rd and Park with your LobsterLunch http://t.co/xlZoa9RPCE	1440601236	636553837516599296	f	lobstertruckny
BigRed is dishing up our luscious lobster rolls for lunch of the corner of 50th and 6th! TreatYourselfTuesday http://t.co/agrGR2vXNq	1440513366	636185283537567744	f	lobstertruckny
BigRed is resting after a big weekend! Email cater@redhooklobster.com for any catering needs and catch BigRed on the streets this week!	1440428499	635829329109385216	f	lobstertruckny
Hey New Jersey! Catch BigRed at Laurita Winery this Saturday for food, fireworks and fun! http://t.co/d7idcBhiLm http://t.co/qNONwtEeXS	1440174636	634764547694456834	f	lobstertruckny
@DoolitleJewelry BigRed is on 46th and 6th today!	1440167868	634736163639676929	f	lobstertruckny
Happy Friday lobster lovers! BigRed is on 46th and 6th today serving up delicious lobster rolls to brighten your day http://t.co/yXjfRBeBY0	1440167708	634735492827881472	f	lobstertruckny
@TheMikeyDunn Check out our promo with UberEATS today! First time delivery free with code EATRHLP http://t.co/eqNoz3KacN	1440084155	634385045285928960	f	lobstertruckny
@EricLDavid we can be today! Get our lobster rolls delivered with UberEATS. Use code EATRHLP for free first meal http://t.co/Hsd1IFg26X	1440083590	634382674652741632	f	lobstertruckny
@DoolitleJewelry we are catering today but check out UberEATS for lobster delivery (first time free w/ code EATRHLP) http://t.co/H9t5byPNRF	1440083036	634380352593784832	f	lobstertruckny
Enjoy our delicious Maine lobster roll delivered in &lt;10min with UberEATS. Enter code EATRHLP for free first meal @Uber_NYC LobsterLunch	1440081958	634375830194495489	f	lobstertruckny
BigRed is catering an event today but have no fear! You can get a fresh lobster roll delivered to you with UberEATS http://t.co/a0cjxoIBKA	1440081072	634372112820662272	f	lobstertruckny
@DoolitleJewelry BigRed is booked today but we'll keep you posted on locations for this week!	1439996577	634017716790251520	f	lobstertruckny
BigRed is partying at a private event today. Please email cater@redhooklobster.com to book your party!	1439996313	634016608919396353	f	lobstertruckny
BigRed is on 50th and 6th today for TreatYourselfTuesday! Go get your lobster lunch on http://t.co/UazsbA0v42	1439908528	633648412064395264	f	lobstertruckny
BigRed is taking a break after another successful ProspectPark Food Truck Rally! She will be back on the streets tomorrow.	1439826102	633302689540145152	f	lobstertruckny
Reminder!! We are only as strong as our community - help us get to the Vendys - $1,575 to our goal https://t.co/Xy1MXUR2dZ @CivilEats	1440792156	637354616502493184	f	snowdaytruck
RT @CivilEats: We  this story: @SnowdayTruck is Giving Ex-Offenders a Path to Better Jobs http://t.co/jYh84YBEEF http://t.co/NdVLK9UtjN	1440737051	637123490135584768	f	snowdaytruck
RT @eilis_oneill: My article about @SnowdayTruck on @CivilEats: https://t.co/WPWvmPmAOx	1440618828	636627625843261440	f	snowdaytruck
@skroobal thank you so much!!	1440611503	636596903132692480	f	snowdaytruck
Dear community we need your help to win the Vendys - we've set up a campaign http://t.co/3jvCVuVPwi  & we're just $1,645 shy of our goal!	1440608007	636582238977720320	f	snowdaytruck
.@CivilEats thanks for the great story - let the people know they can join us for a meal today in Dumbo BK (water and Jay st) till 3:30p	1440605597	636572131648798720	f	snowdaytruck
RT @dumbolot: We got @SnowdayTruck and @DomoTaco in the lot today!	1440601611	636555413035556864	f	snowdaytruck
RT @EatLocalNY: This Food Truck is Giving Ex-Offenders a Path to Better Jobs, http://t.co/dTyxQBn3aS @SnowdayTruck @DriveChangeNYC @NYGov...	1440535942	636279975327481856	f	snowdaytruck
RT @CivilEats: This Food Truck is Giving Ex-Offenders a Path to Better Job http://t.co/jYh84YTg3f @SnowdayTruck http://t.co/fFWRchvRM8	1440515004	636192155728510977	f	snowdaytruck
RT @LingeringHaze: The highlight of afropunk was clearly @SnowdayTruck  http://t.co/zMgXnQBRV1	1440376921	635612994551070720	f	snowdaytruck
Cops taking criminal justice quizzes (she got 2/4 right) @afropunk http://t.co/0seXEWUc9I	1440369931	635583675082645506	f	snowdaytruck
Live from @afropunk http://t.co/KY7vHKLDJn	1440356192	635526049695199232	f	snowdaytruck
@LingeringHaze mad love	1440345983	635483230016282625	f	snowdaytruck
RT @alexpreditor: Food truck made from recycled materials mentors the formerly incarcerated  @snowdaytruck\n@drivechangenyc @afropunk http:...	1440285596	635229949335588864	f	snowdaytruck
Today is the first day of @afropunk - we're pumped to be a vendor! Great line up! And the music will be good too ;) http://t.co/332sXA9xJu	1440249390	635078090482450432	f	snowdaytruck
@realcaga see you next weekend !	1440249142	635077048399200256	f	snowdaytruck
.@afropunk see you tomorrow !!!!!!	1440190938	634832926224556032	f	snowdaytruck
Big thank you to mama lex for helping us get prepped for @afropunk - whose coming out this wknd?!?? http://t.co/7vYeQN2EIM	1440106151	634477303570006017	f	snowdaytruck
Community! You're doing great! In just 2 days we've hit 49% of our $3,500 @vendyawards  goal! Help send us http://t.co/3jvCVuVPwi	1440086263	634393884651597824	f	snowdaytruck
RT @RealEstateUWS: READY TO TASTE the 25 BEST STREET VENDORS FOOD?NYC Vendy Awards - SAT 9/12/15  http://t.co/4B9uIlHV8j via @Eventbrite ht...	1440008132	634066180349759488	f	snowdaytruck
RT @randomfoodtruck: Fun in the sun with @souvlakitruck and @PapayaKingTruck	1440611008	636594827455528960	f	papayakingtruck
I don't eat vegetables. I only eat food like cheeseburgers, Spam, hot dogs & pizza. - Art Donovan nationaldogday http://t.co/kgccB0pY3S	1440600950	636552637471657984	f	papayakingtruck
RT @livefastgroup: Come stop by the shippingandreceiving food truck lot at 330 west 33rd st(btw 8th & 9th).@GiulianiSocial @Papaya_King ht...	1440512665	636182344005734400	f	papayakingtruck
RT @VoiceStreet: Excited to have the @papayakingtruck join us @BKPour, serving their world famous franks & tropical drinks sponsored http:...	1440094119	634426837591044096	f	papayakingtruck
It's a foodtruckrally day @prospect_park today from 11a-5p at GrandArmyPlaza See you there! @dispatchny Brooklyn	1439744200	632959168626991104	f	papayakingtruck
RT @Papaya_King: We don't mind which hand you hold your hot dog in, just never put ketchup on your hot dog. NationalLeftHandDay http://t.c...	1439482875	631863094575276033	f	papayakingtruck
Day 2 of @FOLDfest by @NileRodgers Lineup: http://t.co/dPSXdz4Ntv MCVFOLDFEST @mcv6025 http://t.co/ZDIiLCtOfm	1438798554	628992844108312576	f	papayakingtruck
Doors are open at @FOLDfest, taste the worlds greatest franks while listening to the worlds greatest music http://t.co/2MZTa0afnw	1438729838	628704626636931073	f	papayakingtruck
Today is Day 1 of @FOLDfest by @NileRodgers Lineup: http://t.co/dPSXdz4Ntv MCVFOLDFEST @mcv6025 http://t.co/naGQbrfGOu	1438704200	628597094551568384	f	papayakingtruck
Beat the heat at @prospect_park FoodTruckRally 11a-5p http://t.co/YKtX3AUriK @DispatchNY 	1438522549	627835193731219456	f	papayakingtruck
Join us at @prospect_park FoodTruckRally this SUNDAY 8/2, 11a-5p http://t.co/YKtX3AUriK @DispatchNY	1438374954	627216136447356928	f	papayakingtruck
It's NationalHotDogDay and we are in Metrotech today - @DowntownBklyn http://t.co/BRqMvfs7k4	1437661715	624224594891788288	f	papayakingtruck
RT @Papaya_King: Kick off NationalHotDogDay right at PapayaKing http://t.co/cCYAsyLabV	1437656788	624203927173644288	f	papayakingtruck
Barkfest by @barkbox is today more info: http://t.co/CznbufETwZ N 11th Kent Ave. - Papaya King will be serving all the humans frankfurters	1437328935	622828816029863936	f	papayakingtruck
GreatestDayEver is today at 50 Kent - Fun starts at 1PM https://t.co/x6PsvW2mvU @Brunchbounce @Livefastgroup	1437237337	622444624263663616	f	papayakingtruck
.@hillarydixler every other Thursday unfortunately, won't be back until next week. Veggie dogs are @YvesVeggie brand	1436906642	621057588801765376	f	papayakingtruck
Serving at @prospect_park FoodTruckRally today2, 11a-5p http://t.co/fpYSIZng5u @dispatchny @nycfoodtruck	1436724430	620293337132703744	f	papayakingtruck
Menu today at the @4knotsfest Festival FoodCart http://t.co/UeuSKUVkvy	1436632324	619907015368933376	f	papayakingtruck
Today we are at @4knotsfest and a wedding after party at @Studio450 - looking to rent our truck? Email jason@papayaking.com	1436630136	619897837195776001	f	papayakingtruck
Join us today at the @4knotsfest at Pier84 w/ @superfurry & @TwinPeaksDudes http://t.co/no8065CkGO @VoiceStreet 4Knots	1436620507	619857451484102656	f	papayakingtruck
@shahidkapoor best of luck	1412268299	517716886608703488	f	taipanexpress
Best of luck my brother...	1412268232	517716605292523521	f	taipanexpress
Good morning we are serving lunch at 46 st between 5&6ave from 11:30 to 3pm @FoodtoEat @midtownlunch @nystfood	1408622100	502423619595956225	f	taipanexpress
Good morning happy hump day today we are serving lunch at 47 st park and Lexington from 11:30 to 3pm @FoodtoEat @nystfood @midtownlunch	1408540096	502079673384566784	f	taipanexpress
Good morning Tuesday today we are at south street seaport all day from 11:30 to 8pm @midtownlunch @nystfood @truckfoodnyc	1408454987	501722698494775298	f	taipanexpress
Good morning today we are serving lunch at 47 street between park and lex ave from 11:30 to 3pm @FoodtoEat @midtownlunch @nystfood	1408099122	500230093730742272	f	taipanexpress
Good morning midtown we are serving lunch at 46 st between 5 & 6 ave from 11:39 to 3pm @nystfood @FoodtoEat @midtownlunch	1408009351	499853563603222528	f	taipanexpress
Good morning rain rain go away come back another day.. We are out on street for lunch at 47 st park and lex From 11:30 to 3pm @midtownlunch	1407935872	499545370217971712	f	taipanexpress
Good morning we are park at south street seaport all day from 11:30 to 8pm @FoodtoEat @nystfood	1407852260	499194678353616896	f	taipanexpress
Good morning midtown we are serving lunch at 46 st between park and lex ave from 11:39 to 3pm @midtownlunch @FoodtoEat @truckfoodnyc	1407760063	498807974203518976	f	taipanexpress
Happy Friday today we are back on 47 st between park & lex ave from 12:30 to 3pm for pre-order before 12 call 3474402467 @midtownlunch	1407497133	497705166796509184	f	taipanexpress
!!Good morning!! Today we are serving lunch at 421 E. 26th st tge corner of 1 ave Fromm 11am to 3pm @FoodtoEat @midtownlunch	1407409447	497337385454403585	f	taipanexpress
Good morning today we are serving lunch at 47 st between park and Lex ave from 11:30 to 3pm pre-order before 12pm at 3474502467 @FoodtoEat	1407325282	496984373657608192	f	taipanexpress
Good morning we are here at south st seaport from 11:30 to 8pm @FoodtoEat @nystfood @foodtrucksin	1407244710	496646428811624448	f	taipanexpress
Sorry guys we are not out today but we will be at seaport tomorrow from 11:30 to 8pm	1407168941	496328628381446147	f	taipanexpress
@LaBellaTorte one of my favorite food every sweet for the truck are delicious http://t.co/DFK9hhv4Mm	1407168834	496328179930644480	f	taipanexpress
Happy Sunday we are at south st  seaport all day....	1407077708	495945970233126912	f	taipanexpress
Happy Friday we are serving lunch at 47 st between park and Lexington ave from 11:30 to 3 pm @FoodtoEat @midtownlunch @nystfood	1406894966	495179497973764097	f	taipanexpress
Good morning we are serving lunch at 46 st between 5 & 6 ave from 11:30 to 3pm @midtownlunch @FoodtoEat @nystfood	1406808531	494816960618958848	f	taipanexpress
Good morning midtown we are serving lunch at 47 st between park and Lexington from 11:30 pm to 3pm @midtownlunch @FoodtoEat @nystfood	1406721037	494449984172228608	f	taipanexpress
Brought our yummy fare down to SoHo today! Catch us on Hudson & King til 2:30!	1418396706	543421288300429312	f	mooshugrill
Hey FiDi check us out on Old Slip & Water today!	1418312528	543068221407264768	f	mooshugrill
finally back on 52nd/6th! mooshugrill with a slightly updated (but better) menu!	1418226400	542706975801634816	f	mooshugrill
What's happening midtown? MSG on 52nd & 6th ave slinging NY's most delicious mooshus and ricebowls	1418224404	542698603329114112	f	mooshugrill
Off the streets today, stay dry!	1418139086	542340752307924992	f	mooshugrill
53rd and park today!! we are on the west side of park ave!	1418051323	541972646968455168	f	mooshugrill
Happy Friday SoHo! Catch yourself some Christmas shus on Hudson & King today!	1417791874	540884438742499328	f	mooshugrill
Off the streets today, stay warm New York!	1417705853	540523642707513344	f	mooshugrill
Back at it on 47th & Park today!	1417620876	540167224066326528	f	mooshugrill
Back on 47th and park. Come by and say hi!	1417533304	539799917661671424	f	mooshugrill
Put those leftovers down and swing by 47th & Park for some MSG today!	1417447522	539440123671482368	f	mooshugrill
Down at the @dumbolot today, Happy Thanksgiving!	1417018094	537638973771112448	f	mooshugrill
MSG back in midtown east on 47th & park!	1416928883	537264795251396608	f	mooshugrill
Catch us on 53rd & Park for the remainder of lunch!	1416851413	536939860326879233	f	mooshugrill
Kicked off of 46th by the cops:( scoping out alternate locations stay tuned!	1416850889	536937661609832448	f	mooshugrill
MSG back at it on 46th & 6th ave today!	1416841987	536900324649598976	f	mooshugrill
Happy Friday! MSG on Hudson and Charlton today!	1416583858	535817652791697408	f	mooshugrill
We're back in SOHO!  Hudson and Charlton for lunch. mooshus mooshurito	1416579076	535797597085384707	f	mooshugrill
MSG back in FiDi on Old Slip and Water st today!	1416496471	535451128851615744	f	mooshugrill
New menu items includig soysaucechicken and orangebeef at MSG on 52nd & 6th today!	1416412261	535097926469824512	f	mooshugrill
71st and york... it's friday	1414687317	527862983868039168	f	mrniceguytruck
71st and York we are here!!!	1414509882	527118767948849154	f	mrniceguytruck
@okterrific29 hey sorry but store is closed for retail. You can follow the truck and eat those delicious sliders you have been missing.	1414424434	526760375229104128	f	mrniceguytruck
71st and york on this friday!! Great way to start the weekend. Windows go up at 11am.	1414158926	525646751022469120	f	mrniceguytruck
71st and york is where we are today. Come get food from your favorite truck.	1413901790	524568246822113280	f	mrniceguytruck
71st and York today. HAPPY FRIDAY	1413563876	523150933942108160	f	mrniceguytruck
In Staten Island serving up you favorite sliders.  40 Minthorne street. @flagshipbeercomp http://t.co/1eDLGFLdis	1413140493	521375136554172416	f	mrniceguytruck
http://t.co/qkXEv92rST	1413140444	521374930810974210	f	mrniceguytruck
40 Minthorne street. Staten Island NY starts at noon! !	1413127571	521320936621236224	f	mrniceguytruck
Staten Island bound.. Catch us in SI for some good grub on this sunday.	1413127456	521320454406287361	f	mrniceguytruck
52nd and 6th we are out here, windows go up at 11am. End your Friday right and get your lunch from us.	1412951622	520582952145920001	f	mrniceguytruck
71st and York, we are here!!! Windows go up at 11am!!	1412777816	519853957389508608	f	mrniceguytruck
Let us cater your next event or party. Contact us at mrniceguytruck@gmail.com for prices.	1412708334	519562526879518721	f	mrniceguytruck
Happy Monday we are at Mt. Sanai Hospital for lunch today!!! Windows are up.	1412611020	519154363168997377	f	mrniceguytruck
52nd and 6th we are out here for your Friday lunch experience.  Windows are up end your week off right with us the NiceGuys.	1412349543	518057651578482688	f	mrniceguytruck
We are open and ready to go 634 McLean Avenue, Yonkers NY 914-457-4324	1412269542	517722102724849664	f	mrniceguytruck
Don't let this weather bring you down.. We are open and ready to take your order. We have your favorite Sliders, Wings, and Fries.	1412193619	517403657302593536	f	mrniceguytruck
47 th and Park on this rainy hump day. Pass by and say hi	1412184956	517367320583606272	f	mrniceguytruck
71st and York we are back. Place your orders.	1412090204	516969902142656512	f	mrniceguytruck
The Truck is OFF but the store is Open. 914-457-4324 place your orders.	1412015339	516655897943105536	f	mrniceguytruck
@_JHoff hi we scratched the truck 6 months ago. it spent 2 much time in the shop. opening new locations soon. call us for a delivery!!!	1440771500	637267979932184576	f	shortysnyc
RT @KJPuncorked: Slayed it tonight at trivia. Second place. quizthugsandharmony @shortysnyc 	1440644842	636736735142117379	f	shortysnyc
RT @ShortysTrivia: TRIVIA TONIGHT @shortysnyc -- 1678 1st ave. 8pm Trivia BarTrivia ShortysNyc @TopShelfTrivia	1440625314	636654830698803200	f	shortysnyc
RT @empirebrew: This just in, Cream Ale + @shortysnyc Philly Cheesesteak  are a match made in heaven YoureWelcome LunchInNYC http://t.co/...	1440523443	636227552965738496	f	shortysnyc
@DAODAmusic if local channel or nfl network shows it then yes. directv doesn't televise pre-season games. we show all reg season games.	1440162624	634714166213914624	f	shortysnyc
RT @noneck: How to make a food baby in 3 easy steps. Thanks @shortysnyc!! https://t.co/lFTcw64hvK	1440097464	634440865637924864	f	shortysnyc
Let's goooooooooo Dodgers.   \nchase	1440037307	634188548728594433	f	shortysnyc
RT @ConeyIslandBeer: Third times the charm. Stop by @shortysnyc on 1st ave and enjoy $12 Coney Island pitchers all night long http://t.co/R...	1440022876	634128019418968064	f	shortysnyc
RT @abenderr35: @ambah_please and I just crushed some cheese fries from @shortysnyc sodelish	1440018800	634110925776269312	f	shortysnyc
Trivia TONIGHT @shortysnyc @ShortysTrivia 1678 1st Ave Nyc UpperEast http://t.co/lEGgM7NsyZ	1440018790	634110883321483269	f	shortysnyc
RT @ShortysTrivia: @jwk1988 yes sir! 9pm -- 62 pearl -- see you there @shortysnyc	1439936365	633765168699326464	f	shortysnyc
RT @ConeyIslandBeer: So nice we're doin it twice. Join us at @shortysnyc on 1st ave for $12 Coney Island pitchers & trivia http://t.co/fxBV...	1439421463	631605512732323840	f	shortysnyc
@shortysnyc @ShortysTrivia @markzito http://t.co/vxrp9UTBUJ	1439419268	631596304905424896	f	shortysnyc
TriviaTuesday -- 62 Pearl St. 9pm. ShortysNyc http://t.co/1TRIbuUMsT	1439338780	631258713286905856	f	shortysnyc
RT @DJEddieAlvarez: @shortysnyc one of the best rolls for a cheesesteak ever. Great sandwich (a little heavy on the hot sauce lol) Yum ht...	1439329360	631219205610831873	f	shortysnyc
@ShortysTrivia -- Trivia Tonight -- 62 Pearl Street. 9pm ShortysNyc http://t.co/mAvBLwAmlF	1439312580	631148823423897600	f	shortysnyc
RT @2HatsBrew: Can't decide between beer or cocktails? Head to @shortysnyc ... And don't forget the Italian Fries! 30BeersOnTap http://t.c...	1439091248	630220491060592641	f	shortysnyc
@KristinChristy if game is on local channel/nfl network then yes. no pre-season games are on directv. we show every eagles games reg season.	1438942691	629597397929361408	f	shortysnyc
RT @ShortysTrivia: TRIVIA TONIGHT 8PM 1ST AVE  IT BETTER NOT BE AS HOT AS IT WAS LAST WEEK!! @shortysnyc ... Pray for @LouFerrara close...	1438805709	629022851425804288	f	shortysnyc
RT @MBDCraft: Tomorrow 8-10:30PM: @ConeyIslandBeer presents: Wednesday Night Trivia at @ShortysNYC 1st Ave! Coney pitcher special all night...	1438744418	628765780235173888	f	shortysnyc
Happy Friday from 53rd & Park! In case you miss us we're across the street between Park and Madison today!	1440766562	637247267959734273	f	biandangnyc
RT @judyayuchen: @flyingtoaster0 found them! eat some delicious taiwanese bento for me @biandangnyc	1440711886	637017938764165121	f	biandangnyc
@flyingtoaster0 @judyayuchen only open Monday to Friday. 	1440711882	637017921605226496	f	biandangnyc
Swing by 53rd & Park for some Taiwanese goodeats dumplings baos teaeggs porkchops nom	1440681054	636888621023297536	f	biandangnyc
Back at it on 53rd & Park!	1440593398	636520962985299968	f	biandangnyc
Catch us down in FiDi on Old Slip & Water today!	1440510032	636171301204291585	f	biandangnyc
Happy Monday from 50th & 6th ave!	1440421051	635798088913805312	f	biandangnyc
Happy Thursday from 53rd & Park!	1440078836	634362733912178688	f	biandangnyc
Happy Wednesday back on 53rd & Park today!	1439989062	633986195639377920	f	biandangnyc
Old Slip & Water! comegetsome	1439904296	633630659035140096	f	biandangnyc
50th and 6th!	1439828089	633311026449137664	f	biandangnyc
Happy Friday! Celebrate the weekend with Tawianesefood on 53rd & Park zhongzi teaeggs porkchops nom	1439559992	632186546821701632	f	biandangnyc
Happy Thursday from 53rd & Park!	1439477971	631842522810187776	f	biandangnyc
humpday on 53rd & Park:( Bian Dang on 53rd & Park:)	1439387392	631462606457344002	f	biandangnyc
swim on over to Old Slip & Water for a Taiwanese lunch box today!	1439300407	631097767742566400	f	biandangnyc
Out on 50th & 6th for lunch today taiwanesefood nom	1439216592	630746220575752192	f	biandangnyc
Get your weekend started early with a biandang and a side of veggiedumplings on 53rd & Park!	1438951711	629635229922250752	f	biandangnyc
53rd & Park for lunch today!	1438873040	629305260524314624	f	biandangnyc
Happy freetheknee day NYC! Catch us on 53rs & Park for the coolest lunch in midtown coolkids	1438782329	628924790905118721	f	biandangnyc
FiDi on Old Slip and Water today!	1438696088	628563068943998977	f	biandangnyc
RT @jessbesack: S/o to the comedy genius in line for @MexicoBlvd who just shouted FLAUTA? I HARDLY KNOW HER	1440785812	637328007393353728	f	mexicoblvd
Feliz fin de semana! 46th St Midtown http://t.co/aHb2weHkJ6	1440767185	637249881405587456	f	mexicoblvd
Muy buen y feliz dia!  @MexicoBlvd @dumbolot cocinatradicional mexicana Water&Jay	1440687669	636916365186699264	f	mexicoblvd
RT @dumbolot: Thursdays with @ToumNYC @MexicoBlvd and @mausamnyc!	1440682705	636895542782636032	f	mexicoblvd
@scout_and_lilly we love it!	1440620138	636633118158491648	f	mexicoblvd
RT @bklynredd76: @MexicoBlvd can't wait for lunch time!!!	1440611840	636598315640074241	f	mexicoblvd
Good morning NYC! saboresde Mexico @MexicoBlvd Midtown 51st St&Park	1440598150	636540897027604481	f	mexicoblvd
RT @marcelyunes: @MexicoBlvd it's taco time!!!	1440526421	636240043179442176	f	mexicoblvd
It's Tuesday... Midtown, NYC 46th St. http://t.co/dahiFl8OEi	1440509197	636167799338090496	f	mexicoblvd
Hola Dumbo! taquiza tortas guacamole  Flautas Water&Jay	1440429906	635835229203243008	f	mexicoblvd
Be happy @MexicoBlvd  46th St. NYC http://t.co/GTpiO6Y4cE	1440165120	634724635536412672	f	mexicoblvd
Buenos dias DUMBO! guacamole tortas tacos flautas @MexicoBlvd @dumbolot Water&Jay	1440084643	634387088968912896	f	mexicoblvd
RT @dumbolot: We got @ToumNYC @MexicoBlvd and @mausamnyc today!	1440079185	634364200194830336	f	mexicoblvd
RT @bklynredd76: @MexicoBlvd i have been waiting since last  week for taco day....yum yum	1440006498	634059325296746496	f	mexicoblvd
RT @MobileCuisine: Today is NationalHotAndSpicyFoodDay so we are sharing some Jalapeno fun facts with you. http://t.co/c6NMHapLvi	1439996673	634018119774769152	f	mexicoblvd
Aguacate en tus TACOS @MexicoBlvd  51st St. & Park AvosfromMexico http://t.co/cQVRtxbVcq	1439989281	633987113428512769	f	mexicoblvd
RT @jshapiro00: Tacos Tuesday! (The S is silent) tacos nyc (@ Mexico Blvd Truck in New York, NY) https://t.co/lDIJnoMsiG	1439922353	633706396773679104	f	mexicoblvd
Hola Midtown! 46th St. NYC http://t.co/WyzEXDtyH3	1439900950	633616626613665792	f	mexicoblvd
Hola Dumbo! Have a great day. http://t.co/ciOCsVclkF	1439816794	633263649264652288	f	mexicoblvd
Midtown NYC Authentic Traditional W46th St. http://t.co/ZrE19CPfD8	1439557081	632174336259026944	f	mexicoblvd
Q+A with Shelby Welinder, Body Positive Model + Journalist http://t.co/j1jevszngC via @byomuse	1435693089	615967577685258240	f	delsnyc
RT @nick_schultz: This @DelsNYC and @Gansettbeer shandy is delicious (and not even filling) http://t.co/NrhbCLNadi	1410028765	508323601901428736	f	delsnyc
We are in DUMBO @BklynBrdgPark until 4:30, then we head over to @MadSqParkNYC to serve our Flatiron fiends from 6-9pm!	1410023623	508302033628463104	f	delsnyc
RT @MadSqParkNYC: Refreshments for sale at MadSq200TASK include @Redhooklobster @souvlakitruck @DelsNYC @LaNewyorkina http://t.co/Yiwmkqw6...	1409848662	507568193733275648	f	delsnyc
RT @MadSqParkNYC: Refreshments for sale at MadSq200TASK include @Redhooklobster @souvlakitruck @DelsNYC @LaNewyorkina http://t.co/Yiwmkqw6...	1409753454	507168862279053312	f	delsnyc
What a beautiful day to end summer! Find us at our usual spot in DUMBO @BklynBrdgPark and also @FoolsGoldRecs party at 50 Kent in the Burg	1409586997	506470694054805504	f	delsnyc
Tomorrow 9/1 we will be on 50 Kent in Williamsburg at the @FoolsGoldRecs day off party! Starting at 2pm	1409510153	506148383787327488	f	delsnyc
@nickyapowell we are outside Grimaldis Pizza @BklynBrdgPark	1409510063	506148007973498880	f	delsnyc
Come spend the last weekend of summer with us @BklynBrdgPark until 7:30	1409502513	506116340512747520	f	delsnyc
RT @PromoChickBeth: I need the @DelsNYC truck to come by the @HOT97 studios in SoHo one day. I'd be the happiest Rhode Islander in Manhatta...	1409359825	505517864850558977	f	delsnyc
After 4pm come visit us at the Abington House for the final Party Under the High Line from 6-9pm! @2910AH AHartpark	1409151191	504642789288984576	f	delsnyc
We apologize for being MIA the past 2 days. We've been preparing for the hottest day of the week! Come find us at 21st & 5th Ave until 4pm	1409149941	504637547642122241	f	delsnyc
RT @BrooksBrothers: @DelsNYC Thank you again! A delicious tradition at that.	1408633140	502469926398222336	f	delsnyc
@BrooksBrothers Thanks for having us! It looks like this is becoming a tradition!	1408632163	502465829540483072	f	delsnyc
RT @BrooksBrothers: 346 Madison got a sweet treat when @DelsNYC stopped by for NationalLemonadeDay. http://t.co/cMOrCjJkDX	1408632123	502465660317093888	f	delsnyc
RT @sarahsolfails: Thanks @DelsNYC for stopping by @BrooksBrothers, it was greatly appreciated. NationalLemonadeDay http://t.co/EbJqmAojTE	1408632072	502465444671160320	f	delsnyc
This weekend we will be at Afropunk Fest with both of our trucks! Come check out some good music and drink Del's!	1408631871	502464602966204416	f	delsnyc
Complimentary Del's available at Abington House!	1408579206	502243712429490176	f	delsnyc
Happy National Lemonade Day! Find us at Abington House Summer Series Event at 500 W30th st 6-9pm @2910AH AHartpark	1408565494	502186200049152002	f	delsnyc
21st & 5th all day today! Flatiron and @MadSqParkNYC are a home away from home for us.	1408377663	501398376387457024	f	delsnyc
Very late tweet! We in Dumbo! That means it's Friday! Come by say hi!	1440782725	637315060956794880	f	mamuthainoodle
@AtriumStaff sorry, we're way uptown today. See you next Monday!	1440528202	636247513603907584	f	mamuthainoodle
We're in the top 5!! Thanks Eater Queens Heat Map!!  http://t.co/ZclUSCdoT8	1440095702	634433476469649409	f	mamuthainoodle
Hi Thursday peoples! We are towards the middle of the block. Construction is in our spot but they will move soon We're open now. Noodles!	1440085478	634390592194281472	f	mamuthainoodle
RT @Scoutology: Get Your Votes In For The Best Food Trucks In NYC! @ScoutologyNYC @mactruckny @mamuthainoodle @SweeteryNYC \n\nhttp://t.co/e...	1440023099	634128956388700160	f	mamuthainoodle
RT @telemachus: Wife sent pic of her lunch: kua gai w/ plenty of sriracha from @mamuthainoodle.\n\nI almost think she doesnt like me. http:/...	1440021374	634121723076562944	f	mamuthainoodle
@ActuallyNPH if you're near @KaufmanAstoria come by for some thai noodles! Our restaurant is literally down the street! legendary	1439995220	634012023601430528	f	mamuthainoodle
Noodle lovers! Truck is at our Tuesday uptown spot! Come by for your Thai lunch thaiicedtea is perfect for this weather! NYC	1439910710	633657564664872960	f	mamuthainoodle
Dumbo? Yes! @dumbolot @DUMBOFoodTrucks	1439569203	632225179603726338	f	mamuthainoodle
RT @NickArthur5: @mamuthainoodle YOU GUYS ARE AWESOME. YES	1439401695	631522601295290369	f	mamuthainoodle
Surprise landing at 17th&5th today! Swing by for you Thai noodle lunch 11:30-3p foodtruck NYC	1439392206	631482799044841472	f	mamuthainoodle
Sorry Tuesday folks, doing a private catering event. We're off the road today. See you on Thursday! mamuthai	1439305085	631117388981927936	f	mamuthainoodle
@NewYorkCWeather will it be heavy rain today through lunch time? 11a-3pm?	1439290238	631055116355940354	f	mamuthainoodle
17th&5th! Happy Monday! We are hear for your noodle needs! Come by for lunch ! nyc foodtruck mamuthai	1439222327	630770273780924416	f	mamuthainoodle
@b2ian6 running a bit late today but on our way! Every Tuesday & Thursday for the past 2 years!	1438871483	629298730215309313	f	mamuthainoodle
We are back on 17th&5th! Come by for your thai noodle lunch nyc happy Monday! mamuthai	1438616089	628227530621906945	f	mamuthainoodle
Williamsburg!!! We are serving dinner tonight in front of 568 Union Ave. Come by for your Thai noodle dinner brooklyn	1438123738	626162458755993602	f	mamuthainoodle
Hey everyone! We're nominated for best NYC food truck. Please have a look and vote for us! http://t.co/6TQ50Lzige	1437865477	625079233908469760	f	mamuthainoodle
RT @LosViajeros15: Shout out to @mamuthainoodle for the bestttttt Thai food we've had since Thailand! It was such a pleasure to meet you & ...	1437764555	624655938595725312	f	mamuthainoodle
Hello Dumbo!! What a beautiful day for fresh Thai noodles & Thai Iced Tea! We're @dumbolot join us for lunch	1437753721	624610493479546880	f	mamuthainoodle
Our cart is up and running on 50th!!!!!@	1438095791	626045239069966336	f	thepocketful
We hope to have CART out later this week	1436789968	620568221284999168	f	thepocketful
We are rebuilding our Refridgerator system in truck. It's taking longer than expected. We miss u all in 50th	1436789859	620567763749310464	f	thepocketful
Our cart is back on 50th between 6th and 7th. Enjoy the sunshine!	1430145608	592699756926873602	f	thepocketful
We injured our cart today. We won't be on 50th, but will be back all fixed up on monday	1429888965	591623317460754432	f	thepocketful
Our cart is permanently located on 50th between 6th and 7th. The truck is helping out baby for next few weeks.	1429110401	588357783088717824	f	thepocketful
Located on 50th between 6th&7th http://t.co/AJ4rjrgAUe	1429024363	587996916115447808	f	thepocketful
http://t.co/agzeW7PLmx	1429024311	587996696203948033	f	thepocketful
Located on Hudson and King	1428936413	587628025606500352	f	thepocketful
On 50th between 6th&7th	1428418510	585455784391270400	f	thepocketful
Our proud new baby!!! http://t.co/Y5i97RBZ05	1427900285	583282190060036096	f	thepocketful
Just posted a photo @ Time-Life Building https://t.co/omQJ1JTFZX	1427900192	583281799591247872	f	thepocketful
On 50th between 6th & 7th!	1427813987	582920228696358913	f	thepocketful
Just posted a photo https://t.co/ewJUqQAKUf	1427732380	582577944691884033	f	thepocketful
On Hudson and King today.	1427727369	582556925377777664	f	thepocketful
Don Draper enjoying a falafel from The Pocketful http://t.co/vkSfmGJ5iN	1427669939	582316047237148672	f	thepocketful
Don Draper had the Pocketful falafel.  falafel.vegetarian.vegan https://t.co/rd6gELQ8sP	1427668929	582311810625335296	f	thepocketful
Located on 50th between 6th&7th	1427469005	581473269162872832	f	thepocketful
On 49th between 6th&7th. Police activity on 50th.	1427380200	581100793551552512	f	thepocketful
We are on 50th between 6th and 7th. Enjoy the sunshine.,	1427295178	580744186783232001	f	thepocketful
@cmgonzalez85 glad you liked Carlos we'll make sure to bring them back real soon for you	1440532717	636266450500628488	f	camionnyc
RT @BestOfCBSNY: Hungry? Check out our review of @CamionNYC and then track down their truck! http://t.co/476av7s1P0 foodtruckfriday http:/...	1440180246	634788079941894144	f	camionnyc
@cmgonzalez85 sorry Carlos not tomorrow but we will have it for you next tue we promise tomorrow's special is Al Pastor	1439403207	631528940709015556	f	camionnyc
47th & Park Ave. Today's special: angus beef brisket, chipotle BBQ and crispy onions midtown... https://t.co/6yDeOTHU3m	1439392038	631482096494735361	f	camionnyc
TGIF!!! 47th and Park Ave try Today's special Ground angus beef tacos with lettuce, pico de gallo and... https://t.co/8rjY3ri1fD	1438964841	629690302136250368	f	camionnyc
Need a hump day cure???? We gotta em Fish tacos at old slip and water til 2:30.	1437575769	623864109545705472	f	camionnyc
47th at and Park ave come enjoy your taco Tuesday with us!!!!!!	1437493534	623519191811891200	f	camionnyc
RT @randomfoodtruck: Been awhile since I was in on a Friday (humblebrag). Happy to see so many great trucks here! @CamionNYC @carlssteaks ...	1437146040	622061698267152384	f	camionnyc
Old slip and water FiDi foodporn foodtruck tacos burritos camionmeanstruck... https://t.co/ldYJK0EKLg	1436974916	621343951967154176	f	camionnyc
Good food, good beer and good tunes, join us licbeerproject fishtacos beers tgis summer foodporn... https://t.co/qJBKHwZLc7	1436642398	619949269177516032	f	camionnyc
@tessypie we're here to help  glad you enjoyed.	1436560474	619605653330509824	f	camionnyc
TGIF 56th & Broadway 11:30 to 2:30 today's especial Al pastor Tacos camionmodernmexican camionmeanstruck @randomfoodtruck Midtown	1436541204	619524830078074880	f	camionnyc
Old slip and water til 2:30. foodporn foodtruck camionmodernmexican camionmeanstruck yummy https://t.co/SvLOiMwkQx	1436368796	618801698451001344	f	camionnyc
Old slip and water til 2:30 we got the humpday cure Al pastor tacos with a pineapple relish FiDi fishtacos camionmodernmexican	1436368380	618799954363064320	f	camionnyc
Today at 47th st and Park Abe. Come try today our 2 specials. Brisket taco and Al pastor taco. Today... https://t.co/ZxFkjSwL1J	1436283937	618445775350157316	f	camionnyc
At Belmont park today for Americas birthday  belmont starsandstripes 4thofjuly https://t.co/unl8X68PGp	1436039898	617422201378238464	f	camionnyc
Today at 46th and 6th ave. try our Al pastor tacos til 2:30 camionmodernmexican foodporn foodtruck... https://t.co/TvkBcPNhI5	1435766217	616274301503848448	f	camionnyc
Old Slip & Water St till 2pm fidi foodporn foodtruck wallstreet alpastor tacos... https://t.co/dqL5nltv7Q	1435592555	615545908239945728	f	camionnyc
Old Slip & Water St till 2pm Today this weeks especial Al Pastor tacos with pineapple Relish fidi foodporn http://t.co/sIzBzG2V18	1435592124	615544100788563968	f	camionnyc
Corner of Tompkins St. & Monroe St. Brooklyn beerbraisedshortribs sincerelytommy foodporn... https://t.co/uEYphoSaqI	1435524538	615260624470286336	f	camionnyc
@abieDweck @33 tnx a million for the support	1440699961	636967920908804096	f	schnitzi1
Hurry up before we ran out of food @33 bet 8&9 http://t.co/TMbtw0QaQI	1440696195	636952125914882048	f	schnitzi1
@abieDweck @11am @YeahThatsKosher yes we are @33 bet 8&9	1440690217	636927052172689408	f	schnitzi1
We are very excited to  be@33 St bet 8&9 @11am it's beautiful in the garden and there is plenty of room to sit down and eat some schnitzi	1440681492	636890458090831872	f	schnitzi1
@charlesgartner I hope it will be a regular spot for the Schnitzi truck	1440633137	636687643615567872	f	schnitzi1
@charlesgartner we will be on 33 St bet 8&9 Ave tomorrow	1440633110	636687526443511808	f	schnitzi1
Very exciting news, tomorrow Thursday we will be @33 St bet 8&9 Ave right next to B&H serving lunch, spread the word B&H we are on our way	1440632198	636683705176731648	f	schnitzi1
46 bet 5&6 up front serving lunch from 11:30-3:15 order online @www.schnitzi.com schnitzitruck schnitzel foodtruck kosherfood	1440601818	636556280807735296	f	schnitzi1
@46 St bet 5&6 serving lunch from 11:30-3:15 order online @www.schnitzi.com schnitzitruck schnitzel foodtruck kosherfood	1440511383	636176969542057984	f	schnitzi1
Humid here @Hanover Sq so order online @www.schnitzi.com serving lunch from 11:15-3 schnitzitruck schnitzelfoodtruckkosherfood	1440424147	635811072075780097	f	schnitzi1
Today governors island @ligget terrace all day long VW beetle show, come see some amazing cars and eat some schnitzi schnitzitruck	1440338254	635450811938639872	f	schnitzi1
Get some fuel for the day with some Schnitzi's sandwich @46 and 6 order online @www.schnitzi.com schnitzitruck schnitzel kosher	1440084119	634384895062724608	f	schnitzi1
Beat the heat with some schnitzi @46 St corner of 6ave from 11:30 - 3:15 order online @www.schnitzi.com schnitzitruck foodtruck	1439991393	633995973983911936	f	schnitzi1
Today @46 corner of 6 Ave serving lunch from 11:30 - 3:15 order online @www.schnitzi.com schnitzitruck schnitzel foodtruck	1439905655	633636358876196864	f	schnitzi1
It's hot almost as our Spanish schnitzel @Hanover Sq serving lunch from 11-3 order @www.schnitzi.com schnitzitruck foodtruck	1439822172	633286206189645824	f	schnitzi1
Yes we are on governors island @ligget terrace all day long come say hello governorsisland schnitzitruck schnitzel foodtruck kosherfood	1439744090	632958709954707457	f	schnitzi1
@the corner of 46 and 6 Ave serving lunch from 11:30-3 :30 order online @www.schnitzi.com schnitzitruck schnitzel foodtruck	1439477467	631840409484967936	f	schnitzi1
It's not too hot for a Schnitzi today, so come grub some sandwich or two @46 St bet 5&6 Ave, from 11:30-3:15 @www.schnitzi.com	1439387221	631461891748012032	f	schnitzi1
It's kind of raining outside so you can order online @www.schnitzi.com we are @46 St bet 5&6 Ave serving lunch from 11:30-3:30	1439302753	631107608557035521	f	schnitzi1
@hanover Sq serving lunch from 11-3 order online @www.schnitzi.com schnitzitruck schnitzel foodtruck  order in advance	1439215398	630741212857806849	f	schnitzi1
Truck open at 55th street and Broadway. Come!!!	1440759415	637217290598096896	f	carpedonutnyc
Open at 51st street and Park avenue. Come!!!	1440673649	636857562885980160	f	carpedonutnyc
Carpe Donut NYC T-Shirts for sale! $20 a shirt plus shipping. We have adult sizes small, medium, large and x-large. http://t.co/J7sSuDl7DL	1440622446	636642799438430208	f	carpedonutnyc
Carpe Donut NYC T-Shirts for sale! $20 a shirt plus shipping. We have adult sizes small, medium, large and x-large. http://t.co/LfMYgWWWbF	1440622312	636642237724643328	f	carpedonutnyc
Open at 23rd street and Park avenue south. Come!!!	1440587362	636495647819042816	f	carpedonutnyc
Open at Bergen and Court street. Come!!!	1440328945	635411767775117313	f	carpedonutnyc
Open at 55th street and Broadway. Come!!!!	1440155337	634683605122449408	f	carpedonutnyc
Open at 51st street and Park ave.Come !!!	1440069336	634322886854094850	f	carpedonutnyc
Truck open at 23rd street and Park ave south. Come!!!	1439982090	633956954122158080	f	carpedonutnyc
Truck open at Grand Army Plaza. Food truck rally. Come!!!	1439736418	632926530579079168	f	carpedonutnyc
Open @ Bergen and Court!	1439645076	632543412131110912	f	carpedonutnyc
Truck open at 55th street and Broadway. Come!!!	1439550888	632148359747387392	f	carpedonutnyc
Truck open at 51st street and Park avenue. Come!!!	1439461500	631773437992828928	f	carpedonutnyc
@amyreeder hi Amy the truck is closing now. How soon will you be here?	1439403566	631530445210021889	f	carpedonutnyc
Truck open at 23rd street and Park ave south. Come!!!	1439376642	631417520466055168	f	carpedonutnyc
Truck open at Bergen and Court street. Come!!!	1439118450	630334585549815808	f	carpedonutnyc
Open @ Bergen and Court	1439035917	629988414310481920	f	carpedonutnyc
Truck open at W56th street and Broadway. Come!!!	1438947181	629616230073298944	f	carpedonutnyc
Truck open at 51st street and Park avenue. Come!!	1438859588	629248836763058177	f	carpedonutnyc
Truck open at 23rd street and Park avenue south. Come!!!	1438772486	628883507343921152	f	carpedonutnyc
No words https://t.co/rLYABjAGtH	1440365254	635564060155711488	f	palenquefood
Palenque crew @ afropunk NYC  https://t.co/qemMrwblKk	1440335990	635441317808578560	f	palenquefood
Palenque Team ready for fooda @360i https://t.co/8h0aDwGUau	1439999376	634029453421756417	f	palenquefood
RT @gretchenzehner: @Farm2me: NYC:  GlutenFree + Multi-Grain Arepas at @PalenqueFood regram from @palenquefood Farm2NY http://t.co/rT6q...	1439947682	633812633414668288	f	palenquefood
Start your day off right with some delicious Colombian arepas at @GansMarket 	1439227291	630791097372016640	f	palenquefood
Palenqueritos working @rockawaybeach 97! Deliciosa and nutritious colombian Arepas https://t.co/8dMwfrEj37	1439136507	630410319731531776	f	palenquefood
@gansmarket nice and beautiful Day for an Arepa from Palenque, meta packing district https://t.co/pbbTgHCPi1	1439057059	630077093154562048	f	palenquefood
Palenque crew at Rockaway beach https://t.co/knKjfQY0a3	1439053098	630060478673387520	f	palenquefood
Just posted a photo https://t.co/7xe4Nnhzxn	1439040557	630007877772689408	f	palenquefood
@jearamvi hola Armando a que punto fuiste? Que comiste? Tenemos muy buena respuestas de colombianos, y de la diversidad de culturas de NY	1438864267	629268464704835584	f	palenquefood
RT @annietrimber: This glutenfree quinoa arepa changed my life @Palenquefood @UrbanSpaceNYC BwayBites http://t.co/YUWyaksN0Y	1437998966	625639128160411648	f	palenquefood
@UrbanoPasquale broadway bites 7corn arepa with jumbo shrimp! Just fresh & delicioso https://t.co/rrCDQW5mQk	1437502802	623558065632243712	f	palenquefood
@julia166 We open today until 8 pm. Let us know !	1437405713	623150846281404416	f	palenquefood
@julia166 sorry about that! We erre missing Two workers,  was really hard, pls come back We give you tour arepa for free next time :)	1437405612	623150421436186625	f	palenquefood
Were you @highlinenyc and it started raining? Come take cover @GansMarket and try a colorful arepa to beat this gray day	1436892798	620999521460453377	f	palenquefood
RT @jgmahoney: Muchas gracias, amigas; me gustan las arepas colombinas. @Palenquefood http://t.co/HOqr5XhNwY	1436194703	618071501930168321	f	palenquefood
What's more patriotic than the NewWhitney? Nothing really, how about paying it a visit and coming after to GansevoorMarket @Palenquefood	1436107952	617707639460466688	f	palenquefood
saboreando arepa de quinoa y pollo en la playa https://t.co/dhKHCUXlAY	1436050947	617468544125661184	f	palenquefood
4thofJuly has already started @theRockawaysNY, come join us for some arepas summer glutenfree homemade http://t.co/wiT81KssKs	1436033729	617396327484231681	f	palenquefood
Feeling traditional or Gallo? Come try our different arepas, start the long weekend with the right foot. glutenfree http://t.co/Ub11chC6ZL	1435936759	616989606303670273	f	palenquefood
Scream from the rooftops it's CHEESESTEAK FRIDAY folks ! Bdwy/ 55thst @randomfoodtruck @victoriasecret @UMG... http://t.co/87gol0SAtl	1440770706	637264648224436224	f	carlssteaks
We love Thursday ONE more day closer to the weekend! Old slip & water st till 3 30 @EmblemHealth @AIGinsurance... http://t.co/i3ITz7aPib	1440682683	636895451116109824	f	carlssteaks
Hey folks kicking off a new lot in midtown west called Shipping & Receiving on W33rd bet 8th/9th Av awesome space... http://t.co/RXlujypk1X	1440600477	636550657105752064	f	carlssteaks
Tuesdays mean brooklyn ! @dumbolot water st and jay st GOT WHIZ? nycsbest cheesesteaks for all! Here till 3 30 http://t.co/wueEbceqiW	1440513100	636184171942035456	f	carlssteaks
https://t.co/zO5cJzLdAX	1440453480	635934106925330432	f	carlssteaks
https://t.co/zO5cJA2Osv http://t.co/ePAcDHbM0G	1440452916	635931740272377860	f	carlssteaks
Start your week off right with a carls famous cheesesteak  hudson st / king st  @Medidata @WFAN660  WHIZ?... http://t.co/gLw6CIZeFf	1440427399	635824715471437827	f	carlssteaks
What a great 2nd day @ afropunk in brooklyn great music and great food so grab a carls famous cheesesteak GOT... http://t.co/VZ72v59Qve	1440349340	635497310617739264	f	carlssteaks
Great day @Yankees for Andy Pettite Day so come by grab a carls famous cheesesteak and enjoy the day GOT WHIZ? nycsbest	1440349256	635496958639996928	f	carlssteaks
Hanging @ afropunk in brooklyn all weekend great music and of course carls famous cheesesteaks GOT WHIZ? NYCSBEST http://t.co/v3BYKPqYpG	1440261280	635127960564051968	f	carlssteaks
Scream it from the rooftops it's CHEESESTEAK FRIDAY folks! Bdwy /56th st @randomfoodtruck @victoriasecret @UMG... http://t.co/yRWSX01LVS	1440166532	634730559101513728	f	carlssteaks
We love Thursday ONE day closer to weekend folks! Corner of Water st & Old slip great day to grab a carls famous... http://t.co/iFLaWg9X4T	1440080675	634370445995708416	f	carlssteaks
Happy hump day folks 47th st bet lex / park @MLB @nfl @UBSamericas @jpmorganchase @SIRIUSXM @SiriusXMNFL @MHFI... http://t.co/9gR0uoYiMT	1439996556	634017627296411648	f	carlssteaks
@infatuation thanks for the love hope to see you on the streets or at the stadium! ! http://t.co/CbFTeQXtmz	1439909954	633654390419619840	f	carlssteaks
@infatuation thanks for the love hope to see you one the streets or at the stadium https://t.co/HFbzVy1Dfk	1439909872	633654049263460352	f	carlssteaks
It's DUMBO TUESDAY FOLKS! @dumbolot Jay st & water st. GOT WHIZ? nycsbest cheesesteaks for all http://t.co/4YKyzGIyhj	1439908793	633649521118052352	f	carlssteaks
Start your Monday off right with a carls famous cheesesteak hudson st / king st GOT WHIZ? nycsbest cheesesteaks... http://t.co/yBunBE9wx4	1439823768	633292902270111744	f	carlssteaks
Scream it from the rooftops it's CHEESESTEAK FRIDAY folks! 56th st / Bdwy @randomfoodtruck @victoriasecret @UMG... http://t.co/ibB9UA0zdP	1439563492	632201226579390466	f	carlssteaks
Update folks @carlssteaks had to move across the street to 10 Hanover sq see you there @EmblemHealth @AIGinsurance	1439478722	631845676066836480	f	carlssteaks
We love Thursday ONE day closer to the weekend! so stop by old slip and water st & grab a carls famous... http://t.co/IPp1o9pLPB	1439474795	631829202661191680	f	carlssteaks
RT @CenterplateNYRA: @mactruckny is serving up some delicious looking bacon egg Mac & cheese!! Stop by to see @ChefDomTes Pharoahtoga http...	1440772182	637270837498937344	f	mactruckny
@ohmymed wow who told you about that!?!? I did it twice a very long time ago! It was pretty awesome.	1440631718	636681691373928448	f	mactruckny
@TheJohnLanders in Saratoga till labor day brotha.	1440631662	636681453946974208	f	mactruckny
RT @CenterplateNYRA: Join us Friday morning at 8:45AM to watch AmericanPharoah warm up! We will be serving breakfast favorites at the fini...	1440527192	636243275008053248	f	mactruckny
RT @mcozine: Champagne toast: done. Betting/ done. Up next: mac and cheese from @mactruckny! tradition saratoga @TheNYRA	1440292780	635260079017717760	f	mactruckny
Started a new official page for me on Facebook, head on over and follow! https://t.co/8xMDE1Le9k	1439295894	631078836302663680	f	mactruckny
RT @ChefDomTes: Just puttin this out there.. Choose at your own discretion http://t.co/PeMsCfUnRo	1438828635	629119012518109185	f	mactruckny
RT @ABRLive: New Q&A with horseracing fan, @mactruckny owner and @FoodNetwork star Dom Tesoriero: http://t.co/wRhy5b9aQf http://t.co/eY75J...	1438792371	628966908612734977	f	mactruckny
RT @itsmevictoriag: Q&A With Mac Truck, @FoodNetwork Star's Dom Tesoriero \nhttp://t.co/yaaqlFCzUh goodeats saratoga  http://t.co/RTLVHbH...	1438780648	628917739449634816	f	mactruckny
RT @RobWBailey: Is @ChefDom's FoodNetworkStar rising again? StarSalvation StatenIsland Machead @mactruckny http://t.co/wQxqKexcAb http:...	1438778554	628908956904239105	f	mactruckny
RT @ChefDomTes: truth getbackinthesaddle lifeisgrand goforit http://t.co/Pp0uJFqoqv	1438361884	627161315556130816	f	mactruckny
RT @nhartOn10: SO fun interviewing @FoodNetwork star @ChefDomTes at his MacTruck at the @saratogatrack. Great guy, very humble! http://t.c...	1438361881	627161303057100800	f	mactruckny
RT @ScoutologyBosMA: Help Decide The NYC Food Truck Fight! Vote Now! @ScoutologyNYC @KimchiTruck @LangosTruck @SweeteryNYC @mactruckny \n\nh...	1438361866	627161241321123840	f	mactruckny
RT @ChefDomTes: Fresh batch of fanmail from my little buddies at the Yates summer reading program adorable http://t.co/KmUcRHxS1m	1438268726	626770582655369216	f	mactruckny
RT @ChefDomTes: Enjoying a quiet moment before another busy day here at saratoga dominooch FoodNetworkStar http://t.co/IK89HSbNon	1438268722	626770568025665536	f	mactruckny
A hot day in Saratoga!! But that not gonna stop these macheads from gettin that goodness!!! @ChefDomTes http://t.co/mnza6HcOge	1438182538	626409085462806528	f	mactruckny
RT @ariannameli: I'm rooting for you @ChefDomTes! @mactruckny FoodNetworkStar FNS	1438000616	625646049840001024	f	mactruckny
@_buddhamama currently at Saratoga until laborday!!	1438000610	625646025131339776	f	mactruckny
Awesome article from the Times Union!!! http://t.co/MIis4sfvl4	1437847945	625005701652422656	f	mactruckny
@StarJaveria there will be a hot bowl of Mac n'cheese waiting when you get there!!!!	1437788783	624757554313347072	f	mactruckny
@dchiuable  Sorry to inform you that we are closed for the season. Please keep following us for our return in March 2015 :)	1419358370	547454803237154823	f	funbunsnyc
RT @dchiuable: @funbunsnyc are u guys around midtown by any chance? Thx!	1419358342	547454684131516416	f	funbunsnyc
Happy thanksgiving weekend everyone.  \nShooting our first commercial in midtown. http://t.co/l28iw4YIB2	1417201536	538408385516146689	f	funbunsnyc
Last day to get your favorite buns this year at 50th st between 6 / 7 ave midtown Happy Halloween everyone	1414768000	528201392755081217	f	funbunsnyc
On the block on 50th st between 6 / 7 ave.  In front of the Time and Life building.	1414681696	527839409010667521	f	funbunsnyc
Finishing the season where we started on 50th st between 6 / 7 ave midtown\nLast week to get your favorite pork buns and beef bowls.	1414593220	527468313577017344	f	funbunsnyc
http://t.co/PTTJwYHom8	1414163207	525664709161525248	f	funbunsnyc
We are back on 50th st between 6 / 7 ave midtown serving up lunch. \nFree tea egg with any rice. http://t.co/YK51uFhzJT	1414159715	525650062790361088	f	funbunsnyc
Sorry we are having cart issues, will update on return to streets !	1413587239	523248923335733250	f	funbunsnyc
@lorrain12  Not today, but we have Porkbelly Buns !	1413251448	521840513583161345	f	funbunsnyc
Back on 50th st between 6 / 7 ave midtown http://t.co/MpR6wSD5oN	1412866550	520226133623988224	f	funbunsnyc
Infused Brown Butter Lobster Bun ! http://t.co/Z5n5fpK4jU	1412812813	520000746419679232	f	funbunsnyc
@DANGERTAM yes sad indeed but tomorrow we will be in midtown on 50th st between 6 / 7 ave.  We will try to return soon. See you then thanks	1412807824	519979819040534528	f	funbunsnyc
blendonthewater's photo http://t.co/XmwftfNKg5	1399055250	462297345276010496	f	blend_express
Thank you @dumbolot @DUMBOFoodTrucks for our welcome in Dumbo !!! Sold out early, hopefully we can come back soon !	1412807534	519978601660571648	f	funbunsnyc
@ohtruth If we find it well contact you	1412807436	519978193881931777	f	funbunsnyc
@ohtruth I'm sorry but we did not find your card.	1412807170	519977075382706176	f	funbunsnyc
Parked @DUMBOFoodTrucks in the lot on\nJay st / water st Brooklyn till 230pm http://t.co/4Wur1ywIBE	1412781784	519870598856859648	f	funbunsnyc
RT @dumbolot: Sorry @DomoTaco won't be joining us today. Instead we got the @funbunsnyc cart joining us for mad fun bun!	1412780139	519863700954836993	f	funbunsnyc
@The_Levich yesssss	1412351079	518064090582093824	f	funbunsnyc
Thanks to nicolescherzinger for stopping by http://t.co/8I6vGTbADC \n50th st between 6 / 7 ave midtown lunch . FREE Tea egg with any rice	1412349560	518057723506982912	f	funbunsnyc
@redzonefresh yes!!!!!	1440794036	637362503006199808	f	nautimobile
@redzonefresh we have a shop in Hoboken or all over Manhattan? Philly too!	1440688566	636920126890213376	f	nautimobile
RT @TFQfoodtruck: sundayfunday @Pier_13Hoboken with @NautiMobile @PVPIZZATRUCK @Aroy_D @waffledelys @AmandaBananasNJ @themoofoodtruck myp...	1440348343	635493127986520066	f	nautimobile
Play the blues if it'll make you happy. Pier 13 all day today! It's beautiful out, don't sit around like a dufus. http://t.co/vN0bOkvfvz	1440341026	635462439178477568	f	nautimobile
Golf fans! We will be at the PGA Barclays all next week! Look for us on the 15th hole thebesthole golfclubs golfbags etc	1440085959	634392611445469184	f	nautimobile
@IraGeneGoodman Thanks for having us! We will be back, spread the word!	1440042818	634211664301305856	f	nautimobile
I'm not a schmuck. Even if the world goes to hell in a handbasket, I won't lose a penny. Donald Trump  .. Pier 13 in Hoboken today!	1439741514	632947903636611072	f	nautimobile
Pier 13 today with our favorite trucks and people in the world. @AmandaBananasNJ @PVPIZZATRUCK @OINKandMOObbq @themoofoodtruck @waffledelys	1439654682	632583704645378049	f	nautimobile
RT @AmandaBananasNJ: Lobster rolls, craft beer and Amanda Bananas...sounds like a perfect Saturday! @NautiMobile @Pier_13Hoboken http://t.c...	1439065447	630112273512706048	f	nautimobile
Pier 13 today. What are YOU doing today? We would love if you joined us.	1439057930	630080744669474816	f	nautimobile
RT @AmandaBananasNJ: We're at @Pier_13Hoboken with @PVPIZZATRUCK @NautiMobile @OINKandMOObbq @waffledelys @themoofoodtruck @EmpanadaGuy1 H...	1439057902	630080625542873088	f	nautimobile
@tbaker4u we are no longer running in Manhattan. We do have locations scattered all over the city thought!	1438976691	629740004500226048	f	nautimobile
Come meet new teammate Aly at pier 13 today! She likes orange. Don't mind Ben in the back, he likes to horse around. http://t.co/NqlEDUf6Sa	1438540685	627911263738269696	f	nautimobile
@mikewaskom we feel ya http://t.co/1leeClJEbJ	1438540421	627910156131651585	f	nautimobile
@MyIndirectTaxRo the truck has permanently moved to nj! Pier 13 in Hoboken on the weekends, private events during the week	1438024318	625745462730063872	f	nautimobile
@ScoutologyNYC @Scoutology a good number of the truck on your list aren't even food trucks in ny anymore..	1437930749	625353006473703425	f	nautimobile
Come watch Manhattan be the sweaty, crowded, wonderful place that it is from afar, here at Pier 13 Hoboken. Rollin' until 10pm!	1437930620	625352462157905920	f	nautimobile
@ReesaGlassman we post them here. However the truck no longer runs in Manhattan.	1437768529	624672605941989376	f	nautimobile
@ReesaGlassman off the road today!	1437697101	624373014122074112	f	nautimobile
Welp it's perfect weather today. Turn off those real housewives, get off the couch and come outside. Pier 13 today.	1437325413	622814041216544769	f	nautimobile
Kasar truck is in soho, broadway and prince street	1437241508	622462117019385856	f	chipsykingny
Flemish Beignets :: Coming this monday :: http://t.co/5nKpzhKu70	1437171978	622170487116857344	f	chipsykingny
New addition to our menu, Belgian Dumplings http://t.co/dPUSKyD9uM	1437171897	622170149659893760	f	chipsykingny
Our new menu, as of monday. We hope everyone enjoys these additions. http://t.co/GGdR0WzM1S	1437171832	622169875281121280	f	chipsykingny
Kasar truck is at 46th and 6th avenue until 7pm	1436448508	619136035667099648	f	chipsykingny
Kasar truck is at 33rd and park ave, until 4pm	1436202743	618105223928623105	f	chipsykingny
Kasar truck is in soho\nBroadway and spring street until 6pm and at Christopher and 7th avenue until 4am	1436027582	617370543826677760	f	chipsykingny
Kasar truck is at Christopher street and 7th avenue, until 4am	1435961229	617092238439354368	f	chipsykingny
Kasar truck is at 33rd street and park avenue until 5pm	1435767334	616278986029531136	f	chipsykingny
Kasar truck is in Soho, Broadway and spring street until 6pm	1435512651	615210765205684224	f	chipsykingny
Kasar truck will be at Christopher and 7th avenue from 8pm until 3am	1435345846	614511136184991744	f	chipsykingny
Kasar truck is at 46th and 6th avenue\nUntil 7pm	1435324019	614419584662114305	f	chipsykingny
Kasar truck is at 52nd and park avenue until 6pm	1435245717	614091163952254980	f	chipsykingny
Kasar truck is at union square \nUntil 5pm	1435065878	613336862891978753	f	chipsykingny
Kasar truck is at park avenue and 33rd street until 4pm	1434979460	612974399528906752	f	chipsykingny
Kasar truck is in Soho, Broadway and spring street	1434806172	612247580429320193	f	chipsykingny
Kasar truck is at Christopher and 7th avenue until 4am	1434761152	612058749423910912	f	chipsykingny
Kasar truck is at 33rd and park avenue until 4pm	1434547311	611161838185611264	f	chipsykingny
Kasar truck is in soho, Broadway and spring street until 6 pm	1434295554	610105890910253058	f	chipsykingny
Kasar truck is in Soho, broadway and spring street until 8pm, and at seventh avenue and Christopher until 4am	1434205183	609726849581608960	f	chipsykingny
RT @ScoutologyNHvCT: Help Decide Who Has The Best Food Truck In NYC! @ScoutologyNYC @PontiRossiFood @KorillaBBQ @mactruckny \n\nhttp://t.co/...	1440769870	637261139760553984	f	pontirossifood
Come meet us for sunshine & PontiRossiFood at shippingandreceiving. 33rd&8th FoodTrucks authenticitalianfood http://t.co/Chkc5vjVIo	1440716038	637035355364048897	f	pontirossifood
@DenaPaduano maybe soon..We planning to move to Cali. If you around pen plaza tomorrow call us we would love to take a group pic with you !	1440459054	635957483878674433	f	pontirossifood
@EmpanadaGuy1 a true entrepreneur.Such an inspirational person thanks Freddy hope to c u soon ! workhard playhard http://t.co/3xnpoBx2yE	1440457614	635951445708283912	f	pontirossifood
@DenaPaduano ciao Amica unfortunately tomorrow we won't go out as we have a corporate catering. We apologize. Will you be in town Wednesday?	1440457130	635949413240803328	f	pontirossifood
@DenaPaduano allora parli italiano!  martedi Wall Street all'angolo di water st & old slip! Ti aspettiamo	1440365354	635564479816835073	f	pontirossifood
@DenaPaduano we building a new website so I guess the admin took it down.Tuesday will be in Wall Street at the corner of water st&old slip	1440365284	635564186685280257	f	pontirossifood
@DenaPaduano will you be in town Tuesday?We looking forward to see you !Call 347-506-9616 for info. Soon will send the truck to Cali!Ciaoooo	1440365227	635563945500221440	f	pontirossifood
@DenaPaduano ciao Bella, domani Monday 24th we will take off as we just finished an event in south jersey and we are completely destroyed !	1440365141	635563584106463232	f	pontirossifood
RT @DenaPaduano: @PontiRossiFood @PontiRossiFood where will you be located on Monday??	1440365077	635563318007197696	f	pontirossifood
Come get your lunch in dumbo @dumbolot authentic Italian food made daily by Italians ! 347-506-9616 pre order your pasta if in a rush 	1440172682	634756353416892417	f	pontirossifood
habemus oven @robertoizzo1 http://t.co/wm3rLajQoi	1439586172	632296353679429633	f	pontirossifood
Neapolitan pizza cooked with electric oven that tastes the same as the wood fire oven? Now YES thx to @robertoizzo1 check us at @PennPlates	1439580813	632273875913547776	f	pontirossifood
@dumbolot we won't be at dumbo @bigdsgrub is subbing for us. See you next Friday	1439570342	632229957343793153	f	pontirossifood
Are you excited for @RoyalPalmsClub 12 pm to 1 am come get your pastaaaaa ! pasta italianfood	1439049138	630043868457750528	f	pontirossifood
RT @dumbolot: Happy Friday with @mamuthainoodle @bigdsgrub and @PontiRossiFood	1438961654	629676931710087168	f	pontirossifood
It's official we will be serving Neapolitan pizza in pen plaza using an electric oven from Napoli, Italy. izzoforni pizza FoodTruck 	1438801970	629007172098244608	f	pontirossifood
RT @explorebrooklyn: Food trucks in Brooklyn: @santasalsanyc, @PontiRossiFood, @ConeyShack, and more http://t.co/1cb6kJq9LB eat http://t.c...	1438281518	626824235021922309	f	pontirossifood
Ciao BLDG 92 we would love to bring our food to you. How can I reach out to someone in charge? Thanks much	1437926260	625334176997314560	f	pontirossifood
Hey people vote for us in the best NYCFoodTrucks contest via @scoutology http://t.co/OovbzOiOs0	1437868034	625089960954208256	f	pontirossifood
RT @njlauritawinery: We kick off the return of LauritaIdol at the winery in 3 hours! Join us as a contestant or as a guest! http://t.co/1d...	1428064651	583971589881995264	f	hibachiheaven
@mpooz44 we apologize but due to some truck problems we will be off the road for a couple of days	1424714772	569921179433086976	f	hibachiheaven
RT @njlauritawinery: It's officially Ice Sculpture Festival Week!!\n\nJust FIVE DAYS left until the big event!! This weekend will be... http:...	1424114795	567404695560265730	f	hibachiheaven
TGIF midtown we are on 46th between fifth and sixth Avenue. Open 11:00 to 2:30	1423835335	566232555482259457	f	hibachiheaven
RT @Candice243: Yassss I ate my heart out!! @hibachiheaven  http://t.co/4mlfb8AZN9	1423774584	565977745625468928	f	hibachiheaven
Open and ready to roll corner of Varick and King	1423759572	565914778452115456	f	hibachiheaven
Good morning NYC we are on the corner of Varick and King and will be open 11:00 to 2:30	1423745263	565854765666799617	f	hibachiheaven
@FeelzLikeHipHop we will be on 46st on Friday	1423671661	565546055337803776	f	hibachiheaven
We are open for lunch 5th Ave and 21st. Come get some beef with wasabi	1423671358	565544784874733568	f	hibachiheaven
RT @tommyrock: Just spotted the @hibachiheaven truck outside my office. Counting the hours til lunchtime.	1423671180	565544038502526976	f	hibachiheaven
Good morning NYC we are on the corner of fifth Avenue and 21st St. Yumyum	1423661311	565502645256089600	f	hibachiheaven
Hey Midtown we are Open and ready to roll so come get your ginger on.	1423585492	565184636238970880	f	hibachiheaven
good morning Midtown we are on 46 between fifth and sixth come get your yumyum	1423573285	565133435979964416	f	hibachiheaven
@frogfisherman we are off the road today	1423501658	564833008977727488	f	hibachiheaven
RT @njlauritawinery: It's officially Mardi Gras weekend at Laurita Winery!!\n\nCome on down today & tomorrow for amazing Cajun cuisine,... ht...	1423325430	564093855474020352	f	hibachiheaven
Thanks for a great week NYC have a great weekend see you Monday	1423252825	563789330007609344	f	hibachiheaven
Good morning NYC we are on 46  & 6 from 11:00 to 2:30	1423229862	563693015533768704	f	hibachiheaven
RT @LinzyPiinzy: http://t.co/dOWiRc2qny	1423058207	562973041945501696	f	hibachiheaven
Hey NYC we are parked on the corner of 5th Ave and W 21st ST. Open 11:00 to 2:30 come get your yumyum	1423055781	562962868212346880	f	hibachiheaven
Good morning midtown we are on 46th St. between 5th & 6th ave. Open 11:00 to 3:00	1422964989	562582057956560896	f	hibachiheaven
Happy Fryday! We're servin up the best Southern style fried chicken in NYC! Come to 46th St. b/w 5th & 6th Ave. n get you some! YDD	1440775832	637286149418053632	f	usafoodtruck
@jschenck hey Justin---sorry about that we'll work to make sure that doesn't happen again. Thanks for the feedback. pursuitofexcellence	1440709393	637007482511077376	f	usafoodtruck
@WilliamEttenger hey William--they were filming a movie downtown today so we were forced to vacate our normal spot. We'll be back Tuesday.	1440709349	637007296787259392	f	usafoodtruck
@WilliamEttenger sorry my man! There was a filming in Hanover Square which blocked parking! We'll be back on Tues. & at Gov. Island Sat-Sun	1440699726	636966937403260928	f	usafoodtruck
Y'all need to come on down to 47th & Park to get your chicken fix for the day! YDD American	1440687511	636915702453116928	f	usafoodtruck
@johnniboi31 thanks Jonathan! Love the support! Means so much cause we work really hard to put the best stuff on the street	1440646199	636742428343578624	f	usafoodtruck
RT @johnniboi31: @USAFoodTruck did not disappoint Foodporn http://t.co/HfJU4WHGeR	1440646168	636742295715475456	f	usafoodtruck
@ERoth340 thanks for the love! Keep spreading the good word about our chicken brotha! See you soon! quality delicious murica	1440646159	636742261754195968	f	usafoodtruck
RT @ERoth340: @USAFoodTruck Yankee Doodle was just what I needed today. winnerwinner bestchickentenders	1440646130	636742137233719301	f	usafoodtruck
@USAFoodTruck &lt;3 @afropunk we had soooo much fun being a part of AfroPunk 2015! Great vibes! Great people! See you in 2016! Brooklyn usa	1440630147	636675102587912192	f	usafoodtruck
46th Dt. b/w 5th & 6th Ave. is the move today! Come get lunch for: you, your coworkers, or heck, the entire office! YDD chicken	1440601131	636553398934966272	f	usafoodtruck
Hanover Square, come get the MOST succulent chicken tenders you will ever have! We're on Hanover Sq. & Water St. YDD American foodtrucks	1440514533	636190180165197824	f	usafoodtruck
@johnniboi31 hey Jonathan-sorry to disappoint! We were off the street to make repairs to the truck, but we'll be back soon.	1440448574	635913529921544197	f	usafoodtruck
RT @filmgeek15: Photo: My Afropunk is.... delicious! Met the owner of @usafoodtruck! Chicken is usually boring to me... http://t.co/d4SSN8d...	1440448526	635913328263569408	f	usafoodtruck
RT @johnniboi31: @USAFoodTruck when are you guys coming to 46 street b/w 5 and 6 ave? I hope tomorrow. I was disappointed to not see the tr...	1440442864	635889579917213697	f	usafoodtruck
Happy Monday everyone! Or is it?!  We had the best time at @afropunk this weekend, thanks guys! ... https://t.co/rh5MQ7RDCt	1440442528	635888170253598720	f	usafoodtruck
Round 2 @afropunk today! @LennyKravitz is gonna rock the show while we rock the food game with the best chicken tenders in NYC Afropunk 	1440344535	635477156257210368	f	usafoodtruck
We've got the best chicken in NYC at Afropunk! Come and get it fresh hot n juicy! Afropunk nyc friedchicken	1440263644	635137876863401984	f	usafoodtruck
Betsy is in Hanover Square today with the best chicken tenders you'll ever have. Hot, fresh, crispy, and delicious from 11-3. bestchicken	1440082385	634377621678243840	f	usafoodtruck
@BradDanielCohen thanks brad. Glad you liked them. We'll be back!	1440021637	634122823376703488	f	usafoodtruck
Check out Toast Monster on Korean TV show: \nhttp://t.co/hM2ad1OAJM	1428680926	586556433107394560	f	toastmonsternyc
@jack_of_knaves Looks great! Can't wait to see more.	1425314475	572436516129132545	f	toastmonsternyc
@jack_of_knaves also http://t.co/JWTNKENR9H is very awesome.	1425314193	572435332957913088	f	toastmonsternyc
@jack_of_knaves Herros! Good mornings! Regrettably, we are not back.	1425314163	572435209674756098	f	toastmonsternyc
http://t.co/KiM4LqdgDl	1425313099	572430745106554880	f	toastmonsternyc
RT @ConesBrigade: Dear @toastmonsternyc where are you?Please find your way back to midtown. I miss you. Life just hasn't been the same with...	1424927219	570812247452332032	f	toastmonsternyc
Dear @ConesBrigade Thanks, we appreciate the love. We hope to be back soon. Sending tweet and post card from the Moon http://t.co/SJvPmhgxGa	1424927012	570811378715500544	f	toastmonsternyc
@jimmykimmel is the true that you are part of a team much like the Marvel Avengers? If so, what is your super power?	1424475386	568917120303681536	f	toastmonsternyc
Follow @toastmonster_kr for more toastmonster monsterness!	1424432240	568736154155134977	f	toastmonsternyc
Here's a remix of the song played on top of Toast Monster cart.\nhttps://t.co/B4VuwcFhKD http://t.co/qz9EWw3yys	1423942804	566683312752979969	f	toastmonsternyc
Good memories on 50th and 6th. Thank you craigontoast. toastmonster loves you too. http://t.co/ZkExnksXKw	1423925262	566609736620339201	f	toastmonsternyc
RT @TheGRAMMYs: Congratulations to Album Of The Year Winner @beck! http://t.co/RHYlQN0NMz	1423493329	564798076515528704	f	toastmonsternyc
Derek visits Toast Monster! Read all about it here:\nhttp://t.co/mKtjKxTL89	1421696789	557262841728602112	f	toastmonsternyc
Toast Monster New York is making music, film, video games. Visit Toast Monster in Korea for your toasted Sammie fix. http://t.co/QrzGgWwgvB	1421109128	554798013223559168	f	toastmonsternyc
thewindblows thecloudshowl thetumbleweedrolls peaceismakingway	1420545818	552435320185421824	f	toastmonsternyc
Thank you to you who bring bread to make toast. Both the same difference in this land. \nTis as far as I can reach. I submit to your defeat.	1420374830	551718142347862016	f	toastmonsternyc
Happy new year @gofooda !	1420095743	550547567374000129	f	toastmonsternyc
Herro New York @gofooda friends family. Thank you for blessing Toast Monster with your support. Hope you have a toastie holiday. Rawr.	1419367750	547494142264483840	f	toastmonsternyc
Ten.	1418358672	543261762296889344	f	toastmonsternyc
@gofooda 	1417825512	541025529722580992	f	toastmonsternyc
Happy Phil's Phriday everyone! The Jawn is on 51st and Park until 2. Hope to see you! Have a great weekend - last... http://t.co/otw5uRbnfu	1440775276	637283816541847553	f	philssteaks
52nd and 6th today 11-3.	1440687414	636915295085441024	f	philssteaks
A beautiful Whiz Wednesday to you! 41st between 6th and Broadway from 11-3. Make it happen!	1440601619	636555445323341824	f	philssteaks
47th and Park - make it a tasty Tuesday with a steak from the Jawn. 11-3	1440506044	636154573086814208	f	philssteaks
Very happy to be back at @afropunk this year! Commodore Barry Park near the Navy Yard in BK baby. All weekend long!	1440259484	635120429364060161	f	philssteaks
You know the Jawn is on 52nd between 6th and 7th. You know we'll be rocking 11-3. Now, all that's left to do is come thru!	1440080455	634369526558289921	f	philssteaks
Weather is cooler for this Whiz Wednesday. Get out and hit the Jawn! 11-3 at 41st between 6th n Broadway	1439996665	634018085519933440	f	philssteaks
51st and Park today 11-3	1439910785	633657877442494464	f	philssteaks
This is what August is supposed to feel like! Man up and swing by for a Whiz Wit'. You'll be back inside in minutes. 47th Park/Lex 11-3	1439823577	633292102735134720	f	philssteaks
It's a foodtruckrally @prospect_park today from 11-5 at Grand Army Plaza! See you there! @dispatchny	1439736236	632925766519492608	f	philssteaks
Private event today so Phil's Phriday resumes next week. Come see us Sunday at Grand Army Plaza 11-5. Have a great weekend!	1439564445	632205223214362624	f	philssteaks
Beautiful day. Get outside! 52nd n 6th til 3.	1439480606	631853578106355713	f	philssteaks
It's Whiz Wednesday! 41st between 6th n Broadway 11-3 http://t.co/xVHj2YwzyC	1439388482	631467180043968512	f	philssteaks
51st n Park today 11-3	1439304544	631115116583518209	f	philssteaks
Not motivated this Monday? Mosey on down to the Jawn for a pickmeup. Rocking at 47th between Park/Lex 11-3. Get your Phil!	1439216786	630747033851273217	f	philssteaks
RT @Lovin_Trends: 9 Street Foods In New York That You Must Try Before You Die: http://t.co/rtmqfzH36h http://t.co/Lv5dUPpJ14	1438968226	629704497611337728	f	philssteaks
RT @ChrisSandstrom8: @PhilsSteaks is playing @ATCQ Scenario Remix while slinging dope steaks. Perfect Friday lunch.	1438967996	629703533726683136	f	philssteaks
Phil's Phriday at 51st n Park 11-2	1438960199	629670830633549825	f	philssteaks
Beautiful TBT to get outside and grab some food truck eats! The Jawn is on 52nd between 6th n 7th from 11-3. See you there!	1438870684	629295379029327872	f	philssteaks
Throw some Whiz on that steak! Whiz Wednesday is here again! 41st between 6th and 7th 11-3	1438786370	628941740398014464	f	philssteaks
Find us tomorrow from 12p-1a @RoyalPalmsClub! ShuffleButter\n\nStarting Monday we'll be @usopen all day, next to Court 17!	1440781555	637310151511416832	f	morristruck
RT @LevyRestaurants: The grilled cheese from @MorrisTruck was such a hit last year that we brought it back for 2015. FlavorOfTheOpen http:...	1440777164	637291736033828864	f	morristruck
Truck is getting a little TLC before the @usopen next week, but we'll be @RoyalPalmsClub Saturday from 12p-1a for all your CheeseNeeds!	1440518652	636207455270236161	f	morristruck
It's grilled cheese o'clock here @lauritawinerynj perfect day for wine cheese and sangriaslushies	1440340840	635461658496921601	f	morristruck
Just in case you wondering, we're waiting for you on Charlton and Varick!!!	1408708562	502786268183691264	f	blend_express
Let's raise a glass to this gorgeous day @lauritawinerynj ! Can't wait to feed ya! wine newjersey brucespringsteen	1440256262	635106914905497600	f	morristruck
We'll be making a guest appearance in Yankee Stadium tonight serving in the Delta Suite Club! Yankees praisecheeses perfectcombo	1440170632	634747755655790592	f	morristruck
It's almost lunch time at metrotech downtown brooklyn! We'll be slinging grilled cheese 11:30-3 see you there!	1440083124	634380718886506496	f	morristruck
What are you doing tonight? Going to the countingcrows show on pier97 ? Us too! Let's hang out praisecheeses	1439910282	633655769095868416	f	morristruck
One more hour of Free Cheese @CoronaPlazaNYC with @ATT! NothingICantDoATT GoPhone	1439493144	631906165044084736	f	morristruck
Dont miss out! We're giving away grilled cheese @CoronaPlazaNYC from 12-4 with @MobilizeNYC & ATT! NothingICantDoATT	1439487882	631884092359970816	f	morristruck
.@CoronaPlazaNYC is where well be btwn 12-4 today- teaming up with @ATT to bring you Free grilled cheeses! NothingICantDoATT	1439472341	631818909230989312	f	morristruck
Find the cart today @DowntownBklyn Metrotech Commons at Lawrence St! 11-3, with some tasty new housemade soda flavors!	1438873287	629306295091380224	f	morristruck
Schedule this week! W:Pier 97 @SublimeWithRome 5-10p Th:Metrotech-Lawrence St @DowntownBklyn 11-3p Wknd:Closed for private events EATCHEESE	1438708996	628617210882334720	f	morristruck
FindUsThisWeek: Fri @DowntownBklyn GroveAlley 5-11pm, Sun @RoyalPalmsClub Championships & @HighLifeP SecretSummer Festival!	1438185210	626420292139753472	f	morristruck
RT @Lovin_Trends: 9 Street Foods In New York That You Must Try Before You Die: http://t.co/rtmqfzH36h http://t.co/Lv5dUPpJ14	1438137356	626219579065389056	f	morristruck
Last call! It's the final day over at BwayBites! Thank you everyone for a great 8 weeks!	1437923341	625321933253554176	f	morristruck
Shop will remain closed this weekend, and truck is at private events, but make sure you get over to BwayBites for the final days!	1437775537	624701998936555520	f	morristruck
It's the last TGIF here at BwayBites, come and eat & drink like you mean it! @UrbanSpaceNYC @34thStNYC	1437753063	624607736743899136	f	morristruck
RT @EsfiroAzul: @morristruck @BroadwayBites just made my lunch break. Try The Mona... Amazing! Good friendly folks too! http://t.co/tj0JAaL...	1437668931	624254862142914560	f	morristruck
We've got your lunch covered today, @DowntownBklyn! Truck is at Lawrence St slingin cheese until 3pm today! GetFed	1437667297	624248008406925313	f	morristruck
!!Good Morning & Happy Monday!! We're on vacation, but treats are still available for delivery! Call 212-691-5226 or info@treatstruck.com	1439213131	630731703619858432	f	thetreatstruck
!!Happy Tuesday!! Our truck is still on summer vacation but if you crave some sweets, call or email us for a delivery of treats!!	1438102346	626072734880124928	f	thetreatstruck
!! Happy Monday !! Our truck is on summer vacation but you can place a special order. \nCall 212-691-5226 or email us info@treatstruck.com	1437406977	623156145537032192	f	thetreatstruck
Happy Thursday! Our truck and shop are on summer holiday, but we're still taking special orders. Contact us at info@treatstruck.com!!!!	1437066216	621726890550775808	f	thetreatstruck
Happy Summer everyone!!\n\nOur truck is on vacation!\nBut, If you're craving a delicious treat we're still taking... http://t.co/O7cgCCvTJK	1437065939	621725728183349248	f	thetreatstruck
!!!! Our truck. & shop are closed for the holiday weekend! Have a wonderful holiday, everyone!!!	1435938326	616996178815811584	f	thetreatstruck
@NicoleMerino8 today's spot at 18th was 1-2:30 & then 4-7pm Bway! Wish we could be at both right now for you!	1435874180	616727129347223552	f	thetreatstruck
@NicoleMerino8 Bway (86th & 87th) 'till 7pm!!!	1435872207	616718852584411137	f	thetreatstruck
!!! On Bway (86. & 87th) 'til 7pm!!!	1435867244	616698035582545920	f	thetreatstruck
Our truck will be on vacation after today for 6 weeks! You can still order for deliver, shipping or pick up at our bakery!!!	1435858290	616660483660251136	f	thetreatstruck
!!! Thurs, July 2nd 1-2:30 18th st & 7th ave! Then 3:30ish-7pm Bway (86 & 87th)!!!	1435856136	616651447778869248	f	thetreatstruck
!!! 4-7pm 18th st &7th ave!!!	1435781190	616337099206316032	f	thetreatstruck
@hellodontmindme we just take cash at the truck!	1435767786	616280880148054017	f	thetreatstruck
!!! Wed,July 1st 12-3:30 45th st & 6th! Last day on 45th before our summer break! Come on by! Then 4ish-7pm 18th st & 7th ave!!!	1435762655	616259361271336960	f	thetreatstruck
This week we were planning on 45th& 6th both Wed&Thurs, but there is a tv crew on Thurs, so looks like just Wed!	1435762554	616258937642426368	f	thetreatstruck
@hellodontmindme yes sireee!!!	1435762411	616258334606401538	f	thetreatstruck
!!! Happy Pride!!!!  lovewins all50states	1435511202	615204690087780353	f	thetreatstruck
@notrossgeller_ we'll have spots next week. Wed&Thurs!!	1435404295	614756288703143936	f	thetreatstruck
!!! Truck spots next week Wed/Thurs!! Deliveries all the time, too!  Have a great weekend & see you next week!!!	1435325962	614427737403617280	f	thetreatstruck
3:30-7pm Bway (86 & 87th)!!!	1435261071	614155562939498497	f	thetreatstruck
Retweeted Brooklyn United (@brooklynunited):\n\nOur top 3 @TheSteelCart offerings, in memoriam: 1. Hole-in-one eggs... http://t.co/H6Q98DJ2b2	1436887174	620975933969825792	f	thesteelcart
RT @brooklynunited: Our top 3 @TheSteelCart offerings, in memoriam: 1. Hole-in-one eggs 2. Grits and gorgonzola 3. Homemade Turkish coffee....	1436887170	620975918060847104	f	thesteelcart
@vllg Miss you guys! Thanks for letting us feed you. Best of luck next year with the Habs!	1432226274	601426701168574464	f	thesteelcart
@puzzzl Thanks so much Andy. We'll miss you.	1431019828	596366499587174400	f	thesteelcart
@Peppage Aww!  We'll miss you.	1431016978	596354545636237312	f	thesteelcart
We'll miss you!!! Endless thank-you's to you all. Catering inquiries or if you'd like to keep in touch email us at thesteelcart@gmail.com.	1431010112	596325750208405504	f	thesteelcart
Dear friends of Dumbo & Midtown! Upon heavy contemplation in the face of many obstacles, we've decided to move on from the sidewalks...	1431010094	596325675935629312	f	thesteelcart
@citystitchette Hi Patricia! We're trying to work through some difficulties. Will keep you posted.	1428941678	587650109833400321	f	thesteelcart
@holyshityouguys Hey Dan, we're trying to work it out. Will keep you posted.	1427932545	583417496604168192	f	thesteelcart
@julie_jo Miss you too! We'll keep you posted.	1427588847	581975924033339392	f	thesteelcart
@koolikowska Hi Daneka! We're working on it. Will keep you posted.	1427156504	580162546340106242	f	thesteelcart
@ClimbTheWalkup It's in the air, will keep you posted!	1427076041	579825058123771904	f	thesteelcart
Happy Birthday Lil' Brunch Box! \nThank you for your overwhelming love and support these past couple years. It's... http://t.co/OrA82cwdfd	1421723664	557375564697567233	f	thesteelcart
Mom	1404008129	483071225703702528	f	blend_express
Winter Hours... \nSee ya'll soon! For catering inquiries or just to say hi, contact us at info@thesteelcart.com. http://t.co/ZBWC1uqED9	1420580129	552579230954172416	f	thesteelcart
RT @FunMusicPres: Shoutout to @TheSteelCart for keeping our staff well fed while we plan the DOPEST party in DUMBO. http://t.co/TebaOCbOMI	1419955062	549957509579300864	f	thesteelcart
@holyshityouguys Happy New Year Dan! You are missed. We'll catch you sooner or later.	1419951688	549943359213932545	f	thesteelcart
Makin a grand finale on Front & Jay! Stick it to the weatherman with a toasted sandwich & grits. Soup today is Rustic Chicken Noodle.	1419950738	549939373081645057	f	thesteelcart
One more Front & Jay Monday! Rustic Chicken Noodle soup on board. @DUMBOFoodTrucks	1419862364	549568705097912320	f	thesteelcart
One more round for Dumbo! Front & Jay through lunch. Soups are Split Pea & Ham + Rustic Chicken Noodle. @DUMBOFoodTrucks	1419345151	547399356950011906	f	thesteelcart
Making a Christmas cameo on Front & Jay in Dumbo!!! Soups are Split Pea + Rustic Chicken Noodle. @DUMBOFoodTrucks	1419256271	547026568670089216	f	thesteelcart
http://t.co/xLy88zFRBe	1433610398	607232138396758016	f	thecrepestruck
@BelmontPark for the big race. Check us out in the food truck village.	1433610335	607231876248571904	f	thecrepestruck
LeTriomphe crepes courtesy of TennisChannel in NYC for the FrenchOpen http://t.co/qpPiqThu7u	1430844040	595629192366202881	f	thecrepestruck
TennisChannel handing out free crepes in Manhattan today. RG15 FrenchOpen RolandGarros http://t.co/cq8wvtHUOT	1430833425	595584668885483521	f	thecrepestruck
Sad day for two NYPD families right before X-mas.  @NYPDLivesMatter	1419176770	546693114875097088	f	thecrepestruck
Show some support for those who protect our community.\n\n@NYPDLivesMatter \nNYPDLivesMatter	1419127839	546487884103311360	f	thecrepestruck
Brazzers truck in T- Square giving free ice cream today @nikkibenz @Phoenixmarie  @moniquealexande & @madisonivy00 http://t.co/MR37Qvslkv	1406998391	495613293286133760	f	thecrepestruck
Come ceck out the Brazzers promo truck in Time Square 48 & 7 ave today till 4pm. http://t.co/wUDdRIZpAh	1406998102	495612081732079616	f	thecrepestruck
Join us tonight at the Abington House, 500 West 30 Street in Manhattan for a free crepe (While supplies last).	1406763633	494628646167252992	f	thecrepestruck
Free crepes for the first 100 people from @TheCrepesTruck at the @AbingtonHouse starting tonight 6pm.	1406751021	494575748888662016	f	thecrepestruck
RT @2910ah: Tonight, first 100 Guests receive Free Lobster Rolls @lobstertruckny and Crepes @TheCrepesTruck  AHartpark, @2910ah House on t...	1406750346	494572913799233537	f	thecrepestruck
Come visit the Crepes Truck today from 6-9pm at The Abington House Summer Series Event, 500 West 30th Street @2910AH AHartpark	1406726932	494474710109806592	f	thecrepestruck
Free Crepe Party for you and 500+ friends to celebrate Brazil's win over Germany.	1404853435	486616695726157825	f	thecrepestruck
AirFranceExpo And AirFrance have a promo truck giving out free ice cream today 1-2pm on 23 Street by Eataly. http://t.co/Qc5tzoxqLA	1403974584	482930526689689600	f	thecrepestruck
@SrjStar_Music   AirFrancegiving away free ice cream at Madison Park 1-2pm today	1403966479	482896531276955649	f	thecrepestruck
AirFranceExpo is giving away gree ice cream in Washington Square Park South	1403809240	482237024246976512	f	thecrepestruck
TheHub has a new show called KidPresident. Free ice cream today! http://t.co/YD9VJi4ad5	1403799737	482197164018655232	f	thecrepestruck
airfrance & AirFranceExpo  are giving away free ice cream. Today through Saturday http://t.co/jmgBDPaVik	1403797564	482188050664267777	f	thecrepestruck
The Hub has a new TV show titled Kid President. Free ice cream today and tomorrow. http://t.co/an9pPzEjhu	1403713515	481835521438920705	f	thecrepestruck
VisitCaymanIslands is giving away free ice cream today!\n\nUnion Square West & 14 Street http://t.co/V3Q165zMTR	1403196954	479668909592039424	f	thecrepestruck
It's FreeFriesFriday! Join us on @LoyalTree + use code FREEFRIESFRIDAY to get free fries at the truck! http://t.co/fGizQekoe7	1422628122	561169136282501121	f	shadydawgnyc
We're parked on 47th Street in between Lexington and Park today!	1422628088	561168994456330240	f	shadydawgnyc
Today we're parked on Hudson Street and King Street! Stop by for some dawgs! Check out our menu: http://t.co/QaZQMWARyU	1422460394	560465632601600000	f	shadydawgnyc
@Amomonous we're parked on 46th Street and 6th Avenue today!	1421943798	558298870988701696	f	shadydawgnyc
We're parked on 46th Street and 6th Avenue today! Check out our menu: http://t.co/QaZQMWARyU	1421943748	558298660497539074	f	shadydawgnyc
Today we are parked on 47th Street between Park Avenue and Lexington Avenue. Stop by for some dawgs!	1421421203	556106949864226816	f	shadydawgnyc
Its FreeFriesFriday! Follow us on @LoyalTree + use code FREEFRIESFRIDAY for free order of fries at the truck today! http://t.co/0bfw1ciIHc	1421421177	556106842032836609	f	shadydawgnyc
We're parked on 46th Street and 6th Avenue today! Brave the snow and stop by for a gourmet dawg! http://t.co/qGH4ggxTCS	1420822095	553594110633066496	f	shadydawgnyc
@foodNfest how was it?	1418845788	545304876516126720	f	shadydawgnyc
@Khameleon619 were open now!	1418845770	545304801672982528	f	shadydawgnyc
@maximumbennis its a beer Cheddar sauce. What do you think?	1418845749	545304711902281728	f	shadydawgnyc
Come get your dawgs at Hudson St. and King St. today!	1418751808	544910695872339969	f	shadydawgnyc
Thrilled to see @EdwardNorton at the @shadydawgnyc truck today!	1418595939	544256931922472961	f	shadydawgnyc
RT @steveorefreshed: @ShadyDawgNYC is amazing!... if you're in NYC come to the truck boyeeeee!..... http://t.co/xmqZU3qy8Y	1418585801	544214412660584448	f	shadydawgnyc
@CaptKirkeisha Nice photo, dawg	1417813234	540974030757433344	f	shadydawgnyc
@feistyfoodie hey Yvo we're actually off the road today but as soon as we're back we'll be sure to post our next truck location!	1417534610	539805396811403264	f	shadydawgnyc
Come get your ShadyDawg! We are parked on 51st and Park today!	1416930676	537272312681467904	f	shadydawgnyc
Download the @LoyalTree App and enter the code below to redeem your FREEFRIES. Find us at 51st and Park ave today! http://t.co/8NeZncyxXg	1416584346	535819699624620032	f	shadydawgnyc
Craving a dawg for lunch? Stop by the truck on 51st and Park Ave, and if you can't make it til later, come find us on Broadway and E. 8th!	1416499479	535463742495260672	f	shadydawgnyc
@piligyrosyce You're welcome! Hope to see you again soon! ShadyDawg	1416406973	535075745052512256	f	shadydawgnyc
Listen to House Lounge 2015 Episode 1 - DJ Frank Delour by Dj Frank Delour np on SoundCloud https://t.co/51oPonPODw	1421948094	558316889966137346	f	blend_express
Happy Halloween.   47th and park we here.	1414774175	528227292162826240	f	blend_express
Hudson off Varick and charlton.   We here for all your dining services need be...	1409760568	507198702344486912	f	blend_express
47th and park.   Here we gooooooo!!!!	1409240779	505018548184707072	f	blend_express
I'll never get locked out again now that I have @KeyMe! Use promo 'amazingkeys' for 20% off. http://t.co/ClJDm90Fhq https://t.co/CIF26sccB6	1397841376	457205986600955905	f	blend_express
And of course the menu at the restaurant is a lot bigger than the menu on the truck haha. Great food, great service, so its a great choice	1383317024	396286439065153536	f	blend_express
Our restaurant is on 47th ave and VERNON BLVD in LONG ISLAND CITY QUEENS. We invite you to be a part of our latin fusion experience	1383316966	396286197703917568	f	blend_express
Everyone from blend thanks you, you, and you for a great year. Hope everyone enjoyed all the food and laughs. come you visit our restaurant	1383316917	396285989247012864	f	blend_express
We will not be parking on HUDSON and KING anymore ....   Hopefully only at least for this year	1383316855	396285730898845696	f	blend_express
Bad weather this morning and now i got bad news ppl of HUDSON AND KING. Cops were called with complaints and ran all the food trucks out =/	1383316778	396285407048245248	f	blend_express
Spot was taking sorry. We will make a special appearance tomorrow for ya'all! RT @jkendzierski: (cont) http://t.co/Og12VqcI6v	1383261575	396053869786300416	f	blend_express
We will make a surprise appearance tomorrow! RT @lsteinwand: @Blend_Express you told us Hudson (cont) http://t.co/z9K2FRRf2Y	1383261543	396053736470368256	f	blend_express
We tried today my man! Couldnt do it =/ (sucks i know) RT @Sacredhonour: @Blend_Express somewhere in the 47th/Park vicinity tomorrow?	1383233740	395937121795846144	f	blend_express
Its finally here...    Our last day =( we came to 55th and broadway for one last service. Thanks for a great season! TreatYourself	1383233679	395936866157199360	f	blend_express
19th st and 5th ave RT @nay_60: @Blend_Express where are u guys today??	1383150783	395589173794832385	f	blend_express
Tomorrow it our last day!! Find us! We're on the corner of 19th st and 5th ave! Get it while u can and TreatYourself	1383150765	395589097257189377	f	blend_express
Our season ending week! Today we are located on 55th and broadway! Come check us out! Not now but right now!	1382976806	394859462814871552	f	blend_express
Good Morning  NYC,\nWe are parked on 56 St & Broadway today. Come enjoy Fresh Lobster Rolls, Sliders & Gazpacho.	1440772179	637270825066983425	f	lobsterrolling
Good Morning NYC,\nWe are parked on 70st & York today. We have Lobster Rolls, Sliders & Gazpacho. @Cornell @Chase @Sothebys. Have a good one.	1440685486	636907207142060032	f	lobsterrolling
Good Morning NYC,\nCome enjoy a Fresh Lobster Roll & Slider & Lobster Gazpacho. We are on 21st & 5th Ave. @ClubMonaco @katespadeny @Chase	1440602811	636560445793529856	f	lobsterrolling
Good Mornkng NYC, \nWe are parked on 70st & York Ave today. Come enjoy Fresh Lobster Rolls, Sliders & Gazpacho. @Cornell @Chase	1440511824	636178816902279169	f	lobsterrolling
NYC Thank You for a great day. We will be at 70st & York Ave Tomorrow. If you missed us today come check us out tomorrow. Have a goodnight.	1440463794	635977366225965056	f	lobsterrolling
40 st & Park Ave @WellsFargo @Citi @HSBC_UK @ny2020	1440428297	635828482132545537	f	lobsterrolling
Good Morning NYC,\nWe are parked on 40st & Park Ave today. Come enjoy a Fresh Lobster Roll & Gazpacho. Have a great day.	1440424740	635813560589897728	f	lobsterrolling
Good Morning NYC,\nWe are parked on 67st & Broadway today. Come & Enjoy Fresh Lobster Rolls, Sliders & Gazpacho	1440254435	635099250460880897	f	lobsterrolling
Good Afternoon NYC,\nWe will be at Rockaway Beach today. Enjoy your Friday.	1440176668	634773070008438784	f	lobsterrolling
Good Morning NYC, \nWe are parked on 70st & York Ave today. Come enjoy lobster Rolls, Sliders & Gazpacho. @Sothebys @chase @Cornell	1440081156	634372466685673472	f	lobsterrolling
Good Morning NYC,\nWe are parked on 21st & 5th Ave today. Come enjoy Lobster Rolls, Sliders & Gazpacho.  Have a great day. @katespadeny	1439995315	634012420181245952	f	lobsterrolling
Good Morning NYC,\nWe are parked on 57st & 8th Ave today till 4pm. Come enjoy fresh Lobster Rolls, Sliders, Gazpacho.	1439909484	633652420954976257	f	lobsterrolling
Good Morning NYC,\nCome see us at Rockaway Beach today & Tomorrow, Fresh Lobster Rolls, Sliders & Gazpacho. Have a beautiful day.	1439465466	631790072384364544	f	lobsterrolling
Good Morning NYC, We are parked on 21st & 5th Ave today. Come enjoy our Lobster Rolls, Sliders & Gazpacho. @ClubMonaco @katespadeny @HSBC_UK	1439389945	631473314796584960	f	lobsterrolling
Catch us @ http://t.co/B7uDmsa16z Next Saturday & Sunday.	1439166624	630536640956661760	f	lobsterrolling
Thank You 76st & Columbus Ave for a great day. Have a goodnight. We hope to be back in 2 weeks. Next weekend we will be at Governors Island	1439166491	630536081914626048	f	lobsterrolling
Good Morning NYC,\nToday we are on 76st & Columbus Ave. Come enjoy our Fresh Lobster Rolls, Sliders & Lobster Gazpacho. Have a great day.	1439130594	630385519386624001	f	lobsterrolling
Thank you 67st & Broadway for a great day. Have a goodnight NYC.	1439087639	630205352122974209	f	lobsterrolling
Good Morning NYC, We are parked on 67st & Broadway today. Freeh Lobster Rolls, Sliders & Lobster Gazpacho. @AppStore @LincolnSquareNY	1439044278	630023482915594240	f	lobsterrolling
Good Afternoon NYC, we are now parked on 56st & 8th Ave. We have Lobster Rolls, Sliders & Gazpacho. @ColumbusCircle @Coach @WholeFoods	1438983657	629769221178818560	f	lobsterrolling
RT @greenboxny: @theblotmag LOVE this article! check it out, @Skinny_Pizza, @Valduccis, @Palanyc, @PizzaLovesEmily, @PizzaMoto, @TwoBootsHQ...	1440791760	637352953993658368	f	valduccis
Cooking some yummy pizza for a private party in Stanford @greenboxny @Foodtruckgirl7 @eatupnewyork @Foodtruckstars_ http://t.co/P8cyjE2dHU	1440764495	637238598320979968	f	valduccis
Rent the number one truck in New York City bestpizza http://t.co/pr45f8mwBl	1440710996	637014203983921152	f	valduccis
Doing an event in Brooklyn @greenboxny @Foodtruckgirl7 @FoodtoEat @foodNfest @Foodtruckstars_ http://t.co/bWF1fpRMi5	1440688761	636920945098272768	f	valduccis
Best catering @greenboxny @Foodtruckgirl7 @eatupnewyork @Foodtruckstars_ @foodNfest @FoodPorn http://t.co/p9JjnC021p	1440639001	636712235344244736	f	valduccis
Catering http://t.co/kbk8Pb4TrY pizza whowantspizza feedyoursoull @greenboxny @MashfeedFood @Foodtruckgirl7 @Foodtruckstars_	1440546518	636324333196066816	f	valduccis
Anybody Sleep late Today  jazzything @greenboxny @Foodtruckgirl7 @eatupnewyork @foodNfest @Foodtruckstars_ http://t.co/IFDlCBfD3l	1440435585	635859049821638656	f	valduccis
We're making some dough pizza valduccis @greenboxny @foodNfest @Foodtruckgirl7 @FoodPorn http://t.co/H3NBFjRjUo	1440377473	635615309047726080	f	valduccis
We deliver 5 to 500 pies @greenboxny @FoodtoEat @Foodtruckgirl7 @Foodtruckstars_ @eatupnewyork http://t.co/Wa8DR5NEgs	1440272538	635175180210470913	f	valduccis
@Afropunk Brooklyn CommodoreBaryPark http://t.co/Wmy3xWGzKi	1440246982	635067990531141632	f	valduccis
RT @afropunk: Grace Jones taking us to church tonight. afropunkfest FancyDress Ball http://t.co/uyRecMA8FG	1440241903	635046686218452992	f	valduccis
Wake up New York it is @afropunk Time	1440241877	635046577967640576	f	valduccis
RT @afropunk: Check out the AFTER DARK events lined up for this year's AFROPUNK Fest in NY\n&gt; http://t.co/6ZhS9I8gZE http://t.co/KMclWMPGpa	1440158609	634697327559712768	f	valduccis
Frankey Baby lets go to @Afropunk to get some Valduccis Pizza @greenboxny @FoodPorn @foodNfest @Foodtruckstars_ http://t.co/Hk5PUF3aGn	1440157048	634690779273908224	f	valduccis
@Afropunk  Sat n Sun commodorePark brooklyn bestpizza @greenboxny @foodNfest @Foodtruckgirl7 @gracejones @lennykra http://t.co/q3ugwoTv0w	1440154637	634680666622435329	f	valduccis
@Afropunk @gracejones this Sat n Sun @ Commodore Park brooklyn @greenboxny @FoodPorn Come enjoy Valduccis Pizza http://t.co/S8Fcch6skV	1440120430	634537192812060674	f	valduccis
@Afropunk @lennykravits sat n sun @gracejones  @greenboxny @FoodPorn music brooklyn comodore Barry park http://t.co/vEqOLTllaO	1440091579	634416181861056513	f	valduccis
RT @greenboxny: Here at GreenBox, we don't discriminate. You with us, @Valduccis, @LoveLikePizza & @ATownPizzaria? pizzalove http://t.co/...	1440002467	634042419923812352	f	valduccis
50 th 6 ave till 3 @greenboxny @Foodtruckgirl7 @Foodtruckstars_ @FoodPorn bestpizza @FoodNetwork http://t.co/2kAsWtCwXR	1439983429	633962569041096704	f	valduccis
RT @HogsAndHeifers: @SandraBernhard Thanks for the mention, and we agree, so much character gone.  The soul that has been NYC for so long, ...	1439974961	633927051435765760	f	valduccis
Check out our New Restaurant The Wheelhouse BK! Featuring over 14 Gourmet Sandwiches - Grilled Cheese : Crispy... http://t.co/mX7zNXWwcl	1437478937	623457967917113344	f	miamimachinenyc
Check out our New Restaurant The Wheelhouse BK! Featuring over 14 Gourmet Sandwiches - Grilled Cheese : Crispy... http://t.co/6yj12Wququ	1437478850	623457603377610752	f	miamimachinenyc
@BillGates My Uncle invented waste water sewage treatment years ago! https://t.co/lX9433WJf6 He even tried reaching out to you! notright	1421905524	558138340906926081	f	miamimachinenyc
RT @YouGotSmoked: Park Ave btw 33rd St and 32nd St from 11:00 to 3:00 today! New York Aged Cheddar Mac and Cheese! Delicious nyc http://t...	1389964561	424168229477826560	f	miamimachinenyc
RT @YouGotSmoked: Check us out today @dumbolot @DUMBOFoodTrucks from 11:00 to 3:00! slowsmokedpork applewoodsmokedchicken	1389793800	423452005034901504	f	miamimachinenyc
RT @YouGotSmoked: Today we are on Water St and Wall St from 11:00 to 3:00!	1389374143	421691837116866560	f	miamimachinenyc
RT @YouGotSmoked: Check us out today on Wall St and Water St in fidi from 11:00 to 3:00! followthesmoke See you then!!! http://t.co/6LUz8...	1389286859	421325742107283456	f	miamimachinenyc
RT @YouGotSmoked: We are back! @dumbolot 11:00 to 3:00!	1389186845	420906253154799616	f	miamimachinenyc
RT @YouGotSmoked: Ready to get smoked with our new menu? http://t.co/4ehQVCO40w	1389037615	420280336954974208	f	miamimachinenyc
RT @YouGotSmoked: Had to move to Varick At and Vandam St sorry!	1387560066	414083048008060930	f	miamimachinenyc
RT @YouGotSmoked: tribeca get ready to be smoked! ( by BBQ that is ) check us out today for the first time on Varick St and Charlton St fr...	1387549231	414037602782969856	f	miamimachinenyc
RT @YouGotSmoked: Attention fidi we are back! Wall St and Water St from 11:30 to 2:30 with some Amazing BBQ! See you then!	1387470752	413708435767955458	f	miamimachinenyc
RT @YouGotSmoked: Shredded Barbecue Skirt Steak - Arugula / Tabasco Onion Strings / YGS Signature BBQ Sauce / comeandgetit http://t.co/RrW...	1387470746	413708413974376448	f	miamimachinenyc
RT @DUMBOFoodTrucks: Welcome! RT @dumbolot: Lot vets @DomoTaco and @shortysnyc on jay & water along with a new addition! Welcome to the lot...	1387377444	413317076561186816	f	miamimachinenyc
RT @YouGotSmoked: Smoked Portobello Mushroom-Texas Toast/Arugula/Tomato/Caramelized Onions/Sliced Avocado/Sweet and Smokey Vinaigrette http...	1387317717	413066561625546752	f	miamimachinenyc
RT @YouGotSmoked: @DUMBOFoodTrucks Here we come! Check us out for lunch tomorrow @dumbolot for some bad a% BBQ! See you then!!	1387317706	413066516272513024	f	miamimachinenyc
Catering now available! 908 591 4972 miamifoodmachine@gmail.com http://t.co/WujQdHZOUx	1385561777	405701616080531456	f	miamimachinenyc
Contact us to Cater your next Party or Event! Check out our Menu! cubanfoood miamifoodmachine@gmail.com 908 591 4972 http://t.co/9Gg04o4jKG	1385053469	403569615844147200	f	miamimachinenyc
Check us out on @EatStTweet tonight! 8:00 PM Cooking Channel! Formerly known as @bongobros deliciouscubanfood miamifoodmachine	1385053167	403568350233907200	f	miamimachinenyc
Check out our Brand New Catering Menu! http://t.co/HRxxJhtMuV http://t.co/PRqbwOl0cP	1384525987	401357198309486592	f	miamimachinenyc
Come to Old Slip & Front for a little Fryday happiness:)	1440766612	637247477457027072	f	domotaco
RT @tullesonl: @DomoTaco u were right absence did make the heart grow fonder yum singletortillataco mytastebudsarehappy 52ndandpark	1440698573	636962099621720064	f	domotaco
We're back on 53rd & Park for lunch today!	1440681089	636888767278764032	f	domotaco
RT @GWiZdaKiD: @DomoTaco  https://t.co/yrHbsSFeWd	1440632270	636684006134841344	f	domotaco
Catch us in the @dumbolot on Jay & Water today DUMBO bk	1440593424	636521073111105537	f	domotaco
SoHo today on King & Hudson!	1440509993	636171136519286784	f	domotaco
@AirlineFlyer @NYC_DOT @NYPDnews you're right. I'll instruct the drivers to double park against the bike lane.	1440509971	636171045792190466	f	domotaco
@AirlineFlyer @NYC_DOT @NYPDnews just waiting for a parking spot. foodtrucklife	1440506394	636156044360699904	f	domotaco
Start the week off right with a Five Spice Pork burrito on 52nd&6th today!	1440421027	635797989097803777	f	domotaco
@Square @SqSupport having trouble swiping with multiple dongles. Few go through okay but most need to be manually entered.	1440362936	635554336257404928	f	domotaco
RT @jgflowers88: Had @DomoTaco for the first time today. @JessicaSimpson voice: I think I'm in looooooooooove! http://t.co/ssNsDM7VRk	1440348185	635492464351145985	f	domotaco
RT @allisonmcmordie: @DomoTaco come to Bryant park for lunch next week! @Razorfish needs you	1440192917	634841224214675457	f	domotaco
@allisonmcmordie @Razorfish would love to but no parking nearby 	1440192914	634841211711438848	f	domotaco
Happy Fryday from Old Slip & Water FishTempura ShrimpTempura NachoTots nom	1440162157	634712209730457600	f	domotaco
RT @tullesonl: @DomoTaco absence makes the tummy rumble mytastebudsaresad	1440123845	634551517828284416	f	domotaco
RT @tullesonl: @DomoTaco no tacos for 53rd & park?? Why ruin my Thursday?	1440082182	634376769861234688	f	domotaco
@tullesonl absence makes the heart grow fonder poetry slam	1440082177	634376745798475776	f	domotaco
RT @levidulitz: @DomoTaco cmon... needed my fish taco fix on 53 and park today!	1440082126	634376533675802624	f	domotaco
@levidulitz save your tummy for us next week!	1440081604	634374343053721600	f	domotaco
On our way to Metrotech today! Brooklyn	1440078811	634362630556250112	f	domotaco
Japanese Ramen Chain Ichiran Will Finally Bring Ultra-Serious Solo Slurping to NYC http://t.co/9LXENtWLsl via @EaterNY	1439605325	632376687406227456	f	shanghaisogo
Love @Gett as much I do? Use my code: GTYUNLI1 for $20 off your 1st ride http://t.co/POJKdysjxA	1430948975	596069322981822464	f	shanghaisogo
Love @Gett as much I do? Use my code: GTYUNLI1 for $20 off your 1st ride http://t.co/POJKdysjxA	1427207419	580376100011945984	f	shanghaisogo
Here I am again! A must go place every time when I back to the NYC. (@ T-swirl crepe) on Yelp http://t.co/M1ROXk0cfS	1426984585	579441465568280576	f	shanghaisogo
Demand Blk District Attorney Kenneth P. Thompson to withdraw indictment against Asian minority Officer Peter Liang! http://t.co/IIHUDXa918	1424268303	568048552603197441	f	shanghaisogo
hashtags AskAmex	1417298324	538814342226272256	f	shanghaisogo
Happy Halloween! Be safe & have a great night!	1414796018	528318908294778880	f	shanghaisogo
Happy Halloween. TGIFriday !! We r serving at water and Hanover sq!! ( 10 Hanover square ) come & get some. 11~3pm. http://t.co/VBdd8zsVAK	1414769059	528205834015477760	f	shanghaisogo
Happy Halloween. TGIFriday !! We r serving at water and Hanover sq!! ( 10 Hanover square ) come & get some. 11~3pm.	1414768962	528205428879273985	f	shanghaisogo
TGIF FiDi heading to old slip & water now. 11~3pm.	1414764094	528185009027682304	f	shanghaisogo
Wednesday all day until 8pm. nyu W. 4th and Greene! \nRocking 11~8pm.	1414598415	527490102885646336	f	shanghaisogo
RT @PruCenter: Tune in to @PIX11News at 7:45 a.m. to see the PruEats truck in action! http://t.co/Zjk7UhpGGn	1413578374	523211740092579840	f	shanghaisogo
RT @PruCenter: @NJDevil00 is ready for some PRUeats this morning on @PIX11News! http://t.co/XOPePopSbM	1413578361	523211685746982912	f	shanghaisogo
RT @PruCenter: Go inside the PruCenter Food Truck as the new arena concession dishes out free PRUeats samples at @RutgersU! http://t.co/u...	1413578155	523210824119517184	f	shanghaisogo
flatiron. happy lunch & free sample.  come out & get some from us. 22nd st & 5th ave. Until 2pm.	1413559629	523133119122399232	f	shanghaisogo
Hey, U CAN NOT MISS THIS! New Yorkers! Come out for FREE PRUeats today at @flatiron. @PruCenter Food Truck 22nd st & 5th ave! 12~2p!	1413554520	523111688808431616	f	shanghaisogo
Morning, flatiron! still hosting a event from @PruCenter. serving FreeSample MadisonSquarePark  22nd & 5th ave. Until 2pm.	1413549440	523090384160043008	f	shanghaisogo
New York & New Jersey. So far the FreeSample is going hot & crazy. Love to work with all of this great chefs. http://t.co/mLYzmJvK59	1413479611	522797497727868928	f	shanghaisogo
RT @kevsteimle: Prudential Center to unveil new on-ice presentation @NHLDevils home opener http://t.co/4KH97tW2CW via @AsburyParkPress @NHL...	1413479479	522796946768285696	f	shanghaisogo
RT @PruCenter: Stop by College Ave and Somerset St at @RutgersU for FREE PRUeats! http://t.co/LF6tBlmIsq	1413479467	522796894259785728	f	shanghaisogo
Chicken Caesar white pie at our private event tonight! Email debbie@eddiespizzany.com for your next event. http://t.co/jxfPTsLqhL	1440719779	637051044162326529	f	eddiespizzany
RT @smorgasburg: Smorgasburg in @prospect_park kicks off on Sunday! http://t.co/elfT2vJXkI http://t.co/b2kFMSC9sS	1440711110	637014683397042177	f	eddiespizzany
@schandy97 so sorry about that! We had to pack up early for a private event. We will make sure we tweet early closures in the future.	1440615184	636612341438775296	f	eddiespizzany
Lunch today on 46th between 5th and 6th. Special: white pizza with bacon, pineapple and sriracha http://t.co/HTnAO3MeWz	1440595176	636528419971432448	f	eddiespizzany
If you are looking for a catered event this labor day we will have vehicles out in the hamptons and all over the... http://t.co/Rq54olW3KQ	1440506811	636157794018660352	f	eddiespizzany
We are on the corner of water st and hanover sq downtown today for lunch. Come try our hawaiian pizza... http://t.co/h9kRO4myyJ	1440506755	636157556856094720	f	eddiespizzany
This weeks special. White pie with pineapple, bacon and sriracha! http://t.co/Rss2uQQsC6	1440426505	635820964006264833	f	eddiespizzany
For all of you runners out there:\nDont delay! REGISTER to run the Inaugural Rock n Roll Brooklyn Half Marathon... http://t.co/pAtorjX8eH	1440079200	634364262517968896	f	eddiespizzany
Top 100 things to do in NYC, New York (NY), USA http://t.co/VWZ7NOj87d	1439516072	632002331945619457	f	eddiespizzany
Go check out @mimichengs dumplings if you haven't been already! Our friends @TakumiTacoNY swear by them! http://t.co/s9sfCYZm6N	1439495006	631913974792069121	f	eddiespizzany
Today we are parked on Hudson and King street. Stop by and try our delicious grilled chicken, cherry tomato and... http://t.co/nvZZJ748Ia	1438699890	628579017994715136	f	eddiespizzany
RT @smorgasburg: Can't wait to see everyone this evening! And one more reminder that the event is totally SOLD OUT. Have fun! https://t.co/...	1438366298	627179830522585089	f	eddiespizzany
We will be serving lunch today on 47th between park and lex	1438341943	627077676801638400	f	eddiespizzany
The truck is closed for private events all weekend. See you next week! http://t.co/jRWdjmaqxB	1437830543	624932712458096640	f	eddiespizzany
We have moved to our regular spot on W46 street and 6th ave.	1437579833	623881156015058945	f	eddiespizzany
Happy Wednesday! Today we are parked on W.46street. Right across from HSBC bank. Stop by for lunch.	1437574524	623858890225111040	f	eddiespizzany
@Cheerios47 so sorry we had to leave our for a private event. Our apologies. We will be back next week until 3	1437507069	623575961250983937	f	eddiespizzany
Now hiring COOKS! Weekend work. Interviews Tuesday, July 21st at Takumi @chelseamarketny from 9a to 11a. http://t.co/iXq35OD4YX	1437405111	623148320089899008	f	eddiespizzany
Now hiring COOKS! Weekend work. Interviews Tuesday, July 21st at Takumi @chelseamarketny from 9a to... https://t.co/Gh9OCyHjrg	1437405110	623148313110560768	f	eddiespizzany
Weekly special: bacon, hot cherry peppers, and sauteed onions with bbq sauce  Monday's @starrettlehigh... http://t.co/WNX3HRVoDa	1437403797	623142809944616960	f	eddiespizzany
RT @Jspero125: It's a special day when my favorite ride sharing service @LYFT and my favorite falafel @TaimMobile join forces http://t.co/L...	1440711827	637017689844789248	f	taimmobile
@ariannatastic Sorry!  But we hope to see you next week!	1440697853	636959081362784256	f	taimmobile
Get fala-FULL with @TaimMobile and @lyft!  We are on 20th and 5th today!	1440692367	636936070714781696	f	taimmobile
Missed us yesterday? We're back on 20th and 5th! High five! Treat yourself to a free sandwich from... https://t.co/mJDKZxWbiT	1440692102	636934958947434496	f	taimmobile
RT @lyft: NYC, get falaFULL. Score a free @TaimMobile falafel today and tomorrow: http://t.co/NFdTSP7CEP HighFiveLyft http://t.co/qsiSQLyn...	1440608651	636584941371961344	f	taimmobile
@mlevs1 our truck is in the shop today :(	1440517559	636202870497480704	f	taimmobile
Treat yo'self to a free sandwich Wednesday or Thursday! Just download @Lyft, enter code HIGH5 & show us for a falafel at the truck!	1440513056	636183986964951040	f	taimmobile
Got a case of the Mondays? We're here to help. Come visit our truck on water and broad in FiDi today!	1440427857	635826636060012545	f	taimmobile
RT @10Best: Top TakeOut in NYC? http://t.co/YbuK4cm3qo | @Omathomeyoga's Pick-10  incl. @momofuku @TaimMobile @Chopt @67burgerftgreen @Di...	1440362157	635551070094295041	f	taimmobile
Spending today on Vandam and Varick!  See you there!	1440086531	634395010620755968	f	taimmobile
RT @ScoutologyBosMA: Who Has The Best NYC Food Truck? Cast A Vote! @ScoutologyNYC @TaimMobile @waffletruck @bigdsgrub @PolishCuisine \n\nhtt...	1440025359	634138434106458112	f	taimmobile
You've made it to hump day! We're on 20th and 5th to help you celebrate with the best falafel in nyc.	1439998845	634027229480132612	f	taimmobile
TAIMTUESDAYS on 20th and 5th!  Why wouldn't you eat falafel today?	1439909720	633653409212702720	f	taimmobile
FiDi Monday We're on Water and Broad today! It's a perfect day for a date lime banana smoothie!	1439825142	633298666766340097	f	taimmobile
RT @thedailymeal: 101BestFoodTrucks: @TheTacoTruck, @TaimMobile, @bonetownburgers, @lobstatruck! http://t.co/A8Gaj3Dbu3 http://t.co/wMUIjd...	1439491371	631898728501223425	f	taimmobile
Honored to be one of the 101 best food trucks in America. Thanks @thedailymeal! http://t.co/D0pSsMGN2l	1439415997	631582586767343616	f	taimmobile
A little rain never hurt nobody! See you on 20th and 5th today! TaimTuesdays	1439304116	631113321538842624	f	taimmobile
We're on Water and Broad today! FiDi The weather couldn't be better for a falafel sandwich and refreshing smoothie! foodtrucknyc	1439224396	630778954169851904	f	taimmobile
On Vandam and Varick today! See you 11am - 3pm today for that falafel fix!	1438872512	629303046640635905	f	taimmobile
There is only one way to get over the hump today... with a falafel sandwich and smoothie.  See you today on 20th and 5th in flatiron!	1438784794	628935131206680576	f	taimmobile
Take a ride on the Reading Railroad if u will, but 1st find the Here & Now Monopoly trk 4 ur free ice cream in a hat & spl Monopoly cookie	1440186799	634815564993699840	f	sweeterynyc
If you're in jail and have a get out of jail free card use it & head on over to 8th Av btw 56/57th St for free treats, then you can pass go!	1440182382	634797037272309760	f	sweeterynyc
Hey nobody has free parking in NYC, but if u find the spl Monopoly Here & Now @sweeterynyc u'll get a hat full of ice cream & a cookie free!	1440182159	634796103632822272	f	sweeterynyc
There is no need to pay a Luxury Tax, just come & get your free Monopoly cookie & ice cream in a hat. We will be on 8th Av btw 56 & 57th St	1440180067	634787329652203520	f	sweeterynyc
B&O Railroad won't take u there but if you head to 50Th St off of 3rd Av u won't need to pass Go to get your free Monopoly ice cream treat.	1440171224	634750240155938817	f	sweeterynyc
U won't need 2 land on Chance 2 get a delicious free Monopoly treats from @ the spl @Sweeterynyc Monopoly Here & Now Trk, no need to pass Go	1440169296	634742149976825857	f	sweeterynyc
U won't find the Monopoly truck on Boardwalk or Park Pl 2day but u will find us @ 50th & 3rd srvg treats! @hasbronews http://t.co/BiIByRYUEt	1440167824	634735976053624832	f	sweeterynyc
Join us at 50th St btwn 5th & 6th starting @ 3pm to see Mr. Monopoly & eat yummy cookies & ice cream! @HasbroNews http://t.co/QRMBlOKFdo	1440095668	634433332453986304	f	sweeterynyc
From the gorgeous beaches of Italy, I wish I was hanging w/Mr M. @ the Monopoly trk. Happy bday Mr M. You r 1 of a kind, see u on Park Pl.	1440087267	634398096722628609	f	sweeterynyc
Get ready! The Monopoly Here & Now Food truck will be serving FREE ice cream from 3-5pm @ union square west btwn 17&16.	1439922656	633707668511850496	f	sweeterynyc
Get ready! The Monopoly Here & Now Food truck will be serving FREE ice cream from 3-5pm @ union square west btwn 17&16. @HasbroNews	1439922313	633706228519186433	f	sweeterynyc
We're open! Celebrating the Monopoly Here & Now Game - now serving @ 42nd St btwn 5th & 6th Av!	1439917597	633686450899451904	f	sweeterynyc
Excited to be celebrating the Hasbro Monopoly Here & Now Game tomorrow on the streets of NYC! Check in over the next 4 days to find us!	1439848733	633397614424276992	f	sweeterynyc
Last day for the Mag Mobile! Come find us at union square west between 17&16 to get your favorite mag and enter... http://t.co/ASmvSq4A3Z	1439831939	633327172422365184	f	sweeterynyc
@garsleat just mags this time! But plenty of prizes still to be had!! MagMobile2015	1439831806	633326615678832641	f	sweeterynyc
@garsleat Hi!! Yes, just magazines today with MagMobile2015 in Union Sq. Sweetery truck with sweets still on Hudson/King until 3pm!	1439830156	633319693256912897	f	sweeterynyc
@DoreneL1 unfortunately today is our last day on the road...	1439829436	633316676117864448	f	sweeterynyc
Hi @DoreneL1! We will be there until 3pm then we move to 5th Ave  around 18th St. from 3:30-6pm! Please come see us!	1439829095	633315246371958784	f	sweeterynyc
@DoreneL1 until 3:30!	1439828844	633314191319953409	f	sweeterynyc
We're at Union Square today with the latest Fall Fashion mags from @HearstCorp come on down! MagMobile2015 http://t.co/w77yoHAW4V	1439827613	633309030899949568	f	sweeterynyc
RT @Cater2me: More Malaysian demand the people of NYC! We're so happy to celebrate our 100th order w/ @lovemamak. Many more to come :)	1439919392	633693977598799872	f	lovemamak
RT @EIT: ABC offers a mix of colors, flavors, and textures at Wok Wok, new on Mott St. http://t.co/cfo5TpUCGc http://t.co/iWD4GXrpKL	1439044226	630023265923284992	f	lovemamak
RT @i8and8: Guess what? From the creators of @Lovemamak comes @wokwokny. The Southeast Asian resty is now open at 11 Mott St! Be sure to ch...	1438612432	628212192609857537	f	lovemamak
I'm ready to EAT @RED DRINK @RED SAVE LIVES! Let's 86AIDS. Join us & sign up here: http://t.co/bktfrIjrJ9	1433525962	606877988198694914	f	lovemamak
RT @i8and8: Best Things To Eat At Smorgasburg Brooklyn Bridge Park - NYC @Lovemamak  http://t.co/W771kkzYsp	1433520093	606853370939179008	f	lovemamak
Food Vendor Caught Charging Clueless Tourists $30 For Dirty Water Dogs  http://t.co/s1Eukda1Ng via @EaterNY	1432276046	601635460427821056	f	lovemamak
Pre vacation feel with coconut meal @lovemamak @smorgasburg http://t.co/HM2vdWdNzC	1428854214	587283256812380160	f	lovemamak
RT @i8and8: GO! We'll be there tomorrow w/ @LoveMamak. Come say hi! @YelpQueens @TGRdnb @weheartastoria @YelpNYC @WixLounge YelpHelps	1428340179	585127237332021248	f	lovemamak
RT @bkflea: Note: The Sunday Flea in Williamsburg reopens in May. Instead, visit @smorgasburg in Brooklyn Bridge Park today. http://t.co/W4...	1428268333	584825893752811521	f	lovemamak
RT @i8and8: GO! Super. Legit. Malaysian. Rendang. Keep Calm and Curry On! @lovemamak @smorgasburg http://t.co/nC7NWmlfh5	1428117911	584194981159706624	f	lovemamak
3 awesome Malaysians making us proud in New York City! business entrepreneur immigrant http://t.co/Jq9YnggDlZ	1427729629	582566407935631361	f	lovemamak
@ReadyOrangeOwl cool appreciate that! Is there anything we can do feel free to contact us	1426970173	579381015325597696	f	lovemamak
Join us! @i8and8: Volunteer for @TOTN_NYC here! Don't forget to say hi to us at the @LoveMamak table! https://t.co/YQrAKY5IS6 @NoKidHungry	1426112608	575784129817636866	f	lovemamak
RT @TourMalaysiaUSA: @RuksanaWrites try Malaysian restaurants/caterers based in the US: @rasanyc @bentaranewhaven @zef_zan @lovemamak @Mal...	1426112541	575783848388268034	f	lovemamak
Dumplingss http://t.co/rVKaLfdGkz	1425444337	572981198449983488	f	lovemamak
@pinguswobbin 174 2nd ave 10003 NY	1424114961	567405391517319168	f	lovemamak
The weather beat our Curry Laksa MalaysianRamen SOLD OUT http://t.co/kXAIvKQEH4	1424052167	567142014865915904	f	lovemamak
http://t.co/JhZCEwTNMp	1423356765	564225287018520576	f	lovemamak
I checked in at Love Mamak on Yelp http://t.co/2VOdqeHpqg	1420072776	550451236256755713	f	lovemamak
Steamed Lime garlic chilli striped bass http://t.co/NNd3nX0EsA	1419931808	549859975406043136	f	lovemamak
SHUKA FRIDAYS AT 46th St & 6th Av ! Shabbat Shalom and have A EggCellent weekend!  http://t.co/7CcfWCqyGL	1440774167	637279166359040000	f	shukanyc
WILL THIS BE YOUR LUNCH TOMORROW?  Friday at 46th St & 6th Av Repost @swathiredds with @repostapp.\n http://t.co/MJ8zBQR532	1440717646	637042097120497664	f	shukanyc
@vendyawards FINALIST! Help us become  ROOKIE OF THE YEAR!THURSDAY-FRIDAY AT 46th St & 6th Av ! http://t.co/1h9FOYOCNR	1440688341	636919183872270337	f	shukanyc
SHUKA WEDNESDAY! Today @ 47th St & Park Av ! HERE UNTIL THE LAST EGG Midtown NYC http://t.co/2ENBIuEP4O	1440600710	636551633036537856	f	shukanyc
Community: Best Way To Piss Off A Robber http://t.co/4WGLpT6X9m via @buzzfeeders	1440554693	636358623631962112	f	shukanyc
DONT CROSS THE SHAKSHUKA LINE!! TODAY Financial District - HANOVER SQ! Here until THE LAST EGG ! NYC http://t.co/CvoPOU128V	1440515596	636194637871497216	f	shukanyc
Sun:  Governors Island . \nMon: 20st & 5th Av \nTue: FIDI-Hanover Sq, \nWed: 47th & Park , \nThu: 46th & 6th,\nFri: 46 & 6th .\nSee you SOON	1440429521	635833615331540992	f	shukanyc
SUNDAYS ON GOVENORS ISLAND!! http://t.co/IEnOhf8wEZ	1440335408	635438876371329024	f	shukanyc
@sethmg we sure are !	1440335358	635438666589057024	f	shukanyc
The Shuka truck will take the day to CATER A PRIVATE EVENT IN FIDI !! Shabbat Shallom http://t.co/5xNQevWkwL	1440166179	634729075765059586	f	shukanyc
Today - FIDI - Hanover sq !Repost @vendyawards with @repostapp.\n\nIt's an eggs-cellent day for some Rookie... http://t.co/EgrcAFCBPz	1440092827	634421418151792641	f	shukanyc
Today - FIDI - Hanover sq !	1440086845	634396328785780736	f	shukanyc
TODAY - 47th St & Park Av !\nTHURSDAY- FIDI - Hanover Sq!\nFRIDAY- 46th St & 6th Av ! ShukaNation ! http://t.co/Mfbbu1YxIH	1439998012	634023736069521412	f	shukanyc
@ahlakritz Yes	1439982941	633960522661167105	f	shukanyc
It was a HARD night a the SHUKA TRUCK unfortunately the Shuka truck had been robbed LAST NIGHT and our cash register & IPad had been stolen!	1439907757	633645177853378561	f	shukanyc
Today - 21st St & 5th Av ! Here until the LAST Egg!  http://t.co/lZcSvp5JTv	1439821621	633283897367883776	f	shukanyc
SHUAK SUNDAY  The SHUAK TRUCK will be parked today at a private EVENT ! Tomorrow 21st St & 5th Av ! http://t.co/GDv9F3j8ts	1439746983	632970841635049472	f	shukanyc
FRIDAY FRIDAY FRIDAY! 46th St & 6th av WE ARE BACK! Shabbat Shalom and have A SHUKA DAY ! http://t.co/X56kH4vXVu	1439566193	632212554199265281	f	shukanyc
We are living in a CAULIFLOWER World ! It's Finally THURSDAY - 46th st & 6th Av !   Have a EggCellent DAY  http://t.co/KegnwabyhW	1439479032	631846974405373952	f	shukanyc
ITS TIME FOR WEDNESDAY! Today 47th St & Park Av ! Here until the LAST Egg ! See you Soonnyc http://t.co/V3md65kGLY	1439393840	631489655335190529	f	shukanyc
RT @meeses: BUT, I prefer @ElPasoTruck's tacos, which are so, SO GOOD	1425157921	571779882788782081	f	elpasotruck
RT @MobileEaters: There was delicious food & service with a smile at @ElPasoTruck last night latergram foodtruck Snowmageddon2015 http:/...	1425157913	571779848152211457	f	elpasotruck
Check our restaurant, is the perfect weekend.  http://t.co/g851MmANa4 http://t.co/ryNfVoE1Di	1423872239	566387340575522816	f	elpasotruck
Check our menu for Valentine's menu http://t.co/m4XfghyULJ	1423794701	566062122254475264	f	elpasotruck
RT @elpasony: Make your reservation http://t.co/rGD7i76Szx ValentinesDay MexicanFood http://t.co/btwVIJWyBh	1423786436	566027455346257921	f	elpasotruck
http://t.co/g851MmANa4 http://t.co/Jx9eD9AVjn	1423784904	566021032184913920	f	elpasotruck
CustomBags @ElPasoTruck  Branding. http://t.co/hMQIE5zDKW	1423775924	565983365707608064	f	elpasotruck
Make your reservation for tonight http://t.co/YHbJCrYe9T\nGiant screens + Happy hour during the game. http://t.co/XfcEc7ifdm	1422811742	561939292667523073	f	elpasotruck
SuperBowl http://t.co/YHbJCrYe9T http://t.co/vZZKucBoU8	1422488143	560582020737544196	f	elpasotruck
SuperBowlXLIX http://t.co/R0GEL9BJ6p	1422476085	560531445496958976	f	elpasotruck
http://t.co/2Toy9ScFds	1422473922	560522372609212416	f	elpasotruck
Celebrate ValentinesDay at our Lexington Location.  http://t.co/YHbJCrYe9T http://t.co/E6ko9lGsS4	1422471283	560511305959112704	f	elpasotruck
RT @MockTurtleMoon: @ElPasoTruck you are welcome, great truck!	1422379082	560124586977918977	f	elpasotruck
@MockTurtleMoon thats a CoolPic thank you !!	1422309112	559831109543145472	f	elpasotruck
RT @MockTurtleMoon: As long as the @ElPasoTruck is on the corner of 72nd I can cope with anything Snowmageddon2015 throws at me NYC  htt...	1422309080	559830977707798529	f	elpasotruck
Thanks @ilusstration. design FoodTruckDesign Food Truck	1422205544	559396715879743488	f	elpasotruck
Wishing everyone a Happy New Years. Today we will be at 97th and Columbus ave	1420223348	551082781795966977	f	elpasotruck
Celebrate New Years Eve with Us !!  http://t.co/YHbJCrYe9T http://t.co/85XYlpJFTY	1419965480	550001205133737984	f	elpasotruck
http://t.co/YHbJCrYe9T http://t.co/KB24a8uHoc	1419888169	549676937963393026	f	elpasotruck
Make your reservations today : http://t.co/YHbJCrYe9T http://t.co/OUbTh45CWh	1419639881	548635544377643009	f	elpasotruck
We are hiring!\n\nLooking for a couple experienced cooks to work on our truck on Sundays in Red Bank.\n\nAlso looking... http://t.co/qEyPrIsDpT	1440789605	637343917889994752	f	veganlunchtruck
@filmlovernyc we will be back at @pineboxrockshop for the @veganshopup on the 12th	1440787407	637334697262063616	f	veganlunchtruck
Our cookbook Street Vegan is nominated for a @VegNews veggie award!\nPlease vote for our cook book and win rad swag.\nhttp://t.co/58aubGk53D	1440715687	637033881020010496	f	veganlunchtruck
Sorry everyone who is asking today.   We aren't out.  Will be in red bank on Sunday	1440695728	636950168273858560	f	veganlunchtruck
RT @fairfoods: Sticky salted caramel almond bar. Based on a recipe in Street Vegan by @VeganLunchTruck - incredible recipe book. http://t.c...	1440611731	636597857223593984	f	veganlunchtruck
Red Bank NJ farmers market today 9:00-2:30\nMexican hot chocolate glazed twists, candied macadamia pancakes w/ stout syrup, Korean bbq seitan	1440334887	635436692329988096	f	veganlunchtruck
@JKrzyzanowski yes!   Red bank 9:00-2:30 today.	1440331260	635421479765700608	f	veganlunchtruck
RT @TheBarclaysGolf: Who's hungry? http://t.co/IwTW8KrJP0	1440867360	637670044303032322	f	nautimobile
parked at the Bethlehem VegFest 11:00-6:00\n\nSome of today's yums include:\n\nMexican hot chocolate glazed twists,... http://t.co/IcPGwe04FU	1440253413	635094965354295296	f	veganlunchtruck
Anyone with customer service experience want to work with us tomorrow at the Bethlehem Vegfest?\n\nEmail us at thecinnamonsnail at gmail	1440193300	634842830238842880	f	veganlunchtruck
We could use one extra person on the truck tomorrow at the Bethlehem Vegfest.  \n\nAnyone with customer service... http://t.co/aF7nwrGILb	1440193199	634842408992137216	f	veganlunchtruck
So excited to be back in PA tomorrow!  Visit us 11:00-6:00 at the Bethlehem Vegfest 2015! http://t.co/9Dc82VJwsv	1440184281	634805001596964864	f	veganlunchtruck
We are seeking weekend drivers for our foodtruck.  \n\nCulinary experience preferred but not required\n\nEmail thecinnamonsnail at gmail	1440109782	634492531925979136	f	veganlunchtruck
We are seeking weekend drivers for our foodtruck.  \n\nNo cdl required. Culinary experience preferred but not... http://t.co/drzlg1rdZ2	1440109716	634492254892236800	f	veganlunchtruck
RT @BethVegFest: Coming from out of town and need a GPS address for Bethlehem Vegfest? 316 S New St will get you there!	1440036680	634185917666828289	f	veganlunchtruck
PA here we come!\nSee you @BethVegFest this Saturday 11:00-6:00\n\nFind us this year right next to our hero @vegantreats http://t.co/xw6HENmUr3	1439902985	633625162076811264	f	veganlunchtruck
Do you have commercial baking experience?\n\nWe are looking for bakers to work overnight at our kitchen in... http://t.co/GUzgROf9eD	1439848737	633397628852666368	f	veganlunchtruck
RT @ChooseNJ: Foodies choose New Jersey. NJ Food trucks @VeganLunchTruck + @OINKandMOObbq are among the 10 best in the country. http://t.c...	1439823374	633291248275689472	f	veganlunchtruck
Hare Krsna! \n\nYummy vegan strawberry shortcake we made for a birthday today. \n\nI love how the cake board cake out... http://t.co/Chw6DFk69c	1439759823	633024696360005632	f	veganlunchtruck
RT @katalbert: @VeganLunchTruck your staff is killin' it this morning. wouldn't want to be anywhere else.  whatveganseat http://t.co/qeSq...	1439744261	632959427180658688	f	veganlunchtruck
Parked at the red bank farmers market 8:45-2:30 \n\nWest front st and Shrewsbury ave are partially closed due to... http://t.co/jxqb1IdmZ0	1439728860	632894827164778496	f	veganlunchtruck
@losanno	1421616846	556927535175729152	f	crafflesnyc
@losanno @AsBestRecipes @yelpchicago @SteeleWines @AmaroMonte @ChicagoPORKCHOP @ChiFrenchMarket @chicagofoodieg	1416007474	533400123444035584	f	crafflesnyc
Come get your crepe or waffle @ 68 lex!! Warm up your day with our gourmet coffee!! : ) : )	1415899235	532946139348496385	f	crafflesnyc
http://t.co/9TgGoigVvJ	1415844569	532716850036359168	f	crafflesnyc
@vendyawards @doughbrooklyn @iceandvice @TheAlcreamist	1410645255	510909347749433344	f	crafflesnyc
@jefflac @vendyawards @nydosas @solberpupusas @halloberlin10th	1410645230	510909245081280512	f	crafflesnyc
@losanno	1410645222	510909210071425025	f	crafflesnyc
@NYCFoodieFinder @vendyawards @TheAlcreamist @doughbrooklyn @iceandvice	1406406041	493128795713699841	f	crafflesnyc
@Complex_Sports	1391926650	432397826707193856	f	crafflesnyc
RT @iamscottpage: U.S. bobsledder stuck in hotel bathroom smashes through door for freedom http://t.co/6ZddftPrSf http://t.co/vbYeAIxi7E S...	1391925845	432394452720975872	f	crafflesnyc
@castingqueenny sure. 917 744 5453  or dinar@craffles.com	1389385233	421738353147781120	f	crafflesnyc
@castingqueenny , hello, what kind of project?	1389320576	421467162835169281	f	crafflesnyc
sg822's photo http://t.co/KWhkXaE3zz:)	1388726745	418976452848410624	f	crafflesnyc
Happy holidays!!!\nMake ur holidays sweet with our delicious crepe or waffles. Our location for today. Hunter college and union square.	1388428190	417724223269142528	f	crafflesnyc
Our locations for today. Hunter college and Brooklyn college	1387476362	413731966367047680	f	crafflesnyc
http://t.co/jKJFC95BJ4	1387397511	413401242757758976	f	crafflesnyc
Craffles at Brooklyn College... http://t.co/qRIr2w8nzK	1387054396	411962113587163136	f	crafflesnyc
Hey guys. Warm it up yourself with hot coffee or chocolate with fresh made waffles or crepes.We are staying on 6th ave and 58th st.	1387045723	411925735683919872	f	crafflesnyc
Hi, Craffles truck outside of Columbia university, craffle your day with the nice hot waffle or crepe.	1386961048	411570582506205184	f	crafflesnyc
Snowflakes give us incredible spirit of holiday!!! crafflesnyccraffles http://t.co/ZmgvbOsx3w	1386909009	411352315720110081	f	crafflesnyc
Just a few weekend left! \n Thanks to @GovIslandFood and  @livefastgroup we'll be vending on @Gov_Island all summer http://t.co/DoTUiTpGpf	1440845499	637578351545327617	f	mausamnyc
RT @jenna_dubs: The new @fritesnmeats is opening across the street from me and my life will forever be changed	1440848650	637591567197450240	f	fritesnmeats
@SqSupport @Square created some marketing collateral for loyalty program, can we get someone from square to proof it?	1440847438	637586483537444865	f	domotaco
RT @glamournl: Onthuld! @miljuschkaw 's guilty pleasures, grootste kookblunder en foodtips: http://t.co/xF2E5PV5fp http://t.co/iVhyf67Ro2	1440848828	637592313603182592	f	polishcuisine
RT @SweetKimzz: phillycheesesteaks EaglesNation Preseason @shortysnyc bestcheesesteak can't wait for the cheesesteakfestival http://t....	1440851248	637602466008297472	f	shortysnyc
Open @ Bergen and Court!	1440852871	637609271732125696	f	carpedonutnyc
@jenna_dubs almost there!  Make sure to tell ur friends!	1440854393	637615655416672256	f	fritesnmeats
It's not too late to order some lasagna for Sunday dinner @greenboxny @foodnfest http://t.co/pkWgx767f0	1440854877	637617688412594176	f	valduccis
Suns out! And so are we at Williamsburg Smorg, @TheSeaport, and Ft. Greene Flea. 3 great locations to get our food today!	1440858609	637633341517250560	f	milktrucknyc
Unless you want some pasta http://t.co/NBjoBnYVKi	1440858251	637631839801352192	f	valduccis
RT @OriginalPenguin: Now that was a grilled cheese @morristruck beanoriginal http://t.co/MLgZvFeMBR	1440860125	637639700287778816	f	morristruck
Here's the Difference Between Your Favorite Vegetables http://t.co/8Lw6NIsqiU via @thedailymeal http://t.co/LWWMRToo9J	1440861042	637643543457173504	f	souvlakitruck
Truck with a view! It's food truck nation on King Ave @GovIsAlliance - join us for a meal today! http://t.co/M6UoZ9Z3UW	1440861549	637645669751201792	f	snowdaytruck
Good Morning NYC,\nWe are parked on 67st & Broadway today. Come try our Fresh Lobster Rolls, Sliders & Gazpacho. @AppleStoreNY	1440861180	637644124401889280	f	lobsterrolling
Very proud we are too! ;-) RT @choyo: love that @dubpies is official pie of blazercon. http://t.co/w0Nk99T1Ki cc @meninblazers	1440865311	637661450912276480	f	dubpies
RT @five15design: NYC - you MUST!\n\nRT @dubpies PieTruck will spending all day, until late this evening, on Bedford Ave @ N7th. williamsbu...	1440865228	637661103271596033	f	dubpies
PieTruck will spending all day, until late this evening, on Bedford Ave @ N7th. williamsburg foodtrucks	1440864940	637659892371824640	f	dubpies
DE TRUCKS:\nKastaar @ Governor's Island til 4pm\nMomma Truck @ 7th Ave & Carroll St til 1am	1440871023	637685406117535744	f	waffletruck
De CARTS 2/2:\nBierbeek @ De Great Lawn (Central Park) til 7pm\nGoesting @ 66th & Broadway til 10pm	1440870795	637684451493965826	f	waffletruck
De CARTS 1/2:\nVedette @ 59th & 5th Ave (Manhattan) til 7pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm	1440870776	637684372263555072	f	waffletruck
SATURDAY NIGHT DINGES\nLe Cafe @ 15 Ave B til 11pm\nDe Wafel Cabana @ 35th & Broadway til 10pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1440870748	637684252734263296	f	waffletruck
Oh shucks son.   We love you all too!\n\nhttp://t.co/Jk2fxDQ0WF	1440870993	637685282272374784	f	veganlunchtruck
G1 - @prospect_park  Neathermead @ILOVECGC \nG2 @NikonJBT \nComeToTheCheeseYo	1440872073	637689810115796992	f	gcnyc1
Truck is currently at jacob Riis park! Swing by for some tacos, hot dogs, burritos, and quesadillas 	1440871628	637687945441488896	f	coneyshack
For one free dinges: If you were to break a world record, what would it be? dingesforeveryone	1440872335	637690911200292865	f	waffletruck
Another awesome weekend @governorsisland and @Yankees @nyfc so catch a soccer match or chill on gov island and... http://t.co/ltkp51AUKL	1440872798	637692850705051648	f	carlssteaks
IT'S SATURDAY!!!!\ntoday August 29th we are open for Dinner 2pm-11pm\nMI VIEJO SAN JUAN \n2920 BRUCKNER... https://t.co/JUpSpCTwsy	1440875052	637702308747415552	f	latinkitchennyc
Private Party on Saturday. Having so much fun!! Catering party friedtofu bao guabao bun... https://t.co/mvotktctBF	1440877734	637713556079837184	f	kayanyc28
Find us tonight @RoyalPalmsClub till 1am! cheesetownUSA	1440877594	637712968336187392	f	morristruck
RT @nycfoodtruck: Tomorrow, WE. EAT. GREAT. See you at Prospect Park's Grand Army Plaza from 11a-5pm TOMORROW!\n\nBrooklyn Organic... http://...	1440880935	637726983414263808	f	andysitalianice
RT @Eater: Here are America's most anticipated food halls:\nhttp://t.co/micxTirbuR http://t.co/MgJOFLzZZf	1440881555	637729581559115776	f	eddiespizzany
Just horsing around with this horse themed chocolate cake we made today.   \n\nThe head is crafted out of vegan... http://t.co/9eeXB7FhvB	1440881696	637730174310727680	f	veganlunchtruck
oldtraditionalpolishcuisinelunch kielbasa pierogi catering nyc http://t.co/1YISY6LHZo	1440891824	637772652157927427	f	polishcuisine
TONIGHT THE LEGENDARY SATURDAY NIGHT PARTY CONTINUES AT\n copacabananyc\n47ST BETWEEN 7TH & 8TH AVES.... https://t.co/MDrAcaXG15	1440902397	637816999188557825	f	latinkitchennyc
We lost connection @Seamless and @GrubHub -- please call your favorite @shortysnyc location for delivery orders 	1440894063	637782046593540096	f	shortysnyc
@shortysnyc FlyEaglesFly http://t.co/x4WFKOlKCo	1440892712	637776379531108353	f	shortysnyc
RT @ShopKeep: These multigrain empanadas make us go a little loco. Can you blame us though @Palenquefood?! ShopKeepLife http://t.co/qv72DV...	1440895772	637789214260772865	f	palenquefood
We deliver everywhere   @greenboxny @FoodtoEat @eatupnewyork @Foodtruckstars_ @ChoiceStreets @LaBellaTorte @ChefDom http://t.co/bu7DqSpgYs	1440891335	637770603630567424	f	valduccis
@crimsoncor garbanzo or spelt	1440893488	637779632155136000	f	veganlunchtruck
Lots of free activities!\n Thanks to @GovIslandFood and  @livefastgroup we'll be vending on @Gov_Island all summer http://t.co/SMruz1SPEX	1440932327	637942533344075777	f	mausamnyc
RT @Mei1506: @DreamyJayne oh forgot to mention please visit @dubpies when you go to Brooklyn!! They make the best and true kiwi style pies!...	1440938774	637969577687805952	f	dubpies
At the Red Bank NJ farmers market today 9:00-2:30\n\nBLUE CORN PANCAKES WITH PINON BUTTER & MAPLE SYRUP ARE BACK! http://t.co/O5ZQsSnfaL	1440938892	637970070543683584	f	veganlunchtruck
Giddyup! We'll be at the Prospect Park Rally today 11-5pm	1440942169	637983815080783872	f	kimchitruck
PieTruck will be @ProspectPark Grand Army Plaza Foodtruck Rally today 11am-5pm. Savory & Sweet pies, Cold Brew	1440940001	637974720848207872	f	dubpies
Check out our new menu!! We'll b @prospect_park all day for the foodtruckrally @nycfoodtruck @DispatchNY http://t.co/7uegIbAlY2	1440945369	637997237889540097	f	andysitalianice
RT @ToumNYC: What's up Brooklyn? Join us for the @prospect_park foodtruckrally until 5pm! sundayfunday http://t.co/hnJHYZzdLm	1440945240	637996697017257984	f	andysitalianice
What's up Brooklyn? Join us for the @prospect_park foodtruckrally until 5pm! sundayfunday http://t.co/hnJHYZzdLm	1440945197	637996517425590272	f	toumnyc
Shack is open at the Coney Island location & the truck is open at Jacob Riis Park	1440943759	637990485357895680	f	coneyshack
Open at Grand Army Plaza. Food Truck Rally. Come!!!	1440944564	637993861403570176	f	carpedonutnyc
Whattup NYC? It's a beautiful day to come to Governors Island & getcha the best chicken in the WORLD! YDD American foodtruck	1440944132	637992048612786176	f	usafoodtruck
Good Morning NYC,\nWe are on 77st & Columbus Ave today. Come enjoy a Fresh Lobster Roll, Slider & Gazpacho. @Chase\n@DuaneReade @Starbucks	1440944293	637992724310925312	f	lobsterrolling
RT @LauraSalam: Drove 1.5 hours just for @VeganLunchTruck heaven  http://t.co/65OXyerdqR	1440945184	637996462635401217	f	veganlunchtruck
6 Knife Skills That Will Change Your Life in the Kitchen http://t.co/jST8RfRiWD via @yahoofood http://t.co/odidnu2h0h	1440946229	638000845364273152	f	souvlakitruck
RT @livefastgroup: Come to @Gov_Island and check out our great trucks that are part of @GovIslandFood @mausamnyc @USAFoodTruck @elpasony @P...	1440946640	638002567939801088	f	mausamnyc
HELLO? SHAKSHUKA? YES!! I'm on GOVENORS ISLAND and can't WAIT TO SEE YOU !  http://t.co/cGEOH28nuz	1440946525	638002085695373312	f	shukanyc
RT @dubpies: PieTruck will be @ProspectPark Grand Army Plaza Foodtruck Rally today 11am-5pm. Savory & Sweet pies, Cold Brew	1440946868	638003524694069248	f	andysitalianice
RT @nycfoodtruck: . @Prospect_Park kicks off NOW! http://t.co/xSjEsM6SmU @neaexpress @PapayaKingTruck @taimmobile @toumnyc ETC.	1440947651	638006807928139777	f	toumnyc
RT @nycfoodtruck: . @Prospect_Park kicks off NOW! http://t.co/Npt4VXjJ53 W/ @carlssteaks @CarpeDonutNYC @CoolhausNY @dubpies @KelvinSlush @...	1440949268	638013591162109952	f	dubpies
Today, like now! RT @nycfoodtruck: WE. EAT. GREAT. See you at Prospect Park's Grand Army Plaza 11am to 5pm\n http://t.co/GQc7evFYk6	1440949214	638013366318014464	f	dubpies
RT @ToumNYC: What's up Brooklyn? Join us for the @prospect_park foodtruckrally until 5pm! sundayfunday http://t.co/hnJHYZzdLm	1440949130	638013013031809025	f	dubpies
RT @AndysItalianIce: Check out our new menu!! We'll b @prospect_park all day for the foodtruckrally @nycfoodtruck @DispatchNY http://t.co/...	1440949123	638012981293502464	f	dubpies
RT @livefastgroup: Come to @Gov_Island and check out our great trucks that are part of @GovIslandFood @mausamnyc @USAFoodTruck @elpasony @P...	1440947286	638005277976043520	f	papayakingtruck
RT @nycfoodtruck: . @Prospect_Park kicks off NOW! http://t.co/xSjEsM6SmU @neaexpress @PapayaKingTruck @taimmobile @toumnyc ETC.	1440947272	638005219826266112	f	papayakingtruck
RT @livefastgroup: Come to @Gov_Island and check out our great trucks that are part of @GovIslandFood @mausamnyc @USAFoodTruck @elpasony @P...	1440949261	638013562519179264	f	usafoodtruck
RT @ShanghaiMKS: Looking to try a new foodtruck? Head over to Prospect Park for the Food Truck Rally today from 11am-5pm. foodtrucknation...	1440951708	638023824806670336	f	andysitalianice
RT @jeaniusNYC: Because everything takes better when you putaneggonit.  eggporn korilla eastvillage eeeeeats... https://t.co/zvN9GI52vh	1440952898	638028816200400897	f	korillabbq
For one free dinges, order your wafel cheerleader style! \nD-I-N-G-E-S	1440952041	638025220398448640	f	waffletruck
DE TRUCKS:\nKastaar @ Governor's Island til 7pm\nMomma Truck @ 71st Ave - Forrest Hills til 10pm	1440950898	638020427558879232	f	waffletruck
De CARTS 2/2:\nBierbeek @ De Great Lawn (Central Park) til 7pm\nGoesting @ 66th & Broadway til 10pm	1440950880	638020350706647042	f	waffletruck
De CARTS 1/2:\nVedette @ 59th & 5th Ave (Manhattan) til 7pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm	1440950860	638020268309512192	f	waffletruck
SUNDINGES SUNDAY!\nLe Cafe @ 15 Ave B til 11pm\nDe Wafel Cabana @ 35th & Broadway til 10pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1440950832	638020150554460160	f	waffletruck
Come by @prospect_park FoodTruckRally enjoy the weather and a carls famous cheesesteak GOT WHIZ? nycsbest... http://t.co/pcuhLXcbZu	1440950933	638020574292262913	f	carlssteaks
Unfortunately we are closed today for a private event. See you tomorrow!	1440950867	638020296579149824	f	taimmobile
Party all day with Chris Brown and MuchasNuchas at jonesbeach! YeahYeahYeah http://t.co/3BBIVfOw82	1440959659	638057176142098432	f	nuchasnyc
HAPPY SUNDAY FUNDAY...\nwe are open for dinner 2om-9pm\nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX NY... https://t.co/d9nHgdkwo8	1440957750	638049166967611392	f	latinkitchennyc
EL TRIFONGO DE BISTEC\nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX NY 10465\n347-691-3100\n***today... https://t.co/1nwAo0c8m8	1440962334	638068394621800448	f	latinkitchennyc
JIBARITO TIME\nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX NY 10465\n347-691-3100\nToday Sunday we are... https://t.co/Hb2ABHZF8K	1440962196	638067813538775040	f	latinkitchennyc
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: mca
--

COPY users (id, email, password, admin) FROM stdin;
1	peppage@gmail.com	$2a$08$U1gc9WCfAwjTicIM7nUuS.v0spiLrGBUPk711WKesep9cNBAbTX/G	f
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mca
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Name: images_id_key; Type: CONSTRAINT; Schema: public; Owner: mca; Tablespace: 
--

ALTER TABLE ONLY images
    ADD CONSTRAINT images_id_key UNIQUE (id);


--
-- Name: locations_display_key; Type: CONSTRAINT; Schema: public; Owner: mca; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_display_key UNIQUE (display);


--
-- Name: trucks_id_key; Type: CONSTRAINT; Schema: public; Owner: mca; Tablespace: 
--

ALTER TABLE ONLY trucks
    ADD CONSTRAINT trucks_id_key UNIQUE (id);


--
-- Name: tweets_id_key; Type: CONSTRAINT; Schema: public; Owner: mca; Tablespace: 
--

ALTER TABLE ONLY tweets
    ADD CONSTRAINT tweets_id_key UNIQUE (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

