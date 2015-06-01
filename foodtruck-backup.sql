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
526e8aee11d299d16e74b447	/67629862_ZPeS1alTFabw1hPqq8PCcGF1SRFynqA23OgkKg8yc00.jpg	public	lovemamak	\N
51c1ea41498e372d91835cf9	/5067950_pSXIZo_RqO8Hh5AuWcomjr0p3q_pXPUMWe99W8hUGTU.jpg	public	burgersandbites	\N
51a79983498e3044671cd784	/1441492_yfySwml4ChzJ_ni5DxTq-8n2UlecWBWjgxR-ygA6pYc.jpg	public	burgersandbites	\N
521b83c411d29ec0512f89b3	/255980_1U9yRWzBKuIDLReBhmBs45qJ0mtHu7pzL_Fv4T9gTss.jpg	public	lovemamak	\N
51645882e4b0bcb0cb0c7ef3	/7511393_dEJJLGO8ljFPMA_kFidoz1wpWZ-k6mHpqYnuRwoBpRg.jpg	public	philssteaks	\N
52fe5db111d2d7644f04c21e	/404119_k2pARWK6AW8sOni-GGVsAfTehHeRbbnRCBGhfeb1xZc.jpg	public	philssteaks	t
507071bfe4b06e882e74b445	/1112203_qnT5k-31-4cRKDz00cUpp7Ia7HG3YTjhsC9Udo90RDI.jpg	public	philssteaks	\N
501c284be4b07d0ab63e08be	/vQv8P8_hFNwHMmpR7k6-arr8zqYmmgoSG_aAPJuz-ws.jpg	public	itizyicecream	\N
51e83b4a498e0a1c64e62828	/26624_AGoljLki5SS-GJGKaAGB75mloHKRBkJ1Qj5BQCRP1_Y.jpg	public	itizyicecream	\N
5180207390e7374e46b6c165	/49563206_uKsSD-Cd2jjy6FMyR9U_--7DdUBJ7ZUxtdlushxyIAg.jpg	public	freshandhearty	\N
535d6fe9498eeb428f0a49a5	/643701_B0msQNcQCClAiTuYbiNnskLICf99ehNmerkWdhYNR8c.jpg	public	snowday	f
533ddd9a498ebf7fb4775ca2	/36814481_r4TU0Q7tJ6Xum58iZ5olLRY6sV-P4dN3psrhw2ZZKZ8.jpg	public	snowday	f
525b3a3711d2040fdcbd6fee	/52031712_DN0C9vfm3iv1geUuFX92Pt0jwgl8NhbGokLj_o0Ebjg.jpg	public	mooshugrill	\N
54978669498e92fb4a6b4341	/97520198_KIqmbmLkuFxboBU_HjFosEOXtwVA01QnxiBHugrwImE.jpg	public	shukanyc	t
511d2c60e4b017a4221bec0c	/1425622_srSMuVL9KOV8rqb_UDiSQNwjvNOtMyF-zeTO7sHRZZo.jpg	public	nuchasnyc	f
4ffef65ae4b013ea5f373be1	/VqxEh6cK784gtMOJRF6Lnub985jBJPC6-FuwZwXt_y4.jpg	public	nuchasnyc	f
50ef1f18e4b0710a5e5cb1eb	/117715_4lM2ZgzHp4Uv61-ckuWzdXXXcPVNEH2NjISpWAEjGds.jpg	public	nuchasnyc	f
4fd0f054e4b0757383b97c0f	/MbR1inb3VKXu0PQMsCkHkHGftYq0E8CDbYG3BLRRGaE.jpg	public	thecrepestruck	\N
51dd9ddc498efb9a3437e123	/4501533_djr9d2BEP8dg7E48xJjJTa_Yjk0Iy-MmBG6hgIQBLUs.jpg	public	bigdsgrub	\N
4e4e92c7b0fb088f3c0f14d5	/HTLXSW2D30RGIEYPI0JGR22LUCS5BTXQ0LXDWAOHH4PCVHM4.jpg	public	bigdsgrub	\N
513101fce4b006d9c4991bdc	/17248619_XfpmI8dNgmoeHE3BXjV8bL2yuuMTqxU3FqDr4BqX7Ks.jpg	public	bigdsgrub	\N
4fa2d04de4b0489ba3d7936d	/hsPbM0G5l3AsUaI3x6r_VkiSYo4pYlWTKK2S9zqh_KE.jpg	public	bigdsgrub	\N
51d31ab97dd28a271207af20	/59958053_5CogfmHgRpBtjkPzVkAgAjK7q9ac0bo8Z1TPwxPIFAw.jpg	public	grillonwheelsny	\N
52a0bef911d299250c89f9c7	/349672_Cg8dtcrfQ0WZeSo7BJR61YBG6VzsiMltZP8XIqyHiu0.jpg	public	mrniceguytruck	\N
529ccbc511d21047117cdea2	/68150__CRf8sW9KvXZTkcAQEc4EsnYPgqXA2trmMxy-_AzobY.jpg	public	mrniceguytruck	\N
51c8a3c5498e797153ec5629	/46314126_95x6AErCZEGSi1zGZrFCY-EzgsIMyOhgO4G59l-u_Xg.jpg	public	funbunsnyc	\N
5212ec18498e9494b634a94c	/814104_tUkLgiQ8zcYxovra9R8PIx7FckFhBjzNVHmirteXd58.jpg	public	funbunsnyc	\N
5176cceb498efe500552cc9e	/21735785_zaQs-7anNinrrQlobBV2AjNxquTXs5g8ZY0NxvoxvHo.jpg	public	steaksncrepes	\N
523b2edc11d265bf373f82a0	/8853695_cjpq3trk4bFpcU1oHWwj4XxwwD9ZI169sNncUyOQoM8.jpg	public	steaksncrepes	\N
526fef71498e92d1ace459d9	/60805368_eCRrBwapYrNL8fM9tmIaLCfnlhQYb9ASU-ZkaR1Og54.jpg	public	mamuthainoodle	\N
4ffda271e4b03bbc7f8fd13a	/6Dtx8fj7IXT6M3O6ZV3rXryb6zKTAqPchjeOM2BJJAs.jpg	public	funbunsnyc	\N
505204d6e4b02dee62bd961a	/dcOYoRoNNeCLMxvoyAN-o9gJObcw5FljMqYpS9cps84.jpg	public	funbunsnyc	\N
5196816e498eebbaef53fe6b	/32050404_-lVnQ_kgFICQK3OBrfq4QydeDqXhz3ZCRD3TrCvMPxY.jpg	public	veganlunchtruck	f
50292d68e4b0d0acd3bb5dbb	/vv6y8qi6JFfXr9QDkIvTPP0fSmbgQ_jGXHCVwDv0c04.jpg	public	veganlunchtruck	f
516ef5ece4b0d1c83382c12f	/117715_Gt3J4FMusC7YQjSfEup4O7bAO10z8J4gxmnd0xKnZuQ.jpg	public	veganlunchtruck	\N
508af08be4b02ba9b11cc747	/17430999_28ys6GXVoaOZoKPXLLK5GQpVEL8UrC1_1DajRIy8ia4.jpg	public	veganlunchtruck	f
526e782b11d2a15e6fb663f3	/8761552_XH612BVbFNOBD2jJVEMDzyawnGF45FygNA3TtdKo6UE.jpg	private	veganlunchtruck	\N
52ade258498e293fae46e684	/68150_s7DCORg1dB6IJWWdj_e_pZMg4zKZs3S_Tjkff_px7kw.jpg	private	veganlunchtruck	\N
51dc48a3498efe9483d8417a	/117715_dlhUlP8z_jVejqRlWaCzsJBqg0eoP6rRSjOLpszFA0Q.jpg	public	veganlunchtruck	\N
51105b22e4b0a7b61fac854b	/117715_vKu0po70jlTD3qN9mXsdNiE6V5Od1hmYMVlUY9xSIP8.jpg	public	veganlunchtruck	\N
519a7e33498e6e4ea6ff66f1	/3354_e_1JMupbEA8VtOBVXgLHAvtJGQwcpHvY2JyFESXYSjo.jpg	public	thesteelcart	\N
51dc0e71498e8db4f9a8106e	/4456614_ZWvsB80ogvwYkoKIyVf6q5RfcDXwuKI4t0XJJhyLQ_I.jpg	public	thesteelcart	\N
50f59e2ee4b0b31f58d6cc1f	/1922740_OhtWiNUDUcN0NE_HB3Tk8vm5qIZcvqxcP2nMDrN8dT0.jpg	public	kimchitruck	t
5197fe76498e1c056c96d21b	/117715_m462oAqyqBN12xyWCOyzYR6-1gtYrUa8BiX9r9OybE8.jpg	private	kimchitruck	\N
4e3da652d4c058f9dc087a6c	/QEOIS2W35WLTHYK00QC04LKKX4X1SYW3DDI45X30HSKTJENQ.jpg	public	kimchitruck	\N
5151c82de4b024888079c5ea	/5003144_g8kbTzyfr6gL9vIRpMBbXz4TqBUk5EgkqIPlBP9DtsA.jpg	public	mactruckny	\N
513b9b7de4b04f7024bc158a	/45519738_eDUGOpHYwiR5C3VUps1gQ1YDIq0Di3WMfuirGs2EVBk.jpg	public	rickshawtruck	\N
4f8dc377e4b0ca2accf75652	/EKcue5yGEyaPnBymSd_HtBxWEZl4grYSOXMhw-gqpTs.jpg	public	rickshawtruck	\N
4fb6bb41e4b066430032e4ca	/HHZWTU3POi_yJE4GU0zI_NjZNerm5y3MjjxddcV5ZMs.jpg	public	rickshawtruck	\N
50883301e4b0904987088a20	/2361939_J2zcgauqqGFC_PZPyvkfEDoSufdDe5qE7gi_NkS1P1U.jpg	public	mactruckny	\N
519bb23b498e208a0b81b7fa	/9285455_LZiJ4FLH7NOWjNUsXO9jxDRFAgLygBSB8SmSIW0z9kM.jpg	public	mactruckny	\N
5165924de4b093be3bc5cd57	/2159706_uFl3RYgA1z4EiDNp8PtjjG2HHWhTiiXDLNzJtFWPHS8.jpg	public	mactruckny	\N
501fe830e4b0bbddce992f90	/fFBOGONZt5Zr77Vc5g8adoAiBht0f-MBut7GqorVEjo.jpg	public	mexicue	\N
523c930a11d22e1c3012a9d3	/34169985_AiTXirGu6jTaGeWWhhOfl2QIbGVaQjdDg1QCEakqza8.jpg	public	mexicue	t
4f67b0d4e4b08559c4c60149	/SdNxRS0joKXurf0FEv8_SRg-GeR9lGCN098_ZB2tijA.jpg	public	mexicue	\N
50784742498ec6be8cd3f88e	/155927_ebZApDyXpTKTmvOQHdBTxNc2wJrsZV2QASmpYTNAVJM.jpg	public	mexicue	\N
507efae0e4b09a52c022ec3a	/39213_nH-zcqfLCJqMvG0Nco0LWE4QuRuoL6unlEXJlJbTEF4.jpg	public	mexicue	\N
519fa37b498e7adf7e8ebce3	/47170230_A9xVWAtkJBP-vVqUF1q2WlK8yuZTf1CVQz0JcPrHGY0.jpg	public	taimmobile	\N
4dfa4a9840a3542ff44549df	/VBAJNQCBWDMP2WKDXJ5QHQ0WYF1MKHZSLUAZZJXKDBDLDUWG.jpg	public	taimmobile	\N
51cb2c41498e9851cecdd49a	/5728350_vuJ4ORu0wHhd-B-f4FTNfsoIhfHgtJRMJc-QEeiYmNQ.jpg	public	taimmobile	\N
504a271ce4b0c65efb6b05f5	/PG0DfZvsxtqv4QM8Xpl6y8Ojahb0UanYwCPSdmuhj_E.jpg	public	taimmobile	t
4fa814d1e4b0d607baf8bd9d	/2drHnu4mqj-uzpwwcJa3MatYGD7KFuxjE472rButWlM.jpg	public	taimmobile	\N
53860b95498ee26cd484fe30	/81832079_fNoLG8cvJl_IqYaTNF8p9uwsDsglMXnfF2DKZ8X0Tk4.jpg	public	mtblls	t
53e3b619498e4b9015f0bad7	/68150_s6TPzQTspWKu7AI0DXgjZai6xKrtSkWgIdJNkenXMfs.jpg	public	mtblls	f
523887bb11d2ac89551d71ff	/5568483_apwtHKsNfvYc-IjeDL1_oqXIqZsLTUGH_-l1uxxAiGo.jpg	public	mtblls	f
53287c9c498e4b30223220d1	/68150_mMquObtK1F2QjX3VWuhYK2MtjUA9i5QRzexf9zWrBOQ.jpg	public	thegreenradish1	t
51dc5fec498e4e9be748eac4	/22801_gX0atVT6Jt_H6FPXuYAqHD4VzO5jAmS4SVid_ZLkk5U.jpg	public	disosnyc	\N
525c259b498ea7548cf31f8e	/769710_ZxOOtsSbFVklHIRhXVmTO7ops0Pm0EybRDTgUvGHrSY.jpg	public	disosnyc	\N
5197cb68498e8d409a89ec1b	/1847096_oRB5R_owQW40gVWlJhNNsh9_0bEq2D8Rt3Zod9HUbUg.jpg	public	disosnyc	\N
4e09f3fca12d09aa881a769f	/NTSOFYDIBYVWGE4RYQTBBNIAQESPZ1LLW3Q4TC3TGMROSJPH.jpg	public	nautimobile	\N
4e70e35c52b140871b6fa35f	/1TB5ROKJY5NF0GAVS4YS3WZTFCUXXHTPLLBUIK4BU0XD0QA5.jpg	public	nautimobile	\N
51ccc251498e028212e9b1e3	/117715_ozxp6K6iPGwKCzQDARR3BgMcisplkTt0x4LEKDJdBMk.jpg	public	nautimobile	\N
5022f267011cfeafe81dab9a	/7EPnN8ReXYQWoZYxzqkH9AQlOe8vFPtVP_60n65i9U4.jpg	public	nautimobile	\N
5203e16e498e9e8e0a93b61a	/702028_Fog-6PEF03KateivIPP-hx87Qn6gi7PwnaJv-wTFv3I.jpg	public	carlssteaks	\N
52e456f2498ea9ece32b66e0	/25812424_w-pfXOZy2D8xWVJY37hGi4VXYiDnicBFvWRiiDOnNhE.jpg	public	carlssteaks	f
4f7deaf5e4b0ffb6a3f2008e	/Xho5Xq8BtpNhEQvH0KRI3yX4kUstFRwTxEDj6QoawcM.jpg	public	palenquefood	\N
5192873e498e63958610c2eb	/117715_Jf2pdeF9ztory7puWsPaFE26jmMzPEzjOfPopvTzSjA.jpg	public	polishcuisine	\N
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
516cdc93e4b0d6bb083f9db2	/117715_3eRUhgkRZGVpjDAYUz9TD5yQXPVFmg0iCB7iIgv_XD0.jpg	public	souvlakitruck	f
50be4929e4b0ada0df80b932	/4611139_UjW8jF3qFz_uyk0hDKT6CMZI2q3My4j6ZiwX-68QpME.jpg	public	souvlakitruck	f
5079a745e4b00277f33e4836	/34723233_tCoDnWhdhZj61xi_e00MNwJoK_UcfDXCQQ7Weat8pBM.jpg	public	valduccis	\N
5135022ee4b0592185aa975e	/2660256_0rdKd0P0tCYzLf5j7-_3b8HbPNDVCW6S0hHdJGW47Wo.jpg	public	mikenwillies	\N
506dcb8be4b0748e0467de78	/157259_PdYI3Fpzhcz_LoGnBeymaSAZaZCiVVw43c4xaYQQIDY.jpg	public	mikenwillies	\N
51117858e4b0e14064917adb	/263293_EvgjxXJqOivd94q0mbPR_AxkRXuzkFtjOBcOWnXuyQU.jpg	public	mikenwillies	\N
5012d0d5e4b06fc7ce735a68	/7J2g1YLtx4ma57g4A4CerJJ66OwudjGhFI67JaNl1Qw.jpg	public	seoulfoodnyc	\N
4f5e6b3fe4b033732b227036	/7Pw4h0QMNateMpgFd_DAFO0uUnsIdcGzmHG_1in7Wu0.jpg	public	seoulfoodnyc	f
4fb1335de4b0f4503b23a67a	/GSQxN-iFZejvploz8v8hm2QzrWiTmg6QdgBffmHvsnc.jpg	public	seoulfoodnyc	f
514e42c7e4b0ec8b7e400875	/48992751_ibL8tx_7JPvV3aQmnEevrdibtLP0jWytaChkCdRuhG8.jpg	public	crafflesnyc	\N
514e42a8e4b0d91e975b3db9	/48992751_womoOVd5bv-2KopmWjWEHA_WsyoWQITjAyXBuM4Ciz8.jpg	public	crafflesnyc	\N
51f4589a498e97316d307dab	/186827_ilvLMlb3AFqgXUQJ43S7IjsLNPxYP3Pw5LEjrqhp6wI.jpg	public	chipsykingny	\N
51ab89bb498e83fced4cefd6	/66074_8dLzCKmVRde0Uvtx_NSl9SKROFh0kat1IQgcAvU4J3M.jpg	public	delsnyc	\N
51fd732d498e415eeb8b9881	/8839239_mAp7_MVmWbbK42Xq3-W-1zmegy-MNx8NzB0P5Brf-Pw.jpg	public	delsnyc	\N
520e673a11d25d1282a44199	/117715_KjwJnc6idBB7TuMKhGboHDg8IYjlGcr6h3I6_fJECmM.jpg	public	delsnyc	\N
51b8d7aa498e103b3a36ec2d	/47900463_7B6lLfz2PW1XyrG2vCIxp4vIq7QXWEhxufI5i75jwxE.jpg	public	delsnyc	t
506dc9b9e4b0c21f078c3bb3	/22983_XN2GbKo3a5YsNY_ZpiBcjUHTD2if3TWS8r586Uq4cEk.jpg	public	blend_express	\N
5033cee6e4b03e64bc749ee7	/tIyy6IAKcw2SSiX5JSPBCURstZZisntK_46plgrfdJ0.jpg	public	blend_express	\N
519babe8498e355d9d35fca0	/65817_6p9jSMaQMqP9QGn3KOIyuDOG15jaLxIPvsdrpZGWdj8.jpg	public	blend_express	\N
512bbfebe4b0b8faa466c796	/1425622_4wp7wCuj7Ci1dl_FVH9syKmrJwQavMhL9uqww1b0m1o.jpg	public	philssteaks	\N
527e77d111d2e66fa6a871b3	/649454_HIWthX8nL3SZAOwyMlKj9Y7ju9GCiN4OEV-wZR6IKC0.jpg	public	philssteaks	\N
5249c4bb498ecd25dde27c5e	/764670_x0RdEOs5TL4SEe2zGgpkzPFBFmlFV7-6UQiVtoFeHaY.jpg	public	goburger	\N
51dc5a9e498ebf7ad40223ec	/1328035_Ak3fMs2e36r7NvIE_gIDK5XZ9CwrW1DEJa3g1oobp5E.jpg	public	wingnitnyc	\N
50e719c2e4b0e263423e547e	/15471_4uN0tddGW5orNGh02xhxbiAOGUpAAy3rIWEotoRgB_M.jpg	public	tacobite	\N
50f99bcee4b08ca132377f78	/4611139_CEH3eveI6uxlRVQLet5Fpa_sNfJwAzfheMTYSBplO5Q.jpg	public	thecrepestruck	\N
531b7d5e498e3df35f261af2	/22402741_aYe825rrQDsEq6E_Pqv35za149PBn1PcT557SaJhOK4.jpg	public	brooklynpopcorn	t
5220dc78498ebd10d150f736	/29917892_nMZHXkfxBukc2QfFqtDBTZSJ1xpMkoO7VGBJmGKkwhY.jpg	public	brooklynpopcorn	\N
5258d3ef11d26d03cc0563a5	/117715_GQ_O1nyBbVlKTaYpRlprc8ZdIEAEftbU4_9hDGjvxsU.jpg	public	brooklynpopcorn	\N
51a4ee69abd87ea53396c979	/4083549_jMzaCPEId80kWmAaq2oQ9APKf4bLvdeHhy40qPeB9j8.jpg	public	shortysnyc	\N
50045b1be4b0004dbf67c977	/MDweBG1fBnF_fZ1tOghWyHS9qUxGNiJeOrOpoA-fBrY.jpg	public	shortysnyc	\N
4feb2bb8e4b0a47cf49787d7	/-CEaOy-zjgmGzmPRViSeNchwIITBbHgI3lFosreLqIE.jpg	public	shortysnyc	t
5008051fe4b0974c844d5003	/oNy0_bsWPyVmjrduzJXpbrAPHjQS0PVbyOCfoRSD9xE.jpg	public	shortysnyc	\N
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
529fe66b498e1fd14afe696f	/68150_h0wbg6xbNwrEjXD6uaE12ZDZYF_h55LN99Es520nMBI.jpg	public	mooshugrill	\N
5267fa9611d2688bdc4587a2	/2136029_bvqot1MnMJ9IGYsYJkamqTiE_lL96OcfilWMxskhdU8.jpg	public	mooshugrill	\N
5213a7c011d27a56f99dfba3	/11074699_K2ka1_NxiELyTqgjvY3oMN70IUxIlADqRIAb5QpzsLM.jpg	public	mooshugrill	\N
501975c5e4b092f6a51ef338	/bI7RrGcK_moyn-kJICa1OCciBVuYYykwCMGlea6mcxg.jpg	public	kimchitruck	\N
4e00e61aa12db1129557e99c	/WSUNYIB0YFVRCTXB13UCRCTANZUG0DO0X2FWCUYYILU4TCGB.jpg	private	kimchitruck	\N
538fa2da498e8efc80bc2cb7	/26065139_jgo2VLUL2PokQdo7SP2iJ6rtca8E552GZGM3Bhu1e28.jpg	public	langostruck	f
5244712a11d295d581384a17	/22780_QXd0BtJcOWXZwSm_ZG3oXyaNj6Qw5-p8hWQzzH121fY.jpg	public	polishcuisine	\N
5328764d498e217e55fa24e1	/68150_4QSMIi6zBoyrZ1VeH1Dqb3fEovQswz93yHAPvf2lGmQ.jpg	public	dubpies	t
532879fb498ec68315b3d232	/68150_KF6qgT-viSOMS5bt3lJarsNeEUjlVJn1lbAypyCl1js.jpg	public	dubpies	f
53287a0c498edd9a0567c2c0	/68150_i3UKBmIXHPN4h7gtvSQjnYfikUNmJuGRpjwKP2dLI5Q.jpg	public	dubpies	f
5345d100498eaa611b76f338	/62345083_i2VdE3VeEPlbfUgNv9mWmVmsuL19upJhcHaRX3zje1w.jpg	public	dubpies	f
516d98b8e4b0b059e50ff5ad	/117715_BoNkQJO4jPWEtg_ef4-URb7IseoIXnYiP5vkvWJtezg.jpg	public	toumnyc	\N
51716b5f498e03d8bc252c48	/11709298_S8klPxq0yPyZw2X9-_0IZyk6TFTn9xi5SWd_6BGCeVM.jpg	public	toumnyc	\N
507dacb0e4b0d8cafc9601e0	/2361939_S3NwwSNVZD-2tAhc3bwAvsYgk9tXwYv0T0yq9ci-ihE.jpg	public	toumnyc	\N
51800af8e4b07a4a57023def	/9548073_erhzj0ShEDKaz8S8DhlDe90fDjJEIWjilIxO4_zjdGE.jpg	public	thepocketful	\N
505c9776e4b0643aba1071c7	/5568483_yQrtG73dbug7q06p9IASJmTFnOVgGprIZKbfHjQRcso.jpg	public	biandangnyc	\N
527d2c2711d2c984e85cb11b	/4179871_5FQ2eCC5ZeizUVRLh4tadgEAO1BnJjVQ7pSEvSDwIfQ.jpg	public	biandangnyc	\N
512161e0ebca7d20d6a70104	/4574_ZC6mf3ha1jNXmFUDgtNsN3zIf-NHyqgxA3WkUkOl4mY.jpg	public	biandangnyc	\N
4ec59ebacc21b428e0de466c	/4AMXSGP5YGTUHEL3TFKTS5ROVIX4HUTU4MU5ZW1OX5E3URDD.jpg	public	domotaco	\N
50031911e4b034c2944f0c3a	/bExPPWxN-4YhYlw2nPz-T5eA3mYN-U78LUZtcIzjTRM.jpg	public	souvlakitruck	t
4f753600e4b07eec20023ddb	/zUb4OswXiQLnF_k2xnx7AdupnEIl1nuGyIuFcmFWf8Q.jpg	public	thetreatstruck	\N
4fbfe026e4b04422a08a40f6	/Han8Z4R-SQ615pLoN2lRdPfKEFa6UW2yudSOxXmJtts.jpg	public	thetreatstruck	\N
51461b9de4b0bb73a6821e97	/1102787_UDt7OJpexNs8VPrehVDsp9EtfUJnMhKzJ2tTXuof06M.jpg	public	thetreatstruck	\N
5286645011d228bbd12f9880	/1353667_2qCG26N4ikz7mbvEGkrFkcNLagGqrzRuNyeQ35CCDE8.jpg	public	korillabbq	\N
5231f54311d26e8da5827f3b	/977282_AToQDrlKW5PTNbNGQcB24_BeJNsRMgZTeYmC9P-or38.jpg	public	korillabbq	\N
528e451f11d2a93e4361f565	/977282_wEw3nDjN0NbjC4CgQ00ON0YjdtnMocrfAjXDM4UH63Q.jpg	public	korillabbq	\N
51f15b4d498ee58fec420a7c	/13285510_Q-SBXKFpfroSwQ-QJdezzrh1KaHfHAmLyicy8d5S1jU.jpg	public	parissandwich	\N
5243126c498ea77b19b3a444	/65506790_31Qpx9E-ZjuNve-izmDY6vVxUCMrhgGsnOLn4-fusp4.jpg	public	parissandwich	\N
51b22a0a498ec00d1c45726c	/390807_y2oeK6xR54wk9b1Sfm82Ek09Auv2lNkRTpJOzos3xjU.jpg	public	parissandwich	\N
5254357b498ec4662e20c654	/2620660_kMXeinZ_B6lOrHRQnheIHMBr7p81ZxcUblWl0SQ1vEs.jpg	public	thesteelcart	\N
50ad186ae4b0b639ca7ca234	/295161_qCQYG0XjW1Ji0pSDxM7fWRzxTZRbcYyZbsbPNJo12hw.jpg	public	toastmonsternyc	\N
521649b811d2913e20a1ae87	/5568483_RtMp5aDM_JtBZOI1u48Jy3om4Z672obezdu1uA_UWd0.jpg	public	toastmonsternyc	\N
518a82c9498e068718057964	/25979758_bGWQQ7W2SJI4v7KmU891VcYZGitov6qbSNAnIEt8HTo.jpg	public	toastmonsternyc	\N
53287a41498ef1dfde86d217	/68150_jBIeF8OZP2o4q5lJjB4TeUteiuuczqDDm3s4zQGipGc.jpg	public	shanghaisogo	t
530f7b7b498e225c3989957a	/20103877_gKGG5Z15ifazVa7PoBKpyKecZK7x2dWgjFIDOkwO38c.jpg	public	shanghaisogo	f
51378e9ce4b071feb46ef7cc	/18792384_RSm8zhe_6kUOxy91taByfRjTDSLp7stH7PI41aJHOrU.jpg	public	bobjotruck	\N
5249b50c11d2d415e3c6b017	/769710_HOnpTjl0b6qd4-yoPpg9lXZGBy-ZKikqzLlFWw2sQfs.jpg	public	bobjotruck	\N
4fe20639e4b05dcdf7f5737c	/l9UdGGevddtOhDk6scQjcy1-TbVBX-wf8Gf56jBIRIg.jpg	public	bobjotruck	\N
5249b1c511d23e54343ae083	/769710_HUiZ7dJrNbdnPYV-DTQRr1z0zgoxFx9KMC_Y-OQ6O2o.jpg	public	bobjotruck	t
51c213db498e0748ab0dca3c	/53641916_5aNKp9fdHx3i_Pi15Z_X6pE3fAsTX35YBQ0nlmZGfaA.jpg	private	morristruck	\N
53287ac3498ee8ce8841a510	/68150_pNBQ4zhtsUiGR_kyfk0HziUGMzyIQwYcYpJ3VpZf7tk.jpg	public	thegreenradish1	f
5199097e498ea36447e54093	/40899881_hbjUdavpBfT-sLaBhv3pbZydT1tgs9v-Maw12j9I3Xs.jpg	public	carpedonutnyc	\N
4fc7a5d3e4b0647c52b3c26e	/iRvxK7ohXIwK9Ib6wkVgtR46VKRLsamXuElhEtOlNKc.jpg	public	andysitalianice	t
4fc2552fe4b0cec932846e84	/cjaTu8CSMM7HvFDxIUk3I2TF_I8mJyZuejfwTgYLc-c.jpg	private	andysitalianice	f
4feb6e00e4b048145c547997	/wcCcDDUFo3EAkWygR8pGn29HTAv7VKEvPwJgzS6hQcw.jpg	public	andysitalianice	f
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
52e6af38498e26e622e5398c	/4147709_E9hzkLfHAJjdgQ6RT3W29cf-cftJShyXpRthu8riZYs.jpg	public	hibachiheaven	f
52e2aa07498e25b9a084ee94	/12998378_50qpDzH_XwsSlaJpw-f2fDtJsSvQg4TU_ujjdsnyWOw.jpg	public	hibachiheaven	f
5362891011d2b40c5f328b6e	/41834822_k1LVelyLVM9gsNt3M70sVjI-QLm_84bgv4c6hoMHPO8.jpg	public	hibachiheaven	t
4fda1cf4e4b0f6aceebbdb2d	/lKL7uz06jZgB680Vye9zxa_2yQfH96afFExvxaLlRpU.jpg	public	hibachiheaven	f
516ee142e4b04f28d58be309	/36812449_DjR1ynMnMpwj-KmiWPZQldmGQwJ2IEzjSwwmGevqe3U.jpg	public	sweeterynyc	\N
5107e09be4b047c08ade6bf6	/760350_ZaalKVnOYdVAGoQEdugu-1Lws1LubyJBOVpZvJJD1V0.jpg	public	sweeterynyc	\N
50188a43e4b0d35e6d8035b4	/b-fKh6mx2WxCybNQkr9ovk_jv4x7bwJPVFM9RF3M5T4.jpg	public	sweeterynyc	\N
50a696b4e4b04d062582a95e	/32050404_qo6ZUnU5LQMoqrAR6YoH5Qz-PdUcD1d1jCheEJy7lng.jpg	public	thepocketful	\N
511a7d64e4b0c6a64118260c	/793192_Dtd9vMRk-pbBJscn1cb7n29zM87iJjZy6rojapRhODk.jpg	public	thepocketful	\N
4fbfebe9e4b0a3bda0340383	/Brw9_z178IK92xMEXLCSSZrP0-99GXjutCp7dHCi5CQ.jpg	public	thetreatstruck	\N
51bf306a498ed0fde41060d6	/250434_ayEUsJHsbHDQFjUrGrR2fdlBjswuffyRTlWWFrW0-dU.jpg	public	fritesnmeats	f
5413499511d26b1c8b577c09	/4195495_Ir_R8BxT1YxyTe-VuFD3U5pw6j9CobWIBlYp1FF-TwI.jpg	public	fritesnmeats	f
4e42f5ecaeb7f6be72c39c70	/JC5VO3Z50HMMMVLCCGWDQPMKF4W01VBXP1QS2LFESR55UHIX.jpg	public	fritesnmeats	\N
4fe1fbabe4b0be4ebe6c1c52	/HNMFUfRPXDmxSDWAwh7pixJ34SFUY0fgzZFeOLAVXU8.jpg	public	funbunsnyc	t
542a28a1498e4288ab95e302	/68150_E567_ql-1p2jEv5ysetaEOgtnxpMmeLwZghpwLximCw.jpg	public	papayakingtruck	f
542a28a8498e8c25fb70df8c	/68150_ru2bxW9jr0deeGFaJrvEbwBh8Bv1FRW82ZIglwoRv1M.jpg	public	papayakingtruck	f
52d32962498e318b0a9942f1	/61382883_iF5gX7tlMJ3CWlWcTkpntPniCUpS3o7H8anOau4wiKA.jpg	public	usafoodtruck	f
520f87b511d2e753e7955853	/44_gUd2HlRFt-yMUFcOdI_EUCdz5NK86hKk-3kHwZhHou0.jpg	public	carpedonutnyc	f
5109aed2e4b01d2a5b69b022	/117715_0jgrjk5IsUFppNAL0NtebyMYoz1JMdzrnWAIjrLMHZw.jpg	public	schnitznthings	\N
5012e555e4b0dd18ec16bd37	/mZQAOCmv5lnRZ1qOUTwDXk-MLC-X-p01AfECgfLJC2I.jpg	public	schnitznthings	\N
522e088e11d2d4539942a387	/39707564_2mJZIxFUyGllfVMRjXdE86dZsCxH8cmCdUv29E4dfmE.jpg	public	schnitznthings	t
5243206b498e78230cd0770a	/54092198_eF4CEteD3zHjOCJzaYssyRXaQElB-GEOy2sqzBFQPm4.jpg	public	thegreenradish1	\N
525ee647498ef229c65969fe	/10045965_ptbEO58Zn5wDz6kgitvMVjFScmxSkkuHNbK-AguCXSM.jpg	public	thegreenradish1	\N
5086e523e4b02ca59cae7bd4	/2361939_1JvatS0wOUdQQIaTmd4Vmk8bgr7aFYOR7LaMkRio0X8.jpg	public	mausamnyc	\N
513f646ce4b0b1892aaae1bc	/13285510_LmdJLKoCS9fSwm3wy96lcieTczjsLuxAEUnU3FlZDlo.jpg	public	mausamnyc	\N
51194bbae4b0cd237850b223	/793192_FQUO1SFGyLkg5NRz6VUYl3_zmFgfy0Mh8gL1unO8ijM.jpg	public	mausamnyc	\N
5239ddce11d2ab4765d5cc7f	/5568483_alwOH7sfGU8-pKfLmurfe9rt3pk2G6p90KwFyC6hq1A.jpg	public	sweetchilinyc	\N
5208f543498eaeeaaad3ce52	/15629_P_UAUr_S-OO0R12wNp8LDPwr-ZbfPiWeG0Q0rrjW6Ww.jpg	public	sweetchilinyc	\N
51f2be1f498e71235db5b61b	/117715_mGfGU0UGjUMhgqgwrDPf2f44NZtfMrobqJMF8ahsrjY.jpg	public	sweetchilinyc	\N
50e71f82e4b07154c72fdc22	/275165_az4RUZ2U7-4cfdnQA1FlMrDLaxwCMriWtlhS_pddjEc.jpg	public	mexicoblvd	\N
5140cc96e4b0ef29f4802508	/4886503_z36ZXtYKGVIHcNLCR18ZdUWtpStRrbf33rInxsr2p1Q.jpg	public	mexicoblvd	\N
525de1d7498ef4b27ada0847	/31827631_CApIgPWaXupe3toLi7iJLb6NxIyn2IDTOjAG0qw-PIk.jpg	public	mexicoblvd	\N
4fee068ce4b0f9bd2b4041f7	/UQwqaF9knSdh4LFRzAhnh7hcl6_dSjDTg1phtqTe_7Y.jpg	public	milktrucknyc	\N
5281221811d21e907e460e00	/4195495_akELCvAQ7aY-bfTfHk93g5g5_qcJnQJV7h_gH0FlKUA.jpg	public	milktrucknyc	\N
514360f4e4b0455b303a4d66	/8626436_tfGrSomdm1qEPFKcyb0Q5atmm3DmDeao1W8MotOtOwY.jpg	public	milktrucknyc	t
4f749b3fe4b0f06c04ae2440	/rA31cWGMm0G8EuZFYZBxb3y2OrW3oEo7vCj1L2XR3AM.jpg	public	milktrucknyc	\N
52052ef211d22b8ed81dd96b	/36360429_am9ha8rSYxAvCaSMU9ya6lI9MzIgcpR62DH6HS1b-uY.jpg	public	milktrucknyc	\N
51cc7075498e8d24309aea57	/991186_cg_CePJhqcT81QY5l1L4eB3MQxy_QlsRh4zmZDk8cFM.jpg	public	biandangnyc	t
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
100	320 West 66	320 west 66	up	40.775990	 -73.987717	Upper West Side
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mca
--

SELECT pg_catalog.setval('locations_id_seq', 100, true);


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
trucktotable	BistroShopp	trucktotable	http://bistrotruck.com/	55St & Broadway until 4pm. Let's goooo	f	1420227139	1407427421	Moroccan	\N		\N	\N	\N
mikenwillie	Mike n Willie's	mikenwillies	http://www.mikenwillies.com	Happy Taco Tuesday!! South st seaport Front St. & Fulton St 12-8 ComeGetSome	f	1403394007	1402414859	TexMex		4f205f0ee4b0294b35a1178b	\N	\N	\N
sweetchili	Sweet Chili	sweetchilinyc	http://sweetchilinyc.com/	Sweet chili chicken. Get yours at old slip & water 1130-3 and broadway btw 39 & 40th 11-9! eaturban... https://t.co/vuWNhUQtiz	f	1433084293	1432822509	Asian		51a8c802498e2165ca855a19	\N	44	\N
seoul	Seoul Food	seoulfoodnyc	http://www.seoulfoodnyc.com	Come to 51st street, between Park and Madison - it's lunch time!!	f	1392220033	1392220033	Asian		4e74afad88775d593d9a7eb5	\N	\N	\N
miamifood	Miami Food Machine	miamimachinenyc	http://www.miamifoodmachinenyc.com/	RT @YouGotSmoked: Park Ave btw 33rd St and 32nd St from 11:00 to 3:00 today! New York Aged Cheddar Mac and Cheese! Delicious nyc http://t...	t	1421905524	1389964561	Mexican		514b53aee4b00c3e98ec25e9	\N	\N	\N
craffels	Craffles	crafflesnyc	http://www.craffles.com/	Happy holidays!!!\nMake ur holidays sweet with our delicious crepe or waffles. Our location for today. Hunter college and union square.	f	1421616846	1388428190	Crepes		514e426ce4b05bcb261d910e	\N	\N	\N
chipsy	Chipsy King	chipsykingny	http://chipsykingny.com/	Kasar truck is at union square\nBroadway and 16th street\nAll day until 8pm	f	1433085550	1407255461	Fries		51bb5c43498ee06e13d0d31f	\N	\N	\N
vspot	Hit your V Spot	hityourvspot	https://www.facebook.com/VSPOT.TRUCK	47th and Park from 11:15am to 2:30pm !!	f	1412066274	1412066274	Vietnamese	\N	53c9479b498e2dfa7e205ff0	\N	\N	\N
schnitzel	Schnitzel & Things	schnitznthings	http://schnitzelandthings.com	The truck will be on 47th & Park.  Schnitzel time.	f	1422645854	1430322671	German		4a6640b3f964a5204cc81fe3	(schnitztruck|the truck)	16	contains
shadydawg	Shady Dawg	shadydawgnyc	http://www.shadydawg.com/	\N	\N	\N	\N	American	\N	536e77ea498e8b0d31167218	\N	\N	\N
steaksncrepes	Steaks N Crepes	steaksncrepes	http://steaksncrepes.com	50 st bet 6 & 7 ave for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	f	1397096188	1374766188	American		50f44167e4b0af5bf46321ce	\N	\N	\N
yume	Yume Teriyaki	yumefoodtruck	http://yumeteriyakigrill.com/	Yume is on Hanover and Water today for lunch. Start the weekend the right way :).	f	1400251565	1400251565	Japanese	\N	530cdc14498ee06c95ab14e0	\N	\N	\N
frites	Frites 'N Meats	fritesnmeats	http://www.fritesnmeats.com/	Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE MARITAL BLISS. Preorder 9172929226 fidi	f	1433164648	1432907255	American	This is a good burger but this truck is interesting because of the many toppings they carry and their burger of the week. 	4ae9d217f964a520bcb621e3	\N	53	\N
dels	Del's	delsnyc	http://instagram.com/delsnyc	We apologize for being MIA the past 2 days. We've been preparing for the hottest day of the week! Come find us at 21st & 5th Ave until 4pm	f	1410028765	1409149941	Sweets		519bb56b498ed2dfa950ace2	\N	\N	\N
mamak	Mamak	lovemamak	http://www.lovemamak.com/	hey guys we are @smorgasburg pier 2 @BrooklynBridge_  come come come! http://t.co/llBP6I0uKb	f	1432276046	1410708157	Asian		51c4cffa498ec876f564a0b4	\N	\N	\N
blend	Blend	blend_express	http://blen02.wix.com/blendnyc	Happy Halloween.   47th and park we here.	f	1421948094	1414774175	Latin Fusion		4fa94528e4b0f8fbf13317e6	\N	16	\N
mamuthai	Mamu Thai Noodle	mamuthainoodle	https://www.facebook.com/MamuThaiNoodle	We are super excited to join @thaithenticNYC for their second Chef Series pop-up event @starrettlehigh this evening 5pm-8pm Hungry yet?thai	f	1432938856	1431624296	Thai		5126a10ae4b0af674c85f353	\N	46	\N
phils3	Phil's Steaks	philssteaks	http://www.philssteaks.com	TBT to that time we won a Vendy.... Come get an award winning cheesesteak today on 52nd & 6th from 11-3. jawn http://t.co/YjcusxkVWV	f	1433169892	1432823021	American		4f15b382e4b0725660ea9f31	\N	25	\N
goburger	GO Burger	goburger	http://www.goburger.com	We're on 91st and Amsterdam for dinner tonight. See you soon!	f	1402176073	1398896034	American		4c06b3eccf8c76b0a4eb3a65	\N	\N	\N
getstuffed	Momos & Buns	getstuffednow	http://www.chinesemirch.com	RT @GovIslandFood: 1/3. Only a few more days till Gov Island gourmet food market powered by @livefastgroup opens for the summer. @Getstuffe...	t	1408198481	1400698983	Chinese Fusion		4fa016cbe4b05d0fc11262c5	\N	\N	\N
itizy	Itizy Ice Cream	itizyicecream	http://www.itizy.com/	Likely our last three hours at Columbia this year! Come grab a scoop of your favorite flavor before it runs out!	f	1382307419	1382122482	Sweets		4fcbdcaae4b00a0e855124dd	\N	\N	\N
freshhearty	Fresh and Hearty	freshandhearty	http://freshandheartynyc.com/	Get your Soup & Panini on with Fresh and Hearty! We parked on 46st btw 5th & 6th ave from 11am to 3pm. Call now 4 free delivery! @3474402467	f	1395241942	1390493878	Soup/Salad/Sandwich		51801f7a90e7374e46b6239f	\N	\N	\N
taipanexpress	Taipan Fusion Express	taipanexpress		Good morning we are serving lunch at 46 st between 5&6ave from 11:30 to 3pm @FoodtoEat @midtownlunch @nystfood	f	1412268299	1408622100	Thai/Chinese/Indian	\N	532b1b92498ea6c0d1026802	\N	\N	\N
wingit	Wing'n It	wingnitnyc	http://www.wingnitnyc.com/	Out here on 23rd and 5th come and grab some wings for lunch today. We will be open from 10am to 3pm. See you guys at lunch.	f	1390923947	1387549355	American		519ffd2b498ededbeef3c073	\N	\N	\N
tacobite	Taco Bite	tacobite	http://www.tacobite.com/	Today we are on\n47th St\nBet\nPark Av / Lexington Av	f	1415029173	1406907223	Mexican		503ba49ae4b0fad35eb7a8dc	\N	\N	\N
shuka	Shuka Truck	shukanyc	https://www.facebook.com/ShukaTruckNYC	Due to the coming rain storm the Shuka Truck will not be parked on 21st & 5th !	\N	1433086666	1433168690	Israeli	\N	546a5011498e0e047a243f37	\N	96	\N
mooshu	Moo Shu	mooshugrill	http://www.mooshugrill.com	Brought our yummy fare down to SoHo today! Catch us on Hudson & King til 2:30!	f	1418139086	1418396706	Chinese	Moo Shu grill is a slight twist on typical Chinese <a href="https://en.wikipedia.org/wiki/Moo_shu" target="_blank">moo shu</a> The three Moo Shus option is enough for lunch and you can pick and choose a different protein for each. In my opinion the chicken is the best but it is dark meat. </p><p>It's easy to order as there is one window for ordering and for picking up when your name is called.	52090e45498e5500a6bd41fb	\N	39	\N
cinnamonsnail	The Cinnamon Snail	veganlunchtruck	http://www.cinnamonsnail.com/	Parked on 55th/Broadway 9:00-3:00\n*Please read note at the bottom of this post. \n\nHabanero apricot grilled tempeh... http://t.co/9ifeS1tevk	f	1433170238	1425044750	Vegan		4c263af6a852c9287537e66c	1	28	two
bigds	Big D's	bigdsgrub	http://bigdsgrub.com/	D1 is grillin' it up at Hudson/King St. http://t.co/qFIBfSyCwq	f	1433162427	1433163881	Korean Fusion		4c968b907605199c2eaec2a3	\N	39	\N
nuchas	Nuchas	nuchasnyc	http://www.nuchas.com	Start your day fresh! Catch the truck at Pearl St. & Broad St! MuchasNuchas	f	1432985246	1432652067	Mexican		4ebd2a9bb8f7b504a754c130	\N	67	\N
elpaso	El Paso Truck	elpasotruck	http://elpasony.com/	Today we are at @Columbia between W 115th & W 116st. Stop by and get your tacos, burritos, quesadillas yummy  tacotruck FoodTruckfriday	f	1425157921	1412955921	Mexican	\N	523c911f04937624937304c5	\N	36	\N
crepestruck	Crepes Truck	thecrepestruck	https://www.facebook.com/thecrepestruck	Come ceck out the Brazzers promo truck in Time Square 48 & 7 ave today till 4pm. http://t.co/wUDdRIZpAh	f	1430844040	1406998102	Crepes		4dfb854918386e743d9869e3	\N	\N	\N
chefsamir	Comme Ci, Comme Ca	chefsamirtruck	http://www.chefsamirtruck.com	We are at 47st between park av and Lexington av!	f	1432913032	1432827763	Moroccan		4c3c85e3a9509c74b52e395b	\N	17	\N
brooklynpopcorn	Brooklyn Popcorn	brooklynpopcorn	http://brooklynpopcorn.com/	@Sebastian_Otto We are on 70th and York today! Hope to see you soon. Thank you for your support :)	f	1431354821	1415296416	Popcorn!		514a0737e4b09c3e77279d83	\N	32	\N
hh3	Habachi Heaven 3	hibachiheaven	http://www.hibachiheaven.com/	midtown. Come get warm with some hot HIBACHIHEAVENNYC, find us at 33rd/Park and 47th/Park for some yumyum	f	1428064651	1414075107	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	2	5	two
gorilla2	Gorilla Cheese 2	gcnyc1	http://t.co/4ZDqfwSH5f	G1 46 5/6\nG2 broadway / 55th \nComeToTheCheeseYo	f	1433119254	1432904163	American		4dc2d3e352b1c1fb37f1e945	g2	28	before
grillwheels	Grill On Wheels	grillonwheelsny	#	Grill On Wheels is @ 46th Street between 5th & 6th Ave today!!!	f	1432738187	1432131014	Kosher		51b0bf31498e9b68db75612c	\N	14	\N
mexicoblvd	Mexico Blvd.	mexicoblvd	http://mexicoblvd.com	Buenos dias amigos de Dumbo tacos tortas flautas @MexicoBlvd @dumbolot Water&Jay	f	1432912626	1433168845	Mexican		4f4e55aee4b04c96fba5b149	\N	54	\N
mrnice	Mr Nice Guy	mrniceguytruck	http://mrniceguynyc.com	71st and york... it's friday	f	1414424434	1414687317	American		520bbbb211d26afae232ec59	\N	33	\N
korilla	Korilla BBQ	korillabbq	http://korillabbq.com	We're back in FLATIRON today ! Catch us on 25th & Broadway!\n+ Midtown (47th & Park)	f	1433120748	1433169803	Korean Fusion		4cc701aa01fb236ab070baba	\N	16	\N
funbuns	Fun Buns	funbunsnyc	http://j24f.com/funbuns/	Last day to get your favorite buns this year at 50th st between 6 / 7 ave midtown Happy Halloween everyone	f	1419358370	1414768000	Asian		4f8d9663e4b021137aa2bdde	\N	22	\N
cinnamonsnail2	The Cinnamon Snail 2	veganlunchtruck	http://www.cinnamonsnail.com/	This week:\n\nMon: 48th/6th\nTUES: water/Gouvernour Ln, AND Dinner on 4th Street near Washington Square\nWEDNESDAY:... http://t.co/ssXs1PztRI	\N	1433170238	1423425704	Vegan	\N	4c263af6a852c9287537e66c	2	95	two
kimchitaco	Kimchi Taco	kimchitruck	http://kimchitacotruck.com/	Couldn't think of a better way to end a 4 day work week than with TACOS. Find us on 52nd & 6th, 11:30 - 2:30	f	1433166302	1432906206	Korean Fusion		4d6ee122b45b59417c6a6778	\N	25	\N
paris	Paris Sandwich	parissandwich	http://www.parissandwiches.com/	Last day in dumbo today on fronts and Adams @ 11:30 @DUMBOFoodTrucks	f	1432070671	1414764931	French/Vietnamese		519e4ed0498e4f27e64c177a	\N	75	\N
steelcart	The Steel Cart	thesteelcart	http://www.thesteelcart.com/	Makin a grand finale on Front & Jay! Stick it to the weatherman with a toasted sandwich & grits. Soup today is Rustic Chicken Noodle.	f	1432226274	1419950738	French		511d3abee4b0e188895f3697	\N	56	\N
mactruck	MacTruck	mactruckny	http://MacTruckNYC.com	Good morning 47st!!! Between park and lex last truck on the block caboose	f	1432985223	1432730877	American	Looking to take a nap after lunch? This truck is great and the owner is incredibly friendly. Feel free to chat it up while you watch him prepare your food.  Not listed on the menu are the many condiments\\n you can get on your macaroni. The regular size is a good portion for a normal lunch.	50575ab8e4b04ed4f2197dac	\N	17	\N
toastmonster	Toast Monster	toastmonsternyc	http://www.toastmonsternyc.com/	Toast Monster @UrbanSpaceNYC @GarmentDstrctNY till October 17. On Broadway between 40th and 39th st.	f	1428680926	1411270224	American		50ad1829e4b087613d696bc4	\N	\N	\N
shanghai	Shanghai Sogo	shanghaisogo	http://www.shanghaisogo.com/	Happy Halloween. TGIFriday !! We r serving at water and Hanover sq!! ( 10 Hanover square ) come & get some. 11~3pm. http://t.co/VBdd8zsVAK	f	1430948975	1414769059	Asian		5258369d498e13def2bef2cb	\N	42	\N
mexicue	Mexicue	mexicue	http://mexicueny.com	Eating these sliders under an umbrella is like movie make-out scenes under waterfalls. \n\nCome get em at MadSqEats http://t.co/VxW4aWmiwh	f	1432930226	1410639912	Mexican		4c51a6a71c67ef3ba6b61ab9	\N	\N	\N
bobjo	BobJo	bobjotruck	http://www.bobjo.net	Good morning nyc we r ready to serve @47th btween park and lex Ave. try our bbq rice platter with beef, pork, shrimp. PlZ come by and enjoy~	f	1432653139	1432826384	\N		4e3add0c88772c3bf12772da	\N	17	\N
taim	Taim Mobile	taimmobile	http://www.taimmobile.com/	TAIMTUESDAY on 20th and 5th in flatiron!  It's a beautiful day for falafal!  nyceats nycfoodtruck flatiron	f	1432063346	1432654141	Mediterranean		4cf2c5321d18a143951b5cec	\N	1	\N
papayakingtruck	Papaya King	papayakingtruck	https://www.facebook.com/papayaking	1 cart in Metrotech & 1 cart at the @IntrepidMuseum beautiful day to eat at a foodtruck	f	1433169286	1431018099	American		50952bd2e4b03898afd23fe3		76	
morris	Morris Grilled Cheese	morristruck	http://morrisgrilledcheese.com/	Another beautiful day to PraiseCheeses, @DowntownBklyn Metrotech on Bridge St, and tonight @BRICartsmedia @BklynBrdgPark DanceParty!	f	1433165147	1432825341	American		4e0e0b3caeb7a5b33ee5dac1	\N	76	\N
mtblls	Mtblls	mtblls		Hey hey hey its Friday!!!!!  Make it a fantastic day and Come down to 50th bet 6&7 for some  balls .	f	1433169564	1432912394	Italian	\N	504fb7fde4b0bc88c3a6b614	\N	22	\N
snowday	Snowday	snowdaytruck	http://snowdayfoodtruck.com/	Yo yo yo @dumbolot get ready for mad maple love - spring menu with smoked rib sliders and farrow salad coming your way!! Beep beep	f	1433086356	1430923962	Comfort	\N	533ddd4a498e774b8250a69b	\N	54	\N
langos	Langos	langostruck	http://www.langostruck.com/	Good morning\nlunch time we're at\n52nd. St bet 6-7 Ave (closer to 6)\n11-2:30pm\n\nnight Long Island City Queens\n5St & 47Rd.\n5-8:30pm	f	1432735121	1432904702	Hungarian	\N	537a883c498eb7fac064409f	\N	61	\N
greenradish	The Green Radish	thegreenradish1	http://www.thegreenradish.com/	Good Day to GetNaked NakedBeanBurgers 47th between Park and Lexington https://t.co/4ou7IczI7R	f	1433017431	1432902203	Vegan		5229feab11d2edde794d385c	\N	17	\N
disos	DiSO's	disosnyc	http://www.disosnyc.com/	Friday's society lunch meetings on 46th and 6 today. \n\nCall in orders to: 917-756-4145	f	1432220718	1430489419	Italian Sandwiches	These might be typical italian sandwiches but the ingredients are high quality. You need to get there early because the line can get long and they will run out of some breads. I believe the focaccia half is a normal portion for lunch while their half and hero sizes are pretty big.	519523d6498eeaa6200aad03	\N	13	\N
shortys	Shortys	shortysnyc	http://www.shortysnyc.com	Up and running at SouthStreetSeaport South and Fulton Streets Cheesesteak ChickenCheesesteak RoastPork... http://t.co/awyzKOzJqw	f	1433112491	1415982867	American		4faea2cce4b08a88c5dc5d05	\N	58	\N
carpedonut	Carpe Donut	carpedonutnyc	http://carpedonutnyc.com/	Truck open at 55th street and Broadway. Come!!!	f	1433071460	1432895891	Sweets	They only server one kind of donut here, the apple cider, but it's a pretty good one. They are fresh and still hot when you get them. They have donut ice cream sandwiches but you should know the entire thing is in the freezer so you will get a frozen donut as well.	5169892c498e0522481eea97	\N	28	\N
andysitalianice	Andy's Italian Ice	andysitalianice	http://andysitalianicesnyc.com/	We are loving this nice weather! Come find us in Union Square till 9pm !!!	f	1432764026	1432941500	Dessert	\N	4df26c2bae609e69dd95d2fc	\N	37	\N
yankeedd	Yankee Doodle Dandy's	usafoodtruck		Fried Day! Come and get the best food in the city at 39th and Broadway at urbanspace or swing by the Intrepid for your base. gorangers	f	1433118694	1432917729	American	\N	52b497e1498eed13ead2b84c	\N	8	\N
schnitzelcart	Schnitzel & Things Cart	schnitznthings	http://schnitzelandthings.com	It's Schnitzel time.  The cart will be on 27th & Park serving up your favorite lunch!	f	1431702487	1426694447	German	\N	4a6640b3f964a5204cc81fe3	(schnitzcart|the cart)	71	contains
lukeslobster	Luke's Lobster	nautimobile	http://lukeslobster.com/	This is it, our last day on the streets of NYC. 17th st and 5th ave. So long, farewell, see ya when we see ya.	f	1433085776	1430398345	Seafood		4dc81239b0fb5556cd2f3023	\N	86	\N
carls	Carl's Steaks	carlssteaks	http://carlssteaks.com/home/	Scream it from rooftops it's CHEESESTEAK FRIDAY ! 56th st / Bdwy @randomfoodtruck @victoriasecret @UMG @Barclays... http://t.co/7spL7HYg2b	f	1432998786	1432911642	American		51a78330498e3fc1f22d771e	\N	29	\N
latinkitchennyc	Latin Kitchen	latinkitchennyc	http://www.latinkitchennyc.com/	HAPPY HALLOWEEN ! ! TODAY OUR LAST FRI OF 2014 ..THANK YOU WALLSTREET! !\nLOCATION 55 WATER ST (SIDE OF OLD SLIP) NYC http://t.co/RWCtK9bCEc	f	1433062647	1414768415	Mexican	\N	53878518498ef00115dbdea1	\N	73	\N
palenque	Palenque	palenquefood	http://www.palenquehomemadecolombianfood.com	RT @starrettlehigh: @tosty17 Have @Palenquefood contact the @nycfoodtruck & tell them it's interested in being at StarrettLehigh!	f	1432857229	1428705650	Colombian Fusion		4e84f424dab45bbd2617dc62	\N	46	\N
hh2	Habachi Heaven 2	hibachiheaven	http://www.hibachiheaven.com/	Open and ready to roll corner of Varick and King	f	1428064651	1423759572	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	1	38	two
pontirossi	Ponti Rossi	pontirossifood	http://www.pontirossifood.com/	@stefferonipizza Siamo qui sulla 38&broadway fino Alle 7 pm  ciaooooo Stefyyy	f	1433167651	1433019687	Italian	\N	542d78f4498ee5493e1a8989	\N	7	\N
polish	Old Traditional Polish Cuisine	polishcuisine	https://www.facebook.com/pages/Old-Traditional-Polish-Cuisine/315496671902708	Let's do this - 55th & Broadway - Pierogitime @randomfoodtruck	f	1433169173	1432912950	Polish		51435df4e4b0823a398ebc8a	\N	28	\N
dubpies	DUB Pies	dubpies	http://www.dubpies.com/	PieTruck is at Hudson & King, Soho - serving cold brew, savory & sweet pies from 11am to 2.30pm. foodtrucks NYC NZ	f	1433168040	1432908646	New Zealand meat pies	\N	4eb825a62c5b53141b78bfb6	\N	39	\N
eddiespizza	Eddie's Pizza	eddiespizzany	http://www.eddiespizzany.com/	We are serving lunch today at starrett lehigh building on 26th between 11th and 12th avenue from 11am-3pm. call... http://t.co/taVPGUrs8f	f	1432652131	1433160568	Pizza		4c0cf412b4c6d13ae4850c30	\N	2	\N
sweetery	Sweetery	sweeterynyc	http://sweeterynyc.com	Serving at Hudson/King St 375 Hudson Street New York From 7:30AM-3:00PM EDT http://t.co/aR2bxNYVPT	f	1432907954	1432899308	Sweets		4a28d919f964a52056951fe3	\N	39	\N
mausam	Mausam	mausamnyc	http://www.mausamnyc.com	Curry Thursday @dumbolot don't forget to grab a delicious mango lassie http://t.co/1r4tLgSuuy	f	1433079414	1432822177	Indian		50730eebe4b0f3224431dc5d	\N	54	\N
schnitzi	Schnitzi	schnitzi1	http://www.schnitzi.com/	It seems like it is going to be a nice day today, @46 St bet 5&6 serving lunch from 11:30 until 3:30 schnitzitruck http://t.co/vR5tgBHsTH	\N	1433167952	1432214325	German	\N	532b25ed498eb8b1844dc14f	\N	14	\N
toum	Toum NYC	toumnyc	https://www.facebook.com/ToumNYC	Don't let the rain stop you from having a delicious LebaneseLunch! Pre-order at 917-TOUM-350 & pick up from Jay & Water St in @DumboNYC!	f	1433165237	1433169417	Lebanese		500eedb0e4b062ee00577957	\N	57	\N
milktruck	Milk Truck	milktrucknyc	http://www.milktrucknyc.com	Hey wallstreet we are at Wall St and William St! Call 646-504-6455 or @foodtoeat.com to preorder. We're also at @TheSeaport 19 Fulton	f	1433159176	1432917330	American		4e823c0229c2dbb2b7043972	\N	41	\N
eggstrav	eggstravaganza	etravaganza	http://www.eggstravaganzany.com/	Good morning breakfast is served!! join us 52nd and Park is the  place.	\N	1432826618	1432732305	Mexican	\N	4b15165ef964a52049a823e3	\N	72	\N
pocketful	The Pocketful	thepocketful	http://thepocketful.com/	Our cart is back on 50th between 6th and 7th. Enjoy the sunshine!	f	1429888965	1430145608	Mediterranean		4db8bcd790a0e3f61d601888	\N	22	\N
neapolitan	Neapolitan Express	neaexpress	http://neapolitanexpress.com/	RT @dumbolot: We got @DomoTaco @NeaExpress and @SnowdayTruck today!	f	1430619288	1430384689	Pizza		51c8864c498e0ac96c14433e	\N	54	\N
lobstertruck	Red Hook Lobster	lobstertruckny	http://redhooklobster.com/	BigRed is on 46th & 6th today	f	1432830871	1432908956	\N		4dc597c57d8b14fb462ed076	\N	13	\N
biandang	Bian Dang	biandangnyc	http://www.biandangnyc.com/	Stewing up porkbelly and beefstew on 53rd & Park!	f	1431450031	1433167398	Taiwanese		4d712874722ef04d04160d9c	\N	26	\N
domo	Domo Taco	domotaco	http://www.domotaco.com	Happy Friday! Catch the truck on Water & Old Slip or our booth on 39th & Broadway!	f	1433167507	1432909853	Asian Fusion		4ed90a2e77c8274efb746d83	\N	8	\N
wafelMomma	Wafels & Dinges Momma	waffletruck	http://www.wafelsanddinges.com/	De TRUCKS:\nKastaar @ Horace Mann School til 4pm  Momma Truck @ 40th & Park til 4pm	f	1433166637	1432313318	Belgian		4a416369f964a52036a51fe3	momma	9	before
souvlaki	Souvlaki GR	souvlakitruck	http://www.souvlakigr.com/	@MKramerTV We are on 55st/Broadway\nStop by for a little taste of Mykonos\n@randomfoodtruck till 3 pm.	\N	1433095831	1431701151	Greek	\N	4c75c2908d70b713d5dcdaad	\N	28	\N
valduccis	Valduccis	valduccis	http://valduccis.com	@starrettlehigh  come on down We are ready !!!! http://t.co/7omYjzU5Gy	f	1433010729	1432915482	Pizza		4df7e1aad4c02ad734170b21	\N	46	\N
treats	The Treats Truck	thetreatstruck	http://www.treatstruck.com	!!! 12-2:30pm 45th st & 6th ave! Then 3:45ish-7pm Bway (86th & 87th)!!!	f	1433079280	1432828485	Sweets		49e65021f964a52035641fe3	\N	12	\N
wafelKastaar	Wafels & Dinges Kastaar	waffletruck	http://www.wafelsanddinges.com/	De TRUCKS:\nKastaar @ Horace Mann School til 4pm  Momma Truck @ 40th & Park til 4pm	f	1433166637	1432313318	Belgian		4a416369f964a52036a51fe3	kastaar	9	before
gorilla1	Gorilla Cheese 1	gcnyc1	http://www.gorillacheesenyc.com/	G1 46 5/6\nG2 broadway / 55th \nComeToTheCheeseYo	f	1433119254	1432904163	American		4dc2d3e352b1c1fb37f1e945	g1	28	before
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
Disos will be back on the streets serving our normal lunch schedule the 2nd week of June..	1432220718	601403399003856897	f	disosnyc
RT @LifeOfJordo: Got to meet Adam from @DiSOSNYC and talk about toasted raviolis. The fried cookies were awesome! http://t.co/2p2LQmEsbf	1431927829	600174934971666432	f	disosnyc
You guys were awesome.. Hopefully we meet up again in St. Louie!!! https://t.co/133TD3undB	1431920535	600144339184975872	f	disosnyc
Meatball Sliders come out to the bigredtruck sedona disosnyc is here for you. @SedonaAZ @SedonaTV @SedonaMagazine http://t.co/r89HwGfA7K	1431905048	600079381248118784	f	disosnyc
Parmesan Fries are hot and ready. @sedonatalkradio @SedonaMagazine @SedonaAZ @SedonaLine @SedonaTV http://t.co/NGNewqOYEa	1431904760	600078173439533056	f	disosnyc
We are in front of Cheers sedona come on and get it. @sedonatalkradio @SedonaMonthly @SedonaLine @SedonaMagazine http://t.co/cfZkQxRNgP	1431904694	600077896246431744	f	disosnyc
RT @D_MS_DH: @DiSOSNYC bring that back to NYC	1431900782	600061490142449664	f	disosnyc
@eric_zimm maybe 3 weeks around? Well keep everyone posted when we do.. We're touring the country selling food	1431899553	600056334491328512	f	disosnyc
We just did a rattlesnake rabbit sausage and peppers hero with a spicy Diablo marinara sauce http://t.co/iiB0MaTjqR	1431899125	600054538691829761	f	disosnyc
Hey sedona we will be serving up Italian specialties at 3pm. @sedonatalkradio @SedonaMonthly @SedonaMagazine @SedonaAZ @RockyMtnChocInc	1431898707	600052787892748288	f	disosnyc
Oh snap! See you soon Sedona. We are on our way. disosnyc sedonaaz @SedonaMagazine bigredtruck foodtruck http://t.co/8fKI0ctKZm	1431873740	599948068499296256	f	disosnyc
RT @ChefDanamarie: Sedona you gave us a double rainbow! sedona  @SedonaMagazine @AllAboutSedona @sedonatalkradio @Sedona_AZ @DiSOSNYC http...	1431872590	599943243938209792	f	disosnyc
RT @ChefDanamarie: Parmesan Fries! Thanks for the support Sedona @AllAboutSedona @sedonatalkradio @SedonaMagazine disosnyc @DiSOSNYC http...	1431872576	599943184395833344	f	disosnyc
Thanks for the rainbow Sedona we hope to see you again tomorrow. Stay tuned! bigredtruck @SedonaMagazine @SedonaAZ http://t.co/wcBMHuTXhu	1431836283	599790962685018112	f	disosnyc
Thanks to @RockyMtnChocInc in sedona for providing samples to all our customers today. Sedona bigredtruck http://t.co/QErFnTY6d6	1431835183	599786347621011457	f	disosnyc
Chicken Pesto come get one @SedonaMagazine @SedonaAZ sedona we are parked infront of Cheers! http://t.co/PhhEvkdka2	1431819892	599722212350763008	f	disosnyc
@sedonatalkradio @SedonaMonthly @SedonaLine @SedonaAZ we are here big red truck. sedona sedonafooftruck Sedonaarizona	1431809921	599680390723284993	f	disosnyc
@valengostyle open in Sedona Arizona right now	1431808452	599674228720291840	f	disosnyc
@valengostyle yes cheers parking lot off 89a	1431808430	599674136709890048	f	disosnyc
Disos is now in Sedona Arizona serving authentic Italian all day.. We're in the Cheers parking lot route 89A and Forrest Rd.	1431807874	599671805746413568	f	disosnyc
RT @The_SMT: @thegreenradish1 or @BeyondSushi for lunch. Cant decide!!!! veganproblems	1432950837	604465740910067712	f	thegreenradish1
Gluten free PeanutButterCookies.... http://t.co/9y4QChsLIE	1432915516	604317591792979968	f	thegreenradish1
BlackBeanBurger hat trick Go @NYRangers @jpmorgan @Gothamist @nypost @PageSix @TheGarden @midtownlunch @ZagatNYC http://t.co/WMl7Sxon1Q	1432909864	604293886035521536	f	thegreenradish1
Good Day to GetNaked try our Naked Organic Bean Burger, romaine, spiced ketchup, toasted Ciabatta...$8.00..Kale... http://t.co/OyayFmsrIg	1432903261	604266193789259776	f	thegreenradish1
Good Day to GetNaked NakedBeanBurgers 47th between Park and Lexington https://t.co/4ou7IczI7R	1432902203	604261753137029120	f	thegreenradish1
Good Day to GetNaked try our NakedBurger romaine/spiced ketchup $8 47 Park/Lex @jpmorgan @UrbanSpaceNYC @nystfood @nypost Go @NYRangers !!!	1432901361	604258222355124224	f	thegreenradish1
Fast Veg It WhiteBeanBurgers w/SweetPotato and SpicyKetchup today 47th between Park and Lexington Ave. 11-2 @jpmorgan @Chase @midtownlunch	1432900644	604255215747997696	f	thegreenradish1
Hey @NYRangers fuel up with BlackBeanBurger Hat Trick 47 between Park and Lexington @jpmorgan http://t.co/t8XLZT41x2	1432896697	604238660003848193	f	thegreenradish1
Standing together..live long, eatplants http://t.co/GRldu7tSZv	1432828871	603954176499003393	f	thegreenradish1
Come and get your FastVeg today 52&6thAve 11-2pm @RollingStone @usweekly @ubs @UrbanSpaceNYC @NewYorker @DharmaYogaNYC @CBSNews @EaterNY	1432826760	603945323652849664	f	thegreenradish1
GoodDay4 BBQ BlackBeanBurgers 52&6ave 11-2 @RollingStone @midtownlunch @WSJ @UBS @MensHealthMag @usweekly @PageSix http://t.co/a6NHwVvhq4	1432818774	603911828138237952	f	thegreenradish1
Meeting of the minds... https://t.co/mMuzT3NSSe	1432818480	603910594593484800	f	thegreenradish1
Hey @UBS BlackBeanBurgers outside your window today Thurs 52&6 11-2 GetRad EatPlants http://t.co/Nx9M6R1PGf	1432818342	603910013699100672	f	thegreenradish1
Meeting of the minds...@EFAnimals @GarmentDstrctNY today 38&bway  11-2 http://t.co/WX6Qrs4uix	1432741408	603587329748500480	f	thegreenradish1
GoGreen EatPlants today 38&bway 11-2 BBQ BlackBeanBurgers Choc-Coconut Donarts , oh yeah! @GarmentDstrctNY http://t.co/m5tET0U6gG	1432737847	603572396713517056	f	thegreenradish1
EatPlants FlyHigh    plantbased vegan organic yoga https://t.co/Tvok0Kh1pk	1432728802	603534458424266752	f	thegreenradish1
Taste Summer-BBQ BlackBeanBurger 38th&Bway 11-2 @GarmentDstrctNY @EFAnimals @BrianLehrer @PageSixEmily @ZagatNYC http://t.co/loImc5zf3t	1432728410	603532812248096768	f	thegreenradish1
ComeTasteSummer...51&madison 11-2 @blackrock @nycfoodtruck @AceNatural @CitiBikeNYC @midtownlunch @PageSix @Lululemon http://t.co/XyHQ3xahxB	1432652838	603215841233137666	f	thegreenradish1
Invest inYourHealth EatPlants New WhiteBeanBurger on toasted Ciabatta today 51&madison 11-2 @blackrock @TandTNutrition @goop @DrEsselstyn	1432641439	603168032249257984	f	thegreenradish1
Try our new 1/4lb WhiteBeanBurger on toasted Ciabatta today 51&Radison 11-2 @blackrock @midtownlunch @grubstreet @EatStTweet @UrbanSpaceNYC	1432638887	603157325222912001	f	thegreenradish1
RT @34thStNYC: Looking good ;) RT @NuchasNYC: Spring view in Greeley Square MuchasNuchas http://t.co/eoWyp5NvMG	1432915288	604316636275961857	f	nuchasnyc
Spring view in Greeley Square MuchasNuchas http://t.co/pVx2xRedvk	1432850038	604042957281464320	f	nuchasnyc
Spring view in Greeley Square MuchasNuchas 34thStNYC	1432849936	604042530267774976	f	nuchasnyc
Truck moved to E 14th St. & Irving Pl. followthetruck MuchasNuchas	1432672254	603297276359024642	f	nuchasnyc
Coffee love at first sight MuchasNuchas coffee GreeleySquare 34thStNYC http://t.co/gLhYfh2OFY	1432661010	603250119358681088	f	nuchasnyc
Start your day fresh! Catch the truck at Pearl St. & Broad St! MuchasNuchas	1432652067	603212609089884160	f	nuchasnyc
RT @OpyMorales: Empanadas @NuchasNYC http://t.co/Bgpq3Dw95c	1432500232	602575766379954176	f	nuchasnyc
Nuchas Truck at the Apple Store in Broadway and 67th street! upperwestside MuchasNuchas http://t.co/zp19RLe8UW	1432482434	602501113863081984	f	nuchasnyc
Nuchas Truck at the Apple Store in Broadway and 67th street! upperwestside MuchasNuchas http://t.co/3tMTgwe11c	1432482393	602500943406596097	f	nuchasnyc
Nuchas Truck location! Near 115145 W 67th St in New York	1432480920	602494766924697602	f	nuchasnyc
Truck ready at E 14th St. & 3rd Ave! Enjoy your weekend! MuchasNuchas	1432393855	602129588270018561	f	nuchasnyc
Nuchas Truck alert! Near 115145 W 67th St in New York	1432333327	601875716976738305	f	nuchasnyc
Nuchas Truck alert! Near 75 Broad St in New York	1432309537	601775932697759744	f	nuchasnyc
Nuchas Truck alert! Near 116198 E 14th St in New York	1432237769	601474914508505088	f	nuchasnyc
Artisan empanadas at Varick St & Charlton St!! MuchasNuchas	1432134752	601042832179253248	f	nuchasnyc
Truck moved to E 14th St & 3rd Ave! KeepTrackOfTheTruck MuchasNuchas	1432071351	600776908649926656	f	nuchasnyc
Parked at Bridge St & Broad St! Eat on the go!! MuchasNuchas	1432047112	600675243968040960	f	nuchasnyc
Lunch time! Truck spotted in front of New York University! MuchasNuchas	1431968053	600343646391635968	f	nuchasnyc
RT @DispatchNY: .@prospect_park FoodTruckRally Tomorrow 5/17, 11a-5p w/ @KelvinSlush @gcnyc1 @NuchasNYC http://t.co/qV9u4wZY2D	1431805524	599661948456808448	f	nuchasnyc
Are you hungry?? Meet us in Washington Square Park!! Delicious empanadas waiting for you!	1431788436	599590275258941440	f	nuchasnyc
Chillin' w/ @methodman in DUMBO Brooklyn MethodMan WuTang Bigdsgrub http://t.co/0l4JmzHkUL	1432927065	604366031365238786	f	bigdsgrub
Let's end the week off proper! 50th Street btwn 6th and 7th Avenue. http://t.co/kBXcOfuvrr	1432904548	604271591082561536	f	bigdsgrub
D2 is BACK!! Jay and Water Street @dumbolot @DUMBOFoodTrucks @DUMBOBID @hugeinc TGIF http://t.co/IysVio6Cti	1432904424	604271070003220480	f	bigdsgrub
53rd Street and Park Avenue http://t.co/iJtKxIvw6L	1432827444	603948190484803586	f	bigdsgrub
Let's GRUBBBB!!! 50th Street btwn 6th and 7th Avenue http://t.co/883KTdOYTd	1432827398	603947998956146688	f	bigdsgrub
D1 is grillin' it up at 50th Street btwn 6th and 7th Avenue! http://t.co/0g1KhjYF0o	1432818244	603909604662235136	f	bigdsgrub
Don't miss out.  D2 has all your favorite specials at 53rd Street and Park Avenue today!! http://t.co/pvGHbrPdR5	1432818141	603909171474489344	f	bigdsgrub
Waiting on Tom to get into @QnsNightMarket  https://t.co/VyTjv6fdpc	1432762918	603677550708142080	f	bigdsgrub
RT @feistyfoodie: Today's lunch and dress ... spicy pork and bulgogi over rice from @bigdsgrub , and a black skater... https://t.co/WVhhaV...	1432762888	603677426477043712	f	bigdsgrub
We're both friends with Art S  https://t.co/f7EkOEBjO9	1432750414	603625105323925506	f	bigdsgrub
@feistyfoodie we have a side of rice here with your name on it if you can swing back around	1432749912	603623000068497408	f	bigdsgrub
Let us know you want more rice next time  https://t.co/HTmFSabf8g	1432749780	603622444092563459	f	bigdsgrub
D2 is at @starrettlehigh. 26th Street btwn 11th and 12th Avenue w/ all your favorite Thai & Vietnamese dishes! http://t.co/Es2NVNI7g4	1432733816	603555488031191040	f	bigdsgrub
D1 is at 53rd Street and Park Avenue!! http://t.co/tJ3TSNDxpt	1432733590	603554539766165504	f	bigdsgrub
RT @starrettlehigh: @bigdsgrub Menu looks pretty good! :) FoodieFindings	1432733550	603554372677705728	f	bigdsgrub
Leave your lunches at home tomorrow, we'll be at @starrettlehigh! StarrettLehigh http://t.co/UWd8k3Vpdz	1432673738	603303502786461696	f	bigdsgrub
@deancollins we were in Dumbo earlier everywhere pretty quiet today	1432580450	602912224978567168	f	dubpies
Come n' Grub at 50th Street btwn 6th and 7th Avenue.  Lunch is 11am to 2:30pm http://t.co/vbANfD866k	1432645947	603186940586909696	f	bigdsgrub
D2 is at Hudson/King St. today!  See you for lunch!!! SoHo WestVillage http://t.co/54lW6vf3ib	1432645548	603185263620313088	f	bigdsgrub
It's a WRAAAP!  Have a great long weekend everyone!	1432320258	601820900162437120	f	bigdsgrub
Let's do lunch! 50th Street btwn 6th and 7th Avenue. 11am to 2:30pm	1432307747	601768424440778753	f	bigdsgrub
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
We will be in dumbo today everyone. On fronts and Adams at 12pm  @DUMBOFoodTrucks	1412171029	517308908877389824	f	parissandwich
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
First breakfast in 30 days. EidMoubarak http://t.co/uNhde7Ibmx	1406548402	493725899762589697	f	trucktotable
We are loving this nice weather! Come find us in Union Square till 9pm !!!	1432941500	604426576181215233	f	andysitalianice
We are now open on 55th and Broadway. @nycfoodtruck @grubstreet @StreetGrubSteve	1432830082	603959254748426240	f	andysitalianice
Sorry ice lovers we will actually be off the road the rest of the evening for some maintenance.	1432764026	603682195954339840	f	andysitalianice
At a private event today! Union square by 5pm. Sorry for the late tweet @nycfoodtruck	1432748666	603617772686471168	f	andysitalianice
We are now open! On 32nd and Park Avenue. Till 5pm @nycfoodtruck @grubstreet @StreetGrubSteve @NewForkCityNY	1432656349	603230569749737472	f	andysitalianice
You're now open on 40th and 6th ave @nycfoodtruck @grubstreet @bryantparknyc  till 2:30 then heading to Long Island	1432309194	601774494634639360	f	andysitalianice
Have you checked out our new cups yet? Goodbye Styrofoam hello paper. http://t.co/e2ahhatCSJ	1432223851	601416540710412288	f	andysitalianice
We are now open on 32nd and Park ave. Till 2 PM then off to a private event.	1432223732	601416042376798208	f	andysitalianice
Unfortunately this weather does not want to cooperate. We will be off the road today. @nycfoodtruck	1432125133	601002487169077248	f	andysitalianice
Sorry everyone the rain is keeping us in bed. See you all tomorrow. @nycfoodtruck	1432038992	600641185334558720	f	andysitalianice
Today join us on this amazing day @MAMAPALOOZA from 11-5pm. @nycfoodtruck	1431875670	599956163640356865	f	andysitalianice
Cater you next private event with us. http://t.co/NgECIhHuwu	1431819148	599719091989913600	f	andysitalianice
Today we are scooping it up with at the YMCA 64th and Broadway cool down with us and grab a slice of pizza @Valduccis @nycfoodtruck	1431782545	599565569571041280	f	andysitalianice
We are now open on 47th and park throwing it back. Come cool down with a ice or try one of our amazing new smoothies. @nycfoodtruck	1431702822	599231187681435648	f	andysitalianice
Now open on 55th and Broadway for all your Italian nice and smooth he needs till 3 PM @nycfoodtruck @EatThisNotThat @grubstreet @EatStTweet	1431624271	598901719985213440	f	andysitalianice
Did you know most of out Italian Ices are dairy free! gluten nycices andysitalianicesnyc	1431561732	598639411065200641	f	andysitalianice
We are now open in Union Square till 9 PM I'm cool down with a Italian ice or smoothie.	1431542396	598558311198400512	f	andysitalianice
RT @FordhamRoad_NYC: Get ready for out-of-this-world flavors!  @nycfoodtruck @NJFoodTrucks  ILoveFordhamRoad http://t.co/rF1XLT1XP4	1431542322	598557999913967616	f	andysitalianice
Sorry we had to relocate and move early heading into Union Square.	1431541224	598553396560310272	f	andysitalianice
Find us today on 40th and 6th Ave @bryantparknyc till 5pm	1431528684	598500798666919936	f	andysitalianice
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
RT @randomfoodtruck: Get a picnic and eat outside! @CarpeDonutNYC @MamasHeros @souvlakitruck @PolishCuisine @carlssteaks @gcnyc1	1432916968	604323682601717761	f	gcnyc1
G1 46 5/6\nG2 broadway / 55th \nComeToTheCheeseYo	1432904163	604269975281537024	f	gcnyc1
@Pier_13Hoboken NJFoodTrucks \n@MordisFoodTruck @themoofoodtruck @plumontherun @TheIncrediballs @themoofoodtruck @OINKandMOObbq @waffledely	1432846459	604027946840514560	f	gcnyc1
RT @FordhamRoad_NYC: @News12EP @gcnyc1 glad you enjoyed!! Thanks for coming!	1432845993	604025990822633472	f	gcnyc1
RT @News12EP: Thanks @gcnyc1 for the yummy Mac & Cheese bites & Grilled Cheese!  So good!  Thanks for bringing them to The Bronx @Fordham...	1432845980	604025939534712832	f	gcnyc1
RT @BxArtsFactory: Next Thursday! Tasting the World Mural Match during @FordhamRoad_NYC Food Truck Event! Sponsored by @Blick_Art http://t....	1432835818	603983317017436160	f	gcnyc1
RT @FordhamRoad_NYC: See all the improvements at Bryan Park https://t.co/epR9ExBit5	1432835807	603983270519447552	f	gcnyc1
RT @FordhamRoad_NYC: In case you forgot, here's our event page for Fordham's Food Truck Extravaganza http://t.co/OgDZ5lK77j	1432835804	603983254648131584	f	gcnyc1
RT @News12EP: Food trucks on Fordham Road in The Bronx today!!  Anyone going to check it out??  I plan on it. @FordhamRoad_NYC http://t.co...	1432835797	603983225439002624	f	gcnyc1
RT @FordhamRoad_NYC: Everyone's here! The first annual Fordham Food Truck Extravaganza! http://t.co/GMQrGV4YQC	1432835779	603983151787028481	f	gcnyc1
G1 - Hanover water / pearl \nG2 - @FordhamRoad_NYC\n Bryan park at the intersection of E Fordham rd and E kingsbridge \nComeToTheCheeseYo	1432831900	603966881712742400	f	gcnyc1
@emkropp sorry...we had to leave...prior obligation  @FordhamRoad_NYC	1432831776	603966361262542849	f	gcnyc1
Rockin @Pier_13Hoboken today w/ @themoofoodtruck @TheIncrediballs @AmandaBananasNJ  @MexiFlips hoboken @  NJFoodTrucks\nComeToTheCheeseYo	1432758423	603658698586722306	f	gcnyc1
RT @EBAYJUNKIE: @gcnyc1 best grilled cheese http://t.co/XDkp719aio	1432758160	603657593257623552	f	gcnyc1
RT @AmandaBananasNJ: Catch us at @Pier_13Hoboken today with @themoofoodtruck @TheIncrediballs @gcnyc1 @MexiFlips hoboken NJFoodTrucks	1432758150	603657552560263168	f	gcnyc1
@bigdsgrub @starretlehigh	1432743533	603596243638558720	f	gcnyc1
G1 47 lex/park\nG2 46 5/6\nComeToTheCheeseYo	1432739699	603580162442186752	f	gcnyc1
G1 Hudson / king \nG2  33/Park\nComeToTheCheeseYo	1432651244	603209155671924736	f	gcnyc1
1 truck available for Sunday  & Monday.. \nU Rent the Truck, We bring the Cheese\nhttp://t.co/oYLeKPMkVo	1432413928	602213780609757184	f	gcnyc1
RT @randomfoodtruck: Start the long weekend off right! @Chefsamirtruck @souvlakitruck @PolishCuisine @MamasHeros @gcnyc1	1432308592	601771967428067329	f	gcnyc1
RT @gaddylane: Hot craw-diggity, it's ON. Sun, 6/14, @SycamoreBklyn 6th annual crawfish boil. http://t.co/3vtTSpNsLZ http://t.co/XsU2AmSH1S	1432918849	604331574423769088	f	kimchitruck
RT @keithbacker: Kimchi Fish Bowl with @KimchiTruck goodlife sowoneulmarhaebwa http://t.co/gtL8L952Oz	1432918630	604330655078432768	f	kimchitruck
RT @beckysoto: @KimchiTruck best news I've heard ALL DAY.	1432909897	604294023981858817	f	kimchitruck
Couldn't think of a better way to end a 4 day work week than with TACOS. Find us on 52nd & 6th, 11:30 - 2:30	1432906206	604278544584192000	f	kimchitruck
Ready to shake it w/ our tacos tonight? @BklynBrdgPark @CelebrateBklyn	1432846070	604026316875145216	f	kimchitruck
Slinging tacos on Hudson & Charlton St. 11:30 - 2:30. Amen!	1432822808	603928746232537089	f	kimchitruck
Midtown, we're coming for ya. 52nd & 6th, 11:30 - 2:30 pm.	1432735395	603562110958731267	f	kimchitruck
Here to cushion your return to work, oomph. KimchiTacosMakeEverythingBetter @dumbolot Jay & Front, 11:30 - 2:30	1432648258	603196629848444928	f	kimchitruck
@Mutantfroginc No truck today- sorry!	1432308622	601772095236808704	f	kimchitruck
Have a delicious Memorial Day Weekend, folks. We'll check out your tan next week!	1432302027	601744432652746753	f	kimchitruck
RT @sisiwei: @KimchiTruck You guys are now my total favorite.	1432224114	601417641266319360	f	kimchitruck
@sisiwei Yes, we have vegan kimchi avail :)	1432223784	601416260711161856	f	kimchitruck
RT @mrroselli: @kimchitruck @aaps59 @Mars478 go get it boys.	1432221119	601405080642785280	f	kimchitruck
Make that Hudson & King!	1432219670	601399002446233601	f	kimchitruck
Need a taco fix before you take off for the weekend? Catch us on Hudson & Charlton, 11:30-2:30	1432216673	601386432855314432	f	kimchitruck
RT @trendyvacations: Grab fish tacos and kimchi fries if you are near 52nd and 6th from @KimchiTruck NYC HumpDay SateTheHangry  https://...	1432140098	601065253623832576	f	kimchitruck
On our way to 52nd & 6th!	1432127572	601012715943931904	f	kimchitruck
@TonyMazza_ @dumbolot water and jay	1432054075	600704449368186881	f	kimchitruck
RT @TonyMazza_: @KimchiTruck @dumbolot i'll come	1432051006	600691573932843009	f	kimchitruck
Dumbo, we're coming atcha. Catch your gorgeous faces today 11:30 - 2:30 @dumbolot	1432043224	600658933372563456	f	kimchitruck
Good morning\nlunch time we're at\n52nd. St bet 6-7 Ave (closer to 6)\n11-2:30pm\n\nnight Long Island City Queens\n5St & 47Rd.\n5-8:30pm	1432904702	604272237114454016	f	langostruck
Hi Midtown\n\nWe're at 52 Street bet 6-7ave \n(closer to 6)\n\n11-2:30pm\nmidtown foodtruck hungarian  skirt steak http://t.co/gdpNgPWWho	1432735121	603560961920892928	f	langostruck
Good morning FiDi\nLangos Truck at\nWater St.& Old Slip\n11-2:30pm\n\nEvening Long Island City(Queens)\n\n5St & 47road\n5-8:30pm\nfood trucks	1432643288	603175785919315968	f	langostruck
RT @thegreenradish1: A change is in the air....\n\nWe have some permit drama, but were not going to let this unfortunate dance that NYC... htt...	1432565783	602850708241649664	f	langostruck
@vivalavanway \nWill be 31street & 30th. Ave	1432484747	602510818182307841	f	langostruck
@vivalavanway \n\nSee you next Thursday in Astoria 5-8:30pm	1432484482	602509703554404352	f	langostruck
@vivalavanway \nHi Jackie we taking off tomorrow \nThanks	1432478513	602484668953456642	f	langostruck
Enjoy your long weekend\nWe're at Broadway & bet 67-68 St \n(west side)\n11-6pm \napple store mangalitsa hungarian  http://t.co/oG9TgDZWPw	1432474773	602468983372161024	f	langostruck
Good Morning FlatIron\nYou can find Us\n21St/ 5ave\n11:30-2:30pm\n\n5-11pm East Village front of KeyBar\n13St. Bet Ave A & 1Ave\nEnjoy you weekend	1432304231	601753676756230144	f	langostruck
We would like to give you some heads up where we will be tomorrow night. \nAt Keybar , east village  \nfrom 5-11pm. \nMore info: 646-286-9949	1432250423	601527990028210176	f	langostruck
Hi there\nLunch at 52St. Bet 6-7Ave (closer to 6Ave)\nPlease visit us , and see you soon\nnyc foodtruck schnitzel http://t.co/Ttms9bs7fW	1432214221	601376148531105793	f	langostruck
@AudreyCrumb \n\nDear Audrey\nNext Thursday we will visit Astoria\n\nThank you	1432214054	601375449776807936	f	langostruck
Good morning Midtown\nL-T  at 52nd.St bet 6-7 Ave (closer to 6)\nCome to see us , we make yo happy.\n11-2:30pm	1432126440	601007967916396544	f	langostruck
Hi Long Island City\nWe are here for you till 8:30pm\ncoca cola nyc food truck fresh hungarian http://t.co/atr3ipDKmW	1432070128	600771779045515264	f	langostruck
Langos Truck going to Budapest Tour http://t.co/dA1XJWvGAu	1432046763	600673777345769472	f	langostruck
Good morning FiDi\nWe are ready by 11am\nCorner of Water St. & Old Slip\nTill2:30pm\n\nEvening Long Island City\n5-8:30pm\n\nEnjoy your day	1432037619	600635427528278016	f	langostruck
Dear Friends \nHope you had a lovely weekend,\nBack to Midtown.\n47th. St bet Park & Lexington Ave\n11-2:30pm\nSee you soon\nnyc foodtruck	1431954881	600288396037246976	f	langostruck
RT @thegreenradish1: Our ticket bin...nyc proud supporter of killing food trucks... what gives, @BilldeBlasio http://t.co/kqLnq93F3T	1431776088	599538487587659776	f	langostruck
Hi Midtown \nFinally is Friday\n47th. St. & Park \n11-2:30pm\n\nFoodTruck hungarian nyc Friday	1431689719	599176229678358528	f	langostruck
Good morning \nYou can find fresh crispy delicious langos and more \n52St bet 6-7 Ave(closer to 6)\nFrom 11-2:30pm\nEnjoy	1431605664	598823673898860544	f	langostruck
mandatory mandarita - it's friday, people  TreatYoSelf\n\nPhoto: no2el https://t.co/klHIuIL19E	1432930226	604379289438556160	f	mexicue
Wanna be startin' somethin'\n\napps & sides for the win  http://t.co/CeRMnxMVCA	1432740618	603584017284337665	f	mexicue
@mikeavila thanks for the good words!	1432662051	603254485117435904	f	mexicue
Tacos are the answer \n\n: @bibilovesrady http://t.co/G9sKfO3VSK	1432654042	603220893247086592	f	mexicue
the best MDW BBQ is the one you don't have to cook\n\nsmoked chicken sliders at MadSqEats\n\nPhoto by @nycdining http://t.co/o0ZE4itoLa	1432571417	602874338929422337	f	mexicue
RT @leepatty: Where to eat on Memorial Day weekend: @Mexicue brunch, @TheDutchNYC luau and more http://t.co/iLVH6JeTYl http://t.co/QNtrTiTJ...	1432306723	601764129037254656	f	mexicue
@waeldavis @MissJennaB thank you for the love!	1432156404	601133647115231232	f	mexicue
Shrimpin' ain't easy, but it's necessary\n\nEspecially in tostada form TreatYoSelf http://t.co/kp8PLf34Z4	1432050304	600688629007134720	f	mexicue
That moment when you begin to start your week with a Burnt Ends Brisket Bowl and all is right in the world http://t.co/4cQsnjtqna	1431964549	600328949919539200	f	mexicue
CurrentMood c/o Burnt End Brisket Chili Nachos\n\nMadSqEats photo by @foodbabyny @ Madison Square Eats https://t.co/J4hDOc2svS	1431616536	598869277668679680	f	mexicue
Check out today's @nytimesbusiness piece on our expansion from food truck to brick + mortar here: http://t.co/W8A6Vu5bAh	1431532106	598515151688568832	f	mexicue
totally vegging out on a monday with a kale & quinoa bowl  http://t.co/i0yNTWDRUD	1431358604	597787431941844992	f	mexicue
It's almost beach season and dadbod is so in right now = TreatYoSelf http://t.co/SVZFyrFGx0	1431012446	596335537667108866	f	mexicue
Rice Rice Baby...and beans\n\n@AnsonMills Rice Grits + Black Beans + Jalapeno Aioli + Pico http://t.co/2qcrb62LRw	1430925990	595972917160206336	f	mexicue
RT @ForkintheRoadVV: ~Smoky~ margaritas.\n~Smoky~ carnitas.\n\nHere's how to eat lunch at @Mexicue in NoMad\n\nhttp://t.co/Nu3e7ikchP http://t.c...	1430856062	595679616318177281	f	mexicue
.@NewYorkcom knows about our CincoDeMayo/CincoDeDrinko deal at 225 Fifth Ave, do you? http://t.co/o0nvph0jg1	1430847631	595644254078300161	f	mexicue
RT @NewYorkcom: 5 Lively Bars to Celebrate Cinco de Mayo in NYC @Mexicue @thewrennyc @BodegaNegraNYC http://t.co/MYXblxlf7f http://t.co/vjw...	1430778166	595352896755113984	f	mexicue
Suns out, buns out\n\nTreatYoSelf to a Burnt Ends Brisket Slider on @potatorolls at MadSqEats http://t.co/m4j5M3C41E	1430753870	595250991995482112	f	mexicue
RT @ThrillistNYC: Congrats to the winner of ThrillistTKO @Mexicue for their Smoky Carnitas taco! http://t.co/yzfOZn8Qny	1430600014	594605673167626241	f	mexicue
RT @ExperienceNoMad: Mad. Sq. Eats opens today! @Mexicue, @ililiRestaurant, @HillCountryNY and more!  @MadSqParkNYC @UrbanSpaceNYC \n\nhttp:/...	1430501441	594192228551102464	f	mexicue
It's FalafelFriday in FIDI! Join us on Old Slip btwn Water & Front St until 3pm! FoodTruckFriday vegan Lebanese http://t.co/c8ALsdfxIN	1432908726	604289113194393600	f	toumnyc
@psychicleaking @DumboNYC One option every day :)	1432832474	603969290908389378	f	toumnyc
RT @dumbolot: Lot is smelling fine with @MexicoBlvd @ToumNYC and @mausamnyc today!	1432825891	603941677103984640	f	toumnyc
Beef? Chicken? Vegan Falafel? We have it all! Join the truck in @DumboNYC on Jay&Water or the booth on 41st/B'way http://t.co/V76jKRc8Sm	1432820576	603919384680275968	f	toumnyc
What's for lunch Midtown? Join us on 46th btwn 5th & 6th & on 41st/B'way! Try our beef shawarma platter! http://t.co/DQEa9Ny4Oq	1432736808	603568037095186432	f	toumnyc
Had enough BBQ yesterday? Join us for a vegan falafel sandwich at the truck on 52nd/6th or the booth on 41st/B'way! http://t.co/U0zRe3v2G1	1432648389	603197182745927681	f	toumnyc
Join us for the last day of the food truck showdown @MonmouthPark until 5pm! The booth is also open until 7pm on 41st/B'way! MDW2015	1432567297	602857056744435713	f	toumnyc
Day 2 of the @MonmouthPark food truck showdown starts now! Join us until 5pm! Our booth is open until 7pm on 41st&B'way! MemorialDayWeekend	1432480363	602492430148104192	f	toumnyc
RT @fredolay69: @ToumNYC had some chicken schwarma. . Fantastic!!	1432461258	602412298611924993	f	toumnyc
@PirateJeni awesome photos! So happy you enjoyed :)	1432417856	602230254820810753	f	toumnyc
RT @PirateJeni: @ToumNYC http://t.co/EblJnxMHIP	1432417843	602230200349392897	f	toumnyc
@fredolay69 awww thanks! We love our fans! What did you have with us today?	1432417831	602230149367648256	f	toumnyc
RT @fredolay69: @ToumNYC great food!!!!  You are fantastic.  :)  MonmouthPark	1432417776	602229919230390275	f	toumnyc
Day 1 of the NJ @MonmouthPark food truck showdown starts today! Join us from 11-5pm! Our booth is also open until 7pm on 41st/B'way!	1432390374	602114989755867137	f	toumnyc
@psychicleaking you are so very welcome! Thank you for lunching with us! Looking forward to feeding you again 	1432305878	601760583961202688	f	toumnyc
@PirateJeni @muppetK so happy you decided to lunch with us! What did you have? 	1432305843	601760439891001344	f	toumnyc
We love Thursday's in Brooklyn! Join us for lunch on Jay & Water St until 3pm then dinner from 4pm -10pm at the @RoyalPalmsClub	1432216028	601383726854049795	f	toumnyc
@psychicleaking sounds great! Looking forward to seeing and feeding you 	1432209328	601355624656539648	f	toumnyc
@psychicleaking hi there! We'll be there from 11am-9:pm 	1432205344	601338917766443009	f	toumnyc
Happy HumpDay MidtownWest! Join the truck on 46th btwn 5th & 6th or our booth on 41st & B'way! Beef Kabab http://t.co/QrnkCJaSNx	1432127401	601011999133270016	f	toumnyc
@explorebrooklyn great pic btw!  That's what a pie should look like!  ;-)	1432942830	604432157336027136	f	dubpies
@explorebrooklyn FYI - we serve the occasional American too! But only if they slip by the detector...	1432942796	604432012309622784	f	dubpies
RT @explorebrooklyn: Brooklyn for Australians: Sheep Station, Milk Bar, @dubpies, @TobysBrooklyn & more\n http://t.co/EsH7Yjs6wH eat http:/...	1432942744	604431794461655040	f	dubpies
Yes, yes indeed. Bedford & N7! chur RT @milospeluffo: @dubpies are you in williamsburg tonight?	1432942659	604431437270511616	f	dubpies
PieTruck's @ Bedford & N7 'til midnight! Get in there! Hot pies, cold brew, scorching service! http://t.co/ESAUBVfS2i	1432942620	604431274321805312	f	dubpies
PieTruck is at Hudson & King, Soho - serving cold brew, savory & sweet pies from 11am to 2.30pm. foodtrucks NYC NZ	1432908646	604288779776561152	f	dubpies
MT @WRJoissaint: You have to visit Williamsburg & locate @dubpies truck.  You'll love their service & goodies http://t.co/ga1eqDfeGp	1432860835	604088244184162304	f	dubpies
PieTruck's @ 47th & Park, MidtownEast 11a - 2.30p. Buy a savory pie, get a free sweet (or sweet pie)! foodtrucks NYC	1432821825	603924625005932544	f	dubpies
@gabrielgironda ha! Posted that monstrosity on FB last night. We're pie purists here. No chance we'd do something so horrendous ;-)	1432766294	603691712616206336	f	dubpies
PieTruck is @ Varick St & King St - 11am to 2.30pm. SavoryPies flatwhites	1432733446	603553935341842432	f	dubpies
Something like this? http://t.co/Y3bRXdT8i5 @pievinylrecords RT @oharris69: @dubpies @djsirvere I'm like a stuck pie on a record player!	1432700407	603415360826671105	f	dubpies
@oharris69 certainly wasn't a complaint (check is in the mail), meant it seriously and in general (ie you = everyone) chur @djsirvere	1432699252	603410516392943616	f	dubpies
You could respond that way to every tweet ever made and get away with. We reckon! RT @oharris69: @djsirvere also, @dubpies :)	1432698631	603407912397058048	f	dubpies
PieTruck is at a special event today. Back on streets tomorrow!	1432647922	603195220398833664	f	dubpies
@deancollins our bad, a tweet was scheduled but incorrectly ;-(  was too late by the time we realized...  won't happen again, sorry	1432580584	602912786885287937	f	dubpies
@missmillsnz tough year on the street last year, this year shaping to be better... update overdue but on the way! cheers	1432577790	602901066737397760	f	dubpies
PieTruck is @RoyalPalmsClub all day today and many Sundays this summer! http://t.co/7HGjb8q38S Try our Brisket Biscuit!	1432489550	602530962048741376	f	dubpies
Yeah, right? What's up with that? RT @component: @dubpies Brooklyn has Trader Joe's now? Yet SoCal still has no Dub Pies truck :(	1432415644	602220977695621122	f	dubpies
PieTruck is outside Trader Joe's , Court St. - Brooklyn, until 5pm-ish http://t.co/LaadWuzHaT	1432393535	602128247724343296	f	dubpies
RT @FordhamRoad_NYC: Today's newcomers are @Chefsamirtruck and @mausamnyc ! http://t.co/7sUOhmwNqs	1432913032	604307172781117440	f	chefsamirtruck
RT @RentSoBro: There is something about truckfood that is uniquely NYC...I love it! @Chefsamirtruck @mausamnyc  https://t.co/46ui927xr7	1432913016	604307106381062144	f	chefsamirtruck
RT @FordhamRoad_NYC: Today's menu for @Chefsamirtruck http://t.co/ru0Xs1rFQ8	1432912951	604306836087513088	f	chefsamirtruck
We are at Bryan Park located at the intersection of E. Fordham Road & Kingsbridge Road in the Bronx.	1432911992	604302812219101184	f	chefsamirtruck
We are @ The Fordham Road Food Truck Extravaganza Weekend!	1432911858	604302251952361472	f	chefsamirtruck
We are at 47st between park av and Lexington av!	1432827763	603949528199340033	f	chefsamirtruck
We are at 52st and park av! \nTry our strawberry lemonade today, yummy! !	1432742231	603590783413952512	f	chefsamirtruck
RT @GovBallNYC: We're releasing a limited amount of single day tickets! Get your tickets for Gov Ball before it's too late! https://t.co/cM...	1432681817	603337387612229632	f	chefsamirtruck
@AyouchNabil \nI hope you bring the movie to new York one day, Tribeca movie festival, I'm totally against the censure ship in Morocco	1432681739	603337060150321152	f	chefsamirtruck
We are on 36st and Broadway!	1432657094	603233690546745344	f	chefsamirtruck
@Gov_Island! Such a beautiful day today !	1432483268	602504611887501313	f	chefsamirtruck
We're at Governors Island today!	1432482394	602500946741096449	f	chefsamirtruck
Thanks to @GovIslandFood and  @livefastgroup we will be vending on @Gov_Island all summer long	1432482371	602500850121048065	f	chefsamirtruck
We're 55th St @ Broadway!	1432304366	601754243377274880	f	chefsamirtruck
We're at 47st between park av and Lexington av!	1432224171	601417882740875264	f	chefsamirtruck
MONDAY: Old Slip @ Water St\nTUESDAY: 36th St @ Broadway\nWEDNESDAY: 52nd St @ Park\nTHURSDAY: 47th St btwn Park & Lex\nFRIDAY: 55th @ Broadway	1432222142	601409369604038658	f	chefsamirtruck
http://t.co/Wox3RfrDxJ\n@karimgeist \nMoroccanfood BestcouscousinNY ChefSamir	1432221560	601406931295690752	f	chefsamirtruck
We are at 52st and park av!	1432135699	601046802645786625	f	chefsamirtruck
We are on 36st and Broadway!	1432048712	600681953663279104	f	chefsamirtruck
We are on Abc studio! !	1431962393	600319903644647425	f	chefsamirtruck
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
Shop is open tonight for deliveries & take out until 11p. Bar available for eat in.	1406241074	492436875777671170	f	trucktotable
RT @AnthemSoda: Couscous platter, kale, chicken, lamb sausage from @trucktotable http://t.co/zysvH6ItCB	1406238057	492424219566026752	f	trucktotable
RT @AnthemSoda: AllNatural FoodTruck @trucktotable 'fancy morrocan street food' http://t.co/7aCejMHXiL	1406238055	492424213064863744	f	trucktotable
RT @MzFuN_SiZ3d: Tried @BrooklynPopcorn for the time today and it was AMAZINGGG 	1431354821	597771561651830784	f	brooklynpopcorn
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
Hey hey hey its Friday!!!!!  Make it a fantastic day and Come down to 50th bet 6&7 for some  balls .	1432912394	604304498551582720	f	mtblls
Good Thursday Y'all! The Mtbll  is taking a mental health day and restock. Have a terrific day! http://t.co/MvS0jnOtB9	1432830618	603961506384977920	f	mtblls
Happy  Day  Mtbll Lovers!  Come on by 50th bet 6&7 and brighten your day with your favorite menu item. The  is waiting 	1432738375	603574611368910848	f	mtblls
Good Tuesday Y'all! Hope you all had a great extended weekend thanks to our men and woman of the armed forces.... http://t.co/oVLm6xQXPy	1432652360	603213837857325056	f	mtblls
Have a Safe Memorial Day! http://t.co/dEIvWNcCn4	1432566445	602853481775570946	f	mtblls
Good Morning Mtbll Lovers    It's that time of the week again yahooo!!!!  And a 3 day weekend   Come by 50th... http://t.co/vHYbupA5EI	1432307918	601769144237830144	f	mtblls
Happy Thursday Y'all!   The Mtbll  is stopped at 50th bet 6&7 Aves. Come on by say hi 	1432219495	601398268237590528	f	mtblls
Happy  Day y'all. After a weather day yesterday the Mtbll  is ready and waiting on 50th bet 6&7 Aves. Come on... http://t.co/J4ULtq234X	1432129267	601019826195279873	f	mtblls
Good day Mtbll Lovers. Sorry for the late post this morning past me by. The   however, has stopped on 50th bet... http://t.co/egpeIs5zaj	1431966988	600339179420147712	f	mtblls
Hey hey hey its Friday!  The Mtbll  is stopped at 50th bet 6&7.   Drop on by for hour weekend fix.	1431700681	599222206778978304	f	mtblls
Happy Thursday Mtbll Lovers!   The Mtbll  is waiting at 50th bet 6&7 Ave.  Enjoy this gorgeous weather and stop by for your favorite ball 	1431615410	598864551505952768	f	mtblls
Good day y'all !  The Mtbll  has stopped on 50th bet 6&7 Aves. Come say hi on this beautiful day. Your favorite... http://t.co/xqHlpEon70	1431525080	598485679761432577	f	mtblls
Good Morning Mtbll Lovers!   It's going to be a hot one today. Come on by 50th bet 6&7 Aves and pick up a... http://t.co/M9QtvygBMl	1431442326	598138586949648384	f	mtblls
Good Morning Mtbll Lovers!   It's going to be a hot one today. Come on by 50th bet 6&7 Aves for a refreshing... http://t.co/qHmGKSKhxz	1431442171	598137937340018689	f	mtblls
Happiest of Monday Mtbll Lovers!   The  has stopped on 50th bet 6&7 Aves. Come on by for your favorite menu item!\n lgr 	1431352932	597763640964620288	f	mtblls
The Mtbll  is in Brooklyn at the Red Bull Music Academy Festival. http://t.co/MOy4OYZ889	1431285875	597482384758591489	f	mtblls
Red Bull Music Academy Festival New York 2015\n\nReturning to New York City for a third consecutive year, the Red... http://t.co/5nXFQQ5Cno	1431283579	597472754112270336	f	mtblls
To all our moms grandma's and godmoms! http://t.co/rX0WJdHpmr	1431269330	597412987473887233	f	mtblls
Watch over them today NYPD http://t.co/iQI8oAm09F	1431105797	596727082266275840	f	mtblls
Yay it's Friday!!!! And a nice a one too   come by 50th bet 6&7 Aves for your weekend fix, the Mtbll  is waiting.	1431096772	596689228811108352	f	mtblls
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
@KittyGoogs ha. happy to help.	1432946425	604447235368226816	f	milktrucknyc
@KittyGoogs @kewe_m thanks for coming by ladies.	1432935855	604402901277106176	f	milktrucknyc
Hey wallstreet we are at Wall St and William St! Call 646-504-6455 or @foodtoeat.com to preorder. We're also at @TheSeaport 19 Fulton	1432917330	604325201271246851	f	milktrucknyc
RT @sophiaphotos: Woman buys pesticide free food. Feels unsafe a bug was on the lettuce. http://t.co/NJM0FHBGSU	1432834679	603978538694418432	f	milktrucknyc
Bessie will be at 25th/Park for lunch today! Or visit our kiosk at Seaport (19 Fulton St).	1432825306	603939225814310912	f	milktrucknyc
RT @noREDpaint: @milktrucknyc yes! I heard about this famous truck	1432817708	603907356364242944	f	milktrucknyc
The truck is BACK in its usual spots starting today!! \nTruck Lunch locations 11am-3pm:\nTODAY -58th &... https://t.co/axxrZgTOFP	1432741918	603589468415782912	f	milktrucknyc
Have you missed our truck? We're finally back on the road after a long private event, find us at 58th & Madison for lunch today! midtown	1432741331	603587009916104705	f	milktrucknyc
Bessie is back on 58th & Madison for lunch, our Seaport stand is open all day at 19 Fulton, and sandwiches always at @houstonhallnyc!	1432733778	603555328685408258	f	milktrucknyc
happy Memorial Day! visit us at @TheSeaport, 19 Fulton Street all day.	1432572391	602878420910002176	f	milktrucknyc
caesar salad with oily croutons https://t.co/txxEooRjfK	1432514892	602637252825653249	f	milktrucknyc
Find us today at Pier 5 Smorgasburg in Brooklyn, or if you're in Manhattan today at @TheSeaport, 19 Fulton St....where we now have TOTS!	1432483204	602504344764841985	f	milktrucknyc
pork loin for new sammie seaport.pig&gruyere https://t.co/eHYHXsFaUh	1432318200	601812266770702337	f	milktrucknyc
today's the last day of no truck due to private event. BUT, come see us at @TheSeaport Smorgasburg at 19 Fulton St, booth officially open!	1432307688	601768176804864000	f	milktrucknyc
RT @TheSeaport: 8 Vendors, 1 SeaportSmorg: @CemitasNYC @MilkTruckNYC @LumpiaShack @PizzaMoto @RedHookLobster @RamenBurger @SchnitzNYC @Lon...	1432226610	601428111654260736	f	milktrucknyc
RT @smorgasburg: Grand Opening of Seaport Smorgasburg today! @TheSeaport @LonestarEmpire @milktrucknyc @ramenburger @Redhooklobster http://...	1432218954	601396000582967297	f	milktrucknyc
Trucks still closed, but now you can find us each weekday at @TheSeaport Smorgasburg! 11am-8pm at 19 Fulton Street. Grand opening today!	1432218933	601395911596625920	f	milktrucknyc
@ADoseofCrazy @houstonhallnyc back next week!	1432150071	601107083153510400	f	milktrucknyc
The truck is still closed for a private event! Our sandwiches are also sold at @houstonhallnyc or we hope to see you this wknd at markets!	1432131863	601030714902061056	f	milktrucknyc
RT @mashfeed: Foodies unite! @Smorgasburg is back! Check out the 10 foods we think you should be trying http://t.co/vriwWbKxrZ http://t.co/...	1432069902	600770831220928513	f	milktrucknyc
This Is Why NYC Has The Best Bagels In The World | via @Gothamist http://t.co/shEi2Pj7rR http://t.co/vrbLxL5zEI	1432915846	604318975942594560	f	souvlakitruck
RT @randomfoodtruck: Get a picnic and eat outside! @CarpeDonutNYC @MamasHeros @souvlakitruck @PolishCuisine @carlssteaks @gcnyc1	1432915340	604316854404796417	f	souvlakitruck
Halloumi is Helping to Heal a Divided Cyprus | via @MUNCHIES http://t.co/abjQ6lbVBk http://t.co/QQAqCwRzZd	1432836643	603986775569215488	f	souvlakitruck
Check out this awesome photo map! | Old NYC, Block By Block via @Gothamist http://t.co/BGmwb6yx73 http://t.co/PEpeU9tIZP	1432746618	603609182508560386	f	souvlakitruck
Why You Should Still Buy Ugly Fruit by @TheSavory http://t.co/0dqEcJdQ21 http://t.co/xu5jBFWmtQ	1432674910	603308418233929728	f	souvlakitruck
9 Things You Should Never Do When Grilling | @TheDailyMeal http://t.co/UMtxpFh5Sp http://t.co/qGgnAJrgeH	1432407319	602186059594760193	f	souvlakitruck
The Most Popular Summer Recipe In Each State, According To Google http://t.co/ERI0Hlw7lj http://t.co/kYdN22yfjV	1432317318	601808568594096128	f	souvlakitruck
RT @randomfoodtruck: Start the long weekend off right! @Chefsamirtruck @souvlakitruck @PolishCuisine @MamasHeros @gcnyc1	1432308345	601770932122812416	f	souvlakitruck
RT @souvlakigr: Enjoy our Greek Burger for FREE w UberEATS. Enter code EATSOUVLAKI for free first meal. @Uber_NYC http://t.co/bTUGSAVmVx	1432305126	601757431824277507	f	souvlakitruck
7 Myths (and Truths) About Olive Oil on @WSJ http://t.co/BV8tDF7Xnt http://t.co/kZ2uQ7DSBw	1432237823	601475140585652224	f	souvlakitruck
Did you catch a glimpse of the 2015 Dance Parade this weekend? Photos on @Gothamist: http://t.co/dcFd2SnBJl http://t.co/qEVaFzqIwc	1431973513	600366545009803264	f	souvlakitruck
RT @souvlakigr: Greek Fries on the go from @SouvlakiTruck! http://t.co/nerWAJrId3	1431965407	600332546635882496	f	souvlakitruck
The NYC Outdoor Food Markets You Need to Hit Up Immediately via @ThrillistNYC http://t.co/VmsFUBNwZM http://t.co/mzTaNqjBh5	1431891041	600020634421305345	f	souvlakitruck
How long will your produce stay fresh? Find out on @HuffPostTaste: http://t.co/FABNMzcocm http://t.co/694NEdzR0W	1431796817	599625429192957953	f	souvlakitruck
Looking for a summer read? @GrubStreetNY suggests 10 New Food Books:  http://t.co/h5PsRBFmJC http://t.co/c4xgP8wYcM	1431714027	599278183263903746	f	souvlakitruck
RT @randomfoodtruck: Almost lunchtime! @CarpeDonutNYC @Chefsamirtruck @carlssteaks @souvlakitruck	1431704195	599236945022230529	f	souvlakitruck
@MKramerTV We are on 55st/Broadway\nStop by for a little taste of Mykonos\n@randomfoodtruck till 3 pm.	1431701151	599224175094603776	f	souvlakitruck
RT @holaimpatti: Just had my first taste of souvlaki from @souvlakitruck and loved it. Thank you, @eddiebauer for making it happen.	1431641608	598974436553940992	f	souvlakitruck
Greek wines are the best wines. | Ode on Grecian White Winesa Modern Success Story on @WSJ http://t.co/Azj8aU5EZO http://t.co/vJ7rAWjwSD	1431630921	598929609242062849	f	souvlakitruck
@MKramerTV Greetings Marcia were on \n@eddiebauer Airstream Tour! 15st/5th ave\nStop by for a little taste of Mykonos till 7pm	1431623772	598899625282686976	f	souvlakitruck
RT @RentSoBro: There is something about truckfood that is uniquely NYC...I love it! @Chefsamirtruck @mausamnyc  https://t.co/46ui927xr7	1432919051	604332420893122561	f	mausamnyc
RT @FordhamRoad_NYC: @mausamnyc @Chefsamirtruck @rollincubans	1432919011	604332250835087360	f	mausamnyc
RT @FordhamRoad_NYC: Today's menu for @mausamnyc http://t.co/sLrwq0UahN	1432912743	604305960996376577	f	mausamnyc
RT @FordhamRoad_NYC: Today's newcomers are @Chefsamirtruck and @mausamnyc ! http://t.co/7sUOhmwNqs	1432909870	604293911658565632	f	mausamnyc
Happy Friday @fordhamroad_nyc \n Aroma of Curry King will make you HUNGRY & delicious mango lassie http://t.co/RdL2hEo6M5	1432905216	604274392756011008	f	mausamnyc
Don't miss out on a GREATTTT event. Enjoy with and friends! http://t.co/mw9A3L6XT7	1432855633	604066426643714048	f	mausamnyc
Dinner @Rooseveltisland don't miss delicious Indian flavors 5-8pm http://t.co/G3SEU7Nb6d	1432848425	604036190862471168	f	mausamnyc
Curry Thursday @dumbolot don't forget to grab a delicious mango lassie http://t.co/1r4tLgSuuy	1432822177	603926100285247488	f	mausamnyc
Savory Indian dinner @Rooseveltisland 5-8pm stop by and enjoy a delicious mango lassie http://t.co/2NTWXLmd3E	1432755249	603645386260140032	f	mausamnyc
midtown savory Indian lunch @47 Street between Park & Lex delicious mango lassie. http://t.co/LGgSqog4Kl	1432732092	603548255138492416	f	mausamnyc
Happy Memorial to All! Thanks to @GovIslandFood and  @livefastgroup we will be vending on @Gov_Island all summer http://t.co/5xvarxit41	1432560837	602829961850920960	f	mausamnyc
CraZy crowd for CRAZY CURRIES http://t.co/ZaiT4MhzWP	1432486351	602517543841079297	f	mausamnyc
 Thanks to @GovIslandFood and  @livefastgroup we will be vending on @Gov_Island all summer beautiful sunny day! http://t.co/ls2z23Qzjf	1432468221	602441500253884416	f	mausamnyc
 @GovIslandFood and  @livefastgroup we will be vending on @Gov_Island all summer! Bring family & friends http://t.co/ywArxuSBtV	1432383965	602088104829317120	f	mausamnyc
Great place to start you're Memorial weekend  with family & friends . We're @Governersisland http://t.co/nFfRBzGzIV	1432377807	602062278574383104	f	mausamnyc
Happy Friday dinner @Rooseveltisland 5-8pm Safe Memorial weekend to All! http://t.co/pEXaCUsXKU	1432324189	601837389716271104	f	mausamnyc
Happy Friday  Curry King Indian Cuisine Truck Bay Gourmet StarrettLehigh spice you're Memorial weekend! http://t.co/uPXJetEHeT	1432291134	601698745370222592	f	mausamnyc
@RooseveltIsland special all dinner entree served with Paratha (roti) and drink http://t.co/Z5UJBCfnlp	1432238034	601476025806098432	f	mausamnyc
Delicious dinners @RooseveltIsland our spices will keep you warm on this cool evening http://t.co/CLiEFYwJ3O	1432233784	601458201729466368	f	mausamnyc
Dumbolot Thursday's spice up with Curry King's authentic Indian savory flavors http://t.co/1YetCjqFz4	1432206095	601342064496922624	f	mausamnyc
Pollo asado and Carne Asada are sizzling..!!would you like it on a salad bowl?or on a tasty burrito!\nJoin us for more.We are @52&park	1432826618	603944728044896258	f	etravaganza
RT @HippieHooper: So good yesterday - back today CreatureOfHabit breakfastforlunch (@ Eggs Travaganza - @etravaganza) https://t.co/jbBZRL...	1432766837	603693986012880896	f	etravaganza
Have you tried Our Healthy salad bowls??	1432740510	603583563473297408	f	etravaganza
Good morning breakfast is served!! join us 52nd and Park is the  place.	1432732305	603549149276024832	f	etravaganza
Back to reality..!! lunch will be serving at 11:45	1432652376	603213902722269184	f	etravaganza
Yay..!!happy Friday!	1432286315	601678533698654208	f	etravaganza
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
Did you know our @greenboxny year into plates?credit: @ehynes213 neapolitanexpress pizz... http://t.co/IFbjPlinBC http://t.co/qUkE6YzQG0	1430619288	594686516531703808	f	neaexpress
Our Diavolo pairs @mikeshothoney with jalapenos to pack in the perfect punch of spice! cr... http://t.co/FkDU6K2RkA http://t.co/gXoPpWDxKL	1430498054	594178023185895424	f	neaexpress
FiDi are you hungry? We're open on WallStreetcredit: @brianlavoe pizzaneversleeps n... http://t.co/3XgZx8GYpE http://t.co/f4Dw9VFeBD	1430410122	593809207641677824	f	neaexpress
RT @gastronami: Tricolore pizza (fresh pesto, fresh mozz, basil, San Marzano tomato, black truffle oil) was delicious! @NeaExpress http://t...	1430384712	593702632205787136	f	neaexpress
RT @FransmartKris: Evolution of fast casual pizza oven technology \n http://t.co/NXZEjT4Nwe @NeaExpress	1430384695	593702561099616256	f	neaexpress
RT @rouk: The @NeaExpress is outside my job today! ClutchLunch	1430384691	593702544808939520	f	neaexpress
RT @dumbolot: We got @DomoTaco @NeaExpress and @SnowdayTruck today!	1430384689	593702536902615040	f	neaexpress
RT @gastronami: Couldn't resist picking up a Bianca pizza at @NeaExpress. Love it! http://t.co/rK2ulYXoJF	1430384678	593702487401504768	f	neaexpress
RT @leslie_gambetta: Had a great lunch with @LaurarVeloso at @NeaExpress  yum pizza http://t.co/7D2kA2a1YM	1430384667	593702443545792512	f	neaexpress
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
We are at Hanover Square Today!!!	1432738187	603573822365769728	f	grillonwheelsny
Grill On Wheels is @ 46th Street between 5th & 6th Ave today!!!	1432131014	601027155007557632	f	grillonwheelsny
Grill On Wheels is @ Hanover square today!	1432044222	600663120542113792	f	grillonwheelsny
THE TRUCK WILL BE ON 46TH STREET AND 6TH AVE TODAY!!!	1431962414	600319994321367040	f	grillonwheelsny
Grill On Wheels is @ Hanover square today. Have a sandwich or a plate and get a free drink!!!	1431526794	598492870597804033	f	grillonwheelsny
Monday corner of 46th and 6th Ave, 12 to 4 Come by have a sandwich or a plate and get a free drink!!!	1431346281	597735744548012032	f	grillonwheelsny
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
Have a great weekend and thanks for coming!!!	1432935921	604403179418210304	f	polishcuisine
RT @randomfoodtruck: Get a picnic and eat outside! @CarpeDonutNYC @MamasHeros @souvlakitruck @PolishCuisine @carlssteaks @gcnyc1	1432915966	604319479997202433	f	polishcuisine
I posted a new photo to Facebook http://t.co/TNGBoMrgwR	1432913795	604310373790019584	f	polishcuisine
Let's do this - 55th & Broadway - Pierogitime @randomfoodtruck	1432912950	604306832123957248	f	polishcuisine
Happy Friday on 55th & Broadway MidtownWest Pierogi Kielbasa traditional nyc foodie	1432905939	604277424730300416	f	polishcuisine
55th & Broadway today @randomfoodtruck traditional nyc PolishTruck	1432903249	604266143235358720	f	polishcuisine
I posted a new photo to Facebook http://t.co/qjPOKPn2KZ	1432896381	604237334767386624	f	polishcuisine
Thanks for coming everyone! It's so great being outside!	1432840814	604004268111175680	f	polishcuisine
Special HuntersStew today on Old Slip b/w Front & Water Traditional nyc	1432823951	603933541869694976	f	polishcuisine
I posted a new photo to Facebook http://t.co/gpBwnxEaxU	1432823243	603930573141372928	f	polishcuisine
I posted a new photo to Facebook http://t.co/A5iKLxM1G5	1432823151	603930187789692929	f	polishcuisine
FinancialDistrict today...Old Slip bw Water & Pearl downtown NYC	1432814808	603895192605872131	f	polishcuisine
@NYCWingnut on no - that's horrible!!! ok - good to know, thanks for reaching out to us:)	1432743565	603596376954503168	f	polishcuisine
@NYCWingnut sorry for not being there that often - will keep you posted...hope you miss us ;)	1432742457	603591730785554432	f	polishcuisine
@jgoldberg007 opened already at 11:00 :)	1432742377	603591394188500993	f	polishcuisine
Open & Ready to Roll on 47th b/w Park & Lexington Pierogitime nyc Midtown	1432739327	603578600995102722	f	polishcuisine
I posted a new photo to Facebook http://t.co/eB4HIY5sDS	1432736995	603568821945917440	f	polishcuisine
I posted a new photo to Facebook http://t.co/nnIBzG9zzR	1432736819	603568084662808578	f	polishcuisine
I posted a new photo to Facebook http://t.co/zuI1llVPB8	1432736778	603567910917971968	f	polishcuisine
I posted a new photo to Facebook http://t.co/3ROaZT5vjv	1432736631	603567294921465856	f	polishcuisine
Good morning nyc we r ready to serve @47th btween park and lex Ave. try our bbq rice platter with beef, pork, shrimp. PlZ come by and enjoy~	1432826384	603943745143349248	f	bobjotruck
Hello New York we r open at king and Hudson st. Try our Korean bbq  rice platter and bbq burrito as well. PlZ come by and enjoy thank you !	1432740890	603585157849833473	f	bobjotruck
Hello NYC! We r open @47th st. Park and lex ave. try our Korean BBQ (Bef pork chicken and shrimp) , BBQ BURRITO as well plZ stop by! Thx	1432653139	603217106004484097	f	bobjotruck
Welcome Friday !! We r open at king and Hudson . Try our world best korean BBQ beef(galbi)pork chicken and bbq burritos as well! Thank you	1432310575	601780286607794176	f	bobjotruck
Good morning! We r ready to serve at 46th st.btween 5th&6th ave. Try our Korean BBQ rice platter (beef,pork,chicken) and BBQ BURRITOS! Thx!!	1432222498	601410866412691456	f	bobjotruck
Hello nyc we r open @king st. And Hudson now. Try our BBQ rice bowl and bbq burrito . PlZ come by and enjoy thank you !!	1432136231	601049036477566976	f	bobjotruck
Hello nyc we r open at 46th brween 5th and 6th ave!! Try our KOREAN BBQ-. PlZ come by and enjoy thank you!!	1432050614	600689932982755328	f	bobjotruck
Welcome Monday! We r ready to serve at 47th st. Btween park and lex ave. PLZ COME BY & try our best korean BBQ thank you	1431964183	600327412740661248	f	bobjotruck
Hello nyc ! We r open @king and Hudson st. Try our BBQ rice platter! We r ready to serve beef(galbi)pork shrimp thank you ! Good day :)	1431441900	598136797953134592	f	bobjotruck
Goodmorning we r ready 2 serve @47th st. Park and lex ave.try our BBQ RICE BOWL! And spicy chicken rice platter. PlZ come by and enjoy Thx	1431358418	597786652233375744	f	bobjotruck
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
GOODMORNING BRONX NY!!!\nTODAY TGIF FRIDAY MAY 29TH WE ARE OPEN FOR LUNCH & EARLY DINNER! !... https://t.co/PsEmplIT1g	1432910888	604298180294021120	f	latinkitchennyc
DINNER ANYONE??\nMI VIEJO SAN JUAN\n2920 BRUCKNER BLVD \nBRONX NY 10465\n347-691-3100\n***Today Thursday... https://t.co/iOlbc5A3t7	1432847363	604031736784244736	f	latinkitchennyc
2NITE\nTKA LIVE\nDON COQUI WHITEPLAINS \nDJ LUCHO\nSHOWTIME 10PM\nFREE ADMISSION https://t.co/lpM0aYVRrV	1432840380	604002449419038720	f	latinkitchennyc
TONIGHT!!!!\n THURSDAY MAY 28TH A VERY SPECIAL INTIMATE NIGHT AT DON COQUI WHITEPLAINS NY WITH A... https://t.co/7DEaHi47db	1432837965	603992321517031424	f	latinkitchennyc
CHURRASCO CON MOFONGITO!\nYUM YUM YUM!!\nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX NY... https://t.co/NOzXAsABhb	1432826830	603945617837154305	f	latinkitchennyc
THAT'S A TRIFONGO!!\nGOODMORNING BRONX NY! !\nTODAY THURSDAY MAY 28TH\nWE ARE OPEN FOR LUNCH & DINNER... https://t.co/SLS1chuldm	1432825036	603938090835693569	f	latinkitchennyc
2MORO NIGHT THURSDAY MAY 28TH A VERY SPECIAL IMTIMATE NIGHT AT DON COQUI WHITEPLAINS NY WITH A... https://t.co/7DEaHi47db	1432779780	603748273837449216	f	latinkitchennyc
GOODMORNING BRONX NY! \nHUMPDAY WEDNESDAYS \nMAY 27TH 2015\nWE ARE OPEN FOR LUNCH & DINNER\nMI VIEJO SAN... https://t.co/FzcQeiAVI0	1432740511	603583568103759872	f	latinkitchennyc
OYE.....MAMI COCINO!!!\nHEY!!!! MY MOM IS COOKING!!!\nMI VIEJO SAN JUAN\n2920 BRUCKNER BLVD \nBRONX NY... https://t.co/3jEzn9COJG	1432664574	603265066931216385	f	latinkitchennyc
WHILE YOUS PARTYING... WE AT THE STUDIO CREATING... YEA THAT'S MARIOSO... IF YOU DON'T KNOW ...GOOGLE... https://t.co/oxO3bIjxrY	1432532667	602711806604357632	f	latinkitchennyc
TYPE IT IN YOUR URL... WE ARE ON AT\n10:55 PM \nWE ARE LIVE ON THE ANTHONY MANGINI SHOW TALKING ABOUT... https://t.co/2L4ljTWXw3	1432430919	602285046469414912	f	latinkitchennyc
HAPPY MEMORIAL DAY WEEKEND! \nTODAY SATURDAY MAY 23RD\nWE ARE OPEN FOR EARLY DINNER \n3PM-11PM\nMI VIEJO... https://t.co/c7uSrWtAzm	1432392512	602123957282742272	f	latinkitchennyc
CATCH ME AFTERWORK 2DAY ..\nDJ LUCHO SET 6PM\nHAPPY MEMORIAL DAY WEEKEND!! https://t.co/mTvQD8eqPg	1432320676	601822655046647809	f	latinkitchennyc
CATCH ME 2NITE DON COQUI WHITEPLAINS DJ LUCHO SET 1AM..\nLET'S GO!! https://t.co/uxmnJRYfbc	1432320620	601822417309274112	f	latinkitchennyc
TGIF !   TODAY FRIDAY MAY 22ND..\nWE ARE OPEN FOR LUNCH AND DINNER! 12PM-11PM\nHAPPY MEMORIAL DAY... https://t.co/33C7jiBjQy	1432308683	601772351861215232	f	latinkitchennyc
START YOUR MEMORIAL DAY WEEKEND OFF RIGHT...\nMEET ME AFTERWORK AT SLATE..\nDJ LUCHO LIVE 6PM-10PM https://t.co/ACFuSB2ktW	1432303080	601748850878062594	f	latinkitchennyc
We're back in SOHO!  Hudson and Charlton for lunch. mooshus mooshurito	1416579076	535797597085384707	f	mooshugrill
EL TRIFONGO\nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX NY 10465\n347-691-3100\n***open till... https://t.co/sycrKc6nMi	1432251490	601532467724623873	f	latinkitchennyc
THURSDAY MAY 21ST \nWE ARE OPEN FOR LUNCH AND DINNER! 12PM-9PM\nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD... https://t.co/iRMYcEriOt	1432229557	601440473895473152	f	latinkitchennyc
THE QUEEN...ANANE VEGA! https://t.co/MmTzghCrWv	1432184109	601249851544862720	f	latinkitchennyc
LAS 2 LOCAS Y EL HOMBRE!!! https://t.co/U1BZtdyweS	1432183959	601249219580690433	f	latinkitchennyc
No truck today but find us on broadway btw 39 & 40th till 9 @UrbanSpaceNYC @GarmentDstrctNY and @AmericanExpress cafeteria till 230!	1432914394	604312888250077186	f	sweetchilinyc
Sweet chili chicken. Get yours at old slip & water 1130-3 and broadway btw 39 & 40th 11-9! eaturban... https://t.co/vuWNhUQtiz	1432822509	603927493708521472	f	sweetchilinyc
Get your sweet heat on today 1130-3 old slip & water AND @UrbanSpaceNYC @GarmentDstrctNY broadway btw 39 & 40 11-9! eatoutside spicy food	1432821911	603924986449899521	f	sweetchilinyc
@Keelelk sorry we were in dumbo yesterday!	1432821842	603924696938098689	f	sweetchilinyc
Pre order for the truck http://t.co/6nkTKLphud and click the order button! skiptheline come see me @ChefLisaNYC I'm on the truck today!	1432740944	603585384258379777	f	sweetchilinyc
Truck @dumbolot 11-2\nMarket booth @UrbanSpaceNYC @GarmentDstrctNY broadway btw 39 & 40 11-9\n@AmericanExpress  @brookfieldplace 11-2	1432737272	603569982027526144	f	sweetchilinyc
We will be @dumbolot again today 1130-2pm with plenty of tofu! jay & water. also catch us on Broadway btw 39 & 40th 11-9 at our booth!	1432732204	603548726410510338	f	sweetchilinyc
We are @DumboLot 1130-3 today. limited tofu, sorry! also catch us on Broadway btw 39 & 40th 11-9 at our market booth!	1432652405	603214023488839680	f	sweetchilinyc
RT @dumbolot: 4 day work week starts with @KimchiTruck @SweetChiliNYC and @carlssteaks!	1432649216	603200650365816832	f	sweetchilinyc
We are rocking out on MemorialDay @gov_island 1130-6 & @UrbanSpaceNYC @GarmentDstrctNY broadway btw 39 & 40th 12-7! weekendplans sunday	1432567667	602858607806423040	f	sweetchilinyc
Spend your MemorialDayWeekend with us @Gov_Island @GovIslandFood 11-6 &  @UrbanSpaceNYC @GarmentDstrctNY 12-7 bway btw 39 & 40! eatoutside	1432479677	602489552184471552	f	sweetchilinyc
RT @GovIslandFood: Come grab some rays and some great food from our vendors @Gov_Island. Here every weekend.@SweetChiliNYC @mausamnyc @Deli...	1432475579	602472362743898112	f	sweetchilinyc
all day @Gov_Island @GovIslandFood to celebrate the holiday weekend! happymemorialday. Also our kiosk @UrbanSpaceNYC bway btw 39 & 40 12-7!	1432393641	602128689531334657	f	sweetchilinyc
RT @GovIslandFood: Opening day on @Gov_Island. stop by and enjoy the beautiful weather and great food from @SweetChiliNYC @carlssteaks @Del...	1432389601	602111745369473025	f	sweetchilinyc
TGIF truck is @dumbolot 1130-3. Market booth @UrbanSpaceNYC @GarmentDstrctNY Broadway btw 39 & 40 11-9! eatoutside MemorialDayWeekend	1432305286	601758102736785408	f	sweetchilinyc
tbt sweet chili on the set of @TheFollowingFOX with kevinbacon @nokidhungry raising money for... https://t.co/QLUAh9BhHN	1432218830	601395480237633536	f	sweetchilinyc
Hungry? Truck on old slip & water 1130-3 & @UrbanSpaceNYC @GarmentDstrctNY broadway btw 39 & 40th 11-9! 2 days till @Gov_Island weekends!	1432218306	601393284162924544	f	sweetchilinyc
Grab lunch today on broadway btw Houston & Bleeker till 3 OR broadway btw 39 & 40th till 9pm! eaturban happyhour specials after 4pm!	1432139464	601062596633067521	f	sweetchilinyc
@truthtrebles thursday I promise!!	1432049795	600686494487982080	f	sweetchilinyc
Open by noon today @dumbolot jay and water!	1432047900	600678546965659649	f	sweetchilinyc
Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE MARITAL BLISS. Preorder 9172929226 fidi	1432907255	604282943255789568	f	fritesnmeats
Hello Brooklyn, Lunch 2day @ front & jay st. Burger of the week THE MARITAL BLISS. Preorder 9172929226 dumbo @DUMBOFoodTrucks	1432820538	603919225506390017	f	fritesnmeats
Lunch 2day @ Hudson & king. Burger of the week THE MARITAL BLISS. Preorder 9172929226 soho	1432734502	603558364677873664	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE MARITAL BLISS. Preorder 9172929226 fidi	1432647384	603192967327817728	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE ITALIAN JOB preorder 9172929226 fidi	1432302985	601748452758925312	f	fritesnmeats
Hello Brooklyn, Lunch 2day @ front & jay st. Burger of the week THE ITALIAN JOB  preorder 9172929226 dumbo @DUMBOFoodTrucks	1432216711	601386590313787392	f	fritesnmeats
Lunch 2day @ Hudson & king. Burger of the week THE ITALIAN JOB preorder 9172929226 soho	1432129349	601020170476326912	f	fritesnmeats
Lunch 2day @ 10 Hanover sq. b/t water & pearl st. burger of the week THE ITALIAN JOB preorder 9172929226 fidi	1432042252	600654857524092928	f	fritesnmeats
Lunch 2day @ 50th st b/t 6th & 7th av. Burger of the week THE ITALIAN JOB. Preorder 9172929226 midtown	1431956463	600295034894864385	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE AO TRUFFLE BURGER. Preorder 9172929226 fidi	1431696708	599205541097951232	f	fritesnmeats
Hello Brooklyn, lunch 2day @ front & jay st. Burger of the week THE AO TRUFFLE BURGER preorder 9172929226 dumbo @DUMBOFoodTrucks	1431610990	598846014250967040	f	fritesnmeats
Lunch 2day @ Hudson & king. Burger of the week THE AO TRUFFLE BURGER preorder 9172929226 soho	1431524591	598483632660025344	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE AO TRUFFLE BURGER. Preorder 9172929226 fidi	1431438465	598122391911424000	f	fritesnmeats
Lunch 2day @ 50th st b/t 6th & 7th av. Burger of the week THE AO TRUFFLE BURGER. Preorder 9172929226 Midtown	1431351210	597756417798451200	f	fritesnmeats
HappyMothersDay to all the moms out there!  Don't forget to hug mom 2day!	1431279460	597455475861540864	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE SPIZY JAZZ preorder 9172929226 fidi	1431092893	596672958229323777	f	fritesnmeats
Hello Brooklyn, lunch 2day @ front & jay st. Burger of the week THE SPICY JAZZ.  Preorder 9172929226 dumbo @DUMBOFoodTrucks	1431006547	596310795769802752	f	fritesnmeats
@kdoherty74 	1430943086	596044622310350848	f	fritesnmeats
Lunch 2day @ Hudson & king. Burger of the week THE SPICY JAZZ. Preorder 9172929226 SOHO	1430920846	595951342490951680	f	fritesnmeats
Peeps, we are off the road today	1430837085	595600019467739136	f	fritesnmeats
Happy Friday. We will be on Charlton & Varick today.	1432913210	604307919153336320	f	schnitznthings
Hey guys 26th & 11th ave is where we will be.  Serving up your Schnitzel for lunch.	1432827141	603946920004968450	f	schnitznthings
It's lunch time. Were on Greenwich & Park.	1432656061	603229359734939648	f	schnitznthings
Happy Friday. We will be on 49th 7th to 6th ave today. Come get your schnitz on! !!	1432307408	601767003578310658	f	schnitznthings
53rd & Park for humpday woo!	1431527820	598497174721306625	f	biandangnyc
Hey guys were on 26th street West side to 11th ave.  Its Schnitzel for lunch!!!	1432223305	601414251127959552	f	schnitznthings
27Th & Park is where the Schnitzel cart will be.  Come by for your favorite Schnitzel lunch.	1432135647	601046586559430657	f	schnitznthings
Hey guys. Greenwich & Park is where we will be serving up your favorite Schnitzel for lunch.	1432045781	600669659290013696	f	schnitznthings
Hey Schnitzlers we will be on Charlton & Varick today.	1431962447	600320131592491008	f	schnitznthings
Whats up midtown!! The cart will be on 49 street 7 to 6 ave today,,come by and schnitz with us!!	1431702487	599229779053780992	f	schnitznthings
Hey Schnitzlers, we will be on 26th street West side to 11th ave.	1431616522	598869218839425024	f	schnitznthings
@juan_mier No.	1431533018	598518974855380992	f	schnitznthings
Hey guys we will be on 27th & Park today.	1431529490	598504179569688576	f	schnitznthings
Hey Schnitzlers we will be on Greenwich & Park today.	1431446346	598155448987037698	f	schnitznthings
Hey guys, we will be on Charlton & Varick today.	1431359640	597791776355786753	f	schnitznthings
RT @alwaysaterrier: Was going to get Chipotle for lunch, but then @schnitznthings happened. http://t.co/3C847nWJQM	1431112351	596754572175155200	f	schnitznthings
The schnitzel cart is on Charlton & Varick.  Happy Friday.	1431100717	596705772643418112	f	schnitznthings
The Schnitzel Cart is on 27th & Park.	1430928680	595984198835576832	f	schnitznthings
@rshawnmitchell 27th & Park today	1430928634	595984004039467009	f	schnitznthings
@kristeen05 yes	1430928608	595983897474772993	f	schnitznthings
@rshawnmitchell thanks for the love. Where did you get your lunch, The cart or truck?   We got you next time!!	1430868605	595732227218153472	f	schnitznthings
@undoneforever LoL ! &lt;3 xoxo	1432931290	604383754564554753	f	korillabbq
Sorry Midtown. Make that 12:30	1432913756	604310209599819776	f	korillabbq
Midtown Friday! 47th & Park ready by 12	1432912582	604305287739281410	f	korillabbq
Digging this Spicy Pork Burrito Bowl from @megjoneswall! eastvillage eeeeeats nyceats http://t.co/l1cIVJz77s	1432839866	604000294092083200	f	korillabbq
RT @BklynAttorney: .@KorillaBBQ Attorneys of MZW taking a Metrotech lunch break at the KorillaBBQ truck. Brooklyn FoodTruck http://t.co...	1432838534	603994706985553920	f	korillabbq
RT @ZiaJD: @KorillaBBQ feeding the masses at metrotech. KorillaBBQ workflow @ MetroTech Center https://t.co/SVbRD4s6p6	1432838529	603994685523234816	f	korillabbq
Who else is digging this burrito bowl of Spicy Pork with veggies and somen noodles? Thanks... https://t.co/YL6XzlG8Ym	1432837793	603991597441814530	f	korillabbq
Now serving FiDi ! (Old Slip & Front)	1432830720	603961931792306176	f	korillabbq
Metrotech we ready for you at 12pm!	1432827810	603949729333018624	f	korillabbq
Wsup FiDi! Front & Old Slip ready by 11:45	1432825792	603941262027259904	f	korillabbq
Runnin a bit late Metrotech! Myrtle & Lawrence ready by 12:15	1432825651	603940671079198720	f	korillabbq
Get up close and personal with Korilla at St. Mark's! Thanks @belenjung for this cool video! Snap a... https://t.co/HJGSsGZmWG	1432766550	603692785959628802	f	korillabbq
Now serving FiDi! (Old Slip & Front)	1432742278	603590981699674112	f	korillabbq
RT @FindEatDrink: Multi-color vegan bowl @korillabbq @queenskids @jeaniusnyc koreanfood NYC FEDguides travel streetfood http://t.co/8p...	1432680472	603331749054152704	f	korillabbq
Done for the day!	1432665939	603270790344212480	f	korillabbq
47th and park ready by 12!	1432653179	603217271193018368	f	korillabbq
We're back and these balls are worthy of you hungry Tigers. Get your bite on at St. Mark's!  tigerballs eeeeeats http://t.co/mF9MKY0hVb	1432652100	603212744310001664	f	korillabbq
In honor of Memorial Day, our food trucks and East Village shop will be closed. Enjoy your holiday and see you Tuesday!	1432520248	602659718776156161	f	korillabbq
RT @jeaniusNYC: FF @choibites @mokbar_nyc @korillabbq @TheTasteofKorea @EpochTaste @maangchi @FindEatDrink @LUCKYRICEDOTCOM @koreasociety ...	1432338245	601896341527273472	f	korillabbq
FF @EastVillageEats @nyuspoon @SpoonUniversity @NYUCampusCash @NYUgenerasian @GrnVillageNYC @eastvillagefeed @EastVillageNY @NHEastVillage	1432337707	601894086589689856	f	korillabbq
BigRed is on 46th & 6th today	1432908956	604290077821399040	f	lobstertruckny
OMG -- don't say it! madsqeats ends at 9 pm til Sept. Come party NOW! cold beer, hot lobster.	1432830871	603962567632003073	f	lobstertruckny
LAST DAY OF MADISON EATS til Sept -- come and PARTY lobster madsqeats\nclawsup	1432830692	603961815450648576	f	lobstertruckny
BigRed is off the street and booked for a private event. We'll see you tomorrow!	1432825937	603941869672865792	f	lobstertruckny
BigRed will on 53rd & Park	1432741016	603585686160158720	f	lobstertruckny
The Pound in Red Hook will be closed today for a private party.  We will reopen again tomorrow for lunch.  Thanks!	1432653242	603217534960193536	f	lobstertruckny
It's not too late NJ, BigRed is still at Monmouth Park! http://t.co/33QRvtHEkc	1432582272	602919865167523841	f	lobstertruckny
BigRed is stuffed with fresh Maine Lobster and in NJ! Join us at Monmouth Park http://t.co/TQCrXhVKFq	1432575080	602889699015921664	f	lobstertruckny
BigRed in NJ all day til 5:00, race to Monmouth Park Racetrack for Food Truck Festival! http://t.co/GyIcSFS1XZ	1432567892	602859553798168577	f	lobstertruckny
Day 3 of BigRed bringing a little Maine to New Jersey at the Monmouth Park Food Truck! JoinUsInNJ Festival http://t.co/4kCGmInbxs	1432560351	602827923515670528	f	lobstertruckny
We've had so much fun, BigRed is going to be in New Jersey tomorrow too! http://t.co/k9bkOVMvu8	1432506655	602602703731236864	f	lobstertruckny
This lobster truck is in New Jersey because New Jersey needs LobsterLUV too. http://t.co/sd9KJyC6nL http://t.co/Q1tTxbkcYV	1432480541	602493173693317121	f	lobstertruckny
BigRed is in New Jersey all weekend! Come to Monmouth Park! http://t.co/EpiiCN2pQV	1432392340	602123233719099392	f	lobstertruckny
BigRed will be invading Monmouth Park, NJ all weekend-show your LobsterLUV New Jersey! http://t.co/OXYnSZTeOg	1432337715	601894121427599360	f	lobstertruckny
The truck has been booked for a private gig but fear not! We have options for CrustaceanElation http://t.co/ziIgYJJiQ9	1432308435	601771310730076160	f	lobstertruckny
Expect world peace! BigRed will be at the UN tomorrow! http://t.co/ZMQTBQjOyX	1432165535	601171944344518656	f	lobstertruckny
RANGERS GAME 8 PM 284 Van Brunt huge new PROJECTION TV! $3 Beer $5 codders, $25 Lobster dinners and RALPH! http://t.co/MJIX0iAOq3	1432160595	601151226378584064	f	lobstertruckny
Your lunch is at 53rd & Park, it's lunchtime, you know what you have to do...	1432139729	601063706441719810	f	lobstertruckny
Don't listen to Joey or Dee Dee - BigRed is on 53rd & Park http://t.co/0hc2dUiUp7	1432136127	601048600240640000	f	lobstertruckny
BigRed is at 53rd & Park. They are melting butter and getting ready to make your lunch. MakeItHappen	1432131923	601030967302684675	f	lobstertruckny
For one free dinges, do a bird call dinges dingesforeveryone	1432930231	604379311764807680	f	waffletruck
RT @34thStNYC: Two times the spekuloos-fun in Midtown: Visit the @waffletruck cabana at Herald Square Park (35th & Bway) or new kiosk at @B...	1432921372	604342153599311873	f	waffletruck
De CARTS 2/2:\nKotmadam @ 24th & 5th Ave til 9pm\nBierbeek @ De Great Lawn til 7pm	1432920578	604338824332763137	f	waffletruck
De CARTS 1/2:\nGoesting @ 66th & Broadway til 10pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm\nVedette @ 59th & 5th Ave (Manhattan) til 7pm	1432920565	604338768590426112	f	waffletruck
WAFEL FRENZY FRIDAY! \nLe Cafe @ 15 Ave B til 10pm\nDe Wafel Cabana @ 35th & Broadway til 11pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1432920536	604338646360051712	f	waffletruck
For one free dinges, pantomime your way out of a box! dinges dingesforeveryone	1432836429	603985880106323968	f	waffletruck
RT @MegWarshaw: @waffletruck bacon & syrup waffle with speculoos spread makes this gloomy Thursday morning so much better http://t.co/eX49f...	1432836423	603985850909728768	f	waffletruck
De CARTS 2/2:\nKotmadam @ 24th & 5th Ave til 9pm\nBierbeek @ De Great Lawn til 7pm	1432823820	603932994030604289	f	waffletruck
De CARTS 1/2:\nGoesting @ 66th & Broadway til 10pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm\nVedette @ 59th & 5th Ave (Manhattan) til 7pm	1432823807	603932936006725632	f	waffletruck
De Throwdown Thursday!\nCafe @ 15 Ave B til 10pm\nWafel Cabana @ 35th & Broadway til 11pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1432823788	603932858256760832	f	waffletruck
Sync up a Good Morning & NYC w/De Breakfast Special. Fresh Wafel & coffee at a great value! dinges dontmissdetrain http://t.co/x35PUl8qZW	1432820253	603918030653952000	f	waffletruck
@RosettaChan we approve her approval, thank you! dingesforeveryone	1432742302	603591080341327872	f	waffletruck
RT @RosettaChan: Enjoying wafflesanddinges with friends, one of which is a waffle newbie. She approves of @waffletruck	1432742260	603590906130898944	f	waffletruck
@tomvinimation all around fam, where you at? I'll tell you the closest spot.	1432742181	603590574504030208	f	waffletruck
RT @longislands: hell yeah finally tried it @waffletruck http://t.co/sFvnE9KItV	1432741910	603589437516308480	f	waffletruck
De CARTS 2/2:\nKotmadam @ 24th & 5th Ave til 9pm\nBierbeek @ De Great Lawn til 7pm	1432741840	603589144988758016	f	waffletruck
De CARTS 1/2:\nGoesting @ 66th & Broadway til 10pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm\nVedette @ 59th & 5th Ave (Manhattan) til 7pm	1432741822	603589066316259328	f	waffletruck
De TRUCK:\nKastaar @ 60 Wall St til 4pm	1432741808	603589010792013826	f	waffletruck
WAFEL CRUSH WEDNESDAY\nLe Cafe @ 15 Ave B til 10pm\nDe Wafel Cabana @ 35th & Broadway til 11pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1432741785	603588912779501569	f	waffletruck
De CARTS 2/2:\nKotmadam @ 24th & 5th Ave til 9pm\nBierbeek @ De Great Lawn til 7pm	1432655759	603228091226451969	f	waffletruck
Saw the work of our buds @TheISCollective at @BklynFoundation at the Invest-in-Youth open house @DriveChangeNYC http://t.co/dQwG2gIfqT	1432905659	604276248043470848	f	snowdaytruck
@vendyawards @BilldeBlasio @MMViverito Great work everyone!!	1432834117	603976179519991809	f	snowdaytruck
RT @NYCEDC: Happy 75th Bday, @EssexStMarket! Celebrate all month, meet the merchants, get hungry. http://t.co/pEzhLtW9uM http://t.co/5qh6Tg...	1432834050	603975899919319040	f	snowdaytruck
RT @FordhamRoad_NYC: @SnowdayTruck is here! http://t.co/nkDJNrACdi	1432832184	603968074832805888	f	snowdaytruck
.@colleenhagerty @ajplus thank you so much for a great video and sharing our story!! @DriveChangeNYC	1432829546	603957006660165632	f	snowdaytruck
RT @ajplus: This food truck is serving up a side of social justice: http://t.co/K4e45ALd5o	1432829432	603956531139317762	f	snowdaytruck
RT @colleenhagerty: Grilled cheese for social change: my first for @ajplus featuring @SnowdayTruck https://t.co/HuQl11DBrh raisetheage	1432769466	603705014704611328	f	snowdaytruck
@carodjames private event today - back on the road later in the week! Hope to give you the maple GC fix	1432581575	602916944371646464	f	snowdaytruck
Guess where we are today!? Come explore @gov_island on its OpeningDay and have lunch with us! NYC... https://t.co/IP06VfcIlT	1432387100	602101255494868992	f	snowdaytruck
It's OPENING WEEKEND and we could not be more excited @GovIsAlliance @GovIslandFood - we will be on Gov Is sat-sun http://t.co/TqqGoZjl0X	1432386614	602099217000181760	f	snowdaytruck
@thetinyraccoon check out the menu board http://t.co/1SEHVUy2B8	1432329065	601857839376834561	f	snowdaytruck
RT @FoodtoEat: Had a great time kicking off our partnership w/@ManhattanDA & what better way then to start w/@SnowdayTruck eatlocal http:/...	1432327778	601852439092924417	f	snowdaytruck
RT @ManhattanDA: Happening now: Manhattan DA's Office welcomes @SnowdayTruck! http://t.co/6wmF0sqHlW	1432326944	601848941307678720	f	snowdaytruck
RaiseTheAgeNY and let our kids become productive adults. Take our kids out of adult facilities. Sign our petition: http://t.co/eAHc2qr116	1432300221	601736857295179776	f	snowdaytruck
taste our farm fresh fare today - 1 Hogan Place - this one is on the menu as rethinkbail rice & farro salad http://t.co/M992Au8EMr	1432298802	601730905955299328	f	snowdaytruck
Off to the DAs office for lunch - open to public at 1 Hogan Place - join us! We're naming things on our menu after reform we want to see	1432296790	601722467850268672	f	snowdaytruck
RT @guestlistblog: . @snowdaytruck at @ChoiceStreets foodtruck Event. To-die-for grilledcheese & a great cause: http://t.co/WAQ0YbPq1T ht...	1432238959	601479905210179586	f	snowdaytruck
@barton_david @villagevoice Thanks David!	1431910642	600102844558020608	f	snowdaytruck
RT @NYjusticeleague: The official food truck of Justice League @SnowdayTruck is at Grand Army Plaza now!  w special guest @heyyymickeyyyy h...	1431894332	600034435518562304	f	snowdaytruck
Our first @prospect_park foodtruckrally of the season!! Come get it Brooklyn - let's eat!	1431869581	599930621738229761	f	snowdaytruck
RT @LaBellaTorte: FoodTruckFriday @livefastgroup @IntrepidMuseum @PapayaKingTruck @carlssteaks lbttrucknyc	1432911194	604299463277047808	f	papayakingtruck
Join us on the Pier at the @IntrepidMuseum today and everyday throughout June 	1432909104	604290699350163456	f	papayakingtruck
We are at the @IntrepidMuseum and @DowntownBklyn today for FoodTruckThursday come have lunch with us!	1432824444	603935609837748225	f	papayakingtruck
RT @LaBellaTorte: Come to @IntrepidMuseum @livefastgroup @PapayaKingTruck great greatfoodthirsday	1432824396	603935405952651264	f	papayakingtruck
RT @LaBellaTorte: Join us today and celebrate @IntrepidMuseum @carlssteaks @Papaya_King MemorialDay	1432569420	602865959838285824	f	papayakingtruck
Join us on this beautiful MDW2015 on the @IntrepidMuseum \nFleetWeek	1432478174	602483247155642369	f	papayakingtruck
RT @livefastgroup: Come stop by the @IntrepidMuseum for the perfect memorialdaywknd filled with fun & great food. @carlssteaks @PapayaKing...	1432476303	602475401135423489	f	papayakingtruck
RT @livefastgroup: It's FleetWeek at the @IntrepidMuseum so come grab some food from our great vendors @LaBellaTorte @PapayaKingTruck @mel...	1432389716	602112226267377664	f	papayakingtruck
@LanternAtrain just at the @IntrepidMuseum today	1432308249	601770529939451904	f	papayakingtruck
@LanternAtrain at the @IntrepidMuseum	1432306252	601762153163575298	f	papayakingtruck
RT @livefastgroup: It's FleetWeek at the @IntrepidMuseum so come grab some food from our great vendors @LaBellaTorte @PapayaKingTruck @mel...	1432306232	601762071819251712	f	papayakingtruck
Never at our trucks/carts!!! - enjoy The Original when in NYC - NYC street vendor charging $30 for a hot dog & drink http://t.co/Hg4gO3gkOF	1432141485	601071071895388161	f	papayakingtruck
Thanks to @livefastgroup we will be at  @IntrepidMuseum all day to celebrate FleetWeek. Come celebrate with us nyc intrepid foodtrucks	1432126315	601007442965716992	f	papayakingtruck
Join us today at @prospect_park FoodTruckRally 11a-5p w/ our friends @NeaExpress	1431867437	599921631797084161	f	papayakingtruck
RT @DispatchNY: .@prospect_park FoodTruckRally Tomorrow 5/17, 11a-5p w/ @NeaExpress @PapayaKingTruck http://t.co/qV9u4wZY2D	1431832366	599774533843853312	f	papayakingtruck
@LSE14 closest is our saint marks location (8th St & 3rd Ave)	1431791491	599603088471793664	f	papayakingtruck
RT @DispatchNY: .@Prospect_Park FoodTruckRally this SUNDAY 5/17, 11a-5p with @neaexpress @PapayaKingTruck http://t.co/KZYSInZk1x	1431455524	598193941712916481	f	papayakingtruck
RT @livefastgroup: Today @IntrepidMuseum we are bringing in the best food trucks in NYC.10am-5pm @USAFoodTruck  @PapayaKingTruck @DeliNDogz...	1431355284	597773506936500224	f	papayakingtruck
If you're visiting the @IntrepidMuseum today, you can also grab a frank and tropical drink! HappyMothersDay	1431273191	597429182122106880	f	papayakingtruck
RT @IntrepidMuseum: Thanks to @Livefastgroup, we have some awesome food trucks on our pier today:@USAFoodTruck @LaBellaTorte @PapayaKingTru...	1431098739	596697477807484928	f	papayakingtruck
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
RT @ShortysTrivia: Stand by for great news  ... @shortysnyc @JJustine @JamieKleinberg @JillianSed @amandaseybold @LouFerrara @KelseyAnne...	1432932137	604387308503175170	f	shortysnyc
Championship Trivia Night at ShortysFiDi Shortys ShortysNyc http://t.co/6wEypHGffg	1432172409	601200776954908673	f	shortysnyc
RT @ShortysTrivia: Questions are already done. I need a beer. Less than 3 hours away! @shortysnyc @SixpointNYC @JJustine shortys http://t....	1432162937	601161048247443456	f	shortysnyc
RT @ShortysTrivia: 1st Ave vs Pearl St ... TONIGHT 9pm!!! @shortysnyc @SixpointNYC @amandaseybold @JamieKleinberg @patandriola http://t.co/...	1432162927	601161007487135744	f	shortysnyc
RT @FakeAdamLyons: Defending the Wall in NYC in a Philly Bar. FreeBrady @stoolpresidente @shortysnyc http://t.co/YHheYJCR4t	1432162923	601160990827356160	f	shortysnyc
RT @RegularGuyNYC: Philly Cheesesteaks & Craft Beer in NYC? Oh yes,at Shorty's! http://t.co/WGwXsgSEGi ShortysUpperEast sandwich NYC be...	1432079183	600809756941524992	f	shortysnyc
RT @ShortysTrivia: Last call for any winners or loyal teams! Here's who is locked in for tomorrow night! @shortysnyc @SixpointNYC http://...	1432068544	600765133984509954	f	shortysnyc
RT @anigupta: Cheestakes and IPA. Yummy! And wifi rocks here! (at @ShortysNyc in New York, NY) https://t.co/QD84AqA3MR http://t.co/pKDU172p...	1431990560	600438047453380608	f	shortysnyc
RT @Supreme_Dina: @shortysnyc has the BEST cheesesteaks. Turned my Monday around!	1431990557	600438035315044352	f	shortysnyc
RT @JJustine: CHAMPIONSHIP THIS WEEK WEDNESDAY MAY 20th -- 9pm @shortysnyc  https://t.co/gMDseuQJTG	1431959777	600308933178335234	f	shortysnyc
RT @Andrel1331: Beer and cocktail (at @ShortysNyc in New York, NY) https://t.co/4VZcyAjPIM http://t.co/L3LUDQ1ADX	1431918265	600134820765773824	f	shortysnyc
RT @KarinRosner: If you're gonna have a diet cheat day, make it worth it. (at @ShortysNyc in New York, NY) https://t.co/Oi8xF5OCeV	1431918255	600134778306826240	f	shortysnyc
RT @ShortysTrivia: Attn TEAMS!! please DM me and RSVP how many people will be on your team for Wed!! @shortysnyc @SixpointNYC @JamieKleinbe...	1431717403	599292342957436928	f	shortysnyc
RT @HUViolet: It's been a while,  but finally reunited with @shortysnyc @ Shorty's Pearl Street https://t.co/YvvovyrGYo	1431603177	598813245831565313	f	shortysnyc
RT @ShortysTrivia: Ok so it's official. 1 more week of Trivia this week and then the CHAMPIONSHIP will be Wed 5/20 @shortysnyc Pearl 9pm!! ...	1431386810	597905736904081409	f	shortysnyc
@ElliotD224 no more truck elliot.  looking for new shorty's locations.  you can always call us for a delivery or stop by if you can.	1431354920	597771980419538944	f	shortysnyc
RT @TheCrankyFan: Watching a million games at once.. (at @ShortysNyc in New York, NY) https://t.co/Cf64JQubKm	1431195577	597103646371880961	f	shortysnyc
RT @shahofthewest: I u @shortysnyc	1431083305	596632742718283776	f	shortysnyc
RT @ShortysTrivia: Tonight's winners!!! @shortysnyc 1stAve @PheebKingslayer @JJustine http://t.co/0NazwQgrfS	1430993721	596256999660199937	f	shortysnyc
RT @RegularGuyNYC: Philly Cheesesteaks & Craft Beer in NYC? Oh yes,at Shorty's! http://t.co/WGwXsgSEGi ShortysUpperEast sandwich NYC be...	1430929119	595986038998310912	f	shortysnyc
Getting ready on 53rd & Park!	1432909884	604293972232556546	f	biandangnyc
53rd & Park for dumplings zhongzi and buns!	1432820181	603917730593378304	f	biandangnyc
Almost open on 53rd & Park!	1432736548	603566948106899456	f	biandangnyc
Happy Tuesday from 53rd & Park!	1432649302	603201010773852160	f	biandangnyc
53rd and park. Have a great Memorial Day weekend. Will see you on Tuesday!	1432304045	601752896489660416	f	biandangnyc
Yummy things stewing up on 53rd and Park! Swing by for a PorkBelly bowl today	1432218041	601392171682402304	f	biandangnyc
Humpday today, but we got the cure on 53rd & Park!	1432131322	601028445296992256	f	biandangnyc
SaltnPepperChicken is the perfect Tuesday pick-me-up! Get one on 53rd & Park today!	1432044544	600664469803376640	f	biandangnyc
Haaaappy Monday from 53rd & Park!	1431959032	600305807498973184	f	biandangnyc
Happy Fryday! 53rd & Park for your Taiwanese fix:)	1431698578	599213383561252864	f	biandangnyc
Open on 53rd & Park today!	1431614131	598859188203302913	f	biandangnyc
Sold out of chicken! Still got your pork chop, cutlet, pork belly and beef stew! Come get it!	1431450031	598170905391538177	f	biandangnyc
Back at it on 53rd & Park! Catch up on all the extra porksauce you missed!	1431439492	598126698232717312	f	biandangnyc
Guess whos back???????? 53rd and park... lesssssssssssssgo!!! http://t.co/6WGxb2yeVP	1431350716	597754345073938435	f	biandangnyc
It's official! Bian Dang will be back on 53rd and Park on Monday! See you there!	1431211303	597169606868934656	f	biandangnyc
The wait is over! Bian Dang back on 53rd & Park this Monday :)	1431130774	596831840951881728	f	biandangnyc
Bian Dang is expected to be back out on the streets on 5/11! Sorry for the wait! Its out of our control... we miss yall so much!	1430407409	593797830138994688	f	biandangnyc
We miss you all! Hopefully we can get our truck out again soon!	1428523228	585895001575432192	f	biandangnyc
the Bian Dang truck is still getting some tender loving care. Please standby till our triumphant return.	1427298570	580758412004331520	f	biandangnyc
Happy Friday @MexicoBlvd tacosssss 46th St	1432912626	604305473442050049	f	mexicoblvd
Hola Amigos! Enjoy your day @MexicoBlvd @dumbolot Water&Jay	1432824704	603936698318348288	f	mexicoblvd
RT @dumbolot: Lot is smelling fine with @MexicoBlvd @ToumNYC and @mausamnyc today!	1432824590	603936223099527168	f	mexicoblvd
Good morning! guacamole flautas tortas  tacos @MexicoBlvd 51st St & Park	1432736664	603567432066867200	f	mexicoblvd
Hola Midtown! Lunch @MexicoBlvd 46th St (6&7)	1432654814	603224127483322369	f	mexicoblvd
Happy long weekend, charge your battery @MexicoBlvd  and enjoy it! tacotacotaco 46th St (6&7)	1432300221	601736856904957952	f	mexicoblvd
Buenos dias! saboresdemexico @MexicoBlvd @dumbolot Water&Jay	1432219024	601396293320085504	f	mexicoblvd
RT @dumbolot: A lot of good food with @ToumNYC @MexicoBlvd and @mausamnyc today! badumshh	1432218454	601393904739438592	f	mexicoblvd
Warm smiles and your favorite lunch @MexicoBlvd 51st St & Park	1432133258	601036566576902144	f	mexicoblvd
Aguacate in your tacos, tortas, flautas, quesadillas and of course in your guacamole @MexicoBlvd http://t.co/Mvp5eSRmtW	1432132508	601033417300512768	f	mexicoblvd
Good morning Midtown! T for tacos adobo pastor tinga bistec @MexicoBlvd 46th St (6&7)	1432047220	600675696265043968	f	mexicoblvd
Hola DUMBO! Feliz semana @MexicoBlvd @dumbolot Water&Jay	1431960644	600312570080288768	f	mexicoblvd
RT @dumbolot: Monday again with @dubpies @MexicoBlvd and @ToumNYC!	1431960506	600311991316705280	f	mexicoblvd
RT @NaimaEfuru: I made my COS IT guys walk for their taco fix fatkidatheart mexicoblvd https://t.co/LOWTrvLvct	1431802587	599649629035057152	f	mexicoblvd
RT @BrownBoogz: Should out to mexicoblvd they hooked a brother up with some good eats today brooklynbridgepark... https://t.co/hPDIZvaiaA	1431699994	599219324696580096	f	mexicoblvd
Just smile & eat tacos @MexicoBlvd It's Friday! 46th St (6&7)	1431698049	599211167211331585	f	mexicoblvd
@LuckySevenTen you can come by and we will give you a new one	1431621636	598890665892814848	f	mexicoblvd
@LuckySevenTen no we do not the only thing I could think about happening is that it naturally fermented if it was left out a while.	1431621598	598890509596303360	f	mexicoblvd
RT @CelebrateBklyn: We've got @morristruck @MexicoBlvd @dubpies & @KimchiTruck at our dance party at @BklynBrdgPark tonight. Come hungry! h...	1431618489	598877468792094720	f	mexicoblvd
Hola Dumbo! taquiza muymexicana @MexicoBlvd @dumbolot Water&Jay	1431617683	598874088036270080	f	mexicoblvd
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
M-e-t-h-od Man is down with Mamu Thai! WuTang bk nyc c.r.e.a.m. mamuthai @MamuThai http://t.co/TKVdP28E8B	1432938856	604415489884962816	f	mamuthainoodle
We are super excited to join @thaithenticNYC for their second Chef Series pop-up event @starrettlehigh this evening 5pm-8pm Hungry yet?thai	1431624296	598901824263999488	f	mamuthainoodle
Happy Mother's Day to all moms everywhere!	1431302874	597553681425391617	f	mamuthainoodle
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
Truck open at 55th street and Broadway. Come!!!	1432895891	604235278178480128	f	carpedonutnyc
Truck open at 51st street and Park avenue. Come!!!	1432809145	603871441172504576	f	carpedonutnyc
Open at 23rd street and park avenue south. Come!!!	1432723270	603511252749590528	f	carpedonutnyc
Truck open Bergen and court. Come !!!	1432466577	602434607477334016	f	carpedonutnyc
@bmxrocksya sorry we missed you yesterday. We were at a private event. We are back at Bergen St and Court St tomorrow from 7.30 am. Thanks!	1432396901	602142363918671872	f	carpedonutnyc
Open now @ Bergen St and Court St. Come get some donuts now - we are only here till 12pm today!!	1432387418	602102588914413568	f	carpedonutnyc
Open at 51st street and Park avenue. Come!!!	1432204620	601335879790133248	f	carpedonutnyc
Open at 23rd street and Park avenue south. Come!!!	1432118127	600973100734361601	f	carpedonutnyc
Food truck rally, grand army plaza. Come!!!	1431872380	599942363469983744	f	carpedonutnyc
Truck open at 55th street and Broadway. Come!!!	1431685634	599159092473630720	f	carpedonutnyc
Truck open at 51st street and Park avenue. Come!!!	1431600280	598801091845840896	f	carpedonutnyc
Truck open @ 23rd street and park avenue south. Come!!!	1431513802	598438378816872449	f	carpedonutnyc
Truckopen at Bergen and court street. Come!!!	1431255774	597356128566177792	f	carpedonutnyc
Open @ Bergen St and Court St now!	1431171597	597003066840342528	f	carpedonutnyc
Truck open at 55th street and Broadway. Come!!!	1431083215	596632366443036673	f	carpedonutnyc
Truck open. 23rd street and park avenue south. come!!!	1430911307	595911332886683648	f	carpedonutnyc
Truck open at 51st street and park avenue. Come!!!	1430735733	595174921547964416	f	carpedonutnyc
Truck Food truck rally. Grand army plaza. Prospect park. Come!!!!	1430664096	594874452413919232	f	carpedonutnyc
Come enjoy a donut with us on this beautiful spring day! Open at Bergen and Court - fresh donuts and refreshing beverages await!	1430567478	594469209087807488	f	carpedonutnyc
Open @ 55th and Broadway now!	1430480371	594103853215305728	f	carpedonutnyc
46st we are here, bet 5&6 Ave closer to 6 Ave serving lunch from 11:30 until 3:30 order online http://t.co/vR5tgBHsTH, get some schnitzi	1432820910	603920785699397633	f	schnitzi1
add some chicken to your shavuot diet, let us help you,  @46 St b/5&6 serving lunch from 11:30-3:30 order online @www.schnitzi.com	1432647114	603191834630819840	f	schnitzi1
It seems like it is going to be a nice day today, @46 St bet 5&6 serving lunch from 11:30 until 3:30 schnitzitruck http://t.co/vR5tgBHsTH	1432214325	601376584008912896	f	schnitzi1
Today we are @46 St bet 5&6 Ave serving lunch from 11:30 until 3:30 order online @www.schnitzi.com schnitzitruck schnitzel	1432132692	601034189589348352	f	schnitzi1
today we are @46 St bet 5&6 Ave serving lunch from 11:30 until 3:30 order online @www.schnitzi.com schnitzitruck foodtruck	1432042687	600656682591657985	f	schnitzi1
Today @Hanover Sq serving lunch from 11-3 order online @www.schnitzi.com get some early start Schnitzi schnitzitruck kosher	1431958739	600304577372651521	f	schnitzi1
Look for us @46 and the corner of 6 Ave serving lunch from 11:30-3:30 order online @www.schnitzi.com see you all soon	1431612664	598853034375020544	f	schnitzi1
Good morning to all of Schnitzi fans, today we will serve lunch @46 St bet 5&6 Ave from 11:30-3:30 order online @www.schnitzi.com	1431524553	598483471363870721	f	schnitzi1
@46 St bet 5&6 serving lunch from 11:30-3:30 don't wait , order online @www.schnitzi.com (pay online) schnitzitruck foodtruck	1431439968	598128695115698176	f	schnitzi1
Get ready for some schnitzi @Hanover Sq,lunch from 11-3 order online @www.schnitzi.com schnitzitruck schnitzel foodtruck	1431352283	597760917317758977	f	schnitzi1
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
@tobjustb sorry To hear that, We close at 6 pm, what time did u go?	1432857229	604073120434147328	f	palenquefood
Are you thirsty ? Easy ! Come to @GansMarket and get yourself a Fresh agua de panela ! We do make it with tons of love	1432825693	603940849588789248	f	palenquefood
Come to Rockaway Boardwalk on 96! http://t.co/IKnWDS9ayu	1432399216	602152074252558336	f	palenquefood
Bringing the sunshine to the Rockaways with our delicious arepas, tostones & yuca fries!!	1432399087	602151533346738176	f	palenquefood
Really Happy making Arepas! :) https://t.co/98BqAenstC	1431900675	600061041620422657	f	palenquefood
Serving Arepas @NYRR marathon! https://t.co/YS10MYlfkL	1431869607	599930733516464128	f	palenquefood
Lovely day! We are ready to feed you with the most delicious Colombian arepas at GANSEVOORT MARKET.	1431529011	598502170879733760	f	palenquefood
@ShmidtBoris sorry u feel this way, We ask Customers We charge a fee using credit Cards! We want To reimburse u with any item from our Menu	1431524827	598484621261721600	f	palenquefood
@ShmidtBoris sorry you feel this way, we charge regular tax + square fee! there is no fraude at all , please pay cash!	1431463203	598226148884094976	f	palenquefood
RT @GansMarket: Stop in for an adventurous lunch break! @DonostiaNYC @MTerraneanNYC @CapponesNYC @edslobsterbar @Palenquefood @tacombi @PIG...	1431445541	598152070714241025	f	palenquefood
It's Palenque time! Come by and try our delicious food in UrbanSpace at Broadway between 39 and 40th st http://t.co/eb5fhnuFMi	1431445365	598151334580363264	f	palenquefood
Visit us at @GansMarket get any of our delicious arepas and don't forget to ask for the lunch special ;) colombianfood nyc	1431442689	598140106814423041	f	palenquefood
Lovely day for some Colombian arepas. Come visit us at our meat-packing district location.  @GansMarket	1431362480	597803689647026176	f	palenquefood
Today smorgasburg pier 5 Brooklyn bridge park until 6:00 pm beautiful day for a delicious arepa! https://t.co/4tE67x05Nt	1431279143	597454145818353664	f	palenquefood
Having fun making Arepas smorgasburg N7 and river side Williamsburg https://t.co/Y6emKn8RNy	1431179723	597037148697661440	f	palenquefood
Making healthy multigrain empanadas https://t.co/T1H77mz5uX	1431106698	596730860843446272	f	palenquefood
You can also make yourself our home made quinoa arepas at home come visit us today at @gansmarket... https://t.co/t0tJiyMGdk	1431008453	596318792453492738	f	palenquefood
RT @GansMarket: . It may be cloudy today but the market is celebrating HumpDay with so many tasty lunch options! @edslobsterbar @CapponesN...	1430928456	595983260515233792	f	palenquefood
RT @HeyNannery: Every go to @Palenquefood in garmentdistrict @UrbanSpaceNYC right now! Get an arepa with a side of agua de panela! http://...	1430773517	595333398027177984	f	palenquefood
RT @MayhemAndStout: New Market Monday. UrbanSpaceGarment opens today @ 11 & runs till June 14. Find us on B'way btwn 40th & 41st. @UrbanSp...	1430752372	595244710433792000	f	palenquefood
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
Lil Carl makes it 2015 debut today @IntrepidMuseum same great cheesesteaks as Big Carl which is at 55th st and... http://t.co/qarP5VBgmM	1432912042	604303021787500545	f	carlssteaks
Scream it from rooftops it's CHEESESTEAK FRIDAY ! 56th st / Bdwy @randomfoodtruck @victoriasecret @UMG @Barclays... http://t.co/7spL7HYg2b	1432911642	604301342887256064	f	carlssteaks
Lil Carl makes it 2015 debut today @IntrepidMuseum same great cheesesteaks as Big Carl which is at 55th st and Broadway today. 2x the Love!!	1432911621	604301255079542785	f	carlssteaks
RT @LaBellaTorte: FoodTruckFriday @livefastgroup @IntrepidMuseum @PapayaKingTruck @carlssteaks lbttrucknyc	1432911510	604300789851516928	f	carlssteaks
Scream it from rooftops it's CHEESESTEAK FRIDAY ! 56th st / Bdwy @randomfoodtruck @victoriasecret @UMG @Barclays @DefJamRecords GOT WHIZ?	1432906035	604277828851515392	f	carlssteaks
HAPPY HAPPY DAY FOLKS!! PROUD TO SAY LIL CARL @carlssteaks HAS PASSED INSPECTION AND WILL BE BACk ON THE ROAD... http://t.co/XMR0trLKSR	1432830420	603960675338190850	f	carlssteaks
We love Thursday ONE day closer to Friday folks 49th st 6 / 7 Av @Barclays @DefJamRecords @SIRIUSXM @SiriusXMNFL... http://t.co/tlCZdFhHxs	1432829996	603958895246213120	f	carlssteaks
Happy hump day folks 47th st bet park / lex @MLB @nfl @UBSamericas @jpmorganchase @SIRIUSXM @SiriusXMNFL GOT WHIZ? http://t.co/ySZqN5D9QE	1432736276	603565803934457856	f	carlssteaks
Happy hump day folks 47th st bet park / lex @MLB @nfl @UBSamericas @jpmorganchase @SIRIUSXM @SiriusXMNFL GOT WHIZ? http://t.co/Kv5C0EPdAH	1432736130	603565194816724993	f	carlssteaks
Back in brooklyn baby!!! Start your 4 day workweek off right w a carls famous cheesesteak GOT WHIZ? nycsbest	1432649110	603200203554979841	f	carlssteaks
RT @dumbolot: 4 day work week starts with @KimchiTruck @SweetChiliNYC and @carlssteaks!	1432649071	603200040476225536	f	carlssteaks
RT @LaBellaTorte: Join us today and celebrate @IntrepidMuseum @carlssteaks @Papaya_King MemorialDay	1432569174	602864930749026304	f	carlssteaks
RT @livefastgroup: Come Celebrate our Brave Troops and grab some great food. America mdw nyc food trucks intrepid... https://t.co/STkxHx...	1432565100	602847840163999744	f	carlssteaks
RT @livefastgroup: Come stop by the @IntrepidMuseum for the perfect memorialdaywknd filled with fun & great food. @carlssteaks @PapayaKing...	1432475436	602471765101666305	f	carlssteaks
RT @GovIslandFood: Opening day on @Gov_Island. stop by and enjoy the beautiful weather and great food from @SweetChiliNYC @carlssteaks @Del...	1432389592	602111709076189184	f	carlssteaks
Enjoying fleet week @IntrepidMuseum so come by and grab a carls famous cheesesteak GOT WHIZ? http://t.co/Kb0lGNBlhS	1432322076	601828524807331840	f	carlssteaks
RT @livefastgroup: It's FleetWeek at the @IntrepidMuseum so come grab some food from our great vendors @LaBellaTorte @PapayaKingTruck @mel...	1432304470	601754681950482432	f	carlssteaks
Another great day @IntrepidMuseum for Fleet Week so let's celebrate our troops and grab a carls famous cheesesteak GOT WHIZ?	1432221200	601405421644062720	f	carlssteaks
RT @livefastgroup: It's FleetWeek at the @IntrepidMuseum so come grab some food from our great vendors @LaBellaTorte @PapayaKingTruck @mel...	1432212230	601367796874932224	f	carlssteaks
Thanks to @livefastgroup @carlssteaks be at the @IntrepidMuseum all day to celebrate FleetWeek.Come celebrate... http://t.co/L0Nis4fJFS	1432132237	601032283966017536	f	carlssteaks
RT @AmandaBananasNJ: @mactruckny @ChefDomTes thanks for the Mac & Cheese at @Pier_13Hoboken !! Amanda approves hoboken pier13 http://t....	1432948919	604457693697470464	f	mactruckny
@Mis_Ferreira not today, hoboken till 10	1432917074	604324128770887682	f	mactruckny
Tonight hoboken PIER13 4-10pm foodtrucks @ChefDomTes	1432913797	604310383537573888	f	mactruckny
Dont forget to follow my new page!!! @ChefDomTes foodnetwork FoodNetworkStar	1432730995	603543657451528192	f	mactruckny
Good morning 47st!!! Between park and lex last truck on the block caboose	1432730877	603543159864479744	f	mactruckny
@Mis_Ferreira likewise!!	1432319570	601818012837146624	f	mactruckny
RT @thegreenradish1: Hanging with @mactruckny on 47th btw Park and Lex 11-2pm @jpmorgan @DharmaYogaNYC @Gothamist @EatStTweet @EaterNY @mas...	1432297634	601726006324506624	f	mactruckny
Good morning 47st!! Between Park and Lex till 2pm 	1432294916	601714606684405760	f	mactruckny
@Mayna73 tomorrow 47, park and lex	1432221800	601407936653565952	f	mactruckny
@BlueMoonFelix @ChefDomTes tomorrow, finishing my prep as we tweet.	1432221342	601406017868554241	f	mactruckny
@TimTurnerMusic I'll RT you if you RT me !!!!  Perhaps a boost? http://t.co/bTb0e7r3YQ	1432077982	600804721998340096	f	mactruckny
Hey macheads do me a favor and cast your vote to make me a fanfavorite http://t.co/bTb0e7r3YQ FoodNetworkStar	1432077557	600802938278273026	f	mactruckny
@AlbaGuBrath2 i will keep you posted.	1432055067	600708606854615041	f	mactruckny
RT @ChefDomTes: surreal foodnetworkstar dominooch foodnetwork June 7th. https://t.co/FoOZeXRac0	1431981041	600398119096983553	f	mactruckny
RT @ChefDomTes: Look who popped up at my window!! fitchef actionjackson machoman foodtrucks macncheese... https://t.co/ZYhLmNJAkB	1431962295	600319495698325505	f	mactruckny
RT @morganinnyc: nervous and not feeling as prepared for the AirbnbBKHalf however I'm ready for the pre-party and mostly @mactruckny	1431658784	599046478800248832	f	mactruckny
RT @Airbnb: @morganinnyc @mactruckny We can't get enough of this mac and cheese! carboload	1431658779	599046454473265152	f	mactruckny
RT @mike_jules: @mactruckny  https://t.co/n6jHiTWcV6	1431658769	599046414719655936	f	mactruckny
RT @taralarocca: Congrats to @ChefDomTes on being part of The Next Food Network Star!!\nYou are gonna kill it! Luv @mactruckny!Make ShaoLin ...	1431658754	599046350068707328	f	mactruckny
RT @Momielee: Pulled pork Mac & cheese from @mactruckny was life changing. Oh lawd. 	1431658750	599046335120158720	f	mactruckny
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
This Saturday we will be at the Meadowlands food truck mashup! Back at Pier 13 Sunday!	1432818664	603911366831898624	f	nautimobile
RT @LukesLobster: NewJersey, you ready for a showdown? @nautimobile will be lobster rollin' at the FoodTruckMashup May 30. Tix here: http...	1432814666	603894595508928512	f	nautimobile
It's great to have Ben (Benster) back for this beautiful weekend on Pier13. He's a comedian, so ask him to tell you a joke. He loves that!	1432484790	602510995374739456	f	nautimobile
RT @LifeByAngelina: Starting MemorialDayWeekend right with this lobster roll from the @LukesLobster @NautiMobile at @pier13hoboken! http:/...	1432416114	602222951090499584	f	nautimobile
RT @AmandaBananasNJ: Today at @Pier_13Hoboken  @AmandaBananasNJ @PVPIZZATRUCK @NautiMobile @EmpanadaGuy1 @plumontherun @waffledelys @OINK...	1432388218	602105944445722625	f	nautimobile
Our Hoboken shop's outdoor seating is ready! Bring your friends! hoboken https://t.co/Svn2kGyqCB	1432337269	601892247227990016	f	nautimobile
Wondering where Nauti is? We are spending the weekdays in our new Hoboken shop, but we will be exploring new NJ weekday locations soon!	1432003148	600490844530040832	f	nautimobile
Put down that sad Baloney sandwich you made for lunch, and meet us at Pier 13. We are making lobster rolls!	1431882336	599984123818704896	f	nautimobile
Pier 13 today! Don't forget we also have our new shop downtown at 207 Washintgon st! hoboken all day!	1431808766	599675548252659712	f	nautimobile
@AmandaBananasNJ thank you! You guys are the best	1431692352	599187272379039744	f	nautimobile
Welp it's about as nice as it could get out here at Pier 13. Shout out to all the moms out there, we love you http://t.co/lek5FM7zuU	1431282893	597469876719112192	f	nautimobile
Nauti will be at Pier 13 in Hoboken every weekend! As for weekday spots in NJ, we are working on those! Updates soon!	1431025495	596390271480438784	f	nautimobile
@AZ88sundevil mid May! Official announcement coming soon!	1430836675	595598303422713856	f	nautimobile
We are hiring in NJ for our truck and Hoboken store location! http://t.co/x0L2ZaBhjC	1430758709	595271289176227841	f	nautimobile
So scenic, so tasty. @pier_13hoboken all day. https://t.co/ORSS8BZgnl	1430676865	594928009297158144	f	nautimobile
Pier 13 classic lineup today. Check it... @Aroy_D @PVPIZZATRUCK @AmandaBananasNJ @TFQfoodtruck @waffledelys	1430666175	594883172611059713	f	nautimobile
It's our first day back at @pier_13hoboken for the season. Teammate Morton is soakin' it all in.... https://t.co/ZgIomk7xqL	1430588515	594557442417131521	f	nautimobile
We're ready to get spicy with some @HAHTSAHS on our BBQ from @OINKandMOObbq. Life is good on @Pier_13Hoboken 	1430587449	594552973734346753	f	nautimobile
Fans of beer, food and summertime, follow @Pier_13Hoboken . Today starts the first weekend of the season. 	1430578641	594516027293196290	f	nautimobile
It's the most wonderful time of year. Pier 13 opening day with a championship lineup. We got @AmandaBananasNJ @OINKandMOObbq .. Can't wait	1430570158	594480449126322176	f	nautimobile
Kasar truck is at 2nd avenue and 44th street until 7pm, and at 7th avenue and Christopher street until 4am	1432918263	604329114879696896	f	chipsykingny
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
@LetsFeedMe check out our Neapolitan style pizza at urban space garment district on 38&broadway  http://t.co/5EEc4RefDn	1432905115	604273968871297024	f	pontirossifood
@UrbanSpaceNYC pizzaforbreakfast pizzaforlunch neapolitanpizza margherita pizza buffAlomozz http://t.co/cDPZG2CJKZ	1432069117	600767539631763456	f	pontirossifood
Today's special Panuozzo with homemade Burrata cheese, prosciutto Di Parma,baby arugula, shaved Parmesan and truffle oil ! Come taste it 	1431358816	597788321897648128	f	pontirossifood
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
Yummmm! Grilled cheese with bacon this Friday is just what you need to start your weekend.... https://t.co/880ribZioF	1432927992	604369921246695424	f	usafoodtruck
Dude who plays Aladdin on Broadway is a regular and tells us we have the best chicken in nyc.  Come discover NYC's diamond in the rough.nyc	1432919388	604333834427998209	f	usafoodtruck
Fried Day! Come and get the best food in the city at 39th and Broadway at urbanspace or swing by the Intrepid for your base. gorangers	1432917729	604326873292771328	f	usafoodtruck
We've heard your cries, people. Here's our National Burger Day contribution! Get it anyway you want... https://t.co/gXDCyUA09L	1432853991	604059540431228928	f	usafoodtruck
@dhmeyer hey let's talk about launching the next great nyc restaurant chain. Yankee Doodle Dandy's.	1432844328	604019010322198528	f	usafoodtruck
Hope everyone had a good Memorial Day Weekend! We're back and better than ever with our chicken... https://t.co/yyp529YxaQ	1432742041	603589984998789121	f	usafoodtruck
RT @TheNYRA: 11 days to the BelmontStakes? That number sounds familiar! RT the legends & follow us to win @BelmontStakes goodies! http://t...	1432687994	603363297983897600	f	usafoodtruck
@ablogslife1205 thanks for the kind words! We do our best.	1432686943	603358886305931264	f	usafoodtruck
RT @ablogslife1205: @USAFoodTruck best chicken in NYC if you ask me!	1432664700	603265595719704576	f	usafoodtruck
RT @RichImports: Every time I eat @USAFoodTruck, it's like the first time I ate it. greatfood ReadyForANap	1432576787	602896861830189056	f	usafoodtruck
Thank you will never be enough, but we will always, always remember. https://t.co/274h4F5O9d	1432573654	602883719209295872	f	usafoodtruck
Happy Memorial Day! Come celebrate Murica with YDD's at the USS Intrepid at 46th and 12th Ave or our Urbanspace market at 39th and Broadway	1432571167	602873289288069121	f	usafoodtruck
Don't like our homemade potato salad? How?!? But anyway...were trying to give you the option of fresh watermelon sub http://t.co/clRdq3R0kp	1432479974	602490798987411457	f	usafoodtruck
RT @RichImports: Just had the best chicken club sandwich from @USAFoodTruck. Those guys are gonna blow up for real. GreatFood GreatOwners	1432479905	602490506686373888	f	usafoodtruck
Happy Sunday! We're continuing MDW and FleetWeek today at intrepidmuseum and urbanspacenyc! Come... https://t.co/2p9jjbq90I	1432475223	602470871509381120	f	usafoodtruck
Happy Memorial Day Weekend everyone! We have the perfect MDW food for all of you here at the... https://t.co/GRZSCbgYp1	1432394326	602131565070651392	f	usafoodtruck
Who's ready for memorialdayweekend? We got all your American foods right here, even down to the... https://t.co/rpxFKQqaA3	1432324792	601839918822854656	f	usafoodtruck
@ericgrant I'm serious. Message me on Twitter when you're showing up next. I'll be there and make it myself.	1432322522	601830394477060097	f	usafoodtruck
@ericgrant got ya. Well, give it another try when I'm there. Place and time and guarantee ya it will surpass your expectations.	1432314330	601796036068253697	f	usafoodtruck
@ericgrant time out. Where did you get your food from and when?	1432313730	601793520442171392	f	usafoodtruck
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
Yep it's that time again! Phil's Phriday on 51st (yes, Phifty Phirst) and Park. Make it happen 11-230!	1432908372	604287628838604802	f	philssteaks
We're hanging out on Broadway btw 67/68, slanging steaks until 8	1432846700	604028956673712128	f	philssteaks
TBT to that time we won a Vendy.... Come get an award winning cheesesteak today on 52nd & 6th from 11-3. jawn http://t.co/YjcusxkVWV	1432823021	603929639363436544	f	philssteaks
52nd n 6th 11-3. Phil's Jawn has got it going on. If you don't know you betta...\nGet your Phil today!	1432822776	603928613700919296	f	philssteaks
Whiz Wednesday is here! The Jawn is ready at 41st between 6th and Broadway for all your Whiz desires. 11-3	1432738219	603573954456981504	f	philssteaks
Second shift on Broadway between 67/68 open at 4, come get it! afternoondelight cheesesteaks jawn	1432670223	603288758843265025	f	philssteaks
Hope you had a wonderful holiday weekend! The Jawn is here to take the edge off the return to reality. 55/Broadway 11:30-3. @randomfoodtruck	1432649346	603201193465290752	f	philssteaks
TBT 2012 OG Jawn. classic OG original jawn  We're on 52nd between 6/7 today 11-3 https://t.co/sYDiQBno7j	1432216994	601387778316869632	f	philssteaks
Second shift at Broadway between 67/68 in front of the Apple Store til about 8.	1432152857	601118768962625536	f	philssteaks
It's Whiz Wednesday! Celebrate Kraft's best invention ever with a Whiz Wit' from the jawn! 41st... https://t.co/tLXmE8SlwP	1432128110	601014971191930881	f	philssteaks
Trying a new second shift location today. Broadway between 67/68 in front of the Apple Store until 7ish. Come thru!	1432064096	600746478836031488	f	philssteaks
55th and Broadway today 11-3. @randomfoodtruck	1432044180	600662943701803008	f	philssteaks
47th between Park and Lex today 11-2	1431957646	600299996932677632	f	philssteaks
RT @Soulspazm: RIP B.B. King.  The Thrill Is Gone.  https://t.co/oeXu3vF7jr BBKing BBKingRIP http://t.co/2iRLrUAaL2	1431708204	599253757365526529	f	philssteaks
Phil's Phriday in effect at 51st n Park 11-2!	1431700979	599223456509624320	f	philssteaks
TBT The Legendary peterock stops by the jawn. Rocking classic Pete tracks 2day. 52nd n 6th 11-2 come... https://t.co/t2J3jvW1V2	1431612822	598853696726966272	f	philssteaks
Whiz Wednesday is in effect at 41st between 6th and Broadway 11-2. See you there!	1431528016	598497994657366016	f	philssteaks
@vickilopresti you're welcome Vicki! Glad you and Judy loved them!	1431465284	598234880535883776	f	philssteaks
RT @vickilopresti: thanks again Kevin for the most delicious Philly cheesesteak sandwich I've ever had !! @PhilsSteaks	1431465205	598234548216954880	f	philssteaks
RT @vickilopresti: I have absolutely no self control when it comes to food .. ESPECIALLY Philly cheesesteaks. @PhilsSteaks	1431465199	598234522262593536	f	philssteaks
LGR	1432948482	604455860581068800	f	morristruck
Hey hungry people- come check us out @BillyIdol tonight @ Pier 97! You might like us so much we'll be catering your White Wedding.	1432913385	604308653026451456	f	morristruck
Another beautiful day to PraiseCheeses, @DowntownBklyn Metrotech on Bridge St, and tonight @BRICartsmedia @BklynBrdgPark DanceParty!	1432825341	603939373130866688	f	morristruck
Catching some sun on the last day @MonmouthPark praisecheeses MemorialDay	1432563952	602843028353519616	f	morristruck
Another beautiful day @MonmouthPark and we're ready to serve ya in Crown Heights! MemorialDayWeekend	1432480254	602491971849039872	f	morristruck
Happy MemorialDayWeekend ! Get your grilled cheese fixes @MonmouthPark all wkend and our shop in Crown Heights. Can't wait to feed ya!	1432393370	602127552875012096	f	morristruck
Don't let the grey get ya down come lunch with us at metrotech @DowntownBklyn and then put your party pants on for @BRICartsmedia dancing!	1432220834	601403883391430656	f	morristruck
Happy Wednesday! We're off the streets today gearing up for a Thursday of lunch  metrotech @DowntownBklyn and dancing with @BRICartsmedia	1432133121	601035990480859137	f	morristruck
The sun is out and so are we! Back at the East Woods spring fair in oyster bay and ready to brunch with ya in Crown Heights! 	1431875088	599953722278584320	f	morristruck
Happy Saturday! Check us out at our shop in Crown Heights or the East Woods Spring fair in oyster bay today and tmr! praisecheeses	1431795148	599618429411274752	f	morristruck
ThreeXthecheese today! @DowntownBklyn @ Bridge St 1130-3, AirbnbBKHalf & @BRICartsmedia Dance Party tonight @BklynBrdgPark! PraiseCheeses	1431615994	598867002346713088	f	morristruck
Tonight! AirbnbBKHalf at Pier 1! We're there 4-9p till Friday, & tomorrow night @BRICartsmedia 1st DanceParty of the year! PraiseCheeses	1431553134	598603350213537792	f	morristruck
Not on the streets today, but lots of love @BklynBrdgPark- AirbnbBKHalf W-F & @BRICartsmedia party Thurs! http://t.co/XvYCJZgXFv for more!	1431359036	597789243423993856	f	morristruck
After all the sandwiches moms made you, isn't it time to return the favor (and buy her one)? Sandwich shop 10-6, truck @NYBG 11-6!	1431272202	597425033267585026	f	morristruck
Loving on @BuzzFeed for including us in their roundup of the top street foods that will change your life. EATMOR http://t.co/uvvlrBDwoh	1431222141	597215064442204160	f	morristruck
Happy weekend! You can find the truck @NYBG all weekend for the MothersDayGardenParty, & the shop is open 10-6 for your brunching pleasure!	1431181732	597045576098848769	f	morristruck
Metrotech GrilledCheese Thursdays!\n\nLawrence st, on the Commons, 1130-3! Come and EAT!	1431011532	596331705323118592	f	morristruck
KimchiFalafel on deck at 53rd & Park and 39th & Broadway! http://t.co/txRrmpB8iW	1432218176	601392739066994688	f	domotaco
Good morning, CrownHeights- shop will be closed, temporarily, for weekdays in May. As always, check our website for truck locations.	1430743387	595207023115038721	f	morristruck
Whatever you're doing this weekend, plan on making sandwiches a part of it. SandwichShops open all weekend long!	1430503435	594200590735007746	f	morristruck
RT @ElizabethReede: @BlumenfeldEmily @sjgstone @morristruck best grilled cheese in NYC	1430423217	593864132375511040	f	morristruck
!!! Fri, May 29th no truck spots today! Our shop      open 9am-6pm! 521 Court st brooklyn	1432912884	604306553542426624	f	thetreatstruck
!!! 3:45-7pm Bway (86th& 87th) !!!	1432842510	604011385606017024	f	thetreatstruck
!!! 12-2:30pm 45th st & 6th ave! Then 3:45ish-7pm Bway (86th & 87th)!!!	1432828485	603952557459902464	f	thetreatstruck
!!! Wed May 27th private party today! Summer time parties have begun! We'll do best to come to our regular spots thurs/fri!	1432740105	603581867481239552	f	thetreatstruck
!!! Tues,May 26th no truck today! Our shop open 12pm-6pm! 521 Court st brooklyn	1432652854	603215910455902208	f	thetreatstruck
!!! Fri, May 22nd our truck is closed for the holiday weekend! Our shop is open today 9am-6pm! 521 Court st Brooklyn	1432293690	601709467659534337	f	thetreatstruck
!!! Our truck is taking this week & weekend off! Have a great week & Memorial Day weekend!!!	1432132864	601034912955768832	f	thetreatstruck
!!! Truck spot on Wed!!!	1432049406	600684866041159680	f	thetreatstruck
!!! Sun, May 17th our shop open 9am-6pm today! 521 Court st. Brooklyn	1431870587	599934843015831553	f	thetreatstruck
!!! Sat, May 16th Our shop open Sat & Sun 9am-6pm!!! 521 Court St brooklyn	1431774949	599533707842715648	f	thetreatstruck
!!! 4:30-7pm 18th st & 7th ave !!!	1431721785	599310721411883008	f	thetreatstruck
!!!stayed a little longer at 45th! On our way to 18th st & 7th ave! We'll let you know when we get there!!!	1431720047	599303431505973251	f	thetreatstruck
@Chalay721 we're back!! Thanks for asking! 45th & 6th ave 12-3:30 today!!!	1431706324	599245872774385667	f	thetreatstruck
!!! Fri, May 15th 12-3:30 45th st & 6th ave!! Then we head to 18th st & 7th ave! We'll let you know those hours later!!!	1431704196	599236949564612609	f	thetreatstruck
!!! Thurs, May 14th 3:30-7pm Bway (86th & 87th st)!!!	1431632243	598935156624330752	f	thetreatstruck
@Chalay721 we ended up having a private event today, too!  Sorry! Hope to be back soon!	1431538468	598541834340671488	f	thetreatstruck
!!! Wed,May 13th private gig today! Sorry, 45thers!! We'll be back soon! Have a great day!!!	1431531993	598514676767563776	f	thetreatstruck
@Chalay721 we had a private event today. Tomorrow we will head to 45th &6th ave and 18th st & 7th ave!!	1431448739	598165483511222272	f	thetreatstruck
@MetroPictures NinaBeier breakfast viewing from 10am - noon thetreatstruck  http://t.co/Bw3j7zqnFN\n\nhttp://t.co/PAxMx2O5S0	1431441520	598135207468912640	f	thetreatstruck
!!! Mon, May 11th no truck today! Have a great day & see you soon!!!	1431348174	597743684441001984	f	thetreatstruck
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
Last day on Front & Jay! We'll miss you Dumbo. Have a great winter! Serving the usual + Split Pea Soup through lunch. @DUMBOFoodTrucks	1417009699	537603759468457984	f	thesteelcart
Last day on 56th & Broadway! Soups are Split Pea & Rustic Chicken.	1416928831	537264575562149888	f	thesteelcart
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
@starrettlehigh  come on down We are ready !!!! http://t.co/7omYjzU5Gy	1432915482	604317450570743809	f	valduccis
@starrettlehigh  We are outside Come down for a free Zeppoli  and some Pizza too @MarthaStewart @TommyHilfiger http://t.co/YynyUSxbO1	1432908925	604289948427128832	f	valduccis
@starrettlehigh  Valduccis Pizza Truck is serving lunch outside the Your building Today !!!  Paninni and salad Too !! http://t.co/vsxrqhBLW7	1432898071	604244422251954177	f	valduccis
http://t.co/qQPgqTx2Iy http://t.co/qwSGKIr6l3	1432843584	604015888719843329	f	valduccis
RT @RepCharlesNJ: SHOUTOUT to the folks tossing the dough @Valduccis	1432843535	604015681454088192	f	valduccis
Catering Baby !!!! http://t.co/qQPgqTx2Iy @greenboxny @FoodNetwork @FoodPorn http://t.co/WKZeL5jZmq	1432831276	603964264647385088	f	valduccis
Miss Liberty in this mornings Fog !!!! http://t.co/1rXjRCSgW8	1432831207	603963974720352256	f	valduccis
Baked potato wedges http://t.co/kbk8Pb4TrY @greenboxny @FoodtoEat @foodNfest @FoodPorn @gofooda @FoodNetwork http://t.co/tIAMH7BQYo	1432831071	603963406140481536	f	valduccis
Catering is our specialty http://t.co/QonTGksajn http://t.co/A4x3VeFpad	1432760225	603666255351050241	f	valduccis
Delivery available @greenboxny @FoodtoEat @foodNfest @FoodPornGuru @MobileFoodInfo @FoodNetwork http://t.co/PxPpGxIIBR	1432750031	603623500667031552	f	valduccis
Catering Baby !!! http://t.co/UyDMpNasMm	1432664569	603265045867438082	f	valduccis
RT @BKLYNDESIGNS: We're excited for today's foodtruck vendors, organized by @FoodtoEat : Lebanese by @ToumNYC & pizza by @Valduccis http:/...	1432664446	603264528349036545	f	valduccis
Get a personal Pie 8$ and a free Zeppoli @greenboxny @FoodtoEat @foodNfest  call FoodtoEat for pickup !!!!!!!!!!! http://t.co/FnknB4KKDB	1432651427	603209922675867649	f	valduccis
RT @nycfoodtruck: NYC Food Truck Obsessions found at VillageVoice Choice Streets: http://t.co/mDx0rIt6q1 w/ @GCNYC1 @TheTreatsTruck @valdu...	1432651263	603209237616041984	f	valduccis
Free Zeppoli 51 n Park @FoodPorn @FoodtoEat @foodNfest @greenboxny @Foodtruckstars_ @SocialManhattan @cheechandchong http://t.co/qrNNgfxcfu	1432651216	603209038491361283	f	valduccis
The Sauce. !!! @FoodPorn @greenboxny @FoodtoEat @foodNfest @Foodtruckgirl7 @Foodtruckstars_ @UpuauatAlpha @MobileFood http://t.co/k4cpX851pV	1432486729	602519128650457088	f	valduccis
RT @nycfoodtruck: NYC Food Truck Obsessions found at VillageVoice Choice Streets: http://t.co/wStjy0qSs0 w/ @GCNYC1 @TheTreatsTruck @valdu...	1432345430	601926477156884481	f	valduccis
Best pizza !! 50st 6ave @greenboxny @Foodtruckstars_ @foodNfest @FoodtoEat @FoodPorn @UpuauatAlpha @FoodNetwork http://t.co/jsqiXroWjq	1432301524	601742324402651136	f	valduccis
50th St.at 6 ave @FoodStartupsPod @cheepeats@FoodPorn@foodtoeat http://t.co/rmfMkAiEcu	1432300986	601740066784997376	f	valduccis
http://t.co/qQPgqTODA6 http://t.co/ODXQVlmOud	1432232479	601452726413701120	f	valduccis
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
Happy Friday! Catch the truck on Water & Old Slip or our booth on 39th & Broadway!	1432909853	604293839822528512	f	domotaco
Get your fill of tacos before the rain! 53rd & Park for the truck or 39th & Broadway for the booth!	1432820152	603917608862130177	f	domotaco
Catch us in the @dumbolot on jay & water today, or our booth on 39th & Broadway!	1432736467	603566608334790656	f	domotaco
Here to help the transition back to the work week! Truck on Hudson & King and booth on 39th & Broadway!	1432649254	603200808776146945	f	domotaco
Fish Fryday! Old Slip and water till 2:30! You can also find us on 39th and Broadway till 9pm. asiantaqueria urbanspace	1432304007	601752737424932864	f	domotaco
Catch us on Jay & Water in the @dumbolot, or our booth on 39th & Broadway!	1432131274	601028244683431936	f	domotaco
Catch the truck on Hudson & King, or our UrbanSpaceGarment booth on 39th & Broadway!	1432044615	600664770757308416	f	domotaco
We're here to brighten up your Monday on 52nd & 6th! Also be sure to check out our booth on 39th & Broadway!	1431959013	600305729287815168	f	domotaco
Fresh off the press catering nolines http://t.co/3vyFhKihGW	1431702544	599230021060993024	f	domotaco
Happy Friday from FiDi! Catch the truck on Old Slip & Water or our booth on 39th & Broadway!	1431698557	599213295745126403	f	domotaco
It's Thursday which means you find the truck on 53rd & Park! Also check out our Garment District booth on 39th & Broadway!	1431614015	598858703559892992	f	domotaco
Catch us out on the @dumbolot on jay & water, or our booth on 39th & Broadway!	1431527779	598497001517535232	f	domotaco
RT @crimsong19: Oh, @DomoTaco, you're my starving lunchtime savior! urbanspacegarment http://t.co/dfqSeBHh4Y http://t.co/mwfQYGGjn6	1431488458	598332076807606272	f	domotaco
RT @StunningRyan: Tried @DomoTaco for lunch at @UrbanSpaceNYC. Excellent tacos.	1431488418	598331909282910208	f	domotaco
RT @thirstyreveler: Grabbed a burrito from @domotaco at the great @urbandspacenyc spot on Bway today. Great stuff! http://t.co/AvVq0LyFub	1431488408	598331866224136193	f	domotaco
SoHo today on Hudson & King, or catch our Garment District booth on 39th & Broadway!	1431439331	598126024556183552	f	domotaco
Happy Monday! Catch the truck out on 52nd & 6th or our @UrbanSpaceNYC booth on 39th & Broadway today	1431353644	597766628353417216	f	domotaco
52nd and 6 for lunch or catch our booth on 39th and broadway asiantaqueria urbanspacegarment	1431350789	597754652751302657	f	domotaco
http://t.co/PXYe72Pj4L Catch us over the... http://t.co/DN6gzUJ7eS	1431211430	597170139251879938	f	domotaco
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
Lunch is being served today on varick and king!	1432913005	604307062517043200	f	eddiespizzany
Happy Friday everyone! We are parked on Varick & King street. Stop by and see us. Start your weekend off right by... http://t.co/KRqY07RGXG	1432904069	604269578944958464	f	eddiespizzany
@kristinahsays 46th and 6th. We will be at 10 Hanover square for lunch tomorow	1432761765	603672713006317568	f	eddiespizzany
Happy Tuesday everyone. We hope you all had a wonderful holiday. Today we are parked on E.47street between... http://t.co/3n0gLHc1sE	1432652131	603212877974102016	f	eddiespizzany
Its Friday come see us on Varick and King street	1432312747	601789398154379264	f	eddiespizzany
Lunch until 2pm on varick and king	1432308880	601773175676997632	f	eddiespizzany
Lunch is being served until 3pm downtown on Hanover and water street. Call ahead your order to 9174397522 http://t.co/KIRk3xAXer	1432221939	601408518831374336	f	eddiespizzany
It's hump day people and what better way to enjoy this day than by having hot fresh pizza or one of our delicious... http://t.co/QCxcfD7DHO	1432134567	601042055427694593	f	eddiespizzany
Catch us for lunch today on 46th and 6th until 3pm.	1432123295	600994779338559488	f	eddiespizzany
Stop by Eddie's pizza truck and have some lunch. We are parked on the corner of 10 Hanover sq. Have a pleasant day	1431618623	598878028383526913	f	eddiespizzany
Stop by Eddie's pizza truck today and treat yourself to a fresh hot pizza or sandwich. We are parked on W.46st&6th ave. Have a great day.	1431528910	598501745430495232	f	eddiespizzany
No lunch today due to maintenance. See you all tomorrow	1431430980	598090997885706240	f	eddiespizzany
Happy Monday everyone! Stop by Eddie's pizza truck and have yourself a hot, fresh pizza or sandwich. We are... http://t.co/rKdaVtpcQg	1431355266	597773428863737856	f	eddiespizzany
RT @TakumiTacoNY: Come visit us today at smorgasburg takumitaco tagyourtaco smorgasburg @ Brooklyn Bridge Park (Pier 5) https://t.co/blI...	1431274712	597435561658417153	f	eddiespizzany
Go check out our friends @TakumiTacoNY who are opening may 1-28 at madison square eats on 25th and Broadway! http://t.co/zqxyOhpySF	1430436907	593921552632160257	f	eddiespizzany
Wishing everyone a Happy New Years. Today we will be at 97th and Columbus ave	1420223348	551082781795966977	f	elpasotruck
Its lunch time. Stop by and try our weekly special. Pizza topped with short rib, mushrooms and caramelized onions... http://t.co/BxNXFyEVxs	1430234925	593074378079895552	f	eddiespizzany
RT @smorgasburg: Hop Aboard The Bus To Smorg For Easy Passage To Williamsburg On Saturday. More here: http://t.co/dZhmrHJGFa http://t.co/WV...	1429807546	591281823658991616	f	eddiespizzany
Weekly special white pie mushroom olives garlic and roasted red peppers. Monday's at starrettlehigh... http://t.co/VxVdAQbLW3	1429548113	590193682176946177	f	eddiespizzany
Weekly special white pie mushroom olives garlic and roasted red peppers. Monday's at starrettlehigh... https://t.co/5lxtaTyi2g	1429548111	590193672618172416	f	eddiespizzany
RT @TDBank_US: @EddiesPizzaNY Thanks for joining us today! Hope everyone is having a good time! :-) ^YD	1429287967	589102550365949954	f	eddiespizzany
TAIMTUESDAY on 20th and 5th in flatiron!  It's a beautiful day for falafal!  nyceats nycfoodtruck flatiron	1432654141	603221305685647360	f	taimmobile
VANDAM & VARICK TODAY IN HUDSONSQUARE!  FALAFELDAYISEVERDAY nycfoodtruck nyceats delicious falafel	1432221793	601407905829650432	f	taimmobile
foodtruck is on 20th and 5th today!  humpday by taimfalafel! nyceats nycfoodtruck falafel smoothies	1432135860	601047480445317120	f	taimmobile
RT @GraceKendallLit: There should be a dating app for people waiting in line @TaimMobile. We all have at least one major lifestyle priority...	1432063346	600743334949314560	f	taimmobile
20th and 5th for taimtuesdays in flatiron!  falafel smoothies foodtruck nyceats vegan	1432052778	600699006013075457	f	taimmobile
Got a case of the Mondays?  Come visit our truck on water and broad in fidi today.  nycfoodtruck falafel harissa nyceats	1431962908	600322065422495744	f	taimmobile
What's better than falafel and smoothies in the park? Truck is at prospectparkfoodtruckrally today! @prospect_park GrandArmyPlaza	1431876631	599960194752323584	f	taimmobile
Hi falafel fans!  We're on vandam and varick today in hudsonsquare!  nycfoodtruck	1431616770	598870258024321024	f	taimmobile
Today is nationalhummusday & we are so excited!  Come celebrate with @TaimMobile on 20th & 5th! hummus falafel nycfoodtruck flatiron	1431531211	598511395433488387	f	taimmobile
20th and 5th we're here for you!  Get your harissa on with a sandwich or platter!  taimfalafel flatiron nycfoodtruck	1431445733	598152875869614081	f	taimmobile
@brown_organics Yes we are!	1431445625	598152423815913472	f	taimmobile
FiDi We're back!! See you on water and broad!  itsfalafeltime	1431356989	597780657864073218	f	taimmobile
taimmobile is off for the weekend!   Enjoy the beautiful weather and HappyMothersDay!	1431122024	596795143665098752	f	taimmobile
Craving a greenfalafel sandwich?  Come visit us on Vandam and Varick in HudsonSquare! nycfoodtruck taimfalafel	1431013102	596338292003569664	f	taimmobile
falafel helps you get over the hump! In flatiron today on 20th and 5th! happyhumpday nycfoodtruck happyhumpday	1430926454	595974863547977728	f	taimmobile
20th and 5th in flatiron today!  falafel nycfoodtruck	1430840507	595614375391711232	f	taimmobile
No parking today downtown.  Come visit us on 20th and 5th in flatiron!  It's almost 80 degrees and we have datelimebananasmoothies.	1430754399	595253210710986752	f	taimmobile
Perfect day for a picnic in the parc! Stop by Prospect Parc's Food Truck Rally and get your greenfalafel and datelimebanana smoothie!	1430663605	594872394398961664	f	taimmobile
BALLING in hudsonsquare today. falafelballing that is!  Come visit us on the corner of Varick and Vandam! hudsonsquare nycfoodtruck	1430408491	593802366970892288	f	taimmobile
Reasons to eat @TaimMobile on 20th & 5th in flatiron... 1. Its humpday 2. the weather in nyc is perfect and we have smoothies	1430322729	593442658183487488	f	taimmobile
A big thank you to our 20,2K followers who follow us daily and welcome to the new ones ! Tell us a little more about you :) followers	1432907954	604285873581084672	f	sweeterynyc
A big thank you to our 3700 fans who follow us daily and welcome to the new ones, thank you for joining the page... http://t.co/NtnGGiZXL5	1432907714	604284868055437312	f	sweeterynyc
RT @FoodTruckPages: The Food Truck Daily is out! http://t.co/Utid8jOmoq Stories via @TheCupcakeBrake @klpsmedia @SweeteryNYC	1432905759	604276667364827136	f	sweeterynyc
Serving at Hudson/King St 375 Hudson Street New York From 7:30AM-3:00PM EDT http://t.co/aR2bxNYVPT	1432899308	604249610941521920	f	sweeterynyc
My favorite flavor cupcake is ... cupcakes flavor SweeteryNYC Quiz choice sweets http://t.co/2PqjmJy5u5	1432825170	603938653954519041	f	sweeterynyc
Serving at Hudson/King St 375 Hudson Street New York From 7:30AM-3:00PM EDT http://t.co/aR2bxNYVPT	1432812910	603887231594569728	f	sweeterynyc
Today SweeteryNYC needs your help ! We would like to know what YOU think because we are nothing without you, our... http://t.co/94xqItl6xM	1432744578	603600625411186691	f	sweeterynyc
RT @FoodTruckPages: The Food Truck Daily is out! http://t.co/QvYFH5bpb3 Stories via @SweeteryNYC @leocantalista @Joanevr	1432736465	603566597932982274	f	sweeterynyc
Serving at Hudson/King St 375 Hudson Street New York From 7:30AM-3:00PM EDT http://t.co/aR2bxNYVPT	1432726508	603524836229545985	f	sweeterynyc
Serving at Hudson/King St 375 Hudson Street New York From 7:30AM-3:00PM EDT http://t.co/aR2bxNYVPT	1432640107	603162444639395840	f	sweeterynyc
Sweetery solutes the men & woman & families who have sacrificed so much to keep our country safe & for us to enjoy the freedoms that we do.	1432569147	602864815502139392	f	sweeterynyc
Serving at Hudson/King St 375 Hudson Street New York From 7:30AM-3:00PM EDT http://t.co/aR2bxNYVPT	1432553708	602800062213795840	f	sweeterynyc
RT @laurenentransit: @SweeteryNYC macarellas !!!	1432319649	601818347139923968	f	sweeterynyc
What is your favorite sweet from our food truck ? Croissant ? Muffin ? Whoopie Pie ? Ice Cream Sandwich ? Too... http://t.co/koObqBev8h	1432306001	601761100221325313	f	sweeterynyc
Serving at Hudson/King St 375 Hudson Street New York From 7:30AM-3:00PM EDT http://t.co/aR2bxNYVPT	1432294508	601712896154988544	f	sweeterynyc
SweeteryNYC supports RedNoseDay ! http://t.co/ELanlp0QRb	1432217899	601391576749867008	f	sweeterynyc
Don't forget, it's RedNoseDay today, a campaign dedicated to raising money for children and young people living... http://t.co/44tvmaFAex	1432217193	601388614841462784	f	sweeterynyc
Serving at Hudson/King St 375 Hudson Street New York From 7:30AM-3:00PM EDT http://t.co/aR2bxNYVPT	1432208114	601350533404880896	f	sweeterynyc
I posted 71 photos on Facebook in the album Food Network Magazine's Travel Truck http://t.co/qbHMt8KdhZ	1432135635	601046535086931969	f	sweeterynyc
FoodTruck - Catering - Events DescribeYourselfIn3Words SweeteryNYC foodtruck catering	1432131318	601028429149011968	f	sweeterynyc
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
Mamak on Yelp: Curry Laksa ( Malaysian Ramen ) http://t.co/xKUOieQCHI	1417590010	540037759843319808	f	lovemamak
@jerewumuwegab we are at 174 2nd ave 10003	1417587804	540028510547755009	f	lovemamak
http://t.co/rTeRgAxvsB	1432947037	604449800990253056	f	shukanyc
@ShukaNYC: SUNDAY !! SUNDAY !! SUNDAY !! After a week of technical problems the Shuka Truck will be back on Sunday ! @IAC_NYC @Gov_Island	1432906155	604278328611184641	f	shukanyc
SUNDAY !! SUNDAY !! SUNDAY !! After a week of technical problems the Shuka Truck will be back on Sunday !... http://t.co/cRNOPlB3YL	1432905818	604276918347669504	f	shukanyc
The Shuka Truck Will not be parked today on 47st ! Continuing technical problems!	1432737936	603572767364001792	f	shukanyc
@DavidLeshaw yes ! Go Kosher - challav Israel!	1432730547	603541775266017283	f	shukanyc
Repost @natgeo with @thephotosociety  New York City rises like the land of Oz behind the newly landscaped... http://t.co/mBZaHPnezQ	1432656786	603232401536512000	f	shukanyc
Repost natgeo with @alvarezphoto  New York City rises like the land of Oz behind the newly... https://t.co/6k5W9rQTb9	1432656577	603231525614788608	f	shukanyc
Starting NEXT Sunday - GOVERNORS ISLAND ! Don't miss your Kosher SHAKSHUKA! Happy Holiday!	1432570145	602869001702776832	f	shukanyc
Starting NEXT Sunday - GOVERNORS ISLAND ! Don't miss your Kosher SHAKSHUKA! Happy Holiday! @... https://t.co/Hz2d9HigbH	1432570058	602868636546703360	f	shukanyc
Unfortunately the Shuka Truck will not be parked today on 46th st & 6th Av because of technical problems , have a Eggcellent weekend!	1432296478	601721157348421633	f	shukanyc
This Is SHAKSHKA- Shakahuka is an Israeli dish of eggs poached in tomato sauce that spiced with Harisa, Bell... http://t.co/j9W5Ki7y4Z	1432217529	601390022324035584	f	shukanyc
This Is SHAKSHKA- Shakahuka is an Israeli dish of eggs poached in tomato sauce that spiced with... https://t.co/FAGPTlATF2	1432217300	601389062075850752	f	shukanyc
http://t.co/DrFcyb9jef	1432170687	601193553738399744	f	shukanyc
Amazing day to have lunch at your Favorite FOOD TRUCK ! Today @ 46th St & 6th Av - between 5th & 6th !! Have a... http://t.co/cgkMZYASj6	1432134821	601043121301037056	f	shukanyc
Amazing day to have lunch at your Favorite FOOD TRUCK ! Today @ 46th St & 6th Av - between 5th & 6th... https://t.co/0CUBOkdSrH	1432134726	601042722888261632	f	shukanyc
No More WAITING!! Order & pick up with the new SHUKA app !! Tuesday is FIDI - Hanover Sq - 11:30-3:00 http://t.co/IpEE2NsbLw	1432049206	600684026924560384	f	shukanyc
No More WAITING!! Order & pick up with the new SHUKA app !! Tuesday is FIDI - Hanover Sq -... https://t.co/vByusggbiR	1432049140	600683746736644097	f	shukanyc
@Tweat_It we Would love to join your app!!	1431962805	600321634143215616	f	shukanyc
Great Day for a NEW Location ! Monday is @ABCnetwork ! Have a great day ! See you tomorrow FIDI- Hanover Sq ! http://t.co/89KzlWUWAD	1431952730	600279376228417537	f	shukanyc
Great Day for a NEW Location ! Monday is @ABCnetwork ! Have a great day ! See you tomorrow FIDI-... https://t.co/H7bzvdQwVT	1431952631	600278959402651648	f	shukanyc
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
RT @riverroadbooks: @VeganLunchTruck is coming to @riverroadbooks to sign copies of Street Vegan!  We heard a rumor of free donuts with boo...	1432914561	604313586257805313	f	veganlunchtruck
Seriously perfect truffled potato pierogis with horseradish mustard cream from our new cookbook Street Vegan.... http://t.co/QSkhE3Tuec	1432815227	603896950166056960	f	veganlunchtruck
Graduation cake we made for someone special heading to an aerospace company! http://t.co/aXkEaFFS3h	1432767450	603696560262815744	f	veganlunchtruck
RT @diannewenz: Get The Cinnamon Snail's recipe for Cinnamon Snails & enter to win Adam Sobel's new cookbook Street Vegan too! \nhttp://t....	1432765245	603687311625322496	f	veganlunchtruck
We have part time work available for someone with line cooking skill.  \n\nEvery Sunday in red bank nj and... http://t.co/cRN3A8ogYI	1432649882	603203444548177920	f	veganlunchtruck
RT @VegSweetSimple: My review of @VeganLunchTruck cookbook: Street Vegan, with glutenfree cinnamon snail recipe! http://t.co/hMuGaBBX0Q ht...	1432503520	602589556307800066	f	veganlunchtruck
RT @live_lovin: Wait never mind I crushed them! The infamous cinnamon snails from @VeganLunchTruck - hollaaaaa!  http://t.co/NnnCeYZt2s	1432503439	602589217588441088	f	veganlunchtruck
We are sold out of everything but burgers!\n\nWe will close at 2:00. \nSorry for any inconvenience. \n\nWe will bring much more food next week 	1432487388	602521896077422592	f	veganlunchtruck
RT @savannahahaha18: I don't need a man I have vegan donuts  @VeganLunchTruck cinnamonsnail http://t.co/8h3WB2w2fE	1432479007	602486742915112960	f	veganlunchtruck
Parked at the Red Bank NJ farmers market 9:00-3:00 at the galleria parking lot (corner of west front st &... http://t.co/urI5C3xjxv	1432471731	602456224542683138	f	veganlunchtruck
RT @live_lovin: The BEST vegan cookbooks:  @VeganLunchTruck @rawsomevegan @ohsheglows @KeepinItKind @IsaChandra @ChloeCoscarelli http://...	1432429649	602279720848338944	f	veganlunchtruck
Very thrilled to have our truck back at the Red Bank NJ farmers market tomorrow 9:00-3:00! (w. front/Shrewsbury ave) http://t.co/B7Cq5S7BlJ	1432418008	602230892074000384	f	veganlunchtruck
RT @nerdyorkcity: Behold the Vegan Gochujang Burger inside @VeganLunchTruck's new cookbook! http://t.co/8OsyApa98k http://t.co/d4dWhLgf1V	1432320556	601822150228627456	f	veganlunchtruck
Amped to sling veggies @TheSeedExp June 20/21st in BK!\n\nGet 50% off tix using code cinnamon\nhttps://t.co/eiV1lm7H1p http://t.co/BouGqXqgQe	1432313991	601794616120193025	f	veganlunchtruck
Who has made some yummy food from our new cook book StreetVegan? Any favorite recipes so far? http://t.co/NlpsLtJm1n	1432171979	601198970677919744	f	veganlunchtruck
This Sunday we will be back at the Red Bank NJ farmers market 9:00-3:00 & we will be there every weekend this summer! http://t.co/1wXQcw7JZX	1432056014	600712580517199873	f	veganlunchtruck
RT @nerdyorkcity: Tuck into Maple Mustard Breakfast Seitan Strips in @VeganLunchTruck's new vegan cookbook! http://t.co/8OsyApa98k http://t...	1431982904	600405933899030528	f	veganlunchtruck
Parked at the @TheSeedExp until 6:00 trucks out front w/ the yums\nI'm inside signing/selling my new book streetvegan\nhttp://t.co/kLAPWNyhd7	1431875163	599954035593105409	f	veganlunchtruck
These almond fritters on the truck today were made by basically 1,000 wild ass unicorns playing trombones into an... http://t.co/LQLN40DeOC	1431863869	599906666897879040	f	veganlunchtruck
RT @eatdrinkshrink1: The recipe for my favorite vegan sweet from the famous Cinnamon Snail up on the blog today!! Meyer... https://t.co/teL44...	1431818901	599718055023902720	f	veganlunchtruck
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
@nikifocus gladly.  We were on that road for a good 3 hrs. Could have done lunch and dinner.	1432985246	604610061441179648	f	nuchasnyc
RT @ChefDomTes: Almost that time!!! June 7th FoodNetworkStar FoodNetwork dominooch hollywoodlife chef FoodieFriday http://t.co/Fdes1H...	1432985223	604609965270151169	f	mactruckny
The lobster sauce was so sweet. http://t.co/mTmXrBqF1h	1432988108	604622065409368065	f	valduccis
!!! Email or call us to place orders & deliveries!!!	1432990799	604633351362891776	f	thetreatstruck
!!! Our shop & truck are closed this weekend! Have a great weekend & see you next week!!!	1432990716	604633005949362176	f	thetreatstruck
RT @GovIslandFood: Another beautiful day on @Gov_Island. Come grab some amazing food from @SweetChiliNYC @carlssteaks @meltbakery @USAFoodT...	1432991175	604634931067781122	f	sweetchilinyc
RT @GovIslandFood: Another beautiful day on @Gov_Island. Come grab some amazing food from @SweetChiliNYC @carlssteaks @meltbakery @USAFoodT...	1432994048	604646980627902464	f	carlssteaks
Where at the food truck extravaganza in the boogie down Bronx at Bryan Park from 12-7pm! Join us for a fun filled day with deliciousness!	1432995064	604651240845377536	f	toumnyc
It's Saturday so you know where we'll be! Williamsburg @smorgasburg at E River Park until 6:00pm! Get your sandwich with a view.	1432994416	604648525649969152	f	milktrucknyc
De CARTS 2/2:\nKotmadam @ 24th & 5th Ave til 9pm\nBierbeek @ De Great Lawn til 7pm	1432995851	604654543893229569	f	waffletruck
De CARTS 1/2:\nGoesting @ 66th & Broadway til 10pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm\nVedette @ 59th & 5th Ave (Manhattan) til 7pm	1432995839	604654493465051136	f	waffletruck
WAFEL SATISFACTION SATURDAY\nCafe @ 15 Ave B til 10pm\nWafel Cabana @ 35th & Broadway til 11pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1432995819	604654407687405568	f	waffletruck
Visit our kiosk at @TheSeaport, open EVERY DAY(!!) from 11-8 at 19 Fulton Street. We've got tator tots at this location only- try them!	1432998013	604663611923922945	f	milktrucknyc
Thanks to @GovIslandFood and  @livefastgroup we will be vending on @Gov_Island all summer http://t.co/1Zl1Inc4EI	1433000174	604672675043266560	f	mausamnyc
Thanks to @GovIslandFood and  @livefastgroup we will be vending on @Gov_Island all summer http://t.co/2uHocPSpLX	1433000034	604672086653698048	f	mausamnyc
Get you donut fix on Governor's Island today until 5pm.  It is a perfect day for a Frodo!	1432998910	604667370850922496	f	carpedonutnyc
What a great day  head over to @gov_island enjoy thenisland, weather and of course a carls famous... https://t.co/1FCTdqE5Xb	1432998786	604666851289907200	f	carlssteaks
Gonna get al mashed up today at the food truck mashup at the Meadowlands here in Jersey. Sooo many food trucks, hope you're hungry!	1433001033	604676278860562432	f	nautimobile
DUB Pies Pop-up in full effect @NYCCraftBeerFest, come check it out! http://t.co/86wAuAWgoU	1433004283	604689906695290880	f	dubpies
For one free dinges, do a bird call dinges dingesforeveryone	1433004555	604691049462657024	f	waffletruck
@CalicoAvenger all day, today	1433006485	604699144553426944	f	dubpies
@CalicoAvenger all day	1433006388	604698736271454208	f	dubpies
HELLO BRONX NY!!!\n***today Saturday May 30th\nDUE TO A PRIVATE EVENT\nWe are open for late Dinner... https://t.co/njwMO4p041	1433006019	604697189072404480	f	latinkitchennyc
Kasar truck is in Soho, spring and broadway until 8pm, and at Christopher and 7th avenue until 4am.	1433005556	604695248183255040	f	chipsykingny
RT @GovIslandFood: Another beautiful day on @Gov_Island. Come grab some amazing food from @SweetChiliNYC @carlssteaks @meltbakery @USAFoodT...	1433007434	604703122955628545	f	usafoodtruck
It's Saturday aka brunch so let loose on a DUBpies breakfast pie. Williamsburg we'll see you tonight @ N7th/Bedford http://t.co/U1skv6FIS7	1433008361	604707014988730368	f	dubpies
5 Food Festivals To Plan Your Next Vacation Around | via @TheSavory http://t.co/yF9ngaEbMv http://t.co/86dkmN3uiN	1433009120	604710198461218817	f	souvlakitruck
Guess who was the first to get a vegetarian whole wheat Hero.  David Kirsch Wellness !! For his 6 year old daughter http://t.co/SNaiOTsjJL	1433010729	604716945393496064	f	valduccis
RT @TFQfoodtruck: foodtruckmashup @TheMeadowlands with @AmandaBananasNJ @NautiMobile @cowandthecurd @Aroy_D @EmpanadaGuy1 @TheIncrediballs...	1433012856	604725867969953792	f	nautimobile
A day on The Green Radish... http://t.co/KWx8gewydF	1433017431	604745053404311552	f	thegreenradish1
@stefferonipizza che emozione 	1433020126	604756358420942848	f	pontirossifood
@stefferonipizza Siamo qui sulla 38&broadway fino Alle 7 pm  ciaooooo Stefyyy	1433019687	604754518811807744	f	pontirossifood
View from atop Nauti right now! Holy cow New Jersey loves food trucks! So much fun! Here with  some... https://t.co/tW3PqaRXIi	1433023928	604772306582446080	f	nautimobile
Guys!  We got a beautiful, bountiful burger, with a bevy of fries that'll bring tears to yo eyes!... https://t.co/Bwa24dJ8nM	1433023995	604772586845810688	f	usafoodtruck
The best team... https://t.co/Iu0AsT13t1	1433028920	604793242626981888	f	thegreenradish1
. @PieburyCorner congrats on the well deserved win.  @Arsenal class act today.	1433028331	604790775382188033	f	dubpies
RT @PieburyCorner: @MrMike1975 4-0 to The Arsenal, 4-0 to The Arsenal. We're the famous Piebury and we went to Wembley! Wembley! What a day...	1433028136	604789953462214656	f	dubpies
We don't stop in many bars to simply chill... but when we do it's usually @commonwealthbar.	1433027560	604787538826543104	f	dubpies
GOODMORNING BRONX NY! \nTODAY SUNDAY MAY 31ST ..\nWE WILL BE OPEN FOR DINNER 3PM-9PM\nMI VIEJO SAN JUAN... https://t.co/SJU7pTujg8	1433062647	604934704807223296	f	latinkitchennyc
SITUATION\ncopacabananyc \nAny QUESTIONS? https://t.co/c0i6xjeck1	1433046536	604867129926684672	f	latinkitchennyc
@iMag_yum our latest operation tonight is Bryant Park	1433035099	604819159340449792	f	waffletruck
RT @SholzTalks10s: Repost mrk814 with repostapp. - this was de bom @waffletruck \nI'd say our day is off to a... https://t.co/13UdGDdBuI	1433034907	604818353077821440	f	waffletruck
@PinupGirl_Jayne please refer to the daily locations post, all posted earlier today!	1433034840	604818075779743744	f	waffletruck
RT @CarrOlson: This was fun to do in the middle of Lincoln Center.  https://t.co/3xfOM5Y60F	1433034384	604816160031391744	f	waffletruck
@JamesJadotte we haven't forgotten LIC, in due time	1433034173	604815278384541697	f	waffletruck
Deez nuts, WALNUTS! What's your favorite dinges to put on your Wafels? GotEm dingesforeveryone	1433033463	604812299547877376	f	waffletruck
Waiting on line gets hot. Best way to cool down here at the Food Truck Frenzy? @AmandaBananasNJ I like mine w/ whipped cream & extra jimmys	1433029408	604795291255099392	f	nautimobile
Truck open at Bergen and court street.come!!!	1433071460	604971669090910208	f	carpedonutnyc
Perfect day! Thanks to @GovIslandFood and  @livefastgroup we will be vending on @Gov_Island all summer http://t.co/Ea6PQ6N110	1433079414	605005030865928192	f	mausamnyc
!!! Happy Sunday! See you next week!!!	1433079280	605004467021455360	f	thetreatstruck
Parked in red bank NJ at the farmers market (corner of west front/ Shrewsbury Ave) until 3:00\n\nS'mores donuts,... http://t.co/zu3jxKFkB7	1433079630	605005937259253762	f	veganlunchtruck
Today we're at Pier 5 @smorgasburg until 6pm and at @TheSeaport all day 'til 8pm, 19 Fulton Street. You deserve a grilled cheese.	1433082608	605018429444071424	f	milktrucknyc
De CARTS 2/2:\nKotmadam @ 24th & 5th Ave til 9pm\nBierbeek @ De Great Lawn, Central Park til 7pm	1433081608	605014234523648000	f	waffletruck
De CARTS 1/2:\nGoesting @ 66th & Broadway til 10pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm\nVedette @ 59th & 5th Ave (Manhattan) til 7pm	1433081583	605014127526989824	f	waffletruck
SUNNY DINGES SUNDAY!\nLe Cafe @ 15 Ave B til 11pm\nDe Wafel Cabana @ 35th & Broadway til 11pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 11pm	1433081571	605014079753867264	f	waffletruck
Come get your good morning, De Breakfast Special is ready DAILY 8am-11am earlydinges http://t.co/CYYSEMRGw6	1433080876	605011164985049088	f	waffletruck
Today today today !! Pier 94 + governors island (: come and taste the best shakshuka in town!!!!	1433082293	605017106413957120	f	shukanyc
happysunday weekendplans come to @Gov_Island @GovIslandFood till 5! Or @UrbanSpaceNYC @GarmentDstrctNY 12-7 it's kinda brunch 	1433084293	605025496519327745	f	sweetchilinyc
RT @arlizzard: @waffletruck http://t.co/mFjd3WJU2S	1433084357	605025764770217984	f	waffletruck
Join us for SundayFunday at Washington Square Park in the village! @WorldSciFest is going on until 6pm! shawarma vegan LebaneseEats	1433086988	605036797224218624	f	toumnyc
Chilled white asparagus soup - come to @Gov_Island  @GovIsAlliance http://t.co/bPbNfChxKp	1433086356	605034146449268736	f	snowdaytruck
RT @ajplus: Former Rikers Island inmates are getting a second chance thanks to a food truck: http://t.co/8Dk9t9Wqji	1433085964	605032502588256257	f	snowdaytruck
Keep New York RED. Watch the match at @BklynBrdgPark with us! @NewYorkRedBulls \n\nhttp://t.co/n6nN5Qw9ZI  SEAvNY http://t.co/Es0uT31hKK	1433086597	605035158488629249	f	papayakingtruck
If you're at the @IntrepidMuseum today, stop by the truck on the pier	1433086265	605033764377493507	f	papayakingtruck
Today we are celebrating Israel @pier 94 all day, come for Rita and get some schnitzi on the way order online @www.schnitzi.com	1433084422	605026037848797184	f	schnitzi1
Thanks to @ExposureNJ for a great Food Truck Masn-Up last night. so many people, so much tasty food.	1433085776	605031715673927680	f	nautimobile
Kasar truck is in Soho, broadway and spring street all day until 6pm	1433085550	605030765311574017	f	chipsykingny
Sunday Brunchday at the Shop, and getting ready for BwayBites @UrbanSpaceNYC @34thStNYC to start tomorrow! EatUrban	1433085804	605031833554796545	f	morristruck
Govenors Island!!! Come taste the BEST SHAKSHUKA in Town !! http://t.co/4mpGsP7ZwI	1433086666	605035446700265472	f	shukanyc
Govenors Island!!! Come taste the BEST SHAKSHUKA in Town !! @ Governors Island https://t.co/q41qTOaQl4	1433086466	605034608191787009	f	shukanyc
RT @JustJerseyFest: @gcnyc1 Did someone say comfort food? Plenty of that at the Just Jersey Food Truck&Music Fest 6/27 JJFTF http://t.co/U...	1433089893	605048983577350145	f	gcnyc1
Long Island City get ready for a Polish traditional dinner this week - day TBD http://t.co/HHDCt0V4L7	1433092332	605059211836452864	f	polishcuisine
The Five Best Coastal Towns of Greece, according to @GreekReporter: http://t.co/fohXZaLBAe http://t.co/DXtOH51o3V	1433095831	605073888826040320	f	souvlakitruck
Closing at 2:30 today.	1433095417	605072154233815040	f	veganlunchtruck
Hey NYC! We got your club on a bun... On a Sunday. Got the sauce on the bun and it's... '76! we can... https://t.co/nBgF0UgO90	1433098469	605084951437012994	f	usafoodtruck
I posted a new photo to Facebook http://t.co/l11iSUG9aq	1433100767	605094592862662656	f	polishcuisine
I posted a new photo to Facebook http://t.co/bxoCEvdU3u	1433100689	605094266394824705	f	polishcuisine
I posted a new photo to Facebook http://t.co/WzNV8WqsQi	1433100537	605093626679541760	f	polishcuisine
I posted a new photo to Facebook http://t.co/7rRDqqDi12	1433100436	605093204988448768	f	polishcuisine
I posted a new photo to Facebook http://t.co/1QigRTKwsI	1433100386	605092993050263552	f	polishcuisine
RT @jeaniusNYC: @CNN says Korean Food Potential Driving Force of Korean Wave @Business_Korea https://t.co/88BWahF5Z3 hallyu	1433115126	605154819406462977	f	korillabbq
RT @RaerForm: OutofOffice Post Production Meeting=Chili Cheesesteaks and Amber Ale @shortysnyc  indiefilmaking... https://t.co/o4VRc4mXOg	1433112491	605143764517199872	f	shortysnyc
Gorilla Rockin the Cheese @NikonJBT w/ @NuchasNYC @pitbull @DiRealShaggy \nComeToTheCheeseYo http://t.co/bo3iUxjYCW	1433118468	605168834417442816	f	gcnyc1
@1035KTU @NikonJBT @DiRealShaggy @pitbull ComeToTheCheeseYo http://t.co/GVa9QMIMHX	1433119254	605172132528668674	f	gcnyc1
RT @nycfattykat: Korilla killing the cheese fries game!  Must try the Kimcheez Waffle Fries with homemade kimchi,... https://t.co/hTDFSuenIJ	1433120270	605176394646228992	f	korillabbq
RT @nycfat: Can't sleep. Send tacos. \nPhoto credit: @grubshotsnyc\n\nNYCFAT @ Korilla BBQ https://t.co/dsxnIGIenP	1433120254	605176326362906625	f	korillabbq
RT @RegularGuyNYC: Tasty Korean Tacos and Tiger Balls at Korilla BBQ NYC! http://t.co/qdX7JuzAVu KorillaBBQ Korean food foodie taco Y...	1433120137	605175833586737152	f	korillabbq
RT @TheClayFox: Rawwwr! Love you @korilla. Gonna miss you guys. http://t.co/CTv2xTdV5u http://t.co/1WzxzZ5xjM	1433120086	605175621694701568	f	korillabbq
RT @FiorellaEats: Korilla At BillyJoel concert West Side Highway http://t.co/n5HvDmntLP	1433120081	605175598797979648	f	korillabbq
RT @LocalReviewNYC: Brandon R.'s Review of Korilla BBQ - New York (5/5) on Yelp: I've been here a few times now and every... http://t.co/sS...	1433120051	605175474248105984	f	korillabbq
Traffic in nyc sucks right now. wtf	1433118694	605169782594387968	f	usafoodtruck
@undoneforever lol we'll be there wednesday this week fo sure!	1433120748	605178396923031554	f	korillabbq
@alanwdang @dumbolot sorry we'll be there wednesday this week!	1433120712	605178248914472960	f	korillabbq
Heroes of Wafels (Alfredo & Danny) make sure dinges runs smoothly batmanvssuperman dingesforeveryone thankyou http://t.co/YRAnAYCmOi	1433129866	605216642956705793	f	waffletruck
See ya for lunch!	1433159949	605342817729302528	f	bigdsgrub
RT @MooreShannon: I confirm it's an amazing grilled cheese! https://t.co/PUUNxZWnLa	1433159176	605339577386180608	f	milktrucknyc
RT @HeathJosephine: Smorgasburg all stars @goodbatch @milktrucknyc @doughbrooklyn @BigMozzNYC  http://t.co/hEBUDjKVMe	1433159170	605339553252167680	f	milktrucknyc
We are serving lunch today at starrett lehigh building on 26th between 11th and 12th avenue from 11am-3pm. call... http://t.co/taVPGUrs8f	1433160568	605345417593823232	f	eddiespizzany
This is how it went down at @VeuveClicquot VCPoloClassic ClicquotStyle bigdsgrub http://t.co/pGAQIY2jLw	1433162427	605353210992295936	f	bigdsgrub
D1 is grillin' it up at Hudson/King St. http://t.co/qFIBfSyCwq	1433163881	605359310047211520	f	bigdsgrub
Come brighten your day w/ a delicious lunch! 50th Street btwn 6th and 7th Avenue. Preorders call 646-543-2443 http://t.co/1cJC2N3c3u	1433163807	605358999496716288	f	bigdsgrub
@bringdownfence loving this write up & loving our fans! So happy you enjoyed our falafel, we certainly enjoyed serving it up @MonmouthPark !	1433165237	605364999817691136	f	toumnyc
RT @bringdownfence: @ToumNYC We love your falafel sandwich and featured it in our latest travel blog post!  You guys rock! welovetoum  htt...	1433165147	605364623018225664	f	toumnyc
Peeps, we are off the road 2day	1433164648	605362528714145792	f	fritesnmeats
Hey folks, the shop will remain closed while we move our operations to our new pop-up location @ BwayBites with @UrbanSpaceNYC! Come visit!	1433165147	605364620052819969	f	morristruck
Happy rainy Monday. We'll catch you guys in DUMBO tmrw.	1433166302	605369464268283905	f	kimchitruck
De CARTS 2/2:\nKotmadam @ 24th & 5th Ave til 9pm\nBierbeek @ De Great Lawn, Central Park til 7pm	1433166637	605370872011100160	f	waffletruck
De CARTS 1/2:\nGoesting @ 66th & Broadway til 10pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm\nVedette @ 59th & 5th Ave (Manhattan) til 7pm	1433166622	605370809058791424	f	waffletruck
WafelMania Monday!\nLe Cafe @ 15 Ave B til 11pm\nDe Wafel Cabana @ 35th & Broadway til 11pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 11pm	1433166602	605370723830505472	f	waffletruck
Saturday I'm signing my new book STREET VEGAN @riverroadbooks in Fairhaven.\nFREE donuts w/ book while supplies last!\nhttp://t.co/JteTzkilg8...	1433167169	605373101929590785	f	veganlunchtruck
@sherylmandel drop us a line info (at) dubpies (dot) com	1433168040	605376753696153600	f	dubpies
RT @whitMN: @oharris69 @Princess_Holly @dubpies OMG. I'd move to Australia just for those.	1433167854	605375974776172544	f	dubpies
We are off the road today RainyDay RainRainGoAway	1433168094	605376983858593792	f	polishcuisine
We are off today preparing for @GovBallNYC and @IntrepidMuseum later this week	1433167516	605374556182855680	f	papayakingtruck
Stewing up porkbelly and beefstew on 53rd & Park!	1433167398	605374062135644160	f	biandangnyc
Today we are @Hanover Sq serving lunch from 11-3, we are a little short stuffed today, so please be patient, or order online in advance	1433167952	605376385813778433	f	schnitzi1
@sherylmandel of course!We would love to help you.Please give me a call at 347-506-9616 so we can discuss details.Thanks for reaching out	1433167651	605375125375057920	f	pontirossifood
Truck under maintenance today but catch our UrbanSpaceGarment booth on 39th & B'way! Also the grand opening of... http://t.co/EWFFn32TAs	1433167507	605374519310573571	f	domotaco
Buenos dias amigos de Dumbo tacos tortas flautas @MexicoBlvd @dumbolot Water&Jay	1433168845	605380131624992768	f	mexicoblvd
Due to the coming rain storm the Shuka Truck will not be parked on 21st & 5th !	1433168690	605379481533095937	f	shukanyc
Don't let the rain stop you from having a delicious LebaneseLunch! Pre-order at 917-TOUM-350 & pick up from Jay & Water St in @DumboNYC!	1433169417	605382532952166401	f	toumnyc
Good Morning Mtbll Lovers!   Tough weekend loss for the Rangers but great season!  Now this droopy Monday.... http://t.co/lO0rfdlxw5	1433169564	605383146125819904	f	mtblls
Such an important day as we celebrate International Children's Day today....love and protection is something... http://t.co/KA3UF5zWDr	1433169173	605381508388503552	f	polishcuisine
We're back in FLATIRON today ! Catch us on 25th & Broadway!\n+ Midtown (47th & Park)	1433169803	605384152037359616	f	korillabbq
Join us at the 147th Belmont Stakes this weekend @BelmontStakes  | June 4-6, 2015 | BelmontStakes	1433169286	605381982042910720	f	papayakingtruck
June greeted us with a wet kiss but the weather looks great this weekend for @GovBallNYC! We're toughing it out today. 47 n Park/Lex 11-3	1433169892	605384525301063680	f	philssteaks
Looking for some folks to work part time in our Brooklyn prep kitchen. \n\nEmail us with a resume at thecinnamonsnail@gmail.com	1433170238	605385972637954048	f	veganlunchtruck
Hey guys we will be on Charlton & Varick today.	1433171703	605392117750476800	f	schnitznthings
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

