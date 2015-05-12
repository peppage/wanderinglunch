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
51c1ea41498e372d91835cf9	/5067950_pSXIZo_RqO8Hh5AuWcomjr0p3q_pXPUMWe99W8hUGTU.jpg	public	burgersandbites	\N
51a79983498e3044671cd784	/1441492_yfySwml4ChzJ_ni5DxTq-8n2UlecWBWjgxR-ygA6pYc.jpg	public	burgersandbites	\N
525b3a3711d2040fdcbd6fee	/52031712_DN0C9vfm3iv1geUuFX92Pt0jwgl8NhbGokLj_o0Ebjg.jpg	public	mooshugrill	\N
51dd9ddc498efb9a3437e123	/4501533_djr9d2BEP8dg7E48xJjJTa_Yjk0Iy-MmBG6hgIQBLUs.jpg	public	bigdsgrub	\N
4e4e92c7b0fb088f3c0f14d5	/HTLXSW2D30RGIEYPI0JGR22LUCS5BTXQ0LXDWAOHH4PCVHM4.jpg	public	bigdsgrub	\N
513101fce4b006d9c4991bdc	/17248619_XfpmI8dNgmoeHE3BXjV8bL2yuuMTqxU3FqDr4BqX7Ks.jpg	public	bigdsgrub	\N
4fa2d04de4b0489ba3d7936d	/hsPbM0G5l3AsUaI3x6r_VkiSYo4pYlWTKK2S9zqh_KE.jpg	public	bigdsgrub	\N
4fd0f054e4b0757383b97c0f	/MbR1inb3VKXu0PQMsCkHkHGftYq0E8CDbYG3BLRRGaE.jpg	public	thecrepestruck	\N
50f59e2ee4b0b31f58d6cc1f	/1922740_OhtWiNUDUcN0NE_HB3Tk8vm5qIZcvqxcP2nMDrN8dT0.jpg	public	kimchitruck	t
5197fe76498e1c056c96d21b	/117715_m462oAqyqBN12xyWCOyzYR6-1gtYrUa8BiX9r9OybE8.jpg	private	kimchitruck	\N
4e3da652d4c058f9dc087a6c	/QEOIS2W35WLTHYK00QC04LKKX4X1SYW3DDI45X30HSKTJENQ.jpg	public	kimchitruck	\N
535d6fe9498eeb428f0a49a5	/643701_B0msQNcQCClAiTuYbiNnskLICf99ehNmerkWdhYNR8c.jpg	public	snowday	f
533ddd9a498ebf7fb4775ca2	/36814481_r4TU0Q7tJ6Xum58iZ5olLRY6sV-P4dN3psrhw2ZZKZ8.jpg	public	snowday	f
51d31ab97dd28a271207af20	/59958053_5CogfmHgRpBtjkPzVkAgAjK7q9ac0bo8Z1TPwxPIFAw.jpg	public	grillonwheelsny	\N
5151c82de4b024888079c5ea	/5003144_g8kbTzyfr6gL9vIRpMBbXz4TqBUk5EgkqIPlBP9DtsA.jpg	public	mactruckny	\N
50883301e4b0904987088a20	/2361939_J2zcgauqqGFC_PZPyvkfEDoSufdDe5qE7gi_NkS1P1U.jpg	public	mactruckny	\N
519bb23b498e208a0b81b7fa	/9285455_LZiJ4FLH7NOWjNUsXO9jxDRFAgLygBSB8SmSIW0z9kM.jpg	public	mactruckny	\N
5165924de4b093be3bc5cd57	/2159706_uFl3RYgA1z4EiDNp8PtjjG2HHWhTiiXDLNzJtFWPHS8.jpg	public	mactruckny	\N
50ef1f18e4b0710a5e5cb1eb	/117715_4lM2ZgzHp4Uv61-ckuWzdXXXcPVNEH2NjISpWAEjGds.jpg	public	nuchasnyc	f
507071bfe4b06e882e74b445	/1112203_qnT5k-31-4cRKDz00cUpp7Ia7HG3YTjhsC9Udo90RDI.jpg	public	philssteaks	\N
51645882e4b0bcb0cb0c7ef3	/7511393_dEJJLGO8ljFPMA_kFidoz1wpWZ-k6mHpqYnuRwoBpRg.jpg	public	philssteaks	\N
52fe5db111d2d7644f04c21e	/404119_k2pARWK6AW8sOni-GGVsAfTehHeRbbnRCBGhfeb1xZc.jpg	public	philssteaks	t
519fa37b498e7adf7e8ebce3	/47170230_A9xVWAtkJBP-vVqUF1q2WlK8yuZTf1CVQz0JcPrHGY0.jpg	public	taimmobile	\N
53287c9c498e4b30223220d1	/68150_mMquObtK1F2QjX3VWuhYK2MtjUA9i5QRzexf9zWrBOQ.jpg	public	thegreenradish1	t
501fe830e4b0bbddce992f90	/fFBOGONZt5Zr77Vc5g8adoAiBht0f-MBut7GqorVEjo.jpg	public	mexicue	\N
523c930a11d22e1c3012a9d3	/34169985_AiTXirGu6jTaGeWWhhOfl2QIbGVaQjdDg1QCEakqza8.jpg	public	mexicue	t
53860b95498ee26cd484fe30	/81832079_fNoLG8cvJl_IqYaTNF8p9uwsDsglMXnfF2DKZ8X0Tk4.jpg	public	mtblls	t
53e3b619498e4b9015f0bad7	/68150_s6TPzQTspWKu7AI0DXgjZai6xKrtSkWgIdJNkenXMfs.jpg	public	mtblls	f
523887bb11d2ac89551d71ff	/5568483_apwtHKsNfvYc-IjeDL1_oqXIqZsLTUGH_-l1uxxAiGo.jpg	public	mtblls	f
5203e16e498e9e8e0a93b61a	/702028_Fog-6PEF03KateivIPP-hx87Qn6gi7PwnaJv-wTFv3I.jpg	public	carlssteaks	\N
52e456f2498ea9ece32b66e0	/25812424_w-pfXOZy2D8xWVJY37hGi4VXYiDnicBFvWRiiDOnNhE.jpg	public	carlssteaks	f
4e09f3fca12d09aa881a769f	/NTSOFYDIBYVWGE4RYQTBBNIAQESPZ1LLW3Q4TC3TGMROSJPH.jpg	public	nautimobile	\N
4e70e35c52b140871b6fa35f	/1TB5ROKJY5NF0GAVS4YS3WZTFCUXXHTPLLBUIK4BU0XD0QA5.jpg	public	nautimobile	\N
51ccc251498e028212e9b1e3	/117715_ozxp6K6iPGwKCzQDARR3BgMcisplkTt0x4LEKDJdBMk.jpg	public	nautimobile	\N
5022f267011cfeafe81dab9a	/7EPnN8ReXYQWoZYxzqkH9AQlOe8vFPtVP_60n65i9U4.jpg	public	nautimobile	\N
54978669498e92fb4a6b4341	/97520198_KIqmbmLkuFxboBU_HjFosEOXtwVA01QnxiBHugrwImE.jpg	public	shukanyc	t
526fef71498e92d1ace459d9	/60805368_eCRrBwapYrNL8fM9tmIaLCfnlhQYb9ASU-ZkaR1Og54.jpg	public	mamuthainoodle	\N
5176cceb498efe500552cc9e	/21735785_zaQs-7anNinrrQlobBV2AjNxquTXs5g8ZY0NxvoxvHo.jpg	public	steaksncrepes	\N
523b2edc11d265bf373f82a0	/8853695_cjpq3trk4bFpcU1oHWwj4XxwwD9ZI169sNncUyOQoM8.jpg	public	steaksncrepes	\N
526e8aee11d299d16e74b447	/67629862_ZPeS1alTFabw1hPqq8PCcGF1SRFynqA23OgkKg8yc00.jpg	public	lovemamak	\N
521b83c411d29ec0512f89b3	/255980_1U9yRWzBKuIDLReBhmBs45qJ0mtHu7pzL_Fv4T9gTss.jpg	public	lovemamak	\N
501c284be4b07d0ab63e08be	/vQv8P8_hFNwHMmpR7k6-arr8zqYmmgoSG_aAPJuz-ws.jpg	public	itizyicecream	\N
51e83b4a498e0a1c64e62828	/26624_AGoljLki5SS-GJGKaAGB75mloHKRBkJ1Qj5BQCRP1_Y.jpg	public	itizyicecream	\N
5180207390e7374e46b6c165	/49563206_uKsSD-Cd2jjy6FMyR9U_--7DdUBJ7ZUxtdlushxyIAg.jpg	public	freshandhearty	\N
525c259b498ea7548cf31f8e	/769710_ZxOOtsSbFVklHIRhXVmTO7ops0Pm0EybRDTgUvGHrSY.jpg	public	disosnyc	\N
5197cb68498e8d409a89ec1b	/1847096_oRB5R_owQW40gVWlJhNNsh9_0bEq2D8Rt3Zod9HUbUg.jpg	public	disosnyc	\N
51dc5fec498e4e9be748eac4	/22801_gX0atVT6Jt_H6FPXuYAqHD4VzO5jAmS4SVid_ZLkk5U.jpg	public	disosnyc	\N
511d2c60e4b017a4221bec0c	/1425622_srSMuVL9KOV8rqb_UDiSQNwjvNOtMyF-zeTO7sHRZZo.jpg	public	nuchasnyc	f
4ffef65ae4b013ea5f373be1	/VqxEh6cK784gtMOJRF6Lnub985jBJPC6-FuwZwXt_y4.jpg	public	nuchasnyc	f
519a7e33498e6e4ea6ff66f1	/3354_e_1JMupbEA8VtOBVXgLHAvtJGQwcpHvY2JyFESXYSjo.jpg	public	thesteelcart	\N
51dc0e71498e8db4f9a8106e	/4456614_ZWvsB80ogvwYkoKIyVf6q5RfcDXwuKI4t0XJJhyLQ_I.jpg	public	thesteelcart	\N
4f67b0d4e4b08559c4c60149	/SdNxRS0joKXurf0FEv8_SRg-GeR9lGCN098_ZB2tijA.jpg	public	mexicue	\N
50784742498ec6be8cd3f88e	/155927_ebZApDyXpTKTmvOQHdBTxNc2wJrsZV2QASmpYTNAVJM.jpg	public	mexicue	\N
507efae0e4b09a52c022ec3a	/39213_nH-zcqfLCJqMvG0Nco0LWE4QuRuoL6unlEXJlJbTEF4.jpg	public	mexicue	\N
5192873e498e63958610c2eb	/117715_Jf2pdeF9ztory7puWsPaFE26jmMzPEzjOfPopvTzSjA.jpg	public	polishcuisine	\N
4f7deaf5e4b0ffb6a3f2008e	/Xho5Xq8BtpNhEQvH0KRI3yX4kUstFRwTxEDj6QoawcM.jpg	public	palenquefood	\N
516ef5ece4b0d1c83382c12f	/117715_Gt3J4FMusC7YQjSfEup4O7bAO10z8J4gxmnd0xKnZuQ.jpg	public	veganlunchtruck	\N
508af08be4b02ba9b11cc747	/17430999_28ys6GXVoaOZoKPXLLK5GQpVEL8UrC1_1DajRIy8ia4.jpg	public	veganlunchtruck	f
51dc48a3498efe9483d8417a	/117715_dlhUlP8z_jVejqRlWaCzsJBqg0eoP6rRSjOLpszFA0Q.jpg	public	veganlunchtruck	\N
526e782b11d2a15e6fb663f3	/8761552_XH612BVbFNOBD2jJVEMDzyawnGF45FygNA3TtdKo6UE.jpg	private	veganlunchtruck	\N
52ade258498e293fae46e684	/68150_s7DCORg1dB6IJWWdj_e_pZMg4zKZs3S_Tjkff_px7kw.jpg	private	veganlunchtruck	\N
51105b22e4b0a7b61fac854b	/117715_vKu0po70jlTD3qN9mXsdNiE6V5Od1hmYMVlUY9xSIP8.jpg	public	veganlunchtruck	\N
50292d68e4b0d0acd3bb5dbb	/vv6y8qi6JFfXr9QDkIvTPP0fSmbgQ_jGXHCVwDv0c04.jpg	public	veganlunchtruck	f
5196816e498eebbaef53fe6b	/32050404_-lVnQ_kgFICQK3OBrfq4QydeDqXhz3ZCRD3TrCvMPxY.jpg	public	veganlunchtruck	f
51424d6ce4b0041cb8df9856	/117715_oxR8_TwNSaCL-_gKDA2i2-1YoRfVVnbfT3M9Bfu4nxE.jpg	public	thepocketful	\N
5245c79c498e057f7d5ff65d	/117715_CEghvDHaxkALy5RxQCAVW-kyM0TAZo2-fIT4e6veJeo.jpg	public	neaexpress	\N
500ecc9ce4b0a6d209804d9e	/d2yG6CtTrc8TQAXoEGN68UYAv3DiJIqJvKU65-ApcaU.jpg	private	lobstertruckny	\N
5245c7a1498e0eb9bc097723	/1727660_xLZtYmqATL4pckN_IhgIj0AgUbDAJxywzqbf5PKEooM.jpg	public	lobstertruckny	\N
4dcbff9440a3324246c6fb7c	/YVZPSDS5D1O5DR2NK5IFQKOU0ZNOQTQMTHMRWS3ESLQIQAWK.jpg	public	lobstertruckny	t
507b0648e4b0109f3656e2d2	/76137_7JNe3m0dO2MZ7a9rkqa_DTlnrw0LyNitqksFG7_5IC8.jpg	public	lobstertruckny	\N
508abe69e4b01ff7516d118b	/8029486_9wt2tO9BnY5d11Ef0mpAgHAqfK1QMmSvLXglU4fj6Xw.jpg	public	lobstertruckny	\N
5106b878e4b05ec869ad8b34	/814104_blIawoImaEcqf-Mg89W5A-nEHiZ5jx76BEYHVzz8dnA.jpg	public	biandangnyc	\N
50ce2696e4b0881a7ef3ee67	/263293_lcA30Y_JnQGKaaHhRqFUio2HQ8UQkphCWP9yhW4CE3g.jpg	public	domotaco	\N
520912ad11d2f941183dea9f	/13285510_v7K0PTg4FzGI822Jbc9A8K5mUHIxwJPBZB_0xNeEauE.jpg	public	domotaco	\N
50ce269de4b07c1547ebfb2c	/263293_qjcLaRmf5itOMyRiq4AyYZuY2UVjVJk04lO3FTA2CMY.jpg	public	domotaco	\N
5079a745e4b00277f33e4836	/34723233_tCoDnWhdhZj61xi_e00MNwJoK_UcfDXCQQ7Weat8pBM.jpg	public	valduccis	\N
516cdc93e4b0d6bb083f9db2	/117715_3eRUhgkRZGVpjDAYUz9TD5yQXPVFmg0iCB7iIgv_XD0.jpg	public	souvlakitruck	f
50be4929e4b0ada0df80b932	/4611139_UjW8jF3qFz_uyk0hDKT6CMZI2q3My4j6ZiwX-68QpME.jpg	public	souvlakitruck	f
52a0bef911d299250c89f9c7	/349672_Cg8dtcrfQ0WZeSo7BJR61YBG6VzsiMltZP8XIqyHiu0.jpg	public	mrniceguytruck	\N
529ccbc511d21047117cdea2	/68150__CRf8sW9KvXZTkcAQEc4EsnYPgqXA2trmMxy-_AzobY.jpg	public	mrniceguytruck	\N
51c8a3c5498e797153ec5629	/46314126_95x6AErCZEGSi1zGZrFCY-EzgsIMyOhgO4G59l-u_Xg.jpg	public	funbunsnyc	\N
5212ec18498e9494b634a94c	/814104_tUkLgiQ8zcYxovra9R8PIx7FckFhBjzNVHmirteXd58.jpg	public	funbunsnyc	\N
4ffda271e4b03bbc7f8fd13a	/6Dtx8fj7IXT6M3O6ZV3rXryb6zKTAqPchjeOM2BJJAs.jpg	public	funbunsnyc	\N
505204d6e4b02dee62bd961a	/dcOYoRoNNeCLMxvoyAN-o9gJObcw5FljMqYpS9cps84.jpg	public	funbunsnyc	\N
513b9b7de4b04f7024bc158a	/45519738_eDUGOpHYwiR5C3VUps1gQ1YDIq0Di3WMfuirGs2EVBk.jpg	public	rickshawtruck	\N
4f8dc377e4b0ca2accf75652	/EKcue5yGEyaPnBymSd_HtBxWEZl4grYSOXMhw-gqpTs.jpg	public	rickshawtruck	\N
4fb6bb41e4b066430032e4ca	/HHZWTU3POi_yJE4GU0zI_NjZNerm5y3MjjxddcV5ZMs.jpg	public	rickshawtruck	\N
4dfa4a9840a3542ff44549df	/VBAJNQCBWDMP2WKDXJ5QHQ0WYF1MKHZSLUAZZJXKDBDLDUWG.jpg	public	taimmobile	\N
51cb2c41498e9851cecdd49a	/5728350_vuJ4ORu0wHhd-B-f4FTNfsoIhfHgtJRMJc-QEeiYmNQ.jpg	public	taimmobile	\N
504a271ce4b0c65efb6b05f5	/PG0DfZvsxtqv4QM8Xpl6y8Ojahb0UanYwCPSdmuhj_E.jpg	public	taimmobile	t
4fa814d1e4b0d607baf8bd9d	/2drHnu4mqj-uzpwwcJa3MatYGD7KFuxjE472rButWlM.jpg	public	taimmobile	\N
51f4589a498e97316d307dab	/186827_ilvLMlb3AFqgXUQJ43S7IjsLNPxYP3Pw5LEjrqhp6wI.jpg	public	chipsykingny	\N
5135022ee4b0592185aa975e	/2660256_0rdKd0P0tCYzLf5j7-_3b8HbPNDVCW6S0hHdJGW47Wo.jpg	public	mikenwillies	\N
506dcb8be4b0748e0467de78	/157259_PdYI3Fpzhcz_LoGnBeymaSAZaZCiVVw43c4xaYQQIDY.jpg	public	mikenwillies	\N
51117858e4b0e14064917adb	/263293_EvgjxXJqOivd94q0mbPR_AxkRXuzkFtjOBcOWnXuyQU.jpg	public	mikenwillies	\N
5012d0d5e4b06fc7ce735a68	/7J2g1YLtx4ma57g4A4CerJJ66OwudjGhFI67JaNl1Qw.jpg	public	seoulfoodnyc	\N
4f5e6b3fe4b033732b227036	/7Pw4h0QMNateMpgFd_DAFO0uUnsIdcGzmHG_1in7Wu0.jpg	public	seoulfoodnyc	f
4fb1335de4b0f4503b23a67a	/GSQxN-iFZejvploz8v8hm2QzrWiTmg6QdgBffmHvsnc.jpg	public	seoulfoodnyc	f
514e42c7e4b0ec8b7e400875	/48992751_ibL8tx_7JPvV3aQmnEevrdibtLP0jWytaChkCdRuhG8.jpg	public	crafflesnyc	\N
514e42a8e4b0d91e975b3db9	/48992751_womoOVd5bv-2KopmWjWEHA_WsyoWQITjAyXBuM4Ciz8.jpg	public	crafflesnyc	\N
51ab89bb498e83fced4cefd6	/66074_8dLzCKmVRde0Uvtx_NSl9SKROFh0kat1IQgcAvU4J3M.jpg	public	delsnyc	\N
51fd732d498e415eeb8b9881	/8839239_mAp7_MVmWbbK42Xq3-W-1zmegy-MNx8NzB0P5Brf-Pw.jpg	public	delsnyc	\N
520e673a11d25d1282a44199	/117715_KjwJnc6idBB7TuMKhGboHDg8IYjlGcr6h3I6_fJECmM.jpg	public	delsnyc	\N
51b8d7aa498e103b3a36ec2d	/47900463_7B6lLfz2PW1XyrG2vCIxp4vIq7QXWEhxufI5i75jwxE.jpg	public	delsnyc	t
506dc9b9e4b0c21f078c3bb3	/22983_XN2GbKo3a5YsNY_ZpiBcjUHTD2if3TWS8r586Uq4cEk.jpg	public	blend_express	\N
5033cee6e4b03e64bc749ee7	/tIyy6IAKcw2SSiX5JSPBCURstZZisntK_46plgrfdJ0.jpg	public	blend_express	\N
519babe8498e355d9d35fca0	/65817_6p9jSMaQMqP9QGn3KOIyuDOG15jaLxIPvsdrpZGWdj8.jpg	public	blend_express	\N
5249c4bb498ecd25dde27c5e	/764670_x0RdEOs5TL4SEe2zGgpkzPFBFmlFV7-6UQiVtoFeHaY.jpg	public	goburger	\N
51dc5a9e498ebf7ad40223ec	/1328035_Ak3fMs2e36r7NvIE_gIDK5XZ9CwrW1DEJa3g1oobp5E.jpg	public	wingnitnyc	\N
531b7d5e498e3df35f261af2	/22402741_aYe825rrQDsEq6E_Pqv35za149PBn1PcT557SaJhOK4.jpg	public	brooklynpopcorn	t
5220dc78498ebd10d150f736	/29917892_nMZHXkfxBukc2QfFqtDBTZSJ1xpMkoO7VGBJmGKkwhY.jpg	public	brooklynpopcorn	\N
5258d3ef11d26d03cc0563a5	/117715_GQ_O1nyBbVlKTaYpRlprc8ZdIEAEftbU4_9hDGjvxsU.jpg	public	brooklynpopcorn	\N
50e719c2e4b0e263423e547e	/15471_4uN0tddGW5orNGh02xhxbiAOGUpAAy3rIWEotoRgB_M.jpg	public	tacobite	\N
51a4ee69abd87ea53396c979	/4083549_jMzaCPEId80kWmAaq2oQ9APKf4bLvdeHhy40qPeB9j8.jpg	public	shortysnyc	\N
50045b1be4b0004dbf67c977	/MDweBG1fBnF_fZ1tOghWyHS9qUxGNiJeOrOpoA-fBrY.jpg	public	shortysnyc	\N
4feb2bb8e4b0a47cf49787d7	/-CEaOy-zjgmGzmPRViSeNchwIITBbHgI3lFosreLqIE.jpg	public	shortysnyc	t
5008051fe4b0974c844d5003	/oNy0_bsWPyVmjrduzJXpbrAPHjQS0PVbyOCfoRSD9xE.jpg	public	shortysnyc	\N
50f99bcee4b08ca132377f78	/4611139_CEH3eveI6uxlRVQLet5Fpa_sNfJwAzfheMTYSBplO5Q.jpg	public	thecrepestruck	\N
512bbfebe4b0b8faa466c796	/1425622_4wp7wCuj7Ci1dl_FVH9syKmrJwQavMhL9uqww1b0m1o.jpg	public	philssteaks	\N
527e77d111d2e66fa6a871b3	/649454_HIWthX8nL3SZAOwyMlKj9Y7ju9GCiN4OEV-wZR6IKC0.jpg	public	philssteaks	\N
4fe65d6fe4b09198fde5842a	/nVmhJloDitdcBPFceYT8ajqQqgXBpB_w5GoPWse33Ks.jpg	public	valduccis	\N
521e9e4511d2d8ddc5c69dbd	/117715_r7cpzyXCpOthqHouR5gdqIMX8k0TZ2KWHFun5wh-EYk.jpg	public	valduccis	\N
5203bd51498ed50247ee01dd	/60805368_HlIeqCMjY2I5md2mzI5crKizc9wVPUZo_sBmC6zrPEA.jpg	public	mamuthainoodle	\N
5182ad6b498ef6cb59d48783	/39425123_zPh6ih4GAAygbhRJ-pyPdCr5TI3rXafgKyIEEK4HpHY.jpg	public	goburger	\N
501d4734e4b0af03cf473287	/6BUHUmEyYTTh3a2SRjSYRklUlTfQBNbFnnk_hfEojYs.jpg	public	goburger	\N
52013fe1498e5f476bfdcf83	/30611522_DHhazmY8dyNAbmijjHX7jyyfVBEiugL5-GJcTLuYjS4.jpg	public	getstuffednow	\N
523c8b2a498e959b87f8ded2	/39707564_-WCsPSk2ExKeZ8q06DtUQrpt_vcWG9-AzvFoToSdQqY.jpg	public	getstuffednow	\N
51af7257498e0c7f8979c05d	/752258_nUJpoSxZ8p9BBJMG5ISetpo3DDLzycLT_gT3z9fvJmI.jpg	public	getstuffednow	\N
50ca356fe4b05b0bb93edc40	/1590381_NyRIp7fXJtGoJoXp25IcMmufNufPxxvLEj3TVYXRo5g.jpg	private	getstuffednow	\N
51dd9efb498ebbc846c11c03	/13001992_b9dLXH02o0ZX8hyUZVtpgGW6sDyzAl23vmEl-0Hj0jY.jpg	public	itizyicecream	\N
538fa2da498e8efc80bc2cb7	/26065139_jgo2VLUL2PokQdo7SP2iJ6rtca8E552GZGM3Bhu1e28.jpg	public	langostruck	f
529fe66b498e1fd14afe696f	/68150_h0wbg6xbNwrEjXD6uaE12ZDZYF_h55LN99Es520nMBI.jpg	public	mooshugrill	\N
5267fa9611d2688bdc4587a2	/2136029_bvqot1MnMJ9IGYsYJkamqTiE_lL96OcfilWMxskhdU8.jpg	public	mooshugrill	\N
5213a7c011d27a56f99dfba3	/11074699_K2ka1_NxiELyTqgjvY3oMN70IUxIlADqRIAb5QpzsLM.jpg	public	mooshugrill	\N
501975c5e4b092f6a51ef338	/bI7RrGcK_moyn-kJICa1OCciBVuYYykwCMGlea6mcxg.jpg	public	kimchitruck	\N
4e00e61aa12db1129557e99c	/WSUNYIB0YFVRCTXB13UCRCTANZUG0DO0X2FWCUYYILU4TCGB.jpg	private	kimchitruck	\N
5244712a11d295d581384a17	/22780_QXd0BtJcOWXZwSm_ZG3oXyaNj6Qw5-p8hWQzzH121fY.jpg	public	polishcuisine	\N
5328764d498e217e55fa24e1	/68150_4QSMIi6zBoyrZ1VeH1Dqb3fEovQswz93yHAPvf2lGmQ.jpg	public	dubpies	t
532879fb498ec68315b3d232	/68150_KF6qgT-viSOMS5bt3lJarsNeEUjlVJn1lbAypyCl1js.jpg	public	dubpies	f
53287a0c498edd9a0567c2c0	/68150_i3UKBmIXHPN4h7gtvSQjnYfikUNmJuGRpjwKP2dLI5Q.jpg	public	dubpies	f
5345d100498eaa611b76f338	/62345083_i2VdE3VeEPlbfUgNv9mWmVmsuL19upJhcHaRX3zje1w.jpg	public	dubpies	f
51800af8e4b07a4a57023def	/9548073_erhzj0ShEDKaz8S8DhlDe90fDjJEIWjilIxO4_zjdGE.jpg	public	thepocketful	\N
516d98b8e4b0b059e50ff5ad	/117715_BoNkQJO4jPWEtg_ef4-URb7IseoIXnYiP5vkvWJtezg.jpg	public	toumnyc	\N
51716b5f498e03d8bc252c48	/11709298_S8klPxq0yPyZw2X9-_0IZyk6TFTn9xi5SWd_6BGCeVM.jpg	public	toumnyc	\N
507dacb0e4b0d8cafc9601e0	/2361939_S3NwwSNVZD-2tAhc3bwAvsYgk9tXwYv0T0yq9ci-ihE.jpg	public	toumnyc	\N
505c9776e4b0643aba1071c7	/5568483_yQrtG73dbug7q06p9IASJmTFnOVgGprIZKbfHjQRcso.jpg	public	biandangnyc	\N
527d2c2711d2c984e85cb11b	/4179871_5FQ2eCC5ZeizUVRLh4tadgEAO1BnJjVQ7pSEvSDwIfQ.jpg	public	biandangnyc	\N
512161e0ebca7d20d6a70104	/4574_ZC6mf3ha1jNXmFUDgtNsN3zIf-NHyqgxA3WkUkOl4mY.jpg	public	biandangnyc	\N
4ec59ebacc21b428e0de466c	/4AMXSGP5YGTUHEL3TFKTS5ROVIX4HUTU4MU5ZW1OX5E3URDD.jpg	public	domotaco	\N
4f753600e4b07eec20023ddb	/zUb4OswXiQLnF_k2xnx7AdupnEIl1nuGyIuFcmFWf8Q.jpg	public	thetreatstruck	\N
4fbfe026e4b04422a08a40f6	/Han8Z4R-SQ615pLoN2lRdPfKEFa6UW2yudSOxXmJtts.jpg	public	thetreatstruck	\N
51461b9de4b0bb73a6821e97	/1102787_UDt7OJpexNs8VPrehVDsp9EtfUJnMhKzJ2tTXuof06M.jpg	public	thetreatstruck	\N
50031911e4b034c2944f0c3a	/bExPPWxN-4YhYlw2nPz-T5eA3mYN-U78LUZtcIzjTRM.jpg	public	souvlakitruck	t
51378e9ce4b071feb46ef7cc	/18792384_RSm8zhe_6kUOxy91taByfRjTDSLp7stH7PI41aJHOrU.jpg	public	bobjotruck	\N
5249b50c11d2d415e3c6b017	/769710_HOnpTjl0b6qd4-yoPpg9lXZGBy-ZKikqzLlFWw2sQfs.jpg	public	bobjotruck	\N
4fe20639e4b05dcdf7f5737c	/l9UdGGevddtOhDk6scQjcy1-TbVBX-wf8Gf56jBIRIg.jpg	public	bobjotruck	\N
5249b1c511d23e54343ae083	/769710_HUiZ7dJrNbdnPYV-DTQRr1z0zgoxFx9KMC_Y-OQ6O2o.jpg	public	bobjotruck	t
5199097e498ea36447e54093	/40899881_hbjUdavpBfT-sLaBhv3pbZydT1tgs9v-Maw12j9I3Xs.jpg	public	carpedonutnyc	\N
5254357b498ec4662e20c654	/2620660_kMXeinZ_B6lOrHRQnheIHMBr7p81ZxcUblWl0SQ1vEs.jpg	public	thesteelcart	\N
51c213db498e0748ab0dca3c	/53641916_5aNKp9fdHx3i_Pi15Z_X6pE3fAsTX35YBQ0nlmZGfaA.jpg	private	morristruck	\N
50ad186ae4b0b639ca7ca234	/295161_qCQYG0XjW1Ji0pSDxM7fWRzxTZRbcYyZbsbPNJo12hw.jpg	public	toastmonsternyc	\N
521649b811d2913e20a1ae87	/5568483_RtMp5aDM_JtBZOI1u48Jy3om4Z672obezdu1uA_UWd0.jpg	public	toastmonsternyc	\N
518a82c9498e068718057964	/25979758_bGWQQ7W2SJI4v7KmU891VcYZGitov6qbSNAnIEt8HTo.jpg	public	toastmonsternyc	\N
53287a41498ef1dfde86d217	/68150_jBIeF8OZP2o4q5lJjB4TeUteiuuczqDDm3s4zQGipGc.jpg	public	shanghaisogo	t
530f7b7b498e225c3989957a	/20103877_gKGG5Z15ifazVa7PoBKpyKecZK7x2dWgjFIDOkwO38c.jpg	public	shanghaisogo	f
51f15b4d498ee58fec420a7c	/13285510_Q-SBXKFpfroSwQ-QJdezzrh1KaHfHAmLyicy8d5S1jU.jpg	public	parissandwich	\N
5243126c498ea77b19b3a444	/65506790_31Qpx9E-ZjuNve-izmDY6vVxUCMrhgGsnOLn4-fusp4.jpg	public	parissandwich	\N
51b22a0a498ec00d1c45726c	/390807_y2oeK6xR54wk9b1Sfm82Ek09Auv2lNkRTpJOzos3xjU.jpg	public	parissandwich	\N
53287ac3498ee8ce8841a510	/68150_pNBQ4zhtsUiGR_kyfk0HziUGMzyIQwYcYpJ3VpZf7tk.jpg	public	thegreenradish1	f
4fc7a5d3e4b0647c52b3c26e	/iRvxK7ohXIwK9Ib6wkVgtR46VKRLsamXuElhEtOlNKc.jpg	public	andysitalianice	t
4fc2552fe4b0cec932846e84	/cjaTu8CSMM7HvFDxIUk3I2TF_I8mJyZuejfwTgYLc-c.jpg	private	andysitalianice	f
4feb6e00e4b048145c547997	/wcCcDDUFo3EAkWygR8pGn29HTAv7VKEvPwJgzS6hQcw.jpg	public	andysitalianice	f
5286645011d228bbd12f9880	/1353667_2qCG26N4ikz7mbvEGkrFkcNLagGqrzRuNyeQ35CCDE8.jpg	public	korillabbq	\N
5231f54311d26e8da5827f3b	/977282_AToQDrlKW5PTNbNGQcB24_BeJNsRMgZTeYmC9P-or38.jpg	public	korillabbq	\N
528e451f11d2a93e4361f565	/977282_wEw3nDjN0NbjC4CgQ00ON0YjdtnMocrfAjXDM4UH63Q.jpg	public	korillabbq	\N
51b8a845498e8ebdef064e0c	/761163_j9ai1NfaIpK2TLN8JzXbTwyIhVzuZevNHBV5EpQ7Fh0.jpg	public	palenquefood	\N
51435e1de4b07d53cf71fd7a	/4486_lUhkecOFThYlMHKai4wDp4lXXiQSPLTq3Nno5WMIz7E.jpg	public	palenquefood	\N
4e6513efc65b2dc8a0bfff6d	/TUQTIKBJPOALJKHN54QRKGISWMQDDOW3WTAECOGJ4FOJTPXI.jpg	public	palenquefood	\N
4fb29dc4e4b0e08c1e225555	/ckjwTj4Fd2cRoZvDQZw_1jYdwuBF4BsfV4ZWc5oElFo.jpg	public	eddiespizzany	\N
4da8977840a3582fb8c49316	/MCGIPRA0XR15JNG4O2YZJQBCRMK05UVTC4T14TOQWRTNMQFZ.jpg	public	eddiespizzany	\N
4fd79157e4b071eb33a9c810	/8zrcTIejD5EBiOJzSobql1_PQWr-i2KmRfgMCYmbK-M.jpg	public	eddiespizzany	\N
4f9c18b0e4b0b38d2f554383	/AQEKYbyPrQt5uMWhy4r4ODm2vSMCqPseJyMhcg55mtY.jpg	public	eddiespizzany	\N
516452a5e4b0e1b216fdbaa4	/26263584_5wpEOb9FygNRBFQySA-pE1t1q_E9jVM_4mx2mnw5fAU.jpg	public	toumnyc	\N
520538a611d2b476431ac7f9	/117715_GMdoseCn4baUtTX9kN6_PAAfHaGIlUpjxzAitpqLAOY.jpg	public	chefsamirtruck	\N
5189442c498e765ce62d5924	/2432527_5nUa0fTfy4rzjXpiIUIlkguBa2kdqFSZIG-PLvkKu2Y.jpg	public	chefsamirtruck	\N
4fd0d80de4b062589043211f	/hZjMDK5KKgxjMhmOGBtaRjx_ga0SWHwppqfLfqw20Tg.jpg	public	chefsamirtruck	\N
5294e76b11d2879d5217bd00	/47558447_v1SwJZbLSZ2etlJXOF9qw4H3vErpdTiVIqXxULSVTSU.jpg	public	chefsamirtruck	\N
521f754c498ee4d6fbe8a778	/22491899_EEPqf4HeJFaaFjYabKyScGZ8symjXEgMjPUEkfpJsJk.jpg	public	morristruck	\N
51856452498e6f602088cbe1	/232510_pLk3QUUWFOu82-4SX-ObtA8bw2ZPf61QBOeIuL50T-o.jpg	public	morristruck	\N
516ee142e4b04f28d58be309	/36812449_DjR1ynMnMpwj-KmiWPZQldmGQwJ2IEzjSwwmGevqe3U.jpg	public	sweeterynyc	\N
5107e09be4b047c08ade6bf6	/760350_ZaalKVnOYdVAGoQEdugu-1Lws1LubyJBOVpZvJJD1V0.jpg	public	sweeterynyc	\N
50188a43e4b0d35e6d8035b4	/b-fKh6mx2WxCybNQkr9ovk_jv4x7bwJPVFM9RF3M5T4.jpg	public	sweeterynyc	\N
52e6af38498e26e622e5398c	/4147709_E9hzkLfHAJjdgQ6RT3W29cf-cftJShyXpRthu8riZYs.jpg	public	hibachiheaven	f
52e2aa07498e25b9a084ee94	/12998378_50qpDzH_XwsSlaJpw-f2fDtJsSvQg4TU_ujjdsnyWOw.jpg	public	hibachiheaven	f
5362891011d2b40c5f328b6e	/41834822_k1LVelyLVM9gsNt3M70sVjI-QLm_84bgv4c6hoMHPO8.jpg	public	hibachiheaven	t
4fda1cf4e4b0f6aceebbdb2d	/lKL7uz06jZgB680Vye9zxa_2yQfH96afFExvxaLlRpU.jpg	public	hibachiheaven	f
50a696b4e4b04d062582a95e	/32050404_qo6ZUnU5LQMoqrAR6YoH5Qz-PdUcD1d1jCheEJy7lng.jpg	public	thepocketful	\N
511a7d64e4b0c6a64118260c	/793192_Dtd9vMRk-pbBJscn1cb7n29zM87iJjZy6rojapRhODk.jpg	public	thepocketful	\N
4fbfebe9e4b0a3bda0340383	/Brw9_z178IK92xMEXLCSSZrP0-99GXjutCp7dHCi5CQ.jpg	public	thetreatstruck	\N
52d32962498e318b0a9942f1	/61382883_iF5gX7tlMJ3CWlWcTkpntPniCUpS3o7H8anOau4wiKA.jpg	public	usafoodtruck	f
51bf306a498ed0fde41060d6	/250434_ayEUsJHsbHDQFjUrGrR2fdlBjswuffyRTlWWFrW0-dU.jpg	public	fritesnmeats	f
5413499511d26b1c8b577c09	/4195495_Ir_R8BxT1YxyTe-VuFD3U5pw6j9CobWIBlYp1FF-TwI.jpg	public	fritesnmeats	f
4e42f5ecaeb7f6be72c39c70	/JC5VO3Z50HMMMVLCCGWDQPMKF4W01VBXP1QS2LFESR55UHIX.jpg	public	fritesnmeats	\N
4fe1fbabe4b0be4ebe6c1c52	/HNMFUfRPXDmxSDWAwh7pixJ34SFUY0fgzZFeOLAVXU8.jpg	public	funbunsnyc	t
520f87b511d2e753e7955853	/44_gUd2HlRFt-yMUFcOdI_EUCdz5NK86hKk-3kHwZhHou0.jpg	public	carpedonutnyc	f
542a28a1498e4288ab95e302	/68150_E567_ql-1p2jEv5ysetaEOgtnxpMmeLwZghpwLximCw.jpg	public	papayakingtruck	f
542a28a8498e8c25fb70df8c	/68150_ru2bxW9jr0deeGFaJrvEbwBh8Bv1FRW82ZIglwoRv1M.jpg	public	papayakingtruck	f
5109aed2e4b01d2a5b69b022	/117715_0jgrjk5IsUFppNAL0NtebyMYoz1JMdzrnWAIjrLMHZw.jpg	public	schnitznthings	\N
5012e555e4b0dd18ec16bd37	/mZQAOCmv5lnRZ1qOUTwDXk-MLC-X-p01AfECgfLJC2I.jpg	public	schnitznthings	\N
522e088e11d2d4539942a387	/39707564_2mJZIxFUyGllfVMRjXdE86dZsCxH8cmCdUv29E4dfmE.jpg	public	schnitznthings	t
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
51cc7075498e8d24309aea57	/991186_cg_CePJhqcT81QY5l1L4eB3MQxy_QlsRh4zmZDk8cFM.jpg	public	biandangnyc	t
5239ddce11d2ab4765d5cc7f	/5568483_alwOH7sfGU8-pKfLmurfe9rt3pk2G6p90KwFyC6hq1A.jpg	public	sweetchilinyc	\N
5208f543498eaeeaaad3ce52	/15629_P_UAUr_S-OO0R12wNp8LDPwr-ZbfPiWeG0Q0rrjW6Ww.jpg	public	sweetchilinyc	\N
51f2be1f498e71235db5b61b	/117715_mGfGU0UGjUMhgqgwrDPf2f44NZtfMrobqJMF8ahsrjY.jpg	public	sweetchilinyc	\N
5280c18811d2e4df572063db	/5354893_5EtQmcwzMnTRFz9qbxjkt9FguCAC4xfW5xwUCyYIrbQ.jpg	private	waffletruck	\N
4f733c44e4b039d898ce1409	/PQ9G-O3CAtCW6ixkiwHhICEaRn0L3Lz1F95zKcl_GdI.jpg	public	waffletruck	\N
4fd26038e4b06145dfb72894	/zUVUqzIwbwoFsRrRenEhtDmBSbK2Ry9lzqeuYnmnHG0.jpg	public	waffletruck	\N
527e823311d2db75dd831ee0	/22419482_1rrrm4nhOKXQsXN25ApmVsGDw4t2J3GyjhfeQPEbClU.jpg	private	waffletruck	\N
5106bdece4b051d6cb82a376	/1922740_Eqg3x5oj7wks2XGfudNYIAzcCuZHJiWpgLP1CCbonEE.jpg	public	gcnyc1	t
4fba74c1e4b0a2484fae410e	/1XmG8W_3-cY3Qc-l1GwU7YSOBlzOwyGtk2BzKOkxqYY.jpg	public	gcnyc1	f
516d80bd498e8f3b47ac90e6	/36812449_Vbw1XbeTn6HJHdJF1bzMp9TvcwrqCP5edmktYCzlW6k.jpg	public	gcnyc1	f
51eae36e498e58d50e5683ba	/331066_SArUzXa_cz_-YMQco1rwYAfU8a99TZCHJX9a2WA3fHg.jpg	public	gcnyc1	\N
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
23	51st between Park & Madison	51st (between )?park ?& ?madison	up	40.758212	-73.974371	Midtown East
39	King & Hudson	(king|hudson) & (hudson|king)	none	40.728086	-74.007317	Soho
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
22	50th between 6th & 7th	50(th)? between (6th ?& ?7th|6 ?& ?7)	up	40.760400	-73.981444	Midtown West
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
97	Houston & Broadway	(houston|broadway) & (houston|broadway)	none	40.725457	-73.996819	SoHo
98	58th & Madison	58th & madison	up	40.762954	-73.971847	Midtown West
85	46th between 6th & 7th	46(th|st)? (between( )?(6&7|6th & 7th)|\\(6&7\\))	up	40.758025	-73.983710	Midtown West
96	21st & 5th	((5th|21st) & (5th|21st)| 5(th)? between 20(& )? 21)	mid	40.740258	-73.990499	Flatiron
1	20th & 5th	(5th|20th) & (5th|20th)	mid	40.739680	-73.990847	Flatiron
28	55th & Broadway	(broadway|55(th)?) (&|n|between) (broadway|55(th)?)	up	40.764966	-73.982223	Midtown West
14	46th between 5th & 6th	46(th|st)? (between )?(5th ?& ?6(th)?|5 ?& ?6|& 5~6)	up	40.756625	-73.980321	Midtown West
99	45th between 1st & 2nd	45th between 1st & 2nd	up	40.751243	-73.969530	Midtown East
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mca
--

SELECT pg_catalog.setval('locations_id_seq', 99, true);


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
7	(btwen|btween|b & (w|t)|b\\/w|bet(?!w)|btwn|btw)	between
\.


--
-- Name: subs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mca
--

SELECT pg_catalog.setval('subs_id_seq', 22, true);


--
-- Data for Name: trucks; Type: TABLE DATA; Schema: public; Owner: mca
--

COPY trucks (id, name, twitname, weburl, tweet, retweeted, lasttweet, lastupdate, type, about, foursquare, matcher, loc, matchmethod) FROM stdin;
deliheaven	Deli Heaven	deliheaventruck		@downtownlunch correction we are on king&varick today. The word of the day is amore for ur free upgrade. SoHo get ur deliheaven on	f	1392220340	1392220340	Deli	\N			\N	\N
chipsy	Chipsy King	chipsykingny	http://chipsykingny.com/	Kasar truck is at union square\nBroadway and 16th street\nAll day until 8pm	f	1407255461	1407255461	Fries		51bb5c43498ee06e13d0d31f	\N	\N	\N
trucktotable	BistroShopp	trucktotable	http://bistrotruck.com/	55St & Broadway until 4pm. Let's goooo	f	1420227139	1407427421	Moroccan	\N		\N	\N	\N
mikenwillie	Mike n Willie's	mikenwillies	http://www.mikenwillies.com	Happy Taco Tuesday!! South st seaport Front St. & Fulton St 12-8 ComeGetSome	f	1403394007	1402414859	TexMex		4f205f0ee4b0294b35a1178b	\N	\N	\N
seoul	Seoul Food	seoulfoodnyc	http://www.seoulfoodnyc.com	Come to 51st street, between Park and Madison - it's lunch time!!	f	1392220033	1392220033	Asian		4e74afad88775d593d9a7eb5	\N	\N	\N
miamifood	Miami Food Machine	miamimachinenyc	http://www.miamifoodmachinenyc.com/	RT @YouGotSmoked: Park Ave btw 33rd St and 32nd St from 11:00 to 3:00 today! New York Aged Cheddar Mac and Cheese! Delicious nyc http://t...	t	1421905524	1389964561	Mexican		514b53aee4b00c3e98ec25e9	\N	\N	\N
craffels	Craffles	crafflesnyc	http://www.craffles.com/	Happy holidays!!!\nMake ur holidays sweet with our delicious crepe or waffles. Our location for today. Hunter college and union square.	f	1421616846	1388428190	Crepes		514e426ce4b05bcb261d910e	\N	\N	\N
yankeedd	Yankee Doodle Dandy's	usafoodtruck		Betsy is at the Intrepid 46th st and 12th ave and you can come check out our market at 39th and Broadway from 11-9.\nMurica nyc streetfood	f	1431388038	1431361501	American	\N	52b497e1498eed13ead2b84c	\N	8	\N
vspot	Hit your V Spot	hityourvspot	https://www.facebook.com/VSPOT.TRUCK	47th and Park from 11:15am to 2:30pm !!	f	1412066274	1412066274	Vietnamese	\N	53c9479b498e2dfa7e205ff0	\N	\N	\N
schnitzel	Schnitzel & Things	schnitznthings	http://schnitzelandthings.com	The truck will be on 47th & Park.  Schnitzel time.	f	1422645854	1430322671	German		4a6640b3f964a5204cc81fe3	(schnitztruck|the truck)	16	contains
shadydawg	Shady Dawg	shadydawgnyc	http://www.shadydawg.com/	\N	\N	\N	\N	American	\N	536e77ea498e8b0d31167218	\N	\N	\N
mamuthai	Mamu Thai Noodle	mamuthainoodle	https://www.facebook.com/MamuThaiNoodle	Hellooo Dumbo! We're back for your noodle needs! Come by for your Thai noodle lunch! @dumbolot @DUMBOFoodTrucks it's the freakin' weeken'	f	1431302874	1429892104	Thai		5126a10ae4b0af674c85f353	\N	54	\N
steaksncrepes	Steaks N Crepes	steaksncrepes	http://steaksncrepes.com	50 st bet 6 & 7 ave for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	f	1397096188	1374766188	American		50f44167e4b0af5bf46321ce	\N	\N	\N
yume	Yume Teriyaki	yumefoodtruck	http://yumeteriyakigrill.com/	Yume is on Hanover and Water today for lunch. Start the weekend the right way :).	f	1400251565	1400251565	Japanese	\N	530cdc14498ee06c95ab14e0	\N	\N	\N
mausam	Mausam	mausamnyc	http://www.mausamnyc.com	Thursday's favorite @dumbolot don't miss out on your mouthwatering curries & bites http://t.co/xuN2Tqb6tF	f	1431385133	1431001172	Indian		50730eebe4b0f3224431dc5d	\N	54	\N
dels	Del's	delsnyc	http://instagram.com/delsnyc	We apologize for being MIA the past 2 days. We've been preparing for the hottest day of the week! Come find us at 21st & 5th Ave until 4pm	f	1410028765	1409149941	Sweets		519bb56b498ed2dfa950ace2	\N	\N	\N
blend	Blend	blend_express	http://blen02.wix.com/blendnyc	Happy Halloween.   47th and park we here.	f	1421948094	1414774175	Latin Fusion		4fa94528e4b0f8fbf13317e6	\N	16	\N
mamak	Mamak	lovemamak	http://www.lovemamak.com/	hey guys we are @smorgasburg pier 2 @BrooklynBridge_  come come come! http://t.co/llBP6I0uKb	f	1428854214	1410708157	Asian		51c4cffa498ec876f564a0b4	\N	\N	\N
goburger	GO Burger	goburger	http://www.goburger.com	We're on 91st and Amsterdam for dinner tonight. See you soon!	f	1402176073	1398896034	American		4c06b3eccf8c76b0a4eb3a65	\N	\N	\N
getstuffed	Momos & Buns	getstuffednow	http://www.chinesemirch.com	RT @GovIslandFood: 1/3. Only a few more days till Gov Island gourmet food market powered by @livefastgroup opens for the summer. @Getstuffe...	t	1408198481	1400698983	Chinese Fusion		4fa016cbe4b05d0fc11262c5	\N	\N	\N
itizy	Itizy Ice Cream	itizyicecream	http://www.itizy.com/	Likely our last three hours at Columbia this year! Come grab a scoop of your favorite flavor before it runs out!	f	1382307419	1382122482	Sweets		4fcbdcaae4b00a0e855124dd	\N	\N	\N
freshhearty	Fresh and Hearty	freshandhearty	http://freshandheartynyc.com/	Get your Soup & Panini on with Fresh and Hearty! We parked on 46st btw 5th & 6th ave from 11am to 3pm. Call now 4 free delivery! @3474402467	f	1395241942	1390493878	Soup/Salad/Sandwich		51801f7a90e7374e46b6239f	\N	\N	\N
taipanexpress	Taipan Fusion Express	taipanexpress		Good morning we are serving lunch at 46 st between 5&6ave from 11:30 to 3pm @FoodtoEat @midtownlunch @nystfood	f	1412268299	1408622100	Thai/Chinese/Indian	\N	532b1b92498ea6c0d1026802	\N	\N	\N
wingit	Wing'n It	wingnitnyc	http://www.wingnitnyc.com/	Out here on 23rd and 5th come and grab some wings for lunch today. We will be open from 10am to 3pm. See you guys at lunch.	f	1390923947	1387549355	American		519ffd2b498ededbeef3c073	\N	\N	\N
langos	Langos	langostruck	http://www.langostruck.com/	Good morning Wall St.\nL-T at the corner of Water St. & Old Slip\n11-2:30pm\n\nfood trucks nyc mangalitsa village voice	f	1431350441	1431008399	Hungarian	\N	537a883c498eb7fac064409f	\N	51	\N
tacobite	Taco Bite	tacobite	http://www.tacobite.com/	Today we are on\n47th St\nBet\nPark Av / Lexington Av	f	1415029173	1406907223	Mexican		503ba49ae4b0fad35eb7a8dc	\N	\N	\N
mooshu	Moo Shu	mooshugrill	http://www.mooshugrill.com	Brought our yummy fare down to SoHo today! Catch us on Hudson & King til 2:30!	f	1418139086	1418396706	Chinese	Moo Shu grill is a slight twist on typical Chinese <a href="https://en.wikipedia.org/wiki/Moo_shu" target="_blank">moo shu</a> The three Moo Shus option is enough for lunch and you can pick and choose a different protein for each. In my opinion the chicken is the best but it is dark meat. </p><p>It's easy to order as there is one window for ordering and for picking up when your name is called.	52090e45498e5500a6bd41fb	\N	39	\N
frites	Frites 'N Meats	fritesnmeats	http://www.fritesnmeats.com/	Lunch 2day @ 50th st b/t 6th & 7th av. Burger of the week THE AO TRUFFLE BURGER. Preorder 9172929226 Midtown	f	1431279460	1431351210	American	This is a good burger but this truck is interesting because of the many toppings they carry and their burger of the week. 	4ae9d217f964a520bcb621e3	\N	22	\N
bigds	Big D's	bigdsgrub	http://bigdsgrub.com/	D1 has landed at Hudson/King St. 11am to 2:30pm. Let's Grub! http://t.co/Acih6UfhYI	f	1431292928	1431349571	Korean Fusion		4c968b907605199c2eaec2a3	\N	39	\N
disos	DiSO's	disosnyc	http://www.disosnyc.com/	Friday's society lunch meetings on 46th and 6 today. \n\nCall in orders to: 917-756-4145	f	1431281866	1430489419	Italian Sandwiches	These might be typical italian sandwiches but the ingredients are high quality. You need to get there early because the line can get long and they will run out of some breads. I believe the focaccia half is a normal portion for lunch while their half and hero sizes are pretty big.	519523d6498eeaa6200aad03	\N	13	\N
grillwheels	Grill On Wheels	grillonwheelsny	#	Monday corner of 46th and 6th Ave, 12 to 4 Come by have a sandwich or a plate and get a free drink!!!	f	1431028753	1431346281	Kosher		51b0bf31498e9b68db75612c	\N	13	\N
shortys	Shortys	shortysnyc	http://www.shortysnyc.com	Up and running at SouthStreetSeaport South and Fulton Streets Cheesesteak ChickenCheesesteak RoastPork... http://t.co/awyzKOzJqw	f	1431386810	1415982867	American		4faea2cce4b08a88c5dc5d05	\N	58	\N
elpaso	El Paso Truck	elpasotruck	http://elpasony.com/	Today we are at @Columbia between W 115th & W 116st. Stop by and get your tacos, burritos, quesadillas yummy  tacotruck FoodTruckfriday	f	1425157921	1412955921	Mexican	\N	523c911f04937624937304c5	\N	36	\N
gorilla2	Gorilla Cheese 2	gcnyc1	http://t.co/4ZDqfwSH5f	Beautiful day...\nG1- :( off road for service\nG2 - Broadway /55\nComeToTheCheeseYo	f	1431278765	1431358305	American		4dc2d3e352b1c1fb37f1e945	g2	28	before
crepestruck	Crepes Truck	thecrepestruck	https://www.facebook.com/thecrepestruck	Come ceck out the Brazzers promo truck in Time Square 48 & 7 ave today till 4pm. http://t.co/wUDdRIZpAh	f	1430844040	1406998102	Crepes		4dfb854918386e743d9869e3	\N	\N	\N
kimchitaco	Kimchi Taco	kimchitruck	http://kimchitacotruck.com/	Can't imagine better taco weather. Find us on Hudson & King 11:30 - 2:30	f	1431266562	1431006631	Korean Fusion		4d6ee122b45b59417c6a6778	\N	39	\N
brooklynpopcorn	Brooklyn Popcorn	brooklynpopcorn	http://brooklynpopcorn.com/	@Sebastian_Otto We are on 70th and York today! Hope to see you soon. Thank you for your support :)	f	1431354821	1415296416	Popcorn!		514a0737e4b09c3e77279d83	\N	32	\N
cinnamonsnail	The Cinnamon Snail	veganlunchtruck	http://www.cinnamonsnail.com/	Parked on 55th/Broadway 9:00-3:00\n*Please read note at the bottom of this post. \n\nHabanero apricot grilled tempeh... http://t.co/9ifeS1tevk	f	1431348353	1425044750	Vegan		4c263af6a852c9287537e66c	1	28	two
hh3	Habachi Heaven 3	hibachiheaven	http://www.hibachiheaven.com/	midtown. Come get warm with some hot HIBACHIHEAVENNYC, find us at 33rd/Park and 47th/Park for some yumyum	f	1428064651	1414075107	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	2	5	two
mrnice	Mr Nice Guy	mrniceguytruck	http://mrniceguynyc.com	71st and york... it's friday	f	1414424434	1414687317	American		520bbbb211d26afae232ec59	\N	33	\N
funbuns	Fun Buns	funbunsnyc	http://j24f.com/funbuns/	Last day to get your favorite buns this year at 50th st between 6 / 7 ave midtown Happy Halloween everyone	f	1419358370	1414768000	Asian		4f8d9663e4b021137aa2bdde	\N	22	\N
mactruck	MacTruck	mactruckny	http://MacTruckNYC.com	Good morning 47st. Between Park and Lex 11:30-2	f	1431273191	1430828363	American	Looking to take a nap after lunch? This truck is great and the owner is incredibly friendly. Feel free to chat it up while you watch him prepare your food.  Not listed on the menu are the many condiments\\n you can get on your macaroni. The regular size is a good portion for a normal lunch.	50575ab8e4b04ed4f2197dac	\N	17	\N
pontirossi	Ponti Rossi	pontirossifood	http://www.pontirossifood.com/	RT @dumbolot: @mausamnyc @mamuthainoodle @PontiRossiFood at the lot today! @dumbolot	f	1431358816	1429881026	Italian	\N	542d78f4498ee5493e1a8989	\N	54	\N
phils3	Phil's Steaks	philssteaks	http://www.philssteaks.com	Hope you had a great Mother's Day weekend! Back to the grind. 47th between Park/Lex 11-2	f	1431373255	1431353294	American		4f15b382e4b0725660ea9f31	\N	17	\N
carpedonut	Carpe Donut	carpedonutnyc	http://carpedonutnyc.com/	Truck open at 55th street and Broadway. Come!!!	f	1431255774	1431083215	Sweets	They only server one kind of donut here, the apple cider, but it's a pretty good one. They are fresh and still hot when you get them. They have donut ice cream sandwiches but you should know the entire thing is in the freezer so you will get a frozen donut as well.	5169892c498e0522481eea97	\N	28	\N
chefsamir	Comme Ci, Comme Ca	chefsamirtruck	http://www.chefsamirtruck.com	We are on 55st and Broadway! !	f	1431358559	1431099978	Moroccan		4c3c85e3a9509c74b52e395b	\N	28	\N
steelcart	The Steel Cart	thesteelcart	http://www.thesteelcart.com/	Makin a grand finale on Front & Jay! Stick it to the weatherman with a toasted sandwich & grits. Soup today is Rustic Chicken Noodle.	f	1431019828	1419950738	French		511d3abee4b0e188895f3697	\N	56	\N
nuchas	Nuchas	nuchasnyc	http://www.nuchas.com	Nuchas Truck spotted around Financial District!! Pearl & Broad. Hurry up!!MuchasNuchas	f	1431375000	1428076356	Mexican		4ebd2a9bb8f7b504a754c130	\N	67	\N
toastmonster	Toast Monster	toastmonsternyc	http://www.toastmonsternyc.com/	Toast Monster @UrbanSpaceNYC @GarmentDstrctNY till October 17. On Broadway between 40th and 39th st.	f	1428680926	1411270224	American		50ad1829e4b087613d696bc4	\N	\N	\N
shanghai	Shanghai Sogo	shanghaisogo	http://www.shanghaisogo.com/	Happy Halloween. TGIFriday !! We r serving at water and Hanover sq!! ( 10 Hanover square ) come & get some. 11~3pm. http://t.co/VBdd8zsVAK	f	1430948975	1414769059	Asian		5258369d498e13def2bef2cb	\N	42	\N
cinnamonsnail2	The Cinnamon Snail 2	veganlunchtruck	http://www.cinnamonsnail.com/	This week:\n\nMon: 48th/6th\nTUES: water/Gouvernour Ln, AND Dinner on 4th Street near Washington Square\nWEDNESDAY:... http://t.co/ssXs1PztRI	\N	1431348353	1423425704	Vegan	\N	4c263af6a852c9287537e66c	2	95	two
paris	Paris Sandwich	parissandwich	http://www.parissandwiches.com/	Last day in dumbo today on fronts and Adams @ 11:30 @DUMBOFoodTrucks	f	1430774397	1414764931	French/Vietnamese		519e4ed0498e4f27e64c177a	\N	75	\N
bobjo	BobJo	bobjotruck	http://www.bobjo.net	Welcome Friday !!  We r open @king st. and Hudson st. pen @king st. In front of (In front of  Jacques Torres Chocolate) try BBQ RICE BOWL	f	1431358418	1431099924	\N		4e3add0c88772c3bf12772da	\N	39	\N
morris	Morris Grilled Cheese	morristruck	http://morrisgrilledcheese.com/	Metrotech GrilledCheese Thursdays!\n\nLawrence st, on the Commons, 1130-3! Come and EAT!	f	1431359036	1431011532	American		4e0e0b3caeb7a5b33ee5dac1	\N	76	\N
sweetery	Sweetery	sweeterynyc	http://sweeterynyc.com	Serving at Hudson/King St 375 Hudson Street New York From 7:30AM-3:00PM EDT http://t.co/aR2bxNYVPT	f	1431361728	1431344106	Sweets		4a28d919f964a52056951fe3	\N	39	\N
andysitalianice	Andy's Italian Ice	andysitalianice	http://andysitalianicesnyc.com/	In Union Square for the night. Come ice down with us.	f	1431376527	1431385510	Dessert	\N	4df26c2bae609e69dd95d2fc	\N	37	\N
greenradish	The Green Radish	thegreenradish1	http://www.thegreenradish.com/	Ve Gan Do It today 47th between Park and Lexington 11-2 blackbeanburgers @jpmorgan @Chase @UrbanSpaceNYC @AceNatural @NYMag @villagevoice	f	1431097511	1431096748	Vegan		5229feab11d2edde794d385c	\N	17	\N
taim	Taim Mobile	taimmobile	http://www.taimmobile.com/	FiDi We're back!! See you on water and broad!  itsfalafeltime	f	1431122024	1431356989	Mediterranean		4cf2c5321d18a143951b5cec	\N	94	\N
papayakingtruck	Papaya King	papayakingtruck	https://www.facebook.com/papayaking	1 cart in Metrotech & 1 cart at the @IntrepidMuseum beautiful day to eat at a foodtruck	f	1431355284	1431018099	American		50952bd2e4b03898afd23fe3		76	
mtblls	Mtblls	mtblls		Happiest of Monday Mtbll Lovers!   The  has stopped on 50th bet 6&7 Aves. Come on by for your favorite menu item!\n lgr 	f	1431285875	1431352932	Italian	\N	504fb7fde4b0bc88c3a6b614	\N	22	\N
mexicue	Mexicue	mexicue	http://mexicueny.com	Eating these sliders under an umbrella is like movie make-out scenes under waterfalls. \n\nCome get em at MadSqEats http://t.co/VxW4aWmiwh	f	1431358604	1410639912	Mexican		4c51a6a71c67ef3ba6b61ab9	\N	\N	\N
schnitzelcart	Schnitzel & Things Cart	schnitznthings	http://schnitzelandthings.com	It's Schnitzel time.  The cart will be on 27th & Park serving up your favorite lunch!	f	1430868605	1426694447	German	\N	4a6640b3f964a5204cc81fe3	(schnitzcart|the cart)	71	contains
korilla	Korilla BBQ	korillabbq	http://korillabbq.com	Now serving 47th and Park!	f	1431375887	1431360682	Korean Fusion		4cc701aa01fb236ab070baba	\N	16	\N
palenque	Palenque	palenquefood	http://www.palenquehomemadecolombianfood.com	RT @starrettlehigh: @tosty17 Have @Palenquefood contact the @nycfoodtruck & tell them it's interested in being at StarrettLehigh!	f	1431362480	1428705650	Colombian Fusion		4e84f424dab45bbd2617dc62	\N	46	\N
hh2	Habachi Heaven 2	hibachiheaven	http://www.hibachiheaven.com/	Open and ready to roll corner of Varick and King	f	1428064651	1423759572	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	1	38	two
lukeslobster	Luke's Lobster	nautimobile	http://lukeslobster.com/	This is it, our last day on the streets of NYC. 17th st and 5th ave. So long, farewell, see ya when we see ya.	f	1431282893	1430398345	Seafood		4dc81239b0fb5556cd2f3023	\N	86	\N
polish	Old Traditional Polish Cuisine	polishcuisine	https://www.facebook.com/pages/Old-Traditional-Polish-Cuisine/315496671902708	Open & ready to roll until 2:20 today on 47th b/w Park & Lexington VeggieCombo traditional PolishTruck nyc	f	1431344850	1431357443	Polish		51435df4e4b0823a398ebc8a	\N	17	\N
latinkitchennyc	Latin Kitchen	latinkitchennyc	http://www.latinkitchennyc.com/	HAPPY HALLOWEEN ! ! TODAY OUR LAST FRI OF 2014 ..THANK YOU WALLSTREET! !\nLOCATION 55 WATER ST (SIDE OF OLD SLIP) NYC http://t.co/RWCtK9bCEc	f	1431271905	1414768415	Mexican	\N	53878518498ef00115dbdea1	\N	73	\N
eddiespizza	Eddie's Pizza	eddiespizzany	http://www.eddiespizzany.com/	Weekly special white pie mushroom olives garlic and roasted red peppers. Monday's at starrettlehigh... http://t.co/VxVdAQbLW3	f	1431355266	1429548113	Pizza		4c0cf412b4c6d13ae4850c30	\N	46	\N
shuka	Shuka Truck	shukanyc	https://www.facebook.com/ShukaTruckNYC	Good Morning @Flatirnny ! Monday is your day ! 21st St & 5th Av ! Don't forget to load your SHUKA App !! http://t.co/gVydVTmsXg	\N	1431270454	1431350406	Israeli	\N	546a5011498e0e047a243f37	\N	96	\N
carls	Carl's Steaks	carlssteaks	http://carlssteaks.com/home/	Happy Monday folks start your week w a carls famous cheesesteak 52nd st bet 6th/7th Av @Barclays @SIRIUSXM @SiriusXMNFL  @MHFI @UBSamericas	f	1431284674	1431354105	American		51a78330498e3fc1f22d771e	\N	61	\N
snowday	Snowday	snowdaytruck	http://snowdayfoodtruck.com/	Yo yo yo @dumbolot get ready for mad maple love - spring menu with smoked rib sliders and farrow salad coming your way!! Beep beep	f	1431386805	1430923962	Comfort	\N	533ddd4a498e774b8250a69b	\N	54	\N
dubpies	DUB Pies	dubpies	http://www.dubpies.com/	RT @dumbolot: We got @dubpies @MexicoBlvd and @ToumNYC today!	f	1431192461	1431355756	New Zealand meat pies	\N	4eb825a62c5b53141b78bfb6	\N	54	\N
lobstertruck	Red Hook Lobster	lobstertruckny	http://redhooklobster.com/	BigRed is on 46th & 6th ready to make your Friday!	f	1431361336	1431100253	\N		4dc597c57d8b14fb462ed076	\N	13	\N
eggstrav	eggstravaganza	etravaganza	http://www.eggstravaganzany.com/	Good morning NYC! our grill's speed is 160 mph.\njoin us for a quick,tasty breakfast\nThe truck is at 52nd and Park.	\N	1430836807	1431004479	Mexican	\N	4b15165ef964a52049a823e3	\N	72	\N
toum	Toum NYC	toumnyc	https://www.facebook.com/ToumNYC	RT @dumbolot: We got @dubpies @MexicoBlvd and @ToumNYC today!	f	1431350138	1431354762	Lebanese		500eedb0e4b062ee00577957	\N	54	\N
schnitzi	Schnitzi	schnitzi1	http://www.schnitzi.com/	Today right off the corner of 46 and 6th Ave serving lunch from 11:30 until 3:30 get some schnitzi foodtruck @www.schnitzi.com	\N	1431352283	1430400748	German	\N	532b25ed498eb8b1844dc14f	\N	13	\N
pocketful	The Pocketful	thepocketful	http://thepocketful.com/	Our cart is back on 50th between 6th and 7th. Enjoy the sunshine!	f	1429888965	1430145608	Mediterranean		4db8bcd790a0e3f61d601888	\N	22	\N
neapolitan	Neapolitan Express	neaexpress	http://neapolitanexpress.com/	RT @dumbolot: We got @DomoTaco @NeaExpress and @SnowdayTruck today!	f	1430619288	1430384689	Pizza		51c8864c498e0ac96c14433e	\N	54	\N
milktruck	Milk Truck	milktrucknyc	http://www.milktrucknyc.com	Bessie's at Wall St/William St today! It's Friday folks, time to celebrate. Call 646-504-6455 to preorder.	f	1431288018	1431092547	American		4e823c0229c2dbb2b7043972	\N	41	\N
wafelMomma	Wafels & Dinges Momma	waffletruck	http://www.wafelsanddinges.com/	De TRUCK:\nKastaar @ Jay Street MetroTech til 4PM	f	1431374708	1431012516	Belgian		4a416369f964a52036a51fe3	momma	76	before
sweetchili	Sweet Chili	sweetchilinyc	http://sweetchilinyc.com/	Truck is on old slip & water 1130-2. Also find us @UrbanSpaceNYC @GarmentDstrctNY midtown broadway btw 39 & 40th till 9! eatoutside	f	1431355280	1431011099	Asian		51a8c802498e2165ca855a19	\N	44	\N
valduccis	Valduccis	valduccis	http://valduccis.com	We are still at 51st St. and Park Avenue leaving at 3 PM come down for pizza and Panini @greenboxny @FoodtoEat @food http://t.co/XYDzdbY1t0	f	1431274154	1430155219	Pizza		4df7e1aad4c02ad734170b21	\N	24	\N
souvlaki	Souvlaki GR	souvlakitruck	http://www.souvlakigr.com/	@justyniak We are on 46/6th ave\nStop by for a little taste of  Mykonos	\N	1431282045	1430843694	Greek	\N	4c75c2908d70b713d5dcdaad	\N	13	\N
mexicoblvd	Mexico Blvd.	mexicoblvd	http://mexicoblvd.com	Hola Dumbo! guacamole&chips @MexicoBlvd @dumbolot Water&Jay	f	1431276989	1431356809	Mexican		4f4e55aee4b04c96fba5b149	\N	54	\N
treats	The Treats Truck	thetreatstruck	http://www.treatstruck.com	!!! Wed, May 6th 12-3:30 45th st. & 6th ave!! Then 4:30ish-7pm 18th st & 7th ave!!!	f	1431348174	1430924232	Sweets		49e65021f964a52035641fe3	\N	12	\N
biandang	Bian Dang	biandangnyc	http://www.biandangnyc.com/	Guess whos back???????? 53rd and park... lesssssssssssssgo!!! http://t.co/6WGxb2yeVP	f	1428523228	1431350716	Taiwanese		4d712874722ef04d04160d9c	\N	26	\N
domo	Domo Taco	domotaco	http://www.domotaco.com	Happy Monday! Catch the truck out on 52nd & 6th or our @UrbanSpaceNYC booth on 39th & Broadway today	f	1431211430	1431353644	Asian Fusion		4ed90a2e77c8274efb746d83	\N	8	\N
wafelKastaar	Wafels & Dinges Kastaar	waffletruck	http://www.wafelsanddinges.com/	De TRUCK:\nKastaar @ Jay Street MetroTech til 4PM	f	1431374708	1431012516	Belgian		4a416369f964a52036a51fe3	kastaar	76	before
gorilla1	Gorilla Cheese 1	gcnyc1	http://www.gorillacheesenyc.com/	Beautiful day...\nG1- :( off road for service\nG2 - Broadway /55\nComeToTheCheeseYo	f	1431278765	1431358305	American		4dc2d3e352b1c1fb37f1e945	g1	28	before
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
Disos will be off the road the next few weeks.. For immediate inquires please email adam@disosnyc.com\n\nThanks	1431098477	596696379134738432	f	disosnyc
RT @justin_cohen: Not a good lunch, but a GREAT lunch @DiSOSNYC with @bmitchelf MongoNation	1430500509	594188320458088448	f	disosnyc
Friday's society lunch meetings on 46th and 6 today. \n\nCall in orders to: 917-756-4145	1430489419	594141805874159617	f	disosnyc
47th and park todayyyyyy....\n\nCall in orders to: 917-756-4145	1430402551	593777455443345408	f	disosnyc
Open for lunch. Water and old slip.. \n\nCall in orders to: 917-756-4145	1430320306	593432492943736834	f	disosnyc
Posted up on water at and old slip today. FIDI\n\nCall in orders to: 917-756-4145\n\n**focaccia and ciabatta back on the menu	1430314467	593408001165369345	f	disosnyc
Society members meeting today on 48th bet 6 and 7 ace.\n\nCall in orders to: 917-756-4145	1430234101	593070922707443712	f	disosnyc
Another banger of a review for the society..! ... http://t.co/NPx7x0GQcK	1430176664	592830016561553409	f	disosnyc
@SlimFatFoodie thanks for the kind words, well written and thought out. society	1430175590	592825511690252288	f	disosnyc
RT @SlimFatFoodie: Italian Sandwich a dying art? New post ft. @DiSOSNYC foodie lunch NYC sandwich Italian http://t.co/z6TCmrYlJE http:...	1430175538	592825293167009792	f	disosnyc
RT @eric_zimm: The thought of @DiSOSNYC next week is the only thing getting through this week	1430161190	592765112961892352	f	disosnyc
Open for lunch! Varick and charlton st\n\nCall in orders to: 917-756-4145	1430146877	592705080056553473	f	disosnyc
Parked on varick and charlton today. \n\nCall in orders to: 917-756-4145\n\nWe have focaccia and ciabatta back!!	1430142454	592686528884830210	f	disosnyc
Open for lunch.. 46th and 6 ave. \n\nCall in orders to: 917-756-4145	1429890053	591627879575904257	f	disosnyc
@SlimFatFoodie that's what we're sayin!!	1429885421	591608453916975104	f	disosnyc
Yea Friday..! 46th and 6 ace.\n\nCall in orders to: 917-756-4145\n\n** focaccia and ciabatta are back!!	1429885379	591608277064093696	f	disosnyc
@justin_cohen that would be 46th and 6 ave	1429880561	591588068425129984	f	disosnyc
@futuredadddy hey sorry, but we're usually wrapping up our lunch around 230 weekdays	1429879096	591581926034661376	f	disosnyc
Posted up on 47th bet park and lex.\n\nCall in orders to: 917-756-4145	1429798901	591245563015856128	f	disosnyc
Open for lunch! Water st. And old slip.. \n\nCall in orders to: 917-756-4145	1429716708	590900821526769665	f	disosnyc
Serving at 106-122 E 47th St NY From 11:00AM-2:00PM EDT http://t.co/4hrtxmQCnN	1431097511	596692326858231808	f	thegreenradish1
Ve Gan Do It today 47th between Park and Lexington 11-2 blackbeanburgers @jpmorgan @Chase @UrbanSpaceNYC @AceNatural @NYMag @villagevoice	1431096748	596689128382562306	f	thegreenradish1
RT @KatzSax: Good Day for a Plantbased lunch with @thegreenradish1 at 47 btw Park and Lex. 11-2pm nyc vegan midtownlunch	1431094871	596681256286298112	f	thegreenradish1
Ashley Morgan + Organic! on Instagram: If you guys are in the NY/NJ area.. You havveee to... http://t.co/NMtxjKPVRJ	1431089407	596658335123832833	f	thegreenradish1
ashley_morganic's photo http://t.co/FX0CvzIwox	1431089355	596658119675097088	f	thegreenradish1
Good Day for a Plantbased lunch 47 btw Park and Lex 11-2pm @midtownlunch @jpmorgan @EaterNY @Gothamist @NewYorkObserver @OneGreenPlanet	1431087446	596650112711061504	f	thegreenradish1
Come say hi...Tofu Salad Sandwich Raw Chocolate-Cinnamon Donarts, Kale Yeah! today, Friday, 47 btwn Park and... http://t.co/ten3eESDGI	1431087160	596648910816423937	f	thegreenradish1
Purrfect day to ride a citibike to thegreenradish for BlackBeanBurgers  GetRad today 47 between... https://t.co/FNMiIEsv07	1431086203	596644897186263040	f	thegreenradish1
Purrfect Day to ride a Citi Bike to The Green Radish for BlackBeanBurgers 47th between Park and Lex... http://t.co/R6eWc1iKeM	1431085522	596642041527980033	f	thegreenradish1
Hey jannwenner from @RollingStone how was your Donart last week? Give us a call well send more 917-512-1599 http://t.co/ysNoimQ3Cc	1431013677	596340703023800322	f	thegreenradish1
Cinnamon-Maple Donarts 52&6 11-2 GetRad today @UBS @RollingStone @WSJ @NYMag @UrbanSpaceNYC @Gothamist jannwenner http://t.co/4lvjvKNF4y	1431012574	596336075741749248	f	thegreenradish1
Squeeze in Plantbased lunch today 52&6 11-2 @RollingStone @UrbanSpaceNYC @usweekly @ubs @TheGarden @OneGreenPlanet http://t.co/MXFY5diMmV	1431001043	596287712447090688	f	thegreenradish1
GetRad NYC Eat Plants today 52&6 11-2....yoga plantbased vegan organic midtownlunch https://t.co/LJnOQ1fQRJ	1430998926	596278831553638400	f	thegreenradish1
Squeeze in a plantbased lunch today 52&6 11-2 GetRad https://t.co/Rir4aMmqBO	1430998721	596277970546860032	f	thegreenradish1
GetRad NYC BlackBeanBurgers today 52&6 11-2 http://t.co/suMUvwf9ol	1430997783	596274036612685825	f	thegreenradish1
Squeeze in a plantbased lunch today 52nd&6th Ave 11-2... http://t.co/L64IOgSunY	1430997621	596273359907901440	f	thegreenradish1
Donart Heaven! http://t.co/41FuHHH6VO	1430956328	596100161253801984	f	thegreenradish1
Come say hi...38th&bway 11-2pm http://t.co/CbvYUzGowd	1430927479	595979163493883906	f	thegreenradish1
The Sun always comes out @thegreenradish1 today 38th&bway 11-2 @GarmentDstrctNY @midtownlunch @AceNatural @NY1 @BrianLehrer @nycfoodtruck	1430923376	595961951886450688	f	thegreenradish1
Hey @TheGarden let us @thegreenradish1 vegan-organic food truck serve BlackBeanBurgers to the Morrissey fans on June 27th let's talk	1430916999	595935206407802881	f	thegreenradish1
Have a great weekend. See you on the other side!	1431128142	596820802567327744	f	bigdsgrub
There seems to be a movie shoot at 53/Park. No parking anywhere!!! https://t.co/R7TM2aisUi	1431097617	596692772532396032	f	bigdsgrub
RT @dumbolot: Welcome to the lot @bigdsgrub! They're joined by lot faves @mamuthainoodle and @PontiRossiFood!	1431097567	596692560623579137	f	bigdsgrub
Big D1 has landed at 50th Street btwn 6th and 7th Avenue.\nNo parking at our Friday location  http://t.co/dxuI4moQPu	1431093781	596676681965895681	f	bigdsgrub
TGIF everyone!!\nBig D2 is in DUMBO today. Jay and Water Street. Brooklyn @dumbolot @DUMBOFoodTrucks @DUMBOBID http://t.co/TMSC4Pqego	1431090659	596663589873840128	f	bigdsgrub
@EdOnMarketing where to Ed?	1431056806	596521597424513024	f	bigdsgrub
@wxsherri  https://t.co/P5Vfnp4YOJ	1431025707	596391161058721793	f	bigdsgrub
@jack_of_knaves when will you be here? Cash or card, doesn't matter	1431015228	596347206736715777	f	bigdsgrub
RT @FoodtoEat: Make your belly happy today with some Asian flavors from @bigdsgrub! Preorder online for quick & easy pick-up: http://t.co/O...	1431011644	596332176507019266	f	bigdsgrub
Big D2 has Midtown East covered! 53rd Street and Park Avenue @midtownlunch http://t.co/t5QCR44RRp	1431003827	596299386755350529	f	bigdsgrub
It's THAT time of the week!\nBig D1 is grillin' it up at 50th Street btwn 6th and 7th Avenue http://t.co/hvtp6imVYb	1431003743	596299035050450945	f	bigdsgrub
RT @BigAppleNosh: Who doesnt love a runny egg? Devoured @bigdsgrub Bangkok basil spicy pork fried rice with a runny egg on top. Yum! http:/...	1430959658	596114128139374593	f	bigdsgrub
1200 eggs & 4hrs later, the night was done. thaibasilporkfriedrice runnyegg nyc foodie @villagevoice choiceeats http://t.co/pSvhEYPxAy	1430926514	595975112962215936	f	bigdsgrub
We are open! @CharFood  https://t.co/2ghhRGZ5wa	1430925995	595972936231706624	f	bigdsgrub
Let's heat things up.  50th Street btwn 6th and 7th Avenue http://t.co/DFAUCGUIvo	1430918236	595940391901335552	f	bigdsgrub
We're slinging grinders n' tacos at 53rd Street and Park Avenue! Preorders call 646-543-BIGD	1430918151	595940037101015040	f	bigdsgrub
The party continues at the Intrepid 5pm to 11pm for the Village Voice Choice Eats! @ChoiceEats	1430859044	595692123883704320	f	bigdsgrub
RT @ChoiceEats: Thanks to @amNewYork for the shout out for ChoiceStreets tonight - sold out - get ready to sample bites  http://t.co/0n028...	1430833328	595584262247751681	f	bigdsgrub
Big D2 is over at 53rd Street and Park Avenue http://t.co/Q4YaYzR7IC	1430832176	595579432078802944	f	bigdsgrub
Ditch the desk and join us for lunch!\nBig D1 is celebrating tacotuesday and cincodemayo at 50th Street btwn 6th and 7th Avenue.	1430832111	595579160187293696	f	bigdsgrub
Good morning, love MuchasNuchas @themainctrain http://t.co/5YhMJwDo9E	1431018179	596359585671290880	f	nuchasnyc
Let's taste a little piece of Times Square MuchasNuchas   @TimesSquareNYC	1430677345	594930024471535616	f	nuchasnyc
RT @grnmn1: @SnackFixation @NuchasNYC I must make these!!!!!	1430522258	594279540706381824	f	nuchasnyc
@Merkedis Sorry for the inconvenience and thank you for the feedback. We are fixing the issue and hope to be there for you every time.	1430479162	594098784398921728	f	nuchasnyc
Oh yes! I got an A from Nuchas! http://t.co/XUum1ocXYS	1430324828	593451459234136065	f	nuchasnyc
Catch us over 14th St & 3rd Ave!! MuchasNuchas ready for you!	1430322819	593443032785096708	f	nuchasnyc
@joacoperezalati Contact catering@nuchas.com. Should be able to set it up.	1430270063	593221759832367104	f	nuchasnyc
Delicious MuchasNuchas around the area!! 3rd Ave & 14th St! Come visit us!	1430168395	592795333555572737	f	nuchasnyc
Shoutout to @snackfixation for catching the perfect symmetry MuchasNuchas http://t.co/tVbqLM1vrl	1429986635	592032974880776192	f	nuchasnyc
Leftovers. Oh wait. 'No loose ends' said @drunken_ragerchemist http://t.co/pnC3Pgjkuq	1429726736	590942880056942593	f	nuchasnyc
Want to taste some great artisan empanadas?? We are at Bedford Ave & Campus Rd!! Come visit!! MuchasNuchas	1429717665	590904832673865729	f	nuchasnyc
Shot of our kiosk in Greeley Square by nuchasfan @dralemurad MuchasNuchas regram http://t.co/6OeGYNhwZE	1429549957	590201416909742080	f	nuchasnyc
Start fresh with MuchasNuchas!! Nuchas Truck around W 91st St & Columbus Ave!! Come visit us!	1429540023	590159749926297601	f	nuchasnyc
RT @34thStNYC: Start this gloomy Monday on the right foot, with a cup of @LaColombeCoffee from @NuchasNYC! Kiosk is located in Greeley Squa...	1429539773	590158699223773184	f	nuchasnyc
RT @SnackFixation: Spicy Cheese and Short Rib empanadas from @NuchasNYC food truck. GoodStuff NYC http://t.co/58kyjFStar	1429485940	589932910708305920	f	nuchasnyc
RT @BedVyneBrew: @NuchasNYC drive that truck on over to beautiful bedstuy! We'll do the craftbeer, you do what you do! Our people will lo...	1429189900	588691226439876609	f	nuchasnyc
Taking good care of our soldiers MuchasNuchas WayBackWednesdays http://t.co/4z1chOVjPb	1429121378	588403825532350465	f	nuchasnyc
Truck full of nuchas at Broad St & Exchange Pl until 3 PM! MuchasNuchas	1429033016	588033207175618562	f	nuchasnyc
Did you know we cater MuchasNuchas for corporate events and office parties? Just email at catering@nuchas.com http://t.co/sfMeXG1i7q	1428949777	587684077416898560	f	nuchasnyc
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
We will be in dumbo today everyone. On fronts and Adams at 12pm  @DUMBOFoodTrucks	1412171029	517308908877389824	f	parissandwich
We will be back in dumbo today on fronts and Adams 12pm  everyone. Hope we can start your week off nicely :) @DUMBOFoodTrucks @jenchung	1411994176	516567132579315712	f	parissandwich
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
RT @NYBG: Happy National Public Gardens Daynot a bad afternoon for it, Id say. http://t.co/d39Q6prjkn	1431117494	596776142134124545	f	andysitalianice
The Internet Has Fallen in Love With This Very Well-Organized FoodInstagram Account http://t.co/aG2vCwtyt0 AndysItalianIces	1431117081	596774411610550274	f	andysitalianice
Tganks for rhe love...Glad u enjoyed  https://t.co/uBjLT8Of5v	1430757452	595266014985748480	f	gcnyc1
Come cool down with a refreshing treat. We are on 32nd and Park Ave. Till 3pm	1431107840	596735650415521792	f	andysitalianice
Tomorrow we will be @NYBG all weekend long. Who's coming to chill out with us? And eat amazing @gcnyc1	1431105603	596726269078736896	f	andysitalianice
RT @Stephluva2711: it sux working on 1st ave. trying to figure out lunch & nowhere near  @CoolhausNY @AndysItalianIce @dubpies @NeaExpress	1431105049	596723943924494336	f	andysitalianice
We are open on 32nd park Ave till 3pm then heading to @EdgemontSchool @nycfoodtrucks @grubstreet	1431098724	596697414322376704	f	andysitalianice
RT @FordhamRoad_NYC: Hey Fordham Road! Are you hungry? Get ready for our May Food Truck event! delicious http://t.co/4K1Gvjv8by	1431098263	596695480488169472	f	andysitalianice
Now open at 55th & Broadway. It's a hot one come cool down. @nycfoodtruck @ChoiceEats @grubstreet @StreetGrubSteve	1431014648	596344774744997888	f	andysitalianice
The flavor of the week is Root beer float. What should next weeks flavor be?	1431003683	596298784256188416	f	andysitalianice
55th and Broadway we're heading for you. Going to be a hot day come cool down with an Italian ice. @nycfoodtruck	1431003583	596298362711887872	f	andysitalianice
Don'f forget! MothersDay is this Sunday! http://t.co/kLF4sGL3EQ AndysItalianIces	1430944242	596049471911366660	f	andysitalianice
RT @DomoTaco: Happy CincoDeMayo everybody! @ChoiceEats at ChoiceStreets tacos mariachi asiantaqueria trucklife intrepid http://t.co/...	1430876022	595763337138405379	f	andysitalianice
Sorry to say but we are doing some upgrades to truck. Off the road tomorrow.	1430875989	595763195807145984	f	andysitalianice
RT @ElectricZooNY: Ready to paint the NYC Sky?\nhttps://t.co/kBrZVTCh5P	1430873781	595753933760499712	f	andysitalianice
Tonight we are at the @ChoiceEats from 7pm-11pm with @gcnyc1 and many more amazing food trucks.	1430865464	595719052573679616	f	andysitalianice
Open in Union Square till 8pm. Try our Margarita Italian Ice for cinco de mayo.	1430858600	595690261059137536	f	andysitalianice
Come to 32nd and Park Ave for your afternoon snack @nycfoodtruck @grubstreet @Pinterest @DispatchNY	1430850282	595655372477747200	f	andysitalianice
Come cool down with an Italian Ices we are on 32nd and Park. Have you tried our new fresh fruit smoothies?	1430846202	595638262816968704	f	andysitalianice
54 Things to do after grabbing an ItalianIce this May http://t.co/5PTHm5CXGe AndysItalianIces	1430782250	595370025739001856	f	andysitalianice
A great picture submitted by an Andy's Italian Ice fan today! http://t.co/fMpk9i205k	1430779229	595357356151668736	f	andysitalianice
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
@Pier_13Hoboken beautiful day with a bunch of other foodtrucks ComeToTheCheeseYo http://t.co/92BRCW1oAT	1431120999	596790844218310658	f	gcnyc1
Rockin the Cheese @Pier_13Hoboken w/ @Aroy_D @AmandaBananasNJ @EmpanadaGuy1 @CupcakeCarny @FalaFullNYC \nComeToTheCheeseYo  foodtrucks	1431119832	596785947406180352	f	gcnyc1
RT @AndysItalianIce: Tomorrow we will be @NYBG all weekend long. Who's coming to chill out with us? And eat amazing @gcnyc1	1431119559	596784802847666176	f	gcnyc1
RT @FalaFullNYC: So many great foodtrucks will be serving alongside us today @Pier_13Hoboken @Aroy_D @AmandaBananasNJ @EmpanadaGuy1 @Cupca...	1431098644	596697081059942400	f	gcnyc1
G2- 46 5/6\nG1- no lunch @Pier_13Hoboken for dinner\nComeToTheCheeseYo	1431098632	596697028211638272	f	gcnyc1
RT @AlisaQ: NYC needs more food trucks and fewer Chase Banks grilledcheeseplease @gcnyc1 http://t.co/hf5GzRfOip	1431042576	596461913304891392	f	gcnyc1
RT @AmandaBananasNJ: @Pier_13Hoboken today w/ @PVPIZZATRUCK @OINKandMOObbq @TheIncrediballs @themoofoodtruck @gcnyc1 @FalaFullNYC hoboken ...	1431030371	596410723099607040	f	gcnyc1
G1- @Pier_13Hoboken 4-10 pm\nG2 - uptown \nComeToTheCheeseYo	1431013416	596339609392521216	f	gcnyc1
Sorry for the screwy schedule  this week\nG1 Hudson / king \nG2 off road \nComeToTheCheeseYo	1430925054	595968990704443393	f	gcnyc1
RT @_YokoUchida: @ChoiceEats - top 2 grilled cheese and fusion tacos! http://t.co/hC5TARryEm	1430915043	595926999002144768	f	gcnyc1
RT @eatupnewyork: And the wait is over @gcnyc1 well worth it ChoiceStreets bacon grilledcheese nyc EatUpNewYork FoodPorn http://t.co/...	1430872058	595746709852000257	f	gcnyc1
RT @eatupnewyork: Online waiting to grab a taste of @gcnyc1! Can not wait!! grilledcheese EatUpNewYork nyc http://t.co/np06e2q0YG	1430872052	595746684686213121	f	gcnyc1
RT @AndysItalianIce: Tonight we are at the @ChoiceEats from 7pm-11pm with @gcnyc1 and many more amazing food trucks.	1430865626	595719729802805249	f	gcnyc1
RT @ChoiceEats: Thanks to @amNewYork for the shout out for ChoiceStreets tonight - sold out - get ready to sample bites  http://t.co/0n028...	1430865587	595719565910355968	f	gcnyc1
G1 - Corporate  lunch in Brooklyn\nG2- off road for 2 more days.	1430840403	595613939599278080	f	gcnyc1
What's a Woman to do ? :) https://t.co/5aBn58KDNO	1430757614	595266697088602112	f	gcnyc1
RT @Criss_is: We went to NYC and we couldn't come back to Spain without tasting Gorilla Cheese. \nLove it =D @gcnyc1 http://t.co/OIuKVQh5ev	1430757421	595265885343997952	f	gcnyc1
G1 38/Broadway \nG2 off road for a few days\nComeToTheCheeseYo	1430757407	595265829647822848	f	gcnyc1
@prospect_park foodtruckrally \nRockin  the Cheese w/20+others\nComeToTheCheeseYo	1430667530	594888856543059968	f	gcnyc1
Hi New Yorkers\nLangos Truck is in the Flatiron District \nCorner of 21 street & 5Ave\n11-3pm	1431092191	596670012984819712	f	langostruck
Evening\nAstoria Queens 5-8:30pm\n30th.Ave and 31street	1431008461	596318826062598145	f	langostruck
Good morning Wall St.\nL-T at the corner of Water St. & Old Slip\n11-2:30pm\n\nfood trucks nyc mangalitsa village voice	1431008399	596318562593185792	f	langostruck
Dear Friends \nWednesday we are going to visit you in Borough Park brooklyn \nFront of Bartek Deli\n5-8:30pm\n See you Soon	1430833213	595583780464762881	f	langostruck
Hi Happy sunny Sunday\n\nMiddle Village street fair,\n\nOn metropolitan Ave bet 75st -78street\nFrom 11-6pm\n\nMore info 646 286 9949	1430668678	594893671281074176	f	langostruck
Hi we would like to share \nLangos Truck going to be in Middle Village street fair,\nOn metropolitan Ave\nFrom 11-6pm\nMore info 646 286 9949	1430587006	594551114835632128	f	langostruck
Good morning\nWe are at Flatiron District\nCorner of 21St &5Ave\n11-2:30pm\nEnjoy your weekend http://t.co/MboHJA0od8	1430480639	594104979473956866	f	langostruck
Dear Friends we can't make it to Astoria tonight. See You next week	1430423630	593865864191057920	f	langostruck
Hi Midtown\nWe are ready for lunch.\n11-2:30pm\n47th.St bet Lex & Park Ave\nfood trucks hungarian village voice http://t.co/UwSvoe0kzo	1430402910	593778959256522752	f	langostruck
Good morning \n\nLangos Truck at The corner of \nWater St. and Old Slip \n\nTill 2:30pm	1430317343	593420066823208961	f	langostruck
Good morning\nFinally we here for you\nCorner of Water St. & Old Slip\n11-2:30pm\nbull  market bear market food truck http://t.co/LOEkXM7wkC	1430224111	593029022550007808	f	langostruck
Hi 47 St. Park and Lexi\nTill 2:30pm	1430144804	592696386216448001	f	langostruck
Good morning \n\nWe hope you had a great weekend\nLangos Truck at 47th. St. Bet Lexington & Park Ave.\n11-2:30pm\n \npesto hungarian sausage	1430139026	592672149560795136	f	langostruck
Hi Upper East Side\nWe're at 86St. Lexington\nHopefully we can stay here till 6pm\nHave a lovely Sunday\nfood trucks nyc hungarian palinka	1430057668	592330908373491713	f	langostruck
Hi Guys \nSorry for the late posting\nWe are @ 31nd. St & Park Ave \nTill 2:30pm\nEnjoy your weekend\nfood trucks Nyc mangalitsa food porn	1429888982	591623387266555905	f	langostruck
Hi Guys we are at 21St. & 5Ave.\nTill 2:30pm\n\nEvening Astoria 31St and 30ave \n5-8:30pm\n\nThank You	1429801269	591255492783165442	f	langostruck
Dear Friend\nLangos Truck @ 47th.St. Bet Lex & Park Ave. 11-2:30pm\neuro mangalitza  CHASE food trucks DreamTeam http://t.co/3ksAZkK3bU	1429707649	590862825452605440	f	langostruck
RT @Palinka2013: Our Double Gold winner Palinka. @Beveragetrade @foodandwine @astorwines @BCMerchants @barbutonyc @EaterNY http://t.co/7CsM...	1429455543	589805415141134337	f	langostruck
Hi we are at 52nd. St bet 6-7th. Ave (closer to 6 Ave)\nTill 2:30pm\nHave a great weekend	1429284784	589089199783018496	f	langostruck
Hi New Yorkers\nLangos Truck @ 21St & 5th. Ave.\n11-2:30pm\n\nEvening Astoria Queens\n31st &30 Ave.\nFrom 5-8:30pm http://t.co/bhUYOsOJpe	1429187585	588681517351698432	f	langostruck
We are closed for a private event today, but see you & mom this Sun @NYBG MothersDay Garden party!	1431088845	596655979875442688	f	kimchitruck
Can't imagine better taco weather. Find us on Hudson & King 11:30 - 2:30	1431006631	596311148472864769	f	kimchitruck
Ready at 11:45	1430927814	595980568489144320	f	kimchitruck
Parking secured. See ya at 52nd and 6th.	1430924890	595968300502364160	f	kimchitruck
Midtown, here we come! Exact location tbd.	1430919691	595946496647950336	f	kimchitruck
And we're BACK @dumbolot, just in time for Cinco de Mayo. See ya 11:30 - 2:30	1430833059	595583136618008576	f	kimchitruck
RT @the_rewm: @katie_LF A friend suggested @KimchiTruck! (I should have listened haha.)	1430747974	595226262404136961	f	kimchitruck
Going to the truck doc on this gorgeous day. See you tomorrow!	1430746705	595220941442920448	f	kimchitruck
Me and my truck buds, descending on @Prospect_park today 11-5 foodtruckrally	1430661701	594864407835869184	f	kimchitruck
Your kids have prob been waiting all year for this one. @ps295brooklyn Touch A Truck, today from noon-5pm	1430575341	594502187381817345	f	kimchitruck
@keithbacker I feel like we're in a committed relationship. What do you think?	1430500862	594189801848446976	f	kimchitruck
RT @TatyanaB_: It's finally back!!!! Lunchhhh time!!! tacos kimchi @KimchiTruck midtown lunchtime nyc http://t.co/HRbeuVr3NN	1430500799	594189534755184640	f	kimchitruck
Every kiddo's dream coming true on a Brooklyn block. @PS295Brooklyn Touch A Truck, noon - 5 pm tomorrow. We'll be slinging tacos.	1430500571	594188581528313857	f	kimchitruck
Lunch is (almost) served. Parked on 52nd & 6th. 11:30-2:30.	1430493117	594157317253390336	f	kimchitruck
On our way to midtown. More when we park!	1430487680	594134512814141440	f	kimchitruck
RT @jul_maniscalco: @KimchiTruck for lunch  love tiny tacos!	1430422085	593859384922386434	f	kimchitruck
Tacos & smiles galore on Hudson & Charlton St. 11:30-2:30	1430402818	593778575628611585	f	kimchitruck
Feeling springaling on 55th & 6th!	1430326487	593458417240514560	f	kimchitruck
RT @keithbacker: A beautiful day in midtown only made better by @KimchiTruck 's chicken and fish bowl with a side of kimchi! goodlife http...	1430324399	593449662348193793	f	kimchitruck
@MathewKatz Cash only	1430324395	593449645197697024	f	kimchitruck
It's almost beach season and dadbod is so in right now = TreatYoSelf http://t.co/SVZFyrFGx0	1431012446	596335537667108866	f	mexicue
Rice Rice Baby...and beans\n\n@AnsonMills Rice Grits + Black Beans + Jalapeno Aioli + Pico http://t.co/2qcrb62LRw	1430925990	595972917160206336	f	mexicue
RT @ForkintheRoadVV: ~Smoky~ margaritas.\n~Smoky~ carnitas.\n\nHere's how to eat lunch at @Mexicue in NoMad\n\nhttp://t.co/Nu3e7ikchP http://t.c...	1430856062	595679616318177281	f	mexicue
.@NewYorkcom knows about our CincoDeMayo/CincoDeDrinko deal at 225 Fifth Ave, do you? http://t.co/o0nvph0jg1	1430847631	595644254078300161	f	mexicue
RT @NewYorkcom: 5 Lively Bars to Celebrate Cinco de Mayo in NYC @Mexicue @thewrennyc @BodegaNegraNYC http://t.co/MYXblxlf7f http://t.co/vjw...	1430778166	595352896755113984	f	mexicue
Suns out, buns out\n\nTreatYoSelf to a Burnt Ends Brisket Slider on @potatorolls at MadSqEats http://t.co/m4j5M3C41E	1430753870	595250991995482112	f	mexicue
RT @ThrillistNYC: Congrats to the winner of ThrillistTKO @Mexicue for their Smoky Carnitas taco! http://t.co/yzfOZn8Qny	1430600014	594605673167626241	f	mexicue
RT @ExperienceNoMad: Mad. Sq. Eats opens today! @Mexicue, @ililiRestaurant, @HillCountryNY and more!  @MadSqParkNYC @UrbanSpaceNYC \n\nhttp:/...	1430501441	594192228551102464	f	mexicue
@MissWNDRLST you know what's up! Thanks for the love	1430493337	594158238993620993	f	mexicue
RT @FlatironNY: What's for lunch? Try new neighbor @Mexicue! Co-founder suggests Avocado Chicken Sandwich or Smoky Carnitas Tacos http://t....	1430404206	593784394655076352	f	mexicue
.@BoozeMenus goes behind the bar with our own @thomaskelly to talk on our dranks here: http://t.co/jbCABepknC	1430333703	593488682436399105	f	mexicue
AvocadoToast &lt; Avocado Tacos\n\nEspecially on TacoTuesday, obviously http://t.co/vuwIh91ywh	1430235052	593074910391578624	f	mexicue
@DougBenson you should come chat & chew while you're in NYC	1430175646	592825744079847424	f	mexicue
RT @ExperienceNoMad: We spoke with co-founder Dave Schillace about @Mexicue's new NoMad location!\n\nhttp://t.co/LQEidYJIYG	1430164238	592777896969797632	f	mexicue
Shrimp & Arugula Salad is where it's at. Do it up at 225 Fifth Ave http://t.co/JXBhAP0I6Z	1430153781	592734038613499906	f	mexicue
Apps on apps on apps\n\nDo the Friday dance at our new spot | 225 Fifth Ave @ 26th http://t.co/0VqSxKAr7v	1429892912	591639872991006721	f	mexicue
@JoelSD we've got a bunch of great options, take a peek http://t.co/6uX0yQQQ9C	1429890363	591629182234427392	f	mexicue
Our brand new NoMad location at 225 Fifth Ave (@ 26th St) is NOW OPEN! Come TreatYoSelf http://t.co/wHInEe5tM7	1429714909	590893276040929280	f	mexicue
@NameCantBe stay tuned in the coming weeks - opening day is tomorrow at 11am	1429663831	590679036004802560	f	mexicue
RT @EatingMyNYC: Giving a warm welcome to the new @mexicue / sry couldn't wait before dipping in the guac. EATINGNYC... https://t.co/0sMQW8X...	1429663802	590678916181925888	f	mexicue
RT @FoodtoEat: Awesome day for @BKLYNDESIGNS at Greenpoint! Great foodtrucks over there @Valduccis pizza & @ToumNYC  lebanesefood http:/...	1431112386	596754718388559872	f	toumnyc
RT @BKLYNDESIGNS: We're excited for today's foodtruck vendors, organized by @FoodtoEat : Lebanese by @ToumNYC & pizza by @Valduccis http:/...	1431101263	596708066126606336	f	toumnyc
Hooray for FalafelFriday! The truck is at @BKLYNDESIGNS in Greenpoint & our popup @UrbanSpaceNYC is on 41st & B'way http://t.co/XPqzw6will	1431091296	596666260550725633	f	toumnyc
RT @SimonSassin: All you vegan out there, check out this platter. Humus babaghanouj tabouli spinach pies @ToumNYC yummy http://t.co/...	1431009331	596322475429998592	f	toumnyc
RT @dumbolot: We got @ToumNYC @MexicoBlvd and @mausamnyc today!	1431009326	596322450708791297	f	toumnyc
Hungry? Join the truck in @DumboNYC on Jay & Water until 3pm & our popup on 41st & Broadway! shawarma LebaneseEats http://t.co/cdj033nWJw	1431006031	596308633710911488	f	toumnyc
Hello LebaneseLunchers! Join our truck on 46th btwn 5th & 6th, our booth at @UrbanSpaceNYC on 41st & Broadway & our popup restaurant @AMEX!	1430919063	595943862348087297	f	toumnyc
RT @SimonSassin: Confused ? diet ? You don't have to eat less you have to eat right healthyeating @ToumNYC visit our foodtruck or kio...	1430836312	595596781150412800	f	toumnyc
It's a gorgeous day for lunch outside! Join our truck on 26th btwn 11th&12th or our booth for lunch & dinner on 41st&Broadway @UrbanSpaceNYC	1430836095	595595870323744768	f	toumnyc
RT @SimonSassin: Eat less? No! Eat right? Yes! healthyeating tabouli Humus babaghanouj spinach_pie @ToumNYC kiosk TimesSquare http:/...	1430794471	595421284818903040	f	toumnyc
Happy Monday! Our truck is in Dumbo on Jay & Water St & we have a pop up @ AMEX & a booth on 41st & Broadway! Join us http://t.co/DiTmIt95X8	1430754084	595251891027767297	f	toumnyc
RT @SimonSassin: All vegan lovers thank you for letting @ToumNYC food truck be part of your diet meet us @prospect_park http://t.co/ajUX...	1430669577	594897441750646784	f	toumnyc
@KeilinHuang awesome pic! So happy you enjoyed lunching with us :)	1430668806	594894207728386048	f	toumnyc
RT @KeilinHuang: Lunch courtesy of @toumnyc http://t.co/bcDswkZ3HD	1430668787	594894129743667201	f	toumnyc
It's SundayFunday at the @prospect_park foodtruckrally! Join us at GrandArmyPlaza from 11-5pm! LebaneseEats http://t.co/Ax4uCLQO2u	1430659845	594856624000491520	f	toumnyc
RT @SimonSassin: @ToumNYC: Happy Friday!NYC .Truck is @Pier 36 til 8:30pm.Our popup is in FIDI at AMEX bldg & catering at @LinkedIn! http...	1430513370	594242262814556160	f	toumnyc
Happy Friday! The truck is at the Bike Expo @ Pier 36 until 8:30pm. Our popup is in FIDI at the AMEX building & were catering at @LinkedIn!	1430486905	594131260391464960	f	toumnyc
RT @FoodtoEat: Hello Dumbo did you know @ToumNYC (really good lebanesefood ) is over there? Preorder online for pickup: http://t.co/TIDHm...	1430418434	593844072189730816	f	toumnyc
RT @SimonSassin: LebaneseLunch falafel kafta Humus lovers come share your love with @ToumNYC http://t.co/cVqRAuUTmf	1430405162	593788404497829888	f	toumnyc
RT @dumbolot: Happy Thursday with @ToumNYC @MexicoBlvd and @mausamnyc!	1430403821	593782782398173184	f	toumnyc
RT @abake6: LMFAO RT @LazUhhhBro: When you smell weed from across the room http://t.co/RViOkSv9fi	1431155400	596935131975315456	f	dubpies
PieTruck is on Bedford Ave @ N7 until midnight. noLTrain	1431129286	596825599727050752	f	dubpies
Totes lovin' @nzonairmusic's All Tracks: Explore New Zealands Music site... good work guys! http://t.co/HrZIso93rb	1431104892	596723286039523328	f	dubpies
RT @Stephluva2711: it sux working on 1st ave. trying to figure out lunch & nowhere near  @CoolhausNY @AndysItalianIce @dubpies @NeaExpress	1431104811	596722946309300225	f	dubpies
Looking for the Pie Truck? We're over at @PENamerican's event at NYU until 5PM. Stop by! NYC http://t.co/CAq4HBToUd	1431104294	596720775547224064	f	dubpies
Working on it. Glad you liked it! RT @davecohen1: @dubpies please bring back the Ned Kelly!! dubpies nedkelly delicious	1431050355	596494542326648832	f	dubpies
The DUB pie truck is stationed at 47th & Park today in Manhattan - Come by and grab a bite DUBpies NYC http://t.co/e2ah8j1EOp	1431011421	596331237989601280	f	dubpies
@CalicoAvenger Mother's Day event at Botanical Gardens, Bronx	1430966549	596143034728914945	f	dubpies
. @byseanferrell just won 24 DUB pies. Name drawn randomly for our gaining 4500 followers. Next draw @ 5000. Pls RT	1430962818	596127384648159232	f	dubpies
. @dangerouspiesDC PieTruck!  Brothers in ALL things pie!	1430951303	596079087682203648	f	dubpies
Love your work! Bumped into y'all @ContinentalATX RT @dangerouspiesDC: What do we eat when visiting NYC...pie from @dubpies duh! pielove	1430951178	596078563595558912	f	dubpies
We'll keep the pie warmer light on for you! RT @djsirvere: @dubpies this trip I swear I'm gonna make it there bro	1430944070	596048749253816321	f	dubpies
@pierateers do you have an NYC address yet? Happy to send you a few samples! ;-)	1430944035	596048601077395456	f	dubpies
. @byseanferrell just won 24 DUB pies. Name drawn randomly for our gaining 4500 followers. Next draw @ 5000. Pls RT	1430942886	596043782530928640	f	dubpies
Mos def gonna live tweet you eating 23 of our pies! RT @byseanferrell: @sarahlapolla @dubpies You'll have to! I can only eat 23 of them.	1430942732	596043135303712768	f	dubpies
RT @byseanferrell: So I have won 24 delicious savory pies from @dubpies. Now all I have to do is figure out what to have for dinner. Hey......	1430942658	596042827693424640	f	dubpies
Yes! And we will live tweet the whole thing! ;-)  RT @byseanferrell: @dubpies WOW! DO I HAVE TO EAT THEM ALL AT ONCE!?!	1430940941	596035625213648896	f	dubpies
Winner of random draw (we reached 4500 followers): @byseanferrell http://t.co/TqOlxHBLEK 24 pies on the way, get in touch.	1430940382	596033280820019200	f	dubpies
Get your pie fix in Manhattan's SoHo neighborhood at Varick & King Street or stop by the Brooklyn pie shop 'til 8. http://t.co/M73otafFL8	1430925521	595970948668456961	f	dubpies
The 'flat white economy is here to stay. http://t.co/VnPJu8potl  Can hipsters save the world?	1430876713	595766232403595265	f	dubpies
Yeah, our homemade Mediterranean  shawarma is waiting for you! ! http://t.co/AQiqQIRf3A	1431100154	596703411208384513	f	chefsamirtruck
We are on 55st and Broadway! !	1431099978	596702676039139328	f	chefsamirtruck
We are on 47st between park av and Lexington av!	1431013086	596338223296749570	f	chefsamirtruck
Making the best couscous !! http://t.co/6ufwXizSNX	1431005563	596306670088810496	f	chefsamirtruck
We are on 52st and park av!	1430927884	595980860723240963	f	chefsamirtruck
http://t.co/M01OcbsKnR\nfoodnetwork chefsamirinaction couscousrocks	1430881605	595786751173652480	f	chefsamirtruck
We are on 36st and Broadway!	1430840255	595613318540349441	f	chefsamirtruck
Today we are on 52st and 6av!!	1430752722	595246176817020929	f	chefsamirtruck
We are on 55st and Broadway	1430495518	594167384593854465	f	chefsamirtruck
We are happy to announce that we will be part of governor's ball music festival 2015!!!	1430321531	593437632388038656	f	chefsamirtruck
We are on 52st and park av!	1430321456	593437316254924800	f	chefsamirtruck
We are on 36st and Broadway!	1430236003	593078900080713728	f	chefsamirtruck
We are on old slip and water st!	1430151821	592725814979997698	f	chefsamirtruck
We are on 47st between park av and Lexington av!	1429804086	591267310326906880	f	chefsamirtruck
We are on 52st and park av!	1429717554	590904369337524224	f	chefsamirtruck
https://t.co/t5OxSLN8tK	1429624594	590514463595438080	f	chefsamirtruck
We are in old slip and water st!	1429545580	590183058910883840	f	chefsamirtruck
We are on 55st and Broadway!	1429286647	589097012416643072	f	chefsamirtruck
We are on 47st between park av and Lexington av!	1429199071	588729691982422016	f	chefsamirtruck
We are on old slip and water st!	1428939702	587641820097732608	f	chefsamirtruck
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
RT @lostplum: If eating just @BrooklynPopcorn for dinner is wrong, I don't want to be right!!	1430969410	596155033403658240	f	brooklynpopcorn
RT @imnotnicolle: Was blessed with the @BrooklynPopcorn truck. I wrote a whole story about on IG cause I'm annoying. http://t.co/bwz90vRIoL	1430969403	596155005071163392	f	brooklynpopcorn
@kakea107 Hi Kristin call us to find our locations for the day you are requesting. We have 3 trucks out now.Hoping to see you soon :)	1430969384	596154922854424578	f	brooklynpopcorn
RT @RorySacks: Shout out to the @BrooklynPopcorn staff for the recommendation of jalapeno mixed w garlic parm popcorn http://t.co/3HVRheocgD	1430507324	594216903700283395	f	brooklynpopcorn
RT @tuccimusic: @BrooklynPopcorn GREAT POPCORN please check them out the Spicy Cajun popcorn is awesome!	1430507205	594216406411026433	f	brooklynpopcorn
RT @MatthewGellert: @brooklynpopcorn foodtruck near work today & now all other popcorn is seen as weak and useless. incredible delicious...	1430507201	594216388581040129	f	brooklynpopcorn
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
Watch over them today NYPD http://t.co/iQI8oAm09F	1431105797	596727082266275840	f	mtblls
Yay it's Friday!!!! And a nice a one too   come by 50th bet 6&7 Aves for your weekend fix, the Mtbll  is waiting.	1431096772	596689228811108352	f	mtblls
Good Thursday Y'all!   The Mtbll  is stopped at 50th bet 6&7 Aves. Come enjoy the beautiful weather and your favorite ball 	1431014596	596344556536336384	f	mtblls
Morning Mtbll Lovers!  The  has stopped on 50th bet 6&7 Aves. Dont let the gray skies keep you from your... http://t.co/m6Lojkeeom	1430926298	595974206816419841	f	mtblls
Good Morning  Start your Fiesta with your favorite ball, chicken, or beef. Mix it up with our tasty sauces... http://t.co/xrlmOXx1Fc	1430834767	595590300686516224	f	mtblls
Beautiful day for Marvelous Mtbll Monday\nThe  is waiting at 50th bet 6&7 Aves. Come on by!	1430755859	595259336240300032	f	mtblls
Happy Thursday Y'all!   The Mtbll  has stopped on 50th bet 6&7 Aves. Stop by grab your favorite ball. \nLET'S GO... http://t.co/dTfkK9awGc	1430408032	593800442544521217	f	mtblls
Happy  Day Mtbll Lovers! The has stopped on 50th bet 6&7 Aves. Beautiful day for a stroll  Come on by for your favorite menu item. 	1430325049	593452385319723008	f	mtblls
Good Tuesday Morning !  The Mtbll  has been traveling today and is stationed at 47th bet Park & Madison.   Stop... http://t.co/lxgVCn2fR4	1430232373	593063676309012480	f	mtblls
Good Monday y'all!  The Mtbll  is stopped at 50th bet 6&7 Aves, come on by and say Hi	1430148420	592711550244417540	f	mtblls
TGIF MTBLL LOVERS. Come on by 50th bet 6&7 Aves for your weekend fix. The  will be waiting  	1429886631	591613529620410368	f	mtblls
The Mtbll  will he taking a personal day. Not to worry we will return for your weekend fix! http://t.co/Cf7KxpDZLD	1429804894	591270700163461120	f	mtblls
Happy  Day!!!  The Mtbll  has stopped on 50th bet 6&7 Aves. Come on by beautiful day for a walk and your favorite ball of course 	1429714815	590892878567776256	f	mtblls
Good Morning Mtbll Lovers!!!   Crazy start to the day   Get out for lunch today and get your favorite ball the... http://t.co/nDQxx2uLeK	1429628800	590532108877168641	f	mtblls
Good Monday y'all. Well the rain will be keeping the  away today. Brighter days ahead. We will see you all tomorrow! \n The Mtbll team	1429545632	590183275068583936	f	mtblls
TGIF! It may be a grumpy day but there is happy right around the corner yep 50th bet 6&7 Aves. The Mtbll  of... http://t.co/OE248wgx0E	1429280763	589072334604136448	f	mtblls
Good Thursday Y'all !!  Sun is still shining  makes us happy. The Mtbll  has stopped on 50th bet 6&7 Aves.... http://t.co/OHZ0ETOmte	1429190920	588695504030191617	f	mtblls
Good Morning Mtbll Lovers  Sun is out! It's  day and its  going to be nice out. So why not enjoy the fresh... http://t.co/0SNQX7md8p	1429108245	588348740634861568	f	mtblls
Good Tuesday Y'all. Still kinda dark out here   hopefully the rain will stop by lunch. The Mtbll  is stopped at... http://t.co/Ih2EZEmQuq	1429019994	587978591247405056	f	mtblls
Happy Monday Mtbll Lovers!   Calls for a nice day today   come in by 50th bet 6&7 Aves for your favorite ball. The  is waiting.	1428937236	587631477862625280	f	mtblls
Officially sold out of ice cream! Thank you everyone for a great season!! closed	1382307419	392051847542079488	f	itizyicecream
Greenwich and jay st TriBeCa is where we're at!	1382288993	391974563716030466	f	itizyicecream
Last day of the season!  Stop by for hazelnut ice cram and sorbets!  Sorbet pints on sale.  Limited quantity left, here til we sell out	1382288637	391973070702792704	f	itizyicecream
Final day in LIC!  Blowout sale on sorbet pints ($6.50) and ice cream pops ($1.50).   Stop by 47th rd and center blvd til 6:30 today.	1382201646	391608204112957440	f	itizyicecream
@sarahark hazelnut and mango ice cream today!  Though we're transforming into a sorbet truck...  Running out of ice cream :-)	1382126730	391293983219281920	f	itizyicecream
RT @dumbolot: We got @DomoTaco @NeaExpress and @SnowdayTruck today!	1430384689	593702536902615040	f	neaexpress
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
my day http://t.co/XZKibesx6l	1431122746	596798169549266944	f	milktrucknyc
Sorry all at Wall Street, Bessie needs some last minute attention from the mechanics. Come see us at the markets this weekend!	1431097161	596690860101636097	f	milktrucknyc
@kb_ginger i am so sorry. was not intended.	1431093684	596676275831492608	f	milktrucknyc
@milktrucknyc Sorry People we are NOT at Wall st. today.	1431093466	596675361280229376	f	milktrucknyc
@KittyGoogs @kewe_m ladies i have some bad news. we had to take bessie in some 4 last minute repairs. i'm so sorry-but will make it up 2 u!	1431088933	596656348579942400	f	milktrucknyc
@KittyGoogs @kewe_m yes we will	1431044673	596470709771198465	f	milktrucknyc
Bessie's staying in today, but will be back on the streets tomorrow at Wall St.!	1430962211	596124839787630593	f	milktrucknyc
@DanielleWozniak :)	1430745762	595216984113020928	f	milktrucknyc
@DanielleWozniak we are not out today. rare day off for the crew!	1430671999	594907599595819008	f	milktrucknyc
There's no @smorgasburg at Pier 5 today due to the 5 Boro Bike Tour! We'll see you on the road this week starting on Tuesday.	1430661605	594864005451124738	f	milktrucknyc
Today we're at W-burg @smorgasburg on East River waterfront until 6pm and the Fort Greene Flea until 5pm (176 Lafayette Ave). See you there!	1430575204	594501613412200449	f	milktrucknyc
@Jnewcomers so sorry. back next week!	1430507208	594216416510877696	f	milktrucknyc
@llbnyny not really. sometimes we are on church and walker.	1430496605	594171944993423362	f	milktrucknyc
RT @KittyGoogs: @milktrucknyc @kewe_m this is how we now feel!!!!!! http://t.co/Ca6OWMI8rK	1430496578	594171831176843264	f	milktrucknyc
@KittyGoogs @kewe_m bad news ladies. not there today. so so sorry. back next friday.	1430493213	594157718082039808	f	milktrucknyc
RT @nycfoodtruck: RT @milktrucknyc: Want to work w/ us? We're hiring. Looking for smart. competent. human. crew members. apply  info@milktr...	1430487338	594133076860633088	f	milktrucknyc
Bessie won't be out today at Wall St/ William St. We will be back next week with bells on!\nSorry and thanks.	1430487007	594131688424247296	f	milktrucknyc
Want to work with us? We're hiring. Looking for smart. competent. human. crew members. apply  info@milktrucknyc.com thanks!	1430415842	593833200302030848	f	milktrucknyc
@ADoseofCrazy thanks!	1430399775	593765810734268417	f	milktrucknyc
RT @ADoseofCrazy: @milktrucknyc Not only has the tastiest food, friendliest cheese masters, and most orgasmic milkshakes, but they also hav...	1430399763	593765759031058432	f	milktrucknyc
These are beautiful locations, but don't forget Greece! | Bucket List Places You Need To See http://t.co/buxZVNbFyb http://t.co/nEoy4AmwSz	1431119731	596785525429768192	f	souvlakitruck
RT @randomfoodtruck: Nice day for a picnic @CarpeDonutNYC @carlssteaks @Chefsamirtruck @souvlakitruck	1431102316	596712481554374656	f	souvlakitruck
12 Fundamental Characteristics of Greek food by @GreekReporter http://t.co/QyykjtqTMZ http://t.co/2SsIpJkDWy	1431033029	596421871962316800	f	souvlakitruck
Wow! U2 Performed On A NYC Subway Platform Yesterday via @Gothamist http://t.co/XbBCZ9rIrO http://t.co/mraJB3afaZ	1430942731	596043132745154560	f	souvlakitruck
@justyniak We are on 46/6th ave\nStop by for a little taste of  Mykonos	1430843694	595627741816496129	f	souvlakitruck
@cmzane Hi Chris! We're on 46/6th ave\nStop by for a little taste of Mykonos	1430758344	595269757085024256	f	souvlakitruck
Olive Oil 101: Everything You Need to Know | @FoodNetwork http://t.co/Kp7CkeRVY2	1430757054	595264346814558208	f	souvlakitruck
Pork lovers unite! The pork souvlaki is what you've been dreaming of - sometimes dreams do come true... http://t.co/gak6VURGWJ	1430678113	594933242928754688	f	souvlakitruck
Fries fits any occasion - especially Greek fries. We only make the best at SouvlakiGR! http://t.co/OT9xy3y35W	1430595033	594584780995436544	f	souvlakitruck
Happy Friday! Treat yourself to a hot, sizzling skewer - easy to eat and utterly delicious. SouvlakiGR http://t.co/2EWifUHPoY	1430508313	594221050013085696	f	souvlakitruck
RT @randomfoodtruck: Friday's here and so are the trucks! @Chefsamirtruck @CarpeDonutNYC @souvlakitruck @carlssteaks	1430495387	594166835991453696	f	souvlakitruck
You know you can't get enough of our souvlaki, hot and fresh from the grill... http://t.co/UQ1QuuXPBP	1430421908	593858643109482496	f	souvlakitruck
@scifylullaby We are in Soho today!\nCharlton/Varick We will be on 46/6th Mon/Tue @WeWork @HudsonSquareNYC till 3 pm.	1430410830	593812180488814592	f	souvlakitruck
RT @VoiceStreet: Final ChoiceStreets line up announced - 20 trucks, drinks & more - limited tickets left : http://t.co/uE5jyhxCRM http://t...	1430366030	593624272385474561	f	souvlakitruck
I posted a new photo to Facebook http://t.co/nmag5QJEzt	1430828643	595564612935950336	f	polishcuisine
You can't miss our truck - it's as blue as the clear waters around Mykonos! SouvlakiGR http://t.co/NzLTnudsUC	1430341523	593521481851637760	f	souvlakitruck
RT @procurementnyc: @souvlakitruck ate your chicken pita & it was delicious.  Your truck is at hanover and water street in Financial Distri...	1430339884	593514608461152257	f	souvlakitruck
@arditb We are in Wall Street today!\nHanover Square/ Water st. till 3 pm.\nStop by for a little taste of Mykonos	1430327865	593464198040002560	f	souvlakitruck
@scifylullaby Oops! We are on 46st/6th ave\nWith a little taste of Mykonos till 3 pm	1430154461	592736887539892225	f	souvlakitruck
RT @Valduccis: Parkinson's Unity Walk Central Park @Foodtruckstars_ @FoodPorn @gcnyc1 @souvlakitruck @SweeteryNYC and @Valduccis http://t....	1430146156	592702056613474305	f	souvlakitruck
@sita712 We are so sorry to hear that! @souvlakigr	1430143831	592692301593505794	f	souvlakitruck
Beautiful sunny day @nyuniversity any entree served with basmati rice/garden salad/water or soda only $10 http://t.co/9icPaA84Vg	1431101711	596709941911506944	f	mausamnyc
Happy Friday @NYU University\nLiterary Mews : \nKimmel Center on W. 4th Street). http://t.co/Xgsi66WUQS	1431088329	596653813701849088	f	mausamnyc
Thursday's favorite @dumbolot don't miss out on your mouthwatering curries & bites http://t.co/xuN2Tqb6tF	1431001172	596288250689560576	f	mausamnyc
spice up your day with our savory flavors @52nd street between 6 & 7 avenue http://t.co/YGZHpkm3zl	1430917876	595938881985499136	f	mausamnyc
Beautiful sunny day @51st street between Park & Madison. Enjoy savory curries and bites http://t.co/aw3H4zpLCm	1430831469	595576465569222656	f	mausamnyc
Happy Monday Midtown Delicious Indian cuisine @47 Street between Park & Lexington http://t.co/FlPvXZmGVB	1430748898	595230138683551744	f	mausamnyc
Happy Friday @dumbolot your weekend kickoff with our savory Indian cuisine http://t.co/LbbFmak9m5	1430483989	594119030459539456	f	mausamnyc
52nd street between 6 & 7 avenue http://t.co/qmqV8Km7yU	1430319841	593430543842181120	f	mausamnyc
Curry King @51st Street between park & Madison http://t.co/nZwvGcueSz	1430224221	593029481721266176	f	mausamnyc
happy Monday @47 street between park & Lexington http://t.co/1VGyYorGEL	1430144207	592693879440310273	f	mausamnyc
Tanger Outlets Food Truck \nTanger Outlets Riverhead\n200 Tanger Mall Drive\nRiverhead, NY http://t.co/zXU8yHTsbj	1429963945	591937808425623552	f	mausamnyc
Happy Friday Start your weekend @dumbolot delicious Indian cuisine http://t.co/wIB7EsbFJ0	1429875831	591568229706772481	f	mausamnyc
@dumbolot  delicious curries & bites http://t.co/Z9OplkKXP9	1429792207	591217486822973440	f	mausamnyc
Midtown lunch @51street & Park Avenue http://t.co/C4wuLoGbsZ	1429618536	590489055705497601	f	mausamnyc
Happy Monday @47street between Park & Lexington. Savory Indian cuisine http://t.co/o1niMUTTRP	1429532332	590127492834271232	f	mausamnyc
Happy Friday Curry King delicious authentic Indian  cuisine to start your weekend http://t.co/VNt3vIikZe	1429266835	589013917361381376	f	mausamnyc
Thursday's favorite @dumbolot  sunny beautiful day for our delicious Indian cuisine http://t.co/yNAEYq0uJZ	1429187038	588679222983536640	f	mausamnyc
savory curries & bites @52nd Street between 6 & 7 Avenue http://t.co/BGHDYW6rpe	1429103931	588330645409128450	f	mausamnyc
fresh curries & bites @East 51st Str & Park Avenue http://t.co/oRSmXN2gzY	1429017419	587967789270507520	f	mausamnyc
Midtown favorite @47 street between Park N Lexington Avenue http://t.co/ZdmBdczHNg	1428929775	587600182109466625	f	mausamnyc
Good morning NYC! our grill's speed is 160 mph.\njoin us for a quick,tasty breakfast\nThe truck is at 52nd and Park.	1431004479	596302123614216192	f	etravaganza
RT @WNTonight: Happy Cinco de Mayo! \nWATCH: .@GStephanopoulos gives us a brief history of the holiday: http://t.co/n0891DqphX http://t.co/j...	1430836807	595598856030691328	f	etravaganza
Buenos Dias a todos..!!feliz Cinco de Mayo	1430817917	595519625825234945	f	etravaganza
RT @edlevine: So awesome that Aaron @franklinbbq won best chef sw bbq rules! @seriouseats @jamesbeardfoundation @TheFoodLab http://t.co/pw5...	1430792121	595411427701194753	f	etravaganza
Yay..Almost Friday.!! Have you tried our tasty Mexican Wrap??\nNow you can  have it for breakfast and lunch.	1430408329	593801688978456576	f	etravaganza
Beautiful day in Midtown..!!prepping a tasty lunch for you!\nBegins serving at 11:33.	1430232050	593062319128739840	f	etravaganza
Think... Burrito!	1430150482	592720200430149633	f	etravaganza
Y IY!!grab a delicious bites on the go!!	1429890984	591631788172271616	f	etravaganza
Have you tried our delicious Mexican Grilled cheese?\nBacon bits chorizo fresco grilled tomato  jalapenos on a multigrain.\nGet yours.and More	1429802391	591260199975051264	f	etravaganza
Good morning NYC!We are back on our usual location 52nd and Park..join us delicious breakfast awaits.	1429787868	591199285649215488	f	etravaganza
Sorry guys!!\n the truck is at the mechanic.\nwe apologize for any convenience see you tomorrow	1429706272	590857048117608448	f	etravaganza
Hola amigos De midtown...!! delicioso taco tuesday.\nJoin us..!!	1429624587	590514436252770304	f	etravaganza
RT @RoamingHunger: 5 Brunch trucks that will get you out of bed! http://t.co/2pzLuNPniA foodtruck foodie http://t.co/3oAGIeuIkJ	1429211799	588783079281557506	f	etravaganza
RT @FoodtoEat: Breakfast may be over with @ETRAVAGANZA but lunch is starting up. Preorder online for pickup:  http://t.co/6aGZrfbrsj	1429198255	588726269451337729	f	etravaganza
Hello midtown.!! have you tried Our  tasty salad bowls??	1429108490	588349770084786176	f	etravaganza
A nice breakfast article from the New York Times. http://t.co/9dTUcFUlOV	1428972293	587778518408364032	f	etravaganza
Back to reality folks!!....lunch begins at 11:59	1428940305	587644350827474944	f	etravaganza
Happy Friday! Breakfast it's ready.	1428666057	586494068399730688	f	etravaganza
Good morning Midtown.!\nNow Serving delicious matzo Brie	1428320463	585044544338558977	f	etravaganza
Resurrection..!! Happy Easter.	1428237650	584697201437315072	f	etravaganza
Did you know our @greenboxny year into plates?credit: @ehynes213 neapolitanexpress pizz... http://t.co/IFbjPlinBC http://t.co/qUkE6YzQG0	1430619288	594686516531703808	f	neaexpress
Our Diavolo pairs @mikeshothoney with jalapenos to pack in the perfect punch of spice! cr... http://t.co/FkDU6K2RkA http://t.co/gXoPpWDxKL	1430498054	594178023185895424	f	neaexpress
FiDi are you hungry? We're open on WallStreetcredit: @brianlavoe pizzaneversleeps n... http://t.co/3XgZx8GYpE http://t.co/f4Dw9VFeBD	1430410122	593809207641677824	f	neaexpress
RT @gastronami: Tricolore pizza (fresh pesto, fresh mozz, basil, San Marzano tomato, black truffle oil) was delicious! @NeaExpress http://t...	1430384712	593702632205787136	f	neaexpress
RT @FransmartKris: Evolution of fast casual pizza oven technology \n http://t.co/NXZEjT4Nwe @NeaExpress	1430384695	593702561099616256	f	neaexpress
RT @rouk: The @NeaExpress is outside my job today! ClutchLunch	1430384691	593702544808939520	f	neaexpress
RT @gastronami: Couldn't resist picking up a Bianca pizza at @NeaExpress. Love it! http://t.co/rK2ulYXoJF	1430384678	593702487401504768	f	neaexpress
Can pizza be our wcw? credit: @thefeaststpizza dailypizza pizzaneversleeps neapolitan... http://t.co/AcngEaJdeu http://t.co/GwMuzlEev7	1430332063	593481807254913026	f	neaexpress
Thanks for posting your pizza, @gastronami! pizzaneversleeps neapolitanexpress neaexpr... http://t.co/XCA7vVnZhc http://t.co/rOKovd8Juf	1430167122	592789993468370945	f	neaexpress
Did you hear the joke about the pizza? Never mind, it's to cheesy... @donthatemecuzimhung... http://t.co/6OOlj5nAc9 http://t.co/RuWycTsKW5	1429629923	590536819034423296	f	neaexpress
Our pizza is organic and eco friendly! neapolitanexpress neaexpress dailypizza foodtr... http://t.co/ZmawrBnzIn http://t.co/IPTkNSl66u	1429204155	588751018587983873	f	neaexpress
eeny, meeny, miny, moe! pizzaneversleeps neapolitanexpress dailypizza wallstreet wall... http://t.co/1FTuipztTp http://t.co/JHAVqbeQ1S	1429115281	588378251262763009	f	neaexpress
RT @greenboxny: NYCs WallStreet welcomes its very first pizzeria, and it just happens to be GreenBox user @NeaExpress! https://t.co/l8x...	1428943527	587657863738302464	f	neaexpress
Sharing is caring!pizzaneversleeps neapolitanexpress dailypizza pizzafromabove credi... https://t.co/mAPevoDLJW http://t.co/YbFMonY8bn	1428943126	587656179955937281	f	neaexpress
RT @carlomantica: Ottima pizza. Worth the little trip to 111th street or look for the truck (at @neaexpress) https://t.co/r2MljkpYPx http:/...	1428935197	587622923818643457	f	neaexpress
Mmm, Margherita! Thanks for posting a pic of your pizza, @nyceeeeeats! Come see us again s... https://t.co/XWreefBqsc http://t.co/weScsJIlIO	1428879464	587389165823778816	f	neaexpress
RT @nycfoodtruck: The first Prospect Park Food Truck Rally of the 2015 season is SUNDAY, 4/12, and will include @KimchiTruck @MilkTruckNYC ...	1428695575	586617876901191680	f	neaexpress
RT @CrespoMax: FACT 1st pizza ever on wallstreet was made by @NeaExpress with cleanenergy & paid using @Square @jack @boonepickens http:/...	1428615086	586280283802099712	f	neaexpress
Serving up juicy Schwarma,	1431028753	596403934534729728	f	grillonwheelsny
Best Kosher food!! Grill On Wheels downtown @ Hanover Square. Today's special, FREE soda with any plate of your choice.	1431015361	596347766755975168	f	grillonwheelsny
Grill On Wheels downtown is in the financial district! @ Hanover Square. Today special, FREE soda with any plate of your choice.	1431006005	596308525191700480	f	grillonwheelsny
Grill On Wheels downtown is  in the financial district! Hanover & Water St come enjoy great foodopen @11:00	1430399687	593765442898030592	f	grillonwheelsny
Grill On Wheels downtown is  in the financial district! Hanover & Water St come enjoy great foodopen @11:00	1430232110	593062571210604544	f	grillonwheelsny
Grill On Wheels downtown is  in the financial district! Hanover & Water St come enjoy great foodopen @11:00	1430142278	592685787801608193	f	grillonwheelsny
Grill On Wheels downtown is  in the financial district! Hanover & Water St come enjoy great food	1429879091	591581904706605057	f	grillonwheelsny
Grill On Wheels downtown is  in the financial district! Hanover & Water St- NOW OPEN come enjoy great food	1429806739	591278437161168896	f	grillonwheelsny
Grill On Wheels downtown in the financial district! Hanover & Water St- open @11:00 to 3:00	1429531416	590123646829604864	f	grillonwheelsny
http://t.co/yvqWs2wRa5	1429481731	589915254928310273	f	grillonwheelsny
http://t.co/CDXbwNBF1f	1425870705	574769512068837376	f	grillonwheelsny
@YeahThatsKosher @abieDweck http://t.co/kZyf7LNGqH	1417538109	539820071603163136	f	grillonwheelsny
We would like you all to try out Pitopia on Broadway/w37th St for Falafel, Shawarma, Schnitzel and Salad bar http://t.co/GEINcVEUyl	1417537134	539815985835175936	f	grillonwheelsny
Wow! Thank you for all the TLC! GOW will be off for a little bit longer. Working on some cool modifications!! Can't wait to c u soon!	1412013484	516648115638915072	f	grillonwheelsny
Hey everyone! TU for all the emails, we miss u2. We r still here!! Just taking an extended holiday and will be back after Rosh Ha Shana!	1411135732	512966559116304384	f	grillonwheelsny
Hi guys We are very sorry Grill on wheels off the road today	1410874541	511871043859148800	f	grillonwheelsny
Hi guys We are very sorry Grill on wheels off the road today 	1410790890	511520183744483328	f	grillonwheelsny
GOW truck is getting a tune-up and will be off the road this week. We'll be back next week and stronger than ever!!	1410351061	509675407445348353	f	grillonwheelsny
Hi guys We are very sorry Grill on wheels off the road today 	1410281876	509385224741191680	f	grillonwheelsny
We are going to be serving a private event today during lunch!! C U all tomorrow!	1410187803	508990656027848704	f	grillonwheelsny
Old Traditional Polish Cuisine honorable mention DirectorofMarketing MothersDaySpecial http://t.co/thdUYuHugD	1431120054	596786879627960320	f	polishcuisine
Have a super fabulous weekend! EnjoyTheSunshine	1431109585	596742968490491904	f	polishcuisine
great to see you and thanks for coming! have a great weekend https://t.co/NgJHisRLYj	1431108673	596739143864025088	f	polishcuisine
55th & Broadway today pierogitime @randomfoodtruck	1431102073	596711460925001728	f	polishcuisine
The sun is shining - catch us on 55th & Broadway! Pierogitime MidtownWest GrilledKielbasa	1431097805	596693559388053505	f	polishcuisine
Thanks so much for having me! MothersDay  special ..great to meet you! @rosannascotto @gregkellyfox5 http://t.co/Hcb82xOxWx	1431094366	596679136564944896	f	polishcuisine
55th & Broadway today!!! pierogitime traditional MidtownWest NYC	1431087837	596651750557364224	f	polishcuisine
55th & Broadway glad to be back! MidtownWest pierogi HuntersStew special traditional	1431085540	596642116039737344	f	polishcuisine
Ready to Roll on Old Slip b/w Front & Water pierogitime FinancialDistrict nyc HuntersStew special	1431011345	596330922649194497	f	polishcuisine
Old Slip bw Front & Water st today! FinancialDistrict HuntersStew traditional	1431000587	596285800410685440	f	polishcuisine
we are here & ready to roll on 47th b/w park & lexington MidtownEast MidtownLunch Midtown NYC pierogitime	1430924286	595965767444766720	f	polishcuisine
47th bw Park & Lexington today HuntersStew special pierogi GrilledKielbasa TymbarkJuices nyc	1430916557	595933350948405248	f	polishcuisine
Great seeing you 52nd! See you on 47th b/w Park & Lexington tomorrow! Let the HuntersStew feast continue!	1430852093	595662971667390464	f	polishcuisine
Traditional Tuesday on 52nd b/w 6th & 7th (closer to 6th) HuntersStew special back on the truck this week!	1430837825	595603126352269312	f	polishcuisine
http://t.co/9z9n9E4Six	1430828912	595565740767334400	f	polishcuisine
http://t.co/gGoJv6zzhD	1430828884	595565622697676800	f	polishcuisine
http://t.co/o2H5bov2dp	1430828858	595565514644140032	f	polishcuisine
I posted a new photo to Facebook http://t.co/CTplrxZiN7	1430828746	595565044299145216	f	polishcuisine
TGIF on 53rd & Park!	1425049454	571324938080006144	f	biandangnyc
I posted a new photo to Facebook http://t.co/r9gjWHM8bm	1430828583	595564361000886273	f	polishcuisine
Welcome Friday !!  We r open @king st. and Hudson st. pen @king st. In front of (In front of  Jacques Torres Chocolate) try BBQ RICE BOWL	1431099924	596702446157754368	f	bobjotruck
Good morning. We r open at 47th st. Btween park and lex ave. try our world best BBQ -beef(galbi),pork,chiecken. PlZ come by and enjoy Thx!!	1431013221	596338791046094850	f	bobjotruck
Hello nyc ! We r open @king and Hudson st. Try our bbq rice platter! PlZ stop by and enjoy thank you!	1430924069	595964857951846401	f	bobjotruck
Goodmorning! We r ready to serve at hanover sq. and water st. Try our new menu BBQ RICE PLATTER-pork beef(galbi) chicken ! PlZ come by thx!	1430839688	595610938486710274	f	bobjotruck
Welcome Monday!! we r open at 47th btween park and lex ave. try our new menu KOREAN BBQ RICE PLATTER! MayThe4thBeWithYou Thx!	1430753804	595250716119273472	f	bobjotruck
Welcome Friday !!  We r open @king st. and Hudson st. Try our BBQ rice platter! PlZ stop by and enjoy thank you! http://t.co/poob17Iv8q	1430495875	594168885089304576	f	bobjotruck
Hello nyc ! We r open @king and Hudson st. Try our bbq rice platter! PlZ stop by and enjoy thank you!	1430409532	593806735745359872	f	bobjotruck
SUNSHINE Newyork! We r open@hanover sq. & water st. We r ready to serve New menu Beef(Galbi) BBQ rice platter! Thx! http://t.co/JMtHbhR2MY	1430233639	593068986264346625	f	bobjotruck
Morning NYC! We r open at 47th st. Park&Lex We start new menu Beef(GALBI)BBQ rice platter and Pork,shrimp as well.thx http://t.co/bJl1F5NHiW	1430147828	592709070039195648	f	bobjotruck
Hello NYC !! We r open at 47th btween park and lex Ave. try our new men BBQ rice platter!!! PlZ come by and Thx	1429892013	591636100667547649	f	bobjotruck
GALBI:the beef was marinated with Korean tradition sauce http://t.co/acYmNZt3bb	1429800999	591254361461895169	f	bobjotruck
FYI: We going to start Beef BBQ (GALBI:the beef was marinated with Korean tradition sauce) on next Monday!!! Please stop by and enjoy Thx :)	1429800870	591253819151020032	f	bobjotruck
Morning nyc we r open at varick and king st. Try our new menu BBQ (pork,shrimp) rice platter. And we also ready2serve2 burrito,dumpling. Thx	1429800433	591251986114342912	f	bobjotruck
Hello nyc we r open @hanover sq. and water st. We r ready to new menu BBQ RICE PLATTER(pork and shrimp) plZ stop by and enjoy Thx	1429628739	590531849501442049	f	bobjotruck
Hello nyc we r ready to serve 46th st. Btween 5th and 6th ave. try our new menu BBQ- pork,shrimp rice bowl. PlZ come by if u around here thx	1429545441	590182472165564416	f	bobjotruck
This is BOBJO new menu http://t.co/e8CkgxhiV5	1429285018	589090178804936704	f	bobjotruck
Welcome Friday! We r ready to serve @47th st. Btwen park and lex. Try our new menu pork, shrimp BBQ. PlZ stop by and enjoy thank you	1429284947	589089880845713408	f	bobjotruck
Hello nyc! We r open @varick and king st. Try out new menu BBQ rice platter.  PlZ come by and try our bbq platter thank you	1429199269	588730522316181504	f	bobjotruck
And  also Beef BBQ (galbi)rice platter and tofu rice platter(veggie) coming soon! Thank you ! http://t.co/E0fL9zTNGc	1429022502	587989109068722176	f	bobjotruck
Goodmorning NYC! We gonna open @ hanover sq. &water st. With new menu pork bbq,shrimp bbq platter @11:30 plZ come by http://t.co/0424x3lzqt	1429022323	587988358514769920	f	bobjotruck
RENE'S 40TH BDAY\nDC WHITEPLAINS \nWE HERE https://t.co/pgVb8wq8lr	1431153618	596927659160051712	f	latinkitchennyc
2NITE \nDON COQUI WHITEPLAINS \nANY QUESTIONS??\ndoncoquiwp djcamilo doncoqui jimmybx doncoquinr... https://t.co/0Jeyh53kCs	1431110147	596745328512077824	f	latinkitchennyc
FINALLY LOOKING ALOT LIKE SUMMER IN NYC!!!\nGOOD MORNING BRONX NY! !\nTODAY FRIDAY MAY 8TH \nHOURS:... https://t.co/oWK4xT0No6	1431095459	596683720498749440	f	latinkitchennyc
GOOD AFTERNOON BRONX NY! !\nTODAY THIRSDAY MAY 7TH\nWE ARE OPEN FOR  LUNCH & DINNER \nMI VIEJO SAN... https://t.co/BEwZjqOid7	1431017305	596355918406754304	f	latinkitchennyc
TODAY WEDNESDAY MAY 6TH\nGOODMORNING BRONX NY!!!\nWE ARE OPEN FOR LUNCH AND DINNER !! 12PM-9PM\nMI VIEJO... https://t.co/xR0S8kosHT	1430929456	595987451862196226	f	latinkitchennyc
Just posted a photo https://t.co/iUev0ID8Hf	1430875102	595759478198423552	f	latinkitchennyc
EVERYBODY WILL BE HERE THIS FRIDAY! !!\nRENES 40th BDAY BASH\nDON COQUI WHITEPLAINS! !!\ndoncoquiwp... https://t.co/2fzBcTWgr3	1430874012	595754903085174784	f	latinkitchennyc
TGIF!!! FRIDAY MAY 1ST 2015\nWE ARE OPEN FOR LUNCH & DINNER!!! 12pm-10pm\nGOODMORNING BRONX NY!\nMI... https://t.co/pUs4ujsKbQ	1430489146	594140660179021824	f	latinkitchennyc
Tonight the only place that matters to be in on a Thursday!!!\nCabo AFTERWORK Thursdays!!!\n3764... https://t.co/ldByPB0jAD	1430422836	593862533850750976	f	latinkitchennyc
THURSDAY APRIL 30TH\nGOODMORNING BRONX NY!\nWE ARE OPEN FOR LUNCH AND DINNER 12PM-9PM\n$8 LUNCH... https://t.co/83kCozuRnJ	1430408221	593801235637100545	f	latinkitchennyc
GOODMORNING BRONX NY!!\nTODAY WEDNESDAY APRIL 29TH\nWE ARE OPEN FOR LUNCH & DINNER\nMOM DID A GUAVA FLAN... https://t.co/2zfh0EBhgY	1430320790	593434523293065216	f	latinkitchennyc
THIS THURSDAY\nLADIES NIGHT\nCABO\n3764 E.TREMONT AVE \nBRONX NY \nLADIES DRINK FREE FROM 10PM-11PM\nLADY... https://t.co/KssveW1uXJ	1430290514	593307536981385216	f	latinkitchennyc
OPEN TILL 9PM\nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX NY 10465\n347-691-3100 https://t.co/pQN4pwjeWO	1430257706	593169930624868352	f	latinkitchennyc
GOODMORNING BRONX NY!!!\nTODAY TUESDAY APRIL 29TH\nWE ARE OPEN FOR LUNCH & DINNER!!\nMI VIEJO SAN... https://t.co/c3uKVUiV9w	1430226407	593038653481451520	f	latinkitchennyc
THIS THURSDAY \nLADIES NIGHT \n@cabobxnyc \nDJ LUCHO 7PM https://t.co/TmewNHpARG	1430197152	592915948564324352	f	latinkitchennyc
THE ONLY PARTY TO BE THIS AND EVERY THURSDAY!!!\nCABO THURSDAYS\nLADIES OPEN BAR\nFREE BOTTLE OF... https://t.co/3rmX8M0pLT	1430172504	592812566516264960	f	latinkitchennyc
THIS THURSDAY IS LADIES NIGHT!!\nLADY GROUPS OF 4 OR MORE RECIEVE A FREE BOTTLE OF CHAMPAGNE!!\n$ 5... https://t.co/8MTvwf6LGV	1430102274	592517999929720834	f	latinkitchennyc
MI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX NY 10465\nOPEN TILL 9PM\nJIBARITO TIME!!!! https://t.co/Ky4Qt9VgKa	1430082958	592436984267808768	f	latinkitchennyc
HELLO BRONX NY!!!\nWE ARE OPEN TODAY SUNDAY APRIL 26TH FOR LATE LUNCH & DINNER 3PM-9PM\nMI VIEJO SAN... https://t.co/pZu6hyDTuC	1430074023	592399506089586688	f	latinkitchennyc
EL TRIFONGO DE BISTEC \nDELICIOUS!!!\nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX NY... https://t.co/LXUZYFYPIj	1429980157	592005804875722752	f	latinkitchennyc
Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE SPIZY JAZZ preorder 9172929226 fidi	1431092893	596672958229323777	f	fritesnmeats
Hello Brooklyn, lunch 2day @ front & jay st. Burger of the week THE SPICY JAZZ.  Preorder 9172929226 dumbo @DUMBOFoodTrucks	1431006547	596310795769802752	f	fritesnmeats
@kdoherty74 	1430943086	596044622310350848	f	fritesnmeats
Lunch 2day @ Hudson & king. Burger of the week THE SPICY JAZZ. Preorder 9172929226 SOHO	1430920846	595951342490951680	f	fritesnmeats
Peeps, we are off the road today	1430837085	595600019467739136	f	fritesnmeats
Lunch 2day @ 50th st b/t 6th & 7th av. Burger of the week THE SPICY JAZZ preorder 9172929226 midtown	1430746272	595219124827086848	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE MEXICANA preorder 9172929226 fidi	1430486670	594130274654527488	f	fritesnmeats
Hello Brooklyn, Lunch 2day @ jay & front st. Burger of the week THE MEXICANA. Preorder 9172929226 dumbo @DUMBOFoodTrucks	1430401510	593773088766042113	f	fritesnmeats
Lunch 2day @ Hudson & king st. Burger of the week THE MEXICANA preorder 9172929226 soho	1430312100	593398072744509440	f	fritesnmeats
Lunch 2day @ 50th st b/t 6th & 7th av. Burger of the week THE MEXICANA preorder 9172929226 midtown	1430141965	592684478696415232	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE PLOUGHMAN preorder 9172929226 fidi	1429883103	591598732069724160	f	fritesnmeats
Hello Brooklyn, Lunch 2day @ front & jay st. Burger of the week THE PLOUGHMAN pre 9172929226 dumbo @DUMBOFoodTrucks	1429796256	591234466280013826	f	fritesnmeats
RT @glmh101: Another amazing burger of the week: 'The Ploughman' made wi... Foursquare Tip @fritesnmeats http://t.co/P7lDo2yVcV http://t....	1429742522	591009089620156416	f	fritesnmeats
Lunch 2day @ Hudson & king. Burger of the week THE PLOUGHMAN preorder 9172929226 soho	1429710572	590875083595460608	f	fritesnmeats
Lunch 2day @ 10 Hanover sq b/t water & pearl st. Burger of the week THE PLOUGHMAN preorder 9172929226 fidi	1429622786	590506883687063552	f	fritesnmeats
Peeps, we will be off the road today:(	1429536426	590144663283228674	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water & pearl ST. Burger of the week THE CHEVRE TRUFFLE BURGER. Preorder 9172929226 fidi	1429278996	589064921247264768	f	fritesnmeats
Hello Brooklyn, Lunch 2day @ front & jay st. Burger of the week THE CHEVRE TRUFFLE BURGER. Preorder 9172929226 dumbo @DUMBOFoodTrucks	1429192118	588700529737478144	f	fritesnmeats
Lunch 2day @ Hudson & king. Burger of the week THE CHEVRE TRUFFLE BURGER. Preorder 9172929226 soho	1429104742	588334046951911424	f	fritesnmeats
Lunch 2day @ 10 Hanover sq b/t water & pearl st. Burger of the week THE CHEVRE TRUFFLE BURGER preorder 9172929226 FiDi	1429019068	587974706659229696	f	fritesnmeats
TGIF @UrbanSpaceNYC @GarmentDstrctNY on Broadway btw 39 & 40th 11-9! eaturban refreshing bean sprouts! eatoutside http://t.co/uNfjQbOBzK	1431096491	596688050677227520	f	sweetchilinyc
Truck is on old slip & water 1130-2. Also find us @UrbanSpaceNYC @GarmentDstrctNY midtown broadway btw 39 & 40th till 9! eatoutside	1431011099	596329887918661632	f	sweetchilinyc
Truck is on old slip & water 1130-2 today! Check us out on Broadway btw 39 & 40th @UrbanSpaceNYC @GarmentDstrctNY eatoutside eaturban	1431010125	596325804029665281	f	sweetchilinyc
RT @LJohnson23: Just picked up some tasty @SweetChiliNYC from @UrbanSpaceNYC @GarmentDstrctNY.. Love this great pop-up food spot! http://t....	1430940627	596034309653401600	f	sweetchilinyc
Happy HumpDay we are on Broadway & Houston 1130-3 and broadway btw 39 & 40th till 9pm @UrbanSpaceNYC @GarmentDstrctNY midtown	1430924720	595967588263469057	f	sweetchilinyc
Truck @dumbolot jay & water 1130-3! and find us @UrbanSpaceNYC @GarmentDstrctNY serving 11-9 on Broadway btw 39 & 40th! lunchtime hungry	1430835763	595594478234279936	f	sweetchilinyc
Let's do this @UrbanSpaceNYC @GarmentDstrctNY midtown all day till 9pm! lunchtime excited feedme eatoutside broadway btw 39 & 40th!	1430753557	595249679731924992	f	sweetchilinyc
No truck until tuesday. Gearing up for @UrbanSpaceNYC @GarmentDstrctNY midtown starts monday!!	1430493923	594160697438777344	f	sweetchilinyc
It's a beautiful day in NYC on old slip & water! join us for lunch 1130-3 today! lunchtime hungry topchef	1430404584	593785982736019457	f	sweetchilinyc
It's humpday and we are on Broadway btw Houston & Bleeker 1130-3! porkbelly friedegg   =  hungry delicious	1430318632	593425470064041985	f	sweetchilinyc
Hey dumbo we are on jay & water 1130-3 @dumbolot with free cake pops to anyone who takes a selfie of them in line! sweetchilinyc	1430232021	593062200056610818	f	sweetchilinyc
RT @mothercheffer: Fellow @bravotopchef @ChefLisaNYC @SweetChiliNYC @EastWoodsSchool Spring Fair May 16th & 17th! Oyster Bay-can't wait.  ...	1430185901	592868757606952964	f	sweetchilinyc
@feistyfoodie it's not actually. But still delicious.  I'll send you a photo.	1430149327	592715356361367553	f	sweetchilinyc
RT @EastWoodsSchool: Where will the great NYC foods trucks b 5/16-17?@eastwoodsschool...@coolhaus,@ToumNYC,@waffletruck,@UncleGussys, @Chef...	1430145022	592697300222357505	f	sweetchilinyc
HappyMonday we are on old slip & water 1130-3 today! Tweet a pic of you eating our food and you could win a free lunch!  lunchtime Hungry	1430142272	592685762858090496	f	sweetchilinyc
RT @DerrickPrince: Rocking out with the @SweetChiliNYC team! They rocked it all fear! So good. bacon BandBClassic http://t.co/TFa8R79iwn	1430060424	592342471033520128	f	sweetchilinyc
Thanks bandbclassic we had a great time with you all day! porkgasm https://t.co/ODwn6fU0A7	1430015849	592155509190438912	f	sweetchilinyc
RT @HeavyMetalTeddy: @DerrickPrince @BandBClassic @chef_plum @SweetChiliNYC @SkeeterNYC @RevCiancio @HerbatKarlitz great 1st session BandB...	1429990571	592049485582327808	f	sweetchilinyc
RT @Anyastasya: @SweetChiliNYC - Best of the fest! Porkgasm	1429987511	592036650374561792	f	sweetchilinyc
RT @mrjasongrad: porkgasm at the bacon and beer classic w @SweetChiliNYC @CitiField	1429983537	592019981493260288	f	sweetchilinyc
RT @alwaysaterrier: Was going to get Chipotle for lunch, but then @schnitznthings happened. http://t.co/3C847nWJQM	1431112351	596754572175155200	f	schnitznthings
The schnitzel cart is on Charlton & Varick.  Happy Friday.	1431100717	596705772643418112	f	schnitznthings
The Schnitzel Cart is on 27th & Park.	1430928680	595984198835576832	f	schnitznthings
@rshawnmitchell 27th & Park today	1430928634	595984004039467009	f	schnitznthings
@kristeen05 yes	1430928608	595983897474772993	f	schnitznthings
@rshawnmitchell thanks for the love. Where did you get your lunch, The cart or truck?   We got you next time!!	1430868605	595732227218153472	f	schnitznthings
The Schnitzel truck will be on 52nd & 6th.	1430841092	595616826043805696	f	schnitznthings
Hey guys, the cart will be on Park & Greenwich today.	1430839582	595610496776216576	f	schnitznthings
The Schnitzel Cart will be on Charlton & Varick today for lunch. :-)	1430752063	595243411654991873	f	schnitznthings
Hey guys, Happy Friday We will be on 51st Park to Madison. It's Schnitzel for lunch.	1430492223	594153564001456128	f	schnitznthings
The Schnitzel Truck will be on 26th st. West side to 11th ave.	1430406002	593791927553757184	f	schnitznthings
@alexrb1 love our Schnitzlers.   Did you have your schnitzel today ?	1430365001	593619959252721664	f	schnitznthings
@alexrb1 we post daily our locations.  Yes we were on 47th & Park.	1430332672	593484361003048961	f	schnitznthings
The truck will be on 47th & Park.  Schnitzel time.	1430322671	593442411277373440	f	schnitznthings
The Schnitzel Cart will be on 27th & Park	1430320283	593432395937873921	f	schnitznthings
@TheRealYorkMidi @ericblaine Sorry guys you cldnt find us. We served lunch at 52nd 6&7 Just as posted.Were about done with lunch service.	1430245636	593119303483797504	f	schnitznthings
@ericblaine Did you see the post on our locations today?	1430235585	593077148405104640	f	schnitznthings
@ericblaine . We're here now!!!	1430235508	593076826664267776	f	schnitznthings
Oh yeah. The Schnitzel TRUCK will be on 52nd & 6th for lunch. Get ready for some Schnitzzzzz!!!	1430235002	593074701586604032	f	schnitznthings
It's a great day for some Schnitzel.  Lunch time on Greenwich & Park. The Schnitzel CART.	1430234549	593072801025785856	f	schnitznthings
Win a Korilla Dinner! Follow us on IG + share your pic in our KorillaFan PhotoContest! https://t.co/ml8gzz064A http://t.co/SJGT23IiOq	1431122262	596796139418087424	f	korillabbq
RT @sosuperlative: @ShanghaiMKS @VoiceStreet We loved them all but especially @DomoTaco, @TheTreatsTruck, @SnowdayTruck, and @KorillaBBQ!!	1431121792	596794168619507712	f	korillabbq
Off the streets till 3pm today catch us at Washington Mews (7-8th St btwn 5th ave-University Pl)	1431102165	596711848537391105	f	korillabbq
RT @megjoneswall: such colorful food at korilla! loving these gorgeous noodle bowls noodles eastvillage yum @... https://t.co/XuzFTRY5tM	1431044427	596469678081441793	f	korillabbq
RT @chefnewskr: Korilla BBQ Eddie Song \n    http://t.co/CREEpfEnbc	1431044401	596469567599341568	f	korillabbq
RT @TheLiteraryMews: TMRW: 12-5PM: Foodies assemble! The Wash. Mews will be hosting 3 food trucks (DUB Pies, Korilla BBQ, Mausam Curry N'Bi...	1431044317	596469214040457217	f	korillabbq
Now serving Metrotech Bridge & Myrtle! One block from the usual	1431016161	596351122731827200	f	korillabbq
RT @mynameisSophia_: food so good you have to post on every social media outlet @KorillaBBQ @SpotDessertBar http://t.co/w00qUVCllI	1431014899	596345829088165888	f	korillabbq
RT @cheezplease: This was pretty darn amazing as well - Spicy Ribeye Tacos from @korillabbq choicestreets https://t.co/hPiLYbk0lQ	1431014886	596345774641909761	f	korillabbq
Making Korean BBQ dreams come true one bowl at a time... FoodTruckDreams. @villagevoice NYC BestFoodTruck 2014 http://t.co/IVkIePOuMX	1431014625	596344679488221184	f	korillabbq
Done for the night!	1430958301	596108438591115265	f	korillabbq
Done in FiDi! Headed uptown to CU @116th & Amsterdam. Dinner starting at 5pm	1430935637	596013379963199488	f	korillabbq
It's for our first brick and mortar on St. Mark's / 3rd Ave. Come join us!  https://t.co/KJw7lqJAQR	1430925765	595971973458563073	f	korillabbq
FiDi! Front & Old Slip ready by 12!	1430925762	595971959877443584	f	korillabbq
Hi Friends! It's the last day to write about us in the Zagat Survey!  http://t.co/jq5QzVFkQl. Your feedback is appreciated! Thanks!	1430924495	595966643827781633	f	korillabbq
Thanks for the cool shout-out @Localbozo!  @villagevoice @VoiceStreet	1430922220	595957104407670784	f	korillabbq
RT @Localbozo: Did you hit up ChoiceStreets last night? Highlights are up nice and early: http://t.co/cakuAuBaW0 @villagevoice @VoiceStree...	1430922176	595956917652037633	f	korillabbq
RT @BigAppleNosh: korilla @korillabbq bulgogi tacos - one of the best things I ate last night! http://t.co/rWG1g9i695	1430922068	595956465971650561	f	korillabbq
RT @_YokoUchida: @ChoiceEats - top 2 grilled cheese and fusion tacos! http://t.co/hC5TARryEm	1430887621	595811983699640320	f	korillabbq
The Killa Korilla Krew working hard to  make KoreanTaco dreams come true at @villagevoice ChoiceStreets! http://t.co/wHKtwOWZlL	1430881379	595785805597175809	f	korillabbq
We've got Wafels at Bryant Park now. Just look at that view! While you're at it, look at that park! dinges http://t.co/cAvuFV8zIz	1431119693	596785364867686402	f	waffletruck
For one free dinges, about how many gallons of Nutella would it take to fill the grand canyon? dingesforeveryone http://t.co/1uvsBMGcOB	1431102067	596711434890846209	f	waffletruck
@_HollywoodPapi God is good all the time! Come on by, we're open til 10pm daily	1431101340	596708386277724160	f	waffletruck
@LedoTM our daily locations post has been posted now.	1431100865	596706396470583296	f	waffletruck
@clausjnsn We never really stop going to locations. We rotate them in efforts to cover the city.	1431100813	596706178542895104	f	waffletruck
@_HollywoodPapi Everyday. It's one our of new stationary locations.	1431100727	596705816884817921	f	waffletruck
De CARTS 2/2:\nKotmadam @ 24th & 5th Ave til 9pm\nBierbeek @ De Great Lawn, Central Park til 7pm	1431098225	596695323013091329	f	waffletruck
De CARTS 1/2:\nGoesting @ 66th & Broadway til 10pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm\nVedette @ 60th & 5th Ave (Manhattan) til 7pm	1431098201	596695223125745665	f	waffletruck
De TRUCK:\nKastaar @ The Horace Mann School til 4pm	1431098188	596695164791336960	f	waffletruck
De Day before De Weekend!\n\nLe Cafe @ 15 Ave B & 2nd St til 10pm\nWafel Cabana @ 35th & Broadway til 10pm\nWafel Kiosk @ W42nd & 6th til 10pm	1431098173	596695104577937408	f	waffletruck
RT @drewfranklin1: Where are you going @waffletruck van and can I please have a Liege ? @ Major Deegan Expwy https://t.co/YekraiD5ba	1431093396	596675067037224962	f	waffletruck
Hot n Fresh wafel & coffee for only $5! Insure a great day start w/De Breakfast Special! Available til 11am dinges http://t.co/EpGNqaMyS7	1431093223	596674343805001729	f	waffletruck
RT @lovekarinamunoz: Yesterday's @waffletruck dinges latergram latte @ Wafels & Dinges Bryant Park https://t.co/etVhOZ5z5G	1431023283	596380992232935424	f	waffletruck
Have you indulged in this weeks Wafel crush? De S'mores wafel is topped w/spekuloos spread, toasted... https://t.co/RfCcMLyuPU	1431021737	596374506253484032	f	waffletruck
Keep an eye out for us on the @FoodNetwork Latin America! dingesforeveryone @leelaurie22 http://t.co/uje9Pqoxuc	1431017699	596357571788832768	f	waffletruck
Hey @Curvily unfortunately we aren't slated for LIC this week	1431016512	596352592634085376	f	waffletruck
Fooor ooone freee diiinges...order your Wafel as if you're meditating dingesforeveryone	1431016274	596351594721103872	f	waffletruck
Thank you, lots of hard work & dedication has gone into the design of our first Cafe! We hope you enjoyed your visit https://t.co/RwnZxDxHZN	1431014015	596342118177603584	f	waffletruck
De CARTS 2/2:\nKotmadam @ 24th & 5th Ave til 9pm\nBierbeek @ De Great Lawn, Central Park til 7pm	1431012558	596336006875381760	f	waffletruck
De CARTS 1/2:\nGoesting @ 66th & Broadway til 10pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm\nVedette @ 60th & 5th Ave (Manhattan) til 7pm	1431012534	596335909542371328	f	waffletruck
It might be the last chance to watch @NYRangers at the Pound while enjoying $3 Beer and $5 cocktails. ComeToRedHook http://t.co/OFPyShZeAX	1431124267	596804551354753024	f	lobstertruckny
If you're not rooting for @NYRangers, you are rooting against $3 Beers and $5 Cocktails at RedHooklobster. Hockey at the Pound tonight	1431115311	596766985825943552	f	lobstertruckny
BigRed is on 46th & 6th ready to make your Friday!	1431100253	596703828474462208	f	lobstertruckny
If it feels like sumer, it should taste like summer! BigRed is on 46th & 6th making it happen!	1431097355	596691674463600640	f	lobstertruckny
It feels like summer so eat like it's summer, BigRed is on 46th & 6th today!	1431094000	596677601772642304	f	lobstertruckny
Maine Lobster + Buttery Roll = Heaven. Claim Nirvana at Hudson & King from BigRed & RedHookLobster	1431016838	596353958232367104	f	lobstertruckny
Of all the failures you had in life, do you really want to regret not getting RedHookLobster for lunch at Hudson & King? NoRegrets	1431013843	596341399429226497	f	lobstertruckny
BigRed is on the corner of Hudson & King, exactly where you should be for lunch.	1431012001	596333673496064001	f	lobstertruckny
Cheap booze, $25 Lobster Dinners and @NYRangers on the tv at RedHookLobster! http://t.co/68GRSARZdg	1430953242	596087220223791104	f	lobstertruckny
RedHookLobster roots for the @NYRangers w/ $3 Beers and $ 5 Cocktails! http://t.co/wjymW2NYsB	1430948432	596067044396765184	f	lobstertruckny
Your lobster lunch is on 53rd & Park.	1430926298	595974210041880577	f	lobstertruckny
Sunshine can be found on 53rd & Park inside a toasted lobster roll from BigRed	1430922718	595959193858928640	f	lobstertruckny
We do this in Red Hook every wednesday because this the only way we can express our feelings.... https://t.co/65AM5uAK4K	1430837349	595601130094206976	f	lobstertruckny
BigRed is on this corner in Red Hook today waiting to get her inspection so she will not be on the streets vending. http://t.co/7KoEcMb4BY	1430833545	595585172378132480	f	lobstertruckny
BigRed is on this corner in Red Hook... Getting inspection today and will not be vending. https://t.co/bTkeGebeda	1430831357	595575998365708288	f	lobstertruckny
RedHookLobster is at 5th & 25th until 9:00 with your solution to Manic Monday http://t.co/QV1g0WdjyO	1430757941	595268068781195264	f	lobstertruckny
The RedHookLobster opens at the Garment District at 40th & Broadway w/ Lobster & Libations! http://t.co/kcUStiPs6d http://t.co/diSz9ieHLF	1430747144	595222779768766464	f	lobstertruckny
It's summer so the Pound is hiring.  Email Caleb@redhooklobster.com to begin the glamorous life! http://t.co/hiQeLkT5xq	1430745640	595216475046162432	f	lobstertruckny
BigRed is at the Grand Army Plaza for the Food Truck Rally today and it's also George's B-day! http://t.co/EXJKSGFrNI	1430675132	594920741600174083	f	lobstertruckny
When you visit BigRed at the Prospect Park Food Truck Rally, make sure to say Happy Birthday to George! http://t.co/qvzDt90Yp2	1430661722	594864493856948224	f	lobstertruckny
@invinceabella come check us out at smorgasburg - just doing sugar on snow but truck is booked for private events this weekend	1431123811	596802638341083136	f	snowdaytruck
Our buds @SweetChiliNYC killing it at @villagevoice @ChoiceEats - mad maple love http://t.co/Oy3h4J2mJ3	1431102763	596714353807745024	f	snowdaytruck
Meeting the new team members tonight! 10 new participants for the @DriveChangeNYC family. Wow!!! This is what it is all about	1431102665	596713945513201664	f	snowdaytruck
@NailahShotCha do it do it do it	1431016600	596352963351838720	f	snowdaytruck
@Matt_Berman22 14th and 5th Ave join us!	1431016593	596352932305629184	f	snowdaytruck
Back in front of @TheNewSchool 14th and 5th and staying put!! Student discounts and awesome food!!	1431016343	596351885197606912	f	snowdaytruck
Side street love!! 13th street between 5th and 6th! Come. Eat. Connect!!	1431013871	596341514705436675	f	snowdaytruck
We're coming for you Manhattan! Service @TheNewSchool 14th and 5th - @USHGNYC @NYCGreenmarkets	1431005599	596306818613280768	f	snowdaytruck
@TheNewSchool are you hungry for justice!!! We are. Eat lunch with us today - students with ID get 1$ off their meal!	1431004748	596303250728574976	f	snowdaytruck
RT @BigAppleNosh: My faaaaavorite dish of the evening, from @snowdaytruck - maple grilled cheese with sharp cheddar, Shewolf Bakery s... http...	1430964234	596133321509359617	f	snowdaytruck
READY. SET. CATER - excited to work with @DonorsChoose tonight!	1430943934	596048180476846081	f	snowdaytruck
Yo yo yo @dumbolot get ready for mad maple love - spring menu with smoked rib sliders and farrow salad coming your way!! Beep beep	1430923962	595964411338223616	f	snowdaytruck
RT @mmmm_foood: @SnowdayTruck is my fave tonight ChoiceStreets @ChoiceEats \nYour maple grilledcheese is todiefor  http://t.co/swNcXYyTlD	1430917950	595939194041667584	f	snowdaytruck
RT @sosuperlative: @vonatron @SnowdayTruck @villagevoice @ChoiceStreets So great that @DriveChangeNYC is making a difference! A delicious d...	1430917942	595939160969629696	f	snowdaytruck
Game time @ChoiceEats @VoiceStreet http://t.co/m38y28oqHY	1430869406	595735585987362816	f	snowdaytruck
RT @ajplus: No justice, no peace.\n\nAJ+ is spending the month of May exploring how our policies and laws impact society:\nhttps://t.co/tKEIJw...	1430835110	595591736522575872	f	snowdaytruck
WHO IS READY FOR @ChoiceEats @villagevoice ???- FOOD TRUCK FANATICS UNITE!!	1430775337	595341030058270720	f	snowdaytruck
Tomorrow we compEAT!! @ChoiceEats -get your grub on!!	1430743559	595207744644390912	f	snowdaytruck
RT @Upworthy: A high school teacher quit her job to run a food truck. But this isn't an ordinary one. http://t.co/imDCeCyzPv http://t.co/Mj...	1430704055	595042054016761856	f	snowdaytruck
@binghott glad you liked it!!	1430695887	595007796149624832	f	snowdaytruck
RT @IntrepidMuseum: Thanks to @Livefastgroup, we have some awesome food trucks on our pier today:@USAFoodTruck @LaBellaTorte @PapayaKingTru...	1431098739	596697477807484928	f	papayakingtruck
RT @livefastgroup: In collaboration with @IntrepidMuseum we are bringing in the best food trucks in NYC.Today10-5 @USAFoodTruck @LaBellaTor...	1431089958	596660646646829058	f	papayakingtruck
1 cart in Metrotech & 1 cart at the @IntrepidMuseum beautiful day to eat at a foodtruck	1431018099	596359251242651648	f	papayakingtruck
@CunningInformer Metrotech and at the Intrepid	1431018052	596359050851393537	f	papayakingtruck
We are serving in Brooklyn today for FoodTruckThursdays with @DowntownBklyn Serving at 11am - 3pm! http://t.co/bbH6EfKkT6	1431011144	596330076024737792	f	papayakingtruck
RT @Papaya_King: While enjoying CincoDeMayo today, make sure you fill up on Hot Dogs in between margaritas http://t.co/z1jXQKL3Ir	1430847873	595645268068081664	f	papayakingtruck
RT @Stephluva2711: @PapayaKingTruck hot dog w/hula hula and coleslaw.  delicious http://t.co/Txp6h10B5X	1430847858	595645208823504896	f	papayakingtruck
Yum!! https://t.co/ADNtO8jJHd	1430696502	595010373759172608	f	papayakingtruck
Join us tomorrow at Grand Army Plaza @DispatchNY	1430606765	594633989765275648	f	papayakingtruck
RT @pacificparkbk: Anyone in @Downtownbrooklyn? There are some great food trucks at Metrotech @morristruck @korillaBBQ @papayakingtruck @w...	1430414414	593827211481845760	f	papayakingtruck
Who is hungry? We are in @DowntownBklyn for FoodTruckThursday	1430409058	593804747490070529	f	papayakingtruck
Truck is at 51st btwn mad and park \nCart 1- union square east and 17th\nCart 2- 55 and Broadway	1430324009	593448022723436546	f	papayakingtruck
Parked on 51st St between Park Ave and Madison Ave ComeHungry open at 11am	1430231522	593060105962299392	f	papayakingtruck
.@culleysnz will be w us on the food truck tmrw location posted in the AM http://t.co/P1sn4kCAMO @nychotsauceexpo NYCHSE NYCHOTSAUCEEXPO	1430182378	592853979840827392	f	papayakingtruck
FoodTruckThursdays is only 3 days away... Who are we going to see in Metrotech? @DowntownBklyn http://t.co/K3IWA9g08i	1430181879	592851887642271745	f	papayakingtruck
@Romandoingwork Truck is on 5th Ave & 23rd St\nCart is on 16th St & Union Square East	1430145524	592699406438289408	f	papayakingtruck
Truck is on 5th Ave & 23rd St\nCart is on 16th St & Union Square East foodtruck	1430145411	592698931798220800	f	papayakingtruck
Serving at Grand Army Plaza with these guys  https://t.co/ViZPbQuSqe	1430061400	592346563906818048	f	papayakingtruck
We are parked at @TheSeaport for the @SeaportMuseum Opening Day Party Pier16 http://t.co/ZtVQlXKaYD	1429984870	592025573104422914	f	papayakingtruck
Join us on the truck and Saint Marks Pl this Tuesday for a tasting with @culleysnz http://t.co/bOw1LeMru1 HotSauce	1429983250	592018776218050560	f	papayakingtruck
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
RT @shahofthewest: I u @shortysnyc	1431083305	596632742718283776	f	shortysnyc
RT @ShortysTrivia: Tonight's winners!!! @shortysnyc 1stAve @PheebKingslayer @JJustine http://t.co/0NazwQgrfS	1430993721	596256999660199937	f	shortysnyc
RT @RegularGuyNYC: Philly Cheesesteaks & Craft Beer in NYC? Oh yes,at Shorty's! http://t.co/WGwXsgSEGi ShortysUpperEast sandwich NYC be...	1430929119	595986038998310912	f	shortysnyc
RT @ShortysTrivia: @shortysnyc 1st Ave Regulars PackageExperts with their first career WIN!!!!!!! Congrats ladies!! noguysnoproblem http:...	1430913142	595919028423655426	f	shortysnyc
RT @ShortysTrivia: @JamieKleinberg @JillianSed @not_a_tabby @amandaseybold @sweet_mustache @ScottHansen04 $4 corona light on tap and we got...	1430868425	595731470758629377	f	shortysnyc
ShortysNyc CincoDeMayo TequilaTuesday http://t.co/JBzHISuGRT	1430839826	595611518269530112	f	shortysnyc
RT @RegularGuyNYC: Thanks to everyone at @shortysnyc for hosting us on our Yelp UYE bar event on the UES! Great beer, food, fun. You rock!...	1430690750	594986249120829441	f	shortysnyc
RT @JJustine: @BradCooper28 @shortysnyc Philly Eagles GetItShorty GetPhillyWitIt http://t.co/oba1bCTefc	1430669607	594897566162100224	f	shortysnyc
MayPac Eagles Shortysnyc http://t.co/qFfGJkrwkl	1430624758	594709458808393728	f	shortysnyc
@krazekat no more truck. we're focused on opening more locations. hoboken is on our list.  we'll make it happen.	1430507706	594218506918469632	f	shortysnyc
RT @jan_dembowski: Philly cheesesteak noms. (at @ShortysNyc in New York, NY) https://t.co/31zmlTby6H	1430507485	594217576940457985	f	shortysnyc
RT @CR4V3: Treat yo self (at @ShortysNyc in New York, NY) https://t.co/ayvy1fQJGc	1430507476	594217541993660417	f	shortysnyc
FlyEaglesFly @shortysnyc http://t.co/FYjAsqXAy6	1430444414	593953041834856448	f	shortysnyc
RT @JesseBJacobs: @shortysnyc eating a board street bully and legitimately sweating. But it's too delicious to stop. NoPainNoGain damn you...	1430422908	593862837157687296	f	shortysnyc
RT @Ed_Estrada_: What-A-Beauty! @shortysnyc MyLunch WithWiz http://t.co/TZ8odAKETG	1430422886	593862746799759362	f	shortysnyc
RT @GoodHospMktg: besthappyhour We got $4 Guiness $6 Don Julio margaritas and $4 Chilli Cheese Fries @shortysnyc  shamelessplug osharpton	1430333009	593485774546407425	f	shortysnyc
RT @ShortysTrivia: First 2 teams into the tourney! MyLittleDick Traumatics @shortysnyc @sixpoint @JamieKleinberg @itsme_norris http://t.c...	1430305743	593371411500109824	f	shortysnyc
TONIGHT is your first chance to qualify for the Sixpoint Trivia Invitational Championship-- @ ShortysFiDi . 62... http://t.co/XCZExcP0fc	1430262049	593188145837015041	f	shortysnyc
RT @GoGoGadge7: Wow! - Drinking a Stone Smoked Porter w/ Vanilla Bean by @StoneBrewingCo at @shortysnyc   http://t.co/w4rHRyk4Vs	1430258929	593175060296421376	f	shortysnyc
RT @RegularGuyNYC: Philly Cheesesteaks & Craft Beer in NYC? Oh yes,at Shorty's! http://t.co/WGwXsgSEGi ShortysUpperEast sandwich NYC be...	1430247477	593127025168244736	f	shortysnyc
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
The wait is over! Bian Dang back on 53rd & Park this Monday :)	1431130774	596831840951881728	f	biandangnyc
Bian Dang is expected to be back out on the streets on 5/11! Sorry for the wait! Its out of our control... we miss yall so much!	1430407409	593797830138994688	f	biandangnyc
We miss you all! Hopefully we can get our truck out again soon!	1428523228	585895001575432192	f	biandangnyc
the Bian Dang truck is still getting some tender loving care. Please standby till our triumphant return.	1427298570	580758412004331520	f	biandangnyc
Newest addition! Domo Taco http://t.co/kaTFD2Hb5z	1427248299	580547562089947137	f	biandangnyc
foodoftaiwan ---getting ready for the rush. http://t.co/7JIKgU6Umj	1427244178	580530276142546944	f	biandangnyc
Happy Friday! Truck is still under maintenance, please stay tuned for updates!	1426860162	578919599011454976	f	biandangnyc
Sorry off the streets due to tuck issues, stay tuned for updates!	1426605824	577852824639393792	f	biandangnyc
Getting ready on 53rd & Park!	1426516024	577476179583598593	f	biandangnyc
Film shoot in our regular spot today. Catch us up 53rd between Park & Madison!	1426254558	576379509429043200	f	biandangnyc
On our way to 53rd & Park!	1426168915	576020299306553344	f	biandangnyc
I'd be sad it's humpday except it's BEAUTIFUL out! Make it even better with a biandang on 53rd & Park!	1426085355	575669822647877632	f	biandangnyc
Another beautiful day on 53rd & Park!	1425996850	575298604878856193	f	biandangnyc
First (unofficial) day of spring! Celebrate with some porkbuns on 53rd & Park!	1425909909	574933948792446977	f	biandangnyc
Happy Friday! We're back on 53rd & Park today!	1425653699	573859326881701888	f	biandangnyc
Baby its cooold outside! And also unsafe to drive:( come by to 53rd & Park tomorrow for your bian dang!	1425569465	573506021257166849	f	biandangnyc
53rd & Park for the humpday cure!	1425483847	573146913907716096	f	biandangnyc
Get your porkchop and taiwanesefriedchicken on 53rd and Park today!	1425394723	572773100699312129	f	biandangnyc
Happy Monday back on 53rd & Park	1425308561	572411711615082496	f	biandangnyc
Hola Amigos! tacos tortas flautas guacamole @MexicoBlvd Midtown 46th St (6&7) Happy weekend!	1431097596	596692684133289984	f	mexicoblvd
http://t.co/BU6K8acCxy	1431092445	596671078459678720	f	mexicoblvd
http://t.co/HXkUYpActl	1431011516	596331637534695424	f	mexicoblvd
Feliz Jueves! Sabores de Mexico @MexicoBlvd @dumbolot Water&Jay	1431009489	596323135814639616	f	mexicoblvd
RT @dumbolot: We got @ToumNYC @MexicoBlvd and @mausamnyc today!	1431009373	596322651636793344	f	mexicoblvd
Good morning Midtown! fiestataco 51st St & Park	1430926431	595974767410356224	f	mexicoblvd
No more 5 de Mayo... Fiesta forever @MexicoBlvd	1430918714	595942399731347456	f	mexicoblvd
Hola! TacoTuesday & 5 de Mayo @MexicoBlvd 46th St. (6&7) \nA celebrar!	1430836921	595599334613200896	f	mexicoblvd
http://t.co/e07g2Et4bT	1430836783	595598756092882944	f	mexicoblvd
CNN: Why do we celebrate Cinco de Mayo? http://t.co/n55iXwURGM	1430779387	595358017396338691	f	mexicoblvd
RT @yodish_app: At @MexicoBlvd, flavors are sharp and defined http://t.co/2YNKQ8xMmf via @CBSNewYork vegetarian NYC http://t.co/BAwmRRb6ID	1430755066	595256007510470657	f	mexicoblvd
Hola Amigos de Dumbo! tacos tortas flautas @MexicoBlvd @dumbolot Water&Jay	1430751025	595239059678572545	f	mexicoblvd
RT @kathrynlurie: Busy spreading the gospel that is @MexicoBlvd to colleagues @barbarachai @themikeayers @sarahjsquire besttacos crispych...	1430536401	594338860596928512	f	mexicoblvd
Feliz viernes! @MexicoBlvd tacolove 46th St (6&7)	1430490261	594145334143557633	f	mexicoblvd
Buen y feliz dia! @MexicoBlvd @dumbolot muymexicano Water&Jay	1430405130	593788271575965696	f	mexicoblvd
RT @dumbolot: Happy Thursday with @ToumNYC @MexicoBlvd and @mausamnyc!	1430404984	593787658075185152	f	mexicoblvd
Taco Tuesday @MexicoBlvd Have a fantastic day! 46th St (6&7)	1430233175	593067039205371906	f	mexicoblvd
Hello Dumbo! @MexicoBlvd @dumbolot tacos tortas flautas Water & Jay	1430147174	592706324913336321	f	mexicoblvd
Rocking out with @justWinkCards by @amgreetings ItsTacoTime http://t.co/OomimuQNUo	1429998713	592083634389147648	f	mexicoblvd
Come grab a FREE taco today courtesy of @amgreetings new app @justWinkCards! 14th St & 9th Ave til 7pm ItsTacoTime	1429975021	591984261256880128	f	mexicoblvd
Thank you Brooklyn. Have a great weekend!	1431121430	596792651225178112	f	mamuthainoodle
RT @VendorPower: One year ago, we kicked off our campaign for more permits. Here's the highlight vid https://t.co/gc5X41QUPP @foodchainwork...	1429908716	591706161579053056	f	mamuthainoodle
Hellooo Dumbo! We're back for your noodle needs! Come by for your Thai noodle lunch! @dumbolot @DUMBOFoodTrucks it's the freakin' weeken'	1429892104	591636482366038016	f	mamuthainoodle
ATTN: Mamu Thai is hiring! Truck or restaurant. FT/PT. Please write mamuthaicatering@gmail.com	1429821781	591341527521218560	f	mamuthainoodle
RT @QueensEatsIG: Check out all the amazing things we ate and did on our whatakeover!!!\nRG weheartastoria: To end this... https://t.co/GBV76...	1429413597	589629480165109760	f	mamuthainoodle
Thank you @Etsy for having us at your party!! Congrats on the big news! smallbiz to whoa nyc Brooklyn	1429312587	589205814168129536	f	mamuthainoodle
It's Friday! Dumbo, we are here for you @dumbolot! Come by for the freshest Thai noodle in town! @DUMBOFoodTrucks	1429286646	589097007794495488	f	mamuthainoodle
UPDATE: Sorry folks, We will be CLOSED for a special event tonight. We will be open for dinner tomorrow at 6pm	1429222086	588826223700246528	f	mamuthainoodle
At Mamu QNS Today: We will be CLOSED from 3:00pm to 5:30pm, No Deliveries tonight, PICKUP ONLY. Friday :CLOSED for lunch, open @ 6pm webusy	1429212100	588784339607019521	f	mamuthainoodle
TGID! Thank god it's Dumbo! Come by for your Thai noodle fix! @DUMBOFoodTrucks	1428682881	586564636826329088	f	mamuthainoodle
@crimsoncor not really. We haven't ruled it out this season like we have in the past. It's just so over crowded with trucks. We'll let u kno	1428667492	586500090476519424	f	mamuthainoodle
. @QueensEatsIG @fuelgrannie @MamuThai Thanks so much for stopping by! So happy that you liked our food! queens Astoria lic queenseats	1428629906	586342439805444099	f	mamuthainoodle
RT @QueensEatsIG: @MamuThai so much thanks for the amazing meal	1428629781	586341918898057216	f	mamuthainoodle
. @AstoriaCoffeeNY @radashlee @TacubaNYC @YelpQueens @MexicoBlvd  https://t.co/3iUPACgVGT	1428509941	585839271371747328	f	mamuthainoodle
RT @MamuThai: Late tweet: Truck is @dumbolot ! Jay&water st. Come by for noodle! Green Curry noodle special today.	1428423262	585475716034207744	f	mamuthainoodle
It's Friday and that is good enough for us! Dumbo come by & get your noodle fill! @dumbolot @DUMBOFoodTrucks	1428077281	584024565174665217	f	mamuthainoodle
. @lulovestweets thanks for the compliment! @MamuThai we cook w/love&fresh ingredients! Noodles fresh daily & currypuffs by hand! hardlabor	1427659308	582271457381736448	f	mamuthainoodle
Late tweet: we are @dumbolot come by for your noodle fix! @DUMBOFoodTrucks	1427475297	581499659832680448	f	mamuthainoodle
We've been nominated for Best Thai in Astoria! Please vote for using this link: http://t.co/8NCHIcrDAi it would mean so much! Thank you!	1427312316	580816067850829824	f	mamuthainoodle
ATTN: if you love our truck, please send love to our restaurant! Vote for us for Best Thai in Astoria http://t.co/8NCHIcrDAi thank you!	1427222099	580437671115399170	f	mamuthainoodle
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
!!! Thurs, May 7th 3:45-7pm Bway (86th & 87th)!!!	1431027655	596399330543665152	f	thetreatstruck
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
Located on Hudson and King	1427125110	580030869294960640	f	thepocketful
We r on 50th between 6th&7th	1426778682	578577843493429249	f	thepocketful
Truck open at 55th street and Broadway. Come!!!	1431083215	596632366443036673	f	carpedonutnyc
Truck open. 23rd street and park avenue south. come!!!	1430911307	595911332886683648	f	carpedonutnyc
Truck open at 51st street and park avenue. Come!!!	1430735733	595174921547964416	f	carpedonutnyc
Truck Food truck rally. Grand army plaza. Prospect park. Come!!!!	1430664096	594874452413919232	f	carpedonutnyc
Come enjoy a donut with us on this beautiful spring day! Open at Bergen and Court - fresh donuts and refreshing beverages await!	1430567478	594469209087807488	f	carpedonutnyc
Open @ 55th and Broadway now!	1430480371	594103853215305728	f	carpedonutnyc
Truck @ 51st street and Park ave. come!!!	1430391946	593732972144132097	f	carpedonutnyc
Truck open at 23rd street and park avenue south. Come!!!!	1430306044	593372675927576576	f	carpedonutnyc
Truck open at 51st street and park. Come!!'	1430132671	592645496889548801	f	carpedonutnyc
Truck at the food truck rally, Grand Army Plaza Prospect Park Brooklyn. Come!!!	1430056683	592326777520926721	f	carpedonutnyc
Truck open at 55th street and Broadway. come!!!!	1429872423	591553935749607425	f	carpedonutnyc
Truck open at 51st street and park avenue. Come!!!	1429787070	591195938762416128	f	carpedonutnyc
Truck at 24th street park avenue north. Come..	1429703178	590844070093856768	f	carpedonutnyc
Out in Brooklyn today - come by bergen and court street for a donut!	1429443242	589753821393457152	f	carpedonutnyc
Out in Brooklyn today - come by bergen and court street for a donut!	1429360930	589408580744441857	f	carpedonutnyc
Truck open at 55th street and Broadway. Come!!!	1429269087	589023362120298496	f	carpedonutnyc
Open @ 51st street and Park avenue. Come!!!!	1429180296	588650944658833408	f	carpedonutnyc
Truck open at 23rd street and park avenue south. Come!!!!	1429094992	588293152030777344	f	carpedonutnyc
Food truck rally @ Grand Army Plaza, Prospect park. Come!!!	1428845950	587248595734294528	f	carpedonutnyc
Bergen and Court street is the place for donuts today!  Come out and see us. We are here until 4pm.	1428753966	586862786132762624	f	carpedonutnyc
@46 St on this beautiful day serving lunch from 11:30-3:30 @www.schnitzi.com, for dinner we will be Roosevelt Island from 6-8pm	1431005660	596307078081335296	f	schnitzi1
Today @46 St right off the corner of 6 Ave serving lunch from 11:30-3:30 order online @www.schnitzi.com schnitzitruck schnitzel	1430921568	595954368194678784	f	schnitzi1
46 St we are here bet 5&6 Ave serving lunch from 11:30 until 3:30 see you soon schnitzitruck foodtruck kosherfood http://t.co/vR5tgBHsTH	1430834396	595588743547002880	f	schnitzi1
May the fourth be with you, today our Millennium falcon is parking @Hanover Sq serving lunch from 11-3 order @www.schnitzi.com	1430748481	595228390921220096	f	schnitzi1
Today right off the corner of 46 and 6th Ave serving lunch from 11:30 until 3:30 get some schnitzi foodtruck @www.schnitzi.com	1430400748	593769891217416192	f	schnitzi1
we are @46 St bet 5&6 serving lunch from 11:30 until 3:30 order online @www.schnitzi.com	1430315448	593412117195165696	f	schnitzi1
First Schnitzi truck team needs to apologize for the waiting time yesterday we were missing one guy on our team	1430315402	593411924513067008	f	schnitzi1
Today schnitzi truck is on 46 St bet 5&6 Ave serving lunch from 11:30 until 3:30  order online @www.schnitzi.com	1430229879	593053214913732608	f	schnitzi1
Gorgeous day outside a perfect day for Schnitzi's,  @Hanover Sq serving lunch from 11 until 3 order online @www.schnitzi.com	1430144077	592693337196523522	f	schnitzi1
Good morning Thursday we are @46 St bet 5&6 serving lunch from 11:30- 3:30 last day of our week,Sunday @israelifoodfestival @76&Amsterdam	1429796668	591236195201503232	f	schnitzi1
Today @46 St bet 5&6 serving lunch from 11:30 until 3:30 such a beautiful day for some schnitzi schnitzitruck @www.schnitzi.com	1429711674	590879705613651968	f	schnitzi1
Get some schnitzi schnitzitruck @46st bet 5&6 serving lunch from 11:30 until 3:30 order online @www.schnitzi.com	1429624068	590512258893086720	f	schnitzi1
@hanover Sq serving lunch from 11 until 3 it's a day for online ordering @www.schnitzi.com schnitzitruck schnitzel foodtruck	1429538893	590155010962542592	f	schnitzi1
Happy Yom Israel to all you can find us @8th ave and 15st in Brooklyn, celebrating schnitzitruck schnitzel http://t.co/b8ZvyYGAFj	1429456635	589809993668567042	f	schnitzi1
The spring is here, come get some schnitzi schnitzitruck @46st bet 5&6 Ave serving lunch from 11:30 until 3:30 @www.schnitzi.com	1429193254	588705296589160448	f	schnitzi1
We will be serving lunch between 11:30-3:30 so good to be back hope to see all the familiar faces and some new ones,online @www.schnitzi.com	1429025410	588001307203477505	f	schnitzi1
Such a wonderful day and we are happy to serve lunch @46 bet 5&6 Ave from 11:30 until 3:30 you can order online @www.schnitzi.com	1427901408	583286899416121345	f	schnitzi1
Today we are @46 St bet 5&6 Ave serving lunch from 11:30 until 3 order online @www.schnitzi.com	1427811415	582909440451575808	f	schnitzi1
Today @Hanover Sq serving lunch from 11 until 3 Last week before passover get your bread dose before we ran out @www.schnitzi.com	1427724107	582543246057947136	f	schnitzi1
Today @46 St bet 5&6 Ave serving lunch from 11:30 until 3:30 order online @www.schnitzi.com see you all soon schnitzitruck	1427379630	581098403700064256	f	schnitzi1
Making healthy multigrain empanadas https://t.co/T1H77mz5uX	1431106698	596730860843446272	f	palenquefood
You can also make yourself our home made quinoa arepas at home come visit us today at @gansmarket... https://t.co/t0tJiyMGdk	1431008453	596318792453492738	f	palenquefood
RT @GansMarket: . It may be cloudy today but the market is celebrating HumpDay with so many tasty lunch options! @edslobsterbar @CapponesN...	1430928456	595983260515233792	f	palenquefood
RT @HeyNannery: Every go to @Palenquefood in garmentdistrict @UrbanSpaceNYC right now! Get an arepa with a side of agua de panela! http://...	1430773517	595333398027177984	f	palenquefood
RT @MayhemAndStout: New Market Monday. UrbanSpaceGarment opens today @ 11 & runs till June 14. Find us on B'way btwn 40th & 41st. @UrbanSp...	1430752372	595244710433792000	f	palenquefood
Arepas, caribanolas, fried yuca, Colombian sodas, guava paste. We are ready! urbanspace arepawithlove http://t.co/OeYp30PL3Y	1430751908	595242762154442752	f	palenquefood
Come to the release of our new AREPABURGER! at our new location in Broadway and 39st urbanspace arepawithlove	1430750712	595237745942986753	f	palenquefood
Lunch time is arepa time ! Come visit us at @GansMarket and get one large arepa and you'll get have price on the agua de panela	1430501924	594194254660030466	f	palenquefood
Come visit us at @GansMarket buy any of the large arepas and get the agua de panela 50% off !	1430410510	593810835572654080	f	palenquefood
RT @smorgasburg: Sunday Smorg in @BklynBrdgPark is CLOSED 5/3 for the Five Boro Bike Tour. Come on Saturday or visit the Sunday Flea! http:...	1430325257	593453258435362816	f	palenquefood
We also are at Martha Stewart office 9th Floor doing fooda! http://t.co/PsXZDhRozx	1430324253	593449048981536768	f	palenquefood
Hey Sunny York! try our lunch special :-) at @GansMarket  get your favorite large arepa and your drink half price! http://t.co/s8aGbksttz	1430322400	593441274650304512	f	palenquefood
Come get any of our large arepas We'll give you an agua de panela half price ! @GansMarket	1430247171	593125741434372096	f	palenquefood
RT @Karelys_A: @karelys_a at smorgasburg Brooklyn @mofongo_ny oaxacatacos @palenquefood mimishangryland food... https://t.co/MFI2vTHb4x	1430149574	592716390160867328	f	palenquefood
Come and get your arepawithlove at @smorgasburg and @GansMarket http://t.co/6Y430KnhEj	1429971780	591970670952734720	f	palenquefood
RT @GansMarket: .It's Friday! We know it's chilly, and we have the perfect treats to warm your tummy! @Palenquefood @edslobsterbar @tacombi...	1429892217	591636958847365120	f	palenquefood
Happy Wednesday everyone! Gansevoort Market is open for you daily, come over and try the best Colombian arepas with variety of fusions. :)	1429718251	590907291056078848	f	palenquefood
Just posted a photo https://t.co/gejLNpOMwu	1429483283	589921762525241344	f	palenquefood
Just posted a photo https://t.co/24pO5ZpOvI	1429483265	589921688944570369	f	palenquefood
Palenquito jugando al pandebono https://t.co/yMNFM6pqXV	1429481434	589914007030595584	f	palenquefood
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
On the block on 50th st between 6 / 7 ave.  In front of the Time and Life building.	1414681696	527839409010667521	f	funbunsnyc
Truth. Just awoke from hibernation but will be back over there! MT @quarropas it's been a while I think since you have been in midtown west.	1398180649	458629000668401664	f	goburger
Scream it from the rooftops it's CHEESESTEAK FRIDAY folks 56th st / Bdwy @randomfoodtruck @victoriasecret @UMG... http://t.co/1jICfuw5kC	1431100945	596706732547698688	f	carlssteaks
Scream from the rooftops it's CHEESESTEAK FRIDAY folks! Bdwy 55thst @randomfoodtruck victoriasecret... https://t.co/3hamr4iBCg	1431092568	596671593344016384	f	carlssteaks
Lovin Thursday one day closer to the weekend! 49th st 6 / 7Av @Barclays @SIRIUSXM @SiriusXMNFL @FoxNews @MHFI @UBSamericas GOT WHIZ?	1431005664	596307092144816129	f	carlssteaks
Happy hump day folks 47th st bet park / lex @MLB @nfl @UBSamericas @jpmorganchase @SIRIUSXM @SiriusXMNFL GOT WHIZ? http://t.co/gTqYlkqEgD	1430925679	595971613096554496	f	carlssteaks
Happy hump day folks 47th st bet park / lex @MLB @nfl @UBSamericas @jpmorganchase @SIRIUSXM @SiriusXMNFL GOT WHIZ? http://t.co/YmInUSoaVc	1430924951	595968559525822465	f	carlssteaks
Brooklyn showing us love today @dumbolot Jay st and water st Gotwhiz cincodemayo https://t.co/g8NtLmX8A9	1430835227	595592229135220736	f	carlssteaks
RT @dumbolot: Welcome back @KimchiTruck along with @SweetChiliNYC and @carlssteaks today!	1430835017	595591349547708416	f	carlssteaks
Start your Monday off right & grab a carls famous cheesesteak 52nd st bet 6th/7th av@UBSamericas @Barclays @SIRIUSXM @SiriusXMNFL GOT WHIZ?	1430750255	595235831725563904	f	carlssteaks
Gooooaaaaaaaaal!!! https://t.co/nzxnZ9wvrO	1430699291	595022073065508864	f	carlssteaks
Servin up our famous cheesesteaks today @LIMCollege street fair 98th st /3rd Av great time w Fashion biz students Gotwhiz?	1430584044	594538690518622208	f	carlssteaks
RT @randomfoodtruck: Friday's here and so are the trucks! @Chefsamirtruck @CarpeDonutNYC @souvlakitruck @carlssteaks	1430495465	594167162857750528	f	carlssteaks
Scream it from rooftops its CHEESESTEAK FRIDAY folks! Bdwy 55thst @randomfoodtruck @victoriasecret @UMG @Barclays... http://t.co/FsqeJZCRtP	1430489162	594140724830019584	f	carlssteaks
Scream it from rooftops its CHEESESTEAK FRIDAY folks! Bdwy 55thst @randomfoodtruck victoriasecret umg... https://t.co/9wkQDXeXPB	1430489002	594140054487969792	f	carlssteaks
We love Thursday ONE day closer to Friday folks! 49th st 6 / 7 Av @Barclays @SIRIUSXM @SiriusXMNFL @FoxNews @MHFI @UBSamericas GOT WHIZ?	1430403363	593780857988640769	f	carlssteaks
As always thanks for the love buddy!!! https://t.co/AKGtAuFoOQ	1430325125	593452706704052224	f	carlssteaks
Happy hump day folks 47th st bet park / lex @MLB @nfl @UBSamericas @jpmorganchase @SIRIUSXM @FoxNews GOT WHIZ?	1430316564	593416796134322178	f	carlssteaks
Happy hump day folks 47th st bet park / lex @MLB @nfl @UBSamericas @jpmorganchase @SIRIUSXM @FoxNews GOT WHIZ? http://t.co/i0jK48dg78	1430316509	593416567448305664	f	carlssteaks
RT @dumbolot: It's a beautiful day in dumbo with @SweetChiliNYC @carlssteaks and @lobsterrolling!	1430238345	593088722717036545	f	carlssteaks
Great day @TribecaFilmFest on Greenwich st grab a carls famous cheesesteak & enjoy & we got you covered Subway... http://t.co/enRqOHXucO	1429973230	591976749526700032	f	carlssteaks
Great day @TribecaFilmFest on Greenwich st grab a carls famous cheesesteak & enjoy & we got you covered Subway series @Yankees today at 4 pm	1429972592	591974075725127680	f	carlssteaks
RT @doriette: artisticparmesan breadcrumbparfait MOSTmisseddairy  https://t.co/A6wP9kmNuG	1431138659	596864912573489153	f	mactruckny
RT @doriette: @mactruckny YESSSSSSSSSS!	1431138637	596864823763210240	f	mactruckny
RT @mslisamona: This dude makes the best mac and cheese so I'm definitely rooting for him https://t.co/69AAdoCqz5	1431133287	596842384220094464	f	mactruckny
RT @The_Apocalisa: @ChefDomTes I LOVE Mac Truck! Seeing your truck brings the same level of excitement as if I spotted David Bowie riding a...	1431094616	596680184251682816	f	mactruckny
RT Calling all macheads if you follow my truck, follow my new handle @ChefDomTes to keep up with my newest adventure on FoodNetworkStar 	1431014029	596342179276161024	f	mactruckny
@RobWBailey @FoodNetwork @StatenEats Thank you to @silivedotcom @siadvance for the spread!!! Love the hometown support NoPlaceLikeHome	1430960476	596117561613352961	f	mactruckny
RT @RobWBailey: The @mactruckny guy is ready for his @FoodNetwork closeup! FoodNetworkStar @StatenEats http://t.co/uYTVaNfpOE http://t.co/...	1430960275	596116718600224769	f	mactruckny
Good morning 47st. Between Park and Lex 11:30-2	1430828363	595563437301878784	f	mactruckny
RT @HAHTSAHS: @mactruckny @Pier_13Hoboken @OINKandMOObbq  Thank you @mactruckny! Your food was by far the best we've had in a long time! WO...	1430711695	595074097190739968	f	mactruckny
Great day @Pier_13Hoboken  @OINKandMOObbq  has some amazing ribs. http://t.co/C2uGNY30GM	1430612905	594659740573114368	f	mactruckny
RT @AmandaBananasNJ: Catch us at @Pier_13Hoboken 12-10pm w/ @EmpanadaGuy1 @OINKandMOObbq @NautiMobile @PrimeKutz_ @themoofoodtruck @mactruc...	1430569243	594476610025345024	f	mactruckny
RT @forevervanny: lovemyjob  @mactruckny @bloglovin http://t.co/BQIOlnwKBb	1430499479	594183997388886016	f	mactruckny
RT @poncho_ny: Its a perfect food truck day. THANKS FOR THE MAC&CHEESE @mactruckny! LUNCHLUNCHLUNCHFRIDAYLUNCH	1430499126	594182517965619202	f	mactruckny
Check out Food Network Star Season 11!! June 7th... Youre local Mac Man will be competing!! FoodNetworkStar http://t.co/qa1NyXJ7pI	1430413208	593822152182333442	f	mactruckny
@smcginniss there are trucks in that spot? Last time i was there the cops said i would be towed if i came back	1430409672	593807323468005376	f	mactruckny
Hey Mac heads, be sure to watch Food Network Star Season 11 Starting June 7th Youre favorite Mac man is competing!!! https://t.co/SqSsFibHqq	1430408526	593802516493672448	f	mactruckny
@bcmurph07 i wont be returning to the seaport. They're not having the trucks back	1430322723	593442630245158912	f	mactruckny
RT @roirish: Nothing like a little @mactruckny BaconCheeseburgerMac PureCrack MacHead http://t.co/CXRP37Fc6f	1430251208	593142675169267713	f	mactruckny
RT @nyrr: .@mactruckny @chickpeanolive @toumnyc @morristruck @TakumiTacoNY & @pipsnacks will be at the AirbnbBKHalf Pre-Party! http://t.co...	1430251201	593142646106943489	f	mactruckny
@mactruckny 47st between park and lex till 2	1430225734	593035828605100032	f	mactruckny
@dchiuable  Sorry to inform you that we are closed for the season. Please keep following us for our return in March 2015 :)	1419358370	547454803237154823	f	funbunsnyc
RT @dchiuable: @funbunsnyc are u guys around midtown by any chance? Thx!	1419358342	547454684131516416	f	funbunsnyc
Happy thanksgiving weekend everyone.  \nShooting our first commercial in midtown. http://t.co/l28iw4YIB2	1417201536	538408385516146689	f	funbunsnyc
Last day to get your favorite buns this year at 50th st between 6 / 7 ave midtown Happy Halloween everyone	1414768000	528201392755081217	f	funbunsnyc
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
Nauti will be at Pier 13 in Hoboken every weekend! As for weekday spots in NJ, we are working on those! Updates soon!	1431025495	596390271480438784	f	nautimobile
@AZ88sundevil mid May! Official announcement coming soon!	1430836675	595598303422713856	f	nautimobile
We are hiring in NJ for our truck and Hoboken store location! http://t.co/x0L2ZaBhjC	1430758709	595271289176227841	f	nautimobile
So scenic, so tasty. @pier_13hoboken all day. https://t.co/ORSS8BZgnl	1430676865	594928009297158144	f	nautimobile
Pier 13 classic lineup today. Check it... @Aroy_D @PVPIZZATRUCK @AmandaBananasNJ @TFQfoodtruck @waffledelys	1430666175	594883172611059713	f	nautimobile
It's our first day back at @pier_13hoboken for the season. Teammate Morton is soakin' it all in.... https://t.co/ZgIomk7xqL	1430588515	594557442417131521	f	nautimobile
We're ready to get spicy with some @HAHTSAHS on our BBQ from @OINKandMOObbq. Life is good on @Pier_13Hoboken 	1430587449	594552973734346753	f	nautimobile
Fans of beer, food and summertime, follow @Pier_13Hoboken . Today starts the first weekend of the season. 	1430578641	594516027293196290	f	nautimobile
It's the most wonderful time of year. Pier 13 opening day with a championship lineup. We got @AmandaBananasNJ @OINKandMOObbq .. Can't wait	1430570158	594480449126322176	f	nautimobile
@13lake that is one town we are looking into for sure!	1430483520	594117062852751361	f	nautimobile
This is it, our last day on the streets of NYC. 17th st and 5th ave. So long, farewell, see ya when we see ya.	1430398345	593759811034025984	f	nautimobile
@guinallcox yep!	1430322301	593440863021309953	f	nautimobile
2 more days in NYC! 23rd and park today, 17th and 5th tomorrow, then off to Our new home in NJ. 	1430322294	593440832281272320	f	nautimobile
check out http://t.co/3LSGVBZSXY for our most recent updates about our big move to NJ and new Hoboken location!	1430237452	593084977216098304	f	nautimobile
New Jersey! We are hiring at our Hoboken location opening in mid May! Check this out! http://t.co/yeKgKinr2x	1430175445	592824900957667328	f	nautimobile
@MicheleReviews pier 13 starts this Friday night! We will be there on Saturday and Sunday's!	1430175392	592824681184526337	f	nautimobile
@gianlucacolaci moving to nj!	1430175342	592824472287215616	f	nautimobile
@Bill_Deni we'll one up you.. We are opening a restaurant at 207 Washington st in Hoboken on May 14th. How bout them apples?	1430175334	592824437982044160	f	nautimobile
67th and Broadway for the last time ever! Ever!!!!	1430058162	592332980913209345	f	nautimobile
47th & Park. It's our last week serving in this city. Food truckin' in NYC has become increasingly difficult, but we are going to miss you	1429887219	591615994394767360	f	nautimobile
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
RT @fewdblognyc: Yesterday's lunch pizza @pontirossifood urbanspacenyc food Yummy chewy crust. http://t.co/NHXuxuxXyo	1430968298	596150368029024257	f	pontirossifood
@stefferonipizza e vieni vieni vieniti a prendere la pizza ! :-)  38th & bdway	1430920856	595951381707653120	f	pontirossifood
Oven is up and BURNING. We got authentic Neapolitan pizza! garmentdistrict @UrbanSpaceNYC MAMMA MIA  http://t.co/AUca1TxL1G	1430838010	595603900654321664	f	pontirossifood
Buongiorno  garmentdistrict Authentic Neapolitan Pizza made by Neapolitans for everyone ! Come get it @UrbanSpaceNYC pizzamargherita	1430746609	595220539737841665	f	pontirossifood
Getting ready for our first season at @UrbanSpaceNYC urbanspacegarment eaturbanSERVING NEAPOLITAN STYLE PIZZA !!! starts next week!come by	1430276609	593249214269894656	f	pontirossifood
RT @dumbolot: @mausamnyc @mamuthainoodle @PontiRossiFood at the lot today! @dumbolot	1429881026	591590020726837248	f	pontirossifood
RT @nycfoodtruck: 15 many foodtrucks in 1 place! @Prospect_Park Food Truck Rally on Sunday: http://t.co/amCwlP8hic @papaya_king @PontiRoss...	1429732029	590965081246212097	f	pontirossifood
RT @GovBallNYC: Just announced: Food Lineup curated by @infatuation, get ready for some GovBallEEEEEATS http://t.co/HNZ67evgvo http://t.co...	1429724019	590931482824331264	f	pontirossifood
Governors Ball 2015 Food Lineup, Curated By The Infatuation http://t.co/dsIruQMl0R PONTI ROSSI WILL BE THERE FOR THE FIRST TIME ! 	1429723989	590931357439754240	f	pontirossifood
@BrunoVespa graZie mille Dottor Vespa! La aspetto Al truck per altra pasta in CASA! Grazie, grazie e mo saluti l'	1429386125	589514254270734336	f	pontirossifood
Fantastica giornata piena di risate, musica, professionalita' e PASTA! GRAZIE DI CUORE Dott. @BrunoVespa & @ilvolo http://t.co/EVcrN0egXR	1429385991	589513690090708993	f	pontirossifood
@undoneforever no worries you'll see us back Friday 	1429319324	589234071320002561	f	pontirossifood
@undoneforever glad you missed us and we miss youse too. how do you know we went to shoot in FiDi? $ its not everything.We love to feed you	1429299389	589150458939363328	f	pontirossifood
@undoneforever Absolutely,we'll be back Fri and every Friday at @dumbolot.Today we had to shoot a show for the Italian tv rai.That's all:)	1429299308	589150116537356288	f	pontirossifood
@DispatchNY @prospect_park Thanks 4 having us,Sunday isn't Sunday without pasta.Thanks coming to FoodTruckRally  http://t.co/BtVcTgzruR	1428894980	587454241402396673	f	pontirossifood
@skinnypasta greetings from NYC my fellow brother sister cousin  in pasta we trust 	1428837189	587211851118809088	f	pontirossifood
RT @ChoiceEats: A food truck serving homemade pasta? It exists and they're called @PontiRossiFood! Visit them at ChoiceStreets 5/5! http:/...	1428782482	586982392415399936	f	pontirossifood
Spend this Sund 4/12 with us at FoodTruckRally @prospect_park @DispatchNY @TaimMobile @BOCTT @CarpeDonutNYC @KelvinSlush @Papaya_King	1428764391	586906510766247936	f	pontirossifood
RT @nycfoodtruck: Spend Sun., 4/12, with us, @ToumNYC, @LobsterTruckNY @PontiRossiFood PapayaKing BrooklynOrganic + 9 more trucks! http:/...	1428700424	586638216071118850	f	pontirossifood
RT @joelevin: @PontiRossiFood delizioso!! so glad to have an authentic italian option in dumbo! grazie da giuseppe :^)	1428696797	586623004135792640	f	pontirossifood
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
Our finished product at urbanspacenyc! Get your fresh, juicy chicken tenders from us over here in... https://t.co/as12lUkEQT	1431130953	596832592088977408	f	usafoodtruck
@IntrepidMuseum @livefastgroup @LaBellaTorte @PapayaKingTruck pleasure to be here with you all!!	1431116811	596773275960770560	f	usafoodtruck
@doncooleo find us tonight at Urban Space Market in the Garment District! We got a booth on the corner of 40th and 6th ave! 	1431116762	596773072939655169	f	usafoodtruck
My fellow Americans. I'm proud to present to you... Our classic Winner Winner! Look at that crisp... https://t.co/1Uaagso0Dz	1431115833	596769177022636033	f	usafoodtruck
Fresh, buttery toast. Crisp lettuce and juicy tomato. Juicy, crunchy chicken tenders. And let's not... https://t.co/izGjhdaXbk	1431108553	596738642736979968	f	usafoodtruck
RT @IntrepidMuseum: Thanks to @Livefastgroup, we have some awesome food trucks on our pier today:@USAFoodTruck @LaBellaTorte @PapayaKingTru...	1431098131	596694927393828865	f	usafoodtruck
livefastgroup's photo https://t.co/8czGd8d239	1431096696	596688909905563648	f	usafoodtruck
Need that chicken fix? Two options: get your 'Murica on at the intrepid at pier 86 for Betsy(truck) or garment district at 39th and Broadway	1431095519	596683972219949056	f	usafoodtruck
RT @livefastgroup: In collaboration with @IntrepidMuseum we are bringing in the best food trucks in NYC.Today10-5 @USAFoodTruck @LaBellaTor...	1431095409	596683512050229248	f	usafoodtruck
@ShanghaiMKS Thank you!! We're excited to feed you!! Get that chicken!	1431037923	596442395190927360	f	usafoodtruck
D@$ right @MikeTGaffney! Come back and see us! https://t.co/ruBHHNFpFh	1431037888	596442250483265536	f	usafoodtruck
Can you guys guess what we were building? urbanspacenyc @fashioncenterny stay tuned for the finished... https://t.co/Jq8Tyg1ULl	1431037472	596440505564700672	f	usafoodtruck
Has anyone ever seen a picture more American than this?? We're over at the USS Intrepid today by the... https://t.co/gVwYQBciEE	1431018747	596361968363163648	f	usafoodtruck
Come on by for some chicken, burgers, salads and today the America is brought to you by @IntrepidMuseum: https://t.co/gVwYQBciEE	1431017947	596358612315955201	f	usafoodtruck
Did you miss our chicken over the winter?? WE'RE BACK AND PUMPED FOR FOOD TRUCK SEASON! Stay tuned... https://t.co/onwUm4hQeW	1431010602	596327804347777027	f	usafoodtruck
@jrjacobs1 the truck has been off the road. We got rear ended and it shorted out some wiring.  No lights and night driving.	1430974097	596174690495922176	f	usafoodtruck
RT @ThrillistNYC: The 8 NYC Outdoor Food Markets You Need to Hit Up Immediately - http://t.co/1iu6zQoLzr http://t.co/5VY7U4zL8N	1430937256	596020169090199552	f	usafoodtruck
@food_fashgirl @UrbanSpaceNYC girl you gotta get our chicken tenders in your life. burgerisgoodtho	1430850741	595657300695764992	f	usafoodtruck
@food_fashgirl @UrbanSpaceNYC hey there!  We're working on getting fries just for you! Should be here soon.  Prepare your t-buds. use76with	1430850201	595655034467196929	f	usafoodtruck
Hey yall.  Need your chicken fix?  We're at urbanspace's garment district market at 39th and Broadway.  Open till 9.  Come and get it.	1430840235	595613231672139777	f	usafoodtruck
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
@MorgayneBRandom our Friday plans have changed! We have a private event until 2pm! After that, we'll see if we have time!	1431038144	596443325785362433	f	thetreatstruck
Thank you to you who bring bread to make toast. Both the same difference in this land. \nTis as far as I can reach. I submit to your defeat.	1420374830	551718142347862016	f	toastmonsternyc
Happy new year @gofooda !	1420095743	550547567374000129	f	toastmonsternyc
Herro New York @gofooda friends family. Thank you for blessing Toast Monster with your support. Hope you have a toastie holiday. Rawr.	1419367750	547494142264483840	f	toastmonsternyc
Ten.	1418358672	543261762296889344	f	toastmonsternyc
@gofooda 	1417825512	541025529722580992	f	toastmonsternyc
Phil's Phriday returns to 51st and Park! Open at 11 and going til 2. Start the beautiful weekend the right way...at the jawn!	1431093432	596675218048950272	f	philssteaks
The lovely day continues at W. 4th and Greene til 7ish. The weather does not get better than this. Get outside and get your Phil!	1431029339	596406394854707200	f	philssteaks
RT @luv4music2: @PhilsSteaks best cheesesteak ever.	1431022363	596377134056271872	f	philssteaks
A happy crew from Cali stops by the jawn for steaks before heading to the airport. lastmeal jfk2lax... https://t.co/vztsIBXaqN	1431013498	596339952239149058	f	philssteaks
Feels like a 90's hip hop kind of TBT. The jawn is on 52nd n 6th, the sun is shining and the steak is sizzling! 11-2	1431005663	596307090152562689	f	philssteaks
Peanut chews free with a steak! Can't beat that! 41st between 6th and Broadway til 2! https://t.co/FRDQ15fKsb	1430926807	595976341469732866	f	philssteaks
Whiz Wednesday in effect! 41st between 6th n BWay 11-2	1430923970	595964442703175680	f	philssteaks
@kat_ny sorry Kat! When the man lays down the law, we have to respect it. We may not like it, but we play ball. Hope to see you soon!	1430855030	595675289792942083	f	philssteaks
NYU 3-7. W. 4th and Greene St til 7.	1430851483	595660411216736256	f	philssteaks
@neomatrix725 probably not. Too much hassle parking. The only spot that trucks seem to be allowed is way too crowded w/other trucks	1430844472	595631005609910272	f	philssteaks
@cs19721 yea man sucks. Flatiron today. Midtown the rest of the week	1430840467	595614206457700355	f	philssteaks
On the realest has jawn on the truck. We're in Flatiron at 5th between 18th and 19th serving up the... https://t.co/xZ7hyLZJO4	1430839172	595608776251695106	f	philssteaks
Hey Flatiron we're popping up for a surprise visit! The jawn is on 5th Ave between 18/19 now til 2 come thru!	1430838745	595606983790714881	f	philssteaks
Good morning NYC. A traffic cop has forced us to move from Water and John. Unfortunately we can't vend there... http://t.co/1rI9DsAeKB	1430835026	595591383563526144	f	philssteaks
What a weekend! Back to reality? Make your Monday better with steaks from the jawn. 47 between Park/Lex 11-2	1430750344	595236203861045249	f	philssteaks
Another perfect day 4 a foodtruckrally at Prospect Park! we'll be slanging steaks till 5pm come enjoy the eats & sunshine! Thx Dispatch NY	1430666779	594885705131753472	f	philssteaks
Another perfect day 4 a foodtruckrally @prospect_park we'll be slanging steaks till 5pm come enjoy the eats & sunshine! Thx @DispatchNY	1430666683	594885302323412992	f	philssteaks
RT @Ash52Tori: @PhilsSteaks Your cheesesteak's are amazing! delicious i	1430665267	594879365332238336	f	philssteaks
Another great day for the Bike New York Expo! The jawn is at Basketball City slanging steaks out back from 1130 til 630.	1430578816	594516762219122688	f	philssteaks
We're down at Basketball City on South Street at the Bike New York Expo! Today and tomorrow from 11am... https://t.co/nb2wYnFhtx	1430496987	594173545376313345	f	philssteaks
Metrotech GrilledCheese Thursdays!\n\nLawrence st, on the Commons, 1130-3! Come and EAT!	1431011532	596331705323118592	f	morristruck
Good morning, CrownHeights- shop will be closed, temporarily, for weekdays in May. As always, check our website for truck locations.	1430743387	595207023115038721	f	morristruck
Whatever you're doing this weekend, plan on making sandwiches a part of it. SandwichShops open all weekend long!	1430503435	594200590735007746	f	morristruck
RT @ElizabethReede: @BlumenfeldEmily @sjgstone @morristruck best grilled cheese in NYC	1430423217	593864132375511040	f	morristruck
Midtown! Were serving at 51st btwn Park/Mad today for one last glorious time this season. Come make it count with some cheese for lunch!	1430406126	593792450252165120	f	morristruck
Hey folks just a heads up- the SandwichShop will be closed today for an offsite event, but the Truck & Cart are out on the streets!	1430399546	593764851283013632	f	morristruck
RT @EastWoodsSchool: Food Trucks are coming May 16 &17 at EastWoods Spring Fair @toumnyc @waffletruck @eatmedrinkmetruck @coolhaus @sweetch...	1430399458	593764481718714369	f	morristruck
Midtown! To help spread the Morris &lt;3 this summer well be switching up our schedule. Truck's @ 51 &Mad tomorrow for a last weekday hurrah!	1430336366	593499853075845122	f	morristruck
Ok! Problem solved (for now)! We're on Front & Main slingin cheese for your Wednesday enjoyment, @DumboNYC !	1430322544	593441879867396097	f	morristruck
Not the welcome we were hoping for @DumboNYC- we've been asked (nicely) to leave our spot on Adams, so stay tuned for where we end up!	1430322144	593440202963734528	f	morristruck
.@DumboNYC were here! Adams & Front st for some throwback cheesin till 2:30. Everyone else? Hit up the Sandwich Shop, 569 Lincoln Pl!	1430316169	593415142139920385	f	morristruck
Dearest @DumboNYC regulars, weve missed you! Well be at Pearl & Front st tomorrow to show you our love, before our season kicks into gear!	1430250082	593137953234378752	f	morristruck
Were at 29th and Park today, serving one of our favorite throwback locations before summer madness begins! CheeseAllDay!	1430229518	593051701680177152	f	morristruck
Flatiron fans! Well be at 29th and Park tomorrow for Throwback Tuesday, serving cheesy goodness from 11:30 - 2:30. DreamsComeTrue	1430159066	592756202112704513	f	morristruck
Were hitting up some of our favorite street locations this week before summer events take over! Stay tuned for details!	1430150359	592719684224610304	f	morristruck
Hey there cheese fans, cart will be @StoneBarns SheepShearingFest all day today, & the MorrisSandwichShop for all your brunching needs!	1429974168	591980685705027584	f	morristruck
hey hey Thursday's here & we're @DowntownBklyn Metrotech today! We know you're also in need of cheese midtown, we'll see you next week!	1429802234	591259541465096192	f	morristruck
We feel you, Brooklyn, we don't want to go outside either- good thing @TryCaviar delivers right to your door! SaveAnUmbrella EatASandwich	1429541583	590166293329895424	f	morristruck
It's Sunday and sandwiches are on the menu! 569 Lincoln Place!	1429455790	589806451784347648	f	morristruck
It's a cheese kinda day, baby. Truck is @RoyalPalmsClub today & tonight, cart is @TribecaFilmFest for lunch @SpringStudios springtime	1429370604	589449154641952768	f	morristruck
!!! Fri, May 8th we have a private event today, so we'll miss our regular spots! We'll see you all next week!!!	1431095274	596682942983856129	f	thetreatstruck
Our fave block is unusually full of parked cars!! We're waiting for a spot to open up. Cross your fingers for us!!!	1431025392	596389839672582144	f	thetreatstruck
@MorgayneBRandom we'll be on. 45th tomorrow!!!	1431011155	596330123835629568	f	thetreatstruck
!!! Beautiful day, hooray! Headed to the UWS this afternoon! 3ish-7pm Bway (86 & 87th)! We'll let you know our start time later!	1431001842	596291061607202816	f	thetreatstruck
!!! 4-7pm 18th st &7th ave!!!	1430942619	596042662404333568	f	thetreatstruck
!!! Wed, May 6th 12-3:30 45th st. & 6th ave!! Then 4:30ish-7pm 18th st & 7th ave!!!	1430924232	595965543053688832	f	thetreatstruck
!!! Mon, May. 4th our shop open 12-6pm!!!Tomorrow we'll be at the villagevoice Choice Streets @voicestreet	1430747095	595222575443255296	f	thetreatstruck
!!! Our shop open 9am-6pm Sat & Sun w/food & Treats!!  521 Court st Brooklyn	1430566022	594463098905427968	f	thetreatstruck
!!! 4-7pm 18th st & 7th ave!!!	1430510665	594230916400193536	f	thetreatstruck
!!! Fri, May 1st 12:30-3:30pm 45th st & 6th ave! Then 4:30ish-7pm 18th st & 7th ave!!!	1430494374	594162586935001088	f	thetreatstruck
!!! 3:30-7pm Bway (86 &. 87th)!!!	1430421630	593857475968946177	f	thetreatstruck
@e_twiZz headed to the UWS! We'll be back tomorrow!!!	1430419378	593848031742664704	f	thetreatstruck
!!! Thurs, April 30th 12-2:30 45th st & 6th ave, then 3:30ish-7pm Bway (86 & 87th)! We'll let you know UWS start time later!!!	1430407225	593797057934192640	f	thetreatstruck
@KeriHoran come on by!!! Lots of treats for all!!! Hooray for treats!!!	1430341238	593520286915436547	f	thetreatstruck
!!! Wed,April 29th 5-7pm 18th st & 7th ave!!!	1430340011	593515140789587968	f	thetreatstruck
!!! Wed,April 29th a private lunchtime event,so we'll miss you all on 45th today! We'll see if there's time for 18th & 7th later!	1430314702	593408986881368064	f	thetreatstruck
!!! Our shop open today 12-6pm! Have a great day! Our truck will have spots later this week!!!	1430143742	592691929453821953	f	thetreatstruck
!!! Have a weekend! Our shop is open Sat & Sun 8:30am-6pm @ 521 Court st Brooklyn !!!	1429905052	591690791464083457	f	thetreatstruck
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
Last day on Front & Jay! We'll miss you Dumbo. Have a great winter! Serving the usual + Split Pea Soup through lunch. @DUMBOFoodTrucks	1417009699	537603759468457984	f	thesteelcart
Last day on 56th & Broadway! Soups are Split Pea & Rustic Chicken.	1416928831	537264575562149888	f	thesteelcart
@holyshityouguys Just issued refund. Had you checked in for some reason & charge went to your wallet on accident. Sorry about that.	1416843469	536906541849657345	f	thesteelcart
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
@VistCaymanIslands  is giving away free ice cream all week long. \n\nEnter to win a free trip to Cayman Islands http://t.co/F6Cle7U4Rq	1402941240	478596368882466816	f	thecrepestruck
MikeEpps visits NewEraCap Promo Truck SuperBowl with CrystinaPoncher ESPN\nhttp://t.co/k0PPVYUhBq http://t.co/3MeumAKTUz	1391084755	428866664227024896	f	thecrepestruck
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
RT @FoodtoEat: Awesome day for @BKLYNDESIGNS at Greenpoint! Great foodtrucks over there @Valduccis pizza & @ToumNYC  lebanesefood http:/...	1431117944	596778030175035393	f	valduccis
Wall Street here we come. !!!! @Foodtruckgirl7 @greenboxny @FoodtoEat @FoodNetwork @FoodPorn @foodNfest @SocialManha http://t.co/lbmR0nkR61	1431034239	596426943404310530	f	valduccis
RT @Foodtruckgirl7: @Valduccis you're the best!!! I'm back in NY on Wednesday and I will find you!!!! nycfoodtrucks supportlocalbusiness	1431034120	596426444353511425	f	valduccis
RT @RobWBailey: The @mactruckny guy is ready for his @FoodNetwork closeup! FoodNetworkStar @StatenEats http://t.co/uYTVaNfpOE http://t.co/...	1431026183	596393156888920064	f	valduccis
RT @Foodtruckgirl7: @Valduccis @greenboxny @FoodtoEat @foodNfest @FoodPorn @TheSeaport really needs you guys back!!! Bring the food trucks ...	1431024753	596387156781867008	f	valduccis
Here is a meatball ricotta pie for @Foodtruckgirl7  see you next week http://t.co/4DLWaKvoCi	1431024741	596387109243596800	f	valduccis
http://t.co/qQPgqTx2Iy  For all your Catering Needs !!!	1431009224	596322025251168258	f	valduccis
Mmmmmm Mmmmmm Gooood http://t.co/mwEcnR8saz	1431009138	596321665774198784	f	valduccis
This really is the best Pizza @greenboxny @FoodtoEat @foodNfest @FoodPorn @Foodtruckgirl7  coming down town soon  http://t.co/WZQ7FUVrh1	1431009081	596321426715582465	f	valduccis
RT @sosuperlative: More delicious za, this time from @Valduccis! At @voicestreet's ChoiceStreets food truck event,... https://t.co/34R1O04j...	1430927948	595981128206520321	f	valduccis
RT @Its_KDC: .@Valduccis bringing their pizza A game to the @ChoiceStreets food truck event 	1430927934	595981071675686912	f	valduccis
RT @sosuperlative: Sicilian slice of za and a zeppole from @Valduccis!! \nAt @voicestreet's ChoiceStreets food truck... https://t.co/RAYzQA1...	1430916185	595931792798015488	f	valduccis
@VoiceStreet @IntrepidMuseum  Lots of Trucks @FoodPorn @FoodtoEat @greenboxny http://t.co/XG0PMaqvUS	1430916022	595931106635075584	f	valduccis
RT @love_masti01: welcomeTweet @samexbrown @shrooq_alsaid @monsieuranto @dnlnpt @KevinIngosi @SamiasunnSs @Valduccis via http://t.co/GQLWb...	1430910201	595906693868986369	f	valduccis
Last night at the @ intrepid for the Village voice choice Street awards @greenboxny @FoodtoEat @Foodtruckstars_ http://t.co/5uZFGGPNGG	1430909394	595903305403990016	f	valduccis
51st n Park ave Free Zeppoli  Pizza Panini  new personal round pie @greenboxny @FoodPorn @FoodtoEat @Foodtruckstars_ @SocialManhattan @	1430839720	595611075531386880	f	valduccis
RT @Foodtruckgirl7: @Valduccis OMG personal pies !!Please let me know when you are near FiDi for sure! Lucky folks near 52nd!!! nycfoodtru...	1430833735	595585970872909825	f	valduccis
Personal pies 8$ on 51st n Park @foodNfest @FoodtoEat @greenboxny @Foodtruckstars_ @FoodPorn @Foodtruckgirl7  Pizza!! http://t.co/MC4HVXBQI7	1430826536	595555775700926465	f	valduccis
Rent I will truck for your next event @greenboxny @foodNfest @FoodtoEat @TantilloFoods @FoodPorn @ http://t.co/efcdPM2TWa	1430780573	595362994990776320	f	valduccis
@ChoiceStreets @villagevoice  Come to the intrepid tomorrow night over 20 trucks. @greenboxny @FoodPorn @FoodtoEat http://t.co/N8zSzLiNSr	1430748058	595226613584949248	f	valduccis
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
Happy Fryday from Old Slip & Water! Also check out our UrbanSpaceGarment booth on 39th & Broadway, open til 9PM!	1431093769	596676630149488641	f	domotaco
Catch the truck on 53rd & Park today! Also check out our UrbanSpaceGarment booth on 39th & Broadway, open daily from 11-9!	1431009233	596322062899290112	f	domotaco
RT @mkohlmeyer: @DomoTaco you were the best food at the foodtruckfestival yesterday.  Yum!	1431005281	596305486116429824	f	domotaco
Truck in @dumbolot til 2:00pm today. Come thru early!!!  asiantaqueria	1430926506	595975081815183360	f	domotaco
Kickin it in the @dumbolot today! Also be sure to check out our booth at UrbanSpaceGarment on 39th & Broadway!	1430922169	595956888568725504	f	domotaco
Happy CincoDeMayo everybody! @ChoiceEats at ChoiceStreets tacos mariachi asiantaqueria trucklife intrepid http://t.co/dbd1Z5rNt6	1430875178	595759796227301376	f	domotaco
Gearing up for the masses tonight at @ChoiceEats's ChoiceStreets intrepid trucklife preptime	1430838615	595606437667168256	f	domotaco
@complex @GarmentDstrctNY @UrbanSpaceNYC 7 days a wk til June... Just enough time to try everything on the menu:)	1430838458	595605778632937472	f	domotaco
Happy CincoDeMayo from Hudson & King! Also catch our UrbanSpaceGarment booth on 39th & Broadway! tacos asiantaqueria	1430834945	595591044462424064	f	domotaco
Open for business on 39th & Broadway! asiantaqueria urbanspacegarment eaturban @GarmentDstrctNY @UrbanSpaceNYC http://t.co/Vy6DVZsYs4	1430753729	595250401810771968	f	domotaco
Catch the grand opening of our urbanspacegarment booth on 39th & Broadway! @GarmentDstrctNY @UrbanSpaceNYC eaturban	1430750021	595234846592638976	f	domotaco
Beautiful day on 52nd & 6th!	1430749855	595234150820483072	f	domotaco
Happy Fryday from Water & Old Slip!	1430488791	594139171771449344	f	domotaco
Happy NationalTotDay from 53rd & Park! JapaneseNachoTots yum asiantaqueria	1430403344	593780777994838017	f	domotaco
Things are heating up on Jay & Water! @dumbolot today!	1430316415	593416171774464001	f	domotaco
Gearin up for a new season with @urbanspacenyc! urbanspacegarment starts next week eaturban http://t.co/AV06K76DSk	1430229814	593052942489493504	f	domotaco
SoHo today! Getting ready on King & Hudson:)	1430229487	593051569907728384	f	domotaco
Heating the grills up on 52nd and 6th for lunch. asiantaqueria	1430140240	592677242389602305	f	domotaco
Old Slip and Water till 2:30!	1429880532	591587946299428866	f	domotaco
53rd and park till 2pm!!!	1429795170	591229913807638528	f	domotaco
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
Go check out our friends @TakumiTacoNY who are opening may 1-28 at madison square eats on 25th and Broadway! http://t.co/zqxyOhpySF	1430436907	593921552632160257	f	eddiespizzany
Its lunch time. Stop by and try our weekly special. Pizza topped with short rib, mushrooms and caramelized onions... http://t.co/BxNXFyEVxs	1430234925	593074378079895552	f	eddiespizzany
RT @smorgasburg: Hop Aboard The Bus To Smorg For Easy Passage To Williamsburg On Saturday. More here: http://t.co/dZhmrHJGFa http://t.co/WV...	1429807546	591281823658991616	f	eddiespizzany
Weekly special white pie mushroom olives garlic and roasted red peppers. Monday's at starrettlehigh... http://t.co/VxVdAQbLW3	1429548113	590193682176946177	f	eddiespizzany
Weekly special white pie mushroom olives garlic and roasted red peppers. Monday's at starrettlehigh... https://t.co/5lxtaTyi2g	1429548111	590193672618172416	f	eddiespizzany
RT @TDBank_US: @EddiesPizzaNY Thanks for joining us today! Hope everyone is having a good time! :-) ^YD	1429287967	589102550365949954	f	eddiespizzany
Go get some free pizza courtesy of td bank today on 56th and madison until 2pm http://t.co/yyIA8L2l52	1429287656	589101244825870336	f	eddiespizzany
Complimentary slices today on 56 and Madison from @tdbank_us tdbank eddiespizza http://t.co/OdytQUvytT	1429281025	589073432182181888	f	eddiespizzany
Hey its lunch time. We are parked on West 46 street and 6th ave. Stop by and pick up a delicious hot fresh pizza... http://t.co/fg4NqWxBnD	1428507626	585829562111635457	f	eddiespizzany
Mondays @starrettlehigh special this week is @makersmark special hot sauce sandwich! eddiespizza starrettlehigh... http://t.co/wamK8EPNpL	1428332036	585093084037251073	f	eddiespizzany
Mondays @starrettlehigh special this week is @makersmark special hot sauce sandwich! eddiespizza... https://t.co/2ejO4W3O0G	1428332034	585093074642141185	f	eddiespizzany
Its not an April fools joke! Chevy is providing a FREE lunch today at Eddies Pizza Truck in Manhattan on 46th... http://t.co/fXqHengH0m	1427905038	583302124047613952	f	eddiespizzany
Its not an April fools joke! Chevy is providing a FREE lunch today at Eddies Pizza Truck in... https://t.co/faceB2rjIb	1427905034	583302110055264256	f	eddiespizzany
Its not an April fools joke! Chevy is providing a FREE lunch today at Eddies Pizza Truck in Manhattan on 46th... http://t.co/thgH4JLJl2	1427896868	583267858949361667	f	eddiespizzany
Its not an April fools joke! Chevy is providing a FREE lunch today at Eddies Pizza Truck in... https://t.co/jCHjyFjTOu	1427896867	583267851554938880	f	eddiespizzany
Friday's at varick and king until 3p. Today's special fresh mozz from lioni cheese, artichoke, garlic, chicken,... http://t.co/Z9w3Ptp2cF	1427469338	581474667602386944	f	eddiespizzany
Friday's at varick and king until 3p. Today's special fresh mozz from lioni cheese, artichoke,... https://t.co/cnXoGriVk8	1427469336	581474657515282432	f	eddiespizzany
Weekly especial white pie, olives, prosciutto and Caramelized onions eddiespizza mondays at starrettlehigh http://t.co/BtCLIClECq	1427123836	580025528192647168	f	eddiespizzany
@sukhmeet_singh we aren't on the road today but you can visit our restaurant on Long Island which is open 7 days a week	1427043858	579690073542795264	f	eddiespizzany
Special: white pie w chicken tinga and pico de gallo. Mondays: starrettlehigh http://t.co/NBbt4sltQy	1426517301	577481534300667904	f	eddiespizzany
taimmobile is off for the weekend!   Enjoy the beautiful weather and HappyMothersDay!	1431122024	596795143665098752	f	taimmobile
Craving a greenfalafel sandwich?  Come visit us on Vandam and Varick in HudsonSquare! nycfoodtruck taimfalafel	1431013102	596338292003569664	f	taimmobile
falafel helps you get over the hump! In flatiron today on 20th and 5th! happyhumpday nycfoodtruck happyhumpday	1430926454	595974863547977728	f	taimmobile
20th and 5th in flatiron today!  falafel nycfoodtruck	1430840507	595614375391711232	f	taimmobile
No parking today downtown.  Come visit us on 20th and 5th in flatiron!  It's almost 80 degrees and we have datelimebananasmoothies.	1430754399	595253210710986752	f	taimmobile
Perfect day for a picnic in the parc! Stop by Prospect Parc's Food Truck Rally and get your greenfalafel and datelimebanana smoothie!	1430663605	594872394398961664	f	taimmobile
BALLING in hudsonsquare today. falafelballing that is!  Come visit us on the corner of Varick and Vandam! hudsonsquare nycfoodtruck	1430408491	593802366970892288	f	taimmobile
Reasons to eat @TaimMobile on 20th & 5th in flatiron... 1. Its humpday 2. the weather in nyc is perfect and we have smoothies	1430322729	593442658183487488	f	taimmobile
@MeriwetherK thanks for waiting!  We'll be in the same spot tomorrow too! Hope to see you again!	1430245465	593118586912182272	f	taimmobile
falafel in flatiron today!  Come to 20th and 5th between 11 and 3 today!  falafelinflatiron taimfalafel taimmobile flatironfood	1430231621	593060520179171329	f	taimmobile
@TaimMobile will be on the corner of Water and Broad Street today! Come fulfill that Monday morning falafel craving with @TaimMobile!	1430148582	592712232233992194	f	taimmobile
RT @nycfoodtruck: Sunday, FUNDAY! Join 15 foodtrucks at @Prospect_Park on 4/26: http://t.co/fQ59hE2MSo @LobsterTruckNY @TaimMobile granda...	1429823146	591347254813917184	f	taimmobile
SoHo, let's do this. Taim Thursday on Varick/Vandam, it's time for fries with saffron aioli! http://t.co/PzumX623cZ	1429804400	591268624679174144	f	taimmobile
RT @IanReelDeal: The Great Falafel War that I just made up is over: @TaimMobile wins	1429729785	590955667755814913	f	taimmobile
RT @GraceKendallLit: Heaven will be a sunny spring day with fries from @TaimMobile and enough saffron aioli to last me for eternity. http:/...	1429729771	590955611778613248	f	taimmobile
It's a date! @MerJohnston @TaimMobile I'm on my way! 	1429719598	590912940406091776	f	taimmobile
Hump Day/Hummus Day on 20th/5th. Get out of the office and into Taim state of mind. NYCfoodtrucks nyclunch http://t.co/JT8nmfuUSX	1429717142	590902641766596608	f	taimmobile
RT @nycfoodtruck: RT @TaimMobile: Taim returns to brooklyn next Sunday at the Prospect Park food truck rally	1429716970	590901919369060352	f	taimmobile
RT @m_artin_a: It's TaimTuesday in Flatiron y'all. I am on board. @TaimMobile	1429638801	590574054471557120	f	taimmobile
Cheers to Spring, with a Ginger Mint Lemonade on 20th/5th! NYCfoodtrucks nyclunch TaimTuesday http://t.co/HWyhs8AHut	1429628413	590530483441774592	f	taimmobile
Serving at Hudson/King St 375 Hudson Street New York From 7:30AM-3:00PM EDT http://t.co/aR2bxNYVPT	1431084907	596639462790144000	f	sweeterynyc
The day is almost over! Make sure to come down here before we finish! Broadway btwn 53rd & 52nd. fnmfoodtruck cupcakes	1431030937	596413094513004544	f	sweeterynyc
A great event! Serving Now at Group M - 498 Fashion Ave. New York From 4:30PM Until 6:30PM http://t.co/aR2bxNYVPT	1431030920	596413023486619648	f	sweeterynyc
This is the last stop for our travel truck... We are at Broadway, between the 52nd and 53rd St, until 5pm ! Come... http://t.co/xC1x7U9gBc	1431029031	596405103034249216	f	sweeterynyc
Last stop!! Find us on Broadway between 52nd & 53rd! cupcakes fnmfoodtruck SweeteryNYC traveltruck	1431028461	596402712679424001	f	sweeterynyc
Only 45 left to get your free cupcake before we move for the last stop ! We are at 7th Ave between 36th and 37th... http://t.co/nKvHLAsTyX	1431022501	596377711175553024	f	sweeterynyc
Exciting Event Serving Now at MediaVest Worldwide - 1675 Broadway New York From 2:00PM Until 4:00PM EST http://t.co/aR2bxNYVPT	1431021912	596375240147632129	f	sweeterynyc
@krazylilz @FoodNetwork glad your doggie could enjoy the treat too!!	1431020464	596369169131646976	f	sweeterynyc
@flashner08 @shesdomestic hopefully you can come back and get a cupcake!!	1431020433	596369038923714560	f	sweeterynyc
Serving Now at Exciting Event Details Soon - 375 Hudson St. New York From 1:30PM Until 3:30PM http://t.co/aR2bxNYVPT	1431020111	596367687355367424	f	sweeterynyc
Don't forget to come get your FREE cupcake! We'll be serving again from 1:30pm - 3:00 at 7th Ave btwn 36th and... http://t.co/odv38VgmGo	1431019813	596366436924284928	f	sweeterynyc
@garsleat all 10 flavors are available at every stop!	1431018370	596360387064406016	f	sweeterynyc
Only one hour left to get your free cupcake before we move for the third stop ! We are 42nd street between 5th... http://t.co/vseZ1VTCeH	1431014602	596344581471531008	f	sweeterynyc
Don't forget to come get your FREE cupcake! We'll be serving again from 11:30 - 1:00 at 42nd st btwn 5th and 6th... http://t.co/ndAeuWdBLo	1431011390	596331108393943041	f	sweeterynyc
Serving Now at Exciting Event Details Soon - 42nd and Madison New York From 11:00AM Until 1:00PM http://t.co/aR2bxNYVPT	1431011107	596329920764223488	f	sweeterynyc
Only one hour left to get your free cupcake before we move for the second stop ! We are at the corner of Madison... http://t.co/ocs0R7ZZxj	1431004839	596303633660125185	f	sweeterynyc
We're live!! Free cupcakes!! Come down and see the fnmtraveltruck at 42nd & Madison. We're here until 10:30! http://t.co/V76nNLfwZ9	1431003267	596297037961940992	f	sweeterynyc
We're on the road!! Come get your FREE cupcake from 8:30 at 42nd & Madison from the Food Food Network Travel... http://t.co/uqT1tG28Nt	1430999231	596280109457395713	f	sweeterynyc
FREE cupcakes at 42nd & Madison from 8:30am!! Come visit the Food Network Travel Truck! followus cupcakes foodnetworkmagazine	1430999062	596279404105433088	f	sweeterynyc
Serving at Hudson/King St 375 Hudson Street New York From 7:30AM-3:00PM EDT http://t.co/aR2bxNYVPT	1430998509	596277084563087360	f	sweeterynyc
Pre vacation feel with coconut meal @lovemamak @smorgasburg http://t.co/HM2vdWdNzC	1428854214	587283256812380160	f	lovemamak
RT @i8and8: GO! We'll be there tomorrow w/ @LoveMamak. Come say hi! @YelpQueens @TGRdnb @weheartastoria @YelpNYC @WixLounge YelpHelps	1428340179	585127237332021248	f	lovemamak
Wishing everyone a Happy New Years. Today we will be at 97th and Columbus ave	1420223348	551082781795966977	f	elpasotruck
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
Mamak on Yelp: Curry Laksa ( Malaysian Ramen ) http://t.co/xKUOieQCHI	1417590010	540037759843319808	f	lovemamak
@jerewumuwegab we are at 174 2nd ave 10003	1417587804	540028510547755009	f	lovemamak
@JeepneyNYC 6 yj7n7u	1417408994	539278526370025472	f	lovemamak
It was A Awesome Week !!!       The SHUKA TRUCK weekly schedule: \nSun: Smorgasburg (Brooklyn) + 63rd... https://t.co/9yEV8U2Fh4	1431109428	596742312849444864	f	shukanyc
Clean & Ready !!  THURSDAY is Dimond District- 46th St & 6th Av ! Have a Eggcellent Day ! 11:30 - 3:00 ! http://t.co/f3aVwt6APC	1431011054	596329701469192192	f	shukanyc
Clean & Ready !!  THURSDAY is Dimond District- 46th St & 6th Av ! Have a Eggcellent Day !... https://t.co/59SmX3toaD	1431010994	596329448363950080	f	shukanyc
There's a APP for Shakahuka ! Download - Join the SHUKA Family and get cool Benefits ! WEDNESDAY IS... https://t.co/najG87Yi4Z	1430923133	595960934499246080	f	shukanyc
@neilkleid One of the best tweets until now !!	1430876444	595765105897426947	f	shukanyc
Sun: Smorgasburg + 63rd & Broadway.  Mon: 21st & 5th Av \nTue: FIDI-Hanover Sq, \nWed: 21st & 5 av  , \nThu: 46th & 6th,\nFri: 46 & 6th .	1430840908	595616057638916098	f	shukanyc
The Undefeated RED Shakshuka!  Organic Eggs, Fresh Tomatoes, Onions, Feta Cheese and many Spices! All these are... http://t.co/1Oohk3pjYC	1430838978	595607960665096192	f	shukanyc
The Undefeated RED Shakshuka!       Organic Eggs, Fresh Tomatoes, Onions, Feta Cheese and many... https://t.co/XwVoh8VKJI	1430838717	595606866446700544	f	shukanyc
tbt to that time that Ban Ki- Moon Tried his Very first SHAKSHUKA ! And said it was Taim meod  (Very Good) !!... http://t.co/z2uht9LoAa	1430745486	595215828829745152	f	shukanyc
tbt to that time that Ban Ki- Moon Tried his Very first SHAKSHUKA ! And said it was Taim meod ... https://t.co/pyZ82ToccN	1430745414	595215525778726912	f	shukanyc
Back to HOME  63rd & Broadway ! Open by 11:00 !  https://t.co/MU1of9uEmL	1430664556	594876382385152002	f	shukanyc
@boredis89 46th & 6th Av !	1430493774	594160069194944512	f	shukanyc
Shabbat Shalom from the Shuka Team ! Today 46th St & 6th Av ! Sunday - Back to home - Upper West Side - 63rd St &... http://t.co/cNqDCkM6Hb	1430490889	594147971186429952	f	shukanyc
Shabbat Shalom from the Shuka Team ! Today 46th St & 6th Av ! Sunday - Back to home - Upper West Side... https://t.co/MnZ2f8XgMa	1430490832	594147731754622976	f	shukanyc
Quick change of plans! The Shuka truck will be parked today in FIDI - Hanover Sq! 11:00 - 3:00 ... https://t.co/eP2yeKWrd0	1430399655	593765308931911680	f	shukanyc
It's Beautiful Day for SHAKSHUKA from the Shuka Truck - Today @ 20th St & 5th Av  http://t.co/aBLkB2Doni	1430319205	593427873752555520	f	shukanyc
Tuesday is FIDI - Hanover Sq.              Come have a taste of our NEW special- Smoked Cauliflower,... https://t.co/3Lbg7S2bd4	1430235993	593078859790180352	f	shukanyc
Monday is 21st & 5th !! Don't forget to check us out at our NEW app - Shuka !\nHave a Great Sunny Day!! http://t.co/jYLKjMETY5	1430147171	592706314331136000	f	shukanyc
Monday is 21st & 5th !! Don't forget to check us out at our NEW app - Shuka !\nHave a Great Sunny... https://t.co/x3c70LvODv	1430147154	592706240314212352	f	shukanyc
RT @jeffpulver: Don't wait to live your dreams today.	1430096157	592492343732867072	f	shukanyc
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
Celebrate New Years Eve with Us !!  http://t.co/YHbJCrYe9T http://t.co/85XYlpJFTY	1419965480	550001205133737984	f	elpasotruck
http://t.co/YHbJCrYe9T http://t.co/KB24a8uHoc	1419888169	549676937963393026	f	elpasotruck
Make your reservations today : http://t.co/YHbJCrYe9T http://t.co/OUbTh45CWh	1419639881	548635544377643009	f	elpasotruck
I got your late Mothers Day present figured out right here!\n\nTickets to my night at the legendary @DeGustibusNYC\n\nhttp://t.co/h2u84wGgen	1431095561	596684148250640385	f	veganlunchtruck
@SullenJones should work in most recipes providing it's not too watery or heavily sweetened.	1431053751	596508785679667201	f	veganlunchtruck
Thanks @Google for inviting a wild old streetfood magician to turn your staff onto vegan yums from my new cookbook! http://t.co/HhJP38477A	1431026380	596393980515979264	f	veganlunchtruck
That time when @adamrichman gave me a trophy & then took a selfy looking all cute while I got wacky\ntbt @vendyawards http://t.co/V5pjxXsjZd	1431000098	596283748544544768	f	veganlunchtruck
@Victoria_Moran thanks so much for coming!  Sorry the names of our books are so similar! Publisher wouldn't let me get extra silly w/ title	1430909937	595905585989722112	f	veganlunchtruck
RT @_kate_lewis: I am sharing one more photograph to celebrate the @VeganLunchTruck StreetVegan cookbook that was... https://t.co/AVGSekZYF8	1430883540	595794868024250368	f	veganlunchtruck
RT @GrantCraft: Don't be afraid to fail. You have to keep trying. Inspiration from @VeganLunchTruck that philanthropy can learn from!	1430878106	595772074716717056	f	veganlunchtruck
Parked and serving food at 37 main st in Dumbo Brooklyn until 9:00\n\nInside the bookstore, I'm signing copies of... http://t.co/YgaQhQzWKL	1430862883	595708226634657792	f	veganlunchtruck
RT @NYMag: The Cinnamon Snail food truck will return for one night only: http://t.co/bunDdUdB1j http://t.co/Ea1YAz4kXY	1430836490	595597526809575424	f	veganlunchtruck
We are hiring a weekend driver/cook. \n\nMust have a clean drivers license & passion for vegan food.\n\nEmail:\nthecinnamonsnail at gmail dot com	1430827113	595558197416599553	f	veganlunchtruck
RT @timdonnelly: From Fri: brown sugar bourbon glazed seitan from the @veganlunchtruck cookbook. The most delicious... https://t.co/CoQ0wOtKh1	1430764742	595296594083356672	f	veganlunchtruck
Cinnamon Snail Cook Book COMES OUT TOMORROW!!!\n\nJoin me tomorrow night at powerHouse Arena\n37 Main St, Brooklyn... http://t.co/D1p3X6bFwI	1430748282	595227555935969281	f	veganlunchtruck
RT @Gothamist: Cinnamon Snail Truck To Be Resurrected In DUMBO This Week http://t.co/64aLiizhyA	1430689065	594979178799362048	f	veganlunchtruck
Oh word, Bourbon Hazelnut Pancakes?\nThe recipe is in our cookbook, which hits the shelves TUESDAY!\n\nPre-order the... http://t.co/uMZTbL6jOw	1430512000	594236517561856000	f	veganlunchtruck
RT @glennfrancogle4: Street Vegan: Recipes and Dispatches from The Cinnamon Snail Food Truck, Sobel, http://t.co/vpoj17xNLw http://t.co/jiv...	1430510510	594230266673115136	f	veganlunchtruck
@ChefSobel it's awesomely silly right?  They used your bio for a demo I did at a vegfest last year calling me the king or porc.	1430505375	594208727173062656	f	veganlunchtruck
RT @BrianLehrer: Here's @ilyamarritz (top left), @SeanBasinski (top right) & @VeganLunchTruck (bottom) talking mobile food permits. http://...	1430498856	594181385730007040	f	veganlunchtruck
If you missed me on Morning Edition today, tune in to 93.9 around 10:20 or so to catch me on Brian Lehrer talking... http://t.co/kKgRQpftp0	1430489266	594141163294171136	f	veganlunchtruck
Guess who is gonna be on @BrianLehrer tomorrow?\n\n@WNYC at 10:20 chef Adam Sobel will talk about the dark side of NYC food truck politics	1430417699	593840990538072064	f	veganlunchtruck
Our Cook Book Drops 5/5!\nOrder a copy: http://t.co/xF89SqTvyQ\n\nor join me for a signing in Dumbo\nTruck will be there!\nhttp://t.co/RADQCS8JAj	1430319824	593430469573771264	f	veganlunchtruck
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
Open @ Bergen St and Court St now!	1431171597	597003066840342528	f	carpedonutnyc
!!! Our shop open Sat & Sun 9am-6pm w/food & Treats!! 521 Court st brooklyn	1431172049	597004963190067200	f	thetreatstruck
Sugar on snow all day @smorgasburg - check out the magic !!	1431175967	597021395864973312	f	snowdaytruck
@EatStTweet @MobileCuisine straight from NYC, follow our truck for updated location today!! (Hint hint) ;)	1431178044	597030108336001024	f	disosnyc
@worldfoodtweets follow our truck for our location today!! Hint hint :)	1431177993	597029894678183936	f	disosnyc
@ArizonaNewsnet follow us for our secret location today!! (hint) (hint) ;)	1431177949	597029710179110912	f	disosnyc
RT @NYBG: Did you know puffed cereal was invented right here at NYBG? Science Talk: http://t.co/cl6i57PwMO http://t.co/vNu8FIYNOr	1431178978	597034023202979840	f	gcnyc1
RT @NYBG: This Weekend: Get the full program schedule for our Mother's Day Weekend Garden Party! http://t.co/hshe9yOCcY http://t.co/AKl7xrK...	1431178972	597034000885100545	f	gcnyc1
It's Curry King's cuisine in the Bronx!\nNY Botanical Garden: Mother's Day weekend. http://t.co/dqeIKPULKh	1431176690	597024427147194370	f	mausamnyc
@IntrepidMuseum thanks for the follow!! We're bursting with patriotic pride over here! 	1431177767	597028945717010432	f	usafoodtruck
RT @StacyBrody: His TRUCK was the 1 PLACE to eat in NYC vegannoms Learn to cook from @VeganLunchTruck https://t.co/auetzFDKPE via @sharet...	1431177331	597027117101142017	f	veganlunchtruck
We are chilling out at @Driftwooddc for there open house today from 10-2pm.	1431179469	597036085022068736	f	andysitalianice
RT @gcnyc1: We're Rockin' the Cheese today @NYBG w/ @AndysItalianIce and @souvlakitruck and many others Today & Tomorrow \nComeToTheCheese...	1431179354	597035601041301504	f	andysitalianice
Who is hanging with us today at the @NYBG and @gcnyc1 @nycfoodtruck from 10-5pm today.	1431179342	597035552794247168	f	andysitalianice
We're Rockin' the Cheese today @NYBG w/ @AndysItalianIce and @souvlakitruck and many others Today & Tomorrow \nComeToTheCheeseYo daBronx	1431179120	597034620748734464	f	gcnyc1
Hi\nWe are @ Yankee Stadium\n11-5pm\nCorner of River Ave & 158 St\nIn The Bronx\nCome to see us if you near by\nBudapest  http://t.co/0bVvsWNW4Q	1431179531	597036342896402432	f	langostruck
Having fun making Arepas smorgasburg N7 and river side Williamsburg https://t.co/Y6emKn8RNy	1431179723	597037148697661440	f	palenquefood
RT @gcnyc1: We're Rockin' the Cheese today @NYBG w/ @AndysItalianIce and @souvlakitruck and many others Today & Tomorrow \nComeToTheCheese...	1431180256	597039384312025088	f	souvlakitruck
@mrssala have been posted.	1431182090	597047075650412544	f	waffletruck
De CARTS 2/2:\nKotmadam @ 24th & 5th Ave til 8pm\nBierbeek @ De Great Lawn, Central Park til 7pm	1431182066	597046974987145216	f	waffletruck
De CARTS 1/2:\nGoesting @ 66th & Bway til 8pm\nPagadder @ Brooklyn Bridge/City Hall til 7pm\nVedette @ 59th & 5th Ave til 5pm	1431182045	597046887401656321	f	waffletruck
De TRUCKS:\nMomma Truck @ Park Slope (Carroll Street and 7th Ave) til the 4pm\nKastaar @ 86th & York Ave til 4pm	1431182022	597046792534958081	f	waffletruck
WAFEL WEEKEND!\nLe Cafe @ 15 Ave B & 2nd St til 10pm\nWafel Cabana @ 35th & Broadway til 10pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1431181911	597046326744862721	f	waffletruck
Hey @dadaMISLA our Bryant Park kiosk is closes at 10pm every night, 9:59pm to be precise!	1431181847	597046059240534016	f	waffletruck
Happy weekend! You can find the truck @NYBG all weekend for the MothersDayGardenParty, & the shop is open 10-6 for your brunching pleasure!	1431181732	597045576098848769	f	morristruck
You can snag a copy of our cookbook Street Vegan TODAY from your favey local bookseller, and make Mother's Day... http://t.co/hOCokrRFTP	1431180741	597041420319510528	f	veganlunchtruck
Get up close and personal with our Notorious Kimchi Waffle Fries. They'll bite but you won't mind.... https://t.co/LA42g1dnNO	1431185130	597059829895720960	f	korillabbq
RT @ClaudeF: I'm at @KorillaBBQ in New York, NY https://t.co/r5V5w4XlJ0 http://t.co/1FR0cMObXd	1431184250	597056138077728768	f	korillabbq
RedHookLobster is in Fort Greene today, shouldn't you be @bkflea ? http://t.co/0AqRvIwZfd	1431183934	597054809687117824	f	lobstertruckny
At the market for some sugar on snow!!!!! Come get itttt http://t.co/wdXkRL0jhv	1431186064	597063745525940224	f	snowdaytruck
Soho Saturday on Spring and Mercer til 4pm. Shopping snd steaks!!!	1431185884	597062992103120896	f	philssteaks
GRAB OUR COOKBOOK STREET VEGAN TODAY SO YOU CAN MAKE FIG PANCAKES w/ CHAMOMILE ORANGE SYRUP FOR MOTHERS DAY BRUNCH! http://t.co/nMVPqkYLvF	1431185746	597062413251317760	f	veganlunchtruck
For one free dinges, what is your spirit animal & why? dinges dingesforeveryone http://t.co/qthBpoBFzY	1431186600	597065991609155584	f	waffletruck
Betsy at NYC Botanical Garden in the Bronx. LIC flea is open in Queens at 46th ave and we've got the Garment Dist at 39th and Broadway. usa	1431187033	597067810548883456	f	usafoodtruck
When you want to succeed as Bad as you want to Breathe , then you'll be Successful . http://t.co/jrJti0cAJZ	1431186656	597066228159672320	f	shukanyc
IceCreamWeather nothing better. dinges http://t.co/QoXmc27bQy	1431187342	597069106974740482	f	waffletruck
Wow what?? It tastes soooo good are you f-ing kidding me!??? I want to eat this for 3 meals a day - some sugar on snow rxns	1431187659	597070436137054209	f	snowdaytruck
RT @Dave_Ockrim: Don't let the weather getcha down, we're still slangin the best chicken in town! @USAFoodTruck @licflea @UrbanSpaceNYC YD...	1431188366	597073400885018624	f	usafoodtruck
Hey NYC! We're everywhere today! First off come see us at @licflea Long Island City Flea and Food!... https://t.co/m9BKPn8aeP	1431188086	597072224445665280	f	usafoodtruck
RT @mattpaheenan: New Zealand pies in the Bronx! Kia ora @dubpies! @nybg http://t.co/kPj1AtEF63	1431190653	597082992272617472	f	dubpies
RT @arebee: @DrPizza @clutternkindle bow you're in the big smoke, visit @dubpies for me	1431192461	597090574580195328	f	dubpies
Need a good reason to go to MidTown? How about RedHookLobster & GarmentDistrict http://t.co/JWeyKE7qUc	1431191127	597084981203206144	f	lobstertruckny
Who knew the BrooklynBridge is a great place to catch a movie! Don't forget your ItalianIce ! http://t.co/JzDo8NZio8 AndysItalianIces	1431196523	597107613709508608	f	andysitalianice
Ancient Greeks and Their Weather Knowledge via @GreekReporter http://t.co/rx5OlpjqvA http://t.co/EO6pLkudqs	1431195329	597102605777641472	f	souvlakitruck
HAPPY MOTHERS DAY!!!\nTODAY SATURDAY MAY 9TH \nWE ARE OPEN FOR DINNER \n3PM-11PM\nMI VIEJO SAN JUAN \n2920... https://t.co/dnVZPdYlGu	1431196142	597106014215917568	f	latinkitchennyc
RT @TheCrankyFan: Watching a million games at once.. (at @ShortysNyc in New York, NY) https://t.co/Cf64JQubKm	1431195577	597103646371880961	f	shortysnyc
RT @The_Apocalisa: My best RTs this week came from: @YesMaryBeth @mactruckny @ChefDomTes @limel232 Powered by SumAll Insights http://t.co/K...	1431196392	597107062275997698	f	mactruckny
The American Dream by Yankee Stadium http://t.co/2jAvtdBmvc	1431198468	597115772071256066	f	langostruck
Ladies and gentlemen once again! I present our all-American chicken tenders club! Come and get it... https://t.co/Eo9OCQA0L6	1431198613	597116380715032577	f	usafoodtruck
Delicious Steak Tartare traditional AmberSteakHouse Greenpoint http://t.co/PTnoGH4Akb	1431205129	597143708191055872	f	polishcuisine
@rafasando14 ill be in touch buddy	1431208608	597158301797842944	f	mactruckny
It's official! Bian Dang will be back on 53rd and Park on Monday! See you there!	1431211303	597169606868934656	f	biandangnyc
Here's handsomeboyvegas with us today at the Botanical Gardens! How'd you like that tender?! ... https://t.co/G3krHUTr37	1431209619	597162540456607745	f	usafoodtruck
http://t.co/PXYe72Pj4L Catch us over the... http://t.co/DN6gzUJ7eS	1431211430	597170139251879938	f	domotaco
RT @cdelafresh: @DiSOSNYC Headed to see ya'll after this game is over!!!! GreatFoodTruckRace	1431225171	597227774189834240	f	disosnyc
lakehavasu Disos is now parked across from island mall brewery. foodtrucks. Here till 9:30.. Big red truck!!! Best Italian!	1431220782	597209364953473024	f	disosnyc
Disos parked across the street from island mall brewery parking lot. Look for the big red truck..	1431220592	597208565305253888	f	disosnyc
@JulianCreates thank you!	1431213945	597180686722846722	f	milktrucknyc
RT @JulianCreates: TheFoodBuddies at it again. This time at the Smorgasburg. Thank you @MilkTruckNYC https://t.co/Y6CihMIq4A	1431213936	597180647833210880	f	milktrucknyc
RT @gemfatale: Heavenly grilled cheese for lunch from @milktrucknyc at smorgasburg food market  https://t.co/cjIcCB1av3	1431213923	597180596205522944	f	milktrucknyc
RIGHT SIDE \nOK LOUNGE foxwoodcasino \nWe here!! 135am https://t.co/Zku6lfSHu0	1431235440	597270844927254528	f	latinkitchennyc
LEFT SIDE OK LOUNGE foxwoodscasino  \n130am https://t.co/NlXKrzAg3V	1431235395	597270653851566081	f	latinkitchennyc
laindia \nfoxwoodcasino \ndjluchony live\n after party ok lounge foxwoods conneticut https://t.co/VKmtv90QXd	1431220157	597206742410338304	f	latinkitchennyc
INDIA \nfoxwoodcasino \nDJ LUCHO LIVE\nAFTER PARTY OK LOUNGE IN THE CENTER OF FOXWOODS CASINO https://t.co/vwd2yndXZ6	1431219460	597203817902505984	f	latinkitchennyc
2NITE\nDJ LUCHO LIVE WITH LA INDIA Y GILBERTO SANTA ROSA AT FOXWOODS THEATER !!!\nAFTER PARTY AT OK... https://t.co/Z4FtBJ3SKL	1431218566	597200067523653632	f	latinkitchennyc
De TRUCK UPDATE:\nKastaar @ Astor Pl & Saint Marks Pl til 10pm\nMomma Truck @ Christopher St & 7th Ave til 10pm	1431217002	597193507632066561	f	waffletruck
@biggayicecream madmaplelove	1431235880	597272690605563905	f	snowdaytruck
Loving on @BuzzFeed for including us in their roundup of the top street foods that will change your life. EATMOR http://t.co/uvvlrBDwoh	1431222141	597215064442204160	f	morristruck
@AronGalonsky sure! \nSun:63rd St & Broadway. \nMon: 21st & 5th Av \nTue: FIDI-Hanover Sq, \nWed: 21st & 5 av  , \nThu: 46th & 6th,\nFri: 46 & 6th	1431213182	597177486993182720	f	shukanyc
The Red Bank farmers market isn't starting this weekend, but we will start being there every Sunday again later this month.	1431213023	597176817804550144	f	veganlunchtruck
Truckopen at Bergen and court street. Come!!!	1431255774	597356128566177792	f	carpedonutnyc
!!! Happy Mother's Day!! Hooray for all our wonderful moms!! Have a great day, everyone !!!	1431260519	597376032350547968	f	thetreatstruck
At the Red Hook Pound, all take out orders will be served from BigRed today.	1431261927	597381938064809984	f	lobstertruckny
HAPPY MOTHERS DAY! Today we are scooping it up @NYBG with @souvlakitruck @gcnyc1 come chill with us and your mother. http://t.co/tBX5KBQomd	1431263965	597390486060437504	f	andysitalianice
Happy Mothers Day\nHere we go Upper East Side\n86St. & Lexington Ave\n11-6pm\nMothersDay NYC foodtrucks smokinghot http://t.co/u6Jy1Hrn6c	1431265278	597395994079268864	f	langostruck
Curry King's cuisine to celebrate Mother's \n@NY Botanical Garden. Enjoy authentic Indian savory flavors http://t.co/LBZioTD0Z1	1431263588	597388905948798978	f	mausamnyc
Sweetery wishes all of the outstandingly fabulious Mom's a wonderfuly Happy Mothers Day. CheersToYouMoms	1431265102	597395254141124608	f	sweeterynyc
Our next service is Wed in Dumbo. New school thurs and Harlem Eat Up followed by Prospect Park (sat/sun) - come eat with us this wk!	1431266300	597400280918061056	f	snowdaytruck
We will be off the streets over the next few weeks as we are touring our food across the country.. We hope to see... http://t.co/QxurH53buU	1431266746	597402148545175552	f	disosnyc
We love mom Shower her with petals and kimchi @NYBG Mother's Day Garden Party 11-6pm	1431266562	597401378500288513	f	kimchitruck
To all our moms grandma's and godmoms! http://t.co/rX0WJdHpmr	1431269330	597412987473887233	f	mtblls
GOODMORNING BRONX NY!!\nHAPPY MOTHERS DAY!!!\nWE ARE OPEN FOR DINNER \n3PM-9PM\nMI VIEJO SAN JUAN\n2920... https://t.co/HrMcrPpPHn	1431271905	597423790528851968	f	latinkitchennyc
BigRed is parked at 284 Van Brunt Street in Red Hook infront of the Pound because we know you cannot get enough lobster.	1431272122	597424697979047936	f	lobstertruckny
RT @NY_Places: More buzz for Prospect Park: http://t.co/Kkt3l62tUv - RT @SnowdayTruck Our next service is Wed in Dumbo. New school thurs an...	1431270417	597417545893879808	f	snowdaytruck
After all the sandwiches moms made you, isn't it time to return the favor (and buy her one)? Sandwich shop 10-6, truck @NYBG 11-6!	1431272202	597425033267585026	f	morristruck
Up & Ready for a new Week ! SUNDAY is 63rd & Broadway! 11:30 - 3:00 !  http://t.co/JJG8O6ndSu	1431270454	597417704690159616	f	shukanyc
Up & Ready for a new Week ! SUNDAY is 63rd & Broadway! 11:30 - 3:00 !  @ 63rd St & Broadway https://t.co/BHnJ5yiOji	1431270359	597417304167677952	f	shukanyc
If you're visiting the @IntrepidMuseum today, you can also grab a frank and tropical drink! HappyMothersDay	1431273191	597429182122106880	f	papayakingtruck
RT @TFQfoodtruck: Beautiful day @Pier_13Hoboken with @AmandaBananasNJ @NautiMobile @PVPIZZATRUCK @mactruckny @Aroy_D FoodTrucks hoboken ...	1431273191	597429184110166017	f	mactruckny
RT @AmandaBananasNJ: Bring mom to @Pier_13Hoboken  to experience the best drinks, food & view! @Aroy_D @PVPIZZATRUCK @TFQfoodtruck @Lukes...	1431273187	597429166829633537	f	mactruckny
Happy Mother's Day to all mothers everywhere! Here's a portrait of Betsey Ross, who our truck is... https://t.co/Xhm3CxUvrS	1431272773	597427431029481473	f	usafoodtruck
We are here at the Intrepid 46 st at she west side Highway @greenboxny @FoodtoEat @foodNfest @Food Porn @Foodtrucks http://t.co/ybGUi7i95a	1431272816	597427608821837826	f	valduccis
RT @gcnyc1: @NYBG w/ @AndysItalianIce @souvlakitruck & a bunch more foodtrucks \nHappyMothersDay ComeToTheCheeseYo	1431276087	597441328700592128	f	andysitalianice
@crca bike race bear mountain ComeToTheCheeseYo	1431275763	597439968676577282	f	gcnyc1
@NYBG w/ @AndysItalianIce @souvlakitruck & a bunch more foodtrucks \nHappyMothersDay ComeToTheCheeseYo	1431275409	597438484295655424	f	gcnyc1
RT @AndysItalianIce: Who is hanging with us today at the @NYBG and @gcnyc1 @nycfoodtruck from 10-5pm today.	1431275314	597438088197971968	f	gcnyc1
RT @AndysItalianIce: HAPPY MOTHERS DAY! Today we are scooping it up @NYBG with @souvlakitruck @gcnyc1 come chill with us and your mother. h...	1431275291	597437990953230339	f	gcnyc1
Share a reason why you love your Mom, for one free dinges! Mother's Day dingesforeveryone http://t.co/caEfgoz2KE	1431275926	597440652020883457	f	waffletruck
@FreestyleChulo Thank you, together with Brooklyn Roasting Company we created a custom Wafels & Dinges blend.	1431274201	597433417869959168	f	waffletruck
RT @FreestyleChulo: The coffee with chocolate from @waffletruck is amazing! No sugar or milk needed. This time my coffee came from Madison ...	1431274106	597433019507548160	f	waffletruck
@MEGALODON419 Manhattan	1431274092	597432963689754624	f	waffletruck
De TRUCKS:\nKastaar @ Forest Hills, 71st Ave (in front of Duane Reade) til 9:59pm	1431273781	597431656295886849	f	waffletruck
De CARTS 2/2:\nKotmadam @ 24th & 5th Ave til 8pm\nBierbeek @ De Great Lawn, Central Park til 7pm	1431273757	597431555913588736	f	waffletruck
De CARTS 1/2:\nGoesting @ 66th & Bway til 8pm\nPagadder @ Brooklyn Bridge/City Hall til 7pm\nVedette @ 59th & 5th Ave til 5pm	1431273742	597431493712023552	f	waffletruck
Happy Mother's Day!\nLe Cafe @ 15 Ave B & 2nd St til 10pm\nWafel Cabana @ 35th & Bway til 10pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1431273721	597431406801870848	f	waffletruck
Check out this adorable Mother's Day celebration from yesterday! We're still here at the Bronx... https://t.co/CumNF1unxs	1431274901	597436355451428865	f	usafoodtruck
Come down to the Intrepid. Happy Mothers Day Ladies !!! http://t.co/bKC113Ek3e	1431274154	597433222759325697	f	valduccis
RT @TakumiTacoNY: Come visit us today at smorgasburg takumitaco tagyourtaco smorgasburg @ Brooklyn Bridge Park (Pier 5) https://t.co/blI...	1431274712	597435561658417153	f	eddiespizzany
Join me tonight at 9:00 on Twitter for a veganfoodchat. I'll be answering questions and being silly! \n\nhttps://t.co/9o3uipCHfl	1431274630	597435218686046209	f	veganlunchtruck
Happy Mother's Day! http://t.co/CNbj74piki	1431276989	597445113162375168	f	mexicoblvd
Lake Havasu we are ready for you. Serving up Italian Style Fish & Chips at London Bridge today. Looking forward... http://t.co/Ccli7H6Wj6	1431279440	597455394705903616	f	disosnyc
@AndysItalianIce says come chill with Your Mother @NYBG	1431278765	597452561495552000	f	gcnyc1
HappyMothersDay to all the moms out there!  Don't forget to hug mom 2day!	1431279460	597455475861540864	f	fritesnmeats
Today smorgasburg pier 5 Brooklyn bridge park until 6:00 pm beautiful day for a delicious arepa! https://t.co/4tE67x05Nt	1431279143	597454145818353664	f	palenquefood
@CookieMom0119 yes open at 1.. Awesome thanks!	1431281866	597465567918862336	f	disosnyc
Come down 1 o'clock London bridge for our Italian fish and chips challenge.. It's gonna be bonkers!!!	1431281028	597462052160966658	f	disosnyc
@CookieMom0119 for our 1 o'clock challenge yes	1431280951	597461732462702592	f	disosnyc
But of course! | Mykonos on List of 25 Places to Party Before You Die via @GreekReporter http://t.co/EdGDl2yflM http://t.co/pVghEghEHP	1431282045	597466320607825921	f	souvlakitruck
Thank you for making us a number 1 choice! 19 New York Street Foods That Will Change Your Life http://t.co/Osg6EjbjPE via @JMPoff @buzzfeed	1431281478	597463941359341568	f	waffletruck
Welp it's about as nice as it could get out here at Pier 13. Shout out to all the moms out there, we love you http://t.co/lek5FM7zuU	1431282893	597469876719112192	f	nautimobile
Red Bull Music Academy Festival New York 2015\n\nReturning to New York City for a third consecutive year, the Red... http://t.co/5nXFQQ5Cno	1431283579	597472754112270336	f	mtblls
MidtownEast get ready for tomorrow 47th bw Park & Lexington !!	1431284178	597475264667484161	f	polishcuisine
Happy Mothers Day!!! What a beautiful day!!! http://t.co/jQpU3qmXHK	1431284057	597474758037504001	f	polishcuisine
The Mtbll  is in Brooklyn at the Red Bull Music Academy Festival. http://t.co/MOy4OYZ889	1431285875	597482384758591489	f	mtblls
Another great day @IntrepidMuseum and @Yankees we got you covered nyc & to all the mothers out there HAPPY MOTHERS DAY ! GOT WHIZ?	1431284674	597477345830768640	f	carlssteaks
Another great day @IntrepidMuseum to all the mothers out there HAPPY MOTHERS DAY ! GOT WHIZ? http://t.co/OH9qEV1rpJ	1431284556	597476849875296256	f	carlssteaks
happy Mother's Day to all you wonderful Moms. we love you!	1431288018	597491373164593153	f	milktrucknyc
We like your whimsy @Reds - happy Mothers' Day http://t.co/HCIYfycGn7	1431289796	597498828762263552	f	snowdaytruck
Love to all the moms that can't spend this day w/ their kids - for any  of reasons, including those w/ kids incarcerated.	1431289727	597498540894584832	f	snowdaytruck
Big D & the crew would like to wish all the super mom's out there, a very Happy Mother's Day today and everyday! superwoman MothersDay 	1431292928	597511963674042368	f	bigdsgrub
RT @leslie_gambetta: Had a great lunch with @LaurarVeloso at @NeaExpress  yum pizza http://t.co/7D2kA2a1YM	1430384667	593702443545792512	f	neaexpress
RT @iamdanmichelle: Hell yeah!! waffle WaffleLove @waffletruck http://t.co/jApGHj4Y5e	1431303910	597558027902943233	f	waffletruck
Happy Mother's Day to all moms everywhere!	1431302874	597553681425391617	f	mamuthainoodle
@KristenCorpo Amen! I have faith in the innate goodness of people VeganFoodChat	1431307769	597574211532632065	f	veganlunchtruck
A3: If we want to create a world with less suffering, outreach (especially in the form of vegan donuts) is essential!   VeganFoodChat	1431307549	597573292036358144	f	veganlunchtruck
A3: Preaching to the choir isnt going to change the mainstream culture.   VeganFoodChat	1431307542	597573261719908352	f	veganlunchtruck
A2: we kept a @farmsanctuary donation tip jar on our truck.  Collected over $50k in donations to FS over the last 5 years! VeganFoodChat	1431307383	597572592548106242	f	veganlunchtruck
@thisBP I think it's even more effective to make non-veg food look normal, boring, & tired in contrast to exciting vegan food VeganFoodChat	1431307318	597572323282198528	f	veganlunchtruck
A2: You have to make activism yummy, fun & inclusive.  Being judgmental or elitist isnt going to win anyone over to veganism VeganFoodChat	1431307238	597571984327839744	f	veganlunchtruck
@kennysnider it was especially the case during the relief work we did after Sandy. VeganFoodChat	1431307046	597571180233621505	f	veganlunchtruck
@kennysnider Great point. that's one of the many reasons presenting our food on a track was so attractive to me. VeganFoodChat	1431307012	597571036339695617	f	veganlunchtruck
A1: lifestyle, we have to make it attractive, understandable, and affordable to everyone.  VeganFoodChat	1431306801	597570155087007744	f	veganlunchtruck
A1: Especially if we are working towards a world where more people accept and care about maintaining a compassionate\n VeganFoodChat	1431306787	597570096568082433	f	veganlunchtruck
A1: Vegan food shouldnt be exclusively available to people who can afford it, or who already understand the value of it. \n VeganFoodChat	1431306759	597569978896908288	f	veganlunchtruck
Gawwwww shucks. Thanks for having me y'all.  Glad you are loving the book.  Biggest homework assignment I ever did! VeganFoodChat	1431306622	597569403836878851	f	veganlunchtruck
@VegSweetSimple that's awesome!  I CAN'T WAIT TO SEE IT!  Please include your version so I can try it myself! &lt;3 VeganFoodChat	1431306445	597568658681012224	f	veganlunchtruck
oh yeah, and you dip the string in caramel and eat it.  duh VeganFoodChat	1431306284	597567983226093568	f	veganlunchtruck
We are helping him with yard work today, and I just made him and his family an extremely dope meal! VeganFoodChat	1431306238	597567792657866752	f	veganlunchtruck
@jillly_Beans our hours are 8am-10pm DAILY	1431352805	597763109634322433	f	waffletruck
Hey y'all.  This is Adam.  I am currently in the attic at yoga master Sri Dharma Mittra's house in Long Island.   VeganFoodChat	1431306236	597567782323146752	f	veganlunchtruck
A9: Also sour mango and cucumber served cut up on the street in south india with that wild farty tasting spice powder! VeganFoodChat	1431309559	597581721073274880	f	veganlunchtruck
@VeganFoodChat A9: vegan croisants from the Gentle Gourmet in Paris VeganFoodChat	1431309506	597581498288631809	f	veganlunchtruck
@Becky_R especially the ones from @taimmobile! VeganFoodChat	1431309459	597581301823184897	f	veganlunchtruck
A9: these aguaji paletas you can find in the jungle of Peru.  Made from Frozen aguaji & sugar. veganfoodchat http://t.co/wMap2fTkHV	1431309374	597580944250380288	f	veganlunchtruck
@VeganFoodChat A9: can I give a few? VeganFoodChat	1431309291	597580597947674624	f	veganlunchtruck
Q8:by tricking people into consuming marinated kale, kimchi and arugula on their korean bbq seitan.  trickedYou! VeganFoodChat	1431309031	597579507634176000	f	veganlunchtruck
Q7: trucks can serve a different community every day, so they are a unique exciting food option that people dont get sick of VeganFoodChat	1431308874	597578849031979008	f	veganlunchtruck
@VeganFoodChat Q7: NYC sees it! But the city govmnt is at war w/ street vendors.  Long terrible story.  @vendorpower VeganFoodChat	1431308816	597578605770715136	f	veganlunchtruck
A6:Also many simply prepared components make for a complex impressive end result. Garnishing w/ seasoned nuts &infused aiolis VeganFoodChat	1431308739	597578280456351744	f	veganlunchtruck
@VegSweetSimple my wife and kids need a 12 step program to get them off of freeze dried berries.  declaringBankruptcyNow VeganFoodChat	1431308617	597577771271987200	f	veganlunchtruck
A6: Keeping a balance of cooked & fresh flavors, textures, and bringing food to life with the right seasonings & fermentation VeganFoodChat	1431308543	597577461031899136	f	veganlunchtruck
A6: Start with really fresh ingredients, especially perfectly ripened produce.  VeganFoodChat	1431308515	597577344178638848	f	veganlunchtruck
@HealthyHobokenG I miss those early days.  No spot we ever served had a better view than Sinatra and 1st! VeganFoodChat	1431308485	597577215790944257	f	veganlunchtruck
Thanks you guys. It might be a moment b4 my next book though. I have a pretty exciting new food concept I am focussing on 1st VeganFoodChat	1431308438	597577017563971585	f	veganlunchtruck
@VeganLunchTruck mostly folks I know through the vegan blogshpere. I wanted a mix of pros and novice cooks to test VeganFoodChat	1431308336	597576589874995200	f	veganlunchtruck
A5: But damn, the recipe testing took a ton of time. Each recipe had to be tested by a couple different people. Some got axed VeganFoodChat	1431308243	597576199959924736	f	veganlunchtruck
A5:  -Chinese Steamed buns, poptrarts, kimchi dumplings, dope raw desserts, blintzes... VeganFoodChat	1431308192	597575987824619520	f	veganlunchtruck
A5: Doing the book offered me the opportunity to put things into a book that we werent able to serve on the truck. VeganFoodChat	1431308181	597575941007777792	f	veganlunchtruck
A5: VeganFoodChat	1431308157	597575842366099457	f	veganlunchtruck
A5: It was tough to choose.  I dont want this book to just be a ton of sandwiches and donuts. VeganFoodChat	1431308153	597575822984257537	f	veganlunchtruck
Nighty night.   Signing off now.  Ms. snail just made chocolate chip cookies, like whoa VeganFoodChat	1431310111	597584037000171520	f	veganlunchtruck
Thanks for having me tonight.  Y'all go get my book now, y'hear? &lt;3 VeganFoodChat	1431310059	597583817742884866	f	veganlunchtruck
@Becky_R confident.  We always crush them, and make them look like no one cares about non-veg food anymore.  It's exciting! VeganFoodChat	1431310008	597583604802289664	f	veganlunchtruck
We DO use her mallows, but we are just good friends & I have all kindsa news that I can tell her but not the whole world yet. VeganFoodChat	1431309929	597583271824756736	f	veganlunchtruck
Anyone got any other Qs for me tonight?  I got to go shortly (phone date w/Sweet & Sara ) VeganFoodChat	1431309829	597582853531181056	f	veganlunchtruck
Oh snap @Becky_R  I din't realize the LNU folks were on here tonight!  Namaste &lt;3  VeganFoodChat	1431309754	597582539784609793	f	veganlunchtruck
A10: I HATE POP MUSIC...  It's like Chef-Adam-Sobel-repellent for realz.  My ears start to bleed (donut glaze comes out) VeganFoodChat	1431309696	597582295680327682	f	veganlunchtruck
Serving at Hudson/King St 375 Hudson Street New York From 7:30AM-3:00PM EDT http://t.co/aR2bxNYVPT	1431344106	597726622159151104	f	sweeterynyc
47th bw Park & Lexington today. VeggieCombo Traditional	1431344850	597729744235401216	f	polishcuisine
Monday corner of 46th and 6th Ave, 12 to 4 Come by have a sandwich or a plate and get a free drink!!!	1431346281	597735744548012032	f	grillonwheelsny
!!! Mon, May 11th no truck today! Have a great day & see you soon!!!	1431348174	597743684441001984	f	thetreatstruck
RT @LizzieBartelt: Maple BBQ Tempeh sandwich from StreetVegan by @VeganLunchTruck! I made the fried pickles that... https://t.co/eocFgfBIJA	1431348353	597744433015164929	f	veganlunchtruck
D1 has landed at Hudson/King St. 11am to 2:30pm. Let's Grub! http://t.co/Acih6UfhYI	1431349571	597749544319848448	f	bigdsgrub
D2 has all your lunch special needs at 50th Street btwn 6th and 7th Avenue http://t.co/2zdhPnbdjn	1431349439	597748990030028800	f	bigdsgrub
Satisfy your cravings at 3 locations today: Jay & Water in @DumboNYC, popup restaurant at the AMEX cafeteria in FIDI & on 41st & B'way!	1431349474	597749135941488641	f	toumnyc
Hi \nWe're at 5 Ave/ 21street\nFlatiron\n11-3pm\n\nfoodtruck nyc mangalica schnitzel MidtownEast Europe	1431350441	597753191875371008	f	langostruck
RT @SimonSassin: LebaneseEats cravings @ToumNYC F.T. @DumboNYC, popup restaurant at AMEX cafeteria in FIDI & eaturban on 41st & B'way!...	1431350138	597751919948472321	f	toumnyc
Good mornings are good but great mornings have De Breakfast Special! Available 8am-11am DAILY dinges earlydinges http://t.co/UEp79xqQ8D	1431350871	597754994104885248	f	waffletruck
Guess whos back???????? 53rd and park... lesssssssssssssgo!!! http://t.co/6WGxb2yeVP	1431350716	597754345073938435	f	biandangnyc
52nd and 6 for lunch or catch our booth on 39th and broadway asiantaqueria urbanspacegarment	1431350789	597754652751302657	f	domotaco
Good Morning @Flatirnny ! Monday is your day ! 21st St & 5th Av ! Don't forget to load your SHUKA App !! http://t.co/gVydVTmsXg	1431350406	597753044743380992	f	shukanyc
Good Morning @Flatirnny ! Monday is your day ! 21st St & 5th Av ! Don't forget to load your SHUKA App !! https://t.co/fHKajMbbJ5	1431350261	597752438800646144	f	shukanyc
Happy Monday Midtown Fresh authentic Curries and bites to start yr week @47 Street Park & Lexington Ave http://t.co/qTpsR6LJNk	1431351366	597757073137471488	f	mausamnyc
Lunch 2day @ 50th st b/t 6th & 7th av. Burger of the week THE AO TRUFFLE BURGER. Preorder 9172929226 Midtown	1431351210	597756417798451200	f	fritesnmeats
Taking this sticky, summery day off. We'll see you tomorrow in DUMBO	1431352057	597759969396662272	f	kimchitruck
@apoll0nia keep calm, where are you? do you see any landmarks? can you smell wafels in the air?	1431352763	597762933427408896	f	waffletruck
De CARTS 2/2:\nVedette @ 60th & 5th Ave (Manhattan) til 7pm\nKotmadam @ 24th & 5th Ave til 9pm	1431352193	597760541914861570	f	waffletruck
De CARTS 1/2:\nGoesting @ 66th & Broadway til 10pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm	1431352166	597760429566201857	f	waffletruck
De TRUCKS:\nKastaar @ Queens College, On Kissena Blvd and 64th Ave til 9:59pm	1431352145	597760338860216321	f	waffletruck
Mmm Mmm Monday!\nLe Cafe @ 15 Ave B & 2nd St til 10pm\nWafel Cabana @ 35th & Broadway til 10pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1431352129	597760270996353026	f	waffletruck
Get ready for some schnitzi @Hanover Sq,lunch from 11-3 order online @www.schnitzi.com schnitzitruck schnitzel foodtruck	1431352283	597760917317758977	f	schnitzi1
Happiest of Monday Mtbll Lovers!   The  has stopped on 50th bet 6&7 Aves. Come on by for your favorite menu item!\n lgr 	1431352932	597763640964620288	f	mtblls
RT @mokbar_nyc: Chef @choibites is at @TerroirTalk w @KorillaBBQ! Serving up Gochujang Pork Tacos w Korilla sauce for lunch today! Terroir...	1431353566	597766300866322432	f	korillabbq
Hope you had a great Mother's Day weekend! Back to the grind. 47th between Park/Lex 11-2	1431353294	597765160950960128	f	philssteaks
Happy Monday! Catch the truck out on 52nd & 6th or our @UrbanSpaceNYC booth on 39th & Broadway today	1431353644	597766628353417216	f	domotaco
Happy Monday folks start your week w a carls famous cheesesteak 52nd st bet 6th/7th Av @Barclays @SIRIUSXM @SiriusXMNFL  @MHFI @UBSamericas	1431354105	597768561940135936	f	carlssteaks
RT @dumbolot: We got @dubpies @MexicoBlvd and @ToumNYC today!	1431354762	597771315043540992	f	toumnyc
RT @MzFuN_SiZ3d: Tried @BrooklynPopcorn for the time today and it was AMAZINGGG 	1431354821	597771561651830784	f	brooklynpopcorn
No truck today but catch us @UrbanSpaceNYC @GarmentDstrctNY broadway btw 39 & 40th 11-9! eaturban	1431355280	597773487990820864	f	sweetchilinyc
RT @livefastgroup: Today @IntrepidMuseum we are bringing in the best food trucks in NYC.10am-5pm @USAFoodTruck  @PapayaKingTruck @DeliNDogz...	1431355284	597773506936500224	f	papayakingtruck
@ElliotD224 no more truck elliot.  looking for new shorty's locations.  you can always call us for a delivery or stop by if you can.	1431354920	597771980419538944	f	shortysnyc
RT @dumbolot: We got @dubpies @MexicoBlvd and @ToumNYC today!	1431355229	597773276031668225	f	mexicoblvd
Happy Monday everyone! Stop by Eddie's pizza truck and have yourself a hot, fresh pizza or sandwich. We are... http://t.co/rKdaVtpcQg	1431355266	597773428863737856	f	eddiespizzany
RT @dumbolot: We got @dubpies @MexicoBlvd and @ToumNYC today!	1431355756	597775486174003200	f	dubpies
We are on 52st and 6av!	1431356318	597777840772382720	f	chefsamirtruck
Hola Dumbo! guacamole&chips @MexicoBlvd @dumbolot Water&Jay	1431356809	597779902390206464	f	mexicoblvd
FiDi We're back!! See you on water and broad!  itsfalafeltime	1431356989	597780657864073218	f	taimmobile
Open & ready to roll until 2:20 today on 47th b/w Park & Lexington VeggieCombo traditional PolishTruck nyc	1431357443	597782560287158273	f	polishcuisine
Beautiful day...\nG1- :( off road for service\nG2 - Broadway /55\nComeToTheCheeseYo	1431358305	597786178704830464	f	gcnyc1
totally vegging out on a monday with a kale & quinoa bowl  http://t.co/i0yNTWDRUD	1431358604	597787431941844992	f	mexicue
We are open ready to serve you, always with a smile! ! 52st and 6av	1431358559	597787241805717505	f	chefsamirtruck
Goodmorning we r ready 2 serve @47th st. Park and lex ave.try our BBQ RICE BOWL! And spicy chicken rice platter. PlZ come by and enjoy Thx	1431358418	597786652233375744	f	bobjotruck
For one free dinges, as a Dinges Idol contestant sing your dinges to the tune of your favorite song! dingesforeveryone AmericanIdol	1431358968	597788958144077824	f	waffletruck
Dankuwel!! https://t.co/rxsQHQWJr4	1431358947	597788869648515073	f	waffletruck
Today's special Panuozzo with homemade Burrata cheese, prosciutto Di Parma,baby arugula, shaved Parmesan and truffle oil ! Come taste it 	1431358816	597788321897648128	f	pontirossifood
Not on the streets today, but lots of love @BklynBrdgPark- AirbnbBKHalf W-F & @BRICartsmedia party Thurs! http://t.co/XvYCJZgXFv for more!	1431359036	597789243423993856	f	morristruck
Hey guys, we will be on Charlton & Varick today.	1431359640	597791776355786753	f	schnitznthings
We are now open on Broad St and Water come cool down with a ice or smoothie @nycfoodtruck @grubstreet @StreetGrubSteve	1431360796	597796623733956609	f	andysitalianice
Now serving 47th and Park!	1431360682	597796144828325888	f	korillabbq
Hey guess who just made @eaterny HeatMap? Your old pals at RedHookLobster! http://t.co/KfoivNaSmv	1431361336	597798890235125760	f	lobstertruckny
Betsy is at the Intrepid 46th st and 12th ave and you can come check out our market at 39th and Broadway from 11-9.\nMurica nyc streetfood	1431361501	597799582509182976	f	usafoodtruck
We had such fun last Thursday handing out cupcakes from Food Network Magazine's Travel Truck! Here's a close up... http://t.co/s1qPOvENlh	1431361728	597800533647171584	f	sweeterynyc
Congrats to our fellow Korean bro @ChefAntonioPark for winning the @TerroirTalk Outstanding Chef!  Terroir2015 KoreanChef	1431362587	597804136978116609	f	korillabbq
Lovely day for some Colombian arepas. Come visit us at our meat-packing district location.  @GansMarket	1431362480	597803689647026176	f	palenquefood
RT @ColonelTamar: @KorillaBBQ Terroir2015 You're 1! You're 1! Fantastic, simply prepared, flavors shine through.	1431365303	597815529068490752	f	korillabbq
RT @IcePopArt: @korillaBBQ @terroirtalk Terroir2015 yum! https://t.co/no3npMi2GG	1431365104	597814691923099648	f	korillabbq
RT @TerroirTalk: Awesome food @KorillaBBQ - Way to go team swallowdaily Terroir2015 community hospitality culture... https://t.co/laW6DbM...	1431365087	597814624466116609	f	korillabbq
Chef @choibites' Gochujang Pork Tacos w Korilla sauce, kimchi, pork cracklings! Photo @articulateeats Terroir2015 http://t.co/06MmvkTK5e	1431365068	597814543927107584	f	korillabbq
RT @articulateeats: TerroirSymposium TerroirTalk Terroir2015 \nA little taste from our friends south of the border, New... https://t.co/AFp...	1431364894	597813813543628801	f	korillabbq
Founder EddieSong + Chef @choibites repping NYC StreetFood at @TerroirTalk Terroir2015 w Korean Pork Tacos! http://t.co/Nu4vitHswp	1431366247	597819489468710912	f	korillabbq
RT @ChoppedCanada: Please join us in congratulating @ChefAntonioPark on receiving the Outstanding Chef Award at Terroir2015 http://t.co/2K...	1431365970	597818327747186688	f	korillabbq
RT @ColonelTamar: @KorillaBBQ @IcePopArt @articulateeats @TerroirTalk we need 2 steal u 2 Baltimore. Husband would like ur pork taco 4 lunc...	1431365838	597817771481702400	f	korillabbq
Thx @IcePopArt @articulateeats @ColonelTamar for joining us at @TerroirTalk Terroir2015. Honored to be repping NYCFoodTrucks koreantacos!	1431365659	597817023117266946	f	korillabbq
We are still open till 5 PM on Broad Street and water. Have you tried one of our fresh fruit smoothies yet?	1431368893	597830587156533248	f	andysitalianice
Nuchas truck in NYU! West 4th Street & Washington Square E!	1431372703	597846565110317056	f	nuchasnyc
The day continues at NYU - W. 4th and Greene is where it's at! Rocking til 7ish come through.	1431373255	597848879745343488	f	philssteaks
Thanks for coming! See you tomorrow MidtownWest \n52nd b/w 6th & 7th Ave nyc traditional PolishTruck	1431374110	597852467875999744	f	polishcuisine
@blcksage_ in a way that's OUR free dinges!	1431373991	597851966983774209	f	waffletruck
We are gathered here today to witness the union of apple, cranberry & nutella. Taste the sweetness! http://t.co/2ta5fx6FHf	1431375000	597856198684254208	f	nuchasnyc
Attention! We couldn't grab de usual spot today. Thank you @memrose_ https://t.co/YuLJu82U6Y	1431374708	597854977449668608	f	waffletruck
Curry King now serving dinner daily @Roosevelt Island. Enjoy authentic Indian cuisine http://t.co/bBmqkJcBI8	1431376168	597861098583420928	f	mausamnyc
Cool! 19 New York Street Foods That Will Change Your Life http://t.co/k5zr0Uk66k via @JMPoff @BuzzFeed KoreanTacos http://t.co/GDdjiUIH5v	1431375887	597859920613134336	f	korillabbq
Looking for a reason to grab an ItalianIce and visit the museum this spring? Then check our this great exhibit! http://t.co/ewyWuvdAhq	1431376527	597862605236129792	f	andysitalianice
Happy Monday everyone!! If you missed us at the Intrepid today we're at urbanspacenyc in... https://t.co/TbAiWVpem0	1431378334	597870185454895104	f	usafoodtruck
RT @mattrestivo: @MexicoBlvd @dumbolot jealous. cant wait til tomorrow.	1431382086	597885921988448256	f	mexicoblvd
RT @Rooseveltisland: GREAT NEWS, @MausamNYC Indian Food Truck Serving Roosevelt Island Weekdays 5 To 8 PM - Give It A Try \nhttp://t.co/uOZ5...	1431385133	597898699445030912	f	mausamnyc
In Union Square for the night. Come ice down with us.	1431385510	597900284246028289	f	andysitalianice
@janeebruce communications@drivechangenyc.org - thanks!	1431386805	597905712929513472	f	snowdaytruck
RT @ShortysTrivia: Ok so it's official. 1 more week of Trivia this week and then the CHAMPIONSHIP will be Wed 5/20 @shortysnyc Pearl 9pm!! ...	1431386810	597905736904081409	f	shortysnyc
Looks like these guys need some Spirit of '76 sauce! Chicken tenders, fries and Spirit of '76 sauce.... https://t.co/vxINQMJ7xy	1431388038	597910884493713408	f	usafoodtruck
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

