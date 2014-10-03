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
-- Name: images; Type: TABLE; Schema: public; Owner: Pepp; Tablespace: 
--

CREATE TABLE images (
    id text NOT NULL,
    suffix text NOT NULL,
    visibility text NOT NULL,
    twitname text NOT NULL,
    menu boolean
);


ALTER TABLE public.images OWNER TO "Pepp";

--
-- Name: locations; Type: TABLE; Schema: public; Owner: Pepp; Tablespace: 
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


ALTER TABLE public.locations OWNER TO "Pepp";

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: Pepp
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO "Pepp";

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Pepp
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: sitestats; Type: TABLE; Schema: public; Owner: Pepp; Tablespace: 
--

CREATE TABLE sitestats (
    "time" integer NOT NULL,
    uptown integer NOT NULL,
    midtown integer NOT NULL,
    downtown integer NOT NULL,
    brooklyn integer NOT NULL
);


ALTER TABLE public.sitestats OWNER TO "Pepp";

--
-- Name: subs; Type: TABLE; Schema: public; Owner: Pepp; Tablespace: 
--

CREATE TABLE subs (
    id bigint NOT NULL,
    regex text NOT NULL,
    replacement text DEFAULT ''::text
);


ALTER TABLE public.subs OWNER TO "Pepp";

--
-- Name: subs_id_seq; Type: SEQUENCE; Schema: public; Owner: Pepp
--

CREATE SEQUENCE subs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subs_id_seq OWNER TO "Pepp";

--
-- Name: subs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Pepp
--

ALTER SEQUENCE subs_id_seq OWNED BY subs.id;


--
-- Name: trucks; Type: TABLE; Schema: public; Owner: Pepp; Tablespace: 
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


ALTER TABLE public.trucks OWNER TO "Pepp";

--
-- Name: truckstats; Type: TABLE; Schema: public; Owner: Pepp; Tablespace: 
--

CREATE TABLE truckstats (
    id text NOT NULL,
    "time" integer NOT NULL,
    street text NOT NULL,
    region text NOT NULL,
    location text NOT NULL
);


ALTER TABLE public.truckstats OWNER TO "Pepp";

--
-- Name: tweets; Type: TABLE; Schema: public; Owner: Pepp; Tablespace: 
--

CREATE TABLE tweets (
    contents text NOT NULL,
    "time" integer NOT NULL,
    id numeric(20,0) NOT NULL,
    retweeted boolean NOT NULL,
    twitname text NOT NULL
);


ALTER TABLE public.tweets OWNER TO "Pepp";

--
-- Name: users; Type: TABLE; Schema: public; Owner: Pepp; Tablespace: 
--

CREATE TABLE users (
    id bigint NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    admin boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO "Pepp";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: Pepp
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "Pepp";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Pepp
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Pepp
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Pepp
--

ALTER TABLE ONLY subs ALTER COLUMN id SET DEFAULT nextval('subs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Pepp
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: Pepp
--

COPY images (id, suffix, visibility, twitname, menu) FROM stdin;
4fee068ce4b0f9bd2b4041f7	/UQwqaF9knSdh4LFRzAhnh7hcl6_dSjDTg1phtqTe_7Y.jpg	public	milktrucknyc	\N
5261c60411d21ab0209ad83c	/8160578_SqpG5TVwTTu2h7cWpWvihe-_P_-OHSYzoOgMHmImCHY.jpg	private	lobstertruckny	t
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
521cdb8011d2f79883b5be62	/36501880_zzNkJUOscINjy2aiwKSZEwjfQYJPjqmAsa6zS0dakp8.jpg	private	nuchasnyc	\N
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
5161e794e4b02525dbd064d7	/310577_h_ww6Za5XojCZcGVq7-gZluC_YvRnT1EOXY4hwV7KJ8.jpg	private	seoulfoodnyc	\N
51a6433d498e948f8c3dad83	/761163_Ii2oxDO3g277E-5xSX7jHBSSYMlc9UijYRHsbRIRBC8.jpg	private	seoulfoodnyc	f
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
516d8267498ecda7c1b1b85e	/3179158_Z2holAKb6kR-uU-1uPwUaWaseYuavn6zigr0DRIRJFo.jpg	private	schnitznthings	t
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
506f12efe4b0bb9551703ca6	/2219480_LuuyF3peyimVfdQvb7tj9V-FHAEA0z1KmaSfMf9vKkU.jpg	private	fritesnmeats	\N
4f832947e4b0cd6f644ef74a	/qCgaHGVJ9rFDkC5DFKEKLBBekoxb6PRDRfuWV7neue0.jpg	private	fritesnmeats	\N
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
52407581498e6271e84d0d20	/663291_BQuSIJb2d0ODso7gvZiRLuvYbp3sg4FwHG2u0kAwsmE.jpg	private	gcnyc1	\N
526fef71498e92d1ace459d9	/60805368_eCRrBwapYrNL8fM9tmIaLCfnlhQYb9ASU-ZkaR1Og54.jpg	public	mamuthainoodle	\N
5203bd51498ed50247ee01dd	/60805368_HlIeqCMjY2I5md2mzI5crKizc9wVPUZo_sBmC6zrPEA.jpg	public	mamuthainoodle	\N
51dd9efb498ebbc846c11c03	/13001992_b9dLXH02o0ZX8hyUZVtpgGW6sDyzAl23vmEl-0Hj0jY.jpg	public	itizyicecream	\N
501c284be4b07d0ab63e08be	/vQv8P8_hFNwHMmpR7k6-arr8zqYmmgoSG_aAPJuz-ws.jpg	public	itizyicecream	\N
51e83b4a498e0a1c64e62828	/26624_AGoljLki5SS-GJGKaAGB75mloHKRBkJ1Qj5BQCRP1_Y.jpg	public	itizyicecream	\N
521e9e4511d2d8ddc5c69dbd	/117715_r7cpzyXCpOthqHouR5gdqIMX8k0TZ2KWHFun5wh-EYk.jpg	public	valduccis	\N
5079a745e4b00277f33e4836	/34723233_tCoDnWhdhZj61xi_e00MNwJoK_UcfDXCQQ7Weat8pBM.jpg	public	valduccis	\N
525ee647498ef229c65969fe	/10045965_ptbEO58Zn5wDz6kgitvMVjFScmxSkkuHNbK-AguCXSM.jpg	public	thegreenradish1	\N
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: Pepp
--

COPY locations (id, display, matcher, region, lat, long, hood) FROM stdin;
1	20th & 5th	20th & 5th	mid	40.739680	-73.990847	Flatiron
2	26th between 11th & 12th	26th between 11th & 12th	mid	40.751356	-74.006822	Chelsea
3	36st & Broad	36st & broad	mid	40.751526	-73.987775	Garment District
4	32rd & Park	32rd & park	mid	40.745774	-73.982260	Murray Hill
5	33rd & Park	33rd & park	mid	40.746468	-73.981828	Murray Hill
6	37th & Broadway	37th & broadway	up	40.752200	-73.987543	Garment District
7	38th & Broadway	38th & broadway	up	40.752895	-73.987340	Midtown West
8	39th & Broadway	39th & broadway	up	40.753642	-73.987122	Midtown West
9	40th & Park	(40th & park|park & 40th)	up	40.750853	-73.978594	Murray Hill
10	40th & Broadway	(40th & broadway|broadway & 40th)	up	40.754333	-73.986901	Midtown West
11	41st Between 6th & Broadway	41st between 6th & broadway	up	40.754659	-73.985726	Midtown West
12	45th & 6th	45th & 6th	up	40.757425	-73.982273	Midtown West
13	46th & 6th	46th & 6th	up	40.757418	-73.982288	Midtown West
14	46th Between 5th & 6th	(46th between 5th & 6th|46 5 & 6)	up	40.756625	-73.980321	Midtown West
15	46th & Park	(46th & park|park & 46th)	up	40.754706	-73.975810	Midtown East
16	47th & Park	(park|47(th)?) & (47(th)?|park)	up	40.755332	-73.975305	Midtown East
17	47th Between Park and Lexington	47th between park & (lex|lexington)	up	40.754942	-73.974389	Midtown East
18	48th & 6th	48th & 6th	up	40.758650	-73.981341	Midtown West
19	48th between 6th & 7th	48th between 6(th)? & 7(th)?	up	40.759249	-73.982680	Midtown West
20	49th & 3rd	49th & 3rd	up	40.755254	-73.971262	Midtown East
21	49th Between 6th & 7th	49th between (6th & 7th|6 ?& ?7)	up	40.759904	-73.982359	Midtown West
22	50th Between 6th & 7th	50th between (6th & 7th|6 ?& ?7)	up	40.760400	-73.981444	Midtown West
23	51st between Park & Madison	51st between park & madison 	up	40.758212	-73.974371	Midtown East
24	51st & Park	51st & park	up	40.757830	-73.973477	Midtown East
25	52nd & 6th	52nd & 6th	up	40.761166	-73.979443	Midtown West
26	53rd & Park	53rd & park	up	40.759059	-73.972585	Midtown West
27	53rd Between Park and Lexington	53rd between park and lexington	up	40.758746	-73.971748	Midtown West
28	55th & Broadway	(broadway & 55th|55th & broadway)	up	40.764966	-73.982223	Midtown West
29	56th & Broadway	(broadway & 56th|56th & broadway)	up	40.765430	-73.982088	Midtown West
30	58th & Broadway	(broadway & 58th|58th & broadway)	up	40.767201	-73.981820	Midtown West
31	56th between 2nd & 3rd	56th between 2nd & 3rd	up	40.756639	-73.968762	Midtown East
32	70th & York	70th & york	up	40.765542	-73.954715	Upper East Side
33	71st & York	71st & york	up	40.766112	-73.954221	Upper East Side
34	116th & Amsterdam	116th & amsterdam	up	40.806734	-73.961037	Morningside Heights
35	116th & Broadway	116th & broadway	up	40.808079	-73.963993	Morningside Heights
36	Columbia	columbia	up	40.807371	-73.964404	Morningside Heights
37	Union Sq	union sq	none	40.735486	-73.991557	Union Sq
38	King & Varick	(varick|king) & (king|varick)	none	40.727889	-74.005495	Soho
39	Hudson & King	hudson & king	none	40.728086	-74.007317	Soho
40	Wall & Pearl	wall & pearl	none	40.705533	-74.007926	Financial District
41	Wall & William	wall & william	none	40.706363	-74.009531	Financial District
42	Hanover & Water	(hanover|water) & (water|hanover)	none	40.704089	-74.00900	Financial District
43	Hanover & Old Slip	hanover & old slip	none	40.704018	-74.008981	Financial District
44	Old Slip & Water	old slip & water	none	40.704038	-74.008965	Financial District
45	Fulton & Water	(fulton|water) & (water|fulton)	none	40.707424	-74.004114	Financial District
46	Starrett-Lehigh	starrettlehigh	none	40.751575	-74.006684	Chelsea
47	Fulton & Front	(fulton|front) & (front|fulton)	none	40.706914	-74.003792	Financial District
48	Fulton Between Front & South	fulton between front & south	none	40.706510	-74.003370	Financial District
49	John & Front	(john|front) & (front|john)	none	40.706382	 -74.004601	Financial District
50	30th & 7th	(7th & 30th|30th & 7th)	none	40.748471	-73.992487	Chelsea
51	Water & Old Slip	water & old slip	none	40.704081	-74.009010	Financial District
52	10 Hanover sq	10 hanover sq	none	40.704557	-74.009220	Financial District
53	7 Hanover sq	7 hanover sq	none	40.704557	-74.009220	Financial District
54	Dumbolot	dumbolot	bkl	40.703105	-73.986664	Brooklyn
55	Brooklyn Navy Yard	brooklyn navy yard	bkl	40.699282	-73.972583	Brooklyn
56	Jay & Front	(front|jay) & (jay|front)	bkl	40.702351	-73.986671	Brooklyn
57	Jay & Water	(water|jay) & (jay|water)	bkl	40.703075	-73.986617	Brooklyn
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Pepp
--

SELECT pg_catalog.setval('locations_id_seq', 57, true);


--
-- Data for Name: sitestats; Type: TABLE DATA; Schema: public; Owner: Pepp
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
-- Data for Name: subs; Type: TABLE DATA; Schema: public; Owner: Pepp
--

COPY subs (id, regex, replacement) FROM stdin;
1	\\.	 
2	-	
3	&amp;	&
4	oldslip	Old Slip
5	bway	broadway
6	at the corner of	and
7	(b\\/w|bet(?!w)|btwn|btw)	between
8	 \\/ 	 & 
9	\\/	 & 
10	 and 	 & 
11	55st	55th
12	 mad 	 Madison 
13	 street 	 
14	(@dumbolot)	dumbolot
15	@starrettlehigh	starrettlehigh
16	 ave 	 
17	 st 	 
18	 at 	 & 
\.


--
-- Name: subs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Pepp
--

SELECT pg_catalog.setval('subs_id_seq', 18, true);


--
-- Data for Name: trucks; Type: TABLE DATA; Schema: public; Owner: Pepp
--

COPY trucks (id, name, twitname, weburl, tweet, retweeted, lasttweet, lastupdate, type, about, foursquare, matcher, loc, matchmethod) FROM stdin;
deliheaven	Deli Heaven	deliheaventruck		@downtownlunch correction we are on king&varick today. The word of the day is amore for ur free upgrade. SoHo get ur deliheaven on	f	1392220340	1392220340	Deli	\N			\N	\N
miamifood	Miami Food Machine	miamimachinenyc	http://www.miamifoodmachinenyc.com/	RT @YouGotSmoked: Park Ave btw 33rd St and 32nd St from 11:00 to 3:00 today! New York Aged Cheddar Mac and Cheese! Delicious nyc http://t...	t	1389964561	1389964561	Mexican		514b53aee4b00c3e98ec25e9	\N	\N	\N
chipsy	Chipsy King	chipsykingny	http://chipsykingny.com/	Kasar truck is at union square\nBroadway and 16th street\nAll day until 8pm	f	1407255461	1407255461	Fries		51bb5c43498ee06e13d0d31f	\N	\N	\N
taim	Taim Mobile	taimmobile	http://www.taimmobile.com/	It's Thursday, so you know what to do. It's Taim for lunch on Varick/Vandam. Let's do this SoHo!	f	1412251382	1412251382	Mediterranean		4cf2c5321d18a143951b5cec	\N	\N	\N
blend	Blend	blend_express	http://blen02.wix.com/blendnyc	Hudson off Varick and charlton.   We here for all your dining services need be...	f	1409760568	1409760568	Latin Fusion		4fa94528e4b0f8fbf13317e6	\N	\N	\N
trucktotable	BistroShopp	trucktotable	http://bistrotruck.com/	55St & Broadway until 4pm. Let's goooo	f	1410046735	1407427421	Moroccan	\N		\N	\N	\N
latinkitchennyc	Latin Kitchen	latinkitchennyc	http://www.latinkitchennyc.com/	Goodmorning!! Today Thurs 10/2 11:30 pm - 3PM 47st between Lexington & Park aves NYC\nhttp://t.co/MPHGwjSFxE http://t.co/cTsfzS221l	f	1412262484	1412262484	Mexican	\N	53878518498ef00115dbdea1	\N	\N	\N
mikenwillie	Mike n Willie's	mikenwillies	http://www.mikenwillies.com	Happy Taco Tuesday!! South st seaport Front St. & Fulton St 12-8 ComeGetSome	f	1403394007	1402414859	TexMex		4f205f0ee4b0294b35a1178b	\N	\N	\N
mamak	Mamak	lovemamak	http://www.lovemamak.com/	hey guys we are @smorgasburg pier 2 @BrooklynBridge_  come come come! http://t.co/llBP6I0uKb	f	1410755739	1410708157	Asian		51c4cffa498ec876f564a0b4	\N	\N	\N
seoul	Seoul Food	seoulfoodnyc	http://www.seoulfoodnyc.com	Come to 51st street, between Park and Madison - it's lunch time!!	f	1392220033	1392220033	Asian		4e74afad88775d593d9a7eb5	\N	\N	\N
morris	Morris Grilled Cheese	morristruck	http://morrisgrilledcheese.com/	Ok! Just like a Monday only better, cause it's Thursday! Open at 52nd & 6th with all the cheesiness you know and love!	f	1412266581	1412266581	American		4e0e0b3caeb7a5b33ee5dac1	\N	\N	\N
vspot	Hit your V Spot	vspot_truck	https://www.facebook.com/VSPOT.TRUCK	47th and Park from 11:15am to 2:30pm !!	f	1412066274	1412066274	Vietnamese	\N	53c9479b498e2dfa7e205ff0	\N	\N	\N
eddiespizza	Eddie's Pizza	eddiespizzany	http://www.eddiespizzany.com/	Wednesday; 46th between 5th and 6th. Call ahead your order 917 439 7522 http://t.co/rkqUfnYjDh	f	1412179899	1412179899	Pizza		4c0cf412b4c6d13ae4850c30	\N	\N	\N
mexicoblvd	Mexico Blvd.	mexicoblvd	http://mexicoblvd.com	Good morning Dumbo! Salsa Roja, Salsa Verde, Salsa Picante, Salsa in your life! @MexicoBlvd @dumbolot Water&Jay	f	1412344704	1412258004	Mexican		4f4e55aee4b04c96fba5b149	\N	\N	\N
snowday	Snowday	snowdaytruck	http://snowdayfoodtruck.com/	.@laurenweberWSJ @csiSL (The Center for Social Innovation) is located in the @starrettlehigh building 601 West 26th Street, Manhattan	f	1412285188	1412266512	Comfort	\N	533ddd4a498e774b8250a69b	\N	\N	\N
palenque	Palenque	palenquefood	http://www.palenquehomemadecolombianfood.com	Even if it's raining Palenque it's ready to serve you the most tasty arepas in town! @UrbanSpaceNYC @Broadway between 40th st and 39th st!	f	1412262074	1412178982	Colombian Fusion		4e84f424dab45bbd2617dc62	\N	\N	\N
sweetery	Sweetery	sweeterynyc	http://sweeterynyc.com	Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIyYdw	f	1412336105	1412336105	Sweets		4a28d919f964a52056951fe3	\N	39	\N
wafelKastaar	Wafels & Dinges Kastaar	waffletruck	http://www.wafelsanddinges.com/	TRUCKS\nMomma truck @ Wall Street till 4:30pm\nKastaar @ Queens College till 10pm\n\nCARTS\nVedette @ 60th & 5th till 8pm	f	1412295738	1412172082	Belgian		4a416369f964a52036a51fe3	kastaar	\N	before
milktruck	Milk Truck	milktrucknyc	http://www.milktrucknyc.com	Bessie's at Wall &amp; William, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always @houstonhallnyc	f	1412343001	1412343001	American		4e823c0229c2dbb2b7043972	\N	41	\N
pocketful	The Pocketful	thepocketful	http://thepocketful.com/	Located on 49th between 6/7	f	1412263589	1412365420	Mediterranean		4db8bcd790a0e3f61d601888	\N	21	\N
brooklynpopcorn	Brooklyn Popcorn	brooklynpopcorn	http://brooklynpopcorn.com/	Hello 70th and York Ave. we are back and we have Cinnamon Toast Kettle Corn!!!!! We are cooking all our famous flavors fresh. See you soon!!	f	1412300264	1403197119	Popcorn!		514a0737e4b09c3e77279d83	\N	\N	\N
carpedonut	Carpe Donut	carpedonutnyc	http://carpedonutnyc.com/	We are open at 23rd and Park. Eat a dozen today!	f	1412248159	1412248159	Sweets	They only server one kind of donut here, the apple cider, but it's a pretty good one. They are fresh and still hot when you get them. They have donut ice cream sandwiches but you should know the entire thing is in the freezer so you will get a frozen donut as well.	5169892c498e0522481eea97	\N	\N	\N
paris	Paris Sandwich	parissandwich	http://www.parissandwiches.com/	In dumbo today again, Fronts and Adams 12pm. @DUMBOFoodTrucks	f	1412263803	1412263803	French/Vietnamese		519e4ed0498e4f27e64c177a	\N	\N	\N
mexicue	Mexicue	mexicue	http://mexicueny.com	Eating these sliders under an umbrella is like movie make-out scenes under waterfalls. \n\nCome get em at MadSqEats http://t.co/VxW4aWmiwh	f	1412287078	1410639912	Mexican		4c51a6a71c67ef3ba6b61ab9	\N	\N	\N
carls	Carl's Steaks	carlssteaks	http://carlssteaks.com/home/	It's @TheSeaport Thursday folks trucks all fixed  and ready to serve our famous Cheesesteaks Front st & john st till 4 GOT WHIZ?	f	1412345238	1412262248	American		51a78330498e3fc1f22d771e	\N	\N	\N
bobjo	BobJo	bobjotruck	http://www.bobjo.net	Hello NYC!! We r ready to serve at varick and king st. Now!! Plz come by and enjoy thank you very much!!	f	1412265377	1412265377	\N		4e3add0c88772c3bf12772da	\N	\N	\N
steaksncrepes	Steaks N Crepes	steaksncrepes	http://steaksncrepes.com	50 st bet 6 & 7 ave for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	f	1397096188	1374766188	American		50f44167e4b0af5bf46321ce	\N	\N	\N
yume	Yume Teriyaki	yumefoodtruck	http://yumeteriyakigrill.com/	Yume is on Hanover and Water today for lunch. Start the weekend the right way :).	f	1400251565	1400251565	Japanese	\N	530cdc14498ee06c95ab14e0	\N	\N	\N
polish	Old Traditional Polish Cuisine	polishcuisine	https://www.facebook.com/pages/Old-Traditional-Polish-Cuisine/315496671902708	Flatiron Flatiron FLATIRON - 22nd b/w 5th & 6th  - can't miss us! Classic Pierogitime	f	1412344175	1412267200	Polish		51435df4e4b0823a398ebc8a	\N	\N	\N
dels	Del's	delsnyc	http://instagram.com/delsnyc	We apologize for being MIA the past 2 days. We've been preparing for the hottest day of the week! Come find us at 21st & 5th Ave until 4pm	f	1410028765	1409149941	Sweets		519bb56b498ed2dfa950ace2	\N	\N	\N
craffels	Craffles	crafflesnyc	http://www.craffles.com/	Happy holidays!!!\nMake ur holidays sweet with our delicious crepe or waffles. Our location for today. Hunter college and union square.	f	1410645255	1388428190	Crepes		514e426ce4b05bcb261d910e	\N	\N	\N
grillwheels	Grill On Wheels	grillonwheelsny	#	Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00crazy chicken baby chicken lamb burger couscous	f	1412013484	1409929542	Kosher		51b0bf31498e9b68db75612c	\N	\N	\N
lobstertruck	Red Hook Lobster	lobstertruckny	http://redhooklobster.com/	Today is a perfect autumnal day to FallForLobster, RedHookLobster is at 40th & Broadway all day until 9:00!	f	1412266692	1412361094	\N		4dc597c57d8b14fb462ed076	\N	10	\N
elpaso	El Paso Truck	elpasotruck	http://elpasony.com/	Good afternoon twitters ;-) today we are at 97th and Columbus Ave, stop by get your Tacos burritos enchilada\nTacoTuesday foodtruck	f	1408483439	1408483439	Mexican	\N	523c911f04937624937304c5	\N	\N	\N
toastmonster	Toast Monster	toastmonsternyc	http://www.toastmonsternyc.com/	Toast Monster @UrbanSpaceNYC @GarmentDstrctNY till October 17. On Broadway between 40th and 39th st.	f	1412198040	1411270224	American		50ad1829e4b087613d696bc4	\N	\N	\N
shortys	Shortys	shortysnyc	http://www.shortysnyc.com	A healthy truck means a delicious lunch. Up & running at 47th and Park until 1:45pm Midtown FoodTruck... http://t.co/F9JxXkOH7U	f	1412345683	1412262788	American		4faea2cce4b08a88c5dc5d05	\N	\N	\N
tacobite	Taco Bite	tacobite	http://www.tacobite.com/	Today we are on\n47th St\nBet\nPark Av / Lexington Av	f	1406907223	1406907223	Mexican		503ba49ae4b0fad35eb7a8dc	\N	\N	\N
goburger	GO Burger	goburger	http://www.goburger.com	We're on 91st and Amsterdam for dinner tonight. See you soon!	f	1402176073	1398896034	American		4c06b3eccf8c76b0a4eb3a65	\N	\N	\N
crepestruck	Crepes Truck	thecrepestruck	https://www.facebook.com/thecrepestruck	Come ceck out the Brazzers promo truck in Time Square 48 & 7 ave today till 4pm. http://t.co/wUDdRIZpAh	f	1406998391	1406998102	Crepes		4dfb854918386e743d9869e3	\N	\N	\N
getstuffed	Momos & Buns	getstuffednow	http://www.chinesemirch.com	RT @GovIslandFood: 1/3. Only a few more days till Gov Island gourmet food market powered by @livefastgroup opens for the summer. @Getstuffe...	t	1408198481	1400698983	Chinese Fusion		4fa016cbe4b05d0fc11262c5	\N	\N	\N
mamuthai	Mamu Thai Noodle	mamuthainoodle	https://www.facebook.com/MamuThaiNoodle	Hello 17th&5th! Hope you had a nice weekend! Come by for lunch and tell us about it! Till 3pm	f	1412179992	1411998906	Thai		5126a10ae4b0af674c85f353	\N	\N	\N
itizy	Itizy Ice Cream	itizyicecream	http://www.itizy.com/	Likely our last three hours at Columbia this year! Come grab a scoop of your favorite flavor before it runs out!	f	1382307419	1382122482	Sweets		4fcbdcaae4b00a0e855124dd	\N	\N	\N
valduccis	Valduccis	valduccis	http://valduccis.com	Valduccis doesn't just have the pizza we have the best panini too! Wall&Front St	f	1412340740	1411057899	Pizza		4df7e1aad4c02ad734170b21	\N	\N	\N
yankeedd	Yankee Doodle Dandy's	usafoodtruck		Good morning nyc.  We're back on the streets for you.  Come and get that good ish at 47th and Park.\n We'll be tender slinging from 11-3.	f	1412264534	1410361826	American	\N	52b497e1498eed13ead2b84c	\N	\N	\N
freshhearty	Fresh and Hearty	freshandhearty	http://freshandheartynyc.com/	Get your Soup & Panini on with Fresh and Hearty! We parked on 46st btw 5th & 6th ave from 11am to 3pm. Call now 4 free delivery! @3474402467	f	1395241942	1390493878	Soup/Salad/Sandwich		51801f7a90e7374e46b6239f	\N	\N	\N
andysitalianice	Andy's Italian Ice	andysitalianice	http://andysitalianicesnyc.com/	Morning NYC - come find us today on 32nd and Park Ave from 11am- 5pm or down in UnionSquare afterwards until 8pm!	f	1412004206	1411741686	Dessert	\N	4df26c2bae609e69dd95d2fc	\N	\N	\N
eggstrav	eggstravaganza	etravaganza	http://www.eggstravaganzany.com/	\N	\N	1412261695	\N	Mexican	\N	4b15165ef964a52049a823e3	\N	\N	\N
taipanexpress	Taipan Fusion Express	taipanexpress		Good morning we are serving lunch at 46 st between 5&6ave from 11:30 to 3pm @FoodtoEat @midtownlunch @nystfood	f	1412268299	1408622100	Thai/Chinese/Indian	\N	532b1b92498ea6c0d1026802	\N	\N	\N
chefsamir	Comme Ci, Comme Ca	chefsamirtruck	http://www.chefsamirtruck.com	We are on 52st and park av!	f	1412177201	1412177113	Moroccan		4c3c85e3a9509c74b52e395b	\N	\N	\N
mactruck	MacTruck	mactruckny	http://MacTruckNYC.com	Good morning South St. Seaport. John St. & Front st. Today.	f	1412172687	1412172687	American	Looking to take a nap after lunch? This truck is great and the owner is incredibly friendly. Feel free to chat it up while you watch him prepare your food.  Not listed on the menu are the many condiments\\n you can get on your macaroni. The regular size is a good portion for a normal lunch.	50575ab8e4b04ed4f2197dac	\N	\N	\N
nuchas	Nuchas	nuchasnyc	http://www.nuchas.com	It's Humpday! We suggest you spend it with us ;) The truck is located on Varick St between Charlton & King St... http://t.co/hAAPnsC8c6	f	1412272014	1412173364	Mexican		4ebd2a9bb8f7b504a754c130	\N	\N	\N
sweetchili	Sweet Chili	sweetchilinyc	http://sweetchilinyc.com/	Come see us at our new spot on FULTON btw front and south street! Lunch 1130-3! #TGIF @TheSeaport #thaietnamese #sriracha #fries	f	1412346141	1412346141	Asian		51a8c802498e2165ca855a19	\N	48	\N
kimchitaco	Kimchi Taco	kimchitruck	http://kimchitacotruck.com/	@starrettlehigh looking fwd to seeing all of you today for lunch 11:30-2:30 nyfoodtrucks	f	1412267730	1412362950	Korean Fusion		4d6ee122b45b59417c6a6778	\N	46	\N
treats	The Treats Truck	thetreatstruck	http://www.treatstruck.com	!!! Fri, Oct 3rd 12-3:30 45th st & 6th ave, then 4:30-7pm 18th st & 7th ave!!!	f	1412278302	1412362315	Sweets		49e65021f964a52035641fe3	\N	12	\N
wingit	Wing'n It	wingnitnyc	http://www.wingnitnyc.com/	Out here on 23rd and 5th come and grab some wings for lunch today. We will be open from 10am to 3pm. See you guys at lunch.	f	1390923947	1387549355	American		519ffd2b498ededbeef3c073	\N	\N	\N
greenradish	The Green Radish	thegreenradish1	http://www.thegreenradish.com/	Quinoa Special,Today, 52&6,11-2, @ubs @midtownlunch @EatStTweet @OneGreenPlanet @DharmaYogaNYC @NewYorkObserver @WSJ http://t.co/zXD9Uetv1a	f	1412337250	1412260673	Vegan		5229feab11d2edde794d385c	\N	\N	\N
hh3	Habachi Heaven 3	hibachiheaven	http://www.hibachiheaven.com/	@midtownlunch HH3 is on 46st bet 5 & 6 AVe Come get ur YumYum	f	1412345318	1399476250	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	2	\N	two
wafelMomma	Wafels & Dinges Momma	waffletruck	http://www.wafelsanddinges.com/	TRUCKS\nMomma truck @ Wall Street till 4:30pm\nKastaar @ Queens College till 10pm\n\nCARTS\nVedette @ 60th & 5th till 8pm	f	1412295738	1412172082	Belgian		4a416369f964a52036a51fe3	momma	\N	before
schnitzel	Schnitzel & Things	schnitznthings	http://schnitzelandthings.com	The truck found a spot on 48th street between park and lex! ATTENTION. Truck is on 48th between park and lex!!! 11:30-2:30pm	f	1412261867	1412261867	German		4a6640b3f964a5204cc81fe3	(schnitztruck|the truck)	\N	contains
dubpies	DUB Pies	dubpies	http://www.dubpies.com/	PieTruck is at Grand Central - Park Ave & 47th - along with another food truck or five! Service: 11am to 2.30pm http://t.co/YKW1jXcORn	f	1412346572	1412361275	New Zealand meat pies	\N	4eb825a62c5b53141b78bfb6	\N	16	\N
shanghai	Shanghai Sogo	shanghaisogo	http://www.shanghaisogo.com/	TGIF Heading downtown old slip & water, ready by 11:30am.	f	1412272204	1412363312	Asian		5258369d498e13def2bef2cb	\N	44	\N
cinnamonsnail	The Cinnamon Snail	veganlunchtruck	http://www.cinnamonsnail.com/	Please RT:\n\nTWO TRUCKS OUT TODAY\n\n33rd/Park 9:00-3:00\n\n55th/Broadway 8:30-3:00\n\nbourbon crem brulee donuts FTW!\n\n http://t.co/ekVapXY5VZ	f	1412339942	1412339942	Vegan		4c263af6a852c9287537e66c	\N	5	\N
mausam	Mausam	mausamnyc	http://www.mausamnyc.com	RT @dumbolot: The sun is shining on @KorillaBBQ @mausamnyc and @mamuthainoodle on Jay & Water st!	f	1412339562	1412362471	Indian		50730eebe4b0f3224431dc5d	\N	54	\N
toum	Toum NYC	toumnyc	https://www.facebook.com/ToumNYC	It's #FoodTruckFriday near @TheSeaport on John &amp; Front St! Join us for lunch and dinner from 11am-8pm. #LebaneseEats	f	1412340816	1412340816	Lebanese		500eedb0e4b062ee00577957	\N	49	\N
pontirossi	Ponti Rossi	pontirossifood	http://www.pontirossifood.com/	Water and Old slip. We back in Wall Street. Today we will be serving only panini from 11:30 to 3pm. We sorry for inconvenience.	f	1412338495	1412361994	Italian	\N		\N	51	\N
mrnice	Mr Nice Guy	mrniceguytruck	http://mrniceguynyc.com	52nd and 6th we are out here for your Friday lunch experience.  Windows are up end your week off right with us the NiceGuys.	f	1412269542	1412363943	American		520bbbb211d26afae232ec59	\N	25	\N
korilla	Korilla BBQ	korillabbq	http://korillabbq.com	To make up for earlier this week, we're here Midtown!!! 47th & Park ready at 11:30!	f	1412094495	1412363728	Korean Fusion		4cc701aa01fb236ab070baba	\N	16	\N
bigds	Big D's	bigdsgrub	http://bigdsgrub.com/	10/3: The Grub Truck is serving your lunch today at 53rd Street and Park Ave. Preorders call 646-543-BIGD	f	1412343130	1412361104	Korean Fusion		4c968b907605199c2eaec2a3	\N	26	\N
lukeslobster	Luke's Lobster	nautimobile	http://lukeslobster.com/	These handsome adult men wanted to tell you to come to lunch at 46th & Park today. http://t.co/RaSTi6xgCZ	f	1412206840	1412361409	Seafood		4dc81239b0fb5556cd2f3023	\N	15	\N
neapolitan	Neapolitan Express	neaexpress	http://neapolitanexpress.com/	Spice up your life with our A Diavolo pizza at W116th & Broadway until 4PM today	f	1412171857	1412363710	Pizza		51c8864c498e0ac96c14433e	\N	35	\N
langos	Langos	langostruck	http://www.langostruck.com/	Hi come to get Your Traditional Langos at 47th.street bet Park &amp; Lexington Ave till 2:30pm enjoy your weekend	f	1412343883	1412343883	Hungarian	\N	537a883c498eb7fac064409f	\N	17	\N
phils3	Phil's Steaks	philssteaks	http://www.philssteaks.com	41st between 6th and Broadway for lunch on this phine Phil's Phriday! Steaks are sizzlin' 11-2, come thru!	f	1412345174	1412345174	American		4f15b382e4b0725660ea9f31	\N	11	\N
frites	Frites 'N Meats	fritesnmeats	http://www.fritesnmeats.com/	Lunch 2day @ 7 Hanover sq b/t water &amp; pearl st. Burger of the week THE GUACAMOLE BLAST. Preorder 9172929226 #fidi	f	1412345159	1412345026	American	This is a good burger but this truck is interesting because of the many toppings they carry and their burger of the week. 	4ae9d217f964a520bcb621e3	\N	53	\N
domo	Domo Taco	domotaco	http://www.domotaco.com	If you missed us at the seaport yesterday come get your fill of Domo Taco on Old Slip and Water st!	f	1412344406	1412344406	Asian Fusion		4ed90a2e77c8274efb746d83	\N	44	\N
mooshu	Moo Shu	mooshugrill	http://www.mooshugrill.com	Hey #GarmentDistrict! Check out #MSG on 38th &amp; Broadway today!	f	1412344295	1412344295	Chinese	Moo Shu grill is a slight twist on typical Chinese <a href="https://en.wikipedia.org/wiki/Moo_shu" target="_blank">moo shu</a> The three Moo Shus option is enough for lunch and you can pick and choose a different protein for each. In my opinion the chicken is the best but it is dark meat. </p><p>It's easy to order as there is one window for ordering and for picking up when your name is called.	52090e45498e5500a6bd41fb	\N	7	\N
funbuns	Fun Buns	funbunsnyc	http://j24f.com/funbuns/	Thanks to nicolescherzinger for stopping by http://t.co/8I6vGTbADC \n50th st between 6 / 7 ave midtown lunch . FREE Tea egg with any rice	f	1412308795	1412363960	Asian		4f8d9663e4b021137aa2bdde	\N	22	\N
gorilla1	Gorilla Cheese 1	gcnyc1	http://www.gorillacheesenyc.com/	G1- 46 5 / 6\nG2 47 / Park\n#meatball parm melts.....#yummy http://t.co/R8Z7AQwxr5	f	1412346216	1412346216	American		4dc2d3e352b1c1fb37f1e945	g1	14	before
schnitzelcart	Schnitzel & Things Cart	schnitznthings	http://schnitzelandthings.com	The SchnitzCart will finish off the week on 49th between 6th & 7th! 11:30-2:30! Fantastic schnitz weather out there:)	f	1412261867	1412362637	German	\N	4a6640b3f964a5204cc81fe3	(schnitzcart|the cart)	21	contains
mtblls	Mtblls	mtblls		TGIF Mtbll Lovers!!! The  is  stopped at 50th bet 6&amp;7 Aves. Come on by for your weekend fix 	f	1412345946	1412345946	Italian	\N	504fb7fde4b0bc88c3a6b614	\N	22	\N
biandang	Bian Dang	biandangnyc	http://www.biandangnyc.com/	It's all sunshine and #teaeggs here on 53rd &amp; Park today!	f	1412344515	1412344515	Taiwanese		4d712874722ef04d04160d9c	\N	26	\N
papayakingtruck	Papaya King	papayakingtruck	https://www.facebook.com/papayaking	Enjoy this day w lunch from the FoodTruck on Broadway at 58th St Have you tried our Pastrami filled Knish made w the finest @TheGabilaKnish	f	1412286860	1412361069	American	\N		\N	30	\N
steelcart	The Steel Cart	thesteelcart	http://www.thesteelcart.com/	On Front & Jay this fine Friday. Organic Lentil Soup on board. @DUMBOFoodTrucks	f	1412261659	1412362461	French		511d3abee4b0e188895f3697	\N	56	\N
gorilla2	Gorilla Cheese 2	gcnyc1	http://t.co/4ZDqfwSH5f	G1- 46 5 / 6\nG2 47 / Park\n#meatball parm melts.....#yummy http://t.co/R8Z7AQwxr5	f	1412346216	1412346216	American		4dc2d3e352b1c1fb37f1e945	g2	16	before
disos	DiSO's	disosnyc	http://www.disosnyc.com/	Disos open for lunch.. 48th bet 6 and 7 ave\n\nCall in orders to: 917-756-4145	f	1412342662	1412362939	Italian Sandwiches	These might be typical italian sandwiches but the ingredients are high quality. You need to get there early because the line can get long and they will run out of some breads. I believe the focaccia half is a normal portion for lunch while their half and hero sizes are pretty big.	519523d6498eeaa6200aad03	\N	19	\N
hh2	Habachi Heaven 2	hibachiheaven	http://www.hibachiheaven.com/	Jump start your weekend with your friends  with some hibachiheavenNYC at 46th & 6th!	f	1412345318	1412365398	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	1	13	two
\.


--
-- Data for Name: truckstats; Type: TABLE DATA; Schema: public; Owner: Pepp
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
-- Data for Name: tweets; Type: TABLE DATA; Schema: public; Owner: Pepp
--

COPY tweets (contents, "time", id, retweeted, twitname) FROM stdin;
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
RT @nycfoodtruck: 101 Best Food Trucks in America: http://t.co/bko2ir1aJ9 @sirmyers @TheDailyMeal w @SouvlakiTruck @SchnitznThings @TaimMob...	1411767392	515615930484002816	f	taimmobile
RT @tealn: First delivery with @TryCaviar and @TaimMobile to the @StumbleUpon NYC office. Addicted is an understatement. You made our week.	1411698651	515327610810023936	f	taimmobile
RT @Christofunky: @TaimMobile Happy new year! I love you :'(	1411660314	515166813257498624	f	taimmobile
. @Christofunky Taim is closed today and tomorrow for Rosh Hashanah. Our West Village location will open tomorrow at 3:00	1411660073	515165803763998720	f	taimmobile
RT @NewYorkcom: 10 Best Homegrown Restaurant Chains in NYC @xianfoods @DoughnutPlantNY @TaimMobile @LukesLobster @MightyQuinnsBBQ http://t....	1411653593	515138624573427712	f	taimmobile
RT @nicolebestard: Happiness: @TaimMobile parked outside! Perfect lunch to honor friends celebrating Rosh Hashanah today. Shana Tovah! http...	1411584229	514847688777793536	f	taimmobile
Get over the hump on 20th/5th. It's just what the doctor ordered...if your dr. ordered falafel, hummus &amp; a Date Lime Banana smoothie	1411569218	514784730819338240	f	taimmobile
RT @handrewcohen: Got @TaimMobile for lunch today &amp; they remembered my name.  #blessed	1411510844	514539891821391872	f	taimmobile
Try one of The Daily Meal's best food trucks in the nation today on 20th/5th.	1411485092	514431881677639680	f	taimmobile
RT @nycfoodtruck: 101 Best Food Trucks in America: http://t.co/aVofqV2ZUX @sirmyers @TheDailyMeal w @SouvlakiTruck @SchnitznThings @TaimMob...	1411476746	514396872208027648	f	taimmobile
RT @EinatAdmony: @thedailymeal has named @TaimMobile one of America's best #foodtrucks. Let's celebrate with some #falafel! http://t.co/uWZ...	1411412913	514129139398627329	f	taimmobile
Don't miss Chef @EinatAdmony at @nytaste, November 10th. 40 great restaurants, one night only:\nhttp://t.co/fCVJu2df8a	1411398582	514069031046086658	f	taimmobile
RT @zimsmz: @TaimMobile falafel looks so great. Thanks 2 @EatStTweet for showing us we don't have 2 fly 9000 miles to #israel to get great ...	1411257989	513479339170861056	f	taimmobile
RT @nycfoodtruck: 101 Best Food Trucks in America: http://t.co/yzbmroMvOv @sirmyers @TheDailyMeal w @SouvlakiTruck @SchnitznThings @TaimMob...	1411238556	513397830741135360	f	taimmobile
RT @eatzcateringco: This sabich sandwich @TaimMobile and views of #SanGennaro. #soho #nyc #streetfairs #festival #eeeeeats... http://t.co/CLs...	1411150989	513030548273782784	f	taimmobile
We're back in Brooklyn this Sunday at the @DUMBOArtsFest! Inspiring art, and equally inspiring falafel. #daf14	1411133876	512958773452111872	f	taimmobile
RT @lucyswope: legit thrilled to finally be working near a @TaimMobile location. doing terrible things to a falafel sandwich right now. #ta...	1411069455	512688571569168384	f	taimmobile
RT @jenniferpolland: @TaimMobile is the best falafel in #NYC RT @BI_TheLife: The best "cheap eats" in New York City http://t.co/cN09YCNwIG ...	1411069448	512688544176160768	f	taimmobile
RT @ciaEATS: God bless you @TaimMobile for parking on Varick today!	1411061029	512653231223095296	f	taimmobile
RT @lleibowitzz: my boss @aliciakennedy is the best boss because she plans in-office meetings based on @TaimMobiles schedule.	1411061023	512653204970934272	f	taimmobile
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
Its finally here...    Our last day =( we came to 55th and broadway for one last service. Thanks for a great season! #TreatYourself	1383233679	395936866157199360	f	blend_express
19th st and 5th ave RT @nay_60: @Blend_Express where are u guys today??	1383150783	395589173794832385	f	blend_express
Tomorrow it our last day!! Find us! We're on the corner of 19th st and 5th ave! Get it while u can and #TreatYourself	1383150765	395589097257189377	f	blend_express
Our season ending week! Today we are located on 55th and broadway! Come check us out! Not now but right now!	1382976806	394859462814871552	f	blend_express
Listen up! Blend truck is on the corner of 55th and broadway! Only 1 more week after this one =( hurry up and #TreatYourself	1382458468	392685393621291009	f	blend_express
55th and broadway!!! Come one come all!!	1382029993	390888242075418624	f	blend_express
Just me and Taylor @ Ridge Street http://t.co/54YOOVrEOP	1410046735	508398973460037632	f	trucktotable
I got mine before the rush http://t.co/4TbJIbbnBE	1409855061	507595034263175168	f	trucktotable
Check out Samsung Galaxy S5 16G Gold (Factory unlocked) #Samsung http://t.co/1mhPt01LWd via @eBay	1409444583	505873364171247616	f	trucktotable
Hi @ligayamishan This Yassir from Rustic LES. need to run something by you! Can you forward your email. Yassir@bistrotruck.com	1409153111	504650844084916224	f	trucktotable
Check out my listing on @eBay: http://t.co/txwBt9jjPQ via @eBay	1408365145	501345874119643136	f	trucktotable
55St &amp; Broadway until 4pm. Let's goooo	1407427421	497412775929737217	f	trucktotable
Happy Monday carnivores!!! \nIt's time to get the fix at Bistroshopp. Corner of 55St &amp; Broadway until 4pm. #fancy... http://t.co/WeLiNKW714	1407168197	496325511334088705	f	trucktotable
It's time for that #Merguez sandwich! Cart is open 55St &amp; broadway until 4pm. #Moroccan #StreetFood	1406736768	494515966018322433	f	trucktotable
#StreetEats #Fancy #Moroccan #StreetFood #Lunch 55St &amp; Broadway http://t.co/rOWG8hdSbi	1406649234	494148821547761664	f	trucktotable
#StreetEats #Fancy #Moroccan #StreetFood #Lunch 55St &amp; Broadway http://t.co/G30C42sRK1	1406649217	494148748138668033	f	trucktotable
  \n            \n         	1406579447	493856111725142016	f	trucktotable
Happy Monday... Cart is at usual corner 55St &amp; Broadway until 4pm. #fancy #moroccan #streetfood	1406561873	493782401760628736	f	trucktotable
First breakfast in 30 days. #EidMoubarak http://t.co/IUossTYjET	1406548404	493725909607006208	f	trucktotable
First breakfast in 30 days. #EidMoubarak http://t.co/uNhde7Ibmx	1406548402	493725899762589697	f	trucktotable
Shop is open tonight for deliveries &amp; take out until 11p. Bar available for eat in.	1406241074	492436875777671170	f	trucktotable
RT @AnthemSoda: #Couscous platter, kale, chicken, lamb sausage from @trucktotable http://t.co/zysvH6ItCB	1406238057	492424219566026752	f	trucktotable
RT @AnthemSoda: #AllNatural #FoodTruck @trucktotable 'fancy morrocan street food' http://t.co/7aCejMHXiL	1406238055	492424213064863744	f	trucktotable
A must have #fried #Cauliflower #nicebun #brioch COME &amp; GET IT. #FANCY #MOROCCAN #STREETFOOD 55St &amp; Broadway http://t.co/64LY7wSdOB	1406225660	492372224788426753	f	trucktotable
A must have #fried #Cauliflower #nicebun #brioch COME &amp; GET IT. #FANCY #MOROCCAN #STREETFOOD 55St &amp;... http://t.co/KwjKILPzeA	1406225658	492372215950610433	f	trucktotable
Hello Good Morning...!	1406118441	491922514118201344	f	trucktotable
RT @milktrucknyc: one of each? @Foodtruckgirl7 @mooshugrill @LATINKITCHENNYC @SweetChiliNYC @DomoTaco @fritesnmeats	1411744900	515521593813270528	f	latinkitchennyc
Goodmorning NYC!  Wall Street we are here! TGIF 9/26 11:30AM-2:30PM LUNCH IS SERVED! \nhttp://t.co/MPHGwjSFxE http://t.co/J1C8Ff5WCG	1411742321	515510777907011584	f	latinkitchennyc
GOODMORNING NYC! SORRY FOR LATE POST .TODAY WED 9/24 WE AT 55 WATER ST (OLD SLIP )WALLSTREET! \nhttp://t.co/MPHGwjSFxE http://t.co/vuD2wIzsPY	1411574549	514807091283099648	f	latinkitchennyc
http://t.co/MPHGwjSFxE\nTRUCK\nDATE: TODAY TUES 9/23\nTIME: 11:30AM-3PM\nLOCATION: 47TH ST BET LEXINGTON &amp; PARK AVES NYC http://t.co/g3FXCIfxlh	1411483643	514425802784788481	f	latinkitchennyc
GOODMORNING NYC!  HAPPY SUNDAY.. TODAY 9/21 FROM 12PM-6PM WE ARE LOCATED ON 37TH ST AND 11TH AVE NYC (CLIMATE MARCH ) http://t.co/QrEqBqiFDC	1411314668	513717071432392705	f	latinkitchennyc
RT @PontiRossiFood: Tomorrow join us for a great cause #climatemarch #PontiRossiNYC @LATINKITCHENNYC @hibachiheaven 37th and 11th ave.  h...	1411279468	513569428802641920	f	latinkitchennyc
GOODMORNING WALLSTREET NYC! TGIF 9/19 11:30 - 3PM WE ARE HERE!55 WATER ST(FRONT ST &amp; OLD SLIP)\nhttp://t.co/MPHGwjSFxE http://t.co/sYM3YyAHo0	1411137865	512975503738040320	f	latinkitchennyc
Goodmorning Midtown East NYC!  Today Thurs 9/18 location 47st Bet Lexington &amp; Park aves NYC\nhttp://t.co/MPHGwjSFxE http://t.co/Ddk5zbFzu8	1411053082	512619897940369408	f	latinkitchennyc
Goodmorning WALLSTREET NYC!  Today Wed 9/16 55 WATER ST NYC( side of Old Slip ) 11:30 -3PM http://t.co/MPHGwjSFxE http://t.co/gYgfo6v3pZ	1410966153	512255293263458304	f	latinkitchennyc
Goodmorning NYC! Today Mon 9/15 11:30am-3pm location 47st Bet Lexington &amp; Park aves NYC\nhttp://t.co/MPHGwjSFxE http://t.co/Xh5ubsMOeV	1410791961	511524676712284160	f	latinkitchennyc
TGIF!! TODAY FRI 9/12 LOCATION 55 WATER ST. ( SIDE OF OLD SLIP) WALLSTREET WE ARE HERE!!!\nhttp://t.co/aKlutnzu04 http://t.co/qQ7Vl8VfOe	1410535262	510448003652399104	f	latinkitchennyc
GOD BLESS AMERICA!  TODAY THURS 9/11 47ST BET LEXINGTON &amp; PARK AVE NYC \nhttp://t.co/MPHGwjSFxE http://t.co/YY6FoAv1Yu	1410442932	510060745003126784	f	latinkitchennyc
WALLSTREET GOODMORNING!  Today Wed 9/10 11:30am-2:30pm Location 55 Water St. (Old Slip) \nhttp://t.co/MPHGwjSFxE http://t.co/wI9h1t2nRA	1410360459	509714826378358784	f	latinkitchennyc
Goodmorning NYC! Today Tues 9/9 1130am-3pm 47st bet Lexington &amp; Park aves NYC\nhttp://t.co/MPHGwjSFxE\nJibarito time! http://t.co/7YWR59E3vy	1410273806	509351377328693248	f	latinkitchennyc
Goodmorning NYC!  Today Mon 9 / 8 1130am-3pm 47st bet Lexington &amp; Park aves NYC\nhttp://t.co/MPHGwjSFxE\nGREAT DAY!!! http://t.co/nGw7IJwYmw	1410188219	508992399511932928	f	latinkitchennyc
Wallstreet we are here!! TGIF FRI 9/5 / 55 WATER ST (OLD SLIP) \nhttp://t.co/MPHGwjSFxE\nTODAYS SPECIAL PASTA DE MAMI http://t.co/G946UHDOan	1409929823	507908609712619520	f	latinkitchennyc
TODAY THURSDAY SEPT 4TH 11:30AM- 230PM \n47TH ST BET LEXINGTON &amp; PARK AVES NYC\nhttp://t.co/MPHGwjSFxE\nAS CLOSE TO P.R. http://t.co/wq4FFYHGFq	1409840952	507535857738592256	f	latinkitchennyc
Goodmorning NYC!  Today Wed 9/3 location 55 Water st. ( Old Slip Wallstreet ) NYC \nhttp://t.co/MPHGwjSFxE\nGreat Day!! http://t.co/jL116zypU5	1409755960	507179373758533632	f	latinkitchennyc
Goodmorning NYC! Today Mon 9/2 11am - 3pm 26th st. Bet FDR DRIVE &amp; 1ST AVE NYC\nhttp://t.co/MPHGwjSFxE http://t.co/WTIEPuPToT	1409669039	506814799955910656	f	latinkitchennyc
@dayherna Hello... sorry we are off today.. we resume business back on tuesday... have a great labor day weekend	1409336081	505418273367023617	f	latinkitchennyc
Braised Beef Borito - Angus Brisket, Black Beans, Manchego Cheese and Siriacha Mole Sauce http://t.co/MgXZNmelWH	1403394007	480495409945923584	f	mikenwillies
Stay tuned, big and exciting changes coming our way...	1403381976	480444949012705281	f	mikenwillies
Big and exciting changes coming our way.  Stay tuned for the big reveal...	1403381850	480444418752004096	f	mikenwillies
Happy Monday!!!! A little late start due to a flat tire but we'll be open and ready to serve 2:15-8pm south... http://t.co/cDUv67RuyV	1402940145	478591772663107585	f	mikenwillies
Hello #DUMBO beautiful weather for #worldcup outdoor viewing @RooftopFilms @DUMBOBID Anchorage Pl and Water Street till 8pm	1402765766	477860374549504001	f	mikenwillies
RT @Sweet_Taters: Congratulations @call_me_symone! You win the $100 Trade Joe's gift for sharing your #sweetsonthestreet at @mikenwillies! ...	1402754454	477812928708493312	f	mikenwillies
@blusfynx @TribecaTaco thanks for your feedback	1402694379	477560957799890944	f	mikenwillies
Friday the 13th!!! We're not scared of a little rain, we are scared of not ending the week with a full belly... http://t.co/CLuSsEoUEC	1402670743	477461820211331072	f	mikenwillies
Happy Taco Tuesday!! South st seaport Front St. &amp; Fulton St 12-8 #ComeGetSome	1402414859	476388565639630848	f	mikenwillies
Beautiful day to end the week were at the #seaport today Water St &amp; Fulton St 12-8	1402069809	474941322055647233	f	mikenwillies
RT @Sweet_Taters: Celebrate the gorgeous day w/ @mikenwillies Sweet Potato Shroom Taco at Front St &amp; Old Slip, tweet a pic &amp; you could win ...	1401822600	473904452261666818	f	mikenwillies
Beautiful day!!! #FIDI today Front St and Old Slip slinging your favorite Tacos, Sliders, Burritos and Rice Bowls #comegetsome	1401807479	473841028777009153	f	mikenwillies
Beautiful Day at Liberty State Park for #vcpoloclassic @veuveclicquot   http://t.co/PYueUEw7XW http://t.co/Mr6xw2Vs8v	1401546007	472744336728535040	f	mikenwillies
RT @randomfoodtruck: Lunch at the office from @Chefsamirtruck @souvlakitruck @carlssteaks @CarpeDonutNYC @funbunsnyc and at Javits from @mi...	1401471548	472432032249704448	f	mikenwillies
RT @Sweet_Taters: Grab your Sweet Potato Shroom Taco at @mikenwillies at the @javitscenter today! Tweet a pic &amp; you could win a $100 GC #sw...	1401395649	472113686904340482	f	mikenwillies
We're at the @javitscenter today for the  @BookExpoAmerica with your favorites characters #BigbadBrisket #lilPiggie #Pea-Nocchio	1401374548	472025186091278336	f	mikenwillies
RT @GovIslandFood: Only 2 more days till we are back @Gov_Island with @SweetChiliNYC, @DiSOSNYC, @carlssteaks, @Getstuffednow, @MayhemAndSt...	1401368180	471998474871767040	f	mikenwillies
Thinking of those that have made the ultimate sacrifice for our country on this Memorial Day.  Thank you to all... http://t.co/gMrpRYtn7v	1401117086	470945310189957121	f	mikenwillies
Check out Melissa S.'s review of Mamak Cart on @yelp http://t.co/bAaKmO2oA8	1410755739	511372750435282944	f	lovemamak
hey guys we are @smorgasburg pier 2 @BrooklynBridge_  come come come! http://t.co/llBP6I0uKb	1410708157	511173179193454592	f	lovemamak
Light work, thanks everybody http://t.co/0bbzKaEfNY	1410457025	510119855937564672	f	lovemamak
Light work @Bumble http://t.co/0bbzKaEfNY	1410456869	510119200313323520	f	lovemamak
Check out Siya L.'s review of Mamak Cart on @yelp http://t.co/BfVbwDHAiu	1410431479	510012706816937984	f	lovemamak
@Chris_Quartly @smorgasburg OK, will be at N8th and Kent ave! See you	1410222875	509137756170514432	f	lovemamak
@Chris_Quartly so sorry we were not enough ppl to work on Sunday, therefore we couldn't make it to the market we will make it back next week	1410200912	509045639700021248	f	lovemamak
@Chris_Quartly @smorgasburg Please stop by again next week, we will make it up for u, sorry!!	1410183088	508970877883809792	f	lovemamak
@Chris_Quartly @smorgasburg employees called in sick last minute, I don't have enough hand to prep and serve on Sunday.	1410183078	508970835521331200	f	lovemamak
@jamesymills Hey James, employees call in sick unable to prep and serve on Sunday,   we will make it up next week for you, sorry!!	1410182918	508970164671750145	f	lovemamak
@i8and8	1410013249	508258524615704577	f	lovemamak
RT @usopen: .@rogerfederer does it! Down two sets, he comes back to defeat #Monfils 4-6, 3-6, 6-4, 7-5, 6-2. #usopen http://t.co/FaMDCa13Y4	1409889267	507738502860382208	f	lovemamak
RT @therealhanyik: @lovemamak LOVE the beef rendang - so tender and flavorful! So glad you guys are @smorgasburg	1408912702	503642493272211456	f	lovemamak
@urbushey hey there, we only do group office lunch on weekdays but you can grab us @smorgasburg on the weekend! Miss u all too	1408486305	501854057519407104	f	lovemamak
RT @TheUnusualFact: Sleeping next to someone you love not only reduces depression, but it helps you live longer, and makes you fall asleep ...	1408166991	500514754818244608	f	lovemamak
RT @smorgasburg: Fri Sept. 19, we're super-excited. RT @Gothamist: Nighttime Smorgasburg Coming To Central Park http://t.co/31eAQAFV95 @Sum...	1408043589	499997167852199938	f	lovemamak
Malaysian food is not just for Malaysians!! http://t.co/OdmBmvm7Hr via @lovemamak	1407986126	499756151710314497	f	lovemamak
RT @fritteringaway1: Seriously people! You have to get to @hesterstfair Amazing food &amp; Bev options on Sundays! @MooksNYC  @lovemamak @Might...	1407706986	498585353503391744	f	lovemamak
Mini golf @hesterstfair fun Sunday! http://t.co/O5JQjyd1S6	1407697069	498543761727975425	f	lovemamak
RT @INFILTRATENY: Our client @lovemamak was featured in the 101 Best Things in New York issue of @BRUTUS_mag. #malaysian #foodtruck http://...	1407696926	498543160336068609	f	lovemamak
@Allaboutnyshoes our pleasure!!!	1411772524	515637456998498305	f	milktrucknyc
RT @waffletruck: @Foodtruckgirl7 @milktrucknyc a great pairing!	1411772475	515637251335012354	f	milktrucknyc
RT @Foodtruckgirl7: The Bacon Cheddar Blue was amazing!! @milktrucknyc #grilledcheese #foodtruckfriday #foodtrucks #bacon #NYC http://t.co/...	1411764205	515602565036519424	f	milktrucknyc
RT @Foodtruckgirl7: It's @milktrucknyc and @waffletruck for my #foodtruckfriday #nycfoodtruck #NYCfoodtrucks #nycfood #lunch #FOODTRUCK htt...	1411754664	515562545844068352	f	milktrucknyc
RT @gomezdm: My dream is to see @milktrucknyc expand to NJ! Grease trucks, watch out; specialty food trucks invade Rutgers http://t.co/rZol...	1411754655	515562510699995136	f	milktrucknyc
@Foodtruckgirl7 	1411754627	515562389723709440	f	milktrucknyc
@susantorres35 Yasssss	1411751445	515549045918822400	f	milktrucknyc
one of each? @Foodtruckgirl7 @mooshugrill @LATINKITCHENNYC @SweetChiliNYC @DomoTaco @fritesnmeats	1411744562	515520173940686848	f	milktrucknyc
@Allaboutnyshoes nice!! thanks again for your patience.	1411742009	515509468411736064	f	milktrucknyc
RT @Foodtruckgirl7: It's #foodtruckfriday look @ @milktrucknyc @schnitznthings @bobjoTruck @fritesnmeats looking all delicious this week ht...	1411741966	515509289411424256	f	milktrucknyc
Bessie's at Wall &amp; William, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always @houstonhallnyc	1411738204	515493509743132672	f	milktrucknyc
@Allaboutnyshoes 53rd. did you go?	1411668986	515203185582305281	f	milktrucknyc
thanks!! @juaninakocher: @milktrucknyc amazing! Well done!	1411668945	515203016346324992	f	milktrucknyc
confirmed at 53rd btn mad &amp; park.	1411656655	515151467830059008	f	milktrucknyc
thanks. @joburgdave: @milktrucknyc congratulations. It's because the food is great	1411655554	515146850740207616	f	milktrucknyc
@itsMG we are SO sorry. UN traffic messed us up. looks like we will be at 53rd/mad 2day. will send out a tweet to confirm.	1411655525	515146727196991489	f	milktrucknyc
Bessie's at 53rd &amp; Madison, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always @houstonhallnyc	1411651802	515131111920267264	f	milktrucknyc
10K followers as of this morning!!! wow &amp; thanks &amp; wow. so cool &amp; so kind. 	1411645164	515103269065326593	f	milktrucknyc
@rachel_murphy it's wine o'clock somewhere.	1411581878	514837831702048768	f	milktrucknyc
@Allaboutnyshoes we are so sorry. UN traffic killed us today but we hope to be up there tomorrow and we'd like to buy you lunch.	1411581839	514837664529649664	f	milktrucknyc
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
Super eat Sunday...we are at the Corner of 67th &amp; Broadway in front of Apple Store, open for biz now-	1391356481	430006364795338753	f	seoulfoodnyc
Come and get it!!!\nWe are at 67th and Broadway outside Apple Store !	1391268060	429635500639408128	f	seoulfoodnyc
The sun is up an we are already to serve you for lunch!\nWe are at 51st between park and Madison....see ya real soon!	1391171021	429228490248826880	f	seoulfoodnyc
If loving you is wrong....eat!\nWe are at West 4th and Greene Street!!! Come on by and chow!	1391115690	428996417542053888	f	seoulfoodnyc
We are ready to feed you at lunchtime!! Just parked on 51st between Park Avenue and Madison Avenue	1391090268	428889788901371904	f	seoulfoodnyc
We just arrived for dinner time!! West 4th and Greene street	1391028368	428630161693487104	f	seoulfoodnyc
Don't forget- you can get a free ride home tonight with @lyft and code MORRISTRUCK	1411781495	515675083218882560	f	morristruck
#CheesyAzalea getting this thing going in a few minutes at #Pier97! See you there! #WereSoFancy @IGGYAZALEA	1411766988	515614237449019392	f	morristruck
No lunch today, but come check us out at Pier 97 for the last show of the season! @IGGYAZALEA	1411746911	515530029917548544	f	morristruck
Lunch in @DowntownBklyn today baby! Metrotech Commons at Bridge St. for some tasty cheese that'll warm you from the inside out!	1411657519	515155090228137984	f	morristruck
No lunch today, but good news! We're partnering with @lyft and provding $25 towards your first ride with them! Just use the code MORRISTRUCK	1411572913	514800228697120768	f	morristruck
Also, Happy Birthday Bruce @springsteen! #cheesinintheUSA	1411507138	514524348812914689	f	morristruck
Off the streets today and tomorrow, but look for us at #metrotech @DowntownBklyn on Thursday, and @DUMBOArtsFest all weekend!	1411484467	514429256957304833	f	morristruck
Ok, case of the Monday's, prepare to meet your cheesy demise. We're hangin out on 52 &amp; 6th from 11:45-2:30 today, cookin up your favorites!	1411398678	514069432822665216	f	morristruck
Another beautiful day for a #countyfair @queensfarm! We'll be slingin cheese from 12-4!	1411311894	513705435518763009	f	morristruck
No lunch today, but look for us @queensfarm #CountyFair all weekend!! And come by @gladyscaribbean for lunch, since you're hungry!	1411138939	512980007300644864	f	morristruck
RT @GreenBuildingNY: Cocktail hour bites in our courtyard with @morristruck Yummmm http://t.co/fya48xqtdV	1411138874	512979738202480641	f	morristruck
#cheese#cheese#cheese Truck at 51st&amp;Park, cart @DowntownBklyn #Metrotech! #cheeseeverywhere	1411052727	512618411088965633	f	morristruck
Off the streets today and tomorrow, back Thursday in #Midtown and @DowntownBklyn #Metrotech!	1410879417	511891494933114880	f	morristruck
OH MAN what a beautiful Monday! If this weather &amp; a grilled cheese at 52 &amp; 6th aren't the perfect start to your week, we don't know what is.	1410792321	511526185730576385	f	morristruck
BROOKLYN! Well be at @Beer4Beasts this Saturday @BellHouseNY, come &amp; support @HumaneSocietyNY. *http://t.co/KY9M1oKLXV for tix*	1410552889	510521937832189952	f	morristruck
Big weekend for #cheese! 2nite @DowntownBklyn #GroveAlley, Sat @sixpoint #BeerforBeasts &amp; NJ #Trucktoberfest, Sun @lordemusic #Pier97 #ttyl	1410547721	510500260477947904	f	morristruck
No #lunch today, but you can find us tonight @DowntownBklyn #GroveAlleyPaintNite 5pm-11pm!	1410534561	510445064599109633	f	morristruck
2x the cheese #Thursdays! Truck at 51st &amp; Mad, cart @DowntownBklyn Metrotech Commons! New #summersquash sandwich! #summerliveson	1410447789	510081117639417856	f	morristruck
Thanks for the love, @DumboNYC! We're off Tues &amp; Weds for the near future to open our new #brickandmortar in Crown Heights. See you soon!	1410378985	509792530742124545	f	morristruck
Hey @DumboNYC, hope you brought your appetites today! This will be our last Wednesday at Pearl &amp; Front for the next few weeks, so come eat!	1410360208	509713774539198464	f	morristruck
@downtownlunch correction we are on king&amp;varick today. The word of the day is "amore" for ur free upgrade. #SoHo get ur #deliheaven on	1392220340	433629653711212545	f	deliheaventruck
@downtownlunch DH is on varick&amp;charlton today. The word of the day is "amore" for ur free upgrade. #SoHo get ur #deliheaven today	1392217592	433618126148993024	f	deliheaventruck
@midtownlunch Today is the Day!! Grand Opening on Broadway &amp; 55st. Rotisserie chicken, pastrami @ corn beef sandwiches New York Style	1392131026	433255045355036672	f	deliheaventruck
@midtownlunch HH3 is on 46 st &amp; 6 Ave. HH2 is on Park Ave &amp; 33st. Word of the day is "Peyton" for your free upgrade. #midtown get ur #YumYum	1391178361	429259276079861760	f	deliheaventruck
Who does not lov FREE, if u know Sweetery u know we lov FREE 2. So 4 Nat. Coffee Day on Mon come 2 our mobile bake shop 4 a free cup of Java	1411750326	515544352794632192	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIyYdw	1411731306	515464577467703297	f	sweeterynyc
@LakesideBKLYN We will do our best, we can only spread just so much love around!	1411665143	515187069413376000	f	sweeterynyc
Today is a sad at SweeteryNYC, yesterday we put our very special intern on a plane back to Paris, Lyvia we miss you already!	1411665025	515186574813040640	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIyYdw	1411644907	515102190524846081	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIyYdw	1411558506	514739802231414784	f	sweeterynyc
Upon very special request the SweeteryNYC mobile bakery is heading north 4 the night 2 hang with the cast &amp;crew of ABC hit show MembersOnly	1411524062	514595330114203648	f	sweeterynyc
Great day 2day serving hundreds @HavasMedia SweeteryNYC's way of turning Tuesday into Sundea's 4 all!\nThanks 2the outstanding team @Gannett	1411511073	514540853583687680	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIyYdw	1411472105	514377409068425218	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIyYdw	1411385708	514015035069190144	f	sweeterynyc
Down.\nPlease tell me about tomorrow, times and what you would like to do.	1411220215	513320904433352705	f	sweeterynyc
Sweetery closes out a terrific week of events w/an appearance on the set of Eye Candy, what we can promise is that there is much more 2 come	1411161380	513074132838522880	f	sweeterynyc
Wait on line for 2 days 2buy iPhone 6 &amp;resell it, ambitious, Wait on the same line &amp;have Sweetery satisfy ur taste buds, well worth the wait	1411135654	512966230748450816	f	sweeterynyc
Hungry? SweeteryNYC is at The Soho Apple Store with @Chase to #FeedTheLine with free snacks, cone and get it!	1411135391	512965127327739904	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIyYdw	1411126507	512927865302552576	f	sweeterynyc
Hungry? Sweetery will b at The Soho Apple Store NYChere with @Chase to #FeedTheLine wi/free snacks. See you at  7A! #Lets hear it 4 Chase	1411114994	512879576243273728	f	sweeterynyc
The moment they have all been waiting for has arrived, thank  god it's Sweetery!\n#Got2GetMyTreats http://t.co/hffaf9iYV5	1411097170	512804817631068160	f	sweeterynyc
Unreal, line goes around the block @ 5Av Apple Store, there must b a couple of peeps waiting 4 the iPhone 6, can't all b waiting 4 Sweetery.	1411094872	512795179665719297	f	sweeterynyc
Waiting 4 your new iPhone? SweeteryNYC is here to #FeedtheLine with free treats, thanks to @Chase. Look out for us 5th Ave Apple Store @ 12a	1411094175	512792256474918912	f	sweeterynyc
RT @scoopstweet: @sweeterynyc that's the kind of line I'd join!	1411084175	512750311862071297	f	sweeterynyc
RT @YouGotSmoked: Park Ave btw 33rd St and 32nd St from 11:00 to 3:00 today! New York Aged Cheddar Mac and Cheese! #Delicious #nyc http://t...	1389964561	424168229477826560	f	miamimachinenyc
RT @YouGotSmoked: Check us out today @dumbolot @DUMBOFoodTrucks from 11:00 to 3:00! #slowsmokedpork #applewoodsmokedchicken	1389793800	423452005034901504	f	miamimachinenyc
RT @YouGotSmoked: Today we are on Water St and Wall St from 11:00 to 3:00!	1389374143	421691837116866560	f	miamimachinenyc
RT @YouGotSmoked: Check us out today on Wall St and Water St in #fidi from 11:00 to 3:00! #followthesmoke See you then!!! http://t.co/6LUz8...	1389286859	421325742107283456	f	miamimachinenyc
RT @YouGotSmoked: We are back! @dumbolot 11:00 to 3:00!	1389186845	420906253154799616	f	miamimachinenyc
RT @YouGotSmoked: Ready to get smoked with our new menu? http://t.co/4ehQVCO40w	1389037615	420280336954974208	f	miamimachinenyc
RT @YouGotSmoked: Had to move to Varick At and Vandam St sorry!	1387560066	414083048008060930	f	miamimachinenyc
RT @YouGotSmoked: #tribeca get ready to be smoked! ( by BBQ that is ) check us out today for the first time on Varick St and Charlton St fr...	1387549231	414037602782969856	f	miamimachinenyc
RT @YouGotSmoked: Attention #fidi we are back! Wall St and Water St from 11:30 to 2:30 with some Amazing BBQ! See you then!	1387470752	413708435767955458	f	miamimachinenyc
RT @YouGotSmoked: Shredded Barbecue Skirt Steak - Arugula / Tabasco Onion Strings / YGS Signature BBQ Sauce / #comeandgetit http://t.co/RrW...	1387470746	413708413974376448	f	miamimachinenyc
RT @DUMBOFoodTrucks: Welcome! RT @dumbolot: Lot vets @DomoTaco and @shortysnyc on jay &amp; water along with a new addition! Welcome to the lot...	1387377444	413317076561186816	f	miamimachinenyc
RT @YouGotSmoked: Smoked Portobello Mushroom-Texas Toast/Arugula/Tomato/Caramelized Onions/Sliced Avocado/Sweet and Smokey Vinaigrette http...	1387317717	413066561625546752	f	miamimachinenyc
RT @YouGotSmoked: @DUMBOFoodTrucks Here we come! Check us out for lunch tomorrow @dumbolot for some bad a#% BBQ! See you then!!	1387317706	413066516272513024	f	miamimachinenyc
Catering now available! 908 591 4972 miamifoodmachine@gmail.com http://t.co/WujQdHZOUx	1385561777	405701616080531456	f	miamimachinenyc
Contact us to Cater your next Party or Event! Check out our Menu! #cubanfoood miamifoodmachine@gmail.com 908 591 4972 http://t.co/9Gg04o4jKG	1385053469	403569615844147200	f	miamimachinenyc
Check us out on @EatStTweet tonight! 8:00 PM Cooking Channel! Formerly known as @bongobros #deliciouscubanfood #miamifoodmachine	1385053167	403568350233907200	f	miamimachinenyc
Check out our Brand New Catering Menu! http://t.co/HRxxJhtMuV http://t.co/PRqbwOl0cP	1384525987	401357198309486592	f	miamimachinenyc
RT @bongobros: Catering Now Available! Call 908 591 4972 or Email miamifoodmachine@gmail.com for details http://t.co/vsHPD5PCs2	1384452084	401047226291855360	f	miamimachinenyc
@jefflac @vendyawards @nydosas @solberpupusas @halloberlin10th	1410645230	510909245081280512	f	crafflesnyc
Catering Now Available! Call 908 591 4972 or Email miamifoodmachine@gmail.com for details http://t.co/gjyuYENKg8	1384441885	401004449772347392	f	miamimachinenyc
Catering Now Available! Call 908-591-5972 or Email miamifoodmachine@gmail.com for details http://t.co/npC7ELfEYw	1384373440	400717369690968064	f	miamimachinenyc
Located on 49th between 6th and 7th	1411571903	514795991053377536	f	thepocketful
Located on 50th between 6th and 7th	1411486327	514437061752135680	f	thepocketful
Located on Hudson between KING and Houston	1411400328	514076355265585152	f	thepocketful
On 49th between 6th &amp; 7th	1411141317	512989984564199424	f	thepocketful
Located on 50th between 6th and 7th	1411054205	512624609133592577	f	thepocketful
Located on 53rd between PARK AND MADISON	1410962967	512241930487726080	f	thepocketful
Located DOWNTOWN today at Water street and Hanover Sq.	1410876880	511880855443472385	f	thepocketful
Located on Hudson and King today	1410791153	511521289052639233	f	thepocketful
On 50, between 6 and 7	1410536751	510454248765931520	f	thepocketful
Located on 49th between 6th and 7th	1410449973	510090275046559744	f	thepocketful
Located on 53rd between PARK AND MADISON	1410359669	509711513587040257	f	thepocketful
On 52 and 6th avenue	1410279122	509373673506340864	f	thepocketful
Located on HUDSON AND KING!	1410186270	508984225409032192	f	thepocketful
On 52nd and 6th	1409929623	507907769924878336	f	thepocketful
On 50th between 6th and 7th	1409845606	507555377257656321	f	thepocketful
On 49th between 6th and 7th	1409758081	507188272314204161	f	thepocketful
On 52nd and 6th!	1409672205	506828082314231809	f	thepocketful
Located on 52nd and 6th avenue	1409327281	505381365052080128	f	thepocketful
On 50th, between 6th and. 7th	1409240468	505017244485947392	f	thepocketful
On 53rd, between Park and Madison	1409153025	504650480770109441	f	thepocketful
#Happy #Friday #beautiful #day @Dumbolot #kick #off U'r #weekend with the #Curry #King #Delicious #Curries &amp; #bites	1411733518	515473853930147840	f	mausamnyc
#Dumbolot #best #authentic #Indian #Cuisine #Curry #King #1 #great #day #mughlai #entree &amp; #many #other #curries #mango #lassies #samosas	1411641318	515087137289424896	f	mausamnyc
#still #beautiful #weather #left #before #winter #Curry #King #available #book U'r #private #events #regardless of #size	1411599652	514912378425589761	f	mausamnyc
#Great #extravaganza #today #Sept #24 @Overpeck #Park #come #out in #large #numbers #best #lunch #Curry #King #India's #greatest #flavors	1411559503	514743980815159296	f	mausamnyc
#enjoy the #beautiful #day @South #Street #Seaport with #Curry #King #tastiest #authentic #indian #cuisine	1411465792	514350930813128705	f	mausamnyc
#Happy #Monday @47 #street bet #Park N #Lex #delicious #fresh #curries #start U'r #week with the #King of #CURRY	1411392180	514042179795173376	f	mausamnyc
#great #day @Grand #Army #Plaza #enjoy the #best #authentic #savory Indian #Curries with the #curry #King #until #5pm	1411320223	513740367317839872	f	mausamnyc
#beautiful #day @South #Street #Seaport #delicious #Indian #Cuisine #with \n#Curry #King don't #miss out!!!	1411225624	513343591033221121	f	mausamnyc
Happy #Friday from #Curry #King @Dumbolot #enjoy the #BEST #with the #greatest #Indian #Authentic #flavors #spice to meet #all #tastebuds	1411130444	512944377178497024	f	mausamnyc
#Dumbolot #Curry #King #savory #Indian #CURRIES #Bites #samosas #kati #rolls  #mango #lassie #lots of #delicious #flavors to #choose from	1411047084	512594740458434560	f	mausamnyc
#beautiful #sunny #day #enjoy the #Curry #King @52nd #street &amp; #6 #Avenue #Mughlai #entree #mouthwatering #samosas	1410956643	512215405234905088	f	mausamnyc
RT @MyWeenieWagon: Just added to #FoodTruckWednesdays event  #OverpeckPark Indian Food!!! @mausamnyc CurryNBites! don't miss it folks!! htt...	1410888014	511927554077655040	f	mausamnyc
#great #Curry for #today's #weather #Vindaloo the #best #indian #authentic #spices only with the #King @South #Street #seaport	1410874296	511870013976743937	f	mausamnyc
#Sunny  #Monday @47 #Street #bet #Park N #Lex #delicious #authentic #Indian #flavors #enjoy the #best	1410789062	511512519777607680	f	mausamnyc
Don't forget to get best curries in nj at Mausam Secaucus @inkedoutnj #tattoo #spicyfood	1410623511	510818147021357056	f	mausamnyc
#Happy #Friday &amp; #weekend #starts @Dumbolot with #Curry #King #great for #savory #spicy #authentic #indian #curries &amp; #bites	1410525801	510408320348200960	f	mausamnyc
#still #beautiful #weather #left to #book U'r #company #picnic #plus #private #events with the #Curry #King	1410478154	510208477562560512	f	mausamnyc
#mughlai #savory #entree #great for #today @Dumbolot #enjoy  #many #other #delicious #curries &amp; #bites	1410440785	510051739580370944	f	mausamnyc
#beautiful #day @52nd #street &amp; #6 #Avenue #enjoy #savory #korma &amp; #many #other #delicious #curries	1410353363	509685065257734144	f	mausamnyc
#great #day for #Vindaloo #delicious #curries @51st #Street &amp; #Park #Avenue. #savory #samosas #kati #rolls	1410266830	509322116957614080	f	mausamnyc
RT @trustytruck: In good company tnite @DUMBOArtsFest 6-9ish with @ToumNYC  at end of main st. Come grab some grub! http://t.co/jFFWJxPQeo	1411777924	515660105514491906	f	toumnyc
It's #FoodTruckFriday near @TheSeaport on John &amp; Front St. Join us for lunch until 3pm then were off to the @DUMBOArtsFest from 5pm-9pm!	1411737434	515490280985088000	f	toumnyc
Don't let the rain stand in your way of a yummy lunch! Pre-order at 917-TOUM-350 &amp; pick up on Jay &amp; Water St. in @DumboNYC #LebaneseLunch	1411650539	515125812774076416	f	toumnyc
Obey your tummy... it wants #LebaneseEats! Join us for a kafta platter near @TheSeaport on John &amp; Front St until 8pm! http://t.co/Sqtgod4AGk	1411564388	514764472272306176	f	toumnyc
@DanHugo Hope you enjoyed 	1411518904	514573699270574080	f	toumnyc
It's a perfect day for a #LebaneseLunch in #MidtownWest! Join us on 46th btwn 5th &amp;  6th until 3pm!	1411480336	514411931579740160	f	toumnyc
@Falafel_Junkie we are just one truck at the moment, however we have been to NJ for a couple of events.	1411395985	514058136324673537	f	toumnyc
RT @dumbolot: We got @dubpies @ToumNYC and @MexicoBlvd today!	1411395926	514057889263419392	f	toumnyc
Hello @DumboNYC! We've got all the #LebaneseEats you need to get through your Monday blues! Join us for lunch until 3pm on Jay &amp; Water St!	1411393003	514045630168444928	f	toumnyc
@Falafel_Junkie @makerfaire Happy to hear that! Thanks for stopping by :)	1411340461	513825252166868992	f	toumnyc
@Falafel_Junkie @makerfaire Awesome! How did you like it?	1411334508	513800284540510208	f	toumnyc
@DSKinsel @makerfaire You are so very welcome!	1411334487	513800196145573888	f	toumnyc
Day 2 of the greatest show on earth! Join us for #SundayFunday at the @makerfaire at the NY Science Hall in Queens until 6pm! #LebaneseEats	1411306056	513680946869338112	f	toumnyc
@ParisSandwich: Dumbo, we're on fronts and Adams today at 12 pm @DUMBOFoodTrucks	1408374337	501384426673434624	f	parissandwich
We're at the greatest show in the world! The @makerfaire at the NY Science Hall in #Queens until 7pm! #LebaneseEats http://t.co/K6d13Hceh4	1411222990	513332543337533440	f	toumnyc
RT @FoodtoEat: What's a #shawarma? Find out from @ToumNYC, which has delicious flavors. Preorder online for pickup: http://t.co/2zpn4V84VN	1411142271	512993984688709632	f	toumnyc
It's #FoodTruckFriday on John &amp; Front St. @TheSeaport. A chicken #shawarma will satisfy your every #Lebanese craving! http://t.co/bsM108Ahk2	1411131508	512948839901564929	f	toumnyc
RT @FoodtoEat: Gorgeous day to be out at #Dumbo, Get some #LebaneseFood from @ToumNYC! Preorder online for pickups: http://t.co/wqAxeiLoBo	1411054903	512627536162222080	f	toumnyc
RT @DUMBOFoodTrucks: @ToumNYC You guys always post the best alluring food pics!	1411053190	512620350329610240	f	toumnyc
@DUMBOFoodTrucks teehee we try 	1411053180	512620310626328577	f	toumnyc
What's for lunch @DumboNYC? Grab tasty #LebaneseEats on Jay &amp; Water St. from 11-3pm today. #vegan platter #brooklyn http://t.co/PIHd6UEAco	1411045798	512589348471308288	f	toumnyc
RT @CG_DigitalMedia: Some of our clients for DG Media Coord. &amp; Community Mgmt include #NYC Accessorie's On-Line store @giftshoppenyc &amp; Food...	1411753325	515556929402572801	f	hibachiheaven
Jump start your weekend with some #hibachiheavenNYC - we are now open and serving on 46th &amp; 6th and 33rd &amp; Park	1411743709	515516597575094272	f	hibachiheaven
RT @steveorefreshed: @hibachiheaven 46th &amp; 6th with the @henryfong take over #tomorrowworld #EDM come join the fun @HibachiJoe  #Fridaymadn...	1411739102	515497276694093824	f	hibachiheaven
Happy Friday NYC! We are prepping to serve you lunch on 46th &amp; 6th and on 33rd &amp; Park. Stay tuned!	1411739027	515496961001410560	f	hibachiheaven
RT @henryfong: @steveorefreshed @hibachiheaven @HibachiJoe you guys rock!!! 	1411728253	515451768969650176	f	hibachiheaven
RT @camGarcia__: http://t.co/dDMna8xrLT\n #comingsoon  //huge thanks to @_____unkwn for the graphic work.	1411668704	515202003774214144	f	hibachiheaven
We are open! Come pick up your favorite #hibachiheavenNYC meal on 33/Park from 11-2 #yumyum	1411657528	515155129193209856	f	hibachiheaven
#midtown we will be open from 11-2 @ 33/Park today! Grab a friend and come get some #hibachiheavenNYC	1411655384	515146137846951936	f	hibachiheaven
#midtown we are prepping and getting ready to serve you lunch on 33/Park today. #hibachiheavenNYC	1411652692	515134844133994496	f	hibachiheaven
#downtown we will be at #NYU all day W4th come meet us! #yumyum #hibachiheavenNYC	1411570551	514790322896121856	f	hibachiheaven
#midtown we are at our usual spot on 46th and 6th! #hibachiheavenNYC #yumyum @midtownlunch	1411570495	514790087776034816	f	hibachiheaven
@CleverlyChloe we will be at NYU today right by W4th!	1411570425	514789792329236480	f	hibachiheaven
@CleverlyChloe where are you usually located?	1411511496	514542627958845440	f	hibachiheaven
RT @randomfoodtruck: Out front today is @hibachiheaven and @PapayaKingTruck is just up Broadway, between 57 &amp; 58	1411493675	514467878566113280	f	hibachiheaven
@midtownlunch   we're open and serving at 33rd and Park.  Come get your #yumyum #hibachiheavenNYC	1411488631	514446723654385665	f	hibachiheaven
RT @steveorefreshed: @hibachiheaven is on 33rd &amp; Park ave NYC @diradio providing that #latinhouse lets make some noise @HibachiJoe #topsirl...	1411482316	514420234602942464	f	hibachiheaven
We will also be at NEW #location today: Broadway b/t 56th &amp; 55th #hibachiheavenNYC	1411481506	514416838487580673	f	hibachiheaven
#midtown find is on 33 and Park today! #hibachiheavenNYC @midtownlunch	1411481357	514416213444005889	f	hibachiheaven
@HashtagSCBE for sure. We recommend using the ginger soy for the vegetable medley and choice of meat.	1411435325	514223141342949376	f	hibachiheaven
@HashtagSCBE Thank you for working with us! We are looking forward to your posts	1411435092	514222166171455488	f	hibachiheaven
@hahtherapper some day perhaps. Some day.	1411772504	515637372172926976	f	waffletruck
@Foodtruckgirl7 sooooo...see you tomorrow?	1411772482	515637279080316928	f	waffletruck
@Foodtruckgirl7 @milktrucknyc a great pairing!	1411772463	515637202207113216	f	waffletruck
@culinarydreamin we shall see if you got the dinges sauce!	1411772444	515637123106758657	f	waffletruck
@AshantiAleyce we want that same thing for you!	1411772403	515636947549958144	f	waffletruck
@pandypuddingpie sounds about good to us!	1411772380	515636853916332032	f	waffletruck
@cocoahooves indeedee do!	1411772340	515636687146594304	f	waffletruck
Still available @ all our locations!! #icedcoffee #coldbrew #dinges http://t.co/u4Oib8VZ6v	1411744871	515521473478664192	f	waffletruck
Leave a cool wafel note for our Wafeleurs and get one free dinges! #freedinges #note #dingesforeveryone	1411744819	515521254477295618	f	waffletruck
Goesting @ Bway &amp; 66th till 10pm\n\nAleeeeez get your #dinges!	1411744428	515519615657865216	f	waffletruck
Kotmadam @ Bway &amp; 17th till 10pm\nBierbeek @ great lawn in Central Park till 8pm\nPagadder @ Brooklyn bridge till 9pm	1411744424	515519598473781248	f	waffletruck
TRUCKS\nMomma truck @ 49th &amp; 3rd Ave till 4:30pm\nKastaar @ Park &amp; 40th till 4:30pm\n\nCARTS\nVedette @ 60th &amp; 5th till 8pm	1411744416	515519565305241600	f	waffletruck
Funky Friday!!\n\nLe cafe @ 15 Ave B till 2am\nDe Wafel Cabana @ 35th &amp; Bway open till 10pm	1411744403	515519507981688832	f	waffletruck
@mooncrack yay for more Stephanies!	1411695488	515314345564463104	f	waffletruck
@RAISA_7 we do try.	1411695447	515314171685404672	f	waffletruck
@FrenchLewis @CupsApp we do try to do that breakfast thing well.	1411695430	515314102148009984	f	waffletruck
RT @FrenchLewis: @cupsapp @waffletruck   Great espresso, delicious waffle.  Perfect breakfast	1411695416	515314040772788225	f	waffletruck
@priskilllerrr just encouraging you to eat it quicker.	1411695400	515313977019367424	f	waffletruck
@supanaturalkat who needs money anyways?	1411580584	514832404348153856	f	waffletruck
@pinkytwinkieee today. Wednesday. Later.	1411580551	514832263448891393	f	waffletruck
RT @equiluminance: @CornelWest visits the @SnowdayTruck !!! Epic, can't express how meaningful this was for everyone! http://t.co/ed6NufUVrn	1411785170	515690499723001857	f	snowdaytruck
Food Truck Friday: Keenwah, CO http://t.co/4xRBiY113c	1411768229	515619444010532864	f	snowdaytruck
We had fun yesterday @ @TheNewSchool come check us out there today from 11:30 to 1:00 PM serving lunch for #GULD2014 http://t.co/wRPJfrcmNl	1411740002	515501050728824832	f	snowdaytruck
Here's a lil Throw Back for our Maple Loving Thursday! #DUMBO #SNOWDAY #ROOKIEOFTHEYEAR http://t.co/bHIM1I2xr9 Thanks for the support #BK	1411669043	515203424322060288	f	snowdaytruck
Hey there Maple-ites! Dont let the weather get you down especially when were going to be @ The #GULD Conference at the New School tonight!	1411653660	515138904618717184	f	snowdaytruck
Truck #1 is Rollin' Solo for Lunch! It's on 56th St. &amp; Broadway.	1408024168	499915712002289664	f	neaexpress
The team is getting busy prepping for a big weekend, but wanted to tell our fans 2 have a great Wednesday Maplites! http://t.co/NyEJMC0bKN	1411582370	514839892573319168	f	snowdaytruck
Climate change protesters march in New York video http://t.co/xPVV3s2aCM	1411575016	514809050056638465	f	snowdaytruck
Calling all Mapleites! Come check us out @ the New School Thursday and Friday for #GULD here is a link to get tickets http://t.co/33jb7NoF4B	1411566028	514771349332848640	f	snowdaytruck
RT @ShanghaiMKS: From farm to truck to stomach the maple grilled cheese from @SnowDayTruck will surely satisfy you #AllMapleEverything http...	1411499274	514491362906214401	f	snowdaytruck
#GULD #juvjustice @TheNewSchool @TalibKweli @CornelWest @glennEmartin @SoffiyahElijah we'll be serving up social justice food-truck style	1411485772	514434730180485120	f	snowdaytruck
We're looking forward to serving up locally sourced food alongside social justice at the #GULD conference @TheNewSchool Thurs-Fri	1411485360	514433003729473536	f	snowdaytruck
RT @djtaljames: @AdamRichman @SnowdayTruck and @DriveChangeNYC want to thank you again for your support &amp; vote for #RookieOfTheYear http://...	1411485277	514432657720356865	f	snowdaytruck
Straight poaching. #snowdaylab http://t.co/ZsP6y4FJ8j	1411423140	514172032528175104	f	snowdaytruck
RT @djtaljames: @UniversalEnt @Jon_Favreau @iTunesMovies @SnowdayTruck @DriveChangeNYC thanks for the #retweet #greatmovie #wechef2 http://...	1411419094	514155063678218240	f	snowdaytruck
We'll be at @Prospect_Park #GrandArmyPlaza for the #FoodTruckRally TODAY from 11-5. Come taste our award-winning maple treats!	1411309620	513695896056659968	f	snowdaytruck
Today is your lucky day BROOKLYN! We're serving up two NEW specials @prospect_park Grand Army for the #foodtruckrally 11-5pm	1411302988	513668081689059328	f	snowdaytruck
Thank you to our awesome volunteers that came out today to support us!! #ittakesacity @Gov_Island http://t.co/ash8Xq3QwV	1411239517	513401864717860864	f	snowdaytruck
Only two weekends left to come share a meal with us on @Gov_Island !! Come try our award winning maple inspired menu today!	1411227532	513351595900547072	f	snowdaytruck
It's your 2nd to last weekend to get to @Gov_Island before the season ends - find us on the island at King Ave till 5 pm!	1411224617	513339367570812929	f	snowdaytruck
RT @nycfoodtruck: . @Prospect_Park FOOD TRUCK RALLY! See you this Sunday, 9/21, from 11a-5pm! http://t.co/oDEElARjHn @DUBpies @snowdaytruck...	1411159374	513065719295381504	f	snowdaytruck
Arepa time	1411759345	515582179477561344	f	palenquefood
Palenque crew is ready To serve your arepa lunch @UrbanSpaceNYC today we have caribanolas! Until 9 pm!  http://t.co/1khxKppI4L	1411576102	514813602910724096	f	palenquefood
Happy Monday, we are ready for your favorite arepa @UrbanSpaceNYC on Broadway btw 39 st &amp; 40 st all day until 9 pm	1411485822	514434942915592192	f	palenquefood
Arepa time ! Come get you arepa broadway between w40 39st	1411416184	514142860011380736	f	palenquefood
RT @charitybuzz: Tasting the #arepas at @palenquefood in the new #urbanspace pop up! #lovenyc http://t.co/wQpPjKsdkn	1410881064	511898404566216704	f	palenquefood
Arepa time! http://t.co/TbHnOoBRFh	1410795419	511539181760573440	f	palenquefood
First day @ Urbanspace Broadway Btw 40 &amp; 39 St from 11 am to 9 pm http://t.co/NBzN75p1DC	1410794888	511536955050700801	f	palenquefood
We ready to go ! #Urbanspace come and get your Colombian arepa!	1410789046	511512450664243200	f	palenquefood
Hey! We moved Sunday to Williamsburg.Your favorite Colombian spot is now located at Kent Av &amp; North 12, come over and enjoy the best food!	1410096629	508608245544804353	f	palenquefood
@Palenquefood a perfect sample of our Colombian Conexion arepa with Colombian chorizo nami!! http://t.co/D2xcXJrJgN	1409502057	506114427096428544	f	palenquefood
Come, have fun and enjoy our delicious Arepas and agua panela to refresh your day at Palenque!!!	1409501884	506113703084036096	f	palenquefood
Hi there! Today Rockaway is going to have Dj Quantic and Las nenas rudas in da house!!!	1409501816	506113416386592768	f	palenquefood
Palenque is happy to be serving lunch @ Dumbo Jay st &amp; water St until 3:30 pm!	1409330263	505393872944783360	f	palenquefood
check this out: http://t.co/Z4hyUMstwN	1409247909	505048453895159809	f	palenquefood
Comiendo de palenquito! Yummmmmm http://t.co/DLSvfvcvY1	1408904574	503608403059810304	f	palenquefood
@Palenquefood http://t.co/jZuxKbDeJr	1408898414	503582565081825282	f	palenquefood
 sunny day in Rockaway and Palenque is ready for make your belly happy meanwhile you enjoy the beach!!!	1408898331	503582217063641088	f	palenquefood
Working with Yoko @afropunk festival! :) http://t.co/ulBK9QcPIf	1408898317	503582158058180608	f	palenquefood
Arepas all over NYC Truck @afropunk, pier 5 @smorgasburg &amp; beach @RockawayBeachNY. Shrimp arepa is the one today :) http://t.co/i9Cm5yR5ZR	1408892851	503559232487428097	f	palenquefood
Today is a beautiful day in front of the calmed  beach and Pelenque is ready to feed your body and soul come and join us!!!!!	1408808783	503206625545814017	f	palenquefood
@Foodtruckgirl7 	1411789907	515710367138598912	f	pontirossifood
@Foodtruckgirl7 it was a great day,we were along the line too :) #pontirossiNYC next time come try our food. I do agree with @milktrucknyc	1411789875	515710232476274688	f	pontirossifood
Hello WALL STREET! Today we at 55 water street.Corner of Old Slip! Come get your fuggettaboudit italian food! #pontirossiNYC	1411741340	515506659943530496	f	pontirossifood
RT @hibachiheaven: Along side us will be @PontiRossiFood remember to follow &amp; hashtag #PontiRossiNYC and #hibachiheavennyc !!	1411309031	513693425703845888	f	pontirossifood
Tomorrow join us for a great cause #climatemarch #PontiRossiNYC @LATINKITCHENNYC @hibachiheaven 37th and 11th ave.  http://t.co/zuudzcsP1R	1411251695	513452943178481665	f	pontirossifood
@hibachiheaven thank you guys! Hibachi siete bellissimi 	1411224309	513338074966032384	f	pontirossifood
RT @hibachiheaven: - @PontiRossiFood will also be serving Gluten-Free pasta! #PeoplesClimateMarch #PontiRossiNYC 	1411224230	513337745608286208	f	pontirossifood
RT @hibachiheaven: Make sure to follow @PontiRossiFood and tag #PontiRossiNYC	1411224227	513337732765323264	f	pontirossifood
RT @hibachiheaven: Our friend's @PontiRossiFood will also be at #PeoplesClimateMarch, Italian food at its finest! http://t.co/j1lIWTneog	1411224225	513337723495911424	f	pontirossifood
Today 56th between 2nd and 3rd for the PS59 parent and teacher association. What a beautiful day to come get some fuggettaboudit food 	1411223232	513333559336374272	f	pontirossifood
Getting ready for the weekend. We will serve lunch again on Monday. Stay tuned ! 	1411140880	512988148528590848	f	pontirossifood
Goodmorning NYC! Today thursday 9/18 11:30am-3pm location 47st Bet Lexington &amp; Park ave. FUGGETTABOUDUT ITALIAN FOOD MADE BY ITALIANS.	1411048818	512602015495901184	f	pontirossifood
@paradoxdl @stefferonipizza  we finally back on 48th and 6th ave. http://t.co/QkMyEcXYCa	1410967310	512260144441618432	f	pontirossifood
Today's generator was down we apologize, we will be back soon to feed you guys. Tons of specials coming ! Stay tuned. Ciao belli	1410281848	509385109200723968	f	pontirossifood
@stefferonipizza ciao stefy,il generatore ha fatto il biricchino oggi! Torneremo presto,stay tuned!Abbiamo 2 speciali pronti :)grazie Mille	1410281781	509384828203323392	f	pontirossifood
@paradoxdl Hello Dave. We had a problem with our generator today. We will be back tomorrow on 47th and park ! We truly sorry.	1410194087	509017011419353088	f	pontirossifood
@paradoxdl Dave, we planning on coming every Monday and Wednesday. Monday we gonna have few specials.. Don't miss it ;-)	1409778064	507272085056782337	f	pontirossifood
RT @paradoxdl: @PontiRossiFood Thank you! When will you be back on 48th???	1409778023	507271912444428288	f	pontirossifood
@paradoxdl thanks so much Dave.Glad you enjoyed it,come back soon 4 some more bolognese and a warm piece of Italian bread.Ciao, grazie Mille	1409770730	507241322521296896	f	pontirossifood
RT @paradoxdl: @PontiRossiFood Just tried your penne bolognese today -- delish! Very tasty. One tip: wish I had a piece of Italian bread to...	1409770627	507240891342651392	f	pontirossifood
RT @rachelr1977: so, finally popped the 1st @dubpies into the oven. HOLY CRAP. SO TASTY. :)	1411790465	515712707623157760	f	dubpies
Glad to hear you avoided microwave! ;-) "@rachelr1977: so, finally popped the 1st @dubpies into the oven. HOLY CRAP. SO TASTY. :)"	1411774693	515646552610996224	f	dubpies
#pietruck is @royalpalmsclub all night! 514 Union St, Brooklyn (Gowanus)	1411771492	515633130234204160	f	dubpies
RT @TheNYRA: #SuperSat options at #Belmont include @dubpies, @comengetitbbq, @hibachiheaven, @ElPasoTruck, and more!	1411762488	515595362682535936	f	dubpies
#pietruck is at Varick St. &amp; King St., Soho -11am - 2.30pm	1411741799	515508585720459264	f	dubpies
Loads of police where we'd planned to put #pietruck today - so we're at Varick Ave &amp; King St, Soho - again, today.	1411739903	515500635660484608	f	dubpies
RT @evanthornton: Steak &amp; Cheese, as per @my_ottawa and Petra (at @DUBPies - Windsor Terrace in Brooklyn, NY) https://t.co/8PHLyHdrzO http:...	1411676530	515234827197767680	f	dubpies
@krhaegar we leave between 2.30/3. We left half hour ago. Next time!	1411672902	515219613031075841	f	dubpies
dubpies: #PieTruck is @ 125 West 55th St, NY NY https://t.co/LYiFOZqmxw http://t.co/NS6ZNHdhoV	1411662521	515176072636538880	f	dubpies
RT @randomfoodtruck: Out front is @TheSteelCart, @PapayaKingTruck is up Broadway between 57th &amp; 58th, and @dubpies is down 55th between 6th...	1411662246	515174916531175424	f	dubpies
Since '03, baby! RT @evanthornton: "Flat White": antipodean coffee culture arrives at last! (@DUBPies - Windsor Terrace)...	1411658217	515158020624773120	f	dubpies
Take them home! You'll be glad you did! "@rachelr1977: @dubpies yeah, i'm trying to figure out alternate solutions."	1411658096	515157510035361792	f	dubpies
Don't do it! @rachelr1977: today is totally @dubpies day!\n\n.... although we only have microwaves here at the office...."	1411657961	515156943154184192	f	dubpies
RT @evanthornton: "Flat White": antipodean coffee culture arrives at last! (at @DUBPies - Windsor Terrace) https://t.co/r55LrvwVat http://t...	1411653425	515137919250862082	f	dubpies
#PieTruck is at 125 West 55th St, NY NY https://t.co/LYiFOZqmxw http://t.co/NS6ZNHdhoV	1411653373	515137700916367360	f	dubpies
@HungryGoddess we can do that	1411602835	514925730447515648	f	dubpies
That was today - W55th Thursday - http://t.co/ymDUa4UrVL MT @HBMooloo: @dubpies big sis says she'll be in Soho tomorrow- what's your plan?	1411593854	514888059742351361	f	dubpies
Thanks for that! "@HBMooloo: @dubpies sister in in NYC so have recommended her to seek you out!"	1411586615	514857698282967040	f	dubpies
@captgreenbomb we couldn't agree more :-(	1411584762	514849926119845888	f	dubpies
RT @teawiththedevil: Hey @SilverSporkNews, I told ya the next Big Thing will be pies @dubpies http://t.co/WhweiCso4I	1411584720	514849749867184128	f	dubpies
47th and Park!!!!	1411729634	515457565313204225	f	vspot_truck
FRIDAY IS FINALLY HERE!! Let's end the week at our favorite spot! 47th and Park ave. 11:30 - 2:30 !!	1411116392	512885441545396224	f	vspot_truck
47th and Park again! Just can't get enough of this place. See you here :)	1411029928	512522783415623680	f	vspot_truck
Catch us on 47th and Park today!!!	1410966190	512255445114048512	f	vspot_truck
Chilly out today... Warm yourself up with a bowl of Lemongrass Curry Chicken :) 53rd and Park ave 11:30 - 2:30	1410785364	511497006414831616	f	vspot_truck
47th and Park. TGIF! Come Hit your V Spot today!!! :)	1410531048	510430330587987970	f	vspot_truck
53rd and park!  Serving at 11:30am to 2:30pm.	1410440280	510049618806472706	f	vspot_truck
Loving 47th and Park! Sorry we sold out of our lemongrass curry chicken yesterday. Now we're back today and fully loaded! See you here :)	1410342560	509639751230832640	f	vspot_truck
New spot! 47th between Park ave and Lexington.	1410268802	509330391564828673	f	vspot_truck
Start your week with some Vietnamese food at 53rd and Park!	1410185111	508979363241394176	f	vspot_truck
52nd and 6th !!! End your Friday with some savory and spicy lemongrass curry chicken!!	1409913500	507840146365222912	f	vspot_truck
53rd and park from 11:30am-2:30pm	1409837124	507519802190344192	f	vspot_truck
Back at 52nd and 6th!!! :)	1409739596	507110738453094401	f	vspot_truck
53rd and park!!	1409663789	506792782481326080	f	vspot_truck
46th and 6th! YAY Friday!!! End the week with some yummy Vietnamese food!!	1408704079	502767465747607552	f	vspot_truck
53rd and park :)	1408627853	502447749116469250	f	vspot_truck
46th and 6th today from 11am to 2:30pm. Don't come too late!! Or else that yummy lemongrass curry chicken gets sold out again!	1408533848	502053464412020736	f	vspot_truck
Private event today!	1408448881	501697087827091456	f	vspot_truck
WE'RE BACK! 53rd and Park ave. :)	1408363568	501339258716971010	f	vspot_truck
TRUCK MAINTENANCE! Be back asap! Sorry	1408026886	499927114314174464	f	vspot_truck
Morning, NYC. The truck will be off the road for the rest of the week. He is taking a break in a auto shop. Will be back soon. Stay turn!	1411651777	515131007973216257	f	shanghaisogo
Sorry midtown:-( no parking on 47th st &amp; Park Av today) That is what happen in midtown as a big day for big apple.	1411576506	514815295962501121	f	shanghaisogo
@UN_News_Centre: UN General Assemblys 69th general debate kicks off Wednesday http://t.co/mUOrlu0ceA #UNGA http://t.co/nmcjCpRmaz	1411576326	514814543009431553	f	shanghaisogo
Heading to midtown 47th st &amp; park ave. Stay turn!	1411571579	514794633155858432	f	shanghaisogo
Dinner @nyuniversity west 4 &amp; Greene st until 8pm. Come &amp; get some.	1411502032	514502932440825856	f	shanghaisogo
@nycfoodtruck @FoodtoEat @midtownlunch still not get your lunch fixed? Come &amp; get some from your loving truck @ 46th st &amp; 5~6th ave. Until 3	1411493578	514467471286611969	f	shanghaisogo
@shanghaisogo: It is time to think of your lunch? Come out &amp; find us \n@ 46 th st &amp; 5~6th ave. Until 3pm.	1411489370	514449824251666432	f	shanghaisogo
RT @ShanghaiMKS: Another #University has announced its plans to add a food truck on campus for its athletes. http://t.co/rjdwlx15LC #Longho...	1411430886	514204522571661312	f	shanghaisogo
Morning, NYC. #TGIM =thanks god it is Monday! We out of street for catering a private event. Stay turn:D	1411393445	514047486403821568	f	shanghaisogo
@mausamnyc @DeliNDogzTruck @Chefsamirtruck all food truck line up on john st &amp; front st. Come &amp; get us :-) http://t.co/gT9YegUCfE	1411226835	513348672747470849	f	shanghaisogo
Beautiful #saturday. Shining &amp; bright in @TheSeaport . Open at 11am.  until 8pm. on Front and Fulton - open soon!!	1411224339	513338203022307329	f	shanghaisogo
#TGIF we are serve @ water st &amp; Hanover sq. until 3pm. See y'all before the weekend!	1411141959	512992673939353601	f	shanghaisogo
It is time to think of your lunch? Come out &amp; find us \n@ 46 th st &amp; 5~6th ave. Until 3pm.	1411054616	512626331855900672	f	shanghaisogo
@nycfoodtruck @midtownlunch what a sunny #Thursday swing by to 46th st &amp; 5~6th ave. Get ur Asian Tapas.	1411048001	512598586291679232	f	shanghaisogo
Please RT\n#AsianTapasThursday Will be serve @ 46th st &amp; 5~6th ave 11~3pm. See ya all there.	1411004684	512416904217382912	f	shanghaisogo
RT @vendyawards: @shanghaisogo looking good at the Vendys! http://t.co/SkjhyopL5R	1410918054	512053550936248321	f	shanghaisogo
@foodtrucksin yes, you can reach us @ 9176868571. Or our email: shanghaisogo@gmail.com	1410826446	511669319361900544	f	shanghaisogo
RT @onexvoice: @Bobby_Moses we need to go here for some Asian noodles!!! @shanghaisogo	1410826314	511668763226558464	f	shanghaisogo
@PMorris153 hi, Phillip. Yes, wo do accept all the major credit cards.	1410826305	511668727184908288	f	shanghaisogo
We are off the road today.  See you tomorrow in midtown.	1410792649	511527562322132992	f	shanghaisogo
Off the streets for #private #catering #events today. #weddings #barmitzvah #birthday #celebrate http://t.co/6G7rsvuIvp	1411736214	515485160176119808	f	eddiespizzany
Off the streets for #private #catering #events today. #weddings #barmitzvah #birthday #celebrate http://t.co/CHH5YDoFqQ	1411736212	515485151745150976	f	eddiespizzany
Today's special is spinach, caramelized onions and big pepperoni w/ soup and soda $11.00. We are parked on the... http://t.co/c06CJiREtZ	1411657440	515154760152784896	f	eddiespizzany
Today's lunch special. Cooked spinach with caramelized onions  and large pepperoni w/ soup and soda $11.00. We... http://t.co/SqCcDkVLB8	1411656525	515150922448515072	f	eddiespizzany
Eddies special in the oven! Thursday's: 10  hanover http://t.co/jaYx0JRDJz	1411649630	515122001560612866	f	eddiespizzany
Eddies special in the oven! Thursday's: 10  hanover http://t.co/RNlAz1sSuw	1411649625	515121983105687552	f	eddiespizzany
@thoughtsithink @Papaya_King @gcnyc1 @BWDGroupLLC   Thanks for having us!	1411592561	514882635634843650	f	eddiespizzany
Good morning! Today we are parked on W.46st between 6&amp;7th Ave. Stop by and enjoy a fresh hot pizza or one of our... http://t.co/9R4HYmdyGJ	1411567327	514776800371953664	f	eddiespizzany
TUESDAY: we could not get our regular spot. We are on 46th between 5th and 6th closest to 5th. Until 3p for... http://t.co/I9Xig3HMhU	1411494928	514473135819603968	f	eddiespizzany
Its lunch time! We are parked on W.46st between 5th&amp;6th Ave. (Closer to 5th) We look forward to serving you. Call... http://t.co/7io04xHS1i	1411485499	514433584946769921	f	eddiespizzany
TUESDAY: we could not get our regular spot. We are on 46th between 5th and 6th closest to 5th. Until... http://t.co/GnJkNJ46HJ	1411478156	514402787187109888	f	eddiespizzany
Happy Monday. We are at #starrettlehigh today! @starrettlehigh #eddiespizza http://t.co/O1bmueBecn	1411395698	514056932274225152	f	eddiespizzany
Happy Monday. We are at #starrettlehigh today! @starrettlehigh #eddiespizza @ Starrett-Lehigh http://t.co/whqNCXagzh	1411395696	514056924313444352	f	eddiespizzany
Off the streets today for #private #events #catering #weddings http://t.co/wHIGVIFgdP	1411226779	513348438558507008	f	eddiespizzany
Off the streets today for #private #events #catering #weddings http://t.co/PsyAG6em2i	1411226775	513348421458354176	f	eddiespizzany
Off the streets today for private #catering #events #eddiespizza #weddings http://t.co/kMMLmnzkff	1411133036	512955250643202050	f	eddiespizzany
Off the streets today for private #catering #events #eddiespizza #weddings http://t.co/8Mf2Myhj12	1411133034	512955241982341120	f	eddiespizzany
Thursdays: near 10 Hanover #fidi #eddiespizza http://t.co/TzzMz0LiDL	1411057048	512636531173900288	f	eddiespizzany
Wednesday; 46 th between 5th and 6th for lunch until 3p. #eddiespizza http://t.co/L6UDzMOGu8	1410968121	512263544646017025	f	eddiespizzany
Tuesdays: 47th between park and lex. 3 cheese pizza. #eddiespizza http://t.co/DzML1cRu0I	1410874722	511871803242074112	f	eddiespizzany
Hello Midtown, Taco Friday! @MexicoBlvd  46 St. Happy week end	1411741268	515506358536667137	f	mexicoblvd
@roundhoward @BMarsalise Hey Guys, today we are in DUMBO, Water&amp;Jay	1411658722	515160137980715010	f	mexicoblvd
Hola Dumbo! Our Veggie options: Flautas, Torta de Aguacate, Quesadillas, Veggie Tacos!!!! @MexicoBlvd @dumbolot Water&amp;Jay	1411657114	515153392436797440	f	mexicoblvd
Aguacate... Delicioso! http://t.co/PSMeytpkQd	1411578416	514823310996426753	f	mexicoblvd
Today we are on 46 St. (b 6&amp;7) Tacos, quesadillas, tortas, flautas...	1411574399	514806462636638209	f	mexicoblvd
Hola #midtown Due to street closings on the East side, we are at 46th between 6th &amp; 7th Ave's @MexicoBlvd Los esperamos	1411574185	514805561192632320	f	mexicoblvd
SHANA TOVA UMETUKA to all those celebrating.	1411573701	514803534093910016	f	mexicoblvd
Hola #midtown Due to street closings on the East side, we are at 46th between 6th &amp; 7th Ave's @MexicoBlvd Los esperamos!	1411563857	514762243159101442	f	mexicoblvd
Buenos dias #midtown Taco Tuesday @MexicoBlvd 46 St.	1411480396	514412183246356480	f	mexicoblvd
RT @NYFoodJournal: Excellent seeing @KimchiTruck, @MexicoBlvd and @carlssteaks by @prospect_park at the food truck rally yesterday. Great #...	1411410832	514120411635011584	f	mexicoblvd
RT @dumbolot: We got @dubpies @ToumNYC and @MexicoBlvd today!	1411397671	514065211159248897	f	mexicoblvd
Still summer, enjoy this beautiful day with the flavorful lunch @Mexicoblvd DUMBO, Water and Jay	1411397632	514065047967236096	f	mexicoblvd
RT @PhilCatelinet: I had a torta from @MexicoBlvd for lunch and then an ice cream sandwich from @COOLHAUS and now I'm fighting off a nap.	1411328447	513774861379203072	f	mexicoblvd
Hola Brooklyn, today we will be at @prospect_park 11:30am-5pm Grand Army Plaza http://t.co/xGI2XjEgSn	1411306750	513683858324463616	f	mexicoblvd
RT @jmcesario: Waiting on line for yummy tacos #mexicoblvd #FoodTruckFriday	1411180520	513154410357489664	f	mexicoblvd
@ddrab 46th &amp; 6th on Tuesdays and Fridays !	1411154440	513045025891303424	f	mexicoblvd
Happy Friday! Tacos with fresh Salsa Roja, Salsa Verde and Extra Spicy if you are craving it! @MexicoBlvd #midtown 46St	1411137140	512972463450632192	f	mexicoblvd
Street food in Mexico, called ANTOJITOS (literally "little cravings"). Enjoy your "Antojitos" in NYC @MexicoBlvd  @dumbolot Water&amp;Jay	1411052148	512615982196862977	f	mexicoblvd
RT @PURPLEBRIDE: Yummy organic flautas (@ Mexico Blvd Food Truck in New York, NY) http://t.co/19xJjGCppB	1411003150	512410469374910464	f	mexicoblvd
@prateekrungta Midtown West (51st and park) is only on Wednesdays	1410995466	512378240863055872	f	mexicoblvd
RT @TheNYRA: What are you eating at #Belmont tomorrow? @mactruckny, @MrNiceGuyTruck, @gcnyc1, @PapayaKingTruck, @TheCrepesTruck, @AndysItal...	1411760857	515588520397000705	f	mrniceguytruck
71st and York. At it again.	1411740553	515503359147909121	f	mrniceguytruck
RT @lunasantana0413: Fried Oreos.  @mrniceguytruck http://t.co/FlBPMJazyt	1411521292	514583715419549696	f	mrniceguytruck
71st and york today folks!!	1411485286	514432691971039232	f	mrniceguytruck
We are open for business and its Monday night Football as well. Get your big game day packages it is still early.... http://t.co/ZzKNjFic14	1411405061	514096205379690497	f	mrniceguytruck
The truck is off today but our store is open for business!! 634 McLean avenue, Yonkers NY. 914-457-4324	1411404964	514095797840146432	f	mrniceguytruck
Prospect park Brooklyn we here!!!! http://t.co/gydGh5xbYc	1411309864	513696922256023554	f	mrniceguytruck
Another Day on Governors Island we will be here all weekend, Pass by and enjoy this beautiful weather.	1411243258	513417555697209344	f	mrniceguytruck
Governor's island today windows are up and it's a beautiful saturday.	1411233715	513377527856103425	f	mrniceguytruck
We are on 52nd and 6th making you your favorite sliders. We are also open and ready for your deliveries orders at... http://t.co/XpITg4AcMS	1411144355	513002726116962304	f	mrniceguytruck
52nd and 6th we are out here!! Come get your lunch	1411143638	512999718763634688	f	mrniceguytruck
70 th and York we are back. Catch us for lunch 11am	1411051571	512613562867810304	f	mrniceguytruck
RT @Carnegro: Wednesday is a food truck day. (at @MrNiceGuyTruck in New York, NY) https://t.co/kkEv8RRTKB	1410975917	512296244350558209	f	mrniceguytruck
47th and Park is where we are at today!!! Start your hump day right with our delicious food.	1410966170	512255364621168640	f	mrniceguytruck
Catch the truck tomorrow on 47th and Park windows go up at 11am.	1410918561	512055676244615168	f	mrniceguytruck
We are taking a break today but we will be back on the road tomorrow morning.	1410881657	511900888823513089	f	mrniceguytruck
Feel Free to order from our menu.	1410826086	511667807415971841	f	mrniceguytruck
634 McLean Avenue Yonkers, NY 914-457-4324. We are open for business 7 days a week. Pass by and try our food.... http://t.co/thSu58WAIw	1410825522	511665443853967361	f	mrniceguytruck
We have the best customers and they love our Food!! http://t.co/D7vVAh17Qn	1410825294	511664485372022784	f	mrniceguytruck
Pass by and get our pulled pork or Cuban Sliders. The pork is ready!! http://t.co/y3JBsRllGv	1410825053	511663475756900352	f	mrniceguytruck
Lyft is giving our people free rides! Use the code ClawsUp for $25 credit on your first Lyft, your friend with a car: http://t.co/V4p4kDNT9M	1411756264	515569259607764992	f	lobstertruckny
#BigRed is still off the streets but #RedHookLobster is still out there on 40th &amp; B'way and 25th &amp; B'way!	1411744962	515521852970926080	f	lobstertruckny
#RedHook Lobster has outdoor seating at 16 Extra but more importantly we have indoor seating too! Enjoy Maine lobster in Maine-like weather!	1411667717	515197864524677120	f	lobstertruckny
Why don't you enjoy an authentic Maine lobster roll with some authentic New England weather?! http://t.co/AIkuqpXPwr http://t.co/pZEgovA2JI	1411664109	515182733472305153	f	lobstertruckny
#BigRed is off the streets but we're not! #RedHookLobster is at 40th &amp; B'way and 25th &amp; B'way!	1411653311	515137441318318081	f	lobstertruckny
#BigRed is off the streets this week but #RedHookLobster is everywhere from 40th&amp;B'way to 25th&amp;B'way to 16 Extra place in the East Village!	1411566915	514775069663723520	f	lobstertruckny
#BigRed will not be on the streets this week but we wouldn't leave you stranded! We can be found at 40th &amp; B'way as well as 25th &amp; B'way!	1411480907	514414327429099520	f	lobstertruckny
RT @nycfoodtruck: 101 Best Food Trucks in America: http://t.co/aVofqV2ZUX @sirmyers @TheDailyMeal w @SouvlakiTruck @SchnitznThings @TaimMob...	1411480818	514413952407969794	f	lobstertruckny
Hey Jersey City, #BigRed and #RedHookLobster is bringing Maine to you today! http://t.co/kHVzLxddIt	1411229108	513358204605329408	f	lobstertruckny
#BigRed is in the Garden State at the All About Downtown Jersey City Street Fair! Come join the fun! http://t.co/kHVzLxddIt	1411225273	513342121190129664	f	lobstertruckny
Hey, we made the list! #RedHookLobster http://t.co/bH7BWvAABg	1411165851	513092884300857344	f	lobstertruckny
#BigRed will be partying with Jersey City at the All About Downtown Street Festival! Come join the fun tomorrow! http://t.co/kHVzLxddIt	1411162395	513078391579623424	f	lobstertruckny
Autumn is a time to #FallForLobster! Meet your #LobsterLUV at 40th&amp;B'way or 25th&amp;5th! we'll be at both places at once!	1411134929	512963187822845952	f	lobstertruckny
RT @thedailymeal: @lobstertruckny Congrats on being named to our list of The 101 Best Food Trucks! Check out the full list here &gt;&gt; http://t...	1411134560	512961640367919104	f	lobstertruckny
Due to inclement weather #BigRed is staying in port at Red Hook.	1410879649	511892468049391616	f	lobstertruckny
The truck is going to be off the streets but we now have popup markets all over for all your #CrustaceanCravings! http://t.co/fSll2KMurT	1410800111	511558861778874368	f	lobstertruckny
The food truck is not on the street but #RedHookLobster is at 40th &amp; B'way, @UrbanSpaceNYCs Garment District http://t.co/pZEgovA2JI	1410795437	511539258658930688	f	lobstertruckny
#RedHookLobster is now on Broadway &amp; 42nd! Come #FallForLobster! http://t.co/pZEgovA2JI	1410789316	511513584690819072	f	lobstertruckny
Brooklyn is in the house and this good witch ain't scared of water! LOBSTAH brings out the sunshine! Still dishing out...	1410623129	510816544897900544	f	lobstertruckny
We are serving up sunshine on a bun! #endlesssummer #fallforlobster @smorgasburg in East RIver park #williamsburg and @brooklynflea the...	1410616866	510790275925807104	f	lobstertruckny
Thx:)RT @rob_in_nyc: Top Food Trucks of 2014. My favorite is @schnitznthings (#53) @thedailymeal http://t.co/WBxs0uroKD #foodtruck #lunch	1411756809	515571542399647744	f	schnitznthings
The SchnitzCart will be on 49th street between 6th &amp; 7th ave as usual. Stop by for some deliciousness:) 11:30-2:30	1411738290	515493868352335872	f	schnitznthings
Morning guys:) TGIF or what? Truck will be on broad and Pearl sts 11:30-2:30pm. Come lunch with us! Preorder 347-772-7341	1411738192	515493457167937536	f	schnitznthings
RT @Foodtruckgirl7: #tbt My first eats from a food truck @ my new job in NYC @schnitznthings amazing! #NYCfoodtrucks #foodie  #schnitzel ht...	1411666531	515192888662454272	f	schnitznthings
Hi guys. The truck is parked on 47th between park &amp; lex. Till 2:30. Usual spot was closed. Preorder 347-772-7341	1411660820	515168938163195904	f	schnitznthings
Morning guys. Schnitzcart is on 26th between 11th &amp; 12th until 2:30pm. Beat the rain with some schnitz:)! @starrettlehigh	1411658774	515160356969517057	f	schnitznthings
The schnitzcart will be on 27th &amp; park today from 11:30-2:30pm. We hope to see you for lunch:)	1411568261	514780715708608512	f	schnitznthings
Hi guys! The truck is on 47th b/w park and lex from 11:30-2:30pm. It's a beautiful day for some schnitz! Stop by or preorder 347-772-7341	1411568187	514780406848421888	f	schnitznthings
Nice! Enjoy:)RT @missbunnyman: Lunch today courtesy of Schnitzel Van. Yum! @schnitznthings http://t.co/e4jDeqGLut	1411491927	514460546838851584	f	schnitznthings
The truck is parked on varick &amp; Charlton ready to sling SCHNITZ until 2:30! Stop by or preorder 347-772-7341. C ya:)	1411485939	514435432281825280	f	schnitznthings
Morning guys. Schnitzcart is on greenwich &amp; park place from 11:30/2:30pm. Come by for lunch:)	1411485758	514434673658044416	f	schnitznthings
Thanks:)RT @PaulSKahn: @nycfoodtruck: 101 Best Food Trucks in America: http://t.co/SnDAxb5wSG \nBravi to the @schnitznthings guys!	1411480958	514414541204369409	f	schnitznthings
RT @nycfoodtruck: 101 Best Food Trucks in America: http://t.co/aVofqV2ZUX @sirmyers @TheDailyMeal w @SouvlakiTruck @SchnitznThings @TaimMob...	1411477083	514398288590950400	f	schnitznthings
The Schnitzcart is parked on 55th street &amp; Broadway from 11:30-2:30pm! Come get some;)	1411394845	514053358257045505	f	schnitznthings
Morning guys. The truck is parked on 47th between park &amp; lex 2day. 11:30-2:30pm. Stop by for lunch! Preorder 347-772-7341	1411394785	514053104313311232	f	schnitznthings
RT @nycfoodtruck: 101 Best Food Trucks in America: http://t.co/yzbmroMvOv @sirmyers @TheDailyMeal w @SouvlakiTruck @SchnitznThings @TaimMob...	1411239113	513400170130980864	f	schnitznthings
The Schnitzcart will be on 49th between 6th &amp; 7th. We'll be slinging schnitz from 11:30-2:30! Hope to see you for lunch:)	1411131351	512948181840433152	f	schnitznthings
Morning guys! Finish off the week with nice warm delicious schnitz! Truck will be on broad and pearl 11;30-2:30. Preorder 347-772-7341	1411131275	512947865082429441	f	schnitznthings
The Schnitzcart will be on 26th st between 11th &amp; 12th from 11:30-2:30. Hope to see you guys for lunch.	1411048571	512600976050909184	f	schnitznthings
Morning guys! The truck is on 51st b/w park and madison from 11:30-2:30pm. It's a beautiful day out there:) stop by. Preorder 347-772-7341	1411048425	512600363741237248	f	schnitznthings
@wsachs Hi Wendy if you go to our website we have a GPS which tracks our daily location. If you want to place an order feel free to	1411669434	515205064471117826	f	brooklynpopcorn
@wsachs call us and we would be happy to help you :) thank you for your support!! :)	1411669378	515204831108431872	f	brooklynpopcorn
@awmariano Anthony sorry for your experience. Please come back to the truck Friday so we can exchange your bag for another.	1410319790	509544250934312960	f	brooklynpopcorn
RT @mikewoodsfox5: I love me some popcorn!! Hanging with John, Vicky,  and Gus. Find their delicious corn at @BrooklynPopcorn  #myfoxny htt...	1408401114	501496738763374592	f	brooklynpopcorn
@Tani_718 We will be back on York Ave next week! Follow us on FB for our schedule or our website GPS Locator! See you soon!!!	1408151638	500450359635374080	f	brooklynpopcorn
RT @FactSetCareers: .@BrooklynPopcorn truck made a stop at our Corporate HQ! #FREEFOOD #officeperk http://t.co/aDqv65X6Mn	1408151468	500449645206970368	f	brooklynpopcorn
RT @papii_jenn: @BrooklynPopcorn @amturillo you need too asap I just seen you on good day new york	1408151448	500449563648741376	f	brooklynpopcorn
RT @LouisBeNice: We have to find the Brooklyn Popcorn Truck! @BrooklynPopcorn Looks so good on #gdny \n\n@ThisIsRuss pls note	1408151442	500449538516480000	f	brooklynpopcorn
@amturillo Hi Alyssa yes we will be returning to midtown! :) We will be updating our schedule &amp; posting our midtown location. See you soon!	1407936436	499547737852231680	f	brooklynpopcorn
RT @ctamacas: Delicious! @BrooklynPopcorn Got in #WashingtonHeights #popcornlove http://t.co/f66z9FBNM4	1407644057	498321410457354242	f	brooklynpopcorn
@ctamacas Carmen sorry we miss you! We will be back next week :) Thank you for the support!!!!	1406214811	492326719169515520	f	brooklynpopcorn
RT @lostplum: have i discussed my love for @BrooklynPopcorn yet this week? #somuchlove	1406214750	492326465271103488	f	brooklynpopcorn
@nicolejoanneb Hi Nicole we will be there Wednesday! Wishing your mom a speedy recovery and we are happy we can put a smile on her face :)	1405908617	491042446646595585	f	brooklynpopcorn
RT @givemesnacks: Today: a large bag of caramel+chocolate @BrooklynPopcorn and a long list of movies/$11M tournaments.	1405908547	491042156002308096	f	brooklynpopcorn
RT @MobileEaters: It's impossible not to smile when you see the @BrooklynPopcorn truck roll by. Good night #NYC! http://t.co/3oenP3p5q7	1405908528	491042075274526720	f	brooklynpopcorn
@DosHig We will be back to our regular schedule this week. We were hosting private events this past week. See you soon!! :)	1404005192	483058907246366721	f	brooklynpopcorn
@Gooch134 We will be back to our regular schedule this week. We were hosting private events. See you soon!!!	1404005108	483058551556804608	f	brooklynpopcorn
@DosHig Can you email or contact us with details to assist you with his birthday. Please wish him a very Happy Birthday from us!!	1403316463	480170167037485056	f	brooklynpopcorn
@DosHig Sorry we didn't make it downtown. We were in NJ today at a private party event which lasted longer than we anticipated.	1403316366	480169759372091392	f	brooklynpopcorn
Hello 70th and York Ave. we are back and we have Cinnamon Toast Kettle Corn!!!!! We are cooking all our famous flavors fresh. See you soon!!	1403197119	479669601702141952	f	brooklynpopcorn
Open @ 55th and Broadway!	1411731224	515464231693852673	f	carpedonutnyc
Come and see us at 23rd and Park!	1411642572	515092399321010176	f	carpedonutnyc
Open @ Bergen and Court!	1411299705	513654308601364480	f	carpedonutnyc
Come by Pacific and Bond today, celebrating at a block party with our neighbors on Pacific Street!	1411223025	513332693225177088	f	carpedonutnyc
It's been a while... But we are back on 55th and Broadway today till 3.30pm - Open now!	1411124884	512921056345350144	f	carpedonutnyc
Open @ 51st and Park!	1411040181	512565787681632256	f	carpedonutnyc
Open @ 23rd and Park!	1410953879	512203809960230912	f	carpedonutnyc
Open @ Bergen and Court. Start your day the Donut way!	1410612261	510770959687892992	f	carpedonutnyc
Promotion with @mmlafleur lasts until 11. Come to Broadway and Houston enjoy a free hot coffee and donut, and check out their NoHo Showroom	1410531437	510431959995387904	f	carpedonutnyc
@53 and Park today doing a promotion with @mmlafleur, they are celebrating the launch of their NoHo Showroom. Free coffee and a donut!	1410351293	509676382285467649	f	carpedonutnyc
Doing promotional donuts for @mmlafleur today at Wall and Pearl. Come get a free coffee and donut until 11am #whilesupplieslast #fashion	1410262944	509305819251605505	f	carpedonutnyc
Open @ Bergen St &amp; Court St	1410002395	508212996821487616	f	carpedonutnyc
On the road again after the holiday break. Open @ 51st and Park now!	1409829559	507488072364466176	f	carpedonutnyc
Open @ 51st and Park	1409226510	504958701720317952	f	carpedonutnyc
come get your fix at 23rd and park today!	1409138556	504589795428163584	f	carpedonutnyc
Open @ Bergen and Court!	1408879935	503505059117015041	f	carpedonutnyc
Open at Court and Bergen in Cobble Hill!	1408794974	503148708687802368	f	carpedonutnyc
Broadway and 55th today!	1408710782	502795581052686336	f	carpedonutnyc
Open @ 51st and Park!	1408621056	502419242873286656	f	carpedonutnyc
All day 23rd and Park!	1408534691	502057001300799488	f	carpedonutnyc
RT @TheNYRA: What are you eating at #Belmont tomorrow? @mactruckny, @MrNiceGuyTruck, @gcnyc1, @PapayaKingTruck, @TheCrepesTruck, @AndysItal...	1411760764	515588133396963331	f	gcnyc1
"@JuliaMurney: @gcnyc1 My belly is so happy when I find your truck. I came to the cheese, yo. http://t.co/SPMMSWFznV"\nCame 2 the cheese yo	1411759460	515582662996922368	f	gcnyc1
RT @VoiceStreet: Grilled Cheese - perfect for all occasions. Go to the @gcnyc1 #foodtruck at #BKPour http://t.co/lMbd9Ch3Oh	1411745378	515523599076442112	f	gcnyc1
RT @Foodtruckgirl7: @gcnyc1 good thing I brought my rain boots! Heading 2 @theseaport for GC and tomato soup for lunch #readytogo #eats htt...	1411740466	515502993983414272	f	gcnyc1
RT @Foodtruckgirl7: A match made in cheese heaven. Perfect rainy day food @gcnyc1 #NYCfoodtrucks #grilledcheese #lunch #nyc @TheSeaport htt...	1411740456	515502954103984128	f	gcnyc1
RT @Foodtruckgirl7: Everyone needs try this tomato soup! One of the best if not the best I've had @gcnyc1 #nycfood #nycfoodtruck http://t.c...	1411740446	515502910416113664	f	gcnyc1
RT @Foodtruckgirl7: @esurance #SavorTheNew just had @gcnyc1 for the first time &amp; loved it #Streetfood #nycfood #foodtruck #Foodiechats http...	1411740433	515502855797895168	f	gcnyc1
G1- 46 5/6\nG2- 47/Park\n#ComeToTheCheeseYo	1411740410	515502761526693888	f	gcnyc1
Get your favorite GC and Tomato Soup, ,, little rainy day treat\n33/park\nSeaport\n#ComeToTheCheeseYo http://t.co/J2t5AkhNbm	1411655055	515144756259995648	f	gcnyc1
RT @Foodtruckgirl7: Today is a perfect day 4 grilled cheese &amp; soup @milktrucknyc @gcnyc1 #NYCfoodtrucks #nyc #foodie #lunch @midtownlunch #...	1411654846	515143877561692160	f	gcnyc1
RT @Papaya_King: @thoughtsithink @gcnyc1 @EddiesPizzaNY @BWDGroupLLC of course, glad we could be a part of the celebrations 	1411654836	515143836553973760	f	gcnyc1
RT @EddiesPizzaNY: @thoughtsithink @Papaya_King @gcnyc1 @BWDGroupLLC   Thanks for having us!	1411654827	515143800617205760	f	gcnyc1
RT @thoughtsithink: Thanks @Papaya_King, @gcnyc1 &amp; @EddiesPizzaNY for helping us celebrate my dad's birthday! He and @BWDGroupLLC had a gre...	1411654823	515143783110172672	f	gcnyc1
RT @BfloStreetMeat: To our NYC users!  We've added @gcnyc1!  Find their location daily with the @BfloStreetMeat App! https://t.co/cDSLhhBeE0	1411654816	515143754878287872	f	gcnyc1
RT @PokaDotGumBalls: @gcnyc1 yummmmmmmmmmmm	1411654813	515143740567355392	f	gcnyc1
RT @JustJerseyFest: @gcnyc1 Did someone say comfort food? Plenty of that to be found @ Oct 19, Jazz &amp; Food Truck Fest. Especially at Gorill...	1411654809	515143722468900864	f	gcnyc1
RT @mfmei: @jfedor21 @gcnyc1 experiencing such #fomo from #bamako :(	1411654802	515143695101071360	f	gcnyc1
RT @jfedor21: Sorry @mfmei  but they were in #JerseyCity today. HOLY HELL we need to go when you're home! @gcnyc1 #allaboutdowntown http://...	1411654793	515143655389409280	f	gcnyc1
G1- 33/park\nG2- Seaport\nSmoked Salmon Melts\n#ComeToTheCheeseYo	1411654726	515143377021861888	f	gcnyc1
G1- 26th 11 / 12 @starrettlehigh\nG2- Plainview Long Island @ Corporate Lunch\n#ComeToTheCheeseYo	1411567439	514777268984754176	f	gcnyc1
#ThankYouCaptain	1411698344	515326324240830466	f	korillabbq
CU we're back. 116th and Amsterdam! #DINNER	1411682449	515259653379620864	f	korillabbq
Check us out at 116th &amp; Amsterdam. 2PM to 8PM	1411666383	515192267561529344	f	korillabbq
Sorry midtown! Wasn't happening.. Apologies	1411666277	515191823556706304	f	korillabbq
Headed to Midtown's 47th &amp; Park today. sorry Metrotech we are down one truck	1411656030	515148847870259200	f	korillabbq
Done at CU! Goodnight all	1411601878	514921713784868864	f	korillabbq
We ready for ya CU! Find us at 116th &amp; Amsterdam	1411592840	514883808844611585	f	korillabbq
Done in DUMBO! Headed uptown to 116th &amp; Amsterdam. Dinner starts at 5pm	1411582954	514842343149957120	f	korillabbq
@Chris_Quartly @gabewake @patandriola Love that u guys are loyal Wed. FiDi fans, but we have a catering event today. Sorry--back next week!	1411580096	514830357381001216	f	korillabbq
Wsup DUMBO! Water &amp; Jay st ready by 11:30	1411571905	514796000545103872	f	korillabbq
DUMBO lunch Wednesdays! We're at the @dumbolot today at Water &amp; Jay St.!	1411571097	514792611849469952	f	korillabbq
116th St &amp; Amsterdam Ave til 7:30PM	1411512020	514544823072993281	f	korillabbq
All done at midtown!	1411496938	514481565389561856	f	korillabbq
Midtown we did it! We are #parked and ready by 11:45 @ 47th and Park!	1411485285	514432687306993664	f	korillabbq
All done at Columbia. We'll be back tomorrow.	1411417041	514146452009127939	f	korillabbq
Sorry Flatiron! Gotta cut lunch early, catch us next week!	1411408009	514108569311277056	f	korillabbq
Good afternoon Columbia University! Ready to serve at 116th St &amp; Amsterdam Ave	1411404992	514095915884621824	f	korillabbq
@coreymichalek Sorry, still cash only. But our Madison Square Park location today is right in front of a Chase bank! :)	1411404045	514091944755331072	f	korillabbq
Have you heard the good news? Korilla in the East Village! https://t.co/r8XnEFfpGd #thenewkorilla #brickandmortar	1411403709	514090536702328832	f	korillabbq
Gmorning Flatiron! We ready for ya at 25th &amp; Bway!	1411399930	514074683327913986	f	korillabbq
What's for lunch you ask? Check out the menu.  50th Street btwn 6th and 7th Avenue http://t.co/uxayON2lsl	1411735008	515480103309279232	f	bigdsgrub
Thanks for grubbin w/ us today, stay dry NYC!	1411674115	515224701346807808	f	bigdsgrub
Tacos, grinders and more at 50th Street btwn 6th and 7th Ave, till' 2pm. Preorders call 646-543-BIGD	1411657093	515153304276725760	f	bigdsgrub
Come by for lunch today at 50th Street btwn 6th and 7th Avenue. Beat the rain and preorder by calling 646-543-BIGD #MidtownWestWednesday	1411651444	515129610477264897	f	bigdsgrub
@losanno	1410645222	510909210071425025	f	crafflesnyc
Join us for a night filled of fun at the @RoyalPalmsClub! #Shuffleboard, drinks and Grub. 514 Union Street, #Brooklyn	1411593762	514887674046713856	f	bigdsgrub
@gotbaum 50th btwn 6/7 Ave	1411581558	514836488367120385	f	bigdsgrub
The Grub Truck is back2back w/ the Khao Cart today on 50th Street btwn 6th and 7th Avenue. LET'S GOOOOO!!!	1411571754	514795367016460288	f	bigdsgrub
Khao Cart on 50th Street btwn 6th and 7th Avenue. We will have all the Grub Truck goodies &amp; the following... http://t.co/dVAwKWYjGc	1411566678	514774077052313602	f	bigdsgrub
The Grub Truck has been asked to leave to make way for the President.  Well be back out manana!	1411492830	514464336308604928	f	bigdsgrub
The Grub Truck is on the Southeast corner of 53rd Street and Park Avenue! http://t.co/rrZ87sCW3v	1411486084	514436042561429506	f	bigdsgrub
Khao Cart has all these plus the Grande Moco at 50th Street btwn 6th and 7th Avenue http://t.co/YJEzzXJfxA	1411486018	514435765137600512	f	bigdsgrub
@iamevie: @bigdsgrub What's on the menu today? Viet Roasted chicken w/ dirty rice, Pork basil fried rice, Shaking beef and LocoMoco	1411485876	514435169382858752	f	bigdsgrub
Big D's Grub Truck - 53rd Street and Park Avenue. (Opposite side of Park Ave)	1411482064	514419179160895488	f	bigdsgrub
What's for lunch? The Khao Cart is on 50th Street btwn 6th and 7th Avenue!!	1411480292	514411745973387264	f	bigdsgrub
Get a FREE @Audiobook_Comm card today w/ any meal at the Big D's Grub Truck. Hudson/King St. (375 Hudson Street)	1411392995	514045598610501632	f	bigdsgrub
To be loco or not to be loco...\nKhao Cart - 50th Street btwn 6th and 7th Avenue today http://t.co/U0B5RZBTTO	1411392863	514045041502068736	f	bigdsgrub
@Audiobook_Comm making LONG lines at the @BKBF!! #SundayFunday http://t.co/iGuA0yCV8n	1411320150	513740064330108928	f	bigdsgrub
Come by the @BKBF for some FREE refreshments and FREE @Audiobook_Comm prizes!!! #listenlit! http://t.co/iXDI5spa0o http://t.co/GsEiEkBYiD	1411318161	513731719917481985	f	bigdsgrub
Lets end the week off PROPER!!\nThe Khao Cart will open at 12pm today. 50th Street btwn 6th and 7th Avenue	1411137131	512972426771456002	f	bigdsgrub
RT @Silverclaim: Getting my Old Bay Fries on with @bigdsgrub. #cravesatisfied :) http://t.co/lnb1PVBQ1n	1411074984	512711760919293954	f	bigdsgrub
Hoboken!! Oct 1st at 5pm, we will be on Pier 13 celebrating our 5th year anniversary! 5$ off all orders $15+!! (That's a $10 lobster roll)	1411772388	515636885520384000	f	nautimobile
Harvest the energy of all that surrounds you at 46th and Park 	1411746688	515529094361272321	f	nautimobile
Tomorrow looks like a real wet one so we are calling it off. Back out on Friday!	1411604299	514931869629284352	f	nautimobile
Join us and all of the pretty people that walk around here at 17th and 5th. Now!	1411485296	514432736011247616	f	nautimobile
Don't be intimidated to come out, clouds are just sky marshmallows. Hoboken Pier 13 now!	1411316593	513725144846856192	f	nautimobile
Hoboken today, but slight shakeup. We are right off the pier on Constitution ct!	1411230578	513364372052529154	f	nautimobile
Just your typical Friday.. 46th and Park	1411142564	512995213628149760	f	nautimobile
Happy iOS8 release day! Because it pains us so to be behind the times, our phones will be upgrading as we serve you lunch at 46th and Park	1410967182	512259608476663808	f	nautimobile
Come join us amidst the whimsy of this delicate fall rain shower! 17th and 5th	1410875997	511877148635054080	f	nautimobile
Woke up this morning, anew.. Flush with an optimistic anticipation of what is to come.. for all of us. Hoboken, Pier 13.	1410713655	511196238268878849	f	nautimobile
Pier closed down because of rain today, but we are back tomorrow Hoboken!	1410642108	510896149788909568	f	nautimobile
Calling all Roll Trolls report to 46th and Park for your daily feeding.	1410537433	510457110891888640	f	nautimobile
Hoboken food truck Frenzy tonight! 4:00 until 10!!	1410469278	510171245166755841	f	nautimobile
Tomorrow we are apparently being filmed by a PR firm "gleefully drinking milk". No further details yet. As for today, 46th and Park	1410363971	509729558875369472	f	nautimobile
We are out in Weehawken Nj doing a special catering event. Back on the Ny streets tomorrow!	1410270240	509336420407070720	f	nautimobile
Someone leaked our tasteful nudes this week. Please don't google them. Pier 13 all day.	1410107410	508653463354761216	f	nautimobile
There will be NO rain today, we decree. Pier 13 in Hoboken, 12-9:30.	1410019142	508283239715594240	f	nautimobile
We could really use those fashion police on this truck.. Oh well.. 46th and Park	1409933100	507922353750544384	f	nautimobile
46th and Park now. Have a super nice day.	1409758926	507191815435743233	f	nautimobile
Happy birthday to Keanu Reeves, earth's most precious treasure. That is all.	1409676156	506844652281290752	f	nautimobile
We will be at the Brooklyn book festival till 6pm today @BKBF	1411313991	513714228260515840	f	parissandwich
We're in dumbo today again!! Fronts and Adams open 12:30pm @DUMBOFoodTrucks @jenchung	1411053525	512621757543776256	f	parissandwich
Beautiful day New York! Join us on Front and Adams for lunch. @DUMBOFoodTrucks @jenchung #dumbofoodtrucks #loveparissandwich	1410966872	512258306036215809	f	parissandwich
In dumbo today again. Enjoy your weekend everyone! @DUMBOFoodTrucks	1410538600	510462006567383040	f	parissandwich
We're in dumbo today again!! Fronts and Adams open 12:30pm @DUMBOFoodTrucks	1410450590	510092862038769664	f	parissandwich
Back in dumbo today on fronts and Adams #dumbofoodtruck @DUMBOFoodTrucks @jenchung	1410358602	509707037497110528	f	parissandwich
Try our fresh baked bread hourly at our 213 Grand st location http://t.co/ZbJ0mERzyS	1410111719	508671535629234176	f	parissandwich
RT @NYC_Eatz: The 10 Best Food Trucks In NYC feat: @MexicoBlvd @ParisSandwich @SnowdayTruck http://t.co/VBEB3DAK0D via @Gothamist http://t....	1410028339	508321812837826560	f	parissandwich
Dumbo we will be on fronts and Adams until 4pm today. Everyone enjoy your weekend! @DUMBOFoodTrucks @jenchung thank you 	1409927735	507899850470739968	f	parissandwich
Good Morning! We will be in #dumbo today on Front and Adams at noon. Join us for lunch @DUMBOFoodTrucks @jenchung	1409844150	507549269382164481	f	parissandwich
Dumbo join us for lunch at Front and Adams today @DUMBOFoodTrucks @jenchung #dumbofoodtrucks #loveparissandwich	1409759653	507194863964925953	f	parissandwich
Good Morning! We will be in #dumbo today on Front and Adams at noon. Join us for lunch @DUMBOFoodTrucks @jenchung	1409237626	505005322818576384	f	parissandwich
Dumbo join us for lunch today! Front and Adams at 12 pm @DUMBOFoodTrucks #loveparissandwich	1409152778	504649447473971200	f	parissandwich
We will be back in dumbo today on fronts and Adams. Thank you for the support :) #dumbofoodtrucks #dumbo @DUMBOFoodTrucks @jenchung	1408627797	502447515921580032	f	parissandwich
Dumbo join us for lunch today! Front and Adams at 12 pm @DUMBOFoodTrucks #loveparissandwich	1408546512	502106582180978688	f	parissandwich
Front and Adams today!\n@jenchung @dumbofoodtrucks #dumbo #dumbofoodtrucks\n#vietnamese Open at 11:30 till supplies last	1408026675	499926229584445440	f	parissandwich
@ParisSandwich: Back in dumbo today!\nFronts and Adams @jenchung @DUMBOFoodTrucks 11:30	1407768620	498843868289589248	f	parissandwich
Dumbo, we're on fronts and Adams today at 12 pm @DUMBOFoodTrucks @jenchung	1407509340	497756366543798273	f	parissandwich
Back in dumbo today!\nFronts and Adams @jenchung @DUMBOFoodTrucks	1407422924	497393913137995776	f	parissandwich
Congrats @caitiemariie &amp; Brendan Bray - so happy Mexicue could be there to celebrate your wedding with you! http://t.co/iadLMInBPE	1411777023	515656329130958848	f	mexicue
RT @BCDRestaurants: TGIF! #NowCraving the green chili queso nachos from our client @Mexicue! Starting our weekend off right! #BCDStrategic	1411767755	515617453955895296	f	mexicue
Almost time for this | Get it at #MadSqEats till 9pm http://t.co/R0rdqHtFPt	1411757073	515572651067461633	f	mexicue
Nachos. \nBecause Friday http://t.co/ygn0tz8AkW	1411744332	515519211150802944	f	mexicue
Jeter 	1411700133	515333826848247808	f	mexicue
Our own @thomaskelly serving up some Mexicue on a major day at @Yankees Stadium #FarewellCaptain http://t.co/ZQ0pzsVgB5	1411677903	515240586585313280	f	mexicue
Market Plates http://t.co/o3krI1ecjx and why you should know them  http://t.co/ZAfT8qqSOX	1411672211	515216713173204992	f	mexicue
Jambalaya + Burrito = Jamburrito \n#DoThis http://t.co/BRQq6rfshZ	1411658989	515161255955660801	f	mexicue
#DidYouKnow that you can get any 4 of our homemade sides as a Market Plate (We wont judge if you get 4x Mac &amp; Cheese) http://t.co/Af2ybRvwPm	1411598041	514905622685691905	f	mexicue
...did we mention cornbread buns? http://t.co/2qcftJSTdn	1411586168	514855822099480577	f	mexicue
Once you go biscuit, you don't go back. Sandwich bread has been trumped - get your fix of our buns at 1440 Broadway http://t.co/1eWGYSI9Rb	1411571279	514793373828661249	f	mexicue
Holy Pulled Pork Taco http://t.co/YXFEpJeLTd	1411512844	514548279405981696	f	mexicue
RT @BCDRestaurants: @mexicue killin' it at #MadSqEats! #GreenChiliMac #BCDStrategic @ Madison Square - Eat At http://t.co/vhjwBlQwwm http:/...	1411508673	514530785412796416	f	mexicue
First day of fall is best spent outside eating your face off at #MadSqEats IMO http://t.co/RVq6ziSZLu	1411499172	514490933967323136	f	mexicue
Our Pulled Pork tacos are made for anyone who's ever known the glory of chips in a sandwich. Do it up #TacoTuesday http://t.co/9q8aLrN7hX	1411484848	514430854953984000	f	mexicue
Mondays suck a hell of a lot less with a healthy dose of guac. \n\nWe've got your fix: http://t.co/o3krI1ecjx | http://t.co/1NJe9M9Kof	1411420574	514161269725990912	f	mexicue
@JeniSkillz what we do!	1411411989	514125262087553026	f	mexicue
RT @JeniSkillz: @Mexicue you teased me with a beautiful chili slider. @MadSqParkNYC http://t.co/DYBPgG171M	1411411981	514125229145477120	f	mexicue
Monday Lunch Decisions: Salad or Burrito? \n\nDo your best Indiana Jones &amp; #ChooseWisely http://t.co/XV8KR5kk9s	1411398420	514068350859636737	f	mexicue
Getting quinoa-ed at #MadisonSqEats is a hell of a good way to cap off the weekend http://t.co/cOqQ6yliOW	1411332438	513791601291059200	f	mexicue
SCREAM IT FROM THE ROOFTOPS IT'S CHEESESTEAK FRIDAY @randomfoodtruck @VICTORIASSECRET @DEFJAMRECORDS @YRNY @BADBOYRECORDS 55th st &amp; Bway	1411743998	515517809624104960	f	carlssteaks
RT @MLB_PR: This #Postseason will also be the first without both the #Yankees and #RedSox since 1993.	1411593220	514885402042572801	f	carlssteaks
Sorry midtown east blame UN summit ha no parking on 47th st &amp; Park Av today no worries @TheSeaport till 5 Front st &amp; john st GOT WHIZ?	1411570100	514788431101452288	f	carlssteaks
RT @dumbolot: Happy Tuesday! We got @SweetChiliNYC @KimchiTruck and @carlssteaks for lunch!	1411482272	514420050540126208	f	carlssteaks
come by the stadium this week &amp; say goodbye to Jeter &amp; of course grab a Carls famous Cheesesteak GOT WHIZ?... http://t.co/GeW9mWtPDs	1411422979	514171359170396160	f	carlssteaks
come by the stadium this week &amp; say goodbye to Jeter &amp; of course grab a Carls famous Cheesesteak GOT WHIZ?  #RE2PECT http://t.co/kRtvtDc98K	1411422866	514170886577192960	f	carlssteaks
Mondays and better w a Carl's famous Cheesesteak WSoHotrucks Varick st &amp; Charlton st till 3 30 GOT WHIZ?  #RE2PECT	1411396191	514059001848692736	f	carlssteaks
Mondays and better w a Carl's famous Cheesesteak @WSoHotrucks Varick st &amp; Charlton st till 3 30 GOT WHIZ?  #RE2PECT http://t.co/CKQzzxuD3l	1411396135	514058767626174466	f	carlssteaks
Happy Sunday folks @prospect_park food truck rally till 5 grab a Carl's famous Cheesesteak &amp; enjoy the park GOT WHIZ? http://t.co/hZImmQnxk5	1411315415	513720202899382272	f	carlssteaks
Happy Sunday folks @prospect_park food truck rally till 5 grab a Carl's famous Cheesesteak &amp; enjoy the park GOT WHIZ? http://t.co/CWOzB8o6lY	1411315322	513719813894836226	f	carlssteaks
Another great day @GovIslandFood here till 6 grab a Carl's famous Cheesesteak and enjoy the island GOT WHIZ? http://t.co/klyw0FOo6e	1411229521	513359937066774529	f	carlssteaks
Another great day @GovIslandFood here till 6 grab a Carl's famous Cheesesteak and enjoy the island GOT WHIZ? http://t.co/W727fb8gZr	1411228975	513357649128476672	f	carlssteaks
SCREAM FROM THE ROOFTOPS IT'S CHEESESTEAK FRIDAY\n randomfoodtrucK\n VictoriasSecret \nYRNY\nDefJamRecords \nBadBoyRecords\n 55TH ST &amp; BWAY 3:30	1411136094	512968077118820352	f	carlssteaks
SCREAM FROM THE ROOFTOPS IT'S CHEESESTEAK FRIDAY @randomfoodtrucK\n @VictoriasSecret @YRNY@DefJamRecords @BadBoyRecords\n 55TH ST &amp; BWAY 3:30	1411136030	512967805822832640	f	carlssteaks
Happy Thursday folks great weather @TheSeaport front st &amp; Jay st till 7 grab a Carl's famous Cheesesteak &amp; enjoy the weather GOT WHIZ?	1411054805	512627124436750336	f	carlssteaks
Hump day CHEESESTEAK FOR ALL!! 47th st &amp; Park Av till 3 @nfl @MLB @UBS @SIRIUSXM @SiriusXMNFL @jimmyfallon GOT WHIZ? http://t.co/KVhVhP1skL	1410962866	512241505193701376	f	carlssteaks
Hump day CHEESESTEAK FOR ALL!! 47th st &amp; Park Av till 3 @nfl @MLB @UBS @SIRIUSXM @SiriusXMNFL @jimmyfallon GOT WHIZ? http://t.co/np9PShLwLZ	1410962809	512241267108216833	f	carlssteaks
Let's do the CHEESESTEAK RAIN DANCE FOLKS!! OK great now come by dumbolot on jay st &amp; water st till 3 30 &amp;grab a Carl's famous Cheesesteak	1410879677	511892584713969664	f	carlssteaks
Let's do the CHEESESTEAK RAIN DANCE FOLKS!! OK great now come by @dumbolot on jay st &amp; water st till 3 30 &amp;grab a Carl's famous Cheesesteak	1410879633	511892400315576320	f	carlssteaks
Mondays are better with a Carl's famous Cheesesteak WSoHotrucks Varick st &amp; Charlton st till 3 30 GOT WHIZ? #RE2PECT http://t.co/mKneI6xmJe	1410791092	511521030855487489	f	carlssteaks
Wow sunshine NYC ! We r ready 2 serve varick and king st now!!! Try our rice bowl and burger , bibimbap burrito . Plz stop by and enjoy Thax	1411055767	512631160196055042	f	bobjotruck
Thanks for coming #sunnyside- great to see you!	1411604010	514930658603716608	f	polishcuisine
Good morning ! We r open at 47th st between park and lex  ave. Try our rice bowl, rice burger, bibimbop burrito !! Plz stop by and enjoy thx	1410968014	512263096887685120	f	bobjotruck
Good morning NYC . We r ready to serve @ water and Hanover sq!! Please come by and enjoy!! Thank you.	1410882361	511903842221707264	f	bobjotruck
We r open Ready to serve @47th between park and lex ave. Try our rice bowl , rice burger and bibimbap burrito.plz come by and enjoy thank u!	1410536026	510451209317384193	f	bobjotruck
Hello NYC ! We r open at varick and king st. Try our rice bowl and rice burger , bibimbap burrito!  Thank you!!	1410449907	510089997899542529	f	bobjotruck
Good morning NYC! We r ready2serve rice bowl rice burger and bibimbap burrito &amp; veggie dumpling @47th between park and lex comeby&amp;enjoy thx	1410363376	509727063394496512	f	bobjotruck
And we hav rice burger as well thx again!!	1410277680	509367625600991233	f	bobjotruck
Hello NYC we r ready to serve rice bowl and bibimbap burrito, dumpling . We r open here water &amp; Hanover sq. plz ce by and enjoy thank you!!	1410277627	509367405664280576	f	bobjotruck
We open at 47th st. Between park ave and Lexington ave. have a great weekend! Thx	1409930611	507911912634724353	f	bobjotruck
Happy Friday everyone! We r ready to serve rice bowl,rice burger &amp; bibimbap burrito! Plz come by and enjoy BOBJO ! Thank you very much	1409930542	507911625526247426	f	bobjotruck
Hello NYC! we r open at varick and king st . Try our rice bowl ,rice burger,bibimbap burrito :beef pork chicken . Plz stop by &amp;enjoy thank u	1409845051	507553051230896128	f	bobjotruck
Hello NYC ! We r open at 47st  between park and lex ave try rice bowl and rice burger , bibimbop burrito come by and enjoy thank you !!	1409758960	507191958180491264	f	bobjotruck
Hello NYC ! We are open at 46th st. Between5th ave&amp;6thave. Try our rice bowl , rice burger and bibimbap burrito. Come by and enjoy thank you	1408979171	503921285622403072	f	bobjotruck
Sunshine NYC! We r open at 46th between 5th &amp; 6th ave. Try our rice burger,rice bowl(beef,spicy pork,chicken)and bibimbap burrito!! Thank u!	1408027530	499929812807729153	f	bobjotruck
Good morning NYC ! We r open at winter and Hanover sq.  we r ready to serve rice bowl rice burger and bibimbap burrito plz comeby &amp;enjoy thx	1407857869	499218202464096256	f	bobjotruck
Hello NYC !! We r open at 46th st between 5th ave and 6th ave . Try our rice burger,ricebowl and bibimbap burrito! Thank you	1407770398	498851324327636992	f	bobjotruck
Hello NYC !!! we r open at 46th st between 5th and 6 th ave try our  rice burger rice bowl and bibimbap burrito. Thank you	1407253520	496683380101353473	f	bobjotruck
TGIF ! We r open at 47th st between park&amp;lexington ave. Try our rice bowl ,rice burger and bibimbop burrito. Plz come by and enjoy 	1406908339	495235588480831489	f	bobjotruck
Goodmorning! We r open at 47th st between park&amp;lexington ave. Try our rice bowl ,rice burger and bibimbop burrito. Plz come by and enjoy 	1406730550	494489883277529090	f	bobjotruck
Sunshine NYC !We r open at varick and king we r ready 2 serve rice bowl() , rice burger() bibimbap burrito.plz Comeby &amp; Enjoy :) TGIF	1406302989	492696562884431872	f	bobjotruck
RT @bethers827: Have you seen @VegNews write up on @VeganLunchTruck ?! I featured them today on http://t.co/DFMPzBuyPa #snail #vegan http:/...	1411765119	515606397791510531	f	veganlunchtruck
Planning next week's awesomeness...\n\nOn Monday, we will have one truck on 48th/6th, where would you most like Snaily2 to visit?	1411764629	515604343077498880	f	veganlunchtruck
@emmaleigh014 we have both including gluten free donuts as well	1411748039	515534759481839616	f	veganlunchtruck
@emmaleigh014  most are but free.  No "hidden" nuts for sure.  Just ask at the truck and they will tell you which ones have nuts	1411745673	515524834227666944	f	veganlunchtruck
PLEASE RT:\n\nDifferent spots today due to blocked streets from the GA-\n\nWe will be on:\n\n55th between 6th/7th 9-3:00\n33rd/Park 8:30-3:00	1411735713	515483060075515904	f	veganlunchtruck
@spbail 33rd/park and 47th/park	1411693179	515304662036410368	f	veganlunchtruck
Parked in Jersey City at the grove st path station until 8:00pm RAIN OR SHINE.  \n\nThe Snail loves our JC peeps  http://t.co/Z5xAJ8iMMN	1411679460	515247119838765056	f	veganlunchtruck
RT @stevenseighman: Today's special at the @VeganLunchTruck, buffalo cauliflower w/ habanero sauce and ranch is possibly one of the best th...	1411670793	515210766077927425	f	veganlunchtruck
RT @JulianVModesto: She's the worst thing / That I've been addicted to (@ The Cinnamon Snail - @veganlunchtruck) https://t.co/NGGc5JvDO9 ht...	1411668070	515199344216375296	f	veganlunchtruck
Our cider donuts &amp; coffee are perfect for a rainy day.\n\nWe are on 21st/5th until 3:00 then in Jersey City 8:00-5:00 http://t.co/V1c0FyPS3m	1411666341	515192095175626752	f	veganlunchtruck
21st &amp; 5th 9:00-3:00\n\nYOU KNOW YOUR BOYS ARE ON SOME RAIN OR SHINE 'ISH\n\nSlinging habanero buffalo cauliflower subs  http://t.co/MNkaRkCv7c	1411651612	515130317154557952	f	veganlunchtruck
RT @svenina7: Thank you cinnamon snail for a bountiful lunch that caused no harm to other living things. .	1411593035	514884626893250563	f	veganlunchtruck
Woot woot! As of this afternoon 30k people have liked the Cinnamon Snail upon the mighty book of faces.  http://t.co/NJ48puZ2Kz	1411590364	514873421965316096	f	veganlunchtruck
@pinguswobbin ? We are there every Monday 48th between 6th/7th	1411572983	514800522340360192	f	veganlunchtruck
@imavip we are in lower Manhattan every Tuesday usually on water/Gouvernour Ln in FiDi	1411565770	514770268292935680	f	veganlunchtruck
PLEASE RT:\n\nNEW MIDTOWN SPOT 55th between 7th/6th avenue 9:00-3:00\n\nVanilla bourbon creme brulee donuts today!  http://t.co/dfcUt4QZxZ	1411559762	514745067672973312	f	veganlunchtruck
@thetinyraccoon I don't even know what that means but it's amazing 	1411498200	514486858840297472	f	veganlunchtruck
RT @thetinyraccoon: I'm like a duckling imprinted on the grilled creole tofu sub at @VeganLunchTruck	1411498183	514486785737768960	f	veganlunchtruck
RT @SuperVegan: Is it vegan if I threaten to kill any person in front of me in the @VeganLunchTruck line who grabs that last almond maple b...	1411495912	514477261500985344	f	veganlunchtruck
Today's special is our @vendyawards winning sage tempeh sausage burger \nW/ truffled cashew cheese\n\n@eristocat @melaniejbakes @KEWalling	1411486746	514438817101905922	f	veganlunchtruck
Come Grab a Pie! We are on 52nd St &amp; Broadway, #NeaExpress	1409852478	507584200262709248	f	neaexpress
Beer and Pizza on Friday Night! We are Near BK Brewery on N Wythe and 11th St. Come try our Margherita and Nutella for Dessert!	1409357818	505509445947101184	f	neaexpress
#NeaExpress, We are on E 33rd. &amp; Park Ave. and 20th St. &amp; 5th Ave.	1409161270	504685064165523456	f	neaexpress
Truck Numero uno is on Water and Fulton St and Numero dos is on E 4th St. &amp; 2nd Ave. Coome try our Spicy a Diavolo	1408660435	502584408394964992	f	neaexpress
Dinner Time! We have a truck in The Burg on Wythe Ave. &amp; N 11th St. Come try our Vegan Marinara, Vegetarian Verde!	1408659874	502582056728424449	f	neaexpress
Oh No The Truck on 86th St. &amp; Lexington sold out!! You can still find pizza at Columbia W 116th St. &amp; Broadway and at Water &amp; Fulton St	1407966380	499673333269803008	f	neaexpress
Pick up an all Natural Pizza for Dinner!\nOur Trucks are at 86th &amp; Lexington,\nWater St &amp; Fulton, and 116th &amp; Broadway	1407966081	499672078715727872	f	neaexpress
Rainy Day? Perfect Day for a hot Neapolitan Style Pizza, and a Coke!\nWe are on  20th and 5th, Varick and King, and 55th and Broadway	1407943681	499578125937049601	f	neaexpress
All Natural, Neapolitan Style Pizza Sound Good? Join us for dinner on 86th St. &amp; Lexington Ave, E 8th St &amp; Astor Pl. or 116th St &amp; Broadway	1407791861	498941346938634240	f	neaexpress
In Manhattan, Going to Webster's Hall? Don't Eat! We got you covered. We are on 4th ave between 10th and 11th! Come check us out!	1407626226	498246621235515392	f	neaexpress
In the mood for some Authentic Neapolitan Style Pizza, Williamsburg members we are on 11th and Wythe. Come try our Vegetarian Verde!	1407626127	498246206133645315	f	neaexpress
The trio #NeaExpress trucks are ready to serve! Truck 1 is on 60th and Madison, Truck 2 on 33rd and Park, and Truck 3 on Broadway and 52nd.	1406728023	494479284241571840	f	neaexpress
Good Morning! Find a Neapolitan Truck on 33rd and Park ave and another on Prince st and Broadway. #healthyfood #gourmet #nycpizza	1406645047	494131260315271168	f	neaexpress
RT @EdibleBrooklyn: Our Great Food Truck Derby will benefit @haygroundschool's projects. Tickets: http://t.co/arJpyopbAH @montaukiceco @mor...	1406560745	493777671608758274	f	neaexpress
Find us on 33rd and Park ave today. Get better acquainted with our gourmet pan pizzas by joining us today. #neapolitan #nyc #healthy #nomnom	1406560644	493777249577869312	f	neaexpress
RT @CrespoMax: Part of @NeaExpress #cleanenergy fleet filling up after selling out every location @CE_NatGas @boonepickens http://t.co/3JhQ...	1406555988	493757719086497794	f	neaexpress
Neapolitan Express Truck 1 is on 33rd and Park ave right now. Come join us. #nyc #healthy #light #fresh #authenticneapolitan #naples #italy	1406307734	492716466790084608	f	neaexpress
@brianJschulz Hey Brian, not quite downtown but we're currently on 20th and 5th ave.	1406219673	492347112181350400	f	neaexpress
Good day! Find NeaExpress Truck 1 on 52nd and 6th ave or NeaExpress Truck 2 on 20th and 5th ave. #nomnom #nyc #healthyeating #pizzeria #food	1406216399	492333381359636480	f	neaexpress
coming back soon under a new brand name\nCasey's steaks http://t.co/wfD88ssdpV	1397096188	454080439720751104	f	steaksncrepes
50 st bet 6 &amp; 7 ave for lunch till 03:30. come for the best old style cheesesteaks in #nyc. combo w/ fries &amp; drink $10 only. #midtown #lunch	1374766188	360421632625483776	f	steaksncrepes
hudson and king st for lunch till 03:30. come for the best old style cheesesteaks in #nyc. combo w/ fries &amp; drink $10 only. #midtown #lunch	1374678996	360055922934038528	f	steaksncrepes
RT @ice_cold_brusca: @steaksNcrepes has the best philly cheese steak in the city... I love when they come by my job #46st #boldstatement #n...	1374678938	360055678896832513	f	steaksncrepes
50 st bet 6 &amp; 7 ave for lunch till 03:30. come for the best old style cheesesteaks in #nyc. combo w/ fries &amp; drink $10 only. #midtown #lunch	1374504972	359326013995499520	f	steaksncrepes
hudson and king st for lunch till 03:30. come for the best old style cheesesteaks in #nyc. combo w/ fries &amp; drink $10 only. #midtown #lunch	1374071696	357508722785914880	f	steaksncrepes
46 &amp; 6 ave for lunch till 03:30. come for the best old style cheesesteaks in #nyc. combo w/ fries &amp; drink $10 only. #midtown #lunch	1373986133	357149847138205701	f	steaksncrepes
50 st bet 6 &amp; 7 ave for lunch till 03:30. come for the best old style cheesesteaks in #nyc. combo w/ fries &amp; drink $10 only. #midtown #lunch	1373900283	356789763187019776	f	steaksncrepes
Hudson &amp; king st for lunch till 03:30. come for the best old style cheesesteaks in #nyc. combo w/ fries &amp; drink $10 only. #midtown #lunch	1373468853	354980218034855937	f	steaksncrepes
46 &amp; 6 ave for lunch till 03:30. come for the best old style cheesesteaks in #nyc. combo w/ fries &amp; drink $10 only. #midtown #lunch	1373379393	354604994579791874	f	steaksncrepes
50 st bet 6 &amp; 7 ave for lunch till 03:30. come for the best old style cheesesteaks in #nyc. combo w/ fries &amp; drink $10 only. #midtown #lunch	1373298135	354264172940365825	f	steaksncrepes
Hudson and king st for lunch till 03:30. come for the best old style cheesesteaks in #nyc. combo w/ fries &amp; drink $10 only. #midtown #lunch	1372861990	352434846590701569	f	steaksncrepes
46 &amp; 6 ave for lunch till 03:30. come for the best old style cheesesteaks in #nyc. combo w/ fries &amp; drink $10 only. #midtown #lunch	1372778663	352085349197029378	f	steaksncrepes
50 st bet 6 &amp; 7 ave for lunch till 03:30. come for the best old style cheesesteaks in #nyc. combo w/ fries &amp; drink $10 only. #midtown #lunch	1372345056	350266668448096257	f	steaksncrepes
50 st bet 6 &amp; 7 ave for lunch till 03:30. come for the best old style cheesesteaks in #nyc. combo w/ fries &amp; drink $10 only. #midtown #lunch	1372087020	349184390254977024	f	steaksncrepes
50 st bet 6 &amp; 7 ave for lunch till 03:30. come for the best old style cheesesteaks in #nyc. combo w/ fries &amp; drink $10 only. #midtown #lunch	1371479327	346635540185096195	f	steaksncrepes
50 st bet 6 &amp; 7 ave for lunch till 03:30. come for the best old style cheesesteaks in #nyc. combo w/ fries &amp; drink $10 only. #midtown #lunch	1371221351	345553511834083328	f	steaksncrepes
50 st bet 6 &amp; 7 ave for lunch till 03:30. come for the best old style cheesesteaks in #nyc. combo w/ fries &amp; drink $10 only. #midtown #lunch	1371049735	344833699214422017	f	steaksncrepes
46 &amp; 6 ave for lunch till 03:30. come for the best old style cheesesteaks in #nyc. combo w/ fries &amp; drink $10 only. #midtown #lunch	1370962868	344469353183449088	f	steaksncrepes
50 st bet 6 &amp; 7 ave for lunch till 03:30. come for the best old style cheesesteaks in #nyc. combo w/ fries &amp; drink $10 only. #midtown #lunch	1370877243	344110215957995522	f	steaksncrepes
Happy lovely Friday \nLangos Truck\n        Is\nDowntown \nWater street and Old Slip\nTill 2pm\nAfter hopefully \nNyu W4st and Greene\nFrom 4-8pm	1411743986	515517761435734016	f	langostruck
Hi Friends the Langos Truck couldn't park in Midtown (47st &amp; Park) so we had to move Downtown corner of Water st. and Old Slip from  11-2pm	1411567658	514778188636241921	f	langostruck
We got something special from our regular Guest. Thank You http://t.co/pFYNDdXZ9W	1411507175	514524503875928065	f	langostruck
Tonight We going to visit NYU corner of W 4 st and Green St from 4-8pm enjoy	1411477742	514401051978776576	f	langostruck
Hi we are in Downtown Wall st area corner of Water st. and Old Slip now we serving Black Angus beff stew w isreali coucous side vege salad.	1411477653	514400678027223040	f	langostruck
Hi Friends\nWe are in Midtown for lunch\nFrom 11-2:30pm\n47th.st bet Park &amp;Lexington Ave\nserving stuffed cabbage ,peppers and Hungarian gulash	1411134424	512961069623820288	f	langostruck
Hi there\nTruck is fixed back to the road.\nTonight Astoria Queens\nOn 30th.ave bet 31-32street \nTill 9pm\nThank you	1411071264	512696160318808064	f	langostruck
Unfortunately our truck has some technical difficulties,hopefully able to fix by this afternoon.	1411048162	512599262556073984	f	langostruck
Hi we like to share this great review. http://t.co/BFhCZKdWww	1411048050	512598793259601920	f	langostruck
Happy Wednesday Langos Truck is in Downtown next to "Wall st " corner of Water st and Old Slip from 11-2:30\nThank You	1410965372	512252014861221888	f	langostruck
Hi Guys we serving Wall street area.corner of Water st and Old Slip from 11 -2:30pm afternoon we moving to NYU 4-8pm W4st and Green st THX	1410790677	511519291624423425	f	langostruck
Hi we are front of NYU\nTill 8pm\nCorner of W 4street and Green street	1410553212	510523290939834369	f	langostruck
Dear Friends\nLangos Truck is in Midtown\nLunch time only\nFrom 11-2:30pm\n\n47th. Street bet Lexington Ave and Park Ave\nThanks You	1410529257	510422816668532736	f	langostruck
Holla\nAstoria Queens tonight\nCorner of 31 street and 30th. Ave\nFrom 4-9pm\nThank You	1410447440	510079651944091649	f	langostruck
Dear Friends\nLangos Truck serving Lower East Side\nFront of Keybar\nOn 13th. St bet Ave A &amp; 1st. Ave\nFrom 5pm-11pm\n\nSun Hun Festival in CT.	1409938193	507943713914769408	f	langostruck
Hi \nLangos Truck in Queens Astoria\nCorner of 30th. Ave &amp; 31 street till 9:30pm	1409861397	507621610421899267	f	langostruck
Hi \nLT is in the Meatpacking District\n1 block from Standard Hotel \nCorner of Washington street &amp; Gansevoort street \nTill 7pm	1409413341	505742324606181376	f	langostruck
Hi the Langos Truck will be in the Meatpacking District\nFrom 12-7 pm\nThe exact location will be updated in the morning .\nEnjoy your lweekend	1409356832	505505311500017665	f	langostruck
Hi happy friday and long weekend\nLangos truck  is in Midtown Manhattan\nOn 47th. Street bet Park and Lexington Ave. \nfrom 11-2:30pm\nThanks	1409319764	505349834065592320	f	langostruck
Hi\nPlease don't forget Langos Truck is in Astoria Queens \nOn 30th. Ave bet 31-32street till 9pm\nThx	1409256620	505084990154362880	f	langostruck
The jawn is back baby! Just in time for Phil's Phriday! Come find us on 41st and 6th 11-2. Get your Phil!	1411738243	515493673661120512	f	philssteaks
One more day off for the jawn :( \nshould be back out tomorrow stay tuned	1411651320	515129092426190848	f	philssteaks
Off the road again today. The jawn is getting some serious work done but should be back up and running tomorrow. Stay tuned	1411563670	514761459898007553	f	philssteaks
RT @nycfoodtruck: Guest Blogger of the Week: Jamie Logan - Take it away, Jamie! http://t.co/wczzimbdXR w/ @lobstertruckNY &amp; @PhilsSteaks #f...	1411345989	513848440061968384	f	philssteaks
RT @LamontsVoice: Sitting on the curb enjoying my cheesesteak from @philssteaks at the @DowntownHDSID street fest. http://t.co/O2bFOiU961	1411345979	513848399473696768	f	philssteaks
RT @Eagles: #Eagles are 1st team in @NFL history to start 3-0 after trailing by 10+ points in all 3 games. (h/t @RLiuNFL) #FlyEaglesFly	1411340141	513823909368832001	f	philssteaks
Sorry pholks! We're off today, so no Phil's Phriday. We'll see everybody tomorrow in Jersey City at @downtownhdsid though! #hdsidfair	1411136682	512970541368868864	f	philssteaks
The sun is shining bright on this #TBT! Come find the jawn on 52nd between 6th and 7th. Open at 11, serving til 2!	1411047795	512597722739011584	f	philssteaks
Hungry? Head down to the seaport for food trucks galore! The jawn is on Front and Fulton - open at noon!	1410968197	512263866131427328	f	philssteaks
Head down to the seaport today! We're on Front and John - open at noon!	1410881312	511899444611383296	f	philssteaks
RT @Eagles: KICK. IS. GOOD. #FlyEaglesFly	1410838382	511719379789434882	f	philssteaks
Happy Monday NYC! The jawn is off today for some routine maintenance. Gotta keep her fresh! Back out tomorrow	1410796336	511543027123638272	f	philssteaks
Happy Phil's Phriday pholks!\nThe jawn is on 41st and 6th today from 11-2. Come thru!	1410533534	510440755794812928	f	philssteaks
Dinner shift at NYU! W. 4th and Greene til 8!	1410465527	510155512676360192	f	philssteaks
52nd and 6th today 11-2!	1410444231	510066193643094016	f	philssteaks
Good morning and happy whiz Wednesday! We're down at the seaport on front and Fulton - open at noon, rocking late!	1410360256	509713977279254528	f	philssteaks
We're off today. The big football weekend took it's toll! See you tomorrow downtown at the seaport	1410184743	508977820748767232	f	philssteaks
It's a seaport Saturday! Head downtown and find the jawn on Front and Fulton - open at noon!	1410015374	508267434617626624	f	philssteaks
The jawn is open at 41st and 6th! We're rocking til 2. Happy Phil's Phriday everyone!	1409929383	507906761316384768	f	philssteaks
@carballidolol thanks!	1409884379	507718004344619009	f	philssteaks
Have a great wknd everyone! Enjoy the sunshine!	1411759733	515583809690300416	f	polishcuisine
55th &amp; broadway! @randomfoodtruck	1411743289	515514834532966400	f	polishcuisine
I posted a new photo to Facebook http://t.co/eOg9hNjlK0	1411743217	515514532534710273	f	polishcuisine
I posted a new photo to Facebook http://t.co/NUZEayrL0J	1411741052	515505452189495296	f	polishcuisine
I posted a new photo to Facebook http://t.co/PafWMS2EWo	1411740904	515504831239561216	f	polishcuisine
I posted a new photo to Facebook http://t.co/9mo96UHlUL	1411740856	515504631339032576	f	polishcuisine
I posted a new photo to Facebook http://t.co/eGqYyV5baG	1411740769	515504266111619073	f	polishcuisine
I posted a new photo to Facebook http://t.co/UgRXqwTb7b	1411740722	515504070401224704	f	polishcuisine
BEST #Traditional Lunch! #Pierogitime #GrilledKielbasa @rosannascotto @rachaelray @Gothamist http://t.co/Q0LTKG5g89	1411671795	515214970930606080	f	polishcuisine
RT @redfuton: can't get over how wholesome and #delicious this #kielbasy/#pierogi combo from @PolishCuisine is	1411665474	515188456965046272	f	polishcuisine
RT @nycfoodtruck: Fantastic FiDi food for all featuring Old Traditional Polish Cuisine, Frites 'n Meats, SOUVLAKI.GR, Schnitzi, and... http...	1411661761	515172882620887040	f	polishcuisine
I posted a new photo to Facebook http://t.co/b4cy51VIMR	1411659994	515165470602047490	f	polishcuisine
Ready for lunch? We are on the corner of Hanover Sq &amp; Water St until 2:30! #FinancialDistrict @nycfoodtruck	1411657338	515154330991992833	f	polishcuisine
WE MADE IT! The Fantastic Food Carts of Wall Streets Hanover Square http://t.co/vCiRf3AHQh via @EaterNY @timeoutnewyork @grubstreet #NYC	1411656523	515150913212665857	f	polishcuisine
I posted a new photo to Facebook http://t.co/gE4N9jTgfk	1411651847	515131302270734337	f	polishcuisine
I posted a new photo to Facebook http://t.co/vVqqd1Tn88	1411651758	515130929401303040	f	polishcuisine
I posted a new photo to Facebook http://t.co/UmleNtFYvU	1411651654	515130492606496768	f	polishcuisine
I posted a new photo to Facebook http://t.co/mSPAV7tbJz	1411651610	515130305465028608	f	polishcuisine
Find us on the corner of Hanover Sq &amp; Water st today!	1411647791	515114289808834561	f	polishcuisine
RT @Foodtruckgirl7: It's #foodtruckfriday look @ @milktrucknyc @schnitznthings @bobjoTruck @fritesnmeats looking all delicious this week ht...	1411741441	515507086860779520	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water &amp; pearl st. Burger of the week THE GUACAMOLE BLAST. Preorder 9172929226 #fidi	1411739979	515500954373083136	f	fritesnmeats
RT @Foodtruckgirl7: Best part of walking to work is seeing what trucks are out!  Morning @fritesnmeats #foodtruckfriday #nycfoodtruck http:...	1411739827	515500317233139712	f	fritesnmeats
RT @nycfoodtruck: Fantastic Food Carts of Wall Streets Hanover Sq: http://t.co/eko0k3l3tU @PolishCuisine @fritesnmeats @Souvlakitruck @sch...	1411686862	515278165259063297	f	fritesnmeats
Peeps, we are off the road today:(	1411653444	515137997319446528	f	fritesnmeats
Peeps, we are off the road 2day:(	1411568316	514780948622475265	f	fritesnmeats
Lunch 2day @ 10 Hanover sq b/t water &amp; pearl st. Burger of the week THE GUACAMOLE BLAST. Preorder 9172929226	1411479996	514410504987901952	f	fritesnmeats
@little_ducky share some love on yelp:)	1411430780	514204080630423552	f	fritesnmeats
@Simigirl79 hey, thx for the feedback. share some love on yelp if u have the chance:) c u soon.	1411430630	514203447760277504	f	fritesnmeats
RT @Simigirl79: @fritesnmeats as usual my burger and so awesome fries with the garlic aoli was delicious	1411430470	514202777581785088	f	fritesnmeats
@little_ducky thx for trying us out:)	1411412845	514128853363867648	f	fritesnmeats
RT @little_ducky: @fritesnmeats Loved my lunch today from the truck! keep up the great work!	1411412828	514128784296247296	f	fritesnmeats
Sorry peeps. We meant to tweet lunch @ 52nd st b/t 6th &amp; 7th av:)	1411397368	514063938200535040	f	fritesnmeats
Lunch 2day @ 52nd st b/t 6th &amp; 7th av. Burger of the week THE GUACAMOLE BLAST	1411397268	514063520133316608	f	fritesnmeats
Lunch 2day @ 52nd st b/t 5th &amp; 6th av more towards 6th av. Burger of the week THE GUACAMOLE BLAST. Preorder 9172929226 #midtown	1411394250	514050861736423424	f	fritesnmeats
@justyniak hey! The first week of October:) we miss u too!	1411393917	514049462835355648	f	fritesnmeats
RT @justyniak: @fritesnmeats Haiiiii :) When is the italian job burger coming, please ? I miss it and I miss youuu!!!	1411393870	514049267686989824	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water &amp; pearl st. Burger of the week THE TEXAN. Preorder 9172929226 #fidi	1411135644	512966188344045569	f	fritesnmeats
Hello brooklyn, lunch 2day @ jay &amp; front st. Burger of the week THE TEXAN. Preorder 9172929226 #dumbo @DUMBOFoodTrucks	1411048408	512600294283542530	f	fritesnmeats
Lunch 2day @ Hudson &amp; king. Burger of the week THE TEXAN. Preorder 9172929226 #soho	1410962514	512240026877722624	f	fritesnmeats
RT @itsPinto19: @DomoTaco Idk what the hell you guys were thinking but nacho tots are awesome #amazing #addicted http://t.co/MkD7jYU5NM	1411754671	515562575938199552	f	domotaco
@EatWithNia we're aiming for next thursday!	1411754663	515562541456850944	f	domotaco
RT @nycfoodtruck: Fantastic Food Carts of Wall Streets Hanover Sq: http://t.co/eko0k3l3tU @PolishCuisine @fritesnmeats @Souvlakitruck @sch...	1411754599	515562275340845056	f	domotaco
RT @Foodtruckgirl7: So many choices near me @mooshugrill @milktrucknyc @LATINKITCHENNYC  @SweetChiliNYC @DomoTaco @fritesnmeats what to do ...	1411754580	515562195347070976	f	domotaco
@kellyoc5 til 2:30 today.	1411754556	515562093970747392	f	domotaco
It's a beautiful day for some tacos! Catch the truck in FiDi on Old Slip &amp; Water or our #UrbanSpace on 39th &amp; Broadway!	1411740920	515504899803844609	f	domotaco
Rain rain go away #domotacos here to play on 39th &amp; Broadway! #urbanspacegarment	1411649679	515122208013041664	f	domotaco
RT @thecarlosm201: #domotaco you guys got some slamming ass pork bowls! @DomoTaco	1411594036	514888825240571904	f	domotaco
Serving up tacos at the @dumbolot on Jay &amp; Water and at our #UrbanSpaceGarment booth on 39th &amp; Broadway!	1411567740	514778529746403328	f	domotaco
Sorry #FiDi but the truck is off the streets today. Catch our #UrbanSpaceGarment booth on 39th &amp; Broadway for the dopest tacos in midtown!	1411482014	514418970997567488	f	domotaco
Guess whose back?! #domotaco back on 46th and 6th on this rare occasion. Catch us at the #garmentdistrict pop up... http://t.co/G4AwhlLyBi	1411399741	514073891246194688	f	domotaco
Domo taco truck on 46th &amp; 6th or catch the booth at #urbanspacegarment on 39th &amp; Broadway!	1411395055	514054236905414657	f	domotaco
Truck's at @makerfaire today till 7!!!	1411226994	513349338681311232	f	domotaco
39th and Broadway...let's go! Here till 9pm. http://t.co/m3VJkHPH4O	1411224670	513339591999631360	f	domotaco
RT @akrames: The only line at 3:00 is for @DomoTaco ... Not surprised considering their food is bombbbbb #urbanspacegarment	1411180937	513156160162390016	f	domotaco
End of the line at the #Domotaco tent but we're flying! #flytacos #urbanspacegarment http://t.co/eS3TX0sqBP	1411144837	513004746266120192	f	domotaco
Hello #Friday! The Domo Taco Truck is gearing up for Maker Faire, but Domo's booth at #UrbanSpaceGarment is still here from 11am to 9pm!	1411134505	512961410230652928	f	domotaco
RT @GarmentDstrctNY: The line for @DomoTaco . It's gotta be the Japanese Nacho Tots. http://t.co/JxgOF701IZ	1411053419	512621312448430080	f	domotaco
Domo truck at a private event but our pop up is still open at garment district! You can also book us for your own events!	1411049216	512603685332221952	f	domotaco
The truck is off the streets for a private catering event, but you can find us @GarmentDstrctNY on 39th and Broadway #UrbanSpaceGarment	1411049162	512603458206437376	f	domotaco
Cookin up mooshus on John &amp; Front st today!	1411740699	515503971893792769	f	mooshugrill
Mmm smell that? #Taiwanese #BasilChicken on the grill at 47th &amp; Park ave!	1411650895	515127309087805441	f	mooshugrill
Excited to back down at @TheSeaport today! John &amp; Front st for all your #mooshu needs	1411567434	514777247501520896	f	mooshugrill
#Midtown we're back! Catch us on the corner of 45th and 6th ave for lunch today!	1411482114	514419388188196865	f	mooshugrill
Down at the the seaport on front &amp; john until 3pm!	1411394935	514053733974822912	f	mooshugrill
Come to Old Slip and Water for Moo Shus to start the Friday right	1411134708	512962263377281024	f	mooshugrill
RT @eBrekh: @mooshugrill @TheSeaport Your MSG should probably be parked outside of my MSG (@TheGarden) please	1411061830	512656590663479296	f	mooshugrill
We woke up hella early to serve you guys some award winning moo shus at 47th and park ave. Come show some #love	1411049320	512604120336048128	f	mooshugrill
#mooshus 47th and park!	1411049228	512603734648823808	f	mooshugrill
Slinging #mooshus and rice bowls today @theseaport (Front and John St)	1410961832	512237166353989632	f	mooshugrill
Award winning Moo Shu's at 52nd and 6th ave. Cart to sleep in on this wet day.	1410876607	511879710570475521	f	mooshugrill
Get yourself some #MSG for lunch down at @theseaport! Lil Shu is slinging #mooshus at #NYU on w4th &amp; Greene all day!	1410789650	511514982581014528	f	mooshugrill
Uptown to downtown #msg has got you covered! Check the cart on 50th &amp; 6th or the truck at @TheSeaport on John &amp; Water for lunch today!	1410528831	510421029941182464	f	mooshugrill
#Midtown here we come! Boarder to boarder with the truck on 47th/park and Lil Shu on 45th/6th today!	1410441545	510054927100829696	f	mooshugrill
Get your #mooshu fix on w4th &amp; Washington sq East! #NYU special $7 rice bowls and $8 mooshu combos #broke :)	1410382642	509807868372336640	f	mooshugrill
#humpday ain't a thing when you got #mooshus to cheer you up! Pick up yours at 50th &amp; 6th or Front &amp; John st today!	1410356646	509698833480445952	f	mooshugrill
#MSG all up and down 6th ave today! Catch Lil Shu on 45th &amp; 6th or the truck on 52nd &amp; 6th!	1410269724	509334256720830465	f	mooshugrill
Hola #NYU! We're back on w4th and Mercer for dinner tonight with the #MSG cart! #backtoschool	1410206012	509067031086632960	f	mooshugrill
Good morning new york! #MSG at @TheSeaport on Front &amp; John st and the cart on 50th &amp; 6th!	1410183684	508973377026265088	f	mooshugrill
We wear white after #laborday cus we're fashion rebels #fashionweek #nomsgtho http://t.co/nlEqhK0NsE	1409925449	507890260987367425	f	mooshugrill
@FoodtoEat not in service today, sorry.	1411658308	515158400762904576	f	funbunsnyc
We will be out for maintenance till Wednesday.	1411395748	514057142345949185	f	funbunsnyc
http://t.co/7sz4JvRZVf	1411313190	513710871043112960	f	funbunsnyc
Serving all the Kaufman studio in Astoria 36st and 34th ave .Come check out how movies are made and get a bun or bowl http://t.co/DoanVNVozY	1411313146	513710687072563200	f	funbunsnyc
Free Tea egg friday, add it to any of your favorite rice bowls with duck , beef , pork, or chicken.  On 50th st between 6 / 7 ave #midtown	1411138797	512979412611244032	f	funbunsnyc
Back on 50th st between 6 / 7 ave #midtown serving up lunch with the best buns in midtown	1410968291	512264260765089792	f	funbunsnyc
I posted a new photo to Facebook http://t.co/XYISeK0G2e	1410816450	511627394105737216	f	funbunsnyc
Out for maintenance today . Be back for lunch tomorrow	1410793323	511530391342432256	f	funbunsnyc
Free Tea egg friday with any rice order. Come get your extra fill of protein on 50th st between 6 / 7 ave #midtown http://t.co/GGR6aFmRDq	1410534731	510445777366577152	f	funbunsnyc
Rain or shine , we'll be here for lunch.  Till 230pm on 50th st between 6 / 7 ave #midtown	1410448419	510083758499037184	f	funbunsnyc
It's the mid week lunch cravings. So we are giving FREE chips with any combo you order. at 50th st between 6/7 ave http://t.co/cJy6ZlkOxw	1410360948	509716879787974656	f	funbunsnyc
What's happening new york? Lunch is what's happening ! So get your fill at 50th st between 6 / 7 ave #midtown lunch	1410275677	509359223617368064	f	funbunsnyc
@mikewowayu We have only one cart and its usually in midtown west.	1410220226	509126648202297344	f	funbunsnyc
We are back on 50th st between 6 / 7 ave serving up the best baos in Midtown http://t.co/SNu3Ja84aZ	1410185369	508980444915052544	f	funbunsnyc
BEST BAOS OF NY ! http://t.co/t5RAQ7n5ah	1409980930	508122965977071616	f	funbunsnyc
Back to school special today\nFREE Tea Egg with any rice bowl. Extra protein for your weekend.50th st 6/7 ave #midtown http://t.co/xcFzXQZ4qI	1409925740	507891482809085954	f	funbunsnyc
All kids going back to school and only so much time for lunch. Why not grab a quick bun. At 50th st between 6 / 7 ave #midtown lunch	1409840259	507532948233781249	f	funbunsnyc
Pork , beef, chicken, duck.  \nYour lunch your choice.  We have them all on 50th st between 6 / 7 ave #midtown	1409756433	507181357102284800	f	funbunsnyc
Back from the long weekend, stocked and ready to serve. What's better than a pork bun? Two pork buns ! \n50th st between 6 / 7 ave #midtown	1409665433	506799677401202689	f	funbunsnyc
Have a wonderful labor day weekend everyone we will be back to serve you for lunch on Tuesday	1409321550	505357328892583936	f	funbunsnyc
RT @nick_schultz: This @DelsNYC and @Gansettbeer shandy is delicious (and not even filling) http://t.co/NrhbCLNadi	1410028765	508323601901428736	f	delsnyc
We are in DUMBO @BklynBrdgPark until 4:30, then we head over to @MadSqParkNYC to serve our Flatiron fiends from 6-9pm!	1410023623	508302033628463104	f	delsnyc
RT @MadSqParkNYC: Refreshments for sale at #MadSq200TASK include @Redhooklobster @souvlakitruck @DelsNYC @LaNewyorkina http://t.co/Yiwmkqw6...	1409848662	507568193733275648	f	delsnyc
RT @MadSqParkNYC: Refreshments for sale at #MadSq200TASK include @Redhooklobster @souvlakitruck @DelsNYC @LaNewyorkina http://t.co/Yiwmkqw6...	1409753454	507168862279053312	f	delsnyc
What a beautiful day to end summer! Find us at our usual spot in DUMBO @BklynBrdgPark and also @FoolsGoldRecs party at 50 Kent in the Burg	1409586997	506470694054805504	f	delsnyc
Tomorrow 9/1 we will be on 50 Kent in Williamsburg at the @FoolsGoldRecs day off party! Starting at 2pm	1409510153	506148383787327488	f	delsnyc
@nickyapowell we are outside Grimaldis Pizza @BklynBrdgPark	1409510063	506148007973498880	f	delsnyc
Come spend the last weekend of summer with us @BklynBrdgPark until 7:30	1409502513	506116340512747520	f	delsnyc
RT @PromoChickBeth: I need the @DelsNYC truck to come by the @HOT97 studios in SoHo one day. I'd be the happiest Rhode Islander in Manhatta...	1409359825	505517864850558977	f	delsnyc
After 4pm come visit us at the Abington House for the final Party Under the High Line from 6-9pm! @2910AH #AHartpark	1409151191	504642789288984576	f	delsnyc
We apologize for being MIA the past 2 days. We've been preparing for the hottest day of the week! Come find us at 21st &amp; 5th Ave until 4pm	1409149941	504637547642122241	f	delsnyc
RT @BrooksBrothers: @DelsNYC Thank you again! A delicious tradition at that.	1408633140	502469926398222336	f	delsnyc
@BrooksBrothers Thanks for having us! It looks like this is becoming a tradition!	1408632163	502465829540483072	f	delsnyc
RT @BrooksBrothers: 346 Madison got a sweet treat when @DelsNYC stopped by for #NationalLemonadeDay. http://t.co/cMOrCjJkDX	1408632123	502465660317093888	f	delsnyc
RT @sarahsolfails: Thanks @DelsNYC for stopping by @BrooksBrothers, it was greatly appreciated. #NationalLemonadeDay http://t.co/EbJqmAojTE	1408632072	502465444671160320	f	delsnyc
This weekend we will be at Afropunk Fest with both of our trucks! Come check out some good music and drink Del's!	1408631871	502464602966204416	f	delsnyc
Complimentary Del's available at Abington House!	1408579206	502243712429490176	f	delsnyc
Happy National Lemonade Day! Find us at Abington House Summer Series Event at 500 W30th st 6-9pm @2910AH #AHartpark	1408565494	502186200049152002	f	delsnyc
21st &amp; 5th all day today! #Flatiron and @MadSqParkNYC are a home away from home for us.	1408377663	501398376387457024	f	delsnyc
If you are looking for something fun, @Verboten is putting on a BBQ with DJs at 50 Kent Ave #Willliamsburg. We are there from 3-10pm!	1408298570	501066636443795456	f	delsnyc
@vendyawards @doughbrooklyn @iceandvice @TheAlcreamist	1410645255	510909347749433344	f	crafflesnyc
@NYCFoodieFinder @vendyawards @TheAlcreamist @doughbrooklyn @iceandvice	1406406041	493128795713699841	f	crafflesnyc
@Complex_Sports	1391926650	432397826707193856	f	crafflesnyc
RT @iamscottpage: U.S. bobsledder stuck in hotel bathroom smashes through door for freedom http://t.co/6ZddftPrSf http://t.co/vbYeAIxi7E #S...	1391925845	432394452720975872	f	crafflesnyc
@castingqueenny sure. 917 744 5453  or dinar@craffles.com	1389385233	421738353147781120	f	crafflesnyc
@castingqueenny , hello, what kind of project?	1389320576	421467162835169281	f	crafflesnyc
sg822's photo http://t.co/KWhkXaE3zz:)	1388726745	418976452848410624	f	crafflesnyc
Happy holidays!!!\nMake ur holidays sweet with our delicious crepe or waffles. Our location for today. Hunter college and union square.	1388428190	417724223269142528	f	crafflesnyc
Our locations for today. #Hunter college and #Brooklyn college	1387476362	413731966367047680	f	crafflesnyc
http://t.co/jKJFC95BJ4	1387397511	413401242757758976	f	crafflesnyc
Craffles at Brooklyn College... http://t.co/qRIr2w8nzK	1387054396	411962113587163136	f	crafflesnyc
Hey guys. Warm it up yourself with hot coffee or chocolate with fresh made waffles or crepes.We are staying on 6th ave and 58th st.	1387045723	411925735683919872	f	crafflesnyc
Hi, Craffles truck outside of Columbia university, craffle your day with the nice hot waffle or crepe.	1386961048	411570582506205184	f	crafflesnyc
Snowflakes give us incredible spirit of holiday!!! ##crafflesnyc#craffles http://t.co/ZmgvbOsx3w	1386909009	411352315720110081	f	crafflesnyc
Getting ready for Christmas!!! Free workshop alone with Craffles:)... http://t.co/OEIIb39HAP	1386908785	411351378985250816	f	crafflesnyc
We are at Brooklyn College today!!! # http://t.co/woy9l3jAPN	1386885120	411252119636017152	f	crafflesnyc
We are at Baruch College today!!! http://t.co/T4hJwXwWYi	1386623117	410153196628508672	f	crafflesnyc
It's Christmas time!!! http://t.co/E8yGWPOKz4	1386607451	410087489442164736	f	crafflesnyc
Hey everyone! TU for all the emails, we miss u2. We r still here!! Just taking an extended holiday and will be back after Rosh Ha Shana!	1411135732	512966559116304384	f	grillonwheelsny
Hi guys We are very sorry Grill on wheels off the road today	1410874541	511871043859148800	f	grillonwheelsny
Hi guys We are very sorry Grill on wheels off the road today 	1410790890	511520183744483328	f	grillonwheelsny
GOW truck is getting a tune-up and will be off the road this week. We'll be back next week and "stronger" than ever!!	1410351061	509675407445348353	f	grillonwheelsny
Hi guys We are very sorry Grill on wheels off the road today 	1410281876	509385224741191680	f	grillonwheelsny
We are going to be serving a private event today during lunch!! C U all tomorrow!	1410187803	508990656027848704	f	grillonwheelsny
Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00crazy chicken baby chicken lamb burger couscous	1409929542	507907431733932032	f	grillonwheelsny
Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00crazy chicken baby chicken lamb burger couscous 	1409917625	507857446103429121	f	grillonwheelsny
Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00crazy chicken baby chicken lamb burger couscous 	1409838067	507523755393171456	f	grillonwheelsny
Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00crazy chicken baby chicken lamb burger couscous kofta kabab	1409829581	507488163766755328	f	grillonwheelsny
Parked on 47th off Park Ave today! schnitzel crazy chickenshawarma yummy	1409752583	507165209140932608	f	grillonwheelsny
Parked on 47th off Park Ave today! schnitzel crazy chickenshawarma yummy	1409745267	507134523914846208	f	grillonwheelsny
Grill On Wheels downtown in the financial district! Hanover &amp; Water St- open @11:00 to 3:00	1409665364	506799386152943616	f	grillonwheelsny
Grill On Wheels downtown in the financial district! Hanover &amp; Water St- open @11:00 to 3:00	1409659130	506773240917008384	f	grillonwheelsny
Hi guys We are very sorry Grill on wheels off the road today 	1409324168	505368309312024576	f	grillonwheelsny
Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00crazy chicken baby chicken lamb burger couscous kofta kabab	1409227360	504962266945847298	f	grillonwheelsny
Join us 4 lunch Water st and Old Slip 11am to 3pm\nschnitzel crazy chickenshawarma yummy	1409150997	504641975648526336	f	grillonwheelsny
Join us 4 lunch Water st and Old Slip 11am to 3pm\nschnitzel crazy chickenshawarma yummy	1409141604	504602578026762240	f	grillonwheelsny
Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00	1409062198	504269525567934464	f	grillonwheelsny
Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00	1409057343	504249163870392321	f	grillonwheelsny
RT @mishelleorama: .@shortysnyc thanks for being an awesome place for a much needed beer tonight!!!	1411784369	515687138894299136	f	shortysnyc
RT @gett: Hungry for a cheesesteak? They are $10 at @shortysnyc. #10Flat http://t.co/3WmhO6paSC	1411759672	515583553669967872	f	shortysnyc
RT @barHappy_NYC: Cheesesteaks + Beer + #HappyHour + #LateNight #Specials &amp; it's all found in 1 place @shortysnyc - RT if you're a fan http...	1411759659	515583496434515968	f	shortysnyc
RT @PhillyGiL: Giants "@shortysnyc: Giants / Skins tonight ... Who do we want to lose more ? Is it Sunday yet ?! #flyeaglesfly #GetPhillyWi...	1411683599	515264479345774594	f	shortysnyc
RT @KMJeezy: Yes "@shortysnyc: Giants / Skins tonight ... Who do we want to lose more ? Is it Sunday yet ?! #flyeaglesfly #GetPhillyWitIt"	1411683586	515264423678967809	f	shortysnyc
Giants / Skins tonight ... Who do we want to lose more ? Is it Sunday yet ?! #flyeaglesfly #GetPhillyWitIt	1411682333	515259170455822336	f	shortysnyc
truck is still in the shop.	1411657834	515156414029770753	f	shortysnyc
RT @ShortysTrivia: And the champ of the first week of Trivia @shortysnyc 1st Ave is Team #JetsNiners!! Congrats!!! #nyctrivia http://t.co/N...	1411613028	514968484221321216	f	shortysnyc
RT @seps78: Thanks @shortysnyc for tossing on the @NHLFlames game for a visiting fan w/@SBR212. @NHLFlyers 2015 cup champs? http://t.co/UCL...	1411613019	514968445876961280	f	shortysnyc
RT @EugeneLWinston: Finally, I found a really cool sports bar in Manhattan! @shortysnyc	1411613006	514968391065817088	f	shortysnyc
RT @Foodtruckgirl7: This looks amazing "@shortysnyc : South Street Sampler http://t.co/7j2NgCfpzV.	1411612980	514968280210370561	f	shortysnyc
South Street Sampler http://t.co/jHhuH3t5Zo	1411608723	514950426689429504	f	shortysnyc
RT @Wooderice215: @shortysnyc you guys made our list of the Top 15 @Eagles sports bars outside of Philly http://t.co/4F4HtygcRL #EaglesNati...	1411592205	514881145742581760	f	shortysnyc
@Wooderice215 @Eagles honored.	1411592200	514881121646288898	f	shortysnyc
RT @StaceyFlurzbach: @shortysnyc finally http://t.co/RRmXYq6Gg2	1411592098	514880693458178048	f	shortysnyc
TRIVIA kicks off tonight at Shortys 1st Ave-- 8pm. Bring your teams. $12 Coney Island pitchers all night... http://t.co/alIzoYkQwp	1411575192	514809788719714304	f	shortysnyc
@dumbolot we're in the shop today.  sorry.  back next week.	1411570002	514788019703152640	f	shortysnyc
RT @FakeAdamLyons: It's all over!!! @shortysnyc Team #MyLittleDick WINS THE TICKETS!!! #trivia #ShortysPearl .. See you... http://t.co/VONoKQ...	1411562123	514754970261155841	f	shortysnyc
RT @ConeyIslandBeer: Trivia lovers: @ShortysTrivia at @shortysnyc will be at the new location on 1st Ave TOMORROW NIGHT at 8PM. Don't miss ...	1411506052	514519790627864576	f	shortysnyc
TRIVIA TONIGHT--- Shorty's 62 Pearl-- See you there! #GetPhillyWitIt	1411489076	514448590937542656	f	shortysnyc
Good afternoon twitters ;-) today we are at 97th and Columbus Ave, stop by get your #Tacos #burritos #enchilada\n#TacoTuesday #foodtruck	1408483439	501842034542792705	f	elpasotruck
Come visit us on 97th and Columbus Ave #tacos #burritos #yummy #foodtruck	1406396031	493086810864885761	f	elpasotruck
We are exited to be part of Stars &amp; Ftripes Festival @TheNYRA this Saturday.\n#4ofjuly #tacos Check out the video: http://t.co/VNmBjLkqYm	1404311997	484345740743806976	f	elpasotruck
We will be all day today at 97th and Columbus Ave. Stop by and get tacos, burritos, enchiladas #yummy #tacotruck #foodtruck #TacoThursday	1401383298	472061882845921280	f	elpasotruck
Stop by 97th and Columbus	1400185464	467037805139750912	f	elpasotruck
We are at 97th and Columbus ave tonight! Stop by :)	1399671835	464883487724797952	f	elpasotruck
Today we will be #columbiaUniversity by 116st and Broadway	1399226516	463015684080148480	f	elpasotruck
@mrchristianbaez We are glad you enjoy them!! See you soon :)	1399153802	462710700490911744	f	elpasotruck
Today we are at Columbia University, 115th and Broadway come stop by #ColumbiaUniversity  #TacoTuesday  #foodtruck	1398185685	458650125712490497	f	elpasotruck
Stop by 72nd &amp; York ave we will be here until 3:30pm then we are heading to the #westside on 97th &amp; Columbus ave #tacotruck #tacos #food	1398097554	458280473803096064	f	elpasotruck
We are at 72nd and York ave, Stop by and get your tacos :)	1397581617	456116477423534080	f	elpasotruck
Beautiful weather come by 97th and Columbus Ave to get your tacos! #tacotruck  #westside	1397508622	455810315708805120	f	elpasotruck
It's TACO TUESDAY at 97st and Columbus Ave #tacotuesday #tacotruck	1396383521	451091298980999169	f	elpasotruck
We are here at 97th &amp; Columbus ave, come get your tacos, burritos, enchiladas and quesadillas :) #tacotruck #tacos #burritos #mexicanfood	1396297901	450732185688223744	f	elpasotruck
@CHD_Expert_US  We are at 72nd &amp; York ave we will be arriving to 97st and Columbus Ave around 4:30pm	1396021100	449571196276047872	f	elpasotruck
We are here at 97st and Columbus!!! #TacoTuesday #WestSide #columbusave	1395783837	448576043155456001	f	elpasotruck
It's almost #StPatricksDay . Stop by #ElPasoTruck and get tacos. #weekend #tacotruck #uppertweetsiders	1394901539	444875418450288640	f	elpasotruck
Come to 97th and Columbus Ave. #tacotruck #FoodFri  #FoodieFriday	1394835237	444597325147942912	f	elpasotruck
Beautiful afternoon we have. Come get your tacos here at 97th st and Columbus Ave @wholefoodsnyc @NYCFoodieFinder @truckfoodnyc	1394570373	443486406317731840	f	elpasotruck
We are here at 72nd st &amp; York Ave.	1394467680	443055681101656065	f	elpasotruck
RT @nokidhungry: Thx #TeamNKH for your dedication to ending child hunger. As Sept ends, lets end it with orange http://t.co/mI5pZ8YTBT http...	1411769899	515626447718080513	f	sweetchilinyc
RT @Foodtruckgirl7: So many choices near me @mooshugrill @milktrucknyc @LATINKITCHENNYC  @SweetChiliNYC @DomoTaco @fritesnmeats what to do ...	1411744499	515519912337739776	f	sweetchilinyc
Join us old slip &amp; front 11-3! Support #NoKidHungry &amp; @SixDegreesofKB by ordering #sriracha #fries OR #sixdegreesofspicybacon @kevinbacon	1411741601	515507756015837186	f	sweetchilinyc
RT @nokidhungry: @SixDegreesofKB @kevinbacon @SweetChiliNYC We're excited &amp; honored to have your support on Team #NoKidHungry~Together we'l...	1411678175	515241728958541824	f	sweetchilinyc
RT @tamcdonald: @SixDegreesofKB @kevinbacon @SweetChiliNYC @nokidhungry Love seeing the support for #NoKidHungry after meeting you both at ...	1411676095	515233003447267328	f	sweetchilinyc
We are teaming up w/ @SixDegreesofKB &amp; @kevinbacon to stop hunger in the US! Check out our #sixdegreesofspicybacon ! http://t.co/MGSRl9UdmO	1411659324	515162660854575104	f	sweetchilinyc
RT @SixDegreesofKB: Next week @kevinbacon will visit @SweetChiliNYC to support #NoKidHungry! Find out where you can help: http://t.co/6p2fy...	1411651767	515130966780948480	f	sweetchilinyc
RT @nokidhungry: Only 6 days left to eat out at your favorite restaurant &amp; show your support for #NoKidHungry. http://t.co/mI5pZ8YTBT http:...	1411649098	515119769960595458	f	sweetchilinyc
We won't be out today, but we are back tomorrow!  Stay dry everyone! #rainraingoaway #thesunwillcomeout #umbrella #thaietnamese	1411649088	515119730542530561	f	sweetchilinyc
Taco Truck Busted for Serving Food With &amp;#8216;a Side of Meth http://t.co/p6tXHAOISb via @grubstreet	1411601132	514918588583378944	f	sweetchilinyc
@MitchAdamsNYC email us the info! !	1411599542	514911916922531841	f	sweetchilinyc
@purplejong soon i hope!! But you can come to us for free if you use the code sweetchilinyc with lyft!! Bring a friend &amp; you get free 2x!	1411578438	514823400695812097	f	sweetchilinyc
Get thru your #humpday @TheSeaport on John &amp; front till 3! #NoKidHungry #lunchtime #sriracha #fries #spicy #thaietnamese #tweetmylunch	1411574048	514804989504811008	f	sweetchilinyc
Miss us in ur hood? Use the code SWEETCHILINYC for $25 credit on ur first http://t.co/0wHefDZTam and come have lunch with us this week!	1411516501	514563617451421696	f	sweetchilinyc
RT @nokidhungry: @SweetChiliNYC You had us at #sriracha #fries! Thanks for keeping #TeamNKH in the loop to help make #NoKidHungry reality! ...	1411515474	514559309855064064	f	sweetchilinyc
Join us @dumbolot on jay &amp; water 11-3 today and help support @nokidhungry  #90meals #enditwithorange #stophunger #sriracha #fries #topchef	1411484199	514428133840523265	f	sweetchilinyc
RT @dumbolot: Happy Tuesday! We got @SweetChiliNYC @KimchiTruck and @carlssteaks for lunch!	1411482347	514420366325059584	f	sweetchilinyc
RT @JobsWithHarri: Want to work with a TOP CHEF star DRIVER &amp; CHEF positions available @SweetChiliNYC: http://t.co/goY7XHMQrx #NYCjobs	1411400604	514077512096567297	f	sweetchilinyc
Come out to @gov_island and support #NoKidHungry by ordering #sriracha #fries! #sunnyday #thaietnamese #90meals http://t.co/YwNOFNHSPH	1411226002	513345176430194688	f	sweetchilinyc
RT @nokidhungry: @SweetChiliNYC Thanks so much for your support! LOVE your pics on instagram (esp the sriracha fries...yum)! #TeamNKH	1411152702	513037736341950464	f	sweetchilinyc
@GarmentDstrctNY Present your @gofooda @UrbanSpaceNYC @herdkillingrec http://t.co/jkFErNVRBI promo card for freebies http://t.co/fqQvaRnPtm	1411666586	515193120850718720	f	toastmonsternyc
Hello Upper West Side! We've moved to 88th and Broadway for dinner!	1398202486	458720592602996736	f	goburger
Grab a @gofooda @UrbanSpaceNYC @herdkillingrec @uhohitstinx @kaijudon card at @GarmentDstrctNY for free side or drink http://t.co/4iVkc2kAgF	1411620206	514998588766978049	f	toastmonsternyc
RT @GarmentDstrctNY: Hey @toastmonsternyc ! I'm coming for you this week! I may need some help though. Look at this. http://t.co/3GPEbu6UyQ	1411415347	514139348640743424	f	toastmonsternyc
Toast Monster @UrbanSpaceNYC @GarmentDstrctNY till October 17. On Broadway between 40th and 39th st.	1411270224	513530659156291584	f	toastmonsternyc
Thank you @gofooda for being awesome and delicious. See you soon.	1410900115	511978309199331328	f	toastmonsternyc
Tomorrow is almost here and Toast Monster is ready for #humpday .	1410899785	511976924252758017	f	toastmonsternyc
Herro @GarmentDstrctNY &amp; @UrbanSpaceNYC , pardon our appearance &amp; limited menu por favors. #toastmonster should be all ready by #humpday.	1410844049	511743151061884928	f	toastmonsternyc
Find and share Toast Monster gift meal cards brought to you by http://t.co/tghf8jQvtz . Beginning 9/16 http://t.co/weKb41pNFK	1410817581	511632134248095744	f	toastmonsternyc
Dear whole wide worlds. Today @UrbanSpaceNYC n @GarmentDstrctNY brought @toastmonsternyc back to the streets. rawr.	1410817464	511631646618304513	f	toastmonsternyc
For the month of October: find a digital blue ticket with your meal to win Toast Monster gift box. http://t.co/de308qe1FQ	1410679548	511053185315000320	f	toastmonsternyc
Kaiju has a new make over. Check out http://t.co/3da0btSj5x for our work in progress website. Thank you @gofooda -wawr! @kaijudon	1410383584	509811818475585536	f	toastmonsternyc
@360i thanks for a wonderful time. Always happy to visit. Rawr!	1410383417	509811118387523584	f	toastmonsternyc
I brought #toastmonster #canvas #sharpie #art #sharpieart to #iac #cafe http://t.co/wjheo1BaoU	1410242530	509220197086285824	f	toastmonsternyc
Herros er-body n the whole wide New York City! Check us n some friendly vendor folk @urbanspaceNYC garment district! http://t.co/u43VwRdrmF	1410114933	508685018244595712	f	toastmonsternyc
Herros @huangbenjamin . Cannot say for certain when but..  Find me. Eat me. Rawr! http://t.co/dht7JIhh3o	1409944247	507969105581056000	f	toastmonsternyc
#toastmonster #banner @toastmonsternyc for #canopy #tent came in the #snailmail today. I am #happy... http://t.co/jfXS2dED62	1409891273	507746917330079744	f	toastmonsternyc
Photo of #toastmonster #foodcart with #1977filter #rawr diesilentkiller @cheferamirez #mom http://t.co/MhNKxUzrW6	1409725098	507049930494443520	f	toastmonsternyc
#steak #potatoes #toastmonster #rawr #tinx #magic #photoshop http://t.co/jdLqDbjAIl	1409022422	504102691627614208	f	toastmonsternyc
Toast Monster has good memories havasmedia http://t.co/tDGokNqCUw	1408346196	501266397411168256	f	toastmonsternyc
#toastmonster #macandcheese #sammich #no #sloppyjoe #edited #photoshop #copyandpaste #macaroni #cheese... http://t.co/xSSoo6y8Dp	1408346012	501265624379584513	f	toastmonsternyc
Today we are on\n47th St\nBet\nPark Av / Lexington Av	1406907223	495230905720786944	f	tacobite
Today we are on \n47th st\nBet\nPark Av / Lexington Av	1406821278	494870427018465280	f	tacobite
Today we are on\n47th st\nBet\nPark Av / Lexington Av	1406734660	494507121841823744	f	tacobite
Today We are on 47th st\nBet Park Av / Lexington Av	1406655525	494175207264112640	f	tacobite
Happy Saturday!!\nToday we are on\nBroadway bet\n66th &amp; 67th street\nIn front of Banana Republic store.	1406391983	493069833735770113	f	tacobite
Today we are on\n47th street\nBet\nPark Av / Lexington Av	1406304524	492703001707311104	f	tacobite
Today we are on\n47th street\nBet\nPark Av / Lexington Av	1406215621	492330116769665024	f	tacobite
Today we are on\n47th street\nBet\nPark Av / Lexington Av	1406129332	491968194350157824	f	tacobite
Today on \n47th Street\nBet\nPark Av / Lexington Av	1405959097	491254178464149505	f	tacobite
Happy Saturday! \nToday we are on\nBroadway\nBet 66th &amp; 67th street\nIn front of Banana Republic	1405787062	490532609991389184	f	tacobite
Today we are on\n47th street\nBet\nPark Av / Lexington Av	1405698329	490160437720539136	f	tacobite
Today we are on \n47th st\nBet\nPark Av/Lexington Av	1405610456	489791872525955073	f	tacobite
Today we are on \n47th st\nBet\nPark Av/Lexington Av	1405523529	489427270374002688	f	tacobite
Happy SATURDAY! !!\nToday we are on \nBroadway\nBet 66th &amp; 67th Street.\nIn front of Banana Republic	1405197008	488057744612917248	f	tacobite
Happy Saturday!!\nToday!!!\nFrom 11am-6:30pm\nwe are on broadway \nbet 66/67 street.\nIn front of banana republic	1405177194	487974639382302720	f	tacobite
Serving Lunch today on\n47th St\nBet. \nPark Av / Lexington Av	1405091916	487616954182955009	f	tacobite
Lunch today on\n47th St\nBet\nPark Av / Lexington Av	1405006565	487258968012906496	f	tacobite
Taco Tuesdays!!!\nWe are on \n47th st\nBet\nPark Av/Lexington Av	1404833169	486531693931950080	f	tacobite
Tribute to\nLarry Levan http://t.co/m6X2wAnNIT	1404783379	486322857564073985	f	tacobite
Lunch today on\n47th St\nBet \nPark Av/Lexington Av.	1404745677	486164726263869441	f	tacobite
Fries are ready! @govballnyc #GovBallEEEEEATS http://t.co/b4u6m5clvZ	1402176073	475387025454280704	f	goburger
RT @GovBallNYC: @GOBurger #GovBallEeeeeats	1402175930	475386426239250432	f	goburger
Welcome to VIP @govballnyc #govballnyc http://t.co/Nf5AVVFsJv	1402174356	475379823721054208	f	goburger
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
Truth. Just awoke from hibernation but will be back over there! MT @quarropas it's been a while I think since you have been in midtown west.	1398180649	458629000668401664	f	goburger
#Brazzers truck in T- Square giving free ice cream today @nikkibenz @Phoenixmarie  @moniquealexande &amp; @madisonivy00 http://t.co/MR37Qvslkv	1406998391	495613293286133760	f	thecrepestruck
Come ceck out the Brazzers promo truck in Time Square 48 &amp; 7 ave today till 4pm. http://t.co/wUDdRIZpAh	1406998102	495612081732079616	f	thecrepestruck
Join us tonight at the Abington House, 500 West 30 Street in Manhattan for a free crepe (While supplies last).	1406763633	494628646167252992	f	thecrepestruck
Free crepes for the first 100 people from @TheCrepesTruck at the @AbingtonHouse starting tonight 6pm.	1406751021	494575748888662016	f	thecrepestruck
RT @2910ah: Tonight, first 100 Guests receive Free Lobster Rolls @lobstertruckny and Crepes @TheCrepesTruck  #AHartpark, @2910ah House on t...	1406750346	494572913799233537	f	thecrepestruck
Come visit the Crepes Truck today from 6-9pm at The Abington House Summer Series Event, 500 West 30th Street @2910AH #AHartpark	1406726932	494474710109806592	f	thecrepestruck
Free Crepe Party for you and 500+ friends to celebrate Brazil's win over Germany.	1404853435	486616695726157825	f	thecrepestruck
#AirFranceExpo And #AirFrance have a promo truck giving out free ice cream today 1-2pm on 23 Street by Eataly. http://t.co/Qc5tzoxqLA	1403974584	482930526689689600	f	thecrepestruck
@SrjStar_Music   #AirFrancegiving away free ice cream at Madison Park 1-2pm today	1403966479	482896531276955649	f	thecrepestruck
#AirFranceExpo is giving away gree ice cream in Washington Square Park South	1403809240	482237024246976512	f	thecrepestruck
#TheHub has a new show called #KidPresident. Free ice cream today! http://t.co/YD9VJi4ad5	1403799737	482197164018655232	f	thecrepestruck
#airfrance &amp; #AirFranceExpo  are giving away free ice cream. Today through Saturday http://t.co/jmgBDPaVik	1403797564	482188050664267777	f	thecrepestruck
The Hub has a new TV show titled Kid President. Free ice cream today and tomorrow. http://t.co/an9pPzEjhu	1403713515	481835521438920705	f	thecrepestruck
#VisitCaymanIslands is giving away free ice cream today!\n\nUnion Square West &amp; 14 Street http://t.co/V3Q165zMTR	1403196954	479668909592039424	f	thecrepestruck
@VistCaymanIslands  is giving away free ice cream all week long. \n\nEnter to win a free trip to Cayman Islands http://t.co/F6Cle7U4Rq	1402941240	478596368882466816	f	thecrepestruck
#MikeEpps visits #NewEraCap Promo Truck #SuperBowl with #CrystinaPoncher #ESPN\nhttp://t.co/k0PPVYUhBq http://t.co/3MeumAKTUz	1391084755	428866664227024896	f	thecrepestruck
#VictoriaJustice at #Uggs Aulstralia on Madison Ave &amp; 58 Street tonight from 6:30pm-8pm	1383866974	398593095865884674	f	thecrepestruck
Come meet #VictoriaJustice at the #Ugg Store tonight on Madison Ave. We're giving out free coffee and hot chocolate from 5-6pm	1383864158	398581286391918592	f	thecrepestruck
We're on 50 Street btw 6 &amp;7 Ave today until 3pm. Come check out our Portobello Mushroom Crepe.	1378910456	377803953406509056	f	thecrepestruck
Good morning everyone. Start the week off right with a crepe from #TheCrepesTruck. We're on 50th street between 6 &amp; 7 Ave.	1378732102	377055881386393600	f	thecrepestruck
Our last weekend at @Gov_Island &amp; tmrw is rainy! U know what that means- get your #porkbelly #sataychicken #gojuchang #tofu today! #foodies	1408198481	500646832406818817	f	getstuffednow
Reservation Service @IKnowTheChef Hits the #Hamptons http://t.co/54sl7ndfU4	1407673208	498443678977757185	f	getstuffednow
sun is shining and we r setting up for the day at @Gov_Island, bring u'r bikes and head over 2 the food court ! #Picnicinthepark #streetfood	1407672933	498442527306162176	f	getstuffednow
#rainorshine, we r @Gov_Island dishing #porkbelly, #meatballs &amp; more!	1406994778	495598137881673728	f	getstuffednow
Temple tofu was the most popular option yday at @Gov_Island , what is it gonna be 2day? #veganfaire #tofulove	1406469359	493394369550897152	f	getstuffednow
RT @nytimes: Three New York City waterfront hotspots this summer (Photo: Karsten Moran for NYT) http://t.co/Q7fd6pMEJa http://t.co/PaVZvGIP...	1405868430	490873890587959296	f	getstuffednow
Back at #governorsisland , we were sold out at 2:30 yesterday so get here quick! @Gov_Island	1405867852	490871467148447744	f	getstuffednow
13 Best #NYC parks for families (that arent Central Park): http://t.co/BDMpiMj8TM? Stop by Momos &amp; Buns at the top pick #GovernorsIsland	1404569405	485425387678072832	f	getstuffednow
Its banhmi's today at our @Gov_Island pop up today, nothing tastes better than lpickled carrot daikon &amp; roast meats on soft semolina rolls!	1403961436	482875378113859586	f	getstuffednow
Who's hungry? We r back with some more #peking #duck sliders @Gov_Island ! #popupstore #sundaybrunch	1403448327	480723242697916417	f	getstuffednow
RT @NYCMayorsOffice: Happy Father's Day. http://t.co/D27i0IT5OR	1402846026	478197011238641665	f	getstuffednow
RT @GovIslandFood: Happy Father's Day. Come bring dad to @Gov_Island for some Jazz and great food.@SweetChiliNYC,@MayhemAndStout,@MrNiceGuy...	1402846006	478196925637095424	f	getstuffednow
RT @GovIslandFood: Who's ready for some @jazzagenyc and some great food? @SweetChiliNYC,@ElPasoTruck,@DiSOSNYC,@MrNiceGuyTruck,@Getstuffedn...	1402754477	477813027257847808	f	getstuffednow
RT @nicole_rae: We enjoyed our lunch from @Getstuffednow on @Gov_Island @GovIslandFood #vegan #nyc #governorsisland #FigmentNYC http://t.co...	1402431493	476458332199612416	f	getstuffednow
We sold out by 3pm yday, don't be disappointed 2day-get 2 us as soon as u land on the island! @GovIslandFood @Gov_Island @livefastgroup	1402238487	475648807070609408	f	getstuffednow
Todays kid special @Gov_Island pop up stand - decadent triple chocolate cookies ! #weekend is 4 #familytime !	1402151133	475282419512532992	f	getstuffednow
Catch us at #Governors Island every weekend , The Ultimate Guide to Outdoor Dining Adventures http://t.co/b80ALbJ62h via @EaterNY	1401716842	473460870555516929	f	getstuffednow
RT @GovIslandFood: Come on over to @Gov_Island tomorrow for sunshine and great food. @SweetChiliNYC, @MayhemAndStout, @carlssteaks, @Getstu...	1401539927	472718833275650049	f	getstuffednow
This was the line for the last ferry off @Gov_Island yesterday! Come early 2day, we r slinging awesome kobe burgers! http://t.co/TXNni8IRN2	1401105843	470898153097416704	f	getstuffednow
RT @GovIslandFood: Almost 100 followers!! Our 100th follower(must be new)gets a free lunch from any one of our vendors at Gov. Island. Rede...	1401105728	470897670782210048	f	getstuffednow
@MobileMSummit looking forward to it!!!	1411765134	515606461377163264	f	kimchitruck
Excited 4 @daf14 this weekend. Heres a link to some of the highlights other than our delicious kimchi tacos http://t.co/cZbDxzpDSZ	1411753002	515555576454316032	f	kimchitruck
RT @TimeOutNewYork: The @DUMBOArtsFest begins this evening! Here's what not to miss: http://t.co/cbfaIAiyUi	1411752838	515554887850274817	f	kimchitruck
@superandomness @maldonsalt!	1411916771	516242472444657664	f	morristruck
One hour left and no line up! Try a mixer of kimchi tacos 3 for $7 or 4 for $9\n http://t.co/PM0MY2tp0m. @starrettlehigh #nyfoodtrucks	1411752626	515554000373293056	f	kimchitruck
@starrettlehigh new to our truck? Were here Fridays 11:30-2:30 check out our menu or come ask us a kimchi question http://t.co/H95dRSLJCp	1411745619	515524610226663424	f	kimchitruck
Open for lunch service! Come get yer kimchi on. Your gut will thank you for it. @starrettlehigh 11:30-2:30 today just outside the main doors	1411745558	515524353753378817	f	kimchitruck
Its finally Friday! @starrettlehigh well be  serving up lunch 11:30-2:30 today #nyfoodtrucks	1411743717	515516633675481088	f	kimchitruck
RT @BfloStreetMeat: To our NYC users!  We've added @KimchiTruck!  Find their location daily with the @BfloStreetMeat App! https://t.co/LFJF...	1411590751	514875046712860672	f	kimchitruck
@leeshufro every Wednesday we are on 55th street 1/2block west of 6th ave from 11:30-2:30. See you there I hope!	1411571606	514794744866942976	f	kimchitruck
Happy Wednesday #midtown! This is your beacon towards kimchi taco deliciousness! 11:30-2:30 today http://t.co/vI4LtBUv7H	1411562724	514757492212252672	f	kimchitruck
@dumbolot oops! Not today, dumbo :) see you next Tuesday 11:30-2:30 enjoy @sweetchilinyc and @carlssteaks	1411484383	514428904208359424	f	kimchitruck
@dumbolot @SweetChiliNYC @carlssteaks Sorry gang, we're actually off today. See ya next week!	1411482981	514423026084237313	f	kimchitruck
Sorry to the folks of #dumbo we wont be at the #dumbolot for lunch today. See you next week!	1411481744	514417839365976064	f	kimchitruck
RT @NYFoodJournal: Excellent seeing @KimchiTruck, @MexicoBlvd and @carlssteaks by @prospect_park at the food truck rally yesterday. Great #...	1411410853	514120499526660097	f	kimchitruck
RT @aaronc_smith: Mild addiction developing now that @KimchiTruck opened in our neighborhood.	1411408110	514108995221848064	f	kimchitruck
@snowday great day at #foodtruckrally loving those maple grilled cheese!	1411328326	513774353721606144	f	kimchitruck
RT @nycfoodtruck: . @Prospect_Park FOOD TRUCK RALLY! See you this Sunday, 9/21, from 11a-5pm! http://t.co/hHtBEmuzZn @MexicoBlvd @KimchiTru...	1411186140	513177985332293632	f	kimchitruck
@USWeeklyReporte well still always have #midtown Wednesdays :)	1411143300	512998300543631360	f	kimchitruck
RT @gaddylane: Gaddy Lane returns to Cortelyou Road this Sunday for Flatbush Frolic. Excited to serve our sandwiches... http://t.co/6RMHHGYlFx	1411142149	512993471146516480	f	kimchitruck
Check out our buds @SnowdayTruck on the @meredithvieira show. #DoGood #DoDelish	1411142090	512993225783906305	f	kimchitruck
Cran Almond Crispies today!! Pumpkin cake, Carrot cake!! Brownies &amp; Coookies galore!! hooray for treats!!!	1411746273	515527350583574529	f	thetreatstruck
!!! Fri, Sept 26th 12-3:30 45th st &amp; 6th ave, then 4:30-7pm  18th st &amp; 7th ave!!!	1411742409	515511147337101314	f	thetreatstruck
A change to our schedule! We're @ 45th &amp; 6th until 3:30 as planned, but won't be @ 18th &amp; 7th ave after. See you there next time!	1411582830	514841822842322944	f	thetreatstruck
!!! Wed,Sept 24th 12-3:30 45th st &amp; 6th ave, then 4:30+7pm 18th st &amp; 7th ave!!!	1411569063	514784079439749120	f	thetreatstruck
!!! Sun, Sept 21st @makerfaire #nyhallofscience 10am-6pm! So much to do and see and celebrate!! Come join in the fun!!!	1411304365	513673857010765824	f	thetreatstruck
We're in Zone 5 #makersfaire #nyhallofscience. Lots of treats! Iced coffee! Ronnybrook milk! We  love @makerfaire !!!	1411228595	513356054747705344	f	thetreatstruck
!!! Sat, Sept 20th 10am-7pm #makerfaire @makerfair NY #nyhallofscience Hooray!!!	1411221629	513326835464433665	f	thetreatstruck
!!! Fri, Sept 19th special event today! Back at our regular spots next week! This Sat &amp; Sun #makerfaire @makerfaire hooray!!!	1411139444	512982124971167744	f	thetreatstruck
!!! Thurs, Sept 18th 4-7pm Bway (86th &amp; 87th)!!!	1411069680	512689517082341376	f	thetreatstruck
We're headed to Broadway between 86th and 87th.  Opening at \n4 pm.   Hooray for treats!!!!!	1411067274	512679422738964480	f	thetreatstruck
4:30-7pm 18th st &amp; 7th ave!!!	1410985917	512338187721928704	f	thetreatstruck
!!! Wed,Sept 17th 12-3:30 45th st &amp; 6th ave, then 4:30-7pm 18th st &amp; 7th ave!!!	1410963373	512243633836544000	f	thetreatstruck
!!! Sun, Sept 14th no truck today!! Our shop open 8am-6pm w/food &amp; treats!!! 521 Court St #brooklyn #treats !!!	1410694421	511115564623089664	f	thetreatstruck
No truck this weekend! Our shop, The Treats Truck Stop is open Sat &amp; Sun 8am-6pm w/food &amp; treats!!! 521 Court St, Bklyn!!!	1410608952	510757081369296896	f	thetreatstruck
Closing early! So sorry! We have to bring treats to a very hungry group waiting for us in LIC!!! See you next week!!!	1410544599	510487166628421632	f	thetreatstruck
We have pumpkin cake today! And Oatmeal creamwiches!!	1410542871	510479917382135808	f	thetreatstruck
!!! Fri, Sept 12th opening at 12 on 45th st &amp; 6th ave! Not sure if we'll stay 'til 3:30 as usual, so we'll update asap!!!	1410536452	510452994178293760	f	thetreatstruck
3-7pm Bway (86th &amp; 87th)!!!	1410461000	510136528367271936	f	thetreatstruck
@foodtrucksin info@treatstruck.com	1410452587	510101238143537152	f	thetreatstruck
!!! Thurs, Sept 11th 12-2pm 45th &amp; 6th (short lunch today!), then 3ish-7pm UWS Bway (86th &amp; 87th)!!!	1410447758	510080983820148736	f	thetreatstruck
Today in Dumbo: hot/fresh Thai noodles. Come get some! jay&amp;water st. Till 3.	1411741646	515507945111842817	f	mamuthainoodle
@rspberryeggplnt our green curry has Chinese eggplant, bamboo, broccoli, and Thai basil if you'd like.	1411580451	514831844123353088	f	mamuthainoodle
@rspberryeggplnt there are no added veggies to drunken noodles. Please come back and we can make something else for you.	1411580392	514831596357419008	f	mamuthainoodle
@rspberryeggplnt we're sorry you're disappointed. Our drunken noodles are cooked in a blend of bell pepper, garlic,shallots,Thai basil&amp;onion	1411580265	514831062368010240	f	mamuthainoodle
Back on 17th&amp;5th today! Swing by! #turndownforwok	1411572517	514798566792261634	f	mamuthainoodle
17th&amp;5th! Happy Monday. Come by for noodles!	1411402017	514083438455193600	f	mamuthainoodle
RT @DUMBOFoodTrucks: We hear @mamuthainoodle @mausamnyc &amp; @KorillaBBQ are at the @dumbolot today. #TGIFTF (Thank God Its Food Truck Friday)	1411138247	512977106863939584	f	mamuthainoodle
This AM at the noodle factory: before the sun comes up, noodles are made. Then we cut them by hand. #fresh http://t.co/2pvKmzDObE	1411137857	512975469038534657	f	mamuthainoodle
Back on 17th&amp;5th today! Come by for your noodle fix! Till 3.	1410964676	512249094950354944	f	mamuthainoodle
RT @fuelgrannie: #astoria #lic #kaufmanartsdistrict: if you have not already, hie thee over to  @mamuthainoodle for some insanely delish (a...	1410897756	511968415347924992	f	mamuthainoodle
RT @JVB: Pad siew time from @mamuthainoodle. :)	1410886798	511922451513868288	f	mamuthainoodle
@KevinJWilk not enough people showed us love at that spot. Maybe now that summer is over it might be time to try again?	1410828261	511676930400460800	f	mamuthainoodle
DOH gave our restaurant A for cleanliness. A+ for food. We've come to takeover Astoria/LIC #turndownforwok #udontknow http://t.co/4yVsQL2ZJ1	1410820785	511645576291946497	f	mamuthainoodle
17th&amp;5th! Sorry, late tweet! It's a beautiful Monday!	1410797966	511549865634328577	f	mamuthainoodle
Strong Island! We are at Bar Beach today for Beach Feast 2014! Come by for great music &amp; food by the beach! It's beautiful out! Till 6pm	1410715751	511205029135790080	f	mamuthainoodle
RT @lrinefierd: @mamuthainoodle is the best after a hang out at the #paintthestreet event at at grove alley #brooklyn @DowntownBklyn http:/...	1410572452	510603991320133632	f	mamuthainoodle
@MooseXL sorry we missed you. Was at a private gathering today. Tomorrow we're in Brooklyn.	1410485490	510239245978456066	f	mamuthainoodle
Got plans tmrw night? Come check out @gowanusNITEmark paint night! We'll be hanging in an alley in Brooklyn. It could get wild.	1410483998	510232985443270657	f	mamuthainoodle
RT @Mrs_Xtina: @mamuthainoodle Good! I was having withdrawals! Missed you guys! #bestwokinNY	1410373443	509769285515087872	f	mamuthainoodle
Hello 17th&amp;5th! We're back to serve you hot/fresh Thai noodles! Come say hi! #turndownforwok	1410359552	509711022543089664	f	mamuthainoodle
Officially sold out of ice cream! Thank you everyone for a great season!! #closed	1382307419	392051847542079488	f	itizyicecream
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
Back in LIC with the truck so everyone that have been asking for our pints, today is your day! 47th rd &amp; Center Blvd	1380998048	386559950740533248	f	itizyicecream
@Marilyn_He glad you asked!  It's a long and raging debate for many of our customers :-) Its "i" as in Italy, followed by "tizzy".	1380912785	386202328845803520	f	itizyicecream
New flavor!  Mango ice cream... Stop by our truck at 115th and broadway til 6:30 pm today.	1380903796	386164626511380480	f	itizyicecream
Broke down on BQE  waiting fo Help  What a way to make a Living !!!!!!! http://t.co/5uiMHrJ81X	1411794290	515728750252949504	f	valduccis
RT @Foodtruckgirl7: Spotted @theseaport @LaBellaTorte @Valduccis @ToumNYC @mooshugrill #foodtruckfriday #nyfood #foodtrucks #foodtrucklove ...	1411763893	515601257365790720	f	valduccis
Partyyy !!! http://t.co/z6biEYfh7O	1411756765	515571360836235264	f	valduccis
Catering catering vegetable Stromboli @rocketfuel @gofooda http://t.co/PsbjHNJCXM	1411680202	515250228807884800	f	valduccis
Let us do your cocktail hour! http://t.co/uZizSwbKpi	1411663603	515180611175477248	f	valduccis
Catering Babyyyyy !!!! http://t.co/Adgp7uTp8u	1411662278	515175051562594304	f	valduccis
RT @SliceOutHunger: Delighted to add @boloneyshoboken @RazzaNJ @ViaTribunali_NY @Valduccis  @PizzaMoto to this year's lineup! #pizza4good #...	1411658822	515160557201391617	f	valduccis
I am not !!! http://t.co/E74LkskdYE	1411619581	514995968488771584	f	valduccis
Happy Holidays !!!	1411600716	514916842478268416	f	valduccis
Follow us on Instagram http://t.co/EG77gSyWY7	1411600594	514916329087041536	f	valduccis
Caters Afterpartys #bestcaters #catering http://t.co/EuBFdyk3FP	1411588092	514863893546799104	f	valduccis
Crazy Catering  Panko crusted  Riceballs. #bestcatering #caters http://t.co/pDQPXNtsK8	1411587989	514863461810319360	f	valduccis
Sorry guys we had a breakdown See you tommorow. happy holiday  !!!	1411569041	514783986191966210	f	valduccis
Fall salads are Delicious ! http://t.co/fxIWxrKkgB	1411523801	514594236013240320	f	valduccis
RT @greenboxny: Happy #autumn from #greenbox! @Valduccis: Light Fall salads.  #BestCatering @greenboxny @FoodNetwork http://t.co/6kCBx8bgl...	1411497937	514485756975652864	f	valduccis
Let us cater Your Afterparty !!! http://t.co/6swElQp1kn	1411497364	514483353060655104	f	valduccis
Times Square !!! http://t.co/RaAMcyVPdI	1411497285	514483023061196800	f	valduccis
#caters need Lemons @greenboxny @FoodtoEat @FoodChannel http://t.co/kMCLEuvJ05	1411488867	514447712599941120	f	valduccis
Light Fall salads.  #BestCatering @greenboxny @FoodNetwork http://t.co/FzVbUtVTsO	1411488578	514446501507252224	f	valduccis
Slice Out For Hunger @scottspizzatour @greenboxny @valduccis http://t.co/UEh3TC7z9Q	1411480337	514411935761457152	f	valduccis
IT'S HERE!   CUSTOMER APPRECIATION DAY . ONE YEAR SERVING ALL OF YOU. THANK YOU! \nRemember to bring your coupon... http://t.co/4iIMfD3bc9	1411739198	515497679116574720	f	mtblls
Rain Rain Go Away Little Jeter Wants To Play . Ok so it's a rainy Thursday  we can do this. The Mtbll  is... http://t.co/p9pt6aSrW3	1411657846	515156460553392128	f	mtblls
It's  Day! We can do this. The Mtbll  is stopped on 50th bet 6&amp;7 swing on by for your favorite ball and if you... http://t.co/PbNNfjnwDV	1411568501	514781723431694336	f	mtblls
Happy Tuesday Mtbll lovers! The Mtbll  is at it's usual stop. On the menu today beef, chicken and for limited... http://t.co/cIYSNphq4l	1411483224	514424044171849728	f	mtblls
Happy Monday all . The Mtbll  has stopped at 50th bet 6&amp;7 come on by for your favorite ball. Today we have... http://t.co/TuCY31nSKC	1411396302	514059467655098368	f	mtblls
Hey guys just want to let you know we are out today on 38 th st and 11 th ave  participating in the People's... http://t.co/yaj139B2Bt	1411320900	513743207222738944	f	mtblls
TGIF !! Just loving this weather  Aren't you? Come on by the Mtbll  50th bet 6&amp;7 to get your weekend fix. A... http://t.co/fowJXp8PH9	1411138861	512979683768406016	f	mtblls
Happy Thursday Mtbll lovers. Nice day to take a stroll to 50th bet 6&amp;7 aves. The Mtbll  is waiting 	1411056317	512633465141882882	f	mtblls
Good Thursday to all!  The sun is shining a sign to take a stroll to 50th bet 6&amp;7 the Mtbll is waiting . Ask about our New Chipotle sauce.	1410966504	512256763333476353	f	mtblls
Makes sense though doesn't it?  Good day all. Unpleasant as it looks it too will pass. Grab an umbrella and come... http://t.co/tT5RNOl3ZP	1410879281	511890922489921536	f	mtblls
Good Morning. We are so excited to start handing out some cards to our loyal customers this week and next for... http://t.co/s2Lvuyy8jz	1410792955	511528847091572736	f	mtblls
Good afternoon Mtbll lovers! Hope everyone's having a blessed Sunday.  The Mtbll  would like to announce a... http://t.co/SMcvYwJVYW	1410720755	511226019165257728	f	mtblls
TGIF!  The Mtbll  is waiting at 50th bet 6&amp;7 aves to help you get your weekend fix . So come on by!	1410532336	510435730959527936	f	mtblls
The Mtbll  will be a it's usual stop On this somber day of remembrance. 	1410450607	510092933677481985	f	mtblls
God Bless us all. http://t.co/RzJ3gRRPeu	1410444441	510067071657312257	f	mtblls
That being said why not take a stroll to 50th bet 6&amp;7 for your favorite ball!  The  is waiting http://t.co/uCAqB8ouK1	1410358399	509706187441324033	f	mtblls
Good Tuesday Mtbll lovers!  The  is stopped at 50th bet 6&amp;7 aves come by for your favorite ball it's been a few days .	1410272749	509346943382720513	f	mtblls
Happy Monday the Mtbll  will be taking a day off to regroup from a buddy weekend. Have a great day 	1410189205	508996535984459776	f	mtblls
RT @kisha_may: The buffalo chicken meatballs!!?!  @mtblls ridiculously good @essenceMag #essencestyle festival #NYC http://t.co/LPaCy3y...	1410180330	508959313021657089	f	mtblls
@kisha_may @essencemag great! glad ya liked them We had an\n awesome time Keep up with the posts for our location if your around come visit!	1410178701	508952480252973056	f	mtblls
53rd &amp; Park #TGIF!	1411742047	515509627308769280	f	biandangnyc
Have you ever stood in a #typhoon in Taiwan? Full experience today on 53rd &amp; Park:)	1411649932	515123270052757504	f	biandangnyc
Swimming in #mincedporksauce on 53rd &amp; Park!	1411567843	514778963529703425	f	biandangnyc
What are the odds we'll catch some #UNsummit leaders at the truck on 53rd &amp; Park today? Come through and find out!	1411482466	514420865258504192	f	biandangnyc
53rd and park! Let's go!	1411399671	514073597649113088	f	biandangnyc
53rd &amp; park today!	1411394990	514053965676556289	f	biandangnyc
Let us warm you up on these chilly days. Visit us on 53rd st and Park ave	1411134872	512962948932075520	f	biandangnyc
#beepbeep Bian dang rolling thru 53rd street and park avenue with some #taiwanese yummies!	1411049255	512603846850674689	f	biandangnyc
It's a porky kinda day...pork chops, pork dumplings and #mincedporksauce on 53rd and park.	1410962653	512240612360601600	f	biandangnyc
53rd and Park in this swimming weather.	1410876264	511878268824584192	f	biandangnyc
Things are getting saucy on 53rd &amp; Park! #mincedporksauce	1410789116	511512746182332416	f	biandangnyc
53rd and park #tgif!!!	1410539882	510467379672125441	f	biandangnyc
Truckin along on 53rd &amp; Park!	1410529157	510422397926002688	f	biandangnyc
53rd &amp; park today!	1410441923	510056513189470208	f	biandangnyc
It's a #zhongzi sort of Wednesday, pork belly and other goodies wrapped &amp; steamed with rice in bamboo leaves, check it out on 53rd &amp; Park!	1410357080	509700653749653506	f	biandangnyc
53rd and park for lunch today.. and EVERYDAY:D	1410269955	509335224636178432	f	biandangnyc
Today is a sad day. Our Joanna, is moving on to greener pastures--finishing her grad studies and looking for... http://t.co/6WzNC921gi	1410221202	509130739783585793	f	biandangnyc
53rd &amp; park ave for lunch today!	1410184163	508975389696618496	f	biandangnyc
NYC Food Truck Lunch: Assorted Bao From Fun Buns NYC - CBS New York http://t.co/1yZP3XkTKf	1410026386	508313621731213315	f	biandangnyc
#TGIF #thankgoditsfiftythirdandpark today! 53rd &amp; Park ave to scoop up your weekend #teaeggs!	1409925024	507888480060719104	f	biandangnyc
RT @TheNYRA: What are you eating at #Belmont tomorrow? @mactruckny, @MrNiceGuyTruck, @gcnyc1, @PapayaKingTruck, @TheCrepesTruck, @AndysItal...	1411760807	515588312686673920	f	papayakingtruck
Snag a 20% coupon in Washington Square Park today in support of the #ActionSummit by @GlblCtzn and @CliveDavisInst @WSPBlog #NYU...	1411744245	515518845516521472	f	papayakingtruck
Join us at the @GlblCtzn The #ActionSummit outside @NYUSkirball today! LaGuardia Pl &amp; W. 4th St. http://t.co/ma7hHJjaVH	1411741850	515508802213642240	f	papayakingtruck
We are parked on LaGuardia Pl &amp; W. 4th St. today from 11am - 4pm #GreenwichVillage #NYU	1411741780	515508508020977664	f	papayakingtruck
#FarewellCaptain http://t.co/As4mkVlI5j	1411686501	515276652285558784	f	papayakingtruck
Back in midtown for lunch today, Broadway btwn 57th St and 58th St see you at 11AM	1411656317	515150048955760640	f	papayakingtruck
No dinner service tonight, see you tomorrow in Midtown Manhattan	1411593662	514887256478605312	f	papayakingtruck
Truck is off the road today for a private event at @BWDGroupLLC see you tonight at 65th and Broadway! http://t.co/RfIct46SRr	1411569165	514784506872885248	f	papayakingtruck
After the @YoungNYParty at @MarqueeNY stop by the truck for a snack. \n% of sales will be donated to @DonorsChoose #YNYP14 @caafoundation	1411515050	514557531214323712	f	papayakingtruck
Midtownnnn, after 3 days, we're back!!!!!! Broadway between 57th St. and 58th St. See you at 11AM http://t.co/b2mIgufaWC	1411480172	514411242480742400	f	papayakingtruck
Come See us at Kaufman Astoria Studio for New York on Location from 11a-5p today! http://t.co/6enRswX0Mc #Astoria #Film @KaufmanAstoria	1411310716	513700492304994304	f	papayakingtruck
At the @SOURCE360 Block Party all day today in #AlbeeSquarePlaza (Corner of Fulton and Bond St) #SOURCE360 http://t.co/9xtgF5FV0p	1411224315	513338100190547970	f	papayakingtruck
@SmoothJazzSam glad you stopped by and hope you enjoyed your mea!	1411140758	512987638086008832	f	papayakingtruck
Beat this fall weather with our grilled franks and tropical drinks at 58th St. and Broadway, the tropical oasis in the concrete jungle	1411140721	512987484893216768	f	papayakingtruck
Tonight #JazzAcrossTheAmericas Opening Night Party at the Lincoln Center &amp; we are across the Street at 65th St and Broadway @jazzdotorg	1411076181	512716782079975424	f	papayakingtruck
Hey Midtown, come get the best grilled franks and tropical drinks - Broadway btwn 57th St and 58th St. http://t.co/W5JWogGh6Z #HotDog	1411052418	512617112373051394	f	papayakingtruck
Launching our new menu, whats your favorite? http://t.co/tgXVPIF56w	1410974182	512288966067122176	f	papayakingtruck
Broadway between 57th and 58th St is where lunch is at today.	1410967498	512260933813813248	f	papayakingtruck
Serving Now at Midtown - Columbus Circle - 3 Columbus Cir New York From 11:00AM Until 4:00PM EDT http://t.co/DenCwhBybS	1410966315	512255972501250049	f	papayakingtruck
Fresh grilled hot dogs on Broadway and 58th Street!	1410883068	511906807812734976	f	papayakingtruck
RT @EmpireStateBldg: From one NYC icon to another, we wish #DerekJeter the best in his last @Yankees game. Thx for the memories. Visit us s...	1411692299	515300967844442112	f	usafoodtruck
RT @ReviewGunty: .@USAFoodTruck, thanks for joining us for @mattmahermusic #22550concert http://t.co/Y6ylaX6Hws	1411330333	513782775145848832	f	usafoodtruck
@Ferrendez hey Tony of course I do!  We'll be back eventually.  Just gotta roll with the punches temporarily.	1411055830	512631425666121728	f	usafoodtruck
@bmitchelf HELL NO.  And it ain't over now.\nAnd when the going gets tough....the tough get going.  Who's with me!?!?!  Let's go.	1411050821	512610413499150336	f	usafoodtruck
@bmitchelf like Douglas MacArthur said after getting pushed off the Philippines by the Japanese in 1942: "I shall return."	1411050677	512609810786058240	f	usafoodtruck
NYC---it has been the realest.  I've had the opportunity to pursue a dream here, but it seems that due to permit issues, we'll be relocating	1411050383	512608577065058304	f	usafoodtruck
RT @mlewis6732: @USAFoodTruck .. Ok ~ good luck w that.  See u guys soon. A lot of ppl missing u guys.	1410978410	512306703040516097	f	usafoodtruck
@mlewis6732 running into some issues with permits in NYC, so we're working out everything as soon as possible.  #nycbureaucracy #homesick	1410973267	512285130615160832	f	usafoodtruck
@StarSpangled200 we're heading your way from NYC.  Bringing the best chicken tenders and all-American food.	1410441483	510054664650629120	f	usafoodtruck
Much love #nyc we're heading down to Baltimore reppin' NYC's most Patriotic food truck on this day for our city.  #NeverForget #nycstrong 	1410433104	510019523840573440	f	usafoodtruck
RT @GeoWashington: #OTD in 1776: GW asks for volunteers to spy behind enemy lines before coming Battle of Harlem Heights (cc: @MorristownNP...	1410404329	509898831757328384	f	usafoodtruck
@Noahnyc444 through the weekend We're off the streets.  we're Baltimore bound reppin' NYC for the 200th anniversary of our nat'l anthem. 	1410404110	509897911183114240	f	usafoodtruck
Good morning nyc.  We're back on the streets for you.  Come and get that good ish at 47th and Park.\n We'll be tender slinging from 11-3.	1410361826	509720560608477185	f	usafoodtruck
Were posted up at front and john st today and we'll be here until 7 with the best chicken tenders in NYC.	1410279704	509376117724434432	f	usafoodtruck
Hey there nyc. The truck is out at the south street seaport getting ya the best chicken tenders in the universe.  Front and John St. #nom	1410189887	508999397993357313	f	usafoodtruck
@USC_Athletics yeah you won on a BS CHOP BLOCK	1410043803	508386676583186433	f	usafoodtruck
@USC_Athletics y'all won on a bullshit chop block call.  Congrats.	1410043780	508386579996758017	f	usafoodtruck
@809Mama thank you so much!  Glad you enjoyed them.  Hope to see you soon.	1410015537	508268120243703809	f	usafoodtruck
RT @809Mama: @USAFoodTruck tried your food yesterday! #fabulousfries Mmm Mmm good!  Please come again to #dumbo	1410015513	508268019433623552	f	usafoodtruck
What up in Brooklyn?!  We're at DUMBO lot at Jay and Water St.  We'll be here till 3.  Best chicken tenders in the city.	1409758767	507191147547348992	f	usafoodtruck
@taipanexpress is parked on 47st btw Lex &amp; Park ave 11am to 3pm.Indian Thai fusion twist.Grand opening 50% off menu prices #fusionmadness	1395241942	446303168746782721	f	freshandhearty
We have sad news today that Fresh&amp;Hearty is no longer in business. Please follow our new truck @taipanexpress Food is amazing! 50% off menu	1395241599	446301731807563776	f	freshandhearty
@gcnyc1 best grilled cheese in town...	1393432849	438715283231211520	f	freshandhearty
Get your Soup &amp; Panini on with Fresh and Hearty! We parked on 46st btw 5th &amp; 6th ave from 11am to 3pm. Call now 4 free delivery! @3474402467	1390493878	426388347435491329	f	freshandhearty
Snow Snow go away come back another day cuz Fresh and Hearty have specials today! We parked on Park ave btw 32st &amp; 33st. #comegetsome	1390320902	425662831162568704	f	freshandhearty
Good Morning nYc! We are serving lunch on 46st btw 5th ave &amp; 6th ave.Free Delivery 4 everyone!Order now 3474402467 or http://t.co/yJtXVzeOH7	1389800694	423480921153486848	f	freshandhearty
@bxlea today we are on 46 st between 5 and 6 ave	1389795912	423460864881352704	f	freshandhearty
We serving lunch on Park ave btw 33st &amp;32st. Free delivery!Call 3474402467 for free delivery or visit http://t.co/yJtXVzeOH7 to order online	1389718699	423137012032348161	f	freshandhearty
Good Morning nYc! We are parked on 47st btw Park ave &amp; Lexington ave.Free delivery! Place ur order http://t.co/ZQROfAbNSb or call 3474403467	1389624493	422741881672724480	f	freshandhearty
RT @randomfoodtruck: Snow shmow. The temp is in double digits and it's Friday, so let's celebrate. @Chefsamirtruck @FreshandHearty @carlsst...	1389371813	421682066108211200	f	freshandhearty
SnowY DaY! No need for you to get out cuz we are doing deliveries now! Call us now 3474402467 &amp; get free soda with your order #Bdwy55&amp;56st	1389368713	421669062444613633	f	freshandhearty
Order now via http://t.co/8tYW0vuYUt and recieve free soda with your order. We doing deliveries now so take advantage! #ordernow #freesoda	1389285255	421319014057394176	f	freshandhearty
We are serving lunch on #HanoverSquare btw Pearl &amp; Water st. We doing deliveries now! Call 3474402467 to place ur order 4 pickup or delivery	1389283993	421313721747533824	f	freshandhearty
Today we are serving lunch on 46st btw 5th &amp; 6th ave. We know its cold so you can order via online, email or phone at http://t.co/ZQROfAbNSb	1389197320	420950188724088832	f	freshandhearty
Good morning nYc! We are closed today due to this severe cold weather.We will be back tomorrow so keep #hungrymyfriends #goodfood #staywarm	1389106294	420568397903331328	f	freshandhearty
#2014 It's all about #goodfood &amp; #flavors. We serving lunch today on Broadway &amp; 55st.Order now for pickup at http://t.co/ZQROfAbNSb #noline	1389024609	420225786000711680	f	freshandhearty
RT @tacobite: @UndrcvrMother thank u, u too.	1388892460	419671512661377024	f	freshandhearty
#HappyNewYear2014 to everyone! We are back with a boom of different flavors for you! Come out and try out our new menu. #FreshandHearty	1388677888	418771533297758208	f	freshandhearty
Back on the road. we are serving lunch on old slip between water st and front street from 11:30 to 2:30 #Preorder before 12pm at 3474402467	1388676035	418763761240268800	f	freshandhearty
GOOD morning Monday... We are park on Broadway between 55 st and 56 st. Preorder before 12pm at 3474402467.	1388416224	417674033657020416	f	freshandhearty
RT @TheNYRA: @AndysItalianIce See you Saturday at #Belmont for #SuperSat!	1411762993	515597481842053120	f	andysitalianice
RT @TheNYRA: What are you eating at #Belmont tomorrow? @mactruckny, @MrNiceGuyTruck, @gcnyc1, @PapayaKingTruck, @TheCrepesTruck, @AndysItal...	1411762987	515597453731844096	f	andysitalianice
Morning NYC - come find us today on 32nd and Park Ave from 11am- 5pm or down in #UnionSquare afterwards until 8pm!	1411741686	515508112468742145	f	andysitalianice
Ice Lovers - Well be OFF THE ROAD today due to rain. Stay tuned for updates on where well be throughout the rest of the week/weekend!	1411657878	515156595307986945	f	andysitalianice
We'll be @ 40th &amp; 6th Ave until 5p today, stop by for your favorite Andys Ice or Espresso Beverage. Then #UnionSquare til 8!	1411570365	514789538892640256	f	andysitalianice
NYC - Find us on 47th &amp; Park today from 11a-3p or in #UnionSquare from 4p-8p!	1411480568	514412904800870400	f	andysitalianice
Morning Ice Lovers - Find us on 55th and Broadway today until 4p, then over in #UnionSquare for the evening!	1411398536	514068839609667584	f	andysitalianice
Movie buffs, heres your backstage pass into Hollywood. Join us at Kaufman Astoria Studios for a FREE street fair http://t.co/sHvzH1qDct	1411306726	513683758734901248	f	andysitalianice
Ice Lovers! Join us today at the @DowntownHDSID. We'll be there until 6pm, details here: http://t.co/b0YgSB7EOu	1411226763	513348368471711744	f	andysitalianice
RT @DowntownHDSID: All About Downtown Street Fair returns to Jersey City for 4th year http://t.co/55qxiqm1iI	1411226679	513348016280182784	f	andysitalianice
@Ingenieux sorry buddy, we have a really busy weekend and the guys are getting a little burnt out.	1411139362	512981781847760896	f	andysitalianice
Sorry ice lovers, well be OFF THE ROAD today! Find us tomorrow at the Downtown Jersey City Street Fair! http://t.co/V6TKoLchs5	1411139072	512980567777103872	f	andysitalianice
Too cool for your favorite ice? Dont worry, we also proudly serve Demarco Coffee. Try a latte, cappuccino, or even some hot chocolate!	1411054031	512623878670393344	f	andysitalianice
NYC - Come down to Water &amp; Broad Street today from 11a-5p. Or head over to Union Square from 6p-8p!	1411048728	512601638578565121	f	andysitalianice
NYC-Find us around Bryant Park today (40th &amp; 6th Ave) until 4:45p! Then well be closing up the night in Union Square http://t.co/DA4r4HL9lX	1410965082	512250798961856512	f	andysitalianice
Sorry ice lovers, we will be OFF THE ROAD today due to weather. Check back for updates on where we'll be throughout the rest of the week!	1410878087	511885914285813760	f	andysitalianice
UPDATE - We've relocated to 32nd and Park Ave for the afternoon!	1410797357	511547312246886401	f	andysitalianice
NYC - Find us on 55th &amp; Broadway today from 11a - 4p then over in #UnionSquare until 8p!	1410788951	511512053795020800	f	andysitalianice
Long Island! Today, find us at BeachFeast at Bar Beach. We'll be serving ices from 12p-5p, hope to see you there. http://t.co/ljpxPJIWlV	1410705847	511163491030675456	f	andysitalianice
LONG ISLAND- Join us for day 2 of the New York Tattoo Show at the Cradle of Aviation Museum in Garden City http://t.co/OUzXKErEZF	1410620789	510806732038500352	f	andysitalianice
RT @FoodtoEat: Eggs for days, start #breakfast right so that lunch can be good too, get @ETRAVAGANZA. Preorder online for pickup: http://t....	1411136091	512968063617339392	f	etravaganza
The grill is sizzling.ready to prepare your favorite meals.join us at  corner of 52nd and park.	1410965456	512252366901764096	f	etravaganza
RT @vendyawards: @VeganLunchTruck wins the Vendy Cup! #VendyAwards #vendys	1410654358	510947530000310273	f	etravaganza
Good Morning..!!All Engines@ Full Speed!! Happy Friday..!!! http://t.co/4uMmdqKk1H	1410532831	510437806691586048	f	etravaganza
G.morning:Our California Egg wrap; grilled onions &amp; mushrooms tomatoes,Avocado, mozzarella &amp; More Join us,\nThe truck it's on 52 &amp;Park.	1410351430	509676955466465280	f	etravaganza
RT @FoodtoEat: There's never enough eggs in a day, grab @ETRAVAGANZA to fulfill your crave. Preorder online for quick pick up: http://t.co/...	1409839845	507531213561925632	f	etravaganza
Three amigos wrap and Mexican grilled cheese, delicious chopped salad, Tasty tacos all on demand. 52nd and Park is the place.	1409757481	507185752682532865	f	etravaganza
RT @danielapr13: The best #foodtrucks on #ParkAve! http://t.co/ts2I2cTKbF @therealrafiqis @UncleGussys @Chefsamirtruck @ETRAVAGANZA @NautiM...	1409753114	507167436689649665	f	etravaganza
RT @TheBrunchBoys: Stopped by @etravaganza food truck today! Got the Mexican Wrap with Eggs, grilled onion, pepper,... http://t.co/hls6dIMQVo	1409674716	506838614240919552	f	etravaganza
Happy Labor Day!!	1409576166	506425265556586496	f	etravaganza
Just prepared myself a BLT on a multigrain and it's  surprisingly delicious!!..hey! I'll post it on today's menu.	1409064056	504277320509972481	f	etravaganza
Happy Friday!! Wow...!! How fast time goes by! Anyway.. Breakfast Ready.	1408696535	502735826007367680	f	etravaganza
@feistyfoodie Hi. We use "Land O Lakes"American Cheese.	1408568733	502199782593806336	f	etravaganza
@jonemmet	1408566155	502188972089806849	f	etravaganza
Back to our usual location. 52&amp; park, ready for lunch,  Join us.	1408549612	502119583885844480	f	etravaganza
Howdy folks!...this upcoming Wednesday We'll be catering at the plaza hotel for  breakfast, So.we'll see you at lunch :)	1408490041	501869725421670400	f	etravaganza
IT'S F.R.I.D.A.Y...!!!	1408116232	500301857865367552	f	etravaganza
It's beautify outside! Join us for a delicious warm food! :)	1408032278	499949726939488256	f	etravaganza
RT @jonemmet: Chorizo, bacon grilled cheese for breakfast!!! Thanks @ETRAVAGANZA http://t.co/MULGLlM0Nh	1408027381	499929188204552194	f	etravaganza
Good morning we are serving lunch at 46 st between 5&amp;6ave from 11:30 to 3pm @FoodtoEat @midtownlunch @nystfood	1408622100	502423619595956225	f	taipanexpress
Good morning happy hump day today we are serving lunch at 47 st park and Lexington from 11:30 to 3pm @FoodtoEat @nystfood @midtownlunch	1408540096	502079673384566784	f	taipanexpress
Good morning Tuesday today we are at south street seaport all day from 11:30 to 8pm @midtownlunch @nystfood @truckfoodnyc	1408454987	501722698494775298	f	taipanexpress
Good morning today we are serving lunch at 47 street between park and lex ave from 11:30 to 3pm @FoodtoEat @midtownlunch @nystfood	1408099122	500230093730742272	f	taipanexpress
@mad__bull sign up for weekly email truck update http://t.co/Yfbdb0bWrr	1411918941	516251575170646016	f	dubpies
Good morning midtown we are serving lunch at 46 st between 5 &amp; 6 ave from 11:39 to 3pm @nystfood @FoodtoEat @midtownlunch	1408009351	499853563603222528	f	taipanexpress
Good morning rain rain go away come back another day.. We are out on street for lunch at 47 st park and lex From 11:30 to 3pm @midtownlunch	1407935872	499545370217971712	f	taipanexpress
Good morning we are park at south street seaport all day from 11:30 to 8pm @FoodtoEat @nystfood	1407852260	499194678353616896	f	taipanexpress
Good morning midtown we are serving lunch at 46 st between park and lex ave from 11:39 to 3pm @midtownlunch @FoodtoEat @truckfoodnyc	1407760063	498807974203518976	f	taipanexpress
Happy Friday today we are back on 47 st between park &amp; lex ave from 12:30 to 3pm for pre-order before 12 call 3474402467 @midtownlunch	1407497133	497705166796509184	f	taipanexpress
!!Good morning!! Today we are serving lunch at 421 E. 26th st tge corner of 1 ave Fromm 11am to 3pm @FoodtoEat @midtownlunch	1407409447	497337385454403585	f	taipanexpress
Good morning today we are serving lunch at 47 st between park and Lex ave from 11:30 to 3pm pre-order before 12pm at 3474502467 @FoodtoEat	1407325282	496984373657608192	f	taipanexpress
Good morning we are here at south st seaport from 11:30 to 8pm @FoodtoEat @nystfood @foodtrucksin	1407244710	496646428811624448	f	taipanexpress
Sorry guys we are not out today but we will be at seaport tomorrow from 11:30 to 8pm	1407168941	496328628381446147	f	taipanexpress
@LaBellaTorte one of my favorite food every sweet for the truck are delicious http://t.co/DFK9hhv4Mm	1407168834	496328179930644480	f	taipanexpress
Happy Sunday we are at south st  seaport all day....	1407077708	495945970233126912	f	taipanexpress
Happy Friday we are serving lunch at 47 st between park and Lexington ave from 11:30 to 3 pm @FoodtoEat @midtownlunch @nystfood	1406894966	495179497973764097	f	taipanexpress
Good morning we are serving lunch at 46 st between 5 &amp; 6 ave from 11:30 to 3pm @midtownlunch @FoodtoEat @nystfood	1406808531	494816960618958848	f	taipanexpress
Good morning midtown we are serving lunch at 47 st between park and Lexington from 11:30 pm to 3pm @midtownlunch @FoodtoEat @nystfood	1406721037	494449984172228608	f	taipanexpress
@_ScottRubin Hi, We are serving lunch today on South Seaport @TheSeaport from 11am to 8pm today. Thank you for contacting us! #TaipanFusion	1406641367	494115826296193024	f	taipanexpress
Good morning we are serving lunch and Dinner at south street seaport all day	1406632524	494078733230563328	f	taipanexpress
Friday means Dumbo! Front &amp; Jay through lunch with sandwiches, grits, and Creamy Corn Chowder. @DUMBOFoodTrucks @DUMBOArtsFest #Dumbo	1411744350	515519284697911296	f	thesteelcart
Mocking the rain on 56th &amp; Broadway. Soups are Creamy Corn Chowder &amp; Organic Lentil.	1411653396	515137796697497601	f	thesteelcart
@AnthonyDiMare Nice! Thanks for giving us a try.	1411577545	514819654603538432	f	thesteelcart
Back at it on Front &amp; Jay with Organic Lentil soup on board. @DUMBOFoodTrucks #DUMBO	1411567565	514777796183609344	f	thesteelcart
Closed today and tomorrow for private events. See you soon!	1411394469	514051777793368065	f	thesteelcart
Gearing up for a souper weekend! Front &amp; Jay through lunch with Organic Lentil (vegan) + Spicy Black Bean soup. @DUMBOFoodTrucks #DUMBO	1411135576	512965903848574976	f	thesteelcart
RT @Orangemoonwerks: En route to my favorite #Dumbo food truck @TheSteelCart, Broadway + 56th | #NYC @DUMBOFoodTrucks http://t.co/RmkOM1j0Lh	1411075564	512714195578540032	f	thesteelcart
@Orangemoonwerks Great to see you! Have a nice weekend!	1411075549	512714130591973377	f	thesteelcart
Broadway &amp; 56th with Sandwiches, Grits, Spicy Black Bean Soup and smiles!	1411053741	512622663022694402	f	thesteelcart
@vllg @DUMBOFoodTrucks We've always been spoon-folk at heart.	1410967432	512260656247345152	f	thesteelcart
Front &amp; Jay this fine Wednesday. Spicy Black Bean &amp; Split Pea be the soups. @DUMBOFoodTrucks	1410966081	512254988186566656	f	thesteelcart
56th &amp; Broadway is the way.	1410879272	511890886306054144	f	thesteelcart
Soups are back! Swing by Front &amp; Jay for some Split Pea action. @DUMBOFoodTrucks	1410786092	511500062607024129	f	thesteelcart
@Lkkchung Sweet!	1410534608	510445260854792193	f	thesteelcart
Loving the Fall on Front &amp; Jay, and you know what that means. Stay tuned for exciting new soups! @DUMBOFoodTrucks	1410534585	510445166390702080	f	thesteelcart
RT @gideonemery: Thank you @TheSteelCart for the deliciousness that is The Brown Cow. Hit the spot! http://t.co/pqdbFsqDCh	1410457637	510122421853372416	f	thesteelcart
Lunch is ready! - 56th &amp; Broadway.	1410447856	510081396908773377	f	thesteelcart
More Dumbo Please! Front &amp; Jay till 2:30 with sandwiches, grits, and salad. @DUMBOFoodTrucks	1410361748	509720233494732801	f	thesteelcart
It's yours truly, 56th &amp; Broadway through lunch.	1410275093	509356776777863169	f	thesteelcart
These Mondays just keep coming!Front &amp; Jay in #DUMBO with Sandwiches, Grits, and Blueberry Peach Salad. @DUMBOFoodTrucks	1410187107	508987736855150593	f	thesteelcart
#NotInMyName	1411655375	515146097262858240	f	chefsamirtruck
We are on 52st and park av!	1411572307	514797687733235712	f	chefsamirtruck
We are on 36st and Broadway!	1411488090	514444453466341378	f	chefsamirtruck
We are on 47st between park av and Lexington av!	1411055400	512629621809217536	f	chefsamirtruck
We are on 52st and park av!	1410968603	512265569387962371	f	chefsamirtruck
We are on 36st and Broadway	1410882125	511902854559596545	f	chefsamirtruck
We are on old slip and water st!	1410794789	511536540796059648	f	chefsamirtruck
We are on 47st between park av and Lexington av!	1410449608	510088745685876738	f	chefsamirtruck
We are on 52st and park av!	1410363238	509726483934642176	f	chefsamirtruck
We are on 36st and Broadway!	1410276833	509364073059082240	f	chefsamirtruck
We are on 52st and park av!	1409758663	507190711373275136	f	chefsamirtruck
We are on 36st and Broadway!	1409672822	506830669688078336	f	chefsamirtruck
We are on 47st between park av and Lexington av! !	1409240815	505018701796896768	f	chefsamirtruck
We are close today, for health department inspection	1409156241	504663971346276353	f	chefsamirtruck
@jenniferiino @emyxter sounds good! !	1408720280	502835418782777344	f	chefsamirtruck
@jenniferiino @emyxter good morning	1408719624	502832668003016704	f	chefsamirtruck
We are on 47st between park av and Lexington av!	1408635562	502480083240894465	f	chefsamirtruck
We are on 52st and park av!	1408549553	502119338930094081	f	chefsamirtruck
We are on 36st and Broadway!	1408463180	501757063773814784	f	chefsamirtruck
We are on 47st between park av and Lexington av!	1408031509	499946504266973185	f	chefsamirtruck
Back on the street for 10 minutes and i already got a ticket #iny 	1410522782	510395659233804288	f	mactruckny
@St0nerChicks today 	1410521828	510391656487862272	f	mactruckny
Guess who's back? Good morning 47st!!!! Between park and lex for lunch today... Closer to lex.	1410521767	510391401168003072	f	mactruckny
In Saratoga until after labor day. 	1407271860	496760305796775937	f	mactruckny
RT @mcozine: Enjoying my beloved @mactruckny at @saratogatrack. How to get through the rest of summer in NYC without it?! http://t.co/drMwb...	1406155111	492076318951870464	f	mactruckny
Last chance till september NYC!!! At the south st seaport, front st. And john st. Till i sell out.	1405267201	488352153841315841	f	mactruckny
RT @LincolnNYC_65th: http://t.co/yW106Jk868 The best way to taste the most delicious Italian pasta in New York is at Lincoln Ristorante.	1405089745	487607851410411522	f	mactruckny
@gmonster711 47st between Park and lex Birthday girl 	1405078248	487559626661978114	f	mactruckny
Good morning 47st!!! Between Park and Lex today for lunch. Last chance before september #saratogabound	1405076958	487554219361050624	f	mactruckny
@Lobsterhut yessss sirr!!! Looking forward to seeing you upstate for some #tasty #lobsterroll	1405004480	487250223677181954	f	mactruckny
Front St. And John St. #seaport #seechange 12-8	1405004428	487250004482875392	f	mactruckny
RT @RefineryHotel: Just like mom used to make it, only better! @Mactruckny parked outside the hotel today. More Mac &amp; Cheese plz! http://t....	1404924368	486914210450780160	f	mactruckny
38th st. And 6th ave. in front of the refinery hotel. 12-6	1404919095	486892094342967296	f	mactruckny
John st. &amp; Front st. 12-8 south st. Seaport	1404746453	486167979248197634	f	mactruckny
RT @LBoschie: AMAZEBALLs buffalo and pulled pork combo @mactruckny  - thank you for the mix! love, the 2 girls with 3 forks  http://t.co/...	1404669895	485846873417056257	f	mactruckny
South st Seaport, John st. &amp; Front st. 12-8	1404664806	485825526204878848	f	mactruckny
RT @TheNYRA: Have you checked out the #Belmont #StarsandStripes-bound food trucks lately? @gcnyc1, @mikenwillies, @mactruckny, @hibachiheav...	1404515074	485197505815007232	f	mactruckny
RT @mooshugrill: If you don't see #MSG at @TheSeaport don't fret! We're tucked away on Front &amp; Fulton by #SuperDry and @ambrosehall with @m...	1404067300	483319407154720768	f	mactruckny
Front st. And John st. South street seaport 12-8	1404060613	483291358946267136	f	mactruckny
RT @ESYNYC: @JonathanBenno please help us spread the word about our campaign to improve our Harlem garden! http://t.co/NB60ZAPkbt #rootingf...	1403826144	482307923616342019	f	mactruckny
Nuchas Truck will be at the @DUMBOartsfestival from 5pm - 9pm! Time for #muchasnuchas and art!	1411758934	515580455744466944	f	nuchasnyc
#FF @ForkintheRoadVV @gothamist @faz_topnews @elsalvadorcom @GothamNews_	1411749930	515542692286435328	f	nuchasnyc
RT @FoodtoEat: Tons of snackage can be done with #empanadas from @NuchasNYC, preorder online for pickup: http://t.co/zButf6latN	1411746326	515527573367840768	f	nuchasnyc
#TGIF! Time to celebrate the weekend with empanadas in hand - the truck is located on the corner of Broad &amp; Stone... http://t.co/jnub6Q8cFf	1411742990	515513580763226112	f	nuchasnyc
Throwing an upcoming #Halloween party? Nuchas caters! Let us help make your party delicious! Email us at catering@nuchas.com	1411683616	515264549973676033	f	nuchasnyc
RT @kelgoss: @nuchasNYC having a custom pour-over with Markiss! This coffee is EVERYTHING!! http://t.co/wI0UagEY1A	1411673852	515223597741506560	f	nuchasnyc
Happy Thursday! We're parked on W21st ST &amp; 5th Ave until 2:15PM. Come &amp; get some #muchasnuchas http://t.co/RKiPvaXR9j	1411654938	515144265765486592	f	nuchasnyc
We're excited for the @DUMBOArtsFest this weekend in #brooklyn!	1411587324	514860672812068865	f	nuchasnyc
Heading to Brooklyn this weekend? Stop by the Nuchas truck at the DUMBO Arts Festival! http://t.co/tX3gOjiHb2	1411576201	514814019560280064	f	nuchasnyc
Rise &amp; shine it's empanada time! The truck is located on Varick St between Charlton and King until 2:15PM http://t.co/1SO0vQQjXA	1411567106	514775872830963712	f	nuchasnyc
RT @orientemiedo: NYC Vendy Cup Finalist 2014: Nuchas Empanadas http://t.co/oekfQ0BLc0 via @SkeeterNYC	1411516251	514562569437454336	f	nuchasnyc
Nuchas #Catering! It's Nuchas where you need it, when you want it! Email your catering needs to catering@nuchas.com	1411504508	514513316124033024	f	nuchasnyc
@karachop Our Times Square Kiosk is back on Broadway between 44th and 45th!	1411490257	514453542652751872	f	nuchasnyc
After a quick vacation, our Times Square Kiosk is back on Broadway between 44th and 45th! http://t.co/AUMfmgllFh	1411489801	514451630285402112	f	nuchasnyc
Hey #NY! The sun is shining and empanadas are waiting for you at at 54 Pearl Street today until 2:15 PM - Come... http://t.co/fXicNjLMKz	1411484400	514428975947726849	f	nuchasnyc
Awesome! - Section 3 of the High Line Park Opens Today  See New Photos! http://t.co/jtX3BvOtAd via @6sqft	1411422307	514168538568085505	f	nuchasnyc
Enjoy! #MuchasNuchas RT @Jaffinator: One happy argentine at the office today. @NuchasNYC http://t.co/mCxor5Y4Xg	1411410475	514118914729840640	f	nuchasnyc
RT @julieg205: the food kiosks on times square @NuchasNYC #ricksawdumplings @SnackBoxNYC	1411406639	514102825174179840	f	nuchasnyc
Great time at @goodmorningamerica today! We helped Upgrade Your Morning with #muchasnuchas and coffee to the... http://t.co/Y4n2q2CSak	1411402929	514087264256028672	f	nuchasnyc
Nuchas on TV! \nGood Morning America http://t.co/HGVXu9Bm9U	1411389457	514030756637990912	f	nuchasnyc
@rachelbrill Fastest way to lose weight, burn fat and stop fat production http://t.co/zhkQ2MX5wk	1390923947	428192185209454592	f	wingnitnyc
@PolishCuisine Fastest way to lose weight, burn fat and stop fat production http://t.co/3PzF9KWyTQ	1390923944	428192175373828096	f	wingnitnyc
@bertones666 Fastest way to lose weight, burn fat and stop fat production http://t.co/whTuJBvo4v	1390923942	428192165047447553	f	wingnitnyc
@CDIdiamond Fastest way to lose weight, burn fat and stop fat production http://t.co/HVyv1Us20E	1390923939	428192154708504576	f	wingnitnyc
Merry Christmas everyone!!! We wish everybody a safe and Happy Holidays!!!	1388012013	415978652623331328	f	wingnitnyc
RT @FoodtoEat: Last day #12DaysofFoodTrucks ! Thx to all who participated &amp; to the #FoodTrucks serving us delicious food!  http://t.co/Ks3L...	1387841125	415261894967304192	f	wingnitnyc
RT @FoodtoEat: #12DaysofFoodTrucks Day 12 #FoodTruck is @wingnitnyc ! Guess where this is from? Win 10-25% off ur next order http://t.co/tH...	1387841124	415261888889778176	f	wingnitnyc
RT @FoodtoEat: Today's answer to #12DaysofFoodTrucks is @funbunsnyc ! Thx to all those who played and tune in Monday 12/23 for the LAST day!	1387841120	415261873207263232	f	wingnitnyc
Hello everyone! Looks like we are going to call it a year! It has been a fun journey so far fill with ups and... http://t.co/RwqalnwTOm	1387817580	415163138699321346	f	wingnitnyc
Out here on 23rd and 5th come and grab some wings for lunch today. We will be open from 10am to 3pm. See you guys at lunch.	1387549355	414038124268752896	f	wingnitnyc
Hey guys were back out today wing'n it on 56th and Broadway. Come grab some wings for lunch today. For pre-orders... http://t.co/PodH8EaA0G	1387458557	413657287773786112	f	wingnitnyc
Today we're on 54th and Broadway. Come get some wings for lunch today. Give us a call and pre-order don't want in the cold 917 740 1765.	1386859597	411145066464309248	f	wingnitnyc
Hey wings fans! We are out today and ready to serve you great tasting wings. Come see us at lunch time. Today we... http://t.co/mHKTBVJvKM	1386773635	410784518253977600	f	wingnitnyc
RT @SRBBrooklyn: Chicken wings, pop locking and vinyl records. All here, Saturday with @JusteDeboutUSA @ilovevinyl &amp; @wingnitnyc	1386300380	408799543166124032	f	wingnitnyc
RT @SRBBrooklyn: If you're coming out to this Saturday's @JusteDeboutUSA event be sure to grab some grub from @wingnitnyc, they'll be servi...	1386277311	408702781235929088	f	wingnitnyc
We have been going through some issues at our commissary and due to these issues we are unfortunately not able to... http://t.co/8hzi0hlGy4	1386160771	408213977030615041	f	wingnitnyc
Sorry everyone, we aren't out today. See you guys tomorrow.	1386081285	407880590243803137	f	wingnitnyc
Happy Thanksgiving Everyone! http://t.co/u7HYUz1MyA	1385666299	406140011419955200	f	wingnitnyc
Happy Thanksgiving Everyone! http://t.co/yTrps7tc4O	1385666235	406139743098142720	f	wingnitnyc
RT @MobileCuisine: Food Cart Vendors Face Fines and Arrests for Selling Snacks - http://t.co/Oh2k939USu	1385525761	405550553155252224	f	wingnitnyc
Open! 48th bet 6 and 7 ave. Come check out our off the menu specials!\n\nCall in orders to: 917-756-4145	1411744122	515518328761516032	f	disosnyc
Location alert: 48th st bet 6 and 7 ave\n\nCall in orders to: 917-756-4145	1411736282	515485445124534272	f	disosnyc
Off the streets today.. Will be back Tom 48th bet 6 and 7 ave	1411650638	515126230392528897	f	disosnyc
@Ony1Ra_Rah every Wednesday.. Water and old slip/ Hanover sq	1411579459	514827681738022912	f	disosnyc
@vincefair @jaycowit maybe Tom..	1411579423	514827532177510400	f	disosnyc
Open for lunch.. Water st and old slip/ Hanover corner. Make sure you check out our sandwich of the day on our... http://t.co/Y3Oqbxdf10	1411571481	514794223506583553	f	disosnyc
Location: water st and old slip/ Hanover sq corner spot.\n\nCall in orders to: 917-756-4145	1411565551	514769347760635904	f	disosnyc
Parked on 48th bet 6 and 7 ave.\n\nCall in orders to: 917-756-4145	1411483845	514426649589608448	f	disosnyc
Open for lunch.. 47th bet park and lex\n\nCall it in: 917-756-4145	1411400184	514075749171888129	f	disosnyc
@MichaelRascoe 47 bet park and lex	1411397225	514063339161669632	f	disosnyc
Lunch today on 47th bet park and lex.\n\nCall in orders to: 917-756-4145	1411392895	514045176571265024	f	disosnyc
Open for lunch.. 48th bet 6 and 7 ave\n\nCall in orders to: 917-756-4145	1411140660	512987228243755008	f	disosnyc
RT @eric_zimm: @DiSOSNYC best spot in the city	1411140530	512986683277840384	f	disosnyc
Lunch happening on 48th st bet 6 and 7 ave today.\n\nCall in orders to : 917-756-4145	1411133239	512956100828991488	f	disosnyc
@CourtneyPollack: @alyssamal, Welcome to midtown east...  Now, go to @DiSOSNYC for lunch today!! 	1411062709	512660277159276544	f	disosnyc
Open for lunch. 47th bet park and lex\n\nCall in orders to: 917-756-4145\n\nDisos homemade roast beef special today... http://t.co/fgGECrvMRd	1411052746	512618488004100096	f	disosnyc
Parked 47th bet park and lex..\n\nCall in orders to: 917-756-4145\n\nRoast beef special back in rotation!	1411049921	512606640919810048	f	disosnyc
Open for lunch.. Get it! Water st, and old slip corner..\n\nCall in orders to: 917-756-4145\n\nSpecial today:... http://t.co/XamkqVH7pG	1410966335	512256054529638400	f	disosnyc
RT @MTBinns: @joanie_ues @deneenborelli @tomborelli the only restaurants we go to in Midtown have 4 wheels.  @DiSOSNYC outside of Fox is my...	1410964168	512246965409943552	f	disosnyc
Lunch on corner of water and old slips today..\n\nCall in orders to: 917-756-4145\n\nSpecial: Disos famous homemade... http://t.co/UEk2YdDN3o	1410960478	512231487337680896	f	disosnyc
#VeganLunch is on #77Water St @ATT @ArupGroup @DowntownNYC @billclinton @nycfoodtruck @AHealthBlog @WellandGoodNYC @avisrichards @biz @rqui	1411745969	515526076836368384	f	thegreenradish1
Get your #Vegan on Today, Friday, WaterSt at Old Slip/Gouverneur Ln 11-2...	1411730378	515460684155723776	f	thegreenradish1
Hey NJ, join us on Sunday... http://t.co/PbjrYQg1xy	1411720040	515417321951985665	f	thegreenradish1
RT @Sociedadeveganc: The green radish - blackk bean burger e donut #NewYork #thegreenradish #veganfood http://t.co/fsqoxF2Li1	1411653040	515136303273615360	f	thegreenradish1
RT @pakoonis: if the food from @thegreenradish1 tastes as amazing as it smells, oh my.	1411608328	514948770388529153	f	thegreenradish1
RT @fastpacedfoodie: @thegreenradish1 so happy to have found you today! Perfect post hot vinyasa meal! #plantpowered #vegan #workhard #eatw...	1411608275	514948546916020225	f	thegreenradish1
G-Rad Off Road Thursday, Back Friday at Wall and Water.....	1411607963	514947238536429568	f	thegreenradish1
#VeganLunch 38&amp;Bway 11-2 BBQ BlackBeanBurgers &amp; Choc-Banana Shakes @GarmentDstrctNY @OneGreenPlanet @PamelaDAnderson http://t.co/29KTAY34ol	1411570450	514789897774047233	f	thegreenradish1
Call it in for pickup @GarmentDstrctNY @justbobbibrown @AliciaSilv @thelittleidiot @bittman @simonsam @BuzzFeed @rqui http://t.co/2lZkYs8ipE	1411562438	514756290829369344	f	thegreenradish1
Lots of food options in garment district,only one #Vegan #Organic @thegreenradish1 today 38&amp;Bway 11-2 @GarmentDstrctNY @Brendan_Brazier @biz	1411561631	514752908278390784	f	thegreenradish1
#GoVegan Today! 38th&amp;Bway 11-2 @midtownlunch @WellandGoodNYC @EatStTweet @avisrichards @mashable @DharmaYogaNYC @NewYorkObserver @EaterWire	1411556212	514730178644549632	f	thegreenradish1
Have utriedour BBQ Burger? @WellandGoodNYC @livingmaxwell @NewYorkObserver @NYC_Eatz @AHealthBlog @OneGreenPlanet @TimeOutNewYork @simonsam	1411487917	514443728610934784	f	thegreenradish1
RT @VeganNewsNet: Read Veganic Planet   today's top stories via @p2tmnc @thegreenradish1 @B_Boheme http://t.co/GwSSvaVqNX	1411486182	514436450423959552	f	thegreenradish1
Black Bean Burgers start here...47lex@park 11-2 @midtownlunch @nyfoodtruck @simonsam @rickygervais @GayleKing @biz http://t.co/onJGPCWDjF	1411485519	514433672582537216	f	thegreenradish1
@thegreenradish1 47&amp;park/lex 11:00AM Until 2:00PM EDT http://t.co/MvvQQI7309	1411484717	514430308758740992	f	thegreenradish1
RT @nycfoodtruck: G-chat your friends with these food truck locations and let's meet for lunch! http://t.co/ib5m1SjrT9 #foodtrucks	1411477622	514400547567579136	f	thegreenradish1
RT @VeganicPlanet: Read Veganic Planet   today's top stories via @p2tmnc @thegreenradish1 @B_Boheme http://t.co/47Ln7tmRfd	1411477420	514399699898753024	f	thegreenradish1
Hey Radish Seekers, on 47&amp;Park/Lex Today @midtownlunch @OneGreenPlanet @BuzzFeed @bittman @rickygervais @simonsam @Tweat_It @thelittleidiot	1411476398	514395416151199744	f	thegreenradish1
RT @The_GroundUp: Check out the delicious #vegan and #organic food from @thegreenradish1 for lunch today. http://t.co/7WhvTUZ7fH	1411473843	514384697104011265	f	thegreenradish1
RT @AHealthBlog: Health Benefits of Radishes http://t.co/b9S3vM2Zrg http://t.co/3yBxKVSMRx	1411470219	514369498494009345	f	thegreenradish1
Open @ Bergen and Court!	1411817210	515824885114081281	f	carpedonutnyc
@AshantiAleyce yay for gettin some!	1411820273	515837729335414784	f	waffletruck
@pandypuddingpie we do what we can.	1411820245	515837614277275648	f	waffletruck
@ChicagoGirlinNY you shall have to table the wafel desire til...well...today!	1411820223	515837520261955584	f	waffletruck
@IYN_Yogi aawwwwww! Thanks!	1411820166	515837280351965185	f	waffletruck
Happy weekend! No truck today, so come to Brooklyn to our shop! The Treats Truck Stop 521 Court st Carroll Gardens !!!	1411822382	515846576347308032	f	thetreatstruck
We're getting ready for you at the @DUMBOArtsFest in #Brooklyn! Join us from 11am-9pm for mouthwatering #LebaneseEats!	1411823120	515849673647869952	f	toumnyc
RT @smorgasburg: What to do? Come to #Williamsburg 11am-6pm. Plus the Record Fair is happening w/ 50+ shops, collectors, DJs, and labels w/...	1411825412	515859285663027200	f	eddiespizzany
@livefastgroup: it's our last day @Gov_Island. Come down and grab some amazing food while taking in the last sun of summer. @SweetChiliNYC	1411822949	515848955532673024	f	sweetchilinyc
6 Graded Races, Family Fun, and Food Trucks - Join us for #SuperSat today at #Belmont! @TheNYRA  http://t.co/ogT9kXRMpX	1411824788	515856666295042050	f	andysitalianice
beautiful day! if you're out come visit us @bkflea ft greene  or @smorgasburg  inside @houstonhallnyc   bessie's at a private shindig.	1411827172	515866666878906368	f	milktrucknyc
Outdoor stands at Ft Greene @bkflea and Williamsburg @smorgasburg. Sandwich menu always @houstonhallnyc	1411826414	515863487306686464	f	milktrucknyc
#beautiful #sunny #weekend @Governers #Island #fresh #savory #curries #samosas #kati #rolls #mango #lassie only the #best	1411827150	515866575585308673	f	mausamnyc
@Foodtruckgirl7 Absolutely ! Bolognese is our speciality, we will be waiting for you. Enjoy you weekend, ciao bella! 	1411827095	515866345746227200	f	pontirossifood
Off the streets today for #private #catering #events http://t.co/KK9pemlW8B	1411828790	515873454126411777	f	eddiespizzany
Off the streets today for #private #catering #events http://t.co/mx0YTTj3Cr	1411828787	515873441405083649	f	eddiespizzany
Its our last day @Gov_Island come support @nokidhungry , @SixDegreesofKB &amp; @IMKevinBacon #sixdegreesofspicybacon http://t.co/oSBRH53CD1	1411827687	515868825670414336	f	sweetchilinyc
We are at the TVG Super Saturday at Belmont Park today in Elmont, NY @TheNYRA http://t.co/iHZqdF93zK http://t.co/HoTpM5gEWi	1411827323	515867301103828992	f	papayakingtruck
@MontFarmersMrkt Sorry, not today......Catering a Wedding in Stockton, NJ	1411828502	515872247048044544	f	thegreenradish1
Join us for #SuperSat at @TheNYRA today  from 11-6! #hibachiheavenNYC	1411832288	515888125663784960	f	hibachiheaven
RT @TheNYRA: #SuperSat options at #Belmont include @dubpies, @comengetitbbq, @hibachiheaven, @ElPasoTruck, and more!	1411832225	515887862907404289	f	hibachiheaven
Kotmadam @ the South Street Sea Port till 6pm	1411832478	515888924108292096	f	waffletruck
http://t.co/oMNLyVcNt5	1411832370	515888468376190976	f	waffletruck
World Championship cycling this weekend!! Who was the first Belgian cyclist to win the rainbow jersey? Tell us for one free dinges! #cycling	1411832363	515888439913627648	f	waffletruck
Pagadder @ Brooklyn bridge till 9pm\nGoesting @ Bway &amp; 66th till 10pm\n\nAleeeeez get your #dinges!	1411830590	515881003798507520	f	waffletruck
CARTS\nVedette @ 60th &amp; 5th till 8pm\nKotmadam @ Bway &amp; 17th till 10pm\nBierbeek @ great lawn in Central Park till 8pm	1411830586	515880987897896960	f	waffletruck
TRUCKS\nMomma truck @ Park Slope til 4:30pm\nKastaar @ Governors Island till 6:15pm	1411830579	515880956662939649	f	waffletruck
Weeeeeekend!!!\n\nLe cafe @ 15 Ave B till 2am\nDe Wafel Cabana @ 35th &amp; Bway open till 10pm	1411830571	515880924010274816	f	waffletruck
RT @BklynDefenders: Slamming lunch provided by @DriveChangeNYC &amp; @SnowdayTruck at #GULD2014 http://t.co/dxYMkapWC2	1411832474	515888905594634240	f	snowdaytruck
RT @Foodtruckgirl7: @SnowdayTruck tomorrow @GovIslandFood perfect I can actually get there tomorrow I was so sad I might have missed you! #...	1411832115	515887398937698304	f	snowdaytruck
We were truly honored to meet and hear amazing words of wisdom from a legend like DR @Cornelwest http://t.co/GANuC21Rco #THENEWSCHOOL #GULD	1411832048	515887119903260672	f	snowdaytruck
We had a great time at the @thenewschool #juvenilejustice conference GULD - keep trucking http://t.co/UY3DCSNTNQ	1411831509	515884858845843456	f	snowdaytruck
Dr. @cornelwest visits the truck @thenewschool calls us the "justice truck" #madmapleloveoverflow http://t.co/TjirEe5N0c	1411831144	515883328478920704	f	snowdaytruck
@equiluminance @CornelWest so amazing	1411830124	515879048762126337	f	snowdaytruck
.@Foodtruckgirl7 @SweetChiliNYC @GovIslandFood we are not there today because of a private event! See everyone tomorrow for the last day!	1411830096	515878930679881728	f	snowdaytruck
Its THE LAST weekend we are open in MONTAUK until next Spring! Come celebrate an amazing weekend. #CLAWSUP	1411832054	515887145647894528	f	lobstertruckny
Its  weekend of the Season for our store in MONTAUK! Come celebrate an amazing weekend. #CLAWSUP	1411832023	515887015301513216	f	lobstertruckny
Weekend essentials at #MadSqEats \nDo it up http://t.co/xdQBorQzNN	1411831002	515882730513780736	f	mexicue
Catch us at Belmont Race track with other amazing  trucks. 11am to 5 pm come enjoy this beautiful Saturday with us.	1411832773	515890157569179648	f	mrniceguytruck
We've got a nice rear! Great shot at the Grand Army Plaza!\n\nInstagram via @ooh_la_la_toya http://t.co/bCuaEUq1qu	1411833602	515893636463341568	f	nuchasnyc
It's a beautiful day come to Smorgasburg N7 &amp; Kent and enjoy an arepa by the river http://t.co/8lEG78ZaHL	1411834387	515896930518704129	f	palenquefood
@lyft is giving you a free ride! Use the code BIGDSGRUB for $25 credit on your first #Lyft, your friend with a car: http://t.co/kYjQoxYwCw	1411836877	515907371818704897	f	bigdsgrub
We're @queensfarm and @DUMBOArtsFest all weekend! Come get some cheese in your belly!	1411838019	515912161127047168	f	morristruck
@jfabula try ben@eatmorris.com!	1411837981	515912005484814336	f	morristruck
RT @marcosarteaga: Brunch at @shortysnyc! (at @ShortysNyc in New York, NY) https://t.co/c9zoG2P5GY	1411838933	515915998197989377	f	shortysnyc
Perfect day for a margarita or beer, so just put them both together at #MadSqEats in our Bulldog http://t.co/Be4qPKjSwx	1411843675	515935885872099328	f	mexicue
RT @OraKemp: On potato salad duty with @thegreenradish1 congrats to Deniz and Alex! Beautiful food for a beautiful... http://t.co/VF9FvVa7UZ	1411843638	515935730099843073	f	thegreenradish1
Thank You @Foodtruckgirl7 for all the RT's and support!	1412265892	517706793754329088	f	hibachiheaven
634 McLean Avenue , Yonkers,NY 914-457-4324 we deliver!! Check us out on Grub Hub and http://t.co/CxQWQgUMGR	1411845327	515942816351289344	f	mrniceguytruck
Belmont Raceway Today and Tomorrow Governors Island. We are Ready to Serve You. Windows go up at 11am till 5pm.	1411845290	515942659366477824	f	mrniceguytruck
RT @BrooklynSaint: @TheNYRA @mactruckny @MrNiceGuyTruck @gcnyc1 @PapayaKingTruck @TheCrepesTruck @AndysItalianIce some may be eating chalk.	1411845332	515942834583896065	f	gcnyc1
RT @LisaF713: @TheNYRA @mactruckny @MrNiceGuyTruck @gcnyc1 @PapayaKingTruck @TheCrepesTruck @AndysItalianIce Sounds great but might be too ...	1411845327	515942813557862400	f	gcnyc1
RT @JuliaMurney: @gcnyc1 My belly is so happy when I find your truck. I came to the cheese, yo. http://t.co/ms6Q8Fmr0J	1411845298	515942693663686656	f	gcnyc1
Wow  what a Saturday! Serving up our famous Cheesesteaks @TheNYRA Belmont Racetrack till 6 GOT WHIZ? #RE2PECT http://t.co/JFgHMItNvM	1411844706	515940208601497601	f	carlssteaks
@cmclark0303 http://t.co/EXsx2ssVdB	1411845043	515941624044851203	f	valduccis
Enjoy your #saturday with #muchasnuchas in hand!	1411845021	515941530876772353	f	nuchasnyc
RT @BKPour: Getting hungry? Go to the food trucks! Get a bite from @philssteaks @gcnyc1and @valduccis outside in  the #BKPour courtyard.	1411849869	515961867093962752	f	valduccis
RT @garypotomic: @EatStTweet @jerseybites Love\nEat St. Visit  @thegreenradish1 excellent vegan food truck!	1411855375	515984958771703808	f	thegreenradish1
Try @pieburycorner or @NZGourmetPies RT @myles_myed1973: @dubpies can ya deliver to the UK,if not I'll spread the word...love Myles.....	1411866860	516033132500639745	f	dubpies
Sorry, no - &amp; thanks!  RT @myles_myed1973: @dubpies can ya deliver to the UK,if not I'll spread the word...love Myles.....	1411866831	516033009221640193	f	dubpies
RT @caitiemariie: @Mexicue, thanks for helping us celebrate! You guys rock! Our guests won't stop saying how amazing the food was and how g...	1411875910	516071087881617409	f	mexicue
@caitiemariie congrats guys, and honored to have been part of it!	1411875904	516071062325698560	f	mexicue
Wonderful night #dumbo thanks @trustytruck for great burger &amp; @labellatorte for awesome Capp #art http://t.co/QBPVZIGRN2	1411865734	516028406539251713	f	polishcuisine
Catch us tomorrow  @AtlanticAntic right near 3rd ave12-6! #streetfair #thaietnamese #sriracha #fries #NoKidHungry #brooklyn #streetfood	1411863364	516018468505010176	f	sweetchilinyc
#toastmonster at #UrbanSpaceGarment http://t.co/CHJ7lDQsWG	1411885545	516111500000239616	f	toastmonsternyc
Catering Fresh Pasta ! #bestcatering http://t.co/VDmdcFwX3m	1411858511	515998110922055680	f	valduccis
Dinner is now being served at the @RoyalPalmsClub (514 Union St, Brooklyn, NY 11215) #ShuffleBoard	1411862710	516015725115609088	f	papayakingtruck
RT @RamsFarmersMrkt: We got a special treat coming for everyone on the 28th, which is also the Apple Festival... our first FOOD TRUCK!... h...	1411895816	516154578988191744	f	thegreenradish1
Come and #VegOut with Us Today @RamsFarmersMrkt @NJ_Munchmobile @NJFoodTrucks @NJMonthly @News12NJDesk @BergenHandL https://t.co/idRIXP8Mfm	1411895764	516154362541142016	f	thegreenradish1
Hey Ramsey, skip breakfast save room #VeganLunch @RamsFarmersMrkt @NJMonthly @ChasingNJ @DrFuhrman @Engine2Diet @biz http://t.co/OS75GEjCRa	1411865329	516026709007925249	f	thegreenradish1
RT @dascobal: @thegreenradish1 would be great if you could cater my life :)	1411865015	516025390306172929	f	thegreenradish1
Hey NJ,#VeganLunch Sunday @RamsFarmersMrkt @BergenHandL @njdotcom @NJ_Munchmobile @NJMonthly @News12NJDesk @gfdfnj @NJFTA @justbobbibrown	1411864606	516023676874276864	f	thegreenradish1
We Cater Weddings...... http://t.co/NGV2ZsjFFw	1411864343	516022573843619841	f	thegreenradish1
RT @MontFarmersMrkt: @thegreenradish1 we missed you - craving that Tempeh!	1411864035	516021283432456192	f	thegreenradish1
RT @AHealthBlog: Radishes have compounds which exhibit cancer fighting potential http://t.co/b9S3vM2Zrg http://t.co/RopjQzEL6A	1411862878	516016428190011393	f	thegreenradish1
Art + Falafel = Win. Join us at the @DUMBOArtsFest today in Brooklyn for great food and great culture. 11-6.	1411899638	516170610339512320	f	taimmobile
Parked in Red Bank NJ 9:00-3:00 corner of W.Front/Shrewsbury\n\nVanilla bourbon creme brulee donuts are in the house! http://t.co/PaFMt2WFSU	1411906979	516201401987649536	f	veganlunchtruck
Sun, Sept 28th no truck today! Our shop open 8am-6pm w/food &amp; treats!!! 521 Court street Carroll Gardens #brooklyn #treats !!!	1411907490	516203546812096513	f	thetreatstruck
Taking the A Train to get a slice of Valduccis Pizza #bestpizza #bestcatering http://t.co/iT77tGQBLR	1411908735	516208768926097408	f	valduccis
Are you ready for an epic last day on @Gov_Island Come one Come all as we break out some special menu items just4U! http://t.co/YUxnPYQyn5	1411909985	516214010971447296	f	snowdaytruck
TRUCK ALERT: we will be in #Astoria &amp; #Sunnyside for dinner this week! #pierogitime #yeah! http://t.co/Vf326P9gda	1411910083	516214423179255809	f	polishcuisine
Hey everybody.  Could you vote for us to help us win a grant from Chase so we can get back to NYC: https://t.co/agL757ItQD	1411911028	516218383172657152	f	usafoodtruck
Outdoor stands at Pier 2 @smorgasburg. Sandwich menu always @houstonhallnyc	1411912815	516225878712266752	f	milktrucknyc
Le cafe @ 15 Ave B till 11pm\nDe Wafel Cabana @ 35th &amp; Bway open till 10pm	1411914990	516235004587016192	f	waffletruck
Stop by #newyorkbotanicalgardens #bronx today for some pizza http://t.co/LovpNcOMAn	1411914492	516232912166191104	f	eddiespizzany
Stop by #newyorkbotanicalgardens #bronx today for some pizza @ The New York Botanical Garden http://t.co/PKv7Y11X2B	1411914486	516232887419813888	f	eddiespizzany
Come see us at Prospect Park!	1411913719	516229673127526400	f	carpedonutnyc
A taste of summer today\nSouth Street Seaport\n#ComeToTheCheeseYo	1411913194	516227471038222337	f	gcnyc1
@katrap37 super sorry.  Ran low on scrambled tofu today . Our bad completely	1411914975	516234938174439424	f	veganlunchtruck
Things are just waking up in #dumbo come visit us today Dumbo Arts Festival until 5pm @nuchasnyc are here too! http://t.co/NnzEpVA2Jx #daf14	1411913968	516230714501902336	f	kimchitruck
Hey Ice Lovers - Well be OFF THE ROAD for a Private Event. Stay tuned for updates on where well be throughout the week!	1411914961	516234879957467136	f	andysitalianice
RT @KimchiTruck: Things are just waking up in #dumbo come visit us today Dumbo Arts Festival until 5pm @nuchasnyc are here too! http://t.co...	1411913984	516230781489143808	f	nuchasnyc
Bierbeek @ great lawn in Central Park till 8pm\nPagadder @ Brooklyn bridge till 9pm\nGoesting @ Bway &amp; 66th till 9pm	1411915669	516237851105964032	f	waffletruck
CARTS\nVedette @ 60th &amp; 5th till 8pm\nKotmadam @ South Street Sea port till 6pm	1411915664	516237831296270336	f	waffletruck
TRUCKS\nMomma truck @ York &amp; 79th till 10pm\nKastaar @ forest hills till 10pm	1411915651	516237775948234752	f	waffletruck
Another beautiful day @queensfarm and @DUMBOArtsFest! #bestweekendever	1411916823	516242689466318849	f	morristruck
@macsamurai yeah, sorry, better than cold pies! &amp; music starts at 12, pretty sure to won't hear Gen then ;-)	1411918872	516251282987044864	f	dubpies
@mad__bull #pietruck is at Freshkills - Sneak Peak, Staten Island	1411918802	516250990799224832	f	dubpies
RT @mad__bull: @dubpies where is yo pie truck today? Checked the web but no joy	1411918751	516250775660810241	f	dubpies
The season is winding down here at Pier 13, we're still here but not for much longer!	1411917771	516246667298078722	f	nautimobile
Another perfect day for outdoor Nacho-ing at #MadSqEats! Get these bad boys with Burnt End Brisket Chili &amp; Queso http://t.co/lk1FQlMIdh	1411918624	516250245588856832	f	mexicue
We are @AtlanticAntic 12-6 today right off 3rd Ave! #thaietnamese #sriracha #fries #NoKidHungry #brooklyn #streetfood #happysunday #yum #yay	1411917974	516247517005377537	f	sweetchilinyc
No service today. Enjoy your Sunday!! See you tomorrow Midtown (Broadway at 58th St.) http://t.co/wWPBgd0zoB	1411919112	516252293583630337	f	papayakingtruck
RT @GovIslandFood: Last day of 2014 @Gov_Island. Come say goodbye and grab the best food in town. @DiSOSNYC @MrNiceGuyTruck @ElPasoTruck #g...	1411916477	516241238396502017	f	disosnyc
@CalicoAvenger Staten Island, as per email truck location sent early this week http://t.co/Yfbdb0bWrr	1411919108	516252274189156352	f	dubpies
"So, like, I don't want to be overdramatic, but the Argentinian beef empanadas are the light of my life and I die... http://t.co/ZeMVNJX9cM	1411920005	516256036903469056	f	nuchasnyc
@rosssphilip we have a restaurant! It's called @ChelaGarnacha stop by! Same family cooking for you more taco options!	1411921906	516264009562337281	f	mexicoblvd
Another perfect day come to Brooklyn  AtlanticAntic for our famous Cheesesteaks &amp; great music truck on Atlantic &amp; Henry st till 6 GOT WHIZ?	1411921061	516260465895567360	f	carlssteaks
Another perfect day come to Brooklyn @AtlanticAntic for our famous Cheesesteaks &amp; great music truck on Atlantic &amp; Henry st till 6 GOT WHIZ?	1411921015	516260273523785728	f	carlssteaks
Up and running at #SouthStreetSeaport Front &amp; John St @Dossieroutpost #Cheesesteak #ChickenCheesesteak #RoastPork... http://t.co/ccjrUL74w4	1411921484	516262241256361985	f	shortysnyc
Herro @UrbanSpaceNYC find us at @GarmentDstrctNY till 9pm. Rawrs! http://t.co/goX8VCRzqC	1411920025	516256120193953793	f	toastmonsternyc
#another #beautiful #day @Governers #Island #authentic #Indian #cuisine #best #curries N #bites	1411925647	516279703238242304	f	mausamnyc
Taking the ferry over for the last time of the season! Thank you @GovIsAlliance @Gov_Island it was a blast http://t.co/1ajOfnJwuY	1411929109	516294221759021057	f	snowdaytruck
RT @drbarlow82: Drinking a West Coast IPA (2014-) by @GreenFlashBeer at @shortysnyc  http://t.co/ZbkkzOm6Jb	1411927886	516289091437350912	f	shortysnyc
RT @ShanderShow: The calm before the storm at @shortysnyc in NYC. #EAGLES http://t.co/zNcdoBByz1	1411927875	516289045069312002	f	shortysnyc
RT @GovIslandFood: Last day of 2014 @Gov_Island. Come say goodbye and grab the best food in town. @DiSOSNYC @MrNiceGuyTruck @ElPasoTruck #g...	1411930413	516299689432723457	f	mrniceguytruck
Sunday night football!!!!! Get your big game day packages from us. 634 McLean Avenue,  Yonkers NY .914-457-4324	1411930393	516299607148883968	f	mrniceguytruck
THIS WEEK's SCHEDULE:\n\n(Involves different days in some of our regular weekly spots, and some fun new locations... http://t.co/QvSEbtyPzL	1411930562	516300318163091456	f	veganlunchtruck
RT @perfectmorsel: First bite at #atlanticantic. Spicy coriander marinated beef w/ basil &amp; sriracha @sweetchilinyc. #hotdamn http://t.co/HL...	1411930400	516299635548487680	f	sweetchilinyc
Fully loaded Kale &amp; Quinoa Bowl with Burnt Ends Brisket Chili at #MadSqEats  http://t.co/i1Hrt28NpW	1411932305	516307627341803520	f	mexicue
Have you showed up to @AtlanticAntic yet?  We are just off 3rd ave till 6! #sriracha #fries #NoKidHungry #brooklyn http://t.co/W9ydSUSMxy	1411932967	516310404021387264	f	sweetchilinyc
Spend #SundayFunday with #muchasnuchas! Come visit us in #TimesSquare or #GreeleySquare!	1411932016	516306414747541505	f	nuchasnyc
C'mon NYJets let's not drag this out .... #FlyEaglesFly	1411934118	516315232118272001	f	shortysnyc
@macsamurai best savory pies in NYC though ;-)	1411934793	516318064024256512	f	dubpies
RT @therealest007: Where's my invite RT @ShanderShow: The calm before the storm at @shortysnyc in NYC. #EAGLES http://t.co/n1iZH21TuC	1411936439	516324968205152256	f	shortysnyc
RT @avamarieevans: 11 Reasons We Think NYC Is the Most Vegan-Friendly City in the US! http://t.co/eGLQRdDCIg via @OneGreenPlanet	1411936217	516324036788621312	f	thegreenradish1
RT @michelle_pill: Ate it too fast for a pic, but @thegreenradish1 #vegan #organic lunch @RamsFarmersMrkt was delish!! 	1411937183	516328086670147585	f	thegreenradish1
Join us at the @RoyalPalmsClub now till' 9pm today! 514 Union Street, #brooklyn #SundayFunday	1411940888	516343625618587649	f	bigdsgrub
@iambabe2 @Gov_Island both very good things to do.	1411943570	516354875538825216	f	waffletruck
@cmbrady12 should be open before then.	1411943548	516354781724803072	f	waffletruck
@SoomroMaryam miscommunication. Very sorry.	1411943523	516354678926639104	f	waffletruck
@Tabcastillo where specifically? Any ideas?	1411943479	516354493005725696	f	waffletruck
@dg1001 we are there every Tuesday on water st a block south of wall st.  Been going there for years weekly. Hope you visit us there soon!	1411948623	516376070833311744	f	veganlunchtruck
Tons of requests for us near Union square tomorrow, so we are trying out a new spot on 17th between Broadway/5th! (In addition to 48th/6th)	1411947432	516371073403977728	f	veganlunchtruck
Tomorrow is National Coffee Day!!  Celebrate with us at the SweeteryNYC truck for FREE cups of our amazing... http://t.co/YysPsmmjVU	1411954168	516399327950811136	f	sweeterynyc
@AdriennesPizza sausage/pepperoni pie best in nyc by a mile.	1411953380	516396023632392193	f	shortysnyc
RT @jat808: 9/29 is Nat'l Coffee Day!! Celebrate @ the SweeteryNYC truck with FREE coffee! 8:30-10:30am. 375 Hudson St while supplies last ...	1411955934	516406735502708737	f	sweeterynyc
9/29 is Nat'l Coffee Day!! Celebrate @ the SweeteryNYC truck with FREE coffee! 8:30-10:30am. 375 Hudson St. while supplies last.	1411954603	516401152410521600	f	sweeterynyc
Tomorrow is National Coffee Day, but for you tomorrow is FREE coffee day, more details in the AM.	1411959595	516422089491087360	f	sweeterynyc
@SnackFixation definitely #classic ! Love #AC -great posts!	1411958951	516419388988489728	f	polishcuisine
RT @KevinJWilk: @mamuthainoodle Why don't you come to Vandam and Varick anymore?!? We miss you...  #MissThoseNoodles	1410288058	509411153773359105	f	mamuthainoodle
New spot alert! We are at the Falchi building in LIC today! 47th ave &amp; 31pl.  Come by Queens! Till 3pm #turndownforwok	1410189174	508996406603173888	f	mamuthainoodle
Seaport Saturday! We are on front st. &amp; John. Till 8pm #turndownforwok	1410026214	508312902701699072	f	mamuthainoodle
Problem on one of our trucks means Union square will not be happening today, but 48th/6th is still happening.  Will have a ton of donuts!	1411984953	516528449050398720	f	veganlunchtruck
Hudson/King St, 2day is going 2 feel like ur bday &amp; X-Mass all in one, y, because it's National Coffee Day &amp; SweeteryNYC will FREE coffee 4U	1411989875	516549092332556288	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIyYdw	1411990505	516551735230214144	f	sweeterynyc
RT @postcardsfromny: At http://t.co/AirVV1r0QC -- Seizing the day: #empanadas from @NuchasNYC http://t.co/gwEYqT0h8m	1411992596	516560507856113665	f	nuchasnyc
Celebrate #NationalCoffeeDay with a cup of @LaColombeCoffee and medialunas!	1411992588	516560474314260481	f	nuchasnyc
Parked on 48th/6th 9:00-3:00 \n\nFREE DONUT WITH ANY PURCHASE TODAY!\n\nWhile supplies last\n\nToday's Special Is:... http://t.co/DmdJr01yom	1411992957	516562020347703296	f	veganlunchtruck
Hudson/King St. Today we will be giving away FREE100's of amazing @CoffeeLabs hot cups of coffee, we defy there's a better coffee around!	1411994341	516567825436381186	f	sweeterynyc
PLEASE RT:\n\nParked on 48th/6th 9:00-3:00 \n\nFREE DONUT WITH ANY PURCHASE TODAY!\n\n(While supplies last)\n http://t.co/FglcdTKUrj	1411994481	516568411464540160	f	veganlunchtruck
@nycfoodtruck you guys forgot about us. Mumble mumble 	1411994264	516567501875191808	f	pontirossifood
@Foodtruckgirl7 @PontiRossiFood says hello everyone from across the street :) coffee is on us today 	1411994175	516567128422768640	f	pontirossifood
Buongiorno Wall Street! Water st and Old Slip! Call in for orders 347-506-9616.Come get zesty authentic Italian Food http://t.co/ivoK8RViCX	1411993921	516566065242185728	f	pontirossifood
We will be back in dumbo today on fronts and Adams 12pm  everyone. Hope we can start your week off nicely :) @DUMBOFoodTrucks @jenchung	1411994176	516567132579315712	f	parissandwich
#Fresh #Curries to #start #your #week @47 #street #bet #Park &amp; #Lex #enjoy \n#delicious #savory #Indian #authentic #flavors	1411994990	516570548298469376	f	mausamnyc
Today we are offering a taste of our homemade focaccia pugliese for anyone  who places any order! Yummy 	1411994995	516570568230203392	f	pontirossifood
@Foodtruckgirl7 woohoo baby ponti is waiting for you  come get your coffee  and celebrate with us 	1411994884	516570102419161088	f	pontirossifood
RT @Foodtruckgirl7: @PontiRossiFood I have to find you today! Happy national coffee day  . Head out to @PontiRossiFood #pasta #foodtruc...	1411994760	516569582497464320	f	pontirossifood
Start off the monday right on Hanover Sq &amp; Water st! #financialDistrict	1411994763	516569593289404416	f	polishcuisine
Hudson/King St, who says Monday can't become Funday, w/FREE hot @CoffeeLabs coffee 4 all, or at least till we run dry. #MondayCouldBe Worse	1411995905	516574386758123520	f	sweeterynyc
We've got the tastiest #LebaneseLunch to cure your Monday blues! Grab a beef shawarma in @DumboNYC on Jay &amp; Water St! http://t.co/RSmXvQwVcX	1411996377	516576364494065665	f	toumnyc
SCHEDULE\n \nTuesday - 51st. Park/Madison\nWednesday - 38th and Broadway\nThursday - 52nd and 6th Ave.\nFriday - Water... http://t.co/XKrK3c9RkJ	1411996235	516575768210866176	f	thegreenradish1
Hudson/King, give us ur less than enthralled"it's Mon AM"proletariat, ur thirsty, &amp;ur generally underwellmed &amp;Sweetery will give back smiles	1411997326	516580344280383489	f	sweeterynyc
@Foodtruckgirl7 I used to wear a T-shirt that said ''I am gonna be  on a diet next Monday '' lol #pontirossiNYC #foodtrucklove #pasta	1411997064	516579246639435776	f	pontirossifood
RT @Foodtruckgirl7: @PontiRossiFood guess the diet starts Tuesday #pasta #bolognese #italianfood #sauce #sauces #nycfoodtruck #NYCfoodtruck...	1411996951	516578772649521153	f	pontirossifood
Bessie's at Columbia, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always @houstonhallnyc	1411997414	516580714494427139	f	milktrucknyc
Find us #midtown at 47th / Park today! #staytuned	1411997810	516582374118010880	f	hibachiheaven
Good Morning #NYC, we hope you had a awesome weekend!	1411997767	516582194794733569	f	hibachiheaven
Sorry we're not there to help beat the Monday blues. See ya in Dumbo manana!	1411998030	516583296822947840	f	kimchitruck
RT @MobileMSummit: Can't wait for #foodtruck deliciousness from @morristruck  &amp; @KimchiTruck on Mon! Tag food pix w/ #MMSAdweek2014! http:/...	1411997912	516582803153358849	f	kimchitruck
With a name like @CoffeeLabs (as in Labrador Retriever) Roasters is there any way the coffee could be bad? \n#SweeteryNYCLovesGivingAwayFree	1411998610	516585730974683138	f	sweeterynyc
Hello #SoHo!! Big D's Grub Truck is on Hudson/King St. (375 Hudson Street) 11am to 2pm	1411998644	516585873966923776	f	bigdsgrub
Khao Cart at 50th Street btwn 6th and 7th Avenue. Check out today's menu... http://t.co/ey88ARphAn	1411998528	516585388350386176	f	bigdsgrub
Hey Hey it's Monday. Beat the blues with steaks from tha jawn! 47th between Park and Lex 11-2!	1411998965	516587220061650944	f	philssteaks
@annieswit by ditmars - will post full schedule later on today	1411998610	516585731037593600	f	polishcuisine
RT @Foodtruckgirl7: I spy with my food truck eyes @PolishCuisine and @DesiFoodTruck, morning guys! #foodtruck #foodtrucklove #nyc #food htt...	1411998557	516585510031331328	f	polishcuisine
Lunch 2day @ 52nd st b/t 6th &amp; 7th av. Burger of the week THE GUACAMOLE BLAST. Preorder 9172929226 #midtown	1411998811	516586572272373760	f	fritesnmeats
Begin the week with tacos and #nachotots on 52nd and 6th!	1411998561	516585525579644928	f	domotaco
Truck is @theseaport, front and john st.	1411998717	516586180700540928	f	mooshugrill
Hello 17th&amp;5th! Hope you had a nice weekend! Come by for lunch and tell us about it! Till 3pm	1411998906	516586970760613888	f	mamuthainoodle
53rd and park for the pork chop goodness.	1411998589	516585643766743040	f	biandangnyc
New week and new monday lunch spot! \nWe're serving Harissa falafel deliciousness today at 27th &amp; Madison!  Spread the word!	1411999506	516589488920068096	f	taimmobile
#PieTruck is @DumboLot from 11am to 2.30pm - savory pies, sweet pies, @counter_culture flat whites, lamingtons, sides	1411999561	516589720735084545	f	dubpies
Check out this week's schedule!! https://t.co/mKPvwE8LmE	1412000005	516591582079102976	f	bigdsgrub
Asserting our Monday Brunch philosophy on Front &amp; Jay. Soup today is Split Pea. @DUMBOFoodTrucks #DUMBO	1412000055	516591792473792514	f	thesteelcart
#MADMAPLEMONDAY Everything maple Every Monday supplied by your friendly #SNOWDAY &amp; #DRIVECHANGE TEAMS! #EATLOCAL http://t.co/QiKAgTcJ27	1412000658	516594322121449472	f	snowdaytruck
RT @dumbolot: Welcome back! @ToumNYC @MexicoBlvd and @dubpies in the lot today!	1412000126	516592089623453696	f	dubpies
The Schnitzcart will be on 55th &amp; Broadway from 11:30-2:30 sliming deliciousness! Stop by for lunch:) @randomfoodtruck	1412000619	516594156626780160	f	schnitznthings
Getting married? We do weddings! Hire us for your late night snack! #weddings #madmaplematrimony http://t.co/zy55ndjO57	1412014098	516650693193924610	f	snowdaytruck
Good morning guys! Cure the Monday blues with Schnitz! The truck is on 47th b/w park &amp; lex 11:30-2:30pm. Stop by or preorder 347-772-7341	1412000532	516593793450401792	f	schnitznthings
Truck is having a spa day today ;) Well be in #dumbo for Tuesday lunch 11:30-2:30 on water st @ jay st #dumbolot	1412000194	516592375356211200	f	kimchitruck
RT @Qwiqq: Happy Friday!\nGo out a winner.\nhttp://t.co/a0SKLwqGJG http://t.co/N9WFJvkAVa	1412000898	516595326585937920	f	valduccis
47th bet park and lex today..\n\nDisos roast beef in the house today!\n\nCall in orders: 917-756-4145	1412000689	516594449619902464	f	disosnyc
Special MONDAY surprise, Taim is on the streets today! 27th and Madison with Harissa falafel!	1412001072	516596056168349696	f	taimmobile
Located on Hudson, between Houston and King!	1412001628	516598390072025089	f	thepocketful
Thank you! Thanks also go to @BigGreenEgg "@TheLexIsaacs: @dubpies @counter_culture @dumbolot The brisket pies are the best! #SavoryEats"	1412001060	516596005568249856	f	dubpies
53rd and park today! Ready in 30mins	1412001643	516598450713276416	f	vspot_truck
G1- Seaport\nG2- 33 / Park\n#ComeToTheCheeseYo	1412001488	516597799681802240	f	gcnyc1
Happy #NationalCoffeeDay friends! Celebrate with empanadas and coffee in hand today - the truck is located on... http://t.co/lW0U4UlEJu	1412001517	516597924948500480	f	nuchasnyc
Grab your friends or work buddies and come pick up #hibachiheavenNYC on 47th and Park #midtown	1412002381	516601547913170944	f	hibachiheaven
Getting ready to Fire up the Grill on Hanover Sq &amp; Water St today - beat the heat with our #Water	1412001935	516599676205027328	f	polishcuisine
Come get The Original on Broadway at 58th St. for lunch and Broadway at 65th St. for dinner	1412001938	516599689287057408	f	papayakingtruck
Goodmorning NYC\nToday Monday 9/29  11:30am-3pm\nLocation 47st between Lexington &amp; Park aves NYC\nHave a blessed day! http://t.co/hqHsU7Qdiv	1412003497	516606227787550720	f	latinkitchennyc
Yes, we are back, Heading to west village. #soho ready by 11:30am	1412003221	516605072437153793	f	shanghaisogo
5$ off any order 15$+, celebrating Luke's Lobster 5 year anniversary! We will have the truck on Pier 13 in Hoboken oct 1st, 5-9pm!	1412003688	516607028278857729	f	nautimobile
Buenos dias DUMBO, @dumbolot comida con sabor y amor @MexicoBlvd  Water&amp;Jay	1412004362	516609855797592064	f	mexicoblvd
Hello NYC! We r open @46th st between 5th &amp;6th ave . Try our rice bowl and rice burger , bibimbap burrito ! Plz stop by and enjoy thank you!	1412004175	516609071752179712	f	bobjotruck
Hi we are at Water st &amp;Old Slip till 2pm we have a beef &amp;root vege soup,stuffed cabbage ,beef stew w israeli couscous side baby dill pickle	1412004465	516610287987068929	f	langostruck
Up and running at #SouthStreetSeaport Front and John Streets @Dossieroutpost #Cheesesteak #ChickenCheesesteak... http://t.co/UlVmjGmJdi	1412003897	516607903738773505	f	shortysnyc
Good Morning. Hope you all had a great weekend. The Mtbll  is stopped at 50th bet 6&amp;7 aves. Come on by 	1412004286	516609536741081089	f	mtblls
Happy #NationalCoffeeDay! Although were OFF THE ROAD today-check out these spots for a cheap, or FREE, cup of Joe: http://t.co/4edo5xjuxv	1412004206	516609203117760512	f	andysitalianice
@nycfoodtruck @FoodtoEat @downtownlunch #soho VARICK st &amp; KING st until 3pm.	1412005257	516613609083125760	f	shanghaisogo
20 pounds of tortilla chips fresh out the fryer - Monday, we're ready for you http://t.co/trcGh0eUN0	1412004759	516611519585730560	f	mexicue
Friendly reminder: the truck is getting some R&amp;R today so we wont be out for lunch service. You can catch us tomorrow 11:30-2:30 in #dumbo	1412004634	516610998464434176	f	kimchitruck
Pagadder @ Brooklyn bridge till 9pm\nGoesting @ Bway &amp; 66th till 9pm	1412006394	516618378581385216	f	waffletruck
Kotmadam @ Bway &amp; 17th till 8pm\nBierbeek @ great lawn in Central Park till 8pm	1412006391	516618365616795648	f	waffletruck
TRUCKS\nMomma truck @ St. John's till 10pm\nKastaar @ 149th &amp; Morris Ave till 10pm\n\nCARTS\nVedette @ 60th &amp; 5th till 8pm	1412006367	516618265175810048	f	waffletruck
Le cafe @ 15 Ave B till 11pm\nDe Wafel Cabana @ 35th &amp; Bway open till 10pm	1412006329	516618106878582785	f	waffletruck
Having an office lunch? Let us feed you! We cater groups from 10-300 people! email us for menus and pricing info@sweetchilinyc.com #catering	1412005803	516615898426523649	f	sweetchilinyc
Who won the World Championship cycling yesterday? Tell us for one free dinges! #Belgianslovecycling #freedinges http://t.co/yn5Pwvfnf5	1412006527	516618938625835008	f	waffletruck
Monday!! Make it more fun with a lot of #dinges http://t.co/yTYDaKFYWc	1412006490	516618780718678016	f	waffletruck
Monday's are better with a Carl's famous Cheesesteak! Varick st &amp; Charlton st till 3 30 GOT WHIZ?	1412007278	516622085809266688	f	carlssteaks
Monday's are better with a Carl's famous Cheesesteak! Varick st &amp; Charlton st till 3 30 GOT WHIZ? http://t.co/qBmTuplj1h	1412007197	516621745131094017	f	carlssteaks
Roast beef in FULL rotation today, it's flying out..\n\n47th bet park and lex.. Call in to 917-756-4145	1412007030	516621047249252352	f	disosnyc
RT @MerJohnston: First customer, new location @TaimMobile my favorite!!!!! http://t.co/KWWtNiSFTt	1412007968	516624980734648320	f	taimmobile
RT @MeganLubrecht: @hibachiheaven: For some healthy eats try our hibachi shrimp with brown rice #YumYum #hibachiheavenNYC http://t.co/0B9d...	1412007665	516623708455444481	f	hibachiheaven
RT @tastyeating: The great benefit of working more downtown now is that I'm closer to @TaimMobile. The falafel is mine!	1412009027	516629421483393024	f	taimmobile
Lunch time!! #chickengravy #brussels http://t.co/OpjXG7oBml	1412009879	516632997152710656	f	waffletruck
PLEASE RT:\nCelebrate @MeatlessMonday at a @vendyawards winning #FOODTRUCK 48th/6th til 3\nFREE DONUT W/ ANY PURCHASE!\n http://t.co/FglcdTKUrj	1412010294	516634737776295936	f	veganlunchtruck
RT @randomfoodtruck: Lunch time! @schnitznthings out front and @PapayaKingTruck up Broadway at 58th.	1412010354	516634989794840576	f	papayakingtruck
Serving lunch @garment district @UrbanSpaceNYC delicious &amp; nutritious arepas ! Also Maduro con queso y bocadillo! :)	1412011587	516640158779994113	f	palenquefood
What a surprise!!! Just meet my favorite chinese Actor, screenwriter, film director #JiangWen @ VARICK st &amp; KING ST http://t.co/H35tnWVt4v	1412013164	516646772341743616	f	shanghaisogo
RT @Foodtruckgirl7: lunch time choice headed 2 @PontiRossiFood I am currently In heaven w/there Bolognese #nycfood #nycfoodtruck http://t.c...	1412013169	516646795750174720	f	pontirossifood
Not yo mama's Brussels Sprouts, these blackened beauties on our Kale &amp; Quinoa Bowl bring the BBQ vibes http://t.co/BeG5FBxBl7	1412013204	516646943892963328	f	mexicue
Wow! Thank you for all the TLC! GOW will be off for a little bit longer. Working on some cool modifications!! Can't wait to c u soon!	1412013484	516648115638915072	f	grillonwheelsny
The Truck is OFF but the store is Open. 914-457-4324 place your orders.	1412015339	516655897943105536	f	mrniceguytruck
RT @LukesLobster: The @nautimobile will be dishin' out lobster combos Tuesday-Wednesday  @HighlineStages for @MMAGlobal !	1412015131	516655024026701825	f	nautimobile
International coffee day!!! #dinges #coffee #brooklynRoasting	1412016227	516659622368014336	f	waffletruck
@jaibsee yes! 	1412015697	516657397281341440	f	veganlunchtruck
we are closed - thanks for coming!	1412015970	516658542934523904	f	polishcuisine
Mmmm #yummy http://t.co/gU8TOAskuW	1412018350	516668524178452481	f	mooshugrill
RT @swellecat: I just pre-ordered @VeganLunchTruck's cookbook. It will be published in May 2015. And I live in MN. Seriously love you guys!...	1412019109	516671708359823360	f	veganlunchtruck
RT @DriveChangeNYC: A moment that will be seared in our hearts &amp; minds - @CornelWest visits @SnowdayTruck during #GULD @TheNewSchool http:/...	1412019746	516674382379630592	f	snowdaytruck
RT @tfcornerstone: About the @SnowdayTruck, a @DriveChangeNYC initiative: "Ex-cons staff Vendy winner" http://t.co/64oy8svMz7 via @TimesLed...	1412019730	516674315878952960	f	snowdaytruck
Hello NYU! The jawn is on W. 4th near Greene st. We are rocking til about 8 so get over here and get your Phil!	1412019177	516671995191525377	f	philssteaks
Today is the day we team up with @nokidhungry @SixDegreesofKB &amp; @IMKevinBacon on the set of @TheFollowingFOX #enditwithorange #thaietnamese	1412020714	516678442306531328	f	sweetchilinyc
@mikeCABAHUG our truck is open daily 9:00-3:00.  The only time we do dinner is Thursday evenings in jersey city	1412023062	516688288351285248	f	veganlunchtruck
@Nomadnation We LOVE our fans and especially our falafel fans!! Thanks for the shoutout :)	1412024389	516693853659987968	f	toumnyc
RT @Nomadnation: I live for falafel from the @ToumNYC truck. Seriously. Find this truck. Eat all of the falafel.	1412024283	516693412188520448	f	toumnyc
@Don_Valdez Sorry we had some cart issues will be back out tomorrow Tuesday. FunbunsTuesdays ?	1412025245	516697444630138881	f	funbunsnyc
@Kitzka Hey we will be back out tomorrow 50th st btwn 6&amp;7ave !	1412025185	516697195090030592	f	funbunsnyc
RT @foodtrucksin: @ETRAVAGANZA We are the best place to find over 4,000 food trucks. We've added you, welcome. Become a free member http://...	1412026210	516701493840605184	f	etravaganza
RT @asphaltpunk: Big Bad Brisket and Lil Piggies from @mikenwillies - had to sneak out of #BEA14 for these yummy sliders! http://t.co/vvW1W...	1401471595	472432229122322432	f	mikenwillies
RT @HigherPra1seLLC: @dubpies Happy #nationalcoffeeday!\nMake sure to enjoy a hot cup or two this #Autumn day!! \n http://t.co/USbfqlbm...	1412026745	516703735264051200	f	dubpies
@iamvalerielane @MariaRiegel95 its just a bit of a drive from Brooklyn.	1412027085	516705161926803456	f	waffletruck
@abinda3 @LaFlamaBlanca89 we wish we had friends that forced us to eat good things for them.	1412027052	516705024013893633	f	waffletruck
@Lyle_Stirling @FeministaJones a very sad thing to realize.	1412026990	516704765980315648	f	waffletruck
@Goatyeah @FeministaJones that is one of the secret ingredients, yes.	1412026973	516704694341599232	f	waffletruck
@TheXDExperience we shall prepare ourselves!	1412026451	516702502863921153	f	waffletruck
@FeministaJones we can't help it. It's our job.	1412026426	516702398908080128	f	waffletruck
@CultureTrip awwww thanks!	1412026384	516702222701166592	f	waffletruck
RT @CultureTrip: New Yorkers; have you tried Wafels and Dinges? Best waffles outside of Belgium @waffletruck http://t.co/Dnde3YFMPP http://...	1412026368	516702155395194881	f	waffletruck
@lillytaughtme very sorry. Miscommunication.	1412026355	516702102442086401	f	waffletruck
@MariaRiegel95 @iamvalerielane tastes even better!	1412027306	516706091720122368	f	waffletruck
@yomamacribb we posted the locations earlier. Check back in the timeline, they're there.	1412027277	516705970622177280	f	waffletruck
@andre_asmara what a good idea you had!	1412027232	516705780746031105	f	waffletruck
@TDNamad what time?	1412027212	516705694855081985	f	waffletruck
@intel_jim hey, mimicry is the sincerest form of flattery.	1412027179	516705556602429440	f	waffletruck
@CherubimUriel near the D'Angelo Center.	1412027117	516705296777883648	f	waffletruck
Get Ready for #MONDAYNIGHTMAPLE? The Snowday and Drive Change team are all big sports fans so we love competition! Who's your favorite Team?	1412027110	516705268441546752	f	snowdaytruck
@crimsong19 If everything goes well, yes, that'll be our new monday lunch spot	1412028370	516710554929356800	f	taimmobile
RT @thedailymeal: @EddiesPizzaNY Congrats on being named to our list of our The 50 Best Pizzas in #NY! http://t.co/iHteZLMnbi #pizzaparty	1412029441	516715045800378368	f	eddiespizzany
Knowledge: Chips make the best eating utensils. Use em to scoop up a Market Plate like this Brisket BBQ http://t.co/kq54neLVXi	1412029396	516714856574357504	f	mexicue
See you tomorrow @DumboLot for our last day to raise money for #NoKidHungry! Order #Sriracha #Fries thats all it takes! #enditwithorange	1412029322	516714545583513600	f	sweetchilinyc
RT @natlfoodtrucks: RT @nycfoodtruck: Fantastic Food Carts of Wall Streets Hanover Sq: http://t.co/4TIpYEIrdu @PolishCuisine @fritesnmeats...	1412031532	516723814680760320	f	fritesnmeats
RT @crimsong19: @TaimMobile Will this be a regularity? I passed you guys but couldn't stop, and I'd gladly come back for delicious falafel ...	1412033251	516731026639712257	f	taimmobile
RT @crimsong19: @TaimMobile Awesomesauce!	1412033246	516731005898862593	f	taimmobile
Mmmmm Mmmmm Good !! http://t.co/nyoWLJRrGh	1412033396	516731632943128576	f	valduccis
Hey guys! Help us win the #BestGrilledCheeseTruck award! We love you! http://t.co/euC1rFrv3w	1412033601	516732491231944705	f	morristruck
@SirMrRichy Agreed!	1412033441	516731822605365248	f	toumnyc
RT @CG_DigitalMedia: collab is ft. #Chef @HibachiJoe's homemade #HibachiSauces #yumyum #gingersoy &amp; #wasabimayo http://t.co/Et7nn1NSnb	1412035088	516738731890315265	f	hibachiheaven
RT @CG_DigitalMedia: #Staytuned for a @hibachiheaven &amp; @hashtagSCBE collab! #foodbloggers #hibachiheavenNYC #SCBE #nyc #LA #foodtrucks	1412035052	516738577372557312	f	hibachiheaven
RT @camGarcia__: I'm excited to see what my #SCBE girls are whipping up with the @hibachiheaven sauces.	1412034366	516735704001683456	f	hibachiheaven
@HashtagSCBE we are looking forward to seeing your #MeatlessMonday meal! Thank You #SCBE	1412033623	516732585184329728	f	hibachiheaven
RT @HashtagSCBE: The sauces we received from @hibachiheaven and @HibachiJoe will be used in our #MeatlessMonday meal tonight. We can't wait!	1412033578	516732396939792385	f	hibachiheaven
What a great time @TheFollowingFOX with @kevinbacon @nokidhungry thanks for having us! http://t.co/EoQinagp8n	1412034611	516736731614543872	f	sweetchilinyc
RT @kevinbacon: Nice visit from @SweetChiliNYC to the set of @TheFollowingFOX some  proceeds to @NoKidHungry #NoKidHungry ... http://t.co/O23...	1412034482	516736188938719232	f	sweetchilinyc
hang on dumbo.  stuck in traffic. be open by noon.  @dumbonyc	1412177165	517334643595423745	f	shortysnyc
RT @nokidhungry: Thanks @kevinbacon for dining out with @SweetChiliNYC in support of #NoKidHungry! @TheFollowingFOX @SixDegreesofKB http://...	1412034442	516736020474503168	f	sweetchilinyc
RT @nokidhungry: .@SixDegreesofKB time! @SweetChiliNYC serving up Six Degrees of Spicy Bacon! @kevinbacon @TheFollowingFOX http://t.co/MxtL...	1412034431	516735974878224384	f	sweetchilinyc
RT @Foodtruckgirl7: @PontiRossiFood is like having access 2 great authentic Sunday sauce everyday #nycfoodtruck @nystfood @EAT_GOOD_FOOD_ h...	1412036632	516745204016361472	f	pontirossifood
RT @Foodtruckgirl7: @PontiRossiFood is like having access 2 great authentic Sunday sauce everyday #nycfoodtruck #italianfood #pasta #eats h...	1412036608	516745103554408448	f	pontirossifood
RT @nokidhungry: S/O to Tora &amp; Lisa w/ @SweetChiliNYC! Thx for serving up Six Degrees of Spicy Bacon to help make #NoKidHungry reality http...	1412037237	516747742966992896	f	sweetchilinyc
RT @HudsonRiverPark: Sustainable seafood,grilled cheese &amp; fresh juices?Going 2 be 1 tasty science fest! @lukeslobster @gcnyc1 @juicepirate ...	1412039967	516759190728347648	f	gcnyc1
@cookindineout and we love you back! You can catch us for lunch tomorrow in #dumbo on water st &amp; jay st #dumbolot 11:30-2:30	1412039247	516756173459316736	f	kimchitruck
RT @foodguruchannel: @cookindineout  @KimchiTruck uses lots of @MarukanVinegar  http://t.co/soxTvUPS5n #Foodiechats	1412039187	516755923340386304	f	kimchitruck
LUNCH SPECIALS: 11AM-2PM\n\nTHAI SALAD   9\nMesclun, Cilantro, Carrots &amp; Celery, Peppers, Ginger, Cabbage,\nPeanut... http://t.co/a8QtIldcSJ	1412065597	516866693839486976	f	thegreenradish1
47th and Park from 11:15am to 2:30pm !!	1412066274	516869534511538176	f	vspot_truck
#South #Street #Seaport #India's #best #curries #spice up your #day with the #Curry #King	1412071839	516892873988378624	f	mausamnyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIyYdw	1412076907	516914132797227008	f	sweeterynyc
Tuscan Lentil Soup is On! 47park/lex @midtownlunch @TODAYshow @WellandGoodNYC @305Fitness @DharmaYogaNYC #plantbased http://t.co/Pj3PI7Uksw	1412077475	516916513568464896	f	thegreenradish1
51st still closed, Today 47btwn Park&amp;Lexington @midtownlunch @nycfoodtruck @Brendan_Brazier @rickygervais @Oprah @biz http://t.co/zvFytzcnzp	1412077165	516915216094093315	f	thegreenradish1
#PieTruck is @StarrettLehigh - 26th St &amp; 11th Ave, NY NY. Savory pies, sweet pies, flat whites 11am to 2.30pm	1412078096	516919120689135616	f	dubpies
Taim, one of New York's top ten homegrown restaurants: http://t.co/5XbDtS7j6k	1412079273	516924054956437504	f	taimmobile
RT @Vidhu205: @dubpies @starrettlehigh Kaloo kalay we'll dine today! Like kings.	1412078521	516920902676905984	f	dubpies
RT @jasbral: @TaimMobile got lunch for four people @ my office today from the truck. They all loved it	1412079444	516924771121238016	f	taimmobile
RT @BarBolonat: At Bar Bolonat and @balaboostanyc &amp; @taimmobile admony serves up more than just amazing food, she's an... http://t.co/w9W98X3...	1412079435	516924734609829888	f	taimmobile
#NYC #Best #Vegan #City @WellandGoodNYC @Brendan_Brazier @CandleCafe @SteveWynn_ @devilgourmet @biz @Tweat_It @Oprah http://t.co/gJ1tgBmsge	1412080151	516927739715416064	f	thegreenradish1
Good Morning #NYC! We are #midtown and #downtown today. Get ready for location updates.	1412081011	516931346393214976	f	hibachiheaven
RT @Vol_Football: Are you wearing ORANGE or WHITE? \n#CheckerNeyland\nhttp://t.co/JBFxUP3zgv http://t.co/fQQt76dj84	1412080304	516928378633723904	f	usafoodtruck
@MSBC06 Kale Yeah!	1412080928	516930997305479169	f	thegreenradish1
TWO TRUCKS OUT TODAY! \n9:00-3:00\n\n38th/Broadway\n\nWater/Gouvernour Ln. \n\nChocolate ganache stuffed Smores... http://t.co/GwjrpuK13D	1412081867	516934934146347009	f	veganlunchtruck
#preview RT @HashtagSCBE: @hibachiheaven yum yum sauce and ginger soy sauce used in our #MeatlessMonday meal. http://t.co/HQdY2ecn1L	1412081446	516933171070644224	f	hibachiheaven
Can't wait to reveal @hashtagSCBE's #MeatlessMonday #hibachiheavenNYC meal remake!	1412081365	516932831629832193	f	hibachiheaven
RT @Foodtruckgirl7: Passing @DeliNDogzTruck @hibachiheaven @bobjoTruck &amp; @fritesnmeats @ old slip / Hanover just makes me want lunch now #n...	1412081306	516932580755910656	f	hibachiheaven
RT @steveorefreshed: @hibachiheaven  is gonna be playing sets from @TomorrowWorld all day long with chef Steveo Reno in da house!.......	1412081302	516932567191552000	f	hibachiheaven
#downtown we are on Old Slip &amp; Water! #hibachiheavenNYC	1412081294	516932532785672193	f	hibachiheaven
#midtown we are prepping to serve you lunch on 47th &amp; Park! #hibachiheavenNYC	1412081245	516932327260553216	f	hibachiheaven
If you have a passion for healthy eats, blogging, and creative cooking follow our friends @hashtagSCBE #foodbloggers #hibachiheavenNYC	1412082161	516936168941060096	f	hibachiheaven
RT @dumbolot: Happy Tuesday! @SweetChiliNYC @carlssteaks and @KimchiTruck in the lot today	1412082296	516936734979141632	f	carlssteaks
#mooshugrill on 52nd &amp; 6th, come n get it!	1412082655	516938241321472000	f	mooshugrill
RT @dumbolot: Happy Tuesday! @SweetChiliNYC @carlssteaks and @KimchiTruck in the lot today	1412082841	516939019863986176	f	sweetchilinyc
RT @dumbolot: Happy Tuesday! @SweetChiliNYC @carlssteaks and @KimchiTruck in the lot today	1412082415	516937234067763200	f	kimchitruck
Getting steamy on 53rs &amp; Park! #porkbuns #dumplings #zhongzi	1412082821	516938935088738304	f	biandangnyc
Big D's Grub Truck is out catering a private luncheon. Call 646-543-BIGD to book us for any type of event!!	1412083457	516941602947072000	f	bigdsgrub
It's THAT time of week folks! Check out your Khao Cart lunch options!! 50th Street btwn 6th and 7th Avenue http://t.co/tJJvlwK3wm	1412083304	516940961889648640	f	bigdsgrub
Varick &amp; Charlton St today - oh yeah! @HudsonSquareNYC #VeggieCombo #Pierogi @weworkny	1412083356	516941181528600577	f	polishcuisine
Catch yourself a Domo Taco on 46th &amp; 6th today! Or at our #UrbanSpaceGarment booth on 39th &amp; Broadway for 2 more weeks!	1412082934	516939411557453824	f	domotaco
Bessie's at a private gig today feeding the good people at @MMAglobal #SM2Innovation. Sandwich menu always @houstonhallnyc	1412083813	516943098350292992	f	milktrucknyc
@Schultzzzzz @Rob32Smith we have been coming to 38th/Broadway every Tuesday for a little while. New weekly location! Spread the word	1412084539	516946141569892352	f	veganlunchtruck
RT @CultureTrip: New York's 10 Best Food Trucks http://t.co/VlSNuwblrY ft. @KorillaBBQ @souvlakitruck @VeganLunchTruck @biandangnyc http://...	1412084418	516945634541449216	f	veganlunchtruck
Guess what's back on the menu?!? #Vegan pumpkin kibbeh!! Order the deliciousness today on 46th btwn 5th &amp; 6th! http://t.co/9HKyyDWAOF	1412084924	516947758746705920	f	toumnyc
Lunch 2day @ 10 Hanover sq b/t water &amp; pearl st. Burger of the week THE GUACAMOLE BLAST. Preorder 9172929226 #fidi	1412085504	516950190545440768	f	fritesnmeats
RT @Valduccis: @PolishCuisine  Yummmmm http://t.co/1SniGRaB5J	1412191888	517396395415060480	f	polishcuisine
It's Tuesday and that means one thing...EMPANADAS! The truck is located on the corner of Pearl St &amp; Coenties Slip... http://t.co/p12oluWi7Q	1412085197	516948901878693888	f	nuchasnyc
@Under_aRmur yes we will be there:)	1412085993	516952241467826176	f	fritesnmeats
RT @Foodtruckgirl7: Passing @DeliNDogzTruck @hibachiheaven @bobjoTruck &amp; @fritesnmeats @ old slip / Hanover just makes me want lunch now #n...	1412085969	516952142402551808	f	fritesnmeats
@Foodtruckgirl7 no soup today:( but we have burgers:)	1412085961	516952105878585344	f	fritesnmeats
@where2datenyc yes yes. Do this thing.	1412087152	516957102934597632	f	waffletruck
@Carbonfilament we may try again someday, but right now our Sunday's full up.	1412087080	516956799938097152	f	waffletruck
@TDNamad very strange. We'll look into it.	1412086974	516956354452680704	f	waffletruck
@umequivocal @CultureTrip we sure think so.	1412086876	516955945315098624	f	waffletruck
We'd like to Congratulate the Bride and Groom! Contact us today to bring the Snowday team to your next fun event! \nhttp://t.co/D4TH3VLwls	1412086854	516955853069762560	f	snowdaytruck
Hi we parked on 47th.street bet Park &amp; Lexington Ave till 2:30pm we serving Hungarian goulash soup,stuffed cabbage and beef stew. Thanks	1412086778	516955535032467456	f	langostruck
Location 48th bet 6 ave 7 ave.. \n\nCall in orders to: 917-756-4145	1412086607	516954815403151360	f	disosnyc
Today we back in midtown. Come Get a panino and taste our delicious complimentary salad! #pontirossiNYC  http://t.co/zA7gdWJGft	1412087532	516958696816279552	f	pontirossifood
G1- Hudson / King\nG2-47/Park\n#ComeToTheCheeseYo	1412087511	516958608983334912	f	gcnyc1
Our Cajun Fish Tacos are a new fixture to the menu - learn them and win at #TacoTuesday: http://t.co/o3krI1ecjx	1412087764	516959670746226689	f	mexicue
I posted a new photo to Facebook http://t.co/HdMHSloJnR	1412088225	516961603619946496	f	polishcuisine
RT @s_koleda: Only good thing about working in Times Square is picking up @DomoTaco after work. Braised 5 spice pork bowl #bomb http://t.co...	1412088135	516961226937876480	f	domotaco
Back to midtown after our short hiatus.    On 50th st between 6 / 7 ave #midtown http://t.co/lEpmZgfhk8	1412087820	516959903442030592	f	funbunsnyc
Hot Dogs, Hot Curly Fries, Cold Tropical Drinks, Broadway at 58th St. 11am - 4pm	1412087719	516959480127315968	f	papayakingtruck
There's no truck today but there is #RedHookLobster and options! We're at 40th &amp; B'way and 25th &amp; B'way!	1412088642	516963353953333249	f	lobstertruckny
@oftenimprudent hi yes we will be there on Thursday night from 4-9pm thank you 30th.ave and 31street	1412088500	516962758450245633	f	langostruck
Seaport today! Front and Fulton - open at noon. Come thru!	1412089196	516965675232161794	f	philssteaks
I posted a new photo to Facebook http://t.co/TUoTUB9e3C	1412088971	516964732809805825	f	polishcuisine
I posted a new photo to Facebook http://t.co/hy1rwxFxuG	1412088813	516964069459636225	f	polishcuisine
I posted a new photo to Facebook http://t.co/fE4lXFTZ42	1412088647	516963371481300992	f	polishcuisine
I posted a new photo to Facebook http://t.co/2mVLMPdci6	1412088575	516963069734715393	f	polishcuisine
The SchnitzCart will be on greenwich &amp; park place from 11:30-2:30pm. Hope to see you for lunch:)	1412089961	516968885753741312	f	schnitznthings
Morning guys. The truck is on 52nd b/w 6th &amp; 7th from 11:30-2:30pm. Nice cool day for schnitz! Would love to c ya! Preorder 347-772-7341	1412089897	516968616995328000	f	schnitznthings
Open and Ready to Roll on Varick &amp; Charlton today #HudsonSquareNYC	1412089494	516966926451744768	f	polishcuisine
Last day to support @nokidhungry so come out to @dumbolot till 3! Big thanks to @kevinbacon for supporting us @TheFollowingFOX set yesterday	1412089654	516967597196443648	f	sweetchilinyc
RT @luckypenny: ==&gt; RT @SweetChiliNYC: What a great time @TheFollowingFOX with @kevinbacon @nokidhungry thanks for having us! http://t.co/C...	1412089495	516966928326610945	f	sweetchilinyc
Forewarning 2 our folks in #dumbo there is a lot of construction around today, but dont let that deter you! 11:30-2:30 #dumbolot water st	1412090011	516969095729008640	f	kimchitruck
On 50th between 6 and 7 avenues	1412090990	516973198546833408	f	thepocketful
@nycfoodtruck @FoodtoEat @midtownlunch swing by to your loving food truck @ 46th st &amp; 5~6th ave, come &amp; get some Asian Tapas. 11~3pm.	1412090458	516970968770957312	f	shanghaisogo
We will be at our locations until about 3. Come say Hi and pick up your fave #hibachiheavenNYC dish!	1412090464	516970994062589952	f	hibachiheaven
We are now open and serving lunch in #midtown &amp; #downtown 47th&amp; Park / Old Slip&amp; Water #hibachiheavenNYC	1412090401	516970729901142016	f	hibachiheaven
RT @HashtagSCBE: We must say that @hibachiheaven knows what they're doing over there. The sauces we used helped us make an incredible #Meat...	1412090332	516970439084871682	f	hibachiheaven
71st and York we are back. Place your orders.	1412090204	516969902142656512	f	mrniceguytruck
Hello NYC we r open @hanover sq and water st. Try our rice bowl and rice burger bibimbap burrito !! Plz stop by and enjoy thank you!!!	1412090977	516973147648970752	f	bobjotruck
Come join us for Lunch today! We are at 116th &amp; Broadway	1412090300	516970307836706816	f	neaexpress
RT @DineOutNKH: @SweetChiliNYC and thank YOU for being @nokidhungry rockstars!	1412090853	516972624782827521	f	sweetchilinyc
Hi Midtown!join us for a healthy salad bowls choose your toppings flank steak Cajun chicken,chorizo or garden.don't forget it's taco Tuesday	1412090936	516972974008975360	f	etravaganza
@tinybop Aww!	1412090286	516970245559689216	f	thesteelcart
56th &amp; Broadway is always on the way. Serving through lunch, Split Pea is in.	1412090132	516969600991653888	f	thesteelcart
We are on 36st and Broadway!	1412090565	516971415694999553	f	chefsamirtruck
We have new items on the menu! !\nTry our chicken and beef shawarma 12"multigrain wrap	1412090372	516970610199891968	f	chefsamirtruck
Good Tuesday Mtbll  lovers the train will be taking the day off to regroup we will see you all tomorrow have a great day. 	1412091682	516976100627337216	f	mtblls
Buenos Dias! We are at 46th btw. 6th &amp; 7th Ave #HaveAGreatDay #tuesdaytaco #tacosinmymouth	1412092185	516978210673016832	f	mexicoblvd
Now that's how a great liaison networks! Big thanks to @jasiri_x for giving us Green Room &amp; VIP access! http://t.co/XHBtshLjNt @thenewschool	1412092078	516977761878294528	f	snowdaytruck
RT @jzohny: You guys, it's almost lunchtime ... MT @PontiRossiFood: Today we're back in midtown! http://t.co/VK9dp19hwe	1412092643	516980132125614080	f	pontirossifood
OFF THE ROAD TODAY - Find us at Tech Week later this week, details to follow! http://t.co/o3ne0LbcJv	1412092264	516978544745144320	f	andysitalianice
Taking a few days off the road as we plan for catering expansion. Want us to cater for your company or event?? http://t.co/9XjBfQfStL	1412093580	516984064558243841	f	snowdaytruck
all done for today! see you tomorrow on old slip and water!	1412191820	517396114015027201	f	sweetchilinyc
Tuesday = Brooklyn @dumbolot jay st &amp; water St till 3 30 grab a Carl's famous Cheesesteak &amp; enjoy the park GOT WHIZ?	1412093291	516982852970610688	f	carlssteaks
Tuesday = Brooklyn @dumbolot jay st &amp; water St till 3 30 grab a Carl's famous Cheesesteak &amp; enjoy the park GOT WHIZ? http://t.co/1f4LPmaqgE	1412093200	516982470039072768	f	carlssteaks
Here for a fresh kimchi bowl? Why not top it off with a sriracha fries from @sweetchilinyc $1 goes to #nokidhungry	1412093009	516981670118162432	f	kimchitruck
RT @huangkuan: @shanghaisogo are you coming to Chelsea sometime soon?	1412093810	516985026429607936	f	shanghaisogo
@endlesssammer yay!  hope you love everything lots and lots	1412094547	516988117484851200	f	veganlunchtruck
RT @Ahlexandria: @DJLaser if you're in the city go to @hibachiheaven . They're healthy and make some damn good food.	1412094607	516988369298259968	f	hibachiheaven
@GoogleLocalNYC we'd love to come serve lunch to your staff &amp; tell you a bit about our work #turnredlightsgreen #foodtrucksforsocialjustice	1412093933	516985544476475392	f	snowdaytruck
Sorry guys! Trucks are out in the shop! We'll be back on Thursday for lunch!	1412094495	516987903046856704	f	korillabbq
Our #chef @hibachijoe knows how to set up nicely on the grill! #hibachiheavenNYC http://t.co/xm7vADYDLh	1412095391	516991657670348800	f	hibachiheaven
If you are #vegan or #vegetarian we have alternative options like our grilled #tofu #healthyeats #hibachiheavenNYC http://t.co/jbHLZMP64s	1412095120	516990524101001216	f	hibachiheaven
@DJLaser come by for some #hibachiheavenNYC!	1412094641	516988515432034305	f	hibachiheaven
RT @34thStNYC: Take a yummy stroll to Greeley Sq: RT @nuchasnyc: Happy #NationalCoffeeDay friends! Celebrate with empanadas&amp;coffee! http://...	1412095263	516991121491505152	f	nuchasnyc
Pic by @bg03tz tuesdays: 47th between lex and park for lunch until 3p http://t.co/ohGxKyWH9D	1412096217	516995124954673153	f	eddiespizzany
Pic by bg03tz tuesdays: 47th between lex and park for lunch until 3p http://t.co/IutHjqV9t0	1412096215	516995115823673344	f	eddiespizzany
No line up at the moment! Wont last for long! #dumbo water st @ jay st were here until 2:30 #nyfoodtrucks #dumbolot	1412096315	516995536902447105	f	kimchitruck
@matthue peace to you my fellow Hebrew . Please kill no one kill some donuts instead 	1412097902	517002192122019840	f	veganlunchtruck
@OpenSociety let us pull up outside for lunch &amp; explain a bit more about what we do! #turnredlightsgreen #foodtrucksforsocialjustice	1412098282	517003785504583680	f	snowdaytruck
Happy Taim Tuesday! Try our famous traditional green falafel today on 20th/5th and our Harissa tomorrow	1412099513	517008947002478592	f	taimmobile
@tmelmoore just like Simba, all of this can be yours	1412099982	517010915410313218	f	mexicue
Grey skies, we've got you beat http://t.co/sqWdNUSaj4	1412099607	517009340566634496	f	mexicue
RT @JennyMainard: Nice visit from @SweetChiliNYC to the set of @TheFollowingFOX some  proceeds to @NoKidHungry  http://t.co/c0VttAFoNB	1412099861	517010407840833537	f	sweetchilinyc
RT @EyeSave: Who cares if it's #gloomy outside? No one, not today- Not on our fave @SweetChiliNYC Sriracha Fries Day! #NoKidHungry http://t...	1412099818	517010227640926208	f	sweetchilinyc
Whos ready for a Food Truck Rally? Join us on Sunday, October 5th at Grand Army Plaza from 11am - 5pm! http://t.co/SfInaSKowy	1412100002	517010997631254528	f	nuchasnyc
RT @caryn_aych: PIE-rogi...it's #PIEROGI-time!  Thanks for the fantastic traditional fare, @PolishCuisine	1412101488	517017233835720704	f	polishcuisine
@iamevie: @bigdsgrub Please save me a serving of the Vietnamese Chicken! :) did ya get it?	1412103134	517024137005793281	f	bigdsgrub
RT @PopMathobela: Five simple rules for happiness http://t.co/nRLNsbaHww	1412103274	517024723994431488	f	valduccis
Afternoon snack? #coffee #wafel #dinges http://t.co/mBQaz7fj4B	1412104299	517029023294447618	f	waffletruck
thanks for coming everyone!	1412103726	517026620851638274	f	polishcuisine
RT @nycfoodtruck: ATTN. NYCFTA Members: Don't forget to answer the 3-minute survey about #tickets in last week's newsletter! @UncleGussys @...	1412104012	517027819025879040	f	valduccis
Help NYC (and us) take home the #GrilledCheeseTruckoftheYear award! http://t.co/U6zW58osF6 #Itonlytakesasecond	1412105101	517032386178326528	f	morristruck
@nickrutherford Great to meet you man! Say hi to @becbenit &amp; @kylemooney for us! #GoodNeighborStuff #SNL	1412105012	517032011438231552	f	morristruck
@batgrrlnyc yikes.  I promise we aren't trying to kill you.   it's hard to find ones that don't destroy the environment that are strong	1412104635	517030432186322944	f	veganlunchtruck
@iamevie: @bigdsgrub Yep!! 	1412106335	517037562796716033	f	bigdsgrub
All done for today! We are @theseaport tomorrow 12-3 come grab lunch with us! #thaietnamese #humpday	1412105427	517033755148824576	f	sweetchilinyc
RT @maria_romano: Creme brulee donuts are back at @VeganLunchTruck ! S'mores donut and peanut butter brownie for good measure http://t.co/P...	1412106502	517038263060951041	f	veganlunchtruck
Remember:\n\nSERVING MIDTOWN EAST TOMORROW (47th/park or near by) &amp; MIDTOWN WEST ON FRIDAY (55th/Broadway or near by)!	1412108064	517044813741314048	f	veganlunchtruck
Hoboken!! Tomorrow is it! $5 off any order 15$+ at Pier 13 from 5-9pm! Luke's Lobster is turning 5, and we chose to celebrate it with you!	1412108052	517044761593909248	f	nautimobile
Bunch of changes to this weeks schedule! Details at : http://t.co/BBujx1BHxf	1412107976	517044445611835392	f	nautimobile
@Leah_Hammerswag thank you! You're bomb 	1412108055	517044775141523458	f	mexicue
Broadway at 65th St down the way from @LincolnCenter serving at 5PM Hot Dogs, Hamburgers, Steak Sandwiches, Curly Fries, Fried Oreos	1412109929	517052636659716096	f	papayakingtruck
RT @nokidhungry: @EyeSave Way to "focus" on the positive! The Sriracha Fries from our friends @SweetChiliNYC are definitely a bright spot! ...	1412111561	517059482225229826	f	sweetchilinyc
Want a free ride to lunch at the Snail? \n\nUse the code SNAILY for $25 credit on your first @lyft ride to us.	1412112161	517061999826841602	f	veganlunchtruck
RT @ShortysTrivia: This month we're just playing for straight Shorty's Bucks. The more teams that play, the more cash we give away! @shorty...	1412111844	517060669741760512	f	shortysnyc
@katelikestoread sorry about the late response but we take cc's.	1412116158	517078760743763968	f	domotaco
FALL MENU DROPS TOMORROW IN MIDTOWN EAST! \n(at or close to 47th/park)\n\n&lt;3 Fresh fig pancakes with chamomile blood... http://t.co/4ig275DC2A	1412116975	517082188534546433	f	veganlunchtruck
When #TacoTuesday tacos grow up, they want to be the Jamburrito http://t.co/nVkOjx4Ms7	1412116317	517079427956899840	f	mexicue
Goesting @ Bway &amp; 66th till 9pm\n\nNight night!! #dinges http://t.co/4UIVEhNlgo	1412118578	517088913408933888	f	waffletruck
Kotmadam @ Bway &amp; 17th till 8pm\nBierbeek @ great lawn in Central Park till 8pm\nPagadder @ Brooklyn bridge till 9pm	1412118567	517088866214612992	f	waffletruck
TRUCKS\nMomma truck @ Columbia Univeristy till 10pm\nKastaar @ Brooklyn College till 10pm\n\nCARTS\nVedette @ 60th &amp; 5th till 8pm	1412118561	517088840058961921	f	waffletruck
Wafels @ night!!\n\nLe cafe @ 15 Ave B till 11pm\nDe Wafel Cabana @ 35th &amp; Bway open till 10pm	1412118554	517088813769056256	f	waffletruck
Here is @HashtagSCBE's official #hibachiheavenNYC #MeatlessMonday meal remake! http://t.co/6xiEIdTi6D #SCBE http://t.co/d0HVcsBtQH	1412119531	517092911331430401	f	hibachiheaven
RT @Ahlexandria: Go check out what @hibachiheaven is about. I promise you that you won't be disappointed. http://t.co/RUB801YpLj #SCBE http...	1412119393	517092331057852416	f	hibachiheaven
RT @HashtagSCBE: Also thank you to our taste testers @LinzyPiinzy and @CorySlump cc: @hibachiheaven http://t.co/ORm28fcV39 http://t.co/Uusm...	1412119389	517092312225435648	f	hibachiheaven
RT @HashtagSCBE: Thank you @CG_DigitalMedia and @HibachiJoe with @hibachiheaven for sending us the sauces for this post http://t.co/ORm28fc...	1412119382	517092284513673217	f	hibachiheaven
RT @HashtagSCBE: If you're in NYC we suggest going to try out @hibachiheaven with @HibachiJoe . See why on http://t.co/Ernyn1NQOJ http://t....	1412119376	517092258534129664	f	hibachiheaven
RT @HashtagSCBE: Our #MeatlessMonday With @hibachiheaven is up now on http://t.co/6xiEIdTi6D #SCBE http://t.co/d0HVcsBtQH	1412119339	517092103571406848	f	hibachiheaven
We'll randomly select a winner upon reaching 4250 followers to receive 24 pies - anywhere in the US! Be in to win, RT?	1412120356	517096369409241088	f	dubpies
RT @austca: @livelaughingman @dubpies Pls help plant 200,000 rainforest trees in Sumatra &amp; save Critically Endangered Orangutan. $2/tree!	1412120289	517096088713830400	f	dubpies
RT @HashtagSCBE: #MeatlessMonday With @HibachiHeaven http://t.co/zZkL39go1g on @bloglovin	1412120693	517097783061643264	f	hibachiheaven
@Ahlexandria @_____unkwn HUGE thanks on behalf of Hibachi Heaven &amp; @HibachiJoe. We truly appreciate this.	1412120408	517096587093635072	f	hibachiheaven
RT @camGarcia__: I'm so excited for how the @HashtagSCBE &amp; @hibachiheaven collab. came out. Wish I could've been there to try out!	1412120348	517096337809371136	f	hibachiheaven
@HashtagSCBE @LinzyPiinzy @CorySlump Thank You for trying out our sauces, can't wait for you to try out our food!	1412120075	517095190574931969	f	hibachiheaven
#hibachiheavenNYC's famous sauces were featured on @HashtagSCBE on #SCBE's #meatlessmonday post! http://t.co/suHj9Y60x0 #NYC #foodbloggers	1412119994	517094851918446592	f	hibachiheaven
@davidwhogg you're not the only one, we can assure you! :-(	1412123060	517107712032010241	f	dubpies
RT @AlphaTutorsLTD: Lions cannot roar until they reach the age of two.	1412121894	517102820945068032	f	valduccis
.@HudsonYardsNY @DriveChangeNYC @TimesLedger we're back in front of the @thefortunesoc tomorrow - come check us out!	1412129859	517136227825643520	f	snowdaytruck
@sharon_wv we do try to be big and yellow for you though.	1412135957	517161806557892608	f	waffletruck
@kylejernigan @iPullRank @mattcutts come get us!	1412135931	517161696960741376	f	waffletruck
@DashingRyan @UrbanSpaceNYC what a good idea!	1412135880	517161483730694144	f	waffletruck
RT @NYMagDeals: Pay $25 for two savory waffles, two drinks &amp; more at the @waffletruck East Village location: http://t.co/Z2EzHyEunq http://...	1412135868	517161433566810112	f	waffletruck
@matthue my pleasure.  Glad you loved em.  	1412137418	517167933634936833	f	veganlunchtruck
@keithbacker just a heads up that we wont be there today :)  hope to see you next week!	1412160811	517266052318003200	f	kimchitruck
Eat Quinoa! Here's why...http://t.co/XhM9Vx7ynd @GarmentDstrctNY @WellandGoodNYC @Brendan_Brazier @midtownlunch @LILBUCKDALEGEND @BuzzFeed	1412161122	517267354351566849	f	thegreenradish1
The SchnitzCart will be on 27th &amp; park 11:30/2:30pm. Hope to see you for lunch:) schnitz slingin will happen	1412161442	517268696759558144	f	schnitznthings
Morning guys! The truck will be on 47th b/w park &amp; lex for lunch! 11:30/2:30pm. Stop by for lunch! Preorder 347-772-7341. C ya	1412161318	517268178960121856	f	schnitznthings
@keithbacker I often count kimchi tacos to help fall asleep ;) Ev is good-catering a prvt event 2day. Next wed ur side of kimchi is on Sara!	1412161720	517269861358374912	f	kimchitruck
Open @ 23rd and Park!	1412162426	517272822755106816	f	carpedonutnyc
EatToLive LentilSoup,ThaiSalad,QuinoaBowl,Apple-Cinn #Donarts 38&amp;Bwy  @GarmentDstrctNY @mashable @TimeOutNewYork @simonsam @johnleesandiego	1412162817	517274462870593537	f	thegreenradish1
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIyYdw	1412163310	517276532830515200	f	sweeterynyc
Dearest #midtown, we wont be out for #midtownlunch today because were catering a private event. Catch you next Wednesday! Love, KTT	1412164508	517281557498056704	f	kimchitruck
#PieTruck is having preventive maintenance work done to the generator today - hoping to be back on Bedford Ave tonight!	1412165114	517284100236140544	f	dubpies
Parked on 55th btwn 6th/7th 9:00-3:00\n\nNEW FALL MENU TODAY &amp; WE HAVE HOT CHUNKY BORSCHT!\n\n(Sorry 47th peeps, couldn't park in midtown east)	1412166320	517289155718840320	f	veganlunchtruck
@christheclown2 not today. we are still training staff so we can get both trucks out all the time.	1412166160	517288485083156480	f	veganlunchtruck
RT @luckypenny: Thanks #TopNewFollowers @JoeAmiel @SweetChiliNYC @Michael4Biz @NuValTexas @KeithBogen happy to connect :) (via http://t.co/...	1412167345	517293457548013568	f	sweetchilinyc
Visit us on 10/5 @StoneBarns #HFest14 celebration + fundraiser! Hands-on farm + food, activities, music + more: http://t.co/W4lLojcrkt	1412167596	517294507210338304	f	morristruck
It's #MidtownWestWednesday!!\nBig D's Grub Truck - 52nd Street btwn 6th and 7th Avenue\n\nThe Khao Cart - 50th Street btwn 6th and 7th Avenue	1412169260	517301486783848448	f	bigdsgrub
#best pizza #seaport @greenboxny @FoodtoEat @FoodNetwork @foodNfest http://t.co/S4QHGc3uVu	1412168560	517298552855625728	f	valduccis
@MexicoBlvd: Hola Midtonianos! Location change (today only)! We are at 46th btw 6th &amp; 7th Ave #HaveAGreatDay #tuesdaytaco #tacosinmymouth	1412170189	517305384609255424	f	mexicoblvd
Bessie's at 53rd &amp; Mad, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always @houstonhallnyc	1412170206	517305456570540032	f	milktrucknyc
It's #MidtownWestWednesday!!\nThe Khao Cart - 50th Street btwn 6th and 7th Avenue	1412171024	517308885473185792	f	bigdsgrub
It's #MidtownWestWednesday!!\nBig D's Grub Truck - 52nd Street btwn 6th and 7th Avenue	1412170989	517308742061158402	f	bigdsgrub
We will be in dumbo today everyone. On fronts and Adams at 12pm  @DUMBOFoodTrucks	1412171029	517308908877389824	f	parissandwich
RT @BCDRestaurants: It's National Kale day! Get your #Kale and #Quinoa bowl from our client @Mexicue! #BCDStrategic	1412170522	517306779752214530	f	mexicue
Rainy day surprise on 45th &amp; 6th! Come check out the new salad items in our #ricebowls!	1412170932	517308499295236097	f	mooshugrill
Catering the sad cloud convention on Front &amp; Jay. Soups are Navy Bean &amp; Kale / Split Pea &amp; Ham. @DUMBOFoodTrucks	1412170616	517307176051023872	f	thesteelcart
Parked on water st and old slip/ Hanover sq. \n\nCall in orders to: 917-756-4145	1412170575	517307005477081088	f	disosnyc
#FoodTruck #Wednesday #Overpeck #Park #Leonia #NJ #spice up the #day with #Curry #King our #curries is ur #sunshine #today	1412171810	517312182418038785	f	mausamnyc
It's gloomy outside but that doesn't mean you shouldn't have a tasty lunch &amp; dinner! Join us on John &amp; Front St near @TheSeaport from 11-8pm	1412171649	517311507596845056	f	toumnyc
@NewYorkRoses @MWWGroup glad y'all enjoyed!	1412171689	517311677571010560	f	mexicue
Warm yourself with a piping hot Di Parma freshly made to order at W116th &amp; Broadway today until 4PM.	1412171857	517312379831734272	f	neaexpress
Don't be a wet #burrito! Join the fun at the @dumbolot or at #UrbanSpaceGarment on 39th &amp; Broadway today!	1412171264	517309893535993857	f	domotaco
Get your midweek Taiwanese fix on 53rd &amp; Park today!	1412171339	517310208931278848	f	biandangnyc
It's chewing gum day!! What's your favorite flavor? Tell us for one free #dinges! #chewinggum #freedinges	1412172607	517315528025985024	f	waffletruck
Goesting @ Bway &amp; 66th till 9pm\n\nGet your #dinges!! http://t.co/9ud8ahfuvp	1412172194	517313793249263616	f	waffletruck
Kotmadam @ Bway &amp; 17th till 8pm\nBierbeek @ great lawn in Central Park till 8pm\nPagadder @ Brooklyn bridge till 9pm	1412172124	517313499236945920	f	waffletruck
TRUCKS\nMomma truck @ Wall Street till 4:30pm\nKastaar @ Queens College till 10pm\n\nCARTS\nVedette @ 60th &amp; 5th till 8pm	1412172082	517313325622116352	f	waffletruck
Wafelicious Wednesday!\n\nLe cafe @ 15 Ave B till 11pm\nDe Wafel Cabana @ 35th &amp; Bway open till 10pm	1412172068	517313264053944321	f	waffletruck
@MexicoBlvd: @MexicoBlvd: Hola Midtonianos! Location change (today only)! We are at 46th btw 6th &amp; 7th Ave #HaveAGreatDay #tacosinmymouth	1412172894	517316728691638272	f	mexicoblvd
@CornelWest it was an honor &amp; privilege for you meet our team! We will never forget being called the truck of justice http://t.co/oKTlegyp6g	1412172118	517313475648188416	f	snowdaytruck
Lunch 2day @ Hudson &amp; king. Burger of the week THE GUACAMOLE BLAST. Preorder 9172929226 #soho	1412172112	517313452277522432	f	fritesnmeats
Happy  Day Mtbll Lovers!  The  will be stopping at 47th bet Madison &amp; Park today. A little detour to serve our... http://t.co/BE1WWr73RI	1412172073	517313285625229312	f	mtblls
Good morning South St. Seaport. John St. &amp; Front st. Today.	1412172687	517315863591276544	f	mactruckny
Located on 53rd, between Park and Madison.	1412173162	517317856539983872	f	thepocketful
Who's in Long Island City today? If so make sure to stop by the Fortune building we'll be serving lunch from 11-4! http://t.co/KmKqFK8QS1	1412173001	517317180573376512	f	snowdaytruck
Rainy Wendesday Langos Truck at Water street and Old Slip (downtown)till 2:30pm	1412173262	517318274498174976	f	langostruck
@chashomans strange... since our power for our speakers are out. #riddles #puzzles	1412173768	517320398099451904	f	domotaco
@leslie_gambetta occasionally. We may be down by the seaport soon	1412173537	517319428044648448	f	papayakingtruck
It's #Humpday! We suggest you spend it with us ;) The truck is located on Varick St between Charlton &amp; King St... http://t.co/hAAPnsC8c6	1412173364	517318703835148288	f	nuchasnyc
We will also be on 33rd &amp; Park today #midtown	1412174674	517324196180140033	f	hibachiheaven
Follow on IG &amp; Twitter for more creative&amp; healthy Recipes RT @HashtagSCBE: Thank you once again @hibachiheaven http://t.co/BLa3g2d3df	1412174335	517322776315973632	f	hibachiheaven
RT @CG_DigitalMedia: #foodlovers check out @hashtagSCBE's post featuring #NYC's own #foodtruck @hibachiheaven meal remake http://t.co/Sput1...	1412174276	517322525756649472	f	hibachiheaven
RT @HashtagSCBE: Have you gotten your morning fix of http://t.co/Ernyn1NQOJ with a side of coffee? Read and see the #NYC food truck @hibach...	1412174264	517322475487911936	f	hibachiheaven
#hibachiheavenNYC's ginger soy &amp; Yum Yum sauce were featured in @hashtagSCBE's #foodblog -So delightful! Take a Look: http://t.co/ccfN4dqc6F	1412174255	517322440054427649	f	hibachiheaven
In the mean time: check out this delicious #hibachiheavenNYC meal remake! http://t.co/ccfN4dqc6F @hashtagSCBE http://t.co/frf67rZlyo	1412174140	517321955419377664	f	hibachiheaven
#Staytuned for more location updates.	1412173967	517321232568836096	f	hibachiheaven
Good Morning #NYC come join us #midtown on 46th / 6th for some lunch today!	1412173907	517320980826714112	f	hibachiheaven
Sorry folks looks like a spa day for the trucks today we will be back @TheSeaport tomorrow stay positive!! GOT WHIZ?	1412173872	517320832931336192	f	carlssteaks
Park ave south we are here! Surprise visit to Park between 24/25 today. 1130-2 come get your Phil!	1412174416	517323114070683649	f	philssteaks
I posted a new photo to Facebook http://t.co/poKYKZFQcW	1412174709	517324343941279745	f	polishcuisine
I posted a new photo to Facebook http://t.co/HSRUIVLmXj	1412174658	517324130413453312	f	polishcuisine
!!! Wed,Oct 1st 12-3:30 45th &amp; 6th ave, then 4:30-7pm 18th st &amp; 7th ave!!!	1412173898	517320943338008578	f	thetreatstruck
55th &amp; Broadway lunch today @randomfoodtruck and in #Sunnyside #Queens for dinner! @yelpQueens	1412175606	517328106949201920	f	polishcuisine
I posted a new photo to Facebook http://t.co/QyzUU5kzhr	1412174975	517325460167221248	f	polishcuisine
I posted a new photo to Facebook http://t.co/QXr9UZcqpc	1412174936	517325295037472768	f	polishcuisine
I posted a new photo to Facebook http://t.co/zNfh9rHMzY	1412174832	517324860612419585	f	polishcuisine
I posted a new photo to Facebook http://t.co/WBIUlMHTqR	1412174781	517324646317043712	f	polishcuisine
It's #humpday @TheSeaport on John &amp; front till 3! our hot vietnamese coffee is officially back! #thaietnamese #lunchtime #hungry #yum #yay	1412175599	517328077882683392	f	sweetchilinyc
October @spotify playlist ft. @DeLongMusic @KONGOSMUSIC @Kiesza @SeinaboSey http://t.co/FnPTY3FFAN	1412175323	517326919982120960	f	papayakingtruck
Flatiron Falafel day on 20th/5th. It's a French Fries w Saffron Aioli day, treat yourself!	1412176010	517329799610916864	f	taimmobile
WALLSTREET WE ARE HERE! !! WED 10/1 11:30AM-3PM 55 WATER ST ( OLD SLIP ) NYC\nhttp://t.co/MPHGwjSFxE http://t.co/kuy9JJuUJn	1412176455	517331665459638272	f	latinkitchennyc
Open &amp; Serving #Lunch! Meet us on 46/6 &amp; 33/ Park #hibachiheavenNYC #midtown	1412176374	517331326954119169	f	hibachiheaven
RT @Ahlexandria: This is the @HashtagSCBE and @hibachiheaven collab with their yum yum &amp; soy ginger sauce for our #MeatlessMonday . http://...	1412176324	517331118497218561	f	hibachiheaven
RT @_____unkwn: @HashtagSCBE x @hibachiheaven \n\nCheck it out on http://t.co/mPeetn1AAw.	1412176318	517331090533781504	f	hibachiheaven
Open for lunch! Water st. And old slip/ Hanover.\n\nCall in orders for pick up: 917-756-4145	1412175837	517329075023929344	f	disosnyc
Dearest #midtown, we wont be out today because were catering a private event. Catch you next Wednesday! Love, KTT #nyfoodtrucks	1412176820	517333198695829504	f	kimchitruck
#HappyWorldVegetarianDay $4 @YvesVeggie Meatless Dogs on the truck and at St. Marks http://t.co/HkwC6NHcy1	1412176830	517333238311038977	f	papayakingtruck
Try our homemade  chicken shawarma today	1412177201	517334796402696192	f	chefsamirtruck
We are on 52st and park av!	1412177113	517334424627978240	f	chefsamirtruck
Don't Miss LentilSoup wGrilledGarlicBread 38&amp;Bway @GarmentDstrctNY @DharmaYogaNYC @nycfoodtruck @VeganRevoIution @biz http://t.co/ZzTYlIWYyp	1412177012	517334000621199360	f	thegreenradish1
Let's Go Y'all, Quinoa Bowls o'plenty...38&amp;Bway @midtownlunch @EaterWire @WellandGoodNYC @Brendan_Brazier @NYTMetro @thomyorke @LeoDiCaprio	1412176613	517332328134090752	f	thegreenradish1
RT @Ahlexandria: The fact that we aren't in #NYC but got to experience an food truck getting all the rave was incredible. Check out http://...	1412177579	517336380863946752	f	hibachiheaven
We apologize but today we have a technical issue that won't let us feed you guys. We will be back tomorrow. Stay tuned	1412177710	517336928228999168	f	pontirossifood
Hello NYC !! We r ready to serve rice bowl rice burger and bibimbap burrito , veggie dumpling @ 47th st between park and lex ave. thank u!!!	1412177567	517336330641362944	f	bobjotruck
Call it in, we'll have it ready....38&amp;bway 917-512-1599 @GarmentDstrctNY	1412178240	517339153185644544	f	thegreenradish1
Do lunch differently today with SunDried Tomato Basil falafel. On 20th/5th along with Ginger Mint Lemonade and all of our smoothies	1412178860	517341754975338496	f	taimmobile
RT @MichaelTerwindt: @TaimMobile can't beat lunch in this neighborhood. #foodie #flatiron	1412178795	517341482404315138	f	taimmobile
Even if it's raining Palenque it's ready to serve you the most tasty arepas in town! @UrbanSpaceNYC @Broadway between 40th st and 39th st!	1412178982	517342264079945728	f	palenquefood
Ready to lunch...if rain give us a call for express pick up 917-657-0987.	1412178709	517341122449117185	f	etravaganza
RT @NapierinFrame: Connecting Kiwis in the Big Apple http://t.co/fVwxX54jam\nNext @NZStuff should cover "Refueling Kiwis in the Big Apple" w...	1412179770	517345568407191552	f	dubpies
Yay! You found us! RT @spinxy82: @dubpies never knew of this place when I was there, back in a month, can't wait to dig into some good pies.	1412179550	517344648264957952	f	dubpies
Wednesday; 46th between 5th and 6th. Call ahead your order 917 439 7522 http://t.co/rkqUfnYjDh	1412179899	517346111518810112	f	eddiespizzany
Wednesday; 46th between 5th and 6th. Call ahead your order 917 439 7522 http://t.co/9AGcTCwJD1	1412179897	517346104170385408	f	eddiespizzany
If your in the mood for a good read on who we are and what we do check out this great article! Thanks to Bill Parry! http://t.co/o5pQDmd80U	1412179260	517343430394281984	f	snowdaytruck
:)RT @majolapp: Genial el especial del gourmet de @MaximoLopezMay en NYC!!! @schnitznthings  y rice to riches lo mejor!	1412179531	517344568241827840	f	schnitznthings
A burrito is basically a taco that's happy to see you \n\n(Plus rice &amp; other deliciousness) http://t.co/ptzoFpWL0n	1412179919	517346195384320000	f	mexicue
Up and running @DumboLot Jay and Water #Dumbo #Brooklyn #FoodTruck  #Cheesesteak #ChickenCheesesteak #RoastPork #BroccoliRabe #Salads #Fries	1412179397	517344007706251264	f	shortysnyc
Sorry no truck today. :( Getting some TLC.	1412179992	517346499911766016	f	mamuthainoodle
Tacos, tacos @MexicoBlvd today we are on 46 St. btw 6&amp;7 Ave	1412180565	517348903667400705	f	mexicoblvd
The rain stopped, LET'S GOOO!!\nBig D's Grub Truck - 52nd Street btwn 6th and 7th Avenue\n\nThe Khao Cart - 50th Street btwn 6th and 7th Avenue	1412180196	517347357974077440	f	bigdsgrub
No lunch today, but find us @DowntownBklyn #Metrotech and #Midtown tomorrow! And #cheesethevote while you're here! http://t.co/AejmzUFK5s	1412181731	517353795584417793	f	morristruck
@holyshityouguys vegan.	1412181137	517351305095176192	f	thesteelcart
G1- Seaport\nG2 - 26th 11 / 12 @starrettlehigh\n#ComeToTheCheeseYo	1412182292	517356147159105537	f	gcnyc1
10$ Lobster Rolls! Hoboken, Pier 13 tonight! Starting at 5:00! It's Luke's Lobster's 5th birthday!!! AhHHhh!!!	1412183291	517360340234170368	f	nautimobile
@JimHerron or chew on a cinnamon stick!	1412183894	517362865901035520	f	waffletruck
@ChanelBarbieNY the best 15 seconds of your day.	1412183840	517362642193612800	f	waffletruck
Location Update: we are only on 46/6 today. We deeply apologize for any inconvenience we may have caused.	1412183975	517363207414239233	f	hibachiheaven
@mariostarks we are terribly sorry for the inconvenience, we had some technical problems w/the truck on 33/Park.	1412183922	517362985564901376	f	hibachiheaven
Want to have sweet chili in your office or at your party? no problem!  we cater all party sizes! contact us for pricing and menus today!	1412183762	517362315348680704	f	sweetchilinyc
47 th and Park on this rainy hump day. Pass by and say hi	1412184956	517367320583606272	f	mrniceguytruck
We are headed out at 2 today this rain is making us sad! Come get it while you can!  #thaietnamese	1412184848	517366867468771328	f	sweetchilinyc
RT @Foodtruckgirl7: @SweetChiliNYC was Fantastic for lunch the only thing I'd change is that I ordered more. Head to @TheSeaport there's st...	1412184807	517366698224418816	f	sweetchilinyc
#Afterparty #bestlatenightpizza http://t.co/tnjVDF0RW1	1412185918	517371358259732482	f	valduccis
Slice Out for Hunger October 8 @scottspizzatour @greenboxny http://t.co/SwxbzEMFYu	1412185662	517370284274630656	f	valduccis
We still have some Panini left at the Seaport #Best pizza#Best catering#Best Panini#Best catering New York City http://t.co/TMS7pJDgNs	1412185544	517369789665513472	f	valduccis
RT @ariellauren: Grilled cheese + job training: Sweet Win 4 @snowdaytruck at @vendyawards http://t.co/hwrcTe1fmx @ediblemanhattan @sarikami...	1412186886	517375418924822528	f	snowdaytruck
RT @sarikamin: A Mission on Wheels: @DriveChangeNYC @SnowdayTruck wins at the @vendyawards http://t.co/cr2Wb2QCQQ  My latest for @EdibleMan...	1412186873	517375363371253760	f	snowdaytruck
RT @greenboxny: We'll be there! :) @Valduccis: Slice Out for Hunger October 8 @scottspizzatour @greenboxny http://t.co/DJgzrkryQY	1412187154	517376539386970112	f	valduccis
@holyshityouguys swing by we'll give you some bacon.	1412186516	517373866004713472	f	thesteelcart
Another Delivery thru @Cater2me @greenboxny #bestpizzanyc http://t.co/HoutRqgC6u	1412188836	517383595674329088	f	valduccis
Heading over to #Sunnyside #Queens for dinner - get ready!	1412189888	517388010573541377	f	polishcuisine
Wafeloons! Step away from your computer for a second and come get your favorite afternoon snack! #dinges http://t.co/cxzv14cmOL	1412191044	517392855812571136	f	waffletruck
@PolishCuisine  Yummmmm http://t.co/1SniGRaB5J	1412191426	517394460041568257	f	valduccis
RT @Cater2me: @Valduccis @greenboxny Looks awesome!	1412191151	517393306243047424	f	valduccis
Oh, it's raining? Green Chili Mac &amp; Cheese makes you forget everything else in the world http://t.co/Zh6mXZNQlK	1412193588	517403525828333568	f	mexicue
Open and Ready on Queens Blvd &amp; 46th street (front of TMobile) for dinner! @YelpQueens #Sunnyside #Queens	1412193520	517403242129805314	f	polishcuisine
Don't let this weather bring you down.. We are open and ready to take your order. We have your favorite Sliders, Wings, and Fries.	1412193619	517403657302593536	f	mrniceguytruck
@mariostarks we will make up to you. Will DM w/details.	1412194538	517407511742525440	f	hibachiheaven
@BetsyBlackout hooray! Let's celebrate!	1412194947	517409226118168577	f	nautimobile
@danielleiat @LukesLobster @highline @HighlineStages @MMAglobal we were there for the MMA Global event's lunch break, and sold out!	1412194928	517409146581569536	f	nautimobile
@Foodtruckgirl7 omg you are too funny! Great pics!! #lol	1412196199	517414477747486720	f	sweetchilinyc
4:30-7pm 18th st &amp; 7th ave!!!	1412195955	517413454148567042	f	thetreatstruck
MAD MAPLE LOVE TO OUR FAV FANS @EdibleManhattan @ediblestories @sarikamin - thank you. http://t.co/TuSvBjshjr	1412196733	517416717421903872	f	snowdaytruck
Jumping off of the book of stolen faces?\n\nStalk us on ELLO @thecinnamonsnail\n\nhttps://t.co/Zpdu6xE1km	1412197977	517421934213337088	f	veganlunchtruck
.@TommyHilfiger satisfy your hunger &amp; commitment to social good all in one bite - join us for lunch tomorrow @starrettlehigh	1412197503	517419946864033792	f	snowdaytruck
.@MarthaStewart got lunch plans tomorrow? Our food truck will be @starrettlehigh - we're big fans &amp; would like to tell you about our work.	1412197463	517419779041533953	f	snowdaytruck
.@HUGOBOSS Celebrate your sample sale @starrettlehigh tomorrow by trying our food truck for lunch! We just won the Vendy for best new truck	1412197332	517419229109551104	f	snowdaytruck
@GarmentDstrctNY @UrbanSpaceNYC- For the month of October: Purchase a meal for a chance to win a digital blue ticket. http://t.co/rfkpYoFPTR	1412198040	517422202254557185	f	toastmonsternyc
.@mcgarrybowen satisfy your hunger &amp; commitment to social good all in one bite - join us for lunch tomorrow @starrettlehigh	1412198431	517423841615032321	f	snowdaytruck
.@ClubMonaco satisfy your hunger &amp; commitment to social good all in one bite - join us for lunch tomorrow @starrettlehigh	1412198396	517423692390092801	f	snowdaytruck
.@RalphLauren satisfy your hunger &amp; commitment to social good all in one bite - join us for lunch tomorrow @starrettlehigh	1412198384	517423642335277056	f	snowdaytruck
Here now! 10$ Lobster rolls at Pier 13, Hoboken. (Limit one per person)	1412198883	517425736781946881	f	nautimobile
Want a free ride to the truck?  \n\nhttps://t.co/TfQNg5bWQ9\n\nNow you can get the sweet heat you have been craving when we arent in your hood!	1412200404	517432115965992960	f	sweetchilinyc
RT @GlenwoodNYC: Start your #WorldVegetarianDay with organic vegan goodness from @thegreenradish1. Soups, salads, &amp; sandwiches. http://t.co...	1412202686	517441686180728832	f	thegreenradish1
Help locate lost person? RT @dangerouspiesDC: Please read and share. Thank you. http://t.co/F3uQ5hWiZf	1412204096	517447600266817536	f	dubpies
Only 134 more followers before we select someone randomly to send 24 pies to, anywhere in US. Next goal 4250! Pls RT	1412203945	517446966201315328	f	dubpies
Choice! RT @WRJoissaint: @dubpies Thanks for the best treats ever!  Wish you many years of success! #pie #Foodporn http://t.co/yPWuYUQvdT	1412203866	517446636478668800	f	dubpies
harissa #2 http://t.co/kquUSAaWHQ	1412205505	517453509361287169	f	milktrucknyc
#pietruck is at Bedford Ave &amp; N7 St, Williamsburg - Brooklyn until around midnight Thanks @WRJoissaint for pic http://t.co/KnegkMj3ux	1412204407	517448904053641218	f	dubpies
RT @camGarcia__: #hibachiheavenNYC and #SCBE collab: http://t.co/ccfN4dqc6F @hibachiheaven @HashtagSCBE http://t.co/vZkNOwXtl3	1412206078	517455913306038272	f	hibachiheaven
RT @Ahlexandria: Have you taken the time to see the posts up on http://t.co/ZgluCiiMut like the collab with @hibachiheaven and Angry orchar...	1412206058	517455830040719360	f	hibachiheaven
RT @CG_DigitalMedia: #hibachiheavennyc inspired: http://t.co/QLlArfUxyO @hibachiheaven @HashtagSCBE http://t.co/VidwbR0gQV #meatlessmonday ...	1412206053	517455808507158528	f	hibachiheaven
harissa # 3. mjghty. http://t.co/YmmrqjnPEJ	1412206641	517458275508297728	f	milktrucknyc
Due to tonight's unsavory weather we are closed down on the pier. Thanks to those who came!	1412206840	517459108786884609	f	nautimobile
RT @priskilllerrr: Finally understand the lyrics of 'Love Never Felt So Good' because it's playing while I'm consuming my @NautiMobile lobs...	1412206464	517457532932354048	f	nautimobile
We will be at our usual #midtown location tomorrow from 11-2 @ 47/ Park . See you there!	1412209166	517468866763837440	f	hibachiheaven
@KirstiItameri Hi Kirsti - sorry to hear that...can you send your email to jordyn@drivechangenyc? thanks!	1412208267	517465096105111552	f	snowdaytruck
check out our collab with #foodbloggers @hashtagSCBE from #California! http://t.co/6xiEIdTi6D #SCBE http://t.co/d0HVcsBtQH #nyc	1412211165	517477251005566976	f	hibachiheaven
@SonnyGold1 not tomorrow, sorry!	1412211057	517476799039954945	f	hibachiheaven
Thanks everyone for coming and making your dinner #Pierogitime - see you next week! #Sunnyside #Queens	1412212530	517482975043547137	f	polishcuisine
RT @Chris_Pescod: My new favourite beer @ConeyIslandBeer in such a cool bar with awesome chilli cheese fries @shortysnyc #NYC http://t.co/k...	1412212685	517483626343460865	f	shortysnyc
RT @MaryIrene: Food truck action from @thegreenradish1 at ramseyfarmersmarket #organic #vegan #green #ramsey #NJ... http://t.co/ycCUTrsX2C	1412211882	517480258023743488	f	thegreenradish1
Brooklyn-based Americana-Kiwiana  @StreetsOfLaredo are on US tour soon.\n\nTry not to miss them, eh?	1412215918	517497184384999424	f	dubpies
@DUMBOFoodTrucks @dumbolot Tomorrow~Asian Tapas Thursday!catch us for lunch jay st &amp; water st 11~3pm.	1412215841	517496861478125568	f	shanghaisogo
RT @TheRealDananino: @ShortysTrivia @shortysnyc @FakeAdamLyons best night of trivia ever... And not just because we won @dschwarz58 @amanda...	1412218194	517506733292683264	f	shortysnyc
@sofisunhary you are most welcome!	1412226840	517542995366006784	f	waffletruck
@Russell5Russell @MikeMoriartyGFD good idea!	1412226822	517542919348436992	f	waffletruck
@dinadee_5 oh yeah, it's good.	1412226796	517542812469174272	f	waffletruck
@BenZoldan @rjacoby13 a fine think to think about, we feel.	1412226765	517542680096956416	f	waffletruck
@han_man_ @brigid1289 HA!	1412226650	517542200855769088	f	waffletruck
@MienVdbossche @italiaricci yes yes. Do this thing!	1412226584	517541921552879616	f	waffletruck
Lentils Quinoa #Donarts Today52&amp;6 11-2 @ubs @RollingStone @usweekly @MensHealthMag @AtlanticRecords @CBS @BuzzFeed @simonsam @midtownlunch	1412247121	517628060624244737	f	thegreenradish1
We are open at 23rd and Park. Eat a dozen today!	1412248159	517632413749739520	f	carpedonutnyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIyYdw	1412249706	517638904489332736	f	sweeterynyc
It's Thursday, so you know what to do. It's Taim for lunch on Varick/Vandam. Let's do this SoHo!	1412251382	517645934378102784	f	taimmobile
RT @nicolebestard: @TaimMobile team brings the sunshine again! My mere $6 returned an awesome sandwich + a lemonade on the house! You guys ...	1412251347	517645785924898816	f	taimmobile
OPEN EARLY!\n\nParked on 21st/5th 8:30-3:00\nThen serving dinner in Jersey City at the Grove St. PATH 5:00-8:00... http://t.co/Us05wryT9C	1412253722	517655747447242752	f	veganlunchtruck
RT @Foodtruckgirl7: Good Morning  @bobjoTruck @garyssteaks @DeliNDogzTruck @SweetChiliNYC @EddiesPizzaNY @gcnyc1 love seeing you near oldsl...	1412253152	517653357226631169	f	sweetchilinyc
RT @ChrisQuartararo: Thai Vietnamese fusion @sweetchilinyc #governorsisland #nyc #truckfood @ Governors Island National... http://t.co/D2i5Ni...	1412253146	517653330475380736	f	sweetchilinyc
I posted a new photo to Facebook http://t.co/wKAKQBlEeS	1412254719	517659930531467264	f	polishcuisine
I posted a new photo to Facebook http://t.co/xpq5toyoIM	1412254515	517659075543572480	f	polishcuisine
today in #soho on Charlton st @ Vandam 11:30-2:30. A good day to indulge w/our Korean style BBQ nachos $4 (veggie/vegan/GF versions too!)	1412254529	517659134565842944	f	kimchitruck
Ola #soho ! Were happy to feed you today 11:30 - 2:30 on Charlton @ Vandam. #soholunch #nyfoodtrucks #foodtruck	1412254528	517659127078985728	f	kimchitruck
OPEN EARLY!\n\nOn 21st/5th 8:30-3:00\nThen serving dinner in Jersey City at the Grove St. PATH 5:00-8:00\n\nHot borscht &amp; thanksgiving Sandoos!	1412255032	517661240710397952	f	veganlunchtruck
RT @PontiRossiFood: Today we serving lunch on 47th St and Park ave. Zesty Italian Food made by italians. Call in for orders 347-506-9616 ht...	1412255527	517663318279225344	f	hibachiheaven
We will be serving lunch at #midtown on 47th &amp; Park today! #hibachiheavenNYC	1412255502	517663211727110144	f	hibachiheaven
Calling all Manhattan Maple-ites! We are in the city today so come check us out @starrettlehigh 601 W. 26th from 11-4 http://t.co/OIlnGxr6e0	1412255244	517662132083904512	f	snowdaytruck
Today we serving lunch on 47th St and Park ave. Zesty Italian Food made by italians. Call in for orders 347-506-9616 http://t.co/3vWgb6aYXX	1412254835	517660415430778880	f	pontirossifood
@NYCWingNut @AgataPorter #Flatiron #Pierogitime is happening on 5th &amp; 22nd today!	1412255487	517663149827584001	f	polishcuisine
I posted a new photo to Facebook http://t.co/ZOkJPs8WSB	1412255032	517661243004706816	f	polishcuisine
We are in #Flatiron today - on 22nd b/w 5th &amp; 6th (practically on the corner of 22nd &amp; 5th) http://t.co/chfvg1pbts	1412254905	517660709606670336	f	polishcuisine
I posted a new photo to Facebook http://t.co/Mif5Tpjm2A	1412254904	517660707127853057	f	polishcuisine
#Curry #King #Seton #Hall #University #South #Orange #NJ #serving #best #authentic #Indian #Cuisine	1412256378	517666887711215616	f	mausamnyc
Mmmm a grilled kafta sandwich sounds so scrumptious doesn't it? Order yours today on Jay &amp; Water St. in @DumboNYC! http://t.co/qUH9tSOoiD	1412255999	517665297567080448	f	toumnyc
The SchnitzCart will be on 26th street between 11th &amp; 12th aves 11:30-2:30pm. Stop by:) @starrettlehigh	1412256330	517666685902684161	f	schnitznthings
Hi guys. Schnitztruck will be on 51st between park and madison 11:30-2:30pm. Stop by for lunch. Preorder 347-772-7341	1412256249	517666348244426752	f	schnitznthings
Happy Thursday..LET'S GOOOOO!!!\nThe Grub Truck- 53rd Street and Park Avenue\nKhao Cart- 50th Street btwn 6th and 7th Avenue	1412255808	517664496387887104	f	bigdsgrub
RT @SetonHall: The #Pirate loves the beach. Here he is in Miami. http://t.co/yXQD2baYMD	1412255956	517665118512226305	f	valduccis
@setonhall #roundPies @valduccis @gofooda @greenboxny http://t.co/LJvZ4tZ6Ru	1412255916	517664950526148608	f	valduccis
Bessie's at 25th &amp; Park, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always @houstonhallnyc	1412256615	517667883610959873	f	milktrucknyc
Khao Cart- 50th Street btwn 6th and 7th Avenue. MENU: http://t.co/JciEZCOBec	1412257051	517669710486593536	f	bigdsgrub
I posted a new photo to Facebook http://t.co/I92FmpjfGB	1412257145	517670104398831616	f	polishcuisine
@WRJoissaint thank you!	1412257927	517673385930002432	f	dubpies
RT @WRJoissaint: @WRJoissaint @dubpies there you go. Here your excellent review. Keep up the good work. #Foodporn #pies #foodie #foodtruck	1412257911	517673316149362689	f	dubpies
#pietruck is at 125 West 55th St, NY NY from 11am to 2.30pm. Just west of 6th Ave	1412257896	517673254274998272	f	dubpies
Good morning Dumbo! Salsa Roja, Salsa Verde, Salsa Picante, Salsa in your life! @MexicoBlvd @dumbolot Water&amp;Jay	1412258004	517673706056065024	f	mexicoblvd
RT @NYCWingnut: @PolishCuisine @agataporter YAYAYAYAY!!!	1412258545	517675975476535297	f	polishcuisine
I posted a new photo to Facebook http://t.co/mxOcvrZSQw	1412258471	517675666549252096	f	polishcuisine
Hello Brooklyn! Lunch 2day @ front &amp; jay st. Burger of the week THE GUACAMOLE BLAST. Preorder 9172929226 #dumbo @DUMBOFoodTrucks	1412258617	517676277504180224	f	fritesnmeats
@csiSL @starrettlehigh @TommyHilfiger Let's do lunch! We'll be right in front of your location @ 601 W. 26th st today from 11-4! #farmefresh	1412259997	517682065673052160	f	snowdaytruck
52nd and 6th - get it while you can!!! The block is hot. We're rocking 11-2 see you soon!	1412260178	517682827861950464	f	philssteaks
Forging our own path on 47th &amp; Park today! Find us across the street from all the hubbub	1412259537	517680139678019584	f	mooshugrill
Happy Thursday #soho! Today on Charlton st @ varick from 11:30-2:30 well be serving up deliciousness #soholunch #nyfoodtrucks	1412260029	517682201283272705	f	kimchitruck
It's a #porkbelly sort of day on 53rd &amp; Park!	1412259994	517682054713319424	f	biandangnyc
Disos in 47th bet park and lex.. \n\nROAST BEEFS BACK! ! ! Call it in : 917-756-4145 http://t.co/noDcmr0dyU	1412259397	517679551544307714	f	disosnyc
Rock On,Quinoa! @thomyorke @moby @bryanadams @RollingStone @AtlanticRecords @MensHealthMag @usweekly @usacycling @midtownlunch @UBS  #moma	1412259968	517681945824997376	f	thegreenradish1
Is there any better idea for your Thursday lunch in #dumbo? Come &amp; get some from your loving truck @dumbolot 11~3pm. See ya all later!	1412260520	517684260049014784	f	shanghaisogo
RT @Patty__B:  RT @hibachiheaven: We will be serving lunch at #midtown on 47th &amp; Park today! #hibachiheavenNYC	1412260854	517685660862648320	f	hibachiheaven
@Patty__B hope to see you there!	1412260851	517685647336042496	f	hibachiheaven
For a Hibachi Heaven inspired meal, take a look at this creative recipe by @hashtagSCBE http://t.co/ccfN4dqc6F http://t.co/vZkNOwXtl3	1412260826	517685544357482496	f	hibachiheaven
@nycfoodtruck were @starrettlehigh today from 11-4 pm! Bringing Maple Treats to the City Streets! http://t.co/AEdGsDJGYm	1412260976	517686171271696384	f	snowdaytruck
Who's coming to check out the @vendyawards Champs @starrettlehigh today for lunch? @UnderArmour @TommyHilfiger @csiSL we on your lawn @ 11-4	1412260210	517682962360721408	f	snowdaytruck
Catch Domo Taco at @theseaport and on 39th &amp; Broadway today! Got the city covered from downtown to midtown!	1412260254	517683143625961472	f	domotaco
Quinoa Special,Today, 52&amp;6,11-2, @ubs @midtownlunch @EatStTweet @OneGreenPlanet @DharmaYogaNYC @NewYorkObserver @WSJ http://t.co/zXD9Uetv1a	1412260673	517684903270703104	f	thegreenradish1
Cart is set up @DowntownBklyn #MetroTech Commons, Truck is doin a few laps in #Midtown looking for a spot- stay tuned!	1412261857	517689868177375232	f	morristruck
.@mcgarrybowen @starrettlehigh today 11:30-3pm and then TBD	1412261570	517688663300669441	f	snowdaytruck
The truck found a spot on 48th street between park and lex! ATTENTION. Truck is on 48th between park and lex!!! 11:30-2:30pm	1412261867	517689909411598337	f	schnitznthings
51st between park and madison is closed off. Truck can't park there. Will update once we get location	1412261307	517687562895626240	f	schnitznthings
Its almost time for lunch on old slip &amp; water! Here till 3! #thaietnamese #sriracha #fries #topchef #yum #sweetchilinyc #fidi	1412261477	517688274312523776	f	sweetchilinyc
Our Hot, Hot Dogs can warm you up on this dreary NY day. Broadway at 58th St. up the street from @TimesSquareNYC	1412261886	517689990487494656	f	papayakingtruck
RT @FoodtoEat: Cloudy, rain or shine - @ETRAVAGANZA will have you set for breakfast &amp; lunch. Preorder online for pickup: http://t.co/1ONUBG...	1412261695	517689188352020481	f	etravaganza
Playing with pumpkins on 56th &amp; Broadway. Soup is Navy Bean &amp; Kale.	1412261659	517689038506311680	f	thesteelcart
Goodmorning!! Today Thurs 10/2 11:30 pm - 3PM 47st between Lexington &amp; Park aves NYC\nhttp://t.co/MPHGwjSFxE http://t.co/cTsfzS221l	1412262484	517692499671142400	f	latinkitchennyc
Hoping to be in the neighborhood of 52nd &amp; 6th with the truck, but still hovering! Open around noon we hope! #worththewait #wepromise	1412262904	517694257835290624	f	morristruck
Tell us your favorite urban legend for a free dinges!	1412262334	517691868600356864	f	waffletruck
Pagadder @ Brooklyn bridge till 9pm\nGoesting @ Bway &amp; 66th till 9pm	1412262328	517691842998317056	f	waffletruck
CARTS\nVedette @ 60th &amp; 5th till 8pm\nKotmadam @ Bway &amp; 17th till 10pm\nBierbeek @ Great Lawn in Central Park till 7pm	1412262321	517691815471104001	f	waffletruck
TRUCKS\nMomma Truck @ Citibank building in Long Island City till 10pm\nKastaar @ MetroTech Center in Brooklyn till 3pm	1412262313	517691779144241152	f	waffletruck
Tasty Thursday!\n\nLe Cafe @ 15 Ave B open till 11pm\nDe Wafel Cabana @ 35 &amp; Broadway till 10pm	1412262303	517691737104732161	f	waffletruck
@ShanghaiMKS Thank you so much! #MADMAPLELOVE #FARMFRESH #EATLOCAL We'll be @starrettlehigh today from 11:30-3:30 if your in Manhattan!	1412262617	517693058134343681	f	snowdaytruck
RT @starrettlehigh: .@DriveChangeNYC is bringing @SnowdayTruck today from 11:30-3pm! Head down to check out the food and learn more about t...	1412262221	517691394904043520	f	snowdaytruck
Best Colombian arepas in New York! Come and have lunch with us today at the garment district @UrbanSpaceNYC	1412262074	517690780203630592	f	palenquefood
The layers of our Burnt Ends Brisket Sloppy Joe (There's cornbread down there, too...)\n\nhttp://t.co/o3krI1ecjx | http://t.co/MdhrvEnBsk	1412262609	517693021174104065	f	mexicue
I posted a new photo to Facebook http://t.co/Ky0wto4tj5	1412262368	517692012724637697	f	carlssteaks
http://t.co/6W8qTe6aZj	1412262342	517691903647969280	f	carlssteaks
It's @TheSeaport Thursday folks trucks all fixed  and ready to serve our famous Cheesesteaks Front st &amp; john st till 4 GOT WHIZ?	1412262248	517691507143606272	f	carlssteaks
Classic Polish Gingerbread Cake  on board today #Piernik #Traditional 22nd street b/w 5th &amp; 6th #Flatiron	1412262409	517692183580008448	f	polishcuisine
Open and Ready on 22nd st b/w 5th &amp; 6th (off of 5th really)...#Flatiron #Pierogitime	1412262282	517691652056821760	f	polishcuisine
@zoperesman The day of the week varies - we made a special appearance today :)	1412262019	517690548732579840	f	polishcuisine
A healthy truck means a delicious lunch. Up &amp; running at 47th and Park until 1:45pm #Midtown #FoodTruck... http://t.co/F9JxXkOH7U	1412262788	517693771924787200	f	shortysnyc
Catering Babyyyyy !!!!!!! @Cater2me #NYCbestfood http://t.co/6Hh5MQGt2c	1412262375	517692040646496256	f	valduccis
Open for lunch.. 47th bet park and lex.\n\nROAST BEEF BACK IN ROTATION!\n\nCall in orders to: 917-756-4145	1412262918	517694319957131264	f	disosnyc
Located in 50th between 6th and 7th	1412263589	517697132401553408	f	thepocketful
In dumbo today again, Fronts and Adams 12pm. @DUMBOFoodTrucks	1412263803	517698030091665409	f	parissandwich
RT @HauteCraigture: THE @PolishCuisine TRUCK IS BY WORK AND IM GOING TO OVERDOSE ON PIEROGIS	1412263715	517697661663969280	f	polishcuisine
I posted a new photo to Facebook http://t.co/nCPa0JrsTb	1412263488	517696710379061249	f	polishcuisine
http://t.co/hxCpWc8UpM	1412263330	517696047498285056	f	funbunsnyc
Braised pork belly topped with relish green,  sugar peanuts,  and cilantro. Over rice or on a bun at 50th st between 6 /7 ave #midtown lunch	1412263288	517695872050933760	f	funbunsnyc
Happy Thursday!  The Mtbll  has stopped on 50th bet 6&amp;7 aves. Come in by for your favorite ball. We missed ya 	1412263644	517697364564258819	f	mtblls
Thursdays were made for indulging with empanadas -- you can find the truck on the corner of 5th Ave &amp; East 20th... http://t.co/cBmTcoJvi5	1412263335	517696065940631552	f	nuchasnyc
Disos famous roast beef on the "off the menu" special today call in your orders to 917-756-4145 http://t.co/X9hmJKkKjG	1412262994	517694635905667072	f	disosnyc
We are in manhattan for lunch - today only - 601 west 26th st @starrettlehigh @csiSL @MarthaStewart @mcgarrybowen @RalphLauren	1412264354	517700342583406594	f	snowdaytruck
RT @ShanghaiMKS: Whos a fan of the @SnowDayTruck design? Where have you spotted this maple machine? #AllMapleEverything http://t.co/Q3IVIE...	1412264018	517698930562596865	f	snowdaytruck
University of Maryland medical center from 11-3 with the BEST chicken tenders you'll ever have.  Come and get it. #nom	1412264534	517701096048164864	f	usafoodtruck
Tacos, grinders and more await your consumption at 53rd Street and Park Avenue, now till' 2:30pm!! Preorders call 646-543-BIGD	1412264718	517701867821088769	f	bigdsgrub
Hello NYC!! We r ready to serve at varick and king st. Now!! Plz come by and enjoy thank you very much!!	1412265377	517704633964568576	f	bobjotruck
RT @HauteCraigture: Take my breath away. http://t.co/bQjl53cF68	1412264911	517702675841175553	f	polishcuisine
RT @LFCNY: @dubpies are official pie supplier to LFCNY, available at a discount at @11thBar.  Because who doesn't want a pie while they wat...	1412266382	517708849143611392	f	dubpies
Need ideas for dinner tonight? Take a look at http://t.co/E6nAjSzDGH for some inspiration! #foodbloggers @hashtagSCBE http://t.co/ccfN4dqc6F	1412266366	517708779983761408	f	hibachiheaven
.@csiSL LUNCH IS SERVED - We are down stairs until 3pm! TWEET AT US OR @DriveChangeNYC &amp; TELL US HOW YOU DRIVE CHANGE for 1$ off any item	1412266372	517708805380276224	f	snowdaytruck
I posted a new photo to Facebook http://t.co/VbvTPXuiVs	1412265981	517707164769865729	f	polishcuisine
Ok! Just like a Monday only better, cause it's Thursday! Open at 52nd &amp; 6th with all the cheesiness you know and love!	1412266581	517709680576311296	f	morristruck
@austeragency @FoodtoEat Haha... Love that "toumany falafel's" !	1412267280	517712612956860419	f	toumnyc
RT @FoodtoEat: To die for #Falafels from @ToumNYC can be found at #Dumbo, Water &amp; Jay St. Preorder online to avoid the lines: http://t.co/U...	1412266979	517711352383934465	f	toumnyc
.@laurenweberWSJ @csiSL (The Center for Social Innovation) is located in the @starrettlehigh building 601 West 26th Street, Manhattan	1412266512	517709393891438592	f	snowdaytruck
Hey guess who's back on the street, #BigRed! And she's in Brooklyn and the Metrotech Center!	1412266692	517710147888889856	f	lobstertruckny
RT @Alannabean: GUYS OMG MY ALL-TIME FAVORITE FOOD TRUCK (@PolishCuisine) IS IN FLATIRON TODAY PLEASE JOIN ME	1412267271	517712578332860417	f	polishcuisine
#Flatiron Flatiron FLATIRON - 22nd b/w 5th &amp; 6th  - can't miss us! #Classic #Pierogitime	1412267200	517712279182532608	f	polishcuisine
@austeragency @FoodtoEat Amen to that! I also recommend our fall special - vegan pumpkin kibbeh... So yummy - a must try 	1412267670	517714251696603136	f	toumnyc
@Gab4pupil Thanks for the shoutout! We love that you enjoyed lunch with us :)	1412267441	517713289535827968	f	toumnyc
RT @Gab4pupil: @ToumNYC shout out to Simon and the entire authentic lebanese staff for making a delicious chicken shawarma sandwich! http:/...	1412267408	517713151937490945	f	toumnyc
RT @caryn_aych: GET THEM PIEROGIS!!!  RT @Alannabean: GUYS OMG MY ALL-TIME FAVORITE FOOD TRUCK (@PolishCuisine) IS IN FLATIRON TODAY PLEASE...	1412267991	517715594888876032	f	polishcuisine
RT @catbarto: @Alannabean @PolishCuisine whattttt	1412267984	517715567529443329	f	polishcuisine
today in #soho on Charlton st @ Vandam 11:30-2:30. A good day to indulge w/our Korean style BBQ nachos $4 (veggie/vegan/GF versions too!)	1412267730	517714502864097280	f	kimchitruck
@shahidkapoor best of luck	1412268299	517716886608703488	f	taipanexpress
Best of luck my brother...	1412268232	517716605292523521	f	taipanexpress
RT @randomfoodtruck: .@TheSteelCart out front, @dubpies down 55th between 6th &amp; 7th, @PapayaKingTruck up Broadway at 58th	1412268307	517716922881036288	f	dubpies
@austeragency @FoodtoEat Only one way to find out haha!	1412268872	517719291328995328	f	toumnyc
Headed to the UWS today! 3ish (we'll let you know our opening time!) to 7pm! Bway (86th &amp; 87th)!!!	1412269129	517720368736636928	f	thetreatstruck
Hey NYC! It's lunchtime! How about one of these? #yum #dingeswithpork http://t.co/b6ECQfFygh	1412269893	517723572790628353	f	waffletruck
@austeragency @FoodtoEat Let us know how your tummies review us 	1412269751	517722979472769024	f	toumnyc
It's what we aim to do!  RT @coolboyzak: @hibachiheaven hit the spot today though	1412269610	517722386628874242	f	hibachiheaven
We are open and ready to go 634 McLean Avenue, Yonkers NY 914-457-4324	1412269542	517722102724849664	f	mrniceguytruck
Get a FREE ride worth $25 using the BIGDSGRUB promo code via @lyft http://t.co/kDS0M6SGZs	1412271640	517730900088729600	f	bigdsgrub
Not late! Asian Tapas Truck @dumbolot 11:30~3pm. catch Shanghai Sogo for #edamame #yakitori #buffalo #dumpling #rice #noodles   #bubbletea	1412272204	517733266972241920	f	shanghaisogo
RT @Foodtruckgirl7: Thank you! @hibachiheaven for serving NYC delicious eats!! I can't wait to get to the truck soon! #foodtrucks #NYCfoodt...	1412272192	517733216443453440	f	hibachiheaven
@jillhornstein not today! Just at #midtown.	1412272183	517733177914560512	f	hibachiheaven
@CamilleDeMere Thank you so much! Happy you enjoyed it! We have #MADMAPLELOVE for you supporting our mission!	1412272534	517734649557442560	f	snowdaytruck
Throwback Thursday hauling our first kiosk into Times Square NYC! http://t.co/hZc1wtvooT	1412272014	517732468489990144	f	nuchasnyc
#DowntownFestival starts tonight in our backyard! Catch JUNGLE and @BeatyHeart at @IrvingPlaza! Doors: 7P http://t.co/otxGqDlQbI	1412273695	517739522311090176	f	papayakingtruck
.@drinkimagine #madmaplelove #workitoff Good thing all our product is farm fresh! We think it looks good on you!	1412274458	517742720916684800	f	snowdaytruck
LAST DAY of @UrbanSpaceNYC's #MadSqEats! Come cheers the Flatiron building with our Burnt Ends Brisket Chili nachos http://t.co/5tVxXvcYxj	1412275375	517746567550623744	f	mexicue
done for the day. see you tomorrow @theseaport for #TGIF	1412277842	517756915565486080	f	sweetchilinyc
Hi Langos Truck is in Astoria Queens from 4:30-9pm corner of 30th.Ave and 31street enjoy	1412278862	517761193784918017	f	langostruck
!!! Thurs, Oct 2nd 4-7pm Bway (86th &amp; 87th)!!!	1412278302	517758842223222786	f	thetreatstruck
@HungryGoddess gonna need an address! ;-)	1412279210	517762650902892546	f	dubpies
RT @MsMagFront: This is amazing! I want this #foodtruck in my city: @PolishCuisine: http://t.co/zXP0dWV64P	1412279210	517762649866903552	f	polishcuisine
RT @Ahlexandria: I love veggies! #MeatlessMonday #SCBE made a vegetarian dish using @hibachiheaven sauces. http://t.co/suHj9Y60x0	1412280676	517768802709549056	f	hibachiheaven
#PieTruck proudly flying #tinorangatiratanga colors. NZ doesn't need a new flag, this one's awesome http://t.co/WpKhYqwbPa	1412284417	517784493718269952	f	dubpies
Parked in jersey city at the grove st path station until 8:00\n\nReally looking forward to making you ultimate yum yums!   &lt;3	1412283972	517782623708803072	f	veganlunchtruck
RT @marcsiry: Lunch from a truck, because Brooklyn. @ Mexico Blvd. Taco Truck http://t.co/HzsYRlycwA	1412285186	517787716491419649	f	mexicoblvd
.@joeszulee @csiSL #madmaplelove	1412285188	517787724900995072	f	snowdaytruck
Our Fall Seasonal Jungle Juice is made with Apple Pie Moonshine &amp; @KingsCoWhiskey Bourbon. YES. http://t.co/KllPaFotkq	1412287078	517795652882165760	f	mexicue
Dinner at 65th and Broadway, near the Lincoln Center 1 Subway Stop http://t.co/SCwMLvAYZI See you soon!	1412286860	517794738775547905	f	papayakingtruck
@stefferonipizza grazie mille Stefania, We glad you enjoy our food so much.It's always a pleasure!Ps la foto e' fantastica!See you soon 	1412287469	517797294620827648	f	pontirossifood
RT @stefferonipizza: #NYC, do yourself a favor and track down the @PontiRossiFood truck. it'll make your day. and week. and life. http://t....	1412287405	517797024864169984	f	pontirossifood
Don't ya think? @ Wafels &amp; Dinges http://t.co/gwgzl44A0v	1412288757	517802693729869824	f	waffletruck
#pietruck is at Bedford Ave &amp; N7 St, Williamsburg - Brooklyn until around midnight	1412290751	517811058426535936	f	dubpies
RT @LFCNY: @dubpies @11thBar Pies make everything better. And we'll need to talk about some sausage rolls as well :-)	1412290634	517810567520976896	f	dubpies
We're quite chuffed! MT @LFCNY: @dubpies Official Pie of @LFCNY, discounted @11thBar.  Who doesn't want a pie while they watch the game?	1412289908	517807521915240449	f	dubpies
Pagadder @ Brooklyn Bridge till 9pm\nKotmadam @ Broadway &amp; 17th till 10pm\n\nAllez!	1412290057	517808147986403328	f	waffletruck
Momma Truck @ Food Cellar in Long Island City till 10pm\nKastaar @ Astor Pl till midnight!	1412290049	517808112972357632	f	waffletruck
Wafels at night!\n\nLe Cafe @ 15 ave B till 11pm\nDe Wafel Cabana @ 35th &amp; Broadway till 10pm	1412290042	517808085361250304	f	waffletruck
RT @lydiasorganics: @VeganLunchTruck Will U Spread the Word 2 Save #Vegan Pioneer #LydiasOrganics Company, Jobs &amp; Mission? http://t.co/YtHV...	1412293214	517821390565945344	f	veganlunchtruck
@AshMarshallMLB @mdnightwriter we feel that. We do love them meat swords.	1412295738	517831976456572928	f	waffletruck
@MzGrace929 come to NY!	1412295706	517831840808574976	f	waffletruck
@MlSSQueenB we wish your job was close to us!	1412295699	517831812098560000	f	waffletruck
@leo_claudd where's that?	1412295661	517831653541298176	f	waffletruck
Astoria lets get food delivered to your door! @ChelaGarnacha is delivering all around Astoria! Call (917) 832-6876 ! http://t.co/4LJrVdUF7Q	1412295754	517832042860793856	f	mexicoblvd
RT @ChelaGarnacha: Astoria! Lets get some tacos and guacamole delivered to your door! #deliveryopen call us @ (917) 832-6876	1412295576	517831295297396736	f	mexicoblvd
Cinnamon Snail can't stay off of these "best food trucks in America" lists!\n\nGrateful for the love @TWCBreaking \n\nhttp://t.co/QErAbQyIDf	1412296200	517833912702472192	f	veganlunchtruck
Gift certificates, hoodies, shirts &amp; stickers are all available on our @etsy shop!\n\nhttps://t.co/JEcYH2DdBK\n\n@EtsyVeg http://t.co/L6XfDpmGrv	1412294589	517827158069506049	f	veganlunchtruck
RT @CG_DigitalMedia: #MeatlessMonday With @HibachiHeaven -  http://t.co/suHj9Y60x0	1412298968	517845521743224832	f	hibachiheaven
@Creatively_GF Thanks for your support Jenny!!	1412300264	517850958181965824	f	brooklynpopcorn
#PieTruck proudly flying #tinorangatiratanga colors. NZ doesn't need a new flag, this one's awesome http://t.co/vOkcG1wYzc	1412302507	517860366198800384	f	dubpies
@Danosaur5 our schedule varies at the moment.... We can keep you posted!?	1412303163	517863119411216384	f	polishcuisine
http://t.co/8I6vGTbADC Thanks @NicoleScherzy Twerking for funbuns !!!	1412308795	517886742234689537	f	funbunsnyc
http://t.co/8I6vGTbADC http://t.co/D6dbd6vGeE	1412308595	517885902056857600	f	funbunsnyc
Winners of last nights trivia at #ShortysUpperEast... Team #MoneyShot took home a set of 4 tickets to 76ers/Nets... http://t.co/y3JOdfkEBf	1412309278	517888767269822465	f	shortysnyc
Hey NJ, Truck being serviced this weekend, see you next Saturday at Montclair Farmer's Market...	1412324044	517950697707687936	f	thegreenradish1
We will be at the Seaport today #freeZeppoli #BestPizza @greenboxny @Cater2me http://t.co/AVXS0ts0Xl	1412335741	517999758708056064	f	valduccis
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIyYdw	1412336105	518001288051560448	f	sweeterynyc
LentilSoup,ThaiSalad,QuinoaBowl,#Donarts #77Water 11-2 @DowntownNYC @DowJones @WSJ @WellandGoodNYC @DevilGourmet @simonsam @SteveWynn_ @biz	1412337250	518006088491601920	f	thegreenradish1
RT @Foodtruckgirl7: I see we have @Valduccis @TheSeaport. Hanover/oldslip @fritesnmeats @PontiRossiFood @DomoTaco @desiexpressnyc that I sp...	1412338495	518011311201222656	f	pontirossifood
#PieTruck is at Park Ave &amp; 47th. Serving from 11am to 2.30pm	1412339339	518014849553825792	f	dubpies
Meatball pie is Delis' @Foodtruckgirl7 @greenboxny @FoodNetwork http://t.co/56qSf6wj7P	1412339279	518014601259388928	f	valduccis
Grandma pie #bestSweetSauce @Foodtruckgirl7 http://t.co/VjGHLCfknc	1412339192	518014233720913920	f	valduccis
RT @TravlBy: Food Truck Friday! 7 Food Trucks You Have To Try In NYC http://t.co/8KmSV4nqOt @mexicoblvd @schnitznthings @NautiMobile @frite...	1412339824	518016887436083201	f	mexicoblvd
Please RT:\n\nTWO TRUCKS OUT TODAY\n\n33rd/Park 9:00-3:00\n\n55th/Broadway 8:30-3:00\n\nbourbon crem brulee donuts FTW!\n\n http://t.co/ekVapXY5VZ	1412339942	518017380283600896	f	veganlunchtruck
#weekend #starts @Dumbolot #spice #up U'r #tastebuds #with the #Curry #King the #greatest #CURRIES &amp; #BITES	1412339562	518015788364464128	f	mausamnyc
RT @Foodtruckgirl7: @Valduccis you're making me so hungry and it's only 8am!!! No fair! You look delicious. #pizza #sauce #NYCfoodtrucks #s...	1412340130	518018168556503040	f	valduccis
It's #FoodTruckFriday near @TheSeaport on John &amp; Front St! Join us for lunch and dinner from 11am-8pm. #LebaneseEats	1412340816	518021045878804480	f	toumnyc
RT @greenboxny: RT @Valduccis: We will be at the Seaport today #freeZeppoli #BestPizza @greenboxny @Cater2me http://t.co/LqK8KmNzMg	1412340740	518020727715680257	f	valduccis
Bessie's at Wall &amp; William, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always @houstonhallnyc	1412343001	518030209333739520	f	milktrucknyc
It's Friday kids! Lunch today on 48th bet 6 and 7 ave\n\nCall in orders to: 917-756-4145	1412342662	518028787649613825	f	disosnyc
10/3: Join us for lunch at 50th Street btwn 6th and 7th Avenue	1412343130	518030752471330816	f	bigdsgrub
Hi come to get Your Traditional Langos at 47th.street bet Park &amp; Lexington Ave till 2:30pm enjoy your weekend	1412343883	518033909251325952	f	langostruck
Happy weekend! #tacofriday #taquiza @MexicoBlvd #midtown 46St. Los esperamos!	1412344704	518037354939174912	f	mexicoblvd
Off the Road today! Don't forget that we #Cater  reach out to us: OldTraditionalPolishCuisine@yahoo.com	1412344175	518035136861196288	f	polishcuisine
If you missed us at the seaport yesterday come get your fill of Domo Taco on Old Slip and Water st!	1412344406	518036105170796544	f	domotaco
Hey #GarmentDistrict! Check out #MSG on 38th &amp; Broadway today!	1412344295	518035637971451904	f	mooshugrill
It's all sunshine and #teaeggs here on 53rd &amp; Park today!	1412344515	518036561188114432	f	biandangnyc
Happy Friday! We will be on 46th and 6th today. #midtown	1412345318	518039930166329344	f	hibachiheaven
SCREAM FROM THE ROOFTOPS IT'S CHEESESTEAK FRIDAY!  @randomfoodtruck @VictoriasSecret @DefJamRecords @Barclays... http://t.co/AO3ny8xlnM	1412345238	518039593527304192	f	carlssteaks
41st between 6th and Broadway for lunch on this phine Phil's Phriday! Steaks are sizzlin' 11-2, come thru!	1412345174	518039323590279168	f	philssteaks
RT @TravlBy: Food Truck Friday! 7 Food Trucks You Have To Try In NYC http://t.co/8KmSV4nqOt @mexicoblvd @schnitznthings @NautiMobile @frite...	1412345159	518039263213260800	f	fritesnmeats
Lunch 2day @ 7 Hanover sq b/t water &amp; pearl st. Burger of the week THE GUACAMOLE BLAST. Preorder 9172929226 #fidi	1412345026	518038704817205248	f	fritesnmeats
Shorty's on Good Day Cafe this morning... Handing out cheesesteaks on the streets of NYC. #Shortys #GetPhillyWitIt http://t.co/rXCSuuF6Dx	1412345683	518041461682487297	f	shortysnyc
@LewsView @MyFoxNY We had the best time!! Thank so much.	1412345498	518040682599301121	f	shortysnyc
RT @LewsView: This am on @MyFoxNY authentic Philly Steaks and sandwiches from @shortysnyc awesome. #gdny #nicelid. http://t.co/hENHUIIavF	1412345450	518040484762386432	f	shortysnyc
RT @standupkid: Photo: This is how you do Friday morning: starting the day the Down Under way. @dubpies http://t.co/tkQBSi4pZZ	1412346572	518045187416031232	f	dubpies
RT @LFCNY: @dubpies @11thBar Pies make everything better. And we'll need to talk about some sausage rolls as well :-)	1412345715	518041594600386560	f	dubpies
G1- 46 5 / 6\nG2 47 / Park\n#meatball parm melts.....#yummy http://t.co/R8Z7AQwxr5	1412346216	518043694264750080	f	gcnyc1
Come see us at our new spot on FULTON btw front and south street! Lunch 1130-3! #TGIF @TheSeaport #thaietnamese #sriracha #fries	1412346141	518043383059972097	f	sweetchilinyc
TGIF Mtbll Lovers!!! The  is  stopped at 50th bet 6&amp;7 Aves. Come on by for your weekend fix 	1412345946	518042561554821120	f	mtblls
Disos open for lunch.. 48th bet 6 and 7 ave\n\nCall in orders to: 917-756-4145	1412362939	518053439495241729	f	disosnyc
Quinoa Bowl-HealthFood meets ComfortFood...77Water St.@DowntownNYC @WellandGoodNYC @Brendan_Brazier @BuzzFeed @SteveWynn_ @simonsam @biz	1412362573	518051903004241920	f	thegreenradish1
10/3: The Grub Truck is serving your lunch today at 53rd Street and Park Ave. Preorders call 646-543-BIGD	1412361104	518045740523094016	f	bigdsgrub
Happy friYAY! The truck is located on the corner of Broad & Stone St until 2:15PM today http://t.co/1WWn0vZMe3	1412363500	518055794089000960	f	nuchasnyc
@carlymcalp till 3pm ish	1412363185	518054469683384322	f	gcnyc1
@starrettlehigh looking fwd to seeing all of you today for lunch 11:30-2:30 nyfoodtrucks	1412362950	518053484638531584	f	kimchitruck
RT @LaBellaTorte: Today we are on Fulton @TheSeaport with @ToumNYC @SweetChiliNYC @Valduccis serving up lunch and dessert check it out	1412367540	518072736598745088	f	toumnyc
RT @FoodtoEat: Seaport, @ToumNYC has got you covered for FalafelFridays for lunch and dinner! Preorder for pickup: http://t.co/YoM6xMdbRO	1412366301	518067541407961090	f	toumnyc
RT @thomaskelly: We're doing Spicy BBQ Shrimp Tacos with Corn Salsa & Cotija at @mexicue for Nat'l Taco Day tomorrow.... http://t.co/ThJffQwU...	1412363383	518055302726291456	f	mexicue
PieTruck is at Grand Central - Park Ave & 47th - along with another food truck or five! Service: 11am to 2.30pm http://t.co/YKW1jXcORn	1412361275	518046459368054784	f	dubpies
RT @dumbolot: The sun is shining on @KorillaBBQ @mausamnyc and @mamuthainoodle on Jay & Water st!	1412362471	518051477324320768	f	mausamnyc
Spice up your life with our A Diavolo pizza at W116th & Broadway until 4PM today	1412363710	518056671864946688	f	neaexpress
WALLSTREET WE HERE!!!! TGIF 10/3 11:30 -3PM \n55 WATER ST(SIDE OF OLD SLIP)NYC\nMI VIEJO SAN JUAN  COMING SOON BX NYC http://t.co/YvthBKnlqQ	1412362254	518050566208249856	f	latinkitchennyc
can we come to your next office party? or meeting? we will feed you! catering available for all occasions info@sweetchilinyc.com delivery	1412364903	518061676806283264	f	sweetchilinyc
@Atomox we will definitely try one of these days. Best place to park?	1412367299	518071724806766593	f	schnitznthings
The SchnitzCart will finish off the week on 49th between 6th & 7th! 11:30-2:30! Fantastic schnitz weather out there:)	1412362637	518052171628412928	f	schnitznthings
TGIF!! Make your Friday schnitztastic!:) truck is on broad and Pearl from 11:30-2:30pm! Stop by or preorder 347-772-7341	1412362517	518051669691867136	f	schnitznthings
Today is a perfect autumnal day to FallForLobster, RedHookLobster is at 40th & Broadway all day until 9:00!	1412361094	518045699335016448	f	lobstertruckny
To make up for earlier this week, we're here Midtown!!! 47th & Park ready at 11:30!	1412363728	518056750206169088	f	korillabbq
.@thegold traces America's food truck revolution back to its L.A. roots http://t.co/S7HajdJbwd via @SmithsonianMag	1412367278	518071637909209089	f	papayakingtruck
Enjoy this day w lunch from the FoodTruck on Broadway at 58th St Have you tried our Pastrami filled Knish made w the finest @TheGabilaKnish	1412361069	518045596146745344	f	papayakingtruck
52nd and 6th we are out here for your Friday lunch experience.  Windows are up end your week off right with us the NiceGuys.	1412363943	518057651578482688	f	mrniceguytruck
RT @PhillyGiL: To my Philly folks....u gotta hit this place up when in NYC @MyFoxNY: @shortysnyc here's the link: http://t.co/6NzdRK6tDA	1412363827	518057163244457984	f	shortysnyc
http://t.co/4BFsNCIPlW	1412362225	518050442539175936	f	shortysnyc
RT @MyFoxNY: @shortysnyc here's the link: http://t.co/m8ivPI1Olz	1412362214	518050396871622657	f	shortysnyc
@MyFoxNY awesome!!!!	1412362210	518050382027948033	f	shortysnyc
http://t.co/4BFsNCIPlW ... In case you missed us, here's the... http://t.co/TXHFpq4t5p	1412362149	518050125026197504	f	shortysnyc
Located on 49th between 6/7	1412365420	518063843411783680	f	thepocketful
@The_Levich yesssss	1412365479	518064090582093824	f	funbunsnyc
Thanks to nicolescherzinger for stopping by http://t.co/8I6vGTbADC \n50th st between 6 / 7 ave midtown lunch . FREE Tea egg with any rice	1412363960	518057723506982912	f	funbunsnyc
These handsome adult men wanted to tell you to come to lunch at 46th & Park today. http://t.co/RaSTi6xgCZ	1412361409	518047020888895488	f	nautimobile
Water and Old slip. We back in Wall Street. Today we will be serving only panini from 11:30 to 3pm. We sorry for inconvenience.	1412361994	518049474980360192	f	pontirossifood
Jump start your weekend with your friends  with some hibachiheavenNYC at 46th & 6th!	1412365398	518063752307277824	f	hibachiheaven
Off the streets for private events with the truck & cart today, but you can still vote for us! BestGrilledCheese http://t.co/WymwQHfN8e	1412363131	518054243614605313	f	morristruck
!!! Fri, Oct 3rd 12-3:30 45th st & 6th ave, then 4:30-7pm 18th st & 7th ave!!!	1412362315	518050822970961920	f	thetreatstruck
On Front & Jay this fine Friday. Organic Lentil Soup on board. @DUMBOFoodTrucks	1412362461	518051435997847552	f	thesteelcart
RT @Foodtruckgirl7: @Valduccis you're making me so hungry and it's only 8am!!! No fair! You look delicious. pizza sauce NYCfoodtrucks s...	1412367141	518071061980909568	f	valduccis
RT @LaBellaTorte: Today we are on Fulton @TheSeaport with @ToumNYC @SweetChiliNYC @Valduccis serving up lunch and dessert check it out	1412367096	518070873258225664	f	valduccis
RT @FoodtoEat: TGIF! @Valduccis pizza is at @TheSeaport giving some Free Zeppolis with orders. Preorder online for easy pickup: http://t....	1412365014	518062140755025921	f	valduccis
RT @greenboxny: RT @Valduccis: We will be at the Seaport today freeZeppoli BestPizza @greenboxny @Cater2me http://t.co/LqK8KmNzMg	1412363765	518056905328300032	f	valduccis
@nycfoodtruck @FoodtoEat @downtownlunch here we are at front st & old slip until 3pm. See us all later. TGIF	1412364760	518061074923675649	f	shanghaisogo
TGIF Heading downtown old slip & water, ready by 11:30am.	1412363312	518055003635077121	f	shanghaisogo
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: Pepp
--

COPY users (id, email, password, admin) FROM stdin;
1	peppage@gmail.com	$2a$08$U1gc9WCfAwjTicIM7nUuS.v0spiLrGBUPk711WKesep9cNBAbTX/G	f
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Pepp
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Name: images_id_key; Type: CONSTRAINT; Schema: public; Owner: Pepp; Tablespace: 
--

ALTER TABLE ONLY images
    ADD CONSTRAINT images_id_key UNIQUE (id);


--
-- Name: locations_display_key; Type: CONSTRAINT; Schema: public; Owner: Pepp; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_display_key UNIQUE (display);


--
-- Name: trucks_id_key; Type: CONSTRAINT; Schema: public; Owner: Pepp; Tablespace: 
--

ALTER TABLE ONLY trucks
    ADD CONSTRAINT trucks_id_key UNIQUE (id);


--
-- Name: tweets_id_key; Type: CONSTRAINT; Schema: public; Owner: Pepp; Tablespace: 
--

ALTER TABLE ONLY tweets
    ADD CONSTRAINT tweets_id_key UNIQUE (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: Pepp
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM "Pepp";
GRANT ALL ON SCHEMA public TO "Pepp";
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

