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
4fee068ce4b0f9bd2b4041f7	/UQwqaF9knSdh4LFRzAhnh7hcl6_dSjDTg1phtqTe_7Y.jpg	public	milktrucknyc	\N
51bf306a498ed0fde41060d6	/250434_ayEUsJHsbHDQFjUrGrR2fdlBjswuffyRTlWWFrW0-dU.jpg	public	fritesnmeats	f
4f67b0d4e4b08559c4c60149	/SdNxRS0joKXurf0FEv8_SRg-GeR9lGCN098_ZB2tijA.jpg	public	mexicue	\N
50784742498ec6be8cd3f88e	/155927_ebZApDyXpTKTmvOQHdBTxNc2wJrsZV2QASmpYTNAVJM.jpg	public	mexicue	\N
5244712a11d295d581384a17	/22780_QXd0BtJcOWXZwSm_ZG3oXyaNj6Qw5-p8hWQzzH121fY.jpg	public	polishcuisine	\N
5192873e498e63958610c2eb	/117715_Jf2pdeF9ztory7puWsPaFE26jmMzPEzjOfPopvTzSjA.jpg	public	polishcuisine	\N
520912ad11d2f941183dea9f	/13285510_v7K0PTg4FzGI822Jbc9A8K5mUHIxwJPBZB_0xNeEauE.jpg	public	domotaco	\N
50ce269de4b07c1547ebfb2c	/263293_qjcLaRmf5itOMyRiq4AyYZuY2UVjVJk04lO3FTA2CMY.jpg	public	domotaco	\N
4ec59ebacc21b428e0de466c	/4AMXSGP5YGTUHEL3TFKTS5ROVIX4HUTU4MU5ZW1OX5E3URDD.jpg	public	domotaco	\N
50ce2696e4b0881a7ef3ee67	/263293_lcA30Y_JnQGKaaHhRqFUio2HQ8UQkphCWP9yhW4CE3g.jpg	public	domotaco	\N
529fe66b498e1fd14afe696f	/68150_h0wbg6xbNwrEjXD6uaE12ZDZYF_h55LN99Es520nMBI.jpg	public	mooshugrill	\N
5267fa9611d2688bdc4587a2	/2136029_bvqot1MnMJ9IGYsYJkamqTiE_lL96OcfilWMxskhdU8.jpg	public	mooshugrill	\N
5213a7c011d27a56f99dfba3	/11074699_K2ka1_NxiELyTqgjvY3oMN70IUxIlADqRIAb5QpzsLM.jpg	public	mooshugrill	\N
525b3a3711d2040fdcbd6fee	/52031712_DN0C9vfm3iv1geUuFX92Pt0jwgl8NhbGokLj_o0Ebjg.jpg	public	mooshugrill	\N
51c1ea41498e372d91835cf9	/5067950_pSXIZo_RqO8Hh5AuWcomjr0p3q_pXPUMWe99W8hUGTU.jpg	public	burgersandbites	\N
51a79983498e3044671cd784	/1441492_yfySwml4ChzJ_ni5DxTq-8n2UlecWBWjgxR-ygA6pYc.jpg	public	burgersandbites	\N
4fe1fbabe4b0be4ebe6c1c52	/HNMFUfRPXDmxSDWAwh7pixJ34SFUY0fgzZFeOLAVXU8.jpg	public	funbunsnyc	t
51c8a3c5498e797153ec5629	/46314126_95x6AErCZEGSi1zGZrFCY-EzgsIMyOhgO4G59l-u_Xg.jpg	public	funbunsnyc	\N
5212ec18498e9494b634a94c	/814104_tUkLgiQ8zcYxovra9R8PIx7FckFhBjzNVHmirteXd58.jpg	public	funbunsnyc	\N
4ffda271e4b03bbc7f8fd13a	/6Dtx8fj7IXT6M3O6ZV3rXryb6zKTAqPchjeOM2BJJAs.jpg	public	funbunsnyc	\N
505204d6e4b02dee62bd961a	/dcOYoRoNNeCLMxvoyAN-o9gJObcw5FljMqYpS9cps84.jpg	public	funbunsnyc	\N
51ab89bb498e83fced4cefd6	/66074_8dLzCKmVRde0Uvtx_NSl9SKROFh0kat1IQgcAvU4J3M.jpg	public	delsnyc	\N
51fd732d498e415eeb8b9881	/8839239_mAp7_MVmWbbK42Xq3-W-1zmegy-MNx8NzB0P5Brf-Pw.jpg	public	delsnyc	\N
520e673a11d25d1282a44199	/117715_KjwJnc6idBB7TuMKhGboHDg8IYjlGcr6h3I6_fJECmM.jpg	public	delsnyc	\N
51b8d7aa498e103b3a36ec2d	/47900463_7B6lLfz2PW1XyrG2vCIxp4vIq7QXWEhxufI5i75jwxE.jpg	public	delsnyc	t
52fe5db111d2d7644f04c21e	/404119_k2pARWK6AW8sOni-GGVsAfTehHeRbbnRCBGhfeb1xZc.jpg	public	philssteaks	t
512bbfebe4b0b8faa466c796	/1425622_4wp7wCuj7Ci1dl_FVH9syKmrJwQavMhL9uqww1b0m1o.jpg	public	philssteaks	\N
527e77d111d2e66fa6a871b3	/649454_HIWthX8nL3SZAOwyMlKj9Y7ju9GCiN4OEV-wZR6IKC0.jpg	public	philssteaks	\N
507071bfe4b06e882e74b445	/1112203_qnT5k-31-4cRKDz00cUpp7Ia7HG3YTjhsC9Udo90RDI.jpg	public	philssteaks	\N
4fe65d6fe4b09198fde5842a	/nVmhJloDitdcBPFceYT8ajqQqgXBpB_w5GoPWse33Ks.jpg	public	valduccis	\N
53860b95498ee26cd484fe30	/81832079_fNoLG8cvJl_IqYaTNF8p9uwsDsglMXnfF2DKZ8X0Tk4.jpg	public	mtblls	t
53e3b619498e4b9015f0bad7	/68150_s6TPzQTspWKu7AI0DXgjZai6xKrtSkWgIdJNkenXMfs.jpg	public	mtblls	f
523887bb11d2ac89551d71ff	/5568483_apwtHKsNfvYc-IjeDL1_oqXIqZsLTUGH_-l1uxxAiGo.jpg	public	mtblls	f
52d32962498e318b0a9942f1	/61382883_iF5gX7tlMJ3CWlWcTkpntPniCUpS3o7H8anOau4wiKA.jpg	public	usafoodtruck	f
4fc7a5d3e4b0647c52b3c26e	/iRvxK7ohXIwK9Ib6wkVgtR46VKRLsamXuElhEtOlNKc.jpg	public	andysitalianice	t
4fc2552fe4b0cec932846e84	/cjaTu8CSMM7HvFDxIUk3I2TF_I8mJyZuejfwTgYLc-c.jpg	public	andysitalianice	f
4feb6e00e4b048145c547997	/wcCcDDUFo3EAkWygR8pGn29HTAv7VKEvPwJgzS6hQcw.jpg	public	andysitalianice	f
5254357b498ec4662e20c654	/2620660_kMXeinZ_B6lOrHRQnheIHMBr7p81ZxcUblWl0SQ1vEs.jpg	public	thesteelcart	\N
519a7e33498e6e4ea6ff66f1	/3354_e_1JMupbEA8VtOBVXgLHAvtJGQwcpHvY2JyFESXYSjo.jpg	public	thesteelcart	\N
51dc0e71498e8db4f9a8106e	/4456614_ZWvsB80ogvwYkoKIyVf6q5RfcDXwuKI4t0XJJhyLQ_I.jpg	public	thesteelcart	\N
520538a611d2b476431ac7f9	/117715_GMdoseCn4baUtTX9kN6_PAAfHaGIlUpjxzAitpqLAOY.jpg	public	chefsamirtruck	\N
5294e76b11d2879d5217bd00	/47558447_v1SwJZbLSZ2etlJXOF9qw4H3vErpdTiVIqXxULSVTSU.jpg	public	chefsamirtruck	\N
5189442c498e765ce62d5924	/2432527_5nUa0fTfy4rzjXpiIUIlkguBa2kdqFSZIG-PLvkKu2Y.jpg	public	chefsamirtruck	\N
4fd0d80de4b062589043211f	/hZjMDK5KKgxjMhmOGBtaRjx_ga0SWHwppqfLfqw20Tg.jpg	public	chefsamirtruck	\N
519bb23b498e208a0b81b7fa	/9285455_LZiJ4FLH7NOWjNUsXO9jxDRFAgLygBSB8SmSIW0z9kM.jpg	public	mactruckny	\N
5165924de4b093be3bc5cd57	/2159706_uFl3RYgA1z4EiDNp8PtjjG2HHWhTiiXDLNzJtFWPHS8.jpg	public	mactruckny	\N
5151c82de4b024888079c5ea	/5003144_g8kbTzyfr6gL9vIRpMBbXz4TqBUk5EgkqIPlBP9DtsA.jpg	public	mactruckny	\N
50883301e4b0904987088a20	/2361939_J2zcgauqqGFC_PZPyvkfEDoSufdDe5qE7gi_NkS1P1U.jpg	public	mactruckny	\N
5413499511d26b1c8b577c09	/4195495_Ir_R8BxT1YxyTe-VuFD3U5pw6j9CobWIBlYp1FF-TwI.jpg	public	fritesnmeats	f
5298ff7011d22a38856168e2	/191726_GHXLJD8lsdPciKdqJErekl1SKPjw5k4N2YuNJC6JRTU.jpg	public	nuchasnyc	\N
51118d62e4b063f95c18d16d	/191726_pTyD4DsW_jGt7E3QJJdH1QB-mHP1ZYggLzXtnZ7j3Oc.jpg	public	nuchasnyc	\N
51dc5a9e498ebf7ad40223ec	/1328035_Ak3fMs2e36r7NvIE_gIDK5XZ9CwrW1DEJa3g1oobp5E.jpg	public	wingnitnyc	\N
53287ac3498ee8ce8841a510	/68150_pNBQ4zhtsUiGR_kyfk0HziUGMzyIQwYcYpJ3VpZf7tk.jpg	public	thegreenradish1	f
507efae0e4b09a52c022ec3a	/39213_nH-zcqfLCJqMvG0Nco0LWE4QuRuoL6unlEXJlJbTEF4.jpg	public	mexicue	\N
501fe830e4b0bbddce992f90	/fFBOGONZt5Zr77Vc5g8adoAiBht0f-MBut7GqorVEjo.jpg	public	mexicue	\N
5203e16e498e9e8e0a93b61a	/702028_Fog-6PEF03KateivIPP-hx87Qn6gi7PwnaJv-wTFv3I.jpg	public	carlssteaks	\N
4fda1cf4e4b0f6aceebbdb2d	/lKL7uz06jZgB680Vye9zxa_2yQfH96afFExvxaLlRpU.jpg	public	hibachiheaven	f
52e6af38498e26e622e5398c	/4147709_E9hzkLfHAJjdgQ6RT3W29cf-cftJShyXpRthu8riZYs.jpg	public	hibachiheaven	f
52e2aa07498e25b9a084ee94	/12998378_50qpDzH_XwsSlaJpw-f2fDtJsSvQg4TU_ujjdsnyWOw.jpg	public	hibachiheaven	f
506dc9b9e4b0c21f078c3bb3	/22983_XN2GbKo3a5YsNY_ZpiBcjUHTD2if3TWS8r586Uq4cEk.jpg	public	blend_express	\N
5033cee6e4b03e64bc749ee7	/tIyy6IAKcw2SSiX5JSPBCURstZZisntK_46plgrfdJ0.jpg	public	blend_express	\N
5135022ee4b0592185aa975e	/2660256_0rdKd0P0tCYzLf5j7-_3b8HbPNDVCW6S0hHdJGW47Wo.jpg	public	mikenwillies	\N
535d6fe9498eeb428f0a49a5	/643701_B0msQNcQCClAiTuYbiNnskLICf99ehNmerkWdhYNR8c.jpg	public	snowday	f
533ddd9a498ebf7fb4775ca2	/36814481_r4TU0Q7tJ6Xum58iZ5olLRY6sV-P4dN3psrhw2ZZKZ8.jpg	public	snowday	f
5328764d498e217e55fa24e1	/68150_4QSMIi6zBoyrZ1VeH1Dqb3fEovQswz93yHAPvf2lGmQ.jpg	public	dubpies	t
532879fb498ec68315b3d232	/68150_KF6qgT-viSOMS5bt3lJarsNeEUjlVJn1lbAypyCl1js.jpg	public	dubpies	f
53287a0c498edd9a0567c2c0	/68150_i3UKBmIXHPN4h7gtvSQjnYfikUNmJuGRpjwKP2dLI5Q.jpg	public	dubpies	f
5345d100498eaa611b76f338	/62345083_i2VdE3VeEPlbfUgNv9mWmVmsuL19upJhcHaRX3zje1w.jpg	public	dubpies	f
51dc48a3498efe9483d8417a	/117715_dlhUlP8z_jVejqRlWaCzsJBqg0eoP6rRSjOLpszFA0Q.jpg	public	veganlunchtruck	\N
52ade258498e293fae46e684	/68150_s7DCORg1dB6IJWWdj_e_pZMg4zKZs3S_Tjkff_px7kw.jpg	private	veganlunchtruck	\N
516ef5ece4b0d1c83382c12f	/117715_Gt3J4FMusC7YQjSfEup4O7bAO10z8J4gxmnd0xKnZuQ.jpg	public	veganlunchtruck	\N
51105b22e4b0a7b61fac854b	/117715_vKu0po70jlTD3qN9mXsdNiE6V5Od1hmYMVlUY9xSIP8.jpg	public	veganlunchtruck	\N
526e782b11d2a15e6fb663f3	/8761552_XH612BVbFNOBD2jJVEMDzyawnGF45FygNA3TtdKo6UE.jpg	private	veganlunchtruck	\N
5196816e498eebbaef53fe6b	/32050404_-lVnQ_kgFICQK3OBrfq4QydeDqXhz3ZCRD3TrCvMPxY.jpg	public	veganlunchtruck	f
508af08be4b02ba9b11cc747	/17430999_28ys6GXVoaOZoKPXLLK5GQpVEL8UrC1_1DajRIy8ia4.jpg	public	veganlunchtruck	f
50292d68e4b0d0acd3bb5dbb	/vv6y8qi6JFfXr9QDkIvTPP0fSmbgQ_jGXHCVwDv0c04.jpg	public	veganlunchtruck	f
52e456f2498ea9ece32b66e0	/25812424_w-pfXOZy2D8xWVJY37hGi4VXYiDnicBFvWRiiDOnNhE.jpg	public	carlssteaks	f
5362891011d2b40c5f328b6e	/41834822_k1LVelyLVM9gsNt3M70sVjI-QLm_84bgv4c6hoMHPO8.jpg	public	hibachiheaven	t
5239ddce11d2ab4765d5cc7f	/5568483_alwOH7sfGU8-pKfLmurfe9rt3pk2G6p90KwFyC6hq1A.jpg	public	sweetchilinyc	\N
50ad186ae4b0b639ca7ca234	/295161_qCQYG0XjW1Ji0pSDxM7fWRzxTZRbcYyZbsbPNJo12hw.jpg	public	toastmonsternyc	\N
521649b811d2913e20a1ae87	/5568483_RtMp5aDM_JtBZOI1u48Jy3om4Z672obezdu1uA_UWd0.jpg	public	toastmonsternyc	\N
518a82c9498e068718057964	/25979758_bGWQQ7W2SJI4v7KmU891VcYZGitov6qbSNAnIEt8HTo.jpg	public	toastmonsternyc	\N
5249c4bb498ecd25dde27c5e	/764670_x0RdEOs5TL4SEe2zGgpkzPFBFmlFV7-6UQiVtoFeHaY.jpg	public	goburger	\N
527d2c2711d2c984e85cb11b	/4179871_5FQ2eCC5ZeizUVRLh4tadgEAO1BnJjVQ7pSEvSDwIfQ.jpg	public	biandangnyc	\N
512161e0ebca7d20d6a70104	/4574_ZC6mf3ha1jNXmFUDgtNsN3zIf-NHyqgxA3WkUkOl4mY.jpg	public	biandangnyc	\N
5106b878e4b05ec869ad8b34	/814104_blIawoImaEcqf-Mg89W5A-nEHiZ5jx76BEYHVzz8dnA.jpg	public	biandangnyc	\N
519babe8498e355d9d35fca0	/65817_6p9jSMaQMqP9QGn3KOIyuDOG15jaLxIPvsdrpZGWdj8.jpg	public	blend_express	\N
506dcb8be4b0748e0467de78	/157259_PdYI3Fpzhcz_LoGnBeymaSAZaZCiVVw43c4xaYQQIDY.jpg	public	mikenwillies	\N
51117858e4b0e14064917adb	/263293_EvgjxXJqOivd94q0mbPR_AxkRXuzkFtjOBcOWnXuyQU.jpg	public	mikenwillies	\N
5281221811d21e907e460e00	/4195495_akELCvAQ7aY-bfTfHk93g5g5_qcJnQJV7h_gH0FlKUA.jpg	public	milktrucknyc	\N
514360f4e4b0455b303a4d66	/8626436_tfGrSomdm1qEPFKcyb0Q5atmm3DmDeao1W8MotOtOwY.jpg	public	milktrucknyc	t
4f749b3fe4b0f06c04ae2440	/rA31cWGMm0G8EuZFYZBxb3y2OrW3oEo7vCj1L2XR3AM.jpg	public	milktrucknyc	\N
5012d0d5e4b06fc7ce735a68	/7J2g1YLtx4ma57g4A4CerJJ66OwudjGhFI67JaNl1Qw.jpg	public	seoulfoodnyc	\N
4fb29dc4e4b0e08c1e225555	/ckjwTj4Fd2cRoZvDQZw_1jYdwuBF4BsfV4ZWc5oElFo.jpg	public	eddiespizzany	\N
4da8977840a3582fb8c49316	/MCGIPRA0XR15JNG4O2YZJQBCRMK05UVTC4T14TOQWRTNMQFZ.jpg	public	eddiespizzany	\N
4fd79157e4b071eb33a9c810	/8zrcTIejD5EBiOJzSobql1_PQWr-i2KmRfgMCYmbK-M.jpg	public	eddiespizzany	\N
4f9c18b0e4b0b38d2f554383	/AQEKYbyPrQt5uMWhy4r4ODm2vSMCqPseJyMhcg55mtY.jpg	public	eddiespizzany	\N
52a0bef911d299250c89f9c7	/349672_Cg8dtcrfQ0WZeSo7BJR61YBG6VzsiMltZP8XIqyHiu0.jpg	public	mrniceguytruck	\N
529ccbc511d21047117cdea2	/68150__CRf8sW9KvXZTkcAQEc4EsnYPgqXA2trmMxy-_AzobY.jpg	public	mrniceguytruck	\N
507b0648e4b0109f3656e2d2	/76137_7JNe3m0dO2MZ7a9rkqa_DTlnrw0LyNitqksFG7_5IC8.jpg	public	lobstertruckny	\N
508abe69e4b01ff7516d118b	/8029486_9wt2tO9BnY5d11Ef0mpAgHAqfK1QMmSvLXglU4fj6Xw.jpg	public	lobstertruckny	\N
500ecc9ce4b0a6d209804d9e	/d2yG6CtTrc8TQAXoEGN68UYAv3DiJIqJvKU65-ApcaU.jpg	private	lobstertruckny	\N
5245c7a1498e0eb9bc097723	/1727660_xLZtYmqATL4pckN_IhgIj0AgUbDAJxywzqbf5PKEooM.jpg	private	lobstertruckny	\N
51f15b4d498ee58fec420a7c	/13285510_Q-SBXKFpfroSwQ-QJdezzrh1KaHfHAmLyicy8d5S1jU.jpg	public	parissandwich	\N
5243126c498ea77b19b3a444	/65506790_31Qpx9E-ZjuNve-izmDY6vVxUCMrhgGsnOLn4-fusp4.jpg	public	parissandwich	\N
51b22a0a498ec00d1c45726c	/390807_y2oeK6xR54wk9b1Sfm82Ek09Auv2lNkRTpJOzos3xjU.jpg	public	parissandwich	\N
523c930a11d22e1c3012a9d3	/34169985_AiTXirGu6jTaGeWWhhOfl2QIbGVaQjdDg1QCEakqza8.jpg	public	mexicue	t
51d31ab97dd28a271207af20	/59958053_5CogfmHgRpBtjkPzVkAgAjK7q9ac0bo8Z1TPwxPIFAw.jpg	public	grillonwheelsny	\N
5008051fe4b0974c844d5003	/oNy0_bsWPyVmjrduzJXpbrAPHjQS0PVbyOCfoRSD9xE.jpg	public	shortysnyc	\N
51a4ee69abd87ea53396c979	/4083549_jMzaCPEId80kWmAaq2oQ9APKf4bLvdeHhy40qPeB9j8.jpg	public	shortysnyc	\N
50045b1be4b0004dbf67c977	/MDweBG1fBnF_fZ1tOghWyHS9qUxGNiJeOrOpoA-fBrY.jpg	public	shortysnyc	\N
4feb2bb8e4b0a47cf49787d7	/-CEaOy-zjgmGzmPRViSeNchwIITBbHgI3lFosreLqIE.jpg	public	shortysnyc	t
5182ad6b498ef6cb59d48783	/39425123_zPh6ih4GAAygbhRJ-pyPdCr5TI3rXafgKyIEEK4HpHY.jpg	public	goburger	\N
501d4734e4b0af03cf473287	/6BUHUmEyYTTh3a2SRjSYRklUlTfQBNbFnnk_hfEojYs.jpg	public	goburger	\N
5180207390e7374e46b6c165	/49563206_uKsSD-Cd2jjy6FMyR9U_--7DdUBJ7ZUxtdlushxyIAg.jpg	public	freshandhearty	\N
525c259b498ea7548cf31f8e	/769710_ZxOOtsSbFVklHIRhXVmTO7ops0Pm0EybRDTgUvGHrSY.jpg	public	disosnyc	\N
51f4589a498e97316d307dab	/186827_ilvLMlb3AFqgXUQJ43S7IjsLNPxYP3Pw5LEjrqhp6wI.jpg	public	chipsykingny	\N
52052ef211d22b8ed81dd96b	/36360429_am9ha8rSYxAvCaSMU9ya6lI9MzIgcpR62DH6HS1b-uY.jpg	public	milktrucknyc	\N
51c213db498e0748ab0dca3c	/53641916_5aNKp9fdHx3i_Pi15Z_X6pE3fAsTX35YBQ0nlmZGfaA.jpg	private	morristruck	\N
521f754c498ee4d6fbe8a778	/22491899_EEPqf4HeJFaaFjYabKyScGZ8symjXEgMjPUEkfpJsJk.jpg	public	morristruck	\N
51856452498e6f602088cbe1	/232510_pLk3QUUWFOu82-4SX-ObtA8bw2ZPf61QBOeIuL50T-o.jpg	private	morristruck	\N
50a696b4e4b04d062582a95e	/32050404_qo6ZUnU5LQMoqrAR6YoH5Qz-PdUcD1d1jCheEJy7lng.jpg	public	thepocketful	\N
511a7d64e4b0c6a64118260c	/793192_Dtd9vMRk-pbBJscn1cb7n29zM87iJjZy6rojapRhODk.jpg	public	thepocketful	\N
51424d6ce4b0041cb8df9856	/117715_oxR8_TwNSaCL-_gKDA2i2-1YoRfVVnbfT3M9Bfu4nxE.jpg	public	thepocketful	\N
51800af8e4b07a4a57023def	/9548073_erhzj0ShEDKaz8S8DhlDe90fDjJEIWjilIxO4_zjdGE.jpg	public	thepocketful	\N
53287a41498ef1dfde86d217	/68150_jBIeF8OZP2o4q5lJjB4TeUteiuuczqDDm3s4zQGipGc.jpg	public	shanghaisogo	t
51716b5f498e03d8bc252c48	/11709298_S8klPxq0yPyZw2X9-_0IZyk6TFTn9xi5SWd_6BGCeVM.jpg	public	toumnyc	\N
507dacb0e4b0d8cafc9601e0	/2361939_S3NwwSNVZD-2tAhc3bwAvsYgk9tXwYv0T0yq9ci-ihE.jpg	public	toumnyc	\N
516452a5e4b0e1b216fdbaa4	/26263584_5wpEOb9FygNRBFQySA-pE1t1q_E9jVM_4mx2mnw5fAU.jpg	public	toumnyc	\N
516d98b8e4b0b059e50ff5ad	/117715_BoNkQJO4jPWEtg_ef4-URb7IseoIXnYiP5vkvWJtezg.jpg	public	toumnyc	\N
5280c18811d2e4df572063db	/5354893_5EtQmcwzMnTRFz9qbxjkt9FguCAC4xfW5xwUCyYIrbQ.jpg	private	waffletruck	\N
4fd26038e4b06145dfb72894	/zUVUqzIwbwoFsRrRenEhtDmBSbK2Ry9lzqeuYnmnHG0.jpg	public	waffletruck	\N
4f733c44e4b039d898ce1409	/PQ9G-O3CAtCW6ixkiwHhICEaRn0L3Lz1F95zKcl_GdI.jpg	public	waffletruck	\N
527e823311d2db75dd831ee0	/22419482_1rrrm4nhOKXQsXN25ApmVsGDw4t2J3GyjhfeQPEbClU.jpg	private	waffletruck	\N
4f7deaf5e4b0ffb6a3f2008e	/Xho5Xq8BtpNhEQvH0KRI3yX4kUstFRwTxEDj6QoawcM.jpg	public	palenquefood	\N
51b8a845498e8ebdef064e0c	/761163_j9ai1NfaIpK2TLN8JzXbTwyIhVzuZevNHBV5EpQ7Fh0.jpg	public	palenquefood	\N
531b7d5e498e3df35f261af2	/22402741_aYe825rrQDsEq6E_Pqv35za149PBn1PcT557SaJhOK4.jpg	public	brooklynpopcorn	t
5220dc78498ebd10d150f736	/29917892_nMZHXkfxBukc2QfFqtDBTZSJ1xpMkoO7VGBJmGKkwhY.jpg	public	brooklynpopcorn	\N
5258d3ef11d26d03cc0563a5	/117715_GQ_O1nyBbVlKTaYpRlprc8ZdIEAEftbU4_9hDGjvxsU.jpg	public	brooklynpopcorn	\N
4e09f3fca12d09aa881a769f	/NTSOFYDIBYVWGE4RYQTBBNIAQESPZ1LLW3Q4TC3TGMROSJPH.jpg	public	nautimobile	\N
5022f267011cfeafe81dab9a	/7EPnN8ReXYQWoZYxzqkH9AQlOe8vFPtVP_60n65i9U4.jpg	private	nautimobile	\N
4e70e35c52b140871b6fa35f	/1TB5ROKJY5NF0GAVS4YS3WZTFCUXXHTPLLBUIK4BU0XD0QA5.jpg	private	nautimobile	\N
51ccc251498e028212e9b1e3	/117715_ozxp6K6iPGwKCzQDARR3BgMcisplkTt0x4LEKDJdBMk.jpg	private	nautimobile	\N
514e42c7e4b0ec8b7e400875	/48992751_ibL8tx_7JPvV3aQmnEevrdibtLP0jWytaChkCdRuhG8.jpg	public	crafflesnyc	\N
516ee142e4b04f28d58be309	/36812449_DjR1ynMnMpwj-KmiWPZQldmGQwJ2IEzjSwwmGevqe3U.jpg	public	sweeterynyc	\N
5107e09be4b047c08ade6bf6	/760350_ZaalKVnOYdVAGoQEdugu-1Lws1LubyJBOVpZvJJD1V0.jpg	public	sweeterynyc	\N
50188a43e4b0d35e6d8035b4	/b-fKh6mx2WxCybNQkr9ovk_jv4x7bwJPVFM9RF3M5T4.jpg	public	sweeterynyc	\N
4dfa4a9840a3542ff44549df	/VBAJNQCBWDMP2WKDXJ5QHQ0WYF1MKHZSLUAZZJXKDBDLDUWG.jpg	public	taimmobile	\N
51cb2c41498e9851cecdd49a	/5728350_vuJ4ORu0wHhd-B-f4FTNfsoIhfHgtJRMJc-QEeiYmNQ.jpg	public	taimmobile	\N
504a271ce4b0c65efb6b05f5	/PG0DfZvsxtqv4QM8Xpl6y8Ojahb0UanYwCPSdmuhj_E.jpg	private	taimmobile	t
4fa814d1e4b0d607baf8bd9d	/2drHnu4mqj-uzpwwcJa3MatYGD7KFuxjE472rButWlM.jpg	public	taimmobile	\N
519fa37b498e7adf7e8ebce3	/47170230_A9xVWAtkJBP-vVqUF1q2WlK8yuZTf1CVQz0JcPrHGY0.jpg	public	taimmobile	\N
50e71f82e4b07154c72fdc22	/275165_az4RUZ2U7-4cfdnQA1FlMrDLaxwCMriWtlhS_pddjEc.jpg	public	mexicoblvd	\N
5140cc96e4b0ef29f4802508	/4886503_z36ZXtYKGVIHcNLCR18ZdUWtpStRrbf33rInxsr2p1Q.jpg	public	mexicoblvd	\N
525de1d7498ef4b27ada0847	/31827631_CApIgPWaXupe3toLi7iJLb6NxIyn2IDTOjAG0qw-PIk.jpg	public	mexicoblvd	\N
51435e1de4b07d53cf71fd7a	/4486_lUhkecOFThYlMHKai4wDp4lXXiQSPLTq3Nno5WMIz7E.jpg	public	palenquefood	\N
4e6513efc65b2dc8a0bfff6d	/TUQTIKBJPOALJKHN54QRKGISWMQDDOW3WTAECOGJ4FOJTPXI.jpg	public	palenquefood	\N
5286645011d228bbd12f9880	/1353667_2qCG26N4ikz7mbvEGkrFkcNLagGqrzRuNyeQ35CCDE8.jpg	public	korillabbq	\N
5231f54311d26e8da5827f3b	/977282_AToQDrlKW5PTNbNGQcB24_BeJNsRMgZTeYmC9P-or38.jpg	public	korillabbq	\N
528e451f11d2a93e4361f565	/977282_wEw3nDjN0NbjC4CgQ00ON0YjdtnMocrfAjXDM4UH63Q.jpg	private	korillabbq	\N
4e4e92c7b0fb088f3c0f14d5	/HTLXSW2D30RGIEYPI0JGR22LUCS5BTXQ0LXDWAOHH4PCVHM4.jpg	private	bigdsgrub	\N
51dd9ddc498efb9a3437e123	/4501533_djr9d2BEP8dg7E48xJjJTa_Yjk0Iy-MmBG6hgIQBLUs.jpg	public	bigdsgrub	\N
513101fce4b006d9c4991bdc	/17248619_XfpmI8dNgmoeHE3BXjV8bL2yuuMTqxU3FqDr4BqX7Ks.jpg	public	bigdsgrub	\N
4fa2d04de4b0489ba3d7936d	/hsPbM0G5l3AsUaI3x6r_VkiSYo4pYlWTKK2S9zqh_KE.jpg	public	bigdsgrub	\N
5245c79c498e057f7d5ff65d	/117715_CEghvDHaxkALy5RxQCAVW-kyM0TAZo2-fIT4e6veJeo.jpg	public	neaexpress	\N
5176cceb498efe500552cc9e	/21735785_zaQs-7anNinrrQlobBV2AjNxquTXs5g8ZY0NxvoxvHo.jpg	public	steaksncrepes	\N
523b2edc11d265bf373f82a0	/8853695_cjpq3trk4bFpcU1oHWwj4XxwwD9ZI169sNncUyOQoM8.jpg	public	steaksncrepes	\N
52013fe1498e5f476bfdcf83	/30611522_DHhazmY8dyNAbmijjHX7jyyfVBEiugL5-GJcTLuYjS4.jpg	public	getstuffednow	\N
523c8b2a498e959b87f8ded2	/39707564_-WCsPSk2ExKeZ8q06DtUQrpt_vcWG9-AzvFoToSdQqY.jpg	public	getstuffednow	\N
51af7257498e0c7f8979c05d	/752258_nUJpoSxZ8p9BBJMG5ISetpo3DDLzycLT_gT3z9fvJmI.jpg	public	getstuffednow	\N
50ca356fe4b05b0bb93edc40	/1590381_NyRIp7fXJtGoJoXp25IcMmufNufPxxvLEj3TVYXRo5g.jpg	private	getstuffednow	\N
50f59e2ee4b0b31f58d6cc1f	/1922740_OhtWiNUDUcN0NE_HB3Tk8vm5qIZcvqxcP2nMDrN8dT0.jpg	public	kimchitruck	t
505c9776e4b0643aba1071c7	/5568483_yQrtG73dbug7q06p9IASJmTFnOVgGprIZKbfHjQRcso.jpg	public	biandangnyc	\N
5243206b498e78230cd0770a	/54092198_eF4CEteD3zHjOCJzaYssyRXaQElB-GEOy2sqzBFQPm4.jpg	public	thegreenradish1	\N
526e8aee11d299d16e74b447	/67629862_ZPeS1alTFabw1hPqq8PCcGF1SRFynqA23OgkKg8yc00.jpg	public	lovemamak	\N
521b83c411d29ec0512f89b3	/255980_1U9yRWzBKuIDLReBhmBs45qJ0mtHu7pzL_Fv4T9gTss.jpg	public	lovemamak	\N
5086e523e4b02ca59cae7bd4	/2361939_1JvatS0wOUdQQIaTmd4Vmk8bgr7aFYOR7LaMkRio0X8.jpg	public	mausamnyc	\N
513f646ce4b0b1892aaae1bc	/13285510_LmdJLKoCS9fSwm3wy96lcieTczjsLuxAEUnU3FlZDlo.jpg	public	mausamnyc	\N
51194bbae4b0cd237850b223	/793192_FQUO1SFGyLkg5NRz6VUYl3_zmFgfy0Mh8gL1unO8ijM.jpg	public	mausamnyc	\N
520f87b511d2e753e7955853	/44_gUd2HlRFt-yMUFcOdI_EUCdz5NK86hKk-3kHwZhHou0.jpg	public	carpedonutnyc	f
5199097e498ea36447e54093	/40899881_hbjUdavpBfT-sLaBhv3pbZydT1tgs9v-Maw12j9I3Xs.jpg	public	carpedonutnyc	\N
51378e9ce4b071feb46ef7cc	/18792384_RSm8zhe_6kUOxy91taByfRjTDSLp7stH7PI41aJHOrU.jpg	public	bobjotruck	\N
5249b50c11d2d415e3c6b017	/769710_HOnpTjl0b6qd4-yoPpg9lXZGBy-ZKikqzLlFWw2sQfs.jpg	public	bobjotruck	\N
4fe20639e4b05dcdf7f5737c	/l9UdGGevddtOhDk6scQjcy1-TbVBX-wf8Gf56jBIRIg.jpg	public	bobjotruck	\N
5249b1c511d23e54343ae083	/769710_HUiZ7dJrNbdnPYV-DTQRr1z0zgoxFx9KMC_Y-OQ6O2o.jpg	public	bobjotruck	t
513b9b7de4b04f7024bc158a	/45519738_eDUGOpHYwiR5C3VUps1gQ1YDIq0Di3WMfuirGs2EVBk.jpg	public	rickshawtruck	\N
4f8dc377e4b0ca2accf75652	/EKcue5yGEyaPnBymSd_HtBxWEZl4grYSOXMhw-gqpTs.jpg	public	rickshawtruck	\N
4fb6bb41e4b066430032e4ca	/HHZWTU3POi_yJE4GU0zI_NjZNerm5y3MjjxddcV5ZMs.jpg	public	rickshawtruck	\N
4e42f5ecaeb7f6be72c39c70	/JC5VO3Z50HMMMVLCCGWDQPMKF4W01VBXP1QS2LFESR55UHIX.jpg	public	fritesnmeats	\N
514e42a8e4b0d91e975b3db9	/48992751_womoOVd5bv-2KopmWjWEHA_WsyoWQITjAyXBuM4Ciz8.jpg	public	crafflesnyc	\N
5109aed2e4b01d2a5b69b022	/117715_0jgrjk5IsUFppNAL0NtebyMYoz1JMdzrnWAIjrLMHZw.jpg	public	schnitznthings	\N
5012e555e4b0dd18ec16bd37	/mZQAOCmv5lnRZ1qOUTwDXk-MLC-X-p01AfECgfLJC2I.jpg	public	schnitznthings	\N
50f99bcee4b08ca132377f78	/4611139_CEH3eveI6uxlRVQLet5Fpa_sNfJwAzfheMTYSBplO5Q.jpg	public	thecrepestruck	\N
4fd0f054e4b0757383b97c0f	/MbR1inb3VKXu0PQMsCkHkHGftYq0E8CDbYG3BLRRGaE.jpg	public	thecrepestruck	\N
5197fe76498e1c056c96d21b	/117715_m462oAqyqBN12xyWCOyzYR6-1gtYrUa8BiX9r9OybE8.jpg	private	kimchitruck	\N
4e3da652d4c058f9dc087a6c	/QEOIS2W35WLTHYK00QC04LKKX4X1SYW3DDI45X30HSKTJENQ.jpg	public	kimchitruck	\N
501975c5e4b092f6a51ef338	/bI7RrGcK_moyn-kJICa1OCciBVuYYykwCMGlea6mcxg.jpg	public	kimchitruck	\N
4e00e61aa12db1129557e99c	/WSUNYIB0YFVRCTXB13UCRCTANZUG0DO0X2FWCUYYILU4TCGB.jpg	private	kimchitruck	\N
51cc7075498e8d24309aea57	/991186_cg_CePJhqcT81QY5l1L4eB3MQxy_QlsRh4zmZDk8cFM.jpg	public	biandangnyc	t
5197cb68498e8d409a89ec1b	/1847096_oRB5R_owQW40gVWlJhNNsh9_0bEq2D8Rt3Zod9HUbUg.jpg	public	disosnyc	\N
51dc5fec498e4e9be748eac4	/22801_gX0atVT6Jt_H6FPXuYAqHD4VzO5jAmS4SVid_ZLkk5U.jpg	public	disosnyc	\N
53287c9c498e4b30223220d1	/68150_mMquObtK1F2QjX3VWuhYK2MtjUA9i5QRzexf9zWrBOQ.jpg	public	thegreenradish1	t
5208f543498eaeeaaad3ce52	/15629_P_UAUr_S-OO0R12wNp8LDPwr-ZbfPiWeG0Q0rrjW6Ww.jpg	public	sweetchilinyc	\N
51f2be1f498e71235db5b61b	/117715_mGfGU0UGjUMhgqgwrDPf2f44NZtfMrobqJMF8ahsrjY.jpg	public	sweetchilinyc	\N
50e719c2e4b0e263423e547e	/15471_4uN0tddGW5orNGh02xhxbiAOGUpAAy3rIWEotoRgB_M.jpg	public	tacobite	\N
51645882e4b0bcb0cb0c7ef3	/7511393_dEJJLGO8ljFPMA_kFidoz1wpWZ-k6mHpqYnuRwoBpRg.jpg	public	philssteaks	\N
4f753600e4b07eec20023ddb	/zUb4OswXiQLnF_k2xnx7AdupnEIl1nuGyIuFcmFWf8Q.jpg	public	thetreatstruck	\N
4fbfe026e4b04422a08a40f6	/Han8Z4R-SQ615pLoN2lRdPfKEFa6UW2yudSOxXmJtts.jpg	public	thetreatstruck	\N
51461b9de4b0bb73a6821e97	/1102787_UDt7OJpexNs8VPrehVDsp9EtfUJnMhKzJ2tTXuof06M.jpg	public	thetreatstruck	\N
4fbfebe9e4b0a3bda0340383	/Brw9_z178IK92xMEXLCSSZrP0-99GXjutCp7dHCi5CQ.jpg	public	thetreatstruck	\N
51eae36e498e58d50e5683ba	/331066_SArUzXa_cz_-YMQco1rwYAfU8a99TZCHJX9a2WA3fHg.jpg	public	gcnyc1	\N
5106bdece4b051d6cb82a376	/1922740_Eqg3x5oj7wks2XGfudNYIAzcCuZHJiWpgLP1CCbonEE.jpg	public	gcnyc1	t
526fef71498e92d1ace459d9	/60805368_eCRrBwapYrNL8fM9tmIaLCfnlhQYb9ASU-ZkaR1Og54.jpg	public	mamuthainoodle	\N
5203bd51498ed50247ee01dd	/60805368_HlIeqCMjY2I5md2mzI5crKizc9wVPUZo_sBmC6zrPEA.jpg	public	mamuthainoodle	\N
51dd9efb498ebbc846c11c03	/13001992_b9dLXH02o0ZX8hyUZVtpgGW6sDyzAl23vmEl-0Hj0jY.jpg	public	itizyicecream	\N
501c284be4b07d0ab63e08be	/vQv8P8_hFNwHMmpR7k6-arr8zqYmmgoSG_aAPJuz-ws.jpg	public	itizyicecream	\N
51e83b4a498e0a1c64e62828	/26624_AGoljLki5SS-GJGKaAGB75mloHKRBkJ1Qj5BQCRP1_Y.jpg	public	itizyicecream	\N
521e9e4511d2d8ddc5c69dbd	/117715_r7cpzyXCpOthqHouR5gdqIMX8k0TZ2KWHFun5wh-EYk.jpg	public	valduccis	\N
5079a745e4b00277f33e4836	/34723233_tCoDnWhdhZj61xi_e00MNwJoK_UcfDXCQQ7Weat8pBM.jpg	public	valduccis	\N
525ee647498ef229c65969fe	/10045965_ptbEO58Zn5wDz6kgitvMVjFScmxSkkuHNbK-AguCXSM.jpg	public	thegreenradish1	\N
522e088e11d2d4539942a387	/39707564_2mJZIxFUyGllfVMRjXdE86dZsCxH8cmCdUv29E4dfmE.jpg	public	schnitznthings	t
4dcbff9440a3324246c6fb7c	/YVZPSDS5D1O5DR2NK5IFQKOU0ZNOQTQMTHMRWS3ESLQIQAWK.jpg	public	lobstertruckny	t
50ef1f18e4b0710a5e5cb1eb	/117715_4lM2ZgzHp4Uv61-ckuWzdXXXcPVNEH2NjISpWAEjGds.jpg	public	nuchasnyc	f
4fba74c1e4b0a2484fae410e	/1XmG8W_3-cY3Qc-l1GwU7YSOBlzOwyGtk2BzKOkxqYY.jpg	public	gcnyc1	f
516d80bd498e8f3b47ac90e6	/36812449_Vbw1XbeTn6HJHdJF1bzMp9TvcwrqCP5edmktYCzlW6k.jpg	public	gcnyc1	f
4f5e6b3fe4b033732b227036	/7Pw4h0QMNateMpgFd_DAFO0uUnsIdcGzmHG_1in7Wu0.jpg	public	seoulfoodnyc	f
4fb1335de4b0f4503b23a67a	/GSQxN-iFZejvploz8v8hm2QzrWiTmg6QdgBffmHvsnc.jpg	public	seoulfoodnyc	f
542a28a1498e4288ab95e302	/68150_E567_ql-1p2jEv5ysetaEOgtnxpMmeLwZghpwLximCw.jpg	public	papayakingtruck	f
542a28a8498e8c25fb70df8c	/68150_ru2bxW9jr0deeGFaJrvEbwBh8Bv1FRW82ZIglwoRv1M.jpg	public	papayakingtruck	f
530f7b7b498e225c3989957a	/20103877_gKGG5Z15ifazVa7PoBKpyKecZK7x2dWgjFIDOkwO38c.jpg	public	shanghaisogo	f
538fa2da498e8efc80bc2cb7	/26065139_jgo2VLUL2PokQdo7SP2iJ6rtca8E552GZGM3Bhu1e28.jpg	public	langostruck	f
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
16	47th & Park	(park|47(th)?) & (47(th)?|park)	up	40.755332	-73.975305	Midtown East
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
38	King & Varick	(varick|king) & (king|varick)	none	40.727889	-74.005495	Soho
40	Wall & Pearl	wall & pearl	none	40.705533	-74.007926	Financial District
41	Wall & William	wall & william	none	40.706363	-74.009531	Financial District
42	Hanover & Water	(hanover|water) & (water|hanover)	none	40.704089	-74.00900	Financial District
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
61	52nd between 6th & 7th	52nd between 6th & 7th	up	40.761774	-73.980945	Midtown West
62	47th between Park & Madison	47th between (madison|park) & (park|madison)	up	40.755655	-73.976176	Midtown East
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
67	Pearl & Broad	(broad|pearl) & (pearl|broad)	none	40.703444	-74.011630	Financial District
7	38th & Broadway	38(th)? ?& ?broadway	up	40.752895	-73.987340	Midtown West
48	Fulton between Front & South	fulton between (south|front) & (front|south)	none	40.706510	-74.003370	Financial District
58	Fulton & South	((south|fulton) & (south|fulton)|seaport @ fulton)	none	40.706248	-74.003078	Financial District
5	33rd & Park	33(rd)? & park	mid	40.746468	-73.981828	Murray Hill
22	50th between 6th & 7th	50(th)? between (6th & 7th|6 ?& ?7)	up	40.760400	-73.981444	Midtown West
23	51st between Park & Madison	51st (between )?park ?& ?madison	up	40.758212	-73.974371	Midtown East
39	King & Hudson	(king|hudson) & (hudson|king)	none	40.728086	-74.007317	Soho
28	55th & Broadway	(broadway|55(th)?) (&|n) (broadway|55(th)?)	up	40.764966	-73.982223	Midtown West
11	41st between 6th & Broadway	41st between 6th (n|&) broadway	up	40.754659	-73.985726	Midtown West
25	52nd & 6th	52(nd)? ?(N|&) ?6(th)?	up	40.761166	-73.979443	Midtown West
24	51st & Park	51st ?& ?park	up	40.757830	-73.973477	Midtown East
13	46th & 6th	(w)?46(th)? ?& ?6(th)?	up	40.757418	-73.982288	Midtown West
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
91	Water between Wall & Gouvernour	water between wall st & gouvernour	none	40.704894	-74.007785	Financial District
92	55th between 6th & 7th	55th between 6th & 7th	up	40.763653	-73.979593	Midtown West
93	99th & Madison	99th & madison	up	40.789202	-73.952694	Upper East Side
14	46th Between 5th & 6th	46(th|st)? (between )?(5th ?& ?6th|5 ?& ?6|& 5~6)	up	40.756625	-73.980321	Midtown West
94	Water & Broad	water & broad	none	40.702961	-74.011477	Financial District
72	52nd & Park	52(st|nd)? ?& park	up	40.758444	-73.973026	Midtown East
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pepp
--

SELECT pg_catalog.setval('locations_id_seq', 94, true);


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
\.


--
-- Name: subs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pepp
--

SELECT pg_catalog.setval('subs_id_seq', 20, true);


--
-- Data for Name: trucks; Type: TABLE DATA; Schema: public; Owner: pepp
--

COPY trucks (id, name, twitname, weburl, tweet, retweeted, lasttweet, lastupdate, type, about, foursquare, matcher, loc, matchmethod) FROM stdin;
deliheaven	Deli Heaven	deliheaventruck		@downtownlunch correction we are on king&varick today. The word of the day is amore for ur free upgrade. SoHo get ur deliheaven on	f	1392220340	1392220340	Deli	\N			\N	\N
miamifood	Miami Food Machine	miamimachinenyc	http://www.miamifoodmachinenyc.com/	RT @YouGotSmoked: Park Ave btw 33rd St and 32nd St from 11:00 to 3:00 today! New York Aged Cheddar Mac and Cheese! Delicious nyc http://t...	t	1389964561	1389964561	Mexican		514b53aee4b00c3e98ec25e9	\N	\N	\N
chipsy	Chipsy King	chipsykingny	http://chipsykingny.com/	Kasar truck is at union square\nBroadway and 16th street\nAll day until 8pm	f	1407255461	1407255461	Fries		51bb5c43498ee06e13d0d31f	\N	\N	\N
brooklynpopcorn	Brooklyn Popcorn	brooklynpopcorn	http://brooklynpopcorn.com/	@Sebastian_Otto We are on 70th and York today! Hope to see you soon. Thank you for your support :)	f	1416833924	1415296416	Popcorn!		514a0737e4b09c3e77279d83	\N	32	\N
shortys	Shortys	shortysnyc	http://www.shortysnyc.com	Up and running at SouthStreetSeaport South and Fulton Streets Cheesesteak ChickenCheesesteak RoastPork... http://t.co/awyzKOzJqw	f	1416760233	1415982867	American		4faea2cce4b08a88c5dc5d05	\N	58	\N
mikenwillie	Mike n Willie's	mikenwillies	http://www.mikenwillies.com	Happy Taco Tuesday!! South st seaport Front St. & Fulton St 12-8 ComeGetSome	f	1403394007	1402414859	TexMex		4f205f0ee4b0294b35a1178b	\N	\N	\N
seoul	Seoul Food	seoulfoodnyc	http://www.seoulfoodnyc.com	Come to 51st street, between Park and Madison - it's lunch time!!	f	1392220033	1392220033	Asian		4e74afad88775d593d9a7eb5	\N	\N	\N
craffels	Craffles	crafflesnyc	http://www.craffles.com/	Happy holidays!!!\nMake ur holidays sweet with our delicious crepe or waffles. Our location for today. Hunter college and union square.	f	1416007474	1388428190	Crepes		514e426ce4b05bcb261d910e	\N	\N	\N
pocketful	The Pocketful	thepocketful	http://thepocketful.com/	Located on Hudson and King streets	f	1415807713	1416844195	Mediterranean		4db8bcd790a0e3f61d601888	\N	39	\N
blend	Blend	blend_express	http://blen02.wix.com/blendnyc	Happy Halloween.   47th and park we here.	f	1409760568	1414774175	Latin Fusion		4fa94528e4b0f8fbf13317e6	\N	16	\N
vspot	Hit your V Spot	hityourvspot	https://www.facebook.com/VSPOT.TRUCK	47th and Park from 11:15am to 2:30pm !!	f	1412066274	1412066274	Vietnamese	\N	53c9479b498e2dfa7e205ff0	\N	\N	\N
langos	Langos	langostruck	http://www.langostruck.com/	Dear Midtown We are at 47 th.street bet Lexington and Park langos ,burger ,skirt steak sandwich, crepes, fish and chips etc enjoy	f	1416842375	1415722983	Hungarian	\N	537a883c498eb7fac064409f	\N	17	\N
mactruck	MacTruck	mactruckny	http://MacTruckNYC.com	Good morning seaport, fulton and south st. 12-3	f	1415111064	1416414342	American	Looking to take a nap after lunch? This truck is great and the owner is incredibly friendly. Feel free to chat it up while you watch him prepare your food.  Not listed on the menu are the many condiments\\n you can get on your macaroni. The regular size is a good portion for a normal lunch.	50575ab8e4b04ed4f2197dac	\N	58	\N
cinnamonsnail	The Cinnamon Snail	veganlunchtruck	http://www.cinnamonsnail.com/	Please RT:\n\nFREE DONUT WITH ANY PURCHASE TODAY!\n(Because we love you lots & lots)\n\nParked on 48th/6th 8:30-3:00\n\n@MeatlessMonday	f	1416787623	1416838406	Vegan		4c263af6a852c9287537e66c	1	18	two
domo	Domo Taco	domotaco	http://www.domotaco.com	Caught a break from early onset winter! Come celebrate on 52nd & 6th ave!	f	1416598359	1416841188	Asian Fusion		4ed90a2e77c8274efb746d83	\N	25	\N
trucktotable	BistroShopp	trucktotable	http://bistrotruck.com/	55St & Broadway until 4pm. Let's goooo	f	1416245631	1407427421	Moroccan	\N		\N	\N	\N
steaksncrepes	Steaks N Crepes	steaksncrepes	http://steaksncrepes.com	50 st bet 6 & 7 ave for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	f	1397096188	1374766188	American		50f44167e4b0af5bf46321ce	\N	\N	\N
yume	Yume Teriyaki	yumefoodtruck	http://yumeteriyakigrill.com/	Yume is on Hanover and Water today for lunch. Start the weekend the right way :).	f	1400251565	1400251565	Japanese	\N	530cdc14498ee06c95ab14e0	\N	\N	\N
dels	Del's	delsnyc	http://instagram.com/delsnyc	We apologize for being MIA the past 2 days. We've been preparing for the hottest day of the week! Come find us at 21st & 5th Ave until 4pm	f	1410028765	1409149941	Sweets		519bb56b498ed2dfa950ace2	\N	\N	\N
bobjo	BobJo	bobjotruck	http://www.bobjo.net	Welcome Friday! We r ready 2 serve @water & Hanover sq. Try our Ramen noodle soup,rice bowl,bibimbap burrito. Stay warm with ramen soup thax	f	1416845763	1416586585	\N		4e3add0c88772c3bf12772da	\N	42	\N
grillwheels	Grill On Wheels	grillonwheelsny	#	Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00crazy chicken baby chicken lamb burger couscous	f	1412013484	1409929542	Kosher		51b0bf31498e9b68db75612c	\N	\N	\N
gorilla2	Gorilla Cheese 2	gcnyc1	http://t.co/4ZDqfwSH5f	33/park\nVarick  /king\nComeToTheCheeseYo	f	1416582440	1416846307	American		4dc2d3e352b1c1fb37f1e945	g2	5	before
goburger	GO Burger	goburger	http://www.goburger.com	We're on 91st and Amsterdam for dinner tonight. See you soon!	f	1402176073	1398896034	American		4c06b3eccf8c76b0a4eb3a65	\N	\N	\N
crepestruck	Crepes Truck	thecrepestruck	https://www.facebook.com/thecrepestruck	Come ceck out the Brazzers promo truck in Time Square 48 & 7 ave today till 4pm. http://t.co/wUDdRIZpAh	f	1406998391	1406998102	Crepes		4dfb854918386e743d9869e3	\N	\N	\N
getstuffed	Momos & Buns	getstuffednow	http://www.chinesemirch.com	RT @GovIslandFood: 1/3. Only a few more days till Gov Island gourmet food market powered by @livefastgroup opens for the summer. @Getstuffe...	t	1408198481	1400698983	Chinese Fusion		4fa016cbe4b05d0fc11262c5	\N	\N	\N
itizy	Itizy Ice Cream	itizyicecream	http://www.itizy.com/	Likely our last three hours at Columbia this year! Come grab a scoop of your favorite flavor before it runs out!	f	1382307419	1382122482	Sweets		4fcbdcaae4b00a0e855124dd	\N	\N	\N
freshhearty	Fresh and Hearty	freshandhearty	http://freshandheartynyc.com/	Get your Soup & Panini on with Fresh and Hearty! We parked on 46st btw 5th & 6th ave from 11am to 3pm. Call now 4 free delivery! @3474402467	f	1395241942	1390493878	Soup/Salad/Sandwich		51801f7a90e7374e46b6239f	\N	\N	\N
mamak	Mamak	lovemamak	http://www.lovemamak.com/	hey guys we are @smorgasburg pier 2 @BrooklynBridge_  come come come! http://t.co/llBP6I0uKb	f	1416074659	1410708157	Asian		51c4cffa498ec876f564a0b4	\N	\N	\N
taipanexpress	Taipan Fusion Express	taipanexpress		Good morning we are serving lunch at 46 st between 5&6ave from 11:30 to 3pm @FoodtoEat @midtownlunch @nystfood	f	1412268299	1408622100	Thai/Chinese/Indian	\N	532b1b92498ea6c0d1026802	\N	\N	\N
elpaso	El Paso Truck	elpasotruck	http://elpasony.com/	Today we are at @Columbia between W 115th & W 116st. Stop by and get your tacos, burritos, quesadillas yummy  tacotruck FoodTruckfriday	f	1416428307	1412955921	Mexican	\N	523c911f04937624937304c5	\N	36	\N
phils3	Phil's Steaks	philssteaks	http://www.philssteaks.com	Happy Halloween! It's our last day out until April so come grab your last Phil's of the year! 41st between 6th n BWay 11-2. Boo!	f	1416530092	1414761089	American		4f15b382e4b0725660ea9f31	\N	11	\N
wingit	Wing'n It	wingnitnyc	http://www.wingnitnyc.com/	Out here on 23rd and 5th come and grab some wings for lunch today. We will be open from 10am to 3pm. See you guys at lunch.	f	1390923947	1387549355	American		519ffd2b498ededbeef3c073	\N	\N	\N
tacobite	Taco Bite	tacobite	http://www.tacobite.com/	Today we are on\n47th St\nBet\nPark Av / Lexington Av	f	1415029173	1406907223	Mexican		503ba49ae4b0fad35eb7a8dc	\N	\N	\N
kimchitaco	Kimchi Taco	kimchitruck	http://kimchitacotruck.com/	Come get some kimchi to warm you up from the inside in this chilly weather! On 55th at 6th AVE until 2:30pm today	f	1416569504	1416414974	Korean Fusion		4d6ee122b45b59417c6a6778	\N	63	\N
yankeedd	Yankee Doodle Dandy's	usafoodtruck		Y'all need that chicken for gameday!  We're at Fulton and front st with the hookup.  nomnomnom	f	1416318658	1416674018	American	\N	52b497e1498eed13ead2b84c	\N	47	\N
latinkitchennyc	Latin Kitchen	latinkitchennyc	http://www.latinkitchennyc.com/	HAPPY HALLOWEEN ! ! TODAY OUR LAST FRI OF 2014 ..THANK YOU WALLSTREET! !\nLOCATION 55 WATER ST (SIDE OF OLD SLIP) NYC http://t.co/RWCtK9bCEc	f	1414828429	1414768415	Mexican	\N	53878518498ef00115dbdea1	\N	73	\N
valduccis	Valduccis	valduccis	http://valduccis.com	RT @Foodtruckgirl7: @Valduccis @starrettlehigh @greenboxny @FoodtoEat @foodNfest @Cheap_eats that bread !!!! And delicious eats on it!! So ...	f	1416828663	1414686167	Pizza		4df7e1aad4c02ad734170b21	\N	46	\N
lobstertruck	Red Hook Lobster	lobstertruckny	http://redhooklobster.com/	Happy Monday NYC! Start this short work week off right, get a lobster roll for lunch! BigRed is on the streets today at 53rd & Park!	f	1416416210	1416840883	\N		4dc597c57d8b14fb462ed076	\N	26	\N
eddiespizza	Eddie's Pizza	eddiespizzany	http://www.eddiespizzany.com/	Monday's: starrettlehigh http://t.co/C4kHjvRm63	f	1416414799	1416844538	Pizza		4c0cf412b4c6d13ae4850c30	\N	46	\N
chefsamir	Comme Ci, Comme Ca	chefsamirtruck	http://www.chefsamirtruck.com	We are on 55st and Broadway!	f	1415984103	1416589887	Moroccan		4c3c85e3a9509c74b52e395b	\N	28	\N
papayakingtruck	Papaya King	papayakingtruck	https://www.facebook.com/papayaking	Before your thanksgiving feast, grab a frank (or two) on Broadway at 58th St and Broadway at 57th St.	f	1416607595	1416847171	American	\N		\N	30	\N
toastmonster	Toast Monster	toastmonsternyc	http://www.toastmonsternyc.com/	Toast Monster @UrbanSpaceNYC @GarmentDstrctNY till October 17. On Broadway between 40th and 39th st.	f	1416528186	1411270224	American		50ad1829e4b087613d696bc4	\N	\N	\N
schnitzi	Schnitzi	schnitzi1	http://www.schnitzi.com/	Today we are on 46 bet 5&6 Ave serving lunch from 11:30 until 3:30, we got you covered	\N	1416842347	1416497486	German	\N	532b25ed498eb8b1844dc14f	\N	14	\N
treats	The Treats Truck	thetreatstruck	http://www.treatstruck.com	Happy Monday! Hoping to have our spot on 45th & 6th ave today! (since the holiday week means we'll skip Wed)! We'll post soon!	f	1416747582	1416845597	Sweets		49e65021f964a52035641fe3	\N	12	\N
schnitzel	Schnitzel & Things	schnitznthings	http://schnitzelandthings.com	morning guys:) bit warmer today. Stop by the truck on 51st between park and madison. 11:30-2:30pm. Come for lunch or preorder 347-772-7341	f	1414681189	1416498722	German		4a6640b3f964a5204cc81fe3	(schnitztruck|the truck)	23	contains
toum	Toum NYC	toumnyc	https://www.facebook.com/ToumNYC	RT @dumbolot: Welcome back @dubpies! Lot faves @ToumNYC and @MexicoBlvd on Jay and Water too!	f	1416590834	1416842386	Lebanese		500eedb0e4b062ee00577957	\N	54	\N
taim	Taim Mobile	taimmobile	http://www.taimmobile.com/	RT @anitabadejo: FINALLY, SOMETHING WENT MY WAY THIS WEEK. RT @TaimMobile: FRIDAY SURPRISE! Taim is in the flatiron today on 20th/5th!	f	1416846615	1416593218	Mediterranean		4cf2c5321d18a143951b5cec	\N	1	\N
andysitalianice	Andy's Italian Ice	andysitalianice	http://andysitalianicesnyc.com/	Morning NYC - come find us today on 32nd and Park Ave from 11am- 5pm or down in UnionSquare afterwards until 8pm!	f	1413382742	1411741686	Dessert	\N	4df26c2bae609e69dd95d2fc	\N	\N	\N
hh2	Habachi Heaven 2	hibachiheaven	http://www.hibachiheaven.com/	@downtownlunch we are on water and old slip today. Come down and get your yumyum on today	f	1414119948	1416841681	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	1	51	two
mooshu	Moo Shu	mooshugrill	http://www.mooshugrill.com	MSG back at it on 46th & 6th ave today!	f	1416583858	1416841987	Chinese	Moo Shu grill is a slight twist on typical Chinese <a href="https://en.wikipedia.org/wiki/Moo_shu" target="_blank">moo shu</a> The three Moo Shus option is enough for lunch and you can pick and choose a different protein for each. In my opinion the chicken is the best but it is dark meat. </p><p>It's easy to order as there is one window for ordering and for picking up when your name is called.	52090e45498e5500a6bd41fb	\N	13	\N
bigds	Big D's	bigdsgrub	http://bigdsgrub.com/	The Grub Truck is back2back w/ the Khao Cart on 50th Street btwn 6th and 7th Avenue. Preorders call 646-543-BIGD http://t.co/oKBpBop16Y	f	1416525372	1416844330	Korean Fusion		4c968b907605199c2eaec2a3	\N	22	\N
dubpies	DUB Pies	dubpies	http://www.dubpies.com/	PieTruck is  @ Jay St. & Water St., Dumbo, Brooklyn - we're there from 11am to 2.30pm http://t.co/TM8S4jgNDY	f	1416846037	1416839470	New Zealand meat pies	\N	4eb825a62c5b53141b78bfb6	\N	57	\N
neapolitan	Neapolitan Express	neaexpress	http://neapolitanexpress.com/	Come and get it! We got a truck on 116th and Broadway and one 86th and Lexington tonight... http://t.co/mwUb9Rs5l7 http://t.co/9mr3KO1nKo	f	1416602146	1416530313	Pizza		51c8864c498e0ac96c14433e	\N	35	\N
palenque	Palenque	palenquefood	http://www.palenquehomemadecolombianfood.com	Even if it's raining Palenque it's ready to serve you the most tasty arepas in town! @UrbanSpaceNYC @Broadway between 40th st and 39th st!	f	1416500332	1412178982	Colombian Fusion		4e84f424dab45bbd2617dc62	\N	\N	\N
wafelMomma	Wafels & Dinges Momma	waffletruck	http://www.wafelsanddinges.com/	TRUCKS\nKastaar @ Park Ave & 40th til 4:30pm\nMomma @ Wall Street till 4:30pm	f	1416785683	1416581183	Belgian		4a416369f964a52036a51fe3	momma	9	before
pontirossi	Ponti Rossi	pontirossifood	http://www.pontirossifood.com/	Hello Midtown! Today we serving lunch on 47th st btw park and lex. Call in for orders 347-506-9616 	f	1416802162	1412862491	Italian	\N	542d78f4498ee5493e1a8989	\N	17	\N
mrnice	Mr Nice Guy	mrniceguytruck	http://mrniceguynyc.com	71st and york... it's friday	f	1414424434	1414687317	American		520bbbb211d26afae232ec59	\N	33	\N
cinnamonsnail2	The Cinnamon Snail 2	veganlunchtruck	http://www.cinnamonsnail.com/	We will be on 48th/6th today with a free donut with any purchase!\n\nNo service to 23rd/park today, grampa truck needs a new starter  I cry.	\N	1416787623	1416825441	Vegan	\N	4c263af6a852c9287537e66c	2	69	two
funbuns	Fun Buns	funbunsnyc	http://j24f.com/funbuns/	Last day to get your favorite buns this year at 50th st between 6 / 7 ave midtown Happy Halloween everyone	f	1414163207	1414768000	Asian		4f8d9663e4b021137aa2bdde	\N	22	\N
disos	DiSO's	disosnyc	http://www.disosnyc.com/	@DiSOSNYC: Lunch today 47th bet park and lex.\n\nCall in orders: 917-756-4145	f	1416596406	1416843235	Italian Sandwiches	These might be typical italian sandwiches but the ingredients are high quality. You need to get there early because the line can get long and they will run out of some breads. I believe the focaccia half is a normal portion for lunch while their half and hero sizes are pretty big.	519523d6498eeaa6200aad03	\N	17	\N
biandang	Bian Dang	biandangnyc	http://www.biandangnyc.com/	Thankful for dope fans:) 53rd & park today!	f	1416598640	1416841296	Taiwanese		4d712874722ef04d04160d9c	\N	26	\N
nuchas	Nuchas	nuchasnyc	http://www.nuchas.com	Who needs gloves when you can get warm with empanadas - The truck is located on Broad & Pearl St today in FIDI http://t.co/rxvaIhcp34	f	1416840072	1416323070	Mexican		4ebd2a9bb8f7b504a754c130	\N	67	\N
paris	Paris Sandwich	parissandwich	http://www.parissandwiches.com/	Last day in dumbo today on fronts and Adams @ 11:30 @DUMBOFoodTrucks	f	1415724957	1414764931	French/Vietnamese		519e4ed0498e4f27e64c177a	\N	75	\N
shanghai	Shanghai Sogo	shanghaisogo	http://www.shanghaisogo.com/	Happy Halloween. TGIFriday !! We r serving at water and Hanover sq!! ( 10 Hanover square ) come & get some. 11~3pm. http://t.co/VBdd8zsVAK	f	1414796018	1414769059	Asian		5258369d498e13def2bef2cb	\N	42	\N
hh3	Habachi Heaven 3	hibachiheaven	http://www.hibachiheaven.com/	midtown. Come get warm with some hot HIBACHIHEAVENNYC, find us at 33rd/Park and 47th/Park for some yumyum	f	1414119948	1414075107	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	2	5	two
snowday	Snowday	snowdaytruck	http://snowdayfoodtruck.com/	Eat lunch - change the city. @csiSL @starrettlehigh-601 west 26th st today from 1130-3pm. We commend @BilldeBlasio on new Rikers reform.	f	1416839387	1416587418	Comfort	\N	533ddd4a498e774b8250a69b	\N	46	\N
mexicoblvd	Mexico Blvd.	mexicoblvd	http://mexicoblvd.com	Buenos dias Dumbo! taquiza @MexicoBlvd @dumbolot Water&Jay	f	1416611957	1416843129	Mexican		4f4e55aee4b04c96fba5b149	\N	54	\N
carpedonut	Carpe Donut	carpedonutnyc	http://carpedonutnyc.com/	Good morning NEW YORK!!! Truck open at 55th street and Broadway. COME!!!!	f	1416828439	1416570548	Sweets	They only server one kind of donut here, the apple cider, but it's a pretty good one. They are fresh and still hot when you get them. They have donut ice cream sandwiches but you should know the entire thing is in the freezer so you will get a frozen donut as well.	5169892c498e0522481eea97	\N	28	\N
lukeslobster	Luke's Lobster	nautimobile	http://lukeslobster.com/	Help us show winter we ain't afraid. We got pipin' hot lobster grilled cheese and clam chowder here at 17th and 5th	f	1416766291	1416321519	Seafood		4dc81239b0fb5556cd2f3023	\N	86	\N
mamuthai	Mamu Thai Noodle	mamuthainoodle	https://www.facebook.com/MamuThaiNoodle	We're back @dumbolot ! Missed you last week! Come by and get your fill of hot/fresh Thai noodles! We brought Tom yum soup @DUMBOFoodTrucks	f	1416845366	1415374369	Thai		5126a10ae4b0af674c85f353	\N	54	\N
mtblls	Mtblls	mtblls		Happy Thursday!  The Mtbll  has stopped on 50th bet 6&7 aves. They are warming up some beef and chicken balls, so come on by say hi	f	1416839535	1416497024	Italian	\N	504fb7fde4b0bc88c3a6b614	\N	22	\N
carls	Carl's Steaks	carlssteaks	http://carlssteaks.com/home/	Its the Carl's Steaks Monday PRE THANKSGIVING FEAST! Hudson st & king st grab your favorite cheesesteak \nGOT WHIZ? http://t.co/PLYT2ixQgN	f	1416326180	1416845955	American		51a78330498e3fc1f22d771e	\N	39	\N
eggstrav	eggstravaganza	etravaganza	http://www.eggstravaganzany.com/	Rain or shine..!!always preparing your food from scratch.join us.for a tasty and warm meal. The truck is at 52nd and Park.	\N	1416845720	1416327776	Mexican	\N	4b15165ef964a52049a823e3	\N	72	\N
morris	Morris Grilled Cheese	morristruck	http://morrisgrilledcheese.com/	Peel off those layers, grab your coworkers and come see us at 52nd and 6th! 11:30-2:30	f	1416585917	1416845015	American		4e0e0b3caeb7a5b33ee5dac1	\N	25	\N
wafelKastaar	Wafels & Dinges Kastaar	waffletruck	http://www.wafelsanddinges.com/	TRUCKS\nKastaar @ Park Ave & 40th til 4:30pm\nMomma @ Wall Street till 4:30pm	f	1416785683	1416581183	Belgian		4a416369f964a52036a51fe3	kastaar	9	before
sweetery	Sweetery	sweeterynyc	http://sweeterynyc.com	Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/H3HVbTwWc4	f	1416498381	1416832505	Sweets		4a28d919f964a52056951fe3	\N	39	\N
polish	Old Traditional Polish Cuisine	polishcuisine	https://www.facebook.com/pages/Old-Traditional-Polish-Cuisine/315496671902708	Ready and Open on 55th & Broadway with Fresh Paczki BeatTheLine Pierogitime @randomfoodtruck	f	1416840115	1416585457	Polish		51435df4e4b0823a398ebc8a	\N	28	\N
mexicue	Mexicue	mexicue	http://mexicueny.com	Eating these sliders under an umbrella is like movie make-out scenes under waterfalls. \n\nCome get em at MadSqEats http://t.co/VxW4aWmiwh	f	1416844022	1410639912	Mexican		4c51a6a71c67ef3ba6b61ab9	\N	\N	\N
schnitzelcart	Schnitzel & Things Cart	schnitznthings	http://schnitzelandthings.com	The SchnitzCart will be on 55th & Broadway from 11:30-2:30pm slinging that warm schnitz. Preorder 212-470-7053 @randomfoodtruck	f	1415734308	1416834894	German	\N	4a6640b3f964a5204cc81fe3	(schnitzcart|the cart)	28	contains
greenradish	The Green Radish	thegreenradish1	http://www.thegreenradish.com/	Eat Plants! Today52&6 11-2 @ubs @RollingStone @MensHealthMag @usweekly @midtownlunch @goop @GwynethPaltrow_ @simonsam http://t.co/JRuChtklos	f	1416586929	1416499431	Vegan		5229feab11d2edde794d385c	\N	25	\N
frites	Frites 'N Meats	fritesnmeats	http://www.fritesnmeats.com/	Lunch 2day @ 52nd st b/t 6th & 7th av. Burger of the week THE PLOUGHMAN. Preorder 9172929226 midtown	f	1416488760	1416840318	American	This is a good burger but this truck is interesting because of the many toppings they carry and their burger of the week. 	4ae9d217f964a520bcb621e3	\N	61	\N
gorilla1	Gorilla Cheese 1	gcnyc1	http://www.gorillacheesenyc.com/	33/park\nVarick  /king\nComeToTheCheeseYo	f	1416582440	1416846307	American		4dc2d3e352b1c1fb37f1e945	g1	5	before
korilla	Korilla BBQ	korillabbq	http://korillabbq.com	Lunch today at 47th & Park!	f	1416399662	1416843593	Korean Fusion		4cc701aa01fb236ab070baba	\N	16	\N
mausam	Mausam	mausamnyc	http://www.mausamnyc.com	fresh curries @47 street between Park N Lex Curry King authentic flavors N Bites	f	1416319325	1416838434	Indian		50730eebe4b0f3224431dc5d	\N	17	\N
steelcart	The Steel Cart	thesteelcart	http://www.thesteelcart.com/	Front & Jay Monday with Split Pea & Rustic Chicken Soup. @DUMBOFoodTrucks	f	1416843469	1416841612	French		511d3abee4b0e188895f3697	\N	56	\N
sweetchili	Sweet Chili	sweetchilinyc	http://sweetchilinyc.com/	Now serving lunch on 46th & 6th till 3! thaietnamese lunchtime feedme spicy nycfoodtruck midtown http://t.co/tI5Rzwo2EY	f	1416581011	1416847464	Asian		51a8c802498e2165ca855a19	\N	13	\N
milktruck	Milk Truck	milktrucknyc	http://www.milktrucknyc.com	RT @tarynsaysrelax: @milktrucknyc: Bessie's at Wall & William, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always @h...	f	1416839414	1416589427	American		4e823c0229c2dbb2b7043972	\N	41	\N
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
@J_KlDD hah it's the society thing..	1416596406	535870283706818561	f	disosnyc
@justin_cohen executivedecisions..	1416583747	535817190386442240	f	disosnyc
RT @justin_cohen: Toughest decision of the day is what to get at @DiSOSNYC for lunch.	1416583707	535817020357763072	f	disosnyc
48th bet 6 and 7 ave.. Must be Friday!\nDisos homemade hot roast beef special today..\n\nCall in your orders to: 917-756-4145	1416583137	535814631009570816	f	disosnyc
@justin_cohen @___OJ___ @bmitchelf haha we'll be on 48 bet 6 and 7 Tom. Friday baby!	1416514604	535527180600868864	f	disosnyc
Slingin sandwiches today on 47th bet park and lex.\n\nCall in your orders: 917-756-4145	1416501124	535470643559821313	f	disosnyc
Doing lunch things on 48th bet 6 and 7 ave. \n\nCall in orders to: 917-756-4145	1416323563	534725898873110528	f	disosnyc
Monday lunch has been postponed due to rain, make up date is for tomorrow on 48th bet 6 and 7 ave.\n\nThanks,	1416236813	534362042275487744	f	disosnyc
RT @___OJ___: @justin_cohen @DiSOSNYC I went out dere yesterday...suck it up Justin...go get yawself a damn sangwich	1415980186	533285668886429696	f	disosnyc
Posted up on 48th bet 6 and 7 ave. \n\nCall in orders to: 917-756-4145	1415977243	533273328300335104	f	disosnyc
Location 47th bet Park and lex today.\n\nCall in orders: 917-756-4145	1415893715	532922985783754753	f	disosnyc
RT @justin_cohen: Feeling like Friday will be a @DiSOSNYC day...	1415809834	532571162174566400	f	disosnyc
Fan of Disos?? Tell us on yelp.. And receive $5 OFF your next sanggwich purchase!!! **show your tweet at order window http://t.co/npip1i2OdU	1415807649	532561998941544448	f	disosnyc
Water st and old slip today.. FIDI\n\nCall in orders to: 917-756-4145	1415806336	532556490771406850	f	disosnyc
@48th st bet 6 and 7 ave. Roast beef special today\n\nCall in orders to: 917-756-4145	1415719143	532190777162878976	f	disosnyc
@NYUStern come by for a damn sangggwich! :)\n\nWest 4th and Greene st	1415651514	531907121185820672	f	disosnyc
@NYUStern come by for a damn sangggwich! :)	1415651459	531906888976576512	f	disosnyc
RT @asSharp: I'm at DiSO's Italian Sandwich Society - @disosnyc in New York, NY https://t.co/6YDlFoe05k	1415651424	531906743975280640	f	disosnyc
Open for lunch. 47th bet park and lex. \n\nDisos homemade roast beef on special today..\n\nCall in orders to: 917-756-4145	1415637355	531847734622711809	f	disosnyc
@m732sg hey Scott we do FIDI on Wednesdays. Water and old slip. Where's ur location?	1415631463	531823021263446017	f	disosnyc
Good Day to Vegout Get Rad Today, Friday, OldSlip&WaterSt 11-1:45... http://t.co/QbhgMfRA5g	1416586929	535830534547865601	f	thegreenradish1
Good Day to VegOut...Get Rad OldSlip&WaterSt 11-1:45 @DowntownNYC @WholeFoods @goop @WellandGoodNYC @GwynethPaltrow_ http://t.co/hmCw9Grxtv	1416586742	535829750242353153	f	thegreenradish1
We have your PlantBased Vegan Lunch Old Slip&WaterSt...Today, Friday, 11am to 1:45pm....	1416575366	535782035861037056	f	thegreenradish1
Eat Plants! Today52&6 11-2 @ubs @RollingStone @MensHealthMag @usweekly @midtownlunch @goop @GwynethPaltrow_ @simonsam http://t.co/JRuChtklos	1416499431	535463541290332160	f	thegreenradish1
Thanks for flying The Green Radish... GoVegan Today 52&6 11-2pm... http://t.co/zzhZotlRyP	1416497309	535454641790926848	f	thegreenradish1
Good Day4a Plantbased Lunch GetRad 52&6 11-2 @WellandGoodNYC @goop @WholeFoods @GwynethPaltrow_ @ubs @RollingStone @midtownlunch @usweekly	1416483075	535394939132448768	f	thegreenradish1
Last Call, place your G-Rad Thanksgiving order Today...https://t.co/G9ZU2JQ2Q1 http://t.co/gZSiMTUHVn	1416475298	535362321515044864	f	thegreenradish1
Opened at 53rd Street and Park Avenue. Preorders call 646-543-BIGD LETS GOOO!!! TGIF!	1415982365	533294808195149824	f	bigdsgrub
Eat Plants, Live Longer!!! Today 38&Bway 11-2 @GarmentDstrctNY @WellandGoodNYC @goop @NewYorkObserver @midtownlunch @NewYorker @EatStTweet	1416409096	535084648234508288	f	thegreenradish1
Don't let the cold stop you from a hot thanksgiving wrap...today, Wednesday 38&Bway 11-2 govegan	1416399695	535045217024770048	f	thegreenradish1
Send Cold Packing,Rstd Carrot-Ginger Soup & Thanksgiving wrap 51&madison11-2 @goop @OneGreenPlanet @WellandGoodNYC @midtownlunch @EatStTweet	1416326138	534736698782281729	f	thegreenradish1
Try our Thanksgiving wrap, today, Tues, 51@Madison 11-2pm @midtownlunch @HuffPostNY @grubstreet @EatStTweet @thelittleidiot @goop @simonsam	1416314951	534689775857717248	f	thegreenradish1
RT @AHealthBlog: Nutrients in Radishes http://t.co/b9S3vMTMPs http://t.co/UJTcqr6NyI	1416312039	534677563676049408	f	thegreenradish1
Hanging with The Green Team at RAS... http://t.co/Jk5m9pS3lW	1416311570	534675594521632768	f	thegreenradish1
SCHEDULE\n \nTuesday - 51st. Between Park and Madison\nWednesday - 38th and Broadway\nThursday - TBA\nFriday - Old Slip at Water St.	1416310278	534670175078203392	f	thegreenradish1
TODAYS SPECIALS  \n\nServing 11-2PM All Days \n\nROASTED CARROT & SQUASH SOUP  8 \nGrilled Broccoli\n\nKALE SALAD 9\nRed... http://t.co/Kmrv9hQbWz	1416309913	534668647302975488	f	thegreenradish1
RT @Delnada: This foodtruck has amazing vegan and glutenfree food! omg!  Look for thegreenradish in your... http://t.co/ROumjstqiI	1416218335	534284541801005056	f	thegreenradish1
Get your G-Rad Thanksgiving order in, 4 Days to go...https://t.co/G9ZU2JQ2Q1 http://t.co/tbZWctp8DC	1416144456	533974669620428800	f	thegreenradish1
At Kayla and Patrick's Brooklyn Wedding; all the best to this lovely couple!!! http://t.co/nKuxAThZU9	1416144392	533974399066853376	f	thegreenradish1
RT @thekaylaconroy: The AMAZING @thegreenradish1 food truck was a huge hit at our wedding!! Thanks again, James for being... http://t.co/vlZ9...	1416142696	533967287087136768	f	thegreenradish1
I posted a new photo to Facebook http://t.co/LOJo2vdh5B	1416072415	533672506960658433	f	thegreenradish1
DidYouKnow - The word empanada comes from the Spanish word 'empanar' meaning to bread, or to bake in pastry.	1416609319	535924447023468545	f	nuchasnyc
Got plans on Sunday, Nov 23rd? Join us at the Vendy Awards' Vendy Plaza at La Marqueta from 12-6pm at 115th &... http://t.co/HSBfxGilxv	1416594601	535862715580178432	f	nuchasnyc
@PlatProperties awesome photo! We hope you enjoyed muchasnuchas	1416589603	535841750099574784	f	nuchasnyc
RT @FoodtoEat: Munch on @NuchasNYC empanadas today at Broad St & South Williams. Preorder online for quick pickup: http://t.co/Pj90Wa7d9u	1416589577	535841641492254722	f	nuchasnyc
RT @PlatProperties: .@nuchasnyc is on Broad & S. Williams St. today. Great empanadas, pastries and beverages with a flavor... http://t.co/DbH...	1416589572	535841620688519169	f	nuchasnyc
Happy Friday NYC! The truck will be on Broad & S. Williams St today. Have some muchasnuchas today to keep warm ;) http://t.co/1OXrgI6gyN	1416579654	535800019631505408	f	nuchasnyc
@lilsisser Great photo!	1416516581	535535475847856128	f	nuchasnyc
RT @lilsisser: Yummmmm @NuchasNYC 21stn5th empanada thursdays http://t.co/SHUQyeutJV	1416516577	535535458378612738	f	nuchasnyc
Craving something new for lunch? Try our Spicy Chicken Empanada!	1416515721	535531866301140993	f	nuchasnyc
Good Morning NYC - The truck will be located on 21st and 5th St in SOHO http://t.co/a8Pj0BoQjO	1416497145	535453953752707072	f	nuchasnyc
Are you following us on Instagram? Spread the Nuchas love and tag your photos with MuchasNuchas! http://t.co/1enivhvdYM	1416432921	535184577627979777	f	nuchasnyc
Nuchas are freshly handmade and perfected every day to cater to your taste budsand to your party. Email your... http://t.co/J9d2N6z9t2	1416420002	535130392144384000	f	nuchasnyc
@kelywilsn We hope you enjoyed them!	1416418142	535122589505818624	f	nuchasnyc
@SqueakyNYC We're excited for tonight!	1416418132	535122547420172289	f	nuchasnyc
RT @kelywilsn: Down to @NuchasNYC for mid morning empanadas. Which means back up the stairs to walk them off! daretostair COPDDay http://...	1416418107	535122444957548545	f	nuchasnyc
Spend time with us and order some  muchasnuchas. The truck is located on the corner of Varick St between... http://t.co/JSyGY9JFAT	1416411416	535094378650664960	f	nuchasnyc
Retweet if you're in the mood for fresh baked empanadas! Come visit us in the heart of timessquare or greeleysquare!	1416350107	534837231874490369	f	nuchasnyc
Stop by Nuchas Greeley Square to try our special drinks for the Fall & Winter! Italian thick hot chocolate, Dark... http://t.co/dkxgOh0WP4	1416334501	534771774995439616	f	nuchasnyc
Who needs gloves when you can get warm with empanadas - The truck is located on Broad & Pearl St today in FIDI http://t.co/rxvaIhcp34	1416323070	534723829260877826	f	nuchasnyc
@HeeroFanel Great photo!	1416265437	534482100079300609	f	nuchasnyc
Let's end the week off proper at 53rd Street and Park Ave! We're grillin' it up and you can preorder by calling 646-543-BIGD! TGIFF	1416581140	535806252857974786	f	bigdsgrub
Heating things up w/ our spicy Thai Green Curry & MORE at 50th Street btwn 6th and 7th Ave. Preorders 646-543-BIGD http://t.co/1JiXaEOpvI	1416579458	535799199145947136	f	bigdsgrub
@michelleDUBS @sopherliu so sorry about last night ladies. 	1416525372	535572347152236544	f	bigdsgrub
Lunch is ready! The Grub Truck & Khao Cart are on 50th Street btwn 6/7 Ave. Beat the wait and preorder 646-543-BIGD!!	1416502748	535477452836204544	f	bigdsgrub
The Grub Truck AND Khao Cart is back2back on 50th Street btwn 6th and 7th Avenue. Check out today's menu!! http://t.co/fqxgJfuz20	1416497875	535457015385300993	f	bigdsgrub
Lunch is ready! 53rd Street btwn Park Ave and Madison Ave, now till 2pm.  Preorders call 646-543-BIGD	1416414354	535106703835271168	f	bigdsgrub
53rd Street and Park Avenue today.  Preorders call 646-543-BIGD	1416405369	535069016424218625	f	bigdsgrub
The Grub Truck is at our usual Tuesday spot.  Running a little late but open by 11am.  Preorders call 646-543-BIGD TacoTuesday	1416321113	534715621221867520	f	bigdsgrub
Sorry Midtown! The Khao Cart is in for repairs, we'll be back out on Thursday.  See you then!	1416320958	534714971624861696	f	bigdsgrub
Starting tomorrow, the Khao Cart will be taking preorders for pickup!! Call 646-543-BIGD	1416274856	534521605670846465	f	bigdsgrub
RT @EaterNY: Eater Awards  New York City Chef of the Year: Chris Jaeckle (@cjaeckle): http://t.co/ocLghueWz8 eaterawards14 http://t.co/pc...	1416263191	534472680448471041	f	bigdsgrub
Lunch is ready at Hudson/King St. (375 Hudson Street. Preorders call 646-543-BIGD for pickup	1416243403	534389682210344960	f	bigdsgrub
Khao Cart closed today, back out tomorrow!!	1416235600	534356953590681600	f	bigdsgrub
Join us at Hudson/King St. for lunch today. (375 Hudson Street) Preorders call 646-543-BIGD	1416229993	534333437633912832	f	bigdsgrub
Join us for the @TimeOutNewYork Asian Night Market tonight. 168 Bowery Street http://t.co/aSQTZBphYT...	1416012979	533423215511891968	f	bigdsgrub
The Khao Cart is closed today and back out on Monday!	1415974950	533263710291517440	f	bigdsgrub
The Grub Truck has your hot lunch at 53rd Street and Park Avenue. Preorders call 646-543-BIGD	1415974910	533263540900339712	f	bigdsgrub
@joyabella see you tomorrow?	1415938202	533109576913387520	f	bigdsgrub
@MaharlikaNYC: .@bigdsgrub serving tacos too at the  nightmarketnyc event twins  http://t.co/YGNXKleTWD samesamebutdifferent	1415928491	533068844144001024	f	bigdsgrub
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
RT @SRBBrooklyn: Chicken wings, pop locking and vinyl records. All here, Saturday with @JusteDeboutUSA @ilovevinyl & @wingnitnyc	1386300380	408799543166124032	f	wingnitnyc
RT @SRBBrooklyn: If you're coming out to this Saturday's @JusteDeboutUSA event be sure to grab some grub from @wingnitnyc, they'll be servi...	1386277311	408702781235929088	f	wingnitnyc
We have been going through some issues at our commissary and due to these issues we are unfortunately not able to... http://t.co/8hzi0hlGy4	1386160771	408213977030615041	f	wingnitnyc
Sorry everyone, we aren't out today. See you guys tomorrow.	1386081285	407880590243803137	f	wingnitnyc
Happy Thanksgiving Everyone! http://t.co/u7HYUz1MyA	1385666299	406140011419955200	f	wingnitnyc
Happy Thanksgiving Everyone! http://t.co/yTrps7tc4O	1385666235	406139743098142720	f	wingnitnyc
RT @MobileCuisine: Food Cart Vendors Face Fines and Arrests for Selling Snacks - http://t.co/Oh2k939USu	1385525761	405550553155252224	f	wingnitnyc
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
Sorry ice lovers, well be OFF THE ROAD today! Find us tomorrow at the Downtown Jersey City Street Fair! http://t.co/V6TKoLchs5	1411139072	512980567777103872	f	andysitalianice
Too cool for your favorite ice? Dont worry, we also proudly serve Demarco Coffee. Try a latte, cappuccino, or even some hot chocolate!	1411054031	512623878670393344	f	andysitalianice
NYC - Come down to Water & Broad Street today from 11a-5p. Or head over to Union Square from 6p-8p!	1411048728	512601638578565121	f	andysitalianice
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
@KingsDontAge @Sele_Ana 11am-3pm or so...	1416582440	535811706375925760	f	gcnyc1
@Sele_Ana @KingsDontAge till 11am-3pm or so	1416582408	535811573533913090	f	gcnyc1
G1- 46 5/6\nG2 - 47/Park\nRavioli Melts w/smoked  mozzarella, caramelized onions, parmigiano & marinara. \nComeToTheCheeseYo	1416582373	535811424199901184	f	gcnyc1
G1 on water just off Hanover	1416500810	535469327366230016	f	gcnyc1
G1 -  Hanover  water /pearl\nG2- 33/ Park\nRavioli Melts tasty ComeToTheCheeseYo \nComeToTheCheeseYo	1416495925	535448837692092416	f	gcnyc1
BlackFriday  ComeToTheCheeseYo \nhire us to help sell	1416460963	535302196821524480	f	gcnyc1
G1- 37/Broadway \nG2- 26th  11/12\nRavioli  Melts w/smoked mozzarella parm, caramelized onions, marinara \n@starretlehigh\nComeToTheCheeseYo	1416409855	535087832747212800	f	gcnyc1
G1- 37/Broadway \nG2- 26th  11/12\nRavioli  Melts w/smoked mozzarella parm, caramelized onions, marinara \n@starret-lehigh\nComeToTheCheeseYo	1416409783	535087529985597441	f	gcnyc1
RT @NYCMayorsOffice: A zip code breakdown of the 17,152 PreKForAll enrollments in Brooklyn. http://t.co/08vrWoV14y	1416404184	535064045586767872	f	gcnyc1
Catch us this morning  on @GMA with @kevinolearytv SharkTank	1416402760	535058074613350400	f	gcnyc1
G1 Hudson /king\nG2 47/Park\nRavioli Melts \ntasty ComeToTheCheeseYo	1416329416	534750448826482688	f	gcnyc1
RT @ciaEATS: I can't wait for lunch time @gcnyc1	1416273007	534513851132563456	f	gcnyc1
RT @skronethal: @gcnyc1 thanks for coming to my sons Bar Mitzvah Saturday night Awesome job, awesome food! Everyone loved it!	1416273001	534513827363430400	f	gcnyc1
@skronethal steve, thanks for having  us....\nGlad you enjoyed  Mazel Tov!!!!	1416272992	534513788171857920	f	gcnyc1
RT @PinedoPR: Thanks to @gcnyc1 for my delicious lunch & for having some of the nicest peeps on your staff! Grateful	1416240922	534379275743657984	f	gcnyc1
RT @AChocolateWoman: @gcnyc1 - Dinner: Ravioli Grilled Cheese Sandwich: Ravioli, mozzarella, parmesan, bacon and marinara sauce http:...	1416240911	534379230852055040	f	gcnyc1
RT @hellojoepark: Here in the ues. (@ Gorilla Cheese Truck NYC - @gcnyc1 in New York, NY) https://t.co/xts2lc7AcE	1416240903	534379198421696512	f	gcnyc1
RT @rbordoni: @gcnyc1 10/10 would grilled cheese again http://t.co/qq7pkglOBb	1416240899	534379181665423360	f	gcnyc1
RT @sportsfreak6: @rbordoni @gcnyc1 hell of a grill cheese best one yet 	1416240894	534379160446468096	f	gcnyc1
G1- Varick/Charlton \nG2- 33/Park \nRavioli Melts tasty\nComeToTheCheeseYo	1416240847	534378962634678272	f	gcnyc1
Dear Fans we are on 52nd. St bet 6-7Ave(closer to 6ave) till 2:15pm after Astoria Queens 30Ave & 31street from 4:30-9pm thank You	1416496536	535451400755773440	f	langostruck
Hi L-T front of NYU W4street and Greene street till 8pm .thanks don't forget to try Fresh Cod Fish & Chips http://t.co/KTH59OXy8G	1416327584	534742761543831552	f	langostruck
Hi don't forget the Langos Truck is front of the Hungarian House 82nd. Street bet 2-3 Ave till 7pm thank you	1416077759	533694920939560962	f	langostruck
Friday Night Langos Truck will be front of\nKeybar\nfrom5-11pm\nAddress: 432 E 13th St, New York, NY10009\nbet Ave A&1Ave\nhttp://t.co/hfCEpg7xIf	1415905070	532970611908550657	f	langostruck
Dear New Yorkers\nLangos Truck is in Queens Astoria\non 30th.Ave bet 31-32 street\nfrom 4:30-9 pm\ntomorrow East Village front of KEYBAR \n5-11pm	1415904825	532969583440060416	f	langostruck
Happy Tuesday night Langos Truck is in Astoria Queens till 9pm corner of 31 street and 30th. Ave	1415741386	532284071544897536	f	langostruck
Dear Midtown We are at 47 th.street bet Lexington and Park langos ,burger ,skirt steak sandwich, crepes, fish and chips etc enjoy	1415722983	532206883848077312	f	langostruck
Hi front of NYU whole day long till 8pm,corner of W4 street and Greene	1415207320	530044034770034689	f	langostruck
Corner of W 4th. Street and Greene st	1415115920	529660677875843072	f	langostruck
Hi Langos Truck is front of NYU all day long from 11-8pm .dont forget our Mediterranean burger,crepes , skirt steak sandwich , etc. Enjoy	1415115842	529660347079475200	f	langostruck
Hi Langos Truck  parked on 14th. Street bet 5 Ave and Union square West need more info 646 286 9949	1414800438	528337448427073537	f	langostruck
Hi tonight usual spot in Astoria Queens corner of 30th.Ave and 31street from5-9pm	1414690086	527874597698699264	f	langostruck
@doryruns  dear Dory we going to the Village Halloween night,exact location will be posted in the early evening.thx	1414689950	527874027776667648	f	langostruck
Hi Langos Truck is in Midtown for you 47 Street bet Park&Lexington till2pm not only The Freshest Dough on the Planet,buy everything homemade	1414592210	527464077942349824	f	langostruck
The only Guy who didn't like our Langos http://t.co/T9aaAjZiTr	1414525550	527184483825754114	f	langostruck
Dear Fans Langos Truck is in the Wall Street area corner of Water street and Old slip from 11-2pm thanks	1414503565	527092272073306112	f	langostruck
Hi Langos Truck is front of NYU W 4 street and Greene till 8pm spinach soup , langos ,crepes,burgers, stuffed cabbage ,crab cakes .	1414425032	526762881514500096	f	langostruck
Langos Truck New menu items.Enjoy http://t.co/odiyd26Zu7	1414078761	525310517616078849	f	langostruck
Hi L-T at 47st bet Park&lexington 11-2pm new items broccoli soup,crab cakes w mini greek salad,fish&chips homemade tartar, night in Astoria	1414070838	525277285415665665	f	langostruck
Dear Friends just park front of NYU corner of W 4 street and Greene street till 6pm	1413995979	524963302460653568	f	langostruck
Happy Friday, Amigos! The truck wont be out today, but you can catch us on Tuesday at the Dumbo Food Lot on Water street @ Jay street	1416569504	535757448163102720	f	kimchitruck
RT @KimchiGrill: Come check out Lauren's boootiful work. And have a spicy paloma while you're at it! http://t.co/3VwqAbFTd9	1416504214	535483604953202688	f	kimchitruck
The truck crew will be facing the cold today on Charlton st @ Varick from 11:30-2:30pm come get some Kimchi to warm your belly!	1416495905	535448753113935872	f	kimchitruck
RT @CultureGlaze: What is kimchi? Check out our guide here:  http://t.co/GIsoutWagz @KimchiTruck	1416493930	535440467467726849	f	kimchitruck
@keithbacker Gracias. Hoping the doc will get us fixed soon :)	1416442318	535223993813725186	f	kimchitruck
Baby its cold outside! No line up bonus and no longer than a 2min wait for food! Were here until 2:30pm	1416419087	535126555467743232	f	kimchitruck
Come get some kimchi to warm you up from the inside in this chilly weather! On 55th at 6th AVE until 2:30pm today	1416414974	535109303049658368	f	kimchitruck
Dont be thrown off by the closed sidewalk & the construction pylons! Well still be open right at 11:30 on water st @ the dumbolot Dumbo	1416327816	534743736161685504	f	kimchitruck
RT @dumbolot: Lunch at the lot today includes @carlssteaks @SweetChiliNYC and @KimchiTruck! 11:30-2:30pm	1416321758	534718327835602944	f	kimchitruck
Happy Tuesday Dumbo! Are you hungry? Water st @ Jay st today 11:3-2:30 nyfoodtrucks dumbolot lunch	1416312190	534678197456343041	f	kimchitruck
The truck wont be out today, folks. Well catch you tomorrow in dumbo 11:30-2:30 on water st @ jay st	1416251606	534424086731296770	f	kimchitruck
RT @KimchiGrill: So much thanks to our talented neighbor @willletterforlunch for drinkifying our board! http://t.co/OEgKp29Pkq	1416246638	534403249823297536	f	kimchitruck
No truck on this rainy, rainy day, but we'll catch ya in Dumbo tomorrow!	1416241395	534381261323001856	f	kimchitruck
Truck is getting winterized, so it wont be out for lunch service today.pop by 766 Washington ave 4 some soup to\nwarm yer bones	1415977116	533272795787300864	f	kimchitruck
South Korean Festival makes mass quantities of kimchi!  http://t.co/vwQtVbKX7a	1415973923	533259402179268608	f	kimchitruck
Well, its 5 oclock somewhere ;) RT @EdibleBrooklyn: What to do with the highest proof spirit in the country?http://t.co/fsdTqUSxs0	1415965754	533225137571917825	f	kimchitruck
Stop by the truck today in soho from 11:30am - 2:30pm on CHARLTON st @ Varick st soholunch nyfoodtrucks	1415892478	532917798402797568	f	kimchitruck
Coming at cha tomorrow soho ! On Charlton st @ Varick st. From 11:30-2:30 every Thursday soholunch nyfoodtrucks	1415844590	532716940100661248	f	kimchitruck
@TooBadDiane love it!	1415844412	532716191165726721	f	kimchitruck
Hey midtown, we had to schooch over to 54th & 6th today. Follow the whiff of kimchi.	1415809467	532569622571397121	f	kimchitruck
RT @FoodtoEat: FalafelFriday with @ToumNYC! Go vegan for a day! Preorder online for easy pickup: http://t.co/DBRm6skBdw	1416590834	535846913523073024	f	toumnyc
It's going to be a delicious FoodTruckFriday @TheSeaport on John & Front St! Join us for a vegan Falafel platter! http://t.co/kH74wpHGwa	1416577462	535790826555985920	f	toumnyc
RT @FoodtoEat: .@ToumNYC serving up sizzling hot lebanesefood. Preorder online for easy pickup to avoid standing in the cold: http://t.co/...	1416501407	535471831122477057	f	toumnyc
RT @dumbolot: Happy Thursday! @MexicoBlvd @ToumNYC and @mausamnyc in the lot today!	1416498373	535459103301435392	f	toumnyc
We love @DumboNYC! Join us on Jay & Water St today for the juiciest beef kabab sandwich! Is your mouth watering yet?! http://t.co/zd9wW0Ltfw	1416492176	535433112457863168	f	toumnyc
RT @DanielsMeri: @ToumNYC It was absolutely delicious. I couldn't finish it, but I will be back.	1416465539	535321389255774209	f	toumnyc
@DanielsMeri That's what we love to hear :) Hope to see and feed you again soon :)	1416424385	535148778249273346	f	toumnyc
@DanielsMeri Hope you enjoyed it :)	1416423424	535144744587100160	f	toumnyc
We've got the tastiest lunch news for Wednesday! We're back on 47th btwn Park & Lexington! Join us for the shawarma you've been missing!	1416404180	535064028562092033	f	toumnyc
@jason_rivette Hi there, sorry for the late reply, we were on 46th today. We're there every Tuesday :)	1416368795	534915616818597888	f	toumnyc
Burrrrr it's cold! Join us in MidtownWest on 46th btwn 5th & 6th for a hot beef kabab platter. LebaneseLunch http://t.co/A8H4dobfcw	1416317829	534701846330605569	f	toumnyc
Sorry LebaneseLunchers we're off the road today. We'll see you tomorrow in MidtownWest!	1416235403	534356129133101057	f	toumnyc
Our truck is @TheSeaport but we're also catering @LinkedIn with @gofooda! Book us for your next office lunch! http://t.co/tM2MKeoqci	1415982648	533295997674586112	f	toumnyc
FalafelFriday is the best way to kick off the weekend! Join us near @TheSeaport on Fulton btwn South & Front St. for a LebaneseLunch	1415973519	533257706212450304	f	toumnyc
RT @FoodtoEat: In Dumbo, you can fill up on LebaneseFood with @ToumNYC! Preorder online for pickup: http://t.co/jIAlmLBVXc	1415897750	532939909372604416	f	toumnyc
RT @dumbolot: @ToumNYC @MexicoBlvd @mausamnyc hey hey it's Thursday!	1415891166	532912292493799424	f	toumnyc
We love @DumboNYC Thursday's! Join us on Jay & Water St until 3pm for Lebanese deliciousness! Turnip Pickles! http://t.co/H4S2vJ98Lu	1415886782	532893907382972416	f	toumnyc
RT @Foodtruckgirl7: foodtrucks r open @TheSeaport @PapayaKingTruck @ToumNYC @USAFoodTruck @gcnyc1 @mactruckny don't let the tree fool u ht...	1415817322	532602567445200897	f	toumnyc
It's Toum Wednesday's @TheSeaport on Fulton btwn South & Front St. Get a juicy makanek platter today! LebaneseLunch http://t.co/rLgcXRzN94	1415801893	532537856687095810	f	toumnyc
RT @starrettlehigh: We've had some changes to our popup food choices this week. @ToumNYC, @PitaGrillUSA & @Kalenyc1 are now joining us! htt...	1415741110	532282913359159298	f	toumnyc
Our Thanksgiving sandwich is inappropriately good. Get it at 1440 Broadway for a VERY limited time http://t.co/qy9l7d6eXb	1416601457	535891469249560576	f	mexicue
Friday, I'm in love | http://t.co/6uX0yRHDxO http://t.co/TzQU4muslT	1416586966	535830691402252288	f	mexicue
Queso: You deserve this http://t.co/1913eOqdNU	1416524739	535569691167948801	f	mexicue
Year-round Christmas colors of a Green Chili Brisket Taco NotMadAboutIt http://t.co/RTaP10eQr2	1416500367	535467467179823105	f	mexicue
Anyone else cold enough to crawl into this Smoked Chicken Burrito? http://t.co/ZOGkbiIG2x	1416430383	535173933079986176	f	mexicue
The best part of Thanksgiving is the day-after sandwich and we're serving 'em up now, on cornbread, at 1440 Broadway http://t.co/bWBt1Onnz4	1416414307	535106506178715649	f	mexicue
@NomInNY thanks for the heads up! Looking forward to having y'all through	1416414235	535106203672907776	f	mexicue
FYI TacoTuesday lasts all day http://t.co/ijqBYMiVyd	1416352987	534849309448355841	f	mexicue
@ValKatayev not yet...	1416350838	534840295964565505	f	mexicue
@BCDRestaurants BestIdea	1416345882	534819509421760513	f	mexicue
Like Jenny had to change her number after Tommy Tutone released that song, our catering team changed their digits to 516.778.MEXI (6394)	1416340353	534796320150925312	f	mexicue
Anyone else hear Savage Garden's I Want You playing when looking at these? Asking for a friend... TacoTuesday http://t.co/NcEhpTHXx5	1416328810	534747907141140480	f	mexicue
Bout that Bowl. Kale & Quinoa all day http://t.co/tBpzu5tYto	1416264451	534477965888069632	f	mexicue
Rainy days are always valid reasons for Green Chili Mac & Cheese http://t.co/VrfoyMBCpO	1416241562	534381960190513152	f	mexicue
@NomInNY always	1416073075	533675276082102272	f	mexicue
Show some love to the 'Unch of Brunch...there are chips http://t.co/d45EHbBQBD	1416067882	533653494864281600	f	mexicue
We see you, Friday night, we see you http://t.co/YOMfVBuyzf	1415997435	533358019414093824	f	mexicue
Last day at BwayBites - come do the Pumpkin Spice Margarita dance in Greeley Square  http://t.co/0YUhX0HI37	1415982368	533294821839228928	f	mexicue
Cornbread buns...so hot right now (because they have jalapeno in them) http://t.co/DABXwSmSsi	1415917738	533023745422938113	f	mexicue
The only assignment we have for you today is to eat these nachos http://t.co/sbVX8m7ihQ	1415895244	532929396169269248	f	mexicue
Yes, Saturday - Trader Joes, Sunday - 7th Ave RT @CalicoAvenger: @dubpies You planning on the Trader Joe's/7th Ave routine this weekend?	1416631052	536015599449960449	f	dubpies
RT @MissIreneM: Dear @dubpies, I am coming for the classic mince pie, then topping it off with some tomato sauce kiwistyle	1416630948	536015164085387265	f	dubpies
PieTruck is @ Park Ave & 47th St from 11am to 2.30pm. 1st 3 RTs, show server for free DUB Combo http://t.co/SHzvxXRmgm	1416578449	535794968154370048	f	dubpies
We love @rhysiedarby - don't miss him @BellHouseNY 11/28. Get your tickets here: http://t.co/mZ232Rhavv	1416513331	535521844867383297	f	dubpies
RT @LFCNY: @EdBusu Opening at 7:30. As always, @dubpies are available for the hungry.	1416492686	535435251892633601	f	dubpies
PieTruck is @ Bedford Ave & North 6th St, Williamsburg until at least midnight http://t.co/WuxFN5mFJw	1416439165	535210770108522496	f	dubpies
@CheekyMeatPies don't mention it! ;-)	1416428756	535167109308121088	f	dubpies
RT @thebarnyard: Just walked 6 blocks out-of-the-way-in-the-cold-uphill-both-ways for my @dubpies lunch. Face hurts but totally worth it. ...	1416423741	535146074814832640	f	dubpies
RT @teawiththedevil: Ok unappetizing shot but this peaches n cream pie is soo good thanks @dubpies!! :) @piewave http://t.co/Q2n2gvzCeR	1416422760	535141961041469441	f	dubpies
PieTruck is @ the corner of Varick St & King St.  Beautiful cold days need hot pies & espresso!  http://t.co/viWlZrWEql	1416414447	535107094161403905	f	dubpies
Yes indeed and if you RT earlier tweet you can get a free DUB Combo! Do it! ;-) RT @SheTHINX: @dubpies are you at @starrettlehigh today??	1416332633	534763939717218304	f	dubpies
PieTruck's @starrettlehigh until 2.30pm.  RT this, show the server, get a free DUB Combo (savory & sweet pie). 3 only!	1416331798	534760436571586560	f	dubpies
RT @australiadayla: @dubpies @vllg so you are, following now, others should Join Club & get looked after really well.	1416285861	534567765475336192	f	dubpies
. @yesglutenfree that was the Vegan Gluten-Free Shepherd's pie, next up is the Beef Gluten-Free pie. Pls RT?	1416283177	534556506046627841	f	dubpies
@australiadayla I think you'll find that we already are! ;-) cheers! http://t.co/H5XMJTupmS @vllg	1416280320	534544525331812352	f	dubpies
Mwah! RT @vllg: @dubpies really wants 110 more followers. Let's do this The Twitter! They're super nice and make great pies and coffee!	1416278911	534538615658151936	f	dubpies
RT @EverythingNYC: Manhattan from 7500 ft  @NYonAir http://t.co/7UILRTH7NI	1416277666	534533394022301696	f	dubpies
These guys are just down the road from you @CheekyMeatPies RT @zoe_630: @dubpies can you bring the pie truck to Columbus  kiwimissingpies	1416277595	534533093097746432	f	dubpies
@spinxy82 we can even ship across THAT border!  ;-)	1416276927	534530292498051073	f	dubpies
You know we ship nationwide, eh?  @zoe_630: @dubpies can you bring the pie truck to Columbus  kiwimissingpies	1416275081	534522548739125249	f	dubpies
We are on 55st and Broadway!	1416589887	535842941756260352	f	chefsamirtruck
We are on 47st between park av and Lexington av!	1416500947	535469900836663296	f	chefsamirtruck
We are on 52st and park av!	1416416143	535114204932767744	f	chefsamirtruck
We are on 36st and Broadway!	1416328264	534745613599248385	f	chefsamirtruck
We are on old slip and water st!	1416242472	534385775753039873	f	chefsamirtruck
Try our delicious beef and chicken  shawarma today!	1415984103	533302101397741569	f	chefsamirtruck
We are on 55st and Broadway!	1415984032	533301801727328256	f	chefsamirtruck
We are on 47st between park av and Lexington av!	1415896615	532935149353451520	f	chefsamirtruck
Try our Mediterranean style fajitas! ! http://t.co/cxjiw1Ijk8	1415809463	532569608218505217	f	chefsamirtruck
We are on 52st and park av!	1415809351	532569134677360640	f	chefsamirtruck
Our delicious fahitas ! http://t.co/fLUme4mHkR	1415723869	532210599930101760	f	chefsamirtruck
We are on 36st and Broadway!	1415723688	532209841159553025	f	chefsamirtruck
We are on old slip and water st!	1415639431	531856440366211073	f	chefsamirtruck
@Ahlam_Alshamsi \nFrom a Moroccan in new York, what you did about almassira just made me crie,we love you	1415402825	530864041141731328	f	chefsamirtruck
We are on 47st between park av and Lexington av!	1415292079	530399540260929536	f	chefsamirtruck
We are on 52st and park av!	1415205759	530037489042747392	f	chefsamirtruck
NYC Food Truck Lunch: Lemon Chicken From Comme Ci Comme Ca  CBS New York http://t.co/eRafR3Lmyg	1415119535	529675839210659840	f	chefsamirtruck
We are on 36st and Broadway!	1415119299	529674848847798272	f	chefsamirtruck
We are on old slip and water st!	1415033420	529314646285901825	f	chefsamirtruck
NYC Food Truck Lunch: Lemon Chicken From Comme Ci Comme Ca  CBS New York http://t.co/mjINnNhfmP	1414930340	528882297223671808	f	chefsamirtruck
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
Bessie's at LIC, 44th & Jackson. Call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always @houstonhallnyc	1416234607	534352787920801793	f	milktrucknyc
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
@awmariano Anthony sorry for your experience. Please come back to the truck Friday so we can exchange your bag for another.	1410319790	509544250934312960	f	brooklynpopcorn
RT @mikewoodsfox5: I love me some popcorn!! Hanging with John, Vicky,  and Gus. Find their delicious corn at @BrooklynPopcorn  myfoxny htt...	1408401114	501496738763374592	f	brooklynpopcorn
Happy Friday Mtbll Lovers. The Mtbll  has gotten Turkey fever and has taken extra days to spend time with... http://t.co/upOREJJMt5	1416589095	535839621620727808	f	mtblls
Happy Thursday!  The Mtbll  has stopped on 50th bet 6&7 aves. They are warming up some beef and chicken balls, so come on by say hi	1416497024	535453444849405952	f	mtblls
Well it's here day!  Closer to a warmer weekend. Still brisk out brrrr. The Mtbll  is stopped at 50th bet 6&7... http://t.co/qbleQKPpFM	1416414479	535107227334770688	f	mtblls
Good Tuesday Mtbll lovers. A big chill this week brrrrr. The Mtbll  is stopped on 50th between 6&7 aves. Come... http://t.co/LVPM7uaNc3	1416324666	534730524426633216	f	mtblls
Rainy Monday. Mtbll  will be back tomorrow. Have a great day!	1416240951	534379398435471360	f	mtblls
TGIF !!! The Mtbll  is stopped at 50th bet 6&7 aves on this brisk day. Come get your weekend fix!	1415978632	533279153135828992	f	mtblls
Happy Thursday Y'all. Kinda chilly out bit the sun is shining . Come take a stroll to 50th bet 6&7 aves for your favorite menu item.	1415892867	532919427772452865	f	mtblls
Happy  Day! Seems to be working on a nice sunny day. So why not take a walk to the Mtbll  for your favorite... http://t.co/2WgqnxlrB3	1415806342	532556515480461313	f	mtblls
The Mtbll  will honor this day. Thank a Veteran today . We will see you all tomorrow. http://t.co/hV9RyAukwt	1415716952	532181589006901249	f	mtblls
Come to 53rd & Park for your Monday porkchop fix! yum	1415628502	531810600486457344	f	biandangnyc
Good Monday Morning Mtbll Lovers!  The Mtbll  has turned and stopped at 47th bet Park & Madison. Come on by, it... http://t.co/2sOEXZ3XRw	1415633368	531831008996626433	f	mtblls
TGIF!!! Ya know what that means. Come get your weekend fix. The Mtbll  is stopped on 50th bet 6&7 aves. 	1415374532	530745372650373120	f	mtblls
Let's all wish our own Rod a very Happy Birthdaytoday I know it's a bit dreary but come say hi as he is always... http://t.co/32Rv5OcTxV	1415282412	530358994385534977	f	mtblls
Happy  Day!!! Pretty nice day for a walk. Pass by 50th bet 6&7 aves for your favorite ball. 	1415200572	530015732231192576	f	mtblls
Happy Tuesday Y'all. The Mtbll  has stopped on 50th between 6&7 aves. Come in by before or after ya vote 	1415117073	529665510862880768	f	mtblls
We apologize Mtbll Lovers. We had an all day 11 hour power outage yesterday hard to get things done. Will be back... http://t.co/8nS89MxelV	1415035793	529324599545454592	f	mtblls
HAPPY HALLOWEENcome on down to 50th bet 6&7 aves for your weekend fix and a treat!!!!	1414767079	528197529285173248	f	mtblls
Good Thursday Mtbll Lovers! The  is stopped on 50th bet 6&7 aves.  Come on by for your favorite menu item and get a treat ! 	1414681786	527839784312782850	f	mtblls
Happy  day. The Mtbll  has stopped at 50th bet 6&7 aves. Come on by for your favorite ball. Did ya try our new... http://t.co/LEdjoEyqzo	1414591506	527461123184787457	f	mtblls
Good Tuesday Mtbll Lovers!  The Mtbll  is waiting at 50th bet 6&7 aves, so come on by say hi 	1414510540	527121527616315392	f	mtblls
Happy Monday Mtbll Lovers. What a great fall day. Take a walk to 50th bet 6&7 aves for your favorite ball topped... http://t.co/xWrTmg6GVd	1414421332	526747364460359680	f	mtblls
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
RT @TalkerNewYorker: @maywildman @doughbrooklyn I ate @milktrucknyc @gooey @lobstertruckny last Sunday at Smorgasburg.  I didn't eat all da...	1416607857	535918312728043521	f	milktrucknyc
@annelibby yes. be there on sats.	1416589624	535841837362450432	f	milktrucknyc
@annelibby :)	1416589439	535841063421108224	f	milktrucknyc
RT @annelibby: @milktrucknyc oh, yay.	1416589432	535841034421669888	f	milktrucknyc
RT @tarynsaysrelax: @milktrucknyc: Bessie's at Wall & William, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always @h...	1416589427	535841013999603714	f	milktrucknyc
RT @d_grubs: Food finds at @smorgasburg @milktrucknyc and @goodbatch see the full post http://t.co/BEb8zhHOMH http://t.co/JfDgpVxp92	1416589419	535840980860420096	f	milktrucknyc
@annelibby We'll be there tmrw!	1416585326	535823809849606146	f	milktrucknyc
Bessie's at Wall & William, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always @houstonhallnyc	1416580203	535802325583937536	f	milktrucknyc
Bessie's at 53rd & Mad, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always @houstonhallnyc	1416493805	535439946664771584	f	milktrucknyc
25th & park until 3pm. so if you are cold, our classic combo will do the trick. goodforthesoultoo	1416421564	535136945337532416	f	milktrucknyc
Bessie's at 25th & Park, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always @houstonhallnyc	1416407414	535077595700662273	f	milktrucknyc
RT @marcpolitik: Every time I come to NYC I fall for a @milktrucknyc classic grilled cheese sandwich. They are THE best http://t.co/VDFqJch...	1416346244	534821031224295424	f	milktrucknyc
RT @johannagoetzel: Experts weigh in on new food biz opportunities @slowmoneynyc @milktrucknyc whatworks http://t.co/DRpYGQX4EA	1416321058	534715391072022528	f	milktrucknyc
Bessie's at @TheSeaport, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich  menu always @houstonhallnyc	1416321014	534715206295773184	f	milktrucknyc
RT @SellRock: A perfect day for @milktrucknyc ! So delicious on a crappy gray cold day! http://t.co/ooCmPRbtkv	1416245740	534399483166343170	f	milktrucknyc
hey LIC you asked, so we came to you! at 44th & Jackson. if today isn't a grilled cheese & tom soup, no day is. 6465046455 for truck.	1416240488	534377454807552000	f	milktrucknyc
RT @emelendez56: Oh, hello Brooklyn. What's that? @ramenburger and @milktrucknyc grilled cheese at @smorgasburg Bklyn Bridge Park? Don't mi...	1416184572	534142929087242240	f	milktrucknyc
RT @TalkerNewYorker: Good morning. It is hace mucho frio en Nueva York!! I will be going to Smorgasborg in Brooklyn for a few hours.@doughb...	1416165741	534063943069999104	f	milktrucknyc
RT @TalkerNewYorker: @milktrucknyc Aged cheddar, gruyere & asiago cheeses topped with fresh mozzarella and house made bread crumbs, then ba...	1416153006	534010530537963520	f	milktrucknyc
RT @FoodtoEat: Start off breakfast right but end the week well with @ETRAVAGANZA! Preorder online for quick pickup: http://t.co/H4qkDSBzz3	1416584099	535818665707700224	f	etravaganza
It's cold but the grill is sizzling! Join us for a tasty lunch or call us ahead for xxpress pick up (917) 657-0987.	1416413300	535102283022077952	f	etravaganza
Rain or shine..!!always preparing your food from scratch.join us.for a tasty and warm meal. The truck is at 52nd and Park.	1416327776	534743570423758848	f	etravaganza
RT @FoodtoEat: Enjoy your Friday Breakfast and even lunch with @ETRAVAGANZA at 52nd & Park. Preorder online for pickup: http://t.co/8yFEciy...	1415980266	533286005252829184	f	etravaganza
Hello midtown... lunch ready @11:38 and still serving breakfast.join us!!	1415896360	532934077863960576	f	etravaganza
Ahhh! Coffee...thank God for coffee!!	1415796684	532516006598832128	f	etravaganza
RT @FoodtoEat: Fill up on eggs all day every day with @ETRAVAGANZA. Preorder online for pickup: http://t.co/0xJmP2AOkB	1415289743	530389744648482816	f	etravaganza
Happy Monday..!! Our tasty lunch Menu.   Join us! The truck is located at 52nd and Park. http://t.co/ZA9WBAYm7Y	1415031212	529305385208119297	f	etravaganza
RT @Gastropunx: Mexican wrap from @etravaganza with eggs, cheese, potatoes, chorizo, and salsa.  It's getting cold.... http://t.co/q3RLZvDfDm	1414848720	528539957909262337	f	etravaganza
RT @FoodtoEat: It's Thursday, start it off right with some breakfast from @ETRAVAGANZA. Preorder online for pickup: http://t.co/xGIAvJkkxE	1414678973	527827988101230592	f	etravaganza
RT @FoodtoEat: Cloudy, Raining, doesn't matter @ETRAVAGANZA can cheer your tummy up. Preorder online for pickup: http://t.co/jlH8PZdsnm	1414076154	525299580041428992	f	etravaganza
Just a few rain drops here & there!! Join us for a warm, tasty lunch...the truck is on the usual location. East 52 & park.	1413991790	524945732307271682	f	etravaganza
@_GrantTheGreat ok! Come & get it..!!	1413903778	524576583840190464	f	etravaganza
@_GrantTheGreat Yes Please..!!	1413903534	524575560564232192	f	etravaganza
RT @officed2: Our new blog post whatsforlunch features @zuckersbagels @etravaganza @schnitznthings @seamless and @urbanspoon... http://t.c...	1413849463	524348771543838720	f	etravaganza
Hello NYC almost Friday!Start your Day with Mexican Wrap,chorizo fresco on 7 grain and more.join us breakfast is ready..!!	1413462370	522725184688885760	f	etravaganza
Good morning!delicious breakfast tacos on a gluten-free corn tortilla,chorizo  Fresco on a multigrain,Mexican breakfast wrap.. TGIF.	1412937630	520524266622976002	f	etravaganza
RT @FoodtoEat: Lunch it up with some @ETRAVAGANZA, Mexican flavors to get you through the day. Preorder online for easy pickup: http://t.c...	1412868262	520233316809998336	f	etravaganza
Rise and shine NYC!breakfast ready.The truck is in the usual location, 52nd and Park.	1412856469	520183853672321025	f	etravaganza
Check Our Delicious Fruit Plate. for you next catering or private event. http://t.co/cGd9O6iwYi	1412698809	519522578759950336	f	etravaganza
Weekend time starts with Curry King savory entree @Dumbolot great day for vindaloo	1416576164	535785385561837568	f	mausamnyc
Thursday favourite Curry King @Dumbolot savory entree N bites	1416481268	535387361878618114	f	mausamnyc
enjoy sunny day @52nd Street N 6 Ave fresh curries N bites	1416409885	535087960828301315	f	mausamnyc
sunny day curries @51 street  between Park N Madison great day for vindaloo	1416319325	534708124578361344	f	mausamnyc
spice up the day with curry king @47 street between Park N Lex mughlai great for today	1416234740	534353348271427584	f	mausamnyc
Happy Friday weekend starts with Curry King @Dumbolot delicious curries N bites great for vindaloo	1415969306	533240038335590400	f	mausamnyc
Thursday Favourite Curry King savory curries N bites great day for mughlai entree N mango lassie	1415883377	532879626222051329	f	mausamnyc
dinner @NYU west 4	1415830667	532658542881148929	f	mausamnyc
52nd N 6 Ave great day for vindaloo fresh curries N bites	1415803650	532545226238197760	f	mausamnyc
Curry King updated location lunch 55 street N broadway dinner @NYU university west 4 street	1415722586	532205217903689729	f	mausamnyc
NYU University West 4 street lunch & dinner delicious indian curry entree N bites	1415718678	532188828392370176	f	mausamnyc
Happy Monday fresh authentic curries@47 street between Park N Lex Curry King  best mobile indian cuisine	1415628734	531811574231486465	f	mausamnyc
@nyfol.org	1415481836	531195440037777408	f	mausamnyc
Saturday extravaganza Curry KING @nyfol enjoy the beauty of Brooklyn Dumbo great event can't miss	1415481345	531193378499600385	f	mausamnyc
Curry King @nyfol.org  (NY FESTIVAL OF LIGHT 2014) delivering the best authentic indian cuisine on wheels	1415389538	530808313122803712	f	mausamnyc
Friday weekend kickoff Curry King Dumbolot savory fresh curries N bites. missed yesterday due to weather enjoy today	1415369101	530722595356692480	f	mausamnyc
great day for vindaloo Curry King fresh savory Indian entree N Bites @Dumbolot	1415281749	530356212324253698	f	mausamnyc
foodtruck Wednesday continues Curry King Overpeck Park NJ  savory Indian cuisine don't miss out	1415194051	529988381887848450	f	mausamnyc
dinner @NYU University West 4 delicious indian curries & Bites	1415138394	529754938365476864	f	mausamnyc
Beautiful sunny day @Broadway between 55 & 56 street savory Curry King Lunch & bites	1415119561	529675949365678080	f	mausamnyc
Catch your dinner tonight at 86th and Lexington OR at 116th and Broadway!	1416615394	535949927260897280	f	neaexpress
RT @CrespoMax: @brandsway @NeaExpress @Terrilwhite @TimeOutNewYork thank you for having us!	1416615346	535949723459665921	f	neaexpress
RT @LeahFayeC: Thank you, thank you! @NeaExpress: Stopped by @TimeOutNewYork to feed @Terri_White's staff!  http://t.co/Fjy5avbGNE	1416602146	535894361473810432	f	neaexpress
RT @brandsway: @maxcrespo feeding @terrilwhite and the @timeoutnewyork staff some delicious @neaexpress... http://t.co/PTmcHgVxMu http://t....	1416602137	535894323024654336	f	neaexpress
RT @JJMelus: Oh my ! Stuffed after mixing @NeaExpress pizza & Nutella pie with pad Thai 	1416602135	535894313218375680	f	neaexpress
Parked out in front of 4 Plaza serving hot pizza to the @nydailynews staff! pizzaporn... http://t.co/Z3Pz4ehrgu http://t.co/WcG0OV4XIc	1416597208	535873649342185472	f	neaexpress
@LeahFayeC hope you got enough!	1416592606	535854345091571712	f	neaexpress
@Carnegro come see us again soon!	1416592565	535854176212094977	f	neaexpress
Up close and personal with our Margherita pizza! pizza pizzagram pizzaporn margheri... http://t.co/P4iQf6YRaw http://t.co/sYMiKyVXAF	1416592352	535853282514964482	f	neaexpress
The calm before the storm. Stopped by @timeoutnewyork to feed @terrilwhite and her lovel... http://t.co/lmVyZQDN6s http://t.co/1E3XUzgRNn	1416592351	535853275049123840	f	neaexpress
@PesceNic Mmm! How'd ya like it?	1416591763	535850810031476737	f	neaexpress
@Carnegro what'd ya order?	1416591566	535849986010148865	f	neaexpress
RT @PesceNic: Free personal margherita pizza from Neapolitan Express. How did they know I was carbo-loading? http://t.co/eNwYNU3KFT	1416591535	535849855919611904	f	neaexpress
RT @greenboxny: You must've known that was in our dreams last night, @NeaExpress yesplease pizzalove	1416591489	535849662813839360	f	neaexpress
RT @greenboxny: You guys are the best! Hope everyone loved it as much as they loved your delicious pizza! @NeaExpress @TimeOutNewYork @Ter...	1416591170	535848322037481473	f	neaexpress
Stopped by @TimeOutNewYork to feed @Terri_White's staff and show off our amazing @greenboxny boxes!  http://t.co/Y2Qp3SY8QF	1416591003	535847622565961728	f	neaexpress
@greenboxny let's be the first pizza brand to send one of your amazing boxes to space!	1416590864	535847040811823107	f	neaexpress
We're coming for you, @TimeOutNewYork! 	1416587105	535831274099712000	f	neaexpress
Come and get it! We got a truck on 116th and Broadway and one 86th and Lexington tonight... http://t.co/mwUb9Rs5l7 http://t.co/9mr3KO1nKo	1416530313	535593069010485249	f	neaexpress
Dinner time! We got a truck on 116 and Broadway and one on 86th and Lexington!	1416522175	535558938453102592	f	neaexpress
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
Join us 4 lunch Water st and Old Slip 11am to 3pm\nschnitzel crazy chickenshawarma yummy	1409141604	504602578026762240	f	grillonwheelsny
Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00	1409062198	504269525567934464	f	grillonwheelsny
Thanks for coming and have a great weekend!	1416599792	535884487629242368	f	polishcuisine
RT @nillobre: No better way to stay warm than with a hearty Polish lunch.  @PolishCuisine  - you are the best! @randomfoodtruck http://t.co...	1416592389	535853435883892737	f	polishcuisine
RT @randomfoodtruck: Cold weather troopers! @Chefsamirtruck @CarpeDonutNYC @VeganLunchTruck @souvlakitruck @PolishCuisine @carlssteaks	1416592375	535853376379314176	f	polishcuisine
I posted a new photo to Facebook http://t.co/X4cClqZPY4	1416586171	535827354019696640	f	polishcuisine
I posted a new photo to Facebook http://t.co/LbBr6FJpkm	1416585867	535826078871605251	f	polishcuisine
I posted a new photo to Facebook http://t.co/wFUi41iNYR	1416585505	535824562303565824	f	polishcuisine
Ready and Open on 55th & Broadway with Fresh Paczki BeatTheLine Pierogitime @randomfoodtruck	1416585457	535824362956656640	f	polishcuisine
RT @Cheap_eats: Warm that belly with @PolishCuisine: 55th & Broadway today! Happy Friday!	1416581289	535806879143038976	f	polishcuisine
55th & Broadway today! Happy Friday!	1416576509	535786830684512257	f	polishcuisine
Happy Friday on 55th & Broadway!	1416575647	535783214749859840	f	polishcuisine
Having any corporate parties or promotions? Email us: OldTraditionalPolishCuisine@yahoo.com http://t.co/P4nXKCcNj7	1416535086	535613089316876288	f	polishcuisine
Get ready for Pierogi Friday Midtown West http://t.co/y2uzywOg9c	1416533721	535607363102052354	f	polishcuisine
46th b/w 5th & 6th! Fresh Paczki Poppyseed cake yum VeggiePierogi	1416497555	535455675036762113	f	polishcuisine
46th & 6th! 46th & 6th today!	1416488692	535418498592555008	f	polishcuisine
I posted a new photo to Facebook http://t.co/IFNRhjwpSS	1416482414	535392168282959872	f	polishcuisine
I posted a new photo to Facebook http://t.co/2cmkrzJ7FN	1416482348	535391889152045057	f	polishcuisine
Having a holiday lunch? Does your company cater? Are you having a party? Contact us and we'll send you our updated catering menu!	1416455962	535281219953758209	f	polishcuisine
Get ready midtown ! Smokin hot grilled kielbasa, potato & cheese, kraut & mushroom, meat, spinach & cheese pierogi +Paczki = wow	1416447514	535245785886380032	f	polishcuisine
We are closed - thanks so much for coming! UN	1416427033	535159882497146880	f	polishcuisine
Warm up on 1st ave & 45th street today with our smokin' hot grilled kielbasa + traditional pierogi! @aetv	1416417789	535121111537975296	f	polishcuisine
Welcome Friday! We r ready 2 serve @water & Hanover sq. Try our Ramen noodle soup,rice bowl,bibimbap burrito. Stay warm with ramen soup thax	1416586585	535829090310578177	f	bobjotruck
Good morning NYC ! We r open varick and king st. Ramen noodle soup coming back!Try our Ramen soup,Rice bowl,bibimbap burrito plz comeby thx	1416500927	535469817827188736	f	bobjotruck
Good morning NYC ! We r open @47st between park and lex. Ramen noodle soup coming back Try our seasonal menu Ramen noodle soup. Thank you	1416414670	535108029159837696	f	bobjotruck
Good morning NYC ! We r open @water st and Hanover sq. Ramen noodle soup come back now! Try our seasonal menu Ramen noodle soup. Thank you	1416326674	534738946677563392	f	bobjotruck
Hello NYC we r open@46 btw 5th&6th ave. ramen noodle soup come back now! Try our seasonal menu ramen.Rice bowl,bibimbap burrito as well thx!	1416240492	534377472226512896	f	bobjotruck
Good morning ! We r ready to serve @water and Hanover sq. Try our rice burger, rice Bowl & bibimbap burritos plz come by&enjoy thank you!!	1415117255	529666274075631616	f	bobjotruck
Good morning Monday ! We are open at 46th st. Between 5th and 6th ave. try our rice burger and rice bowl bibimbap burrito.  Thank you	1415030584	529302749553639425	f	bobjotruck
Welcome Friday !! We r open at water and Hanover sq!! Plz stop by and enjoy .  We r ready to serve :) thank you!! Happy halloween	1414768627	528204023607070721	f	bobjotruck
Hello NYC ! We r open @varick and king st. Try our rice burger and rice bowl -beef,pork,chicken,veggie,tofu- bibimbap burrito. Thank you	1414685227	527854219572023296	f	bobjotruck
Hello NYC!! We r open at varick & king st. Now!! Try our eccentric food rice burger and rice bowl,bibimbap burritos , crunch veggie dumpling	1414078098	525307737308409856	f	bobjotruck
Hello NYC ! We r ready to serve @ Hanover sq. and water st. Try our unique    Rice burger and rice bowl and bibimbap burrito !! Thank you	1413904577	524579933889503233	f	bobjotruck
Hi. We r open at 47th st. Between park ave. and lex ave. !! Try our eccentric rice burger , rice bowl bibimbap burrito  plz come by thank u!	1413385991	522404826236588033	f	bobjotruck
Good morning NYC!! We r open @ water and Hanover sq.  try to our rice burger and rice bowl and bibimbap burrito , veggie dumpling . Thank u	1413300994	522048324866940928	f	bobjotruck
Welcome Friday! We r open @ 47th st between park and lex ave. try to our rice bowl , burger and bibimbap burrito ,dumpling plz come by . Thx	1412954827	520596396999970816	f	bobjotruck
Hello NYC :) we r open at water and Hanover sq. Let's try our rice bowl and burger , bibimbap burrito and veggie dumpling. Plz come by thx !	1412694319	519503743881347072	f	bobjotruck
Good morning NYC! We r open @ 46th st between 5th ave and 6th ave . Try our rice burger and rice bowl and bibimbap burrito!! Thank you 	1412608471	519143671950999552	f	bobjotruck
Hello NYC!! We r ready to serve at varick and king st. Now!! Plz come by and enjoy thank you very much!!	1412265377	517704633964568576	f	bobjotruck
Hello NYC !! We r ready to serve rice bowl rice burger and bibimbap burrito , veggie dumpling @ 47th st between park and lex ave. thank u!!!	1412177567	517336330641362944	f	bobjotruck
Hello NYC we r open @hanover sq and water st. Try our rice bowl and rice burger bibimbap burrito !! Plz stop by and enjoy thank you!!!	1412090977	516973147648970752	f	bobjotruck
Hello NYC! We r open @46th st between 5th &6th ave . Try our rice bowl and rice burger , bibimbap burrito ! Plz stop by and enjoy thank you!	1412004175	516609071752179712	f	bobjotruck
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
WALLSTREET WE ARE HERE!  TODAY WED 10/8 11:30AM -3PM\n 55 WATER ST (SIDE OF OLD SLIP) NYC\nhttp://t.co/aKlutnzu04 http://t.co/mCO0KDMnPJ	1412729555	519651537497227265	f	latinkitchennyc
Goodmorning NYC!  Today Tues 10/7 11:30am-3pm location 47st Bet Lexington & Park aves NYC\nhttp://t.co/MPHGwjSFxE http://t.co/HF9oB737sb	1412653066	519330717864833024	f	latinkitchennyc
RT @EatDrinkLucky: NYC's newest food truck boasts authentic Puerto Rican dishes. @LATINKITCHENNYC is always moving so check their twitter ...	1412363016	518114160530305024	f	latinkitchennyc
WALLSTREET WE HERE!!!! TGIF 10/3 11:30 -3PM \n55 WATER ST(SIDE OF OLD SLIP)NYC\nMI VIEJO SAN JUAN  COMING SOON BX NYC http://t.co/YvthBKnlqQ	1412347854	518050566208249856	f	latinkitchennyc
Goodmorning!! Today Thurs 10/2 11:30 pm - 3PM 47st between Lexington & Park aves NYC\nhttp://t.co/MPHGwjSFxE http://t.co/cTsfzS221l	1412262484	517692499671142400	f	latinkitchennyc
WALLSTREET WE ARE HERE! !! WED 10/1 11:30AM-3PM 55 WATER ST ( OLD SLIP ) NYC\nhttp://t.co/MPHGwjSFxE http://t.co/kuy9JJuUJn	1412176455	517331665459638272	f	latinkitchennyc
Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE PLOUGHMAN preorder 9172929226 fidi	1416582166	535810556998209536	f	fritesnmeats
Sun's peeking out on 53rd & Park come say hello!	1415372370	530736304993353729	f	biandangnyc
Hello Brooklyn, Lunch 2day @ jay & front st. Burger of the week THE PLOUGHMAN preorder 9172929226 dumbo @DUMBOFoodTrucks	1416496437	535450983740891137	f	fritesnmeats
RT @Spanish1204: @fritesnmeats Absolutely great burger today! Thanks. http://t.co/WR7n4aC95L	1416488760	535418785113858049	f	fritesnmeats
Lunch 2day @ Hudson & king. Burger of the week THE PLOUGHMAN. Preorder 9172929226 soho	1416408813	535083464610299905	f	fritesnmeats
Lunch 2day @ 10 Hanover sq b/t water & pearl st. Burger of the week THE PLOUGHMAN preorder 9172929226 fidi	1416322731	534722409170235392	f	fritesnmeats
Peeps, we are off the road today:(	1416236687	534361514598498304	f	fritesnmeats
RT @JJNYCBK: @fritesnmeats Truffle burger was outstanding. Worth the wait and the calories.	1416069283	533659370404716544	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE AO TRUFFLE BURGER. Preorder 9172929226 fidi	1415977004	533272322372026368	f	fritesnmeats
Hello Brooklyn! Lunch 2day @ jay & front st. Burger of the week THE AO TRUFFLE BURGER. Preorder 9172929226 dumbo @DUMBOFoodTrucks	1415890912	532911228503752705	f	fritesnmeats
Lunch 2day @ Hudson & king. Burger of the week THE AO TRUFFLE BURGER. Preorder 9172929226 soho	1415803844	532546037949693952	f	fritesnmeats
Peeps we are off the road today	1415719566	532192550883717120	f	fritesnmeats
Lunch 2day @ 52nd st b/t 6th & 7th av. Burger of the week THE AO TRUFFLE BURGER. Preorder 9172929226	1415630748	531820020268273664	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water & pearl st. Burger of the week THE MARITAL BLISS. Preorder 9172929226 fidi	1415371886	530734274191036416	f	fritesnmeats
RT @theliebs: Cream cheese on your burger? If it's with jalapenos & applewood-smoked bacon, the answer is yes! burgeroftheweek @fritesnmea...	1415312069	530483385853304833	f	fritesnmeats
Peeps, we are off the road today:(	1415287936	530382165528567808	f	fritesnmeats
Lunch 2day @ Hudson & king. Burger of the week THE MARITAL BLISS. Preorder 9172929226 soho	1415199930	530013041027727360	f	fritesnmeats
@nyqueenofbabble hey there. Pls follow us so we DM U or email us at feedme@fritesnmeats.com	1415122362	529687696554598401	f	fritesnmeats
Lunch 2day @ 10 Hanover sq b/t water & pearl st. Burger of the week THE MARITAL BLISS. Preorder 9172929226 FiDi	1415113300	529649687792713729	f	fritesnmeats
Lunch 2day @52nd st b/t 6th & 7th av. Burger of the week THE MARITAL BLISS. Preorder 9172929226 midtown	1415027221	529288646277750784	f	fritesnmeats
RT @DUMBOFoodTrucks: Hi @fritesnmeats! RT @becki_bec_becca: Best food truck to ever grace The streets of Dumbo. http://t.co/Tc2dCCtrHW	1414763750	528183569630654464	f	fritesnmeats
Open for lunch @TheSeaport on john & front till 3! pre order 347-669-7385 or sweetchilinyc@gmail.com and skip the line! keepwarm	1416588148	535835649124077570	f	sweetchilinyc
Catch us @TheSeaport on John st today 12-3! thaietnamese pre order 347-669-7385 or sweetchilinyc@gmail.com \nand skip the line! staywarm	1416581011	535805714288361474	f	sweetchilinyc
We are open on old slip & water serving lunch till 3! thaietnamese feedme pork chicken tofu sriracha fries yum	1416500084	535466281206833154	f	sweetchilinyc
Get your sweet heat on 11-3 old slip & water! Pre order to skip the line! Sweetchilinyc@gmail.com staywarm hotcoffee thaietnamese NYC	1416492968	535436434380169217	f	sweetchilinyc
@VeganLunchTruck what time u guys open today? ?	1416489661	535422563942666240	f	sweetchilinyc
RT @DUMBOFoodTrucks: Stay warm! RT @SweetChiliNYC: Getting chicken ready at dumbolot jay & water 1130-3! Special appearance today! http://...	1416416001	535113611031887872	f	sweetchilinyc
RT @dumbolot: Keep on truckin on with @SweetChiliNYC and @DomoTaco today!	1416413349	535102489801289728	f	sweetchilinyc
Getting chicken ready at dumbolot jay & water 1130-3! Special appearance today! Pre order to stay... http://t.co/8nL6Rlfj98	1416413023	535101119907643392	f	sweetchilinyc
Thanks! We think so too! sexyfood sexychef  the pork is blushing lol http://t.co/FvlJZQIlDT	1416350885	534840494619381760	f	sweetchilinyc
All done for today but guess what!! We are making a special appearance in DUMBO again tomorrow! @dumbolot dumbolot Yay	1416342646	534805936830160896	f	sweetchilinyc
We are serving lunch @dumbolot jay & water till 3! pre order to skip the line! Sweetchilinyc@gmail.com staywarm hotcoffee thaietnamese	1416327351	534741785353125889	f	sweetchilinyc
RT @dumbolot: Lunch at the lot today includes @carlssteaks @SweetChiliNYC and @KimchiTruck!	1416321079	534715478623911936	f	sweetchilinyc
Spread the word! 10% off your lunch purchase when you start following us on @twitter or @instagram. freefood discount NYCfoodtrucks NYC	1416315385	534691595631984640	f	sweetchilinyc
Its lunch time on 52nd & 6th till 230! Pre order to stay dry 347-669-7385 or sweetchilinyc@gmail.com FreeDelivery thaietnamese rainyday	1416241262	534380703115649024	f	sweetchilinyc
Had to change locations today, find us on 52nd & 6th 11-230! thaietnamese Midtown nyc pre order 347-669-7385 or sweetchilinyc@gmail.com	1416230141	534334057333948416	f	sweetchilinyc
we are hiring all positions! http://t.co/6MkC2OEBJx\nemail for more info! \nInfo@sweetchilinyc.com\nplease R/T! RETWEEET jobs	1416151571	534004512491462656	f	sweetchilinyc
RT @FoodtoEat: For the thaietnamese noms! @SweetChiliNYC is at Seaport Preorder online for pickup: http://t.co/gW0Z2jgzpn	1415987148	533314871082123264	f	sweetchilinyc
Pre order by emailing SweetChiliNYC@gmail.com to skip the line!\nthaietnamese lunchtime staywarm	1415985044	533306048288137217	f	sweetchilinyc
Lunch today @TheSeaport 12-3! Fulton btw south & front! thaietnamese lunchtime hungry TGIF spicy food keeps you warm!	1415982329	533294660996050944	f	sweetchilinyc
We are hiring! Line cooks, full time and part time! http://t.co/WLnIDK7797\nEmail us for details! info@sweetchilinyc.com jobs jobsearch	1415971329	533248520061718528	f	sweetchilinyc
Schnitzcart is finishing the week off on 49th street between 6th & 7th ave. 11:30-2:30pm. Stop by for lunch:)	1416582561	535812213215617024	f	schnitznthings
Hi guys! Tgif! Warm up with schnitz! Truck is on broad and Pearl from 11:30-2:30pm. Stop by or preorder 347-772/7341	1416582452	535811759253516288	f	schnitznthings
@APBindy lol we love you:) we really appreciate all your support	1416501803	535473489667686400	f	schnitznthings
RT @APBindy: @schnitznthings Getting my schnitz on is about the only thing I've got left. Fucking modern day Mother Theresa is what u guys ...	1416501782	535473402694631424	f	schnitznthings
The SchnitzCart will be on 27th between 11th & 12th from 11:30-2:30pm. We hope to see you get your schnitz on:)	1416498810	535460937613193216	f	schnitznthings
morning guys:) bit warmer today. Stop by the truck on 51st between park and madison. 11:30-2:30pm. Come for lunch or preorder 347-772-7341	1416498722	535460566262108160	f	schnitznthings
The SchnitzCart will be on 27th street & park avenue from 11:30-2:30pm. We hope to see you out for lunch:)	1416410291	535089662671728641	f	schnitznthings
Good morning guys! Beat the cold with warm schnitz! Truck on 47th between park & lex 11:30-2:30pm. Preorder 347-772-7341	1416410222	535089371234713600	f	schnitznthings
The SchnitzCart is on 55th & Broadway 11:30-2:30pm. Cure the Monday blues with schnitzel:)	1416240262	534376510384521218	f	schnitznthings
Morning guys! Beat the rain with schnitz! The truck is on 47th between park & lex 11:30-2:30pm. Come get some:) preorder 347-772-7341	1416240160	534376081877643264	f	schnitznthings
We luv you:)!RT @menghe: Still impressed the @schnitznthings truck guy takes the time to spell and pronounce my name right every time.	1416018237	533445268491218945	f	schnitznthings
Yes sir. RT @RussARMNY: @schnitznthings Are you piece of Schnitz's going to be down on Broad today ? @APBindy @juanfbustos	1415975223	533264852786376704	f	schnitznthings
Finish the week off strong with the SchnitzCart! On 49th between 6th & 7th 11:30-2:30pm. Stop by	1415973565	533257899645358080	f	schnitznthings
Morning guys! What's better than a warm schnitz a brisk cool day? NOTHING! Truck on broad and Pearl 11:30-2:30pmz preorder 347-772-7341	1415973496	533257609500176384	f	schnitznthings
@APBindy we love you all and apologize for the lack of replies!! We will be on broad and Pearl Friday:) hope to see you there:)	1415902044	532957920242434048	f	schnitznthings
SchnitzCart is on 27th between 11th & 12th 11:30-2:30pm. Stop by for lunch!	1415895581	532930809553240064	f	schnitznthings
Hi guys. Truck is on 51st between park and madison 11:30-2:30pm. Stop by and warm up with schnitz! Preorder 347-772-7341	1415895504	532930487833329664	f	schnitznthings
@APBindy we are on broad and Pearl every Friday	1415832332	532665525365923840	f	schnitznthings
The SchnitzCart is on 27th & park Ave from 11:30-2:30pm. We hope you stop by for lunch!	1415806771	532558316854345729	f	schnitznthings
Hi guys. The truck will be on 52nd between 6th & 7th 11:30-2:30pm. We're here for YA today. Stop by or preorder 347-772-7341	1415806483	532557106919243776	f	schnitznthings
In Maine we'd call this weather brisk. We'd also have a hot bowl of New England Chowder for lunch from BigRed on 46th & 6th.	1416588910	535838843115958272	f	lobstertruckny
Old Man Winter can't break our spirit because we have steaming hot Lobster Mac & Cheese on BigRed at 46th & 6th!	1416585324	535823803088379905	f	lobstertruckny
BigRed is defying this cold serving steamy hot Lobster Mac & Cheese and buttery warm CT Lobster Rolls on 46th & 6th! We're here for you NYC	1416581719	535808682546962432	f	lobstertruckny
A warm CT lobster roll is our answer to the cold! BigRed is on the corner of King & Hudson serving warm, buttery answers today!	1416495305	535446235688472576	f	lobstertruckny
@kelly_irv Guess who's on Hudson & King today? I'll give you a hint: she's a big food truck full of lobster.	1416494096	535441165903220737	f	lobstertruckny
BigRed is at a private party today and will not be on the streets of NYC. Have a great day and stay warm!	1416416210	535114486672527361	f	lobstertruckny
A warm, buttery CT lobster roll and hot clam chowder are calling you-BigRed is on Hudson bt W Houston & King! RedHookLobster	1416330948	534756873455800320	f	lobstertruckny
Lobster Mac & Cheese is our answer to this weather! BigRed is on Hudson St bt W Houston & King! ComeGetTheAnswer	1416327331	534741703148990465	f	lobstertruckny
The weath-ah feels like Maine so eat like a Main-ah! BigRed is on Hudson St between West Houston & King!	1416323872	534727195198226433	f	lobstertruckny
LIC! BigRed is the hood! We're at Hunster's Point South Park 1:00 - 4:00 w/ @HPSLiving! HPSPartyInThePark	1416078050	533696142455099392	f	lobstertruckny
Antiques and central heat, that's how we roll with a warm CT lobster roll. RedHookLobster is at the indoor @bkflea  http://t.co/NSTVaZ4ZQB	1416072628	533673400154484736	f	lobstertruckny
BigRed is in LIC today at Hunter's Point South Park with @HPSLiving 1:00 - 4:00, come join the HPSPartyInThePark!	1416066916	533649441337913344	f	lobstertruckny
Laugh at the cold with a warm lobster roll, RedHookLobster is snuggling inside at the indoor @bkflea at 1000 Dean St http://t.co/NSTVaZ4ZQB	1416061846	533628178720645122	f	lobstertruckny
BigRed will be with @HPSLiving tomorrow afternoon partying in the Hunter's Point South Park! Come join us LIC! HPSPartyInThePark	1415998867	533364023447015424	f	lobstertruckny
BigRed is on 46th & 6th Ave because a little cold isn't going to keep us from bringing you love from Red Hook!	1415984127	533302198760116224	f	lobstertruckny
@KSalty the tuscan is dairy free!	1415983981	533301586370781184	f	lobstertruckny
When it feels like Maine outside, we recommend eating like a Mainer! BigRed is on 46th & 6th serving the best RedHookLobster has to offer!	1415980513	533287040503525377	f	lobstertruckny
Protest the arctic vortex and have a lobster roll for lunch! BigRed is on 46th & 6th and ready to help the movement! DownWithWinter	1415976913	533271943672528896	f	lobstertruckny
Okay, BigRed is back on 52nd & 6th and ready to make your lunch!	1415899939	532949092226568192	f	lobstertruckny
Visit BigRed at 52nd & 6th today and enjoy a lobster roll before the polar vortexes arrive. Winter IsComing	1415897707	532939730355507200	f	lobstertruckny
@KMOquality @hdmaert great news. Come hungry!	1416620394	535970896994119680	f	waffletruck
Pagadder @ Brooklyn bridge till 8pm\nGoesting @ Bway & 66th till 10pm	1416581200	535806507909410816	f	waffletruck
CARTS\nVedette @ 60th & 5th till 8pm\nKotmadam @ Bway & 17th till 8pm\nBierbeek @ great lawn in Central Park till 8pm	1416581191	535806469103706112	f	waffletruck
TRUCKS\nKastaar @ Park Ave & 40th til 4:30pm\nMomma @ Wall Street till 4:30pm	1416581183	535806433234006017	f	waffletruck
Funky Friday!   dinges\n\nLe cafe @ 15 Ave B till 2am\nDe Wafel Cabana @ 35th & Bway open til 11pm	1416581174	535806396785500161	f	waffletruck
@technekai @med44 how's that chili on corne Wafel? dingesforeveryone. @ Wafels & Dinges http://t.co/CTQ3pSwKkg	1416542401	535643772886192128	f	waffletruck
Be an Original and book Dinges for the Holidays! - http://t.co/PA2AIYw2A0	1416529429	535589364684705792	f	waffletruck
@Leezeex3 we love that day!	1416524292	535567815932387328	f	waffletruck
@samrega @NudelmanMike @aptaube yay for the dinner!	1416524254	535567656930512896	f	waffletruck
@foodbabyny tis a good one, we feel.	1416524233	535567568862740480	f	waffletruck
RT @foodbabyny: Check out that delicious S'mores Waffle @waffletruck\n EEEEEATS wafelsanddinges @ Wafels &... http://t.co/eoefJhntQF	1416524217	535567502588530688	f	waffletruck
@blogdiva very sad face	1416524198	535567423253254144	f	waffletruck
@staceymolski thanks Your Former Majesty!	1416524147	535567209721266178	f	waffletruck
@mikejchau one of our favorites!	1416524119	535567090376511488	f	waffletruck
@CashmereBTLY preach!	1416524086	535566953856106496	f	waffletruck
@redr239 both big trucks and de cafe.	1416524076	535566912449937408	f	waffletruck
USQ Market!!! We're ready!!! dinges holidaymarket @UrbanSpaceNYC http://t.co/AQT8ebn8rv	1416511425	535513849706070019	f	waffletruck
Throwback Thursday!! Momma truck's first ticket! 2008... Many followed.... dinges throwbackthursday http://t.co/2cK3gTRgP5	1416506513	535493244113920001	f	waffletruck
Which European Country is the number one in the Top 20 Beer drinking countries? Tell us for one free dinges!! And no it's not Belgium...	1416500514	535468082777845760	f	waffletruck
Goesting @ Bway & 66th till 9pm\n\ndinges!!	1416499359	535463241687003136	f	waffletruck
Lunch today at 47th & Park!	1416587524	535833031974875139	f	korillabbq
Dinner at Columbia U! (116th & Amsterdam)	1416521690	535556902223355904	f	korillabbq
Now serving Metrotech! (Myrtle and Lawrence)	1416504795	535486041449562112	f	korillabbq
Dinner at Columbia U (116th & Amsterdam)	1416432550	535183020941389825	f	korillabbq
Open at FiDi (Front & Old Slip)	1416416053	535113831371251712	f	korillabbq
Lunch today at FiDi!	1416399662	535045080420474880	f	korillabbq
Catch us for dinner at Columbia U! (116th & Amsterdam)	1416347774	534827446282240001	f	korillabbq
Now serving Midtown (47th & Park)!	1416330026	534753005208616960	f	korillabbq
Dinner at Columbia U! (116th & Amsterdam)	1416264204	534476929169362945	f	korillabbq
No line at 47th and Park!	1416246517	534402743323348993	f	korillabbq
Midtown 47th & Park today. Rain or shine, we're here.	1416240491	534377469072384000	f	korillabbq
Apologies for the delay! Midtown lunch by 12! (47th & Park)	1415983641	533300163910336512	f	korillabbq
Dinner at Columbia U! (116th & Amsterdam)	1415916829	533019932561539072	f	korillabbq
Lunch today at Metrotech!	1415896597	532935073772093440	f	korillabbq
Dinner at Columbia U ! (116th & Amsterdam)	1415831331	532661328931205120	f	korillabbq
Now serving FiDi! Water & Old slip	1415811957	532580065125875712	f	korillabbq
Lunch today at FiDi!! (Old Slip & Water)	1415801961	532538140834422784	f	korillabbq
Catch us for lunch tomorrow at FiDi!	1415755889	532344901309308928	f	korillabbq
Now serving columbia U (116th & Amsterdam)	1415745654	532301973639684097	f	korillabbq
Now serving Columbia U (116th & Amsterdam)	1415658150	531934952909438976	f	korillabbq
Check us out this Sunday Funday @RoyalPalmsClub !! Pumped to be back 12pm-10pm	1416615701	535951215625240576	f	snowdaytruck
RT @shamekahamlet: Just heard an ad on radio about @SnowDayTruck in NYC. So inspiring what they're doing: http://t.co/tv7ZwWjgLd	1416615201	535949116464185344	f	snowdaytruck
RT @HelbraunLevey: Is This The Most Important Food Truck in America? Good read @SnowdayTruck @DriveChangeNYC https://t.co/Pp0vjzkjRm	1416593925	535859876724224001	f	snowdaytruck
RT @WorkforceInvest: Culinary arts prgm + food truck gives youth offenders way to transition into employment: http://t.co/28sNmElXve socen...	1416593918	535859851252203520	f	snowdaytruck
Eat lunch - change the city. @csiSL @starrettlehigh-601 west 26th st today from 1130-3pm. We commend @BilldeBlasio on new Rikers reform.	1416587418	535832584857858048	f	snowdaytruck
RT @hertzny: Delicable maple infused bites of @DriveChangeNYC @SnowdayTruck highlighted in https://t.co/Y8kNtysI2e  @racheltepper http://t....	1416582637	535812533484261376	f	snowdaytruck
If your in the Chelsea Area today from 11:30 to 3!. Come by the @starrettlehigh building to catch your favorite Maple Themed food truck!	1416582429	535811662922928128	f	snowdaytruck
Looking forward to lunch time @starrettlehigh @csiSL !! The yum starts at 1130	1416582224	535810799487680512	f	snowdaytruck
.@YahooFood @racheltepper @kerrydiamond Mad Mad Mad Maple Love! Thank you for sharing our story https://t.co/6L0jkAAL5o	1416581950	535809653612228608	f	snowdaytruck
When @NBC chose to share our mission we were humbled & grateful! For @yahoo.com to show us love we are honored! http://t.co/gCFgTmpr3u	1416575719	535783518182584320	f	snowdaytruck
Hey @csiSL - Check us out for lunch tomorrow @starrettlehigh LUNCH is served from  11:30-3pm ...TGI(M)F - THANK GOD IT'S MAPLE FRIDAY	1416519771	535548853962145792	f	snowdaytruck
Check us out for lunch tomorrow @starrettlehigh LUNCH is served from  11:30-3pm ...TGI(M)F - THANK GOD IT'S MAPLE FRIDAY	1416519735	535548702858182657	f	snowdaytruck
Sorry we missed you today @dumbolot @DUMBOBID we will be back next week for a pre-gobble gobble day of maple madness!	1416429870	535171782844874753	f	snowdaytruck
.@invinceabella Ann!! So sorry see you next week!	1416423267	535144086857326594	f	snowdaytruck
@Kat_Fergie @BytownBayou thank you for the intro! We should talk!	1416340915	534798676968112129	f	snowdaytruck
WE ARE SNOWDAY WE ARE @DriveChangeNYC WE STANDUP for JUSTICE & do so with MADMAPLELOVE TRUCKWITHUS http://t.co/QEw4W9lFko	1416322733	534722418758397952	f	snowdaytruck
This is what teamwork looks like. Progress not perfection. allgreenlights http://t.co/ipTRnNTYyL	1416269346	534498496359837696	f	snowdaytruck
We LOVED our tacos! Thanks to our friends & innovators @mexicoblvd - mad maple love http://t.co/j2BjvCDLux	1416269247	534498079349964801	f	snowdaytruck
Have you watched this video made about us by our community @csiTO - it's awesome. https://t.co/fasQBEgYKh	1416256224	534443459411968000	f	snowdaytruck
Excited to cater for @FastCompany tonight! Thank you for hiring us for your event! Together we truck toward a brighter tomorrow.	1416252286	534426940992921600	f	snowdaytruck
Serving dinner on Broadway at 62nd! Have a great weekend everyone!	1416607595	535917216764813312	f	papayakingtruck
The Truck and Cart are on Broadway at 58th St. and Broadway at 57th St. http://t.co/aru1hqRzZV	1416586307	535827927427198976	f	papayakingtruck
In Metrotech for food truck Thursday's! Come find us in Brooklyn	1416505038	535487060950646784	f	papayakingtruck
Truck is in @TheSeaport cart is at @HamptonInnBK, where are you eating today?	1416411043	535092815509061633	f	papayakingtruck
We are serving at the @HamptonInnBK today for their Thanksgiving food drive w @FoodBank4NYC stop by between 11a-4p http://t.co/1YwG2BR6rB	1416410718	535091450883891200	f	papayakingtruck
Escape the cold and come get a hot grilled frank with us tonight at the @RoyalPalmsClub in Gowanus; Serving at 6PM! http://t.co/QmdkH9gBUW	1416348577	534830814413201408	f	papayakingtruck
We are collecting donations for @FoodBank4NYC tomorrow with the @HamptonInnBK, stop by from 11AM - 4PM	1416343331	534808811169931266	f	papayakingtruck
Join us tomorrow at @Hampton Inn Brooklyn for a great cause!  Collecting donations for @FoodBank4NYC http://t.co/5SbnoMIMnl Thanksgiving	1416331649	534759812505284608	f	papayakingtruck
Lunchtime! Truck is on Broadway at 58th St. Cart is on Broadway at 57th St. http://t.co/oAuOlEox5n	1416329594	534751193147645953	f	papayakingtruck
Whose ready for some shuffleboard at the @RoyalPalmsClub? We are there serving franks, fries and drinks!	1416177022	534111259638382592	f	papayakingtruck
Join us at the 2nd Annual CasaLatinaExpo today at the @AltmanBuilding (135 W 18th St) serving from 11am-6pm http://t.co/irL3XsJmr7	1416066321	533646946918215681	f	papayakingtruck
Whose going to the CasaLatinaExpo at the @AltmanBuilding tomorrow? We will! Serving The nest Original Franks and Tropical Deliciousness	1415981818	533292515420831744	f	papayakingtruck
Get ready Broadway at 58th St., we are about to open up! Cart is down the block on Broadway at 57th St. http://t.co/Q7iyIjRYwE	1415981425	533290866560229376	f	papayakingtruck
We are back home in Metrotech for Food Truck Thursdays, come find us on Bridge St. http://t.co/d5Af2EJowy FoodTruck	1415893537	532922237012422656	f	papayakingtruck
RT @ArtworkbyChris: Finally got to enjoy a papayaking hotdog @TheSeaport. Thanks @PapayaKingTruck for the great lunch nyc  http://t...	1415824455	532632486875258881	f	papayakingtruck
@ArtworkbyChris @TheSeaport South St.	1415809844	532571205283614720	f	papayakingtruck
Now serving at @TheSeaport all day. Come check out their ChristmasTree while enjoying a HotDog & Tropical Drink Seaport	1415808922	532567337929830402	f	papayakingtruck
Pick up the new copy of Food Truck Magazine, and turn to page 2! http://t.co/XpFfVDM4B2	1415808823	532566922324631552	f	papayakingtruck
Come find us on 58th St & Broadway	1415724361	532212662231633920	f	papayakingtruck
Come find us down on the @TheSeaport until 2PM and then catch us back uptown later today!	1415644598	531878111164784640	f	papayakingtruck
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
RT @CityHarvest: Thanks to @shortysnyc for providing breakfast sandwiches for the staff and volunteers at our Repackathon! http://t.co/1WT...	1416578405	535794784380919808	f	shortysnyc
RT @grbme1pls: @YankeeMegs @shortysnyc the best cheesesteak! !	1416513139	535521038042677248	f	shortysnyc
food truck in the shop. poor thing is a mess.	1416503289	535479725515210752	f	shortysnyc
RT @ShortysTrivia: Oh and by the way...Our Trivia empire is expanding!! MONDAY NIGHT TRIVIA AT @shortysnyc MADISON AVENUE STARTS DECEMBER 1...	1416398466	535040062229315585	f	shortysnyc
Come in and enjoy the best Happy Hour in NYC! Monday - Friday 4pm-7pm ALL BEERS IN HOUSE ARE $4. http://t.co/EStPGxdtIQ @beermenus	1416334001	534769679429279744	f	shortysnyc
TRIVIA Tournament continues tonight at Shortys Pearl St.-- 9pm. $12 Coney Island Pitchers.	1416322247	534720376379826177	f	shortysnyc
RT @phunkykim: Did you know that @shortysnyc now has an uptown location? 88th betw 1st and  2nd? Stop by and see Ferd behind the bar. Kitc...	1416285193	534564963508301824	f	shortysnyc
RT @Nycfoodporn33: @shortysnyc has the only legit cheesesteak in the big apple!  Hit them up for the real deal. Tell em I sent you! :) http...	1416193839	534181796284735490	f	shortysnyc
Up and running at SouthStreetSeaport South and Fulton Streets Cheesesteak ChickenCheesesteak RoastPork... http://t.co/awyzKOzJqw	1415982867	533296916327448576	f	shortysnyc
Up and running at 47th and Park NYC Midtown FoodTruck NYCFoodTruck Cheesesteak ChickenCheesesteak... http://t.co/kO9EDjRCUk	1415895668	532931176382869504	f	shortysnyc
RT @StevenCirillo: Midweek decompression (at @ShortysNyc in New York, NY) https://t.co/2vRtTcFasJ	1415845280	532719833365110785	f	shortysnyc
TRIVIA TONIGHT! Shorty's Upper East. 8pm. GetPhillyWitIt	1415817130	532601763036430336	f	shortysnyc
Up and running @DumboLot Jay and Water Dumbo Brooklyn FoodTruck  Cheesesteak ChickenCheesesteak RoastPork BroccoliRabe Salads	1415810040	532572027811815424	f	shortysnyc
RT @DeliFreshThrds: @shortysnyc Wanted to share a guest post by @HBBinNYC its The 8 Stamp of Approval Sandwiches in NYC- Congrats! \nhttp:/...	1415793297	532501800134656000	f	shortysnyc
RT @hpvlovecraft: @ShortysTrivia @shortysnyc you forgot to email me the questions	1415745065	532299500422180864	f	shortysnyc
RT @ShortysTrivia: 4-week tournament starts TONIGHT 9pm @shortysnyc Pearl St. GRAND PRIZE 4 TICKETS TO KNICKS GAME ON 1/26 thanks @ConeyIsl...	1415730666	532239109637828608	f	shortysnyc
Up and running at 47th and Park NYC Midtown FoodTruck NYCFoodTruck Cheesesteak ChickenCheesesteak... http://t.co/uSoo8haT5L	1415724327	532212520610975746	f	shortysnyc
Birds.	1415678911	532022030506663937	f	shortysnyc
RT @NoelyDeezNutz: @PommesFritesNY great fries to go with @shortysnyc cheesesteak.	1415643189	531872204699734016	f	shortysnyc
RT @jessbesack: @rpgeez @MexicoBlvd 	1416611957	535935509382836225	f	mexicoblvd
Up and running at SouthStreetSeaport South and Fulton Streets til 2pm Cheesesteak ChickenCheesesteak... http://t.co/W04bkD8zCi	1415641358	531864521317437440	f	shortysnyc
Happy Friday! MSG on Hudson and Charlton today!	1416583858	535817652791697408	f	mooshugrill
We're back in SOHO!  Hudson and Charlton for lunch. mooshus mooshurito	1416579076	535797597085384707	f	mooshugrill
MSG back in FiDi on Old Slip and Water st today!	1416496471	535451128851615744	f	mooshugrill
New menu items includig soysaucechicken and orangebeef at MSG on 52nd & 6th today!	1416412261	535097926469824512	f	mooshugrill
New MSG ricebowl featuring crispyfish eggfriedrice gingerscallionslaw cucumberkimchi sauteedspinich nomsgtho http://t.co/SX8ZX1b6er	1416328181	534745269515333632	f	mooshugrill
Hey midtown... Miss us? Catch some of the new MSG menu items on 46th & 6th ave for lunch today crispyfishmooshurito nomsgtho	1416320840	534714477246443521	f	mooshugrill
MSG is back for a limited time with an upgraded menu! Check us out 47th & Park mooshurito crispyfish orangebeef nomsgtho	1416235572	534356836229853184	f	mooshugrill
.msg still taking a much needed break... :(	1413384326	522397845450915840	f	mooshugrill
MSG taking a short break to visit the doctor today! Keep it classy New York:)	1412688626	519479867730317312	f	mooshugrill
Catch our new location at @TheSeaport on Fulton between Water & South st!	1412600214	519109041210269697	f	mooshugrill
Hey GarmentDistrict! Check out MSG on 38th & Broadway today!	1412344295	518035637971451904	f	mooshugrill
Forging our own path on 47th & Park today! Find us across the street from all the hubbub	1412259537	517680139678019584	f	mooshugrill
Rainy day surprise on 45th & 6th! Come check out the new salad items in our ricebowls!	1412170932	517308499295236097	f	mooshugrill
mooshugrill on 52nd & 6th, come n get it!	1412082655	516938241321472000	f	mooshugrill
Mmmm yummy http://t.co/gU8TOAskuW	1412018350	516668524178452481	f	mooshugrill
Truck is @theseaport, front and john st.	1411998717	516586180700540928	f	mooshugrill
Cookin up mooshus on John & Front st today!	1411740699	515503971893792769	f	mooshugrill
Mmm smell that? Taiwanese BasilChicken on the grill at 47th & Park ave!	1411650895	515127309087805441	f	mooshugrill
Excited to back down at @TheSeaport today! John & Front st for all your mooshu needs	1411567434	514777247501520896	f	mooshugrill
Midtown we're back! Catch us on the corner of 45th and 6th ave for lunch today!	1411482114	514419388188196865	f	mooshugrill
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
@breadotop only open Mondays to Fridays	1416598640	535879652884348928	f	biandangnyc
53rd & Park today TGIF	1416584059	535818498023620608	f	biandangnyc
53rd and park from 11-2:30! happyfriday	1416578931	535796989754351616	f	biandangnyc
Check them out! http://t.co/wPR3R660dV	1416499513	535463885588160512	f	biandangnyc
Just be glad midtown isn't covered in 70 inches of snow... And that BianDang is on 53rd & Park! snowpocalypse	1416496678	535451994656636929	f	biandangnyc
Homemade hotchilioil with porkbelly on cold days winning on 53rd & Park	1416412422	535098601413017600	f	biandangnyc
Check them out! crispyfish http://t.co/6Yqp8Fm7vc	1416335539	534776129593573376	f	biandangnyc
Warm yourself up with a heaping bowl of BeefStew on 53rd & Park today!	1416321197	534715974663294976	f	biandangnyc
Our sister truck, Moo Shu Grill is back on the streets again! Check them out on 47th and park with a new menu!!!!	1416235817	534357863796580352	f	biandangnyc
Happy Monday! On our way to 53rd & Park to fry up some dumplings chickenlegs and porkchops for lunch!	1416235663	534357220168069120	f	biandangnyc
RT @Silverclaim: @biandangnyc Didn't know you guys changed names ;P	1416007825	533401596793987072	f	biandangnyc
Chilly days are the perfect time to try a  porkbelly rice bowl at Brian Dang! Catch one at 53rd & Park today!	1415975855	533267504056242177	f	biandangnyc
53rd and park till 2:30!	1415890893	532911149004906496	f	biandangnyc
pork belly and chicken cutlet added to our online ordering setup! eeeeeats	1415820596	532616302762815488	f	biandangnyc
Get a humpday pick me up with Bian Dang on 53rd & Park!	1415801593	532536596072259584	f	biandangnyc
53rd And park! Ready by 11:30. Here till 2:30!	1415717706	532184748907446273	f	biandangnyc
RT @TonyFisher: @_MelanieV @biandangnyc's pork belly over brown rice, pickled greens, and tea egg...food truck salute!	1415649337	531897990592880640	f	biandangnyc
@craftiechique hello	1415649327	531897946871435264	f	biandangnyc
RT @rpgeez: @jessbesack @MexicoBlvd i definitely hit up the altar this afternoon to power me through this evil aftanoon!	1416611951	535935484581904385	f	mexicoblvd
RT @rpgeez: @jessbesack @MexicoBlvd church!	1416611929	535935391690682370	f	mexicoblvd
RT @kmulvs: Casual Friday. ootd tgif @ Mexico Blvd. Taco Truck http://t.co/GkcUBkw50c	1416605906	535910131285118976	f	mexicoblvd
RT @jessbesack: I'm not religious but I go to church twice a week when the @MexicoBlvd truck comes to midtown	1416605771	535909562998849536	f	mexicoblvd
RT @angelboulgary: @MexicoBlvd Lunch is here...	1416584482	535820271610253312	f	mexicoblvd
@NormanKerft Hola Norman, we are on 46St midtown between 6&7 Ave	1416584430	535820051711262722	f	mexicoblvd
Taco Friday! Viernes de Taquiza! @MexicoBlvd midtown 46st 6&7 Ave Feliz fin de semana	1416584319	535819589763215360	f	mexicoblvd
Happy Thursday! tacos flautas tortas Muy sabroso! @MexicoBlvd @dumbolot Water&Jay	1416500072	535466230820646912	f	mexicoblvd
Hola Midtown! tacoheat tortaheat @MexicoBlvd 51st & Park	1416411347	535094092213268480	f	mexicoblvd
Good morning midtown! Warm up with our tacos @MexicoBlvd 46St between 6&7	1416325361	534733440701431809	f	mexicoblvd
RT @SnowdayTruck: We LOVED our tacos! Thanks to our friends & innovators @mexicoblvd - mad maple love http://t.co/j2BjvCDLux	1416281202	534548225064448002	f	mexicoblvd
@SnowdayTruck thanks for the love. You guys are the Best!	1416281166	534548072001703936	f	mexicoblvd
Buenos dias Dumbo! Happy Monday @MexicoBlvd Water&Jay	1416237694	534365737369235456	f	mexicoblvd
RT @dumbolot: Kicking the week off with @DomoTaco @MexicoBlvd and @ToumNYC in the lot!	1416237577	534365247101218816	f	mexicoblvd
Hola Amigos! Happy Taco Friday Midtown @MexicoBlvd 46St btw 6&7	1415980560	533287240232108032	f	mexicoblvd
RT @dumbolot: @ToumNYC @MexicoBlvd @mausamnyc hey hey it's Thursday!	1415892325	532917154895921152	f	mexicoblvd
Buenos dias Dumbo! avocado crispycheese on your TaCoS @MexicoBlvd @dumbolot Water&Jay	1415892306	532917077129326592	f	mexicoblvd
RT @mattrestivo: .@MexicoBlvd is top 3 mexican i've had in nyc, NO QUESTION. it's really tied with brooklyn taco and taqueriaLES	1415816157	532597684436492288	f	mexicoblvd
Hello Midtown! tacos salsaroja salsaverde 51st btw Park & Madison	1415805895	532554642140692481	f	mexicoblvd
Located on 50th between 6th and 7th.	1416586249	535827683754926080	f	thepocketful
Located on 49th between  6th and 7th.	1416500007	535465959776350209	f	thepocketful
On 53rd between Park & Madison	1416411223	535093570777407490	f	thepocketful
Located on. 50th, between 6th and 7th!	1416328471	534746485444063235	f	thepocketful
Located on Hudson and King streets	1416237758	534366007679520769	f	thepocketful
Located on 52nd and 6th avenue.	1415978726	533279545181605888	f	thepocketful
I guess he hasn't had his falafel fix yet in. 50th between. 6/7 http://t.co/N42ounojKN	1415897186	532937543629963264	f	thepocketful
Greetings to 53rd between Park and Madison http://t.co/T7XEOlOozt	1415809554	532569989954670592	f	thepocketful
Cops are on our tail. We r moving	1415807713	532562267028869120	f	thepocketful
Located on 50, between 6&7 avenues	1415807515	532561434312708096	f	thepocketful
Located on 50th between 6th and 7th	1415722502	532204866568200192	f	thepocketful
Beautiful day for a stroll on the Hudson. Hudson street and King street. http://t.co/MvT8SZqeLB	1415634107	531834109921079296	f	thepocketful
Sunny and brisk on 50th, between 6th and 7th	1415376471	530753507805372419	f	thepocketful
Don't let a few raindrops spoil your delicious lunch on 50th between 67, back entrance at TIME LIFE BLDG	1415287881	530381930886615040	f	thepocketful
On 50th between 6th and 7th	1415204764	530033314544238592	f	thepocketful
Located on. 50th between 6/7	1415116706	529663974053527552	f	thepocketful
Located on Hudson between King and Charlton	1415030569	529302688631382016	f	thepocketful
Located on. 49th between 6/7\nHAPPY HALLOWEEN.	1414768140	528201981660520448	f	thepocketful
We are parked on. 50th, between. 6/7	1414681761	527839682433138689	f	thepocketful
On 50th between 6/7	1414594279	527472755596611585	f	thepocketful
RT @nick_schultz: This @DelsNYC and @Gansettbeer shandy is delicious (and not even filling) http://t.co/NrhbCLNadi	1410028765	508323601901428736	f	delsnyc
We are in DUMBO @BklynBrdgPark until 4:30, then we head over to @MadSqParkNYC to serve our Flatiron fiends from 6-9pm!	1410023623	508302033628463104	f	delsnyc
RT @MadSqParkNYC: Refreshments for sale at MadSq200TASK include @Redhooklobster @souvlakitruck @DelsNYC @LaNewyorkina http://t.co/Yiwmkqw6...	1409848662	507568193733275648	f	delsnyc
RT @MadSqParkNYC: Refreshments for sale at MadSq200TASK include @Redhooklobster @souvlakitruck @DelsNYC @LaNewyorkina http://t.co/Yiwmkqw6...	1409753454	507168862279053312	f	delsnyc
What a beautiful day to end summer! Find us at our usual spot in DUMBO @BklynBrdgPark and also @FoolsGoldRecs party at 50 Kent in the Burg	1409586997	506470694054805504	f	delsnyc
Tomorrow 9/1 we will be on 50 Kent in Williamsburg at the @FoolsGoldRecs day off party! Starting at 2pm	1409510153	506148383787327488	f	delsnyc
@nickyapowell we are outside Grimaldis Pizza @BklynBrdgPark	1409510063	506148007973498880	f	delsnyc
Come spend the last weekend of summer with us @BklynBrdgPark until 7:30	1409502513	506116340512747520	f	delsnyc
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
RT @TacubaNYC: FF @DiningTraveler @mamuthainoodle @AshleyKervabon @astoriacentric @MamuThai @BronxCentric @gocircit @podcastdan @Tacononym...	1416599529	535883384984449024	f	mamuthainoodle
. @writingmiranda Sounds like a good plan! We'll save you a table! Check CL for apt. by owner/no broker fee! astoria queenshasthebestfood	1416411974	535096720724885504	f	mamuthainoodle
RT @Eater: Watch chefs read their restaurants' worst Yelp reviews  Eater Awards edition http://t.co/nKzUxTqTU1 http://t.co/xEnguiTIAi	1416411321	535093983228461056	f	mamuthainoodle
Feels like winter NYC but tastes like Thailand in our shop! Eat w/ us! 718-707-0407 we deliver. Seamless/GH astoria lunch nyc Thaifood	1416410827	535091910000791552	f	mamuthainoodle
RT @MamuThai: Warm up with us! Hot/fresh Thaifood for you! Call:(718)707-0407 for delivery! Also on Seemless/Grubhub! Astoria queens LI...	1416349573	534834991377948672	f	mamuthainoodle
Brr! We'll keep you warm @TheSeaport with HOT off the wok Thai noodles! We also brought Tom Kha soup! Come by and join us! lunch ThaiFood	1416325894	534735676508749824	f	mamuthainoodle
No truck today. :( instead, come to our shop @ 3602 36th ave in Astoria/LIC for hot hot Thai food! ThaiFood astoria LIC lunch NYC	1416240053	534375632256643073	f	mamuthainoodle
RT @austeragency: Had a blast at HPSPartyInThePark, thx to all partners and everyone who joined us! @mamuthainoodle @SweeteryNYC @milktruc...	1416088562	533740231875649538	f	mamuthainoodle
Join us today @HPSLiving @ 1pm!  HPSPartyInThePark LIC	1416063761	533636208598188032	f	mamuthainoodle
RT @TacubaNYC: FF @snowdoniapub @KaufmanArts @mamuthainoodle @MamuThai @MarsAstoriaNYC @ViaVaiNYC @AmyH_Knits @DKcentraal @LatinoFoodFest ...	1416021644	533459558577225728	f	mamuthainoodle
Oh Dumbo, we've got Tom Yum soup & Khao Soi to keep you warm. Also, super hot noodles straight off the wok! @DUMBOFoodTrucks jay&water till3	1415982669	533296084672864256	f	mamuthainoodle
RT @JVB: @mamuthainoodle @SnackFixation I'll make a pit stop to the restaurant, soon. I need that pad siew. 	1415815192	532593636014567425	f	mamuthainoodle
@SnackFixation @JVB miss you too! Since WFC stopped allowing trucks we haven't been in that area. Perhaps after winter.	1415810937	532575789905346560	f	mamuthainoodle
RT @SnackFixation: @JVB @DoughLoco @mamuthainoodle I hear ya. I've been trying to get back for a while. Their food is so good.	1415810846	532575405707116544	f	mamuthainoodle
RT @JVB: @SnackFixation @DoughLoco Awesome! Thanks. I also miss @mamuthainoodle.	1415810832	532575347079139328	f	mamuthainoodle
Thai Tuesday's @TheSeaport they're decorating the Xmas tree here today. Come join us for lunch! Happy Veterans Day. thankavet	1415721681	532201422897840128	f	mamuthainoodle
We are back @TheSeaport today! Come by for hot/fresh Thai noodles! Till 3. ThaiFood lunch seaport	1415638381	531852038104449025	f	mamuthainoodle
Saw you on tv yesterday. Great work! @SnowdayTruck @DriveChangeNYC	1415551529	531487753981399041	f	mamuthainoodle
We're back @dumbolot ! Missed you last week! Come by and get your fill of hot/fresh Thai noodles! We brought Tom yum soup @DUMBOFoodTrucks	1415374369	530744691365801984	f	mamuthainoodle
It's Thursday and we're back! Come out Thursday spot peeps!	1415292154	530399856658219008	f	mamuthainoodle
Today we are on 46 bet 5&6 Ave serving lunch from 11:30 until 3:30, we got you covered	1416497486	535455382949609472	f	schnitzi1
Today we are on 46 bet 5&6 Ave serving lunch from 11:30 until we freeze  or 3:30 whatever comes first	1416411056	535092868646731776	f	schnitzi1
Today we are on 46 bet 5&6 Ave serving lunch from 11:30 until 3:30, soup, chicken what more do you need	1416322341	534720773521670145	f	schnitzi1
Today we are on Hanover Sq serving warm soup and lunch from 11:30 until 3:30 order pickup @www.schnitzi.com	1416238984	534371146310098944	f	schnitzi1
Soup soup soup, it's getting cold and we have the perfect medicine, chicken noodle soup, right here @46 bet 5&6 Ave from 11:30 until 3:30	1415891986	532915732850671616	f	schnitzi1
Today we are on 46st bet 5&6 Ave serving lunch from 11:30 until 3:30 see you soon	1415806779	532558350790447104	f	schnitzi1
Although it's veteran day we are here on 46 bet 5&6 Ave serving lunch from 11:30 until 3:30, If you are watching the parade you can stop by	1415718589	532188454248263680	f	schnitzi1
we are on Hanover Sq,  they blocked the street for movie shooting so they might kick us out earlier, we will start serving lunch @11-3pm	1415631867	531824713736413184	f	schnitzi1
We got some schnitzels and chicken noodle soup for you and don't forget to tell Yair happy birthday @46 bet 5&6 Ave from 11:30 until 3:30	1415287334	530379637357285376	f	schnitzi1
Today we are squeezed right next to moshe falafel on 46 & 6 serving lunch from 11:30 until 3:30 http://t.co/b7l8kpN53U	1415199192	530009944318562304	f	schnitzi1
It's election day, so what are we going to have, a Spanish schnitzel or French schnitzel we will be  @46 bet 5&6 Ave from 11:30 until 3:30	1415113972	529652504959930368	f	schnitzi1
Today November 3 we are on Hanover Sq serving lunch from 11:30 until 3:30 we know Mondays are hard so let us make it easier for you	1415028397	529293578603098112	f	schnitzi1
@theduckmanz we will on Monday	1414680307	527833582656819200	f	schnitzi1
It's getting cold out here so grab your warm Schnitzi sandwich on 46 bet 5&6 Ave from 11:30 until 3:30	1414679457	527830016391131137	f	schnitzi1
They are saying it's going to rain at three, so make sure you come before to get your Schnitzi, at 46st bet 5&6 Ave from 11:30-3:30	1414592539	527465458774310914	f	schnitzi1
What a day for a Schnitzi, today we are on 46st bet 5&6 Ave, lunch will start @11:30 until 3:30, If we won't see you all, just enjoy the day	1414504927	527097986611167232	f	schnitzi1
Today schnitzi truck is on Hanover Sq in the financial district serving lunch from 11:30 until 3:30 see you soon	1414421075	526746284905226242	f	schnitzi1
Today October 23 we are on 46 St bet 5&6 order online and don't wait in the rain	1414074502	525292651944611840	f	schnitzi1
RT @CarismaPrinting: Love shots like this! Carisma is dominating NYC!!! Check out our work on @EddiesPizzaNY, @Schnitzi1 @hibachiheaven htt...	1413988065	524930111070810112	f	schnitzi1
Today October 22 we are on 46 St bet 5&6 Ave serving lunch from 11:30 until 3:30 if you are worried about the rain you can order online	1413988043	524930019257511937	f	schnitzi1
Beautiful night to enjoy a fresh cinnamon sugar cider donut..Doesn't that make your mouth water by just reading it? :) BOOTH A6, Bryant park	1416607553	535917036661399552	f	carpedonutnyc
Goodmorning the kiosk located inside Bryant park and 40 street is now open stop by for some hot coco and cider donuts !	1416574908	535780116430065664	f	carpedonutnyc
Good morning NEW YORK!!! Truck open at 55th street and Broadway. COME!!!!	1416570548	535761827960201216	f	carpedonutnyc
Good morning NEW YORK!!! Truck open at 55th street and Broadway.COME!!!!	1416570497	535761612352012291	f	carpedonutnyc
Good morning New York! Truck open at 51st street and Park ave. COME!!!!	1416483286	535395824759746560	f	carpedonutnyc
Good morning NYC, we're open in Bryant park wintervillage booth A6! FRESH DONUTS :) 40th and 6th ave.	1416405258	535068553037479936	f	carpedonutnyc
Truck open at 23rd street and park ave south.come!!	1416397825	535037374045376512	f	carpedonutnyc
RT @iamsprung: its NationalAppleCiderDay! i prefer mine in donut form-Apple Cider Donut from @CarpeDonutNYC http://t.co/PEGVMC5vjB http:/...	1416327181	534741071646187520	f	carpedonutnyc
@Stud3nt2dagame near the entrance of the skating rink	1416318230	534703530683408384	f	carpedonutnyc
@Stud3nt2dagame everyday until jan 4th.	1416318159	534703233135296512	f	carpedonutnyc
Good morning NYC, beat the cold by eating a fresh HOT cider donut and some tasty HOT coffee. Stop by booth A6 in Bryant park wintervillage	1416318140	534703152021635072	f	carpedonutnyc
RT @_fabiopetry: @CarpeDonutNYC I found you!! The best donut I've ever eaten!! Seriously!	1416314811	534689191620526080	f	carpedonutnyc
@alexandrapmack yes, can you send your info to info@carpedonutnyc.com	1416314806	534689166874128384	f	carpedonutnyc
Truck open at west 4th street NYU.COME!!!	1416232172	534342577412390912	f	carpedonutnyc
Good morning kiosk located inside Bryant park 40 street is now open stop by	1416229513	534331423906611200	f	carpedonutnyc
Good morning the kiosk located inside Bryant park and 40 street is open stop bye !	1416146621	533983750271799296	f	carpedonutnyc
Truck open at Bergen and court street.come!!	1416142096	533964768684830720	f	carpedonutnyc
Happy Saturday\n The kiosk located inside Bryant park and 40 street is now one come by !	1416060202	533621281175117824	f	carpedonutnyc
Fresh Donuts into the night!! Come by our Bryant park booth A6! 40th and 6th ave WinterVillage	1416010442	533412571987320833	f	carpedonutnyc
@carlssteaks I didn't even have time to photograph the sandwich, it was too delicious... Thanks guys!	1415996247	533353034160820227	f	carpedonutnyc
We are with fooda today @Starrett-Lehigh serving lunch special Arepa+Salad + Sweet plantains + Dessert arequipe con queso :) yummmm	1416500332	535467319024439296	f	palenquefood
Palenque crew @ Northen Teritory! Yeahh http://t.co/vPN4ewzvM4	1416111792	533837666102423552	f	palenquefood
Our  beautiful palenqueras @ Northen Territory celebrating a gods season :) http://t.co/vC4QDzey4f	1416105359	533810685898403840	f	palenquefood
Yo guys! broadwaybites is going to be done today by 9 pm. Hurry up! we promise you a supertasting good bye. Thanks for the love @UrbanSpace	1415991442	533332881163419648	f	palenquefood
Our first quinoa arepas delivery!\nWho wants to order? :) http://t.co/BGhKTrxZUE	1415891969	532915662482866176	f	palenquefood
Broadwaybites is ending on Friday guys! We invite you to come and taste our tasty food. 34th &Broadway,Colombian arepas are waiting for you	1415808963	532567508126277632	f	palenquefood
RT @NumberOneAndre: I've eaten @Palenquefood twice this week. So tasty. Plus agua de panela. Colombia in nyc	1415804047	532546891876024320	f	palenquefood
Ok last week guys ! Don't forget to come and get your Colombian arepa glutenfree here at @UrbanSpaceNYC	1415724376	532212725896974338	f	palenquefood
30 more minutes for you to get a jumbo shrimp arepa here at @UrbanSpaceNYC	1415669143	531981062537478145	f	palenquefood
RT @Beauty_Twist: Job finished early, got a MASSIVE arepa from  @palenquefood, things are good!  http://t.co/bWPUWuMCDd	1415322635	530527699727446016	f	palenquefood
Platefuls of Palenque at broadwaybites. 33rd st & Broadway. Home made arepas with your choice of Oaxaca cheese,chicken,beef,shrimp & more!	1415205432	530036115181686786	f	palenquefood
Today it's a beautiful day come to @UrbanSpaceNYC and get yourself a chorizo arepa !	1415120662	529680564325195776	f	palenquefood
Beautiful day, @UrbanSpaceNYC broadway bites. Delicious arepas with organic toppings! Hot Aguade panela, yuca fries and more!33st & Broadway	1414682138	527841261244665857	f	palenquefood
RT @emilyvt4: Heads up for midtown gf folks RT @gfreefun: @Palenquefood has glutenfree empanadas!!! Made from yuca @ Broadway Bites by @...	1414601659	527503708028796928	f	palenquefood
Phenomenal AREPAS!!! Come have Home made Colombian food @Palenquefood	1414432300	526793364696743936	f	palenquefood
No matter the rain we still here with the best arepas in town @UrbanSpaceNYC	1414081227	525320859666632705	f	palenquefood
No more rain, come to have a delicious & nutritious arepas and hot agua de panela @UrbanSpaceNYC @BroadwayBites 33 st & broadway until 9pm	1414005619	525003737866440705	f	palenquefood
come have amazing AREPAS and home made Colombian food at@Palenquefood at @UrbanSpaceNYC @heraldsquare. Rain or shine :)	1413473454	522771674698366977	f	palenquefood
Hey there! Palenque is ready for you at your favorite spot. Come over and have the best Colombian lunch at the 33rd st, herald square.	1413390164	522422330736541698	f	palenquefood
Come have delicious and nutritious home made Colombian food with the best team :) @UrbanSpaceNYC @GarmentDstrctNY http://t.co/I2h0xADu9K	1412867361	520229535074484225	f	palenquefood
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
SCREAM IT FROM ROOFOPS IT'S CHEESESTEAK FRIDAY! 55TH ST & BWAY @randomfoodtruck @VICTORIASSECRET @DEFJAMRECORDS @YRNY @BADBOYRECORDS @UBS	1416583674	535816884160303104	f	carlssteaks
Showin lower manhattan 2X THE LOVE!!\nBIG CARL @TheSeaport ice skating also!!\nLIL CARL 10 HANOVER SQ & WATER ST TIL330 \nCHEESESTEAKS FOR ALL	1416499615	535464312606056449	f	carlssteaks
Happy Hump day 47th st & Park Av @nfl @MLB @UBS @SiriusXMNFL @jimmyfallon PERFECT CHEESESTEAK WEATHER! ALSO CHICKEN & DUMPLINGS SOUP!!	1416412058	535097071741972481	f	carlssteaks
RT @BeeDeedles: @carlssteaks FABULOUS NEWS!!! thanks for the response. Your cheesesteaks are the BEST (outside of Philly). ;o) cheesesteaks	1416326180	534736873135292418	f	carlssteaks
@BeeDeedles sorry technical issues we will be back next Monday	1416323476	534725533402419200	f	carlssteaks
RT @dumbolot: Lunch at the lot today includes @carlssteaks @SweetChiliNYC and @KimchiTruck!	1416322541	534721612537671681	f	carlssteaks
@CarpeDonutNYC thanks from the crerw @carlssteaks for NYC 1 Donuts simply the best!!! http://t.co/fqlDgCTH36	1415989411	533324363052097536	f	carlssteaks
Scream from rooftops its CHEESESTEAK FRIDAY Bdwy &55th @randomfoodtruck @VictoriasSecret @DefJamRecords @Barclay @YRNY \nCall 917 597 4313	1415979157	533281354822475776	f	carlssteaks
Hey folks back @TheSeaport ON Fulton and South st till 5 nice autumn\nday for a Carl's famous Cheesesteak  GOT WHIZ? PREORDER  917 597 4313	1415894909	532927994017640448	f	carlssteaks
Sorry @mlb @UBS @SIRIUSXM @SiriusXMNFL @jimmyfallon can't forget you guys	1415807749	532562416551612417	f	carlssteaks
Carl's Steaks on Twitter: Wednesday=47th st & Park @MLB@UBS @SIRIUSXM@SiriusXMNFL@jimmyfallon... http://t.co/bnrUjoMXN0	1415807722	532562305062817792	f	carlssteaks
Wednesday=47th st & Park @MLB@UBS @SIRIUSXM@SiriusXMNFL@jimmyfallon @nfl last day before Vortex returns so grab a Carl's famous Cheesesteak	1415807653	532562015936458752	f	carlssteaks
Showin 2X CHEESESTEAK LOVE TODAY FOLKS!!\nBIG Carl @dumbolot Brooklyn Jay st & water St \nLIL Carl @TheSeaport \nWE GOT YOU COVERED GOT WHIZ?	1415726941	532223483896668160	f	carlssteaks
Showin 2X CHEESESTEAK LOVE TODAY FOLKS!!\nBIG Carl @dumbolot Brooklyn Jay st & water St \nLIL Carl @ seaport \nWE GOT YOU COVERED GOT WHIZ?	1415726889	532223267890003968	f	carlssteaks
Mondays are ALWAYS better w a Carl's famous Cheesesteak @WSoHotrucks HUDSON ST & KING ST TILL 3 30 GOT WHIZ? baconcheesefries	1415636027	531842164838662144	f	carlssteaks
Another great fall day in NYC\nhanging in meatpacking district today Apple store W14th/9th Av grab a Carl's famous Cheesesteak GOT WHIZ?	1415552745	531492854087294976	f	carlssteaks
Awesome fall day @prospect_park parade grounds, football games, soccergames & Carl's famous Cheesesteak now THAt... http://t.co/X3MVhEtjEQ	1415462949	531116219865509888	f	carlssteaks
Awesome fall day @prospect_park parade grounds, football games, soccergames & Carl's famous Cheesesteak now THAt S HOW IT'S DONE! GOT WHIZ?	1415462903	531116027091124224	f	carlssteaks
SCREAM IT FROM ROOFTOPS ITS CHEESESTEAK FRIDAY! 55TH & BDWY TILL 3 30 @RANDOMFOODTRUCK @VICTORIASSECRET @DEFJAMRECORDS @YRNY @BADBOYRECORDS	1415372954	530738755565789184	f	carlssteaks
Finally parked folks corner of Hudson & Charlton st till 3 30 cheesesteaks perfect medicine for a rainy day! GOT WHIZ?	1415295405	530413490817994752	f	carlssteaks
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
RT @FlavorPlease: @mactruckny Dom! Where are you at this week? We have a few days in NYC & you know mactruckny is one of our must eats :)	1414182779	525746800582750208	f	mactruckny
Good morning seaport!! Fulton and south st. 12-3	1414163894	525667591873126400	f	mactruckny
RT @JustJerseyFest: @mactruckny Crispy Mac Bites, Spicy Mayo and Grated Parm come to the Just Jersey Jazz & Food Truck Fest 10/19 JJJFTF h...	1413637050	523457845917126656	f	mactruckny
Good morning seaport, fulton and south st. 12-3	1413558930	523130184846024705	f	mactruckny
Good morning seaport. Fulton and south st. 12-3	1413385053	522400892705054720	f	mactruckny
RT @JustJerseyFest: @mactruckny Yummy Mac & Cheese can be found at The Jazz & Food Truck Fest 10/19 Horseshoe Lake Succasunna JJJFTF http:...	1413228624	521744782981619712	f	mactruckny
@AnikiTony @NY_Comic_Con thanks dude! Let us know the next event you're going to and we'll try to be there as well!	1413226210	521734657306787841	f	mactruckny
RT @AnikiTony: @mactruckny thanks for proving I can live on Mac and cheese for four days. Thanks for making @NY_Comic_Con delicious	1413226164	521734465912311808	f	mactruckny
RT @startreksuther1: Enjoyed a piping hot cup of buffalo chicken mac and cheese!  Incredible!  @mactruckny http://t.co/K8LCgKZhBx	1413226135	521734342008401920	f	mactruckny
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
http://t.co/8I6vGTbADC Thanks @NicoleScherzy Twerking for funbuns !!!	1412308795	517886742234689537	f	funbunsnyc
http://t.co/hxCpWc8UpM	1412263330	517696047498285056	f	funbunsnyc
Braised pork belly topped with relish green,  sugar peanuts,  and cilantro. Over rice or on a bun at 50th st between 6 /7 ave midtown lunch	1412263288	517695872050933760	f	funbunsnyc
Nauti is off the road today and tomorrow getting some winter repairs! back at the DUMBO lot Friday	1416415619	535112008249917440	f	nautimobile
Help us show winter we ain't afraid. We got pipin' hot lobster grilled cheese and clam chowder here at 17th and 5th	1416321519	534717324432261120	f	nautimobile
Thanks for all your cat pictures today!We thought we would give back, here is Lenny bringing you some holiday cheer. http://t.co/KCWHs40fww	1416165304	534062111904002050	f	nautimobile
@jennybazinga !!! 	1416159840	534039195535544321	f	nautimobile
@babiikimx so precious !	1416159807	534039056465014784	f	nautimobile
Welp, so far @TheSteelCart is winning most handsome cat.. Keep those cat pics coming plz http://t.co/KfmkHNcLEA	1416158908	534035283671805952	f	nautimobile
@ayyymikewaskom time to give in and get a real one buddy	1416157667	534030081422012417	f	nautimobile
@thecowies so stoic, so beautiful.	1416157618	534029875800457217	f	nautimobile
Tweet us a picture of your cat. Seriously.. We will be waiting for them at 67th and Broadway (also serving Lobster Rolls)	1416156417	534024837983764480	f	nautimobile
Back at 17th and 5th for you shopping folk. The holidays are coming up, and it is important little Jamie gets his TurboMan doll	1416068803	533657358631964673	f	nautimobile
Party in the DUMBO lot at jay and water st! Here until 3	1415985428	533307656824717312	f	nautimobile
Manhattan is getting it's first Cat Cafe, where you can get a hot coffee.. and.. pet a cat? Congratulations NYC, you've done it. 17th & 5th	1415893605	532922524380966912	f	nautimobile
@paris_odessa thanks for the review! Glad you liked it 	1415819859	532613210529337344	f	nautimobile
Workin on our Movember facial hair at 23rd and Park.	1415811148	532576675780120576	f	nautimobile
17th and 5th now! Little bit of a late open, we had some technical adversity to triumph over.	1415723718	532209967450042369	f	nautimobile
@colstercol weekdays 11-3 for lunch. You can always check out our brick and mortar locations. http://t.co/JqDItyhoya has all the info!	1415574540	531584269253373952	f	nautimobile
67th and Broadway on this particularly beautiful fall Sunday.	1415562826	531535136345825280	f	nautimobile
Hey you big DUMBOs, we're in DUMBO at the DUMBO food lot on Jay & Water st. Don't be a dingus, and come down here. 11-3pm	1415378207	530760786579574784	f	nautimobile
@Helibobs84 dumbo food lot in bk?	1415377620	530758324309209089	f	nautimobile
We are at 17th and 5th now! Humans are waterproof!	1415289370	530388179938205696	f	nautimobile
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
RT @Foodtruckgirl7: @PontiRossiFood guess the diet starts Tuesday pasta bolognese italianfood sauce sauces nycfoodtruck NYCfoodtruck...	1411996951	516578772649521153	f	pontirossifood
Today we are offering a taste of our homemade focaccia pugliese for anyone  who places any order! Yummy 	1411994995	516570568230203392	f	pontirossifood
@Foodtruckgirl7 woohoo baby ponti is waiting for you  come get your coffee  and celebrate with us 	1411994884	516570102419161088	f	pontirossifood
RT @Foodtruckgirl7: @PontiRossiFood I have to find you today! Happy national coffee day  . Head out to @PontiRossiFood pasta foodtruc...	1411994760	516569582497464320	f	pontirossifood
@nycfoodtruck you guys forgot about us. Mumble mumble 	1411994264	516567501875191808	f	pontirossifood
Happy friday @midtownlunch we are on 46th between 5th & 6th today. Beet the cold and get ur yumyum on today	1415982777	533296538727239680	f	hibachiheaven
@midtownlunch today we are on 47th and park. Its a beautiful day get ur yumyum on today	1415804206	532547557663453185	f	hibachiheaven
We are on 46th between 5th & 6th today   @midtownlunch get ur yumyum	1414512540	527129918824804352	f	hibachiheaven
@hibachiheaven: Whats up NYC we are on water and old slip today. Come down and get ur ginger on @downtownlunch	1414426340	526768367253073920	f	hibachiheaven
Happy Friday!! Today we are on 46th and 6th!	1414161636	525658119595384832	f	hibachiheaven
RT @HashtagSCBE: MeatlessMonday With @HibachiHeaven   http://t.co/AGr1gjz9A4 SCBE	1414119948	525483266120634369	f	hibachiheaven
RT @HashtagSCBE: Check out http://t.co/mPeetn1AAw for your foodie fix. http://t.co/Wo1NLqurWE	1414107207	525429827843923968	f	hibachiheaven
Hey, come get your yumyum while there's no lines!  We're hot and ready to serve.  hibachiheavenNYC	1414080240	525316719137796097	f	hibachiheaven
midtown. Come get warm with some hot HIBACHIHEAVENNYC, find us at 33rd/Park and 47th/Park for some yumyum	1414075107	525295188659695616	f	hibachiheaven
RT @Valmehong: @hibachiheaven Hi food lovers,could you please share this survey about improving trucks finding?Thank you very much! http://...	1414035701	525129909908537344	f	hibachiheaven
@mpooz44 We'll be at 47th and Park tomorrow.  Come and see us rain or shine!	1414035611	525129533616586752	f	hibachiheaven
update no trucks will be out today due to weather conditions! We apologize for the inconvenience!	1413992434	524948436077281280	f	hibachiheaven
RT @CarismaPrinting: Love shots like this! Carisma is dominating NYC!!! Check out our work on @EddiesPizzaNY, @Schnitzi1 @hibachiheaven htt...	1413986128	524921983042355201	f	hibachiheaven
RT @HashtagSCBE: MeatlessMonday With @HibachiHeaven   http://t.co/AGr1gjz9A4 SCBE	1413954582	524789670551773184	f	hibachiheaven
RT @gorgusdesi: @hibachiheaven &lt;3 thebest	1413929146	524682983979356161	f	hibachiheaven
White sauce, Pink, Orange even Garlic chacha sauce.  It all comes down to one thing! yumyum Come get you some!  hibachiheavenNYC	1413910169	524603391428026368	f	hibachiheaven
Midtown flatiron We're open!  Hot and ready to go.  Come get your yumyum hibachiheavenNYC. At the corner of 25th/Park and 46th/6th Ave	1413906407	524587610061414400	f	hibachiheaven
Location Update: we will ALSO be on 25 And Park as well! hibachiheavenNYC	1413901317	524566262555611136	f	hibachiheaven
midtown we will be on 46th and 6th today! StayTuned for more location updates! hibachiheavenNYC	1413894294	524536807116247040	f	hibachiheaven
SCBE and hibachiheavenNYC collab! Featuring @HibachiJoe's YumYum & Ginger Soy Sauces! @hashtagSCBE \nhttp://t.co/S2DvCT3CYq foodbloggers	1413837834	524299993318817792	f	hibachiheaven
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
4-7pm 18th st & 7th ave!!!	1416430803	535175693479739395	f	thetreatstruck
Beautiful day!!! FIDI today Front St and Old Slip slinging your favorite Tacos, Sliders, Burritos and Rice Bowls comegetsome	1401807479	473841028777009153	f	mikenwillies
Beautiful Day at Liberty State Park for vcpoloclassic @veuveclicquot   http://t.co/PYueUEw7XW http://t.co/Mr6xw2Vs8v	1401546007	472744336728535040	f	mikenwillies
RT @asphaltpunk: Big Bad Brisket and Lil Piggies from @mikenwillies - had to sneak out of BEA14 for these yummy sliders! http://t.co/vvW1W...	1401471595	472432229122322432	f	mikenwillies
RT @randomfoodtruck: Lunch at the office from @Chefsamirtruck @souvlakitruck @carlssteaks @CarpeDonutNYC @funbunsnyc and at Javits from @mi...	1401471548	472432032249704448	f	mikenwillies
RT @Sweet_Taters: Grab your Sweet Potato Shroom Taco at @mikenwillies at the @javitscenter today! Tweet a pic & you could win a $100 GC sw...	1401395649	472113686904340482	f	mikenwillies
We're at the @javitscenter today for the  @BookExpoAmerica with your favorites characters BigbadBrisket lilPiggie Pea-Nocchio	1401374548	472025186091278336	f	mikenwillies
RT @GovIslandFood: Only 2 more days till we are back @Gov_Island with @SweetChiliNYC, @DiSOSNYC, @carlssteaks, @Getstuffednow, @MayhemAndSt...	1401368180	471998474871767040	f	mikenwillies
Thinking of those that have made the ultimate sacrifice for our country on this Memorial Day.  Thank you to all... http://t.co/gMrpRYtn7v	1401117086	470945310189957121	f	mikenwillies
Best chicken tenders.  Ever.  Fried up on front and john st today at south street seaport.  Playing Christmas music because bubba is festive	1416586030	535826762627035136	f	usafoodtruck
Hey y'all.  We're at south street seaport.  We'll be here from 11-5 with the best chicken tenders you've ever had!  Front and John St nyc	1416499902	535465518606454784	f	usafoodtruck
South street seaports the move today for lunch or dinner. Get ya a winner winner from 11-5 at Fulton and south st.  nyc friedchicken	1416327803	534743681983860736	f	usafoodtruck
RT @Lisa_Carolina: The XMasTree is ready. The IceSkating Rink is up. Who's Ready for the Holidays @theseaport... http://t.co/j440j5OerW	1416318658	534705326793433088	f	usafoodtruck
@Foodtruckgirl7 @StreetGrubSteve @TheSeaport I agree! That's why we're here 7 days a week :)	1416318639	534705244916420608	f	usafoodtruck
@JD_2020s_mole glad you enjoyed it	1416239988	534375360516087808	f	usafoodtruck
@Hardisk thank you so much.  It's been a long night haha.	1416219078	534287656696705024	f	usafoodtruck
This is Josh I'm doing an AMA on reddit.	1416204766	534227628224684032	f	usafoodtruck
Good morning.  South street seaport has the ice skating rink opening today, come skate and grab some chicken tenders.  Fulton and water st	1416067924	533653672031690752	f	usafoodtruck
RT @BuzzFeedNews: The @EmpireStateBldg lit up tonight in red, white and blue in honor of Veterans Day http://t.co/im91y7jfsh	1415778065	532437912634552320	f	usafoodtruck
@StreetGrubSteve hey Steve.  Gotta make it down to South Street Seaport.  We've got 6 trucks there daily.  NYC's best chicken tender here.	1415397643	530842308259094528	f	usafoodtruck
Hello peeps.  We're off the road today, but we'll be back tomorrow!	1415291744	530398134883876864	f	usafoodtruck
RT @TheSeaport: The Seaport Ice Rink will be back on Fulton Street this November! More details here: http://t.co/W0fsiZMVEi. http://t.co/Ag...	1415245682	530204939461488640	f	usafoodtruck
@GovBallNYC come down to the south street seaport to see our food which would be the perfect compliment to the rowdy good time @GovBallNYC	1415114824	529656078712446978	f	usafoodtruck
@GovBallNYC we wanna bring NYC's best food truck therrrrrrre	1415079094	529506216318615552	f	usafoodtruck
This beautiful puppy could barely wait to enjoy some Yankee Doodle dandy's.  The choice of NYC dogs.  nyc chicken http://t.co/5rTIiEhFa8	1414701026	527920482717532160	f	usafoodtruck
Downtown---south street seaport at Fulton and water st.\nWe got the best chicken tenders you'll ever have.	1414683717	527847887234154496	f	usafoodtruck
This is fried chicken weather right here.  Will fill you up and warm your bones.  Come and get it at south st and Fulton st.  Yessir.	1414075635	525297402652397568	f	usafoodtruck
We are off the streets today my fellow patriots.	1413986710	524924424508960768	f	usafoodtruck
Good morning everybody!  Lunch today at south street seaport is the move.  We're at Fulton and south st we'll be here all day.	1413817296	524213850544279552	f	usafoodtruck
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
Herros. Nyc Today is our last day @GarmentDstrctNY. It's been breezy. Stay true and you Midtown! Thankyou @UrbanSpaceNYC your just my type.	1413567546	523166325490089984	f	toastmonsternyc
@ROBatGraveShift Rawr.	1413435524	522612583422238720	f	toastmonsternyc
RT @herdkillingrec: @toastmonsternyc rawrs through Times Square. Get your sammies! toastmonster http://t.co/qqJp1O28cC	1413323044	522140806803898368	f	toastmonsternyc
Last week to catch Toast Monster @GarmentDstrctNY @UrbanSpaceNYC.	1413306825	522072780746276866	f	toastmonsternyc
For this weekend. Purchase any sandwich for a chance to win a digital blue. Search inside your box under wax paper!!	1413144866	521393478400757761	f	toastmonsternyc
Come visit us @GarmentDstrctNY @UrbanSpaceNYC to try out our sammiches made by our new cook. Rawr! http://t.co/miMdh1yB7c	1413134144	521348504242110464	f	toastmonsternyc
For today only, purchase any sammich for chance to win a digital blue ticket. @GarmentDstrctNY @UrbanSpaceNYC	1413048871	520990845181644800	f	toastmonsternyc
RT @GarmentDstrctNY: Taking on the @toastmonsternyc  today! Mac & Cheese w/Sloppy Joe and Chicken Pizzaiola. http://t.co/aD1azyhVgB	1412963075	520630988297498624	f	toastmonsternyc
Herros New York. Two digital blue tickets are roaming in two Toast Monster meal boxes. Check inside your brown box, under the wax paper!	1412961330	520623668960198657	f	toastmonsternyc
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
Pooh bear likes more than honey! cheesesteaks MMM http://t.co/yOOyMcwFXo	1414693171	527887536992313344	f	philssteaks
It's our last Thursday at 52nd and 6th until April. Make it count! Rocking from 11-2. Get your Phil!	1414675845	527814868611923968	f	philssteaks
@justyniak yes unfortunately we are serious. The permit game is crazy. Tomorrow at 52nd and 6th 11-2	1414614614	527558044612587524	f	philssteaks
@justyniak better get it this week! Last day on the road is Friday - then back in April	1414614333	527556867867029505	f	philssteaks
51st and Park 11-2	1414507039	527106843819409408	f	philssteaks
Have the best weekend you cheese loving friends! Off the street today TGIF	1416585917	535826292319731712	f	morristruck
Bundle up and come see us at metrotech and 51st and madison today! We love you! getthecheese	1416498693	535460448368594944	f	morristruck
Off the streets today, warming up for midtown and metrotech tmr! polarvortexnonsense	1416411086	535092995797032960	f	morristruck
BRRRRRRRRRRRRRRRRRRRRRRRRRR\nIt's cold today. We're off the streets. Stay warm!	1416326737	534739208943206400	f	morristruck
On rainy Mondays like today, don't you just want a grilled cheese to hug you from the inside out? Come to 52 &6th- we've got just the thing.	1416239912	534375042348769281	f	morristruck
Wherever you end up tonight, remember to be safe, and us our @lyft code MORRISTRUCK for a free ride!	1416016215	533436785704308738	f	morristruck
What a beautiful fall day for some beautiful melted cheese! Truck in Midtown at 51st & Mad, Cart in Metrotech @DowntownBklyn on Bridge St!	1415894776	532927433948028928	f	morristruck
What a beautiful fall MidtownMonday! Come get a taste of autumn at 52nd & 6th- butternut squash, grape lavender soda, we got it all!	1415634588	531836126274011137	f	morristruck
Hey soggy midtown friends! Come warm yourselves from the inside out w/ a delicious grilled cheese & hot soup! 51st btw Park & Mad! bebrave	1415290211	530391705594634243	f	morristruck
Closed for a private event today, but find us tomorrow @DowntownBklyn MetroTech at Bridge St, and in Midtown on 51st! cheeseisback	1415203264	530027022257774593	f	morristruck
Hey friends, don't forget to download the @lyft app and use code MORRISTRUCK for a free ride!	1415135304	529741980734324736	f	morristruck
WOOOHOOO MIDTOWN! Lunch at 52 & 6th today! Can't wait to hear about everyones clever ebola-related costumes! crushthemondayblueswithcheese	1415030031	529300429872836608	f	morristruck
Anyone looking for a spooky cheesy good time this weekend should be sure to grab @NYCraftBeerFest tix asap! http://t.co/C9s7vPXT1y	1414773640	528225050907119616	f	morristruck
BOO!	1414773006	528222390950830081	f	morristruck
Make sure to check out our new dessert sandwich and Grape Lavender soda, just in time for the real fall weather! tistheseason	1414688021	527865938117668864	f	morristruck
Man oh man what a day! Find the truck at 51st btw Park & Mad, and the cart @DowntownBklyn Metrotech on Bridge St! cheeseeverywhere	1414681133	527837048489930752	f	morristruck
And make sure you get your tickets to @NYCraftBeerFest this weekend! http://t.co/C9s7vPXT1y	1414601707	527503911083839488	f	morristruck
No lunch today, but you can find us tomorrow @DowntownBklyn Metrotech and in Midtown at 51st & Mad! 2xthecheese	1414595085	527476136125927425	f	morristruck
RT @cafegrumpy: Don't miss this! Prizes for pours & costumes + @ConeyIslandBeer Freaktoberfest + @morristruck grilled cheese. http://t.co/2...	1414458813	526904567980888065	f	morristruck
Is this really Fall? We're not sure either. We are sure that you'll have the best grilled cheese of your life at 52 & 6th today. 1130-230.	1414422973	526754246293987328	f	morristruck
Hooray! We parked! 18th & 7th ave ( a few cars in, not on the corner...) 5-7pm!!!	1416607242	535915735777050625	f	thetreatstruck
Our spot on 18th st is full of cars! We've been circling the block....one more try!	1416606658	535913284546088960	f	thetreatstruck
Lots of traffic! We're going up at 18th st & 7th ave a little late! We'll let you know!	1416604666	535904928548810753	f	thetreatstruck
Hey 45thers! And UWSiders, too! We're thinking about spots on Monday since it's a holiday week! Sound good?	1416599663	535883944005480449	f	thetreatstruck
!!! Fri, Nov 21st 12-3:30 45th st & 6th ave, then 4:30-7pm 18th st & 7th ave!!!	1416585269	535823574511411200	f	thetreatstruck
!!! Thurs, Nov 20th 3:30-7pm Bway (86th & 87th)!!!	1416513629	535523092316311553	f	thetreatstruck
!!! Wed,Nov 19th 12-3:30 45th st & 6th ave, then 4:30-7pm 18th st & 7th ave!!!	1416411968	535096696305639424	f	thetreatstruck
!!! Tues, Nov 18th no truck today! Our shop open 8:30am-6pm! 521 Court st, Carroll Gardens  brooklyn treats !!!	1416321970	534719217690746880	f	thetreatstruck
On Sun, Nov 16th both our truck & shop are closed for the day! (our shop will be back to its normal Sun hours next week!)	1416107061	533817822326292481	f	thetreatstruck
!!! Sat, Nov 15th no truck this weekend! Our shop open today 8:30am-4pm w/food & treats, hooray!! 521 Court st brooklyn treats	1416056947	533607628723986432	f	thetreatstruck
!!! Fri, Nov 14th we have private events today, so no regular spots! See you all next week! Have a great weekend!!!	1415984154	533302315043016704	f	thetreatstruck
!!! Thurs, Nov 13th 3-7pm Bway (86th & 87th)!!!	1415908458	532984820478259200	f	thetreatstruck
Headed to the UWS this afternoon!!!	1415891150	532912227905703936	f	thetreatstruck
4-7pm 18th st & 7th ave!!!	1415826333	532640364226949120	f	thetreatstruck
!!! Wed,Nov 12th 12-3:30 45th st & 6th ave, then 4:30-7pm 18th st & 7th ave!!!	1415807658	532562034182078465	f	thetreatstruck
!!! Tues, Nov 11th no truck today! Our shop open 8:30am-6pm! 521 Court st brooklyn treats !!!	1415708825	532147500925612032	f	thetreatstruck
!!! Sun, Nov 9th no truck today! Our shop open   8:30am-6pm w/food & treats!!! 521 Court st brooklyn Carroll Gardens treats !!!	1415536666	531425411537055744	f	thetreatstruck
Sat, Nov 8th!!! Come on by our shop and watch us bake! Have treats and hot cider! 521 court st brooklyn treats !!!	1415451355	531067590853267457	f	thetreatstruck
!!! Sat, Nov 7th no truck today! Our shop open 8:30am-6pm w/pancakes, sandwiches, salads, hot choc, coffee, treats!!! Hooray!!!	1415451187	531066886759649280	f	thetreatstruck
The end is near!!!\nFront & Jay with Mushroom Barley & Split Pea Soup. @DUMBOFoodTrucks	1416578168	535793788523126784	f	thesteelcart
Last Thursday in Midtown for a while! We'll miss you! Soups today are Chicken Noodle, Mushroom Barley, Split Pea & Ham. - 56th & Broadway.	1416494608	535443311834968064	f	thesteelcart
RT @liakamb: @TheSteelCart Thank you so much for the most fantastic bowl of grits I've ever had outside of my mom and grandmas &gt;.&lt;!!!!	1416408991	535084210890231809	f	thesteelcart
@liakamb Yay! Thanks for stopping by!	1416408980	535084164459274240	f	thesteelcart
Well it's no Buffalo, but still complaint worthy. The Steel Igloo's on Front & Jay with Split Pea & Rustic Chicken Noodle. @DUMBOFoodTrucks	1416404841	535066804419592192	f	thesteelcart
Soup'll fix this. 56th & Broadway through lunch with Organic Lentil & Rustic Chicken Noodle. http://t.co/69Q2VD8rdA	1416319289	534707972333510656	f	thesteelcart
Could this Monday be any more Monday? Front & Jay in the rain through lunch! Soups are Rustic Chicken Noodle and Organic Lentil. DUMBO	1416232862	534345472073539584	f	thesteelcart
@NautiMobile http://t.co/aCkqQ9NNgT	1416158129	534032018355781632	f	thesteelcart
Perfect Steel Cart weather on Front & Jay! Soups today are Spicy Black Bean + Split Pea & Ham. @DUMBOFoodTrucks	1415979094	533281091785093121	f	thesteelcart
@unha_engels it's ready for you.	1415976286	533269311167930369	f	thesteelcart
@unha_engels what would you like?	1415974922	533263590019854336	f	thesteelcart
Right, November in the Northeast. 56th & Broadway through lunch. Soups are Spicy Black Bean + Split Pea & Ham.	1415889586	532905668047831041	f	thesteelcart
Dumbo it is! Front & Jay through lunch with Rustic Chicken Noodle + Navy Bean & Kale soup. @DUMBOFoodTrucks	1415808108	532563923237896193	f	thesteelcart
Back on 56th & Broadway. Soups today are Creamy Potato / Rustic Chicken Noodle / Navy Bean & Kale.	1415716260	532178686381162496	f	thesteelcart
@vllg We'll be in Wednesday! (Assuming they're not filming Wednesday.)	1415632046	531825464013520896	f	thesteelcart
Surprise Monday in Midtown! 56th & Broadway through lunch with Creamy Potato + Split Pea & Ham soup.	1415629611	531815252993003520	f	thesteelcart
Happy Friday! Don't clock-watch on an empty stomach. - Front & Jay through lunch with White Bean Chili + Split Pea & Ham soup. DUMBO	1415374701	530746083212001281	f	thesteelcart
@e_hanz It's true! Perfect grits weather. We'll try to make it up to you next week in equally inclement conditions. ;)	1415289174	530387357821071360	f	thesteelcart
@Narwhallo Sorry!!!! Will miss you too.	1415288343	530383872786432000	f	thesteelcart
Cart will be staying in from the rain today. We WILL be back in Midtown next Tuesday.	1415286340	530375467837440000	f	thesteelcart
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
We're on 50 Street btw 6 &7 Ave today until 3pm. Come check out our Portobello Mushroom Crepe.	1378910456	377803953406509056	f	thecrepestruck
Good morning everyone. Start the week off right with a crepe from TheCrepesTruck. We're on 50th street between 6 & 7 Ave.	1378732102	377055881386393600	f	thecrepestruck
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
Listen up! Blend truck is on the corner of 55th and broadway! Only 1 more week after this one =( hurry up and TreatYourself	1382458468	392685393621291009	f	blend_express
Follow us on Instagram http://t.co/G0kdQitmja	1416611386	535933116326871040	f	valduccis
bruschettaricotta yumm http://t.co/eFWc1O9yFc	1416602067	535894029284958209	f	valduccis
Havas @valduccis@gofooda@greenboxny@foodtruckgirl17PaniniFriday http://t.co/UBEcejIz1N	1416585914	535826279321575424	f	valduccis
Cool for your holiday catering http://t.co/VMrBnnIDfZ	1416583217	535814967531159553	f	valduccis
Catering  http://t.co/ozymmqSGtz	1416520929	535553709271707649	f	valduccis
You never know who's eating a slice of cheese pizza bestpizza http://t.co/vFiQnMFUXB	1416493971	535440639593553921	f	valduccis
RT @NYCMayorsOffice: For the first time in more than 10 years, @gracie_mansion celebrated Puerto Rican Heritage Month tonight. http://t.co/...	1416493082	535436912216268800	f	valduccis
@brainpop pizza salads catering @greenboxny http://t.co/mgxLHKnPFo	1416491852	535431754891689984	f	valduccis
We do Weddings !!! http://t.co/apNkJEvnWe	1416481475	535388230641025024	f	valduccis
Antipasti !!! http://t.co/grf4wU1Z74	1416481404	535387932614729729	f	valduccis
Best Salads catering http://t.co/XONqpIycWG	1416481365	535387767765991424	f	valduccis
Catering http://t.co/2GexpYjkgk	1416448407	535249532884635648	f	valduccis
RT @greenboxny: RT @Valduccis: Pasta Fresca holidayseason bestcatering@Valduccis @FoodtoEat @Foodtruckgirl7 @foodNfest @FoodPornsx http:/...	1416409538	535086502720860160	f	valduccis
Valduccis Delivery Service !!! http://t.co/NH73OI6W8d	1416406429	535073461614682112	f	valduccis
Best Catering !!!!!!!  http://t.co/A4As9SpUK8	1416402304	535056163524845568	f	valduccis
RT @foodNfest: Dope pic http://t.co/14gzpEsXqG	1416402165	535055580877299712	f	valduccis
RT @Foodtruckgirl7: @Valduccis: Pasta Fresca holidayseason bestcatering  http://t.co/cIRjwRr8sg yummmy!!! 	1416400099	535046915340394496	f	valduccis
Pasta Fresca holidayseason bestcatering@Valduccis @greenboxny @FoodtoEat @Foodtruckgirl7 @foodNfest @FoodPornsx http://t.co/7gdNFi7dmp	1416396351	535031194581475328	f	valduccis
Is SantaCon come in to New York ? http://t.co/ndKM7sedZj	1416396218	535030633387786240	f	valduccis
RT @DeliciousTbh: Red Velvet Cheesecake\nTag A Friend http://t.co/bDkMklxBVt	1416394131	535021883436335104	f	valduccis
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
Catering Now Available! Call 908-591-5972 or Email miamifoodmachine@gmail.com for details http://t.co/npC7ELfEYw	1384373440	400717369690968064	f	miamimachinenyc
@nish_talks whoa whoa. No shortcuts here. Let's chat: ty@luckmgmt.com	1416598359	535878477673938944	f	domotaco
RT @alexisrwilley: @GillieHouston @DomoTaco I fell over when I bit into the tempura fish taco	1416598056	535877203247263744	f	domotaco
Firing up the grills on Old Slip & Water st!	1416584044	535818434333138944	f	domotaco
End the work week with domo on old slip and water for lunch. nachotots.	1416579123	535797793416568832	f	domotaco
tacos Burritos & ricebowls on 46th & 6th oh my!	1416496546	535451441738301440	f	domotaco
Catch us at the @dumbolot on jay & water today!	1416412354	535098315743170560	f	domotaco
crispyfish ftw mooshugrill http://t.co/Zi5KCTUCN7	1416335562	534776225127206913	f	domotaco
Busting out the burritos on Hudson & King for lunch today! SoHo	1416321167	534715846946734080	f	domotaco
RT @mooshugrill: MSG is back for a limited time with an upgraded menu! Check us out 47th & Park mooshurito crispyfish orangebeef nomsgt...	1416235759	534357621177085952	f	domotaco
Back at it on 52nd & 6th! Catch us across the street from our normal Monday parking spot!	1416235718	534357449688743936	f	domotaco
RT @KRainSocial: Bittersweet discovery - my first time trying @domotaco on the very last day of broadway bites...	1416007913	533401966165377024	f	domotaco
@KRainSocial we will be at Columbus circle holiday markets in two weeks!	1416007908	533401946783498240	f	domotaco
RT @alexisrwilley: So glad @GillieHouston unintentionally making me walk v far in the freezing cold for @DomoTaco 	1416007883	533401840910872577	f	domotaco
RT @GillieHouston: @alexisrwilley @DomoTaco domo taco is  worth it domo taco is god domo taco is everything	1416007862	533401753572900864	f	domotaco
Last day to catch yourself some Domo Taco at BroadwayBites! Swing by 33rd & Broadway or catch the truck at Old Slip & Water today	1415975796	533267256944627712	f	domotaco
RT @NyjerahNicole: Why am I just learning about @DomoTaco? Another great food spot that makes me love New York even more.	1415901278	532954707938267136	f	domotaco
Happy Thursday! Catch domotaco at South Street Seaport till 3pm and at broadwaybites till 9pm!	1415890986	532911537149992960	f	domotaco
feedback from customer: Unless something bad happens in about an hour then I see no flaws!!	1415819937	532613536476721152	f	domotaco
Catch us at the @dumbolot on Jay & Water, or at BroadwayBites on 33rd & Broadway!	1415801550	532536416094674946	f	domotaco
Guess whose back? Hudson and King till 2:30p! veteransday also at broadwaybites till 9pm!	1415717771	532185021973815296	f	domotaco
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
RT @NHLDevils: Whos hungry? Tune in to @PIX11News tomorrow at 7 a.m. to see the brand new @PruCenter PRUeats Truck in action! http://t.co...	1413285729	521984298065625088	f	shanghaisogo
Happy Friday! Varick and king until 3p today eddiespizza http://t.co/w4CeYsFDIT	1416577958	535792906066739200	f	eddiespizzany
Happy Friday! Varick and king until 3p today eddiespizza http://t.co/NUYiyyaOgx	1416577955	535792895073071104	f	eddiespizzany
Happy Thursday everyone! We are parked on the corner of Water St & Hanover square. Stop by and pick up a fresh... http://t.co/A02RZJHU30	1416500532	535468159458103297	f	eddiespizzany
Stop by Eddie's pizza truck and pick up some fresh hot pizza with a side of delicious hot tomato soup. We are... http://t.co/SxSzhivEFs	1416414799	535108569105182721	f	eddiespizzany
RT @robertherjavec: We did it @EddiesPizzaNY ! AMAZING!!    Bring it on LIVE Friday @BarbaraCorcoran @GMA SharkTank	1416404440	535065122864365568	f	eddiespizzany
Catch us this morning on @GMA with @robertherjavec	1416402371	535056442479607808	f	eddiespizzany
Want something to warm you up? Stop by Eddie's Pizza truck and enjoy our Buffalo chicken pizza special for... http://t.co/1Loe7dOgYN	1416325553	534734246238101504	f	eddiespizzany
Check out goodmorningamerica tomorrow (wed) to see sharktank robertherjavec and eddiespizza take on... http://t.co/0c9coxSqN0	1416324788	534731034781560832	f	eddiespizzany
Check out goodmorningamerica tomorrow (wed) to see sharktank robertherjavec and eddiespizza take... http://t.co/7Kp5JTEPbP	1416324786	534731026862714880	f	eddiespizzany
@Eater hit up @TakumiTacoNY	1416271305	534506712993378304	f	eddiespizzany
BBQ chicken pizza will make your cold, rainy day MUCH better! Mondays at @starrettlehigh starrettlehigh eddiespizza http://t.co/fRxzKi4FsI	1416239694	534374124295299074	f	eddiespizzany
BBQ chicken pizza will make your cold, rainy day MUCH better! Mondays at @starrettlehigh... http://t.co/4S64dTZ68H	1416239691	534374114966777856	f	eddiespizzany
@itwontbelongnow yayyyy	1416190533	534167931857678336	f	eddiespizzany
Saturday we will be at hunters point South Park in Long Island city. Visit from 1p to 4p for the... http://t.co/KbZZdC8Waq	1415991254	533332091271131136	f	eddiespizzany
Saturday we will be at hunters point South Park in Long Island city. Visit from 1p to 4p for the... http://t.co/BxBluKsRlk	1415991249	533332073877344257	f	eddiespizzany
Friday: varick and king for lunch until 3p http://t.co/PwIsTMy6EP	1415978277	533277665420378112	f	eddiespizzany
RT @TakumiTacoNY: Short rib nachos  open Today at @chelseamarketny @starrettlehighstarrettlehigh chelseamarket @... http://t.co/o6160gpNb5	1415897971	532940835042910208	f	eddiespizzany
Thursday: eddies closed for private catering event http://t.co/6ZSOVuYsS6	1415887560	532897169242873856	f	eddiespizzany
Go check out our friends @TakumiTacoNY who just opened a kiosk @ChelseaMarketNY http://t.co/G3znQfBKva	1415719338	532191593391206400	f	eddiespizzany
Tuesday: Closed for a private event today catering events http://t.co/GZBiLwq2Wa	1415715113	532173875229237249	f	eddiespizzany
RT @anitabadejo: FINALLY, SOMETHING WENT MY WAY THIS WEEK. RT @TaimMobile: FRIDAY SURPRISE! Taim is in the flatiron today on 20th/5th!	1416593218	535856912961921024	f	taimmobile
FRIDAY SURPRISE! Taim is in the flatiron today on 20th/5th! It's practically a three day weekend!	1416582764	535813067851169792	f	taimmobile
A perfect day for Taim's falafel and hummus on Varick/Vandam. Well, every day is a perfect day for Taim's falafel and hummus.	1416502700	535477251576709121	f	taimmobile
RT @vincetruth: @JasonKingBR in town tmrw? Swing by @taimmobile on Vandam + Varick for falafel sandwich you won't forget	1416502651	535477047054057472	f	taimmobile
RT @LARGTwITS: Nailed it I am obsessed with @TaimMobile and @TryCaviar . These people are so nice and more  importantly, FEED ME! http://t...	1416447148	535244252645969921	f	taimmobile
RT @BalaboostaNYC: Special this week: Black Grouper - spicy tomato sauce, okra, lemon http://t.co/8BrD4PZPV8	1416433890	535188641958887424	f	taimmobile
RT @tofurious: Middle Eastern deliciousness. NYC taim falafel\n\nhttp://t.co/bI0HoxDBkA http://t.co/1vn42jGLcv	1416424751	535150312349507585	f	taimmobile
Sorry falafel fans, more work being done on the truck today, so we are not serving lunch. Try our Nolita & West Village stores for your fix	1416414336	535106626122838017	f	taimmobile
RT @BalaboostaNYC: Our Mediterranean Sampler, who says you can't have it all? http://t.co/hwhQEWubWa	1416345775	534819063550476288	f	taimmobile
RT @kfarrel3: I *may* be doing a little happy dance over this lunch from @TaimMobile. The falafel is pretty great,... http://t.co/3QPLIgpN0v	1416345766	534819025881419776	f	taimmobile
RT @MerJohnston: Freezing temps would never keep me from @TaimMobile on a Tuesday.	1416345754	534818973523927040	f	taimmobile
Hot falafel. Hot soup. Hot fries. Hot deals on 20th/5th. hot	1416327514	534742471889403904	f	taimmobile
RT @Chris_Quartly: Some falafel porn for you, from @TaimMobile http://t.co/M9SnA6JFzd	1416250619	534419948131844096	f	taimmobile
RT @dessertzombie: Falafel platter and strawberry raspberry thai basil smoothie @TaimMobile WallStreet DessertZombieEatsVeggies http://t....	1416250614	534419927500083201	f	taimmobile
@feldman @rus We are in the Financial District on Water and Wall	1416239907	534375017547849728	f	taimmobile
Monday never felt so good, Taim Mobile is on Water St and Wall St in the FiDi! Start your week off with the City's best hummus and falafel	1416239885	534374925872943104	f	taimmobile
RT @cdsiason94: @cheska_mariel: The hummus from Taim Falafel is so damn good @TaimMobile word	1416093197	533759671044435968	f	taimmobile
Chef @EinatAdmony shows you how to master Middle Eastern Spreads: http://t.co/7JFXdHlc5w	1415993656	533342167259824128	f	taimmobile
We're back on the streets! Varick/Vandam with Corn Jalapeno soup, let's do this SoHo!	1415898344	532942398641668096	f	taimmobile
Chef @EinatAdmony is up for @EaterNY's Chef of the Year. Support her and your favorite falafel by voting now! http://t.co/IS9U917xnr	1415813814	532587855068278785	f	taimmobile
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/H3HVbTwWc4	1416573302	535773380772102145	f	sweeterynyc
@GigiCampo Problem no more, anyone who's a dog nut & lover of Sweetery as u r has something spl coming 2 her, $25 of Sweetery Sweet Dough.	1416498381	535459136650366976	f	sweeterynyc
RT @GigiCampo: @SweeteryNYC This is my computer. I think I have a problem ... http://t.co/yYTNzhGOzM	1416498177	535458281196896257	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/H3HVbTwWc4	1416486903	535410997167923200	f	sweeterynyc
RT @ajarzab: Great meeting w/ Legal, @SweeteryNYC hot choc thanks to @quartkneewood, office temp &gt; 30 degrees. Basically I'm nailing it. d...	1416423119	535143464577400832	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/H3HVbTwWc4	1416400504	535048610556428288	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/H3HVbTwWc4	1416314104	534686223005401088	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/H3HVbTwWc4	1416227703	534323830391853056	f	sweeterynyc
If you're heading to Hunts Point South Park @HPSLiving @AusterAgency & SweeteryNYC has some delicious FREE treats for you. ComePartyWithUs!	1416076265	533688653135228928	f	sweeterynyc
RT @austeragency: Starting NOW- freefood from @Redhooklobster @milktrucknyc @mamuthainoodle @EddiesPizzaNY and @SweeteryNYC at HPSPartyIn...	1416075597	533685853520809984	f	sweeterynyc
Lets get the party in park Hunts Point South Park LIC started now, see you soon @HPSLiving @AusterAgency FreeTreatsForAll!	1416059042	533616415870562304	f	sweeterynyc
RT @austeragency: Can't wait to get our hands on some treats tomorrow at HPSPartyInThePark from @SweeteryNYC! The first hour (1-2PM) is ...	1416057015	533607914317946881	f	sweeterynyc
RT @terresaling: Terresa's Steals and Deals! =): 11/15 - Free @SweeteryNYC Treats! @HPSLiving HPSPartyInThePark http://t.co/HOCQmZzICc	1416054266	533596383031197698	f	sweeterynyc
Come visit the SweeteryNYC truck tomorrow at Hunter's Point South Park Long Island City for FREE TREATS!!  @HPSLiving HPSPartyInThePark	1415986602	533312580350390272	f	sweeterynyc
Hello @HPSLiving we are so excited to be hanging with you tomorrow, we'll be bringing our brand of free love to you & your special guests!	1415980776	533288144573968385	f	sweeterynyc
SweeteryNYC will be at Hunter's Point South Park LIC handing out FREE Sweets THIS Sat. 1-2pm! Join us!  @HPSLiving HPSPartyInThePark	1415973734	533258610152075264	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIQzlA	1415968505	533236675057426434	f	sweeterynyc
Hudson/King St. we know it's not a good morning with no Sweetery, sorry that we missed u we  r working a spl event near by, see you tomorrow	1415887285	532896014441910272	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIyYdw	1415882105	532874288118767620	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIyYdw	1415795705	532511900680998912	f	sweeterynyc
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
RT @KorillaBBQ: It's a celebration! openingday @ Korilla BBQ http://t.co/oWYcfFRsSE	1414217527	525892544014872576	f	lovemamak
RT @leeannewong: latergram winnerwinnerchickendinner kokoheadcafe whiskeyandfriedchicken @willchen79 @ Koko Head Cafe http://t.co/U4cgQe...	1414217024	525890434640662528	f	lovemamak
Its almost time that, our dream of giving you a good place to sit and eat the best food of NY is coming true @lovemamak BigThingsPoppin	1414074385	525292162507096065	f	lovemamak
RT @i8and8: Photo by lovemamak\n\nOoh, cant wait! Self paint sign is almost ready! @LoveMamak BigThingsPoppin http://t.co/w09ldWVUko	1413810813	524186662256250880	f	lovemamak
Photo: Self paint sign is almost ready! http://t.co/zt6upM18bQ	1413568762	523171425289773056	f	lovemamak
Self paint sign is almost ready! http://t.co/GuRwqRK1pv	1413568760	523171418058788865	f	lovemamak
Photo: Sneak peak, things are getting along. http://t.co/pzzJi455FJ	1413068605	521073613538344960	f	lovemamak
Sneak peak, things are getting along. http://t.co/LI3NleLpW8	1413068603	521073605770498048	f	lovemamak
@elpasony @ZagatNYC @YelpNYC @NYCFoodieFinder @nycgo @HarlemRestRow this is out patio !! CheckItOut	1416428307	535165226434711552	f	elpasotruck
RT @elpasony: SpecialEvents Book your special event with us @ZagatNYC @YelpNYC @NYCFoodieFinder @nycgo @HarlemRestRow http://t.co/Gme1j9Ni...	1416428259	535165026399965184	f	elpasotruck
Cover up & come to 72nd & York Ave. for some Enchiladas for Lunch.	1416325182	534732687580610560	f	elpasotruck
Stop by and get your lunch with us at 72nd & York Ave in front of sothebys taco quesadiilas mexfood	1414425592	526765230383443968	f	elpasotruck
Stop by today at 72nd & York ave to get your lunch	1414165410	525673947439058946	f	elpasotruck
@shiffman yes ! We are here !	1413239902	521792085620686848	f	elpasotruck
@willmcguinness on Broadway	1412958045	520609892705783809	f	elpasotruck
@willmcguinness @ElPasoTruck We are now on 72nd & York. We will be on 97th and Columbus at 4pm. Thank you	1412956638	520603990812143616	f	elpasotruck
Today we are at @Columbia between W 115th & W 116st. Stop by and get your tacos, burritos, quesadillas yummy  tacotruck FoodTruckfriday	1412955921	520600981915324416	f	elpasotruck
Good afternoon twitters ;-) today we are at 97th and Columbus Ave, stop by get your Tacos burritos enchilada\nTacoTuesday foodtruck	1408483439	501842034542792705	f	elpasotruck
Come visit us on 97th and Columbus Ave tacos burritos yummy foodtruck	1406396031	493086810864885761	f	elpasotruck
We are exited to be part of Stars & Ftripes Festival @TheNYRA this Saturday.\n4ofjuly tacos Check out the video: http://t.co/VNmBjLkqYm	1404311997	484345740743806976	f	elpasotruck
We will be all day today at 97th and Columbus Ave. Stop by and get tacos, burritos, enchiladas yummy tacotruck foodtruck TacoThursday	1401383298	472061882845921280	f	elpasotruck
Stop by 97th and Columbus	1400185464	467037805139750912	f	elpasotruck
We are at 97th and Columbus ave tonight! Stop by :)	1399671835	464883487724797952	f	elpasotruck
Today we will be columbiaUniversity by 116st and Broadway	1399226516	463015684080148480	f	elpasotruck
@mrchristianbaez We are glad you enjoy them!! See you soon :)	1399153802	462710700490911744	f	elpasotruck
Today we are at Columbia University, 115th and Broadway come stop by ColumbiaUniversity  TacoTuesday  foodtruck	1398185685	458650125712490497	f	elpasotruck
Stop by 72nd & York ave we will be here until 3:30pm then we are heading to the westside on 97th & Columbus ave tacotruck tacos food	1398097554	458280473803096064	f	elpasotruck
We are at 72nd and York ave, Stop by and get your tacos :)	1397581617	456116477423534080	f	elpasotruck
@marisarospos @CoryBooker we are also in jersey city Thursday evenings!	1416617261	535957755795107840	f	veganlunchtruck
This Sunday is the last day for two things-\n\n-last service in Red Bank until next spring\n\n-last day to order you... http://t.co/QjfhMOamuv	1416609700	535926045011369985	f	veganlunchtruck
RT @vanessamarie: 'Twas the perfect bite. \n\nAlmond Maple Bacon Donut from @VeganLunchTruck //  http://t.co/eJJwUoIHxk	1416605984	535910459611021312	f	veganlunchtruck
RT @larrainelage: Me: I hate lentils.\n\nSnaily: Try our coconut curry lentil soup.\n\nMe: @_@ ... I love lentils.\n\nHow does @VeganLunchTruck d...	1416605969	535910394838413316	f	veganlunchtruck
RT @britanniebond: i have found a home, & it is the pumpkin pie donut from @VeganLunchTruck	1416594269	535861319388647425	f	veganlunchtruck
specials:\nSambar masala grilled butternut squash, coconut curried lentil soup, peanutbutter chocolate chip cookie dough snails @like_a_riot	1416583371	535815612153757696	f	veganlunchtruck
TWO LOCATIONS TODAY!\n9:00-3:00\n\n33rd/Park\n55th/Broadway\n\nLast few days to order your vegan Thanksgiving from us:\nhttp://t.co/ccsPaahAJZ	1416579190	535798073482838016	f	veganlunchtruck
TRIPLE THURSDAY!\nLocations:\n\n21st/5th 8:40-3:00\n\nWater btwn Wall/Gouvernour Ln 9:00-3:00\n\nGrove st. PATH Jersey City 5:00-8:00pm	1416491538	535430438337404928	f	veganlunchtruck
@shayrose12 9:00-3:00	1416487758	535414580676411392	f	veganlunchtruck
Please RT:\n\nSunday is the deadline to order OUR THANKSGIVING YUMS. \n\nPICK UP IN: Manhattan, BK, Hoboken & Red Bank\n\nhttp://t.co/t10RtQVFjQ	1416431415	535178260410540033	f	veganlunchtruck
RT @FormSite: FormSite order form for Thanksgiving catered by The Cinnamon Snail @VeganLunchTruck NYC & NJ http://t.co/Mv36azKGgp http://t....	1416423039	535143132049199105	f	veganlunchtruck
Parked on 47th & Park\n8:15-3:00\n\nSambar masala grilled butternut squash w/ curried cashews, greens, kafir lime chutney & pickled amla cream	1416405162	535068147112738816	f	veganlunchtruck
Please RT:\n\nLAST WEEK TO ORDER OUR THANKSGIVING YUMS. \n\nPick up locations in Manhattan, Brooklyn, Hoboken & Red Bank\n\nhttp://t.co/t10RtQVFjQ	1416348238	534829394632908800	f	veganlunchtruck
@dbockk day off this Saturday	1416347968	534828262011056128	f	veganlunchtruck
RT @eatdrinkrally: We like whatveganseat . Thai bbq tempeh and raspberry cheesecake donut from @VeganLunchTruck boom http://t.co/BlSkEI...	1416338135	534787017100767232	f	veganlunchtruck
TWO TRUCK OUT TODAY!\n9:00-3:00\n\n38th/Broadway\nWater/Gouvernour Ln.\n\nSambar masala grilled butternut squash & raspberry cheesecake donuts	1416322966	534723392227004416	f	veganlunchtruck
Please RT:\n\nTHIS IS THE LAST WEEK TO PLACE AN ORDER FROM OUR THANKSGIVING MENU. \n\nInfo & menu here:\nhttp://t.co/t10RtQVFjQ	1416253781	534433210512732160	f	veganlunchtruck
Parked on 55th between 6th /7th 8:20-3:00\n\n(Filming was happening on 48th today)\n\nTODAYS SPECIAL:\nSambar masala... http://t.co/xgLH5TFsXj	1416230549	534335769402691586	f	veganlunchtruck
Parking today on 55th between 6th/7th\n\n(sorry, servicing one of our trucks, no 23rd st this week.  Also filming going on at 48th)	1416224453	534310200900321280	f	veganlunchtruck
@MSmou96 sorry.  That truck had to spend a day in the shop for some tlc.	1416185444	534146585119457280	f	veganlunchtruck
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
Getting ready for Christmas!!! Free workshop alone with Craffles:)... http://t.co/OEIIb39HAP	1386908785	411351378985250816	f	crafflesnyc
It's Saturday!  That means donut time. The truck is at Bergen and Court in Cobble Hill until 4pm. Come see us!	1416660729	536140075516825600	f	carpedonutnyc
!!! Sat, Nov 22  no truck this weekend! Our shop open 8:30am-6pm w/food & TREATS!!! 521 Court st brooklyn treats Carroll Gardns	1416660520	536139196646580224	f	thetreatstruck
RT @SlowClubCookery: Drove to NYC. Found @veganlunchtruck. Bought all the donuts and pastries. Ate all the donuts and... http://t.co/UDued4rg...	1416660958	536141034015973377	f	veganlunchtruck
Pagadder @ Brooklyn bridge till 8pm\nGoesting @ Bway & 66th till 10pm	1416663461	536151532073652224	f	waffletruck
CARTS\nVedette @ 60th & 5th till 8pm\nBierbeek @ great lawn in Central Park till 8pm	1416663454	536151505523716096	f	waffletruck
TRUCKS\nKastaar @ 79th & York til 1am\nMomma @ Park slope till 4:30pm	1416663445	536151465610739712	f	waffletruck
Weeeeeeekend!!!  dinges \n\nLe cafe @ 15 Ave B till 2am\nDe Wafel Cabana @ 35th & Bway open til 11pm	1416663410	536151317778268160	f	waffletruck
TOMORROW IS THE LAST DAY:\n\n- for us in Red Bank until next spring\n\n-for you to order you thanksgiving dinner from us\n\nhttp://t.co/8GaD7xtL4H	1416662364	536146930888626176	f	veganlunchtruck
PieTruck is outside Trader Joes @ Atlantic Ave & Court St, Brooklyn. 10am to 4pm	1416667312	536167686825574401	f	dubpies
Clap your hands to the rhythm of your favorite song for one free dinges!! dinges itscoldoutside warmingup	1416664825	536157255876747264	f	waffletruck
@thedawncoates Looking forward to sharing a meal with you!	1416667198	536167209652224000	f	snowdaytruck
@thedawncoates @YahooFood THANK YOU!!!! MAD MAPLE	1416664911	536157616498802688	f	snowdaytruck
RT @thedawncoates: I. LOVE. This. Story. Thank you, @DriveTruckNYC and Jordyn Lexton for @SnowdayTruck.  https://t.co/VqlLNMxti3 via @Yahoo...	1416664889	536157521896284161	f	snowdaytruck
Happy Saturday the kiosk located inside Bryant park and 40 street is now open	1416665066	536158263835127808	f	carpedonutnyc
Stands out at Williamsburg @smorgasburg (East River State Park) and Winter Flea @bkflea (1000 Dean St.), come say hi!	1416668403	536172263242858496	f	milktrucknyc
Bessie's in Tribeca, Chambers & Greenwich. Call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always @houstonhallnyc	1416668410	536172290640080897	f	milktrucknyc
RT @BalaboostaNYC: Shakshuka: your brunch awaits http://t.co/yTWbGrg057	1416668734	536173650916171776	f	taimmobile
PieTruck is outside Trader Joes, Court St & Atlantic Ave. RT & show server for free DUB Combo http://t.co/98eHPIoe3d	1416671880	536186843705122816	f	dubpies
We'd consider it if enough people showed interest RT @austca: @dubpies Ever hit Astoria? Queens could use some pies @DNAinfoQNS	1416672460	536189276334358528	f	dubpies
Y'all need that chicken for gameday!  We're at Fulton and front st with the hookup.  nomnomnom	1416674018	536195814943916032	f	usafoodtruck
This Burnt Ends Brisket Burrito wants to get all up inside you http://t.co/rvTd1CCSKf	1416675098	536200340836990976	f	mexicue
http://t.co/TIhV52H0WZ	1416675146	536200543635767296	f	polishcuisine
http://t.co/60O1G2ibMy	1416675118	536200425842958336	f	polishcuisine
http://t.co/Pg8ZlzL8z3	1416675092	536200316749107200	f	polishcuisine
http://t.co/zysgbRtiow	1416675079	536200261807521793	f	polishcuisine
At a special event for lunch, then serving outside of our fidi location at 2:30!	1416674798	536199085553115139	f	nautimobile
RT @vanessamarie: Happiness is a warm curry veg pie + americano from the @dubpies truck. \n\n http://t.co/hTWA2ppdV3	1416678749	536215655796994048	f	dubpies
Be social with Nuchas! Follow us on Instagram & tag your photos with MuchasNuchas \n\nhttp://t.co/Odp3JYG3Ls http://t.co/ZwEUFhxvGt	1416681001	536225101851942912	f	nuchasnyc
RT @CityHarvest: Donate a bag of produce for New Yorkers in need @GrowNYC.  Thank you, Brooklyn http://t.co/i04uN6Qphd	1416683834	536236985107890176	f	snowdaytruck
Saturdays were meant for empanadas! Which muchasnuchas are you craving today?	1416688518	536256629080354816	f	nuchasnyc
People ask every year, so this year in addition to offering a Thanksgiving menu for pick up, we will also be... http://t.co/4xpLtU37Vw	1416688761	536257650242379777	f	veganlunchtruck
Seamless is down... SHORTY'S is not ... Call your Shorty's location for deliveries... http://t.co/YhRssOU1AW	1416692289	536272445255086080	f	shortysnyc
@airrbear14 @aprilkeane @sofiadip11 @aimeelynn87 yay friends!	1416713335	536360721014325248	f	waffletruck
@LADII_HOV you are most welcome. Enjoy! (good choice on the Apple)	1416713317	536360644833189888	f	waffletruck
@justyniak @Mariobatali @thechew cool!	1416713286	536360514516172800	f	waffletruck
@CrimsonDragon5 second time...tomorrow?	1416713261	536360407959891968	f	waffletruck
@delilahlove214 a dangerous endeavor. Powdered sugar leaves none untouched.	1416713220	536360239483088896	f	waffletruck
@khoclaudia those be carts. The trucks are named Momma Truck and Kastaar.	1416713191	536360114471854081	f	waffletruck
@wilcher_sandra we can't wait for that same thing!	1416713155	536359965339156480	f	waffletruck
@JusstKarl he does hold it down well, that Travis.	1416713129	536359854760550400	f	waffletruck
@MariaRiegel95 @iamvalerielane we shall keep two eyes out!	1416713066	536359592801095682	f	waffletruck
@BkBluesFan it might just.	1416713049	536359521690857472	f	waffletruck
@TheBklynTimes looks like it already happened.	1416713027	536359428338229250	f	waffletruck
RT @justyniak: Great. Saw @Mariobatali eating a waffle from @waffletruck on @thechew & now I want me some waffles  cravings	1416710792	536350052437200896	f	waffletruck
This time tomorrow night you can still be feasting on maple grilled cheese and maple fried Brussels sprouts @RoyalPalmsClub - saveroom	1416710251	536347784866435073	f	snowdaytruck
Serving up.our famous Cheesesteaks at Yankee Stadium Layfette vs Lehigh 150th meeting!!! GOT WHIZ? http://t.co/DMnEiLo2U4	1416696786	536291308441456641	f	carlssteaks
Serving up.our famous Cheesesteaks at Yankee Stadium Layfette vs Lehigh 150th meeting!!! GOT WHIZ? http://t.co/bOdLJRlfHD	1416696705	536290969566838784	f	carlssteaks
Check us out on Good MOrning America... http://t.co/2ER2RAJpnL	1416701831	536312468516401153	f	eddiespizzany
We are going to be serving up maple-y goodness @RoyalPalmsClub 514 Union st from 12pm - 10 pm today. comegetit	1416741725	536479795996266496	f	snowdaytruck
Truck open at Bergen and court street.come!!!	1416743723	536488176110817280	f	carpedonutnyc
Excited to wake up with @AriseTV - Happy Maple Morning to you.	1416745660	536496300188254208	f	snowdaytruck
RT @everyonematters: Bravo to @SnowdayTruck - serving great food PLUS giving formerly-incarcerated youth 2nd chance http://t.co/4Fj6xyUrLC ...	1416746969	536501791903739905	f	snowdaytruck
!!! Sun, Nov 23rd no truck today! Our shop open 8:30am-6pm w/food & treats! 521 Court st brooklyn treats  (truck spots Monday!)	1416747582	536504361141411840	f	thetreatstruck
RT @maysoonzayid: So excited to meet  @SnowdayTruck at @AriseTV they are a big influence for @falafullnyc and their food is sweet :)	1416750079	536514837464227840	f	snowdaytruck
Who's ready to have a Maple filled Sunday Funday? The @SnowdayTruck is at @RoyalPalms Shuffle Board Club 12-10 P.M. http://t.co/ioKFFVrhNN	1416747648	536504641383829504	f	snowdaytruck
Come get a donut in Bryant park! Our kiosk in the winter village near 40th and 6th is open all day!	1416748041	536506286683459585	f	carpedonutnyc
LAST DAY SERVING RED BANK NJ UNTIL THE SPRING!\n\n9:00-3:00\n\nTODAYS SPECIAL:\nSambar masala grilled butternut squash... http://t.co/ad6n1ZJVfM	1416749477	536512312782635008	f	veganlunchtruck
RT @TalkerNewYorker: This NYer is in love with  @Margaretcho's Humanity, @rayceejones voice, @milktrucknyc's grilled cheese & @jannikoland...	1416751321	536520046965981185	f	milktrucknyc
Stands out at Brooklyn Bridge Park Pier 5 @smorgasburg and Winter @bkflea Holiday Market (1000 Dean St.)	1416754802	536534643546152961	f	milktrucknyc
.@maysoonzayid so good to meet you @AriseTV can't wait to connect with your husband @FalaFullNYC !! We've got madmaplelove for you!	1416754901	536535060292575233	f	snowdaytruck
We're heading to the Vendy Awards' Vendy Plaza at La Marqueta from 12-6pm at 115th & Park Ave! http://t.co/dtmPt4jUPc	1416760202	536557294184443905	f	nuchasnyc
PieTruck's @ 7th Ave & Carroll St, Brooklyn - savory pies/flat whites in ParkSlope 'til @ 5pm http://t.co/I1AtHNSc5c	1416759716	536555256642289664	f	dubpies
@yagurlpebbles lets just keep that between us,ok?	1416759706	536555214116245504	f	waffletruck
@BigDyce yup!!	1416759593	536554739010658304	f	waffletruck
RT @MikeShemesh:  Eagles game 11 (at @ShortysNyc in New York, NY) https://t.co/jIWDN0uGQl	1416760233	536557426863255552	f	shortysnyc
Live from the @RoyalPalmsClub - come play and grab some maple goodness! 514 union street http://t.co/9JkXBvYiNj	1416762613	536567406525972480	f	snowdaytruck
Today it's Tom & Jerry's Birthday! How old are this cat and mouse already? Tell us for one free dinges! dinges SundayFunday	1416767732	536588878623543296	f	waffletruck
Bierbeek @ great lawn in Central Park till 8pm\nPagadder @ Brooklyn bridge till 8pm\nGoesting @ Bway & 66th till 9pm	1416766939	536585549851934720	f	waffletruck
CARTS\nVedette @ 60th & 5th till 8pm\nKotmadam @ Williamsburg, North 5th Street & Bedford Ave til 8pm	1416766935	536585535964585984	f	waffletruck
TRUCKS\nKastaar @ Forest Hills till 10pm	1416766928	536585504964485121	f	waffletruck
Sunny Sunday!! Come out!! It's beautiful outside! dinges\n\nLe cafe @ 15 Ave B till 11pm\nDe Wafel Cabana @ 35th & Bway open till 11pm	1416766917	536585461285015553	f	waffletruck
67th and Broadway for this unusually warm day	1416766291	536582835881394177	f	nautimobile
TONIGHT AT MIDNIGHT IS THE DEADLINE for you to order you thanksgiving dinner from us!\n\nDon't sleep on this:\n\nhttp://t.co/8GaD7xtL4H	1416767660	536588577204084736	f	veganlunchtruck
RT @margeau_: Sunday's aren't complete unless we have a tasty treat from @VeganLunchTruck !! vegan @tom_petriken http://t.co/toRp7yI1MX	1416767578	536588230435831808	f	veganlunchtruck
THIS WEEK's SCHEDULE:\n\nMon: 48th/6th AND 23rd/park\nTues: water/Gouvernour Ln. AND 38th/Broadway \nWed: 47th/park... http://t.co/Gn2L9vjzkE	1416767539	536588070297296896	f	veganlunchtruck
Momma truck @ Soho, Bway & Prince Street! Get your dinges!!!	1416768707	536592966069268481	f	waffletruck
Celebrate NationalEspressoDay with muchasnuchas and a espresso!	1416771314	536603903635517440	f	nuchasnyc
Grab your Biscuit Baskets & get over to @RoyalPalms shuffle board club & see why @Mariobatali Loved our food SNOWDAY http://t.co/p367lGjw58	1416771027	536602696741310464	f	snowdaytruck
@YoungJimmyT yup	1416778308	536633235057684482	f	waffletruck
RT @YoungJimmyT: @waffletruck is Kastarr on Austin Street today?  If so what time will it be open?	1416778299	536633200274321408	f	waffletruck
RT @New2NYTours: Sweets Bakery Tour! Cannolis & waffles, and cake! Oh my!! Best breakfast ever! @waffletruck @TourGuideNY http://t.co/aPOF...	1416778235	536632930979049472	f	waffletruck
RT @onefine_morning: Stopped at @milktrucknyc in Brooklyn for a 3 cheese + caramelized apple grilled cheese. I am so happy with life http:/...	1416780239	536641337249259520	f	milktrucknyc
RT @leslie_gambetta: @onefine_morning @milktrucknyc Love their grilled cheese!!	1416785466	536663261652205568	f	milktrucknyc
RT @leslie_gambetta: @onefine_morning @milktrucknyc YUM!	1416785462	536663243868368896	f	milktrucknyc
@intel_jim they have embraced the spek with open arms.	1416785683	536664167949037569	f	waffletruck
@thejustinwong and counting!	1416785611	536663869130047488	f	waffletruck
@New2NYTours @TourGuideNY sounds about right to us.	1416785569	536663691794841600	f	waffletruck
latergram Write a thanks in all languages of the world on our tip jar! dinges fun bryantparkmarket http://t.co/qkezMTFXnz	1416785324	536662665687760897	f	waffletruck
@delilahlove214 it usually is.	1416784982	536661228010348544	f	waffletruck
@waitressdotcom yay enormous fork! Yay forced perspective!	1416784956	536661119138795520	f	waffletruck
@CrimsonDragon5 feel better and break a leg!	1416784896	536660867790950401	f	waffletruck
@TheBklynTimes wahoo!	1416784873	536660774589300736	f	waffletruck
Just a few hours left to order the yummiest Thanksgiving appetizers, entrees, soups, sides, desserts, and donuts!... http://t.co/2eF2VPnBux	1416787623	536672305167228929	f	veganlunchtruck
Catering Baby !!! http://t.co/phM4mUmLDr	1416791695	536689384310177792	f	valduccis
Ready to become an official Monthly Maple-ite Member? Start being a part of a movement and help us FUELTHECHANGE? http://t.co/W1qUChDRg0	1416794729	536702112189931520	f	snowdaytruck
Leave your lunch at home and join us tomorrow for lunch at 50th Street btwn 6th and 7th Avenue.	1416796887	536711163879649281	f	bigdsgrub
@SOCIALITENYC is Hudson & King close to you?	1416798425	536717612487831552	f	bigdsgrub
What do fans of Spotify and meat pies have in common? (in the UK) http://t.co/3f0hRlNizg via @US_conversation	1416799770	536723256854994944	f	dubpies
101 followers until we send 24 free pies to a NYC address chosen by random follower. Goal is 4500. TG gift maybe? Pls RT	1416800962	536728253743267840	f	dubpies
Nor is it complete without a 'gourmet' version of same RT @K8Shuttleworth: A NZ experience isn't complete unless you eat a scuzzy meatpie	1416801948	536732390778220546	f	dubpies
Check us out in Food Truck Magazine. Looking forward to hitting the streets again in spring!! pontirossifood http://t.co/gmyk8AaqmQ	1416802162	536733286715097088	f	pontirossifood
We will be on 48th/6th today with a free donut with any purchase!\n\nNo service to 23rd/park today, grampa truck needs a new starter  I cry.	1416825441	536830928853954560	f	veganlunchtruck
Truck open at west 4th street and green st, NYU.come!!!	1416828439	536843502840446976	f	carpedonutnyc
Victor Cruz bestcatchiveeverseen	1416828437	536843491239002112	f	valduccis
Victor Cruz bestcatchiveeverseen @Valduccis bestpizzaieverate@greenboxny@foodtruckgirl17@foodporn@foodto eat	1416828663	536844441156587520	f	valduccis
What do fans of Spotify and meat pies have in common? (in the UK) http://t.co/D6zWzTia8Q via @US_conversation	1416832224	536859377807159296	f	dubpies
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/H3HVbTwWc4	1416832505	536860553978085376	f	sweeterynyc
RT @ArdenisPerez_: Feeling so happy after eating almost an entire bag of @BrooklynPopcorn Too good!	1416833924	536866507058581505	f	brooklynpopcorn
@joseph_damato Yes we are there every Wednesday! See you soon :)	1416833914	536866463685292032	f	brooklynpopcorn
Start the week off right with a Healthy LebaneseLunch! Join us in @DumboNYC on Jay & Water St until 3pm!	1416834856	536870414577061888	f	toumnyc
RT @_youhadonejob: No hipsters. http://t.co/0SzT9KcSnc	1416834241	536867836355174400	f	dubpies
Happy monday midtown we are on 46 & 6th today 11-3!  pre order 347-669-7385 or sweetchilinyc@gmail.com and skip the line!  thaietnamese	1416834760	536870012393619456	f	sweetchilinyc
The SchnitzCart will be on 55th & Broadway from 11:30-2:30pm slinging that warm schnitz. Preorder 212-470-7053 @randomfoodtruck	1416834894	536870575965487104	f	schnitznthings
Morning guys! Happy Monday:) truck will be on varick & Charlton from 11:30-2:30pm. Stop by for lunch! Preorder 347-772-7341	1416834800	536870180820107264	f	schnitznthings
It's MadMapleMonday & were at it again with some Pulled Pork Sliders to kick start your taste buds! FARM2TRUCK http://t.co/H0EnkYiS16	1416834085	536867181045506049	f	snowdaytruck
@danaboodle Purple & Orange!	1416836553	536877536081625088	f	thesteelcart
FREE DONUT WITH ANY PURCHASE TODAY!\n(Because we love you lots and lots)\n\nParked on 48th/6th 8:30-3:00\n\nTODAYS... http://t.co/N2SqbFFf3f	1416836216	536876122244648960	f	veganlunchtruck
PieTruck is @dumbolot today - 11am to 2.30pm. RT this, show Brian on truck, get a DUB Combo. (3 only) http://t.co/HFfZ6xqVNA	1416836752	536878369527590912	f	dubpies
50th Street btwn 6th and 7th Avenue! Preorders call 646-543-BIGD	1416837687	536882292053250049	f	bigdsgrub
fresh curries @47 street between Park N Lex Curry King authentic flavors N Bites	1416838434	536885423050481664	f	mausamnyc
Please RT:\n\nFREE DONUT WITH ANY PURCHASE TODAY!\n(Because we love you lots & lots)\n\nParked on 48th/6th 8:30-3:00\n\n@MeatlessMonday	1416838406	536885306268876800	f	veganlunchtruck
RT @maysoonzayid: Me on @AriseTV with the fabulous @RainPryor & yummy @SnowdayTruck :) Watch the whole show & catch me at 16 min mark! http...	1416839387	536889420159680512	f	snowdaytruck
Brighten up your Monday with some empanadas! The truck is located on Varick St between between Charlton & King http://t.co/dBJt5PB3lW	1416840072	536892294767448064	f	nuchasnyc
PieTruck is  @ Jay St. & Water St., Dumbo, Brooklyn - we're there from 11am to 2.30pm http://t.co/TM8S4jgNDY	1416839470	536889767670337536	f	dubpies
Gobble gobble Week Mtbll Lovers. The Mtbll  will be visiting family all week. We will be back next week. Enjoy your day. 	1416839535	536890039544709120	f	mtblls
Bessie's in LIC, 44th & Jackson. Call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always @houstonhallnyc	1416839414	536889534210793472	f	milktrucknyc
Off the Road today - Email us for your catering needs!: OldTraditionalPolishCuisine@yahoo.com	1416840115	536892472828641280	f	polishcuisine
Lunch 2day @ 52nd st b/t 6th & 7th av. Burger of the week THE PLOUGHMAN. Preorder 9172929226 midtown	1416840318	536893326776352768	f	fritesnmeats
Happy Monday NYC! Start this short work week off right, get a lobster roll for lunch! BigRed is on the streets today at 53rd & Park!	1416840883	536895696654598144	f	lobstertruckny
Caught a break from early onset winter! Come celebrate on 52nd & 6th ave!	1416841188	536896974608683008	f	domotaco
RT @EinatAdmony: @TaimMobile http://t.co/Uci1uWUK6m	1416840477	536893990965350400	f	taimmobile
MSG back at it on 46th & 6th ave today!	1416841987	536900324649598976	f	mooshugrill
Thankful for dope fans:) 53rd & park today!	1416841296	536897427153096705	f	biandangnyc
@downtownlunch we are on water and old slip today. Come down and get your yumyum on today	1416841681	536899043440750593	f	hibachiheaven
Front & Jay Monday with Split Pea & Rustic Chicken Soup. @DUMBOFoodTrucks	1416841612	536898751068405760	f	thesteelcart
Midtown lunch at Langos Truck 52nd. street bet 6-7th.Ave(closer to 6Ave) till 2:30pm	1416842375	536901952471576577	f	langostruck
RT @dumbolot: Welcome back @dubpies! Lot faves @ToumNYC and @MexicoBlvd on Jay and Water too!	1416842386	536901999489716224	f	toumnyc
RT @dumbolot: Welcome back @dubpies! Lot faves @ToumNYC and @MexicoBlvd on Jay and Water too!	1416842927	536904268503347200	f	mexicoblvd
Today November 24 we are on Hanover Sq serving warm soup and lunch from 11:30 until 3:30	1416842347	536901836754923520	f	schnitzi1
@DiSOSNYC: Lunch today 47th bet park and lex.\n\nCall in orders: 917-756-4145	1416843235	536905559099056128	f	disosnyc
Lunch today 47th bet park and lex.\n\nCall in orders: 917-756-4145	1416843174	536905306698416128	f	disosnyc
Lunch today at 47th & Park!	1416843593	536907060953489410	f	korillabbq
Buenos dias Dumbo! taquiza @MexicoBlvd @dumbolot Water&Jay	1416843129	536905115232636928	f	mexicoblvd
@holyshityouguys Just issued refund. Had you checked in for some reason & charge went to your wallet on accident. Sorry about that.	1416843469	536906541849657345	f	thesteelcart
The Grub Truck is back2back w/ the Khao Cart on 50th Street btwn 6th and 7th Avenue. Preorders call 646-543-BIGD http://t.co/oKBpBop16Y	1416844330	536910153942310912	f	bigdsgrub
Just a friendly reminder that the truck wont be out today. You can catch us tomorrow in Dumbo nyfoodtrucks	1416844480	536910780982366208	f	kimchitruck
Only a few days til Turkey Day - pregame for the big meal with our Thanksgiving cornbread sandwich at 1440 Broadway http://t.co/7Fwnb436Yf	1416844022	536908862755205120	f	mexicue
Located on Hudson and King streets	1416844195	536909586838880256	f	thepocketful
Monday's: starrettlehigh http://t.co/C4kHjvRm63	1416844538	536911027196403714	f	eddiespizzany
Monday's: starrettlehigh @ Starrett-Lehigh http://t.co/I2JNvKUusr	1416844534	536911010179739648	f	eddiespizzany
. @unionmarket thanks for the follow, love your work!	1416845593	536915452317159424	f	dubpies
Rain is gone and We are @TheSeaport today on John st.! Come by and lunch with us! ThaiFood NYC	1416845366	536914496682754048	f	mamuthainoodle
Peel off those layers, grab your coworkers and come see us at 52nd and 6th! 11:30-2:30	1416845015	536913026612748288	f	morristruck
Happy Monday! Hoping to have our spot on 45th & 6th ave today! (since the holiday week means we'll skip Wed)! We'll post soon!	1416845597	536915465701163008	f	thetreatstruck
33/park\nVarick  /king\nComeToTheCheeseYo	1416846307	536918445548634113	f	gcnyc1
awww shucks! RT @unionmarket: Thanks, @dubpies! We're fans of yours too :)	1416846037	536917313229193218	f	dubpies
Getting warm again..? Your fresh salads are being triple washed!! join us for a healthy one.the truck is @ 52& park.	1416845720	536915982858862594	f	etravaganza
Good morning NYC !! We r @46st btween 5th&6th ave. Try our ramen noodle soup,rice bowl,bibimbap burrito , dumpling as well. Plz come by. Thx	1416845763	536916162177953792	f	bobjotruck
Its the Carl's Steaks Monday PRE THANKSGIVING FEAST! Hudson st & king st grab your favorite cheesesteak \nGOT WHIZ? http://t.co/PLYT2ixQgN	1416845955	536916968314773504	f	carlssteaks
Its the Carl's Steaks Monday PRE THANKSGIVING FEAST! Hudson st & king st grab your favorite cheesesteak \nGOT WHIZ? http://t.co/BwC98teqYz	1416845895	536916716476182528	f	carlssteaks
Happy Monday falafel fans! Great weather. Great food. You couldn't ask for more on the corner of Water St & Broad.	1416846615	536919739206234112	f	taimmobile
Now serving lunch on 46th & 6th till 3! thaietnamese lunchtime feedme spicy nycfoodtruck midtown http://t.co/tI5Rzwo2EY	1416847464	536923298081542144	f	sweetchilinyc
Before your thanksgiving feast, grab a frank (or two) on Broadway at 58th St and Broadway at 57th St.	1416847171	536922070509453312	f	papayakingtruck
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

