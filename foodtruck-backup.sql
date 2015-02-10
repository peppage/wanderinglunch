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
-- Name: images; Type: TABLE; Schema: public; Owner: pepp; Tablespace: 
--

CREATE TABLE images (
    id text NOT NULL,
    suffix text NOT NULL,
    visibility text NOT NULL,
    twitname text NOT NULL,
    menu boolean
);


ALTER TABLE public.images OWNER TO pepp;

--
-- Name: locations; Type: TABLE; Schema: public; Owner: pepp; Tablespace: 
--

CREATE TABLE locations (
    id bigint NOT NULL,
    display text NOT NULL,
    matcher text NOT NULL,
    region text NOT NULL,
    lat text NOT NULL,
    long text NOT NULL,
    hood text NOT NULL
);


ALTER TABLE public.locations OWNER TO pepp;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: pepp
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO pepp;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pepp
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: sitestats; Type: TABLE; Schema: public; Owner: pepp; Tablespace: 
--

CREATE TABLE sitestats (
    "time" integer NOT NULL,
    uptown integer NOT NULL,
    midtown integer NOT NULL,
    downtown integer NOT NULL,
    brooklyn integer NOT NULL
);


ALTER TABLE public.sitestats OWNER TO pepp;

--
-- Name: subs; Type: TABLE; Schema: public; Owner: pepp; Tablespace: 
--

CREATE TABLE subs (
    id bigint NOT NULL,
    regex text NOT NULL,
    replacement text DEFAULT ''::text
);


ALTER TABLE public.subs OWNER TO pepp;

--
-- Name: subs_id_seq; Type: SEQUENCE; Schema: public; Owner: pepp
--

CREATE SEQUENCE subs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subs_id_seq OWNER TO pepp;

--
-- Name: subs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pepp
--

ALTER SEQUENCE subs_id_seq OWNED BY subs.id;


--
-- Name: trucks; Type: TABLE; Schema: public; Owner: pepp; Tablespace: 
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


ALTER TABLE public.trucks OWNER TO pepp;

--
-- Name: truckstats; Type: TABLE; Schema: public; Owner: pepp; Tablespace: 
--

CREATE TABLE truckstats (
    id text NOT NULL,
    "time" integer NOT NULL,
    street text NOT NULL,
    region text NOT NULL,
    location text NOT NULL
);


ALTER TABLE public.truckstats OWNER TO pepp;

--
-- Name: tweets; Type: TABLE; Schema: public; Owner: pepp; Tablespace: 
--

CREATE TABLE tweets (
    contents text NOT NULL,
    "time" integer NOT NULL,
    id numeric(20,0) NOT NULL,
    retweeted boolean NOT NULL,
    twitname text NOT NULL
);


ALTER TABLE public.tweets OWNER TO pepp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: pepp; Tablespace: 
--

CREATE TABLE users (
    id bigint NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    admin boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO pepp;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: pepp
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO pepp;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pepp
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pepp
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pepp
--

ALTER TABLE ONLY subs ALTER COLUMN id SET DEFAULT nextval('subs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pepp
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: pepp
--

COPY images (id, suffix, visibility, twitname, menu) FROM stdin;
511a7d64e4b0c6a64118260c	/793192_Dtd9vMRk-pbBJscn1cb7n29zM87iJjZy6rojapRhODk.jpg	public	thepocketful	\N
51424d6ce4b0041cb8df9856	/117715_oxR8_TwNSaCL-_gKDA2i2-1YoRfVVnbfT3M9Bfu4nxE.jpg	public	thepocketful	\N
51800af8e4b07a4a57023def	/9548073_erhzj0ShEDKaz8S8DhlDe90fDjJEIWjilIxO4_zjdGE.jpg	public	thepocketful	\N
507071bfe4b06e882e74b445	/1112203_qnT5k-31-4cRKDz00cUpp7Ia7HG3YTjhsC9Udo90RDI.jpg	public	philssteaks	\N
51645882e4b0bcb0cb0c7ef3	/7511393_dEJJLGO8ljFPMA_kFidoz1wpWZ-k6mHpqYnuRwoBpRg.jpg	public	philssteaks	\N
51ab89bb498e83fced4cefd6	/66074_8dLzCKmVRde0Uvtx_NSl9SKROFh0kat1IQgcAvU4J3M.jpg	public	delsnyc	\N
54978669498e92fb4a6b4341	/97520198_KIqmbmLkuFxboBU_HjFosEOXtwVA01QnxiBHugrwImE.jpg	public	shukanyc	t
51c1ea41498e372d91835cf9	/5067950_pSXIZo_RqO8Hh5AuWcomjr0p3q_pXPUMWe99W8hUGTU.jpg	public	burgersandbites	\N
51a79983498e3044671cd784	/1441492_yfySwml4ChzJ_ni5DxTq-8n2UlecWBWjgxR-ygA6pYc.jpg	public	burgersandbites	\N
51dd9ddc498efb9a3437e123	/4501533_djr9d2BEP8dg7E48xJjJTa_Yjk0Iy-MmBG6hgIQBLUs.jpg	public	bigdsgrub	\N
50031911e4b034c2944f0c3a	/bExPPWxN-4YhYlw2nPz-T5eA3mYN-U78LUZtcIzjTRM.jpg	public	souvlakitruck	t
516cdc93e4b0d6bb083f9db2	/117715_3eRUhgkRZGVpjDAYUz9TD5yQXPVFmg0iCB7iIgv_XD0.jpg	public	souvlakitruck	f
50be4929e4b0ada0df80b932	/4611139_UjW8jF3qFz_uyk0hDKT6CMZI2q3My4j6ZiwX-68QpME.jpg	public	souvlakitruck	f
50f59e2ee4b0b31f58d6cc1f	/1922740_OhtWiNUDUcN0NE_HB3Tk8vm5qIZcvqxcP2nMDrN8dT0.jpg	public	kimchitruck	t
5197fe76498e1c056c96d21b	/117715_m462oAqyqBN12xyWCOyzYR6-1gtYrUa8BiX9r9OybE8.jpg	private	kimchitruck	\N
4e3da652d4c058f9dc087a6c	/QEOIS2W35WLTHYK00QC04LKKX4X1SYW3DDI45X30HSKTJENQ.jpg	public	kimchitruck	\N
501975c5e4b092f6a51ef338	/bI7RrGcK_moyn-kJICa1OCciBVuYYykwCMGlea6mcxg.jpg	public	kimchitruck	\N
52d32962498e318b0a9942f1	/61382883_iF5gX7tlMJ3CWlWcTkpntPniCUpS3o7H8anOau4wiKA.jpg	public	usafoodtruck	f
4fc7a5d3e4b0647c52b3c26e	/iRvxK7ohXIwK9Ib6wkVgtR46VKRLsamXuElhEtOlNKc.jpg	public	andysitalianice	t
4fc2552fe4b0cec932846e84	/cjaTu8CSMM7HvFDxIUk3I2TF_I8mJyZuejfwTgYLc-c.jpg	private	andysitalianice	f
4feb6e00e4b048145c547997	/wcCcDDUFo3EAkWygR8pGn29HTAv7VKEvPwJgzS6hQcw.jpg	public	andysitalianice	f
507b0648e4b0109f3656e2d2	/76137_7JNe3m0dO2MZ7a9rkqa_DTlnrw0LyNitqksFG7_5IC8.jpg	public	lobstertruckny	\N
508abe69e4b01ff7516d118b	/8029486_9wt2tO9BnY5d11Ef0mpAgHAqfK1QMmSvLXglU4fj6Xw.jpg	public	lobstertruckny	\N
500ecc9ce4b0a6d209804d9e	/d2yG6CtTrc8TQAXoEGN68UYAv3DiJIqJvKU65-ApcaU.jpg	private	lobstertruckny	\N
5245c7a1498e0eb9bc097723	/1727660_xLZtYmqATL4pckN_IhgIj0AgUbDAJxywzqbf5PKEooM.jpg	private	lobstertruckny	\N
4dcbff9440a3324246c6fb7c	/YVZPSDS5D1O5DR2NK5IFQKOU0ZNOQTQMTHMRWS3ESLQIQAWK.jpg	public	lobstertruckny	t
525c259b498ea7548cf31f8e	/769710_ZxOOtsSbFVklHIRhXVmTO7ops0Pm0EybRDTgUvGHrSY.jpg	public	disosnyc	\N
5197cb68498e8d409a89ec1b	/1847096_oRB5R_owQW40gVWlJhNNsh9_0bEq2D8Rt3Zod9HUbUg.jpg	public	disosnyc	\N
51dc5fec498e4e9be748eac4	/22801_gX0atVT6Jt_H6FPXuYAqHD4VzO5jAmS4SVid_ZLkk5U.jpg	public	disosnyc	\N
520538a611d2b476431ac7f9	/117715_GMdoseCn4baUtTX9kN6_PAAfHaGIlUpjxzAitpqLAOY.jpg	public	chefsamirtruck	\N
5294e76b11d2879d5217bd00	/47558447_v1SwJZbLSZ2etlJXOF9qw4H3vErpdTiVIqXxULSVTSU.jpg	public	chefsamirtruck	\N
5189442c498e765ce62d5924	/2432527_5nUa0fTfy4rzjXpiIUIlkguBa2kdqFSZIG-PLvkKu2Y.jpg	public	chefsamirtruck	\N
4fd0d80de4b062589043211f	/hZjMDK5KKgxjMhmOGBtaRjx_ga0SWHwppqfLfqw20Tg.jpg	public	chefsamirtruck	\N
50ad186ae4b0b639ca7ca234	/295161_qCQYG0XjW1Ji0pSDxM7fWRzxTZRbcYyZbsbPNJo12hw.jpg	public	toastmonsternyc	\N
521649b811d2913e20a1ae87	/5568483_RtMp5aDM_JtBZOI1u48Jy3om4Z672obezdu1uA_UWd0.jpg	public	toastmonsternyc	\N
535d6fe9498eeb428f0a49a5	/643701_B0msQNcQCClAiTuYbiNnskLICf99ehNmerkWdhYNR8c.jpg	public	snowday	f
533ddd9a498ebf7fb4775ca2	/36814481_r4TU0Q7tJ6Xum58iZ5olLRY6sV-P4dN3psrhw2ZZKZ8.jpg	public	snowday	f
51f4589a498e97316d307dab	/186827_ilvLMlb3AFqgXUQJ43S7IjsLNPxYP3Pw5LEjrqhp6wI.jpg	public	chipsykingny	\N
5135022ee4b0592185aa975e	/2660256_0rdKd0P0tCYzLf5j7-_3b8HbPNDVCW6S0hHdJGW47Wo.jpg	public	mikenwillies	\N
5012d0d5e4b06fc7ce735a68	/7J2g1YLtx4ma57g4A4CerJJ66OwudjGhFI67JaNl1Qw.jpg	public	seoulfoodnyc	\N
51fd732d498e415eeb8b9881	/8839239_mAp7_MVmWbbK42Xq3-W-1zmegy-MNx8NzB0P5Brf-Pw.jpg	public	delsnyc	\N
520e673a11d25d1282a44199	/117715_KjwJnc6idBB7TuMKhGboHDg8IYjlGcr6h3I6_fJECmM.jpg	public	delsnyc	\N
51b8d7aa498e103b3a36ec2d	/47900463_7B6lLfz2PW1XyrG2vCIxp4vIq7QXWEhxufI5i75jwxE.jpg	public	delsnyc	t
518a82c9498e068718057964	/25979758_bGWQQ7W2SJI4v7KmU891VcYZGitov6qbSNAnIEt8HTo.jpg	public	toastmonsternyc	\N
53860b95498ee26cd484fe30	/81832079_fNoLG8cvJl_IqYaTNF8p9uwsDsglMXnfF2DKZ8X0Tk4.jpg	public	mtblls	t
53e3b619498e4b9015f0bad7	/68150_s6TPzQTspWKu7AI0DXgjZai6xKrtSkWgIdJNkenXMfs.jpg	public	mtblls	f
523887bb11d2ac89551d71ff	/5568483_apwtHKsNfvYc-IjeDL1_oqXIqZsLTUGH_-l1uxxAiGo.jpg	public	mtblls	f
519bb23b498e208a0b81b7fa	/9285455_LZiJ4FLH7NOWjNUsXO9jxDRFAgLygBSB8SmSIW0z9kM.jpg	public	mactruckny	\N
5165924de4b093be3bc5cd57	/2159706_uFl3RYgA1z4EiDNp8PtjjG2HHWhTiiXDLNzJtFWPHS8.jpg	public	mactruckny	\N
5151c82de4b024888079c5ea	/5003144_g8kbTzyfr6gL9vIRpMBbXz4TqBUk5EgkqIPlBP9DtsA.jpg	public	mactruckny	\N
50883301e4b0904987088a20	/2361939_J2zcgauqqGFC_PZPyvkfEDoSufdDe5qE7gi_NkS1P1U.jpg	public	mactruckny	\N
5203e16e498e9e8e0a93b61a	/702028_Fog-6PEF03KateivIPP-hx87Qn6gi7PwnaJv-wTFv3I.jpg	public	carlssteaks	\N
52e456f2498ea9ece32b66e0	/25812424_w-pfXOZy2D8xWVJY37hGi4VXYiDnicBFvWRiiDOnNhE.jpg	public	carlssteaks	f
520912ad11d2f941183dea9f	/13285510_v7K0PTg4FzGI822Jbc9A8K5mUHIxwJPBZB_0xNeEauE.jpg	public	domotaco	\N
50ce269de4b07c1547ebfb2c	/263293_qjcLaRmf5itOMyRiq4AyYZuY2UVjVJk04lO3FTA2CMY.jpg	public	domotaco	\N
4ec59ebacc21b428e0de466c	/4AMXSGP5YGTUHEL3TFKTS5ROVIX4HUTU4MU5ZW1OX5E3URDD.jpg	public	domotaco	\N
50ce2696e4b0881a7ef3ee67	/263293_lcA30Y_JnQGKaaHhRqFUio2HQ8UQkphCWP9yhW4CE3g.jpg	public	domotaco	\N
542a28a1498e4288ab95e302	/68150_E567_ql-1p2jEv5ysetaEOgtnxpMmeLwZghpwLximCw.jpg	public	papayakingtruck	f
542a28a8498e8c25fb70df8c	/68150_ru2bxW9jr0deeGFaJrvEbwBh8Bv1FRW82ZIglwoRv1M.jpg	public	papayakingtruck	f
520f87b511d2e753e7955853	/44_gUd2HlRFt-yMUFcOdI_EUCdz5NK86hKk-3kHwZhHou0.jpg	public	carpedonutnyc	f
5199097e498ea36447e54093	/40899881_hbjUdavpBfT-sLaBhv3pbZydT1tgs9v-Maw12j9I3Xs.jpg	public	carpedonutnyc	\N
4fb29dc4e4b0e08c1e225555	/ckjwTj4Fd2cRoZvDQZw_1jYdwuBF4BsfV4ZWc5oElFo.jpg	public	eddiespizzany	\N
4da8977840a3582fb8c49316	/MCGIPRA0XR15JNG4O2YZJQBCRMK05UVTC4T14TOQWRTNMQFZ.jpg	public	eddiespizzany	\N
4fd79157e4b071eb33a9c810	/8zrcTIejD5EBiOJzSobql1_PQWr-i2KmRfgMCYmbK-M.jpg	public	eddiespizzany	\N
4f9c18b0e4b0b38d2f554383	/AQEKYbyPrQt5uMWhy4r4ODm2vSMCqPseJyMhcg55mtY.jpg	public	eddiespizzany	\N
52a0bef911d299250c89f9c7	/349672_Cg8dtcrfQ0WZeSo7BJR61YBG6VzsiMltZP8XIqyHiu0.jpg	public	mrniceguytruck	\N
529ccbc511d21047117cdea2	/68150__CRf8sW9KvXZTkcAQEc4EsnYPgqXA2trmMxy-_AzobY.jpg	public	mrniceguytruck	\N
52e2aa07498e25b9a084ee94	/12998378_50qpDzH_XwsSlaJpw-f2fDtJsSvQg4TU_ujjdsnyWOw.jpg	public	hibachiheaven	f
5362891011d2b40c5f328b6e	/41834822_k1LVelyLVM9gsNt3M70sVjI-QLm_84bgv4c6hoMHPO8.jpg	public	hibachiheaven	t
4fda1cf4e4b0f6aceebbdb2d	/lKL7uz06jZgB680Vye9zxa_2yQfH96afFExvxaLlRpU.jpg	public	hibachiheaven	f
52e6af38498e26e622e5398c	/4147709_E9hzkLfHAJjdgQ6RT3W29cf-cftJShyXpRthu8riZYs.jpg	public	hibachiheaven	f
526fef71498e92d1ace459d9	/60805368_eCRrBwapYrNL8fM9tmIaLCfnlhQYb9ASU-ZkaR1Og54.jpg	public	mamuthainoodle	\N
5203bd51498ed50247ee01dd	/60805368_HlIeqCMjY2I5md2mzI5crKizc9wVPUZo_sBmC6zrPEA.jpg	public	mamuthainoodle	\N
4e09f3fca12d09aa881a769f	/NTSOFYDIBYVWGE4RYQTBBNIAQESPZ1LLW3Q4TC3TGMROSJPH.jpg	public	nautimobile	\N
5022f267011cfeafe81dab9a	/7EPnN8ReXYQWoZYxzqkH9AQlOe8vFPtVP_60n65i9U4.jpg	private	nautimobile	\N
4e70e35c52b140871b6fa35f	/1TB5ROKJY5NF0GAVS4YS3WZTFCUXXHTPLLBUIK4BU0XD0QA5.jpg	private	nautimobile	\N
51ccc251498e028212e9b1e3	/117715_ozxp6K6iPGwKCzQDARR3BgMcisplkTt0x4LEKDJdBMk.jpg	public	nautimobile	\N
4fe1fbabe4b0be4ebe6c1c52	/HNMFUfRPXDmxSDWAwh7pixJ34SFUY0fgzZFeOLAVXU8.jpg	public	funbunsnyc	t
51c8a3c5498e797153ec5629	/46314126_95x6AErCZEGSi1zGZrFCY-EzgsIMyOhgO4G59l-u_Xg.jpg	public	funbunsnyc	\N
5212ec18498e9494b634a94c	/814104_tUkLgiQ8zcYxovra9R8PIx7FckFhBjzNVHmirteXd58.jpg	public	funbunsnyc	\N
4ffda271e4b03bbc7f8fd13a	/6Dtx8fj7IXT6M3O6ZV3rXryb6zKTAqPchjeOM2BJJAs.jpg	public	funbunsnyc	\N
505204d6e4b02dee62bd961a	/dcOYoRoNNeCLMxvoyAN-o9gJObcw5FljMqYpS9cps84.jpg	public	funbunsnyc	\N
4f753600e4b07eec20023ddb	/zUb4OswXiQLnF_k2xnx7AdupnEIl1nuGyIuFcmFWf8Q.jpg	public	thetreatstruck	\N
4fbfe026e4b04422a08a40f6	/Han8Z4R-SQ615pLoN2lRdPfKEFa6UW2yudSOxXmJtts.jpg	public	thetreatstruck	\N
51461b9de4b0bb73a6821e97	/1102787_UDt7OJpexNs8VPrehVDsp9EtfUJnMhKzJ2tTXuof06M.jpg	public	thetreatstruck	\N
4fbfebe9e4b0a3bda0340383	/Brw9_z178IK92xMEXLCSSZrP0-99GXjutCp7dHCi5CQ.jpg	public	thetreatstruck	\N
51f15b4d498ee58fec420a7c	/13285510_Q-SBXKFpfroSwQ-QJdezzrh1KaHfHAmLyicy8d5S1jU.jpg	public	parissandwich	\N
527d2c2711d2c984e85cb11b	/4179871_5FQ2eCC5ZeizUVRLh4tadgEAO1BnJjVQ7pSEvSDwIfQ.jpg	public	biandangnyc	\N
512161e0ebca7d20d6a70104	/4574_ZC6mf3ha1jNXmFUDgtNsN3zIf-NHyqgxA3WkUkOl4mY.jpg	public	biandangnyc	\N
5106b878e4b05ec869ad8b34	/814104_blIawoImaEcqf-Mg89W5A-nEHiZ5jx76BEYHVzz8dnA.jpg	public	biandangnyc	\N
505c9776e4b0643aba1071c7	/5568483_yQrtG73dbug7q06p9IASJmTFnOVgGprIZKbfHjQRcso.jpg	public	biandangnyc	\N
51cc7075498e8d24309aea57	/991186_cg_CePJhqcT81QY5l1L4eB3MQxy_QlsRh4zmZDk8cFM.jpg	public	biandangnyc	t
4e4e92c7b0fb088f3c0f14d5	/HTLXSW2D30RGIEYPI0JGR22LUCS5BTXQ0LXDWAOHH4PCVHM4.jpg	public	bigdsgrub	\N
4dfa4a9840a3542ff44549df	/VBAJNQCBWDMP2WKDXJ5QHQ0WYF1MKHZSLUAZZJXKDBDLDUWG.jpg	public	taimmobile	\N
51cb2c41498e9851cecdd49a	/5728350_vuJ4ORu0wHhd-B-f4FTNfsoIhfHgtJRMJc-QEeiYmNQ.jpg	public	taimmobile	\N
504a271ce4b0c65efb6b05f5	/PG0DfZvsxtqv4QM8Xpl6y8Ojahb0UanYwCPSdmuhj_E.jpg	public	taimmobile	t
4fa814d1e4b0d607baf8bd9d	/2drHnu4mqj-uzpwwcJa3MatYGD7KFuxjE472rButWlM.jpg	public	taimmobile	\N
519fa37b498e7adf7e8ebce3	/47170230_A9xVWAtkJBP-vVqUF1q2WlK8yuZTf1CVQz0JcPrHGY0.jpg	public	taimmobile	\N
5243126c498ea77b19b3a444	/65506790_31Qpx9E-ZjuNve-izmDY6vVxUCMrhgGsnOLn4-fusp4.jpg	public	parissandwich	\N
51b22a0a498ec00d1c45726c	/390807_y2oeK6xR54wk9b1Sfm82Ek09Auv2lNkRTpJOzos3xjU.jpg	public	parissandwich	\N
53287a41498ef1dfde86d217	/68150_jBIeF8OZP2o4q5lJjB4TeUteiuuczqDDm3s4zQGipGc.jpg	public	shanghaisogo	t
530f7b7b498e225c3989957a	/20103877_gKGG5Z15ifazVa7PoBKpyKecZK7x2dWgjFIDOkwO38c.jpg	public	shanghaisogo	f
51c213db498e0748ab0dca3c	/53641916_5aNKp9fdHx3i_Pi15Z_X6pE3fAsTX35YBQ0nlmZGfaA.jpg	private	morristruck	\N
521f754c498ee4d6fbe8a778	/22491899_EEPqf4HeJFaaFjYabKyScGZ8symjXEgMjPUEkfpJsJk.jpg	public	morristruck	\N
51856452498e6f602088cbe1	/232510_pLk3QUUWFOu82-4SX-ObtA8bw2ZPf61QBOeIuL50T-o.jpg	public	morristruck	\N
5328764d498e217e55fa24e1	/68150_4QSMIi6zBoyrZ1VeH1Dqb3fEovQswz93yHAPvf2lGmQ.jpg	public	dubpies	t
532879fb498ec68315b3d232	/68150_KF6qgT-viSOMS5bt3lJarsNeEUjlVJn1lbAypyCl1js.jpg	public	dubpies	f
53287a0c498edd9a0567c2c0	/68150_i3UKBmIXHPN4h7gtvSQjnYfikUNmJuGRpjwKP2dLI5Q.jpg	public	dubpies	f
5345d100498eaa611b76f338	/62345083_i2VdE3VeEPlbfUgNv9mWmVmsuL19upJhcHaRX3zje1w.jpg	public	dubpies	f
51105b22e4b0a7b61fac854b	/117715_vKu0po70jlTD3qN9mXsdNiE6V5Od1hmYMVlUY9xSIP8.jpg	public	veganlunchtruck	\N
526e782b11d2a15e6fb663f3	/8761552_XH612BVbFNOBD2jJVEMDzyawnGF45FygNA3TtdKo6UE.jpg	private	veganlunchtruck	\N
5196816e498eebbaef53fe6b	/32050404_-lVnQ_kgFICQK3OBrfq4QydeDqXhz3ZCRD3TrCvMPxY.jpg	public	veganlunchtruck	f
508af08be4b02ba9b11cc747	/17430999_28ys6GXVoaOZoKPXLLK5GQpVEL8UrC1_1DajRIy8ia4.jpg	public	veganlunchtruck	f
50292d68e4b0d0acd3bb5dbb	/vv6y8qi6JFfXr9QDkIvTPP0fSmbgQ_jGXHCVwDv0c04.jpg	public	veganlunchtruck	f
51dc48a3498efe9483d8417a	/117715_dlhUlP8z_jVejqRlWaCzsJBqg0eoP6rRSjOLpszFA0Q.jpg	public	veganlunchtruck	\N
52ade258498e293fae46e684	/68150_s7DCORg1dB6IJWWdj_e_pZMg4zKZs3S_Tjkff_px7kw.jpg	private	veganlunchtruck	\N
516ef5ece4b0d1c83382c12f	/117715_Gt3J4FMusC7YQjSfEup4O7bAO10z8J4gxmnd0xKnZuQ.jpg	public	veganlunchtruck	\N
538fa2da498e8efc80bc2cb7	/26065139_jgo2VLUL2PokQdo7SP2iJ6rtca8E552GZGM3Bhu1e28.jpg	public	langostruck	f
4fe65d6fe4b09198fde5842a	/nVmhJloDitdcBPFceYT8ajqQqgXBpB_w5GoPWse33Ks.jpg	public	valduccis	\N
521e9e4511d2d8ddc5c69dbd	/117715_r7cpzyXCpOthqHouR5gdqIMX8k0TZ2KWHFun5wh-EYk.jpg	public	valduccis	\N
5079a745e4b00277f33e4836	/34723233_tCoDnWhdhZj61xi_e00MNwJoK_UcfDXCQQ7Weat8pBM.jpg	public	valduccis	\N
5280c18811d2e4df572063db	/5354893_5EtQmcwzMnTRFz9qbxjkt9FguCAC4xfW5xwUCyYIrbQ.jpg	private	waffletruck	\N
4fd26038e4b06145dfb72894	/zUVUqzIwbwoFsRrRenEhtDmBSbK2Ry9lzqeuYnmnHG0.jpg	public	waffletruck	\N
4f733c44e4b039d898ce1409	/PQ9G-O3CAtCW6ixkiwHhICEaRn0L3Lz1F95zKcl_GdI.jpg	public	waffletruck	\N
527e823311d2db75dd831ee0	/22419482_1rrrm4nhOKXQsXN25ApmVsGDw4t2J3GyjhfeQPEbClU.jpg	private	waffletruck	\N
4fba74c1e4b0a2484fae410e	/1XmG8W_3-cY3Qc-l1GwU7YSOBlzOwyGtk2BzKOkxqYY.jpg	public	gcnyc1	f
516d80bd498e8f3b47ac90e6	/36812449_Vbw1XbeTn6HJHdJF1bzMp9TvcwrqCP5edmktYCzlW6k.jpg	public	gcnyc1	f
516ee142e4b04f28d58be309	/36812449_DjR1ynMnMpwj-KmiWPZQldmGQwJ2IEzjSwwmGevqe3U.jpg	public	sweeterynyc	\N
5107e09be4b047c08ade6bf6	/760350_ZaalKVnOYdVAGoQEdugu-1Lws1LubyJBOVpZvJJD1V0.jpg	public	sweeterynyc	\N
50188a43e4b0d35e6d8035b4	/b-fKh6mx2WxCybNQkr9ovk_jv4x7bwJPVFM9RF3M5T4.jpg	public	sweeterynyc	\N
51bf306a498ed0fde41060d6	/250434_ayEUsJHsbHDQFjUrGrR2fdlBjswuffyRTlWWFrW0-dU.jpg	public	fritesnmeats	f
5413499511d26b1c8b577c09	/4195495_Ir_R8BxT1YxyTe-VuFD3U5pw6j9CobWIBlYp1FF-TwI.jpg	public	fritesnmeats	f
4e42f5ecaeb7f6be72c39c70	/JC5VO3Z50HMMMVLCCGWDQPMKF4W01VBXP1QS2LFESR55UHIX.jpg	public	fritesnmeats	\N
5244712a11d295d581384a17	/22780_QXd0BtJcOWXZwSm_ZG3oXyaNj6Qw5-p8hWQzzH121fY.jpg	public	polishcuisine	\N
5192873e498e63958610c2eb	/117715_Jf2pdeF9ztory7puWsPaFE26jmMzPEzjOfPopvTzSjA.jpg	public	polishcuisine	\N
53287ac3498ee8ce8841a510	/68150_pNBQ4zhtsUiGR_kyfk0HziUGMzyIQwYcYpJ3VpZf7tk.jpg	public	thegreenradish1	f
5243206b498e78230cd0770a	/54092198_eF4CEteD3zHjOCJzaYssyRXaQElB-GEOy2sqzBFQPm4.jpg	public	thegreenradish1	\N
53287c9c498e4b30223220d1	/68150_mMquObtK1F2QjX3VWuhYK2MtjUA9i5QRzexf9zWrBOQ.jpg	public	thegreenradish1	t
506dcb8be4b0748e0467de78	/157259_PdYI3Fpzhcz_LoGnBeymaSAZaZCiVVw43c4xaYQQIDY.jpg	public	mikenwillies	\N
51117858e4b0e14064917adb	/263293_EvgjxXJqOivd94q0mbPR_AxkRXuzkFtjOBcOWnXuyQU.jpg	public	mikenwillies	\N
513b9b7de4b04f7024bc158a	/45519738_eDUGOpHYwiR5C3VUps1gQ1YDIq0Di3WMfuirGs2EVBk.jpg	public	rickshawtruck	\N
4f8dc377e4b0ca2accf75652	/EKcue5yGEyaPnBymSd_HtBxWEZl4grYSOXMhw-gqpTs.jpg	public	rickshawtruck	\N
4fb6bb41e4b066430032e4ca	/HHZWTU3POi_yJE4GU0zI_NjZNerm5y3MjjxddcV5ZMs.jpg	public	rickshawtruck	\N
531b7d5e498e3df35f261af2	/22402741_aYe825rrQDsEq6E_Pqv35za149PBn1PcT557SaJhOK4.jpg	public	brooklynpopcorn	t
5220dc78498ebd10d150f736	/29917892_nMZHXkfxBukc2QfFqtDBTZSJ1xpMkoO7VGBJmGKkwhY.jpg	public	brooklynpopcorn	\N
5258d3ef11d26d03cc0563a5	/117715_GQ_O1nyBbVlKTaYpRlprc8ZdIEAEftbU4_9hDGjvxsU.jpg	public	brooklynpopcorn	\N
4f5e6b3fe4b033732b227036	/7Pw4h0QMNateMpgFd_DAFO0uUnsIdcGzmHG_1in7Wu0.jpg	public	seoulfoodnyc	f
4fb1335de4b0f4503b23a67a	/GSQxN-iFZejvploz8v8hm2QzrWiTmg6QdgBffmHvsnc.jpg	public	seoulfoodnyc	f
514e42c7e4b0ec8b7e400875	/48992751_ibL8tx_7JPvV3aQmnEevrdibtLP0jWytaChkCdRuhG8.jpg	public	crafflesnyc	\N
514e42a8e4b0d91e975b3db9	/48992751_womoOVd5bv-2KopmWjWEHA_WsyoWQITjAyXBuM4Ciz8.jpg	public	crafflesnyc	\N
50a696b4e4b04d062582a95e	/32050404_qo6ZUnU5LQMoqrAR6YoH5Qz-PdUcD1d1jCheEJy7lng.jpg	public	thepocketful	\N
4f7deaf5e4b0ffb6a3f2008e	/Xho5Xq8BtpNhEQvH0KRI3yX4kUstFRwTxEDj6QoawcM.jpg	public	palenquefood	\N
51b8a845498e8ebdef064e0c	/761163_j9ai1NfaIpK2TLN8JzXbTwyIhVzuZevNHBV5EpQ7Fh0.jpg	public	palenquefood	\N
51435e1de4b07d53cf71fd7a	/4486_lUhkecOFThYlMHKai4wDp4lXXiQSPLTq3Nno5WMIz7E.jpg	public	palenquefood	\N
4e6513efc65b2dc8a0bfff6d	/TUQTIKBJPOALJKHN54QRKGISWMQDDOW3WTAECOGJ4FOJTPXI.jpg	public	palenquefood	\N
4e00e61aa12db1129557e99c	/WSUNYIB0YFVRCTXB13UCRCTANZUG0DO0X2FWCUYYILU4TCGB.jpg	private	kimchitruck	\N
525ee647498ef229c65969fe	/10045965_ptbEO58Zn5wDz6kgitvMVjFScmxSkkuHNbK-AguCXSM.jpg	public	thegreenradish1	\N
5109aed2e4b01d2a5b69b022	/117715_0jgrjk5IsUFppNAL0NtebyMYoz1JMdzrnWAIjrLMHZw.jpg	public	schnitznthings	\N
5012e555e4b0dd18ec16bd37	/mZQAOCmv5lnRZ1qOUTwDXk-MLC-X-p01AfECgfLJC2I.jpg	public	schnitznthings	\N
522e088e11d2d4539942a387	/39707564_2mJZIxFUyGllfVMRjXdE86dZsCxH8cmCdUv29E4dfmE.jpg	public	schnitznthings	t
4fee068ce4b0f9bd2b4041f7	/UQwqaF9knSdh4LFRzAhnh7hcl6_dSjDTg1phtqTe_7Y.jpg	public	milktrucknyc	\N
5281221811d21e907e460e00	/4195495_akELCvAQ7aY-bfTfHk93g5g5_qcJnQJV7h_gH0FlKUA.jpg	public	milktrucknyc	\N
514360f4e4b0455b303a4d66	/8626436_tfGrSomdm1qEPFKcyb0Q5atmm3DmDeao1W8MotOtOwY.jpg	public	milktrucknyc	t
4f749b3fe4b0f06c04ae2440	/rA31cWGMm0G8EuZFYZBxb3y2OrW3oEo7vCj1L2XR3AM.jpg	public	milktrucknyc	\N
52052ef211d22b8ed81dd96b	/36360429_am9ha8rSYxAvCaSMU9ya6lI9MzIgcpR62DH6HS1b-uY.jpg	public	milktrucknyc	\N
5086e523e4b02ca59cae7bd4	/2361939_1JvatS0wOUdQQIaTmd4Vmk8bgr7aFYOR7LaMkRio0X8.jpg	public	mausamnyc	\N
513f646ce4b0b1892aaae1bc	/13285510_LmdJLKoCS9fSwm3wy96lcieTczjsLuxAEUnU3FlZDlo.jpg	public	mausamnyc	\N
51194bbae4b0cd237850b223	/793192_FQUO1SFGyLkg5NRz6VUYl3_zmFgfy0Mh8gL1unO8ijM.jpg	public	mausamnyc	\N
5254357b498ec4662e20c654	/2620660_kMXeinZ_B6lOrHRQnheIHMBr7p81ZxcUblWl0SQ1vEs.jpg	public	thesteelcart	\N
519a7e33498e6e4ea6ff66f1	/3354_e_1JMupbEA8VtOBVXgLHAvtJGQwcpHvY2JyFESXYSjo.jpg	public	thesteelcart	\N
51dc0e71498e8db4f9a8106e	/4456614_ZWvsB80ogvwYkoKIyVf6q5RfcDXwuKI4t0XJJhyLQ_I.jpg	public	thesteelcart	\N
5239ddce11d2ab4765d5cc7f	/5568483_alwOH7sfGU8-pKfLmurfe9rt3pk2G6p90KwFyC6hq1A.jpg	public	sweetchilinyc	\N
5208f543498eaeeaaad3ce52	/15629_P_UAUr_S-OO0R12wNp8LDPwr-ZbfPiWeG0Q0rrjW6Ww.jpg	public	sweetchilinyc	\N
51f2be1f498e71235db5b61b	/117715_mGfGU0UGjUMhgqgwrDPf2f44NZtfMrobqJMF8ahsrjY.jpg	public	sweetchilinyc	\N
5286645011d228bbd12f9880	/1353667_2qCG26N4ikz7mbvEGkrFkcNLagGqrzRuNyeQ35CCDE8.jpg	public	korillabbq	\N
5231f54311d26e8da5827f3b	/977282_AToQDrlKW5PTNbNGQcB24_BeJNsRMgZTeYmC9P-or38.jpg	public	korillabbq	\N
528e451f11d2a93e4361f565	/977282_wEw3nDjN0NbjC4CgQ00ON0YjdtnMocrfAjXDM4UH63Q.jpg	private	korillabbq	\N
5176cceb498efe500552cc9e	/21735785_zaQs-7anNinrrQlobBV2AjNxquTXs5g8ZY0NxvoxvHo.jpg	public	steaksncrepes	\N
523b2edc11d265bf373f82a0	/8853695_cjpq3trk4bFpcU1oHWwj4XxwwD9ZI169sNncUyOQoM8.jpg	public	steaksncrepes	\N
52fe5db111d2d7644f04c21e	/404119_k2pARWK6AW8sOni-GGVsAfTehHeRbbnRCBGhfeb1xZc.jpg	public	philssteaks	t
512bbfebe4b0b8faa466c796	/1425622_4wp7wCuj7Ci1dl_FVH9syKmrJwQavMhL9uqww1b0m1o.jpg	public	philssteaks	\N
527e77d111d2e66fa6a871b3	/649454_HIWthX8nL3SZAOwyMlKj9Y7ju9GCiN4OEV-wZR6IKC0.jpg	public	philssteaks	\N
4f67b0d4e4b08559c4c60149	/SdNxRS0joKXurf0FEv8_SRg-GeR9lGCN098_ZB2tijA.jpg	public	mexicue	\N
50784742498ec6be8cd3f88e	/155927_ebZApDyXpTKTmvOQHdBTxNc2wJrsZV2QASmpYTNAVJM.jpg	public	mexicue	\N
507efae0e4b09a52c022ec3a	/39213_nH-zcqfLCJqMvG0Nco0LWE4QuRuoL6unlEXJlJbTEF4.jpg	public	mexicue	\N
501fe830e4b0bbddce992f90	/fFBOGONZt5Zr77Vc5g8adoAiBht0f-MBut7GqorVEjo.jpg	public	mexicue	\N
523c930a11d22e1c3012a9d3	/34169985_AiTXirGu6jTaGeWWhhOfl2QIbGVaQjdDg1QCEakqza8.jpg	public	mexicue	t
513101fce4b006d9c4991bdc	/17248619_XfpmI8dNgmoeHE3BXjV8bL2yuuMTqxU3FqDr4BqX7Ks.jpg	public	bigdsgrub	\N
4fa2d04de4b0489ba3d7936d	/hsPbM0G5l3AsUaI3x6r_VkiSYo4pYlWTKK2S9zqh_KE.jpg	public	bigdsgrub	\N
506dc9b9e4b0c21f078c3bb3	/22983_XN2GbKo3a5YsNY_ZpiBcjUHTD2if3TWS8r586Uq4cEk.jpg	public	blend_express	\N
5033cee6e4b03e64bc749ee7	/tIyy6IAKcw2SSiX5JSPBCURstZZisntK_46plgrfdJ0.jpg	public	blend_express	\N
519babe8498e355d9d35fca0	/65817_6p9jSMaQMqP9QGn3KOIyuDOG15jaLxIPvsdrpZGWdj8.jpg	public	blend_express	\N
511d2c60e4b017a4221bec0c	/1425622_srSMuVL9KOV8rqb_UDiSQNwjvNOtMyF-zeTO7sHRZZo.jpg	public	nuchasnyc	f
4ffef65ae4b013ea5f373be1	/VqxEh6cK784gtMOJRF6Lnub985jBJPC6-FuwZwXt_y4.jpg	public	nuchasnyc	f
50ef1f18e4b0710a5e5cb1eb	/117715_4lM2ZgzHp4Uv61-ckuWzdXXXcPVNEH2NjISpWAEjGds.jpg	public	nuchasnyc	f
5249c4bb498ecd25dde27c5e	/764670_x0RdEOs5TL4SEe2zGgpkzPFBFmlFV7-6UQiVtoFeHaY.jpg	public	goburger	\N
5182ad6b498ef6cb59d48783	/39425123_zPh6ih4GAAygbhRJ-pyPdCr5TI3rXafgKyIEEK4HpHY.jpg	public	goburger	\N
501d4734e4b0af03cf473287	/6BUHUmEyYTTh3a2SRjSYRklUlTfQBNbFnnk_hfEojYs.jpg	public	goburger	\N
52013fe1498e5f476bfdcf83	/30611522_DHhazmY8dyNAbmijjHX7jyyfVBEiugL5-GJcTLuYjS4.jpg	public	getstuffednow	\N
523c8b2a498e959b87f8ded2	/39707564_-WCsPSk2ExKeZ8q06DtUQrpt_vcWG9-AzvFoToSdQqY.jpg	public	getstuffednow	\N
51af7257498e0c7f8979c05d	/752258_nUJpoSxZ8p9BBJMG5ISetpo3DDLzycLT_gT3z9fvJmI.jpg	public	getstuffednow	\N
50ca356fe4b05b0bb93edc40	/1590381_NyRIp7fXJtGoJoXp25IcMmufNufPxxvLEj3TVYXRo5g.jpg	private	getstuffednow	\N
51dd9efb498ebbc846c11c03	/13001992_b9dLXH02o0ZX8hyUZVtpgGW6sDyzAl23vmEl-0Hj0jY.jpg	public	itizyicecream	\N
51716b5f498e03d8bc252c48	/11709298_S8klPxq0yPyZw2X9-_0IZyk6TFTn9xi5SWd_6BGCeVM.jpg	public	toumnyc	\N
529fe66b498e1fd14afe696f	/68150_h0wbg6xbNwrEjXD6uaE12ZDZYF_h55LN99Es520nMBI.jpg	public	mooshugrill	\N
5267fa9611d2688bdc4587a2	/2136029_bvqot1MnMJ9IGYsYJkamqTiE_lL96OcfilWMxskhdU8.jpg	public	mooshugrill	\N
5213a7c011d27a56f99dfba3	/11074699_K2ka1_NxiELyTqgjvY3oMN70IUxIlADqRIAb5QpzsLM.jpg	public	mooshugrill	\N
525b3a3711d2040fdcbd6fee	/52031712_DN0C9vfm3iv1geUuFX92Pt0jwgl8NhbGokLj_o0Ebjg.jpg	public	mooshugrill	\N
501c284be4b07d0ab63e08be	/vQv8P8_hFNwHMmpR7k6-arr8zqYmmgoSG_aAPJuz-ws.jpg	public	itizyicecream	\N
51e83b4a498e0a1c64e62828	/26624_AGoljLki5SS-GJGKaAGB75mloHKRBkJ1Qj5BQCRP1_Y.jpg	public	itizyicecream	\N
526e8aee11d299d16e74b447	/67629862_ZPeS1alTFabw1hPqq8PCcGF1SRFynqA23OgkKg8yc00.jpg	public	lovemamak	\N
521b83c411d29ec0512f89b3	/255980_1U9yRWzBKuIDLReBhmBs45qJ0mtHu7pzL_Fv4T9gTss.jpg	public	lovemamak	\N
5180207390e7374e46b6c165	/49563206_uKsSD-Cd2jjy6FMyR9U_--7DdUBJ7ZUxtdlushxyIAg.jpg	public	freshandhearty	\N
51378e9ce4b071feb46ef7cc	/18792384_RSm8zhe_6kUOxy91taByfRjTDSLp7stH7PI41aJHOrU.jpg	public	bobjotruck	\N
5249b50c11d2d415e3c6b017	/769710_HOnpTjl0b6qd4-yoPpg9lXZGBy-ZKikqzLlFWw2sQfs.jpg	public	bobjotruck	\N
4fe20639e4b05dcdf7f5737c	/l9UdGGevddtOhDk6scQjcy1-TbVBX-wf8Gf56jBIRIg.jpg	public	bobjotruck	\N
507dacb0e4b0d8cafc9601e0	/2361939_S3NwwSNVZD-2tAhc3bwAvsYgk9tXwYv0T0yq9ci-ihE.jpg	public	toumnyc	\N
516452a5e4b0e1b216fdbaa4	/26263584_5wpEOb9FygNRBFQySA-pE1t1q_E9jVM_4mx2mnw5fAU.jpg	public	toumnyc	\N
516d98b8e4b0b059e50ff5ad	/117715_BoNkQJO4jPWEtg_ef4-URb7IseoIXnYiP5vkvWJtezg.jpg	public	toumnyc	\N
50e71f82e4b07154c72fdc22	/275165_az4RUZ2U7-4cfdnQA1FlMrDLaxwCMriWtlhS_pddjEc.jpg	public	mexicoblvd	\N
5140cc96e4b0ef29f4802508	/4886503_z36ZXtYKGVIHcNLCR18ZdUWtpStRrbf33rInxsr2p1Q.jpg	public	mexicoblvd	\N
525de1d7498ef4b27ada0847	/31827631_CApIgPWaXupe3toLi7iJLb6NxIyn2IDTOjAG0qw-PIk.jpg	public	mexicoblvd	\N
51d31ab97dd28a271207af20	/59958053_5CogfmHgRpBtjkPzVkAgAjK7q9ac0bo8Z1TPwxPIFAw.jpg	public	grillonwheelsny	\N
5245c79c498e057f7d5ff65d	/117715_CEghvDHaxkALy5RxQCAVW-kyM0TAZo2-fIT4e6veJeo.jpg	public	neaexpress	\N
5008051fe4b0974c844d5003	/oNy0_bsWPyVmjrduzJXpbrAPHjQS0PVbyOCfoRSD9xE.jpg	public	shortysnyc	\N
51a4ee69abd87ea53396c979	/4083549_jMzaCPEId80kWmAaq2oQ9APKf4bLvdeHhy40qPeB9j8.jpg	public	shortysnyc	\N
50045b1be4b0004dbf67c977	/MDweBG1fBnF_fZ1tOghWyHS9qUxGNiJeOrOpoA-fBrY.jpg	public	shortysnyc	\N
4feb2bb8e4b0a47cf49787d7	/-CEaOy-zjgmGzmPRViSeNchwIITBbHgI3lFosreLqIE.jpg	public	shortysnyc	t
51dc5a9e498ebf7ad40223ec	/1328035_Ak3fMs2e36r7NvIE_gIDK5XZ9CwrW1DEJa3g1oobp5E.jpg	public	wingnitnyc	\N
50e719c2e4b0e263423e547e	/15471_4uN0tddGW5orNGh02xhxbiAOGUpAAy3rIWEotoRgB_M.jpg	public	tacobite	\N
50f99bcee4b08ca132377f78	/4611139_CEH3eveI6uxlRVQLet5Fpa_sNfJwAzfheMTYSBplO5Q.jpg	public	thecrepestruck	\N
4fd0f054e4b0757383b97c0f	/MbR1inb3VKXu0PQMsCkHkHGftYq0E8CDbYG3BLRRGaE.jpg	public	thecrepestruck	\N
5249b1c511d23e54343ae083	/769710_HUiZ7dJrNbdnPYV-DTQRr1z0zgoxFx9KMC_Y-OQ6O2o.jpg	public	bobjotruck	t
51eae36e498e58d50e5683ba	/331066_SArUzXa_cz_-YMQco1rwYAfU8a99TZCHJX9a2WA3fHg.jpg	public	gcnyc1	\N
5106bdece4b051d6cb82a376	/1922740_Eqg3x5oj7wks2XGfudNYIAzcCuZHJiWpgLP1CCbonEE.jpg	public	gcnyc1	t
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: pepp
--

COPY locations (id, display, matcher, region, lat, long, hood) FROM stdin;
1	20th & 5th	20th & 5th	mid	40.739680	-73.990847	Flatiron
2	26th between 11th & 12th	26th between 11th & 12th	mid	40.751356	-74.006822	Chelsea
3	36st & Broad	36st & broad	mid	40.751526	-73.987775	Garment District
4	32rd & Park	32rd & park	mid	40.745774	-73.982260	Murray Hill
6	37th & Broadway	37th & broadway	up	40.752200	-73.987543	Garment District
8	39th & Broadway	39th & broadway	up	40.753642	-73.987122	Midtown West
12	45th & 6th	45th & 6th	up	40.757425	-73.982273	Midtown West
15	46th & Park	(46th & park|park & 46th)	up	40.754706	-73.975810	Midtown East
18	48th & 6th	48th & 6th	up	40.758650	-73.981341	Midtown West
19	48th between 6th & 7th	48th between 6(th)? & 7(th)?	up	40.759249	-73.982680	Midtown West
20	49th & 3rd	49th & 3rd	up	40.755254	-73.971262	Midtown East
31	56th between 2nd & 3rd	56th between 2nd & 3rd	up	40.756639	-73.968762	Midtown East
32	70th & York	70th & york	up	40.765542	-73.954715	Upper East Side
33	71st & York	71st & york	up	40.766112	-73.954221	Upper East Side
34	116th & Amsterdam	116th & amsterdam	up	40.806734	-73.961037	Morningside Heights
35	116th & Broadway	116th & broadway	up	40.808079	-73.963993	Morningside Heights
36	Columbia	columbia	up	40.807371	-73.964404	Morningside Heights
37	Union Sq	union sq	none	40.735486	-73.991557	Union Sq
40	Wall & Pearl	wall & pearl	none	40.705533	-74.007926	Financial District
43	Hanover & Old Slip	hanover & old slip	none	40.704018	-74.008981	Financial District
44	Old Slip & Water	old slip & water	none	40.704038	-74.008965	Financial District
45	Fulton & Water	(fulton|water) & (water|fulton)	none	40.707424	-74.004114	Financial District
46	Starrett-Lehigh	starrettlehigh	none	40.751575	-74.006684	Chelsea
47	Fulton & Front	(fulton|front) & (front|fulton)	none	40.706914	-74.003792	Financial District
49	John & Front	(john|front) & (front|john)	none	40.706382	 -74.004601	Financial District
50	30th & 7th	(7th & 30th|30th & 7th)	none	40.748471	-73.992487	Chelsea
51	Water & Old Slip	water & old slip	none	40.704081	-74.009010	Financial District
52	10 Hanover sq	10 hanover sq	none	40.704557	-74.009220	Financial District
53	7 Hanover sq	7 hanover sq	none	40.704557	-74.009220	Financial District
54	Dumbolot	dumbolot	bkl	40.703105	-73.986664	Brooklyn
55	Brooklyn Navy Yard	brooklyn navy yard	bkl	40.699282	-73.972583	Brooklyn
56	Jay & Front	(front|jay) & (jay|front)	bkl	40.702351	-73.986671	Brooklyn
57	Jay & Water	(water|jay) & (jay|water)	bkl	40.703075	-73.986617	Brooklyn
26	53rd & Park	53rd & park	up	40.759067	-73.972610	Midtown West
59	77 Water	77water	none	40.704390	-74.008419	Financial District
60	27th & Madison	27th & madison	mid	40.743320	-73.986189	NoMad
62	47th between Park & Madison	47th between (madison|park) & (park|madison)	up	40.755655	-73.976176	Midtown East
16	47th & Park	(park|47(th|st)?) & (47(th|st)?|park)	up	40.755332	-73.975305	Midtown East
9	40th & Park	(40th|park) & (park|40th)	up	40.750853	-73.978594	Murray Hill
10	40th & Broadway	(40th|broadway) & (broadway|40th)	up	40.754333	-73.986901	Midtown West
29	56th & Broadway	(broadway|56th) & (56th|broadway)	up	40.765430	-73.982088	Midtown West
30	58th & Broadway	(broadway|58th) & (58th|broadway)	up	40.767201	-73.981820	Midtown West
63	55th & 6th	55th (&|@) 6th	up	40.763047	-73.978148	Midtown East
64	Hudson between Houston & King	hudson between houston & king	none	40.728318	-74.007161	Hudson Square
65	Fulton between Water & South	fulton between water & south	none	40.706782	-74.003660	Financial District
21	49th between 6th & 7th	49th between (6th & 7th|6 ?& ?7)	up	40.759904	-73.982359	Midtown West
66	Varick between Charlton & King	varick between (king|charlton) & (charlton|king)	none	0.727513	-74.005521	Hudson Square
68	Old Slip between Water & Front	old slip between water (&|n) front	none	40.703985	-74.008571	Financial District
27	53rd between Park & Lexington	53rd between park & lexington	up	40.758746	-73.971748	Midtown West
61	52nd between 6th & 7th	52nd between 6(th)? ?(&|n)? 7(th)?	up	40.761774	-73.980945	Midtown West
7	38th & Broadway	38(th)? ?& ?broadway	up	40.752895	-73.987340	Midtown West
48	Fulton between Front & South	fulton between (south|front) & (front|south)	none	40.706510	-74.003370	Financial District
58	Fulton & South	((south|fulton) & (south|fulton)|seaport @ fulton)	none	40.706248	-74.003078	Financial District
41	Wall & William	(william|wall) & (william|wall)	none	40.706363	-74.009531	Financial District
22	50th between 6th & 7th	50(th)? between (6th & 7th|6 ?& ?7)	up	40.760400	-73.981444	Midtown West
23	51st between Park & Madison	51st (between )?park ?& ?madison	up	40.758212	-73.974371	Midtown East
39	King & Hudson	(king|hudson) & (hudson|king)	none	40.728086	-74.007317	Soho
28	55th & Broadway	(broadway|55(th)?) (&|n) (broadway|55(th)?)	up	40.764966	-73.982223	Midtown West
11	41st between 6th & Broadway	41st between 6th (n|&) broadway	up	40.754659	-73.985726	Midtown West
25	52nd & 6th	52(nd)? ?(N|&) ?6(th)?	up	40.761166	-73.979443	Midtown West
24	51st & Park	51st ?& ?park	up	40.757830	-73.973477	Midtown East
13	46th & 6th	(w)?46(th)? ?& ?6(th)?	up	40.757418	-73.982288	Midtown West
38	King & Varick	(varick|king) ?& ?(king|varick)	none	40.727889	-74.005495	Soho
5	33rd & Park	(33(rd)?|park) & (park|33(rd)?)	mid	40.746468	-73.981828	Murray Hill
42	Hanover & Water	(hanover|water)( sq)? ?& ?(water|hanover)( sq)?	none	40.704089	-74.00900	Financial District
67	Pearl & Broad	(broad(way)?|pearl) ?& ?(pearl|broad(way)?)	none	40.703444	-74.011630	Financial District
70	25th & Park	25th & park	mid	40.741458	-73.985422	Flatiron
71	27th & Park	27th & park	mid	40.742706	-73.984531	NoMad
69	23rd & Park	23rd & park	mid	40.740172	-73.986363	Flatiron
73	55 Water	55 water	none	40.703653	-74.008528	Financial District
74	22nd between 5th & 6th	22nd between 5th & 6th	mid	40.741546	-73.991616	Flatiron
75	Front & Adams	front(s)? & adams	bkl	40.702470	-73.988548	Brooklyn
76	MetroTech	metrotech	bkl	40.694219	-73.985725	Brooklyn
77	53rd & Madison	53rd & (mad|madison)	up	40.759708	-73.974214	Midtown East
78	65th & Broadway	(broadway|65th) & (65th|broadway)	up	40.772945	-73.982057	Upper West Side
79	Hanover sq between Water & Pearl	hanover( sq)? between water & pearl	none	40.704313	-74.009178	Financial District
80	Vandam & Varick	(varick|vandam) & (vandam|varick)	none	40.726394	-74.005652	Soho
81	27th between 11th & 12th	27th between 11th & 12th	mid	40.751856	-74.006316	Chelsea
82	Charlton & Varick	(varick|charlton) & (charlton|varick)	none	40.727037	-74.005634	Soho
83	112th & Broadway	112(th)? & broadway	up	40.805448	-73.965760	Morningside Heights
84	Old slip & Front	(old slip|front) ?(&|@) ?(old slip|front)	none	40.703776	-74.008364	Financial District
86	17th & 5th	17th & 5th	mid	40.737901	-73.992212	Union Sq
87	53rd between Park & Madison	53rd between park ?& ?madison	up	40.759409	-73.973447	Midtown West
85	46th between 6th & 7th	46(th|st)? between( )?(6&7|6th & 7th)	up	40.758025	-73.983710	Midtown West
88	49th & 6th	49th & 6th	up	40.759215	-73.980893	Midtown West
89	Hudson between King & Charlton	hudson between king & charlton	none	40.727704	-74.007285	Hudson Square
90	Wall & Water	(water|wall) & (water|wall)	none	40.705131	-74.007406	Financial District
17	47th between Park & Lexington	47 ?(th|st)? between (lexington|park) ?(n|&) ?(park|lex|lexington)	up	40.754942	-73.974389	Midtown East
92	55th between 6th & 7th	55th between 6th & 7th	up	40.763653	-73.979593	Midtown West
93	99th & Madison	99th & madison	up	40.789202	-73.952694	Upper East Side
94	Water & Broad	water & broad	none	40.702961	-74.011477	Financial District
72	52nd & Park	52(st|nd)? ?& park	up	40.758444	-73.973026	Midtown East
91	Water between Wall & Gouvernour	water between wall( st)? & gouvernour	none	40.704894	-74.007785	Financial District
95	Gouvernour & Water	(gouvernour|water) & (gouvernour|water)	none	40.704619	-74.008153	Financial District
96	21st & 5th	(5th|21st) & (5th|21st)	mid	40.740258	-73.990499	Flatiron
97	Houston & Broadway	(houston|broadway) & (houston|broadway)	none	40.725457	-73.996819	SoHo
14	46th Between 5th & 6th	46(th|st)? (between )?(5th ?& ?6(th)?|5 ?& ?6|& 5~6)	up	40.756625	-73.980321	Midtown West
98	58th & Madison	58th & madison	up	40.762954	-73.971847	Midtown West
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pepp
--

SELECT pg_catalog.setval('locations_id_seq', 98, true);


--
-- Data for Name: sitestats; Type: TABLE DATA; Schema: public; Owner: pepp
--

COPY sitestats ("time", uptown, midtown, downtown, brooklyn) FROM stdin;
1395335316	22	5	8	3
1395421201	26	3	9	4
1395680402	15	2	13	4
1395766801	14	5	10	3
1395853201	23	4	8	4
1395939602	21	5	8	2
1396026001	24	3	13	3
1396371601	20	6	10	3
1396458001	25	3	10	4
1396544402	26	5	8	2
1396630801	20	3	12	3
1396890001	13	3	13	4
1396976401	21	6	10	3
1397062802	20	4	12	4
1397149202	25	3	9	5
1397235601	22	3	11	3
\.


--
-- Data for Name: subs; Type: TABLE DATA; Schema: public; Owner: pepp
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
7	(btween|b & (w|t)|b\\/w|bet(?!w)|btwn|btw)	between
21	!	
\.


--
-- Name: subs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pepp
--

SELECT pg_catalog.setval('subs_id_seq', 21, true);


--
-- Data for Name: trucks; Type: TABLE DATA; Schema: public; Owner: pepp
--

COPY trucks (id, name, twitname, weburl, tweet, retweeted, lasttweet, lastupdate, type, about, foursquare, matcher, loc, matchmethod) FROM stdin;
deliheaven	Deli Heaven	deliheaventruck		@downtownlunch correction we are on king&varick today. The word of the day is amore for ur free upgrade. SoHo get ur deliheaven on	f	1392220340	1392220340	Deli	\N			\N	\N
chipsy	Chipsy King	chipsykingny	http://chipsykingny.com/	Kasar truck is at union square\nBroadway and 16th street\nAll day until 8pm	f	1407255461	1407255461	Fries		51bb5c43498ee06e13d0d31f	\N	\N	\N
trucktotable	BistroShopp	trucktotable	http://bistrotruck.com/	55St & Broadway until 4pm. Let's goooo	f	1420227139	1407427421	Moroccan	\N		\N	\N	\N
mikenwillie	Mike n Willie's	mikenwillies	http://www.mikenwillies.com	Happy Taco Tuesday!! South st seaport Front St. & Fulton St 12-8 ComeGetSome	f	1403394007	1402414859	TexMex		4f205f0ee4b0294b35a1178b	\N	\N	\N
brooklynpopcorn	Brooklyn Popcorn	brooklynpopcorn	http://brooklynpopcorn.com/	@Sebastian_Otto We are on 70th and York today! Hope to see you soon. Thank you for your support :)	f	1416833924	1415296416	Popcorn!		514a0737e4b09c3e77279d83	\N	32	\N
seoul	Seoul Food	seoulfoodnyc	http://www.seoulfoodnyc.com	Come to 51st street, between Park and Madison - it's lunch time!!	f	1392220033	1392220033	Asian		4e74afad88775d593d9a7eb5	\N	\N	\N
miamifood	Miami Food Machine	miamimachinenyc	http://www.miamifoodmachinenyc.com/	RT @YouGotSmoked: Park Ave btw 33rd St and 32nd St from 11:00 to 3:00 today! New York Aged Cheddar Mac and Cheese! Delicious nyc http://t...	t	1421905524	1389964561	Mexican		514b53aee4b00c3e98ec25e9	\N	\N	\N
craffels	Craffles	crafflesnyc	http://www.craffles.com/	Happy holidays!!!\nMake ur holidays sweet with our delicious crepe or waffles. Our location for today. Hunter college and union square.	f	1421616846	1388428190	Crepes		514e426ce4b05bcb261d910e	\N	\N	\N
pocketful	The Pocketful	thepocketful	http://thepocketful.com/	Located on 50th, between 6th and 7th	f	1423149063	1423580152	Mediterranean		4db8bcd790a0e3f61d601888	\N	22	\N
bigds	Big D's	bigdsgrub	http://bigdsgrub.com/	50th Street btwn 6th and 7th Ave. Preorders call 646-543-BIGD http://t.co/8dTgWfaToY	f	1423150686	1423585572	Korean Fusion		4c968b907605199c2eaec2a3	\N	22	\N
vspot	Hit your V Spot	hityourvspot	https://www.facebook.com/VSPOT.TRUCK	47th and Park from 11:15am to 2:30pm !!	f	1412066274	1412066274	Vietnamese	\N	53c9479b498e2dfa7e205ff0	\N	\N	\N
gorilla2	Gorilla Cheese 2	gcnyc1	http://t.co/4ZDqfwSH5f	Truck only on 46 5/6\n47th  had to go do a short notice catering gig ..\nComeToTheCheeseYo	f	1423495442	1423243268	American		4dc2d3e352b1c1fb37f1e945	g2	14	before
shuka	Shuka Truck	shukanyc	https://www.facebook.com/ShukaTruckNYC	The Shuka Team is out for a 2 Day event in Brooklyn! See you Wednesday on 21st St & 5th av !  feeling thankful	\N	1423573634	1423494068	Israeli	\N	546a5011498e0e047a243f37	\N	96	\N
shadydawg	Shady Dawg	shadydawgnyc	http://www.shadydawg.com/	\N	\N	\N	\N	American	\N	536e77ea498e8b0d31167218	\N	\N	\N
biandang	Bian Dang	biandangnyc	http://www.biandangnyc.com/	Back at it on 53rd & Park today dumplings buns and paigu nom http://t.co/dj9scO9Gge	f	1422970500	1423580561	Taiwanese		4d712874722ef04d04160d9c	\N	26	\N
steaksncrepes	Steaks N Crepes	steaksncrepes	http://steaksncrepes.com	50 st bet 6 & 7 ave for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	f	1397096188	1374766188	American		50f44167e4b0af5bf46321ce	\N	\N	\N
yume	Yume Teriyaki	yumefoodtruck	http://yumeteriyakigrill.com/	Yume is on Hanover and Water today for lunch. Start the weekend the right way :).	f	1400251565	1400251565	Japanese	\N	530cdc14498ee06c95ab14e0	\N	\N	\N
phils3	Phil's Steaks	philssteaks	http://www.philssteaks.com	Happy Halloween! It's our last day out until April so come grab your last Phil's of the year! 41st between 6th n BWay 11-2. Boo!	f	1421686372	1414761089	American		4f15b382e4b0725660ea9f31	\N	11	\N
dels	Del's	delsnyc	http://instagram.com/delsnyc	We apologize for being MIA the past 2 days. We've been preparing for the hottest day of the week! Come find us at 21st & 5th Ave until 4pm	f	1410028765	1409149941	Sweets		519bb56b498ed2dfa950ace2	\N	\N	\N
mexicue	Mexicue	mexicue	http://mexicueny.com	Eating these sliders under an umbrella is like movie make-out scenes under waterfalls. \n\nCome get em at MadSqEats http://t.co/VxW4aWmiwh	f	1423513543	1410639912	Mexican		4c51a6a71c67ef3ba6b61ab9	\N	\N	\N
blend	Blend	blend_express	http://blen02.wix.com/blendnyc	Happy Halloween.   47th and park we here.	f	1421948094	1414774175	Latin Fusion		4fa94528e4b0f8fbf13317e6	\N	16	\N
nuchas	Nuchas	nuchasnyc	http://www.nuchas.com	Find us on the corner of Broad St and Pearl today for some muchasnuchas	f	1423434243	1422976140	Mexican		4ebd2a9bb8f7b504a754c130	\N	67	\N
palenque	Palenque	palenquefood	http://www.palenquehomemadecolombianfood.com	Even if it's raining Palenque it's ready to serve you the most tasty arepas in town! @UrbanSpaceNYC @Broadway between 40th st and 39th st!	f	1423496506	1412178982	Colombian Fusion		4e84f424dab45bbd2617dc62	\N	\N	\N
goburger	GO Burger	goburger	http://www.goburger.com	We're on 91st and Amsterdam for dinner tonight. See you soon!	f	1402176073	1398896034	American		4c06b3eccf8c76b0a4eb3a65	\N	\N	\N
getstuffed	Momos & Buns	getstuffednow	http://www.chinesemirch.com	RT @GovIslandFood: 1/3. Only a few more days till Gov Island gourmet food market powered by @livefastgroup opens for the summer. @Getstuffe...	t	1408198481	1400698983	Chinese Fusion		4fa016cbe4b05d0fc11262c5	\N	\N	\N
itizy	Itizy Ice Cream	itizyicecream	http://www.itizy.com/	Likely our last three hours at Columbia this year! Come grab a scoop of your favorite flavor before it runs out!	f	1382307419	1382122482	Sweets		4fcbdcaae4b00a0e855124dd	\N	\N	\N
mamak	Mamak	lovemamak	http://www.lovemamak.com/	hey guys we are @smorgasburg pier 2 @BrooklynBridge_  come come come! http://t.co/llBP6I0uKb	f	1420072776	1410708157	Asian		51c4cffa498ec876f564a0b4	\N	\N	\N
freshhearty	Fresh and Hearty	freshandhearty	http://freshandheartynyc.com/	Get your Soup & Panini on with Fresh and Hearty! We parked on 46st btw 5th & 6th ave from 11am to 3pm. Call now 4 free delivery! @3474402467	f	1395241942	1390493878	Soup/Salad/Sandwich		51801f7a90e7374e46b6239f	\N	\N	\N
taipanexpress	Taipan Fusion Express	taipanexpress		Good morning we are serving lunch at 46 st between 5&6ave from 11:30 to 3pm @FoodtoEat @midtownlunch @nystfood	f	1412268299	1408622100	Thai/Chinese/Indian	\N	532b1b92498ea6c0d1026802	\N	\N	\N
shortys	Shortys	shortysnyc	http://www.shortysnyc.com	Up and running at SouthStreetSeaport South and Fulton Streets Cheesesteak ChickenCheesesteak RoastPork... http://t.co/awyzKOzJqw	f	1423444267	1415982867	American		4faea2cce4b08a88c5dc5d05	\N	58	\N
hh2	Habachi Heaven 2	hibachiheaven	http://www.hibachiheaven.com/	Good morning NYC we are on 46  & 6 from 11:00 to 2:30	f	1423585492	1423229862	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	1	13	two
cinnamonsnail	The Cinnamon Snail	veganlunchtruck	http://www.cinnamonsnail.com/	Parked on water/gouvernour lane  8:30-3:00\n\nHot coconut curry soup with chickpeas\nBourbon bbq seitan burger w/ jalapeno Mac n cheese	f	1423523151	1423576661	Vegan		4c263af6a852c9287537e66c	1	95	two
wingit	Wing'n It	wingnitnyc	http://www.wingnitnyc.com/	Out here on 23rd and 5th come and grab some wings for lunch today. We will be open from 10am to 3pm. See you guys at lunch.	f	1390923947	1387549355	American		519ffd2b498ededbeef3c073	\N	\N	\N
tacobite	Taco Bite	tacobite	http://www.tacobite.com/	Today we are on\n47th St\nBet\nPark Av / Lexington Av	f	1415029173	1406907223	Mexican		503ba49ae4b0fad35eb7a8dc	\N	\N	\N
souvlaki	Souvlaki GR	souvlakitruck	http://www.souvlakigr.com/	The SGRT is on Varick/Charlton \nWith a little taste of Mykonos\n@WeWork @HudsonSquareNYC	\N	1423260326	1423582659	Greek	\N	4c75c2908d70b713d5dcdaad	\N	82	\N
crepestruck	Crepes Truck	thecrepestruck	https://www.facebook.com/thecrepestruck	Come ceck out the Brazzers promo truck in Time Square 48 & 7 ave today till 4pm. http://t.co/wUDdRIZpAh	f	1419176770	1406998102	Crepes		4dfb854918386e743d9869e3	\N	\N	\N
elpaso	El Paso Truck	elpasotruck	http://elpasony.com/	Today we are at @Columbia between W 115th & W 116st. Stop by and get your tacos, burritos, quesadillas yummy  tacotruck FoodTruckfriday	f	1422811742	1412955921	Mexican	\N	523c911f04937624937304c5	\N	36	\N
kimchitaco	Kimchi Taco	kimchitruck	http://kimchitacotruck.com/	Truck is back and in action! dumbolot today 11:30-2:30 on water st @ jay st Dumbo nyfoodtrucks	f	1422717133	1416930499	Korean Fusion		4d6ee122b45b59417c6a6778	\N	54	\N
bobjo	BobJo	bobjotruck	http://www.bobjo.net	Good morning nyc!! We r ready to Serve at 47th st btween park and Lexington ave. plz stop by and enjoy thank you !!!	f	1423241119	1423499002	\N		4e3add0c88772c3bf12772da	\N	17	\N
taim	Taim Mobile	taimmobile	http://www.taimmobile.com/	Your lunch is waiting on 20th/5th. Harissa explains it all.	f	1423580449	1423586088	Mediterranean		4cf2c5321d18a143951b5cec	\N	1	\N
toum	Toum NYC	toumnyc	https://www.facebook.com/ToumNYC	It's cold out there, but don't let that stop you from a delicious LebaneseLunch! Pre-order at 917-TOUM-350 & pick up from Jay & Water St!	f	1423172946	1423149998	Lebanese		500eedb0e4b062ee00577957	\N	57	\N
yankeedd	Yankee Doodle Dandy's	usafoodtruck		RT @FoodtoEat: Fulton St & South St is where @USAFoodTruck, the golden gem for American Noms! Preorder online for pickup: http://t.co/fB9O...	f	1423454626	1422034451	American	\N	52b497e1498eed13ead2b84c	\N	58	\N
mooshu	Moo Shu	mooshugrill	http://www.mooshugrill.com	Brought our yummy fare down to SoHo today! Catch us on Hudson & King til 2:30!	f	1418139086	1418396706	Chinese	Moo Shu grill is a slight twist on typical Chinese <a href="https://en.wikipedia.org/wiki/Moo_shu" target="_blank">moo shu</a> The three Moo Shus option is enough for lunch and you can pick and choose a different protein for each. In my opinion the chicken is the best but it is dark meat. </p><p>It's easy to order as there is one window for ordering and for picking up when your name is called.	52090e45498e5500a6bd41fb	\N	39	\N
snowday	Snowday	snowdaytruck	http://snowdayfoodtruck.com/	RT @dumbolot: The lot is smelling mighty fine with @DomoTaco @NeaExpress and @SnowdayTruck today!	f	1423418451	1423070737	Comfort	\N	533ddd4a498e774b8250a69b	\N	54	\N
grillwheels	Grill On Wheels	grillonwheelsny	#	Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00crazy chicken baby chicken lamb burger couscous	f	1417538109	1409929542	Kosher		51b0bf31498e9b68db75612c	\N	\N	\N
mexicoblvd	Mexico Blvd.	mexicoblvd	http://mexicoblvd.com	RT @dumbolot: We got @SweetChiliNYC and @MexicoBlvd in the lot today!	f	1423582355	1423497565	Mexican		4f4e55aee4b04c96fba5b149	\N	54	\N
schnitzi	Schnitzi	schnitzi1	http://www.schnitzi.com/	So the last day of Schnitzi Truck week,@46 bet 5&6 serving lunch 11:30-3:30 get some cornflakes covered Schnitzi & soup @www.schnitzi.com	\N	1423581869	1423147130	German	\N	532b25ed498eb8b1844dc14f	\N	14	\N
andysitalianice	Andy's Italian Ice	andysitalianice	http://andysitalianicesnyc.com/	Morning NYC - come find us today on 32nd and Park Ave from 11am- 5pm or down in UnionSquare afterwards until 8pm!	f	1421005046	1411741686	Dessert	\N	4df26c2bae609e69dd95d2fc	\N	\N	\N
lobstertruck	Red Hook Lobster	lobstertruckny	http://redhooklobster.com/	When was the last time you saw your ole pal BigRed? She's on 46th & 6th with Lobster Mac & Cheese, why don't you go say hello for lunch?	f	1423513818	1423242364	\N		4dc597c57d8b14fb462ed076	\N	13	\N
chefsamir	Comme Ci, Comme Ca	chefsamirtruck	http://www.chefsamirtruck.com	We are on 55st at the corner of Broadway! !	f	1421680716	1423240724	Moroccan		4c3c85e3a9509c74b52e395b	\N	28	\N
neapolitan	Neapolitan Express	neaexpress	http://neapolitanexpress.com/	We have a truck at 52nd and 6th for lunch!	f	1423511996	1423583753	Pizza		51c8864c498e0ac96c14433e	\N	25	\N
disos	DiSO's	disosnyc	http://www.disosnyc.com/	Lunch on 48th bet 6 and 7 ave.\n\nCall in orders to: 917-756-4145	f	1423496913	1423579601	Italian Sandwiches	These might be typical italian sandwiches but the ingredients are high quality. You need to get there early because the line can get long and they will run out of some breads. I believe the focaccia half is a normal portion for lunch while their half and hero sizes are pretty big.	519523d6498eeaa6200aad03	\N	19	\N
toastmonster	Toast Monster	toastmonsternyc	http://www.toastmonsternyc.com/	Toast Monster @UrbanSpaceNYC @GarmentDstrctNY till October 17. On Broadway between 40th and 39th st.	f	1423493329	1411270224	American		50ad1829e4b087613d696bc4	\N	\N	\N
mtblls	Mtblls	mtblls		Happy  Day!  The MTBLL  has stopped on 50th bet 6&7 aves. Come warm up with our newest item meatball soup. It is delicious!	f	1421779236	1421858036	Italian	\N	504fb7fde4b0bc88c3a6b614	\N	22	\N
mactruck	MacTruck	mactruckny	http://MacTruckNYC.com	Good morning 47st!! Between park and lex till 2	f	1422282128	1421937779	American	Looking to take a nap after lunch? This truck is great and the owner is incredibly friendly. Feel free to chat it up while you watch him prepare your food.  Not listed on the menu are the many condiments\\n you can get on your macaroni. The regular size is a good portion for a normal lunch.	50575ab8e4b04ed4f2197dac	\N	17	\N
wafelMomma	Wafels & Dinges Momma	waffletruck	http://www.wafelsanddinges.com/	TRUCKS\nKastaar @ Park Ave & 40th till 4:30pm\n\nMomma @ Varick & King till 4:30pl	f	1423583776	1423223781	Belgian		4a416369f964a52036a51fe3	momma	38	before
domo	Domo Taco	domotaco	http://www.domotaco.com	Almost ready on Hudson & King! Come n get it SoHo!	f	1420817023	1423580063	Asian Fusion		4ed90a2e77c8274efb746d83	\N	39	\N
papayakingtruck	Papaya King	papayakingtruck	https://www.facebook.com/papayaking	Truck is at 55th and Broadway today. See you soon!	f	1423326726	1423582853	American		50952bd2e4b03898afd23fe3		28	
carls	Carl's Steaks	carlssteaks	http://carlssteaks.com/home/	RT @DUMBOFoodTrucks: We hear @SweetChiliNYC @DeliNDogzTruck & @carlssteaks are at the @DUMBOLot for lunch today!	f	1423528192	1423583159	American		51a78330498e3fc1f22d771e	\N	54	\N
schnitzel	Schnitzel & Things	schnitznthings	http://schnitzelandthings.com	The truck is on Varick & Charlton 11:30-2:30. Pre order 347-772-7341. Grab some Lunch!!!	f	1422645854	1421079906	German		4a6640b3f964a5204cc81fe3	(schnitztruck|the truck)	82	contains
carpedonut	Carpe Donut	carpedonutnyc	http://carpedonutnyc.com/	Good morning. Truck open at 55th street and  Broadway. Come !!!!	f	1423483090	1422618648	Sweets	They only server one kind of donut here, the apple cider, but it's a pretty good one. They are fresh and still hot when you get them. They have donut ice cream sandwiches but you should know the entire thing is in the freezer so you will get a frozen donut as well.	5169892c498e0522481eea97	\N	28	\N
pontirossi	Ponti Rossi	pontirossifood	http://www.pontirossifood.com/	Hello Midtown! Today we serving lunch on 47th st btw park and lex. Call in for orders 347-506-9616 	f	1423447993	1412862491	Italian	\N	542d78f4498ee5493e1a8989	\N	17	\N
eddiespizza	Eddie's Pizza	eddiespizzany	http://www.eddiespizzany.com/	Tuesday's: 47th between park and lex eddiespizza 270 calorie personal pizza healthylunch http://t.co/rBQimX72tP	f	1423155747	1422980638	Pizza		4c0cf412b4c6d13ae4850c30	\N	17	\N
mrnice	Mr Nice Guy	mrniceguytruck	http://mrniceguynyc.com	71st and york... it's friday	f	1414424434	1414687317	American		520bbbb211d26afae232ec59	\N	33	\N
mamuthai	Mamu Thai Noodle	mamuthainoodle	https://www.facebook.com/MamuThaiNoodle	Oh Dumbo, it's freezing outside but we are here to give you crazy Hot noodles It warms the soul! @dumbolot @DUMBOFoodTrucks	f	1422894140	1423242698	Thai		5126a10ae4b0af674c85f353	\N	54	\N
lukeslobster	Luke's Lobster	nautimobile	http://lukeslobster.com/	How would you feel about a food truck serving only kids cereals, that Saturday morning cartoons playing on loop, let us know at 17th and 5th	f	1423422310	1423157176	Seafood		4dc81239b0fb5556cd2f3023	\N	86	\N
hh3	Habachi Heaven 3	hibachiheaven	http://www.hibachiheaven.com/	midtown. Come get warm with some hot HIBACHIHEAVENNYC, find us at 33rd/Park and 47th/Park for some yumyum	f	1423585492	1414075107	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	2	5	two
funbuns	Fun Buns	funbunsnyc	http://j24f.com/funbuns/	Last day to get your favorite buns this year at 50th st between 6 / 7 ave midtown Happy Halloween everyone	f	1419358370	1414768000	Asian		4f8d9663e4b021137aa2bdde	\N	22	\N
latinkitchennyc	Latin Kitchen	latinkitchennyc	http://www.latinkitchennyc.com/	HAPPY HALLOWEEN ! ! TODAY OUR LAST FRI OF 2014 ..THANK YOU WALLSTREET! !\nLOCATION 55 WATER ST (SIDE OF OLD SLIP) NYC http://t.co/RWCtK9bCEc	f	1420547746	1414768415	Mexican	\N	53878518498ef00115dbdea1	\N	73	\N
treats	The Treats Truck	thetreatstruck	http://www.treatstruck.com	!!! Wed,Feb 4th 12-3:30pm 45th st & 6th ave!! Then 4:30-7pm 18th st & 7th ave!!!	f	1423495845	1423063848	Sweets		49e65021f964a52035641fe3	\N	12	\N
paris	Paris Sandwich	parissandwich	http://www.parissandwiches.com/	Last day in dumbo today on fronts and Adams @ 11:30 @DUMBOFoodTrucks	f	1423325293	1414764931	French/Vietnamese		519e4ed0498e4f27e64c177a	\N	75	\N
shanghai	Shanghai Sogo	shanghaisogo	http://www.shanghaisogo.com/	Happy Halloween. TGIFriday !! We r serving at water and Hanover sq!! ( 10 Hanover square ) come & get some. 11~3pm. http://t.co/VBdd8zsVAK	f	1417298324	1414769059	Asian		5258369d498e13def2bef2cb	\N	42	\N
morris	Morris Grilled Cheese	morristruck	http://morrisgrilledcheese.com/	Hi folks, for the near future the truck will only be out Weds @RoyalPalmsClub &Thurs in Midtown or @DowntownBklyn Metrotech. See ya there!	f	1423325781	1423489450	American		4e0e0b3caeb7a5b33ee5dac1	\N	76	\N
dubpies	DUB Pies	dubpies	http://www.dubpies.com/	PieTruck not at the @DumboLot today, sorry.  Freezing rain scared us off. Big ups to @MexicoBlvd & @SweetChiliNYC. Hardcore.	f	1423498660	1423498574	New Zealand meat pies	\N	4eb825a62c5b53141b78bfb6	\N	54	\N
cinnamonsnail2	The Cinnamon Snail 2	veganlunchtruck	http://www.cinnamonsnail.com/	This week:\n\nMon: 48th/6th\nTUES: water/Gouvernour Ln, AND Dinner on 4th Street near Washington Square\nWEDNESDAY:... http://t.co/ssXs1PztRI	\N	1423523151	1423425704	Vegan	\N	4c263af6a852c9287537e66c	2	95	two
langos	Langos	langostruck	http://www.langostruck.com/	Hi happy Friday \nWe're at the corner of Park Ave & 33rd. Street from 11-2:30pm \nDon't get cold pre-order at 347 837 8572\nlangos NYC	f	1423234940	1423234940	Hungarian	\N	537a883c498eb7fac064409f	\N	5	\N
wafelKastaar	Wafels & Dinges Kastaar	waffletruck	http://www.wafelsanddinges.com/	TRUCKS\nKastaar @ Park Ave & 40th till 4:30pm\n\nMomma @ Varick & King till 4:30pl	f	1423583776	1423223781	Belgian		4a416369f964a52036a51fe3	kastaar	9	before
valduccis	Valduccis	valduccis	http://valduccis.com	Panini Tuesday @starrettlehigh @gofooda@greenboxny @FoodToEat we're on the second floor http://t.co/T2wu8zeCit	f	1423582891	1421168325	Pizza		4df7e1aad4c02ad734170b21	\N	46	\N
eggstrav	eggstravaganza	etravaganza	http://www.eggstravaganzany.com/	Taco Tuesday senores.!! Delicious skirt steak,Cajun chicken or chorizo...you know the place.52nd and Park.	\N	1423498827	1423584221	Mexican	\N	4b15165ef964a52049a823e3	\N	72	\N
gorilla1	Gorilla Cheese 1	gcnyc1	http://www.gorillacheesenyc.com/	Truck only on 46 5/6\n47th  had to go do a short notice catering gig ..\nComeToTheCheeseYo	f	1423495442	1423243268	American		4dc2d3e352b1c1fb37f1e945	g1	14	before
sweetery	Sweetery	sweeterynyc	http://sweeterynyc.com	Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/aR2bxOPJe5	f	1423150421	1420202105	Sweets		4a28d919f964a52056951fe3	\N	39	\N
polish	Old Traditional Polish Cuisine	polishcuisine	https://www.facebook.com/pages/Old-Traditional-Polish-Cuisine/315496671902708	Find us on Hanover Sq. b/w Water & Pearl today from 11-2 FinancialDistrict Last week to help TeamJas campaign	f	1423582997	1423583276	Polish		51435df4e4b0823a398ebc8a	\N	79	\N
frites	Frites 'N Meats	fritesnmeats	http://www.fritesnmeats.com/	Lunch 2day @ 10 Hanover sq b/t water & pearl st. Burger of the week THE ELCUBANO preorder 9172929226 fidi	f	1423490452	1423580603	American	This is a good burger but this truck is interesting because of the many toppings they carry and their burger of the week. 	4ae9d217f964a520bcb621e3	\N	52	\N
greenradish	The Green Radish	thegreenradish1	http://www.thegreenradish.com/	@Brody_Adrien we're big fans, have an amazing veganlunch today 52&6 11-2	f	1422815086	1418920902	Vegan		5229feab11d2edde794d385c	\N	25	\N
schnitzelcart	Schnitzel & Things Cart	schnitznthings	http://schnitzelandthings.com	Grab some Schnitzel for lunch,  the cart is on 55th & Broadway 11:30-2:30.  Preorder 212-470-7053. Hope to see you guys	f	1421942149	1419866341	German	\N	4a6640b3f964a5204cc81fe3	(schnitzcart|the cart)	28	contains
mausam	Mausam	mausamnyc	http://www.mausamnyc.com	Happy Friday @Dumbolot enjoy the sunny day Curry King spicy entree &bites great for the weather	f	1423316166	1423229266	Indian		50730eebe4b0f3224431dc5d	\N	54	\N
milktruck	Milk Truck	milktrucknyc	http://www.milktrucknyc.com	Stop by our truck for a delicious grilledcheese, today @ Water St/Broad St. 646-504-6455 or @foodtoeat.com to preorder!	f	1423501518	1423578616	American		4e823c0229c2dbb2b7043972	\N	94	\N
steelcart	The Steel Cart	thesteelcart	http://www.thesteelcart.com/	Makin a grand finale on Front & Jay! Stick it to the weatherman with a toasted sandwich & grits. Soup today is Rustic Chicken Noodle.	f	1421723664	1419950738	French		511d3abee4b0e188895f3697	\N	56	\N
sweetchili	Sweet Chili	sweetchilinyc	http://sweetchilinyc.com/	Warm up with hot vietnamese coffee @dumbolot jay & water 1130-3! \npre order sweetchilinyc@gmail.com & skip the line! staywarm livetoeat	f	1423241234	1423584121	Asian		51a8c802498e2165ca855a19	\N	54	\N
korilla	Korilla BBQ	korillabbq	http://korillabbq.com	Now serving at 47th & Park!	f	1423183281	1423586518	Korean Fusion		4cc701aa01fb236ab070baba	\N	16	\N
\.


--
-- Data for Name: truckstats; Type: TABLE DATA; Schema: public; Owner: pepp
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
-- Data for Name: tweets; Type: TABLE DATA; Schema: public; Owner: pepp
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
RT @tacobite: @UndrcvrMother thank u, u too.	1388892460	419671512661377024	f	freshandhearty
HappyNewYear2014 to everyone! We are back with a boom of different flavors for you! Come out and try out our new menu. FreshandHearty	1388677888	418771533297758208	f	freshandhearty
Back on the road. we are serving lunch on old slip between water st and front street from 11:30 to 2:30 Preorder before 12pm at 3474402467	1388676035	418763761240268800	f	freshandhearty
GOOD morning Monday... We are park on Broadway between 55 st and 56 st. Preorder before 12pm at 3474402467.	1388416224	417674033657020416	f	freshandhearty
@Feitelogram prob till about 2	1423246849	563764265346428928	f	disosnyc
It's Friday kids! Lunchtime on 48th bet 6 and 7 ave.\n\nCall in orders to: 917-756-4145	1423235806	563717945738940418	f	disosnyc
Disos lunch on 47th bet park and lex today..\n\nCall in orders to: 917-756-4145	1423147790	563348779093327872	f	disosnyc
Water and old slip today.. FIDI\n\nCall in orders to: 917-756-4145	1423063553	562995464652738560	f	disosnyc
48th bet 6 and 7 ave.\n\nCall in orders to: 917-756-4145	1422977523	562634629585588224	f	disosnyc
Off today due to weather	1422889663	562266117369253888	f	disosnyc
48th bet 6 and 7 ave today..\n\nCall in orders to: 917-756-4145	1422631660	561183973314158592	f	disosnyc
47th bet park and lex..\n\nCall in orders to: 917-756-4145	1422545677	560823334515245056	f	disosnyc
Lunch today on water st and old slip. fidi \n\nCall in your orders to pick up: 917-756-4145	1422456901	560450983768367104	f	disosnyc
Public Service Announcement: \n\nDisos will be doing their lunch thing Tom as scheduled. Water st and old slip fidi	1422409804	560253442716073984	f	disosnyc
Public service announcement: Disos will be doing their lunch thing Tom as scheduled. Water st and old slip fidi	1422409760	560253258766516226	f	disosnyc
Friday lunch! 48th bet 6 and 7 ave.\n\nCall in orders to: 917-756-4145	1422025686	558642333751992323	f	disosnyc
Lunch on 47th bet park and lex today. \n\nCall in orders to 917-756-4145	1421938768	558277775921266688	f	disosnyc
Lunch today water and old slip. FIDI\n\nCall in orders to: 917-756-4145	1421854261	557923325041971200	f	disosnyc
Parked on 48th bet 6 and 7 ave today.. \n\nCall in number: 917-756-4145	1421766249	557554178286182400	f	disosnyc
Fridays happening on 48th bet 6 and 7 ave.\n\nCall in orders to: 917-756-4145	1421421407	556107805556760576	f	disosnyc
We do to like using the word never, we might have a Monday spot opening for varick..	1421365700	555874154277109761	f	disosnyc
RT @diamonds2323: @DiSOSNYC ahh forget then come back to old slip	1421337989	555757926594674688	f	disosnyc
Lunch happening today 47th bet park and lex..\n\nCall in orders to: 917-756-4145	1421333097	555737405027024896	f	disosnyc
Open for lunch.. Water and old slip FIDI!\n\nCall in orders to: 917-756-4145	1421251208	555393940397232128	f	disosnyc
Come Out of the Dark\n\nA friend shared his frustration after recently dining at a new, hip, supposedly healthy... http://t.co/kVGrWXk9dA	1422815086	561953319758086144	f	thegreenradish1
Vegan Power at  Mundo Vegan Montclair with Evolve for Animals http://t.co/Obuyj9Exf4	1422094767	558932080584052736	f	thegreenradish1
Vegan Power @MundoveganMtc with @EFAnimals http://t.co/LIlTvkPUbw	1422072901	558840367572078592	f	thegreenradish1
We Let The Dogs Out....\n\nTruck may be on its winter snooze, but were not......Bestselling Black Bean Burger... http://t.co/2ARl02ZFUA	1421518951	556516936461615104	f	thegreenradish1
@Jimrhao February, weather permitting.	1421349880	555807799335456768	f	thegreenradish1
@earthtoneone February, weather permitting.	1421349847	555807662018150403	f	thegreenradish1
The Green Radish - The Year in Photos http://t.co/n605JnKpdl	1420126504	550676590305497089	f	thegreenradish1
Go Green, Get Black(Bean Burger)... http://t.co/E2cQWgqkAp	1420081492	550487796411281408	f	thegreenradish1
G-Rad is looking forward to serving you in 2015!!!\nHappy New Year to All !!! http://t.co/N0dbU8FRbD	1419989422	550101625160101891	f	thegreenradish1
GoVegan @TheGreenRadish1 @CoryBooker @SteveCase @OneGreenPlanet @FunderClub @NewYorkObserver @News12NJ @DrOstfeld http://t.co/ERjPufc51V	1419988848	550099216421642241	f	thegreenradish1
Dumbolot will keep U warm Curry King savory curries vindaloo	1422539757	560798507112476673	f	mausamnyc
RT @VeganLunchTruck: @thegreenradish1 peace and blessings to you guys. 	1419268115	547076244484157440	f	thegreenradish1
Thx @VeganLunchTruck same to you and your crew...	1419268063	547076026715885568	f	thegreenradish1
Hey All, Happy Holidays!...Thanks for a great 2014, \nThe Green Radish looks forward to serving you again in 2015!	1419258315	547035139721924610	f	thegreenradish1
Big Veg BBQ Burger, Today, Old Slip&Water, 11-2 @DowntownNYC @WSJ @NewYorkObserver @EaterWire @Tweat_It @biz @EmblemHealth @SteveCase @JLo	1419007890	545984781864140801	f	thegreenradish1
Got Quinoa? We do. Old slip&water st 11-2 @DowntownNYC @goop @EatStTweet @AHealthBlog @grubstreet @NewYorkObserver @WSJ @EaterWire @biz	1418994733	545929598262075392	f	thegreenradish1
Try our Big Veg Burger, 2 patties, cabbage, pickles, special sauce, toasted sesame seed bun.....today, Friday,... http://t.co/fb20Dqf2Qt	1418994313	545927835173801985	f	thegreenradish1
RT @nycfoodtruck: RT @capygesediro: Thank you to James and the @thegreenradish1 for the best vegan bean burger I have ever had! Now for the...	1418927327	545646876834676736	f	thegreenradish1
@Brody_Adrien we're big fans, have an amazing veganlunch today 52&6 11-2	1418920902	545619926040715264	f	thegreenradish1
Pad Thai with Spicy Grilled Tempeh, come n get it.... GoRad http://t.co/9qgT79fMtU	1418920187	545616930372333568	f	thegreenradish1
Step gracefully into the new year veganlunch 52&6 11-2 @DharmaYogaNYC @RollingStone @usweekly @UBS @DrOz @BuzzFeed http://t.co/7gMS3U7Pgo	1418918732	545610824061288449	f	thegreenradish1
LET'S GOOOO!!\n53rd Street and Park Avenue. Preorders call 646-543-2443 http://t.co/5m2opKeNc0	1423244303	563753585792405504	f	bigdsgrub
FREE hot n' sour kimchi soup w/ any purchase of $10 or more! 53rd Street and Park Avenue. Preorders 646-543-BIGD http://t.co/9BKJFqs8Hk	1423233370	563707728179507202	f	bigdsgrub
RT @ZhaPanAsian: This is how we brunch! AsianCini Sampler + PomeloWatercressSalad @EatThisNY @Gothamist @bigdsgrub @StreetGrubSteve http:/...	1423150686	563360927048028160	f	bigdsgrub
It's THAT time of the week folks!\n50th Street btwn 6th and 7th Avenue\nFULL Truck & Cart menu\nPreorders 646-543-BIGD http://t.co/VHPtzz0J3C	1423144900	563336659153190912	f	bigdsgrub
RT @VendorPower: Please re-tweet! The @vendyawards is looking to hire a market manager: http://t.co/dP39eSWb3E	1423080296	563065690866085890	f	bigdsgrub
RT @suemarino: Heading out for fish tacos and maybe dumplings @bigdsgrub (56th & Madison today) NYCfoodtrucks foodie http://t.co/wfkK6Qup...	1423068686	563016994338123776	f	bigdsgrub
The Grub Truck is grillin' it up at 56th Street and Madison Avenue today!  Full truck menu and... http://t.co/vo40f1micI	1423060659	562983326768988161	f	bigdsgrub
Join us today at @starrettlehigh for lunch! 601 West 26th Street.  2nd floor StarrettLehigh @gofooda	1423058038	562972333561085953	f	bigdsgrub
Get those preorders in! 646-543-BIGD.  We have the full truck menu and these Khao Cart menu items. Who's Loco enough? http://t.co/Az9C18RAtP	1422977771	562635667533225985	f	bigdsgrub
@iamevie: @bigdsgrub What's on the Khao Cart menu today? http://t.co/kaGSq9jdH4	1422977631	562635083908407296	f	bigdsgrub
@gv2216: @bigdsgrub Time? YEAH BUDDY! 11:15am to 2:30pm	1422977609	562634991688228864	f	bigdsgrub
50th Street btwn 6th and 7th Avenue. Preorders call 646-543-BIGD. Khao Carr menu also available!!	1422972143	562612064506896384	f	bigdsgrub
Due to day's weather, we will be closed.\nBe safe and dry grubbers!\nTomorrow = Midtown West. http://t.co/O5XOKX90OQ	1422885904	562250349348917248	f	bigdsgrub
What's your prediction for today's SuperBowl?  SuperBowlSunday SuperBowlXLIX	1422816915	561960990171230208	f	bigdsgrub
RT @FoodtoEat: Cart menu items again on the cart from @bigdsgrub? Too awesome to pass up. Gogogo! Preorder online for pickup: http://t.co/i...	1422635368	561199525839503360	f	bigdsgrub
53rd Street and Park Avenue\nPreorders call 646-543-BIGD\nCheck out today's specials! http://t.co/VBoZoxtSql	1422633335	561191000606273536	f	bigdsgrub
You know the drill!\n53rd Street and Park Avenue\nGrub Truck AND Khao Cart menu\nPreorders call 646-543-BIGD\nTGIF MidtownEast @midtownlunch	1422626736	561163320208949248	f	bigdsgrub
@iamevie: @bigdsgrub See you later!! Vietnamese roasted chicken for Evie! 	1422550261	560842561414520832	f	bigdsgrub
We're ready to rock! The Grub truck is on 50th Street btwn 6th and 7th Ave w/ all ur favorites & some Khao Cart items http://t.co/C53D1KqFA9	1422543297	560813355162951680	f	bigdsgrub
Its THAT time of the week folks! Weve got your lunch at 50th Street btwn 6th and 7th Avenue. 11a-2:30p. Preorder for pickup 646-543-BIGD	1422540138	560800104429670401	f	bigdsgrub
@RetroFoodTruck @nuchas @gcba si seguis por NY visitanos.	1423102340	563158147553320961	f	nuchasnyc
A little snow never stopped anyone from enjoying Muchas Nuchas! Thanks for the photo, Good Choice Shoes! http://t.co/Sjhz4lCkuN	1422985497	562668072876900359	f	nuchasnyc
Find us on the corner of Broad St and Pearl today for some muchasnuchas	1422976140	562628827642597376	f	nuchasnyc
Thank you @LanghamPlaceNY for the mention! We're happy to be neighbors in Greeley Square!	1422908713	562346021154746369	f	nuchasnyc
@C2R5W we're glad to hear! Thank you	1422824201	561991550553440256	f	nuchasnyc
RT @C2R5W: @NuchasNYC your empanadas are amazing.  Can't wait to order for my next event.  Glad I stopped by the truck!	1422824190	561991503757598720	f	nuchasnyc
Prediction time! Whos your Super Bowl pick? http://t.co/eAdK4ycy9R	1422815736	561956046550228993	f	nuchasnyc
Retweet if you could go for a hot chocolate right now from our GreeleySquare kiosk!	1422737129	561626345063870464	f	nuchasnyc
Come warm up on this fine Saturday with Nuchas!\n\nInstagram via hersoncastillo http://t.co/9oMNwXqBxV	1422723602	561569609401110528	f	nuchasnyc
TGIF! Who's ready for a weekend with muchasnuchas?	1422650720	561263919151738880	f	nuchasnyc
Our delicious empandas are baked, not fried, so you don't have to worry about breaking your resolution to eat... http://t.co/8Rt0gH6On6	1422637203	561207225101074432	f	nuchasnyc
Nuchas Catering: It's Nuchas where you need it, when you want it! Email your catering needs to catering@nuchas.com	1422569119	560921656697573376	f	nuchasnyc
ICYMI: Nuchas Kiosk, Times Square - @vegetableway  http://t.co/RyVKYEz8FY	1422562621	560894405910212608	f	nuchasnyc
Throwback to Alex Denis and the CBS team stopping by our Times Square kiosk! http://t.co/JNvh6waOFy	1422550805	560844842654130176	f	nuchasnyc
Empanadas in the oven, right before your very eyes! Stop by Nuchas today for a freshly baked empanada of your choice!	1422486020	560573116456665089	f	nuchasnyc
@GoodChoiceShoes glad to hear! We can bring the Nuchas to you via catering! Contact our catering team at catering@nuchas.com or 212-913-9682	1422473175	560519239090442241	f	nuchasnyc
RT @GoodChoiceShoes: Gracias @NuchasNYC  We brought back some empanadas to HQ & they were delicioso  http://t.co/bmIuNqaegM	1422473078	560518834335928320	f	nuchasnyc
Did you know Nuchas catering is perfect for corporate lunches or business meetings! Enjoy a free mixed Nuchas box... http://t.co/fTspdhj9ta	1422466877	560492823925899264	f	nuchasnyc
Tag your Instagram photos with muchasnuchas for a regram! http://t.co/1enivhvdYM	1422390007	560170410034356225	f	nuchasnyc
RT @FoodtoEat: Get some @NuchasNYC for your GameDay, all sorts of empanadas - from savory (meat & vegetarian) to even sweet!  Contact us ...	1422388211	560162874296123394	f	nuchasnyc
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
We will be in dumbo today everyone. On fronts and Adams at 12pm  @DUMBOFoodTrucks	1412171029	517308908877389824	f	parissandwich
We will be back in dumbo today on fronts and Adams 12pm  everyone. Hope we can start your week off nicely :) @DUMBOFoodTrucks @jenchung	1411994176	516567132579315712	f	parissandwich
We will be at the Brooklyn book festival till 6pm today @BKBF	1411313991	513714228260515840	f	parissandwich
We're in dumbo today again!! Fronts and Adams open 12:30pm @DUMBOFoodTrucks @jenchung	1411053525	512621757543776256	f	parissandwich
Beautiful day New York! Join us on Front and Adams for lunch. @DUMBOFoodTrucks @jenchung dumbofoodtrucks loveparissandwich	1410966872	512258306036215809	f	parissandwich
In dumbo today again. Enjoy your weekend everyone! @DUMBOFoodTrucks	1410538600	510462006567383040	f	parissandwich
@downtownlunch correction we are on king&varick today. The word of the day is amore for ur free upgrade. SoHo get ur deliheaven on	1392220340	433629653711212545	f	deliheaventruck
@downtownlunch DH is on varick&charlton today. The word of the day is amore for ur free upgrade. SoHo get ur deliheaven today	1392217592	433618126148993024	f	deliheaventruck
@midtownlunch Today is the Day!! Grand Opening on Broadway & 55st. Rotisserie chicken, pastrami @ corn beef sandwiches New York Style	1392131026	433255045355036672	f	deliheaventruck
@midtownlunch HH3 is on 46 st & 6 Ave. HH2 is on Park Ave & 33st. Word of the day is Peyton for your free upgrade. midtown get ur YumYum	1391178361	429259276079861760	f	deliheaventruck
@rachelbrill Fastest way to lose weight, burn fat and stop fat production http://t.co/zhkQ2MX5wk	1390923947	428192185209454592	f	wingnitnyc
@PolishCuisine Fastest way to lose weight, burn fat and stop fat production http://t.co/3PzF9KWyTQ	1390923944	428192175373828096	f	wingnitnyc
@bertones666 Fastest way to lose weight, burn fat and stop fat production http://t.co/whTuJBvo4v	1390923942	428192165047447553	f	wingnitnyc
@CDIdiamond Fastest way to lose weight, burn fat and stop fat production http://t.co/HVyv1Us20E	1390923939	428192154708504576	f	wingnitnyc
Merry Christmas everyone!!! We wish everybody a safe and Happy Holidays!!!	1388012013	415978652623331328	f	wingnitnyc
RT @FoodtoEat: Last day 12DaysofFoodTrucks ! Thx to all who participated & to the FoodTrucks serving us delicious food!  http://t.co/Ks3L...	1387841125	415261894967304192	f	wingnitnyc
RT @FoodtoEat: 12DaysofFoodTrucks Day 12 FoodTruck is @wingnitnyc ! Guess where this is from? Win 10-25% off ur next order http://t.co/tH...	1387841124	415261888889778176	f	wingnitnyc
RT @FoodtoEat: Today's answer to 12DaysofFoodTrucks is @funbunsnyc ! Thx to all those who played and tune in Monday 12/23 for the LAST day!	1387841120	415261873207263232	f	wingnitnyc
Hello everyone! Looks like we are going to call it a year! It has been a fun journey so far fill with ups and... http://t.co/RwqalnwTOm	1387817580	415163138699321346	f	wingnitnyc
Out here on 23rd and 5th come and grab some wings for lunch today. We will be open from 10am to 3pm. See you guys at lunch.	1387549355	414038124268752896	f	wingnitnyc
Hey guys were back out today wing'n it on 56th and Broadway. Come grab some wings for lunch today. For pre-orders... http://t.co/PodH8EaA0G	1387458557	413657287773786112	f	wingnitnyc
Today we're on 54th and Broadway. Come get some wings for lunch today. Give us a call and pre-order don't want in the cold 917 740 1765.	1386859597	411145066464309248	f	wingnitnyc
Hey wings fans! We are out today and ready to serve you great tasting wings. Come see us at lunch time. Today we... http://t.co/mHKTBVJvKM	1386773635	410784518253977600	f	wingnitnyc
We have been going through some issues at our commissary and due to these issues we are unfortunately not able to... http://t.co/8hzi0hlGy4	1386160771	408213977030615041	f	wingnitnyc
Sorry everyone, we aren't out today. See you guys tomorrow.	1386081285	407880590243803137	f	wingnitnyc
Happy Thanksgiving Everyone! http://t.co/u7HYUz1MyA	1385666299	406140011419955200	f	wingnitnyc
Happy Thanksgiving Everyone! http://t.co/yTrps7tc4O	1385666235	406139743098142720	f	wingnitnyc
RT @MobileCuisine: Food Cart Vendors Face Fines and Arrests for Selling Snacks - http://t.co/Oh2k939USu	1385525761	405550553155252224	f	wingnitnyc
RT @EstaFiestaPR: @Carnegro U just discovered @WingNItNYC? I LOVE that place!!	1385489857	405399959727779840	f	wingnitnyc
RT @Carnegro: So I found a wings food truck though. I wish I was hungry. Apricot Maple Whiskey wings sound amazing. @WingNItNYC	1385489851	405399938588483585	f	wingnitnyc
Scooping ices at the Children's Club trunk show for @zaraterez !! @ Pier 94 NYC http://t.co/SQcxAtzd70	1421005046	554361460659597312	f	andysitalianice
@lomorilocek durning our season. Normally 14th street outside American Eagle or out in front of Staples. See you soon.	1418176805	542498959227236352	f	andysitalianice
happy Friday spice up your weekend @Dumbolot	1422019831	558617776089100288	f	mausamnyc
Happy Thanksgiving at the Macy's day Thanksgiving paradeending out coffees and hot chocolates @wwpinc http://t.co/DE7dpKZo6Q	1417095002	537961549085024257	f	andysitalianice
@subususafex sorry for the delay. We usually park in front of Staples or along that street unfortunately we are only doing events.	1413382742	522391202797469697	f	andysitalianice
@cusakujakizo sorry for the delay we usually park in front of Staples, unfortunately we are off the road until April.	1413382673	522390909594640384	f	andysitalianice
We are OPEN @prospect_park with 15 of NYC's finest food truck 11AM-5PM @nycfoodtruck @NYCParks	1412518391	518765849843630081	f	andysitalianice
Happy NationalCoffeeDay! Although were OFF THE ROAD today-check out these spots for a cheap, or FREE, cup of Joe: http://t.co/4edo5xjuxv	1412004206	516609203117760512	f	andysitalianice
Hey Ice Lovers - Well be OFF THE ROAD for a Private Event. Stay tuned for updates on where well be throughout the week!	1411914961	516234879957467136	f	andysitalianice
6 Graded Races, Family Fun, and Food Trucks - Join us for SuperSat today at Belmont! @TheNYRA  http://t.co/ogT9kXRMpX	1411824788	515856666295042050	f	andysitalianice
RT @TheNYRA: @AndysItalianIce See you Saturday at Belmont for SuperSat!	1411762993	515597481842053120	f	andysitalianice
RT @TheNYRA: What are you eating at Belmont tomorrow? @mactruckny, @MrNiceGuyTruck, @gcnyc1, @PapayaKingTruck, @TheCrepesTruck, @AndysItal...	1411762987	515597453731844096	f	andysitalianice
Morning NYC - come find us today on 32nd and Park Ave from 11am- 5pm or down in UnionSquare afterwards until 8pm!	1411741686	515508112468742145	f	andysitalianice
Ice Lovers - Well be OFF THE ROAD today due to rain. Stay tuned for updates on where well be throughout the rest of the week/weekend!	1411657878	515156595307986945	f	andysitalianice
We'll be @ 40th & 6th Ave until 5p today, stop by for your favorite Andys Ice or Espresso Beverage. Then UnionSquare til 8!	1411570365	514789538892640256	f	andysitalianice
NYC - Find us on 47th & Park today from 11a-3p or in UnionSquare from 4p-8p!	1411480568	514412904800870400	f	andysitalianice
Morning Ice Lovers - Find us on 55th and Broadway today until 4p, then over in UnionSquare for the evening!	1411398536	514068839609667584	f	andysitalianice
Movie buffs, heres your backstage pass into Hollywood. Join us at Kaufman Astoria Studios for a FREE street fair http://t.co/sHvzH1qDct	1411306726	513683758734901248	f	andysitalianice
Ice Lovers! Join us today at the @DowntownHDSID. We'll be there until 6pm, details here: http://t.co/b0YgSB7EOu	1411226763	513348368471711744	f	andysitalianice
RT @DowntownHDSID: All About Downtown Street Fair returns to Jersey City for 4th year http://t.co/55qxiqm1iI	1411226679	513348016280182784	f	andysitalianice
@Ingenieux sorry buddy, we have a really busy weekend and the guys are getting a little burnt out.	1411139362	512981781847760896	f	andysitalianice
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
Truck only on 46 5/6\n47th  had to go do a short notice catering gig ..\nComeToTheCheeseYo	1423243268	563749243165605888	f	gcnyc1
G1 46 5/6\nG2 47/Park \nChicken, Mozzarella,  Bacon Melt w/Chipotle aioli \nComeToTheCheeseYo	1423235988	563718707881725952	f	gcnyc1
G1- Hanover water / pearl \nG2- uptown \nBacon,Cheddar,Chicken Melts w/ Chipotle  Aioli \nComeToTheCheeseYo	1423148815	563353079282925569	f	gcnyc1
38th and Broadway the cheese is waiting for you\nComeToTheCheeseYo	1423066053	563005949716471808	f	gcnyc1
Hudson and King for lunch today\nComeToTheCheeseYo	1422982679	562656256167800832	f	gcnyc1
RT @bebegurljc: Tots w/ cheddar sauce & bacon (@ Gorilla Cheese Truck NYC - @gcnyc1 in New York, NY) https://t.co/ZtSc0Y8zxJ	1422722606	561565430532558848	f	gcnyc1
RT @JayFingers: Lunch, courtesy of @gcnyc1! (@ Gorilla Cheese Truck NYC - @gcnyc1 in New York, NY) https://t.co/cO6cWi1Fom http://t.co/avB1...	1422722600	561565402745294848	f	gcnyc1
@UncommonNasa where Is a good spot ???	1422722589	561565357136424960	f	gcnyc1
@BeautyAddictJ ??	1422722568	561565271597789184	f	gcnyc1
RT @SpicyGyrl: Want. RT @gcnyc1: Chicken, Cheddar, Bacon Melt w/Chipotle  Aioli  ComeToTheCheeseYo http://t.co/r3bwtC0boe	1422722516	561565051380060160	f	gcnyc1
RT @Mrs_Jose_Duffy: @gcnyc1 I'm coming at 1pm	1422722510	561565025501196288	f	gcnyc1
RT @kokefiwepum: Mmmm, Thrilled @gcnyc1 is parked near my office today, grilledcheeseweather	1422722447	561564762333798402	f	gcnyc1
@nickgenes @MountSinaiNYC sorry we had generator  issues .   Getting  fixed on Monday  hopefully. ..	1422722439	561564729684942848	f	gcnyc1
@Teh_Genius union square  west 14/15\nThere now till ????	1422722402	561564574236016641	f	gcnyc1
46 5/6\nComeToTheCheeseYo	1422639199	561215594004226048	f	gcnyc1
@nickgenes @MountSinaiNYC sorry\nFor late response. .. Varick & charlton then west 4th & mercer for dinner	1422557065	560871102319456257	f	gcnyc1
G1 Hudson & king\nG2 26th  11/12\nComeToTheCheeseYo \nChicken,Cheddar,  Bacon melts	1422463576	560478980080693249	f	gcnyc1
RT @MalloryKasdan: Manny's friend's grilled cheese truck yesterday at the reading for @ellathebook @POWERHOUSEArena thanks to @gcnyc1 http:...	1422329255	559915597820350464	f	gcnyc1
Hey now the gorilla is closed today tomorrow and we hope to be out on Thursday thank you	1422284473	559727765361278976	f	gcnyc1
RT @MalloryKasdan: @gcnyc1 thanks for the awesome hookup today @POWERHOUSEArena in dumbo for @ellathebook. ELLAs friends loved their snacks!	1422284434	559727603888959488	f	gcnyc1
Good morning TacoBiters we will be off the road for the winter. see you in March 2015 with more & delicious new items to our menu.	1415029173	529296831147413504	f	tacobite
Today we are on\n47th St\nBet\nPark Av / Lexington Av	1406907223	495230905720786944	f	tacobite
Today we are on \n47th st\nBet\nPark Av / Lexington Av	1406821278	494870427018465280	f	tacobite
Today we are on\n47th st\nBet\nPark Av / Lexington Av	1406734660	494507121841823744	f	tacobite
Today We are on 47th st\nBet Park Av / Lexington Av	1406655525	494175207264112640	f	tacobite
Happy Saturday!!\nToday we are on\nBroadway bet\n66th & 67th street\nIn front of Banana Republic store.	1406391983	493069833735770113	f	tacobite
Today we are on\n47th street\nBet\nPark Av / Lexington Av	1406304524	492703001707311104	f	tacobite
Today we are on\n47th street\nBet\nPark Av / Lexington Av	1406215621	492330116769665024	f	tacobite
Today we are on\n47th street\nBet\nPark Av / Lexington Av	1406129332	491968194350157824	f	tacobite
Today on \n47th Street\nBet\nPark Av / Lexington Av	1405959097	491254178464149505	f	tacobite
Happy Saturday! \nToday we are on\nBroadway\nBet 66th & 67th street\nIn front of Banana Republic	1405787062	490532609991389184	f	tacobite
Today we are on\n47th street\nBet\nPark Av / Lexington Av	1405698329	490160437720539136	f	tacobite
Today we are on \n47th st\nBet\nPark Av/Lexington Av	1405610456	489791872525955073	f	tacobite
Today we are on \n47th st\nBet\nPark Av/Lexington Av	1405523529	489427270374002688	f	tacobite
Happy SATURDAY! !!\nToday we are on \nBroadway\nBet 66th & 67th Street.\nIn front of Banana Republic	1405197008	488057744612917248	f	tacobite
Happy Saturday!!\nToday!!!\nFrom 11am-6:30pm\nwe are on broadway \nbet 66/67 street.\nIn front of banana republic	1405177194	487974639382302720	f	tacobite
Serving Lunch today on\n47th St\nBet. \nPark Av / Lexington Av	1405091916	487616954182955009	f	tacobite
Lunch today on\n47th St\nBet\nPark Av / Lexington Av	1405006565	487258968012906496	f	tacobite
Taco Tuesdays!!!\nWe are on \n47th st\nBet\nPark Av/Lexington Av	1404833169	486531693931950080	f	tacobite
Tribute to\nLarry Levan http://t.co/m6X2wAnNIT	1404783379	486322857564073985	f	tacobite
@leeshufro soon, soon! Spring's almost here.	1422717133	561542475492651010	f	kimchitruck
@derekeng taking the winter months off. See ya when the groundhog sees his shadow.	1422717073	561542222563524610	f	kimchitruck
RT @SycamoreBklyn: Super Bowl just got superer! We'll have the game on 3 screens, including our 60 flat in The Lodge & projector inside. F...	1422669085	561340948131889152	f	kimchitruck
@TheReal_Maz Both!	1422412391	560264291895750656	f	kimchitruck
Juno leave you with time on your hands to think about Superbowl? How convenient. http://t.co/y4243Uv085	1422305148	559814485792546817	f	kimchitruck
@CrimsonElite We're taking the winter month off to recharge and will be back when the birds are chirping again. Miss u guys!	1422036186	558686375084818432	f	kimchitruck
RT @zuthiel_sua: @KimchiTruck you should come to Guadalajara and open a Truck here! I NEED YOUR FOOD IN THIS CITY!	1421807130	557725646135525376	f	kimchitruck
@rachelpaularpa Still off the road, but warms the cockles of our kimchi heart that you're missing us!	1419956716	549964444999376897	f	kimchitruck
RT @TheGurglingCod: @KimchiTruck Learning about your food truck solidarity. Love it.	1418533565	543995320125128704	f	kimchitruck
@WereTeamUSA hi! Sorry, were upgrading our hard working beast of a truck :) U can visit Kimchi Grill in Bk though! http://t.co/ResgJtsWwr	1418400430	543436907636867073	f	kimchitruck
RT @ThreesBrewing: For the beer geeks, here's our opening menu: http://t.co/4vMwqtdsRn	1418319842	543098898550882304	f	kimchitruck
@itsNickCarbs hi Nick!Weve had some repair issues, but well be back soon! Check out our 2 restos in BK 766 Washington ave or 478 Smith St	1418233925	542738535254872066	f	kimchitruck
@itsNickCarbs Take a long lunch break to one of our Brooklyn locations!	1418232430	542732264816521216	f	kimchitruck
@itsNickCarbs Sorry, still getting the ole gal touched up :)	1418232024	542730562621169665	f	kimchitruck
Our amigo @gaddylane serving up scrumptious sammies this Sun @BrooklynMakers @501UNION Their Weekend Lover sammy is SCHWING!	1418138739	542339298511835136	f	kimchitruck
RT @Digichick40: @akacharleswade: Applaud and spend your money when you can with @milktrucknyc @KimchiTruck and @NuchasNYC. 	1418055333	541989468761489408	f	kimchitruck
The truck wont be out for lunch service today, but come warm up w/some chicken soup @ either of our BK restaurants http://t.co/f1o4mxtelx	1418038375	541918341435506688	f	kimchitruck
@drkdstryer come back to Brooklyn and visit us! We have two restaurants 766 Washington Ave or 478 Smith St	1418001958	541765596170711040	f	kimchitruck
RT @chrissyteigen: @KimchiTruck @johnlegend wish we could be there!! thank you for being a part of it!	1417990204	541716298447994880	f	kimchitruck
RT @indeliblebird: Also shoutout @kimchitruck as well. BlackLivesMatter	1417990184	541716214712901632	f	kimchitruck
Hi happy Friday \nWe're at the corner of Park Ave & 33rd. Street from 11-2:30pm \nDon't get cold pre-order at 347 837 8572\nlangos NYC	1423234940	563714313379389441	f	langostruck
Hi Friends \nWhere is the snow-man?\nWe're on 52nd. Street bet 6-7 Ave. closer to 6th.ave\n11:30-2:30pm \nPre-order please call \n347 837 8572	1423148746	563352790031155201	f	langostruck
Good evening Upper East side we parked at 86th. Street and Lexington Ave. till 10pm step by to say Hellloooo Kukuli	1420503336	552257137511243776	f	langostruck
Hi we're back to work.if you looking for a langos,and other goodies like fish and chips,skirt steak sandwich,stuffed cabbage we're 43st/6ave	1420469161	552113796555476993	f	langostruck
Happy New Year we just parked on 52nd.street and 6th.Ave (bet 6-7ave) till 2:30pm. Wish You good health and happiness Enjoy	1420211364	551032517802078209	f	langostruck
Hi finally we are at 52nd.street and 6Ave (bet 6-7ave) 11-2:30pm afternoon moving to Astoria 31st/30th.Ave till 9pm pre order 347 837 8572	1419953219	549949777610547200	f	langostruck
Hi we got to LIC corner of 47rd. and 5street till 9pm thank you	1419888258	549677312263081985	f	langostruck
Hi New Yorkers we are at 32nd. St & Park Ave till 2:30pm after we moving to Long Island City 4:30-9pm see you soon	1419867366	549589683366551552	f	langostruck
hi The Langos Truck is located the corner of Broadway and Broom street. Till 7pm	1419704212	548905369637253120	f	langostruck
Hi Everyone we Langos Truck Team we would like to wish You Marry Christmas,thanks for all of the support.\nHope we see You Soon.	1419540031	548216742645075968	f	langostruck
Hi before Christmas please step by and pick up your favorite food from Langos Truck.we are at Park Ave and 32nd.street bet 11-2:30pm	1419347358	547408615288877056	f	langostruck
Hi we are at 32nd.st & Park 11-2:30pm pre order,skip the line please cal 347 837 8572 skirt steak sandwichfish and chipslangosHungarian	1419261596	547048901602459648	f	langostruck
Hi we are just north of Union square corner of Broadway and 18th.street till 7pm foodtruck magyar hungarian happy halidays Hannukah	1419101757	546378490405478400	f	langostruck
Hi Guys Langos Truck at the corner of 32nd.street and Park Ave till 2:30pm pre order skip the line,stay warm please call 347 837 8572	1419004172	545969189211897856	f	langostruck
Dear Fans we are at 32nd. Street &Park Ave till 2:30pm evening we are moving to Astoria/Queens 31street and 30th. Ave till 9pm thanks	1418919855	545615535929831424	f	langostruck
Hi we arrived to Park Ave and 32nd. Street till 2:30pm afternoon moving to Brooklyn Borough Park 46st and New Utrecht Ave 5-8pm thank You	1418829116	545234949675429888	f	langostruck
Hi Langos T is on 52nd.st bet 6-7th. Ave(closer to 6Ave) from 11-2pm come to enjoy The Freshest Dough on the Planet,Fish & Chips and more.	1418739769	544860201355321345	f	langostruck
We hope you had lovely weekend Langos Truck is the corner of Park Ave & 32nd. Street till 2:30pm please come to see us.	1418658079	544517566677663744	f	langostruck
Finally its Friday Langos Truck on Park Ave & 32nd. Street corner come to enjoy the freshest goodies than enjoy your weekend till 2:30	1418398237	543427711084285953	f	langostruck
delicious root vege soup, grill chicken sandwich,skirt steak sandwich,fish &chips\nAfternoon moving to Astoria/Queens 31 st30th.Ave\n4:30-9pm	1418311897	543065575531220992	f	langostruck
@NomInNY boom! Enjoy	1423261295	563824855217610752	f	mexicue
It's Friday, so you should probably definitely TreatYOSelf to our new Chili Crusted Pork Ribs http://t.co/pBGow6qwDp	1423248807	563772475822338049	f	mexicue
Our version of AvocadoToast with Smoked Chicken & Grilled Cornbread EEEEEATS http://t.co/zCRL3j7YPy	1423155843	563382557325414400	f	mexicue
Stop everything and nacho http://t.co/asDrwKa47L	1423069349	563019775799230464	f	mexicue
Kale! \n(On top of cornbread with white cheddar, lime crema, burnt ends brisket chili & pickled jalapenos) EEEEEATS http://t.co/MSm1Wx7sSN	1422980639	562647697497550848	f	mexicue
.@thomaskelly keeping our Chili game strong  v. necessary for days like this http://t.co/285UxzF9GM	1422896476	562294691786657793	f	mexicue
RT @bombfell: Thanks to @mexicue for a ridiculously delicious catered lunch!!! nom nomnom food foodporn http://t.co/1M9rX8PouJ	1422726907	561583471462580224	f	mexicue
Yes, soup for you\n\nSmoky Tomato w/cornbread croutons, lime crema & cotija http://t.co/gOqFRNjSbg	1422635797	561201327431487488	f	mexicue
Keepin it G with Grilled Jalapeno Guac + Green Chile Mac http://t.co/9GROX7rwRi	1422550656	560844221180301312	f	mexicue
Juno took our TacoTuesday, but it'll never take our freedom (to eat twice as many tacos today) http://t.co/TPY4cDQPNP	1422463344	560478004976312320	f	mexicue
@ChristineJByrne for sure! Let us know what you go with	1422294074	559768034316132355	f	mexicue
@ChristineJByrne Hey hey! There is sugar in the rub for both the chicken and pork. No soy in either though.	1422292533	559761571011112960	f	mexicue
If you're gonna stock up on bread for Blizzard2015, might as well be Grilled Cornbread \n\nPhoto @glassofrose http://t.co/JmEPXYK0qY	1422291275	559756295386177536	f	mexicue
RT @glassofrose: Wishing for more of @Mexicue's buttery chipotle cornbread to accompany my eggs this am. eeeeeats http://t.co/ff4lOQX0i7	1422122682	559049165183803397	f	mexicue
House Margarita in da house\n\nTreatYoSelf to the weekend http://t.co/slcDQM4Okf	1422034629	558679844960350208	f	mexicue
All the essential veggies like cheese and tortilla strips JustGoWithIt http://t.co/4vw4JD4HIb	1421948091	558316876825387008	f	mexicue
Join our truck for samples at Gotham Hall this Sunday at @MarthaWeddings WeddingParty15 from 10am-4pm http://t.co/hImbagqdJx	1421859321	557944551344963584	f	mexicue
Once it hits your lips, it's so good! - Frank the Tank\n\nTreatYoSelf to the good stuff this TacoTuesday http://t.co/vtWWAtZ2cV	1421773591	557584974283825152	f	mexicue
Keepin it crispy with bbq tortilla strips on a Mexican Garden Salad http://t.co/twKFAsWexx	1421685467	557215355236794368	f	mexicue
@milicuna we love you right back	1421449271	556224674838106112	f	mexicue
Join us at the @RoyalPalmsClub in Brooklyn tonight! Nothing yummier then a vegan falafel sandwich to warm you up! http://t.co/UAJadAlUx1	1423172946	563454291013165056	f	toumnyc
RT @FoodtoEat: Dumbo got the goods today! @MexicoBlvd & @ToumNYC both there! Preorder online for pickups: http://t.co/FE1QXf4mop & http://...	1423158483	563393632372547585	f	toumnyc
It's cold out there, but don't let that stop you from a delicious LebaneseLunch! Pre-order at 917-TOUM-350 & pick up from Jay & Water St!	1423149998	563358041412997121	f	toumnyc
Guess who's back in MidtownWest? Join us on 46th btwn 5th & 6th for that shawarma you've been craving! http://t.co/1I1AoQkZck	1423058128	562972709756628993	f	toumnyc
RT @starrettlehigh: Welcome to StarrettLehigh @ToumNYC! The newest addition to our roating FoodTruck schedule; Tuesdays just got better ...	1422977126	562632965306736640	f	toumnyc
Hello @starrettlehigh! Our truck is getting ready to serve! Pre-order at 917-TOUM-350 to avoid the cold! Falafel http://t.co/MI9GTmYkr5	1422974985	562623984253284352	f	toumnyc
RT @FoodtoEat: LebaneseFood found in Dumbo by @ToumNYC until 3pm! Get it for lunch! Preorder online for pickup: http://t.co/2bKvOnoduD	1422552009	560849893586382849	f	toumnyc
RT @dumbolot: It's goin down in the lot today with @ToumNYC @MexicoBlvd and @mausamnyc	1422547778	560832149218426880	f	toumnyc
What's for lunch Brooklyn? Join us in @DumboNYC on Jay & Water St until 3pm then off to the @RoyalPalmsClub until 11pm! LebaneseEats	1422542144	560808518274781184	f	toumnyc
@starrettlehigh We're so excited for Tuesday's with you guys!! LebaneseLunch	1422044984	558723276273614849	f	toumnyc
RT @starrettlehigh: StarrettLehigh is proud to announce @ToumNYC as the new Tuesday FoodTruck offering!! Foodie	1422044955	558723153762213889	f	toumnyc
RT @FoodtoEat: Take your taste buds in for a treat with LebaneseFood from @ToumNYC - Jay & Water! Preorder online for easy pickup: http://...	1421948706	558319458813747200	f	toumnyc
RT @dumbolot: Hola @MexicoBlvd @ToumNYC and @mausamnyc today!	1421942191	558292133069979649	f	toumnyc
We're in Dumbo on Jay & Water until 3pm then off to the @RoyalPalmsClub until 11pm! Join us for yummy shawarma http://t.co/ZYZcVFTroP	1421938358	558276056487329792	f	toumnyc
RT @dumbolot: We got @mausamnyc @MexicoBlvd and @ToumNYC back in the lot today!	1421342252	555775805398466560	f	toumnyc
RT @FoodtoEat: Dumbo (Jay & Water St) is where @ToumNYC lies with all the LebaneseFood treasures. Preorder online for pickup: http://t.co...	1421342246	555775782413680642	f	toumnyc
enjoy delicious curries N bites @Dumbolot	1421934071	558258073442074624	f	mausamnyc
We love Thursday's! We're in Dumbo on Jay & Water until 3pm then off to the @RoyalPalmsClub until 11pm! Beef Kabab http://t.co/KrtRbUZEaQ	1421330650	555727142542405632	f	toumnyc
We're getting ready for @globalFEST_NYC at @WebsterHall tonight! Join us from 6pm-midnight for great music and delicious LebaneseEats	1420999042	554336277748002816	f	toumnyc
RT @globalFEST_NYC: Bring money for post gF2015 food truck grub from @toumnyc and @valduccis	1420910502	553964915187527681	f	toumnyc
@idean66 we'll do our best to get over there again!	1420870447	553796909979410432	f	toumnyc
@zeffercider anyone distributing your cider in the US?	1423266142	563845185411756032	f	dubpies
RT @theBottleShopTW: HappyWaitangiDay from us. Come today, get a NewZealand MeatPie & NewZealand Cider for 350NT http://t.co/kTIR7Btf54	1423260675	563822254354886656	f	dubpies
Pretty sure there's a super storm, that needs reporting, coming soon RT @JohnJCampbell: @dubpies I'll have to come and see you!	1423259094	563815624439500800	f	dubpies
They don't travel well by post, but if you insist! MT @JohnJCampbell: @dubpies Great New Zealand cuisine! I could go 1 o' ya pies, right now	1423254595	563796754706214912	f	dubpies
@JohnJCampbell yup!  pretty bloody stoked we must say....  it's the 3rd best of list we've been mentioned on!  Flat whites and pies FTW?	1423254256	563795332820369408	f	dubpies
RT @UrbanAdventures: Best eats in the NYC streets http://t.co/joBKsVqzeC @waffletruck @dubpies @VeganLunchTruck @snowdaytruck @korillabbq ...	1423253567	563792441703407617	f	dubpies
RT @AlicesArbor: Thanks, @dubpies, for your amazing tweet about us! http://t.co/TjtTYFbwge Twitterverse, we'd love to get your feedback, too	1423253506	563792185771192320	f	dubpies
WaitangiDay! Buy 2 pies get a free Lamington @ PieTruck (Park & 47th) & our Brooklyn cafe (211 PPW)  -while stocks last!	1423241100	563740151646781441	f	dubpies
RT @CrimUnited: @AprilBloomfield @O_Magazine @amazon in NYC @dubpies makes delicious pies, savoury Kiwi-style and other types - yum!	1423240999	563739727648804864	f	dubpies
RT @Foodandtattoos: While at work I stopped @dubpies to get best pie in Brooklyn check it out foodlife Foodporn http://t.co/UkPPZL9pWQ	1423240967	563739591732371458	f	dubpies
WaitangiDay! PieTruck has your hot pies, Lamingtons & flat whites @ Park Ave & 47th, 11am - 2.30pm	1423226474	563678806582784000	f	dubpies
Hey, funky piepeople, the pietruck is @ Bedford Ave & N7. Get in there!	1423185557	563507186761228288	f	dubpies
PieTruck is outside @macquariebank @ 125 West 55th St until 2.30pm... savory pies, sweet pies, sides, flat whites	1423158716	563394608680693761	f	dubpies
RT @dubpies: DUB TruckMail: Where will the Pie Truck be this week? - http://t.co/MrY2d5H5E1	1423158673	563394428640165890	f	dubpies
DUB TruckMail: Where will the Pie Truck be this week? - http://t.co/MrY2d5H5E1	1423060420	562982323738910720	f	dubpies
PieTruck is at Varick St & King St, Soho. Hot pies, sweet pies, flat whites. 11am to 2.30pm	1423059902	562980153811562498	f	dubpies
RT @chipshopman1: @dubpies @UrbanAdventures a mate of mines pie truck. Great pies check them out	1423059720	562979388527218689	f	dubpies
PieTruck makes it to another NYCs best food trucks list! http://t.co/UaI0UhQW1C Thanks @UrbanAdventures	1423004378	562747266277330944	f	dubpies
RT @cuppacoffeeMA: @redbarncoffee @dubpies @TIMTAM @Vegemite check out @Chronicle5 tonight in Boston flatwhite http://t.co/aY7elhof6C	1422989892	562686506616487936	f	dubpies
PieTruck makes it to another NYCs best food trucks list! http://t.co/a6ecfarffm  Thanks @UrbanAdventures	1422934506	562454203336249344	f	dubpies
We are on 55st at the corner of Broadway! !	1423240724	563738575142146048	f	chefsamirtruck
We are on 47st between park av and Lexington av!	1423153985	563374762815422464	f	chefsamirtruck
We are on 52st and park av!	1423067550	563012229839454208	f	chefsamirtruck
We are on 36st and Broadway!	1422984391	562663434744238083	f	chefsamirtruck
Yeah!! We are back and ready to serve new york	1422984321	562663143261081600	f	chefsamirtruck
We are close,see you in the first week of February !	1421680716	557195426664022016	f	chefsamirtruck
We are at 47st between park av and Lexington av!	1420735404	553230499796516865	f	chefsamirtruck
We are at 52st and park av!	1420649825	552871557862002689	f	chefsamirtruck
We are at 36st and Broadway!	1420562749	552506330905600002	f	chefsamirtruck
We are on old slip and water st!	1420476419	552144239048794112	f	chefsamirtruck
We are at 36st and Broadway!	1419958352	549971307023331330	f	chefsamirtruck
We are on old slip and water st!	1419871126	549605457657344000	f	chefsamirtruck
We are  closed today!	1419615029	548531308050538496	f	chefsamirtruck
We are on 36st and Broadway!	1419352564	547430450621603843	f	chefsamirtruck
We are on old slip and water st!	1419266522	547069562727186432	f	chefsamirtruck
We are on 56st and Broadway!	1419007191	545981848883834880	f	chefsamirtruck
We are on 47st between park av and Lexington av!	1418921089	545620712510484481	f	chefsamirtruck
Decouvrez WhatsApp Messenger pour votre Smartphone. Telechargez-le aujourd'hui a partir de https://t.co/8qtvuWS99i	1418844000	545297379029970944	f	chefsamirtruck
We are on 52st and park av!	1418834328	545256808311717888	f	chefsamirtruck
We are on 36st and Broadway!	1418748377	544896306020626432	f	chefsamirtruck
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
Holla Back!! We are On 51st between Park and Madison!	1391523816	430708222140645376	f	seoulfoodnyc
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
coming back soon under a new brand name\nCasey's steaks http://t.co/wfD88ssdpV	1397096188	454080439720751104	f	steaksncrepes
50 st bet 6 & 7 ave for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	1374766188	360421632625483776	f	steaksncrepes
hudson and king st for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	1374678996	360055922934038528	f	steaksncrepes
RT @ice_cold_brusca: @steaksNcrepes has the best philly cheese steak in the city... I love when they come by my job 46st boldstatement n...	1374678938	360055678896832513	f	steaksncrepes
50 st bet 6 & 7 ave for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	1374504972	359326013995499520	f	steaksncrepes
hudson and king st for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	1374071696	357508722785914880	f	steaksncrepes
46 & 6 ave for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	1373986133	357149847138205701	f	steaksncrepes
50 st bet 6 & 7 ave for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	1373900283	356789763187019776	f	steaksncrepes
Hudson & king st for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	1373468853	354980218034855937	f	steaksncrepes
46 & 6 ave for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	1373379393	354604994579791874	f	steaksncrepes
50 st bet 6 & 7 ave for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	1373298135	354264172940365825	f	steaksncrepes
Hudson and king st for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	1372861990	352434846590701569	f	steaksncrepes
46 & 6 ave for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	1372778663	352085349197029378	f	steaksncrepes
50 st bet 6 & 7 ave for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	1372345056	350266668448096257	f	steaksncrepes
50 st bet 6 & 7 ave for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	1372087020	349184390254977024	f	steaksncrepes
50 st bet 6 & 7 ave for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	1371479327	346635540185096195	f	steaksncrepes
50 st bet 6 & 7 ave for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	1371221351	345553511834083328	f	steaksncrepes
@NS0385 we couldn't agree more!	1423282065	563911969351417858	f	waffletruck
50 st bet 6 & 7 ave for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	1371049735	344833699214422017	f	steaksncrepes
46 & 6 ave for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	1370962868	344469353183449088	f	steaksncrepes
50 st bet 6 & 7 ave for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	1370877243	344110215957995522	f	steaksncrepes
thefatjewish's photo http://t.co/PDsQWOeWDD	1416245631	534399029724344321	f	trucktotable
c_brewton's photo http://t.co/MySCnLXreX	1414988994	529128311877025792	f	trucktotable
Otto's Tacos on Yelp: Really good tacos. Price is average, smart packaging and feels traditional. I'll stay fan if ... http://t.co/BwzlIK2H9D	1414171410	525699116266188801	f	trucktotable
Just me and Taylor @ Ridge Street http://t.co/54YOOVrEOP	1410046735	508398973460037632	f	trucktotable
I got mine before the rush http://t.co/4TbJIbbnBE	1409855061	507595034263175168	f	trucktotable
Check out Samsung Galaxy S5 16G Gold (Factory unlocked) Samsung http://t.co/1mhPt01LWd via @eBay	1409444583	505873364171247616	f	trucktotable
Hi @ligayamishan This Yassir from Rustic LES. need to run something by you! Can you forward your email. Yassir@bistrotruck.com	1409153111	504650844084916224	f	trucktotable
Check out my listing on @eBay: http://t.co/txwBt9jjPQ via @eBay	1408365145	501345874119643136	f	trucktotable
55St & Broadway until 4pm. Let's goooo	1407427421	497412775929737217	f	trucktotable
Happy Monday carnivores!!! \nIt's time to get the fix at Bistroshopp. Corner of 55St & Broadway until 4pm. fancy... http://t.co/WeLiNKW714	1407168197	496325511334088705	f	trucktotable
It's time for that Merguez sandwich! Cart is open 55St & broadway until 4pm. Moroccan StreetFood	1406736768	494515966018322433	f	trucktotable
StreetEats Fancy Moroccan StreetFood Lunch 55St & Broadway http://t.co/rOWG8hdSbi	1406649234	494148821547761664	f	trucktotable
StreetEats Fancy Moroccan StreetFood Lunch 55St & Broadway http://t.co/G30C42sRK1	1406649217	494148748138668033	f	trucktotable
  \n            \n         	1406579447	493856111725142016	f	trucktotable
Happy Monday... Cart is at usual corner 55St & Broadway until 4pm. fancy moroccan streetfood	1406561873	493782401760628736	f	trucktotable
First breakfast in 30 days. EidMoubarak http://t.co/IUossTYjET	1406548404	493725909607006208	f	trucktotable
First breakfast in 30 days. EidMoubarak http://t.co/uNhde7Ibmx	1406548402	493725899762589697	f	trucktotable
Shop is open tonight for deliveries & take out until 11p. Bar available for eat in.	1406241074	492436875777671170	f	trucktotable
RT @AnthemSoda: Couscous platter, kale, chicken, lamb sausage from @trucktotable http://t.co/zysvH6ItCB	1406238057	492424219566026752	f	trucktotable
RT @AnthemSoda: AllNatural FoodTruck @trucktotable 'fancy morrocan street food' http://t.co/7aCejMHXiL	1406238055	492424213064863744	f	trucktotable
RT @ArdenisPerez_: Feeling so happy after eating almost an entire bag of @BrooklynPopcorn Too good!	1416833924	536866507058581505	f	brooklynpopcorn
@joseph_damato Yes we are there every Wednesday! See you soon :)	1416833914	536866463685292032	f	brooklynpopcorn
RT @soniamacr: Enjoying my white cheddar @brooklynpopcorn http://t.co/Uf7yiI5N7N	1416185714	534147718818852866	f	brooklynpopcorn
RT @Sebastian_Otto: my flight goes in few hours back to germany and catch my favourite @BrooklynPopcorn yeah http://t.co/z965UNfPmC	1415769591	532402370630922241	f	brooklynpopcorn
@Sebastian_Otto We are on 70th and York today! Hope to see you soon. Thank you for your support :)	1415296416	530417732832202752	f	brooklynpopcorn
@staceymgoodman Hi Stacey check out our Facebook for our daily locations & our website our GPS truck locator. Thank you for your support	1415292317	530400536995299329	f	brooklynpopcorn
RT @Tani_718: Popcorn trucks should be a must outside any job @BrooklynPopcorn	1415292050	530399420035383297	f	brooklynpopcorn
@Tani_718 that you so much for your support!!	1415291949	530398996871667713	f	brooklynpopcorn
RT @Tani_718: @Sebastian_Otto @BrooklynPopcorn they're awesome 	1415291874	530398681099685888	f	brooklynpopcorn
RT @itsme_CH3LS: @BrooklynPopcorn I'm lovin my NY mix 	1415291859	530398615567884291	f	brooklynpopcorn
RT @AllegraShine: @BrooklynPopcorn You totally made my day!!!!	1415291814	530398428048941057	f	brooklynpopcorn
RT @christinebpc: I had to do it. I had to stop and get some @BrooklynPopcorn - GMO free! Delicious! stre... http://t.co/vWX9BSfYzB http:/...	1415291788	530398321329078273	f	brooklynpopcorn
RT @Sebastian_Otto: i love @BrooklynPopcorn	1415291772	530398254966775808	f	brooklynpopcorn
RT @cjpapa13: @BrooklynPopcorn fantastic popcorn. chocolate, kettle, carmel is what I tasted.  delicious!!	1413086384	521148183184158720	f	brooklynpopcorn
@cjpapa13 you made our night thank you for showing the love! From all of us at @BrooklynPopcorn a very special thanks!	1413085910	521146197059579904	f	brooklynpopcorn
RT @cjpapa13: .@BrooklynPopcorn turn around I am right behind you on the desk at SNY! You are making me hungry during the show!! what's you...	1413085442	521144232862818305	f	brooklynpopcorn
RT @stephshiau: Thanks for this pick me up @BrooklynPopcorn! WaHi caramel http://t.co/Orx1WVjaNF	1413085438	521144215628447744	f	brooklynpopcorn
@Creatively_GF Thanks for your support Jenny!!	1412300264	517850958181965824	f	brooklynpopcorn
@wsachs Hi Wendy if you go to our website we have a GPS which tracks our daily location. If you want to place an order feel free to	1411669434	515205064471117826	f	brooklynpopcorn
@wsachs call us and we would be happy to help you :) thank you for your support!! :)	1411669378	515204831108431872	f	brooklynpopcorn
Happy  Day!  The MTBLL  has stopped on 50th bet 6&7 aves. Come warm up with our newest item meatball soup. It is delicious!	1421858036	557939159017730048	f	mtblls
http://t.co/9wOy7mNLUL	1421779236	557608649724403712	f	mtblls
Try our new menu item chicken MTBLL soup	1421769567	557568093820813313	f	mtblls
Good Tuesday MTBLL Lovers. The MTBLL  is out on 50th bet 6&7 aves.  Come by and see what's new. On the menu... http://t.co/hmdhcRlkmZ	1421766571	557555529828945920	f	mtblls
Happy Chilly Tuesday MTBLL Lovers!  The MTBLL  is out and about today. Look for us on 50th bet 6&7 and get your favorite ball	1421163534	555026207398711296	f	mtblls
TGIF  the MTBLL Train to has ventured out today.  Snow shower and all at least we are getting out of the 20's... http://t.co/dZeine6F54	1420816135	553569111733964802	f	mtblls
Happy Monday Mtbll lovers!  Hope you all had a wonderful New Years. The Mtbll train is back on 50th bet 6&7 aves.... http://t.co/JDCTOQUkiY	1420471846	552125060014563328	f	mtblls
Wishing you all a happy healthy and prosperous year ahead http://t.co/kJDR0eZCm9	1420143283	550746963910860800	f	mtblls
We're at @bkflea's winterflea today from 10am-6pm! Come on down, 1000 Dean Street.	1422802801	561901794079424512	f	milktrucknyc
HO HO HO! The Mtbll Train will be on Christmas Vacation this week. We want to wish all our customers a merry and... http://t.co/nrzmZA3pVU	1419265489	547065232078934016	f	mtblls
HO HO HO! TGIF get your weekend fix before the holidays. Come by for your favorite ball.	1419000448	545953569413660673	f	mtblls
Happy Thursday Mtbll Lovers! !! The train has stopped on 50th bet 6&7 Aves. Take a nice walk in this brisk sunny day for your favorite ball!	1418921765	545623547297939456	f	mtblls
Calls for a nice hump day. Come on by 50th bet 6&7 Aves for your favorite ball! http://t.co/K6BAGGv07K	1418827315	545227393225326592	f	mtblls
Good morning Mtbll Lovers. The Mtbll Train has stopped on 50th bet 6&7 Aves. Come on by say hi!	1418742234	544870541367078912	f	mtblls
Happy Monday Mtbll Lovers. Nice and sunny not too cold. Great for a nice stroll to the Mtbll Train which stopped... http://t.co/V6VKdvhM9X	1418654790	544503770932346880	f	mtblls
Tgif Mtbll Lovers. Brave the cold and come get your weekend fix. The train has stopped on 50th bet 6&7 Aves. New... http://t.co/wgrYnipCIX	1418394900	543413713328300032	f	mtblls
Good Thursday Mtbll Lovers. It's chilly yes but take a stroll to 50th bet 6&7 Aves for your favorite ball. I'm sure it will just warm ya up!	1418311514	543063967082364928	f	mtblls
Happy Hump Day!  Looks to be like another rain day for the Mtbll Train. We will see you all tomorrow. Have a... http://t.co/43wcz7UfxJ	1418224163	542697591948181504	f	mtblls
Calm before the storm. The Mtbll Train has stopped on 50th bet 6&7 Ave braving the cold. Come on by for some warm... http://t.co/t7qhTRsJYx	1418053735	541982767068626945	f	mtblls
TGIF Mtbll Lovers!! Come get your weekend fix. You favorite Mtbll awaits . The Mtbll  has stopped on 50th bet 6&7 ave.	1417787962	540868031455719425	f	mtblls
Brrrr chilly start to this Thursday morning hopefully the sun will warm it up a bit today. The Mtbll  is... http://t.co/xasTVOqA9w	1417702516	540509644653748224	f	mtblls
Officially sold out of ice cream! Thank you everyone for a great season!! closed	1382307419	392051847542079488	f	itizyicecream
Greenwich and jay st TriBeCa is where we're at!	1382288993	391974563716030466	f	itizyicecream
Last day of the season!  Stop by for hazelnut ice cram and sorbets!  Sorbet pints on sale.  Limited quantity left, here til we sell out	1382288637	391973070702792704	f	itizyicecream
Final day in LIC!  Blowout sale on sorbet pints ($6.50) and ice cream pops ($1.50).   Stop by 47th rd and center blvd til 6:30 today.	1382201646	391608204112957440	f	itizyicecream
@sarahark hazelnut and mango ice cream today!  Though we're transforming into a sorbet truck...  Running out of ice cream :-)	1382126730	391293983219281920	f	itizyicecream
Likely our last three hours at Columbia this year! Come grab a scoop of your favorite flavor before it runs out!	1382122482	391276167690719232	f	itizyicecream
Pint sale on sorbets today $6.50 a pint!  Stop by 115th and broadway til 6:30pm to grab yours today!	1382115945	391248750729240577	f	itizyicecream
Ice cream trucks getting harder to find?  We're still here and scooping!  Stop by and grab a pint for home @ Greenwich and Duane st til 6:30	1382042133	390939160368144384	f	itizyicecream
@NoExpiration @TaraLipinsky @courtneyesmith @b1ward @yousingiwrite We are on 51 btwn 6/7! Last day at this location! Will be here until 3:30	1382028679	390882729229049856	f	itizyicecream
Last day at Midtown west on 51 btwn 6/7 ave! Come get a sweet scoop until 3:30!	1382028621	390882484206182400	f	itizyicecream
Just a couple of days til the end of our season!  Stop by 115th and broadway for a scoop.  Here til 6:30.	1381946480	390537962184007681	f	itizyicecream
@NoExpiration most likely we will!	1381938863	390506011716747264	f	itizyicecream
I scream u scream we all scream for ice scream!  We're still out and serving, stop by Greenwich and jay til 6:30	1381688887	389457538162651136	f	itizyicecream
It's finally sunny out!  Stop by for a scoop or hand packed pint.  We're at 47th and center blvd LIC til 6:30 tonite.	1381599057	389080765600137217	f	itizyicecream
@NoExpiration @TaraLipinsky @courtneyesmith @yousingiwrite @IamJessicaLima Sorry, we won't be out today :(  Hopefully we'll see you next wk	1381420892	388333484239888384	f	itizyicecream
Cooler weather means your ice cream won't melt as fast outdoors so you have more time to enjoy a delicious scoop at 115 st and Broadway	1381339776	387993259639070721	f	itizyicecream
Walk out into the most and get some dreamy ice cream.  Just walk towards Greenwich and jay st before 6pm :)	1381082157	386912729837350913	f	itizyicecream
Back in LIC with the truck so everyone that have been asking for our pints, today is your day! 47th rd & Center Blvd	1380998048	386559950740533248	f	itizyicecream
@Marilyn_He glad you asked!  It's a long and raging debate for many of our customers :-) Its i as in Italy, followed by tizzy.	1380912785	386202328845803520	f	itizyicecream
New flavor!  Mango ice cream... Stop by our truck at 115th and broadway til 6:30 pm today.	1380903796	386164626511380480	f	itizyicecream
RT @KittyGoogs: @milktrucknyc fridayritual my milkshake makes my friday. Every Friday. tgif http://t.co/RSo3R4SNoa	1423249289	563774496482402304	f	milktrucknyc
RT @KittyGoogs: Finished my @milktrucknyc ..still no boys in my yard. Sigh. http://t.co/FEhQ11nahA	1423249281	563774466744778752	f	milktrucknyc
Bessie's at William St & Wall St. today! You know the drill, call 646-504-6455 or @FoodtoEat.com to preorder. Menu always @houstonhallnyc	1423233004	563706192845737984	f	milktrucknyc
mondaymorningcc's photo http://t.co/knc9cvafM1	1423183680	563499314102939648	f	milktrucknyc
foodjunkiess's photo http://t.co/MUq7jnKxnL	1423168703	563436497190539264	f	milktrucknyc
Who's hungry? Find Bessie at 53rd/Madison today, Call 646-504-6455 or @FoodtoEat.com to preorder. Menu always at @houstonhallnyc.	1423146612	563343840275206145	f	milktrucknyc
@Elsohionyc bringing joy--our mission! thank you!!	1423143890	563332423174590464	f	milktrucknyc
RT @Elsohionyc: @milktrucknyc you made my week a little better by being in midtown for lunch today :)	1423143828	563332162397962240	f	milktrucknyc
Hey Midtown, Bessie is at 58th/Madison today. Call 646-504-6455 or @foodtoeat.com to pre-order.  Menu at @houstonhallnyc too! midtownlunch	1423060212	562981451725930496	f	milktrucknyc
hey Bessie fans, due to some traffic issues, the truck is heading back to the barn for today. Catch us tomorrow though at 58th and Madison!	1422984940	562665736356003840	f	milktrucknyc
Bessie's on the move! Catch our truck soon at 18th and 5th. lunchtime nyc grilledcheese	1422982985	562657540069408769	f	milktrucknyc
Bessie's at 25th and Park today! Call 646-504-6455 or @foodtoeat.com to pre-order. Menu all day everyday at @houstonhallnyc.	1422978954	562640631651385344	f	milktrucknyc
We're on Tastes that Make NY list! http://t.co/iZdDfBvAOg  Visit 25th/Park today 11-3 & check our grilled cheese off your list @foursquare	1422978455	562638537087254529	f	milktrucknyc
Bessie's in the barn hiding from the weather, catch her the rest of the week! Sandwich menu always @houstonhallnyc	1422887412	562256676967813120	f	milktrucknyc
RT @bkflea: Happy SuperBowlSunday! The Flea is open 10a-6p in 1000 Dean St. and @bergnbk will have the game on the big screen! http://t.co...	1422801748	561897374285852672	f	milktrucknyc
RT @BryantParkNYC: Enjoy mac and cheese, grilled cheese, and more from @milktrucknyc inside the Brew House at Winter Carnival!	1422741687	561645463192227842	f	milktrucknyc
we are at the WinterCarnival @BryantParkNYC today 12-10. tons of activities & delish food-- @MightyQuinnsBBQ @SigmundPretzels & lots more!	1422723497	561569165082132481	f	milktrucknyc
Hey Tribeca, Bessie's serving lunch at Chambers & Greenwich. Call (646) 504-6455 to pre-order or @FoodtoEat.com.	1422716420	561539485511340033	f	milktrucknyc
We're at @bkflea's WinterFlea from 10am-6pm, 1000 Dean Street and at @BryantParkNYC. See you there!	1422716405	561539420818395137	f	milktrucknyc
9 Simple Ways to Keep Food Fresh http://t.co/YWCEbshpUF	1423260326	563820790576345088	f	souvlakitruck
The Art Of Street Eating In New York City, Captured In Photos http://t.co/2rqP2NZ90b  @HuffpostTaste http://t.co/QHzmzWwxN1	1423252528	563788084660408320	f	souvlakitruck
RT @randomfoodtruck: Put on your earmuffs and grab something toasty for lunch! @PolishCuisine @VeganLunchTruck @souvlakitruck @DeliNDogzTru...	1423245134	563757069145096192	f	souvlakitruck
The SGRT is on Varick/Charlton \nWith a little taste of Mykonos\n@WeWork @HudsonSquareNYC	1423154002	563374834608926720	f	souvlakitruck
So cool! | Chemists Invent Device To Unboil Eggs http://t.co/JrEbKyirzZ via @foodrepublic http://t.co/Du57paUY7K	1423086305	563090892874350593	f	souvlakitruck
The SGRT is in Hanover Sq/Water\nWith a little taste of Mykonos	1423065973	563005613534629890	f	souvlakitruck
22 Chefs Tell Us What They'd Eat Every Day If They Could http://t.co/KYNhQLUmRq via @thrillist http://t.co/p1YQ3N7zZa	1422982938	562657341548818432	f	souvlakitruck
The SGRT is on Varick/Charlton \nWith a little taste of Mykonos\n@WeWork @HudsonSquareNYC	1422978871	562640282995281920	f	souvlakitruck
Who Is Who in the New Greek Government | via @GreekReporter http://t.co/RiBdB9FjPB http://t.co/nQ5UmveNJM	1422921906	562401355319771136	f	souvlakitruck
What Type Of Cooking Oil You Should Use For Every Occasion http://t.co/y3NhUVRU1T via @huffposttaste http://t.co/9roNS286vY	1422906917	562338486070829056	f	souvlakitruck
RT @nycfoodtruck: Mmmm... @CoolHausNY & @SouvlakiTruck on @skycityapts blog: http://t.co/qqUjGm0f29 keepontruckin	1422903874	562325722745032705	f	souvlakitruck
@AamerP86 Thank you so much for coming! How was your visit?	1422891631	562274371008737280	f	souvlakitruck
RT @skycityapts: 5 best handpicked food trucks u should try on ur next NYC trip: http://t.co/HxyF6VAAsX @KorillaBBQ @souvlakitruck http://...	1422891611	562274286539636737	f	souvlakitruck
Visit our truck, of course! | 20 Fantastic Things To Do This February via @Gothamist http://t.co/TetD1m32Ur http://t.co/YYd31XFEkk	1422820513	561976080027103238	f	souvlakitruck
50 Kitchen Hacks in One Infographic | via @FirstWeFeast http://t.co/ddP0QTCb4a http://t.co/VazAGMtFIp	1422729622	561594855814873090	f	souvlakitruck
How Much Food Will Americans Eat This Super Bowl Sunday? via @FirstWeFeast http://t.co/oZ3LjGLdL1 http://t.co/Saqc6gcCE8	1422653721	561276505557594114	f	souvlakitruck
The SGRT is on 55st/Broadway \nWith a little taste of Mykonos\n@randomfoodtruck till 3pm.	1422634099	561194205318766593	f	souvlakitruck
The SGRT is on Varick/Charlton \nWith a little taste Mykonos\n@WeWork @HudsonSquareNYC	1422548949	560837059959865344	f	souvlakitruck
The SGRT is in Hanover Sq/Water\nReady with charcoal grilled Souvlakia \nand our signature Greek Fries till 3pm\nBundle up NYC it's a cold one!	1422461693	560471082705383424	f	souvlakitruck
What a fun twist :) | Top Chefs Review and Rate America's Food Critics on @TheDailyMeal http://t.co/VAAQpAQVev http://t.co/RB6EQfmpyJ	1422394220	560188079617884160	f	souvlakitruck
Happy Friday!!reward yourself.\nWith a tasty and warm meal from eggs travaganza,join us. 52&park is the place.	1423226344	563678258940903424	f	etravaganza
Steak & egg tacos on demand, Mexican Wraps as well.\n52& park is the place.	1423066646	563008439283359745	f	etravaganza
RT @tastoriaqueens: RIPFLUSHINGMALL. That is all. Queens	1422720948	561558477328621568	f	etravaganza
RT @FoodtoEat: Morning breakfast won't be the same without @ETRAVAGANZA  serving up with mexican noms! Preorder online for pickup: http:/...	1422028888	558655766509654016	f	etravaganza
Looking for something warm and tasty?Join us. the truck it's @52park, lunch be ready at 11:33.	1421856349	557932082899730433	f	etravaganza
RT @wolves: The BigCheesy is back! Jan 24 + 25 @openhousenyc @timeoutnewyork @GooseIsland @SonsofEssex @HudsonNYC @ETRAVAGANZA http://t.co...	1421757808	557518772874276864	f	etravaganza
Good morning! OPEN Join us. 52& park.	1421673384	557164672244539392	f	etravaganza
RT @FoodtoEat: You know the deal with @ETRAVAGANZA - breakfast and lunch will make your day better. Preorder online for pickup: http://t.co...	1421337341	555755207125397504	f	etravaganza
RT @tastoriaqueens: Why Diners Are More Important Than Ever by @edlevine (couldn't agree more, btw) features LIC's Court Square Diner: htt...	1421083251	554689474861727744	f	etravaganza
TastyCajun chicken breast salad bowl w/mixed greens baby spinach onion peppers mushrooms sliced avocado jalapenos.recharge those batteries!	1421079816	554675068371238912	f	etravaganza
Lunch it up with a tasty Mexican flavors.\nWe are @ our usual location N. East 52& park, still serving Breakfast till 1:59 pm	1420649188	552868886115516416	f	etravaganza
G.morning don't miss out your tasty,warm breakfast such a Mexican egg wrap and more.call us for express pick up 917-657-0987.	1420551146	552457666879303680	f	etravaganza
Good morning folks..!!Rise & shine.breakfast is ready..join us the truck is in 52nd and Park.	1420460566	552077747619897344	f	etravaganza
Happy new year..!! Beginning a New Mission. Stay tuned.	1420345122	551593539495550976	f	etravaganza
**Merry Christmas**	1419520758	548135904918126592	f	etravaganza
RT @FoodtoEat: End the week with @ETRAVAGANZA for breakfast and lunch!  Preorder online for pickup: http://t.co/QbS0Ney6ZL	1419005597	545975162215362560	f	etravaganza
Hey Folks..!! lunch will be ready at 11:59 AM.	1418921697	545623262781509632	f	etravaganza
RT @FoodtoEat: It's cold outside but warm up your hands with @ETRAVAGANZA! Pancakes or burrito? Preorder online for quick pickup: http://t....	1418316235	543083771592204288	f	etravaganza
Ready for lunch..!! 52 and park.	1418229246	542718910064521216	f	etravaganza
Good morning..It's raining cats and dogs!!	1418131493	542308905733599233	f	etravaganza
Happy Friday @Dumbolot enjoy the sunny day Curry King spicy entree &bites great for the weather	1423229266	563690515384639488	f	mausamnyc
Dumbolot Curry King Thursday's best enjoy authentic curries	1423147874	563349133302321152	f	mausamnyc
Curry King vindaloo great for today cold day @52nd between 6 & 7 avenue	1422970806	562606454851383298	f	mausamnyc
Happy Friday Dumbolot best for this weather delicious spicy curries and bites	1422629363	561174341748932608	f	mausamnyc
Midtown Curry King @52nd street & 6th avenue get your savory lunch entree & bites	1421849185	557902036608356352	f	mausamnyc
savory curries @52nd between 6 & 7 avenue	1421762323	557537710563282945	f	mausamnyc
weekend starts with Curry King @Dumbolot authentic curries N bites	1421418104	556093951946407936	f	mausamnyc
Dumbolot Curry King Thursday's best savory curries n bites	1421333993	555741162724536320	f	mausamnyc
fresh curries @52nd street & 6 avenue	1421248012	555380535531298816	f	mausamnyc
beautiful day @52nd street between 6 & 7 avenue fresh curries N bites	1421160863	555015003644780545	f	mausamnyc
don't let the stop you from your savory lunch Curry King @Dumbolot	1421073633	554649134183874560	f	mausamnyc
Friday's mouth watering authentic curries @Dumbolot  Curry King  start your weekend with spicy delicious entree N bites	1420819177	553581869535469569	f	mausamnyc
delicious authentic spicy Indian Entree N Bites great day for Curry King @Dumbolot	1420729996	553207819210481664	f	mausamnyc
Curry King @52nd street between 6 N 7 Avenue (corner 6 ave) need spicy lunch we are the best	1420558882	552490112643502083	f	mausamnyc
Curry King @Dumbolot great day for vindaloo	1420467654	552107475973836800	f	mausamnyc
Safe prosperous  New Year 2015 to All Curry King @Dumbolot spice up your day with authentic curries N bites	1420207966	551018266143911936	f	mausamnyc
current location 47 street between Park N Lexington 	1420042900	550325929050796033	f	mausamnyc
Stop by Wythe Ave. & N. 11th St. for some delicious hot pizza! We'll be here all night til... http://t.co/ifELwr1VMa http://t.co/WUYR4aLl9o	1423278099	563895335970693122	f	neaexpress
AND 77th and Broadway!	1423272457	563871670184984576	f	neaexpress
Dinner on 72nd and Broadway	1423272390	563871391360241665	f	neaexpress
We have a truck in Brooklyn on Wythe Ave & N 11th until 5AM! pizzaneversleeps	1423272350	563871222963109889	f	neaexpress
@little_mswriter that's what we love to hear! What'd ya order? Did you take a pic of your pizza?	1423272283	563870940850044929	f	neaexpress
RT @little_mswriter: @NeaExpress Just had a pizza from you guys in the UWS. SOLD! I'm a fan :D	1423272262	563870853998596096	f	neaexpress
Stay warm with our hot and spicy personal pizza pie! Our a Diavolo is made with San Marzan... http://t.co/wwkFYggxMk http://t.co/JZViBTJhIU	1423254205	563795117279305728	f	neaexpress
I was in love with Harlem long before I got there.- Langston Hughes neaexpress neapol... http://t.co/4ovH2skFSa http://t.co/CtCV6KWJZm	1423250655	563780225818185728	f	neaexpress
Today we have a truck on 47th and Park from 11 AM to 3 PM	1423234800	563713728735346688	f	neaexpress
RT @VaibhavBhanda19: @NeaExpress craving for  !!! Please tomorrow for lunch ard mid town	1423198582	563561818812338176	f	neaexpress
Happy WorldNutellaDay! credit: @melissabethk nutella newforkcity foodporn neapolitan... http://t.co/GfoWsJFwtS http://t.co/fbF2RcwROx	1423167571	563431749657833472	f	neaexpress
RT @DinaK528: @NeaExpress very happy you're back in my work neighborhood :)	1423161511	563406331546464256	f	neaexpress
We have another truck at 53rd and Park Avenue 	1423154662	563377605035184128	f	neaexpress
We have a truck at West 91 street and Columbus Ave.	1423154607	563377372955947008	f	neaexpress
Nieuw Harlem, as it was named by early Dutch settlers, was a farming community in the mid-... http://t.co/b86mncNhVT http://t.co/hsE0RRPCY9	1423087502	563095914773229568	f	neaexpress
Mmm! di Parma D.O.P. pie made with San Marzano tomatoes, Mozzarella di Bufala, basil, Pros... http://t.co/iFb9co3AqH http://t.co/OTSkHq0i6S	1422997903	562720108385415168	f	neaexpress
Our Mozzarella Di Bufala D.O.P. is made of basil, organic grape tomatoes, EVOO, and shaved... http://t.co/h9ZMC2bVPg http://t.co/betsEKRftB	1422896605	562295233388744704	f	neaexpress
No trucks today. Stay safe, dry, and warm out there!	1422894097	562284715164827648	f	neaexpress
Thank you for stopping by @madlenakalinova! hotgirlseatingpizza nutella pizza neapoli... http://t.co/KhQ3W2LMKl http://t.co/XRH2eNTRJj	1422817897	561965107698483200	f	neaexpress
Happy Super Bowl Sunday! May the best team win.	1422814193	561949572952756224	f	neaexpress
@YeahThatsKosher @abieDweck http://t.co/kZyf7LNGqH	1417538109	539820071603163136	f	grillonwheelsny
We would like you all to try out Pitopia on Broadway/w37th St for Falafel, Shawarma, Schnitzel and Salad bar http://t.co/GEINcVEUyl	1417537134	539815985835175936	f	grillonwheelsny
Wow! Thank you for all the TLC! GOW will be off for a little bit longer. Working on some cool modifications!! Can't wait to c u soon!	1412013484	516648115638915072	f	grillonwheelsny
Hey everyone! TU for all the emails, we miss u2. We r still here!! Just taking an extended holiday and will be back after Rosh Ha Shana!	1411135732	512966559116304384	f	grillonwheelsny
Hi guys We are very sorry Grill on wheels off the road today	1410874541	511871043859148800	f	grillonwheelsny
Hi guys We are very sorry Grill on wheels off the road today 	1410790890	511520183744483328	f	grillonwheelsny
GOW truck is getting a tune-up and will be off the road this week. We'll be back next week and stronger than ever!!	1410351061	509675407445348353	f	grillonwheelsny
Hi guys We are very sorry Grill on wheels off the road today 	1410281876	509385224741191680	f	grillonwheelsny
We are going to be serving a private event today during lunch!! C U all tomorrow!	1410187803	508990656027848704	f	grillonwheelsny
Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00crazy chicken baby chicken lamb burger couscous	1409929542	507907431733932032	f	grillonwheelsny
Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00crazy chicken baby chicken lamb burger couscous 	1409917625	507857446103429121	f	grillonwheelsny
Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00crazy chicken baby chicken lamb burger couscous 	1409838067	507523755393171456	f	grillonwheelsny
Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00crazy chicken baby chicken lamb burger couscous kofta kabab	1409829581	507488163766755328	f	grillonwheelsny
Parked on 47th off Park Ave today! schnitzel crazy chickenshawarma yummy	1409752583	507165209140932608	f	grillonwheelsny
Parked on 47th off Park Ave today! schnitzel crazy chickenshawarma yummy	1409745267	507134523914846208	f	grillonwheelsny
Grill On Wheels downtown in the financial district! Hanover & Water St- open @11:00 to 3:00	1409665364	506799386152943616	f	grillonwheelsny
Grill On Wheels downtown in the financial district! Hanover & Water St- open @11:00 to 3:00	1409659130	506773240917008384	f	grillonwheelsny
Hi guys We are very sorry Grill on wheels off the road today 	1409324168	505368309312024576	f	grillonwheelsny
Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00crazy chicken baby chicken lamb burger couscous kofta kabab	1409227360	504962266945847298	f	grillonwheelsny
Join us 4 lunch Water st and Old Slip 11am to 3pm\nschnitzel crazy chickenshawarma yummy	1409150997	504641975648526336	f	grillonwheelsny
I posted a new photo to Facebook http://t.co/9zY9mElmte	1423260276	563820580710125569	f	polishcuisine
Get ready for Thursday, Feb. 12 (Fat Thursday - Tlusty Czwartek) & Fat Tuesday Feb. 17th! order information will be announced Monday!	1423255538	563800707967746049	f	polishcuisine
thanks for coming everyone and have a fantastic weekend!	1423252658	563788629290397696	f	polishcuisine
I posted a new photo to Facebook http://t.co/woVYaMvJga	1423247189	563765691539791873	f	polishcuisine
55th & broadway today special pickle salad today~!	1423244274	563753465324003329	f	polishcuisine
RT @randomfoodtruck: Put on your earmuffs and grab something toasty for lunch! @PolishCuisine @VeganLunchTruck @souvlakitruck @DeliNDogzTru...	1423243857	563751716781588481	f	polishcuisine
I posted a new photo to Facebook http://t.co/07YV2CuCTx	1423241927	563743618129600513	f	polishcuisine
I posted a new photo to Facebook http://t.co/uD2mdhy9H2	1423240885	563739251083182080	f	polishcuisine
I posted a new photo to Facebook http://t.co/PCvFg3bTOg	1423240759	563738719648509953	f	polishcuisine
special cucumber in brine, carrots, peppers, and onion salad today~!!! special traditional not your average pickle! http://t.co/UqjQQcigHi	1423239621	563733946631208961	f	polishcuisine
I posted a new photo to Facebook http://t.co/BXm53PKiRu	1423239565	563733713859526656	f	polishcuisine
Open and ready to roll on 55th & Broadway pierogitime	1423239104	563731781074313216	f	polishcuisine
It's definitely a happy traditional Friday on 55th & Broadway today~!	1423231764	563700992890638337	f	polishcuisine
thanks for coming! see you on the road tomorrow!	1423164395	563418426405060608	f	polishcuisine
RT @SunilBhide1: @PolishCuisine. Getting my weekly fix of kielbasa & pierogies. So good, so good.	1423162576	563410797360340992	f	polishcuisine
Open from 11-2 on 52nd b/w 6th & 7th (closer to 6th) MidtownWest pierogitime	1423152076	563366755981357056	f	polishcuisine
I posted a new photo to Facebook http://t.co/AIQt9Ag8ZR	1423148986	563353795078660096	f	polishcuisine
I posted a new photo to Facebook http://t.co/pGEOuf3Mx7	1423148914	563353496695894018	f	polishcuisine
I posted a new photo to Facebook http://t.co/NkeFR25hkl	1423146518	563343447051218944	f	polishcuisine
52Nd between 6th & 7th (closer to 6th)!	1423144347	563334339849912320	f	polishcuisine
Welcome Friday! We r ready 2serve at Hanover sq.water at Try our ramen noodle soup, rice bowl, bibimbap burrito, tofu casserole  as well Thx	1423241119	563740230973673472	f	bobjotruck
Hello nyc ! We r open at 47th st. Btwn park and lex ave. try our ramen noodle soup,rice bowl and new menu tofu casserole plZ stop by & enjoy	1423068086	563014476182855680	f	bobjotruck
Hello nyc !! we r open @varick and king st. Try our new menu tofu casserole -soondubu- rice bowl& ramen as well plZ stop by & heat on Thx :)	1421944543	558301995602554880	f	bobjotruck
Hello nyc we r ready to serve @47th park&lex try our new vegetarian menu tofu casserole. Rice bowl and ramen , bubimbap burritos as well.Thx	1421857829	557938293133021185	f	bobjotruck
Good morning! We r open at water and hanover sq. try our new menu tofu casserole. Heat on with ramen noodle soup, rice bowl as well thank u	1421772657	557581056006979584	f	bobjotruck
New menu tofu casserole and galbi -short rib - korean bbq is back :)) thank you http://t.co/8Axim8vTDB	1421337532	555756010275872769	f	bobjotruck
Good morning nyc we r open at varick and king st. Try our new menu tofu casserole. Ready to serve ramen noodle soup and ricebowl as well thx	1421337425	555755557710467073	f	bobjotruck
Good morning nyc we r open at 47thst. Btween park /lex ave. try our ramen nood soup and rice bowl. New menu soft tofu soup as well thank you	1421252927	555401151060148225	f	bobjotruck
Hello nyc we are open @varick and king st. Try our ramen noodle soup and rice bowl and bibimbap burrito!! Thank you	1421166870	555040200054042627	f	bobjotruck
Hello nyc we r open at 47th st. Park and lex ave. Try our ramen noodle soup and rice bowl , bibimbap burritos thanx:) http://t.co/plWCZYlfks	1420648678	552866745158213632	f	bobjotruck
Happynewyear! We r reday to serve at 46th st. Btwn 5&6thave. Try our ramen noodle soup,ricebowl bibimbap burritos and Veggie dumpling. Thanx	1420476525	552144684769099776	f	bobjotruck
Hello nyc!! We r open @46th btwn 5th&6th ave. try our ramen noodle soup, rice bowl, bibimbapburrito&dumpling !! Plz Comeby and enjoy thx !	1419957391	549967278218158080	f	bobjotruck
Happy holiday ! We r ready to serve at hanover sq. water st . Try our ramen noodle soup and rice bowl bibimbapburrito&dumpling !!!! Thank u!	1419351467	547425848018890753	f	bobjotruck
Happy holiday NYC! We r open @ 46th at. 5th ave. corner. Try our ramen noodle soup,rice bowl,bibimbop burrito and dumpling plZ come by!! Thx	1419266635	547070037711147009	f	bobjotruck
Good morning NYC! We r open @water&hanover sq. Try our ramen noodle soup,ricebowl,bibimbapburrito&dumpling new menu clam chowder! Thank u!	1418745440	544883988251561984	f	bobjotruck
Plz come by and enjoy ! Thank you very much!!!	1418660476	544527620734332928	f	bobjotruck
Good morning nyc ! We r ready 2 serve @47th btwn 5&6th ave . Try our ramen noodle soup&rice bowl,bibimbap burrito. Stay warm with ramen soup	1418660435	544527448310681601	f	bobjotruck
Hello nyc !we r open @varick &charlton st. Corner. We ready to serve ramen noodle soup rice bowl and bibimbop burrito plz comeby &enjoy thx	1418316495	543084859049385984	f	bobjotruck
We r open at 47thst. Btwn park&lex ave. Try our ramen noodle soup rice bowl veggie tofu & bibimbap burritos plz come by and enjoy thx	1418227627	542712120060952576	f	bobjotruck
Good morning we r open at 47th st. Btwn park&lex Ave. we r ready to serve bagel , coffee(lavazza) , homemade pumpkin soup for breakfast thx)	1418217614	542670125422235648	f	bobjotruck
$8 LUNCH!!!\nMI Viejo San Juan \n2920 Bruckner Blvd\n(Off  E. Tremont Ave Throggsneck)\nBronx NY 10465\n347-691-3100 http://t.co/RAkSMxl5ab	1420547746	552443405998256128	f	latinkitchennyc
GM \nWE ARE OFFICIALLY OPEN TO THE PUBLIC!!\nMI VIEJO SAN JUAN\n2920 BRUCKNER BLVD\nBRONX NY 10465\n347-691-3100 http://t.co/kpE6rX06zj	1420469377	552114700545441793	f	latinkitchennyc
Hello NYC! GRAND OPENING CELEBRATION CONTINUES MI VIEJO SAN JUAN 2920 BRUCKNER BLVD BX NY 10465 / 347-691-3100 http://t.co/9dC2yFeMKa	1418830630	545241301139337216	f	latinkitchennyc
http://t.co/KPpvBHCkbd	1418830545	545240942446649346	f	latinkitchennyc
WE ARE OFFICIALLY OPEN!\nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD\nBRONX NY 10465 \n347-691-3100\nFREE DELIVERY! !! http://t.co/Cm1icQM0rK	1417293113	538792483766173696	f	latinkitchennyc
Good morning Bronx NY! MI VIEJO SAN JUAN OPENED FOR LUNCH 11:30am-9pm 2920 Bruckner Blvd Bronx NY\n347-691-3100 http://t.co/4s2KpbtKhc	1416918138	537219728432193536	f	latinkitchennyc
Tonight Sat. NOV 1st 9pm- 4am our last night in 2014 in NYC.\nPier 94 55st Westside Hway\nhttp://t.co/LKUSHHZZ7S http://t.co/eFpux46UIR	1414890854	528716681053749248	f	latinkitchennyc
@GuyFieri  food truck outside Pier 94 The Latin Truck	1414828429	528454851223908353	f	latinkitchennyc
@GuyFieri  come outside and taste the best Cuban Sandwich in NY I see you here at Pier 94	1414828315	528454374264438784	f	latinkitchennyc
HAPPY HALLOWEEN ! ! TODAY OUR LAST FRI OF 2014 ..THANK YOU WALLSTREET! !\nLOCATION 55 WATER ST (SIDE OF OLD SLIP) NYC http://t.co/RWCtK9bCEc	1414768415	528203136083980289	f	latinkitchennyc
Goodmorning NYC!  Today Thurs 10/30 11:30am-3pm location 47st Bet Lexington & Park aves NYC \nhttp://t.co/MPHGwjSFxE http://t.co/561h1OENyI	1414682084	527841037998628864	f	latinkitchennyc
3 DAY COUNT DOWN! THX 4 A GREAT SUMMER\nTODAY WED OCT 29TH \nLOCATION: 55 WATER ST ( SIDE OF OLD SLIP & FRONT ST ) NYC http://t.co/cm9t9ZGx36	1414596794	527483303558144000	f	latinkitchennyc
GOODMORNING WALLSTREET NYC!  \nTUES OCT 28TH WE @ 55 WATER ST. (SIDE OF OLD SLIP)NYC  \nTHIS IS OUR LAST WEEK. C U 2015 http://t.co/tRCqNwMyFU	1414505917	527102138720468992	f	latinkitchennyc
Goodmorning NYC!  WALLSTREET WE ARE HERE! TGIF OCT 24 11:30AM -3PM \n55 WATER ST ( SIDE OF OLD SLIP ) NYC http://t.co/akxSOPbbVn	1414158461	525644801690304512	f	latinkitchennyc
WE ARE ON OUR WAY! WALLSTREET  WE COMING! \nTODSY THURS  OCT.23RD  11:30AM-2:30PM\n55 WATER ST (SIDE OF OLD SLIP ) NYC http://t.co/8g41I5kGEN	1414072397	525283824461414400	f	latinkitchennyc
WALLSTREET WE ARE HERE! TODAY WED OCT 22 TILL 3PM 55 WATER ST ( SIDE OF OLD SLIP ) NYC http://t.co/MPHGwjSFxE http://t.co/p73XxbOKfE	1413996457	524965306394234880	f	latinkitchennyc
WALLSTREET WE ARE HERE!  TODAY FRI OCT.17 11:30AM-3PM\nLOC: 55 WATER ST (SIDE OF OLD SLIP)NYC\nhttp://t.co/MPHGwjSFxE http://t.co/XWtxf1KXsL	1413558957	523130298671071232	f	latinkitchennyc
GOODMORNING WALLSTREET WE ARE HERE! WED OCT 15TH 11:30-2:30PM LOCATION 55 WATER ST ( SIDE OF OLD SLIP ) NYC\nGREAT DAY http://t.co/i10EXwTZuo	1413384009	522396513939783680	f	latinkitchennyc
Goodmorning Midtown East NYC!  Today Tues 10/14 11:30am-3pm location 47st Bet Lexington & Park aves NYC http://t.co/FaS74EBuQ9	1413295674	522026009894608896	f	latinkitchennyc
TODAY THURSDAY 10/9 11:30-3PM PUERTO RICO IS ON 47ST BET LEXINGTON & PARK AVE NYC \nhttp://t.co/MPHGwjSFxE\nCOME BY!!! http://t.co/t6pZJdwWzp	1412866415	520225569540427776	f	latinkitchennyc
Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE TEXAN preorder 9172929226 fidi	1423235286	563715765829120001	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE TEXAN preorder 9172929226 fidi	1422975850	562627612774653953	f	fritesnmeats
Peeps, due to the weather we will be off the road today	1422888496	562261222176067585	f	fritesnmeats
RT @CarismaPrinting: Got a chance to catch up with our friends @fritesnmeats this past Friday! http://t.co/8duZFmdmrY	1422840664	562060603024736256	f	fritesnmeats
RT @EyeSave: Live every day like it's FrieDay...fbf to @fritesnmeats fries in the http://t.co/JV8QT3Tmbu Office yesterday! TGIF http://t....	1422825533	561997137463230465	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE SMITHLAND preorder 9172929226 fidi	1422629785	561176108440498176	f	fritesnmeats
RT @MyDamnFoodBlog: This!!! If you guys are in NYC you have to track down @fritesnmeats ! I got the grass fed Angus beef... http://t.co/ef2wn...	1422544876	560819974995210240	f	fritesnmeats
Lunch 2day @ Hudson & king. Burger of the week THE SMITHLAND Preorder 9172929226 soho	1422455830	560446488741179392	f	fritesnmeats
Lunch 2day @ 47th st & 11th av. Preorder 9172929226	1422282472	559719374773571584	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE AO TRUFFLE BURGER preorder 9172929226 fidi	1422024044	558635447673704448	f	fritesnmeats
Lunch 2day @ Hudson & king. Burger of the week THE AO TRUFFLE BURGER. Preorder 9172929226 soho	1421852249	557914887150899201	f	fritesnmeats
Lunch 2day @ 10 Hanover sq b/t water & pearl st. Burger of the week THE AO TRUFFLE BURGER. Preorder 9172929226 fidi	1421765733	557552011907182592	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water & pearl St. Burger of the week THE  SPICY JAZZ preorder 9172929226 FiDi	1421420273	556103049035665409	f	fritesnmeats
Hello Brooklyn lunch 2day @ front & jay st. Burger of the week THE SPICY JAZZ. Preorder 9172929226 dumbo @DUMBOFoodTrucks	1421335099	555745803969789952	f	fritesnmeats
Lunch 2day @ Hudson & king. Burger of the week THE SPICY JAZZ preorder 9172929226 soho	1421247570	555378679191441408	f	fritesnmeats
Lunch 2day on oldslip & water st. Burger of the week THE SPICY JAZZ. Preorder 9172929226 fidi	1421160117	555011874585317377	f	fritesnmeats
Peeps, we are off the road today	1421071109	554638550432763904	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE CHEVRE TRUFFLE BURGER preorder 9172929226 fidi	1420814835	553563658492866561	f	fritesnmeats
Hello Brooklyn, lunch 2day @ jay & front st. Burger of the week THE CHEVRE TRUFFLE BURGER. dumbo @DUMBOFoodTrucks 9172929226	1420728726	553202489395527680	f	fritesnmeats
Lunch 2day @ Hudson & king. Burger of the week THE CHEVRE TRUFFLE BURGER. Preorder 9172929226 soho	1420642338	552840151932887041	f	fritesnmeats
@gogodavidgo wednesdays we will be there	1423241234	563740713415106560	f	sweetchilinyc
Find us on 26th street today outside @starrettlehigh for foodtruckfriday 1130-3! pre order to stay warm & pick up! sweetchilinyc@gmail.com	1423239272	563732484110962688	f	sweetchilinyc
RT @starrettlehigh: StarrettLehigh is excited to have @SweetChiliNYC joining our FoodTruck rotation on Fridays!! Foodie FoodFindings ht...	1423239087	563731706705100801	f	sweetchilinyc
Find us tomorrow @starrettlehigh on 26th & 11th 1130-3! don't forget to add a fried egg!  you can't get that when we are on the 2nd floor!	1423189590	563524102125027330	f	sweetchilinyc
We are on old slip & water 1130-3 today! pre order sweetchilinyc@gmail.com and skip the line! foodtruck NYC eat	1423152532	563368671972954112	f	sweetchilinyc
@isJordanJames @NCrist I'm so sorry!  Next time you come to the truck I'll throw something extra in on me!	1423073430	563036890795089922	f	sweetchilinyc
Truck needs a spa day today.  We will not be on the street today.  Sorry!	1423063403	562994834005557249	f	sweetchilinyc
@VeganLunchTruck adam i can't write u back u have to follow me so i can dm u	1423002651	562740024454946818	f	sweetchilinyc
@meggerz04 sorry for the delay but yes!	1423000037	562729061731282945	f	sweetchilinyc
Opening @ noon in @dumbolot sorry for the lateness!  Pre order sweetchilinyc@gmail.com no phone orders... http://t.co/xV7GCE2amG	1422981183	562649981371572224	f	sweetchilinyc
Brrrr it's a little (sweet) chili @dumbolot 2day! 1130-3 pre order & skip the line! Sweetchilinyc@gmail.com no phone orders 2day please yay	1422978208	562637501979193344	f	sweetchilinyc
Sorry we won't be on Wall street today due to the ice!  Be safe out there everyone!\nTuesday catch us @Dumbolot & @starrettlehigh 2nd floor	1422887692	562257849980837888	f	sweetchilinyc
enjoy the superbowl everyone! did you use SweetChili in your HalfTime snacks? Tweet us a pic! SweetchiliNYC http://t.co/vcPcckGurz	1422835921	562040709352783872	f	sweetchilinyc
Come get it soho we are on Broadway btw Houston & Bleeker till 3! Pre order to skip the line! 347-669-7385 or sweetchilinyc@gmail.com	1422635943	561201936792584192	f	sweetchilinyc
Good morning. Truck open at 55th street and  Broadway. Come !!!!	1422618648	561129399370911744	f	carpedonutnyc
TGIF we will be on Broadway btw Houston & Bleeker 1130-3 today! *** schedule change starting 2/4 we will be here Wednesdays, not Fridays***	1422629213	561173711873908736	f	sweetchilinyc
Closing up at 245 today.  Stay warm everyone!!	1422560078	560883739530907648	f	sweetchilinyc
Lunch 1130-3 today on old slip & water!  Pre order to skip the line! 347-669-7385 or sweetchilinyc@gmail.com keepwarm	1422548383	560834687095283714	f	sweetchilinyc
Come get lunch on 46th & 6th till 2! lunchtime excited feedme topchef thaietnamese porkbelly sriracha nyc	1422462433	560474186599391232	f	sweetchilinyc
Get thru your humpday with some sweet heat on 46th & 6th 1130-2! midtown lunchtime feedme spicyfood 	1422452825	560433887097413633	f	sweetchilinyc
Closed for today.  Enjoy the snow and stay warm! blizzard http://t.co/w2hucvhibL	1422370713	560089485346897920	f	sweetchilinyc
@ars410 we didn't make it out today. Sorry.	1423268370	563854528769175553	f	schnitznthings
Hey guys, The Schnitzel Cart will be on 26th st 11th & 12th ave. Pre order 347-772-7341.  Schnitzel for lunch!!	1423152791	563369757576265728	f	schnitznthings
@mcfhsieh Sorry about the late response, had some technical issues posting. We were on 27th st & Park today.	1423105218	563170220018499584	f	schnitznthings
The Schnitzel Cart is on Greenwich & Murray. Warm up with some Schnitzel for lunch!  Pre order 347-772-7341	1422985166	562666685883494401	f	schnitznthings
The Schnitzel Cart will be on 55th & Broadway.  Grab your favorite lunch! Schnitzel!	1422893984	562284241929916416	f	schnitznthings
@LDanya Sorry, no were not.  It's the truck usual spot on Fridays,  but it's down for maintenance. We will keep you posted	1422645854	561243507999141889	f	schnitznthings
Hey guys, The Schnitzel Cart is on 49th 6th & 7th ave. Grab some Schnitzel for lunch. Pre order 347-772-7341	1422636313	561203492480909313	f	schnitznthings
The Schnitzel Cart is on 26th st 11th & 12th ave serving up your favorite lunch.	1422550657	560844223386509312	f	schnitznthings
@mcfhsieh Sorry, we were not out today, due to weather conditions	1422498416	560625110294745088	f	schnitznthings
@LaarniRagaza Sorry, we were not out today, due to weather conditions.	1422498364	560624891599540224	f	schnitznthings
The Schnitzel Cart is on 55th & Broadway 11:30-1:45. Pre order 347-772-7341.	1422290530	559753170164146177	f	schnitznthings
Schnitzel for lunch!  The cart will be on 26th 11th & 12th 11:30-2:30 serving up your favorite lunch.	1421942149	558291956141686786	f	schnitznthings
@thebigtrain2000 No :-(   not yet. Will keep you posted.	1421856359	557932125572571137	f	schnitznthings
The Schnitzel Cart will be on 27th street & Park 11:30-2:30 serving up your favorite Schnitzel for lunch.  Hope to see you soon.	1421855819	557929861873152000	f	schnitznthings
The Schnitzel cart will be on Greenwich & Murray 11:30-2:30 Serving up your favorite lunch, Schnitzel!  Hope to see you soon.	1421769982	557569834494738432	f	schnitznthings
The schnitzel cart is on 49 street 6 and 7 ,come on by and get into some schnitz!!	1421429078	556139981199405058	f	schnitznthings
The Schnitzel Cart is on 49th 6 & 7TH AVE till 2:30. Pre order 212-470-7053\nSchnitzel for lunch!!!	1421428878	556139142833512450	f	schnitznthings
@thebigtrain2000 Yes, for now. We will keep u posted when we're back out.	1421340053	555766580270092288	f	schnitznthings
Hey guys The Schnitzel Cart is on 26th 11th & 12th ave. Pre order 212-470-7053. Grab some Schnitzel. For lunch!!	1421339747	555765297521905664	f	schnitznthings
@LaarniRagaza we're here	1421256926	555417920483131392	f	schnitznthings
Live your life like a Wes Anderson film, join BigRed at the @royalpalmsclub shuffleboard club tonight!\n\nhttp://t.co/TuPw0t2FY5	1423253434	563791882535600129	f	lobstertruckny
When was the last time you saw your ole pal BigRed? She's on 46th & 6th with Lobster Mac & Cheese, why don't you go say hello for lunch?	1423242364	563745452215238657	f	lobstertruckny
Six more weeks of winter?! Don't let the groundhog get you down, BigRed is on 46th & 6th! http://t.co/zU8aNr7umw	1423239333	563732738059280384	f	lobstertruckny
The stupid groundhog says 6 more weeks of winter. That's okay, we have Lobster Mac & Cheese on BigRed at 46th & 6th! http://t.co/bRoYIEgliO	1423236748	563721899503796225	f	lobstertruckny
Your lunch is at 53rd & Park on BigRed in the form of ooey-gooey Lobster Mac & Cheese. Do not deny your stomach!	1423068930	563018018792673282	f	lobstertruckny
It's almost warm out today and BigRed is out on the streets! 53rd & Park MakeItHappen RedHookLobster	1423065450	563003420836397056	f	lobstertruckny
Hopefully Tom and Richard will be friends now.  http://t.co/7afxKv2QBp	1422891090	562272101265334272	f	lobstertruckny
@octothorpe Sometimes in the summer we try it down there, I'll keep you posted.	1422890384	562269143370846208	f	lobstertruckny
We're going to crush it in 2015! Just ask HuffPo http://t.co/e1YQMzJV07	1422715514	561535684956393472	f	lobstertruckny
Have a sexy Friday tonight 6:00pm to midnight with BigRed at the @royalpalmsclub! http://t.co/7YuUeeZ0c1	1422661529	561309254330908673	f	lobstertruckny
Okay, it's January in NYC but tonight you can party like you're in Miami w/ RedHookLobster at the @royalpalmsclub http://t.co/iuEwprmsUE	1422652511	561271431389261824	f	lobstertruckny
Some are still unaware our pound in Red Hook is undergoing renovations, so tell your friends and have them read this: http://t.co/dF05vidd7j	1422649811	561260104579022849	f	lobstertruckny
Today using psychic force and sheer will I will convince my coworkers to get RedHookLobster for lunch at 46th & 6th http://t.co/CySRI9piy5	1422637538	561208628750057473	f	lobstertruckny
You are getting very hungry... for buttery lobster... food truck on 46th & 6th... you cannot resist... http://t.co/VXtttuGmbs	1422634517	561195957480873984	f	lobstertruckny
Not impressed by this winter? Want to get a lobster roll and pretend the whole season isn't happening? BigRed is on 46th & 6.	1422631220	561182127690358785	f	lobstertruckny
BigRed has arrived on Hudson & King with your lunch!	1422548308	560834371155144704	f	lobstertruckny
We are planning on sending BigRed out today but we're having issues with the battery. When she rolls out of Red Hook, I'll let you know.	1422542563	560810276111785984	f	lobstertruckny
@espronto email info@redhooklobster.com	1422472908	560518120054751232	f	lobstertruckny
Regardless who you're rooting for Sunday we can all agree lobster rolls at your party will make you a Super Bowl MVP! http://t.co/mEnyCpi4k0	1422460774	560467226248351744	f	lobstertruckny
@dannycam123 Our deepest apologies from the Pound http://t.co/WKrO71GFfq	1422458018	560455665530191872	f	lobstertruckny
RT @UrbanAdventures: Best eats in the NYC streets http://t.co/joBKsVqzeC @waffletruck @dubpies @VeganLunchTruck @snowdaytruck @korillabbq ...	1423282165	563912391625564160	f	waffletruck
@MarinaRosasco hmmm...closest is probably Goesting on 66th and Broadway.	1423282137	563912274537365505	f	waffletruck
@teawiththedevil you are most welcome!	1423282094	563912090508099584	f	waffletruck
RT @dessertbuzz: So cold in NYC today! Luckily we have A+ hot chocolate. Try @jacquestorres @waffletruck @citybakery @VoilaChocolatUS http:...	1423281948	563911480832438272	f	waffletruck
@Gvbecolong we feel the same!	1423281932	563911411802603520	f	waffletruck
@debrascarf that is a bit far for us.	1423281911	563911324544270336	f	waffletruck
@rachaelmadori New York's an early bird type a city.	1423281836	563911009950531584	f	waffletruck
@newyork_bites preach!	1423281784	563910792081199104	f	waffletruck
RT @newyork_bites: It's Friday - treat yo' self.\n(We will with some @waffletruck)\nwafelsanddinges foodie http://t.co/Eq3lY6rF0D	1423281773	563910745336057857	f	waffletruck
@ashlee_nichelle @kandeejohnson we agree! have to, have to!	1423281758	563910684606758912	f	waffletruck
@leahjs oh man, we'll look into it.	1423281729	563910559952035842	f	waffletruck
@rizexperience we miss you!!	1423281691	563910404133638144	f	waffletruck
Don't forget our morning special till 11am!!! dinges morning http://t.co/etRZRZm2rs	1423224085	563668783748104192	f	waffletruck
Vedette @ 59th & 5th Ave till 5pm \nKOTMADAM @ 24th & bway (Flatiron) till 8pm	1423223796	563667571300651008	f	waffletruck
CARTS\nGoesting @ 66th & Bway till 9pm\nPagadder @ Brooklyn Bridge /City Hall  til 8pm	1423223792	563667555051913216	f	waffletruck
TRUCKS\nKastaar @ Park Ave & 40th till 4:30pm\n\nMomma @ Varick & King till 4:30pl	1423223781	563667510898483200	f	waffletruck
Friiiiday!!! Almost weekend!! \n\nLe cafe @ 15 Ave B till 2am\nDe Wafel Cabana @ 35th & Bway open til 11pm	1423223775	563667484042342400	f	waffletruck
@mutemuse @tweeterjain @cathybytes @MightyChildish very sorry. We'll look into what happened.	1423175215	563463810343006208	f	waffletruck
@papalope and happy to be!	1423175159	563463575025758208	f	waffletruck
Now serving at 46th & 6th!!!!!!	1423255574	563800858539081728	f	korillabbq
Catch us for dinner today @ 46th & 6th	1423252904	563789660967952386	f	korillabbq
Open at 47th & Park!	1423242255	563744993601667072	f	korillabbq
Done for the night! Stay warm guys	1423183281	563497640466198528	f	korillabbq
Done at Metrotech! Headed uptown to 116th & Amsterdam. Dinner starts @5pm!	1423164642	563419463400165376	f	korillabbq
Metrotech! We've moved a block down to Myrtle and Bridge!	1423154856	563378419124404224	f	korillabbq
Now serving at Columbia U! Amsterdam & 116th	1423089155	563102845839618048	f	korillabbq
Now serving FiDi ! Old Slip & Front	1423069149	563018938339303426	f	korillabbq
Today we'll be passing your food instead of handing it to you. For absolutely no reason...	1423065997	563005718094430208	f	korillabbq
We're in FiDi today!	1423064258	562998420831764480	f	korillabbq
Done in Midtown! Headed uptown to CU! 116th & Amsterdam ready by 5	1422991958	562695174858752000	f	korillabbq
Sorry Midtown runnin a bit late 47th & Park ready by 12!	1422981692	562652115043356672	f	korillabbq
Still don't get it.. Why????????????	1422848999	562095559209918464	f	korillabbq
hawksbaby !!!!!!!!	1422842239	562067208030130176	f	korillabbq
korilla evill will shut down its doors like this one at 11PM (EST). see ya'll back with that hot fire on Monday! http://t.co/yPV1StciSO	1422666803	561331377082490880	f	korillabbq
RT @alexenglish: hey at @KorillaBBQ i just told the whole @GirlsnBoysNYC fan base on facebook about your new location on 3rd Avenue & St Ma...	1422662452	561313126105509890	f	korillabbq
Lunch today @ 47th & Park! Last truck closer to Lexington!	1422636696	561205096718274560	f	korillabbq
Dinner at Columbia U (116th & Amsterdam)	1422570145	560925963715096577	f	korillabbq
Serving metrotech Myrtle&Lawrence	1422550733	560844542061338624	f	korillabbq
Lunch today at Lawrence & Myrtle Metrotech	1422547407	560830593723035648	f	korillabbq
@UrbanAdventures @waffletruck @dubpies @VeganLunchTruck @KorillaBBQ Thanks for the love!	1423257843	563810376522162176	f	snowdaytruck
RT @UrbanAdventures: Best eats in the NYC streets http://t.co/joBKsVqzeC @waffletruck @dubpies @VeganLunchTruck @snowdaytruck @korillabbq ...	1423257747	563809974032551937	f	snowdaytruck
Freeeeeeee food now!!!! Downtown bk	1423243952	563752114984599553	f	snowdaytruck
RT @thenewjimcrow: This is what truly transformational work looks like!  I am so grateful to all those at Soul Fire Farm who are... http://...	1423164556	563419104095526913	f	snowdaytruck
.@soulfirefarm We are NYC's first farm-to-truck food truck and we hire and empower formerly incarcerated youth @DriveChangeNYC Let's connect	1423164152	563417407746998273	f	snowdaytruck
Live from the taping of @thechew with inspirational chef @chefsymon ! What a day! Catch us on air 2/24 http://t.co/BQDjDWPyI1	1423162251	563409435062968320	f	snowdaytruck
Today we visit the studio audience of @thechew ! We will be on the show later this month...stay tuned (in)!	1423144261	563333978841944064	f	snowdaytruck
Your best painting pose?? buildout team http://t.co/S115gTP80n	1423144189	563333677447659522	f	snowdaytruck
RT @dumbolot: The lot is smelling mighty fine with @DomoTaco @NeaExpress and @SnowdayTruck today!	1423070737	563025595194683393	f	snowdaytruck
MADMAPLELOVE to @_collectively for the Awesome article!! http://t.co/3NwHxafjnF \nhttp://t.co/rdco5VEWGF FARMFRESH SOCIALJUSTICE!	1422978459	562638553277272065	f	snowdaytruck
RT @Glangholtz: Snowday: an awesome non-profit social justice food truck employing ex-inmates http://t.co/qlCw1nRLLC via @ediblemanhattan ...	1422907637	562341504191303682	f	snowdaytruck
Truck packed with love - food truck for social justice at unity March http://t.co/hfSefVneav	1422820961	561977959452794880	f	snowdaytruck
Unity. Community. Love http://t.co/mdISkRSe2W	1422819248	561970774572281856	f	snowdaytruck
Feeling it - first day of Black History Month celebration in Jamaica Queens http://t.co/BrcPmf9fKM	1422816557	561959489218564098	f	snowdaytruck
Come on by Merric and Linden to walk for Martin Luther King and enjoy some farm fresh maple grilled cheese! http://t.co/HtYqgEqQe8	1422811460	561938112553943040	f	snowdaytruck
RT @DriveChangeNYC: We're proud to sponsor the MLK march happening in Jamaica Queens today at 2pm! @SnowdayTruck will be there! http://t.co...	1422811163	561936866149429248	f	snowdaytruck
RT @thereaIbanksy: can't stress this enough http://t.co/yQEBCCPabX	1422765783	561746525714673664	f	snowdaytruck
Who's coming out to North 6th & Bedford Ave with us today? We'll be whipping up SUGARONSNOW & MADMAPLELOVE  & will be open from 2-4:30!	1422720441	561556349201682433	f	snowdaytruck
RT @Herii_G: @SnowdayTruck best sugar on a stick ever!! http://t.co/qGa1oPDEtx	1422651871	561268746422353920	f	snowdaytruck
RT @ArtInFactMag: We love these NYC food trucks: @milktrucknyc @waffletruck @KorillaBBQ @shortysnyc @DesiFoodTruck @MexicoBlvd @SnowdayTr...	1422651865	561268720312807424	f	snowdaytruck
Now serving lunch from the cart on 55th & Broadway	1423157452	563389304379277312	f	papayakingtruck
Back at it in the @dumbolot today!	1422458400	560457268219891712	f	domotaco
Serving lunch in @DowntownBklyn today on Lawrence St until 4PM today	1423150022	563358140641845249	f	papayakingtruck
58th and Broadway for lunch today! Opening shortly	1423067432	563011734546706433	f	papayakingtruck
Off the streets today, hopefully see all your faces tomorrow! http://t.co/MoaBGsiaBA	1422982062	562653668848467968	f	papayakingtruck
We are at the @RoyalPalmsClub in Gowanus all day today. Stop by for a game of shuffle board and hot dogs!	1422722730	561565948369727489	f	papayakingtruck
No mobile today, see you tomorrow!\nTruck will be at @RoyalPalmsClub Cart will be in Midtwon	1422635047	561198180369723392	f	papayakingtruck
Food Truck Lunch today in Metrotech @DowntownBklyn \nCart: 55th and Broadway	1422547884	560832594569596929	f	papayakingtruck
Hope you all had a fun day off\nTruck: TBD\nCart: 55th and Broadway	1422465150	560485582787604480	f	papayakingtruck
We are off the roads today due to Juno hoping to be back by Wednesday!	1422295688	559774805214658561	f	papayakingtruck
@sanchez_jaylee not tonight. 52nd and 6th Ave	1421969428	558406373411913728	f	papayakingtruck
Check us out at our new dinner spot! Truck 52nd and 6th Ave	1421969386	558406195997057025	f	papayakingtruck
.@DowntownBklyn we are ready for you! Serving until 3PM (Food Truck)\nMidtownManhattan at 55th & Broadway (Food Cart)	1421945030	558304040384475136	f	papayakingtruck
Who is looking forward to FoodTruckThursdays at Metrotech in @DowntownBklyn tomorrow?	1421878794	558026224933801984	f	papayakingtruck
Catch us in midtown at 58th at broadway and 55th at broadway	1421858923	557942880678215680	f	papayakingtruck
Little late on our start today but we are at our dinner spot, 62nd and Broadway; Cart is on 55th and Broadway	1421781278	557617214493589504	f	papayakingtruck
Plans tonight? We are serving at the @RoyalPalmsClub Shuffleboard & Franks, what more could you want?	1421537526	556594845876490242	f	papayakingtruck
We're ready! Truck - 58th and Bwy Cart - 55th and Bwy	1421426839	556130590198874113	f	papayakingtruck
2 more hours in Metrotech and then we are closing and heading to 62nd and broadway for dinner FoodTruckThursdays. @DowntownBklyn	1421346259	555792611211227136	f	papayakingtruck
Whose hungry?\nTruck: 58th & Broadway \nCart: 55th & Broadway\nhttp://t.co/MoaBGsiaBA	1421259714	555429616257859587	f	papayakingtruck
Is it lunchtime yet?\nTruck: 58th & Broadway\nCart: 55th & Broadway	1421166386	555038171374043136	f	papayakingtruck
Wrapping up the week in a ZhongZi on 53rd & Park!	1423237947	563726927232774144	f	biandangnyc
Running a little late but catch us today and every Thursday on 53rd & Park ave!	1423148764	563352867088502784	f	biandangnyc
humpday :( Bian Dang on 53rd & Park :)	1423064349	562998805659156480	f	biandangnyc
Back on 53rd & Park taiwanesefood nom	1422977000	562632435582926848	f	biandangnyc
53rd and park! Be careful of the slippery roads!	1422975775	562627297526550528	f	biandangnyc
trucklife frozen babyitscoldoutside http://t.co/QCEkMzJhja	1422970500	562605172292325377	f	biandangnyc
porkchops are only a day away... Staying in today but will be back on 53rd & Park tomorrow!	1422890707	562270494570082304	f	biandangnyc
Iiiiiiit's FRYDAY BABY:) http://t.co/6OkeEjvau4	1422634967	561197845899149312	f	biandangnyc
Another porkbelly kinda day on 53rd and Park nom lunchbox dumplings buns	1422630822	561180459858546689	f	biandangnyc
Getting ready on 53rd & Park!	1422544293	560817531024584704	f	biandangnyc
Back on 53rd & Park today!	1422458415	560457331968712708	f	biandangnyc
Staying in due to inclement weather stay warm everyone!	1422372194	560095696443830272	f	biandangnyc
Blizzard warnings best enjoyed with a side of extra porksauce.  Come get some on 53rd & Park!	1422285471	559731953629282305	f	biandangnyc
Happy Friday from 53rd &  Park!	1422026717	558646658125144065	f	biandangnyc
Point your nose towards 53rd & Park and you'll smell today's porkchops getting prepped!	1421939987	558282889263984640	f	biandangnyc
Closing up early on 53rd & Park but we'll be back tomorrow at 11am!	1421866751	557975714453291008	f	biandangnyc
Hump day cure on 53rd & Park!	1421853955	557922042247675905	f	biandangnyc
Hope you enjoyed your long weekend! Ease back into the workweek with a bian dang on 53rd & Park today!	1421765610	557551495911333888	f	biandangnyc
Happy Friday from 53rd & Park!	1421421276	556107254462971904	f	biandangnyc
Taiwanese lunch day on 53rd & Park!	1421332832	555736295411306497	f	biandangnyc
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
ShortysUpperEast http://t.co/tEVKjMAMGt	1423273762	563877147451068417	f	shortysnyc
No Trivia tonight -- See you tomorrow at ShortysUpperEast 8pm. $12 Coney Island Pitchers. http://t.co/uUfVFpMQUW	1422992711	562698331722633216	f	shortysnyc
RT @SoCozy_: Dig in-Classic superbowl eats. Fab wings @shortysnyc xoxcozy http://t.co/R2hq9a2Ov2	1422878044	562217383868514305	f	shortysnyc
ShortysFlatIron SB49 http://t.co/0N7wsgDCKf	1422837072	562045536099119104	f	shortysnyc
ShortysUpperEast SB49 http://t.co/uP0z3xGZu9	1422836254	562042105242341376	f	shortysnyc
SB49 -- Game and Commercial Sound at ALL 4 Shorty's locations ShortysNyc http://t.co/8v32QfwFkn	1422807789	561922713603026944	f	shortysnyc
RT @AndyBioBrands: @shortysnyc with @Baker29  nothing like watching the flyers in the bigapple	1422804199	561907653753176064	f	shortysnyc
RT @aaguero9: The mango habanero sauce from @shortysnyc is amazing but crazy hot!	1422739115	561634671755526144	f	shortysnyc
RT @b_boogey_xl: @shortysnyc Yes! And the night is still young	1422676578	561372374218838017	f	shortysnyc
RT @b_boogey_xl: Happy Hour! (at @ShortysNyc in New York, NY) https://t.co/o6a9cWzuP0	1422662167	561311931395768320	f	shortysnyc
Dj Omar Tonight-- ShortysUpperEast http://t.co/bHKiE0iOz4	1422659853	561302224840568832	f	shortysnyc
Shorty's is gearing up for the BIG GAME. Game sound at all 4 stores. Where are YOU watching SB49 ? http://t.co/d1Ecwrgg2A	1422639198	561215590720102400	f	shortysnyc
RT @JJustine: @infatuation Ever have a Philly Cheesesteak from @shortysnyc ? Cheesesteaks CraftBeer GetItShorty GetPhillyWitIt	1422584032	560984206688657410	f	shortysnyc
Trivia tonight -- Shorty's Upper East -- 1678 1st ave. 8pm. Cheers. http://t.co/L3NoXny5gK	1422472625	560516933926539266	f	shortysnyc
RT @PassTheBrews: @shortysnyc Noted. PTB ShortysNYC http://t.co/Mk4aHIRrMF	1422417706	560286584558592000	f	shortysnyc
With Shorty's Hell's Kitchen up and running all 4 Shorty's Locations are back in action. Just in time for Happy... http://t.co/2OevU36qmp	1422392843	560182304854003712	f	shortysnyc
Shorty's Madison Ave OPEN-- 66 Madison Ave. http://t.co/JKUp1J0p1e	1422390090	560170755938611200	f	shortysnyc
Shortys Upper East is OPEN. http://t.co/k06QaMt1hp	1422387585	560160248783441921	f	shortysnyc
Shortys Pearl St open. TRIVIA TONIGHT. 9pm. http://t.co/xFsr2FXwLH	1422387229	560158757582553089	f	shortysnyc
RT @ShortysTrivia: You call that a BLIZZARD!? HA! We will see everyone TONIGHT 9pm!! @shortysnyc @briansowa @TheRealDananino @JamieKleinber...	1422374910	560107087926398977	f	shortysnyc
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
Slinging tacos hard in this harsh winter cold. Be worried not we stand strong. Taco strong.\n\n@ 46th btw 6th & 7th	1423247547	563767190936371202	f	mexicoblvd
@KennyEvitt thanks to our great Amigos of Mexico Blvd. that are always with us!	1423242294	563745159570259969	f	mexicoblvd
RT @KennyEvitt: @MexicoBlvd thanks for braving the cold today!	1423242182	563744688080158720	f	mexicoblvd
@MexicoBlvd: Hola Mudtown! Feliz viernes @MexicoBlvd tacotime 46St (6&7)	1423236307	563720047383027712	f	mexicoblvd
http://t.co/MNL2yjw4mY	1423230873	563697255828713472	f	mexicoblvd
RT @dumbolot: Stacked in the lot with @ToumNYC @mausamnyc and @MexicoBlvd!	1423155661	563381794234712064	f	mexicoblvd
http://t.co/ixCP5xopO5	1423155290	563380239884353536	f	mexicoblvd
Buenos dias DUMBO! tortas tacos flautas quesadillas guacamole @MexicoBlvd @dumbolot Water&Jay	1423150597	563360555894067200	f	mexicoblvd
Pastor Torta! http://t.co/1KoSIRGTQy	1423063817	562996572217434113	f	mexicoblvd
Good Morning Midtown! tortas tacos flautas quesadillas guacamole @MexicoBlvd 51st St & Park	1423063723	562996177785077760	f	mexicoblvd
This fierce cold has kept us out of the streets yet again. Sorry midtown	1422979899	562644596057190400	f	mexicoblvd
Hello Dumbo! No truck today day guys :( see you on Thursday	1422897341	562298321843548160	f	mexicoblvd
RT @ArtInFactMag: We love these NYC food trucks: @milktrucknyc @waffletruck @KorillaBBQ @shortysnyc @DesiFoodTruck @MexicoBlvd @SnowdayTr...	1422657320	561291600597618688	f	mexicoblvd
Happy Friday Midtown @MexicoBlvd taquizaconsabor 46st (6&7)	1422634435	561195612809723906	f	mexicoblvd
RT @dumbolot: It's goin down in the lot today with @ToumNYC @MexicoBlvd and @mausamnyc	1422548483	560835105397440513	f	mexicoblvd
Hola DUMBO! Comida de Mexico con amor @MexicoBlvd @dumbolot Water&Jay Feliz dia!	1422548459	560835005438758912	f	mexicoblvd
Good morning Midtown! tacoheat @MexicoBlvd 51st St & Park	1422460985	560468110437015552	f	mexicoblvd
How about a taco bar for your super bowl party? Email us at                 catering@mexicoblvd.com for more info!	1422064448	558804915947307009	f	mexicoblvd
Hola Midtown! tacofriday tacoheat @MexicoBlvd 46th St (6&7) Happy weekend!	1422026244	558644674676948993	f	mexicoblvd
Hola DUMBO! taquiza guacamole tortas flautas @MexicoBlvd @dumbolot Water&Jay	1421939825	558282206414929920	f	mexicoblvd
We are parked on 50th between 6th and 7th avenue.	1423237604	563725486271242241	f	thepocketful
Good morning 53rd street. We r between PARK & Madison	1423149063	563354121445457920	f	thepocketful
Located in 50th between 6th and 7th	1423062481	562990970724446208	f	thepocketful
Located on 50th between 6th&7th	1422980322	562646370281345026	f	thepocketful
Located on Hudson and King	1422891881	562275418561323008	f	thepocketful
On 50th between 6th and 7th Ave.	1422636872	561205835117105152	f	thepocketful
On 53rd between Park & Madison	1422545227	560821450085765120	f	thepocketful
Were on 50th between 6&7 avenues	1422464281	560481935974481922	f	thepocketful
Located in Hudson and King!	1422285826	559733442137817088	f	thepocketful
Located on 50th between 6th and7th	1422030039	558660595273445376	f	thepocketful
Located on 50th between. 6&7 avenues	1421940755	558286107855818752	f	thepocketful
Located on 53td between Park and Madison.	1421855715	557929426420506624	f	thepocketful
We are located on Hudson and King today	1421766954	557557136054837249	f	thepocketful
On 50th between 6/7. Sunny and beautiful!	1421424890	556122415118684160	f	thepocketful
Located on 50th between 6th and 7th	1421338738	555761068392591361	f	thepocketful
Located on 53rd between Park and Madison	1421249848	555388235191685120	f	thepocketful
Located on 50th between 6th and 7th.	1421162124	555020292872220672	f	thepocketful
Located on Hudson and  King streets.	1421075889	554658599860199424	f	thepocketful
Located on 50 between 6/7	1420822864	553597333829844992	f	thepocketful
Located on 50th between 6/7 avenues.	1420732167	553216923337752576	f	thepocketful
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
If you are looking for something fun, @Verboten is putting on a BBQ with DJs at 50 Kent Ave Willliamsburg. We are there from 3-10pm!	1408298570	501066636443795456	f	delsnyc
Oh Dumbo, it's freezing outside but we are here to give you crazy Hot noodles It warms the soul! @dumbolot @DUMBOFoodTrucks	1423242698	563746855553884160	f	mamuthainoodle
RT @writingmiranda: @GlitterFemme I have two. @SweetChiliNYC and @mamuthainoodle. So so good.	1422894140	562284895012401152	f	mamuthainoodle
It is true, we are back @dumbolot today! Come by & get your fix! Super bowl Friday! Tell us who your pick is! lunch nyc ThaiFood	1422636318	561203513284640768	f	mamuthainoodle
We are closed today & tomorrow. Stay warm NYC! snowpocalypse blizzardof2015 nyc	1422291162	559755823145291778	f	mamuthainoodle
So sorry Dumbo peeps. We had major mechanical issues. Couldn't make it today @dumbolot have a great weekend. Hope to be back soon!	1422039549	558700481422569474	f	mamuthainoodle
Happy Friday! Long weekend for some of you! Kick off your weekend with our truck! We are @dumbolot today! Til 3pm ThaiFood LunchTime NYC	1421427534	556133504040595458	f	mamuthainoodle
RT @fuelgrannie: i'm exhausted + it's still freezing = @MamuThai + @GrubHub thankgoodnessforamazingtakeout everythingtastesbetterhereinqu...	1421350400	555809979882815489	f	mamuthainoodle
RT @MasterChefNYC: Clean look to our trucks! Let us Build your foodtruck with your specifications!\nfoodtruck... http://t.co/S8d4nRiLbQ	1421303522	555613358674960384	f	mamuthainoodle
RT @ultraclay: Yesterday's adventure: shooting noodles & deliciousness at @mamuthainoodle. eeeeeats vscocam @ Mamu... http://t.co/slJyc0cm2q	1421262293	555440432839417856	f	mamuthainoodle
RT @aimeelee1207: Thanks for being my friend too, @MamuThai !  http://t.co/DDKWHNFRlb	1421190369	555138761932439553	f	mamuthainoodle
RT @aimeelee1207: Happy to be indoors with this amazing spicy pad Thai from @MamuThai ! Astoria yum http://t.co/RI2pLvNyXV	1420744023	553266649902907393	f	mamuthainoodle
RT @MamuThai: Brrr! Lunch w/us and we'll warm you up! 718-707-0407 seamless ThaiFood nyc queens LIC Astoria delivery	1420735048	553229007207288832	f	mamuthainoodle
It's hot up in our shop! Lunch w/us & you'll feel the heat! Call for delivery 718-707-0407 noodle in your belly seamless nyc queens	1420653251	552885926738001920	f	mamuthainoodle
RT @MamuThai: Feels like Monday but it's Friday! That's cause for celebration! Come by our shop and celebrate w/Thai food! Happy 2015! Call...	1420223233	551082299098664960	f	mamuthainoodle
Happy New Year to all of our friends and fans! If 2014 was any indication, 2015 is gonna be crazy! Be safe tonight, stay warm! NYE2015 nyc	1420053351	550369763382558722	f	mamuthainoodle
Sorry Dumbo, having equipment issues. Had to shut it down early today. :( Have a great weekend.	1419014750	546013553640353792	f	mamuthainoodle
RT @fuelgrannie: celebrate amazing new queens restaurant @MamuThai for insanely fresh thai street food @JoeDiStefano @tastoriaqueens @wehe...	1418321872	543107415122915329	f	mamuthainoodle
Sorry noodle lovers, no truck today. You can visit our shop in Astoria LIC @MamuThai plenty of hot thai dishes to keep you warm. lunch	1418313605	543072737561157632	f	mamuthainoodle
Too much rain! :(	1418137530	542334227271135232	f	mamuthainoodle
@chrissyteigen being a Thai food truck, wish we could've helped out today!	1418002157	541766431256641536	f	mamuthainoodle
So the last day of Schnitzi Truck week,@46 bet 5&6 serving lunch 11:30-3:30 get some cornflakes covered Schnitzi & soup @www.schnitzi.com	1423147130	563346011616464896	f	schnitzi1
Today we @46 st bet 5&6 ave serving lunch from 11:30 until 3:30, see you all soon,order online @www.schnitzi.com get it while it's hot	1423059554	562978690255314944	f	schnitzi1
@abieDweck  I can't send anyone today in this weather	1422984895	562665548212092928	f	schnitzi1
It is cold @46 st but we will serve lunch from 11:30 until 3:15 hope to see you all order online @www.schnitzi.com schnitzi foodtruck	1422971997	562611450485956608	f	schnitzi1
Surprisingly we are out today @Hanover Sq serving lunch from 11-3 get some Schnitzi order online @www.schnitzi.com schnitzitruck schnitzel	1422885929	562250454047137793	f	schnitzi1
We are breaking the ice today @46   bet 5&6 Ave serving lunch from 11:30 until 3:30 order online @www.schnitzi.com	1422543517	560814274504052736	f	schnitzi1
Today we are on 46 bet 5&6 Ave serving lunch from 11:30 until 3:30 order online @www.schnitzi.com	1422457167	560452097599365120	f	schnitzi1
@iamavig I have the truck on roosevelt island I might open here and make some schnitzels for the residents	1422370238	560087492754702337	f	schnitzi1
The truck is off the road today obviously, but we will open our two restaurants later today @1:30 until 1am  @www.schnitzi.com	1422370088	560086863118344193	f	schnitzi1
about deliveries we will make but only in our immediate surrounding in a block or two from the truck @www.schnitzi.com	1422283480	559723601864454145	f	schnitzi1
Ok so today is a little tricky, we are out @Hanover Sq from 11:00 until 3:00 or depends on the snow condition,	1422283437	559723419542233088	f	schnitzi1
our first day of delivery went fine, so today we can deliver or prepare a Takeout for you @www.schnitzi.com,@46 b5&6 from 11:30- 3:30	1421937427	558272148482318337	f	schnitzi1
@abieDweck go to http://t.co/vR5tgBZ41L and do order online I think that 34 & 6 is ok for today	1421855574	557928832905515009	f	schnitzi1
today we are starting deliveries from the truck,we will deliver in our close surrounding areas @46 bet 5&6 from 11:30 3:30@www.schnitzi.com	1421855360	557927938008829952	f	schnitzi1
Ready to serve lunch @46 bet 5&6 Ave starting @11:30 - 3:15 order online @www.schnitzi.com get some schnitzi schnitzitruck	1421767599	557559840726601728	f	schnitzi1
The Schnitzi truck is off the road today so happy Martin Luther King Jr day and we will see you all tomorrow schnitzitruck schnitzel	1421680335	557193829951242240	f	schnitzi1
We will be @46 St between 5&6 serving lunch from 11 until 3 we have to leave early so don't be late order online @www.schnitzi.com	1421334349	555742658107539456	f	schnitzi1
Today we are on 46 b 5&6 Av serving lunch from 11:30 - 3:30 some news for the Schnitzi truck from next week we will start doing deliveries	1421249753	555387837538136066	f	schnitzi1
@46 St bet 5&6 Ave serving lunch from 11:30 until 3:30 order online @www.schnitzi.com, it's good time for chicken Schnitzi schnitzitruck	1421162391	555021411849621504	f	schnitzi1
we will be serving lunch all over town, today we will be @Hanover Sq serving lunch from 11 until 3, order online @www.schnitzi.com	1421072495	554644361141846018	f	schnitzi1
Good morning. Truck open at 51st street and park. Come!!!!	1422531374	560763346593808384	f	carpedonutnyc
Hot fresh donut best way to start your day. Truck open at 25th street and park ave south. Come!!!	1422444816	560400292085530624	f	carpedonutnyc
Hot fresh donuts! Come and see us at Bergen and Court today until 5pm.	1422190184	559332289113776128	f	carpedonutnyc
Come get a hot donut on a snowy day!  We are at Bergen and Court Street until 3pm.	1422105612	558977568351981569	f	carpedonutnyc
Good morning. Truck open at Bergen and Court street. COME!!!!	1421583288	556786783732916224	f	carpedonutnyc
Truck open at Bergen and court street.come!!	1421504303	556455496946040833	f	carpedonutnyc
Good morning. Truck open at 55th street and broadway. Come!!!	1421410736	556063047035650048	f	carpedonutnyc
RT @AceNatural: Love organic apple cider donuts? Looking for a yummy way to start your morning? Catch Ace customer @CarpeDonutNYC at 51st...	1421350196	555809124236394496	f	carpedonutnyc
@morristruck I don't know what's in this sandwich but it sure is delish... Thanks guys! 51streetkrew	1421349299	555805364768497665	f	carpedonutnyc
Good morning. Truck open at 51st street and Park ave. Come!!!!	1421322631	555693509718835200	f	carpedonutnyc
@nykimchi we don't usually do Columbus circle but we'll be at 55 and Broadway on Friday!	1421265906	555455587333718017	f	carpedonutnyc
@nykimchi we're at 23 and park	1421265805	555455163549622272	f	carpedonutnyc
@SaidDoug sounds like a donut emergency! We'll be there tomorrow though so no fear. donutproductivity	1421259371	555428177204772864	f	carpedonutnyc
Truck open At Bergen and court street. Come!!!	1420980660	554259178559381505	f	carpedonutnyc
Open @ Bergen and Court stave off the cold with a hot donut!	1420905714	553944832755113984	f	carpedonutnyc
@AshleyBice @kattmccain @AveryScottD I can feel the fame!	1420841134	553673964422459393	f	carpedonutnyc
Good morning. Truck open at 55th street and Broadway. Come!!!!	1420805972	553526486096171008	f	carpedonutnyc
Good morning. Truck open at 51st street and park ave. Come!!!	1420719661	553164470265344000	f	carpedonutnyc
Get your donuts at 23rd and Park today!	1420633840	552804510536855552	f	carpedonutnyc
Just a reminder ! We are taking your delivery orders from 11:00 am to 4:00 pm  just Visit... http://t.co/L572ZJGKLx	1423256859	563806248991481857	f	palenquefood
Hey New York! Come and try our best food from Colombia to you at @GansMarket	1423063604	562995678084083714	f	palenquefood
Hello neighbors of meat packing district, now you can order online your favorite arepa or soup @deliverydotcom! http://t.co/jVg12NQuIA	1422988021	562678662043303936	f	palenquefood
We do have our homemade gluten free quinoa & multigrain arepa packs, 5 delicious arepas small or large... http://t.co/i24pWk3W6k	1422897824	562300345687494659	f	palenquefood
Today @ Gansevoort market! http://t.co/07jfj6wOL1	1422821712	561981110465601536	f	palenquefood
Yeah yeah we know it's cold outside, that's why we are giving samples of our agua de panela and guava... http://t.co/9la4IX289U	1422732828	561608303017721857	f	palenquefood
Happy customer ! He just got a toro arepa with additional hogado + beans + guacamole! @gansmarket @... http://t.co/13buJh9y61	1422636473	561204160709029888	f	palenquefood
One more time we'll be giving free samples of bocadillo con queso here at @gansmarket come visit us... http://t.co/vOAPTvf5vH	1422552283	560851041739366401	f	palenquefood
Traditional arepa with additional hogado come at @gansmarket and get a try ! colombianfood NYC @... http://t.co/F1JL5o96qP	1422551108	560846114593972227	f	palenquefood
Back in business after the snow  storm !!! Beef & cheese carimanolas here at @gansmarket till... http://t.co/LPY9P7Oo1h	1422463708	560479531094769664	f	palenquefood
Come today to @gansmarket for a delicious Gallo arepa with hogao, before the snow storm gets here!... http://t.co/JRIWStCOsj	1422289289	559747964508581888	f	palenquefood
Arepas, sweet plantain, Ajiaco, lentil soup, caribanolas. We have it all!! Come join us today and try... http://t.co/JXwncAOZh5	1422116944	559025098615967744	f	palenquefood
Come visit us and get the most delirious colombianfood in NYC we are 7 days a week here in... http://t.co/QSbTes7HQq	1422046426	558729323537260544	f	palenquefood
Fritando platano maduro! Sweet plantain para fooda catering! :) http://t.co/FtVvDXqDi5	1422020875	558622156855455744	f	palenquefood
Guava paste & cheese a.k.a bocadillo con queso! We are giving free samples NOW at @gansmarket come and... http://t.co/VgODB4gUYf	1421953414	558339206721044480	f	palenquefood
Palenque Gansevoort menu! Meat packing district http://t.co/ZSyiedC1US	1421871452	557995432148992000	f	palenquefood
The classic sweet corn arepa a.k.a choclo here at @gansmarket NYC @ Gansevoort Market http://t.co/RwQEgnsu7A	1421859075	557943516245295105	f	palenquefood
Lentils soup, and our delicious carimanolas a.k.a caribanolas chipotle & cilantro salsa come and get... http://t.co/YIjmtXueSG	1421778343	557604903926128640	f	palenquefood
Nothing better than an Ajiaco for this wether ! Come visit us at @gansmarket @ Gansevoort Market http://t.co/3TYL8j5Tki	1421694102	557251572535947264	f	palenquefood
@gansmarket new menu! Come to have arepas, soups and empanadas from Palenque 52 Gansevoort http://t.co/fOGmx5Kccw	1421692800	557246108356063233	f	palenquefood
Fries are ready! @govballnyc GovBallEEEEEATS http://t.co/b4u6m5clvZ	1402176073	475387025454280704	f	goburger
RT @GovBallNYC: @GOBurger GovBallEeeeeats	1402175930	475386426239250432	f	goburger
Welcome to VIP @govballnyc govballnyc http://t.co/Nf5AVVFsJv	1402174356	475379823721054208	f	goburger
@JustinKopesky we will definitely refund you for the burger order. Please reach out to devorah at e2hospitality dot com and she'll handle.	1399914669	465902009078800384	f	goburger
We're on 91st and Amsterdam for dinner tonight. See you soon!	1398896034	461629544118894592	f	goburger
Rain, Rain, Go Away! We're on Varick and Vandam today!	1398873138	461533510680186880	f	goburger
Dear UWS, see you at 76th and Broadway for dinner. I'll be the one in the truck.	1398806868	461255556175781889	f	goburger
Good news for our Flatiron friends - we'll be on 20th and 5th this afternoon!	1398783044	461155628883644417	f	goburger
Wish you were here...with us for dinner on Broadway between 88th and 89th. http://t.co/Dsg1xfyzbP	1398719730	460890072783798272	f	goburger
It's a beautiful day for a burger and fries! Let us prove it - come to 27th and Park and meet us!	1398699737	460806215753138176	f	goburger
Happy Weekend! Celebrate with burgers at 69th and broadway!	1398528954	460089900059357185	f	goburger
Lunch today will be served at 25th and 6th Ave.	1398439580	459715035410227200	f	goburger
Dinner time! Hit us up at 76th and Broadway!	1398379250	459461993347305472	f	goburger
And we're back on 27th and Park for lunch!	1398356559	459366820882186240	f	goburger
@colettesny right back attcha	1398271666	459010753945960448	f	goburger
RT @colettesny: I love Go Burger!!!! http://t.co/ILBO6UkJ5f	1398271656	459010711453446146	f	goburger
Happy Hump Day!! Celebrate with a burger on Varick and Vandam!	1398267380	458992776466948096	f	goburger
@chelseymary by special request :) RT @GOBurger: Hello Upper West Side! We've moved to 88th and Broadway for dinner!	1398202520	458720734802878464	f	goburger
Hello Upper West Side! We've moved to 88th and Broadway for dinner!	1398202486	458720592602996736	f	goburger
Truth. Just awoke from hibernation but will be back over there! MT @quarropas it's been a while I think since you have been in midtown west.	1398180649	458629000668401664	f	goburger
Scream it from rooftops the its CHEESESTEAK FRIDAY! 56th st/ Bdwy @randomfoodtruck @VictoriasSecret @UMGSA @Barclays @YRNY GOT WHIZ?	1423233352	563707651775680512	f	carlssteaks
YScream it from rooftops the its CHEESESTEAK FRIDAY! 56th st/ Bdwy @randomfoodtruck @VictoriasSecret @UMGSA @Barclays @YRNY GOT WHIZ?	1423233304	563707452206891009	f	carlssteaks
Home sweet home 49th st bet 6 /7th av till 3 30 @SiriusXMNFL @jimmyfallon @MHFI @Barclays @SIRIUSXM stay warm w Carls Cheesesteak GOT WHIZ?	1423151022	563362337454030849	f	carlssteaks
Happy Hump day 47th st & Park Av perfect cheesesteak weather@nfl @MLB @UBS @SiriusXMNFL @jimmyfallon GOT WHIZ? http://t.co/1dRhiGa75c	1423066881	563009423648759808	f	carlssteaks
Happy Hump day 47th st & Park Av perfect cheesesteak weather@nfl @MLB @UBS @SiriusXMNFL @jimmyfallon GOT WHIZ? http://t.co/aJFObkRJuP	1423066834	563009225946071040	f	carlssteaks
Back in brooklyn! We missed you  @DUMBOFOODTRUCKS jay st & water servin up our classics try our new buffalo chicken cheesesteak! GOT WHIZ?	1422981449	562651094862798849	f	carlssteaks
Super Bowl hangover? Perfect cure a Carl's famous Cheesesteak will fix you right up! @wfan @BoomerandCarton... http://t.co/DJBzNfVmPo	1422889172	562264057672400896	f	carlssteaks
Super Bowl hangover? Perfect cure a Carl's famous Cheesesteak will fix you right up! @wfan @BoomerandCarton @mediadata Hudson st & king st	1422889121	562263845356724224	f	carlssteaks
Lookin for last min Super Bowl plans? We will be serving up our famous Cheesesteaks @RoyalPalmsClub in brooklyn we added wings for big game!	1422722552	561565202312073216	f	carlssteaks
U know the drill !Scream it from rooftops its CHEESESTEAK FRIDAY 55TH st/ Bwy @randomfoodtruck @VictoriasSecret @UMGSA @YRNY @UBS @Barclays	1422632813	561188811158597632	f	carlssteaks
Another cold day folksNothing that a piping hot Carls famous Cheesesteak cant cure 48thst bw 6/7th... http://t.co/klfJTldvXv	1422543529	560814328384086018	f	carlssteaks
Another cold day folksNothing that a piping hot Carls famous Cheesesteak cant cure 48thst bw 6/7th  @SiriusXMNFL@SIRIUSXM @FoxNews @Barclays	1422543484	560814138650554369	f	carlssteaks
Welcome back looks like we all survived!Stay warm w a Carls famous Cheesesteak 47th st & Park Av @MLB @SiriusXMNFL @JPMorganChase GOT WHIZ?	1422458862	560459207666044928	f	carlssteaks
@RealMichaelKay looks like @DonLagreca may be right NFL just announced zero in on pats locker room attendant Poor guy is gonna take the fall	1422308718	559829458698665984	f	carlssteaks
@mwurst @360i thanks for the love!!! See you guys soon and RIP our old Murray Hill spot lol	1422299433	559790512719540224	f	carlssteaks
Ok folks LAST CHANCE till Wednesday to grab a Carl's famous Cheesesteak  before storm of the century hits NYC!Hudson st & king st GOT WHIZ?	1422287368	559739907628097537	f	carlssteaks
We love sunshine!!! Sundays and a Carl's famous Cheesesteak PERFECT MATCH \nUnion Sq West /17th St till 7 GOT WHIZ? http://t.co/95WWbiuRwo	1422204902	559394023484698624	f	carlssteaks
We love sunshine!!! Sundays and a Carl's famous Cheesesteak PERFECT MATCH \nUnion Sq West /17th St till 7 GOT WHIZ? http://t.co/q7XOoMCGik	1422204848	559393795771731970	f	carlssteaks
You know the drill Scream it from the rooftops CHEESESTEAK FRIDAY 56th & Bdwy  @randomfoodtruck @VictoriasSecret @DefJamRecords @UBS @YRNY	1422024097	558635669229416449	f	carlssteaks
Happy Thursday  folks lovin the short week!! 48th st bet 6 / 7th av @SiriusXMNFL @jimmyfallon @Barclays @UBS @FoxNews @MHBusiness GOT WHIZ?	1421940004	558282958717861888	f	carlssteaks
mornin 47st Last chance for mac n' cheese for a while. Lobster on the menu. Hope to see my macheads 1 more time today http://t.co/Cbh78C4G0y	1422282128	559717929349300225	f	mactruckny
RT @JonathanBenno: Please checkout my good friend @LaunchBySY kickstarter. http://t.co/2B9QGQslpY I pledged now you should.	1422239234	559538021901422593	f	mactruckny
Good morning 47st!! Between park and lex till 2	1421937779	558273627083538432	f	mactruckny
Whats Good 47st!!! Between park and lex for lunch today till 2pm 	1421763591	557543029398306817	f	mactruckny
Good morning 47st!!! Between park and lex till 2pm  cheesing	1421330176	555725154199023616	f	mactruckny
Good morning 47st!! Between Park and Lex till 2pm	1419859337	549556010634203136	f	mactruckny
Good morning 47st!! Between Park and lex till 2pm 	1419250356	547001755654164480	f	mactruckny
Good morning 47st!! Between park and lex till 2pm	1418825353	545219166102626304	f	mactruckny
Check out my buddies awesome kickstarter campaign, which i make a cameo in  and show some love!!  http://t.co/Pz9n9lIVxm	1417477240	539564771990065152	f	mactruckny
Good morning seaport, fulton and south st. 12-3	1416414342	535106654455746561	f	mactruckny
Fulton and south st 12-3	1415982867	533296914901794817	f	mactruckny
Fulton st. And south st. 12-3	1415809679	532570511902261248	f	mactruckny
12-3 fulton and south st.	1415378850	530763486385942528	f	mactruckny
Good morning seaport, fulton and south st. 12-3	1415196377	529998137927434240	f	mactruckny
@ashleyles_ hahaa... I actually received 365 coupons for free chips  i was hoping for a big truck filled with chips to show up at my house.	1415111064	529640307978436609	f	mactruckny
RT @hungrybeeny: A delicious combo: pulled pork with mac n cheese @mactruckny @TheSeaport http://t.co/be6kkgqWz3	1414770811	528213182947811328	f	mactruckny
Happy halloween seaport!!!  fulton and south st 12-3	1414764430	528186422411677696	f	mactruckny
Seaport fulton & south st. 12-3	1414598154	527489008969216001	f	mactruckny
RT @JustJerseyFest: @mactruckny everything Mac & Cheese Just Jersey Jazz and Food Truck Festival Horseshoe Lake Succasunna NJ http://t.co/6...	1414182833	525747026395693056	f	mactruckny
RT @jmscrabble: Getting my Mac n cheese on at @mactruckny justjerseyjazzfest http://t.co/UiOEH5HynP	1414182809	525746925812076544	f	mactruckny
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
Thank you @dumbolot @DUMBOFoodTrucks for our welcome in Dumbo !!! Sold out early, hopefully we can come back soon !	1412807534	519978601660571648	f	funbunsnyc
@ohtruth If we find it well contact you	1412807436	519978193881931777	f	funbunsnyc
@ohtruth I'm sorry but we did not find your card.	1412807170	519977075382706176	f	funbunsnyc
Parked @DUMBOFoodTrucks in the lot on\nJay st / water st Brooklyn till 230pm http://t.co/4Wur1ywIBE	1412781784	519870598856859648	f	funbunsnyc
RT @dumbolot: Sorry @DomoTaco won't be joining us today. Instead we got the @funbunsnyc cart joining us for mad fun bun!	1412780139	519863700954836993	f	funbunsnyc
@The_Levich yesssss	1412351079	518064090582093824	f	funbunsnyc
Thanks to nicolescherzinger for stopping by http://t.co/8I6vGTbADC \n50th st between 6 / 7 ave midtown lunch . FREE Tea egg with any rice	1412349560	518057723506982912	f	funbunsnyc
How would you feel about a food truck serving only kids cereals, that Saturday morning cartoons playing on loop, let us know at 17th and 5th	1423157176	563388148018053121	f	nautimobile
23rd and Park today! This spot isn't easy to get, but we did it.. For you!!	1423069747	563021444293345281	f	nautimobile
What a bunch of DUMBOs. Eh? DUMBO lot until 3!	1422637170	561207083358748674	f	nautimobile
Impress your friends on Super Bowl Sunday, give 'em Lobster. Check this out.. http://t.co/KoE4ZoHr5y	1422573694	560940848545034240	f	nautimobile
Infront of the Apple Store on 67th and Bway today, celebrating Tim Cook's 200% raise he gave himself in 2014!	1422204011	559390283008577536	f	nautimobile
Taking tomorrow off, this weather looks nasty. We're gonna spend the day indoors. Movie suggestions?	1422063809	558802236273590272	f	nautimobile
17th and 5th today, come to chat, jabber, spin some yarn etc.	1421943831	558299010797436928	f	nautimobile
Check out this silly candy wrapper. 23rd and Park today. http://t.co/NhekFBj0Tu	1421853912	557921862634962944	f	nautimobile
It's a little rainy, but that's ok, we have umbrellas. 67th and Broadway	1421600309	556858174519922689	f	nautimobile
@biggayicecream pretty good. How are you?	1421456434	556254719862407169	f	nautimobile
Today's teammate spotlight is on Mike M. Fun fact: he is Luke's Lobster's most handsome boy! Come see him at the DUMBO lot in Brooklyn now!	1421427097	556131671167488000	f	nautimobile
Our featured teammate today is Katie J! She really loves kickboxing and kale! She's making rolls here, at 17th and 5th	1421345664	555790117512945665	f	nautimobile
True love can be found at 23rd and Park today. If not with a stranger, with a lobster roll.	1421254147	555406268320714752	f	nautimobile
Lets try this again. 67th and Broadway!	1420993184	554311708169498625	f	nautimobile
We got kicked out of our 67th street spot so calling it a day 	1420917376	553993745218412545	f	nautimobile
Just horsin' around in the DUMBO lot, Jay and Water st.	1420820621	553587925586550784	f	nautimobile
RT @michaelwhuang11: A revisit today to get the best lobster roll from @NautiMobile on 5th ave, nyc!! http://t.co/3yzggszYaW	1420768482	553369237793046530	f	nautimobile
This polar vortex is just a test of mettle. We are out here at 17th and 5th for you.	1420736443	553234857246355459	f	nautimobile
Congrats to Americas new power couple, Benji of Good Charlotte and Cameron Diaz of Shrek 2. 23rd and park to celebrate.	1420651830	552879966401363969	f	nautimobile
In case you wanted a centralized place for our entire weekly schedule, it is here : http://t.co/BBujx1TiFj  , we made it for you!	1420559144	552491211815387137	f	nautimobile
Kasar truck is at union square\nBroadway and 16th street\nAll day until 8pm	1407255461	496691523397103617	f	chipsykingny
Kasar truck is at Broadway and 56th street all day until 7pm	1407171379	496338854430146560	f	chipsykingny
Kasar truck is in Soho, broadway and spring street. All day until 7pm	1407078076	495947513867022336	f	chipsykingny
Kasar truck is in Soho, Broadway and spring street until 8pm.	1406991756	495585462338478080	f	chipsykingny
Kasar truck is at 46th and 6th until 6 pm	1406739254	494526391250341888	f	chipsykingny
Kasar truck is at Union square and 16th street \nJoin us!!!	1406638650	494104430279925760	f	chipsykingny
Kasar truck is at 46th street and 6th avenue all day until 8pm. Happy Friday !!!	1406294528	492661074727297024	f	chipsykingny
Kasar truck is at 52nd street and 6th avenue until 6 pm	1405524386	489430866859675649	f	chipsykingny
Kasar truck is in soho, broadway and spring street until 6 pm, join us	1405264800	488342084408324096	f	chipsykingny
Kasar truck is in Soho, broadway and spring street until 8pm	1405180332	487987801708068865	f	chipsykingny
Kasar truck is at 55th and Broadway until 6pm	1405010701	487276314823778304	f	chipsykingny
Kasar truck is at park avenue and 47th street, until 6 pm	1404829973	486518286033887232	f	chipsykingny
Kasar truck is at 46th street and 6th avenue. Until 6 pm	1404738529	486134742988120064	f	chipsykingny
Kasar truck is at park avenue and 47th street, all day until 6pm	1404219615	483958258550718464	f	chipsykingny
Kasar truck is at 46th street and 6th avenue, until 6pm. Join us	1404137751	483614896379400193	f	chipsykingny
Kasar truck is in Soho, broadway and spring street, until 8pm.	1403972755	482922855685160962	f	chipsykingny
Kasar truck is at 47th and park avenue. Until 5:30. Happy Friday!!!!	1403880466	482535766141460480	f	chipsykingny
Kasar truck is at 46th street and 6th avenue. All day until 6pm.	1403699258	481775727042654208	f	chipsykingny
Kasar truck is at broadway and 55th street, until 6pm	1403625146	481464876330909697	f	chipsykingny
Kasar truck is at 46th street and 6th avenue until 6pm.	1403544496	481126604287250432	f	chipsykingny
@stefferonipizza you definitely need some Ponti Rossi in your life again :) we'll be back soon with tons a surprises. Keep in touch 	1422700386	561472232585981952	f	pontirossifood
Ponti Rossi would like to thank @momentoitaliano for the sponsorship. This spring we'll be serving the finest Italian coffe in town! Grazie	1422023585	558633523557707776	f	pontirossifood
RT @OrlandoFoods: Amazing competitors in the Neapolitan category! caputocup caputocupUSA http://t.co/2x9B5qF9SD	1421907761	558147721283256320	f	pontirossifood
Ponti Rossi would like to wish everyone a happy new year ! Looking forward to hitting the streets of NYC this upcoming spring. Ciao belli 	1420027586	550261695831371776	f	pontirossifood
Check us out in Food Truck Magazine. Looking forward to hitting the streets again in spring!! pontirossifood http://t.co/Zocla1GEKP	1416849875	536933412519821312	f	pontirossifood
Hello Midtown! Today we serving lunch on 47th st btw park and lex. Call in for orders 347-506-9616 	1412862491	520209108381995008	f	pontirossifood
@Foodtruckgirl7 @DiSOSNYC and pasta 	1412771324	519826726164381697	f	pontirossifood
Hello Midtown don't forget to pass by to get our authentic italian food. 1130 to 3pm. 47th st and park. 6466447932 http://t.co/iOtOop8Tzw	1412690055	519485862649004032	f	pontirossifood
Water and Old slip. We back in Wall Street. Today we will be serving only panini from 11:30 to 3pm. We sorry for inconvenience.	1412347594	518049474980360192	f	pontirossifood
RT @Foodtruckgirl7: I see we have @Valduccis @TheSeaport. Hanover/oldslip @fritesnmeats @PontiRossiFood @DomoTaco @desiexpressnyc that I sp...	1412338495	518011311201222656	f	pontirossifood
@stefferonipizza grazie mille Stefania, We glad you enjoy our food so much.It's always a pleasure!Ps la foto e' fantastica!See you soon 	1412287469	517797294620827648	f	pontirossifood
RT @stefferonipizza: NYC, do yourself a favor and track down the @PontiRossiFood truck. it'll make your day. and week. and life. http://t....	1412287405	517797024864169984	f	pontirossifood
Today we serving lunch on 47th St and Park ave. Zesty Italian Food made by italians. Call in for orders 347-506-9616 http://t.co/3vWgb6aYXX	1412254835	517660415430778880	f	pontirossifood
We apologize but today we have a technical issue that won't let us feed you guys. We will be back tomorrow. Stay tuned	1412177710	517336928228999168	f	pontirossifood
RT @jzohny: You guys, it's almost lunchtime ... MT @PontiRossiFood: Today we're back in midtown! http://t.co/VK9dp19hwe	1412092643	516980132125614080	f	pontirossifood
Today we back in midtown. Come Get a panino and taste our delicious complimentary salad! pontirossiNYC  http://t.co/zA7gdWJGft	1412087532	516958696816279552	f	pontirossifood
RT @Foodtruckgirl7: @PontiRossiFood is like having access 2 great authentic Sunday sauce everyday nycfoodtruck @nystfood @EAT_GOOD_FOOD_ h...	1412036632	516745204016361472	f	pontirossifood
RT @Foodtruckgirl7: @PontiRossiFood is like having access 2 great authentic Sunday sauce everyday nycfoodtruck italianfood pasta eats h...	1412036608	516745103554408448	f	pontirossifood
RT @Foodtruckgirl7: lunch time choice headed 2 @PontiRossiFood I am currently In heaven w/there Bolognese nycfood nycfoodtruck http://t.c...	1412013169	516646795750174720	f	pontirossifood
@Foodtruckgirl7 I used to wear a T-shirt that said ''I am gonna be  on a diet next Monday '' lol pontirossiNYC foodtrucklove pasta	1411997064	516579246639435776	f	pontirossifood
Thanks for a great week NYC have a great weekend see you Monday	1423252825	563789330007609344	f	hibachiheaven
Good morning NYC we are on 46  & 6 from 11:00 to 2:30	1423229862	563693015533768704	f	hibachiheaven
RT @LinzyPiinzy: http://t.co/dOWiRc2qny	1423058207	562973041945501696	f	hibachiheaven
Hey NYC we are parked on the corner of 5th Ave and W 21st ST. Open 11:00 to 2:30 come get your yumyum	1423055781	562962868212346880	f	hibachiheaven
Good morning midtown we are on 46th St. between 5th & 6th ave. Open 11:00 to 3:00	1422964989	562582057956560896	f	hibachiheaven
RT @sugarcookiiee: The start to a good weekend yumyum @hibachiheaven http://t.co/etLEcC0tQd	1422683805	561402685187190784	f	hibachiheaven
RT @priyamagarwal: @hibachiheaven Steve, the best tofu , veggie and rice guy in new york city!	1422654468	561279638455222272	f	hibachiheaven
Happy TGIF New York come get some hibachi on 46st between 5th and 6th Ave.       Don't forget the yumyum	1422621705	561142219449835520	f	hibachiheaven
RT @njlauritawinery: Valentine's Day is right around the corner!!\n\nIf you're looking for something awesome to do, Laurita's got you... http...	1422561936	560891532761636864	f	hibachiheaven
Good morning NYC we are on the corner of Varick and King come get your yumyum	1422542844	560811452249149440	f	hibachiheaven
Good morning FIDI We are on the corner of water and old slip today 11:00 to 2:00	1422277107	559696870629707776	f	hibachiheaven
We are open and ready to rock	1422031349	558666086343008257	f	hibachiheaven
Happy Friday @midtownlunch we are on 46th between 5th & 6th from 11:00 to 2:30. Beat the cold and get your yumyum on.	1422018417	558611848439005184	f	hibachiheaven
Good morning NYC we are in the corner of Varick and King serving your favorite lunch at hibachiheaven	1421931036	558245346321899521	f	hibachiheaven
Totally forgot had a catering party here today next Wednesday definitely will be there where are you located	1421862116	557956273392844800	f	hibachiheaven
@audreyp77 we are on water & old slip on Mondays	1421851763	557912847574122497	f	hibachiheaven
@hibachiheaven: @midtownlunch we are on 47th and park today. Come down get ur yumyum on. Open 11:00 to 3:00	1421850568	557907838593662976	f	hibachiheaven
RT @mactruckny: Whats Good 47st!!! Between park and lex for lunch today till 2pm 	1421763994	557544719937728512	f	hibachiheaven
@hibachiheaven: Good morning midtown we are on 46th St. between 5th & 6th ave. Open 11:00 to 3:00	1421763346	557541999923171328	f	hibachiheaven
RT @njlauritawinery: February 21 & 22, join us for LauritaIceFest!  Get all the details and tickets here, http://t.co/PDR4kh9tyO	1421707008	557305703363526656	f	hibachiheaven
Braised Beef Borito - Angus Brisket, Black Beans, Manchego Cheese and Siriacha Mole Sauce http://t.co/MgXZNmelWH	1403394007	480495409945923584	f	mikenwillies
Stay tuned, big and exciting changes coming our way...	1403381976	480444949012705281	f	mikenwillies
Big and exciting changes coming our way.  Stay tuned for the big reveal...	1403381850	480444418752004096	f	mikenwillies
Happy Monday!!!! A little late start due to a flat tire but we'll be open and ready to serve 2:15-8pm south... http://t.co/cDUv67RuyV	1402940145	478591772663107585	f	mikenwillies
Hello DUMBO beautiful weather for worldcup outdoor viewing @RooftopFilms @DUMBOBID Anchorage Pl and Water Street till 8pm	1402765766	477860374549504001	f	mikenwillies
RT @Sweet_Taters: Congratulations @call_me_symone! You win the $100 Trade Joe's gift for sharing your sweetsonthestreet at @mikenwillies! ...	1402754454	477812928708493312	f	mikenwillies
@blusfynx @TribecaTaco thanks for your feedback	1402694379	477560957799890944	f	mikenwillies
Friday the 13th!!! We're not scared of a little rain, we are scared of not ending the week with a full belly... http://t.co/CLuSsEoUEC	1402670743	477461820211331072	f	mikenwillies
Happy Taco Tuesday!! South st seaport Front St. & Fulton St 12-8 ComeGetSome	1402414859	476388565639630848	f	mikenwillies
Beautiful day to end the week were at the seaport today Water St & Fulton St 12-8	1402069809	474941322055647233	f	mikenwillies
RT @Sweet_Taters: Celebrate the gorgeous day w/ @mikenwillies Sweet Potato Shroom Taco at Front St & Old Slip, tweet a pic & you could win ...	1401822600	473904452261666818	f	mikenwillies
Beautiful day!!! FIDI today Front St and Old Slip slinging your favorite Tacos, Sliders, Burritos and Rice Bowls comegetsome	1401807479	473841028777009153	f	mikenwillies
Beautiful Day at Liberty State Park for vcpoloclassic @veuveclicquot   http://t.co/PYueUEw7XW http://t.co/Mr6xw2Vs8v	1401546007	472744336728535040	f	mikenwillies
RT @asphaltpunk: Big Bad Brisket and Lil Piggies from @mikenwillies - had to sneak out of BEA14 for these yummy sliders! http://t.co/vvW1W...	1401471595	472432229122322432	f	mikenwillies
RT @randomfoodtruck: Lunch at the office from @Chefsamirtruck @souvlakitruck @carlssteaks @CarpeDonutNYC @funbunsnyc and at Javits from @mi...	1401471548	472432032249704448	f	mikenwillies
RT @Sweet_Taters: Grab your Sweet Potato Shroom Taco at @mikenwillies at the @javitscenter today! Tweet a pic & you could win a $100 GC sw...	1401395649	472113686904340482	f	mikenwillies
We're at the @javitscenter today for the  @BookExpoAmerica with your favorites characters BigbadBrisket lilPiggie Pea-Nocchio	1401374548	472025186091278336	f	mikenwillies
RT @GovIslandFood: Only 2 more days till we are back @Gov_Island with @SweetChiliNYC, @DiSOSNYC, @carlssteaks, @Getstuffednow, @MayhemAndSt...	1401368180	471998474871767040	f	mikenwillies
Thinking of those that have made the ultimate sacrifice for our country on this Memorial Day.  Thank you to all... http://t.co/gMrpRYtn7v	1401117086	470945310189957121	f	mikenwillies
RT @Downtownmag: Josh Gatewood is the most interesting man downtown! See his story & check out his awesome food truck! http://t.co/x5EVhgb...	1423252261	563786962247905280	f	usafoodtruck
Guess who is Downtown's Most Interesting Man: http://t.co/jxpZbAZnrd.  Gotta respect their taste.  flattered nyc usafoodtruck	1423246297	563761949436280832	f	usafoodtruck
@JJGamecock4ever @SECfootball But I'll always love the Gamecocks :)...not quite as much as the Vols though.	1422987197	562675206024880132	f	usafoodtruck
@JJGamecock4ever @SECfootball such a hater Jade!  I'm doing a program with Stanford's b-school so now I have a 3rd program in my heart :)	1422987153	562675022209495040	f	usafoodtruck
@vtina_os that's the worst tweet ever.	1422773571	561779190601498624	f	usafoodtruck
Free chicken for this guy: http://t.co/Nljj7ZpolS	1422767634	561754290679992321	f	usafoodtruck
This guy eats at Yankee Doodle Dandy's: http://t.co/jNrjGfH5iY\nletfreedomring usa murica NYC	1422568253	560918025290129409	f	usafoodtruck
Since we're off the streets today and you probably need some America in your life....here ya go: https://t.co/RCaK0de3Nm SonsOfLiberty NYC	1422550561	560843820641038336	f	usafoodtruck
What did you call me Hank?!?!?  (I own a fried chicken food truck) https://t.co/NTbbuknEwO	1422500816	560635176448188416	f	usafoodtruck
Since the weathers bad we're off the streets, but at least we've got appropriate entertainment: http://t.co/sOvlmdUHMN  SonsOfLiberty USA	1422485292	560570064127401984	f	usafoodtruck
I just had a great video conference using @BlueJeansNet with the Stanford Ignite program!  Sounds good.	1422320427	559878567950290944	f	usafoodtruck
Food truck biz in the winter in the north is tough.  Off the streets for a few days y'all.  Sorry to deprive you of the best in the city	1422132414	559089983144067073	f	usafoodtruck
@NewYorker gonna add Yankee Doodle dandy's to that list eventually.  K thx. nyc merica	1422034638	558679884323913728	f	usafoodtruck
RT @NewYorker: Chipotle & Shake Shack have changed peoples expectations of what fast food can be. James Surowiecki on fast-casual http:/...	1422034613	558679779164307457	f	usafoodtruck
RT @FoodtoEat: Fulton St & South St is where @USAFoodTruck, the golden gem for American Noms! Preorder online for pickup: http://t.co/fB9O...	1422034451	558679099758379011	f	usafoodtruck
@Downtownmag y'all coming to the seaport to meet up today?	1422029239	558657238806839296	f	usafoodtruck
Bout that time.  Chicken time.  4.5 stars on yelp cannot be lying to ya!  We're at Fulton and south st with the best stuff in the city.	1422027645	558650552167706624	f	usafoodtruck
It's chicken time in NYC. We're at Fulton and South Street we'll be chicken slanging from 12 until 5 with that all American godliness NYC	1421942391	558292971200970753	f	usafoodtruck
RT @EatStTweet: .@Jon_Favreau is taking his movie-inspired food truck on the road http://t.co/tZZuRvM2h7 http://t.co/iKBG71Hvgk	1421905969	558140205979664384	f	usafoodtruck
The Founding Fathers were younger than you think: http://t.co/3UCrTYe422\nThomas Jefferson was only 33 in 1776.  Alexander Hamilton was 21!	1421876281	558015683616063488	f	usafoodtruck
Derek visits Toast Monster! Read all about it here:\nhttp://t.co/mKtjKxTL89	1421696789	557262841728602112	f	toastmonsternyc
Toast Monster New York is making music, film, video games. Visit Toast Monster in Korea for your toasted Sammie fix. http://t.co/QrzGgWwgvB	1421109128	554798013223559168	f	toastmonsternyc
thewindblows thecloudshowl thetumbleweedrolls peaceismakingway	1420545818	552435320185421824	f	toastmonsternyc
Thank you to you who bring bread to make toast. Both the same difference in this land. \nTis as far as I can reach. I submit to your defeat.	1420374830	551718142347862016	f	toastmonsternyc
Happy new year @gofooda !	1420095743	550547567374000129	f	toastmonsternyc
Herro New York @gofooda friends family. Thank you for blessing Toast Monster with your support. Hope you have a toastie holiday. Rawr.	1419367750	547494142264483840	f	toastmonsternyc
Ten.	1418358672	543261762296889344	f	toastmonsternyc
@gofooda 	1417825512	541025529722580992	f	toastmonsternyc
Hi! @pennydunk. At the moment we only take catering request.	1416862291	536985488029405184	f	toastmonsternyc
Hi! @atane @alissanichole. Yes, we are still in NYC. Now taking catering request for the winter season. Follow us for updates!	1416528186	535584148560560128	f	toastmonsternyc
Attn: We now carry string beans! You are not dreaming. Unless you're having our string beans then you are currently living the dream. Rarw.	1416294194	534602716694478848	f	toastmonsternyc
To make awesome freak'n sammiches we start with two slices of buttered texastoast toastmonster... http://t.co/yx77wrbv1z	1416274026	534518122963681280	f	toastmonsternyc
Thank you for a great week @gofooda. We enjoyed the sites. Rawrs. http://t.co/zHathS5lVB	1415979548	533282994375892992	f	toastmonsternyc
Great show happening here: http://t.co/HfOEeCbxvH.  Check it out now thru Nov. 22 @SoS_NYC	1415231326	530144724053536768	f	toastmonsternyc
happy halloween chickenpizzaiola sammie turns into steakandpotatoes photoshop costume... http://t.co/zojS8nAGHn	1414814927	528398220599103488	f	toastmonsternyc
Thanks for sharing this awesome Vimeo video Preston. \n\nhttp://t.co/goMMUnPbbh	1414812440	528387789864574976	f	toastmonsternyc
You can catch Toast Monster at our next Toast Monster popup event. Location: refer to photo for clue. http://t.co/Rsxt2rSuwY	1414558022	527320680728383488	f	toastmonsternyc
Herros wholewideworlds @toastmonster_kr is here! Rawrs! http://t.co/5msUmkFUuP	1414124729	525503319348097024	f	toastmonsternyc
Hi toastmonster peeps and wholewideworld. @kaijudon is taking over. Spot and footage Toast Monster on the bright side of the moon.	1414032376	525115962794999808	f	toastmonsternyc
teamtoastmonster rawr http://t.co/wCOKW8sWyr	1413774248	524033294892290048	f	toastmonsternyc
RT @Soulspazm: We must live together as brothers or perish together as fools.-remembering a great man, happy MartinLutherKingDay http://...	1421686372	557219149446119425	f	philssteaks
Merry Christmas all, look fwd to seeing you in 2015!!	1419525947	548157671837548545	f	philssteaks
RT @Gothamist: Can One Twitter Account Turn Part Of Williamsburg Into West Bedford? http://t.co/SZcXyRjnHH	1417848614	541122424558084097	f	philssteaks
@adamkuban those guys stole are branding and all our spots!  And they're DEFINITELY NOT from Philly!  We'll be back on the road come spring!	1417745475	540689830234320898	f	philssteaks
RT @Eagles: When you have family like EaglesNation, it's never lonely at the top. \n\nStandingsOnly FlyEaglesFly http://t.co/PrSXCppONE	1417145604	538173789054722048	f	philssteaks
Sexy steaks will be back in the spring!	1416530092	535592144485240832	f	philssteaks
@whokickedit took the jawn off the road for the winter. Back out April 1 when our permit renews. sadbuttrue	1416518949	535545406533677056	f	philssteaks
RT @DonDraperSCP: Well Monika @Infiernosa, I love @PhilsSteaks ..but @RachelMenkenNY can tell us more about the FoodTruck scene in Lower ...	1415384831	530788570735591425	f	philssteaks
Big ups to our friends @MassAppeal go support that Run The Jewels 2 album!! http://t.co/M1fSEN1OlB	1415205669	530037110909448192	f	philssteaks
RT @FoodtoEat: End Friday with some cheesesteaks from @PhilsSteaks ! Preorder online for easy pickup: http://t.co/CSORWuZxx2	1414776723	528237979970850817	f	philssteaks
Lunchtime is cheesesteak time! Come get your last Phil of the year before we tuck the jawn away for winter. 41st n 6th til 2!	1414769809	528208982536888320	f	philssteaks
RT @seanpaul_008: @PhilsSteaks love you too and thank you very much.looking forward to the spring time.	1414762086	528176589365055489	f	philssteaks
RT @BlueSkyFilmz: @PhilsSteaks I gotta keep your tricks intact, cus I walk like a pimp and talk like a mac gamerecognizegame word cash...	1414762080	528176561774940161	f	philssteaks
Happy Halloween! It's our last day out until April so come grab your last Phil's of the year! 41st between 6th n BWay 11-2. Boo!	1414761089	528172406222098432	f	philssteaks
We love our loyal customers at 52nd and 6th! So sorry to be leaving for the winter. Thanks for making it a great 2014. See you in spring!	1414698100	527908211702390784	f	philssteaks
RT @_E_J_: @PhilsSteaks @FRuSH_NY love their food truck	1414693367	527888359273009152	f	philssteaks
RT @darnstei: @PhilsSteaks - Goodbye for now.... Until April. getyourphil Cheesesteak nom FoodTruck http://t.co/hELaXJ9We2	1414693362	527888339366850560	f	philssteaks
@BlueSkyFilmz young pimps is sterile when I pimp through your borough in...\ngamerecognizegame	1414693355	527888308605812737	f	philssteaks
RT @BlueSkyFilmz: @PhilsSteaks rockin' cashmerethoughts JayZ Ghetto's Errol Flynn, I'm hot like heroin NYC	1414693200	527887660984311809	f	philssteaks
RT @justyniak: Today on 52nd & 6th ! My favorite phillycheesesteak in NYC ! Great seeing you, guys @PhilsSteaks !... http://t.co/XxnT4BwZ8f	1414693193	527887632379150338	f	philssteaks
Get over to 51st & Mad before 230 for the most comforting of comfort foods! Top10 http://t.co/HLEgMzyruk meltedcheese &gt; winter	1423160930	563403893410119680	f	morristruck
Unfortunately the cart will not be out @DowntownBklyn MetroTech today, but truck is at it's usual spot on 51st near Madison! EATCheese	1423153633	563373287485743104	f	morristruck
Find all the comforts you've been craving tonight @RoyalPalmsClub with the winning combo of grilled cheese and shuffleboard! win win	1423088363	563099525444034561	f	morristruck
You all already knew this, but the brilliant folks @brooklynmag do too! We're a Top10 ComfortFood! http://t.co/HLEgMzyruk cozyinyourbelly	1423086192	563090419463241728	f	morristruck
Hey people on the internet, did you know that you can call in your order to the MorrisSandwichShop at (718) 398-2145? technologyisamazing	1422990340	562688388927852544	f	morristruck
We'll be off the streets on Mondays for the next few weeks, but the MorrisSandwichShop is open 11-8!	1422891568	562274109695229952	f	morristruck
Beat the chill with a tasty toasty sandwich at the MorrisSandwichShop, open till 6 at 569 Lincoln Pl!	1422723753	561570241889980416	f	morristruck
T'was only a matter of time before the climbing world collided w/ the grilled cheese scene: its happening 2NIGHT @BKBoulders @americanalpine	1422660115	561303323455025152	f	morristruck
Good morning! Unfortunately the cart will not be at Metrotech today, but the truck is at 51st & Madison for a grilled cheesing good time!	1422548389	560834709950038018	f	morristruck
Good morning! Truck will be @RoyalPalmsClub later this evening, but for the time being satisfy that sandwich craving at our shop, open 11-8!	1422461850	560471740112195584	f	morristruck
If you forgot that beer and whiskey weren't the only things needed to weather the storm, we got you covered! Sandwiches at 569 Lincoln Pl!	1422385659	560152170444902400	f	morristruck
Hey folks, we'll be keeping the truck off the street today due to the weather forecast, but the shop will be open through it all! snowedin	1422280935	559712927201361920	f	morristruck
Truck will be at private events this weekend, but the MorrisSandwichShop is open for all, all weekend! 11-8pm today, and 10-6pm Sat/Sun!	1422038176	558694723838558208	f	morristruck
Trucks & Carts & Sandwich Shops oh my! We're at 51st & Madison & @DowntownBklyn Metrotech Plaza & 569 Lincoln Pl respectively! EATMOR	1421943579	558297954541633537	f	morristruck
Truck will be slingin' cheese @RoyalPalmsClub tonight, 6pm-12am, and the MorrisSandwichShop is open till 8pm!	1421869612	557987713639800832	f	morristruck
Man, I've really wanted to try the Morris Sandwich Shop, but they close before I get home from work! WE'RE OPEN TILL 8 M-F 569 Lincoln Pl!	1421777173	557599997450260481	f	morristruck
Truck is off today, but the MorrisSandwichShop will be starting our new M-F winter hours of 11am-8pm today! Stop by for a sammich!	1421683439	557206846256472064	f	morristruck
Heads up gang- truck will be off tomorrow, but the MorrisSandwichShop will be starting our new hours of 11am-8pm! sandwichesfordinner!	1421612350	556908678427975681	f	morristruck
Sunday, hungry Sunday! Truck is off for a private event, but MorrisSandwichShop is here to satiate those cravings for stuff between bread!	1421597086	556844656525578241	f	morristruck
Hey now brunchtime! Get over to 569 Lincoln place for a beautiful sandwich that you can eat and enjoy! MorrisSandwichShop	1421511574	556485993810116608	f	morristruck
!!! Fri, Feb 6th no truck today due to the cold! Brrrrrr!!! Be back next week with Valentine's Day treats, hooray!!!	1423238529	563729367734689792	f	thetreatstruck
We're going to close at 6pm instead of 7pm tonight due to the cold! Our toes and treats are frozen! Have a good night!!!	1423177578	563473722162438144	f	thetreatstruck
!!! Thurs, Feb 5th 3-7pm Bway (86th & 87th)!!!	1423165524	563423163153784832	f	thetreatstruck
We'll be on the UWS Thursday afternoon! Hooray!!!	1423095675	563130195528654848	f	thetreatstruck
Oy! We have a frozen water pipe that just burst. We had to close at 45th to get it fixed! We hope to get back for our 2nd spot!	1423075448	563045355416453121	f	thetreatstruck
!!! Wed,Feb 4th 12-3:30pm 45th st & 6th ave!! Then 4:30-7pm 18th st & 7th ave!!!	1423063848	562996702471528448	f	thetreatstruck
On Wed, we'll be going to our fave Wed spots!!! We'll let you know spots & hrs!!!	1423006679	562756920084533248	f	thetreatstruck
!!! Sun. Feb 1st! Happy Super Bowl Sunday! No truck today! Our shop open 8:30am-6pm w/food & Treats!!!  521 Court st Brooklyn	1422795421	561870836291108865	f	thetreatstruck
!!! Jan 31st no truck this weekend! Our shop open 8:30am-6pm Sat & Sun! Food & Treats! 521 court St Brooklyn treats brooklyn	1422707026	561500082055692288	f	thetreatstruck
!!! Fri, Jan 30th no truck today! We'll be back at our regular spots next week! Have a great weekend!!!	1422631009	561181243002609664	f	thetreatstruck
@MerklDuke next week! We miss you all, too!	1422568434	560918783876157440	f	thetreatstruck
!!! Thurs, Jan 29th 4-7pm Bway. (86th & 87th)!!!	1422564350	560901656293163008	f	thetreatstruck
!!! Thurs, Jan 29th headed to the UWS this afternoon! We'll let you know our opening time later!!!	1422545119	560820995830079488	f	thetreatstruck
!!! Wed,Jan 28th no truck today! We'll have a spot on the UWS tomorrow afternoon! (and soon we'll add back all our Wed spots!)	1422470539	560508183857610753	f	thetreatstruck
!!! Tues, Jan 27th our shop is closed for the day.  We'll be open tomorrow! Have a great day! Build a Snowman & bake cookies!!!	1422377198	560116682136756224	f	thetreatstruck
!!! Tues, Jan 27th no truck today! Our shop will be open later today, perhaps 12-4:30? We will update as soon as we know!!!	1422368625	560080726054694912	f	thetreatstruck
!!! Mon, Jan 26th no truck today! Good luck & safe travels, everyone, on this snowy day!! Our shop open. 'til 6pm!!!	1422291228	559756101164752898	f	thetreatstruck
Our truck is closed this week! Our shop is open Wed&Thurs 8:30am-6pm and Fri 8:30am-5pm! The shop is closed this weekend.	1421836759	557849919382630401	f	thetreatstruck
No truck this week! We'll be back a few days next week! We'll return to full schedule of spots in February!!!	1421779287	557608864267661313	f	thetreatstruck
!!! Mon, Jan 19th MLK Day! no truck today! Our shop open 8:30am-6pm w/food & Treats!! 521 Court st Carroll Gardens Brooklyn	1421672043	557159050329477120	f	thetreatstruck
Happy Birthday Lil' Brunch Box! \nThank you for your overwhelming love and support these past couple years. It's... http://t.co/OrA82cwdfd	1421723664	557375564697567233	f	thesteelcart
Winter Hours... \nSee ya'll soon! For catering inquiries or just to say hi, contact us at info@thesteelcart.com. http://t.co/ZBWC1uqED9	1420580129	552579230954172416	f	thesteelcart
RT @FunMusicPres: Shoutout to @TheSteelCart for keeping our staff well fed while we plan the DOPEST party in DUMBO. http://t.co/TebaOCbOMI	1419955062	549957509579300864	f	thesteelcart
@holyshityouguys Happy New Year Dan! You are missed. We'll catch you sooner or later.	1419951688	549943359213932545	f	thesteelcart
Makin a grand finale on Front & Jay! Stick it to the weatherman with a toasted sandwich & grits. Soup today is Rustic Chicken Noodle.	1419950738	549939373081645057	f	thesteelcart
One more Front & Jay Monday! Rustic Chicken Noodle soup on board. @DUMBOFoodTrucks	1419862364	549568705097912320	f	thesteelcart
One more round for Dumbo! Front & Jay through lunch. Soups are Split Pea & Ham + Rustic Chicken Noodle. @DUMBOFoodTrucks	1419345151	547399356950011906	f	thesteelcart
Making a Christmas cameo on Front & Jay in Dumbo!!! Soups are Split Pea + Rustic Chicken Noodle. @DUMBOFoodTrucks	1419256271	547026568670089216	f	thesteelcart
Last day on Front & Jay! We'll miss you Dumbo. Have a great winter! Serving the usual + Split Pea Soup through lunch. @DUMBOFoodTrucks	1417009699	537603759468457984	f	thesteelcart
Last day on 56th & Broadway! Soups are Split Pea & Rustic Chicken.	1416928831	537264575562149888	f	thesteelcart
@holyshityouguys Just issued refund. Had you checked in for some reason & charge went to your wallet on accident. Sorry about that.	1416843469	536906541849657345	f	thesteelcart
Front & Jay Monday with Split Pea & Rustic Chicken Soup. @DUMBOFoodTrucks	1416841612	536898751068405760	f	thesteelcart
@danaboodle Purple & Orange!	1416836553	536877536081625088	f	thesteelcart
The end is near!!!\nFront & Jay with Mushroom Barley & Split Pea Soup. @DUMBOFoodTrucks	1416578168	535793788523126784	f	thesteelcart
Last Thursday in Midtown for a while! We'll miss you! Soups today are Chicken Noodle, Mushroom Barley, Split Pea & Ham. - 56th & Broadway.	1416494608	535443311834968064	f	thesteelcart
RT @liakamb: @TheSteelCart Thank you so much for the most fantastic bowl of grits I've ever had outside of my mom and grandmas &gt;.&lt;!!!!	1416408991	535084210890231809	f	thesteelcart
@liakamb Yay! Thanks for stopping by!	1416408980	535084164459274240	f	thesteelcart
Well it's no Buffalo, but still complaint worthy. The Steel Igloo's on Front & Jay with Split Pea & Rustic Chicken Noodle. @DUMBOFoodTrucks	1416404841	535066804419592192	f	thesteelcart
Soup'll fix this. 56th & Broadway through lunch with Organic Lentil & Rustic Chicken Noodle. http://t.co/69Q2VD8rdA	1416319289	534707972333510656	f	thesteelcart
Could this Monday be any more Monday? Front & Jay in the rain through lunch! Soups are Rustic Chicken Noodle and Organic Lentil. DUMBO	1416232862	534345472073539584	f	thesteelcart
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
@VistCaymanIslands  is giving away free ice cream all week long. \n\nEnter to win a free trip to Cayman Islands http://t.co/F6Cle7U4Rq	1402941240	478596368882466816	f	thecrepestruck
MikeEpps visits NewEraCap Promo Truck SuperBowl with CrystinaPoncher ESPN\nhttp://t.co/k0PPVYUhBq http://t.co/3MeumAKTUz	1391084755	428866664227024896	f	thecrepestruck
VictoriaJustice at Uggs Aulstralia on Madison Ave & 58 Street tonight from 6:30pm-8pm	1383866974	398593095865884674	f	thecrepestruck
Come meet VictoriaJustice at the Ugg Store tonight on Madison Ave. We're giving out free coffee and hot chocolate from 5-6pm	1383864158	398581286391918592	f	thecrepestruck
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
Just in case you wondering, we're waiting for you on Charlton and Varick!!!	1408708562	502786268183691264	f	blend_express
Mom	1404008129	483071225703702528	f	blend_express
blendonthewater's photo http://t.co/XmwftfNKg5	1399055250	462297345276010496	f	blend_express
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
We do cookies too !!! http://t.co/KM86wJPQG3	1423257062	563807100443566080	f	valduccis
Brookfield Plaza commodities exchange Valduccis will be there 1130 am to 3 pm http://t.co/XhhtybgO6r	1423224231	563669398670835712	f	valduccis
Commodities exchange we're coming today meatball sandwiches Panini's hot soup @gofooda @FoodNetwork @foodNfest http://t.co/DZ3M3EA6yh	1423224094	563668823744987136	f	valduccis
Commodities exchange Valduccis is coming for lunch today Panini's Soup Spaghetti and Meatballs @BrookfieldPLNY @gofoo http://t.co/3Cn2c6Vbca	1423223353	563665713622417408	f	valduccis
RT @scottspizzatour: @Valduccis Thanks Mike!!!	1423083790	563080346544390144	f	valduccis
We do cakes to @Valduccis http://t.co/aU7eXZCYUk	1423081381	563070242537365505	f	valduccis
RT @greenboxny: Mmmmm MM! @Valduccis @Foodtruckgirl7	1423079207	563061123608743936	f	valduccis
yum http://t.co/lykPJEvfO8	1423079146	563060866359525378	f	valduccis
Best Pizza @Valduccis @greenboxny @Foodtruckgirl7 http://t.co/gjfmpExur0	1423078431	563057868333932544	f	valduccis
Dad's always grabbing a taste bestfood bestcatering @valduccis http://t.co/PIFNh1yQbk	1423078150	563056691387068417	f	valduccis
pizza http://t.co/lbUK12djSH	1423069310	563019612636594179	f	valduccis
It was a full moon last night Did you feel it @Valduccis@foodtoeat @Foodtruckgirl7 @greenboxny @foodNfest @FoodNetwor http://t.co/TlX3pQ95GL	1423067185	563010698431983616	f	valduccis
Mangia Mangia !!!!!!! http://t.co/kRMyUX3rmw	1422989455	562684675358195713	f	valduccis
@Valduccis Best cateringBest pizza  http://t.co/P93EtkJaO3	1422989413	562684497884631041	f	valduccis
Oh No http://t.co/q7qDJRXhUQ	1422909060	562347475865182208	f	valduccis
We are coming  out with a New personnel Pie and this looks like Heaven@Foodtruckgirl7 @FoodieFindsNYC@FoodPorn http://t.co/wTr1E3B85t	1422893020	562280195940679680	f	valduccis
RT @pizzalovebot: @Valduccis Did you talk about pizza ? I LOVE PIZZA SO MUCH *^*	1422891101	562272147557855232	f	valduccis
The Sherry family of The Old Homestead Super Bowl party was the best we have been at  Plus they gave out our Pizza http://t.co/ReaK2YlYbS	1422887535	562257192683057153	f	valduccis
The patriots are Supper Bowl Champs @espmnfl http://t.co/iMPjDXQH9y	1422885688	562249444348141569	f	valduccis
Have a few more openings for deliveryin NYC go to our website http://t.co/qQPgqUnQ6K http://t.co/UzTTBgOt15	1422801611	561896802556071936	f	valduccis
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
RT @bongobros: Catering Now Available! Call 908 591 4972 or Email miamifoodmachine@gmail.com for details http://t.co/vsHPD5PCs2	1384452084	401047226291855360	f	miamimachinenyc
Catering Now Available! Call 908 591 4972 or Email miamifoodmachine@gmail.com for details http://t.co/gjyuYENKg8	1384441885	401004449772347392	f	miamimachinenyc
Sorry folks truck is in the shop and won't make it out to FiDi. Catch us next Friday back on Old Slip & Water!	1423237918	563726802879672320	f	domotaco
If you see a smoking taco truck on 53rd & Park don't worry, we're just grilling up our meats!	1423148686	563352539606052865	f	domotaco
Get your humpday tacos over at the @dumbolot today!	1423064234	562998321024090112	f	domotaco
Hola SoHo come through to Hudson & King for your taco fix!	1422976868	562631882605486081	f	domotaco
Hudson and King!!!	1422975833	562627539462795264	f	domotaco
Domo taco will not be going out today! Catch us tomorrow on Hudson & King!	1422890597	562270034316496897	f	domotaco
FiDi today on Old Slip & Water tacos burritos nom nachotots	1422630755	561180177695125505	f	domotaco
Early bird gets the taco! Come get yours on 53rd & Park	1422544259	560817388854452224	f	domotaco
Stay warm and safe NY we'll catch you at the @dumbolot tomorrow!	1422372104	560095317820178432	f	domotaco
Rain, sleet, or snow we have your taco needs covered! 52nd & 6th today!	1422285364	559731505484673024	f	domotaco
Friday in FiDi again on Old Slip & Water!	1422026678	558646496438927360	f	domotaco
Firing up the grills on 53rd & Park!	1421939955	558282754496815104	f	domotaco
Catch us down at the @dumbolot today!	1421853650	557920764071272448	f	domotaco
Getting the grills hot on Hudson & King!	1421765658	557551699083411456	f	domotaco
TGIF on Old Slip & Water st!	1421421187	556106882088456193	f	domotaco
It's been awhile but we're back on 53rd & Park serving burritos, bowls, and tacos!	1421332902	555736587938828288	f	domotaco
Serving our delicious burrito at @dumbolot jay and water	1421247776	555379545545924608	f	domotaco
It's a beautiful day here on Hudson & King!	1421161955	555019585582538752	f	domotaco
Happy monday! Back at it on 52nd & 6th	1421076157	554659722918641665	f	domotaco
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
RT @PruCenter: Today's menu of PRUeats at @RutgersU! Everything is free! http://t.co/NKPL5my694	1413479455	522796846285324288	f	shanghaisogo
@anyaporteryoga yes, please call the 484-469-7646. Our chef Benjamin. Wang will more than happy to help you to creat a catering menu for you	1413479066	522795212666863616	f	shanghaisogo
@anyaporteryoga hey, the truck was rent by a company promotion event in New York & New Jersey for a week. Will be back soon. Stay turn.	1413397236	522451992552439808	f	shanghaisogo
Here we go, let's rock & roll. http://t.co/tzzoFzNt3p	1413287458	521991552542199808	f	shanghaisogo
Morning! NYC FREE-SAMPLE Here we are! @ 220 east 42nd street between 2nd~3rd ave.  7am~2pm. PRUeats @PruCenter http://t.co/wV72nCJ5aU	1413286533	521987670856441856	f	shanghaisogo
TRUCK Closed feb 5th to 8th for events catering eddiespizza weddings barmitzvah birthday http://t.co/IU1BfezeCZ	1423155747	563382156291227649	f	eddiespizzany
TRUCK Closed feb 5th to 8th for events catering eddiespizza weddings barmitzvah birthday http://t.co/xZ9bAAJIif	1423155741	563382127665086464	f	eddiespizzany
Tuesday's: 47th between park and lex eddiespizza 270 calorie personal pizza healthylunch http://t.co/rBQimX72tP	1422980638	562647692674080768	f	eddiespizzany
Tuesday's: 47th between park and lex eddiespizza 270 calorie personal pizza healthylunch http://t.co/621IGsb00g	1422980635	562647683496947712	f	eddiespizzany
starrettlehigh mondays http://t.co/R9j5FL0XVE	1422897168	562297595440398336	f	eddiespizzany
starrettlehigh mondays @ Starrett-Lehigh http://t.co/jMDuxwvg05	1422897166	562297588821807104	f	eddiespizzany
@StevenTong @infatuation eddies! Home of the original bar pie since 1941! http://t.co/kbFYzpKH3E	1422821071	561978421119827970	f	eddiespizzany
Go check out our friends @TakumiTacoNY who are open every day @ChelseaMarketNY for amazing tacos and more! http://t.co/ujm70AfODf	1422722850	561566453703643138	f	eddiespizzany
Wednesday's: open today at 46th between 5th and 6th. Call ahead your order 917 439 7522 http://t.co/R0ctoBpYov	1422458448	560457468828872704	f	eddiespizzany
Wednesday's: open today at 46th between 5th and 6th. Call ahead your order 917 439 7522 http://t.co/5iz1lWCPaU	1422458444	560457453138350080	f	eddiespizzany
Takumi is OPEN today at Chelsea market starting at noon. Enjoy your snow day at @chelseamarketny... http://t.co/8HEVzu8RcK	1422370631	560089140256329728	f	eddiespizzany
CLOSED WED AND THURS JAN 21 and 22 for private events! http://t.co/RUBthxpqOX	1421858590	557941486101098496	f	eddiespizzany
Tuesday's; 47th between park and lex. Special: meatball, ricotta cheese, and spinach http://t.co/LnQ4hPct7p	1421770115	557570393897455616	f	eddiespizzany
BBQ chicken pizza. Friday's: varick and king until 3p. http://t.co/lwuQWumTMH	1421423258	556115570115248128	f	eddiespizzany
BBQ chicken pizza. Friday's: varick and king until 3p. http://t.co/PHpBtZgJNw	1421423255	556115556777349120	f	eddiespizzany
Thursday's: 10 Hanover downtown! http://t.co/Qd5Rv4yDqV	1421338607	555760517038747649	f	eddiespizzany
Thursday's: 10 Hanover downtown! http://t.co/jzwCunt4X4	1421338603	555760501721145344	f	eddiespizzany
We are parked on W.47 street between Park ave. and Lexington ave. Looking forward to serving you.	1421162156	555020427756457984	f	eddiespizzany
Today's special: White pie with roasted peppers and pesto. starrettlehigh @starrettlehigh eddiespizza http://t.co/GElKMBNezP	1421076858	554662662207184896	f	eddiespizzany
Today's special: White pie with roasted peppers and pesto. starrettlehigh @starrettlehigh... http://t.co/JCR74ilmWW	1421076855	554662651259674626	f	eddiespizzany
OPEN on VARICK/VANDAM. Taim Thursdays in full effect with HOT Lentil soup and all your favorites. vegan nyclunch soho	1423152662	563369214564913153	f	taimmobile
Hump Day = Hummus Day on 20th/5th. Hot soup and hot falafel to get you through your midweek blues. vegan lunch nyc flatiron	1423071487	563028743892250624	f	taimmobile
HOT Black Bean Soup on 20th/5th served with toasted pita. Subtle flavors and a creamy texture, and it's HOT vegan	1423067767	563013140066336770	f	taimmobile
OPEN. OPEN. OPEN today on 20th/5th! Taim to the mid-week rescue!	1423062083	562989298770014209	f	taimmobile
@NeatBeet Sorry, the truck is closed today. Our stores our open as usual.	1422983661	562660371778260993	f	taimmobile
The Taim Mobile is staying indoors today, we are CLOSED. Get hot soup and falafel at our West Village and Nolita locations.	1422980954	562649019575697408	f	taimmobile
Taim mobile is off the slushy streets today, CLOSED, so stop by our stores for your falafel fix	1422895065	562288773556609025	f	taimmobile
Be the best guest at your party this weekend. Skip the bland store brand and bring Taim's hummus. http://t.co/kpSEKSJ3fW	1422643521	561233721270239232	f	taimmobile
RT @nycfoodtruck: Even though it's cold, you gotta eat... & some fresh air won't kill ya either! Visit these guys & enjoy: http://t.co/yUvD...	1422551165	560846354726285315	f	taimmobile
Hello soho! It's Taim Thursday on Varick/Vandam! Creamy hot Tomato Basil soup & any sandwich for just $9.50!	1422546188	560825477796225025	f	taimmobile
Great deal in the Flatiron for lunch: Soup and Falafel Sandwich for $9.50. On 20th/5th until 2:30 only!	1422467339	560494761946415104	f	taimmobile
Taim mobile is OPEN on 20th/5th until 2:30 today with hot Black Eyed Pea soup!	1422467134	560493901937917952	f	taimmobile
There is no reason to go into work in the Flatiron today, Taim mobile is closed.	1422372247	560095917244964865	f	taimmobile
Top Blizzard15 ideas:\n- build a fort out of Taim hummus & falafel \n- make a blanket out of Taim pitas \n- learn juggling using falafel balls	1422291584	559757591241568256	f	taimmobile
BREAKING: Taim will be closed Monday and Tuesday due to Blizzard15. Stock up on hummus at our stores and wait the storm out.	1422284699	559728716415516673	f	taimmobile
@KevinHavas @allstarcharts We can't wait as well!	1421944237	558300715333197824	f	taimmobile
RT @KevinHavas: Yo @allstarcharts I'm going to try @TaimMobile falafel for the first time today because of your gleaming review. Can't wait.	1421943983	558299649816408064	f	taimmobile
It's Taim Thursday on VARICK/VANDAM with HOT Corn Jalapeno soup and your favorite falafel and hummus.	1421941384	558288747884982273	f	taimmobile
RT @allstarcharts: @howardlindzon told me this was the best Falafel in New York. And he was right @TaimMobile http://t.co/gGyogbOfCu	1421866805	557975941801332736	f	taimmobile
Taim Mobile closed? That's crazy talk. We are OPEN on 20th/5th with HOT Corn Jalapeno soup!	1421857870	557938462058610689	f	taimmobile
Join us at 375 Hudson Street and try our signature, the macarella ! Happy WorldNutellaDay SweeteryNYC @NutellaUSA http://t.co/44uKHvCoLQ	1423150421	563359817268736000	f	sweeterynyc
The Super Bowl Final is in 2 days ! We are so excited !! What team do you support ? SuperBowlXLIX SuperBowl	1422632016	561185465819475969	f	sweeterynyc
We are now on Snapchat ! Add us : sweeterynyc ! ;) SweeteryNYC Snapchat http://t.co/XaqQydVsZ9	1422562874	560895466188328961	f	sweeterynyc
SweeteryNYC and Cake Boss rule Times Square ! tbt ThrowBackThursday SweeteryNYC CakeBoss TimesSquare http://t.co/GeNYSB5sUm	1422546807	560828077010604032	f	sweeterynyc
@HPSLiving do we have an upcoming date?	1422504517	560650699005247489	f	sweeterynyc
You also can follow us on Instagram : http://t.co/kjwzEfafTX ;) Instagram SweeteryNYC	1421955791	558349174245441537	f	sweeterynyc
What kind of popcorn do you prefer ? What flavor ? tbt ThrowBackThursday SweeteryNYC popcorn @FoodNetwork_Mag http://t.co/N6x37UkLQG	1421947546	558314590564790272	f	sweeterynyc
SweeteryNYC is also on Pinterest : http://t.co/C1m41uGVZo ;) http://t.co/58T4JwNdgD	1421434915	556164462638792705	f	sweeterynyc
@richardsdm At our usual spot, at 375 Hudson St ;)	1421425448	556124753334112256	f	sweeterynyc
Good morning from Sweetery ! You also can follow us on Pinterest : http://t.co/o1hjnISeB4 ;) SweeteryNYC Pinterest	1421418611	556096080073752576	f	sweeterynyc
@ClayRivers We're back on the street at 375 Hudson St ;)	1421348791	555803230735970304	f	sweeterynyc
You also can follow us on Flickr : http://t.co/VCdkqokPLB ;) SweeteryNYC Flyckr	1421348023	555800009938329600	f	sweeterynyc
4 years ago, we wished the 113th birthday of Mr Michelin tbt throwbackthursday SweeteryNYC michelin birthday http://t.co/p8hltFVUP3	1421335674	555748216567001090	f	sweeterynyc
You also can follow us on Facebook : http://t.co/77RZh4k5Vy ;)	1421263780	555446669396172801	f	sweeterynyc
That time we made it snow in summer! FlashbackFriday SweeteryNYC TheWeatherChannel snow http://t.co/I6N5c4J3k4	1420813647	553558676133670912	f	sweeterynyc
@RaymondeGreen all the way from Moscow the SweeteryNYC team thanks you for your kind words.	1420577971	552570178039730176	f	sweeterynyc
RT @RaymondeGreen: Shout out to @SweeteryNYC for catering our CESlite and for the awesome hot chocolate bar! http://t.co/JQcc0PF6pv	1420577892	552569846731661314	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/aR2bxOPJe5	1420202105	550993681831174145	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/aR2bxOPJe5	1420115704	550631291134431232	f	sweeterynyc
From a very cold and snowy Moscow wishing all friends & fans of Sweetery a truly happy healthy & wonderful New Year! http://t.co/jySfoBZ7dZ	1420047902	550346906359332864	f	sweeterynyc
I checked in at Love Mamak on Yelp http://t.co/2VOdqeHpqg	1420072776	550451236256755713	f	lovemamak
Steamed Lime garlic chilli striped bass http://t.co/NNd3nX0EsA	1419931808	549859975406043136	f	lovemamak
I just earned the Rookie badge on Yelp!	1419664070	548737000786767873	f	lovemamak
ON THE PLATE http://t.co/7dVduKuthr	1419116692	546441129340968960	f	lovemamak
Pho Ga in a cold weather ? Sure http://t.co/9eTWSNe13O	1418948372	545735143525474304	f	lovemamak
Mamak on Yelp: Curry Laksa ( Malaysian Ramen ) http://t.co/xKUOieQCHI	1417590010	540037759843319808	f	lovemamak
@jerewumuwegab we are at 174 2nd ave 10003	1417587804	540028510547755009	f	lovemamak
@JeepneyNYC 6 yj7n7u	1417408994	539278526370025472	f	lovemamak
Get ur laksa soup fixed @smorgasburg ! Cold weather + hot soup = foodgasm!! lol	1416074659	533681916953001984	f	lovemamak
RT @JeepneyNYC: .@lovemamak serving up something a little chilly at the nightmarketnyc  http://t.co/iGrEouHqTv	1416070510	533664515540660224	f	lovemamak
RT @bedbow: A @vendyawards + @bkflea favorite, @lovemamak, is opening a Thai-Malaysian spot in the East Village http://t.co/8NjddSeK3I cc: ...	1415285731	530372913535647744	f	lovemamak
@pinguswobbin not yet	1414640380	527666118803357696	f	lovemamak
Come on down! Pickup now available in Midtown at 251 E45th St. Hours are 11am-10pm. Keep Calm and Curry On  http://t.co/XZB2KwIg2w	1414517548	527150920464080896	f	lovemamak
@MordekhaiKevin we cook malaysian style rendang, not indonesian style.	1414462410	526919658277175299	f	lovemamak
Hey midtowners, you guys are so awesome! Thanks a lot for waiting patiently..! We are gonna be at your reach real soon! :) BigThingsPoppin	1414450403	526869295733944320	f	lovemamak
Hey midtowners we are coming soon to reach you out. we are utmost excited to meet you ASAP! :)	1414450225	526868547449151488	f	lovemamak
RT @miss_masala: Best thing about a spice shopping trip: samosa IndianSnack foodshopping diwali http://t.co/g5SVvvooIe	1414312468	526290755095384064	f	lovemamak
Photo: Keep Calm, Coming Soon (at 174 2nd Ave NY 10003) http://t.co/ZALCRumJOC	1414310308	526281693389660160	f	lovemamak
Keep Calm, Coming Soon @ 174 2nd Ave NY 10003 http://t.co/q4sy62OSGQ	1414310306	526281687819227136	f	lovemamak
Currently we are working on opening up the restaurant at 174 2nd ave, very close by NYU !	1414265989	526095806181683200	f	lovemamak
@jaci_KVLT Monday ! 32nd st & Park	1423179347	563481140908941312	f	shukanyc
So after the craziest three days we ever had!! No sleep no food !! Just serving shakshuka all day and night long!... http://t.co/5FiochYBdH	1423175189	563463700817149952	f	shukanyc
So after 72 hours of no sleep and only work the shuka team is taking this Friday off!!! We really appreciate all the support!! Thank you(:	1423174870	563462363425566720	f	shukanyc
RT @boredis89: @ShukaNYC I'm going to have some sexiness shuka today. Looking forward	1423165857	563424559458975744	f	shukanyc
RT @boredis89: lunch @ShukaNYC that was amazing. Glad to make it before you sold out for the day! http://t.co/zAY9BQokhr	1423165856	563424553050046465	f	shukanyc
RT @porn4jews: It's official: the Shuka truck is the best midnight drunk food in the Western world. @ShukaNYC	1423154208	563375699860664321	f	shukanyc
Today 46th st and 6 av !!! 11am-4pm !! And as always have an eggcellent day!!	1423154084	563375178097655809	f	shukanyc
@DishnDatBlog we are on 46st and 6 av waiting for you !!! (:	1423153865	563374261898051585	f	shukanyc
RT @JackieeAA: @ShukaNYC is now ranked 1 in Ethnic Food on Grab & Go pg on http://t.co/7XDxvwnr2rThis is the Green Shakshuka http://t...	1423130223	563275101328900096	f	shukanyc
We were interviewed by the news channel in Israel today!!! For those who don't understand Hebrew , It was a great... http://t.co/NtqmerAceS	1423120439	563234063834955776	f	shukanyc
http://t.co/hxJJmFM878	1423120300	563233478389428224	f	shukanyc
RT @TaglitBRI: We can't wait for our Summer 2015 NYC Launch Party tonight!\n\n@ShukaNYC Will be there too!! YUMMMMM :)	1423090052	563106610655285249	f	shukanyc
That Was a fun day!!!!!! Today lunch 21st and 5th see you there \n11am-4pm http://t.co/PtAVVcQjgv	1423070972	563026583309799425	f	shukanyc
Today 21st & 5th av!! 11am-4pm come hungry cuz we are ready to serve !!!!	1423055069	562959882073411585	f	shukanyc
@UdiSch the closest we get to soho is 21st st & 5th av ! Try to come by !	1422989910	562686584794140672	f	shukanyc
RT @JackieeAA: 1st time in a foodtruck & Iit! @ShukaNYC is NYC's 1st Mobile Shakshuka SourceAll glutenfree except- delicious! http:/...	1422989515	562684928056643585	f	shukanyc
The Shuka Team! Today The FIDI - Hanover Sq. See you Soon ! @ Hanover Square http://t.co/z170k4B5Xq	1422969359	562600386369171457	f	shukanyc
NYC launch Party ! Hosted by Taglit -Birthright Israel  & JSwipe ! \nThe Shuka Truck will be there! http://t.co/6VCnDeMSgA	1422910419	562353176578637825	f	shukanyc
Because of the Weather The Shuka Truck will not be parked today at 32nd & Park . Tomorrow FIDI-Hanover sq.	1422897328	562298267388899329	f	shukanyc
New York with Eggs ! Six months ago we decided that New York is ready for a real Shakshka!\nA story... http://t.co/11YqkM3k0N	1422885602	562249085844213762	f	shukanyc
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
Merry Christmas !!  \nhttp://t.co/YHbJCrYe9T http://t.co/4Y51iWFEvJ	1419366081	547487144814870529	f	elpasotruck
visit our restaurant http://t.co/YHbJCrYe9T http://t.co/mIpdFwiP9e	1419267849	547075126899269632	f	elpasotruck
http://t.co/8NzIbwtYdW	1418251930	542814057632661504	f	elpasotruck
@elpasony @ZagatNYC @YelpNYC @NYCFoodieFinder @nycgo @HarlemRestRow this is out patio !! CheckItOut	1416428307	535165226434711552	f	elpasotruck
RT @elpasony: SpecialEvents Book your special event with us @ZagatNYC @YelpNYC @NYCFoodieFinder @nycgo @HarlemRestRow http://t.co/Gme1j9Ni...	1416428259	535165026399965184	f	elpasotruck
Cover up & come to 72nd & York Ave. for some Enchiladas for Lunch.	1416325182	534732687580610560	f	elpasotruck
Stop by and get your lunch with us at 72nd & York Ave in front of sothebys taco quesadiilas mexfood	1414425592	526765230383443968	f	elpasotruck
RT @UrbanAdventures: Best eats in the NYC streets http://t.co/joBKsVqzeC @waffletruck @dubpies @VeganLunchTruck @snowdaytruck @korillabbq ...	1423260916	563823266327183361	f	veganlunchtruck
@preetweet its been on our regular menu for the past three years!	1423232335	563703388433829888	f	veganlunchtruck
Parked on 55th/Broadway  9:00-3:00\n\nSmoked chili bourbon bbq seitan burger with jalapeno mac n cheese, smoked... http://t.co/03xLdD3L0M	1423230095	563693994660868096	f	veganlunchtruck
Smoked chili bourbon bbq seitan burger with jalapeno mac n cheese, smoked almond bacon, arugula & chipotle mayo http://t.co/gZfd6JobyM	1423180673	563486701759496192	f	veganlunchtruck
@Mack__11 not back in jersey city until the farmers market re opens for the season.  Usually sometime around Mother's Day.	1423180328	563485254149996546	f	veganlunchtruck
TACO THURSDAY 5:00-8:00\non 14th/3rd near Trader Joes. \n\nWe have plenty of awesome donuts and pastries on the... http://t.co/VhDsf3pBaC	1423175013	563462963454312450	f	veganlunchtruck
@JulianVModesto Astor place is actually going to be Sunday.  Tonight we will be on 14th/3rd.  My bad	1423165929	563424859200712704	f	veganlunchtruck
RT @franklanguage: Chef Adam is cookin' it up at the @VeganLunchTruck today! vegan veganlunchtruck nyc newyork... http://t.co/8mFiXJ9yrm	1423160323	563401349799612416	f	veganlunchtruck
Parked on 21st/5th 8:40-3:00\n\nThen serving taco Thursday dinner near Astor place 5:00-8:00\n\nSmoked chili bourbon... http://t.co/bPjYWQLoO5	1423144075	563333200848891904	f	veganlunchtruck
Learn about my culinary thought process & learn about what I feed my dogs (hint: THEY ARE VEGAN TOO)!\n\nhttp://t.co/AR6wHttUXC\n@AceNatural	1423090823	563109843880652802	f	veganlunchtruck
RT @jeffgunn: If I lived in NYC, I'd be at Cinnamon Snail EVERY day.	1423084786	563084523005833217	f	veganlunchtruck
RT @shessomickey: @ImEricSchneider @TimTelep I see your Melt and raise you @VeganLunchTruck's jalapeno mac and cheese burger http://t.co/Ow...	1423079365	563061786010988544	f	veganlunchtruck
Parked on 47th between Park/Lexington 8:20-3:00\n\nSmoked chili bourbon bbq seitan burger with jalapeno mac n... http://t.co/NAiKozDwsg	1423055453	562961492203823104	f	veganlunchtruck
We are hiring lovable folks to work on our truck during the day & other folks to clean at night.\nEmail resumes to thecinnamonsnail at Gmail	1423015859	562795421329018880	f	veganlunchtruck
Please RT:\n\nServing VeganTACOTUESDAY 5:00-8:00\n4th street near the corner of Mercer\nWe also have tons of awesome donuts & pastries tonight!	1423000570	562731294694866945	f	veganlunchtruck
You don't have to be bald, or foaming at the mouth to enjoy our lovely Cinnamon Snail merchandise (but it does help)\nhttps://t.co/jPlNgwyV5v	1422991196	562691978144804866	f	veganlunchtruck
RT @JamieKleinberg: @VeganLunchTruck the special is out of this world! Please tell me the jalapeno mac & cheese will be in your cookbook ht...	1422984306	562663077993537537	f	veganlunchtruck
Parked on Water and Gouvernour Ln. 8:30-3:00\nThen serving Taco Tuesday dinner on 4th st. Near Washington Square... http://t.co/EuNoQ543YA	1422969902	562602666472538112	f	veganlunchtruck
RT @locaines: I made peanut butter chocolate cheesecake donuts from @VeganLunchTruck's forthcoming cookbook to the... http://t.co/aQhHGlwQMJ	1422965079	562582433544282112	f	veganlunchtruck
This week:\n\nTUES: water/Gouvernour Ln, AND Dinner on 4th Street near Washington Square\nWEDNESDAY: 47th/Park... http://t.co/VfZpEQ3Drg	1422919144	562389770094272512	f	veganlunchtruck
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
!!! No truck this weekend! Our shop open 8:30am-6pm Sat & Sun w/food & Treats!!! 521 Court St Carroll Garden Brooklyn	1423310202	564029986991276032	f	thetreatstruck
Charity: Children Tumor Foundation\n@Stage 48 605 W 48th Str. Between 11 & 12 ave\nCurry King  spicy curries best for the RUN	1423316166	564055000859414530	f	mausamnyc
Parked on 14th/3rd in front of trader joes 10:00-4:00 \n\nServing breakfast all day (or until we run out). Also our... http://t.co/mSSBtHwbz3	1423317016	564058563971411969	f	veganlunchtruck
We have no limits to our catering Just ask and we will make !!!!!!! http://t.co/6IC3ehkq32	1423320179	564071832589197312	f	valduccis
Find Bessie in Park Slope today (7th Ave). Call 646-504-6455 to pre-order or @Foodtoeat.com.	1423321205	564076134296326144	f	milktrucknyc
Passing through @timessquarenyc? Dont forget to stop by our kiosk for fresh baked empanadas	1423323800	564087019920687104	f	nuchasnyc
PieTruck is @ Trader Joe's on Court St. at Atlantic Ave. Hot pies, flat whites! http://t.co/RDd278xpMO	1423323166	564084359473668097	f	dubpies
RT @Foodandtattoos: @dubpies tried thai chicken curry, great pie packs great punch - full review tomorrow RETWEEET http://t.co/DhFeQx1Eno	1423323018	564083741807882240	f	dubpies
We're at @bkflea's WinterFlea from 10am-6pm, 1000 Dean Street. Come get a hot grilled cheese!	1423321505	564077395821359104	f	milktrucknyc
Good morning New York! Come have some delicious Colombian food with us today at @gansmarket http://t.co/tLCIxU8neH	1423322174	564080201035182080	f	palenquefood
$4 off your first Paris Sandwich online order. Valid for orders $12+. Limited time only. Click here to order https://t.co/c8LkDeE5tw	1423325293	564093281886560257	f	parissandwich
RT @little_mswriter: @NeaExpress I ordered a Margherita. I didn't take a pic because I was hungry though!	1423325571	564094450306383874	f	neaexpress
We have a truck at Battery Park (Battery PL and 3rd PL)	1423325564	564094418597470208	f	neaexpress
All day and night at the @RoyalPalmsClub	1423326726	564099294073196544	f	papayakingtruck
RT @njlauritawinery: It's officially Mardi Gras weekend at Laurita Winery!!\n\nCome on down today & tomorrow for amazing Cajun cuisine,... ht...	1423325430	564093855474020352	f	hibachiheaven
I posted a new photo to Facebook http://t.co/1cBiq0zxTz	1423431023	564536746990653440	f	polishcuisine
There are 7k people following us on the internet! Let's celebrate with some brunch sandwiches! MorrisSandwichShop EATEATEAT YUMYUMYUM	1423325781	564095328769814529	f	morristruck
Who's hungry for lunch? Check out our foodtrucks or Harlem location! NeapolitanExpress ... http://t.co/0HOcC4ZNaE http://t.co/AwoNJ8WIlF	1423329385	564110443720216576	f	neaexpress
KOTMADAM @ 24th & bway (Flatiron) till 8pm\nBierbeek @ the Great Lawn till 5pm	1423335424	564135775168917504	f	waffletruck
CARTS\nGoesting @ 66th & Bway till 9pm\nPagadder @ Brooklyn Bridge /City Hall til 8pm\nVedette @ 59th & 5th Ave till 5pm	1423335420	564135758903394304	f	waffletruck
TRUCKS\nKastaar @79th & York till 4:30pm\nMomma @ Park Slope btwn 1st & 2nd till 5:30pm	1423335410	564135717262344194	f	waffletruck
Weeeeeekend!! dinges\n\nLe cafe @ 15 Ave B till 2am\nDe Wafel Cabana @ 35th & Bway open til 11pm	1423335401	564135679622676481	f	waffletruck
Spreading the empanada love! Instagram via @chefmcgek http://t.co/oL2J2ysZOT	1423351610	564203662588010497	f	nuchasnyc
@Joshmadden thanks for the good words brother - would love to have you through	1423366221	564264948390309888	f	mexicue
RT @Joshmadden: the @Mexicue instagram feed is straight food porn - i just looked at it for 20 minutes http://t.co/Y7j7nZoPSk	1423366189	564264811723497472	f	mexicue
RT @LFCNY: Thanks as always to @11thBar, @dubpies, and all of the amazing Reds here today for their support! http://t.co/V1ISgcfn69	1423352097	564205705843200002	f	dubpies
Does this @LaMarzocco espresso machine make my butt look big? http://t.co/bRIni4z4sZ The PieTruck is @ Bedford/N7	1423352066	564205578193743872	f	dubpies
We have a truck at Wythe Ave & N 11th St until 5AM in Brooklyn pizzaneversleeps	1423364571	564258027667472384	f	neaexpress
RT @PLeiaPrinSass: Happy 2nd Birthday Matias! (@ Neapolitan Express - @neaexpress in New York, NY) https://t.co/48wc2nc0tB	1423364525	564257832682659840	f	neaexpress
@BlakeMerriman we shall see what we can do!	1423388958	564360311315394560	f	waffletruck
@dj_maliki looks bout good!	1423388942	564360244143611904	f	waffletruck
@Tinman2IronMan twas our pleasure to bless you.	1423388908	564360101101060096	f	waffletruck
@JennyLynnToto the closest would be Forest Hills on Sundays.	1423388873	564359955554500608	f	waffletruck
@belgian101 @BryantParkNYC it'll feel like you're there!	1423388852	564359866408779776	f	waffletruck
@monique_elise a darn fine treat to go if we do say so.	1423388818	564359726969139200	f	waffletruck
@SandyShylady @newyork_bites we always post the locations on the day just in case of changes, but you can always check out the cafe!	1423388788	564359601416830976	f	waffletruck
@its_grrr_egg cafe on 15 ave b till 2am	1423372257	564290265276747776	f	waffletruck
@sjhpostt there is indeed such a thing. It's called the Wafels & Dinges Cafe! 15 Ave B!	1423350773	564200155025772545	f	waffletruck
Six-foot heroes Panini Pasta Salad catering http://t.co/da5EU6SUGk	1423351676	564203938552242177	f	valduccis
http://t.co/JhZCEwTNMp	1423356765	564225287018520576	f	lovemamak
Only a few days left to order valentines treats from the Cinnamon Snail! \n\nhttp://t.co/l4ko9cHTjx	1423354203	564214539106144256	f	veganlunchtruck
RT @GoGoGadge7: 3 times in 1 day... (at @ShortysNyc in New York, NY) https://t.co/229abbs3YG	1423398795	564401573640798209	f	shortysnyc
Good morning. Truck open at Bergen and court street. Come!!!!	1423402568	564417397889978369	f	carpedonutnyc
Today 63rd and Broadway!!\n11am-4pm \nSee you there!! http://t.co/8aNxc3GwAA	1423403942	564423160251301890	f	shukanyc
Today 63rd and Broadway !!! 11am-5pm see you there (:	1423403833	564422704892485632	f	shukanyc
White Pizza on Wythe. 5 AM food truck! pizzaneversleeps neapolitanexpress neaexpress p... http://t.co/qpnYgk9NRK http://t.co/71K2MSLAlI	1423406649	564434515888963584	f	neaexpress
See EVERYONE at the @RoyalPalmsClub today! We will be there from 12-12 ...shuffle over to 514 Union st	1423406102	564432217976614912	f	snowdaytruck
!!! Our shop 8:30am-6pm w/food & Treats!! This week, Val treats& gift boxes @ truck, shop & special order! 521 Court st brooklyn	1423404258	564424486296907777	f	thetreatstruck
Parked on St. Marks Place and 3rd ave 10:00-4:00\n\nServing breakfast all day (or until we run out)! Also our full... http://t.co/OlL5eciCRW	1423406687	564434671434739715	f	veganlunchtruck
Happy Sunday! Check out our menu at @bkflea's WinterFlea, 10am - 6pm. 1000 Dean Street.	1423407606	564438529007050754	f	milktrucknyc
RT @JohnJCampbell: @UrbanAdventures @dubpies @waffletruck @VeganLunchTruck @SnowdayTruck @KorillaBBQ How cool is that, @dubpies!?!	1423407552	564438302443728897	f	snowdaytruck
@SandyShylady @newyork_bites 15 Ave B by 2nd street	1423412064	564457227994812416	f	waffletruck
Now this is great Sunday cheesesteak weather! ! Come visit us at Broadway & 18th St till 7 pm GOT WHIZ?	1423413719	564464167961493504	f	carlssteaks
@lily_g21 The thanksgiving sandoo, portabello carpaccio, maple mustard tempeh are all not spicy. Also You can ask for anything toned down	1423412650	564459685030690817	f	veganlunchtruck
this week's schedule:\nmon & tues @dumbolot\nwednesday Broadway & Bleeker\nthurs old slip & water \nFriday @starrettlehigh outside on 26th st	1423415144	564470142739185666	f	sweetchilinyc
Vedette @ 59th & 5th Ave till 5pm \nKOTMADAM @ 24th & bway (Flatiron) till 8pm	1423418461	564484056914866176	f	waffletruck
CARTS\nGoesting @ 66th & Bway till 8pm\nPagadder @ Brooklyn Bridge /City Hall  til 8pm	1423418453	564484023339454464	f	waffletruck
TRUCKS\nKastaar @ Forest Hills till 4:30pm\n\nMomma @ Bay Ridge, 86th street btwn 4th & 5th ave	1423418440	564483970533167104	f	waffletruck
Sunday!! dinges\n\nLe cafe @ 15 Ave B till 2am\nDe Wafel Cabana @ 35th & Bway open til 11pm	1423418435	564483949813329920	f	waffletruck
RT @PureCanadaMaple: BIG line of people hungry for FREE maple treats on Natl. Maple Syrup Day! ILoveMaple @SnowdayTruck @PureCanadaMaple h...	1423418451	564484014162313220	f	snowdaytruck
Making delicious arepas ! Come visit us at @gansmarket @ Gansevoort Market http://t.co/O3UIWgeBBx	1423420471	564492487830831104	f	palenquefood
http://t.co/mFjzfMY9ci	1423423303	564504364665290753	f	waffletruck
Moochin' off this Lincoln square foot traffic. 67th and Broadway!	1423422310	564500202107596800	f	nautimobile
This week:\n\nMon: 48th/6th\nTUES: water/Gouvernour Ln, AND Dinner on 4th Street near Washington Square\nWEDNESDAY:... http://t.co/ssXs1PztRI	1423425704	564514434912358401	f	veganlunchtruck
I posted a new photo to Facebook http://t.co/oJ0WamLCde	1423431886	564540367635484672	f	polishcuisine
I posted a new photo to Facebook http://t.co/SKulzj3Fb5	1423431793	564539974138474496	f	polishcuisine
I posted a new photo to Facebook http://t.co/Ia1SJReJx0	1423431612	564539217402163202	f	polishcuisine
I posted a new photo to Facebook http://t.co/6WQNGYMaKZ	1423431474	564538635937394688	f	polishcuisine
I posted a new photo to Facebook http://t.co/atag6GbhW3	1423431370	564538201088724992	f	polishcuisine
I posted a new photo to Facebook http://t.co/qTvzGX32Wa	1423431125	564537174486687744	f	polishcuisine
I posted a new photo to Facebook http://t.co/EjCmPi5yFm	1423430936	564536381716692992	f	polishcuisine
I posted a new photo to Facebook http://t.co/hNBkWPbPbL	1423430863	564536073188306944	f	polishcuisine
I posted a new photo to Facebook http://t.co/m831Jr304a	1423430796	564535795051409408	f	polishcuisine
I posted a new photo to Facebook http://t.co/S0oMYBFwh4	1423430714	564535451651145728	f	polishcuisine
I posted a new photo to Facebook http://t.co/Kf2x7qdTpQ	1423430627	564535083068325890	f	polishcuisine
RT @Tinman2IronMan: Who do I have to thank for calling @waffletruck to my block! GodBless the FoodTruck http://t.co/l0OX91hEfk	1423431478	564538656099409921	f	waffletruck
@RelativelyGreg diets are bad for you.	1423430496	564534533769670656	f	waffletruck
@BonitaS646 Sunday is your day.	1423430474	564534445135626241	f	waffletruck
@andhiqscoza finally finally!	1423430458	564534374780395520	f	waffletruck
@justprogga so precise! We do post all locations here on the twitter every day.	1423430434	564534276906307584	f	waffletruck
@5ThingsToEat a fine place to start, we say!	1423430395	564534112602824706	f	waffletruck
@ColleenMKeehl sappy profession of longing!	1423430368	564534000145145858	f	waffletruck
@FliposaurusRex yes!	1423430333	564533853617152003	f	waffletruck
I posted a new photo to Facebook http://t.co/YRR5KUe8LC	1423432211	564541728552939523	f	polishcuisine
I posted a new photo to Facebook http://t.co/NksozCIM2S	1423432036	564540994436083713	f	polishcuisine
I posted a new photo to Facebook http://t.co/cl6wSjXoFR	1423431949	564540629754314757	f	polishcuisine
Meet our Nuchas: (R) SHORT RIB Creekstone Farms slow braised in red wine, onions, peppers & fresh herbs.... http://t.co/QP79KLCXEj	1423434243	564550253626793986	f	nuchasnyc
Need a handheld snack for your commute? Nuchas is the answer!	1423433911	564548858030858240	f	nuchasnyc
@Anna_LisaD till 9:30pm	1423439397	564571868624355332	f	waffletruck
Sound for the Grammy's at all 4 Shorty's locations. See you tonight! Shortys GetItShorty GetPhillyWitIt http://t.co/jszgnEHsoT	1423435925	564557305942114304	f	shortysnyc
I posted a new photo to Facebook http://t.co/TtVzIAQSC9	1423441285	564579786350424064	f	polishcuisine
I posted a new photo to Facebook http://t.co/iBEcrOEY9W	1423441196	564579413749026816	f	polishcuisine
I posted a new photo to Facebook http://t.co/qKLHxaZOR3	1423441097	564578997829652482	f	polishcuisine
RT @MurphGuide: NYC bars showing The Grammys tonight: @DoubleWideNYC @MisterDennehy @shortysnyc @legionbarbklyn @BrotherJimmys (UES)	1423444267	564592297426550786	f	shortysnyc
@CultureTripNYC Thanks for being our 100 follower! for that a plate of paste of your choice will be on the house! Ciao 	1423447993	564607921838112770	f	pontirossifood
RT @GunHillBrewery: Happy to announce Nuchas (@nuchasNYC) and Gorilla Cheese  (@GCNYC1 ) will be serving up food for our One-Year... http:/...	1423451797	564623880120446976	f	gcnyc1
FashionWeek we have 1 truck left for fashion  week.. the gorilla has a grilledcheesegoodness  suite feed ur people ComeToTheCheeseYo	1423453373	564630487055237120	f	gcnyc1
@samanthalynn_ we sure do! We cant wait for Paczkifest;)	1423455265	564638425224347648	f	polishcuisine
Jocelyn trying to get people amped up for chicken tenders and America! https://t.co/TBbP5oxidY	1423454626	564635744158113794	f	usafoodtruck
Hey John do you love Valduccis pizza !!!!!!! http://t.co/jPJSf1ZrSA	1423473116	564713298210594816	f	valduccis
It's beautiful but be careful !!! http://t.co/Sl1hByRrcB	1423474269	564718134389923840	f	valduccis
Good morning. Truck open west 4th street NYU. Come!!!	1423483090	564755131032686594	f	carpedonutnyc
Happy Pizza Pie Day!	1423484180	564759704073932800	f	neaexpress
Hi folks, for the near future the truck will only be out Weds @RoyalPalmsClub &Thurs in Midtown or @DowntownBklyn Metrotech. See ya there!	1423489450	564781808672604160	f	morristruck
What's up with that? ;-) RT @JosephAFarrell: read article on FoodTrucks in @nzherald & wondered why @dubpies wasn't contacted for comment!?	1423490281	564785292352450560	f	dubpies
Peeps. We are off the road today.	1423490452	564786011033837568	f	fritesnmeats
RT @TheGRAMMYs: Congratulations to Album Of The Year Winner @beck! http://t.co/RHYlQN0NMz	1423493329	564798076515528704	f	toastmonsternyc
The Shuka Team is out for a 2 Day event in Brooklyn! See you Wednesday on 21st St & 5th av ! http://t.co/UlOkuInlDu	1423494013	564800943921692673	f	shukanyc
Good morning everyone, today we will serve lunch at Hanover Sq from 11- 3 see you all soon schnitzitruck order online @www.schnitzi.com	1423494295	564802128783237120	f	schnitzi1
The Shuka Team is out for a 2 Day event in Brooklyn! See you Wednesday on 21st St & 5th av !  feeling thankful	1423494068	564801177284780032	f	shukanyc
To Play it safe we are off the road today...\nUnless of course u need us for a private event....\nStay, warm,dry and on your feet	1423495442	564806940392685568	f	gcnyc1
RT @dumbolot: We got @SweetChiliNYC and @MexicoBlvd in the lot today!	1423495467	564807042997977088	f	sweetchilinyc
Rise and shine New York! You can now have arepas in your home or office without having to face this bitter cold http://t.co/ifZ6wXzqJ4	1423494976	564804985415020544	f	palenquefood
Freezing rain and snow won't stop us from making the best pizza for our customers! Happy ... http://t.co/Glp9F8e90j http://t.co/8VG1KII51P	1423495911	564808904115503104	f	neaexpress
Schedule change!!! This week we are in DUMBO @dumbolot today, tuesday AND wednesday! Perfect excuse to try something new this week Woohoo	1423496016	564809348137107456	f	sweetchilinyc
That's right! We now deliver. So stay at home and go to http://t.co/V66LWFykoZ for some delicious arepas  http://t.co/ANqnjHX4Tc	1423496506	564811400095469569	f	palenquefood
!!! Mon, Feb 9th no truck today! (We'll have spots Wed/Thurs/Fri) !! Valentine's Day treats! Deliveries & gift boxes!!!	1423495845	564808630180929537	f	thetreatstruck
Off the streets today due to weather conditions..	1423496913	564813107076534272	f	disosnyc
RT @dumbolot: We got @SweetChiliNYC and @MexicoBlvd in the lot today!	1423497565	564815842131853312	f	mexicoblvd
Buenos dias DUMBO! tacoheat @MexicoBlvd Water&Jay	1423497545	564815758187061248	f	mexicoblvd
@mishegas we soup every day	1423497153	564814116926156800	f	schnitzi1
@willoughby had to get something fixed.  Coming right back.	1423497241	564814484280471553	f	veganlunchtruck
Off the streets today but catch us back tomorrow on53rd & Park!	1423497811	564816876497154049	f	biandangnyc
Off the streets today catch us on King & Hudson tomorrow!	1423497653	564816213671284736	f	domotaco
Taim Mobile is CLOSED today, but our West Village and Nolita stores are open, and warm!	1423497920	564817332447768576	f	taimmobile
Having an emergency this morning.  Had to go deal with it.  Hoping to be back on 48th/6th in time for lunch. \nWe... http://t.co/mrmrZidLYL	1423498184	564818440297660416	f	veganlunchtruck
@lallenbaugh no.  Sorry.  We will let you know when we are en route.  Had an emergency	1423498035	564817814041927682	f	veganlunchtruck
Awww.... shucks RT @davne: @dubpies @JosephAFarrell what is becoming typical poor reporting at @nzherald to miss NZ's preeminant FoodTruck	1423498660	564820434701807616	f	dubpies
@AlicesArbor not us, but we're most mornings to grab an omellette on the run! cheers	1423498636	564820336945147904	f	dubpies
PieTruck not at the @DumboLot today, sorry.  Freezing rain scared us off. Big ups to @MexicoBlvd & @SweetChiliNYC. Hardcore.	1423498574	564820075589697536	f	dubpies
Good morning back to reality and recharge those batteries.\njoin us for a tasty lunch!!begins at 11:33	1423498827	564821135062495232	f	etravaganza
Good morning nyc!! We r ready to Serve at 47th st btween park and Lexington ave. plz stop by and enjoy thank you !!!	1423499002	564821871368364033	f	bobjotruck
Pre order to skip the line sweetchilinyc@gmail.com \n@dumbolot 1130-3! \nHappyMonday lunchtime sunshine http://t.co/zReveuTxdm	1423499100	564822283748147200	f	sweetchilinyc
Wow its windy and cold! Nothing that a Carl's famous Cheesesteak cant cure Charlton st & Varick st till 3 GOT WHIZ? @WSoHotrucks	1423499185	564822637507923968	f	carlssteaks
Having an emergency this morning.  Had to go deal with it.  Hoping to be back on 48th/6th in time for lunch. \nWe will let you know asap	1423499195	564822680788926465	f	veganlunchtruck
We are off the road today but our catering hotline is open! OldTraditionalPolishCuisine@yahoo.com	1423499596	564824362575233024	f	polishcuisine
Located on 53rd between. PARK & MADISON	1423499765	564825071978823681	f	thepocketful
@Chris_Quartly Here's to hoping for a Monday with some better weather!	1423499767	564825080187076608	f	taimmobile
Catch Bessie today on Church St. between Walker/Lispenard! Call 6465046455 or @FoodtoEat.com to preorder. Sandwiches always @houstonhallnyc	1423501518	564832421783547904	f	milktrucknyc
Correction folks back home.ON Hudson corner of king st	1423502059	564834691430481920	f	carlssteaks
@frogfisherman we are off the road today	1423501658	564833008977727488	f	hibachiheaven
Today no mobile wafel dinges on the streets! Get your dinges at the Wafel CABANA or in our East Village CAFE! http://t.co/yDrDFRc6SZ	1423502217	564835354071818240	f	waffletruck
Not going to be out today at all.   We are really sorry for any inconvenience.	1423503782	564841920808386560	f	veganlunchtruck
Teaming up with @yellowchairexperience today to delivery some special treats for V-Day! Y... http://t.co/zd1JGVu3Xk http://t.co/o63RUW8tpb	1423506580	564853655195897857	f	neaexpress
RT @yellowchairexp: @NeaExpress getting ready for @yellowchairexp takeover specialdelivery HappyVday hotsurprise NationalPizzaDay http:...	1423506001	564851227008454656	f	neaexpress
Tonight at midnight is the deadline to order valentines treats from the Cinnamon Snail!... http://t.co/xI48vXAk68	1423506189	564852014908461059	f	veganlunchtruck
Teaming up with @yellowchairexperience today to make some special deliveries for sweethear... http://t.co/70jkbshqiO http://t.co/bH8hD7Tlgo	1423511996	564876370430689280	f	neaexpress
Mmmm, Margherita. Happy nationalpizzaday! pizza dailypizza eeeeeats harlem wallstre... http://t.co/NqE6Pb3FGf http://t.co/0apvq1zrqk	1423511994	564876364579631104	f	neaexpress
Shrimp Mountain (not an oxymoron) piled high on our Arugula & Shaved Fennel Salad  http://t.co/EpicPnXm7S	1423513543	564882859388043264	f	mexicue
Keeping up with the trends of the modern restaurant industry, RedHookLobster installs a door to their... http://t.co/pWGi60TDFG	1423513818	564884011504660482	f	lobstertruckny
RT @BalaboostaNYC: Does Israeli food exist as a thing, or is it constantly evolving? Hear Chef Einat explain:\nhttps://t.co/6ATxAKcE1P n...	1423516815	564896585411469312	f	taimmobile
@bethjreed we will be there!	1423523151	564923159464644608	f	veganlunchtruck
@joshuajgrubbs depends on what you like, but all is good. We stand prepared to receive you.	1423524937	564930650709688321	f	waffletruck
@xnabz1 just go to any of our locations and do the thing and receive your free dinges!	1423524873	564930383423500288	f	waffletruck
@joshuajgrubbs yes yes. Do this thing.	1423524836	564930227554365440	f	waffletruck
@beardbacon @gcode_420 get back to town quick!	1423524798	564930065947832321	f	waffletruck
I posted a new photo to Facebook http://t.co/QXCFwfY3Vj	1423527296	564940544896679938	f	polishcuisine
I posted a new photo to Facebook http://t.co/HI5kPDEZBG	1423527191	564940103781740544	f	polishcuisine
I posted a new photo to Facebook http://t.co/3Udu8dwugN	1423527110	564939762075574272	f	polishcuisine
I posted a new photo to Facebook http://t.co/KJmkSdX63L	1423527015	564939366586675200	f	polishcuisine
RT @Metrochai: Sorry folks. No vanilla Chai today. Another misfire. :( \nBe ready thursday though.	1423527079	564939633050791936	f	waffletruck
Don't forget....\nSurprise your favorite dinges with this wafelicious gift! dingeslovebox http://t.co/rvwneEtn4R	1423527074	564939613618204672	f	waffletruck
Hey folks thinking warm weather , kickin it old school tonight in Brooklyn @RoyalPalmsClub some shuffleboard I think I saw grandpa Morty!	1423528192	564944302959501312	f	carlssteaks
I posted a new photo to Facebook http://t.co/suydyetkkd	1423535698	564975785514397696	f	polishcuisine
I posted a new photo to Facebook http://t.co/F3FQCRKPrn	1423535558	564975195648425985	f	polishcuisine
@_SoloDovePR: I need the @waffletruck dingeslovebox in my life. She said it	1423540448	564995706730348544	f	waffletruck
@grimmtales02 we love you too!	1423560872	565081373346902016	f	waffletruck
@MitchNYM has yet to be determined.	1423560849	565081277582569473	f	waffletruck
@joshuajgrubbs we do indeed!	1423560807	565081098729037824	f	waffletruck
good morning Midtown we are on 46 between fifth and sixth come get your yumyum	1423573285	565133435979964416	f	hibachiheaven
Thank you Channal 10 Israel ! Today the Shuka truck is at a big Event in Brooklyn ! See you Tomorrow at 21st &... http://t.co/sqC6VSp0OE	1423573634	565134898466676736	f	shukanyc
http://t.co/NQ0qKctdUh	1423573449	565134125158244352	f	shukanyc
Parked on 55th/Broadway  8:30-3:00\n\nHot coconut curry soup with chickpeas\n\nSmoked chili bourbon bbq seitan burger... http://t.co/hUvS7CXTHl	1423574995	565140607342215168	f	veganlunchtruck
Hanover Sq between water & pearl today FinancialDistrict \nLimited Paczki today	1423575192	565141435436261376	f	polishcuisine
Parked on water/gouvernour lane  8:30-3:00\n\nHot coconut curry soup with chickpeas\nBourbon bbq seitan burger w/ jalapeno Mac n cheese	1423576661	565147597078548481	f	veganlunchtruck
Serving lunch in two locations today!\nWe have a pop-up at @DavidYurman. 27 Vestry Street\nAnd also at 50th Street btwn 6th and 7th Avenue	1423577106	565149462088392704	f	bigdsgrub
50th Street btwn 6th and 7th Avenue. Full truck menu and some Khao Cart menu items. Preorders call 646-543-BIGD http://t.co/NQbbHeqdZ6	1423576939	565148764147830784	f	bigdsgrub
Stop by our truck for a delicious grilledcheese, today @ Water St/Broad St. 646-504-6455 or @foodtoeat.com to preorder!	1423578616	565155794685947906	f	milktrucknyc
RT @Metrochai: Fight the cold weather with a FREE cup of Vanilla Chai. Today @waffletruck 15 ave B location ONLY.free http://t.co/niE4b7Qj...	1423579360	565158917169491968	f	waffletruck
Lunch on 48th bet 6 and 7 ave.\n\nCall in orders to: 917-756-4145	1423579601	565159926927212544	f	disosnyc
Back at it on 53rd & Park today dumplings buns and paigu nom	1423580109	565162055968096259	f	biandangnyc
Located on 50th, between 6th and 7th	1423580152	565162239997784064	f	thepocketful
Almost ready on Hudson & King! Come n get it SoHo!	1423580063	565161866146496512	f	domotaco
Lunch 2day @ 10 Hanover sq b/t water & pearl st. Burger of the week THE ELCUBANO preorder 9172929226 fidi	1423580603	565164129376149506	f	fritesnmeats
RT @dumbolot: Double down with a dose of @SweetChiliNYC along with @carls and @DeliNDogzTruck today!	1423580512	565163748093341696	f	sweetchilinyc
Back at it on 53rd & Park today dumplings buns and paigu nom http://t.co/dj9scO9Gge	1423580561	565163955182522368	f	biandangnyc
RT @EinatAdmony: New special at @BalaboostaNYC! Braised 3 Lemon Oxtail with Roasted Jerusalem Artichokes, Olives, and Cilantro. http://t.co...	1423580449	565163482132525056	f	taimmobile
Sabores de Mexico @MexicoBlvd http://t.co/bCxpHpJK2j	1423581671	565168609815973888	f	mexicoblvd
46 we are here serving lunch from 11:30 until 3:15 get some schnitzi schnitzitruck schnitzel foodtruck kosherfood 5&6\n@www.schnitzi.com	1423581869	565169439255982080	f	schnitzi1
The SGRT is on Varick/Charlton \nWith a little taste of Mykonos\n@WeWork @HudsonSquareNYC	1423582659	565172755515994112	f	souvlakitruck
Get ready for Polish Tlusty Czwartek Fat Thursday @grubstreet @eaterny  @HuffPostFood http://t.co/Uh1LuzNN9s http://t.co/DrQSjCDlaB	1423582997	565174172297756673	f	polishcuisine
Are you ready for Tlusty Czwartek? AKA Fat Thursday?... http://t.co/5JoMSr6iC1	1423582376	565171566531850240	f	polishcuisine
Truck is at 55th and Broadway today. See you soon!	1423582853	565173569265885185	f	papayakingtruck
Hola Midtown! TacoTuesday TortaLovers VeggieFlautas @MexicoBlvd 46th St (6&7)	1423582355	565171478862512128	f	mexicoblvd
Nick Jones Loves Valduccis Pizza @greenboxny@FoodNetwork@Foodtruckgirl7@foodNfest bestpizza bestcatering http://t.co/4kOI01uRLQ	1423582891	565173728552947712	f	valduccis
We have a truck at 52nd and 6th for lunch!	1423583753	565177343283822594	f	neaexpress
RT @greenboxny: Hey, @NeaExpress, @PizzaByCerte, @PizzaBolis, @WholeFoods & @PizzaLovesEmily... Happy, happy NationalPizzaDay! GreenBox f...	1423583724	565177220336222209	f	neaexpress
Find us on Hanover Sq. b/w Water & Pearl today from 11-2 FinancialDistrict Last week to help TeamJas campaign	1423583276	565175341212512256	f	polishcuisine
Vedette @ 59th & 5th Ave till 5pm \nKOTMADAM @ 24th & bway (Flatiron) till 8pm	1423583776	565177436854562818	f	waffletruck
CARTS\nGoesting @ 66th & Bway till 8pm\nPagadder @ Brooklyn Bridge /City Hall  til 8pm	1423583772	565177420886859776	f	waffletruck
TRUCKS\nMomma @ Trinity School, 91st & Columbus till 4:30pm	1423583764	565177387193995264	f	waffletruck
Tuesday! dinges\n\nLe cafe @ 15 Ave B till 10pm\nDe Wafel Cabana @ 35th & Bway open til 11pm	1423583756	565177355938050049	f	waffletruck
RT @DUMBOFoodTrucks: We hear @SweetChiliNYC @DeliNDogzTruck & @carlssteaks are at the @DUMBOLot for lunch today!	1423583159	565174851603017729	f	carlssteaks
Taco Tuesday senores.!! Delicious skirt steak,Cajun chicken or chorizo...you know the place.52nd and Park.	1423584221	565179304498429952	f	etravaganza
Warm up with hot vietnamese coffee @dumbolot jay & water 1130-3! \npre order sweetchilinyc@gmail.com & skip the line! staywarm livetoeat	1423584121	565178887433617408	f	sweetchilinyc
50th Street btwn 6th and 7th Ave. Preorders call 646-543-BIGD http://t.co/8dTgWfaToY	1423585572	565184971061866496	f	bigdsgrub
Hey Midtown we are Open and ready to roll so come get your ginger on.	1423585492	565184636238970880	f	hibachiheaven
It's Taim Tuesday on 20th/5th! Carrot Coconut Ginger soup and Harissa falafel for just $9.50. nycLUNCH vegan	1423585120	565183076490547200	f	taimmobile
@sorrysorryari @StephanieGent @HuMpDoCTor17 Day=Made. Harissa falafel, on 20th/5th!	1423585025	565182675292782593	f	taimmobile
Now serving at 47th & Park!	1423586518	565188941058277376	f	korillabbq
Your lunch is waiting on 20th/5th. Harissa explains it all.	1423586088	565187137885446144	f	taimmobile
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: pepp
--

COPY users (id, email, password, admin) FROM stdin;
1	peppage@gmail.com	$2a$08$U1gc9WCfAwjTicIM7nUuS.v0spiLrGBUPk711WKesep9cNBAbTX/G	f
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pepp
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Name: images_id_key; Type: CONSTRAINT; Schema: public; Owner: pepp; Tablespace: 
--

ALTER TABLE ONLY images
    ADD CONSTRAINT images_id_key UNIQUE (id);


--
-- Name: locations_display_key; Type: CONSTRAINT; Schema: public; Owner: pepp; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_display_key UNIQUE (display);


--
-- Name: trucks_id_key; Type: CONSTRAINT; Schema: public; Owner: pepp; Tablespace: 
--

ALTER TABLE ONLY trucks
    ADD CONSTRAINT trucks_id_key UNIQUE (id);


--
-- Name: tweets_id_key; Type: CONSTRAINT; Schema: public; Owner: pepp; Tablespace: 
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

