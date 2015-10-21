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
4feb6e00e4b048145c547997	/wcCcDDUFo3EAkWygR8pGn29HTAv7VKEvPwJgzS6hQcw.jpg	public	andysitalianice	f
51c1ea41498e372d91835cf9	/5067950_pSXIZo_RqO8Hh5AuWcomjr0p3q_pXPUMWe99W8hUGTU.jpg	public	burgersandbites	f
51a79983498e3044671cd784	/1441492_yfySwml4ChzJ_ni5DxTq-8n2UlecWBWjgxR-ygA6pYc.jpg	public	burgersandbites	f
501c284be4b07d0ab63e08be	/vQv8P8_hFNwHMmpR7k6-arr8zqYmmgoSG_aAPJuz-ws.jpg	public	itizyicecream	f
535d6fe9498eeb428f0a49a5	/643701_B0msQNcQCClAiTuYbiNnskLICf99ehNmerkWdhYNR8c.jpg	public	snowday	f
533ddd9a498ebf7fb4775ca2	/36814481_r4TU0Q7tJ6Xum58iZ5olLRY6sV-P4dN3psrhw2ZZKZ8.jpg	public	snowday	f
51e83b4a498e0a1c64e62828	/26624_AGoljLki5SS-GJGKaAGB75mloHKRBkJ1Qj5BQCRP1_Y.jpg	public	itizyicecream	f
50ca356fe4b05b0bb93edc40	/1590381_NyRIp7fXJtGoJoXp25IcMmufNufPxxvLEj3TVYXRo5g.jpg	private	getstuffednow	f
529fe66b498e1fd14afe696f	/68150_h0wbg6xbNwrEjXD6uaE12ZDZYF_h55LN99Es520nMBI.jpg	public	mooshugrill	f
5176cceb498efe500552cc9e	/21735785_zaQs-7anNinrrQlobBV2AjNxquTXs5g8ZY0NxvoxvHo.jpg	public	steaksncrepes	f
523b2edc11d265bf373f82a0	/8853695_cjpq3trk4bFpcU1oHWwj4XxwwD9ZI169sNncUyOQoM8.jpg	public	steaksncrepes	f
5267fa9611d2688bdc4587a2	/2136029_bvqot1MnMJ9IGYsYJkamqTiE_lL96OcfilWMxskhdU8.jpg	public	mooshugrill	f
5213a7c011d27a56f99dfba3	/11074699_K2ka1_NxiELyTqgjvY3oMN70IUxIlADqRIAb5QpzsLM.jpg	public	mooshugrill	f
525b3a3711d2040fdcbd6fee	/52031712_DN0C9vfm3iv1geUuFX92Pt0jwgl8NhbGokLj_o0Ebjg.jpg	public	mooshugrill	f
4f9c18b0e4b0b38d2f554383	/AQEKYbyPrQt5uMWhy4r4ODm2vSMCqPseJyMhcg55mtY.jpg	public	eddiespizzany	f
4da8977840a3582fb8c49316	/MCGIPRA0XR15JNG4O2YZJQBCRMK05UVTC4T14TOQWRTNMQFZ.jpg	public	eddiespizzany	f
4fd79157e4b071eb33a9c810	/8zrcTIejD5EBiOJzSobql1_PQWr-i2KmRfgMCYmbK-M.jpg	public	eddiespizzany	f
4fb29dc4e4b0e08c1e225555	/ckjwTj4Fd2cRoZvDQZw_1jYdwuBF4BsfV4ZWc5oElFo.jpg	public	eddiespizzany	f
542c2fb9498e97db2676dd30	/19152_gqmkZvFomzQsd1bmXs_VAPUX3V8eyhtOS5hHM9oHpgo.jpg	public	camionnyc	f
51dc48a3498efe9483d8417a	/117715_dlhUlP8z_jVejqRlWaCzsJBqg0eoP6rRSjOLpszFA0Q.jpg	public	veganlunchtruck	f
51105b22e4b0a7b61fac854b	/117715_vKu0po70jlTD3qN9mXsdNiE6V5Od1hmYMVlUY9xSIP8.jpg	public	veganlunchtruck	f
516ef5ece4b0d1c83382c12f	/117715_Gt3J4FMusC7YQjSfEup4O7bAO10z8J4gxmnd0xKnZuQ.jpg	public	veganlunchtruck	f
5196816e498eebbaef53fe6b	/32050404_-lVnQ_kgFICQK3OBrfq4QydeDqXhz3ZCRD3TrCvMPxY.jpg	public	veganlunchtruck	f
50292d68e4b0d0acd3bb5dbb	/vv6y8qi6JFfXr9QDkIvTPP0fSmbgQ_jGXHCVwDv0c04.jpg	public	veganlunchtruck	f
5410795c498e74cff2aed48e	/5864_GAP3yP3vlQyBpeK3IKyeS9azCR4R0hgVouqQiGPdTOE.jpg	public	hityourvspot	f
5507187a498e8ab5968bc213	/377760_Wcfue-MAFtEgRyWr0DDPKpXXxnCl7aqPN5ZyMAL9dUI.jpg	public	hityourvspot	f
526e8aee11d299d16e74b447	/67629862_ZPeS1alTFabw1hPqq8PCcGF1SRFynqA23OgkKg8yc00.jpg	public	lovemamak	f
513b9b7de4b04f7024bc158a	/45519738_eDUGOpHYwiR5C3VUps1gQ1YDIq0Di3WMfuirGs2EVBk.jpg	public	rickshawtruck	f
521b83c411d29ec0512f89b3	/255980_1U9yRWzBKuIDLReBhmBs45qJ0mtHu7pzL_Fv4T9gTss.jpg	public	lovemamak	f
5245b75011d28cd2725f32c4	/2982235_y79gPBpI95RkUJ_pZbhVDGujTU5g8hRoskz3BqSI44w.jpg	public	lovemamak	t
5217a7de11d2746c048106cc	/39707564_gPzbz_bNU4iuZ8B8xSD0b250GHVZPaepeD8NOUyrLI8.jpg	public	blend_express	t
51bf5237498e5ddfd58cd4c8	/16518471_biLXoMrblr4306jDwZDBDdJhZJ2Kz0YeORHDz_yVXSg.jpg	public	mexicoblvd	t
51d31ab97dd28a271207af20	/59958053_5CogfmHgRpBtjkPzVkAgAjK7q9ac0bo8Z1TPwxPIFAw.jpg	public	grillonwheelsny	f
51e0320c498efa962e14eb18	/25342554_SdVvc9WOrSzlj9Rsy_0typl5IcOYEl2vOl_wKVaWoSI.jpg	public	getstuffednow	t
5180207390e7374e46b6c165	/49563206_uKsSD-Cd2jjy6FMyR9U_--7DdUBJ7ZUxtdlushxyIAg.jpg	public	freshandhearty	f
55da547a498eaf4d18cd8668	/68150_a4wUYq9FTUtdVsozCiBJOWbFfw_Mr1J8Jn6Ag9NL4-Q.jpg	public	freshandhearty	t
4f67b0d4e4b08559c4c60149	/SdNxRS0joKXurf0FEv8_SRg-GeR9lGCN098_ZB2tijA.jpg	public	mexicue	f
4f8dc377e4b0ca2accf75652	/EKcue5yGEyaPnBymSd_HtBxWEZl4grYSOXMhw-gqpTs.jpg	public	rickshawtruck	f
4fb6bb41e4b066430032e4ca	/HHZWTU3POi_yJE4GU0zI_NjZNerm5y3MjjxddcV5ZMs.jpg	public	rickshawtruck	f
507efae0e4b09a52c022ec3a	/39213_nH-zcqfLCJqMvG0Nco0LWE4QuRuoL6unlEXJlJbTEF4.jpg	public	mexicue	f
529fe356498eb76b55781266	/68150_0fjIotER7PaMHitF9odB_GOyMyFahAZ-OHvSCE9Y2e0.jpg	public	mausamnyc	t
53d2ab0c11d268858b540b4b	/6657788_kfbbBA6MbAVWizEQdvBfuvdJ1YR6JyMX4pIFYaeiblQ.jpg	public	chefsamirtruck	t
4e94737ebe7b8f7220377349	/UABDRYTA3ON4XXTR4HQH42UGYB30IVX015FHLMFZVJ2KQASB.jpg	public	thecrepestruck	t
4fd0f054e4b0757383b97c0f	/MbR1inb3VKXu0PQMsCkHkHGftYq0E8CDbYG3BLRRGaE.jpg	public	thecrepestruck	f
508af08be4b02ba9b11cc747	/17430999_28ys6GXVoaOZoKPXLLK5GQpVEL8UrC1_1DajRIy8ia4.jpg	public	veganlunchtruck	f
556f5fe0498e71287f7c3e06	/68150_DEYnBJz_XjQjQWbq4QTnfip2-TEt4cDPYPIaF4zm9lg.jpg	public	mamasheros	f
556f5fda498e63fb4eda1f61	/68150_wqjx6504Fhkiz_LfsnouqTZvlLmrDMzJu96d8eZO-yw.jpg	public	mamasheros	t
507071bfe4b06e882e74b445	/1112203_qnT5k-31-4cRKDz00cUpp7Ia7HG3YTjhsC9Udo90RDI.jpg	public	philssteaks	f
52fe5db111d2d7644f04c21e	/404119_k2pARWK6AW8sOni-GGVsAfTehHeRbbnRCBGhfeb1xZc.jpg	public	philssteaks	t
51645882e4b0bcb0cb0c7ef3	/7511393_dEJJLGO8ljFPMA_kFidoz1wpWZ-k6mHpqYnuRwoBpRg.jpg	public	philssteaks	f
52a0bef911d299250c89f9c7	/349672_Cg8dtcrfQ0WZeSo7BJR61YBG6VzsiMltZP8XIqyHiu0.jpg	public	mrniceguytruck	f
529ccbc511d21047117cdea2	/68150__CRf8sW9KvXZTkcAQEc4EsnYPgqXA2trmMxy-_AzobY.jpg	public	mrniceguytruck	f
5391f2fb498eaff244578f11	/715320_7m2CfczIRBJpmjgQRa0xuWupsh_NmhZk_MrRWfnI_mQ.jpg	public	parissandwich	t
51c8a3c5498e797153ec5629	/46314126_95x6AErCZEGSi1zGZrFCY-EzgsIMyOhgO4G59l-u_Xg.jpg	public	funbunsnyc	f
5212ec18498e9494b634a94c	/814104_tUkLgiQ8zcYxovra9R8PIx7FckFhBjzNVHmirteXd58.jpg	public	funbunsnyc	f
505204d6e4b02dee62bd961a	/dcOYoRoNNeCLMxvoyAN-o9gJObcw5FljMqYpS9cps84.jpg	public	funbunsnyc	f
4ffda271e4b03bbc7f8fd13a	/6Dtx8fj7IXT6M3O6ZV3rXryb6zKTAqPchjeOM2BJJAs.jpg	public	funbunsnyc	f
551eb68a498e136a7e3dacac	/89498162_GK7wVV_VF_ZbdcpURHla6Btpz7w6ls1aYNB9Q020WxY.jpg	public	neaexpress	f
55da612b498e7986da882759	/68150_kVXNCZMNTi6VASGjv7tgcFBneZ1Dq5OLpxfsl-WRCNI.jpg	public	neaexpress	t
4e42ae7f7d8bec1e4d1a1c92	/RVQ54SSKH1QCVFTLGHQMPXKMGUA3QC3FCQKXU2DOVHQNRT23.jpg	public	fritesnmeats	t
54978669498e92fb4a6b4341	/97520198_KIqmbmLkuFxboBU_HjFosEOXtwVA01QnxiBHugrwImE.jpg	public	shukanyc	t
51dc0e71498e8db4f9a8106e	/4456614_ZWvsB80ogvwYkoKIyVf6q5RfcDXwuKI4t0XJJhyLQ_I.jpg	public	thesteelcart	f
519a7e33498e6e4ea6ff66f1	/3354_e_1JMupbEA8VtOBVXgLHAvtJGQwcpHvY2JyFESXYSjo.jpg	public	thesteelcart	f
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
50e719c2e4b0e263423e547e	/15471_4uN0tddGW5orNGh02xhxbiAOGUpAAy3rIWEotoRgB_M.jpg	public	tacobite	f
523c930a11d22e1c3012a9d3	/34169985_AiTXirGu6jTaGeWWhhOfl2QIbGVaQjdDg1QCEakqza8.jpg	public	mexicue	t
501fe830e4b0bbddce992f90	/fFBOGONZt5Zr77Vc5g8adoAiBht0f-MBut7GqorVEjo.jpg	public	mexicue	f
50784742498ec6be8cd3f88e	/155927_ebZApDyXpTKTmvOQHdBTxNc2wJrsZV2QASmpYTNAVJM.jpg	public	mexicue	f
511d2c60e4b017a4221bec0c	/1425622_srSMuVL9KOV8rqb_UDiSQNwjvNOtMyF-zeTO7sHRZZo.jpg	public	nuchasnyc	f
50ef1f18e4b0710a5e5cb1eb	/117715_4lM2ZgzHp4Uv61-ckuWzdXXXcPVNEH2NjISpWAEjGds.jpg	public	nuchasnyc	f
4ffef65ae4b013ea5f373be1	/VqxEh6cK784gtMOJRF6Lnub985jBJPC6-FuwZwXt_y4.jpg	public	nuchasnyc	f
50f99bcee4b08ca132377f78	/4611139_CEH3eveI6uxlRVQLet5Fpa_sNfJwAzfheMTYSBplO5Q.jpg	public	thecrepestruck	f
512bbfebe4b0b8faa466c796	/1425622_4wp7wCuj7Ci1dl_FVH9syKmrJwQavMhL9uqww1b0m1o.jpg	public	philssteaks	f
527e77d111d2e66fa6a871b3	/649454_HIWthX8nL3SZAOwyMlKj9Y7ju9GCiN4OEV-wZR6IKC0.jpg	public	philssteaks	f
5203bd51498ed50247ee01dd	/60805368_HlIeqCMjY2I5md2mzI5crKizc9wVPUZo_sBmC6zrPEA.jpg	public	mamuthainoodle	f
5249c4bb498ecd25dde27c5e	/764670_x0RdEOs5TL4SEe2zGgpkzPFBFmlFV7-6UQiVtoFeHaY.jpg	public	goburger	f
51dc5a9e498ebf7ad40223ec	/1328035_Ak3fMs2e36r7NvIE_gIDK5XZ9CwrW1DEJa3g1oobp5E.jpg	public	wingnitnyc	f
526fef71498e92d1ace459d9	/60805368_eCRrBwapYrNL8fM9tmIaLCfnlhQYb9ASU-ZkaR1Og54.jpg	public	mamuthainoodle	f
5568962e498e28889a3c79a4	/276818_apRGkmx83lAjJNn6Dbd8xPe7iW0vTSrJEwb3LCqyLCg.jpg	public	pontirossifood	f
519bb23b498e208a0b81b7fa	/9285455_LZiJ4FLH7NOWjNUsXO9jxDRFAgLygBSB8SmSIW0z9kM.jpg	public	mactruckny	f
5165924de4b093be3bc5cd57	/2159706_uFl3RYgA1z4EiDNp8PtjjG2HHWhTiiXDLNzJtFWPHS8.jpg	public	mactruckny	f
5151c82de4b024888079c5ea	/5003144_g8kbTzyfr6gL9vIRpMBbXz4TqBUk5EgkqIPlBP9DtsA.jpg	public	mactruckny	f
50883301e4b0904987088a20	/2361939_J2zcgauqqGFC_PZPyvkfEDoSufdDe5qE7gi_NkS1P1U.jpg	public	mactruckny	f
52e456f2498ea9ece32b66e0	/25812424_w-pfXOZy2D8xWVJY37hGi4VXYiDnicBFvWRiiDOnNhE.jpg	public	carlssteaks	f
5203e16e498e9e8e0a93b61a	/702028_Fog-6PEF03KateivIPP-hx87Qn6gi7PwnaJv-wTFv3I.jpg	public	carlssteaks	f
55da5467498e1d9f64d28c57	/68150_B2x11YLO-NbpSVy1z-s3j6Az5i0b6vSM3L3EOYB6o1Q.jpg	public	carlssteaks	t
5239c6b7498e0f1f28af16fc	/2751553_7BX-8PVCQt3ELg-hV0rfmQhwRrGHbz9brLHsuV6IIhs.jpg	public	sweetchilinyc	t
5410d00c11d24d29446d44c6	/10837211_UZDe_Sme56cWk-Gex8X4tfxg9bP-GHZcMWTK8imQoog.jpg	public	latinkitchennyc	f
5436c50e11d248d936eac143	/19152_M_ApacXXYJKPZC2fQRc7PP3Ft1gKho4lkea0eGMXrGY.jpg	public	latinkitchennyc	f
532879fb498ec68315b3d232	/68150_KF6qgT-viSOMS5bt3lJarsNeEUjlVJn1lbAypyCl1js.jpg	public	dubpies	f
53287a0c498edd9a0567c2c0	/68150_i3UKBmIXHPN4h7gtvSQjnYfikUNmJuGRpjwKP2dLI5Q.jpg	public	dubpies	f
53becfa0498ecabf3380ad3d	/14196482__Nb-XE1Nu5U6-DjUyOaSLEZlftPX9UbGRO6ONPylCAk.jpg	public	coneyshack	t
5329e77f498ee6898be00a22	/11652594_SJ-j8bWUQDW088CP6WJV_hsoVB1X3sqlknJREVGXk-s.jpg	public	coneyshack	f
555a66e0498e8835d908f1cc	/11340787_R901RT00K2RnA_8Q0b_lKvHXGgpf5ReaOYkWrBKW6qY.jpg	public	coneyshack	f
52013fe1498e5f476bfdcf83	/30611522_DHhazmY8dyNAbmijjHX7jyyfVBEiugL5-GJcTLuYjS4.jpg	public	getstuffednow	f
523c8b2a498e959b87f8ded2	/39707564_-WCsPSk2ExKeZ8q06DtUQrpt_vcWG9-AzvFoToSdQqY.jpg	public	getstuffednow	f
51af7257498e0c7f8979c05d	/752258_nUJpoSxZ8p9BBJMG5ISetpo3DDLzycLT_gT3z9fvJmI.jpg	public	getstuffednow	f
5345d100498eaa611b76f338	/62345083_i2VdE3VeEPlbfUgNv9mWmVmsuL19upJhcHaRX3zje1w.jpg	public	dubpies	f
5328764d498e217e55fa24e1	/68150_4QSMIi6zBoyrZ1VeH1Dqb3fEovQswz93yHAPvf2lGmQ.jpg	public	dubpies	t
504777b0e4b092e662d54688	/VDYXmY1LaQGPAFc62SGiSEqcsa9OqhqXotgvAXIkHgg.jpg	public	morristruck	t
4ff318dde4b0444717bb6c21	/7p0pVfwa2IPX5eoAqan3mf43CoVnVrHHztgDqMGA6aE.jpg	public	korillabbq	t
4fda1cf4e4b0f6aceebbdb2d	/lKL7uz06jZgB680Vye9zxa_2yQfH96afFExvxaLlRpU.jpg	public	hibachiheaven	f
5182ad6b498ef6cb59d48783	/39425123_zPh6ih4GAAygbhRJ-pyPdCr5TI3rXafgKyIEEK4HpHY.jpg	public	goburger	f
52e6af38498e26e622e5398c	/4147709_E9hzkLfHAJjdgQ6RT3W29cf-cftJShyXpRthu8riZYs.jpg	public	hibachiheaven	f
52e2aa07498e25b9a084ee94	/12998378_50qpDzH_XwsSlaJpw-f2fDtJsSvQg4TU_ujjdsnyWOw.jpg	public	hibachiheaven	f
5362891011d2b40c5f328b6e	/41834822_k1LVelyLVM9gsNt3M70sVjI-QLm_84bgv4c6hoMHPO8.jpg	public	hibachiheaven	t
516ee142e4b04f28d58be309	/36812449_DjR1ynMnMpwj-KmiWPZQldmGQwJ2IEzjSwwmGevqe3U.jpg	public	sweeterynyc	f
5107e09be4b047c08ade6bf6	/760350_ZaalKVnOYdVAGoQEdugu-1Lws1LubyJBOVpZvJJD1V0.jpg	public	sweeterynyc	f
50188a43e4b0d35e6d8035b4	/b-fKh6mx2WxCybNQkr9ovk_jv4x7bwJPVFM9RF3M5T4.jpg	public	sweeterynyc	f
501d4734e4b0af03cf473287	/6BUHUmEyYTTh3a2SRjSYRklUlTfQBNbFnnk_hfEojYs.jpg	public	goburger	f
545d48d2498e3e01487425a1	/8418727_ueAVzhZe5huI9alIjmHct6sTu6gQ4RyIUDXP0_qGF4M.jpg	public	kayanyc28	f
4f7deaf5e4b0ffb6a3f2008e	/Xho5Xq8BtpNhEQvH0KRI3yX4kUstFRwTxEDj6QoawcM.jpg	public	palenquefood	f
51b8a845498e8ebdef064e0c	/761163_j9ai1NfaIpK2TLN8JzXbTwyIhVzuZevNHBV5EpQ7Fh0.jpg	public	palenquefood	f
51435e1de4b07d53cf71fd7a	/4486_lUhkecOFThYlMHKai4wDp4lXXiQSPLTq3Nno5WMIz7E.jpg	public	palenquefood	f
51dd9efb498ebbc846c11c03	/13001992_b9dLXH02o0ZX8hyUZVtpgGW6sDyzAl23vmEl-0Hj0jY.jpg	public	itizyicecream	f
51cb2c41498e9851cecdd49a	/5728350_vuJ4ORu0wHhd-B-f4FTNfsoIhfHgtJRMJc-QEeiYmNQ.jpg	public	taimmobile	f
51f4589a498e97316d307dab	/186827_ilvLMlb3AFqgXUQJ43S7IjsLNPxYP3Pw5LEjrqhp6wI.jpg	public	chipsykingny	f
559eba5d498ed3b75095059e	/21832446_2POlNScZ2g8opbNsoyOSVET81dD_UbrXct5G3cioosQ.jpg	public	schnitzi1	f
51cc5aad498ef430f84d0bb7	/6118094_NBh6M6M6nf_5mYOkO-_utfQBmnbpNZTvTRhINFWsX6s.jpg	public	nautimobile	t
51ccc251498e028212e9b1e3	/117715_ozxp6K6iPGwKCzQDARR3BgMcisplkTt0x4LEKDJdBMk.jpg	public	nautimobile	f
5022f267011cfeafe81dab9a	/7EPnN8ReXYQWoZYxzqkH9AQlOe8vFPtVP_60n65i9U4.jpg	public	nautimobile	f
4e09f3fca12d09aa881a769f	/NTSOFYDIBYVWGE4RYQTBBNIAQESPZ1LLW3Q4TC3TGMROSJPH.jpg	public	nautimobile	f
4e70e35c52b140871b6fa35f	/1TB5ROKJY5NF0GAVS4YS3WZTFCUXXHTPLLBUIK4BU0XD0QA5.jpg	public	nautimobile	f
51424d6ce4b0041cb8df9856	/117715_oxR8_TwNSaCL-_gKDA2i2-1YoRfVVnbfT3M9Bfu4nxE.jpg	public	thepocketful	f
511a7d64e4b0c6a64118260c	/793192_Dtd9vMRk-pbBJscn1cb7n29zM87iJjZy6rojapRhODk.jpg	public	thepocketful	f
53c008f2498eb7426f809906	/8901_yT_FwBIUdR6vXYUM_nivPyu5TTVPRyYzz_45v8zawy8.jpg	public	thepocketful	t
51800af8e4b07a4a57023def	/9548073_erhzj0ShEDKaz8S8DhlDe90fDjJEIWjilIxO4_zjdGE.jpg	public	thepocketful	f
50a696b4e4b04d062582a95e	/32050404_qo6ZUnU5LQMoqrAR6YoH5Qz-PdUcD1d1jCheEJy7lng.jpg	public	thepocketful	f
5008051fe4b0974c844d5003	/oNy0_bsWPyVmjrduzJXpbrAPHjQS0PVbyOCfoRSD9xE.jpg	public	shortysnyc	f
55da6419498ec79aedeeda6a	/68150_xIw4p0jO4-q9xJjDv3t5DMEydCzO7Tsp0emPS9L6X_k.jpg	public	toumnyc	t
51716b5f498e03d8bc252c48	/11709298_S8klPxq0yPyZw2X9-_0IZyk6TFTn9xi5SWd_6BGCeVM.jpg	public	toumnyc	f
512161e0ebca7d20d6a70104	/4574_ZC6mf3ha1jNXmFUDgtNsN3zIf-NHyqgxA3WkUkOl4mY.jpg	public	biandangnyc	f
5106b878e4b05ec869ad8b34	/814104_blIawoImaEcqf-Mg89W5A-nEHiZ5jx76BEYHVzz8dnA.jpg	public	biandangnyc	f
505c9776e4b0643aba1071c7	/5568483_yQrtG73dbug7q06p9IASJmTFnOVgGprIZKbfHjQRcso.jpg	public	biandangnyc	f
527d2c2711d2c984e85cb11b	/4179871_5FQ2eCC5ZeizUVRLh4tadgEAO1BnJjVQ7pSEvSDwIfQ.jpg	public	biandangnyc	f
516cdc93e4b0d6bb083f9db2	/117715_3eRUhgkRZGVpjDAYUz9TD5yQXPVFmg0iCB7iIgv_XD0.jpg	public	souvlakitruck	f
50be4929e4b0ada0df80b932	/4611139_UjW8jF3qFz_uyk0hDKT6CMZI2q3My4j6ZiwX-68QpME.jpg	public	souvlakitruck	f
50031911e4b034c2944f0c3a	/bExPPWxN-4YhYlw2nPz-T5eA3mYN-U78LUZtcIzjTRM.jpg	public	souvlakitruck	t
5199097e498ea36447e54093	/40899881_hbjUdavpBfT-sLaBhv3pbZydT1tgs9v-Maw12j9I3Xs.jpg	public	carpedonutnyc	f
520f87b511d2e753e7955853	/44_gUd2HlRFt-yMUFcOdI_EUCdz5NK86hKk-3kHwZhHou0.jpg	public	carpedonutnyc	f
52373c49498e62a2930117b5	/85032_2JEjjCmOYlsUqDkchtdFaKW9WyiU0nYnCjd-0e4714k.jpg	public	domotaco	t
53a1c287498edebe0e22b43f	/9446626_4q4cPL3HmqkIwu6ljinztCOxq6zm_V1V9MB_vkbZ6Qs.jpg	public	disosnyc	t
5193f5d8498ec8ee7f53d4ff	/11919710_SXBMpZ4zTc47tVk7zEdSMJG0WmxM4HhlHDhQc7NBzsw.jpg	public	polishcuisine	t
5192873e498e63958610c2eb	/117715_Jf2pdeF9ztory7puWsPaFE26jmMzPEzjOfPopvTzSjA.jpg	public	polishcuisine	f
5244712a11d295d581384a17	/22780_QXd0BtJcOWXZwSm_ZG3oXyaNj6Qw5-p8hWQzzH121fY.jpg	public	polishcuisine	f
4fc7a5d3e4b0647c52b3c26e	/iRvxK7ohXIwK9Ib6wkVgtR46VKRLsamXuElhEtOlNKc.jpg	public	andysitalianice	t
4fc2552fe4b0cec932846e84	/cjaTu8CSMM7HvFDxIUk3I2TF_I8mJyZuejfwTgYLc-c.jpg	private	andysitalianice	f
51f15b4d498ee58fec420a7c	/13285510_Q-SBXKFpfroSwQ-QJdezzrh1KaHfHAmLyicy8d5S1jU.jpg	public	parissandwich	f
5243126c498ea77b19b3a444	/65506790_31Qpx9E-ZjuNve-izmDY6vVxUCMrhgGsnOLn4-fusp4.jpg	public	parissandwich	f
51b22a0a498ec00d1c45726c	/390807_y2oeK6xR54wk9b1Sfm82Ek09Auv2lNkRTpJOzos3xjU.jpg	public	parissandwich	f
53287a41498ef1dfde86d217	/68150_jBIeF8OZP2o4q5lJjB4TeUteiuuczqDDm3s4zQGipGc.jpg	public	shanghaisogo	t
530f7b7b498e225c3989957a	/20103877_gKGG5Z15ifazVa7PoBKpyKecZK7x2dWgjFIDOkwO38c.jpg	public	shanghaisogo	f
5254357b498ec4662e20c654	/2620660_kMXeinZ_B6lOrHRQnheIHMBr7p81ZxcUblWl0SQ1vEs.jpg	public	thesteelcart	f
50ad186ae4b0b639ca7ca234	/295161_qCQYG0XjW1Ji0pSDxM7fWRzxTZRbcYyZbsbPNJo12hw.jpg	public	toastmonsternyc	f
521649b811d2913e20a1ae87	/5568483_RtMp5aDM_JtBZOI1u48Jy3om4Z672obezdu1uA_UWd0.jpg	public	toastmonsternyc	f
518a82c9498e068718057964	/25979758_bGWQQ7W2SJI4v7KmU891VcYZGitov6qbSNAnIEt8HTo.jpg	public	toastmonsternyc	f
5197fe76498e1c056c96d21b	/117715_m462oAqyqBN12xyWCOyzYR6-1gtYrUa8BiX9r9OybE8.jpg	public	kimchitruck	f
4e3da652d4c058f9dc087a6c	/QEOIS2W35WLTHYK00QC04LKKX4X1SYW3DDI45X30HSKTJENQ.jpg	public	kimchitruck	f
501975c5e4b092f6a51ef338	/bI7RrGcK_moyn-kJICa1OCciBVuYYykwCMGlea6mcxg.jpg	public	kimchitruck	f
4e00e61aa12db1129557e99c	/WSUNYIB0YFVRCTXB13UCRCTANZUG0DO0X2FWCUYYILU4TCGB.jpg	public	kimchitruck	f
50f59e2ee4b0b31f58d6cc1f	/1922740_OhtWiNUDUcN0NE_HB3Tk8vm5qIZcvqxcP2nMDrN8dT0.jpg	public	kimchitruck	t
5249b1c511d23e54343ae083	/769710_HUiZ7dJrNbdnPYV-DTQRr1z0zgoxFx9KMC_Y-OQ6O2o.jpg	public	bobjotruck	t
51378e9ce4b071feb46ef7cc	/18792384_RSm8zhe_6kUOxy91taByfRjTDSLp7stH7PI41aJHOrU.jpg	public	bobjotruck	f
5249b50c11d2d415e3c6b017	/769710_HOnpTjl0b6qd4-yoPpg9lXZGBy-ZKikqzLlFWw2sQfs.jpg	public	bobjotruck	f
4fe20639e4b05dcdf7f5737c	/l9UdGGevddtOhDk6scQjcy1-TbVBX-wf8Gf56jBIRIg.jpg	public	bobjotruck	f
51c213db498e0748ab0dca3c	/53641916_5aNKp9fdHx3i_Pi15Z_X6pE3fAsTX35YBQ0nlmZGfaA.jpg	public	morristruck	f
5286645011d228bbd12f9880	/1353667_2qCG26N4ikz7mbvEGkrFkcNLagGqrzRuNyeQ35CCDE8.jpg	public	korillabbq	f
5231f54311d26e8da5827f3b	/977282_AToQDrlKW5PTNbNGQcB24_BeJNsRMgZTeYmC9P-or38.jpg	public	korillabbq	f
528e451f11d2a93e4361f565	/977282_wEw3nDjN0NbjC4CgQ00ON0YjdtnMocrfAjXDM4UH63Q.jpg	public	korillabbq	f
4e6513efc65b2dc8a0bfff6d	/TUQTIKBJPOALJKHN54QRKGISWMQDDOW3WTAECOGJ4FOJTPXI.jpg	public	palenquefood	f
4fa814d1e4b0d607baf8bd9d	/2drHnu4mqj-uzpwwcJa3MatYGD7KFuxjE472rButWlM.jpg	public	taimmobile	f
504a271ce4b0c65efb6b05f5	/PG0DfZvsxtqv4QM8Xpl6y8Ojahb0UanYwCPSdmuhj_E.jpg	public	taimmobile	t
54356960498ea4b991899874	/1399116_53XPgGs7xW4ug2d4XS1CK8Wn7_vYQnkpDQpPYamcBS8.jpg	public	bigdsgrub	t
4feb2bb8e4b0a47cf49787d7	/-CEaOy-zjgmGzmPRViSeNchwIITBbHgI3lFosreLqIE.jpg	public	shortysnyc	t
51a4ee69abd87ea53396c979	/4083549_jMzaCPEId80kWmAaq2oQ9APKf4bLvdeHhy40qPeB9j8.jpg	public	shortysnyc	f
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
519fa37b498e7adf7e8ebce3	/47170230_A9xVWAtkJBP-vVqUF1q2WlK8yuZTf1CVQz0JcPrHGY0.jpg	public	taimmobile	f
4dfa4a9840a3542ff44549df	/VBAJNQCBWDMP2WKDXJ5QHQ0WYF1MKHZSLUAZZJXKDBDLDUWG.jpg	public	taimmobile	f
53287c9c498e4b30223220d1	/68150_mMquObtK1F2QjX3VWuhYK2MtjUA9i5QRzexf9zWrBOQ.jpg	public	thegreenradish1	t
53287ac3498ee8ce8841a510	/68150_pNBQ4zhtsUiGR_kyfk0HziUGMzyIQwYcYpJ3VpZf7tk.jpg	public	thegreenradish1	f
50045b1be4b0004dbf67c977	/MDweBG1fBnF_fZ1tOghWyHS9qUxGNiJeOrOpoA-fBrY.jpg	public	shortysnyc	f
500ecc9ce4b0a6d209804d9e	/d2yG6CtTrc8TQAXoEGN68UYAv3DiJIqJvKU65-ApcaU.jpg	public	lobstertruckny	f
5245c7a1498e0eb9bc097723	/1727660_xLZtYmqATL4pckN_IhgIj0AgUbDAJxywzqbf5PKEooM.jpg	public	lobstertruckny	f
507b0648e4b0109f3656e2d2	/76137_7JNe3m0dO2MZ7a9rkqa_DTlnrw0LyNitqksFG7_5IC8.jpg	public	lobstertruckny	f
508abe69e4b01ff7516d118b	/8029486_9wt2tO9BnY5d11Ef0mpAgHAqfK1QMmSvLXglU4fj6Xw.jpg	public	lobstertruckny	f
4dcbff9440a3324246c6fb7c	/YVZPSDS5D1O5DR2NK5IFQKOU0ZNOQTQMTHMRWS3ESLQIQAWK.jpg	public	lobstertruckny	t
507dacb0e4b0d8cafc9601e0	/2361939_S3NwwSNVZD-2tAhc3bwAvsYgk9tXwYv0T0yq9ci-ihE.jpg	public	toumnyc	f
516d98b8e4b0b059e50ff5ad	/117715_BoNkQJO4jPWEtg_ef4-URb7IseoIXnYiP5vkvWJtezg.jpg	public	toumnyc	f
521e9e4511d2d8ddc5c69dbd	/117715_r7cpzyXCpOthqHouR5gdqIMX8k0TZ2KWHFun5wh-EYk.jpg	public	valduccis	f
5079a745e4b00277f33e4836	/34723233_tCoDnWhdhZj61xi_e00MNwJoK_UcfDXCQQ7Weat8pBM.jpg	public	valduccis	f
4fe65d6fe4b09198fde5842a	/nVmhJloDitdcBPFceYT8ajqQqgXBpB_w5GoPWse33Ks.jpg	public	valduccis	f
4ec59ebacc21b428e0de466c	/4AMXSGP5YGTUHEL3TFKTS5ROVIX4HUTU4MU5ZW1OX5E3URDD.jpg	public	domotaco	f
5197cb68498e8d409a89ec1b	/1847096_oRB5R_owQW40gVWlJhNNsh9_0bEq2D8Rt3Zod9HUbUg.jpg	public	disosnyc	f
525c259b498ea7548cf31f8e	/769710_ZxOOtsSbFVklHIRhXVmTO7ops0Pm0EybRDTgUvGHrSY.jpg	public	disosnyc	f
542a28a1498e4288ab95e302	/68150_E567_ql-1p2jEv5ysetaEOgtnxpMmeLwZghpwLximCw.jpg	public	papayakingtruck	f
542a28a8498e8c25fb70df8c	/68150_ru2bxW9jr0deeGFaJrvEbwBh8Bv1FRW82ZIglwoRv1M.jpg	public	papayakingtruck	f
4fe1fbabe4b0be4ebe6c1c52	/HNMFUfRPXDmxSDWAwh7pixJ34SFUY0fgzZFeOLAVXU8.jpg	public	funbunsnyc	t
4e42f5ecaeb7f6be72c39c70	/JC5VO3Z50HMMMVLCCGWDQPMKF4W01VBXP1QS2LFESR55UHIX.jpg	public	fritesnmeats	f
51bf306a498ed0fde41060d6	/250434_ayEUsJHsbHDQFjUrGrR2fdlBjswuffyRTlWWFrW0-dU.jpg	public	fritesnmeats	f
5413499511d26b1c8b577c09	/4195495_Ir_R8BxT1YxyTe-VuFD3U5pw6j9CobWIBlYp1FF-TwI.jpg	public	fritesnmeats	f
5109aed2e4b01d2a5b69b022	/117715_0jgrjk5IsUFppNAL0NtebyMYoz1JMdzrnWAIjrLMHZw.jpg	public	schnitznthings	f
5012e555e4b0dd18ec16bd37	/mZQAOCmv5lnRZ1qOUTwDXk-MLC-X-p01AfECgfLJC2I.jpg	public	schnitznthings	f
522e088e11d2d4539942a387	/39707564_2mJZIxFUyGllfVMRjXdE86dZsCxH8cmCdUv29E4dfmE.jpg	public	schnitznthings	t
52d32962498e318b0a9942f1	/61382883_iF5gX7tlMJ3CWlWcTkpntPniCUpS3o7H8anOau4wiKA.jpg	public	usafoodtruck	f
51dd9ddc498efb9a3437e123	/4501533_djr9d2BEP8dg7E48xJjJTa_Yjk0Iy-MmBG6hgIQBLUs.jpg	public	bigdsgrub	f
4e4e92c7b0fb088f3c0f14d5	/HTLXSW2D30RGIEYPI0JGR22LUCS5BTXQ0LXDWAOHH4PCVHM4.jpg	public	bigdsgrub	f
513101fce4b006d9c4991bdc	/17248619_XfpmI8dNgmoeHE3BXjV8bL2yuuMTqxU3FqDr4BqX7Ks.jpg	public	bigdsgrub	f
4fa2d04de4b0489ba3d7936d	/hsPbM0G5l3AsUaI3x6r_VkiSYo4pYlWTKK2S9zqh_KE.jpg	public	bigdsgrub	f
516452a5e4b0e1b216fdbaa4	/26263584_5wpEOb9FygNRBFQySA-pE1t1q_E9jVM_4mx2mnw5fAU.jpg	public	toumnyc	f
538fa2da498e8efc80bc2cb7	/26065139_jgo2VLUL2PokQdo7SP2iJ6rtca8E552GZGM3Bhu1e28.jpg	public	langostruck	f
4fbfebe9e4b0a3bda0340383	/Brw9_z178IK92xMEXLCSSZrP0-99GXjutCp7dHCi5CQ.jpg	public	thetreatstruck	f
4fbfe026e4b04422a08a40f6	/Han8Z4R-SQ615pLoN2lRdPfKEFa6UW2yudSOxXmJtts.jpg	public	thetreatstruck	f
51461b9de4b0bb73a6821e97	/1102787_UDt7OJpexNs8VPrehVDsp9EtfUJnMhKzJ2tTXuof06M.jpg	public	thetreatstruck	f
4f753600e4b07eec20023ddb	/zUb4OswXiQLnF_k2xnx7AdupnEIl1nuGyIuFcmFWf8Q.jpg	public	thetreatstruck	f
541cd5a2498e539acbe986b1	/21832446_ZrLNVQwpCFEFosqLZcxwCuMZOAXA7BIQY7J1kYeBp3U.jpg	public	carpedonutnyc	t
50ce2696e4b0881a7ef3ee67	/263293_lcA30Y_JnQGKaaHhRqFUio2HQ8UQkphCWP9yhW4CE3g.jpg	public	domotaco	f
520912ad11d2f941183dea9f	/13285510_v7K0PTg4FzGI822Jbc9A8K5mUHIxwJPBZB_0xNeEauE.jpg	public	domotaco	f
50ce269de4b07c1547ebfb2c	/263293_qjcLaRmf5itOMyRiq4AyYZuY2UVjVJk04lO3FTA2CMY.jpg	public	domotaco	f
531b7d5e498e3df35f261af2	/22402741_aYe825rrQDsEq6E_Pqv35za149PBn1PcT557SaJhOK4.jpg	public	brooklynpopcorn	t
5220dc78498ebd10d150f736	/29917892_nMZHXkfxBukc2QfFqtDBTZSJ1xpMkoO7VGBJmGKkwhY.jpg	public	brooklynpopcorn	f
5258d3ef11d26d03cc0563a5	/117715_GQ_O1nyBbVlKTaYpRlprc8ZdIEAEftbU4_9hDGjvxsU.jpg	public	brooklynpopcorn	f
51dc5fec498e4e9be748eac4	/22801_gX0atVT6Jt_H6FPXuYAqHD4VzO5jAmS4SVid_ZLkk5U.jpg	public	disosnyc	f
5086e523e4b02ca59cae7bd4	/2361939_1JvatS0wOUdQQIaTmd4Vmk8bgr7aFYOR7LaMkRio0X8.jpg	public	mausamnyc	f
513f646ce4b0b1892aaae1bc	/13285510_LmdJLKoCS9fSwm3wy96lcieTczjsLuxAEUnU3FlZDlo.jpg	public	mausamnyc	f
51194bbae4b0cd237850b223	/793192_FQUO1SFGyLkg5NRz6VUYl3_zmFgfy0Mh8gL1unO8ijM.jpg	public	mausamnyc	f
5243206b498e78230cd0770a	/54092198_eF4CEteD3zHjOCJzaYssyRXaQElB-GEOy2sqzBFQPm4.jpg	public	thegreenradish1	f
525ee647498ef229c65969fe	/10045965_ptbEO58Zn5wDz6kgitvMVjFScmxSkkuHNbK-AguCXSM.jpg	public	thegreenradish1	f
50e71f82e4b07154c72fdc22	/275165_az4RUZ2U7-4cfdnQA1FlMrDLaxwCMriWtlhS_pddjEc.jpg	public	mexicoblvd	f
5140cc96e4b0ef29f4802508	/4886503_z36ZXtYKGVIHcNLCR18ZdUWtpStRrbf33rInxsr2p1Q.jpg	public	mexicoblvd	f
525de1d7498ef4b27ada0847	/31827631_CApIgPWaXupe3toLi7iJLb6NxIyn2IDTOjAG0qw-PIk.jpg	public	mexicoblvd	f
514360f4e4b0455b303a4d66	/8626436_tfGrSomdm1qEPFKcyb0Q5atmm3DmDeao1W8MotOtOwY.jpg	public	milktrucknyc	t
4fee068ce4b0f9bd2b4041f7	/UQwqaF9knSdh4LFRzAhnh7hcl6_dSjDTg1phtqTe_7Y.jpg	public	milktrucknyc	f
5281221811d21e907e460e00	/4195495_akELCvAQ7aY-bfTfHk93g5g5_qcJnQJV7h_gH0FlKUA.jpg	public	milktrucknyc	f
4f749b3fe4b0f06c04ae2440	/rA31cWGMm0G8EuZFYZBxb3y2OrW3oEo7vCj1L2XR3AM.jpg	public	milktrucknyc	f
52052ef211d22b8ed81dd96b	/36360429_am9ha8rSYxAvCaSMU9ya6lI9MzIgcpR62DH6HS1b-uY.jpg	public	milktrucknyc	f
5239ddce11d2ab4765d5cc7f	/5568483_alwOH7sfGU8-pKfLmurfe9rt3pk2G6p90KwFyC6hq1A.jpg	public	sweetchilinyc	f
5208f543498eaeeaaad3ce52	/15629_P_UAUr_S-OO0R12wNp8LDPwr-ZbfPiWeG0Q0rrjW6Ww.jpg	public	sweetchilinyc	f
51f2be1f498e71235db5b61b	/117715_mGfGU0UGjUMhgqgwrDPf2f44NZtfMrobqJMF8ahsrjY.jpg	public	sweetchilinyc	f
51cc7075498e8d24309aea57	/991186_cg_CePJhqcT81QY5l1L4eB3MQxy_QlsRh4zmZDk8cFM.jpg	public	biandangnyc	t
5280c18811d2e4df572063db	/5354893_5EtQmcwzMnTRFz9qbxjkt9FguCAC4xfW5xwUCyYIrbQ.jpg	public	waffletruck	f
4f733c44e4b039d898ce1409	/PQ9G-O3CAtCW6ixkiwHhICEaRn0L3Lz1F95zKcl_GdI.jpg	public	waffletruck	f
4fd26038e4b06145dfb72894	/zUVUqzIwbwoFsRrRenEhtDmBSbK2Ry9lzqeuYnmnHG0.jpg	public	waffletruck	f
527e823311d2db75dd831ee0	/22419482_1rrrm4nhOKXQsXN25ApmVsGDw4t2J3GyjhfeQPEbClU.jpg	public	waffletruck	f
51eae36e498e58d50e5683ba	/331066_SArUzXa_cz_-YMQco1rwYAfU8a99TZCHJX9a2WA3fHg.jpg	public	gcnyc1	f
5106bdece4b051d6cb82a376	/1922740_Eqg3x5oj7wks2XGfudNYIAzcCuZHJiWpgLP1CCbonEE.jpg	public	gcnyc1	t
4fba74c1e4b0a2484fae410e	/1XmG8W_3-cY3Qc-l1GwU7YSOBlzOwyGtk2BzKOkxqYY.jpg	public	gcnyc1	f
516d80bd498e8f3b47ac90e6	/36812449_Vbw1XbeTn6HJHdJF1bzMp9TvcwrqCP5edmktYCzlW6k.jpg	public	gcnyc1	f
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: mca
--

COPY locations (id, display, matcher, lat, long, zone, site) FROM stdin;
104	60 Wall	60 wall st	-74.0087079999999986	-74.0087079999999986	Manhattan	nyc
105	Greenwich & Park Pl	greenwich & park pl 	-74.0115430000000032	-74.0115430000000032	Manhattan	nyc
61	52nd between 6th & 7th	52(nd)? between 6(th)? ?(&|n)? 7(th)?	-73.9809450000000055	-73.9809450000000055	Manhattan	nyc
108	50th & 6th	(w)?50(th)? & 6(th)?	-73.9804340000000025	-73.9804340000000025	Manhattan	nyc
110	45th between 5th & 6th	45(th)? between 5(th)? & 6(th)?	-73.9810290000000066	-73.9810290000000066	Manhattan	nyc
113	98th & Columbus	98th & columbus	-73.966551999999993	-73.966551999999993	Manhattan	nyc
114	57th & 8th	57th & 8th	-73.9829019999999957	-73.9829019999999957	Manhattan	nyc
115	87th & Lexington	(lex|87th|lexington) & (lex|87th|lexington)	-73.9550700000000063	-73.9550700000000063	Manhattan	nyc
116	40th & 6th	40th & 6th	-73.9850629999999967	-73.9850629999999967	Manhattan	nyc
2	26th between 11th & 12th	26th (between)? ?11(th)? & 12(th)?	-74.0068219999999997	-74.0068219999999997	Manhattan	nyc
3	36st & Broad	36st & broad	-73.9877749999999992	-73.9877749999999992	Manhattan	nyc
4	32rd & Park	32rd & park	-73.9822599999999966	-73.9822599999999966	Manhattan	nyc
8	39th & Broadway	39th & broadway	-73.9871219999999994	-73.9871219999999994	Manhattan	nyc
64	Hudson between Houston & King	hudson( st)? between (king|houston)( st)? & ((w )?houston|king)	-74.0071609999999964	-74.0071609999999964	Manhattan	nyc
24	51st & Park	51(st)?( st)? ?& ?park	-73.9734770000000026	-73.9734770000000026	Manhattan	nyc
107	48th between Park & Lexington	48(th)? between (lex|lexington|park) & (lex|park|lexington)	-73.9740440000000063	-73.9740440000000063	Manhattan	nyc
109	330 West 34th	330 west 34(th)?	-73.9949629999999985	-73.9949629999999985	Manhattan	nyc
111	33rd between 8th & 9th	33(rd)? between ?8(th)? ?& ?9(th)?	-73.9952849999999955	-73.9952849999999955	Manhattan	nyc
36	Columbia	columbia	-73.9644040000000018	-73.9644040000000018	Manhattan	nyc
37	Union Sq	union sq	-73.9915570000000002	-73.9915570000000002	Manhattan	nyc
40	Wall & Pearl	wall & pearl	-74.0079259999999977	-74.0079259999999977	Manhattan	nyc
43	Hanover & Old Slip	hanover & old slip	-74.0089810000000057	-74.0089810000000057	Manhattan	nyc
44	Old Slip & Water	old slip & water	-74.0089650000000034	-74.0089650000000034	Manhattan	nyc
45	Fulton & Water	(fulton|water) & (water|fulton)	-74.0041140000000013	-74.0041140000000013	Manhattan	nyc
46	Starrett-Lehigh	starrettlehigh	-74.006684000000007	-74.006684000000007	Manhattan	nyc
47	Fulton & Front	(fulton|front) & (front|fulton)	-74.0037920000000042	-74.0037920000000042	Manhattan	nyc
49	John & Front	(john|front) & (front|john)	-74.0046009999999939	-74.0046009999999939	Manhattan	nyc
50	30th & 7th	(7th & 30th|30th & 7th)	-73.992486999999997	-73.992486999999997	Manhattan	nyc
51	Water & Old Slip	water & old slip	-74.0090100000000035	-74.0090100000000035	Manhattan	nyc
53	7 Hanover sq	7 hanover sq	-74.0092199999999991	-74.0092199999999991	Manhattan	nyc
26	53rd & Park	53rd & park	-73.9726100000000031	-73.9726100000000031	Manhattan	nyc
59	77 Water	77water	-74.0084190000000035	-74.0084190000000035	Manhattan	nyc
60	27th & Madison	27th & madison	-73.986188999999996	-73.986188999999996	Manhattan	nyc
62	47th between Park & Madison	47th between (madison|park) & (park|madison)	-73.9761759999999953	-73.9761759999999953	Manhattan	nyc
16	47th & Park	(park|47(th|st)?) & (47(th|st)?|park)	-73.9753050000000059	-73.9753050000000059	Manhattan	nyc
9	40th & Park	(40th|park) & (park|40th)	-73.9785940000000011	-73.9785940000000011	Manhattan	nyc
10	40th & Broadway	(40th|broadway) & (broadway|40th)	-73.9869010000000031	-73.9869010000000031	Manhattan	nyc
29	56th & Broadway	(broadway|56th) & (56th|broadway)	-73.9820880000000045	-73.9820880000000045	Manhattan	nyc
30	58th & Broadway	(broadway|58th) & (58th|broadway)	-73.981819999999999	-73.981819999999999	Manhattan	nyc
63	55th & 6th	55th (&|@) 6th	-73.9781480000000045	-73.9781480000000045	Manhattan	nyc
65	Fulton between Water & South	fulton between water & south	-74.0036599999999964	-74.0036599999999964	Manhattan	nyc
21	49th between 6th & 7th	49th between (6th & 7th|6 ?& ?7)	-73.9823590000000024	-73.9823590000000024	Manhattan	nyc
66	Varick between Charlton & King	varick between (king|charlton) & (charlton|king)	-74.0055210000000017	-74.0055210000000017	Manhattan	nyc
27	53rd between Park & Lexington	53rd between park & lexington	-73.9717480000000052	-73.9717480000000052	Manhattan	nyc
7	38th & Broadway	38(th)? ?& ?broadway	-73.9873400000000032	-73.9873400000000032	Manhattan	nyc
48	Fulton between Front & South	fulton between (south|front) & (front|south)	-74.0033700000000039	-74.0033700000000039	Manhattan	nyc
58	Fulton & South	((south|fulton) & (south|fulton)|seaport @ fulton)	-74.0030780000000021	-74.0030780000000021	Manhattan	nyc
41	Wall & William	(william|wall) & (william|wall)	-74.0095309999999955	-74.0095309999999955	Manhattan	nyc
23	51st between Park & Madison	51st (between )?park ?& ?madison	-73.974371000000005	-73.974371000000005	Manhattan	nyc
39	King & Hudson	(king|hudson) & (hudson|king)	-74.0073170000000005	-74.0073170000000005	Manhattan	nyc
11	41st between 6th & Broadway	41st between 6th (n|&) broadway	-73.9857259999999997	-73.9857259999999997	Manhattan	nyc
25	52nd & 6th	52(nd)? ?(N|&) ?6(th)?	-73.9794430000000034	-73.9794430000000034	Manhattan	nyc
13	46th & 6th	(w)?46(th)? ?& ?6(th)?	-73.9822879999999969	-73.9822879999999969	Manhattan	nyc
38	King & Varick	(varick|king) ?& ?(king|varick)	-74.0054949999999963	-74.0054949999999963	Manhattan	nyc
5	33rd & Park	(33(rd)?|park) & (park|33(rd)?)	-73.981827999999993	-73.981827999999993	Manhattan	nyc
42	Hanover & Water	(hanover|water)( sq)? ?& ?(water|hanover)( sq)?	-74.0090000000000003	-74.0090000000000003	Manhattan	nyc
67	Pearl & Broad	(broad(way)?|pearl) ?& ?(pearl|broad(way)?)	-74.0116299999999967	-74.0116299999999967	Manhattan	nyc
70	25th & Park	25th & park	-73.9854219999999998	-73.9854219999999998	Manhattan	nyc
71	27th & Park	27th & park	-73.984531000000004	-73.984531000000004	Manhattan	nyc
69	23rd & Park	23rd & park	-73.9863629999999972	-73.9863629999999972	Manhattan	nyc
22	50th between 6th & 7th	50(th)? between (6th ?& ?7th|6 ?& ?7)	-73.9814439999999962	-73.9814439999999962	Manhattan	nyc
68	Old Slip between Water & Front	old slip between (front|water) (&|n) (front|water)	-74.0085710000000034	-74.0085710000000034	Manhattan	nyc
52	10 Hanover sq	(10 hanover sq|hanover square)	-74.0092199999999991	-74.0092199999999991	Manhattan	nyc
90	Wall & Water	(water|wall) & (water|wall)	-74.0074060000000031	-74.0074060000000031	Manhattan	nyc
92	55th between 6th & 7th	55th between 6th & 7th	-73.9795929999999942	-73.9795929999999942	Manhattan	nyc
94	Water & Broad	water & broad	-74.0114769999999993	-74.0114769999999993	Manhattan	nyc
91	Water between Wall & Gouvernour	water between wall( st)? & gouvernour	-74.0077849999999984	-74.0077849999999984	Manhattan	nyc
54	Dumbolot	dumbolot	-73.9866640000000046	-73.9866640000000046	Brooklyn	nyc
73	55 Water	55 water	-74.0085279999999983	-74.0085279999999983	Manhattan	nyc
74	22nd between 5th & 6th	22nd between 5th & 6th	-73.9916159999999934	-73.9916159999999934	Manhattan	nyc
77	53rd & Madison	53rd & (mad|madison)	-73.9742140000000035	-73.9742140000000035	Manhattan	nyc
6	37th & Broadway	37th & broadway	-73.9875430000000023	-73.9875430000000023	Manhattan	nyc
15	46th & Park	(46th & park|park & 46th)	-73.9758099999999956	-73.9758099999999956	Manhattan	nyc
18	48th & 6th	48th & 6th	-73.9813410000000005	-73.9813410000000005	Manhattan	nyc
20	49th & 3rd	49th & 3rd	-73.9712619999999959	-73.9712619999999959	Manhattan	nyc
31	56th between 2nd & 3rd	56th between 2nd & 3rd	-73.9687619999999981	-73.9687619999999981	Manhattan	nyc
33	71st & York	71st & york	-73.954221000000004	-73.954221000000004	Manhattan	nyc
34	116th & Amsterdam	116th & amsterdam	-73.9610370000000046	-73.9610370000000046	Manhattan	nyc
35	116th & Broadway	116th & broadway	-73.9639930000000021	-73.9639930000000021	Manhattan	nyc
78	65th & Broadway	(broadway|65th) & (65th|broadway)	-73.9820569999999975	-73.9820569999999975	Manhattan	nyc
80	Vandam & Varick	(varick|vandam) & (vandam|varick)	-74.0056519999999978	-74.0056519999999978	Manhattan	nyc
81	27th between 11th & 12th	27th between 11th & 12th	-74.0063159999999982	-74.0063159999999982	Manhattan	nyc
82	Charlton & Varick	(varick|charlton) & (charlton|varick)	-74.0056340000000006	-74.0056340000000006	Manhattan	nyc
83	112th & Broadway	112(th)? & broadway	-73.9657600000000031	-73.9657600000000031	Manhattan	nyc
84	Old slip & Front	(old slip|front) ?(&|@) ?(old slip|front)	-74.0083640000000003	-74.0083640000000003	Manhattan	nyc
86	17th & 5th	17th & 5th	-73.992211999999995	-73.992211999999995	Manhattan	nyc
88	49th & 6th	49th & 6th	-73.9808929999999947	-73.9808929999999947	Manhattan	nyc
89	Hudson between King & Charlton	hudson between king & charlton	-74.007284999999996	-74.007284999999996	Manhattan	nyc
93	99th & Madison	99th & madison	-73.9526939999999939	-73.9526939999999939	Manhattan	nyc
95	Gouvernour & Water	(gouvernour|water) & (gouvernour|water)	-74.008152999999993	-74.008152999999993	Manhattan	nyc
97	Houston & Broadway	(houston|broadway) & (houston|broadway)	-73.9968190000000021	-73.9968190000000021	Manhattan	nyc
98	58th & Madison	58th & madison	-73.9718469999999968	-73.9718469999999968	Manhattan	nyc
85	46th between 6th & 7th	46(th|st)? (between( )?(6&7|6th & 7th)|\\(6&7\\))	-73.9837100000000021	-73.9837100000000021	Manhattan	nyc
55	Brooklyn Navy Yard	brooklyn navy yard	-73.9725830000000002	-73.9725830000000002	Brooklyn	nyc
56	Jay & Front	(front|jay) & (jay|front)	-73.9866710000000012	-73.9866710000000012	Brooklyn	nyc
19	48th between 6th & 7th	48th between ?6(th)? & 7(th)?	-73.982680000000002	-73.982680000000002	Manhattan	nyc
12	45th & 6th	(45th & 6th|45th between 5th & 6th)	-73.9822730000000064	-73.9822730000000064	Manhattan	nyc
32	70th & York	(70th & york|york between 70th & 71)	-73.9547149999999931	-73.9547149999999931	Manhattan	nyc
87	53rd between Park & Madison	53rd between ?park ?& ?madison	-73.9734469999999931	-73.9734469999999931	Manhattan	nyc
28	55th & Broadway	(broadway|(w)?55(th)?) (&|n|between) (broadway|(w)?55(th)?)	-73.9822230000000047	-73.9822230000000047	Manhattan	nyc
14	46th between 5th & 6th	46(th|st)? (between ?)?(5th ?& ?6(th)?|5 ?& ?6|& 5~6)	-73.9803210000000036	-73.9803210000000036	Manhattan	nyc
112	67th & Columbus	(67th|columbus) & (67th|columbus)	-73.981104000000002	-73.981104000000002	Manhattan	nyc
17	47th between Park & Lexington	47 ?(th|st)? between ?(lex|lexington|park) ?(n|&) ?(park|lex|lexington)	-73.9743890000000022	-73.9743890000000022	Manhattan	nyc
57	Jay & Water	(water|jay) & (jay|water)	-73.9866169999999954	-73.9866169999999954	Brooklyn	nyc
75	Front & Adams	front(s)? & adams	-73.9885479999999944	-73.9885479999999944	Brooklyn	nyc
76	MetroTech	metrotech	-73.9857250000000022	-73.9857250000000022	Brooklyn	nyc
99	45th between 1st & 2nd	45th between 1st & 2nd	-73.969530000000006	-73.969530000000006	Manhattan	nyc
100	320 West 66	320 west 66	-73.9877170000000035	-73.9877170000000035	Manhattan	nyc
72	52nd & Park	52(st|nd)? ?&? park	-73.9730260000000044	-73.9730260000000044	Manhattan	nyc
101	76th & Amsterdam	jcc	-73.9800429999999949	-73.9800429999999949	Manhattan	nyc
102	Broadway between Houston & Bleeker	broadway between (bleeker|houston) & (houston|bleeker)	-73.996255000000005	-73.996255000000005	Manhattan	nyc
103	22nd & 5th	(5th|22nd) & (5th|22nd)	-73.9900860000000051	-73.9900860000000051	Manhattan	nyc
79	Hanover sq between Water & Pearl	hanover( sq)? (between )?water & pearl	-74.0091780000000057	-74.0091780000000057	Manhattan	nyc
96	21st & 5th	((5th|(w )?21st) & (5th|(w )?21st)| 5(th)? between (e)?20(th)?( & )?(w)?21)	-73.9904989999999998	-73.9904989999999998	Manhattan	nyc
1	20th & 5th	(5(th|ave)?|20(th)?) & (5th|20(th)?)	-73.9908470000000023	-73.9908470000000023	Manhattan	nyc
106	40th between 3rd & Lexington	40th St between 3rd Ave & Lex	-73.9761950000000041	-73.9761950000000041	Manhattan	nyc
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mca
--

SELECT pg_catalog.setval('locations_id_seq', 116, true);


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
5	(bway|bdwy)	broadway
21	!	
22	thst	
23	(\\(|\\))	
7	(btwen|btween|b & (w|t)|b\\/w|btwn|btw|bw|bet )	between
16	( ave | av | avenue )	 
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
craffels	Craffles	crafflesnyc	http://www.craffles.com/	Happy holidays!!!\nMake ur holidays sweet with our delicious crepe or waffles. Our location for today. Hunter college and union square.	f	1421616846	1388428190	Crepes		514e426ce4b05bcb261d910e	\N	\N	\N	nyc
shadydawg	Shady Dawg	shadydawgnyc	http://www.shadydawg.com/	\N	\N	\N	0	American	\N	536e77ea498e8b0d31167218	\N	\N	\N	nyc
vspot	Hit your V Spot	hityourvspot	https://www.facebook.com/VSPOT.TRUCK	47th and Park from 11:15am to 2:30pm !!	f	1412066274	1412066274	Vietnamese	\N	53c9479b498e2dfa7e205ff0	\N	\N	\N	nyc
coneyshack	Coney Shack	coneyshack		Midtown we have a date... 47th and park ave 11- 3pm	\N	1445362201	1445435863	Asian		524b2983498e0f789f2804cb		16		nyc
schnitzel	Schnitzel & Things	schnitznthings	http://schnitzelandthings.com	Hi everybody!!the truck will be on 47 street and park today,,see you soon!	f	1422645854	1441295198	German		4a6640b3f964a5204cc81fe3	(schnitztruck|the truck)	16	contains	nyc
mamak	Mamak	lovemamak	http://www.lovemamak.com/	hey guys we are @smorgasburg pier 2 @BrooklynBridge_  come come come! http://t.co/llBP6I0uKb	f	1441989988	1410708157	Asian		51c4cffa498ec876f564a0b4	\N	\N	\N	nyc
wafelMomma	Wafels & Dinges Momma	waffletruck	http://www.wafelsanddinges.com/	De TRUCKS:\nKastaar @ Columbia University (Broadway, btwn 115th St & 116th St) til 10pm	f	1445437732	1445262352	Belgian		4a416369f964a52036a51fe3	momma	36	before	nyc
mexicoblvd	Mexico Blvd.	mexicoblvd	http://mexicoblvd.com	Buenos dias Midtown! saboresdemexico @MexicoBlvd askforextraspicy 51st St & Park	f	1445344398	1445439608	Mexican		4f4e55aee4b04c96fba5b149	\N	24	\N	nyc
blend	Blend	blend_express	http://blen02.wix.com/blendnyc	Happy Halloween.   47th and park we here.	f	1421948094	1414774175	Latin Fusion		4fa94528e4b0f8fbf13317e6	\N	16	\N	nyc
grillwheels	Grill On Wheels	grillonwheelsny	#	GOOD MORNING NYC WHAT A BEAUTIFUL DAY TO GO OUT AND GET LUNCH AT HANOVER SQUARE!!!	f	1439939979	1437058212	Kosher		51b0bf31498e9b68db75612c	\N	52	\N	nyc
getstuffed	Momos & Buns	getstuffednow	http://www.chinesemirch.com	RT @GovIslandFood: 1/3. Only a few more days till Gov Island gourmet food market powered by @livefastgroup opens for the summer. @Getstuffe...	t	1408198481	1400698983	Chinese Fusion		4fa016cbe4b05d0fc11262c5	\N	\N	\N	nyc
jollyfatpig	Jolly Fat Pig	jolly_fat_pig		slow cooked bbq brisket. flatiron for  the day 20th street and 5thave . Nyc foodie nycfoodtuck classic https://t.co/yy4qygTQnD	\N	1445437067	1445356438	Latin Fusion BBQ		55ad21eb498e7e5b46049696		1		nyc
freshhearty	Fresh and Hearty	freshandhearty	http://freshandheartynyc.com/	Get your Soup & Panini on with Fresh and Hearty! We parked on 46st btw 5th & 6th ave from 11am to 3pm. Call now 4 free delivery! @3474402467	f	1395241942	1390493878	Soup/Salad/Sandwich		51801f7a90e7374e46b6239f	\N	\N	\N	nyc
taipanexpress	Taipan Fusion Express	taipanexpress		Good morning we are serving lunch at 46 st between 5&6ave from 11:30 to 3pm @FoodtoEat @midtownlunch @nystfood	f	1412268299	1408622100	Thai/Chinese/Indian	\N	532b1b92498ea6c0d1026802	\N	\N	\N	nyc
papayakingtruck	Papaya King	papayakingtruck	https://www.facebook.com/papayaking	It's NationalHotDogDay and we are in Metrotech today - @DowntownBklyn http://t.co/BRqMvfs7k4	f	1444591530	1437661715	American		50952bd2e4b03898afd23fe3		76		nyc
andysitalianice	Andy's Italian Ice	andysitalianice	http://andysitalianicesnyc.com/	Sorry we couldn't find a spot on 47th and Park we are on 52nd and 6th Ave  @nycfoodtruck	f	1445093375	1442853772	Dessert	\N	4df26c2bae609e69dd95d2fc	\N	16	\N	nyc
tacobite	Taco Bite	tacobite	http://www.tacobite.com/	Today we are on\n47th St\nBet\nPark Av / Lexington Av	f	1415029173	1406907223	Mexican		503ba49ae4b0fad35eb7a8dc	\N	\N	\N	nyc
chefsamir	Comme Ci, Comme Ca	chefsamirtruck	http://www.chefsamirtruck.com	We are at the corner of 36st and Broadway!	f	1444777535	1445355400	Moroccan		4c3c85e3a9509c74b52e395b	\N	3	\N	nyc
mooshu	Moo Shu	mooshugrill	http://www.mooshugrill.com	Brought our yummy fare down to SoHo today! Catch us on Hudson & King til 2:30!	f	1418139086	1418396706	Chinese	Moo Shu grill is a slight twist on typical Chinese <a href="https://en.wikipedia.org/wiki/Moo_shu" target="_blank">moo shu</a> The three Moo Shus option is enough for lunch and you can pick and choose a different protein for each. In my opinion the chicken is the best but it is dark meat. </p><p>It's easy to order as there is one window for ordering and for picking up when your name is called.	52090e45498e5500a6bd41fb	\N	39	\N	nyc
camion	Camion	camionnyc	http://www.camionnyc.com/	47th St & Park Ave Happy tacotuesday today's special 3 Fishtacos $10 foodporn camionmeanstruck... https://t.co/bhyHzk9Kga	\N	1445101616	1445357276	Mexican		53eced53498ea98fb8a770e4		16		nyc
mexicue	Mexicue	mexicue	http://mexicueny.com	Eating these sliders under an umbrella is like movie make-out scenes under waterfalls. \n\nCome get em at MadSqEats http://t.co/VxW4aWmiwh	f	1445029427	1410639912	Mexican		4c51a6a71c67ef3ba6b61ab9	\N	\N	\N	nyc
lobsterjoint	Lobster Joint	lobsterrolling	http://www.lobsterjoint.com/food_truck.html	On York Avenue between 70th & 71st street , enjoy a New England Lobster roll as you relax on your break !	\N	1444254231	1444317951	Seafood		552d5dcd498edeb4d817ef9a		32		nyc
frites	Frites 'N Meats	fritesnmeats	http://www.fritesnmeats.com/	Lunch 2day @ Hudson & King. Burger of the week THE PLOUGHMAN preorder 9172929226 soho	f	1445261339	1445435461	American	This is a good burger but this truck is interesting because of the many toppings they carry and their burger of the week. 	4ae9d217f964a520bcb621e3	\N	39	\N	nyc
milktruck	Milk Truck	milktrucknyc	http://www.milktrucknyc.com	Bessie is at 58th and Madison. Call 646-504-6455 for your pre-orders!	f	1445354254	1445432414	American		4e823c0229c2dbb2b7043972	\N	98	\N	nyc
elpaso	El Paso Truck	elpasotruck	http://elpasony.com/	Today we are at @Columbia between W 115th & W 116st. Stop by and get your tacos, burritos, quesadillas yummy  tacotruck FoodTruckfriday	f	1425157921	1412955921	Mexican	\N	523c911f04937624937304c5	\N	36	\N	nyc
phils3	Phil's Steaks	philssteaks	http://www.philssteaks.com	Only two weeks left on the streets this year :( make them count and get your Phil! 47/park 11-2	f	1445300716	1445263887	American		4f15b382e4b0725660ea9f31	\N	16	\N	nyc
mausam	Mausam	mausamnyc	http://www.mausamnyc.com	@UptownLunch York Avenue between 70th & 71 Street delicious Indian curries & bites http://t.co/CXr7MJL625	f	1444940799	1444830394	Indian		50730eebe4b0f3224431dc5d	\N	32	\N	nyc
eddiespizza	Eddie's Pizza	eddiespizzany	http://www.eddiespizzany.com/	Lunch today on 55th and broadway!	f	1445380280	1442406349	Pizza		4c0cf412b4c6d13ae4850c30	\N	28	\N	nyc
hh3	Habachi Heaven 3	hibachiheaven	http://www.hibachiheaven.com/	midtown. Come get warm with some hot HIBACHIHEAVENNYC, find us at 33rd/Park and 47th/Park for some yumyum	f	1428064651	1414075107	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	2	5	two	nyc
kettlecorn	Kettle Corn NYC	kettlecornnyc	http://www.kettlecornnyc.com/home.php	Happy Friday, New York City\nWe are located at \n40th street and 6th avenue \nUntil 3:30 pm\nkettlecornnyc http://t.co/E6LMjGbTPM	\N	1445376422	1445007408	Popcorn				116		nyc
nuchas	Nuchas	nuchasnyc	http://www.nuchas.com	Come catch some Nuchas at our truck! This week's schedule (10/12-10/18):\nMonday: Varick & Charlton for lunch,... http://t.co/7wcdF7O94p	f	1445262852	1444620572	Mexican		4ebd2a9bb8f7b504a754c130	\N	82	\N	nyc
crepestruck	Crepes Truck	thecrepestruck	https://www.facebook.com/thecrepestruck	Come ceck out the Brazzers promo truck in Time Square 48 & 7 ave today till 4pm. http://t.co/wUDdRIZpAh	f	1433610398	1406998102	Crepes		4dfb854918386e743d9869e3	\N	\N	\N	nyc
mamasheros	Mamas Heros	mamasheros		Varick and Charlton today come and get em hot and fresh newmenu 14choices hungry?	\N	1445353079	1445436792	Sandwitches		5564a8c5498efbaa697c9fb9		82		nyc
snowday	Snowday	snowdaytruck	http://snowdayfoodtruck.com/	DUMBO ARE YOU READY FOR THE VENDY @vendyawards CUP WINNER?? Coming your way for lunch today 11:30-3pm @dumbolot @DUMBOBID @Etsy @WeWork	f	1445298193	1444233233	Comfort	\N	533ddd4a498e774b8250a69b	\N	54	\N	nyc
mrnice	Mr Nice Guy	mrniceguytruck	http://mrniceguynyc.com	71st and york... it's friday	f	1414424434	1414687317	American		520bbbb211d26afae232ec59	\N	33	\N	nyc
neapolitan	Neapolitan Express	neaexpress	http://neapolitanexpress.com/	Today's vibes in Union Square-giving out free pizza Photo credits to: @theknowitallsnyc http://t.co/nzSfoHgK5R http://t.co/fldgxWqryY	f	1445365515	1444951699	Pizza		51c8864c498e0ac96c14433e	\N	37	\N	nyc
paris	Paris Sandwich	parissandwich	http://www.parissandwiches.com/	Last day in dumbo today on fronts and Adams @ 11:30 @DUMBOFoodTrucks	f	1444221878	1414764931	French/Vietnamese		519e4ed0498e4f27e64c177a	\N	75	\N	nyc
funbuns	Fun Buns	funbunsnyc	http://j24f.com/funbuns/	Last day to get your favorite buns this year at 50th st between 6 / 7 ave midtown Happy Halloween everyone	f	1419358370	1414768000	Asian		4f8d9663e4b021137aa2bdde	\N	22	\N	nyc
shanghai	Shanghai Sogo	shanghaisogo	http://www.shanghaisogo.com/	Happy Halloween. TGIFriday !! We r serving at water and Hanover sq!! ( 10 Hanover square ) come & get some. 11~3pm. http://t.co/VBdd8zsVAK	f	1442934324	1414769059	Asian		5258369d498e13def2bef2cb	\N	42	\N	nyc
shuka	Shuka Truck	shukanyc	https://www.facebook.com/ShukaTruckNYC	SHUKA TRUCK SCHEDULE:\nSunday-\n67th St & Broadway \nMonday-\n21st St & 5th Av \nTuesday -\nFidi- Hanover Sq\nWednesday... http://t.co/AiCwoFDZiE	\N	1445353668	1445265734	Israeli	\N	546a5011498e0e047a243f37	\N	96	\N	nyc
cinnamonsnail	The Cinnamon Snail	veganlunchtruck	http://www.cinnamonsnail.com/	Parked on 55th/Broadway 9:00-3:00\n*Please read note at the bottom of this post. \n\nHabanero apricot grilled tempeh... http://t.co/9ifeS1tevk	f	1445437539	1425044750	Vegan		4c263af6a852c9287537e66c	1	28	two	nyc
steelcart	The Steel Cart	thesteelcart	http://www.thesteelcart.com/	Makin a grand finale on Front & Jay! Stick it to the weatherman with a toasted sandwich & grits. Soup today is Rustic Chicken Noodle.	f	1436887174	1419950738	French		511d3abee4b0e188895f3697	\N	56	\N	nyc
toastmonster	Toast Monster	toastmonsternyc	http://www.toastmonsternyc.com/	Toast Monster @UrbanSpaceNYC @GarmentDstrctNY till October 17. On Broadway between 40th and 39th st.	f	1428680926	1411270224	American		50ad1829e4b087613d696bc4	\N	\N	\N	nyc
mamuthai	Mamu Thai Noodle	mamuthainoodle	https://www.facebook.com/MamuThaiNoodle	17th & 5th. We're here for your noodle needs! Get some hot off the wok Thai noodles! mamuthai	f	1445279922	1445274513	Thai		5126a10ae4b0af674c85f353	\N	86	\N	nyc
mactruck	MacTruck	mactruckny	http://MacTruckNYC.com	Good morning 47st!!! Between park and lex last truck on the block caboose	f	1444858162	1432730877	American	Looking to take a nap after lunch? This truck is great and the owner is incredibly friendly. Feel free to chat it up while you watch him prepare your food.  Not listed on the menu are the many condiments\\n you can get on your macaroni. The regular size is a good portion for a normal lunch.	50575ab8e4b04ed4f2197dac	\N	17	\N	nyc
gorilla2	Gorilla Cheese 2	gcnyc1	http://t.co/4ZDqfwSH5f	G1 46 5/6\nG2 47/park\nComeToTheCheeseYo	f	1445279834	1445012911	American		4dc2d3e352b1c1fb37f1e945	g2	16	before	nyc
eggstrav	eggstravaganza	etravaganza	http://www.eggstravaganzany.com/	Good morning \nlet's put a smile lots of energy and a delicious earthy breakfast,\nJoin us.the truck @ North east 52nd and Park.	\N	1445432961	1445256684	Mexican	\N	4b15165ef964a52049a823e3	\N	72	\N	nyc
latinkitchennyc	Latin Kitchen	latinkitchennyc	http://www.latinkitchennyc.com/	HAPPY HALLOWEEN ! ! TODAY OUR LAST FRI OF 2014 ..THANK YOU WALLSTREET! !\nLOCATION 55 WATER ST (SIDE OF OLD SLIP) NYC http://t.co/RWCtK9bCEc	f	1445437608	1414768415	Mexican	\N	53878518498ef00115dbdea1	\N	73	\N	nyc
kimchitaco	Kimchi Taco	kimchitruck	http://kimchitacotruck.com/	Find us on Jay & Water St. today doing our kimchi thang. 11:30 - 2:30	f	1445276215	1445344540	Korean Fusion		4d6ee122b45b59417c6a6778	\N	57	\N	nyc
sweetchili	Sweet Chili	sweetchilinyc	http://sweetchilinyc.com/	Looking for humpdaymotivation? ? Come to broadway btw houston & bleeker 1130-3 and get your sweet heat on! thaietnamese spicy chef	f	1445299186	1445433561	Asian		51a8c802498e2165ca855a19	\N	102	\N	nyc
carls	Carl's Steaks	carlssteaks	http://carlssteaks.com/home/	BIG CARL 47th st bet lex / park @MLB @nfl @UBSamericas @jpmorganchase @SiriusXMNFL @MHFI \nLIL CARL - 70TH ST /... https://t.co/8XQxGhsCtU	f	1445266548	1445438928	American		51a78330498e3fc1f22d771e	\N	17	\N	nyc
pontirossi	Ponti Rossi	pontirossifood	http://www.pontirossifood.com/	@dumbolot we there too subbing for sweet chili	f	1445370873	1441720926	Italian	\N	542d78f4498ee5493e1a8989	\N	54	\N	nyc
bobjo	BobJo	bobjotruck	http://www.bobjo.net	Good morning we r open at king and hudson. Try our Korean BBQ -Beef pork shrimp and burritos . And we hav also veggie dumpling,tofu bowl thx	f	1442850238	1443628196	\N		4e3add0c88772c3bf12772da	\N	39	\N	nyc
mtblls	Mtblls	mtblls		TGIF MTBLL LOVERS!  Stroll on by 50th bet 6&7 Aves for your weekend fix. The  will be waiting 	f	1440364380	1440168472	Italian	\N	504fb7fde4b0bc88c3a6b614	\N	22	\N	nyc
schnitzelcart	Schnitzel & Things Cart	schnitznthings	http://schnitzelandthings.com	It's Schnitzel time.  The cart will be on 27th & Park serving up your favorite lunch!	f	1431702487	1426694447	German	\N	4a6640b3f964a5204cc81fe3	(schnitzcart|the cart)	71	contains	nyc
morris	Morris Grilled Cheese	morristruck	http://morrisgrilledcheese.com/	Happy Thursday! @DowntownBklyn Metrotech Commons 11-3, come lunch with us!	f	1443193536	1442502360	American		4e0e0b3caeb7a5b33ee5dac1	\N	76	\N	nyc
yankeedd	Yankee Doodle Dandy's	usafoodtruck		NYC. 41st and Broadway till the end of this week and Betsy is at Old Slip & Water St. YDD--the official food of hustlers and go gettas. NYC	f	1445186051	1445353324	American	\N	52b497e1498eed13ead2b84c	\N	44	\N	nyc
kaya	Kaya NYC	kayanyc28	http://www.kayanyc28.com/	Greenwich and Park Pl till 2:30 baos wednesday foodie	\N	1444836849	1445439331	Chinese		54342678498e669166a9d82c		105		nyc
hh2	Habachi Heaven 2	hibachiheaven	http://www.hibachiheaven.com/	Open and ready to roll corner of Varick and King	f	1428064651	1423759572	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	1	38	two	nyc
sweetery	Sweetery	sweeterynyc	http://sweeterynyc.com	Come to Hudson/King St 4 ur FREE cup of exceptional coffee & a sidekick treat, a croissant w/Nutella, could this be the best part of ur day?	f	1444926731	1443706721	Sweets		4a28d919f964a52056951fe3	\N	39	\N	nyc
dubpies	DUB Pies	dubpies	http://www.dubpies.com/	PieTruck couldn't grab an Old Slip spot so we're @ Hudson St & King St, Soho until 2.30pm. foodtrucks savorypies	f	1445439521	1445348368	New Zealand meat pies	\N	4eb825a62c5b53141b78bfb6	\N	39	\N	nyc
korilla	Korilla BBQ	korillabbq	http://korillabbq.com	Lunch today at 47th & Park!	f	1445383563	1445358495	Korean Fusion		4cc701aa01fb236ab070baba	\N	16	\N	nyc
palenque	Palenque	palenquefood	http://www.palenquehomemadecolombianfood.com	RT @KristinaMongan: @Palenquefood TY4my 1st eva Arepa! So friendly &delicious! BwayBites muy bueno! NomNom whatsnext vivacolumbia http...	f	1444742026	1434670346	Colombian Fusion		4e84f424dab45bbd2617dc62	\N	36	\N	nyc
chipsy	Chipsy King	chipsykingny	http://chipsykingny.com/	Kasar truck is at 46th and 6th avenue until 7pm	f	1437241508	1436448508	Fries		51bb5c43498ee06e13d0d31f	\N	13	\N	nyc
bigds	Big D's	bigdsgrub	http://bigdsgrub.com/	NEW specials today!!\nD1: 53rd/Park Ave\nToday's special: Grilled Lemongrass Chicken Grinder AND Thai Green Curry https://t.co/o65umrXxtm	f	1445434034	1445353002	Korean Fusion		4c968b907605199c2eaec2a3	\N	26	\N	nyc
toum	Toum NYC	toumnyc	https://www.facebook.com/ToumNYC	Changing up the location for today. Join us on 46th btwn 5th & 6th for LebaneseEats vegan glutenfree foodporn	f	1445271336	1445430983	Lebanese		500eedb0e4b062ee00577957	\N	14	\N	nyc
lobstertruck	Red Hook Lobster	lobstertruckny	http://redhooklobster.com/	Looking for a late lobsterlunch? BigRed is on 50th and 6th! lobsterlicious http://t.co/iaXzIRyOrD	f	1445349637	1442943020	\N		4dc597c57d8b14fb462ed076	\N	108	\N	nyc
lukeslobster	Luke's Lobster	nautimobile	http://lukeslobster.com/	This is it, our last day on the streets of NYC. 17th st and 5th ave. So long, farewell, see ya when we see ya.	f	1445179927	1430398345	Seafood		4dc81239b0fb5556cd2f3023	\N	86	\N	nyc
taim	Taim Mobile	taimmobile	http://www.taimmobile.com/	Come get your falafel fix today on 20th and 5th in flatiron!	f	1445282735	1445353342	Mediterranean		4cf2c5321d18a143951b5cec	\N	1	\N	nyc
schnitzi	Schnitzi	schnitzi1	http://www.schnitzi.com/	Good morning everyone, today we are @33 St bet 8&9 on B&H old loading dock serving lunch from 11:30-3:30 spread the word order online	\N	1445383546	1445344915	German	\N	532b25ed498eb8b1844dc14f	\N	111	\N	nyc
shortys	Shortys	shortysnyc	http://www.shortysnyc.com	Up and running at SouthStreetSeaport South and Fulton Streets Cheesesteak ChickenCheesesteak RoastPork... http://t.co/awyzKOzJqw	f	1445375704	1415982867	American		4faea2cce4b08a88c5dc5d05	\N	58	\N	nyc
pocketful	The Pocketful	thepocketful	http://thepocketful.com/	Our cart is back on 50th between 6th and 7th. Enjoy the sunshine!	f	1444673668	1430145608	Mediterranean		4db8bcd790a0e3f61d601888	\N	22	\N	nyc
greenradish	The Green Radish	thegreenradish1	http://www.thegreenradish.com/	Good Day to GetNaked NakedBeanBurgers 47th between Park and Lexington https://t.co/4ou7IczI7R	f	1445270012	1432902203	Vegan		5229feab11d2edde794d385c	\N	17	\N	nyc
langos	Langos	langostruck	http://www.langostruck.com/	hi \nLangos Truck @Fidi\nWater St & Old Slip\n11-2:30pm\n\nThursday 52st/6Ave \n\nif you don't know Mangalitsa take look http://t.co/JFRV2ZJRmb	f	1444478683	1442412236	Hungarian	\N	537a883c498eb7fac064409f	\N	51	\N	nyc
carpedonut	Carpe Donut	carpedonutnyc	http://carpedonutnyc.com/	Open at 51st street and Park avenue. Come!!!	f	1445085281	1444906397	Sweets	They only server one kind of donut here, the apple cider, but it's a pretty good one. They are fresh and still hot when you get them. They have donut ice cream sandwiches but you should know the entire thing is in the freezer so you will get a frozen donut as well.	5169892c498e0522481eea97	\N	24	\N	nyc
souvlaki	Souvlaki GR	souvlakitruck	http://www.souvlakigr.com/	@davidbourgeois Missing 46th, were on 55/Broadway today with a little taste of Mykonos needgr @randomfoodtruck	\N	1445355325	1443455372	Greek	\N	4c75c2908d70b713d5dcdaad	\N	28	\N	nyc
valduccis	Valduccis	valduccis	http://valduccis.com	RT @greenboxny: RT @Valduccis: The slices are red-hot 51st St. and Park @greenboxny @FoodtoEat @Foodtruckstars_ ... http://t.co/QCZzt1RZnq	f	1445389385	1434247434	Pizza		4df7e1aad4c02ad734170b21	\N	24	\N	nyc
treats	The Treats Truck	thetreatstruck	http://www.treatstruck.com	!!! Wed, Oct 21 12-3:30 45th st & 6th Ave! Then 2nd spot...we'll let you know later!!!	f	1445278890	1445436104	Sweets		49e65021f964a52035641fe3	\N	12	\N	nyc
biandang	Bian Dang	biandangnyc	http://www.biandangnyc.com/	47th and park humpdaywednesday	f	1445346357	1445438032	Taiwanese		4d712874722ef04d04160d9c	\N	16	\N	nyc
domo	Domo Taco	domotaco	http://www.domotaco.com	33rd and Broadway | 39th and Broadway | 47th and park | 733 Franklin Ave, BK asiantaqueria	f	1445374845	1445438072	Asian Fusion		4ed90a2e77c8274efb746d83	\N	8	\N	nyc
brooklynpopcorn	Brooklyn Popcorn	brooklynpopcorn	http://brooklynpopcorn.com/	Good afternoon NYC hope everyone is enjoying their beautiful Wednesday! We are looking forward to seeing you on Hudson & King Street :)	f	1441152871	1434567787	Popcorn!		514a0737e4b09c3e77279d83	\N	39	\N	nyc
gorilla1	Gorilla Cheese 1	gcnyc1	http://www.gorillacheesenyc.com/	G1 46 5/6\nG2 47/park\nComeToTheCheeseYo	f	1445279834	1445012911	American		4dc2d3e352b1c1fb37f1e945	g1	16	before	nyc
disos	DiSO's	disosnyc	http://www.disosnyc.com/	Lunch today 47th bet park and lex..\n\nSPECIAL: Disos the infamous meatball parm on the menu today\n\nCall in orders to: 917-756-4145	f	1445360128	1445436605	Italian Sandwiches	These might be typical italian sandwiches but the ingredients are high quality. You need to get there early because the line can get long and they will run out of some breads. I believe the focaccia half is a normal portion for lunch while their half and hero sizes are pretty big.	519523d6498eeaa6200aad03	\N	17	\N	nyc
wafelKastaar	Wafels & Dinges Kastaar	waffletruck	http://www.wafelsanddinges.com/	De TRUCKS:\nKastaar @ Columbia University (Broadway, btwn 115th St & 116th St) til 10pm	f	1445437732	1445262352	Belgian		4a416369f964a52036a51fe3	kastaar	36	before	nyc
polish	Old Traditional Polish Cuisine	polishcuisine	https://www.facebook.com/pages/Old-Traditional-Polish-Cuisine/315496671902708	47th bw Park & Lexington today! midtown lunch special HuntersStew NYC	f	1445430809	1445429449	Polish		51435df4e4b0823a398ebc8a	\N	17	\N	nyc
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
@thegreenradish1 saying good morning to @EmpanadaLady013 @NJFTA eatwell jerseystrong http://t.co/ma5KpVGt5V	1445009850	655044905010647040	f	thegreenradish1
We've got your lunch JerseyCity @MackCaliProp Hudson&Columbus @thegreenradish1 @LukesLobster @Aroy_D @jc_eats http://t.co/1J9JRN0Udt	1445009699	655044272186634240	f	thegreenradish1
Fight Cancer, EatRadishes  https://t.co/CzbhThnwGi	1444993029	654974352882970628	f	thegreenradish1
Support Sam Pesin and the Friends of Liberty State Park on Nov 1\nEat at The Green Radish also Chopping Block... http://t.co/3upwrs3kRl	1444873635	654473578591588352	f	thegreenradish1
THURSDAY\nLunch in Paramus- Mack-Cali Realty Corporation  Rocking Dinner at The Wellmont Theater with Pat Benatar... http://t.co/tKwWFnDJK1	1444870748	654461471179571204	f	thegreenradish1
GetRad tonight at @PruCenter with @theAngryCrabNJ GoDevils Relentless @NHLDevils @News12NJ @NJFTA @NJVegFest @ http://t.co/Bh52nMMePc	1444773961	654055517317427200	f	thegreenradish1
RT @NewJerseyPlaces: Check out Prudential Center: http://t.co/II3xrpR9F6 - RT @thegreenradish1 GoDevils....GetRad Black Bean Burgers and ...	1444752624	653966021863305216	f	thegreenradish1
GoDevils....GetRad Black Bean Burgers and Baked Rosemary Fries tonight at Prudential Center Relentless http://t.co/TUHvHhXiFq	1444748861	653950240098160641	f	thegreenradish1
Radish Power... https://t.co/vNKz5Z7FNQ	1444642050	653502241324855297	f	thegreenradish1
We'll sleep tomorrow, back to Prudential Center tonight for BIGBANG concert...Tuesday get some green radish... http://t.co/vv4QqZxbkM	1444568887	653195372722937857	f	thegreenradish1
Catch @thegreenradish1 for Dinner @PruCenter rock out with @iBigBang newark Go @NHLDevils http://t.co/XnxIFizQli	1444512524	652958968508215298	f	thegreenradish1
RT @MundoveganMtc: Spreading the vegan love with some RAD peeps! @sotastyvegan @thegreenradish @chefmarcus @blacktieandflipflops... http:...	1444505059	652927659190681601	f	thegreenradish1
Grab lunch @thegreenradish1 coffee @yogicchai @MontFarmersMrkt today GetRad go plantbased  visit @MundoveganMtc http://t.co/Ma8v3R5K6w	1444491338	652870109770461184	f	thegreenradish1
Get Wrapped! black bean hummus, cabbage slaw, melted onion, baby arugula, roasted garlic dressing....today lunch... http://t.co/xjrzMzLKCD	1444475518	652803754912169988	f	thegreenradish1
Waddling off for a busy day, time to make BBQ BlackBeanBurgers   Curried Rice Noodles, Cinnamon-Apple Tarts,... http://t.co/qXbitgnTEQ	1444474887	652801108541341696	f	thegreenradish1
Let'do lunch JerseyCity Hudson&Columbus with @Aroy_D and @SweeterWithCake @MackCaliProp http://t.co/dgyhVy226D	1444406650	652514900594589696	f	thegreenradish1
LiveFast You had me at cloth seats VW GTI motortrendcoty FastVeg vegan plantbased thegreenradish https://t.co/xTly06KDSu	1444401722	652494231936741376	f	thegreenradish1
jerseycity at night jerseycityeats jcmakeityours jcfoodtrucks plantbased vegan https://t.co/0U6W1oaVKV	1444348471	652270880710488065	f	thegreenradish1
FastVeg Wrap...plantbased goodness thegreenradish tonight marin&montgomery jerseycity... https://t.co/AOl4ZkzMkb	1444342238	652244739383693312	f	thegreenradish1
Dinner tonight on Montgomery&Marin with Mordi's Food Truck Jersey City Eats http://t.co/Axqb7QYDAf	1444340695	652238267706773504	f	thegreenradish1
@ryangeftmangold phone off line today	1445012256	655054996317294592	f	disosnyc
46th bet 5 and 6 ave today\n\nOpen at 11:45	1445007870	655036600691265541	f	disosnyc
Lunch Friday on 46th bet 5th and 6 ave	1445007833	655036446332600321	f	disosnyc
Diso Thursdays happenings.. 47th bet park and lex\n\nCall in orders to: 917-756-4145	1444918308	654660952093097984	f	disosnyc
Lunch today water and old slip.. \n\nCall in orders to: 917-756-4145	1444831856	654298346387996673	f	disosnyc
RT @tburkeuconn: @DiSOSNYC @cc660 @BoomerandCarton you guys are cop approved	1444761695	654004069435076608	f	disosnyc
Disos on 48th bet 6 and 7 ave today..\n\nCall in orders for pick up to: 917-756-4145	1444744732	653932919623254017	f	disosnyc
Open for lunch! Water and old slip today\n\nCall in orders for pick up: 917-756-4145	1444663111	653590578295246848	f	disosnyc
Disos MONDAY location today: water and old slip corner. FIDI \n\nCall in orders: 917-756-4145	1444657896	653568706233040896	f	disosnyc
Open for lunch Friday's.. 46th bet 5 and 6 ave.\n\nCall in orders to: 917-756-4145	1444404626	652506412459933696	f	disosnyc
@cc660 @BoomerandCarton you guys talk about the best Roast beef sandwiches in NYC.. You haven't checked out Disos. Google the best	1444401857	652494800575401987	f	disosnyc
@justin_cohen just our regular menu.. Where every sandwich is special	1444401655	652493949970567169	f	disosnyc
@USAFoodTruck haha you're just gonna have to take care of our customers today.. Throw some mozzarella on your sandwiches or something ;)	1444316878	652138372907925506	f	disosnyc
Disos will be off the street today as we do some Maitnence to the truck. Be back normal schedule tomorrow..\n\nThanks	1444313500	652124202363809793	f	disosnyc
Thanks man  it's much appreciated  https://t.co/huGEMVRjhq	1444249523	651855863058186240	f	disosnyc
Lunch today on water and old slip.\n\nCall in orders to: 917-756-4145	1444227908	651765203495858179	f	disosnyc
Disos society lunch in meetings will be held on 48th bet 6 and 7 ave today.\n\nThank you,\n\nCall in orders to: 917-756-4145	1444141193	651401494827151360	f	disosnyc
Lunch today 47th bet park and lex..\n\nCall in orders: 917-756-4145	1444053484	651033616810512386	f	disosnyc
Friday lunch on 46th and 6th \n\nSPECIAL TODAY: Disosthe infamous MEATBALL HERO\n\nCall in orders: 917-756-4145	1443795701	649952398350413824	f	disosnyc
Open for lunch 47th bet park and lex..\n\nSPECIAL TODAY: DISOS the infamous MEATBALL HERO\n\nCALL IN ORDERS TO: 917-756-4145	1443714080	649610053926780928	f	disosnyc
The jollyfatpig way to take care and have pride for every individual item that is handed to our customers. http://t.co/4v4nCW3StS	1445009890	655045073781063681	f	jolly_fat_pig
@Peppage we specialize in a Latin fusion barbecue	1444846959	654361694026776576	f	jolly_fat_pig
RT @Peppage: @Jolly_Fat_Pig Add you to my site but I have no idea what kind of food you serve. http://t.co/IZBsdMkNb8	1444846935	654361591345999872	f	jolly_fat_pig
On @broadway between 55th and 56th street for lunch serving up the freshest http://t.co/B8NaaCmZXN	1444837590	654322395545796609	f	jolly_fat_pig
RT @HeavyMetalTeddy: Let me know a day ahead of time so I don't bring lunch to work! @Jolly_Fat_Pig  https://t.co/WDX0BW7iBc	1444836520	654317909074911232	f	jolly_fat_pig
@HeavyMetalTeddy sorry buddy, unfortunately the cops have been harassing the food trucks and making them leave. Hope to be there soon.	1444833997	654307324371316736	f	jolly_fat_pig
RT @HeavyMetalTeddy: Hey @Jolly_Fat_Pig where you been? Hudson Street needs you! Aka I NEED YOU! Bacon Pork	1444833894	654306894086062080	f	jolly_fat_pig
jollyfatpig is on 47th and park for lunch. Always have a healthy alternative. grilledchicken avocado quality http://t.co/IPCemDDrd1	1444753230	653968566132322306	f	jolly_fat_pig
pulledpork in all its glory. So much love involved jollyfatpig is on Hanover square and water street delicious http://t.co/7r1YCGbpqr	1444406342	652513610799951872	f	jolly_fat_pig
@Joynture were by Hanover http://t.co/TT7Pa6SRB0	1444405840	652511504718266368	f	jolly_fat_pig
@Joynture we will definitely keep you guys posted! Thanks again !	1444236809	651802539063681024	f	jolly_fat_pig
RT @Joynture: @Jolly_Fat_Pig Keep us posted! We are so hungry for your sandwiches	1444236709	651802117343199232	f	jolly_fat_pig
@Joynture thank you so much for reaching out, today we are not going to be there but we are scheduled to come once before this week is over	1444236622	651801751994134528	f	jolly_fat_pig
RT @Joynture: @Jolly_Fat_Pig Hey! We love your pulledpork & wanted to know if you're in FiDi today. Let us know! nomnomnom	1444236571	651801539535880192	f	jolly_fat_pig
@foodnfest thanks for the mention definitely nobsfood over here! jollyfatpig always with that quality. stayjolly http://t.co/NvhwSLDjhR	1444060532	651063179531952128	f	jolly_fat_pig
RT @HeavyMetalTeddy: Had the Pulled Pork w/Mozz, Let, Tom, Jalapeno Aioli & Maple Bacon Sriracha from @Jolly_Fat_Pig for lunch today YUMM! ...	1443649467	649339046808961024	f	jolly_fat_pig
RT @HeavyMetalTeddy: FF Bacon People @BRBaconFest @BaconUnwrapped @baconcandy @Jolly_Fat_Pig @PIGGUYNYC @BaconBaconSF @bar_bacon @MrBacon...	1443376078	648192371289681921	f	jolly_fat_pig
It's all about the love jollyfatpig will be in on Hanover square and water street for lunch. foodie delicious http://t.co/vVGU5G5bZq	1443022271	646708393936330752	f	jolly_fat_pig
@gta86 we will be on Hanover square and water street	1443021766	646706279386361857	f	jolly_fat_pig
RT @SWORDReality: @HeavyMetalTeddy @Jolly_Fat_Pig I agree 2,000% I really want one now! Was it as delicious as it looks?	1442960118	646447707658317824	f	jolly_fat_pig
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
OPEN!  - http://t.co/BUSHVV1uMV	1443998541	650803167458926592	f	nuchasnyc
OPEN! NuchasTruck on the Prospect Park for the Food Truck Rally! MuchasNuchas - http://t.co/BUSHVV1uMV	1443974803	650703603800403968	f	nuchasnyc
OPEN! NuchasTruck on Albany St & Greenwich St for lunch! MuchasNuchas - http://t.co/BUSHVV1uMV	1443803650	649985736016588800	f	nuchasnyc
OPEN! NuchasTruck on NYU Stern 44 W 4th Street! MuchasNuchas - http://t.co/BUSHVV1uMV	1443716404	649619799224524800	f	nuchasnyc
Nice and fresh Portobello. Top it off with Spicy Chicken. Done for the rest of the day! http://t.co/DRETJpoTrO	1443633197	649270803423346688	f	nuchasnyc
OPEN! NuchasTruck on 52nd St & 6th Ave until 2:30 PM then moving to 3rd Ave & E 14th St MuchasNuchas - http://t.co/BUSHVV1uMV	1443628788	649252313262067713	f	nuchasnyc
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
@hidace our Thai Green Curry is glutenfree  https://t.co/tfhmtZzhBz	1445008280	655038321966653444	f	bigdsgrub
D2 is back at it again @dumbolot (Jay/Water St.) DUMBO Brooklyn @DUMBOFoodTrucks @DUMBOBID @hugeinc foodiefriday http://t.co/uWeVRC9aXE	1445000639	655006273843367936	f	bigdsgrub
And we're BACK!  D1 is grillin' it up at 50th Street btwn 6th and 7th Avenue. http://t.co/aQIAYViTAs	1445000508	655005722015637504	f	bigdsgrub
Let us cater your next party! foodtruckcatering catering bigdsgrub foodie nom nyc http://t.co/IunuCya2rP	1444941076	654756445490036737	f	bigdsgrub
RT @Valduccis: @Table87 Fri night 9 pm sharktank @bigdsgrub @SweeteryNYC @foodNfest @greenboxny @FoodtoEat @MrVsPizza @FoodPorn http://t.c...	1444931971	654718258927419396	f	bigdsgrub
D2 is grillin' it up at Jay and Water Street, DUMBO Brooklyn @dumbolot @DUMBOFoodTrucks @DUMBOBID @hugeinc http://t.co/xqvZXUvfn3	1444916841	654654797858013184	f	bigdsgrub
D1 is catering a private party for lunch.  We will be back out tomorrow!	1444916764	654654474791682048	f	bigdsgrub
Lunch is ready...LET'S GOOOO!	1444836361	654317238846140416	f	bigdsgrub
Hello Midtown\nBigD1 is grillin' it up at 50th Street btwn 6th and 7th Avenue http://t.co/F9Q3KFLnla	1444828804	654285544298541057	f	bigdsgrub
D1 is on 53rd Street and Park. (On the East side of Park Avenue) http://t.co/mFOl4lRRhL	1444751815	653962629875150850	f	bigdsgrub
Let's GRUB!\nD2 - 50th Street btwn 6th and 7th Avenue http://t.co/8DU9kgjlqC	1444742902	653925245481558016	f	bigdsgrub
Let's GRUB!!  \nD1 - 53rd Street and Park Avenue\n11am to 2:45pm http://t.co/oxTOrENenc	1444742855	653925049783685120	f	bigdsgrub
Join us for lunch today at 50th Street btwn 6th and 7th Avenue. 11am to 2:30pm http://t.co/YBWq2FeMiY	1444654908	653556173837312001	f	bigdsgrub
@ORSurgeryNurse DM	1444406408	652513886692896772	f	bigdsgrub
@hidace DM	1444406337	652513588079427584	f	bigdsgrub
BOTH trucks are off the road today. See y'all next week!	1444398221	652479547389149185	f	bigdsgrub
@eliseparramore what you get? https://t.co/ocIWns6CG7	1444330874	652197073975177216	f	bigdsgrub
What's for lunch?\nD2 - 41st Street btwn 6th and Broadway http://t.co/j7D8z9Y1vs	1444315484	652132523707764736	f	bigdsgrub
It's THAT time of week grubbers!\nBigD1 - 50th Street btwn 6th and 7th Avenue http://t.co/8y71RAS8mT	1444315414	652132232006660096	f	bigdsgrub
Lunch is ready...LET'S GOOOO!! 	1444231648	651780891048603648	f	bigdsgrub
@rituvasirema usually on 14th sometimes in front of Staples unfortunately we are off the road for the season.	1444915974	654651161446735874	f	andysitalianice
RT @souvlakitruck: Thanks to @livefastgroup and @centerplate we will be vending @NY_Comic_Con at the @javitscenter! NYCC http://t.co/Z2UPh...	1444361910	652327250000506880	f	andysitalianice
Ice season is almost over  but we are open on 32nd & Park Ave. This is our last week on streets. @nycfoodtruck	1444145280	651418637388095488	f	andysitalianice
Great day at @ToughMudder heading to @ipsy on pier 92 till 3pm @nycfoodtruck	1443977060	650713069501464576	f	andysitalianice
It's @ToughMudder time. In da Bronx we are here for all your coffee and food needs 7AM-12:30PM @nycfoodtruck foodtrucks andysitalianices	1443956236	650625729235939328	f	andysitalianice
Update- we're on Charlton off Varick.	1444919307	654665141531774976	f	kimchitruck
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
Open in Union Square till 8pm @nycfoodtruck	1442438912	644261610941378561	f	andysitalianice
RT @Valduccis: Let us POPUP in your Club or Event @greenboxny @FoodtoEat @eatupnewyork @Foodtruckstars_ @ChoiceStreets http://t.co/Rnmxcs4r...	1442368501	643966285391527936	f	andysitalianice
Open 32rd & Park. Come and get your ices! @nycfoodtruck @grubstreet @Cheap_eats @Sexyfoodtrucks @StreetGrubSteve	1442337126	643834689086734336	f	andysitalianice
We are now open on Front & Old Slip till 4pm @nycfoodtruck @EatThisNotThat @Sexyfoodtrucks @grubstreet	1442245671	643451098087489537	f	andysitalianice
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
G1 46 5/6\nG2 47/park\nComeToTheCheeseYo	1445012911	655057746967011328	f	gcnyc1
G1 - @QueensCollege \nG2 - uptown \nComeToTheCheeseYo	1444917900	654659241358176256	f	gcnyc1
RT @TheMeadowlands: NYC: @mausamnyc @gcnyc1 @CamionNYC @DeliNDogzTruck @KorillaBBQ @mactruckny @PontiRossiFood @Valduccis @USAFoodTruck htt...	1444834740	654310441653530624	f	gcnyc1
G1 -  @QueensCollege \nG2 - 26th 11 / 12 @starretlehigh \nComeToTheCheeseYo	1444834700	654310275638775808	f	gcnyc1
@AllisonMalin shoot me an email \nParking@gorillacheesenyc	1444754968	653975853576122368	f	gcnyc1
G1 @QueensCollege \nG2 48th/6\nComeToTheCheeseYo	1444748911	653950448848773120	f	gcnyc1
@TOC1616 48/6	1444741471	653919243679997952	f	gcnyc1
@CityofHoboken SW Park will have a dog run! adopt at @LibertyHumaneJC Bark in the Park  http://t.co/fqK4jSaNlX ComeToTheCheeseYo	1444486218	652848633885401088	f	gcnyc1
RT @TimOcchipinti: The new @CityofHoboken SW Park will have a dog run! Time for you to adopt at @LibertyHumaneJC Bark in the Park tom. http...	1444485730	652846589778763776	f	gcnyc1
@VeezoMesteezo Vince,,, sorry about  that....we pelted the driver with tater tots for you....Won't happen again	1444434283	652630803722190848	f	gcnyc1
Well c u on Tuesday  https://t.co/4ysXsfd0Uu	1444404365	652505317549436928	f	gcnyc1
@Alessandroacq sorry just saw this...we were catering a TV set....	1444402220	652496319437742080	f	gcnyc1
G1 Hanover water / pearl \nG2 uptown \nComeToTheCheeseYo	1444319835	652150774877712384	f	gcnyc1
G1 @QueensCollege enter Melbourne/ 150th st.\nG2 48 6/7 @FoxNews \nComeToTheCheeseYo	1444229262	651770881186877441	f	gcnyc1
RT @TheMeadowlands: NYC: @mausamnyc @gcnyc1 @CamionNYC @DeliNDogzTruck @KorillaBBQ @mactruckny @PontiRossiFood @Valduccis @USAFoodTruck htt...	1444141643	651403380867399680	f	gcnyc1
Trucks are booked for private parties today	1443882369	650315910113304576	f	gcnyc1
G1 52nd/6\nG2 Broadway /55\nComeToTheCheeseYo	1443800235	649971411973447680	f	gcnyc1
G1 Hanover water / pearl \nG2 uptown \nComeToTheCheeseYo	1443713468	649607485247107072	f	gcnyc1
G1 old slip / water \nG2 26th 11/12 \n@starretlehigh \nComeToTheCheeseYo	1443622745	649226967573733376	f	gcnyc1
Apparently it's Summer again...\nG1 Hudson / king \nG2 38th /Broadway \nComeToTheCheeseYo	1443538117	648872009376645120	f	gcnyc1
Hey peeps, we're down at One Hogan Place today until 3pm	1445016053	655070923347881984	f	kimchitruck
@keithbacker Aw! We'll set aside a kimchi bowl in your honor :P	1445016024	655070800203141121	f	kimchitruck
Sorry midtown, we'll be strutting our stuff downtown today. Find us on One Hogan Place, 11-3pm	1445003986	655020311587463168	f	kimchitruck
Another beautiful fall day = extended lunch break = tacos! We'll be on Hudson & King, 11:30 - 2:30	1444917252	654656523113664513	f	kimchitruck
We're on Broadway and 55th today y'all!	1444827454	654279880331366400	f	kimchitruck
It's lunch time! Find us in Dumbo, Jay & Water St	1444750519	653957192270389248	f	kimchitruck
Countering this dreary weather w/ tacos! 52nd and 6th	1444400053	652487231031087105	f	kimchitruck
Got a taco craving? Lucky you, we're on Charlton and Hudson.	1444324464	652170191045066757	f	kimchitruck
hey peeps, we're on Charlton and Hudson today. Swing on by.	1444321885	652159371816775681	f	kimchitruck
Make that Charlton and Hudson. See ya soon!	1444317508	652141014954606594	f	kimchitruck
We be on Hudson & King today. Come get it.	1444313153	652122747208863744	f	kimchitruck
Get you some tacos today. Citigroupbuilding CourtSquare LIC	1444233334	651787962187952128	f	kimchitruck
@keithbacker Sorry!!	1444232964	651786412107399168	f	kimchitruck
Slinging tacos in LIC today from 11:30 - 6pm. Court Square, 23rd St & 45th Ave. See ya there, Queens	1444227622	651764003677597696	f	kimchitruck
Beautiful fall day to be in Dumbo. See ya soon. Jay & Water St, 11:30 - 2:30	1444139936	651396221534380033	f	kimchitruck
Just chilling with all our truck buds today. Come find us at the foodtruckrally GAP prospectpark	1443967309	650672173858861056	f	kimchitruck
RT @jilltataraworld: been craving kimchi4weeks&just had the best lunch ever. Thank you @KimchiTruck! Your kimchi arancini made me weep tear...	1443807636	650002454017384448	f	kimchitruck
RT @keithbacker: How to warm your soul on rainy Friday? Kimchi fish bowl with @KimchiTruck noline sowoneulmarhaebwa http://t.co/a2ifoKymU3	1443804198	649988033685667840	f	kimchitruck
RT @Ktroxx: http://t.co/xmcAYLy1no https://t.co/5be3n2Kgbl	1443799608	649968782660771840	f	kimchitruck
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
ladies & gentlemen \nschedule\ntues 53st/Park Ave\nWed Old Slip&Water St\nthurs 52st/6th.Ave\n11-2:30pm\nfriday???\nsat&sunday Governer's Island	1441109706	638686514856206336	f	langostruck
dear friends \nwe're off the road today ,because of private event\n\nsee you at Governor's Island on Sunday or Tuesday in Midtown 52st/Park Ave	1440771533	637268118411345921	f	langostruck
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
Eat your greens (with chips)  http://t.co/bSFhxmlX5L	1443044580	646801968573337600	f	mexicue
We rolled up and smoked this chicken burrito for you TreatYoSelf http://t.co/pxwVECzlsk	1442935345	646343802668589056	f	mexicue
Kale-ing me softly with Quinoa  http://t.co/rUpH5OdwYN	1442527446	644632948860436482	f	mexicue
RT @GFtravelers: Because what happyhour is complete without glutenfree chipsandguac?! Especially these @Mexicue NYC! gftraveler http...	1442354414	643907202357555200	f	mexicue
It's the perfect day for FalafelFriday in FiDi! Join us on Old Slip btwn Water & Front St until 3pm. vegan LebaneseLunch foodporn	1445003527	655018384938180608	f	toumnyc
@BroAkra we might be making an appearance next Thursday actually! We'll keep you posted 	1445003202	655017021856436224	f	toumnyc
What up Brooklyn?!? Join us in @DumboNYC on Jay & Water until 3pm! Your growling tummy will thank you! getinmybelly	1444915428	654648872225017857	f	toumnyc
@NYCFoodGuy it's being fixed... We just confirmed the location. Thanks!	1444840079	654332833801052160	f	toumnyc
@NYCFoodGuy yes :)	1444840036	654332653764767744	f	toumnyc
What's for lunch MidtownEast? Join us on 47th btwn Park & Lexington for a delicious LebaneseLunch	1444833289	654304355001180160	f	toumnyc
@NYCFoodGuy We're on 47th btwn Park & Lexington :)	1444833075	654303458842030080	f	toumnyc
@NYCFoodGuy awesome! See you soon!	1444758423	653990344015671296	f	toumnyc
Hello LebaneseLunchers! Join us on 52nd btwn 6th & 7th until 3pm today!	1444746660	653941005629157376	f	toumnyc
FalafelFriday is in effect in FiDi! Join us until 3pm on Old Slip btwn Water & Front St lebaneselunch glutenfree http://t.co/SNPg4LF8Iz	1444394122	652462356858056704	f	toumnyc
@alecappelbaum so happy you enjoyed it :) thanks for the shout out! weloveourfans	1444391767	652452478525534208	f	toumnyc
RT @alecappelbaum: Now hear this. There is pumpkinkibbeh to be had at the @ToumNYC foodtruck in Dumbo. And you can eat it while you stro...	1444391713	652452251613720576	f	toumnyc
RT @dumbolot: We got @ToumNYC @MexicoBlvd and @mausamnyc today	1444314921	652130162365042689	f	toumnyc
Brooklyn is where it's at today! Join us in @DumboNYC on Jay & Water St until 3pm! lebaneselunch http://t.co/kTIiVygdv9	1444312220	652118834174906368	f	toumnyc
Hello MidtownEast! Join us on 47th btwn Park & Lexington until 3pm. There's a lahem b'ajeen with your name on it! http://t.co/xKt1FqEoAL	1444224835	651752313787416578	f	toumnyc
Hello MidtownWest! Follow your lebaneselunch craving to 52nd btwn 6th & 7th! The beef kabab awaits! FoodPorn http://t.co/ObVBmgYVc7	1444137001	651383912241963008	f	toumnyc
RT @dumbolot: We're got @ToumNYC @MexicoBlvd and @dubpies today!	1444056325	651045532924833792	f	toumnyc
We're in @DumboNYC on this crisp Monday! Join us for a vegan falafel on Jay & Water St until 3pm! lebaneselunch http://t.co/IL43K8hQkw	1444051497	651025284699963392	f	toumnyc
A little too rainy for us today  We'll catch you in @DumboNYC on Monday! Have a great weekend everyone!	1443792370	649938424238075904	f	toumnyc
RT @dumbolot: We got @ToumNYC @MexicoBlvd and @mausamnyc today!	1443714029	649609837630894080	f	toumnyc
We love what these guys @whiskeygrade from Cleveland are doing @ http://t.co/H9bWFUEh6e http://t.co/drAO99wbg5	1445023367	655101599036133376	f	dubpies
Vintage inspired clothing fan, come check out http://t.co/Gwel5AAxFe @ Brooklyn Expo. Make a beeline to @whiskeygrade	1445023239	655101063763226624	f	dubpies
PieTruck's @ Brooklyn Expo now 'til 9pm. 72 Noble St @ Franklin St. Calling vintage enthusiasts! http://t.co/1PkYEun82s	1445021312	655092982882922500	f	dubpies
RT @AvecSans: OMACTUALG There are free @dubpies at tonight's show @PianosNYC. They heard a northern girl was coming.	1444954051	654810868484411396	f	dubpies
If reading correctly 25% prefer Twinkies...  what are we doing wrong!? ;-) RT @curmudgeonhugh: @dubpies as requested http://t.co/ygzaYUrn01	1444938815	654746963649269761	f	dubpies
Post pics or it didn't happen! MT @curmudgeonhugh: @dubpies had Twinkies v Lamington throwdown to show Americans real spongecake snacks	1444938380	654745138757898240	f	dubpies
RT @katybluewater: How I won his heart meatpie http://t.co/Md18WoZm8D	1444938252	654744603476660224	f	dubpies
Where the heck is the Pie Truck today & this week? - http://t.co/AXJsD7dfTz	1444929801	654709156755083265	f	dubpies
Yes, m'am!  See you there! RT @CalicoAvenger: @dubpies Is Sunday 10/18 a Food Truck Rally day?	1444929636	654708466364190721	f	dubpies
How is your Lamington party going!? Lovely morning tea, eh? RT @curmudgeonhugh: @dubpies 12 or 16 possible?	1444929326	654707165291134978	f	dubpies
PieTruck is outside 125 West 55th St, near 6th Ave until 2.30pm. Free sweet with any savory pie. Pls RT	1444923092	654681016808812544	f	dubpies
@curmudgeonhugh we can do 16, sure. We'll have then ready by 10am. Thanks. Knock on the door. Talk to Oliver	1444915445	654648944408924161	f	dubpies
@curmudgeonhugh how many do you need?	1444914526	654645086735704065	f	dubpies
RT @FlyingNun: Think I'm going to listen to the Gordons for the rest of the day - https://t.co/uime9s705h	1444881598	654506979071782912	f	dubpies
RT @95bFM: Fresh from @CMJ  in NYC, video highlights of the NZ Music Showcase, thanks to @newzealandmusic http://t.co/pO4GTBUIq7	1444881575	654506884024696832	f	dubpies
@lovejackpearl Tweet Of The Week.  DM you address we'll send you a pie coupon for next time! ;-) http://t.co/hE3CiQfB2e	1444870750	654461477345193984	f	dubpies
RT @lovejackpearl: Yes @dubpies, @mikejny came all the way from ROC for a pie and a roll! NZ KIWILunchDay KiwiOG http://t.co/kW9FoFumkK	1444870504	654460445978435584	f	dubpies
@manutaylor so cool to see you at @CMJ @NZMusic @BabysAllRight last night!  Enjoy NYC!	1444852251	654383886454128640	f	dubpies
FLATIRON PIETRUCK SPECIAL - Buy any savory pie today, get a FREE sweet (pie or Lamington) 'til 2.30pm (5th/20th) Pls RT	1444841305	654337976550473728	f	dubpies
PieTruck is @ 5th Ave & 20th St until to 2.30pm. flatiron nyc foodtruck savorypies	1444836772	654318966442209280	f	dubpies
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
We are at 47st between park av and Lexington av!	1442504215	644535513349791745	f	chefsamirtruck
We are at 52st and park av!	1442419405	644179791307010048	f	chefsamirtruck
We are parked at 56st and Broadway!	1441986877	642365639848558592	f	chefsamirtruck
We are 47st between park av and Lexington av!	1441900030	642001377896607744	f	chefsamirtruck
We are at 52st and park av!	1441813421	641638109432688640	f	chefsamirtruck
We're close today! !!	1441726709	641274415062347776	f	chefsamirtruck
Chemical brothers burning the stage! ! https://t.co/lqgLAYkab6	1441468011	640189357085839360	f	chefsamirtruck
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
W50th and 6th ave today HappyFriday ready by 11:30. Come grab a Bao fix http://t.co/AftidAx52K	1445008879	655040835407511552	f	kayanyc28
One more round this week at Charlton and Varick. Get ready at 11:45 http://t.co/voOo1ryZIb	1444923614	654683207498002433	f	kayanyc28
One more round this week at Charlton and Varick. Get ready at 11:45	1444920864	654671672742539264	f	kayanyc28
RT @hijinksandhalos: Crunchy vegetable spring rolls for lunch? Why, yes, please. Thanks @KayaNYC28. nomnom foodie foodporn http://t.co/o...	1444836849	654319285603581956	f	kayanyc28
Due to road construction, we're parking on Charlton and Varick today till 2:30 HUDSON soho taiwanese http://t.co/Nyj3xPoGtz	1444832694	654301858966700032	f	kayanyc28
RT @kristyyui: Best lunch I ever have! @KayaNYC28 @midtownlunch http://t.co/sPmNWraHH5	1444754229	653972753222107136	f	kayanyc28
What's up Midtown! We'll be at 50th & 6th until 2:30, so come grab some baos and popcorn chicken for lunch!! foodtruck	1444749149	653951445134352385	f	kayanyc28
Front and Adams till 2:30 ColumbusDay @DUMBOFoodTrucks http://t.co/Dl0zeKfCpF	1444662281	653587095089475584	f	kayanyc28
W50th and 6th ave. Ready by 11:30	1444402309	652496696572805120	f	kayanyc28
Varick and Charlton. Ready by 11:30	1444315003	652130508982218752	f	kayanyc28
New York Live on Channel 4 between 12:30 and 1pm! We are very excited! NewYorkLiveTV! NBClive NBC... https://t.co/OvER93Kvgu	1444229366	651771318841548800	f	kayanyc28
Greenwich and Park Place today. Get ready by 11:30	1444228718	651768603159584768	f	kayanyc28
RT @FoodosaurusRex: @LaurenScala4NY @NBCNewYork @newyorklivetv I love @KayaNYC28 !!	1444225692	651755910860136449	f	kayanyc28
RT @LaurenScala4NY: Today on @NewYorkLiveTV we're getting into some tasty street eats. Tune in! @kayanyc28 @cocoandco @polishcuisine http:/...	1444222406	651742125910986752	f	kayanyc28
Get ready by 11:30 at 50th and 6th ave	1444141482	651402705701748736	f	kayanyc28
Hi DUMBO sorry for update the Twitter late. We are still here in front and Adams st.@DUMBOFoodTrucks	1444064756	651080895638536193	f	kayanyc28
@mwmoretti hi we are in dumbo today	1444064683	651080589919936514	f	kayanyc28
50th and 6th ave. Ready by 11:30	1443796382	649955252225966080	f	kayanyc28
Varick and Charlton till 2:30. soho taiwAnese	1443710467	649594900166537221	f	kayanyc28
Greenwich and Park Place today. Ready by 11:30 lunchtime tribeca foodie	1443623408	649229745406631937	f	kayanyc28
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
Happy Tuesday Schnitzlers, we are on 52nd & 6th today.	1444146096	651422059399106562	f	schnitznthings
Mini crowd forming, come get a sandwich, you really won't regret it. 46th between 5th and 6th http://t.co/EJYNaKt1MB	1436803093	620623273919971328	f	mamasheros
Hey guys! Catch us at the Fair @ The Square in Westchester Sq in the Bronx. We will be leaving at 6 pm! See you there http://t.co/l3GMs5R7eu	1434812189	612272815853699073	f	mamasheros
RT @BigMangNate: had my first @MamasHeros today, pretty damn tasty and the sandwich was huge.  Def going to work it into the truck rotation.	1433544013	606953700939169792	f	mamasheros
RT @MatthewPizzulli: Yes!!!! They are back in midtown west! besttacos (at @ConeyShack in Brooklyn, NY) https://t.co/azuadDRyzn	1445018010	655079130061524992	f	coneyshack
@FrankieMontalvo yes we are!	1445017999	655079084893077505	f	coneyshack
RT @pawzee: Thank you @ConeyShack for the awesome at burrito I've ever tasted.	1445017992	655079054744358912	f	coneyshack
RT @tiarafrancis: I was gonna be healthy and get a salad for lunch but @ConeyShack ruined my plans. Damn you, damn you to delicious hel...	1445017986	655079032028033024	f	coneyshack
@FrankieMontalvo wassup Buddy sorry for the late response but we are at 48th and 6th	1445017282	655076080508915712	f	coneyshack
RT @MatthewPizzulli: @ConeyShack this brings joy to my heart!	1444930492	654712053274316801	f	coneyshack
RT @JayDesai80: @ConeyShack ahhhhhhhh, Nom nom nom.... http://t.co/RmMMgFamTF	1444922812	654679842311401472	f	coneyshack
Midtown here we go again  , 48th st & 6avenue 11:30 - 3pm	1444919061	654664109024088066	f	coneyshack
@GG_Cakes_NY sorry we mustve forgot to hit the tweet button we were at 47 park today, and will be at 48th st and 6th ave tomorrow.thursday	1444884885	654520765094711296	f	coneyshack
RT @cinemaparker: @ConeyShack Thank you for the amazing tacos today. See you next Tuesday! steak rib\ncalamari	1444860146	654417000790421504	f	coneyshack
RT @villagevoice: Favorite Dishes 5: @ConeyShack's Hainan Chicken Burrito http://t.co/lWUxo8NCZT http://t.co/0lwVY0nSOi	1444860134	654416951922556928	f	coneyshack
TACO Tuesday for Gotham City fiDistrict ,Hanover Sq & water st 11am-3pm http://t.co/ZvNnAOh189	1444728763	653865940766064640	f	coneyshack
selfie with a coney shack lover  http://t.co/Zn3YwL7sd2	1444705131	653766822483873792	f	coneyshack
48th btw 6 and 7th Ave. We are open 	1444663650	653592837481754624	f	coneyshack
RT @nicolephillips: Photo: The rest of my lunch from @coneyshack. Im addicted. lunch lunchtime coneyshack sofull... http://t.co/1IUBBh...	1444330283	652194594298417155	f	coneyshack
RT @alexditrolio: .@ConeyShack lunch date with @aaronhodges. absolute food heaven. foodgasm	1444330197	652194234670391296	f	coneyshack
Midtown New York City were back at it again , round 2 here we go 48th st and bwtn 6 &7th ave. Cone get your coney fix!	1444308447	652103008159944704	f	coneyshack
Midtown here we go again round 2 , 48th st between 6 and 7th ave 11~2:30 get your coney fix	1444308277	652102294767599616	f	coneyshack
@teaandmilk @jimmyfallon	1444227884	651765104401346560	f	coneyshack
We gotta date with you today Midtown @ 47th & Park ave 11- 3pm http://t.co/3frNZRruOl	1444223082	651744960727937024	f	coneyshack
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
Bessie the truck has been resting all week, but don't forget you can always have our tasty menu at @TheSeaport , 19 Fulton Street!	1445018032	655079222705278976	f	milktrucknyc
@mistervacation @houstonhallnyc @TheSeaport no, but there are awesome tater tots w/parmesan!	1444834486	654309375545315328	f	milktrucknyc
Bessie is closed for a private event but sandwiches are always at @houstonhallnyc and @TheSeaport! See you there.	1444831211	654295638771826688	f	milktrucknyc
No truck today, but @houstonhallnyc and @TheSeaport are always there as your daily go-to's for our sandwiches!	1444756043	653980364667535360	f	milktrucknyc
@jimsemail1 @truthys sorry my friend. we had a snafu and are not out today.	1444754342	653973227799203840	f	milktrucknyc
RT @PoachedNYC: Hey SUPER TRUCKERS who love GRILLED CHEESES @milktrucknyc is talkin to you\nhttp://t.co/L4dsdmCz1G\nBessie	1444704528	653764292651667456	f	milktrucknyc
Bessie's off the road today but we're at @TheSeaport until 7pm, 19 Fulton Street!	1444662265	653587029389873152	f	milktrucknyc
Bessie is at Wall St./William St today! Come celebrate Friday with our delicious sandwiches.	1444410014	652529013085179905	f	milktrucknyc
@Deazee1 we are open at Seaport until 6pm tonight.	1444325263	652173539039162368	f	milktrucknyc
Bessie is at 53rd & Madison today for lunch, and our great crew is at @theseaport all day as always!	1444321807	652159045038551040	f	milktrucknyc
RT @MediaStyleNYC: Keeping only that which sparks joy practicingwhatipreach closetcleanse mariekondomethod @ TriBeCa https://t.co/aWcj...	1444242244	651825334128648192	f	milktrucknyc
getting ready for the 1st sundaysuppers @stpaulschapel breakingbreadtogetherinservice https://t.co/eHK9kmArjJ	1443982343	650735231645913088	f	milktrucknyc
Hey folks - today we're at Breeze Hill @smorgasburg , @theseaport (yay!) AND truck @ Grand Army Plaza.  3 awesome locations. See you there!	1443967209	650671752356364289	f	milktrucknyc
.@TheSeaport is closed today due to weather, but we're at Williamsburg @smorgasburg and Ft. Greene Flea! Stay dry, eat cheese.	1443880818	650309402411405312	f	milktrucknyc
Bessie is now at Church Street between Walker & Lispenard. See you there!	1443800350	649971897778765825	f	milktrucknyc
Update: the truck is moving from Wall St! Stay tuned for new location.	1443799799	649969583588249600	f	milktrucknyc
Bessie is at Wall St/William St, along with @theseaport! Cheers to grilled cheese and Fridays.	1443794407	649946969075355648	f	milktrucknyc
Rabbit rabbit! Bessie is at 53rd & Madison today, call 646-504-6455 to pre-order. Also at @TheSeaport and sandwiches at @houstonhallnyc	1443708011	649584597320142848	f	milktrucknyc
Bessie's taking the day off, but we're at @TheSeaport rain or shine! Hope to see you there for some good eats!	1443622221	649224766499504130	f	milktrucknyc
RT @SheKnows: .@VanessaSchenck @tiagirlclub wants to give tweens language of empowerment ThePitch http://t.co/iA2E154uUy http://t.co/APGe3...	1443546143	648905673460318208	f	milktrucknyc
Danny Meyer Restaurants to Eliminate Tipping http://t.co/I7ObBF2MVQ via @NYTimes http://t.co/Hb3BjK80QI	1445035534	655152632798052352	f	souvlakitruck
Essential NYC Neighborhood Restaurants, According to @Infatuation: http://t.co/E22KYZ07jU http://t.co/vFGPNGsWHH	1445016326	655072068749381632	f	souvlakitruck
Please continue to vote for us in @Scoutology's Food Truck Fight! http://t.co/JYwKLm6qJ9 http://t.co/WMOv1vUkWk	1444928452	654703497015758852	f	souvlakitruck
What Time Is Peak Foliage in NYC? Find out on @Gothamist: http://t.co/VKHzyHUW7k http://t.co/obm1doWKED	1444757714	653987371839569924	f	souvlakitruck
RT @randomfoodtruck: Our trusty @souvlakitruck is back for lunch today!	1444752185	653964179724963840	f	souvlakitruck
Keep your eyes peeled for a splash of Mykonos blue at @NY_Comic_Con... we are here with the truck all weekend! NYCC http://t.co/X9qeXm1aP9	1444514112	652965629314629632	f	souvlakitruck
It's @NY_Comic_Con time! We're here with the truck, stop by + grab lunch! NYCC NYCC2015 http://t.co/kcW1iXRdk0	1444502576	652917245547515905	f	souvlakitruck
If you're at @NY_Comic_Con, pay our truck a visit! We will be here all weekend! NYCC NYCC2015 http://t.co/70EKzuwuHS	1444428616	652607035234746372	f	souvlakitruck
We are at @NY_Comic_Con all weekend! Come find us for a bite to eat. NYCC NYCC2015 @javitscenter http://t.co/2kdULEhp3S	1444414761	652548920594173952	f	souvlakitruck
Thanks to @livefastgroup and @centerplate we will be vending @NY_Comic_Con at the @javitscenter! NYCC http://t.co/Z2UPh2429V	1444324516	652170407055855616	f	souvlakitruck
Proud to be at @NY_Comic_Con! Who's coming to join in the fun? NYCC2015 NYCC http://t.co/N8qtk4zOoV	1444321730	652158721192148992	f	souvlakitruck
This Is What All Those Confusing Food Labels Really Mean http://t.co/qI5SQZ3htP via @huffposttaste http://t.co/8jchiWddcI	1444233346	651788011345195008	f	souvlakitruck
Please keep voting for us to win the NYC Food Truck Fight! @ScoutologyNYC http://t.co/7ikoD7n9N3 http://t.co/nKvI5YtFi7	1444148445	651431910531592192	f	souvlakitruck
30 Ways The World Combines Bread And Cheese http://t.co/CiKTki8ro1 via @foodrepublic http://t.co/U7GBC6fYMt	1444071024	651107185473232896	f	souvlakitruck
Please continue to vote for us to win The Best Food Truck in NYC! @ScoutologyNYC http://t.co/LWDkZv0aNz http://t.co/r9205rMKTu	1443975637	650707102504239105	f	souvlakitruck
Brunch doesn't have to mean pancakes. Grab a meal on the go from our truck! http://t.co/vwoPLQbXMV	1443887726	650338377699586048	f	souvlakitruck
RT @ScoutologyNYC: Get Your Votes In For Your Favorite NYC Food Truck! @Scoutology @souvlakitruck @PontiRossiFood @waffletruck \n\nhttp://t....	1443802173	649979543529345025	f	souvlakitruck
Happy Friday! Celebrate with a Shrimp Pita. http://t.co/1A3EGapRFw	1443801724	649977658076459011	f	souvlakitruck
The New York City Greek Film Festival Kicks Off Today | By @GreekReporter  http://t.co/yXVeMsT4NF http://t.co/L08RKDuMfX	1443800749	649973571234734080	f	souvlakitruck
RT @randomfoodtruck: Fortify yourself before the storm! @CarpeDonutNYC @carlssteaks @souvlakitruck @gcnyc1	1443800255	649971497306583040	f	souvlakitruck
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
Good morning NYC\nRise & shine!!\nBreakfast is served\n52nd and park is the place.	1443524887	648816518973771776	f	etravaganza
Good morning.\nWe are back to our usual location Northeast 52nd and Park\n join us for delicious breakfast.	1443094980	647013360165355520	f	etravaganza
Good morning.\n we are currently located at Southwest 53rd between Park and Madison.	1443007373	646645910252986368	f	etravaganza
start off your day with... http://t.co/wRGfCxHY0o	1442987147	646561075610165248	f	etravaganza
Good morning NYC\nBack to Reality..!	1442838655	645938252525010945	f	etravaganza
Deliciosos tacos..taco Tuesday. \nJoin us.	1442330473	643806783191023616	f	etravaganza
L'Shana Tova!!!	1442276320	643579650434801664	f	etravaganza
Ready. set....lunch!	1442246572	643454880229781505	f	etravaganza
RT @TrudiiBee: @KettleCornNYC Seriously one of the best things in NYC 	1445031789	655136925502849026	f	kettlecornnyc
Good Evening\nWe relocated to the\nUpper Eastside\n86th and Lexington \nUntil 8:30 pm\nkettlecornnyc http://t.co/lQiNCQcBkR	1445027024	655116940596252672	f	kettlecornnyc
Happy Friday, New York City\nWe are located at \n40th street and 6th avenue \nUntil 3:30 pm\nkettlecornnyc http://t.co/E6LMjGbTPM	1445007408	655034662432198656	f	kettlecornnyc
@TrudiiBee we are so happy you enjoyed 	1444959846	654835172441985024	f	kettlecornnyc
Hello New York \nWe are located on\nThe Upper Westside \nColumbus Avenue \nBetween 97th and 98th Street \nUntil 8:30... http://t.co/LtAVedmyY4	1444939722	654750768180760577	f	kettlecornnyc
Good Morning Upper Westside\nWe are located at \nColumbus Avenue \nBetween 97th and 98th Street \nUntil 8:30 pm... http://t.co/wZcdBCavrp	1444916525	654653472625680385	f	kettlecornnyc
@etherealdavid I'll put in a request	1444858416	654409747458879489	f	kettlecornnyc
Good Evening NYC\nWe relocated to the Westside\nOn 67th Street and Columbus \nUntil 8:30pm \nkettlecornnyc	1444858091	654408381105577984	f	kettlecornnyc
@etherealdavid we have it. Ask for fruity madness.	1444857473	654405789264793600	f	kettlecornnyc
@etherealdavid yes!	1444856275	654400765776281600	f	kettlecornnyc
@etherealdavid hello, today we are located at 67th and Columbus. Tomorrow we are planing to be located at 99th and Columbus.	1444855797	654398762513772544	f	kettlecornnyc
Good Morning NYC\nWe are located at\n40th street and 6th Avenue \nUntil 3:30pm \nkettlecornnyc http://t.co/Ofvr9OTHBd	1444834870	654310985969233920	f	kettlecornnyc
Good evening midtown \nWe are located at \n40th Street and 6th Avenue \nUntil 8pm \nkettlecornnyc http://t.co/lgdZ8y7xTf	1444768831	654034000000872448	f	kettlecornnyc
Good afternoon midtown \nWe are located at \n40th Street and 6th Avenue \nUntil 8pm \nkettlecornnyc http://t.co/5EVZBdfJAR	1444753076	653967919890587648	f	kettlecornnyc
Come join us at a Street Fair \nLocated in Astoria Queens \non Broadway, Between \n37th and 38th Street\nUntil 5:00pm... http://t.co/ihiPhxG6z5	1444665028	653598618822160384	f	kettlecornnyc
http://t.co/25nOme11Cl	1444664956	653598315439779841	f	kettlecornnyc
Come join us at a Street Fair \nLocated in Astoria Queens \non Broadway, Between \n37th and 38th Street\nUntil 5:00pm... http://t.co/rMaDuP2Yl7	1444664916	653598149529968640	f	kettlecornnyc
@HiFiGuy197 we are in Astoria Queens today/Broadway @ 38th	1444663052	653590331137617920	f	kettlecornnyc
http://t.co/vTo9SHpzqL	1444613917	653384245067386880	f	kettlecornnyc
http://t.co/jqfphazQ23	1444613322	653381746784792576	f	kettlecornnyc
Today's vibes in Union Square-giving out free pizza Photo credits to: @theknowitallsnyc http://t.co/nzSfoHgK5R http://t.co/fldgxWqryY	1444951699	654801002583822336	f	neaexpress
RT @ringol: @NeaExpress is giving out free pizza! Love working in Union Square!!	1444939316	654749063678562309	f	neaexpress
RT @greenboxny: A true necessity. @APPLEOFFIClAL, get on it.  pizza pizzalove emoji http://t.co/UvhV2X8tAW	1444939306	654749023312592896	f	neaexpress
Who knew there was a piece of the Berlin Wall in NYC? @neaexpress took a field trip there ... http://t.co/kK5XlWbtIU http://t.co/0gDJGCF7mr	1444769534	654036947225198592	f	neaexpress
@wondergiulio tasting a new recipe at @neaexpress today: https://t.co/gHg0UmNz3r goodeats organic pizzaofnyc	1444764822	654017183052374016	f	neaexpress
@Stephluva2711 We have another event scheduled for this weekend but we'd love to see you stop by our Wall Street or Harlem stores!	1444764367	654015277999489024	f	neaexpress
@NeaExpress is at @SetonHall today! Stop by to reclaimyourlunchbreak.	1444407938	652520302602289152	f	neaexpress
Guests at the Toys R Us National HQ event this past weekend had a chance to sample delicio... http://t.co/HzEhuMW6Jo http://t.co/CrgNKzH3vy	1444159433	651477996956700673	f	neaexpress
.@DoolitleJewelry BigRed is open at 45th and 1st! lobsterlunch	1444922887	654680159111348225	f	lobstertruckny
Today's truck is parked at @BlmfldCollegeNJ! Here's a few students grabbing a slice for lunch- http://t.co/BCudwkalWD	1444156980	651467711961284608	f	neaexpress
RT @NYAMHistory: Try organic pizza from the @NeaExpress truck at our 10/17 NYAMEats Festival. Register: http://t.co/5Y3UwFi5rX http://t.c...	1444156775	651466851915038721	f	neaexpress
We got an A...second time within 4 months...during a lunch rush...in the financial distric... http://t.co/barkHhkmWK http://t.co/t2sj8h1DNq	1444070091	651103272200179712	f	neaexpress
Today's truck location: flikexpo at the Toys R Us in Wayne, NJ from 1-2:30. See you there!	1443892776	650359560105033733	f	neaexpress
Celebrate WorldVegetarianDay by coming by @NeaExpress for one of our five vegetarian pizza options, a delicious sandwich, or a salad!	1443736363	649703516848701440	f	neaexpress
Instagram your @neaexpress pizza at a cool NYC location & use the tag wherehasyourpizzabeen- whoever has the best post wins a free pizza!	1443731103	649681453924634625	f	neaexpress
Neapolitan's Margherita pizza in front of the New York Stock Exchange\n\nThis is the first p... http://t.co/j3FwjOPwaR http://t.co/a40nOla5hz	1443647869	649332345355534337	f	neaexpress
 day in NYC... brighten it by stopping by @NeaExpress for a delicious personal pie!	1443640046	649299532191244293	f	neaexpress
RT @heidelindgren: Watched on Periscope: Watch Pope Francis go by @NeaExpress ss!! https://t.co/vxP7ZaLKVD	1443627952	649248805917999104	f	neaexpress
@Stephluva2711 We will be updating our location daily on our Twitter page!	1443118909	647113726571749377	f	neaexpress
RT @ResLife_MC: Stop by the food truck, it's here until 6 at Kelly Common's. Grab some yummy pizza @NeaExpress MCDining ResLife_MC http:/...	1443118858	647113512553160704	f	neaexpress
Love neapolitanexpress but not in the mood for pizza? No problem! Our menu features three... http://t.co/9eH1SYYCmF http://t.co/KaxMIaqNNO	1442950532	646407499969613824	f	neaexpress
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
oldtraditionalpolishcuisine catering nyc polish food pierogi kielbasa http://t.co/T1kQ74ExfW	1445036800	655157941717176321	f	polishcuisine
pierogi lunch catering lunch nyc http://t.co/1Xj8dU5V7N	1445036514	655156745023725568	f	polishcuisine
oldtraditionalpolishcuisine salad lunch catering nyc food truck http://t.co/tFVYtzuGGc	1445036390	655156222556033024	f	polishcuisine
oldtraditionalpolishcuisine donats paczki mineral zywiec http://t.co/z0M6VmIavm	1445036283	655155774813921280	f	polishcuisine
oldtraditionalpolishcuisine kielbasa grill catering lunch http://t.co/31Hbf1CrfQ	1445036185	655155364871196672	f	polishcuisine
RT @PolishEmbassyUS: Are you celebrating? \nBePolishBeProud\n\nImage: Integra Communications http://t.co/qufOE5QQQI	1445033299	655143260197928960	f	polishcuisine
Have a wonderful Fall NYC weekend everyone!	1445029497	655127312619278336	f	polishcuisine
Let's get this Friday started! 47th b/w Park & Lexington midtown lunch extraordinary HuntersStew special still in effect!	1445007906	655036750939623424	f	polishcuisine
oldtraditionalpolishcuisune tymbark zywiec lunch  nyc http://t.co/9NmaT6MNG0	1445005148	655025186664751104	f	polishcuisine
It's Friday and best way to have a traditional lunch is 47th bw Park & Lexington.. HuntersStew special NYC	1444997436	654992836350218242	f	polishcuisine
oldtraditionalpolishcuisine food truck catering lunch nyc http://t.co/o2sC9tCicq	1444957180	654823993900453888	f	polishcuisine
oldtraditionalpolishcuisine paczki donats polish desert catering nyc http://t.co/v7qhl2wRbM	1444956975	654823134068109312	f	polishcuisine
oldtraditionalpolishcuisine kielbasa lunch catering midtown nyc traditional polish http://t.co/wPw9piUfkV	1444956848	654822598153400321	f	polishcuisine
oldtraditionalpolishcuisine food truck combo pierogi kielbasa lunch http://t.co/WWSmLXwW6n	1444956676	654821879509684224	f	polishcuisine
oldtraditionalpolishcuisine grill kielbasa lunch catering midtown nyc http://t.co/mE0kXmhHJB	1444956558	654821383839453185	f	polishcuisine
oldtraditionalpolishcuisine pierogi lunch nyc http://t.co/pKPNQapBCT	1444922611	654679001194061824	f	polishcuisine
What's for midtown lunch today? Special Hunters Stew PolishTruck 47th b/w Park & Lexington @Cheap_eats @Zagat http://t.co/SisF0uXXHA	1444920738	654671141638836225	f	polishcuisine
HuntersStew special 47th b/w Park & Lexington today! GetReady NYC PolishTruck @nycfoodtruck http://t.co/MEuklBorbB	1444920326	654669414852243458	f	polishcuisine
@cougar0197 We always post location in the morning....we serve lunch until 2/2:30	1444918199	654660495287320576	f	polishcuisine
We are back at it again! 47th bw Park & Lexington special HuntersStew Let's do lunch NYC	1444910405	654627804777086976	f	polishcuisine
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
Good morning nyc we r open at 47th st btween park and lex ave! Thank you	1439395101	631494943199096832	f	bobjotruck
Welcome Monday!! We r open at king and Hudson st. Try out Korean BBQ-beef,pork,shrimp . And we have also tofu,dumpling 4 vegetarian	1439222334	630770304856530944	f	bobjotruck
THIS SUNDAY OCT.18TH \nDON COQUI'S NEW ROCHELLE \nDAY BRUNCH PARTY \nWE ARE THE ONLY DAY BRUNCH PARTY... https://t.co/d5HBAwzIsT	1445069656	655295749702459392	f	latinkitchennyc
GOOD MORNING  BRONX NY!!\nAUTHENTIC PUERTORICAN CUISINE \nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX... https://t.co/pDSauxFBmb	1445069607	655295545569910784	f	latinkitchennyc
THIS SUNDAY OCT 18TH\nSUNDAY DAY BRUNCH\ndoncoqui.newrochelle \n@stephsdope \nRSVP NOW 914-648-4848 @ DON... https://t.co/BqpM2iEvSu	1445069512	655295148881027072	f	latinkitchennyc
LAST CALL RSVP NOW... WE ARE ALMOST DONE!!!\n914-648-4848\n\nTHIS SUNDAY OCT.18TH \nDON COQUI'S NEW... https://t.co/zqwhkcXdYN	1445041482	655177578806976512	f	latinkitchennyc
MOFONGO Y CHURRASCO\nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX NY 10465\n347-691-3100 @ Mi Viejo San... https://t.co/LT8To6PY8S	1445034419	655147954282627072	f	latinkitchennyc
TONIGHT FRIDAY OCT.16TH  WE \ndoncoqui.whiteplains \nDj LUCHO LIVE 10PM-1\nTHEN WE HEAD OVER TO... https://t.co/rn85tizHG6	1445025297	655109694994956288	f	latinkitchennyc
YEA..... ESE CHICHARON DE POLLO..\nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX NY... https://t.co/qWecnVdBtq	1445024924	655108131849113601	f	latinkitchennyc
TGIF!!!!\nGOODMORNING BRONX NY! \nMOM IS COOKING!!!\n2920 BRUCKNER BLVD \nBRONX NY... https://t.co/irEIKwKFSO	1445014762	655065507058569216	f	latinkitchennyc
OUR SANCOCHO WITH SLICED AVOCADO AND SARACHA SAUCE..\nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX NY... https://t.co/N7FiekEf0i	1445003541	655018445654880256	f	latinkitchennyc
GOOD MORNING  BRONX NY!!\nAUTHENTIC PUERTORICAN CUISINE \nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX... https://t.co/HQOkGdrQ7Y	1445003364	655017703917383680	f	latinkitchennyc
GOOD MORNING BRONX NY! \nAUTHENTIC PUERTORICAN CUISINE AT ITS BEST! \nMI VIEJO SAN JUAN \n2920 BRUCKNER... https://t.co/y5TSDx1QbL	1445003129	655016716112646144	f	latinkitchennyc
THIS SUNDAY OCT 18TH\nSUNDAY DAY BRUNCH\ndoncoqui.newrochelle \n@stephsdope \nRSVP NOW 914-648-4848 @ DON... https://t.co/pyMmEI5wLz	1444969377	654875148705792000	f	latinkitchennyc
THIS SUNDAY OCT.18TH \nDON COQUI'S NEW ROCHELLE \nDAY BRUNCH PARTY \nWE ARE THE ONLY DAY BRUNCH PARTY... https://t.co/yqZ7aTEl9T	1444968759	654872557695406080	f	latinkitchennyc
HOST\n@stephsdope  &\njimmydoncoqui\nTHIS SUNDAY OCT.18TH\ndoncoqui.newrochelle \nRSVP... https://t.co/4KOY5WUM4z	1444936053	654735380097269760	f	latinkitchennyc
THIS SUNDAY OCT.18TH \nDON COQUI'S NEW ROCHELLE \nDAY BRUNCH PARTY \nWE ARE THE ONLY DAY BRUNCH PARTY... https://t.co/UfQ1ej823F	1444934877	654730446752739328	f	latinkitchennyc
IT'S THURSDAY \nWE ARE OPEN FOR LUNCH & DINNER  12PM-10PM\nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX... https://t.co/2wi9NmW6Bu	1444927733	654700483777441792	f	latinkitchennyc
JIBARITO DE BISTEC CON ARROZ DE GANDULES\nEN ENGLISH:\nSTEAK JIBARITO WITH PIGEON PEA RICE...YUM!\nMI... https://t.co/QjgFJIKCYC	1444927580	654699841021280256	f	latinkitchennyc
THIS SUNDAY OCT 18TH\nSUNDAY BRUNCH DAY PARTY\ndoncoqui.newrochelle \nRadio Video & Magazine Vixen your... https://t.co/Oz8sfHqbNS	1444881220	654505395143184384	f	latinkitchennyc
THIS SUNDAY OCT 18TH\n@stephsdope \ndoncoqui.newrochelle \nTHE 1 SUNDAY BRUNCH PARTY IN THE TRISTATE... https://t.co/v3yidMs5K4	1444880938	654504210814377984	f	latinkitchennyc
NOT EVEN GONNA BLOW ANYTHING UP... BUT WE HERE EACH AND EVERY SUNDAY STRONGER THAN EVER!\nDON COQUI... https://t.co/OEguKTwDMI	1444880078	654500603771645952	f	latinkitchennyc
Have a good weekend peeps!  Still working on 483GrandSt. Hope to have more updates soon.	1445023163	655100745096777732	f	fritesnmeats
RT @markh314: @fritesnmeats make sure u all check out their bar/rest. Coming soon to Brooklyn 483 Grand. bestburger killerfries http://t....	1445021033	655091809618698240	f	fritesnmeats
@markh314 Thx bud. Have a good weekend!	1445020667	655090275363196929	f	fritesnmeats
@markh314 will be here till 2 bud. Come on down!	1445015578	655068930382413824	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water & pearl at. Burger of the week THE CHEVRE TRUFFLE BURGER. Preorder 9172929226 fidi	1445002386	655013599224688641	f	fritesnmeats
Peeps, we are off the road 2day	1444917783	654658751236935681	f	fritesnmeats
Peeps, we are off the road 2day	1444829674	654289194555179008	f	fritesnmeats
Peeps- we will be off the road for the next few days. See u soon !	1444657985	653569076598558720	f	fritesnmeats
@demodisping Thx for that. We should be good now.	1444657927	653568834947969024	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water & pearl. Burger of the week THE CHEVRE TRUFFLE BURGER. Preorder 9172929226 fidi	1444399238	652483812107153409	f	fritesnmeats
Peeps, we are off the road 2day	1444312784	652121198374060032	f	fritesnmeats
Lunch 2day @ Hudson & King. Burger of the week THE CHEVRE TRUFFLE BURGER. preorder 9172929226 soho	1444225663	651755786377502720	f	fritesnmeats
Peeps, we will be serving up the @MakersMark Kobe Burgers  Marinated Kobe Patty and marinated onion jam and oven roasted tomatoes!	1444139573	651394701665415169	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE CHEVRE TRUFFLE BURGER. Preorder 9172929226 fidi	1444139542	651394570148839424	f	fritesnmeats
Peeps, we are serving it up @ 47th st & Vanderbilt! Here until 2:30	1444061620	651067742309756928	f	fritesnmeats
Lunch 2day @ 47th & Vanderbilt. Burger of the week THE CHEVRE TRUFFLE BURGER preorder 9172929226 midtown	1444057800	651051720517263360	f	fritesnmeats
Peeps we can NOT park on 46th & 6th. Instead we will be on 47th & Vanderbilt	1444057725	651051402840666112	f	fritesnmeats
Peeps, we will be serving up the @MakersMark Kobe Burgers  Marinated Kobe Patty and marinated onion jam and oven roasted tomatoes!	1444053804	651034960711819264	f	fritesnmeats
Peeps, we are off the road today	1443790563	649930846712020992	f	fritesnmeats
Peeps, we will be serving up the @MakersMark Kobe Burgers  Marinated Kobe Patty and marinated onion jam and oven roasted tomatoes!	1443707792	649583679325515776	f	fritesnmeats
We are @starrettlehigh till 2 today on the2nd floor!	1445010992	655049696893915136	f	sweetchilinyc
Come see us for lunch in the @AmericanExpress cafeteria @BrookfieldPLNY 1130-230! businesslunch thaietnamese foodtrucks amex	1444917327	654656836260397056	f	sweetchilinyc
Need your humpdaymotivation? ? Come to broadway btw houston & bleeker 1130-3! Get your thaietnamese on! WednesdayMotivation	1444835305	654312813494673408	f	sweetchilinyc
Lets do lunch @dumbolot jay & water till 3! thaietnamese sunisshining eatoutside pork vegan chicken	1444750404	653956712253292544	f	sweetchilinyc
Have a great holiday monday!  See you tomorrow @dumbolot	1444664263	653595410817241093	f	sweetchilinyc
@snescat thanks!!	1444594980	653304815267745792	f	sweetchilinyc
Last day at @NY_Comic_Con 11-5! @javitscenter NYCC thaietnamese foodtrucks	1444573490	653214678341054464	f	sweetchilinyc
We are @NY_Comic_Con all weekend thanks to @centerplate @livefastgroup @javitscenter NYCC thaietnamese foodtrucks http://t.co/8qrMZo7RXv	1444482776	652834196654813184	f	sweetchilinyc
Thanks to @livefastgroup and @centerplate we will be vending @NY_Comic_Con from this Thursday though Sunday at the @javitscenter NYCC NYC	1444403341	652501023630622724	f	sweetchilinyc
Come see us @NY_Comic_Con from this Thursday though Sunday at the @javitscenter NYCC NYC NYCC2015 today thru sunday! @ThatKevinSmith 	1444314999	652130491961704448	f	sweetchilinyc
RT @lfatidiotl: So pumped to see @SweetChiliNYC outside NYCC. NYCC2015 NYCC	1444313393	652123752688418816	f	sweetchilinyc
hanks to @livefastgroup and @centerplate we will be vending @NY_Comic_Con from this Thursday though Sunday at the @javitscenter NYCC NYC	1444267244	651930190399041536	f	sweetchilinyc
@truthtrebles so sorry about that! We ran out of pretty much everything!	1444247260	651846371838951424	f	sweetchilinyc
Its lunch time on broadway btw houston & bleeker till 3! thaietnamese	1444233284	651787752078508032	f	sweetchilinyc
@daviebhoy25 we are working on it!!	1444168763	651517130370850816	f	sweetchilinyc
Thanks to @livefastgroup and @centerplate we will be vending @NY_Comic_Con from this Thursday though Sunday at the @javitscenter NYCC NYC	1444164503	651499265580232704	f	sweetchilinyc
Hey Brooklyn we are on jay & water 1130-3 @dumbolot so come by and get your sweet heat on! thaietnamese sunisshining eatoutside	1444142776	651408135148716032	f	sweetchilinyc
RT @dumbolot: We got @KimchiTruck @SweetChiliNYC and @carlssteaks today!	1444139188	651393085717544960	f	sweetchilinyc
RT @nokidhungry: TeamNKH is growing. Be part of the movement. http://t.co/gzDcQAi3PZ NoKIdHungry MakeADifference http://t.co/UvX8pqenZR	1443969511	650681409842114560	f	sweetchilinyc
No truck today. Stay warm and dry everyone!	1443794639	649947940832849921	f	sweetchilinyc
Happy Friday Schnitzlers,  we are on 47th & Park today.	1445009416	655043088075870208	f	schnitznthings
We have bratwurst today!	1444925096	654689422235992064	f	schnitznthings
Hey guys, we are on 26th street, West side to 11th ave today.	1444922997	654680616697401345	f	schnitznthings
Hey Schnitzlers we are on 47th & Park today	1444838280	654325289565163520	f	schnitznthings
Come by for your Schnitzel lunch. We are on 52nd & 6th today	1444751817	653962637290680320	f	schnitznthings
RT @Mets: Want to go to tonight's game? Retweet this for your chance to win a pair of tickets.	1444742796	653924800474312704	f	schnitznthings
Hey guys, we are on 47th & Park today.	1444663939	653594050470248448	f	schnitznthings
Schnitzel for lunch!  We are on 47th & Park today.	1444403524	652501792605999104	f	schnitznthings
Come get your Schnitzel, we are on 52nd & 6th ave today.	1444316576	652137105305432064	f	schnitznthings
Goodafternoon! We are open 47 and park ave,come by and grab some schnitzel!	1444232739	651785467596283904	f	schnitznthings
Hey guys we will be on 47th & Park today, Come get your schnitz.	1444232030	651782494073802752	f	schnitznthings
Hey everyone,we are 47 st. Lex to park ave!	1444149470	651436211798700032	f	schnitznthings
Sorry guys ,the building management from 52 st. asked us to leave.no schnitzel today.	1444147814	651429264538083329	f	schnitznthings
Youtube star @ChloeTemtchine is here live!!! 47 and park ave!!\nHeart2cureph \nCome schnitz with us!!	1444059030	651056876667412481	f	schnitznthings
Hey everyone! We are on 47 amd park ave today!	1444058755	651055725259681792	f	schnitznthings
Hey guys, we are on Broad & Pearl today.	1443796952	649957644149628928	f	schnitznthings
Hi guys. We are on 26th street West to the 11th ave.	1443717862	649625914377154560	f	schnitznthings
Schnitzel for lunch!  We are on Pearl & Broad today.	1443624690	649235124823924736	f	schnitznthings
Sorry 52nd street. Too many trucks parked and we have no parking.  We will keep you posted on where we will be today.	1443542015	648888359167897600	f	schnitznthings
TRUCK UPDATE:\nKastaar @ W 4th St, btwn Washington Sq & Mercer St til 10PM\nMomma Truck @ Astor PL, E 8th St btwn 4th Ave & 3rd Ave til 1AM	1445039716	655170173259923456	f	waffletruck
To address complaints Spekuloos is too delicious, we would like to say SorryNotSorry. Stock up before de holidays! http://t.co/8mbTlxY0Ch	1445027586	655119294586617856	f	waffletruck
RT @jasminerodingus: @waffletruck late night simpin' :-/ http://t.co/4YFhrCcazI	1445003588	655018643743490048	f	waffletruck
For one free dinges, do an impression of your favorite internet meme! dingesforeveryone http://t.co/g85ISKRt91	1445003338	655017593884057600	f	waffletruck
De CARTS (1/2):\nGoesting @ 66th & Broadway til 10pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm	1444995916	654986460978921472	f	waffletruck
THANK DINGES IT'S FRIDAY\nLe Cafe @ 15 Ave B til 11pm\nWafel Cabana @ 35th & Broadway til 10pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1444995912	654986447745847296	f	waffletruck
De CARTS (2/2):\nVedette @ 60th & 5th Ave (Manhattan) til 7pm\nBierbeek @ De Great Lawn, Central Park til 7pm	1444995912	654986446055579648	f	waffletruck
De TRUCKS:\nKastaar @ 60 Wall St til 4pm\nMomma Truck @ E 40th & Park Ave til 4pm	1444995901	654986401633685504	f	waffletruck
Check out this cool 3D printed Wafel, thanks @iMakrNYC looks good enough to eat! https://t.co/cEODeldbUU	1444932086	654718739259129856	f	waffletruck
For one free dinges, name a song that always pumps you up! dingesforeveryone	1444920383	654669656670629888	f	waffletruck
De TRUCKS:\nKastaar @ Queens College (Kissena Blvd & 64th St) til 10pm\nMomma Truck @ Hudson St (btwn King & W Houston) til 4pm	1444918174	654660387959255040	f	waffletruck
De CARTS 2/2:\nPagadder @ Brooklyn Bridge/City Hall til 9pm\nGoesting @ 66th & Broadway til 10pm	1444918159	654660328576303104	f	waffletruck
De CARTS 1/2:\nVedette @ 59th & 5th Ave (Manhattan) til 7pm\nBierbeek @ De Great Lawn, Central Park til 7pm	1444918150	654660290777223168	f	waffletruck
TREAT YOURSELF THURSDAY \nLe Cafe @ 15 Ave B til 11pm\nWafel Cabana @ 35th & Broadway til 10pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1444918127	654660192072658951	f	waffletruck
RT @daveandhisego: Just had the WMD at @waffletruck in NewYork and it was the best!! http://t.co/rZkRfE9ipb	1444870155	654458984578031616	f	waffletruck
NationalDessertDay For one free dinges, what is your favorite dessert? dingesforeveryone	1444835494	654313605685448705	f	waffletruck
De TRUCKS:\nMomma Truck @ 44th Dr (btwn 23rd St & Hunter St) til 4pm\nKastaar @StJohnsU (DAngelo Center) til 10pm	1444826105	654274226053087232	f	waffletruck
De CARTS 2/2:\nPagadder @ Brooklyn Bridge/City Hall til 9pm\nGoesting @ 66th & Broadway til 10pm	1444826062	654274044599115776	f	waffletruck
De CARTS 1/2:\nVedette @ 59th & 5th Ave (Manhattan) til 7pm\nBierbeek @ De Great Lawn, Central Park til 7pm	1444826051	654273999212515328	f	waffletruck
WAFEL CRUSH WEDNESDAY\nLe Cafe @ 15 Ave B til 11pm\nDe Wafel Cabana @ 35th & Broadway til 10pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1444825744	654272711120826368	f	waffletruck
Man Still Standing, for now. @adamrichman getting ready to be K(or)illa-ed by our Ribs and Murder... https://t.co/LcIhSM45Vr	1445041077	655175881384730624	f	korillabbq
Team Korilla going to KILL IT tonight at ThrillistBBQ NYCWFF! forkyeah @nycwff @thrillist Korilla... https://t.co/7boMb6CqSN	1445037634	655161439364194304	f	korillabbq
Thanks StanleyTucci for joining us today! korilla http://t.co/naPpYRFjNf	1445035846	655153940712026112	f	korillabbq
RT @chenna_benna: @KorillaBBQ @AdamRichman @Thrillist @NYCWFF Heck yeah! I'll be there. Can't wait to chow down on some BBQ and meet Adam!	1445029274	655126376752795648	f	korillabbq
Get ready for ThrillistBBQ 2nite w  K(or)ILLA Ribs w Pineapple Gochujang! NYCWFF https://t.co/tpaaXWmeGv http://t.co/GidKGaJRhn	1445010404	655047229032538112	f	korillabbq
Gmorning Midtown! 47th & Park ready by 12!	1445009167	655042042939199488	f	korillabbq
Either way, it's cool!  https://t.co/CfR9G2ZmvL	1444964590	654855072942313472	f	korillabbq
RT @sspaz1000: Deliciousness NYCC Korilla BBQ food truck. https://t.co/Fab28N3PIj	1444964555	654854925952929792	f	korillabbq
RT @KeenanKid1: Hanging out... eastvillage nyc korilla @ East Village, Manhattan https://t.co/FRrgFHk31o	1444964550	654854902733275136	f	korillabbq
RT @CinemaSuicide: ThingsILearnedAtComicCon Do not eat IN The Javits Center. Eat at the food trucks. Korilla burritos  are a gift from the...	1444964543	654854874153263104	f	korillabbq
RT @UntitledQuiz: Plan: the Uncommons for a coffee and a couple board games, then to korilla for a beasty burrito, and finally @PityApplaus...	1444964536	654854846798020608	f	korillabbq
RT @docabc: @KorillaBBQ thanks for sharing Korilla BBQ, have a great Wednesday :) (insight by http://t.co/AMV6iExol6)	1444964526	654854802275500032	f	korillabbq
RT @GratuitousFood:  Kimcheese fries @KorillaBBQ  kimchi cheese korilla nyc EEEEEATS http://t.co/sEDI7zNZ3n	1444964513	654854751222407168	f	korillabbq
RT @ChloeTemtchine: Day 2! So much fun! Thank you, @actelion_com @BayerHealthCare @PHAssociation @KorillaBBQ @Enterprise carsharenyc http:...	1444964423	654854373399506944	f	korillabbq
RT @KimberlyC75: @KorillaBBQ playing that Biggie on the truck today ! Brooklyn	1444964418	654854350003675136	f	korillabbq
@AlexAronovich all day everyday	1444960412	654837548515201024	f	korillabbq
RT @GetSWILL: Look who's serving the good eats tonight ? @KorillaBBQ brooklynweworkhard http://t.co/6Z3dCEm4IF	1444956964	654823086223572992	f	korillabbq
Now serving Brooklyn DUMBO (Pearl & Prospect) here til 11	1444956554	654821368911933440	f	korillabbq
Ready for K(or)ILLA Baby Back Ribs with Pineapple Gochujang and Murder Rice?  Join us tomorrow at... https://t.co/tpaaXWmeGv	1444942100	654760743372349440	f	korillabbq
Metrotech we're here ! Lunch til 3pm at Myrtle & Lawrence!!	1444925971	654693091656396801	f	korillabbq
Big Red will be at Laurita winery for the food truck festival this weekend with lobster, fireworks and bonfires! http://t.co/KcyjKCkNe3	1445038235	655163961961291777	f	lobstertruckny
Tour the scenic vineyards at Laurita Winery tomorrow with BigRed for FallFoodTrucks! http://t.co/2e6G1YVQot http://t.co/z5bz48MVhE	1445018427	655080882408177664	f	lobstertruckny
BigRed is staying in today but she's got a big weekend planned in NJ at Laurita Winery! http://t.co/t6vOtABd6W	1445003712	655019163216429056	f	lobstertruckny
The UN is being taken over by lobster! BigRed is on 45th Street and 1st Ave unitednationsoflobster http://t.co/eDst1VK92l	1444922842	654679970317398016	f	lobstertruckny
BigRed is heading to the UnitedNations to serve up lobster rolls and sunshine! Catch her on 45th and 1st ave http://t.co/x5Tm0CZsC1	1444917647	654658178278232065	f	lobstertruckny
BigRed is headed to New Jersey's Laurita Winery this weekend for FallFoodTrucks! Get tickets here lobsterandwine http://t.co/eGS0T4kYnt	1444856490	654401669686538240	f	lobstertruckny
BigRed will be parked outside of the UN tomorrow at 11am for lobsterlunch! 45th and 1st ave unitednationsoflobster http://t.co/nQf6kz1DIu	1444845640	654356157801304064	f	lobstertruckny
@DoolitleJewelry we should be there around 11am but we'll let you know tomorrow!	1444844859	654352882150580224	f	lobstertruckny
@DoolitleJewelry We'll be parked outside the UN tomorrow at 45th and 1st!	1444843980	654349198381449216	f	lobstertruckny
BigRed is off the streets. Catch us at the markets! SeaportSmorg GarmentDistrict BwayBites http://t.co/hcILoRZw73	1444833026	654303254227091456	f	lobstertruckny
BigRed is catering today but we've got lobster and mac at BwayBites GarmentDistrict and UrbanSpaceVanderbilt http://t.co/k0pthFtZqF	1444746634	653940899106422784	f	lobstertruckny
BigRed is off today but there is plenty of lobsterlove to go around at BwayBites! Visit us at 33rd and Broadway http://t.co/SiAY0BOc0D	1444575720	653224033740267521	f	lobstertruckny
Find BigRed at Fall LauritaFoodTrucks next Saturday & Sunday for wine, lobster & fireworks! http://t.co/fZb1UWG3Wr http://t.co/3k0cQ4nzbn	1444500112	652906910354702336	f	lobstertruckny
BigRed is catering a private event today but you can book her for your next party! Email cater@redhooklobster.com http://t.co/Bc3DoJy7pe	1444489319	652861639268696064	f	lobstertruckny
Happy Friday! BigRed is off the street today. Get your lobster roll fix at UrbanSpace GarmentDistrict or BwayBites http://t.co/wfoHxOBRKq	1444401120	652491706684850176	f	lobstertruckny
BigRed is catering today but BwayBites is open and we're serving up our decadent, four cheese lobster mac! http://t.co/FjlJHrMMog	1444314621	652128902593310720	f	lobstertruckny
BigRed is off the streets but it's a great day to grab a roll at BroadwayBites! http://t.co/wtWYgaglYS	1444227312	651762704466739200	f	lobstertruckny
BigRed has been a popular lady. She's booked again for a private event. Email cater@redhooklobster.com to book the tastiest food truck.	1444147834	651429350332571648	f	lobstertruckny
The holidays will be soon but don't freak out, the Pound's got you covered! http://t.co/LpVkj5dZL7	1444086922	651173867055017986	f	lobstertruckny
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
DUMBO ARE YOU READY FOR THE VENDY @vendyawards CUP WINNER?? Coming your way for lunch today 11:30-3pm @dumbolot @DUMBOBID @Etsy @WeWork	1444233233	651787540517797888	f	snowdaytruck
RT @cheryldorsey: Future EGFellows: The 2016 @echoinggreen Fellowship application is now open! http://t.co/FLtynEgfdY socent	1444067187	651091090846650368	f	snowdaytruck
RT @brooklynmag: 30 Under 30: Talking to Jordyn Lexton of @DriveChangeNYC about social justice + food trucks http://t.co/DlAk1qPY3X http://...	1444063247	651074564089319424	f	snowdaytruck
Drew worked for @SITUSTUDIO the genius bk architect team that helped us build the truck - Vendy champ love ! http://t.co/QC07QJBnHi	1443801917	649978466549563392	f	snowdaytruck
Join us tonight at our favorite Gowanus spot @RoyalPalmsClub - we will be there from 6pm-midnight!	1443701610	649557750947672064	f	snowdaytruck
@carolynsbuddy We will be at 630 Flushing Ave Wed for lunch and at the Royal Palms (514 Union Street) Thurs 6-mindnight	1443468180	648578673105309696	f	snowdaytruck
Last day on our beloved @GovIsAlliance Governors Island! Come share a meal with us!! http://t.co/El5DTTaPg3	1443372316	648176591483314176	f	snowdaytruck
It's the LAST day of the @GovIsAlliance summer season! Come celebrate the best of NYC with us today on Governors Island	1443361980	648133239098462210	f	snowdaytruck
@lowerstressbrkr all weekend !	1443238487	647615273361637376	f	snowdaytruck
RT @thetinyraccoon: Its 2015. NYS prisons still shackle women GIVING BIRTH. Lets stop this. https://t.co/ohplczpcsm @nycabc @BtBsNYC @LVikk...	1443210726	647498833275060224	f	snowdaytruck
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
Thanks to @secret__nyc for listing us as one of the top 10 trucks to eat at https://t.co/1jUIBbnYMC	1442435306	644246487954759680	f	papayakingtruck
Join us at @prospect_park FoodTruckRally this SUNDAY 9/20, 11a-5p @dispatchny	1442430389	644225864423616512	f	papayakingtruck
We will be at @villagevoice's BKPour event on 9/26 serving our world famous franks & tropical drinks BKExpoCenter http://t.co/AV8uyZSw54	1442340624	643849362716684290	f	papayakingtruck
Still time to win 2 pairs of tix to @NYCBrewers Blocktoberfest on 9/19. To enter:  http://t.co/TGWPPanXeC Beerfeest	1442329572	643803006425763840	f	papayakingtruck
We are giving away 2 pairs of tickets to @nycbrewers Blocktoberfest on 9/19. To enter: https://t.co/UIv2f5PEU4? http://t.co/B706X428N9	1441899016	641997122917801984	f	papayakingtruck
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
RT @PrezStacks: @shortysnyc got the best happy hour in the city hands now. WayUpIFeelBlessed	1445054046	655230278823235584	f	shortysnyc
NLDS Game 5 TONIGHT-- 8pm. \nHappy hour 4pm-7pm. \nShortysnyc	1444935163	654731646906687493	f	shortysnyc
Updated Draft List Available on our website for all 4 Shorty's locations. http://t.co/kkPmn0KYLq ShortysNYC Beer... http://t.co/uVQZ0odrBY	1444862529	654426996798173185	f	shortysnyc
RT @ShortysTrivia: No trivia this week @ShortysTrivia @shortysnyc -- Stay tuned for updates on our return to our regular schedule with @Top...	1444760723	653999990298251264	f	shortysnyc
10% OFF your first Shorty's NYC online order!\n\nOrder now: https://t.co/wwFMKuQH34... http://t.co/rbuKcUYW3X	1444660500	653579627944873984	f	shortysnyc
RT @ShortysTrivia: ShortysUpperEast @oskarblues craft cans-- 5 for $25 during all NFL games http://t.co/rpgnsQIPkL	1444575325	653222375878721536	f	shortysnyc
NOvsPHI Game Sound: 576 9th ave, 66 Madison, 1678 1st Ave. Eagles ShortysNyc http://t.co/7WFXY61ULZ	1444574403	653218510294941696	f	shortysnyc
RT @thomasjvillani: Drinking a Shake Chocolate Porter by @BoulderBeerCo at @shortysnyc  http://t.co/XsPDLttnnt photo	1444329245	652190240766042113	f	shortysnyc
@SunnyAnderson @LewsView @rosannascotto WEEE'RRRREEE treating. just pick a day/time and let us know!	1444315997	652134676144893954	f	shortysnyc
@rosannascotto @LewsView your team is long overdue for a shorty's lunch (or breakfast).  pick a day and let us feed you!	1444306100	652093165495799809	f	shortysnyc
No Trivia tonight -- Game Sound MLB NL Wild Card Game Cubs vs Pirates-- 8pm. All Shorty's locations. Playoffs Baseball ShortysNyc	1444233745	651789685560250369	f	shortysnyc
No trivia tonight -- AL wild card game sound at all @shortysnyc locations @ShortysTrivia @TopShelfTrivia http://t.co/UUdGeXXhDX	1444164173	651497879459205123	f	shortysnyc
RT @michaelhanisco: I was watching at @ShortysNYC! Take me back! https://t.co/m57vHcCXeD	1444141879	651404372656656384	f	shortysnyc
@AperiodHperiod red zone. nightmare situation w/o ticket. we tried everything-sling box, streaming. surrounding bldgs 2 tall. no signal.	1444067396	651091968810991616	f	shortysnyc
Game4 PHIvsWAS Eagles ShortysNyc @shortysnyc http://t.co/uRmh7HpkdE	1443972483	650693875321802752	f	shortysnyc
RT @MikeShemesh:  game 4 eagles (at @ShortysNyc in New York, NY) https://t.co/8tAJceRK2n	1443971568	650690037332471808	f	shortysnyc
@ov3rnightc3leb Eagles Game w/ sound at @shortysnyc Shorty's 576 9th Ave. 66 Madison Ave. 1678 1st Ave ShortysNyc	1443926466	650500865795719168	f	shortysnyc
RT @philliesnation: Even though the @Phillies are PPD @shortysnyc is the place to be in NYC http://t.co/GNzKfjPiqM	1443926372	650500468758683648	f	shortysnyc
Where are you watching PHIvsWASH ? Game sound @shortysnyc 576 9th Ave. 66 Madison Ave. 1678 1st Ave. ShortysNyc http://t.co/YP9rPIYYEv	1443925143	650495314273677312	f	shortysnyc
RT @followthemo0n: Temple Game Watch! (at @ShortysNyc in New York, NY) https://t.co/pJSESTEesk	1443875969	650289065829511168	f	shortysnyc
Happy Friday from 53rd & Park!	1444999738	655002494398025728	f	biandangnyc
October 30th will be our last day on the streets for the year. Catch us while you can! 	1444925207	654689886700593153	f	biandangnyc
Catch us on 53rd & Park today!	1444921856	654675831877332992	f	biandangnyc
Jay and Water for lunch today! @dumbofoodtrucks @dumbonyc @dumbolot	1444830034	654290702604480512	f	biandangnyc
Tomorrow, 10/14, we'll be serving lunch in @dumbonyc @dumbolot Jay and Water!	1444776733	654067144448176128	f	biandangnyc
In FiDi todaycon the north side on Old Slip & Water!	1444740681	653915928107683840	f	biandangnyc
50th Btwn 6/7th happymonday columbusday	1444663652	653592847002824704	f	biandangnyc
Happy ColumbusDay from 50th & 6th!	1444663648	653592828610654208	f	biandangnyc
53rd & Park to wrap up the week!	1444399019	652482896993738752	f	biandangnyc
Anyone working on Columbus Day?	1444331271	652198740996960256	f	biandangnyc
Catch us up on 53rd & Park today	1444314365	652127829941874688	f	biandangnyc
humpday ain't a thing when you have porkbelly on 53rd & Park!	1444224272	651749951597219840	f	biandangnyc
FiDi today on Old Slip & Water!	1444139088	651392664311431168	f	biandangnyc
Make it a happy Monday with Taiwanesefood on 50th & 6th!	1444054568	651038162223935489	f	biandangnyc
Preparing for the hurricane weekend and won't be out today. Catch us back out on the streets on Monday!	1443795682	649952318352457728	f	biandangnyc
Up on 53rd & Park today!	1443713910	649609341478158336	f	biandangnyc
53rd and park....lets go!	1443624440	649234074347810816	f	biandangnyc
Is there parking available on 53rd and park for the rest of the week? Please help! May have to re route. Thanks	1443552092	648930626142277632	f	biandangnyc
Changing the schedule up due to parking restrictions...50th and 6th today for lunch!	1443535686	648861813711499265	f	biandangnyc
Sorry midtown, the UNsummit making it really unfriendly to park:( catch us down on 38th & Broadway today!	1443452487	648512853347950592	f	biandangnyc
Happy Friday! @MexicoBlvd http://t.co/WZ6dC8IQIP	1445008247	655038183525240832	f	mexicoblvd
Muy buenos dias! Guacamole&Friends @MexicoBlvd @dumbolot One more beautiful day, enjoy it!	1444922535	654678682468904960	f	mexicoblvd
RT @jimgurney: The @Slalom NY team lunching at @MexicoBlvd foodtruck on ParkAve. My 1st foodtruck exp  @mcgovey @datapopulist http://t.co/Y...	1444870885	654462044402503680	f	mexicoblvd
Buenos dias! http://t.co/MRaABT6Ygx	1444828679	654285018383187968	f	mexicoblvd
Taco Tuesday!!! @MexicoBlvd	1444749111	653951286077952000	f	mexicoblvd
RT @grant_FGD: .@MexicoBlvd once again saves the day. With cheeses and extra spicy tacofriday	1444419560	652569051378679808	f	mexicoblvd
RT @CathleenMcG90: It stopped raining the moment I walked outside to go to @MexicoBlvd  It's a sign that God loves me and wants me to have ...	1444419536	652568950509862912	f	mexicoblvd
Hello Midtown! http://t.co/qX8FpeBtY1	1444399504	652484930178564097	f	mexicoblvd
Buenos dias DUMBO! guacamole tortas tacos flautas quwsadillas @MexicoBlvd @dumbolot	1444316581	652137125786222592	f	mexicoblvd
RT @dumbolot: We got @ToumNYC @MexicoBlvd and @mausamnyc today	1444315187	652131279455059968	f	mexicoblvd
@selovetere 51st St & Park	1444230066	651774253327601665	f	mexicoblvd
Hola Midtown, have a fantastic day! http://t.co/hnkZy0Zzkn	1444227492	651763458841702400	f	mexicoblvd
RT @randomfoodtruck: Still feels like summer! @souvlakitruck and @MexicoBlvd here today.	1444149815	651437656732237824	f	mexicoblvd
We are on Broadway and 55th St.	1444146726	651424702393659392	f	mexicoblvd
http://t.co/5yW1kignGR	1444133382	651368733231972352	f	mexicoblvd
Hello Midtown! Today we are parked on 52nd St & 6th Ave. due a production on our regular spot.	1444132228	651363893558812672	f	mexicoblvd
RT @dumbolot: We're got @ToumNYC @MexicoBlvd and @dubpies today!	1444060109	651061402950594560	f	mexicoblvd
Hello Midtown! Taco Umbrella @MexicoBlvd Enjoy your weekend!	1443799773	649969476264456192	f	mexicoblvd
RT @dumbolot: We got @ToumNYC @MexicoBlvd and @mausamnyc today!	1443714090	649610096167813125	f	mexicoblvd
Hola! tacos tortas quesadillas flautas guacamole @MexicoBlvd @dumbolot	1443713527	649607733361176577	f	mexicoblvd
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
Sorry Tuesday peeps we're off the road today. See you next week.	1441732209	641297485076500482	f	mamuthainoodle
Come join us @FoolsGoldRecs Day off! We're slinging noodles till 10pm Meek Mill will be headlining. donttalkaboutdrake	1441661252	640999867200970752	f	mamuthainoodle
Dumbo!! Start your long weekend off right with some fresh hand cut noodles!! @dumbolot workhard eatwell thaifood	1441383555	639835121600888836	f	mamuthainoodle
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
On Hudson and King today.	1427727369	582556925377777664	f	thepocketful
Don Draper enjoying a falafel from The Pocketful http://t.co/vkSfmGJ5iN	1427669939	582316047237148672	f	thepocketful
Don Draper had the Pocketful falafel.  falafel.vegetarian.vegan https://t.co/rd6gELQ8sP	1427668929	582311810625335296	f	thepocketful
Located on 50th between 6th&7th	1427469005	581473269162872832	f	thepocketful
On 49th between 6th&7th. Police activity on 50th.	1427380200	581100793551552512	f	thepocketful
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
Thanks to @livefastgroup and @centerplate we will be vending @NY_Comic_Con from this Thursday though Sunday at the @javitscenter NYCC NYC	1444229669	651772592173527042	f	camionnyc
Old Slip and Water St today's special Al pastor tacos fidi NYC foodporn camionmeanstruck fishtacos https://t.co/iHb5yxUmcf	1444227534	651763636004876288	f	camionnyc
Old Slip and Water St today's special al Pastor with pineapple relish fidi camionmeanstruck WallStreet foodporn http://t.co/NKxZBvYMpj	1444225138	651753587673067521	f	camionnyc
10/17/15 @TheMeadowlands tristatemashup tristate's  best food trucks NY NJ CT all in one place for you to try http://t.co/ibTH3mazxz	1444217545	651721738468884480	f	camionnyc
Thanks to livefastgroup and centerplate we will be vending @NY_Comic_Con from this Thursday though... https://t.co/v0Yk6LsQCS	1444188393	651599464164118528	f	camionnyc
to @livefastgroup and @centerplate we will be vending @NY_Comic_Con from this Thursday though Sunday at the @javitscenter NYCC NYC	1444168548	651516229950304256	f	camionnyc
RT @TheMeadowlands: NYC: @mausamnyc @gcnyc1 @CamionNYC @DeliNDogzTruck @KorillaBBQ @mactruckny @PontiRossiFood @Valduccis @USAFoodTruck htt...	1444059366	651058288663089152	f	camionnyc
@cmgonzalez85 hi Carlos we took last week 4 prvt events be back this week but our understanding is 46th is shutdown we'll keep u posted	1442716063	645424066254503936	f	camionnyc
Kasar truck is in soho, Broadway and spring street until 6 pm	1434295554	610105890910253058	f	chipsykingny
T.G.I.Fryday falafeltaco taco burrito camionmodernmexican foodtruck foodporn https://t.co/f94hg1HQnB	1441989462	642376481004474368	f	camionnyc
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
Schnitzi truck is off the road today, honoring Gdalia fest, we will see you tomorrow, have an easy and restful fest,the restaurants are open	1442410319	644141684809433088	f	schnitzi1
We off the road today some TLC to the Schnitzi truck,  have a  beautiful and restful holiday from all the Schnitzi team	1441894851	641979653733908480	f	schnitzi1
@navahw either 47 bet Park and lex or 55 and Broadway	1441819100	641661930617327616	f	schnitzi1
Again the NYPD shut down all of the trucks on 46 so we are leaving	1441817539	641655381903675392	f	schnitzi1
Today @46 St bet 5&6 serving lunch from 11:30 - 3:15 download our app or order online @www.schnitzi.com schnitzitruck schnitzel	1441807733	641614255402389504	f	schnitzi1
Today @46 St bet 5&6 Ave serving lunch from 11:30-3:15 order online @www.schnitzi.com download our app schnitzitruck	1441720740	641249377777025024	f	schnitzi1
Happy Labor day weekend everyone, we are on governors island again today @ligget terrace all day long, stop by get some lunch	1441637217	640899057385385984	f	schnitzi1
Governors Island @ligget terrace all day hope to see you all soon schnitzitruck foodtruck kosherfood schnitzel glattkosher download app	1441548417	640526604838567937	f	schnitzi1
33 St we are here for lunch, get ready to rumble schnitzitruck schnitzel foodtruck kosherfood	1441289245	639439557319114752	f	schnitzi1
Guys, tomorrow we are back @33 St bet 8&9 exciting to be back at B&H to serve some schnitzi magic @giulianisocial keeptheforkinnewyork	1441247046	639262561469399041	f	schnitzi1
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
Open 23rd street and Park avenue south. Come!!!	1443007065	646644618784821248	f	carpedonutnyc
Open at prospect park . Grand army plaza. Food truck rally	1442760928	645612244978532352	f	carpedonutnyc
Truck open at 55th street and Broadway. Come!!!!	1442573753	644827174915190784	f	carpedonutnyc
Open at 51st street and Park avenue. Come!!!	1442491010	644480124721700864	f	carpedonutnyc
Open at Bergen and Court street. Come!!!	1442143065	643020738304327680	f	carpedonutnyc
Good morning! Open @ Bergen and Court	1442062557	642683061742735364	f	carpedonutnyc
Open at 55th street and Broadway. Come!!!	1441969967	642294711408005125	f	carpedonutnyc
Open at 51st street and Park avenue. Come!!!	1441882257	641926832049266688	f	carpedonutnyc
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
RT @ShopKeep: These multigrain empanadas make us go a little loco. Can you blame us though @Palenquefood?! ShopKeepLife http://t.co/qv72DV...	1440895772	637789214260772865	f	palenquefood
No words https://t.co/rLYABjAGtH	1440365254	635564060155711488	f	palenquefood
Palenque crew @ afropunk NYC  https://t.co/qemMrwblKk	1440335990	635441317808578560	f	palenquefood
Palenque Team ready for fooda @360i https://t.co/8h0aDwGUau	1439999376	634029453421756417	f	palenquefood
RT @gretchenzehner: @Farm2me: NYC:  GlutenFree + Multi-Grain Arepas at @PalenqueFood regram from @palenquefood Farm2NY http://t.co/rT6q...	1439947682	633812633414668288	f	palenquefood
Start your day off right with some delicious Colombian arepas at @GansMarket 	1439227291	630791097372016640	f	palenquefood
Palenqueritos working @rockawaybeach 97! Deliciosa and nutritious colombian Arepas https://t.co/8dMwfrEj37	1439136507	630410319731531776	f	palenquefood
@gansmarket nice and beautiful Day for an Arepa from Palenque, meta packing district https://t.co/pbbTgHCPi1	1439057059	630077093154562048	f	palenquefood
Palenque crew at Rockaway beach https://t.co/knKjfQY0a3	1439053098	630060478673387520	f	palenquefood
Just posted a photo https://t.co/7xe4Nnhzxn	1439040557	630007877772689408	f	palenquefood
Scream it from the rooftops it's CHEESESTEAK FRIDAY folks! 56th st / Bdwy @randomfoodtruck @victoriasecret @UMG... http://t.co/Juu3MDZdXy	1445005701	655027505871478784	f	carlssteaks
Happy hump day folks We got you covered on the WEST SIDE AND ON THE EAST SIDE TODAY!! BIG CARL - 47TH ST BET LEX... http://t.co/d3CIOvVOeN	1444834921	654311200075874304	f	carlssteaks
Showing Double Borough love today !!!\nBIG CARL @dumbolot Brooklyn Jay st & water st LIL CARL - 70TH ST / YORK AV... http://t.co/rQiKB1vAvt	1444749739	653953922093047808	f	carlssteaks
We think chris Columbus would of LOVED Carl's famous cheesesteaks so let's celebrate the day with cheesesteak for... http://t.co/EK9iWn4dAE	1444662170	653586632298250240	f	carlssteaks
Sundays = football,  MLB playoffs & Carl's  famous cheesesteak! ! BIG CARL - 86TH ST BET 3RD AV /LEX \n LIL CARL -... http://t.co/moDhvmFSVn	1444577573	653231807358373888	f	carlssteaks
Sundays = football,  MLB playoffs & Carl's  famous cheesesteak! ! BIG CARL - 86TH ST BET 3RD AV /LEX \n LIL CARL - BDWY/67th St Apple store	1444577495	653231476314669058	f	carlssteaks
Great fall day in NYC so when out and about today stop by BIG CARL - 86TH ST BET 3RD AV /LEX AV showing the UES... http://t.co/uxATY4XGe6	1444486101	652848142279307264	f	carlssteaks
Scream from the rooftops it's CHEESESTEAK FRIDAY folks! 2x the cheesesteak love again today BIG CARL - 56TH ST /... http://t.co/YRpF9qeyEB	1444401690	652494097899323393	f	carlssteaks
We love Thursday ONE day closer to weekend folks! 2x the cheesesteak love again\nBIG CARL - 47TH ST BET LEX / PARK... http://t.co/j0dv4am53r	1444317910	652142700494352384	f	carlssteaks
Happy hump day folks 2X THE CHEESESTEAK LOVE TODAY \nBIG CARL 47th st bet park / lex @MLB @nfl @UBSamericas... http://t.co/F0zlMA29pr	1444231497	651780255376539648	f	carlssteaks
What a night @Yankee tonight BIG game calls for a carls famous cheesesteak let's go yankees GOT WHIZ? NYCSBEST CHEESESTEAKS FOR ALL	1444177954	651555681112162305	f	carlssteaks
Perfect weather for a great day in BROOKLYN @DUMBOLOT JAY ST & WATER ST cheesesteaks for all GOT WHIZ? nycsbest http://t.co/yo31mDCTje	1444143382	651410675688845312	f	carlssteaks
Happy Monday folks start your week w a carls famous cheesesteak 2x the love today \nBIG CARL - HUDSON ST / KING ST... http://t.co/cLBuyU0I0m	1444056568	651046550009856001	f	carlssteaks
Time for the cheesesteak rain dance folks! ok now here we go BIG CARL - 56TH ST / Bdwy @randomfoodtruck... http://t.co/gtZnP1eKrd	1443797894	649961594915586052	f	carlssteaks
We love Thursday ONE day closer to weekend folks! 2x the cheesesteak love again today\nBIG CARL - Old slip and... http://t.co/AjYtAhTZmF	1443714113	649610190753558528	f	carlssteaks
Time for the cheesesteak rain dance folks! ok now here we go \nBIG CARL - 47TH ST BET LEX / PARK @MLB @NFL... http://t.co/HlQXCgDFUG	1443623968	649232095781371904	f	carlssteaks
Brooklyn love today DUMBO TUESDAY FOLKS jay and water st GOT WHIZ? nycsbest cheesesteaks for all!	1443544614	648899260872724481	f	carlssteaks
@dumbolot Jay st and water st GOT WHIZ? nycsbest cheesesteaks for all!	1443544560	648899035168948224	f	carlssteaks
Start your Monday off right with 2x the cheesesteak love !\nBIG CARL - HUDSON st / king st @Medidata @WFAN660\n\nLIL... http://t.co/AciDLV3UEj	1443449005	648498248487866372	f	carlssteaks
Scream it from the rooftops it's CHEESESTEAK FRIDAY folks! \nBIG CARL - 56TH ST / Bdwy @randomfoodtruck... http://t.co/fXvhrDeGQ4	1443189727	647410758922321920	f	carlssteaks
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
@klayy14 october 3rd im at the meadowlands for a tristate food truck mashup.	1443137800	647192961210560512	f	mactruckny
Awesome article in Pop Sugar with some tips on how to make your mac n'cheese a cut above the rest. \n\nhttp://t.co/BgIVdeMTMv	1443137751	647192755106676736	f	mactruckny
Friday, Saturday, Sunday this weekend vending at the Rock Carnival in Clark New Jersey!!!!	1442609017	644975083325423616	f	mactruckny
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
@tbaker4u we are no longer running in Manhattan. We do have locations scattered all over the city thought!	1438976691	629740004500226048	f	nautimobile
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
Kasar truck is in Soho, broadway and spring street until 8pm, and at seventh avenue and Christopher until 4am	1434205183	609726849581608960	f	chipsykingny
Porchetta on rotation for tomorrow. Meet us tomorrow TriStateFoodTruckMashUp   Pontirossifood Italianfoodtruck http://t.co/WELFvqxJ4N	1445036140	655155174026125313	f	pontirossifood
LetUsCaterYourNextEvent! \nTimeWarner Happyemployees HomeadeItalianMeatballs Pontirossifood Italianfoodtruck http://t.co/ctCBCY8XOC	1444413101	652541958053888000	f	pontirossifood
RT @TheMeadowlands: NYC: @mausamnyc @gcnyc1 @CamionNYC @DeliNDogzTruck @KorillaBBQ @mactruckny @PontiRossiFood @Valduccis @USAFoodTruck htt...	1444190989	651610354045317120	f	pontirossifood
RT @DomoTaco: Happy Friday with @mamuthainoodle and @PontiRossiFood	1443801551	649976933925695488	f	pontirossifood
RT @ScoutologyNYC: Get Your Votes In For Your Favorite NYC Food Truck! @Scoutology @souvlakitruck @PontiRossiFood @waffletruck \n\nhttp://t....	1443627181	649245571686002688	f	pontirossifood
@ElevenCBoutique where are you guys located ?	1443594924	649110274943918080	f	pontirossifood
RT @ElevenCBoutique: @ScoutologyNYC @Scoutology @waffletruck @PontiRossiFood @souvlakitruck wish u guys would park by us 1day it would be g...	1443594903	649110187232653312	f	pontirossifood
They all line up. Our hungry students at Wagnercollege at HomeComing. Let us cater your next event! Pontirossifood http://t.co/AXYPmB30KC	1443316895	647944139766689792	f	pontirossifood
RT @ExposureNJ: @DeliNDogzTruck TriState Foodtruckmashup 10/3 @EaterNY @NYFoodCalendar @KorillaBBQ http://t.co/ACx6j49Uxl @njdotcom http:/...	1443202784	647465521559023616	f	pontirossifood
Let us cater your next event! EmployeeApprectionDay LindenNJ Italianfoodtruck PontiRossi Pontirossifood http://t.co/0E1X8yQ6Ls	1443202599	647464745453363200	f	pontirossifood
RT @ScoutologyNYC: Get Your Votes In For The NYC Food Truck Fight! @Scoutology @waffletruck @PontiRossiFood @souvlakitruck \n\nhttp://t.co/g...	1443199984	647453776744284160	f	pontirossifood
Panini anyone? Our newest market Penn Plates at 1 Penn Plaza\nPontiRossi Italianfoodtruck PennPlates Urbanspace http://t.co/eb9389m163	1442541261	644690894839488512	f	pontirossifood
@CLEMENTINOIENA Ponti Rossi ti aspetta! Iena white on @PontiRossiFood ! Qui abbiamo usato srinacha e truffle mayo ! http://t.co/i08ilaax4i	1442435212	644246093560197121	f	pontirossifood
Clementinooooooo ti aspettiamoooooo pronti per te @CLEMENTINOIENA  http://t.co/V4MrYZE9RR	1442328650	643799138824495104	f	pontirossifood
@CLEMENTINOIENA fratmmmm ti aspettiamo al food truck @PontiRossiFood dal mar al ven 11am-3pm ti aspettiamoooo sei un grande 347-506-9616	1442187268	643206140013244417	f	pontirossifood
@CLEMENTINOIENA ciao guaglio' !!! Se riesci vieniti a mangiare un piatto di pasta a @PontiRossiFood facciamo un po' di rap sul food truck !	1441896156	641985126637936640	f	pontirossifood
RT @ScoutologyNYC: Cast A Vote For Your Favorite NYC Food Truck! @Scoutology @waffletruck @KorillaBBQ @TaimMobile @PontiRossiFood \n\nhttp:/...	1441894756	641979253177909249	f	pontirossifood
RT @sofiyaballin: Super excited to see Queen B! I'd serve her Lasagna Emiliana! ~Jessica Lorraine of @pontirossifood MadeInAmerica http:...	1441740569	641332549613191168	f	pontirossifood
@dumbolot we there too subbing for sweet chili	1441720926	641250159884693504	f	pontirossifood
@AndreaFeczko my beautiful city !!! I am glad you like it ! Grande Napoli	1441709187	641200923797286912	f	pontirossifood
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
@DiSOSNYC @ryangeftmangold so many phone calls....his phone broke.  prettyboyfoodtruckownerproblems	1445028602	655123556225949696	f	usafoodtruck
@joncontino bro you have no idea how much I want to work with you, but I got the start up capital for my biz on a game show. Working on it.	1445025848	655112008988127233	f	usafoodtruck
@joncontino you could always help out an up-and-coming NYC born food operation and turn us into a household name...nycstyle murica usa	1445001957	655011800681988096	f	usafoodtruck
Betsy is at Hanover Square and Water St. The market is open at 41st and Broadway as well. Come get that all-American goodness. USA	1444922705	654679393575419904	f	usafoodtruck
RT @dumbolot: We got @biandangnyc and @USAFoodTruck in the lot today!	1444835974	654315617441435648	f	usafoodtruck
Yankee Doodle came to Brooklyn, riding on his Betsy. Sold the tenders to the peeps and made them super happy. We're at DUMBO lot today. 	1444835949	654315511614980097	f	usafoodtruck
@vllg Miss you guys! Thanks for letting us feed you. Best of luck next year with the Habs!	1432226274	601426701168574464	f	thesteelcart
RT @TheMeadowlands: NYC: @mausamnyc @gcnyc1 @CamionNYC @DeliNDogzTruck @KorillaBBQ @mactruckny @PontiRossiFood @Valduccis @USAFoodTruck htt...	1444767007	654026347107495936	f	usafoodtruck
@MangiaPhilomena don't worry Courtney. That doesn't mean you're weak..it means you have super strong decision makin skills usa nycnoms	1444763250	654010591066128385	f	usafoodtruck
Old slip and water with betsy till 3 and the market is at 41st and Broadway come get it hot fresh and American	1444749679	653953671370264576	f	usafoodtruck
RT @paulloduca16: Almost go time! Mets Dodgers http://t.co/EvGPjYYMrp	1444694706	653723095539318785	f	usafoodtruck
@TriniTTruth thanks for the love. Now you know where to find us 7 days a week. Looking forward to serving you for many years to come.	1444676491	653646696136724480	f	usafoodtruck
RT @TriniTTruth: @USAFoodTruck OMG GREAT FOOD....GREAT CHICKEN....GREAT EVERYTHING!!!!!	1444676453	653646540066713600	f	usafoodtruck
need some comfort after the weekend? We got the chicken hookup at 47th and Park and 41st and Broadway. Start the week strong. MURICA usa	1444660081	653577868581163008	f	usafoodtruck
RT @_InspireAlways_: http://t.co/LZVYFrzW1X	1444659837	653576846404100096	f	usafoodtruck
@daguy666 thanks man. Glad you liked it! Hope to see you around.	1444430365	652614370359427072	f	usafoodtruck
RT @daguy666: One bite in and I'm already a fan! Love me tender is a HUGE hit! dumbo @USAFoodTruck Would definitely eat again!	1444413519	652543711415562240	f	usafoodtruck
We're @dumbolot today on Jay St in Brooklyn today. Come switch it up with the all-American goodness of our chicken tenders. 11-3	1444399993	652486978831810560	f	usafoodtruck
Don't forget our pop market at 41st and Broadway. Getting you the most American food in NYC @TimesSquareNYC nyc  http://t.co/iEz410H402	1444317073	652139187798306816	f	usafoodtruck
@DiSOSNYC I'll play That's Amore from the truck today in your honor or maybe Mambo Italiano. italiandeli nyc murica	1444316941	652138637128130560	f	usafoodtruck
We're downtown yall. Daily tip of the cap to the original Yankee Doodle Dandy, GW at Old Slip and Water St from 11-3 http://t.co/FrmcDr6Q0O	1444316876	652138364330618882	f	usafoodtruck
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
@RealAntwon we don't like it either but our permit only allows us to be out from April - October. The Jawn must hibernate this winter :(	1445007789	655036263175729152	f	philssteaks
It's Phil's Phriday at 51st n Park! Only two more weeks left for us this year after today. Make it count - get out and get your Phil! 11-2	1445007567	655035329255047168	f	philssteaks
The Jawn is back on 52nd n 6th - 11-2. Perfect cheesesteak weather today - don't miss out, get your Phil!	1444920058	654668292792020995	f	philssteaks
Whiz Wednesday! 41st between 6th and Broadway for your enjoyment. Get Your Phil! 11-2	1444833683	654306006592319488	f	philssteaks
The comic con hangover is over. We are alive. Rocking at 47/Park today 11:15-2	1444748505	653948744086519810	f	philssteaks
Thanks to @livefastgroup and @centerplate we will be vending @NY_Comic_Con from this Thursday though Sunday at the @javitscenter NYCC NYC	1444582918	653254222062977024	f	philssteaks
Thanks to @livefastgroup and @centerplate we will be vending @NY_Comic_Con from this Thursday though Sunday at the @javitscenter NYCC NYC	1444491141	652869283538726912	f	philssteaks
RT @TatianaKing: @SyrenaDeli  don't hate on @PhilsSteaks! They're dope	1444426674	652598889418240001	f	philssteaks
Thanks to @livefastgroup and @centerplate we will be vending @NY_Comic_Con from this Thursday though Sunday at the @javitscenter NYCC NYC	1444404650	652506512913498112	f	philssteaks
@whokickedit serving 11-7 Th, Fri, Sat and 11-5 Sun. Not actually inside but on the grounds so only attendees can enjoy. Hope to see you!	1444308404	652102827054116865	f	philssteaks
Thanks to @livefastgroup and @centerplate we will be vending @NY_Comic_Con from this Thursday though Sunday at the @javitscenter NYCC NYC	1444308295	652102370055340032	f	philssteaks
RT @AndrewNLee: @PhilsSteaks is in the hood!!!! http://t.co/qBzR2EFMSY	1444252205	651867113842470912	f	philssteaks
Thanks to @livefastgroup and @centerplate we will be vending @NY_Comic_Con from this Thursday though Sunday at the @javitscenter NYCC NYC	1444229585	651772237339578369	f	philssteaks
No parking on 41st today so we are on 6th Ave and 52nd (on the Ave). We will be at comic con tomorrow so all our... http://t.co/Jl5KtIk0cA	1444229558	651772124722524162	f	philssteaks
@CaptKirkeisha Nice photo, dawg	1417813234	540974030757433344	f	shadydawgnyc
Thanks to @livefastgroup and @centerplate we will be vending @NY_Comic_Con from this Thursday though Sunday at the @javitscenter NYCC NYC	1444162906	651492567847145472	f	philssteaks
Since we will be at Comic Con later in the week, we're swinging by 51st and Park for lunch today 11-2. Come thru!!!	1444140511	651398636199366656	f	philssteaks
Beautiful day - get outside and enjoy it with a steak from the Jawn. Winter will be here b4 u know it. Don't sleep on fall. 47/park 11-2	1444055795	651043308395986944	f	philssteaks
Phil's Phriday returns to 51st and Park. Hurricane Joaquin ain't holding us back! Don't let a little rain stop... http://t.co/fJWYsNEEdf	1443795230	649950420140343296	f	philssteaks
@whokickedit W. 4th and Greene til 7!	1443726467	649662006799241216	f	philssteaks
October is here! It's our last month on the NYC streets of 2015. Better put that winter weight on before we're off! 52nd n 6th 11-230	1443709883	649592448843423744	f	philssteaks
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
Pumpkin cake today! And cream cheese frosting for the top! Lots or a little, up to you! Cran Almond Crispys, too!	1445017775	655078146123931648	f	thetreatstruck
!!! Fri, Oct 16th 12-3:30 45th & 6th Ave! Then 4ish-7pm 18th st & 7th Ave !!!	1445009618	655043932930383872	f	thetreatstruck
!!! Thurs, Oct 15th 12-2:30 45th& 6th Ave! Then 3:30ish-7pm Bway (86 & 87th) !!!	1444922026	654676547496861696	f	thetreatstruck
18th st & 7th Ave 4-7pm!!!	1444852824	654386291048611841	f	thetreatstruck
Halloween cookies!!! We'll have them on the truck next week 'til Halloween! Also special orders,pick up or delivery! http://t.co/8IjoO7frFY	1444850611	654377011553636352	f	thetreatstruck
!!! Wed,Oct 14 12-3:30 45th & 6th Ave !! 4ish-7pm 18th & 7th Ave !!!	1444834216	654308244517715968	f	thetreatstruck
!!! Tues,October 13th 5-8pm @catbirdnyc come have treats with the ladies at Catbird!!!	1444769405	654036407237873666	f	thetreatstruck
Truck spots this week Wed/Thurs/Fri!!!	1444658708	653572110737108993	f	thetreatstruck
!!! Sun, Oct 11th no truck today! Our shop open 9am-4pm w/food & Treats! Come on by!!!	1444566653	653186001653862401	f	thetreatstruck
!!! Sat, Oct 10th Our shop open 9am-4pm w/food & treats!! Hooray!!!	1444479177	652819104408170496	f	thetreatstruck
Closing a bit early! Have a great weekend, everyone!!!	1444428834	652607949198753792	f	thetreatstruck
!!! Fri, Oct 9th 11:30-3:30 45th st & 6th Ave! Then 18th St & 7th Ave 4ish-7pm!!!	1444398587	652481084685451264	f	thetreatstruck
3-7 Bway (86 & 87th)!!!	1444328919	652188875268464641	f	thetreatstruck
Oh me, oh my! A repair truck and a van are in our regular spot on 45th still...we'll try again tomorrow!! Headed to another spot	1444321346	652157111304978433	f	thetreatstruck
!!! Thurs, Oct 8th still trying to get our spot for lunchtime! We'll let you know soon! Also, later UWS, Bway (86 & 87th)!!!	1444318084	652143427673436161	f	thetreatstruck
!!! Wed,Oct 7th change of plans! Private event today! Regular spots tomorrow, maybe even our Wed lunch spot, we hope!!!	1444230825	651777437588656128	f	thetreatstruck
!!! Truck spots this week Wed/Thurs/Fri !!! What beautiful weather! Lalalalala!!!	1444140629	651399127994122240	f	thetreatstruck
!!! Sun, Oct 4th 1-4pm blessingoftheanimals feastofStFrancis StJohndsivineNYC & our shop open 9am-4pm w/food&treats!!!	1443962300	650651163713499136	f	thetreatstruck
!!! 11-5pm sugarhill sugarhillmuseum tasteharlem come join in the fun!  Sugar Hill Children's Museum of Art & Storytelling!!!	1443888825	650342987075989504	f	thetreatstruck
!!! Sat, Oct 3 truck@ Sugar Hill Children's Museum 11-5pm 155th & St Nicholas Ave, Harlem! & our shop open 9am-4pm w/food&treats!	1443876671	650292008502870016	f	thetreatstruck
Retweeted Brooklyn United (@brooklynunited):\n\nOur top 3 @TheSteelCart offerings, in memoriam: 1. Hole-in-one eggs... http://t.co/H6Q98DJ2b2	1436887174	620975933969825792	f	thesteelcart
RT @brooklynunited: Our top 3 @TheSteelCart offerings, in memoriam: 1. Hole-in-one eggs 2. Grits and gorgonzola 3. Homemade Turkish coffee....	1436887170	620975918060847104	f	thesteelcart
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
Good Morning NYC,\nWe are parked on W67st & Broadway today till 5pm. Come enjoy NYC Best Lobster Roll & Sliders. Try our Lobster Gazpacho 2.	1442667247	645219317232074752	f	lobsterrolling
Good Morning NYC,\nToday we are parked on W55 St & Broadway till 4pm. Come enjoy Fresh Lobster Rolls, Sliders & Lobster Gazpacho. Peace n luv	1442585313	644875659345559552	f	lobsterrolling
RT @RideoutcR: @MrVsPizza: Yummmmy @Valduccis @greenboxny @foodNfest @foodNfest @scottspizzatour @Table87 @FoodNetwork Omg looks so good!!!	1445044515	655190300659425280	f	valduccis
Live @Table87 @Valduccis http://t.co/DMFi8lq4I0	1445044478	655190145231167488	f	valduccis
@Table87 @Valduccis @MrVsPizza http://t.co/io9CdNhsGH	1445043685	655186821425577984	f	valduccis
@SliceOutHunger Saint Anthony's Church @scottspizzatour @greenboxny @Valduccis @MrVsPizza @foodNfest @Table87 http://t.co/ox5vwgSC1M	1445011801	655053091574820864	f	valduccis
pizza hungry Valduccis mrvspizzeria @greenboxny @Foodtruckstars_ @FoodNetwork @MrVsPizza @FoodPorn rentourtruck http://t.co/nZcy22MffF	1445001172	655008509684228096	f	valduccis
RT @greenboxny: Friday vibes. We know you guys get it.  FridayFeeling @Valduccis @ATownPizzaria @pistl @encyclopizzeria http://t.co/yO...	1445000522	655005781851549697	f	valduccis
RT @greenboxny: We're counting down! Can't wait to see them kill it!  https://t.co/esGJ7GXGU7	1444964009	654852635665809408	f	valduccis
@Table87 is onshark tank fri night 10-16 I think they Win @Valduccis @MrVsPizza @greenboxny @foodNfest @FoodPorn  http://t.co/BtB9iHn4ZE	1444956693	654821948485058561	f	valduccis
RT @Table87: @Valduccis @bigdsgrub @SweeteryNYC @foodNfest @greenboxny @FoodtoEat @MrVsPizza @FoodPorn	1444929973	654709877940490240	f	valduccis
@Table87 Fri night 9 pm sharktank @bigdsgrub @SweeteryNYC @foodNfest @greenboxny @FoodtoEat @MrVsPizza @FoodPorn http://t.co/HjiO1Ew78k	1444926303	654694484832219137	f	valduccis
vodkasauce bestpizza valduccis @greenboxny @FoodtoEat @Foodtruckstars_ @FoodPorn @foodNfest @FoodNetwork pizza http://t.co/Kw2J7xjPf1	1444913229	654639646962515968	f	valduccis
RT @greenboxny: @MrVsPizza @Valduccis @foodNfest @scottspizzatour @FoodNetwork we do! We do! 	1444912823	654637944649719808	f	valduccis
RT @MrVsPizza: bestpizza @Valduccis @greenboxny @foodNfest @Foodpornnetwork @FoodPorn @FoodMafia @RA_BestPictures yum http://t.co/3q4GHQE...	1444874443	654476968570830848	f	valduccis
RT @AnnaPizzapasta: @MrVsPizza @SliceOutHunger @Valduccis @greenboxny @foodNfest @scottspizzatour @Foodpornnetwork @FoodPorn  Awesome Work!!	1444874407	654476817705902080	f	valduccis
We are making some crazy pizza @MrVsPizza @greenboxny @FoodtoEat @Foodtruckstars_ @FoodNetwork @FoodPorn bestpizza http://t.co/L3szFR4cn7	1444858444	654409863460749312	f	valduccis
RT @HawkeyeNJ: @KorillaBBQ @mausamnyc @gcnyc1 @CamionNYC @DeliNDogzTruck @mactruckny @PontiRossiFood @Valduccis @USAFoodTruck C PIC! http:/...	1444838673	654326936014077952	f	valduccis
bestpizza @MrVsPizza @greenboxny @foodNfest @Foodtruckstars_ @FoodPorn @FoodNetwork @FoodPornPicz rentmytru k http://t.co/Rhc4L9gAzy	1444782394	654090888487022592	f	valduccis
RT @TheMeadowlands: NYC: @mausamnyc @gcnyc1 @CamionNYC @DeliNDogzTruck @KorillaBBQ @mactruckny @PontiRossiFood @Valduccis @USAFoodTruck htt...	1444766898	654025892029665282	f	valduccis
Best pizza catering  @greenboxny @foodNfest @Foodtruckstars_ @pocketsriracha @FoodtoEat @FoodPorn @FoodNetwork http://t.co/bu3mSgzXdH	1444766762	654025321319153664	f	valduccis
RT @MrVsPizza: Yummmmy @Valduccis @greenboxny @foodNfest @foodNfest @scottspizzatour @Table87 @FoodNetwork bestpizza http://t.co/kOkF0RBdnq	1444679628	653659856369532928	f	valduccis
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
Catch our UrbanSpace booths open from 11-9 on 33rd & Broadway and 39th & Broadway!	1445005486	655026603555188736	f	domotaco
Back in FiDi today! Catch us on the north side of Old Slip between Water and Front St!	1445005446	655026433492840448	f	domotaco
Dropping a newnew menu item exclusively at our restaurant and BwayBites! Swing by Monday to try GeneralTsoTofu @urbanspace nom	1444950817	654797304344350721	f	domotaco
Catch our @UrbanSpace booths open all up and down Broadway on 39th st at UrbanSpaceGarment & 33rd st at BwayBites!	1444921795	654675576926564352	f	domotaco
Back in metrotech today brooklyn	1444921719	654675256183930881	f	domotaco
Sorry @dumbolot we're out to a private event today, but catch @biandangnyc out on Jay & Water today!	1444832094	654299345282445312	f	domotaco
 733 Franklin Ave |  private event |  39th & Broadway |  33rd & Broadway	1444830217	654291471881912321	f	domotaco
Catch the truck in SoHo today on Hudson & King!	1444740619	653915670988652544	f	domotaco
@Alltheperks71 @danielle_cooks they taste even better. nomnomnom	1444689985	653703293332549632	f	domotaco
RT @danielle_cooks: The finest pork shoulder tacos in NYC @DomoTaco & finest people watching bwaybites http://t.co/HuAFQjbVdH	1444689958	653703180673515521	f	domotaco
Catch us at the @UrbanSpace markets on 39th & Broadway and 33rd & Broadway!	1444663625	653592735132160000	f	domotaco
Discover yourself a new AsianTaqueria today on 52nd & 6th!	1444663592	653592597013860352	f	domotaco
52nd and 6th | 39th and Broadway l 33rd and Broadway | 733 Franklin Ave columbusday	1444663575	653592525240954880	f	domotaco
@LOLBev open 7 days at 733 Franklin Avenue brooklyn ny CrownHeights	1444487129	652852456720871424	f	domotaco
RT @LOLBev: nooooo. kimchi falafel taco dream crushed. https://t.co/jiGS0z2Vv9	1444486899	652851492567818240	f	domotaco
Rain might not go away but neither will we! Catch us at the @UrbanSpace markets on 33rd & Broadway and 39th & Broadway!	1444398997	652482804287037440	f	domotaco
A little too crowded in FiDi but catch us back next week. In the meantime catch us up on 47th & Park today!	1444398931	652482526821416960	f	domotaco
Someone left their wallet at 733 Franklin! Please stop by to claim it. A photo ID would be appreciated.	1444353741	652292984155729921	f	domotaco
@LatoyiaHayes we go every other Thursday because we got invited to metrotech! getitwhenyoucan	1444349403	652274791882297344	f	domotaco
Anyone working on Columbus Day?	1444331259	652198687985143808	f	domotaco
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
eddiespizza at tdbank grand opening today 23rd street and 7th ave. Free cookies and drinks 10a to... https://t.co/llZVscyBRN	1442583486	644868000156356609	f	eddiespizzany
@GothamGator1 got kicked out by the cops. We will try and come back in the future	1442448193	644300537895219200	f	eddiespizzany
Also go visit our friends @TakumiTacoNY who are now open @usvanderbilt on 45th and Vanderbilt http://t.co/PgkupFHTcK	1442406417	644125316236058624	f	eddiespizzany
Lunch today on 55th and broadway!	1442406349	644125030713008129	f	eddiespizzany
RT @TakumiTacoNY: takumitaco now open at vanderbiltfoodhall also visit us at madsqeats and chelseamarket and... https://t.co/B2G14HbM0S	1442329717	643803615010942976	f	eddiespizzany
eddiespizza is handing out complimentary cookies and drinks today at tdbank on 85th and Madison UES until 3p... http://t.co/sfR0v8gACI	1442070683	642717148599595009	f	eddiespizzany
eddiespizza is handing out complimentary cookies and drinks today at tdbank on 85th and Madison... https://t.co/AutIrfwxFt	1442070680	642717135920332800	f	eddiespizzany
Wednesday update: we are now on 48th between park and lex (the police kicked us out of 46th street) http://t.co/TbhMchRf1u	1441818098	641657729640189952	f	eddiespizzany
If you haven't had Kubbeh before, this is your chance.  An Evening of Kubbeh at @barbolonat http://t.co/YloKEtAL5X dinnerclub supperclub	1445020481	655089495109447681	f	taimmobile
RT @saramoulton: This week on SarasWeeknightMeals @EinatAdmony joins me to make a traditional Sinaya & a Falafel Salad! http://t.co/dbbw3c...	1445015166	655067204329848832	f	taimmobile
Come visit our Nolita location 2morrow starting at 11am & get a free Falafel Sandwich, courtesy of ZagatLovesNYC! While supplies last only!	1445012992	655058084633645056	f	taimmobile
Thanks!! @KarenAndAndrew @ZagatNYC	1444932293	654719609589751809	f	taimmobile
RT @ZagatNYC: The best vegetarian spots in NYC has @TaimMobile on the top with falafel to end all falafel http://t.co/gHjIw7iMpV http://t...	1444932197	654719208018735104	f	taimmobile
@JaimeSukonnik we're there on Thursdays! See you tomorrow!!	1444839111	654328777141551104	f	taimmobile
You can find the truck in flatiron today on 20th and 5th!	1444839053	654328533985165312	f	taimmobile
20th and 5th! See you soon flatiron!	1444753637	653970269590171648	f	taimmobile
We are out today on Water and Broad in FiDi!	1444667667	653609688722984960	f	taimmobile
Yes its called Combina. Keep your eye out for it.  https://t.co/jwjhQ0lZOt	1444427039	652600419840040960	f	taimmobile
The fresh + healthy fast casual trend is here to stay and @Bisnow agrees! 20 Chains Giving Shake Shack a Run....https://t.co/JyFI1HqfgC	1444402826	652498864071688192	f	taimmobile
Hahah. Thanks, we agree! Healthy + Tasty + Cheap = Winner winner falafel dinner.  https://t.co/j04PPa5R90	1444402635	652498060287848448	f	taimmobile
Overheard at Taim: This falafel changed my whole day - @SkurnikWines win firsttime nyceats simplepleasures	1444328503	652187128248565761	f	taimmobile
We will not be on Vandam and Varick today - sorry!  Come visit us on Spring Street or Waverly Place!	1444321875	652159329412378624	f	taimmobile
Brain food for NYU students falafel cheapeats vegetarian organic vegan glutenfree  https://t.co/W2CzgHXNCq	1444235199	651795784472625152	f	taimmobile
Come meet @EinatAdmony and 70+ other chefs tonight at @CityHarvest BidAgainstHunger. All for a good cause. Plus the food is beyond amazing!	1444234973	651794838426382336	f	taimmobile
Happy humpday!  Come see us on 20th and 5th today for a delicious falafel sandwich!	1444232987	651786505950773248	f	taimmobile
20th and 5th today! Come enjoy a falafel sandwich while the sun's still out!	1444147757	651429027983564800	f	taimmobile
RT @iLongevity: Someone should tell the Pope about the 10 healthiest food trucks in NYC https://t.co/omuj4B0VAo PopeinNYC Foodie http://...	1444069969	651102760486707200	f	taimmobile
Water and Broad Street today!	1444062853	651072915237158913	f	taimmobile
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
Hey nobody has free parking in NYC, but if u find the spl Monopoly Here & Now @sweeterynyc u'll get a hat full of ice cream & a cookie free!	1440182159	634796103632822272	f	sweeterynyc
There is no need to pay a Luxury Tax, just come & get your free Monopoly cookie & ice cream in a hat. We will be on 8th Av btw 56 & 57th St	1440180067	634787329652203520	f	sweeterynyc
B&O Railroad won't take u there but if you head to 50Th St off of 3rd Av u won't need to pass Go to get your free Monopoly ice cream treat.	1440171224	634750240155938817	f	sweeterynyc
RT @EaterVegas: Breaking: R.I.P. Kerry Simon 1955-2015 http://t.co/ueU9APXpWn http://t.co/LgvHkVmlwX	1441989988	642378685484433408	f	lovemamak
RT @Cater2me: More Malaysian demand the people of NYC! We're so happy to celebrate our 100th order w/ @lovemamak. Many more to come :)	1439919392	633693977598799872	f	lovemamak
Celebrate New Years Eve with Us !!  http://t.co/YHbJCrYe9T http://t.co/85XYlpJFTY	1419965480	550001205133737984	f	elpasotruck
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
SHAKSHUKA GOALS!  Happy FRIDAY! Today - 47th St & Park AV ! Here until the LAST EGG Shabbat Shalom NYC ! http://t.co/bKTX48WR3B	1445005415	655026303394037760	f	shukanyc
THURSDAY'S AT OUT FAVORITE  @nyuniversity ! Today - NYU -W4th St & University Pl  Have a SHUKA DAY !  http://t.co/KNPH3NxTGD	1444917777	654658726054400000	f	shukanyc
THE SHUKA TRUCK WILL BRING THE PEACE TO THE MIDDLE EAST!  Today- FIDI - Hanover Sq ! Have A SHUKA Day !  http://t.co/5dPnbd3sWG	1444748892	653950367382786048	f	shukanyc
SHUKA TRUCK NEW SCHEDULE:\nSunday-\n67th St & Broadway \nMonday-\n21st St & 5th Av \nTuesday -\nFidi- Hanover Sq... http://t.co/5esM1lr3g5	1444660583	653579974314602497	f	shukanyc
Sundays are UPPER WEST SIDE! 67th St & BROADWAY  http://t.co/gXBGpuHunH	1444574618	653219412808474626	f	shukanyc
SHUAK FRIDAY! Today 21st St & 5th AV ! Thank you @ultrateg for the GREAT PICTURES! Shabbat Shalom! http://t.co/Hz0eVwHfNQ	1444401200	652492043260952576	f	shukanyc
THURSDAY AT NYU - W4th St & University Pl! Here until the Last EGG! http://t.co/DkMaBJ3i31	1444317118	652139376361664514	f	shukanyc
SHUKA FOR LIFE! WE ARE BACK ! Today - 47th St & Park AV ! Here until the last EGG! Have a SHUKA DAY ! http://t.co/HTg8TSynUw	1444230470	651775949864837120	f	shukanyc
@vivekshenoy closed for the Holiday! Will be back tomorrow!	1444157103	651468225096630272	f	shukanyc
@bydmor impossible to park over there.	1443922823	650485585904279552	f	shukanyc
@bydmor upper west side! Check for updates in the morning!	1443916096	650457368673828864	f	shukanyc
RT @EdenEats: This will keep you warm this weekend @ShukaNYC shakshuka- video and recipe on the blog! http://t.co/ZELkJdn18a  edeneats	1443821386	650060127307964420	f	shukanyc
RT @EdenEats: I spent the day with the @ShukaNYC boyz cooking and eating up a storm!!! New Vid up -http://t.co/ZELkJdn18a edeneats	1443799905	649970028981420032	f	shukanyc
THE SHUKA TRUCK  THANK YOU  @edeneats_ for a great visit !  Today 47th St & Park AV ! SHABBAT SHALOM  http://t.co/S2Ebn9orRd	1443796720	649956670093807617	f	shukanyc
RT @EdenEats: Shakshuka makes the world go round  new video up on the blog! @shukanyc eeeeeats edeneats https://t.co/BSUcdyYgWV	1443789805	649927666792013824	f	shukanyc
@bumbleb33x222 Monday!	1443721148	649639697925300224	f	shukanyc
@Angelle_K Tuesday's!	1443620957	649219468787326976	f	shukanyc
@Fallarnon Tuesday's!	1443620949	649219432083025920	f	shukanyc
@KatyCarlizzle Tuesday's !	1443620939	649219391041740800	f	shukanyc
http://t.co/wfdVU1lq6D	1443471766	648593715745980416	f	shukanyc
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
http://t.co/YHbJCrYe9T http://t.co/KB24a8uHoc	1419888169	549676937963393026	f	elpasotruck
Make your reservations today : http://t.co/YHbJCrYe9T http://t.co/OUbTh45CWh	1419639881	548635544377643009	f	elpasotruck
WE WILL BE OFFERING THANKSGIVING CATERING THIS YEAR!\n\nDue to the close timing of an exciting upcoming project we... http://t.co/O9XW9T0FAw	1444914089	654643253715845120	f	veganlunchtruck
@tummler10 we are in red bank nj this Sunday 9:00-2:30.  What was our old handle? Always been @VeganLunchTruck here on Twitter	1444857173	654404533783764992	f	veganlunchtruck
RT @niftynyc: Cool job alert! Office Manager for The Cinnamon Snail (@VeganLunchTruck): http://t.co/xyl8BGo5s7 NYCjobs vegan	1444846211	654358556519436288	f	veganlunchtruck
A selection of some of the absurdly yummy bao buns featured in our cookbook STREET VEGAN available at your... http://t.co/sieE2BcgBq	1444764738	654016833541001216	f	veganlunchtruck
@DQ90 sorry.  We are not.	1444764396	654015398648631297	f	veganlunchtruck
RT @EpochTaste: This Creme Brulee  from @VeganLunchTruck is a showstopper, w/ 3 diff scrumptious layers http://t.co/ToZwA7AKd6 http://t.co...	1444741371	653918824035651584	f	veganlunchtruck
Lemongrass 5 spice seitan w/ curried cashews, Szechuan chili sauce, greens & wasabi mayo on grilled baguette http://t.co/xJIy1n0U5a	1444577380	653230994678525952	f	veganlunchtruck
Parked at the Red Bank NJ farmers market 9:00-2:30\n\nCandied macadamia pancakes, thanksgiving sandoos, vanilla... http://t.co/hEuvSzDBXb	1444569357	653197345157447680	f	veganlunchtruck
Parked in Brooklyn from 12 o'clock to 6 o'clock at the vegan shop up. \n\n12 grattan St. in Brooklyn\n\nWe have... http://t.co/pPdA4EMbLW	1444492887	652876604478226432	f	veganlunchtruck
Parked in Brooklyn from 12 o'clock to 6 o'clock at the vegan shop up. \n\n12 grattan St. in Brooklyn\n\nWe have... http://t.co/vndEGRHCxo	1444492885	652876597456973825	f	veganlunchtruck
Come eat this salad TMRW! we will be out slinging ultimate vegan noms 12-6\n12 Gratta.... http://t.co/KEYL9bsqyF http://t.co/uAZkdPbkJT	1444418089	652562881310011392	f	veganlunchtruck
@JennDewIt Saturday @veganshopup in Brooklyn 12:00-6:00.  Sunday in Red Bank NJ 9:00-2:30	1444401908	652495012345827328	f	veganlunchtruck
@JennDewIt pollo	1444399996	652486993184718849	f	veganlunchtruck
Learn to make really yummy vegan thanksgiving fare with me @degustibusnyc in a few weeks from now!\n\nTickets here:\nhttp://t.co/aPcIK5q6Hl	1444305748	652091689318895617	f	veganlunchtruck
RT @VegNews: We're drooling over bourbon hazelnut pancakes in the latest VNRecipeClub. http://t.co/nT4giY4FxP @VeganLunchTruck http://t.co...	1444259007	651895642566995968	f	veganlunchtruck
RT @iynf: On a cozy fall day, we miss the @VeganLunchTruck but did you know that @IntegralShop sells Adam's cookbook? vegan vegancookbook...	1444226805	651760578076274692	f	veganlunchtruck
@nerocome_ we aren't out this Friday but Saturday we are at the @veganshopup in Brooklyn and Sunday in Red Bank NJ	1444135214	651376419109502976	f	veganlunchtruck
A cute little vegan cake we made recently for someone who loves to eat sneakers. http://t.co/eH7ZiaE1r0	1443979533	650723444267569152	f	veganlunchtruck
CAS SHINDIG, and Red Bank NJ farmers market are both canceled this weekend, due to potentially crappy weather.... http://t.co/HURx2y67rm	1443793101	649941493214392321	f	veganlunchtruck
THE CINNAMON SNAIL IS HIRING!\nPlease send a resume including 3 professional references to thecinnamonsnail@gmail.com http://t.co/oL6bSm6U6Q	1443717485	649624334139527169	f	veganlunchtruck
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
RT @KatyCarlizzle: Shuka fail. They're on holiday. Empanada time! @NuchasNYC http://t.co/G0OCgMGkZJ	1443567498	648995241735925760	f	nuchasnyc
RT @solberpupusas: Find us in our new @bkflea winter market location, industrycity starting today ! http://t.co/k0exDajiWD	1445085329	655361489772130304	f	milktrucknyc
RT @bkflea: The Grand Opening of our indoor market w/ @smorgasburg is TODAY in @IndustryCityBK, 10a-6p! http://t.co/odFkUcKAkX	1445085293	655361337065918464	f	milktrucknyc
Come eat! @bkflea: The Grand Opening of our indoor market w/ @smorgasburg is TODAY in @IndustryCityBK, 10a-6p! http://t.co/3SVhgQX6LA	1445085288	655361318296363008	f	milktrucknyc
we'll be serving mac&cheese, grilled cheese & milkshakes!@bkflea: Our new indoor market opens in @IndustryCityBK this Sat. + Sun., 10a-6p.	1445083971	655355793127153664	f	milktrucknyc
RT @bkflea: Weve been getting our new indoor market ready all week! See you tomorrow in @IndustryCityBK for the Grand Opening! http://t.co...	1445083514	655353873729765376	f	milktrucknyc
Open @ Bergen St and Court St only till 1pm today!	1445085281	655361287271141376	f	carpedonutnyc
!!! Sat, Oct 17th no truck today! Our shop open 9am-4pm!!! treats Brooklyn	1445084627	655358545064501248	f	thetreatstruck
SoHo today on Hudson & King!	1445348674	656466036808548353	f	domotaco
Check it out! Destruction Unit at Hand & Detail 10/17/15: http://t.co/BcuTzqNjiX on @ticketfly we will be there 12-8! thaietnamese	1445086484	655366330938445824	f	sweetchilinyc
RT @jeaniusNYC: Got Killed Tonight by @korillabbq! K(or)illa Baby Back Ribs w Pineapple Gochujang and Murder Rice!... https://t.co/OhfJsaSa1A	1445088530	655374913419812864	f	korillabbq
RT @chophappy: @NYCWFF @KorillaBBQ has awesome ribs! Much love BBQ chophappy http://t.co/mlJ9uz9bMW	1445086849	655367864866766848	f	korillabbq
RT @LizPsaltis: The @KorillaBBQ crew and @AdamRichman killing it at @Thrillist NYCWFF bbq event ThrillistBBQ http://t.co/3IBtMnnew1	1445086830	655367783694385152	f	korillabbq
RT @JerJacobowitz: I didn't think @korillabbq was literal when they said they had killer ribs at the @nycwff... https://t.co/IqweJGknFZ	1445086823	655367752622972928	f	korillabbq
This weekend in NJ, BigRed, fireworks, bonfires, lobster and wine! http://t.co/kAQjSsJ01i http://t.co/ErU8KnwN7H	1445088678	655375533669249024	f	lobstertruckny
New market alert!! Today we're at the WINTERFLEA at Sunset Park (241 37th Street) along with Williamsburg @smorgasburg and @TheSeaport!	1445090419	655382836619296768	f	milktrucknyc
De TRUCKS:\nMomma Truck @ Park Slope - 7th Ave & Carroll St til 4pm\nKastaar @ York & 86th St til 10pm	1445091045	655385464682192896	f	waffletruck
De CARTS (2/2):\nVedette @ 60th & 5th Ave (Manhattan) til 7pm\nBierbeek @ De Great Lawn, Central Park til 7pm	1445090984	655385206413750272	f	waffletruck
De CARTS (1/2):\nGoesting @ 66th & Broadway til 10pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm	1445090969	655385142161231874	f	waffletruck
SAVOR DE SATURDAY!\nLe Cafe @ 15 Ave B til 11pm\nDe Wafel Cabana @ 35th & Broadway til 10pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1445090951	655385067095760897	f	waffletruck
RT @bookoisseur: The waffles from @waffletruck are the best thing about Saturdays in parkslope. foodporn https://t.co/hLfCbkD5a6	1445090683	655383943886340096	f	waffletruck
Today we are @MadSqParkNYC serving up coffee, baked goods and smoothies. @nycfoodtruck	1445093375	655395236823375873	f	andysitalianice
Good Morning \nWe are located at\nForest Hills Queens \nAustin St. and 71st ave\nUntil 8:00 pm \nkettlecornnyc http://t.co/KC5AWnALO3	1445093570	655396053177335808	f	kettlecornnyc
Join us for some grub at @stannswarehouse. 45 Water Street, DUMBO Brooklyn 12pm to 6pm	1445095975	655406140021415936	f	bigdsgrub
GOOD MORNING  BRONX NY!!\nAUTHENTIC PUERTORICAN CUISINE \nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX... https://t.co/UvqVDopXPe	1445094506	655399979620651010	f	latinkitchennyc
RT @VLAIC: NYC! Tis beautiful in SOHO! We're scoopin on Greene At Prince! Shout out to @lovecoffeenyc @NuchasNYC and our friend at the hot ...	1445099249	655419872457965568	f	nuchasnyc
We are hanging out in Williamsburg on lorimer & meeker listening to great music with great food! thaietnamese	1445099814	655422243007299584	f	sweetchilinyc
What a great fall day for a carls famous cheesesteak 86th st bet 3rd Av /lex GOT WHIZ? NYCSBEST CHEESESTEAKS FOR ALL http://t.co/Drk86SM8H5	1445100259	655424107605979136	f	carlssteaks
What a great fall day for a carls famous cheesesteak 86th st bet 3rd Av/lex GOT WHIZ? NYCSBEST CHEESESTEAKS FOR ALL http://t.co/GYA6qQj3Ch	1445099605	655421367425355777	f	carlssteaks
Come visit our Nolita location today for a free falafel sandwich thanks to our friends at... https://t.co/GGkxUX4iSg	1445098131	655415184626872320	f	taimmobile
RT @NYAMHistory: Lunchtime! Head to our cafe or visit @NeaExpress & @PolishCuisine outside. NYAMEats	1445101922	655431086453989377	f	neaexpress
tristate mashup bestfoodtrucks nyrules camionmeanstruck tacos meadowlands @ Meadowlands Racetrack https://t.co/kuZ1yyDwUN	1445101616	655429799989682176	f	camionnyc
bestpizza @Valduccis @MrVsPizza @greenboxny @foodNfest http://t.co/jrhGr6AL84	1445103905	655439400617320448	f	valduccis
TOMMORROW SUNDAY OCT 18TH\nSUNDAY BRUNCH DAY PARTY 1PM-7PM\ndoncoqui.newrochelle \nRadio Video &... https://t.co/gQt2gUx2Zu	1445105153	655444634697650176	f	latinkitchennyc
Tommorow  SUNDAY OCT 18TH\nSUNDAY DAY BRUNCH 1pm-7pm\ndoncoqui.newrochelle \nHost:\n@stephsdope \nRSVP NOW... https://t.co/4PlcMRZBed	1445104990	655443954532528128	f	latinkitchennyc
LAST CHANCE TO RSVP.. MUST CALL BEFORE 5PM\n914-648-4848\n\nTOMMORROW SUNDAY OCT.18TH \nDON COQUI'S NEW... https://t.co/ikPueNohAj	1445104873	655443460317671424	f	latinkitchennyc
The Most Iconic Dishes From Around The World | by @Kbratskeir for @huffpostfood http://t.co/LzDGA1NFXW http://t.co/pR1zV0xb1i	1445110523	655467158449881088	f	souvlakitruck
Oh de many ways to get your dinges fix! dingesforeveryone https://t.co/1coBXAcs1J	1445109985	655464904527355904	f	waffletruck
This will be the view from BigRed at Laurita Winery during sunset at the food truck festival http://t.co/1jMSw6a5Fi http://t.co/QsZCCCQLie	1445110275	655466118723825664	f	lobstertruckny
RT @ExposureNJ: Foodtruckmashup @foodtrucksin @FoodDudeNJ @njisntboring @NjFoods @4foodnyc @EaterNY @TheRecordNJ @TheMeadowlands http://t....	1445111115	655469644350926848	f	gcnyc1
RT @LunaParkNYC: Take a piece of Coney Island home with you today! Select LunaParkNYC & ThunderboltNYC merchandise is 50%! http://t.co/GK...	1445117373	655495888920518656	f	coneyshack
Interested in catering parties events contact our Director of Marketing (Eva) and we will make it all happen!... http://t.co/pK6Pejakar	1445117066	655494604020518912	f	polishcuisine
WE ARE AUTHENTIC PUERTO RICO!\nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX NY... https://t.co/Wd2Zv1zKgo	1445116599	655492643087130624	f	latinkitchennyc
RT @rebekahlowin: thanks @USAFoodTruck for this awesome early dinner! and miles to go before our foodtruckmashup adventure ends... http://...	1445115923	655489806936506368	f	usafoodtruck
We r Rockin the Cheese tonight foodtruckmashup\nComeToTheCheeseYo	1445118922	655502385914236929	f	gcnyc1
RT @BrookeSassman: Here at the foodtruckmashup for another episode of trucktales! Have a favorite truck? Tweet me! @TODAYshow  http:...	1445118769	655501746203140096	f	gcnyc1
RT @BrookeSassman: Quite possibly the best story I've ever heard behind a truck foodtruckmashup @USAFoodTruck trucktales http://t.co/ki65...	1445120738	655510002610905089	f	usafoodtruck
Truck is at private event! Sorry RT @jesskmcq: @dubpies guys I'm drunk at the Aussie CMJ showcase. Where are you tonight? Need you!	1445125870	655531531319050240	f	dubpies
RT @jbakernyc: Belated PiePartyICE post on the blog! http://t.co/HmONPoNXZo\n\nThanks again to sponsors @TovoloHome @Anolon @dubpies @cabotc...	1445125817	655531309381623808	f	dubpies
Where were you when you made this observation? ;-) RT @disgruntledSG: at least the @dubpies  are good.	1445125783	655531162958503936	f	dubpies
RT @ezCaterInc: NYC: Don't miss the latest installment of our GlutenFree Guide series: http://t.co/Xkk4wdDduY http://t.co/mZSASWDzMb	1445125732	655530950558879744	f	dubpies
@pjveal Yeah!... Wait, what? What are you implying?.... ;-) @gemmagracewood	1445124664	655526470488584192	f	dubpies
RT @pjveal: @gemmagracewood Brooklyn Weepu like he was heading off to interview for a job on the pie truck @dubpies	1445123966	655523542667251712	f	dubpies
WHAT MAKES OUR BRUNCH DIFFERENT THAN THE OTHERS?\nANSWER : BOTTOMLESS EVERYTHING!!!\nALL THOSE OTHER... https://t.co/uNLF3nUv0H	1445132624	655559859010719744	f	latinkitchennyc
RT @AdamRichman_FS: @i8and8: e @ThrillistNYC Blues & BBQ at @KorillaBBQ station with @AdamRichman. @jeaniusNYC! @NYCWFF @Thrillist http://...	1445124292	655524910308204544	f	korillabbq
RT @AdamRichman_FS: @LizPsaltis: The @KorillaBBQ crew and @AdamRichman killing it at @Thrillist NYCWFF  ThrillistBBQ http://t.co/XfPetSB...	1445124288	655524895137374208	f	korillabbq
RT @JohnnyPrimeCC: @adamrichman and @korillabbq posing for some pics at the nycwff / thrillist BBQ & Blues event at the... https://t.co/dINpO...	1445124277	655524846865117184	f	korillabbq
FoodTruckMashUp Tristate Pontirossifood Italianfoodtruck Chickenandmushrooms Meadowlands Racetrack http://t.co/IH7HNj5xqu	1445133202	655562284148895744	f	pontirossifood
We will be opened by 11:00!	1445147432	655621968897712128	f	shukanyc
!!! Sun Oct 18th Happy Sunday! Our shop open today 9am-4pm !!!	1445167807	655707424326705155	f	thetreatstruck
Parked at the Red Bank NJ farmers market 9:00-2:30\n\nLavender pear French toast, thanksgiving sandoos, rose water... http://t.co/UEvZeLza3S	1445171939	655724757829177344	f	veganlunchtruck
A the Red Bank NJ farmers market 9:10-2:30\n\nLavender pear French toast, thanksgiving sandoos & rose water toasted pistachio cake donuts	1445173158	655729869259710464	f	veganlunchtruck
BigRed will be serving lobster rolls at the Laurita Winery in NJ. Be enthusiastic! http://t.co/4OD3y4iucl http://t.co/xzOIi05vLH	1445175323	655738950317920256	f	lobstertruckny
Today is our last day @prospect_park of the season!  Join us for the final foodtruckrally!	1445176815	655745209775472644	f	taimmobile
Last Rally of the season. Don't miss out!! 11-6	1445176930	655745690128224256	f	kimchitruck
SundayFunday is happening today at the @prospect_park foodtruckrally at GrandArmyPlaza until 5pm! Brooklyn LebaneseEats	1445178463	655752119270555648	f	toumnyc
Bessie the truck is at Grand Army Plaza today for the Prospect Park Truck Rally. Sandwiches + park = perfect Sunday.	1445176926	655745674806366209	f	milktrucknyc
Come check out the new Winter Flea at Sunset Park (241 37th St) - we're there along with at @TheSeaport!	1445176811	655745192746594304	f	milktrucknyc
RT @NYTTYTTYY: So happy to have @waffletruck on rooseveltisland all day today in front of Starbucks @Rooseveltisland http://t.co/I4f7cZ31...	1445178995	655754350699114496	f	waffletruck
For one free dinges, share your happiest memory so far! dingesforeveryone	1445178985	655754308219248640	f	waffletruck
RT @Binenr9: Still the best waffle in the world @waffletruck  http://t.co/RhrgKXDvVZ	1445177998	655750172127985664	f	waffletruck
DE TRUCKS:\nKastaar @ Roosevelt Island (W Road) til 11pm\nMomma Truck @ 71st Ave, Forrest Hills til 10pm	1445177820	655749424690438145	f	waffletruck
De CARTS (2/2):\nVedette @ 60th & 5th Ave (Manhattan) til 7pm\nBierbeek @ De Great Lawn, Central Park til 7pm	1445177379	655747572133445632	f	waffletruck
De CARTS (1/2):\nGoesting @ 66th & Broadway til 10pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm	1445177357	655747482589241344	f	waffletruck
SUPER DINGES SUNDAY!\nLe Cafe @ 15 Ave B til 11pm\nDe Wafel Cabana @ 35th & Broadway til 10pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1445177313	655747295921745920	f	waffletruck
Fall lunch feel goods at the @prospect_park foodtruckrally - we are there from 11-4pm w/ our award winning rustic seasonal cuisine	1445177457	655747902967558144	f	snowdaytruck
Football Sunday at ShortysNyc Game Sound&& Drink Specials All Day. http://t.co/FVSwF0VwLB	1445179786	655757668754132992	f	shortysnyc
That's a cold chill today.. The pier is closed this weekend so y'all don't freeze your kiesters. Grand Harvest Wine Festival next weekend!	1445179927	655758259941449728	f	nautimobile
Ready to strut our stuff. Get yo' sammie on GrubStreetFoodFestival http://t.co/8mu3pfQJyh	1445181954	655766763335000064	f	kimchitruck
Come Join The Fun\nAt A New York City Street Fair\nWe are located at \n88th and Broadway \nUntil 5pm \nkettlecornnyc http://t.co/sRqUEniLG9	1445181818	655766190992678912	f	kettlecornnyc
TODAY SUNDAY OCT.18TH \nDON COQUI'S NEW ROCHELLE \nDAY BRUNCH PARTY \nWE ARE THE ONLY DAY BRUNCH PARTY... https://t.co/Y2EFKg66ms	1445181805	655766140040384512	f	latinkitchennyc
IT'S SUNDAY FUNDAY!!!\nON THE WAY TO \ndoncoqui.newrochelle\nSUNDAY DAY BRUNCH PARTY \nDOORS OPEN AT... https://t.co/eayelasYPO	1445180982	655762687197081602	f	latinkitchennyc
SHAKSHUKA JUNGLE  Sunday are  67th St & Broadway  HERE UNTIL THE LAST EGG! http://t.co/74kU0WdGtT	1445182417	655768705612189696	f	shukanyc
Visit PieTruck @ Grand Army Plaza, tell Jarrett you like his hat, get free Apple Pie w/ purchase! Until 5pm	1445183261	655772246317867008	f	dubpies
PieTruck @ Grand Army Plaza, Brooklyn 'til 5pm. http://t.co/EgE0nA1wNH	1445183204	655772006999265280	f	dubpies
At grand army till 4pm - serving up seasonally inspired rustic cuisine and as always a side of social justice http://t.co/duQlnVgHJv	1445183179	655771901831303168	f	snowdaytruck
SHAKSHUKA JUNGLE  Sunday are  67th St & Broadway  HERE UNTIL THE LAST EGG! http://t.co/lHfQBAkB3C	1445183425	655772933604909056	f	shukanyc
http://t.co/ZjcmgjDhbn	1445185405	655781237253132289	f	kettlecornnyc
GOOD MORNING  BRONX NY!!\nAUTHENTIC PUERTORICAN CUISINE \nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX... https://t.co/bDc8eCfmIP	1445184569	655777729682477056	f	latinkitchennyc
Sunday Football-- $5 Jameson every time the @nyjets score -- Need them to beat up the 'skins to help out the Birds. @Eagles FlyEaglesFly	1445184183	655776111884943361	f	shortysnyc
@rebekahlowin was our pleasure to take care of you. Come back any time.	1445186051	655783948178628608	f	usafoodtruck
RT @NY_Places: Grand Army Plaza is buzzing: http://t.co/VklzTBlLvx - RT @dubpies PieTruck @ Grand Army Plaza, Brooklyn 'til 5pm. http://t...	1445187308	655789219298869252	f	dubpies
@DeinyaP our pies are already in Boston, check out @cuppacoffeeMA, chur @jacquestorres	1445190310	655801811467640832	f	dubpies
PLEASE RT:\n\nHave your Thanksgiving catered by The Cinnamon Snail!\n\nMenu and ordering deets here:\nhttps://t.co/GBvhsuRdDG	1445190941	655804458761367552	f	veganlunchtruck
BOTTOMLESS EVERYTHING! !\ndoncoqui.newrochelle \nSUNDAY DAY BRUNCH PARTY\nHosted by:\n@stephsdope \nPARTY... https://t.co/2JlEaFjpUx	1445193452	655814987236122624	f	latinkitchennyc
YEA ...WE ARE HERE!!!\ndoncoqui.newrochelle \nMake your way here!!! @ DON COQUI https://t.co/TNTjRHDO2N	1445193266	655814207359877121	f	latinkitchennyc
Hey folks head over 67th st /Broadway till 8 pm grab a carls famous cheesesteak GOT WHIZ? nycsbest cheesesteaks for all	1445194530	655819508548894720	f	carlssteaks
Hey folks not too late to head over 67th st /Broadway till 8 pm grab a carls famous cheesesteak GOT WHIZ? nycsbest cheesesteaks for all	1445194423	655819060207292416	f	carlssteaks
RT @chrissyteigen: Someone told me fatburger is the leanest burger of all fast food burgers and boy we are really running with this maybe-f...	1445195299	655822736971988992	f	milktrucknyc
RT @plated: Amazing demo from the guys at @sfoglini at NYCWFF on the platedroadtrip! Hello, porcini pasta. http://t.co/sZlzI0Gf6Q	1445195279	655822651974418432	f	milktrucknyc
RT @MarketsNYC: The @BrooklynFlea's winter digs in Industry City are beautiful. And not a bad subway ride at all! Market... http://t.co/J9...	1445195184	655822252152332292	f	milktrucknyc
RT @smorgasburg: Craftober is happening all month at our bar at @TheSeaport! More here: http://t.co/Yhoq8Fum9p http://t.co/2zeMM2wCCJ	1445195160	655822152088866816	f	milktrucknyc
RT @smorgasburg: Sunday Smorg in Prospect Park is closed for 2015! Visit us in our brand new location in @IndustryCityBK w/ @bkflea! http:/...	1445195123	655821998476673024	f	milktrucknyc
What Do Top Chefs Buy At The Grocery Store? http://t.co/03Xc0B5pPh via @YahooFood http://t.co/YS9cSin2kW	1445197248	655830911917957120	f	souvlakitruck
BRUNCH ANYONE? @ DON COQUI https://t.co/LN7AVTyljQ	1445194875	655820959472091137	f	latinkitchennyc
Are you a wine enthusiast who enjoys lobster? BigRed will be at Laurita Winery tonight http://t.co/lUiMtWwYVi http://t.co/DIcW6yK7OC	1445196690	655828571450163200	f	lobstertruckny
Full House!\ndoncoqui.newrochelle @ DON COQUI https://t.co/j8p16ENR2g	1445203222	655855966659981312	f	latinkitchennyc
THE MS. @stephsdope AT doncoqui.newrochelle \nSUNDAY DAY BRUNCH!! @ DON COQUI https://t.co/TZ0KOzyZZB	1445208105	655876448402743296	f	latinkitchennyc
1 SUNDAY BRUNCH DAY PARTY\ndoncoqui.newrochelle \nNext Sunday Oct.25th \nThe Official bday party for... https://t.co/CZHuz5CuoD	1445206028	655867736086728712	f	latinkitchennyc
NO CAPTION NEEDED\ndoncoqui.newrochelle \nSUNDAY DAY BRUNCH @ DON COQUI https://t.co/yLocJWIJU3	1445209529	655882419594203138	f	latinkitchennyc
@stephsdope\njimmydoncoqui doncoqui.newrochelle @ DON COQUI https://t.co/rhTSvdgF21	1445208348	655877465861169152	f	latinkitchennyc
RT @Rooseveltisland: Started Roosevelt Island Day with @Waffletruck - Delicious Elvis Waffle With Peanut Butter, Bacon And Banana, Yum\nhttp...	1445209183	655880971506589697	f	waffletruck
LATE NIGHT W/DE TRUCKS:\nMomma Truck @ 71st Ave, Forrest Hills til 10pm\nKastaar @ Roosevelt Island (W Road) til 11pm http://t.co/fwdOVlDIuR	1445214591	655903652197044224	f	waffletruck
@disgruntledSG funny guy, was that the CMJ show at Piano's?	1445214865	655904801058914304	f	dubpies
Bbbbrrrr it's cold outside - continuing our special HuntersStew this coming week! GetReady Promoting Polish... http://t.co/SABtFWiPor	1445219190	655922943562682368	f	polishcuisine
doncoqui.cityisland \n@stephsdope djluchony and RENE DON COQUI (without an Instagram!!!l) @ DON COQUI... https://t.co/QstzvFIK4w	1445218411	655919673469464577	f	latinkitchennyc
RT @22twings: A little piece of heaven, courtesy of @waffletruck. Turtle waffle... w/ fresh strawberries. Wafles&Dinges http://t.co/Bxe9PU...	1445219870	655925794565410816	f	waffletruck
@angeleeeeeek in that case, if we find it, we should destroy it, yeah?	1445221239	655931534428524544	f	dubpies
@angeleeeeeek have texted tomorrow's driver/server to ask him to take a look. If you don't hear by lunchtime can you please reminder us?	1445220376	655927916782600192	f	dubpies
It's kielbasa & pierogi Monday traditional authentic PolishTruck GetReady NYC http://t.co/NaVVrAj3Vc	1445220355	655927830291853312	f	polishcuisine
RT @LibertyParkNJ: Many thanks to @thegreenradish1 food truck for serving fast veg grub at http://t.co/VvCVaAkJSC Nov. 1st. SaveLSP http...	1445246805	656038768693149696	f	thegreenradish1
5 spice crispy calamari taco we seriously need to get together and make this happen. 48th st between 6 & 7 ave 11-3p http://t.co/9I4TpvIrr1	1445251676	656059198745255936	f	coneyshack
Thanks you @alisaym the first review goes down in history, will never forget, today at 48th &6ave today, see yousoon https://t.co/dzjjBkZt6Q	1445253836	656068257963712512	f	coneyshack
RT @hertzny: STAND UP SPEAK OUT re:Youth in Prison, solitaryconfinement Tuesday 10/20, Foley Sq, noon @JohnJayPRI  @SnowdayTruck http://t....	1445253674	656067579052716032	f	snowdaytruck
RT @EmpanadaLady013: @thegreenradish1 @NJFTA myfavorite greenfoodtruck besitos	1445254740	656072050197594113	f	thegreenradish1
corner of Water street & Hanover Sq today FiDi NYC FinancialDistrict (by apple bank)	1445255730	656076201811922944	f	polishcuisine
Good morning \nlet's put a smile lots of energy and a delicious earthy breakfast,\nJoin us.the truck @ North east 52nd and Park.	1445256684	656080204587212800	f	etravaganza
D2 is grillin' it up at 53rd/Park Ave. backtoworkmondayssuck but it doesn't have to be!! http://t.co/TCbBtLfPk2	1445261369	656099851869016064	f	bigdsgrub
Join D1 today at 33rd Street and Park Avenue for lunch. Preorders call 646-543-BIGD http://t.co/fMDUqAntDG	1445261182	656099068565966848	f	bigdsgrub
Well hello there LebaneseLunchers! Join us in @DumboNYC on Jay & Water St until 3pm for mouthwatering shawarma http://t.co/t34IzV5NzC	1445261202	656099154796613632	f	toumnyc
Peeps, we are off the road 2day	1445261339	656099728023769088	f	fritesnmeats
@Under_aRmur not on the road 2day bud:( happy birthday!	1445261305	656099583706140672	f	fritesnmeats
Catch us up on 50th & 6th today!	1445261216	656099210547216384	f	biandangnyc
Tacos gonna make you tackle Monday like a boss. Broadway & 55th Ave., 11:30 - 2:30	1445261562	656100662544048128	f	kimchitruck
MASSIVE MONDAY! \nLe Cafe @ 15 Ave B til 11pm\nDe Wafel Cabana @ 35th & Broadway til 10pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1445262307	656103787912896512	f	waffletruck
RT @EaglesCheer: We had such a great time on @GMA this morning! \n\nThanks for having us! FlyEaglesFly http://t.co/0Sio3G1chD	1445261832	656101794976804866	f	shortysnyc
@ed_nini indeed we are. 4 locations in Manhattan, sure to be the best place in NYC to watch @Eagles on MNF	1445261792	656101628680998912	f	shortysnyc
Special treat to B&H today we are @33 St bet 8&9 serving lunch from 11:30-3:30 order online @www.schnitzi.com schnitzitruck	1445262162	656103178119880704	f	schnitzi1
Last week to catch us at UrbanSpaceGarment on 39th & Broadway!	1445262028	656102619631456256	f	domotaco
Film shoot in our regular location so catch us down on 50th & 6th today!	1445261738	656101403098750980	f	domotaco
Let the feast begin! MuchasNuchas http://t.co/9uWgUOwqSv	1445262852	656106073636515841	f	nuchasnyc
Check out this week's special: Grilled Lemongrass chicken grinder on BigD1	1445262970	656106567411113984	f	bigdsgrub
RT @keithbacker: Monday woot! https://t.co/g6Kr61JQVe	1445262997	656106680644714496	f	kimchitruck
It feels like fall now \nTry our fall season flavors \nPumpkin spice and Apple Spice\nWe are located at \n40th and... http://t.co/EWuz29BVBI	1445263161	656107369269559296	f	kettlecornnyc
De TRUCKS:\nKastaar @ Columbia University (Broadway, btwn 115th St & 116th St) til 10pm	1445262352	656103975163424768	f	waffletruck
De CARTS (2/2):\nVedette @ 60th & 5th Ave (Manhattan) til 7pm\nBierbeek @ De Great Lawn, Central Park til 7pm	1445262333	656103898197925889	f	waffletruck
De CARTS (1/2):\nGoesting @ 66th & Broadway til 10pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm	1445262324	656103858154917888	f	waffletruck
RT @CleanPlates: Cinnamon Snail can cater your vegan Thanksgiving! @veganlunchtruck Check it out: http://t.co/87NM07sLRa	1445262779	656105766890418176	f	veganlunchtruck
HappyMonday we are in the amex cafeteria @AmericanExpress @BrookfieldPLNY 1130-2!	1445263905	656110491685756928	f	sweetchilinyc
Only two weeks left on the streets this year :( make them count and get your Phil! 47/park 11-2	1445263887	656110414460231685	f	philssteaks
I posted a new photo to Facebook http://t.co/nRgkSLkBDs	1445264424	656112665786380288	f	polishcuisine
Monday lunch on 47th bet Park and Lex..\n\nCall in orders to: 917-756-4145	1445265648	656117801606754304	f	disosnyc
For one free dinges: If you could personally deliver a wafel to any celebrity, who would it be? dingesforeveryone	1445265289	656116294186586112	f	waffletruck
Lunch today at 47th & Park!!	1445265106	656115528453521408	f	korillabbq
BigRed is off the streets today. Warm up with some creamy, old fashioned New England clam chowdah at BwayBites http://t.co/OXdtSxK66w	1445265034	656115227747090432	f	lobstertruckny
SHUKA TRUCK SCHEDULE:\nSunday-\n67th St & Broadway \nMonday-\n21st St & 5th Av \nTuesday -\nFidi- Hanover Sq\nWednesday... http://t.co/AiCwoFDZiE	1445265734	656118160710459393	f	shukanyc
Hey folks not too late to head over 67th st /Broadway till 8 pm grab a carls famous cheesesteak GOT WHIZ? nycsbest cheesesteaks for all	1445266548	656121576807510016	f	carlssteaks
Front and Adams st till 2:30 @DUMBOFoodTrucks	1445267230	656124436127621120	f	kayanyc28
RT @nobreadnyc: Fast Casual done right  @korillabbq is the perfect spot for our glutenfree lunch fix! Check out... https://t.co/fYQUadId...	1445267495	656125549836922880	f	korillabbq
RT @mokbar_nyc: Holy Smoke! Chef @choibites representing @korillabbq tonight with her K(or)illa Korilla Pineapple... https://t.co/VQxhnVwgI2	1445267469	656125439228911616	f	korillabbq
Super cool to wake up to this great review + photo from the glutenfree experts @nobreadnyc! Visit... https://t.co/WgoCnS6dj4	1445267284	656124664729751552	f	korillabbq
On Water and Broad today!	1445267314	656124790495834113	f	taimmobile
Open & Ready on corner of Water St. & Hanover Sq. FiDi NYC special HuntersStew Come & Get it! @DowntownNYC http://t.co/zOVitpvU84	1445268059	656127915525042176	f	polishcuisine
Open & ready for some pierogitime on corner of Water St. & Hanover Sq! Special HuntersStew available Come & Get it! NYC	1445267910	656127288770060288	f	polishcuisine
Hola Dumbo! guacamole tortas tacos flautas @MexicoBlvd @dumbolot	1445268575	656130075797168128	f	mexicoblvd
GOOD MORNING NYC!!\nWE WOULD LIKE TO TAKE THIS TIME TO THANK EVERYONE WHO CAME TO doncoqui.newrochelle... https://t.co/oMFQMo83rh	1445268683	656130530782629888	f	latinkitchennyc
Serving up lunch till 2pm! cafeteria http://t.co/173LpcspIV	1445268875	656131335464034304	f	sweetchilinyc
Happy monday MondayMotivation we are at amex cafeteria till 2! thaietnamese @ 200 Vesey Street https://t.co/0WHJFg0gea	1445268622	656130276037300224	f	sweetchilinyc
Grab lunch today @MackCaliProp Hudson&Columbus till 2pm getrad eatplants JerseyCity @jc_eats @NJFTA @njdotcom http://t.co/tivDB2ZvlG	1445270012	656136104639352832	f	thegreenradish1
PieTruck is @DumboLot until 3pm. Get in there Dumbo Brooklyn tech foodtrucks savorypies flatwhites	1445270251	656137109296848896	f	dubpies
Didja hear? We're doing the burrito boogie on Broadwa & 55th today.	1445270426	656137843367137280	f	kimchitruck
Free sweetpie or Lamington @ PieTruck if you say Rockstar to @goodygats (our server) when buying SavoryPie. Pls RT	1445271162	656140928143511552	f	dubpies
Have you tried our pollo Asado platter??	1445270756	656139224484335616	f	etravaganza
This weekend BigRed is heading to Hoboken to rock and roll at RockTheBBQ! Get tickets here http://t.co/h5yteKYBgC http://t.co/TxtPDlYN4I	1445270458	656137977651924994	f	lobstertruckny
Hanover square and water street in the financialdistrict serving some beautiful sandwiches and much more! http://t.co/Sw0XUsaPg3	1445271516	656142411211677696	f	jolly_fat_pig
D1 is at 33rd/Park Ave today, now until 2:30pm http://t.co/sazOwtUlJS	1445271764	656143453370384384	f	bigdsgrub
@mzcoach22 please email me at christine@toumnyc.com	1445271336	656141657021239296	f	toumnyc
Good people @dumbolot - can we get webcam shifted to the left? Can't see PieTruck! http://t.co/6aatIjlNJK	1445272156	656145097617186816	f	dubpies
THIS SUNDAY OCT.25 1pm-7pm\nWE ARE AT IT AGAIN!!\nTHE 1 SUNDAY BRUNCH PARTY IN THE TRISTATE!!\nTHE... https://t.co/OvKBjV7TMR	1445271662	656143027262636032	f	latinkitchennyc
Schnitzel for lunch!  We are on 47th & Park.	1445271865	656143875468361729	f	schnitznthings
We are looking for bakers to work at our Brooklyn kitchen overnight. \n\nPart time/full time. \n\nSend resumes to thecinnamonsnail@gmail.com	1445272595	656146938388217857	f	veganlunchtruck
PHIvsNYG MNF 8:30pm Game Time. Join us for Happy Hour 4pm-7pm. ShortyNyc FlyEaglesFly http://t.co/mAxZvvWLCl	1445273509	656150771814170624	f	shortysnyc
RT @keithbacker: Monday Kimchi Fish Bowl to warm up midtown with @KimchiTruck. Get involved! http://t.co/VrHyhDxucy	1445274140	656153420143984641	f	kimchitruck
17th & 5th. We're here for your noodle needs! Get some hot off the wok Thai noodles! mamuthai	1445274513	656154984321556480	f	mamuthainoodle
Let's go, tacos! Broadway & 55th until 2:30 pm	1445274924	656156705391251456	f	kimchitruck
RT @jennifermattson: Broke out the winter coat and boots for my @bkbrains class today. Lunch~ @KimchiGrill http://t.co/UmqkQpfyx0	1445276215	656162122607497216	f	kimchitruck
@angeleeeeeek we found it and cut it up for you!	1445275920	656160886365794304	f	dubpies
@mzcoach22 check your DM	1445277585	656167868627861505	f	bigdsgrub
Here on Broadway & 55th, slinging tacos, wings & kimchi goodness. Swing on by.	1445277660	656168184664489985	f	kimchitruck
Truck spots Wed/Thurs/Fri & Sun !!!	1445278890	656173340147740672	f	thetreatstruck
RT @behindfoodcarts: Even if you're not a vegan, check out our friend Adam of @VeganLunchTruck's new cookbook, Street Vegan! http://t.co/qZ...	1445278882	656173307809669120	f	veganlunchtruck
G1 - scheduled maintenance \nG2 - @QueensCollege \nComeToTheCheeseYo	1445279834	656177303412736000	f	gcnyc1
RedHookLobster is back on UberEATS tomorrow! $15 lobster rolls delivered in 15 minutes https://t.co/lwwDxvaw0d https://t.co/gkp3wQ1eGB	1445279425	656175585442582529	f	lobstertruckny
RT @petepachal: Picking a lunch place is easy when @mamuthainoodle is in the neighborhood. http://t.co/nQhJrUDs3L	1445279922	656177672456945664	f	mamuthainoodle
Is it lunch time? Let us cater your next event DeltaManagement Pontirossifood Italianfoodtruck https://t.co/25n7EhR33c	1445279527	656176014423408641	f	pontirossifood
Get 10% off your first order placed through our NEW app! \n\nText SHORTYS to 33733 to download now!\n\nOffer valid on... https://t.co/ev1Yc7RkIK	1445283002	656190589097132032	f	shortysnyc
RT @BalaboostaNYC: Einat Admony Branches Out. Combina Opens November 2015 http://t.co/Tfu91J0gat	1445282735	656189469184380928	f	taimmobile
I WANT TO TAKE THE TIME TO ACKNOWLEDGE ONE OF THE BEST DJ'S IN NYC AND PERHAPS THE WORLD. I HAVE... https://t.co/CCspcNvkCd	1445283114	656191058016141313	f	latinkitchennyc
Now serving Columbia U (116th & Amsterdam)!! Here til 7:30!	1445284357	656196272018345985	f	korillabbq
New GeneralTso tofu exclusively at BwayBites and 733 Franklin ave @urbanspace asiantaqueria nom https://t.co/ORPZoT4966	1445284192	656195581908353024	f	domotaco
Good Evening \nWe relocated to\n72nd and Broadway \nUntil 8:30 pm\nkettlecornnyc https://t.co/s31ESOQg41	1445287615	656209938998501381	f	kettlecornnyc
https://t.co/zqKuusigKL	1445288315	656212871450234882	f	shukanyc
https://t.co/CxLoQKp1bG	1445287899	656211129954254848	f	shukanyc
HappyHour to gear up for MNF PHIvsNYG FlyEaglesFly @Eagles https://t.co/ftFrek3ggk	1445290616	656222524557144064	f	shortysnyc
10 Countries, 10 Food Superstitions https://t.co/uM14EtoDJw by @firstwefeast https://t.co/jGQIsBsRRO	1445292620	656230928033927168	f	souvlakitruck
THE MOST WANTED MAN IN THE BRINX. DO YOU KNOW WHO HE IS? ASKING ALL MY FRIENDS TO REPOST THIS. IF YOU... https://t.co/bMQidRQRNi	1445294510	656238857617281024	f	latinkitchennyc
RT @TheMuppetsABC: That can't miss karaoke night deserves another look and another listen! TheMuppets\nhttps://t.co/gRxTTXWOVE	1445299186	656258471004872704	f	sweetchilinyc
Head of lettuce https://t.co/Nn2RnRUNI0	1445298193	656254303645126656	f	snowdaytruck
OrderOnline Shortys ShortysNyc ShortysApp Eagles FlyEaglesFly https://t.co/3pqHeyhXbm	1445299892	656261432288350208	f	shortysnyc
@behindfoodcarts great pic! Thanks for sharing	1445300716	656264888092901376	f	philssteaks
RT @behindfoodcarts: Dreaming about a Cheesesteak whiz wit from @PhilsSteaks streetfoodlife https://t.co/3FBshMOklp	1445300605	656264419496824832	f	philssteaks
RT @Eagles: Eagles capitalize off Mufasa's INT, tying NYGvsPHI at 7.\n\nSing it, EaglesNation: FlyEaglesFly https://t.co/Cznh7iwxFZ	1445302953	656274269857542144	f	shortysnyc
FEVER RECORDS & DON COQUI CITY ISLAND PRESENTS: \n WEDNESDAY OCT.28TH A HALLOWEEN CELEBRATION... https://t.co/tgEeg52Mmq	1445308771	656298673282928640	f	latinkitchennyc
RT @jimcramer: Ugly but we will take it; @Eagles ! https://t.co/V0ogSDP2nr	1445309086	656299992576061442	f	shortysnyc
THIS SUNDAY OCT.25 1pm-7pm\nWE ARE AT IT AGAIN!!\nTHE 1 SUNDAY BRUNCH PARTY IN THE TRISTATE!!\nTHE... https://t.co/VSPOgnsarb	1445310623	656306441544933376	f	latinkitchennyc
YEA THIS IS WHAT \ndoncoqui.newrochelle DAY BRUNCH LOOKED LIKE THIS PAST SUNDAY...\nRSVP FOR THIS... https://t.co/iIl5dlRO3Y	1445312301	656313475917041664	f	latinkitchennyc
@Danihum you can follow us here or fb or text 347-506-9616 / 646-644-7932 or email us at alessandro@pontirossifood.com  ciaooooo	1445312031	656312344822312960	f	pontirossifood
RT @Danihum: @PontiRossiFood coming to NY! How do I find you?	1445311974	656312104857767936	f	pontirossifood
Yummm @greenboxny @Valduccis @foodNfest @Foodtruckstars_ @Table87 https://t.co/jX2OGO5zCj	1445318636	656340050481958912	f	valduccis
traditional Tuesday on 47th bw Park & Lexington (sorry midtown west...there was filming at our usual spot!!!!)	1445342725	656441083941883906	f	polishcuisine
RT @DanteFlorence: @dubpies drops the mic @MenInBlazers https://t.co/DB9DpyU3lX	1445343928	656446132038467584	f	dubpies
RT @DanteFlorence: Wow! @sethmeyers double fisting the @dubpies on @MenInBlazers	1445343916	656446080364642304	f	dubpies
pierogi lunch midtown nyc https://t.co/HuEEWxlakO	1445343943	656446194458034176	f	polishcuisine
lunch midtown kielbasa pierogi https://t.co/QMxkCmlw68	1445343784	656445528570380288	f	polishcuisine
kielbasa grill lunch catering midtown nyc https://t.co/DrmCslEfdl	1445343585	656444691890741248	f	polishcuisine
Find us on Jay & Water St. today doing our kimchi thang. 11:30 - 2:30	1445344540	656448697111326720	f	kimchitruck
https://t.co/3hsq787Igd	1445344398	656448102308651009	f	mexicoblvd
Good morning everyone, today we are @33 St bet 8&9 on B&H old loading dock serving lunch from 11:30-3:30 spread the word order online	1445344915	656450271812390913	f	schnitzi1
NEW specials today!!\nD2: 50th Street btwn 6th and 7th Ave\nToday's special: Thai basil chicken in black bean sauce https://t.co/1NpMxBe8Fp	1445346340	656456248913731584	f	bigdsgrub
NEW specials today!!\nBigD1: 53rd Street and Park Ave\nToday's special: Grilled Lemongrass Chicken grinder https://t.co/B9N1T6IJJ2	1445346290	656456039601172480	f	bigdsgrub
@sethmeyers very happy you liked it! Plenty more where that came from! @seann_b @MenInBlazers	1445346829	656458299160682497	f	dubpies
@dubpies in the house! Cc @MenInBlazers  https://t.co/6DL1TbZmyJ	1445346788	656458128406413312	f	dubpies
That was our pie! Yay! https://t.co/zeUSo6eBpU	1445346742	656457935430684674	f	dubpies
Oh yes!  https://t.co/azITSLU94F	1445346597	656457327621443585	f	dubpies
Bessie is at 25th and Park today! Come warm up with a grilled cheese and tomato soup!	1445346012	656454872343023617	f	milktrucknyc
October 31st is our last day out for the year. Catch us while you can! 	1445346357	656456319994429442	f	biandangnyc
bestpizza yumm @MrVsPizza valduccis @greenboxny @Foodtruckstars_ @FoodtoEat @foodNfest @eatupnewyork https://t.co/ZvXJF3xm3I	1445346124	656455339987083264	f	valduccis
Look at that! Not even a dub crumb! RT @MenInBlazers: .@sethmeyers ATE THE WHOLE PIE PieDontLie https://t.co/Rn1F1rKiKB	1445347259	656460101700734976	f	dubpies
RT @carolyninCT: @dubpies  https://t.co/a7oRzrXQgh	1445347039	656459181508038657	f	dubpies
RT @MenInBlazers: @SteveLeer ours are from @dubpies	1445347028	656459131658764288	f	dubpies
No wuckin' furries, mate. We ship nationwide! https://t.co/Ggo9VJ808s	1445347012	656459066139545600	f	dubpies
De TRUCK:\nKastaar @ BROOKLYN COLLEGE (Bedford Ave/Campus Rd & Ave I) til 10pm\nMomma Truck @ NYU (W4th St/Washington Sq & Mercer St) til 10pm	1445347422	656460788056662016	f	waffletruck
De CARTS (2/2):\nVedette @ 60th & 5th Ave (Manhattan) til 7pm\nBierbeek @ De Great Lawn, Central Park til 7pm	1445347221	656459941063106560	f	waffletruck
De CARTS (1/2):\nGoesting @ 66th & Broadway til 10pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm	1445347206	656459880010752001	f	waffletruck
TUESDAY TASTINESS!\nLe Cafe @ 15 Ave B til 11pm\nDe Wafel Cabana @ 35th & Broadway til 10pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1445347087	656459382646034432	f	waffletruck
Our usual Tuesday spot is a no-go today due to street closures. We're on 47th btwn Park & Lexington instead. Join us until 3pm.	1445348590	656465686932410368	f	toumnyc
PieTruck couldn't grab an Old Slip spot so we're @ Hudson St & King St, Soho until 2.30pm. foodtrucks savorypies	1445348368	656464753351639040	f	dubpies
Our pies have been known to amplify one's tingle! https://t.co/CATb81QK1k	1445348171	656463928453500928	f	dubpies
Lunch 2day @ 10 Hanover sq b/t water & pearl st. Burger of the week THE PLOUGHMAN. Preorder 9172929226 fidi	1445348365	656464742991687680	f	fritesnmeats
RT @bryantparknyc: Can't think of a better way to start the day! RT @MikeMGTV: Breakfast in Bryant Park  https://t.co/6p0VwUoUGa	1445348035	656463357604679680	f	waffletruck
Disos slingin sandwiches today on 48th bet 6 and 7 ave.\n\nCall in orders to; 917-756-4145	1445349513	656469557536681984	f	disosnyc
@gta86 we will be on 20th Ave and 5th ave today we open at 11:30	1445349288	656468612862078977	f	jolly_fat_pig
@itsmegnotmeghan we will be on 20th and 5th ave today we open at 11:30	1445349076	656467724177121280	f	jolly_fat_pig
Not all American stores! cheapshipping dryice https://t.co/JFxEFpjW3i	1445349021	656467493439995904	f	dubpies
RT @spidlerc: Hey, Rog...\nCan I crash with you for BlazerCon? I'll bring Old Rosie and some @dubpies. cpfc \nthetingling\n@rogbennett	1445348893	656466956183212032	f	dubpies
Downtown FiDistrict ,we're here and ready to go Old slip & water st 11:30 - 3pm	1445349532	656469634867007488	f	coneyshack
Get yourself a bian dang on Old Slip & Water!	1445348858	656466807193137152	f	biandangnyc
For one free dinges, share a riddle with us! dingesforeveryone	1445349697	656470328487620609	f	waffletruck
BigRed is catering today but we've still got your lobsterlunch covered. Order UberEats for $15 meals in 15 mins! https://t.co/Ru4pPKX1wH	1445349637	656470078469361664	f	lobstertruckny
Disos famous meatballs on the menu today	1445351837	656479303635369984	f	disosnyc
NEW specials today!!\nD1: 53rd/Park Ave\nToday's special: Grilled Lemongrass Chicken Grinder AND Thai Green Curry https://t.co/o65umrXxtm	1445353002	656484191866064896	f	bigdsgrub
W50th and 6th ave today. Get ready by 11:45	1445352756	656483157223546880	f	kayanyc28
financialdistrict downtownNY come check out the new menu on King St & Charlton St around the block from Varick St https://t.co/P437RuuIja	1445353079	656484511207837696	f	mamasheros
NYC. 41st and Broadway till the end of this week and Betsy is at Old Slip & Water St. YDD--the official food of hustlers and go gettas. NYC	1445353324	656485542079676416	f	usafoodtruck
Off today and tomorrow - pvt event in BK. back to 52/6 Thursday and heading to 41/6 Friday for our Wednesday crew who we won't see tomorrow.	1445353500	656486280323276800	f	philssteaks
Come get your falafel fix today on 20th and 5th in flatiron!	1445353342	656485614263504896	f	taimmobile
TUESDAY TUESDAY TUESDAY!! Financial District- Hanover Sq! Have a SHUKA DAY ! Here until the VERY last Egg https://t.co/mHLkxN83ap	1445353668	656486981690634240	f	shukanyc
Update: Bessie is at 27th & PAS for lunch starting now!	1445354254	656489440106385408	f	milktrucknyc
midtown we are ready for you on 47th b/w Park & Lexington special HuntersStew is waiting pierogitime	1445354209	656489254479007744	f	polishcuisine
Happy Tuesday brooklyn we are @dumbolot jay & water 1130-3 today! hotcoffee vietnamesecoffee thaietnamese foodtrucks	1445354624	656490993362051072	f	sweetchilinyc
Society is open for sit downs. 48th bet 6 and 7 ave.\n\nSPECIAL: Disos meatball parm. \n\nCall in orders: 917-756-4145	1445355383	656494177010585601	f	disosnyc
We are at the corner of 36st and Broadway!	1445355400	656494247093379072	f	chefsamirtruck
Off To The Orchard: 5 Great Places To Pick Apples Near NYC | via @Gothamist https://t.co/I4m1qQQ0Kk https://t.co/e2v8s43zdW	1445355325	656493935372713984	f	souvlakitruck
Hi guys. We are on 47th & Park.	1445355833	656496062555947008	f	schnitznthings
Hey folks 2x the cheesesteak love today \nBIG CARL @dumbolot Jay st & water st \nLIL CARL - 70TH ST / YORK AV GOT... https://t.co/RqLiWsUZ2g	1445355237	656493566089256960	f	carlssteaks
slow cooked bbq brisket. flatiron for  the day 20th street and 5thave . Nyc foodie nycfoodtuck classic https://t.co/yy4qygTQnD	1445356438	656498603645648897	f	jolly_fat_pig
RT @debpuchalla: Killa korilla ribs and so very much bbq. spicy meat nycwff foodnetworkfaves foodporn instafood... https://t.co/WdEbXFZ...	1445356229	656497727069626368	f	korillabbq
RT @_MLIU: Went to the @thrillist BBQ & Blues tasting and left with a free rack of ribs from @korilla... http://t.co/cGbBscLtJ2 http://t.co/5...	1445356225	656497707410964480	f	korillabbq
RT @KarlitoJohann: Everyone hyping the Halal Guys here tsk.. Now if Tacos Morelos or Korilla BBQ set up shop, then that's the hype i'd beli...	1445356218	656497677677568000	f	korillabbq
RT @NewYorkCityLux: Jackie L.'s Review of Korilla BBQ - New York (4/5) on Yelp http://t.co/ciJrZUiHlL http://t.co/O7dV4CBeha	1445356198	656497595473334272	f	korillabbq
RT @_Rodimus: now this is life KorillaKoreanBBQyessircravingsbetterthanChipotle @... https://t.co/cyHq3Nk2d6	1445356188	656497552183947265	f	korillabbq
RT @SymriseNA: Lunch @KorillaBBQ in midtown NYC today streetfood http://t.co/8VnIuszGDS	1445356161	656497439587868672	f	korillabbq
Last week here at garment district! Catch us here on 39th and Broadway till 9pm!!	1445356259	656497850109554688	f	domotaco
47th St & Park Ave Happy tacotuesday today's special 3 Fishtacos $10 foodporn camionmeanstruck... https://t.co/bhyHzk9Kga	1445357276	656502115121147904	f	camionnyc
https://t.co/Zq1ZKn6MYX	1445357780	656504232439230464	f	kettlecornnyc
GOODMORNING BRONX NY! \nWE ARE AUTHENTIC PUERTO RICO!\nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX NY... https://t.co/Vu0wyPIjcX	1445357855	656504543551823872	f	latinkitchennyc
Lunch today at 47th & Park!	1445358495	656507227948347392	f	korillabbq
GameSound NLCS MLB No Trivia @shortysnyc Pearl location @ShortysTrivia @TopShelfTrivia https://t.co/o1hXahYy0h	1445358825	656508615268958209	f	shortysnyc
@justin_cohen Fridays a long ways away my man.. U know it's prob unlikely lol	1445360128	656514077909524480	f	disosnyc
RT @cinemaparker: @ConeyShack As your biggest fan, I am prepared to eat 4 tacos today instead of my usual 3. Or maybe not. Never mind.	1445362201	656522774320689152	f	coneyshack
NEED AN HONEST AUTO MECHANIC SHOP WITHOUT BREAKING THE WALLET..\nGO SEE MY BROTHER ERIC AT HIS... https://t.co/E8Sk7cGYQg	1445361785	656521027325984769	f	latinkitchennyc
Good Afternoon \nWe are located at\n86th street and Lexington \nUntil 8:30 pm\nkettlecornnyc https://t.co/wb4eGR498U	1445362706	656524893048172548	f	kettlecornnyc
$7 LUNCH SPECIALS \nMI VIEJO SAN JUAN \n2920 BRUCKNER BLVD \nBRONX NY... https://t.co/Lo08fjf3Q1	1445363330	656527508733612032	f	latinkitchennyc
@gta86 thanks for stopping by	1445364484	656532348612255744	f	jolly_fat_pig
RT @gta86: Just devoured a porkbelly sammich from @Jolly_Fat_Pig one word epic just when I thought it could not get better.. I was proven...	1445364477	656532319927422976	f	jolly_fat_pig
Can't get enough of the Oro di Napoli pizza special at our Wall Street location eaaats https://t.co/umCGvZ8vBY https://t.co/tSdjikrnJK	1445365515	656536674298699776	f	neaexpress
Today we serving dinner at the @RoyalPalmsClub  514 union street Brooklyn ! Come get your zesty Italian food  lasagna on rotation today !	1445370873	656559147534692352	f	pontirossifood
@MurrayNewlands thanks for joining our followers we can't wAit to serve you !	1445370613	656558054046105600	f	pontirossifood
Looking back at the Vendy Awards - Catch us in a flash :30 (first video) - REPOSTING... https://t.co/qpVcWxbWji	1445371750	656562825259683840	f	polishcuisine
Want it, get it, Korilla.  eastvillage burritogawds burritos koreanburritos korilla kbbq... https://t.co/H6esSwPK0W	1445371934	656563598744014848	f	korillabbq
THIS SUNDAY OCT.25 1pm-7pm\nWE ARE AT IT AGAIN!!\nTHE 1 SUNDAY BRUNCH PARTY IN THE TRISTATE!!\nTHE... https://t.co/0zx74BKtQz	1445373868	656571707218595840	f	latinkitchennyc
Serving today at NYU on West 4th West 4th Street and Greene Street New York From 8:30AM-10:00PM EDT https://t.co/foyOPsgLu2	1445373318	656569402213715968	f	waffletruck
Serving at NYU on West 4th West 4th Street and Greene Street New York Until 10:00PM EDT https://t.co/foyOPsgLu2	1445373318	656569400674394112	f	waffletruck
Join us for HappyHour 4pm- 7pm. @shortysnyc https://t.co/Ehzn2mxYWO	1445375704	656579409772609536	f	shortysnyc
We made some changes to the menu! Come check us out!  asiantaqueria https://t.co/AQKp91n8I2	1445374845	656575806840422400	f	domotaco
@SuperJulia Thanks for your inquiry, we will get back to you shortly.	1445376422	656582421224275968	f	kettlecornnyc
Serving in LIC - Gantry State Park,  Center Boulevard and 48th Ave Queens From 6:00PM-10:00PM EDT - wafelsunsets https://t.co/foyOPsgLu2	1445376011	656580696958443520	f	waffletruck
RT @UrbanSpaceNYC: Word on the street is that UrbanspaceVanderbilt will be rolling out a brand new BRUNCH menu within the coming weeks!!	1445380280	656598600605171712	f	eddiespizzany
RT @COOLHAUS: Congrats @COOLHAUSNY @KorillaBBQ @VLAIC @TheTreatsTruck @waffletruck & @milktrucknyc for making the list! http://t.co/aggnTLP...	1445383563	656612373680267264	f	korillabbq
RT @TopTenned: KorillaBBQ: RT UntitledQuiz: Plan: the Uncommons for a coffee and a couple board games, then to korilla for a beasty burrito...	1445383538	656612265798553600	f	korillabbq
RT @PhattFeatures: Shooting a new episode with @korillabbq. They make mean Korean BBQ that you can eat on the... https://t.co/Ox4PLldeOF	1445383514	656612168775966720	f	korillabbq
RT @i8and8: The @ThrillistNYC Blues & BBQ at @KorillaBBQ station with @AdamRichman. Dericious @jeaniusNYC! @NYCWFF @Thrillist http://t.co/l...	1445383497	656612095946006529	f	korillabbq
RT @CarismaPrinting: @Schnitzi1 carismainaction thanks for making the party as awesome as you did!!! https://t.co/vVhkRwK8xz	1445383546	656612302695870464	f	schnitzi1
RT @MrVsPizza: bestpizza @Valduccis @greenboxny @PizzaThrowdown @foodNfest https://t.co/KFFkSQZlhA	1445383807	656613397291782145	f	valduccis
RT @brianscribeNY: @gemmagracewood @dubpies @sethmeyers @MenInBlazers @LateNightSeth Dub Pies are good. I scarfed down a few at Tromadance.	1445385454	656620304547057664	f	dubpies
And @sethmeyers scarfs his first DUB pie to boot! And loves it! https://t.co/BeYe1lhGkZ	1445385374	656619968562376704	f	dubpies
RT @gemmagracewood: Aaahhhhh! Seth Meyers ate a Dub Pie! And he ate the whole thing. A big day for @dubpies.  https://t.co/NraC7H3Rad	1445385199	656619234764656644	f	dubpies
RT @34thStNYC: .@waffletruck & @NuchasNYC kiosks are open through Fall & Winter! Warm hot chocolate & empanadas on chilly mornings: https:/...	1445386246	656623625966100480	f	waffletruck
RT @MrVsPizza: Who Loves the Crust bestpizza @Valduccis @greenboxny @foodNfest @scottspizzatour @FoodNetwork http://t.co/5k9ioOv3d8	1445388673	656633805961326592	f	valduccis
RT @blogenfreude: @MrVsPizza @Valduccis @greenboxny @scottspizzatour would someone who can make a decent thin crust take the space @74th & ...	1445389385	656636793174016001	f	valduccis
Lunch today 47th bet park and lex..\n\nSPECIAL: Disos the infamous meatball parm on the menu today\n\nCall in orders to: 917-756-4145	1445436605	656834848116625408	f	disosnyc
**Change of location for Wednesday  lunch: 47th bet park and Lexington \n\nSPECIAL: Disos meatball parm***	1445397540	656670997311938560	f	disosnyc
@JackDorsey we are parked today at the same spot we want to make it up to you, if you want lunch on us	1445437067	656836783875989504	f	jolly_fat_pig
GoodMorning! https://t.co/rZ0WgNy73a	1445434034	656824064590413825	f	bigdsgrub
D1 is grillin' it up at 41st/6th Ave (btwn 6th and Broadway) Today's special: Grilled lemongrass chicken grinder\n& Thai green chicken curry	1445433003	656819740799815680	f	bigdsgrub
D2 is back in DUMBO Brooklyn. 12pm to 2:45pm https://t.co/fx0Vl1sYgf	1445432937	656819460892962816	f	bigdsgrub
We're closed for a private event today. Back in action tomorrow.	1445435627	656830745063858177	f	kimchitruck
Changing up the location for today. Join us on 46th btwn 5th & 6th for LebaneseEats vegan glutenfree foodporn	1445430983	656811264455385088	f	toumnyc
Varick and Charlton today come and get em hot and fresh newmenu 14choices hungry?	1445436792	656835630299795456	f	mamasheros
Midtown we have a date... 47th and park ave 11- 3pm	1445435863	656831732524654593	f	coneyshack
What a,gorgeous day , come by 47th st and park Ave and let's TACO ABOUT it 11-3pm getttit!!	1445431917	656815185844400128	f	coneyshack
Bessie is at 58th and Madison. Call 646-504-6455 for your pre-orders!	1445432414	656817267401818113	f	milktrucknyc
Good morning!\nDon't miss out the most important meal of the day.\nyou can call us for express pick up at 917-657-0987	1445432961	656819560742567937	f	etravaganza
oldtraditionalpolishcuisine pierogi kielbasa lunch midtown nyc https://t.co/69NdKeVFpb	1445430809	656810538425384960	f	polishcuisine
47th bw Park & Lexington today! midtown lunch special HuntersStew NYC	1445429449	656804834151038976	f	polishcuisine
AUTHENTIC PUERTORICAN AT ITS BEST! !\nIT'S HUMPDAY! !\nTODAY WEDNESDAY OCT.21ST \nWE ARE SERVING LUNCH &... https://t.co/8STZn56Tsc	1445437608	656839053631950848	f	latinkitchennyc
THE LEGENDARY \nLATIN KITCHENS\nHAVANA THURSDAY\nREUNION !!!\nARE YOU READY???\nSTAY TUNED!!! https://t.co/N93v0sjEcM	1445404700	656701026683129858	f	latinkitchennyc
HUMPDAY WEDNESDAY! !!\nTODAY AFTERWORK\nWe Move The Party Inside!!\n$5 Any Shot All Night!!\n$20 Beer... https://t.co/Yk2ovUXs52	1445401297	656686754078920704	f	latinkitchennyc
AUTHENTIC PUERTORICAN AT ITS BEST! !\nIT'S HUMPDAY! !\nTODAY WEDNESDAY OCT.21ST \nWE ARE SERVING LUNCH &... https://t.co/8YivvsQoz7	1445400317	656682641782132736	f	latinkitchennyc
We taking it back!!!\nAre you ready for some SOUL? Then get ready as @tcpent_ brings you 70's Soul Jam... https://t.co/d7PdZxi2QM	1445398776	656676178506420225	f	latinkitchennyc
doncoqui.newrochelle \nSunday Day Brunch Party\nRSVP NOW 914-648-4848 @ DON COQUI https://t.co/uA0Kjthaqb	1445397843	656672268538552320	f	latinkitchennyc
THAT'S WHAT HAPPENED THIS PAST SUNDAY AT doncoqui.newrochelle ...\nMake sure to RSVP for this... https://t.co/zpbg52m9wn	1445396630	656667179035860993	f	latinkitchennyc
Lunch 2day @ Hudson & King. Burger of the week THE PLOUGHMAN preorder 9172929226 soho	1445435461	656830047521763328	f	fritesnmeats
RT @DarrisM1: 2 weeks til NYCMarathon! http://t.co/xIN9OAaEMX Almost $30K LLSUSA @TNTNYC LLSProof @leukaemiauk NYCMarathon  http://t.c...	1445428392	656800398922137600	f	fritesnmeats
RT @DarrisM1: Years later, and still taking the free ride around the park ... relentless4jack https://t.co/oQcuqIerU1	1445428368	656800296522358784	f	fritesnmeats
Looking for humpdaymotivation? ? Come to broadway btw houston & bleeker 1130-3 and get your sweet heat on! thaietnamese spicy chef	1445433561	656822081057898496	f	sweetchilinyc
For one free dinges, If there were a Wafels & Dinges Academy what would you major in? dingesforeveryone	1445437732	656839572391858176	f	waffletruck
Looks a good, delicious morning! dingesforeveryone https://t.co/fOGBXNfHTo	1445437507	656838631869579265	f	waffletruck
De TRUCKS:\nMomma Truck @ ST. JOHN'S UNIVERSITY (DAngelo Center) til 10pm\nKastaar @ CITIBANK LIC (44th Dr btwn 23rd St & Hunter St) til 4pm	1445437103	656836934770302976	f	waffletruck
De CARTS (2/2):\nVedette @ 60th & 5th Ave (Manhattan) til 7pm\nBierbeek @ De Great Lawn, Central Park til 7pm	1445437049	656836707191496708	f	waffletruck
De CARTS (1/2):\nGoesting @ 66th & Broadway til 10pm\nPagadder @ Brooklyn Bridge/City Hall til 9pm	1445437036	656836655593164800	f	waffletruck
WAFEL CRUSH WEDNESDAY\nLe Cafe @ 15 Ave B til 11pm\nDe Wafel Cabana @ 35th & Broadway til 10pm\nWafel Kiosk @ W42nd & 6th, Bryant Park til 10pm	1445436917	656836154835255296	f	waffletruck
47th and park humpdaywednesday	1445438032	656840832193024001	f	biandangnyc
@EmeraldEdibles we'll be back next week Ma'am! But we'll be on 46th in between 5th and 6th on Friday. come gett!	1445405938	656706220716265472	f	usafoodtruck
!!! Wed, Oct 21 12-3:30 45th st & 6th Ave! Then 2nd spot...we'll let you know later!!!	1445436104	656832747084914688	f	thetreatstruck
33rd and Broadway | 39th and Broadway | 47th and park | 733 Franklin Ave, BK asiantaqueria	1445438072	656840998115368960	f	domotaco
Catch us on the corner of 47th & Park today! We'll be back at @dumbolot next week	1445438059	656840943652511744	f	domotaco
47th and park today till 2:30pm!	1445438012	656840747371659264	f	domotaco
Have your thanksgiving catered by The Cinnamon Snail!\n\nMenu and details here:\nhttps://t.co/GBvhsuRdDG https://t.co/ccAy9UPIL2	1445437539	656838765063729152	f	veganlunchtruck
Have your thanksgiving catered by The Cinnamon Snail!\n\nMenu and details here:\nhttps://t.co/GBvhsuRdDG https://t.co/9N5VBeATHl	1445436227	656833261268680705	f	veganlunchtruck
PieTruck is on 46th St @ 6th Ave until 2.30pm. savorypies flatwhites sweets midtownwest foodtruck	1445439521	656847076471513088	f	dubpies
Greenwich and Park Pl till 2:30 baos wednesday foodie	1445439331	656846281449541632	f	kayanyc28
Buenos dias Midtown! saboresdemexico @MexicoBlvd askforextraspicy 51st St & Park	1445439608	656847441812131840	f	mexicoblvd
BIG CARL 47th st bet lex / park @MLB @nfl @UBSamericas @jpmorganchase @SiriusXMNFL @MHFI \nLIL CARL - 70TH ST /... https://t.co/8XQxGhsCtU	1445438928	656844588213145600	f	carlssteaks
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

