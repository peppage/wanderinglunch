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
-- Name: ads; Type: TABLE; Schema: public; Owner: mca; Tablespace: 
--

CREATE TABLE ads (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    value text NOT NULL,
    validuntil integer,
    views integer DEFAULT 0,
    site text NOT NULL,
    shape text
);


ALTER TABLE ads OWNER TO mca;

--
-- Name: ads_id_seq; Type: SEQUENCE; Schema: public; Owner: mca
--

CREATE SEQUENCE ads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ads_id_seq OWNER TO mca;

--
-- Name: ads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mca
--

ALTER SEQUENCE ads_id_seq OWNED BY ads.id;


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
    lat double precision NOT NULL,
    long double precision NOT NULL,
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
    matchmethod text,
    site text NOT NULL
);


ALTER TABLE trucks OWNER TO mca;

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

ALTER TABLE ONLY ads ALTER COLUMN id SET DEFAULT nextval('ads_id_seq'::regclass);


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
-- Data for Name: ads; Type: TABLE DATA; Schema: public; Owner: mca
--

COPY ads (id, name, value, validuntil, views, site, shape) FROM stdin;
1	google-banner	<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script><ins class="adsbygoogle" style="display:inline-block;width:728px;height:90px" data-ad-client="ca-pub-4098082757736151" data-ad-slot="3902951461"></ins><script>(adsbygoogle = window.adsbygoogle || []).push({});</script>	2147483647	0	all	banner
2	google-square	<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script><ins class="adsbygoogle" style="display:inline-block;width:300px;height:250px" data-ad-client="ca-pub-4098082757736151" data-ad-slot="1938459065"></ins><script>(adsbygoogle = window.adsbygoogle || []).push({});</script>	2147483647	0	all	square
\.


--
-- Name: ads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mca
--

SELECT pg_catalog.setval('ads_id_seq', 2, true);


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: mca
--

COPY images (id, suffix, visibility, twitname, menu) FROM stdin;
55159d3f498ef66b6de1b09c	/6096863_zt9VyCrl2nuWO8cc2KBxYq0rgIFXGJndFGmZcumdSRc.jpg	public	shuka	f
55c7f516498e21aadc545cd2	/39682951_wl3hpe5U9EzInb09Yao--CHcokgqhHDgTgx0pgmI1J0.jpg	public	cachapasbk	f
5384cee8498e8fc005fc654c	/5100766_EsttIeEzz6qr90ehZUXz-Fqm0ktGiv0bXfOocE1peCw.jpg	public	andysitalianice	f
4feb6e00e4b048145c547997	/wcCcDDUFo3EAkWygR8pGn29HTAv7VKEvPwJgzS6hQcw.jpg	public	andysitalianice	f
5239c6b7498e0f1f28af16fc	/2751553_7BX-8PVCQt3ELg-hV0rfmQhwRrGHbz9brLHsuV6IIhs.jpg	public	sweetchilinyc	t
50ad186ae4b0b639ca7ca234	/295161_qCQYG0XjW1Ji0pSDxM7fWRzxTZRbcYyZbsbPNJo12hw.jpg	public	toastmonsternyc	f
521f754c498ee4d6fbe8a778	/22491899_EEPqf4HeJFaaFjYabKyScGZ8symjXEgMjPUEkfpJsJk.jpg	public	morristruck	f
51856452498e6f602088cbe1	/232510_pLk3QUUWFOu82-4SX-ObtA8bw2ZPf61QBOeIuL50T-o.jpg	public	morristruck	f
504777b0e4b092e662d54688	/VDYXmY1LaQGPAFc62SGiSEqcsa9OqhqXotgvAXIkHgg.jpg	public	morristruck	t
51c1ea41498e372d91835cf9	/5067950_pSXIZo_RqO8Hh5AuWcomjr0p3q_pXPUMWe99W8hUGTU.jpg	public	burgersandbites	f
51a79983498e3044671cd784	/1441492_yfySwml4ChzJ_ni5DxTq-8n2UlecWBWjgxR-ygA6pYc.jpg	public	burgersandbites	f
5362891011d2b40c5f328b6e	/41834822_k1LVelyLVM9gsNt3M70sVjI-QLm_84bgv4c6hoMHPO8.jpg	public	hibachiheaven	t
4ff318dde4b0444717bb6c21	/7p0pVfwa2IPX5eoAqan3mf43CoVnVrHHztgDqMGA6aE.jpg	public	korillabbq	t
5286645011d228bbd12f9880	/1353667_2qCG26N4ikz7mbvEGkrFkcNLagGqrzRuNyeQ35CCDE8.jpg	public	korillabbq	f
5231f54311d26e8da5827f3b	/977282_AToQDrlKW5PTNbNGQcB24_BeJNsRMgZTeYmC9P-or38.jpg	public	korillabbq	f
528e451f11d2a93e4361f565	/977282_wEw3nDjN0NbjC4CgQ00ON0YjdtnMocrfAjXDM4UH63Q.jpg	public	korillabbq	f
53287a0c498edd9a0567c2c0	/68150_i3UKBmIXHPN4h7gtvSQjnYfikUNmJuGRpjwKP2dLI5Q.jpg	public	dubpies	f
501c284be4b07d0ab63e08be	/vQv8P8_hFNwHMmpR7k6-arr8zqYmmgoSG_aAPJuz-ws.jpg	public	itizyicecream	f
5345d100498eaa611b76f338	/62345083_i2VdE3VeEPlbfUgNv9mWmVmsuL19upJhcHaRX3zje1w.jpg	public	dubpies	f
5328764d498e217e55fa24e1	/68150_4QSMIi6zBoyrZ1VeH1Dqb3fEovQswz93yHAPvf2lGmQ.jpg	public	dubpies	t
53287ac3498ee8ce8841a510	/68150_pNBQ4zhtsUiGR_kyfk0HziUGMzyIQwYcYpJ3VpZf7tk.jpg	public	thegreenradish1	f
5243206b498e78230cd0770a	/54092198_eF4CEteD3zHjOCJzaYssyRXaQElB-GEOy2sqzBFQPm4.jpg	public	thegreenradish1	f
535d6fe9498eeb428f0a49a5	/643701_B0msQNcQCClAiTuYbiNnskLICf99ehNmerkWdhYNR8c.jpg	public	snowday	f
533ddd9a498ebf7fb4775ca2	/36814481_r4TU0Q7tJ6Xum58iZ5olLRY6sV-P4dN3psrhw2ZZKZ8.jpg	public	snowday	f
525ee647498ef229c65969fe	/10045965_ptbEO58Zn5wDz6kgitvMVjFScmxSkkuHNbK-AguCXSM.jpg	public	thegreenradish1	f
54356960498ea4b991899874	/1399116_53XPgGs7xW4ug2d4XS1CK8Wn7_vYQnkpDQpPYamcBS8.jpg	public	bigdsgrub	t
51e83b4a498e0a1c64e62828	/26624_AGoljLki5SS-GJGKaAGB75mloHKRBkJ1Qj5BQCRP1_Y.jpg	public	itizyicecream	f
51dd9ddc498efb9a3437e123	/4501533_djr9d2BEP8dg7E48xJjJTa_Yjk0Iy-MmBG6hgIQBLUs.jpg	public	bigdsgrub	f
4e4e92c7b0fb088f3c0f14d5	/HTLXSW2D30RGIEYPI0JGR22LUCS5BTXQ0LXDWAOHH4PCVHM4.jpg	public	bigdsgrub	f
513101fce4b006d9c4991bdc	/17248619_XfpmI8dNgmoeHE3BXjV8bL2yuuMTqxU3FqDr4BqX7Ks.jpg	public	bigdsgrub	f
4fa2d04de4b0489ba3d7936d	/hsPbM0G5l3AsUaI3x6r_VkiSYo4pYlWTKK2S9zqh_KE.jpg	public	bigdsgrub	f
51f4589a498e97316d307dab	/186827_ilvLMlb3AFqgXUQJ43S7IjsLNPxYP3Pw5LEjrqhp6wI.jpg	public	chipsykingny	f
51716b5f498e03d8bc252c48	/11709298_S8klPxq0yPyZw2X9-_0IZyk6TFTn9xi5SWd_6BGCeVM.jpg	public	toumnyc	f
507dacb0e4b0d8cafc9601e0	/2361939_S3NwwSNVZD-2tAhc3bwAvsYgk9tXwYv0T0yq9ci-ihE.jpg	public	toumnyc	f
516d98b8e4b0b059e50ff5ad	/117715_BoNkQJO4jPWEtg_ef4-URb7IseoIXnYiP5vkvWJtezg.jpg	public	toumnyc	f
516452a5e4b0e1b216fdbaa4	/26263584_5wpEOb9FygNRBFQySA-pE1t1q_E9jVM_4mx2mnw5fAU.jpg	public	toumnyc	f
51b8a845498e8ebdef064e0c	/761163_j9ai1NfaIpK2TLN8JzXbTwyIhVzuZevNHBV5EpQ7Fh0.jpg	public	palenquefood	f
51435e1de4b07d53cf71fd7a	/4486_lUhkecOFThYlMHKai4wDp4lXXiQSPLTq3Nno5WMIz7E.jpg	public	palenquefood	f
4e6513efc65b2dc8a0bfff6d	/TUQTIKBJPOALJKHN54QRKGISWMQDDOW3WTAECOGJ4FOJTPXI.jpg	public	palenquefood	f
500ecc9ce4b0a6d209804d9e	/d2yG6CtTrc8TQAXoEGN68UYAv3DiJIqJvKU65-ApcaU.jpg	public	lobstertruckny	f
5245c7a1498e0eb9bc097723	/1727660_xLZtYmqATL4pckN_IhgIj0AgUbDAJxywzqbf5PKEooM.jpg	public	lobstertruckny	f
507b0648e4b0109f3656e2d2	/76137_7JNe3m0dO2MZ7a9rkqa_DTlnrw0LyNitqksFG7_5IC8.jpg	public	lobstertruckny	f
508abe69e4b01ff7516d118b	/8029486_9wt2tO9BnY5d11Ef0mpAgHAqfK1QMmSvLXglU4fj6Xw.jpg	public	lobstertruckny	f
4dcbff9440a3324246c6fb7c	/YVZPSDS5D1O5DR2NK5IFQKOU0ZNOQTQMTHMRWS3ESLQIQAWK.jpg	public	lobstertruckny	t
51424d6ce4b0041cb8df9856	/117715_oxR8_TwNSaCL-_gKDA2i2-1YoRfVVnbfT3M9Bfu4nxE.jpg	public	thepocketful	f
511a7d64e4b0c6a64118260c	/793192_Dtd9vMRk-pbBJscn1cb7n29zM87iJjZy6rojapRhODk.jpg	public	thepocketful	f
53c008f2498eb7426f809906	/8901_yT_FwBIUdR6vXYUM_nivPyu5TTVPRyYzz_45v8zawy8.jpg	public	thepocketful	t
51800af8e4b07a4a57023def	/9548073_erhzj0ShEDKaz8S8DhlDe90fDjJEIWjilIxO4_zjdGE.jpg	public	thepocketful	f
50a696b4e4b04d062582a95e	/32050404_qo6ZUnU5LQMoqrAR6YoH5Qz-PdUcD1d1jCheEJy7lng.jpg	public	thepocketful	f
51cb2c41498e9851cecdd49a	/5728350_vuJ4ORu0wHhd-B-f4FTNfsoIhfHgtJRMJc-QEeiYmNQ.jpg	public	taimmobile	f
4fa814d1e4b0d607baf8bd9d	/2drHnu4mqj-uzpwwcJa3MatYGD7KFuxjE472rButWlM.jpg	public	taimmobile	f
504a271ce4b0c65efb6b05f5	/PG0DfZvsxtqv4QM8Xpl6y8Ojahb0UanYwCPSdmuhj_E.jpg	public	taimmobile	t
519fa37b498e7adf7e8ebce3	/47170230_A9xVWAtkJBP-vVqUF1q2WlK8yuZTf1CVQz0JcPrHGY0.jpg	public	taimmobile	f
4dfa4a9840a3542ff44549df	/VBAJNQCBWDMP2WKDXJ5QHQ0WYF1MKHZSLUAZZJXKDBDLDUWG.jpg	public	taimmobile	f
51cc5aad498ef430f84d0bb7	/6118094_NBh6M6M6nf_5mYOkO-_utfQBmnbpNZTvTRhINFWsX6s.jpg	public	nautimobile	t
51dc48a3498efe9483d8417a	/117715_dlhUlP8z_jVejqRlWaCzsJBqg0eoP6rRSjOLpszFA0Q.jpg	public	veganlunchtruck	f
51105b22e4b0a7b61fac854b	/117715_vKu0po70jlTD3qN9mXsdNiE6V5Od1hmYMVlUY9xSIP8.jpg	public	veganlunchtruck	f
516ef5ece4b0d1c83382c12f	/117715_Gt3J4FMusC7YQjSfEup4O7bAO10z8J4gxmnd0xKnZuQ.jpg	public	veganlunchtruck	f
5196816e498eebbaef53fe6b	/32050404_-lVnQ_kgFICQK3OBrfq4QydeDqXhz3ZCRD3TrCvMPxY.jpg	public	veganlunchtruck	f
5176cceb498efe500552cc9e	/21735785_zaQs-7anNinrrQlobBV2AjNxquTXs5g8ZY0NxvoxvHo.jpg	public	steaksncrepes	f
523b2edc11d265bf373f82a0	/8853695_cjpq3trk4bFpcU1oHWwj4XxwwD9ZI169sNncUyOQoM8.jpg	public	steaksncrepes	f
50292d68e4b0d0acd3bb5dbb	/vv6y8qi6JFfXr9QDkIvTPP0fSmbgQ_jGXHCVwDv0c04.jpg	public	veganlunchtruck	f
529fe66b498e1fd14afe696f	/68150_h0wbg6xbNwrEjXD6uaE12ZDZYF_h55LN99Es520nMBI.jpg	public	mooshugrill	f
5267fa9611d2688bdc4587a2	/2136029_bvqot1MnMJ9IGYsYJkamqTiE_lL96OcfilWMxskhdU8.jpg	public	mooshugrill	f
50ca356fe4b05b0bb93edc40	/1590381_NyRIp7fXJtGoJoXp25IcMmufNufPxxvLEj3TVYXRo5g.jpg	private	getstuffednow	f
51c4890a498e94b118d3c4f7	/947598_cKatE0_E2EnwK8VRejBD8ExRoauRcW3l1ju3Y1YJUlo.jpg	public	andysitalianice	f
5213a7c011d27a56f99dfba3	/11074699_K2ka1_NxiELyTqgjvY3oMN70IUxIlADqRIAb5QpzsLM.jpg	public	mooshugrill	f
525b3a3711d2040fdcbd6fee	/52031712_DN0C9vfm3iv1geUuFX92Pt0jwgl8NhbGokLj_o0Ebjg.jpg	public	mooshugrill	f
4f9c18b0e4b0b38d2f554383	/AQEKYbyPrQt5uMWhy4r4ODm2vSMCqPseJyMhcg55mtY.jpg	public	eddiespizzany	f
4da8977840a3582fb8c49316	/MCGIPRA0XR15JNG4O2YZJQBCRMK05UVTC4T14TOQWRTNMQFZ.jpg	public	eddiespizzany	f
4fd79157e4b071eb33a9c810	/8zrcTIejD5EBiOJzSobql1_PQWr-i2KmRfgMCYmbK-M.jpg	public	eddiespizzany	f
4fb29dc4e4b0e08c1e225555	/ckjwTj4Fd2cRoZvDQZw_1jYdwuBF4BsfV4ZWc5oElFo.jpg	public	eddiespizzany	f
542c2fb9498e97db2676dd30	/19152_gqmkZvFomzQsd1bmXs_VAPUX3V8eyhtOS5hHM9oHpgo.jpg	public	camionnyc	f
51ccc251498e028212e9b1e3	/117715_ozxp6K6iPGwKCzQDARR3BgMcisplkTt0x4LEKDJdBMk.jpg	public	nautimobile	f
5022f267011cfeafe81dab9a	/7EPnN8ReXYQWoZYxzqkH9AQlOe8vFPtVP_60n65i9U4.jpg	public	nautimobile	f
4e09f3fca12d09aa881a769f	/NTSOFYDIBYVWGE4RYQTBBNIAQESPZ1LLW3Q4TC3TGMROSJPH.jpg	public	nautimobile	f
4e70e35c52b140871b6fa35f	/1TB5ROKJY5NF0GAVS4YS3WZTFCUXXHTPLLBUIK4BU0XD0QA5.jpg	public	nautimobile	f
5008051fe4b0974c844d5003	/oNy0_bsWPyVmjrduzJXpbrAPHjQS0PVbyOCfoRSD9xE.jpg	public	shortysnyc	f
4feb2bb8e4b0a47cf49787d7	/-CEaOy-zjgmGzmPRViSeNchwIITBbHgI3lFosreLqIE.jpg	public	shortysnyc	t
51a4ee69abd87ea53396c979	/4083549_jMzaCPEId80kWmAaq2oQ9APKf4bLvdeHhy40qPeB9j8.jpg	public	shortysnyc	f
50045b1be4b0004dbf67c977	/MDweBG1fBnF_fZ1tOghWyHS9qUxGNiJeOrOpoA-fBrY.jpg	public	shortysnyc	f
521e9e4511d2d8ddc5c69dbd	/117715_r7cpzyXCpOthqHouR5gdqIMX8k0TZ2KWHFun5wh-EYk.jpg	public	valduccis	f
5079a745e4b00277f33e4836	/34723233_tCoDnWhdhZj61xi_e00MNwJoK_UcfDXCQQ7Weat8pBM.jpg	public	valduccis	f
4fe65d6fe4b09198fde5842a	/nVmhJloDitdcBPFceYT8ajqQqgXBpB_w5GoPWse33Ks.jpg	public	valduccis	f
512161e0ebca7d20d6a70104	/4574_ZC6mf3ha1jNXmFUDgtNsN3zIf-NHyqgxA3WkUkOl4mY.jpg	public	biandangnyc	f
5106b878e4b05ec869ad8b34	/814104_blIawoImaEcqf-Mg89W5A-nEHiZ5jx76BEYHVzz8dnA.jpg	public	biandangnyc	f
505c9776e4b0643aba1071c7	/5568483_yQrtG73dbug7q06p9IASJmTFnOVgGprIZKbfHjQRcso.jpg	public	biandangnyc	f
527d2c2711d2c984e85cb11b	/4179871_5FQ2eCC5ZeizUVRLh4tadgEAO1BnJjVQ7pSEvSDwIfQ.jpg	public	biandangnyc	f
52373c49498e62a2930117b5	/85032_2JEjjCmOYlsUqDkchtdFaKW9WyiU0nYnCjd-0e4714k.jpg	public	domotaco	t
4ec59ebacc21b428e0de466c	/4AMXSGP5YGTUHEL3TFKTS5ROVIX4HUTU4MU5ZW1OX5E3URDD.jpg	public	domotaco	f
50ce2696e4b0881a7ef3ee67	/263293_lcA30Y_JnQGKaaHhRqFUio2HQ8UQkphCWP9yhW4CE3g.jpg	public	domotaco	f
520912ad11d2f941183dea9f	/13285510_v7K0PTg4FzGI822Jbc9A8K5mUHIxwJPBZB_0xNeEauE.jpg	public	domotaco	f
50ce269de4b07c1547ebfb2c	/263293_qjcLaRmf5itOMyRiq4AyYZuY2UVjVJk04lO3FTA2CMY.jpg	public	domotaco	f
538fa2da498e8efc80bc2cb7	/26065139_jgo2VLUL2PokQdo7SP2iJ6rtca8E552GZGM3Bhu1e28.jpg	public	langostruck	f
5220dc78498ebd10d150f736	/29917892_nMZHXkfxBukc2QfFqtDBTZSJ1xpMkoO7VGBJmGKkwhY.jpg	public	brooklynpopcorn	f
5258d3ef11d26d03cc0563a5	/117715_GQ_O1nyBbVlKTaYpRlprc8ZdIEAEftbU4_9hDGjvxsU.jpg	public	brooklynpopcorn	f
4fbfebe9e4b0a3bda0340383	/Brw9_z178IK92xMEXLCSSZrP0-99GXjutCp7dHCi5CQ.jpg	public	thetreatstruck	f
4fbfe026e4b04422a08a40f6	/Han8Z4R-SQ615pLoN2lRdPfKEFa6UW2yudSOxXmJtts.jpg	public	thetreatstruck	f
51461b9de4b0bb73a6821e97	/1102787_UDt7OJpexNs8VPrehVDsp9EtfUJnMhKzJ2tTXuof06M.jpg	public	thetreatstruck	f
4f753600e4b07eec20023ddb	/zUb4OswXiQLnF_k2xnx7AdupnEIl1nuGyIuFcmFWf8Q.jpg	public	thetreatstruck	f
516d80bd498e8f3b47ac90e6	/36812449_Vbw1XbeTn6HJHdJF1bzMp9TvcwrqCP5edmktYCzlW6k.jpg	public	gcnyc1	f
51eae36e498e58d50e5683ba	/331066_SArUzXa_cz_-YMQco1rwYAfU8a99TZCHJX9a2WA3fHg.jpg	public	gcnyc1	f
5106bdece4b051d6cb82a376	/1922740_Eqg3x5oj7wks2XGfudNYIAzcCuZHJiWpgLP1CCbonEE.jpg	public	gcnyc1	t
5410795c498e74cff2aed48e	/5864_GAP3yP3vlQyBpeK3IKyeS9azCR4R0hgVouqQiGPdTOE.jpg	public	hityourvspot	f
5507187a498e8ab5968bc213	/377760_Wcfue-MAFtEgRyWr0DDPKpXXxnCl7aqPN5ZyMAL9dUI.jpg	public	hityourvspot	f
508af08be4b02ba9b11cc747	/17430999_28ys6GXVoaOZoKPXLLK5GQpVEL8UrC1_1DajRIy8ia4.jpg	public	veganlunchtruck	f
526e8aee11d299d16e74b447	/67629862_ZPeS1alTFabw1hPqq8PCcGF1SRFynqA23OgkKg8yc00.jpg	public	lovemamak	f
521b83c411d29ec0512f89b3	/255980_1U9yRWzBKuIDLReBhmBs45qJ0mtHu7pzL_Fv4T9gTss.jpg	public	lovemamak	f
5245b75011d28cd2725f32c4	/2982235_y79gPBpI95RkUJ_pZbhVDGujTU5g8hRoskz3BqSI44w.jpg	public	lovemamak	t
513b9b7de4b04f7024bc158a	/45519738_eDUGOpHYwiR5C3VUps1gQ1YDIq0Di3WMfuirGs2EVBk.jpg	public	rickshawtruck	f
5217a7de11d2746c048106cc	/39707564_gPzbz_bNU4iuZ8B8xSD0b250GHVZPaepeD8NOUyrLI8.jpg	public	blend_express	t
51d31ab97dd28a271207af20	/59958053_5CogfmHgRpBtjkPzVkAgAjK7q9ac0bo8Z1TPwxPIFAw.jpg	public	grillonwheelsny	f
51e0320c498efa962e14eb18	/25342554_SdVvc9WOrSzlj9Rsy_0typl5IcOYEl2vOl_wKVaWoSI.jpg	public	getstuffednow	t
4f67b0d4e4b08559c4c60149	/SdNxRS0joKXurf0FEv8_SRg-GeR9lGCN098_ZB2tijA.jpg	public	mexicue	f
507efae0e4b09a52c022ec3a	/39213_nH-zcqfLCJqMvG0Nco0LWE4QuRuoL6unlEXJlJbTEF4.jpg	public	mexicue	f
5180207390e7374e46b6c165	/49563206_uKsSD-Cd2jjy6FMyR9U_--7DdUBJ7ZUxtdlushxyIAg.jpg	public	freshandhearty	f
55da547a498eaf4d18cd8668	/68150_a4wUYq9FTUtdVsozCiBJOWbFfw_Mr1J8Jn6Ag9NL4-Q.jpg	public	freshandhearty	t
51bf5237498e5ddfd58cd4c8	/16518471_biLXoMrblr4306jDwZDBDdJhZJ2Kz0YeORHDz_yVXSg.jpg	public	mexicoblvd	t
529fe356498eb76b55781266	/68150_0fjIotER7PaMHitF9odB_GOyMyFahAZ-OHvSCE9Y2e0.jpg	public	mausamnyc	t
507071bfe4b06e882e74b445	/1112203_qnT5k-31-4cRKDz00cUpp7Ia7HG3YTjhsC9Udo90RDI.jpg	public	philssteaks	f
52fe5db111d2d7644f04c21e	/404119_k2pARWK6AW8sOni-GGVsAfTehHeRbbnRCBGhfeb1xZc.jpg	public	philssteaks	t
51645882e4b0bcb0cb0c7ef3	/7511393_dEJJLGO8ljFPMA_kFidoz1wpWZ-k6mHpqYnuRwoBpRg.jpg	public	philssteaks	f
53d2ab0c11d268858b540b4b	/6657788_kfbbBA6MbAVWizEQdvBfuvdJ1YR6JyMX4pIFYaeiblQ.jpg	public	chefsamirtruck	t
521649b811d2913e20a1ae87	/5568483_RtMp5aDM_JtBZOI1u48Jy3om4Z672obezdu1uA_UWd0.jpg	public	toastmonsternyc	f
4f8dc377e4b0ca2accf75652	/EKcue5yGEyaPnBymSd_HtBxWEZl4grYSOXMhw-gqpTs.jpg	public	rickshawtruck	f
4fb6bb41e4b066430032e4ca	/HHZWTU3POi_yJE4GU0zI_NjZNerm5y3MjjxddcV5ZMs.jpg	public	rickshawtruck	f
4fba74c1e4b0a2484fae410e	/1XmG8W_3-cY3Qc-l1GwU7YSOBlzOwyGtk2BzKOkxqYY.jpg	public	gcnyc1	f
5280c18811d2e4df572063db	/5354893_5EtQmcwzMnTRFz9qbxjkt9FguCAC4xfW5xwUCyYIrbQ.jpg	public	waffletruck	f
4f733c44e4b039d898ce1409	/PQ9G-O3CAtCW6ixkiwHhICEaRn0L3Lz1F95zKcl_GdI.jpg	public	waffletruck	f
4fd26038e4b06145dfb72894	/zUVUqzIwbwoFsRrRenEhtDmBSbK2Ry9lzqeuYnmnHG0.jpg	public	waffletruck	f
527e823311d2db75dd831ee0	/22419482_1rrrm4nhOKXQsXN25ApmVsGDw4t2J3GyjhfeQPEbClU.jpg	public	waffletruck	f
525c259b498ea7548cf31f8e	/769710_ZxOOtsSbFVklHIRhXVmTO7ops0Pm0EybRDTgUvGHrSY.jpg	public	disosnyc	f
51dc5fec498e4e9be748eac4	/22801_gX0atVT6Jt_H6FPXuYAqHD4VzO5jAmS4SVid_ZLkk5U.jpg	public	disosnyc	f
53a1c287498edebe0e22b43f	/9446626_4q4cPL3HmqkIwu6ljinztCOxq6zm_V1V9MB_vkbZ6Qs.jpg	public	disosnyc	t
5193f5d8498ec8ee7f53d4ff	/11919710_SXBMpZ4zTc47tVk7zEdSMJG0WmxM4HhlHDhQc7NBzsw.jpg	public	polishcuisine	t
5192873e498e63958610c2eb	/117715_Jf2pdeF9ztory7puWsPaFE26jmMzPEzjOfPopvTzSjA.jpg	public	polishcuisine	f
5244712a11d295d581384a17	/22780_QXd0BtJcOWXZwSm_ZG3oXyaNj6Qw5-p8hWQzzH121fY.jpg	public	polishcuisine	f
51b8d7aa498e103b3a36ec2d	/47900463_7B6lLfz2PW1XyrG2vCIxp4vIq7QXWEhxufI5i75jwxE.jpg	public	delsnyc	t
51ab89bb498e83fced4cefd6	/66074_8dLzCKmVRde0Uvtx_NSl9SKROFh0kat1IQgcAvU4J3M.jpg	public	delsnyc	f
51fd732d498e415eeb8b9881	/8839239_mAp7_MVmWbbK42Xq3-W-1zmegy-MNx8NzB0P5Brf-Pw.jpg	public	delsnyc	f
520e673a11d25d1282a44199	/117715_KjwJnc6idBB7TuMKhGboHDg8IYjlGcr6h3I6_fJECmM.jpg	public	delsnyc	f
5012d0d5e4b06fc7ce735a68	/7J2g1YLtx4ma57g4A4CerJJ66OwudjGhFI67JaNl1Qw.jpg	public	seoulfoodnyc	f
4f5e6b3fe4b033732b227036	/7Pw4h0QMNateMpgFd_DAFO0uUnsIdcGzmHG_1in7Wu0.jpg	public	seoulfoodnyc	f
4fb1335de4b0f4503b23a67a	/GSQxN-iFZejvploz8v8hm2QzrWiTmg6QdgBffmHvsnc.jpg	public	seoulfoodnyc	f
514e42c7e4b0ec8b7e400875	/48992751_ibL8tx_7JPvV3aQmnEevrdibtLP0jWytaChkCdRuhG8.jpg	public	crafflesnyc	f
514e42a8e4b0d91e975b3db9	/48992751_womoOVd5bv-2KopmWjWEHA_WsyoWQITjAyXBuM4Ciz8.jpg	public	crafflesnyc	f
506dc9b9e4b0c21f078c3bb3	/22983_XN2GbKo3a5YsNY_ZpiBcjUHTD2if3TWS8r586Uq4cEk.jpg	public	blend_express	f
5033cee6e4b03e64bc749ee7	/tIyy6IAKcw2SSiX5JSPBCURstZZisntK_46plgrfdJ0.jpg	public	blend_express	f
519babe8498e355d9d35fca0	/65817_6p9jSMaQMqP9QGn3KOIyuDOG15jaLxIPvsdrpZGWdj8.jpg	public	blend_express	f
523c930a11d22e1c3012a9d3	/34169985_AiTXirGu6jTaGeWWhhOfl2QIbGVaQjdDg1QCEakqza8.jpg	public	mexicue	t
501fe830e4b0bbddce992f90	/fFBOGONZt5Zr77Vc5g8adoAiBht0f-MBut7GqorVEjo.jpg	public	mexicue	f
50784742498ec6be8cd3f88e	/155927_ebZApDyXpTKTmvOQHdBTxNc2wJrsZV2QASmpYTNAVJM.jpg	public	mexicue	f
50e719c2e4b0e263423e547e	/15471_4uN0tddGW5orNGh02xhxbiAOGUpAAy3rIWEotoRgB_M.jpg	public	tacobite	f
511d2c60e4b017a4221bec0c	/1425622_srSMuVL9KOV8rqb_UDiSQNwjvNOtMyF-zeTO7sHRZZo.jpg	public	nuchasnyc	f
50ef1f18e4b0710a5e5cb1eb	/117715_4lM2ZgzHp4Uv61-ckuWzdXXXcPVNEH2NjISpWAEjGds.jpg	public	nuchasnyc	f
4ffef65ae4b013ea5f373be1	/VqxEh6cK784gtMOJRF6Lnub985jBJPC6-FuwZwXt_y4.jpg	public	nuchasnyc	f
512bbfebe4b0b8faa466c796	/1425622_4wp7wCuj7Ci1dl_FVH9syKmrJwQavMhL9uqww1b0m1o.jpg	public	philssteaks	f
527e77d111d2e66fa6a871b3	/649454_HIWthX8nL3SZAOwyMlKj9Y7ju9GCiN4OEV-wZR6IKC0.jpg	public	philssteaks	f
5249c4bb498ecd25dde27c5e	/764670_x0RdEOs5TL4SEe2zGgpkzPFBFmlFV7-6UQiVtoFeHaY.jpg	public	goburger	f
51dc5a9e498ebf7ad40223ec	/1328035_Ak3fMs2e36r7NvIE_gIDK5XZ9CwrW1DEJa3g1oobp5E.jpg	public	wingnitnyc	f
51c213db498e0748ab0dca3c	/53641916_5aNKp9fdHx3i_Pi15Z_X6pE3fAsTX35YBQ0nlmZGfaA.jpg	public	morristruck	f
53becfa0498ecabf3380ad3d	/14196482__Nb-XE1Nu5U6-DjUyOaSLEZlftPX9UbGRO6ONPylCAk.jpg	public	coneyshack	t
5329e77f498ee6898be00a22	/11652594_SJ-j8bWUQDW088CP6WJV_hsoVB1X3sqlknJREVGXk-s.jpg	public	coneyshack	f
555a66e0498e8835d908f1cc	/11340787_R901RT00K2RnA_8Q0b_lKvHXGgpf5ReaOYkWrBKW6qY.jpg	public	coneyshack	f
52013fe1498e5f476bfdcf83	/30611522_DHhazmY8dyNAbmijjHX7jyyfVBEiugL5-GJcTLuYjS4.jpg	public	getstuffednow	f
523c8b2a498e959b87f8ded2	/39707564_-WCsPSk2ExKeZ8q06DtUQrpt_vcWG9-AzvFoToSdQqY.jpg	public	getstuffednow	f
51af7257498e0c7f8979c05d	/752258_nUJpoSxZ8p9BBJMG5ISetpo3DDLzycLT_gT3z9fvJmI.jpg	public	getstuffednow	f
5182ad6b498ef6cb59d48783	/39425123_zPh6ih4GAAygbhRJ-pyPdCr5TI3rXafgKyIEEK4HpHY.jpg	public	goburger	f
501d4734e4b0af03cf473287	/6BUHUmEyYTTh3a2SRjSYRklUlTfQBNbFnnk_hfEojYs.jpg	public	goburger	f
51dd9efb498ebbc846c11c03	/13001992_b9dLXH02o0ZX8hyUZVtpgGW6sDyzAl23vmEl-0Hj0jY.jpg	public	itizyicecream	f
55da6419498ec79aedeeda6a	/68150_xIw4p0jO4-q9xJjDv3t5DMEydCzO7Tsp0emPS9L6X_k.jpg	public	toumnyc	t
4fc7a5d3e4b0647c52b3c26e	/iRvxK7ohXIwK9Ib6wkVgtR46VKRLsamXuElhEtOlNKc.jpg	public	andysitalianice	t
4e42ae7f7d8bec1e4d1a1c92	/RVQ54SSKH1QCVFTLGHQMPXKMGUA3QC3FCQKXU2DOVHQNRT23.jpg	public	fritesnmeats	t
54978669498e92fb4a6b4341	/97520198_KIqmbmLkuFxboBU_HjFosEOXtwVA01QnxiBHugrwImE.jpg	public	shukanyc	t
556f5fe0498e71287f7c3e06	/68150_DEYnBJz_XjQjQWbq4QTnfip2-TEt4cDPYPIaF4zm9lg.jpg	public	mamasheros	f
556f5fda498e63fb4eda1f61	/68150_wqjx6504Fhkiz_LfsnouqTZvlLmrDMzJu96d8eZO-yw.jpg	public	mamasheros	t
4fd0f054e4b0757383b97c0f	/MbR1inb3VKXu0PQMsCkHkHGftYq0E8CDbYG3BLRRGaE.jpg	public	thecrepestruck	f
50f99bcee4b08ca132377f78	/4611139_CEH3eveI6uxlRVQLet5Fpa_sNfJwAzfheMTYSBplO5Q.jpg	public	thecrepestruck	f
4e94737ebe7b8f7220377349	/UABDRYTA3ON4XXTR4HQH42UGYB30IVX015FHLMFZVJ2KQASB.jpg	public	thecrepestruck	t
52a0bef911d299250c89f9c7	/349672_Cg8dtcrfQ0WZeSo7BJR61YBG6VzsiMltZP8XIqyHiu0.jpg	public	mrniceguytruck	f
529ccbc511d21047117cdea2	/68150__CRf8sW9KvXZTkcAQEc4EsnYPgqXA2trmMxy-_AzobY.jpg	public	mrniceguytruck	f
5391f2fb498eaff244578f11	/715320_7m2CfczIRBJpmjgQRa0xuWupsh_NmhZk_MrRWfnI_mQ.jpg	public	parissandwich	t
51f15b4d498ee58fec420a7c	/13285510_Q-SBXKFpfroSwQ-QJdezzrh1KaHfHAmLyicy8d5S1jU.jpg	public	parissandwich	f
5243126c498ea77b19b3a444	/65506790_31Qpx9E-ZjuNve-izmDY6vVxUCMrhgGsnOLn4-fusp4.jpg	public	parissandwich	f
51b22a0a498ec00d1c45726c	/390807_y2oeK6xR54wk9b1Sfm82Ek09Auv2lNkRTpJOzos3xjU.jpg	public	parissandwich	f
51c8a3c5498e797153ec5629	/46314126_95x6AErCZEGSi1zGZrFCY-EzgsIMyOhgO4G59l-u_Xg.jpg	public	funbunsnyc	f
5212ec18498e9494b634a94c	/814104_tUkLgiQ8zcYxovra9R8PIx7FckFhBjzNVHmirteXd58.jpg	public	funbunsnyc	f
505204d6e4b02dee62bd961a	/dcOYoRoNNeCLMxvoyAN-o9gJObcw5FljMqYpS9cps84.jpg	public	funbunsnyc	f
4ffda271e4b03bbc7f8fd13a	/6Dtx8fj7IXT6M3O6ZV3rXryb6zKTAqPchjeOM2BJJAs.jpg	public	funbunsnyc	f
53287a41498ef1dfde86d217	/68150_jBIeF8OZP2o4q5lJjB4TeUteiuuczqDDm3s4zQGipGc.jpg	public	shanghaisogo	t
530f7b7b498e225c3989957a	/20103877_gKGG5Z15ifazVa7PoBKpyKecZK7x2dWgjFIDOkwO38c.jpg	public	shanghaisogo	f
551eb68a498e136a7e3dacac	/89498162_GK7wVV_VF_ZbdcpURHla6Btpz7w6ls1aYNB9Q020WxY.jpg	public	neaexpress	f
55da612b498e7986da882759	/68150_kVXNCZMNTi6VASGjv7tgcFBneZ1Dq5OLpxfsl-WRCNI.jpg	public	neaexpress	t
51dc0e71498e8db4f9a8106e	/4456614_ZWvsB80ogvwYkoKIyVf6q5RfcDXwuKI4t0XJJhyLQ_I.jpg	public	thesteelcart	f
519a7e33498e6e4ea6ff66f1	/3354_e_1JMupbEA8VtOBVXgLHAvtJGQwcpHvY2JyFESXYSjo.jpg	public	thesteelcart	f
5254357b498ec4662e20c654	/2620660_kMXeinZ_B6lOrHRQnheIHMBr7p81ZxcUblWl0SQ1vEs.jpg	public	thesteelcart	f
519bb23b498e208a0b81b7fa	/9285455_LZiJ4FLH7NOWjNUsXO9jxDRFAgLygBSB8SmSIW0z9kM.jpg	public	mactruckny	f
5165924de4b093be3bc5cd57	/2159706_uFl3RYgA1z4EiDNp8PtjjG2HHWhTiiXDLNzJtFWPHS8.jpg	public	mactruckny	f
5151c82de4b024888079c5ea	/5003144_g8kbTzyfr6gL9vIRpMBbXz4TqBUk5EgkqIPlBP9DtsA.jpg	public	mactruckny	f
50883301e4b0904987088a20	/2361939_J2zcgauqqGFC_PZPyvkfEDoSufdDe5qE7gi_NkS1P1U.jpg	public	mactruckny	f
520538a611d2b476431ac7f9	/117715_GMdoseCn4baUtTX9kN6_PAAfHaGIlUpjxzAitpqLAOY.jpg	public	chefsamirtruck	f
5189442c498e765ce62d5924	/2432527_5nUa0fTfy4rzjXpiIUIlkguBa2kdqFSZIG-PLvkKu2Y.jpg	public	chefsamirtruck	f
4fd0d80de4b062589043211f	/hZjMDK5KKgxjMhmOGBtaRjx_ga0SWHwppqfLfqw20Tg.jpg	public	chefsamirtruck	f
5294e76b11d2879d5217bd00	/47558447_v1SwJZbLSZ2etlJXOF9qw4H3vErpdTiVIqXxULSVTSU.jpg	public	chefsamirtruck	f
5245c79c498e057f7d5ff65d	/117715_CEghvDHaxkALy5RxQCAVW-kyM0TAZo2-fIT4e6veJeo.jpg	public	neaexpress	f
5568962e498e28889a3c79a4	/276818_apRGkmx83lAjJNn6Dbd8xPe7iW0vTSrJEwb3LCqyLCg.jpg	public	pontirossifood	f
518a82c9498e068718057964	/25979758_bGWQQ7W2SJI4v7KmU891VcYZGitov6qbSNAnIEt8HTo.jpg	public	toastmonsternyc	f
52e456f2498ea9ece32b66e0	/25812424_w-pfXOZy2D8xWVJY37hGi4VXYiDnicBFvWRiiDOnNhE.jpg	public	carlssteaks	f
5203e16e498e9e8e0a93b61a	/702028_Fog-6PEF03KateivIPP-hx87Qn6gi7PwnaJv-wTFv3I.jpg	public	carlssteaks	f
55da5467498e1d9f64d28c57	/68150_B2x11YLO-NbpSVy1z-s3j6Az5i0b6vSM3L3EOYB6o1Q.jpg	public	carlssteaks	t
5203bd51498ed50247ee01dd	/60805368_HlIeqCMjY2I5md2mzI5crKizc9wVPUZo_sBmC6zrPEA.jpg	public	mamuthainoodle	f
526fef71498e92d1ace459d9	/60805368_eCRrBwapYrNL8fM9tmIaLCfnlhQYb9ASU-ZkaR1Og54.jpg	public	mamuthainoodle	f
5197fe76498e1c056c96d21b	/117715_m462oAqyqBN12xyWCOyzYR6-1gtYrUa8BiX9r9OybE8.jpg	public	kimchitruck	f
4e3da652d4c058f9dc087a6c	/QEOIS2W35WLTHYK00QC04LKKX4X1SYW3DDI45X30HSKTJENQ.jpg	public	kimchitruck	f
501975c5e4b092f6a51ef338	/bI7RrGcK_moyn-kJICa1OCciBVuYYykwCMGlea6mcxg.jpg	public	kimchitruck	f
4e00e61aa12db1129557e99c	/WSUNYIB0YFVRCTXB13UCRCTANZUG0DO0X2FWCUYYILU4TCGB.jpg	public	kimchitruck	f
50f59e2ee4b0b31f58d6cc1f	/1922740_OhtWiNUDUcN0NE_HB3Tk8vm5qIZcvqxcP2nMDrN8dT0.jpg	public	kimchitruck	t
5410d00c11d24d29446d44c6	/10837211_UZDe_Sme56cWk-Gex8X4tfxg9bP-GHZcMWTK8imQoog.jpg	public	latinkitchennyc	f
5436c50e11d248d936eac143	/19152_M_ApacXXYJKPZC2fQRc7PP3Ft1gKho4lkea0eGMXrGY.jpg	public	latinkitchennyc	f
5249b1c511d23e54343ae083	/769710_HUiZ7dJrNbdnPYV-DTQRr1z0zgoxFx9KMC_Y-OQ6O2o.jpg	public	bobjotruck	t
51378e9ce4b071feb46ef7cc	/18792384_RSm8zhe_6kUOxy91taByfRjTDSLp7stH7PI41aJHOrU.jpg	public	bobjotruck	f
5249b50c11d2d415e3c6b017	/769710_HOnpTjl0b6qd4-yoPpg9lXZGBy-ZKikqzLlFWw2sQfs.jpg	public	bobjotruck	f
4fe20639e4b05dcdf7f5737c	/l9UdGGevddtOhDk6scQjcy1-TbVBX-wf8Gf56jBIRIg.jpg	public	bobjotruck	f
53860b95498ee26cd484fe30	/81832079_fNoLG8cvJl_IqYaTNF8p9uwsDsglMXnfF2DKZ8X0Tk4.jpg	public	mtblls	t
53e3b619498e4b9015f0bad7	/68150_s6TPzQTspWKu7AI0DXgjZai6xKrtSkWgIdJNkenXMfs.jpg	public	mtblls	f
523887bb11d2ac89551d71ff	/5568483_apwtHKsNfvYc-IjeDL1_oqXIqZsLTUGH_-l1uxxAiGo.jpg	public	mtblls	f
542a28a1498e4288ab95e302	/68150_E567_ql-1p2jEv5ysetaEOgtnxpMmeLwZghpwLximCw.jpg	public	papayakingtruck	f
542a28a8498e8c25fb70df8c	/68150_ru2bxW9jr0deeGFaJrvEbwBh8Bv1FRW82ZIglwoRv1M.jpg	public	papayakingtruck	f
4e42f5ecaeb7f6be72c39c70	/JC5VO3Z50HMMMVLCCGWDQPMKF4W01VBXP1QS2LFESR55UHIX.jpg	public	fritesnmeats	f
51bf306a498ed0fde41060d6	/250434_ayEUsJHsbHDQFjUrGrR2fdlBjswuffyRTlWWFrW0-dU.jpg	public	fritesnmeats	f
5413499511d26b1c8b577c09	/4195495_Ir_R8BxT1YxyTe-VuFD3U5pw6j9CobWIBlYp1FF-TwI.jpg	public	fritesnmeats	f
4fe1fbabe4b0be4ebe6c1c52	/HNMFUfRPXDmxSDWAwh7pixJ34SFUY0fgzZFeOLAVXU8.jpg	public	funbunsnyc	t
5109aed2e4b01d2a5b69b022	/117715_0jgrjk5IsUFppNAL0NtebyMYoz1JMdzrnWAIjrLMHZw.jpg	public	schnitznthings	f
5012e555e4b0dd18ec16bd37	/mZQAOCmv5lnRZ1qOUTwDXk-MLC-X-p01AfECgfLJC2I.jpg	public	schnitznthings	f
522e088e11d2d4539942a387	/39707564_2mJZIxFUyGllfVMRjXdE86dZsCxH8cmCdUv29E4dfmE.jpg	public	schnitznthings	t
545d48d2498e3e01487425a1	/8418727_ueAVzhZe5huI9alIjmHct6sTu6gQ4RyIUDXP0_qGF4M.jpg	public	kayanyc28	f
52d32962498e318b0a9942f1	/61382883_iF5gX7tlMJ3CWlWcTkpntPniCUpS3o7H8anOau4wiKA.jpg	public	usafoodtruck	f
52e6af38498e26e622e5398c	/4147709_E9hzkLfHAJjdgQ6RT3W29cf-cftJShyXpRthu8riZYs.jpg	public	hibachiheaven	f
52e2aa07498e25b9a084ee94	/12998378_50qpDzH_XwsSlaJpw-f2fDtJsSvQg4TU_ujjdsnyWOw.jpg	public	hibachiheaven	f
4fda1cf4e4b0f6aceebbdb2d	/lKL7uz06jZgB680Vye9zxa_2yQfH96afFExvxaLlRpU.jpg	public	hibachiheaven	f
516ee142e4b04f28d58be309	/36812449_DjR1ynMnMpwj-KmiWPZQldmGQwJ2IEzjSwwmGevqe3U.jpg	public	sweeterynyc	f
5107e09be4b047c08ade6bf6	/760350_ZaalKVnOYdVAGoQEdugu-1Lws1LubyJBOVpZvJJD1V0.jpg	public	sweeterynyc	f
50188a43e4b0d35e6d8035b4	/b-fKh6mx2WxCybNQkr9ovk_jv4x7bwJPVFM9RF3M5T4.jpg	public	sweeterynyc	f
532879fb498ec68315b3d232	/68150_KF6qgT-viSOMS5bt3lJarsNeEUjlVJn1lbAypyCl1js.jpg	public	dubpies	f
5086e523e4b02ca59cae7bd4	/2361939_1JvatS0wOUdQQIaTmd4Vmk8bgr7aFYOR7LaMkRio0X8.jpg	public	mausamnyc	f
513f646ce4b0b1892aaae1bc	/13285510_LmdJLKoCS9fSwm3wy96lcieTczjsLuxAEUnU3FlZDlo.jpg	public	mausamnyc	f
51194bbae4b0cd237850b223	/793192_FQUO1SFGyLkg5NRz6VUYl3_zmFgfy0Mh8gL1unO8ijM.jpg	public	mausamnyc	f
53287c9c498e4b30223220d1	/68150_mMquObtK1F2QjX3VWuhYK2MtjUA9i5QRzexf9zWrBOQ.jpg	public	thegreenradish1	t
559eba5d498ed3b75095059e	/21832446_2POlNScZ2g8opbNsoyOSVET81dD_UbrXct5G3cioosQ.jpg	public	schnitzi1	f
4f7deaf5e4b0ffb6a3f2008e	/Xho5Xq8BtpNhEQvH0KRI3yX4kUstFRwTxEDj6QoawcM.jpg	public	palenquefood	f
5197cb68498e8d409a89ec1b	/1847096_oRB5R_owQW40gVWlJhNNsh9_0bEq2D8Rt3Zod9HUbUg.jpg	public	disosnyc	f
514360f4e4b0455b303a4d66	/8626436_tfGrSomdm1qEPFKcyb0Q5atmm3DmDeao1W8MotOtOwY.jpg	public	milktrucknyc	t
4fee068ce4b0f9bd2b4041f7	/UQwqaF9knSdh4LFRzAhnh7hcl6_dSjDTg1phtqTe_7Y.jpg	public	milktrucknyc	f
5281221811d21e907e460e00	/4195495_akELCvAQ7aY-bfTfHk93g5g5_qcJnQJV7h_gH0FlKUA.jpg	public	milktrucknyc	f
4f749b3fe4b0f06c04ae2440	/rA31cWGMm0G8EuZFYZBxb3y2OrW3oEo7vCj1L2XR3AM.jpg	public	milktrucknyc	f
52052ef211d22b8ed81dd96b	/36360429_am9ha8rSYxAvCaSMU9ya6lI9MzIgcpR62DH6HS1b-uY.jpg	public	milktrucknyc	f
50e71f82e4b07154c72fdc22	/275165_az4RUZ2U7-4cfdnQA1FlMrDLaxwCMriWtlhS_pddjEc.jpg	public	mexicoblvd	f
5140cc96e4b0ef29f4802508	/4886503_z36ZXtYKGVIHcNLCR18ZdUWtpStRrbf33rInxsr2p1Q.jpg	public	mexicoblvd	f
525de1d7498ef4b27ada0847	/31827631_CApIgPWaXupe3toLi7iJLb6NxIyn2IDTOjAG0qw-PIk.jpg	public	mexicoblvd	f
5239ddce11d2ab4765d5cc7f	/5568483_alwOH7sfGU8-pKfLmurfe9rt3pk2G6p90KwFyC6hq1A.jpg	public	sweetchilinyc	f
5208f543498eaeeaaad3ce52	/15629_P_UAUr_S-OO0R12wNp8LDPwr-ZbfPiWeG0Q0rrjW6Ww.jpg	public	sweetchilinyc	f
51f2be1f498e71235db5b61b	/117715_mGfGU0UGjUMhgqgwrDPf2f44NZtfMrobqJMF8ahsrjY.jpg	public	sweetchilinyc	f
516cdc93e4b0d6bb083f9db2	/117715_3eRUhgkRZGVpjDAYUz9TD5yQXPVFmg0iCB7iIgv_XD0.jpg	public	souvlakitruck	f
50be4929e4b0ada0df80b932	/4611139_UjW8jF3qFz_uyk0hDKT6CMZI2q3My4j6ZiwX-68QpME.jpg	public	souvlakitruck	f
50031911e4b034c2944f0c3a	/bExPPWxN-4YhYlw2nPz-T5eA3mYN-U78LUZtcIzjTRM.jpg	public	souvlakitruck	t
51cc7075498e8d24309aea57	/991186_cg_CePJhqcT81QY5l1L4eB3MQxy_QlsRh4zmZDk8cFM.jpg	public	biandangnyc	t
5199097e498ea36447e54093	/40899881_hbjUdavpBfT-sLaBhv3pbZydT1tgs9v-Maw12j9I3Xs.jpg	public	carpedonutnyc	f
520f87b511d2e753e7955853	/44_gUd2HlRFt-yMUFcOdI_EUCdz5NK86hKk-3kHwZhHou0.jpg	public	carpedonutnyc	f
541cd5a2498e539acbe986b1	/21832446_ZrLNVQwpCFEFosqLZcxwCuMZOAXA7BIQY7J1kYeBp3U.jpg	public	carpedonutnyc	t
531b7d5e498e3df35f261af2	/22402741_aYe825rrQDsEq6E_Pqv35za149PBn1PcT557SaJhOK4.jpg	public	brooklynpopcorn	t
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: mca
--

COPY locations (id, display, matcher, lat, long, zone, site) FROM stdin;
2	26th between 11th & 12th	26th between 11th & 12th	40.7513560000000012	-74.0068219999999997	Manhattan	nyc
3	36st & Broad	36st & broad	40.7515259999999984	-73.9877749999999992	Manhattan	nyc
4	32rd & Park	32rd & park	40.7457739999999973	-73.9822599999999966	Manhattan	nyc
8	39th & Broadway	39th & broadway	40.7536419999999993	-73.9871219999999994	Manhattan	nyc
36	Columbia	columbia	40.8073710000000034	-73.9644040000000018	Manhattan	nyc
37	Union Sq	union sq	40.7354860000000016	-73.9915570000000002	Manhattan	nyc
40	Wall & Pearl	wall & pearl	40.7055330000000026	-74.0079259999999977	Manhattan	nyc
43	Hanover & Old Slip	hanover & old slip	40.7040179999999978	-74.0089810000000057	Manhattan	nyc
44	Old Slip & Water	old slip & water	40.7040379999999971	-74.0089650000000034	Manhattan	nyc
45	Fulton & Water	(fulton|water) & (water|fulton)	40.7074240000000032	-74.0041140000000013	Manhattan	nyc
46	Starrett-Lehigh	starrettlehigh	40.7515750000000025	-74.006684000000007	Manhattan	nyc
47	Fulton & Front	(fulton|front) & (front|fulton)	40.7069139999999976	-74.0037920000000042	Manhattan	nyc
49	John & Front	(john|front) & (front|john)	40.7063819999999978	-74.0046009999999939	Manhattan	nyc
50	30th & 7th	(7th & 30th|30th & 7th)	40.7484710000000021	-73.992486999999997	Manhattan	nyc
51	Water & Old Slip	water & old slip	40.7040810000000022	-74.0090100000000035	Manhattan	nyc
53	7 Hanover sq	7 hanover sq	40.7045570000000012	-74.0092199999999991	Manhattan	nyc
26	53rd & Park	53rd & park	40.7590670000000017	-73.9726100000000031	Manhattan	nyc
59	77 Water	77water	40.7043899999999965	-74.0084190000000035	Manhattan	nyc
60	27th & Madison	27th & madison	40.7433199999999971	-73.986188999999996	Manhattan	nyc
62	47th between Park & Madison	47th between (madison|park) & (park|madison)	40.7556549999999973	-73.9761759999999953	Manhattan	nyc
16	47th & Park	(park|47(th|st)?) & (47(th|st)?|park)	40.7553320000000028	-73.9753050000000059	Manhattan	nyc
9	40th & Park	(40th|park) & (park|40th)	40.7508529999999993	-73.9785940000000011	Manhattan	nyc
10	40th & Broadway	(40th|broadway) & (broadway|40th)	40.7543330000000026	-73.9869010000000031	Manhattan	nyc
29	56th & Broadway	(broadway|56th) & (56th|broadway)	40.7654300000000021	-73.9820880000000045	Manhattan	nyc
30	58th & Broadway	(broadway|58th) & (58th|broadway)	40.767201	-73.981819999999999	Manhattan	nyc
63	55th & 6th	55th (&|@) 6th	40.7630470000000003	-73.9781480000000045	Manhattan	nyc
64	Hudson between Houston & King	hudson between houston & king	40.7283180000000016	-74.0071609999999964	Manhattan	nyc
65	Fulton between Water & South	fulton between water & south	40.7067819999999969	-74.0036599999999964	Manhattan	nyc
21	49th between 6th & 7th	49th between (6th & 7th|6 ?& ?7)	40.7599039999999988	-73.9823590000000024	Manhattan	nyc
66	Varick between Charlton & King	varick between (king|charlton) & (charlton|king)	0.727512999999999965	-74.0055210000000017	Manhattan	nyc
27	53rd between Park & Lexington	53rd between park & lexington	40.7587460000000021	-73.9717480000000052	Manhattan	nyc
61	52nd between 6th & 7th	52nd between 6(th)? ?(&|n)? 7(th)?	40.7617740000000026	-73.9809450000000055	Manhattan	nyc
7	38th & Broadway	38(th)? ?& ?broadway	40.7528950000000023	-73.9873400000000032	Manhattan	nyc
48	Fulton between Front & South	fulton between (south|front) & (front|south)	40.7065100000000015	-74.0033700000000039	Manhattan	nyc
58	Fulton & South	((south|fulton) & (south|fulton)|seaport @ fulton)	40.7062480000000022	-74.0030780000000021	Manhattan	nyc
41	Wall & William	(william|wall) & (william|wall)	40.7063630000000032	-74.0095309999999955	Manhattan	nyc
23	51st between Park & Madison	51st (between )?park ?& ?madison	40.7582120000000003	-73.974371000000005	Manhattan	nyc
39	King & Hudson	(king|hudson) & (hudson|king)	40.7280859999999976	-74.0073170000000005	Manhattan	nyc
11	41st between 6th & Broadway	41st between 6th (n|&) broadway	40.7546589999999966	-73.9857259999999997	Manhattan	nyc
25	52nd & 6th	52(nd)? ?(N|&) ?6(th)?	40.7611660000000029	-73.9794430000000034	Manhattan	nyc
13	46th & 6th	(w)?46(th)? ?& ?6(th)?	40.7574180000000013	-73.9822879999999969	Manhattan	nyc
38	King & Varick	(varick|king) ?& ?(king|varick)	40.7278889999999976	-74.0054949999999963	Manhattan	nyc
5	33rd & Park	(33(rd)?|park) & (park|33(rd)?)	40.7464680000000001	-73.981827999999993	Manhattan	nyc
42	Hanover & Water	(hanover|water)( sq)? ?& ?(water|hanover)( sq)?	40.7040890000000033	-74.0090000000000003	Manhattan	nyc
67	Pearl & Broad	(broad(way)?|pearl) ?& ?(pearl|broad(way)?)	40.7034439999999975	-74.0116299999999967	Manhattan	nyc
70	25th & Park	25th & park	40.7414580000000015	-73.9854219999999998	Manhattan	nyc
71	27th & Park	27th & park	40.7427059999999983	-73.984531000000004	Manhattan	nyc
69	23rd & Park	23rd & park	40.7401720000000012	-73.9863629999999972	Manhattan	nyc
22	50th between 6th & 7th	50(th)? between (6th ?& ?7th|6 ?& ?7)	40.7603999999999971	-73.9814439999999962	Manhattan	nyc
24	51st & Park	51(st)? ?& ?park	40.7578299999999984	-73.9734770000000026	Manhattan	nyc
68	Old Slip between Water & Front	old slip between (front|water) (&|n) (front|water)	40.703985000000003	-74.0085710000000034	Manhattan	nyc
90	Wall & Water	(water|wall) & (water|wall)	40.7051310000000015	-74.0074060000000031	Manhattan	nyc
92	55th between 6th & 7th	55th between 6th & 7th	40.7636529999999979	-73.9795929999999942	Manhattan	nyc
94	Water & Broad	water & broad	40.7029610000000019	-74.0114769999999993	Manhattan	nyc
91	Water between Wall & Gouvernour	water between wall( st)? & gouvernour	40.704894000000003	-74.0077849999999984	Manhattan	nyc
54	Dumbolot	dumbolot	40.7031050000000008	-73.9866640000000046	Brooklyn	nyc
73	55 Water	55 water	40.7036530000000027	-74.0085279999999983	Manhattan	nyc
74	22nd between 5th & 6th	22nd between 5th & 6th	40.7415459999999996	-73.9916159999999934	Manhattan	nyc
77	53rd & Madison	53rd & (mad|madison)	40.7597080000000034	-73.9742140000000035	Manhattan	nyc
6	37th & Broadway	37th & broadway	40.752200000000002	-73.9875430000000023	Manhattan	nyc
12	45th & 6th	45th & 6th	40.7574249999999978	-73.9822730000000064	Manhattan	nyc
15	46th & Park	(46th & park|park & 46th)	40.7547059999999988	-73.9758099999999956	Manhattan	nyc
20	49th & 3rd	49th & 3rd	40.7552540000000008	-73.9712619999999959	Manhattan	nyc
31	56th between 2nd & 3rd	56th between 2nd & 3rd	40.7566389999999998	-73.9687619999999981	Manhattan	nyc
19	48th between 6th & 7th	48th between ?6(th)? & 7(th)?	40.759248999999997	-73.982680000000002	Manhattan	nyc
18	48th & 6th	48th & 6(th)?	40.7586517333984375	-73.9813385009765625	Manhattan	nyc
32	70th & York	70th & york	40.7655420000000035	-73.9547149999999931	Manhattan	nyc
33	71st & York	71st & york	40.7661119999999997	-73.954221000000004	Manhattan	nyc
34	116th & Amsterdam	116th & amsterdam	40.8067339999999987	-73.9610370000000046	Manhattan	nyc
35	116th & Broadway	116th & broadway	40.8080789999999993	-73.9639930000000021	Manhattan	nyc
78	65th & Broadway	(broadway|65th) & (65th|broadway)	40.772945	-73.9820569999999975	Manhattan	nyc
80	Vandam & Varick	(varick|vandam) & (vandam|varick)	40.7263939999999991	-74.0056519999999978	Manhattan	nyc
81	27th between 11th & 12th	27th between 11th & 12th	40.7518559999999965	-74.0063159999999982	Manhattan	nyc
82	Charlton & Varick	(varick|charlton) & (charlton|varick)	40.7270370000000028	-74.0056340000000006	Manhattan	nyc
83	112th & Broadway	112(th)? & broadway	40.8054479999999984	-73.9657600000000031	Manhattan	nyc
84	Old slip & Front	(old slip|front) ?(&|@) ?(old slip|front)	40.7037759999999977	-74.0083640000000003	Manhattan	nyc
86	17th & 5th	17th & 5th	40.7379010000000008	-73.992211999999995	Manhattan	nyc
87	53rd between Park & Madison	53rd between park ?& ?madison	40.759408999999998	-73.9734469999999931	Manhattan	nyc
88	49th & 6th	49th & 6th	40.7592149999999975	-73.9808929999999947	Manhattan	nyc
89	Hudson between King & Charlton	hudson between king & charlton	40.7277040000000028	-74.007284999999996	Manhattan	nyc
93	99th & Madison	99th & madison	40.7892020000000031	-73.9526939999999939	Manhattan	nyc
95	Gouvernour & Water	(gouvernour|water) & (gouvernour|water)	40.704619000000001	-74.008152999999993	Manhattan	nyc
97	Houston & Broadway	(houston|broadway) & (houston|broadway)	40.7254569999999987	-73.9968190000000021	Manhattan	nyc
98	58th & Madison	58th & madison	40.7629540000000006	-73.9718469999999968	Manhattan	nyc
85	46th between 6th & 7th	46(th|st)? (between( )?(6&7|6th & 7th)|\\(6&7\\))	40.7580250000000035	-73.9837100000000021	Manhattan	nyc
55	Brooklyn Navy Yard	brooklyn navy yard	40.6992819999999966	-73.9725830000000002	Brooklyn	nyc
56	Jay & Front	(front|jay) & (jay|front)	40.7023510000000002	-73.9866710000000012	Brooklyn	nyc
57	Jay & Water	(water|jay) & (jay|water)	40.7030749999999983	-73.9866169999999954	Brooklyn	nyc
75	Front & Adams	front(s)? & adams	40.7024699999999982	-73.9885479999999944	Brooklyn	nyc
76	MetroTech	metrotech	40.6942189999999968	-73.9857250000000022	Brooklyn	nyc
14	46th between 5th & 6th	46(th|st)? (between )?(5th ?& ?6(th)?|5 ?& ?6|& 5~6)	40.7566249999999997	-73.9803210000000036	Manhattan	nyc
99	45th between 1st & 2nd	45th between 1st & 2nd	40.7512430000000023	-73.969530000000006	Manhattan	nyc
100	320 West 66	320 west 66	40.7759900000000002	-73.9877170000000035	Manhattan	nyc
72	52nd & Park	52(st|nd)? ?&? park	40.7584439999999972	-73.9730260000000044	Manhattan	nyc
101	76th & Amsterdam	jcc	40.7811900000000023	-73.9800429999999949	Manhattan	nyc
102	Broadway between Houston & Bleeker	broadway between (bleeker|houston) & (houston|bleeker)	40.7260139999999993	-73.996255000000005	Manhattan	nyc
103	22nd & 5th	(5th|22nd) & (5th|22nd)	40.7408709999999985	-73.9900860000000051	Manhattan	nyc
79	Hanover sq between Water & Pearl	hanover( sq)? (between )?water & pearl	40.7043129999999991	-74.0091780000000057	Manhattan	nyc
96	21st & 5th	((5th|(w )?21st) & (5th|(w )?21st)| 5(th)? between (e)?20(th)?( & )?(w)?21)	40.7402579999999972	-73.9904989999999998	Manhattan	nyc
1	20th & 5th	(5(th|ave)?|20(th)?) & (5th|20(th)?)	40.7396799999999999	-73.9908470000000023	Manhattan	nyc
28	55th & Broadway	(broadway|(w)?55(th)?) (&|n|between) (broadway|(w)55(th)?)	40.7649660000000011	-73.9822230000000047	Manhattan	nyc
104	60 Wall	60 wall st	40.7061449999999994	-74.0085569999999962	Manhattan	nyc
105	Greenwich & Park Pl	greenwich & park pl 	40.7142770000000027	-74.0115399999999966	Manhattan	nyc
106	40th between 3rd & Lexington	40th St between 3rd Ave & Lex	-40.7498330000000024	-73.9761979999999966	Manhattan	nyc
107	48th between Park & Lexington	48(th)? between (lex|lexington|park) & (lex|park|lexington)	40.7555869999999985	-73.9740330000000057	Manhattan	nyc
108	50th & 6th	(w)?50(th)? & 6(th)?	40.7598649999999978	-73.9804210000000069	Manhattan	nyc
109	330 West 34th	330 west 34(th)?	40.7528489999999977	-73.9950139999999976	Manhattan	nyc
110	45th between 5th & 6th	45(th)? between 5(th)? & 6(th)?	40.7560750000000027	-73.981057000000007	Manhattan	nyc
111	33rd between 8th & 9th	33(rd)? between ?8(th)? ?& ?9(th)?	40.7521369999999976	-73.9953440000000029	Manhattan	nyc
113	98th & Columbus	98th & columbus	40.794238	-73.9665870000000041	Manhattan	nyc
114	57th & 8th	57th & 8th	40.7667590000000004	-73.982836000000006	Manhattan	nyc
115	87th & Lexington	(lex|87th|lexington) & (lex|87th|lexington)	40.7801619999999971	-73.955095	Manhattan	nyc
116	40th & 6th	40th & 6th	40.7535349999999994	-73.9850840000000005	Manhattan	nyc
52	10 Hanover sq	(10 hanover sq|hanover square|hanover sq)	40.7045570000000012	-74.0092199999999991	Manhattan	nyc
17	47th between Park & Lexington	47 ?(th|st)? between ?(lex|lexington|park) ?(n|&) ?(park|lex|lexington)	40.75494384765625	-73.9743881225585938	Manhattan	nyc
117	Kissena Blvd & 64th	kissena blvd & 64th	40.7379226684570312	-73.814727783203125	Queens	nyc
118	W4th St & University Pl	(w)?4th( st) & university( pl)?	40.7295761108398438	-73.996551513671875	Manhattan	nyc
119	48th & Lex	48(th)? & lex	40.7552490234375	-73.9732818603515625	Manhattan	nyc
120	Bedford & N6	bedford & (n)?6 & (n)?7	40.7175636291503906	-73.9580230712890625	Brooklyn	nyc
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mca
--

SELECT pg_catalog.setval('locations_id_seq', 120, true);


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: mca
--

COPY messages (id, message, date) FROM stdin;
1	  <b>Trucks added:</b><br>\n<a href="/truck/kaya">Kaya NYC</a><br>\n<a href="/truck/kettlecorn">Kettle Corn NYC</a><br>\n<b>Trucks Removed:</b><br>\nSteaks N Crepes<br>	1440441977
2	  <b>Trucks added:</b><br>\n<a href="/truck/jollyfatpig">Jolly Fat Pig</a><br>\n<a href="/truck/cachapas">Cachapas on Wheels</a><br>\n<b>Trucks Removed:</b><br>\nMoo Shu<br>\nTaipan Fusion Express<br>	1445999991
\.


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mca
--

SELECT pg_catalog.setval('messages_id_seq', 2, true);


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
5	(bway|bdwy)	broadway
21	!	
22	thst	
23	(\\(|\\))	
16	( ave | av | avenue )	 
7	(btwen|btween|b & (w|t)|b\\/w|btwn|btw|bw|bet |in between)	between
\.


--
-- Name: subs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mca
--

SELECT pg_catalog.setval('subs_id_seq', 23, true);


--
-- Data for Name: trucks; Type: TABLE DATA; Schema: public; Owner: mca
--

COPY trucks (id, name, twitname, weburl, tweet, retweeted, lasttweet, lastupdate, type, about, foursquare, matcher, loc, matchmethod, site) FROM stdin;
miamifood	Miami Food Machine	miamimachinenyc	http://www.miamifoodmachinenyc.com/	RT @YouGotSmoked: Park Ave btw 33rd St and 32nd St from 11:00 to 3:00 today! New York Aged Cheddar Mac and Cheese! Delicious nyc http://t...	t	1437478937	1389964561	Mexican		514b53aee4b00c3e98ec25e9	\N	\N	\N	nyc
dels	Del's	delsnyc	http://instagram.com/delsnyc	We apologize for being MIA the past 2 days. We've been preparing for the hottest day of the week! Come find us at 21st & 5th Ave until 4pm	f	1435693089	1409149941	Sweets		519bb56b498ed2dfa950ace2	\N	\N	\N	nyc
seoul	Seoul Food	seoulfoodnyc	http://www.seoulfoodnyc.com	Come to 51st street, between Park and Madison - it's lunch time!!	f	1392220033	1392220033	Asian		4e74afad88775d593d9a7eb5	\N	\N	\N	nyc
wafelMomma	Wafels & Dinges Momma	waffletruck	http://www.wafelsanddinges.com/	Serving Grand Central with big Kastaar at E 40th Street and Park Ave New York From 8:30AM-4:00PM dingesforeveryone https://t.co/NMGJ6xth4u	f	1446314517	1446206710	Belgian		4a416369f964a52036a51fe3	momma	9	before	nyc
craffels	Craffles	crafflesnyc	http://www.craffles.com/	Happy holidays!!!\nMake ur holidays sweet with our delicious crepe or waffles. Our location for today. Hunter college and union square.	f	1421616846	1388428190	Crepes		514e426ce4b05bcb261d910e	\N	\N	\N	nyc
shadydawg	Shady Dawg	shadydawgnyc	http://www.shadydawg.com/	\N	\N	\N	0	American	\N	536e77ea498e8b0d31167218	\N	\N	\N	nyc
vspot	Hit your V Spot	hityourvspot	https://www.facebook.com/VSPOT.TRUCK	47th and Park from 11:15am to 2:30pm !!	f	1412066274	1412066274	Vietnamese	\N	53c9479b498e2dfa7e205ff0	\N	\N	\N	nyc
cinnamonsnail	The Cinnamon Snail	veganlunchtruck	http://www.cinnamonsnail.com/	Parked on 55th/Broadway 9:00-3:00\n*Please read note at the bottom of this post. \n\nHabanero apricot grilled tempeh... http://t.co/9ifeS1tevk	f	1446233190	1425044750	Vegan		4c263af6a852c9287537e66c	1	28	two	nyc
kettlecorn	Kettle Corn NYC	kettlecornnyc	http://www.kettlecornnyc.com/home.php	Good Morning Happy Friday \nWe are located at\n40th street and 6th avenue \nUntil 3:30 pm\nkettlecornnyc https://t.co/MXKRa5djcA	\N	1446323767	1446214181	Popcorn				116		nyc
schnitzel	Schnitzel & Things	schnitznthings	http://schnitzelandthings.com	Hi everybody!!the truck will be on 47 street and park today,,see you soon!	f	1422645854	1441295198	German		4a6640b3f964a5204cc81fe3	(schnitztruck|the truck)	16	contains	nyc
mamak	Mamak	lovemamak	http://www.lovemamak.com/	hey guys we are @smorgasburg pier 2 @BrooklynBridge_  come come come! http://t.co/llBP6I0uKb	f	1441989988	1410708157	Asian		51c4cffa498ec876f564a0b4	\N	\N	\N	nyc
milktruck	Milk Truck	milktrucknyc	http://www.milktrucknyc.com	Good morning Milk Truckers! Bessie will be at Wall St. and William today. Please call 646-504-6455 for pre-orders! Thx	f	1446315921	1446211807	American		4e823c0229c2dbb2b7043972	\N	41	\N	nyc
blend	Blend	blend_express	http://blen02.wix.com/blendnyc	Happy Halloween.   47th and park we here.	f	1421948094	1414774175	Latin Fusion		4fa94528e4b0f8fbf13317e6	\N	16	\N	nyc
cachapas	Cachaps on Wheels	cachapasbk	http://www.cachapasymasnyc.com/	\N	\N	\N	\N	Venezuelan		55b5ad46498e0739f54fcfd5		\N		nyc
grillwheels	Grill On Wheels	grillonwheelsny	#	GOOD MORNING NYC WHAT A BEAUTIFUL DAY TO GO OUT AND GET LUNCH AT HANOVER SQUARE!!!	f	1439939979	1437058212	Kosher		51b0bf31498e9b68db75612c	\N	52	\N	nyc
getstuffed	Momos & Buns	getstuffednow	http://www.chinesemirch.com	RT @GovIslandFood: 1/3. Only a few more days till Gov Island gourmet food market powered by @livefastgroup opens for the summer. @Getstuffe...	t	1408198481	1400698983	Chinese Fusion		4fa016cbe4b05d0fc11262c5	\N	\N	\N	nyc
papayakingtruck	Papaya King	papayakingtruck	https://www.facebook.com/papayaking	It's NationalHotDogDay and we are in Metrotech today - @DowntownBklyn http://t.co/BRqMvfs7k4	f	1445632304	1437661715	American		50952bd2e4b03898afd23fe3		76		nyc
mexicue	Mexicue	mexicue	http://mexicueny.com	Eating these sliders under an umbrella is like movie make-out scenes under waterfalls. \n\nCome get em at MadSqEats http://t.co/VxW4aWmiwh	f	1446052398	1410639912	Mexican		4c51a6a71c67ef3ba6b61ab9	\N	\N	\N	nyc
coneyshack	Coney Shack	coneyshack		Round 2 ,Midtown 48th st and 6 avenue 11:30 - 3pm !!	\N	1446310402	1446216696	Asian		524b2983498e0f789f2804cb		18		nyc
mexicoblvd	Mexico Blvd.	mexicoblvd	http://mexicoblvd.com	Buenos dias DUMBO! Enjoy your lunch @MexicoBlvd @dumbolot	f	1446323029	1445872775	Mexican		4f4e55aee4b04c96fba5b149	\N	54	\N	nyc
frites	Frites 'N Meats	fritesnmeats	http://www.fritesnmeats.com/	Lunch 2day @ 7 Hanover sq b/t water & broad st. Burger of the week THE TEXAN. Preorder 9172929226 fidi	f	1446305345	1446212894	American	This is a good burger but this truck is interesting because of the many toppings they carry and their burger of the week. 	4ae9d217f964a520bcb621e3	\N	53	\N	nyc
freshhearty	Fresh and Hearty	freshandhearty	http://freshandheartynyc.com/	Get your Soup & Panini on with Fresh and Hearty! We parked on 46st btw 5th & 6th ave from 11am to 3pm. Call now 4 free delivery! @3474402467	f	1395241942	1390493878	Soup/Salad/Sandwich		51801f7a90e7374e46b6239f	\N	\N	\N	nyc
andysitalianice	Andy's Italian Ice	andysitalianice	http://andysitalianicesnyc.com/	Sorry we couldn't find a spot on 47th and Park we are on 52nd and 6th Ave  @nycfoodtruck	f	1445093375	1442853772	Dessert	\N	4df26c2bae609e69dd95d2fc	\N	16	\N	nyc
eddiespizza	Eddie's Pizza	eddiespizzany	http://www.eddiespizzany.com/	Lunch today on 55th and broadway!	f	1446223240	1442406349	Pizza		4c0cf412b4c6d13ae4850c30	\N	28	\N	nyc
shuka	Shuka Truck	shukanyc	https://www.facebook.com/ShukaTruckNYC	HAPPY HALLOWEEN Change of plans- Because of parking problems the SHUKA TRUCK WILL BE PARKED ON 21st St & 5th AV !	\N	1446132209	1446218356	Israeli	\N	546a5011498e0e047a243f37	\N	96	\N	nyc
lobsterjoint	Lobster Joint	lobsterrolling	http://www.lobsterjoint.com/food_truck.html	On York Avenue between 70th & 71st street , enjoy a New England Lobster roll as you relax on your break !	\N	1444254231	1444317951	Seafood		552d5dcd498edeb4d817ef9a		32		nyc
neapolitan	Neapolitan Express	neaexpress	http://neapolitanexpress.com/	Today's vibes in Union Square-giving out free pizza Photo credits to: @theknowitallsnyc http://t.co/nzSfoHgK5R http://t.co/fldgxWqryY	f	1446310927	1444951699	Pizza		51c8864c498e0ac96c14433e	\N	37	\N	nyc
nuchas	Nuchas	nuchasnyc	http://www.nuchas.com	Come catch some Nuchas at our truck! This week's schedule (10/12-10/18):\nMonday: Varick & Charlton for lunch,... http://t.co/7wcdF7O94p	f	1445999069	1444620572	Mexican		4ebd2a9bb8f7b504a754c130	\N	82	\N	nyc
elpaso	El Paso Truck	elpasotruck	http://elpasony.com/	Today we are at @Columbia between W 115th & W 116st. Stop by and get your tacos, burritos, quesadillas yummy  tacotruck FoodTruckfriday	f	1425157921	1412955921	Mexican	\N	523c911f04937624937304c5	\N	36	\N	nyc
mausam	Mausam	mausamnyc	http://www.mausamnyc.com	@UptownLunch York Avenue between 70th & 71 Street delicious Indian curries & bites http://t.co/CXr7MJL625	f	1444940799	1444830394	Indian		50730eebe4b0f3224431dc5d	\N	32	\N	nyc
mamasheros	Mamas Heros	mamasheros		Water St and Hanover sq today across the street from our usual Thursday spot at old slip come and get it before the rain gets here lol	\N	1445353079	1446136002	Sandwitches		5564a8c5498efbaa697c9fb9		42		nyc
phils3	Phil's Steaks	philssteaks	http://www.philssteaks.com	It's the phinal Phil's Phriday of 2015! The Jawn is on 51st and Park 11-2. Don't miss your last chance to get your Phil!	f	1446234849	1446217317	American		4f15b382e4b0725660ea9f31	\N	24	\N	nyc
snowday	Snowday	snowdaytruck	http://snowdayfoodtruck.com/	DUMBO ARE YOU READY FOR THE VENDY @vendyawards CUP WINNER?? Coming your way for lunch today 11:30-3pm @dumbolot @DUMBOBID @Etsy @WeWork	f	1446125162	1444233233	Comfort	\N	533ddd4a498e774b8250a69b	\N	54	\N	nyc
crepestruck	Crepes Truck	thecrepestruck	https://www.facebook.com/thecrepestruck	Come ceck out the Brazzers promo truck in Time Square 48 & 7 ave today till 4pm. http://t.co/wUDdRIZpAh	f	1433610398	1406998102	Crepes		4dfb854918386e743d9869e3	\N	\N	\N	nyc
camion	Camion	camionnyc	http://www.camionnyc.com/	TGIFryday 56th & Broadway 2 special's to finish the week right chipotle falafel & chorizo tacos &... https://t.co/TfS8zOXwkb	\N	1446227038	1446219057	Mexican		53eced53498ea98fb8a770e4		29		nyc
mrnice	Mr Nice Guy	mrniceguytruck	http://mrniceguynyc.com	71st and york... it's friday	f	1414424434	1414687317	American		520bbbb211d26afae232ec59	\N	33	\N	nyc
paris	Paris Sandwich	parissandwich	http://www.parissandwiches.com/	Last day in dumbo today on fronts and Adams @ 11:30 @DUMBOFoodTrucks	f	1444221878	1414764931	French/Vietnamese		519e4ed0498e4f27e64c177a	\N	75	\N	nyc
funbuns	Fun Buns	funbunsnyc	http://j24f.com/funbuns/	Last day to get your favorite buns this year at 50th st between 6 / 7 ave midtown Happy Halloween everyone	f	1419358370	1414768000	Asian		4f8d9663e4b021137aa2bdde	\N	22	\N	nyc
shanghai	Shanghai Sogo	shanghaisogo	http://www.shanghaisogo.com/	Happy Halloween. TGIFriday !! We r serving at water and Hanover sq!! ( 10 Hanover square ) come & get some. 11~3pm. http://t.co/VBdd8zsVAK	f	1442934324	1414769059	Asian		5258369d498e13def2bef2cb	\N	42	\N	nyc
jollyfatpig	Jolly Fat Pig	jolly_fat_pig		Our loaded sides option is seriously loaded ! crispy chicharron with tostones Old slip and water street until 3 https://t.co/bMVUElnAQM	\N	1446241657	1446219311	Latin Fusion BBQ		55ad21eb498e7e5b46049696		44		nyc
chefsamir	Comme Ci, Comme Ca	chefsamirtruck	http://www.chefsamirtruck.com	We are at the corner of 55st and Broadway!	f	1444777535	1446220234	Moroccan		4c3c85e3a9509c74b52e395b	\N	28	\N	nyc
steelcart	The Steel Cart	thesteelcart	http://www.thesteelcart.com/	Makin a grand finale on Front & Jay! Stick it to the weatherman with a toasted sandwich & grits. Soup today is Rustic Chicken Noodle.	f	1436887174	1419950738	French		511d3abee4b0e188895f3697	\N	56	\N	nyc
sweetchili	Sweet Chili	sweetchilinyc	http://sweetchilinyc.com/	humpdaymotivation is on broadway btw houston & bleeker till 3! rainraingoaway dont worry we are under an awning! staydry pre order !!!	f	1446132357	1446046369	Asian		51a8c802498e2165ca855a19	\N	102	\N	nyc
mactruck	MacTruck	mactruckny	http://MacTruckNYC.com	Good morning 47st!!! Between park and lex last truck on the block caboose	f	1445808774	1432730877	American	Looking to take a nap after lunch? This truck is great and the owner is incredibly friendly. Feel free to chat it up while you watch him prepare your food.  Not listed on the menu are the many condiments\\n you can get on your macaroni. The regular size is a good portion for a normal lunch.	50575ab8e4b04ed4f2197dac	\N	17	\N	nyc
toastmonster	Toast Monster	toastmonsternyc	http://www.toastmonsternyc.com/	Toast Monster @UrbanSpaceNYC @GarmentDstrctNY till October 17. On Broadway between 40th and 39th st.	f	1428680926	1411270224	American		50ad1829e4b087613d696bc4	\N	\N	\N	nyc
latinkitchennyc	Latin Kitchen	latinkitchennyc	http://www.latinkitchennyc.com/	HAPPY HALLOWEEN ! ! TODAY OUR LAST FRI OF 2014 ..THANK YOU WALLSTREET! !\nLOCATION 55 WATER ST (SIDE OF OLD SLIP) NYC http://t.co/RWCtK9bCEc	f	1446309164	1414768415	Mexican	\N	53878518498ef00115dbdea1	\N	73	\N	nyc
gorilla2	Gorilla Cheese 2	gcnyc1	http://t.co/4ZDqfwSH5f	G1 Hudson / king \nG2 corporate lunch for tricostalny @ 37/6\nComeToTheCheeseYo	f	1446047445	1446217602	American		4dc2d3e352b1c1fb37f1e945	g2	39	before	nyc
carls	Carl's Steaks	carlssteaks	http://carlssteaks.com/home/	Scream it from the rooftops it's CHEESESTEAK FRIDAY folks! BIG CARL - 56TH ST / Bdwy @randomfoodtruck... https://t.co/DT7ODaqcum	f	1446311138	1446214421	American		51a78330498e3fc1f22d771e	\N	29	\N	nyc
mamuthai	Mamu Thai Noodle	mamuthainoodle	https://www.facebook.com/MamuThaiNoodle	17th & 5th. We're here for your noodle needs! Get some hot off the wok Thai noodles! mamuthai	f	1446318876	1445274513	Thai		5126a10ae4b0af674c85f353	\N	86	\N	nyc
pontirossi	Ponti Rossi	pontirossifood	http://www.pontirossifood.com/	@dumbolot we there too subbing for sweet chili	f	1446322757	1441720926	Italian	\N	542d78f4498ee5493e1a8989	\N	54	\N	nyc
kimchitaco	Kimchi Taco	kimchitruck	http://kimchitacotruck.com/	You made it to the end of the week! Treat yo'self w/ some tacos. 52nd & 6th, 11:30 - 2:30	f	1446205205	1446215808	Korean Fusion		4d6ee122b45b59417c6a6778	\N	25	\N	nyc
bobjo	BobJo	bobjotruck	http://www.bobjo.net	Good morning we r open at king and hudson. Try our Korean BBQ -Beef pork shrimp and burritos . And we hav also veggie dumpling,tofu bowl thx	f	1442850238	1443628196	\N		4e3add0c88772c3bf12772da	\N	39	\N	nyc
eggstrav	eggstravaganza	etravaganza	http://www.eggstravaganzany.com/	Good morning \nlet's put a smile lots of energy and a delicious earthy breakfast,\nJoin us.the truck @ North east 52nd and Park.	\N	1445962069	1445256684	Mexican	\N	4b15165ef964a52049a823e3	\N	72	\N	nyc
mtblls	Mtblls	mtblls		TGIF MTBLL LOVERS!  Stroll on by 50th bet 6&7 Aves for your weekend fix. The  will be waiting 	f	1440364380	1440168472	Italian	\N	504fb7fde4b0bc88c3a6b614	\N	22	\N	nyc
schnitzelcart	Schnitzel & Things Cart	schnitznthings	http://schnitzelandthings.com	It's Schnitzel time.  The cart will be on 27th & Park serving up your favorite lunch!	f	1431702487	1426694447	German	\N	4a6640b3f964a5204cc81fe3	(schnitzcart|the cart)	71	contains	nyc
kaya	Kaya NYC	kayanyc28	http://www.kayanyc28.com/	w50th and 6th. Catch us for the last day of this week midtown eateries	\N	1444836849	1446219002	Chinese		54342678498e669166a9d82c		108		nyc
morris	Morris Grilled Cheese	morristruck	http://morrisgrilledcheese.com/	Happy Thursday! @DowntownBklyn Metrotech Commons 11-3, come lunch with us!	f	1443193536	1442502360	American		4e0e0b3caeb7a5b33ee5dac1	\N	76	\N	nyc
hh2	Habachi Heaven 2	hibachiheaven	http://www.hibachiheaven.com/	Open and ready to roll corner of Varick and King	f	1428064651	1423759572	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	1	38	two	nyc
yankeedd	Yankee Doodle Dandy's	usafoodtruck		Midtown---were at 46th in between 5th and 6th with the chicken tenders you need to start the Halloween weekend off right! 11-3 nycfood usa	f	1446261975	1446217654	American	\N	52b497e1498eed13ead2b84c	\N	14	\N	nyc
dubpies	DUB Pies	dubpies	http://www.dubpies.com/	PieTruck is @DumboLot 11am - 2.30pm Savorypie flatwhites dumbo	f	1446314695	1445868119	New Zealand meat pies	\N	4eb825a62c5b53141b78bfb6	\N	54	\N	nyc
korilla	Korilla BBQ	korillabbq	http://korillabbq.com	Midtown!!! Find us today @48th & Lex ready by 12!	f	1446231261	1446219975	Korean Fusion		4cc701aa01fb236ab070baba	\N	119	\N	nyc
sweetery	Sweetery	sweeterynyc	http://sweeterynyc.com	Come to Hudson/King St 4 ur FREE cup of exceptional coffee & a sidekick treat, a croissant w/Nutella, could this be the best part of ur day?	f	1446232214	1443706721	Sweets		4a28d919f964a52056951fe3	\N	39	\N	nyc
bigds	Big D's	bigdsgrub	http://bigdsgrub.com/	Ditch the desk and join us for lunch. 50th Street btwn 6th and 7th Avenue https://t.co/toaeBMPBNb	f	1446132762	1446210207	Korean Fusion		4c968b907605199c2eaec2a3	\N	22	\N	nyc
chipsy	Chipsy King	chipsykingny	http://chipsykingny.com/	Kasar truck is at 46th and 6th avenue until 7pm	f	1437241508	1436448508	Fries		51bb5c43498ee06e13d0d31f	\N	13	\N	nyc
toum	Toum NYC	toumnyc	https://www.facebook.com/ToumNYC	FalafelFriday is the best way to kick off the weekend! Join us in FIDI on Old Slip btwn Water & Front St until 3pm https://t.co/pdJN2n5VT1	f	1445448040	1446207545	Lebanese		500eedb0e4b062ee00577957	\N	68	\N	nyc
schnitzi	Schnitzi	schnitzi1	http://www.schnitzi.com/	Today we will serve lunch @33 St bet 8&9 Ave from 11:30-3:30 B&H old loading dock, order online @www.schnitzi.com schnitzitruck schnitzel	\N	1446129408	1446125457	German	\N	532b25ed498eb8b1844dc14f	\N	111	\N	nyc
shortys	Shortys	shortysnyc	http://www.shortysnyc.com	Up and running at SouthStreetSeaport South and Fulton Streets Cheesesteak ChickenCheesesteak RoastPork... http://t.co/awyzKOzJqw	f	1446325895	1415982867	American		4faea2cce4b08a88c5dc5d05	\N	58	\N	nyc
palenque	Palenque	palenquefood	http://www.palenquehomemadecolombianfood.com	RT @KristinaMongan: @Palenquefood TY4my 1st eva Arepa! So friendly &delicious! BwayBites muy bueno! NomNom whatsnext vivacolumbia http...	f	1445963159	1434670346	Colombian Fusion		4e84f424dab45bbd2617dc62	\N	36	\N	nyc
lobstertruck	Red Hook Lobster	lobstertruckny	http://redhooklobster.com/	Never too late for a little lobsterlunch. BigRed is serving em up on 46th and 6th! https://t.co/GgitIIblB4	f	1446220993	1445621340	\N		4dc597c57d8b14fb462ed076	\N	13	\N	nyc
pocketful	The Pocketful	thepocketful	http://thepocketful.com/	Our cart is back on 50th between 6th and 7th. Enjoy the sunshine!	f	1446222982	1430145608	Mediterranean		4db8bcd790a0e3f61d601888	\N	22	\N	nyc
lukeslobster	Luke's Lobster	nautimobile	http://lukeslobster.com/	This is it, our last day on the streets of NYC. 17th st and 5th ave. So long, farewell, see ya when we see ya.	f	1445179927	1430398345	Seafood		4dc81239b0fb5556cd2f3023	\N	86	\N	nyc
greenradish	The Green Radish	thegreenradish1	http://www.thegreenradish.com/	Good Day to GetNaked NakedBeanBurgers 47th between Park and Lexington https://t.co/4ou7IczI7R	f	1446308364	1432902203	Vegan		5229feab11d2edde794d385c	\N	17	\N	nyc
taim	Taim Mobile	taimmobile	http://www.taimmobile.com/	We're on Vandam and Varick today serving some fresh and delicious falafel and smoothies!	f	1446314968	1446128472	Mediterranean		4cf2c5321d18a143951b5cec	\N	80	\N	nyc
treats	The Treats Truck	thetreatstruck	http://www.treatstruck.com	!!! Fri, Oct 30 11:30-3pm 45th st & 6th ave!!! Halloween treats & lots more! Happy Halloween weekend !!!	f	1446305698	1446214832	Sweets		49e65021f964a52035641fe3	\N	12	\N	nyc
carpedonut	Carpe Donut	carpedonutnyc	http://carpedonutnyc.com/	Truck open at 55th and Broadway. Come!!!	f	1446323696	1446203182	Sweets	They only server one kind of donut here, the apple cider, but it's a pretty good one. They are fresh and still hot when you get them. They have donut ice cream sandwiches but you should know the entire thing is in the freezer so you will get a frozen donut as well.	5169892c498e0522481eea97	\N	28	\N	nyc
valduccis	Valduccis	valduccis	http://valduccis.com	RT @greenboxny: RT @Valduccis: The slices are red-hot 51st St. and Park @greenboxny @FoodtoEat @Foodtruckstars_ ... http://t.co/QCZzt1RZnq	f	1446197621	1434247434	Pizza		4df7e1aad4c02ad734170b21	\N	24	\N	nyc
souvlaki	Souvlaki GR	souvlakitruck	http://www.souvlakigr.com/	@davidbourgeois Missing 46th, were on 55/Broadway today with a little taste of Mykonos needgr @randomfoodtruck	\N	1446060339	1443455372	Greek	\N	4c75c2908d70b713d5dcdaad	\N	28	\N	nyc
biandang	Bian Dang	biandangnyc	http://www.biandangnyc.com/	LAST DAY FOR BIANDANG! It's been a pleasure serving you New York, catch us on 53rd & Park for the last day of the season!	f	1446228341	1446213252	Taiwanese		4d712874722ef04d04160d9c	\N	26	\N	nyc
domo	Domo Taco	domotaco	http://www.domotaco.com	Sorry for last week but the truck is back in FiDi on the north side of Old Slip & Water today!	f	1445967543	1446213317	Asian Fusion		4ed90a2e77c8274efb746d83	\N	44	\N	nyc
langos	Langos	langostruck	http://www.langostruck.com/	hi \nLangos Truck @Fidi\nWater St & Old Slip\n11-2:30pm\n\nThursday 52st/6Ave \n\nif you don't know Mangalitsa take look http://t.co/JFRV2ZJRmb	f	1445781349	1442412236	Hungarian	\N	537a883c498eb7fac064409f	\N	51	\N	nyc
brooklynpopcorn	Brooklyn Popcorn	brooklynpopcorn	http://brooklynpopcorn.com/	Good afternoon NYC hope everyone is enjoying their beautiful Wednesday! We are looking forward to seeing you on Hudson & King Street :)	f	1441152871	1434567787	Popcorn!		514a0737e4b09c3e77279d83	\N	39	\N	nyc
gorilla1	Gorilla Cheese 1	gcnyc1	http://www.gorillacheesenyc.com/	G1 Hudson / king \nG2 corporate lunch for tricostalny @ 37/6\nComeToTheCheeseYo	f	1446047445	1446217602	American		4dc2d3e352b1c1fb37f1e945	g1	39	before	nyc
disos	DiSO's	disosnyc	http://www.disosnyc.com/	Disos Thursday lunch- 47th bet park and lex.\n\nCall in orders to: 917-756-4145\n\nSPECIAL: meatball parm	f	1446212117	1446127731	Italian Sandwiches	These might be typical italian sandwiches but the ingredients are high quality. You need to get there early because the line can get long and they will run out of some breads. I believe the focaccia half is a normal portion for lunch while their half and hero sizes are pretty big.	519523d6498eeaa6200aad03	\N	17	\N	nyc
wafelKastaar	Wafels & Dinges Kastaar	waffletruck	http://www.wafelsanddinges.com/	Serving Grand Central with big Kastaar at E 40th Street and Park Ave New York From 8:30AM-4:00PM dingesforeveryone https://t.co/NMGJ6xth4u	f	1446314517	1446206710	Belgian		4a416369f964a52036a51fe3	kastaar	9	before	nyc
polish	Old Traditional Polish Cuisine	polishcuisine	https://www.facebook.com/pages/Old-Traditional-Polish-Cuisine/315496671902708	Find us on 52nd bw 6th & 7th today Happy Friday NYC midtown lunch	f	1446324321	1446223248	Polish		51435df4e4b0823a398ebc8a	\N	61	\N	nyc
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
FriendsofLibertyPark (@LibertyParkNJ) posted a photo on Twitter https://t.co/MayNFW56Xb	1446199998	660036749989699584	f	thegreenradish1
Get some Green Radish:\nSATURDAY at Montclair Farmers' Market 11-2\nSUNDAY at Liberty State Park for Savelsp with... https://t.co/OUnbCnLUaa	1446172709	659922289862029312	f	thegreenradish1
RT @VisualEcon: eating a feast tonight courtesy of @thegreenradish1 in JerseyCity https://t.co/mPeDVwd68l	1446162185	659878148255911937	f	thegreenradish1
FollowUs2 @thegreenradish1 columbus&hudson till 8pm BBQ BlackBean Burgers Baked Fries ChocPeanut BtterTart @jc_eats https://t.co/NdPoPq2npi	1446158715	659863594587324416	f	thegreenradish1
Go Green Radish!  Thanks to Manny and Ashley for the cool artwork..... GetRad EatPlants https://t.co/xFNKKTDJsm	1446143718	659800692455030784	f	thegreenradish1
NYCs 10 Best Vegetarian And Vegan Restaurants https://t.co/7RV6UmZSfz via @CultureTrip	1446142826	659796953488711680	f	thegreenradish1
Dinner Tonight on Columbus and Marin, JerseyCity Style...5-8pm\nBBQ Black Bean Burgers, Baked Rosemary Fries,... https://t.co/DO1ANRaHqU	1446142662	659796263957889024	f	thegreenradish1
NYCs 10 Best Vegetarian And Vegan Restaurants https://t.co/QrrC3VhUi4	1446142271	659794624119222273	f	thegreenradish1
GetRad Sunday support Savelsp friendsoflibertystatepark's photo https://t.co/EuPn8gaNec	1446096789	659603859094966272	f	thegreenradish1
RT @ChoppingBlockFT: Come out and support!! SAVELSP @jc_eats @RNA_JCHeights @thegreenradish1 @jerseyjournal @gcvv @jcindependent  https://...	1446048261	659400317990141953	f	thegreenradish1
RT @VeganNewsNet: Meats Cause Cancer https://t.co/aaghwWZ396 Farming & fast food industries going Plant-Based? AnAg Farm365 Vegan https:...	1445868984	658648374384553984	f	thegreenradish1
Bacon Out, Veggies In! https://t.co/rWrhroxrCX	1445866629	658638499076317184	f	thegreenradish1
RT @LibertyParkNJ: Vegans & vegetarians will eat well at https://t.co/VvCVaAkJSC Protest Sun. Nov. 1st w/ @thegreenradish1 SaveLSP https...	1445818151	658435165593559040	f	thegreenradish1
RT @ChoppingBlockFT: Save th Date Nov1 SAVELIBERTYSTATEPARK EVENT, live music, @ChoppingBlockFT @thegreenradish1 JCFOODTRUCKS @jc_eats @R...	1445800791	658362354845937664	f	thegreenradish1
Got Lunch? We're here for you, Montclair with our friends @yogicchai @taqueriAutentic @BlackTieFF @MontFarmersMrkt https://t.co/gLGYGwRQh8	1445703781	657955462743224320	f	thegreenradish1
Good Day for a Combo at The Green Radish today at Montclair Farmers' Market 11-2pm... save room for the... https://t.co/N7GwMiIS6w	1445683030	657868426451378176	f	thegreenradish1
Dinner at the Rock @PruCenter with  @theAngryCrabNJ @Aroy_D @mmgfoodtruck Eatwell Newark Keep Trucking @NJFTA https://t.co/AjOHFZvSAn	1445629062	657642069670916096	f	thegreenradish1
Baked FryDay thegreenradish EatPlants Vegan plantbased jerseycity montclair https://t.co/uVe1PsRIWT	1445618357	657597169009086464	f	thegreenradish1
Baked FryDay @thegreenradish1 @jc_eats @NJFTA JCMakeItYours @MayorFulop vegan plantbased https://t.co/Yq0791FqVz	1445618085	657596030612021248	f	thegreenradish1
Lunch Today at @MackCaliProp Hudson&Columbus JerseyCity with @thegreenradish1 @theAngryCrabNJ and @Aroy_D @jc_eats eatwell @MayorFulop	1445616904	657591073456443395	f	thegreenradish1
Disos will be off the street today.. Back next week	1446212117	660087579950362624	f	disosnyc
Disos Thursday lunch- 47th bet park and lex.\n\nCall in orders to: 917-756-4145\n\nSPECIAL: meatball parm	1446127731	659733640021020672	f	disosnyc
Disos lunch today posted on water and old slip. FIDI\n\nCall in orders to: 917-756-4145	1446041892	659373605390852096	f	disosnyc
Lunch today 48th bet 6 and 7 Ave \n\nCall in orders for pick up: 917-756-4145	1445954122	659005472356237312	f	disosnyc
Monday lunch.. 47th bet park and lex.\n\nCall in orders: 917-756-4145\n\nSPECIAL TODAY: Disos meatball parm	1445868905	658648042577502208	f	disosnyc
Open for lunch.. 46th bet 5 and 6 ave\n\nCall in orders: 917-756-4145	1445616381	657588882427408385	f	disosnyc
@justin_cohen sorry man, they're sold out	1445609371	657559479127511040	f	disosnyc
Diso Fridays @ 46th bet 5 and 6 ave\n\nCall in orders: 917-756-4145	1445609144	657558526294925313	f	disosnyc
Disos water and old slip today.\n\nCall in orders to: 917-756-4145	1445522025	657193124415053824	f	disosnyc
@daviebhoy25 haha! They closed off the streets ther today cause of a bs movie shoot. Why don't u be a sport next time and hold a spot for us	1445450222	656891960599408640	f	disosnyc
Get your Disos fill today 47th bet park and lex.. We will be at a different location tomorrow..\n\nCall in orders;... https://t.co/edeUU2f3nP	1445441938	656857215328915456	f	disosnyc
Lunch today 47th bet park and lex..\n\nSPECIAL: Disos the infamous meatball parm on the menu today\n\nCall in orders to: 917-756-4145	1445436605	656834848116625408	f	disosnyc
**Change of location for Wednesday  lunch: 47th bet park and Lexington \n\nSPECIAL: Disos meatball parm***	1445397540	656670997311938560	f	disosnyc
@justin_cohen Fridays a long ways away my man.. U know it's prob unlikely lol	1445360128	656514077909524480	f	disosnyc
Society is open for sit downs. 48th bet 6 and 7 ave.\n\nSPECIAL: Disos meatball parm. \n\nCall in orders: 917-756-4145	1445355383	656494177010585601	f	disosnyc
Disos famous meatballs on the menu today	1445351837	656479303635369984	f	disosnyc
Disos slingin sandwiches today on 48th bet 6 and 7 ave.\n\nCall in orders to; 917-756-4145	1445349513	656469557536681984	f	disosnyc
Monday lunch on 47th bet Park and Lex..\n\nCall in orders to: 917-756-4145	1445265648	656117801606754304	f	disosnyc
@ryangeftmangold phone off line today	1445012256	655054996317294592	f	disosnyc
46th bet 5 and 6 ave today\n\nOpen at 11:45	1445007870	655036600691265541	f	disosnyc
@VeganLunchTruck Cooking class with our friend Adam @degustibuscookingschoolNYC. Genial. https://t.co/jg3TkSFt3Y	1445999069	659193990160470016	f	nuchasnyc
Open your way to flavor with the Apple, Cranberry & Nutella empanada MuchasNuchas https://t.co/xJdQGykhbZ	1445977227	659102379229360128	f	nuchasnyc
Come catch some Nuchas at our truck! This week's schedule (10/26-11/1):\nMonday: 91st & Columbus for lunch,... https://t.co/N4zauUObVc	1445878562	658688547143073792	f	nuchasnyc
RT @34thStNYC: .@waffletruck & @NuchasNYC kiosks are open through Fall & Winter! Warm hot chocolate & empanadas on chilly mornings: https:/...	1445543983	657285220857720832	f	nuchasnyc
Glad to be part of this beautiful city! MuchasNuchas NYC empanadas TimesSquareNYC https://t.co/kL1SliOXA6	1445443516	656863832862650370	f	nuchasnyc
Let the feast begin! MuchasNuchas http://t.co/9uWgUOwqSv	1445262852	656106073636515841	f	nuchasnyc
RT @lololashua: when @NuchasNYC is on NYU's campus, you know it's gonna be a good afternoon 	1445007565	655035322414321664	f	nuchasnyc
RT @justinzfromm: Thanks for the deliciousness @NuchasNYC @cooperhewitt	1445007559	655035296262823937	f	nuchasnyc
OPEN! Nuchas truck is located on Broad street & S William street today for lunch! NuchasNYC - http://t.co/BUSHVV1uMV	1444752733	653966480825040896	f	nuchasnyc
OPEN! Nuchas truck open for dinner on Waverly and Broadway! muchasnuchas - http://t.co/BUSHVV1uMV	1444684100	653678610813972480	f	nuchasnyc
Come catch some Nuchas at our truck! This week's schedule (10/12-10/18):\nMonday: Varick & Charlton for lunch,... http://t.co/7wcdF7O94p	1444620572	653412157913063426	f	nuchasnyc
OPEN! NuchasTruck on NYU Stern 44 W 4th Street! MuchasNuchas - http://t.co/BUSHVUJTol	1444317308	652140173807882240	f	nuchasnyc
OPEN! NuchasTruck on E 14th St & 3rd Ave! MuchasNuchas - http://t.co/BUSHVV1uMV	1444247628	651847915825164288	f	nuchasnyc
OPEN! NuchasTruck on 52nd St & 6th Ave until 2:30 PM! MuchasNuchas - http://t.co/BUSHVV1uMV	1444219442	651729695667568640	f	nuchasnyc
OPEN! NuchasTruck on NYU Stern 44 W 4th Street! MuchasNuchas - http://t.co/BUSHVV1uMV	1444159157	651476843183386624	f	nuchasnyc
OPEN! NuchasTruck on Pearl St & Broad St until 2:30 PM! MuchasNuchas - http://t.co/BUSHVV1uMV	1444143833	651412566137286660	f	nuchasnyc
Apple, Cranberry & Nutella is your way to a tasty morning!  MuchasNuchas NYC empanadas TimesSquareNYC http://t.co/qaRaZphiWH	1444140358	651397991803195392	f	nuchasnyc
RT @negromario610: Mira dde llegue, @Toughmantri @NuchasNYC Nueva York, triatlon, buena comida combinacionideal http://t.co/TuvEHcuYQe	1444083015	651157478734893056	f	nuchasnyc
OPEN! NuchasTruck on Varick St & Charlton St! MuchasNuchas - http://t.co/BUSHVV1uMV	1444046842	651005759564738561	f	nuchasnyc
OPEN! NuchasTruck on 67th Street & Broadway! MuchasNuchas - http://t.co/BUSHVUJTol	1443998649	650803624075923456	f	nuchasnyc
RT @FoodieHub: Watch @feistyfoodie take on the Grumpy Gourmet @jonnymarbles with NYC's best Banh Mi at @ParisSandwich: https://t.co/EUBJwEb...	1444221878	651739911373094912	f	parissandwich
@jonnymarbles thank you for the recommendation@feistyfoodie pls feel free to stop by we will be be honored to treat you to homemade cooking!	1443717414	649624036981514240	f	parissandwich
RT @jonnymarbles: Grumpy Gourmet vs @feistyfoodie on this week's ep! We go to chinatown and eat banhmi at @ParisSandwich! Subscribe! http...	1443717297	649623547468382210	f	parissandwich
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
williamsburg bedford ave. and N6th street for tonight only! foodie  pulledpork brisket latin bbq fusion https://t.co/lTCxrl1irW	1446241657	660211477819867136	f	jolly_fat_pig
Our loaded sides option is seriously loaded ! crispy chicharron with tostones Old slip and water street until 3 https://t.co/bMVUElnAQM	1446219311	660117752837971968	f	jolly_fat_pig
love to see people waiting for us to open, just know that we are just as eager to see you 52nd street and 6th Ave https://t.co/Ai6h8qZKbJ	1446136594	659770814561169408	f	jolly_fat_pig
55th street and Broadway  until 3 o clock!	1446050179	659408361960710144	f	jolly_fat_pig
something different but at the same time something that everyone could enjoy and relate too. 46th and 6th Ave. https://t.co/6qDpwV6QZ5	1445961309	659035615959371776	f	jolly_fat_pig
Always with a smile, jollyfatpig Is in the financial district, Hanover square and water street. foodie truecooks https://t.co/bplCNL1YQH	1445874423	658671186449178624	f	jolly_fat_pig
@JEYZUR financial district Hanover square and water street	1445618378	657597256024104960	f	jolly_fat_pig
RT @JEYZUR: @Jolly_Fat_Pig where are you guys at today?	1445618362	657597190416789504	f	jolly_fat_pig
appreciate when our customers take the time to write cool stuff about us. Makes us want to be that much better https://t.co/M7K2rWeKd3	1445616058	657587525930864640	f	jolly_fat_pig
RT @JEYZUR: @Jolly_Fat_Pig I had your food for the first time yesterday and it was awesome.  The sweet potato fries are really good.	1445530815	657229990153617408	f	jolly_fat_pig
@JEYZUR until 3:00 clock thanks for the compliments!	1445530806	657229955919708161	f	jolly_fat_pig
jollyfatpig crew so focused feeling so ready. 52nd and 6th ave. for lunchtime . foodies love the goodvibes https://t.co/UmAp9kUAOC	1445527884	657217699668500480	f	jolly_fat_pig
@smarsmayna @Joynture we are there on Mondays and Friday's!	1445444480	656867878591950848	f	jolly_fat_pig
sirloin steak on a colombian arepa with cheese, and a homemade sauce. On broadway between w55th and w56th https://t.co/ak7XWnaLIa	1445443155	656862320937824257	f	jolly_fat_pig
@gta86 thanks for stopping by	1445364484	656532348612255744	f	jolly_fat_pig
RT @gta86: Just devoured a porkbelly sammich from @Jolly_Fat_Pig one word epic just when I thought it could not get better.. I was proven...	1445364477	656532319927422976	f	jolly_fat_pig
slow cooked bbq brisket. flatiron for  the day 20th street and 5thave . Nyc foodie nycfoodtuck classic https://t.co/yy4qygTQnD	1445356438	656498603645648897	f	jolly_fat_pig
@gta86 we will be on 20th Ave and 5th ave today we open at 11:30	1445349288	656468612862078977	f	jolly_fat_pig
@itsmegnotmeghan we will be on 20th and 5th ave today we open at 11:30	1445349076	656467724177121280	f	jolly_fat_pig
Hanover square and water street in the financialdistrict serving some beautiful sandwiches and much more! http://t.co/Sw0XUsaPg3	1445271516	656142411211677696	f	jolly_fat_pig
Ditch the desk and join us for lunch. 50th Street btwn 6th and 7th Avenue https://t.co/toaeBMPBNb	1446210207	660079570008322048	f	bigdsgrub
Join us for lunch today at Jay/Water Street. DUMBO @dumbolot @DUMBOFoodTrucks @DUMBOBID @hugeinc @ITO_EN https://t.co/02bh2kMzY2	1446210140	660079287454797825	f	bigdsgrub
Try our Grilled Lemongrass Chicken Grinder before its all gone!	1446132762	659754740113391620	f	bigdsgrub
D2 is back at Jay/Water Street in DUMBO for lunch. @dumbolot @DUMBOFoodTrucks @DUMBOBID @hugeinc @ITO_EN https://t.co/lVowwc0kzV	1446124067	659718269599895552	f	bigdsgrub
It's THAT time of the week folks!  50th Street btwn 6th and 7th Avenue. Try our delicious Grilled Lemongrass Chicken https://t.co/IScRHvV8uN	1446123827	659717264430747648	f	bigdsgrub
Call for fast preorder pickup, 646-543-BIGD. Operators are standing by!	1446044298	659383697884491776	f	bigdsgrub
Preorder for pickup, call 646-543-BIGD\nBigD1 - 50th Street btwn 6th and 7th Avenue https://t.co/3yk36P0liu	1446042577	659376479189495808	f	bigdsgrub
D2 is in DUMBO https://t.co/xtsFlipD3w	1446041305	659371143028219904	f	bigdsgrub
D2 is now opened and ready to serve on 50th Street btwn 6th and 7th Avenue. https://t.co/kytlUZligK	1445963424	659044487193317376	f	bigdsgrub
Lunch is ready at 53rd/Park Ave. We also have grilled lemongrass chicken and Thai green curry! https://t.co/AL7FKHs1B7	1445961380	659035911548772352	f	bigdsgrub
Join D2 at 50th Street btwn 6th and 7th Avenue today for lunch https://t.co/J9s5ZQPcwI	1445952865	659000198174261248	f	bigdsgrub
You already know...D1 - 53rd/Park Ave https://t.co/QVZrNoUy5I	1445952241	658997581197000704	f	bigdsgrub
D1 is uptown! https://t.co/7J5SSX0gUS	1445867761	658643246248275968	f	bigdsgrub
D2 is grillin' it up at 53rd/Park Ave today.  Thai & Vietnamese https://t.co/wLzp3D3CCX	1445867712	658643040932929537	f	bigdsgrub
@ORSurgeryNurse Round up the troops and I'll see you for lunch today!	1445861423	658616662443343872	f	bigdsgrub
D2 is grillin' it up in DUMBO. (Jay/Water St). See you for lunch @DUMBOBID https://t.co/B4IAP6Bfnk	1445607082	657549877463879680	f	bigdsgrub
D1 - 50th Street btwn 6th and 7th Avenue.  Come n' try our Grilled Lemongrass Chicken Grinder b4 Big D eats it all! https://t.co/19vDcfW1Zl	1445606848	657548895610732544	f	bigdsgrub
Today's special:\nGrilled Lemongrass Chicken grinder sandwich \nThai Green chicken curry	1445524603	657203938853302272	f	bigdsgrub
D2 has your lunch at 41st. Street btwn 6th and Broadway. See you soon https://t.co/q59OegcHLm	1445520387	657186255114018817	f	bigdsgrub
It's THAT time of the week folks! D1 is grillin' it up at 50th Street btwn 6th and 7th Ave.  Check today's special: https://t.co/GxLDnDd0qd	1445520336	657186041846190080	f	bigdsgrub
RT @steph_sarf: @AndysItalianIce Thanks for the Italian Ice you sent over to @RoamingHunger today! Loved the Oregon Cherry 	1446255369	660268991475286016	f	andysitalianice
RT @KidSpanner: .@AndysItalianIce brought us the best frozen treats today! The salted caramel is incredible.	1446255352	660268921270988800	f	andysitalianice
RT @RoamingHunger: Thanks @AndysItalianIce for shipping us your delicious treats all the way from NYC! HappyHalloween  https://t.co/QipI...	1446255347	660268899787808769	f	andysitalianice
@FrankieMontalvo yes we are!	1445017999	655079084893077505	f	coneyshack
Today we are @MadSqParkNYC serving up coffee, baked goods and smoothies. @nycfoodtruck	1445093375	655395236823375873	f	andysitalianice
@rituvasirema usually on 14th sometimes in front of Staples unfortunately we are off the road for the season.	1444915974	654651161446735874	f	andysitalianice
RT @souvlakitruck: Thanks to @livefastgroup and @centerplate we will be vending @NY_Comic_Con at the @javitscenter! NYCC http://t.co/Z2UPh...	1444361910	652327250000506880	f	andysitalianice
Ice season is almost over  but we are open on 32nd & Park Ave. This is our last week on streets. @nycfoodtruck	1444145280	651418637388095488	f	andysitalianice
Great day at @ToughMudder heading to @ipsy on pier 92 till 3pm @nycfoodtruck	1443977060	650713069501464576	f	andysitalianice
It's @ToughMudder time. In da Bronx we are here for all your coffee and food needs 7AM-12:30PM @nycfoodtruck foodtrucks andysitalianices	1443956236	650625729235939328	f	andysitalianice
Today we are on Pier 92 @ipsy from 10-5 @nycfoodtruck come hang with us.	1443881014	650310224176414720	f	andysitalianice
We are open on 32nd and Park. Come and cool with a fresh Italian ices. 12-5pm @nycfoodtruck @Sexyfoodtrucks @grubstreet @StreetGrubSteve	1443543983	648896613855940608	f	andysitalianice
@WestchesterMed we will be there tomorrow. Special flavor is pumpkin spice. It's really good! @nycfoodtruck	1443144223	647219899182514176	f	andysitalianice
@mamuthainoodle I miss your amazing noodles	1443112165	647085438730158081	f	andysitalianice
Hey icers we are open on 32nd and Park Ave for all your cool down needs. Don't forget about our Pumpkin Spice Italian ice. @nycfoodtruck	1443112064	647085013490601984	f	andysitalianice
RT @RoamingHunger: Fall has arrived! - Four tips for throwing a cozy outdoor Fall party, even in the heat! http://t.co/qJEQJAsEvJ http://t...	1443044610	646802091495792640	f	andysitalianice
Did you try our pumpkin spice Italian ices yet? Come check us out on 40th and 6th Ave.	1443029983	646740740425560064	f	andysitalianice
Nice to have the warm weather back. We are open on 40th and 6th Ave. @nycfoodtruck @grubstreet @Sexyfoodtrucks @randomfoodtruck	1443024892	646719389723660290	f	andysitalianice
Sorry we couldn't find a spot on 47th and Park we are on 52nd and 6th Ave  @nycfoodtruck	1442853772	646001660440018944	f	andysitalianice
Come hangout with us today we are at the @SoWeMusicFest from 11-7. Italianices andysitalianicesnyc @nycfoodtruck @FTFUSA @Sexyfoodtrucks	1442671910	645238877062594560	f	andysitalianice
Sorry for the late start. We are open in Union Square until 8 PM @nycfoodtruck	1442513336	644573768753520641	f	andysitalianice
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
G1 Hudson / king \nG2 corporate lunch for tricostalny @ 37/6\nComeToTheCheeseYo	1446217602	660110586395668480	f	gcnyc1
G1 - 46 5/6 \nG2 - uptown \nComeToTheCheeseYo	1446127774	659733821168988160	f	gcnyc1
G1 - 48/6 @FoxNews \nG2 - 26th 11 / 12 @starretlehigh \nComeToTheCheeseYo	1446047445	659396895530422273	f	gcnyc1
@JennaLaMagna yes , cash only on the truck	1446047019	659395108077477889	f	gcnyc1
G1 -FiDi, Old Slip /Water\nG2 -Soho, Hudson /King \nComeToTheCheeseYo	1445954207	659005828603748352	f	gcnyc1
RT @CarpeDonutNYC: Omg it's a food a palooza!! Come visit the trucks @prospect_park so much delicious: @kimchitruck @philssteaks @taimmobil...	1445718478	658017106861162496	f	gcnyc1
G1 @Pier_13Hoboken \nG2 @prospect_park neathermeade foodtrucks \nHalloween \nComeToTheCheeseYo \n@DispatchNY \n@AndysItalianIce &10 others	1445702617	657950582213357572	f	gcnyc1
@woldchar usually  not on Fridays,  but we were for a tiny bit between events	1445700211	657940490092941313	f	gcnyc1
G1 Hudson / king \nG2 46th 5/6\nComeToTheCheeseYo	1445608899	657557501139886080	f	gcnyc1
G1 - @QueensCollege by the Q Cafe\nG2- private catering @HighLineHotel \nComeToTheCheeseYo	1445528729	657221240768344064	f	gcnyc1
@cerviqus sorry missed you yesterday. ..	1445439929	656848788934537216	f	gcnyc1
G1 -@QueensCollege w/ @LaBellaTorte   Kissina/65\nG2 - 26th 11 / 12 @starretlehigh \nComeToTheCheeseYo https://t.co/GDVHeO3waK	1445439876	656848565239705600	f	gcnyc1
G1 - scheduled maintenance \nG2 - @QueensCollege \nComeToTheCheeseYo	1445279834	656177303412736000	f	gcnyc1
We r Rockin the Cheese tonight foodtruckmashup\nComeToTheCheeseYo	1445118922	655502385914236929	f	gcnyc1
RT @BrookeSassman: Here at the foodtruckmashup for another episode of trucktales! Have a favorite truck? Tweet me! @TODAYshow  http:...	1445118769	655501746203140096	f	gcnyc1
RT @ExposureNJ: Foodtruckmashup @foodtrucksin @FoodDudeNJ @njisntboring @NjFoods @4foodnyc @EaterNY @TheRecordNJ @TheMeadowlands http://t....	1445111115	655469644350926848	f	gcnyc1
G1 46 5/6\nG2 47/park\nComeToTheCheeseYo	1445012911	655057746967011328	f	gcnyc1
G1 - @QueensCollege \nG2 - uptown \nComeToTheCheeseYo	1444917900	654659241358176256	f	gcnyc1
RT @TheMeadowlands: NYC: @mausamnyc @gcnyc1 @CamionNYC @DeliNDogzTruck @KorillaBBQ @mactruckny @PontiRossiFood @Valduccis @USAFoodTruck htt...	1444834740	654310441653530624	f	gcnyc1
G1 -  @QueensCollege \nG2 - 26th 11 / 12 @starretlehigh \nComeToTheCheeseYo	1444834700	654310275638775808	f	gcnyc1
You made it to the end of the week! Treat yo'self w/ some tacos. 52nd & 6th, 11:30 - 2:30	1446215808	660103062128840704	f	kimchitruck
RT @lcliffzz: Had a delicious meal from @KimchiTruck @FoodMoves https://t.co/zfxVhonm8l	1446205205	660058589663481856	f	kimchitruck
Setting up shop on Hudson and King today, 11:30-2:30	1446121878	659709091808452612	f	kimchitruck
Lunching this humpity hump day on 52nd & 6th Ave today, 11:30 - 2:30	1446036562	659351250035720193	f	kimchitruck
Let's do this, DUMBO We'll be at Jay & Water St. 11:30 - 2:30	1445953754	659003926503628800	f	kimchitruck
Tacos to start off your Monday. How can you go wrong? Broadway & 55th Ave. 11:30 - 2:30	1445870387	658654260914163712	f	kimchitruck
RT @dubpies: PieTruck's is @ProspectPark Nethermead Halloween event with @gcnyc1\n@kimchitruck\n@nuchasNYC\n@PapayaKingTruck\nAl day!	1445704682	657959241806913540	f	kimchitruck
Come celebrate Halloween early in ProspectPark today! 12 trucks, Nethermead, see ya there. 11-5pm	1445695310	657919933490270209	f	kimchitruck
TGIFing on 52nd & 6th today!	1445606838	657548857480454144	f	kimchitruck
Come spend this gorgeous day with us. We're on Hudson, off King St	1445535487	657249588429070337	f	kimchitruck
Make that Hudson, off King!	1445527931	657217895592820737	f	kimchitruck
Beautiful day for tacos. Find us on Charlton & Varick St. today, 11:30 - 2:30	1445527015	657214052905676800	f	kimchitruck
We're closed for a private event today. Back in action tomorrow.	1445435627	656830745063858177	f	kimchitruck
Find us on Jay & Water St. today doing our kimchi thang. 11:30 - 2:30	1445344540	656448697111326720	f	kimchitruck
Here on Broadway & 55th, slinging tacos, wings & kimchi goodness. Swing on by.	1445277660	656168184664489985	f	kimchitruck
RT @jennifermattson: Broke out the winter coat and boots for my @bkbrains class today. Lunch~ @KimchiGrill http://t.co/UmqkQpfyx0	1445276215	656162122607497216	f	kimchitruck
Let's go, tacos! Broadway & 55th until 2:30 pm	1445274924	656156705391251456	f	kimchitruck
RT @keithbacker: Monday Kimchi Fish Bowl to warm up midtown with @KimchiTruck. Get involved! http://t.co/VrHyhDxucy	1445274140	656153420143984641	f	kimchitruck
Didja hear? We're doing the burrito boogie on Broadwa & 55th today.	1445270426	656137843367137280	f	kimchitruck
RT @keithbacker: Monday woot! https://t.co/g6Kr61JQVe	1445262997	656106680644714496	f	kimchitruck
hisunday oct 25th.\nfront of Apple Store\n67th. st. Broadway\n11-7pm\ncome to get the Mother of All Burgers\nmarathon https://t.co/rfA2MqRVTX	1445781349	658280807115657216	f	langostruck
hi Langos Truck will be at Blkmarket Event\n11pm-5am\ncome to enjoy the unique, exceptional event  \nbrooklyn 23 Meadow https://t.co/rWdW5LJJOd	1445614103	657579327903682560	f	langostruck
Hi\nyou can find us in Williamsburg\nSaturday\nfrom 10-4pm\nBrooklyn EXPO Center\n72 Noble St\nNY 11222 http://t.co/kjEiVUVupJ	1445039054	655167395540127744	f	langostruck
hi \nSaturday and Sunday \nat\n358 N. Broadway Mall\nHicksville ,Ny 11801\n\nwe are serving \n11:45-5pm\n\nthank you http://t.co/5cgo3H7hRz	1444478683	652817029494370304	f	langostruck
Hi  \nLangos Truck going to Hicksville, Long Island Ny\nSat & Sunday 11am-5pm\n358 N.Broadway Mall\nHicksville ,Ny 11801 http://t.co/6bKTIA8qs5	1444435157	652634471116767232	f	langostruck
hi Guys \npickle day at Langos Truck\nwe guarantee you not going to have\nSour Face\ncorner of Orchard &Rivington st http://t.co/HbXPjWXpvy	1443971266	650688769176272896	f	langostruck
Hi Lower East Side\n\nPickle Day is ON for this Sunday, October 4th\n12-5pm\nOrchard st \nbet(Delancey Rivington)\nenjoy http://t.co/Yl2hsWg5bi	1443962039	650650068962418688	f	langostruck
good morning\nyou can find us at \nGovernor's Island \nsat &sunday\nsept 26-27\n11-5pm\n@foodtruck @GovIslandFood \nVW Europe nyc roaminghunger	1443270600	647749963200528384	f	langostruck
hi Midtown\nyou can find us@\n52nd.st bet 6-7Ave (closer to 6)\n11-2:30pm	1442494347	644494122372472832	f	langostruck
hi \nLangos Truck @Fidi\nWater St & Old Slip\n11-2:30pm\n\nThursday 52st/6Ave \n\nif you don't know Mangalitsa take look http://t.co/JFRV2ZJRmb	1442412236	644149724468125696	f	langostruck
@CitiFieldSheas	1442348639	643882977278230528	f	langostruck
@LangosTruck p	1442348365	643881828089204736	f	langostruck
hi \nwe changed our location \n53street/Park Ave\nthanks	1442332880	643816879413456896	f	langostruck
hi Midtown \nwe're at 52nd. st/ Park Ave\n11-2:30pm\nWed Old Slip&Water st \n\nThur 52st/6Ave \n\nSat Jersey City groove st\n\nSun Governor 's Island	1442316502	643748188109860864	f	langostruck
hi Lovely days @Gov_Island\n\nsaturday and sunday \n11-5pm\n\n@vendyawards @PolishCuisine @DeliNDogzTruck @briteNYC \ncome to see us & have fun	1442063420	642686682735767552	f	langostruck
hi Midtown \nLangos Truck @\n52st bet 6-7Ave(closer to 6)\n11-2:30pm\nsat & sunday Governor's Island\n11-5pm\nenjoy your weekend	1441973950	642311419799711744	f	langostruck
hi Fidi\nwe're at Wall Street area\nWater street and Old Slip\n11-2:30pm\nthank You	1441809998	641623753051402241	f	langostruck
hi New Yorkers\nour schedule \nTuesday 53st/Park Ave\nWed Water/Old Slip Fidi\nThurs 52st/6Ave\nFriday 47st/Park Ave\nsat&sun Governor's island	1441714960	641225135467446272	f	langostruck
hi Midtown\nwe're ready for good times\ntoday@ 52 st bet 6-7Ave\n11-2:30pm\noldtraditionalpolishcuisine nyc foodtruck http://t.co/B1Q2qWzAkL	1441284384	639419168719273986	f	langostruck
good morning \nwe're in Wall street area \ncorner of Water & Old Slip\n11-2:30pm\n\nThursday 52/6Ave\nsat&sunday Governor's Island\n11-5pm	1441203780	639081091190624256	f	langostruck
My lunch be like https://t.co/Bo3glCxcgj	1446052398	659417670224359424	f	mexicue
It's like a taco, only bigger, with lots of stuff in it - the Brisket Enchilada https://t.co/dbixmGMyZO	1445981382	659119807602782208	f	mexicue
Eat all of the colors |  @olivegraham https://t.co/YFZ7jWYdnT	1445873174	658665950540124160	f	mexicue
RT @2travelingtxns: My new favorite happy hour place in nyc is @Mexicue! Wow are these margaritas good! https://t.co/UuQPlBqf7J	1445464852	656953322327420928	f	mexicue
.@thomaskelly is throwing down in @thrillist's Barbecue & The Blues tonight at @nycwff - prepare for greatness http://t.co/6HuETJyj16	1445029427	655127019798310912	f	mexicue
Tortilla strips are vegetables, right? http://t.co/DfpHX7MX16	1444928070	654701896578392065	f	mexicue
Our kind of pep talk @unsqgreenmarket  http://t.co/DsO4Fz8g25	1444838557	654326449810313216	f	mexicue
RT @JimByersTravel: Nice atmosphere and good burritos @Mexicue on 40th St. @NYCWFF food foodies travel newyorkcity http://t.co/r5oHbiVx...	1444774095	654056077240201216	f	mexicue
You've got the time to get creative with your taco shots today, do work  http://t.co/zRSlDSSdlU	1444672749	653631002473070592	f	mexicue
When you've got over 50 bourbons & tequilas to play with... TreatYoSelf http://t.co/iWObyilm0l	1444342652	652246476052168704	f	mexicue
 You used to Kale me on my cellphone  | Do it up for NationalKaleDay - we've got the goods http://t.co/p2vqIVY6qa	1444239894	651815476310446080	f	mexicue
You know when you get all the seven layers of a dip on your chip? This is the jumbo version GrilledShrimpTostada http://t.co/8fse9VRzLh	1444076442	651129907972407299	f	mexicue
RT @CookingDistrict: Happy NationalTacoDay!!! Celebrate by cooking up some of our favorite tacos from @Alaska_Seafood and @Mexicue http://...	1443990063	650767610162843648	f	mexicue
It's NationalTacoDay, so do your duty and TreatYoSelf http://t.co/5nTkjYYotR	1443973795	650699377347067904	f	mexicue
Wave that burrito in the air like ya just don't care (but deep down you care so much) http://t.co/tBKNdNcGTd	1443814258	650030230615289856	f	mexicue
Monday feels | Avocado & House Slaw Salad  TreatYoSelf right http://t.co/sV3SIBCWpH	1443453708	648517972525457408	f	mexicue
SquadGoals  | TreatYoSelf http://t.co/MQsXxMSCEs	1443213709	647511344678309888	f	mexicue
RT @EatInChef: @bedfordcheese @casamono @mexicue @GramercyTavern @GuS_Soda @IrvingFarm all at TOGN this Saturday. Come & get it! Gramercy...	1443209927	647495484131659777	f	mexicue
Basically Fall in a bowl, topped with cheese TreatYoSelf http://t.co/plajw0ai8H	1443112869	647088391360802816	f	mexicue
@GF_NYC @GFtravelers many of them are! Give us a call for the full list	1443044608	646802084839473152	f	mexicue
FalafelFriday is the best way to kick off the weekend! Join us in FIDI on Old Slip btwn Water & Front St until 3pm https://t.co/pdJN2n5VT1	1446207545	660068402640396288	f	toumnyc
Thursday's in @DumboNYC are the best! Join us on Jay & Water St 'til 3pm for a healthy vegan platter LebaneseEats https://t.co/fcBNfd3HNr	1446127135	659731139154845696	f	toumnyc
Don't let the gloomy weather stop you from getting a yummy LebaneseLunch. Pre-order at 917-TOUM-350 & pick up from 46th btwn 5th & 6th!	1446039594	659363967735853056	f	toumnyc
@IAMNYCLive  hope you enjoyed! Sahtain!	1446039431	659363280570445824	f	toumnyc
Hello MidtownEast! Get your shawarma fix on 47th btwn Park & Lexington until 3pm! LebaneseLunch foodporn https://t.co/U4sp6bpOvz	1445954509	659007094931247104	f	toumnyc
The cure to your MondayBlues is in @DumboNYC on Jay & Water St until 3pm. Join us for ridiculously delicious LebaneseEats	1445868235	658645235535368192	f	toumnyc
You know what day it is! FoodTruckFriday in FIDI. Join us on Old Slip btwn Water & Front St until 3pm!	1445607906	657553336439341056	f	toumnyc
Sorry @DumboNYC the lot is closed today  join us in MidtownEast instead on 47th btwn Park & Lexington for endless LebaneseEats	1445518396	657177901968830468	f	toumnyc
@NoGarlicNoOnion Thanks for stopping by and for the shout out! We love hearing you enjoyed our food :)	1445448040	656882807336251392	f	toumnyc
RT @NoGarlicNoOnion: It's surely is No Garlic No Onions but TOUM NYC rocks! toumnyc mustvisit NGNOtravels streetfood @... https://t.co/8h4...	1445447978	656882549713715200	f	toumnyc
Changing up the location for today. Join us on 46th btwn 5th & 6th for LebaneseEats vegan glutenfree foodporn	1445430983	656811264455385088	f	toumnyc
Our usual Tuesday spot is a no-go today due to street closures. We're on 47th btwn Park & Lexington instead. Join us until 3pm.	1445348590	656465686932410368	f	toumnyc
@mzcoach22 please email me at christine@toumnyc.com	1445271336	656141657021239296	f	toumnyc
Well hello there LebaneseLunchers! Join us in @DumboNYC on Jay & Water St until 3pm for mouthwatering shawarma http://t.co/t34IzV5NzC	1445261202	656099154796613632	f	toumnyc
SundayFunday is happening today at the @prospect_park foodtruckrally at GrandArmyPlaza until 5pm! Brooklyn LebaneseEats	1445178463	655752119270555648	f	toumnyc
It's the perfect day for FalafelFriday in FiDi! Join us on Old Slip btwn Water & Front St until 3pm. vegan LebaneseLunch foodporn	1445003527	655018384938180608	f	toumnyc
@BroAkra we might be making an appearance next Thursday actually! We'll keep you posted 	1445003202	655017021856436224	f	toumnyc
What up Brooklyn?!? Join us in @DumboNYC on Jay & Water until 3pm! Your growling tummy will thank you! getinmybelly	1444915428	654648872225017857	f	toumnyc
@NYCFoodGuy it's being fixed... We just confirmed the location. Thanks!	1444840079	654332833801052160	f	toumnyc
@NYCFoodGuy yes :)	1444840036	654332653764767744	f	toumnyc
RWC2015 bet placed. Allblacks win, @KOCatering_Pies wear our t-shirts/fly NZ flag for a week! If wallabies win... I forget what happens	1446244895	660225060536508416	f	dubpies
RT @KOCatering_Pies: Now we need @MVincentOZ  to let the Aussies know! @dubpies @abcnews RWC2015final trantasmanpieshops	1446244315	660222626896441345	f	dubpies
Done! RT @KOCatering_Pies: @dubpies losing pie shop to wear winning shops T-shirts & fly national flag for a week! RWC2015	1446243506	660219234111365121	f	dubpies
Hell yes! RT @KOCatering_Pies: Good luck tomorrow mate! Thinking some kind of friendly wager is in need between KO and @dubpies thoughts??	1446241408	660210436579704832	f	dubpies
Don't be jealous - get even - we ship nationwide! RT @DAYtheELF: @mc_ellis @dubpies @peregrinekiwi I have such a jealous hunger.	1446232618	660173566802042880	f	dubpies
Safer communities together RT @mc_ellis: Remembering to blow on my @dubpies pie, @peregrinekiwi	1446232567	660173353920167936	f	dubpies
PieTruck's at @DumboLot until 3pm today. Go stock up for the RWC2015 final tomorrow!  savorypies flatwhites dumbo	1446227340	660151428032438272	f	dubpies
PieTruck's @ Bedford & N6/7 'til late  Need pies for the AllBlacks Wallabies on Saturday? RWC2015 Now's your chance Williamsburg	1446168583	659904986172809216	f	dubpies
PieTruck's @ Bedford Ave & N6/N7 until at least midnight. Last time for a while, get you pie/flat white fix tonight!	1446151689	659834127240339456	f	dubpies
It takes a regularly serviced monster generator to keep bringing pies & flat whites to the good people of NYC https://t.co/EwAY0XHUPO	1446142519	659795664482758657	f	dubpies
Pies. Check. Bring it on! RT @TheJasonProject: @CharlieisaRed @MenInBlazers You're going to need pies, too. Heads up @dubpies	1446138401	659778394037596160	f	dubpies
PieTruck having generator serviced. Back tonight on Bedford Ave & N7 (at least that's the plan!)	1446131637	659750023585005569	f	dubpies
RT @FlavorsOfLight: On a chilly autumn evening it's nice finding @dubpies chicken pie tucked away in the freezer. gifted PiePartyICE  htt...	1446130101	659743580223840257	f	dubpies
Certainly adds a certain je ne sais quoi, no? May even be lending itself to your obviously immense street cred! https://t.co/1cVr6IpwrS	1446130041	659743329169575936	f	dubpies
@grahamaimson got it - then that's what we'll build a big rectangle with a menu over it! - sweet!	1446065177	659471267448365056	f	dubpies
@grahamaimson does it look like a typically footbally concession stand?  or should I keep trawling google images?	1446062021	659458033257480192	f	dubpies
@grahamaimson need to build a replica football ground pie concession stand for an event, got any pics of yours you can share?	1446061206	659454614807388161	f	dubpies
RT @SlopeNews: Morning savories, peace, and calm @dubpies. https://t.co/SmsgAIcjxK https://t.co/kczMn6IZ2z	1446061042	659453926782148608	f	dubpies
https://t.co/dwmr0X9vO3	1442406985	644127700651769856	f	palenquefood
RT @DonnyReports: Morning savories, peace, and calm @dubpies. https://t.co/SmsgAIcjxK https://t.co/TEb37k9tmf	1446061022	659453840870285313	f	dubpies
PieTruck is off the road today (& possibly Thursday) having the generator serviced. Back as soon as possible!	1446039727	659364523699228672	f	dubpies
We are at the corner of 55st and Broadway!	1446220234	660121625132720130	f	chefsamirtruck
We are at the corner of 52st and park av!	1446046591	659393313083138048	f	chefsamirtruck
We are at the corner of 36st and Broadway!	1445961130	659034862490374144	f	chefsamirtruck
We are at the corner of 55st and Broadway!	1445613950	657578685604745216	f	chefsamirtruck
We are at 47st between park av and Lexington av!	1445527820	657217428997459969	f	chefsamirtruck
We are at the corner of 52st and park av!	1445441111	656853747319066625	f	chefsamirtruck
We are at the corner of 36st and Broadway!	1445355400	656494247093379072	f	chefsamirtruck
Today we are at the corner of 55st and Broadway!	1445009156	655041997229694976	f	chefsamirtruck
We are at 47st between park av and Lexington av!	1444923242	654681645526577152	f	chefsamirtruck
We are at the corner of 52st and park av!	1444836537	654317978629095424	f	chefsamirtruck
At store front for art and architecture gala!! http://t.co/tVFspZ6iUW	1444777535	654070506187042816	f	chefsamirtruck
We are at the corner of 36st and Broadway!	1444753243	653968618955345920	f	chefsamirtruck
We are at 47st between park av and Lexington av!	1444319707	652150237419601920	f	chefsamirtruck
We are at the corner of 36st and Broadway!	1444145580	651419893246640132	f	chefsamirtruck
It's Friday, couscous time! !we are at the corner of 55st and Broadway!	1443799485	649968268678156291	f	chefsamirtruck
We are at 47st between park av and Lexington av!	1443714233	649610696930496512	f	chefsamirtruck
Yeah!  We are at the corner of 52st and park av!	1443627658	649247573736357889	f	chefsamirtruck
We are at the corner of 36st and Broadway!	1443540645	648882613386637312	f	chefsamirtruck
Due to parking problem,today  we are at 47st between park av and Lexington av!	1443022374	646708829653204993	f	chefsamirtruck
We are at 36st and Broadway! !	1442936234	646347529488044032	f	chefsamirtruck
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
@mrw we plan on doing flatiron weekly! Stay posted here/instagram to know where we'll be. Fridays/saturdays we are in wiliamsburg 6pm-6am	1445901983	658786783384195073	f	cachapasbk
@JaredBanyard 20th and 5th until 3 pm!	1445878009	658686229559517184	f	cachapasbk
@JaredBanyard we'll be there next week. We promise! If you cant wait till then we'll be ond bedford and north 6 tonight!	1445609792	657561247429337088	f	cachapasbk
@Chris_Quartly always showing love!	1445609741	657561033276530688	f	cachapasbk
RT @Chris_Quartly: Pernil cachapa from @cachapasbk, think they are on course to become my number 1 truck. @ New York,... https://t.co/jedVjGA...	1445609719	657560940339183616	f	cachapasbk
What's up Hannover Sq! Missed us?	1445525120	657206103814623232	f	cachapasbk
RT @fsayed: pernil pork patacon sandwich @cachapasbk https://t.co/ORWdXnMidq	1445447853	656882025761218560	f	cachapasbk
Your favorite Venezuelan food is coming to 20th & 5th avenue today. See you there !	1445431445	656813205839355904	f	cachapasbk
Show us some love at Hanoversquare today 11-3	1444747339	653943853481902080	f	cachapasbk
@billytypedthis we should be tomorrow or wednesday. Stay posted for our exact location	1444747284	653943624783237124	f	cachapasbk
Hey Williamsburg, we are coming back for you this weekend ! N6 & Bedford. 5pm-6am. Come get it!... https://t.co/1xSyALjRZC	1444431749	652620174986711040	f	cachapasbk
Find us in midtown today!! cachapasonwheels will be on 47th and Park serving up venezuelangrub	1444314060	652126549735534592	f	cachapasbk
Thanks for the shoutout @Chris_Quartly That is a great pic!	1444239710	651814706915577856	f	cachapasbk
RT @Chris_Quartly: Grilled steak patacon from @cachapasbk, go to this truck! http://t.co/vuMDowkaGH	1444239660	651814494771900417	f	cachapasbk
hanoversquare today 11-3\n see you all there!	1444219696	651730759842181121	f	cachapasbk
Our cachapas fam will be happily serving all the venezuelan goodness at hanoversquare... https://t.co/BmIyCraWd3	1444219386	651729459528077312	f	cachapasbk
RT @CitySpoonful: .@cachapasbk Rolls In with Venezuelan Sandwiches http://t.co/xlMsQTslYH (via @downtownlunch)	1444143389	651410703572684800	f	cachapasbk
Come and get it! @cachapasbk is on 47th and Park for the afternoon 11 - 3 venezuelanfoodtruck... https://t.co/ofW5u7n5nQ	1444143032	651409209700052996	f	cachapasbk
Dad & Son Patacon in the beautiful Dominican Republic! cachapasymasrd weeverywhere patacon... https://t.co/nLoeqKzR9c	1444141191	651401487516631040	f	cachapasbk
@scrody13 we are working on a schedule for the rest of the week. We'll update it daily	1444064011	651077770638950401	f	cachapasbk
w50th and 6th. Catch us for the last day of this week midtown eateries	1446219002	660116456378601472	f	kayanyc28
Wassup all Bao lovers! Rolling into soho Varick and Charlton today. Get yourself a tasty bun Ducks lunchbox nyc https://t.co/0exkhm2rnI	1446130673	659745976912101376	f	kayanyc28
Parking at Greenwich and Park Pl today. Let's Indulge yourself in our delicious popcorn chicken. Grab a Bao fix. https://t.co/Jda3umDmmh	1446046564	659393198457016320	f	kayanyc28
Midtown we're serving up hot fluffy steamed buns at 50th and 6. Stop by to grab one newyorkcity foodtrucks kaya https://t.co/1b1T0GAWdt	1445957210	659018423566008320	f	kayanyc28
Get some baos to jumpstart your week. We're parking at Front and Adams till 2:30 @DUMBOFoodTrucks @DumboNYC https://t.co/FLJinbBn8P	1445873081	658665559446462464	f	kayanyc28
W50th and 6th ave today. Get ready by 11:45. Let's Bao with us	1445612284	657571698867372032	f	kayanyc28
Charlton and Varick today. Ready by 11:45	1445525885	657209314285891584	f	kayanyc28
Greenwich and Park Pl till 2:30 baos wednesday foodie	1445439331	656846281449541632	f	kayanyc28
W50th and 6th ave today. Get ready by 11:45	1445352756	656483157223546880	f	kayanyc28
Front and Adams st till 2:30 @DUMBOFoodTrucks	1445267230	656124436127621120	f	kayanyc28
W50th and 6th ave today HappyFriday ready by 11:30. Come grab a Bao fix http://t.co/AftidAx52K	1445008879	655040835407511552	f	kayanyc28
One more round this week at Charlton and Varick. Get ready at 11:45 http://t.co/voOo1ryZIb	1444923614	654683207498002433	f	kayanyc28
One more round this week at Charlton and Varick. Get ready at 11:45	1444920864	654671672742539264	f	kayanyc28
Due to road construction, we're parking on Charlton and Varick today till 2:30 HUDSON soho taiwanese http://t.co/Nyj3xPoGtz	1444832694	654301858966700032	f	kayanyc28
RT @kristyyui: Best lunch I ever have! @KayaNYC28 @midtownlunch http://t.co/sPmNWraHH5	1444754229	653972753222107136	f	kayanyc28
What's up Midtown! We'll be at 50th & 6th until 2:30, so come grab some baos and popcorn chicken for lunch!! foodtruck	1444749149	653951445134352385	f	kayanyc28
Front and Adams till 2:30 ColumbusDay @DUMBOFoodTrucks http://t.co/Dl0zeKfCpF	1444662281	653587095089475584	f	kayanyc28
W50th and 6th ave. Ready by 11:30	1444402309	652496696572805120	f	kayanyc28
Varick and Charlton. Ready by 11:30	1444315003	652130508982218752	f	kayanyc28
New York Live on Channel 4 between 12:30 and 1pm! We are very excited! NewYorkLiveTV! NBClive NBC... https://t.co/OvER93Kvgu	1444229366	651771318841548800	f	kayanyc28
RT @AndCarter: I never knew of the existence of popcorn trucks before today. I saw this @BrooklynPopcorn truck in Washington Heights http:/...	1441152871	638867565842972672	f	brooklynpopcorn
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
Water St and Hanover sq today across the street from our usual Thursday spot at old slip come and get it before the rain gets here lol	1446136002	659768330652381184	f	mamasheros
Varick and Charlton today come and get em hot and fresh newmenu 14choices hungry?	1445436792	656835630299795456	f	mamasheros
financialdistrict downtownNY come check out the new menu on King St & Charlton St around the block from Varick St https://t.co/P437RuuIja	1445353079	656484511207837696	f	mamasheros
@MikeGnycee sorry we've been having some issues should be out tomorrow :) will update location and be sure to tag you	1444759702	653995711252557825	f	mamasheros
Varick and Charlton today let's rock with the Hero's	1444147566	651428226842144768	f	mamasheros
@reallyandrea how was your sandwich ? :)	1443882318	650315693020311552	f	mamasheros
@greggfly not in the city due to the UN week sorry we will be back on King and Hudson this Monday Varick and Charlton next Wednesday	1443633966	649274031720542210	f	mamasheros
@greggfly	1442243540	643442161795661824	f	mamasheros
Passport center we here baby Hudson St and King St come grab a hot one on this cold day http://t.co/uczb0CgXh6	1442243494	643441967574196224	f	mamasheros
@greggfly we have just been in Boston on business we will be back on those streets starting Monday Varick and charleton every Wednesday	1441227423	639180259699597312	f	mamasheros
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
Round 2 ,Midtown 48th st and 6 avenue 11:30 - 3pm !!	1446216696	660106784892461056	f	coneyshack
Back at the spot 48th St and 6th avenue midtown 11am - 3pm  , Coney Island west 8th St 11:30 - 7pm	1446126460	659728308922425345	f	coneyshack
48th st btw 6 & 7 ave. Opening at 11	1446125852	659725757799886848	f	coneyshack
@JayDesai80 wassup buddy due to the rain out we decided on closing for the day , will be in midtown tomorrow and coneyisland	1446049141	659404009934036992	f	coneyshack
Financial District we didn't forget about you, back in the Old Slip & water st 11am - 3pm	1445948904	658983584330600448	f	coneyshack
Shout out to our lovely coney shack customer who enjoyed our food. Thank you for going out of your way for us!  https://t.co/gCxZmW0uSe	1445881671	658701587859263488	f	coneyshack
Rite on money with tea quality ,highly recommend  https://t.co/2n6KS7myIz	1445854211	658586412942540800	f	coneyshack
Garment district we bringing coney island to your nabe for the 1st time, 38th st and broadway corner 11am - 3pm https://t.co/1863DRBEAz	1445849600	658567073606606848	f	coneyshack
@JonathanThen absolutely come by were there till 7pm	1445629008	657641842092212224	f	coneyshack
Midtown we here thirsty Thursday  48th  between 6th & 7th ave, 11 - 3pm	1445518783	657179526292754432	f	coneyshack
Midtown we have a date... 47th and park ave 11- 3pm	1445435863	656831732524654593	f	coneyshack
What a,gorgeous day , come by 47th st and park Ave and let's TACO ABOUT it 11-3pm getttit!!	1445431917	656815185844400128	f	coneyshack
RT @cinemaparker: @ConeyShack As your biggest fan, I am prepared to eat 4 tacos today instead of my usual 3. Or maybe not. Never mind.	1445362201	656522774320689152	f	coneyshack
Downtown FiDistrict ,we're here and ready to go Old slip & water st 11:30 - 3pm	1445349532	656469634867007488	f	coneyshack
Thanks you @alisaym the first review goes down in history, will never forget, today at 48th &6ave today, see yousoon https://t.co/dzjjBkZt6Q	1445253836	656068257963712512	f	coneyshack
5 spice crispy calamari taco we seriously need to get together and make this happen. 48th st between 6 & 7 ave 11-3p http://t.co/9I4TpvIrr1	1445251676	656059198745255936	f	coneyshack
RT @LunaParkNYC: Take a piece of Coney Island home with you today! Select LunaParkNYC & ThunderboltNYC merchandise is 50%! http://t.co/GK...	1445117373	655495888920518656	f	coneyshack
RT @MatthewPizzulli: Yes!!!! They are back in midtown west! besttacos (at @ConeyShack in Brooklyn, NY) https://t.co/azuadDRyzn	1445018010	655079130061524992	f	coneyshack
RT @pawzee: Thank you @ConeyShack for the awesome at burrito I've ever tasted.	1445017992	655079054744358912	f	coneyshack
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
RT @FTS_MAG: Estan listos para una semana de Foodtrucks desde Nueva York? Estamos alistando a nuestra corresponsal! FTNYC https://t.co/...	1446250945	660250437224894464	f	milktrucknyc
@NardelliLynda Oh!!! no!!!! so sorry. come back next week. sandwich with bacon. on us.	1446240209	660205406954856448	f	milktrucknyc
Good morning Milk Truckers! Bessie will be at Wall St. and William today. Please call 646-504-6455 for pre-orders! Thx	1446211807	660086279405633536	f	milktrucknyc
Good morning Milk Truckers! Bessie will be at 53rd and Madison today. Please call 646-504-6455 for pre-orders! Thx	1446168603	659905068347490304	f	milktrucknyc
Greetings Milk Truckers! Today Bessie will not be at 58th and Madison. Please see our menu @houstonhall	1446047482	659397050916818944	f	milktrucknyc
Hello Milk Truckers!\nDue to inclement weather we will not be at Seaport today. Our menu is available @houstonhall!	1446047197	659395854034448384	f	milktrucknyc
Hello Milk Truckers!\nBessie will not be at 27th and Park today due to inclement weather. Our menu is available @houstonhall	1446047148	659395649239171072	f	milktrucknyc
RT @MediaStyleNYC: Let's talk about saving elephants! elephantfamily elephantsforeverauction           @ Angel... https://t.co/ViPwlubW...	1446044332	659383838255267841	f	milktrucknyc
Hello Milk Truckers! Bessie will be at 58th and Madison. Please call 646-504-6455 for pre-orders. Thx	1446039007	659361503116595200	f	milktrucknyc
Good morning Milk Truckers! Bessie will be at 27th and Park today. Please call 646-504-6455 for pre-orders! Thx.	1445952606	658999112763752448	f	milktrucknyc
RT @ShanghaiMKS: It's the perfect time for some comfort food from @milktrucknyc! Grilled cheese, mac and cheese and chili.... we can't wait...	1445791961	658325318382522368	f	milktrucknyc
How about spending your Sunday at @TheSeaport? 19 Fulton Street - we're there! Along with Industry City's indoor flea.	1445781613	658281917050060800	f	milktrucknyc
We're at Williamsburg Smorgasburg and Industry City's indoor flea today! https://t.co/XZibq77AIw	1445695221	657919561950322688	f	milktrucknyc
RT @EatingTheWorld: Lunch at smorgasburg on South St Seaport @theseaport, grilled cheese from @milktrucknyc and brisket... https://t.co/9t3eV...	1445636444	657673032174063617	f	milktrucknyc
There's no truck today due to a private catering event, but you can still celebrate Friday with us at @TheSeaport :)	1445605213	657542040666771456	f	milktrucknyc
Bessie is off the road today, but we're serving up deliciousness at @TheSeaport 19 Fulton St. and @houstonhallnyc as always.	1445518816	657179662490038272	f	milktrucknyc
UPDATE: Bessie has moved to 53rd and Madison -close to Park Ave!	1445444839	656869383747338240	f	milktrucknyc
Bessie is at 58th and Madison. Call 646-504-6455 for your pre-orders!	1445432414	656817267401818113	f	milktrucknyc
Update: Bessie is at 27th & PAS for lunch starting now!	1445354254	656489440106385408	f	milktrucknyc
Bessie is at 25th and Park today! Come warm up with a grilled cheese and tomato soup!	1445346012	656454872343023617	f	milktrucknyc
If you haven't voted, please do! We'd love to win the @ScoutologyNYC Food Truck Fight: https://t.co/hmeWrFEJIS https://t.co/XxkkwC3O02	1446060339	659450976793927680	f	souvlakitruck
Your votes mean the world to us! Please help us win the @ScoutologyNYC Food Truck Fight: https://t.co/Sjws0dhdvu https://t.co/K1HQKxNMDe	1445966741	659058399989112832	f	souvlakitruck
Please keep voting for us to win the @ScoutologyNYC Food Truck Fight! https://t.co/aVQFob8o8G https://t.co/hG4ezRXIQF	1445872849	658664585549975552	f	souvlakitruck
We are so honored to have made it to the finalists! Vote for us - NYC Food Truck Fight: https://t.co/FQ2TXexGcg https://t.co/vAN4sVcQpE	1445803329	658373000337694721	f	souvlakitruck
Autumn in Mainland Greece At its Best via @GreekReporter https://t.co/xsoTP1vH8t https://t.co/iOxRBRMznV	1445793043	658329854757224448	f	souvlakitruck
Have you voted for us yet? If not, help us win the NYC Food Truck Fight this year! https://t.co/huh1fyKbXo https://t.co/o1Vtq9qRGm	1445792534	658327721924272129	f	souvlakitruck
It's fresh + amazing. What else do you need? Vote for us in the NYC Food Truck Fight! https://t.co/AZKSBgffVy https://t.co/L4qIkHbOG2	1445781725	658282385117696000	f	souvlakitruck
The perfect grab n' go. Vote for us in the NYC Food Truck Fight! Link here: https://t.co/teO4AKLU4m https://t.co/qUj6eo08MI	1445727684	658055718722019335	f	souvlakitruck
Can we BE any more delicious? Only if you vote us the best food truck in NYC! Vote here: https://t.co/NiBQSNKKLd https://t.co/JzCy6ycFgf	1445716895	658010467068223489	f	souvlakitruck
We've got the best food truck meals and you know it! Vote for us here: https://t.co/lN88wYiaZj https://t.co/OuPbZnzEQb	1445708122	657973672817401856	f	souvlakitruck
How To Halloween In NYC, by @gothamist https://t.co/Y6wWVLukVd https://t.co/uagScfrVGp	1445701832	657947290183835648	f	souvlakitruck
Help us win best food truck in NYC! Vote here: https://t.co/LiRdCQRgPs https://t.co/tVROndgDyC	1445695302	657919900997001217	f	souvlakitruck
Vote vote vote! You know we're the best truck in NYC: https://t.co/0pf15uC41j https://t.co/rgbF8IOM4g	1445641222	657693072306884609	f	souvlakitruck
RT @ILCongress2015: Thank you to @gcnyc1 & @souvlakitruck for making our lunch break delicious ILCongress2015 https://t.co/GAC9BT63Km	1445615298	657584338721206273	f	souvlakitruck
We've made it to the Championships of @Scoutology's NYC Food Truck Fight! Vote for us here: https://t.co/6SP7cRO5Og https://t.co/VwBkoWgaX4	1445556919	657339481243127808	f	souvlakitruck
Can you guess what they are? | The 10 Most Vegetarian Cities In The U.S. by @Kbratskeir: https://t.co/Yhm7NnWFPj https://t.co/kaTHx6Llov	1445532060	657235216013094912	f	souvlakitruck
RT @ScoutologyNYC: Cast Your Vote In The NYC Food Truck Fight Championship! @Scoutology @PontiRossiFood @souvlakitruck \n\nhttps://t.co/gsjB...	1445527155	657214639869206530	f	souvlakitruck
RT @christinafount: Had lunch today in Mykonos  @souvlakitruck GreekFriesOnPoint https://t.co/RPQ9778U4x	1445452028	656899535722160129	f	souvlakitruck
Wishing we were in beautiful sunny Mykonos today... but NYC is great too :) ALittleTasteOfMykonos https://t.co/l2ybFWPhg3	1445448693	656885547101761538	f	souvlakitruck
Off To The Orchard: 5 Great Places To Pick Apples Near NYC | via @Gothamist https://t.co/I4m1qQQ0Kk https://t.co/e2v8s43zdW	1445355325	656493935372713984	f	souvlakitruck
@Rooseveltisland grab your dinner on the way home 5-8pm http://t.co/8WbFXakcRO	1444940799	654755286759043072	f	mausamnyc
@Rooseveltisland grab your dinner on the way home 5-8pm http://t.co/62EeykpNAy	1444853021	654387115933962240	f	mausamnyc
@UptownLunch York Avenue between 70th & 71 Street delicious Indian curries & bites http://t.co/CXr7MJL625	1444830394	654292212356923392	f	mausamnyc
RT @TheMeadowlands: NYC: @mausamnyc @gcnyc1 @CamionNYC @DeliNDogzTruck @KorillaBBQ @mactruckny @PontiRossiFood @Valduccis @USAFoodTruck htt...	1444766281	654023303699529729	f	mausamnyc
@Rooseveltisland dinner 5-8pm http://t.co/tcVmQmY9x7	1444764591	654016214981865472	f	mausamnyc
@UptownLunch York Avenue between 70th & 71 Street delicious Indian curries & bites http://t.co/w61B1HZ7bD	1444747103	653942866373398528	f	mausamnyc
Beautiful sunny day @Rooseveltisland we're here serving our customers until 8pm http://t.co/Jo6fcZqjAD	1444673944	653636012753747970	f	mausamnyc
Catch us today @Rooseveltisland Lunch & Dinner 11am - 8pm your Savory Indian flavors & bites http://t.co/rpQozWi5dy	1444654776	653555619639750656	f	mausamnyc
Lunch @333 West 33rd Street between 8 & 9 Ave http://t.co/mQp9Pt7Uao	1444399507	652484940777586688	f	mausamnyc
Here we come dinner time @Rooseveltisland 5-8pm http://t.co/I9rFiVD78N	1444333463	652207933552467969	f	mausamnyc
RT @dumbolot: We got @ToumNYC @MexicoBlvd and @mausamnyc today	1444319407	652148980642525184	f	mausamnyc
Curry Rush Thursday @dumbolot Great day for our savory flavors and bites http://t.co/zXwdDULhDY	1444305863	652092171219271681	f	mausamnyc
serving dinner 5-8pm  @Rooseveltisland http://t.co/uorON5l1sI	1444245560	651839240976863232	f	mausamnyc
@UptownLunch York Avenue between 70th & 71 Street delicious Indian curries & bites http://t.co/7EmDkUP42h	1444224486	651750850273128448	f	mausamnyc
serving dinner 5-8pm  @Rooseveltisland Delicious Indian cuisine http://t.co/RbgbBQ6QAB	1444161346	651486022447013888	f	mausamnyc
@UptownLunch  Curry King is back! York Avenue between 70th & 71 Street authentic Indian curries & bites http://t.co/65JoGGwSXP	1444136165	651380406432960512	f	mausamnyc
It's Monday! Yes we'll be serving dinner @Rooseveltisland http://t.co/brPw5szj5F	1444067483	651092333937754112	f	mausamnyc
RT @TheMeadowlands: NYC: @mausamnyc @gcnyc1 @CamionNYC @DeliNDogzTruck @KorillaBBQ @mactruckny @PontiRossiFood @Valduccis @USAFoodTruck htt...	1444067320	651091647305003008	f	mausamnyc
It's a beautiful sunny day @333 West 33rd Street between 8 & 9 Ave http://t.co/f97VdgaMvl	1444056335	651045572833615872	f	mausamnyc
Curry rush Thursday @dumbolot Great  day for our authentic savory spices http://t.co/8tQqVPbhes	1443702032	649559521304645632	f	mausamnyc
Join us for a tasty & warm lunch.\nAll quick and scratch made:)	1445962069	659038801252253696	f	etravaganza
Ay Jalisco!!\nNo te Rajes HurricanePatricia	1445649123	657726213507653632	f	etravaganza
RT @Bill_Nye_Tho__: the most powerful storm in history PrayForMexico HurricanePatricia https://t.co/GIajiDjOL1	1445649014	657725753447067652	f	etravaganza
Lunch is ready senores.!!\nHappy Friday :)	1445615934	657587008253112320	f	etravaganza
Pollo asado,carne asada golden crisp Quesadillas\nW/Choice of:\n-Mexican Rice.\n-Gluten free Tortilla chips.\n-Or Mescaline salad.\nA must try.	1445439762	656848089236557824	f	etravaganza
Good morning!\nDon't miss out the most important meal of the day.\nyou can call us for express pick up at 917-657-0987	1445432961	656819560742567937	f	etravaganza
Have you tried our pollo Asado platter??	1445270756	656139224484335616	f	etravaganza
Good morning \nlet's put a smile lots of energy and a delicious earthy breakfast,\nJoin us.the truck @ North east 52nd and Park.	1445256684	656080204587212800	f	etravaganza
TGIF!!\nlet's begin with delicious carne Asada tacos.\nDon't Forget!\nWe still serving breakfast until 2:00.	1445010792	655048856460206080	f	etravaganza
Lunch begins at 11:53am	1444751135	653959777832275970	f	etravaganza
Good morning!\npreparing a tasty selections of breakfast wraps!\nJoin us the truck is at North East 52nd and Park	1444740302	653914339259383808	f	etravaganza
Howdy.!! How about breakfast for lunch??	1444321194	652156472067911680	f	etravaganza
Hello, hello...\nPollo asado platter over Mexican rice & mescaline salad with sliced avocado.\nLet's do it!!	1444147466	651427805096452096	f	etravaganza
G morning!\nlet's start off the day with that beautiful smile,lots of energy and a delicious breakfast.join us.\nWe are at 52nd and Park.	1444137931	651387814244958208	f	etravaganza
Back to reality \nyour lunch is ready.\nsalad bowls, tacos ,burritos,quesadillas and more.\nHappy Monday.	1444061901	651068919634071552	f	etravaganza
happy Friday\nDelicious breakfast tacos & tasty selection of egg wraps\nJoin us.	1443788136	649920666251206656	f	etravaganza
G morning !\nHave you tried our classic Mexican authentic wrap??Chorizo egg and cheese on multigrain as well!?	1443703203	649564433581252608	f	etravaganza
Delicious Pollo asado tacos & carne asada awaits taco Tuesday.	1443630208	649258270490800128	f	etravaganza
G morning!!\n don't miss out your favorite breakfast. you can call us ahead for express pick up at 917-657-0987. We are @52nd and Park.	1443613346	649187544589053952	f	etravaganza
Have you tried our tasty lunch platter?	1443544339	648898108928208897	f	etravaganza
@leekypeeky glad you're enjoying	1446249157	660242938740531200	f	kettlecornnyc
Come try our flavors of the day\nBanana, Egg Nog, Pear, Salt & Vinegar \nWe are located at \n86th and Lexington... https://t.co/xz6llVHTIg	1446235976	660187651765624832	f	kettlecornnyc
@Babs726 see you soon 	1446216502	660105972476739584	f	kettlecornnyc
Good Morning Happy Friday \nWe are located at\n40th street and 6th avenue \nUntil 3:30 pm\nkettlecornnyc https://t.co/MXKRa5djcA	1446214181	660096237346136064	f	kettlecornnyc
Good Evening Upper West Side \nWe relocated to Columbus Avenue \nBetween 97th and 98th Street \nUntil 8:30 pm... https://t.co/p0nMz6abkq	1446150342	659828476099301378	f	kettlecornnyc
Good Afternoon Midtown \nWe are located at \n40th Street and 6th Avenue \nUntil 3:30 pm\nSee You Soon \nkettlecornnyc https://t.co/MOBdroD2D7	1446132787	659754844471754754	f	kettlecornnyc
@BlessedSunshine hope to see you soon 	1446128620	659737367805300736	f	kettlecornnyc
@BlessedSunshine yes, we will be back to 45th between 5th and 6th avenue on Monday. Today we are planning to be located at 40 & 6 ave.	1446128598	659737277271318528	f	kettlecornnyc
You guys @OzMovingNYC rock!!\nBig love from @KettleCornNYC	1446077360	659522369233494017	f	kettlecornnyc
https://t.co/TBadzIolOH	1446074197	659509102926778368	f	kettlecornnyc
realestatejen's photo https://t.co/92tw1ldabZ	1446039872	659365131994927104	f	kettlecornnyc
thepull's photo https://t.co/6mUknl47OK	1446039744	659364593408593921	f	kettlecornnyc
Due to bad weather we will be closed today	1446037842	659356618807754752	f	kettlecornnyc
Good Evening \nWe are located at \nLexington and 86th street \nUntil 8:30 pm\nkettlecornnyc https://t.co/HzTuR269wo	1445975945	659097000705695744	f	kettlecornnyc
@victorianesque we will be back to 40th and 6th on Thursday. Sorry for the misinformation.	1445968278	659064846227501056	f	kettlecornnyc
@victorianesque I'm sorry we will only be able to make it to our  evening location. We will be back tomorrow and we do take cards.	1445966408	659057000236609536	f	kettlecornnyc
We are having some repairs to our truck and we will only be able to make it to our evening location. We are sorry for the inconvenience.	1445965958	659055114619977728	f	kettlecornnyc
@ElyseSosin yes, we will have apple spice tomorrow. Tomorrow we will be located at 40 & 6 from 12-3:30pm. Lexington & 86 from 4-8:30pm.	1445907615	658810403951091713	f	kettlecornnyc
Good Evening NYC\nWe relocated to \n67th Street and Columbus Avenue\nUntil 8:30 pm\nkettlecornnyc https://t.co/PQyl5G464V	1445890732	658739594880524288	f	kettlecornnyc
Stop by and pick up a yummy fresh bag of Kettle Corn NYC.\nWe are located at \n40th Street \nBetween 5th and 6th... https://t.co/6MJlsCI1hc	1445881507	658700902749097984	f	kettlecornnyc
Fact: pizza makes any rainy day better nyceats https://t.co/ijIyCAEdRs	1446087384	659564411481399301	f	neaexpress
Reasons why @neaexpress 's NYC:\nthe skyline, the diversity, and of course, the pizza https://t.co/gomEB6SWwt https://t.co/OqaOJWUx1y	1445983220	659127515315834881	f	neaexpress
@NeaExpress by the East River wherehasyourpizzabeen https://t.co/SBv2NNhJkr	1445811287	658406378659295232	f	neaexpress
RT @_yungfresh718: 5 boxes down... Literally!! Thank you @NeaExpress  https://t.co/EqolB1wWPs	1445807379	658389986409074688	f	neaexpress
RT @JessLPerez: @ModelsWithMinds @NeaExpress the pizza was great!!!	1445612751	657573658181959680	f	neaexpress
RT @ModelsWithMinds: We are inspired!Thanks to @JessLPerez&Ashley Stetts for speaking to the MWM community last night&thanks @NeaExpress fo...	1445538817	657263553871749120	f	neaexpress
RT @FlikISDining: Thank you @foodbyflik for lunch today by @NeaExpress local organic nongmo yummo https://t.co/QJGkyxpGgI	1445538810	657263527397343232	f	neaexpress
Can't get enough of the Oro di Napoli pizza special at our Wall Street location eaaats https://t.co/umCGvZ8vBY https://t.co/tSdjikrnJK	1445365515	656536674298699776	f	neaexpress
RT @NYAMHistory: Lunchtime! Head to our cafe or visit @NeaExpress & @PolishCuisine outside. NYAMEats	1445101922	655431086453989377	f	neaexpress
Today's vibes in Union Square-giving out free pizza Photo credits to: @theknowitallsnyc http://t.co/nzSfoHgK5R http://t.co/fldgxWqryY	1444951699	654801002583822336	f	neaexpress
RT @ringol: @NeaExpress is giving out free pizza! Love working in Union Square!!	1444939316	654749063678562309	f	neaexpress
RT @greenboxny: A true necessity. @APPLEOFFIClAL, get on it.  pizza pizzalove emoji http://t.co/UvhV2X8tAW	1444939306	654749023312592896	f	neaexpress
Who knew there was a piece of the Berlin Wall in NYC? @neaexpress took a field trip there ... http://t.co/kK5XlWbtIU http://t.co/0gDJGCF7mr	1444769534	654036947225198592	f	neaexpress
@wondergiulio tasting a new recipe at @neaexpress today: https://t.co/gHg0UmNz3r goodeats organic pizzaofnyc	1444764822	654017183052374016	f	neaexpress
@Stephluva2711 We have another event scheduled for this weekend but we'd love to see you stop by our Wall Street or Harlem stores!	1444764367	654015277999489024	f	neaexpress
@NeaExpress is at @SetonHall today! Stop by to reclaimyourlunchbreak.	1444407938	652520302602289152	f	neaexpress
Guests at the Toys R Us National HQ event this past weekend had a chance to sample delicio... http://t.co/HzEhuMW6Jo http://t.co/CrgNKzH3vy	1444159433	651477996956700673	f	neaexpress
Today's truck is parked at @BlmfldCollegeNJ! Here's a few students grabbing a slice for lunch- http://t.co/BCudwkalWD	1444156980	651467711961284608	f	neaexpress
RT @NYAMHistory: Try organic pizza from the @NeaExpress truck at our 10/17 NYAMEats Festival. Register: http://t.co/5Y3UwFi5rX http://t.c...	1444156775	651466851915038721	f	neaexpress
We got an A...second time within 4 months...during a lunch rush...in the financial distric... http://t.co/barkHhkmWK http://t.co/t2sj8h1DNq	1444070091	651103272200179712	f	neaexpress
On east 54th between 2nd and third from 6 to 11 pm come on by. Better than ever!!!	1439939979	633780327887020032	f	grillonwheelsny
EVENTS EVENTS EVENTS!!!! SO MANY EVENTS!!! NOT SURE WHEN WE WILL GET BACK ON THE STREETS! WE HOPE TO SEE YOU SOON!!	1439234024	630819334923911168	f	grillonwheelsny
HEY ALTHOUGH WE MISS BEING OUT ON THE STREET WITH OUR AMAZING CUSTOMERS WE HAVE THANK GOD BEEN REALLY BUSY AT PRIVATE EVENTS!!! MISSING YOU!	1438877626	629324493907980288	f	grillonwheelsny
Happy Monday!! Special Private Event Today!!!! Hopefully we'll get back to the streets with our loyal amazing customers soon!!!	1438614193	628219577097408512	f	grillonwheelsny
Kasar truck is at 46th and 6th avenue\nUntil 7pm	1435324019	614419584662114305	f	chipsykingny
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
Find us on 52nd bw 6th & 7th today Happy Friday NYC midtown lunch	1446223248	660134268505559041	f	polishcuisine
52nd bw 6th & 7th ........OPEN AT 12 today!!!!! midtown lunch NYC	1446207666	660068911216517120	f	polishcuisine
We are STILL celebrating Polish American Heritage month October - 10% off on ALL catering orders! Let's make it... https://t.co/XyFcq2WK4b	1446149093	659823238873223169	f	polishcuisine
Open and Ready to ROLL on 47th b/w Park & Lexington HuntersStew special midtown lunch NYC	1446131783	659750634099376128	f	polishcuisine
oldtraditionalpolishcuisine lunch catering midtown https://t.co/yNx7VM36tg	1446120408	659702925615169536	f	polishcuisine
oldtraditionalpolishcuisine food truck nyc lunch midtown https://t.co/TzV1QJ6xJ1	1446120034	659701354294697984	f	polishcuisine
47 bw Park & Lexington today HuntersStew special midtown lunch nyc @nycfoodtruck	1446118899	659696593642258432	f	polishcuisine
Off the road today!!!!! Stay dry!	1446047972	659399106712829953	f	polishcuisine
oldtraditionalpolishcuisine kielbasa lunch catering midtown nyc https://t.co/0AhXn4kT2M	1445979159	659110482117156865	f	polishcuisine
oldtraditionalpolishcuisine perogi lunch catering nyc https://t.co/IFULNKfkvC	1445979064	659110084639768577	f	polishcuisine
oldtraditionalpolishcuisine food truck nyc https://t.co/Qsy8qB9Wnk	1445978836	659109128116113408	f	polishcuisine
oldtraditionalpolishcuisine kielbasa pierogi combo lunch nyc https://t.co/scK1TJIUY3	1445978760	659108808640327680	f	polishcuisine
47th b/w Park & Lexington - what a wonderful midtown lunch kind of day! NYC @nycfoodtruck @cheapeats	1445954866	659008591811096582	f	polishcuisine
oldtraditionalpolishcuisine kielbasa pierogi salad lunch nyc https://t.co/RXmgSNd0hU	1445952842	659000101365411840	f	polishcuisine
oldtraditionalpolishcuisine pierogi combo lunch https://t.co/ABOb2hMFqm	1445952691	658999469355220992	f	polishcuisine
oldtraditionalpolishcuisine pierogi lunch https://t.co/AONYDY1kbd	1445952617	658999158850875392	f	polishcuisine
oldtraditionalpolishcuisine salad lunch https://t.co/cwiLLLgkGR	1445952506	658998693471752192	f	polishcuisine
Find us on 47th bw Park & Lexington midtown lunch pierogitime	1445946928	658975294380871682	f	polishcuisine
We are STILL celebrating Polish American Heritage month October - 10% off on ALL catering orders! Let's make it... https://t.co/kINBzLfk9Q	1445884453	658713259155980288	f	polishcuisine
Open & ready to roll on 52nd b/w 6th & 7th!! traditional pierogitime @nycfoodtruck @midtownlunch midtown lunch	1445872174	658661754726166528	f	polishcuisine
Good morning we r open at king and hudson. Try our Korean BBQ -Beef pork shrimp and burritos . And we hav also veggie dumpling,tofu bowl thx	1443628196	649249829340741633	f	bobjotruck
Good morning NYC! We are open at king and Hudson st. Ready to serve Korean BBQ - beef,pork,shrimp and chicken rice bowl and burrito as well	1443539998	648879902171791360	f	bobjotruck
Good morning we r open @king and Hudson at. Try our Korean BBQ babe pork shrimp and BBQ burrito as well  plz stop by . Thank you	1443455229	648524351550193664	f	bobjotruck
Welcome Monday! We r open @ king& Hudson. Try our Korean BBQ - beef pork shrimp and chicken rice bowl. Plz come by and enjoy thank you !	1442850238	645986837216002048	f	bobjotruck
Morning NYC ! We r open @ king and Hudson st. Now . Plz stop by and enjoy Korean BBQ and chicken rice bowl and tofu rice bowl thank you	1442416966	644169562225831936	f	bobjotruck
Good morning ! We r open at 47th btween park and lex ave. try our Korean BBQ beef, pork,shrimp and chicken rice bowl and tofu. Plz come by:)	1442331924	643812871856631809	f	bobjotruck
Good morning ! We r open at king and Hudson st. Try our best Korean BBQ beef pork shrimp! And we Hav also chicken ,tofu rice bowl thank u	1442245632	643450934954225664	f	bobjotruck
Hello NYC! We r open at 47th st. Between park and lex Ave. try our best Korean BBQ beef pork shrimp ! Plz stop by and enjoy thank you	1441899356	641998551069904898	f	bobjotruck
Good morning ! We r open at 47th st. Btween park and lex ave. plZ come by and try our Korean BBQ rice bowl! Thank you	1441728198	641280659961548801	f	bobjotruck
Welcome friday! We r open at 5th ave . And 22nd st. Corner. Try our korean BBQ beef pork and chicken rice bowl as well thank you very much !	1441381993	639828570223865858	f	bobjotruck
RT @USDAFoodSafety: It's FoodSafety Education Month! This month we'll be featuring FSIS employees that contribute to our food safety missi...	1441208145	639099398002241536	f	bobjotruck
Good morning ! We r open at king and hudson st. Try our korean BBQ beef pork shrimp , and bbq burritos as well thank you	1441208078	639099118665736192	f	bobjotruck
Kasar truck is at 52nd and park avenue until 6pm	1435245717	614091163952254980	f	chipsykingny
Good morning we are open at 47 th st btween park and lex ave. try our korean BBQ beef(galbi)pork, shrimp. And spicy chicken bowl as well thx	1440603687	636564121278881792	f	bobjotruck
Good morning we r open at water and hanover sq. try our korean BBQ beef pork shrimp and we Hav also burritos and spicy chicken rice bowl thx	1440517754	636203689603133440	f	bobjotruck
Good morning !! We r open at king and Hudson ! Try our korean BBQ:galbi,pork,shrimp and we have also bbq burritos. Come by and enjoy thanx	1440084240	634385400493154304	f	bobjotruck
Welcome Monday ! We r open@king and Hudson at. Try our korean BBQ galbi,pork,chicken plZ stop by and enjoy thank you	1439825773	633301312889835520	f	bobjotruck
Welcome friday we t open @47th st. Btween park and lex ave. try our korean BBQ beef pork shrimp please come by and enjoy.	1439567098	632216349260029952	f	bobjotruck
Hello NYC we r open @ king and Hudson st. Try our korean BBQ beef pork shrimp and burritos and we have also spicy chicken rice bowl. Thx!!	1439478971	631846718863224833	f	bobjotruck
Good morning nyc we r open at 47th st btween park and lex ave! Thank you	1439395101	631494943199096832	f	bobjotruck
Welcome Monday!! We r open at king and Hudson st. Try out Korean BBQ-beef,pork,shrimp . And we have also tofu,dumpling 4 vegetarian	1439222334	630770304856530944	f	bobjotruck
erickmorillo yea... I AM ABOUT THIS CLOSE TO LEAVING TO MIAMI FOR SPACE!!!! SAFE TRAVELS BRO...SEE... https://t.co/Jygcvzh1pq	1446282241	660381700862713856	f	latinkitchennyc
Just posted a photo @ La Boom https://t.co/paZPde5Y8n	1446275395	660352985105592320	f	latinkitchennyc
erickmorillo is in the HOUSE!! @ La Boom https://t.co/nnwJ0dtIwD	1446274444	660348998725853184	f	latinkitchennyc
TONIGHT WE HERE!!!\nPRE HALLOWEEN PARTY || MASQUERADE THEMED || DRESS UP ENFORCED BUT NOT MANDATORY ||... https://t.co/3TeBqQak0Y	1446225616	660144197404647424	f	latinkitchennyc
SUNDAY NOV. 8TH 1PM-7PM\nNYC 1 \nSUNDAY DAY BRUNCH PARTY \nIN THE TRISTATE AREA\ndoncoqui.newrochelle \n2... https://t.co/Hdo8OVEjqO	1446224277	660138583408406528	f	latinkitchennyc
SUNDAY NOV.1ST 1PM-7PM\nNYC 1 \nSUNDAY DAY BRUNCH PARTY \nIN THE TRISTATE AREA\ndoncoqui.newrochelle \n2... https://t.co/UO6BYqGBHX	1446224217	660138331569840128	f	latinkitchennyc
Goodmorning Bronx NY! \nYea.. that the Sancocho!!!\nIT'S THURSDAY!!\nMI VIEJO SAN JUAN \n2920 BRUCKNER... https://t.co/UPccwV8QCS	1446218312	660113561537150976	f	latinkitchennyc
MI GENTE!!!!\nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX NY 10465\n347-691-3100\n(Today Friday... https://t.co/nPK1ReCIPv	1446218070	660112549871026176	f	latinkitchennyc
Get ready!!!!!\nWe are here!!!\nmadeinpuertoricobx \nLATIN KITCHEN REUNION!!! @ Made in PR Latin Cuisine https://t.co/W8eI6dtwYC	1446190922	659998681010192384	f	latinkitchennyc
GOD IS GOOD....\nTHIS PIECE OF DIRT IS OFF THE STREET!!!\nRIP JUNE!!! @ East 143rd Street  St. Mary's... https://t.co/iFlqsBpl5E	1446163734	659884645882978304	f	latinkitchennyc
SMART BALANCE WHEEL\n2016\n6.5 WHEEL\nLIMITED GOLD COLOR\nBLUETOOTH\n$550 FIRM (inbox me) @ New York, N.Y https://t.co/B7ggD9Xj6x	1446156649	659854929142657024	f	latinkitchennyc
MOFONGO Y CHURRASCO\nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX NY... https://t.co/xDe7S8kkMY	1446156190	659853004150059008	f	latinkitchennyc
WHAT WE GONNA DO RIGHT HERE IS GO BACK!!!!\nSAVE THE DATE....\nNEXT THURSDAY!!!\nTHURSDAY NOV.5TH... https://t.co/unB5EH9fJ7	1446155574	659850421259882496	f	latinkitchennyc
GOOD Afternoon   BRONX NY!!\nAUTHENTIC PUERTORICAN CUISINE \nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD... https://t.co/NTcpR90nx5	1446153220	659840547784368128	f	latinkitchennyc
MI GENTE!!!!\nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX NY 10465\n347-691-3100\n(we are open for... https://t.co/BP5yvpI7vW	1446149162	659823526984159234	f	latinkitchennyc
SUNDAY NOV. 8TH 1PM-7PM\nNYC 1 \nSUNDAY DAY BRUNCH PARTY \nIN THE TRISTATE AREA\ndoncoqui.newrochelle \n2... https://t.co/QBQCe6Clsl	1446140386	659786719479353344	f	latinkitchennyc
SUNDAY NOV.1ST 1PM-7PM\nNYC 1 \nSUNDAY DAY BRUNCH PARTY \nIN THE TRISTATE AREA\ndoncoqui.newrochelle \n2... https://t.co/DDmZ8N2Kvx	1446140171	659785814637977600	f	latinkitchennyc
THE HOTTEST ITEM FOR CHRISTMAS...GET THEM NOW..\nBRAND NEW SMART BALANCE WHEEL\n6.5  WHEEL\n\nLIMITED... https://t.co/uWnNwAwiQV	1446139860	659784511144796160	f	latinkitchennyc
AUTHENTIC PUERTORICAN AT ITS BEST! !\nIT'S  THURSDAY ! !\nTODAY THURSDAY  OCT.29TH\nWE ARE SERVING LUNCH... https://t.co/FuOSjVZkoy	1446125579	659724613010763776	f	latinkitchennyc
BRAND NEW\n6.5\nGOLD \nBLUETOOTH \n$550\n(inbox me)\nHOTTEST ITEM FOR XMAS GET IT NOW.. THEY WON'T BE... https://t.co/LLTEYTQejP	1446067996	659483093275942912	f	latinkitchennyc
Lunch 2day @ 7 Hanover sq b/t water & broad st. Burger of the week THE TEXAN. Preorder 9172929226 fidi	1446212894	660090837997613058	f	fritesnmeats
RT @DarrisM1: For Those Who Can't... by @DarrisM1 on @LinkedIn https://t.co/nHb3bsZWtH\n@LLSUSA @TNTNYC @NDSS @leukemiauk	1446207750	660069263487684608	f	fritesnmeats
@Relentless4Jack @DarrisM1 @TikiBarber @NDSS @leukaemiauk U R an amazing dude Jackson. Inspiration for all!	1446207709	660069090174877696	f	fritesnmeats
RT @Relentless4Jack: @DarrisM1 @Relentless4Jack Jackson's story shared the stage with some big names @TikiBarber @NDSS @leukaemiauk  http...	1446207638	660068792542863360	f	fritesnmeats
RT @DarrisM1: https://t.co/QT8NyI5qFv taking Jackson's story to a bigger stage 26.2 miles $43k for cancer research @LLSNYC  https://t.co/...	1446207597	660068620299575296	f	fritesnmeats
@DarrisM1 @LLSNYC congrats on this great accomplishment D! Good luck this Sunday!	1446207585	660068570739658752	f	fritesnmeats
Peeps, we are off the road today	1446131030	659747474110836736	f	fritesnmeats
Lunch 2day @ Hudson & King St. Burger of the week THE TEXAN preorder 9172929226 soho	1446040274	659366817060753408	f	fritesnmeats
Lunch 2day @ 10 Hanover sq b/t water & pearl st. Burger of the week THE TEXAN. Preorder 9172929226 fidi	1445953816	659004188526051328	f	fritesnmeats
Peeps, we are off the road 2day	1445865545	658633952060678144	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE PLOUGHMAN preorder 9172929226 fidi	1445607917	657553379909107712	f	fritesnmeats
Hello Brooklyn, lunch 2day @ front & jay st. Burger of the week THE PLOUGHMAN preorder 9172929226 dumbo	1445521772	657192063524564992	f	fritesnmeats
Lunch 2day @ Hudson & King. Burger of the week THE PLOUGHMAN preorder 9172929226 soho	1445435461	656830047521763328	f	fritesnmeats
RT @DarrisM1: 2 weeks til NYCMarathon! http://t.co/xIN9OAaEMX Almost $30K LLSUSA @TNTNYC LLSProof @leukaemiauk NYCMarathon  http://t.c...	1445428392	656800398922137600	f	fritesnmeats
RT @DarrisM1: Years later, and still taking the free ride around the park ... relentless4jack https://t.co/oQcuqIerU1	1445428368	656800296522358784	f	fritesnmeats
Lunch 2day @ 10 Hanover sq b/t water & pearl st. Burger of the week THE PLOUGHMAN. Preorder 9172929226 fidi	1445348365	656464742991687680	f	fritesnmeats
Peeps, we are off the road 2day	1445261339	656099728023769088	f	fritesnmeats
@Under_aRmur not on the road 2day bud:( happy birthday!	1445261305	656099583706140672	f	fritesnmeats
Have a good weekend peeps!  Still working on 483GrandSt. Hope to have more updates soon.	1445023163	655100745096777732	f	fritesnmeats
RT @markh314: @fritesnmeats make sure u all check out their bar/rest. Coming soon to Brooklyn 483 Grand. bestburger killerfries http://t....	1445021033	655091809618698240	f	fritesnmeats
We are in the @AmericanExpress cafeteria @BrookfieldPLNY 1130-230! thaietnamese spicy sriracha amex	1446132357	659753043777470464	f	sweetchilinyc
humpdaymotivation is on broadway btw houston & bleeker till 3! rainraingoaway dont worry we are under an awning! staydry pre order !!!	1446046369	659392381607911424	f	sweetchilinyc
Head over to the @dumbolot jay & water for some sweet heat! thaietnamese 1130-3 spicy sriracha fries pork vegan chicken tofu	1445956553	659015666129879040	f	sweetchilinyc
RT @hungrypatriot: Hungry kids cant wait. Call Congress at 1-877-752-6479 today to end summer hunger w/ strong CNR2015. NoKidHungry http...	1445882183	658703735842062336	f	sweetchilinyc
Looking for some mondaymotivation?  Head over to the American Express Tower Brookfield Place New York and grab... https://t.co/9Ox4NCLdx9	1445867733	658643129394970624	f	sweetchilinyc
mondaymotivation we are in the @AmericanExpress cafeteria @BrookfieldPLNY 1130-230! Get motivated! amex thaietnamese HappyMonday	1445867406	658641756699926528	f	sweetchilinyc
Come uptown and grab some food, beer and music!  We are at the @vendyplaza till 6 with sriracha fries and hot... https://t.co/n4BICeR7Ka	1445793303	658330945322360833	f	sweetchilinyc
Head uptown and grab snacks including our sriracha fries @vendyawards @vendyplaza vendyplaza 12-6! https://t.co/dMS8KXYG2C	1445787459	658306436351528960	f	sweetchilinyc
We will be at vendyplaza @vendyawards tomorrow 12-6 with sriracha fries & hot vietnamese coffee! thaietnamese SundayFunday	1445726042	658048834178818049	f	sweetchilinyc
Get your vegan tofu with the vegan dressing (just ask!) @dumbolot jay & water 1130-3! vegetarian @... https://t.co/9sIptxFWVF	1445612453	657572405968134144	f	sweetchilinyc
TGIF we are @dumbolot jay & water 1130-3 with hot Vietnamese coffee! thaietnamese spicy chef brooklyn Sriracha fries	1445611472	657568291381256192	f	sweetchilinyc
@vendyplaza see you there sunday 12-6! Sriracha fries	1445603407	657534465724563456	f	sweetchilinyc
We are in the amex cafeteria @AmericanExpress @BrookfieldPLNY 1130-2 today!  thaietnamese spicy chef	1445527553	657216310892457984	f	sweetchilinyc
Looking for humpdaymotivation? ? Come to broadway btw houston & bleeker 1130-3 and get your sweet heat on! thaietnamese spicy chef	1445433561	656822081057898496	f	sweetchilinyc
Happy Tuesday brooklyn we are @dumbolot jay & water 1130-3 today! hotcoffee vietnamesecoffee thaietnamese foodtrucks	1445354624	656490993362051072	f	sweetchilinyc
RT @TheMuppetsABC: That can't miss karaoke night deserves another look and another listen! TheMuppets\nhttps://t.co/gRxTTXWOVE	1445299186	656258471004872704	f	sweetchilinyc
Serving up lunch till 2pm! cafeteria http://t.co/173LpcspIV	1445268875	656131335464034304	f	sweetchilinyc
Happy monday MondayMotivation we are at amex cafeteria till 2! thaietnamese @ 200 Vesey Street https://t.co/0WHJFg0gea	1445268622	656130276037300224	f	sweetchilinyc
HappyMonday we are in the amex cafeteria @AmericanExpress @BrookfieldPLNY 1130-2!	1445263905	656110491685756928	f	sweetchilinyc
We are hanging out in Williamsburg on lorimer & meeker listening to great music with great food! thaietnamese	1445099814	655422243007299584	f	sweetchilinyc
Happy Friday.  We are on 47th & Park today.	1446219469	660118415303180289	f	schnitznthings
Hey guys We are on 26th street West side to 11th ave	1446132742	659754657955360768	f	schnitznthings
We are on 47th & Park today	1446048135	659399788526465024	f	schnitznthings
Hey guys, We are on 52nd & 6th today.	1445963719	659045723145674752	f	schnitznthings
Spend this halloween @lowlands bar with schnitzelandthings in parkslope brooklyn!!\nWith dj treetop!\n9pm! https://t.co/qYuNA74Vtr	1445911830	658828084167233536	f	schnitznthings
Lunch time! We are on 47th & Park.	1445874119	658669912001499136	f	schnitznthings
Happy Friday Schnitzlers, we are on Pearl & Broad today.	1445615185	657583863493971968	f	schnitznthings
Schnitzel for lunch! Come by we are on 26th street West side to 11th ave today	1445528360	657219693686730752	f	schnitznthings
Hey Schnitzlers we are on 52nd & 6th Ave today.	1445443306	656862951966642176	f	schnitznthings
Hi guys. We are on 47th & Park.	1445355833	656496062555947008	f	schnitznthings
Schnitzel for lunch!  We are on 47th & Park.	1445271865	656143875468361729	f	schnitznthings
Happy Friday Schnitzlers,  we are on 47th & Park today.	1445009416	655043088075870208	f	schnitznthings
We have bratwurst today!	1444925096	654689422235992064	f	schnitznthings
Hey guys, we are on 26th street, West side to 11th ave today.	1444922997	654680616697401345	f	schnitznthings
Hey Schnitzlers we are on 47th & Park today	1444838280	654325289565163520	f	schnitznthings
Come by for your Schnitzel lunch. We are on 52nd & 6th today	1444751817	653962637290680320	f	schnitznthings
RT @Mets: Want to go to tonight's game? Retweet this for your chance to win a pair of tickets.	1444742796	653924800474312704	f	schnitznthings
Hey guys, we are on 47th & Park today.	1444663939	653594050470248448	f	schnitznthings
Schnitzel for lunch!  We are on 47th & Park today.	1444403524	652501792605999104	f	schnitznthings
Come get your Schnitzel, we are on 52nd & 6th ave today.	1444316576	652137105305432064	f	schnitznthings
For one free dinges, order your wafel like your favorite comedian! dingesforeveryone	1446212343	660088526562828290	f	waffletruck
Wafels for champions! RunWithHart HustleHart NikeNYC dingesforeverone https://t.co/UZmNJOEPce	1446212153	660087730639122436	f	waffletruck
Honored to bring Belgian Breakfast to fuel runners of today's @NikeNYC 5K w/@KevinHart4real! RunWithHart NRC https://t.co/M80PrBXkaL	1446210353	660080180032073729	f	waffletruck
De CARTS: [2/2]\nVedette @ 60th & 5th Ave (Manhattan, at the Central Park Entrance) til 7pm	1446209882	660078203428556800	f	waffletruck
THANK DINGES IT'S FRIDAY\nLe Cafe @ 15 Ave B til 11pm\nWafel Cabana @ 35th & Broadway til 10pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1446209416	660076249142968320	f	waffletruck
De CARTS: [1/2]\nGoesting @ 66th & Broadway til 10pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm	1446209410	660076226938294272	f	waffletruck
De Goesting cart is slinging wafels today @ Lincoln Center- 62nd St &  Broadway,  8:30AM-9:00PM dingesforeveryone https://t.co/xcoECEkXYA	1446208511	660072454694559744	f	waffletruck
Serving Grand Central with big Kastaar at E 40th Street and Park Ave New York From 8:30AM-4:00PM dingesforeveryone https://t.co/NMGJ6xth4u	1446206710	660064903177355268	f	waffletruck
Dinges Challenger MC @beanieanita thanks for being a great sport! Head to FB for de full video! dingesforeveryone https://t.co/8MtgiKZrpF	1446161951	659877167170461696	f	waffletruck
Thanks to @secret__nyc for listing us as one of the top 10 trucks to eat at https://t.co/1jUIBbnYMC	1442435306	644246487954759680	f	papayakingtruck
De Belgians & TeamDinges are here & we're hungry for gold!  herculean dingesforeveryone @HerculesTrophy https://t.co/MYc06CYQwU	1446147538	659816716562771969	f	waffletruck
2015 @HerculesTrophy LET THE GAMES BEGIN! Cheer on our team from all distances tweet words of encouragement using herculean teamdinges!	1446137113	659772989844692993	f	waffletruck
For one free dinges: Order your wafel in rhyme with a 10 sec rap, freestyles may get a fist bump too! dingesforeveryone	1446136447	659770196383678464	f	waffletruck
Proud to be a sponsor to this year's @HerculesTrophy at Liberty State Park, NJ! Cheer your favorite teams to glory! https://t.co/r86iDjQnTg	1446135636	659766794664701953	f	waffletruck
De TRUCKS:\nMomma Truck @ Liberty State Park til TBD\nKastaar @ QUEENS COLLEGE (Kissena Blvd & 64th St) til 10pm	1446134472	659761912822038528	f	waffletruck
De CARTS: [2-2]\nVedette @ 60th & 5th Ave (Manhattan) til 7pm\nBierbeek @ De Great Lawn, Central Park til 7pm	1446133863	659759360739024898	f	waffletruck
De CARTS: [1-2]\nGoesting @ 66th & Broadway til 10pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm	1446129420	659740722715885568	f	waffletruck
De Goesting cart is slinging wafels today @ Lincoln Center- 62nd St &  Broadway,  8:30AM-9:00PM dingesforeveryone https://t.co/xcoECEkXYA	1446122111	659710066854109184	f	waffletruck
THATS MY DINGES THURSDAY\nLe Cafe @ 15 Ave B til 11pm\nWafel Cabana @ 35th & Broadway til 10pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1446120308	659702504259723265	f	waffletruck
Happy NationalChocolateDay! Question...Marshmallows or Whipped Cream on that Belgian Hot Cocoa? dingesforeveryone https://t.co/xjlaMZiWev	1446072796	659503224215445505	f	waffletruck
For one free dinges: If you could see any planet up close & personal, which planet would it be? dingesforeveryone	1446043220	659379175896326144	f	waffletruck
RT @Jordanleequinn: .@KorillaBBQ before NYC Craft Beer Fest with @xStylezx  https://t.co/i1x3O8JW0C	1446255399	660269119187623936	f	korillabbq
FF Top nycfoodies @foodbabyny onehungryjew skinnypignyc @jackieeaa! \n\nShare your photos for a... https://t.co/db5SqluuZJ	1446231261	660167877379629057	f	korillabbq
Midtown!!! Find us today @48th & Lex ready by 12!	1446219975	660120538740891652	f	korillabbq
RT @Mike_Haracz: FF @ddogsbbq @BBQPitmasters @bbqsaucereviews @BBQPitchman @BBQsnob @KorillaBBQ @BBQNYC @FranklinBbq @bbqfranklin @jacksta...	1446206163	660062606644891648	f	korillabbq
RT @ybny: Today it's @korillabbq ! | @Caviar brings the best restaurants to you-Sign up&get $5 off your 1st order in Manhattan https://t.co...	1446206153	660062565347803136	f	korillabbq
Lunch today at Metrotech!! (Myrtle & Lawrence) 	1446133030	659755862991446016	f	korillabbq
RT @JackieeAA: Check out https://t.co/YjISxvFz6w on NYC Grab & Go page for what's GlutenFree at @KorillaBBQ !! tofu beets yams https://...	1446051447	659413680992464896	f	korillabbq
RT @kerbstop: @KorillaBBQ you are our first US tweet. Please join us and spread the word. https://t.co/Ng4nphFkPB street food ordering app	1446051440	659413653557530624	f	korillabbq
Lunch today at FiDi! 	1446048392	659400865263042560	f	korillabbq
Now serving 47th and Park!! Catch us closer to Lexington today.	1445961576	659036735200972800	f	korillabbq
Now serving at 47th & Park!!	1445876780	658681074982264832	f	korillabbq
RT @KimchiSmoke: 13 Meat Cooking Tips to Up Your Chef Game @Thrillist  https://t.co/G9PrwG0NnQ  \n@maangchi @KorillaBBQ @mokbar_nyc @KimchiT...	1445818862	658438147479576577	f	korillabbq
RT @richcastle66: absolutely fantastic meal at @korillabbq with my love @cup_coffeehouse crack not whack in the... https://t.co/eS8rR3XtBw	1445818836	658438039677616128	f	korillabbq
Best Hangover Cure.  Bulgogi Breakfast Burrito Bowl with fixings and fried egg.  soyolked... https://t.co/WsPI8EaML3	1445699430	657937214186344449	f	korillabbq
47th & Park ready by 12	1445615313	657584403284140033	f	korillabbq
Rice, rice, baby! Choose from three varieties to use as your base for your burrito or bowl! \n1.... https://t.co/i2R3Y5TdAN	1445540920	657272377437458432	f	korillabbq
@runlikeagrl Happy Birthday! Glad to have you celebrating with us!	1445534474	657245339129368577	f	korillabbq
RT @runlikeagrl: On your birthday, calories don't count. So @KorillaBBQ for lunch it is!	1445534449	657245234468884481	f	korillabbq
RT @StuyvesantHigh: The Stuyvesant High School Daily is out! https://t.co/e8N2z8qxod Stories via @SunPanther @KorillaBBQ @JessicaValenti	1445534435	657245176826589184	f	korillabbq
Lunch today at Metrotech!! Myrtle & Lawrence!!	1445527456	657215903847817216	f	korillabbq
BigRed is catering a private event today. We're open at BwayBites and SeaportSmorg with lobster and libations! https://t.co/HolMlX3SG8	1446220993	660124809116983297	f	lobstertruckny
We're on @TryCaviarNYC FastBite delivering fresh lobster rolls and chips for $15 in 15 minutes or less! Caviar https://t.co/SRJ6KDlCNU	1446134432	659761744320032768	f	lobstertruckny
BigRed is off the streets but we're serving up Lobster BLTs at SeaportSmorg! Open 11am-8pm until the 31st https://t.co/3otgQb2DWz	1446129023	659739056515981312	f	lobstertruckny
Avoid the rain. We're on @TryCaviarNYC delivering lobsterlunch to Brooklyn and Manhattan! https://t.co/BWdCpsX2fz https://t.co/KpaiIdycPZ	1446052800	659419354610708484	f	lobstertruckny
BigRed is catering a private party today. Get yourself some lobster and sunshine at BwayBites! Open daily 11am-9pm https://t.co/2rxg4JFEpw	1445958037	659021891731111940	f	lobstertruckny
BigRed is off the streets today. Grab a roll at SeaportSmorg for the last week! Open daily until 8pm thru Oct 31st https://t.co/ayoU7uudRK	1445870567	658655016195067904	f	lobstertruckny
BigRed is off to day 1 of RockTheBBQ in Hoboken. Catch her rockin & (lobster) rollin next to Chimney Cake Factory https://t.co/mtlxMat6QL	1445697093	657927410827010048	f	lobstertruckny
Never too late for a little lobsterlunch. BigRed is serving em up on 46th and 6th! https://t.co/GgitIIblB4	1445621340	657609680475262977	f	lobstertruckny
Happy Friday New York! BigRed is bringing lobster and sunshine to the corner of 46th and 6th today https://t.co/fobdpYRz1Z	1445611002	657566321350213632	f	lobstertruckny
We're delivering to you Brooklyn! Check out RHLP on @TryCaviarNYC for lobsterdelivery https://t.co/NUsX0hBbIu https://t.co/7FrGiezMr6	1445535027	657247658139078656	f	lobstertruckny
BigRed is working a private event today. Grab your lobsterlunch at GarmentDistrict, open until 9pm through Sat! https://t.co/SNiAzBNNYT	1445524223	657202343365222401	f	lobstertruckny
Catch BigRed at Hoboken's RockTheBBQ Festival this weekend alongside award winning BBQ Pit Masters! surfandturf https://t.co/M582JGLtmt	1445458100	656925004928581632	f	lobstertruckny
BigRed is catering today but we've still got your lobsterlunch covered. Order UberEats for $15 meals in 15 mins! https://t.co/Ru4pPKX1wH	1445349637	656470078469361664	f	lobstertruckny
RedHookLobster is back on UberEATS tomorrow! $15 lobster rolls delivered in 15 minutes https://t.co/lwwDxvaw0d https://t.co/gkp3wQ1eGB	1445279425	656175585442582529	f	lobstertruckny
This weekend BigRed is heading to Hoboken to rock and roll at RockTheBBQ! Get tickets here http://t.co/h5yteKYBgC http://t.co/TxtPDlYN4I	1445270458	656137977651924994	f	lobstertruckny
BigRed is off the streets today. Warm up with some creamy, old fashioned New England clam chowdah at BwayBites http://t.co/OXdtSxK66w	1445265034	656115227747090432	f	lobstertruckny
Are you a wine enthusiast who enjoys lobster? BigRed will be at Laurita Winery tonight http://t.co/lUiMtWwYVi http://t.co/DIcW6yK7OC	1445196690	655828571450163200	f	lobstertruckny
BigRed will be serving lobster rolls at the Laurita Winery in NJ. Be enthusiastic! http://t.co/4OD3y4iucl http://t.co/xzOIi05vLH	1445175323	655738950317920256	f	lobstertruckny
This will be the view from BigRed at Laurita Winery during sunset at the food truck festival http://t.co/1jMSw6a5Fi http://t.co/QsZCCCQLie	1445110275	655466118723825664	f	lobstertruckny
This weekend in NJ, BigRed, fireworks, bonfires, lobster and wine! http://t.co/kAQjSsJ01i http://t.co/ErU8KnwN7H	1445088678	655375533669249024	f	lobstertruckny
Thank you @TimeOutNewYork for naming our signature Maple Grilled Cheese on of the top 100 dishes in NYC! https://t.co/E57YUrzKEB?ssr=true	1446125162	659722864401244161	f	snowdaytruck
RT @TimeOutNewYork: The 100 best dishes and drinks in NYC 2015 (yes, our food critics tried every one of these): https://t.co/61JLcT1mcE ht...	1446125120	659722689003839488	f	snowdaytruck
@sarikamin @WassailNYC @dirtcandy @Missionstfood @TimeOutNewYork awesome !!	1446092380	659585365263650816	f	snowdaytruck
@randallsisland we had a blast!	1445874011	658669458941214720	f	snowdaytruck
RT @carodjames: That's my sandwich. It was amazing. If you don't know about @SnowdayTruck geteducated turnredlightsgreen https://t.co/F30...	1445873998	658669404654301184	f	snowdaytruck
The @randallsisland Harvest Festival is TOMORROW!!!! See you there!!	1445604732	657540022632128512	f	snowdaytruck
Head of lettuce https://t.co/Nn2RnRUNI0	1445298193	656254303645126656	f	snowdaytruck
RT @hertzny: STAND UP SPEAK OUT re:Youth in Prison, solitaryconfinement Tuesday 10/20, Foley Sq, noon @JohnJayPRI  @SnowdayTruck http://t....	1445253674	656067579052716032	f	snowdaytruck
At grand army till 4pm - serving up seasonally inspired rustic cuisine and as always a side of social justice http://t.co/duQlnVgHJv	1445183179	655771901831303168	f	snowdaytruck
Fall lunch feel goods at the @prospect_park foodtruckrally - we are there from 11-4pm w/ our award winning rustic seasonal cuisine	1445177457	655747902967558144	f	snowdaytruck
It's the LAST @prospect_park foodtruckrally this Sunday at Grand Army Plaza - who's joining us???!	1444931411	654715909886504960	f	snowdaytruck
This weeks HAPPENINGS: today @RoyalPalmsClub 6pm on; Sat @RBC Race for the Kids @YouthInc_NYC; Sunday Grand Army Food Truck Rally!	1444931379	654715773617766400	f	snowdaytruck
RT @Wes_engage: Ever wanted to hear @wesleyan_u President @mroth78 speak at a conference about social change? Check out WesImpact: http://...	1444842207	654341759854641153	f	snowdaytruck
RT @CC4Y: Justice is what LOVE looks like in public. What would our system look like if it really LOVED young people? @Clintonlacey18	1444842171	654341608280821760	f	snowdaytruck
WHO WORE IT BEST???? Our new @DriveChangeNYC hats are in. Get yours. http://t.co/DhX3J0ZhS1	1444826698	654276710108692480	f	snowdaytruck
RT @CivilEats: Former Black Panther Launches Oakland Urban Farm to Give Ex-Prisoners a Fresh Start http://t.co/0bA8Y8k3NZ http://t.co/2IHUQ...	1444566837	653186774764617728	f	snowdaytruck
RT @YouthInc_NYC: Can't wait to see @DriveChangeNYC and @SnowdayTruck at RBCRace4theKids next week!	1444334636	652212853756325888	f	snowdaytruck
RT @randallsisland: Save the date for our Harvest Festival 10/24 frm 12-4! Join us & @PatchJD @SnowdayTruck @TextileArtCent. Fields 62-63 h...	1444334628	652212819014889472	f	snowdaytruck
We're excited to serve our farm fresh food to all the runners of the @RunRocknRoll 1/2 marathon today and tomorrow in greenpoint	1444305596	652091052589981697	f	snowdaytruck
@hulloteanjam @RoyalPalmsClub we are going to be at the rock and roll half marathon tomorrow, back at RP 10/15	1444271605	651948480508895232	f	snowdaytruck
RT @Papaya_King: 	1445632304	657655667986182144	f	papayakingtruck
Tomorrow is the Prospect Park halloween haunted walk & fair!\n@prospect_park https://t.co/qxEA4ChJiV brooklyn https://t.co/hJq7lXH2kA	1445620574	657606468653445120	f	papayakingtruck
The Prospect Park halloween haunted walk & fair is this wknd 10/24.\n@prospect_park https://t.co/b6HjdkIy2S https://t.co/x6HL3vZKln	1445537757	657259110031884288	f	papayakingtruck
Join us tomorrow at the Top Dog competition @NYCWFF on 10/17! Benefiting @FoodBank4NYC & @nokidhungry http://t.co/lnddiA2aFO	1445032551	655140121147232256	f	papayakingtruck
Join us tomorrow at the Top Dog competition @NYCWFF on 10/17! Benefiting @FoodBank4NYC & @nokidhungry http://t.co/r66FFiIR47	1445021464	655093620886872064	f	papayakingtruck
Thanks to @livefastgroup and @centerplate we will be vending @NY_Comic_Con today at the @javitscenter NYCC NYC	1444591530	653290344298233856	f	papayakingtruck
Thanks to @livefastgroup and @centerplate we will be vending @NY_Comic_Con from this Thursday through Sunday at the @javitscenter NYCC NYC	1444317384	652140494802149377	f	papayakingtruck
Thanks to @livefastgroup and @centerplate we will be vending @NY_Comic_Con from this Thursday through Sunday at the @javitscenter NYCC NYC	1444231911	651781994259566592	f	papayakingtruck
Thanks to @livefastgroup and @centerplate we will be vending @NY_Comic_Con from this Thursday though Sunday at the @javitscenter NYCC NYC	1444164389	651498784015446016	f	papayakingtruck
Want to work for The King? Apply here: http://t.co/pu94FMjOVc	1443448519	648496207791325184	f	papayakingtruck
RT @ManTripping: Amazing lunch! @PapayaKingTruck MAKEcation http://t.co/uqcXy3rgIf	1443448500	648496128095338496	f	papayakingtruck
Are you joining us today at BKPour? Serving our world famous franks & tropical drinks BKExpoCenter @villagevoice http://t.co/y8SZvaEoZ7	1443282358	647799278262460416	f	papayakingtruck
We will be at @villagevoice's BKPour event on 9/26 serving our world famous franks & tropical drinks BKExpoCenter http://t.co/Pg1BHY0ONH	1442866561	646055302236905473	f	papayakingtruck
Join us at @prospect_park FoodTruckRally today 8/30, 11a-5p @dispatchny http://t.co/zDSymLPSf9	1442765933	645633238426382336	f	papayakingtruck
Who is at the @NYCBrewers Blocktoberfest today? - We are here serving our world famous franks and tropicaldrinks http://t.co/hgKBc0gTtx	1442682185	645281971158036480	f	papayakingtruck
.@gotardbk @NYCBrewers congrats on winning. Have fun!	1442595481	644918307016065024	f	papayakingtruck
We will be at @villagevoice's BKPour event on 9/26 serving our world famous franks & tropical drinks BKExpoCenter http://t.co/3hGUFwgXMo	1442506574	644545406219735040	f	papayakingtruck
Today is the last day to enter our ticket giveaway @NYCBrewers Blocktoberfest Enter: http://t.co/RyefarpuPs beer http://t.co/th8CjMJj8G	1442502669	644529025285795841	f	papayakingtruck
Happy Friday from 53rd & Park!	1444999738	655002494398025728	f	biandangnyc
Join us at @prospect_park FoodTruckRally this SUNDAY 9/20, 11a-5p @dispatchny	1442430389	644225864423616512	f	papayakingtruck
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
RT @NYOwls: YES, we'll be @ShortysNYC on Madison tomorrow night! Game watch. BeatNotreDame WeTheT BeTheT Wear cherry + white! https://t....	1446227314	660151318573678593	f	shortysnyc
RT @TeamBarFinder: Just Added: @shortysnyc (Hell's Kitchen) The NYC Eagles fans home away from Philly to watch the Eagles play on TV. http...	1446174632	659930357039538177	f	shortysnyc
RT @TeamBarFinder: Newly Added: @shortysnyc (Upper East Side) Another location for eagles fans to gather & watch the game. https://t.co/Or...	1446174611	659930270183915521	f	shortysnyc
@TeamBarFinder Thanks for the support. Join us for a cheesesteak sometime FlyEaglesFly	1446137017	659772586918825984	f	shortysnyc
RT @TeamBarFinder: Just Added: @shortysnyc Flatiron (NOMAD) The spot for NYC eagles & Temple fans to watch their teams on TV. https://t.c...	1446136979	659772429523361792	f	shortysnyc
@TeamBarFinder all are Eagles bars 9th ave, Madison Ave, UES show all Eagles games with sound, Shorty's Pearl St only games on local TV	1446087032	659562933886828544	f	shortysnyc
@TeamBarFinder @NYOwls temple alumni have hosted game watch parties at our Madison Ave location -- next party this Saturday Owls vs ND	1446086908	659562413122068480	f	shortysnyc
RT @ConeyIslandBeer: Join us for $6 pints and $15 pitchers tonight at @shortysnyc and during all baseball playoff games this week!	1446086777	659561865190723584	f	shortysnyc
World Series Game 2 Game Sound at all Shorty's NYC locations	1446075037	659512626255372288	f	shortysnyc
RT @NYOwls: @GoodandPlenty24 we will be back at @ShortysNYC on Madison Ave. @Temple_FB game watch this week. BeatND	1446069010	659487344882548736	f	shortysnyc
WorldSeries Game2 GameSound ALL Shorty's locations @shortysnyc	1446065136	659471095536447488	f	shortysnyc
@GrubHub orders from outside of the delivery zone coming through to ShortysFlatIron -- help!	1445991378	659161731680333824	f	shortysnyc
RT @ConeyIslandBeer: Join us tomorrow night @ShortysNYC for pint specials, schwag and playoff baseball! https://t.co/WkKASnmq05	1445991347	659161603510804480	f	shortysnyc
World Series Game 1 -- Game Sound tonight at all @shortysnyc locations https://t.co/gSaX2POcPF	1445973569	659087037446926337	f	shortysnyc
RT @jet2er: @shortysnyc Ninth Ave. Real cool place.	1445877066	658682275241046016	f	shortysnyc
Order Online & receive 10% off your first delivery order @shortysnyc ShortysNyc ShortysApp Nyc Philly https://t.co/hA3AcSVyJX	1445876808	658681191395172352	f	shortysnyc
@DisgustedNYer you know Jim? You got a name?	1445833728	658500502007758848	f	shortysnyc
30min til kickoff FlyEaglesFly Shorty's NYC https://t.co/arD5VRUJaV	1445817478	658432341765812224	f	shortysnyc
Count down til kickoff @Eagles SNF NFL ShortysNyc SundaysAtShortys https://t.co/JxLm5uEXTp	1445810334	658402378446741505	f	shortysnyc
@shortysnyc @Zagat 2016 Nyc NycEats NycFood Restaurants Cheesesteaks Hoagies GetPhillyWitIt https://t.co/bVmzIJaPLw	1445793696	658332595709718528	f	shortysnyc
30 mins left to get your biandang fix until next year!!!!	1446228341	660155630146215936	f	biandangnyc
LAST DAY FOR BIANDANG! It's been a pleasure serving you New York, catch us on 53rd & Park for the last day of the season!	1446213252	660092338358865921	f	biandangnyc
53rd & Park to round out the week! Swing by for your last chance to get some good Taiwanesefood this food truck season!	1446125730	659725244765241344	f	biandangnyc
Correction: we'll be at the @dumbolot on Jay & Water today DUMBO Brooklyn	1446041098	659370274501107712	f	biandangnyc
53rd and park today, catch us before our last day on Friday!	1446040981	659369784920829952	f	biandangnyc
Old Slip and Water.  This will be our last week out on the street!!! See y'all next year! 	1445953283	659001951477215232	f	biandangnyc
Bian Dang, one of 10 awesome Asian food trucks https://t.co/BQX8geTpkq	1445885840	658719076018233344	f	biandangnyc
52nd and 6th today!!	1445867751	658643204842110976	f	biandangnyc
Happy Friday from 53rd & Park!	1445608514	657555886559350784	f	biandangnyc
Beautiful Thursday on 53rd & Park!	1445524930	657205307949514752	f	biandangnyc
47th and park humpdaywednesday	1445438032	656840832193024001	f	biandangnyc
Get yourself a bian dang on Old Slip & Water!	1445348858	656466807193137152	f	biandangnyc
October 31st is our last day out for the year. Catch us while you can! 	1445346357	656456319994429442	f	biandangnyc
Catch us up on 50th & 6th today!	1445261216	656099210547216384	f	biandangnyc
October 30th will be our last day on the streets for the year. Catch us while you can! 	1444925207	654689886700593153	f	biandangnyc
Catch us on 53rd & Park today!	1444921856	654675831877332992	f	biandangnyc
Jay and Water for lunch today! @dumbofoodtrucks @dumbonyc @dumbolot	1444830034	654290702604480512	f	biandangnyc
Tomorrow, 10/14, we'll be serving lunch in @dumbonyc @dumbolot Jay and Water!	1444776733	654067144448176128	f	biandangnyc
In FiDi todaycon the north side on Old Slip & Water!	1444740681	653915928107683840	f	biandangnyc
RT @prateekrungta: @MexicoBlvd :( so sad to see you guys pack it up. Good luck and thanks for the tacos!	1446270126	660330887570157569	f	mexicoblvd
RT @joannaarogerss: @MexicoBlvd thank you for feeding me every Friday in midtown. My heart definitely broke today. Hopefully you'll be able...	1446242921	660216779822747650	f	mexicoblvd
RT @joannaarogerss: @MexicoBlvd the best flautas I've ever had! My favorite food truck in all of NYC	1446242901	660216696611934208	f	mexicoblvd
RT @JWAugustine: @MexicoBlvd oh no!!! What am I going to do on Weds now?? Forget the truck, get a booth at UrbanSpace on Vandy!!!	1446232684	660173845555503104	f	mexicoblvd
RT @brian_riback: @NormanKerft @MexicoBlvd OH NO!!!	1446232674	660173801674686464	f	mexicoblvd
RT @BubblinBrown99: @MexicoBlvd Noooooooo!  My Wednesdays will never be the same. I love you. I will come to Astoria.	1446232668	660173778832531458	f	mexicoblvd
RT @kikimeister1: @MexicoBlvd after today I'm going to instate a private function in midtown every Friday - will u bring me tacos then????	1446232655	660173723341844480	f	mexicoblvd
RT @steveeatsnyc: That's is unfortunate... https://t.co/aAfY1tdVKL	1446232618	660173565443076096	f	mexicoblvd
RT @elvainadine: @MexicoBlvd I just read this tweet out loud to my co-workers and everyone turned around and said, Nooooooooo! WSJ video ...	1446229087	660158756404248576	f	mexicoblvd
RT @kikimeister1: @MexicoBlvd I thought we would get a chance to say goodbye!!! (Where are you now that I need you? @justinbieber )	1446229067	660158673864511488	f	mexicoblvd
RT @YsabelESegura: @MexicoBlvd Whyyy?! ..feels like i just got dumped. We will miss you guys at WSJ! I guess i'll just have to go to Queens...	1446229055	660158623637757952	f	mexicoblvd
RT @NaimaEfuru: NOOOOOOO! https://t.co/zGEnkElgrj	1446229040	660158561247436800	f	mexicoblvd
RT @haileyeber: if @MexicoBlvds's delicious, amazing taco truck can't make it in NYC, can any of us?   https://t.co/8vDywNrxFm	1446228798	660157543944232960	f	mexicoblvd
RT @kmulvs: You can put me in bumper-to-bumper traffic and up my rent, but New York, you cannot take away my taco truck. @MexicoBlvd	1446228776	660157451547881472	f	mexicoblvd
@elvainadine we will miss you guys too! We hope to see you guys in our restaurant Chela & Garnacha in Astoria!	1446221005	660124859314388992	f	mexicoblvd
@qmchenry it was out pleasure thank you for the support!	1446220650	660123370411945984	f	mexicoblvd
@JWAugustine thanks for the tip and support I'll look into that	1446220618	660123236802428932	f	mexicoblvd
@AEsco11 we can look into it thanks for the tip and support	1446220598	660123149812563968	f	mexicoblvd
@BubblinBrown99 thanks for the love and support we love you too!	1446220572	660123041435942914	f	mexicoblvd
@kmulvs this made me cry. I'm not kidding	1446220546	660122935185817600	f	mexicoblvd
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
So sorry to the folks in Dumbo. Our truck broke down on the way over. :( see you next week. Have a good weekend.	1445613571	657577096521359361	f	mamuthainoodle
RT @petepachal: Picking a lunch place is easy when @mamuthainoodle is in the neighborhood. http://t.co/nQhJrUDs3L	1445279922	656177672456945664	f	mamuthainoodle
17th & 5th. We're here for your noodle needs! Get some hot off the wok Thai noodles! mamuthai	1445274513	656154984321556480	f	mamuthainoodle
@LacySchutz sorry to hear that.  We're in the midst of training new chef's. Plz bare w/us thru this transition. Promise it'll be worth it!	1444756842	653983713114636288	f	mamuthainoodle
@rock_sp6 sorry, we're taking the day off. Might be back on Wednesday. We'll let you know.	1444676343	653646078638731264	f	mamuthainoodle
Surprise 17th&5th! We're hear on a Wednesday. Come by for your noodle lunch	1444232410	651784086013480960	f	mamuthainoodle
Late tweet 17&5th! Happy noodle Monday! mamuthai	1444063814	651076944847609856	f	mamuthainoodle
Thursday folks we are back! Come by for your noodle fix!	1443712153	649601971444424704	f	mamuthainoodle
Hello Monday peeps! We're on 17th & 5th towards the middle of the block closer to union square. Come lunch with us! mamuthai	1443453577	648517425269469185	f	mamuthainoodle
. @AndysItalianIce it's been too long since we've had your awesome ices! I think it's because we haven't done an event together all summer!	1443115966	647101382529576960	f	mamuthainoodle
RT @AndysItalianIce: @mamuthainoodle I miss your amazing noodles	1443115863	647100950004559872	f	mamuthainoodle
Hello Thursday folks! At our usual spot! Come by for Thai noodles mamuthai	1443111808	647083941304909824	f	mamuthainoodle
17th & 5th! We're baaack! Come by for fresh Thai noodles	1443018823	646693934069121026	f	mamuthainoodle
@Mrs_Xtina so sorry! Still having technical difficulties! We're gonna make up for today on Wednesday!	1442857667	646017996721360896	f	mamuthainoodle
@hitreplyall so sorry about that. The handle broke off of 1 of our 2 wok stoves at the start of service & made cooking very difficult today.	1442622351	645031009067630592	f	mamuthainoodle
Dumbo it's Friday & beautiful out! Come by for your Thai noodle lunch! @dumbolot @DUMBOFoodTrucks	1442593354	644909388726169601	f	mamuthainoodle
@Mrs_Xtina yes we will. Sorry about that! Had some equipment problems. Should've tweeted.	1442374249	643990393420390400	f	mamuthainoodle
RT @MamuThai: Special thanks to the couple who dined & dashed tonight. Instant karma to you both. youreoncandidcamera	1442120390	642925634759561216	f	mamuthainoodle
Friday is our favorite day of the week! Celebrate with us in Dumbo Jay&Water st. @DUMBOFoodTrucks mamuthai thai noodles	1441986839	642365479538003968	f	mamuthainoodle
Thursday spot! A little drizzle is not gonna stop us from serving you fresh Thai noodles! Come by! mamuthai	1441892790	641971007675305984	f	mamuthainoodle
Macho men unzip too. https://t.co/OH24VMj250	1446222982	660133149503070208	f	thepocketful
70 degrees and sunny now. Unzip with this great weather. falafel hummus sandwich lunchbox https://t.co/TaoixidJpe	1446131989	659751499589926912	f	thepocketful
65 and sunny today. Unzip yourself on 50th &6th.  healthyeating hummus pita https://t.co/ZUOb9N5a8z	1445956365	659014876124323840	f	thepocketful
Unzipping on 50th today! glutenfree vegan falafel vegetarian healthyfood @ Le Pain Quotidien -... https://t.co/X4YMM83grQ	1445869953	658652440670117888	f	thepocketful
Keep on trucking https://t.co/FTNd78SBz0	1445785666	658298915280826368	f	thepocketful
@alexaizenberg @ThePocketful appreciate it!	1444673668	653634857592078337	f	thepocketful
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
RT @randomfoodtruck: How about a little food truck trick or treating at lunch today? @carlssteaks @gcnyc1 @CarpeDonutNYC @CamionNYC @Chefsa...	1446227038	660150162967404544	f	camionnyc
RT @alifeinthedayof: Lunch today provided by @camionnyc with gogobot. The fishtaco was delicious! gogobotturns5 foodie... https://t.co/Cgf...	1446227026	660150114703548416	f	camionnyc
RT @aliceinqueens: yum fish tacos lunch thanks to @Camionnyc gogobot gogobotturns5 foodporn foodie travel nyc... https://t.co/LdZUhdv...	1446227020	660150086475849728	f	camionnyc
TGIFryday 56th & Broadway 2 special's to finish the week right chipotle falafel & chorizo tacos &... https://t.co/TfS8zOXwkb	1446219057	660116687111462912	f	camionnyc
Old slip and front today's special chorizo taco wallstreet foodporn yummy camionmeanstruck @ 55... https://t.co/pgv40hR4Mw	1445961971	659038390348873728	f	camionnyc
56th & Broadway till 2:30 today's  special Fish burrito midtown tgif yummy camionmeanstruck... https://t.co/HpfWVgzY48	1445615870	657586740442636288	f	camionnyc
47th St & Park Ave Happy tacotuesday today's special 3 Fishtacos $10 foodporn camionmeanstruck... https://t.co/bhyHzk9Kga	1445357276	656502115121147904	f	camionnyc
tristate mashup bestfoodtrucks nyrules camionmeanstruck tacos meadowlands @ Meadowlands Racetrack https://t.co/kuZ1yyDwUN	1445101616	655429799989682176	f	camionnyc
47th & Park Ave special chorizo tacos tgif foodporn camionmeanstruck yummy burritos @ Park... https://t.co/2aIH5vUkx0	1445012525	655056124169748480	f	camionnyc
eljamador rooseveltisland yourshotatamillion tacos goal @ The Octagon (Roosevelt Island) https://t.co/izucHk46p2	1444847441	654363713160482816	f	camionnyc
RT @HawkeyeNJ: @KorillaBBQ @mausamnyc @gcnyc1 @CamionNYC @DeliNDogzTruck @mactruckny @PontiRossiFood @Valduccis @USAFoodTruck C PIC! http:/...	1444833591	654305622578581504	f	camionnyc
RT @TheMeadowlands: NYC: @mausamnyc @gcnyc1 @CamionNYC @DeliNDogzTruck @KorillaBBQ @mactruckny @PontiRossiFood @Valduccis @USAFoodTruck htt...	1444766272	654023267720818688	f	camionnyc
Thanks to livefastgroup and centerplate we will be vending @NY_Comic_Con from this Thursday though... https://t.co/CajqzMrh70	1444589031	653279864900976640	f	camionnyc
Thanks to livefastgroup and centerplate we will be vending @NY_Comic_Con from this Thursday though... https://t.co/QzoF3Nhuz5	1444410114	652529430691205120	f	camionnyc
Thanks to @livefastgroup and @centerplate we will be vending @NY_Comic_Con from this Thursday though Sunday at the @javitscenter NYCC NYC	1444409981	652528875310813184	f	camionnyc
Thanks to @livefastgroup and @centerplate we will be vending @NY_Comic_Con from this Thursday though Sunday at the @javitscenter NYCC NYC	1444309835	652108831191924737	f	camionnyc
@GansMarket https://t.co/dwmr0X9vO3	1442414801	644160483604475904	f	palenquefood
Thanks to livefastgroup and centerplate we will be vending @NY_Comic_Con from this Thursday though... https://t.co/ZByGL1PYsB	1444309809	652108720768446464	f	camionnyc
Come and enjoy the tristate areas best food trucks  foodtrucksrule tristatemashup mashup tristate... https://t.co/5TFWKaUr1S	1444268431	651935170380079104	f	camionnyc
Thanks to livefastgroup and centerplate we will be vending @NY_Comic_Con from this Thursday though... https://t.co/DGX7JfGKuS	1444229776	651773038803963906	f	camionnyc
Thanks to @livefastgroup and @centerplate we will be vending @NY_Comic_Con from this Thursday though Sunday at the @javitscenter NYCC NYC	1444229669	651772592173527042	f	camionnyc
@jmk9989 @EMISHKOFF not yet	1446129408	659740674246488065	f	schnitzi1
Today we will serve lunch @33 St bet 8&9 Ave from 11:30-3:30 B&H old loading dock, order online @www.schnitzi.com schnitzitruck schnitzel	1446125457	659724099724427264	f	schnitzi1
Today we are @175 Varick St @wework lounge, order online @www.schnitzi.com or download our app schnitzitruck  foodtruck, From 11:30-3:30	1446040925	659369546810314753	f	schnitzi1
Tomorrow we will be @175 Varick St, New York, NY 10013 @wework lounge, if you in the area come get some lunch schnitzitruck schnitzel	1446001383	659203697700941824	f	schnitzi1
Schnitzi truck is off the road today for some private event see you all tomorrow	1445951859	658995979954356224	f	schnitzi1
Today we are @33 St bet 8&9 Ave serving lunch from 11:30 until 3:30 order online @www.schnitzi.com or download our app	1445866331	658637250188677121	f	schnitzi1
Today we are @33 St bet 8&9 Ave serving lunch from 11:30-3:30 order online @www.schnitzi.com or download our app foodtruck	1445522869	657196664298577920	f	schnitzi1
RT @CarismaPrinting: @Schnitzi1 carismainaction thanks for making the party as awesome as you did!!! https://t.co/vVhkRwK8xz	1445383546	656612302695870464	f	schnitzi1
Good morning everyone, today we are @33 St bet 8&9 on B&H old loading dock serving lunch from 11:30-3:30 spread the word order online	1445344915	656450271812390913	f	schnitzi1
Special treat to B&H today we are @33 St bet 8&9 serving lunch from 11:30-3:30 order online @www.schnitzi.com schnitzitruck	1445262162	656103178119880704	f	schnitzi1
B&H we are on our way, today @33 St bet 8&9 serving lunch from 11:30-3:30 order online or through our app @www.schnitzi.com	1444917570	654657854272442368	f	schnitzi1
Schnitzi truck is off today for some private event see you all tomorrow	1444829437	654288200840708096	f	schnitzi1
@schnit we will soon BH	1444745675	653936876102008832	f	schnitzi1
Today October 13 we are serving lunch @33 St bet 8&9 Ave from 11:30-3:30 order online or through our app @www.schnitzi.com	1444743182	653926421530808321	f	schnitzi1
Oh it is so good to be back, B&H we are here @33 St bet 8&9 serving lunch from 11:30 - 3:30 order online or through our app	1444312588	652120375590027264	f	schnitzi1
Schnitzi truck is off during Sukkos we will be back after the holiday	1443716672	649620926850596864	f	schnitzi1
@yyiippii yes we are	1443104431	647053000305954816	f	schnitzi1
33 bet 8&9 B&H old loading dock we are here after Yom kippur we bet you are hungry for some schnitzi order online@www.schnitzi.com	1443104417	647052942827196416	f	schnitzi1
B&H leave your lunch @home we are heading your way to serve you some Schnitzi lunch 11:30-3:30 @33 bet 8&9 order online or by our app	1442839251	645940754670612480	f	schnitzi1
Today we are @33 bet 8&9 B&H loading dock, serving lunch from 11:30-3:15 download our app and order in advance schnitzitruck schnitzel	1442497269	644506376513974272	f	schnitzi1
We are closingat 430pm today.  Stop by before then to get your donut fix!  @randomfoodtruck	1446229615	660160970040483840	f	carpedonutnyc
Truck open at 55th and Broadway. Come!!!	1446203182	660050104527798272	f	carpedonutnyc
@googlephotos PumpkinPatchNYC Find a Photo. Get a Donut! https://t.co/3AxPm6G7Y1	1446130370	659744709250785280	f	carpedonutnyc
@CarpeDonutNYC in disguise in Time Square from 12noon until 8pm. @googlephotos PumpkinPatchNYC  Free Donuts!! https://t.co/7skmHsabwg	1446130116	659743642710646784	f	carpedonutnyc
Open at 51st street and Park avenue. Come!!!	1445856555	658596244588228608	f	carpedonutnyc
Omg it's a food a palooza!! Come visit the trucks @prospect_park so much delicious: @kimchitruck @philssteaks @taimmobile @nuchasnyc @gcnyc1	1445704981	657960496407146497	f	carpedonutnyc
Open at 55th street and Broadway. Come!!!	1445601130	657524914426130433	f	carpedonutnyc
Open @ Bergen St and Court St only till 1pm today!	1445085281	655361287271141376	f	carpedonutnyc
Open at 51st street and Park avenue. Come!!!	1444906397	654610992710725633	f	carpedonutnyc
Open at 23rd street and Park avenue south. Come...	1444819387	654246046474870784	f	carpedonutnyc
Open at Bergen and Court street. Come!!!!	1444561568	653164674112950272	f	carpedonutnyc
Open @ Bergen and Court! Perfect day for a hot donut.	1444482551	652833252466671616	f	carpedonutnyc
Open at 55th street and Broadway. Come!!!	1444388952	652440669613596672	f	carpedonutnyc
Truck open at 51st street and Park avenue. Come!!!	1444306617	652095333162463232	f	carpedonutnyc
Truck open at Food Truck Rally. Prospect Park. Grand Army Plaza.	1443968042	650675248501780481	f	carpedonutnyc
Open @ Broadway and 55th - come stock up on donuts for the weekend!	1443789232	649925264466706432	f	carpedonutnyc
Truck open at 22nd street and 5th avenue. Come...	1443697302	649539681634402304	f	carpedonutnyc
Open at 23rd street and Park avenue south. Come...	1443613846	649189641720041472	f	carpedonutnyc
Open at Bergen and Court street. Come!!!	1443359642	648123433037996032	f	carpedonutnyc
Open @ 55th and Broadway. Come!!	1443179242	647366779145203712	f	carpedonutnyc
caro haciendo la salsa de cilantro :) https://t.co/WWhLEaowgn	1445963159	659043375346089984	f	palenquefood
@JosieLong is your offer for tickets for tonight tickets still on?	1445633753	657661745104834560	f	palenquefood
Broadway Bites by Urbanspace | Cititour Guide to NYC Events, Restaurants, Music and Nightlife https://t.co/RwDfVcp5WS	1445456222	656917124930228224	f	palenquefood
RT @Cititourcom: BwayBites is back at GreeleySquare including delicious arepas @Palenquefood nyc foodie\nhttp://t.co/ycdLlUlno7 http://t...	1444742026	653921572781166592	f	palenquefood
Lunch time @ Citigroup One Court Square, Long Island City https://t.co/TGDG41FMtW	1444234668	651793558895239168	f	palenquefood
Today lic Citicorp  :) @ Citigroup One Court Square, Long Island City https://t.co/kImB07XnzV	1444234552	651793070397067264	f	palenquefood
@nathmanou @Palenquefood  next week we start with the ajiaco! :)	1444073915	651119311445069824	f	palenquefood
Oh hey clear skies, nyc urbanites come celebrate fall at 33rd&Broadway and try our new empanadas and classic delicious arepas!	1444061745	651068267914752001	f	palenquefood
Is there a better way to end sumeer than Michael having a chorizo arepa???? https://t.co/oZwrjRBN0J	1442769333	645647497969451008	f	palenquefood
http://t.co/c7flPeLdTP	1442578876	644848663118938112	f	palenquefood
RT @NomNomNYCgirls: We pretty much live at @smorgasburg  Quinoa Arepa w/ Jumbo Shrimp smorgasburg prospectpark brooklyn foodporn http...	1441816546	641651220290109440	f	palenquefood
RT @ShopKeep: These multigrain empanadas make us go a little loco. Can you blame us though @Palenquefood?! ShopKeepLife http://t.co/qv72DV...	1440895772	637789214260772865	f	palenquefood
No words https://t.co/rLYABjAGtH	1440365254	635564060155711488	f	palenquefood
Palenque crew @ afropunk NYC  https://t.co/qemMrwblKk	1440335990	635441317808578560	f	palenquefood
Palenque Team ready for fooda @360i https://t.co/8h0aDwGUau	1439999376	634029453421756417	f	palenquefood
RT @gretchenzehner: @Farm2me: NYC:  GlutenFree + Multi-Grain Arepas at @PalenqueFood regram from @palenquefood Farm2NY http://t.co/rT6q...	1439947682	633812633414668288	f	palenquefood
Start your day off right with some delicious Colombian arepas at @GansMarket 	1439227291	630791097372016640	f	palenquefood
Palenqueritos working @rockawaybeach 97! Deliciosa and nutritious colombian Arepas https://t.co/8dMwfrEj37	1439136507	630410319731531776	f	palenquefood
Scream it from the rooftops it's CHEESESTEAK FRIDAY folks! BIG CARL - 56TH ST / Bdwy @randomfoodtruck... https://t.co/DT7ODaqcum	1446214421	660097242578055168	f	carlssteaks
We love Thursday ONE day closer to the weekend BIG CARL - 47TH ST BET LEX / PARK @MLB @NFL @UBSAMERICAS @BARCLAYS... https://t.co/Y7VXVRSLRx	1446133520	659757921077628928	f	carlssteaks
Time for the cheesesteak rain dance folks ok then head over to  BIG CARL - 47TH ST BET LEX / PARK @MLB @NFL... https://t.co/qsdi0VuN6B	1446041919	659373715738595328	f	carlssteaks
Thank you for including us and for such a great cause https://t.co/bnavORp3eD	1445988027	659147680115875841	f	carlssteaks
Tuesdays mean BROOKLYN love! @dumbolot Jay st and water st GOT WHIZ? nycsbest cheesesteaks for all https://t.co/MaNUATasxc	1445956676	659016182230421506	f	carlssteaks
Mondays are better w 2x the cheesesteak love!! \nBIG CARL -Hudson and king st @Medidata @WFAN660 \nLIL CARL - 70TH... https://t.co/tJh4Pg1VdD	1445870553	658654955276865536	f	carlssteaks
Sundays are Football & a Carls famous cheesesteak GOT WHIZ? nycsbest cheesesteaks for all 67th st / Bdwy	1445791246	658322319434260484	f	carlssteaks
Sundays in the Fall ARE Football & Carls famous cheesesteaks! 67th st/Broadway till 7pm GOT WHIZ? NYCSBEST... https://t.co/RVn5U9GuVA	1445791186	658322065947127808	f	carlssteaks
Hey folks BREAKING NEWS : \nLIL CARL had to move spots we are now on Broadway bet 17th /18th St !!!cheesesteaks for all! GOT WHIZ	1445710615	657984126432256004	f	carlssteaks
Hey folks come to Brooklyn today BIG CARL -  Halloween party @prospect_park, foodtruckmarket, halloween,... https://t.co/ZDkob1Ncyc	1445704793	657959709073272832	f	carlssteaks
Scream it from the rooftops it's CHEESESTEAK FRIDAY folks! \nBIG CARL - 56TH ST / BDWY @RANDOMFOODTRUCK... https://t.co/rh3Z8hx34h	1445618771	657598908298715136	f	carlssteaks
We're here till 3pm today at 47th + Park! Come stop by! Heart2CurePH\nLucky 50 get free lunch cheesesteaks for all GOT WHIZ?	1445534894	657247098920947712	f	carlssteaks
We're here till 3pm today at 47th + Park! Lucky 50 get FREE lunch  Come stop by! Heart2CurePH cheesesteaksfor... https://t.co/Fa9FK5hMwD	1445534815	657246769298800641	f	carlssteaks
Join us TODAY 12pm w/ superstar @ChloeTemtchine at 47th + Park! Heart2CurePH Lucky 50 get free lunch.... https://t.co/gCq7E4wBz9	1445528163	657218867710717952	f	carlssteaks
Getting ready to join the amazing @ChloeTemtchine today! Stop by from 12-2pm at 47th + Park! Heart2CurePH... https://t.co/5FNKQTx701	1445524614	657203982746583040	f	carlssteaks
BIG CARL 47th st bet lex / park @MLB @nfl @UBSamericas @jpmorganchase @SiriusXMNFL @MHFI \nLIL CARL - 70TH ST /... https://t.co/8XQxGhsCtU	1445438928	656844588213145600	f	carlssteaks
Hey folks 2x the cheesesteak love today \nBIG CARL @dumbolot Jay st & water st \nLIL CARL - 70TH ST / YORK AV GOT... https://t.co/RqLiWsUZ2g	1445355237	656493566089256960	f	carlssteaks
Hey folks not too late to head over 67th st /Broadway till 8 pm grab a carls famous cheesesteak GOT WHIZ? nycsbest cheesesteaks for all	1445266548	656121576807510016	f	carlssteaks
Hey folks head over 67th st /Broadway till 8 pm grab a carls famous cheesesteak GOT WHIZ? nycsbest cheesesteaks for all	1445194530	655819508548894720	f	carlssteaks
Hey folks not too late to head over 67th st /Broadway till 8 pm grab a carls famous cheesesteak GOT WHIZ? nycsbest cheesesteaks for all	1445194423	655819060207292416	f	carlssteaks
RT @ChefDomTes: Big Thanks to @PRcision . The Fall festival at Mt. Loretto was EPIC!! Staten Island needs more great events like this. Grea...	1445808774	658395835349209089	f	mactruckny
RT @MagsLatersbaby: Day out in Staten Island! Hanging at the @mactruckny ...YUMMY!!@ChefDomTes https://t.co/hleXXFmpQ0	1445741038	658111729986117634	f	mactruckny
Don't forget, tomorrow and sunday Mt. Loretto's fall festival 12-6... Come get some Mac n'Cheese!!!	1445643565	657702901591187456	f	mactruckny
RT @TheMeadowlands: NYC: @mausamnyc @gcnyc1 @CamionNYC @DeliNDogzTruck @KorillaBBQ @mactruckny @PontiRossiFood @Valduccis @USAFoodTruck htt...	1444858162	654408679429644288	f	mactruckny
RT @ExposureNJ: Foodtruckmashup @foodtrucksin @FoodDudeNJ @njisntboring @NjFoods @4foodnyc @EaterNY @TheRecordNJ @TheMeadowlands http://t....	1444858141	654408593253486593	f	mactruckny
@ResurEctoCooler a recipe of my own creation.	1444782535	654091479120523264	f	mactruckny
RT @jrlallo: Ecto Cooler. http://t.co/BmELmKvodo	1444762936	654009274692173824	f	mactruckny
RT @thecalkelly: .@guardian_kneo found Ecto Cooler and is the happiest nerd at NYCC. http://t.co/qKrRus5hZF	1444762926	654009232732352512	f	mactruckny
@jaycostadj saturday, the meadowlands tri state food truck mashup.	1444762882	654009049596473344	f	mactruckny
RT @The_Apocalisa: waiting for @mactruckny...honestly only thing at NYCC worth the 45 min wait	1444665692	653601401113833472	f	mactruckny
RT @BetaChris: Taking a break from the NYCC craziness to enjoy some homemade buffalo chicken mac and cheese from @mactruckny. It's sooo go...	1444665686	653601377864839168	f	mactruckny
RT @aleyas69: @mactruckny thank you for talking my back to my childhood http://t.co/NQBcVm558Z	1444665679	653601349209337861	f	mactruckny
RT @ResurEctoCooler: Check out @mactruckny's slow mo Ecto cooler - what recipe were you using guys?  http://t.co/CaerUjFDcf	1444665623	653601111899832321	f	mactruckny
RT @ResurEctoCooler: .@mactruckny ComicCon Ecto Cooler taste test! https://t.co/9oZSw8MIum http://t.co/Zcol18tz5V	1444665602	653601025602023424	f	mactruckny
RT @chakram12: Hanging with @mactruckny what a great guy! Thanks Dom! http://t.co/yc6sLJWimp	1444665583	653600944941334532	f	mactruckny
RT @The_Apocalisa: Still convinced @mactruckny was my favorite part of NYCC ...what will it take to get you guys to follow me around all d...	1444665574	653600907804999680	f	mactruckny
RT @ChefDomTes: Thanks to @livefastgroup and @centerplate we will be vending @NY_Comic_Con from this Thursday though Sunday at the @javitsc...	1444231435	651779996638412801	f	mactruckny
Thanks to @livefastgroup and @centerplate we will be vending @NY_Comic_Con from this Thursday though Sunday at the @javitscenter NYCC NYC	1444168258	651515013463732224	f	mactruckny
@jcbass12 @ChefDomTes im on staten island saturday.	1443144428	647220757462958081	f	mactruckny
@aleyas69 @NY_Comic_Con absolutely	1443139944	647201951592095744	f	mactruckny
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
That's a cold chill today.. The pier is closed this weekend so y'all don't freeze your kiesters. Grand Harvest Wine Festival next weekend!	1445179927	655758259941449728	f	nautimobile
@ScoutologyNYC we aren't a NYC good truck anymore, told you guys this before!	1444960994	654839989142966272	f	nautimobile
It's still summer here at Pier 13! Come live a lie with us! Here until 10 pm	1444580254	653243052178415616	f	nautimobile
If today's weather in Jersey City was a Nicholas Cage movie, it would be Con Air.  'Cause it's perfect. http://t.co/NRw730zefJ	1443281022	647793674198347776	f	nautimobile
If today's weather in Jersey City was a Nicholas Cage movie, it would be Con Air.  'Cause it's perfect. http://t.co/NgHuUq8pKw	1443198737	647448546183135232	f	nautimobile
@porn_cast thanks for the tweet! Sure you guys get hungry up there 	1443198534	647447695666376704	f	nautimobile
Pssh clouds don't scare us. It's a cool and dry 75 degrees here on pier 13. Come through!	1442075018	642735329313746948	f	nautimobile
@knedryerson yep!	1441493461	640296103104118784	f	nautimobile
RT @TheBarclaysGolf: Who's hungry? http://t.co/IwTW8KrJP0	1440867360	637670044303032322	f	nautimobile
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
Kasar truck is at union square \nUntil 5pm	1435065878	613336862891978753	f	chipsykingny
Kasar truck is at park avenue and 33rd street until 4pm	1434979460	612974399528906752	f	chipsykingny
Kasar truck is in Soho, Broadway and spring street	1434806172	612247580429320193	f	chipsykingny
Kasar truck is at Christopher and 7th avenue until 4am	1434761152	612058749423910912	f	chipsykingny
Kasar truck is at 33rd and park avenue until 4pm	1434547311	611161838185611264	f	chipsykingny
Kasar truck is in soho, Broadway and spring street until 6 pm	1434295554	610105890910253058	f	chipsykingny
Kasar truck is in Soho, broadway and spring street until 8pm, and at seventh avenue and Christopher until 4am	1434205183	609726849581608960	f	chipsykingny
Hello, Your vote means the world to us  please vote for PONTI ROSSI on scoutology as best food truck in NYC https://t.co/rNJUGLNnRi	1446246449	660231577801261056	f	pontirossifood
Stock up w/ Comp Pasta for MarathonWeek provided by ParagonSports & PontiRossifood 18th&BroadwayThurs-Sat 12-3pm https://t.co/ytVQssNAET	1446227684	660152870638063616	f	pontirossifood
Your vote means the world to us  please vote for PONTI ROSSI on scoutology as best food truck in NYC https://t.co/rNJUGLNnRi	1446211431	660084704138371072	f	pontirossifood
Pontirossi new Wrap for MarathonWeek & ParagonSports! Pass by 18th&Broadway for comp pasta thurs-sat 12-3pm. https://t.co/bmap0Hzha1	1446155784	659851302428672000	f	pontirossifood
Hello fellow followers we would love to get your help to win NYC's best food truck on scoutology please vote for us https://t.co/p13WivGkK4	1446153277	659840787270733824	f	pontirossifood
Your vote means the world to us  please vote for PONTI ROSSI on scoutology as best food truck in NYC https://t.co/rNJUGLNnRi	1445992391	659165983442079744	f	pontirossifood
Come join PontiRossi at the Haunted Walk at ProspectPark PontiRossi Halloween Italian Carbonara MangiaPonti https://t.co/VxVmbix5Rn	1445714204	657999180615569408	f	pontirossifood
RT @dubpies: Join the PieTruck at @ProspectPark Nethermead for Halloween event with\n@PhilsSteaks\n@PontiRossiFood\n@taimmobile	1445713921	657997994990641152	f	pontirossifood
RT @ScoutologyNYC: Cast Your Vote In The NYC Food Truck Fight Championship! @Scoutology @PontiRossiFood @souvlakitruck \n\nhttps://t.co/gsjB...	1445536703	657254689923321856	f	pontirossifood
RT @HawkeyeNJ: @KorillaBBQ @mausamnyc @gcnyc1 @CamionNYC @DeliNDogzTruck @mactruckny @PontiRossiFood @Valduccis @USAFoodTruck C PIC! http:/...	1445452913	656903247383437312	f	pontirossifood
Today we serving dinner at the @RoyalPalmsClub  514 union street Brooklyn ! Come get your zesty Italian food  lasagna on rotation today !	1445370873	656559147534692352	f	pontirossifood
@MurrayNewlands thanks for joining our followers we can't wAit to serve you !	1445370613	656558054046105600	f	pontirossifood
@Danihum you can follow us here or fb or text 347-506-9616 / 646-644-7932 or email us at alessandro@pontirossifood.com  ciaooooo	1445312031	656312344822312960	f	pontirossifood
RT @Danihum: @PontiRossiFood coming to NY! How do I find you?	1445311974	656312104857767936	f	pontirossifood
Is it lunch time? Let us cater your next event DeltaManagement Pontirossifood Italianfoodtruck https://t.co/25n7EhR33c	1445279527	656176014423408641	f	pontirossifood
FoodTruckMashUp Tristate Pontirossifood Italianfoodtruck Chickenandmushrooms Meadowlands Racetrack http://t.co/IH7HNj5xqu	1445133202	655562284148895744	f	pontirossifood
Porchetta on rotation for tomorrow. Meet us tomorrow TriStateFoodTruckMashUp   Pontirossifood Italianfoodtruck http://t.co/WELFvqxJ4N	1445036140	655155174026125313	f	pontirossifood
LetUsCaterYourNextEvent! \nTimeWarner Happyemployees HomeadeItalianMeatballs Pontirossifood Italianfoodtruck http://t.co/ctCBCY8XOC	1444413101	652541958053888000	f	pontirossifood
RT @TheMeadowlands: NYC: @mausamnyc @gcnyc1 @CamionNYC @DeliNDogzTruck @KorillaBBQ @mactruckny @PontiRossiFood @Valduccis @USAFoodTruck htt...	1444190989	651610354045317120	f	pontirossifood
RT @DomoTaco: Happy Friday with @mamuthainoodle and @PontiRossiFood	1443801551	649976933925695488	f	pontirossifood
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
@Manoj_Biswal @TheProfitCNBC so like food trucks in NYC with a great business model and a great underdog start up story in need of capital?	1446261975	660296698523222016	f	usafoodtruck
Midtown---were at 46th in between 5th and 6th with the chicken tenders you need to start the Halloween weekend off right! 11-3 nycfood usa	1446217654	660110803094413312	f	usafoodtruck
Hey y'all. We're at water and old slip for lunch today. Come and get the chicken from 11-3. my food NYC Murica	1446132644	659754243839119360	f	usafoodtruck
@brittanyarroyos thanks for the follow! Hope you loved your lunch. See you around :) nycfood murica southernfoodinnyc	1446059073	659445665500672000	f	usafoodtruck
@pathunstrom hey Piper! Hope you enjoyed it. Thanks for following. And we hope to see you again soon staydry staywarm thankyou nycfood	1446059018	659445436764303361	f	usafoodtruck
We're in DUMBO lot today at 50 Jay St in BK. Come get the goodness we'll be here till 3ish.	1446047378	659396613111173120	f	usafoodtruck
@NoRobbins @dumbolot thanks for the love. Positive vibes right back at you.	1446046370	659392386959867904	f	usafoodtruck
RT @NoRobbins: @dumbolot @USAFoodTruck is dope. Bring that ish everyday	1446046318	659392166582747137	f	usafoodtruck
RT @dumbolot: We got @DomoTaco @biandangnyc and @USAFoodTruck in the lot today!	1446046312	659392144101265409	f	usafoodtruck
Old Slip and Water for the best chicken tenders you'll ever have. We're there from 11-3. Hot. Fresh. American. nycfood nyc usa Murica	1445958851	659025306523729921	f	usafoodtruck
Best. American. Food. In. NYC. @ 47th and Park. We'll be here from 11-3. Come and get that good stuff. nycfood nyc usa foodtruck	1445871908	658660637820735488	f	usafoodtruck
Betsy is at 46th in between 5th and 6th today yall. The market is open for one more day at 41st and Broadway. Come start the weekend right	1445613436	657576527790514177	f	usafoodtruck
Were downtown with Betsy at Old Slip and Water and the market is open at 41st and Broadway. Come and get the all-American goodness. usa	1445527303	657215260273831937	f	usafoodtruck
@hhminion thanks for the love! We do our best for you everyday.	1445458230	656925549793820676	f	usafoodtruck
RT @hhminion: love my triple play grilled cheese from @USAFoodTruck YankeeDoodleDandy's....it's perfect!!!!	1445448627	656885268868419584	f	usafoodtruck
Midtown! It's an American Food Revolution! 46th in b/w 5th and 6th with Betsy, and the market is chicken slinging at 41st and Broadway. NYC	1445440024	656849185367588864	f	usafoodtruck
@EmeraldEdibles we'll be back next week Ma'am! But we'll be on 46th in between 5th and 6th on Friday. come gett!	1445405938	656706220716265472	f	usafoodtruck
NYC. 41st and Broadway till the end of this week and Betsy is at Old Slip & Water St. YDD--the official food of hustlers and go gettas. NYC	1445353324	656485542079676416	f	usafoodtruck
@rebekahlowin was our pleasure to take care of you. Come back any time.	1445186051	655783948178628608	f	usafoodtruck
RT @BrookeSassman: Quite possibly the best story I've ever heard behind a truck foodtruckmashup @USAFoodTruck trucktales http://t.co/ki65...	1445120738	655510002610905089	f	usafoodtruck
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
RT @justyniak: @PhilsSteaks Looking forward to seeing you in FiDi !!! Btw yday' lunch was off the charts ! 	1446255824	660270900860870656	f	philssteaks
@LaColibri thank you! We love to hear that. See you in 2016!	1446234849	660182925212819456	f	philssteaks
RT @LaColibri: @PhilsSteaks I am truly going to miss you guys!  The best cheesteaks I've ever had!	1446234814	660182777636233218	f	philssteaks
RT @bizzymammabee: @PhilsSteaks will be there today to get my final fix of the season!	1446234811	660182765548273664	f	philssteaks
And we have some exciting new ventures planned for 2016! So stay warm this winter, and stay tuned. The Jawn will return!	1446234700	660182299204411392	f	philssteaks
Thanks to all our wonderful customers who helped make 2015 so great! Hate to leave you for the winter but we will... https://t.co/iYDyEJRWRj	1446234656	660182114332110848	f	philssteaks
It's the phinal Phil's Phriday of 2015! The Jawn is on 51st and Park 11-2. Don't miss your last chance to get your Phil!	1446217317	660109389735456768	f	philssteaks
RT @cozoniak: @PhilsSteaks my coworker and I braved the rain, thanks for a great year guys!	1446150143	659827640799506433	f	philssteaks
RT @MeetTheTaskFast: https://t.co/Q5yRGVVbuU	1446144005	659801897356951552	f	philssteaks
RT @its_cici: Food coma is real right now after @PhilsSteaks 	1446143991	659801837386776576	f	philssteaks
RT @justyniak: Some of the best 10 inches a girl can ask for  @philssteaks phillycheesesteak foodtruck nyc... https://t.co/li6t5paOYe	1446143987	659801821628772353	f	philssteaks
Last Thursday lunch at 52nd & 6th till spring. Come get em' while you still can! https://t.co/7PZSgJYiB0	1446136522	659770513074618368	f	philssteaks
Beautiful weather for our last Thursday of the year! 52nd between 6th and 7th 11-230. Don't miss out - get your Phil!	1446127808	659733961887780864	f	philssteaks
It's the last Whiz Wednesday of 2015! If you're sad, we have the cure. Drown your sorrows in Whiz! 41st btw 6th n Broadway 11-2	1446040605	659368207136886784	f	philssteaks
Final week schedule:\nT: 47/Park 11-2\nW: 41/6 11-2\nTh: 52/6 11-230\nF: 51/Park 11-2\nGet your Phil!	1445952697	658999492532813824	f	philssteaks
It's our last week on the streets for 2015. Don't miss your last chance to get your Phil this year. Today we are... https://t.co/wwthYQl8MK	1445869829	658651919343185920	f	philssteaks
RT @CarpeDonutNYC: Omg it's a food a palooza!! Come visit the trucks @prospect_park so much delicious: @kimchitruck @philssteaks @taimmobil...	1445705255	657961646669873152	f	philssteaks
@Jordanofmadden we will be there next week for one last hurrah in 2015	1445692016	657906119680131072	f	philssteaks
@LanternAtrain one more week then off for the winter. Back again in April	1445691987	657905998389202944	f	philssteaks
RT @dubpies: Join the PieTruck at @ProspectPark Nethermead for Halloween event with\n@PhilsSteaks\n@PontiRossiFood\n@taimmobile	1445691934	657905774572785664	f	philssteaks
Happy Saturday! We're at Queens County Farm until 5pm today and tomorrow! Come lunch with us!	1443285380	647811955772760066	f	morristruck
TGIF! Getting excited to serve ya cheese Saturday and Sunday at Queens County Farm! cornmaize fallisfalling	1443193536	647426732899860481	f	morristruck
Happy Thursday! @DowntownBklyn Metrotech Commons 11-3, come lunch with us!	1442502360	644527731028439040	f	morristruck
It's been great @usopen! Thanks to everyone for making this another great year of tennis & cheese! Until next year, Flushing Meadows!	1441673272	641050282089025536	f	morristruck
TGIF @USOpen! Come start the holiday weekend off right with grilled cheese and tennis!	1441379508	639818150075310080	f	morristruck
RT @lindseycoriell: do yourself a favor & check out the @morristruck grilled cheese! (@ Court 17 - @usopen in Flushing, NY) https://t.co/o1...	1441379124	639816539366125568	f	morristruck
Another glorious day @usopen slingin' cheese over by Court 17! Come say hey! TrufflesandTennis	1441133539	638786481226694656	f	morristruck
Day 1 of tennis & cheese @usopen! Next to Court 17 with our friends @SweetChiliNYC, come find us!	1441033305	638366069766385664	f	morristruck
Find us tonight @RoyalPalmsClub till 1am! cheesetownUSA	1440877594	637712968336187392	f	morristruck
RT @OriginalPenguin: Now that was a grilled cheese @morristruck beanoriginal http://t.co/MLgZvFeMBR	1440860125	637639700287778816	f	morristruck
Find us tomorrow from 12p-1a @RoyalPalmsClub! ShuffleButter\n\nStarting Monday we'll be @usopen all day, next to Court 17!	1440781555	637310151511416832	f	morristruck
RT @LevyRestaurants: The grilled cheese from @MorrisTruck was such a hit last year that we brought it back for 2015. FlavorOfTheOpen http:...	1440777164	637291736033828864	f	morristruck
Truck is getting a little TLC before the @usopen next week, but we'll be @RoyalPalmsClub Saturday from 12p-1a for all your CheeseNeeds!	1440518652	636207455270236161	f	morristruck
It's grilled cheese o'clock here @lauritawinerynj perfect day for wine cheese and sangriaslushies	1440340840	635461658496921601	f	morristruck
Let's raise a glass to this gorgeous day @lauritawinerynj ! Can't wait to feed ya! wine newjersey brucespringsteen	1440256262	635106914905497600	f	morristruck
We'll be making a guest appearance in Yankee Stadium tonight serving in the Delta Suite Club! Yankees praisecheeses perfectcombo	1440170632	634747755655790592	f	morristruck
It's almost lunch time at metrotech downtown brooklyn! We'll be slinging grilled cheese 11:30-3 see you there!	1440083124	634380718886506496	f	morristruck
What are you doing tonight? Going to the countingcrows show on pier97 ? Us too! Let's hang out praisecheeses	1439910282	633655769095868416	f	morristruck
One more hour of Free Cheese @CoronaPlazaNYC with @ATT! NothingICantDoATT GoPhone	1439493144	631906165044084736	f	morristruck
Dont miss out! We're giving away grilled cheese @CoronaPlazaNYC from 12-4 with @MobilizeNYC & ATT! NothingICantDoATT	1439487882	631884092359970816	f	morristruck
!!! Fri, Oct 30 11:30-3pm 45th st & 6th ave!!! Halloween treats & lots more! Happy Halloween weekend !!!	1446214832	660098966999203840	f	thetreatstruck
!!! 3:15-7pm Bway (86 & 87th) !!!	1446145693	659808979174969347	f	thetreatstruck
!!! Thurs, Oct 29th 12-2:30 45th & 6th ave! Then 4-7pm Bway (86 & 87th) !!!	1446130960	659747184682934274	f	thetreatstruck
!!! Well...change of plans! Apparently the signs were for today, so no 45th due to construction! Be back tomorrow!	1446045733	659389713149726720	f	thetreatstruck
!!! Today, lots & lots of treats, including Halloween treats, hooray! 45th & 6th ave 12-3:30 !!!	1446042154	659374701807054848	f	thetreatstruck
On Friday, we plan on 45th & 6th from 11-2pm, then we head to a private event! We'll have Halloween treats!!!	1446042054	659374284092100609	f	thetreatstruck
!!! Hey, 45thers! We were planning on Thurs, in addition to today, but looks like signs say no parking on Thurs!	1446041945	659373828263575556	f	thetreatstruck
!!! Wed, Oct 27th 12-3:30 45th st & 6th Ave! And maybe 18th & 7th Ave, depending on the weather! We'll let you know !!!	1446041235	659370849632440321	f	thetreatstruck
Happy Halloween Week!!! We'll have lots of special treats this week !! See you at the truck!!!	1445869880	658652133366087684	f	thetreatstruck
!!! Sun, Oct 25 our truck @WashMarkPark in TriBeCa 1-3pm! Annual Halloween Costume Parade & Party! Our shop open 9-4!!!	1445775721	658257201539252224	f	thetreatstruck
!!! Sat Oct 24 our shop open 9-4pm! Our truck will be in TriBeCa tomorrow afternoon w/ lots of Halloween treats!!!	1445690205	657898522994417664	f	thetreatstruck
!!! We're at 45th & 6th 'til 3:30! But we have a change to our late afternoon, so we'll miss our 2nd spot!	1445618940	657599615345278976	f	thetreatstruck
!!! Fri, Oct 23rd 12-3:30 45th & 6th Ave! Then 4ish-7pm 18th st & 7th Ave !!!	1445609576	657560339773595648	f	thetreatstruck
!!! 3:30-7pm Bway (86 &87th) !!!	1445544651	657288025139998721	f	thetreatstruck
!!! Thurs, Oct 22nd 12-2:30 45th & 6th Ave, then 3:30ish-7pm Bway (86 & 87th) !!!	1445526392	657211442056331264	f	thetreatstruck
!!! 4:30- 7pm 18th st & 7th Ave !!!	1445459995	656932951222001666	f	thetreatstruck
Headed to our spot on 18th &7th Ave!!!	1445459024	656928876942225409	f	thetreatstruck
Staying open longer at 45th & 6th ave! Until....at least 4pm. We'll let you know if it'll be longer!	1445455962	656916037112344576	f	thetreatstruck
!!! Wed, Oct 21 12-3:30 45th st & 6th Ave! Then 2nd spot...we'll let you know later!!!	1445436104	656832747084914688	f	thetreatstruck
Truck spots Wed/Thurs/Fri & Sun !!!	1445278890	656173340147740672	f	thetreatstruck
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
On York Avenue between 70th & 71st street , enjoy a New England Lobster roll as you relax on your break !	1444317951	652142871424860160	f	lobsterrolling
On the corner of 70th & York avenue ; your favorite lunch truck ! See you here @Cornell @Sothebys	1444315249	652131537387847682	f	lobsterrolling
We've moved to W79th street & Broadway @DSWShoeLovers	1444254231	651875610109845504	f	lobsterrolling
Today we are parked on 21st & 5th ave, @FlatironNY @ClubMonaco @NikeNYC @newbalance stop by and have a New England style Lobster Roll !	1444228787	651768892604436480	f	lobsterrolling
Movin' on up to 73rd street & Broadway, catch us if you can !	1444158992	651476151286788098	f	lobsterrolling
New England Lobster rolls and sliders have arrived to 58th street & 8th avenue.	1444141069	651400975698259968	f	lobsterrolling
Good Morning NYC,\nWe are parked on 70St & York Ave today. Come enjoy our Lobster Rolls, Sliders & Lobster Corn Chowder. @Cornell @Sothebys	1444057246	651049394083622912	f	lobsterrolling
Good Morning NYC, \nWe will not be rolling the streets today.  Check us out in Greenpiont, B.K 1073 Manhattan Ave.  Have a great day.	1443961732	650648780400918528	f	lobsterrolling
Good Morning NYC,\nWe are parked on W67 Street & Broadway today. Come enjoy Lobster Rolls, Sliders & Lobster Corn Chowder. Have a great day.	1443884459	650324672689668096	f	lobsterrolling
On 56th & Broadway, warm up with a hot Lobster Corn Chowder and New England Lobster roll toasted with warm clarified butter	1443795643	649952152346038272	f	lobsterrolling
On 70th & York today, enjoy a Lobster Corn Chowder in this perfect New England weather !	1443708285	649585748279214080	f	lobsterrolling
At flatiron today; 20th & 5th Ave. The lobster corn chowder is back ! Also serving New England style Lobster rolls & sliders, see you here !	1443623024	649228135221882880	f	lobsterrolling
On our way to 70th & York! Back with the Lobster Corn Chowder to warm y'all up ! See you soon @Cornell @Sothebys @Chase @DuaneReade	1443448370	648495585427914752	f	lobsterrolling
Good morning, come enjoy a lobster roll paired with a hot Lobster Corn Chowder , yes ITS BACK ! On 76th and Columbus avenue	1443366751	648153248906539008	f	lobsterrolling
Good Morning NYC,\nWe are parked on W55 St & Broadway today. Come enjoy Fresh Lobster Rolls & Sliders. Have a great day.	1443190635	647414564456398848	f	lobsterrolling
Wouldn't it be great to enjoy a Lobster roll after a long day of work?! Moved up to 79th street & Broadway, see you here !	1443038701	646777310331338752	f	lobsterrolling
We're on 57th & 8th today! Come on by for a New England Style Lobster Roll with warm bun toasted with clarified butter , yumm 	1443019669	646697484094435328	f	lobsterrolling
Good Morning NYC,\nWe are parked on W74 St & Columbus Ave today. Come enjoy Fresh Lobster Rolls, Sliders & Lobster Gazpacho. Have a lovely 1.	1442760887	645612072517136384	f	lobsterrolling
Enjoy some tacos with a side of SPOOKY Halloween brooklyn CrownHeights https://t.co/Kyk5KXzaQR	1445962131	659039061240365056	f	domotaco
Good Morning NYC,\nWe are parked on W67st & Broadway today till 5pm. Come enjoy NYC Best Lobster Roll & Sliders. Try our Lobster Gazpacho 2.	1442667247	645219317232074752	f	lobsterrolling
Good Morning NYC,\nToday we are parked on W55 St & Broadway till 4pm. Come enjoy Fresh Lobster Rolls, Sliders & Lobster Gazpacho. Peace n luv	1442585313	644875659345559552	f	lobsterrolling
Rent our Truck for your party or event https://t.co/qQPgqTx2Iy @MrVsPizza in staten-Island or visit us at arthurkill https://t.co/Eli9xPucZ8	1446197621	660026777943842816	f	valduccis
RT @encyclopizzeria: @BuzzFeedFood Sobbing Look at how good dis hydrated pizza looks tho! . https://t.co/1SIsRtKoLL	1446129268	659740085781417984	f	valduccis
RT @greenboxny: Lookin good!  https://t.co/H3J6GGCQF3	1446127853	659734151717851136	f	valduccis
Rent Our truck in staten-Island call @MrVsPizza  @greenboxny @Valduccis @Foodtruckstars_ @foodNfest @scottspizzatour https://t.co/LEEfv4jap4	1446127588	659733037702373376	f	valduccis
RT @greenboxny: Friday vibes. We know you guys get it.  FridayFeeling @Valduccis @ATownPizzaria @pistl @encyclopizzeria http://t.co/yO...	1446127438	659732412205826048	f	valduccis
bestcaters yummy @MrVsPizza @greenboxny @Valduccis @Foodtruckstars_ @Foodtruckstars_ @eatupnewyork @Table87 yumyu https://t.co/tCKWapRwK2	1446061647	659456462738051073	f	valduccis
RT @dmg228123: @Valduccis looks delish!!	1446042706	659377020091109376	f	valduccis
6 Ft Hero's Are our Thing @MrVsPizza @greenboxny @Valduccis @FoodtoEat @FoodPorn @eatupnewyork @Foodtruckstars_ https://t.co/DJQch1Yjrh	1446040998	659369855741726721	f	valduccis
Come to Mr. V's in Staten Island named after my dad. You will be Proud of this one   Miss You Everyday !!!!!!! https://t.co/9VjpG70lGv	1445956182	659014111922102273	f	valduccis
RT @greenboxny:  https://t.co/RIlXOotxZC	1445956042	659013522584641536	f	valduccis
BestPizzaEver @greenboxny @MrVsPizza @Valduccis https://t.co/xmt8jwpIO1	1445909517	658818384050696192	f	valduccis
RT @hianthony: @ChrisPollone fresh, slightly sweet sauce, crispy crust, flavor through each bite. Big fan of @Valduccis Grandma pie.	1445714093	657998714640973824	f	valduccis
RT @hianthony: Going to see @Valduccis pizza truck just off 20th Street and 1st Avenue today. https://t.co/V8llkPs6A5	1445713552	657996446273314816	f	valduccis
RT @MrVsPizza: Worlds best pizza @Valduccis https://t.co/aEmVmipJLH	1445696745	657925954904412160	f	valduccis
Let us cater your next event @Valduccis @greenboxny @MrVsPizza @Foodtruckstars_ @foodNfest https://t.co/UsiO03IEFL	1445694874	657918106350784512	f	valduccis
Happy birthday Florie @FlorieHuppert https://t.co/sSVYV9L4qN	1445643704	657703482854645760	f	valduccis
RT @MrVsPizza: best pizza @MrVsPizza @greenboxny @Valduccis https://t.co/xoXMaUQiSH	1445618254	657596737452920833	f	valduccis
yummymummy @Valduccis @greenboxny @MrVsPizza https://t.co/7JIbymTFJN	1445618019	657595751724404737	f	valduccis
If you are in Staten Island come to @MrVsPizza and enjoy valduccis Pizza @greenboxny @FoodtoEat @eatupnewyork @ https://t.co/oMVtPhI4YK	1445605495	657543224060456960	f	valduccis
Panini bestpizza bestpani  @Valduccis  @greenboxny  @MrVsPizza @Foodtruckstars_ @FoodtoEat @foodNfest https://t.co/MXAFwWWwVx	1445569592	657392635351605248	f	valduccis
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
Sorry for last week but the truck is back in FiDi on the north side of Old Slip & Water today!	1446213317	660092611764457472	f	domotaco
Catch us out at metrotech plaza today! @downtownbklyn brooklyn foodtruck goodeats	1446125648	659724902732181504	f	domotaco
Truck at @dumbolot today on Jay & Water, BwayBites open on 33rd & Broadway!	1446041241	659370875930570753	f	domotaco
RT @kwprime: .@domotaco with @haynthit and @ericd14  (@ Viacom in New York, NY) https://t.co/sEWiBhwKb5 https://t.co/B9wchDEWed	1445967543	659061760905904129	f	domotaco
Hudson and King | 733 Franklin Ave | 33rd and Broadway  asiantaqueria	1445953389	659002397646196737	f	domotaco
 33rd and Broadway | 733 Franklin Ave | 52nd and 6th asiantaqueria	1445867896	658643813754384384	f	domotaco
Fidi, truck is in serious repair. Sorry for the late notice!!	1445617237	657592473552855041	f	domotaco
Sorry FiDi due to mechanical issues the truck had to call it early, catch us next week	1445617060	657591727922896896	f	domotaco
Last day at 39th and Broadway garmentdistrict Come get your   	1445616381	657588882448363520	f	domotaco
	1445615058	657583333988143104	f	domotaco
Catch the truck in FiDi today on Old Slip & Water St!	1445608458	657555651736920064	f	domotaco
Last chance to catch your favorite AsianTaqueria on 39th & Broadway at UrbanSpaceGarment! BwayBites also open on 33rd & Bway!	1445608381	657555328083632128	f	domotaco
Last chance to get Domo Taco at UrbanSpaceGarment on 39th & Broadway! BwayBites still open for a few more weeks on 33rd & Broadway	1445524901	657205186495033344	f	domotaco
53rd & Park today!	1445524842	657204940956286977	f	domotaco
33rd and Broadway | 39th and Broadway | 47th and park | 733 Franklin Ave, BK asiantaqueria	1445438072	656840998115368960	f	domotaco
Catch us on the corner of 47th & Park today! We'll be back at @dumbolot next week	1445438059	656840943652511744	f	domotaco
47th and park today till 2:30pm!	1445438012	656840747371659264	f	domotaco
We made some changes to the menu! Come check us out!  asiantaqueria https://t.co/AQKp91n8I2	1445374845	656575806840422400	f	domotaco
Last week here at garment district! Catch us here on 39th and Broadway till 9pm!!	1445356259	656497850109554688	f	domotaco
@EaterNY do you know when ichiran is open?	1442934324	646339521093746688	f	shanghaisogo
Japanese Ramen Chain Ichiran Will Finally Bring Ultra-Serious Solo Slurping to NYC http://t.co/9LXENtWLsl via @EaterNY	1439605325	632376687406227456	f	shanghaisogo
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
Last day to show us your best eddies pizza photo! Tag @eddiespizza and @yummyworldofficial for a chance to win! https://t.co/NIC8PmEcfR	1446223240	660134233055342592	f	eddiespizzany
Last day to show us your best eddies pizza photo! Tag @eddiespizzany and @yummyworld_ for a chance to... https://t.co/g9BNFZMX9M	1446223239	660134226772258816	f	eddiespizzany
Let us see your best Eddies Pizza photos and win a prize! Just tag @eddiespizza and @yummyworldofficial yummyworld https://t.co/FEmt4tHCdY	1446137349	659773977942843392	f	eddiespizzany
Let us see your best Eddies Pizza photos and win a prize! Just tag @eddiespizzany and @yummyworld_... https://t.co/37gWu4c8kQ	1446137344	659773959970365440	f	eddiespizzany
Let us see your best eddies pizza photos! Just tag @eddiespizza and @yummyworldofficial for a chance to win a... https://t.co/ALrjQ6QqBx	1446060487	659451597408223232	f	eddiespizzany
Let us see your BEST photos of Eddie's Pizza and you can win one of three 'Cheezy' prizes from Yummy World! pizza https://t.co/hYEuYGNZvJ	1445980496	659116090484768770	f	eddiespizzany
@AshleeWhite23 so glad to have you back again!	1445697693	657929927946317825	f	eddiespizzany
RT @UrbanSpaceNYC: Word on the street is that UrbanspaceVanderbilt will be rolling out a brand new BRUNCH menu within the coming weeks!!	1445380280	656598600605171712	f	eddiespizzany
Does anyone have 4 tickets to this Sunday game mets/Cubs? Looking to trade tickets for eddies pizza truck at your... http://t.co/nfotd7ld2t	1445027704	655119790298628096	f	eddiespizzany
Does anyone have 4 tickets to this Sunday game mets/Cubs? Looking to trade tickets for eddies pizza... https://t.co/doRxUVyyEa	1445027701	655119780488327168	f	eddiespizzany
Hello! It's Tuesday and we are parked on East 98th street and Madison ave. right in front of Mount Sinai... http://t.co/W2nUVk2QBf	1444750515	653957177057538048	f	eddiespizzany
@jennyhutt call the restaurant and they would be happy to help!	1444599250	653322727043014656	f	eddiespizzany
@deekay31 sorry we are not but we will be there in two weeks	1444351842	652285021722701824	f	eddiespizzany
We will be off the road today for maintenance and repairs.	1443536641	648865820454612992	f	eddiespizzany
RT @WSJNY: Mad. Sq. Eats. brings vendors like Takumi Taco and Robertas to Worth Square  http://t.co/F8nopjFPmY http://t.co/jbkK0earjE	1443305165	647894940924674048	f	eddiespizzany
@GothamGator1 off the road for a private even	1443026668	646726838744690688	f	eddiespizzany
RT @i8and8: They are now at @urbanspacenyc Vanderbilt! Legitski Asian fusion tacos and lychee tea @TakumiTacoNY http://t.co/BVmqHOvjcz	1442779355	645689533741309952	f	eddiespizzany
RT @TakumiTacoNY: Come visit us @usvanderbilt located on 45th and Vanderbilt. 4 coronas for $20 all day! http://t.co/ilLdepLMWV	1442677862	645263840817451008	f	eddiespizzany
@schandy97 sorry not today. We had a private event.	1442620141	645021741115441152	f	eddiespizzany
eddiespizza at tdbank grand opening today 23rd street and 7th ave. Free cookies and drinks 10a to 2p.... http://t.co/1bwA4HbJe0	1442583489	644868011162140672	f	eddiespizzany
RT @secret__nyc: New York City isn't just for meat lovers. @dirtcandy @CandleCafe @TaimMobile https://t.co/jXsKul7IQX	1446148267	659819771567976448	f	taimmobile
Love it! embraceit carpediem  https://t.co/UA3JdVrPct	1446148231	659819621839695873	f	taimmobile
We're on Vandam and Varick today serving some fresh and delicious falafel and smoothies!	1446128472	659736745911713792	f	taimmobile
20th and 5th today! See you there for taimtuesdays!	1445954461	659006893579476993	f	taimmobile
RT @POWERHOUSEArena: TONIGHT: @NadiaArumugam launches Women Chefs of NY w/@EinatAdmony @fanygerson & @ilovebuvette. Treats will b served!\nh...	1445878337	658687605916221441	f	taimmobile
Happy Monday!  See you in FiDi on Water and Broad!	1445876711	658680783490654209	f	taimmobile
We're still hiring for all positions! Bartenders, cooks, hostess, servers, prep cooks + more! Send your resume to info@barbolonatny.com	1445873315	658666542234734592	f	taimmobile
RT @ServyApp: Check @ZagatNYC best Middle Eastern spots https://t.co/945mo4uoEe@TaimMobile 2 & 3! Eval on Servy for great food & partial...	1445620115	657604544608759809	f	taimmobile
We're Hiring! Last day for open call. TODAY 10AM - 3PM at @BarBolonat - 611 Hudson St. FOH + BOH. Bring your resume + a smile! GFJ NYCJobs	1445605385	657542762976428032	f	taimmobile
Guess what! Our Nolita location is now open until 10pm! \n\n: @aubsgerbs @ Taim Falafel & Smoothie Bar... https://t.co/Rx5NujV9Vx	1445538208	657261000304013312	f	taimmobile
Big news...Our Nolita location is now open until 10PM!	1445536318	657253073652445184	f	taimmobile
RT @EinatAdmony: We're Hiring! Open call TODAY & FRIDAY. 10AM - 3PM at @BarBolonat - 611 Hudson St.  FOH + BOH. Bring your resume + a smile...	1445531361	657232280226803712	f	taimmobile
Vandam and Varick we are here for you.  Come get your falafel fix today 11-3!	1445521875	657192495642726400	f	taimmobile
We're Hiring! Open call TODAY & FRIDAY. 10AM - 3 PM at @BarBolonat - 611 Hudson St.  FOH + BOH. Bring your resume + a smile! GFJ NYCJobs	1445518978	657180343846440960	f	taimmobile
We're Hiring! Open call TODAY, TOMORROW & FRIDAY. 10 AM - 3PM at @BarBolonat - 611 Hudson St.  FOH & BOH Bring resume & a smile! @PoachedNYC	1445442651	656860207461572608	f	taimmobile
Come get your falafel fix today on 20th and 5th in flatiron!	1445353342	656485614263504896	f	taimmobile
RT @BalaboostaNYC: Einat Admony Branches Out. Combina Opens November 2015 http://t.co/Tfu91J0gat	1445282735	656189469184380928	f	taimmobile
On Water and Broad today!	1445267314	656124790495834113	f	taimmobile
Today is our last day @prospect_park of the season!  Join us for the final foodtruckrally!	1445176815	655745209775472644	f	taimmobile
Come visit our Nolita location today for a free falafel sandwich thanks to our friends at... https://t.co/GGkxUX4iSg	1445098131	655415184626872320	f	taimmobile
Once again we are parting with the incomparable @TheBelleclaire why do we have to wait an entire year to do this again BelleClaireUWSFinest	1446232214	660171874329108481	f	sweeterynyc
Hoping that The Mets bring a championship 2 NYC &like always Delta brings The Mets home safely! LetsGoMets&FlyDelta https://t.co/lvcxDzxNPf	1445789903	658316685770924032	f	sweeterynyc
@Mets @Delta No 1 is more true 2 the orange & blue & loves the Mets (& Delta) more than we do, hoping this Platinum Medallion member to wins	1445787966	658308561005625344	f	sweeterynyc
RT @Table87: @Valduccis @bigdsgrub @SweeteryNYC @foodNfest @greenboxny @FoodtoEat @MrVsPizza @FoodPorn	1444926731	654696282154405890	f	sweeterynyc
RT @chidiaqian: Magical morning surprise: free coffee and nutella croissants from @SweeteryNYC. Penguins, go outside! http://t.co/2PQYALaZKM	1443714089	649610089578561536	f	sweeterynyc
Come to Hudson/King St 4 ur FREE cup of exceptional coffee & a sidekick treat, a croissant w/Nutella, could this be the best part of ur day?	1443706721	649579188282892288	f	sweeterynyc
Good morning Hudson/King St. yesterday was so much fun we say lets do FREE again! Coffee and croissants with or w/o Nuttela is on us this AM	1443702692	649562286487642112	f	sweeterynyc
I'll tell you what's happening!! We are giving out FREE COFFEE AND CROISSANTS at Hudson and King Sts!	1443701839	649558708654092288	f	sweeterynyc
RT @jennfisher23: When @SweeteryNYC gives out free coffee and croissants on humpday  THANK YOU! http://t.co/Fq2jWX3YWC	1443627229	649245771984977921	f	sweeterynyc
We served love to Hudson/King St. today and got love back in return, so we say lets do FREE again tomorrow morning, who can argue with that!	1443623510	649230173171228672	f	sweeterynyc
Who loves ya Hudson St, Sweetery does w/FREE amazing coffee & very tasty filled croissants. Come now or blame no 1but the 1 in the mirror	1443619344	649212699667107840	f	sweeterynyc
Hudson/King St, you'll be singing in the rain with a FREE cup of coffee and croissant from your friends at SweeteryNYC HudsonStYouDeserveIt	1443616686	649201552503230464	f	sweeterynyc
Come 1, come all to Hudson and King Streets for FREE Coffee and Croissants...on us!!!	1443614015	649190348082823168	f	sweeterynyc
2day is Nat. Coffee Day but Wed. will b FREE Sweetery Coffee & Croissant morning. Come 2 our mobile bake shop on Hudson/King St from 8-10:30	1443551389	648927676443533316	f	sweeterynyc
Gd morning Hudson/KIng St. this Wed. & Thur. Sweetery is going 2 give back 2 all of our loyal & fantastic customers w/FREE coffee & treats	1443450778	648505684884111364	f	sweeterynyc
Be sure to like their FB page!\nhttp://t.co/ppeggOiFQI http://t.co/fNW6acIeFh	1441033011	638364836695568384	f	sweeterynyc
Another wonderful, happy event creating a bonding friendship with wonderful people! \n\nCheck out the video!... http://t.co/hzj9VtTYWg	1441032501	638362697361399808	f	sweeterynyc
HZGlobalTour2015 @SweeteryNYC is honored 2 B part of such a happy & bonding friendship event https://t.co/74YCzaUlIn http://t.co/LxCofEhh1Q	1441032060	638360846087929856	f	sweeterynyc
Take a ride on the Reading Railroad if u will, but 1st find the Here & Now Monopoly trk 4 ur free ice cream in a hat & spl Monopoly cookie	1440186799	634815564993699840	f	sweeterynyc
If you're in jail and have a get out of jail free card use it & head on over to 8th Av btw 56/57th St for free treats, then you can pass go!	1440182382	634797037272309760	f	sweeterynyc
RT @EaterVegas: Breaking: R.I.P. Kerry Simon 1955-2015 http://t.co/ueU9APXpWn http://t.co/LgvHkVmlwX	1441989988	642378685484433408	f	lovemamak
Open at Bergen and Court street until 8pm. Happy Halloween!!!!!!	1446294910	660434838453944320	f	carpedonutnyc
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
HAPPY HALLOWEEN Change of plans- Because of parking problems the SHUKA TRUCK WILL BE PARKED ON 21st St & 5th AV !	1446218356	660113747722260480	f	shukanyc
SHUKA WEDNESDAY! Change of PLANS- Today - 47th St & Park AV ! See you !  https://t.co/TKAEOR6mPj	1446044513	659384598015713280	f	shukanyc
@fffeig 47th St & Park	1446044423	659384218611523585	f	shukanyc
THE SHUKA TEAM Today FIDI - Hanover Sq ! It's SHAKSHUKA Time!  https://t.co/1ujJl1pvgy	1445959331	659027318229307392	f	shukanyc
@tamecohen Tomorrow- Hanover Sq!	1445876896	658681562691731456	f	shukanyc
@SethSaidSo 	1445784460	658293856551727104	f	shukanyc
@rabbilaufer until 2:00	1445781375	658280917543317505	f	shukanyc
SHAKSHUKA in motion! Sunday's are UPPER WEST SIDE! 67th St & Broadway! https://t.co/3fFexJmn9w	1445781296	658280587569012736	f	shukanyc
GREEN FRIDAY  Today- 47th St & Park AV ! Shabbat Shalom from THE SHUKA TEAM ! Here until the LAST Egg  https://t.co/zPmwaBOxqL	1445613148	657575322540490752	f	shukanyc
SHUKA THURSDAY! Today - NYU - W4th St & University Pl  Here until the last EGG  https://t.co/ecVWUsu08i	1445525343	657207042881531904	f	shukanyc
DO WHAT YOU LOVE ! Wednesday's at @WeWork wework Come have some INDOOR Shakshuka From the BEST truck in nyc https://t.co/TxquNqMTBU	1445441691	656856177389805568	f	shukanyc
TUESDAY TUESDAY TUESDAY!! Financial District- Hanover Sq! Have a SHUKA DAY ! Here until the VERY last Egg https://t.co/mHLkxN83ap	1445353668	656486981690634240	f	shukanyc
SHUKA TRUCK SCHEDULE:\nSunday-\n67th St & Broadway \nMonday-\n21st St & 5th Av \nTuesday -\nFidi- Hanover Sq\nWednesday... http://t.co/AiCwoFDZiE	1445265734	656118160710459393	f	shukanyc
SHAKSHUKA JUNGLE  Sunday are  67th St & Broadway  HERE UNTIL THE LAST EGG! http://t.co/lHfQBAkB3C	1445183425	655772933604909056	f	shukanyc
We will be opened by 11:00!	1445147432	655621968897712128	f	shukanyc
SHAKSHUKA GOALS!  Happy FRIDAY! Today - 47th St & Park AV ! Here until the LAST EGG Shabbat Shalom NYC ! http://t.co/bKTX48WR3B	1445005415	655026303394037760	f	shukanyc
THURSDAY'S AT OUT FAVORITE  @nyuniversity ! Today - NYU -W4th St & University Pl  Have a SHUKA DAY !  http://t.co/KNPH3NxTGD	1444917777	654658726054400000	f	shukanyc
THE SHUKA TRUCK WILL BRING THE PEACE TO THE MIDDLE EAST!  Today- FIDI - Hanover Sq ! Have A SHUKA Day !  http://t.co/5dPnbd3sWG	1444748892	653950367382786048	f	shukanyc
SHUKA TRUCK NEW SCHEDULE:\nSunday-\n67th St & Broadway \nMonday-\n21st St & 5th Av \nTuesday -\nFidi- Hanover Sq... http://t.co/5esM1lr3g5	1444660583	653579974314602497	f	shukanyc
Sundays are UPPER WEST SIDE! 67th St & BROADWAY  http://t.co/gXBGpuHunH	1444574618	653219412808474626	f	shukanyc
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
Holiday donuts, pumpkin pies, truffled vegan mac n cheese, & mouth watering entrees!\n\nPick up locations in NYC & NJ\n\nhttps://t.co/GBvhsuRdDG	1446233190	660175964756975616	f	veganlunchtruck
This is why we have always supported Farm Sanctuary.   I am grateful for the work they do.   https://t.co/BuUR9fohak	1445916414	658847309938098176	f	veganlunchtruck
@Plan_Ti only another few weeks 	1445894883	658757002982649857	f	veganlunchtruck
Don't eat frozen peas out of your dad's business socks.  Instead get an absurdly yummy Thanksgiving feast made by... https://t.co/sowzoQEtuH	1445894139	658753881279623168	f	veganlunchtruck
RT @NJVegFest: Here's the list of where to get vegan Thanksgiving in New Jersey https://t.co/QYOuCTK5by @VeganLunchTruck @veganizedfoods @A...	1445867010	658640093968646144	f	veganlunchtruck
Pumpkin pecan fritters are on the truck today in Red Bank NJ!\nWe are open 9:00-2:30 at the farmers market on the... https://t.co/BLur2kGVrJ	1445771525	658239603330019328	f	veganlunchtruck
Last chance to get tickets for the vegan thanksgiving cooking class I'm teaching this Tuesday at @degustibusnyc\n\nhttps://t.co/aPcIK5q6Hl	1445717248	658011947011588096	f	veganlunchtruck
Have your thanksgiving catered by The Cinnamon Snail!\n\nMenu and details here:\nhttps://t.co/GBvhsuRdDG https://t.co/ccAy9UPIL2	1445437539	656838765063729152	f	veganlunchtruck
Have your thanksgiving catered by The Cinnamon Snail!\n\nMenu and details here:\nhttps://t.co/GBvhsuRdDG https://t.co/9N5VBeATHl	1445436227	656833261268680705	f	veganlunchtruck
RT @behindfoodcarts: Even if you're not a vegan, check out our friend Adam of @VeganLunchTruck's new cookbook, Street Vegan! http://t.co/qZ...	1445278882	656173307809669120	f	veganlunchtruck
We are looking for bakers to work at our Brooklyn kitchen overnight. \n\nPart time/full time. \n\nSend resumes to thecinnamonsnail@gmail.com	1445272595	656146938388217857	f	veganlunchtruck
RT @CleanPlates: Cinnamon Snail can cater your vegan Thanksgiving! @veganlunchtruck Check it out: http://t.co/87NM07sLRa	1445262779	656105766890418176	f	veganlunchtruck
PLEASE RT:\n\nHave your Thanksgiving catered by The Cinnamon Snail!\n\nMenu and ordering deets here:\nhttps://t.co/GBvhsuRdDG	1445190941	655804458761367552	f	veganlunchtruck
A the Red Bank NJ farmers market 9:10-2:30\n\nLavender pear French toast, thanksgiving sandoos & rose water toasted pistachio cake donuts	1445173158	655729869259710464	f	veganlunchtruck
WE WILL BE OFFERING THANKSGIVING CATERING THIS YEAR!\n\nDue to the close timing of an exciting upcoming project we... http://t.co/O9XW9T0FAw	1444914089	654643253715845120	f	veganlunchtruck
@tummler10 we are in red bank nj this Sunday 9:00-2:30.  What was our old handle? Always been @VeganLunchTruck here on Twitter	1444857173	654404533783764992	f	veganlunchtruck
RT @niftynyc: Cool job alert! Office Manager for The Cinnamon Snail (@VeganLunchTruck): http://t.co/xyl8BGo5s7 NYCjobs vegan	1444846211	654358556519436288	f	veganlunchtruck
A selection of some of the absurdly yummy bao buns featured in our cookbook STREET VEGAN available at your... http://t.co/sieE2BcgBq	1444764738	654016833541001216	f	veganlunchtruck
@DQ90 sorry.  We are not.	1444764396	654015398648631297	f	veganlunchtruck
RT @EpochTaste: This Creme Brulee  from @VeganLunchTruck is a showstopper, w/ 3 diff scrumptious layers http://t.co/ToZwA7AKd6 http://t.co...	1444741371	653918824035651584	f	veganlunchtruck
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
Today is the Last Day for Mexico Blvd https://t.co/mSMo7ErzJv via @midtownlunch	1446291181	660419197034479616	f	mexicoblvd
FollowUs @MontFarmersMrkt have a BBQblackbeanburger @thegreenradish1 &Coffee @yogicchai_mtc @BlackTieFF till 2pm https://t.co/NioISjUcjJ	1446292831	660426119947030528	f	thegreenradish1
De Goesting cart is slinging wafels today @ Lincoln Center- 62nd St &  Broadway,  8:30AM-9:00PM dingesforeveryone https://t.co/xcoECEkXYA	1446294916	660434863988850688	f	waffletruck
RT @NYOwls: GetUpForGameday! YES, we'll be @ShortysNYC on Madison TONIGHT! 8pm. WeTheT BeTheT Wear cherry + white! https://t.co/1yq79xZV...	1446295140	660435801457745920	f	shortysnyc
RT @cloverfield61: 4am can not get here any faster @JCLayfield @WWE @RealKingRegal @izzy_dagg @BeckyLynchWWE @fluffyguy @dubpies https://t....	1446297776	660446858662305792	f	dubpies
RT @LLstatesman: Great to be back in NYC for some @waffletruck to prep for @nycmarathon https://t.co/qGj70O19JV	1446302019	660464654163030018	f	waffletruck
Thank you @CrimsonDragon5 a Happy Halloween to you too!	1446303575	660471183721275392	f	waffletruck
De TRUCKS:\nMomma Truck @ Park Slope - 7th Ave & Carroll St til 4pm\nKastaar @ York & 79th St til 6pm	1446303216	660469677366341632	f	waffletruck
De CARTS: (2/2)\nVedette @ 60th & 5th Ave (Manhattan) til 7pm\nBierbeek @ De Great Lawn, Central Park til 7pm	1446303199	660469605635375104	f	waffletruck
De CARTS: (1/2)\nGoesting @ 66th & Broadway til 10pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm	1446303185	660469548450193408	f	waffletruck
HAPPY HALLOWEEN!\nLe Cafe @ 15 Ave B til 11pm\nDe Wafel Cabana @ 35th & Broadway til 10pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1446303040	660468936878792704	f	waffletruck
RT @NHLFlyers: Good luck to @Temple_FB tonight! TeamPhilly BrotherlyLove https://t.co/y8CzDQesf7	1446302997	660468759757504512	f	shortysnyc
Oh my Gourd, beautiful day @MontFarmersMrkt @thegreenradish1 @yogicchai @taqueriAutentic @MontclairEats @baristanet https://t.co/Doftvv4UlJ	1446304314	660474280594026497	f	thegreenradish1
The Burger Palace is wishing you all a safe and Fa B Lous! Halloween  Halloween2015	1446305345	660478605777051648	f	fritesnmeats
!!! Happy Halloween !!!	1446305698	660480087310131200	f	thetreatstruck
Happy Halloween \nWe are located at\nForest Hills Queens \nUntil 8:30 pm\nkettlecornnyc https://t.co/LxNy36xGS0	1446306663	660484134842802176	f	kettlecornnyc
RT @NYNJBaykeeper: Great day for @MontFarmersMrkt! @thegreenradish1 will be at @LibertyParkNJ Rally tmrw too! https://t.co/IHfV2NYTZ6	1446308364	660491269848846337	f	thegreenradish1
TONIGHT HALLOWEEN NIGHT WE TAKEOVER THE copacabananyc !!\nDjs dj_elmer_g / C-SMOOTH \ndjluchony set at... https://t.co/doZoV6A2FQ	1446309164	660494625778622464	f	latinkitchennyc
WE ARE DELICIOUS!!\nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX NY... https://t.co/nqxr5TPeHk	1446308974	660493825870274560	f	latinkitchennyc
MI GENTE!!!!\nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX NY 10465\n347-691-3100\n(we are open for... https://t.co/93bwEyny9E	1446308864	660493367558725632	f	latinkitchennyc
SUNDAY NOV.1ST 1PM-7PM\nNYC 1 \nSUNDAY DAY BRUNCH PARTY \nIN THE TRISTATE AREA\ndoncoqui.newrochelle \n2... https://t.co/azM9g2yL17	1446308813	660493153758273536	f	latinkitchennyc
@JonathanThen thanks for the machdog love , we're glad you enjoyed it !!	1446310402	660499814824747008	f	coneyshack
RT @houstonhallnyc: Right Now, All Beer Is Craft Beer beernews craftbeer beerhall beerinfo https://t.co/sQi3V0dEnd	1446310243	660499149272518657	f	milktrucknyc
RT @smorgasburg: We're open today in @IndustryCityBK w/ @bkflea, 10-6p and outdoors in Williamsburg, 11a-6p. (@sundaygravynyc) https://t.co...	1446310237	660499126510030848	f	milktrucknyc
@TeamBarFinder ShortysUpperEast GameSound PennState	1446310083	660498477915467776	f	shortysnyc
If only houses handed on @NeaExpress pizzas instead of candy on Halloween onecanonlydream	1446310927	660502017182441472	f	neaexpress
Happy Halloween folks servin up our cheesesteaks today 17th St and Broadway GOT WHIZ? nycsbest cheesesteaks for all https://t.co/taXJHJJlQc	1446311138	660502904521039872	f	carlssteaks
Happy Halloween folks servin up our cheesesteaks today 17th St and Broadway GOT WHIZ? NYCSBEST CHEESESTEAKS FOR ALL https://t.co/1u84DoUFbe	1446310923	660502002166706176	f	carlssteaks
RT @JohnJCampbell: What a game. Thank you Wallabies. What a team. Thank you All Blacks. What a captain. Thank you Richie. What a truly, blo...	1446314355	660516394975567873	f	dubpies
. @KOCatering_Pies great game, good fight, what size t-shirts do you wear? We'll send you our fave new NZ flag to proudly fly! Chur	1446314115	660515391211479040	f	dubpies
RT @VendorPower: So many customers devastated over closing of @MexicoBlvd, not one tweet (that we can find) to @NYCCouncil  apathy	1446314195	660515726667735041	f	mexicoblvd
Cheers! https://t.co/z5Og7TcJiF	1446314695	660517824755073024	f	dubpies
RT @PaulSpain: Congrats to the @AllBlacks - what an incredible way to continue their global domination RWCFinal https://t.co/05fwIt6MNw	1446314662	660517683805487104	f	dubpies
Hell yes. Great, great AllBlack win ;-) And LFC won at CFC. Can't ask for much more! https://t.co/Odi6EtTRwZ	1446314588	660517374160957440	f	dubpies
RT @aaronpinero: Mac and cheese from @milktrucknyc is a super deal Smorgasburg	1446315921	660522965075959808	f	milktrucknyc
New ways to get your dinges on, visit our booth at Broadway Bites Market on 33rd & 6th Ave til 9pm! dingesandaview https://t.co/Gc2DieRGIw	1446314517	660517075451060224	f	waffletruck
Happy Halloween! Come by either location for some falafel and trick or treats!  @ taim https://t.co/lkHO2sckGE	1446314968	660518967346376708	f	taimmobile
Happy Halloween!	1446318876	660535360678662144	f	mamuthainoodle
Trick Or Treat \nCome try our flavors of the day\nBanana, Egg Nog, Pear, Pizza,Salt & Vinegar \nWe are located at... https://t.co/TSaPrJYZIg	1446323767	660555872024662016	f	kettlecornnyc
oldtraditionalpolishcuisine catering nyc veggie https://t.co/GE2eInWzFh	1446323936	660556583919886336	f	polishcuisine
oldtraditionalpolishcuisine pierogi catering nyc https://t.co/GMzNwpXfzB	1446323635	660555318078939136	f	polishcuisine
oldtraditionalpolishcuisine kielbasa grill catering nyc https://t.co/yMwasG8nzN	1446323332	660554048190472192	f	polishcuisine
@Intuit ????Go Payment???? Again? What is going on?	1446323029	660552777932922880	f	mexicoblvd
Apple cider donuts with a side of SPOOKY at Bergen and Court. carpedonutnyc https://t.co/ElsmYVoz5H	1446323696	660555575172997120	f	carpedonutnyc
Complimentary Pasta today!! 12-5pm  18thandbroadway MarathonWeek provided by ParagonSports & Pontirossifood https://t.co/aoSLwejyiE	1446322757	660551638390829056	f	pontirossifood
grilled chicken with veggies marinated only in Polish spices different classic tasty https://t.co/bdshJVA1qc	1446324321	660558195946094593	f	polishcuisine
Temple Game Sound TONIGHT @ Shorty's 66 Madison Ave TempleVsND	1446325895	660564800284598272	f	shortysnyc
Carb load @shortysnyc & catch WorldSeries Game 4. Game sound at Shorty's UES HellsKitchen Fidi https://t.co/mXAJKyjTRy	1446325845	660564587759079424	f	shortysnyc
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

