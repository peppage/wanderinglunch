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
-- Name: trucks; Type: TABLE; Schema: public; Owner: pepp; Tablespace: 
--

CREATE TABLE trucks (
    id text NOT NULL,
    name text NOT NULL,
    twitname text NOT NULL,
    weburl text,
    tweet text,
    street text,
    location text,
    retweeted boolean,
    region text,
    regex text,
    lasttweet integer,
    lastupdate integer,
    type text,
    about text,
    foursquare text,
    matcher text
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
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: pepp
--

COPY images (id, suffix, visibility, twitname, menu) FROM stdin;
53860b95498ee26cd484fe30	/81832079_fNoLG8cvJl_IqYaTNF8p9uwsDsglMXnfF2DKZ8X0Tk4.jpg	public	mtblls	t
53e3b619498e4b9015f0bad7	/68150_s6TPzQTspWKu7AI0DXgjZai6xKrtSkWgIdJNkenXMfs.jpg	public	mtblls	f
523887bb11d2ac89551d71ff	/5568483_apwtHKsNfvYc-IjeDL1_oqXIqZsLTUGH_-l1uxxAiGo.jpg	public	mtblls	f
52d32962498e318b0a9942f1	/61382883_iF5gX7tlMJ3CWlWcTkpntPniCUpS3o7H8anOau4wiKA.jpg	public	usafoodtruck	f
4fc7a5d3e4b0647c52b3c26e	/iRvxK7ohXIwK9Ib6wkVgtR46VKRLsamXuElhEtOlNKc.jpg	public	andysitalianice	t
4fc2552fe4b0cec932846e84	/cjaTu8CSMM7HvFDxIUk3I2TF_I8mJyZuejfwTgYLc-c.jpg	public	andysitalianice	f
4feb6e00e4b048145c547997	/wcCcDDUFo3EAkWygR8pGn29HTAv7VKEvPwJgzS6hQcw.jpg	public	andysitalianice	f
51c1ea41498e372d91835cf9	/5067950_pSXIZo_RqO8Hh5AuWcomjr0p3q_pXPUMWe99W8hUGTU.jpg	public	burgersandbites	\N
51a79983498e3044671cd784	/1441492_yfySwml4ChzJ_ni5DxTq-8n2UlecWBWjgxR-ygA6pYc.jpg	public	burgersandbites	\N
5267fa9611d2688bdc4587a2	/2136029_bvqot1MnMJ9IGYsYJkamqTiE_lL96OcfilWMxskhdU8.jpg	public	mooshugrill	\N
5213a7c011d27a56f99dfba3	/11074699_K2ka1_NxiELyTqgjvY3oMN70IUxIlADqRIAb5QpzsLM.jpg	public	mooshugrill	\N
525b3a3711d2040fdcbd6fee	/52031712_DN0C9vfm3iv1geUuFX92Pt0jwgl8NhbGokLj_o0Ebjg.jpg	public	mooshugrill	\N
5261c60411d21ab0209ad83c	/8160578_SqpG5TVwTTu2h7cWpWvihe-_P_-OHSYzoOgMHmImCHY.jpg	public	lobstertruckny	t
4fda1cf4e4b0f6aceebbdb2d	/lKL7uz06jZgB680Vye9zxa_2yQfH96afFExvxaLlRpU.jpg	public	hibachiheaven	f
52e6af38498e26e622e5398c	/4147709_E9hzkLfHAJjdgQ6RT3W29cf-cftJShyXpRthu8riZYs.jpg	public	hibachiheaven	f
52e2aa07498e25b9a084ee94	/12998378_50qpDzH_XwsSlaJpw-f2fDtJsSvQg4TU_ujjdsnyWOw.jpg	public	hibachiheaven	f
4f67b0d4e4b08559c4c60149	/SdNxRS0joKXurf0FEv8_SRg-GeR9lGCN098_ZB2tijA.jpg	public	mexicue	\N
50784742498ec6be8cd3f88e	/155927_ebZApDyXpTKTmvOQHdBTxNc2wJrsZV2QASmpYTNAVJM.jpg	public	mexicue	\N
507efae0e4b09a52c022ec3a	/39213_nH-zcqfLCJqMvG0Nco0LWE4QuRuoL6unlEXJlJbTEF4.jpg	public	mexicue	\N
501fe830e4b0bbddce992f90	/fFBOGONZt5Zr77Vc5g8adoAiBht0f-MBut7GqorVEjo.jpg	public	mexicue	\N
5203e16e498e9e8e0a93b61a	/702028_Fog-6PEF03KateivIPP-hx87Qn6gi7PwnaJv-wTFv3I.jpg	public	carlssteaks	\N
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
521cdb8011d2f79883b5be62	/36501880_zzNkJUOscINjy2aiwKSZEwjfQYJPjqmAsa6zS0dakp8.jpg	public	nuchasnyc	\N
5298ff7011d22a38856168e2	/191726_GHXLJD8lsdPciKdqJErekl1SKPjw5k4N2YuNJC6JRTU.jpg	public	nuchasnyc	\N
51118d62e4b063f95c18d16d	/191726_pTyD4DsW_jGt7E3QJJdH1QB-mHP1ZYggLzXtnZ7j3Oc.jpg	public	nuchasnyc	\N
51dc5a9e498ebf7ad40223ec	/1328035_Ak3fMs2e36r7NvIE_gIDK5XZ9CwrW1DEJa3g1oobp5E.jpg	public	wingnitnyc	\N
525c259b498ea7548cf31f8e	/769710_ZxOOtsSbFVklHIRhXVmTO7ops0Pm0EybRDTgUvGHrSY.jpg	public	disosnyc	\N
5243206b498e78230cd0770a	/54092198_eF4CEteD3zHjOCJzaYssyRXaQElB-GEOy2sqzBFQPm4.jpg	public	thegreenradish1	\N
5192873e498e63958610c2eb	/117715_Jf2pdeF9ztory7puWsPaFE26jmMzPEzjOfPopvTzSjA.jpg	public	polishcuisine	\N
5244712a11d295d581384a17	/22780_QXd0BtJcOWXZwSm_ZG3oXyaNj6Qw5-p8hWQzzH121fY.jpg	public	polishcuisine	\N
50ce269de4b07c1547ebfb2c	/263293_qjcLaRmf5itOMyRiq4AyYZuY2UVjVJk04lO3FTA2CMY.jpg	public	domotaco	\N
4ec59ebacc21b428e0de466c	/4AMXSGP5YGTUHEL3TFKTS5ROVIX4HUTU4MU5ZW1OX5E3URDD.jpg	public	domotaco	\N
50ce2696e4b0881a7ef3ee67	/263293_lcA30Y_JnQGKaaHhRqFUio2HQ8UQkphCWP9yhW4CE3g.jpg	public	domotaco	\N
520912ad11d2f941183dea9f	/13285510_v7K0PTg4FzGI822Jbc9A8K5mUHIxwJPBZB_0xNeEauE.jpg	public	domotaco	\N
529fe66b498e1fd14afe696f	/68150_h0wbg6xbNwrEjXD6uaE12ZDZYF_h55LN99Es520nMBI.jpg	public	mooshugrill	\N
527d2c2711d2c984e85cb11b	/4179871_5FQ2eCC5ZeizUVRLh4tadgEAO1BnJjVQ7pSEvSDwIfQ.jpg	public	biandangnyc	\N
512161e0ebca7d20d6a70104	/4574_ZC6mf3ha1jNXmFUDgtNsN3zIf-NHyqgxA3WkUkOl4mY.jpg	public	biandangnyc	\N
5106b878e4b05ec869ad8b34	/814104_blIawoImaEcqf-Mg89W5A-nEHiZ5jx76BEYHVzz8dnA.jpg	public	biandangnyc	\N
535d6fe9498eeb428f0a49a5	/643701_B0msQNcQCClAiTuYbiNnskLICf99ehNmerkWdhYNR8c.jpg	public	snowday	f
533ddd9a498ebf7fb4775ca2	/36814481_r4TU0Q7tJ6Xum58iZ5olLRY6sV-P4dN3psrhw2ZZKZ8.jpg	public	snowday	f
5362891011d2b40c5f328b6e	/41834822_k1LVelyLVM9gsNt3M70sVjI-QLm_84bgv4c6hoMHPO8.jpg	public	hibachiheaven	t
52e456f2498ea9ece32b66e0	/25812424_w-pfXOZy2D8xWVJY37hGi4VXYiDnicBFvWRiiDOnNhE.jpg	public	carlssteaks	f
5135022ee4b0592185aa975e	/2660256_0rdKd0P0tCYzLf5j7-_3b8HbPNDVCW6S0hHdJGW47Wo.jpg	public	mikenwillies	\N
50ad186ae4b0b639ca7ca234	/295161_qCQYG0XjW1Ji0pSDxM7fWRzxTZRbcYyZbsbPNJo12hw.jpg	public	toastmonsternyc	\N
521649b811d2913e20a1ae87	/5568483_RtMp5aDM_JtBZOI1u48Jy3om4Z672obezdu1uA_UWd0.jpg	public	toastmonsternyc	\N
518a82c9498e068718057964	/25979758_bGWQQ7W2SJI4v7KmU891VcYZGitov6qbSNAnIEt8HTo.jpg	public	toastmonsternyc	\N
5249c4bb498ecd25dde27c5e	/764670_x0RdEOs5TL4SEe2zGgpkzPFBFmlFV7-6UQiVtoFeHaY.jpg	public	goburger	\N
5328764d498e217e55fa24e1	/68150_4QSMIi6zBoyrZ1VeH1Dqb3fEovQswz93yHAPvf2lGmQ.jpg	public	dubpies	t
532879fb498ec68315b3d232	/68150_KF6qgT-viSOMS5bt3lJarsNeEUjlVJn1lbAypyCl1js.jpg	public	dubpies	f
53287a0c498edd9a0567c2c0	/68150_i3UKBmIXHPN4h7gtvSQjnYfikUNmJuGRpjwKP2dLI5Q.jpg	public	dubpies	f
5345d100498eaa611b76f338	/62345083_i2VdE3VeEPlbfUgNv9mWmVmsuL19upJhcHaRX3zje1w.jpg	public	dubpies	f
51dc48a3498efe9483d8417a	/117715_dlhUlP8z_jVejqRlWaCzsJBqg0eoP6rRSjOLpszFA0Q.jpg	private	veganlunchtruck	\N
52ade258498e293fae46e684	/68150_s7DCORg1dB6IJWWdj_e_pZMg4zKZs3S_Tjkff_px7kw.jpg	public	veganlunchtruck	\N
516ef5ece4b0d1c83382c12f	/117715_Gt3J4FMusC7YQjSfEup4O7bAO10z8J4gxmnd0xKnZuQ.jpg	private	veganlunchtruck	\N
51105b22e4b0a7b61fac854b	/117715_vKu0po70jlTD3qN9mXsdNiE6V5Od1hmYMVlUY9xSIP8.jpg	private	veganlunchtruck	\N
526e782b11d2a15e6fb663f3	/8761552_XH612BVbFNOBD2jJVEMDzyawnGF45FygNA3TtdKo6UE.jpg	public	veganlunchtruck	\N
5196816e498eebbaef53fe6b	/32050404_-lVnQ_kgFICQK3OBrfq4QydeDqXhz3ZCRD3TrCvMPxY.jpg	public	veganlunchtruck	f
508af08be4b02ba9b11cc747	/17430999_28ys6GXVoaOZoKPXLLK5GQpVEL8UrC1_1DajRIy8ia4.jpg	public	veganlunchtruck	f
50292d68e4b0d0acd3bb5dbb	/vv6y8qi6JFfXr9QDkIvTPP0fSmbgQ_jGXHCVwDv0c04.jpg	public	veganlunchtruck	f
5161e794e4b02525dbd064d7	/310577_h_ww6Za5XojCZcGVq7-gZluC_YvRnT1EOXY4hwV7KJ8.jpg	public	seoulfoodnyc	\N
51a6433d498e948f8c3dad83	/761163_Ii2oxDO3g277E-5xSX7jHBSSYMlc9UijYRHsbRIRBC8.jpg	public	seoulfoodnyc	f
516d8267498ecda7c1b1b85e	/3179158_Z2holAKb6kR-uU-1uPwUaWaseYuavn6zigr0DRIRJFo.jpg	public	schnitznthings	t
5239ddce11d2ab4765d5cc7f	/5568483_alwOH7sfGU8-pKfLmurfe9rt3pk2G6p90KwFyC6hq1A.jpg	public	sweetchilinyc	\N
506dc9b9e4b0c21f078c3bb3	/22983_XN2GbKo3a5YsNY_ZpiBcjUHTD2if3TWS8r586Uq4cEk.jpg	public	blend_express	\N
5033cee6e4b03e64bc749ee7	/tIyy6IAKcw2SSiX5JSPBCURstZZisntK_46plgrfdJ0.jpg	public	blend_express	\N
5180207390e7374e46b6c165	/49563206_uKsSD-Cd2jjy6FMyR9U_--7DdUBJ7ZUxtdlushxyIAg.jpg	public	freshandhearty	\N
51f15b4d498ee58fec420a7c	/13285510_Q-SBXKFpfroSwQ-QJdezzrh1KaHfHAmLyicy8d5S1jU.jpg	public	parissandwich	\N
5243126c498ea77b19b3a444	/65506790_31Qpx9E-ZjuNve-izmDY6vVxUCMrhgGsnOLn4-fusp4.jpg	public	parissandwich	\N
51b22a0a498ec00d1c45726c	/390807_y2oeK6xR54wk9b1Sfm82Ek09Auv2lNkRTpJOzos3xjU.jpg	public	parissandwich	\N
507b0648e4b0109f3656e2d2	/76137_7JNe3m0dO2MZ7a9rkqa_DTlnrw0LyNitqksFG7_5IC8.jpg	public	lobstertruckny	\N
508abe69e4b01ff7516d118b	/8029486_9wt2tO9BnY5d11Ef0mpAgHAqfK1QMmSvLXglU4fj6Xw.jpg	public	lobstertruckny	\N
500ecc9ce4b0a6d209804d9e	/d2yG6CtTrc8TQAXoEGN68UYAv3DiJIqJvKU65-ApcaU.jpg	public	lobstertruckny	\N
5245c7a1498e0eb9bc097723	/1727660_xLZtYmqATL4pckN_IhgIj0AgUbDAJxywzqbf5PKEooM.jpg	public	lobstertruckny	\N
4fb29dc4e4b0e08c1e225555	/ckjwTj4Fd2cRoZvDQZw_1jYdwuBF4BsfV4ZWc5oElFo.jpg	public	eddiespizzany	\N
4da8977840a3582fb8c49316	/MCGIPRA0XR15JNG4O2YZJQBCRMK05UVTC4T14TOQWRTNMQFZ.jpg	public	eddiespizzany	\N
4fd79157e4b071eb33a9c810	/8zrcTIejD5EBiOJzSobql1_PQWr-i2KmRfgMCYmbK-M.jpg	public	eddiespizzany	\N
4f9c18b0e4b0b38d2f554383	/AQEKYbyPrQt5uMWhy4r4ODm2vSMCqPseJyMhcg55mtY.jpg	public	eddiespizzany	\N
523c930a11d22e1c3012a9d3	/34169985_AiTXirGu6jTaGeWWhhOfl2QIbGVaQjdDg1QCEakqza8.jpg	public	mexicue	t
506dcb8be4b0748e0467de78	/157259_PdYI3Fpzhcz_LoGnBeymaSAZaZCiVVw43c4xaYQQIDY.jpg	public	mikenwillies	\N
51117858e4b0e14064917adb	/263293_EvgjxXJqOivd94q0mbPR_AxkRXuzkFtjOBcOWnXuyQU.jpg	public	mikenwillies	\N
51d31ab97dd28a271207af20	/59958053_5CogfmHgRpBtjkPzVkAgAjK7q9ac0bo8Z1TPwxPIFAw.jpg	public	grillonwheelsny	\N
5008051fe4b0974c844d5003	/oNy0_bsWPyVmjrduzJXpbrAPHjQS0PVbyOCfoRSD9xE.jpg	public	shortysnyc	\N
51a4ee69abd87ea53396c979	/4083549_jMzaCPEId80kWmAaq2oQ9APKf4bLvdeHhy40qPeB9j8.jpg	public	shortysnyc	\N
50045b1be4b0004dbf67c977	/MDweBG1fBnF_fZ1tOghWyHS9qUxGNiJeOrOpoA-fBrY.jpg	public	shortysnyc	\N
4feb2bb8e4b0a47cf49787d7	/-CEaOy-zjgmGzmPRViSeNchwIITBbHgI3lFosreLqIE.jpg	public	shortysnyc	t
5182ad6b498ef6cb59d48783	/39425123_zPh6ih4GAAygbhRJ-pyPdCr5TI3rXafgKyIEEK4HpHY.jpg	public	goburger	\N
501d4734e4b0af03cf473287	/6BUHUmEyYTTh3a2SRjSYRklUlTfQBNbFnnk_hfEojYs.jpg	public	goburger	\N
5012d0d5e4b06fc7ce735a68	/7J2g1YLtx4ma57g4A4CerJJ66OwudjGhFI67JaNl1Qw.jpg	public	seoulfoodnyc	\N
52a0bef911d299250c89f9c7	/349672_Cg8dtcrfQ0WZeSo7BJR61YBG6VzsiMltZP8XIqyHiu0.jpg	public	mrniceguytruck	\N
529ccbc511d21047117cdea2	/68150__CRf8sW9KvXZTkcAQEc4EsnYPgqXA2trmMxy-_AzobY.jpg	public	mrniceguytruck	\N
519babe8498e355d9d35fca0	/65817_6p9jSMaQMqP9QGn3KOIyuDOG15jaLxIPvsdrpZGWdj8.jpg	public	blend_express	\N
5281221811d21e907e460e00	/4195495_akELCvAQ7aY-bfTfHk93g5g5_qcJnQJV7h_gH0FlKUA.jpg	public	milktrucknyc	\N
514360f4e4b0455b303a4d66	/8626436_tfGrSomdm1qEPFKcyb0Q5atmm3DmDeao1W8MotOtOwY.jpg	public	milktrucknyc	t
4f749b3fe4b0f06c04ae2440	/rA31cWGMm0G8EuZFYZBxb3y2OrW3oEo7vCj1L2XR3AM.jpg	public	milktrucknyc	\N
4fee068ce4b0f9bd2b4041f7	/UQwqaF9knSdh4LFRzAhnh7hcl6_dSjDTg1phtqTe_7Y.jpg	public	milktrucknyc	\N
51f4589a498e97316d307dab	/186827_ilvLMlb3AFqgXUQJ43S7IjsLNPxYP3Pw5LEjrqhp6wI.jpg	public	chipsykingny	\N
4e09f3fca12d09aa881a769f	/NTSOFYDIBYVWGE4RYQTBBNIAQESPZ1LLW3Q4TC3TGMROSJPH.jpg	public	nautimobile	\N
5022f267011cfeafe81dab9a	/7EPnN8ReXYQWoZYxzqkH9AQlOe8vFPtVP_60n65i9U4.jpg	public	nautimobile	\N
4e70e35c52b140871b6fa35f	/1TB5ROKJY5NF0GAVS4YS3WZTFCUXXHTPLLBUIK4BU0XD0QA5.jpg	public	nautimobile	\N
51ccc251498e028212e9b1e3	/117715_ozxp6K6iPGwKCzQDARR3BgMcisplkTt0x4LEKDJdBMk.jpg	public	nautimobile	\N
514e42c7e4b0ec8b7e400875	/48992751_ibL8tx_7JPvV3aQmnEevrdibtLP0jWytaChkCdRuhG8.jpg	public	crafflesnyc	\N
4f7deaf5e4b0ffb6a3f2008e	/Xho5Xq8BtpNhEQvH0KRI3yX4kUstFRwTxEDj6QoawcM.jpg	public	palenquefood	\N
51b8a845498e8ebdef064e0c	/761163_j9ai1NfaIpK2TLN8JzXbTwyIhVzuZevNHBV5EpQ7Fh0.jpg	public	palenquefood	\N
52052ef211d22b8ed81dd96b	/36360429_am9ha8rSYxAvCaSMU9ya6lI9MzIgcpR62DH6HS1b-uY.jpg	public	milktrucknyc	\N
53287a41498ef1dfde86d217	/68150_jBIeF8OZP2o4q5lJjB4TeUteiuuczqDDm3s4zQGipGc.jpg	public	shanghaisogo	t
51716b5f498e03d8bc252c48	/11709298_S8klPxq0yPyZw2X9-_0IZyk6TFTn9xi5SWd_6BGCeVM.jpg	public	toumnyc	\N
507dacb0e4b0d8cafc9601e0	/2361939_S3NwwSNVZD-2tAhc3bwAvsYgk9tXwYv0T0yq9ci-ihE.jpg	public	toumnyc	\N
516452a5e4b0e1b216fdbaa4	/26263584_5wpEOb9FygNRBFQySA-pE1t1q_E9jVM_4mx2mnw5fAU.jpg	public	toumnyc	\N
516d98b8e4b0b059e50ff5ad	/117715_BoNkQJO4jPWEtg_ef4-URb7IseoIXnYiP5vkvWJtezg.jpg	public	toumnyc	\N
5280c18811d2e4df572063db	/5354893_5EtQmcwzMnTRFz9qbxjkt9FguCAC4xfW5xwUCyYIrbQ.jpg	public	waffletruck	\N
4fd26038e4b06145dfb72894	/zUVUqzIwbwoFsRrRenEhtDmBSbK2Ry9lzqeuYnmnHG0.jpg	public	waffletruck	\N
4f733c44e4b039d898ce1409	/PQ9G-O3CAtCW6ixkiwHhICEaRn0L3Lz1F95zKcl_GdI.jpg	public	waffletruck	\N
527e823311d2db75dd831ee0	/22419482_1rrrm4nhOKXQsXN25ApmVsGDw4t2J3GyjhfeQPEbClU.jpg	public	waffletruck	\N
51c213db498e0748ab0dca3c	/53641916_5aNKp9fdHx3i_Pi15Z_X6pE3fAsTX35YBQ0nlmZGfaA.jpg	public	morristruck	\N
521f754c498ee4d6fbe8a778	/22491899_EEPqf4HeJFaaFjYabKyScGZ8symjXEgMjPUEkfpJsJk.jpg	public	morristruck	\N
51856452498e6f602088cbe1	/232510_pLk3QUUWFOu82-4SX-ObtA8bw2ZPf61QBOeIuL50T-o.jpg	public	morristruck	\N
50a696b4e4b04d062582a95e	/32050404_qo6ZUnU5LQMoqrAR6YoH5Qz-PdUcD1d1jCheEJy7lng.jpg	public	thepocketful	\N
511a7d64e4b0c6a64118260c	/793192_Dtd9vMRk-pbBJscn1cb7n29zM87iJjZy6rojapRhODk.jpg	public	thepocketful	\N
51424d6ce4b0041cb8df9856	/117715_oxR8_TwNSaCL-_gKDA2i2-1YoRfVVnbfT3M9Bfu4nxE.jpg	public	thepocketful	\N
51800af8e4b07a4a57023def	/9548073_erhzj0ShEDKaz8S8DhlDe90fDjJEIWjilIxO4_zjdGE.jpg	public	thepocketful	\N
531b7d5e498e3df35f261af2	/22402741_aYe825rrQDsEq6E_Pqv35za149PBn1PcT557SaJhOK4.jpg	public	brooklynpopcorn	t
5220dc78498ebd10d150f736	/29917892_nMZHXkfxBukc2QfFqtDBTZSJ1xpMkoO7VGBJmGKkwhY.jpg	public	brooklynpopcorn	\N
5258d3ef11d26d03cc0563a5	/117715_GQ_O1nyBbVlKTaYpRlprc8ZdIEAEftbU4_9hDGjvxsU.jpg	public	brooklynpopcorn	\N
505c9776e4b0643aba1071c7	/5568483_yQrtG73dbug7q06p9IASJmTFnOVgGprIZKbfHjQRcso.jpg	public	biandangnyc	\N
51435e1de4b07d53cf71fd7a	/4486_lUhkecOFThYlMHKai4wDp4lXXiQSPLTq3Nno5WMIz7E.jpg	public	palenquefood	\N
4e6513efc65b2dc8a0bfff6d	/TUQTIKBJPOALJKHN54QRKGISWMQDDOW3WTAECOGJ4FOJTPXI.jpg	public	palenquefood	\N
5245c79c498e057f7d5ff65d	/117715_CEghvDHaxkALy5RxQCAVW-kyM0TAZo2-fIT4e6veJeo.jpg	public	neaexpress	\N
4dfa4a9840a3542ff44549df	/VBAJNQCBWDMP2WKDXJ5QHQ0WYF1MKHZSLUAZZJXKDBDLDUWG.jpg	public	taimmobile	\N
51cb2c41498e9851cecdd49a	/5728350_vuJ4ORu0wHhd-B-f4FTNfsoIhfHgtJRMJc-QEeiYmNQ.jpg	public	taimmobile	\N
504a271ce4b0c65efb6b05f5	/PG0DfZvsxtqv4QM8Xpl6y8Ojahb0UanYwCPSdmuhj_E.jpg	public	taimmobile	t
4fa814d1e4b0d607baf8bd9d	/2drHnu4mqj-uzpwwcJa3MatYGD7KFuxjE472rButWlM.jpg	public	taimmobile	\N
519fa37b498e7adf7e8ebce3	/47170230_A9xVWAtkJBP-vVqUF1q2WlK8yuZTf1CVQz0JcPrHGY0.jpg	public	taimmobile	\N
52013fe1498e5f476bfdcf83	/30611522_DHhazmY8dyNAbmijjHX7jyyfVBEiugL5-GJcTLuYjS4.jpg	public	getstuffednow	\N
523c8b2a498e959b87f8ded2	/39707564_-WCsPSk2ExKeZ8q06DtUQrpt_vcWG9-AzvFoToSdQqY.jpg	public	getstuffednow	\N
51af7257498e0c7f8979c05d	/752258_nUJpoSxZ8p9BBJMG5ISetpo3DDLzycLT_gT3z9fvJmI.jpg	public	getstuffednow	\N
50ca356fe4b05b0bb93edc40	/1590381_NyRIp7fXJtGoJoXp25IcMmufNufPxxvLEj3TVYXRo5g.jpg	private	getstuffednow	\N
50f59e2ee4b0b31f58d6cc1f	/1922740_OhtWiNUDUcN0NE_HB3Tk8vm5qIZcvqxcP2nMDrN8dT0.jpg	public	kimchitruck	t
516ee142e4b04f28d58be309	/36812449_DjR1ynMnMpwj-KmiWPZQldmGQwJ2IEzjSwwmGevqe3U.jpg	public	sweeterynyc	\N
5107e09be4b047c08ade6bf6	/760350_ZaalKVnOYdVAGoQEdugu-1Lws1LubyJBOVpZvJJD1V0.jpg	public	sweeterynyc	\N
50188a43e4b0d35e6d8035b4	/b-fKh6mx2WxCybNQkr9ovk_jv4x7bwJPVFM9RF3M5T4.jpg	public	sweeterynyc	\N
50e71f82e4b07154c72fdc22	/275165_az4RUZ2U7-4cfdnQA1FlMrDLaxwCMriWtlhS_pddjEc.jpg	public	mexicoblvd	\N
5140cc96e4b0ef29f4802508	/4886503_z36ZXtYKGVIHcNLCR18ZdUWtpStRrbf33rInxsr2p1Q.jpg	public	mexicoblvd	\N
525de1d7498ef4b27ada0847	/31827631_CApIgPWaXupe3toLi7iJLb6NxIyn2IDTOjAG0qw-PIk.jpg	public	mexicoblvd	\N
5286645011d228bbd12f9880	/1353667_2qCG26N4ikz7mbvEGkrFkcNLagGqrzRuNyeQ35CCDE8.jpg	public	korillabbq	\N
5231f54311d26e8da5827f3b	/977282_AToQDrlKW5PTNbNGQcB24_BeJNsRMgZTeYmC9P-or38.jpg	public	korillabbq	\N
528e451f11d2a93e4361f565	/977282_wEw3nDjN0NbjC4CgQ00ON0YjdtnMocrfAjXDM4UH63Q.jpg	public	korillabbq	\N
4e4e92c7b0fb088f3c0f14d5	/HTLXSW2D30RGIEYPI0JGR22LUCS5BTXQ0LXDWAOHH4PCVHM4.jpg	public	bigdsgrub	\N
51dd9ddc498efb9a3437e123	/4501533_djr9d2BEP8dg7E48xJjJTa_Yjk0Iy-MmBG6hgIQBLUs.jpg	public	bigdsgrub	\N
513101fce4b006d9c4991bdc	/17248619_XfpmI8dNgmoeHE3BXjV8bL2yuuMTqxU3FqDr4BqX7Ks.jpg	public	bigdsgrub	\N
4fa2d04de4b0489ba3d7936d	/hsPbM0G5l3AsUaI3x6r_VkiSYo4pYlWTKK2S9zqh_KE.jpg	public	bigdsgrub	\N
5176cceb498efe500552cc9e	/21735785_zaQs-7anNinrrQlobBV2AjNxquTXs5g8ZY0NxvoxvHo.jpg	public	steaksncrepes	\N
523b2edc11d265bf373f82a0	/8853695_cjpq3trk4bFpcU1oHWwj4XxwwD9ZI169sNncUyOQoM8.jpg	public	steaksncrepes	\N
53287ac3498ee8ce8841a510	/68150_pNBQ4zhtsUiGR_kyfk0HziUGMzyIQwYcYpJ3VpZf7tk.jpg	public	thegreenradish1	f
51cc7075498e8d24309aea57	/991186_cg_CePJhqcT81QY5l1L4eB3MQxy_QlsRh4zmZDk8cFM.jpg	public	biandangnyc	t
4e42f5ecaeb7f6be72c39c70	/JC5VO3Z50HMMMVLCCGWDQPMKF4W01VBXP1QS2LFESR55UHIX.jpg	public	fritesnmeats	\N
506f12efe4b0bb9551703ca6	/2219480_LuuyF3peyimVfdQvb7tj9V-FHAEA0z1KmaSfMf9vKkU.jpg	public	fritesnmeats	\N
4f832947e4b0cd6f644ef74a	/qCgaHGVJ9rFDkC5DFKEKLBBekoxb6PRDRfuWV7neue0.jpg	public	fritesnmeats	\N
514e42a8e4b0d91e975b3db9	/48992751_womoOVd5bv-2KopmWjWEHA_WsyoWQITjAyXBuM4Ciz8.jpg	public	crafflesnyc	\N
5109aed2e4b01d2a5b69b022	/117715_0jgrjk5IsUFppNAL0NtebyMYoz1JMdzrnWAIjrLMHZw.jpg	public	schnitznthings	\N
5012e555e4b0dd18ec16bd37	/mZQAOCmv5lnRZ1qOUTwDXk-MLC-X-p01AfECgfLJC2I.jpg	public	schnitznthings	\N
5086e523e4b02ca59cae7bd4	/2361939_1JvatS0wOUdQQIaTmd4Vmk8bgr7aFYOR7LaMkRio0X8.jpg	public	mausamnyc	\N
513f646ce4b0b1892aaae1bc	/13285510_LmdJLKoCS9fSwm3wy96lcieTczjsLuxAEUnU3FlZDlo.jpg	public	mausamnyc	\N
51194bbae4b0cd237850b223	/793192_FQUO1SFGyLkg5NRz6VUYl3_zmFgfy0Mh8gL1unO8ijM.jpg	public	mausamnyc	\N
50f99bcee4b08ca132377f78	/4611139_CEH3eveI6uxlRVQLet5Fpa_sNfJwAzfheMTYSBplO5Q.jpg	public	thecrepestruck	\N
513b9b7de4b04f7024bc158a	/45519738_eDUGOpHYwiR5C3VUps1gQ1YDIq0Di3WMfuirGs2EVBk.jpg	public	rickshawtruck	\N
4f8dc377e4b0ca2accf75652	/EKcue5yGEyaPnBymSd_HtBxWEZl4grYSOXMhw-gqpTs.jpg	public	rickshawtruck	\N
4fb6bb41e4b066430032e4ca	/HHZWTU3POi_yJE4GU0zI_NjZNerm5y3MjjxddcV5ZMs.jpg	public	rickshawtruck	\N
4fd0f054e4b0757383b97c0f	/MbR1inb3VKXu0PQMsCkHkHGftYq0E8CDbYG3BLRRGaE.jpg	public	thecrepestruck	\N
5197fe76498e1c056c96d21b	/117715_m462oAqyqBN12xyWCOyzYR6-1gtYrUa8BiX9r9OybE8.jpg	public	kimchitruck	\N
4e3da652d4c058f9dc087a6c	/QEOIS2W35WLTHYK00QC04LKKX4X1SYW3DDI45X30HSKTJENQ.jpg	public	kimchitruck	\N
501975c5e4b092f6a51ef338	/bI7RrGcK_moyn-kJICa1OCciBVuYYykwCMGlea6mcxg.jpg	public	kimchitruck	\N
4e00e61aa12db1129557e99c	/WSUNYIB0YFVRCTXB13UCRCTANZUG0DO0X2FWCUYYILU4TCGB.jpg	public	kimchitruck	\N
51378e9ce4b071feb46ef7cc	/18792384_RSm8zhe_6kUOxy91taByfRjTDSLp7stH7PI41aJHOrU.jpg	public	bobjotruck	\N
5249b50c11d2d415e3c6b017	/769710_HOnpTjl0b6qd4-yoPpg9lXZGBy-ZKikqzLlFWw2sQfs.jpg	public	bobjotruck	\N
4fe20639e4b05dcdf7f5737c	/l9UdGGevddtOhDk6scQjcy1-TbVBX-wf8Gf56jBIRIg.jpg	public	bobjotruck	\N
5249b1c511d23e54343ae083	/769710_HUiZ7dJrNbdnPYV-DTQRr1z0zgoxFx9KMC_Y-OQ6O2o.jpg	public	bobjotruck	t
526e8aee11d299d16e74b447	/67629862_ZPeS1alTFabw1hPqq8PCcGF1SRFynqA23OgkKg8yc00.jpg	public	lovemamak	\N
521b83c411d29ec0512f89b3	/255980_1U9yRWzBKuIDLReBhmBs45qJ0mtHu7pzL_Fv4T9gTss.jpg	public	lovemamak	\N
520f87b511d2e753e7955853	/44_gUd2HlRFt-yMUFcOdI_EUCdz5NK86hKk-3kHwZhHou0.jpg	public	carpedonutnyc	f
5199097e498ea36447e54093	/40899881_hbjUdavpBfT-sLaBhv3pbZydT1tgs9v-Maw12j9I3Xs.jpg	public	carpedonutnyc	\N
5197cb68498e8d409a89ec1b	/1847096_oRB5R_owQW40gVWlJhNNsh9_0bEq2D8Rt3Zod9HUbUg.jpg	public	disosnyc	\N
51dc5fec498e4e9be748eac4	/22801_gX0atVT6Jt_H6FPXuYAqHD4VzO5jAmS4SVid_ZLkk5U.jpg	public	disosnyc	\N
53287c9c498e4b30223220d1	/68150_mMquObtK1F2QjX3VWuhYK2MtjUA9i5QRzexf9zWrBOQ.jpg	public	thegreenradish1	t
50e719c2e4b0e263423e547e	/15471_4uN0tddGW5orNGh02xhxbiAOGUpAAy3rIWEotoRgB_M.jpg	public	tacobite	\N
5208f543498eaeeaaad3ce52	/15629_P_UAUr_S-OO0R12wNp8LDPwr-ZbfPiWeG0Q0rrjW6Ww.jpg	public	sweetchilinyc	\N
51f2be1f498e71235db5b61b	/117715_mGfGU0UGjUMhgqgwrDPf2f44NZtfMrobqJMF8ahsrjY.jpg	public	sweetchilinyc	\N
51645882e4b0bcb0cb0c7ef3	/7511393_dEJJLGO8ljFPMA_kFidoz1wpWZ-k6mHpqYnuRwoBpRg.jpg	public	philssteaks	\N
4f753600e4b07eec20023ddb	/zUb4OswXiQLnF_k2xnx7AdupnEIl1nuGyIuFcmFWf8Q.jpg	public	thetreatstruck	\N
4fbfe026e4b04422a08a40f6	/Han8Z4R-SQ615pLoN2lRdPfKEFa6UW2yudSOxXmJtts.jpg	public	thetreatstruck	\N
51461b9de4b0bb73a6821e97	/1102787_UDt7OJpexNs8VPrehVDsp9EtfUJnMhKzJ2tTXuof06M.jpg	public	thetreatstruck	\N
4fbfebe9e4b0a3bda0340383	/Brw9_z178IK92xMEXLCSSZrP0-99GXjutCp7dHCi5CQ.jpg	public	thetreatstruck	\N
51eae36e498e58d50e5683ba	/331066_SArUzXa_cz_-YMQco1rwYAfU8a99TZCHJX9a2WA3fHg.jpg	public	gcnyc1	\N
5106bdece4b051d6cb82a376	/1922740_Eqg3x5oj7wks2XGfudNYIAzcCuZHJiWpgLP1CCbonEE.jpg	public	gcnyc1	t
52407581498e6271e84d0d20	/663291_BQuSIJb2d0ODso7gvZiRLuvYbp3sg4FwHG2u0kAwsmE.jpg	public	gcnyc1	\N
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
-- Data for Name: trucks; Type: TABLE DATA; Schema: public; Owner: pepp
--

COPY trucks (id, name, twitname, weburl, tweet, street, location, retweeted, region, regex, lasttweet, lastupdate, type, about, foursquare, matcher) FROM stdin;
langos	Langos	langostruck	http://www.langostruck.com/	\N	\N	\N	\N	\N	\N	1409413341	\N	Hungarian	\N	537a883c498eb7fac064409f	\N
mtblls	Mtblls	mtblls		 Ok Mtbll lovers it's FRIDAY!!!!  If you are around 50th bet 6&7 come by the Mtbll  for your favorite ball.... http://t.co/L4rZonpZnI	50	 50th bet 6 & 7 	f	up	\N	1409757158	1409324788	Italian	\N	504fb7fde4b0bc88c3a6b614	\N
biandang	Bian Dang	biandangnyc	http://www.biandangnyc.com/	Sometimes taiwanesefriedchicken and SaltnPepperChicken don't get along, but they always make up. internetfriendday on 53rd & Park!	53	 53rd & Park	f	up	\N	1409753871	1409753871	Taiwanese		4d712874722ef04d04160d9c	\N
papayakingtruck	Papaya King	papayakingtruck	https://www.facebook.com/papayaking	Lunch: 58th and Broadway\nDinner: 65th and Broadway\n\nAll Meals: St Marks Pl and 86th St http://t.co/AmctDSCpMg	58	 58th and Broad	f	up	\N	1409757349	1409757349	American	\N		\N
yankeedd	Yankee Doodle Dandy's	usafoodtruck		What up in Brooklyn?!  We're at DUMBO lot at Jay and Water St.  We'll be here till 3.  Best chicken tenders in the city.	Jay and Water	 Jay and Water St  	f	bkl	\N	1409758767	1409758767	American	\N	52b497e1498eed13ead2b84c	\N
freshhearty	Fresh and Hearty	freshandhearty	http://freshandheartynyc.com/	Get your Soup & Panini on with Fresh and Hearty! We parked on 46st btw 5th & 6th ave from 11am to 3pm. Call now 4 free delivery! @3474402467	46	 46st btw 5th & 6th 	f	up	\N	1395241942	1390493878	Soup/Salad/Sandwich		51801f7a90e7374e46b6239f	\N
andysitalianice	Andy's Italian Ice	andysitalianice	http://andysitalianicesnyc.com/	Morning Ice Lovers - Were OPEN in Bryant Park today(40th & 6th Ave) until 4:45p. After, find us at our usual spot in UnionSquare until 9p!	40	 Park  40th & 6th Ave  	f	up	\N	1409768677	1409753341	Dessert	\N	4df26c2bae609e69dd95d2fc	\N
taipanexpress	Taipan Fusion Express	taipanexpress		Good morning we are serving lunch at 46 st between 5&6ave from 11:30 to 3pm @FoodtoEat @midtownlunch @nystfood	46	 46 st between 5 & 6ave 	f	up	\N	1408622100	1408622100	Thai/Chinese/Indian	\N	532b1b92498ea6c0d1026802	\N
latinkitchennyc	Latin Kitchen	latinkitchennyc	http://www.latinkitchennyc.com/	Goodmorning NYC! Today Mon 9/2 11am - 3pm 26th st. Bet FDR DRIVE & 1ST AVE NYC\nhttp://t.co/MPHGwjSFxE http://t.co/WTIEPuPToT	26	 26th st  Bet FDR DRIVE & 1ST AVE N	f	mid	\N	1409755960	1409669039	Mexican	\N	53878518498ef00115dbdea1	\N
trucktotable	BistroShopp	trucktotable	http://bistrotruck.com/	55St & Broadway until 4pm. Let's goooo	55	55St & Broad	f	up	\N	1409444583	1407427421	Moroccan	\N		\N
burgersn	Trusty Burgers & Bites	burgersandbites	http://www.burgersandbites.com/	West 29th & 11th for a quick breakfast and the lunch we have all grown to love! 6am-2pm let's grow this neighborhood together!	29	 29th & 11th 	f	mid	\N	1393004953	1392895105	American		5170143a498e802b42628e48	\N
hh2	Habachi Heaven 2	hibachiheaven	http://www.hibachiheaven.com/	@midtownlunch HH2 is on 46st bet 5 & 6 Ave Come get ur YumYum	46	 46st bet 5 & 6 	f	up	hh2 is (in|on) (.*?)($|\\.|\\n)	1409756213	1400077040	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	hh2
phils3	Phil's Steaks	philssteaks	http://www.philssteaks.com	Whiz Wednesday at the Seaport! Front and Fulton 12-10 pm	none	 Front and Fulton  0 	f	none		1409758274	1409758274	American		4f15b382e4b0725660ea9f31	\N
polish	Old Traditional Polish Cuisine	polishcuisine	https://www.facebook.com/pages/Old-Traditional-Polish-Cuisine/315496671902708	Serving something special on 47th b/w Park & Lex ComeAndGetIt Lunchtime	47	 47th b / w Park & Lex 	f	up	\N	1409770403	1409758568	Polish		51435df4e4b0823a398ebc8a	\N
frites	Frites 'N Meats	fritesnmeats	http://www.fritesnmeats.com/	Lunch 2day @ Hudson & king. Burger of the week THE SPICY JAZZ. Preorder 917-2929226 soho	none	 Hudson & king  	f	none	\N	1409752633	1409752633	American	This is a good burger but this truck is interesting because of the many toppings they carry and their burger of the week. 	4ae9d217f964a520bcb621e3	\N
domo	Domo Taco	domotaco	http://www.domotaco.com	Sorry @DUMBOlot the truck is feeling a little under the weather and will be off the streets for a few day. stay tuned for more updates!	dumbo	dumbolot	f	bkl	\N	1409752383	1409752383	Asian Fusion		4ed90a2e77c8274efb746d83	\N
mooshu	Moo Shu	mooshugrill	http://www.mooshugrill.com	Catch the MSG truck down at @TheSeaport on Front & John st or Lil Shu on 50th & 6th!	none	 Front & John st 	f	none	\N	1409753313	1409753313	Chinese	Moo Shu grill is a slight twist on typical Chinese <a href="https://en.wikipedia.org/wiki/Moo_shu" target="_blank">moo shu</a> The three Moo Shus option is enough for lunch and you can pick and choose a different protein for each. In my opinion the chicken is the best but it is dark meat. </p><p>It's easy to order as there is one window for ordering and for picking up when your name is called.	52090e45498e5500a6bd41fb	\N
vspot	Hit your V Spot	vspot_truck	https://www.facebook.com/VSPOT.TRUCK	Back at 52nd and 6th!!! :)	52	 52nd and 6th	f	up	\N	1409739596	1409739596	Vietnamese	\N	53c9479b498e2dfa7e205ff0	\N
paris	Paris Sandwich	parissandwich	http://www.parissandwiches.com/	Dumbo join us for lunch at Front and Adams today @DUMBOFoodTrucks @jenchung dumbofoodtrucks loveparissandwich	none	 Front and Adams @	f	none	\N	1409759653	1409759653	French/Vietnamese		519e4ed0498e4f27e64c177a	\N
lobstertruck	Red Hook Lobster	lobstertruckny	http://redhooklobster.com/	Summah ain't ova and eithah is lunch! BigRed is still at 53rd & Park! EndlessSummer FallForLobster	53	 53rd & Park	f	up	\N	1409763306	1409763306	\N		4dc597c57d8b14fb462ed076	\N
eddiespizza	Eddie's Pizza	eddiespizzany	http://www.eddiespizzany.com/	Wednesday dinner 74th st at 3rd ave. ues eddiespizza http://t.co/LKbva4qYYL	74	 74th st at 3rd ave  	f	up	\N	1409775299	1409775299	Pizza		4c0cf412b4c6d13ae4850c30	\N
chipsy	Chipsy King	chipsykingny	http://chipsykingny.com/	Kasar truck is at union square\nBroadway and 16th street\nAll day until 8pm	none	union sq	f	none	\N	1407255461	1407255461	Fries		51bb5c43498ee06e13d0d31f	\N
miamifood	Miami Food Machine	miamimachinenyc	http://www.miamifoodmachinenyc.com/	RT @YouGotSmoked: Park Ave btw 33rd St and 32nd St from 11:00 to 3:00 today! New York Aged Cheddar Mac and Cheese! Delicious nyc http://t...	33	 Park Ave btw 33rd St and 32nd 	t	mid	\N	1389964561	1389964561	Mexican		514b53aee4b00c3e98ec25e9	\N
hh3	Habachi Heaven 3	hibachiheaven	http://www.hibachiheaven.com/	@midtownlunch HH3 is on 46st bet 5 & 6 AVe Come get ur YumYum	46	 46st bet 5 & 6 	f	up	\N	1409756213	1399476250	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	hh3
mexicue	Mexicue	mexicue	http://mexicueny.com	Not sure where to find us? Our Spots are: 40th St (btwn 6th Ave & Bway), 7th Ave (btwn 29th/30th st) & at Broadway Bites in Herald Square!	40	 40th St  btwn 6th Ave & Bway  	f	up	\N	1409777804	1406053689	Mexican		4c51a6a71c67ef3ba6b61ab9	\N
carls	Carl's Steaks	carlssteaks	http://carlssteaks.com/home/	Welcome back Midtown East! Grab your Carl's famous Cheesesteak 47th st & Park Av till 3 @MLB @UBS @FoxNews @SiriusXMNFL @SIRIUSXM GOT WHIZ?	47	 47th st & Park Av 	f	up	\N	1409754560	1409754560	American		51a78330498e3fc1f22d771e	\N
mikenwillie	Mike n Willie's	mikenwillies	http://www.mikenwillies.com	Happy Taco Tuesday!! South st seaport Front St. & Fulton St 12-8 ComeGetSome	none	 Front St  & Fulton St   	f	none	\N	1403394007	1402414859	TexMex		4f205f0ee4b0294b35a1178b	\N
funbuns	Fun Buns	funbunsnyc	http://j24f.com/funbuns/	Pork , beef, chicken, duck.  \nYour lunch your choice.  We have them all on 50th st between 6 / 7 ave midtown	50	 50th st between 6 / 7 	f	up	\N	1409756433	1409756433	Asian		4f8d9663e4b021137aa2bdde	\N
dels	Del's	delsnyc	http://instagram.com/delsnyc	We apologize for being MIA the past 2 days. We've been preparing for the hottest day of the week! Come find us at 21st & 5th Ave until 4pm	21	 21st & 5th Ave 	f	mid	\N	1409753454	1409149941	Sweets		519bb56b498ed2dfa950ace2	\N
lukeslobster	Luke's Lobster	nautimobile	http://lukeslobster.com/	46th and Park now. Have a super nice day.	46	46th and Park n	f	up	\N	1409758926	1409758926	Seafood		4dc81239b0fb5556cd2f3023	\N
craffels	Craffles	crafflesnyc	http://www.craffles.com/	Happy holidays!!!\nMake ur holidays sweet with our delicious crepe or waffles. Our location for today. Hunter college and union square.	none	union sq	f	none	\N	1406406041	1388428190	Crepes		514e426ce4b05bcb261d910e	\N
yume	Yume Teriyaki	yumefoodtruck	http://yumeteriyakigrill.com/	Yume is on Hanover and Water today for lunch. Start the weekend the right way :).	Hanover	 Hanover and Water 	f	none	\N	1400251565	1400251565	Japanese	\N	530cdc14498ee06c95ab14e0	\N
deliheaven	Deli Heaven	deliheaventruck		@downtownlunch correction we are on king&varick today. The word of the day is amore for ur free upgrade. SoHo get ur deliheaven on	varick	 king & varick   	f	none	\N	1392220340	1392220340	Deli	\N		
grillwheels	Grill On Wheels	grillonwheelsny	#	Parked on 47th off Park Ave today! schnitzel crazy chickenshawarma yummy	47	 47th off Park Ave 	f	up	\N	1409752583	1409752583	Kosher		51b0bf31498e9b68db75612c	\N
schnitzel	Schnitzel & Things	schnitznthings	http://schnitzelandthings.com	Morning guys! The Schnitztruck will be on 47th street b/w park and lex once again. 11:30-2:30pm. Stop by or preorder 347-772-7341	47	 47th street b / w park and lex 	f	up		1409780584	1409752626	German		4a6640b3f964a5204cc81fe3	(schnitztruck|the truck)
shortys	Shortys	shortysnyc	http://www.shortysnyc.com	Up and running @DumboLot Jay and Water Dumbo Brooklyn FoodTruck  Cheesesteak ChickenCheesesteak RoastPork BroccoliRabe Salads Fries	dumbo	dumbolot	f	bkl	\N	1409758024	1409758024	American		4faea2cce4b08a88c5dc5d05	\N
toastmonster	Toast Monster	toastmonsternyc	http://www.toastmonsternyc.com/	RT @starrettlehigh: We try not to pick faves but we can't lie. Mac & Cheese w/ Sloppy Joe Sandwich from @toastmonsternyc is ridic. Menus: h...	starrettlehigh	starrettlehigh	t	none	\N	1409725098	1407511623	American		50ad1829e4b087613d696bc4	\N
tacobite	Taco Bite	tacobite	http://www.tacobite.com/	Today we are on\n47th St\nBet\nPark Av / Lexington Av	47	 47th St Bet Park Av / Lex	f	up	\N	1406907223	1406907223	Mexican		503ba49ae4b0fad35eb7a8dc	\N
goburger	GO Burger	goburger	http://www.goburger.com	We're on 91st and Amsterdam for dinner tonight. See you soon!	91	 91st and Amsterdam 	f	up	\N	1402176073	1398896034	American		4c06b3eccf8c76b0a4eb3a65	\N
dubpies	DUB Pies	dubpies	http://www.dubpies.com/	pietruck - NYCs first & only savory pie & flat white truck is @ Varick Ave & King St. until 2.30p	Varick	 Varick Ave & King St  	f	none	\N	1409789885	1409315033	New Zealand meat pies	\N	4eb825a62c5b53141b78bfb6	\N
cinnamonsnail	The Cinnamon Snail	veganlunchtruck	http://www.cinnamonsnail.com/	Want a pair of free tickets to this years Vendy Awards (9/13 on governors island)!?!\n\nPost some yummy yummy food... http://t.co/2j6IkFSGj1	13	 9 / 13 	f	mid	\N	1409782996	1409782996	Vegan		4c263af6a852c9287537e66c	\N
seoul	Seoul Food	seoulfoodnyc	http://www.seoulfoodnyc.com	Come to 51st street, between Park and Madison - it's lunch time!!	51	 51st street  between Park and Mad	f	up	\N	1392220033	1392220033	Asian		4e74afad88775d593d9a7eb5	\N
snowday	Snowday	snowdaytruck	http://snowdayfoodtruck.com/	CALL FOR LUNCH! @BLDG92 BROOKLYN NAVY YARD BLDG 5 11a-3pm @SITUSTUDIO @BrooklynGrange @RooftopReds @TheDoeFund	BROOKLYN	BROOKLYN NAVY YARD	f	bkl	\N	1409792576	1409230713	Comfort	\N	533ddd4a498e774b8250a69b	\N
schnitzelcart	Schnitzel & Things Cart	schnitznthings	http://schnitzelandthings.com	The Schnitzcart will be back on 27th & Park ave today from 11:30-2:30pm. We hope to see you there:)	27	 27th & Park ave 	f	mid	\N	1409780584	1409752743	German	\N	4a6640b3f964a5204cc81fe3	(schnitzcart|the cart)
mrnice	Mr Nice Guy	mrniceguytruck	http://mrniceguynyc.com	It's Friday yayyyy!!! We are on 52nd &6th start your holiday weekend off right!! Tag us and follow us.	52	 52nd &6th sta	f	up	\N	1409662366	1409321608	American		520bbbb211d26afae232ec59	\N
elpaso	El Paso Truck	elpasotruck	http://elpasony.com/	Good afternoon twitters ;-) today we are at 97th and Columbus Ave, stop by get your Tacos burritos enchilada\nTacoTuesday foodtruck	97	 97th and Columbus Ave  	f	up	\N	1408483439	1408483439	Mexican	\N	523c911f04937624937304c5	\N
sweetchili	Sweet Chili	sweetchilinyc	http://sweetchilinyc.com/	We are @TheSeaport today on John btw south & front!  thaietnamese lunchtime hungry topchef foodporn http://t.co/rDjvuXRiFh	none	 John btw south & front	f	none	\N	1409772584	1409154294	Asian		51a8c802498e2165ca855a19	\N
palenque	Palenque	palenquefood	http://www.palenquehomemadecolombianfood.com	Palenque is happy to be serving lunch @ Dumbo Jay st & water St until 3:30 pm!	Jay st & water	 Jay st & water St 	f	bkl	\N	1409502057	1409330263	Colombian Fusion		4e84f424dab45bbd2617dc62	\N
neapolitan	Neapolitan Express	neaexpress	http://neapolitanexpress.com/	NeaExpress, We are on E 33rd. & Park Ave. and 20th St. & 5th Ave.	33	 33rd  & Park Ave  and 20th	f	mid	\N	1409357818	1409161270	Pizza		51c8864c498e0ac96c14433e	\N
taim	Taim Mobile	taimmobile	http://www.taimmobile.com/	It's a perfect day for food trucks! Taim is on 20th/5th with your favorite falafel, hummus, smoothies, salads and more	20	 20th / 5th 	f	mid	\N	1409765746	1409757716	Mediterranean		4cf2c5321d18a143951b5cec	\N
blend	Blend	blend_express	http://blen02.wix.com/blendnyc	Hudson off Varick and charlton.   We here for all your dining services need be...	Varick	Hudson off Varick and charlton  	f	none	\N	1409760568	1409760568	Latin Fusion		4fa94528e4b0f8fbf13317e6	\N
milktruck	Milk Truck	milktrucknyc	http://www.milktrucknyc.com	Correction: Bessie's actually at 25th & Park	25	 25th & Park	f	mid	\N	1409759856	1409759856	American		4e823c0229c2dbb2b7043972	\N
wafelKastaar	Wafels & Dinges Kastaar	waffletruck	http://www.wafelsanddinges.com/	Momma Truck @ Wall Street till 4:30pm\nKastaar @ Queens College till 10pm\n\nVedette @ 60th & 5th till 8pm		Queens College	f	up	kastaar( truck)? (.*?)(all day|till?|until|\\n)	1409803194	1409756267	Belgian		4a416369f964a52036a51fe3	\N
shanghai	Shanghai Sogo	shanghaisogo	http://www.shanghaisogo.com/	Wednesday lunch done right with Asian Tapas Truck @47th st, between Lexington & park ave until 3pm.	47	@47th st  between Lex	f	up	\N	1409753779	1409753779	Asian		5258369d498e13def2bef2cb	\N
mausam	Mausam	mausamnyc	http://www.mausamnyc.com	delicious authentic Indian lunch @52 Street & 6 avenue	52	@52 Street & 6 aven	f	up	\N	1409750008	1409750008	Indian		50730eebe4b0f3224431dc5d	\N
toum	Toum NYC	toumnyc	https://www.facebook.com/ToumNYC	RT @nycfoodtruck: . @CarlsSteaks @ToumNYC @Chefsamirtruck & @dubpies are BRINGINGIT Sun., 9/7. at the @Prospect_Park FoodTruck Rally: htt...	none	 9 / 7  at 	t	none	\N	1409788449	1409788449	Lebanese		500eedb0e4b062ee00577957	\N
wafelMomma	Wafels & Dinges Momma	waffletruck	http://www.wafelsanddinges.com/	Momma Truck @ Wall Street till 4:30pm\nKastaar @ Queens College till 10pm\n\nVedette @ 60th & 5th till 8pm	Wall	Wall St	f	none	momma( truck)? (.*?)(all day|till?|until|\\n|!)	1409803194	1409756267	Belgian		4a416369f964a52036a51fe3	
morris	Morris Grilled Cheese	morristruck	http://morrisgrilledcheese.com/	2x the cheese today! Truck at 51st & Mad, Cart at Metrotech!	51	 51st & Mad  	f	up	\N	1409756473	1408635382	American		4e0e0b3caeb7a5b33ee5dac1	\N
pocketful	The Pocketful	thepocketful	http://thepocketful.com/	On 49th between 6th and 7th	49	 49th between 6th and 7th	f	up	\N	1409758081	1409758081	Mediterranean		4db8bcd790a0e3f61d601888	\N
brooklynpopcorn	Brooklyn Popcorn	brooklynpopcorn	http://brooklynpopcorn.com/	Hello 70th and York Ave. we are back and we have Cinnamon Toast Kettle Corn!!!!! We are cooking all our famous flavors fresh. See you soon!!	70	 70th and York Ave  	f	up	\N	1408401114	1403197119	Popcorn!		514a0737e4b09c3e77279d83	\N
crepestruck	Crepes Truck	thecrepestruck	https://www.facebook.com/thecrepestruck	Come ceck out the Brazzers promo truck in Time Square 48 & 7 ave today till 4pm. http://t.co/wUDdRIZpAh	48	 48 & 7 ave 	f	up	\N	1406998391	1406998102	Crepes		4dfb854918386e743d9869e3	\N
getstuffed	Momos & Buns	getstuffednow	http://www.chinesemirch.com	RT @GovIslandFood: 1/3. Only a few more days till Gov Island gourmet food market powered by @livefastgroup opens for the summer. @Getstuffe...	none	 1 / 3  	t	none	\N	1408198481	1400698983	Chinese Fusion		4fa016cbe4b05d0fc11262c5	\N
kimchitaco	Kimchi Taco	kimchitruck	http://kimchitacotruck.com/	Mornin midtown ! Today you can catch us on 55th st at 6th ave. From 11:30-2:30 nyfoodtrucks midtownlunch	55	 55th st at 6th ave  	f	up	\N	1409744733	1409744733	Korean Fusion		4d6ee122b45b59417c6a6778	\N
bobjo	BobJo	bobjotruck	http://www.bobjo.net	Hello NYC ! We r open at 47st  between park and lex ave try rice bowl and rice burger , bibimbop burrito come by and enjoy thank you !!	47	 47st between park and lex 	f	up	\N	1409758960	1409758960	\N		4e3add0c88772c3bf12772da	\N
mamak	Mamak	lovemamak	http://www.lovemamak.com/	RT @BalaboostaNYC: Don't miss Taim's golden falafel at the Taste of Jewish Culture festival this Sunday on Madison/4th http://t.co/pXmrSL...	none	 Madison / 4th    	t	none	\N	1408912702	1406118417	Asian		51c4cffa498ec876f564a0b4	\N
carpedonut	Carpe Donut	carpedonutnyc	http://carpedonutnyc.com/	Open @ 51st and Park	51	 51st and Park	f	up	\N	1409226510	1409226510	Sweets	They only server one kind of donut here, the apple cider, but it's a pretty good one. They are fresh and still hot when you get them. They have donut ice cream sandwiches but you should know the entire thing is in the freezer so you will get a frozen donut as well.	5169892c498e0522481eea97	\N
sweetery	Sweetery	sweeterynyc	http://sweeterynyc.com	Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIyYdw	none	 Hudson / King St 	f	none	\N	1409744103	1409744103	Sweets		4a28d919f964a52056951fe3	\N
gorilla1	Gorilla Cheese 1	gcnyc1	http://www.gorillacheesenyc.com/	G1 - 37th / Broadway\nG2- 26 11/12 @starrettlehigh\nComeToTheCheeseYo\nStill rockin the Ruben Melts due to high demand	37	 37th / Broad	f	up	g1(.*?)(\\n|g2)	1409795523	1409757953	American		4dc2d3e352b1c1fb37f1e945	\N
mexicoblvd	Mexico Blvd.	mexicoblvd	http://mexicoblvd.com	Buenos dias! Tacos, Tortas, Flautas, Quesadillas, Guacamole... Delicioso Midtown 51st & Park	51	 51st & Park	f	up	\N	1409783502	1409148600	Mexican		4f4e55aee4b04c96fba5b149	\N
korilla	Korilla BBQ	korillabbq	http://korillabbq.com	Now serving dinner at Columbia Univ. at 116th & Amsterdam! nyceats foodtrucks		Columbia	f	up	\N	1409780124	1409780124	Korean Fusion		4cc701aa01fb236ab070baba	\N
bigds	Big D's	bigdsgrub	http://bigdsgrub.com/	52nd Street btwn 6th and 7th Street	52	52nd Street btwn 6th and 7th 	f	up	\N	1409764853	1409760236	Korean Fusion		4c968b907605199c2eaec2a3	\N
steaksncrepes	Steaks N Crepes	steaksncrepes	http://steaksncrepes.com	50 st bet 6 & 7 ave for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	50	50 st bet 6 & 7 ave for lu	f	up	\N	1397096188	1374766188	American		50f44167e4b0af5bf46321ce	\N
phils0	Phil's Steaks Big Jawn	philssteaks	http://www.philssteaks.com/	It's Phil's Phriday! \nOG Jawn: 51st n Park\nBig Jawn: 41st btw 6th n 7th\nGet Your Phil!	41	 41st btw 6th n 7th 	f	up	big( jawn)?( in|:| ?-| is on| on) (.*?)(\\n|$|!|\\.)	1409758274	1387554094	American		4f15b382e4b0725660ea9f31	\N
treats	The Treats Truck	thetreatstruck	http://www.treatstruck.com	!!! Sat, Aug 23rd, no truck today! Our shop, The Treats Truck Stop open 9am-4:30 @  521 Court st, Carroll Gardens, Brooklyn!!!	23	 23rd  no truck ! Our shop  The Treats Truck Stop open 9	f	mid	\N	1409759658	1408792079	Sweets		49e65021f964a52035641fe3	\N
gorilla2	Gorilla Cheese 2	gcnyc1	http://t.co/4ZDqfwSH5f	G1 - 37th / Broadway\nG2- 26 11/12 @starrettlehigh\nComeToTheCheeseYo\nStill rockin the Ruben Melts due to high demand	starrettlehigh	 26 11 / 12 @starrettlehigh 	f	none	g2(.*?)(\\n|$|#)	1409795523	1409757953	American		4dc2d3e352b1c1fb37f1e945	\N
mamuthai	Mamu Thai Noodle	mamuthainoodle	https://www.facebook.com/MamuThaiNoodle	Hello 17th&5th! We are here for your noodle needs! Come by and say hi! turndownforwok	17	 17th & 5th	f	mid	\N	1409790379	1409759592	Thai		5126a10ae4b0af674c85f353	\N
itizy	Itizy Ice Cream	itizyicecream	http://www.itizy.com/	Likely our last three hours at Columbia this year! Come grab a scoop of your favorite flavor before it runs out!	none	Columbia	f	none	\N	1382307419	1382122482	Sweets		4fcbdcaae4b00a0e855124dd	\N
valduccis	Valduccis	valduccis	http://valduccis.com	RT @USAFoodTruck: Yo.  We're at 47th and park and we'll be here from 11-3 with the best chicken tenders you'll ever have.  Come and get tha...	47	 47th and park and 	t	up	\N	1409764399	1409161522	Pizza		4df7e1aad4c02ad734170b21	\N
steelcart	The Steel Cart	thesteelcart	http://www.thesteelcart.com/	Seriously? National Grits For Breakfast Day?! Time to shine baby! Front & Jay with nice sandwiches, and well, you know. @DUMBOFoodTrucks	Front & Jay	 Front & Jay 	f	bkl	\N	1409756155	1409747967	French		511d3abee4b0e188895f3697	\N
chefsamir	Comme Ci, Comme Ca	chefsamirtruck	http://www.chefsamirtruck.com	We are on 52st and park av!	52	 52st and park av	f	up	\N	1409758663	1409758663	Moroccan		4c3c85e3a9509c74b52e395b	\N
mactruck	MacTruck	mactruckny	http://MacTruckNYC.com	Last chance till september NYC!!! At the south st seaport, front st. And john st. Till i sell out.	none	 front st  And john st  	f	none	\N	1407271860	1405267201	American	Looking to take a nap after lunch? This truck is great and the owner is incredibly friendly. Feel free to chat it up while you watch him prepare your food.  Not listed on the menu are the many condiments\\n you can get on your macaroni. The regular size is a good portion for a normal lunch.	50575ab8e4b04ed4f2197dac	\N
nuchas	Nuchas	nuchasnyc	http://www.nuchas.com	Good morning NY, it's empanada o'clock! We're located on Varick St between Charlton & King St today until 2:15PM http://t.co/3EH09pAlce	Varick	 Varick St between Charlton & King 	f	none	\N	1409784392	1409755131	Mexican		4ebd2a9bb8f7b504a754c130	\N
wingit	Wing'n It	wingnitnyc	http://www.wingnitnyc.com/	Out here on 23rd and 5th come and grab some wings for lunch today. We will be open from 10am to 3pm. See you guys at lunch.	23	 23rd and 5th 	f	mid	\N	1390923947	1387549355	American		519ffd2b498ededbeef3c073	\N
disos	DiSO's	disosnyc	http://www.disosnyc.com/	Open for lunch.. Come find us on water st and old slip/ Hanover sq\n\nCall in orders for pick up: 917-756-4145	old slip	 water st and old slip/ Hanover 	f	none	\N	1409756354	1409756354	Italian Sandwiches	These might be typical italian sandwiches but the ingredients are high quality. You need to get there early because the line can get long and they will run out of some breads. I believe the focaccia half is a normal portion for lunch while their half and hero sizes are pretty big.	519523d6498eeaa6200aad03	\N
greenradish	The Green Radish	thegreenradish1	http://www.thegreenradish.com/	VeganLunch 38th&Bway 11-2pm Thai Celery Salad.Roasted Carrot-Ginger Soup.NoChicSalad Toasted Ciabatta.Raspberry Donarts @GarmentDstrctNY	38	 38th & Bway   	f	up	\N	1409783856	1409739940	Vegan		5229feab11d2edde794d385c	\N
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
Get your #LaborDay weekend started right with Bian dang on 53rd &amp; Park!	1409318284	505343626596319232	f	biandangnyc
#porkchop on 53rd/park from 11:30 till 2:30! http://t.co/MT2LdgV36x	1409232020	504981812515700736	f	biandangnyc
This #zhong isn't about to eat itself! Come to 53rd &amp; Park to give us a hand:) http://t.co/oVak79iPbj	1409146284	504622207343939585	f	biandangnyc
NYC Culture Guide: The 10 Best Food Trucks http://t.co/nksL3UJgl7 http://t.co/mB8Hweyd4k	1409073310	504316132590092288	f	biandangnyc
This just in: 53rd &amp; Park is the tastiest corner in #nyc. Come try our famed #mincedporksauce and see why! http://t.co/QBqjNRe9rB	1409058180	504252674515410945	f	biandangnyc
It's only breakfast but I'm already thinking about lunch! #biandangs on my mind at 53rd &amp; Park.	1408971033	503887150551957505	f	biandangnyc
53rd and park #tgif	1408714281	502810256507146240	f	biandangnyc
Get your BD fix on 53rd &amp; Park!	1408626097	502440387152449536	f	biandangnyc
53rd and park http://t.co/WwYwwPXbIc	1408543773	502095093214756864	f	biandangnyc
Ate an entire bag of #porkdumplings while watching #CapeNo7 last night.. pick up yours at 53rd &amp; Park today!	1408452212	501711059749982208	f	biandangnyc
53rd and park to cure your #mondayblues http://t.co/jJklTlv94D	1408375469	501389176626237440	f	biandangnyc
Happy Monday #midtown! On 53rd &amp; park for this beautiful lunch!	1408366354	501350943007707136	f	biandangnyc
Hope everyone enjoyed their #AuRevoirTaipei snack boxes last night! Back on 53rd &amp; Park today!	1408105886	500258463944310786	f	biandangnyc
Do you see what I see? Come by Fulton/Water for #biandang. Serving till 7pm! Movie viewing tonight of #aurevoirtaipei http://t.co/bm6K6qaQ89	1408029558	499938319258882048	f	biandangnyc
We got @Mooshugrill covering us on 53rd &amp; Park so get your #SanBeiJi #TaiwaneseBasilChicken #mooshu on!	1408021116	499902910776737792	f	biandangnyc
Sorry Midtown we'll be down at @theSeaport all day for tonight's #AuRevoirTaipei screening!... http://t.co/I7uyIYcJsV	1408020670	499901040792461313	f	biandangnyc
53rd and park! Come a little closer... http://t.co/LZE3r4gaIe	1407943107	499575718771425280	f	biandangnyc
53rd and park! #humpday	1407942748	499574212655611904	f	biandangnyc
Back to 53rd &amp; Park for another afternoon of fun, sun, and #porkbuns! (Maybe not the sun part)	1407935647	499544429552996353	f	biandangnyc
Roll on by 53rd &amp; park for your #biandang fix!	1407849407	499182712365023232	f	biandangnyc
New Menu Alert just in time for #LaborDay http://t.co/3MUOM8R8de  - **Watermelon Slices**	1409325408	505373506671218688	f	papayakingtruck
Before you head out of town this #LaborDayWeekend stop at 58th St and Broadway for The Original Frankfurter and Tropical Drink	1409325110	505372257800433664	f	papayakingtruck
Welcomed back to school #NYU we are outside @NYUStern on West 4th and Greene St serving the best grilled franks	1409262472	505109537477914624	f	papayakingtruck
RT @DowntownBklyn: Who's hungry? Food Truck Thursday here at Future Plaza. Cc: @KorillaBBQ @papayakingtruck @Redhooklobster @waffletruck ht...	1409237895	505006451036024833	f	papayakingtruck
@Cheap_eats you know it	1409164361	504698027001802752	f	papayakingtruck
Back in #Midtown for Lunch, 58th St. and Broadway http://t.co/9Nf4N4DLEy	1409154789	504657881179099136	f	papayakingtruck
@jasonalan we are, 58th and broadway	1409069064	504298324577763329	f	papayakingtruck
Come and get your lunch today on 58th and Broadway http://t.co/vagv9KU30y	1409064532	504279316021387265	f	papayakingtruck
Whose ready for @TheDangelo tonight! "Cause you're the most precious thing, that my dreaming eyes has ever seen." @AFROPUNK #Afropunk	1408918223	503665650066538496	f	papayakingtruck
RT @EverythingNYC: 50 Things You Do When You're New To New York http://t.co/8Sdpukx4ig http://t.co/zqMijmUqk4	1408811589	503218394901254144	f	papayakingtruck
We are at @AFROPUNK today &amp; tmrw at Navy St/Concord St "Feel the Music, Free your Mind, Join the Movement" #Afropunk #Brooklyn #Music	1408811472	503217904666836992	f	papayakingtruck
Afropunk Fest 2014: Ten sets you need to see http://t.co/QlZfriXE4s	1408810177	503212475257716736	f	papayakingtruck
We are at @afropunk today. Come get a grilled frankfurter!  #afropunk14 http://t.co/BDfxIwxg4T	1408808002	503203349186236416	f	papayakingtruck
The truck is back in midtown at 58th St. and Broadway today!	1408718488	502827900299902978	f	papayakingtruck
Official @Skrillex and @DILLONFRANCIS \n2014 #mothershiptour recap via @YouTube http://t.co/8V56CjldYI	1408714200	502809914847559680	f	papayakingtruck
RT @DowntownBklyn: Surprise! 5 food trucks at Future Plaza today. @KorillaBBQ @waffletruck @Redhooklobster @morristruck @papayakingtruck ht...	1408633448	502471217413373952	f	papayakingtruck
We are back in @DowntownBklyn for #FoodTruckThursdays. Future Plaza:\nGold Street and Albee Square West until 3pm http://t.co/cjjra0jff9	1408632793	502468469770973184	f	papayakingtruck
@paulk524 hopefully we will be down there soon. In the meantime, jump on the 6 to Astor Pl &amp; visit us on St Marks!	1408569374	502202472178663424	f	papayakingtruck
Lunchtime!!!! 58th and Broadway. Have you tried the Mozzarella Sticks we just added to the menu?	1408546484	502106466137161728	f	papayakingtruck
@LisetteB_x3 62nd and broadway by @LincolnCenter	1408492486	501879980373331969	f	papayakingtruck
Hey y'all.  We're at the south street seaport today at john and Front st.  Come and get that all-American goodness.  We're here from 11-7.	1409238742	505010006597840896	f	usafoodtruck
@foodNfest @SFJNYC can you smeeeeeeeelllllllllll what the truck.....is cookin'.	1409238584	505009341880369152	f	usafoodtruck
@foodNfest @SFJNYC any place...any time.  Two tender joints go in.  One comes out the champ.  You already know u can't beat the USA...truck	1409238545	505009179422371840	f	usafoodtruck
@DCAficionado were kinda there.  We're at the south Street seaport.  It would be a noble chicken quest to venture here and fulfill ur hunger	1409232337	504983141027966976	f	usafoodtruck
Yo.  We're at 47th and park and we'll be here from 11-3 with the best chicken tenders you'll ever have.  Come and get that delish ish.	1409147983	504629333387120640	f	usafoodtruck
@lukegus Sorry Luke---missed ya man!  We'll catch up at a football game I'm sure this fall.	1409082877	504356261249695744	f	usafoodtruck
@UKinUSA It's okay.  We can make cakes for you on your anniversaries to remind you why you're not speaking German.  #thosevetsarestillalive	1409022331	504102309828521984	f	usafoodtruck
Goooooood mooooorning New York!  We're at front and Fulton st and we'll be here from 11-7 with the best chicken tenders in NYC.	1408981856	503932547643232256	f	usafoodtruck
Happy frrrrriday.  Come and get that chicken you know you're craving at the south street seaport.  We're here from 11-7 at Fulton and front	1408718354	502827338665852929	f	usafoodtruck
Hey y'all.  We're at south street seaport today at front and John st with the best chicken tenders in the history of mankind.  11-7	1408633179	502470091444060160	f	usafoodtruck
We know you've been craving our chicken all weekend.  Satisfy your desires at front and John st at the south street seaport.  #yum	1408373480	501380833790672898	f	usafoodtruck
RT @VendorPower: #NYPD giving ticket to guy advertising bike rentals (100% legal) near Central Park #DeblasiosNewYork #brokenwindows http:/...	1408296540	501058125169180672	f	usafoodtruck
RT @ERoth340: @USAFoodTruck You didn't lie, best chicken sandwich I've ever had.	1408296492	501057923221843968	f	usafoodtruck
So ready for football season...that cool crispness in the morning air...that means football is coming..and our fall feast.  Prepare yourself	1408105856	500258336215138304	f	usafoodtruck
@FoodtoEat were at the south street seaport on John and Front St today.  Hopefully the rain stays away so we can get people their chicken!!	1407856001	499210370037604354	f	usafoodtruck
Hungover from last night?  Perfect hangover cure food right here.  We'll be here at the south street seaport until 7 at front st and john st	1407690809	498517503619133440	f	usafoodtruck
Hey everybody---we're at 14th st and union square west.  We'll be here from 11:30 until 7.  Come and get that chicken you know you're cravin	1407598414	498129971626659841	f	usafoodtruck
@LaBellaTorte @TheSeaport @ToumNYC @mooshugrill @EddiesPizzaNY that's john and front st for all you hungry peeps out there	1407512435	497769349491752960	f	usafoodtruck
RT @LaBellaTorte: Open @TheSeaport @ToumNYC @mooshugrill @EddiesPizzaNY @USAFoodTruck #cannolitrucknyc	1407512396	497769186459156480	f	usafoodtruck
Hey y'all.  We're at 47th and park and we'll be here from 11-3.  See you for lunch.	1407337192	497034328095084544	f	usafoodtruck
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
UPDATE - Change in schedule everyone, we'll be off the road for our evening shift for a Private Event. Find us at the #USOpen this weekend!	1409342745	505446227321053185	f	andysitalianice
Still looking for a way to give your next business event something extra? We can help.Ask about our catering services http://t.co/UOzrL7QTIU	1409326020	505376076718407680	f	andysitalianice
NYC - Well see you on 33rd and Park Ave today from 10a-5p, then heading back to #UnionSquare until 9!	1409320119	505351325442244608	f	andysitalianice
Morning Ice Lovers - Find us down at Water and Broad Street today from 11am - 5pm or in #UnionSquare after until 9pm!	1409234931	504994018703720449	f	andysitalianice
Bryant Park today (40th &amp; 6th Ave) from 10a-2:30p, then OFF THE ROAD for a private event, &amp; back to #UnionSquare this evening from 5p-9p!	1409145304	504618097597493248	f	andysitalianice
UPDATE - due to construction, we've relocated to 32nd and Park for the day!	1409065246	504282310372786176	f	andysitalianice
Morning ice lovers! Come visit us on 47th &amp; Park today from 11a -4:45p, or after work from 5pm-9pm in #UnionSquare! http://t.co/IxlXE6fSlb	1409064622	504279692892184576	f	andysitalianice
Sorry everyone last call. We are scooping out early tonight. See you all tomorrow!	1409010106	504051034634080256	f	andysitalianice
NYC-find us on 55th and Broadway from 12pm-5pm, then over in #UnionSquare until 9pm	1408975860	503907397455605760	f	andysitalianice
Such a great and busy weekend! HUGE thanks to @Afropunk for having us, we hope to see you next year! http://t.co/GR4DjLelJW	1408972354	503892691831517187	f	andysitalianice
RT @mamuthainoodle: . @afropunk day2! Could today be crazier than yesterday?! Bad Brains last night was whoa! Body Count? Nuts! We on Navy ...	1408906225	503615328140926976	f	andysitalianice
Picnics, block parties - you name it, we'll be there. Just tell us the location and pick your flavors, Andy's will do the rest.	1408905248	503611229957783552	f	andysitalianice
47th and park.   Here we gooooooo!!!!	1409240779	505018548184707072	f	blend_express
Day 2 of @Afropunk Fest! Stop by the AFROPUNK BITES &amp; BEATS food truck round-up w/ many more of your NYC favorites! http://t.co/0Jh3lffzaf	1408886220	503531419730452480	f	andysitalianice
Swap the cake for a party bucket of our Cake Batter Creme Ice for this year's celebrations!	1408818859	503248889458466816	f	andysitalianice
Looking forward to spending the day at @Afropunk Fest! Starts at 11am @ Commodore Barry Park -hope to see you there! http://t.co/tCKxvKyyzQ	1408803181	503183131059699712	f	andysitalianice
Looks like we have good weather this weekend for @Afropunk Fest - hope to see you there  http://t.co/kyo1jZNA6O	1408741744	502925446044848128	f	andysitalianice
Need an afternoon pick me up? Try our Espresso Chip Creme Ice - made with chocolate straight from Italy	1408732444	502886436845404161	f	andysitalianice
OFF THE ROAD for a Private Event today - find us in #UnionSquare from 4p-8p!\n(photo cred: savory-bites) http://t.co/UKBnn2Cw7H	1408715309	502814566246789121	f	andysitalianice
Dont forget - its not too late to RSVP for @Afropunk Fest this Saturday and Sunday. Hope to see you there! http://t.co/6eBpcQcYiy	1408657511	502572146003300352	f	andysitalianice
Our Water Ices, like most of our Creme Ices are: dairy free, low carb, cholesterol free, gluten free, no sodium &amp; fat free!	1408646044	502524048115781632	f	andysitalianice
Good morning we are serving lunch at 46 st between 5&amp;6ave from 11:30 to 3pm @FoodtoEat @midtownlunch @nystfood	1408622100	502423619595956225	f	taipanexpress
Good morning happy hump day today we are serving lunch at 47 st park and Lexington from 11:30 to 3pm @FoodtoEat @nystfood @midtownlunch	1408540096	502079673384566784	f	taipanexpress
Good morning Tuesday today we are at south street seaport all day from 11:30 to 8pm @midtownlunch @nystfood @truckfoodnyc	1408454987	501722698494775298	f	taipanexpress
Good morning today we are serving lunch at 47 street between park and lex ave from 11:30 to 3pm @FoodtoEat @midtownlunch @nystfood	1408099122	500230093730742272	f	taipanexpress
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
@dayherna Hello... sorry we are off today.. we resume business back on tuesday... have a great labor day weekend	1409336081	505418273367023617	f	latinkitchennyc
@Andhansel thankyou!!!	1409250127	505057758061010944	f	latinkitchennyc
Happy Labor Day weekend!Today Thurs 8/28 11AM-3pm location 47st Bet Lexington &amp; Park aves NYC Preorders 347-662-7600 http://t.co/pTXEVmHHys	1409233933	504989833207750658	f	latinkitchennyc
@salzadanza1 I'm at 47st bet Lexington &amp; Park aves NYC Tomorrow Thursday 8/28 11am-3pm	1409184566	504782775518756866	f	latinkitchennyc
Today Wednesday 8/26 11am-3pm\nWALL STREET WE ARE HERE! 55 WATER ST NYC (corner of Old Slip)LUNCH PREORDERS 3476627600 http://t.co/DdWFyytnap	1409148585	504631858001637376	f	latinkitchennyc
Goodmorning NYC! Today Tues 8/26 location 48st Bet 6th &amp; 7th aves NYC Lunch Preorders 930am - 11AM 347-662-7600 http://t.co/3CrEltN6E6	1409059337	504257525026672641	f	latinkitchennyc
GOODMORNING NYC! TODAY MONDAY 8/25 11AM-3PM 48ST BET 6TH &amp; 7TH AVES NYC LUNCH PREORDERS 930AM- 11AM GREAT DAY!! http://t.co/YH9i7xRwW8	1408973967	503899458921582592	f	latinkitchennyc
TGIF 8/22 WALL STREET WE ARE HERE.. 55 WATER STREET (OLD SLIP ) NYC  11am-3pm\nhttp://t.co/MPHGwjSFxE \nfood truck http://t.co/nOMrRJl7Jl	1408716741	502820574465646593	f	latinkitchennyc
Goodmorning NYC! Today Thurs 8 / 21 location 47th st bet Lexington &amp; Park aves NYC! Preorders 9:30am-11 347-662-7600 http://t.co/mjC3WSVvzL	1408619300	502411876014505984	f	latinkitchennyc
Goodmorning NYC! Today Wed 8/20 location 55 Water st. (Old Slip) NYC Lunch Preorders 9am -1030am 347-662-7600 http://t.co/5CENBkzTUK	1408533962	502053945267982337	f	latinkitchennyc
Goodmorning NYC! Today Tues 8/19 location 48st Bet 6th &amp; 7th aves NYC Lunch Preorders 9am- 11AM 347-662-7600 Good day http://t.co/T4ifUrrNGy	1408448798	501696739976683520	f	latinkitchennyc
Goodmorning NYC! Today Monday 8/18 location 48st Bet 6th &amp; 7th aves NYC Preorders 9am- 11AM 347-662-7600 great  day! http://t.co/G4Xn2zUJA9	1408357449	501313594177626112	f	latinkitchennyc
TGIF! FRI 8/15 WE ARE LOCATED ON 47ST BET LEXINGTON &amp; PARK AVE NYC    PASTELON (PUERTORICAN LASANGA) only 16 plates.. http://t.co/VyLQhHfzwS	1408068846	500103103916822531	f	latinkitchennyc
@actorsconnect  thank you... you guys rock! !!	1408040337	499983531142287360	f	latinkitchennyc
Goodmorning NYC! Today Thurs 8/14  location  47st Bet Lexington &amp; Park aves NYC  Preorders 9am -10am 347-662-7600 TY! http://t.co/xMm7is0OHr	1408011401	499862162534563840	f	latinkitchennyc
Make sure to join us for this action packed weekend!	1409167068	504709380475191296	f	hibachiheaven
Wednesday 8/13 11am-3pm ...WALL STREET WE ARE BACK!! OLD SLIP &amp; WATER ST. LUNCH PREORDERS 9AM -10AM 347-662-7600 http://t.co/lCzJWIyDOG	1407893542	499367829087735808	f	latinkitchennyc
Wednesday 8/13 11am-3pm  Wall Stteet we are back!  Old Slip &amp; Water st. Lunch Preorders 9am-10am... http://t.co/3ianv3HeM4	1407886129	499336735390588929	f	latinkitchennyc
Goodmorning NYC! Tues 8/12 11am-3pm we are located @ 48st Bet 6th&amp;7th aves NYC Lunch Preorders 9am -10am 347-662-7600 http://t.co/qPov6w6r5q	1407844858	499163633147191296	f	latinkitchennyc
Goodmorning NYC!  Mon 8/11 11am-3pm location 48st Bet 6th &amp; 7th aves NYC http://t.co/KijuuqJdcu HAVE A GREAT DAY http://t.co/FBjq6ek03z	1407765822	498832132845084672	f	latinkitchennyc
Goodmorning NYC!  TGIF!! LOCATION 47ST BET LEXINGTON &amp; PARK AVE NYC 11AM-3PM LUNCH PREORDERS 9AM -10AM 347-662-7600 http://t.co/o4DblZJemZ	1407496648	497703131325931520	f	latinkitchennyc
 Ok Mtbll lovers it's FRIDAY!!!!  If you are around 50th bet 6&amp;7 come by the Mtbll  for your favorite ball.... http://t.co/L4rZonpZnI	1409324788	505370909998190592	f	mtblls
Good Morning! What a beautiful day to take a stroll to the Mtbll   for your favorite menu item. See ya then . We are at our usual stop.	1409236550	505000812850860032	f	mtblls
It's  day ya all know what that means. Closer to a long weekend ahead. The Mtbll  is stopped at 50th bet 6&amp;7... http://t.co/IhumbcH0Jr	1409152046	504646376454905856	f	mtblls
I posted a new photo to Facebook http://t.co/xOfu3ilZru	1409110025	504470127451324416	f	mtblls
I posted 9 photos on Facebook in the album "Trip to The Mtbll Train" http://t.co/P92LZgKX3F	1409109243	504466846578270208	f	mtblls
Happy Tuesday all. It's going to be another hottie today. Come enjoy your favorite ball and a nice refreshing... http://t.co/ww9mSKzTZ7	1409062579	504271125858492417	f	mtblls
Good Morning Mtbll Lovers! Looks like summer has finally returned lol an on a Monday go figure. The Mtbll  is... http://t.co/coVZ43TxTH	1408979995	503924740184997890	f	mtblls
And a nice one it is!  The Mtbll train has stopped at 50th bet 6&amp;7 aves to help ya start your weekend off right... http://t.co/8U5yb7g2lH	1408719266	502831164688572417	f	mtblls
Happy Thursday!  The Mtbll  is at it's usual stop. Come on by for your favorite ball and top it with our amazing... http://t.co/nNWj30qg2D	1408633311	502470643171217409	f	mtblls
Good Morning Mtbll Lovers!  It's  day!  Yay. The Mtbll train is stopped at 50th bet 6&amp;7 aves. Ready and waiting to make your day 	1408544110	502096507387248640	f	mtblls
Good Tuesday Mtbll lovers. The  is at it's regular stop so come on by for your favorite menu item 	1408462832	501755602410807296	f	mtblls
It's a beautiful summer day how could you not .  The Mtbll  is stopped on 50th bet 6&amp;7 aves. Come on by ! http://t.co/LA8wzl3FYx	1408376285	501392598011883520	f	mtblls
TGIF !!!! Another gorgeous day . The Mtbll  is waiting to serve you your favorite menu item . We are at our usual stop.	1408115167	500297388012371968	f	mtblls
What a Beautiful Morning . The Mtbll  is enjoying this as much as you all are. So take a nice walk to 50th bet... http://t.co/Fj5ZBJG8Z7	1408028245	499932813710225408	f	mtblls
Wow what a morning . Lots of flooded roads. Hope you all got to work safely. I know just the thing to get ya... http://t.co/XiIhtd5GIs	1407941583	499569325825458176	f	mtblls
Good Tuesday Mtbll lovers. The train has stopped at 50th bet 6&amp;7 aves. We are ready and waiting to serve you with a smile. 	1407856200	499211205135699969	f	mtblls
Ponder this question as you stroll over to the Mtbll  for your favorite ball . We are waiting on 50th bet 6&amp;7. http://t.co/ltg4N6jfEN	1407765486	498830720828469248	f	mtblls
TGIF Peeps. Awesome day out take a walk to the Mtbll .and say Hi . We are at our usual stop.	1407512512	497769670548533248	f	mtblls
What a beautiful Thursday. A perfect day to stroll down to the Mtbll  at 50th bet 6&amp;7 aves for your favorite... http://t.co/aYLQGo1QFh	1407425894	497406369239023616	f	mtblls
It's day!!! We can do this !  The  has stopped at it's usual spot. Come by say hi 	1407331734	497011433389842432	f	mtblls
For all of you lucky enough to have a half day catch some #MSG on your way out of the office at 50th &amp; 6th or @TheSeaport at Front &amp; John!	1409317951	505342229968601088	f	mooshugrill
Check out these #mooshus on 47th &amp; Park today! #bffls http://t.co/sNm6PGYRXo	1409234055	504990345944641536	f	mooshugrill
RT @eat_your_world: @mooshugrill Porky &amp; creamy &amp; good! Particularly liked the celery. Would try the chicken or tofu next time.	1409173096	504734664763117568	f	mooshugrill
@eat_your_world how was it?	1409167957	504713111996469248	f	mooshugrill
Catch the #MSG cart on 50th &amp; 6th or the truck at @TheSeaport on John &amp; Water for a #schlumpday #pickmeup!	1409145322	504618171710853120	f	mooshugrill
@MathewKatz usually around 2:30-3pm	1409071750	504309589572337666	f	mooshugrill
Wdup #nyc catch the #msg truck on 52nd &amp; 6th or the cart on 45th &amp; 6th today!	1409057892	504251466832707584	f	mooshugrill
Happy Monday #NYC! Catch the #MSG cart on 50th &amp; 6th, or the truck at @TheSeaport til 8 tonight!	1408971108	503887465078587392	f	mooshugrill
@theseaport till 3pm and 50th/6th!	1408714365	502810609327808513	f	mooshugrill
ooooh that #papayasalad is exclusive to #MSG's catering menu! Order your next corporate lunch with us and try it out! http://t.co/hHQgNptCEr	1408632976	502469238284886016	f	mooshugrill
RT @john_aberdeen: Goals for today: find the @mooshugrill cart. Oh, and also an apartment. But first the cart #priorities	1408630041	502456926484324352	f	mooshugrill
RT @yankee_MSU: Mad props to the @mooshugrill cart on 50th and 6th for making my Taiwanese basil chicken rice bowl so damn tasty today! #Da...	1408630026	502456865805324288	f	mooshugrill
Good Morning #NYC! Catch the #MSG cart on 45th &amp; 6th or the truck on 53rd &amp; Park!	1408624916	502435434178547712	f	mooshugrill
Remember that time B went to the @NYBG to smell the flowers? #tbt #botanicalgardens #mothersday http://t.co/z1g4krCW6V	1408624847	502435144025006080	f	mooshugrill
Happy #humpday! MSG cart on 50th &amp; 6th with the truck down at @TheSeaport til 8PM!	1408542255	502088726018007040	f	mooshugrill
RT @biandangnyc: Ate an entire bag of #porkdumplings while watching #CapeNo7 last night.. pick up yours at 53rd &amp; Park today!	1408452689	501713059648659456	f	mooshugrill
#MSG all up and down 6th ave today! Catch the truck on 52nd/6th or the cart on 45th/6th! Or hit up both in the same lunch;) #mooshuchallenge	1408451890	501709708659802113	f	mooshugrill
Happy Monday! #MSG truck down at @TheSeaport with the MSG cart on 50th &amp; 6th!	1408365401	501346947501129728	f	mooshugrill
Catch the truck down at @TheSeaport on Front &amp; John or Lil' Shu on 50th &amp; 6th today!	1408105939	500258685059629056	f	mooshugrill
covering 53rd &amp; park for @biandangnyc while they're down at @TheSeaport for the #AuRevoirTaipei screening! #movienight	1408025706	499922165064798208	f	mooshugrill
Located on 49th between 6/7	1407857667	499217356317794304	f	thepocketful
46th and 6th! YAY Friday!!! End the week with some yummy Vietnamese food!!	1408704079	502767465747607552	f	vspot_truck
53rd and park :)	1408627853	502447749116469250	f	vspot_truck
46th and 6th today from 11am to 2:30pm. Don't come too late!! Or else that yummy lemongrass curry chicken gets sold out again!	1408533848	502053464412020736	f	vspot_truck
Private event today!	1408448881	501697087827091456	f	vspot_truck
WE'RE BACK! 53rd and Park ave. :)	1408363568	501339258716971010	f	vspot_truck
TRUCK MAINTENANCE! Be back asap! Sorry	1408026886	499927114314174464	f	vspot_truck
FRIDAY!!!!!!! :D Back at 46th and 6th! Stocked up two times more than usual. Hope it'll last til 2:30!	1407495878	497699903439896576	f	vspot_truck
@biandangnyc @feistyfoodie @mooshugrill lol, it's about hitting that V Spot! Lucky we ran out MSG!  See you all next week :)	1407460089	497549794123214851	f	vspot_truck
53rd and park !! 11 to 2:30 :)	1407417119	497369565324935168	f	vspot_truck
Lolololol 1pm*	1407356700	497116149721862145	f	vspot_truck
Wow!!!!  Sold out by 1am!! Will be back with more stuff next week!! Thank you guys!	1407345581	497069513649954816	f	vspot_truck
NEW SPOT TODAY! Catch us on 46st and 6th ave from 11:00am-2:30pm	1407308424	496913663065092096	f	vspot_truck
Sorry guys, truck maintenance today! Will be back tomorrow.	1407232461	496595050806394881	f	vspot_truck
52nd 6th again :) with a new item on the menu! Vietnamese Style Lemongrass Curry Chicken! Come try it out!! 11am to 2:30pm	1407144355	496225509572108288	f	vspot_truck
@AndyxNYC  finding a spot is too difficult, we're considering to go to 53rd and park soon. Possibly Tuesdays. Consider that close? Lol	1406959096	495448478236278785	f	vspot_truck
TGIF!!!!! 52nd and 6th, 11am~2:30pm! Come early before we sell out like last week :D	1406891005	495162882334949376	f	vspot_truck
Not a pork fan? No worries! We're working on the chicken menu! COMING SOON! :D	1406844208	494966603143208961	f	vspot_truck
Love 52nd and 6th so much, we just had to come back again! Left side of the street today! 11am to 2:30pm :)	1406806042	494806520874676224	f	vspot_truck
We're on 52nd and 6th. 11am to 2:30 pm !!	1406710895	494407444941262848	f	vspot_truck
52nd and 6th! From 11am-2:30pm. Fully stocked! Try our NEW Spring Roll Bites too! :)	1406537996	493682256628568065	f	vspot_truck
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
On broadway &amp; 55 ST cooking. #Moroccan #StreetFood	1406045191	491615281593450496	f	trucktotable
Did you guys know that we cater to office lunches. Email us at info@bistrotruck.com for catering menus.	1405964532	491276973369749504	f	trucktotable
Cart moved today to mid block on broadway bet 55-56 ST. 11-3p\n#Moroccan #StreetFood	1405957047	491245580224835585	f	trucktotable
The winner of the #hibachiheavencontest will win 5 FREE MEALS at any #hibachiheavennyc location.	1409344985	505455621970591744	f	hibachiheaven
RT @ElectricZooNY: The gates are open! It's official: Day 1 of #EZOO 2014 starts NOW. http://t.co/R9pcJXJLoA	1409332597	505403659443003392	f	hibachiheaven
#hibachiheavennyc will also be in #ForestHills tomorrow from 11-5!	1409331532	505399195675934721	f	hibachiheaven
#hibachiheavennyc VIP READY! #ezoony #ELECTRICZOONY #foodtrucks http://t.co/4CPX8TWJsp	1409331464	505398911222435840	f	hibachiheaven
#hibachiheavencontest winner will be picked tomorrow! Who is all set?	1409324983	505371724616331264	f	hibachiheaven
@ja2dalee thanks for your entry! That looks AMAZING!	1409324791	505370918982791169	f	hibachiheaven
@Michell_MUA  we'll be there from 11-3 today	1409324600	505370118525026305	f	hibachiheaven
RT @camGarcia__: If you are going to be at #ELECTRICZOONY this weekend, feed yourself some #hibachiheavennyc @hibachiheaven. You'll thank m...	1409320818	505354254958469120	f	hibachiheaven
Only truck in VIP tents for #ezoony #hibachiheavennyc #foodtrucks #nyc	1409320613	505353395415572480	f	hibachiheaven
&amp; for our party people! We are at #ELECTRICZOONY today.. Make sure to tag #hibachiheavennyc when you come up to the truck.	1409320535	505353069979521024	f	hibachiheaven
#midtown we are at 46th &amp; park today! Come get some #yumyum	1409320451	505352716391317504	f	hibachiheaven
@StephieKayeTX Thursday coming up we will be at Varick again!	1409320351	505352299305517056	f	hibachiheaven
@Michell_MUA we will be on 46th &amp; 6th today! Also at #ELECTRICZOONY	1409320082	505351170924482560	f	hibachiheaven
Happy Thursday! We are parked on 47th &amp; Park today. #hibachiheavennyc	1409234176	504990852804927488	f	hibachiheaven
Make sure to tag #hibachiheavennyc this weekend if you come to the truck at #ELECTRICZOONY ! http://t.co/s13a3vymT8	1409180335	504765030337101825	f	hibachiheaven
#hibachiheavennyc prepping from EZOO! #ELECTRICZOONY http://t.co/dcAFEM6fHI	1409179686	504762308028268544	f	hibachiheaven
We will also be at one of the VIP Tents at #ELECTRICZOONY FRI. SAT. &amp; SUND. #hibachiheavennyc	1409167053	504709318374342657	f	hibachiheaven
#QUEENS We will be in Forest Hills from 11-5 this Saturday August 30th! #hibachiheavennyc	1409166903	504708691535597568	f	hibachiheaven
Find us for some lunch on 46th &amp; 6th and 33 &amp; park! #hibachiheavennyc #yumyum	1409148594	504631895729405952	f	hibachiheaven
Phinal Phil's Phriday of August! Stop by the jawn b4 u skate outta town! 41st n 6th 11-2.	1409324203	505368455798095872	f	philssteaks
52nd and 6th is the spot - get there early to beat the rush! 11-2	1409233790	504989232885420032	f	philssteaks
It's another sunny summer whiz Wednesday! We're at the seaport. Enjoy the breeze with a steak from the jawn! Front and Fulton 12-10pm	1409150000	504637795215081472	f	philssteaks
Seaport today! Fulton and Front 12-8	1409064907	504280889388720128	f	philssteaks
RT @philbhere: @PhilsSteaks Phils of the world not only love yer steaks but yer T's, shirts that is	1408927933	503706377345585154	f	philssteaks
It's day 2 of @afropunk and we'll be rockin' all day long!  #cheesesteaks and @TheDangelo...what sounds better than that?!?!? #Jawn	1408888874	503542554034716673	f	philssteaks
Day 1 @afropunk has been incredible and still going strong!  Don't sleep on one of NYCs best events of the summer, we'll be here tom too!	1408838828	503332644944633856	f	philssteaks
RT @cOcO_lefleur: Tryna find my way to @PhilsSteaks at #afropunkfest2014 #afropunk #AFROPUNK14 #myfave	1408838707	503332135462522880	f	philssteaks
G'morning pholks!  We're getting set up for a big weekend at @afropunk. Come hear some great music and get your Phil! #cheesesteaks #jawn	1408797842	503160736789843968	f	philssteaks
41st and 6th for this Phil's Phriday! Get a jump on the weekend, get out and get your Phil! 11-2	1408720007	502834272374648832	f	philssteaks
RT @BlueSkyFilmz: Best cheesesteak in #NYC @PhilsSteaks @GuruGangStarr \nis blasting from their speakers. #banging http://t.co/DkvKrCgkii	1408673243	502638129619406848	f	philssteaks
52nd and 6th today 11-2!	1408630135	502457323903008768	f	philssteaks
Seaport today! Front and Fulton from 12-8!	1408554456	502139901111197696	f	philssteaks
Seaport today! Front and Fulton from 12-8.	1408462446	501753984689143809	f	philssteaks
RT @jonesclp: Thanks guys @PhilsSteaks you put three people in food comas after our phillys and fries.  Awesome stuff!!! Have a great weeke...	1408309439	501112227156733952	f	philssteaks
RT @mikeramo: #SEECHANGENY just has a WHIZ  from @philssteaks. Nice job guys	1408309420	501112144528949248	f	philssteaks
RT @ovordosedxo: Thanks to the guys at @PhilsSteaks for the great food and free drink my first time there!  #mynewfavoritefollower http:/...	1408295778	501054925670207489	f	philssteaks
Seaport Saturday! We're down on Front and Fulton slanging steaks til 8. Come downtown for the afternoon !	1408202793	500664919290044416	f	philssteaks
@Crwadaddy we use 100% premium loin tail. Super tender and super tasty!	1408121068	500322141028777985	f	philssteaks
RT @Cheerios47: @PhilsSteaks You made my day!!! Thank you!!!! #PhilsSteaks #truck #steak #beef #cheese #yum #nyc #nom http://t.co/RATmn70Ifo	1408121023	500321952176017408	f	philssteaks
46st..&amp;..6ave	1409234012	504990167917416449	f	polishcuisine
47st ~ PARK ave http://t.co/j65FHrgsys	1409148508	504631535551930368	f	polishcuisine
We are off this week for scheduled maintenance- #keepthosecravings #traditional	1408952421	503809087503884289	f	polishcuisine
47st&amp;park ave....	1408545485	502102276534976512	f	polishcuisine
46st&amp;6ave...you are invited:)	1408461360	501749426822873088	f	polishcuisine
Today ... Water st &amp; Hanover sq ....see you	1408372848	501378183204446208	f	polishcuisine
Friday...water st &amp; hanover sq	1408114049	500292699501912064	f	polishcuisine
Today varick st &amp; king st http://t.co/IFSlBdou1W	1408014721	499876086961176577	f	polishcuisine
Today varick st &amp; king st http://t.co/himqpgEtQl	1408013800	499872225487757312	f	polishcuisine
thanks for coming everyone! enjoy the rest of the day!	1407871054	499273503841845249	f	polishcuisine
it's lunchtime on 46th &amp; 6th today #pierogitime	1407858762	499221950942961664	f	polishcuisine
On 46th &amp; 6th today - #BePrepared - delicious lunch on board!	1407850363	499186719766638593	f	polishcuisine
we are closed! thanks so much for coming! have a great day!	1407782008	498900018078957568	f	polishcuisine
We are on Hanover Sq. b/w Pearl &amp; Water getting geared up for lunch! #pierogitime	1407768763	498844465977888768	f	polishcuisine
Happy Monday #PierogiStyleon Hanover Sq. b/w Pearl &amp; Water today #findUsHere	1407758996	498803500781154304	f	polishcuisine
Have a great wknd everyone and thanks for coming!	1407523419	497815419420680193	f	polishcuisine
are you geared up for lunch? 52nd b/w 6th &amp; 7th today! #BeatTheLine #FridayLunch	1407509210	497755823637282816	f	polishcuisine
We are on 52nd b/w 6th &amp; 7th #HappyFriday #Midtown #GoodToSeeYou	1407498977	497712900963049473	f	polishcuisine
closing early! thanks for coming everyone!	1407435253	497445624103854083	f	polishcuisine
Join us on 46th b/w 5th &amp; 6th today for a wonderful lunch @nycfoodtruck @midtownlunch	1407427679	497413856835411969	f	polishcuisine
Lunch 2day @ 7 Hanover sq b/t water st &amp; pearl st. Burger of the week THE BYMARK preorder 9172929226	1409320498	505352916644143105	f	fritesnmeats
@AquariusGiants1 so sorry to hear that, hang in there and keep ur head up:)	1409258346	505092231288877057	f	fritesnmeats
Peeps, Instagram is DOWN?!! What! What if it will never come back?? What would we do?	1409257690	505089478961426432	f	fritesnmeats
Lunch 2day @ Hudson &amp; king. Burger of the week THE BYMARK preorder 9172929226 #soho	1409147807	504628595776815104	f	fritesnmeats
Lunch 2day @ 10 Hanover sq b/t water st &amp; pearl. Burger of the week THE BYMARK preorder 9172929226 #fidi	1409061578	504266926286458880	f	fritesnmeats
Peeps, we are having generator issues, we will not be able to serve lunch. Sorry	1408980318	503926095423750144	f	fritesnmeats
Hello midtown, lunch 2day @ 52nd st b/t  6th &amp; 7th av. Burger of the week THE BYMARK preorder 9172929226	1408975323	503905144749453312	f	fritesnmeats
@BiandWi tomo we will be doing an private event. Sorry bud. U can check our blogspot for updates &amp; locations http://t.co/KNYATgqjSA	1408629848	502456117625360384	f	fritesnmeats
Hello soho, lunch 2day @ Hudson &amp; king. Burger of the week THE PLOUGHMAN. Preorder 9172929226	1408544058	502096289493168129	f	fritesnmeats
@iamcupcakeshop ur chocolate chip cookies was amazing!	1408477469	501816993235107840	f	fritesnmeats
RT @iamcupcakeshop: I have been counting down the days until @fritesnmeats came back to my neighborhood!!  You have to... http://t.co/YdIjfBf...	1408477409	501816743950819328	f	fritesnmeats
Lunch 2day @ 10 Hanover sq b/t water st &amp; pearl st. Burger of the week THE PLOUGHMAN preorder 9172929226 #fidi	1408456912	501730773394026497	f	fritesnmeats
RT @iamcupcakeshop: We haven't made our guava cupcakes called  Grandma's Favorite in a lonnnnggg time!!  We'll we've got... http://t.co/tGbwx...	1408308137	501106765589528576	f	fritesnmeats
RT @iamcupcakeshop: I stumbled across the BEST BURGER EVER ever yesterday!!   Be sure to follow @fritesnmeats on Twitter... http://t.co/fZsRz...	1408212222	500704467424387072	f	fritesnmeats
RT @iamcupcakeshop: Today lunch was amazing!!"@fritesnmeats: Lunch 2day @ 7 Hanover sq b/t water st &amp; pearl st. Burger of the week	1408148058	500435343783780352	f	fritesnmeats
RT @FoodtoEat: Photo: @fritesnmeats is back @tumblr for lunch today! Kat, our awesome catering coordinator is posing with... http://t.co/1l...	1407956487	499631838831591424	f	fritesnmeats
RT @aeneasohara: Looking forward to lunch from @fritesnmeats today! http://t.co/9pSfgj4r9s	1407956462	499631731121872898	f	fritesnmeats
Peeps, due to an private event we will be off the streets today:(	1407939187	499559275925356545	f	fritesnmeats
Lunch 2day @ 10 Hanover sq b/t water st &amp; pearl. Burger of the week THE MARITAL BLISS. Preorder 9172929226 #FIDI	1407851630	499192036365725697	f	fritesnmeats
Lunch 2day @ Hudson &amp; king. Burger of the week THE MARITAL BLISS. Preorder 9172929226 #soho	1407765359	498830189389168640	f	fritesnmeats
@flusters NP...come by next week for sure.  We'll have a makeup meal for u. :)	1409337172	505422848979369985	f	domotaco
@flusters sorry about that!  lunch on us next week??? Or if you're within a few blocks we can bring another now.	1409335136	505414312551522304	f	domotaco
In #FiDi on Front st &amp; Old Slip today! Or catch us all wknd at #pier1 for the #amex #USOpen viewing party #brooklynbridgepark	1409318149	505343060155588608	f	domotaco
RT @LOLBev: I don't know why I hadn't tried @DomoTaco yet but i just did and it was awesome! veggie options &amp; cute logo to. #FoodTruck	1409314056	505325893028708352	f	domotaco
Swing by @theseaport to munch out on a couple of tacos and see the #WayneTuckerBand! Front st &amp; John st til 8PM!	1409234437	504991948571422720	f	domotaco
@akrames Cops don't like having us around the area. We will be back very soon though.	1409148858	504633004070031360	f	domotaco
We're in @dumbolot today! Wanna #taco bout it? It's #nacho problem! #nachotots http://t.co/8d5rG5Erhc	1409145684	504619689679798272	f	domotaco
Tuesdays just got tastier with #fishtacos at @theseaport! Catch us on front &amp; john st til 8pm!	1409058028	504252034212958208	f	domotaco
Got the cure for your Monday blues here on 52nd &amp; 6th ave!	1408970832	503886308566392832	f	domotaco
old slip and water. get your taco fix before the weekend begins............!!!	1408714334	502810478306136064	f	domotaco
@12KLin sorry we're in DUMBO on Wednesday. Site is not updated now.	1408667848	502615502938988545	f	domotaco
@12KLin just realized the typo. Every Mondays on 52nd and 6th!	1408641337	502504306277613568	f	domotaco
#Tacothursday at @TheSeaport on Front &amp; John st!	1408625435	502437609575317504	f	domotaco
@12KLin Every Monday on 52nd &amp; B'way!	1408625002	502435793189994497	f	domotaco
@12KLin we're gonna be in fidi on old slip and water st this Friday.	1408585040	502268179352391680	f	domotaco
@cutandcover its tough trying to get a spot there!	1408563387	502177359165149185	f	domotaco
@nellcasey My apologies! I just spoke to the staff. 3 of the 5 are new on the truck and messed up your order. Lunch on us next week!	1408560710	502166132275814400	f	domotaco
@dumbolot jay and water on this beautiful #humpday! Email us for catering requests! http://t.co/MdtZ57MfgV	1408541912	502087288634220545	f	domotaco
@theseaport till 8pm!	1408466581	501771326684938240	f	domotaco
#nachotot bucket challenge test run down at @theseaport on John &amp; Front st today!	1408452074	501710481749721089	f	domotaco
Good Morning! We will be in #dumbo today on Front and Adams at noon. Join us for lunch @DUMBOFoodTrucks @jenchung	1409237626	505005322818576384	f	parissandwich
Dumbo join us for lunch today! Front and Adams at 12 pm @DUMBOFoodTrucks #loveparissandwich	1409152778	504649447473971200	f	parissandwich
We will be back in dumbo today on fronts and Adams. Thank you for the support :) #dumbofoodtrucks #dumbo @DUMBOFoodTrucks @jenchung	1408627797	502447515921580032	f	parissandwich
Dumbo join us for lunch today! Front and Adams at 12 pm @DUMBOFoodTrucks #loveparissandwich	1408546512	502106582180978688	f	parissandwich
@ParisSandwich: Dumbo, we're on fronts and Adams today at 12 pm @DUMBOFoodTrucks	1408374337	501384426673434624	f	parissandwich
Front and Adams today!\n@jenchung @dumbofoodtrucks #dumbo #dumbofoodtrucks\n#vietnamese Open at 11:30 till supplies last	1408026675	499926229584445440	f	parissandwich
@ParisSandwich: Back in dumbo today!\nFronts and Adams @jenchung @DUMBOFoodTrucks 11:30	1407768620	498843868289589248	f	parissandwich
Dumbo, we're on fronts and Adams today at 12 pm @DUMBOFoodTrucks @jenchung	1407509340	497756366543798273	f	parissandwich
Back in dumbo today!\nFronts and Adams @jenchung @DUMBOFoodTrucks	1407422924	497393913137995776	f	parissandwich
Front and Adams today!\n@jenchung @dumbofoodtrucks #dumbo #dumbofoodtrucks\n#vietnamese Open at 11:30 till supplies last	1407335912	497028959444697088	f	parissandwich
We are now serving Chinatown Icecream factory @ our 213 grand st location #icecream #asiandesserts @ChinatownICF http://t.co/Sqyn2arhJV	1407243082	496639601310990336	f	parissandwich
@ParisSandwich: Dumbo we will be on fronts and Adams @ 12pm @DUMBOFoodTrucks @jenchung #foodtruck #dumbofoodtrucks	1406816291	494849508346302464	f	parissandwich
Dumbo we will be on fronts and Adams @ 12pm @DUMBOFoodTrucks @jenchung #foodtruck #dumbofoodtrucks	1406560131	493775096457093121	f	parissandwich
Hey dumbo, we are back again today on Adams and fronts. 12pm #dumbo #dumbofoodtrucks @DUMBOFoodTrucks @jenchung thank you for the love!	1406215562	492329868504203264	f	parissandwich
@LaurenFaceEvans  wow thank you so much	1406138571	492006947147616256	f	parissandwich
@plummat hey bud, we will be by you today :)	1406129091	491967185133129728	f	parissandwich
Dumbo! Will be on fronts and Adams at 12:30pm @DUMBOFoodTrucks @jenchung #dumbo	1406129045	491966990525792256	f	parissandwich
@jenchung oh sorry. We will be in dumbo today actually.	1406128939	491966544398659586	f	parissandwich
@jenchung sorry not today. We will be there tomorrow	1406128799	491965959570083840	f	parissandwich
@plummat  sorry bud we are currently catering right now for an event. If your downtown feel free to call for delivery 2122267221	1405964773	491277981931675648	f	parissandwich
Visit the #RedHookLobster hidden gem at 16 Extra Place in Manhattan after work for beer, wine, cocktails and lobster rolls!	1409342125	505443623090290689	f	lobstertruckny
#RedHookLobster has lobster tanks overflowing with tasty shedders for only $10/lb! All you need is butter and some friends to have a feast!	1409338843	505429860895162369	f	lobstertruckny
Take your time, don't run - #BigRed is on 46th &amp; 6th!	1409331312	505398270081122304	f	lobstertruckny
Hudson street between Houston and King	1407772478	498860047884374016	f	thepocketful
Not getting away this weekend? Get to #BigRed at 46th &amp; 6th and have a lunch that tastes like you're in Maine!	1409327721	505383210306793472	f	lobstertruckny
Dear @seanjohn @simonschuster @charlesschwab @glamour_fashion @nypl @hbo @cbc @cbstweet we'd like to make your lunch today at 46th &amp; 6th!	1409324118	505368097931677696	f	lobstertruckny
Need a job? We need you. Send your resume to work@redhooklobster.com http://t.co/dA3zbSND0w	1409322312	505360522460426241	f	lobstertruckny
@emmaryoung All we need is dreamy applicants.	1409321503	505357128891387904	f	lobstertruckny
#BigRed is back in Manhattan at 46th &amp; 6th! Your holiday weekend starts at lunch with the best lobster roll in NYC!	1409320516	505352990535217153	f	lobstertruckny
Are you awesome and need an awesome job? Send your superlative resumes and cover letter to work@redhooklobster.com...	1409252547	505067906066292736	f	lobstertruckny
We're sharing the #LobsterLUV with Brooklyn at Metrotech. Find #BigRed here: http://t.co/Z9h39JVz2X	1409244915	505035895310147584	f	lobstertruckny
We're here, you should be here too! #BigRed at Metro Tech Center in the County of Kings! Details here: http://t.co/OOl6ADthRJ	1409241320	505020817722576896	f	lobstertruckny
Happy people start dancing when they hear #BigRed is in Brooklyn! Check us out at Metro Tech! http://t.co/OOl6ADthRJ https://t.co/zt6VrWd3eF	1409237708	505005668945129472	f	lobstertruckny
I love Thursdays because #BigRed is kicking it in Brooklyn! Check us out at Metro Tech Center! http://t.co/OOl6ADthRJ	1409234106	504990558465830912	f	lobstertruckny
Send your resume to work@redhooklobster.com and work with some of the freshest lobster and people from Maine! http://t.co/MRWVNZJ3cg	1409232905	504985520859258880	f	lobstertruckny
@Teamcap84 Are you in Brooklyn today? Because we are! http://t.co/OOl6ADthRJ	1409232833	504985222233227265	f	lobstertruckny
@foodtruckarmy Sure thing.	1409232693	504984633139003393	f	lobstertruckny
#BigRed is having maintenance done today and will not be on the streets of NYC. You can still get #LobsterLiciousness at 16 Extra Place.	1409150020	504637879604477952	f	lobstertruckny
@AJHX2 Sorry. Yesterday was a tough day on the streets to bring a little #LobsterLUV to NYC.	1409149651	504636329389727745	f	lobstertruckny
@Yarisell23 We were kicked out four parking spots before we called it a day. We do have a brick-and-mortar store at 16 Extra Place to visit.	1409149608	504636150074859520	f	lobstertruckny
@AJHX2 I hope you were able to get to the truck before we had to move today.	1409076484	504329446539939841	f	lobstertruckny
Its lunch time! We are parked on the corner of Varick&amp;King street. Stop by and get a delicious hot fresh pizza or... http://t.co/Cll7iBOnUn	1409325674	505374623907577859	f	eddiespizzany
Varick and king for lunch today	1409324049	505367809485176832	f	eddiespizzany
Friday: varick and king for lunch. Book us for your next #catering #event #eddiespizza http://t.co/9XGrD8zuyP	1409314779	505328927985111040	f	eddiespizzany
Friday: varick and king for lunch. Book us for your next #catering #event #eddiespizza http://t.co/sLqp3o0wZp	1409314774	505328907533692928	f	eddiespizzany
It's dinner time! We are parked on 73st &amp; 3rd ave. Stop by and enjoy some hot fresh pizza. You can also call in... http://t.co/y59vmV3BB7	1409257787	505089885795913728	f	eddiespizzany
@DoctorGuarini we r shooting for 74th and 3rd in front of Duane reade	1409244682	505034918628704256	f	eddiespizzany
Thursday: water street at Hanover today #fidi #lunch #nycfoodtruck #eddiespizza only 270 calories for a personal pie! http://t.co/CP9lIy9IAN	1409235809	504997701122273280	f	eddiespizzany
Thursday: water street at Hanover today #fidi #lunch #nycfoodtruck #eddiespizza only 270 calories for... http://t.co/6qw8ZIFWRb	1409235807	504997694583357440	f	eddiespizzany
RT @thedailymeal: @EddiesPizzaNY Congrats! You made our list of the 101 Best Pizzas in America. See the full story here: http://t.co/XcCUZe...	1409181350	504769287123664896	f	eddiespizzany
RT @UrbanSpaceNYC: Don't know 'bout you, but we're freaking out that it's almost Labor Day (eek!) &amp; that #MadSqEats is returning (yay!) htt...	1409172983	504734192622919681	f	eddiespizzany
@HealthiNation come try our 270 calorie personal pizzas! http://t.co/WkRcCc6OwN	1409093481	504400737473159168	f	eddiespizzany
Tuesday: 47th between park and lex for lunch. #eddiespizza #healthylunch #vegetarian a personal pizza is only 270... http://t.co/F44UZtsc4o	1409066918	504289323672670208	f	eddiespizzany
Tuesday: 47th between park and lex for lunch. #eddiespizza #healthylunch #vegetarian a personal pizza... http://t.co/pjogSM39zh	1409066913	504289302856359936	f	eddiespizzany
Off the streets today doing #catering #events. http://t.co/ZBNV0HF4Kr	1408989215	503963411752165377	f	eddiespizzany
Off the streets today doing #catering #events. http://t.co/2L4yBDeQ7f	1408989213	503963406068502528	f	eddiespizzany
Great events this past weekend including this photo from a baby shower! Book us for your next #event... http://t.co/Oh1kqZKp8n	1408981181	503929717373009920	f	eddiespizzany
Off the streets today for #catering #events #eddiespizza #wedding #birthday #celebrate http://t.co/A2w5O8FVTN	1408714089	502809449648910337	f	eddiespizzany
Off the streets today for #catering #events #eddiespizza #wedding #birthday #celebrate http://t.co/yJkxJ4DhdJ	1408714086	502809438181654528	f	eddiespizzany
Dinner on upper east side Thursday night 74th st at 3rd ave until 830p #eddiespizza http://t.co/qB49VqdVnV	1408651696	502547754825306112	f	eddiespizzany
Complimentary slices while they last!  Abington House Summer Series Event at 500 West 30th Street from 6-9pm!... http://t.co/5dJlobE310	1408579795	502246181255131137	f	eddiespizzany
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
Catering Now Available! Call 908 591 4972 or Email miamifoodmachine@gmail.com for details http://t.co/gjyuYENKg8	1384441885	401004449772347392	f	miamimachinenyc
Catering Now Available! Call 908-591-5972 or Email miamifoodmachine@gmail.com for details http://t.co/npC7ELfEYw	1384373440	400717369690968064	f	miamimachinenyc
"Grapefruit Paloma was the perfect cocktail of choice to start the meal. It is spicy, zesty, and very... http://t.co/GXrejwr2ji	1409332286	505402358486933505	f	mexicue
Friday, finalllyyy 	1409321953	505359015434797056	f	mexicue
RT @Tacononymous: @Mexicue Did somebody say, "Nachos"?  (I love nachos)	1409257686	505089459982172160	f	mexicue
HOLD UP-- #MadSqEats comes back Sept 5-Oct 3! @UrbanSpaceNYC @MadSqParkNYC #SLIDERS #TECATE #NACHOS #TACOS #eeeeeats	1409251263	505062520399208450	f	mexicue
HOLD UP-- #MadSqEats comes back Sept 5-Oct 3! @UrbanSpaceNYC @MadSqParkNYC #SLIDERS #TECATE #NACHOS #TACOS #eeeeeats http://t.co/5VFyn9rc9m	1409251261	505062512144814080	f	mexicue
Feelin indecisive? DITTO : Burnt Ends Sloppy Joe Bun + Pulled Pork Taco = great success #mexicue... http://t.co/TLTAtePjv9	1409242945	505027634040803328	f	mexicue
urbanspacenyc's photo http://t.co/L6Khww3kSL	1409236985	505002634718490624	f	mexicue
RT @BCDRestaurants: There is a reason everyone loves @Mexicue so much! The food is addicting! #BBQGoodness #RedHotMexican #BCDStrategic	1409235363	504995832874012672	f	mexicue
RT @RiojaWine: @Mexicue thank you for saving us from the food dead zone that is Times Square.  we've visited you 3 times since opening!	1409172846	504733618217156609	f	mexicue
The famous green chili mac n' cheese #ExtraCheesy http://t.co/4aRRt3eIZN	1409160464	504681682562080768	f	mexicue
Fresh and ready to get devoured #Avocados #Guacamole #Mexicue @ Mexicue http://t.co/kUQSXci5em	1409155794	504662094869184512	f	mexicue
Ay Maria! It's time for a GREEN CHILI BLOODY MARIA (tequila, our very own green chili bloody mix,... http://t.co/3J06wyHeOO	1409097300	504416753473314817	f	mexicue
RT @LAYS: @Mexicue As a flavor expert, wed love for you to try our #DoUsAFlavor finalists. Pls follow us so we can DM you w/ details for a...	1409079488	504342045688094720	f	mexicue
RT @rvandolsen: Looking forward to another round of #MadSqEats with @UrbanSpaceNYC + @MadSqParkNYC. Sept 5 - Oct 3! @TimeOutNewYork http://...	1409077819	504335043104227329	f	mexicue
RT @DJMikeAllan: Oh @Mexicue... How who brighten my day!	1409075588	504325689063899138	f	mexicue
Pass the awesomeness please. #mexicue #lunch #tacos #mac #cheese #corn #sliders #chili @ Mexicue http://t.co/pvj6RfRJ4I	1409069437	504299888897974272	f	mexicue
Brisket Tacos are always a good idea. #TACOTUESDAY #mexicue #eeeeeats #tacos @ Mexicue http://t.co/pAZedmXnFf	1409059380	504257705817948160	f	mexicue
Come to artbridge's Gowanus exhibition opening, This Wed Aug 27 6pm, and get free food, awesome art,... http://t.co/ArmyWWVGC4	1409000211	504009532700647424	f	mexicue
RT @ArtBridge: Canoe with us this Wed at 6pm, courtesy of @gowanusdredgers !  Plus free food and a major art exhibition opening:  http://t....	1408999346	504005904229203968	f	mexicue
Chef @MC4Adriana #MasterChef -S4 stops in #MexicueTSQ to fuel up on our KALE &amp; QUINOA bowl salad #MeatlessMonday http://t.co/qWNZM4vN5e	1408983835	503940846191144961	f	mexicue
SCREAM IT FROM THE ROOFTOPS ITS CHEESESTEAK FRIDAY!  randomfoodtruck  VictoriasSecret DefJamRecords YRNY 55th st &amp; Brdwy till 3 GOT WHIZ?	1409323002	505363415192576000	f	carlssteaks
SCREAM IT FROM THE ROOFTOPS ITS CHEESESTEAK FRIDAY! @randomfoodtruck @VictoriasSecret @DefJamRecords @YRNY 55th st &amp; Brdwy till 3 GOT WHIZ?	1409322944	505363174661828609	f	carlssteaks
Thursday means @TheSeaport front &amp; John st till 8 grab a Carl's famous Cheesesteak &amp; cool off by the water GOT WHIZ? http://t.co/UJpAPM9iA7	1409240255	505016352604573696	f	carlssteaks
Thursday means @TheSeaport front &amp; John st till 8 grab a Carl's famous Cheesesteak &amp; cool off by the water GOT WHIZ? http://t.co/xmhTGrSGxd	1409240171	505015999645908992	f	carlssteaks
Good morning Midtown East!Long weekend almost here stop by 47th st &amp; Park av till 3 for your Carl's famous... http://t.co/7tobWPmRU4	1409147785	504628503699275776	f	carlssteaks
Good morning Midtown East!Long weekend almost here stop by 47th st &amp; Park av till 3 for your Carl's famous Cheesesteak @mlb @UBS GOT WHIZ?	1409147664	504627994380763136	f	carlssteaks
It's a DUMBO TYPE OF DAY again folks  at dumbolot till 3 30 grab a Cheesesteak and cool off by the water GOT WHIZ?	1409066336	504286882617098240	f	carlssteaks
It's a DUMBO TYPE OF DAY again folks @dumbolot till 3 30 grab a Cheesesteak and cool off by the water GOT WHIZ?	1409066265	504286583340937217	f	carlssteaks
RT @dumbolot: Happy Tuesday with @SweetChiliNYC @KimchiTruck and @carlssteaks today!	1409058339	504253340751245312	f	carlssteaks
Another great day at afropunk in Brooklyn Commodore Barry Park till 9 great, cheesesteaks and great music!! GOT WHIZ? http://t.co/9ljGvDx7Bm	1408895584	503570694576152576	f	carlssteaks
Another great day @afropunk in Brooklyn Commodore Barry Park till 9 great, cheesesteaks and great music!! GOT WHIZ? http://t.co/utXNBk5JFy	1408895524	503570443044139008	f	carlssteaks
Hanging in Brooklyn all weekend @afropunk Commodore Barry Park 11-9 great music &amp; great Cheesesteaks Fries and... http://t.co/TBslwz6Mhj	1408806499	503197045406978048	f	carlssteaks
Hanging in Brooklyn all weekend @afropunk Commodore Park 11-9 great music &amp; great Cheesesteaks Fries and more  = perfect weekend! GOT WHIZ?	1408806428	503196746689019904	f	carlssteaks
SCREAM IT FROM THE ROOFTOPS IT'S CHEESESTEAK FRIDAY FOLKS!  55th st &amp; Broadway till 3 : 30 perfect ending to your... http://t.co/fti9GviKlh	1408718079	502826186683080704	f	carlssteaks
SCREAM FROM THE ROOFTOPS IT'S CHEESESTEAK FRIDAY @randomfoodtruck @VictoriasSecret @DefJamRecords @Barclays @YRNY Broadway &amp; 55th st 3:30	1408717716	502824662976720896	f	carlssteaks
Not to late for that early dinner or late day cheesesteak @TheSeaport here.till 8 GOT WHIZ? http://t.co/GkbWJMZvMJ	1408650358	502542145262456832	f	carlssteaks
It's a Seaport type of day @TheSeaport front &amp;John st till 8 pm great weather &amp; great Cheesesteaks the perfect... http://t.co/A10DYVFWe9	1408638897	502494073169526784	f	carlssteaks
It's a Seaport type of day @TheSeaport front &amp;John st till 8 pm great weather &amp; great Cheesesteaks the perfect match! http://t.co/HsunbnLp5W	1408638840	502493832903421952	f	carlssteaks
@jimmyfallon roommate in college was so drunk he fell in corner of stairwell railing had hole in his check no joke #drunkenroomate	1408569219	502201823110123520	f	carlssteaks
RT @flavorpill_nyc: THREE DAYS LEFT until @afropunk Fest 2014 kicks off! RSVP now for $10 off weekend fast passes http://t.co/qHQ4vkrD4X	1408568988	502200851491205120	f	carlssteaks
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
RT @asphaltpunk: Big Bad Brisket and Lil Piggies from @mikenwillies - had to sneak out of #BEA14 for these yummy sliders! http://t.co/vvW1W...	1401471595	472432229122322432	f	mikenwillies
RT @randomfoodtruck: Lunch at the office from @Chefsamirtruck @souvlakitruck @carlssteaks @CarpeDonutNYC @funbunsnyc and at Javits from @mi...	1401471548	472432032249704448	f	mikenwillies
RT @Sweet_Taters: Grab your Sweet Potato Shroom Taco at @mikenwillies at the @javitscenter today! Tweet a pic &amp; you could win a $100 GC #sw...	1401395649	472113686904340482	f	mikenwillies
We're at the @javitscenter today for the  @BookExpoAmerica with your favorites characters #BigbadBrisket #lilPiggie #Pea-Nocchio	1401374548	472025186091278336	f	mikenwillies
RT @GovIslandFood: Only 2 more days till we are back @Gov_Island with @SweetChiliNYC, @DiSOSNYC, @carlssteaks, @Getstuffednow, @MayhemAndSt...	1401368180	471998474871767040	f	mikenwillies
Thinking of those that have made the ultimate sacrifice for our country on this Memorial Day.  Thank you to all... http://t.co/gMrpRYtn7v	1401117086	470945310189957121	f	mikenwillies
Have a wonderful labor day weekend everyone we will be back to serve you for lunch on Tuesday	1409321550	505357328892583936	f	funbunsnyc
Starting the labor day weekend early Come for your last chance this week to get the best buns in Midtown on 50th st between 6/7 ave #midtown	1409238730	505009953585651712	f	funbunsnyc
It's to nice to be indoors, come our to 50th st between 6 / 7 ave for lunch. http://t.co/pOTyB30AMT	1409151261	504643083880132608	f	funbunsnyc
The best value you can get in nyc from fun buns on 50th st between 6 / 7 ave #midtown lunch	1409066741	504288582413320192	f	funbunsnyc
http://t.co/NqSt28F4GX	1408977742	503915290246524928	f	funbunsnyc
Open @ 23rd &amp; Park!	1407323632	496977452171005952	f	carpedonutnyc
Start the week right and satisfied with your favorites. The pork belly or peking duck. Look for the bright blue balloons on 50th st 6/7 ave	1408977658	503914940097638400	f	funbunsnyc
Come end your week with a free tea egg when you order any rice bowl combo. @ 50th st between 6 / 7 ave http://t.co/Miv4Pb9Jlb	1408716770	502820696607952896	f	funbunsnyc
http://t.co/25r4N5ogGf	1408632079	502465477684494337	f	funbunsnyc
Beef bulgogi made with shirt ribs, topped with kimchi, Kew pie mayo, scallions and sesame seeds. @ 50th st between 6 / 7 ave #midtown lunch	1408632042	502465319416643586	f	funbunsnyc
What a day to have a to be outside . Get your lunch here at 50th st between 6 / 7 ave #midtown lunch	1408546824	502107892645122048	f	funbunsnyc
Serving our delicious bowls and buns with sides of salt and vinegar crackling, baked potato fries, and sweet corn balls on 50th st  6/7 ave	1408457920	501735000669450241	f	funbunsnyc
Oh what'd for lunch . A duck ? A beef ? Or a pork? Over rice or buns at 50th st between 6 / 7 ave #midtown lunch	1408370722	501369266185445376	f	funbunsnyc
TGIF ending the work week with the best lunch midtown has to offer @ 50th st between 6 / 7 ave #midtown	1408116670	500303693779312642	f	funbunsnyc
New addition for our sides Tomato flavored Baked potato fries goes well with a beef and chicken bun. 50th st between 6/7 ave #midtown lunch	1408024907	499918810343014400	f	funbunsnyc
Check out our menu and http://t.co/17TJ9XEFL3 and get your order at 50th st between 6 / 7 ave #midtown lunch	1407943252	499576327071350784	f	funbunsnyc
RT @FoodtoEat: happy hump day! #treatyoself to some @funbunsnyc today on 50th btwn 6th &amp; 7th! preorder &amp; check the menu here: http://t.co/X...	1407942824	499574529858220032	f	funbunsnyc
To Celebrate our anniversary today, we will be giving away one free bun for each order over $10. @ 50th st between 6 / 7 ave #midtown lunch	1407854988	499206120523956224	f	funbunsnyc
Serving the peking duck on a bowl today at 50th st between 6 / 7 ave #midtown lunch	1407766910	498836695664840704	f	funbunsnyc
RT @TamaniG: @funbunsnyc I know what I'm having for lunch tomorrow.	1407537342	497873817407356930	f	funbunsnyc
RT @toastmonsternyc: Spanks for the tender buns today @funbunsnyc	1407523047	497813860175593472	f	funbunsnyc
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
Come visit us @BklynBrdgPark right by @CitibikeNYC we also have promo codes for a 24hr rental! We are here until 7:30pm	1408298494	501066317089505280	f	delsnyc
RT @PaulCartelli: Cheaper than a train ticket to #RhodeIsland...@DelsNYC http://t.co/eHj2PtoV1x	1408298415	501065986121150464	f	delsnyc
Sorry everyone we were unable to make it out today. We will be in DUMBO until 8pm tomorrow, and in Williamsburg @Verboten BBQ at 50 Kent Ave	1408221790	500744599288426496	f	delsnyc
@26dishes so sorry we were unable to make it out today :(. In DUMBO and Williamsburg tomorrow.	1408221712	500744272602464256	f	delsnyc
Hey @MadSqParkNYC #Flatiron come visit us at 21st &amp; 5th until 5pm! We are also down on Water St &amp; Old Slip in the #FiDi !	1408120201	500318505875808258	f	delsnyc
RT @lfhorton: Found the @delsnyc truck today in #soho!! Yummmm! http://t.co/nObf02LBaD	1407776221	498875746283429889	f	delsnyc
Find us at our #Flatiron locAtion 21st &amp; 5th until 5pm!	1407776189	498875614410317824	f	delsnyc
@DepthDeception yes our usual spot by @BklynBrdgPark	1407612348	498188413443784704	f	delsnyc
It's a beautiful day to improperly utilize words. We could be ascertained at 46th and Park, juxtaposed to the prudent Helmsley building	1409324474	505369590810296320	f	nautimobile
Today is very special.. Help us figure out why that is.. We're at 17th and 5th	1409230847	504976888977448960	f	nautimobile
17th and 5th tomorrow!	1409162782	504691406729117697	f	nautimobile
Off today through Wednesday recovering from the PGA madness, back on the streets Thursday!	1408998284	504001451547701248	f	nautimobile
Thanks to all the golfers and attendees at the PGA Barclays this weekend #golf #funk http://t.co/EaRPzhQK94	1408917848	503664080029487105	f	nautimobile
RT @TheBarclaysGolf: .@LukesLobster made a special delivery to the media center to make our media very happy! #thebarclays @NautiMobile htt...	1408830882	503299314677198848	f	nautimobile
There's no better way to spend the last days of summer then sniffin' the sweet greens at #TheBarclays. Lobster rolls alllll day	1408809918	503211387674697728	f	nautimobile
@kristinalepore yep! All weekend. We are in spectator village on the grounds	1408750879	502963759087112193	f	nautimobile
RT @LukesLobster: Getting hungry out on the green? @NautiMobile will take care of you. Find us @WyndhamChampionship @thebarclays through Su...	1408731462	502882319905345537	f	nautimobile
Day 3 at #thebarclays in BEAUTIFUL Paramus, NJ. http://t.co/wMdtAAJ2MJ	1408729491	502874050927271936	f	nautimobile
RT @LukesLobster: Nothing like a lobster roll from @NautiMobile at the @WyndhamChampionship  @thebarclays to reward the perfect shot.	1408674345	502642753260765186	f	nautimobile
RT @Swaggyjg: @LukesLobster @NautiMobile @thebarclays amazing rolls!!! http://t.co/UNCRsAaNpk	1408674292	502642530471903232	f	nautimobile
RT @LukesLobster: Catch @NautiMobile at the @WyndhamChampionship @thebarclays all week long! Watch out for lobsters in those sand traps!	1408469074	501781781696495616	f	nautimobile
@jessmish don't know yet! On our way to set up now	1408469069	501781764252389376	f	nautimobile
We are off the streets all week, serving at the PGA Barclays in NJ. We'll see you all next week 	1408461167	501748617489960961	f	nautimobile
Pier13 now, look at all these trucks! @AmandaBananasNJ @PVPIZZATRUCK @waffledelys @Aroy_D @TFQfoodtruck @TheTacoTruck @themoofoodtruck	1408298788	501067551519285248	f	nautimobile
Haven't seen you in TWO WEEKS Hoboken. We are here today though at pier 13!	1408205013	500674229755723776	f	nautimobile
46th and Park where we are being featured on a Japanese video tour!! !!	1408116442	500302737138257920	f	nautimobile
@GinaM330 yep!	1408065650	500089698870886400	f	nautimobile
@katbot8900 46th and Park!	1408065643	500089669393330178	f	nautimobile
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
We will be open until 11 pm http://t.co/Trd3jxUjU1	1386467949	409502378480922624	f	crafflesnyc
We are at Grand Army Plaza!!! http://t.co/twm4sqY4Op	1386449335	409424303105785856	f	crafflesnyc
We are at Brooklyn College today!!! Until 9 pm!!! http://t.co/RpCamD3r2V	1386289643	408754508500848640	f	crafflesnyc
@downtownlunch correction we are on king&amp;varick today. The word of the day is "amore" for ur free upgrade. #SoHo get ur #deliheaven on	1392220340	433629653711212545	f	deliheaventruck
@downtownlunch DH is on varick&amp;charlton today. The word of the day is "amore" for ur free upgrade. #SoHo get ur #deliheaven today	1392217592	433618126148993024	f	deliheaventruck
@midtownlunch Today is the Day!! Grand Opening on Broadway &amp; 55st. Rotisserie chicken, pastrami @ corn beef sandwiches New York Style	1392131026	433255045355036672	f	deliheaventruck
@midtownlunch HH3 is on 46 st &amp; 6 Ave. HH2 is on Park Ave &amp; 33st. Word of the day is "Peyton" for your free upgrade. #midtown get ur #YumYum	1391178361	429259276079861760	f	deliheaventruck
Hi guys We are very sorry Grill on wheels off the road today 	1409324168	505368309312024576	f	grillonwheelsny
Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00crazy chicken baby chicken lamb burger couscous kofta kabab	1409227360	504962266945847298	f	grillonwheelsny
Join us 4 lunch Water st and Old Slip 11am to 3pm\nschnitzel crazy chickenshawarma yummy	1409150997	504641975648526336	f	grillonwheelsny
Join us 4 lunch Water st and Old Slip 11am to 3pm\nschnitzel crazy chickenshawarma yummy	1409141604	504602578026762240	f	grillonwheelsny
Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00	1409062198	504269525567934464	f	grillonwheelsny
Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00	1409057343	504249163870392321	f	grillonwheelsny
Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00	1408718384	502827465539321856	f	grillonwheelsny
Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00crazy chicken baby chicken lamb burger couscous kofta kabab	1408710611	502794861557608448	f	grillonwheelsny
Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00crazy chicken baby chicken lamb burger couscous kofta kabab	1408631912	502464775574814720	f	grillonwheelsny
Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00crazy chicken baby chicken lamb burger couscous kofta kabab and More	1408623142	502427993147707392	f	grillonwheelsny
Join us 4 lunch @ Old Slip Park 11am \nJust across the street from our usual location!! schnitzel crazy chickenshawarma yummy	1408538045	502071069894017024	f	grillonwheelsny
Join us 4 lunch @ Old Slip Park 11am \nJust across the street from our usual location!! schnitzel crazy chickenshawarma yummy	1408450315	501703100894572544	f	grillonwheelsny
Hi guys We are very sorry Grill on wheels off the road today we'll see you tomorrow	1408368225	501358791003488256	f	grillonwheelsny
Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00	1408113626	500290928528334848	f	grillonwheelsny
Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00crazy chicken baby chicken lamb burger couscous kofta kabab and More	1408104731	500253616301965312	f	grillonwheelsny
Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00crazy chicken baby chicken lamb burger couscous kofta kabab and More	1408026343	499924833053192192	f	grillonwheelsny
Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00crazy chicken baby chicken lamb burger couscous kofta kabab and More	1408017963	499889685486108672	f	grillonwheelsny
Hi guys We are very sorry Grill on wheels off the road today we'll see you tomorrow	1407936445	499547776666324993	f	grillonwheelsny
Join us 4 lunch @ Old Slip Park 11am \nJust across the street from our usual location!! schnitzel crazy chickenshawarma yummy	1407846187	499169206517374976	f	grillonwheelsny
Grill on Wheels at 46th st off 6th ave! Open from 11:00-3:00	1407763244	498821316443926529	f	grillonwheelsny
The Schnitzcart will finish off the week on 49th between 6th &amp; 7th aves. 11:30-2:30. Stop by for some schnitz!	1409322751	505362362325815296	f	schnitznthings
Morning guys! Finish off the week strong. The truck will be on broad and Pearl sts 11:30-2:30pm. Preorder 347-772-7341	1409322634	505361872556937217	f	schnitznthings
The Schnitzcart will be on 26th street between 11th &amp; 12th aves from 11:30-2:30pm. Hope to see you there	1409236826	505001970592399361	f	schnitznthings
Hey guys the truck will be on 51st between park and madison from 11:30-2:30pm! Stop by or preorder 347-772-7341	1409236704	505001456735637504	f	schnitznthings
:) thank you!RT @prohaska: .@schnitznthings God bless you. You have literally saved the day with your delicious schnitzel sandwich.	1409160832	504683226183794688	f	schnitznthings
@pinguswobbin yup	1409145512	504618969740115968	f	schnitznthings
The truck will be parked on 47th street between park and lex from 11:30-2:30pm! Stop by! Preorder 347-772-7341	1409145466	504618777477410816	f	schnitznthings
@pinguswobbin the Schnitzcart will be back on 27th &amp; PARK ave today from 11:30-2:30! We missed you guys! Hope to see you all!	1409145384	504618435117350912	f	schnitznthings
Schnitzcart is on Greenwich street and park place until 2:30. Stop by for schnitz!	1409071734	504309521490407424	f	schnitznthings
Sorry for the late update. Truck is on 48th street between 6th &amp; 7th ave until 2:30pm. Stop by! Preorder 347-772-7341	1409071623	504309055721312256	f	schnitznthings
The Schnitzcart will be on 55th &amp; broadway from 11:30-2:30pm. Swing by and gorge on schnitz:)	1408974870	503903246382292992	f	schnitznthings
Good morning guys! The truck will be on Varick and Charlton from 11:30-2:30pm. It's a beautiful day for schnitz! Preorder 347-772-7341:)	1408974813	503903005792796674	f	schnitznthings
@MatthewPizzulli don't think they have any today on cart Matt. Sorry:(	1408720500	502836339814195201	f	schnitznthings
The Schnitzcart will finish off the week on 49th between 6th &amp; 7th from 11:30/2:30pm! Swing by:)	1408716416	502819210964504576	f	schnitznthings
Morning guys! The truck will be on broad and Pearl sts from 11:30-2:30pm. TGIF or what? Preorder 347-772-7341:)	1408716335	502818869229416448	f	schnitznthings
The Schnitzcart will be on 26th between 11th &amp; 12th from 11:30-2:30pm. Gorgeous day for schnitzel:) c ya	1408627589	502446642327351298	f	schnitznthings
Good morning guys! The truck will be on 51st between park and madison from 11:30-2:30pm. Swing by for lunch. Preorder 347-772-7341	1408627335	502445580212523009	f	schnitznthings
The Schnitzcart will be on 49th between 6th &amp; 7th 11:30-2:30pm. Hope to see you soon!	1408544183	502096812405456896	f	schnitznthings
Good morning guys! Week almost over. Have a schnitz! Truck on 47th b/w Park &amp; lex 11:30-2:30. Preorder 347-772-7341.	1408544082	502096389015625728	f	schnitznthings
The Schnitzcart will be on Greenwich &amp; park place from 11:30-2:30pm. Get some!	1408458832	501738825203585024	f	schnitznthings
Shorty's is OPEN this Labor Day Weekend. All Locations open at NOON Saturday 8/30, Sunday 8/31 and Monday 9/1.... http://t.co/0Qfj3Vk4kT	1409364069	505535665577414656	f	shortysnyc
RT @ShortysTrivia: Thanks to @ConeyIslandBeer for providing the grand prize to our September Tournament 4 @Yankees tix on Wed 9/25!! @short...	1409336745	505421059395686400	f	shortysnyc
RT @ShortysTrivia: 4-week tourney starts Tues @shortysnyc Pearl St..what's the prize? How bout seeing #DerekJeter in his last day game ever...	1409323765	505366617443033088	f	shortysnyc
@Roaming_Student was in the shop yesterday.  apologies for late response.  we're @ south st. seaport today.	1409323746	505366538971779072	f	shortysnyc
Up and running at #SouthStreetSeaport Water and Fulton Streets @Dossieroutpost #Cheesesteak #ChickenCheesesteak... http://t.co/JiKTNG2TJQ	1409323308	505364701065146369	f	shortysnyc
RT @JPettyIII: I'm so hungry right now yo... And I have a cheesesteak from @shortysnyc screaming my name.	1409220920	504935252914360320	f	shortysnyc
RT @greg_yurchuk: I'd share a pic of my cheesesteak from @shortysnyc but it's already gone.  And it was good.	1409220910	504935212942655488	f	shortysnyc
@benjaminballing 1678 1st ave (87th/88th)	1409220901	504935174170505217	f	shortysnyc
Up and running at 47th and Park #NYC #Midtown #FoodTruck #NYCFoodTruck #Cheesesteak #ChickenCheesesteak... http://t.co/Gmuizex750	1409064205	504277944756625408	f	shortysnyc
Up and running at #SouthStreetSeaport Water and Fulton Streets @Dossieroutpost #Cheesesteak #ChickenCheesesteak... http://t.co/tmPADofHkF	1408981798	503932304935223296	f	shortysnyc
RT @SamuelTudor: @PhillyGiL @shortysnyc best atmosphere and cheesesteak in nyc	1408819269	503250605885104131	f	shortysnyc
RT @PhillyGiL: If you're in NYC come thru! Great location @shortysnyc http://t.co/ZJ1BbX8bsw	1408817520	503243270554931200	f	shortysnyc
RT @worldwidewaddie: I ate the hottest cheesesteak ever...and survived! It was good too. (at @ShortysNyc in New York, NY) https://t.co/jQlr...	1408817506	503243212421885952	f	shortysnyc
Glad to be back.  Up &amp; running @Pier13Hoboken until 10pm #Hoboken #Pier13 #Cheesesteaks #ChickenCheesesteaks... http://t.co/zgsBsv65dQ	1408811052	503216142471548928	f	shortysnyc
RT @Ryan_Hecht: Just ate @shortysnyc ..best cheesesteak I've ever had, would definitely reccomend!	1408730148	502876809122549761	f	shortysnyc
Little League World Series action heating up... As your watching the Eagles, cheer on Philly's Phinest, the Taney... http://t.co/mws2jQdRXF	1408651434	502546658664939520	f	shortysnyc
Eagles/ Steelers-- Tonight @ 7:30pm. Game sound on at all 4 locations. DJ Ferdman up at Shorty's 1st Ave. #GetPhillyWitIt	1408650596	502543141816516608	f	shortysnyc
truck still in shop.  no lunch today.  hoping to make it to hoboken later.	1408631911	502464769652047873	f	shortysnyc
RT @andynieves13: @shortysnyc Madison.  Can't wait to catch these eagles games on Sundays!!!  Go birds!!!!	1408625634	502438442387910656	f	shortysnyc
@dumbolot truck is in the shop :( be back next week	1408543095	502092251343097857	f	shortysnyc
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
Hello Upper West Side! We've moved to 88th and Broadway for dinner!	1398202486	458720592602996736	f	goburger
Truth. Just awoke from hibernation but will be back over there! MT @quarropas it's been a while I think since you have been in midtown west.	1398180649	458629000668401664	f	goburger
#pietruck - NYC"s first &amp; only savory pie &amp; flat white truck is @ Varick Ave &amp; King St. until 2.30p	1409315033	505329994059776000	f	dubpies
@GABABAY Not tonight, sorry. Seems we have to let our staff take vacations during summer too! ;-(	1409268640	505135405218672640	f	dubpies
RT @yeastieboys: @coffeelater just remembered if missed travel advice last week: I love Blind Tiger, Roberta's Pizza, @dubpies &amp; Double Win...	1409243061	505028118999216129	f	dubpies
#pietruck is at Grand Central until 2.30pm. Park Ave &amp; 47th st.	1409144071	504612927807455232	f	dubpies
RT @oharris69: @powderkeig @gemmagracewood @AviatrixP @dubpies all the pies and lamingtons! Prospect Park stop :)	1409090698	504389061931724800	f	dubpies
We're there on Mondays! RT @vllg: @dubpies Why has thou forsaken DUMBO? Hast thine love strayed? Verily, we eat pies, if pies are to be had.	1409090643	504388833585397760	f	dubpies
DUB TruckMail: Where will the Pie Truck be this week? - http://t.co/AbhQZAVUIL\nSoho &amp; Midtown East update!	1409088153	504378388040003584	f	dubpies
RT @lukeah: @NewYorkOwls Keep your eyes out for @dubpies best in the city.	1409082422	504354352048635904	f	dubpies
#PieTruck is @StarrettLeHigh until 3pm. Savory &amp; Sweet pies, espresso coffee	1409066294	504286705663610880	f	dubpies
RT @NZGourmetPies: Why not celebrate the slaughtering of the wallabies with a kiwi pie!! http://t.co/DRpYqR79Y2	1409024794	504112642899075073	f	dubpies
DUB TruckMail: "Where, oh where, could that trucky truck be (this week)? - http://t.co/SxUteFL0nf	1409024702	504112256750477313	f	dubpies
Most excellent!  We know you're gonna love the mince &amp; cheese! Legend! RT @kloo010: @dubpies  have ordered a big batch today.  Can't wait.	1409014887	504071090457821184	f	dubpies
Choice!  3800+ followers! Now sending 12 pies to @rachelr1977 in Chicago! Next, 24 pies @ 4000. Be in to win! Pls RT	1409012845	504062524317499392	f	dubpies
You're very welcome!  Thank you!  RT @valprosianos: Thanks @dubpies for making Mondays delicious. #meatpiemonday #dumbo	1408984316	503942863361966080	f	dubpies
Yay! Reached 3800 followers. Now sending 12 pies to @rachelr1977 in Chicago! Next, 24 pies @ 4000. Be in to win! Pls RT	1408979100	503920986035847168	f	dubpies
@mrvcooks some, not all	1408978985	503920507100860416	f	dubpies
DUB TruckMail: Where will the Pie Truck be this week? - http://t.co/SxUteFL0nf	1408976649	503910709407670272	f	dubpies
RT @dumbolot: Good morning #DUMBO! Check out @MexicoBlvd @ToumNYC and @dubpies on Jay &amp; Water!	1408971670	503889825465106432	f	dubpies
Sure. We ship nationwide. "@kloo010: @dubpies @rachelr1977 can this #SF kiwi get some pies!? Mince and cheese please ;) sweet as, bro!"	1408932714	503726428660449280	f	dubpies
Yay! Reached 3800 followers. We'll send 12 pies to any US address provided by @rachelr1977. Next, 24 pies @ 4000. Pls RT	1408929241	503711864929665024	f	dubpies
RT @abetterloser: Can't adequately express how I'm feeling eating this ancho chili seitan burger via @VeganLunchTruck, so here's a cat. htt...	1409339360	505432026988945408	f	veganlunchtruck
Want to be a JUDGE at the @VendyAwards (&amp; get in free)? Snap a pic of our food &amp; tag w/ #VendyCitizenJudge\n\nINFO:\nhttp://t.co/IwkOTlfvm0	1409317555	505340570173440000	f	veganlunchtruck
Parked on 47th between Park and Lexington from 9:00-3:00\nslinging lemongrass seitan beet burgers w/ kefir lime cabbage slaw &amp; red curry mayo	1409317449	505340126281883648	f	veganlunchtruck
@DylanKasp Every Friday we are parked on 47th between park and lex.  9:00-3:00	1409277620	505173072237064192	f	veganlunchtruck
Jersey City!  Serving dinner until 8 at the Farmers Market\n\nPlease vote for snaily as your favy vegan truck:\n https://t.co/eFTgSeNwhP	1409261539	505105620954259457	f	veganlunchtruck
RT @MundaneTragedy: Started the day off right with a Cinnamon Snail from the @VeganLunchTruck. What's left will be in my belly shortly. htt...	1409240556	505017613333053440	f	veganlunchtruck
Parked on 21st &amp; 5th from 9:00-3:00\nthen JC for dindin\n\nslinging lemongrass seitan beet burgers w/ kefir lime cabbages slaw &amp; red curry mayo	1409234574	504992523342082048	f	veganlunchtruck
#VeganFoodChat q10 twin peas	1409189304	504802646587633664	f	veganlunchtruck
#VeganFoodChat still happening tonight?	1409188013	504797230831009792	f	veganlunchtruck
@thefoodduo coolio.  My class goes until 9:00 I'll try to join in the #veganfoodchat after that for a bit	1409177449	504752922253873152	f	veganlunchtruck
Have you recently fallen in love with the snail?  Have you loved us for years but never let us know?!?\n\nPlease... http://t.co/PYFVPu1kRX	1409162436	504689956304875520	f	veganlunchtruck
RT @CultureTrip: New York's 10 Best Food Trucks http://t.co/4yAoSWRuIe ft. @KorillaBBQ @souvlakitruck @VeganLunchTruck @biandangnyc http://...	1409154379	504656159048220672	f	veganlunchtruck
Parked on broadway btwn 55th/56th street until 3:00\n\nslinging lemongrass seitan beet burgers with kefir lime cabbages slaw &amp; red curry mayo	1409151113	504642461537697793	f	veganlunchtruck
@JivamuktiJersey please please PLEASE tell kevin that Adam Sobel from the cinnamon snail want to kiss him and hug him x1000	1409149351	504635070532321282	f	veganlunchtruck
Up what's up @MercyForAnimals this is #whataveganlookslike\n\nTwo whole vegans actually. \n\nhttp://t.co/bcWKjf023A	1409083963	504360814602891265	f	veganlunchtruck
Snaily merch all up on our @etsy shop like whoa. PLEASE call 911 bcaus shorty fire burning\n\nhttps://t.co/JEcYH2DdBK http://t.co/pQksy8Uhjb	1409078442	504337657120714753	f	veganlunchtruck
@weppiesingtings we are open daily 9:00-3:00	1409077337	504333023631118336	f	veganlunchtruck
RT @UpOutNYC: The most anticipated street food competition of the year is back: The 10th Annual Vendy Awards! http://t.co/isOzoIdwYo @vendy...	1409076750	504330559519465473	f	veganlunchtruck
@mariyankee yep.  In between park and lex	1409073049	504315037562187776	f	veganlunchtruck
The 10 best food trucks in NYC!... http://t.co/eX4uQehQqW	1409072851	504314206569897984	f	veganlunchtruck
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
Donate 100$ to @DriveChangeNYC &amp; get 1 tix to the #MadeInAmericaFestival featuring @kanyewest @tiesto \nhttp://t.co/ASj4GjwNRu only 20 tix	1409364685	505538248966701056	f	snowdaytruck
Thank you Erica for these stunning photos! @csiSL love \n@DriveChangeNYC http://t.co/jCqyyZyGZi	1409340898	505438476717006849	f	snowdaytruck
RT @nationswell: How food trucks can change the world http://t.co/psPTSI6b7l @SnowdayTruck	1409327642	505382878881271808	f	snowdaytruck
An important step - let's keep trucking toward a better tomorrow @JailsAction @deBlasioNYC @glennEmartin @NYCAIC @thefortunesoc	1409275446	505163953295863809	f	snowdaytruck
RT @JailsAction: Mayor @deBlasioNYC signs Solitary Confinement bill for NYC Jails @glennEmartin @NYCAIC @SnowdayTruck @thefortunesoc http:/...	1409274545	505160175003910146	f	snowdaytruck
Big news: we've been nom-nominated for Rookie of the Year @vendyawards @VendorPower !!! Join us Sept 13th on Gov Island	1409251813	505064827828834304	f	snowdaytruck
RT @slexton: @SnowdayTruck looking as beautiful as ever. What change are you driving? @DriveChangeNYC http://t.co/pAZb3wI7PW	1409244956	505036068769787904	f	snowdaytruck
Where can you taste some of the best food in the city &amp; contribute to criminal justice reform? ONLY @SnowdayTruck http://t.co/jWDMmzg8zM	1409230861	504976948121313281	f	snowdaytruck
CALL FOR LUNCH! @BLDG92 BROOKLYN NAVY YARD BLDG #5 11a-3pm @SITUSTUDIO @BrooklynGrange @RooftopReds @TheDoeFund	1409230713	504976329843175427	f	snowdaytruck
Join us Sept 19th @BLDG92 for an event celebrating food startups! http://t.co/4HFtcNrmKD  \n@RooftopReds @BrooklynGrange @KingsCoWhiskey	1409174839	504741974516436992	f	snowdaytruck
HONORED TO SHARE THE STAGE W/ @dubpies @shanghaisogo @bigdsgrub @GoGoGrill AT THE VENDYS! ROOKIE OF THE YEAR BABY http://t.co/uVLEiH4oA8	1409174710	504741434780823552	f	snowdaytruck
Who's coming to have lunch with us @ The Falchi Building here in Long Island City? We'll be here from now till 4:00 pm. #maplelove #eatlocal	1409156778	504666225168121857	f	snowdaytruck
We work as a team in the gym and on the streets! @SnowdayTruck #Foodtruck #fitness #teamwork http://t.co/AzPBls6R7r	1409077201	504332454283710464	f	snowdaytruck
http://t.co/apFaiTlxH9 such a great video thank you Jacob Templin!! Go check us out on instagram as well @SnowdayTruck for more #maplelove	1408989411	503964235379245056	f	snowdaytruck
Did you know @SnowdayTruck truck uses all locally sourced fresh ingredients to create our maple infused menu items? #maplemonday #eatlocal	1408988551	503960626142912512	f	snowdaytruck
Thanks for the love @Gov_Island - we are excited for the @vendyawards  on Sept 13th!	1408895518	503570421208608769	f	snowdaytruck
RT @Gov_Island: Taste the wares of two #Vendyaward finalists while @Gov_Island today @Snowdaytruck @theAlcreamist @EpochTimes http://t.co/3...	1408895457	503570164777254912	f	snowdaytruck
RT @JailsAction: New Law will bring much needed TRANSPARENCY 2 RIKERS https://t.co/24hNBicfKd @BklynDefenders @JumaaneWilliams @SnowdayTruc...	1408738218	502910652990910465	f	snowdaytruck
.@turshen @Jon_Favreau @DriveChangeNYC we'd love to let him know! We all saw and love the film @ChefTheFilm	1408641457	502504811972280322	f	snowdaytruck
We're driving change! Ask us how - @drivechangenyc come get lunch till 3 at BK Navy Yard! http://t.co/RhIbqXxZCr	1408640610	502501255772532736	f	snowdaytruck
It's Friday yayyyy!!! We are on 52nd &amp;6th start your holiday weekend off right!! Tag us and follow us.	1409321608	505357571977666561	f	mrniceguytruck
RT @TezzaCFS: @MrNiceGuyTruck Already picked up dinner from yous tonight! Thx for the discount code!	1409321529	505357237679058944	f	mrniceguytruck
@TezzaCFS yes sir 634 Mclean avenue.	1409278452	505176562619387905	f	mrniceguytruck
Just bc it's Thursday!! Order from us at http://t.co/1KRNACUTB0 &amp; get $7 off your order of $15+ with code mpro175. http://t.co/53k12Zk3Fj	1409252141	505066204294574081	f	mrniceguytruck
Hey 71st &amp; York we are back!!Come get your lunch from your favorite Slider Truck. Windows go up at 11am,don't forget to tag and follow us.	1409234235	504991101443657728	f	mrniceguytruck
Taking a break today but you can go on grubhub and http://t.co/OD0ddX4u6B to order from our store.634 Mclean avenue,yonkers,ny 914-457-4324	1409143917	504612280588582913	f	mrniceguytruck
Back on 71st and York don't forget to tag us!! We have all our goodies on board. Windows are up!!	1409066161	504286149012389889	f	mrniceguytruck
Got the Monday Blues?? Stop by Old Slip Park on Water Street and let us clear it with some Sliders, Wings, and fries. http://t.co/CDJ5liOsf7	1408970276	503883978785718272	f	mrniceguytruck
It's show time back @GovIslandFood today come enjoy this relaxing Sunday. WINDOWS are up!!.	1408894111	503564515901198336	f	mrniceguytruck
Costena con Barcelona! :) http://t.co/9Y4t1dJfde	1407611232	498183734810931201	f	palenquefood
RT @GovIslandFood: The sun is shining!!! That means it's time to come over to @Gov_Island and relax while eating from @MayhemAndStout @MrNi...	1408894044	503564237000953856	f	mrniceguytruck
RT @grubstreet: Watch @JimmyFallon and @DavidChang have a hot-wing-eating contest: http://t.co/CDXJnQjoZV http://t.co/MDAnoCNvwQ	1408805753	503193916272037888	f	mrniceguytruck
It's that time again it's Saturday!!! we are at beautiful @Gov_Island come join us for some good food and good vibes. http://t.co/mH7ExR8Yy6	1408805684	503193630019182592	f	mrniceguytruck
RT @GovIslandFood: Come on over to @Gov_Island and grab some sun and great food from @ElPasoTruck @MayhemAndStout @MrNiceGuyTruck @USAFoodT...	1408803460	503184301220184064	f	mrniceguytruck
Happy Friday folks we are on 52nd and 6th today bringing you happiness with our $7 friday special.2 sliders (your choice)with fries. Pass by	1408718596	502828355889414144	f	mrniceguytruck
Our truck is sick today but we will be back on the road tomorrow.If you are in the Yonkers area pass by our Store 634 Mclean ave. We deliver	1408631733	502464023292837888	f	mrniceguytruck
RT @foodtrucksin: @MrNiceGuyTruck You were in the Food Truck Report. Thanks for being a member hope you're using our Serving Now tool http:...	1408590834	502292481162366976	f	mrniceguytruck
We are on 71st and York in the city. Pass by pass by!!!	1408545314	502101558801498112	f	mrniceguytruck
RT @MobileCuisine: 5 Ways To Build Food Truck Staff And Customer Loyalty - http://t.co/2oNFlCuvB7	1408499216	501908207246532608	f	mrniceguytruck
Get Game day ready with our Big Game Combo. We also do catering.  634 Mclean avenue, Yonkers. NY... http://t.co/L3dfej6usB	1408468487	501779322525712385	f	mrniceguytruck
Happy Monday, we will be on Water street today by Old Slip Park come say hi to us. Make sure to tag us on ig and follow us on Twitter :-)	1408371526	501372638959509504	f	mrniceguytruck
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
We won't be on old slip today.  Nowhere to park :(	1409326115	505376472438423552	f	sweetchilinyc
@Maxwell_Kern we will be back next Thursday don't worry!	1409251434	505063240892948482	f	sweetchilinyc
We won't be on the street today,  sorry!  C u tomorrow for our last day @old slip!	1409242236	505024658287374336	f	sweetchilinyc
RT @blcksage_: Your employees were so sweet &amp; the food was GREAT! Thanks for the great service #afropunkfest2014 @SweetChiliNYC http://t.co...	1409242176	505024409649020928	f	sweetchilinyc
@FoodtoEat we are not out with the truck today sorry!	1409242160	505024339436392449	f	sweetchilinyc
We are @TheSeaport today on John btw south &amp; front!  #thaietnamese #lunchtime #hungry #topchef #foodporn http://t.co/rDjvuXRiFh	1409154294	504655802796634112	f	sweetchilinyc
@runsammrun @TheSeaport you know it!	1409154252	504655628607168512	f	sweetchilinyc
It's almost #lunchtime @dumbolot Jay &amp; Water street. 1130-3! #thaietnamese #sriracha #fries #TopChef	1409065097	504281684637126657	f	sweetchilinyc
RT @dumbolot: Happy Tuesday with @SweetChiliNYC @KimchiTruck and @carlssteaks today!	1409058909	504255730233651200	f	sweetchilinyc
Come hang with us today @afropunk on navy btw concord &amp; park till 9! @afropunkfest http://t.co/m1sbSchZH7	1408899626	503587650117574656	f	sweetchilinyc
Come check us out today @afropunk on navy btw concord &amp; park! Here all day! #foodtrucks #thaietnamese	1408806671	503197768098537474	f	sweetchilinyc
RT @truthtrebles: @SweetChiliNYC They know meee now &lt;3 My supplier. :X	1408734595	502895461104357376	f	sweetchilinyc
#TGIF  Come grab lunch on old slip btw water &amp; south street till 3!  #watermelon w/ chili salt!  #lunchtime #excited #feedme #topchef	1408719718	502833062385049600	f	sweetchilinyc
All done for today. See you tomorrow at old slip and water!	1408655946	502565580432769026	f	sweetchilinyc
@nofrieschip @TheSeaport we have fries!	1408655925	502565491962281984	f	sweetchilinyc
Lunch time @TheSeaport John btw south &amp; front!  #thaietnamese #porkbelly #sriracha #fries #topchef come get your sweet heat on!	1408634350	502475000830771200	f	sweetchilinyc
RT @JobsWithHarri: Meet @ChefLisaNYC: #TopChef finalist, owner of @SweetChiliNYC &amp; Harri #PortfolioSuperstar http://t.co/y3sMJnbsbK #TeamHa...	1408634270	502474667731738624	f	sweetchilinyc
All done for today see you tomorrow!	1408570011	502205145456074752	f	sweetchilinyc
@ smorgasbur delicious &amp; Nutricious http://t.co/nfCqwQk6ah	1407599129	498132967722463233	f	palenquefood
@elvisduran come by our food truck before the boat! John btw south &amp; front is a half a block from the boat.  Dinner on us!	1408562497	502173629451608066	f	sweetchilinyc
Lunch @TheSeaport John btw south &amp; front! #thaietnamese #porkbelly #sriracha #fries #topchef #thaietnamese http://t.co/3iNeUIwwM8	1408549832	502120506032914432	f	sweetchilinyc
#steak #potatoes #toastmonster #rawr #tinx #magic #photoshop http://t.co/jdLqDbjAIl	1409022422	504102691627614208	f	toastmonsternyc
Toast Monster has good memories havasmedia http://t.co/tDGokNqCUw	1408346196	501266397411168256	f	toastmonsternyc
#toastmonster #macandcheese #sammich #no #sloppyjoe #edited #photoshop #copyandpaste #macaroni #cheese... http://t.co/xSSoo6y8Dp	1408346012	501265624379584513	f	toastmonsternyc
#toastmonster #lobster #nofilter #mucho #editing #rawr http://t.co/n9GqoZNSN2	1408304632	501092065783336960	f	toastmonsternyc
#iac #urbanspacenyc #gofooda #rawr http://t.co/0TU4IDeDWy	1408133429	500373988086779904	f	toastmonsternyc
RT @Ebuzzing: Eric Shih | People On The Move - New York Business Journal http://t.co/GXfvonBkb9 via @bizjournals	1407994619	499791776761516032	f	toastmonsternyc
Spanks for the tender buns today @funbunsnyc	1407520951	497805066762727425	f	toastmonsternyc
Table made from Southwire pinwheel. Very special way to eat Toast Monster sammiches. http://t.co/kOXrhPa0s3	1407511980	497767438923350017	f	toastmonsternyc
RT @starrettlehigh: We try not to pick faves but we can't lie. Mac &amp; Cheese w/ Sloppy Joe Sandwich from @toastmonsternyc is ridic. Menus: h...	1407511623	497765942248894465	f	toastmonsternyc
Check out #tinxchan #photo #artwork incorporated into #toastmonster #menu http://t.co/1y8jApvmAT	1407511340	497764755214729217	f	toastmonsternyc
#starretlehigh has #yellow #brick #walls #toastmonster #likes #toget #lehigh http://t.co/dCisn88n2z	1407510986	497763270422700032	f	toastmonsternyc
@funbunsnyc + @toastmonsternyc = Monster buns!	1407445188	497487293490663424	f	toastmonsternyc
@funbunsnyc where are you located tomorrow?	1407445024	497486606199422976	f	toastmonsternyc
@funbunsnyc I want!	1407433541	497438442301947904	f	toastmonsternyc
#rawr #kittycat #toastmonster http://t.co/3CVfjuoPIr	1407425975	497406708855996416	f	toastmonsternyc
#toastclub #toastmonster #splash #lo-fi #filter #hidef http://t.co/jqc4K1g9dc	1407223750	496558517793218560	f	toastmonsternyc
@erin_vada we'll post up hints and photos on our instagrams. Rawr!	1407175071	496354342757498882	f	toastmonsternyc
A #view from #associatedpress #mta #trains or also known as #subway #window #clearview #westside... http://t.co/IQZF7mqWek	1407174912	496353676315742209	f	toastmonsternyc
#chicken #pesto #toastmonster #rawr http://t.co/602bi4plPZ	1407173094	496346050563956736	f	toastmonsternyc
#toastmonster #badges http://t.co/eRuODNxFGI	1407024645	495723410665013248	f	toastmonsternyc
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
Palenque is happy to be serving lunch @ Dumbo Jay st &amp; water St until 3:30 pm!	1409330263	505393872944783360	f	palenquefood
check this out: http://t.co/Z4hyUMstwN	1409247909	505048453895159809	f	palenquefood
Comiendo de palenquito! Yummmmmm http://t.co/DLSvfvcvY1	1408904574	503608403059810304	f	palenquefood
@Palenquefood http://t.co/jZuxKbDeJr	1408898414	503582565081825282	f	palenquefood
 sunny day in Rockaway and Palenque is ready for make your belly happy meanwhile you enjoy the beach!!!	1408898331	503582217063641088	f	palenquefood
Working with Yoko @afropunk festival! :) http://t.co/ulBK9QcPIf	1408898317	503582158058180608	f	palenquefood
Arepas all over NYC Truck @afropunk, pier 5 @smorgasburg &amp; beach @RockawayBeachNY. Shrimp arepa is the one today :) http://t.co/i9Cm5yR5ZR	1408892851	503559232487428097	f	palenquefood
Today is a beautiful day in front of the calmed  beach and Pelenque is ready to feed your body and soul come and join us!!!!!	1408808783	503206625545814017	f	palenquefood
Rockaway rocks! Come to beach 97 st and try delicious food options including Colombian Arepas :) @RockawayBeachNY @theRockawaysNY	1408555601	502144704633249792	f	palenquefood
Today we are @smorgasburg pier 5 @ the Brooklyn bridge river park. From now until 5 pm!	1408291213	501035780014628864	f	palenquefood
Palenque crew is ready for rockaway beach 97 serving Colombian Arepas quinoa &amp; multigrain, chorizo,... http://t.co/uPjWFU10KI	1408290841	501034219125370880	f	palenquefood
smorgasburg making arepas http://t.co/D0yvQXhe9A	1408142405	500411635266510848	f	palenquefood
Palenque crew is ready for your arepa or choclo+burger combo w fries @dumbolot @DUMBOFoodTrucks @DUMBOBID enjoy it  http://t.co/HgG27BWR7d	1408116460	500302814179229696	f	palenquefood
Today @rockaway beach Arepas, Caribanolas, best seller: jumbo shrimp arepas yummmm http://t.co/PHKkVgHQ1c	1408034598	499959460585299968	f	palenquefood
RT @adrirpo12: @Palenquefood @theRockawaysNY delicious Colombian arepas. I quinoa with mushrooms and salsa de cilantro. Mmmm! 	1407774480	498868446806151168	f	palenquefood
We are located at Grand Army Plaza, just in front of Union St. Enjoy your Saturday afternoon having the best Colombian Food ever!	1407590010	498094722519678978	f	palenquefood
Hey Prosect Park! Palenque food truck is back &amp; better than ever. Wanna know what an arepa is? Come over &amp; taste our best Colombian food!	1407589634	498093144282767360	f	palenquefood
RT @CarismaPrinting: All freshened up and ready to hit the NYC streets! Be sure to catch @Palenquefood food riding around! #colombianfood h...	1407519982	497801002889015296	f	palenquefood
Beer and Pizza on Friday Night! We are Near BK Brewery on N Wythe and 11th St. Come try our Margherita and Nutella for Dessert!	1409357818	505509445947101184	f	neaexpress
#NeaExpress, We are on E 33rd. &amp; Park Ave. and 20th St. &amp; 5th Ave.	1409161270	504685064165523456	f	neaexpress
Truck Numero uno is on Water and Fulton St and Numero dos is on E 4th St. &amp; 2nd Ave. Coome try our Spicy a Diavolo	1408660435	502584408394964992	f	neaexpress
Dinner Time! We have a truck in The Burg on Wythe Ave. &amp; N 11th St. Come try our Vegan Marinara, Vegetarian Verde!	1408659874	502582056728424449	f	neaexpress
Truck #1 is Rollin' Solo for Lunch! It's on 56th St. &amp; Broadway.	1408024168	499915712002289664	f	neaexpress
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
RT @FoodtoEat: Thank you @NeaExpress and @fritesnmeats for supplying delicious food on food truck wednesdays! http://t.co/7mhbFhPU6W	1406215668	492330313737981953	f	neaexpress
RT @WSoHotrucks: @souvlakitruck and @TaimMobile are out in the sun and ready for your orders! Varick and Charlton	1409246348	505041906351759362	f	taimmobile
Kickoff your long weekend correctly with Taim falafel, fries, and more on Varick/Vandam!	1409237779	505005967357251584	f	taimmobile
RT @mycafebeyond: We like to head out to Grand Army Plaza on 1st Sunday for our fave #falafel truck. @taimmobile http://t.co/8i3ghPLqFf htt...	1409237698	505005624196079616	f	taimmobile
Get yourself over the hump with Taim on 20th/5th. Israeli salad, beet salad, Moroccan carrots...there's always something new to try	1409151672	504644807839735808	f	taimmobile
RT @EinatAdmony: @BalaboostaNYC and @TaimMobile and I are gonna be at San Gennaro this year! http://t.co/GDBVLKEbz6	1409151547	504644281915949056	f	taimmobile
You're thinking, "It's only Tuesday?!" Then you remember, "IT'S TAIM TUESDAY!!!" Falafel, hummus &amp; smoothies await on 20th/5th	1409065193	504282086292078593	f	taimmobile
RT @IsraeliWineDir: Check out this video about eating falafel with Chef @EinatAdmony from @TaimMobile @BarBolonat @BalaboostaNYC! #yummy\nht...	1409020402	504094219330662400	f	taimmobile
RT @ashtonkeefe: My kind of chef. @taimmobile @balaboostaNYC http://t.co/PUr7dRETAm	1408641290	502504108059000832	f	taimmobile
Didn't leave for @WeWork #WWCAMP14 today? Start your own long weekend w us on Varick/Vandam. Better food anyways!	1408636811	502485323272945665	f	taimmobile
Taim Thursdays on Varick/Vandam. Enjoy a Pear Mint Lemon or Strawberry Raspberry Thai Basil smoothie while the summer is still here!	1408636518	502484095432409088	f	taimmobile
RT @BalaboostaNYC: "When I create a menu, I need to have a fresh green salad on it," says Chef @EinatAdmony \nhttp://t.co/mfjMW9itiG	1408549758	502120198422667266	f	taimmobile
Just when you think the week is dragging on, Taim Mobile pulls into 20th/5th to get you over the hump!	1408546473	502106419815264256	f	taimmobile
RT @guru0509: in a falafel mood...definitely stopping by @TaimMobile after work.	1408469278	501782638685089792	f	taimmobile
Harissa, it's English for "delicious." Expand your vocabulary on 20th/5th today for lunch.	1408460020	501743809831903233	f	taimmobile
Expand your falafel frontier with this recipe from @EinatAdmony http://t.co/Py6J1RjIPa	1408457138	501731719121481728	f	taimmobile
RT @InMyBowl_: NY Recap (ft @taimmobile falafel sandwich) + #Vegan Mediterranean Salad w Summer Sauce #Recipe http://t.co/dWXAOu6Is2 http:/...	1408404446	501510715862425601	f	taimmobile
RT @AllotCatering: Best falafel in NYC @taimmobile eat-in/takeout #Nolita #kosherDMV road trip http://t.co/rnODc2i7SI	1408331152	501203297324527617	f	taimmobile
RT @andyp0p: Just when you start to think the work week will never end, #TaimThursday comes around and everything feels perfect @TaimMobile	1408035143	499961745939521541	f	taimmobile
RT @BarbaraDiGangi: Falafel Thursday is always the best day with @TaimMobile! #nyc #Falafel http://t.co/xhyWckrV2M	1408035138	499961722950922240	f	taimmobile
Taim Thursday @ Varick/Vandam Harissa falafel, fries w saffron aioli, Date Lime Banana smoothie. Consider it an early start to the weekend.	1408033203	499953606989467648	f	taimmobile
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
We here on 21st and 5th avenue Our last month come and TREAT YOURSELF !	1381855922	390158135572582400	f	blend_express
@Alvaro_Mejia_ wall &amp; william in fidi.	1409319595	505349128805957632	f	milktrucknyc
Bessie's at Wall &amp; William, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always @houstonhallnyc	1409319010	505346672419811328	f	milktrucknyc
@FoodtoEat @houstonhallnyc  bessie's actually getting some work done today. back out tomorrow.	1409237673	505005522614226944	f	milktrucknyc
Bessie's at 25th &amp; Park Ave So, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always @houstonhallnyc	1409232611	504984289369288705	f	milktrucknyc
RT @Sh0rtyBC: Tough choice for lunch, @ThePocketful truck parked right next to @milktrucknyc \n#firstworldproblems	1409229731	504972210311008257	f	milktrucknyc
greek salad. #beach http://t.co/kKOUakwySK	1409154330	504655955599310848	f	milktrucknyc
RT @anasarapui: I'm at Milk Truck Grilled Cheese - @milktrucknyc in New York, NY https://t.co/tcuTYVNomf	1409078893	504339549880090624	f	milktrucknyc
RT @suquamish98392: "@Letterman: #LateShow anniversary lunch served by @milktrucknyc. Thank you, @vpfavale and @CBS! http://t.co/OBhKLCi9HQ...	1408991656	503973649293271040	f	milktrucknyc
@Letterman @vpfavale @CBS thank you!! and thanks to our awesome crew.	1408989758	503965690148433920	f	milktrucknyc
RT @Letterman: #LateShow anniversary lunch served by @milktrucknyc. Thank you, @vpfavale and @CBS! http://t.co/3v0DZoz51S	1408989663	503965291995746304	f	milktrucknyc
Bessie's at a private gig today feeding the good people of @Letterman	1408973405	503897099990073344	f	milktrucknyc
Outdoor stand at Brooklyn Bridge Park Pier 5 @smorgasburg. Sandwich menu always at @houstonhallnyc	1408888819	503542321946714113	f	milktrucknyc
Outdoor markets at Williamsburg @smorgasburg and Fort Greene @bkflea, come spend the weekend with us!	1408802414	503179910798524418	f	milktrucknyc
Bessie's at @TheSeaport, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always @houstonhallnyc	1408802412	503179903173287937	f	milktrucknyc
Bessie's at Wall &amp; William, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always @houstonhallnyc	1408714210	502809959218692096	f	milktrucknyc
@culturecollide_ nice! thanks.	1408640253	502499760696467456	f	milktrucknyc
RT @culturecollide_: @milktrucknyc hey you're in our Top 9 Things to Do in NYC! http://t.co/fSZtKSfg9m	1408640244	502499723388129286	f	milktrucknyc
Bessie's at 25th &amp; Park Ave So, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always @houstonhallnyc	1408627810	502447569910235140	f	milktrucknyc
Bessie's at 53rd &amp; Mad, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always @houstonhallnyc	1408541408	502085176151646208	f	milktrucknyc
Bessie's at @TheSeaport, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always @houstonhallnyc	1408455004	501722771399774208	f	milktrucknyc
@jvoon mmmmm caramely goodness	1409383753	505618225322033152	f	waffletruck
@bcl_3 @GTownCupcake we like to think of it as earning.	1409383717	505618076248076288	f	waffletruck
@HamptonsMPiece lookin goooooodd!	1409383695	505617981976879104	f	waffletruck
@1fete @wholefoodsnyc @vendyawards @MadSqParkNYC yay birthday wafels!	1409383659	505617830000492544	f	waffletruck
@bpalexander64 @sabrina21grier we certainly don't like stepping on toes.	1409383608	505617618825641985	f	waffletruck
@EatingAwesome chocolate on chocolate!	1409383571	505617460230651904	f	waffletruck
.... #sun #hot #icedcoffee #refreshing http://t.co/RlPTafwII7	1409382127	505611404230287361	f	waffletruck
@MafLoic Manhattan side!	1409327070	505380479001190400	f	waffletruck
@fork_and_knife @LesMizBway @andymientus @momomilkbar there are many exciting things there.	1409327053	505380406997553153	f	waffletruck
@sabrina21grier appreciate the suggestion!	1409327023	505380283714379776	f	waffletruck
@adeleee sometimes staying up past your bedtime is just about the best.	1409326988	505380135118589953	f	waffletruck
@infatuation @obsessivshopper and now we're hungry.	1409326899	505379762756681728	f	waffletruck
RT @infatuation: All the #EEEEEATS you missed this summer: @waffletruck bacon egg &amp; cheese http://t.co/wL5Qb02XPL  @obsessivshopper http:/...	1409326867	505379627540697088	f	waffletruck
Open @ 51st and Park	1406809102	494819354400157696	f	carpedonutnyc
@iamvalerielane @MariaRiegel95 someday perhaps. Who knows what the future holds?	1409326775	505379241526317056	f	waffletruck
@epngo @ishaneepar as well you should!	1409326727	505379042351390720	f	waffletruck
@vaneponce8 we do love making those.	1409326705	505378948935843840	f	waffletruck
Allleeeez get your #dinges and prepare for the weekend!!	1409322848	505362771434029057	f	waffletruck
Bierbeek @ Great Lawn in Central Park till 8pm\nPagadder @ Brooklyn Bridge till 10pm\nGoesting @ Bway &amp; 66th till 10pm	1409322842	505362744124919808	f	waffletruck
Momma Truck @ Park Ave &amp; 40th till 4:30pm\n\nVedette @ 60th &amp; 5th till 8pm\nKotmadam @ South Street Seaport till 10pm	1409322831	505362698797088768	f	waffletruck
Friiiiday!!!\n\nLe Cafe @ 15 Ave B open till MIDNIGHT\nDe Wafel Cabana @ 35th &amp; Broadway open till 10pm\n\nKastaar @ Wall Street till 4:30pm	1409322817	505362639917432832	f	waffletruck
http://t.co/lbBYgGeVUr	1409268396	505134383410712577	f	shanghaisogo
Mid-Autumn Moon Festival is coming ( sat, sep.06, 2014 )\nCheck out this amazing MOCA event!\n http://t.co/OU0txnlIm3 http://t.co/j976OiOMff	1409264527	505118156038610945	f	shanghaisogo
RT @KorillaBBQ: Getting a lotta love this week! Thanks yall. RT @CultureTrip: New York's 10 Best Food Trucks http://t.co/mVA7hzKyRy http://...	1409256102	505082817551032320	f	shanghaisogo
Here we are. @dumbolot  ready by 11~3pm. with some of the best food truck in NYC. @mausamnyc @MexicoBlvd come out &amp; get it!	1409237729	505005755037384704	f	shanghaisogo
Good morning #DUMBO! Heading to Jay &amp; Water now, ready by 11:15am.	1409235826	504997774300286976	f	shanghaisogo
RT @SnowdayTruck: HONORED TO SHARE THE STAGE W/ @dubpies @shanghaisogo @bigdsgrub @GoGoGrill AT THE VENDYS! ROOKIE OF THE YEAR BABY http://...	1409192060	504814205397381120	f	shanghaisogo
PLEASE RT,  Tomorrow, #AsianTapasThursday @dumbolot @DUMBOFoodTrucks @DUMBOBID 11~3pm.  We are glad to be back again.	1409168539	504715553144340481	f	shanghaisogo
Come out, come out. We are here @47th st &amp; park ave. See u all later.	1409156870	504666608653307905	f	shanghaisogo
Heading to 47th st &amp; park. Ready by 11:30am. See ya all later	1409149688	504636487192023040	f	shanghaisogo
@maryjoyb: I literally just followed over a dozen new #foodtrucks in #NYC.  And none of them are in my area #sadface want us to drop by?	1409071870	504310092528119808	f	shanghaisogo
#AsianTapasTuesday Still not too late to get ur lunch done right with "Asian Tapas Truck" @ 46th st &amp; 6th ave. Until 3pm. See ya all later.	1409071768	504309663715045376	f	shanghaisogo
@philnuzhdin: @shanghaisogo delicious! Glad you enjoy ur lunch with us again! No secret ingredient! Just Cook with our heart &amp; passion!	1409071640	504309127292944384	f	shanghaisogo
@nycfoodtruck @FoodtoEat @midtownlunch not playing hide &amp; seek @46th st bet 5~6th ave. Right beside the citi bank http://t.co/RAoAVeRkZU	1409066850	504289038007013376	f	shanghaisogo
@shanghaisogo: Come out, come out! Wherever you are! Food truck line up @ 46th st bet 5~6th ave. We are close to 6th ave.	1409065874	504284944752181248	f	shanghaisogo
RT @WSoHotrucks: @NuchasNYC @schnitznthings and @shanghaisogo are getting ready along Varick and Charlton/King.	1408976863	503911606800384001	f	shanghaisogo
#soho #WestVillage thanks god it is Monday. See ya all later @ VARICK &amp; CHARLTON  in front of #DunkinDonuts	1408976841	503911513800052736	f	shanghaisogo
@TheSeaport @nycfoodtruck @FoodtoEat #sundayfunday swing by @ front st &amp; john st serve until 8pm. See ya all later!	1408893571	503562253590089728	f	shanghaisogo
RT @ch_rls: @shanghaisogo Ben when are you coming back? It's been so long. We have a new dumpling love now, but nothing can compare 2 U.	1408653682	502556086944419840	f	shanghaisogo
what is good today? Try this cold seaweed salad. 47th st &amp; park until 3pm. See you all later! http://t.co/KdPnZUKsaR	1408635047	502477923241443328	f	shanghaisogo
@nycfoodtruck  @FoodtoEat @MidtownLunch Good morning, NYC! #AsianTapasThursday @47th st. Bet. Lexington &amp; park ave 11~3pm. See u all later!	1408629623	502455175798611969	f	shanghaisogo
Sunny #day @Dumbolot #Brooklyn #delicious #Indian #Cuisine #savory #curries to #start the #long #weekend	1409227164	504961445159645184	f	mausamnyc
#delicious #lunch @ 52nd #Street &amp; 6 #Avenue	1409146263	504622120249200640	f	mausamnyc
beautiful #day @51street &amp; #Park #Avenue #savory #indian #meal	1409054770	504238369124003840	f	mausamnyc
#start U'r  #week with the #best @47street bet #Park &amp; #Lex	1408970059	503883067874758659	f	mausamnyc
#beautiful #Sunday #lots of #sunshine on #Governers #Island #spend the #day with your #famiily and #enjoy #savory #indian #flavors	1408883977	503522013550350336	f	mausamnyc
 on the #way to #Governer's #Island #the #Curry #King #serving #authentic #indian #cuisine	1408796837	503156519634890752	f	mausamnyc
#serving #dinner @GE 1#old #Albany #post #road #Ossining NY #1 #entree being #served #vindaloo	1408667180	502612698547625984	f	mausamnyc
#Dumbolot #serving the #best for #today's #weather #spice up your #day with our #vindaloo #flavor	1408636289	502483132914737152	f	mausamnyc
#fresh #authentic #indian #lunch @52nd #street  &amp; #6 #avenue	1408534935	502058026539307009	f	mausamnyc
#fresh #Curries &amp; #delicious #mango #lassie @51st &amp; #Park  #Avenue	1408448720	501696411792990208	f	mausamnyc
#beautiful #sunny #Monday #savory #curries #47 #Street #between #Park &amp; #Lex #start U'r #week with the #best #flavors	1408366917	501353306719911937	f	mausamnyc
#dispatchny #making #great #events #possible #Today #Prospect #Park #Grand #Army #Plaza #Foodtruck #Rally was a #success	1408324837	501176811649134592	f	mausamnyc
#TGIF #savory #indian #lunch @Broadway #between  #54 &amp; #55 #street	1408111078	500280237842632705	f	mausamnyc
#delicious #spicy #authentic  #curries. @Dumbolot don't #miss #out.	1408018732	499892913543725056	f	mausamnyc
#available for any type of #events. U'r #guests will #love #our #fresh #savory #spicy #authentic #indian #menu	1407962531	499657188801908738	f	mausamnyc
#enjoy #delicious #indian #lunch @52nd &amp; #6 #ave	1407941707	499569845302591490	f	mausamnyc
#great #indian #cuisine #51st #street &amp; #Park #ave #delicious #spicy #entrees	1407843868	499159478126669824	f	mausamnyc
#Happy #Monday @ 47 Str bet #Park N #Lex	1407766333	498834275920142336	f	mausamnyc
#Happy #Friday @47Str bet #Park &amp; #Lex #delicious #authentic #indian #entrees #start your  #weekend #with the #best	1407503296	497731017306697728	f	mausamnyc
#Dumbolot #serving #savory #spicy #curries &amp; #bites #entrees #enjoy the #beautiful #day with #Curry #King	1407405893	497322480176865280	f	mausamnyc
Morning #LebaneseLunchers! We're starting our Labor Day weekend today, so we're off the road but we'll be back on Tuesday. Enjoy everyone!	1409231595	504980026602033152	f	toumnyc
RT @FoodtoEat: .@ToumNYC is serving lunch &amp; dinner @TheSeaport today on John &amp; Front St. Preorder online for fast pickup here: http://t.co/...	1409155497	504660848590471168	f	toumnyc
Located on 53rd, between Park and Madison.	1407938350	499555767629144064	f	thepocketful
Join us near @TheSeaport on John &amp; Front St. for a #Lebanese lunch &amp; dinner! Get a yummy kafta platter from 11-8pm :) http://t.co/I8UpXV730G	1409147601	504627731800547328	f	toumnyc
A #vegan platter is just what you need on this hot Tuesday! Get yours today on 46th btwn 5th &amp; 6th. #LebaneseLunch http://t.co/eoefs0QoRP	1409058749	504255059648344064	f	toumnyc
RT @dumbolot: Good morning #DUMBO! Check out @MexicoBlvd @ToumNYC and @dubpies on Jay &amp; Water!	1408972410	503892928650313729	f	toumnyc
Start your week off right with a #LebaneseLunch! We have beef shawarma today in @DumboNYC on Jay &amp; Water St. #yummy http://t.co/LjO6xLmkv4	1408972341	503892640191217664	f	toumnyc
Getting ready for another amazing day @afropunk filled with bites &amp; beats! Join us from 11-9pm at the Commodore Barry Park in #Brooklyn	1408892068	503555947563061249	f	toumnyc
@afropunk is here! Bites &amp; Beats from 11-9pm today &amp; tomorrow. Join us in #Brooklyn at the Commodore Barry Park for delicious #LebaneseEats!	1408802834	503181672989605888	f	toumnyc
RT @FoodtoEat: Mmmm #FalafelFriday calls for some @ToumNYC ! Preorder to fill the void for lunch and dinner till 8pm for pickup: http://t.c...	1408735005	502897178776711168	f	toumnyc
It's #FalafelFriday near @TheSeaport on John &amp; Front St. Join us for a #vegan lunch/dinner from 11am-8pm! http://t.co/Xr41qZ2v60	1408714286	502810278812454912	f	toumnyc
@DumboNYC We're getting ready for you on Jay &amp; Water St. Your #LebaneseLunch will be served from 11-3pm #Beef #Kabab http://t.co/lHeOlzExiH	1408627324	502445532468756480	f	toumnyc
RT @dumbolot: Enjoy the sun, fun, and schwarma while you still can with @ToumNYC @MexicoBlvd and @mausamnyc!	1408625568	502438167229001728	f	toumnyc
RT @FoodtoEat: Hey @TheSeaport ! @ToumNYC is serving up lunch &amp; dinner til 8pm. Preorder online for fast pickup here: http://t.co/TOzc170bXk	1408554828	502141462570889216	f	toumnyc
What's for lunch #LebaneseLunchers? Join us for a kafta platter near the @TheSeaport on John &amp; Front St from 11-8pm! http://t.co/v8UuW5jpvq	1408537773	502069926119886848	f	toumnyc
It's tabbouleh Tuesday in #MidtownWest! Join us on 46th btwn 5th &amp; 6th for a #healthy #vegan #LebaneseLunch http://t.co/FKiygDHrcu	1408454162	501719239745871872	f	toumnyc
RT @dubpies: RT @DLSNewYork: Lunch today?! @ToumNYC @TheSteelCart @ParisSandwich @MexicoBlvd @dubpies  The best #eatsss are in the dumbosph...	1408387510	501439678902710273	f	toumnyc
RT @dumbolot: Happy #funday @ToumNYC @MexicoBlvd and @dubpies today!	1408374393	501384660740739072	f	toumnyc
Hello @DumboNYC! We're on Jay &amp; Water st from 11-3pm today &amp; we have beef shawarma! #yummy #LebaneseLunch http://t.co/jfR8jUtchU	1408366116	501349944838877184	f	toumnyc
It's #SundayFunday at the @prospect_park  #FoodTruckRally at #GrandArmyPlaza. Join us from 11am-5pm for #LebaneseEats	1408286848	501017473555398657	f	toumnyc
No plans for this gorgeous Saturday? Join us at Pier 97 for the @BrantleyGilbert concert! We'll be there from 3pm-11pm. #LebaneseEats	1408197111	500641086122229761	f	toumnyc
#Day5! @usopen! #Court17 #GrilledCheese! #BeThere!	1409325115	505372280361607169	f	morristruck
Day 4 already? This @usopen tournament is just flyin by! Come check out your favorite #grilledcheese right next to Court 17!	1409238586	505009349228773376	f	morristruck
Day 3 Day 3 Day 3! Court 17 Court 17 Court 17! Come get your #cheese #fix @usopen in Flushing!	1409151483	504644013543411715	f	morristruck
@foodrepublic Thanks for the mention! We're actually serving 3 options this week- Classic, Gouda, and Delicate Cheese with black truffle!	1409066365	504287001936670720	f	morristruck
Day 2 crusin over @usopen in Flushing! Make sure you stop by Court 17 this week for your melted cheese fix!	1409065937	504285209198870530	f	morristruck
Alright, Day 1 of the @usopen is here! We'll be set up next to Court 17 all tournament long slinging your favorite gourmet grilled cheeses!	1408978861	503919985165873153	f	morristruck
Heads up to all our #Cheese fans out there: We'll be @usopen for the next two weeks, no street service unless you're at #Court17!	1408931685	503722113875079168	f	morristruck
RT @livefastgroup: A great article from WSJ about @morristruck, our amazing vendor who will be representing us at the @usopen http://t.co/A...	1408832493	503306072073846784	f	morristruck
We're @njlauritawinery for a delicious afternoon of #Wine #Cheese and #Tunes! Come check it out!	1408813563	503226673165131776	f	morristruck
Hey folks, we're off the streets for lunch today, but you can find us @njlauritawinery tomorrow!!	1408718838	502829371531358209	f	morristruck
RT @LevyRestaurants: The @morristruck is bringing their grilled cheese sandwiches to the @USOpen for the first time. #FlavorOfTheOpen http:...	1408649808	502539835018850305	f	morristruck
2x the cheese today! Truck at 51st &amp; Mad, Cart at Metrotech!	1408635382	502479328429748224	f	morristruck
If you were lucky enough to get tickets, come find us feeding the crowd @robynkonichiwa @royksopp at #Pier97 tonight! #Cheesinonmyown	1408571266	502210409814687746	f	morristruck
And a big heads up to our @DumboNYC friends- we'll be wrapping up lunch service at 1:45 today, so hurry over to Pearl &amp; Front!	1408551988	502129549900271616	f	morristruck
Open at 11:30 for #GrilledCheeseWednesday at Pearl &amp; Front! #EarthWindAndFire #BeerNBrats #FriedGreenTomatlos #DeliciousDairyDelights	1408547251	502109683231236096	f	morristruck
Pearl &amp; Front St for lunch today, @DumboNYC! See ya there!	1408540458	502081190078464000	f	morristruck
And guess who's got some lovely tomatoes over on 21st &amp; 5th? US. #materseason	1408465822	501768141685673985	f	morristruck
Calling all #BigTimeCheesers to 21 &amp;5th for some ltd. edition sammies! #EarthWindFire #FriedGreenTomatillos #RaginCajun #getemwhiletheyrehot	1408461180	501748673538457600	f	morristruck
Cat's out of the bag! See you @usopen! http://t.co/Ui4R6PvCTN	1408402680	501503306447867906	f	morristruck
Monday already? It's ok, we're not ready for the week to start either- extra-long lunch break &amp; grilled cheese anyone? We're at 52nd &amp; 6th!	1408373620	501381419672039424	f	morristruck
Located on 52nd and 6th avenue	1409327281	505381365052080128	f	thepocketful
On 50th, between 6th and. 7th	1409240468	505017244485947392	f	thepocketful
On 53rd, between Park and Madison	1409153025	504650480770109441	f	thepocketful
On 50th between 6th and 7th.	1409067861	504293276942622722	f	thepocketful
Located on Hudson and King	1408976337	503909399518535680	f	thepocketful
Located on 55th , between 6th and 7th.	1408720195	502835062657003521	f	thepocketful
On 50th between 6/7. Hopefully you come fir lunch before the cops boot us!	1408635907	502481532477394944	f	thepocketful
Located on 53rd, between Park and Madison http://t.co/YzKXJk4Mpv	1408544213	502096938595287041	f	thepocketful
Located on 52nd between 6th and 7th	1408462122	501752623083847681	f	thepocketful
Located on  Hudson between King and Houston.	1408372719	501377642680311808	f	thepocketful
Opening at 1145 on 49/6	1408030315	499941494040821760	f	thepocketful
Just parked on 49th between 6/7.\nIf you don't see us we moved to 48 and 6:7	1407512023	497767621484613632	f	thepocketful
Located on 53rd between Park and Madison	1407421262	497386939897880576	f	thepocketful
Located on. 46 between. 5/6	1407342980	497058603086663680	f	thepocketful
Hey Billy Joel, we are on your favorite NYC street. Fifty second between 6/7	1407252231	496677972532002816	f	thepocketful
Parked on Hudson between King and Houston	1407164886	496311621598576640	f	thepocketful
Located 48th and 6th	1406907172	495230693157666817	f	thepocketful
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
RT @emsuar: Greatest midnight snack @BrooklynPopcorn http://t.co/Paa5eYU9li	1402578103	477073260740231169	f	brooklynpopcorn
RT @axlebrand: We award this week's #FTF to @BrooklynPopcorn, which popped out to us last week in NY.  They have a great use of... http://t...	1402100070	475068245880238080	f	brooklynpopcorn
RT @axlebrand: #FTF this week goes to @BrooklynPopcorn for their great #social media tie-ins, bright logo &amp; clear website address! http://t...	1402100066	475068227429482497	f	brooklynpopcorn
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
Hey folks, have a great long weekend. Back on Tuesday to stuff ya w/ kimchi love.	1409324440	505369446454919168	f	kimchitruck
Woohoo! Happy weekend folks! 766 Washington locale is open this Labor Day (no deliveries south of Eastern Pkwy b/c of the parade)	1409315968	505333912785408001	f	kimchitruck
RT @keithbacker: The calm b4 the @KimchiTruck storm: kimchi bowl with spicy chicken and a side of kimchi #goodlife #sowoneulmarhaebwa http:...	1409250706	505060187297034240	f	kimchitruck
See you in #soho today for lunch from 11:30-2:30. On vandam st @ varick st #nyfoodtrucks #soholunch	1409232310	504983026120798208	f	kimchitruck
RT @2910ah: Thank you @DelsNYC, @KimchiTruck, @gcnyc1, @waffletruck and The @johnschmitt Band for making this night a success.You rocked it...	1409202525	504858100898480128	f	kimchitruck
RT @2910ah: Almost done setting for tonight's #AHartpark Event. 1 hour to go! 29th St and 10th Ave. http://t.co/rgOC14UJmc	1409180754	504766784927318016	f	kimchitruck
Stop by the Abington House Party Under the High Line for a complimentary nachos while supplies last! @2910AH #AHartpark	1409179018	504759503758569473	f	kimchitruck
FREE kimchi nachos under the High Line @2910AH #AHartpark #ComeGetIt	1409177188	504751829037879296	f	kimchitruck
Come visit us at the Abington House for the final Party Under the High Line August 27th from 6-9pm! @2910AH #AHartpark	1409148626	504632030173605888	f	kimchitruck
@ftn_tweets beautiful! Youll find us today in #dumbo serving up lunch from 11:30-2:30 on Water st @ Jay st #nyfoodtrucks #dumbolot	1409061631	504267146277695488	f	kimchitruck
RT @dumbolot: Happy Tuesday with @SweetChiliNYC @KimchiTruck and @carlssteaks today!	1409058596	504254419127787521	f	kimchitruck
RT @Nash1sh: Chicken, Fish, Chicken. @kimchitruck #foodporn. http://t.co/qx8wNGUquw	1409019881	504092036417716225	f	kimchitruck
@Nash1sh I remember you from afropunk! Lovin the #foodporn. See you around in BK!	1409019874	504092006646571008	f	kimchitruck
Truck is hired out for a private event today. Looking fwd to seeing your lovely faces tomorrow, #dumbo !  #dumbolot 11:30-2:30 jay &amp; water	1408974908	503903404209745920	f	kimchitruck
Just grabbed a delicious breakfast of champions @littleskips to prep for afropunk day 2! #afropunk @afropunk #afropunkfest	1408887949	503538672189202433	f	kimchitruck
Dear Afropunk,\nYou are crazy and we are crazy in love with you. See you tomorrow! #afropunk @afropunk	1408849222	503376237965094912	f	kimchitruck
@SocialEyesNYC yes! Well be there on both Saturday and Sunday! Fingers crossed for sunny weather. Pop by the truck and say hello!	1408738202	502910586620215297	f	kimchitruck
RT @SocialEyesNYC: 10th annual @afropunk festival takes place this weekend in #Brooklyn http://t.co/f17EnknHuY	1408736844	502904891816554498	f	kimchitruck
RT @SoGutsy: Photo: redperiod: AFROPUNK FEST 2014: AUG 23-24 | Commodore Park, Brooklyn NY http://t.co/D8OH64Hvzq	1408736722	502904378588930049	f	kimchitruck
@csisl Andrew, Alex&amp;Evan thx 4 coming today! We appreciate the invite to check out the space, but had to run. Hope to see u all nxt Friday!	1408736500	502903447566696448	f	kimchitruck
Hello NYC ! We are open at 46th st. Between5th ave&amp;6thave. Try our rice bowl , rice burger and bibimbap burrito. Come by and enjoy thank you	1408979171	503921285622403072	f	bobjotruck
Sunshine NYC! We r open at 46th between 5th &amp; 6th ave. Try our rice burger,rice bowl(beef,spicy pork,chicken)and bibimbap burrito!! Thank u!	1408027530	499929812807729153	f	bobjotruck
Good morning NYC ! We r open at winter and Hanover sq.  we r ready to serve rice bowl rice burger and bibimbap burrito plz comeby &amp;enjoy thx	1407857869	499218202464096256	f	bobjotruck
Open now @ Court St and Bergen St Brooklyn	1407065334	495894069600878592	f	carpedonutnyc
Hello NYC !! We r open at 46th st between 5th ave and 6th ave . Try our rice burger,ricebowl and bibimbap burrito! Thank you	1407770398	498851324327636992	f	bobjotruck
Hello NYC !!! we r open at 46th st between 5th and 6 th ave try our  rice burger rice bowl and bibimbap burrito. Thank you	1407253520	496683380101353473	f	bobjotruck
TGIF ! We r open at 47th st between park&amp;lexington ave. Try our rice bowl ,rice burger and bibimbop burrito. Plz come by and enjoy 	1406908339	495235588480831489	f	bobjotruck
Goodmorning! We r open at 47th st between park&amp;lexington ave. Try our rice bowl ,rice burger and bibimbop burrito. Plz come by and enjoy 	1406730550	494489883277529090	f	bobjotruck
Sunshine NYC !We r open at varick and king we r ready 2 serve rice bowl() , rice burger() bibimbap burrito.plz Comeby &amp; Enjoy :) TGIF	1406302989	492696562884431872	f	bobjotruck
Morning flatiron! We r open at 22nd and 5th ave. we r ready 2 serve rice bowl() , rice burger() bibimbap burrito.plz Comeby &amp; Enjoy :)	1406214537	492325568214740994	f	bobjotruck
Good morning NYC. We r open at 46th st. Between 5th &amp; 6th ave. try our rice bowl and rice burger , bibimbap burrito. Plz come by and enjoy 	1405955062	491237250928488449	f	bobjotruck
We are open @ 47th st. Between park &amp; Lexington ave. try our ricebowl and rice burger , bibimbap burrito as well.  Plz stop by and enjoy thx	1405523419	489426811877851136	f	bobjotruck
Good morning Monday !! We are open at 46th st between 5th and 6th ave.  try our rice bowl and rice burger  bibimbop burrito thank you!	1405354069	488716505493016576	f	bobjotruck
Welcome Friday !! We r open at varick and king st. Try our rice bowl riceburger bibimbop burrito . Come by &amp;enjoy have a great weekend	1405092615	487619887771422720	f	bobjotruck
Hello NYC !! We r open @46th st  between 5th and 6th@ave. Thank you	1405007374	487262360965763072	f	bobjotruck
Hello! NYC !!we are open @ 47th st. Between park &amp; Lexington ave. try our rice bowl , rice burger and bibimbap burrito plz comeby and enjoy	1404916379	486880702714355713	f	bobjotruck
Hello NYC ! We r open @ water st. And Hanover sq. try our rice bowl and rice burger and bibimbap burrito. Plz stop by. And enjoy thank you	1404831791	486525914512367616	f	bobjotruck
Hello NYC ! We r open at 46st between 5th and 6th ave.	1404749707	486181628512059393	f	bobjotruck
Hello NYC ! We r open @ 47th st. Between park and Lexington ave. try our rice bowl and rice burger ,bibimbop burritoplz come by and enjoy	1404316499	484364621697265664	f	bobjotruck
Hello NYC we r open at Hanover sq and water st. Try our rice bowl , burger and bibimbop burrito !  Thank you	1404228494	483995503479492608	f	bobjotruck
A gorgeous New York Summer Weekend !! Hello NYC we r open at varick and king st. Try our rice bowl and burger , bibimbap burrito . Thank you	1403882816	482545624404209666	f	bobjotruck
RT @therealhanyik: @lovemamak LOVE the beef rendang - so tender and flavorful! So glad you guys are @smorgasburg	1408912702	503642493272211456	f	lovemamak
@urbushey hey there, we only do group office lunch on weekdays but you can grab us @smorgasburg on the weekend! Miss u all too	1408486305	501854057519407104	f	lovemamak
RT @TheUnusualFact: Sleeping next to someone you love not only reduces depression, but it helps you live longer, and makes you fall asleep ...	1408166991	500514754818244608	f	lovemamak
RT @smorgasburg: Fri Sept. 19, we're super-excited. RT @Gothamist: Nighttime Smorgasburg Coming To Central Park http://t.co/31eAQAFV95 @Sum...	1408043589	499997167852199938	f	lovemamak
Malaysian food is not just for Malaysians!! http://t.co/OdmBmvm7Hr via @lovemamak	1407986126	499756151710314497	f	lovemamak
RT @fritteringaway1: Seriously people! You have to get to @hesterstfair Amazing food &amp; Bev options on Sundays! @MooksNYC  @lovemamak @Might...	1407706986	498585353503391744	f	lovemamak
Mini golf @hesterstfair fun Sunday! http://t.co/O5JQjyd1S6	1407697069	498543761727975425	f	lovemamak
RT @INFILTRATENY: Our client @lovemamak was featured in the 101 Best Things in New York issue of @BRUTUS_mag. #malaysian #foodtruck http://...	1407696926	498543160336068609	f	lovemamak
RT @juliamoskin: Spectacular Malay beef rendang w/all the trimmings @lovemamak #latergram @hesterstfair http://t.co/CdIHBiYTw5	1406992609	495589040884703232	f	lovemamak
@IamWinstonMoore only at smorgasburg this weekend!!	1406747044	494559065302130688	f	lovemamak
RT @BalaboostaNYC: Don't miss "Taim's golden falafel" at the Taste of Jewish Culture festival this Sunday on Madison/4th http://t.co/pXmrSL...	1406118417	491922414050095104	f	lovemamak
RT @nytdining: Here's a recipe for a great breakfast sandwich that fell off the menu at Seersucker, which is now itself a memory. http://t....	1406118415	491922406408065024	f	lovemamak
Reserve your FREE curry puff! Sign up at our Website and you'll receive your coupon! \n\nhttp://t.co/4oCj75MXHa http://t.co/YkrXntuykN	1405975362	491322395496828928	f	lovemamak
@instagram	1405874235	490898238384263168	f	lovemamak
Photo: http://t.co/BhFTsu6CGx http://t.co/4ROdhFFDXq	1405731094	490297863550038019	f	lovemamak
http://t.co/BhFTsu6CGx http://t.co/LExfWJ3GOE	1405731092	490297852951035904	f	lovemamak
@JanineJustInc great to hear that!!	1405697992	490159023095054337	f	lovemamak
RT @JanineJustInc: @lovemamak All of the guests from #IntheLimelight were raving about the empanadas!	1405697966	490158912868732929	f	lovemamak
RT @AnnCurry: From Malaysia Airlines: Nationality total on MH17- Netherlands 154 Malaysia 43 (including 15 crew &amp; 2 (cont) http://t.co/4ccA...	1405645527	489938968835022848	f	lovemamak
Yeahhhh just #amazing #curry puff for today! #southseaport with @JanineJust @JanineJustInc http://t.co/6mj3qqLL0C	1405645466	489938712487530496	f	lovemamak
Open @ 51st and Park	1409226510	504958701720317952	f	carpedonutnyc
come get your fix at 23rd and park today!	1409138556	504589795428163584	f	carpedonutnyc
Open @ Bergen and Court!	1408879935	503505059117015041	f	carpedonutnyc
Open at Court and Bergen in Cobble Hill!	1408794974	503148708687802368	f	carpedonutnyc
Broadway and 55th today!	1408710782	502795581052686336	f	carpedonutnyc
Open @ 51st and Park!	1408621056	502419242873286656	f	carpedonutnyc
All day 23rd and Park!	1408534691	502057001300799488	f	carpedonutnyc
Open @ Bergen and Court!	1408276914	500975804936105984	f	carpedonutnyc
Open @ Bergen &amp; Court!	1408190845	500614807134167040	f	carpedonutnyc
54th and Broadway all day!	1408103198	500247188585586689	f	carpedonutnyc
Come see us at 51st and Park today!	1408013583	499871317756502016	f	carpedonutnyc
Rainy days are incomplete without a hot apple cider donut! 23rd and Park all day today.	1407931552	499527253584510976	f	carpedonutnyc
Open @ Bergen and Court!	1407672278	498439777390432256	f	carpedonutnyc
We've got your donuts!  Come see us at Bergen and Court Streets in Cobble Hill until 2pm.	1407581657	498059685648670720	f	carpedonutnyc
Open @ 55th and Broadway now!	1407497607	497707157241204736	f	carpedonutnyc
Open @ 51st and Park now!	1407408748	497334453044518912	f	carpedonutnyc
Open @ 23rd and Park!	1406722572	494456423011475457	f	carpedonutnyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIyYdw	1409312104	505317706044682240	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIyYdw	1409225704	504955320628555777	f	sweeterynyc
Direct from the Medina in old Tunis,Tunisia this AM, thinking they could use a SweeteryTunis event &amp;marketing co here http://t.co/E0ray6SJvL	1409153577	504652798068547584	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIyYdw	1409139303	504592926727360512	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIyYdw	1409052903	504230539474132993	f	sweeterynyc
It was such a great event this Sunday in Central Park.\n@LACOSTE  #Lacoste #CentralPark #macarons \nhttp://t.co/nxVJJZb4O3	1408992934	503979010574286848	f	sweeterynyc
It was such a great event this sunday in Central Park.\n#Lacoste For more pictures of our event check out our... http://t.co/YogDFtokZm	1408989601	503965033672753155	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIyYdw	1408966502	503868148634767360	f	sweeterynyc
RT @jimshi809: Gooey yummy #dessertporn: @Lacoste-branded #macarons filled w/ vanilla ice cream, courtesy @SweeteryNYC. #citytennis http://...	1408898830	503584309316714496	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIyYdw	1408707302	502780983435722752	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIhVbw	1408623618	502429989325643778	f	sweeterynyc
TODAY Abington House Summer Series Event \n500W 30th St 6-9pm @2910AH THE 1ST 100 MACARELLAS ARE FREE! Check this out http://t.co/gp1EOf4yqo	1408560406	502164857714917377	f	sweeterynyc
Tweeting all the way from southern Italy, we r thrilled that our mobile bake shop will b hanging w/the great @bigdsgrub trk @2910ah tonight.	1408555692	502145085816176640	f	sweeterynyc
Stop @ Abington House Summer Series: 500 W 30th St, Wed 8/20 6-9pm! @2910AH @SweeteryNYC THE 1ST 100 MACARELLAS (Macarons&amp;Nutella) ARE FREE!	1408546844	502107976422141952	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIhVbw	1408534504	502056216768438275	f	sweeterynyc
RT @jat808: FREE SWEETS! Join @magmarketing &amp; @SweeteryNYC Wed 8/20, 6-9PM @10th Ave &amp; 27th St. THE FIRST 100 MACARELLAS (Macarons&amp;Nutella)...	1408534173	502054828873248769	f	sweeterynyc
Stop @ Abington House Summer Series: 500 W 30th St, Wed 8/20 6-9pm! @2910AH @SweeteryNYC THE 1ST 100 MACARELLAS (Macarons&amp;Nutella) ARE FREE!	1408473156	501798905504616448	f	sweeterynyc
FREE MACARELLAS!! \nStop by the Abington House Summer Series Event at 500 West 30th St. Wednesday August 20th,... http://t.co/PiOhNAdxiF	1408473010	501798292724789248	f	sweeterynyc
SweeteryNYC has been included in "NYC's Top 10 Ice-Cream Sandwiches" by @RedTricycleNYC .\nhttp://t.co/n5SrFACROo	1408458794	501738664226226176	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIhVbw	1408448103	501693824372973568	f	sweeterynyc
RT @BigQuizThing: #FF Cohorts for @BKBrainJam Sun 9/7 @KevinGeeksOut @nerdnite @story_collider @BellHouseNY @gcnyc1 @SecondBolt http://t.co...	1409357739	505509113527558144	f	gcnyc1
Here's how we do....\n@jones_beach\n#ComeToTheCheeseYo http://t.co/f087aQFStC	1409357729	505509073253826560	f	gcnyc1
@YoungFlyT both trucks have private events....	1409346209	505460753428914176	f	gcnyc1
@Lilhey Jones Beach Theater	1409346185	505460654250414080	f	gcnyc1
RT @Big_Tucky: Saw @gcnyc1 on chopped last night, tracked em down today. Didn't disappoint. Awesome Buff Chicken grilled cheese sammy. #NYC...	1409346148	505460497735753728	f	gcnyc1
Closed in NYC\nG1- off to @SilvercupNYC to cater a set.\nG2-- off to @Jones_Beach for @motleycrue \n&amp; @alicecooper12 \n#ComeToTheCheeseYo	1409346125	505460401199652865	f	gcnyc1
G1 - 46 5/6\nG2 - 47 / Park\n#ComeToTheCheeseYo\nRockin the Ruben Melt	1409322080	505359549722025984	f	gcnyc1
RT @bigblk1387: Hey, you're on Chopped... kewl...@gcnyc1	1409322026	505359324605349888	f	gcnyc1
Rockin the cheese At The Seaport until whenever. ...\n#ComeToTheCheeseYo	1409264610	505118503809323008	f	gcnyc1
RT @2910ah: Thank you @DelsNYC, @KimchiTruck, @gcnyc1, @waffletruck and The @johnschmitt Band for making this night a success.You rocked it...	1409236612	505001071295889408	f	gcnyc1
G1 - Seaport @ John St.\nG2- Park/33\n#ComeToTheCheeseYo	1409236586	505000964022337536	f	gcnyc1
Come grab the second round of complimentary American melts while supplies last at Abington House @2910AH #AHartpark\n#ComeToTheCheeseYo	1409181905	504771615377620993	f	gcnyc1
RT @2910ah: Almost done setting for tonight's #AHartpark Event. 1 hour to go! 29th St and 10th Ave. http://t.co/rgOC14UJmc	1409181359	504769323731542016	f	gcnyc1
29th St 10th\n\nStop by the Abington House Party Under the High Line for a complimentary American melt while supplies last! @2910AH #AHartpark	1409177208	504751914396176384	f	gcnyc1
Join us at the Abington House for a Party Under the High Line, tonight 6-9pm! @2910AH #AHartpark\n 29th St. &amp; 10th Ave.\n#ComeToTheCheeseYo	1409175326	504744019692625920	f	gcnyc1
RT @JadoreValentina: my stomach is growling so loud that the people in the office next door must of heard it, i am craving Mac and cheese b...	1409166647	504707617168826368	f	gcnyc1
RT @JadoreValentina: im on 58th and lex, when do you ever plan on coming this wayyy ive been craving you guys for a while lol @gcnyc1	1409166643	504707600290963456	f	gcnyc1
RT @nicolefoccillo: @gcnyc1: Buffalo Chicken Melt @TheNYRA http://t.co/hBhssNKrl9 come to midtown on a mon or wed so I can eat this durin...	1409166639	504707583047786497	f	gcnyc1
Join us at the Abington House for a Party Under the High Line, tonight 6-9pm! @2910AH #AHartpark\n#ComeToTheCheeseYo	1409165340	504702132936007680	f	gcnyc1
G1- 37th/Broadway\nG2- 26th 11 / 12\n@starrettlehigh #ComeToTheCheeseYo	1409152207	504647049762340864	f	gcnyc1
We are getting our inner animal out at Electric Zoo; Friday, Saturday and Sunday! See you there.	1409328534	505386618011017216	f	mexicoblvd
RT @MTVCLUBLAND: Who's ready for @ElectricZooNY this weekend? #EZOO	1409280876	505186728718893056	f	mexicoblvd
Making of @MexicoBlvd #ElectricZoo #ezoo http://t.co/hlW4tjzJ5s	1409278562	505177023825051649	f	mexicoblvd
ONE day until @ElectricZooNY Stay tuned @MexicoBlvd	1409242428	505025466768818176	f	mexicoblvd
Traditional flavors from Mexico today in DUMBO @MexicoBlvd Happy Thursday! Happy Lunch!	1409236373	505000067275976704	f	mexicoblvd
Setting up for #ezoo2014 who's ready for some Mexico Blvd this weekend!	1409163579	504694749950132226	f	mexicoblvd
@gotbaum: @bigdsgrub you're not here again :( there was no parking at all! 	1408637511	502488260703453185	f	bigdsgrub
Buenos dias! Tacos, Tortas, Flautas, Quesadillas, Guacamole... Delicioso #Midtown 51st &amp; Park	1409148600	504631922711330816	f	mexicoblvd
This Friday, Saturday and Sunday look for @MexicoBlvd &amp; VeggieBlvd @ElectricZooNY http://t.co/usbqfiR0e4	1409097882	504419194155589632	f	mexicoblvd
Happy Tuesday! Adobo, Tinga, Pastor, Bistec your choice. #Midtown 46th Street	1409063096	504273293504151552	f	mexicoblvd
Hola Dumbo! It's a great day to have a spicy lunch. Guacamole &amp; Friends!	1408980343	503926200327479297	f	mexicoblvd
@wilkowmajority we plan to cover our truck with steel sheets and make a sweet taco escape. #bugout Foodtruck	1408728602	502870324317540352	f	mexicoblvd
Tacos echos por mexicanos 100% chilangos #MexicoCity en las calles de  #nyc solo en @MexicoBlvd o en nuestro restaurante @ChelaGarnacha	1408728463	502869740352974848	f	mexicoblvd
@newyorkeventsco gracias gracias! Aqui a su servicio!	1408728354	502869283207389184	f	mexicoblvd
Happy weekend! @MexicoBlvd "Viernes de Taquiza"#Midtown 46 St.	1408718053	502826079124733952	f	mexicoblvd
Tortas, quesadillas, flautas &amp; tacos @MexicoBlvd @dumbolot today on this beautiful day!	1408627996	502448350093135872	f	mexicoblvd
RT @dumbolot: Enjoy the sun, fun, and schwarma while you still can with @ToumNYC @MexicoBlvd and @mausamnyc!	1408627816	502447594367614976	f	mexicoblvd
RT @nitaboo: @fwmj mexico Blvd truck is on 46 between 6 and 7	1408558550	502157073569054720	f	mexicoblvd
RT @anasarapui: I'm at Mexico Blvd Truck in New York, NY https://t.co/OXNIkQm4Rs	1408558540	502157032179634176	f	mexicoblvd
RT @brad_brezinski: Awesome tacos from @MexicoBlvd today. Consistent flavorful food from my go-to lunch truck. Check it out #nyc ers	1408558489	502156819037683713	f	mexicoblvd
"Sabor a Mexico" enchanting mix of flavor, color and textures... #Midtown 51st &amp; Park Just enjoy it!	1408544173	502096769992654848	f	mexicoblvd
Be careful what u wish for... RT @jeremyjmedina: Good thing @KorillaBBQ is a food truck cuz if it were a store I think I'd eat it every day.	1409340648	505437430888296448	f	korillabbq
Done in DUMBO! Happy Labor Day Weekend!	1409337998	505426316225949696	f	korillabbq
Kick ur Labor Day bbq up a notch with KOREAN bbq! We'll be at Brooklyn Bridge Park throughout the weekend for US Open Streaming!	1409335838	505417253316485120	f	korillabbq
Thank god for bacon fried rice, amiright?? #TGFBFR	1409332228	505402112621412352	f	korillabbq
Wsup DUMBO! We ready on Water &amp; Jay ready by 11:30!	1409324397	505369266649309184	f	korillabbq
Catch us today at FiDi's Front &amp; Gouveneur at 11:45 or Dumbos Front &amp; Jay	1409324184	505368374613131264	f	korillabbq
Finish the week right--with a chosun bowl. Here's where to find us today: Front &amp; Old Slip (FiDi) and Water &amp; Jay St. (DUMBO).	1409322303	505360485295071232	f	korillabbq
Getting a lotta love this week! Thanks yall. RT @CultureTrip: New York's 10 Best Food Trucks http://t.co/mVA7hzKyRy http://t.co/OZGpWFZ05T	1409255712	505081180761628672	f	korillabbq
THAT'S MY JAM // Keepin the tunes alive while we serve up Killa KBBQ on the truck! Hope you enjoy the... http://t.co/UrvTrS0dmu	1409250793	505060551492665344	f	korillabbq
@GregorySoto @NYRealValue Sorry guys, no dinner service until next week! But come find us for lunch and get bacon fried rice then!	1409247759	505047826942816256	f	korillabbq
RT @DowntownBklyn: Who's hungry? Food Truck Thursday here at Future Plaza. Cc: @KorillaBBQ @papayakingtruck @Redhooklobster @waffletruck ht...	1409243630	505030507072356352	f	korillabbq
Now serving 47 and Parkz!	1409241581	505021910808526849	f	korillabbq
We can't wait for you to have some either! RT @RanaGood: Can't wait to have some @KorillaBBQ for lunch today.	1409239225	505012031490392067	f	korillabbq
Metro tech we will be rdy to serve y'all by 1130! Come grab that kbbq.	1409236743	505001621630513152	f	korillabbq
Come get your KBBQ lunch fix! Truck spots today: 47th &amp; Park (Midtown) and Gold St. &amp; Flatbush (Downtown Bklyn).	1409235334	504995712602759168	f	korillabbq
We do too! MT @souvlakitruck: Love being on this list!: 10 Best Food Trucks in #NYC http://t.co/iVAp4uNbeI #foodtrucks #10best #foodie	1409168428	504715086641262592	f	korillabbq
Done in DUMBO! Catch us again Friday!	1409164508	504698644655001600	f	korillabbq
Water and old slip ready at 11:45!	1409152251	504647234668224512	f	korillabbq
DUMBO! We ready for ya at Water &amp; Jay starting 11:30 sharp!	1409151920	504645848232656896	f	korillabbq
Power through this #humpday with a Korilla bowl! Find us at Front &amp; Old Slip in the Financial District and Jay &amp; Water St. in DUMBO!	1409149826	504637063908839425	f	korillabbq
Day 1 of @ElectricZooNY starts NOW! Come and Grub at our #dumpling bar! #bubbletea and more. #EDMFamily #trancefamily http://t.co/YnZaEuprno	1409327882	505383883979096065	f	bigdsgrub
RT @nycfoodtruck: Dance, eat, repeat with @BigDsGrub this weekend at @ElectricZooNY! http://t.co/vQuWTnRJsx #ezoo6 #ezny #ezoo	1409320483	505352851628232705	f	bigdsgrub
@tannercurtis: @bigdsgrub My office is too far away now! You should roll the Khao cart over to 40th and 8th ave ;) maybe! New job loc sux	1409249664	505055815364259840	f	bigdsgrub
@tannercurtis: @AlexJamesFitz @bigdsgrub because I can't. You can?	1409247769	505047865207828480	f	bigdsgrub
@1337Ryan: @bigdsgrub No midtown today?  we're setting up for @ElectricZooNY on Randall's Island	1409240993	505019447393140736	f	bigdsgrub
Stop by our booth for the best #Dumplings &amp; #Dimsum!! Feed the #rage @ElectricZooNY #rage #EDM #trancefamily http://t.co/xwbOSSNYgV	1409235075	504994626189930496	f	bigdsgrub
Join us at the @RoyalPalmsClub tonight. 514 Union Street, #Brooklyn. 6pm till' late.  #shuffleboard	1409173553	504736581853667329	f	bigdsgrub
Change of plans today... Join us at 53rd Street and Park Avenue today for lunch.	1409147457	504627128009515008	f	bigdsgrub
This Friday, Saturday &amp; Sunday look for @bigdsgrub #Dumpling &amp; #Dimsum Bar @ElectricZooNY #rage #EDM #trancefamily http://t.co/7VI51bsX7m	1409145444	504618683038461952	f	bigdsgrub
RT @nycfoodtruck: . @BigDsGrub is gearing up to be a part of your @ElectricZooNY experience this weekend! http://t.co/w0Zyb32TyS #ezoo6 #ez...	1409078791	504339122090422273	f	bigdsgrub
Your lunch is ready! 53rd Street and Park Avenue, now till' 2:30pm	1409068218	504294774091034624	f	bigdsgrub
Join us today for #TacoTuesday at 53rd Street and Park Avenue!!	1409057919	504251578195656704	f	bigdsgrub
@getperfekt: @bigdsgrub you're missed at the WFC!!  :( where to go around there? We miss @BrookfieldPLNY too!	1408994200	503984320378585089	f	bigdsgrub
Big D's Grub is at Hudson/King St for lunch today! (375 Hudson Street) Preorders call 646-543-BIGD	1408975814	503907204697952256	f	bigdsgrub
The Khao Cart is on 50th Street btwn 6th and 7th Ave today only and closed the rest of this week. Don't miss out... http://t.co/Isws4x8N4p	1408975729	503906847339061248	f	bigdsgrub
The Khao Cart is closed today.  Have a great weekend and well see you next week!	1408715835	502816774409437186	f	bigdsgrub
Big Ds Grub Truck - 53rd Street and Park Avenue \nThe Khao Cart - 50th Street btwn 6th and 7th Avenue	1408635000	502477726197248000	f	bigdsgrub
Change of plans due to parking...\nBig D's Grub Truck - 53rd Street and Park Avenue today!!	1408629322	502453913556369408	f	bigdsgrub
And...we're back!  Join us for lunch at The Khao Cart, 50th Street btwn 6th and 7th Avenue. Check out today's menu!!! http://t.co/LrJNmr1rF5	1408627245	502445199365521408	f	bigdsgrub
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
Happy Labor Day Weekend!!! Our truck &amp; cafe are both closed this weekend for the holiday!! See you next week!!!	1409324154	505368250776297473	f	thetreatstruck
!!! We won't be at our regular spots today, but we'll be back soon! Have a great day!!!	1409157163	504667836523225088	f	thetreatstruck
Hello!!! We are finally here on Instagram! Hooray!!! http://t.co/jdwL1n8De0	1409071793	504309771798052864	f	thetreatstruck
Our shop, The Treats Truck Stop, is closed until Sept.2nd. We still deliver treats &amp; cakes! And you can come see us at the truck!	1408891007	503551496748007424	f	thetreatstruck
!!! Sun, Aug 24th no truck today! We'll have spots during the week!!!	1408890891	503551010737242113	f	thetreatstruck
!!! Sat, Aug 23rd, no truck today! Our shop, The Treats Truck Stop open 9am-4:30 @  521 Court st, Carroll Gardens, Brooklyn!!!	1408792079	503136562822279170	f	thetreatstruck
!!! Fri, Aug 22nd we have a private event today, but we'll be back at our regular spots next week! Have a great weekend!!!	1408723655	502849571660525568	f	thetreatstruck
!!! Thurs, Aug 21st 3:30-7pm Bway (86th &amp; 87th st)!!!	1408647547	502530352947396610	f	thetreatstruck
@curlycomedy yes, yes! Hope you can come by another day! We're usually at 45th st&amp; 6th ave 2 or 3 times a week!	1408647440	502529902961512449	f	thetreatstruck
@curlycomedy that was a tweet from yesterday! We are on the UWS today!	1408644604	502518007697272832	f	thetreatstruck
Headed to the UWS this afternoon! Bway (86th &amp; 87th)!! About 3-7pm. We'll let you know our opening time when we get all set up!!!	1408631419	502462706189099009	f	thetreatstruck
4:30-7pm 18th st &amp; 7th ave!!!	1408566017	502188392856424448	f	thetreatstruck
Here's the rest of our week! 45th &amp; 6th and 18th &amp; 7th ave today, then Bway (86 &amp; 87th) tomorrow, and private events Fri &amp; Sat!!	1408555147	502142799459155968	f	thetreatstruck
!!! Wed,Aug 23rd 12-3:30 45th st &amp; 6th ave, then 4:30-7pm 18th st &amp; 7th ave!!!	1408543470	502093824102264832	f	thetreatstruck
!!! Tues, Aug 19th. 12:30-3:30 45th &amp; 6th ave!!!	1408462219	501753029998440449	f	thetreatstruck
we're loading up the truck with treats &amp; we'll let you know our spots &amp; hrs later this morning!	1408451651	501708707261329408	f	thetreatstruck
Our truck will have spots Tues, Wed, Thurs &amp; Fri this week!! Hope you can come on by!!!	1408380855	501411766862368770	f	thetreatstruck
@sezinhason we'll have a spot on Tuesday, yes! We tweet it as soon as we park! Most likely 45th st &amp; 6th ave!	1408380786	501411477417631744	f	thetreatstruck
@sezinhason thanks for writing! Our truck is not open today (Monday). We hope you can come by the truck another day this week!	1408372868	501378264624283649	f	thetreatstruck
No truck this weekend! Our truck back next week! Our shop is closed for summer break Aug 16th-Sept 1st (open 1 day -Sat Aug 23rd)	1408196922	500640294480539649	f	thetreatstruck
How You Doin  we are in the Seaport today @greenboxny @gofooda http://t.co/Pu7B5yIkL2	1409588839	506478416850583552	f	valduccis
Dumbo. Last weekend of summer? Are you serious? Let's talk about it @dumbolot We'll bring noodles. #turndownforwok till 3pm	1409329022	505388668723675136	f	mamuthainoodle
RT @Erin_go_braugh1: No one makes pad Thai like @mamuthainoodle #turndownforwok	1409243762	505031058413596673	f	mamuthainoodle
17th&amp;5th we're back for you! Come &amp; try our egg noodle w/homemade roast pork special (ba mee hang) a Thai street food favorite!  Till 3pm	1409154818	504658003833151488	f	mamuthainoodle
RT @_sugatits: #TurnDownForWok  @ Afropunkfest 2014 http://t.co/rvTwOgj539	1408989792	503965834478624768	f	mamuthainoodle
How was your weekend? Come tell us. We are on 17th&amp;5th. Till 3pm #turndownforwok	1408982665	503935941145550848	f	mamuthainoodle
. @afropunk day2! Could today be crazier than yesterday?! Bad Brains last night was whoa! Body Count? Nuts! We on Navy st. #turndownforwok	1408896733	503575517225041920	f	mamuthainoodle
Wow @afropunk what a day! That was bananas! Let's do it again tomorrow! #turndownforwok	1408850836	503383009933144064	f	mamuthainoodle
Thank you Dumbo! What a way to kick off the weekend! Tmrw, we are @afropunk Fest! Bad Brains! Fishbone! Sharon Jones! Many more! Sat/Sun!	1408755268	502982167769923584	f	mamuthainoodle
Dumbo, you know the deal. It's Friday. Come get your noodle on. Jay&amp;Water	1408719139	502830633409056769	f	mamuthainoodle
@Enigma0280 miss you too! WFC&amp; @BrookfieldPLNY kicked out the trucks! No trucks there anymore. :( follow us &amp; keep updated to where we are!	1408719084	502830400952369152	f	mamuthainoodle
Outdoor fireplace! Tonight we are chilling at an event for GE. We could be at your party too! Let us know! http://t.co/oBXs2HvUuJ	1408664865	502602990646468608	f	mamuthainoodle
17th &amp; 5th, we're back! Another beautiful day for Thai noodles! Come get some. Till 3pm	1408549005	502117038866067456	f	mamuthainoodle
Our good pals spreading knowledge to the masses @LandhausNYC:@gregkellyfox5 and @rosannascotto http://t.co/zrT4Tb5ugO	1408467256	501774157911445504	f	mamuthainoodle
RT @TriciaBaron: @mamuthainoodle Thanks for the heads up! Got myself some delicious Pad Thai! http://t.co/VIf545zklY	1408406161	501517906631725056	f	mamuthainoodle
@TriciaBaron we are back today! Being friends, it's beautiful outside!	1408380199	501409013742182400	f	mamuthainoodle
Hello 17th&amp;5th! Hope you had a good weekend! We here to serve you Thai noodle dishes. Come join us. 11-3pm	1408375204	501388064594624514	f	mamuthainoodle
Join us today @TheSeaport we will be serving hot/fresh Thai noodle dishes until 8pm. Front&amp;Fulton St.	1408203895	500669540901335040	f	mamuthainoodle
RT @TheWoodsBK: Can't get this anywhere else! #fattymelt by @LandhausNYC @ChefPeezie http://t.co/RgF19L8R9P	1408166808	500513988720205824	f	mamuthainoodle
RT @MamuThai: Beautiful out! Lunch with us or find us on seemless/grubhub. A good day for Thai iced tea &amp;/or coffee. Why not have both? #tr...	1408120149	500318284190064641	f	mamuthainoodle
Crazy beautiful day for fresh Thai noodles! Dumbo, it's Friday! 11-3pm Jay&amp;Water st. Come get some!	1408115524	500298888231014401	f	mamuthainoodle
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
Come on down to the Seaport. Till 9 PM http://t.co/6Y1pJCL9eN	1409346362	505461395182583809	f	valduccis
http://t.co/FGoYT6Ijl5	1409330568	505395151620296704	f	valduccis
RT @FoodtoEat: Enjoy a #free Zeppoli with your meal from @Valduccis at Seaport .Preorder here for pickup to skip the long waits: http://t.c...	1409330458	505394689173114882	f	valduccis
It's Panini Friday at the Seaport Free Zeppoli all day http://t.co/1s2aVlA6XF	1409328165	505385074133852161	f	valduccis
RT @Cheap_eats:  @Valduccis: FREE ZEPPOLI  at the Seaport today Till 9 pm @gofooda @greenboxny @Cheap_eats http://t.co/CUDcM4di7a	1409327999	505384374918201344	f	valduccis
Free Zeppoli at the Seaport today Till 9 pm @gofooda @greenboxny @Cheap_eats http://t.co/QPNgwI5dWM	1409322030	505359338396192768	f	valduccis
Meatball Pie is the Best !!! Call @FoodtoEat http://t.co/FT1Xw8cdnI	1409588757	506478074268229633	f	valduccis
RT @BeautePublicist: MASK FANATIC HERE!!!  Tonight's mask will make you love masking as much as you possibly can!  From @laprairie_usa http...	1409277908	505174278841856000	f	valduccis
Follow us on Instagram http://t.co/ChmGtwrACS	1409277802	505173833780056064	f	valduccis
RT @BillieO2: @Valduccis That looks delicious!	1409256693	505085295881388033	f	valduccis
RT @Sammybish: "@Valduccis: Meatball pie !!!!! http://t.co/qKX9gQeNPf" @Terin9333	1409256660	505085159356776448	f	valduccis
Meatball picked Best pie. !!!!!!!!!!! http://t.co/bWIwIp1jde	1409256644	505085091262259200	f	valduccis
Home cooked Food http://t.co/Ga74NTeuPb	1409251569	505063804800352256	f	valduccis
Special Catering !! http://t.co/iF63KtSoWL	1409251523	505063611841388545	f	valduccis
Ducky !!!!! http://t.co/hokKnPr70M	1409247638	505047317721133056	f	valduccis
Calzone  !!!! http://t.co/Bn5gB2C7QN	1409247599	505047155368005632	f	valduccis
Meatball pie !!!!! http://t.co/pgEbWM8Au6	1409247574	505047049923211266	f	valduccis
RT @OCBombshellLife: http://t.co/Y74aPZApEU	1409247514	505046796465627137	f	valduccis
We're Getting ready associate press @AP @gofooda @greenboxny http://t.co/dvMbWugsqz	1409229387	504970766870650881	f	valduccis
Pesto Cherry peppers and Zucchini  Mmmmmm http://t.co/wCZSRbCbdc	1409185968	504788654896975872	f	valduccis
Now That's a Wine Cellar http://t.co/p9YNkUlox1	1409185887	504788316571844608	f	valduccis
Goodbye Summer! We hardly knew you. (sigh) Reflecting over bacon grits on Front &amp; Jay through lunch. @DUMBOFoodTrucks	1409316815	505337468808626176	f	thesteelcart
56th &amp; Broadway, ye hungry mid'towner!	1409239298	505012336613392384	f	thesteelcart
Iced Coffee please! Front &amp; Jay through lunch. @DUMBOFoodTrucks	1409150610	504640353295953920	f	thesteelcart
Yes indeed. 56th &amp; Broadway through lunch.	1409064819	504280520755527681	f	thesteelcart
Smells like Monday on Front &amp; Jay. We'll be burning cinnamon for a while. @DUMBOFoodTrucks #Dumbo	1408972624	503893823362433024	f	thesteelcart
Off the road today. Back in DUMBO on Monday.	1408714208	502809951975522304	f	thesteelcart
Counting our bacon blessings on 56th &amp; Broadway. On through lunch.	1408633105	502469777634623488	f	thesteelcart
@liang oops. Thanks so much!!	1408556676	502149213162332160	f	thesteelcart
@koolikowska Doing a blueberry peach salad today. Soups will be back in September.	1408548801	502116183257399296	f	thesteelcart
RT @Agoraphone: @DUMBOFoodTrucks coffee from @TheSteelCart and Dottie, the only way to start a Weds. http://t.co/Mkercd2uH6	1408543818	502095281522212864	f	thesteelcart
@DUMBOFoodTrucks She won't let you down.	1408543491	502093909116588032	f	thesteelcart
This is Dotty. Dotty's our new spirit animal. What's your spirit animal? Front &amp; Jay through lunch. @DUMBOFoodTrucks http://t.co/NP08z9d3Wa	1408541447	502085339310473216	f	thesteelcart
@BookishMatt Thanks for dining with us!	1408472250	501795103103799297	f	thesteelcart
You've been a very well behaved summer! (We're gonna pay for this aren't we?) - 56th &amp; Broadway through lunch.	1408459718	501742539725348864	f	thesteelcart
Having a Charlie Brown Monday on Front &amp; Jay. Let's see.. butter'll make it better! @DUMBOFoodTrucks	1408373508	501380950350381056	f	thesteelcart
Our Berlin location would be called "Die Stahl Warenkorb." How warm and inviting. Front &amp; Jay though lunch in the #Dumbo!  @DUMBOFoodTrucks	1408109752	500274679815614464	f	thesteelcart
Doing our breakfast/lunchy thing on 56th &amp; Broadway. Come out &amp; enjoy this sneak preview to Fall 2014.	1408027363	499929114414178304	f	thesteelcart
Giving a roundhouse kick to Wednesday on Front &amp; Jay. @DUMBOFoodTrucks	1407940468	499564650447781888	f	thesteelcart
What's this strange liquid falling from the sky?! - 56th &amp; Broadway.	1407852875	499197259549257728	f	thesteelcart
RT @robweychert: You dont often hear me talking excitedly about food, but @TheSteelCart just sold me one of the best sandwiches Ive ever ...	1407780597	498894101446942720	f	thesteelcart
We are on 47st between park av and Lexington av! !	1409240815	505018701796896768	f	chefsamirtruck
We are close today, for health department inspection	1409156241	504663971346276353	f	chefsamirtruck
@jenniferiino @emyxter sounds good! !	1408720280	502835418782777344	f	chefsamirtruck
@jenniferiino @emyxter good morning	1408719624	502832668003016704	f	chefsamirtruck
We are on 47st between park av and Lexington av!	1408635562	502480083240894465	f	chefsamirtruck
We are on 52st and park av!	1408549553	502119338930094081	f	chefsamirtruck
We are on 36st and Broadway!	1408463180	501757063773814784	f	chefsamirtruck
We are on 47st between park av and Lexington av!	1408031509	499946504266973185	f	chefsamirtruck
We are on 52st and park av!	1407944963	499583503580033028	f	chefsamirtruck
We are on 36st and Broadway!	1407857891	499218296689156096	f	chefsamirtruck
We are on 47st between park av and Lexington av!	1407426612	497409381726953473	f	chefsamirtruck
We are on 52st and park av!	1407339597	497044414326640640	f	chefsamirtruck
We are on 36st and Broadway!	1407254690	496688287223152640	f	chefsamirtruck
We are on old slip and water st! !	1407166228	496317252028104704	f	chefsamirtruck
@Annatated we are glad to hear you like it! ! We spread love one bite at a time:))	1406954456	495429015768145920	f	chefsamirtruck
We are on 47st between park av and Lexington av!	1406820880	494868754992742400	f	chefsamirtruck
We are on 52st and park av!	1406734000	494504353659891712	f	chefsamirtruck
We are on 36st and Broadway!	1406649275	494148995250679809	f	chefsamirtruck
We are on 47st between park av and Lexington av	1406217026	492336011322880001	f	chefsamirtruck
We are on 52st and park av!	1406132044	491979570904829953	f	chefsamirtruck
In Saratoga until after labor day. 	1407271860	496760305796775937	f	mactruckny
RT @mcozine: Enjoying my beloved @mactruckny at @saratogatrack. How to get through the rest of summer in NYC without it?! http://t.co/drMwb...	1406155111	492076318951870464	f	mactruckny
Last chance till september NYC!!! At the south st seaport, front st. And john st. Till i sell out.	1405267201	488352153841315841	f	mactruckny
RT @LincolnNYC_65th: http://t.co/yW106Jk868 The best way to taste the most delicious Italian pasta in New York is at Lincoln Ristorante.	1405089745	487607851410411522	f	mactruckny
@gmonster711 47st between Park and lex Birthday girl 	1405078248	487559626661978114	f	mactruckny
Good morning 47st!!! Between Park and Lex today for lunch. Last chance before september #saratogabound	1405076958	487554219361050624	f	mactruckny
@Lobsterhut yessss sirr!!! Looking forward to seeing you upstate for some #tasty #lobsterroll	1405004480	487250223677181954	f	mactruckny
Front St. And John St. #seaport #seechange 12-8	1405004428	487250004482875392	f	mactruckny
Parked today on 48th bet 6 and 7 ave\n\nCall in orders to: 917-756-4145	1409667576	506808665404616704	f	disosnyc
RT @RefineryHotel: Just like mom used to make it, only better! @Mactruckny parked outside the hotel today. More Mac &amp; Cheese plz! http://t....	1404924368	486914210450780160	f	mactruckny
38th st. And 6th ave. in front of the refinery hotel. 12-6	1404919095	486892094342967296	f	mactruckny
John st. &amp; Front st. 12-8 south st. Seaport	1404746453	486167979248197634	f	mactruckny
RT @LBoschie: AMAZEBALLs buffalo and pulled pork combo @mactruckny  - thank you for the mix! love, the 2 girls with 3 forks  http://t.co/...	1404669895	485846873417056257	f	mactruckny
South st Seaport, John st. &amp; Front st. 12-8	1404664806	485825526204878848	f	mactruckny
RT @TheNYRA: Have you checked out the #Belmont #StarsandStripes-bound food trucks lately? @gcnyc1, @mikenwillies, @mactruckny, @hibachiheav...	1404515074	485197505815007232	f	mactruckny
RT @mooshugrill: If you don't see #MSG at @TheSeaport don't fret! We're tucked away on Front &amp; Fulton by #SuperDry and @ambrosehall with @m...	1404067300	483319407154720768	f	mactruckny
Front st. And John st. South street seaport 12-8	1404060613	483291358946267136	f	mactruckny
RT @ESYNYC: @JonathanBenno please help us spread the word about our campaign to improve our Harlem garden! http://t.co/NB60ZAPkbt #rootingf...	1403826144	482307923616342019	f	mactruckny
RT @HerNameWasNicki: @mactruckny I see you... http://t.co/7KFsRFre39	1403575221	481255476261163008	f	mactruckny
12-8 seaport. Water &amp; Fulton	1403538911	481103179933700096	f	mactruckny
12-8 water and fulton #seaport #seechange	1403453449	480744726476247040	f	mactruckny
RT @EthKramer: That feeling you get when your favorite empanada truck regrams you! @handrewcohen @LindsayHMeyers @NuchasNYC  http://t.co/9...	1409359472	505516383279792128	f	nuchasnyc
@HeatherKuka thanks for stopping by! What did you order?	1409359465	505516353466679296	f	nuchasnyc
RT @HeatherKuka: @NuchasNYC's #empanadas are ridiculously delicious.	1409359452	505516300266115072	f	nuchasnyc
Its the last weekend of #Summer! Come visit us in #TimesSquare and #GreeleySquare!	1409351712	505483836583862272	f	nuchasnyc
#Nuchas truck is heading to @Jones_beach for the @MotleyCrues final tour!	1409340313	505436025150525440	f	nuchasnyc
Put your #nuchas in the air! #regram @dapethan #MuchasNuchas http://t.co/yPWpMjmZ6T	1409331601	505399483329310720	f	nuchasnyc
RT @FoodtoEat: Get some empanadas to munch on from @NuchasNYC on Broadway btw 42nd and 43rd St! Preorder online for speedy pick up: http://...	1409328333	505385778206502912	f	nuchasnyc
RT @TSqNews: Visit the 42/43rd St. Broadway Plaza this week &amp; use your Crossroads app at @NuchasNYC or @SnackBoxNYC #EatTsq http://t.co/bTT...	1409261329	505104743195111424	f	nuchasnyc
Whos at @PNCArtsCenter for @KingsOfLeon #mechanicalbulltour? Stop by the #Nuchas tent!	1409253334	505071207029690370	f	nuchasnyc
Throwback Thursday, when Serious Eats: New York came to visit the Nuchas truck! http://t.co/7z1zb1qjw1	1409245201	505037096566796288	f	nuchasnyc
Awesome pic! Thanks! RT @unsklld16: @NuchasNYC makes the best #empanadas ever!! #nuchasnyc #foodie #nyc #timessquare http://t.co/HEw2UqkiXA	1409242816	505027091684159488	f	nuchasnyc
Have you tried New York's latest #breakfast craze? The Nuchas #Breakfast Empanada! Stop by tomorrow morning!	1409172910	504733886258352128	f	nuchasnyc
RT @TSqNews: Visit the 42/43rd St. Broadway Plaza this week and use your Crossroads app to receive great deals at @NuchasNYC or @SnackBoxNY...	1409165920	504704567301652481	f	nuchasnyc
Love food and sales? Nuchas is hiring! We are looking for looking for exceptional, customer service-oriented,... http://t.co/ILvZtdHfKR	1409159827	504679011109601280	f	nuchasnyc
Want to join the #Nuchas team? Youre in luck, were hiring! http://t.co/YqYtwarl8E	1409091626	504392954874957828	f	nuchasnyc
Watch @LilTunechi and @Drake battle it out at @PNCArtsCenter with #MuchasNuchas in hand!	1409080543	504346472092291072	f	nuchasnyc
@ValeyQU Glad to her! Hope to see you soon!	1409075564	504325588136759296	f	nuchasnyc
RT @ValeyQU: @NuchasNYC All of the veggie empandas are delicious.  U got a new fan !!	1409075548	504325520767856640	f	nuchasnyc
Labor Day weekend is coming up! Dont feel like making something for the BBQ? Order Nuchas catering! Email your... http://t.co/jJH8vnhddd	1409068801	504297222830575618	f	nuchasnyc
The truck is out and about on the corner of Water &amp; Broad St today #NY! We'll be here until 2:15PM today http://t.co/8NRuWH3jH5	1409065770	504284508019912705	f	nuchasnyc
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
Kotmadam South See Port till 10pm\nBierbeek @ Great Lawn in Central Park till 8pm\nGoesting @ Broadway &amp; 66th till 10pm	1409405710	505710319801741312	f	waffletruck
We have been going through some issues at our commissary and due to these issues we are unfortunately not able to... http://t.co/8hzi0hlGy4	1386160771	408213977030615041	f	wingnitnyc
Sorry everyone, we aren't out today. See you guys tomorrow.	1386081285	407880590243803137	f	wingnitnyc
Happy Thanksgiving Everyone! http://t.co/u7HYUz1MyA	1385666299	406140011419955200	f	wingnitnyc
Happy Thanksgiving Everyone! http://t.co/yTrps7tc4O	1385666235	406139743098142720	f	wingnitnyc
RT @MobileCuisine: Food Cart Vendors Face Fines and Arrests for Selling Snacks - http://t.co/Oh2k939USu	1385525761	405550553155252224	f	wingnitnyc
Open for lunch baby! 48th st bet 6 and 7 ave.. \n\nCall in orders: 917-756-4145	1409327654	505382929762377728	f	disosnyc
RT @FoodtoEat: End your week with @DiSOSNYC , gourmet Italian sandwiches! Om nom nom. Preorder online for fast pick up: http://t.co/9yrQoYg...	1409326687	505378873371287552	f	disosnyc
The society is located on 48th st bet 6 and 7 ave today. Get it in before the long weekend..\n\nCall in orders for pick up: 917-756-4145	1409322495	505361290727284736	f	disosnyc
Tomorrow we will be at 48th bet 6 and 7 ave..	1409250310	505058526616899584	f	disosnyc
RT @FoodtoEat: Big Pauly, Lefty Louie, Dapper Don can all be found @DiSOSNYC for  Italian sandwich noms! Preorder for quick pick up: http:/...	1409239283	505012272658673665	f	disosnyc
Open for lunch! 47th st bet park and lex\n\nCall in orders to: 917-756-4145\n\nNutella pockets for dessert today	1409239256	505012162163900416	f	disosnyc
Parked on 47th bet park and lex today\n\nCall I'm orders to: 917-756-4145	1409237164	505003386794934272	f	disosnyc
RT @FoodtoEat: Join @DiSOSNYC for lunch today at Water &amp; Old Slip. Check out their awesome menu online here and preorder: http://t.co/Hf55v...	1409152573	504648587981381632	f	disosnyc
Parked on Water st. And old slip today..\n\nCall in orders to: 917-756-4145\n\nPorchetta is in\n\nNutella pocket desserts	1409145880	504620515060109313	f	disosnyc
Tomorrow we will be parked on water st. And old slip.. #FIDI	1409094692	504405814128697344	f	disosnyc
Open for lunch.. Get it in. 48th bet 6 and 7 ave\n\nCall in orders to: 917-756-4145\n\nPorchetta is in today\n\nNutella pockets for dessert..	1409064810	504280479374520320	f	disosnyc
Location today: 48th st bet 6 and 7 ave..\n\nCall in orders to: 917-756-4145\n\nPorchetta is in\n\nNutella pocket desserts are in	1409059911	504259933542809600	f	disosnyc
@vendyawards welcome! We've been waiting for you guys..	1408991654	503973640959168513	f	disosnyc
47th bet park and lex today.\n\nCall in orders to: 917-756-4145\n\nPorchetta is in..\n\nNutella pockets are back!!	1408978927	503920260127670272	f	disosnyc
47th bet park and lex today..\n\nCall in orders to: 917-756-4145	1408977657	503914933864894465	f	disosnyc
Schedule for the week, as there has been some changes to it:\n\nMON: 47 and park\nTUES: 48 bet 6 and 7 ave\nWED:... http://t.co/pV7IvCk8ws	1408972849	503894770658607104	f	disosnyc
Reminder the society is parked on 48th st bet 6 and 7 ave today..\n\nCall in orders to: 917-756-4145	1408718189	502826647251591168	f	disosnyc
@BrucieG1948 HAHAHAHAAH!! And it's Friday! Bam!	1408717237	502822655884800002	f	disosnyc
RT @BrucieG1948: @DiSOSNYC this is how I feel when the DiSOS truck shows up. http://t.co/4lau4Vn7JE	1408717213	502822551580864512	f	disosnyc
@diamonds2323 no.. going forward we will be doing water and old slip on Wed.	1408714210	502809956413091840	f	disosnyc
Time spent in #SharonSpringsNY is Time Well Spent...@beekman1802boys #NYS #SchoharieCounty #AmericanHotel #theblackcat http://t.co/0UyCqKkw5u	1409355989	505501776221831169	f	thegreenradish1
ryoko_dono's photo http://t.co/HF7hEINsWB	1409354323	505494787114676224	f	thegreenradish1
Health Benefits of Radish...\n\nhttps://t.co/kHPmQKv2yt http://t.co/EQaW7ZpopX	1409323421	505365173595799552	f	thegreenradish1
Heath Benefits of Radish #vegan #organic @Brendan_Brazier @WellandGoodNYC @CleanPlates @DrFuhrman @DharmaYogaNYC https://t.co/kHPmQKv2yt	1409319525	505348835045306369	f	thegreenradish1
G-Rad is on Vacay, back 9/2/14...	1409070734	504305327198961664	f	thegreenradish1
RT @underthecorktre: @thegreenradish1 Your Burger sounds so good!! Congrats!!	1409057809	504251116737929216	f	thegreenradish1
Read about The Green Radish in the 1st Edition of Food Truck Magazine........ http://t.co/IQsAX59GrS	1409056337	504244944178278400	f	thegreenradish1
Our Classic Black Bean Burger makes the cut......... http://t.co/8wEgeymJ06	1409019754	504091503606890496	f	thegreenradish1
Sunday's Breakfast\n\nAll Organic:\n\nBanana, Blueberries, Raspberries, Figs, Almonds, Chia Seeds, Hemp Seeds,... http://t.co/Cwoor2mUKB	1408889215	503543982849531904	f	thegreenradish1
Photo: Happy to meet Craig from the hot Veg spot Terris..... http://t.co/uM5mK4Bnht	1408842914	503349783613149184	f	thegreenradish1
live longer, eat radishes! http://t.co/SIpbR9GHY6	1408842579	503348375610458112	f	thegreenradish1
G-Rad was proud to get a visit from Craig, owner of the Hot Veg Spot, Terri's, on Maiden Lane and 23rd... http://t.co/bwKYB8SjpP	1408837903	503328762906546176	f	thegreenradish1
RT @TerriRestaurant: How Eating Vegan Makes Me a Better Athlete - http://t.co/tC7tj3KAVA via @OneGreenPlanet #vegan	1408836209	503321660070846464	f	thegreenradish1
RT @TerriRestaurant: Professional ballerina @sassyballerina cures chronic eczema through vegan diet -http://t.co/uKY8pqTn2p #vegan #ballet ...	1408836194	503321594186719232	f	thegreenradish1
RT @TerriRestaurant: Al Sharpton: (@TheRevAl) My 170-pound weight loss was due to vegan diet and daily workouts-  http://t.co/1aB9jmmzNR #v...	1408836174	503321513236656128	f	thegreenradish1
Time is Money, call it in for pickup, Wall/Water, 11to2 917-512-1599 @WSJ @BuzzFeed @mashable @OneGreenPlanet @Citi @NYTMetro @EaterWire	1408721740	502841542030426112	f	thegreenradish1
We'll bend over backwards 4 your perfect lunch, #GoVegan! @DharmaYogaNYC @PureYogaNYC @PowerflowYogaNJ @midtownlunch http://t.co/BgYsSSBDDq	1408633169	502470049853349888	f	thegreenradish1
We'll bend over backwards for your perfect lunch, #GoVegan! @RollingStone @usweekly @MensHealthMag #wennermedia @ubs http://t.co/G20US1hY2o	1408632855	502468731667513344	f	thegreenradish1
Let's Rock Some Veg Today!  @RollingStone @PaulMcCartney @Johnny_Marr @S_C_ @Beyonce @rickygervais @MensHealthMag @usweekly #wennermedia	1408621988	502423151985565696	f	thegreenradish1
White Bean Burgers Marinated Red Onions Black Olive Tapenade  Cinnamon-Chocolate Donarts, Today, Thursday, 52&amp;6th... http://t.co/tqSlmv3cWT	1408621494	502421079907119104	f	thegreenradish1
Our contest winner will be picked at 2pm today so make sure to send in your entry! #hibachiheavencontest	1409405312	505708651185975298	f	hibachiheaven
Forest Hills: We will be on 71st &amp; Continental from 11-5 today! #hibachiheavennyc	1409405274	505708490749640704	f	hibachiheaven
Day 2 of #ELECTRICZOONY come to the #hibachiheavennyc truck!	1409405232	505708314026860544	f	hibachiheaven
Pagadder @ Brooklyn Bridge till 10pm http://t.co/1iB9B6cxIU	1409405735	505710423698841600	f	waffletruck
Momma Truck @ Park Slope till 4:30pm\nKastaar @ Governors Island till 6:15pm\n\nCARTS!\nVedette @ 60th &amp; 5th till 8pm	1409405700	505710278898892800	f	waffletruck
Labor Day Weekend!!! #dingesforeveryone\n\nLe Cafe @ 15 Ave B open till 2am\nDe Wafel Cabana @ 35th &amp; Broadway open till 10pm	1409405686	505710217376854016	f	waffletruck
@jdaleo24 Fri &amp; Sat Times Square until 1AM / Greeley Until 11PM / Truck at Jones Beach. tx	1409404325	505704508572573696	f	nuchasnyc
#MadeInAmericaFestival is this weekend - if you want in, it means a trip to Philly! Mad maple love.	1409406900	505715309643571200	f	snowdaytruck
Bessie's at @TheSeaport, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always @houstonhallnyc	1409407213	505716625421524994	f	milktrucknyc
Outdoor markets at Williamsburg @smorgasburg and Fort Greene @bkflea, come spend your Labor Day weekend with us!	1409407210	505716612595347456	f	milktrucknyc
It's Labor day weekend meet us on @Gov_Island and enjoy this beautiful long weekend.	1409409499	505726210111188993	f	mrniceguytruck
Weeeeeeeeekend! #labordayweekend #dingesforeveryone http://t.co/1clc8fX2kr	1409409607	505726663221870592	f	waffletruck
We're Catering a Italian Barbecue in Long Beach Island see you Sunday at the Seaport !!! http://t.co/3NROrEPxYO	1409408019	505720005460496384	f	valduccis
RT @GovIslandFood: What a great day to come to @Gov_Island for some amazing food from @SweetChiliNYC @carlssteaks @MrNiceGuyTruck @DiSOSNYC...	1409410792	505731636357758976	f	usafoodtruck
Find us at Pier 1 at @BklynBrdgPark for the Amex EveryDay #USOpen2014 Live Viewing Party! From 11a- to when the match ends!	1409410637	505730984009273344	f	andysitalianice
RT @BklynBrdgPark: Head to Harbor View Lawn to enjoy the US Open, a delicious basket giveaways and more! http://t.co/XdmjbsV5Kf	1409410525	505730514079477760	f	andysitalianice
RT @GovIslandFood: What a great day to come to @Gov_Island for some amazing food from @SweetChiliNYC @carlssteaks @MrNiceGuyTruck @DiSOSNYC...	1409410519	505730489249169410	f	carlssteaks
@dagirlnxtdoor so sorry we had no idea they were going to end the location a day early:(	1409410577	505730733844213760	f	sweetchilinyc
RT @GovIslandFood: What a great day to come to @Gov_Island for some amazing food from @SweetChiliNYC @carlssteaks @MrNiceGuyTruck @DiSOSNYC...	1409410520	505730495137996800	f	sweetchilinyc
@rnudels: @bigdsgrub your chicken dumplings were amazing. I had to get it twice  @ElectricZooNY Feeling the love! #PLUR	1409410717	505731318836391936	f	bigdsgrub
We're about to kick it off Day 2 at the @ElectricZooNY.  Come join the animals  &amp; feast at our #Dumpling &amp; Dim sum bar! #edm #trancefamily	1409410231	505729281033797633	f	bigdsgrub
We are at the grand opening of the new #JCPBrooklyn today! Come by for some fun (and free franks) http://t.co/OUOpG4mkHK @jcpenney	1409410934	505732230329929729	f	papayakingtruck
Open &amp; Serving lunch on 71st &amp; Continental in Forest Hills, Queens!	1409413260	505741985140183040	f	hibachiheaven
Happy Labor Day wknd! In the city? Head down to the seaport! Front and Fulton 12-8	1409412518	505738876317863936	f	philssteaks
Kick off Labor day weekend w us at GovIslandFood 3 days of great Cheesesteaks, great weather\n#GOTWHIZ... http://t.co/dGCE6sqwrV	1409411199	505733343712137216	f	carlssteaks
Kick off Labor day weekend w us @GovIslandFood 3 days of great Cheesesteaks, great weather\n#GOTWHIZ #baconcheesefries http://t.co/IJpPVib1Ho	1409411089	505732880811962368	f	carlssteaks
We are hiring! Looking for a full time cook with a drivers license! Mobile vendor badge is a huge... http://t.co/7VV0y67Z1h	1409411756	505735676994670594	f	sweetchilinyc
#HAPPYLABORDAYWEEKEND we are celebrating @Gov_Island @govislandfood till 6! #sriracha #fries #topchef #weekendplans	1409410864	505731935210328064	f	sweetchilinyc
What's your favorite beach in NY state? Tell us for one free dinges! #freedinges #IloveNY #sun #LaborDayWeekend \nhttps://t.co/irCcmCF31c	1409411493	505734576980119552	f	waffletruck
Asian Tapas Truck is ready @TheSeaport 11:30~8pm. catch Shanghai Sogo for #edamame #yakitori #buffalo #dumpling #rice #noodles   #bubbletea	1409413337	505742309984862208	f	shanghaisogo
Labor Day Weekend! Try the #best #NYC #foodtruck @TheSeaport, Front and Fulton @DeliNDogzTruck @Chefsamirtruck @PhilsSteaks &amp; @milktrucknyc	1409413082	505741241070678017	f	shanghaisogo
Helloooooo long weekend! We'll be at #court17 @usopen all weekend slingin' cheese! #ComeAndGetIt!	1409411060	505732760343171072	f	morristruck
@BodegaDANZ: @bigdsgrub @ElectricZooNY the pork dumplings were  Much love!! #PLUR	1409412369	505738247453278208	f	bigdsgrub
RT @GovIslandFood: What a great day to come to @Gov_Island for some amazing food from @SweetChiliNYC @carlssteaks @MrNiceGuyTruck @DiSOSNYC...	1409411260	505733595974348801	f	disosnyc
Bumper Sticker on a car @wholefoods #Montclair  http://t.co/cOpK8J6dPh	1409412042	505736878218551296	f	thegreenradish1
Menu for today at the new #JCPBroolyn\n http://t.co/8MeKji9gJe	1409413524	505743094273548288	f	papayakingtruck
We will now be showing exactly which harbor your lobster roll came from on our whiteboard. Pier 13 Hoboken! #EatFresh http://t.co/2YJ43wUOuh	1409414183	505745857984348161	f	nautimobile
@ElectricZooNY: The forecast is all clear for Day 2 of #EZoo. The only thing missing here is you! http://t.co/yydBXDYjTm We're HERE!! 	1409413774	505744141800976386	f	bigdsgrub
RT @ElectricZooNY: Here's a glimpse of what went down during Day 1 of #EZOO...who's ready for Day 2?! http://t.co/kMkCOiDs7O #ThisIsEZoo	1409413734	505743974297247744	f	bigdsgrub
RT @WilliamTPorter: @NuchasNYC Damn you! I almost want to stay out and eat more empanadas instead of seeing Crue! I will find you in NYC!	1409414362	505746606927642624	f	nuchasnyc
Menu today at the new #jcpBrooklyn http://t.co/96f5lHn6NN	1409415087	505749647735152641	f	papayakingtruck
RT @jcpenney: It may be warm out, but #jcpBrooklyn is having the coolest day of summer! http://t.co/7yxbaGRtS8	1409415040	505749453127815170	f	papayakingtruck
#catering #events today! Book us for your next #party #eddiespizza http://t.co/4edzebn7Cn	1409416594	505755972108042240	f	eddiespizzany
#catering #events today! Book us for your next #party #eddiespizza http://t.co/1kl21ubAAn	1409416592	505755962959863808	f	eddiespizzany
Up and running @Pier13Hoboken until 10pm #Hoboken #Pier13 #Cheesesteaks #ChickenCheesesteaks\n#RoastPork #BroccoliRabe \n#Salads #Fries	1409415349	505750748916113408	f	shortysnyc
@_zebrastripes @agilbert77 yes yes. Do this thing.	1409415282	505750465729282048	f	waffletruck
@GigiClark4 @kmuks126 too long, we say!	1409415244	505750310137364480	f	waffletruck
Meet me at the main parking lot of #ezoo	1409416166	505754173418512384	f	mamuthainoodle
#Nuchas truck will be at @Jones_Beach tonight for the @zacbrownband! \n#ZBBRoadTrip	1409416514	505755633724178432	f	nuchasnyc
Day 2 of #ELECTRICZOONY / come get some grub at the VIP tent! Make sure to tag #hibachiheavennyc http://t.co/Cyu10YNSWU	1409417403	505759362863099904	f	hibachiheaven
#pietruck is on Governor's Island until about 5pm. Beautiful day for it!	1409502517	506116356644020224	f	dubpies
Did you know: Our delicious empanadas are baked, not fried! Theres no reason to feel guilty after enjoying these... http://t.co/BY8VqAG53U	1409418002	505761875842199554	f	nuchasnyc
Lunchtime! @BKlynBrdgPark #tacos #USopen #Amex #EveryDayMoments #SerenaWilliams @DumboNYC @DUMBOBID @DUMBOFoodTrucks http://t.co/Nq37tGvr3T	1409419225	505767004033540096	f	domotaco
#taco v #burrito or #murray v #kuznetsov? See both at the #amex #USopen viewing party at #pier1! @BklynBrdgPark  @DUMBOFoodTrucks @DumboNYC	1409418586	505764324808601600	f	domotaco
RT @nycgreencleaner: @DomoTaco @DumboNYC @BklynBrdgPark @DUMBOFoodTrucks  The five spice braised pork shoulder is quite amazing!	1409422812	505782048687390720	f	andysitalianice
Learned young.... @HamptonClassic http://t.co/MuIebrB2zH	1409421720	505777472357818368	f	waffletruck
#Curry #King #Wishing #all #safe #Labor #day #weekend #today @Guinness #Live #It #Up #Johnson #Ave #Bushwick #Brooklyn	1409421710	505777427893993473	f	mausamnyc
Deep-Fried Tequila Is Actually A Thing, And It Will Get You White Girl Wasted (Photos) http://t.co/TRKvZpE9qz via @EliteDaily	1409426409	505797137431396352	f	mexicue
Stop by the #Nuchas tent at @PncArtsCenter to feast on #muchasnuchas for the @MotleyCrues final tour!	1409427309	505800911969853442	f	nuchasnyc
@ja2dalee you won 5 free meals at any #hibachiheavennyc location! Will DM you all info.	1409429478	505810008899334145	f	hibachiheaven
Thank You to @ja2dalee &amp; every one who participated in the #hibachiheavencontest!	1409429474	505809992805797888	f	hibachiheaven
Our #hibachiheavencontest winner is: @ja2dalee. With the most creative Hibachi Heaven Collage! http://t.co/HcjTX0BP8V	1409429469	505809972543123457	f	hibachiheaven
Sweet barbecue meats from @OINKandMOObbq &amp; some serious ghost pepper hot sauce from @HAHTSAHS. Kickin' taste buds on this truck today 	1409430490	505814254269001728	f	nautimobile
See you tomorrow (Sunday) in red bank nj at the farmers market 9:00-3:00 	1409430917	505816045920083968	f	veganlunchtruck
Check out Samsung Galaxy S5 16G Gold (Factory unlocked) #Samsung http://t.co/1mhPt01LWd via @eBay	1409444583	505873364171247616	f	trucktotable
@rseverino_reis we will be in hoboken tomorrow. You can visit one of our many locations as well!	1409445052	505875331509919747	f	nautimobile
@m_indulgence we couldn't agree more!	1409469694	505978689688190976	f	waffletruck
RT @m_indulgence: Every wedding needs to end with a @waffletruck cart. Dat #spekuloos  #wafelsanddinges... http://t.co/OQAm84OJzG	1409469683	505978640149278720	f	waffletruck
@NatalieKristal @NuchasNYC we are excited for this prospect!	1409469657	505978532057845760	f	waffletruck
@AlwaysnforeverN that be the plan.	1409469633	505978431746879488	f	waffletruck
@praveenbom well, sometimes you run and sometimes you wafel.	1409469594	505978268571676672	f	waffletruck
@CultureTrip thanks for the shouting!	1409469560	505978124220497920	f	waffletruck
RT @CultureTrip: New Yorkers; have you tried Wafels and Dinges? Best waffles outside of Belgium @waffletruck http://t.co/ZQEGB8g6dz http://...	1409469548	505978073624637441	f	waffletruck
@CptinAwsme @HamptonClassic wouldn't miss it!	1409469527	505977989092605952	f	waffletruck
@NatalieKristal @waffletruck we are ready.  Looking forward to having you and all the best in your gig!!!	1409485592	506045367931392000	f	nuchasnyc
Parked at the Red Bank NJ farmers market (corner of W. front/ Shrewsbury ave) 9:00-3:00\n\nLemongrass seitan beet... http://t.co/UmQmiWChzm	1409491409	506069767241732096	f	veganlunchtruck
Outdoor stand at Brooklyn Bridge Park Pier 5 @smorgasburg. Sandwich menu always at @houstonhallnyc	1409493615	506079018752290816	f	milktrucknyc
RT @nycfoodtruck: All it takes is time for people to see the larger opportunity that the #foodtruck industry affords.- @DavidWeberNYC via...	1409493087	506076806085365761	f	shanghaisogo
Day 2 of Amex EveryDay US Open Live Viewing Party! Come to the Harbor View Lawn at Brooklyn Bridge Park today at 11am http://t.co/BrZ9Aivfq5	1409493956	506080451929579520	f	andysitalianice
day 3 of #ELECTRICZOONY !! Come meet us in VIP for some fresh #hibachiheavennyc	1409495537	506087080431464448	f	hibachiheaven
RT @BeautifulPuglia: So simple, so tasty! Preparing sundried tomatoes. Greetings from #Puglia! #pugliafoodie #pugliasummer http://t.co/45cC...	1409494205	506081493681451008	f	valduccis
Panini Day at the Seaport @valduccis @greenboxny http://t.co/IBTOF4Ztvg	1409493725	506079479635386368	f	valduccis
sun is shining @govislandfood @gov_island so come out for the last weekend of summer! #sriracha #fries #topchef #weekendplans #happysunday	1409496983	506093148117172224	f	sweetchilinyc
Momma Truck @ Governors Island till 6:15pm\n\nVedette @ 60th &amp; 5th till 8pm\nKotmadam @ South Street Seaport till 10pm	1409496849	506092584431652864	f	waffletruck
Sunday!!!\n\nLe Cafe @ 15 Ave B open till midnight\nDe Wafel Cabana @ 35th &amp; Broadway open till 10pm\n\nKastaar @ Forest Hills till 10pm	1409496832	506092513476636672	f	waffletruck
Which Belgian tennis player won the US Open in 2009? Tell us for one free dinges! #freedinges #USOpen	1409496767	506092241023008768	f	waffletruck
Serving tacos faster than #AndrewMurray at @BklynBrdgPark #Pier1 for today's #Amex #USopen viewing party! @dumbofoodtrucks @dumbobid	1409498111	506097877673078784	f	domotaco
To all the kids on Aug 31st, whose back to school countdowns whither before them. May you find peace in these final hours.. Pier 13, Hoboken	1409499255	506102676581806080	f	nautimobile
@CalicoAvenger this weekly email tells you where to find truck http://t.co/mUigFXgVOn Governor's Island today &amp; tomorrow	1409499583	506104050514165760	f	dubpies
On Governor's Island again. Hope everyone is enjoying their Holiday weekend. Come check us out and say hi.	1409499046	506101797820596224	f	mrniceguytruck
Sunday Funday here @usopen #Court17! Come get your favorite grilled cheese creations from your favorite grilled cheese team!	1409497841	506096745382952960	f	morristruck
RT @ForbesLife: A @USOpen dining guide, including a truffle butter grilled cheese sandwich from @morristruck. http://t.co/fkED6CWxhN http:/...	1409497754	506096379543158784	f	morristruck
Free Zeppoli at the Seaport  Panini Sunday  #BestPizza @Cheap_eats   Family Caters http://t.co/Z0emYHDxFW	1409499869	506105253117579265	f	valduccis
Free zeppole  All day at the Seaport  @cheapeats http://t.co/RfwkNGrVF5	1409498525	506099612558827520	f	valduccis
huevos rancheros minus the huevos #countrybreakfast http://t.co/tlvTGmUn3p	1409499939	506105542629400576	f	milktrucknyc
Oh Shiitake! #Summer is over!? Savor the last moments with a #Shiitake Curry empanada! http://t.co/1kGKrfOY3L	1409500804	506109172044554240	f	nuchasnyc
We're open tomorrow but why wait? #ComeToRedHook today!	1409501109	506110451584073728	f	lobstertruckny
Come spend the last weekend of summer with us @BklynBrdgPark until 7:30	1409502513	506116340512747520	f	delsnyc
@Pier13Hoboken until 10pm #Hoboken #Pier13 #Cheesesteaks #ChickenCheesesteaks\n#RoastPork #BroccoliRabe	1409501758	506113175964512257	f	shortysnyc
PLEASE RT:\n\nI know it's been way too long...\n\nWE WILL BE ON VARICK ST THIS THURSDAY! \n\n(At or near varick/vandam 9:00-3:00)	1409501172	506110716605370368	f	veganlunchtruck
http://t.co/fLRyqd3H61	1409501909	506113806037434368	f	mrniceguytruck
@Palenquefood a perfect sample of our Colombian Conexion arepa with Colombian chorizo nami!! http://t.co/D2xcXJrJgN	1409502057	506114427096428544	f	palenquefood
Come, have fun and enjoy our delicious Arepas and agua panela to refresh your day at Palenque!!!	1409501884	506113703084036096	f	palenquefood
Hi there! Today Rockaway is going to have Dj Quantic and Las nenas rudas in da house!!!	1409501816	506113416386592768	f	palenquefood
Day 3 at the @ElectricZooNY.  Come join the animals &amp; feed the #RAGE at our #Dumpling &amp; #Dimsum bar! #edm #trancefamily #ezoo #sundayfunday	1409502146	506114800817295360	f	bigdsgrub
@NatalieKristal @waffletruck see you soon!	1409504373	506124141506723841	f	nuchasnyc
RT @CultureTrip: New York's 10 Best Food Trucks http://t.co/7gaNqtuNgZ Follow them on Twitter: @biandangnyc @CalexicoNYC @NautiMobile http:...	1409508261	506140450215182336	f	nautimobile
Tomorrow 9/1 we will be on 50 Kent in Williamsburg at the @FoolsGoldRecs day off party! Starting at 2pm	1409510153	506148383787327488	f	delsnyc
@nickyapowell we are outside Grimaldis Pizza @BklynBrdgPark	1409510063	506148007973498880	f	delsnyc
Hint... #USOpen #freedinges http://t.co/ENGaI8wwHJ	1409508922	506143223908032512	f	waffletruck
@Alvaruho we are off the road today bud.	1409511522	506154128775860225	f	fritesnmeats
@Alvaruho u can check our blog at http://t.co/KNYATgHmUA for locations and up dates. Enjoy the rest of ur weekend	1409511947	506155910159675392	f	fritesnmeats
@BT @ElectricZooNY  	1409514766	506167731729989633	f	korillabbq
Truck wont be out tomorrow, but our 766 Washington ave location in brooklyn  will be open. Happy Labor Day!	1409521475	506195871332306945	f	kimchitruck
We are hiring a cook! Drivers license a mega plus!! Email info@sweetchilinyc.com to join our team!... http://t.co/Vjiv4AJZFq	1409524557	506208798760247296	f	sweetchilinyc
THIS WEEK\n\nTues: wall st/water\nWed: 55th/Broadway\nThurs: 21st/5th AND Varick St + JC dindin\nFri: 47th/park\nSat: 14th/3rd\nSun: Red Bank NJ	1409525310	506211959168327680	f	veganlunchtruck
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIyYdw	1409571302	506404864100806656	f	sweeterynyc
Happy #laborday. We are closed today due to #catering #events. Book us for your next #party. http://t.co/EEBjviG2uY	1409574366	506417712634298368	f	eddiespizzany
Happy #laborday. We are closed today due to #catering #events. Book us for your next #party. http://t.co/9FFDbWPTxe	1409574361	506417692438298624	f	eddiespizzany
#HAPPYLABORDAY @nokidhungry @dineoutNYC we are raising $$ all month long to stop hunger in the US! Purchase Sriracha fries to contribute!	1409576675	506427400398577664	f	sweetchilinyc
G1 - South Street Seaport\nG2- Private Parties. ...\n#ComeToTheCheeseYo	1409577319	506430100888616961	f	gcnyc1
Happy Labor Day! Bessie's off the road today, but be sure to catch her later this week. Sandwich menu always @houstonhallnyc.	1409578212	506433843889332224	f	milktrucknyc
Happy Labor Day, y'all. Catch you in #DUMBO tmrw!	1409577846	506432312234758144	f	kimchitruck
This is our kitchen manager Michelle with Grace, a sheep who lives at Farm Sanctuary. At the beginning of August... http://t.co/5DnumfnKX2	1409579088	506437519941316608	f	veganlunchtruck
Ready to start working after Labor Day? Send your resume to work@redhooklobster.com http://t.co/QrIACj2HXP	1409579661	506439920890957824	f	lobstertruckny
What's your favorite American Theme park? Tell us for one free dinges! #freedinges #LaborDay	1409580234	506442326982422528	f	waffletruck
Goesting @ Bway &amp; 66th till 9pm\n\n#dinges http://t.co/wndTu44gKa	1409580220	506442269071654912	f	waffletruck
Kotmadam @ South Street Seaport till 10pm\nBierbeek @ Great Lawn in Central Park till 8pm\nPagadder @ Brooklyn Bridge till 10pm	1409580150	506441975608799232	f	waffletruck
Momma Truck @ Queens Center Mall til 10pm\nKastaar @ 149 St &amp; Morris Av in the Bronx till 10pm\n\nVedette @ 60th &amp; 5th till 8pm	1409580141	506441935821623296	f	waffletruck
Labor day!! #laborday\n\nLe Cafe @ 15 Ave B open till midnight\nDe Wafel Cabana @ 35th &amp; Broadway open till 10pm	1409580130	506441889688461312	f	waffletruck
Seaport today !!! http://t.co/ZWmId6Dvlz	1409581205	506446398255280129	f	valduccis
Happy #LaborDay truck is off the streets but St Marks and 86th St are open and ready for you!	1409581985	506449672295415808	f	papayakingtruck
@plnkc day off today, we will be back out tomorrow	1409581937	506449470478102528	f	papayakingtruck
@juleshyman email us at thecinnamonsnail at gmail about it and we will get it sorted. Sorry	1409582590	506452210113585152	f	veganlunchtruck
@wbegeny yup!!	1409582604	506452266543771649	f	sweetchilinyc
Relax and have a great day ! The Mtbll  will see ya tomorrow! http://t.co/KZK5Tg4fW5	1409583123	506454442456387585	f	mtblls
RT @GovIslandFood: Happy Labor Day. Come on over to @Gov_Island for some great food from @SweetChiliNYC @dubpies @carlssteaks @MayhemAndSto...	1409583384	506455538985484288	f	carlssteaks
RT @GovIslandFood: Happy Labor Day. Come on over to @Gov_Island for some great food from @SweetChiliNYC @dubpies @carlssteaks @MayhemAndSto...	1409583382	506455530295267329	f	sweetchilinyc
We are celebrating #laborday @gov_island with our famous #sriracha #fries which is also raising money... http://t.co/8FOHIxmkBl	1409583062	506454187237208064	f	sweetchilinyc
@EatingAwesome how early? What time?	1409583607	506456473350967296	f	waffletruck
Happy Labor Day All! Today's the last day we'll be at Amex EveryDay US Open Live Viewing Party! http://t.co/dEl3cAdFb9	1409584420	506459883336916992	f	andysitalianice
@MafLoic money's overrated	1409583733	506457003653607425	f	waffletruck
@BennyPack sure is!	1409583695	506456841728323585	f	waffletruck
@erinebecker glad you found!	1409583647	506456641404170240	f	waffletruck
Brooklyn Bridge Park Pier 1 with #amex, viewing of the #USOpen! Let's go! @dumbofoodtrucks @dumbonyc	1409584755	506461289426997249	f	domotaco
Happy Labor day folks!!! come to GovIslandFood enjoy great weather and a Carls famous cheesesteak #GOTWHIZ	1409585288	506463523267166208	f	carlssteaks
Happy Labor day folks!!! come to @GovIslandFood enjoy great weather and a Carls famous cheesesteak #GOTWHIZ http://t.co/R2chR39KLV	1409585183	506463084568133632	f	carlssteaks
RT @GovIslandFood: Happy Labor Day. Come on over to @Gov_Island for some great food from @SweetChiliNYC @dubpies @carlssteaks @MayhemAndSto...	1409585094	506462709786091521	f	dubpies
What a beautiful day to end summer! Find us at our usual spot in DUMBO @BklynBrdgPark and also @FoolsGoldRecs party at 50 Kent in the Burg	1409586997	506470694054805504	f	delsnyc
It's the last day of summer. Technically not until mid September, but who are we kidding. This is it. Pier 13 in Hoboken now	1409587401	506472386196406272	f	nautimobile
RT @greenboxny: Happy #LaborDay from the #greenbox crew! @Valduccis @PizzaByCerte @LASTDRAGONPIZZA @skinnypines @Skinny_Pizza @nycpizzarun ...	1409588660	506477667680796672	f	valduccis
How are you spending your Labor Day? Come visit us at Times Square or Greeley Square for muchas nuchas! http://t.co/n8UTMcc6BG	1409588317	506476230045360128	f	nuchasnyc
big cloud sagg main http://t.co/G5oKXwf0XN	1409590977	506487387568873473	f	milktrucknyc
RT @niche: Thanks @occupy @taxmOuth @idn04 @BBrian205 @Valduccis for being top new followers in my community this week (via http://t.co/qxV...	1409591729	506490538779222016	f	valduccis
today the jawn is posting up in Willy B at #FGDAYOFF - kent ave and north 11th until 10! @FoolsGoldRecs #hiphop #foodtruck	1409593285	506497067792236544	f	philssteaks
Were hiring! Join the #MuchasNuchas team! http://t.co/YqYtwarl8E	1409600110	506525690913890304	f	nuchasnyc
RT @crunchy_radish: because if you are going to have falafel...it should be from @taimmobile . always thankful for... http://t.co/PUcj2AelfA	1409606057	506550636570476544	f	taimmobile
RT @vendyawards: @AdamRichman will be judging the @VendyAwards! Be one too by entering the #VendyCitizenJudge contest. Visit http://t.co/TB...	1409607701	506557530060128256	f	veganlunchtruck
Happy #LaborDay!	1409610906	506570973207097345	f	nuchasnyc
Sausage and Pepper Pizza  delivery @Cater2me @greenboxny http://t.co/NYR1whN7UB	1409612497	506577645505896448	f	valduccis
@TheStraunt sometimes we do hop.	1409615541	506590414359756800	f	waffletruck
@CeceLazo which one? There are so many.	1409615516	506590310085185537	f	waffletruck
@NinaMarietta must must!	1409615501	506590246914781184	f	waffletruck
@RvkPG our pleasure!	1409615491	506590205131104257	f	waffletruck
@mr_moe_cast once a week usually, during the week.	1409615476	506590140027109376	f	waffletruck
@kuriboh819 sure!	1409615411	506589867443494912	f	waffletruck
BREAKFAST IS ON!  Starting Tuesday, 9/2/14  9am-11am\n\nBLUEBERRY MUFFINS, Walnuts and Vanilla\nAPPLE-CINNAMON... http://t.co/EnR6KWyfcC	1409614677	506586792456650752	f	thegreenradish1
Last call for Grilled Cheese @usopen #Court17! Thanks for a great week guys!!	1409616534	506594581040103424	f	morristruck
Mamu Thai Noodle in the suburbs today! Book us for your party! We love to party! #turndownforwok http://t.co/k2Ctx0aw1m	1409616411	506594062825443328	f	mamuthainoodle
SNAIL FANS:\n2 days left to share a pic from your fave foodtruck with #WFMVendy for a chance to win a pair of VIP tix to @vendyawards	1409618769	506603954017685504	f	veganlunchtruck
@badteacherofgov until nov.	1409624267	506627013437054976	f	milktrucknyc
Valduccis is Delivering over 50 pies thanks @Cater2me http://t.co/46x72db9qk	1409656242	506761126550724608	f	valduccis
Best Catering @greenboxny @gofooda @BrooklynPopUp @Cater2me @PastaZalla http://t.co/HLRRq3OGCv	1409656126	506760642267983872	f	valduccis
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIyYdw	1409657702	506767251395981312	f	sweeterynyc
Grill On Wheels downtown in the financial district! Hanover &amp; Water St- open @11:00 to 3:00	1409659130	506773240917008384	f	grillonwheelsny
Parked on Water St. between Gouverneur &amp; Old Slip 9:00-3:00 (just a block south of wall st)\n\nLemongrass seitan... http://t.co/smhoMNyY2U	1409659822	506776140938104832	f	veganlunchtruck
Parked on Water btwn Gouverneur &amp; Old Slip 9:00-3:00 \nLemongrass seitan beet burgers w/ sambal olek, kefir lime cabbage slaw, red curry mayo	1409660261	506777981814325248	f	veganlunchtruck
Down at @TheSeaport on John &amp; Front for lunch! Or catch us tonight at @BklynBrdgPark for the #amex @usopen viewing party at #pier1 @DumboNYC	1409661672	506783903559217152	f	domotaco
Hope y'all had a happy #laborday! Back to work on 45th/6th with Lil Shu or 52nd/6th with the truck!	1409661495	506783159594532864	f	mooshugrill
Tea eggs have been known to cure #post3daywknd depression. Come check it out on 53rd &amp; park!	1409662194	506786089907257344	f	biandangnyc
We are taking a break today after this long weekend. Thank you for the Labor day love. http://t.co/ERJoFksnQH	1409662366	506786814620098561	f	mrniceguytruck
We are hiring! Chef with a clean driver's license http://t.co/Vr3HzRxoiF	1409662112	506785746418929665	f	sweetchilinyc
#summer #day #great  for #korma #entree @51 #street &amp; #Park #avenue #enjoy #delicious  #mango #lassie	1409662812	506788682997587968	f	mausamnyc
Hello #LebaneseLunchers! We'll be in @DumboNYC today on Jay &amp; Water St. from 11-3pm. Get that #shawarma you've been craving!	1409662349	506786740976508928	f	toumnyc
Celebrate Tuesday with an empanada in hand. The truck is located on Maurice Ave between 58th St &amp; Maspeth Ave... http://t.co/wOnbRcTIRo	1409662754	506788438608478208	f	nuchasnyc
RT @dumbolot: To help ease the transition back to the real world we got @ToumNYC @KimchiTruck and @carlssteaks in the lot!	1409663317	506790801033408512	f	carlssteaks
Closed today...back out for lunch tomorrow!!!	1409663588	506791937979219968	f	bigdsgrub
53rd and park!!	1409663789	506792782481326080	f	vspot_truck
RT @nycfoodtruck: Job-hunting? Why not work for a former @BravoTopChef finalist on a #NYC #foodtruck? @SweetChiliNYC is #hiring! Info: http...	1409664505	506795783405199360	f	sweetchilinyc
Off the road today. Stay cool &amp; classy.	1409663890	506793205879537665	f	thesteelcart
#BigRed is booked for a an event today and will not be on the streets of NYC. To book #BigRed for your event, email cater@redhooklobster.com	1409664804	506797036944240640	f	lobstertruckny
Back from the long weekend, stocked and ready to serve. What's better than a pork bun? Two pork buns ! \n50th st between 6 / 7 ave #midtown	1409665433	506799677401202689	f	funbunsnyc
Grill On Wheels downtown in the financial district! Hanover &amp; Water St- open @11:00 to 3:00	1409665364	506799386152943616	f	grillonwheelsny
Lunch 2day @ 7 Hanover sq b/t water st &amp; pearl st. Burger of the week THE SPICY JAZZ. Preorder 9172929226 #fidi	1409666214	506802953043591168	f	fritesnmeats
Good morning. Hope you all had a wonderful Labor Day Weekend. Boy it's a hottie today. Stay cool with an ice cold... http://t.co/PG0XNHhIyY	1409667874	506809915143241728	f	mtblls
The Schnitzcart will be on Greenwich and park place from 11:30-2:30pm. Stop by for delicious schnitz!	1409667727	506809297796628482	f	schnitznthings
Morning guys! Hope you had a good weekend. Truck will be on 47th street b/w Park and lex 11:30-2:30. Preorder 347-772-7341. C ya:)	1409667636	506808915250905088	f	schnitznthings
Bessie's at @TheSeaport, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always @houstonhallnyc	1409667820	506809687812349952	f	milktrucknyc
Buenos dias! @MexicoBlvd  #Midtown Happy September, everyone! 46th St.	1409667458	506808168274726913	f	mexicoblvd
Hope everyone had a great Labor Day! We're at 47th &amp; Park in Midtown and Varick &amp; Vandam in Soho/South Village today!	1409667920	506810107309862912	f	korillabbq
Goodmorning NYC! Today Mon 9/2 11am - 3pm 26th st. Bet FDR DRIVE &amp; 1ST AVE NYC\nhttp://t.co/MPHGwjSFxE http://t.co/WTIEPuPToT	1409669039	506814799955910656	f	latinkitchennyc
Goesting @ Bway &amp; 66th till 9pm http://t.co/vn5F97jXKi	1409668701	506813383715590144	f	waffletruck
Kotmadam @ South Street Seaport till 10pm\nBierbeek @ Great Lawn in Central Park till 8pm\nPagadder @ Brooklyn Bridge till 10pm	1409668658	506813204908212224	f	waffletruck
Momma Truck @ Trinity, 91st &amp; Columbus till 4:30pm\nKastaar @ The New School, 14th &amp; 5th till 10pm\n\nCARTS\nVedette @ 60th &amp; 5th till 8pm	1409668633	506813097743765504	f	waffletruck
Back to work!! Tasty Tuesday! #dinges\n\nLe Cafe @ 15 Ave B open till MIDNIGHT\nDe Wafel Cabana @ 35th &amp; Broadway open till 10pm	1409668616	506813028848123904	f	waffletruck
Hope everyone had a great Labor Day Weekend! Well be OFF THE ROAD today for maintenance before our Private Event at CW Post from 4p-7p!	1409669888	506818362299924480	f	andysitalianice
Sorry @dumbolot off the road technical difficulties see you next week #wemissdumbo	1409669546	506816926103134208	f	carlssteaks
What's your favorite drink to cool down? Tell us for one free dinges!! #freedinges #HOToutside #drinks http://t.co/bCVhuY8l6K	1409669985	506818768014946304	f	waffletruck
RT @dumbolot: To help ease the transition back to the real world we got @ToumNYC @KimchiTruck and @carlssteaks in the lot!	1409669914	506818473146978305	f	toumnyc
We're takin a few days of R&amp;R after a long week of #Cheese &amp; #Tennis @usopen, but we'll be back @DowntownBklyn #Metrotech on Thursday!!	1409669214	506815534907006976	f	morristruck
September playlist featuring @stlucia @Gramatik @NICKIMINAJ and @Outkast http://t.co/NA2hAb0PS4 via @spotify	1409670052	506819049347883008	f	papayakingtruck
Welcome back! Hope u had a great summer. Bikini season is over - time 4 #cheesesteaks -Front n Fulton 12-8pm	1409670151	506819466853122048	f	philssteaks
Spread the word people...Happy Hour at Shorty's just got real.  \n\nEVERY BEER IN THE HOUSE $4\nKETEL, TITO'S, STOLI... http://t.co/MOxs0TFyVI	1409670340	506820256497545217	f	shortysnyc
The best thing about this awful heat? Smoothie season is extended! Grab yours on 20th/5th today http://t.co/Jl88VjNcxv	1409670109	506819290952396801	f	taimmobile
RT @DUMBOFoodTrucks: Its humid out there but @toumnyc and @kimchitruck are sweating it out in the @DUMBOLot today.	1409670030	506818956850888704	f	toumnyc
Best Caters @Cater2me @greenboxny @Cheap_eats http://t.co/WMPZ4a5mbk	1409670417	506820582064029697	f	valduccis
Open for lunch.. 48th st between 6 and 7 ave\n\nCall in orders to: 917-756-4145	1409670209	506819709485211648	f	disosnyc
Welcome back to #reality! 53rd and park for your #biandang fix!	1409670943	506822785973620737	f	biandangnyc
Serving #tacos #burritos and #ricebowls @theseaport till 3pm!	1409671065	506823300723785728	f	domotaco
Shout out to all the other food truck workers with no AC today. Respect. 17th and 5th	1409671207	506823893437657088	f	nautimobile
Thanks god, the long weekend is done. So we can serve our #MidtownLunch @46th st &amp; 5~6th ave.  Until 3pm. Come out &amp; get your Asian Tapas.	1409671278	506824192181174273	f	shanghaisogo
G1 - Hudson /king\nG2- 47/park\n#ComeToTheCheeseYo	1409671184	506823799116144640	f	gcnyc1
On 52nd and 6th!	1409672205	506828082314231809	f	thepocketful
SoHos Varick and Vandam open now. Bet they didn't serve Korean BBQ at your Labor Day, unless your Korean, but if they did get some anyway	1409672180	506827976030584832	f	korillabbq
We are on 36st and Broadway!	1409672822	506830669688078336	f	chefsamirtruck
You can eat your feelings about having to be back at work or celebrate a short week - either way, you win http://t.co/EACg02aBqq	1409673942	506835365303709696	f	mexicue
Good Day for a #Veganlunch...51 btwn park&amp;RadIson...11to2pm http://t.co/PEbvBuhc3c	1409673667	506834212046258176	f	thegreenradish1
47th/Park #NYC #Midtown  #Cheesesteak #RoastPork #BroccoliRabe #ItalianFries	1409674653	506838349374423040	f	shortysnyc
LUNCH!! Time for a WAFEL sandwich!! #Brusselsstyle #chickengravy http://t.co/XSA0M2AjOv	1409675200	506840641419345920	f	waffletruck
Now serving park and 47!	1409674689	506838501321895936	f	korillabbq
RT @SkeeterNYC: Just announced! Meet NYC @VendyAwards Cup Finalist 2014: Nuchas Empanadas | http://t.co/6Rz8tJCEVW #news @NuchasNYC http://...	1409675313	506841116638195712	f	nuchasnyc
Great piece! - NYC @VendyAwards Cup Finalist 2014: #Nuchas Empanadas http://t.co/Tz8DCreRvj via @SkeeterNYC	1409674820	506839046858215424	f	nuchasnyc
back on the road tomorrow - be prepared for some #traditional #delicious fare!	1409675469	506841771671027712	f	polishcuisine
Happy birthday to Keanu Reeves, earth's most precious treasure. That is all.	1409676156	506844652281290752	f	nautimobile
@MurphGuide https://t.co/Km5gWN7x9j	1409676056	506844232553082882	f	shortysnyc
RT @sianelerievans: @MilkTruckNYC qualityyy madagascan vanilla bean milkshake oh my god	1409675669	506842608212410368	f	milktrucknyc
@sianelerievans :) 	1409675666	506842596589993984	f	milktrucknyc
Miss us? We're at @dumbolot today. Come show your sunkissed faces!	1409676009	506844035177533440	f	kimchitruck
RT @Beer4Beasts: Looking fwd to @CalexicoNYC @dubpies @meltbakery @morristruck @pizzamotobklyn @rickspicksnyc on Sat, Sep 13! http://t.co/W...	1409677121	506848699692359680	f	dubpies
58th and Broadway serving The Original Franks and Tropical Drinks!	1409677974	506852278939443201	f	papayakingtruck
11 days until the @vendyawards on Sept 13th @Gov_Island - did you know it's the 10 yr anniversary?! Join us! http://t.co/84aBwXERGU	1409677289	506849402489942016	f	snowdaytruck
.@cherrybombemag @DriveChangeNYC @vendyawards Thank you! We cannot wait!! We're honored to be nom-nominated	1409677218	506849108372774912	f	snowdaytruck
RT @nycfoodtruck: Love #foodtrucks and #NYC? Looking for a job? You need to talk to @SweetChiliNYC! http://t.co/n8HRWTgy0M #foodjobs	1409677762	506851388660662272	f	sweetchilinyc
RT @mellosports2: @vendyawards @wholefoodsnyc hope I win VIP tix and #StreetFood @shanghaisogo win Rookie of the Year #WFMVendy thanks http...	1409677327	506849565312843776	f	shanghaisogo
RT @SnowdayTruck: 11 days until the @vendyawards on Sept 13th @Gov_Island - did you know it's the 10 yr anniversary?! Join us! http://t.co/...	1409677309	506849487512666112	f	shanghaisogo
RT @vendyawards: Congratulations @NuchasNYC for being a 2014 VENDY CUP FINALIST. Check out the Nuchas story with @foodcurated \nhttp://t.co/...	1409678028	506852505318592514	f	nuchasnyc
RT @DriveChangeNYC: Interesting info graphic about street-food laws by city - check it out @VendorPower @nycfoodtruck http://t.co/AvyrcGSGsE	1409678476	506854382122852352	f	dubpies
It is 1:20pm now. Still now too late to get your lunch done right with your loving food truck @46th st &amp; 5~6th ave until 3pm. See ya later!!	1409678403	506854075049459712	f	shanghaisogo
RT @TakumiTacoNY: Special roll at #starrettlehigh today #Takumi #bestsushinyc @ Starrett-Lehigh http://t.co/Ba47d3npUx	1409679489	506858632638902272	f	eddiespizzany
Tomato and Mozzarella #pesto #olive oil http://t.co/KjhGoK1VA1	1409679590	506859054913032192	f	valduccis
HAPPY HOUR AT 4PM. ALL BEERS $4.  NOT "SELECT" BEERS.  ALL BEERS. @ ALL 4 SHORTY'S.	1409680307	506862064338763776	f	shortysnyc
RT @MurphGuide: New happy hour specials announced for four @ShortysNYC locations: $4 beers, $5 cocktails  https://t.co/dweNTvNG6I	1409680140	506861363516682240	f	shortysnyc
RT @benevenga8: Picked this up at Cinnamon Snail this morning. It's a pistachio and cardamom glaze donut. Thanks @VeganLunchTruck http://t....	1409680521	506862958753107968	f	veganlunchtruck
RT @SliceOutHunger: @Valduccis We'd love to have you at out Oct 8 #pizzaparty to benefit @FoodBank4NYC -  Let us know if you're interested!	1409680483	506862801722560512	f	valduccis
:)))))RT @alantwentyseven: Even bigger and more magnificent than I remember.. getting emotional about @schnitznthings http://t.co/1IKhl5s4mR	1409681615	506867550622613504	f	schnitznthings
We're one of the top 10 food trucks in NYC by "Culture Trip" #Culture #dinges #proud\nhttp://t.co/ZU2cdasc73	1409682144	506869766041378817	f	waffletruck
RT @vendyawards: This lady is looking for a date to the Vendys. Someone help a girl out! http://t.co/3Eq8eiqUB4	1409683114	506873834667249664	f	veganlunchtruck
RT @jbakernyc: Congrats @dubpies as finalist for Rookie of the Year at the @vendyawards! http://t.co/xRrxxSfte3	1409683567	506875737958522880	f	dubpies
PLEASE RT:\n\nWant to attend the @vendyawards (9/13) for FREE as a JUDGE?\n\nPost a pic of our food &amp; tag w/ #VendyCitizenJudge to enter to win	1409686515	506888100384346112	f	veganlunchtruck
Want to attend the 2014 Vendy Awards (Saturday 9/13) for FREE as a JUDGE!?!\n\nYou could help your favey food truck... http://t.co/5wd3Pt1CmZ	1409686236	506886930382876672	f	veganlunchtruck
RT @vendyawards: VIDEO: Get behind the scenes with some rice-rice-baby on @bigdsgrub's khao cart \nhttp://t.co/Qtd44Db6ym @TurnstileTours #V...	1409686509	506888074958495744	f	bigdsgrub
@SkeeterNYC @vendyawards It was absolutely amazing to work with you.  See you at the Vendy's.	1409687025	506890239382941696	f	nuchasnyc
@ChanelBarbieNY we couldn't make it to dumbo today so sorry!!	1409687875	506893805384380417	f	sweetchilinyc
when you realize it's definitely time for them to go back to school. #thatsourdinnertableboys http://t.co/CyWn5sB0dA	1409687348	506891594109562880	f	milktrucknyc
Stay tuned for opening time!	1409687921	506893998364315649	f	korillabbq
Columbia!!! Korilla is back! Come grab your dinner!	1409687854	506893718310617089	f	korillabbq
Didn't catch us for lunch? Not to worry--we're back @Columbia for dinner Tues-Thurs this week! Find us at 116th &amp; Amsterdam, 5-8pm!	1409687127	506890666610524162	f	korillabbq
We will be open for ya by 5!!!	1409688178	506895076514361344	f	korillabbq
#YonkersRiverfest is this Saturday and we can't wait to be there with the truck! @CityofYonkers http://t.co/trzC1ZJuO0	1409689396	506900183389855744	f	papayakingtruck
New York City: We have queso dip http://t.co/j0hVa9NB2Z	1409691285	506908106220392448	f	mexicue
Awesome #vegan uttapam from fellow @vendyawards nominee NYDOSAS.  Love his food &amp; wish him lots of luck at the Vendys http://t.co/Eh1cOBq9B0	1409691154	506907559706771457	f	veganlunchtruck
Welcome back @Columbia Univ. students! Your fave food truck is serving dinner tonight @ 116th &amp; Amsterdam, 5-8p! See you there.	1409691315	506908233316179969	f	korillabbq
Is this # A. The number of people incarcerated in NYS or B. The $ of incarceration for 1 adult/yr in NY jail? http://t.co/ESKz0c8Ugu	1409696069	506928172894785536	f	snowdaytruck
Together we move skyscrapers. Speak up, act out &amp; help us reform the criminal justice system- #ittakesacity http://t.co/SKtzunFg3d	1409695909	506927500359106560	f	snowdaytruck
@lisacase sorry we couldn't handle it with the new restaurant :( stop by when you can! It's @ChelaGarnacha in #Astoria !!	1409697502	506934182451638272	f	mexicoblvd
http://t.co/fmai5DfHjV	1409698089	506936646974308352	f	waffletruck
Goesting @ Bway &amp; 66th till 9pm\n\nEnjoy the night with a lot of #dinges!!	1409698052	506936490132504576	f	waffletruck
Momma Truck @ NYU, West 4th and Mercer till 10pm\nKastaar @ The New School, 14th &amp; 5th till 10pm\n\nVedette @ 60th &amp; 5th till 8pm	1409698006	506936298373152769	f	waffletruck
Wafels into the night.....\n\nLe Cafe @ 15 Ave B open till MIDNIGHT\nDe Wafel Cabana @ 35th &amp; Broadway open till 10pm	1409697999	506936269239484416	f	waffletruck
@therhythmcorner huzzah!	1409700599	506947175633657856	f	waffletruck
@YaketyYakDiary we love that lunch!	1409700565	506947031080763392	f	waffletruck
@_sailorcoco_ certainly not a bad idea at all.	1409700536	506946910708846592	f	waffletruck
@irishgirl75 right?!	1409700520	506946840755847168	f	waffletruck
@SFM_History very sorry. We shall return.	1409700504	506946774867914752	f	waffletruck
@mmmikaelasantos that is how you know, yes.	1409700484	506946689425735680	f	waffletruck
@allieappino we take credit!!	1409700453	506946562015371264	f	waffletruck
@shirklesxp hooray cafe!	1409700439	506946501168226304	f	waffletruck
RT @BrooklynPopUp: @Valduccis @greenboxny @gofooda @Cater2me @PastaZalla we love Valduccis pizza! 	1409702362	506954568752967680	f	valduccis
Why in the heck isn't @ActionBronson one of this years @vendyawards judges?	1409710066	506986879477354497	f	veganlunchtruck
RT @seriouseats: 60 vegan recipes good enough to make you forget about meat and cheese altogether http://t.co/VGop2wl4i6 http://t.co/kggeEu...	1409708246	506979247567933440	f	veganlunchtruck
RT @wholefoodsnyc: @VendyAwards is 9/13! Share a foodie photo w/us from ur fave #StreetFood vendor &amp; be entered to win a pair of VIP tix #W...	1409705733	506968708192165888	f	veganlunchtruck
RT @vegucated: @LaurenBlockley so many here!! Lulas is number 1 recommendation. @VeganLunchTruck vies for 2nd w @candlecafe @sacredchow @be...	1409703512	506959391489552384	f	veganlunchtruck
One of the Top 10 Coolest Food Trucks Around the World? We'll take it. Thanks @twispertravel for including us! http://t.co/LlLRn8dO8z	1409705292	506966857832992768	f	korillabbq
RT @SkeeterNYC: "You gotta start with an ambitious dream." http://t.co/wkQCBmI8nu A new story about passion in the palm of your hand.	1409704746	506964566778318848	f	nuchasnyc
RT @RedScareBot: Crazy Ivan!! RT @usafoodtruck: @HuffPostTaste only ridiculous if you're a damn commie.  Are you kidding me ,\nRidiculous?  ...	1409716727	507014819745374208	f	usafoodtruck
@HuffPostTaste only ridiculous if you're a damn commie.  Are you kidding me ,\nRidiculous?   #thisisglorious	1409716621	507014375748960257	f	usafoodtruck
RT @HuffPostTaste: This is the most ridiculous and/or the most American grill ever http://t.co/3Oh0HzcS8K http://t.co/CgcH1dsc2C	1409716556	507014100447420416	f	usafoodtruck
RT @BCDRestaurants: Everyone is @mexicue! Where are you?! Come join the fun! #BCDStrategic @ Mexicue http://t.co/wKVRCDUjO9	1408721349	502839899851358209	f	mexicue
@RedScareBot @HuffPostTaste even after death senator McCarthy can smell a damn commie from a mile away. #marxworepanties	1409716982	507015888596656128	f	usafoodtruck
Photo of #toastmonster #foodcart with #1977filter #rawr diesilentkiller @cheferamirez #mom http://t.co/MhNKxUzrW6	1409725098	507049930494443520	f	toastmonsternyc
Back at 52nd and 6th!!! :)	1409739596	507110738453094401	f	vspot_truck
#VeganLunch 38th&amp;Bway 11-2pm Thai Celery Salad.Roasted Carrot-Ginger Soup.NoChicSalad Toasted Ciabatta.Raspberry #Donarts @GarmentDstrctNY	1409739940	507112180039561216	f	thegreenradish1
#VeganBreakfast, 38&amp;Bway, 9am-11am, Cinnamon-Apple Pancakes, Blueberry Muffins, @GarmentDstrctNY @bittman @EatStTweet @justbobbibrown @biz	1409739355	507109728762478592	f	thegreenradish1
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/MtXVXIyYdw	1409744103	507129641165811712	f	sweeterynyc
Parked on 47th off Park Ave today! schnitzel crazy chickenshawarma yummy	1409745267	507134523914846208	f	grillonwheelsny
Mornin #midtown ! Today you can catch us on 55th st at 6th ave. From 11:30-2:30 #nyfoodtrucks #midtownlunch	1409744733	507132284190072832	f	kimchitruck
Seriously? National "Grits For Breakfast" Day?! Time to shine baby! Front &amp; Jay with nice sandwiches, and well, you know. @DUMBOFoodTrucks	1409747967	507145850695729152	f	thesteelcart
#midtown today we are 46th &amp; 6th! Come get your #hibachiheavennyc	1409749997	507154362091966464	f	hibachiheaven
RT @steveorefreshed: Get ur @hibachiheaven on 46th &amp; 6th. . seared tuna is on the menu... :-p	1409749916	507154022575640576	f	hibachiheaven
We are BACK on 47th b/w Park &amp; Lex today #GetReady #traditional #awesome #lunchplans	1409750056	507154609971163136	f	polishcuisine
Parked on broadway &amp; 55th til 3. \n\nPost a pic of our food &amp; tag w/ #VendyCitizenJudge to enter to win to be a JUDGE at the '14 @vendyawards	1409749635	507152844039127040	f	veganlunchtruck
#delicious #authentic #Indian #lunch @52 #Street &amp; 6 #avenue	1409750008	507154409503993856	f	mausamnyc
Join us today at 52nd Street btwn 6th and 7th Street for lunch!	1409749602	507152707963322369	f	bigdsgrub
You can also catch us on 33 &amp; Park! #hibachiheavennyc	1409750701	507157316010254336	f	hibachiheaven
RT @mellosports2: @vendyawards @wholefoodsnyc hope #StreetFood @NuchasNYC wins the Vendy Cup and I win some VIP tix :-) #WFMVendy thx! http...	1409750713	507157367532695554	f	nuchasnyc
Wednesday location: water st and old slip/ Hanover \n\nCall in orders to: 917-756-4145	1409750140	507154961965527041	f	disosnyc
@emmaryoung Then send us your dreamy resume and lets make this dream a reality!	1409751580	507161004783202304	f	lobstertruckny
@CathyCa35660723 Please email cater@redhooklobster.com	1409751540	507160836239290368	f	lobstertruckny
You want to work here, we want you to work here, lets make it happen! Email work@redhooklobster.com http://t.co/3wcHlfSbpz	1409751326	507159937202782208	f	lobstertruckny
RT @greenboxny: That makes two of us! #delicious @BrooklynPopUp @Valduccis @gofooda @Cater2me @PastaZalla	1409751114	507159047242805249	f	valduccis
@iac @valduccis #bestHeros #saladBar @greenboxny @gofooda http://t.co/kUb8uIrMxP	1409751097	507158978850480128	f	valduccis
Lunch 2day @ Hudson &amp; king. Burger of the week THE SPICY JAZZ. Preorder 917-2929226 #soho	1409752633	507165421381091328	f	fritesnmeats
Sorry @DUMBOlot the truck is feeling a little under the weather and will be off the streets for a few day. stay tuned for more updates!	1409752383	507164372960284672	f	domotaco
#BigRed is looking to land on 53rd &amp; Park Avenue. Get ready midtown!	1409752505	507164881632886785	f	lobstertruckny
Parked on 47th off Park Ave today! schnitzel crazy chickenshawarma yummy	1409752583	507165209140932608	f	grillonwheelsny
The Schnitzcart will be back on 27th &amp; Park ave today from 11:30-2:30pm. We hope to see you there:)	1409752743	507165882217668608	f	schnitznthings
Morning guys! The Schnitztruck will be on 47th street b/w park and lex once again. 11:30-2:30pm. Stop by or preorder 347-772-7341	1409752626	507165389722497024	f	schnitznthings
We won't be at the seaport today but we will be back tomorrow!  Have a great day everyone!	1409752183	507163531465461760	f	sweetchilinyc
@TruthTravelista we won't be out today. Back @TheSeaport tomorrow! !	1409752146	507163375517069312	f	sweetchilinyc
Morning Ice Lovers - Were OPEN in Bryant Park today(40th &amp; 6th Ave) until 4:45p. After, find us at our usual spot in #UnionSquare until 9p!	1409753341	507168390835081216	f	andysitalianice
Catch the #MSG truck down at @TheSeaport on Front &amp; John st or Lil Shu on 50th &amp; 6th!	1409753313	507168271708467200	f	mooshugrill
Happy hump day! Here's a picture of b to remind you to stop and smell the flowers! http://t.co/DEXmt1hTtN	1409753239	507167959899701248	f	mooshugrill
RT @MadSqParkNYC: Refreshments for sale at #MadSq200TASK include @Redhooklobster @souvlakitruck @DelsNYC @LaNewyorkina http://t.co/Yiwmkqw6...	1409753454	507168862279053312	f	delsnyc
RT @nycfoodtruck: #Thisjustin! @shortysnyc has been added to the @Prospect_Park #FoodTruck Rally roster going down Sunday 9/7, 11a-5pm! #gr...	1409753483	507168985734193153	f	shortysnyc
Bessie's at 53rd &amp; Mad, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always @houstonhallnyc	1409753314	507168274564788224	f	milktrucknyc
Sometimes #taiwanesefriedchicken and #SaltnPepperChicken don't get along, but they always make up. #internetfriendday on 53rd &amp; Park!	1409753871	507170613191278592	f	biandangnyc
RT @dumbolot: Catch @KorillaBBQ @shortysnyc and @USAFoodTruck in the lot today!	1409753765	507170167701659649	f	usafoodtruck
RT @dumbolot: Sorry to hear @DomoTaco won't be joining us today, but we got @USAFoodTruck serving up USAs finest #chickentenders instead!	1409753759	507170143039127552	f	usafoodtruck
Welcome back Midtown East! Grab your Carl's famous Cheesesteak 47th st &amp; Park Av till 3 @MLB @UBS @FoxNews @SiriusXMNFL @SIRIUSXM GOT WHIZ?	1409754560	507173502450155520	f	carlssteaks
Step up your Taim game with @EinatAdmony's recipe for Roasted Eggplant w tahini and herb salad  http://t.co/bRq4oHMFfO	1409754515	507173314163666944	f	taimmobile
Wednesday lunch done right with Asian Tapas Truck @47th st, between Lexington &amp; park ave until 3pm.	1409753779	507170225276850176	f	shanghaisogo
FiDi and DUMBO--u kno the drill! Front &amp; Old Slip in FiDi and Water &amp; Jay St. in DUMBO--11:30-3ish. See you out there! #nyclunch #foodtruck	1409753733	507170034041753600	f	korillabbq
RT @elizabethtjones: Counting the minutes. Congrats on the nom! RT @SnowdayTruck: 11 days until the @vendyawards on Sept 13th @Gov_Island h...	1409754865	507174780400066560	f	snowdaytruck
@Saj_Designs Manana! sorry. Tuesdays and Thursdays are our usual Midtown days.	1409755324	507176704910319617	f	thesteelcart
Good morning #NY, it's empanada o'clock! We're located on Varick St between Charlton &amp; King St today until 2:15PM http://t.co/3EH09pAlce	1409755131	507175899368681473	f	nuchasnyc
Goodmorning NYC!  Today Wed 9/3 location 55 Water st. ( Old Slip Wallstreet ) NYC \nhttp://t.co/MPHGwjSFxE\nGreat Day!! http://t.co/jL116zypU5	1409755960	507179373758533632	f	latinkitchennyc
Location Update: Out truck on 33 &amp; park broke down. Sorry for any inconvenience!	1409756213	507180435424940032	f	hibachiheaven
It is confirmed! #BigRed will be serving  delicious lobster rolls on 53rd &amp; Park! #FallForLobster #EndlessSummer	1409756117	507180032444620800	f	lobstertruckny
What a beautiful Wednesday! Come visit us at 46th between 5th and 6th. #eddiespizza #foodtrucknyc http://t.co/MvuUKs0K4j	1409755752	507178501280391168	f	eddiespizzany
What a beautiful Wednesday! Come visit us at 46th between 5th and 6th. #eddiespizza #foodtrucknyc http://t.co/fqSGmpsmnd	1409755750	507178492895956992	f	eddiespizzany
Goesting @ Bway &amp; 66th till 9pm\n\n#dinges	1409756280	507180717248618496	f	waffletruck
Kotmadam @ South Street Seaport till 10pm\nBierbeek @ Great Lawn in Central Park till 8pm\nPagadder @ Brooklyn Bridge till 10pm	1409756276	507180699980685313	f	waffletruck
Momma Truck @ Wall Street till 4:30pm\nKastaar @ Queens College till 10pm\n\nVedette @ 60th &amp; 5th till 8pm	1409756267	507180661497933824	f	waffletruck
Wafelicious Wednesday!!\n\nLe Cafe @ 15 Ave B open till MIDNIGHT\nDe Wafel Cabana @ 35th &amp; Broadway open till 10pm	1409756255	507180611103379456	f	waffletruck
@MexicoBlvd #midtown we are at 51 &amp; Park today! Come get your tacos, tortas, flautas...muy rico!	1409755834	507178848078012417	f	mexicoblvd
@Saj_Designs Yay!	1409756155	507180193333903360	f	thesteelcart
Open for lunch.. Come find us on water st and old slip/ Hanover sq\n\nCall in orders for pick up: 917-756-4145	1409756354	507181027165753345	f	disosnyc
Good  day to you all. Geez what a muggy few days. Whew. The Mtbll  is here for ya with some ice cold beverages... http://t.co/Pxs3FtpFQP	1409757158	507184399352623104	f	mtblls
Lunch: 58th and Broadway\nDinner: 65th and Broadyway	1409757119	507184236529721344	f	papayakingtruck
It's #pierogitime on 47th b/w Park &amp; Lex today #BeatTheLine #kielbasa	1409756423	507181315121483776	f	polishcuisine
@NomInNY nothing we've ever seen!	1409756997	507183724765908992	f	mexicue
One of the best perks of a solid restaurant over a food truck? All AC everything. \n\nIt's f*%kin hot out there - come chill at 1440 Broadway	1409756685	507182416143081472	f	mexicue
Pork , beef, chicken, duck.  \nYour lunch your choice.  We have them all on 50th st between 6 / 7 ave #midtown	1409756433	507181357102284800	f	funbunsnyc
What's your favorite pet? Tell us for one free dinges! #freedinges #petslovewafelstoo http://t.co/R2MdjOkoA0	1409756909	507183353754554369	f	waffletruck
Hitting the snooze button for one more day- be back tomorrow @DowntownBklyn #MetroTech for more cheese!	1409756473	507181525126103040	f	morristruck
RT @EatThisNY: VIDEOS: Learn about three of this year's #VendyAwards nominees @BigDsgrub @LlamaPartyNYC @TheAlcreamist http://t.co/EN290d4Y...	1409756862	507183158513893376	f	bigdsgrub
@MitchieGadgets: @bigdsgrub no Khao cart today? I'm going thru withdrawal! Khao Cart is in for repairs..back out on Monday. 	1409756466	507181498257387520	f	bigdsgrub
Lunch: 58th and Broadway\nDinner: 65th and Broadway\n\nAll Meals: St Marks Pl and 86th St http://t.co/AmctDSCpMg	1409757349	507185201928499202	f	papayakingtruck
Up and running @DumboLot Jay and Water #Dumbo #Brooklyn #FoodTruck  #Cheesesteak #ChickenCheesesteak #RoastPork #BroccoliRabe #Salads #Fries	1409758024	507188029732036608	f	shortysnyc
It's a perfect day for food trucks! Taim is on 20th/5th with your favorite falafel, hummus, smoothies, salads and more	1409757716	507186741435170816	f	taimmobile
@HockeyStandings we'd say that's a possibility.	1409758202	507188780156321793	f	waffletruck
@VanGoghAwayy @Dani_Wag @bwags1121 don't you...forget about me...don't don't don't don't!	1409758179	507188679937634305	f	waffletruck
@therhythmcorner exactly	1409758140	507188519253839872	f	waffletruck
On 49th between 6th and 7th	1409758081	507188272314204161	f	thepocketful
G1 - 37th / Broadway\nG2- 26 11/12 @starrettlehigh\n#ComeToTheCheeseYo\nStill rockin the Ruben Melts due to high demand	1409757953	507187735158079488	f	gcnyc1
Gmorning DUMBO! Water &amp; Jay st ready for ya @11:30	1409757591	507186214391537664	f	korillabbq
What up in Brooklyn?!  We're at DUMBO lot at Jay and Water St.  We'll be here till 3.  Best chicken tenders in the city.	1409758767	507191147547348992	f	usafoodtruck
Whiz Wednesday at the Seaport! Front and Fulton 12-10 pm	1409758274	507189079772258304	f	philssteaks
Serving something special on 47th b/w Park &amp; Lex #ComeAndGetIt #Lunchtime	1409758568	507190314134949888	f	polishcuisine
46th and Park now. Have a super nice day.	1409758926	507191815435743233	f	nautimobile
@sallllayyy yay kitties!	1409758277	507189090702606337	f	waffletruck
@ijm7 and we're happy to provide such things.	1409758255	507189001212936194	f	waffletruck
@born2messs we'll think about it.	1409758235	507188918056677376	f	waffletruck
Happy #HumpDay! We've got all the #LebaneseEats your tummy desires on John &amp; Front St. near @TheSeaport from now till 8pm!	1409758727	507190982052696064	f	toumnyc
Hello NYC ! We r open at 47st  between park and lex ave try rice bowl and rice burger , bibimbop burrito come by and enjoy thank you !!	1409758960	507191958180491264	f	bobjotruck
FiDi's Old Slip &amp; Water open now	1409759063	507192389434621952	f	korillabbq
We are on 52st and park av!	1409758663	507190711373275136	f	chefsamirtruck
Dumbo join us for lunch at Front and Adams today @DUMBOFoodTrucks @jenchung #dumbofoodtrucks #loveparissandwich	1409759653	507194863964925953	f	parissandwich
It still feels like summer, so eat like it's still summer! #BigRed is serving lobster rolls at 53rd &amp; Park! #EndlessSummer #FallForLobster	1409759719	507195140092751872	f	lobstertruckny
Summer ain't ova, have some lobstah! #BigRed is at 53rd &amp; Park! #EndlessSummer #FallForLobster	1409759718	507195138587000832	f	lobstertruckny
Correction: Bessie's actually at 25th &amp; Park	1409759856	507195715261833216	f	milktrucknyc
!!! Our truck has been taking a few more days off for summer!! Still making deliveries! And our shop is open, too 7:30am-7pm!!!	1409759658	507194886001795074	f	thetreatstruck
Hello 17th&amp;5th! We are here for your noodle needs! Come by and say hi! #turndownforwok	1409759592	507194606497574912	f	mamuthainoodle
Hudson off Varick and charlton.   We here for all your dining services need be...	1409760568	507198702344486912	f	blend_express
Try our juicy chicken dumplings today!	1409760774	507199565624516609	f	bigdsgrub
52nd Street btwn 6th and 7th Street	1409760236	507197309206425601	f	bigdsgrub
Nuchas is hiring! We're looking for people who are passionate about food, energetic, and love working in a... http://t.co/gMvvQSUQke	1409762593	507207194291752960	f	nuchasnyc
Summah ain't ova and eithah is lunch! #BigRed is still at 53rd &amp; Park! #EndlessSummer #FallForLobster	1409763306	507210185308655618	f	lobstertruckny
Don't forget @EinatAdmony will have special Italian-inspired dishes at our San Gennaro festival booth from 9/11-9/21	1409763382	507210503794753536	f	taimmobile
@Sjt1515 here since 9am...left side on 52nd	1409763615	507211480400691200	f	bigdsgrub
Let Us  Pop Up in tour Office @gofooda @valduccis do the Best Freshest Food #Catering #GoFooda http://t.co/O79iyuE7OL	1409764399	507214769393500160	f	valduccis
@seanhanahue: @bigdsgrub in the wrong truck... I missed out today too. Same spot as usual.	1409764853	507216672848347136	f	bigdsgrub
@seanhanahue 	1409764639	507215777075052545	f	bigdsgrub
RT @nycfoodtruck: . @AndysItalianIce @NuchasNYC @TaimMobile &amp; @GCNYC1 are 4 of the 14 #foodtrucks you'll see at the @Prospect_Park Sun: htt...	1409765746	507220421641793536	f	taimmobile
RT @jbakernyc: Ahem #foodtrucks School has started &amp; students are rampant. Please come back uptown to CU. Ahem @milktrucknyc @mamuthainoodle	1409766269	507222611626328064	f	mamuthainoodle
@Thrillist @Mr_Mike_Clarke like there's any other way to do it	1409766778	507224749970567168	f	mexicue
Eating healthy in the middle of the week gives you free reign for the end of the week #ThingsWeTellOurselves http://t.co/n1GGSckeRQ	1409766734	507224563626041344	f	mexicue
Join our AWESOME WAFEL FAMILY!! #dingesfamily #hiring http://t.co/h5xK1u42rS	1409768087	507230239576317952	f	waffletruck
RT @nycfoodtruck: . @AndysItalianIce @NuchasNYC @TaimMobile &amp; @GCNYC1 are 4 of the 14 #foodtrucks you'll see at the @Prospect_Park Sun: htt...	1409768677	507232712298881024	f	andysitalianice
@margauxlee that can be arranged 	1409768781	507233151706742784	f	mexicue
Thanks for coming everyone! #enjoytheweather	1409770403	507239951596281857	f	polishcuisine
Done in DUMBO! Have a good one yall	1409770156	507238917423517696	f	korillabbq
TWO TRUCKS OUT SERVING 3 NEIGHBORHOODS TOMORROW!\n\nVarick/Vandam 9:00-3:00\n\n21st/5th 9:00-3:00\n\nGrove St PATH station JC 5:00-8:00	1409771701	507245395777703937	f	veganlunchtruck
@johndelsignore you my friend are a very funny #sciencman #mathface sorry to snub you guys.  Varick st gets us about as often as you though	1409772060	507246902484955136	f	veganlunchtruck
RT @JobsWithHarri: Ride around &amp; learn from a TOP CHEF SUPERSTAR with @SweetChiliNYC! DRIVER &amp; CHEF positions available: http://t.co/W7tYDD...	1409772584	507249099612381184	f	sweetchilinyc
RT @kikaeats: Congrats 2014 #Vendys Cup finalists: @VeganLunchTruck @DesiFoodTruck, @elraydeltaco, @NuchasNYC, #LechoneraLaPirana Great sho...	1409773068	507251129454194688	f	veganlunchtruck
the snail raps into the  SARS megaplex with um, donuts from Easter island, son.  oh no run- here comes a wilderness-moose!	1409773629	507253483096252416	f	veganlunchtruck
Welcome back! Catch us for dinner at CU 116th &amp; Amsterdam!	1409774150	507255670123798529	f	korillabbq
Wednesday #dinner 74th st at 3rd ave. #ues #eddiespizza http://t.co/LKbva4qYYL	1409775299	507260487688396800	f	eddiespizzany
Wednesday #dinner 74th st at 3rd ave. #ues #eddiespizza http://t.co/QocNkitM5d	1409775296	507260476401913856	f	eddiespizzany
RT @margauxlee I want to move into @Mexicue so i can eat there for every single meal	1409777804	507270993631776768	f	mexicue
Best lobby entrance at #NYC's @acehotel http://t.co/VAXq2A7ZZl	1409778869	507275463337971713	f	mexicue
Thank you:)))RT @rajeshwari_c: I had given up on food trucks till I found @schnitznthings today. Great lunch and service guys!	1409780584	507282654895820800	f	schnitznthings
Cheers! "@evanspatrick: @dubpies Hoping for a swift return to action!"	1409780670	507283014611914752	f	dubpies
Not tonight, unfortunately. Engine probs :-| "@evanspatrick: @dubpies Are you guys going to be out in Williamsburg this evening?"	1409780278	507281371149377537	f	dubpies
SNAILY FANS ARE THE BEST! @stephanierizzolo passes this man every day &amp; decided to get him some treats from our truck http://t.co/fczE5wJOOa	1409780290	507281422265356288	f	veganlunchtruck
Now serving dinner at Columbia Univ. at 116th &amp; Amsterdam! #nyceats #foodtrucks	1409780124	507280724987482112	f	korillabbq
RT @Aotearoanz: In my thoughts all the time, thanks @NerdyNerak @BoBoNomad @publicaddress @transparency_a1 @endarken \n@dubpies @dubpistols ...	1409780719	507283221235896321	f	dubpies
RT @five15design: 4 years ago today, physical &amp; cultural landscape of ChCh changed forever with the first of the 2 devastating Earthquakes....	1409781672	507287218973868032	f	dubpies
Want a pair of free tickets to this years Vendy Awards (9/13 on governors island)!?!\n\nPost some yummy yummy food... http://t.co/2j6IkFSGj1	1409782996	507292772361981952	f	veganlunchtruck
RT @wholefoodsnyc: Two days left! Share a foodie photo from your fave #StreetFood vendor w/#WFMVendy &amp; be entered to win a pair of tix to @...	1409782734	507291673421156353	f	veganlunchtruck
Thank you @vendys sponsors @steaz @VitaCoco @frava @Gothamist @Social_Fix @Yelp @TurnstileTours @JanoverLLC - the 10th yr will be special!	1409784287	507298186361593856	f	snowdaytruck
RT @vendyawards: VIDEO: @Snowdaytruck is bringing maple syrup to the #VendyAwards while fighting for social justice! http://t.co/O10v74B3CE...	1409784024	507297085193207808	f	snowdaytruck
Great quick video of Chef Roy of @DriveChangeNYC by @TurnstileTours !! Thank you so much for the visit: http://t.co/5XKcWLZemp	1409784009	507297022035365888	f	snowdaytruck
@TurnstileTours @vendyawards thanks so much for the video!! Great work! see you at the #vendys - we've got mad maple love for you!	1409783954	507296788014202880	f	snowdaytruck
@thefortunesoc see you soon!! We've got mad maple love for you!	1409783823	507296239663456256	f	snowdaytruck
Thank you @vendys sponsors @BrooklynBrewery @WholeFoods @jackspadeny @ShanghaiMKS @TitosVodka @VolvicUSA - the 10th yr will be special!	1409783785	507296081815023616	f	snowdaytruck
RT @nitaboo: It's Taco Tuesday! I had to get some  chicken and steak tacos from my favorite food truck mexicoblvd!... http://t.co/zStOJPV4V4	1409783502	507294893962960897	f	mexicoblvd
RT @shannoncopfer: Having a lovely lunch thanks to @thegreenradish1...vegan "donart" and "no chicken salad" are absolutely delightful, and ...	1409783856	507296380755664896	f	thegreenradish1
Bierbeek @ Great Lawn in Central Park till 8pm\nPagadder @ Brooklyn Bridge till 10pm\nGoesting @ Bway &amp; 66th till 9pm\n\n#dinges	1409784390	507298617850593280	f	waffletruck
astaar @ Queens College till 10pm\n\nVedette @ 60th &amp; 5th till 8pm\nKotmadam @ South Street Seaport till 10pm	1409784384	507298591493603328	f	waffletruck
Wafels @ night!\n\nLe Cafe @ 15 Ave B open till MIDNIGHT\nDe Wafel Cabana @ 35th &amp; Broadway open till 10pm\n\nMomma Truck @ Astor Place till 10pm	1409784374	507298550985023489	f	waffletruck
RT @kikaeats: Congrats 2014 #Vendys Cup finalists: @VeganLunchTruck @DesiFoodTruck, @elraydeltaco, @NuchasNYC, #LechoneraLaPirana Great sho...	1409784392	507298626675412992	f	nuchasnyc
RT @nycfoodtruck: . @CarlsSteaks @ToumNYC @Chefsamirtruck &amp; @dubpies are #BRINGINGIT Sun., 9/7. at the @Prospect_Park #FoodTruck Rally: htt...	1409788449	507315643671400448	f	toumnyc
RT @Kiwis_In_London: @ngaireackerley @KSegedin did you go to the guys in NYC at @dubpies ?\nTheir pies are amazing! ;) http://t.co/zjknc3nJjD	1409789885	507321665161035776	f	dubpies
@KSegedin as Green Bay Titirangi? Nice. But you should at least try ours before you commit to that opinion! ;-)	1409789852	507321526463774720	f	dubpies
RT @ZachFrantz: @mmsuperflyjr @mamuthainoodle Can I get some of this is in #utah?	1409790379	507323737126215681	f	mamuthainoodle
RT @TurnstileTours: Drive change with @SnowdayTruck @DriveChangeNYC @vendyawards and @VendorPower Sept 13 on @Gov_Island http://t.co/q34hrS...	1409792576	507332952997777408	f	snowdaytruck
"@jasilynntauber: Why is the grilled cheese truck always by my office the days I'm not in  I just want @gcnyc1" :(\nHookie today ?	1409795523	507345313687150593	f	gcnyc1
Hi \nLT is in the Meatpacking District\n1 block from Standard Hotel \nCorner of Washington street &amp; Gansevoort street \nTill 7pm	1409413341	505742324606181376	f	langostruck
Hi the Langos Truck will be in the Meatpacking District\nFrom 12-7 pm\nThe exact location will be updated in the morning .\nEnjoy your lweekend	1409356832	505505311500017665	f	langostruck
Hi happy friday and long weekend\nLangos truck  is in Midtown Manhattan\nOn 47th. Street bet Park and Lexington Ave. \nfrom 11-2:30pm\nThanks	1409319764	505349834065592320	f	langostruck
Hi\nPlease don't forget Langos Truck is in Astoria Queens \nOn 30th. Ave bet 31-32street till 9pm\nThx	1409256620	505084990154362880	f	langostruck
Dear friends back to NYU \nCorner of W4 street and Greene st\nFront of NYU Stern School of Business\nTill 9pm	1409081889	504352114374868993	f	langostruck
Hi Everyone\nLangos Truck serving lunch in Wall Street area.\nCorner of Water st &amp; Old Slip\nFrom 11- 2:30 pm\nThank you	1408976403	503909675491151872	f	langostruck
Hi Langos Truck going to Astoria Queens from 4:30 till 9pm corner of 30th. Ave and 31 street thank you	1408646924	502527740835532802	f	langostruck
Good morning \nWe are at Lower Manhattan\nCorner of Water street and Old Slip from 11- 2:30	1408367255	501354724722237441	f	langostruck
Dear Friends the Langos Truck parking in Lic Queens front of PS 1 Moma 22-25 Jackson Ave, Long Island City, NY 11101\nTill 8 pm	1408210710	500698127767461890	f	langostruck
Audrey will be back on next saturday	1408109941	500275469493993472	f	langostruck
Hi \nFinally we are in Midtown Manhattan on 47th. Street bet Lexington &amp; Park Ave.\nLunch time from 11-2:30 pm\nNeed more info 646 286 9949	1408105475	500256740156665856	f	langostruck
Dear Friends we serving Astoria Queens tonight corner of 30th.Ave and 31 street from 4-9pm	1408035099	499961561981911040	f	langostruck
Hi\nLangos Truck going to Borouh Park Brooklyn  from 4-9pm front of Bartek Deli New Utricht Ave and 46th. Street	1407949423	499602211211853824	f	langostruck
Happy saturday \nLangos Truck is in Bensonhurt Brooklyn on 18th.Ave bet 67-68 street till 8pm\nFront of Telco Dept Store	1407606146	498162400210976768	f	langostruck
Helloo please come to see us in the East Village tonight\nFront of KEYBar on 13th. Street bet Avenue A &amp; 1st. Ave\n\nSat Bensonhurst Brooklyn	1407527367	497831976817410049	f	langostruck
Hi guys\nlangos Truck in Astoria Queens on 30th. ave bet 31 and 32nd. street till 9pm	1407443232	497479089062952960	f	langostruck
Hi there the Langos Truck in Borough Park Brooklyn tonight till 9 pm\nSincerely	1407357739	497120505556914176	f	langostruck
Hi New location for tuesday night 46 street &amp; Greenpoint Ave . Sunnyside Queens till 9pm	1407273574	496767491906224128	f	langostruck
Hi Langos Truck is in Astoria on 30 Ave. and 31 street .till 9pm	1406837282	494937551145553921	f	langostruck
Hi Guys we are in Brooklyn Borough Park New Utrecht Ave and 46 street from 3:30-9pm thanks	1406745101	494550914733449216	f	langostruck
@graciaskristine lookin goooooood!	1409803194	507377487475904512	f	waffletruck
@Mandasaysso moved on down to the seaport.	1409803165	507377368638713856	f	waffletruck
@VanGoghAwayy @bwags1121 or, Saturday...and Sunday mornings...?	1409803126	507377203655761921	f	waffletruck
@olgaaam we certainly hope you did.	1409803093	507377066762063872	f	waffletruck
@StacieJames @Welcome2theBX @MorrisPerk yay puppies!	1409803078	507377001456758784	f	waffletruck
@Welcome2theBX schedule is changing up because school has started. Still trying to figure the week out.	1409803044	507376857260765184	f	waffletruck
@dinadee_5 tis always a good time.	1409802913	507376311829278720	f	waffletruck
\.


--
-- Name: images_id_key; Type: CONSTRAINT; Schema: public; Owner: pepp; Tablespace: 
--

ALTER TABLE ONLY images
    ADD CONSTRAINT images_id_key UNIQUE (id);


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

