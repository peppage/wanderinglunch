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
51c1ea41498e372d91835cf9	/5067950_pSXIZo_RqO8Hh5AuWcomjr0p3q_pXPUMWe99W8hUGTU.jpg	public	burgersandbites	f
51a79983498e3044671cd784	/1441492_yfySwml4ChzJ_ni5DxTq-8n2UlecWBWjgxR-ygA6pYc.jpg	public	burgersandbites	f
501c284be4b07d0ab63e08be	/vQv8P8_hFNwHMmpR7k6-arr8zqYmmgoSG_aAPJuz-ws.jpg	public	itizyicecream	f
535d6fe9498eeb428f0a49a5	/643701_B0msQNcQCClAiTuYbiNnskLICf99ehNmerkWdhYNR8c.jpg	public	snowday	f
533ddd9a498ebf7fb4775ca2	/36814481_r4TU0Q7tJ6Xum58iZ5olLRY6sV-P4dN3psrhw2ZZKZ8.jpg	public	snowday	f
51e83b4a498e0a1c64e62828	/26624_AGoljLki5SS-GJGKaAGB75mloHKRBkJ1Qj5BQCRP1_Y.jpg	public	itizyicecream	f
5176cceb498efe500552cc9e	/21735785_zaQs-7anNinrrQlobBV2AjNxquTXs5g8ZY0NxvoxvHo.jpg	public	steaksncrepes	f
523b2edc11d265bf373f82a0	/8853695_cjpq3trk4bFpcU1oHWwj4XxwwD9ZI169sNncUyOQoM8.jpg	public	steaksncrepes	f
529fe66b498e1fd14afe696f	/68150_h0wbg6xbNwrEjXD6uaE12ZDZYF_h55LN99Es520nMBI.jpg	public	mooshugrill	f
5267fa9611d2688bdc4587a2	/2136029_bvqot1MnMJ9IGYsYJkamqTiE_lL96OcfilWMxskhdU8.jpg	public	mooshugrill	f
5213a7c011d27a56f99dfba3	/11074699_K2ka1_NxiELyTqgjvY3oMN70IUxIlADqRIAb5QpzsLM.jpg	public	mooshugrill	f
525b3a3711d2040fdcbd6fee	/52031712_DN0C9vfm3iv1geUuFX92Pt0jwgl8NhbGokLj_o0Ebjg.jpg	public	mooshugrill	f
551eb68a498e136a7e3dacac	/89498162_GK7wVV_VF_ZbdcpURHla6Btpz7w6ls1aYNB9Q020WxY.jpg	public	neaexpress	f
51f2be1f498e71235db5b61b	/117715_mGfGU0UGjUMhgqgwrDPf2f44NZtfMrobqJMF8ahsrjY.jpg	public	sweetchilinyc	f
5239c6b7498e0f1f28af16fc	/2751553_7BX-8PVCQt3ELg-hV0rfmQhwRrGHbz9brLHsuV6IIhs.jpg	public	sweetchilinyc	t
5239ddce11d2ab4765d5cc7f	/5568483_alwOH7sfGU8-pKfLmurfe9rt3pk2G6p90KwFyC6hq1A.jpg	public	sweetchilinyc	f
50ef1f18e4b0710a5e5cb1eb	/117715_4lM2ZgzHp4Uv61-ckuWzdXXXcPVNEH2NjISpWAEjGds.jpg	public	nuchasnyc	f
4ffef65ae4b013ea5f373be1	/VqxEh6cK784gtMOJRF6Lnub985jBJPC6-FuwZwXt_y4.jpg	public	nuchasnyc	f
511d2c60e4b017a4221bec0c	/1425622_srSMuVL9KOV8rqb_UDiSQNwjvNOtMyF-zeTO7sHRZZo.jpg	public	nuchasnyc	f
51e0320c498efa962e14eb18	/25342554_SdVvc9WOrSzlj9Rsy_0typl5IcOYEl2vOl_wKVaWoSI.jpg	public	getstuffednow	t
51af7257498e0c7f8979c05d	/752258_nUJpoSxZ8p9BBJMG5ISetpo3DDLzycLT_gT3z9fvJmI.jpg	public	getstuffednow	f
526fef71498e92d1ace459d9	/60805368_eCRrBwapYrNL8fM9tmIaLCfnlhQYb9ASU-ZkaR1Og54.jpg	public	mamuthainoodle	f
5203bd51498ed50247ee01dd	/60805368_HlIeqCMjY2I5md2mzI5crKizc9wVPUZo_sBmC6zrPEA.jpg	public	mamuthainoodle	f
542a28a1498e4288ab95e302	/68150_E567_ql-1p2jEv5ysetaEOgtnxpMmeLwZghpwLximCw.jpg	public	papayakingtruck	f
5180207390e7374e46b6c165	/49563206_uKsSD-Cd2jjy6FMyR9U_--7DdUBJ7ZUxtdlushxyIAg.jpg	public	freshandhearty	f
55da547a498eaf4d18cd8668	/68150_a4wUYq9FTUtdVsozCiBJOWbFfw_Mr1J8Jn6Ag9NL4-Q.jpg	public	freshandhearty	t
5203e16e498e9e8e0a93b61a	/702028_Fog-6PEF03KateivIPP-hx87Qn6gi7PwnaJv-wTFv3I.jpg	public	carlssteaks	f
55da5467498e1d9f64d28c57	/68150_B2x11YLO-NbpSVy1z-s3j6Az5i0b6vSM3L3EOYB6o1Q.jpg	public	carlssteaks	t
52e456f2498ea9ece32b66e0	/25812424_w-pfXOZy2D8xWVJY37hGi4VXYiDnicBFvWRiiDOnNhE.jpg	public	carlssteaks	f
4fe1fbabe4b0be4ebe6c1c52	/HNMFUfRPXDmxSDWAwh7pixJ34SFUY0fgzZFeOLAVXU8.jpg	public	funbunsnyc	t
51c8a3c5498e797153ec5629	/46314126_95x6AErCZEGSi1zGZrFCY-EzgsIMyOhgO4G59l-u_Xg.jpg	public	funbunsnyc	f
5212ec18498e9494b634a94c	/814104_tUkLgiQ8zcYxovra9R8PIx7FckFhBjzNVHmirteXd58.jpg	public	funbunsnyc	f
513b9b7de4b04f7024bc158a	/45519738_eDUGOpHYwiR5C3VUps1gQ1YDIq0Di3WMfuirGs2EVBk.jpg	public	rickshawtruck	f
5208f543498eaeeaaad3ce52	/15629_P_UAUr_S-OO0R12wNp8LDPwr-ZbfPiWeG0Q0rrjW6Ww.jpg	public	sweetchilinyc	f
542a28a8498e8c25fb70df8c	/68150_ru2bxW9jr0deeGFaJrvEbwBh8Bv1FRW82ZIglwoRv1M.jpg	public	papayakingtruck	f
4f8dc377e4b0ca2accf75652	/EKcue5yGEyaPnBymSd_HtBxWEZl4grYSOXMhw-gqpTs.jpg	public	rickshawtruck	f
4fb6bb41e4b066430032e4ca	/HHZWTU3POi_yJE4GU0zI_NjZNerm5y3MjjxddcV5ZMs.jpg	public	rickshawtruck	f
5286645011d228bbd12f9880	/1353667_2qCG26N4ikz7mbvEGkrFkcNLagGqrzRuNyeQ35CCDE8.jpg	public	korillabbq	f
52fe5db111d2d7644f04c21e	/404119_k2pARWK6AW8sOni-GGVsAfTehHeRbbnRCBGhfeb1xZc.jpg	public	philssteaks	t
512bbfebe4b0b8faa466c796	/1425622_4wp7wCuj7Ci1dl_FVH9syKmrJwQavMhL9uqww1b0m1o.jpg	public	philssteaks	f
527e77d111d2e66fa6a871b3	/649454_HIWthX8nL3SZAOwyMlKj9Y7ju9GCiN4OEV-wZR6IKC0.jpg	public	philssteaks	f
51645882e4b0bcb0cb0c7ef3	/7511393_dEJJLGO8ljFPMA_kFidoz1wpWZ-k6mHpqYnuRwoBpRg.jpg	public	philssteaks	f
507071bfe4b06e882e74b445	/1112203_qnT5k-31-4cRKDz00cUpp7Ia7HG3YTjhsC9Udo90RDI.jpg	public	philssteaks	f
53287a41498ef1dfde86d217	/68150_jBIeF8OZP2o4q5lJjB4TeUteiuuczqDDm3s4zQGipGc.jpg	public	shanghaisogo	t
530f7b7b498e225c3989957a	/20103877_gKGG5Z15ifazVa7PoBKpyKecZK7x2dWgjFIDOkwO38c.jpg	public	shanghaisogo	f
529fe356498eb76b55781266	/68150_0fjIotER7PaMHitF9odB_GOyMyFahAZ-OHvSCE9Y2e0.jpg	public	mausamnyc	t
5086e523e4b02ca59cae7bd4	/2361939_1JvatS0wOUdQQIaTmd4Vmk8bgr7aFYOR7LaMkRio0X8.jpg	public	mausamnyc	f
513f646ce4b0b1892aaae1bc	/13285510_LmdJLKoCS9fSwm3wy96lcieTczjsLuxAEUnU3FlZDlo.jpg	public	mausamnyc	f
51194bbae4b0cd237850b223	/793192_FQUO1SFGyLkg5NRz6VUYl3_zmFgfy0Mh8gL1unO8ijM.jpg	public	mausamnyc	f
52a0bef911d299250c89f9c7	/349672_Cg8dtcrfQ0WZeSo7BJR61YBG6VzsiMltZP8XIqyHiu0.jpg	public	mrniceguytruck	f
529ccbc511d21047117cdea2	/68150__CRf8sW9KvXZTkcAQEc4EsnYPgqXA2trmMxy-_AzobY.jpg	public	mrniceguytruck	f
4feb6e00e4b048145c547997	/wcCcDDUFo3EAkWygR8pGn29HTAv7VKEvPwJgzS6hQcw.jpg	public	andysitalianice	f
51c4890a498e94b118d3c4f7	/947598_cKatE0_E2EnwK8VRejBD8ExRoauRcW3l1ju3Y1YJUlo.jpg	public	andysitalianice	f
4fc7a5d3e4b0647c52b3c26e	/iRvxK7ohXIwK9Ib6wkVgtR46VKRLsamXuElhEtOlNKc.jpg	public	andysitalianice	t
5384cee8498e8fc005fc654c	/5100766_EsttIeEzz6qr90ehZUXz-Fqm0ktGiv0bXfOocE1peCw.jpg	public	andysitalianice	f
51f15b4d498ee58fec420a7c	/13285510_Q-SBXKFpfroSwQ-QJdezzrh1KaHfHAmLyicy8d5S1jU.jpg	public	parissandwich	f
5243126c498ea77b19b3a444	/65506790_31Qpx9E-ZjuNve-izmDY6vVxUCMrhgGsnOLn4-fusp4.jpg	public	parissandwich	f
51b22a0a498ec00d1c45726c	/390807_y2oeK6xR54wk9b1Sfm82Ek09Auv2lNkRTpJOzos3xjU.jpg	public	parissandwich	f
5391f2fb498eaff244578f11	/715320_7m2CfczIRBJpmjgQRa0xuWupsh_NmhZk_MrRWfnI_mQ.jpg	public	parissandwich	t
505204d6e4b02dee62bd961a	/dcOYoRoNNeCLMxvoyAN-o9gJObcw5FljMqYpS9cps84.jpg	public	funbunsnyc	f
4ffda271e4b03bbc7f8fd13a	/6Dtx8fj7IXT6M3O6ZV3rXryb6zKTAqPchjeOM2BJJAs.jpg	public	funbunsnyc	f
542c2fb9498e97db2676dd30	/19152_gqmkZvFomzQsd1bmXs_VAPUX3V8eyhtOS5hHM9oHpgo.jpg	public	camionnyc	f
556f5fda498e63fb4eda1f61	/68150_wqjx6504Fhkiz_LfsnouqTZvlLmrDMzJu96d8eZO-yw.jpg	public	mamasheros	t
556f5fe0498e71287f7c3e06	/68150_DEYnBJz_XjQjQWbq4QTnfip2-TEt4cDPYPIaF4zm9lg.jpg	public	mamasheros	f
51dc0e71498e8db4f9a8106e	/4456614_ZWvsB80ogvwYkoKIyVf6q5RfcDXwuKI4t0XJJhyLQ_I.jpg	public	thesteelcart	f
519a7e33498e6e4ea6ff66f1	/3354_e_1JMupbEA8VtOBVXgLHAvtJGQwcpHvY2JyFESXYSjo.jpg	public	thesteelcart	f
5254357b498ec4662e20c654	/2620660_kMXeinZ_B6lOrHRQnheIHMBr7p81ZxcUblWl0SQ1vEs.jpg	public	thesteelcart	f
519bb23b498e208a0b81b7fa	/9285455_LZiJ4FLH7NOWjNUsXO9jxDRFAgLygBSB8SmSIW0z9kM.jpg	public	mactruckny	f
5165924de4b093be3bc5cd57	/2159706_uFl3RYgA1z4EiDNp8PtjjG2HHWhTiiXDLNzJtFWPHS8.jpg	public	mactruckny	f
5151c82de4b024888079c5ea	/5003144_g8kbTzyfr6gL9vIRpMBbXz4TqBUk5EgkqIPlBP9DtsA.jpg	public	mactruckny	f
50883301e4b0904987088a20	/2361939_J2zcgauqqGFC_PZPyvkfEDoSufdDe5qE7gi_NkS1P1U.jpg	public	mactruckny	f
523887bb11d2ac89551d71ff	/5568483_apwtHKsNfvYc-IjeDL1_oqXIqZsLTUGH_-l1uxxAiGo.jpg	public	mtblls	f
53860b95498ee26cd484fe30	/81832079_fNoLG8cvJl_IqYaTNF8p9uwsDsglMXnfF2DKZ8X0Tk4.jpg	public	mtblls	t
53e3b619498e4b9015f0bad7	/68150_s6TPzQTspWKu7AI0DXgjZai6xKrtSkWgIdJNkenXMfs.jpg	public	mtblls	f
518a82c9498e068718057964	/25979758_bGWQQ7W2SJI4v7KmU891VcYZGitov6qbSNAnIEt8HTo.jpg	public	toastmonsternyc	f
50ad186ae4b0b639ca7ca234	/295161_qCQYG0XjW1Ji0pSDxM7fWRzxTZRbcYyZbsbPNJo12hw.jpg	public	toastmonsternyc	f
521649b811d2913e20a1ae87	/5568483_RtMp5aDM_JtBZOI1u48Jy3om4Z672obezdu1uA_UWd0.jpg	public	toastmonsternyc	f
5109aed2e4b01d2a5b69b022	/117715_0jgrjk5IsUFppNAL0NtebyMYoz1JMdzrnWAIjrLMHZw.jpg	public	schnitznthings	f
5012e555e4b0dd18ec16bd37	/mZQAOCmv5lnRZ1qOUTwDXk-MLC-X-p01AfECgfLJC2I.jpg	public	schnitznthings	f
522e088e11d2d4539942a387	/39707564_2mJZIxFUyGllfVMRjXdE86dZsCxH8cmCdUv29E4dfmE.jpg	public	schnitznthings	t
5249b1c511d23e54343ae083	/769710_HUiZ7dJrNbdnPYV-DTQRr1z0zgoxFx9KMC_Y-OQ6O2o.jpg	public	bobjotruck	t
5249b50c11d2d415e3c6b017	/769710_HOnpTjl0b6qd4-yoPpg9lXZGBy-ZKikqzLlFWw2sQfs.jpg	public	bobjotruck	f
51378e9ce4b071feb46ef7cc	/18792384_RSm8zhe_6kUOxy91taByfRjTDSLp7stH7PI41aJHOrU.jpg	public	bobjotruck	f
4fe20639e4b05dcdf7f5737c	/l9UdGGevddtOhDk6scQjcy1-TbVBX-wf8Gf56jBIRIg.jpg	public	bobjotruck	f
51a63d78498e9eedb93d97e0	/47296541_WIA3XjKOkMSEXv86_Db7mLpW5lx1AvaYnjg9_BVPyxw.jpg	public	luckyimthai	f
54d3b721498e9acc14650ed5	/21832446_HAVIPi-NzIRg1LFu62kNKISEB1EtgoOR0erZA0KIboo.jpg	public	luckyimthai	f
51dc4e64498e5538093957f2	/4253726_IySobRyDYLEz9puBAJKL9W1QqJBR0Ud73ZO8e030ogA.jpg	public	luckyimthai	t
50e719c2e4b0e263423e547e	/15471_4uN0tddGW5orNGh02xhxbiAOGUpAAy3rIWEotoRgB_M.jpg	public	tacobite	f
5241ccf911d2e2f33d20ce0c	/663291_Mtbv9TLhDHdTgTzon-qYjB2uv1YIr9qpM8tKJ9Mmy_A.jpg	public	luckyimthai	f
5362891011d2b40c5f328b6e	/41834822_k1LVelyLVM9gsNt3M70sVjI-QLm_84bgv4c6hoMHPO8.jpg	public	hibachiheaven	t
52e6af38498e26e622e5398c	/4147709_E9hzkLfHAJjdgQ6RT3W29cf-cftJShyXpRthu8riZYs.jpg	public	hibachiheaven	f
52e2aa07498e25b9a084ee94	/12998378_50qpDzH_XwsSlaJpw-f2fDtJsSvQg4TU_ujjdsnyWOw.jpg	public	hibachiheaven	f
4fda1cf4e4b0f6aceebbdb2d	/lKL7uz06jZgB680Vye9zxa_2yQfH96afFExvxaLlRpU.jpg	public	hibachiheaven	f
4fd0f054e4b0757383b97c0f	/MbR1inb3VKXu0PQMsCkHkHGftYq0E8CDbYG3BLRRGaE.jpg	public	thecrepestruck	f
50f99bcee4b08ca132377f78	/4611139_CEH3eveI6uxlRVQLet5Fpa_sNfJwAzfheMTYSBplO5Q.jpg	public	thecrepestruck	f
4e94737ebe7b8f7220377349	/UABDRYTA3ON4XXTR4HQH42UGYB30IVX015FHLMFZVJ2KQASB.jpg	public	thecrepestruck	t
50a696b4e4b04d062582a95e	/32050404_qo6ZUnU5LQMoqrAR6YoH5Qz-PdUcD1d1jCheEJy7lng.jpg	public	thepocketful	f
511a7d64e4b0c6a64118260c	/793192_Dtd9vMRk-pbBJscn1cb7n29zM87iJjZy6rojapRhODk.jpg	public	thepocketful	f
53c008f2498eb7426f809906	/8901_yT_FwBIUdR6vXYUM_nivPyu5TTVPRyYzz_45v8zawy8.jpg	public	thepocketful	t
51800af8e4b07a4a57023def	/9548073_erhzj0ShEDKaz8S8DhlDe90fDjJEIWjilIxO4_zjdGE.jpg	public	thepocketful	f
51f4589a498e97316d307dab	/186827_ilvLMlb3AFqgXUQJ43S7IjsLNPxYP3Pw5LEjrqhp6wI.jpg	public	chipsykingny	f
5413499511d26b1c8b577c09	/4195495_Ir_R8BxT1YxyTe-VuFD3U5pw6j9CobWIBlYp1FF-TwI.jpg	public	fritesnmeats	f
4e42ae7f7d8bec1e4d1a1c92	/RVQ54SSKH1QCVFTLGHQMPXKMGUA3QC3FCQKXU2DOVHQNRT23.jpg	public	fritesnmeats	t
4e42f5ecaeb7f6be72c39c70	/JC5VO3Z50HMMMVLCCGWDQPMKF4W01VBXP1QS2LFESR55UHIX.jpg	public	fritesnmeats	f
51bf306a498ed0fde41060d6	/250434_ayEUsJHsbHDQFjUrGrR2fdlBjswuffyRTlWWFrW0-dU.jpg	public	fritesnmeats	f
52373c49498e62a2930117b5	/85032_2JEjjCmOYlsUqDkchtdFaKW9WyiU0nYnCjd-0e4714k.jpg	public	domotaco	t
51a4ee69abd87ea53396c979	/4083549_jMzaCPEId80kWmAaq2oQ9APKf4bLvdeHhy40qPeB9j8.jpg	public	shortysnyc	f
5249c4bb498ecd25dde27c5e	/764670_x0RdEOs5TL4SEe2zGgpkzPFBFmlFV7-6UQiVtoFeHaY.jpg	public	goburger	f
51dc5a9e498ebf7ad40223ec	/1328035_Ak3fMs2e36r7NvIE_gIDK5XZ9CwrW1DEJa3g1oobp5E.jpg	public	wingnitnyc	f
5008051fe4b0974c844d5003	/oNy0_bsWPyVmjrduzJXpbrAPHjQS0PVbyOCfoRSD9xE.jpg	public	shortysnyc	f
4feb2bb8e4b0a47cf49787d7	/-CEaOy-zjgmGzmPRViSeNchwIITBbHgI3lFosreLqIE.jpg	public	shortysnyc	t
51bf5237498e5ddfd58cd4c8	/16518471_biLXoMrblr4306jDwZDBDdJhZJ2Kz0YeORHDz_yVXSg.jpg	public	mexicoblvd	t
50e71f82e4b07154c72fdc22	/275165_az4RUZ2U7-4cfdnQA1FlMrDLaxwCMriWtlhS_pddjEc.jpg	public	mexicoblvd	f
51435e1de4b07d53cf71fd7a	/4486_lUhkecOFThYlMHKai4wDp4lXXiQSPLTq3Nno5WMIz7E.jpg	public	palenquefood	f
4e6513efc65b2dc8a0bfff6d	/TUQTIKBJPOALJKHN54QRKGISWMQDDOW3WTAECOGJ4FOJTPXI.jpg	public	palenquefood	f
51b8a845498e8ebdef064e0c	/761163_j9ai1NfaIpK2TLN8JzXbTwyIhVzuZevNHBV5EpQ7Fh0.jpg	public	palenquefood	f
50292d68e4b0d0acd3bb5dbb	/vv6y8qi6JFfXr9QDkIvTPP0fSmbgQ_jGXHCVwDv0c04.jpg	public	veganlunchtruck	f
508af08be4b02ba9b11cc747	/17430999_28ys6GXVoaOZoKPXLLK5GQpVEL8UrC1_1DajRIy8ia4.jpg	public	veganlunchtruck	f
51dc48a3498efe9483d8417a	/117715_dlhUlP8z_jVejqRlWaCzsJBqg0eoP6rRSjOLpszFA0Q.jpg	public	veganlunchtruck	f
53287a0c498edd9a0567c2c0	/68150_i3UKBmIXHPN4h7gtvSQjnYfikUNmJuGRpjwKP2dLI5Q.jpg	public	dubpies	f
5345d100498eaa611b76f338	/62345083_i2VdE3VeEPlbfUgNv9mWmVmsuL19upJhcHaRX3zje1w.jpg	public	dubpies	f
5328764d498e217e55fa24e1	/68150_4QSMIi6zBoyrZ1VeH1Dqb3fEovQswz93yHAPvf2lGmQ.jpg	public	dubpies	t
532879fb498ec68315b3d232	/68150_KF6qgT-viSOMS5bt3lJarsNeEUjlVJn1lbAypyCl1js.jpg	public	dubpies	f
54978669498e92fb4a6b4341	/97520198_KIqmbmLkuFxboBU_HjFosEOXtwVA01QnxiBHugrwImE.jpg	public	shukanyc	t
5436c50e11d248d936eac143	/19152_M_ApacXXYJKPZC2fQRc7PP3Ft1gKho4lkea0eGMXrGY.jpg	public	latinkitchennyc	f
5410d00c11d24d29446d44c6	/10837211_UZDe_Sme56cWk-Gex8X4tfxg9bP-GHZcMWTK8imQoog.jpg	public	latinkitchennyc	f
5245c79c498e057f7d5ff65d	/117715_CEghvDHaxkALy5RxQCAVW-kyM0TAZo2-fIT4e6veJeo.jpg	public	neaexpress	f
55da612b498e7986da882759	/68150_kVXNCZMNTi6VASGjv7tgcFBneZ1Dq5OLpxfsl-WRCNI.jpg	public	neaexpress	t
521f754c498ee4d6fbe8a778	/22491899_EEPqf4HeJFaaFjYabKyScGZ8symjXEgMjPUEkfpJsJk.jpg	public	morristruck	f
51856452498e6f602088cbe1	/232510_pLk3QUUWFOu82-4SX-ObtA8bw2ZPf61QBOeIuL50T-o.jpg	public	morristruck	f
504777b0e4b092e662d54688	/VDYXmY1LaQGPAFc62SGiSEqcsa9OqhqXotgvAXIkHgg.jpg	public	morristruck	t
51c213db498e0748ab0dca3c	/53641916_5aNKp9fdHx3i_Pi15Z_X6pE3fAsTX35YBQ0nlmZGfaA.jpg	public	morristruck	f
51424d6ce4b0041cb8df9856	/117715_oxR8_TwNSaCL-_gKDA2i2-1YoRfVVnbfT3M9Bfu4nxE.jpg	public	thepocketful	f
507dacb0e4b0d8cafc9601e0	/2361939_S3NwwSNVZD-2tAhc3bwAvsYgk9tXwYv0T0yq9ci-ihE.jpg	public	toumnyc	f
5182ad6b498ef6cb59d48783	/39425123_zPh6ih4GAAygbhRJ-pyPdCr5TI3rXafgKyIEEK4HpHY.jpg	public	goburger	f
501d4734e4b0af03cf473287	/6BUHUmEyYTTh3a2SRjSYRklUlTfQBNbFnnk_hfEojYs.jpg	public	goburger	f
51716b5f498e03d8bc252c48	/11709298_S8klPxq0yPyZw2X9-_0IZyk6TFTn9xi5SWd_6BGCeVM.jpg	public	toumnyc	f
516d98b8e4b0b059e50ff5ad	/117715_BoNkQJO4jPWEtg_ef4-URb7IseoIXnYiP5vkvWJtezg.jpg	public	toumnyc	f
516452a5e4b0e1b216fdbaa4	/26263584_5wpEOb9FygNRBFQySA-pE1t1q_E9jVM_4mx2mnw5fAU.jpg	public	toumnyc	f
51dd9efb498ebbc846c11c03	/13001992_b9dLXH02o0ZX8hyUZVtpgGW6sDyzAl23vmEl-0Hj0jY.jpg	public	itizyicecream	f
55da6419498ec79aedeeda6a	/68150_xIw4p0jO4-q9xJjDv3t5DMEydCzO7Tsp0emPS9L6X_k.jpg	public	toumnyc	t
56465d42498e41e31d9f9b32	/68150_SrzDcBOav8dfnlrz07G_-9U6OI8oHAVgm6GOOCSnvEg.jpg	public	eddiespizzany	t
4fd79157e4b071eb33a9c810	/8zrcTIejD5EBiOJzSobql1_PQWr-i2KmRfgMCYmbK-M.jpg	public	eddiespizzany	f
4fb29dc4e4b0e08c1e225555	/ckjwTj4Fd2cRoZvDQZw_1jYdwuBF4BsfV4ZWc5oElFo.jpg	public	eddiespizzany	f
4f9c18b0e4b0b38d2f554383	/AQEKYbyPrQt5uMWhy4r4ODm2vSMCqPseJyMhcg55mtY.jpg	public	eddiespizzany	f
4da8977840a3582fb8c49316	/MCGIPRA0XR15JNG4O2YZJQBCRMK05UVTC4T14TOQWRTNMQFZ.jpg	public	eddiespizzany	f
5140cc96e4b0ef29f4802508	/4886503_z36ZXtYKGVIHcNLCR18ZdUWtpStRrbf33rInxsr2p1Q.jpg	public	mexicoblvd	f
525de1d7498ef4b27ada0847	/31827631_CApIgPWaXupe3toLi7iJLb6NxIyn2IDTOjAG0qw-PIk.jpg	public	mexicoblvd	f
516ee142e4b04f28d58be309	/36812449_DjR1ynMnMpwj-KmiWPZQldmGQwJ2IEzjSwwmGevqe3U.jpg	public	sweeterynyc	f
5107e09be4b047c08ade6bf6	/760350_ZaalKVnOYdVAGoQEdugu-1Lws1LubyJBOVpZvJJD1V0.jpg	public	sweeterynyc	f
50188a43e4b0d35e6d8035b4	/b-fKh6mx2WxCybNQkr9ovk_jv4x7bwJPVFM9RF3M5T4.jpg	public	sweeterynyc	f
51105b22e4b0a7b61fac854b	/117715_vKu0po70jlTD3qN9mXsdNiE6V5Od1hmYMVlUY9xSIP8.jpg	public	veganlunchtruck	f
516ef5ece4b0d1c83382c12f	/117715_Gt3J4FMusC7YQjSfEup4O7bAO10z8J4gxmnd0xKnZuQ.jpg	public	veganlunchtruck	f
5196816e498eebbaef53fe6b	/32050404_-lVnQ_kgFICQK3OBrfq4QydeDqXhz3ZCRD3TrCvMPxY.jpg	public	veganlunchtruck	f
545d48d2498e3e01487425a1	/8418727_ueAVzhZe5huI9alIjmHct6sTu6gQ4RyIUDXP0_qGF4M.jpg	public	kayanyc28	f
526e8aee11d299d16e74b447	/67629862_ZPeS1alTFabw1hPqq8PCcGF1SRFynqA23OgkKg8yc00.jpg	public	lovemamak	f
521b83c411d29ec0512f89b3	/255980_1U9yRWzBKuIDLReBhmBs45qJ0mtHu7pzL_Fv4T9gTss.jpg	public	lovemamak	f
53287c9c498e4b30223220d1	/68150_mMquObtK1F2QjX3VWuhYK2MtjUA9i5QRzexf9zWrBOQ.jpg	public	thegreenradish1	t
53287ac3498ee8ce8841a510	/68150_pNBQ4zhtsUiGR_kyfk0HziUGMzyIQwYcYpJ3VpZf7tk.jpg	public	thegreenradish1	f
5243206b498e78230cd0770a	/54092198_eF4CEteD3zHjOCJzaYssyRXaQElB-GEOy2sqzBFQPm4.jpg	public	thegreenradish1	f
525ee647498ef229c65969fe	/10045965_ptbEO58Zn5wDz6kgitvMVjFScmxSkkuHNbK-AguCXSM.jpg	public	thegreenradish1	f
531b7d5e498e3df35f261af2	/22402741_aYe825rrQDsEq6E_Pqv35za149PBn1PcT557SaJhOK4.jpg	public	brooklynpopcorn	t
559eba5d498ed3b75095059e	/21832446_2POlNScZ2g8opbNsoyOSVET81dD_UbrXct5G3cioosQ.jpg	public	schnitzi1	f
51dd9ddc498efb9a3437e123	/4501533_djr9d2BEP8dg7E48xJjJTa_Yjk0Iy-MmBG6hgIQBLUs.jpg	public	bigdsgrub	f
4e4e92c7b0fb088f3c0f14d5	/HTLXSW2D30RGIEYPI0JGR22LUCS5BTXQ0LXDWAOHH4PCVHM4.jpg	public	bigdsgrub	f
513101fce4b006d9c4991bdc	/17248619_XfpmI8dNgmoeHE3BXjV8bL2yuuMTqxU3FqDr4BqX7Ks.jpg	public	bigdsgrub	f
54356960498ea4b991899874	/1399116_53XPgGs7xW4ug2d4XS1CK8Wn7_vYQnkpDQpPYamcBS8.jpg	public	bigdsgrub	t
4fa2d04de4b0489ba3d7936d	/hsPbM0G5l3AsUaI3x6r_VkiSYo4pYlWTKK2S9zqh_KE.jpg	public	bigdsgrub	f
51cc5aad498ef430f84d0bb7	/6118094_NBh6M6M6nf_5mYOkO-_utfQBmnbpNZTvTRhINFWsX6s.jpg	public	nautimobile	t
4e09f3fca12d09aa881a769f	/NTSOFYDIBYVWGE4RYQTBBNIAQESPZ1LLW3Q4TC3TGMROSJPH.jpg	public	nautimobile	f
4e70e35c52b140871b6fa35f	/1TB5ROKJY5NF0GAVS4YS3WZTFCUXXHTPLLBUIK4BU0XD0QA5.jpg	public	nautimobile	f
51ccc251498e028212e9b1e3	/117715_ozxp6K6iPGwKCzQDARR3BgMcisplkTt0x4LEKDJdBMk.jpg	public	nautimobile	f
5022f267011cfeafe81dab9a	/7EPnN8ReXYQWoZYxzqkH9AQlOe8vFPtVP_60n65i9U4.jpg	public	nautimobile	f
50045b1be4b0004dbf67c977	/MDweBG1fBnF_fZ1tOghWyHS9qUxGNiJeOrOpoA-fBrY.jpg	public	shortysnyc	f
516d80bd498e8f3b47ac90e6	/36812449_Vbw1XbeTn6HJHdJF1bzMp9TvcwrqCP5edmktYCzlW6k.jpg	public	gcnyc1	f
4f7deaf5e4b0ffb6a3f2008e	/Xho5Xq8BtpNhEQvH0KRI3yX4kUstFRwTxEDj6QoawcM.jpg	public	palenquefood	f
51cb2c41498e9851cecdd49a	/5728350_vuJ4ORu0wHhd-B-f4FTNfsoIhfHgtJRMJc-QEeiYmNQ.jpg	public	taimmobile	f
4fa814d1e4b0d607baf8bd9d	/2drHnu4mqj-uzpwwcJa3MatYGD7KFuxjE472rButWlM.jpg	public	taimmobile	f
504a271ce4b0c65efb6b05f5	/PG0DfZvsxtqv4QM8Xpl6y8Ojahb0UanYwCPSdmuhj_E.jpg	public	taimmobile	t
519fa37b498e7adf7e8ebce3	/47170230_A9xVWAtkJBP-vVqUF1q2WlK8yuZTf1CVQz0JcPrHGY0.jpg	public	taimmobile	f
4dfa4a9840a3542ff44549df	/VBAJNQCBWDMP2WKDXJ5QHQ0WYF1MKHZSLUAZZJXKDBDLDUWG.jpg	public	taimmobile	f
5245b75011d28cd2725f32c4	/2982235_y79gPBpI95RkUJ_pZbhVDGujTU5g8hRoskz3BqSI44w.jpg	public	lovemamak	t
507efae0e4b09a52c022ec3a	/39213_nH-zcqfLCJqMvG0Nco0LWE4QuRuoL6unlEXJlJbTEF4.jpg	public	mexicue	f
523c930a11d22e1c3012a9d3	/34169985_AiTXirGu6jTaGeWWhhOfl2QIbGVaQjdDg1QCEakqza8.jpg	public	mexicue	t
501fe830e4b0bbddce992f90	/fFBOGONZt5Zr77Vc5g8adoAiBht0f-MBut7GqorVEjo.jpg	public	mexicue	f
4f67b0d4e4b08559c4c60149	/SdNxRS0joKXurf0FEv8_SRg-GeR9lGCN098_ZB2tijA.jpg	public	mexicue	f
50784742498ec6be8cd3f88e	/155927_ebZApDyXpTKTmvOQHdBTxNc2wJrsZV2QASmpYTNAVJM.jpg	public	mexicue	f
55c7f516498e21aadc545cd2	/39682951_wl3hpe5U9EzInb09Yao--CHcokgqhHDgTgx0pgmI1J0.jpg	public	cachapasbk	f
5220dc78498ebd10d150f736	/29917892_nMZHXkfxBukc2QfFqtDBTZSJ1xpMkoO7VGBJmGKkwhY.jpg	public	brooklynpopcorn	f
5258d3ef11d26d03cc0563a5	/117715_GQ_O1nyBbVlKTaYpRlprc8ZdIEAEftbU4_9hDGjvxsU.jpg	public	brooklynpopcorn	f
5199097e498ea36447e54093	/40899881_hbjUdavpBfT-sLaBhv3pbZydT1tgs9v-Maw12j9I3Xs.jpg	public	carpedonutnyc	f
520f87b511d2e753e7955853	/44_gUd2HlRFt-yMUFcOdI_EUCdz5NK86hKk-3kHwZhHou0.jpg	public	carpedonutnyc	f
541cd5a2498e539acbe986b1	/21832446_ZrLNVQwpCFEFosqLZcxwCuMZOAXA7BIQY7J1kYeBp3U.jpg	public	carpedonutnyc	t
507b0648e4b0109f3656e2d2	/76137_7JNe3m0dO2MZ7a9rkqa_DTlnrw0LyNitqksFG7_5IC8.jpg	public	lobstertruckny	f
508abe69e4b01ff7516d118b	/8029486_9wt2tO9BnY5d11Ef0mpAgHAqfK1QMmSvLXglU4fj6Xw.jpg	public	lobstertruckny	f
4dcbff9440a3324246c6fb7c	/YVZPSDS5D1O5DR2NK5IFQKOU0ZNOQTQMTHMRWS3ESLQIQAWK.jpg	public	lobstertruckny	t
500ecc9ce4b0a6d209804d9e	/d2yG6CtTrc8TQAXoEGN68UYAv3DiJIqJvKU65-ApcaU.jpg	public	lobstertruckny	f
5245c7a1498e0eb9bc097723	/1727660_xLZtYmqATL4pckN_IhgIj0AgUbDAJxywzqbf5PKEooM.jpg	public	lobstertruckny	f
516cdc93e4b0d6bb083f9db2	/117715_3eRUhgkRZGVpjDAYUz9TD5yQXPVFmg0iCB7iIgv_XD0.jpg	public	souvlakitruck	f
50be4929e4b0ada0df80b932	/4611139_UjW8jF3qFz_uyk0hDKT6CMZI2q3My4j6ZiwX-68QpME.jpg	public	souvlakitruck	f
50031911e4b034c2944f0c3a	/bExPPWxN-4YhYlw2nPz-T5eA3mYN-U78LUZtcIzjTRM.jpg	public	souvlakitruck	t
538fa2da498e8efc80bc2cb7	/26065139_jgo2VLUL2PokQdo7SP2iJ6rtca8E552GZGM3Bhu1e28.jpg	public	langostruck	f
527d2c2711d2c984e85cb11b	/4179871_5FQ2eCC5ZeizUVRLh4tadgEAO1BnJjVQ7pSEvSDwIfQ.jpg	public	biandangnyc	f
512161e0ebca7d20d6a70104	/4574_ZC6mf3ha1jNXmFUDgtNsN3zIf-NHyqgxA3WkUkOl4mY.jpg	public	biandangnyc	f
5106b878e4b05ec869ad8b34	/814104_blIawoImaEcqf-Mg89W5A-nEHiZ5jx76BEYHVzz8dnA.jpg	public	biandangnyc	f
505c9776e4b0643aba1071c7	/5568483_yQrtG73dbug7q06p9IASJmTFnOVgGprIZKbfHjQRcso.jpg	public	biandangnyc	f
51cc7075498e8d24309aea57	/991186_cg_CePJhqcT81QY5l1L4eB3MQxy_QlsRh4zmZDk8cFM.jpg	public	biandangnyc	t
51b8d7aa498e103b3a36ec2d	/47900463_7B6lLfz2PW1XyrG2vCIxp4vIq7QXWEhxufI5i75jwxE.jpg	public	delsnyc	t
51ab89bb498e83fced4cefd6	/66074_8dLzCKmVRde0Uvtx_NSl9SKROFh0kat1IQgcAvU4J3M.jpg	public	delsnyc	f
51fd732d498e415eeb8b9881	/8839239_mAp7_MVmWbbK42Xq3-W-1zmegy-MNx8NzB0P5Brf-Pw.jpg	public	delsnyc	f
520e673a11d25d1282a44199	/117715_KjwJnc6idBB7TuMKhGboHDg8IYjlGcr6h3I6_fJECmM.jpg	public	delsnyc	f
5012d0d5e4b06fc7ce735a68	/7J2g1YLtx4ma57g4A4CerJJ66OwudjGhFI67JaNl1Qw.jpg	public	seoulfoodnyc	f
4f5e6b3fe4b033732b227036	/7Pw4h0QMNateMpgFd_DAFO0uUnsIdcGzmHG_1in7Wu0.jpg	public	seoulfoodnyc	f
4fb1335de4b0f4503b23a67a	/GSQxN-iFZejvploz8v8hm2QzrWiTmg6QdgBffmHvsnc.jpg	public	seoulfoodnyc	f
514e42c7e4b0ec8b7e400875	/48992751_ibL8tx_7JPvV3aQmnEevrdibtLP0jWytaChkCdRuhG8.jpg	public	crafflesnyc	f
514e42a8e4b0d91e975b3db9	/48992751_womoOVd5bv-2KopmWjWEHA_WsyoWQITjAyXBuM4Ciz8.jpg	public	crafflesnyc	f
5410795c498e74cff2aed48e	/5864_GAP3yP3vlQyBpeK3IKyeS9azCR4R0hgVouqQiGPdTOE.jpg	public	hityourvspot	f
5507187a498e8ab5968bc213	/377760_Wcfue-MAFtEgRyWr0DDPKpXXxnCl7aqPN5ZyMAL9dUI.jpg	public	hityourvspot	f
555a66e0498e8835d908f1cc	/11340787_R901RT00K2RnA_8Q0b_lKvHXGgpf5ReaOYkWrBKW6qY.jpg	public	coneyshack	f
53becfa0498ecabf3380ad3d	/14196482__Nb-XE1Nu5U6-DjUyOaSLEZlftPX9UbGRO6ONPylCAk.jpg	public	coneyshack	t
5329e77f498ee6898be00a22	/11652594_SJ-j8bWUQDW088CP6WJV_hsoVB1X3sqlknJREVGXk-s.jpg	public	coneyshack	f
5217a7de11d2746c048106cc	/39707564_gPzbz_bNU4iuZ8B8xSD0b250GHVZPaepeD8NOUyrLI8.jpg	public	blend_express	t
519babe8498e355d9d35fca0	/65817_6p9jSMaQMqP9QGn3KOIyuDOG15jaLxIPvsdrpZGWdj8.jpg	public	blend_express	f
506dc9b9e4b0c21f078c3bb3	/22983_XN2GbKo3a5YsNY_ZpiBcjUHTD2if3TWS8r586Uq4cEk.jpg	public	blend_express	f
5033cee6e4b03e64bc749ee7	/tIyy6IAKcw2SSiX5JSPBCURstZZisntK_46plgrfdJ0.jpg	public	blend_express	f
51d31ab97dd28a271207af20	/59958053_5CogfmHgRpBtjkPzVkAgAjK7q9ac0bo8Z1TPwxPIFAw.jpg	public	grillonwheelsny	f
52013fe1498e5f476bfdcf83	/30611522_DHhazmY8dyNAbmijjHX7jyyfVBEiugL5-GJcTLuYjS4.jpg	public	getstuffednow	f
523c8b2a498e959b87f8ded2	/39707564_-WCsPSk2ExKeZ8q06DtUQrpt_vcWG9-AzvFoToSdQqY.jpg	public	getstuffednow	f
50ca356fe4b05b0bb93edc40	/1590381_NyRIp7fXJtGoJoXp25IcMmufNufPxxvLEj3TVYXRo5g.jpg	private	getstuffednow	f
4fbfe026e4b04422a08a40f6	/Han8Z4R-SQ615pLoN2lRdPfKEFa6UW2yudSOxXmJtts.jpg	public	thetreatstruck	f
51461b9de4b0bb73a6821e97	/1102787_UDt7OJpexNs8VPrehVDsp9EtfUJnMhKzJ2tTXuof06M.jpg	public	thetreatstruck	f
4f753600e4b07eec20023ddb	/zUb4OswXiQLnF_k2xnx7AdupnEIl1nuGyIuFcmFWf8Q.jpg	public	thetreatstruck	f
4fbfebe9e4b0a3bda0340383	/Brw9_z178IK92xMEXLCSSZrP0-99GXjutCp7dHCi5CQ.jpg	public	thetreatstruck	f
521e9e4511d2d8ddc5c69dbd	/117715_r7cpzyXCpOthqHouR5gdqIMX8k0TZ2KWHFun5wh-EYk.jpg	public	valduccis	f
5079a745e4b00277f33e4836	/34723233_tCoDnWhdhZj61xi_e00MNwJoK_UcfDXCQQ7Weat8pBM.jpg	public	valduccis	f
4fe65d6fe4b09198fde5842a	/nVmhJloDitdcBPFceYT8ajqQqgXBpB_w5GoPWse33Ks.jpg	public	valduccis	f
514360f4e4b0455b303a4d66	/8626436_tfGrSomdm1qEPFKcyb0Q5atmm3DmDeao1W8MotOtOwY.jpg	public	milktrucknyc	t
4fee068ce4b0f9bd2b4041f7	/UQwqaF9knSdh4LFRzAhnh7hcl6_dSjDTg1phtqTe_7Y.jpg	public	milktrucknyc	f
5281221811d21e907e460e00	/4195495_akELCvAQ7aY-bfTfHk93g5g5_qcJnQJV7h_gH0FlKUA.jpg	public	milktrucknyc	f
4f749b3fe4b0f06c04ae2440	/rA31cWGMm0G8EuZFYZBxb3y2OrW3oEo7vCj1L2XR3AM.jpg	public	milktrucknyc	f
52052ef211d22b8ed81dd96b	/36360429_am9ha8rSYxAvCaSMU9ya6lI9MzIgcpR62DH6HS1b-uY.jpg	public	milktrucknyc	f
4e3da652d4c058f9dc087a6c	/QEOIS2W35WLTHYK00QC04LKKX4X1SYW3DDI45X30HSKTJENQ.jpg	public	kimchitruck	f
4e00e61aa12db1129557e99c	/WSUNYIB0YFVRCTXB13UCRCTANZUG0DO0X2FWCUYYILU4TCGB.jpg	public	kimchitruck	f
50f59e2ee4b0b31f58d6cc1f	/1922740_OhtWiNUDUcN0NE_HB3Tk8vm5qIZcvqxcP2nMDrN8dT0.jpg	public	kimchitruck	t
5197fe76498e1c056c96d21b	/117715_m462oAqyqBN12xyWCOyzYR6-1gtYrUa8BiX9r9OybE8.jpg	public	kimchitruck	f
501975c5e4b092f6a51ef338	/bI7RrGcK_moyn-kJICa1OCciBVuYYykwCMGlea6mcxg.jpg	public	kimchitruck	f
5231f54311d26e8da5827f3b	/977282_AToQDrlKW5PTNbNGQcB24_BeJNsRMgZTeYmC9P-or38.jpg	public	korillabbq	f
528e451f11d2a93e4361f565	/977282_wEw3nDjN0NbjC4CgQ00ON0YjdtnMocrfAjXDM4UH63Q.jpg	public	korillabbq	f
4ff318dde4b0444717bb6c21	/7p0pVfwa2IPX5eoAqan3mf43CoVnVrHHztgDqMGA6aE.jpg	public	korillabbq	t
52d32962498e318b0a9942f1	/61382883_iF5gX7tlMJ3CWlWcTkpntPniCUpS3o7H8anOau4wiKA.jpg	public	usafoodtruck	f
4ec59ebacc21b428e0de466c	/4AMXSGP5YGTUHEL3TFKTS5ROVIX4HUTU4MU5ZW1OX5E3URDD.jpg	public	domotaco	f
520912ad11d2f941183dea9f	/13285510_v7K0PTg4FzGI822Jbc9A8K5mUHIxwJPBZB_0xNeEauE.jpg	public	domotaco	f
50ce269de4b07c1547ebfb2c	/263293_qjcLaRmf5itOMyRiq4AyYZuY2UVjVJk04lO3FTA2CMY.jpg	public	domotaco	f
50ce2696e4b0881a7ef3ee67	/263293_lcA30Y_JnQGKaaHhRqFUio2HQ8UQkphCWP9yhW4CE3g.jpg	public	domotaco	f
5189442c498e765ce62d5924	/2432527_5nUa0fTfy4rzjXpiIUIlkguBa2kdqFSZIG-PLvkKu2Y.jpg	public	chefsamirtruck	f
4fd0d80de4b062589043211f	/hZjMDK5KKgxjMhmOGBtaRjx_ga0SWHwppqfLfqw20Tg.jpg	public	chefsamirtruck	f
5294e76b11d2879d5217bd00	/47558447_v1SwJZbLSZ2etlJXOF9qw4H3vErpdTiVIqXxULSVTSU.jpg	public	chefsamirtruck	f
53d2ab0c11d268858b540b4b	/6657788_kfbbBA6MbAVWizEQdvBfuvdJ1YR6JyMX4pIFYaeiblQ.jpg	public	chefsamirtruck	t
520538a611d2b476431ac7f9	/117715_GMdoseCn4baUtTX9kN6_PAAfHaGIlUpjxzAitpqLAOY.jpg	public	chefsamirtruck	f
5568962e498e28889a3c79a4	/276818_apRGkmx83lAjJNn6Dbd8xPe7iW0vTSrJEwb3LCqyLCg.jpg	public	pontirossifood	f
5193f5d8498ec8ee7f53d4ff	/11919710_SXBMpZ4zTc47tVk7zEdSMJG0WmxM4HhlHDhQc7NBzsw.jpg	public	polishcuisine	t
5244712a11d295d581384a17	/22780_QXd0BtJcOWXZwSm_ZG3oXyaNj6Qw5-p8hWQzzH121fY.jpg	public	polishcuisine	f
5192873e498e63958610c2eb	/117715_Jf2pdeF9ztory7puWsPaFE26jmMzPEzjOfPopvTzSjA.jpg	public	polishcuisine	f
527e823311d2db75dd831ee0	/22419482_1rrrm4nhOKXQsXN25ApmVsGDw4t2J3GyjhfeQPEbClU.jpg	private	waffletruck	f
5280c18811d2e4df572063db	/5354893_5EtQmcwzMnTRFz9qbxjkt9FguCAC4xfW5xwUCyYIrbQ.jpg	private	waffletruck	f
4f733c44e4b039d898ce1409	/PQ9G-O3CAtCW6ixkiwHhICEaRn0L3Lz1F95zKcl_GdI.jpg	public	waffletruck	f
4fd26038e4b06145dfb72894	/zUVUqzIwbwoFsRrRenEhtDmBSbK2Ry9lzqeuYnmnHG0.jpg	public	waffletruck	f
5106bdece4b051d6cb82a376	/1922740_Eqg3x5oj7wks2XGfudNYIAzcCuZHJiWpgLP1CCbonEE.jpg	public	gcnyc1	t
4fba74c1e4b0a2484fae410e	/1XmG8W_3-cY3Qc-l1GwU7YSOBlzOwyGtk2BzKOkxqYY.jpg	public	gcnyc1	f
51eae36e498e58d50e5683ba	/331066_SArUzXa_cz_-YMQco1rwYAfU8a99TZCHJX9a2WA3fHg.jpg	public	gcnyc1	f
51dc5fec498e4e9be748eac4	/22801_gX0atVT6Jt_H6FPXuYAqHD4VzO5jAmS4SVid_ZLkk5U.jpg	public	disosnyc	f
53a1c287498edebe0e22b43f	/9446626_4q4cPL3HmqkIwu6ljinztCOxq6zm_V1V9MB_vkbZ6Qs.jpg	public	disosnyc	t
525c259b498ea7548cf31f8e	/769710_ZxOOtsSbFVklHIRhXVmTO7ops0Pm0EybRDTgUvGHrSY.jpg	public	disosnyc	f
5197cb68498e8d409a89ec1b	/1847096_oRB5R_owQW40gVWlJhNNsh9_0bEq2D8Rt3Zod9HUbUg.jpg	public	disosnyc	f
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
61	52nd between 6th & 7th	52(nd)? between ?6(th)? ?(&|n)? ?7(th)?	40.7617721557617188	-73.9809417724609375	Manhattan	nyc
16	47th & Park	(park|47(th|st)?) ?& ?(47(th|st)?|park)	40.7553329467773438	-73.9753036499023438	Manhattan	nyc
18	48th & 6th	48(th)? & 6(th)?	40.7586517333984375	-73.9813385009765625	Manhattan	nyc
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
99	45th between 1st & 2nd	45th between 1st & 2nd	40.7512430000000023	-73.969530000000006	Manhattan	nyc
100	320 West 66	320 west 66	40.7759900000000002	-73.9877170000000035	Manhattan	nyc
101	76th & Amsterdam	jcc	40.7811900000000023	-73.9800429999999949	Manhattan	nyc
102	Broadway between Houston & Bleeker	broadway between (bleeker|houston) & (houston|bleeker)	40.7260139999999993	-73.996255000000005	Manhattan	nyc
103	22nd & 5th	(5th|22nd) & (5th|22nd)	40.7408709999999985	-73.9900860000000051	Manhattan	nyc
79	Hanover sq between Water & Pearl	hanover( sq)? (between )?water & pearl	40.7043129999999991	-74.0091780000000057	Manhattan	nyc
96	21st & 5th	((5th|(w )?21st) & (5th|(w )?21st)| 5(th)? between (e)?20(th)?( & )?(w)?21)	40.7402579999999972	-73.9904989999999998	Manhattan	nyc
1	20th & 5th	(5(th|ave)?|20(th)?) & (5th|20(th)?)	40.7396799999999999	-73.9908470000000023	Manhattan	nyc
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
122	33rd & Broadway	33(rd) & broadway	40.7489700317382812	-73.9880523681640625	Manhattan	nyc
117	Kissena Blvd & 64th	kissena blvd & 64th	40.7379226684570312	-73.814727783203125	Queens	nyc
119	48th & Lex	48(th)? & lex	40.7552490234375	-73.9732818603515625	Manhattan	nyc
120	Bedford & N6	bedford & (n)?6 & (n)?7	40.7175636291503906	-73.9580230712890625	Brooklyn	nyc
14	46th between 5th & 6th	46(th|st)? (between)? ?(5th ?& ?6(th)?|5 ?& ?6|& 5~6)	40.7566261291503906	-73.9803237915039062	Manhattan	nyc
121	45th & 1st	(45(th)?|1st) & (1st|45(th)?)	40.7507514953613281	-73.9684371948242188	Manhattan	nyc
68	Old Slip between Water & Front	old slip between ?(front|water) (&|n) (front|water)	40.7039833068847656	-74.0085678100585938	Manhattan	nyc
118	W4th St & University Pl	(w)?4th( st)? & university( pl)?	40.7295761108398438	-73.996551513671875	Manhattan	nyc
72	52nd & Park	52(st|nd)? ?& ?park	40.7584457397460938	-73.9730224609375	Manhattan	nyc
17	47th between Park & Lexington	47 ?(th|st)? (between)? ?(lex|lexington|park) ?(n|&) ?(park|lex|lexington)	40.75494384765625	-73.9743881225585938	Manhattan	nyc
123	Charlton & Hudson	(charlton|hudson) & (hudson|charlton)	40.7273178100585938	-74.0073165893554688	Manhattan	nyc
124	91st & Columbus	(columbus|91(st)?) & (columbus|91(st)?)	40.7896766662597656	-73.9698562622070312	Manhattan	nyc
28	55th & Broadway	(broadway|(w)?55(th)?) (&|n|between) (broadway|(w)?55(th)?)	40.7649650573730469	-73.9822235107421875	Manhattan	nyc
125	86th & Lexington	(86(th)?|lexington) & (lexington|86(th)?)	40.7794837951660156	-73.9555816650390625	Manhattan	nyc
126	Governeur & Front	(front|governeur) & (front|governeur)	40.7042465209960938	-74.0077285766601562	Manhattan	nyc
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mca
--

SELECT pg_catalog.setval('locations_id_seq', 126, true);


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: mca
--

COPY messages (id, message, date) FROM stdin;
1	  <b>Trucks added:</b><br>\n<a href="/truck/kaya">Kaya NYC</a><br>\n<a href="/truck/kettlecorn">Kettle Corn NYC</a><br>\n<b>Trucks Removed:</b><br>\nSteaks N Crepes<br>	1440441977
2	  <b>Trucks added:</b><br>\n<a href="/truck/jollyfatpig">Jolly Fat Pig</a><br>\n<a href="/truck/cachapas">Cachapas on Wheels</a><br>\n<b>Trucks Removed:</b><br>\nMoo Shu<br>\nTaipan Fusion Express<br>	1445999991
3	  <b>Trucks added:</b><br>\n<a href="/truck/jollyfatpig">Jolly Fat Pig</a><br>\n<a href="/truck/cachapas">Cachapas on Wheels</a><br>\n<a href="/truck/delindogztruck">Deli N Dogz</a><br>\n<b>Trucks Removed:</b><br>\nMoo Shu<br>\nTaipan Fusion Express<br>	1446332516
\.


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mca
--

SELECT pg_catalog.setval('messages_id_seq', 3, true);


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
15	@(starrettlehigh|starretlehigh)	starrettlehigh
\.


--
-- Name: subs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mca
--

SELECT pg_catalog.setval('subs_id_seq', 23, true);


--
-- Data for Name: trucks; Type: TABLE DATA; Schema: public; Owner: mca
--

COPY trucks (id, name, twitname, weburl, tweet, retweeted, lasttweet, lastupdate, type, about, foursquare, matcher, loc, matchmethod, site) FROM stdin;
mamak	Mamak	lovemamak	http://www.lovemamak.com/	hey guys we are @smorgasburg pier 2 @BrooklynBridge_  come come come! http://t.co/llBP6I0uKb	f	1448512053	1410708157	Asian		51c4cffa498ec876f564a0b4	\N	\N	\N	nyc
nuchas	Nuchas	nuchasnyc	http://www.nuchas.com	We're Hype! Nuchastruck is in a special spot  45th & 1st  and Nuchascart is at  Brooklyn College . (almost) Weekend vibes  streetfood	f	1460555954	1460644262	Mexican		4ebd2a9bb8f7b504a754c130	\N	121	\N	nyc
miamifood	Miami Food Machine	miamimachinenyc	http://www.miamifoodmachinenyc.com/	RT @YouGotSmoked: Park Ave btw 33rd St and 32nd St from 11:00 to 3:00 today! New York Aged Cheddar Mac and Cheese! Delicious nyc http://t...	t	1437478937	1389964561	Mexican		514b53aee4b00c3e98ec25e9	\N	\N	\N	nyc
neapolitan	Neapolitan Express	neaexpress	http://neapolitanexpress.com/	Come n' get it!!  We're serving pizza hot & fresh at 53rd and Park Ave https://t.co/ymVCgUTfuH	f	1460307898	1459357316	Pizza		51c8864c498e0ac96c14433e	\N	26	\N	nyc
dels	Del's	delsnyc	http://instagram.com/delsnyc	We apologize for being MIA the past 2 days. We've been preparing for the hottest day of the week! Come find us at 21st & 5th Ave until 4pm	f	1435693089	1409149941	Sweets		519bb56b498ed2dfa950ace2	\N	\N	\N	nyc
mexicue	Mexicue	mexicue	http://mexicueny.com	Eating these sliders under an umbrella is like movie make-out scenes under waterfalls. \n\nCome get em at MadSqEats http://t.co/VxW4aWmiwh	f	1459374643	1410639912	Mexican		4c51a6a71c67ef3ba6b61ab9	\N	\N	\N	nyc
seoul	Seoul Food	seoulfoodnyc	http://www.seoulfoodnyc.com	Come to 51st street, between Park and Madison - it's lunch time!!	f	1392220033	1392220033	Asian		4e74afad88775d593d9a7eb5	\N	\N	\N	nyc
milktruck	Milk Truck	milktrucknyc	http://www.milktrucknyc.com	let's try this again! 58th & madison today, snowbanks willing!	f	1460258468	1453988665	American		4e823c0229c2dbb2b7043972	\N	98	\N	nyc
sweetchili	Sweet Chili	sweetchilinyc	http://sweetchilinyc.com/	Come see us on broadway btw Houston & Bleeker 1130-3! Special today is baby bok choy! Thaietnamese https://t.co/y48U5Ucxfa	f	1460550449	1460560302	Asian		51a8c802498e2165ca855a19	\N	102	\N	nyc
mamuthai	Mamu Thai Noodle	mamuthainoodle	https://www.facebook.com/MamuThaiNoodle	Late tweet! We're on 17th & 5th today! mamuthai	f	1460646688	1460565785	Thai		5126a10ae4b0af674c85f353	\N	86	\N	nyc
craffels	Craffles	crafflesnyc	http://www.craffles.com/	Happy holidays!!!\nMake ur holidays sweet with our delicious crepe or waffles. Our location for today. Hunter college and union square.	f	1421616846	1388428190	Crepes		514e426ce4b05bcb261d910e	\N	\N	\N	nyc
shadydawg	Shady Dawg	shadydawgnyc	http://www.shadydawg.com/	\N	\N	\N	0	American	\N	536e77ea498e8b0d31167218	\N	\N	\N	nyc
vspot	Hit your V Spot	hityourvspot	https://www.facebook.com/VSPOT.TRUCK	47th and Park from 11:15am to 2:30pm !!	f	1412066274	1412066274	Vietnamese	\N	53c9479b498e2dfa7e205ff0	\N	\N	\N	nyc
coneyshack	Coney Shack	coneyshack		We are so sorry for the late post but like every Thursday we will be at our premier location 48th st between 6 & 7th avenue we are ready!!	\N	1460557231	1460648030	Asian		524b2983498e0f789f2804cb		19		nyc
greenradish	The Green Radish	thegreenradish1	http://www.thegreenradish.com/	Good Day to GetNaked NakedBeanBurgers 47th between Park and Lexington https://t.co/4ou7IczI7R	f	1460631143	1432902203	Vegan		5229feab11d2edde794d385c	\N	17	\N	nyc
schnitzel	Schnitzel & Things	schnitznthings	http://schnitzelandthings.com	Hi everybody!!the truck will be on 47 street and park today,,see you soon!	f	1422645854	1441295198	German		4a6640b3f964a5204cc81fe3	(schnitztruck|the truck)	16	contains	nyc
polish	Old Traditional Polish Cuisine	polishcuisine	https://www.facebook.com/pages/Old-Traditional-Polish-Cuisine/315496671902708	55 st & Broadway we are coming for you.  Be ready. \n11-2:20pm	f	1460469133	1460640259	Polish		51435df4e4b0823a398ebc8a	\N	28	\N	nyc
cachapas	Cachaps on Wheels	cachapasbk	http://www.cachapasymasnyc.com/	@czarineyee were on 47th and park today!!	\N	1459859962	1450114780	Venezuelan		55b5ad46498e0739f54fcfd5		16		nyc
blend	Blend	blend_express	http://blen02.wix.com/blendnyc	Happy Halloween.   47th and park we here.	f	1421948094	1414774175	Latin Fusion		4fa94528e4b0f8fbf13317e6	\N	16	\N	nyc
grillwheels	Grill On Wheels	grillonwheelsny	#	GOOD MORNING NYC WHAT A BEAUTIFUL DAY TO GO OUT AND GET LUNCH AT HANOVER SQUARE!!!	f	1439939979	1437058212	Kosher		51b0bf31498e9b68db75612c	\N	52	\N	nyc
getstuffed	Momos & Buns	getstuffednow	http://www.chinesemirch.com	RT @GovIslandFood: 1/3. Only a few more days till Gov Island gourmet food market powered by @livefastgroup opens for the summer. @Getstuffe...	t	1408198481	1400698983	Chinese Fusion		4fa016cbe4b05d0fc11262c5	\N	\N	\N	nyc
gorilla1	Gorilla Cheese 1	gcnyc1	http://www.gorillacheesenyc.com/	G1 @BklynNavyYard @cnn @NY1 \nG2 -  FiDi Wall/William \nComeToTheCheeseYo	f	1460645951	1460646541	American		4dc2d3e352b1c1fb37f1e945	g1	41	before	nyc
jollyfatpig	Jolly Fat Pig	jolly_fat_pig		RT @Joynture: @Jolly_Fat_Pig YAY! We are excited to have you back at Hanover Square soon!	\N	1459880102	1458320503	Latin Fusion BBQ		55ad21eb498e7e5b46049696		52		nyc
gorilla2	Gorilla Cheese 2	gcnyc1	http://t.co/4ZDqfwSH5f	G1 @BklynNavyYard @cnn @NY1 \nG2 -  FiDi Wall/William \nComeToTheCheeseYo	f	1460645951	1460646541	American		4dc2d3e352b1c1fb37f1e945	g2	41	before	nyc
wafelKastaar	Wafels & Dinges Kastaar	waffletruck	http://www.wafelsanddinges.com/	Serving at MetroTech 1 Metro Tech Center Brooklyn From 11:00AM-4:00PM brooklynwaffles https://t.co/NMGJ6xth4u	f	1460662251	1460646325	Belgian		4a416369f964a52036a51fe3	kastaar	76	before	nyc
frites	Frites 'N Meats	fritesnmeats	http://www.fritesnmeats.com/	Hello Brooklyn, lunch today @ front & jay st. Burger of the week THE HEAVENATOR Preorder 9172929226 dumbo @DUMBOFoodTrucks	f	1460658662	1460642482	American	This is a good burger but this truck is interesting because of the many toppings they carry and their burger of the week. 	4ae9d217f964a520bcb621e3	\N	56	\N	nyc
papayakingtruck	Papaya King	papayakingtruck	https://www.facebook.com/papayaking	We are back in @DowntownBklyn today, join us in MetroTech from 11a - 3p https://t.co/5J8GbV9DBP	f	1460083675	1449156946	American		50952bd2e4b03898afd23fe3		76		nyc
freshhearty	Fresh and Hearty	freshandhearty	http://freshandheartynyc.com/	Get your Soup & Panini on with Fresh and Hearty! We parked on 46st btw 5th & 6th ave from 11am to 3pm. Call now 4 free delivery! @3474402467	f	1395241942	1390493878	Soup/Salad/Sandwich		51801f7a90e7374e46b6239f	\N	\N	\N	nyc
kimchitaco	Kimchi Taco	kimchitruck	http://kimchitacotruck.com/	Such a beautiful day in the neighborhood. Take a stroll and grab a bite. We're on Hudson & King st til 2:30pm	f	1459862048	1460652190	Korean Fusion		4d6ee122b45b59417c6a6778	\N	39	\N	nyc
lobsterjoint	Lobster Joint	lobsterrolling	http://www.lobsterjoint.com/food_truck.html	On York Avenue between 70th & 71st street , enjoy a New England Lobster roll as you relax on your break !	\N	1454620030	1444317951	Seafood		552d5dcd498edeb4d817ef9a		32		nyc
treats	The Treats Truck	thetreatstruck	http://www.treatstruck.com	!!! Wed April 13th 12:30-3:30 45th st & 6th Ave!! Then 4:30ish-7pm 18th st & 7th Ave !!!	f	1460659566	1460562710	Sweets		49e65021f964a52035641fe3	\N	12	\N	nyc
kettlecorn	Kettle Corn NYC	kettlecornnyc	http://www.kettlecornnyc.com/home.php	Good Morning Midtown \nWe Are Located on\n45th St. Between 5th & 6th Ave \nUntil 3:30pm \nkettlecorn nyc popcorn... https://t.co/WxH7oChTXh	\N	1460666650	1460641266	Popcorn				110		nyc
toum	Toum NYC	toumnyc	https://www.facebook.com/ToumNYC	What up Brooklyn? Join us in @DumboNYC on Jay & Water St for some Lebanese deliciousness! vegan glutenfree healthy	f	1460650168	1460641960	Lebanese		500eedb0e4b062ee00577957	\N	57	\N	nyc
elpaso	El Paso Truck	elpasotruck	http://elpasony.com/	Today we are at @Columbia between W 115th & W 116st. Stop by and get your tacos, burritos, quesadillas yummy  tacotruck FoodTruckfriday	f	1425157921	1412955921	Mexican	\N	523c911f04937624937304c5	\N	36	\N	nyc
shanghai	Shanghai Sogo	shanghaisogo	http://www.shanghaisogo.com/	Happy Halloween. TGIFriday !! We r serving at water and Hanover sq!! ( 10 Hanover square ) come & get some. 11~3pm. http://t.co/VBdd8zsVAK	f	1455389469	1414769059	Asian		5258369d498e13def2bef2cb	\N	42	\N	nyc
mausam	Mausam	mausamnyc	http://www.mausamnyc.com	@UptownLunch York Avenue between 70th & 71 Street delicious Indian curries & bites http://t.co/CXr7MJL625	f	1452004266	1444830394	Indian		50730eebe4b0f3224431dc5d	\N	32	\N	nyc
brooklynpopcorn	Brooklyn Popcorn	brooklynpopcorn	http://brooklynpopcorn.com/	Good afternoon NYC hope everyone is enjoying their beautiful Wednesday! We are looking forward to seeing you on Hudson & King Street :)	f	1456686019	1434567787	Popcorn!		514a0737e4b09c3e77279d83	\N	39	\N	nyc
phils3	Phil's Steaks	philssteaks	http://www.philssteaks.com	52nd and 6th we are baaaaaack! Slangin' steaks from 11-230 today. Can't wait to see our wonderful customers!!!	f	1460663324	1460641161	American		4f15b382e4b0725660ea9f31	\N	25	\N	nyc
schnitzi	Schnitzi	schnitzi1	http://www.schnitzi.com/	@46 St bet 5&6 serving lunch from 11:30-3 :15 order online @www.schnitzi.com schnitzitruck schnitzel foodtruck kosherfood	\N	1460401679	1460642894	German	\N	532b25ed498eb8b1844dc14f	\N	14	\N	nyc
bigds	Big D's	bigdsgrub	http://bigdsgrub.com/	D2 - Jay/Water St., DUMBO\nVietnamese vermicelli salad bowl, while supplies last!! @hugeinc @ITO_EN @Sous_HQ https://t.co/ThWa3uda9B	f	1460562827	1460639907	Korean Fusion		4c968b907605199c2eaec2a3	\N	57	\N	nyc
eddiespizza	Eddie's Pizza	eddiespizzany	http://www.eddiespizzany.com/	Today we are parked on Hudson and King street.	f	1460561999	1460642451	Pizza		4c0cf412b4c6d13ae4850c30	\N	39	\N	nyc
mrnice	Mr Nice Guy	mrniceguytruck	http://mrniceguynyc.com	71st and york... it's friday	f	1414424434	1414687317	American		520bbbb211d26afae232ec59	\N	33	\N	nyc
andysitalianice	Andy's Italian Ice	andysitalianice	http://andysitalianicesnyc.com/	Sorry we couldn't find a spot on 47th and Park we are on 52nd and 6th Ave  @nycfoodtruck	f	1460408043	1442853772	Dessert	\N	4df26c2bae609e69dd95d2fc	\N	16	\N	nyc
paris	Paris Sandwich	parissandwich	http://www.parissandwiches.com/	Last day in dumbo today on fronts and Adams @ 11:30 @DUMBOFoodTrucks	f	1444221878	1414764931	French/Vietnamese		519e4ed0498e4f27e64c177a	\N	75	\N	nyc
funbuns	Fun Buns	funbunsnyc	http://j24f.com/funbuns/	Last day to get your favorite buns this year at 50th st between 6 / 7 ave midtown Happy Halloween everyone	f	1419358370	1414768000	Asian		4f8d9663e4b021137aa2bdde	\N	22	\N	nyc
snowday	Snowday	snowdaytruck	http://snowdayfoodtruck.com/	Lunch is served today in Dumbo!!! 11:30-3pm @bigduck @dumbolot @Etsy @WeWork @SITUSTUDIO @DUMBOBID	f	1460129032	1450271688	Comfort	\N	533ddd4a498e774b8250a69b	\N	54	\N	nyc
camion	Camion	camionnyc	http://www.camionnyc.com/	TGIFryday 56th & Broadway 2 special's to finish the week right chipotle falafel & chorizo tacos &... https://t.co/TfS8zOXwkb	\N	1447083321	1446219057	Mexican		53eced53498ea98fb8a770e4		29		nyc
mamasheros	Mamas Heros	mamasheros		Water St and Hanover sq today across the street from our usual Thursday spot at old slip come and get it before the rain gets here lol	\N	1446658197	1446136002	Sandwitches		5564a8c5498efbaa697c9fb9		42		nyc
carls	Carl's Steaks	carlssteaks	http://carlssteaks.com/home/	Mr. Sun , Mr.Sun, Mr. Golden Sun,  please shine down on  me!! So head over to 47th st bet lex / park av @mlb @nfl... https://t.co/Vi05h3oaJw	f	1460645395	1460557611	American		51a78330498e3fc1f22d771e	\N	17	\N	nyc
wafelMomma	Wafels & Dinges Momma	waffletruck	http://www.wafelsanddinges.com/	Serving at MetroTech 1 Metro Tech Center Brooklyn From 11:00AM-4:00PM brooklynwaffles https://t.co/NMGJ6xth4u	f	1460662251	1460646325	Belgian		4a416369f964a52036a51fe3	momma	76	before	nyc
luckyimthai	Luckyim Thai	luckyimthai		Downtown Hanover sq. call us then pick up 929-382-8537	\N	1460560507	1460647844	Thai		50ef072fe4b03329113dfb9c		52		nyc
steelcart	The Steel Cart	thesteelcart	http://www.thesteelcart.com/	Makin a grand finale on Front & Jay! Stick it to the weatherman with a toasted sandwich & grits. Soup today is Rustic Chicken Noodle.	f	1455214495	1419950738	French		511d3abee4b0e188895f3697	\N	56	\N	nyc
mactruck	MacTruck	mactruckny	http://MacTruckNYC.com	Good morning 47st!!! Between park and lex last truck on the block caboose	f	1453065384	1432730877	American	Looking to take a nap after lunch? This truck is great and the owner is incredibly friendly. Feel free to chat it up while you watch him prepare your food.  Not listed on the menu are the many condiments\\n you can get on your macaroni. The regular size is a good portion for a normal lunch.	50575ab8e4b04ed4f2197dac	\N	17	\N	nyc
mtblls	Mtblls	mtblls		TGIF MTBLL LOVERS!  Stroll on by 50th bet 6&7 Aves for your weekend fix. The  will be waiting 	f	1449626029	1440168472	Italian	\N	504fb7fde4b0bc88c3a6b614	\N	22	\N	nyc
korilla	Korilla BBQ	korillabbq	http://korillabbq.com	@Brandon82S we'll be at Metrotech 4/28	f	1460664217	1460664168	Korean Fusion		4cc701aa01fb236ab070baba	\N	76	\N	nyc
eggstrav	eggstravaganza	etravaganza	http://www.eggstravaganzany.com/	Happy Monday..!!\nWhat are you Craving for??\nBreakfast or Lunch?\nHow About;Breakfast for Lunch!\nJoin us. NE 52nd and Park is the Place.	\N	1460649477	1459780967	Mexican	\N	4b15165ef964a52049a823e3	\N	72	\N	nyc
toastmonster	Toast Monster	toastmonsternyc	http://www.toastmonsternyc.com/	Toast Monster @UrbanSpaceNYC @GarmentDstrctNY till October 17. On Broadway between 40th and 39th st.	f	1450319297	1411270224	American		50ad1829e4b087613d696bc4	\N	\N	\N	nyc
valduccis	Valduccis	valduccis	http://valduccis.com	We're are on 51 St and Park Ave lunch midtown @greenboxny @Cater2me @FoodPorn befair @CrespoMax @foodNfest https://t.co/vdTHFGbecR	f	1460598615	1459439781	Pizza		4df7e1aad4c02ad734170b21	\N	24	\N	nyc
schnitzelcart	Schnitzel & Things Cart	schnitznthings	http://schnitzelandthings.com	It's Schnitzel time.  The cart will be on 27th & Park serving up your favorite lunch!	f	1431702487	1426694447	German	\N	4a6640b3f964a5204cc81fe3	(schnitzcart|the cart)	71	contains	nyc
bobjo	BobJo	bobjotruck	http://www.bobjo.net	Welcome Friday ! We r open @47th st. Between park and lex ave. try our BBQ beef pork shrimp and NEWmenu BOBJO BBQ burger come by &enjoy thx!	f	1447347230	1447432734	Fusion Korean		4e3add0c88772c3bf12772da	\N	17	\N	nyc
hh2	Habachi Heaven 2	hibachiheaven	http://www.hibachiheaven.com/	Open and ready to roll corner of Varick and King	f	1446923016	1423759572	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	1	38	two	nyc
carpedonut	Carpe Donut	carpedonutnyc	http://carpedonutnyc.com/	We are open at 51st street and Park avenue. Come!!!	f	1460567695	1460630379	Sweets	They only server one kind of donut here, the apple cider, but it's a pretty good one. They are fresh and still hot when you get them. They have donut ice cream sandwiches but you should know the entire thing is in the freezer so you will get a frozen donut as well.	5169892c498e0522481eea97	\N	24	\N	nyc
crepestruck	Crepes Truck	thecrepestruck	https://www.facebook.com/thecrepestruck	Come ceck out the Brazzers promo truck in Time Square 48 & 7 ave today till 4pm. http://t.co/wUDdRIZpAh	f	1456676717	1406998102	Crepes		4dfb854918386e743d9869e3	\N	\N	\N	nyc
morris	Morris Grilled Cheese	morristruck	http://morrisgrilledcheese.com/	Happy Thursday! @DowntownBklyn Metrotech Commons 11-3, come lunch with us!	f	1447191134	1442502360	American		4e0e0b3caeb7a5b33ee5dac1	\N	76	\N	nyc
yankeedd	Yankee Doodle Dandy's	usafoodtruck		Democracy in action today y'all. We'll be at the Democratic Debate at the Brooklyn Navy Yard. We are non-partisan, but love democracy. free	f	1460664791	1460635496	American	\N	52b497e1498eed13ead2b84c	\N	55	\N	nyc
pocketful	The Pocketful	thepocketful	http://thepocketful.com/	Our cart is back on 50th between 6th and 7th. Enjoy the sunshine!	f	1448293901	1430145608	Mediterranean		4db8bcd790a0e3f61d601888	\N	22	\N	nyc
chipsy	Chipsy King	chipsykingny	http://chipsykingny.com/	Kasar truck is at 46th and 6th avenue until 7pm	f	1437241508	1436448508	Fries		51bb5c43498ee06e13d0d31f	\N	13	\N	nyc
domo	Domo Taco	domotaco	http://www.domotaco.com	It's Wednesday so we are at @Dumbolot today!  At the intersection of Water and Jay Street!	f	1460646197	1460553005	Asian Fusion		4ed90a2e77c8274efb746d83	\N	54	\N	nyc
lobstertruck	Red Hook Lobster	lobstertruckny	http://redhooklobster.com/	BigRed is still parked at 55th and Broadway with plenty of lobstah for all you late lunchers. Go grab a roll! https://t.co/vLmEynmnYi	f	1460660677	1460655029	Seafood		4dc597c57d8b14fb462ed076	\N	28	\N	nyc
chefsamir	Comme Ci, Comme Ca	chefsamirtruck	http://www.chefsamirtruck.com	We are at 47st between park av and Lexington @Foodtruckgirl7 @Sexyfoodtrucks	f	1460475592	1460648551	Moroccan		4c3c85e3a9509c74b52e395b	\N	17	\N	nyc
shortys	Shortys	shortysnyc	http://www.shortysnyc.com	Up and running at SouthStreetSeaport South and Fulton Streets Cheesesteak ChickenCheesesteak RoastPork... http://t.co/awyzKOzJqw	f	1460664327	1415982867	American		4faea2cce4b08a88c5dc5d05	\N	58	\N	nyc
lukeslobster	Luke's Lobster	nautimobile	http://lukeslobster.com/	This is it, our last day on the streets of NYC. 17th st and 5th ave. So long, farewell, see ya when we see ya.	f	1459367524	1430398345	Seafood		4dc81239b0fb5556cd2f3023	\N	86	\N	nyc
mexicoblvd	Mexico Blvd.	mexicoblvd	http://mexicoblvd.com	Buenos dias DUMBO! Enjoy your lunch @MexicoBlvd @dumbolot	f	1459525567	1445872775	Mexican		4f4e55aee4b04c96fba5b149	\N	54	\N	nyc
palenque	Palenque	palenquefood	http://www.palenquehomemadecolombianfood.com	RT @KristinaMongan: @Palenquefood TY4my 1st eva Arepa! So friendly &delicious! BwayBites muy bueno! NomNom whatsnext vivacolumbia http...	f	1460497789	1434670346	Colombian Fusion		4e84f424dab45bbd2617dc62	\N	36	\N	nyc
souvlaki	Souvlaki GR	souvlakitruck	http://www.souvlakigr.com/	RT @Chefsamirtruck: We are on Broadway between 55st and 56st !!the original trucks\n@Foodtruckgirl7 @carlssteaks @souvlakitruck @Sexyfoodtru...	\N	1460398939	1458928486	Greek	\N	4c75c2908d70b713d5dcdaad	\N	28	\N	nyc
sweetery	Sweetery	sweeterynyc	http://sweeterynyc.com	Come to Hudson/King St 4 ur FREE cup of exceptional coffee & a sidekick treat, a croissant w/Nutella, could this be the best part of ur day?	f	1460466451	1443706721	Sweets		4a28d919f964a52056951fe3	\N	39	\N	nyc
cinnamonsnail	The Cinnamon Snail	veganlunchtruck	http://www.cinnamonsnail.com/	Parked on 55th/Broadway 9:00-3:00\n*Please read note at the bottom of this post. \n\nHabanero apricot grilled tempeh... http://t.co/9ifeS1tevk	f	1460650019	1425044750	Vegan		4c263af6a852c9287537e66c	1	28	two	nyc
kaya	Kaya NYC	kayanyc28	http://www.kayanyc28.com/	Nice weather out today for some gua baos. Parking at Varick and Charlton street. Pre-order is available at (646) 358-2258 soho lunchtime	\N	1460558303	1460645013	Chinese		54342678498e669166a9d82c		38		nyc
langos	Langos	langostruck	http://www.langostruck.com/	hi \nLangos Truck @Fidi\nWater St & Old Slip\n11-2:30pm\n\nThursday 52st/6Ave \n\nif you don't know Mangalitsa take look http://t.co/JFRV2ZJRmb	f	1452295581	1442412236	Hungarian	\N	537a883c498eb7fac064409f	\N	51	\N	nyc
disos	DiSO's	disosnyc	http://www.disosnyc.com/	Thursday lunch/ 47th and Park Ave\n\nCall in orders to- 917-756-4145	f	1460587624	1460644910	Italian Sandwiches	These might be typical italian sandwiches but the ingredients are high quality. You need to get there early because the line can get long and they will run out of some breads. I believe the focaccia half is a normal portion for lunch while their half and hero sizes are pretty big.	519523d6498eeaa6200aad03	\N	16	\N	nyc
shuka	Shuka Truck	shukanyc	https://www.facebook.com/ShukaTruckNYC	TODAY -21st St & 5th AV Repost @melbourne_glutton with @repostapp.\n\nglutton for NYC food trucks  | we... https://t.co/9RodfoVtnA	\N	1460657934	1459350803	Israeli	\N	546a5011498e0e047a243f37	\N	96	\N	nyc
biandang	Bian Dang	biandangnyc	http://www.biandangnyc.com/	LAST DAY FOR BIANDANG! It's been a pleasure serving you New York, catch us on 53rd & Park for the last day of the season!	f	1448643747	1446213252	Taiwanese		4d712874722ef04d04160d9c	\N	26	\N	nyc
pontirossi	Ponti Rossi	pontirossifood	http://www.pontirossifood.com/	RT @dumbolot: We have @mamuthainoodle ,@SweetChiliNYC and @PontiRossiFood  at Dumbo today.	f	1460239136	1460128701	Italian	\N	542d78f4498ee5493e1a8989	\N	54	\N	nyc
taim	Taim Mobile	taimmobile	http://www.taimmobile.com/	Vandam and Varick today!  Hope to see you there!	f	1460660150	1460644347	Mediterranean		4cf2c5321d18a143951b5cec	\N	80	\N	nyc
latinkitchennyc	Latin Kitchen	latinkitchennyc	http://www.latinkitchennyc.com/	HAPPY HALLOWEEN ! ! TODAY OUR LAST FRI OF 2014 ..THANK YOU WALLSTREET! !\nLOCATION 55 WATER ST (SIDE OF OLD SLIP) NYC http://t.co/RWCtK9bCEc	f	1460618811	1414768415	Mexican	\N	53878518498ef00115dbdea1	\N	73	\N	nyc
delindogztruck	DeliNDogz Pastrami	delindogztruck		Hello today old slip bet water and front to 3 pm we see you all have a good day	\N	1460124331	1460040840	Kosher Pastrami		535d6b6f498e9d2f2d2d8da7		68		nyc
dubpies	DUB Pies	dubpies	http://www.dubpies.com/	Come to the cafe? Where there's a will? RT @adamcolon: @dubpies @imogencrispe @dumbolot oh no!! I'm getting the shakes now, no pie fix!!!?!	f	1460663054	1457974219	New Zealand meat pies	\N	4eb825a62c5b53141b78bfb6	\N	54	\N	nyc
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
RT @CoryBooker: You have not lived today until you have done something for someone who can never repay you. \n John Bunyan	1460126360	718448143315165184	f	thegreenradish1
Thrilled to be serving cast and crew of our fav TV show today @NBCBlindspot @JaimieAlexander	1460124668	718441047102197760	f	thegreenradish1
Hey JerseyCity missed you, private events all week, back next week....Cooking for cast and crew of the hot new... https://t.co/JpbPZBddXj	1460083873	718269942043406336	f	thegreenradish1
GetRad at Jersey City Food Truck Hub grand and hudson, BBQ Black Bean Burgers, Baked Garlic Fries, Super... https://t.co/EKH77yKrSp	1459773137	716966619784679424	f	thegreenradish1
Dunk a baked fry in bbq sauce @thegreenradish1 GetRad at JerseyCityFoodTruckHub grand&hudson... https://t.co/R1xukeGS5t	1459565454	716095533169963010	f	thegreenradish1
FalafelBurgers today, Friday, Jersey City Food Truck Hub grand&hudson EatWell JerseyCity https://t.co/VHQ6bTpH17	1459523092	715917853778649089	f	thegreenradish1
RT @CarmellaNYC: Just housed the Black Bean Burger from @thegreenradish1 awesome	1459454663	715630843742564353	f	thegreenradish1
falafelburger @thegreenradish1 today JerseyCityFoodTruckHub grand&hudson GetRad JerseyCity https://t.co/3HHEORCo30	1459428316	715520335878037504	f	thegreenradish1
Dunk a baked fry in bbq sauce, today, @JCFoodTruckHub grand&hudson  also @TheIncrediballs @MECasaJC @CarmellaNYC https://t.co/VA8kmXcN0B	1459425997	715510609069096960	f	thegreenradish1
Falafel Burgers  today @JCFoodTruckHub grand&hudson also @Food_Samurai @CarmellaNYC @MECasaJC https://t.co/WHZxQ8HZwv	1459355604	715215358760759297	f	thegreenradish1
Catch The Green Radish at Jersey City Food Truck Hub today, Wednesday....BBQ Black Bean Burgers, grilled onions,... https://t.co/6n8s1YjNUG	1459334030	715124871039033344	f	thegreenradish1
Black is Back...BBQ Black Bean Burgers with grilled onions, baby arugula, kosher dills, special sauce, toasted... https://t.co/RpzYKL6Z50	1459203865	714578922017464321	f	thegreenradish1
Getting ready for a year on the Pier; this will be epic. https://t.co/vULortYhZ3	1459201098	714567313500954625	f	thegreenradish1
Eatwell JerseyCity support JCfoodtrucks today @JCFoodTruckHub grand&hudson @Food_Samurai @TheIncrediballs @CarmellaNYC @MECasaJC	1458835066	713032065248337920	f	thegreenradish1
@thegreenradish1 feeding TheModern GetRad GoVegan eatplants crueltyfree ahimsa https://t.co/q0JubIDZjy	1458769707	712757930022592513	f	thegreenradish1
Falafel Burgers, Baked Garlic Fries, Super Choc Tarts today at Jersey City Food Truck Hub grand&hudson till 1:30...GetRad JerseyCity	1458745239	712655302965989376	f	thegreenradish1
The Green Radish feeds The Modern thanks for a great night! https://t.co/blyo2Y4uNS	1458724737	712569313811533824	f	thegreenradish1
Ricky Gervais knows where it's at \nThe Green Radish vegan crueltyfree https://t.co/o0zdrp3zgr	1458521153	711715418315079680	f	thegreenradish1
Super Chocolate Tarts...chia, hemp, flax, cinnamon, dates, melted Belgian chocolate. get... https://t.co/zT6Kun2Wfp	1458349940	710997299468570624	f	thegreenradish1
Super Chocolate Tart with chia, hemp and flax seeds, dates, cinnamon and melted Belgian chocolate...get yours \nat... https://t.co/P4TmB1r8bk	1458347724	710988004681129984	f	thegreenradish1
Friday lunch- 46th and 6 Ave. \n\nCall in orders to: 917-756-4146	1460127299	718452082701967360	f	disosnyc
Thursday lunch- 47th bet park and Lexington \n\nCall in orders to: 917-756-4145	1460038862	718081151374647296	f	disosnyc
Today lunch on water and old slip.\n\nCall in orders to: 917-756-4145	1459953350	717722487333720064	f	disosnyc
Parked on 48th bet 6 and 7 Ave.\n\nCall in orders to: 917-756-4145	1459867071	717360608195317760	f	disosnyc
Open for lunch- 47th bet park and Lexington \n\nCall in your orders: 917-756-4145	1459784573	717014587061772288	f	disosnyc
Monday's on 47th bet park and Lexington \n\nCall in orders to: 917-756-4145	1459777785	716986117103423488	f	disosnyc
Open for lunch: 46th closer to 6 Ave\n\nCall in orders to: 917-756-4145	1459525493	715927926760452099	f	disosnyc
Friday lunch were posted on 46th bet 5 and 6 Ave. \n\nCall in orders to: 917-756-4145	1459521346	715910531924824064	f	disosnyc
RT @Chefsamirtruck: @Foodtruckgirl7 @Sexyfoodtrucks @DiSOSNYC	1459451115	715615961018187776	f	disosnyc
Thursdays 47th bet park and Lexington \n\nCall in orders- 917-756-4145	1459435960	715552397360234497	f	disosnyc
Lunch today on Water and old slip..\n\nCall in orders to- 917-756-4145	1459345414	715172620862431232	f	disosnyc
RT @JosephAzam: made in a truck to trap music and you taste all of that ... @DiSOSNYC is breaded truth. midtown eeeeeats https://t.co/hnF9...	1459290104	714940633635491845	f	disosnyc
@davidnierenberg tomorrow, water and old slip	1459290095	714940597153431552	f	disosnyc
Open for lunch- 48th bet 6 and 7 Ave\n\nCall in orders: 917-756-4145	1459264633	714833798425415680	f	disosnyc
Lunch today- 48th bet 6 and 7 Ave.\n\nCall in orders to: 917-756-4145	1459261461	714820494709620738	f	disosnyc
Open for lunch.. 47th bet park and Lexington \n\nCall in orders- 917-756-4145	1459177799	714469592534532096	f	disosnyc
Monday's lunch- 47th bet park and Lexington \n\nCall in orders for pick up: 917-756-4145	1459172210	714446150988931072	f	disosnyc
@justin_cohen the fonz	1458919606	713386650873815040	f	disosnyc
Open for lunch- 46th and 6 Ave\n\nCall in orders: 917-756-4145	1458919521	713386293879816192	f	disosnyc
Friday lunch is brought to you by Disos- for the taste of a quality sandwich come see us on 46th and 6 Ave today.... https://t.co/knG004g4ri	1458915198	713368163291897857	f	disosnyc
Spotted, NuchasCart is in Manhattan w/free empanadas  nationalempanadaday radiocity https://t.co/idchXM6GV1	1460148184	718539680900374528	f	nuchasnyc
Its hard to decide in the flavors of todays special combo: 3 empanadas + 1 soda $ 8 empanadaday muchasnuchas https://t.co/qwJCXJEcks	1460147511	718536859924738048	f	nuchasnyc
Sneak peak  empanadas ready for sample at Greeley sq.nationalempanadaday muchasnuchas nyc https://t.co/A4DmXIfBZa	1460138132	718497518376611840	f	nuchasnyc
out for lunch around 33rd& 6th? Come have free empanadas and celebrate nationalempanadaday w/us! muchasnuchas nyc https://t.co/LjNnL2IMfb	1460137666	718495563692552193	f	nuchasnyc
Mini empanadas just came out of the oven! Come have them for free nationalempanadaday empanada nyc muchasnuchas https://t.co/RSNZpvYZKu	1460132016	718471867921772544	f	nuchasnyc
Mini empanadas just came out of the oven! Come have them for free nationalempanadaday empanada nyc muchasnuchas https://t.co/EhfrQy2rvf	1460131806	718470986631352320	f	nuchasnyc
NuchasTruck is already celebrating empanada day giving free mini-empanadas  (while supply lasts) nyc fidi https://t.co/zoz5UzLYFM	1460129837	718462726448787456	f	nuchasnyc
Happy empanada day! Treat yourself w/free mini-empanadas  Broad & William  52 & 6 Av. Times Square  33rd & 6 Av. nationalempanadaday	1460124137	718438819616407552	f	nuchasnyc
 tbt to this fun day literally hanging out with empanadas !  empanada day is coming join us tomorrow! https://t.co/zqT4cZEJoN	1460059307	718166903747907584	f	nuchasnyc
TOMORROW  Celebrate with us & enjoy mini-empanadas in our locations https://t.co/nBoO2aUFzl   nationalempanadaday https://t.co/oX5ac8vWCu	1460052112	718136727378993152	f	nuchasnyc
Thursday is here! don't mind the rain, come join us for empanadas and medialunas  4th St NYU Stern Brooklyn College	1460037713	718076333885165568	f	nuchasnyc
Nuchastruck has changed location to 14th & 3rd until 9pm   https://t.co/8AK1HLM1Fv	1459970112	717792794694299649	f	nuchasnyc
who's ready for some empanadas? We're at  21st & 5th and Brooklyn college Join us!	1459952718	717719839142453248	f	nuchasnyc
National empanada day is coming  This Friday celebrate with us at our kiosks and Food Truck  locations: https://t.co/NXvu3m26ra nyc	1459889910	717456402160214016	f	nuchasnyc
The cold will not beat us   BrooklynCollege we're here! come warm up with hot coffee and medialunas just baked for you	1459865408	717353634447626240	f	nuchasnyc
Bundle up people! apparently Winter is not over we'll be at 4th St at NYU (cross street Greene) w/hot coffee and warm baked yummy things!	1459864269	717348854480441344	f	nuchasnyc
Nuchastruck is now open at  Waverly & Broadway	1459798762	717074099483361281	f	nuchasnyc
 Grab your umbrellas and join us for fresh-baked handheld foods  Varick & Charlton and  Brooklyn College	1459778120	716987518336573440	f	nuchasnyc
Sundays = brunching late. Come to nuchastruck 67th & Broadway for a snack while you wait for brunch time nuchascart at Barclays Center	1459692062	716626567577919488	f	nuchasnyc
Nuchastruck changed location: 3rd Ave & 8th St  we're open until Midnight!  Saturdaynight Streetfood nyc empanadas	1459629037	716362221350162432	f	nuchasnyc
Business Cards are looking Extra Crispy  \nContact us for Private Catering . \nFood with love, Stay Jolly https://t.co/1PGJL1cLJI	1459880102	717415265181515777	f	jolly_fat_pig
flat iron steak, always experimenting with new flavors, new methods, new ideas. staytuned jollyfatpig https://t.co/NWb3jsHgAs	1458700104	712465991549194241	f	jolly_fat_pig
All smiles on the foodtruck. We love what we do. support your local small businesses! On set for the cameras https://t.co/8tgwBp4s4T	1458572456	711930597233577984	f	jolly_fat_pig
RT @SimplySOUF: @Jolly_Fat_Pig no problem.. I'll be seeing yall soon. I'll be coming by extra hungry 	1458517063	711698265574678528	f	jolly_fat_pig
@SimplySOUF thanks for love always	1458516935	711697725201506304	f	jolly_fat_pig
Always Freshness and cleanliness. Jolly Fat Pig TM foodtruck is excited for the spring and upcoming 2016 season. https://t.co/lwB3p5M3KN	1458515746	711692741793718272	f	jolly_fat_pig
RT @Joynture: @Jolly_Fat_Pig YAY! We are excited to have you back at Hanover Square soon!	1458320503	710873831108452353	f	jolly_fat_pig
@Joynture yes we are, however just private events, we will be back for lunch time in 2-3 weeks can't wait to see you guys!	1458320417	710873471023247361	f	jolly_fat_pig
RT @SimplySOUF: @Jolly_Fat_Pig you should've stood arou for this perfect weekend. The streets need you	1450033493	676115591904804869	f	jolly_fat_pig
RT @HeavyMetalTeddy: 45 degrees in Hoboken means I can still use the grill! Memphis Rib Rub Pork Chops! Foodiechats https://t.co/7hEuJ1lW...	1449886146	675497575718498304	f	jolly_fat_pig
RT @DerrickPrince: @chef_plum @sichefrob @dontsithome @petegenovese @Jolly_Fat_Pig Nice! For me today was porchetta! testkitchen https://t...	1449886135	675497528683569153	f	jolly_fat_pig
great run. Closed for lunch in the city for the season. Still open for private events and catering thank you! https://t.co/YzjFIRRfk8	1449683749	674648658852364288	f	jolly_fat_pig
That beef brisket is homemade and cooked for hours, then thinly sliced and put into your sandwich or plate! https://t.co/0rF3E5eAWO	1448471969	669566084647919618	f	jolly_fat_pig
steak salad, protein packed! Hanover and water for lunch in the city. catch us while you can. https://t.co/CaE6BezdtO	1448300378	668846380035809280	f	jolly_fat_pig
@IseeitITweetit we are across the street on Hanover today! Thanks for reaching out	1448032754	667723883244593152	f	jolly_fat_pig
RT @IseeitITweetit: @Jolly_Fat_Pig are you guys on Old Slip and Water today?	1448032720	667723744123703297	f	jolly_fat_pig
RT @HeavyMetalTeddy: Guess I know where I am going in February!  @GuruBBQ gimme dat BACON https://t.co/wmkpQ5J6Ok	1447954907	667397368883580928	f	jolly_fat_pig
Have them on any sandwich, plate, or salad ! They are absolutely gorgeous today! foodie  52nd and 6th till 3! https://t.co/vSzK3iLZuM	1447954548	667395866416820224	f	jolly_fat_pig
promote beautiful human instincts like love, care and open mind. humanity depends on it. 1745 Broadway https://t.co/vbecdRtFBa	1447864976	667020170989314048	f	jolly_fat_pig
@montefrain old slip and water street. (55 water street) until 3 o clock	1447691915	666294301891158016	f	jolly_fat_pig
D1 is grillin' it up at 50th Street btwn 6th and 7th Avenue. See you for lunch! https://t.co/4hyAoC69Mc	1460121806	718429043742351360	f	bigdsgrub
Rain stopped, lunch has resumed!  \nD1 - 50th Street btwn 6th and 7th Avenue\nD2 - Jay and Water Street. DUMBO	1460050520	718130047811522560	f	bigdsgrub
It's THAT time of the week folks! D1 is grillin' it up at 50th Street btwn 6th and 7th Avenue. 11am to 2:30pm https://t.co/DfnL5Gwvrj	1460034777	718064019693764609	f	bigdsgrub
Don't miss out today. Jay/Water Street, DUMBO. @Sous_HQ @hugeinc @ITO_EN Vietnamese Thai https://t.co/j5yhm1W0e1	1460034706	718063722074398720	f	bigdsgrub
That line doe. @LibertyTravel MexicoExtravaganza Mexico LibertyTravel tacos burritos quesadilla https://t.co/P9wxxvAEfS	1459971680	717799370515685376	f	bigdsgrub
RT @LibertyTravel: Visit our Union Square location today for a tasty treat!  https://t.co/havlIXCikv	1459950447	717710310694584321	f	bigdsgrub
We've teamed up w/ @LibertyTravel today for a Mexican Extravaganza! https://t.co/ebmd4l1Xlh	1459949075	717704556956819460	f	bigdsgrub
D2 - 50th Street btwn 6th and 7th Avenue https://t.co/EVYtoJAlXj	1459948170	717700762508328960	f	bigdsgrub
D1 - 50th Street btwn 6th and 7th Avenue. Preorder for fast pickup! 646-543-BIGD.  We're heating things UP!  https://t.co/BdhXWlj9IV	1459862005	717339361331777536	f	bigdsgrub
D2 is grillin' it up at Hudson/King Street.  Preorder for fast pickup! 646-543-BIGD https://t.co/zjZHMxbPcT	1459861595	717337640698318849	f	bigdsgrub
D1 - Hudson/King Street\nD2 - Jay/Water Street, DUMBO \n\nPreorder for FAST pickup!! 646-543-BIGD	1459784820	717015621561659394	f	bigdsgrub
D1 is grillin' it up at Hudson/King St. Preorder for fast pickup! 646-543-BIGD westvillage soho https://t.co/Sm4vR5Jw6r	1459775154	716975079947640832	f	bigdsgrub
D2- Jay/Water Street, DUMBO. Preorder for fast pickup! 646-543-BIGD. @Sous_HQ @hugeinc @ITO_EN https://t.co/Jqr3XDKjPW	1459775067	716974714124701696	f	bigdsgrub
RT @ShanghaiMKS: Everybody needs @bigdsgrub\nin their life! FoodTruck https://t.co/kIl3KcceRi	1459721373	716749506822422533	f	bigdsgrub
RT @ourwickedlady: Brunch is ON! Delicious grub from @bigdsgrub Tacos and burritos and dumplings Oh My! ourwickedlady... https://t.co/Z9Tq...	1459703918	716676294856065024	f	bigdsgrub
Join us today for brunch/lunch at @ourwickedlady.  153 Morgan Avenue, Brooklyn. 12:30pm to 5pm https://t.co/RZWKeFJiXH	1459695462	716640827276189696	f	bigdsgrub
D1 - 50th Street btwn 6th and 7th Avenue. https://t.co/ZG7L6TYHJg	1459515736	715887003259240452	f	bigdsgrub
For your eating pleasure...D1 - 50th btwn 6th and 7th Avenue https://t.co/rdICzD73Uq	1459515632	715886566737121280	f	bigdsgrub
Were BACK for your eating pleasure!  D2 is at 53rd Street and Park Avenue\nPreorders call 646-543-BIGD https://t.co/aorbi13j5w	1459515626	715886541738999808	f	bigdsgrub
D2- Jay/Water Street, DUMBO\nSee you soon! @Sous_HQ @hugeinc @ITO_EN https://t.co/yUI1ydFdZq	1459429671	715526020724629506	f	bigdsgrub
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
Spring is here and orders are going out!! Place yours today! 516-972-7959 or... https://t.co/Ut9QN0eALm	1459620390	716325951538393088	f	andysitalianice
How great would this look in your window? Inquire about serving @AndysItalianIce in your... https://t.co/hQMM1Q7mLL	1458668767	712334557039730688	f	andysitalianice
@Anthony_Arroyo1 I'm sorry I didn't get back to you sooner. We will be on the streets in a few weeks.	1457566549	707711520847826945	f	andysitalianice
Frozen Mudslide on a freezing day! Who wants? @ Farmingdale, New York https://t.co/R3Ro1JaFuo	1455561845	699303181701025792	f	andysitalianice
RT @Valduccis: No freshman sit out grandma. The crust is. ToDieFor @greenboxny @MrVsPizza @ foodtoeat valduccis delish yummmmm https://...	1454644861	695457073375682560	f	andysitalianice
Can't wait for summer! https://t.co/80g0zLlK44	1454381265	694351471580729344	f	andysitalianice
RT @MobileCuisine: Increase FoodTruck Sales With The Words You Use https://t.co/4RSMObn9Bm	1453178272	689305752754896896	f	andysitalianice
RT @MobileCuisine: Keeping Your FoodTruck Brakes Working Properly https://t.co/JbsMx2US6B	1452900393	688140243334070273	f	andysitalianice
RT @ShanghaiMKS: NYC Winters can be harsh for FoodTrucks. Here are 5 ways to survive: https://t.co/Q96Y4Z4k2h	1452646790	687076556003487744	f	andysitalianice
RT @Valduccis: https://t.co/UnHwzwtHWK	1451624113	682787138027556864	f	andysitalianice
RT @ShanghaiMKS: Cheers to a happy and healthy 2016 for all. HappyNewYear https://t.co/f9iIJIWIP4	1451624111	682787127822802946	f	andysitalianice
Happy New Year https://t.co/dHI4bw59Zf	1451603992	682702743560126465	f	andysitalianice
RT @Valduccis: Smores  Mmmmm @MrVsPizza @greenboxny @foodNfest @Foodtruckgirl7 @AndysItalianIce @Foodtruckstars_ @eatupnewyork https://t.c...	1449670865	674594619330547714	f	andysitalianice
Happy Thanksgiving   	1448577425	670008402119155713	f	andysitalianice
RT @rhsaphire: @AndysItalianIce Best Hot Chocolate Everty Andy!!!	1447527168	665603305159180288	f	andysitalianice
RT @randomfoodtruck: A nice autunmny day for a picnic in the colorful park! @carlssteaks @CarpeDonutNYC @Chefsamirtruck @souvlakitruck @gcn...	1447432991	665208297901973504	f	andysitalianice
RT @DeanRayBraun: We all know the FoodTruck business is a tough one, but @WSJ shines light on the issues. https://t.co/Ydg1yWOlN0	1447387875	665019064750891009	f	andysitalianice
RT @ShanghaiMKS: Food trucks are one of the fastest growing industries in the country. What kind of FoodTruck would you open? https://t.co...	1447387859	665019000255078400	f	andysitalianice
Join us for the 5th Annual Toys4Tots presented by @MartinoAutoConcepts @Exotics4Life @Ferrari_Maserati_LongIsland https://t.co/0XTihTzFp3	1447267107	664512527586447364	f	andysitalianice
We are hanging with the best today @ToughMudder also with the Cheesiest @gcnyc1 all day. Italianicestruck NYCfoodtrucks Andysitalianices	1446985046	663329478567923712	f	andysitalianice
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
G1 Hudson / king \nG2 53/ madison \nComeToTheCheeseYo	1460126098	718447047196729345	f	gcnyc1
G1 Hudson / king \nG2 58 / madison \nComeToTheCheeseYo	1459959242	717747201670307840	f	gcnyc1
G1 46 5/6\nG2 91 / Columbus @trinity \nComeToTheCheeseYo	1459873052	717385695103422464	f	gcnyc1
G1 Hudson / king \nG2 wall / william \nComeToTheCheeseYo	1459785363	717017898083094528	f	gcnyc1
Big Gorilla Fans ComeToTheCheeseYo https://t.co/FkX5rBa905	1459715639	716725454451945472	f	gcnyc1
No trucks on street today...\n1 truck booked for Bar Mitzvah end of party in Huntington\n1 Truck available for hire!!!!!!! ComeToTheCheeseYo	1459603157	716253673131753472	f	gcnyc1
G1 hudson / king \nG2 53/madison \nComeToTheCheeseYo	1459520868	715908529312423937	f	gcnyc1
@TennisChannel gourmet French cheese truck @MediaVestUSA thanks for their support,2016 Roland Garros TCCheeseTruck https://t.co/6Fcot1fA1H	1459443835	715585429362384897	f	gcnyc1
@TennisChannel sends a gourmet French cheese truck to @MediaVestUSA NY to thank them for their support for 2016 Roland Garros TCCheeseTruck	1459443664	715584710353756160	f	gcnyc1
@TennisChannel ty 2016 sponsors w/TCCheeseTruck in NYC promoTennis Channel's Roland Garros coverage May 22-June 5 https://t.co/2agalV8tp7	1459437020	715556842739539968	f	gcnyc1
@TennisChannel thanks their 2016 sponsors with a TCCheeseTruck in NYC promoting Tennis Channel's Roland Garros coverage May 22-June 5	1459436530	715554788738514944	f	gcnyc1
Both trucks are hired out today for corporate events.....	1459436524	715554763648208896	f	gcnyc1
@TennisChannel TCCheeseTruck next stop in NYC ... @OMD_USA ! Come out to try a Serena Supreme Grilled Cheese! ItsAWholeNewGame	1459375132	715297265385148416	f	gcnyc1
https://t.co/ZWXzbhDFF6	1459367493	715265227495968768	f	gcnyc1
@TennisChannel thanks their 2016 sponsors with a TCCheeseTruck in NYC promoting Tennis Channel's Roland Garros coverage May 22-June 5	1459367483	715265182537289729	f	gcnyc1
G1 46 5/6\nG2 @TennisChannel \nComeToTheCheeseYo	1459350366	715193389340295169	f	gcnyc1
RT @NYCMayorsOffice: Happy Father's Day. http://t.co/D27i0IT5OR	1402846026	478197011238641665	f	getstuffednow
@TennisChannel sends a gourmet French cheese truck to @Carat_USA to thank them for their support for 2016 Roland Garros TCCheeseTruck	1459350342	715193290539327488	f	gcnyc1
@TennisChannel TCCheeseTruck next stop ... Zenith @ZO_US ! Come out to try a Roland Garros Melt! ItsAWholeNewGame	1459270516	714858475738640384	f	gcnyc1
G1 old slip / water \nG2 @TennisChannel \nComeToTheCheeseYo	1459267030	714843852394389505	f	gcnyc1
@TennisChannel sends a gourmet French cheese truck to @Havasnyc to thank them for their support for 2016 Roland Garros TCCheeseTruck	1459266777	714842793785573376	f	gcnyc1
Don't cheat yourself. Treat yourself....... to some tasty eats. Serving up goodness until 2:30 pm on 46th & 6th! TGIFridays	1460133099	718476408306200577	f	kimchitruck
Find us on 46th & 6th ave. Today doing our kimchi thang 11:30 - 2:30	1460125075	718442754989285376	f	kimchitruck
Halfway through the work day. Finish strong with a delicious lunch. 46 & 6th ave til 2:30 pm.	1459962438	717760607592849412	f	kimchitruck
Lunch time on 46th & 6th til 2:30 pm. Bring a colleague and your appetite!	1459957191	717738597911232513	f	kimchitruck
Setting up shop on 46th & 6th. 11:30 - 2:30 pm.	1459950162	717709116387491840	f	kimchitruck
RT @dumbolot: Cold outside so grab something warm from Dumbo! Today we have @SweetChiliNYC , @KimchiTruck and @PontiRossiFood	1459870264	717374000851234816	f	kimchitruck
One bite of our Krispy Fish Taco will remind you its actually spring, this weather will confuse you. Here until 2:30 Jay & Water st. Dumbo	1459870232	717373867891798016	f	kimchitruck
Its Tuesday an y'all know where to get the tacos. Jay & Water st. 11:30 - 2:30 dumbo	1459862832	717342829031387137	f	kimchitruck
RT @mikemartinez72: @DelilahSDawson Also, chicken tacos from @KimchiTruck in NYC are the best.	1459862048	717339541087117312	f	kimchitruck
RT @_LisaRodgers: Yessssss @KimchiTruck is here today!	1459534756	715966776333496320	f	kimchitruck
Nothing like a Friday taco to brighten up this cloudy day. We're on 46 & 6th til 2:30.	1459528651	715941171781091329	f	kimchitruck
Open for bizzzz til 2:30 Hudson & Charlton St. Come on down!	1459439565	715567517851389952	f	kimchitruck
Lunch is happening on Hudson & Charlton St. 11:30 - 2:30 pm See you later!	1459431422	715533363277381633	f	kimchitruck
Sorry midtown we are closed for a private event. See you Friday!	1459345205	715171742478692352	f	kimchitruck
Lunch is served til 2:30 46 & 6th ave. Bon Appetit!	1458922354	713398179153256448	f	kimchitruck
TGIF! We'll be strutting our stuff in midtown on this beautiful day. 46th & 6th 11:30 - 2:30	1458912568	713357130141736960	f	kimchitruck
Time to eat. Get to Hudson & Charlton St. We're here till 2:30.	1458833527	713025609807605760	f	kimchitruck
Lunch in Soho today. Hudson & Charlton St. 11:30 - 2:30	1458825896	712993602864029696	f	kimchitruck
There's still time to snag lunch. Broadway & 55th til 2:30.	1458753036	712688004662489088	f	kimchitruck
RT @discosthick: I love @KimchiTruck 	1458748398	712668554630459393	f	kimchitruck
Duran Sandwiches NYC\nthe best selection of European open face sandwiches\nCorner of 27thSt & Madison Ave\n212 576 1000 https://t.co/l3Vg7KbP3A	1452295581	685603478069207040	f	langostruck
Bekes, boldog unnepeket es sikerekben gazdag Uj Evet kivanunk\njanuar 6-ig a truck szabadsagon van\n7-en Manhattanben leszunk	1450965261	680023711387353088	f	langostruck
We wish you and your family the very best during the holiday season and a Happy New Year\nwill be back to work on Jan 7th\nsee you in the City	1450965208	680023489101840384	f	langostruck
Hungarian gastronomy success in US: New York loves the Hungarian langos VIDEO  Daily News Hungary https://t.co/ijS8fyZSRG via @DNewsHungary	1450039912	676142513846149121	f	langostruck
hi\nSunday at Meatpacking District\ncorner of 9 Ave & 13th. St\n11-5pm\nmeatpacking NYC Soho eastvillage Citi https://t.co/KY4vSkVeOL	1450017163	676047100048752640	f	langostruck
https://t.co/kLxxzzzHop	1449932323	675691252545953792	f	langostruck
hi Everyone\nLangos Truck in\nMeatpacking District\nwhole day long sat Dec 12\ncorner of Washington St & 13th. St front of \nThe Standard Hotel	1449932313	675691214251958273	f	langostruck
tonight Thursday\n@Columbus Circle\ncorner of Broadway & 60th. St\ntill 7pm	1449170229	672494801741291520	f	langostruck
@aapolloniaa \nhi after the turkey days\nYou deserve Traditional Langos\n\nSunday we are in the Soho\ncorner of Broadway and E Houston St\n11-6pm	1448810224	670984832072159232	f	langostruck
hi\nYou are deserve Traditional Langos\nSunday we are in the Soho\ncorner of Broadway and E Houston St\n11-6pm https://t.co/NqqxpX4wGY	1448809381	670981295741214720	f	langostruck
hi \nNov 22 Sunday\nLangos Truck at Columbus Circle \ncorner of Broadway and 60th. street\n11:30-7pm\n\nenjoy	1448205004	668446352838381568	f	langostruck
hi\nlet's celebrate KeyBar birthday \nFriday night 5pm-11pm\nyou can find Langos Truck at 13th. St bet Ave A &1 Ave.	1448042550	667764970696933376	f	langostruck
happy Sunday \nwe're at 86St and Lexington Ave\n11-6pm	1447604149	665926187215134721	f	langostruck
hisunday oct 25th.\nfront of Apple Store\n67th. st. Broadway\n11-7pm\ncome to get the Mother of All Burgers\nmarathon https://t.co/rfA2MqRVTX	1445781349	658280807115657216	f	langostruck
hi Langos Truck will be at Blkmarket Event\n11pm-5am\ncome to enjoy the unique, exceptional event  \nbrooklyn 23 Meadow https://t.co/rWdW5LJJOd	1445614103	657579327903682560	f	langostruck
Hi\nyou can find us in Williamsburg\nSaturday\nfrom 10-4pm\nBrooklyn EXPO Center\n72 Noble St\nNY 11222 http://t.co/kjEiVUVupJ	1445039054	655167395540127744	f	langostruck
hi \nSaturday and Sunday \nat\n358 N. Broadway Mall\nHicksville ,Ny 11801\n\nwe are serving \n11:45-5pm\n\nthank you http://t.co/5cgo3H7hRz	1444478683	652817029494370304	f	langostruck
Hi  \nLangos Truck going to Hicksville, Long Island Ny\nSat & Sunday 11am-5pm\n358 N.Broadway Mall\nHicksville ,Ny 11801 http://t.co/6bKTIA8qs5	1444435157	652634471116767232	f	langostruck
hi Guys \npickle day at Langos Truck\nwe guarantee you not going to have\nSour Face\ncorner of Orchard &Rivington st http://t.co/HbXPjWXpvy	1443971266	650688769176272896	f	langostruck
Hi Lower East Side\n\nPickle Day is ON for this Sunday, October 4th\n12-5pm\nOrchard st \nbet(Delancey Rivington)\nenjoy http://t.co/Yl2hsWg5bi	1443962039	650650068962418688	f	langostruck
Rollin' in the beef | Burnt Ends Brisket makes for a  https://t.co/Zt0RK60oQ7	1459374643	715295214613708805	f	mexicue
RT @NomInNY: @mexicue never disappoints. Your opinion is wrong if you think otherwise mexicue blackenedfish... https://t.co/RDyoBHFZgu	1459291007	714944420861386754	f	mexicue
Nachos are always the move  https://t.co/9OrfCJTIKp	1458767898	712750341293547520	f	mexicue
Once, twice, three times a taco. And I love you TreatYoSelf https://t.co/Bc0WciUVqr	1458662720	712309192883834880	f	mexicue
Chilly &lt; Chili\n\nBurnt Ends Chili Bowl (& a slider bc Monday) https://t.co/PLIvloDcyd	1458576763	711948663757676544	f	mexicue
Slide, slide, slippity slide (r) just forget about the troubles in your 9 to 5 | Sloppy Joe Sliders  https://t.co/OuaEqJLbpP	1458336802	710942194056761344	f	mexicue
Mexican meets Barbecue meets  | Because margs & guac are green TreatYoSelf https://t.co/awmfIR6RY0	1458230183	710495000442871808	f	mexicue
 putaneggonit (or pulled chicken, roasted chicken breast, pulled pork, wild shrooms, Cajun shrimp, blackened fish) https://t.co/d0y8U0fSRj	1458145779	710140984051548160	f	mexicue
Chips in the taco, you saw it right  TreatYoSelf to pulled pork s https://t.co/dRYhQU7Ip6	1458059460	709778936247533569	f	mexicue
We're at peak Mac & Cheese weather TreatYoSelf https://t.co/yCO42IazX7	1457991261	709492891740196869	f	mexicue
Grilled Cornbread with Chipotle Butter = Winning TreatYoSelf https://t.co/kNrK4NblA6	1457736858	708425845149454336	f	mexicue
75 degrees got me like  Spicy Margarita w/House Fireball Tequila + Jalapeno + Chili Syrup + Lime + Habanero Bitters https://t.co/cshuetVKYA	1457650288	708062748190613506	f	mexicue
= today was a good day TreatYoSelf https://t.co/W76P1XBTIJ	1457564239	707701829484859392	f	mexicue
Tacos  nachos  sliders  dranks  TreatYoSelf https://t.co/EgPOIcNNSk	1457477104	707336361473392640	f	mexicue
This is where we leaf you | Kale & Romaine & Arugula & Cabbage & Fresh Herbs in our Chopped Salad https://t.co/855p3QOp29	1457369859	706886543147798530	f	mexicue
Slide(r) into that DM | 4 different sliders options on @hotbreadkitchen buns  TreatYoSelf https://t.co/XASrFj6aOL	1457112590	705807475174481921	f	mexicue
how to season a Mexicue tortilla strip | We grind our own spice blends for maximum awesomeness in every bite https://t.co/vcM4r7MQ89	1456939777	705082646825738245	f	mexicue
Threes on a tues  TreatYoSelf https://t.co/lJwGTOwSuW	1456872747	704801503534518272	f	mexicue
Kale & Brussels to fuel your hustles |  let's do this, Monday https://t.co/oKA9lVUZsh	1456765987	704353718825832449	f	mexicue
Hit me with your best shot(s) | Make this happen - TGIF = TreatYoSelf https://t.co/qiiMtS8W9Y	1456525237	703343941295411200	f	mexicue
RT @SHSassin: It's FalafelFriday @USUN @LebanonUN ,corner of 45th St & 1st Ave. Join @ToumNYC for a vegan LebaneseLunch pumpkin kibbeh...	1460126497	718448718614278144	f	toumnyc
It's FalafelFriday near the @LebanonUN on the corner of 45th St & 1st Ave. Join us for a vegan LebaneseLunch https://t.co/CNnedg5P5y	1460119257	718418354604806144	f	toumnyc
We're off the road today. Join us at the @USUN tomorrow.	1460030601	718046504146059264	f	toumnyc
Hello MidtownWest! Join us on 46th btwn 5th & 6th for a LebaneseLunch!	1459949131	717704791284166657	f	toumnyc
RT @SHSassin: @ToumNYC is on 52nd btwn 6&7th Ave swing by. LebaneseLunch shawarma kafta makanek  vegan glutenfree falafel https://t....	1459860689	717333838482051072	f	toumnyc
We're on 52nd btwn 6th & 7th today. Join us for a LebaneseLunch!	1459860685	717333822254292992	f	toumnyc
The Toum family is mourning the loss of the matriarch of our family. Our truck will not be out for a couple of days.	1459768612	716947641536540672	f	toumnyc
Truck is off the road today. Have a great weekend and we'll see you on Monday!	1459514364	715881247218798593	f	toumnyc
@monsieur66djw wish we could  At least you know where to eat when you're back in NY 	1459510703	715865891339157504	f	toumnyc
We're getting ready for you @DumboNYC ! Join us on Jay & Water St for a LebaneseLunch hummus vegan glutenfree https://t.co/3Yj4l9PfUa	1459427998	715519002202750976	f	toumnyc
@monsieur66djw that's what we love to hear! 	1459427884	715518524605730816	f	toumnyc
RT @monsieur66djw: My stomach is happy. I just had awesome Lebanese food from @ToumNYC Food truck. toum makanek	1459427867	715518451348082688	f	toumnyc
RT @SHSassin: Everyone in NYC needs to taste these glutenfree platters beef_kabab shawarma kafta makanek falafel as well @ToumNYC 46...	1459348213	715184357808451584	f	toumnyc
Wednesday's in MidtownWest are the yummiest! Join us on 46th btwn 5th & 6th for a shawarma sandwich like no other! https://t.co/zBmTpXuq5x	1459341183	715154872077848576	f	toumnyc
Hello MidtownEast! Join us on 47th btwn Park & Lexington for a yummy LebaneseLunch! shawarma https://t.co/qJgkUAOdm5	1459259436	714812000950464513	f	toumnyc
RT @SHSassin: It's Tuesday MidtownEast Vegan glutenfree Platter & Moujadara on special @ToumNYC 47th btwn park & Lexington https://t.co...	1459259303	714811443351330817	f	toumnyc
No plans tonight? Join us at the @RoyalPalmsClub in Brooklyn until 11pm!	1459210617	714607239177306112	f	toumnyc
RT @dumbolot: Today at Dumbo we have @ToumNYC ,@bigdsgrub ,and @SweetChiliNYC !	1459178417	714472184920600580	f	toumnyc
Didn't get enough meat yesterday? Join us in @DumboNYC on Jay & Water St for a beef kabab platter! lebaneselunch https://t.co/wO4u4Utebv	1459174050	714453866541146112	f	toumnyc
Truck is off the road today for GoodFriday. See you on Monday.	1458917486	713377761382023169	f	toumnyc
RT @billybragg: Some things are more important than a rock show and this LGBT fight is one of them Why we call him The Boss. https://t.co...	1460169353	718628469291270146	f	dubpies
Stoked to announce we're vending @nychotsauceexpo April 23,24 https://t.co/OpuPZrykPE See you there! https://t.co/sgTq3lD2Vk	1460169306	718628275195682817	f	dubpies
Stoked to announce we're vending @nychotsauceexpo April 23,24 https://t.co/OpuPZrykPE See you there! https://t.co/Et2cymDDhN	1460153107	718560330553679872	f	dubpies
@jeffdegeorgia hmmmm....  email us and we'll sort something out, probably need you to mail it to us. Cheers  info (at) dubpies (dot) com	1460149352	718544578450731008	f	dubpies
Very excited to announce we're going to be one of the food vendors at the upcoming @nychotsauceexpo April 23,24 https://t.co/u0oVC8KDA4	1460146688	718533407379218432	f	dubpies
RT @gabrielgironda:  PEACE AMONG WORLDS, @DUBPIES  https://t.co/uBFVZzYh9N	1460087982	718287176111362049	f	dubpies
FREE SHIPPING!  * ANZAC Day  * April discount * Pie Subscription - https://t.co/fvCnBx8kmE	1460056754	718156197912817664	f	dubpies
Glad you enjoyed them.  And thanks for feedback!  Bit too peppery that one,  was it?  https://t.co/wPrrCUwtYe	1459995370	717898732075876353	f	dubpies
Not at all,  we can totally imagine @rogbennett jumping out of a birthday cake!  https://t.co/ES5YU4WJcd	1459995302	717898448742309888	f	dubpies
Right you are, see it now! ;-) https://t.co/A33jDdX5r5	1459995219	717898097767145472	f	dubpies
Oh hell yes, but where are the @MenInBlazers? https://t.co/sOPNWo17KQ	1459994466	717894940349566976	f	dubpies
.@waltznkangaroo welcome to the party & good luck. Certainly approve of your choice of logo color, black/white superior to canary yellow ;-)	1459994373	717894549230788609	f	dubpies
RT @jimdella: Sausage rolls with mushy peas! A @dubpies doppleganger at PS10 International Pot Luck on 7th Avenue in Brooklyn https://t.c...	1459716042	716727144966144000	f	dubpies
Can you tell how chuffed the boss is with his new @dubstuy t-shirt? GreatTshirtSwap2016 represent https://t.co/VMnBr8JxLm	1459539591	715987056116244480	f	dubpies
Something sublime. Death and Weirdness in the Surfing Zone https://t.co/zC2Q36yKHl cc @FlyingNun	1459400001	715401574189633540	f	dubpies
Yes & @cuppacoffeeMA have our pies RT @chipgoines: @dubpies @TayenKim wait, you can ship to boston?! my match weekends just got 100% better!	1459269660	714854885179662336	f	dubpies
RT @nzben: The two new t-shirts that spurred the cull. /cc @ggnz https://t.co/wHMtSTPgCO https://t.co/bMqrg5c9vD	1459221857	714654385847013376	f	dubpies
@TayenKim looking forward to it!	1459206486	714589913224708096	f	dubpies
@TerriLeighTV indeed, we can ship to Miami, no worries at all! ;-)  @DanteFlorence @kylemartino	1459199930	714562415610961921	f	dubpies
We weren't USDA approved back then, we are now,  that's why we're able to ship our pies!  https://t.co/DXzwa5AStn	1459199878	714562196500529154	f	dubpies
Yeah it's Friday, we are at Broadway between 55st and 56st @Foodtruckgirl7 @Sexyfoodtrucks @DeliNDogzTruck @carlssteaks @souvlakitruck	1460129719	718462233546723328	f	chefsamirtruck
We are at 47st between park av and Lexington av!!@Foodtruckgirl7 @Sexyfoodtrucks @drinkpnt	1460042228	718095268122664960	f	chefsamirtruck
Don't want to wait in line, make your order via https://t.co/eGAvHqbxA4 and come pick up	1459957859	717741402260635648	f	chefsamirtruck
We are at the corner of 52st and park av!!@Foodtruckgirl7 @Sexyfoodtrucks	1459956669	717736408593641472	f	chefsamirtruck
We are at 36st and Broadway! !@Foodtruckgirl7 @Sexyfoodtrucks	1459870956	717376902638473217	f	chefsamirtruck
We are at 47st between park av and Lexington av! @DiSOSNYC @sexyyf	1459438926	715564836143370240	f	chefsamirtruck
@Foodtruckgirl7 @Sexyfoodtrucks @DiSOSNYC	1459438762	715564148621516801	f	chefsamirtruck
We are at 47 st  between park av and Lexington av!@Sexyfoodtrucks @Foodtruckgirl7	1459438711	715563933793390593	f	chefsamirtruck
We are at the corner of 52st and park av!@Sexyfoodtrucks	1459352867	715203878715789312	f	chefsamirtruck
We are at the corner of 36st and Broadway! !@Foodtruckgirl7 @Sexyfoodtrucks	1459270923	714860181058928640	f	chefsamirtruck
We are on Broadway between 55st and 56st !!the original trucks\n@Foodtruckgirl7 @carlssteaks @souvlakitruck @Sexyfoodtrucks	1458920370	713389858102837248	f	chefsamirtruck
Happy Easter from chef Samir truck! !	1458920108	713388755609075713	f	chefsamirtruck
We are at 47st between park av and Lexington av!!@Foodtruckgirl7 @Sexyfoodtrucks	1458835530	713034011489206272	f	chefsamirtruck
We are at the corner of 52st and park av!	1458749156	712671733455712256	f	chefsamirtruck
We are at the corner of 36st and Broadway! @Foodtruckgirl7 @Sexyfoodtrucks	1458661794	712305310778654720	f	chefsamirtruck
We are on Broadway between 55st and 56st!@Sexyfoodtrucks @Foodtruckgirl7	1458316978	710859045276557314	f	chefsamirtruck
We are at 47st between park av and Lexington av	1458230736	710497321625190400	f	chefsamirtruck
We are at the corner of 52st and park av!!@Foodtruckgirl7 @Sexyfoodtrucks	1458143184	710130100356947968	f	chefsamirtruck
We are at the corner of 36 st and Broadway! ! @Sexyfoodtrucks @Foodtruckgirl7	1458056910	709768242835890176	f	chefsamirtruck
We are at 47st between park av and Lexington @Sexyfoodtrucks @Foodtruckgirl7	1457629890	707977188885315584	f	chefsamirtruck
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
RT @GovIslandFood: Happy Father's Day. Come bring dad to @Gov_Island for some Jazz and great food.@SweetChiliNYC,@MayhemAndStout,@MrNiceGuy...	1402846006	478196925637095424	f	getstuffednow
RT @GovIslandFood: Who's ready for some @jazzagenyc and some great food? @SweetChiliNYC,@ElPasoTruck,@DiSOSNYC,@MrNiceGuyTruck,@Getstuffedn...	1402754477	477813027257847808	f	getstuffednow
RT @nicole_rae: We enjoyed our lunch from @Getstuffednow on @Gov_Island @GovIslandFood vegan nyc governorsisland FigmentNYC http://t.co...	1402431493	476458332199612416	f	getstuffednow
We sold out by 3pm yday, don't be disappointed 2day-get 2 us as soon as u land on the island! @GovIslandFood @Gov_Island @livefastgroup	1402238487	475648807070609408	f	getstuffednow
Todays kid special @Gov_Island pop up stand - decadent triple chocolate cookies ! weekend is 4 familytime !	1402151133	475282419512532992	f	getstuffednow
Catch us at Governors Island every weekend , The Ultimate Guide to Outdoor Dining Adventures http://t.co/b80ALbJ62h via @EaterNY	1401716842	473460870555516929	f	getstuffednow
RT @GovIslandFood: Come on over to @Gov_Island tomorrow for sunshine and great food. @SweetChiliNYC, @MayhemAndStout, @carlssteaks, @Getstu...	1401539927	472718833275650049	f	getstuffednow
This was the line for the last ferry off @Gov_Island yesterday! Come early 2day, we r slinging awesome kobe burgers! http://t.co/TXNni8IRN2	1401105843	470898153097416704	f	getstuffednow
RT @GovIslandFood: Almost 100 followers!! Our 100th follower(must be new)gets a free lunch from any one of our vendors at Gov. Island. Rede...	1401105728	470897670782210048	f	getstuffednow
@czarineyee we will be back in Flatiron this Friday!	1459859962	717330790791659520	f	cachapasbk
@LuLuHeymann We are now open for lunch during the week in manhattan. Follow us on instagram for our updated location. Hope to see you soon!	1450891806	679715617159667713	f	cachapasbk
@czarineyee were on 47th and park today!!	1450114780	676456535212613633	f	cachapasbk
A Patacon is a sandwich where the bun is replaced by crispy green plaintain disc, which is then... https://t.co/H5G6YvpcKR	1449158396	672445169636139012	f	cachapasbk
47th and park today!! Till 3 PM	1449073302	672088260894711808	f	cachapasbk
RT @guycalledJoe: Patacon fix successful. Thanks @cachapasbk!	1448906706	671389503223939072	f	cachapasbk
@susanshek unfortunately not during winter. We'll be back 4 summer! We do lunch in the city M - F (dont forget about our Brick and Mortar)	1448904000	671378155282763776	f	cachapasbk
@guycalledJoe were at 20th and 5th!	1448903833	671377456989868032	f	cachapasbk
@bklynbagelbabe Si! Empezando la semana que viene 	1448497473	669673056365842432	f	cachapasbk
@tinyforeigner were in flatiron today! 20th and 5th	1448381619	669187129810001921	f	cachapasbk
Eggy Arepa for breakfast! Arepas are super easy to make - all you need is Harina PAN, water & salt.... https://t.co/wcuON7xpQf	1448381556	669186868467146752	f	cachapasbk
Try our delicious yoyos today! 47th & Park, if you haven't done so already come say hi!... https://t.co/lzqOKdU5Hh	1447869335	667038456225374208	f	cachapasbk
RT @Chris_Quartly: Cuban cachapa from @cachapasbk, so good! Needed a good base for later. @ New York, New York https://t.co/ncyT379W0H	1447448459	665273172716101633	f	cachapasbk
The best chef of them all, our mother. We keep it in the family and make all our goodies from... https://t.co/KOrWcsRRRs	1446858163	662797294622924800	f	cachapasbk
@keithobrien we'll be here till 6 am!	1446856900	662791996206161920	f	cachapasbk
we try, @iamdj8pm. Thanks for the love!	1446749814	662342844447891456	f	cachapasbk
@RachelEmilyNYC we will be in flatiron every Monday!	1446654135	661941536993755136	f	cachapasbk
@mrw we plan on doing flatiron weekly! Stay posted here/instagram to know where we'll be. Fridays/saturdays we are in wiliamsburg 6pm-6am	1445901983	658786783384195073	f	cachapasbk
@JaredBanyard 20th and 5th until 3 pm!	1445878009	658686229559517184	f	cachapasbk
@JaredBanyard we'll be there next week. We promise! If you cant wait till then we'll be ond bedford and north 6 tonight!	1445609792	657561247429337088	f	cachapasbk
Parking at 50th and 6th Ave today till 2:30 Come bao down with us. Preorder 646-358-2258 midtown Taiwanesefood @midtownlunch	1460124201	718439090320973824	f	kayanyc28
Parking at Varick and Charlton street today. Pre-order is available at (646) 358-2258 soho lunchtime	1460038019	718077613969948673	f	kayanyc28
It's Wednesday again at Park and Greenwich today to serve tasty steamed buns. Pre-order is available at (646) 358-2258	1459951852	717716204585152513	f	kayanyc28
Parking at Front and Adams. Ready to serve at 11:30. Stop by for some baos pre order(646) 358-2258 @DUMBOFoodTrucks	1459864597	717350232468664320	f	kayanyc28
Won't be out today. Be back to Dumbo tomorrow @DUMBOFoodTrucks	1459776314	716979946191720448	f	kayanyc28
At Front and Adams today till 2:30. Preorder (646) 358-2258 rain tgif @DUMBOFoodTrucks	1459515923	715887786440699904	f	kayanyc28
Second round at Varick and Charlton. Ready to serve at 11:30. Pre-order is available at 929-421-9987  soho lunchtime	1459435823	715551823353004032	f	kayanyc28
It's Wednesday again. We are at Park and Greenwich today to serve you all some tasty steamed buns. Pre-order is available at (646) 358-2258	1459347408	715180982429749248	f	kayanyc28
Bao at 50th and 6th today. Pre-order (646) 358-2258	1459260229	714815327503323136	f	kayanyc28
Down at Front and Adams today till 2:30 Pre order (646) 358-2258 @DUMBOFoodTrucks https://t.co/py7RjG7FOF	1459175370	714459404213600258	f	kayanyc28
RT @jennas_sandals: . @KayaNYC28 on twitter! Luv you! xo	1458939393	713469645399965696	f	kayanyc28
parking 50th and 6th Ave again today till 2:30 Come bao down with us. Preorder 646-358-2258 midtown Taiwanesefood	1458915065	713367606716137475	f	kayanyc28
Nice weather out today for some gua baos. Parking at Varick and Charlton street. Pre-order is available at (646) 358-2258 soho lunchtime	1458829562	713008979522285569	f	kayanyc28
Wednesday again at Greenwich and Park Pl. Start serving at 11:30. Pre-order is available at 646-358-2258	1458741399	712639197664976896	f	kayanyc28
Parking at 50th and 6th Ave today till 2:30. Bao with us! Preorder 646-358-2258 midtown @midtownlunch https://t.co/WEuudXik6k	1458655125	712277339686707200	f	kayanyc28
Braving up the cold again at Front and Adams. Serve at 11:30-2:30 @DUMBOFoodTrucks	1458570041	711920470443085824	f	kayanyc28
Bao-day again midtown at 50th and 6th. Preorder always available at 646-358-2258 TGIFriday	1458311198	710834803931742208	f	kayanyc28
It's throwbao Thursday at Varick and Charlton today. Ready at 11:30. Pre order at 646-358-2258	1458223555	710467200738529280	f	kayanyc28
RT @_liezlann: Best lunch ever! Peking duck & pork belly bao w/ crispy popcorn chicken! Thanks @KayaNYC28 !! delicious baos https://t.co/...	1458153926	710175157147586562	f	kayanyc28
It's Wednesday again at Park and Greenwich today to serve tasty steamed buns. Pre-order is available at (646) 358-2258	1458137153	710104804912177153	f	kayanyc28
We'll make you feel better. https://t.co/NOFv6uRH0s	1456686019	704018309314904064	f	brooklynpopcorn
Where do you eat yours? https://t.co/AP3r9irS11	1456599606	703655867971989504	f	brooklynpopcorn
Did you know you can hire us for your next event? Impress your guests- https://t.co/RL42K5kOYC https://t.co/d0dPoDKvvR	1456513269	703293742443323394	f	brooklynpopcorn
Get it while it's delicious! https://t.co/P7yhd8RpEv	1456426867	702931345396404224	f	brooklynpopcorn
Who's in the mood for Popcorn? https://t.co/fGk1farsaL	1456340482	702569019551961089	f	brooklynpopcorn
We're popped and waiting for you... https://t.co/OsTm3qMKfH	1456254069	702206577126805506	f	brooklynpopcorn
Honk if you see us! https://t.co/oZr3rGw44M	1456167635	701844048257146880	f	brooklynpopcorn
The perfect snack for a city that's on the go. https://t.co/2rhlIlZFzz	1456081211	701481560751607809	f	brooklynpopcorn
Get a bag of each, you won't be sorry. https://t.co/JohGmpqm4m	1455994832	701119258852511745	f	brooklynpopcorn
We're ready for datenight: https://t.co/yv94jLAVVA	1455908414	700756798064762881	f	brooklynpopcorn
It's okay, we want you to ask for samples. https://t.co/txPcL4XdK3	1455822077	700394672292818948	f	brooklynpopcorn
We're filled up & waiting for you! https://t.co/NkzWM2wXvJ	1455735626	700032071469830144	f	brooklynpopcorn
It's ok, get a little closer... https://t.co/exzyP10OQq	1455649223	699669670740299776	f	brooklynpopcorn
RT @bennzz61: @BrooklynPopcorn Mid-town, near Columbus Circle.	1455643889	699647298649903104	f	brooklynpopcorn
Where would you like to see our truck? https://t.co/u7Itbw0HTL	1455562818	699307263559868416	f	brooklynpopcorn
Say it with popcorn. HappyValentinesDay https://t.co/x9JXjkBl8B	1455476415	698944863270780928	f	brooklynpopcorn
What's your favorite popcorn memory? https://t.co/ymPieWjz32	1455390043	698582591851642884	f	brooklynpopcorn
Want to get to know Brooklyn? Try our Brooklyn mix: https://t.co/OXml6czKL5	1455303609	698220062382100481	f	brooklynpopcorn
You're never too old for popcorn. https://t.co/DNH2wfuzO3	1455217214	697857695790080000	f	brooklynpopcorn
Step right up & pick your flavor! https://t.co/zK0Chbevze	1455130839	697495410840043520	f	brooklynpopcorn
@ChefJayBKHarlem on a business trip in Mass be back soon	1446658197	661958572838907904	f	mamasheros
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
RT @Jessicist: @ConeyShack really enjoyed the tacos!  Please come back to this location, my office is nearby and taco crazy (on warmer days...	1460160366	718590776700243969	f	coneyshack
@ashopaholicw no sorry we are on 48th and 6th ave on Thursday only, Friday was a temporary solution ,will be back next week!!	1460147484	718536745109819392	f	coneyshack
55th and Broadway. Bringing south East Asian tacos here for the first time. Open at 11	1460127089	718451202548240384	f	coneyshack
Thursday Midtown 48th & 6ave we didn't forget about you, will be nice and dry next to the underpath, ready at 11 https://t.co/pjPl6FqPSI	1460029126	718040315769262081	f	coneyshack
47th st. Btw park Ave. open at 11	1459953309	717722316218740736	f	coneyshack
RT @justyniak: tacotuesday with @coneyshack  food trumpmushroom calamari fish lunch fidi nyc https://t.co/7BCEicK7rz	1459895744	717480869326405633	f	coneyshack
Sun shine on TacoTuesday we at the the fidistrct old slip & water st ready at 11am, Coney Island W8th ready at 12pm to 7:30	1459850754	717292167421632512	f	coneyshack
Due to rain out conditions coneyshack Truck and coney island w8 locations will not be in operation today Monday .	1459764005	716928319015485444	f	coneyshack
We like to start your spring day with a double come by 48th st between 6 & 7 ave 11:30 -2:30, Coneyisland W8 12-7:30 https://t.co/EzSPuMfpmG	1459426095	715511022392623105	f	coneyshack
RT @GG_Cakes_NY: @ConeyShack see you at 1130! I'm coming for those yummy tacos bestever ricebowl https://t.co/LLrc7qOcab	1459352893	715203990682746880	f	coneyshack
47th and park today. Open at 11.45	1459348251	715184519997992961	f	coneyshack
RT @SadeDizzle: Those @ConeyShack Crunchy Fish Tacos will make you sing, I swear.	1459306208	715008175997587457	f	coneyshack
Financial District we are here for Taco Tuesday will be here from 11:30 -230, Coneyisland W8th st 12pm to 7:30pm	1459259094	714810567760982017	f	coneyshack
Due to rainy conditions ,coneyshacktruck will not be in operations today !	1459173133	714450020246896640	f	coneyshack
Weekends just around the corner, stop by the coneyshacktruck  Midtown 48th between 6 & 7th ave 11:30 - 2:30 & let us guide you there!	1458821764	712976273547526144	f	coneyshack
RT @KillaCass_: @Carnegro @ConeyShack thank you!	1458821412	712974795114029056	f	coneyshack
RT @nikkijason: @ConeyShack please feed me! Come back to 47th & 6th dreaming of fish tacos!!!heeelllppp	1458821400	712974746715967489	f	coneyshack
47th and park. Open at 11.30	1458742343	712643156223922176	f	coneyshack
Financial district we in thr building, Old slip & water st. 11:30 - 2:30 get your taco tuesday rite!	1458652616	712266814215036928	f	coneyshack
48th street btw 6  open now till the last	1458575006	711941294650728448	f	coneyshack
RT to VoiceSaveJeffery https://t.co/xOLC58K6Vw	1449626029	674406565663916032	f	mtblls
RT to VoiceSaveEvan https://t.co/xOLC58K6Vw	1448416654	669334078521495552	f	mtblls
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
@ThatGOODRahman one of those days. I know.	1459223122	714659691788427264	f	milktrucknyc
RT @stacylondon: I will not be defeated.  I am not throwing away my (or @ltmphd's) shot at the perfect closet/ wardrobe. https://t.co/zdgvg...	1458647541	712245529351163904	f	milktrucknyc
RT @stacylondon: Happy InternationalWomensDay!  To all ladies, everywhere. Keep smashing glass ceilings. Pave the road for the girls who c...	1457587520	707799476703006720	f	milktrucknyc
PS 234 Teacher Appreciation Day. (can you spot the MT MAC?). megaappreciation https://t.co/M5AlUjinPC	1457028558	705455019982778370	f	milktrucknyc
twenty kids having well earned dinner after serving @ Sunday Suppers at St. Paul's Chapel. https://t.co/xnkgfWonyj	1456110535	701604554807373824	f	milktrucknyc
@501UNION no sorry.	1455989280	701095974463209473	f	milktrucknyc
we're open and serving some fancy grilled cheeses & custom mac&cheese y'all. @bkflea @smorgasburg.	1455985610	701080581577293826	f	milktrucknyc
RT @bkflea: Were open today w/ @smorgasburg. Plus, the *mini* Record Fair is happening all weekend. Doors open at 10am sharp! https://t.co...	1455985419	701079780255465472	f	milktrucknyc
thank you JDJK!! https://t.co/WCzAnLkdMz	1455897297	700710167722201088	f	milktrucknyc
RT @ThisIsStory: .@FarmToPeople is engaging curious palettes w/ its small-batch food finds  https://t.co/N7mU9y7XXh goodtoknow https://t.c...	1455598979	699458934537646081	f	milktrucknyc
happy vday sweeties. come in for some grilled cheese love today @bkflea & @smorgasburg Industry City.	1455462025	698884507433185280	f	milktrucknyc
@claudiacukrov wall near william	1455423382	698722423433248768	f	milktrucknyc
Morning!  We are @bkflea & @smorgasburg in Industry City serving the antidote to wind chill. c'mon  NY'rs, venture out.  we've had worse!	1455378839	698535598005555200	f	milktrucknyc
Bessie is currently off the road for some much needed TLC.  we will have an update soon when she will be back.  thanks and stay warm!	1455301892	698212857473822720	f	milktrucknyc
@claudiacukrov sorry, we are off the road today.	1455301804	698212488635138048	f	milktrucknyc
@OpeOluOla King isn't one of our locations. However, our sandwich menu is @houstonhallnyc on houston btn 6th/Varick.	1454531868	694983145716895746	f	milktrucknyc
RT @LoganLevkoff: @mylove4three thank you....and @MediaStyleNYC who put together most of what you saw last night:)	1454519626	694931796400693248	f	milktrucknyc
@claudiacukrov hi. Fridays.	1454519602	694931696140095489	f	milktrucknyc
@claudiacukrov we are there Fridays	1454369801	694303385940541440	f	milktrucknyc
RT @stacylondon: T-minus 16 minutes to lovelustrun, peeps. You now have exactly 15 minutes and 45 seconds to get snacks and get comfy!	1454127561	693287357085253634	f	milktrucknyc
RT @Chefsamirtruck: We are on Broadway between 55st and 56st !!the original trucks\n@Foodtruckgirl7 @carlssteaks @souvlakitruck @Sexyfoodtru...	1458928486	713423898721828864	f	souvlakitruck
@CKlimek We do not sell gyro.  Only souvlaki.	1458042510	709707845709766656	f	souvlakitruck
Authentic Greek lamb chops at SouvlakiGR\n\n116 Stanton St./162 W. 56th St.\n\nfood foodie delicious Greekfood https://t.co/6qOmjE6JI2	1458038943	709692882387603456	f	souvlakitruck
Clean Monday (Greek:  ) is the first day of Great Lent SouvlakiGR\nhttps://t.co/KFFsSKMPPu	1457955754	709343963384307712	f	souvlakitruck
Chicken and sausage souvlaki pita close-up\n\nSouvlakiGR Greekfood food https://t.co/eisAipVt3F	1457871404	708990172919177216	f	souvlakitruck
@HorstDouwe we are so pleased you enjoyed it! 	1457796268	708675032633970688	f	souvlakitruck
Our newest location is in its sixth month, 162 West 56th Street.\n\nSouvlakiGR midtown Greekfood nyceats https://t.co/tDS7Crgbtu	1457784682	708626434789679105	f	souvlakitruck
Authentic, fresh, always delicious Greekfood \n\n116 Stanton St./162 West 56th St.\n\nSouvlakiGR  food nyceats https://t.co/z4lhSlyKeh	1457697093	708259059728785408	f	souvlakitruck
RT @foodwithbyte: @souvlakitruck The feta you use on the Greek fries is crazy good! https://t.co/MAahb6LRHa	1457620380	707937301536612352	f	souvlakitruck
Greek fries, hand cut and made-to-order at SouvlakiGR\n\n116 Stanton St./162 W. 56th St.\n\nGreekfood nyceats https://t.co/oDVSVMWEdt	1457610359	707895271812939776	f	souvlakitruck
RT @foodwithbyte: Today is definitely a food truck day. @DiSOSNYC & @souvlakitruck I'm coming!	1457529844	707557568617570304	f	souvlakitruck
Our inspiration, Mykonos.\n\n116 Stanton St./162 W. 56th St.\n\nSouvlakiGR Greece nyceats https://t.co/HR3PG6aYvW	1457524281	707534235175882752	f	souvlakitruck
SouvlakiGR Truck at 46th Street and 6th Avenue today. Stop by for ALittleTasteofMykonos  https://t.co/Cqb1QJldBU	1457436405	707165654076489729	f	souvlakitruck
Chicken souvlaki pita close-up.\n\n116 Stanton St./162 West 56th St.\n\nSouvlakiGR Greekfood food https://t.co/m1F8gJD7YN	1457350838	706806762826022913	f	souvlakitruck
SouvlakiGR's periptero sells Greek treats\n\n116 Stanton St./162 W. 56th St.\n\nLittleTasteofMykonos nyc https://t.co/txGAzSP5OV	1457271022	706471987690999809	f	souvlakitruck
RT @randomfoodtruck: Lunch party! @carlssteaks @CarpeDonutNYC @souvlakitruck @gcnyc1 @PolishCuisine @Chefsamirtruck @DeliNDogzTruck	1457110684	705799481267265536	f	souvlakitruck
A little taste of Mykonos on The Lower East Side, 116 Stanton St.  thanks @thegirlfromcherryblossomstreet https://t.co/CHja7mD8j0	1457092553	705723435092197378	f	souvlakitruck
Join us this tonight for Tsiknopempti - $80 for 2 food & wine by @eklektikonwines 116 Stanton St./162 W 56th St. https://t.co/RAJhPluKTE	1457006074	705360715822010368	f	souvlakitruck
Join us this tomorrow for Tsiknopempti, celebrated before the start of Lent at both our locations. $80/2people https://t.co/4HzAloz82C	1456919789	704998810536251392	f	souvlakitruck
The Greek tradition of Marti (March) bracelets. https://t.co/UOuSwSnE1c	1456883189	704845301140557824	f	souvlakitruck
RT @Amul_Coop: Amul Topical: Tribute to Pathankot bravehearts. PathankotAttack PathanKotAirBaseAttack https://t.co/8eS3tVRJbN	1452004266	684381612813991936	f	mausamnyc
LIVE on Periscope: nye at mausam indian cuisine with music sunita happy nee year 2016 https://t.co/pEyxmuR7Ry	1451618164	682762184137531392	f	mausamnyc
LIVE on Periscope: nye 2016 at mausam indian cuisine with music sunita https://t.co/WbC9LjyQVo	1451617771	682760535696404480	f	mausamnyc
LIVE on Periscope: nye at mausam indian cuisine with music sunita https://t.co/OJ4LM2iSxN	1451616324	682754467368939520	f	mausamnyc
LIVE on Periscope: nye at mausam indian cuisine https://t.co/f33F1hlOSu	1451602389	682696017075154944	f	mausamnyc
LIVE on Periscope: nye at mausamindiancusine with music sunita https://t.co/i2N7cpmwM2	1451602242	682695401087066113	f	mausamnyc
https://t.co/JvwjEl2nHM	1450985872	680110158169665536	f	mausamnyc
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
@VisitNewOrleans f	1460164360	718607530319077376	f	etravaganza
Happy Friday!\nJoin us at Our usual Location.\nEarthy Meals off the grill prepping to you.	1460127300	718452086808178688	f	etravaganza
Morning!!\nDelicious fresh cooking Breakfast awaits.\nmicrowaves are not allowed in here	1459945092	717687849680769024	f	etravaganza
super taco Tuesday!!	1459867213	717361204298194944	f	etravaganza
Happy Monday..!!\nWhat are you Craving for??\nBreakfast or Lunch?\nHow About;Breakfast for Lunch!\nJoin us. NE 52nd and Park is the Place.	1459780967	716999461088702464	f	etravaganza
Happy FRI -YAY!!\n  Don't worry..! A few drops here and there.\nDon't miss out your favorite breakfast.	1459512439	715873171883339776	f	etravaganza
Back to Reality..!!\nPrepping a delicious Lunch to Recharge those Batteries.	1459176090	714462422329925632	f	etravaganza
**Happy Easter**	1459100675	714146111645229056	f	etravaganza
Happy synthetic Friday. Prepping an  earthy delicious Lunch on for you.\nDo you know the place..??Northeast 52nd and Park.	1458833590	713025872371036162	f	etravaganza
Have you tried Our Mexican Grilled Cheese..?\nJoin us for fresh a cooking menu lunch options.\nWe are @ 52  & park.	1458747505	712664809020461057	f	etravaganza
Rise& shine...Breakfast Ready!	1458736299	712617807951880192	f	etravaganza
Huevos a la Mexicana tacos.\nsuper Taco Tuesday.	1458661964	712306023080583168	f	etravaganza
Delicious Mushrooms quesadilla,\nChoice of Mexican Rice,tortilla chips or green salad on the Side.	1458574475	711939065696878592	f	etravaganza
Back to Reality Folks!\nPrepping an earthy Lunch to recharge those Batteries.	1458572068	711928970959310848	f	etravaganza
BLT Avocado on seven Grain Bread.\nHealthy Salad Bowls.\nDelicious Burritos and More. https://t.co/bJsDT1Mo2M	1458227439	710483492098940928	f	etravaganza
https://t.co/TOeqEz90NK	1458221147	710457100477005824	f	etravaganza
Good morning!\nHearty  breakfast cooking on your way to work.\ncall us for express pick up at 917-657-0987.\nWe are at N.E 52nd. Park Avenue.	1458132201	710084036056711169	f	etravaganza
Good morning!\njoin us for a earthy and delicious breakfast.	1458045893	709722035832954880	f	etravaganza
Sorry.\nDidn't make to the streets \nSee you tomorrow.	1457958206	709354247255621632	f	etravaganza
Happy pre social Friday!!delicious breakfast is served.	1457617491	707925186818019328	f	etravaganza
Weather does not look good for tomorrow, Saturday. Unfortunately we will not be open.\n\nWe will reopen Sunday for... https://t.co/eDghtyF9Od	1460161783	718596719353704448	f	kettlecornnyc
RT @MacKevinNYC: Got my fix for the weekend! @KettleCornNYC NYC https://t.co/UA89ruwFhc	1460158695	718583768576090113	f	kettlecornnyc
Good Evening NYC\nWe Relocated To\n96th and Lexington \nUntil 7:30pm\nkettlecorn nyc \nfreesamples popcorn https://t.co/eB5gB56n8V	1460147545	718536999188242433	f	kettlecornnyc
Happy Friday Midtown \nCome Grab A Hot Fresh Bag \nOf Yummy Kettle Corn\nWe Are Located on\n45th St. Between 5th &... https://t.co/Z92DlvgxSF	1460122738	718432953383170048	f	kettlecornnyc
Due to the weather, we will not be out today. \nSorry for the inconvenience. \nSee You Soon	1460026574	718029613083992064	f	kettlecornnyc
We Relocated To\nWe Are Located At \nColumbus and 97th St. \nUntil 7:30pm \nkettlecorn nyc popcorn \nfreesamples https://t.co/jUfSmSC75v	1459973900	717808681245483008	f	kettlecornnyc
@krysacev Saturday & Sunday 11am -7:30pm	1459873815	717388892241006592	f	kettlecornnyc
Due to the weather, we will not be out today. \nSorry for the inconvenience. \nSee You Soon	1459773810	716969441590960129	f	kettlecornnyc
RT @Beetroot_Blog: Happy Sunday! Hope everyone is having a lovely day https://t.co/hQJLAtCguJ	1459737857	716818645024968704	f	kettlecornnyc
RT @Vic_M_Munoz: My new goal is to try every flavor of @KettleCornNYC	1459715752	716725929553371136	f	kettlecornnyc
Good Morning Queens \nWe Are Located in\nForest Hills Queens \nAustin St. and 71st avenue \nUntil 7:30pm\nkettlecorn... https://t.co/1VkzV2kkML	1459689269	716614854329679877	f	kettlecornnyc
https://t.co/ZwdHpRWokp	1459649700	716448889331716097	f	kettlecornnyc
https://t.co/fLLXfvWLG2	1459649654	716448693621284865	f	kettlecornnyc
https://t.co/tOjvqCog7X	1459649638	716448626944450560	f	kettlecornnyc
@VeronicaPromos see you soon 	1459642706	716419552217853952	f	kettlecornnyc
@VeronicaPromos we will be back tomorrow	1459642578	716419014029926400	f	kettlecornnyc
@VeronicaPromos we're so sorry we left.	1459642548	716418892046934017	f	kettlecornnyc
Good Morning Queens \nWe Are Located in\nForest Hills \nAustin St. and 71st avenue \nUntil 7:30pm\nkettlecorn... https://t.co/k1m9D5bEWA	1459609497	716280265858007040	f	kettlecornnyc
Due to the weather, we will not be out today. \nSorry for the inconvenience. \nSee You Soon	1459513870	715879176079876096	f	kettlecornnyc
RT @JeffUmbe: @KettleCornNYC \nhttps://t.co/nieMk1hca0\nnice!!	1459484721	715756916018978816	f	kettlecornnyc
diparma nyc nycfoodie neapolitan neapolitanpizza pizza neapolitanexpress nongmo o... https://t.co/PBayBDpeix https://t.co/9vECHwLeUE	1460050321	718129215309221892	f	neaexpress
Come n' get it!!  We're serving pizza hot & fresh at 53rd and Park Ave https://t.co/ymVCgUTfuH	1459357316	715222538553593856	f	neaexpress
We will see you guys tonight at 7pm  @madisonsquaregarden @impact_garden @globalfashione... https://t.co/sjHHgbSpu2 https://t.co/uKUC5pExhL	1457368800	706882098980851712	f	neaexpress
RT @LuxeSoul: REBUILD GLOBALLY PRESENTS IMPACT GARDEN  AT MADISON SQUARE GARDEN https://t.co/EkglypED6P	1457368177	706879485333864450	f	neaexpress
@RevSarahNYC 917-518-9367	1457225742	706282071635922944	f	neaexpress
Deliciously organic! \nneaexpress ecofriendly foodtruck cleanenergy bestpizza https://t.co/wroGbImc9m https://t.co/NPxYttQRuw	1457225422	706280730834374659	f	neaexpress
RT @TRONNORITA: MY @NeaExpress PIZZA CAME! yum yum yum you all should check them out :)	1457130865	705884129209012225	f	neaexpress
Hello\norganicpizza neaexpress ecofriendly https://t.co/0MpZsr7aen https://t.co/czNI4NzmK3	1457128175	705872844077539328	f	neaexpress
Pizza will NOT\nCheat on you\nLie to you\nBetray you \nSteal from you \nCall you stupid \nilove... https://t.co/4JQvLIntCH https://t.co/bOYJk76Qvv	1457017960	705410570959323137	f	neaexpress
RT @NYCParks: Help us care for natural areas and street trees in neighborhoods in need. Sign up here: https://t.co/xH3wmzUkKL https://t.co/...	1456943349	705097627390644224	f	neaexpress
We believe everything has to be useful, just like our Eco pizzabox \nsustainable envi... https://t.co/FOZyyBkIYG https://t.co/LMT7mgvnLh	1456940996	705087758038142976	f	neaexpress
@RevSarahNYC maybe;)	1456859579	704746270632574976	f	neaexpress
Love is... https://t.co/CrNczO4q0G	1456852362	704716000659415041	f	neaexpress
7 days a week from 11-9 neaexpress is here for you with organic pizza on rooseveltisla... https://t.co/5fGNsF3NHT https://t.co/ieeppkwOgY	1456757667	704318823390961664	f	neaexpress
RT @Rooseveltisland: Delicious Neapolitan Express Pizza Food Truck at Roosevelt Island today next to Starbucks. Try @NeaExpress out https:/...	1456687447	704024298860716033	f	neaexpress
Beautiful sunday neaexpress https://t.co/QFvRZnJTcK https://t.co/220LRzB8kE	1456676016	703976354052751360	f	neaexpress
@michael_cookies thank you, enjoy it:)	1456619889	703740938477281280	f	neaexpress
Fri(end) Boyfri(end) Girlfri(end) Pi(forever)zza neaexpress https://t.co/1csJOuKx64	1456498844	703233240497311744	f	neaexpress
@_yungfresh718 7 days a week from 11 am to 9 or 10 pm, Main street near the F train 	1456434471	702963239773184001	f	neaexpress
@_yungfresh718 Roosevelt island	1456434189	702962058854338560	f	neaexpress
52st & 6ave..11-2:20..you are invited.	1460122128	718430394207576064	f	polishcuisine
@bsambriski we will definitely be back in sunnyside soon!	1460060778	718173075011956736	f	polishcuisine
Today 55st & Broadway..waiting for you	1460040117	718086417314947072	f	polishcuisine
Ladies & Gentlemen today we park on Water st & Old Slip.  Excellent weather for hot Kielbasa and Pierogi.	1459946301	717692922527936512	f	polishcuisine
Today we are on 47st & Park Ave...lets have nice Kielbasa in this rainy day.  See you.	1459778411	716988739147444224	f	polishcuisine
TGIF..and OTPC is on 47st & Park Ave	1459513751	715878674944409600	f	polishcuisine
Today 55st & Broadway... 11am to 2:30pm	1459431666	715534385274089472	f	polishcuisine
Open & ready to roll on 47th b/w Park & Lexington midtown lunch NYC pierogitime KielbasaTime https://t.co/8iD3COKObI	1459351084	715196400263380993	f	polishcuisine
Open and ready to roll on 47th b/w Park & Lexington pierogitime KielbasaTime midtown lunch New York, New York https://t.co/km6QOwaVXv	1459350937	715195783029637120	f	polishcuisine
47th b/w Park & Lexington today...great day for some Smokin' HOT Grilled Kielbasa & Pierogi midtown east NYC https://t.co/ajF1eahGW4	1459337024	715137428961386496	f	polishcuisine
Old Slip b/w Front & Water - open and ready to roll out some pierogitime downtown NYC traditional PolishTruck https://t.co/cCSy46VXbo	1459264087	714831510185107457	f	polishcuisine
Old Slip b/w Front & Water - open and ready to roll out some @pierogitime downtown traditional lunch NYC -... https://t.co/0Td488sw1J	1459264004	714831161743261696	f	polishcuisine
Old Slip bw front & Water today traditional Tuesday downtown PolishTruck downtown lunch https://t.co/cjVFhNO1nI	1459250717	714775433267572736	f	polishcuisine
Peep our video on a series called PROcess https://t.co/8Fx9c6iK3U	1459348103	715183897881907201	f	korillabbq
There's only a sprinkling on 52nd b/w 6th & 7th - grab those umbrella's and come on over for pierogitime... https://t.co/1vbLrZ6R1P	1459178000	714470434532630530	f	polishcuisine
rain or shine on 52nd bw 6th & 7th today pierogitime VeggieCombo midtown west NYC PolishTruck https://t.co/EnKbK4n2pe	1459166174	714420832760672256	f	polishcuisine
traditional blessing of the Easter Basket Happy Holidays...Wesolych Swiat oraz mokrego smigusadyngusa https://t.co/NVlvNNVJG3	1459018614	713801920553607169	f	polishcuisine
We are off the road today for GoodFriday....wishing you a blessed preparation and celebration for Easter NYC spring	1458908954	713341972602294272	f	polishcuisine
52nd b/w 6th & 7th today - traditional Thursday PolishTruck midtown NYC special HuntersStew + Easter pierogi https://t.co/rvpawlZNUK	1458833021	713023486483148800	f	polishcuisine
Open and ready to roll in midtown NYC on 52nd b/w 6th & 7th - Special HuntersStew + VeggieCombo Easter pierogi https://t.co/i6eWeD5CM1	1458832894	713022954137849856	f	polishcuisine
traditional thursday on 52nd bw 6th & 7th today with HuntersStew special VeggieCombo pierogi midtown nyc https://t.co/mtuAYqoTvL	1458822689	712980152599371776	f	polishcuisine
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
Downtown call ahead then pick up, 	1460128305	718456303421665280	f	luckyimthai
Hey Friday, 47th between park and Lexington AVE, Thai food truck	1460120108	718421920409063425	f	luckyimthai
Downtown at Hanover sq. call ahead then pick up, 	1459954034	717725359131766784	f	luckyimthai
 46th between 5 and 6 AVE  padthai, drunkman noodle, spicy mayo, green mayo, pad see ew, fried rice, fried dumplings	1459953991	717725177140944896	f	luckyimthai
Downtown, Hanover sq and water street,  call please then pick up	1459869735	717371782970236929	f	luckyimthai
Food truck at 47th between park and Lexington AVE,  join us take your lunch here, jot and delicious 	1459864143	717348325071007744	f	luckyimthai
Downtown  call ahead then pick up 929-382-8537 	1459521717	715912088317796353	f	luckyimthai
Happy Friday, 47th between park and Lexington AVE,  see you guys	1459509382	715860352156753921	f	luckyimthai
Downtown Hanover sq, water street, call ahead, then pick up  padthai, drunkman noodle, pad see ew, red curry	1459436967	715556621510918146	f	luckyimthai
46th between 5 and 6 AVE, spicy fried rice, padthai, pad see ew, red curry, green curry mayo, drunkman noodle, 	1459436868	715556205045878784	f	luckyimthai
Midtown, 46th between 5 and 6 AVE, padthai, drunkman noodle, spicy fried rice,	1459361044	715238176684638208	f	luckyimthai
Windy day, midtown 46th between 5 and 6 AVE,  	1459265441	714837190682009601	f	luckyimthai
@dave_stern 46th between 5 and 6 AVE. See you	1459265357	714836836447858688	f	luckyimthai
Downtown call us ahead, then pick up your orders,  	1459180053	714479046210535424	f	luckyimthai
Raining day, 46th between 5 and 6 AVE,  see you guys	1459179778	714477893393457155	f	luckyimthai
Hanover sq and water St. Enjoy Thai food at downtown. Really good . Call ahead then pick up	1458914734	713366215037689856	f	luckyimthai
Happy Friday, midtown . 46th between 5 and 6 AVE, Thai food truck is delicious.. 	1458914541	713365408003330048	f	luckyimthai
Downtown call ahead then pick up,  hot and delicious 	1458833478	713025403183632384	f	luckyimthai
Thursday food truck, 46th between 5 and 6 AVE, padthai, pad see ew, drunkman noodle, fried rice, red curry,	1458832420	713020967782580225	f	luckyimthai
Wednesday midtown meets us at 47th between park and Lexington AVE,   Drunkman noodle, spicy here !!! 	1458745762	712657497597804545	f	luckyimthai
Welcome Friday ! We r open @47th st. Between park and lex ave. try our BBQ beef pork shrimp and NEWmenu BOBJO BBQ burger come by &enjoy thx!	1447432734	665207217277313025	f	bobjotruck
Good morning ! We r open @47th st. lex and park ave.  Try our new menu BBQ burger !  And we also ready to serve BBQ pork beef shrimp platter	1447347230	664848588187508736	f	bobjotruck
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
Good morning we are open at 47 th st btween park and lex ave. try our korean BBQ beef(galbi)pork, shrimp. And spicy chicken bowl as well thx	1440603687	636564121278881792	f	bobjotruck
Good morning we r open at water and hanover sq. try our korean BBQ beef pork shrimp and we Hav also burritos and spicy chicken rice bowl thx	1440517754	636203689603133440	f	bobjotruck
Good morning !! We r open at king and Hudson ! Try our korean BBQ:galbi,pork,shrimp and we have also bbq burritos. Come by and enjoy thanx	1440084240	634385400493154304	f	bobjotruck
Welcome Monday ! We r open@king and Hudson at. Try our korean BBQ galbi,pork,chicken plZ stop by and enjoy thank you	1439825773	633301312889835520	f	bobjotruck
Welcome friday we t open @47th st. Btween park and lex ave. try our korean BBQ beef pork shrimp please come by and enjoy.	1439567098	632216349260029952	f	bobjotruck
Hello NYC we r open @ king and Hudson st. Try our korean BBQ beef pork shrimp and burritos and we have also spicy chicken rice bowl. Thx!!	1439478971	631846718863224833	f	bobjotruck
https://t.co/8QkidPYxZB DYCKMAN \nFRIDAYS!!! @ Don Coqui Dyckman https://t.co/G5aouQGywl	1460146366	718532054443548676	f	latinkitchennyc
https://t.co/8QkidPYxZB DYCKMAN \nFRIDAYS! @ Don Coqui Dyckman https://t.co/QsKIPc4SIR	1460146248	718531562925592576	f	latinkitchennyc
Don't miss out this Friday... The best spot to just chill & have a... https://t.co/gDK2BC8Xo5	1460143433	718519755842404353	f	latinkitchennyc
A-LIST FRIDAYS \nhttps://t.co/8QkidPYxZB Dyckman \n186 Dyckman St.\nNew York... https://t.co/BUTnsYuMKj	1460015954	717985067667177472	f	latinkitchennyc
We want to thank all that came out to our @TOMMY5KDEGREEZ  Comedy... https://t.co/0s8NNd5SF0	1460013724	717975715984105472	f	latinkitchennyc
Today....Today.....Today....\nWEDNESDAY  APRIL 6TH 5PM\nYOU DONT WANT... https://t.co/IMP3LKPY0a	1459950608	717710987583950848	f	latinkitchennyc
WEDNESDAY  YOU DONT WANT TO MISS IT! THE BEST COMEDY SHOW UPTOWN.... https://t.co/Zkmgf2SZRe	1459921113	717587278412034048	f	latinkitchennyc
RSVP NOW 212-457-1072\n@TOMMY5KDEGREEZ COMEDY WEDNESDAYS \nTAKES OVER... https://t.co/7zJoRtgEbI	1459877771	717405487357116417	f	latinkitchennyc
SHOWTIME IN 36 HRS!!\n@TOMMY5KDEGREEZ ''s\nCOMEDY... https://t.co/JiwSMR8jkE	1459858118	717323056667090944	f	latinkitchennyc
@TOMMY5KDEGREEZ\nCOMEDY WEDNESDAYS\nhttps://t.co/8QkidPYxZB  DYCKMAN!!!\nSHOWTIME... https://t.co/avE2q0teHS	1459806911	717108280510836737	f	latinkitchennyc
THIS WEDNESDAY \nGUESS WHO'S COMING TO\nhttps://t.co/8QkidPYxZB... https://t.co/XEMZohWqfZ	1459784887	717015902219276290	f	latinkitchennyc
Repost @TOMMY5KDEGREEZ https://t.co/8QkidPYxZB DYCKMAN!!!\nGOOD NEWS AND BAD... https://t.co/zZmaG7AMaX	1459784407	717013890685603840	f	latinkitchennyc
BROOKLYN WE ARE COMING FOR YOU... @ Coney Island https://t.co/VtE3xMMnLO	1459524354	715923148596781057	f	latinkitchennyc
Any questions?\nhttps://t.co/8QkidPYxZB WHITEPLAINS\n@alexsensation LIVE!!! @ Don... https://t.co/ydtQaXq1uV	1459468208	715687654772310017	f	latinkitchennyc
But for real\nWish all of yous well!\nGuess where We going...\nALL THE... https://t.co/A1bUXTmqNw	1459391090	715364198046384129	f	latinkitchennyc
Can't make it email resume with attached photo... https://t.co/iM9PXuMI5U	1459283467	714912795540725760	f	latinkitchennyc
Tonight all roads lead to the 1 Sunday Dinner Party in... https://t.co/LrOUDc971O	1459107094	714173034609909760	f	latinkitchennyc
There only 2 people missing in this small circle of ours...\nWE... https://t.co/vlfcE5p68Q	1459058649	713969839161937920	f	latinkitchennyc
TONIGHT\nALL ROADS LEAD TO THE WORLD FAMOUS\n@copacabananyc \n47st Bet... https://t.co/83jlYR73b5	1459023564	713822681796374531	f	latinkitchennyc
WANNA WISH MY MAN erickmorillo A HAPPY FUCKING BIRTHDAY!!!! \nSEE YOU... https://t.co/g4roodnSgB	1459023106	713820762935836673	f	latinkitchennyc
Its taco day sweet chili style on jay & water 1130-3! Thaietnamese habanero cheflife https://t.co/X5vLQApzVn	1460120868	718425108558299137	f	sweetchilinyc
TGIF we have TACOS today on jay & water! Thaietnamese tacos habanero cheflife https://t.co/3yue6rZPmH	1460120359	718422974710165504	f	sweetchilinyc
Its Humpday so come see us on broadway btw Houston & Bleeker 1130-3 today! Nothing gets ur HumpDayMotivation like sriracha fries!	1459955374	717730979268395008	f	sweetchilinyc
Warm up with us on jay & water till 3 and grab a hot vietnamese coffee! Thaietnamese brooklyn foodtruck	1459871527	717379297791623169	f	sweetchilinyc
RT @dumbolot: Cold outside so grab something warm from Dumbo! Today we have @SweetChiliNYC , @KimchiTruck and @PontiRossiFood	1459869273	717369843603914754	f	sweetchilinyc
We have your mondaymotivation on jay & water 1130-3 today! Thaietnamese brooklyn foodtruck	1459783261	717009083946180608	f	sweetchilinyc
RT @dumbolot: At Dumbo today we have @bigdsgrub and @SweetChiliNYC	1459782992	717007956978638848	f	sweetchilinyc
https://t.co/9SFPAPpyFV\n\nWe are hiring Prep Cooks! JobSearch JobOpening Cook PrepCook Chef	1459702056	716668486051885056	f	sweetchilinyc
TGIF we are on jay & water till 230 today with a Vegan special! No thisis not an AprilFools joke!! Thaietnamese https://t.co/VjusOq0XNu	1459524217	715922573238919168	f	sweetchilinyc
RT @dumbolot: Fridayyyy at Dumbo we have @SweetChiliNYC ,@mamuthainoodle ,and @PontiRossiFood for lunch!	1459524137	715922239863066624	f	sweetchilinyc
Catch us today @starrettlehigh @gofooda 2nd floor and at our usual cafeteria @@brookfieldplny Thaietnamese	1459439433	715566962282274816	f	sweetchilinyc
Its lunch time and we have your HumpDayMotivation in the form of pork fried rice! 1130-3 broadway btw Houston & Bleeker! Thaietnamese	1459351757	715199222803468289	f	sweetchilinyc
Lunch today on jay & water 1130-3 @dumbolot Thaietnamese brooklyn foodtruck \nPork fried rice special!  friedrice	1459265043	714835521147703296	f	sweetchilinyc
RT @dumbolot: Come eat at Dumbo today! We have @PontiRossiFood ,@SweetChiliNYC ,and @KimchiTruck !	1459263003	714826962011860992	f	sweetchilinyc
mondaymotivation @dumbolot jay & water Shrimp & pork fried rice, curry bok choy and beef & watercress salad! https://t.co/AwIJtcjp5n	1459177709	714469213369405444	f	sweetchilinyc
happyeaster shabushabu egg with   my lunch @ Spring Shabu Shabu https://t.co/lZopPkZlsm	1459109644	714183728692506624	f	sweetchilinyc
Today's specials are:\nKalamansi shrimp over vietnamese pineapple kimchee & jasmine rice AND yellow curry bok choy!! https://t.co/xB6fIDkbVD	1458919627	713386741219123201	f	sweetchilinyc
TGIF we have 2 great specials today @dumbolot \nShrimp over Vietnamese pineapple kimchi & yellow cuury bok choy! 1130-3! GoodFriday	1458914681	713365993381347328	f	sweetchilinyc
Breaking news***2 specials for Friday in DUMBO \nYellow curry bok choy W/crunchy shallots \nSauteed Shrimp over Vietnamese Pineapple Kimchi	1458865570	713160006821146624	f	sweetchilinyc
find us @ our usual cafeteria @brookfieldplny 1130-2! Don't work in this tower?  Email an order for pick up! Sweetchilinyc@gmail.com 	1458831822	713018460360601600	f	sweetchilinyc
burger Alert! Peeps, truck will be back on the streets starting this following week! 	1460140948	718509332627857408	f	fritesnmeats
@markh314 hey bud, the truck will hit the streets this following week coming up	1460134037	718480342718550020	f	fritesnmeats
@breakthefirion hey bud, sorry for the late reply. Truck will be back on the streets next week	1460056546	718155324902023172	f	fritesnmeats
burgeralert burgersNbeers @ 483 grand st brooklyn truck will be back on the st with in the next couple of weeks  https://t.co/TTxKxk5eyH	1459617843	716315269967253504	f	fritesnmeats
@MrJGmo hey bud. We will be back on the streets in a week. We will keep u guys updated	1459515476	715885910274007040	f	fritesnmeats
@Under_aRmur hey bud, truck will be back in April	1458761549	712723712957657089	f	fritesnmeats
RT @BrooklynPinball: Stumbled across a new location on Grand Street (Williamsburg) @fritesnmeats @sternpinballinc @TitanPinball pinball ht...	1458166406	710227500790652930	f	fritesnmeats
Hot damn!! burgeralert brooklyn burgerlife burgasm williamsburg wagyu beef burgersNbeers... https://t.co/VNZqiHEWu0	1457147156	705952457206198273	f	fritesnmeats
483 grand st brooklyn food truck coming back soon. burgersNbeers https://t.co/VO0QXS0Rku	1456946508	705110877092126721	f	fritesnmeats
RT @dontcallmekeke: The burgers from @fritesnmeats are bomb  do yourself a favor and have a real burger from @fritesnmeats asap!!!!	1456107548	701592023497895937	f	fritesnmeats
Truck will be back out in april till then check out the restaurant 483 grand st williamsburg Trucklife back soon https://t.co/AaJvbxSzAB	1455906387	700748295782670336	f	fritesnmeats
483 grand st williamsburg burgeralert https://t.co/9yxPZOXOhX	1455052742	697167850012811264	f	fritesnmeats
RT @justyniak: For my French fries craving - @fritesnmeats (@ Frites 'n' Meats) on Yelp https://t.co/eMbrQbbCuk	1454766065	695965438824599554	f	fritesnmeats
$20 reserves your seat inc AllYouCanDrink BudLight 4 our KickTheKeg SuperBowlParty 483 Grand st. BK 917-292-9226 https://t.co/RIxuOBfxl6	1453924152	692434197521289218	f	fritesnmeats
burgeralert 483 grand st Brooklyn open till 10pm tonight! https://t.co/aqXsQcTYU3	1453918631	692411043105079296	f	fritesnmeats
@juniorcitizen I'm on my way now bud.	1453738266	691654536658882560	f	fritesnmeats
@juniorcitizen sorry about that, my home streets are buried car is stuck. Trying to get there to clean up	1453737107	691649676131614720	f	fritesnmeats
Peeps, the restaurant will be closed today. We will reopen Tuesday (jan 26th)	1453656029	691309610628706304	f	fritesnmeats
@WSevern hey bud, we will be back in spring.	1452885538	688077934234615809	f	fritesnmeats
burgersNbeers @ 483 grand st. Brooklyn Open till midnight https://t.co/PmL83z3WV2	1452815438	687783914514059269	f	fritesnmeats
Good morning TGIF start your weekend with real New York food pastrami and corned beef from the pastrami truck  Broadway bet 55&56 st enjoy	1460124331	718439636092198914	f	delindogztruck
Hello today old slip bet water and front to 3 pm we see you all have a good day	1460040840	718089447502381059	f	delindogztruck
Good morning midtown west today we serve lunch @w 52 st bet 6&7 Ave to 3 pm we looking to see you all today have a good day	1459949494	717706313149583360	f	delindogztruck
Good morning the lunch well be inBrooklyn today @Metro tech we be here to 3 pm we see you all Brooklyn people have a good day	1459433406	715541686676537346	f	delindogztruck
Good morning today we are @W52 st bet 6&7 Ave by Ubs building for lunch to 3 pm so we see you all have a good day	1459348417	715185217342836736	f	delindogztruck
Hello NYC the pastrami truck today at E47 st bet park and Lexington with  real New York traditional food to 3 pm so hurry and a grab one	1459255731	714796463423881218	f	delindogztruck
RT @carlopezcalle: Ultima comida en New York a cargo del @DeliNDogzTruck ha sido espectacular, repetia si pudiese comer mas! ! https://t.co...	1459196834	714549431975165952	f	delindogztruck
Good morning happy Monday today we are @w 46 st bet 5&6 Ave for lunch to 3 pm we see you all have a good week	1459175778	714461114671710208	f	delindogztruck
Good morning Fidi we are here at old slip bet water and front st the other side  to 3 pm we see you all for lunch today	1458831658	713017769202155520	f	delindogztruck
Good morning NYC it's beautiful day to go out to grab lunch from the food trucks today we are @52 st bet 6&7 Ave to 3 pm we see you all	1458743000	712645912447815680	f	delindogztruck
Good morning midtown east we here today@47 st bet park and Lexington for lunch to 3 pm we see you all have a good day	1458656229	712281969300795392	f	delindogztruck
Good morning Broadway it must be Friday the pastrami truck is here @broadway bet 55&56 st start your weekend with us have a good weekend	1458307687	710820076417589248	f	delindogztruck
Good morning happy st Patrick day today is corned beef day @ metro tech our yummy corned beef waiting for you have a good day	1458224635	710471730926637059	f	delindogztruck
Hello UBS building good morning midtown west the pastrami truck is here @west 52 st bet 6&7 Ave for lunch today looking to see you all	1458139382	710114154695229441	f	delindogztruck
Hello Fidi we are here today @old slip bet water and front st we here to 3 pm we see you all have a good day	1458052495	709749724014911489	f	delindogztruck
Good morning happy Monday today we here @W46 st bet5&6 Ave for lunch to 3 pm we see you all have a good week	1457963073	709374661197438976	f	delindogztruck
RT @randomfoodtruck: We made it you guys! @carlssteaks @Chefsamirtruck @CarpeDonutNYC @DeliNDogzTruck @souvlakitruck @PolishCuisine	1457715979	708338274885099520	f	delindogztruck
Good morning Broadway TGIF start your week end strong eat pastrami we are here at Broadway bet W55&56 st for lunch we see you all enjoy	1457710891	708316934115303424	f	delindogztruck
Hello Fidi today we are here @old slip bet water and front for lunch to 3 pm we see you all and enjoy this beautiful day	1457620516	707937874780549120	f	delindogztruck
Good morning it's beautiful out today at w52 st bet 6&7 Ave so have lunch with us today and enjoy we see you all	1457535171	707579911117131777	f	delindogztruck
Happy Friday Schnitzlers, we are on 52nd & 6th ave	1460132524	718473998242353152	f	schnitznthings
Hey guys we are on Pearl & Broad today	1460043480	718100519185747969	f	schnitznthings
Hey guys we are on 47th & Park today	1459961002	717754584299610117	f	schnitznthings
Hey Schnitzlers we are on 52nd & 6th Ave	1459873249	717386520206909440	f	schnitznthings
Hey guys we are on 47th & Park	1459788134	717029522026196992	f	schnitznthings
Happy Friday we are on 52nd & 6th Ave	1459527878	715937928946524163	f	schnitznthings
Hey Schnitzlers we are on Pearl & Broad today	1459439527	715567358987919362	f	schnitznthings
Hey Schnitzlers we are on 52nd & 6th ave	1459351969	715200112155369472	f	schnitznthings
Hey guys were on 47th & Park	1459268612	714850488454418433	f	schnitznthings
Hey guys we are on 47th & Park today	1459182055	714487442980675586	f	schnitznthings
Happy Friday Schnitzlers. We are on 52nd & 6th today	1458922268	713397818996703233	f	schnitznthings
@sypurplegirl Pearl & Broad	1458835570	713034178879688704	f	schnitznthings
Hey guys we are on Pearl & Broad today.	1458835162	713032467020660736	f	schnitznthings
Hi everyone!!we are on 47 street and park ave today!!	1458751170	712680179315961856	f	schnitznthings
Hey guys, we are on 52nd & 6th Ave today.	1458663976	712314462032629761	f	schnitznthings
Happy Friday Schnitzlers, we are on 52nd & 6th Ave today	1458318672	710866151652384768	f	schnitznthings
Happy St. PATRICKS DAY schnitzlers\nSchnitzel for lunch! We are on Water Street & Hanover Square	1458228880	710489535159934976	f	schnitznthings
Hey guys were on 47th & Park today	1458143946	710133299247759360	f	schnitznthings
Hey Schnitzlers we are on 52nd & 6th  Avenue today	1458055751	709763382895890433	f	schnitznthings
Hey guys we are 47 street and park ave!!	1457973263	709417403193696257	f	schnitznthings
Stay tuned for new delivery areas. Announcements tomorrow  https://t.co/IlmX8olURb	1460163394	718603476457140225	f	waffletruck
We do indoor events as well?   Call us to book yours today dingesforeveryone 646.257.2592 https://t.co/GkQ6dl19BS	1460161815	718596854452207616	f	waffletruck
RT @CentralPark_NYC: Cherry Blossom snow showers today & maybe real snow showers tomorrow over centralpark @JaniceHuff4ny @Erica4NY  ht...	1460156825	718575923864477697	f	waffletruck
RT @bryantparknyc: bpgames is open & better than ever! Come by & borrow one of our 54 games https://t.co/BWJaLVwcdM https://t.co/tPz3fnLujS	1460156817	718575891471839233	f	waffletruck
It's the freakin' weekend!  waffleweekend dingesdelivered https://t.co/sxDWfrVORY	1460152625	718558306348986372	f	waffletruck
It's Friday, you should be eating a wafel! https://t.co/pdYXjxGxhC	1460149029	718543223434670081	f	waffletruck
De-liver de waffles, de sooner de better!  @Seamless https://t.co/lts3nAcMut	1460149019	718543185094557697	f	waffletruck
The Smurfs are here to tell you about all of our awesome menu items that can be ordered on @Seamless https://t.co/NQIV6btOyr	1460143837	718521449355591680	f	waffletruck
RT @bryantparknyc: Spring Birding, Evening Tours, & Midtown Recess in yesterday's issue of MidCity News - learn more: https://t.co/mkOfNGww...	1460139775	718504410112999424	f	waffletruck
RT @CentralPark_NYC: Looking to get married in CentralPark? Tis the season & we have the 411 https://t.co/Rwr7PJ7VU8 wedding http...	1460139768	718504381918941189	f	waffletruck
hasbrowns https://t.co/gAuv5TgplW	1460139725	718504203078017025	f	waffletruck
@cmidggy Wait!  There was a last-minute change to Trinity	1460139390	718502796379758596	f	waffletruck
@AdolfoAguirreC Last minute change to Trinity!	1460139341	718502592020615168	f	waffletruck
RT @ManhattanTwist: In New York Its All About the Waffles https://t.co/oQlfZzap3B https://t.co/47vyxm4NoF @waffletruck NYCeats	1460139175	718501896311435264	f	waffletruck
@cmidggy 60 Wall Street!	1460139165	718501853659586560	f	waffletruck
Look at all of this wonderful pearl sugar!  Keeping those Liege waffles hot, fresh, sweet, n' chewy Mmmmmmmm https://t.co/iyGlqv7qX5	1460136797	718491920394297344	f	waffletruck
We love to hear the dinges love stories!  Keep 'em coming! https://t.co/oE9pltrhIg	1460134481	718482206927286273	f	waffletruck
The waffles can come to you!  Call us for catering events in the tri-state area!  646.257.2592 https://t.co/u4d50BVp0d	1460132579	718474229138792450	f	waffletruck
Meet our amazing kitchen dinges!  Their slogan is We produce the love, and they sure do!  Thank you!  teamdinges https://t.co/xED2VGdjrj	1460130665	718466202457219072	f	waffletruck
Serving on Center Drive in Central Park 11:00AM-6:30PM CentralDinges https://t.co/4aG6naI8b5	1460127935	718454749314592769	f	waffletruck
Ain't she a beaut . Come check us out at Columbia U (116th St & Broadway) all day from 12pm-7pm. https://t.co/kAUriTB39b	1460132164	718472490494926848	f	korillabbq
Serving Columbia U today at 116th & Broadway. Will be back to regular program in 2 weeks!	1460131581	718470042497757184	f	korillabbq
BKFR  Bulgogi  Cucumber Kimchi  Sweets n Beets  Korilla  Sauce https://t.co/tA04Rli3fB	1460055450	718150725277196289	f	korillabbq
@bjehrl we'll be back in 2 weeks	1460036985	718073279878205440	f	korillabbq
Headed to 19th St & 5th Ave!	1460036952	718073141000609792	f	korillabbq
Sorry no old slip today.	1459957631	717740445363732482	f	korillabbq
Today we will be at Varick & Vandam!	1459955783	717732691093929984	f	korillabbq
We are at 19th St & 5th Ave todAy @chavez_valita	1459869678	717371543471280128	f	korillabbq
the difference btwn keeping it real & keeping it  in the kimchi game is the big red buckets  kimchtime  https://t.co/iyRLwX5iZ8	1459869135	717369266719199232	f	korillabbq
Why not start the week right? https://t.co/TpwWnciIKt	1459783641	717010676091265024	f	korillabbq
Catch us at 19th St and 5th Ave today! @OmerSaleh	1459438848	715564509570543616	f	korillabbq
@DannyPaulson93 no Metrotech today	1459438607	715563500026728448	f	korillabbq
@belenrodri2001 we are at 5th ave and 19th St todAy!	1459438281	715562133493129216	f	korillabbq
Headed to 19th St & 5th Ave. Dope sounds by @SoundBoks come check out the party in a box.	1459261968	714822622618345473	f	korillabbq
@tiffanitarsia not at 47th today. We will be at 25th and Broadwayz	1459181361	714484532519505920	f	korillabbq
RT @TheBukiShow: https://t.co/UGDSVcbhG8\nCheck out part 1 of the interview with ceo of @korillabbq... https://t.co/PAq99lifMm	1459176661	714464818133073920	f	korillabbq
here's to a speedy  monday. Order our bulgogi  rice bowl on fastbite by @trycaviarnyc and eat in 15 min! https://t.co/RVnay15wNR	1459176624	714464664369950721	f	korillabbq
 https://t.co/GCnSzdi3q8	1458932270	713439766637842433	f	korillabbq
@jennandtonic__ done for the day 	1458932197	713439463943356417	f	korillabbq
BigRed will be lobster rocking and rolling this Sunday at the @QueensMuseum from 3:30-8:30. Hey Ho Let's Go! https://t.co/y502xtfmaZ	1460145620	718528928705617920	f	lobstertruckny
Happy Friday NYC! BigRed is on the corner of 46th and 6th serving up a taste of summer lobsteroll lobsterlunch https://t.co/K2uZskhmt4	1460134826	718483651814690818	f	lobstertruckny
Make your dreams reality, BigRed is on 46th & 6th with these! https://t.co/Px9O9OjyZM	1460130918	718467260545921024	f	lobstertruckny
BigRed is parked on this corner, 46th & 6th, and ready to make your Friday with lobster in a toasted hotdog bun! https://t.co/bL8ojl8muq	1460127089	718451202279739393	f	lobstertruckny
BigRed is off the street today but you can get your lobster lunch delivered with @Uber_NYC UberEATS or @TryCaviar! https://t.co/z01i9iB0tb	1460041232	718091091891916800	f	lobstertruckny
BigRed is on the corner of 53rd & Park with your lunch! https://t.co/6203kABZMW	1459958114	717742470063370244	f	lobstertruckny
It's a little blustery out there but BigRed is on the corner of 53rd & Park with summery sunshine in toasted buns. https://t.co/zaeIq7gp6C	1459954508	717727347118628865	f	lobstertruckny
@GalletaPecosa we're catering an event today! Should be back on the streets tomorrow :)	1459880910	717418650811150336	f	lobstertruckny
BigRed is catering an event today but have no fear, your lobster party can be near! Email cater@redhooklobster.com https://t.co/BjhmZwQlFc	1459868483	717366529042595840	f	lobstertruckny
@belenrodri2001 BigRed is not out today but you can get your lobster fix with @Uber_NYC UberEATS https://t.co/tKzQYz3TGO	1459786031	717020699559333889	f	lobstertruckny
BigRed is off the streets today but come visit us in East Village or Midtown where we've got lobster 7 days a week! https://t.co/d8q4DtqSJq	1459785832	717019866658709504	f	lobstertruckny
BigRed is booked this weekend but visit us at Williamsburg Smorg, East Village, Red Hook and Midtown! https://t.co/tNqeWQktYp	1459609225	716279122276823040	f	lobstertruckny
@XxAshes2Ashes we can make any roll bikini style!	1459543009	716001391823699970	f	lobstertruckny
@belenrodri2001 we're at Broadway between 55th and 56th	1459438275	715562107794800640	f	lobstertruckny
Happy Thursday New York! BigRed is on Broadway between 55th and 56th with a whole lot of lobster love lobsterlunch https://t.co/Wh55kNMnzi	1459438246	715561983899279360	f	lobstertruckny
Catch a fresh Lobster BLT! BigRed is on the corner of 53rd and Park Ave lobsterlunch lobsterrolls catchoftheday https://t.co/MAVB43Wumc	1459350913	715195685642104834	f	lobstertruckny
BigRed is in the shop today but shell be back on the streets later this week! https://t.co/IwzSDIhDbL	1459265423	714837114257608704	f	lobstertruckny
BigRed is off the streets today but you can find crustacean elation at @usvanderbilt or in the EastVillage https://t.co/ZwrYnAmsiB	1459177223	714467174199521280	f	lobstertruckny
BigRed is off today but you can still lobstersize your Saturday! Catch us in Red Hook, East Village or Midtown! https://t.co/rxtWAdu8WD	1459004450	713742514675646465	f	lobstertruckny
BigRed may be off the streets but we've still got lobsterlunch covered! Check us out @usvanderbilt or EastVillage https://t.co/iypuvRFAiJ	1458919820	713387548605808640	f	lobstertruckny
@CinderBlockFest send an email to info@drivechangenyc.org	1460129032	718459352726769666	f	snowdaytruck
RT @AAPremlall: Breaking Chains: Food as a Tool to end Mass Incarceration w @soulfirefarm @SnowdayTruck @sweetfreedomny JFC2016 https://t....	1457916745	709180346340929536	f	snowdaytruck
RT @SierraRise: How @SnowdayTruck tackles social justice, sustainability, and reentry programs https://t.co/N75FNRLJQb https://t.co/tnaSebG...	1456780725	704415532620054528	f	snowdaytruck
RT @DriveChangeNYC: The @nytimes Editorial calls on NYC to closeRikers !! https://t.co/Ck6sIjJToS This is incredible - @JustLeadersUSA @gl...	1456347058	702596603396407296	f	snowdaytruck
RT @beepublic: I'm PUMPED. Thanks for the night of inspiration, @snowdaytruck. socialchange @ Park Tudor School https://t.co/BBOvttHilF	1455901452	700727594740748289	f	snowdaytruck
RT @JustLeadersUSA: We're proud of @GovAndrewCuomo & @MMViverito for their support towards our longstanding call to CLOSErikers https://t....	1455824592	700405220191399938	f	snowdaytruck
RT @JustLeadersUSA: On any given day 2.3 million Americans are incarcerated @kendricklamar stood for them at the GRAMMYs halfby2030 https...	1455824563	700405101379350529	f	snowdaytruck
.@501UNION not out till the spring! Working on our 2016 Fellowship now @DriveChangeNYC - hit us up for collaborations !! Mad love	1455824495	700404815264768000	f	snowdaytruck
RT @ACLaPorte: LOVE! Way to go, @SnowdayTruck https://t.co/ab1z4cP8Dq	1455751355	700098043060871168	f	snowdaytruck
RT @becmann: Some in NewYorkCity see snow as a problem; @SnowdayTruck sees it as a biz op https://t.co/Xu7XXyFznb socent https://t.co/Yx...	1455660324	699716230563958785	f	snowdaytruck
RT @HumanPictures: @SnowdayTruck &lt;3 your food and mission! Thought u might like our short https://t.co/89mST137Z5 massincarceration reent...	1455370879	698502210204860416	f	snowdaytruck
@InsightGarden @unprisonproject @DigDeepFarmsCSA thank you, you too solidarity	1455236045	697936676988022785	f	snowdaytruck
@Alimentary1 @KLINKCoffee thank you!!	1455236028	697936607219949568	f	snowdaytruck
Enjoy your snow day NYC, think of us ;)	1453570373	690950341307662336	f	snowdaytruck
RT @PureCanadaMaple: Celebrating NationalCheeseLoversDay with our favorite grilled cheese recipe from @SnowdayTruck ILoveMaple https://t....	1453339239	689980894023696384	f	snowdaytruck
RT @SITUSTUDIO: Congrats @DriveChangeNYC founder Jordyn @Forbes 30Under30 socialentrepreneur! A lil TBT to @SnowdayTruck launch https://...	1452180118	685119191591063552	f	snowdaytruck
RT @oliverhenryroth: My cousin Jordyn, founder of @DriveChangeNYC and @SnowdayTruck, is a @Forbes 30under30 social entrepreneur! https://t...	1452017291	684436245229867008	f	snowdaytruck
@khanna_mudit were closed for January - private events only - see you soon	1451581906	682610106828238848	f	snowdaytruck
RT @jillmarette99: Every time I open @O_Magazine an AMAZING nonprofit hero is there! CONGRATS Jordyn L. @SnowdayTruck @DriveChangeNYC! http...	1451415531	681912281467236352	f	snowdaytruck
Nova baby!	1459827811	717195939887321089	f	shortysnyc
We aren't out today because of the weather - see you tomorrow! At 41st and Lex	1450381262	677574241546579968	f	snowdaytruck
RT @Wise__Chips: Love @PapayaKingTruck? Get your fav Loaded Chili Cheese Dog in a chip! Check them out! papayakingtruck wisechips https:/...	1460083675	718269112456232960	f	papayakingtruck
.@SeanForneyArt @NY_Comic_Con @jayleisten glad you guys enjoyed it, see you next year! https://t.co/VUDAwCHtA4	1451616376	682754685925732353	f	papayakingtruck
The truck and carts will be off the road for the winter season. If interested in booking for a private event jason (at) papayaking (dot) com	1449700081	674717161584205826	f	papayakingtruck
Endless choices hotdog papayaking https://t.co/SCBNekMK5h	1449065460	672055368906842112	f	papayakingtruck
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
RT @NHLFlyers: Congrats to the champs, @NovaMBB! NationalChampionship 	1459983829	717850328314560513	f	shortysnyc
RT @DjRoBTV: Each & Every Wednesday @shortysnyc Presents The Extended Happy Hour From 7p-12a  $5/$7 Drink... https://t.co/znnY5JWVrJ	1459983767	717850065457520640	f	shortysnyc
RT @trivialdispute: All men must play trivia! 8pm at @ShortysTrivia 1st ave w Chelsea, 8:30 at @CrocLoungeNYC w Kris! https://t.co/J0NMbQFv...	1459976151	717818124024807424	f	shortysnyc
RT @trivialdispute: Here's a hint for a round at tonight's @ShortysTrivia - 1st ave at 8pm with yr host Chelsea! https://t.co/49L43DYuKG	1459976149	717818112796717056	f	shortysnyc
Trivia TONIGHT! 8pm. 1678 1st ave. Happy hour til 7pm. $5 Whiskey& Wine & $12 pitchers til midnight Trivia... https://t.co/0Lb63Xszdy	1459971809	717799910129672192	f	shortysnyc
RT @ConeyIslandBeer: Join Jess & John for $12 pints of Mermaid and try your luck at trivia to win Coney swag and @shortysnyc  cash! https:/...	1459900004	717498737883529217	f	shortysnyc
Trivia tonight! 62 pearl street. 8pm. ShortysNyc TrivialDispute https://t.co/A933eGuPnK	1459885900	717439583001165824	f	shortysnyc
RT @trivialdispute: Here's a hint for one of the rounds at tonight's @ShortysTrivia Pearl St! 8pm with yr host @MsDurbervilles ! https://t....	1459880130	717415381204385792	f	shortysnyc
NCAA championship tonight. Game Sound & $5 Sixpoint Beer at all @shortynyc locations. https://t.co/HFQFNqAMxS	1459799237	717076090628476929	f	shortysnyc
RT @BrooklynTours: RT @SixpointNYC: Final four @shortysnyc: NCAA action  back tonight! Game sound & $5 Specials at Shorty's locations http...	1459639442	716405863536336896	f	shortysnyc
Final four TONIGHT. Game sound& $5 Sixpoint at all Shorty's locations. NCAA Shortys ShortysNyc https://t.co/749Gd5j9Zn	1459622627	716335334016098305	f	shortysnyc
RT @trivialdispute: Win a FREE SHOT at tonight's @ShortysTrivia at @shortysnyc 1st ave, 8pm. What film features THIS Son of GodTM? https://t...	1459369559	715273891103580160	f	shortysnyc
RT @trivialdispute: Here's a hint for trivia at @ShortysTrivia tonight: 8pm at Pearl st with your host @MsDurbervilles ! https://t.co/Oa964...	1459293650	714955507182804992	f	shortysnyc
@Garbage_Extreme we appreciate that!	1459000095	713724246527184896	f	shortysnyc
RT @GoGoGadge7: Catching up with these ladies! (at @ShortysNyc in New York, NY) https://t.co/VdofCHJlOA	1458954350	713532379504254976	f	shortysnyc
RT @Garbage_Extreme: @shortysnyc I eat your food at least three times a week - it's incredible	1458954344	713532353696702466	f	shortysnyc
Shortys ShortysNyc NCAA Sixpoint Game Sound & Drink Specials at all locations https://t.co/kFZoIKoEBP	1458937573	713462012219629568	f	shortysnyc
NCAA action is back tonight! Game sound & $5 Sixpoint Specials at all Shorty's locations ShortysNyc https://t.co/ftYCXQgBZP	1458853631	713109931902308353	f	shortysnyc
RT @DjRoBTV: Almost Time To Start The Party At --&gt;&gt; @shortysnyc Presents The Extended Happy Hour From 7p-12a... https://t.co/Djo6shfSqm	1458766257	712743461083095041	f	shortysnyc
Happy Thanksgiving! Miss you guys and thanks for missing us. We'll be back in Spring 2016	1448643747	670286573099999233	f	biandangnyc
Domo Taco will be on 40th/41st and Broadway till 8pm! asiantaqueria comegetsome https://t.co/M745oUGYMj	1447692329	666296039507390465	f	biandangnyc
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
Happy Friday from 53rd & Park!	1444999738	655002494398025728	f	biandangnyc
October 30th will be our last day on the streets for the year. Catch us while you can! 	1444925207	654689886700593153	f	biandangnyc
Catch us on 53rd & Park today!	1444921856	654675831877332992	f	biandangnyc
Jay and Water for lunch today! @dumbofoodtrucks @dumbonyc @dumbolot	1444830034	654290702604480512	f	biandangnyc
@SpotifyCares how does one remove a family member completely from family plan?	1459525567	715928235184418816	f	mexicoblvd
RT @partyliz: NYC's bureaucracy and red tape will kill your favorite food truck -- it killed my @SnapTruck and now @MexicoBlvd too https://...	1449109444	672239848812634114	f	mexicoblvd
RT @SnowdayTruck: Food trucks that inspire us = @NuchasNYC @SweetChiliNYC @MexicoBlvd @KorillaBBQ @ToumNYC @hardtimessundae watch https://t...	1448992171	671747971323686912	f	mexicoblvd
Happy Thanksgiving!	1448550904	669897163707674629	f	mexicoblvd
RT @brollyus: @ChelaGarnacha https://t.co/irOQDgtstQ	1447978232	667495203079659520	f	mexicoblvd
@ChelaGarnacha @brollyus	1447978175	667494965480673280	f	mexicoblvd
Taco motion @MexicoBlvd https://t.co/reR3oHjzzK	1447872756	667052804507324416	f	mexicoblvd
RT @Spfaendler: Time to move to Queens! @MexicoBlvd sells last taco due to high NYC permit & parking hassles https://t.co/byvHaIXMu6 @WSJ	1447780046	666663951044841472	f	mexicoblvd
RT @SopranoJane: Such a shame. @MexicoBlvd had the only good tortas in midtown.  https://t.co/lKKpgeNbT1	1447702729	666339657634947072	f	mexicoblvd
RT @ryotarotakao: Permits, Parking Push Mexico Blvd. Food Truck Out of Business - WSJ https://t.co/XUqnmgqyTZ	1447597185	665896974462398468	f	mexicoblvd
RT @j_cohl: What the Hell is wrong with people!? \n\nParisAttacks	1447470088	665363891510231042	f	mexicoblvd
https://t.co/pD0B4NX0iY	1447465755	665345717318324224	f	mexicoblvd
RT @laurengayle23: I don't know what our office will do without tacofridays. Miss you @MexicoBlvd  https://t.co/fiJv2YnxbU	1447435200	665217561429192704	f	mexicoblvd
RT @DeanRayBraun: We all know the FoodTruck business is a tough one, but @WSJ shines light on the issues. https://t.co/Ydg1yWOlN0	1447372582	664954921578536969	f	mexicoblvd
RT @myfinanceguru: Supply and demand...permitting woes.\nFood truck sells last taco, citing high operating costs, parking hassles https://t....	1447357318	664890902431842304	f	mexicoblvd
https://t.co/3vWkc3ah4n	1447256246	664466972457967617	f	mexicoblvd
RT @KennyEvitt: @MexicoBlvd My Tuesday's will never be the same now without your delicious tacos. I miss you my friends! Viva el Boulevard!	1447179023	664143075837673473	f	mexicoblvd
Mexico Blvd. @DistriktHotel Events, Catering and more! https://t.co/l0w8fMdm0O	1447171827	664112895903559681	f	mexicoblvd
Catering @MexicoBlvd https://t.co/6mFtL0TFuq	1446833087	662692115412090881	f	mexicoblvd
RT @chelsodon: Just learned my fav foodtruck @MexicoBlvd was forced to close. @nycgov why hurt small businesses like this? reform https:/...	1446745359	662324157624016896	f	mexicoblvd
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
We're downtown @ the DA's office on Hogan & Centre st. lunch w/us! mamuthai NYC noodles thai Till 3.  I fought the law & the law won..	1460042668	718097116946677762	f	mamuthainoodle
We are off the streets today for a private event. We like to party. See you tmrw! mamuthai	1459952309	717718121075879936	f	mamuthainoodle
17th & 5th again! Come get some Union square! mamuthai	1459872929	717385176691699712	f	mamuthainoodle
Hello Monday! We're on 17th/Broadway. Raining slightly. Don't let that stop u! U gotta eat! Come by for your Thai noodle lunch mamuthai	1459784722	717015209945206784	f	mamuthainoodle
Hello Monday! We are on 17th &5th today. Rain has stopped! Come by for your Thai noodle fix! mamuthai	1459180908	714482633271541762	f	mamuthainoodle
We are @dumbolot on this Good Friday. Come join us for lunch! mamuthai 11:30-2:30pm	1458919004	713384128213856256	f	mamuthainoodle
Office lunch catering. Write us if you want your office to have this in the break room. mamuthainoodle@gmail.com https://t.co/1PpQP421FU	1458328625	710907896977104896	f	mamuthainoodle
Late tweet: we are @dumbolot Start your weekend right! Stop by for your noodle! mamuthai	1458319294	710868759926407169	f	mamuthainoodle
Oops, false info. We are on 47th & Park! Come by midtown! mamuthai	1458233296	710508059391606784	f	mamuthainoodle
Sorry folks, no truck today.  stop by our shop in Astoria for your mamuthai fix!	1457961871	709369620315172864	f	mamuthainoodle
Dumbo! It's a beautiful Friday for Thai noodles 11:30-3pm join us @dumbolot mamuthai	1457712182	708322349054091265	f	mamuthainoodle
Hello Union Sq. it's a beautiful Monday! Come by for the hottest, freshest thai noodles in town! mamuthai on 17th&Broadway 11:30-2:30pm	1457367796	706877887224352769	f	mamuthainoodle
Hellooo LIC! We are @BigAliceBrewing tonight to serve hot & fresh noodles! Have a beer and a bowl off the wok! mamuthai	1457220421	706259754088157184	f	mamuthainoodle
Hey NYC, we are on 57th Btwn 6th&7th today for the NYC Drone Film Festival! Come by and get some! @NYCDRONEFF mamuthai	1457211959	706224259161526272	f	mamuthainoodle
Thursday peeps we are back! It's been a while, come say hi! uptown hospital east noodle lunch	1457023264	705432817967173632	f	mamuthainoodle
Hello Union Sq! It's been a while but We are in 17th & Broadway today! Come by for you thai noodle lunch! HappyMonday	1456765697	704352502985191424	f	mamuthainoodle
Hello Dumbo, snow has stopped in time for your hot noodle lunch join us @dumbolot mamuthai	1454690241	695647408013893632	f	mamuthainoodle
Hello uptown Tuesday noodle lovers! We are here for your noodle needs! mamuthai	1454431093	694560463586213888	f	mamuthainoodle
@MikelbcWilson even if you drop them, @ShopKeep will continue to debit monthly fees from your account. Still doing it to us 6 months later.	1454357987	694253833304805381	f	mamuthainoodle
. @ShopKeep having major issues w/Shop Payments through you guys. You guys have been taking money from our account for months. Please advise	1454357746	694252822972493826	f	mamuthainoodle
Thanksgiving centerpiece????\nthanksgiving holiday falafel centerpiece vegan vegetarian https://t.co/2rxLHp7Yf1	1448293901	668819215080624128	f	thepocketful
The Parthenon: hummus smothered under Greek salad with fresh crumbled feta and kalamata olives.... https://t.co/jmbuGrAfT5	1448034181	667729869330083840	f	thepocketful
Fresh Cabo-guacamole,corn salad,salsa,jalapeno,nachos, all under delicious hummus.vegangluten-free... https://t.co/K8cnfIfGNW	1447775456	666644697864097794	f	thepocketful
Light,Fresh,Crisp. Come  sample the falafel. 152grams vegan falafel https://t.co/1D12EhPQ3j	1447690621	666288876827320320	f	thepocketful
Why is our food delicious? We make it all from scratch. ny 152grams dailyfoodfeed  eater... https://t.co/PPlAFA82hq	1447336875	664805156433866752	f	thepocketful
Our signature mix, iceberg, baby arugula  and red cabbage, enjoy. https://t.co/dY9oEhHlb8	1447263626	664497928086646784	f	thepocketful
Chop and then toss, making the freshest salad mix https://t.co/EdzARVmF6m	1447173163	664118499506307072	f	thepocketful
Chopping the freshest ingredients ever!\nthe pocketfulvegetarian saladshummus https://t.co/czQa8REo4e	1447080273	663728888292487168	f	thepocketful
Last days of summer pocketful https://t.co/TtMH226eye	1446831671	662686179180077056	f	thepocketful
Anticipation! That first bite awaits. https://t.co/8HArzrnOGb	1446741385	662307490848182272	f	thepocketful
Another beautiful day to enjoy alfresco dining.pocketful hummus vegetarian https://t.co/AKamzETbQ2	1446652521	661934767324184576	f	thepocketful
Beautiful day, beautiful girl, amazing food!pocketfulveganhummus  https://t.co/tzgM0cvE8Y	1446566269	661572999217291264	f	thepocketful
Sandwich or bowl? It's all healthy. https://t.co/HKwIfONEg0	1446480290	661212379536089089	f	thepocketful
Macho men unzip too. https://t.co/OH24VMj250	1446222982	660133149503070208	f	thepocketful
70 degrees and sunny now. Unzip with this great weather. falafel hummus sandwich lunchbox https://t.co/TaoixidJpe	1446131989	659751499589926912	f	thepocketful
65 and sunny today. Unzip yourself on 50th &6th.  healthyeating hummus pita https://t.co/ZUOb9N5a8z	1445956365	659014876124323840	f	thepocketful
Unzipping on 50th today! glutenfree vegan falafel vegetarian healthyfood @ Le Pain Quotidien -... https://t.co/X4YMM83grQ	1445869953	658652440670117888	f	thepocketful
Keep on trucking https://t.co/FTNd78SBz0	1445785666	658298915280826368	f	thepocketful
@alexaizenberg @ThePocketful appreciate it!	1444673668	653634857592078337	f	thepocketful
Our cart is up and running on 50th!!!!!@	1438095791	626045239069966336	f	thepocketful
@46 bet 5&6 Ave from 11:30-3:15 order online @www.schnitzi.com schnitzitruck schnitzel foodtruck kosherfood download our app	1460038874	718081201777610753	f	schnitzi1
@DUMBOLOT Brooklyn Jay&water St serving lunch, order online @www.schnitzi.com schnitzitruck foodtruck kosherfood	1459951678	717715473798995970	f	schnitzi1
Brrr it's cold @46 so get some warm Schnitzi sandwich serving lunch 11:30-3:15 order online @www.schnitzi.com schnitzitruck foodtruck	1459864395	717349383541538816	f	schnitzi1
Guys today we are @Hanover Sq , 11:30-3:15 order online @www.schnitzi.com schnitzitruck foodtruck kosherfood schnitzel	1459779001	716991215221227521	f	schnitzi1
Guys today we are on 46 bet 5&6 Ave, get ready for some nice weather 11:30-3:15 order online @www.schnitzi.com schnitzitruck	1459434752	715547329030406144	f	schnitzi1
Guys today we are on 46 bet 5&6 Ave, get ready for some nice weather 11:30-3:15 order online @www.schnitzi.com schnitzitruck foodtruck	1459434618	715546770210734080	f	schnitzi1
@DUMBO Jay & water serving lunch today, order online @www.schnitzi.com schnitzitruck foodtruck  schnitzel glattkosher	1459346487	715177119383478272	f	schnitzi1
@DUMBO serving lunch today, order online @www.schnitzi.com schnitzitruck foodtruck kosherfood schnitzel glattkosher	1459346373	715176642176540673	f	schnitzi1
@46 St bet 5&6 Ave serving lunch from 11:30-3:15 order online @www.schnitzi.com schnitzitruck foodtruck kosherfood	1459262072	714823059606224896	f	schnitzi1
@46 St bet 5&6 Ave serving lunch from 11:30-3:15 order online @www.schnitzi.com schnitzitruck foodtruck kosherfood schnitzel	1459260346	714815819948146688	f	schnitzi1
Yes Hanover Sq we are here serving lunch from 11:30-3:15 order online @www.schnitzi.com schnitzitruck foodtruck kosherfood	1459173484	714451493370347521	f	schnitzi1
Happy Purim everyone today we are @46 St bet 5&6 serving lunch from 11:30-3:00 order online @www.schnitzi.com schnitzitruck schnitzel	1458827931	713002138591477760	f	schnitzi1
@DUMBO Jay and water St serving lunch, order online @www.schnitzi.com schnitzitruck schnitzel foodtruck kosherfood dumbolot	1458742619	712644312727728128	f	schnitzi1
@46 St bet 5&6 Ave serving lunch from 11-3:15 order online @www.schnitzi.com schnitzitruck schnitzel foodtruck kosherfood	1458655909	712280625751973890	f	schnitzi1
@hanover Sq serving lunch from 11:30-3:15 order online @www.schnitzi.com schnitzitruck schnitzel foodtruck kosherfood	1458568655	711914657368432641	f	schnitzi1
ATTENTION Midtown today Thursday St Patrick's day we will not be able to park there, so instead we are @Hanover Sq serving lunch 11:30-3:15	1458221605	710459023271788544	f	schnitzi1
@DUMBO serving lunch, Jay and water St order online @www.schnitzi.com schnitzitruck schnitzel dumbolot kosherfood	1458137897	710107928020316161	f	schnitzi1
Today @46 St bet 5&6 serving lunch from 11:30-3:15 order online @www.schnitzi.com or download our app schnitzel kosherfood foodtruck	1458049031	709735196258660352	f	schnitzi1
@ReuvenBlau yes we are	1457976131	709429429735444480	f	schnitzi1
@Hanover Sq serving lunch from 11:30-3:15 we know it's raining so order online @www.schnitzi.com schnitzitruck foodtruck kosherfood	1457964857	709382145907814400	f	schnitzi1
RT @gogobot: Great recap on GogobotTurns5 NYC Field Trip By: @vinoron https://t.co/yVBcaRw5jZ  @TheRideNYC @CamionNYC https://t.co/pV0SLC...	1447083321	663741675425153024	f	camionnyc
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
Thanks to livefastgroup and centerplate we will be vending @NY_Comic_Con from this Thursday though... https://t.co/ZByGL1PYsB	1444309809	652108720768446464	f	camionnyc
Come and enjoy the tristate areas best food trucks  foodtrucksrule tristatemashup mashup tristate... https://t.co/5TFWKaUr1S	1444268431	651935170380079104	f	camionnyc
Thanks to livefastgroup and centerplate we will be vending @NY_Comic_Con from this Thursday though... https://t.co/DGX7JfGKuS	1444229776	651773038803963906	f	camionnyc
We are open at 55th street and Broadway. Come!!!	1460113346	718393561985716225	f	carpedonutnyc
We are open at 51st street and Park avenue. Come!!!	1460026659	718029970073845760	f	carpedonutnyc
We are open at 23rd street and Park avenue south. Come!!!	1459941037	717670845125005312	f	carpedonutnyc
We are open at Bergen and Court. Come!!!!	1459685681	716599803396890624	f	carpedonutnyc
We are open at Bergen and Court. Come!!!	1459598835	716235542606774273	f	carpedonutnyc
We are open at 55th street and Broadway. Come!!!	1459508388	715856180644544513	f	carpedonutnyc
We are open at 51st street and Park avenue. Come!!!	1459422754	715497009009061888	f	carpedonutnyc
We are open at Bergen and court street. Come!!!	1458994701	713701622728290304	f	carpedonutnyc
Open at 55th street and Broadway. Come!!!	1458903480	713319014513172481	f	carpedonutnyc
Open at 51st street and Park avenue. Come!!!	1458818640	712963170969759744	f	carpedonutnyc
We are open at 23rd street and Park avenue south. Come!!!	1458731703	712598528204341248	f	carpedonutnyc
We are open at N.4th street and Bedford avenue,Williamsburg. Come!!!	1458474828	711521115915603968	f	carpedonutnyc
We are open at Bergen and Court street. Come!!!	1458388185	711157709312237568	f	carpedonutnyc
Check us out on @Postmates for a donut delivery.	1458300158	710788496961753088	f	carpedonutnyc
We are open at 55th street and Broadway. Come!!!	1458297389	710776885979049984	f	carpedonutnyc
We are open at 51st street and Park avenue. Come!!!	1458213065	710423205111074817	f	carpedonutnyc
Check us out on @Postmates for a donut delivery starting today!	1458127571	710064618018873346	f	carpedonutnyc
We are open at 23rd street and Park avenue south. Come!!!	1458125561	710056185219698688	f	carpedonutnyc
We are open at N.4th street and Bedford avenue. Come!!!	1457870010	708984328458518528	f	carpedonutnyc
We are open at Bergen and Court street. Come!!!	1457786683	708634830095970304	f	carpedonutnyc
We will warm u up tomorrow @smorgasburg with our delicious quinoa & multigrain arepas with toppings. arepas https://t.co/TjAwixHFIC	1460149534	718545342787108865	f	palenquefood
This coming cold Saturday we will be @smorgasburg with our delicious and famous arepas Multigrain w/shrimp & avocado https://t.co/zPocGMSex2	1460048259	718120565555531777	f	palenquefood
RT @chickpeanolive: Lunch is served. Missing arepas from our smorgasburg neighbors @palenquefood. So we whipped up a... https://t.co/aYzITQkz...	1456481650	703161122367475714	f	palenquefood
RT @NewYork_Fatty: daydreaming of summer and @palenquefood.\n\ntbt nyc newyork foodie brooklyn arepas summer smorgasburg   http...	1456481622	703161004050423808	f	palenquefood
palenque @GansMarket https://t.co/5gQ89JKON3	1447433243	665209355051081728	f	palenquefood
today @palenquefood: empanadas urbanspacenyc with chicken or beef or cheese 33 st & Broadway https://t.co/zCqMFbdXRq	1447340054	664818489954168832	f	palenquefood
palenque @ rockaway https://t.co/5G7qWcqwp2	1446551434	661510778042757120	f	palenquefood
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
@GansMarket https://t.co/dwmr0X9vO3	1442414801	644160483604475904	f	palenquefood
https://t.co/dwmr0X9vO3	1442406985	644127700651769856	f	palenquefood
RT @NomNomNYCgirls: We pretty much live at @smorgasburg  Quinoa Arepa w/ Jumbo Shrimp smorgasburg prospectpark brooklyn foodporn http...	1441816546	641651220290109440	f	palenquefood
Scream it from the rooftops it's  CHEESESTEAK FRIDAY  folks! Bdwy / 55th st @randomfoodtruck @DefJamRecords... https://t.co/dt3GUCQikH	1460127556	718453162336759808	f	carlssteaks
Great news folks, LIL CARL passed inspection today!! So we will have... https://t.co/jpxbFx5LZx	1460065440	718192626680381440	f	carlssteaks
@tpasik 49th st bet 6th / 7th av	1460050784	718131154373754880	f	carlssteaks
We love Thursday one day closer to the weekend! 49th st bet 6th / 7th av @SIRIUSXM @MHFI @UBSamericas @barclays... https://t.co/9s02OH1B8A	1460043378	718100092415254528	f	carlssteaks
RT @luleegirl: When you can't get to yankeestadium  https://t.co/GTJkOe5PRo	1459975020	717813378044063745	f	carlssteaks
Happy Hump day folks 47th st bet lex / park av @mlb @nfl @UBSamericas @barclays cheesesteak love for all GOT... https://t.co/dQIzCDkPBi	1459953416	717722765080600576	f	carlssteaks
Stay warm during this Polar Vortex and grab a piping hot carls famous cheesesteak the Stadium or our Food Truck... https://t.co/rq8rx9qm3l	1459873113	717385949664174081	f	carlssteaks
Opening Day may have been postponed but still able to showcase our new menu items today thanks to WPIX CH. 11... https://t.co/JRbeunVb7f	1459789430	717034959505121280	f	carlssteaks
Start your week off right w a Carl's famous cheesesteak! 52nd st bet 6 / 7 av @SIRIUSXM @MHFI @UBSamericas... https://t.co/Dw8pgxwieU	1459780130	716995949491535873	f	carlssteaks
Scream it from the rooftops it's  CHEESESTEAK FRIDAY  folks! Bdwy / 55th st @randomfoodtruck @DefJamRecords... https://t.co/nfeV4AfwUF	1459521696	715912001332113408	f	carlssteaks
https://t.co/a1qeGzV6Gc	1459468152	715687420994396160	f	carlssteaks
https://t.co/SbNb8Z9cbO	1459454624	715630679007105024	f	carlssteaks
Check it out!\n\nhttps://t.co/hofklZBcFI	1459454594	715630554905976833	f	carlssteaks
We love Thursday one day closer to the weekend! 49th st bet 6th / 7th av @SIRIUSXM @MHFI @UBSamericas @barclays... https://t.co/fOnmJ1wNH0	1459433867	715543620619804676	f	carlssteaks
Happy Hump day folks 47th st bet lex / park av @mlb @nfl @UBSamericas @barclays @SIRIUSXM cheesesteak love for... https://t.co/H8BcPFkHHy	1459349037	715187814233718786	f	carlssteaks
Flat Iron today, 5th av and 20th st, so come by grab a Carl's famous cheesesteak! GOT WHIZ? NYCBEST GOTWHIZ https://t.co/qwcvRDoFK8	1459261932	714822471229313025	f	carlssteaks
Start your week off right w a Carl's famous cheesesteak 52nd st bet 6 / 7th av @UBSamericas @barclays @SIRIUSXM... https://t.co/wz9Ly5t8z9	1459177217	714467149943803904	f	carlssteaks
Great day in the city , stop by Union Sq West , 17th and Broadway  and grab a Carl's famous cheesesteak! GOT... https://t.co/SNdflvrG3Y	1459006817	713752439418183680	f	carlssteaks
RT @Chefsamirtruck: We are on Broadway between 55st and 56st !!the original trucks\n@Foodtruckgirl7 @carlssteaks @souvlakitruck @Sexyfoodtru...	1458921841	713396027638870016	f	carlssteaks
Scream it from the rooftops it's  CHEESESTEAK FRIDAY  folks! Bdwy / 55th st @randomfoodtruck @DefJamRecords... https://t.co/wzXn5sq86D	1458915447	713369205744263169	f	carlssteaks
@DKinskeyLebeda we're in the cafeteria for Amex, at 200 vesey st.	1453065384	688832266160705536	f	mactruckny
Vending today, tomorrow, and tuesday at the jacob Javits center for the retail show. 11:30 -2:30 macncheese	1453046008	688750994558181376	f	mactruckny
If you're in the Amex building on the west side, mac n'cheese tuesdays and thursdays in the cafeteria @BrookfieldPLNY	1452012107	684414502515945476	f	mactruckny
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
Change of plans!  Pier is closed this weekend, soft open next Saturday!	1459367524	715265357221593088	f	nautimobile
RT @ExposureNJ: foodtruckmashup - Here's another reason we love food trucks! @NautiMobile 's amazing lobster rolls! https://t.co/7OKgCm3v...	1459288138	714932386472058884	f	nautimobile
Great news everyone! Pier13 in Hoboken is opening early this year! We'll be there on the first Saturday of April. Come get it summer of '16	1458583436	711976650800500738	f	nautimobile
Heard you're a fan of biscuits, tang and lobster? Then why aren't you here at @RoyalPalmsClub?We're here now, and will be ALL day and night!	1457208385	706209271604748288	f	nautimobile
RT @LukesLobster: Have you downloaded the LukesLobsterApp? Download now on iPhone or Android to track your visits and earn rewards!	1452371496	685921885926850560	f	nautimobile
So excited for our return to Gowanus's @RoyalPalmsClub tonight! Serving at 6 until late night!	1452291693	685587170430726148	f	nautimobile
Hey uptown Hoboken! We are hanging out selling rolls up on Sinatra and 13th right by the water!	1451686112	683047177485217792	f	nautimobile
Been silent here for a bit. Nauti has been under some serious repairs. We are back on the road today at Mercedes Benz in Montvale! Classy!	1449672529	674601600615325696	f	nautimobile
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
RT @dumbolot: We have @mamuthainoodle ,@SweetChiliNYC and @PontiRossiFood  at Dumbo today.	1460128701	718457961950146560	f	pontirossifood
RT @mikefaley: @PontiRossiFood hell yes! today i encouraged my boss @aok5557 to join and he also purchased food with money and enjoyed it.	1459991371	717881959024820225	f	pontirossifood
@mikefaley oh and WE LOVE YOU VERY MUCH TOO 	1459967464	717781684624736256	f	pontirossifood
@mikefaley really, thank you so much ! I am glad you love our food so much ! 	1459967013	717779796898525185	f	pontirossifood
@mikefaley Ciao Mike, thanks so much for this tweet. LYou made my day,month and year!Truly appreciate next time you come let me know! Ale	1459966996	717779723028406272	f	pontirossifood
RT @dumbolot: Cold outside so grab something warm from Dumbo! Today we have @SweetChiliNYC , @KimchiTruck and @PontiRossiFood	1459868049	717364711243792386	f	pontirossifood
@Yelp how is it possible that you take away all our review wrote by our loved customers ?Only because I don't want to pay for your services	1459739210	716824319008096256	f	pontirossifood
PontiRossi is happy to announce we're finally on Seamless UberRush Grubhub Delivery.com!! Place your orders!!! https://t.co/Ihv5XnUH31	1459534077	715963930586320896	f	pontirossifood
Repost Thank you for the customerlove. Were glad to serve pur clients! Dumbo PontiRossi Carbonara Arrabiata https://t.co/gxVKUAWljU	1459369829	715275024433852417	f	pontirossifood
RT @dumbolot: Half way through the work week, at Dumbo today we have @DomoTaco ,@PontiRossiFood , and @Schnitzi1 !	1459352191	715201042774929408	f	pontirossifood
RT @dumbolot: Come eat at Dumbo today! We have @PontiRossiFood ,@SweetChiliNYC ,and @KimchiTruck !	1459264819	714834582034649088	f	pontirossifood
@drivingmehungry come try our pasta when you get a chance ! Ciao bello 	1459208332	714597656069320704	f	pontirossifood
La pace si rivela e si offre a coloro che realizzano, giorno dopo giorno, tutte quelle forme di pace di cui sono capaci. Cit. Papa GPII	1459082174	714068510780039168	f	pontirossifood
Our mission to the UnitedNations. Serving you lunch today! Come get your  PontiRossi Italian FoodTruck https://t.co/GpnbQ4ySvk	1458846205	713078783906082817	f	pontirossifood
@margotungsten come try our cacio e pepe, gnocchi and lasagna  we looking forward to hearing your opinions about it ! Ciao	1458769117	712755455743901697	f	pontirossifood
RT @Sous_HQ: Outstanding Carbonara and Arrabiata from @PontiRossiFood for lunch in the @dumbolot  https://t.co/dm1LN6zToF	1458757350	712706099972063236	f	pontirossifood
RT @evabin: Pugliesi from the @PontiRossiFood truck in DUMBO for lunch. Spicy and delicious. foodie Italian https://t.co/EHqjGbhlyR	1458753097	712688261718740992	f	pontirossifood
@Acqua_Lete salve, dove possiamo acquistare all'ingrosso la linea sorgesana nella citta' do New York ? Grazie	1458483205	711556251470192640	f	pontirossifood
@scottspizzatour see you soon Amico ! 	1458483046	711555586530402304	f	pontirossifood
RT @scottspizzatour: @PontiRossiFood @514 Rad I'll come soon!! Will be great to see you and eat pasta!!	1458483024	711555495652409345	f	pontirossifood
Have been getting alot of calls lately thanks for the continued patronage but the foodtrucks are no longer on the road get ur yumyum	1446923016	663069305953763329	f	hibachiheaven
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
Hello midtown. We're at 46th and 6th Ave. We'll be chicken slinging from 11-3 so come and get it. chocolatepuddingpie chickentenders nyc	1459954229	717726176509370369	f	usafoodtruck
RT @Lo_Bello: Lovin' the new Carolina Spicy Honey Mustard at @USAFoodTruck! Do yourself a favor and try it https://t.co/7RBfJFGnzy	1459883203	717428268740255745	f	usafoodtruck
What sauce are all of you all-American chicken lovers most excited to try with your tenders? poll election NYC	1459870278	717374058602606592	f	usafoodtruck
Introducing Samurai Teryaki and Carolina Spicy Honey Mustard. Gonna be perfect for your tenders! newsauce growing https://t.co/hp83USoc6q	1459870174	717373624316010497	f	usafoodtruck
Hey y'all! We're at Old Slip and Water today with something new! We'll be open from 11-3 slinging tenders with two new sauces. YDD nycfood	1459869249	717369745037795328	f	usafoodtruck
@Dave_Ockrim youre special.	1459800323	717080644568875008	f	usafoodtruck
The rains got us staying in queens today. Sorry y'all. The announcement will have to wait till tomorrow. staydry	1459781618	717002191807070208	f	usafoodtruck
Have a nice weekend y'all. We're off the street until Mon, but stay tuned because we've got a big announcement. takingoff ydd nyc food	1459520652	715907622839455744	f	usafoodtruck
That is what clean oil looks like. We use peanut oil. Higher quality. More expensive. We give the best to our peeps. https://t.co/X4WEYThUNH	1459435967	715552428406530048	f	usafoodtruck
Come and get the chicken at Water St and old Slip. We'll be open from 11-3. Fresh oil. Fresh chicken. Gonna be on point today. bestinnyc	1459435438	715550207396691968	f	usafoodtruck
Hey Midtown! We're at 46th and 5th/6th today. Hump day schump day. Our tenders will give ya the protein to get through the day strong. NYC	1459351090	715196427761225728	f	usafoodtruck
We're at water and old st. We know it's windy, but you know you'll be blown away by the chicken and we have Chocolate Pudding Pie today!nyc	1459264264	714832253877166080	f	usafoodtruck
@StephenLutchman sure will be.	1459264211	714832031318978560	f	usafoodtruck
Hey everyone--it's rainy out today, but we've got the perfect food to get ya through this gloomy Monday. We're at 46th in b/w 5th & 6th usa	1459177300	714467499480326145	f	usafoodtruck
@Coach_DH did ya find us?	1458842004	713061165715365888	f	usafoodtruck
Old Slip and Water St today. We'll be here from 11-3. Come and get it hot and fresh.	1458833000	713023398461513729	f	usafoodtruck
Hey everyone! We're in midtown for Hump Day. 47th and Park and we'll be here until 3.\nNyc food chickentenders americanfood swolefoods	1458746337	712659909721079808	f	usafoodtruck
Downtown! We know it's cold so we've got our piping hot chicken tenders ready for you at old slip and water. Come and get it. YDD chicken	1458661083	712302328972451840	f	usafoodtruck
46th and 5th/6th is the move today for the best chicken tenders you'll ever have. We'll be here till 3.\nallamericangoodness uniquenewyork	1458313621	710844966294200321	f	usafoodtruck
RT @Lo_Bello: Different truck, same great food! @USAFoodTruck https://t.co/8RTdNuBNSG	1458235883	710518911071088640	f	usafoodtruck
https://t.co/Uv7VGLReRG https://t.co/jF4JQUy3Dy	1450319297	677314341662773251	f	toastmonsternyc
Check out Toast Monster on Korean TV show: \nhttp://t.co/hM2ad1OAJM	1428680926	586556433107394560	f	toastmonsternyc
@jack_of_knaves Looks great! Can't wait to see more.	1425314475	572436516129132545	f	toastmonsternyc
@jack_of_knaves also http://t.co/JWTNKENR9H is very awesome.	1425314193	572435332957913088	f	toastmonsternyc
@jack_of_knaves Herros! Good mornings! Regrettably, we are not back.	1425314163	572435209674756098	f	toastmonsternyc
http://t.co/KiM4LqdgDl	1425313099	572430745106554880	f	toastmonsternyc
RT @ConesBrigade: Dear @toastmonsternyc where are you?Please find your way back to midtown. I miss you. Life just hasn't been the same with...	1424927219	570812247452332032	f	toastmonsternyc
Dear @ConesBrigade Thanks, we appreciate the love. We hope to be back soon. Sending tweet and post card from the Moon http://t.co/SJvPmhgxGa	1424927012	570811378715500544	f	toastmonsternyc
@jimmykimmel is the true that you are part of a team much like the Marvel Avengers? If so, what is your super power?	1424475386	568917120303681536	f	toastmonsternyc
Follow @toastmonster_kr for more toastmonster monsterness!	1424432240	568736154155134977	f	toastmonsternyc
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
@justyniak hey Justyna! We missed you this winter. Next week's weather will be perfect for steaks too. Just a few more days!	1460035871	718068604760141824	f	philssteaks
RT @justyniak: @PhilsSteaks I'm actually ready for you today ... This weather is SCREAMING Philly cheesesteak 	1460035799	718068306092154880	f	philssteaks
RT @ENM1971: @PhilsSteaks Perfect timing for us, yippi yeah, as we arrive NY from Norway, on sunday  Can't wait to try your cheesesteaks!	1459990839	717879729873936387	f	philssteaks
Passed inspection w/flying colors! Few more things to take care of b4 launching Monday - stay tuned for location and get ready for steaks!	1459955600	717731926606548993	f	philssteaks
Spring launch update: as much as we want to hit the streets right now, we are still waiting for an inspection... https://t.co/MLP6NoqwiM	1459440038	715569500729413632	f	philssteaks
Do you speak philly??? jawn slang https://t.co/GELUlf48ja	1457453261	707236354191716354	f	philssteaks
Mmm love those steaks from Jim's! inspiration https://t.co/XLtBefq4jj	1456603803	703673469066571776	f	philssteaks
April 1 is too far away - had to make a trip to the Mecca! cheesesteak craving jawn mecca https://t.co/icfCelbCgK	1456603751	703673251768053761	f	philssteaks
RT @ENM1971: @PhilsSteaks We're coming from Norway to visit NY in April, and would just LOVE to try your cheesesteaks  When in April do U ...	1455832037	700436449624268800	f	philssteaks
@ENM1971 should be April 1. We are looking forward to your visit! Stay tuned	1455832026	700436402429890560	f	philssteaks
@LaColibri we are too! Can't wait to be back on the streets slanging the gooey goodness! See you in April!	1455819178	700382513701744641	f	philssteaks
RT @LaColibri: Anxiously awaiting for spring!  Oh where can @PhilsSteaks be!  ilovemesomephilssteaks	1455819120	700382271132606464	f	philssteaks
A Philly News Station Wonders, 'What Is Jawn?' https://t.co/1VAUu4QE90	1455818621	700380177252098048	f	philssteaks
RT @chrstphr_: I would commit multiple acts of sin for some @PhilsSteaks right now	1455049053	697152375325401088	f	philssteaks
Can't get ur Phil this winter but u can still eat good! Check r friends @sotnyc and their new spot on e38th. burgers, dogs, shakes n Poke'	1447188854	664184309671137280	f	philssteaks
@CR_FromThe_DR unfortunately the weather doesn't call the shots. The NYCDOH does and they say our permit is only good from April - October!	1447188505	664182845896794112	f	philssteaks
@Ash52Tori sorry we have to make you wait until Spring. But, absence makes the heart grow fonder and the stomach grow hungrier!	1446679625	662048451232997376	f	philssteaks
RT @Ash52Tori: @PhilsSteaks Really wish I had one of your steaks right now	1446679538	662048084088782848	f	philssteaks
RT @justyniak: @PhilsSteaks Looking forward to seeing you in FiDi !!! Btw yday' lunch was off the charts ! 	1446255824	660270900860870656	f	philssteaks
@LaColibri thank you! We love to hear that. See you in 2016!	1446234849	660182925212819456	f	philssteaks
Our favorite spoon at the bakery is in charge of all the chocolate chippers!!! https://t.co/0Wq9SHjZWs	1460158131	718581403777110018	f	thetreatstruck
!!! Have a great weekend, everyone! Our truck has just private events, so we'll see you all next week !!!	1460156506	718574585675956224	f	thetreatstruck
!!! Fri April 8th 12-3:30 45th st & 6th Ave !!!	1460126513	718448787405070337	f	thetreatstruck
@BrianHunterNHL thank you so much, Brian! Thanks for being such a wonderful customer all these years!!!	1460041707	718093084807073792	f	thetreatstruck
RT @BrianHunterNHL: Thanks to @TheTreatsTruck for satisfying my sweet tooth for all these years! A must-try for those in NYC area. https://...	1460041635	718092781739237377	f	thetreatstruck
!!! No truck today because of the weather! Be back tomorrow !!!	1460034912	718064585828339717	f	thetreatstruck
!!! 18th st & 7th ave! Come on by! Here 'til 7pm !!!	1459973647	717807618618736641	f	thetreatstruck
!!! Wed April 6th 12-3:30 45th st & 6th Ave! Then 4:30ish-7pm 18th st & 7th Ave !!!	1459953109	717721477445984256	f	thetreatstruck
!!! Private event today! Truck spots tomorrow !!!	1459861185	717335922296156160	f	thetreatstruck
!!! Have a great weekend, everyone! We'll see you at the truck next week !!!	1459601130	716245171151716352	f	thetreatstruck
!!! Fri April 1st 12-3:30 45th st & 6th Ave! Then 4:30ish-7pm 18th st & 7th Ave !!!	1459523003	715917482775674880	f	thetreatstruck
!!! Fri April 1st Headed to our spots! (p.s. All our treats are made with spinach today!) !!!	1459515450	715885804007120896	f	thetreatstruck
!!! 3-7pm Bway (86 & 87th) !!!	1459450452	715613183029981184	f	thetreatstruck
!!! Thurs March 31st UWS day! 1-2:30pm Bway (82&83) and 3:30-7pm Bway (86&87) !!!	1459442361	715579245146284034	f	thetreatstruck
!!! Wed, March 30th we have a private event today! We'll have truck spots tomorrow !!!	1459352455	715202152852013057	f	thetreatstruck
!!! We'll have truck spots this week !!!	1459180460	714480752897843200	f	thetreatstruck
!!! Our truck is on vacation this week! You can email or call for delivery orders! See you next week at the truck !!!	1458733746	712607100246106112	f	thetreatstruck
!!! Have a great weekend, everyone! Our truck is on vacation !!!	1458393202	711178752550633472	f	thetreatstruck
!!! Fri March 18th 4-7pm 18th st & 7th ave !!!	1458331505	710919977872859140	f	thetreatstruck
!!! Our truck will be on vacation next week, so come on by for treats today !!!	1458315967	710854804197793792	f	thetreatstruck
RT @TwoBuckaroo: The $2 bill inspires excitement and guilt @thesteelcart  today on Two Buckaroo: https://t.co/AKoMfHTTol https://t.co/lxag...	1455214495	697846289413746688	f	thesteelcart
RT @holyshityouguys: @thesteelcart i miss you guys!	1449096767	672186679738826753	f	thesteelcart
@holyshityouguys Miss you too Dan!	1449096746	672186592719536129	f	thesteelcart
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
RT @biggangVH1: Everyone in NYC needs to taste these Crepes @TheCrepesTruck Amazzzingggg!!! Thank you again http://t.co/qkYGcaWOVK	1456676717	703979292686995456	f	thecrepestruck
RT @TheNewPotato: Best NYC Crepe Spots ctd @TheCrepesTruck @BrooklynCrepe @goldencrepes @ArtopolisNYC @nyccrookedtree @DeliceSarrasin https...	1456676689	703979175913377792	f	thecrepestruck
Great way to say ThankYou with fresh crepes in the office. \n\ntarte cosmetics  Kissandmakeup campaign. https://t.co/c7nHlt2oFU	1456416786	702889064882528256	f	thecrepestruck
RIP Big Ang Angele Raiola. https://t.co/CjeNIXrsLv	1456078274	701469239534727168	f	thecrepestruck
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
Come visit the Crepes Truck today from 6-9pm at The Abington House Summer Series Event, 500 West 30th Street @2910AH AHartpark	1406726932	494474710109806592	f	thecrepestruck
Free Crepe Party for you and 500+ friends to celebrate Brazil's win over Germany.	1404853435	486616695726157825	f	thecrepestruck
AirFranceExpo And AirFrance have a promo truck giving out free ice cream today 1-2pm on 23 Street by Eataly. http://t.co/Qc5tzoxqLA	1403974584	482930526689689600	f	thecrepestruck
@SrjStar_Music   AirFrancegiving away free ice cream at Madison Park 1-2pm today	1403966479	482896531276955649	f	thecrepestruck
AirFranceExpo is giving away gree ice cream in Washington Square Park South	1403809240	482237024246976512	f	thecrepestruck
TheHub has a new show called KidPresident. Free ice cream today! http://t.co/YD9VJi4ad5	1403799737	482197164018655232	f	thecrepestruck
It's FreeFriesFriday! Join us on @LoyalTree + use code FREEFRIESFRIDAY to get free fries at the truck! http://t.co/fGizQekoe7	1422628122	561169136282501121	f	shadydawgnyc
We're parked on 47th Street in between Lexington and Park today!	1422628088	561168994456330240	f	shadydawgnyc
Today we're parked on Hudson Street and King Street! Stop by for some dawgs! Check out our menu: http://t.co/QaZQMWARyU	1422460394	560465632601600000	f	shadydawgnyc
@Amomonous we're parked on 46th Street and 6th Avenue today!	1421943798	558298870988701696	f	shadydawgnyc
We're parked on 46th Street and 6th Avenue today! Check out our menu: http://t.co/QaZQMWARyU	1421943748	558298660497539074	f	shadydawgnyc
@FordhamCSA, thanks for having us!!!  https://t.co/FuisbzzXJm	1460400046	719596065528356865	f	bigdsgrub
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
Check it out: @AmazonStudent is giving away ten $200 Amazon Gift Cards! NoPurchNec. https://t.co/hH03cubW1l	1454620030	695352922314412033	f	lobsterrolling
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
Good Morning NYC,\nWe are parked on W67st & Broadway today till 5pm. Come enjoy NYC Best Lobster Roll & Sliders. Try our Lobster Gazpacho 2.	1442667247	645219317232074752	f	lobsterrolling
Catering Valduccis delicious pasta @MrVsPizza @greenboxny https://t.co/93a1VJFuW1	1460161889	718597164126093312	f	valduccis
RT @MrVsPizza: @MrVsPizza in Staten Italy valduccis best @greenboxny @foodNfest @daily_food_porn @FeedYourKnead pizza https://t.co/pnM0...	1460035060	718065205687754752	f	valduccis
Heros salads appetizers dinners valduccis delicious @MrVsPizza @greenboxny @FoodPorn https://t.co/6h9c2yDAt1	1460034853	718064337672339457	f	valduccis
Follow Us to @MrVsPizza in Staten Italy 3080 Author kill Road 7189482002 valduccis delicious pizza @greenboxny https://t.co/XmlGGKKjP4	1459608824	716277441996656640	f	valduccis
We're are on 51 St and Park Ave lunch midtown @greenboxny @Cater2me @FoodPorn befair @CrespoMax @foodNfest https://t.co/vdTHFGbecR	1459439781	715568423095414784	f	valduccis
Let us catering your next event valduccis delicious @MrVsPizza @greenboxny @Cater2me @FoodPorn @FoodNetwork https://t.co/spXKjxN6D5	1459269628	714854751100342273	f	valduccis
Rent our new truck Valduccis Delicious we are a Crumbs Bake Shop zeppoli @MrVsPizza in Staten Italy yummmy https://t.co/GlGiggFcAY	1459092675	714112556923748352	f	valduccis
Saturday breakfast @MrVsPizza  our store in Staten Italy 3080 Arthur kill rd Valduccis delicious @greenboxny hot https://t.co/kffW9yqGvO	1459009499	713763688797306885	f	valduccis
RT @MrVsPizza: Rent our truck for your next event wedding graduation Valduccis delisious @greenboxny @Cater2me @Valduccis https://t.co/8s...	1458923215	713401789517799425	f	valduccis
bestcaters valduccis delishious @MrVsPizza @greenboxny @FoodPorn @FoodNetwork @foodNfest https://t.co/FXvsnXK2Nr	1458908606	713340513773072386	f	valduccis
Our new Pizzaiolo valduccis delishious pizza @MrVsPizza @greenboxny @FoodPorn @FoodNetwork https://t.co/ZGQlXrCdYf	1458747738	712665783994884096	f	valduccis
RT @MrVsPizza: We are a crumbs Bakeshop Valduccis @foodNfest @greenboxny @FoodEnvy_ @FoodPorn @Valduccis https://t.co/zp3HSg0gz7	1458596753	712032506795663361	f	valduccis
Best pizza @MrVsPizza @greenboxny @Valduccis https://t.co/WBaxQrE9Cs	1458588106	711996239378817024	f	valduccis
RT @TwoBootsHQ: @greenboxny @PizzaByCerte @NeaExpress @Valduccis Eyyyyyyyooooooo!	1458493245	711598365079896064	f	valduccis
Check us out on Instagram valduccis delicious @greenboxny @FoodPorn @Cater2me @MrVsPizza our store in Staten Italy https://t.co/wphxbusZDE	1458309909	710829397784272897	f	valduccis
Book you Summertime Party Now valduccis .com delishious pizzatruck @MrVsPizza @greenboxny @Cater2me @FoodPorn https://t.co/o2HmEXDyCh	1458271834	710669698858393602	f	valduccis
Call us for all your catering needs valduccis delicous pizza @greenboxny @Cater2me @FoodPorn @foodNfest https://t.co/4W66jXomll	1458218486	710445941359321088	f	valduccis
Rent our Truck valduccis delicious pizza @MrVsPizza @greenboxny @Cater2me @scottspizzatour @TonyGemignani https://t.co/IPD720cafo	1458147696	710149025794826240	f	valduccis
Congrats @nino coniglio @WburgPizza   @scottspizzatour @greenboxny @OrlandoFoods @Valduccis @PizzaToday https://t.co/x3CKVUO0oc	1457993890	709503917877497856	f	valduccis
Book your event now weddings AfterParty graduations birthdays batmitzvah @MrVsPizza @greenboxny @Cater2me https://t.co/KZPPRPAlBY	1457987762	709478213140029440	f	valduccis
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
Sorry, a bit late but today we are at Old slip and Water for lunch.	1460128442	718456875772211200	f	domotaco
MetroTech is our location today! Food!!!	1460037150	718073968956145664	f	domotaco
We're at @DumboLot today for lunch!  Fill yourself up on some tacos!	1459946312	717692970456129540	f	domotaco
Taco Tuesday! We're at Hudson and King today, come grab a taco!	1459860122	717331462752698369	f	domotaco
We're at 53rd and Park today, just a reminder we will be here every Monday from now on.	1459777085	716983177789751296	f	domotaco
Finally Friday, we're at Old Slip and Water today.	1459516709	715891081959833600	f	domotaco
53rd and Park for lunch today!	1459428208	715519883388317696	f	domotaco
We're at @DumboLot today! Come eat!	1459342896	715162057537150977	f	domotaco
RT @MathewKatz: @wallstreetchef @DomoTaco fairly sure it's crack (or heroin?)	1459342172	715159022140321793	f	domotaco
RT @ansentmike: Thank you @DomoTaco ..... Tempura battered fish quesadilla helped me correct the bad things in my life. It was everything ,...	1459260356	714815860729372672	f	domotaco
RT @wallstreetchef: Don't know what @DomoTaco puts in their tacos, but it ticks me off that I am unable to recreate their delicious taste @...	1459260319	714815706697703424	f	domotaco
RT @loubot: Chicken it's happening @DomoTaco https://t.co/VlWWy8Vk0p	1459260276	714815523331117057	f	domotaco
It's windy but at least it's not raining. Hudson and King today!	1459256580	714800021657542657	f	domotaco
Truck will be at 53rd and Park today, and for the foreseeable future every Monday here.	1459167992	714428457460047873	f	domotaco
The truck will not be out today for Good Friday.  Have a great weekend!	1458908530	713340193550573568	f	domotaco
It's Thursday, we will be at MetroTech today!	1458822845	712980806516490240	f	domotaco
Have a big office? No problem. This massive drop off for DoubleVerify included five types of rice bowls and... https://t.co/4oTg7ttEUO	1458751345	712680912417206273	f	domotaco
Today we're at DumboLot! Mmmm food...	1458739153	712629777522434049	f	domotaco
Hudson and King for some Taco Tuesday!	1458653393	712270071981338624	f	domotaco
Schedule a bit different today, we're at 53rd and Park Today!	1458569991	711920260509802496	f	domotaco
Lion dance performance in sunset park brooklyn, happy chinese New York. @ Grace Chinese Alliance... https://t.co/b2PIsuWhZ5	1455389469	698580182014283776	f	shanghaisogo
What should I do with those fish? https://t.co/HIoKeZmVZa	1453652981	691296826067124224	f	shanghaisogo
Saturday night, what else we need? @ Williamsburg NYC https://t.co/0LH5UxXokG	1453652893	691296457031200768	f	shanghaisogo
Happy birthday, MIKE! love this amazing restaurant & team.\nWe are a big family team @ DBGB... https://t.co/fJCfxyXGow	1453652798	691296056609542145	f	shanghaisogo
Tradition chinese street food: roasted Chestnut from a chinese auto roaster. So crazy yummy &... https://t.co/vhGbSeI24Q	1453652268	691293836459511809	f	shanghaisogo
Tuna ~ Tuna ~Tuna @ New York, New York https://t.co/1OlafWu9BY	1453652038	691292871840927744	f	shanghaisogo
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
Today we are parked on Broadway and W.55st.	1459262635	714825418998558722	f	eddiespizzany
We are parked on Hudson and King street today.	1458835904	713035579441557504	f	eddiespizzany
It's hump day! We are parked on E47st between Park and Lexington ave.	1458745461	712656232834666496	f	eddiespizzany
Today we are parked on Broadway and 55st.	1458658011	712289444779307008	f	eddiespizzany
TGIF! We are parked on W47st between Park and Lexington ave.	1458310884	710833486483984385	f	eddiespizzany
Today we are parked on Broadway and 55st.	1458057867	709772255224463360	f	eddiespizzany
Today we are parked on Hudson and King street.	1457024055	705436135229526016	f	eddiespizzany
Happy Tuesday! We are parked on Broadway between W55st and W56st. \nCall ahead your order if you'd like... https://t.co/s6pSbgrQ9O	1456848631	704700350872186880	f	eddiespizzany
Today we are parked at 2 Metrotech. Call ahead your order 917-439-7522	1455809361	700341337229365248	f	eddiespizzany
It's hump day! Try our $10 special! Pepperoni and pineapple. We are parked on W46st and 6th ave. Call ahead your... https://t.co/dMWhiyk0ao	1455723918	699982964604559360	f	eddiespizzany
Happy Tuesday everyone! Today we are parked on Broadway between W55 & W56 street. Dont wait in the rain, call... https://t.co/a9OLf7LrzE	1455633510	699603765142269952	f	eddiespizzany
Today we're parked on Hudson and King street. Dont wait in the cold call ahead your order 917-439-7522.	1455209254	697824308828057601	f	eddiespizzany
It's hump day! We are parked on W46st and 6th ave. Call in your order 917-439-7522. We look forward to serving you.	1455118998	697445745889140736	f	eddiespizzany
Today we are parked on W55st and Broadway. Call in your order. 917-439-7522	1455034632	697091890970103810	f	eddiespizzany
Today we are in Brooklyn! Come see us at 1 Metrotech. 917-439-7522	1454598565	695262891264454656	f	eddiespizzany
Lunch today on 55th and broadway	1454432309	694565564799434752	f	eddiespizzany
@Farin16 off the streets on Mondays during the winter.	1454283231	693940286364454914	f	eddiespizzany
Today we are parked in front of 111 W.33st. Stop by and enjoy a hot fresh pizza or sandwich. Look forward to... https://t.co/LTCXetQe5e	1454000901	692756108725780480	f	eddiespizzany
Happy hump day! Today we are parked on W.46st and 6th ave. Stop by and pick up a hot fresh pizza or sandwich.... https://t.co/KZWFyQI384	1453910845	692378383532040196	f	eddiespizzany
I posted 2 photos on Facebook in the album Eddies Pizza CART https://t.co/UmWc7V1fUN	1453843584	692096271058931718	f	eddiespizzany
RT @TheSporkful: Lunch = falafel sandwich w everything from @TaimMobile--thanks @EinatAdmony! https://t.co/skCLYg3tPy	1460059963	718169656889106433	f	taimmobile
Vandam and Varick today!  See you soon!!	1460044684	718105572026028033	f	taimmobile
@JacmelCutie612 20th and 5th!	1459959549	717748487476092928	f	taimmobile
@jessicasmith_vb yes!! 20th and 5th!	1459959542	717748457709125632	f	taimmobile
Flatiron today on 20th and 5th!	1459959533	717748421516533760	f	taimmobile
Have a Pro Do The Passover Cooking - via @jdforward https://t.co/WBBIVJuTBJ JewishDaily Seder @ilanhall @EinatAdmony @ESHbrooklyn	1459880148	717415456882225153	f	taimmobile
We're in FiDi today! On the corner of water and broad street!	1459870191	717373693127688193	f	taimmobile
Closed today!  But we'll be in FiDi tomorrow!	1459789107	717033601192296448	f	taimmobile
RT @EinatAdmony: Tahini - A Must-Have MiddleEastern Pantry Staple.  How to cook with it via@TastingTableNYC @TastingTable \nhttps://t.co/Yq...	1459787479	717026775742738432	f	taimmobile
RT @BalaboostaNYC: @ilanhall  + @EinatAdmony  collaborate for @balaboosta's Annual Passover Seder dinner.  Reserve your seats today! https:...	1459467527	715684797947985921	f	taimmobile
RT @MiroUskokovic: Love that @TaimMobile is so close to @untitlednyc so I can stop for a quick late lunch. Happy to... https://t.co/tNWvrMcFYL	1459467023	715682685650354176	f	taimmobile
Vandam and Varick today!  70 degrees calls for a date lime banana smoothie!	1459436491	715554624091111424	f	taimmobile
Hey flatiron we are just down the block from our usual parking spot. Find us on 21st and 5th today!	1459351111	715196516080738305	f	taimmobile
RT @EinatAdmony: The Middle Eastern Pantry - A Glossary of Essentials from My Pantry via @seriouseats https://t.co/l5TrJwOdtC \nMiddleEaste...	1459266504	714841649092886528	f	taimmobile
Bad news first: The truck is closed today.  Good news second:  You can still celebrate TAIMTUESDAYS in Nolita & the West Village	1459259544	714812454585417728	f	taimmobile
RT @BalaboostaNYC: Everyone has been asking about our passover plans.  This year we invite Chef @ilanhall to help us celebrate! https://t....	1458927905	713421461038432257	f	taimmobile
@nyc0118 We are closed on Friday's but both storefronts are open today! 45 Spring Street in nolita or 222 Waverly Place in West Village!	1458927837	713421173141422080	f	taimmobile
Hey SoHo falafel fans!  We're on Vandam and Varick today!	1458831321	713016357810487296	f	taimmobile
RT @EinatAdmony: I'm co-hosting a Post-Passover Party!!! @LBNYproductions passover https://t.co/UpaKCdLNpB https://t.co/WaBzknS0CO	1458757814	712708046229794823	f	taimmobile
RT @EinatAdmony: I'm thrilled to announce that @ilanhall will be joining us for our 5th Annual Passover Seder Dinner @balaboosta https://t...	1458676968	712368952404480000	f	taimmobile
RT @dkordulak: No tweets in 2 years but I am breaking my hiatus to say that everyone MUST go to the @SweeteryNYC truck on Broadway & Housto...	1460039791	718085048763826177	f	sweeterynyc
Got an event coming up soon? Call Sweetery! We specialize in creative events, brand promotion and event catering :-) https://t.co/y5f2fCmd5R	1459345515	715173042897481728	f	sweeterynyc
Craving for something sweet today? Find our truck and indulge yourself! SweeteryNYC SweeteryTruc SweetTreats https://t.co/yXfILc7IP4	1459172710	714448244722548736	f	sweeterynyc
Today is...National Black Forest Day!! Enjoy a delicious black forest cake today! BlackForestDay YummyCake https://t.co/Q0jFcKxqJN	1459171813	714444484273127424	f	sweeterynyc
Wishing you a blessed Easter!!	1459087281	714089931308736513	f	sweeterynyc
HAPPY EASTER!! https://t.co/nExbyNdrz6	1459087257	714089832448962560	f	sweeterynyc
HappyFriday GoodFriday https://t.co/RWK5RRCATv	1458923455	713402796184375297	f	sweeterynyc
Have you tasted our specialty coffee & tea yet? Sweeterynyc SpecialtyCoffee HotcHocolate	1458913517	713361112868208640	f	sweeterynyc
Happy Good Friday! Start your day right by stopping by our SweeteryTruck  and grab a yummy fresh croissant! https://t.co/6mKekHFTgP	1458913511	713361088755200000	f	sweeterynyc
Happy Good Friday! Start your day right by stopping by our SweeteryTruck  and grab a fresh croissant! https://t.co/yqlv4oU7gI	1458907235	713334765718515712	f	sweeterynyc
Rarely do ask but this one is a good one. Pls vote for our coffee roaster, @CoffeLabs, they r as good as it gets https://t.co/yfC2tGIHe0	1458402036	711215806873538561	f	sweeterynyc
RT @EastSideGal6771:  the  mug@SweeteryNYC: May your day be touched by a bit of Irish luck!  Sweeterynyc. StPatricksDay StPaddysDay h...	1458242436	710546393560174592	f	sweeterynyc
May the dreams you hold dearest be those which come true and the kindness you spread keep returning to you.... https://t.co/sapBP2cVGF	1458237220	710524518427590657	f	sweeterynyc
May your day be touched by a bit of Irish luck!  Sweeterynyc. StPatricksDay StPaddysDay https://t.co/9DqP5uiQ5k	1458236187	710520185946566656	f	sweeterynyc
On behalf of Julianna, Sweetery is bringing big smiles to the cast and crew @TheGoodWife_CBS  serving our incomparable ice cream sammies	1458157324	710189409535037440	f	sweeterynyc
RT @lilyannjo: Free bites today! Lovely smiles from @SweeteryNYC https://t.co/FM3RWUq3PO	1458138795	710111691984519170	f	sweeterynyc
Gd morning Hudson St. Sweetery is back at it again today giving away FREE coffee and breakfast treats, just to show u how much we missed you	1458044618	709716684014272513	f	sweeterynyc
RT @tinytashhxo: S/o to @SweeteryNYC making my Monday morning with free coffee & a blueberry muffin! 	1457980100	709446078500880384	f	sweeterynyc
Hello Hudson St. Guess who's back, and giving away free coffee and breakfast treats too.	1457962132	709370715523424257	f	sweeterynyc
Hey Hudson St. great news on a rainy Mon. SWEETERY IS BACK ! With FREE coffee & FREE samples this morning! Stop by and check us out.	1457952869	709331862028734468	f	sweeterynyc
RT @juliamoskin: Flaky hot charred roti canai with spicy creamy dal @lovemamak East Village https://t.co/Q0tplTj2YY	1454118202	693248103516893184	f	lovemamak
RT @wokwokny: Crispy Shrimp & Chives fritters aka Cucur Udang! https://t.co/rKPVRKie5B	1448512053	669734210899451904	f	lovemamak
RT @EaterVegas: Breaking: R.I.P. Kerry Simon 1955-2015 http://t.co/ueU9APXpWn http://t.co/LgvHkVmlwX	1441989988	642378685484433408	f	lovemamak
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
TODAY -21st St & 5th AV Repost @melbourne_glutton with @repostapp.\n\nglutton for NYC food trucks  | we... https://t.co/9RodfoVtnA	1459350803	715195221483474944	f	shukanyc
TODAY- 21st & 5th AV until 6:00 PM! \n\nCharred Cauliflower side dish from @ShukaTruck  unreal! Never had... https://t.co/XKgio08q8Z	1459265632	714837989948403712	f	shukanyc
Happy Monday Today - 21st St & 5th AV! 	1459178557	714472770629943296	f	shukanyc
HAPPY SUNDAY TODAY - UPPER WEST SIDE - 67th St & Broadway  https://t.co/3e0XBEclZi	1459090911	714105158288994304	f	shukanyc
CHANGE OF PLANS - TODAY - UPPER WEST SIDE- 67th St & Broadway UNTIL 6:00pm	1458921281	713393675737366528	f	shukanyc
SHUKA FASHION --&gt; late lunch on 21st St & 5th AV https://t.co/3ynd68owHg	1458921251	713393550902358016	f	shukanyc
SHUKA FASHION --&gt; late lunch on 21st St & 5th AV https://t.co/EBbQC2Dks1	1458846922	713081792971075584	f	shukanyc
@McFlyCahill90 Tuesday !	1458833767	713026617673715712	f	shukanyc
POWER TO SHUKA TODAY & TOMORROW 46th St & 6th AVShakshukaShukaTruckShowMeYourShakshuka nyc	1458832246	713020236761538560	f	shukanyc
TODAY -18th St & 5th AV --&gt; Untill 6:00pm ShakshukaShukaTruck ShowMeYourShakshukanyc https://t.co/sgYYxoAHDj	1458747905	712666486834376705	f	shukanyc
SUPER HEROES LOVE  SHAKSHUKA  Because of construction in Hanover Sq the Shuka Truck is parked on 46th St &... https://t.co/cDT0KM7mDT	1458660240	712298793832570880	f	shukanyc
CAN YOU FEEL THE FRESHNESS! 21st St & 5th AV until 6:00pm https://t.co/SMsHBUu6q5	1458589074	712000300136185858	f	shukanyc
Today-21st St & 5th AV ---&gt; until 6:00pm ShakshukaShukaTruckShowMeYourShakshuka nyc	1458569580	711918536223019008	f	shukanyc
TODAY- Upper West Side -67th St & Broadway Here until the VERY LAST EGG \nShakshuka ShukaTruck nyc https://t.co/KPQbXcp8Zf	1458487006	711572193789005824	f	shukanyc
it's FRIDAY  The Shuka Truck will Be parked on 46th St & 6th Av until 3:00pm ---&gt; LATE LUNCH ON 21st & 5th 	1458314206	710847418384916481	f	shukanyc
@GaryMWayne Great idea!! @British_Airways	1458256067	710603566109609984	f	shukanyc
@Hidden_Gold we do!	1458233772	710510056433983488	f	shukanyc
 Because of St. Patrick day Parade in Midtown the Shuka Truck will be parked on 21st St & 5th AV! HERE UNTIL 6:00pm https://t.co/MDFXAsASHn	1458228623	710488460545675264	f	shukanyc
@DForman9 21st & 5th!	1458228567	710488225291362304	f	shukanyc
THE GREEN SANDWICH- Change of plans- Today - 46th St & 6th AV! HERE UNTIL THE LAST EGG ShakshukaShukaTruckShowMeYourShakshuka nyc	1458142857	710128729243176960	f	shukanyc
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
RT @kate_angell: I've eaten many donuts in my day and @VeganLunchTruck yr raspberry blackout's the best vegan donut I've ever eaten. https:...	1460151087	718551859028443137	f	veganlunchtruck
RT @QSRmagazine: Even the most dedicated carnivores are enjoying vegan fare at @HipCityVeg, @VeganLunchTruck, @PurpleSproutCaf, etc. https:...	1460130913	718467243458301954	f	veganlunchtruck
Chamomile cookie donuts stuffed with chamomile custard. \n\nOpen in The Pennsy on 33rd/7th 11am-11pm\n\nTwo specials... https://t.co/vLMmbYyhqu	1460123910	718437868264386560	f	veganlunchtruck
RT @reeshardmartin: I declare the Thai BBQ tempeh sandwich from @VeganLunchTruck (Cinnamon Snail) the best vegan sandwich in NYC.	1460053093	718140841076912129	f	veganlunchtruck
Chocolate ganache stuffed cupcake sandwich cookies today\n\nWe are on 33rd/7th in @thepennsy open 11am-11pm https://t.co/eAcWHpVbr6	1460038246	718078568731951104	f	veganlunchtruck
RT @AyanaAtibaSahar: Live yo truth! @VeganLunchTruck doughnutchtonicles https://t.co/QCLmbtPRL8	1459981613	717841030868049920	f	veganlunchtruck
Chamomile pear glazed.  One of our new springtime flavors, but you wouldn't guess it because my face just froze... https://t.co/LR1Bpxca0U	1459882708	717426194208198657	f	veganlunchtruck
This weeks special:\nMorita Harissa grilled tofu w/ mashed red beans, pickled jalapenos, carrots cucumber & cilantro https://t.co/EGrrbTBsd3	1459784039	717012348339412992	f	veganlunchtruck
RT @e_seife: Final round of donuts: @VeganLunchTruck's pistachio, pear, and Thai basil coconut sonnster84 @kate_angell https://t.co/klwKd6O...	1459732026	716794188575195136	f	veganlunchtruck
Rosewater toasted pistachio cake donuts with cardamom glaze.  \n\nOpen today at @ThePennsy 11am-8pm https://t.co/zH0ziRNUej	1459697644	716649980501602304	f	veganlunchtruck
Bourbon hazelnut ganache cake.  Dark chocolate cake thinly layered with rich chocolate ganache that is spiked... https://t.co/jXr9Qgt2rF	1459603183	716253779579023360	f	veganlunchtruck
Peanut Butter Chocolate Ganache donuts today at @thepennsy on 33rd/7th\n\nWe are open 11am-11pm today https://t.co/1JiCAIOU2x	1459523171	715918186944851968	f	veganlunchtruck
Craft service catering with our foodtruck today for @mileycyrus https://t.co/ycAD818W0d	1459465647	715676915693142017	f	veganlunchtruck
@tlabetti nope.  Our spot is inside @ThePennsy on 33rd/7th right above penn station next to MSG	1459457013	715640700155600896	f	veganlunchtruck
RT @87ead: Celebrity sighting! MrMet at the @VeganLunchTruck @thepennsy. Guess he needed an... https://t.co/jLb4cnZxYg	1459454423	715629837378068480	f	veganlunchtruck
RT @ThePennsy: See, being vegan doesn't mean eating handfuls of uncooked oats in an L.L. Bean turtleneck.   - @VeganLunchTruck https://t.c...	1459442091	715578111266570240	f	veganlunchtruck
Peanut butter chocolate ganache stuffed chocolate twinkies in @thepennsy today\n\nWe are open 11am-11pm on 33rd/7th https://t.co/z1Koc5HGZi	1459433428	715541777999069184	f	veganlunchtruck
RT @phillegitimate: @legitkanteven I haven't tweeted at you about Cinnamon Snail in a while. I just smashed a creme brulee doughnut and tho...	1459371582	715282376746733569	f	veganlunchtruck
RT @SWEETandSARA: Smores donut stuffed w choc ganache from The Cinnamon Snail at the Pennsy!  Do-nut walk... run! https://t.co/Rm3A95kSIm	1459333563	715122913020608512	f	veganlunchtruck
Check out the latest feature about our custom vegan cakes and catering in the latest issue of Red Hot Magazine... https://t.co/FtGkWoxcgi	1459285644	714921928084074498	f	veganlunchtruck
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
As I unwind... 2 different mothers... but so crazy how these 2 love... https://t.co/AUwubSejc6	1460198574	718751031635664896	f	latinkitchennyc
Goesting is at Lincoln Center 6:00AM-9:30PM wafflecraving https://t.co/xcoECEkXYA	1460196318	718741568191098880	f	waffletruck
We are open at Bergen and Court street. Come!!!	1460202239	718766403868835840	f	carpedonutnyc
Peanut utter chocolate chip cookie dough donut. \n\nServing nonstop foodporn up in The Pennsy on 33rd/7th 11am-11pm... https://t.co/DWzmgRdmUp	1460203182	718770361194717189	f	veganlunchtruck
Serving at 80th and York  8:30AM-7:00PM Get them while they're here! https://t.co/NMGJ6xth4u	1460205319	718779322610360320	f	waffletruck
Serving at Park Slope  8:00AM-4:00PM brooklynwaffles https://t.co/maaD1CERHA	1460203518	718771768148824064	f	waffletruck
Our coffee is so good, it's angelic!  @BklynRoasting https://t.co/X5kqGeXRIh	1460203507	718771721365536768	f	waffletruck
Peanut butter chocolate chip cookie dough donut\n\nServing nonstop foodporn in @thepennsy on 33rd/7th 11am-11pm today https://t.co/enVbuoOcwg	1460203671	718772412364550145	f	veganlunchtruck
Due to the weather, we will not be out today. \nSorry for the inconvenience. \nSee You Soon	1460208725	718793607155728389	f	kettlecornnyc
Vedette is here, making all-star waffles for you hungry dinges! https://t.co/cXft5CFAnT	1460207119	718786873368387587	f	waffletruck
I posted a new photo to Facebook https://t.co/MvDCDYDY5m	1460209275	718795916006662144	f	shortysnyc
RT @rootedny: Going behind-the-scenes @foodenterprise w/ a tour of brooklynfood visiting @sfoglini @bkfoodworks @MamaOsKimchi @milktruckny...	1460210332	718800348333346816	f	milktrucknyc
We're open! Nuchastruck is in 23rd & 6th and Nuchascart at Barclays Center happy Saturday 	1460210515	718801115349958658	f	nuchasnyc
I spy with my little eye... a DINGESMOBILE!  We have wafels on wheels, ladies and dingesmen!  Order today!  @Eat24 https://t.co/2tCUvNChwo	1460212623	718809956074582017	f	waffletruck
ANNOUNCEMENT!   Our delivery coverage is expanding! UWS UES FiDi Search dinges on @Seamless We've got you covered!!!	1460210851	718802526427090944	f	waffletruck
Pagadder is at City Hall Park, Manhattan 10:00AM-7:00PM https://t.co/IGouUFonHV	1460210724	718801991921745920	f	waffletruck
RT @NHLFlyers: Read up on todays critical game vs. the Penguins with 5 Things to Know  https://t.co/DDjddt7evG https://t.co/GRYg0AjCxf	1460212685	718810217434193921	f	shortysnyc
PITvsPHI today @ 3:30pm. Breakfast menu til 3pm, $5 Beer Specials all weekend long. Shortys ShortysNyc https://t.co/zHjCA4Pwf6	1460213675	718814371296710656	f	shortysnyc
Serving on Center Drive in Central Park 11:00AM-6:30PM CentralDinges https://t.co/4aG6naI8b5	1460214325	718817096667410432	f	waffletruck
 korilla seoulfood seasonal kitchen https://t.co/fKML18b5eZ	1460217248	718829357150679041	f	korillabbq
Have you met our savory waffles?  Find them on @Seamless at our EastVillage location https://t.co/Hf2huMOs85	1460217070	718828610648436736	f	waffletruck
brunch because you deserve it! https://t.co/filyoLOjBS	1460218801	718835871106146305	f	waffletruck
Is dis one for YOU!?!  Place your order now on @Seamless https://t.co/gsyYEwhe6P	1460217688	718831202875084801	f	waffletruck
@crimsong19 Sorry we didn't open today. However, starting from 5/28, we will open during weekend in Governor island:)	1460224080	718858013122146304	f	kayanyc28
@doomtoall Sometimes if it's raining, we might change the schedule a little bit.But usually we will be in Midtown every Tuesday and Friday:)	1460223974	718857569511555072	f	kayanyc28
RT @doomtoall: @KayaNYC28  No midtown on Friday per your usual schedule?	1460223777	718856742101237761	f	kayanyc28
RT @VeronicaPromos: @KettleCornNYC I'll miss you guys & that yummy popcorn today. See you tomorrow.	1460222554	718851610756177920	f	kettlecornnyc
Find us on @GrubHub for some wafel love! https://t.co/48BtkRpmMQ	1460224086	718858039130996736	f	waffletruck
dingesdelivered is heading uptown!  Find us on @seamless dingesforeveryone https://t.co/jr273176kG	1460221996	718849272985333760	f	waffletruck
https://t.co/DWhMN3GEF3	1460225919	718865726371708929	f	fritesnmeats
RT @Dorit_Jaffe: Finally made it to one of my all-time favorite vegan spots, @VeganLunchTruck! A spicy split pea... https://t.co/Z3nVfFOt0z	1460228019	718874532317163520	f	veganlunchtruck
Thanks for having us Blindspot Jamie Alexander Steiner Studios  it was our pleasure! https://t.co/YGsahOt76Z	1460229685	718881520346337280	f	thegreenradish1
dingesforeveryone midtown delivery https://t.co/ul1YTF1qq2	1460230213	718883736474009600	f	waffletruck
Who needs pants?!?  Get your waffles delivered!  @Seamless nopantsweekend https://t.co/JAq6PGpyXN	1460229539	718880909055946752	f	waffletruck
Nuchascart changed location: 14th & 3rd we're open until 9pm	1460232092	718891615432126467	f	nuchasnyc
Stoked to announce we're vending @nychotsauceexpo April 23,24 https://t.co/OpuPZrykPE See you there! https://t.co/3SqCGkTFAk	1460234111	718900085984247809	f	dubpies
Brooklyn Beers $5 ALL DAY Saturday& Sunday at all ShortysNyc locations for the month of April. https://t.co/iEn1SPlYNu	1460235563	718906175669059584	f	shortysnyc
Rain or shine, come meet PontiRossi at WoodMemorial today. Warm up with some hot ! PontiRossi Italian FoodTruck Yum Eaaats Pasta	1460237723	718915234929491969	f	pontirossifood
TONIGHT\nSATURDAY APRIL 9TH\n@djdannystorm & djzelo \nLIVE... https://t.co/71EGuUitkU	1460239094	718920985072832513	f	latinkitchennyc
We love to Cater to our audience. Getting ready for GeneralElectric Catering. Let us book your next event! https://t.co/0ZVuaryZJU	1460239136	718921161355182080	f	pontirossifood
Come cozy on up with a tea and a waffle, 15 avenue b https://t.co/NeiejBb67s	1460241806	718932361811992576	f	waffletruck
Serving at 7th and Christopher 6:30PM-12:30AM WestVillageWaffles https://t.co/maaD1CERHA	1460241319	718930317562789892	f	waffletruck
Playoffs Catch all the action at your favorite ShortysNyc location LetsGoFlyers https://t.co/6t5L27JP8S	1460240428	718926579863273473	f	shortysnyc
FREE SHIPPING! * ANZAC Day * April discount * Pie Subscription https://t.co/aT3lefbg0A https://t.co/u3FnEOlN9J	1460248352	718959816635453440	f	dubpies
@sarahjane_me nah, sorry - check out latest newsletter for the low down https://t.co/g01rBAjBDw	1460248059	718958586085433344	f	dubpies
rainbow room tennis themed bar mitvah mac&cheese grilled cheese lovecatering https://t.co/LogAg8eUNc	1460258468	719002245925363712	f	milktrucknyc
Super taco Tuesday!! https://t.co/WU80Obcopk	1457455831	707247134559617024	f	etravaganza
@waffletruck We moved!  No truck in the West Village.	1460250219	718967646948081665	f	waffletruck
RT @NYCRobyn: @waffletruck I spy breakfast on the UES now open for business  https://t.co/XujENUvtN7	1460249616	718965118923628544	f	waffletruck
@Sankofa_Adwoa we're expanding all the time.	1460249601	718965056424251392	f	waffletruck
The sun might have gone down but we are still up!  Find us on @Seamless  and we will bring this magical treat to you https://t.co/v9QAWzyD4O	1460249352	718964011241484288	f	waffletruck
Hey Gotham!  Worried you won't get your waffles tonight?  Never fear, the dingesmobile is here!  @Seamless https://t.co/8WEPYhATRx	1460248459	718960266256453632	f	waffletruck
Dis one is in need of a good home!  Tell 'em where to find you!  @Eat24 https://t.co/flIG0ytPQ4	1460248267	718959459750514689	f	waffletruck
@Laurierempp Hello Laurie, apologies for our tardy response. Yes we do, although not all of the time. Love that you love us	1460243095	718937767766593536	f	sweeterynyc
Goesting is at Lincoln Center 6:00AM-9:30PM wafflecraving https://t.co/xcoECEkXYA	1460282716	719103950788673537	f	waffletruck
Serving at Forrest Hills, Queens From 7:00AM-9:00PM https://t.co/maaD1CERHA	1460286318	719119056171831297	f	waffletruck
Events w/our buffet (min 40 guest) whatever your event invite Wafels! dinges 646.257.2592 or events@dedinges.com https://t.co/w5HvIcRYF0	1460289931	719134212746584065	f	waffletruck
Serving at Queens College  8:00AM-5:30PM We are bouncing around on campus! https://t.co/NMGJ6xth4u	1460289921	719134168307863553	f	waffletruck
It's sunny!  Come and get your donuts at Bergen and Court!	1460289688	719133191227981824	f	carpedonutnyc
RT @mmarxen: Breakfast @dubpies while watching the Black Cats! SunLei  https://t.co/cOJduCMBk6	1460295232	719156444474511366	f	dubpies
Come Join Us At Our First Street Fair,We are location at Forest Hills Queens, on Queens Blvd between 70th Road & Yellowstone Blvd. until 7pm	1460295670	719158281906872320	f	kettlecornnyc
Come Join Us At Our First Street Fair Of 2016\nWe are location at Forest Hills Queens, on Queens Blvd between 70th... https://t.co/C1sWlGxLYu	1460295322	719156824465756160	f	kettlecornnyc
Vedette is here, making all-star waffles for you hungry dinges! https://t.co/cXft5CFAnT	1460293522	719149272541896706	f	waffletruck
Are you Brunching today or watching the MTV Movie Awards? Don't forget your empanadas to share  Opening hours  https://t.co/nvmuW333EY	1460296900	719163442016493568	f	nuchasnyc
Come Join Us At Our First Street Fair. We are location at Forest Hills Queens, on Queens Blvd between 70th Road &... https://t.co/eyji9Mogu8	1460297384	719165470423793664	f	kettlecornnyc
De Smurf knows what's up!   He's got his favorite dinges on his authentic Belgian wafel.  Find us on @GrubHub https://t.co/Yskk5bG9nt	1460299036	719172400303181824	f	waffletruck
Serving at Central Park West 10:30AM-6:30PM fridayfunday https://t.co/B1Yzfcvoge	1460298924	719171930570539009	f	waffletruck
Pagadder is at City Hall Park, Manhattan 10:00AM-7:00PM https://t.co/IGouUFonHV	1460297133	719164417586438144	f	waffletruck
Heads up! Special location of Nuchascart today! Well be at 65-30 Kissena Blvd. in Flushing QueensCollege until 4pm  happy sunny Sunday	1460300819	719179877895782405	f	nuchasnyc
Serving on Center Drive in Central Park 11:00AM-6:30PM CentralDinges https://t.co/4aG6naI8b5	1460300733	719179519702220801	f	waffletruck
@smorgasburg arepawithlove https://t.co/buFyAXzvzz	1460302864	719188456354799618	f	palenquefood
nice sunny sunday we are @smorgasburg prospect park. Healthy Colombian arepas https://t.co/NZY1nZ7hAh	1460302261	719185927051063298	f	palenquefood
wafeldate https://t.co/K3qx8VHXID	1460304005	719193241946570754	f	waffletruck
Book us for your corporate function!  events@dedinges.com https://t.co/L4rPHgoNK2	1460303469	719190993694826496	f	waffletruck
Why coffee before wine when you can have it all!?!  dingesforeveryone https://t.co/dP754x1Dy7	1460305208	719198289086836739	f	waffletruck
Sundays are better w a Carl's famous cheesesteak! 86th st bet 3rd / Lex av, cheesesteak love for all GOT WHIZ... https://t.co/I7rFDLJIRS	1460305135	719197982877491200	f	carlssteaks
Lemongrass 5spice seitan w/ curried cashew, Szechuan chili sauce, greens & wasabi mayo on chili oil grilled tortilla https://t.co/20LbGtVXt6	1460305379	719199006321041409	f	veganlunchtruck
RT @VeronicaPromos: @KettleCornNYC Street Fairs are better with @KettleCornNYC YIPPEE!	1460307573	719208207638519808	f	kettlecornnyc
Come visit @neaexpress today on Wooster & Prince, North Moore & Greenwich, 40 Wall Street,... https://t.co/OjOHkajOp7 https://t.co/q1FgGrGh2M	1460307898	719209570997022720	f	neaexpress
dingesdelivered is heading uptown!  Find us on @seamless dingesforeveryone https://t.co/H7ebQzASs9	1460307909	719209618010988545	f	waffletruck
BigRed will be serving up lobster and knowledge at the @QueensMuseum today from 3:30-8:30! https://t.co/i2cJ3oieqt https://t.co/IKnwlZtvTd	1460310964	719222429038612481	f	lobstertruckny
RT @NHLFlyers: Get ready to close out the regular season tonight in Brooklyn with 5 Things to Know  https://t.co/jD9dNW8gaw https://t.co/T...	1460313817	719234396927168513	f	shortysnyc
The Jawn is ready 2 go! This week's lunch schedule: Mon 47/Park; Tues 51/Park; Wed 41/6th; Th 52/6th; Fri County DA's office. See you soon!	1460314606	719237706912501761	f	philssteaks
Quick!  Order a waffle now and it will magically be waiting at your door!  @Seamless https://t.co/8Cj24oQX6l	1460316599	719246066349158400	f	waffletruck
Sundayfunday at @QueensMuseum, now till' 8pm. Let's GOOOO!!! https://t.co/onmpUdJJC6	1460318696	719254861028724744	f	bigdsgrub
We'll be back next week with new schedule! https://t.co/K1qCoagvtI	1460319540	719258402157916161	f	korillabbq
Sundays are for chocolate! chocolatechip chocolate italianices andysitalianices summer... https://t.co/MeQ1VJkUU8	1460324396	719278768678952961	f	andysitalianice
JerseyCity bound Monday, lunch, 11:30-1:30, \nBBQ Black Bean Burgers grilled onions, kosher dills, baby arugula,... https://t.co/CILHoZPFRj	1460327594	719292181106663424	f	thegreenradish1
Come in and grab a coffee and a waffle!  Or we can bring it up your 6th floor walk-up.  @Seamless https://t.co/JKvC8V57X9	1460326822	719288943011897345	f	waffletruck
Custom vegan cakes and catering for any occasion.  Email our lovely catering manager Carmen for a quote at... https://t.co/vVad9mmU0S	1460327822	719293136581881857	f	veganlunchtruck
Peeps, check out this up coming weeks food truck schedule @ https://t.co/KNYATgHmUA	1460332104	719311096646103040	f	fritesnmeats
https://t.co/XC7MEU5GGY	1460335086	719323604593336320	f	kettlecornnyc
Gift cards for that luckydinges in your life!  Find them at our locations or on @Seamless https://t.co/0q58Z0uODT	1460334616	719321631949201408	f	waffletruck
RSVP NOW!!!\n212-457-1072\nhttps://t.co/8QkidPYxZB DYCKMAN\n@TOMMY5KDEGREEZ Comedy... https://t.co/A2ohIohP1G	1460344761	719364187030495235	f	latinkitchennyc
https://t.co/8QkidPYxZB DYCKMAN \n186 DYCKMAN ST\nNEW YORK NY 10040\nRSVP... https://t.co/GxgPluT7dP	1460349460	719383894743756800	f	latinkitchennyc
Goesting is at Lincoln Center 6:00AM-9:30PM wafflecraving https://t.co/xcoECEkXYA	1460369115	719466334657069056	f	waffletruck
I posted a new photo to Facebook https://t.co/s7EUyHeGRe	1460375885	719494727050076161	f	polishcuisine
What a gloomy weather today we have.  Allow us to put some smile on your face with Kielbasa and Pierogi.  Varick... https://t.co/xZPq3GxRLf	1460375602	719493539432906752	f	polishcuisine
This guy is really moving these days!  20-30 minute delivery time, ladies and dingesmen!  Click away on @Seamless https://t.co/kkeSMXBi2y	1460376324	719496570648047617	f	waffletruck
Back at Hunter College  8:00AM-9:00PM huntingwaffles https://t.co/maaD1CERHA	1460376319	719496548627976192	f	waffletruck
zeppole foodtruck valduccis @MrVsPizza @greenboxny @FoodPorn @Cater2me @foodnnews24 https://t.co/34HPu6S2Zf	1460376863	719498829012320257	f	valduccis
Let's do lunch. D2 is grillin' it up at Jay/Water St., DUMBO @ITO_EN @hugeinc Thai Vietnamese https://t.co/4EqRA3259L	1460380459	719513913952444416	f	bigdsgrub
D1 is serving lunch today at @fordhamnotes. 12pm to 3pm https://t.co/s75AX5cEvk	1460380318	719513320454234113	f	bigdsgrub
Hello @DumboNYC! Join us on Jay & Water St until 3pm! LebaneseLuch	1460380147	719512604771794944	f	toumnyc
Serving at NYU on West 4th  and Greene Street New York From 9:00AM-10:00PM https://t.co/NMGJ6xth4u	1460379920	719511653730099200	f	waffletruck
Vedette is here, making all-star waffles for you hungry dinges! https://t.co/cXft5CFAnT	1460379919	719511650332733443	f	waffletruck
Good morning.\nWe have the right ingredients for Monday blues	1460381240	719517190467231744	f	etravaganza
Braving the rain at Front and Adams. Ready to serve at 11:30. Stop by for some baos pre order 646-358-2258 @DUMBOFoodTrucks	1460381695	719519098904973316	f	kayanyc28
Good Morning Midtown \nCome Grab A Hot Fresh Bag \nOf Yummy Kettle Corn\nWe Are Located on\n45th St. Between 5th &... https://t.co/2pFP1bLZlu	1460382088	719520745416736768	f	kettlecornnyc
https://t.co/sYVC9pvDf1	1460382189	719521169607684096	f	veganlunchtruck
Try our NEW Vietnamese vermicelli bowl today, while supplies last! Jay/Water St., DUMBO @ITO_EN @hugeinc @Sous_HQ https://t.co/i6kmDQ8GCj	1460382760	719523566266499074	f	bigdsgrub
Lunch 2day @ 50th st b/t 6th & 7th AV. Burger of the week THE HEAVENATOR preorder 917-292-9226 midtown	1460383411	719526294531284992	f	fritesnmeats
Pagadder is at City Hall Park, Manhattan 10:00AM-7:00PM https://t.co/IGouUFonHV	1460383520	719526751077023749	f	waffletruck
Good week everyone today @Hanover Sq serving lunch from 11:30-3:15 order online @www.schnitzi.com schnitzitruck foodtruck kosherfood	1460383372	719526131234418689	f	schnitzi1
Today we are at 53rd and Park.	1460383959	719528591457984512	f	domotaco
Steak season is finally here! Satiate your stomach. 47th btw Park/\nLex 11-2. mmm cheesesteaks jawn newyear	1460384529	719530985998524416	f	philssteaks
Monday lunch- 47 bet park and Lexington \n\nCall in orders to: 917-756-4145	1460385439	719534799942246400	f	disosnyc
Nuchastruck is at Varick & Charlton and Nuchascart is at Brooklyn College	1460385308	719534250891034628	f	nuchasnyc
These waffles are for YOU!  Do you deserve them HELL YEAH!  Come in and say hello or find us on @Eat24  treatyoself https://t.co/6S90zQrj8p	1460385421	719534725736591361	f	waffletruck
Don't turn your back on your wafel...not even for a second! https://t.co/V6r3VKZWaf	1460386120	719537657257324545	f	waffletruck
GetRad today JCfoodTruckHub grand&hudson 11:30-1:30 makeityoursJC eatwell	1460387642	719544042544099328	f	thegreenradish1
We have some serious mondaymotivation @dumbolot jay & water 1130-3 today! No online ordering available today, sorry! Thaietnamese	1460387628	719543980371927040	f	sweetchilinyc
@TKYSK8R @pussyrrriot COME!!!!	1460386974	719541239419428865	f	waffletruck
RT @Feekit: @waffletruck https://t.co/P9uJ7ocQxJ	1460386916	719540996770504704	f	waffletruck
RT @CentralPark_NYC: Balto is enjoying the sunshine & bright blue skies. nofilterneeded  gorgeous but cool day in centralpark  https:/...	1460386902	719540935407833088	f	waffletruck
RT @Eat24: Those who cook will become full, but those who order will become full, happy, and naked from the waist down. -- Proverb we jus...	1460386846	719540701743214592	f	waffletruck
Happy Monday New York! BigRed is off the street but you can grab lobster goodness in the East Village or Midtown! https://t.co/CeC0qZCk3u	1460386820	719540593551138816	f	lobstertruckny
Midtown 46th between 5 and 6 AVE, 	1460389289	719550948616638464	f	luckyimthai
Start your week off right w   famous cheesesteak! 52nd st bet 6 / 7 av @SIRIUSXM @MHFI @UBSamericas @barclays... https://t.co/cn9OpsWnyZ	1460388674	719548370826739716	f	carlssteaks
Open now at Varrick btw Charlton. https://t.co/p6bRsHzpmL	1460389955	719553740718620672	f	coneyshack
We DELIVER!  Oui oui, for you! https://t.co/eEm4U6d2oy	1460389871	719553387977682944	f	waffletruck
RT @chirpielove: @thegreenradish1 see ya later!! Thanks!! You guys are the best!!!	1460390639	719556612688633856	f	thegreenradish1
GetLunch today @JCFoodTruckHub grand&hudson till 1:30 also @MECasaJC @MECasaExpress @jc_eats @GoldmanSachs	1460390592	719556413178191874	f	thegreenradish1
Waffles so good even Bugs Bunny wants 'em!  dingesforeveryone.  We serve to rabbits! https://t.co/5jOmV3FYTP	1460390498	719556020922671105	f	waffletruck
Closed today but we'll be in FiDi tomorrow!	1460391251	719559177207734272	f	taimmobile
We are on 47th & Park Schnitzlers!	1460391787	719561427053248513	f	schnitznthings
FBF to the 1964 World's Fair!  Those waffles still look fresh! https://t.co/dRqlX5Bxrn	1460391619	719560723450490881	f	waffletruck
https://t.co/8QkidPYxZB DYCKMAN \n186 DYCKMAN ST\nNEW YORK NY 10040\nRSVP... https://t.co/kSzJ8T9PDy	1460392271	719563455435522048	f	latinkitchennyc
@franklinshepard thanks mark! Great to see you as always	1460392543	719564597158682624	f	philssteaks
RT @franklinshepard: @PhilsSteaks delicious, as always. You guys are simply the best!	1460392526	719564524949540864	f	philssteaks
@csbrockman hey Craig! Yes i am. Mia is working too! When will you be by?	1460392355	719563806683373569	f	philssteaks
@csbrockman whatever works for you! Just let us know when you're coming. See you soon Craig!	1460393662	719569292719759360	f	philssteaks
Hey now,,,, late one but we have 1 truck out today on hudson / king \nOther truck getting some scheduled maintenance. ..	1460395304	719576176180781056	f	gcnyc1
Guess whaaaaat ??? https://t.co/z4AfFSTKNX	1460394846	719574256871436288	f	korillabbq
RT @JediN8: Silly rabbit, dinges are for kids! https://t.co/o62e5AYCJw	1460395170	719575616102801408	f	waffletruck
@CrimsonDragon5 	1460395160	719575575661256704	f	waffletruck
RT @CrimsonDragon5: Person: who's the love of your life?\n\nme: @waffletruck 	1460395144	719575504869834752	f	waffletruck
@justyniak this week: tues 51/park; wed 41/6th; th 52/6th; Fri downtown at county DA's office. Check Twitter daily for evening loc's n times	1460394807	719574092484108288	f	philssteaks
FordhamUniversity showing Big D some love!  @fordhamnotes TGIM https://t.co/1ePkvXmAhu	1460397321	719584639178969088	f	bigdsgrub
Out sister spot is becoming the new late night spot on Fridays in Soho https://t.co/MPTSzLtVFs	1460398328	719588859516973057	f	taimmobile
Or that you'd find it at a kiwi store!  ;-)  https://t.co/TQGclmS0mb	1460399164	719592367548968960	f	dubpies
Indeed,  simple as that, and now featuring freeshipping, baby! https://t.co/puGmkMZ1q5	1460399105	719592118277316610	f	dubpies
RT @SnackFixation: Chicken pita and Greek fries from @souvlakitruck.  NYC https://t.co/ONeRaer1nc	1460398939	719591422828142594	f	souvlakitruck
URGENT wafel deliveries being made all day!  Get yours on @Grubhub https://t.co/qxq4odGFca	1460400486	719597912301432832	f	waffletruck
Don't say we didn't warn you!  Everybody loves wafels! https://t.co/j5xdOqwjJI	1460400316	719597200137973765	f	waffletruck
RT @ReuvenBlau: .@Schnitzi1 Monday! https://t.co/hHoxAyiZKk	1460401679	719602917582483456	f	schnitzi1
Open now at W. 4th and Greene. Beautiful afternoon for a steak. Rocking until 7ish	1460401574	719602477620809728	f	philssteaks
@megan_mack Hey Megan, we are sad that we missed you today, however the truck is done for the day, although we hope to see u on another day	1460402743	719607381198520320	f	sweeterynyc
Nuchastruck changed location! we're now at Waverly & Broadway	1460403036	719608606136672256	f	nuchasnyc
RT @HiFiGuy197: Better yet, grab two bags. @KettleCornNYC https://t.co/AaHLs6DY2f	1460403073	719608761959247872	f	kettlecornnyc
A legendary wafel from our archives, the baconana is back.  Now with candied bacon!  Order delivery on Seamless https://t.co/9jsatVwmOI	1460403043	719608637874946048	f	waffletruck
https://t.co/vFdN9B8Roh	1460404620	719615249998077952	f	taimmobile
Starting tomorrow, we will tweet daily of our Sweetery truck whereabouts!! Be on the look out :) wheredatruckat	1460404410	719614371534675972	f	sweeterynyc
Good Evening NYC\nWe Relocated To\n86th and Lexington \nUntil 7:30pm\nkettlecorn nyc \nfreesamples popcorn https://t.co/SQGCjEv5Ff	1460405475	719618837453221888	f	kettlecornnyc
RT @NHLFlyers: Together with Comcast Spectacor, we mourn the loss of Chairman and Founder Ed Snider  https://t.co/V5X6QibEO4 https://t.co/...	1460406127	719621573339123723	f	shortysnyc
RT @BrooklynBrewery: Happy to be @shortysnyc Brewery of the Month. Find Brooklyn Beers on tap all month long. https://t.co/uP9xglUjZP htt...	1460406027	719621151916441600	f	shortysnyc
Got Peanut Butter Cups? We do. Tomorrow, Tuesday, Jersey City Food Truck Hub grand and hudson, hanging with our... https://t.co/fUPILkhPk4	1460407103	719625665536872448	f	thegreenradish1
KIDDIE SIZE strawberry banana !!!  italianices andysitalianices italian dessert... https://t.co/EdTkmAVzFa	1460408043	719629608472158208	f	andysitalianice
RT @Immpreneur: Success Story: Meet the Waffle Master of NYC https://t.co/dZKJGz2lZs @waffletruck immigrantentrepreneur Belgium https://t...	1460408673	719632252032925696	f	waffletruck
RT @jinglepunks: Back at it again with the UnwantedAds! This ones for you @ChangBeerUK ! Featuring Thai rapper, Siwat. https://t.co/iAUFBJ...	1460409107	719634071589101569	f	mamuthainoodle
RT @RealAntwon: The NYC Champions of Cheesesteaks returns!  https://t.co/1lmkjS3igV	1460408926	719633313162522625	f	philssteaks
catering seafood valduccis delicious pizza @MrVsPizza @Cater2me @greenboxny https://t.co/pzsHuPeY8R	1460410034	719637958354145280	f	valduccis
Meet our amazing kitchen dinges!  Their slogan is We produce the love, and they sure do!  Thank you!  teamdinges https://t.co/6QPZ9gMmHM	1460410805	719641194364592128	f	waffletruck
NEW and you must try! https://t.co/IuFDEWqRuY	1460413601	719652920938004480	f	bigdsgrub
This is on D2, along w/ our crispy and spicy cucumber salad! https://t.co/9lpxuhaw9z	1460418911	719675193585758209	f	bigdsgrub
RT @EinatAdmony: My favorite way to cook and eat! FamilyMealTuesdays at @CombinaNYC starts next Tuesday (4/19). Rotating Weekly Menu https...	1460418970	719675438340161536	f	taimmobile
RT @bryantparknyc: Visit the Vegas Virtual Reality Bar today at the Southwest Porch for a simulated trip to some of... https://t.co/Q1WWPnwnOs	1460420121	719680268165070848	f	waffletruck
All the good people in the world love a dinges!  Find yours on @Seamless today! https://t.co/4s381yVijd	1460421011	719684002496520195	f	waffletruck
Catch The Green Radish at JC Earth Day Festival JCEDF2016 https://t.co/SmF8Fgweol	1460427718	719712130396778497	f	thegreenradish1
Thanks for dropping by again @gregwong we definitely love your work hood, will be back next Monday !!! https://t.co/e6OtHuqhqP	1460437848	719754618142502912	f	coneyshack
HIRING HOSTESS \nPLEASE EMAIL RESUME WITH ATTACHED PICTURE... https://t.co/ggAHpvwlyH	1460451287	719810986258079744	f	latinkitchennyc
@foxandfriends live in 5\nComeToTheCheeseYo	1460456927	719834644645093376	f	gcnyc1
Goesting is at Lincoln Center 6:00AM-9:30PM wafflecraving https://t.co/xcoECEkXYA	1460455515	719828722250084352	f	waffletruck
Due to the weather, we will not be out today. \nSorry for the inconvenience. \nSee You Soon	1460460710	719850508891090945	f	kettlecornnyc
Are you coming to the @BandBClassic next weekend? Here's a preview of what we are serving! https://t.co/2Le3A3DQpm	1460460923	719851404765065216	f	sweetchilinyc
Double de wafel fun!  Find us on @seamless and these two beauties will head your way! https://t.co/eH5UgL3pd1	1460462717	719858928327258113	f	waffletruck
Raining... but at least it's Taco Tuesday! We're at Hudson and King today.	1460463144	719860717910892545	f	domotaco
God Bless our Troups @greenboxny @MrVsPizza @Cater2me @foodnnews24 @FoodPorn @TonyGemignani @eatupnewyork @ https://t.co/a0TAlpkkE8	1460464569	719866694492151808	f	valduccis
Today's location: Astor Place!! Can you spot our bright blue truck?	1460464848	719867864728104960	f	sweeterynyc
Yalla LebaneseLunchers! Join us in Midtown on 52nd btwn 6th & 7th for a juicy beef kabab sandwich.  https://t.co/gd9RsCmgC8	1460465155	719869153063124992	f	toumnyc
Vedette is here, making all-star waffles for you hungry dinges! https://t.co/cXft5CFAnT	1460466319	719874035262296065	f	waffletruck
@NameCantBe for sale :)	1460466451	719874589036298241	f	sweeterynyc
D1 - 50th Street btwn 6th and 7th Avenue https://t.co/3ZoLDeNmJT	1460467052	719877110609928192	f	bigdsgrub
Hello sunshine!  D2 at Hudson/King St., with our NEW Vietnamese dish! Come see what the buzz is all about. https://t.co/pkphxSINo4	1460467051	719877105769717760	f	bigdsgrub
@carlssteaks servin up our cheesesteak LOVE today at 5th Av/21st St , so stop by and say hi NYCBEST GOTWHIZ... https://t.co/Ala2Qs83cv	1460467551	719879204494401538	f	carlssteaks
Rainy day at 50th and 6th Ave today till 2:30 Preorder 646-358-2258 midtown Taiwanesefood @midtownlunch	1460468073	719881394420326400	f	kayanyc28
This rain isn't gonna keep us away for the almighty tacotuesday financial district Old Slip & water st ready , coney island W8th st	1460468353	719882565604118528	f	coneyshack
@46 bet 5&6 Ave lunch from 11:30-3:15 order online @www.schnitzi.com schnitzitruck schnitzel foodtruck kosherfood	1460468429	719882886158163969	f	schnitzi1
Hot...Delicious Kielbasa or Pierogi in the weather like this...ohhh,  cold wish.  Haa WISH became reality.  47st... https://t.co/qhjV8jCv4g	1460469133	719885839136894976	f	polishcuisine
Only downtown at hanover sq and water street, call ahead then pick up, no wet, save time. 1-929-382-8537 	1460469207	719886149507014656	f	luckyimthai
Midtown raining, we are here with you, 46th between 5 and 6 AVE, Thai spicy lunch ,  delicious 	1460469140	719885868543123456	f	luckyimthai
Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE HEAVENATOR preorder 9172929226 Fidi	1460469172	719886000718221312	f	fritesnmeats
G1 91/columbus @trinity \nG2 @BklynNavyYard @DuggalGH @cnn \nComeToTheCheeseYo	1460470378	719891061334794241	f	gcnyc1
Pagadder is at City Hall Park, Manhattan 10:00AM-7:00PM https://t.co/IGouUFonHV	1460469924	719889157141741569	f	waffletruck
@JayShams tomorrow!!	1460469748	719888418130522116	f	taimmobile
Rain rain go away come visit us in FiDi today! On the corner of water and broad!	1460469735	719888364678332416	f	taimmobile
@JayShams Fidi today! Water and broad!	1460469695	719888195677253632	f	taimmobile
Tuesday lunch- 48th bet 6 and 7 Ave\n\nCall in orders- 917-756-4145	1460470810	719892871533432832	f	disosnyc
Oh what a day!  take out your umbrellas and dance while eating empanadas 4th St NYU Stern Brooklyn College Both locations, all day long	1460471216	719894573808533504	f	nuchasnyc
RT @Downtownmag: Check out @gogobot's suggestions for fun, festive downtown activities!\nhttps://t.co/uI2wqH5jbZ https://t.co/fFFvhZRDi2	1460471041	719893841323696128	f	fritesnmeats
Happy NationalGrilledCheeseDay	1460471708	719896638005841920	f	gcnyc1
RT @34thStNYC: On Weekend Inspections, we check the district for graffiti, litter, broken street furniture & more. Maintenance is a priorit...	1460472233	719898841168920576	f	waffletruck
Just a couple of dinges-lovers here!  Nom nom nom https://t.co/v71eGeXYO5	1460471825	719897131948056577	f	waffletruck
Good morning NYC! The Jawn is on the corner of 51st and Park today for your cheesesteak enjoyment. Open at 11 and... https://t.co/wyllfgcQJu	1460471962	719897704592056320	f	philssteaks
The rain stopped, but it was not going to stop us from lunch anyway! \nD1 - 50th Street btwn 6th and 7th Ave\nD2 - Hudson/King St\n646-543-BIGD	1460473140	719902644534427648	f	bigdsgrub
BigRed is catering an event but she'll be back out tomorrow! If you would like to book, email cater@redhooklobster https://t.co/i1az41fAn9	1460473213	719902952299827200	f	lobstertruckny
Today we are parked on Broadway and 55st.	1460472339	719899286683525120	f	eddiespizzany
Open for lunch- 48th bet 6 and 7 Ave.\n\nCall in orders to- 917-756-4145	1460474991	719910407960469504	f	disosnyc
Time for lunch on jay & water @dumbolot 1130-3!\nGinger soy pork over jasmine rice with spicy pineapple https://t.co/d1aryFRG4B	1460474880	719909943709724672	f	sweetchilinyc
Tuesday, whatchoo know about this toasted blackberry fig glazed circle of heaven? https://t.co/mK2dQy3DMi	1460474743	719909369278820354	f	veganlunchtruck
https://t.co/WyGvK8dHi2	1460475592	719912931434045440	f	chefsamirtruck
We are at the corner of 36st and Broadway!\n@Foodtruckgirl7 @Sexyfoodtrucks	1460475402	719912134503698432	f	chefsamirtruck
Eat BBQblackBeanBurgers today @JCFoodTruckHub also @TheIncrediballs @MECasaJC @theAngryCrabNJ  @jjhouseofdogs https://t.co/3Mq5rcPCUE	1460476266	719915758294298625	f	thegreenradish1
It's the best thing!  Vietnamese vermicelli salad bowl w/ your choice of meat.  https://t.co/FFEYwvIJwi	1460476301	719915904511971330	f	bigdsgrub
Now through April, get a FREE scoop of ice cream with your waffle at BROOKLYN BOROUGH HALL!  @DowntownBklyn https://t.co/3eVP0395BJ	1460476284	719915831560429568	f	waffletruck
We do indoor events as well?   Call us to book yours today dingesforeveryone 646.257.2592 https://t.co/uOwnN5bxRC	1460476885	719918351947014145	f	waffletruck
Brooklyn Navy Yard Tues.-Thurs. in preparation for the democratic debate! Who ya got, Spirit of '76 or Buffalo sauce? chicken	1460476957	719918656243806208	f	usafoodtruck
BBQ Black Bean Burger, kosher dills, special sauce, grilled onions, baby arugula, toasted focaccia....also baked... https://t.co/hws278mN3m	1460477749	719921978904330240	f	thegreenradish1
Rain doesn't stop the stomach rumblings. We're on Jay & Water st. til 2:30.	1460478431	719924837007941634	f	kimchitruck
It's raining, it's pouring...and @seamless is your bff. Find us now and get these babies on... https://t.co/fDC3cclrtf	1460478210	719923910075023360	f	waffletruck
The more you know!  Come visit us at the cafe for more sweet tidbits about wafels, cycling, Belgium, and more! https://t.co/BagQFTo3Aw	1460478005	719923049252982784	f	waffletruck
Hey guys we are on 52nd & 6th ave.	1460479811	719930624232988677	f	schnitznthings
Add candied bacon to your afternoon!  Shown to increase dinges productivity by 1036% baconmakeseverythingbetter https://t.co/GyuroVSkdF	1460481484	719937644583591937	f	waffletruck
No truck today but visit our shop 3602 36th ave Astoria. Meantime have a look at this: https://t.co/FVwib0TS9I mamuthai	1460483356	719945493258874880	f	mamuthainoodle
Learn all of our dinges secrets here in this video! https://t.co/zjw0Vuo2Op discoverflatiron @FlatIronHot	1460484308	719949486609534976	f	waffletruck
Hey NYU we are open at W.4th and Greene. Hanging here til 630. Come get a late lunch or early dinner from the Jawn!	1460488395	719966628696293380	f	philssteaks
@wontonya we will be at 52/6th on Thursday from 11-230	1460488232	719965945482080256	f	philssteaks
RT @greenboxny: Goals.  @Valduccis @LASTDRAGONPIZZA @PizzaRoxPizza @ATownPizzaria @TwoBootsHQ https://t.co/SHfz6dwmKV	1460488412	719966698913271808	f	valduccis
We are so excited for SPRING! Stay tuned for announcements on BIG events we are participating... https://t.co/E0Rd9AgMDb	1460489660	719971934205775872	f	waffletruck
DYK we serve waffles to all of your favorite NYC-based shows?!?!?  behindthescenes dingesforeveryone https://t.co/Q4iz2p47NG	1460489415	719970909172461569	f	waffletruck
Done well,  a lovely cup of coffee.  Though usually lacking the nuance of a great flatwhite ;-) https://t.co/DlpvOQtzcm	1460493236	719986934102290432	f	dubpies
Come to Brooklyn, we'll take that challenge!  ;-) https://t.co/KSa6lrj8eX	1460493073	719986251848400899	f	dubpies
Indeed, we've been nailing the flatwhite in Brooklyn since 2005, baby.  Cheers @serenity22 https://t.co/3dNucCviBY	1460493022	719986036948885504	f	dubpies
HIRING HOSTESS \nPLEASE EMAIL RESUME WITH ATTACHED PICTURE... https://t.co/AVOGUapJLj	1460493274	719987094366642176	f	latinkitchennyc
RT @ShortysTrivia: @DudaFanClub yes! 8pm 62 pearl street @trivialdispute	1460493699	719988877600112640	f	shortysnyc
@CR_FromThe_DR you're in luck! We go to 41st btw 6th and Broadway every Wednesday - just west of Bryant park. So we'll see you tomorrow!	1460494725	719993180477722624	f	philssteaks
Here to bring the waffles to YOU!  East Village, Herald Square, Bryant Park, Borough Hall, and the surrounding areas https://t.co/RlDN3v9Hku	1460497633	720005376159125505	f	waffletruck
https://t.co/RL9B92SV0T via elheraldoco	1460497789	720006032764833792	f	palenquefood
Eat step repeat https://t.co/L2GKhJK1st	1460499305	720012391359115264	f	korillabbq
RT @trivialdispute: want a hint for one of tonight's rounds at @ShortysTrivia Pearl st? 8pm w @MsDurbervilles ! https://t.co/nCMmCFSM0Y	1460500150	720015933490786304	f	shortysnyc
Trivia tonight-- 62 Pearl St. 8pm. Happy hour 4pm-7pm ... Tequila Tuesday til close. Trivial Dispute Shorty's NYC	1460500348	720016764361449477	f	shortysnyc
Beautiful Spot to enjoy empanadas UnitedPalaceTheater nyc iggypop https://t.co/qjcKNXLxQN	1460503638	720030563160166400	f	nuchasnyc
Guess where are we and who is playing tonight?! nuchas empanadas concert https://t.co/Mdc7yRPckb	1460502702	720026636876324865	f	nuchasnyc
Waiting for showtime enjoying empanadas  iggypop concert nyc https://t.co/ocXP4iztXI	1460504598	720034588454727680	f	nuchasnyc
RT @ConeyIslandBeer: Who's coming to Trivia Night at @ShortysNYC? Stop by for a taste of our new pitcher perfect Home Plate Pale Ale. https...	1460506228	720041427145748480	f	shortysnyc
NYCs street vendors coming together to fight the city's unjust laws. Proud to be a part of this family! @VendorPower https://t.co/HBX3xtou33	1460507765	720047874478907392	f	bigdsgrub
This guy is really moving these days!  20-30 minute delivery time, ladies and dingesmen!  Click away on @Seamless https://t.co/k3N7RVeBak	1460507431	720046471626809344	f	waffletruck
https://t.co/8QkidPYxZB DYCKMAN \n186 DYCKMAN ST\nNEW YORK NY 10040\nRSVP... https://t.co/qe5VgpF8sQ	1460510815	720060666514644992	f	latinkitchennyc
@thegoodwife_CBS big thanks to the staff and crew for having @carlssteaks tonight on set for wrap party!! Los of fun	1460510089	720057619935817728	f	carlssteaks
belgocontrol dummies on strike just weeks after terrorist attacks. Insert four letter word here.	1460520508	720101321957896194	f	waffletruck
Goesting is at Lincoln Center 6:00AM-9:30PM wafflecraving https://t.co/xcoECEkXYA	1460541916	720191111935959040	f	waffletruck
We are open at 23rd street and Park avenue south. Come!!!	1460544729	720202910752182272	f	carpedonutnyc
Someone bought he whole place out (yes, you can do that)!\n\nWe will be open to the public today 11am-4:30pm https://t.co/tr8g9zSwtS	1460546666	720211037262360577	f	veganlunchtruck
Good Morning.\nServing Power Breakfast https://t.co/0myJyEDUGn	1460549316	720222150964211713	f	etravaganza
Caught in the act!  Enjoy that dinges, friends! https://t.co/OstI03MKuc	1460549117	720221314313764865	f	waffletruck
@lilianewyork @missyarobbins congrats on everything. Your food is fantastic! ! https://t.co/oJf5EXPx6O	1460550449	720226903060312064	f	sweetchilinyc
CitiBank LIC, 1 Court Square, Long Island City 8:30AM-9:00PM waffleshere whereareyou https://t.co/maaD1CERHA	1460550921	720228881928732672	f	waffletruck
Queens College  8:30AM-9:00PM for all of your waffle needs https://t.co/NMGJ6xth4u	1460550920	720228880167137284	f	waffletruck
Wednesday's are the yummiest when there's a LebaneseLunch in your tummy! Join us on 46th btwn 5th&6th for shawarma https://t.co/b4gyo6UTDM	1460551961	720233242989830146	f	toumnyc
Vedette is here, making all-star waffles for you hungry dinges! https://t.co/cXft5CFAnT	1460552723	720236440395902976	f	waffletruck
It's Wednesday so we are at @Dumbolot today!  At the intersection of Water and Jay Street!	1460553005	720237625626505216	f	domotaco
D2 awaits you. 50th Street btwn 6th and 7th Avenue. Try our NEW spicy cucumber salad! https://t.co/qlrycsGMAD	1460553424	720239382456696833	f	bigdsgrub
D1 is grillin' it up at Jay/Front St., Try our NEW spicy cucumber salad!DUMBO @ITO_EN @hugeinc @Sous_HQ Brooklyn https://t.co/KRL3R4VMoV	1460553316	720238927580426240	f	bigdsgrub
New spot, same great food. Find us on 52nd & 6th ave. 11:30 - 2:30 pm	1460554150	720242428112818179	f	kimchitruck
A beautiful Whiz Wednesday to you! 41st between 6th n Broadway 11-230. Don't miss out - get your Phil!	1460553630	720240244876926980	f	philssteaks
Lunch today- Water and Old Slip.\n\nCall in orders to: 917-756-4145	1460554486	720243834031063040	f	disosnyc
We're in a University state of mind: Lucky you NYU Stern,  Nuchastruck will be there again today 4th St  Nuchascart at Brooklyn College	1460554255	720242867265003520	f	nuchasnyc
Good Morning Midtown \nWe Are Located on\n45th St. Between 5th & 6th Ave \nUntil 3:30pm \nkettlecorn nyc popcorn... https://t.co/uLQA36zNmQ	1460554528	720244013014458368	f	kettlecornnyc
@KatyKroll4eva Yes, one of my favorites as well.  Spread the word, we would love for it to become more popular.	1460555954	720249994159198208	f	nuchasnyc
Lunch 2day @ Hudson & King. Burger of the week THE HEAVENATOR preorder 9172929226 soho	1460556546	720252474192433152	f	fritesnmeats
Pagadder is at City Hall Park, Manhattan 10:00AM-7:00PM https://t.co/IGouUFonHV	1460556324	720251546596950018	f	waffletruck
@DUMBOLOT Brooklyn Jay&water St serving lunch, order online @www.schnitzi.com schnitzitruck schnitzel foodtruck kosherfood	1460556129	720250728107810816	f	schnitzi1
RT @ny_on_instagram: Hello Tuesday.... Thanks to @coneyshack for these . by tacotuesdaynyc https://t.co/mpPRMV7tTA	1460557231	720255346741264386	f	coneyshack
Mr. Sun , Mr.Sun, Mr. Golden Sun,  please shine down on  me!! So head over to 47th st bet lex / park av @mlb @nfl... https://t.co/Vi05h3oaJw	1460557611	720256940568281089	f	carlssteaks
G1 @BklynNavyYard  @cnn \nG2 58th / Madison \nComeToTheCheeseYo	1460558243	720259594572992513	f	gcnyc1
It's Wednesday again. We are at Park and Greenwich today to serve you all some tasty steamed buns. Pre-order is available at (646) 358-2258	1460558303	720259844326862849	f	kayanyc28
Have a birthday coming up?  Wedding?   Bar Mitzvah?  We do it all!  Call us at 646.257.2592 to book today! https://t.co/ytqb69LcV9	1460558237	720259568681533440	f	waffletruck
47th and park ave. Bringing you something that fire up your taste buds . Open at 11	1460559056	720263004714102784	f	coneyshack
Today we are on Water st & Old Slip.  :)	1460559095	720263168795217920	f	polishcuisine
@csbrockman see you then Craig!	1460559616	720265351024345088	f	philssteaks
Downtown call us ahead then pick up, 	1460560507	720269089017577472	f	luckyimthai
47th between park and Lexington AVE, Thai food truck,  	1460559970	720266834922975235	f	luckyimthai
Come see us on broadway btw Houston & Bleeker 1130-3! Special today is baby bok choy! Thaietnamese https://t.co/y48U5Ucxfa	1460560302	720268230196076545	f	sweetchilinyc
Serving at Wollman Rink, Center Drive 11:00AM-7:00PM kotmadamiswatching https://t.co/4aG6naqwMv	1460559928	720266661320724480	f	waffletruck
Happy Wednesday New York! BigRed is on the SE corner of 53rd and Park Ave with lobster rolls and sunshine https://t.co/q0LyoQbon0	1460559634	720265426597380097	f	lobstertruckny
valduccis midtown nyc pizza @greenboxny @MrVsPizza @FoodPorn @eatupnewyork https://t.co/h0CwJpFSUC	1460560218	720267876360417280	f	valduccis
We are at 52st and park av! @Sexyfoodtrucks @Foodtruckgirl7	1460561841	720274682532859906	f	chefsamirtruck
Happy hump day! Were on W46st and 6th ave today. Stop by and grab some lunch.	1460561999	720275348391211008	f	eddiespizzany
Happy hump day falafel fans! We're on 20th and 5th today!	1460561939	720275094795390976	f	taimmobile
Spicy cucumber salad  https://t.co/D1clNQcUsQ	1460562827	720278819333095424	f	bigdsgrub
Enjoy this spring weather while feasting on Tacos. Here until 2:30 pm. 52nd & 6th ave.	1460562829	720278828979847170	f	kimchitruck
We DELIVER!  Oui oui, for you! https://t.co/57UBoxGk8y	1460562689	720278241056067584	f	waffletruck
!!! Wed April 13th 12:30-3:30 45th st & 6th Ave!! Then 4:30ish-7pm 18th st & 7th Ave !!!	1460562710	720278329392304129	f	thetreatstruck
Lunch Awaits JerseyCity @JCFoodTruckHub grand&hudson also @TheIncrediballs @MECasaJC @CarmellaNYC @FuYummytruck eatwell jcmakeityours	1460563471	720281521085661184	f	thegreenradish1
It's treat day!  We've got you!  Find us on @Eat24 https://t.co/FyYiHMJJOW	1460563249	720280588419231744	f	waffletruck
@cs19721 w.4th and Greene 3-630	1460563268	720280671516758016	f	philssteaks
We &lt;3 this one!  Thanks, dear dinges. https://t.co/fNPT2eRjhZ	1460564406	720285443464523776	f	waffletruck
Lunch is a no-brainer. Come to  52nd & 6th ave and have your choice or burritos, bowls and other delectable fusion eats.	1460565745	720291058634993667	f	kimchitruck
Hey guys we are on 47th & Park	1460565359	720289441223417856	f	schnitznthings
Late tweet! We're on 17th & 5th today! mamuthai	1460565785	720291225970933760	f	mamuthainoodle
RT @csbrockman: Waited four months to try @PhilsSteaks.  Worth the wait! https://t.co/mksJ1Ln9Xa	1460565627	720290562159616000	f	philssteaks
TODAY TODAY TODAY\nCOMEDY IN THE HEIGHTS!!\nhttps://t.co/8QkidPYxZB DYCKMAN \n186... https://t.co/rAtJQpdKxu	1460566483	720294153683394563	f	latinkitchennyc
This dog knows where lunch is, do you?! BigRed is on the corner of 53rd and Park https://t.co/dWo3vzd6cs	1460566851	720295697908535297	f	lobstertruckny
Your Guide to Finding NYCs Top 5 Tastiest Food Trucks https://t.co/IhYdTdLe5f via @RallyBlog	1460567695	720299238505074692	f	carpedonutnyc
RT @thebarnyard: My Wednesdays just got so much more awesome now that @PhilsSteaks is back on the street!  ibleedwhiz	1460569525	720306914245025793	f	philssteaks
@cs19721 change of plans. No late shift today so we will wrap up at 41st at 230. Will be at w.4th tomorrow late afternoon	1460569269	720305840184537088	f	philssteaks
Look at these beauties!  dingesforeveryone dingesdelivered https://t.co/yOMJQD98Rw	1460570109	720309363085340672	f	waffletruck
RT @RoseTintedVisor: finding out @shortysnyc is opening a location by @barclayscenter may have given @rmiriam and i a new pregame spot is...	1460570051	720309120499253248	f	shortysnyc
@thebarnyard glad to be back Barney!	1460569540	720306974936690688	f	philssteaks
It's not too late to grab a little lobsterlunch! Run, don't walk, to BigRed on the corner of 53rd and Park https://t.co/dnUziOcINZ	1460570452	720310799986728960	f	lobstertruckny
@Ciderplex so sorry, had to move. We were on 17th closer to Broadway. Hope to catch you next time!	1460572903	720321082230751237	f	mamuthainoodle
We were down today due to technical issue. We will be back serving our amazing food tomorrow in @dumbolot from 11 am to 3 pm 	1460575778	720333141932666880	f	pontirossifood
Come on, West Ham! @whufc_official FACup	1460576458	720335993962958848	f	dubpies
Don't forget your free Spekuloos cookie with your coffee! https://t.co/7sCfUYFacF	1460576440	720335915667886080	f	waffletruck
@Seamless midtown @bryantparknyc eastvillage https://t.co/0Us07LIpp9	1460575839	720333397910884352	f	waffletruck
@LRodriguez141 hey Louie. We're at the Democratic Debate in BK. We'll be back in midtown on Fri.	1460577211	720339149237174272	f	usafoodtruck
@_JStockley hey James-\nSorry man. We were catering for @CNN at the @TheDemocrats debate in Brooklyn. We'll be here through Thurs. nextweek	1460577141	720338855556169728	f	usafoodtruck
RT @Kimberly_anne89: @USAFoodTruck hookin it up today for lunch! brooklyn foodtruck buffalochicken https://t.co/RdYZsjHD8t	1460576998	720338257398140928	f	usafoodtruck
Good Evening New York City\nWe Relocated To \n13th and Broadway \nUntil 7:30pm \nkettlecorn \nnyc \npopcorn... https://t.co/gm7dRtq4Zl	1460578051	720342674608402433	f	kettlecornnyc
PieTruck is making a special appearance at a kid's soccer event @NY_FEST 4/16 https://t.co/8hpZcmwrPD Pier 5, Brooklyn Bridge Park	1460578790	720345772672294916	f	dubpies
RT @QSRmagazine: Even the most dedicated carnivores are enjoying vegan fare at @HipCityVeg, @VeganLunchTruck, @PurpleSproutCaf, etc. https:...	1460578775	720345710189809664	f	veganlunchtruck
@franklinshepard hey bud, every Monday 50th & 6th AV. Hope to c u there:)	1460579550	720348960389468160	f	fritesnmeats
@ijm7 which episode?!?	1460580880	720354540172652544	f	waffletruck
RT @ijm7: : just started watching white collar. love @waffletruck's cameo in s2! lookin' good guys! makes me want some!	1460580850	720354412804214784	f	waffletruck
@VCBVon we serve the same food at both but @UrbanspaceNYC has more options (and alcohol!)	1460580872	720354507348185088	f	lobstertruckny
RT @keyboardbrian: @KettleCornNYC Just got my bags in the mail.  Delish!!!!	1460581357	720356538452471808	f	kettlecornnyc
@mkmowlah get it!  YOU deserve it!	1460581742	720358155780276224	f	waffletruck
RT @mkmowlah: I made it through a very tough Monday and decided that I deserved a reward. Thanks @waffletruck  https://t.co/O8G0BR0wF3	1460581730	720358103963803648	f	waffletruck
@CaidCartz good idea!	1460581716	720358045109366785	f	waffletruck
@samrega @NudelmanMike we have not been in Flatiron much due to parking issues in that area. Twitter is the best place to find our locations	1460581696	720357964184428544	f	waffletruck
RT @LendoorInc: Rossanna from @waffletruck shares her success story with us! \nfoodtruck entrepreneur\nhttps://t.co/hU6S70VMBm https://t.c...	1460581607	720357589754642434	f	waffletruck
RT @kim_menten: @waffletruck @Seamless WoW really nice service, he is the second Eddy Merckx!! 	1460581413	720356774675615745	f	waffletruck
RT @arrsquared: Waffles for breakfast in bryantpark @waffletruck https://t.co/iHYjo4LfhW	1460581392	720356688835002368	f	waffletruck
@hannahteskey @bryantparknyc Send an email to events@dedinges.com We would love to be featured!	1460581371	720356600792412160	f	waffletruck
: purple rice, kbbq pork, umami shrooms, housemade kimchi, purple slaw  korilla korean https://t.co/9BLISxiNpX	1460583298	720364680070434816	f	korillabbq
Eat step repeat https://t.co/BDNwNTM8u3	1460583212	720364319754444800	f	korillabbq
URGENT wafel deliveries being made all day!  Get yours on @Grubhub https://t.co/T2mE8ncTRs	1460583445	720365297987948544	f	waffletruck
It's easy to follow us, download our App. \nEarn points towards a free lunch and feel good doing it.... https://t.co/KZODozWxl6	1460584676	720370460270039040	f	thegreenradish1
NHL Stanley Cup playoffs start TONIGHT! Game sound at 8pm. NHL Playoffs StanleyCup ShortysNyc https://t.co/uQEMZcA2ph	1460584483	720369650542997504	f	shortysnyc
Open for lunch- water and old slip.\n\nCall in orders to: 917-756-4145	1460585428	720373616798527488	f	disosnyc
RT @Cititourcom: @DiSOSNYC makes a killer sandwich Midtown FoodTruck NYC Foodie citieats\nhttps://t.co/c7K5U5kBNx https://t.co/B4vF59Fa...	1460587624	720382827477381121	f	disosnyc
wafflesnotwar dingesforeveryone dingeslove https://t.co/TnF7BJqAfd	1460587572	720382607700180992	f	waffletruck
Come visit us on this lovely day!  Or we can deliver de dinges to YOU!  on @Grubhub https://t.co/u3ppiQXFmY	1460589188	720389387993878528	f	waffletruck
It's easy to follow us, download our App. \nEarn points towards a free lunch and feel good doing it.... https://t.co/TnZm5oshNU	1460590237	720393785180434432	f	thegreenradish1
bbqblackbeanburger kosher dills, baby arugula,  grilled onions, special sauce, toasted... https://t.co/N6FAYDkh6i	1460592669	720403987204337664	f	thegreenradish1
RT @BalaboostaNYC: Join @EinatAdmony at the first ever MimounaNYC! A moroccan party to celebrate passover. https://t.co/uuD0qj9TfN @LBNY...	1460592519	720403357316313089	f	taimmobile
PieTruck will be in full effect @ a soccer event @NY_FEST 4/16 https://t.co/UjcKpt8Bhd Pier 5, Brooklyn Bridge Park	1460593823	720408827816845313	f	dubpies
Line?!?!?!  Pfffft!  We now DELIVER and only a 30 minute wait-time, maximum.  dingesdelivered https://t.co/ByggDX5JMK	1460593832	720408865016279040	f	waffletruck
Check out Pier 13 Hoboken this weekend...@pier13hoboken pierpressure pier13 hoboken foodtrucks craftbeer https://t.co/b0pmJLZ0fg	1460597371	720423706850430978	f	thegreenradish1
We're not there for the opening but they'll be plenty of tasty food and beer, sure of that. Check out Pier 13 Hoboken	1460597090	720422528829759490	f	thegreenradish1
RT @MrVsPizza: pizza valduccis delicious yummm @Valduccis @FoodTruckLoveNY @FoodPorn @greenboxny @siclou68 https://t.co/14kSZGQT0A	1460598615	720428924203708416	f	valduccis
PACKED HOUSE!!!\nWE WANT TO THANK ALL THAT SUPPORTED US LAST NIGHT AT... https://t.co/RsYrRY1bAw	1460618811	720513634443661312	f	latinkitchennyc
Truck mechanical has us sidelined today...See you soon JerseyCity Jersey City Food Truck Hub visit our friends... https://t.co/BjhWgjq15p	1460631143	720565358277447681	f	thegreenradish1
Goesting is at Lincoln Center 6:00AM-9:30PM wafflecraving https://t.co/xcoECEkXYA	1460628317	720553504402759680	f	waffletruck
We are open at 51st street and Park avenue. Come!!!	1460630379	720562155062435841	f	carpedonutnyc
Serving at Pagadder 15 Centre Street  7:30AM-8:30PM cityhallpark manhattan https://t.co/IGouUFonHV	1460633716	720576149735280640	f	waffletruck
RT @TodoSobreNYC: NewYork in 10 meals https://t.co/H4IYYy5OR7 @shakeshack @KorillaBBQ @DoughnutPlantNY grayspapaya katzs @magnoliabakery...	1460633589	720575615859048448	f	korillabbq
What's your favorite dinges combo?  dingesforeveryone https://t.co/i5wlfuoMH5	1460635510	720583675574939648	f	waffletruck
Democracy in action today y'all. We'll be at the Democratic Debate at the Brooklyn Navy Yard. We are non-partisan, but love democracy. free	1460635496	720583617165045760	f	usafoodtruck
@Coach_DH we'll be there from 12 till around 10 pm.	1460638570	720596509599916033	f	usafoodtruck
Who we voting for today NYC? @HillaryClinton or @BernieSanders?	1460638521	720596302808104960	f	usafoodtruck
Serving at Trinity 139 West 91st Street 9:00AM-4:00PM wafflesforthewin https://t.co/maaD1CERHA	1460639118	720598808112066560	f	waffletruck
Vedette is here, making all-star waffles for you hungry dinges! https://t.co/cXft5CFAnT	1460639117	720598804647514113	f	waffletruck
D2 - Jay/Water St., DUMBO\nVietnamese vermicelli salad bowl, while supplies last!! @hugeinc @ITO_EN @Sous_HQ https://t.co/ThWa3uda9B	1460639907	720602119087198208	f	bigdsgrub
It's THAT time of the week folks!\nD1 - 50th Street btwn 6th and 7th Avenue feedyourcrave https://t.co/AMcAf7uYaN	1460639768	720601532434137088	f	bigdsgrub
55 st & Broadway we are coming for you.  Be ready. \n11-2:20pm	1460640259	720603591690596352	f	polishcuisine
!!! Thurs April 14th headed to the UWS this afternoon! Bway (86 & 87) 3:ish or 3:30? We 'll let you know !!!	1460640436	720604336179572736	f	thetreatstruck
Good Morning Midtown \nWe Are Located on\n45th St. Between 5th & 6th Ave \nUntil 3:30pm \nkettlecorn nyc popcorn... https://t.co/WxH7oChTXh	1460641266	720607816780648448	f	kettlecornnyc
52nd and 6th we are baaaaaack! Slangin' steaks from 11-230 today. Can't wait to see our wonderful customers!!!	1460641161	720607376106221568	f	philssteaks
Lunch on Hudson & King st. 11:30 - 2:30 pm.	1460641754	720609862258978817	f	kimchitruck
What up Brooklyn? Join us in @DumboNYC on Jay & Water St for some Lebanese deliciousness! vegan glutenfree healthy	1460641960	720610726054903808	f	toumnyc
RT @SHSassin: Brooklyn Join @ToumNYC in @DumboNYC on Jay&Water St for some Lebanese deliciousness! vegan glutenfree healthy https://t...	1460643262	720616188355702785	f	toumnyc
Hello Brooklyn, lunch today @ front & jay st. Burger of the week THE HEAVENATOR Preorder 9172929226 dumbo @DUMBOFoodTrucks	1460642482	720612918686040064	f	fritesnmeats
@46 St bet 5&6 serving lunch from 11:30-3 :15 order online @www.schnitzi.com schnitzitruck schnitzel foodtruck kosherfood	1460642894	720614646500208648	f	schnitzi1
Today we are parked on Hudson and King street.	1460642451	720612786137501696	f	eddiespizzany
Thursday lunch/ 47th and Park Ave\n\nCall in orders to- 917-756-4145	1460644910	720623101231255552	f	disosnyc
We're Hype! Nuchastruck is in a special spot  45th & 1st  and Nuchascart is at  Brooklyn College . (almost) Weekend vibes  streetfood	1460644262	720620382265483268	f	nuchasnyc
Nice weather out today for some gua baos. Parking at Varick and Charlton street. Pre-order is available at (646) 358-2258 soho lunchtime	1460645013	720623534901501953	f	kayanyc28
Wake up with our Hashbrown Breakfast Wafel!  A hearty potato waffle with bacon and Vermont maple syrup!  @Seamless https://t.co/siDrRsa4vf	1460644637	720621956027019264	f	waffletruck
Vandam and Varick today!  Hope to see you there!	1460644347	720620739653709824	f	taimmobile
@CallmeDira for the most part we open at 11am  close lunch between 2:30-3:00 pm	1460645951	720627467933732864	f	gcnyc1
RT @sethedel: Boom or bust w grilled cheese from @gcnyc1 !!!!! https://t.co/6NTWZN2WDU	1460645881	720627173409824768	f	gcnyc1
Midtown 46th between 5 and 6 AVE,     Forget sandwich.  Here are rice and noodle that hot and delicious,   see you guys	1460645832	720626969482760192	f	luckyimthai
We love Thursday one day closer to the weekend! 49th st bet 6th / 7th av @SIRIUSXM @MHFI @UBSamericas @barclays... https://t.co/q3q818TdYf	1460645395	720625133434617860	f	carlssteaks
G1 @BklynNavyYard @cnn @NY1 \nG2 -  FiDi Wall/William \nComeToTheCheeseYo	1460646541	720629941939924992	f	gcnyc1
Serving at MetroTech 1 Metro Tech Center Brooklyn From 11:00AM-4:00PM brooklynwaffles https://t.co/NMGJ6xth4u	1460646325	720629037660532736	f	waffletruck
Serving at Kotmadam Center Drive, New York From 11:00AM-7:30PM wafflecentral https://t.co/4aG6naI8b5	1460646325	720629035550826498	f	waffletruck
The sun is shining and lobster is in the air!...or at least in our truck. BigRed is parked on 55th and Broadway! https://t.co/43jOSTbaiT	1460646089	720628045862846464	f	lobstertruckny
No truck today Thursday peeps. Mechanical issues. 	1460646688	720630558011875328	f	mamuthainoodle
We have just signed a new lease to open a new store at 66 Willoughby Street, so the truck will be there today!... https://t.co/a3KQ11FjsV	1460646197	720628498377883650	f	domotaco
Hey Schnitzlers, we are on Broad & Pearl today.	1460647566	720634239138557952	f	schnitznthings
We are at 47st between park av and Lexington @Foodtruckgirl7 @Sexyfoodtrucks	1460648551	720638372168015873	f	chefsamirtruck
We are so sorry for the late post but like every Thursday we will be at our premier location 48th st between 6 & 7th avenue we are ready!!	1460648030	720636187891904512	f	coneyshack
Downtown Hanover sq. call us then pick up 929-382-8537	1460647844	720635409013862401	f	luckyimthai
Happy pre social.\nLunch Ready\nFresh cooking awaits.	1460649477	720642257146286080	f	etravaganza
dis guy is all alone, won't you come get him?!?!  midtown eastvillage brooklyn bryantpark https://t.co/Y7RV9J2JdK	1460649087	720640622533701632	f	waffletruck
A 5 star review of Toum by Chelsea W. We love our fans!  https://t.co/Ig9AnSw4GZ	1460650168	720645156811247616	f	toumnyc
wafflesonwheels dingesdelivered @Seamless https://t.co/cNPKiVYXHf	1460649711	720643239901007873	f	waffletruck
Cartoon flavored chocolate cake donuts have invaded today!\n\nFeel what life is like as Homer Simpson.  \n\nWe are... https://t.co/wgzAIwLj5C	1460650019	720644528554831872	f	veganlunchtruck
BREAKING! New Belgian Study finds waffles cause happiness. See picture for evidence. dinges https://t.co/CN92vp6F8s	1460650836	720647957205413888	f	waffletruck
Such a beautiful day in the neighborhood. Take a stroll and grab a bite. We're on Hudson & King st til 2:30pm	1460652190	720653635634466817	f	kimchitruck
Go get your lobsterlunch on! BigRed is at  the corner of 55th and Broadway https://t.co/Cb6DHBZkOz	1460651429	720650442347323392	f	lobstertruckny
Beautiful day for a cheesesteak https://t.co/lKBgKyb5z1	1460652670	720655648975941633	f	philssteaks
BigRed is still parked at 55th and Broadway with plenty of lobstah for all you late lunchers. Go grab a roll! https://t.co/vLmEynmnYi	1460655029	720665543292895232	f	lobstertruckny
RT @amandacarpenter: Some fine food truck grub from CNN's BK debate site courtesy of @USAFoodTruck thx!! https://t.co/o1gRwrli4O	1460657606	720676350957367297	f	usafoodtruck
@amandacarpenter thanks for the love! Was the food any good? Make sure you check out our backstory too. nycfood nycfoodtrucks usa 	1460657546	720676100100202497	f	usafoodtruck
Closed until after Passover!	1460657934	720677726470979585	f	shukanyc
Closed until after Passover!!!	1460657778	720677071492517888	f	shukanyc
@CalicoAvenger not yet, sorry	1460659064	720682467892555776	f	dubpies
PieTruck will be in full effect @ a soccer event @NY_FEST 4/16 https://t.co/c9R8IWGu29 Pier 5, Brooklyn Bridge Park	1460658671	720680820030246912	f	dubpies
RT @philbuckler: Yessssssssss @fritesnmeats is baccck. Goodbye today's productivity! https://t.co/CUytd0C6Zu https://t.co/liNctbfwo6	1460658662	720680781987901441	f	fritesnmeats
@amandacarpenter thank you! Wished we could have talked more. Make sure you check out our backstory board on the truck. Americandream	1460660317	720687721367384069	f	usafoodtruck
!!! Thurs April 14th 3-7pm Bway (86 & 87th) !!!	1460659566	720684574850818052	f	thetreatstruck
You can never have too much hummus. @ Taim Falafel & Smoothie Bar Soho https://t.co/gUHKkpBoHT	1460660150	720687021082206208	f	taimmobile
REMINDER: FREE SHIPPING!  * ANZAC Day/April discount expires tomorrow! https://t.co/GAU3rWEWu6	1460660953	720690390857334785	f	dubpies
RT @TheSchemer: @lobstertruckny I'm in a lobster state of mind! Have had these 2 days in a row. Yum! https://t.co/7fLpiBmj0A	1460660677	720689234760331265	f	lobstertruckny
@CrimUnited yeah, good on ya.  If West Ham had turned up for the kick-off - would have been different, eh? ;-)	1460663054	720699201391370240	f	dubpies
It's a beautiful day in le cafe! https://t.co/4yUdcob9Tz	1460662251	720695834304712705	f	waffletruck
Open at w.4th and Greene til 630!	1460663324	720700333219979264	f	philssteaks
 - BKFR, bulgogi, bean sprouts, kale, fried egg korilla seasonal kitchen https://t.co/NHHjNekKyd	1460664217	720704082084806657	f	korillabbq
@Brandon82S we'll be at Metrotech 4/28	1460664168	720703875410444289	f	korillabbq
RT @BrooklynBrewery: We're @shortysnyc's  Brewery of the Month. Love cheesesteaks & beer? Come sneak a bite. https://t.co/uP9xglUjZP http...	1460664327	720704540979425280	f	shortysnyc
@mj_lee better keep us in mind for your big party	1460664791	720706486461206528	f	usafoodtruck
RT @mj_lee: Today's lunch (dinner?) at CNN DemDebate brought to you by @USAFoodTruck https://t.co/9rRblM9MPA	1460664743	720706288552972290	f	usafoodtruck
Come try all of our flavors of Kettle Corn for free. We make them fresh the old-fashioned way, hand-popped in a... https://t.co/jjIH3QK0qD	1460665402	720709049436794880	f	kettlecornnyc
We are offering perks for those who wish to participate:\n\nWe are shooting a video this Saturday April 16th at our... https://t.co/qsk2yCe2Wc	1460666650	720714283328217089	f	kettlecornnyc
We are offering perks for those who wish to participate:\n\nWe are shooting a video this Saturday April 16th at our... https://t.co/6yG634PjuQ	1460666335	720712963737329664	f	kettlecornnyc
We are offering perks for those who wish to participate:\n\nWe are shooting a video this Saturday April 16th at our... https://t.co/zMHyPnhjBL	1460666175	720712294854979584	f	kettlecornnyc
We are offering perks for those who wish to participate:\n\nWe are shooting a video this Saturday April 16th at our... https://t.co/ebxPfn3sqG	1460665853	720710942573506560	f	kettlecornnyc
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

