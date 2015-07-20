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
    visibility text NOT NULL,
    twitname text NOT NULL,
    menu boolean
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
    hood text NOT NULL
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
    message text,
    date integer
);


ALTER TABLE messages OWNER TO mca;

--
-- Name: sitestats; Type: TABLE; Schema: public; Owner: mca; Tablespace: 
--

CREATE TABLE sitestats (
    "time" integer NOT NULL,
    uptown integer NOT NULL,
    midtown integer NOT NULL,
    downtown integer NOT NULL,
    brooklyn integer NOT NULL
);


ALTER TABLE sitestats OWNER TO mca;

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
545d48d2498e3e01487425a1	/8418727_ueAVzhZe5huI9alIjmHct6sTu6gQ4RyIUDXP0_qGF4M.jpg	public	kayanyc28	f
51c1ea41498e372d91835cf9	/5067950_pSXIZo_RqO8Hh5AuWcomjr0p3q_pXPUMWe99W8hUGTU.jpg	public	burgersandbites	\N
51a79983498e3044671cd784	/1441492_yfySwml4ChzJ_ni5DxTq-8n2UlecWBWjgxR-ygA6pYc.jpg	public	burgersandbites	\N
526e8aee11d299d16e74b447	/67629862_ZPeS1alTFabw1hPqq8PCcGF1SRFynqA23OgkKg8yc00.jpg	public	lovemamak	\N
521b83c411d29ec0512f89b3	/255980_1U9yRWzBKuIDLReBhmBs45qJ0mtHu7pzL_Fv4T9gTss.jpg	public	lovemamak	\N
501c284be4b07d0ab63e08be	/vQv8P8_hFNwHMmpR7k6-arr8zqYmmgoSG_aAPJuz-ws.jpg	public	itizyicecream	\N
51e83b4a498e0a1c64e62828	/26624_AGoljLki5SS-GJGKaAGB75mloHKRBkJ1Qj5BQCRP1_Y.jpg	public	itizyicecream	\N
5180207390e7374e46b6c165	/49563206_uKsSD-Cd2jjy6FMyR9U_--7DdUBJ7ZUxtdlushxyIAg.jpg	public	freshandhearty	\N
5165924de4b093be3bc5cd57	/2159706_uFl3RYgA1z4EiDNp8PtjjG2HHWhTiiXDLNzJtFWPHS8.jpg	public	mactruckny	\N
556f5fda498e63fb4eda1f61	/68150_wqjx6504Fhkiz_LfsnouqTZvlLmrDMzJu96d8eZO-yw.jpg	public	mamasheros	t
525b3a3711d2040fdcbd6fee	/52031712_DN0C9vfm3iv1geUuFX92Pt0jwgl8NhbGokLj_o0Ebjg.jpg	public	mooshugrill	\N
51d31ab97dd28a271207af20	/59958053_5CogfmHgRpBtjkPzVkAgAjK7q9ac0bo8Z1TPwxPIFAw.jpg	public	grillonwheelsny	\N
535d6fe9498eeb428f0a49a5	/643701_B0msQNcQCClAiTuYbiNnskLICf99ehNmerkWdhYNR8c.jpg	public	snowday	f
533ddd9a498ebf7fb4775ca2	/36814481_r4TU0Q7tJ6Xum58iZ5olLRY6sV-P4dN3psrhw2ZZKZ8.jpg	public	snowday	f
4ff318dde4b0444717bb6c21	/7p0pVfwa2IPX5eoAqan3mf43CoVnVrHHztgDqMGA6aE.jpg	private	korillabbq	t
54978669498e92fb4a6b4341	/97520198_KIqmbmLkuFxboBU_HjFosEOXtwVA01QnxiBHugrwImE.jpg	public	shukanyc	t
52e456f2498ea9ece32b66e0	/25812424_w-pfXOZy2D8xWVJY37hGi4VXYiDnicBFvWRiiDOnNhE.jpg	public	carlssteaks	f
5203e16e498e9e8e0a93b61a	/702028_Fog-6PEF03KateivIPP-hx87Qn6gi7PwnaJv-wTFv3I.jpg	public	carlssteaks	\N
4fd0f054e4b0757383b97c0f	/MbR1inb3VKXu0PQMsCkHkHGftYq0E8CDbYG3BLRRGaE.jpg	public	thecrepestruck	\N
52a0bef911d299250c89f9c7	/349672_Cg8dtcrfQ0WZeSo7BJR61YBG6VzsiMltZP8XIqyHiu0.jpg	public	mrniceguytruck	\N
529ccbc511d21047117cdea2	/68150__CRf8sW9KvXZTkcAQEc4EsnYPgqXA2trmMxy-_AzobY.jpg	public	mrniceguytruck	\N
51c8a3c5498e797153ec5629	/46314126_95x6AErCZEGSi1zGZrFCY-EzgsIMyOhgO4G59l-u_Xg.jpg	public	funbunsnyc	\N
5212ec18498e9494b634a94c	/814104_tUkLgiQ8zcYxovra9R8PIx7FckFhBjzNVHmirteXd58.jpg	public	funbunsnyc	\N
4f67b0d4e4b08559c4c60149	/SdNxRS0joKXurf0FEv8_SRg-GeR9lGCN098_ZB2tijA.jpg	public	mexicue	\N
507efae0e4b09a52c022ec3a	/39213_nH-zcqfLCJqMvG0Nco0LWE4QuRuoL6unlEXJlJbTEF4.jpg	public	mexicue	\N
501fe830e4b0bbddce992f90	/fFBOGONZt5Zr77Vc5g8adoAiBht0f-MBut7GqorVEjo.jpg	public	mexicue	\N
523c930a11d22e1c3012a9d3	/34169985_AiTXirGu6jTaGeWWhhOfl2QIbGVaQjdDg1QCEakqza8.jpg	public	mexicue	t
50784742498ec6be8cd3f88e	/155927_ebZApDyXpTKTmvOQHdBTxNc2wJrsZV2QASmpYTNAVJM.jpg	public	mexicue	\N
519a7e33498e6e4ea6ff66f1	/3354_e_1JMupbEA8VtOBVXgLHAvtJGQwcpHvY2JyFESXYSjo.jpg	public	thesteelcart	\N
51dc0e71498e8db4f9a8106e	/4456614_ZWvsB80ogvwYkoKIyVf6q5RfcDXwuKI4t0XJJhyLQ_I.jpg	public	thesteelcart	\N
556f5fe0498e71287f7c3e06	/68150_DEYnBJz_XjQjQWbq4QTnfip2-TEt4cDPYPIaF4zm9lg.jpg	public	mamasheros	f
51645882e4b0bcb0cb0c7ef3	/7511393_dEJJLGO8ljFPMA_kFidoz1wpWZ-k6mHpqYnuRwoBpRg.jpg	public	philssteaks	\N
52fe5db111d2d7644f04c21e	/404119_k2pARWK6AW8sOni-GGVsAfTehHeRbbnRCBGhfeb1xZc.jpg	public	philssteaks	t
507071bfe4b06e882e74b445	/1112203_qnT5k-31-4cRKDz00cUpp7Ia7HG3YTjhsC9Udo90RDI.jpg	public	philssteaks	\N
5176cceb498efe500552cc9e	/21735785_zaQs-7anNinrrQlobBV2AjNxquTXs5g8ZY0NxvoxvHo.jpg	public	steaksncrepes	\N
523b2edc11d265bf373f82a0	/8853695_cjpq3trk4bFpcU1oHWwj4XxwwD9ZI169sNncUyOQoM8.jpg	public	steaksncrepes	\N
526fef71498e92d1ace459d9	/60805368_eCRrBwapYrNL8fM9tmIaLCfnlhQYb9ASU-ZkaR1Og54.jpg	public	mamuthainoodle	\N
4da8977840a3582fb8c49316	/MCGIPRA0XR15JNG4O2YZJQBCRMK05UVTC4T14TOQWRTNMQFZ.jpg	public	eddiespizzany	\N
4fd79157e4b071eb33a9c810	/8zrcTIejD5EBiOJzSobql1_PQWr-i2KmRfgMCYmbK-M.jpg	public	eddiespizzany	\N
4f9c18b0e4b0b38d2f554383	/AQEKYbyPrQt5uMWhy4r4ODm2vSMCqPseJyMhcg55mtY.jpg	public	eddiespizzany	\N
4fb29dc4e4b0e08c1e225555	/ckjwTj4Fd2cRoZvDQZw_1jYdwuBF4BsfV4ZWc5oElFo.jpg	public	eddiespizzany	\N
532879fb498ec68315b3d232	/68150_KF6qgT-viSOMS5bt3lJarsNeEUjlVJn1lbAypyCl1js.jpg	public	dubpies	f
53287a0c498edd9a0567c2c0	/68150_i3UKBmIXHPN4h7gtvSQjnYfikUNmJuGRpjwKP2dLI5Q.jpg	public	dubpies	f
5345d100498eaa611b76f338	/62345083_i2VdE3VeEPlbfUgNv9mWmVmsuL19upJhcHaRX3zje1w.jpg	public	dubpies	f
5328764d498e217e55fa24e1	/68150_4QSMIi6zBoyrZ1VeH1Dqb3fEovQswz93yHAPvf2lGmQ.jpg	public	dubpies	t
5197cb68498e8d409a89ec1b	/1847096_oRB5R_owQW40gVWlJhNNsh9_0bEq2D8Rt3Zod9HUbUg.jpg	public	disosnyc	\N
5199097e498ea36447e54093	/40899881_hbjUdavpBfT-sLaBhv3pbZydT1tgs9v-Maw12j9I3Xs.jpg	public	carpedonutnyc	\N
4fda1cf4e4b0f6aceebbdb2d	/lKL7uz06jZgB680Vye9zxa_2yQfH96afFExvxaLlRpU.jpg	public	hibachiheaven	f
52e6af38498e26e622e5398c	/4147709_E9hzkLfHAJjdgQ6RT3W29cf-cftJShyXpRthu8riZYs.jpg	public	hibachiheaven	f
52e2aa07498e25b9a084ee94	/12998378_50qpDzH_XwsSlaJpw-f2fDtJsSvQg4TU_ujjdsnyWOw.jpg	public	hibachiheaven	f
5362891011d2b40c5f328b6e	/41834822_k1LVelyLVM9gsNt3M70sVjI-QLm_84bgv4c6hoMHPO8.jpg	public	hibachiheaven	t
538fa2da498e8efc80bc2cb7	/26065139_jgo2VLUL2PokQdo7SP2iJ6rtca8E552GZGM3Bhu1e28.jpg	public	langostruck	f
511d2c60e4b017a4221bec0c	/1425622_srSMuVL9KOV8rqb_UDiSQNwjvNOtMyF-zeTO7sHRZZo.jpg	public	nuchasnyc	f
50ef1f18e4b0710a5e5cb1eb	/117715_4lM2ZgzHp4Uv61-ckuWzdXXXcPVNEH2NjISpWAEjGds.jpg	public	nuchasnyc	f
4ffef65ae4b013ea5f373be1	/VqxEh6cK784gtMOJRF6Lnub985jBJPC6-FuwZwXt_y4.jpg	public	nuchasnyc	f
4feb6e00e4b048145c547997	/wcCcDDUFo3EAkWygR8pGn29HTAv7VKEvPwJgzS6hQcw.jpg	public	andysitalianice	f
516ee142e4b04f28d58be309	/36812449_DjR1ynMnMpwj-KmiWPZQldmGQwJ2IEzjSwwmGevqe3U.jpg	public	sweeterynyc	\N
5107e09be4b047c08ade6bf6	/760350_ZaalKVnOYdVAGoQEdugu-1Lws1LubyJBOVpZvJJD1V0.jpg	public	sweeterynyc	\N
50188a43e4b0d35e6d8035b4	/b-fKh6mx2WxCybNQkr9ovk_jv4x7bwJPVFM9RF3M5T4.jpg	public	sweeterynyc	\N
51ccc251498e028212e9b1e3	/117715_ozxp6K6iPGwKCzQDARR3BgMcisplkTt0x4LEKDJdBMk.jpg	public	nautimobile	\N
5022f267011cfeafe81dab9a	/7EPnN8ReXYQWoZYxzqkH9AQlOe8vFPtVP_60n65i9U4.jpg	public	nautimobile	\N
4e09f3fca12d09aa881a769f	/NTSOFYDIBYVWGE4RYQTBBNIAQESPZ1LLW3Q4TC3TGMROSJPH.jpg	public	nautimobile	\N
4e70e35c52b140871b6fa35f	/1TB5ROKJY5NF0GAVS4YS3WZTFCUXXHTPLLBUIK4BU0XD0QA5.jpg	public	nautimobile	\N
516d98b8e4b0b059e50ff5ad	/117715_BoNkQJO4jPWEtg_ef4-URb7IseoIXnYiP5vkvWJtezg.jpg	public	toumnyc	\N
51716b5f498e03d8bc252c48	/11709298_S8klPxq0yPyZw2X9-_0IZyk6TFTn9xi5SWd_6BGCeVM.jpg	public	toumnyc	\N
507dacb0e4b0d8cafc9601e0	/2361939_S3NwwSNVZD-2tAhc3bwAvsYgk9tXwYv0T0yq9ci-ihE.jpg	public	toumnyc	\N
516452a5e4b0e1b216fdbaa4	/26263584_5wpEOb9FygNRBFQySA-pE1t1q_E9jVM_4mx2mnw5fAU.jpg	public	toumnyc	\N
51dd9ddc498efb9a3437e123	/4501533_djr9d2BEP8dg7E48xJjJTa_Yjk0Iy-MmBG6hgIQBLUs.jpg	public	bigdsgrub	\N
4e4e92c7b0fb088f3c0f14d5	/HTLXSW2D30RGIEYPI0JGR22LUCS5BTXQ0LXDWAOHH4PCVHM4.jpg	public	bigdsgrub	\N
513101fce4b006d9c4991bdc	/17248619_XfpmI8dNgmoeHE3BXjV8bL2yuuMTqxU3FqDr4BqX7Ks.jpg	public	bigdsgrub	\N
4fa2d04de4b0489ba3d7936d	/hsPbM0G5l3AsUaI3x6r_VkiSYo4pYlWTKK2S9zqh_KE.jpg	public	bigdsgrub	\N
5192873e498e63958610c2eb	/117715_Jf2pdeF9ztory7puWsPaFE26jmMzPEzjOfPopvTzSjA.jpg	public	polishcuisine	\N
5244712a11d295d581384a17	/22780_QXd0BtJcOWXZwSm_ZG3oXyaNj6Qw5-p8hWQzzH121fY.jpg	public	polishcuisine	\N
51424d6ce4b0041cb8df9856	/117715_oxR8_TwNSaCL-_gKDA2i2-1YoRfVVnbfT3M9Bfu4nxE.jpg	public	thepocketful	\N
511a7d64e4b0c6a64118260c	/793192_Dtd9vMRk-pbBJscn1cb7n29zM87iJjZy6rojapRhODk.jpg	public	thepocketful	\N
4f7deaf5e4b0ffb6a3f2008e	/Xho5Xq8BtpNhEQvH0KRI3yX4kUstFRwTxEDj6QoawcM.jpg	public	palenquefood	\N
51b8a845498e8ebdef064e0c	/761163_j9ai1NfaIpK2TLN8JzXbTwyIhVzuZevNHBV5EpQ7Fh0.jpg	public	palenquefood	\N
51435e1de4b07d53cf71fd7a	/4486_lUhkecOFThYlMHKai4wDp4lXXiQSPLTq3Nno5WMIz7E.jpg	public	palenquefood	\N
4e6513efc65b2dc8a0bfff6d	/TUQTIKBJPOALJKHN54QRKGISWMQDDOW3WTAECOGJ4FOJTPXI.jpg	public	palenquefood	\N
527d2c2711d2c984e85cb11b	/4179871_5FQ2eCC5ZeizUVRLh4tadgEAO1BnJjVQ7pSEvSDwIfQ.jpg	public	biandangnyc	\N
512161e0ebca7d20d6a70104	/4574_ZC6mf3ha1jNXmFUDgtNsN3zIf-NHyqgxA3WkUkOl4mY.jpg	public	biandangnyc	\N
5106b878e4b05ec869ad8b34	/814104_blIawoImaEcqf-Mg89W5A-nEHiZ5jx76BEYHVzz8dnA.jpg	public	biandangnyc	\N
520912ad11d2f941183dea9f	/13285510_v7K0PTg4FzGI822Jbc9A8K5mUHIxwJPBZB_0xNeEauE.jpg	public	domotaco	\N
50ce269de4b07c1547ebfb2c	/263293_qjcLaRmf5itOMyRiq4AyYZuY2UVjVJk04lO3FTA2CMY.jpg	public	domotaco	\N
4ec59ebacc21b428e0de466c	/4AMXSGP5YGTUHEL3TFKTS5ROVIX4HUTU4MU5ZW1OX5E3URDD.jpg	public	domotaco	\N
4fbfe026e4b04422a08a40f6	/Han8Z4R-SQ615pLoN2lRdPfKEFa6UW2yudSOxXmJtts.jpg	public	thetreatstruck	\N
51461b9de4b0bb73a6821e97	/1102787_UDt7OJpexNs8VPrehVDsp9EtfUJnMhKzJ2tTXuof06M.jpg	public	thetreatstruck	\N
516cdc93e4b0d6bb083f9db2	/117715_3eRUhgkRZGVpjDAYUz9TD5yQXPVFmg0iCB7iIgv_XD0.jpg	public	souvlakitruck	f
513b9b7de4b04f7024bc158a	/45519738_eDUGOpHYwiR5C3VUps1gQ1YDIq0Di3WMfuirGs2EVBk.jpg	public	rickshawtruck	\N
4f8dc377e4b0ca2accf75652	/EKcue5yGEyaPnBymSd_HtBxWEZl4grYSOXMhw-gqpTs.jpg	public	rickshawtruck	\N
4fb6bb41e4b066430032e4ca	/HHZWTU3POi_yJE4GU0zI_NjZNerm5y3MjjxddcV5ZMs.jpg	public	rickshawtruck	\N
5151c82de4b024888079c5ea	/5003144_g8kbTzyfr6gL9vIRpMBbXz4TqBUk5EgkqIPlBP9DtsA.jpg	public	mactruckny	\N
50883301e4b0904987088a20	/2361939_J2zcgauqqGFC_PZPyvkfEDoSufdDe5qE7gi_NkS1P1U.jpg	public	mactruckny	\N
519bb23b498e208a0b81b7fa	/9285455_LZiJ4FLH7NOWjNUsXO9jxDRFAgLygBSB8SmSIW0z9kM.jpg	public	mactruckny	\N
51ab89bb498e83fced4cefd6	/66074_8dLzCKmVRde0Uvtx_NSl9SKROFh0kat1IQgcAvU4J3M.jpg	public	delsnyc	\N
51fd732d498e415eeb8b9881	/8839239_mAp7_MVmWbbK42Xq3-W-1zmegy-MNx8NzB0P5Brf-Pw.jpg	public	delsnyc	\N
520e673a11d25d1282a44199	/117715_KjwJnc6idBB7TuMKhGboHDg8IYjlGcr6h3I6_fJECmM.jpg	public	delsnyc	\N
51b8d7aa498e103b3a36ec2d	/47900463_7B6lLfz2PW1XyrG2vCIxp4vIq7QXWEhxufI5i75jwxE.jpg	public	delsnyc	t
5012d0d5e4b06fc7ce735a68	/7J2g1YLtx4ma57g4A4CerJJ66OwudjGhFI67JaNl1Qw.jpg	public	seoulfoodnyc	\N
4f5e6b3fe4b033732b227036	/7Pw4h0QMNateMpgFd_DAFO0uUnsIdcGzmHG_1in7Wu0.jpg	public	seoulfoodnyc	f
4fb1335de4b0f4503b23a67a	/GSQxN-iFZejvploz8v8hm2QzrWiTmg6QdgBffmHvsnc.jpg	public	seoulfoodnyc	f
514e42c7e4b0ec8b7e400875	/48992751_ibL8tx_7JPvV3aQmnEevrdibtLP0jWytaChkCdRuhG8.jpg	public	crafflesnyc	\N
514e42a8e4b0d91e975b3db9	/48992751_womoOVd5bv-2KopmWjWEHA_WsyoWQITjAyXBuM4Ciz8.jpg	public	crafflesnyc	\N
506dc9b9e4b0c21f078c3bb3	/22983_XN2GbKo3a5YsNY_ZpiBcjUHTD2if3TWS8r586Uq4cEk.jpg	public	blend_express	\N
5033cee6e4b03e64bc749ee7	/tIyy6IAKcw2SSiX5JSPBCURstZZisntK_46plgrfdJ0.jpg	public	blend_express	\N
519babe8498e355d9d35fca0	/65817_6p9jSMaQMqP9QGn3KOIyuDOG15jaLxIPvsdrpZGWdj8.jpg	public	blend_express	\N
531b7d5e498e3df35f261af2	/22402741_aYe825rrQDsEq6E_Pqv35za149PBn1PcT557SaJhOK4.jpg	public	brooklynpopcorn	t
5220dc78498ebd10d150f736	/29917892_nMZHXkfxBukc2QfFqtDBTZSJ1xpMkoO7VGBJmGKkwhY.jpg	public	brooklynpopcorn	\N
50e719c2e4b0e263423e547e	/15471_4uN0tddGW5orNGh02xhxbiAOGUpAAy3rIWEotoRgB_M.jpg	public	tacobite	\N
50f99bcee4b08ca132377f78	/4611139_CEH3eveI6uxlRVQLet5Fpa_sNfJwAzfheMTYSBplO5Q.jpg	public	thecrepestruck	\N
5249c4bb498ecd25dde27c5e	/764670_x0RdEOs5TL4SEe2zGgpkzPFBFmlFV7-6UQiVtoFeHaY.jpg	public	goburger	\N
51dc5a9e498ebf7ad40223ec	/1328035_Ak3fMs2e36r7NvIE_gIDK5XZ9CwrW1DEJa3g1oobp5E.jpg	public	wingnitnyc	\N
512bbfebe4b0b8faa466c796	/1425622_4wp7wCuj7Ci1dl_FVH9syKmrJwQavMhL9uqww1b0m1o.jpg	public	philssteaks	\N
527e77d111d2e66fa6a871b3	/649454_HIWthX8nL3SZAOwyMlKj9Y7ju9GCiN4OEV-wZR6IKC0.jpg	public	philssteaks	\N
51f4589a498e97316d307dab	/186827_ilvLMlb3AFqgXUQJ43S7IjsLNPxYP3Pw5LEjrqhp6wI.jpg	public	chipsykingny	\N
505c9776e4b0643aba1071c7	/5568483_yQrtG73dbug7q06p9IASJmTFnOVgGprIZKbfHjQRcso.jpg	public	biandangnyc	\N
50ce2696e4b0881a7ef3ee67	/263293_lcA30Y_JnQGKaaHhRqFUio2HQ8UQkphCWP9yhW4CE3g.jpg	public	domotaco	\N
5079a745e4b00277f33e4836	/34723233_tCoDnWhdhZj61xi_e00MNwJoK_UcfDXCQQ7Weat8pBM.jpg	public	valduccis	\N
4fe65d6fe4b09198fde5842a	/nVmhJloDitdcBPFceYT8ajqQqgXBpB_w5GoPWse33Ks.jpg	public	valduccis	\N
4f753600e4b07eec20023ddb	/zUb4OswXiQLnF_k2xnx7AdupnEIl1nuGyIuFcmFWf8Q.jpg	public	thetreatstruck	\N
4fbfebe9e4b0a3bda0340383	/Brw9_z178IK92xMEXLCSSZrP0-99GXjutCp7dHCi5CQ.jpg	public	thetreatstruck	\N
50be4929e4b0ada0df80b932	/4611139_UjW8jF3qFz_uyk0hDKT6CMZI2q3My4j6ZiwX-68QpME.jpg	public	souvlakitruck	f
50031911e4b034c2944f0c3a	/bExPPWxN-4YhYlw2nPz-T5eA3mYN-U78LUZtcIzjTRM.jpg	public	souvlakitruck	t
52013fe1498e5f476bfdcf83	/30611522_DHhazmY8dyNAbmijjHX7jyyfVBEiugL5-GJcTLuYjS4.jpg	public	getstuffednow	\N
5182ad6b498ef6cb59d48783	/39425123_zPh6ih4GAAygbhRJ-pyPdCr5TI3rXafgKyIEEK4HpHY.jpg	public	goburger	\N
501d4734e4b0af03cf473287	/6BUHUmEyYTTh3a2SRjSYRklUlTfQBNbFnnk_hfEojYs.jpg	public	goburger	\N
523c8b2a498e959b87f8ded2	/39707564_-WCsPSk2ExKeZ8q06DtUQrpt_vcWG9-AzvFoToSdQqY.jpg	public	getstuffednow	\N
51dd9efb498ebbc846c11c03	/13001992_b9dLXH02o0ZX8hyUZVtpgGW6sDyzAl23vmEl-0Hj0jY.jpg	public	itizyicecream	\N
51af7257498e0c7f8979c05d	/752258_nUJpoSxZ8p9BBJMG5ISetpo3DDLzycLT_gT3z9fvJmI.jpg	public	getstuffednow	\N
50ca356fe4b05b0bb93edc40	/1590381_NyRIp7fXJtGoJoXp25IcMmufNufPxxvLEj3TVYXRo5g.jpg	private	getstuffednow	\N
5258d3ef11d26d03cc0563a5	/117715_GQ_O1nyBbVlKTaYpRlprc8ZdIEAEftbU4_9hDGjvxsU.jpg	public	brooklynpopcorn	\N
529fe66b498e1fd14afe696f	/68150_h0wbg6xbNwrEjXD6uaE12ZDZYF_h55LN99Es520nMBI.jpg	public	mooshugrill	\N
5267fa9611d2688bdc4587a2	/2136029_bvqot1MnMJ9IGYsYJkamqTiE_lL96OcfilWMxskhdU8.jpg	public	mooshugrill	\N
5213a7c011d27a56f99dfba3	/11074699_K2ka1_NxiELyTqgjvY3oMN70IUxIlADqRIAb5QpzsLM.jpg	public	mooshugrill	\N
4ffda271e4b03bbc7f8fd13a	/6Dtx8fj7IXT6M3O6ZV3rXryb6zKTAqPchjeOM2BJJAs.jpg	public	funbunsnyc	\N
505204d6e4b02dee62bd961a	/dcOYoRoNNeCLMxvoyAN-o9gJObcw5FljMqYpS9cps84.jpg	public	funbunsnyc	\N
5203bd51498ed50247ee01dd	/60805368_HlIeqCMjY2I5md2mzI5crKizc9wVPUZo_sBmC6zrPEA.jpg	public	mamuthainoodle	\N
5196816e498eebbaef53fe6b	/32050404_-lVnQ_kgFICQK3OBrfq4QydeDqXhz3ZCRD3TrCvMPxY.jpg	public	veganlunchtruck	f
50292d68e4b0d0acd3bb5dbb	/vv6y8qi6JFfXr9QDkIvTPP0fSmbgQ_jGXHCVwDv0c04.jpg	public	veganlunchtruck	f
516ef5ece4b0d1c83382c12f	/117715_Gt3J4FMusC7YQjSfEup4O7bAO10z8J4gxmnd0xKnZuQ.jpg	public	veganlunchtruck	\N
508af08be4b02ba9b11cc747	/17430999_28ys6GXVoaOZoKPXLLK5GQpVEL8UrC1_1DajRIy8ia4.jpg	public	veganlunchtruck	f
51dc48a3498efe9483d8417a	/117715_dlhUlP8z_jVejqRlWaCzsJBqg0eoP6rRSjOLpszFA0Q.jpg	public	veganlunchtruck	\N
51105b22e4b0a7b61fac854b	/117715_vKu0po70jlTD3qN9mXsdNiE6V5Od1hmYMVlUY9xSIP8.jpg	public	veganlunchtruck	\N
51800af8e4b07a4a57023def	/9548073_erhzj0ShEDKaz8S8DhlDe90fDjJEIWjilIxO4_zjdGE.jpg	public	thepocketful	\N
50a696b4e4b04d062582a95e	/32050404_qo6ZUnU5LQMoqrAR6YoH5Qz-PdUcD1d1jCheEJy7lng.jpg	public	thepocketful	\N
521e9e4511d2d8ddc5c69dbd	/117715_r7cpzyXCpOthqHouR5gdqIMX8k0TZ2KWHFun5wh-EYk.jpg	public	valduccis	\N
50f59e2ee4b0b31f58d6cc1f	/1922740_OhtWiNUDUcN0NE_HB3Tk8vm5qIZcvqxcP2nMDrN8dT0.jpg	public	kimchitruck	t
5197fe76498e1c056c96d21b	/117715_m462oAqyqBN12xyWCOyzYR6-1gtYrUa8BiX9r9OybE8.jpg	private	kimchitruck	\N
4e3da652d4c058f9dc087a6c	/QEOIS2W35WLTHYK00QC04LKKX4X1SYW3DDI45X30HSKTJENQ.jpg	public	kimchitruck	\N
501975c5e4b092f6a51ef338	/bI7RrGcK_moyn-kJICa1OCciBVuYYykwCMGlea6mcxg.jpg	public	kimchitruck	\N
4e00e61aa12db1129557e99c	/WSUNYIB0YFVRCTXB13UCRCTANZUG0DO0X2FWCUYYILU4TCGB.jpg	private	kimchitruck	\N
5286645011d228bbd12f9880	/1353667_2qCG26N4ikz7mbvEGkrFkcNLagGqrzRuNyeQ35CCDE8.jpg	public	korillabbq	\N
5231f54311d26e8da5827f3b	/977282_AToQDrlKW5PTNbNGQcB24_BeJNsRMgZTeYmC9P-or38.jpg	public	korillabbq	\N
528e451f11d2a93e4361f565	/977282_wEw3nDjN0NbjC4CgQ00ON0YjdtnMocrfAjXDM4UH63Q.jpg	public	korillabbq	\N
5254357b498ec4662e20c654	/2620660_kMXeinZ_B6lOrHRQnheIHMBr7p81ZxcUblWl0SQ1vEs.jpg	public	thesteelcart	\N
50ad186ae4b0b639ca7ca234	/295161_qCQYG0XjW1Ji0pSDxM7fWRzxTZRbcYyZbsbPNJo12hw.jpg	public	toastmonsternyc	\N
521649b811d2913e20a1ae87	/5568483_RtMp5aDM_JtBZOI1u48Jy3om4Z672obezdu1uA_UWd0.jpg	public	toastmonsternyc	\N
518a82c9498e068718057964	/25979758_bGWQQ7W2SJI4v7KmU891VcYZGitov6qbSNAnIEt8HTo.jpg	public	toastmonsternyc	\N
53287a41498ef1dfde86d217	/68150_jBIeF8OZP2o4q5lJjB4TeUteiuuczqDDm3s4zQGipGc.jpg	public	shanghaisogo	t
530f7b7b498e225c3989957a	/20103877_gKGG5Z15ifazVa7PoBKpyKecZK7x2dWgjFIDOkwO38c.jpg	public	shanghaisogo	f
51f15b4d498ee58fec420a7c	/13285510_Q-SBXKFpfroSwQ-QJdezzrh1KaHfHAmLyicy8d5S1jU.jpg	public	parissandwich	\N
5243126c498ea77b19b3a444	/65506790_31Qpx9E-ZjuNve-izmDY6vVxUCMrhgGsnOLn4-fusp4.jpg	public	parissandwich	\N
51b22a0a498ec00d1c45726c	/390807_y2oeK6xR54wk9b1Sfm82Ek09Auv2lNkRTpJOzos3xjU.jpg	public	parissandwich	\N
51378e9ce4b071feb46ef7cc	/18792384_RSm8zhe_6kUOxy91taByfRjTDSLp7stH7PI41aJHOrU.jpg	public	bobjotruck	\N
5249b50c11d2d415e3c6b017	/769710_HOnpTjl0b6qd4-yoPpg9lXZGBy-ZKikqzLlFWw2sQfs.jpg	public	bobjotruck	\N
4fe20639e4b05dcdf7f5737c	/l9UdGGevddtOhDk6scQjcy1-TbVBX-wf8Gf56jBIRIg.jpg	public	bobjotruck	\N
5249b1c511d23e54343ae083	/769710_HUiZ7dJrNbdnPYV-DTQRr1z0zgoxFx9KMC_Y-OQ6O2o.jpg	public	bobjotruck	t
51c213db498e0748ab0dca3c	/53641916_5aNKp9fdHx3i_Pi15Z_X6pE3fAsTX35YBQ0nlmZGfaA.jpg	private	morristruck	\N
4fc7a5d3e4b0647c52b3c26e	/iRvxK7ohXIwK9Ib6wkVgtR46VKRLsamXuElhEtOlNKc.jpg	public	andysitalianice	t
4fc2552fe4b0cec932846e84	/cjaTu8CSMM7HvFDxIUk3I2TF_I8mJyZuejfwTgYLc-c.jpg	private	andysitalianice	f
51a4ee69abd87ea53396c979	/4083549_jMzaCPEId80kWmAaq2oQ9APKf4bLvdeHhy40qPeB9j8.jpg	public	shortysnyc	\N
50045b1be4b0004dbf67c977	/MDweBG1fBnF_fZ1tOghWyHS9qUxGNiJeOrOpoA-fBrY.jpg	public	shortysnyc	\N
4feb2bb8e4b0a47cf49787d7	/-CEaOy-zjgmGzmPRViSeNchwIITBbHgI3lFosreLqIE.jpg	public	shortysnyc	t
5008051fe4b0974c844d5003	/oNy0_bsWPyVmjrduzJXpbrAPHjQS0PVbyOCfoRSD9xE.jpg	public	shortysnyc	\N
519fa37b498e7adf7e8ebce3	/47170230_A9xVWAtkJBP-vVqUF1q2WlK8yuZTf1CVQz0JcPrHGY0.jpg	public	taimmobile	\N
4dfa4a9840a3542ff44549df	/VBAJNQCBWDMP2WKDXJ5QHQ0WYF1MKHZSLUAZZJXKDBDLDUWG.jpg	public	taimmobile	\N
520538a611d2b476431ac7f9	/117715_GMdoseCn4baUtTX9kN6_PAAfHaGIlUpjxzAitpqLAOY.jpg	public	chefsamirtruck	\N
5189442c498e765ce62d5924	/2432527_5nUa0fTfy4rzjXpiIUIlkguBa2kdqFSZIG-PLvkKu2Y.jpg	public	chefsamirtruck	\N
4fd0d80de4b062589043211f	/hZjMDK5KKgxjMhmOGBtaRjx_ga0SWHwppqfLfqw20Tg.jpg	public	chefsamirtruck	\N
5294e76b11d2879d5217bd00	/47558447_v1SwJZbLSZ2etlJXOF9qw4H3vErpdTiVIqXxULSVTSU.jpg	public	chefsamirtruck	\N
5245c79c498e057f7d5ff65d	/117715_CEghvDHaxkALy5RxQCAVW-kyM0TAZo2-fIT4e6veJeo.jpg	public	neaexpress	\N
51dc5fec498e4e9be748eac4	/22801_gX0atVT6Jt_H6FPXuYAqHD4VzO5jAmS4SVid_ZLkk5U.jpg	public	disosnyc	\N
525c259b498ea7548cf31f8e	/769710_ZxOOtsSbFVklHIRhXVmTO7ops0Pm0EybRDTgUvGHrSY.jpg	public	disosnyc	\N
53287c9c498e4b30223220d1	/68150_mMquObtK1F2QjX3VWuhYK2MtjUA9i5QRzexf9zWrBOQ.jpg	public	thegreenradish1	t
53287ac3498ee8ce8841a510	/68150_pNBQ4zhtsUiGR_kyfk0HziUGMzyIQwYcYpJ3VpZf7tk.jpg	public	thegreenradish1	f
53860b95498ee26cd484fe30	/81832079_fNoLG8cvJl_IqYaTNF8p9uwsDsglMXnfF2DKZ8X0Tk4.jpg	public	mtblls	t
53e3b619498e4b9015f0bad7	/68150_s6TPzQTspWKu7AI0DXgjZai6xKrtSkWgIdJNkenXMfs.jpg	public	mtblls	f
523887bb11d2ac89551d71ff	/5568483_apwtHKsNfvYc-IjeDL1_oqXIqZsLTUGH_-l1uxxAiGo.jpg	public	mtblls	f
521f754c498ee4d6fbe8a778	/22491899_EEPqf4HeJFaaFjYabKyScGZ8symjXEgMjPUEkfpJsJk.jpg	public	morristruck	\N
51856452498e6f602088cbe1	/232510_pLk3QUUWFOu82-4SX-ObtA8bw2ZPf61QBOeIuL50T-o.jpg	public	morristruck	\N
500ecc9ce4b0a6d209804d9e	/d2yG6CtTrc8TQAXoEGN68UYAv3DiJIqJvKU65-ApcaU.jpg	private	lobstertruckny	\N
5245c7a1498e0eb9bc097723	/1727660_xLZtYmqATL4pckN_IhgIj0AgUbDAJxywzqbf5PKEooM.jpg	public	lobstertruckny	\N
4dcbff9440a3324246c6fb7c	/YVZPSDS5D1O5DR2NK5IFQKOU0ZNOQTQMTHMRWS3ESLQIQAWK.jpg	public	lobstertruckny	t
507b0648e4b0109f3656e2d2	/76137_7JNe3m0dO2MZ7a9rkqa_DTlnrw0LyNitqksFG7_5IC8.jpg	public	lobstertruckny	\N
508abe69e4b01ff7516d118b	/8029486_9wt2tO9BnY5d11Ef0mpAgHAqfK1QMmSvLXglU4fj6Xw.jpg	public	lobstertruckny	\N
51cb2c41498e9851cecdd49a	/5728350_vuJ4ORu0wHhd-B-f4FTNfsoIhfHgtJRMJc-QEeiYmNQ.jpg	public	taimmobile	\N
504a271ce4b0c65efb6b05f5	/PG0DfZvsxtqv4QM8Xpl6y8Ojahb0UanYwCPSdmuhj_E.jpg	public	taimmobile	t
4fa814d1e4b0d607baf8bd9d	/2drHnu4mqj-uzpwwcJa3MatYGD7KFuxjE472rButWlM.jpg	public	taimmobile	\N
51bf306a498ed0fde41060d6	/250434_ayEUsJHsbHDQFjUrGrR2fdlBjswuffyRTlWWFrW0-dU.jpg	public	fritesnmeats	f
5413499511d26b1c8b577c09	/4195495_Ir_R8BxT1YxyTe-VuFD3U5pw6j9CobWIBlYp1FF-TwI.jpg	public	fritesnmeats	f
4e42f5ecaeb7f6be72c39c70	/JC5VO3Z50HMMMVLCCGWDQPMKF4W01VBXP1QS2LFESR55UHIX.jpg	public	fritesnmeats	\N
4fe1fbabe4b0be4ebe6c1c52	/HNMFUfRPXDmxSDWAwh7pixJ34SFUY0fgzZFeOLAVXU8.jpg	public	funbunsnyc	t
5109aed2e4b01d2a5b69b022	/117715_0jgrjk5IsUFppNAL0NtebyMYoz1JMdzrnWAIjrLMHZw.jpg	public	schnitznthings	\N
5012e555e4b0dd18ec16bd37	/mZQAOCmv5lnRZ1qOUTwDXk-MLC-X-p01AfECgfLJC2I.jpg	public	schnitznthings	\N
522e088e11d2d4539942a387	/39707564_2mJZIxFUyGllfVMRjXdE86dZsCxH8cmCdUv29E4dfmE.jpg	public	schnitznthings	t
520f87b511d2e753e7955853	/44_gUd2HlRFt-yMUFcOdI_EUCdz5NK86hKk-3kHwZhHou0.jpg	public	carpedonutnyc	f
542a28a1498e4288ab95e302	/68150_E567_ql-1p2jEv5ysetaEOgtnxpMmeLwZghpwLximCw.jpg	public	papayakingtruck	f
542a28a8498e8c25fb70df8c	/68150_ru2bxW9jr0deeGFaJrvEbwBh8Bv1FRW82ZIglwoRv1M.jpg	public	papayakingtruck	f
52d32962498e318b0a9942f1	/61382883_iF5gX7tlMJ3CWlWcTkpntPniCUpS3o7H8anOau4wiKA.jpg	public	usafoodtruck	f
5086e523e4b02ca59cae7bd4	/2361939_1JvatS0wOUdQQIaTmd4Vmk8bgr7aFYOR7LaMkRio0X8.jpg	public	mausamnyc	\N
513f646ce4b0b1892aaae1bc	/13285510_LmdJLKoCS9fSwm3wy96lcieTczjsLuxAEUnU3FlZDlo.jpg	public	mausamnyc	\N
51194bbae4b0cd237850b223	/793192_FQUO1SFGyLkg5NRz6VUYl3_zmFgfy0Mh8gL1unO8ijM.jpg	public	mausamnyc	\N
5243206b498e78230cd0770a	/54092198_eF4CEteD3zHjOCJzaYssyRXaQElB-GEOy2sqzBFQPm4.jpg	public	thegreenradish1	\N
525ee647498ef229c65969fe	/10045965_ptbEO58Zn5wDz6kgitvMVjFScmxSkkuHNbK-AguCXSM.jpg	public	thegreenradish1	\N
4fee068ce4b0f9bd2b4041f7	/UQwqaF9knSdh4LFRzAhnh7hcl6_dSjDTg1phtqTe_7Y.jpg	public	milktrucknyc	\N
5281221811d21e907e460e00	/4195495_akELCvAQ7aY-bfTfHk93g5g5_qcJnQJV7h_gH0FlKUA.jpg	public	milktrucknyc	\N
514360f4e4b0455b303a4d66	/8626436_tfGrSomdm1qEPFKcyb0Q5atmm3DmDeao1W8MotOtOwY.jpg	public	milktrucknyc	t
4f749b3fe4b0f06c04ae2440	/rA31cWGMm0G8EuZFYZBxb3y2OrW3oEo7vCj1L2XR3AM.jpg	public	milktrucknyc	\N
52052ef211d22b8ed81dd96b	/36360429_am9ha8rSYxAvCaSMU9ya6lI9MzIgcpR62DH6HS1b-uY.jpg	public	milktrucknyc	\N
50e71f82e4b07154c72fdc22	/275165_az4RUZ2U7-4cfdnQA1FlMrDLaxwCMriWtlhS_pddjEc.jpg	public	mexicoblvd	\N
5140cc96e4b0ef29f4802508	/4886503_z36ZXtYKGVIHcNLCR18ZdUWtpStRrbf33rInxsr2p1Q.jpg	public	mexicoblvd	\N
525de1d7498ef4b27ada0847	/31827631_CApIgPWaXupe3toLi7iJLb6NxIyn2IDTOjAG0qw-PIk.jpg	public	mexicoblvd	\N
5239ddce11d2ab4765d5cc7f	/5568483_alwOH7sfGU8-pKfLmurfe9rt3pk2G6p90KwFyC6hq1A.jpg	public	sweetchilinyc	\N
5208f543498eaeeaaad3ce52	/15629_P_UAUr_S-OO0R12wNp8LDPwr-ZbfPiWeG0Q0rrjW6Ww.jpg	public	sweetchilinyc	\N
51f2be1f498e71235db5b61b	/117715_mGfGU0UGjUMhgqgwrDPf2f44NZtfMrobqJMF8ahsrjY.jpg	public	sweetchilinyc	\N
51cc7075498e8d24309aea57	/991186_cg_CePJhqcT81QY5l1L4eB3MQxy_QlsRh4zmZDk8cFM.jpg	public	biandangnyc	t
5106bdece4b051d6cb82a376	/1922740_Eqg3x5oj7wks2XGfudNYIAzcCuZHJiWpgLP1CCbonEE.jpg	public	gcnyc1	t
4fba74c1e4b0a2484fae410e	/1XmG8W_3-cY3Qc-l1GwU7YSOBlzOwyGtk2BzKOkxqYY.jpg	public	gcnyc1	f
516d80bd498e8f3b47ac90e6	/36812449_Vbw1XbeTn6HJHdJF1bzMp9TvcwrqCP5edmktYCzlW6k.jpg	public	gcnyc1	f
51eae36e498e58d50e5683ba	/331066_SArUzXa_cz_-YMQco1rwYAfU8a99TZCHJX9a2WA3fHg.jpg	public	gcnyc1	\N
5280c18811d2e4df572063db	/5354893_5EtQmcwzMnTRFz9qbxjkt9FguCAC4xfW5xwUCyYIrbQ.jpg	private	waffletruck	\N
4f733c44e4b039d898ce1409	/PQ9G-O3CAtCW6ixkiwHhICEaRn0L3Lz1F95zKcl_GdI.jpg	public	waffletruck	\N
4fd26038e4b06145dfb72894	/zUVUqzIwbwoFsRrRenEhtDmBSbK2Ry9lzqeuYnmnHG0.jpg	public	waffletruck	\N
527e823311d2db75dd831ee0	/22419482_1rrrm4nhOKXQsXN25ApmVsGDw4t2J3GyjhfeQPEbClU.jpg	private	waffletruck	\N
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: mca
--

COPY locations (id, display, matcher, region, lat, long, hood) FROM stdin;
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
27	53rd between Park & Lexington	53rd between park & lexington	up	40.758746	-73.971748	Midtown West
61	52nd between 6th & 7th	52nd between 6(th)? ?(&|n)? 7(th)?	up	40.761774	-73.980945	Midtown West
7	38th & Broadway	38(th)? ?& ?broadway	up	40.752895	-73.987340	Midtown West
48	Fulton between Front & South	fulton between (south|front) & (front|south)	none	40.706510	-74.003370	Financial District
58	Fulton & South	((south|fulton) & (south|fulton)|seaport @ fulton)	none	40.706248	-74.003078	Financial District
41	Wall & William	(william|wall) & (william|wall)	none	40.706363	-74.009531	Financial District
23	51st between Park & Madison	51st (between )?park ?& ?madison	up	40.758212	-73.974371	Midtown East
39	King & Hudson	(king|hudson) & (hudson|king)	none	40.728086	-74.007317	Soho
11	41st between 6th & Broadway	41st between 6th (n|&) broadway	up	40.754659	-73.985726	Midtown West
25	52nd & 6th	52(nd)? ?(N|&) ?6(th)?	up	40.761166	-73.979443	Midtown West
13	46th & 6th	(w)?46(th)? ?& ?6(th)?	up	40.757418	-73.982288	Midtown West
38	King & Varick	(varick|king) ?& ?(king|varick)	none	40.727889	-74.005495	Soho
5	33rd & Park	(33(rd)?|park) & (park|33(rd)?)	mid	40.746468	-73.981828	Murray Hill
42	Hanover & Water	(hanover|water)( sq)? ?& ?(water|hanover)( sq)?	none	40.704089	-74.00900	Financial District
67	Pearl & Broad	(broad(way)?|pearl) ?& ?(pearl|broad(way)?)	none	40.703444	-74.011630	Financial District
70	25th & Park	25th & park	mid	40.741458	-73.985422	Flatiron
71	27th & Park	27th & park	mid	40.742706	-73.984531	NoMad
69	23rd & Park	23rd & park	mid	40.740172	-73.986363	Flatiron
22	50th between 6th & 7th	50(th)? between (6th ?& ?7th|6 ?& ?7)	up	40.760400	-73.981444	Midtown West
24	51st & Park	51(st)? ?& ?park	up	40.757830	-73.973477	Midtown East
68	Old Slip between Water & Front	old slip between (front|water) (&|n) (front|water)	none	40.703985	-74.008571	Financial District
52	10 Hanover sq	(10 hanover sq|hanover square)	none	40.704557	-74.009220	Financial District
73	55 Water	55 water	none	40.703653	-74.008528	Financial District
74	22nd between 5th & 6th	22nd between 5th & 6th	mid	40.741546	-73.991616	Flatiron
75	Front & Adams	front(s)? & adams	bkl	40.702470	-73.988548	Brooklyn
76	MetroTech	metrotech	bkl	40.694219	-73.985725	Brooklyn
77	53rd & Madison	53rd & (mad|madison)	up	40.759708	-73.974214	Midtown East
78	65th & Broadway	(broadway|65th) & (65th|broadway)	up	40.772945	-73.982057	Upper West Side
80	Vandam & Varick	(varick|vandam) & (vandam|varick)	none	40.726394	-74.005652	Soho
81	27th between 11th & 12th	27th between 11th & 12th	mid	40.751856	-74.006316	Chelsea
82	Charlton & Varick	(varick|charlton) & (charlton|varick)	none	40.727037	-74.005634	Soho
83	112th & Broadway	112(th)? & broadway	up	40.805448	-73.965760	Morningside Heights
84	Old slip & Front	(old slip|front) ?(&|@) ?(old slip|front)	none	40.703776	-74.008364	Financial District
86	17th & 5th	17th & 5th	mid	40.737901	-73.992212	Union Sq
87	53rd between Park & Madison	53rd between park ?& ?madison	up	40.759409	-73.973447	Midtown West
88	49th & 6th	49th & 6th	up	40.759215	-73.980893	Midtown West
89	Hudson between King & Charlton	hudson between king & charlton	none	40.727704	-74.007285	Hudson Square
90	Wall & Water	(water|wall) & (water|wall)	none	40.705131	-74.007406	Financial District
92	55th between 6th & 7th	55th between 6th & 7th	up	40.763653	-73.979593	Midtown West
93	99th & Madison	99th & madison	up	40.789202	-73.952694	Upper East Side
94	Water & Broad	water & broad	none	40.702961	-74.011477	Financial District
91	Water between Wall & Gouvernour	water between wall( st)? & gouvernour	none	40.704894	-74.007785	Financial District
95	Gouvernour & Water	(gouvernour|water) & (gouvernour|water)	none	40.704619	-74.008153	Financial District
97	Houston & Broadway	(houston|broadway) & (houston|broadway)	none	40.725457	-73.996819	SoHo
98	58th & Madison	58th & madison	up	40.762954	-73.971847	Midtown West
85	46th between 6th & 7th	46(th|st)? (between( )?(6&7|6th & 7th)|\\(6&7\\))	up	40.758025	-73.983710	Midtown West
14	46th between 5th & 6th	46(th|st)? (between )?(5th ?& ?6(th)?|5 ?& ?6|& 5~6)	up	40.756625	-73.980321	Midtown West
99	45th between 1st & 2nd	45th between 1st & 2nd	up	40.751243	-73.969530	Midtown East
100	320 West 66	320 west 66	up	40.775990	 -73.987717	Upper West Side
72	52nd & Park	52(st|nd)? ?&? park	up	40.758444	-73.973026	Midtown East
101	76th & Amsterdam	jcc	up	40.781190	-73.980043	Upper West Side
17	47th between Park & Lexington	47 ?(th|st)? between (lex|lexington|park) ?(n|&) ?(park|lex|lexington)	up	40.754942	-73.974389	Midtown East
102	Broadway between Houston & Bleeker	broadway between (bleeker|houston) & (houston|bleeker)	none	40.726014	-73.996255	SoHo
103	22nd & 5th	(5th|22nd) & (5th|22nd)	mid	40.740871	-73.990086	Flatiron
79	Hanover sq between Water & Pearl	hanover( sq)? (between )?water & pearl	none	40.704313	-74.009178	Financial District
96	21st & 5th	((5th|(w )?21st) & (5th|(w )?21st)| 5(th)? between (e)?20(th)?( & )?(w)?21)	mid	40.740258	-73.990499	Flatiron
1	20th & 5th	(5(th|ave)?|20(th)?) & (5th|20(th)?)	mid	40.739680	-73.990847	Flatiron
28	55th & Broadway	(broadway|(w)?55(th)?) (&|n|between) (broadway|(w)55(th)?)	up	40.764966	-73.982223	Midtown West
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mca
--

SELECT pg_catalog.setval('locations_id_seq', 103, true);


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: mca
--

COPY messages (message, date) FROM stdin;
	0
<b>Trucks Added:</b><br >\n<a href="/mamasheros">Mamas Heros</a><br>\n<br>\n<b>Trucks Removed:</b><br>\nYume Teriyaki<br>\nWing'n It<br>\nItizy Ice Cream<br>\nGO Burger	1433364244
  <b>Trucks Added:</b><br>\n<a href="/truck/mamasheros">Mamas Heros</a><br>\n<br>\n<b>Trucks Removed:</b><br>\nYume Teriyaki<br>\nWing'n It<br>\nItizy Ice Cream<br>\nGO Burger	1433526867
<b>Trucks Added:</b><br>\n<a href="/truck/mamasheros">Mamas Heros</a><br>\n<a href="/truck/lobsterjoint">Lobster Joint</a><br>\n<br>\n<b>Trucks Removed:</b><br>\nYume Teriyaki<br>\nWing'n It<br>\nItizy Ice Cream<br>\nGO Burger	1433952247
	1434555819
<b>Trucks added:</b><br>\n<a href="/truck/camion">Camion</a><br>\n<b>Trucks Removed:</b><br>\nBistroShopp<br>\nDeli Heaven<br>\nMike n Willie's<br>	1435338398
<b>Trucks added:</b><br>\n<a href="/truck/kaya">Kaya NYC</a><br>\n<a href="/truck/kettlecorn">Kettle Corn NYC</a><br>\n<b>Trucks Removed:</b><br>\nSteaks N Crepes<br>	1436391969
\.


--
-- Data for Name: sitestats; Type: TABLE DATA; Schema: public; Owner: mca
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
7	(btwen|btween|b & (w|t)|b\\/w|bet(?!w)|btwn|btw|bw)	between
\.


--
-- Name: subs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mca
--

SELECT pg_catalog.setval('subs_id_seq', 22, true);


--
-- Data for Name: trucks; Type: TABLE DATA; Schema: public; Owner: mca
--

COPY trucks (id, name, twitname, weburl, tweet, retweeted, lasttweet, lastupdate, type, about, foursquare, matcher, loc, matchmethod) FROM stdin;
mactruck	MacTruck	mactruckny	http://MacTruckNYC.com	Good morning 47st!!! Between park and lex last truck on the block caboose	f	1437364450	1432730877	American	Looking to take a nap after lunch? This truck is great and the owner is incredibly friendly. Feel free to chat it up while you watch him prepare your food.  Not listed on the menu are the many condiments\\n you can get on your macaroni. The regular size is a good portion for a normal lunch.	50575ab8e4b04ed4f2197dac	\N	17	\N
kimchitaco	Kimchi Taco	kimchitruck	http://kimchitacotruck.com/	Let's do this, midtown Grab your Fri grub at 52nd St. & 6th Ave.11:30 - 2:00	f	1437318442	1437144705	Korean Fusion		4d6ee122b45b59417c6a6778	\N	25	\N
dels	Del's	delsnyc	http://instagram.com/delsnyc	We apologize for being MIA the past 2 days. We've been preparing for the hottest day of the week! Come find us at 21st & 5th Ave until 4pm	f	1435693089	1409149941	Sweets		519bb56b498ed2dfa950ace2	\N	\N	\N
eggstrav	eggstravaganza	etravaganza	http://www.eggstravaganzany.com/	GM again..!! It's taco Tuesday.\nlet's start with our delicious egg breakfast tacos.\nThe truck it's located at NE corner 52nd and Park Avenue	\N	1436358066	1436879209	Mexican	\N	4b15165ef964a52049a823e3	\N	72	\N
seoul	Seoul Food	seoulfoodnyc	http://www.seoulfoodnyc.com	Come to 51st street, between Park and Madison - it's lunch time!!	f	1392220033	1392220033	Asian		4e74afad88775d593d9a7eb5	\N	\N	\N
miamifood	Miami Food Machine	miamimachinenyc	http://www.miamifoodmachinenyc.com/	RT @YouGotSmoked: Park Ave btw 33rd St and 32nd St from 11:00 to 3:00 today! New York Aged Cheddar Mac and Cheese! Delicious nyc http://t...	t	1421905524	1389964561	Mexican		514b53aee4b00c3e98ec25e9	\N	\N	\N
craffels	Craffles	crafflesnyc	http://www.craffles.com/	Happy holidays!!!\nMake ur holidays sweet with our delicious crepe or waffles. Our location for today. Hunter college and union square.	f	1421616846	1388428190	Crepes		514e426ce4b05bcb261d910e	\N	\N	\N
lobsterjoint	Lobster Joint	lobsterrolling	http://www.lobsterjoint.com/food_truck.html	Good Morning NYC,\nWe are parked on E20 Street & 5th Ave today. Come enjoy Fresh Lobster Rolls, Sliders, Gazpacho. Have a great day.	\N	1437224037	1436970443	Seafood		552d5dcd498edeb4d817ef9a		1	
vspot	Hit your V Spot	hityourvspot	https://www.facebook.com/VSPOT.TRUCK	47th and Park from 11:15am to 2:30pm !!	f	1412066274	1412066274	Vietnamese	\N	53c9479b498e2dfa7e205ff0	\N	\N	\N
schnitzel	Schnitzel & Things	schnitznthings	http://schnitzelandthings.com	The truck will be on 47th & Park.  Schnitzel time.	f	1422645854	1430322671	German		4a6640b3f964a5204cc81fe3	(schnitztruck|the truck)	16	contains
shadydawg	Shady Dawg	shadydawgnyc	http://www.shadydawg.com/	\N	\N	\N	\N	American	\N	536e77ea498e8b0d31167218	\N	\N	\N
kaya	Kaya NYC	kayanyc28	http://www.kayanyc28.com/	One more round Charlton and Varick till supplies last. Catch us for some buns before the weekend weekendsunshine CheapEats lunchtime	\N	1436972951	1437143989	Chinese		54342678498e669166a9d82c		82	
mamak	Mamak	lovemamak	http://www.lovemamak.com/	hey guys we are @smorgasburg pier 2 @BrooklynBridge_  come come come! http://t.co/llBP6I0uKb	f	1433525962	1410708157	Asian		51c4cffa498ec876f564a0b4	\N	\N	\N
blend	Blend	blend_express	http://blen02.wix.com/blendnyc	Happy Halloween.   47th and park we here.	f	1421948094	1414774175	Latin Fusion		4fa94528e4b0f8fbf13317e6	\N	16	\N
cinnamonsnail	The Cinnamon Snail	veganlunchtruck	http://www.cinnamonsnail.com/	Parked on 55th/Broadway 9:00-3:00\n*Please read note at the bottom of this post. \n\nHabanero apricot grilled tempeh... http://t.co/9ifeS1tevk	f	1437332411	1425044750	Vegan		4c263af6a852c9287537e66c	1	28	two
milktruck	Milk Truck	milktrucknyc	http://www.milktrucknyc.com	Bessie's at Water St. and Broad St. today for lunch! Call 646-504-6455 to pre-order. Seaport kiosk open all day until 8pm, 19 Fulton St.	f	1437174692	1436881984	American		4e823c0229c2dbb2b7043972	\N	94	\N
getstuffed	Momos & Buns	getstuffednow	http://www.chinesemirch.com	RT @GovIslandFood: 1/3. Only a few more days till Gov Island gourmet food market powered by @livefastgroup opens for the summer. @Getstuffe...	t	1408198481	1400698983	Chinese Fusion		4fa016cbe4b05d0fc11262c5	\N	\N	\N
freshhearty	Fresh and Hearty	freshandhearty	http://freshandheartynyc.com/	Get your Soup & Panini on with Fresh and Hearty! We parked on 46st btw 5th & 6th ave from 11am to 3pm. Call now 4 free delivery! @3474402467	f	1395241942	1390493878	Soup/Salad/Sandwich		51801f7a90e7374e46b6239f	\N	\N	\N
taipanexpress	Taipan Fusion Express	taipanexpress		Good morning we are serving lunch at 46 st between 5&6ave from 11:30 to 3pm @FoodtoEat @midtownlunch @nystfood	f	1412268299	1408622100	Thai/Chinese/Indian	\N	532b1b92498ea6c0d1026802	\N	\N	\N
mamasheros	Mamas Heros	mamasheros		Mini crowd forming, come get a sandwich, you really won't regret it. 46th between 5th and 6th http://t.co/EJYNaKt1MB	\N	1436901343	1436803093	Sandwitches		5564a8c5498efbaa697c9fb9		14	
brooklynpopcorn	Brooklyn Popcorn	brooklynpopcorn	http://brooklynpopcorn.com/	Good afternoon NYC hope everyone is enjoying their beautiful Wednesday! We are looking forward to seeing you on Hudson & King Street :)	f	1435076571	1434567787	Popcorn!		514a0737e4b09c3e77279d83	\N	39	\N
tacobite	Taco Bite	tacobite	http://www.tacobite.com/	Today we are on\n47th St\nBet\nPark Av / Lexington Av	f	1415029173	1406907223	Mexican		503ba49ae4b0fad35eb7a8dc	\N	\N	\N
mooshu	Moo Shu	mooshugrill	http://www.mooshugrill.com	Brought our yummy fare down to SoHo today! Catch us on Hudson & King til 2:30!	f	1418139086	1418396706	Chinese	Moo Shu grill is a slight twist on typical Chinese <a href="https://en.wikipedia.org/wiki/Moo_shu" target="_blank">moo shu</a> The three Moo Shus option is enough for lunch and you can pick and choose a different protein for each. In my opinion the chicken is the best but it is dark meat. </p><p>It's easy to order as there is one window for ordering and for picking up when your name is called.	52090e45498e5500a6bd41fb	\N	39	\N
gorilla2	Gorilla Cheese 2	gcnyc1	http://t.co/4ZDqfwSH5f	G1 46 5/6\nG2 Broadway / 55th \nComeToTheCheeseYo	f	1437318042	1437145146	American		4dc2d3e352b1c1fb37f1e945	g2	14	before
grillwheels	Grill On Wheels	grillonwheelsny	#	GOOD MORNING NYC WHAT A BEAUTIFUL DAY TO GO OUT AND GET LUNCH AT HANOVER SQUARE!!!	f	1437143196	1437058212	Kosher		51b0bf31498e9b68db75612c	\N	52	\N
shuka	Shuka Truck	shukanyc	https://www.facebook.com/ShukaTruckNYC	@JBlechner yes ! We will be on 21st & 5th Today !	\N	1437318025	1437143330	Israeli	\N	546a5011498e0e047a243f37	\N	96	\N
kettlecorn	Kettle Corn NYC	kettlecornnyc	http://www.kettlecornnyc.com/home.php	\N	\N	1437334625	\N	Popcorn				\N	
snowday	Snowday	snowdaytruck	http://snowdayfoodtruck.com/	RT @dumbolot: Jumped the gun...we got @DomoTaco @SnowdayTruck and @NeaExpress in the lot today!!!	f	1437356370	1435766697	Comfort	\N	533ddd4a498e774b8250a69b	\N	54	\N
elpaso	El Paso Truck	elpasotruck	http://elpasony.com/	Today we are at @Columbia between W 115th & W 116st. Stop by and get your tacos, burritos, quesadillas yummy  tacotruck FoodTruckfriday	f	1425157921	1412955921	Mexican	\N	523c911f04937624937304c5	\N	36	\N
camion	Camion	camionnyc	http://www.camionnyc.com/	Old slip and water FiDi foodporn foodtruck tacos burritos camionmeanstruck... https://t.co/ldYJK0EKLg	\N	1437146040	1436974916	Mexican		53eced53498ea98fb8a770e4		44	
korilla	Korilla BBQ	korillabbq	http://korillabbq.com	And its FiDi Friday! Front & Old Slip ready by 12:30	f	1437307931	1437147703	Korean Fusion		4cc701aa01fb236ab070baba	\N	84	\N
hh3	Habachi Heaven 3	hibachiheaven	http://www.hibachiheaven.com/	midtown. Come get warm with some hot HIBACHIHEAVENNYC, find us at 33rd/Park and 47th/Park for some yumyum	f	1428064651	1414075107	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	2	5	two
frites	Frites 'N Meats	fritesnmeats	http://www.fritesnmeats.com/	Lunch 2day @ 7 Hanover sq b/t water & pearl. Burger of the week THE TEXAN Preorder 9172929226 fidi	f	1437054200	1437140830	American	This is a good burger but this truck is interesting because of the many toppings they carry and their burger of the week. 	4ae9d217f964a520bcb621e3	\N	53	\N
carls	Carl's Steaks	carlssteaks	http://carlssteaks.com/home/	It's the @carlssteaks TRIFECTA FRIDAY folks\nBIG CARL - 56TH ST / BDWY \nLIL CARL @INTREPIDMUSEUM 46TH ST / 12TH AV... http://t.co/4oIZD8MKVn	f	1437324532	1437144992	American		51a78330498e3fc1f22d771e	\N	29	\N
crepestruck	Crepes Truck	thecrepestruck	https://www.facebook.com/thecrepestruck	Come ceck out the Brazzers promo truck in Time Square 48 & 7 ave today till 4pm. http://t.co/wUDdRIZpAh	f	1433610398	1406998102	Crepes		4dfb854918386e743d9869e3	\N	\N	\N
mrnice	Mr Nice Guy	mrniceguytruck	http://mrniceguynyc.com	71st and york... it's friday	f	1414424434	1414687317	American		520bbbb211d26afae232ec59	\N	33	\N
latinkitchennyc	Latin Kitchen	latinkitchennyc	http://www.latinkitchennyc.com/	HAPPY HALLOWEEN ! ! TODAY OUR LAST FRI OF 2014 ..THANK YOU WALLSTREET! !\nLOCATION 55 WATER ST (SIDE OF OLD SLIP) NYC http://t.co/RWCtK9bCEc	f	1437344293	1414768415	Mexican	\N	53878518498ef00115dbdea1	\N	73	\N
funbuns	Fun Buns	funbunsnyc	http://j24f.com/funbuns/	Last day to get your favorite buns this year at 50th st between 6 / 7 ave midtown Happy Halloween everyone	f	1419358370	1414768000	Asian		4f8d9663e4b021137aa2bdde	\N	22	\N
pontirossi	Ponti Rossi	pontirossifood	http://www.pontirossifood.com/	RT @dumbolot: ricebowls @SweetChiliNYC, pastas @PontiRossiFood, & noodles @mamuthainoodle. great way to start the weekend! carboload carb...	f	1437146486	1437146377	Italian	\N	542d78f4498ee5493e1a8989	\N	54	\N
mexicue	Mexicue	mexicue	http://mexicueny.com	Eating these sliders under an umbrella is like movie make-out scenes under waterfalls. \n\nCome get em at MadSqEats http://t.co/VxW4aWmiwh	f	1437169498	1410639912	Mexican		4c51a6a71c67ef3ba6b61ab9	\N	\N	\N
wafelMomma	Wafels & Dinges Momma	waffletruck	http://www.wafelsanddinges.com/	De TRUCKS:\nKastaar @ Horace Mann School til 4pm  Momma Truck @ 40th & Park til 4pm	f	1437347729	1432313318	Belgian		4a416369f964a52036a51fe3	momma	9	before
chefsamir	Comme Ci, Comme Ca	chefsamirtruck	http://www.chefsamirtruck.com	We are at 47st between park av and Lexington av! Get your couscous	f	1437151147	1436455781	Moroccan		4c3c85e3a9509c74b52e395b	\N	17	\N
neapolitan	Neapolitan Express	neaexpress	http://neapolitanexpress.com/	Lunchtime already? We will be at @BklynNavyYard and @dumbolot until 3pm today reclaimyourlunchbreak	f	1437327541	1436972426	Pizza		51c8864c498e0ac96c14433e	\N	54	\N
steelcart	The Steel Cart	thesteelcart	http://www.thesteelcart.com/	Makin a grand finale on Front & Jay! Stick it to the weatherman with a toasted sandwich & grits. Soup today is Rustic Chicken Noodle.	f	1436887174	1419950738	French		511d3abee4b0e188895f3697	\N	56	\N
phils3	Phil's Steaks	philssteaks	http://www.philssteaks.com	And a very phine Phil's Phriday to you! The Jawn is on 51st and Park 11-2 just waiting for you. Come thru!	f	1437229601	1437144382	American		4f15b382e4b0725660ea9f31	\N	24	\N
toastmonster	Toast Monster	toastmonsternyc	http://www.toastmonsternyc.com/	Toast Monster @UrbanSpaceNYC @GarmentDstrctNY till October 17. On Broadway between 40th and 39th st.	f	1428680926	1411270224	American		50ad1829e4b087613d696bc4	\N	\N	\N
shanghai	Shanghai Sogo	shanghaisogo	http://www.shanghaisogo.com/	Happy Halloween. TGIFriday !! We r serving at water and Hanover sq!! ( 10 Hanover square ) come & get some. 11~3pm. http://t.co/VBdd8zsVAK	f	1430948975	1414769059	Asian		5258369d498e13def2bef2cb	\N	42	\N
paris	Paris Sandwich	parissandwich	http://www.parissandwiches.com/	Last day in dumbo today on fronts and Adams @ 11:30 @DUMBOFoodTrucks	f	1436401880	1414764931	French/Vietnamese		519e4ed0498e4f27e64c177a	\N	75	\N
disos	DiSO's	disosnyc	http://www.disosnyc.com/	Friday lunch.. 46th and 6 ave corner. \n\nSPECIAL TODAY: Homemade Meatball Parm hero\n\nCall in orders to: 917-756-4145	f	1437367288	1437141532	Italian Sandwiches	These might be typical italian sandwiches but the ingredients are high quality. You need to get there early because the line can get long and they will run out of some breads. I believe the focaccia half is a normal portion for lunch while their half and hero sizes are pretty big.	519523d6498eeaa6200aad03	\N	13	\N
mexicoblvd	Mexico Blvd.	mexicoblvd	http://mexicoblvd.com	Buenos dias Dumbo! tacos tortas flautas @MexicoBlvd @dumbolot Water & Jay	f	1437172812	1436799139	Mexican		4f4e55aee4b04c96fba5b149	\N	54	\N
mamuthai	Mamu Thai Noodle	mamuthainoodle	https://www.facebook.com/MamuThaiNoodle	Friday!! Dumbo day! Come to @dumbolot where we will be serving you the freshest Thai noodle! Hand cut this morning as per everyday! 11:30-3	f	1437250733	1437144992	Thai		5126a10ae4b0af674c85f353	\N	54	\N
sweetchili	Sweet Chili	sweetchilinyc	http://sweetchilinyc.com/	TGIF we are @dumbolot jay & water 1130-3! porkbelly friedegg sriracha fries nyc bacon sun thaietnamese lunch eatoutside spicy	f	1437231715	1437146140	Asian		51a8c802498e2165ca855a19	\N	54	\N
eddiespizza	Eddie's Pizza	eddiespizzany	http://www.eddiespizzany.com/	starrettlehigh Takumi specials @ Starrett-Lehigh https://t.co/DJmjLtTZs9	f	1436879099	1436804085	Pizza		4c0cf412b4c6d13ae4850c30	\N	46	\N
mausam	Mausam	mausamnyc	http://www.mausamnyc.com	RT @dumbolot: We got @mausamnyc @ToumNYC and @bigdsgrub in the lot today!	f	1437333483	1437062528	Indian		50730eebe4b0f3224431dc5d	\N	54	\N
bobjo	BobJo	bobjotruck	http://www.bobjo.net	Hello nyc we r open at 47th st. Between park ave. and Lexington ave. try our KOREAN BBQ beef, pork, shrimp  thank you very much	f	1436371192	1436887762	\N		4e3add0c88772c3bf12772da	\N	17	\N
dubpies	DUB Pies	dubpies	http://www.dubpies.com/	PieTruck is @ Hudson Ave & King St, Soho until 2.30pm http://t.co/b4hpuhB8mJ	f	1436691800	1435936010	New Zealand meat pies	\N	4eb825a62c5b53141b78bfb6	\N	39	\N
greenradish	The Green Radish	thegreenradish1	http://www.thegreenradish.com/	Good Day to GetNaked NakedBeanBurgers 47th between Park and Lexington https://t.co/4ou7IczI7R	f	1437132742	1432902203	Vegan		5229feab11d2edde794d385c	\N	17	\N
mtblls	Mtblls	mtblls		Well it's Friday Mtbll Lovers! Another beauty .  The  is stopped at 50th bet 6&7 Aves. Come on by for your... http://t.co/O7T3RX1Rk1	f	1436793334	1437145380	Italian	\N	504fb7fde4b0bc88c3a6b614	\N	22	\N
schnitzelcart	Schnitzel & Things Cart	schnitznthings	http://schnitzelandthings.com	It's Schnitzel time.  The cart will be on 27th & Park serving up your favorite lunch!	f	1431702487	1426694447	German	\N	4a6640b3f964a5204cc81fe3	(schnitzcart|the cart)	71	contains
sweetery	Sweetery	sweeterynyc	http://sweeterynyc.com	Serving at Hudson/King St 375 Hudson Street New York From 7:30AM-3:00PM EDT https://t.co/2cDIucjsTY	f	1437341987	1435923308	Sweets		4a28d919f964a52056951fe3	\N	39	\N
carpedonut	Carpe Donut	carpedonutnyc	http://carpedonutnyc.com/	Truck open at 51st street and Park avenue. Come!!!	f	1436709816	1437044501	Sweets	They only server one kind of donut here, the apple cider, but it's a pretty good one. They are fresh and still hot when you get them. They have donut ice cream sandwiches but you should know the entire thing is in the freezer so you will get a frozen donut as well.	5169892c498e0522481eea97	\N	24	\N
hh2	Habachi Heaven 2	hibachiheaven	http://www.hibachiheaven.com/	Open and ready to roll corner of Varick and King	f	1428064651	1423759572	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	1	38	two
langos	Langos	langostruck	http://www.langostruck.com/	Good morning FiDi\nWe're here for you\nWater st & Old Slip\n11-2:30pm	f	1436965869	1436882080	Hungarian	\N	537a883c498eb7fac064409f	\N	51	\N
nuchas	Nuchas	nuchasnyc	http://www.nuchas.com	CLOSED Tomorrow our NuchasTruck will start the day in Varick St and Charlton St! MuchasNuchas  - http://t.co/G9DUAIOt2h	f	1437157801	1436922505	Mexican		4ebd2a9bb8f7b504a754c130	\N	82	\N
papayakingtruck	Papaya King	papayakingtruck	https://www.facebook.com/papayaking	.@DowntownBklyn, we are back in metrotech. Come get the worlds greatest franks and tropical drinks	f	1437328935	1435247479	American		50952bd2e4b03898afd23fe3		76	
yankeedd	Yankee Doodle Dandy's	usafoodtruck		You know what day is a day for America? Erryday. Come get your food NYC, were at 39th and Broadway and at the USS Intrepid. NYC murica	f	1437302431	1433345704	American	\N	52b497e1498eed13ead2b84c	\N	8	\N
shortys	Shortys	shortysnyc	http://www.shortysnyc.com	Up and running at SouthStreetSeaport South and Fulton Streets Cheesesteak ChickenCheesesteak RoastPork... http://t.co/awyzKOzJqw	f	1437071581	1415982867	American		4faea2cce4b08a88c5dc5d05	\N	58	\N
morris	Morris Grilled Cheese	morristruck	http://morrisgrilledcheese.com/	Schedule for the week: \nEveryday @ BwayBites, Greeley Sq 11-9\nThursday @DowntownBklyn metrotech Lawrence St 11-3\nWeekend @FarmBoroughFest!	f	1437318383	1435072820	American		4e0e0b3caeb7a5b33ee5dac1	\N	76	\N
cinnamonsnail2	The Cinnamon Snail 2	veganlunchtruck	http://www.cinnamonsnail.com/	This week:\n\nMon: 48th/6th\nTUES: water/Gouvernour Ln, AND Dinner on 4th Street near Washington Square\nWEDNESDAY:... http://t.co/ssXs1PztRI	\N	1437332411	1423425704	Vegan	\N	4c263af6a852c9287537e66c	2	95	two
andysitalianice	Andy's Italian Ice	andysitalianice	http://andysitalianicesnyc.com/	Sorry private events all day. Now open in union Squad for all your ice needs. Closing at 8pm @nycfoodtruck @UnionSquareNY	f	1437330926	1437084911	Dessert	\N	4df26c2bae609e69dd95d2fc	\N	37	\N
schnitzi	Schnitzi	schnitzi1	http://www.schnitzi.com/	Guys today it is our last day before our nine days vacation, so come to 46 St bet 5&6 Ave from 11:30-3:30 order @www.schnitzi.com	\N	1437356777	1437055426	German	\N	532b25ed498eb8b1844dc14f	\N	14	\N
toum	Toum NYC	toumnyc	https://www.facebook.com/ToumNYC	Hello there @DumboNYC ! Deciding on lunch? Join us on Jay & Water St until 3pm! Your tummy will thank you! Brooklyn	f	1437316170	1437056289	Lebanese		500eedb0e4b062ee00577957	\N	57	\N
polish	Old Traditional Polish Cuisine	polishcuisine	https://www.facebook.com/pages/Old-Traditional-Polish-Cuisine/315496671902708	Open at 11:00 - 47th b/w Park & Lexington - get your midtown lunch on the go!	f	1437330052	1437143936	Polish		51435df4e4b0823a398ebc8a	\N	17	\N
lobstertruck	Red Hook Lobster	lobstertruckny	http://redhooklobster.com/	It's Friday! TreatYoSelf to a lobster lunch at 46th and 6th HappyWeekend http://t.co/gxlCfPnHYa	f	1437231763	1437149784	\N		4dc597c57d8b14fb462ed076	\N	13	\N
chipsy	Chipsy King	chipsykingny	http://chipsykingny.com/	Kasar truck is at 46th and 6th avenue until 7pm	f	1437241508	1436448508	Fries		51bb5c43498ee06e13d0d31f	\N	13	\N
bigds	Big D's	bigdsgrub	http://bigdsgrub.com/	If you don't know, now ya' know...\nD1 is at 50th Street btwn 6th and 7th Avenue for lunch. 11am to 2:30pm http://t.co/t1iRbrxDig	f	1437246779	1437138585	Korean Fusion		4c968b907605199c2eaec2a3	\N	22	\N
taim	Taim Mobile	taimmobile	http://www.taimmobile.com/	It's raining it's pooring... but don't let that stop you from a delicious lunch @TaimMobile! See you on 20th and 5th today!	f	1437317158	1436974603	Mediterranean		4cf2c5321d18a143951b5cec	\N	1	\N
lukeslobster	Luke's Lobster	nautimobile	http://lukeslobster.com/	This is it, our last day on the streets of NYC. 17th st and 5th ave. So long, farewell, see ya when we see ya.	f	1437325413	1430398345	Seafood		4dc81239b0fb5556cd2f3023	\N	86	\N
pocketful	The Pocketful	thepocketful	http://thepocketful.com/	Our cart is back on 50th between 6th and 7th. Enjoy the sunshine!	f	1436789968	1430145608	Mediterranean		4db8bcd790a0e3f61d601888	\N	22	\N
palenque	Palenque	palenquefood	http://www.palenquehomemadecolombianfood.com	RT @KristinaMongan: @Palenquefood TY4my 1st eva Arepa! So friendly &delicious! BwayBites muy bueno! NomNom whatsnext vivacolumbia http...	f	1436892798	1434670346	Colombian Fusion		4e84f424dab45bbd2617dc62	\N	36	\N
biandang	Bian Dang	biandangnyc	http://www.biandangnyc.com/	Yessss... it's almost the weekend! lets go to biandang on 53rd and park!	f	1436796533	1437144480	Taiwanese		4d712874722ef04d04160d9c	\N	26	\N
domo	Domo Taco	domotaco	http://www.domotaco.com	old slip and water ftw till 2:30pm. also on 33rd and broadway till 9pm! it's friday!!! tgif	f	1436964733	1437144530	Asian Fusion		4ed90a2e77c8274efb746d83	\N	44	\N
treats	The Treats Truck	thetreatstruck	http://www.treatstruck.com	!!! Wed,July 1st 12-3:30 45th st & 6th! Last day on 45th before our summer break! Come on by! Then 4ish-7pm 18th st & 7th ave!!!	f	1437066216	1435762655	Sweets		49e65021f964a52035641fe3	\N	12	\N
souvlaki	Souvlaki GR	souvlakitruck	http://www.souvlakigr.com/	@MKramerTV We are on 55st/Broadway\nStop by for a little taste of Mykonos\n@randomfoodtruck till 3 pm.	\N	1437146346	1431701151	Greek	\N	4c75c2908d70b713d5dcdaad	\N	28	\N
valduccis	Valduccis	valduccis	http://valduccis.com	RT @greenboxny: RT @Valduccis: The slices are red-hot 51st St. and Park @greenboxny @FoodtoEat @Foodtruckstars_ ... http://t.co/QCZzt1RZnq	f	1437335800	1434247434	Pizza		4df7e1aad4c02ad734170b21	\N	24	\N
wafelKastaar	Wafels & Dinges Kastaar	waffletruck	http://www.wafelsanddinges.com/	De TRUCKS:\nKastaar @ Horace Mann School til 4pm  Momma Truck @ 40th & Park til 4pm	f	1437347729	1432313318	Belgian		4a416369f964a52036a51fe3	kastaar	9	before
gorilla1	Gorilla Cheese 1	gcnyc1	http://www.gorillacheesenyc.com/	G1 46 5/6\nG2 Broadway / 55th \nComeToTheCheeseYo	f	1437318042	1437145146	American		4dc2d3e352b1c1fb37f1e945	g1	14	before
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
Fan of the society?? \n\nTell us on YELP and receive 50% off your next sandwich. (Show ur review at window upon ordering)	1437145883	622061038394060800	f	disosnyc
Friday lunch.. 46th and 6 ave corner. \n\nSPECIAL TODAY: Homemade Meatball Parm hero\n\nCall in orders to: 917-756-4145	1437141532	622042790558605312	f	disosnyc
@GiaNY322 welcome to the society :) and thanks	1437101867	621876421703634944	f	disosnyc
RT @GiaNY322: Had my first @DiSOSNYC sandwich today - needless to say, was amazing! http://t.co/WXvinWjDh4	1437101844	621876323485642752	f	disosnyc
It's lunch! Have yourself a sangwich and a smile.. :)\n\n47th bet Park and Lex.\n\nCall in orders to: 917-756-4145... http://t.co/De6o5DH5dD	1437059370	621698177348018176	f	disosnyc
Disos serving today on 47th bet Park and Lex. \n\nSPECIAL TODAY: homemade meatball parm hero\n\nCall in orders to: 917-756-4145	1437055284	621681037970685953	f	disosnyc
Open for lunch.. Serving on water st and old slip. \n\nSPECIAL TODAY: homemade meatball parm hero\n\nCall in orders to; 917-756-4145	1436974045	621340297407123457	f	disosnyc
Disos posted up on water and old slip.. \n\nSPECIAL: Mamas homemade meatball park hero\n\nCall in orders to: 917-756-4145	1436971090	621327903784083456	f	disosnyc
Tomorrow Disos will be serving mamas famous meatball sandwich. Be there.. Water and old slip FIDI.	1436911353	621077349384257537	f	disosnyc
Lunch today 48th bet 6 and 7 ave	1436889714	620986589410402304	f	disosnyc
@eric_zimm we'll be selling them soon, like next week or 2	1436837190	620766284368715781	f	disosnyc
Open for lunch.. 47th bet Park and Lex \n\nCall in orders to: 917-756-4145	1436801660	620617261112532992	f	disosnyc
Monday lunch- parked 47th bet Park and Lexington ave.\n\nCall in orders for pick up: 917-756-4145	1436798614	620604486382407681	f	disosnyc
Open for lunch 46th bet 5 and 6 ave\n\nCall in orders to: 917-756-4145	1436542568	619530552799043585	f	disosnyc
Diso Fridays on 46th bet 5 and 6 ave.\n\nCall in orders for pick up: 917-756-4145	1436537747	619510329819705344	f	disosnyc
We ova here now!! 47th bet park and Lexington \n\nSpecials: Porchetta, Rice balls, Toasted ravioli	1436450459	619144219131817984	f	disosnyc
Open for lunch wall st and old slip corner..\n\nCall in orders for pick up: 917-756-4145	1436369754	618805715583508480	f	disosnyc
Specials today: \n\nPorchetta sandwich, \nrice balls, \ntoasted breaded ravioli	1436365088	618786147913859072	f	disosnyc
Lunch on water st and old slip. FIDI..\nPlease place large call in orders before noon today as we are short staffed. 917-756-4145	1436365019	618785859203153920	f	disosnyc
Lunch on water st and old slip. FIDI..\nPlease place large call in orders before noon today as we are short... http://t.co/GtkMH84fua	1436364760	618784772844863488	f	disosnyc
Black Bean Burgers take NYC Summer Party iac plantbased thegreenradish https://t.co/e8Nb1VDAEZ	1437132742	622005920512524288	f	thegreenradish1
Thanks @IAC Great summer blast last night getrad plantbased http://t.co/Rb8JevdGiu	1437131214	621999509900374016	f	thegreenradish1
@Lizerd84 not in NYC presently, JerseyCity	1437130867	621998056586612736	f	thegreenradish1
RT @themicruz: @thegreenradish1 has an amazing black bean burger! Noms!!	1437130800	621997773810876417	f	thegreenradish1
Photo: Banh MaMia.... GetRad go PlantBased http://t.co/JLnHJJOOW1	1436994176	621424732899033088	f	thegreenradish1
Banh MaMIa....grilled tofu cabbage slaw/peanut dressing Sriracha Mayo toasted Ciabatta from... https://t.co/G4yK0pZYwp	1436980793	621368601438736384	f	thegreenradish1
Don't let grey skies keep you from our Grilled Tofu Banh Mi with Cabbage Slaw&Peanut Dressing.Sriracha Mayo... http://t.co/x4DsdCxeIO	1436974660	621342877633740800	f	thegreenradish1
Hey jerseycity foodtruck lunch today Wash&Morgan @MordisFoodTruck @TacoChilango @OSM_NJ @jc_eats @CoryBooker http://t.co/H8HbpuUZ5t	1436890544	620990070108110848	f	thegreenradish1
Lunch is on Wash&Morgan makeityoursJC  getrad foodtrucks	1436890392	620989432435449858	f	thegreenradish1
Good week to be working at IAC, we'll be catering a private event on Thursday....GetRad NYC http://t.co/AOhfwJv7YG	1436787195	620556592405192704	f	thegreenradish1
@leeshufro @thegreenradish1 is in JerseyCity for now...	1436747037	620388156710367232	f	thegreenradish1
THIS WEEKS SCHEDULE \n\nTUESDAY - Lunch on Washington&Morgan 11-2\nWEDNESDAY - Lunch on Washington&Morgan 11-2... http://t.co/qfXzqSvNOp	1436744186	620376197562802176	f	thegreenradish1
Grab a Mint-Raspberry Tea before it slides away...GetRad jerseycity https://t.co/RfZIYBoupW	1436658848	620018265864151040	f	thegreenradish1
Photo: Talking PlantBased on @thegreenradish1 http://t.co/wMOQwCQliW	1436642724	619950637988610048	f	thegreenradish1
Photo: EatPlants LiveLonger GetRad  http://t.co/6lp5tMEVYy	1436642185	619948375627177984	f	thegreenradish1
So glad you liked it, see you soon! https://t.co/4utfy3V1ix	1436638342	619932256136617984	f	thegreenradish1
@jc_eats on Instagram: The huge, delicious Classic Black Bean burger from @thegreenradish!... http://t.co/bCrWznmXXh	1436613192	619826771484127232	f	thegreenradish1
The Green Radish makes Rosemary Fries http://t.co/KHijB4JRN3	1436569189	619642206694076416	f	thegreenradish1
Radish makes Rosemary Fries http://t.co/XIgmNHVuY3	1436562426	619613842444812288	f	thegreenradish1
Thank You @SylviaHebron  https://t.co/4utfy3V1ix	1436553296	619575547237011456	f	thegreenradish1
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
This is my way of cuddling. Apple, Cranberry & Nutella MuchasNuchas regram @vequalsmcsquared http://t.co/elN0eaztca	1437157801	622111025496752129	f	nuchasnyc
@Lampaban truck at beaver street & new street!	1437147612	622068290014314496	f	nuchasnyc
Truck at Beaver St & New St! Right on the spot for lunch! MuchasNuchas	1437147571	622068119696084992	f	nuchasnyc
RT @mitgc_cm: @NuchasNYC Of service to @CivicHall today while simulcasting IGFUSA with @isocny http://t.co/zwQ1xgmTwn c @Civicist http://t...	1437085472	621807657998008320	f	nuchasnyc
Rocking in Jones Beach! MuchasNuchas	1436998196	621441594319835137	f	nuchasnyc
CLOSED Tomorrow our NuchasTruck will start the day in Varick St and Charlton St! MuchasNuchas  - http://t.co/G9DUAIOt2h	1436922505	621124121846509570	f	nuchasnyc
In E 14th street and 3er Avenue, there's a truck waiting for you! MuchasNuchas	1436908243	621064303223963648	f	nuchasnyc
OPEN! NuchasTruck on 14th street and 3rd Ave until 6:30 PM! MuchasNuchas - http://t.co/G9DUAIOt2h	1436905263	621051805225615360	f	nuchasnyc
OPEN! We are in 5th Ave and 21st Street until 3PM! NuchasTruck MuchasNuchas - http://t.co/G9DUAIOt2h	1436889051	620983805965377536	f	nuchasnyc
Taking baby Nuchas pushcart for a walk! Visit us on Bleeker street and 6th Ave. Thanks @lesliesardinias for... http://t.co/QgDyXEJmCZ	1436799683	620608970659627008	f	nuchasnyc
Enjoying empanadas at @VansWarpedTour @Jones_Beach MuchasNuchas http://t.co/YtzF88dCDb	1436660082	620023439877906432	f	nuchasnyc
Start your morning the right way coffee MuchasNuchas http://t.co/iz1ODQsq0I	1436446594	619128009455468544	f	nuchasnyc
Lacking a snack? Truck parked at E 14th St & Irving Pl! MuchasNuchas	1436387723	618881085015986176	f	nuchasnyc
RT @NomNomNYCgirls: Curry Empanada from @NuchasNYC got my mouth watering  foodporn @TwitterFood TimesSquare http://t.co/uatHtIcvFI	1436372990	618819289206943744	f	nuchasnyc
Taking care of lunch! MuchasNuchas approved!! http://t.co/sSSCIRT4T8	1436295314	618493495104413696	f	nuchasnyc
RT @marjorieglb: If you love empanadas check out Nuchas. All the flavors are delicious! @NuchasNYC @blackmad, they cater http://t.co/g3fYVP...	1436294632	618490631619391488	f	nuchasnyc
Hudson Square! Truck at Varick St & Charlton St! Hurry up to get some delicious empanadas!! MuchasNuchas	1436201887	618101630760845316	f	nuchasnyc
Keep it simple and tasty MuchasNuchas http://t.co/JmPlIYA0NO	1436122123	617767077886230528	f	nuchasnyc
Nuchas at Liberty State Park all day!  MuchasNuchas	1436043592	617437694319292416	f	nuchasnyc
@KittieBanks we are at liberty state park!	1436043542	617437483849150470	f	nuchasnyc
It's true.... http://t.co/7SmqSzvynF	1437159118	622116550200438784	f	bigdsgrub
D2 is catering a private event today. Have a great weekend! https://t.co/PLNesGpWyn	1437145170	622058046911549440	f	bigdsgrub
If you don't know, now ya' know...\nD1 is at 50th Street btwn 6th and 7th Avenue for lunch. 11am to 2:30pm http://t.co/t1iRbrxDig	1437138585	622030428279570432	f	bigdsgrub
It's THAT time of the week grubbers! Find us at 50th Street btwn 6th and 7th Avenue for lunch on this beautiful day. http://t.co/jKnanUoYwS	1437052308	621668556091039744	f	bigdsgrub
Ditch the desk & join us for lunch at @dumbolot. Jay and Water Street @DUMBOFoodTrucks @DUMBOBID DUMBO @hugeinc http://t.co/6jcTyV3IAz	1437052014	621667322709843968	f	bigdsgrub
We're headed to DUMBO tomorrow. Leave your lunch at home! 	1437000692	621452062157615104	f	bigdsgrub
D1 is slinging taco, grinders and more at 53rd Street and Park Avenue http://t.co/0aEcQHye5P	1436965288	621303568180584448	f	bigdsgrub
D2 is grillin' it up at 50th Street btwn 6th and 7th Avenue! Come n' Grub!! http://t.co/FdoFdBS8VW	1436965044	621302545890340864	f	bigdsgrub
D2 is serving lunch today at 41st Street and 6th Avenue. http://t.co/p9pGbIXkXW	1436881650	620952765376897024	f	bigdsgrub
D1 has YOUR lunch over at 50th Street btwn 6th and 7th Avenue today. 11am to 2:30pm http://t.co/x89ye8FeCV	1436879619	620944245084524544	f	bigdsgrub
D2 is grilling up some Vietnamese Roasted Chicken over Dirty Fried Rice & more. 41st. Street btwn 6th and Broadway http://t.co/jWWGkfgLpV	1436879427	620943438670905344	f	bigdsgrub
Change of plans...\nBigD2 is headed to 53rd Street and Park Avenue. Open by 12:15pm! http://t.co/85im69LW7w	1436801889	620618223856263172	f	bigdsgrub
D1 is now open at Hudson/King St. (In front of 375 Hudson Street) http://t.co/szLCta0LkE	1436799978	620610206419058688	f	bigdsgrub
D2 is serving it up at 50th Street btwn 6th and 7th Avenue http://t.co/mYOSkWX5va	1436794422	620586902643716098	f	bigdsgrub
D1 is grillin' it up at Hudson/King St. 11am to 2:40pm http://t.co/zREFF3kGAB	1436793277	620582101126148096	f	bigdsgrub
Let's end the week off proper!  Ditch the desk and join D1 for lunch at 50th Street btwn 6th and 7th Avenue TGIF http://t.co/vdvIw6CWTW	1436533984	619494548276936704	f	bigdsgrub
Join us 4 lunch today at Jay and Water St. @dumbolot @DUMBOBID @DUMBOFoodTrucks @hugeinc DUMBO TGIF http://t.co/O7yigALn5S	1436533861	619494030737588224	f	bigdsgrub
 https://t.co/899YSh1zDo	1436457377	619173234999721984	f	bigdsgrub
It's THAT time of the week folks! 50th Street btwn 6th and 7th Avenue http://t.co/1GGVpGulKh	1436446760	619128704569057280	f	bigdsgrub
D2 is serving lunch at @BLDG92 today. http://t.co/zRRDERkGs2	1436446684	619128384170364928	f	bigdsgrub
@WestchesterMed we are open and ready for you! Come cool down.	1437145634	622059994792480768	f	andysitalianice
@WestchesterMed don't worry we will see you all tomorrow. With tons of Canoli ices for you!	1437090145	621827254901972993	f	andysitalianice
Sorry private events all day. Now open in union Squad for all your ice needs. Closing at 8pm @nycfoodtruck @UnionSquareNY	1437084911	621805303261085696	f	andysitalianice
We are open in union Square till 8pm @nycfoodtruck	1436818725	620688838583828480	f	andysitalianice
We are open on Old Split and Water for all your cool down @nycfoodtruck @FTFUSA @grubstreet @StreetGrubSteve	1436805234	620632251563384832	f	andysitalianice
@Stephluva2711 @prospect_park @nycfoodtruck try one of our featured flavors and keep a lookout for our new menu.	1436714535	620251832372342784	f	andysitalianice
Today we are @prospect_park with many other amazing food trucks from our @nycfoodtruck come check us out	1436711275	620238159461392385	f	andysitalianice
Sorry everyone we are at a private event for MTV. Then heading to @bryantparknyc 40th and 6th Ave	1436546619	619547542263590913	f	andysitalianice
Due to this fabulous weather we will be off the road today. Rain rain go away! @nycfoodtruck @grubstreet	1436446502	619127620446203905	f	andysitalianice
We would like to welcome our newest member to the Andy's brand we are now available in Ohio @EastCoastIces	1436397248	618921033836437504	f	andysitalianice
Need us for a private party or event contact us today. Info@andysitalianices.com http://t.co/KDxFhwNLKI	1436397181	618920756228059136	f	andysitalianice
Still open on 40th & 6th ave. Come cool down with a ice or iced coffee	1436381715	618855884601585664	f	andysitalianice
We are now open on 40th & 6th Ave till 5pm @bryantparknyc @nycfoodtruck	1436371263	618812047447474176	f	andysitalianice
We are now Open in @UnionSquareNY till 8pm come chill out!	1436305002	618534126791081984	f	andysitalianice
RT @nycfoodtruck: Sunday Funday, INDEED. July 12th @Prospect_Park Food Truck Rally: http://t.co/RBk7V1dq5E w/ @AndysItalianIce @CarlsSteaks...	1436304338	618531343325102081	f	andysitalianice
RT @LoforteMichael: Beating the heat with a mint chocolate chip. @AndysItalianIce @HardcoreItalian @ItalianGrocery  andysitalianicesnyc ht...	1436303460	618527660256436226	f	andysitalianice
We are open on 32nd are Park Ave for all your cool down needs till 5.	1436284550	618448344298483712	f	andysitalianice
We are now open in @UnionSquarePark till 8pm	1436215492	618158697244659712	f	andysitalianice
We are open on water at and front st till 5pm. Come cool down with a refreshing Italina ices. @nycfoodtruck @grubstreet	1436200342	618095150267527168	f	andysitalianice
Happy July 4th. We will be back on the road Monday.	1436028996	617376476598419456	f	andysitalianice
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
G1 46 5/6\nG2 Broadway / 55th \nComeToTheCheeseYo	1437145146	622057947665985536	f	gcnyc1
Hanover water / pearl &\nUptown	1437044227	621634663531061248	f	gcnyc1
@sethedel idiot	1437016089	621516643039100928	f	gcnyc1
@OneWaySidewalks not sure but soon.....	1437016081	621516607244902400	f	gcnyc1
RT @CarrieHeals: Wednesday's lunch date with @gcnyc1  http://t.co/UQGICevERc	1437016041	621516440160595968	f	gcnyc1
RT @AmandaBananasNJ: We're at @Pier_13Hoboken until 10pm w/ @MexiFlips @themoofoodtruck @waffledelys @gcnyc1 @TFQfoodtruck @TheIncrediballs...	1437016036	621516420149608448	f	gcnyc1
I'm jealous  of the Gorilla  :) https://t.co/OAlE7ZGgMK	1436984951	621386041187020801	f	gcnyc1
Lunch:\nG1 Hanover water / pearl \nG2 26th 11/12 @starretlehigh \nDinner:\n@Pier_13Hoboken &\n@NikonJBT \nComeToTheCheeseYo	1436970927	621327218862649345	f	gcnyc1
G1 Hudson / king \nG2 33/park\nToday's Melt:\nFalafel Melt w/Muenster, lettuce, tomato,caramelized onions & Chipotle aioli\nComeToTheCheeseYo	1436883252	620959482672189440	f	gcnyc1
G1 47/park\nG2 50/6\nComeToTheCheeseYo	1436795795	620592661636993024	f	gcnyc1
46 5/6\nBroadway /55\nComeToTheCheeseYo	1436538204	619512249221259264	f	gcnyc1
G1 @Pier_13Hoboken \nG2 @ Pier 84 (44th & Westside Hwy) for @  hudson river rocks concert [Waxahatchee and Speedy Ortiz]\nComeToTheCheeseYo	1436475327	619248522097922052	f	gcnyc1
G1 Hanover water / pearl \nG2 uptown \nComeToTheCheeseYo	1436456076	619167777723650048	f	gcnyc1
Thursdays  https://t.co/nXhm0OhbwK	1436386535	618876103390838784	f	gcnyc1
G1 Hanover water / pearl \nG2 26th 11/12 @starretlehigh \nComeToTheCheeseYo	1436367169	618794875039969280	f	gcnyc1
We are in NYC check our friends @grlldcheesetruk they r in ur area https://t.co/K6PW332Xw6	1436364243	618782602565144576	f	gcnyc1
1 truck out today... Hudson/King\nComeToTheCheeseYo	1436280052	618429477958381568	f	gcnyc1
G1 38th /Broadway \nG2 50th/6\nComeToTheCheeseYo	1436193912	618068181677117440	f	gcnyc1
Here's how we do it @Pier_13Hoboken \nFull A++ Crew...  Gorilla.  Pizza. Tfq   Waffles. Dark side. Luke's. Thai & Amanda's	1436111948	617724399165304832	f	gcnyc1
Hudson /Charlton &\nUptown Lunch \n@Pier_13Hoboken dinner\nComeToTheCheeseYo	1435849738	616624613955620864	f	gcnyc1
Let's do this, midtown Grab your Fri grub at 52nd St. & 6th Ave.11:30 - 2:00	1437144705	622056098212634625	f	kimchitruck
Bless you, weather gods, for granting us perfect taco conditions. Hudson & Charlton St 11:30 - 3:00	1437054522	621677843504889856	f	kimchitruck
RT @mrslentils: The problem with scanning Twitter at the airport is now I want @KimchiTruck taco. And I CAN'T HAVE ONE. firstworldproblems	1436992255	621416674428866560	f	kimchitruck
Done for the day. See you tmrw!	1436990909	621411030808313861	f	kimchitruck
@PastorDamion You da best! Thanks for understanding.	1436979795	621364414239739904	f	kimchitruck
@PastorDamion Sorry, equipment casualty!	1436979321	621362426382958592	f	kimchitruck
Last day on 40th & 5th @bryantparknyc Don't miss out! 11- 7 foodtruckson5th	1436968117	621315434852122624	f	kimchitruck
RT @dumbolot: Happy Tuesday with @carlssteaks @SweetChiliNYC and @KimchiTruck!	1436883811	620961828844253184	f	kimchitruck
Thinking bout that lunch break already? We got'chu. TacoOClock 11:30 - 3:00 @dumbolot Jay & Water	1436881619	620952634464337920	f	kimchitruck
RT @MommyPowers: @KimchiTruck Reading good things about you- hope to try for myself during BlogHer! LatinaBlogger foodie travel MommyP...	1436795632	620591977613131776	f	kimchitruck
Truck rally going on now! Grand Army Plaza till 5pm	1436714197	620250417298046976	f	kimchitruck
RT @JacksonLatrelle: @KimchiTruck yummy	1436536901	619506784148025344	f	kimchitruck
Friday's here at long last. We're got tacos to make it even sweeter. Find us on 52nd St. & 6th Ave. 11:30 -2:30	1436535796	619502146036346880	f	kimchitruck
Thinking about lunch already? Don't blame ya. Find us on Hudson & Charlton St. 11:30 - 3:00	1436449386	619139717112688640	f	kimchitruck
Here until 7pm. Follow the smell of Korean BBQ. 40th & 5th. @nypl	1436391586	618897287012442112	f	kimchitruck
RT @dubilla: Support your local food trucks. @KimchiTruck http://t.co/YaJGs1gCy2	1436376866	618835546689957888	f	kimchitruck
Time for a lunchbreak Find us on 40th & 5th today @nypl @bryantparknyc	1436374584	618825976999489536	f	kimchitruck
RT @bryantparknyc: Stomach rumbling for lunch? Look no further than the @nypl, where @KimchiTruck is serving up Korean BBQ deliciousness ht...	1436370275	618807902405574656	f	kimchitruck
Got a case of the post holiday humpdays? Grab a taco & a book. foodtruckson5th @nypl 40th & 5th 11-7	1436363485	618779424423591936	f	kimchitruck
RT @nycfoodtruck: Foodies, the next @Prospect_Park Food Truck Rally is coming up! http://t.co/47Su3yjD8T w/ @KimchiTruck @NeaExpress @papay...	1436320071	618597330984509440	f	kimchitruck
Hi \nWe're on Wall street bet Hanover street and William\n11-2:30pm	1436965869	621306004454703108	f	langostruck
Good morning FiDi\nWe're here for you\nWater st & Old Slip\n11-2:30pm	1436882080	620954568600350725	f	langostruck
The prettiest view ever in the Langos Truck history http://t.co/dZGikiEt67	1436650580	619983585664180224	f	langostruck
Hi if you looking for the Langos Truck\nWe're on Staten Island Back to the Beach Festival \nSaturday and Sunday \n12-8pm http://t.co/3w0sc5D4X9	1436626434	619882310809337856	f	langostruck
RT @RiberaRuedaWine: Getting tasting-happy for foodtruckfriday. Would you pair wine w/ @langostruck @vlaic or @pontirossifood?? http://t.c...	1436556636	619589555835023360	f	langostruck
Hi Midtown \nWe're here for you\n52St bet 6-7Ave (closer to 6)\n11-2:30pm\nEnjoy your weekend	1436532485	619488261367537664	f	langostruck
Hi\nLunch time\nWe're at Wall St. Bet Hanover St & William11-2:30pm	1436449013	619138152201101312	f	langostruck
Hi we are at the corner of Hudson st & King\n11-2:30pm	1436280245	618430289388392448	f	langostruck
Hi \nLangos Truck at 47Street bet Park & Lexington Ave\n11-2:30pm\nSee you soon	1436188873	618047045765611520	f	langostruck
Hellooo FiDi\nWater St. and Old Slip \n11-2:30pm	1435850309	616627008513163264	f	langostruck
Hello Midtown\n52nd.St bet 6-7Ave (closer to 6)\n11-2:30pm\n\nYou know skirt steak,fish and chips\nSpec hungarian meat balls w green pea stew\nYam	1435752238	616215668325793792	f	langostruck
Snow- We are at 51st between Park and Madison Ave	1391440953	430360666047000576	f	seoulfoodnyc
Hi there\nLangos Truck at the corner of Hudson and King St\n11-2:30pm\nCHOPPED JulyFourth FoodTruck JerseyCity TheProfit BarRescue	1435672991	615883282941669377	f	langostruck
Hi we hope you had a wonderful weekend\nYou can find us at 47street bet Lexington & Park Ave\n11-2:30pm\n\nNYC NYCfoodtrucks European 	1435579247	615490088563277824	f	langostruck
Hi Everyone \nWe are at the Pride Festival\nCorner of 6Ave and 3rd. Street\nMore info 646 286 9949\n\npride Festival langos nyc food trucks	1435501757	615165073280077824	f	langostruck
Hi L-T in FlatIron today\nCorner of 5Ave & 20 street\n11-2:30pm\n\nnyc food truck langos hungarian meat balls electric zoo fish & chips	1435321883	614410627008831488	f	langostruck
Good morning\nLangos Truck @ the corner of\nHudson and King st\n11-2:30pm\nWe got Plenty of skirts steaks\nnyc hungry hungarian soho party	1435240926	614071068467331072	f	langostruck
Hi \nLong Island City \nWe are here for You\n@ 47rd & 5th. Street\nSee you soon\n5:30-8:30pm	1435178873	613810798348079105	f	langostruck
Hi\nL-T at the corner of Hudson & King St.\n11-2:30pm\nCome to visit us and have fun	1435150165	613690391121002496	f	langostruck
Hi \nLT will be on Upper East Side\n82nd. Street bet 2-3Ave\n\nSaturday \n12-5pm\n\nCome to see us and enjoy your Saturday with crispy fresh langos	1434753325	612025922670231552	f	langostruck
Enjoy your Sunday\n\nWe Re at Orchard street Festival\nBet Rivington St and Delancey St.\n12-4:30pm\n\nHave a Langos today\nEnjoy\n\n646 286 9949	1434291501	610088891312422913	f	langostruck
RT @Varun: The green chili pork burrito is the 100 emoji wrapped in a torti... Foursquare Tip @mexicue http://t.co/bbRON4ryH1 http://t.co...	1437169498	622160085016514560	f	mexicue
Lunchtime views at 225 FIFTH http://t.co/yBrhjidOOj	1437062452	621711102188093440	f	mexicue
SPICY SHRIMP \narugula, cabbage, jalapeno aioli, pico, cotija, avocado http://t.co/GdaqZh4GdC	1436994849	621427556676423680	f	mexicue
Tuesday. Tacos. Got it. Awesome. TreatYoSelf http://t.co/O767RcMoro	1436894622	621007172785303552	f	mexicue
How to upgrade a Monday: Step 1 http://t.co/FEnNoii638	1436805072	620631571192782849	f	mexicue
Indoor Street Corn   http://t.co/bIfO2jCIeS	1436456124	619167978479874048	f	mexicue
Got the burrito goin up OnATuesday http://t.co/w1hzXOhpHw	1436281814	618436870582706177	f	mexicue
We have BBQ running through our veins after this weekend - evening it out with a Kale & Quinoa Bowl  http://t.co/MiCkuxv6iX	1436198595	618087826148696064	f	mexicue
Your holiday weekend lineup\n\n @no2el http://t.co/jVEaTU1sJZ	1435956956	617074314932822016	f	mexicue
RT @BravenBrewing: Burnt ends chili burrito, quinoa w/ shaved corn, and blackened fish tacos w/ watermelon radish. @Mexicue is on point. ht...	1435871388	616715419433340928	f	mexicue
That moment you realize you can dip your cornbread in your Shrimp n Grits... Magic http://t.co/dzQbBQVNyx	1435764130	616265546884100099	f	mexicue
arugula & avocado | mango, watermelon radish, fresh corn, manchego, pepitas, cotija, citrus vinaigrette, mint | http://t.co/PmOHCyzQ6J	1435591152	615540022536704000	f	mexicue
Neato Burrito!\n(we also hate that we wrote that, but it's been a long week) http://t.co/MInWKfRfsp	1435266650	614178961719955456	f	mexicue
On a Tuesday = @iLoveMakonnen5D & @Drake song / when we're gonna eat this OnaTuesday http://t.co/rLC4uTNSCZ	1435094307	613456103238705152	f	mexicue
Do you even guac, bro?\n\nYou can get ours with watermelon radishes or tortilla chips  http://t.co/p9imPqzs2a	1434988560	613012567854870528	f	mexicue
The only thing that's bootleg here is made with Bourbon, you want this TreatYoSelf http://t.co/s0Og7shK49	1434748512	612005736680456192	f	mexicue
Balance  TreatYoSelf http://t.co/Ed7Ngqbnr9	1434663243	611648089854709762	f	mexicue
Hashtag: Put an Egg on it  http://t.co/k6LdbEoMmj	1434557552	611204790660546560	f	mexicue
Handheld devices  TacoTuesday http://t.co/v57V8yYxbU	1434468395	610830839736348672	f	mexicue
Monday's aren't totally rad, but you can at least make them radish http://t.co/S9ICmsSjDI	1434382117	610468961357045760	f	mexicue
Hello there @DumboNYC ! Deciding on lunch? Join us on Jay & Water St until 3pm! Your tummy will thank you! Brooklyn	1437056289	621685255376896000	f	toumnyc
@boulosdib we love our fans! Thank you for lunching with us 	1436988846	621402375199293440	f	toumnyc
RT @boulosdib: @ToumNYC Best Lebanese food.  Worth the 8 block walk. http://t.co/9WKvJv6kpi	1436988818	621402258639560704	f	toumnyc
Hello MidtownWest! Join us on 46th btwn 5th & 6th until 3pm for a delicious healthy lebaneselunch!	1436967259	621311835048943616	f	toumnyc
Don't let the rain stand in your way! Call us at 917-TOUM-350 to place your order! Get a free drink with your lunch today after 1:30pm!	1436894910	621008380094758912	f	toumnyc
There's a chicken shawarma with your name on it on 52nd btwn 5th & 6th! Join us for a delicious LebaneseLunch http://t.co/Y8WIrhMJbS	1436879575	620944060359012352	f	toumnyc
RT @dumbolot: We got @ToumNYC @MexicoBlvd and @dubpies in the lot today!	1436798913	620605741154627584	f	toumnyc
GlutenFree platter anyone? Join us @ 3 locations @DumboNYC on Jay/Water St, AMEX in FiDi & @MarthaStewart @gofooda http://t.co/PQzo6VTPnW	1436795398	620590999463718912	f	toumnyc
RT @sashasleiman: Enjoying a fantastic Lebaneselunch at @ToumNYC in FiDi!! keepcalmandshawarmaon DeliciousFood toumnyc http://t.co/OGw3...	1436554118	619578997580636161	f	toumnyc
@sashasleiman sahtain! So happy you're enjoying our shawarma! Thanks for lunching with us 	1436554064	619578767925735424	f	toumnyc
HappyFriday LebaneseLunchers! Join us on Old Slip btwn Water & Front St until 3pm for a healthy vegan lunch http://t.co/H5PJhlpa4d	1436534061	619494871829749761	f	toumnyc
RT @FoodMoves: Go check out Toum NYC! Best Lebanese food around! https://t.co/VJZ3uBateo	1436460253	619185295657959424	f	toumnyc
We love our Thursday's in @DumboNYC! Join us until 3pm on Jay & Water St!	1436453303	619156145945583616	f	toumnyc
RT @LCSwing: .@ToumNYC serves authentic Lebanese food tonight at LCSwing while the @GordonWebster Big Band plays! http://t.co/evOWYHMhgJ	1436386951	618877846094761984	f	toumnyc
Okay LebaneseLunchers, join us at 3 locations today: the truck on 46th btwn 5th&6th, our popup at AMEX in FiDi & @warnermusic w/ @gofooda	1436360946	618768773256974339	f	toumnyc
RT @nycfoodtruck: . @Prospect_Park Food Truck Rally is around the corner - Join us! http://t.co/QZHl3ybvHz  w/ @LobsterTruckNY @TaimMobile ...	1436316993	618584420916854784	f	toumnyc
Deciding on lunch just got easier! Join the truck on 52nd btwn 6th & 7th or our @gofooda popup at @Gilt! Fattoush http://t.co/vIULhIsRUM	1436274599	618406608138305536	f	toumnyc
RT @dumbolot: Welcome back to real life! We got @bigdsgrub @ToumNYC and @MexicoBlvd to help ease the transition	1436190740	618054877621657600	f	toumnyc
RT @Simassin: Join @ToumNYC 1)corporate cafeteria in the AMEX building,2) @starrettlehigh with @gofooda or 3) Dumbo Jay&Water St http://t...	1436190731	618054838379761664	f	toumnyc
Happy Monday! Join us at the corporate cafeteria in the AMEX building, at @starrettlehigh with @gofooda or in Dumbo on Jay & Water St 	1436189737	618050671863037953	f	toumnyc
Someone say party? RT @publicaddress: @nzdodo How long are @gemmagracewood and @dubpies in the country? Got a party coming up ...	1436691800	620156474338230272	f	dubpies
RT @carolineymorgan: @dubpies craving me a steak n cheese..............cannot wait to find your Food Truck this weekend! Chur bro	1436691003	620153135269482497	f	dubpies
RT @AIW27: @dubpies Please make 46th St. a weekly event, because pie just made my day	1436472427	619236360512077824	f	dubpies
RT @supericakr: Major thanks to @dubpies for hooking it up this am for my work lunch. You guys are tops! Ta! http://t.co/nygSOJPFtP	1436472359	619236071889448960	f	dubpies
RT @rjgnyc: Shoutout to @dubpies for randomly appearing in food truck form for while I walked around wondering what to get for lunch.	1436470406	619227882339082240	f	dubpies
No PieTruck today, sorry!	1436187627	618041822699515904	f	dubpies
We're happy to run with that! ;-) RT @NapierinFrame: @dubpies maybe it's because there's a smaller number of ingenious kiwis, like you! :)	1436142687	617853329973112832	f	dubpies
Silly us, of course! MT @NapierinFrame: @dubpies perhaps America's antiquated imperial measurement system calls it 0.016 inch gauge wire!	1436140988	617846201212403712	f	dubpies
When you coming to get your pie? MT @Waitakeres: @dubpies @KimMolly3564 starter motor mount broken, now held in place by substitute 8 wire	1436133009	617812737524170752	f	dubpies
Come to think of it, you may be the original! RT @KiwiGus: @dubpies @brendonbrewer we jersey city dwellers are Westies too (to NYC at least)	1436132008	617808537062875136	f	dubpies
RT @KiwiGus: @dubpies @brendonbrewer we jersey city dwellers are Westies too! (to NYC at least)...	1436131961	617808340018724864	f	dubpies
Aye, but which was first? MT @brendonbrewer: .@dubpies love that AK (current home) & Sydney (home) both have westies (I am one).	1436128703	617794677996171265	f	dubpies
Your pie awaits you, sir! RT @morningsteppa: @dubpies fucked the flux capacitor and now using modified junk to travel in time?	1436125394	617780796049502208	f	dubpies
You can take the westie out of West Auckland but....	1436123698	617773681532633088	f	dubpies
In lieu of 8 wire, go with kotanga. Free pie if you can explain what's happening here. http://t.co/C0da43sh93	1436123607	617773302057148416	f	dubpies
If Brooklyn lacks anything, we'd have to say there's a serious dearth of 8 wire.	1436121663	617765146514059265	f	dubpies
Down the hill @RoyalPalmsClub today RT @CalicoAvenger: @dubpies Will the Pie Truck be at 7th Ave/Carroll St today?	1436104651	617693793756803072	f	dubpies
Thanks for that! ;-) RT @hecktclem: Just gave DUB Pies (@dubpies) a 4.5/5 rating on @ZomatoUS LoveFood http://t.co/AQbbMyvWhH	1436036674	617408676702384128	f	dubpies
July 4 Special: Free Apple Pie a la mode when you spend $12 @ cafe or Pietruck - today only! http://t.co/pIy80PwYG7	1436026787	617367211158732800	f	dubpies
PieTruck is @ Hudson Ave & King St, Soho until 2.30pm http://t.co/b4hpuhB8mJ	1435936010	616986463012569089	f	dubpies
We are close today! ! \nHappy end of ramadan!!	1437151147	622083116363083776	f	chefsamirtruck
We are at the corner of park av and 52st	1436973493	621337980137902080	f	chefsamirtruck
We will be one of the sponsor's of this wonderful non profit organization http://t.co/MxTbyGuwt7	1436666022	620048355926929408	f	chefsamirtruck
Today we are at the intrepid museum! !	1436542322	619529520601780224	f	chefsamirtruck
Making the best couscous in  new York http://t.co/bBdS8wzDNO	1436455888	619166989169356800	f	chefsamirtruck
We are at 47st between park av and Lexington av! Get your couscous	1436455781	619166538613059584	f	chefsamirtruck
Hi new York! ! We are at 52st and park av! \nGet a taste of home style Mediterranean food	1436369511	618804697852477441	f	chefsamirtruck
60 days to electric zoo NY!!\nChef samir truck will be there! !!!!	1436284755	618449205561040896	f	chefsamirtruck
RT @ElectricZooNY: This is NOT a drill.. there's only 60 days left till EZOOTransformed Festival EDM http://t.co/OUOHHzyFh1	1436284696	618448959732871168	f	chefsamirtruck
@ElectricZooNY \nWe are so happy to bring Chef samir truck to the event! ! Yay let's have fun and delicious Mediterranean food	1436284665	618448826404315137	f	chefsamirtruck
It's official, we are bringing Chef samir truck to Afro punk, we can't wait to see Lenny Kravitz and Lauren hill! !!	1436284487	618448083429494784	f	chefsamirtruck
Tuesday's at our location of 36st and Broadway! ! It's hot outside, try our refreshing homemade strawberry lemonade and mint iced tea	1436283285	618443038298382336	f	chefsamirtruck
RT @afropunk: AFROPUNK Announces Inaugural Atlanta Festival \nCheck out the full lineup &gt; http://t.co/oQW8RqSc4b http://t.co/83rLHqXKP3	1436283089	618442218261626880	f	chefsamirtruck
Bringing Chef samir truck to the intrepid museum! !!\nHappy 4th of July https://t.co/BynsqP9lh3	1436025567	617362092279078912	f	chefsamirtruck
Long weekend is almost here, start it with delicious Moroccan /Mediterranean food	1435853273	616639439738150912	f	chefsamirtruck
Happy Thursday, we are on 47st between park av and Lexington av!	1435852077	616634423484747776	f	chefsamirtruck
We are at 52st and park av!	1435765640	616271878685069312	f	chefsamirtruck
Traditional Moroccan couscous with 7 vegetables! ! https://t.co/4XEe8N0kkP	1435711872	616046360983375873	f	chefsamirtruck
We are at 36st and Broadway!	1435677885	615903808456146944	f	chefsamirtruck
See you in 45min!!! https://t.co/tAE3EgEgn8	1435612909	615631280244424705	f	chefsamirtruck
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
One more round Charlton and Varick till supplies last. Catch us for some buns before the weekend weekendsunshine CheapEats lunchtime	1437143989	622053092478029824	f	kayanyc28
Baoday today at Charlton and Varick. Get ready by 11:30. Let's bao down y'all! VendyAwards VendyCitizenJudge http://t.co/JKhIyzKlrx	1437059343	621698064458350592	f	kayanyc28
vendyawards's photo https://t.co/NW4VTQHbUu	1437058895	621696183359131648	f	kayanyc28
Greenwich and Park Pl today. Get ready by 11:30. baoday homemade lunchtime	1436972951	621335708058451969	f	kayanyc28
Front and Adams till 2:30 @DUMBOFoodTrucks	1436799776	620609358523723777	f	kayanyc28
Finish up your week with our baos. Front and Adams till 2:30 @DUMBOFoodTrucks @NYCFoodieFinder Minions DUMBO http://t.co/tRWj5Q1Hm6	1436539488	619517632388169728	f	kayanyc28
Get ready 11:45 Charlton and Varick Soho foodies asianfood	1436452972	619154759942041600	f	kayanyc28
shoutout to @swang021 We're here today	1436452695	619153597318733824	f	kayanyc28
Greenwich and Park Pl today. Get ready by 11:30. baoday homemade lunchtime	1436366181	618790730987868160	f	kayanyc28
Sup guys? Charlton and Varick till 2:30. Bao down with us today for lunch FoodTruck foodie keepontruckin	1436282579	618440078982037504	f	kayanyc28
Happy Monday! Front and Adams till 2:30 @DUMBOFoodTrucks	1436196387	618078565024854016	f	kayanyc28
@Datalot your delivery is on the way. http://t.co/9AiVPef2ZJ	1435847840	616616651761537024	f	kayanyc28
Get ready by 11:45 at Charlton and Varick today. Last day to enjoy the baos before  catering IndependenceDay http://t.co/dCT2w6r3jO	1435847552	616615441511936000	f	kayanyc28
Greenwich and Park Pl TriBeCa till 2:30. Catch us before IndependenceDay weekend. Extra duck today. HolidayParty beer lunchtime	1435762191	616257414430593024	f	kayanyc28
RT @Stevejhock: @KayaNYC28  Sweet.......don't have to wait till Thursday	1435699712	615995355331694592	f	kayanyc28
@six_dffrnt_wys @DUMBOFoodTrucks Sorry, we are not in dumbo today. We will be back to dumbo next Monday! :)	1435689680	615953280049528832	f	kayanyc28
RT @EricRubenLawyer: Lunch today from @kayanyc28. iloveny http://t.co/a6ZF7XWl0I	1435689613	615953000020987904	f	kayanyc28
We're out by Charlton and Varick today till 2:30. Let's Bao down today. letseat Streetfood baotime lunchtime	1435676376	615897477737246722	f	kayanyc28
Our prayers and thoughts go out to all of our fellow young people of Taiwanwaterpark taiwanfire	1435594600	615554485692301313	f	kayanyc28
@_BlackParade_ Front and Adams	1435591431	615541195742310400	f	kayanyc28
RT @GooleyChris: @BrooklynPopcorn love me some of your sweet goodies http://t.co/57N6nu95vh	1435365703	614594422974586880	f	brooklynpopcorn
RT @GooleyChris: @BrooklynPopcorn what is this magical truck!! @RufioJJ @devinmiranda @iamstephdawn @kmonty_ http://t.co/xxTGPWUmvb	1435365693	614594378921844736	f	brooklynpopcorn
Hello FIDI :) We are cooking everything fresh and can't wait to see you all!!!! NYC	1435076571	613381713511755777	f	brooklynpopcorn
@WonderlandK Yes we are :) Looking forward to seeing you and thank you for your support!	1435072254	613363608970522624	f	brooklynpopcorn
Happy Father's Day to all the daddy's from the Brooklyn Popcorn Family!!!	1434904515	612660060917997568	f	brooklynpopcorn
Hello 96st and Broadway we are back. Making all your favorite flavors especially the Brooklyn Mix. Can't wait to see you all!!!	1434830970	612351587676237824	f	brooklynpopcorn
@msladyfrost Yes!! we will see you soon! keep you posted :)	1434806613	612249428410433536	f	brooklynpopcorn
Good afternoon NYC hope everyone is enjoying their beautiful Wednesday! We are looking forward to seeing you on Hudson & King Street :)	1434567787	611247718225301504	f	brooklynpopcorn
@NYCRobyn  Thank you for the support!! :)	1434502092	610972175701512192	f	brooklynpopcorn
@p__alon Sorry we missed you Patricia but we will be returning yes! Look forward to seeing you :)	1434502056	610972025880977408	f	brooklynpopcorn
@SaiGiddy Hi Saira where are you located? Sorry we have missed you! Let us know so we can come by with one of our trucks :)	1434502006	610971812328013824	f	brooklynpopcorn
RT @MzFuN_SiZ3d: Tried @BrooklynPopcorn for the time today and it was AMAZINGGG 	1431354821	597771561651830784	f	brooklynpopcorn
RT @lostplum: If eating just @BrooklynPopcorn for dinner is wrong, I don't want to be right!!	1430969410	596155033403658240	f	brooklynpopcorn
RT @imnotnicolle: Was blessed with the @BrooklynPopcorn truck. I wrote a whole story about on IG cause I'm annoying. http://t.co/bwz90vRIoL	1430969403	596155005071163392	f	brooklynpopcorn
@kakea107 Hi Kristin call us to find our locations for the day you are requesting. We have 3 trucks out now.Hoping to see you soon :)	1430969384	596154922854424578	f	brooklynpopcorn
RT @RorySacks: Shout out to the @BrooklynPopcorn staff for the recommendation of jalapeno mixed w garlic parm popcorn http://t.co/3HVRheocgD	1430507324	594216903700283395	f	brooklynpopcorn
RT @tuccimusic: @BrooklynPopcorn GREAT POPCORN please check them out the Spicy Cajun popcorn is awesome!	1430507205	594216406411026433	f	brooklynpopcorn
RT @MatthewGellert: @brooklynpopcorn foodtruck near work today & now all other popcorn is seen as weak and useless. incredible delicious...	1430507201	594216388581040129	f	brooklynpopcorn
RT @ArdenisPerez_: Feeling so happy after eating almost an entire bag of @BrooklynPopcorn Too good!	1416833924	536866507058581505	f	brooklynpopcorn
@joseph_damato Yes we are there every Wednesday! See you soon :)	1416833914	536866463685292032	f	brooklynpopcorn
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
RT @QueenCity_226: mamasheros's photo https://t.co/avvwIyqYMS @MamasHeros props to the moves being made	1432842338	604010664085032960	f	mamasheros
@nystfood Absolutely! We we're actually on 46st and 6ave Today. Tomorrow we're on 55st & Broadway. Come By!	1432842325	604010608892252160	f	mamasheros
RT @nystfood: @MamasHeros Are you guys active and operating the truck this year?	1432842140	604009829682778112	f	mamasheros
Is a tomato a fruit or vegetable ?	1426860498	578921007173541888	f	mamasheros
comingsoon 2015 staytuned	1426224192	576252147320369152	f	mamasheros
Well it's Friday Mtbll Lovers! Another beauty .  The  is stopped at 50th bet 6&7 Aves. Come on by for your... http://t.co/O7T3RX1Rk1	1437145380	622058928709439488	f	mtblls
Good Thursday Y'all!  Looks to be a nice one today whew   The Mtbll  is stopped at 50th bet 6&7 come get out... http://t.co/7dxAP2yewr	1437057668	621691039414386689	f	mtblls
Good Morning Mtbll Lovers! It's that part of the week . The  has stopped on 50th bet 6&7 Aves.  Come on by for your favorite menu item 	1436971914	621331358460289024	f	mtblls
The Mtbll  has taken a personal day! Got to get things done  see ya tomorrow! http://t.co/AXbQ2EMDy7	1436894675	621007393799962624	f	mtblls
Uuggghh It's Monday again   Why not turn your frown upside down and grab your favorite ball!  The Mtbll  has... http://t.co/Cw8q6YZvV3	1436793334	620582342122409985	f	mtblls
TGIF MTBLL LOVERS! The Mtbll  has stopped on 50th bet 6&7 Aves. Come on by for your weekend fix 	1436537156	619507850038112256	f	mtblls
Morning Mtbll Lovers! The  has stopped on 50th bet 6&7 Aves. Come brighten your day with your favorite ball! http://t.co/ZV27trmJny	1436453131	619155427067076608	f	mtblls
Good Morning Mtbll Lovers!  We are halfway to the weekend woohoo. Come on by 50th bet 6&7 for some delicious... http://t.co/8Tgr7441dz	1436364711	618784564811571200	f	mtblls
Morning Y'all! Hope you all have a Terrific Tuesday .  The Mtbll  has stopped on 50th bet 6&7 Aves, come on by... http://t.co/DwHqGOOHJ0	1436280846	618432809825345537	f	mtblls
Good Monday Y'all!   Hope you all had a fun 4th of July. Now it's back to the grind. Nice day for a stroll to... http://t.co/NBnalGgQNT	1436193121	618064864897036293	f	mtblls
Good Morning Y'all!  The weekend begins for most tomorrow sooo, make your own fireworks today with our amazing... http://t.co/uJPr2vzFQz	1435849416	616623261279985664	f	mtblls
Happy  Day Mtbll Lovers! The Mtbll  will be stopped at 50th bet 6&7 Aves.   Come on by for your favorite ball	1435753919	616222718531399681	f	mtblls
Good Tuesday Y'all!  Calls for a nice day.  Why not take a stroll to 50th bet 6&7 Aves for your favorite menu item 	1435681946	615920841881190400	f	mtblls
We are at the 4th avenue festival on 14th street until 6 pm\nkettlecornnyc http://t.co/wCpqmj3tFl	1436626686	619883369216802821	f	kettlecornnyc
Good Monday y'all! Sorry for the late post. It's been a manic Monday for sure   The Mtbll  is stopped at 50th... http://t.co/Brv6a03M42	1435596730	615563418821652480	f	mtblls
Happy  Day Mtbll Lovers. The  is stopped at 50th bet 6&7. Drop on by for your midweek favs. 	1435157826	613722523113508868	f	mtblls
Good Tuesday Y'all!  Another hot one today. Come on by 50th bet 6&7 Aves for some refreshing cold water and... http://t.co/ntwHhPo9Dr	1435071211	613359231908073473	f	mtblls
Happy Monday Mtbll Lovers! The  is shining perfect day for a stroll. Head on down to 50th bet 6&7 Aves. Today's... http://t.co/4pwCY0PjZ7	1434984228	612994399270793216	f	mtblls
Good Thursday Y'all!   The Mtbll  has stopped on 50th bet 6&7 Aves. Come on by for your favorite ball!	1434642190	611559787285884929	f	mtblls
Happy  Day Mtbll Lovers!  Finally a beautiful day   take a stroll to 50th bet 6&7 Aves for your favorite ball. 	1434554248	611190932252266496	f	mtblls
Good day y'all!   Hope you all had a great weekend. The Mtbll  has stopped by 50th bet 6&7 .   Come on by for your favorite ball!	1434466664	610823579266076672	f	mtblls
honestly, this is all we are trying to do at Milk Truck. makepeepshappy https://t.co/3a1d9O4fRS	1437174692	622181870109900800	f	milktrucknyc
the pull https://t.co/St5sY6SZ8w	1437174609	622181522213355520	f	milktrucknyc
salsa verde https://t.co/oyPOwbldM0	1437086151	621810503988420608	f	milktrucknyc
Bessie's at Water St. and Broad St. today for lunch! Call 646-504-6455 to pre-order. Seaport kiosk open all day until 8pm, 19 Fulton St.	1436881984	620954166006050816	f	milktrucknyc
RT @TheSeaport: This kind of grin can only be caused by a @milktrucknyc grilled Ham & Cheese. \nSeaportSmorg http://t.co/pkRH90SzMC	1436826506	620721474891051008	f	milktrucknyc
@1nationundrfood thank u!!	1436725522	620297917711187968	f	milktrucknyc
RT @1nationundrfood: late post - thanks for the yummy grilled gruyere sandwich @milktrucknyc grilledcheese sandwiches... https://t.co/6g0w0...	1436725507	620297851525066753	f	milktrucknyc
RT @HannahMylrea: @milktrucknyc thanks! We found you at Seaport instead!	1436544227	619537510989987841	f	milktrucknyc
RT @foodbabyny: Seriously good Pig & Gruyere Grilled Cheese from @milktrucknyc at smorgasburg... https://t.co/UuzXPphyzH	1436544222	619537490328752128	f	milktrucknyc
@HannahMylrea 	1436544129	619537098333384704	f	milktrucknyc
Bessie is at Wall St/William St today for lunch, call 646-504-6455 to preorder!	1436542033	619528307697172480	f	milktrucknyc
RT @BernPichardo: tbt to last Sunday at @smorgasburg , eating this tasty Mac-n-Cheese from @milktrucknyc http://t.co/QVS2lbaA7w	1436461516	619190593319763968	f	milktrucknyc
@HannahMylrea hi Hannah. private event today. back at 53rd & Mad next thurs.	1436456183	619168225205600256	f	milktrucknyc
RT @ADoseofCrazy: I see you, @milktrucknyc. milktrucknyc grilledcheese love http://t.co/PiaubZea9G	1436456141	619168050831597569	f	milktrucknyc
RT @BernPichardo: Hey @milktrucknyc thank you for providing my leftovers for work today.  Deliciousness at @smorgasburg macandcheese http:...	1436206346	618120335087534080	f	milktrucknyc
RT @20razz: The @milktrucknyc ham & cheese w/ ranch applewood smoked ham, aged cheddar & mustard on rosemary pullman bread is pretty damn s...	1436152574	617894798318567424	f	milktrucknyc
Happy 4th!! Nothing says america like grilled cheese, amirite? Wburg @smorgasburg and kiosk at @TheSeaport open all day today!	1436020207	617339609010180096	f	milktrucknyc
Truck closed today, but kiosk at @TheSeaport is open until 8pm. 19 Fulton Street, let's kick off the 4th with some American comfort food.	1435932016	616969709083230210	f	milktrucknyc
RT @MajestyBakes: This mac & cheese from @milktrucknyc did not suck whatsoever. Count me as a fan! http://t.co/YjIBKBYQcG	1435784851	616352456121942017	f	milktrucknyc
@mikeyc2113 We have a location at 19 Fulton St at South Street Seaport's Smorgasburg. Open till 8pm.	1435597254	615565617605804034	f	milktrucknyc
RT @randomfoodtruck: Been awhile since I was in on a Friday (humblebrag). Happy to see so many great trucks here! @CamionNYC @carlssteaks ...	1437146346	622062981342449664	f	souvlakitruck
Not in NYC? Check out some awesome Greek restaurants in Montreal: http://t.co/R4h3xmt0pZ via @Thrillist http://t.co/9QXKoc8MtW	1436461362	619189947015266304	f	souvlakitruck
Good news for midtown-ers! Read about our upcoming location from @EaterNY: http://t.co/pb03CXUXch http://t.co/Ib7LE6EEq4	1436369395	618804211443204097	f	souvlakitruck
Have a wonderful 4th of July weekend! SouvlakiGR http://t.co/TT1H6QZ2g1	1436018472	617332332954058752	f	souvlakitruck
@Stellar78 Hello! Please email Kostas at souvlakigr@gmail.com and you can definitely discuss with him - thank you.	1435866613	616695392097300480	f	souvlakitruck
Thanks to all our guests for the awesome SouvlakiGR truck photos! via @Refinery29 http://t.co/FCvC1wamBH http://t.co/hV0d6t2C1n	1435860044	616667840435879937	f	souvlakitruck
It's the perfect meal! Find us at FoodTruckson5th today until 7PM. SouvlakiGR http://t.co/5PjJaPgOdZ	1435676480	615897915010191360	f	souvlakitruck
We're setting up every Tuesday until 7PM - find us! http://t.co/JeOPB9pvdQ http://t.co/t6dEQZXdqA	1435593700	615550709182918656	f	souvlakitruck
Tourists in Greece: 'Everybody should come and spend money here' | via @guardian http://t.co/gG9vREd8cA http://t.co/H64smaLb3y	1435420862	614825777369083905	f	souvlakitruck
Is It Food, or Is It Foodiness? Well, Does It Help You When You're 'Hangry'? - @HuffingtonPost http://t.co/QxChMCMw6l http://t.co/UtymmfnrlH	1435341703	614493757392748544	f	souvlakitruck
Find us today! http://t.co/sg1ZY2XjAf	1435088820	613433089801482240	f	souvlakitruck
RT @EaterNY: P.M. Intel: Food trucks at the NYPL, Cronut mania hits Japan, and more news: http://t.co/ZkL3A8xCzk http://t.co/9D3HJGvDDz	1435084826	613416338086871040	f	souvlakitruck
RT @ZeroCater: Congratulations to ZCNYC vendors @souvlakitruck and @CalexicoNYC on being apart of the Top 10 foodtrucks in NYC! http://t...	1435080864	613399722796150784	f	souvlakitruck
RT @AndysItalianIce: Chilling with my two favorite trucks tonight @bigdsgrub @souvlakitruck	1435079119	613392401131020288	f	souvlakitruck
We're here at the @NYPL Outdoor Reading Room! http://t.co/wgVYZpl6LS via @EaterNY ireadeverywhere newyorkpubliclibrary	1435074084	613371282734850048	f	souvlakitruck
Proud to be featured as one of the top 10 best food trucks! via @USATODAY http://t.co/Bnr4KiSS25	1435007663	613092691585449984	f	souvlakitruck
RT @bryantparknyc: FoodTruckson5th welcome @PhilsSteaks @KimchiTruck @souvlakitruck @NeaExpress & @Redhooklobster taking turns at the @nyp...	1434826209	612331618414522368	f	souvlakitruck
Mykonos isn't the only paradise in Greece. Check out these other beautiful islands: http://t.co/eXeFZSM7cI via @HuffingtonPost	1434650433	611594361143455744	f	souvlakitruck
RT @Scottmirts: Feeling of joy when I see @souvlakitruck on my walk to the office	1434641568	611557177912913920	f	souvlakitruck
It's never a bad idea to souvlaki it up with us. NYStreetFood SouvlakiGR http://t.co/eQ1vbC5PKh	1434218491	609782666012041216	f	souvlakitruck
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
Good morning..!!have you tried Our delicious  breakfast tacos on a gluten-free corn tortilla?	1434456740	610781956280717312	f	etravaganza
Let's begin this social Friday with a Mexican Grilled cheese delicious chorizo,bacon bits,tomato and jalapeno on a multigrain.	1434122325	609379316921692160	f	etravaganza
Good morning it's almost Friday!\nRise and shine breakfast egg wrap\nEgg turkey spinach and avocado on a whole wheat wrap.\nDelicious!!	1434022542	608960797335801856	f	etravaganza
Tres amigos wrap on demand,\nHealthy salad with a delicious toppings,\nCarne asada,pollo asado, chorizo fresco \nAnd more.begins @ 11:36	1433949082	608652681251463168	f	etravaganza
Good morning Midtown.!!\n it's a beautiful day in the neighborhood..!!\nJoin us.breakfast is served!	1433937287	608603211189075969	f	etravaganza
Happy Monday. We are ready for you with a tasty Meal and a smile..!!\nJoin us, 52 & park is the place.	1433778180	607935869782245376	f	etravaganza
Happy social Friday!\nDelicious tacos awaits.	1433519432	606850599213273088	f	etravaganza
Beautiful day in Midtown..!\nPreparing a taste  lunch for ya.\njoin us 52nd Park is the place.	1433346636	606125842327064576	f	etravaganza
Pollo asado and Carne Asada are sizzling..!!would you like it on a salad bowl?or on a tasty burrito!\nJoin us for more.We are @52&park	1432826618	603944728044896258	f	etravaganza
 @BLDG92 start your weekend with Friday's favorite at the Yard. Mouthwatering curries delicious mango lassie http://t.co/W8OIO6asM2	1437129333	621991620527955968	f	mausamnyc
RT @dumbolot: We got @mausamnyc @ToumNYC and @bigdsgrub in the lot today!	1437062528	621711422964277249	f	mausamnyc
Curry Thursday @dumbolot your savory famous Indian cuisine. Enjoy a delicious mango lassie http://t.co/8rw2YCVEsP	1437043691	621632415279226880	f	mausamnyc
don't let the weather stop you! We're ready with our savory Indian cuisine 51st & Park Ave. http://t.co/d7qqLRCj0m	1436966787	621309856188862464	f	mausamnyc
We're back @47 Street between Park and Lexington Avenue. Don't miss out! http://t.co/lht8TOoMdV	1436879906	620945451790016512	f	mausamnyc
Beautiful weekend 2015 Midland Beach celebration @StatenIsland we're back! http://t.co/lN35QHrUeK	1436710531	620235038370758656	f	mausamnyc
Beautiful weekend 2015 Midland Beach celebration @StatenIsland we're here with savory Indian flavors http://t.co/FrDcN1asnr	1436616207	619839418128539652	f	mausamnyc
Happy Friday @BLDG92 Yes! Curry King is here to start you're weekend. Don't miss out! http://t.co/6sHPcwN31Q	1436523807	619451863730135040	f	mausamnyc
Curry Thursday's @dumbolot authentic savory flavors entree & bites great day for our spices http://t.co/Wp7loyPsbT	1436437733	619090842284871680	f	mausamnyc
Happy 4th July to All! Have a safe weekend. http://t.co/LeFuAp0oOA	1436023655	617354073503830016	f	mausamnyc
Celebrate 4th July dinner until fireworks is over @Rooseveltisland with savory Indian flavors. http://t.co/2hIP5BiKNo	1435875193	616731378613420032	f	mausamnyc
RT @dumbolot: We got @ToumNYC @MexicoBlvd and @mausamnyc today!	1435850860	616629319167815680	f	mausamnyc
Curry Thursday @dumbolot savory flavors!curry your style mild,medium,spicy & don't forget mango lassie http://t.co/gRTIyeaCiX	1435832748	616553349383647233	f	mausamnyc
RT @BLDG92: The sun is shining in the forecourt @BLDG92 Grab a picnic table and get in on some curry and Neapolitan pizza @mausamnyc @Bklyn...	1435767814	616280998343483392	f	mausamnyc
@St_Peezy508 yes we do take charge cards	1435760298	616249472302100480	f	mausamnyc
Spice up your day with savory Indian flavorful authentic curries N bites @BLDG95 @BLDG92 http://t.co/gXFa0GUGgA	1435746956	616193514167238656	f	mausamnyc
Dinner @BLDG92 enjoy the greAtest Indian cuisine on wheels http://t.co/ROEPViAuHj	1435688488	615948279180824576	f	mausamnyc
Thanks to @GovIslandFood and  @livefastgroup we'll be vending on @Gov_Island all summer http://t.co/L2sWeI0x06	1435501277	615163060551045120	f	mausamnyc
\n Thanks to @GovIslandFood and  @livefastgroup we'll be vending on @Gov_Island all summer http://t.co/HwUX09RT0B	1435408004	614771844877549568	f	mausamnyc
it's weekend with your favorite Indian Cuisine @Gov_Island we're here! Don't miss out! http://t.co/PLEvvhdg1A	1435407932	614771545253244928	f	mausamnyc
We relocated to\nLexington and  86 street \nUntil 8:30 pm \nkettlecornnyc	1437167366	622151144576581637	f	kettlecornnyc
We're located on 45th st. \nBetween 5th and 6th ave. \nuntil 3:30 pm\nkettlecornnyc http://t.co/EvrEgINV7f	1437148106	622070362466058240	f	kettlecornnyc
We're on Amsterdam 82nd until 9	1437090813	621830058047614976	f	kettlecornnyc
We relocated to Broadway and \n89 st. Until 8:30 pm\nkettlecornnyc	1437080120	621785207591579654	f	kettlecornnyc
We're located on 45th street\nBetween 5th ave and 6th \nUntil 3:30 pm\nSee you soon\nkettlecornnyc	1437062337	621710618790395904	f	kettlecornnyc
We are located at Columbus and 67th st. Until 8:30pm kettlecornnyc http://t.co/c6swK7TmTY	1437002116	621458035857321985	f	kettlecornnyc
RT @MacKevinNYC: @jenconnic @KettleCornNYC so good! What did you get?	1436914455	621090360840855552	f	kettlecornnyc
RT @jenconnic: I was able to catch the @KettleCornNYC truck today on my way to work. Was so happy since I keep missing them!	1436899489	621027586131496960	f	kettlecornnyc
We are located on 45th st..\nBetween 5th ave and 6th ave\nUntil 3 pm\nkettlecornnyc http://t.co/9TTWuYzJMT	1436894010	621004606609444864	f	kettlecornnyc
Too early to tell @MissJoyLewis for July 24th. Most likely 45th btw 5th&6th	1436721896	620282708560846848	f	kettlecornnyc
We're in Forest Hills Queens today.	1436719164	620271247205769216	f	kettlecornnyc
Hey @jesslorengreene, we're in midtown now until 330 pm\n45th btw 5&6	1436549493	619559598471684096	f	kettlecornnyc
We're on 45th btw 5th & 6th until 330pm\nWe will be on Lexington and 86th after 4pm	1436544387	619538183097876481	f	kettlecornnyc
We are located at east 47th \nand Lexington \nUntil 6:30 pm kettlecornnyc	1436110788	617719533445480448	f	kettlecornnyc
We are located at Forest Hills Queens until 9 pm http://t.co/yCcg4N3bki	1436023591	617353805424934913	f	kettlecornnyc
Today we are at \nLexington and 86 st.\nUntil 9pm http://t.co/LOkzas2NON	1435939473	617000988302536705	f	kettlecornnyc
We relocated to Columbus and 67\nUntil 9pm	1435873796	616725520013754372	f	kettlecornnyc
We're on 45th between 5th and 6th ave. until 3:30pm \nSee you soon \nkettlecornnyc http://t.co/Z2yBtypa70	1435851516	616632069117112320	f	kettlecornnyc
Hey @eliane_mitchell come see us tomorrow.	1435774011	616306991758225408	f	kettlecornnyc
RT @APBoardwalk: North Eats, the east coast's very first oceanside food truck court is serving up all kinds of tasty treats all... http://t...	1437156099	622103888796221440	f	neaexpress
Find us at @avpbeach for the Volleyball tournament today through Sunday AVPNYC AVP2015	1437154742	622098196534296577	f	neaexpress
Start your weekend off right with our pizzatruck at @bryantparknyc reclaimyourlunchbreak	1437146950	622065515020861440	f	neaexpress
@AngelRdotMe we are so glad you enjoyed our pizza!	1437137750	622026927784763392	f	neaexpress
Late night in Williamsburg tonight from 11pm to 5am foodtruck nightslice	1437094810	621846821086760960	f	neaexpress
Interested in joining the @NeaExpress team? \nEmail work@neapolitanexpress.com w/ cover letter and resume neaexpress http://t.co/rD6zMtMeDz	1437072162	621751831438475264	f	neaexpress
Just another parmalicious pizza NeapolitanExpress foodtrucks Harlem NYC NewForkCity ... http://t.co/ixoYL04Fh6 http://t.co/Ui2Yk01yVm	1437068836	621737879929266176	f	neaexpress
RT @ekplate2014: Nation's first Oceanfront FoodTruck park Northeats opens in AsburyPark @NeaExpress @seoulfzn @PorkRollTruck http://t.c...	1437057856	621691826177748992	f	neaexpress
It's always a good time to eat pizza! @RoyalPalmsClub See you for dinner tonight! FoodTruck	1436990426	621409003545866240	f	neaexpress
We will be back to @JBLLivePier97 for the EverythingisAwsome tour with @SlightlyStoopid @dirtyheads @TheExpendables tonight at 5pm!	1436986821	621393885084815360	f	neaexpress
Our pizza truck at NewYorkEDITION last night with @wondergiulio and @maxcrespo NYC food... http://t.co/sCEoqjwy95 http://t.co/WkJW6ySkqI	1436978934	621360802243706880	f	neaexpress
Feeding the hungry crowd, Celebrating Over 50 Years of History @therollingstones @hoerlegu... http://t.co/LVtU2D3grO http://t.co/oBR8cH8Faj	1436976749	621351637148377088	f	neaexpress
Lunchtime already? We will be at @BklynNavyYard and @dumbolot until 3pm today reclaimyourlunchbreak	1436972426	621333506182938624	f	neaexpress
Music AND food? Find our foodtruck at the @JBLLivePier97 event with @ColbieCaillat, @christinaperri & @RachelPlatten tonight at 6!	1436904014	621046564069335040	f	neaexpress
Try one of our mouth-watering pizzas! Mentioned in @grubstreet 30 Best Cheap Eats NY @nyma... http://t.co/5OYwxpYM6w http://t.co/6MUfZCrED3	1436820257	620695263112482816	f	neaexpress
Excited to have made it on to Grub Street 30 Best Cheap Eats! Check us out here http://t.co/5hpwjjytfb @NYMag @grubstreet	1436817986	620685737067851776	f	neaexpress
We will see you there with our pizzatruck https://t.co/ZYySesjXlw	1436716812	620261384413032448	f	neaexpress
Excited to see all of you at @prospect_park today for the foodtruckrally  https://t.co/9EzT4dTl9s	1436713208	620246269282246656	f	neaexpress
Late night in TWO locations: Meatpacking and  Williamsburg from 11pm-5am nightslice	1436662806	620034868462751746	f	neaexpress
Pizza will be served all day on our ecofriendly truck on 33rd & Park @CE_NatGas	1436625005	619876318373515264	f	neaexpress
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
Hey guys we are at HANOVER SQUARE today!!! Hope to see you there!!	1436365679	618788625006903297	f	grillonwheelsny
Tuesday is here and we are on 46th and 6th today. Come over and eat!!!kosherschwarmmatasty	1436279495	618427143102590976	f	grillonwheelsny
We are at an event today!!! So we will see you tommorow Nyc	1436190684	618054643852136448	f	grillonwheelsny
Monday is funday and Grill on Wheels is on 46th and 6th today. Come on down!!!!	1436186891	618038733850415104	f	grillonwheelsny
We are back on 46th and 6th today!!! Grub on the grill!!! come and get it!!!	1435842285	616593353371713536	f	grillonwheelsny
Grillin & Chillin  in Brooklyn, we are on Livingston between Hoyt and Smith today.	1435759780	616247300118192130	f	grillonwheelsny
oldtraditionalpolishcuisine PolishTruck Polish pierogi kielbasa traditional NYC https://t.co/JcEssYptNJ	1437172388	622172207951806464	f	polishcuisine
snackfixation's photo http://t.co/efACNBZCA9	1437171796	622169725804507136	f	polishcuisine
vinnybogan's photo http://t.co/lFAu00WNCt	1437171738	622169483759587329	f	polishcuisine
rocker2277's photo http://t.co/xMI5jJm4Tt	1437171595	622168882334183426	f	polishcuisine
PolishTruck kielbasa traditional authentic https://t.co/RWnm423N94	1437170659	622164958370000900	f	polishcuisine
PolishTruck pierogi NYC traditional https://t.co/clqiefK62Z	1437170512	622164337868828673	f	polishcuisine
I posted a new photo to Facebook http://t.co/EWkEiVojhs	1437152969	622090760964415488	f	polishcuisine
I posted a new photo to Facebook http://t.co/5mUz2pADZG	1437147207	622066590469783552	f	polishcuisine
I posted a new photo to Facebook http://t.co/ClPmICaNTV	1437146838	622065045011345408	f	polishcuisine
I posted a new photo to Facebook http://t.co/CUApXqTnEb	1437146687	622064411398774784	f	polishcuisine
I posted a new photo to Facebook http://t.co/m5HlMn9uTo	1437146577	622063950142787584	f	polishcuisine
Open at 11:00 - 47th b/w Park & Lexington - get your midtown lunch on the go!	1437143936	622052871765393408	f	polishcuisine
Happy Friday on 47th bw Park & Lexington Don'tForgetYourPierogi midtown nyc	1437133980	622011113715167232	f	polishcuisine
Great night downtown nyc private party dinner event http://t.co/TfAmrJBQSa	1437089341	621823882752839680	f	polishcuisine
Dinner private party nyc downtown http://t.co/Io1rtd7qqn	1437084014	621801542895570945	f	polishcuisine
@HauteCraigture till next time ;)	1437071954	621750957613928449	f	polishcuisine
I posted a new photo to Facebook http://t.co/ZBeLjiCVhd	1437064464	621719543501688832	f	polishcuisine
I posted a new photo to Facebook http://t.co/qvB4Dcufzp	1437063469	621715367451316224	f	polishcuisine
I posted a new photo to Facebook http://t.co/Yx4teGQjst	1437063392	621715045169369088	f	polishcuisine
Flatiron FLATIRON Flatiron lunchtime is here 5th ave & 21st street nyc traditional	1437063304	621714676506869760	f	polishcuisine
Hello nyc we r open at 47th st. Between park ave. and Lexington ave. try our KOREAN BBQ beef, pork, shrimp  thank you very much	1436887762	620978398945521664	f	bobjotruck
Tfx gigs sbzv. Vv. vegetable	1436371192	618811747286282240	f	bobjotruck
Sunshine nyc we r open at 47th at between park and lex ave. try our world best korean BBQ(galbi,pork,shrimp) and burrito as well thank you	1436282902	618441434266529792	f	bobjotruck
Good morning nyc !! We r ready to serve at 47th st. Btween park and lex Ave. try our korean bbq beef pork and shrimp. PlZ stop by thanx	1435850648	616628428247289856	f	bobjotruck
Good morning nyc !! We r open at 47th st. Btween park and lex ave. try our korean BBQ beef,pork,shrimp !! PlZ stop by and enjoy Thx !!	1435592427	615545370697969664	f	bobjotruck
Good morning nyc !! We r open at 47th st. Btween park and lex ave. try out korean BBQ beef,pork,shrimp !! PlZ stop by and enjoy Thx !!	1435592351	615545054342565888	f	bobjotruck
Good morning nyc ! We gonna open @47th st. Btween park and lex ave. Try our BBQ beef(GALBI),pork,shrimp burrito as well ! PlZ stop by &enjoy	1434465902	610820381369323520	f	bobjotruck
Good morning nyc we r open at 47th st. Btween park and lex ave. try our BBQ rice platter and burritos - beef park and chicken shrimp thanx	1434382170	610469185030893569	f	bobjotruck
Welcome Friday! We gonna open at king and Hudson . PlZ stop by and enjoy our korean BBQ -beep pork and burrito as well thank you!	1434118851	609364745825742849	f	bobjotruck
Hello nyc we r open at 47th st. Btween lex and park ave.	1434037957	609025452213202945	f	bobjotruck
Welcome Monday ! We r reday to serve at 47th st. Btween lex and park ave. TRY OUR WORLD BEST KOREAN BBQ rice bowl!!!  Thank you	1433777135	607931483819507712	f	bobjotruck
Welcome Friday ! We r open @47th st. Btween park and lex ave. try our BBQ beef pork shrimp , bbq burrito as well . PlZ stop by and enjoy Thx	1433518455	606846502586216448	f	bobjotruck
We r move to open at varick and king st.  Try our korean bbq and bbq burrito!!	1433354239	606157731108659200	f	bobjotruck
Good morning nyc we r ready to serve @47th btween park and lex Ave. try our bbq rice platter with beef, pork, shrimp. PlZ come by and enjoy~	1432826384	603943745143349248	f	bobjotruck
Hello New York we r open at king and Hudson st. Try our Korean bbq  rice platter and bbq burrito as well. PlZ come by and enjoy thank you !	1432740890	603585157849833473	f	bobjotruck
Hello NYC! We r open @47th st. Park and lex ave. try our Korean BBQ (Bef pork chicken and shrimp) , BBQ BURRITO as well plZ stop by! Thx	1432653139	603217106004484097	f	bobjotruck
Welcome Friday !! We r open at king and Hudson . Try our world best korean BBQ beef(galbi)pork chicken and bbq burritos as well! Thank you	1432310575	601780286607794176	f	bobjotruck
Good morning! We r ready to serve at 46th st.btween 5th&6th ave. Try our Korean BBQ rice platter (beef,pork,chicken) and BBQ BURRITOS! Thx!!	1432222498	601410866412691456	f	bobjotruck
Hello nyc we r open @king st. And Hudson now. Try our BBQ rice bowl and bbq burrito . PlZ come by and enjoy thank you !!	1432136231	601049036477566976	f	bobjotruck
Hello nyc we r open at 46th brween 5th and 6th ave!! Try our KOREAN BBQ-. PlZ come by and enjoy thank you!!	1432050614	600689932982755328	f	bobjotruck
GN WORLD!!! https://t.co/RlZlbashsg	1437208973	622325658186850304	f	latinkitchennyc
SOLDOUT \nKELLZ\n@tcpent_ \nFOXWOODS CT. https://t.co/uIRTgfZ7iI	1437183347	622218174877069312	f	latinkitchennyc
THE CALM B4 THE STORM\nRKELLY FOXWOODS SOLD OUT https://t.co/rvceShp8iq	1437176901	622191137206439936	f	latinkitchennyc
2NITE!!!!  ROUND 2!!!\nBOSTON / RHODE ISLAND / MASSACHUSETTS / NEW YORK CITY / CONNECTICUT ... WE SOLD... https://t.co/K7eZ085dyN	1437168764	622157007550828544	f	latinkitchennyc
GOODMORNING BRONX NY! \nTGIF!! TODAY FRIDAY JULY 17TH\nWE ARE OPEN FOR LUNCH & DINNER\nMI VIEJO SAN JUAN... https://t.co/5xgNiVMU4m	1437144828	622056613805981696	f	latinkitchennyc
SOLD OUT SITUATION AT FOXWOODS CONNECTICUT! !\nTHE KING OF R+B KELLZ!!! https://t.co/iU2TLDqV4W	1437103597	621883677786685440	f	latinkitchennyc
RKELLY CONCERT...WE HERE CT!!! https://t.co/YmaDUz8lnj	1437088942	621822209993109504	f	latinkitchennyc
2NITE / 2MORO and SUNDAY\nTHE KING OF R+B RKELLY\nSOLDOUT AT FOXWOODS CT.\nDJ LUCHO LIVE B4 THE SHOW... https://t.co/DGJEQKYJOV	1437071028	621747071939383296	f	latinkitchennyc
GOODMORNING BRONX NY! \nTODAY THURSDAY JULY 16th\nWE ARE OPEN FOR LUNCH & DINNER 12PM-10PM\nMI VIEJO SAN... https://t.co/6iJBqe8y3j	1437062213	621710101347500032	f	latinkitchennyc
HUNGRY???\nMAKE YOUR WAY TO \nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX NY  10465\n347-6913100\n**open... https://t.co/ghFQaIEFWX	1437001367	621454893870641152	f	latinkitchennyc
Goodmorning Bronx NY! \nWe are open for lunch and dinner \nMI VIEJO SAN JUAN \n2920 Bruckner Blvd \nBronx... https://t.co/ZLErDtkAnf	1436975584	621346754047426560	f	latinkitchennyc
GOODMORNING BRONX NY! \nTODAY TUESDAY JULY 14TH\n(we are open for lunch and dinner  12pm-9pm)\nMI VIEJO... https://t.co/fn86Zr4R84	1436883404	620960122836271104	f	latinkitchennyc
Goodtimes at Studio Square LIC Queens!!!\n\nk7tka djluchony feverrecords studiosquarenyc... https://t.co/G0v06W6jAo	1436804491	620629138009944064	f	latinkitchennyc
My view Studio Square https://t.co/LAZnolGanz	1436755467	620423513648799744	f	latinkitchennyc
HELLO BRONX NY!!\nTODAY SUNDAY JULY 12TH \nWE ARE OPEN FROM 2PM-9PM\nMI VIEJO SAN JUAN \n2920 BRUCKNER... https://t.co/WE2vnBYJMK	1436729076	620312824464678912	f	latinkitchennyc
TODAY SUNDAY JULY 12 AT 4PM-10PM\nWE INVADE LIC QUEENS STUDIO SQUARE BEER GARDEN\nTKA \nROB BASE C+C... https://t.co/eA1QSfz93u	1436713334	620246796758065152	f	latinkitchennyc
LOOK WHO I FIND AT AMOR CUBANO 111 st 3rd Ave El Barrio...   LUISITO QUINTERO!!! https://t.co/pxbJqIPyOt	1436665019	620044149157425152	f	latinkitchennyc
PLEASE GET THERE EARLY..\nPHONES ARE OFF THE HOOK\nSTART TIME 4PM-10PM\nIT'S GONNA BE CRAZY!!! https://t.co/7YXN2KAwMT	1436663130	620036223957082112	f	latinkitchennyc
HAPPY SATURDAY!!!\nHAVE YOU TRIED THE \nTRIFONOGO / JIBARITO / MAMIS POLLO / MAMIS FLAN DE COCO??\nMI... https://t.co/ubh7BNmg4t	1436636341	619923863015657472	f	latinkitchennyc
2MORO SUNDAY \nALL ROADS LEAD TO STUDIO SQUARE LIC QUEENS\nOLD SCHOOL BBQ\nTKA SOUL SONIC FORCE ALYUS &... https://t.co/XoQ4tJX6Za	1436634567	619916424279126016	f	latinkitchennyc
Lunch 2day @ 7 Hanover sq b/t water & pearl. Burger of the week THE TEXAN Preorder 9172929226 fidi	1437140830	622039846048124928	f	fritesnmeats
Peep, we are off the road 2day for an private event	1437054200	621676491621990401	f	fritesnmeats
Lunch 2 day @ hudson & king ST.  Burger of the week THE TEXAN preorder 9172929226 soho	1436968021	621315031871954944	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE TEXAN preorder 9172929226 fidi	1436882218	620955148370714625	f	fritesnmeats
Lunch 2day @ 50th st b/t 6th & 7th av. Burger of the week THE TEXAN. Preorder 9172929226 midtown	1436796015	620593585407328260	f	fritesnmeats
Lunch 2day @ 10 Hanover sq b/t water & pearl st. Burger of the week THE CHEVRE TRUFFLE BURGER. Preorder 9172929226 fidi	1436535159	619499476672090113	f	fritesnmeats
Hello Brooklyn, lunch 2day @ front & jay st. Burger of the week THE CHEVRE TRUFFLE BURGER. Preorder 9172929226 dumbo @DUMBOFoodTrucks	1436449769	619141322717401088	f	fritesnmeats
Lunch 2day @ hudson & king. Burger of the week THE CHEVRE TRUFFLE BURGER. Preorder 9172929226 soho	1436364470	618783555850735616	f	fritesnmeats
Lunch 2day @ 10 Hanover sq b/t water & pearl st. Burger of the week THE CHEVRE TRUFFLE BURGER. Preorder 9172929226 fidi	1436276934	618416400403701761	f	fritesnmeats
Lunch 2day @ 50th st b/t 6th & 7th av. Burger of the week THE CHEVRE TRUFFLE BURGER. Preorder 9172929226 midtown	1436189766	618050794689052672	f	fritesnmeats
HappyBirthdayU.S.A.Happy4thofJuly! Enjoy the show all!!	1436053765	617480363259101184	f	fritesnmeats
Hello Brooklyn, lunch 2day @ jay & front st. Burger of the week THE BYMARK preorder 9172929226 dumbo @DUMBOFoodTrucks	1435845937	616608668017119232	f	fritesnmeats
Lunch 2day @ Hudson & king. Burger of the week THE BYMARK. Preorder 9172929226 soho	1435758912	616243662180233216	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE BYMARK preorder 9172929226 fidi	1435673003	615883333357182976	f	fritesnmeats
Peeps, we are off the road 2day	1435585809	615517615184814080	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water & pearl. Burger of the week THE HEAVENATOR preorder 9172929226 fidi	1435326417	614429645304426496	f	fritesnmeats
RT @mperri99: I just sang Holiday Road to a bag of @fritesnmeats fries... ReasonsMyDietWontWork	1435277661	614225147353001984	f	fritesnmeats
Hello Brooklyn, Lunch 2day @ front & jay st. Burger of the week THE HEAVENATOR preorder 9172929226 dumbo @DUMBOFoodTrucks	1435240218	614068098832965636	f	fritesnmeats
RT @FoodtoEat: We love @fritesnmeats! Try their burgers and have their truck sent to cater to your office today! fritesnmeats foodtruckca...	1435175927	613798444088561664	f	fritesnmeats
RT @EditrixDiane: There are 34 people waiting for @fritesnmeats burgers right now. They need two trucks!	1435175894	613798306830004224	f	fritesnmeats
TGIF we are @dumbolot jay & water 1130-3! porkbelly friedegg sriracha fries nyc bacon sun thaietnamese lunch eatoutside spicy	1437146140	622062114392383489	f	sweetchilinyc
americanexpress corporate cafeteria @ American Express Tower https://t.co/AP0gpbSa0A	1437061530	621707237501837312	f	sweetchilinyc
Truck is on Old Slip & Water 1130-3! FiDi\nWe are also in the cafeteria @AmericanExpress @BrookfieldPLNY 1130-230! SweetHeat Lunch	1437057602	621690759603949568	f	sweetchilinyc
Truck is on broadway btw Houston & Bleeker 1130-3! \nAlso catch us @AmericanExpress @BrookfieldPLNY in the cafeteria 1130-230! thaietnamese	1436969970	621323206411067393	f	sweetchilinyc
@CLDesi810 yes!!	1436969909	621322947735748608	f	sweetchilinyc
It's time for lunch @dumbolot jay & water 1130-3! porkbelly friedegg sriracha fries nyc foodtruck brooklyn	1436888914	620983233275146240	f	sweetchilinyc
RT @dumbolot: Happy Tuesday with @carlssteaks @SweetChiliNYC and @KimchiTruck!	1436883625	620961050423369729	f	sweetchilinyc
RT @FoodtoEat: Over @SweetChiliNYC they're taking Thai/Vietnamese to the next level with Chef Lisa Fernandes! Read about it here: http://t....	1436829097	620732342613737472	f	sweetchilinyc
No truck today. Catch us tomorrow at jay & water 1130-3! Happy monday!	1436798375	620603481976610816	f	sweetchilinyc
Wow what a beautiful sunday to be @Gov_Island @GovIslandFood @GovIsAlliance 1130-6! outside greatweather nature http://t.co/6VPeweLDLu	1436712318	620242536330829824	f	sweetchilinyc
RT @GovIslandFood: What an amazing day out. Come over to @Gov_Island and bike around and grab some food from the yummy @SweetChiliNYC @carl...	1436636197	619923258519998468	f	sweetchilinyc
We are hiring! http://t.co/6veoS050UZ	1436634084	619914397192953856	f	sweetchilinyc
weekendplans??\nGet out to @gov_island today 1130-6 for some StreetEat delicious thaietnamese food sriracha fries and some sunshine! YES	1436624899	619875871030161408	f	sweetchilinyc
Looking for an exciting outdoor summer job? We are hiring cashiers and truck line cooks! Email us info@sweetchilinyc.com jobs jobsearch	1436555631	619585341792616448	f	sweetchilinyc
No truck today but catch us 1130-230 americanexpress @BrookfieldPLNY and tonight @LCSwing in Lincoln... https://t.co/1XSqmW12tI	1436452149	619151308583530496	f	sweetchilinyc
@danielleodiamar @ninafrazier sorry! !!!	1436373444	618821195388088320	f	sweetchilinyc
Sorry no truck today. Back tomorrow!	1436371680	618813796811960320	f	sweetchilinyc
Evening @LCSwing we are here to dine and dance with you till 10pm! dance eat LCSwing	1436305983	618538243492048897	f	sweetchilinyc
RT @dumbolot: Happy Tuesday with @carlssteaks @SweetChiliNYC and @KimchiTruck!	1436284248	618447077501218817	f	sweetchilinyc
We are on old slip & water 1130-3! porkbelly friedegg sriracha fries nyc bacon sun thaietnamese lunch eatoutside spicy	1436195838	618076260242190336	f	sweetchilinyc
Happy Friday. We are on 47th & Park. Its lunch time!	1437147034	622065864280547328	f	schnitznthings
Happy Thursday Schnitzlers, we are on 52nd street & 6th ave today.	1437061232	621705985858650112	f	schnitznthings
Come get your Schnitzel lunch, we are on 51st street Park & Madison.	1436977931	621356596908662785	f	schnitznthings
@JPatanio is this your company?	1436213586	618150700460187649	f	mactruckny
Sorry guys, had to change location.  We are at 51st street Park & Madison today.	1436977393	621354340356329472	f	schnitznthings
Grab your Schnitzel lunch today, we will be on 52nd & 6th.	1436887324	620976562708553729	f	schnitznthings
Hey Schnitzlers,  we will be on 47th & Park today.	1436800902	620614084560592896	f	schnitznthings
Hey Schnitzlers Beets & Feta is back on the menu. Happy Friday	1436543388	619533992057008128	f	schnitznthings
Hey guys we will be on 47th & Park today.	1436542258	619529252258598917	f	schnitznthings
Hey Schnitzlers, we will be on 26th street West side to 11th ave today.	1436452752	619153834900856832	f	schnitznthings
Hey guys, we will be on 47th & Park today.	1436370767	618809964916834307	f	schnitznthings
Happy Tuesday. We will be on 52nd & 6th ave today for lunch.	1436281366	618434989001175040	f	schnitznthings
Hey guys, we will be on 47th & Park today.	1436194627	618071182219300864	f	schnitznthings
Happy Friday. We will be on Pearl & Broad today.	1435934650	616980760134852610	f	schnitznthings
Wr are on 47 and park today!!!	1435770924	616294040712159232	f	schnitznthings
Hey guys we will be on 52nd & 6th today for lunch.	1435680781	615915954673963008	f	schnitznthings
Happy Monday. We will be on 47th & Park today.	1435593157	615548432116240385	f	schnitznthings
Hey guys were on Pearl between Coenties & Broad come on down have you had your Schnitzel lunch today?	1435337380	614475625475252224	f	schnitznthings
Happy Friday. We will be on Pearl Street & Broad today.	1435330624	614447288681934848	f	schnitznthings
Hey Schnitzlers we will be on 26th street West to 11th ave today for lunch.	1435245788	614091461827633152	f	schnitznthings
Lunch time Schnitzlers. We will be on 51st Park & Madison today.	1435161923	613739705469927425	f	schnitznthings
RT @thegloryofphire: this burrito stands no chance based korilla nyc https://t.co/88SiiIc9EX	1437170586	622164648478048256	f	korillabbq
RT @hydro528: If you watch the NY Korean News channel. Keep an eye out for my interview today at the Korilla food truck. Ground breaking st...	1437170573	622164596460265472	f	korillabbq
RT @opavez: @KorillaBBQ thanks guys! Today lunch was awesome because of you  http://t.co/wmAHEVZswf	1437170528	622164405934014464	f	korillabbq
Done in Midtown!	1437157072	622107967211597824	f	korillabbq
And its FiDi Friday! Front & Old Slip ready by 12:30	1437147703	622068672325099520	f	korillabbq
RT @Jordanleequinn: Finally had @KorillaBBQ last night......those pork tacos.....	1437147009	622065759750111232	f	korillabbq
RT @JashonSingh: @KorillaBBQ for lunch today. hit the spot	1437147003	622065737449013248	f	korillabbq
Thanks for the love, Bro!  https://t.co/1dyl2Bm8HV	1437146989	622065678116343808	f	korillabbq
Were up for Americas Best Food Truck! Show us some love + vote!  http://t.co/OG7snO2MF7 via @TheDailyMeal http://t.co/KtHah6tEA2	1437145824	622060791081119745	f	korillabbq
Wsup Midtown East! 47th & Park ready by 12	1437145711	622060314855645184	f	korillabbq
Hot new topping for the summer!  Our Korean Potato Salad is made with red bliss potatoes steamed... https://t.co/ouNH9SlfB6	1437076151	621768561409794049	f	korillabbq
Now serving 55th & Broadway!	1437063768	621716621430800384	f	korillabbq
Lunch today at \nMidtown West (55th & Broadway)\nMetrotech (Myrtle & Lawrence)	1437056645	621686745986375680	f	korillabbq
Were up for Americas Best Food Truck! Show us some love + vote!  http://t.co/OG7snO2MF7 via @TheDailyMeal http://t.co/6uPLHS5Nb4	1436982139	621374247387176960	f	korillabbq
Now serving at FiDi Old slip and Front!	1436976977	621352594364100608	f	korillabbq
@sevennn Catch us at our shop on 8th St & 3rd Ave or tmrw from 12-3pm @DUMBO (Jay St & Front St) or FiDi (front St @ Old Slip).	1436908193	621064095282896898	f	korillabbq
Delivery in 15 mins! Order Chicken Salad Bowl or Spicy Pork Noodle Bowl via @TryCaviarNYC http://t.co/Z3TujudLhu http://t.co/oMfBOlYGAT	1436889161	620984269771554816	f	korillabbq
Truck 2: Midtown West 55th & Bway ready by 12:30	1436886567	620973386731233280	f	korillabbq
Truck 1: SOHO varick & vandam ready by 12!	1436884956	620966629669765120	f	korillabbq
Order via @TryCaviarNYC!  https://t.co/HNEDGh6xqo	1436814292	620670244990918656	f	korillabbq
Always a pleasure! https://t.co/MweNmQbgVl	1437181589	622210800757927937	f	waffletruck
RT @jisooos: First goal of the day: @waffletruck in bryant park. Mission accomplished http://t.co/10vECCCNAV	1437180209	622205011020398592	f	waffletruck
RT @lijodelmar:  @waffletruck http://t.co/2a7iQKZ6Sn	1437180190	622204934142955520	f	waffletruck
IceCreamWeather & a view! http://t.co/YTDriiOCGW	1437173699	622177708051554305	f	waffletruck
For one free dinges, impersonate your favorite emoji smiley face! dingesforeveryone	1437156856	622107063863353344	f	waffletruck
De CARTS 2/2:\nBierbeek @ De Great Lawn, Central Park til 7pm	1437143673	622051770395688960	f	waffletruck
De CARTS 1/2:\nVedette @ 59th & 5th Ave (Manhattan) til 7pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm\nGoesting @ 66th & Broadway til 10pm	1437143660	622051712854065152	f	waffletruck
THANK DINGES IT'S FRIDAY\nLe Cafe @ 15 Ave B til 11pm\nWafel Cabana @ 35th & Broadway til 10pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1437143632	622051598638927872	f	waffletruck
For one free dinges, order your wafel as if it were a State of the Union speech! dingesforeveryone	1437061988	621709155494178817	f	waffletruck
De CARTS 2/2:\nBierbeek @ De Great Lawn, Central Park til 7pm	1437055243	621680868311085056	f	waffletruck
De CARTS 1/2:\nVedette @ 59th & 5th Ave (Manhattan) til 7pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm\nGoesting @ 66th & Broadway til 9pm	1437055229	621680805849513984	f	waffletruck
DE THROWDOWN THURSDAY\nLe Cafe @ 15 Ave B til 11pm\nDe Wafel Cabana @ 35th & Broadway til 10pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1437055214	621680745506058240	f	waffletruck
For one free dinges, order your Wafel with an echo, echo, echo! dingesforeveryone	1436973889	621339641938079744	f	waffletruck
De CARTS 1/2:\nVedette @ 59th & 5th Ave (Manhattan) til 7pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm\nGoesting @ 66th & Broadway til 9pm	1436973154	621336560579915776	f	waffletruck
De CARTS 2/2:\nBierbeek @ De Great Lawn, Central Park til 7pm	1436973154	621336560575737860	f	waffletruck
WAFEL CRUSH WEDNESDAY\nLe Cafe @ 15 Ave B til 11pm\nDe Wafel Cabana @ 35th & Broadway til 10pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1436973154	621336560567390208	f	waffletruck
De CARTS 2/2:\nBierbeek @ De Great Lawn, Central Park til 7pm	1436878776	620940711765110784	f	waffletruck
De CARTS 1/2:\nVedette @ 59th & 5th Ave (Manhattan) til 7pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm\nGoesting @ 66th & Broadway til 9pm	1436878342	620938889054814208	f	waffletruck
TANTALIZING TUESDAY!\nLe Cafe @ 15 Ave B til 11pm\nDe Wafel Cabana @ 35th & Broadway til 10pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1436878317	620938787036770304	f	waffletruck
For one free dinges, recite the ABCs as fast as possible dingesforeveryone	1436810665	620655031465873408	f	waffletruck
@BrodesCPerry Glad to hear it! Thanks for trying BigRed	1437153489	622092938680619008	f	lobstertruckny
It's Friday! TreatYoSelf to a lobster lunch at 46th and 6th HappyWeekend http://t.co/gxlCfPnHYa	1437149784	622077400545890304	f	lobstertruckny
Check out BigRed's menu for this weekend at LauritaFoodTrucks http://t.co/x42Z9B7FSa http://t.co/vcNBerbfr0	1437147136	622066292179251200	f	lobstertruckny
You can find BigRed at @njlauritawinery this weekend for wine, fireworks and tons of food! LauritaFoodTrucks http://t.co/lXcumX6zPI	1437145433	622059152211361792	f	lobstertruckny
@BrodesCPerry We'll be there until 3pm!	1437143625	622051568544804864	f	lobstertruckny
Happy Friday New York! BigRed will be on 46th and 6th today. Go get your lobster on!	1437141840	622044081405956097	f	lobstertruckny
@AlisonBasford BigRed will be back on the street tomorrow.	1437082042	621793268251164672	f	lobstertruckny
@BrodesCPerry We'll be sure to keep you posted! Welcome to New York :)	1437076764	621771132748845057	f	lobstertruckny
RT @innozal: @lobstertruckny the clam chowder and shrimp role were amazing.  happy&full	1437073991	621759499326648325	f	lobstertruckny
@BrodesCPerry you can still catch BigRed outside the library until 3:30!	1437073980	621759455093522433	f	lobstertruckny
When you realize you get to eat a lobster roll for lunch. Catch BigRed at 40th and 5th! http://t.co/vMvOwfoM8w	1437062709	621712182766632960	f	lobstertruckny
Who knew BigRed was such a book worm? Find us outside the New York Public Library at 40th and 5th! http://t.co/olAdn0PWCM	1437059057	621696863931138049	f	lobstertruckny
BigRed is back on the streets serving up sunshine and lobster at 40th and 5th! http://t.co/HvBIenYzm2	1437055414	621681582760443904	f	lobstertruckny
Hey @nicadomi ! We're serving up our delicious burger at our Red Hook location on 284 Van Brunt Street http://t.co/0E1o6yD40R	1436993415	621421541281153024	f	lobstertruckny
This weekend BigRed will be @njlauritawinery sipping on estate wines and serving up hot rolls http://t.co/VqX4CGNPq8 http://t.co/QSH4zEaOsi	1436972700	621334654424096769	f	lobstertruckny
@shefineperry BigRed is off the streets today for a private event. Check back in tomorrow!	1436969905	621322934204919808	f	lobstertruckny
BigRed is booked today for a private event. If you would like to book, please email catering@redhooklobster.com	1436969097	621319544678842369	f	lobstertruckny
RT @redhookflicks: What's for dinner during tonight's screening of COMING TO AMERICA? Lobster Rolls and Hot dogs courtesy of @Redhooklobste...	1436910420	621073434278236160	f	lobstertruckny
BigRed will be heading to RedHookFlicks around 6:30 tonight for the screening of Coming to America. Get your lobster and laugh on!	1436907824	621062545571512321	f	lobstertruckny
A little rain doesn't scare BigRed. Catch us @redhookflicks tonight!	1436904203	621047358445461504	f	lobstertruckny
RT @glennEmartin: Statement on @POTUS' visit to a Federal prison today. @BuzzFeedAndrew  @mschwirtz  @MRSmithAP  @mniquette @BuzzFeed http:...	1437146585	622063981415518208	f	snowdaytruck
RT @POTUS: Mass incarceration doesn't work. Let's build communities that give kids a shot at success and prisons that prepare people for a ...	1437143859	622052548812386305	f	snowdaytruck
RT @BryanPaz_: Senator @CoryBooker makes a strong argument for CriminalJusticeReform. Let's get this done! http://t.co/8nJpgnZ9Mk	1437141833	622044051819397121	f	snowdaytruck
See you hungry minds at 1 Hogan Place today ...lunch is served with a side of social justice @verainstitute @YouthRepresent	1437141774	622043804548382720	f	snowdaytruck
Hello Manhattan! 1 Hogan Place for lunch tomorrow!!	1437069766	621741781785444352	f	snowdaytruck
.@Zagat thanks for the love !! Make sure to find us Tailgate us @SnowdayTruck	1437003711	621464727638646784	f	snowdaytruck
RT @Zagat: This NYC food truck hires people out of prison and gives them skills for their new life http://t.co/5n7CHoykFx http://t.co/AqogS...	1437003665	621464533052334081	f	snowdaytruck
Honored to cater @NYCMayorsOffice of Criminal Justice Today - reformnow	1436958853	621276579109408768	f	snowdaytruck
@BatteredCake private events until Friday at downtown Manhattan / city hall	1436817340	620683030814937088	f	snowdaytruck
Do you tailgate us?? know where to find NYCs best new food truck - we're in @prospect_park Grand Army today 11-4:30 http://t.co/V5aRt5d08n	1436709921	620232482865213441	f	snowdaytruck
A Day in the Life Feature by @Zagat & @HuffingtonPost - They joined us for a day on Gov Is. YOU SHOULD TOO!\nhttps://t.co/tkcKtaPMPK	1436641399	619945079361417216	f	snowdaytruck
We're serving up award winning food with a side of social justice-Governors Island today & Prospect Park sun 11-5pm http://t.co/BsfTFbEvPl	1436630237	619898261630025728	f	snowdaytruck
Y'all better come find us tomorrow on Governors Island - we're cooking up a storm & celebrating summer - keep trucking	1436576163	619671459946958848	f	snowdaytruck
Get your good grub on @TheBronxBrewery - till 10pm	1436572878	619657681096310784	f	snowdaytruck
Good morning NYCer's - after all the ticker-taping today with @ussoccer_wnt - you'll work up an appetite! Join us @TheBronxBrewery 5-10pm	1436529911	619477464528617472	f	snowdaytruck
We asked our community to voice what they see as the biggest problem with the system @BronxDefenders blockparty http://t.co/NP3DX0B0go	1436447688	619132595687792644	f	snowdaytruck
@galeabrewer we'd love to bring the truck tomorrow to celebrate @ussoccer_wnt at City Hall / @NYCMayorsOffice -it would be an honor.	1436443116	619113421276119040	f	snowdaytruck
MindyTarlow @NYCMayorsOffice we want to serve NYCs finest fare to the worldchampions @ussoccer_wnt !! @galeabrewer great idea!	1436387930	618881953010458624	f	snowdaytruck
We've got a great idea @BilldeBlasio @NYCMayorsOffice - hire us to serve food w/ a side of social justice to the @ussoccer_wnt this Fri!	1436387573	618880456034004992	f	snowdaytruck
What a great day @BronxDefenders - this is love. This is community. This is the Bronx. http://t.co/ZTnYzo2VZr	1436381286	618854086792859648	f	snowdaytruck
.@hillarydixler every other Thursday unfortunately, won't be back until next week. Veggie dogs are @YvesVeggie brand	1436906642	621057588801765376	f	papayakingtruck
Serving at @prospect_park FoodTruckRally today2, 11a-5p http://t.co/fpYSIZng5u @dispatchny @nycfoodtruck	1436724430	620293337132703744	f	papayakingtruck
Menu today at the @4knotsfest Festival FoodCart http://t.co/UeuSKUVkvy	1436632324	619907015368933376	f	papayakingtruck
Today we are at @4knotsfest and a wedding after party at @Studio450 - looking to rent our truck? Email jason@papayaking.com	1436630136	619897837195776001	f	papayakingtruck
Join us today at the @4knotsfest at Pier84 w/ @superfurry & @TwinPeaksDudes http://t.co/no8065CkGO @VoiceStreet 4Knots	1436620507	619857451484102656	f	papayakingtruck
RT @Papaya_King: The only HotDogEatingContest worthy of watching http://t.co/q4LD2oQRNQ	1436028038	617372454491697153	f	papayakingtruck
.@Macys firework party today at LICLanding w/ hot dogs provided by @Papaya_King  happy FourthofJuly 	1436023782	617354606440525825	f	papayakingtruck
Join us @BelmontStakes StarsandStripes event today, our food truck is there!	1436023664	617354112078884864	f	papayakingtruck
RT @TheNYRA: Look at entries for Belmont StarsandStripes: http://t.co/yH7NORjQlr & get more info on day: http://t.co/qbZZ8K2k1r! http://t...	1435789152	616370495496290304	f	papayakingtruck
RT @Papaya_King: pride lovewins http://t.co/9ZHisxwQdi	1435507645	615189770558423041	f	papayakingtruck
Join us at @prospect_park FoodTruckRally today, 6/28, 11a-5p http://t.co/PGKoy154b5 @dispatchny @nycfoodtruck http://t.co/NWat64Fn0b	1435496517	615143095429136384	f	papayakingtruck
Join us at @prospect_park FoodTruckRally this SUNDAY 6/28, 11a-5p http://t.co/lujJcZCn8c @dispatchny @nycfoodtruck	1435343505	614501318045118464	f	papayakingtruck
.@DowntownBklyn, we are back in metrotech. Come get the worlds greatest franks and tropical drinks	1435247479	614098553644953600	f	papayakingtruck
RT @sizzlegriddle: You'll never experience food the way you should unless you eat it with your fingers!	1434547809	611163926169059328	f	papayakingtruck
Stuck on a FatherDays gift? You still have time. 25% off Classic NY Hot Dog Gift Set from PapayaKing via @goldbely http://t.co/NXcCoixjcw	1434547597	611163038197137408	f	papayakingtruck
Serving at the HRPGAMES today at Pier 25, Pier 26, and Pier 40 more info: http://t.co/hG9jjDsY8a https://t.co/q1tuDgjY7x	1434212391	609757080942190592	f	papayakingtruck
Things To Do In Prospect Park This Month - http://t.co/WtqBziEbVB via @Shareaholic	1434146080	609478950398652417	f	papayakingtruck
RT @MobileCuisine: Top Pitfalls Of Opening A FoodTruck & How To Avoid Them http://t.co/pguJj1cpl7	1434122037	609378106802049024	f	papayakingtruck
RT @DowntownBklyn: Metrotech, lunch just got yummy. Added to the mix for Food Truck Thurs. Welcome @DomoTaco @CoolhausNY + faves @morristru...	1434031093	608996661671653376	f	papayakingtruck
Beautiful day to eat at a food truck/cart. Visit us at the @IntrepidMuseum or on 5th Ave. and 16th St. http://t.co/bbH6EfKkT6	1433943405	608628870900781056	f	papayakingtruck
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
RT @ShortysTrivia: Dare I say that @LouFerrara is the Tom Brady of 1st Ave...Leader of a consistent WINNER!Tonight's Champs! @shortysnyc ht...	1437071581	621749394581401601	f	shortysnyc
Trivia tonight @shortysnyc -- sponsored by Coney Island Beers. 1678 1st Ave. 8pm. http://t.co/jpmWO3b0i5	1436999669	621447774270308352	f	shortysnyc
@ShortysTrivia 1st place prize tonight-- Four tickets to a @BrooklynCyclone game -- thanks @ConeyIslandBeer http://t.co/cvltzV2bRG	1436998957	621444786327822336	f	shortysnyc
RT @ShortysTrivia: @FakeAdamLyons hosting Trivia tonight at 1st Ave!! @shortysnyc @Suburban_Dave @PheebKingslayer @LouFerrara @gracecgriffi...	1436998889	621444501182222336	f	shortysnyc
RT @ShortysTrivia: 2nd place tonight! MyLittleDick ... Who says you need teammates to win Team Trivia!?!? @itsme_norris @shortysnyc http:/...	1436931360	621161265176662016	f	shortysnyc
RT @ShortysTrivia: From worst to FIRST!!! QuestionableDrinkingHabits ... They bet it all  and took home 1st place!!! @shortysnyc http://t....	1436931347	621161207131676673	f	shortysnyc
RT @ShortysTrivia: Wake Up!!! Only 12 more hours until Trivia @shortysnyc Pearl !! @JJustine @JamieKleinberg @JillianSed @ScottHansen04 @sw...	1436880607	620948390185144321	f	shortysnyc
Trivia starts in 45min ... 1678 1st ave. ShortysNyc ShortysUpperEast UES http://t.co/eCwmNoDZzT	1436397381	618921594853978112	f	shortysnyc
@markzito on the mic -- see you tonight UES ShortysNyc Beer CraftBeer GetPhillyWitIt https://t.co/AXbcOPyxgQ	1436395642	618914297553551364	f	shortysnyc
RT @ShortysTrivia: No @TheRealDananino No Problem.  Last Night's WINNERS MoneyShot @amandaseybold @dschwarz58 @shortysnyc http://t.co/57...	1436395597	618914108755320834	f	shortysnyc
Trivia tonight -- 62 Pearl St. 9pm.  @ShortysTrivia	1436300937	618517076697841664	f	shortysnyc
RT @ShortysTrivia: LIGHTNING ROUND  @shortysnyc @JamieKleinberg @patandriola @JillianSed @TheRealDananino @gracecgriffin @LouFerrara http:...	1436238809	618256495197687809	f	shortysnyc
RT @itsme_jamietx: Seriously craving a BroadStreetBully from @shortysnyc! Wishing for a DC location...a girl can dream.	1436117135	617746156878172160	f	shortysnyc
USA Soccer ShortysNyc  http://t.co/ungdN9w0KW	1436116294	617742630529708034	f	shortysnyc
RT @ShortysTrivia: TONIGHT 1ST AVE 8pm ! @shortysnyc @Suburban_Dave @LouFerrara @gracecgriffin @PheebKingslayer @JJustine @toneburst20 @Jak...	1435792349	616383905684434944	f	shortysnyc
RT @ShortysTrivia: Tonight's WINNERS We wager Zero on the final question because we are smart Thunderdome @Maghielse @JillianSed http://...	1435730753	616125554341888000	f	shortysnyc
RT @ShortysTrivia: 2nd place tonight...Loyalty + Consistency + Their own Twitter handle = @ShrtysTraumatcs  @JamieKleinberg @patandriola ht...	1435730738	616125491431522304	f	shortysnyc
RT @ShortysTrivia: 3rd place tonight but 1st on the Sexy-Meter w/ that bite WizWit MoneyShot @TheRealDananino @shortysnyc @dschwarz58 htt...	1435724557	616099565637386240	f	shortysnyc
USA ... Who will they face Sunday ... Check out all games at your favorite @shortysnyc location  GetPhillyWitIt	1435715823	616062930157764609	f	shortysnyc
USA 	1435712093	616047288071254016	f	shortysnyc
Yessss... it's almost the weekend! lets go to biandang on 53rd and park!	1437144480	622055151570915329	f	biandangnyc
Chow down on some yummy Taiwanesefood on 53rd & Park today!	1437056062	621684300988162048	f	biandangnyc
53rd and park ! biandang	1437055894	621683598287089665	f	biandangnyc
Back to 53rd & Park for the humpday cure: extra porksauce	1436964781	621301439969689600	f	biandangnyc
Happy Tuesday from FiDi! Taiwanesefood on Old Slip & Water today	1436878452	620939353309769728	f	biandangnyc
back at it on 50th & 6th porkchop taiwanesefood yum	1436796533	620595758681706497	f	biandangnyc
Happy Friday from 53rd & Park!	1436533077	619490744173248512	f	biandangnyc
Back at it on 53rd & park	1436451873	619150150099935233	f	biandangnyc
Happy humpday back on 53rd & Park today	1436364700	618784517927641088	f	biandangnyc
Welcome back to reality! We can help alleviate some of that pain here on old slip and water!  http://t.co/UGxr1pyg69	1436272050	618395918052794368	f	biandangnyc
Back at it on 50th & 6th! Switch out those bbq leftovers for buns and a biandang today!	1436190252	618052830172200960	f	biandangnyc
RT @AaronZhongWen: :@biandangnyc ()!,I http://t.co/3scj5xFEN4	1435968078	617120964019662860	f	biandangnyc
@huangbenjamin hey Ben. Working on expanding @DomoTaco	1435968050	617120847950671873	f	biandangnyc
We're off the streets today but you could catch us back on 50th & 6th on Monday!	1435931460	616967380426735617	f	biandangnyc
Happy Thursday from 53rd & Park!	1435846803	616612302536753153	f	biandangnyc
Back on 53rd and park for lunch with the special of the day...PORK CHOPS!!!	1435757456	616237553893658624	f	biandangnyc
Hello again FiDi! Catch yourself some Taiwanesefood for lunch on the north side of Old Slip & Water!	1435673510	615885459613450241	f	biandangnyc
Back on Old Slip and Water. Bet you can't find us. Here's a hint. (See photo) http://t.co/5zlIvcm87D	1435664721	615848595342929924	f	biandangnyc
Your favorite taiwanese food truck is back on 50th Btwn 6/7th ave! Come get it! http://t.co/ll8h9MtTp4	1435580990	615497402385072128	f	biandangnyc
We are ready!! dumplings takeadumpling  http://t.co/8jQWF7SThl	1435334364	614462978231037952	f	biandangnyc
RT @NaimaEfuru: I don't play when it comes to mexicoblvd guacamole HangryJames https://t.co/XhUVaEVSNJ	1437172812	622173984906440704	f	mexicoblvd
RT @kln1920: @MexicoBlvd @juanpadayz . Best tacos ever. Thanks for a great lunch today.	1437159288	622117262103810048	f	mexicoblvd
@juanpadayz 11:30-2:30 Midtown 46th St	1437145112	622057803725803520	f	mexicoblvd
Hello NYC! Midtown 46th St. http://t.co/87x9KiaVJk	1437138388	622029601955577856	f	mexicoblvd
Good day midtown. We are doing event today so the truck will not be out on the streets for regular service. We apologize for any withdrawal	1436966283	621307739978002432	f	mexicoblvd
Hello Midtown! TacoTuesday @MexicoBlvd Today 11:30-2:00 46th St	1436879059	620941895896797184	f	mexicoblvd
Buenos dias Dumbo! tacos tortas flautas @MexicoBlvd @dumbolot Water & Jay	1436799139	620606687301488640	f	mexicoblvd
RT @dumbolot: We got @ToumNYC @MexicoBlvd and @dubpies in the lot today!	1436798739	620605010020311040	f	mexicoblvd
RT @CovertEater: What's 4 lunch? Check out @MexicoBlvd 4 the best deal around! 3 flautas w/guac & chips. Now time for a nap. stuffed http...	1436555773	619585937643847681	f	mexicoblvd
@MexicoBlvd Midtown 46th St	1436541548	619526273971392512	f	mexicoblvd
Hola NYC! http://t.co/lITBKgzIQ4	1436533810	619493819038466048	f	mexicoblvd
RT @LisaJ61: @MexicoBlvd made the rain go away w/the yummy deliciousness you bring to the 'hood!! Thank you.  http://t.co/rGpmXmYSvq	1436469428	619223782385917952	f	mexicoblvd
RT @dumbolot: It's Thursday with @ToumNYC @MexicoBlvd and @mausamnyc	1436452337	619152093614579712	f	mexicoblvd
Buenos dias Dumbo! Adobo Pastor Tinga Bistec Veggie @MexicoBlvd @dumbolot Water&Jay	1436448791	619137220490981376	f	mexicoblvd
@AmeliaKaufman Hola, yes we have veggie tacos.	1436382222	618858011059200000	f	mexicoblvd
Midtown 51st St. & Park http://t.co/91QnrtvU90	1436360149	618765430090543105	f	mexicoblvd
Good morning! TacoTuesday @MexicoBlvd Midtown NYC 46th St.	1436278752	618424026113933312	f	mexicoblvd
Hola Dumbo! Enjoy your lunch @MexicoBlvd @dumbolot and have a great week! Water&Jay	1436188069	618043673553575936	f	mexicoblvd
RT @TaimonT717: I do love my MexicanFood here in Texas but mexicoblvd was where it was at!!! NYC FoodTrucks...cant... https://t.co/2KeqYFc...	1436123046	617770947978883073	f	mexicoblvd
http://t.co/JKrJ2SDB5o	1436026125	617364431043993600	f	mexicoblvd
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
Friday!! Dumbo day! Come to @dumbolot where we will be serving you the freshest Thai noodle! Hand cut this morning as per everyday! 11:30-3	1437144992	622057299968950273	f	mamuthainoodle
Late tweet: Thursday uptown peeps you know where to get your thai noodle on! lunch NYC 	1437065005	621721809952616448	f	mamuthainoodle
We are @BLDG92 in BK Navy Yard. Rainy just slowed down. Come by your Thai noodle lunch	1436975880	621347994663841792	f	mamuthainoodle
Sorry 17th & 5th, we're having generator issues. Had to close early. Until next time... 	1436808344	620645298889736192	f	mamuthainoodle
17th & 5th! Monday is your day! Come by for the freshest Thai noodle in town. We just hand cut them for you! mamuthai lunch nyc	1436802694	620621597859254272	f	mamuthainoodle
RT @heartOFqueens: Day 51/100: Last week we grabbed some dinner at @mamuthainoodle before heading to the movies in... https://t.co/uRMEhBlxAT	1436652744	619992663035654144	f	mamuthainoodle
@LosViajeros15 best of luck on your launch! Food truck life is crazy. See you on the streets!	1436498151	619344253127409664	f	mamuthainoodle
RT @mnonsrichai: @RidingShotgunLA While in NYC, gotta head to Queens and check out @MamuThai (or their truck @mamuthainoodle)!	1436389145	618887047600832513	f	mamuthainoodle
Thai Tuesday at our Uptown spot! You know where! Come by for lunch! mamuthai	1436280220	618430185583603712	f	mamuthainoodle
Happy Monday! We're at 17th & 5th ave. today! Join us for your noodle lunch!	1436190619	618054371138514944	f	mamuthainoodle
17th & 5th! Union Square! We're back again today! Come by for the freshest Thai noodle in NYC lunch FoodTruck mamuthai	1435762971	616260683274014724	f	mamuthainoodle
Thai Tuesday is back! Come by Tuesday folks! You know where.. Hint: uptown mamuthai lunch	1435674817	615890940713148416	f	mamuthainoodle
Happy Monday! Truck is on 17th & 5th today. It's been a while since we've been here. Come lunch w/us! NYC foodtrucks	1435591862	615543001067163648	f	mamuthainoodle
RT @aimeelee1207: @fuelgrannie @mamuthainoodle that place is awesome!	1435359734	614569385370513408	f	mamuthainoodle
Dumbo, it's Friday! Come by for your Thai noodle! Yes, they're handcut noodles & fresh off the press daily! @DUMBOFoodTrucks	1435334447	614463326894948352	f	mamuthainoodle
We're back!!! To our loyal fans, we are at our secret Thursday spot! Ya know the corner. Come by!! Hint: uptown. mamuthai lunch nyc	1435245524	614090356473335808	f	mamuthainoodle
RT @JoeDiStefano: HEY QUEENS NYC IS IT TOO EARLY IN THE MORNING TO SHOUT ABOUT THIS SECRET OMELET .@MAMUTHANOODLEI!!??... http://t.co/GSP...	1435075320	613376467666366466	f	mamuthainoodle
. @JoeDiStefano @MamuThai @fuelgrannie thanks so much for coming by! Many more secrets to share next time! So glad you enjoyed our food!	1435069301	613351223656361984	f	mamuthainoodle
@Stellar78 hey there! We are in talks with the navy yard about being there weekly. Will keep you posted!	1435068316	613347089364467712	f	mamuthainoodle
We are back! Truck is finally out of the hospital! Dumbo! You know that means hot fresh Thai noodles! Join us for lunch! @DUMBOFoodTrucks	1434730018	611928165259321345	f	mamuthainoodle
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
Located on 50th between 6th&7th	1427206096	580370548636667906	f	thepocketful
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
Today at 56th st and Broadway. Come try the today special Al pastor tacos til 2:30 foodporn... https://t.co/6cnLutc4Cs	1435333637	614459926115655684	f	camionnyc
47th St & Park Ave midtown foodporn fishtaco cod fritters foodtruck foodtrucklife yummy https://t.co/PKefl1cpRI	1435071383	613359955102564353	f	camionnyc
relayforlife2015 bayridge foodporn modernmexican fishtacos foodporn foodtruck https://t.co/kYXQ78y1iO	1434823945	612322122304765952	f	camionnyc
46th St & 6th Ave  midtown alpastor fishtaco modernmexican foodporn https://t.co/7LnDHAYFmi	1434632561	611519400076800000	f	camionnyc
tacotuesday midtown fishtacos foodporn parkave @ E 47th St & Park Ave https://t.co/a3vhtGMaHx	1433864290	608297038741164032	f	camionnyc
TGIF 56th & Broadway till 2:30 fishtacos Fryday midtown @randomfoodtruck http://t.co/Eqc9tPicMY	1433518085	606844950408478720	f	camionnyc
@DKinskeyLebeda thanks David feels good to be back and thanks for the love fidi	1433359704	606180651092606976	f	camionnyc
Truck open at 51st street and Park avenue. Come!!!	1437044501	621635811478532096	f	carpedonutnyc
Truck open at 23rd street and Park avenue south. Come!!!!	1436958801	621276358266724352	f	carpedonutnyc
Truck open at 51st street and Park ave. come!!!	1436785384	620548995602096128	f	carpedonutnyc
Open at Grand Army Plaza. Prospect Park. Food Truck Rally. Come!!'	1436709816	620232042480013312	f	carpedonutnyc
Truck open at 55th street and Broadway. Come!!!	1436526847	619464612149395456	f	carpedonutnyc
Truck open at 51st street and park ave. come!!!	1436440072	619100650950033408	f	carpedonutnyc
Truck open at 23rd street and park avenue south. Come!!!	1436353427	618737236436193280	f	carpedonutnyc
Truck open at Bergen and court street.come!!!	1436094807	617652506777264128	f	carpedonutnyc
Truck open at 55th street and Broadway. Come!!!!	1435920989	616923459592056832	f	carpedonutnyc
Truck open at 51st street and park avenue. Come!!!	1435835561	616565150267670528	f	carpedonutnyc
Truck open at 23rd street and park ave south. Come!!	1435748686	616200767251292160	f	carpedonutnyc
Good morning. Truck open at Grand Army Plaza. Prospect Park. Come!!!!	1435499642	615156202377486336	f	carpedonutnyc
Good morning! We're open at Bergen and Court street today - come by and enjoy a fresh donut and a cup of coffee!	1435404225	614755995722608640	f	carpedonutnyc
Truck open at 55th street and Broadway. Come!!!	1435315906	614385558345940992	f	carpedonutnyc
Truck open at 51st street and park ave. come!!!	1435230203	614026092396060672	f	carpedonutnyc
Good morning. Truck open at 23rd street and Park avenue south. Come!!!	1435143973	613664418929451008	f	carpedonutnyc
Good morning. Truck open at 51st street and park ave. come!!!	1434971334	612940317948575744	f	carpedonutnyc
Open @ Bergen and Court!	1434800843	612225228249395200	f	carpedonutnyc
Truck open at 55th street and Broadway. Come!!!	1434710939	611848142967980032	f	carpedonutnyc
Truck open at 51st street and park ave. come!!!	1434625602	611490214096318464	f	carpedonutnyc
Guys today it is our last day before our nine days vacation, so come to 46 St bet 5&6 Ave from 11:30-3:30 order @www.schnitzi.com	1437055426	621681634585219072	f	schnitzi1
Today @46 bet 5&6 serving lunch from 11:30 until 3:30 order online @www.schnitzi.com schnitzitruck schnitzel foodtruck	1436968983	621319065907425280	f	schnitzi1
Today @46 St bet 5&6 Ave serving lunch from 11:30 until 3:30 fill your Schnitzi stock before the nine days, order@www.schnitzi.com	1436882560	620956583363784704	f	schnitzi1
today we are @Hanover Sq serving lunch from 11-3 order online @www.schnitzi.com schnitzitruck schnitzel foodtruck kosherfood	1436797034	620597857956012032	f	schnitzi1
Governors Island we are here so come get your Schnitzi today schnitzitruck schnitzel foodtruck kosherfood http://t.co/vR5tgBHsTH	1436719903	620274347563974656	f	schnitzi1
Yes we are @46 St bet 5&6 Ave between all the other food trucks, serving lunch from 11:30 - 3:30 order online @www.schnitzi.com	1436450413	619144024792920064	f	schnitzi1
They say it's going to rain so come early we are @46 St bet 5&6 Ave 11:30 - 3:30 order online @www.schnitzi.com schnitzitruck	1436368483	618800387626270720	f	schnitzi1
@46 St bet 5&6 Ave serving lunch from 11:30-2:30 come early we have an event after so we have to  leave @2:30  @www.schnitzi.com	1436278798	618424219785953280	f	schnitzi1
Today we are @Hanover Sq serving lunch from 11-3 order online @www.schnitzi.com schnitzitruck schnitzel foodtruck kosherfood	1436191376	618057547593986050	f	schnitzi1
Today our last day @46 St before the long weekend we will serve lunch from 11:30-3:30, get some garlic mayo before the weekend order online	1435846109	616609391140315136	f	schnitzi1
Today @46 St bet 5&6 Ave serving lunch from 11:30-3:30 order online @www.schnitzi.com schnitzitruck foodtruck kosherfood	1435759733	616247104701362176	f	schnitzi1
46 St we are here bet 5&6 serving lunch from 11:30 until 3:30 order online @www.schnitzi.com schnitzitruck schnitzel foodtruck	1435677022	615900188293615616	f	schnitzi1
We are @Hanover Sq serving lunch from 11-3 get ready to rumble order online @www.schnitzi.com schnitzitruck schnitzel foodtruck	1435589548	615533296353705984	f	schnitzi1
We think the sun will come out and shine on us @Governors Island so we are here today	1435498313	615150628927614976	f	schnitzi1
Look for us @46 St bet 5&6 serving lunch from 11:30 until 3:30 order online @www.schnitzi.com schnitzitruck schnitzel foodtruck	1435242849	614079135732867072	f	schnitzi1
@iamjoshuablum yes we are on 46 bet 5&6	1435168506	613767318544470016	f	schnitzi1
Long time no see, we are back on 46st bet 5&6 Ave serving lunch from 11:30 until 3:30  schnitzitruck schnitzel foodtruck kosherfood	1435067913	613345401807220737	f	schnitzi1
Today June 22 we will serve lunch at Hanover Sq from 11 until 3 order online @www.schnitzi.com schnitzitruck schnitzel	1434983721	612992272808984577	f	schnitzi1
Look at the view from Govenors Island today, the second biggest ship in the world queen Mary 2 eat some schnitzi http://t.co/Yg37QfLAI6	1434900104	612641559545270272	f	schnitzi1
Vote for The first real Kosher Schnitzi truck in Flo's Fabulous Food Truck Contest. flosfoodtruck https://t.co/JhjLGMRjRC	1434653646	611607838348193792	f	schnitzi1
Were you @highlinenyc and it started raining? Come take cover @GansMarket and try a colorful arepa to beat this gray day	1436892798	620999521460453377	f	palenquefood
RT @jgmahoney: Muchas gracias, amigas; me gustan las arepas colombinas. @Palenquefood http://t.co/HOqr5XhNwY	1436194703	618071501930168321	f	palenquefood
What's more patriotic than the NewWhitney? Nothing really, how about paying it a visit and coming after to GansevoorMarket @Palenquefood	1436107952	617707639460466688	f	palenquefood
saboreando arepa de quinoa y pollo en la playa https://t.co/dhKHCUXlAY	1436050947	617468544125661184	f	palenquefood
4thofJuly has already started @theRockawaysNY, come join us for some arepas summer glutenfree homemade http://t.co/wiT81KssKs	1436033729	617396327484231681	f	palenquefood
Feeling traditional or Gallo? Come try our different arepas, start the long weekend with the right foot. glutenfree http://t.co/Ub11chC6ZL	1435936759	616989606303670273	f	palenquefood
Today we are happy To serve u @GansMarket    Until 6 pm delicious And nutritious Arepas http://t.co/Kmr87zHyjh	1435936443	616988279334936576	f	palenquefood
They are going To Montreal! :) https://t.co/RxgbFEMolY	1435767181	616278341910446080	f	palenquefood
@JPatanio sounds interesting, how do i utilize it?	1436213746	618151373134237701	f	mactruckny
Whether is cold or hot in New York City we always down to serve y'all the best Colombian arepas in town ! Come visit us at @GansMarket	1435086535	613423504629886978	f	palenquefood
Happy customer https://t.co/7S2yKmrzri	1434748497	612005672079785985	f	palenquefood
@SamTellCo @UrbanSpaceNYC  vote for palenque https://t.co/fWvSboNBDf	1434747872	612003051474452484	f	palenquefood
@SamTellCo @UrbanSpaceNYC  thanks, we prepare our food for you with love! :)	1434747668	612002196671086593	f	palenquefood
https://t.co/tpYZhP26xE	1434746013	611995252556173312	f	palenquefood
@KristinaMongan thanks :)	1434672670	611687630141394944	f	palenquefood
@KristinaMongan  please vote for palenque https://t.co/fWvSbow0eF	1434670364	611677958462279680	f	palenquefood
RT @KristinaMongan: @Palenquefood TY4my 1st eva Arepa! So friendly &delicious! BwayBites muy bueno! NomNom whatsnext vivacolumbia http...	1434670346	611677884223111168	f	palenquefood
palenuqe & FOX\nhttp://t.co/aK7QA5nJUa	1434651719	611599756213796864	f	palenquefood
We need 50 more votes please, click in the link below, write  palenque and vote! thanks so much for your support! https://t.co/tpYZhP26xE	1434651312	611598049891233792	f	palenquefood
Today, we make Arepas with Telemundo! :) https://t.co/aPCiTLkRsf	1434650670	611595354497282049	f	palenquefood
In rockaway An honguisa and a beautiful girl! :) https://t.co/KhUPhV9mmj	1434144023	609470326578221058	f	palenquefood
It's the @carlssteaks TRIFECTA FRIDAY folks\nBIG CARL - 56TH ST / BDWY \nLIL CARL @INTREPIDMUSEUM 46TH ST / 12TH AV... http://t.co/4oIZD8MKVn	1437144992	622057300845572096	f	carlssteaks
Scream from the rooftops it's CHEESESTEAK FRIDAY folks 56th st / Bdwy @randomfoodtruck @victoriasecret... http://t.co/qO7c58P4HE	1437144794	622056469106716672	f	carlssteaks
Kickin it old school tonight @RoyalPalmsClub in brooklyn aka Del Boca Vista PHASE 2 ha, cheesesteaks & flyin... http://t.co/JL8cYe6H1o	1437083549	621799588647829505	f	carlssteaks
Kickin it old school tonight @RoyalPalmsClub in brooklyn aka Del Boca Vista PHASE 2 ha, cheesesteaks & flyin biscuits GOT WHIZ? nycsbest	1437083500	621799382896279552	f	carlssteaks
Reunited & it feels so good! Back @10 Hanover sq /water st @EmblemHealth @UBSamericas @AIGinsurance cheesesteaks... http://t.co/2y5TqyHfe9	1437055390	621681481652547585	f	carlssteaks
Reunited & it feels so good! Back @10 Hanover sq /water st @EmblemHealth @UBSamericas @AIGinsurance cheesesteaks for all GOT WHIZ? nycsbest	1437055363	621681368435658752	f	carlssteaks
Happy hump day folks 47th st bet park / lex @MLB @nfl @UBSamericas @jpmorganchase @SIRIUSXM @SiriusXMNFL @FoxNews... http://t.co/nIfqeij3Tg	1436969200	621319973974241280	f	carlssteaks
Tuesday Brooklyn day @dumbolot Jay st and water st GOT WHIZ? nycsbest  cheesesteaks for all! ! http://t.co/9yhbpsW8ms	1436883012	620958477901524992	f	carlssteaks
Start your Monday off right with carls famous cheesesteak 52nd st bet 6th/ 7th Av @UBSamericas @Barclays @SIRIUSXM @MHFI GOT WHIZ? nycsbest	1436797628	620600350895120384	f	carlssteaks
Hey folks serving up our famous cheesesteaks @prospect_park, @dispatchny, foodtruckrally GOT WHIZ? nycsbest http://t.co/jqPrJpI0y6	1436714243	620250609103597568	f	carlssteaks
Showin 2x the love today folks\nBIG CARL'S @governorsisland \nLIL CARL'S @INTREPIDMUSEUM 46TH ST /12TH AV... http://t.co/gWPw1KeKcT	1436622689	619866604684361728	f	carlssteaks
Showin 2x the love today folks\nBIG CARL'S @gov_island \nLIL CARL'S intrepidmuseum 46TH ST /12TH AV... https://t.co/5pBjtQpBD9	1436622617	619866299896856576	f	carlssteaks
Scream from the rooftops it's CHEESESTEAK FRIDAY folks! \nBIG CARL 56TH st/ Bdwy @randomfoodtruck @victoriasecret... http://t.co/enc3HWhNfv	1436537793	619510523810476032	f	carlssteaks
Another day of 3x of live from Carls famous cheesesteaks BIG CARLS 49th st 6 / 7 Av @Barclays @SIRIUSXM... http://t.co/ebnVcu2Q0L	1436453756	619158046128893952	f	carlssteaks
Showing 3X THE LOVE TODAY FOLKS!!!\nBIG Carl's 47th st bet lex / park @MLB @nfl @UBSamericas @jpmorganchase\n LIL... http://t.co/KGtKqeq1AR	1436376863	618835534534868992	f	carlssteaks
Tuesdays are brooklyn lovin day!! @dumbolot Jay st and water st GOT WHIZ? nycsbest http://t.co/Ns6hnCG8cO	1436283122	618442356602314752	f	carlssteaks
Tuesdays are brooklyn lovin day!! @dumbolot Jay st and water st GOT WHIZ? nycsbest http://t.co/qrIHhYEJ7P	1436283058	618442088598904832	f	carlssteaks
Start your Monday off right with a carls famous cheesesteak 52nd st bet 6th / 7th Av @UBSamericas @Barclays... http://t.co/eQsPin6vVq	1436189717	618050586269892608	f	carlssteaks
Start your Monday off right with carls famous cheesesteak GOT WHIZ 52nd st bet 6th/ 7th Av @UBSamericas @Barclays @SIRIUSXM @MHFI GOT WHIZ?	1436189474	618049566487805952	f	carlssteaks
Showing ny 2x the love today @Yankees and @gov_island so stop by and grab a carls famous cheesesteak... https://t.co/kU8DF9dV1W	1436121875	617766036167913477	f	carlssteaks
RT @ChefDomTes: @FoodNetwork @mactruckny http://t.co/aAXihvMPqw	1437076271	621769063824523264	f	mactruckny
RT @ChefDomTeam: Waking up with a taste for Mac'N'Cheese! FoodNetworkStar TeamDom @ChefDomTes @mactruckny http://t.co/kbMRuVYvKb	1437020353	621534525861044224	f	mactruckny
RT @ChefDomTeam: I could see this happening! @mactruckny @ChefDomTes TeamDom http://t.co/206cuP3lW1	1437020350	621534514687397888	f	mactruckny
@htico33 thank you so much!! I appreciate you coming to the truck! 	1436885562	620969173775216641	f	mactruckny
RT @Anna_Maes: happy macncheese day fellow macologists- @MacMartTruck @mactruckny - Mac n cheese  it's a lifestyle choice	1436885486	620968854483783680	f	mactruckny
Hoboken pier13 12-10. Last chance till September NYC NJ for that cheesy mac. Then off to the races for the rest of the summer saratoga 	1436716908	620261788307849216	f	mactruckny
RT @TFQfoodtruck: Beautiful day @Pier_13Hoboken with @mactruckny @PVPIZZATRUCK @waffledelys @themoofoodtruck @AmandaBananasNJ @Aroy_D Sund...	1436716718	620260988403752960	f	mactruckny
RT @TFQfoodtruck: FoodTruckFriday @Pier_13Hoboken with @PVPIZZATRUCK @bylthr @waffledelys @mactruckny @Aroy_D @AmandaBananasNJ Hoboken B...	1436560654	619606410972803072	f	mactruckny
Tonight hoboken pier13 4-10	1436559281	619600652273102856	f	mactruckny
@WaxMeisster i dont have the nyc permit anymore... Maybe never!!! 	1436549076	619557847513333764	f	mactruckny
@WaxMeisster no lunch, pier 13 4-10 hoboken nj	1436538454	619513295314251776	f	mactruckny
Tonight hoboken NJ pier 13 4-10	1436471340	619231801144385536	f	mactruckny
RT @ChefDomTes: The truck will be in hoboken tonight 4-10\nFriday 4-10 and sunday 12-10 come get some!!!! @mactruckny	1436464157	619201670828920833	f	mactruckny
@JPatanio FB, IG and twiiter. Is already more than i can keep up with!! @ChefDomTes	1436215114	618157109629349888	f	mactruckny
RT @JPatanio: EdTech Passport is out! http://t.co/qO1EF94Xqe Stories via @kwillsonyshs @mactruckny @classroom_tech	1436213997	618152424927313921	f	mactruckny
@JPatanio gotcha, ill check it out when i get outta work.	1436213993	618152408154292224	f	mactruckny
RT @RobWBailey: Tonight! @FoodNetwork FoodNetworkStar machead Support StatenIsland @ChefDomTes @mactruckny http://t.co/jwghPNTrrg http:/...	1436125806	617782525436514304	f	mactruckny
RT @Valduccis: Who is having Sunday dinner today @greenboxny @Foodtruckgirl7 @FoodtoEat @mactruckny @foodNfest bestpizza meatballs http:/...	1436109774	617715281754984448	f	mactruckny
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
A swarm of food trucks are approaching Hoboken for the Pier 13 frenzy tonight! It'll be a tasty swarm, we promise. Not like most swarms.	1437068804	621737747410198528	f	nautimobile
hey, enjoy a smile today. Pier 13 on this beautiful sunday.	1436716698	620260904559636480	f	nautimobile
Lobster rolls from us are a great choice today, however our favorite Thai food, @Aroy_D is at the pier today. This is a magical place.	1436112804	617727988856156160	f	nautimobile
Mexican Dry Rub Wings from @TFQfoodtruck today at the pier. If you weren't convinced to come down, this should do it http://t.co/O4ccjP2c2Z	1436037338	617411464073211905	f	nautimobile
@mikewaskom sportin' the bandanas you got us 3 years ago today btw http://t.co/Yi7QNsOHZU	1436025197	617360540063633408	f	nautimobile
It's 4th of July on Pier 13. Springsteen on the speakers, and the sun is on her way. Come get fed! @Aroy_D @PVPIZZATRUCK @AmandaBananasNJ	1436023178	617352073701642244	f	nautimobile
If you're wondering, we will be at Pier 13 tomorrow and sunday for the holiday weekend!	1435959584	617085339908329472	f	nautimobile
@ttchee not the truck.  But we have a shop at 207 Washington at always open!	1435865308	616689916001546241	f	nautimobile
@benwietmarschen this is the best news I've heard all year	1435512075	615208351169933312	f	nautimobile
Word on the street is the sun is coming out! Get outside today, let's celebrate together at Pier13 &lt;3 http://t.co/cxgkk2JNi6	1435507033	615187204349001728	f	nautimobile
Pier13 is closed today, but we are going to stick around for a few hours if anyone wants to stop by for some lunch and good conversation.	1435416781	614808659240034305	f	nautimobile
@Abby_Borovitz We no longer have a truck in NY. We do have shops all over the city, if you check http://t.co/Fs9C5juXha you can find one!	1435244546	614086250862129152	f	nautimobile
Getting some inquiries, just to clear up. We moved the food truck to NJ, as NYCs permitting situation is intensely backwards and difficult.	1435244508	614086093600890880	f	nautimobile
@Abby_Borovitz We are not on the road today. We moved the truck permanent to NJ, if you're looking in NYC	1435244406	614085663814758400	f	nautimobile
@robattitudev3 @Pier_13Hoboken Nono, thank you!	1434920243	612726028075692034	f	nautimobile
It's cloudy, but we're still here on Pier 13! There's nothing to be afraid of. Embrace nature.	1434823332	612319555004821504	f	nautimobile
Best food trucks in AMERICA at Pier13 today! Not even kidding a little @PVPIZZATRUCK @AmandaBananasNJ @Aroy_D @themoofoodtruck @waffledelys	1434296631	610110409924812800	f	nautimobile
It's Pier 13 day! SOOO sunny, SOOO tasty. We bought a pack of wrestling trading cards to celebrate! Come visit! honkytonkman	1434223642	609804272323174400	f	nautimobile
Hammonton food truck festival today! We've never been to Hammonton before, but this place has a whimsical wonderment to it.	1434137699	609443798234611713	f	nautimobile
Hey South Jersey! Nauti is making the trip to see you this Friday at the Hammonton Food Truck Festival! That should be fun?!	1433964996	608719433125752833	f	nautimobile
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
Kasar truck is at Christopher and 7th avenue until 4am	1434160403	609539025670516737	f	chipsykingny
Dumbo here we go again ! shutupamdeatpastawithus 3475069616 try our amazing lobster ravioli and homemade meatballs ! Buon Appetito	1437146486	622063565890039808	f	pontirossifood
RT @dumbolot: ricebowls @SweetChiliNYC, pastas @PontiRossiFood, & noodles @mamuthainoodle. great way to start the weekend! carboload carb...	1437146377	622063110719963136	f	pontirossifood
@ColangeloGiu Giuseppe I did but you guys need to open an office in NYC. The minimum order is way too high for us. Thanks for following up	1437138307	622029264238563328	f	pontirossifood
The rain won't stop us... Polpette di Nonna Maria in rotation! 3475069616 http://t.co/N33S8b87sy	1436974922	621343976608657409	f	pontirossifood
@Foodtruckgirl7	1436962985	621293907486375936	f	pontirossifood
Today FiDi at the corner of water and old slip get your pasta garofalo cooked by Italians ! Order at 3475069616  http://t.co/ELyNJcDIpa	1436962912	621293601620914177	f	pontirossifood
@ColangeloGiu manda mail catalogo prezzi a: alessandro@pontirossifood.com	1436919341	621110850875748352	f	pontirossifood
@ColangeloGiu ciao per caso producete truffle oil ?	1436890735	620990868393213952	f	pontirossifood
RT @Vee_RoRo: I'm at @PontiRossiFood in New York, NY https://t.co/VQFIf7IaLU	1436735284	620338862926233600	f	pontirossifood
Today we will be serving our pasta at @RoyalPalmsClub!Try our special Homemade lobster ravioli in lemon zest cream sauce! pastaneversleeps	1436638385	619932435535523840	f	pontirossifood
RT @RiberaRuedaWine: Getting tasting-happy for foodtruckfriday. Would you pair wine w/ @langostruck @vlaic or @pontirossifood?? http://t.c...	1436554351	619579972370460672	f	pontirossifood
@dumbolot Guess who is back ?!?come get your lunch.Call in to pre order your gluten free pasta 3475069616!Special is Maine lobster ravioli	1436538196	619512213905252352	f	pontirossifood
Buongiorno midtown come get your lunch on 47&park. Call in orders 3475069616. Today's special is lobster ravioli in a lemon zest cream sauce	1436452543	619152958094229504	f	pontirossifood
Good bless America ! Happy 4th of July everyone !  http://t.co/eBg88WbKPl	1436025631	617362359259168768	f	pontirossifood
We will be out of the streets for the 4th of July weekend. Happy 4t of July everyone ! Ciao America buona festa dell'Indipendenza 	1435976602	617156719878270977	f	pontirossifood
@adri817 good morning! We are off for the 4th of July weekend. We will be back Monday	1435939023	616999099590680576	f	pontirossifood
Ciao Midtown!Guess who's back?come get your lunch on 47th btw park/lex aves.Pre order your glutenfree 347-506-9616 http://t.co/ryPgafCz0P	1435846555	616611263347589122	f	pontirossifood
Happy Father's day everyone! Buona festa del papa' a tutti ! Happy Sunday! Buona domenica a tutti pasta pontirossifood FathersDay	1434901342	612646750101356544	f	pontirossifood
RT @cobycycles: .@MetroNorth then 7 to Queens to see free @ArmstrongFest! Thx @PontiRossiFood ArmstrongFest Rails + free concerts  http:...	1434863808	612489323355721728	f	pontirossifood
RT @EdibleManhattan: .@BlondiesBS, @pontirossifood, @grillboystruck, see you at the foodtruckderby on 8/14 in Bridgehampton! http://t.co/r...	1434577173	611287089670422530	f	pontirossifood
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
Baltimore, who's hungry?! Start @promoandarts weekend right with our comforting Triple Play Grilled... https://t.co/lq4EjpozTT	1437162453	622130539294793728	f	usafoodtruck
Travelin' down the (b)East Coast today, but before you miss us too much, here's a shot of our Love Me... https://t.co/2OC8i4nrFY	1437051851	621666639575154689	f	usafoodtruck
Love, love, LOVE our sister city Baltimore! We'll be here all weekend slinging tenders for the... https://t.co/C7tkMbtDaP	1437011628	621497930432802816	f	usafoodtruck
Check out our grilled chicken club on a brioche bun, since we're feeling fancy today ... https://t.co/HgJlMuPDGx	1436917492	621103097948016640	f	usafoodtruck
@mattyulrich we are the USS Intrepid today :)	1436458565	619178219502223360	f	usafoodtruck
RT @mattyulrich: @USAFoodTruck Where are you today, chickenman?	1436458547	619178143094579200	f	usafoodtruck
Back to basics.  fried chicken streeteats foodtruck foodtrucks... https://t.co/9W9iD4Lf1X	1436374168	618824230365474816	f	usafoodtruck
It's National Fried Chicken Day, y'all! Even though we thought that was yesterday...  come grab... https://t.co/BZYCWcMKJw	1436226529	618204986997100545	f	usafoodtruck
@ShanghaiMKS we're at the USS Intrepid today! Come on down! ydd nationalfriedchickenday	1436201885	618101622502203393	f	usafoodtruck
RT @ShanghaiMKS: Today is NationalFriedChickenDay! You know what that means, we are heading over to @USAFoodTruck for lunch!	1436201831	618101395519066112	f	usafoodtruck
Juicy, freshly fried hand breaded chicken tenders, crispy, fluffy fries, buttered Texas toast and... https://t.co/F72ry2vMeh	1436074383	617566841867739136	f	usafoodtruck
Happy 4th everyone!!  We're at the @macys 4th of July Fireworks at Hunter's Point... https://t.co/3sS4h18YiC	1436050305	617465852544331776	f	usafoodtruck
Who's ready for the 4th of July?! We're getting there...  we'll be slinging chicken at the mays... https://t.co/HprnKWFPeS	1436019065	617334819975004160	f	usafoodtruck
the bikers who shut down the idiots in Ft. Greene who tried to burn the flag get all-you-can eat 'Murican food this weekend! ftgreene usa	1435862120	616676545055354880	f	usafoodtruck
RT @TheNYRA: Look at entries for Belmont StarsandStripes: http://t.co/yH7NORjQlr & get more info on day: http://t.co/qbZZ8K2k1r! http://t...	1435789359	616371365021634560	f	usafoodtruck
@bryantparknyc hey there! How do we get involved with food trucks on 5th? We'd love to be part of it.	1435686653	615940585166381056	f	usafoodtruck
We're finishing out the weekend at farmboroughfest with this delicious Love Me Tender chicken... https://t.co/qk8KaFifX8	1435503743	615173405520826370	f	usafoodtruck
RT @jsoupzzz: . @USAFoodTruck perfect concept, story, decor and food. Just needs a Dale decal. 3ForDale  	1435467797	615022637027356672	f	usafoodtruck
Hey @maddieandtae! After that great set you should come grab a grilled cheese and fries! We're super... https://t.co/p0X2Brlsbg	1435357211	614558805314158594	f	usafoodtruck
@bkcheka hey Cheka! We're at the USS Intrepid until early July, we may be back down that way soon though! Thanks for the love. loveu2	1435255912	614133924189601792	f	usafoodtruck
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
And a very phine Phil's Phriday to you! The Jawn is on 51st and Park 11-2 just waiting for you. Come thru!	1437144382	622054742064300032	f	philssteaks
Who's ready for the greatest day ever??!!?! @Brunchbounce livefastgroup https://t.co/MTpr3Qu6NQ	1437082926	621796976884105216	f	philssteaks
brunchbounce's photo https://t.co/Vmvy7B5gas	1437082447	621794968617811968	f	philssteaks
52nd n 6th until 3. Broadway n 67/68 4-7. Get your Phil!	1437062617	621711796655796224	f	philssteaks
RT @sanjamooch: @PhilsSteaks Hot damn your cheesesteaks are good!!!	1437015287	621513278473306112	f	philssteaks
Celebrate whiz Wednesday the only way you know how - with steaks from the Jawn! 41st n 6th 11-3.	1436971911	621331347848712193	f	philssteaks
1 mo' day @BryantParkNYC 4 FoodTrucksOn5th yay! 40th n 5th 11-7. @nypl ireadeverywhere	1436886289	620972222753148928	f	philssteaks
RT @Yahatetoseeit: @PhilsSteaks is the best cheesesteak in NYC... Get on that	1436818520	620687979770695680	f	philssteaks
RT @RedKhan1: @babses1 @WSJ and it's got me hungry.... [eats @PhilsSteaks sammich] http://t.co/ZzzGHIvnsg	1436818514	620687953531138048	f	philssteaks
RT @RealAntwon: Came to @PhilsSteaks to order The Antwon, which as you all know, is a sharp provolone cheesesteak with sweet peppers and...	1436818506	620687919708282880	f	philssteaks
RT @whokickedit: @PhilsSteaks tried 99 and tha jawn still reigns supreme!  Rep that bread! @AmorosoBaking	1436798232	620602885882163200	f	philssteaks
@slous77 we'll be there Thursday	1436912932	621083969468166144	f	domotaco
It's our last day @BryantParkNYC for FoodTrucksOn5th - we're rocking 11-7 so come to the Jawn! ireadeverywhere	1436798005	620601933120819200	f	philssteaks
And a very good Phil's Phriday to you! Come find the Jawn on 51st and Park from 11-2. Phil's, it's what's for lunch!	1436536613	619505574229745664	f	philssteaks
RT @whokickedit: @RealAntwon @PhilsSteaks @99milestophilly @AmorosoBaking amoroso rolls tastes so good bcuz of the good gully water in Phil...	1436536241	619504014707806208	f	philssteaks
52nd and 6th per usual on this TBT. Get your Phil!	1436455371	619164822719066112	f	philssteaks
Whiz Wednesday is here! 41st and 6th 11-3 http://t.co/xODs28UnM4	1436367356	618795658368126976	f	philssteaks
Would you run to 55th and Broadway immediately? http://t.co/gZ3SPtnHJ7	1436280866	618432895179464704	f	philssteaks
Moody Tuesday? Cheer up with steaks from the Jawn! 55th n Broadway 11-3. @randomfoodtruck	1436280036	618429414137659392	f	philssteaks
@piccolocafenyc you guys rock as well! Great to meet you!	1436274736	618407183110250496	f	philssteaks
RT @bryantparknyc: Ease those Monday blues with a cheesesteak from @PhilsSteaks as part of the foodtrucksonfifth program: http://t.co/FsiC...	1436201779	618101178241548289	f	philssteaks
TGIF are we right?? Come celebrate with sandwiches @BroadwayBites @Njlorita winery or @TangerOutlets! bwaybites grilledcheese yaywhey	1437144604	622055671664627712	f	morristruck
fbf to our appearance on @gma, cheesin for the cams/fans.  https://t.co/szScT1NB0Y	1437144301	622054401184800768	f	morristruck
Find us today! BwayBites as per usual till 9, and @SlightlyStoopid Pier97 tonight!	1436973211	621336800414593024	f	morristruck
Schedule for the week:\n@SlightlyStoopid Pier97 Weds 6-10p\n@TangerOutlets in Deer Park Saturday\n@njlauritawinery Sat/Sun\nfindus eatcheese	1436887247	620976241835945984	f	morristruck
Fingers crossed for another sunset like last night's. Gorgeous light at the hamptons artanddesign... https://t.co/CtW7C8g9uA	1436642920	619951459698933761	f	morristruck
All over NY today! Cart @DowntownBklyn Lawrence st, booth @ BwayBites, & find us & @gladyscaribbean @artMRKT in Bridgehampton all weekend!	1436454645	619161774248624128	f	morristruck
Be sure to stop by BwayBites today to cure that Red, White & Blue hangover!	1436197147	618081752377073664	f	morristruck
Exercise your freedom to eat a delicious sandwich! All weekend long at BwayBites!	1435937168	616991318791876608	f	morristruck
SANDWICHES SANDWICHES SANDWICHES We're at BwayBites all day, and tonight Pier97 for @barenakedladies!	1435763536	616263055954026496	f	morristruck
Last day here @FarmBoroughFest, and what a day it's gonna be! You can also find us at BwayBites till 9pm!	1435503701	615173226126254080	f	morristruck
Big weekend @FarmBoroughFest & BwayBites! Hope to see y'all there!\n\n Sandwich Shop is closed the next 3 weekends, stay tuned for updates!	1435328175	614437017670299648	f	morristruck
Find the cart @DowntownBklyn @ Lawrence St till 3, and at BwayBites till 9!	1435253367	614123251825012736	f	morristruck
Schedule for the week: \nEveryday @ BwayBites, Greeley Sq 11-9\nThursday @DowntownBklyn metrotech Lawrence St 11-3\nWeekend @FarmBoroughFest!	1435072820	613365982095085568	f	morristruck
Case of the Mondays? Sounds like you need a sandwich and an Aperol Spritz from our booth at BwayBites in Greeley Sq. We're there till 9!	1434985885	613001350511767552	f	morristruck
@ARaeNeedham Our sandwich shop at 569 Lincoln Pl is Crown Heights is open till 6, and our booth @ BwayBites in Greeley Sq is open till 9!	1434907271	612671618503081984	f	morristruck
Dads love Sandwiches. MorrisSandwichShop BwayBites	1434901962	612649350259453952	f	morristruck
Sandwiches Today BwayBites MorrisSandwichShop !	1434815378	612286191384293376	f	morristruck
@nkjemisin we're honored to be missed! There's a new rotation of trucks- we'll be there every other week. See you next Thursday!	1434648742	611587270534123520	f	morristruck
We're over the hump! The weekend is pretty much here, come celebrate with beer and sandwiches at BwayBites! 33rd & Broadway 11-9 Everyday	1434640624	611553222042456065	f	morristruck
RT @thulnasty: @morristruck Mona hit the spot for VeggieDay! So good: marinated kale, cauliflower puree, hard-boiled eggs, pickled radish,...	1434577434	611288180403380225	f	morristruck
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
Hey 45th & 6thers! Only a few more days on 45th before we take our summer break! Today &  Wed/Thurs (maybe fri?) next week!!!	1435252375	614119088504373248	f	thetreatstruck
!!! Thurs, June 25th 1-3pm 45th st & 6th ave, then 4ish-7pm Bway (86& 87th)!!! Come today! We're off tomorrow!	1435249444	614106795552935936	f	thetreatstruck
Thursday plans! 45th & 6th for lunchtime! Then UWS Bway (86 & 87th) for the late afternoon! Hooray!!!	1435178009	613807177959084032	f	thetreatstruck
@maximumbennis its a beer Cheddar sauce. What do you think?	1418845749	545304711902281728	f	shadydawgnyc
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
Good Morning NYC,\nTh Truck is down for repairs, Have a great day.	1437134530	622013418900426752	f	lobsterrolling
Good Afternoon NYC,\nWe are closed today for Truck Repairs. \nHave a great day.	1437072563	621753513647951872	f	lobsterrolling
Good Morning NYC,\nWe are parked on E20 Street & 5th Ave today. Come enjoy Fresh Lobster Rolls, Sliders, Gazpacho. Have a great day.	1436970443	621325188920156161	f	lobsterrolling
Good Morning NYC,\nWe are parked on W58 Street & 8th Ave, Come enjoy our Lobster Rolls, Sliders, Gazpacho @tjmaxx, @ColumbusCircle	1436907553	621061409615519744	f	lobsterrolling
We're on 40th btwn 5th & 6th ave. Come enjoy our fresh quarter pound Lobster Rolls ! @bryantparknyc @moviemonday	1436804944	620631035114618881	f	lobsterrolling
Good Morning NYC,\nWe are parked on 77 Street & Columbus Ave today. Come enjoy a Fresh Lobster Roll, Sliders & Gazpacho. Have a beautiful day	1436712346	620242650915053569	f	lobsterrolling
Hello NYC,\nWe are on 58 Street & Broadway now. Come enjoy a Fresh Lobster Roll, Sliders & Gazpacho. Have a goodnight NY.	1436649190	619977755057385472	f	lobsterrolling
Good Afternoon NYC,\nWe are now parked on W57 Street & 8th Ave. Come by for a Fresh Lobster Roll, Sliders & Gazpacho.	1436637607	619929176150274048	f	lobsterrolling
Good Morning NYC,\nWe are parked on 70St & York today, Come & enjoy a Fresh Lobster Roll, Sliders & Gazpacho today. @Sothebys @Chase @Cornell	1436629470	619895044313583616	f	lobsterrolling
Good Afternoon NYC,\nWe are parked on W58 St & 8th Ave today. Come & enjoy our Lobster Rolls, Sliders & Gazpacho. Have a lovely day N.Y	1436550541	619563991321456640	f	lobsterrolling
NYC,Lobster Truck will be closed today due to weather. Feel free to come to our restaurant in Greenpoint for some New England comfort food	1436466710	619212381365903361	f	lobsterrolling
Good Morning NYC,\nWe are on 70st & York Ave today. Come enjoy Fresh Lobster Rolls, Sliders & Gazpacho. Have a great day. @Sothebys @Chase	1436367034	618794310809554944	f	lobsterrolling
Good Morning NYC,\nWe are parked on W57 St & 8th Ave today till 4pm. Come enjoy Fresh Lobster Rolls, Sliders & Gazpacho. Have a great one NY.	1436278228	618421829779243008	f	lobsterrolling
Thank you Huntington For a Great Morning.	1436207645	618125780791488513	f	lobsterrolling
Good Afternoon NYC,\nWe will be parked on 40 St between 5th & 6th Ave today till 10pm. @bryantparknyc Come & enjoy Fresh Lobster Rolls.	1436207608	618125626634014721	f	lobsterrolling
Good Morning NYC,\nWe are parked in Huntington Station, Long Island. Today till 3pm. Lobster Rolls, Sliders & Gazpacho. Have a great day.	1436192064	618060432616632320	f	lobsterrolling
Last Call For NY Best Lobster Rolls. We will be leaving at 8pm. Thank you Columbus Ave & 77 St. Have a goodnight NYC.	1436138104	617834105439449088	f	lobsterrolling
Thank you NYC for last night. It was great. http://t.co/2YTgg0kSBG	1436108561	617710195976839168	f	lobsterrolling
On our way to the @dumbolot on Jay & Water!	1436964674	621300992072617984	f	domotaco
Good Morning NYC,\nWe are parked on W76 St & Columbus Ave today. Come enjoy Lobster Rolls, Sliders & Gazpacho. Have a great day.	1436108482	617709863808954368	f	lobsterrolling
Happy 4th NYC, we are parked on N 7St & Kent Ave today. Come & enjoy Lobster Rolls, Sliders & Gazpacho. Have a great one.	1436035725	617404697981374464	f	lobsterrolling
bestpizza bestcatering @greenboxny @FoodtoEat @Foodtruckgirl7 @eatupnewyork http://t.co/hvLlrDz8r7	1437000004	621449177134944256	f	valduccis
Who likes cheese ? Everybody !!! @greenboxny@@Foodtruckgirl7 @FoodtoEat @eatupnewyork @foodNfest @Foodtruckstars_ http://t.co/E9cplLJTz7	1436826859	620722956025622528	f	valduccis
RT @BeautePublicist: FF @MrFootyNewss, @lumavera1, @goldenpath, @Valduccis, @beautyADDICTS, @PaulaMacArthur\n@Attavanti_com	1436669450	620062734793711616	f	valduccis
RT @becausestartup: http://t.co/oUjt0paloa rajyyz @valduccis -  My dad's favorite pizza. Plain Brooklyn style fitness model fash... http...	1436618805	619850314133409792	f	valduccis
bestpizza @greenboxny @FoodtoEat @eatupnewyork @foodNfest http://t.co/PHvHINt1j3	1436578443	619681024210022400	f	valduccis
World Cup Champions team USA valduccis @greenboxny @FoodtoEat @Foodtruckgirl7 @eatupnewyork @foodNfest http://t.co/Be0kgl6tG5	1436538342	619512827200569344	f	valduccis
Catering jobs start with the best homemade rolls @Cater2me @greenboxny @Foodtruckgirl7  bestcatering nycatering http://t.co/ictc9bfhIa	1436443889	619116663552765952	f	valduccis
bestpizza cateringBest hero @greenboxny http://t.co/EvY8jCX2Fz	1436372191	618815939648319488	f	valduccis
Catering bestpizza @greenboxny @eatupnewyork @FoodtoEat @mactruckny Dom I think you're going to win  http://t.co/gvtMPcfisP	1436372133	618815694130561026	f	valduccis
And some rice balls to your next catering bestpizza bestcatering @greenboxny @eatupnewyork @FoodtoEat @foodNfest http://t.co/5kN41wcdPC	1436294157	618488638410657792	f	valduccis
RT @eatupnewyork: @Valduccis Looks incredible!	1436293306	618485071876620288	f	valduccis
Just made another big boy.  And to wait till you taste it. !!!  @greenboxny @Foodtruckgirl7 @eatupnewyork http://t.co/QSvCNDlNZj	1436291193	618476210604089344	f	valduccis
Look at our new big boy Best pizza@FoodPorn @greenboxny @FoodtoEat @Foodtruckgirl7 @eatupnewyork @foodNfest nypizza http://t.co/Ck8gYxae9s	1436275326	618409659330916352	f	valduccis
New big boy Sicilian http://t.co/bv1atpjcLl	1436223889	618193914344960000	f	valduccis
http://t.co/qQPgqTx2Iy we deliver anywhere Best pizza Best catering New York City pizza http://t.co/x3sEcYOvx3	1436182324	618019578124369920	f	valduccis
Who is having Sunday dinner today @greenboxny @Foodtruckgirl7 @FoodtoEat @mactruckny @foodNfest bestpizza meatballs http://t.co/LBpzNbat7i	1436101674	617681307439599616	f	valduccis
Happy birthday America best Country @greenboxny @gabbyvalls @FoodPorn @FoodtoEat @Foodtruckgirl7 @eatupnewyork http://t.co/UoSTUTwJ95	1436030830	617384166028673028	f	valduccis
Happy Fourth of July.  Everybody have a safe day http://t.co/JiTYK7GFNM	1436022344	617348572569280512	f	valduccis
Come join us in Central Park for a day of Tennis NY Open sidekicks bestpizza valduccis @greenboxny @FoodtoEat @Foo http://t.co/2bZqtAfa1b	1435934492	616980095497031680	f	valduccis
RT @adnanshamsi: AWESOME! @NYOpen2015 @CentralParkNYC w/@DaleCaldwell @NatlAutismNYM @Valduccis http://t.co/oaYaKtktKK @AutismFitnessEC @Bi...	1435934323	616979388396085248	f	valduccis
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
old slip and water ftw till 2:30pm. also on 33rd and broadway till 9pm! it's friday!!! tgif	1437144530	622055362980630528	f	domotaco
Happy Thursday from 53rd & Park! Bwaybites also open on 33rd & Broadway from 11-9!	1437056018	621684119018295296	f	domotaco
Back at 53rd and park till 2:30! Broadway bites on 33rd and Broadway till 9pm!	1437055863	621683466325893120	f	domotaco
BwayBites open daily from 11-9! Catch Domo Taco asiantaqueria on 33rd & Broadway!	1436964733	621301241042345984	f	domotaco
SoHo today on Hudson & King! Also be sure to check out our booth on 33rd & Broadway from 11-9 daily!	1436878411	620939180730925056	f	domotaco
Happy Monday back on 52nd & 6th ave! Also the last 2 weeks to catch us at BwayBites on 33rd & Broadway	1436796451	620595412538232833	f	domotaco
Happy fryday from Old Slip & Water! Also catch our booth on 33rd & Broadway open til 9!	1436533030	619490548378923008	f	domotaco
Catch our truck for lunch by metrotech in Brooklyn today, or our booth on 33rd & Broadway open til 9!	1436452562	619153038658437120	f	domotaco
Truck in @dumbolot today with our booth open on 33rd & Broadway	1436372708	618818106618707968	f	domotaco
Hudson and King till 2:30! 33rd and Broadway till 9pm! asiantaqueria	1436272162	618396386862632960	f	domotaco
Welcome back! Catch our truck on 52nd & 6th ave or our BwayBites booth on 33rd & Broadway!	1436190355	618053263640805376	f	domotaco
RT @cakeladybx: @DomoTaco I think I need to stop by afterwork.. I can't stop thinking about the rice bowl I had a few weeks ago loveatfirs...	1435968115	617121119619915776	f	domotaco
Truck is off the streets today but you could still catch our BwayBites booth on 33rd & Broadway!	1435931061	616965703611064320	f	domotaco
33rd and broadway till 9pm! 53rd and park till 2:30pm!	1435849011	616621560707817472	f	domotaco
53rd and park! let's go!	1435848986	616621459553787904	f	domotaco
We're @dumbolot today, jay and water st.  asiantaqueria	1435757375	616237213383294976	f	domotaco
Sorry truck is NOT out today but you could still catch us at BwayBites on 33rd & Broadway!	1435673577	615885739348361216	f	domotaco
52nd and 6/7th for asiantaqueria till 2:30. Or you can catch us at broadwaybites till 9pm! 33rd and Broadway	1435584578	615512449555505152	f	domotaco
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
RT @PruCenter: Today's menu of PRUeats at @RutgersU! Everything is free! http://t.co/NKPL5my694	1413479455	522796846285324288	f	shanghaisogo
Tuesday: 48th between park and lex for lunch until 3p. Call ahead your order 917 439 7522 http://t.co/ZlgbGfUZ1z	1436879099	620942066718257152	f	eddiespizzany
Tuesday: 48th between park and lex for lunch until 3p. Call ahead your order 917 439 7522 https://t.co/9j7R88pAQ3	1436879097	620942058010865664	f	eddiespizzany
http://t.co/Ag0AnfapSp http://t.co/PJj7IJ8CrC	1436832926	620748403023179776	f	eddiespizzany
starrettlehigh Takumi specials @ Starrett-Lehigh https://t.co/DJmjLtTZs9	1436804085	620627431393767424	f	eddiespizzany
Special: Pedro pasta, Mac n cheese bites, and drink for $8. Monday @starrettlehigh http://t.co/SO1koyRquk	1436797183	620598483502940162	f	eddiespizzany
Special: Pedro pasta, Mac n cheese bites, and drink for $8. Monday @starrettlehigh @ Starrett-Lehigh https://t.co/PVSkhF2V2H	1436797181	620598477559570432	f	eddiespizzany
@jennyhutt 5163549780. Call the restaurant and someone would be happy to help you.	1436538441	619513240729600000	f	eddiespizzany
Friday: charlton st between hudson and varick. http://t.co/zePJrrbKQD	1436527926	619469136977096704	f	eddiespizzany
Friday: charlton st between hudson and varick. https://t.co/ydpXg7gfRN	1436527924	619469131528716288	f	eddiespizzany
We are serving lunch today on 26th and 12th @starrettlehigh from 11am until 3pm http://t.co/hlruXYZkVq	1436191794	618059300863406080	f	eddiespizzany
We will be closed today for a private event. See you all tomorow.	1435671152	615875569671081984	f	eddiespizzany
We will be closed today for a private event. see you all tomorow.	1435671125	615875455061770240	f	eddiespizzany
Today's special: 2 sliders, 1 side, 1drink for $10 eddiespizza starrettlehigh http://t.co/KAQiM86DoH	1435593164	615548461199552513	f	eddiespizzany
Catch us for lunch today on 26th between 11th and 12th at starret lehigh building. You can always call in your... http://t.co/oQ8owMIJGZ	1435590298	615536440982814720	f	eddiespizzany
RT @TakumiTacoNY: Come visit us @smorgasburg and chelsea market today! http://t.co/3Zh38Uwj3g	1435423404	614836435997335552	f	eddiespizzany
Stop by Eddie's pizza truck. We are parked on Hanover square and Water street. Looking forward to serving you.	1435243337	614081182397927425	f	eddiespizzany
We are serving lunch today on 46th and 6th. http://t.co/fPkXARZaFW	1435159231	613728414089003008	f	eddiespizzany
We had a great time catering a bar mitzvah last night!	1434802190	612230879285518336	f	eddiespizzany
No lunch today due to a private event. See you all next week	1434715570	611867567456690176	f	eddiespizzany
We will be off the streets tomorow for a private event. See you all next week.	1434673008	611689049494044672	f	eddiespizzany
@captainwoo Haha!  You got us!	1436976361	621350010366611456	f	taimmobile
It's raining it's pooring... but don't let that stop you from a delicious lunch @TaimMobile! See you on 20th and 5th today!	1436974603	621342637166039040	f	taimmobile
On Fastbite today! Order a falafel platter today and receive it under 10 minutes! trycaviarnyc... https://t.co/8JdZUjb5Ml	1436974523	621342302699659264	f	taimmobile
Vote for us!!! Taim Mobile!! https://t.co/ueQj6dpLWy	1436824471	620712938446430208	f	taimmobile
We're at Water street and Broad today - Financial District! Start your week off with Taim!	1436800067	620610579590418432	f	taimmobile
Yum yum 10yearsoftaim http://t.co/RYvhO2KA2v	1436728479	620310319043358725	f	taimmobile
10 Years baby!!!! Free falafel Party at the West-Village until 4pm today!! http://t.co/D12ylQVoMB	1436720487	620276799579246592	f	taimmobile
RT @EinatAdmony: It's @TaimMobile's birthday tomorrow! Stop by the West Village from 12-4 for free falafel and fun! http://t.co/WHSBPtoE5a	1436631168	619902168921980928	f	taimmobile
@lizzeyj Spring and Varick today!	1436462751	619195774191185920	f	taimmobile
RT @EinatAdmony: Tune in tomorrow at the 9 am hour to watch me on Good Day New York! I will be making hummus and talking all about @TaimMo...	1436407392	618963581183356928	f	taimmobile
20th and 5th today! Come celebrate humpday with some falafel and smoothies!	1436369764	618805757111332864	f	taimmobile
Taimtuesdays on 20th and 5th today!	1436284300	618447298109014016	f	taimmobile
Too many hot dogs this weekend?  Come visit us in FiDi on the corner of Water and Broad for some yummy, vegan falafel!	1436195613	618075318792921088	f	taimmobile
varick and spring on this beautiful day! What could be better than escaping the office for some sun, and enjoying a falafel sandwich?!	1435852062	616634359995629568	f	taimmobile
Celebrating humpday on 20th and 5th! See you there!	1435762673	616259436542304256	f	taimmobile
TaimTuesdays on 20th and 5th in flatiron!	1435676091	615896282255626240	f	taimmobile
Order our Greek salad by 12pm today to get it in 15 minutes or less from trycaviarnyc with fastbite... https://t.co/3x6u1jJgNI	1435676033	615896042278637568	f	taimmobile
Get your falafel on today in FiDi on the corner of Water & Broad Street!	1435592813	615546989544144896	f	taimmobile
We're at prospectpark today! Come visit us at the Grand Army Plaza! @nycfoodtruck	1435499877	615157188739354624	f	taimmobile
vandam & varick today!	1435249828	614108407361110017	f	taimmobile
If u know Sweetery u know we love 2 give away FREE. On Mon we'll b giving away 10,000 treats...& that's just the beginning of our summer fun	1437073583	621757790529437696	f	sweeterynyc
We're gearing up for a busy next few days of events... paypalipo corporatepicnic sweets sweeterynyc	1437051805	621666444611162112	f	sweeterynyc
Hey @MECidears did u know ur friends @Flashtalking have a spl @Sweeterynyc trk @ ur office w/free treats http://t.co/stwusItYmo	1436881548	620952336865824768	f	sweeterynyc
We can barely contain our enthusiasm, but SweeteryNYC has so many free give away events coming up, it's hard to keep up. StayHungreyFriends	1436816808	620680796261740544	f	sweeterynyc
Serving at Hudson/King St 375 Hudson Street New York From 7:30AM-3:00PM EDT https://t.co/2cDIucjsTY	1435923308	616933186044567553	f	sweeterynyc
Serving at Hudson/King St 375 Hudson Street New York From 7:30AM-3:00PM EDT https://t.co/2cDIucjsTY	1435836908	616570801039503360	f	sweeterynyc
I posted 10 photos on Facebook in the album Fitbit IPO! http://t.co/Bdt4CBXOH8	1435777729	616322582682296326	f	sweeterynyc
Serving at Hudson/King St 375 Hudson Street New York From 7:30AM-3:00PM EDT https://t.co/2cDIucjsTY	1435750510	616208418811064320	f	sweeterynyc
Serving at Hudson/King St 375 Hudson Street New York From 7:30AM-3:00PM EDT https://t.co/2cDIucjsTY	1435664108	615846023219572737	f	sweeterynyc
Serving at Hudson/King St 375 Hudson Street New York From 7:30AM-3:00PM EDT https://t.co/2cDIucjsTY	1435577708	615483634317979648	f	sweeterynyc
We had such fun yesterday celebrating Xaxis 4th Birthday! How cool did the branded cupcakes look??! XaxisAt4... http://t.co/ynXiURTGM9	1435335608	614468195785666560	f	sweeterynyc
Serving at Hudson/King St 375 Hudson Street New York From 7:30AM-3:00PM EDT https://t.co/2cDIucjsTY	1435318512	614396486890164224	f	sweeterynyc
@3TopInc Chocolate chip with vanilla ice cream, Snickerdoodle with strawberry ice cream, and snickerdoodle with banana ice cream.	1435314762	614380761190375424	f	sweeterynyc
Hey GroupM come down and say hello! The Xaxis truck is here celebrating their 4th Birthday with FREE cupcakes!... http://t.co/VV3mdVUm4r	1435262380	614161053153234944	f	sweeterynyc
@MECideas were on our way! Free cupcakes on behalf of @Xaxistweets for their 4th Birthday! XaxisAt4	1435250941	614113076925857792	f	sweeterynyc
@WiedenKennedy come down and visit the @Xaxistweets birthday truck! freecupcakes  https://t.co/ewfSrOzeVv	1435247782	614099824959426562	f	sweeterynyc
Excited to help celebrate @Xaxistweets 4th birthday today! XaxisAt4	1435237674	614057429203030016	f	sweeterynyc
Serving at Hudson/King St 375 Hudson Street New York From 7:30AM-3:00PM EDT https://t.co/2cDIucjsTY	1435232110	614034094213697537	f	sweeterynyc
Serving at Hudson/King St 375 Hudson Street New York From 7:30AM-3:00PM EDT https://t.co/2cDIucjsTY	1435145712	613671710957641728	f	sweeterynyc
It's National Pink Day! How fun are these branded macarons we produced for Vanity Fair?! nationalpinkday... http://t.co/8IAVzan8gV	1435082191	613405287588827137	f	sweeterynyc
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
I just earned the Rookie badge on Yelp!	1419664070	548737000786767873	f	lovemamak
ON THE PLATE http://t.co/7dVduKuthr	1419116692	546441129340968960	f	lovemamak
Pho Ga in a cold weather ? Sure http://t.co/9eTWSNe13O	1418948372	545735143525474304	f	lovemamak
@rbccdnse Wednesday!!	1437150739	622081407100284928	f	shukanyc
@krdshrk Sorry Nick ! Will be back next - Friday-Thursday	1437146751	622064677737074689	f	shukanyc
@JBlechner sure thing !	1437143960	622052971354955776	f	shukanyc
@JBlechner that's how it's called!	1437143661	622051717908180992	f	shukanyc
@JBlechner yes ! We will be on 21st & 5th Today !	1437143330	622050332042989568	f	shukanyc
Simply EggCellent !! We are BACK !! Only today we will be on 21st St & 5th Av !!! ShukaNation http://t.co/zX9FfntyJV	1437143311	622050250967121920	f	shukanyc
Simply EggCellent !! We are BACK !! Only today we will be on 21st St & 5th Av !!! ShukaNation http://t.co/66gzIGAXjD	1437143272	622050085367640064	f	shukanyc
will not be working this week ! We are working on SHUKA's new future!! Top secret  ! Will be back Friday the 17th of July !	1436793775	620584188975161345	f	shukanyc
The SHUKA Truck will not be working this week ! We are working on SHUKA's new future!! Top secret ! Will be... http://t.co/APUScDQOXX	1436793694	620583850343813120	f	shukanyc
Great Day for Great memories! TODAY - GOVERNORS ISLAND !  like our nature, and once you get a taste, you always... http://t.co/0VqJpPXhlF	1436713261	620246489563013120	f	shukanyc
TOGETHER WE WILL MAKE IT !! Friday is 46th St & 6th Av ! It's A SHUKA NATION!! http://t.co/I6KHPTHbRQ	1436542469	619530136115875840	f	shukanyc
@sethmg lol ! Next time !!	1436457554	619173977798213632	f	shukanyc
The SHUKA Truck will take the day to Shoot with MASTER CHEF POLAND !! See you tomorrow 46th St & 6th Av ! http://t.co/jl3txHCNa4	1436451361	619148000154161153	f	shukanyc
@KarinaKabbash we close at 3:00 daily !	1436407262	618963036536074240	f	shukanyc
@boredis89 have everything	1436370905	618810543625736194	f	shukanyc
 Wednesday's are 47th St & Park Av ! It's time for your SHAKSHUKA experience! @vendyawards streetfood Vendycitizenjudge !!	1436367524	618796365632516096	f	shukanyc
HALLELUJAH IT'S RAINING CHIPS! THE BEST CRAVING -Thin- Sliced , Homemade Potato Chips With Za'atar and Cumin !... http://t.co/GKJlj1swWu	1436280414	618430998368387072	f	shukanyc
HALLELUJAH IT'S RAINING CHIPS! THE BEST CRAVING -Thin- Sliced , Homemade Potato Chips With Za'atar and Cumin!Tuesday's are FIDI - Hanover Sq	1436280391	618430901907656704	f	shukanyc
Sun:  Governors Island . \nMon: 20st & 5th Av \nTue: FIDI-Hanover Sq, \nWed: 47th & Park   , \nThu: 46th & 6th,\nFri: 46 & 6th .	1436192679	618063012138606593	f	shukanyc
It's A  New Week At The SHUKA TRUCK ! Today 20st St & 5th Av ! Sun:  Governors Island . \nMon: 20st & 5th Av... http://t.co/NOCvBTZ9MF	1436192658	618062921374003200	f	shukanyc
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
RT @Mega_Munchies: Who makes the best doughnuts in NYC? @VeganLunchTruck @DoughLoco @doughbrooklyn please state your case. http://t.co/0N...	1437070235	621743747550871552	f	veganlunchtruck
@joemaleh only in red bank on Sunday	1436877689	620936151247917060	f	veganlunchtruck
Sick of making only boring old porridge for dinner every night?  Get your hands on a copy of our cookbook Street... http://t.co/RHFQFLhfY8	1436812218	620661547522768896	f	veganlunchtruck
RT @MrsSole: I need this vegan Ganesha cake for my bday from @VeganLunchTruck  chocolate or some kind of... https://t.co/AWzSGybl2d	1436788714	620562963552821248	f	veganlunchtruck
@Hogtownvegan give me this you damned Canadians.	1436741331	620364222065676288	f	veganlunchtruck
Parked at the red bank NJ farmers market 9:00-3:00\n(W. Front st. / Shrewsbury Ave)\n\nSome of today's yums include:... http://t.co/GVI4eH2Q8l	1436706618	620218627971772416	f	veganlunchtruck
RT @OptimistsInc: I don't wanna tell you how to live your life, NYC, but if you're not getting lunch @VeganLunchTruck in Brooklyn, you're d...	1436641331	619944793066614784	f	veganlunchtruck
Back at the Vegan Shop-Up\n12:00-6:00 at 12 grattan st in Brooklyn. Pine Box Rock Shop\n\nRaspberry cheesecake... http://t.co/U78NmdQcDY	1436628259	619889963719610368	f	veganlunchtruck
Back at the Vegan Shop-Up tomorrow!\n12:00-6:00 at 12 grattan st in Brooklyn. Pine Box Rock Shop\n\nPHOTO: Beastmode... http://t.co/RJ3rHAifPx	1436567258	619634109581783040	f	veganlunchtruck
Free tomorrow?\nGot food service experience?\n\nWe are looking for someone in a pinch to come work on our truck with... http://t.co/WhniqPGqlI	1436553288	619575513619767298	f	veganlunchtruck
RT @CamilleDeMere: Thanks @VeganLunchTruck for helping to make my morning. Beautiful slow Friday morning with a Thai... https://t.co/ZlJXgY6B...	1436543490	619534417019604992	f	veganlunchtruck
We had a donut catastrophe early this morning, and we lost almost all of the pastries we made for the truck... http://t.co/QfAK6oehmM	1436539380	619517180313534469	f	veganlunchtruck
@sideshowfreak we had chipotle seitan breakfast burritos and pancakes!	1436537490	619509253313683457	f	veganlunchtruck
@thetinyraccoon we can get single day permits for events that we are invited to.  Believe me, if we could have a full time permit we would.	1436537020	619507280715714560	f	veganlunchtruck
Parked on 45th/1st 9:00-3:00\n\nPasionafruit glazed donuts, blue corn pancakes, Thai bbq tempeh, chipotle seitan breakfast burritos	1436532177	619486968796327936	f	veganlunchtruck
See yall tomorrow in midtown 9:00-3:00! http://t.co/6Vylss8tKL	1436462613	619195195993796609	f	veganlunchtruck
RT @veganjari: I'm not a big cook book person but STREET VEGAN is defo one to get. Well done @VeganLunchTruck http://t.co/1UJnYc75pM vegan...	1436443508	619115062695825408	f	veganlunchtruck
The truck is out a few days in a row this wek!\nFriday-45th/1st 9:00-3:00\nSaturday-@veganshopup in BK 12:00-6:00\nSunday-Red Bank NJ 9:00-3:00	1436367221	618795094234169344	f	veganlunchtruck
PLEASE RT:\n\nThe Snail is making a rare appearance in Midtown this Friday!\n\n45th/1st\n\nSo psyched to be back THIS FRIDAY ONLY!	1436205056	618114923344736257	f	veganlunchtruck
Cinnamon Snails made from the recipe in our new cookbook Street Vegan\n\nSnag a copy from your favey local... http://t.co/1EYjTKasUz	1435946802	617031728645976064	f	veganlunchtruck
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
PolishTruck oldtraditionalpolishcuisine kielbasa NYC nycdining https://t.co/zMJ0SRQY09	1437221703	622379051093725184	f	polishcuisine
Good Morning NYC,\nWe are closed for today. Have a great one.	1437224037	622388838233714688	f	lobsterrolling
Thanks to @GovIslandFood and  @livefastgroup we'll be vending on @Gov_Island all summer http://t.co/eeYVuAZpDI	1437225965	622396927322267648	f	mausamnyc
De CARTS 2/2:\nBierbeek @ De Great Lawn, Central Park til 7pm	1437227887	622404987637923840	f	waffletruck
De CARTS 1/2:\nVedette @ 59th & 5th Ave (Manhattan) til 7pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm\nGoesting @ 66th & Broadway til 10pm	1437227865	622404895405162496	f	waffletruck
SENSATIONAL SATURDAY\nLe Cafe @ 15 Ave B til 11pm\nDe Wafel Cabana @ 35th & Broadway til 10pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1437227775	622404518282661888	f	waffletruck
Greatest Day Ever is today!!! @brunchbounce livefastgroup 50Kent williamsburg bk allday https://t.co/egljh0RO1r	1437229601	622412176314245120	f	philssteaks
We are located at 6th avenue\n and 18th street. http://t.co/oCfSrbsWpT	1437233084	622426786241097728	f	kettlecornnyc
A great day to watch Beach Volleyball at the Kingston NYC Open @avpbeach AVPNYC foodtru... http://t.co/yhX30jMLaC http://t.co/cIDkUXUUk8	1437231676	622420879344013312	f	neaexpress
Excited for our pizzatruck from11am- 2am at @RoyalPalmsClub?	1437231618	622420634820177920	f	neaexpress
We are @TangerOutlets in deer park till 4pm! longisland weekendplans shopping eating http://t.co/FcQpKpmnHy	1437231715	622421045618864129	f	sweetchilinyc
BigRed is headed to Laurita! Meet us at the vineyard http://t.co/A6e2n0mWsK http://t.co/zuMNjPpksr	1437231763	622421244927979520	f	lobstertruckny
Had a great time at @promoandarts after-hours last night! Looking forward to slinging more chicken... https://t.co/q4TF9oF7wM	1437234059	622430873959448576	f	usafoodtruck
Start your wkend off right with us at Broadway bites, @tangeroutlets in deer park and @njlauritawinery praisecheeses	1437232121	622422748141367296	f	morristruck
Its NYC Body Painting Day!!! Come check us out @47th & 2nd! Serving here till 5pm	1437236805	622442393690841088	f	korillabbq
GreatestDayEver is today at 50 Kent - Fun starts at 1PM https://t.co/x6PsvW2mvU @Brunchbounce @Livefastgroup	1437237337	622444624263663616	f	papayakingtruck
Find our foodtruck at http://t.co/fY1phJOpPO Breezy presents Grits & BIiscuits 5th Anniversary Block Party @JBLLivePier97	1437238813	622450815895101440	f	neaexpress
Today we are hanging out on Long Island @TangerOutlets Deer Park @gcnyc1 @nycfoodtruck @nystfood	1437240897	622459555662929920	f	andysitalianice
@Pier_13Hoboken w/@AmandaBananasNJ @pier13hoboken @PVPIZZATRUCK @EmpanadaGuy1 @NautiMobile @themoofoodtruck @waffledelys	1437239657	622454356051382273	f	gcnyc1
G1 @Pier_13Hoboken \nG2 @TangerOutlets deer park\nfoodtrucks\nComeToTheCheeseYo	1437239625	622454221833674752	f	gcnyc1
RT @AmandaBananasNJ: We're at @pier13hoboken today w/ @PVPIZZATRUCK @EmpanadaGuy1 @NautiMobile @gcnyc1 @themoofoodtruck @waffledelys Hobok...	1437239530	622453821600608257	f	gcnyc1
Kasar truck is in soho, broadway and prince street	1437241508	622462117019385856	f	chipsykingny
JIBARITO CHURRASCO TRIPLETA!!\nGOOD AFTERNOON BRONX NY!\nTODAY SATURDAY JULY 18TH \nWE OPEN AT... https://t.co/p7zBswEPSC	1437242785	622467474873823232	f	latinkitchennyc
Catering one MASSIVE corporate pool party!! Call 646-543-BIGD (Sliders, hickory smoke pulled pork, fruit skewers,etc) http://t.co/doO8ihID8y	1437246779	622484226437447684	f	bigdsgrub
@ctgarcialeon we will be in Prospect Park tomorrow !!	1437251945	622505892785881089	f	snowdaytruck
RT @QueensEatsIG: We so happy! Loving our friends and the Mango Sticky Rice at @mamuthainoodle! itsinqueens mamuthai... https://t.co/ifStTI...	1437250733	622500811034243072	f	mamuthainoodle
De catering buffet has been set up, dinges shall be had!  https://t.co/AnrwAUUH9A	1437257583	622529541760786432	f	waffletruck
Hello @mattaningram as we rotate locations to cover NYC Kotmadam is currently looking for new space but we always return to past locations.	1437257511	622529241456988161	f	waffletruck
RT @stsh: @waffletruck's kiosk at @bryantparknyc continues to delight. :) http://t.co/fBPzefJbu7	1437257332	622528488575250432	f	waffletruck
RT @BklynRoasting: Fun times, excellent wafels and BRC coffees... all at the @waffletruck kiosk in Bryant Park. https://t.co/hatWPl7gCc	1437257295	622528332966555648	f	waffletruck
SpecialThanks to @Theorossi for comin out to support MacTruck & @ChefDomTes juice FoodNetworkStar @FoodNetwork  http://t.co/IQaQPUPGdA	1437259495	622537559680393216	f	mactruckny
RT @BorelliJoe: One of the best parts of today \nATU picnic was seeing my buddy and food network star Dom Tesoriero @mactruckny http://t.co/...	1437258003	622531302634430464	f	mactruckny
RT @Theorossi: So proud of SINY's own @chefdomtes for kicking ass on @foodnetwork \n\nBest MacNCheese in the business. @mactruckny http://t...	1437257995	622531268878671872	f	mactruckny
We deliver @greenboxny @FoodtoEat @eatupnewyork valduccis.com http://t.co/q2FdNGmRT2	1437256916	622526745766457344	f	valduccis
http://t.co/te7L3MZMr4	1437265936	622564578958946305	f	kettlecornnyc
http://t.co/crHNTwKxpg	1437265926	622564533870153729	f	kettlecornnyc
http://t.co/wu7aqphTXf	1437265173	622561377597657088	f	kettlecornnyc
We understand the excitement but please watch your strength when running to your wafel! dingesforeveryone http://t.co/XsRC5Fm2Fa	1437267690	622571934744772608	f	waffletruck
@Carolarias we accept cc/debit. We had an issue with our iPad last night so we were not able accept cc's.	1437268701	622576174418513920	f	domotaco
@KennySaySo sorry about that...our iPad had some issues last night so we weren't able to process credit cards.	1437268594	622575726412341248	f	domotaco
RT @gberg88: Nice to chat with you today, Josh. Best of luck and GO VOLS (obviously)! @USAFoodTruck	1437302431	622717648049152000	f	usafoodtruck
Parked at the red bank NJ farmers market 9:00-3:00\n(W. Front st. / Shrewsbury Ave)\n\nSome of today's yums include:... http://t.co/4MlCPL9LfB	1437306821	622736061488308224	f	veganlunchtruck
@hydro528 Could you send us the link to the feature? We'd love to share it! Thanks!	1437307931	622740717262241792	f	korillabbq
RT @LocalReviewNYC: Sandy X.'s Review of Korilla BBQ - New York (4/5) on Yelp: I love the concept of this place. I got th... http://t.co/zH...	1437307870	622740462164680704	f	korillabbq
RT @aniistoll: This to-go Korean BBQ is excellent!!! @ Korilla BBQ https://t.co/qPT10ii3QZ	1437307853	622740390991560704	f	korillabbq
RT @ExplosionLimit: Kimcheese fries at Korilla https://t.co/hKwhabrtbR	1437307848	622740368069672960	f	korillabbq
RT @opavez: @ZuWeeStore sorry... I've learned that with @KorillaBBQ menu there are not leftovers ;)	1437307830	622740294325374976	f	korillabbq
RT @Violawiz92: @KorillaBBQ is providing food today!! Yay!! NYBPD @bodypaintingday http://t.co/tWs9vtu4cS	1437307819	622740247630188544	f	korillabbq
Last day of @avpbeach tournament today foodtruck	1437310807	622752778364960769	f	neaexpress
Disos at it again..  Daily News write up\n\nhttp://t.co/AzdCEtPmzQ	1437311830	622757068957712384	f	disosnyc
The society at it again.. Daily News write up... http://t.co/VjXrkthtta	1437311203	622754442224517120	f	disosnyc
Beautiful sunny day. We're here! Will you? First \nExtravagant Urban Music Festival! food/music/shopping http://t.co/DmRTrmIWuS	1437313198	622762808892104704	f	mausamnyc
SundayFunday is in full effect at the @prospect_park GrandArmyPlaza FoodTruckRally! Join us from 11-5pm! LebaneseEats Brooklyn	1437316170	622775274657218560	f	toumnyc
A sunny day @inAsburyParkNJ calls for organic nonGMO pizza from the food truck park	1437316203	622775412129595393	f	neaexpress
On the truck in Red Bank today:\n\nLavender pear almond milk French toast with smoked almonds and maple syrup http://t.co/9wff8DghgY	1437315886	622774080488505345	f	veganlunchtruck
brooklyn we're here for you! At the prospectpark foodtruckrally today!	1437317158	622779419258683392	f	taimmobile
GOVERNORS ISLAND !! It's a SHUKA- Sunday and we are Ready For You !! Today on Governors Island- See you  http://t.co/qyQGrULKWk	1437317990	622782907728424960	f	shukanyc
Thanks to our cheesy fans.... great week  we are taking rest today.....	1437318042	622783123449901058	f	gcnyc1
Brooklyn, let's do this! foodtruckrally going on, NOW. prospectpark	1437318442	622784802157015045	f	kimchitruck
We are located on \nBroadway and 51st St.\nkettlecornnyc http://t.co/ixX6xBhFCz	1437318803	622786316825165824	f	kettlecornnyc
We are located on \nBroadway and 51st St.\nkettlecornnyc http://t.co/KxoNPCqNSw	1437318547	622785242202533888	f	kettlecornnyc
Another beautiful day @njlauritawinery and Broadway bites, see you there!	1437318383	622784555410456576	f	morristruck
GOVERNORS ISLAND !! It's a SHUKA- Sunday and we are Ready For You !! Today on Governors Island- See you nyc http://t.co/UOtiW28j3K	1437318025	622783056080949248	f	shukanyc
RT @thedailymeal: Is Los Angeles's @kogibbq a better food truck than NYC's @VeganLunchTruck? VOTE: http://t.co/w6eJ9YUJPI http://t.co/DfK7r...	1437320002	622791345724239872	f	veganlunchtruck
De CARTS 2/2:\nBierbeek @ De Great Lawn, Central Park til 7pm	1437321045	622795720152715265	f	waffletruck
De CARTS 1/2:\nVedette @ 59th & 5th Ave (Manhattan) til 7pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm\nGoesting @ 66th & Broadway til 10pm	1437321034	622795673256243200	f	waffletruck
SUNDAY FUNDAY dinges\nLe Cafe @ 15 Ave B til 11pm\nDe Wafel Cabana @ 35th & Broadway til 10pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1437320999	622795525990019072	f	waffletruck
@Sshyma21 planning for Thursday evening, Lexington 86	1437323550	622806228276748289	f	kettlecornnyc
@Sshyma21 we can meet you there tonight. Text me 646 765 3210 to connect	1437321611	622798096154656768	f	kettlecornnyc
It's NationalIceCreamDay you know we came prepared! IceCreamWeather dingesforeveryone http://t.co/PEMcN4HGXY	1437324284	622809305444687872	f	waffletruck
Hey @helenchu we will be at the same locations as today, check first that Sunday because plans are always subject to change.	1437322076	622800045142855680	f	waffletruck
Hello @AngelicaAbe we may be at the same locations as this past week, just check first because plans may change.	1437322015	622799790498291712	f	waffletruck
NationalIceCreamDay For one free dinges, sing a jingle for your favorite flavor of ice cream! IceCreamWeather	1437321900	622799305036972032	f	waffletruck
Showing 2x the love today folks\n@IntrepidMuseum 46th st / 12th av & @Yankees in Da Bronx so enjoy a game or... http://t.co/DMMIMELHSQ	1437324532	622810348345774080	f	carlssteaks
Showing 2x the love today folks\n@IntrepidMuseum 46th st / 12th av & @Yankees in Da Bronx so enjoy a game or checkout some cool war planes	1437324457	622810031965229058	f	carlssteaks
RT @nycfoodtruck: It's time to EAT! @Prospect_Park FoodTruckRally now thru 5pm. http://t.co/WhlcuJOIw5 w/ @GCNYC1 @KELVINSLUSH @NeaExpress...	1437327541	622822965659467776	f	neaexpress
Welp it's perfect weather today. Turn off those real housewives, get off the couch and come outside. Pier 13 today.	1437325413	622814041216544769	f	nautimobile
Late start but we are @prospect_park for the rest of the day. @nycfoodtruck italianices andysitalianicesnyc	1437330926	622837163428700160	f	andysitalianice
RT @Kerri_Lauren: @ClayThomson @KettleCornNYC ME TOO! I have notifications set to tell me where they are & then I have a group text to tell...	1437329884	622832792372682752	f	kettlecornnyc
I posted a new photo to Facebook http://t.co/5Ee77X1QRv	1437329252	622830144193986564	f	kettlecornnyc
http://t.co/srkcEvRhlB	1437329217	622829995375771648	f	kettlecornnyc
RT @ClayThomson: mystrangeaddiction  KettleCornNYC @KettleCornNYC http://t.co/iUqIxlHYim	1437329202	622829935766425600	f	kettlecornnyc
Polish traditional authentic NYC Crepes homemade nalesniki https://t.co/OOy603lxAH	1437330052	622833500517978112	f	polishcuisine
Barkfest by @barkbox is today more info: http://t.co/CznbufETwZ N 11th Kent Ave. - Papaya King will be serving all the humans frankfurters	1437328935	622828816029863936	f	papayakingtruck
PLEASE RT:\n\nThink the Cinnamon Snail is the best street food in the USA? VOTE FOR US HERE: http://t.co/NpVjWByElB http://t.co/jp4aRl6rgz	1437332411	622843391819284480	f	veganlunchtruck
Yes, we'll be serving dinner back starting today from 5-10pm @Rooseveltisland http://t.co/MwRJcggJGc	1437333483	622847887765041153	f	mausamnyc
http://t.co/P0JpN17fvC	1437334625	622852681363816448	f	kettlecornnyc
MI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX NY 10465\n347-691-3100\n(Today Sunday July 19th we are... https://t.co/PEub6ww5lb	1437334969	622854122514026497	f	latinkitchennyc
INTRODUCING LA JIBARITA\nWHAT IS IT??\nCOME AND FIND OUT \nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD\nBRONX... https://t.co/F0Rw7Zi7XA	1437335688	622857138961018880	f	latinkitchennyc
Torte Bella http://t.co/8AYuPvqLzh	1437335800	622857609662582784	f	valduccis
RT @accomad: @montecatinierbe @erbolarioita @DuduLaura @HotelClelia @SegatDavide @monicamontenero @BenazziPeter @Dolce_N_Jeans @Valduccis c...	1437335686	622857131478360064	f	valduccis
2NITE ROUND 3 R KELLY CONCERT FOXWOODS CONNECTICUT \nSHOW TIME 8PM .. BUT NOW WE HEAD TO THE POOL..... https://t.co/KpdrJOX3fm	1437338159	622867501077168132	f	latinkitchennyc
Tomorrow SweeteryNYC will be celebrating @Paypal IPO in front of the NASDAQ giving away thousands of FREE cups of coffee donuts from 8a-2p	1437341987	622883559410401280	f	sweeterynyc
KELLZ BLACK PANTY TOUR LAST SHOW 2NITE \nFOXWOODS CONNECTICUT \nDJ LUCHO LIVE AT 8PM .\n. https://t.co/m8nfSQ672j	1437344293	622893230707863552	f	latinkitchennyc
De Game Changer Wafel. NationalIceCreamDay IceCreamWeather dingesforeveryone http://t.co/OCWHLAjmHC	1437347729	622907640008572930	f	waffletruck
.@lionelohayon thanks so much for spreading the word - MAD LOVE!  https://t.co/iNPUkWMB1A	1437356370	622943886743371776	f	snowdaytruck
RT @logoffandcallme: Amazing food from @SnowdayTruck at grand army plaza. Also an amazing mission: http://t.co/nbjfgP0UlY http://t.co/0w5iW...	1437356140	622942919184515072	f	snowdaytruck
.@logoffandcallme thanks so much for sharing and spreading the word - mad love	1437356137	622942905573998592	f	snowdaytruck
To all our followers we are taking this week off as respect to the nine days before Tisha beav we will be back on the road next Monday	1437356777	622945591711113217	f	schnitzi1
RT @mike_jules: Food trucks? thatsCAKE @ChefDomTes @FoodNetwork @mactruckny	1437364450	622977773397757952	f	mactruckny
RT @MobileCuisine: 10 Signs Youve Worked In A Food Truck http://t.co/tS8XvmI0EB	1437367288	622989678468329472	f	disosnyc
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

