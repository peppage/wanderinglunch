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
5261c60411d21ab0209ad83c	/8160578_SqpG5TVwTTu2h7cWpWvihe-_P_-OHSYzoOgMHmImCHY.jpg	public	lobstertruckny	t
53287c9c498e4b30223220d1	/68150_mMquObtK1F2QjX3VWuhYK2MtjUA9i5QRzexf9zWrBOQ.jpg	public	thegreenradish1	t
53287ac3498ee8ce8841a510	/68150_pNBQ4zhtsUiGR_kyfk0HziUGMzyIQwYcYpJ3VpZf7tk.jpg	public	thegreenradish1	f
525b3a3711d2040fdcbd6fee	/52031712_DN0C9vfm3iv1geUuFX92Pt0jwgl8NhbGokLj_o0Ebjg.jpg	public	mooshugrill	\N
529fe66b498e1fd14afe696f	/68150_h0wbg6xbNwrEjXD6uaE12ZDZYF_h55LN99Es520nMBI.jpg	public	mooshugrill	\N
5267fa9611d2688bdc4587a2	/2136029_bvqot1MnMJ9IGYsYJkamqTiE_lL96OcfilWMxskhdU8.jpg	public	mooshugrill	\N
5213a7c011d27a56f99dfba3	/11074699_K2ka1_NxiELyTqgjvY3oMN70IUxIlADqRIAb5QpzsLM.jpg	public	mooshugrill	\N
4f67b0d4e4b08559c4c60149	/SdNxRS0joKXurf0FEv8_SRg-GeR9lGCN098_ZB2tijA.jpg	public	mexicue	\N
50784742498ec6be8cd3f88e	/155927_ebZApDyXpTKTmvOQHdBTxNc2wJrsZV2QASmpYTNAVJM.jpg	public	mexicue	\N
507efae0e4b09a52c022ec3a	/39213_nH-zcqfLCJqMvG0Nco0LWE4QuRuoL6unlEXJlJbTEF4.jpg	public	mexicue	\N
523c930a11d22e1c3012a9d3	/34169985_AiTXirGu6jTaGeWWhhOfl2QIbGVaQjdDg1QCEakqza8.jpg	public	mexicue	t
51c1ea41498e372d91835cf9	/5067950_pSXIZo_RqO8Hh5AuWcomjr0p3q_pXPUMWe99W8hUGTU.jpg	public	burgersandbites	\N
51a79983498e3044671cd784	/1441492_yfySwml4ChzJ_ni5DxTq-8n2UlecWBWjgxR-ygA6pYc.jpg	public	burgersandbites	\N
4f7deaf5e4b0ffb6a3f2008e	/Xho5Xq8BtpNhEQvH0KRI3yX4kUstFRwTxEDj6QoawcM.jpg	public	palenquefood	\N
51d31ab97dd28a271207af20	/59958053_5CogfmHgRpBtjkPzVkAgAjK7q9ac0bo8Z1TPwxPIFAw.jpg	public	grillonwheelsny	\N
531b7d5e498e3df35f261af2	/22402741_aYe825rrQDsEq6E_Pqv35za149PBn1PcT557SaJhOK4.jpg	public	brooklynpopcorn	t
51af7257498e0c7f8979c05d	/752258_nUJpoSxZ8p9BBJMG5ISetpo3DDLzycLT_gT3z9fvJmI.jpg	public	getstuffednow	\N
4f733c44e4b039d898ce1409	/PQ9G-O3CAtCW6ixkiwHhICEaRn0L3Lz1F95zKcl_GdI.jpg	public	waffletruck	\N
5135022ee4b0592185aa975e	/2660256_0rdKd0P0tCYzLf5j7-_3b8HbPNDVCW6S0hHdJGW47Wo.jpg	public	mikenwillies	\N
501fe830e4b0bbddce992f90	/fFBOGONZt5Zr77Vc5g8adoAiBht0f-MBut7GqorVEjo.jpg	public	mexicue	\N
5203e16e498e9e8e0a93b61a	/702028_Fog-6PEF03KateivIPP-hx87Qn6gi7PwnaJv-wTFv3I.jpg	public	carlssteaks	\N
51b8a845498e8ebdef064e0c	/761163_j9ai1NfaIpK2TLN8JzXbTwyIhVzuZevNHBV5EpQ7Fh0.jpg	public	palenquefood	\N
51435e1de4b07d53cf71fd7a	/4486_lUhkecOFThYlMHKai4wDp4lXXiQSPLTq3Nno5WMIz7E.jpg	public	palenquefood	\N
4e6513efc65b2dc8a0bfff6d	/TUQTIKBJPOALJKHN54QRKGISWMQDDOW3WTAECOGJ4FOJTPXI.jpg	public	palenquefood	\N
4dfa4a9840a3542ff44549df	/VBAJNQCBWDMP2WKDXJ5QHQ0WYF1MKHZSLUAZZJXKDBDLDUWG.jpg	public	taimmobile	\N
51cb2c41498e9851cecdd49a	/5728350_vuJ4ORu0wHhd-B-f4FTNfsoIhfHgtJRMJc-QEeiYmNQ.jpg	public	taimmobile	\N
519babe8498e355d9d35fca0	/65817_6p9jSMaQMqP9QGn3KOIyuDOG15jaLxIPvsdrpZGWdj8.jpg	public	blend_express	\N
506dc9b9e4b0c21f078c3bb3	/22983_XN2GbKo3a5YsNY_ZpiBcjUHTD2if3TWS8r586Uq4cEk.jpg	public	blend_express	\N
5033cee6e4b03e64bc749ee7	/tIyy6IAKcw2SSiX5JSPBCURstZZisntK_46plgrfdJ0.jpg	public	blend_express	\N
50ca356fe4b05b0bb93edc40	/1590381_NyRIp7fXJtGoJoXp25IcMmufNufPxxvLEj3TVYXRo5g.jpg	public	getstuffednow	\N
52013fe1498e5f476bfdcf83	/30611522_DHhazmY8dyNAbmijjHX7jyyfVBEiugL5-GJcTLuYjS4.jpg	public	getstuffednow	\N
523c8b2a498e959b87f8ded2	/39707564_-WCsPSk2ExKeZ8q06DtUQrpt_vcWG9-AzvFoToSdQqY.jpg	public	getstuffednow	\N
51378e9ce4b071feb46ef7cc	/18792384_RSm8zhe_6kUOxy91taByfRjTDSLp7stH7PI41aJHOrU.jpg	public	bobjotruck	\N
5249b50c11d2d415e3c6b017	/769710_HOnpTjl0b6qd4-yoPpg9lXZGBy-ZKikqzLlFWw2sQfs.jpg	public	bobjotruck	\N
4fe20639e4b05dcdf7f5737c	/l9UdGGevddtOhDk6scQjcy1-TbVBX-wf8Gf56jBIRIg.jpg	public	bobjotruck	\N
5249b1c511d23e54343ae083	/769710_HUiZ7dJrNbdnPYV-DTQRr1z0zgoxFx9KMC_Y-OQ6O2o.jpg	public	bobjotruck	t
51c213db498e0748ab0dca3c	/53641916_5aNKp9fdHx3i_Pi15Z_X6pE3fAsTX35YBQ0nlmZGfaA.jpg	public	morristruck	\N
521f754c498ee4d6fbe8a778	/22491899_EEPqf4HeJFaaFjYabKyScGZ8symjXEgMjPUEkfpJsJk.jpg	public	morristruck	\N
51856452498e6f602088cbe1	/232510_pLk3QUUWFOu82-4SX-ObtA8bw2ZPf61QBOeIuL50T-o.jpg	public	morristruck	\N
51716b5f498e03d8bc252c48	/11709298_S8klPxq0yPyZw2X9-_0IZyk6TFTn9xi5SWd_6BGCeVM.jpg	public	toumnyc	\N
507dacb0e4b0d8cafc9601e0	/2361939_S3NwwSNVZD-2tAhc3bwAvsYgk9tXwYv0T0yq9ci-ihE.jpg	public	toumnyc	\N
516452a5e4b0e1b216fdbaa4	/26263584_5wpEOb9FygNRBFQySA-pE1t1q_E9jVM_4mx2mnw5fAU.jpg	public	toumnyc	\N
516d98b8e4b0b059e50ff5ad	/117715_BoNkQJO4jPWEtg_ef4-URb7IseoIXnYiP5vkvWJtezg.jpg	public	toumnyc	\N
4fe1fbabe4b0be4ebe6c1c52	/HNMFUfRPXDmxSDWAwh7pixJ34SFUY0fgzZFeOLAVXU8.jpg	public	funbunsnyc	t
51c8a3c5498e797153ec5629	/46314126_95x6AErCZEGSi1zGZrFCY-EzgsIMyOhgO4G59l-u_Xg.jpg	public	funbunsnyc	\N
5212ec18498e9494b634a94c	/814104_tUkLgiQ8zcYxovra9R8PIx7FckFhBjzNVHmirteXd58.jpg	public	funbunsnyc	\N
4ffda271e4b03bbc7f8fd13a	/6Dtx8fj7IXT6M3O6ZV3rXryb6zKTAqPchjeOM2BJJAs.jpg	public	funbunsnyc	\N
505204d6e4b02dee62bd961a	/dcOYoRoNNeCLMxvoyAN-o9gJObcw5FljMqYpS9cps84.jpg	public	funbunsnyc	\N
521cdb8011d2f79883b5be62	/36501880_zzNkJUOscINjy2aiwKSZEwjfQYJPjqmAsa6zS0dakp8.jpg	public	nuchasnyc	\N
5298ff7011d22a38856168e2	/191726_GHXLJD8lsdPciKdqJErekl1SKPjw5k4N2YuNJC6JRTU.jpg	public	nuchasnyc	\N
51118d62e4b063f95c18d16d	/191726_pTyD4DsW_jGt7E3QJJdH1QB-mHP1ZYggLzXtnZ7j3Oc.jpg	public	nuchasnyc	\N
5199097e498ea36447e54093	/40899881_hbjUdavpBfT-sLaBhv3pbZydT1tgs9v-Maw12j9I3Xs.jpg	public	carpedonutnyc	\N
5106b878e4b05ec869ad8b34	/814104_blIawoImaEcqf-Mg89W5A-nEHiZ5jx76BEYHVzz8dnA.jpg	public	biandangnyc	\N
527d2c2711d2c984e85cb11b	/4179871_5FQ2eCC5ZeizUVRLh4tadgEAO1BnJjVQ7pSEvSDwIfQ.jpg	public	biandangnyc	\N
512161e0ebca7d20d6a70104	/4574_ZC6mf3ha1jNXmFUDgtNsN3zIf-NHyqgxA3WkUkOl4mY.jpg	public	biandangnyc	\N
505c9776e4b0643aba1071c7	/5568483_yQrtG73dbug7q06p9IASJmTFnOVgGprIZKbfHjQRcso.jpg	public	biandangnyc	\N
528e451f11d2a93e4361f565	/977282_wEw3nDjN0NbjC4CgQ00ON0YjdtnMocrfAjXDM4UH63Q.jpg	public	korillabbq	\N
5286645011d228bbd12f9880	/1353667_2qCG26N4ikz7mbvEGkrFkcNLagGqrzRuNyeQ35CCDE8.jpg	public	korillabbq	\N
5231f54311d26e8da5827f3b	/977282_AToQDrlKW5PTNbNGQcB24_BeJNsRMgZTeYmC9P-or38.jpg	public	korillabbq	\N
5294e76b11d2879d5217bd00	/47558447_v1SwJZbLSZ2etlJXOF9qw4H3vErpdTiVIqXxULSVTSU.jpg	public	chefsamirtruck	\N
5249c4bb498ecd25dde27c5e	/764670_x0RdEOs5TL4SEe2zGgpkzPFBFmlFV7-6UQiVtoFeHaY.jpg	public	goburger	\N
5182ad6b498ef6cb59d48783	/39425123_zPh6ih4GAAygbhRJ-pyPdCr5TI3rXafgKyIEEK4HpHY.jpg	public	goburger	\N
501d4734e4b0af03cf473287	/6BUHUmEyYTTh3a2SRjSYRklUlTfQBNbFnnk_hfEojYs.jpg	public	goburger	\N
5161e794e4b02525dbd064d7	/310577_h_ww6Za5XojCZcGVq7-gZluC_YvRnT1EOXY4hwV7KJ8.jpg	public	seoulfoodnyc	\N
521cdbc611d2549cf41dcf9c	/926357_0BYLrfqHavxLIHQNkWupu34ImE55HTUVGGDJjycyOVM.jpg	public	seoulfoodnyc	\N
5012d0d5e4b06fc7ce735a68	/7J2g1YLtx4ma57g4A4CerJJ66OwudjGhFI67JaNl1Qw.jpg	public	seoulfoodnyc	\N
516d8267498ecda7c1b1b85e	/3179158_Z2holAKb6kR-uU-1uPwUaWaseYuavn6zigr0DRIRJFo.jpg	public	schnitznthings	t
50ad186ae4b0b639ca7ca234	/295161_qCQYG0XjW1Ji0pSDxM7fWRzxTZRbcYyZbsbPNJo12hw.jpg	public	toastmonsternyc	\N
521649b811d2913e20a1ae87	/5568483_RtMp5aDM_JtBZOI1u48Jy3om4Z672obezdu1uA_UWd0.jpg	public	toastmonsternyc	\N
518a82c9498e068718057964	/25979758_bGWQQ7W2SJI4v7KmU891VcYZGitov6qbSNAnIEt8HTo.jpg	public	toastmonsternyc	\N
51dd9efb498ebbc846c11c03	/13001992_b9dLXH02o0ZX8hyUZVtpgGW6sDyzAl23vmEl-0Hj0jY.jpg	public	itizyicecream	\N
501c284be4b07d0ab63e08be	/vQv8P8_hFNwHMmpR7k6-arr8zqYmmgoSG_aAPJuz-ws.jpg	public	itizyicecream	\N
51e83b4a498e0a1c64e62828	/26624_AGoljLki5SS-GJGKaAGB75mloHKRBkJ1Qj5BQCRP1_Y.jpg	public	itizyicecream	\N
51dc48a3498efe9483d8417a	/117715_dlhUlP8z_jVejqRlWaCzsJBqg0eoP6rRSjOLpszFA0Q.jpg	public	veganlunchtruck	\N
52ade258498e293fae46e684	/68150_s7DCORg1dB6IJWWdj_e_pZMg4zKZs3S_Tjkff_px7kw.jpg	public	veganlunchtruck	\N
516ef5ece4b0d1c83382c12f	/117715_Gt3J4FMusC7YQjSfEup4O7bAO10z8J4gxmnd0xKnZuQ.jpg	private	veganlunchtruck	\N
51105b22e4b0a7b61fac854b	/117715_vKu0po70jlTD3qN9mXsdNiE6V5Od1hmYMVlUY9xSIP8.jpg	private	veganlunchtruck	\N
526e782b11d2a15e6fb663f3	/8761552_XH612BVbFNOBD2jJVEMDzyawnGF45FygNA3TtdKo6UE.jpg	public	veganlunchtruck	\N
52a0bef911d299250c89f9c7	/349672_Cg8dtcrfQ0WZeSo7BJR61YBG6VzsiMltZP8XIqyHiu0.jpg	public	mrniceguytruck	\N
529ccbc511d21047117cdea2	/68150__CRf8sW9KvXZTkcAQEc4EsnYPgqXA2trmMxy-_AzobY.jpg	public	mrniceguytruck	\N
51dc5a9e498ebf7ad40223ec	/1328035_Ak3fMs2e36r7NvIE_gIDK5XZ9CwrW1DEJa3g1oobp5E.jpg	public	wingnitnyc	\N
5245c79c498e057f7d5ff65d	/117715_CEghvDHaxkALy5RxQCAVW-kyM0TAZo2-fIT4e6veJeo.jpg	public	neaexpress	\N
52052ef211d22b8ed81dd96b	/36360429_am9ha8rSYxAvCaSMU9ya6lI9MzIgcpR62DH6HS1b-uY.jpg	public	milktrucknyc	\N
4f749b3fe4b0f06c04ae2440	/rA31cWGMm0G8EuZFYZBxb3y2OrW3oEo7vCj1L2XR3AM.jpg	public	milktrucknyc	\N
5281221811d21e907e460e00	/4195495_akELCvAQ7aY-bfTfHk93g5g5_qcJnQJV7h_gH0FlKUA.jpg	public	milktrucknyc	\N
4fee068ce4b0f9bd2b4041f7	/UQwqaF9knSdh4LFRzAhnh7hcl6_dSjDTg1phtqTe_7Y.jpg	public	milktrucknyc	\N
514360f4e4b0455b303a4d66	/8626436_tfGrSomdm1qEPFKcyb0Q5atmm3DmDeao1W8MotOtOwY.jpg	public	milktrucknyc	t
4fd26038e4b06145dfb72894	/zUVUqzIwbwoFsRrRenEhtDmBSbK2Ry9lzqeuYnmnHG0.jpg	public	waffletruck	\N
527e823311d2db75dd831ee0	/22419482_1rrrm4nhOKXQsXN25ApmVsGDw4t2J3GyjhfeQPEbClU.jpg	public	waffletruck	\N
5280c18811d2e4df572063db	/5354893_5EtQmcwzMnTRFz9qbxjkt9FguCAC4xfW5xwUCyYIrbQ.jpg	public	waffletruck	\N
53287a41498ef1dfde86d217	/68150_jBIeF8OZP2o4q5lJjB4TeUteiuuczqDDm3s4zQGipGc.jpg	public	shanghaisogo	t
50a696b4e4b04d062582a95e	/32050404_qo6ZUnU5LQMoqrAR6YoH5Qz-PdUcD1d1jCheEJy7lng.jpg	public	thepocketful	\N
511a7d64e4b0c6a64118260c	/793192_Dtd9vMRk-pbBJscn1cb7n29zM87iJjZy6rojapRhODk.jpg	public	thepocketful	\N
51424d6ce4b0041cb8df9856	/117715_oxR8_TwNSaCL-_gKDA2i2-1YoRfVVnbfT3M9Bfu4nxE.jpg	public	thepocketful	\N
51800af8e4b07a4a57023def	/9548073_erhzj0ShEDKaz8S8DhlDe90fDjJEIWjilIxO4_zjdGE.jpg	public	thepocketful	\N
507071bfe4b06e882e74b445	/1112203_qnT5k-31-4cRKDz00cUpp7Ia7HG3YTjhsC9Udo90RDI.jpg	public	philssteaks	\N
512bbfebe4b0b8faa466c796	/1425622_4wp7wCuj7Ci1dl_FVH9syKmrJwQavMhL9uqww1b0m1o.jpg	public	philssteaks	\N
527e77d111d2e66fa6a871b3	/649454_HIWthX8nL3SZAOwyMlKj9Y7ju9GCiN4OEV-wZR6IKC0.jpg	public	philssteaks	\N
51645882e4b0bcb0cb0c7ef3	/7511393_dEJJLGO8ljFPMA_kFidoz1wpWZ-k6mHpqYnuRwoBpRg.jpg	public	philssteaks	\N
52fe5db111d2d7644f04c21e	/404119_k2pARWK6AW8sOni-GGVsAfTehHeRbbnRCBGhfeb1xZc.jpg	public	philssteaks	t
52407581498e6271e84d0d20	/663291_BQuSIJb2d0ODso7gvZiRLuvYbp3sg4FwHG2u0kAwsmE.jpg	public	gcnyc1	\N
51eae36e498e58d50e5683ba	/331066_SArUzXa_cz_-YMQco1rwYAfU8a99TZCHJX9a2WA3fHg.jpg	public	gcnyc1	\N
5106bdece4b051d6cb82a376	/1922740_Eqg3x5oj7wks2XGfudNYIAzcCuZHJiWpgLP1CCbonEE.jpg	public	gcnyc1	t
521e9e4511d2d8ddc5c69dbd	/117715_r7cpzyXCpOthqHouR5gdqIMX8k0TZ2KWHFun5wh-EYk.jpg	public	valduccis	\N
5079a745e4b00277f33e4836	/34723233_tCoDnWhdhZj61xi_e00MNwJoK_UcfDXCQQ7Weat8pBM.jpg	public	valduccis	\N
4fb29dc4e4b0e08c1e225555	/ckjwTj4Fd2cRoZvDQZw_1jYdwuBF4BsfV4ZWc5oElFo.jpg	public	eddiespizzany	\N
4da8977840a3582fb8c49316	/MCGIPRA0XR15JNG4O2YZJQBCRMK05UVTC4T14TOQWRTNMQFZ.jpg	public	eddiespizzany	\N
4fd79157e4b071eb33a9c810	/8zrcTIejD5EBiOJzSobql1_PQWr-i2KmRfgMCYmbK-M.jpg	public	eddiespizzany	\N
4f9c18b0e4b0b38d2f554383	/AQEKYbyPrQt5uMWhy4r4ODm2vSMCqPseJyMhcg55mtY.jpg	public	eddiespizzany	\N
507b0648e4b0109f3656e2d2	/76137_7JNe3m0dO2MZ7a9rkqa_DTlnrw0LyNitqksFG7_5IC8.jpg	public	lobstertruckny	\N
508abe69e4b01ff7516d118b	/8029486_9wt2tO9BnY5d11Ef0mpAgHAqfK1QMmSvLXglU4fj6Xw.jpg	public	lobstertruckny	\N
500ecc9ce4b0a6d209804d9e	/d2yG6CtTrc8TQAXoEGN68UYAv3DiJIqJvKU65-ApcaU.jpg	public	lobstertruckny	\N
5245c7a1498e0eb9bc097723	/1727660_xLZtYmqATL4pckN_IhgIj0AgUbDAJxywzqbf5PKEooM.jpg	public	lobstertruckny	\N
51f15b4d498ee58fec420a7c	/13285510_Q-SBXKFpfroSwQ-QJdezzrh1KaHfHAmLyicy8d5S1jU.jpg	public	parissandwich	\N
5243126c498ea77b19b3a444	/65506790_31Qpx9E-ZjuNve-izmDY6vVxUCMrhgGsnOLn4-fusp4.jpg	public	parissandwich	\N
51b22a0a498ec00d1c45726c	/390807_y2oeK6xR54wk9b1Sfm82Ek09Auv2lNkRTpJOzos3xjU.jpg	public	parissandwich	\N
506dcb8be4b0748e0467de78	/157259_PdYI3Fpzhcz_LoGnBeymaSAZaZCiVVw43c4xaYQQIDY.jpg	public	mikenwillies	\N
51117858e4b0e14064917adb	/263293_EvgjxXJqOivd94q0mbPR_AxkRXuzkFtjOBcOWnXuyQU.jpg	public	mikenwillies	\N
5180207390e7374e46b6c165	/49563206_uKsSD-Cd2jjy6FMyR9U_--7DdUBJ7ZUxtdlushxyIAg.jpg	public	freshandhearty	\N
5008051fe4b0974c844d5003	/oNy0_bsWPyVmjrduzJXpbrAPHjQS0PVbyOCfoRSD9xE.jpg	public	shortysnyc	\N
51a4ee69abd87ea53396c979	/4083549_jMzaCPEId80kWmAaq2oQ9APKf4bLvdeHhy40qPeB9j8.jpg	public	shortysnyc	\N
50045b1be4b0004dbf67c977	/MDweBG1fBnF_fZ1tOghWyHS9qUxGNiJeOrOpoA-fBrY.jpg	public	shortysnyc	\N
4feb2bb8e4b0a47cf49787d7	/-CEaOy-zjgmGzmPRViSeNchwIITBbHgI3lFosreLqIE.jpg	public	shortysnyc	t
504a271ce4b0c65efb6b05f5	/PG0DfZvsxtqv4QM8Xpl6y8Ojahb0UanYwCPSdmuhj_E.jpg	public	taimmobile	t
5176cceb498efe500552cc9e	/21735785_zaQs-7anNinrrQlobBV2AjNxquTXs5g8ZY0NxvoxvHo.jpg	public	steaksncrepes	\N
523b2edc11d265bf373f82a0	/8853695_cjpq3trk4bFpcU1oHWwj4XxwwD9ZI169sNncUyOQoM8.jpg	public	steaksncrepes	\N
516ee142e4b04f28d58be309	/36812449_DjR1ynMnMpwj-KmiWPZQldmGQwJ2IEzjSwwmGevqe3U.jpg	public	sweeterynyc	\N
5107e09be4b047c08ade6bf6	/760350_ZaalKVnOYdVAGoQEdugu-1Lws1LubyJBOVpZvJJD1V0.jpg	public	sweeterynyc	\N
50188a43e4b0d35e6d8035b4	/b-fKh6mx2WxCybNQkr9ovk_jv4x7bwJPVFM9RF3M5T4.jpg	public	sweeterynyc	\N
526e8aee11d299d16e74b447	/67629862_ZPeS1alTFabw1hPqq8PCcGF1SRFynqA23OgkKg8yc00.jpg	public	lovemamak	\N
521b83c411d29ec0512f89b3	/255980_1U9yRWzBKuIDLReBhmBs45qJ0mtHu7pzL_Fv4T9gTss.jpg	public	lovemamak	\N
4fe65d6fe4b09198fde5842a	/nVmhJloDitdcBPFceYT8ajqQqgXBpB_w5GoPWse33Ks.jpg	public	valduccis	\N
526fef71498e92d1ace459d9	/60805368_eCRrBwapYrNL8fM9tmIaLCfnlhQYb9ASU-ZkaR1Og54.jpg	public	mamuthainoodle	\N
5203bd51498ed50247ee01dd	/60805368_HlIeqCMjY2I5md2mzI5crKizc9wVPUZo_sBmC6zrPEA.jpg	public	mamuthainoodle	\N
4f753600e4b07eec20023ddb	/zUb4OswXiQLnF_k2xnx7AdupnEIl1nuGyIuFcmFWf8Q.jpg	public	thetreatstruck	\N
4fbfe026e4b04422a08a40f6	/Han8Z4R-SQ615pLoN2lRdPfKEFa6UW2yudSOxXmJtts.jpg	public	thetreatstruck	\N
51461b9de4b0bb73a6821e97	/1102787_UDt7OJpexNs8VPrehVDsp9EtfUJnMhKzJ2tTXuof06M.jpg	public	thetreatstruck	\N
4fbfebe9e4b0a3bda0340383	/Brw9_z178IK92xMEXLCSSZrP0-99GXjutCp7dHCi5CQ.jpg	public	thetreatstruck	\N
520912ad11d2f941183dea9f	/13285510_v7K0PTg4FzGI822Jbc9A8K5mUHIxwJPBZB_0xNeEauE.jpg	public	domotaco	\N
50ce269de4b07c1547ebfb2c	/263293_qjcLaRmf5itOMyRiq4AyYZuY2UVjVJk04lO3FTA2CMY.jpg	public	domotaco	\N
4ec59ebacc21b428e0de466c	/4AMXSGP5YGTUHEL3TFKTS5ROVIX4HUTU4MU5ZW1OX5E3URDD.jpg	public	domotaco	\N
51f4589a498e97316d307dab	/186827_ilvLMlb3AFqgXUQJ43S7IjsLNPxYP3Pw5LEjrqhp6wI.jpg	public	chipsykingny	\N
514e42c7e4b0ec8b7e400875	/48992751_ibL8tx_7JPvV3aQmnEevrdibtLP0jWytaChkCdRuhG8.jpg	public	crafflesnyc	\N
5220dc78498ebd10d150f736	/29917892_nMZHXkfxBukc2QfFqtDBTZSJ1xpMkoO7VGBJmGKkwhY.jpg	public	brooklynpopcorn	\N
5258d3ef11d26d03cc0563a5	/117715_GQ_O1nyBbVlKTaYpRlprc8ZdIEAEftbU4_9hDGjvxsU.jpg	public	brooklynpopcorn	\N
4e09f3fca12d09aa881a769f	/NTSOFYDIBYVWGE4RYQTBBNIAQESPZ1LLW3Q4TC3TGMROSJPH.jpg	public	nautimobile	\N
5022f267011cfeafe81dab9a	/7EPnN8ReXYQWoZYxzqkH9AQlOe8vFPtVP_60n65i9U4.jpg	public	nautimobile	\N
4e70e35c52b140871b6fa35f	/1TB5ROKJY5NF0GAVS4YS3WZTFCUXXHTPLLBUIK4BU0XD0QA5.jpg	public	nautimobile	\N
51ccc251498e028212e9b1e3	/117715_ozxp6K6iPGwKCzQDARR3BgMcisplkTt0x4LEKDJdBMk.jpg	public	nautimobile	\N
4fa814d1e4b0d607baf8bd9d	/2drHnu4mqj-uzpwwcJa3MatYGD7KFuxjE472rButWlM.jpg	public	taimmobile	\N
519fa37b498e7adf7e8ebce3	/47170230_A9xVWAtkJBP-vVqUF1q2WlK8yuZTf1CVQz0JcPrHGY0.jpg	public	taimmobile	\N
51dd9ddc498efb9a3437e123	/4501533_djr9d2BEP8dg7E48xJjJTa_Yjk0Iy-MmBG6hgIQBLUs.jpg	public	bigdsgrub	\N
513101fce4b006d9c4991bdc	/17248619_XfpmI8dNgmoeHE3BXjV8bL2yuuMTqxU3FqDr4BqX7Ks.jpg	public	bigdsgrub	\N
4fa2d04de4b0489ba3d7936d	/hsPbM0G5l3AsUaI3x6r_VkiSYo4pYlWTKK2S9zqh_KE.jpg	public	bigdsgrub	\N
4e4e92c7b0fb088f3c0f14d5	/HTLXSW2D30RGIEYPI0JGR22LUCS5BTXQ0LXDWAOHH4PCVHM4.jpg	public	bigdsgrub	\N
50e71f82e4b07154c72fdc22	/275165_az4RUZ2U7-4cfdnQA1FlMrDLaxwCMriWtlhS_pddjEc.jpg	public	mexicoblvd	\N
5140cc96e4b0ef29f4802508	/4886503_z36ZXtYKGVIHcNLCR18ZdUWtpStRrbf33rInxsr2p1Q.jpg	public	mexicoblvd	\N
525de1d7498ef4b27ada0847	/31827631_CApIgPWaXupe3toLi7iJLb6NxIyn2IDTOjAG0qw-PIk.jpg	public	mexicoblvd	\N
5189442c498e765ce62d5924	/2432527_5nUa0fTfy4rzjXpiIUIlkguBa2kdqFSZIG-PLvkKu2Y.jpg	public	chefsamirtruck	\N
4fd0d80de4b062589043211f	/hZjMDK5KKgxjMhmOGBtaRjx_ga0SWHwppqfLfqw20Tg.jpg	public	chefsamirtruck	\N
50f59e2ee4b0b31f58d6cc1f	/1922740_OhtWiNUDUcN0NE_HB3Tk8vm5qIZcvqxcP2nMDrN8dT0.jpg	public	kimchitruck	t
519bb23b498e208a0b81b7fa	/9285455_LZiJ4FLH7NOWjNUsXO9jxDRFAgLygBSB8SmSIW0z9kM.jpg	public	mactruckny	\N
5165924de4b093be3bc5cd57	/2159706_uFl3RYgA1z4EiDNp8PtjjG2HHWhTiiXDLNzJtFWPHS8.jpg	public	mactruckny	\N
5151c82de4b024888079c5ea	/5003144_g8kbTzyfr6gL9vIRpMBbXz4TqBUk5EgkqIPlBP9DtsA.jpg	public	mactruckny	\N
5239ddce11d2ab4765d5cc7f	/5568483_alwOH7sfGU8-pKfLmurfe9rt3pk2G6p90KwFyC6hq1A.jpg	public	sweetchilinyc	\N
5328764d498e217e55fa24e1	/68150_4QSMIi6zBoyrZ1VeH1Dqb3fEovQswz93yHAPvf2lGmQ.jpg	public	dubpies	t
532879fb498ec68315b3d232	/68150_KF6qgT-viSOMS5bt3lJarsNeEUjlVJn1lbAypyCl1js.jpg	public	dubpies	f
53287a0c498edd9a0567c2c0	/68150_i3UKBmIXHPN4h7gtvSQjnYfikUNmJuGRpjwKP2dLI5Q.jpg	public	dubpies	f
50ce2696e4b0881a7ef3ee67	/263293_lcA30Y_JnQGKaaHhRqFUio2HQ8UQkphCWP9yhW4CE3g.jpg	public	domotaco	\N
5192873e498e63958610c2eb	/117715_Jf2pdeF9ztory7puWsPaFE26jmMzPEzjOfPopvTzSjA.jpg	public	polishcuisine	\N
5244712a11d295d581384a17	/22780_QXd0BtJcOWXZwSm_ZG3oXyaNj6Qw5-p8hWQzzH121fY.jpg	public	polishcuisine	\N
51ab89bb498e83fced4cefd6	/66074_8dLzCKmVRde0Uvtx_NSl9SKROFh0kat1IQgcAvU4J3M.jpg	public	delsnyc	\N
51fd732d498e415eeb8b9881	/8839239_mAp7_MVmWbbK42Xq3-W-1zmegy-MNx8NzB0P5Brf-Pw.jpg	public	delsnyc	\N
520e673a11d25d1282a44199	/117715_KjwJnc6idBB7TuMKhGboHDg8IYjlGcr6h3I6_fJECmM.jpg	public	delsnyc	\N
51b8d7aa498e103b3a36ec2d	/47900463_7B6lLfz2PW1XyrG2vCIxp4vIq7QXWEhxufI5i75jwxE.jpg	public	delsnyc	t
4e42f5ecaeb7f6be72c39c70	/JC5VO3Z50HMMMVLCCGWDQPMKF4W01VBXP1QS2LFESR55UHIX.jpg	public	fritesnmeats	\N
506f12efe4b0bb9551703ca6	/2219480_LuuyF3peyimVfdQvb7tj9V-FHAEA0z1KmaSfMf9vKkU.jpg	public	fritesnmeats	\N
4f832947e4b0cd6f644ef74a	/qCgaHGVJ9rFDkC5DFKEKLBBekoxb6PRDRfuWV7neue0.jpg	public	fritesnmeats	\N
5243206b498e78230cd0770a	/54092198_eF4CEteD3zHjOCJzaYssyRXaQElB-GEOy2sqzBFQPm4.jpg	public	thegreenradish1	\N
525ee647498ef229c65969fe	/10045965_ptbEO58Zn5wDz6kgitvMVjFScmxSkkuHNbK-AguCXSM.jpg	public	thegreenradish1	\N
514e42a8e4b0d91e975b3db9	/48992751_womoOVd5bv-2KopmWjWEHA_WsyoWQITjAyXBuM4Ciz8.jpg	public	crafflesnyc	\N
50f99bcee4b08ca132377f78	/4611139_CEH3eveI6uxlRVQLet5Fpa_sNfJwAzfheMTYSBplO5Q.jpg	public	thecrepestruck	\N
4fd0f054e4b0757383b97c0f	/MbR1inb3VKXu0PQMsCkHkHGftYq0E8CDbYG3BLRRGaE.jpg	public	thecrepestruck	\N
51cc7075498e8d24309aea57	/991186_cg_CePJhqcT81QY5l1L4eB3MQxy_QlsRh4zmZDk8cFM.jpg	public	biandangnyc	t
513b9b7de4b04f7024bc158a	/45519738_eDUGOpHYwiR5C3VUps1gQ1YDIq0Di3WMfuirGs2EVBk.jpg	public	rickshawtruck	\N
4f8dc377e4b0ca2accf75652	/EKcue5yGEyaPnBymSd_HtBxWEZl4grYSOXMhw-gqpTs.jpg	public	rickshawtruck	\N
4fb6bb41e4b066430032e4ca	/HHZWTU3POi_yJE4GU0zI_NjZNerm5y3MjjxddcV5ZMs.jpg	public	rickshawtruck	\N
520538a611d2b476431ac7f9	/117715_GMdoseCn4baUtTX9kN6_PAAfHaGIlUpjxzAitpqLAOY.jpg	public	chefsamirtruck	\N
5197fe76498e1c056c96d21b	/117715_m462oAqyqBN12xyWCOyzYR6-1gtYrUa8BiX9r9OybE8.jpg	public	kimchitruck	\N
4e3da652d4c058f9dc087a6c	/QEOIS2W35WLTHYK00QC04LKKX4X1SYW3DDI45X30HSKTJENQ.jpg	public	kimchitruck	\N
501975c5e4b092f6a51ef338	/bI7RrGcK_moyn-kJICa1OCciBVuYYykwCMGlea6mcxg.jpg	public	kimchitruck	\N
4e00e61aa12db1129557e99c	/WSUNYIB0YFVRCTXB13UCRCTANZUG0DO0X2FWCUYYILU4TCGB.jpg	public	kimchitruck	\N
525c259b498ea7548cf31f8e	/769710_ZxOOtsSbFVklHIRhXVmTO7ops0Pm0EybRDTgUvGHrSY.jpg	public	disosnyc	\N
5197cb68498e8d409a89ec1b	/1847096_oRB5R_owQW40gVWlJhNNsh9_0bEq2D8Rt3Zod9HUbUg.jpg	public	disosnyc	\N
51dc5fec498e4e9be748eac4	/22801_gX0atVT6Jt_H6FPXuYAqHD4VzO5jAmS4SVid_ZLkk5U.jpg	public	disosnyc	\N
50883301e4b0904987088a20	/2361939_J2zcgauqqGFC_PZPyvkfEDoSufdDe5qE7gi_NkS1P1U.jpg	public	mactruckny	\N
5109aed2e4b01d2a5b69b022	/117715_0jgrjk5IsUFppNAL0NtebyMYoz1JMdzrnWAIjrLMHZw.jpg	public	schnitznthings	\N
5012e555e4b0dd18ec16bd37	/mZQAOCmv5lnRZ1qOUTwDXk-MLC-X-p01AfECgfLJC2I.jpg	public	schnitznthings	\N
5086e523e4b02ca59cae7bd4	/2361939_1JvatS0wOUdQQIaTmd4Vmk8bgr7aFYOR7LaMkRio0X8.jpg	public	mausamnyc	\N
513f646ce4b0b1892aaae1bc	/13285510_LmdJLKoCS9fSwm3wy96lcieTczjsLuxAEUnU3FlZDlo.jpg	public	mausamnyc	\N
51194bbae4b0cd237850b223	/793192_FQUO1SFGyLkg5NRz6VUYl3_zmFgfy0Mh8gL1unO8ijM.jpg	public	mausamnyc	\N
519a7e33498e6e4ea6ff66f1	/3354_e_1JMupbEA8VtOBVXgLHAvtJGQwcpHvY2JyFESXYSjo.jpg	public	thesteelcart	\N
5254357b498ec4662e20c654	/2620660_kMXeinZ_B6lOrHRQnheIHMBr7p81ZxcUblWl0SQ1vEs.jpg	public	thesteelcart	\N
51dc0e71498e8db4f9a8106e	/4456614_ZWvsB80ogvwYkoKIyVf6q5RfcDXwuKI4t0XJJhyLQ_I.jpg	public	thesteelcart	\N
5208f543498eaeeaaad3ce52	/15629_P_UAUr_S-OO0R12wNp8LDPwr-ZbfPiWeG0Q0rrjW6Ww.jpg	public	sweetchilinyc	\N
51f2be1f498e71235db5b61b	/117715_mGfGU0UGjUMhgqgwrDPf2f44NZtfMrobqJMF8ahsrjY.jpg	public	sweetchilinyc	\N
50e719c2e4b0e263423e547e	/15471_4uN0tddGW5orNGh02xhxbiAOGUpAAy3rIWEotoRgB_M.jpg	public	tacobite	\N
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
phils1	Phil's Steaks Lil Jawn	philssteaks	http://www.philssteaks.com	2 jawns out today!\\n\\nBig Jawn - 41st btw 6th n B'Way til 2. \\n\\nLil Jawn - North End Ave n Vesey St til 2.	Vesey	 North End Ave n Vesey St 	f	none	lil jawn( in|:| -) (.*?)(\\n|$)	1397219336	1383670328	American		4f15b382e4b0725660ea9f31	\N
eddiespizza	Eddie's Pizza	eddiespizzany	http://www.eddiespizzany.com/	Friday: varick and king until 3p. Try our chipotle chicken sandwich http://t.co/ylOBAPkF3H	varick	 varick and king 	f	none	\N	1397220303	1397220303	Pizza		4c0cf412b4c6d13ae4850c30	\N
lobstertruck	Red Hook Lobster	lobstertruckny	http://redhooklobster.com/	The RedHookLobster will be slinging the best lobstah rolls at @bkflea in Fort Greene, 176 Lafayette Ave bt Clermont&Vanderbilt Ave.	none	 Greene  176 Lafayette Ave bt Clermont & Vanderbilt Ave 	f	none	\N	1397336495	1397313102	\N		4dc597c57d8b14fb462ed076	\N
phils3	Phil's Steaks	philssteaks	http://www.philssteaks.com	Phil's Phriday is here Once Again like the Roots! Make it memorable and get yourself a steak from the jawn. 41st and 6th til 2!	41	 41st and 6th 	f	up		1397219336	1397219336	American		4f15b382e4b0725660ea9f31	\N
frites	Frites 'N Meats	fritesnmeats	http://www.fritesnmeats.com/	Hello FIDI, lunch 2day @ 7 Hanover sq b/t water st & pearl st. Burger of the week THE SMITHLAND preorder 9172929226	Hanover	 7 Hanover sq b / t water st & pearl st  	f	none	\N	1397225253	1397225253	American	This is a good burger but this truck is interesting because of the many toppings they carry and their burger of the week. 	4ae9d217f964a520bcb621e3	\N
greenradish	The Green Radish	thegreenradish1	http://www.thegreenradish.com/	Serving at 17th&5th From 11:00AM Until 2:00PM EDT\nBlack Bean Burgers with Melted Onions, Avocado, Chipolte Mayo.... http://t.co/3rV9MuVTLf	17	 17th & 5th 	f	mid	\N	1397272064	1397228709	Vegan		5229feab11d2edde794d385c	\N
mooshu	Moo Shu	mooshugrill	http://www.mooshugrill.com	Food truck parade on 50th & 6th! Catch us or the highly acclaimed @biandangnyc in the middle of the stack! http://t.co/XHBGgCfn4g	50	 50th & 6th	f	up	\N	1397225135	1397225135	Chinese	Moo Shu grill is a slight twist on typical Chinese <a href="https://en.wikipedia.org/wiki/Moo_shu" target="_blank">moo shu</a> The three Moo Shus option is enough for lunch and you can pick and choose a different protein for each. In my opinion the chicken is the best but it is dark meat. </p><p>It's easy to order as there is one window for ordering and for picking up when your name is called.	52090e45498e5500a6bd41fb	\N
paris	Paris Sandwich	parissandwich	http://www.parissandwiches.com/	Dumbo! Adams and front street today dumbofoodtrucks @DUMBOFoodTrucks	none	 Adams and front str	f	none	\N	1396026389	1382711724	French/Vietnamese		519e4ed0498e4f27e64c177a	\N
mikenwillie	Mike n Willie's	mikenwillies	http://www.mikenwillies.com	47th Street & Park Ave serving lunch.  No meat Friday?  We gotcha covered.  Pea-nocchio  our Chipotle Chickpea... http://t.co/Ze704JkXoS	47	47th Street & Park Ave 	f	up	\N	1397227440	1397227440	TexMex		4f205f0ee4b0294b35a1178b	\N
mexicue	Mexicue	mexicue	http://mexicueny.com	Finally, Spring has sprung in NYC @ Union Square Circle http://t.co/ZvAUIVKgTV	none	Union Sq	f	none	\N	1397325662	1396299489	Mexican		4c51a6a71c67ef3ba6b61ab9	\N
carls	Carl's Steaks	carlssteaks	http://carlssteaks.com/home/	Its a beautiful day in the neighborhood,  it's a beautiful day in the neighborhood! ! UWS 67TH ST & Broadway cheesesteaks for all\nTill 8	67	 67TH ST & Broad	f	up	\N	1397319008	1397319008	American		51a78330498e3fc1f22d771e	\N
burgersn	Trusty Burgers & Bites	burgersandbites	http://www.burgersandbites.com/	West 29th & 11th for a quick breakfast and the lunch we have all grown to love! 6am-2pm let's grow this neighborhood together!	29	 29th & 11th 	f	mid	\N	1393004953	1392895105	American		5170143a498e802b42628e48	\N
wafelMomma	Wafels & Dinges Momma	waffletruck	http://www.wafelsanddinges.com/	Momma Truck @ 7th & Carroll in Park Slope, BK til 4:30p	none	 7th & Carroll in Park 	f	none	momma( truck)? (.*?)(all day|till?|until|\\n|!)	1397338264	1397310447	Belgian		4a416369f964a52036a51fe3	
schnitzel	Schnitzel & Things	schnitznthings	http://schnitzelandthings.com	Another gorgeous day for some schnitz! Stop by the truck on 51st between park and madison from 11:30-2:30pm! Preorder 347-772-7341	51	 51st between park and mad	f	up		1397239212	1397141073	German		4a6640b3f964a5204cc81fe3	(schnitztruck|the truck)
palenque	Palenque	palenquefood	http://www.palenquehomemadecolombianfood.com	Good Morning Dumbo... We Are here @ Water Str & Jay Str... Come join us for your favorite Arepassss...\n;)\n;)\n;)	Water Str & Jay	 Water Str & Jay Str    	f	bkl	\N	1397317789	1397225675	Colombian Fusion		4e84f424dab45bbd2617dc62	\N
freshhearty	Fresh and Hearty	freshandhearty	http://freshandheartynyc.com/	Get your Soup & Panini on with Fresh and Hearty! We parked on 46st btw 5th & 6th ave from 11am to 3pm. Call now 4 free delivery! @3474402467	46	 46st btw 5th & 6th 	f	up	\N	1395241942	1390493878	Soup/Salad/Sandwich		51801f7a90e7374e46b6239f	\N
miamifood	Miami Food Machine	miamimachinenyc	http://www.miamifoodmachinenyc.com/	RT @YouGotSmoked: Park Ave btw 33rd St and 32nd St from 11:00 to 3:00 today! New York Aged Cheddar Mac and Cheese! Delicious nyc http://t...	33	 Park Ave btw 33rd St and 32nd 	t	mid	\N	1389964561	1389964561	Mexican		514b53aee4b00c3e98ec25e9	\N
chipsy	Chipsy King	chipsykingny	http://chipsykingny.com/	Kasar truck is at 50th street and 6th avenue, happy Friday!!!!	50	 50th street and 6th aven	f	up	\N	1397237447	1397237447	Fries		51bb5c43498ee06e13d0d31f	\N
yume	Yume Teriyaki	yumefoodtruck	http://yumeteriyakigrill.com/	Hello, Sunshine! Yume is on Broadway&55th and Junior is feeding FIDI on Hanover&Water. Come out and soak up the sun!	55	 Broadway & 55th and 	f	up	\N	1397143389	1397143389	Japanese	\N	530cdc14498ee06c95ab14e0	\N
craffels	Craffles	crafflesnyc	http://www.craffles.com/	Happy holidays!!!\nMake ur holidays sweet with our delicious crepe or waffles. Our location for today. Hunter college and union square.	none	union sq	f	none	\N	1391926650	1388428190	Crepes		514e426ce4b05bcb261d910e	\N
grillwheels	Grill On Wheels	grillonwheelsny	#	Passover Special! Any sandwich for $10 today. Parked on 46th off 6th.\nHelp us with our Passover cleaning by eating!!	46	 46th off 6th  	f	up	\N	1397231435	1397231435	Kosher		51b0bf31498e9b68db75612c	\N
deliheaven	Deli Heaven	deliheaventruck		@downtownlunch correction we are on king&varick today. The word of the day is amore for ur free upgrade. SoHo get ur deliheaven on	varick	 king & varick   	f	none	\N	1392220340	1392220340	Deli	\N		
shortys	Shortys	shortysnyc	http://www.shortysnyc.com	WFC North---North End Ave & Vesey.  Parked & ready. Cheesesteaks be lookin' good today.	WFC	WFC	f	none	\N	1397231521	1397231521	American		4faea2cce4b08a88c5dc5d05	\N
brooklynpopcorn	Brooklyn Popcorn	brooklynpopcorn	http://brooklynpopcorn.com/	Hello 70th & York we are back! We have our famous Apple Granola Caramel Flavor! A special shout-out to radiology at NewYorkPresbyterian :)	70	 70th & York 	f	up	\N	1397181369	1396539028	Popcorn!		514a0737e4b09c3e77279d83	\N
lukeslobster	Luke's Lobster	nautimobile	http://lukeslobster.com/	Yesterday was National Siblings Day and everyone was talking about it. Today is National Cheese Fondue Day, but nary a peep. 46th & Park	46	 46th & Park	f	up	\N	1397314815	1397223495	Seafood		4dc81239b0fb5556cd2f3023	\N
taim	Taim Mobile	taimmobile	http://www.taimmobile.com/	We're back on 20th/5th with all your favorites 11-3. PLUS we now have Eggplant Salad and Beet Salad on the truck! flatironfalafel	20	 20th / 5th 	f	mid	\N	1397320961	1397139985	Mediterranean		4cf2c5321d18a143951b5cec	\N
blend	Blend	blend_express	http://blen02.wix.com/blendnyc	We will not be parking on HUDSON and KING anymore ....   Hopefully only at least for this year	none	 parking on HUDSON and KING an	f	none	\N	1383317024	1383316855	Latin Fusion		4fa94528e4b0f8fbf13317e6	\N
hh2	Habachi Heaven 2	hibachiheaven	http://www.hibachiheaven.com/	@midtownlunch HH3 is on 47st & Park Ave. @downtownlunch HH2 is on Varick & Charlton tribeca Get ur YumYum & Enjoy ur Weekend	Varick	 Varick & Charlton 	f	none	hh2 is (in|on) (.*?)($|\\.|\\n)	1397314070	1397224666	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	hh2
bigds	Big D's	bigdsgrub	http://bigdsgrub.com/	RT @mrsmariataylor: @bigdsgrub Big D's Grub food cart on 7th/55th duck fried rice fried egg! https://t.co/2dslIvY1wj	55	 7th / 55th 	t	up	\N	1397311228	1397243206	Korean Fusion		4c968b907605199c2eaec2a3	\N
steaksncrepes	Steaks N Crepes	steaksncrepes	http://steaksncrepes.com	50 st bet 6 & 7 ave for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	50	50 st bet 6 & 7 ave for lu	f	up	\N	1397096188	1374766188	American		50f44167e4b0af5bf46321ce	\N
crepestruck	Crepes Truck	thecrepestruck	https://www.facebook.com/thecrepestruck	VictoriaJustice at Uggs Aulstralia on Madison Ave & 58 Street tonight from 6:30pm-8pm	58	 Madison Ave & 58 Str	f	up	\N	1391084755	1383866974	Crepes		4dfb854918386e743d9869e3	\N
sweetery	Sweetery	sweeterynyc	http://sweeterynyc.com	Hudson/King St. we call you our home, however a truck at your location is not a home unless you stop by & bring your warm and joy to us.	none	Hudson / King St  	f	none	\N	1397222811	1397222811	Sweets		4a28d919f964a52056951fe3	\N
mamak	Mamak	lovemamak	http://www.lovemamak.com/	Welcome back with new menu and new price! 21st and 5th ave! Stop by, will be here til 2.30pm http://t.co/fJPUFRXenX	21	 21st and 5th ave	f	mid	\N	1396884033	1395331564	Asian		51c4cffa498ec876f564a0b4	\N
getstuffed	Momos & Buns	getstuffednow	http://www.chinesemirch.com	RT @GoVimbly: Big Apple Barbecue (@bigbarbecue) FastPasses are on sale now for June 7 & 8, 2014! http://t.co/fV8LcnTLWC	none	 7 & 8  2014	t	none	\N	1397307370	1395410436	Chinese Fusion		4fa016cbe4b05d0fc11262c5	\N
bobjo	BobJo	bobjotruck	http://www.bobjo.net	Happy Friday!We r @ varick &king st. We just start new menu for spring  summer : daily limited Rice burger. bibimbap burrito. Swingby&EnJoy	varick	 varick &king st  	f	none	\N	1397229980	1397229980	\N		4e3add0c88772c3bf12772da	\N
morris	Morris Grilled Cheese	morristruck	http://morrisgrilledcheese.com/	TGIF here at @BrookfieldPLNY folks! Open now till 2! comeEAT	brookfieldplny	brookfieldplny	f	none	\N	1397325838	1397231644	American		4e0e0b3caeb7a5b33ee5dac1	\N
toum	Toum NYC	toumnyc	https://www.facebook.com/ToumNYC	RT @DispatchNY: . @BrookfieldPLNY NORTH Lot | Fri., 4/11 | 11a-3pm | North End Ave. & Vesey St. | @SchnitznThings @MorrisTruck @ToumNYC @Sh...	brookfieldplny	brookfieldplny	t	none	\N	1397232551	1397232551	Lebanese		500eedb0e4b062ee00577957	\N
funbuns	Fun Buns	funbunsnyc	http://j24f.com/funbuns/	RT @FoodtoEat: Today's answer to 12DaysofFoodTrucks is @funbunsnyc ! Thx to all those who played and tune in Monday 12/23 for the LAST day!	12	 12 / 23 	t	mid	\N	1396807699	1387576969	Asian		4f8d9663e4b021137aa2bdde	\N
nuchas	Nuchas	nuchasnyc	http://www.nuchas.com	Nuchas truck at spring & broadway until 10pm! Come get your empanada fix http://t.co/xbL1gV0gF6	none	 spring & broad	f	none	\N	1397325659	1397325659	Mexican		4ebd2a9bb8f7b504a754c130	\N
mexicoblvd	Mexico Blvd.	mexicoblvd	http://mexicoblvd.com	It's a sun-shiney day, DUMBO Sunshiny? Nosotros no sabemos. It doesn't matter. Come eat with us in the Water & Jay St lot for lunch today:)	Water & Jay	 Water & Jay St 	f	bkl	\N	1397230169	1397143247	Mexican		4f4e55aee4b04c96fba5b149	\N
carpedonut	Carpe Donut	carpedonutnyc	http://carpedonutnyc.com/	Come get your fresh donuts now on 55th and Broadway, we're here till 1:30pm today!	55	 55th and Broad	f	up	\N	1397321232	1397214398	Sweets	They only server one kind of donut here, the apple cider, but it's a pretty good one. They are fresh and still hot when you get them. They have donut ice cream sandwiches but you should know the entire thing is in the freezer so you will get a frozen donut as well.	5169892c498e0522481eea97	\N
biandang	Bian Dang	biandangnyc	http://www.biandangnyc.com/	Parked on 50th btwn 6/7th with Moo Shu Grill! http://t.co/zI638sQv7O	50	 50th btwn 6 / 7th 	f	up	\N	1397218725	1397218725	Taiwanese		4d712874722ef04d04160d9c	\N
korilla	Korilla BBQ	korillabbq	http://korillabbq.com	RT @ColumbiaComDev: Don't go hungry while at throwbacchanal. Enjoy some @KorillaBBQ & some @elpasony. Yummmm!!!!		@Columbia	t	up	\N	1397335138	1397322951	Korean Fusion		4cc701aa01fb236ab070baba	\N
rickshaw	Rickshaw Truck	rickshawtruck	http://www.rickshawdumplings.com/	Starrett! You are in luck! Danny is on his way to make your dumpling day! 26+11av	26	 26 + 11av	f	mid	\N	1386710979	1384441694	Asian		43fc8419f964a520ed2f1fe3	\N
chefsamir	Comme Ci, Comme Ca	chefsamirtruck	http://www.chefsamirtruck.com	We are on Broadway at the corner of 55st	55	 Broadway at 55st	f	up	\N	1397229796	1397229796	Moroccan		4c3c85e3a9509c74b52e395b	\N
gorilla1	Gorilla Cheese 1	gcnyc1	http://www.gorillacheesenyc.com/	Happy Friday Yo....\nG1- 46 5/6\nG2- Rockin a Film Shoot.\nTurkey, Muenster, Tots Bacon Gravey Melts... http://t.co/hEQDlX1jEU	46	 46 5 / 6 	f	up	g1(.*?)(\\n|g2)	1397246194	1397223632	American		4dc2d3e352b1c1fb37f1e945	\N
kimchitaco	Kimchi Taco	kimchitruck	http://kimchitacotruck.com/	Good grief. Everyone needs to be out sunning & taco-ing. 55th St. bet. 6th & 7th Ave.	55	 55th St  bet  6th & 7th Ave 	f	up	\N	1397239766	1397238732	Korean Fusion		4d6ee122b45b59417c6a6778	\N
disos	DiSO's	disosnyc	http://www.disosnyc.com/	Open for lunch.. Wall and water st.\n\nCall in orders to: 917-756-4145	Wall	 Wall and water st   	f	none	\N	1397313470	1397230507	Italian Sandwiches	These might be typical italian sandwiches but the ingredients are high quality. You need to get there early because the line can get long and they will run out of some breads. I believe the focaccia half is a normal portion for lunch while their half and hero sizes are pretty big.	519523d6498eeaa6200aad03	\N
mactruck	MacTruck	mactruckny	http://MacTruckNYC.com	Good morning Broadway!!! Between 55/56 for your lunch time pleasure!!	55	 Broadway!!! Between 55 / 56 	f	up	\N	1397133656	1397133656	American	Looking to take a nap after lunch? This truck is great and the owner is incredibly friendly. Feel free to chat it up while you watch him prepare your food.  Not listed on the menu are the many condiments\\n you can get on your macaroni. The regular size is a good portion for a normal lunch.	50575ab8e4b04ed4f2197dac	\N
sweetchili	Sweet Chili	sweetchilinyc	http://sweetchilinyc.com/	Come say goodbye to our truck betty!  Jay and Water till 3 ish http://t.co/yyN2RHTaQe	Jay and Water	 Jay and Water 	f	bkl	\N	1397337216	1395155679	Asian		51a8c802498e2165ca855a19	\N
tacobite	Taco Bite	tacobite	http://www.tacobite.com/	RT\nServing Lunch today on \n47th st bet Park & Lex\nCall in advance for pickup \n@ 347~70T~BiTE	47	 47th st bet Park & Lex 	t	up	\N	1397334602	1397230007	Mexican		503ba49ae4b0fad35eb7a8dc	\N
dubpies	DUB Pies	dubpies	http://www.dubpies.com/	PieTruck is in Hanover Square serving savory pies, sweets and flat whites until 2.30pm FinancialDistrict	Hanover	Hanover Square	f	none	\N	1397333912	1397227542	New Zealand meat pies	\N	4eb825a62c5b53141b78bfb6	\N
goburger	GO Burger	goburger	http://www.goburger.com	What's your favorite Carol King song? Let us know in the comments and you could win 2 tickets to Friday night's... http://t.co/2Qa0cMwtYL	none	 King song? Let us know in the comments and you could win 2 	f	none	\N	1396028457	1395875529	American		4c06b3eccf8c76b0a4eb3a65	\N
snowday	Snowday	snowdaytruck	http://snowdayfoodtruck.com/	Find us next in DUMBO this Friday from 5 - 8:30pm at Jay and Water St! dumbonyc dumbofoodtrucks nycfoodtrucks http://t.co/BuYJWdL7VT	Jay and Water	 Jay and Water St! 	f	bkl	\N	1397303152	1397140234	Comfort	\N		\N
seoul	Seoul Food	seoulfoodnyc	http://www.seoulfoodnyc.com	Come to 51st street, between Park and Madison - it's lunch time!!	51	 51st street  between Park and Mad	f	up	\N	1392220033	1392220033	Asian		4e74afad88775d593d9a7eb5	\N
elpaso	El Paso Truck	elpasotruck	http://elpasony.com/	It's TACO TUESDAY at 97st and Columbus Ave tacotuesday tacotruck	97	 97st and Columbus Ave 	f	up	\N	1396383521	1396383521	Mexican	\N	523c911f04937624937304c5	\N
schnitzelcart	Schnitzel & Things Cart	schnitznthings	http://schnitzelandthings.com	TGIF!! Come finish off the week strong at the Schnitzcart! We'll be on 49th st b/w 6th & 7th from 11:00-2:00pm. Hope to see you soon!	49	 49th st b / w 6th & 7th 	f	up	\N	1397239212	1397224366	German	\N	4a6640b3f964a5204cc81fe3	(schnitzcart|the cart)
toastmonster	Toast Monster	toastmonsternyc	http://www.toastmonsternyc.com/	Hello Rice bowl fans. Have your beef or chicken teriyaki rice bowl with a miso soup for only $8!! stopplaying notplaying forreal 50th/6th	50	 50th / 6th	f	up	\N	1396724832	1386864511	American		50ad1829e4b087613d696bc4	\N
itizy	Itizy Ice Cream	itizyicecream	http://www.itizy.com/	Likely our last three hours at Columbia this year! Come grab a scoop of your favorite flavor before it runs out!	none	Columbia	f	none	\N	1382307419	1382122482	Sweets		4fcbdcaae4b00a0e855124dd	\N
cinnamonsnail	The Cinnamon Snail	veganlunchtruck	http://www.cinnamonsnail.com/	RT @VendorPower: Come talk good food and good jobs in public space this Friday 4/11 w/ @MMViverito @foodchainworker @VeganLunchTruck https:...	11	 4 / 11 	t	mid	\N	1397332555	1396893366	Vegan		4c263af6a852c9287537e66c	\N
mrnice	Mr Nice Guy	mrniceguytruck	http://mrniceguynyc.com	RT @MitchieGadgets: Spring is officially here now! @MrNiceGuyTruck is back and in front of my office! soexcited	none	 Spring is officially here now! @MrNiceGuyTruck is back and in front 	t	none	\N	1397239877	1397239392	American		520bbbb211d26afae232ec59	\N
wingit	Wing'n It	wingnitnyc	http://www.wingnitnyc.com/	Out here on 23rd and 5th come and grab some wings for lunch today. We will be open from 10am to 3pm. See you guys at lunch.	23	 23rd and 5th 	f	mid	\N	1390923947	1387549355	American		519ffd2b498ededbeef3c073	\N
neapolitan	Neapolitan Express	neaexpress	http://neapolitanexpress.com/	We are open for lunch on 52nd and park!	52	 52nd and park	f	up	\N	1397231924	1397230198	Pizza		51c8864c498e0ac96c14433e	\N
milktruck	Milk Truck	milktrucknyc	http://www.milktrucknyc.com	nat'l grilled cheese day! come celebrate. @smorgasburg @bkflea ft. greene. bessie at chambers & greenwich. always @houstonhallnyc.	none	 greene  bessie at chambers & greenwich  always @houston	f	none	\N	1397313948	1397313948	American		4e823c0229c2dbb2b7043972	\N
wafelKastaar	Wafels & Dinges Kastaar	waffletruck	http://www.wafelsanddinges.com/	Momma Truck @ 49th & 6th till 4:30p Kastaar @ 40th & Park till 4:31p	40	 40th & Park 	f	up	kastaar( truck)? (.*?)(all day|till?|until|\\n)	1397338264	1397225526	Belgian		4a416369f964a52036a51fe3	\N
shanghai	Shanghai Sogo	shanghaisogo	http://www.shanghaisogo.com/	Park Slope, Asian Tapas Truck @ 7th ave & President st, BK til 4:30p, you know how good it is!	none	Park Slope  Asian Tapas Truck @ 7th ave & 	f	none	\N	1397329026	1397329026	Asian		5258369d498e13def2bef2cb	\N
mausam	Mausam	mausamnyc	http://www.mausamnyc.com	Happy Friday Mausam curry king @55 Str and\nBway. No one beats our authentic Indian flavors	55	 king @55 Str and Bway  	f	up	\N	1397225956	1397225956	Indian		50730eebe4b0f3224431dc5d	\N
pocketful	The Pocketful	thepocketful	http://thepocketful.com/	Located on 50th between 6th and 7th.  Stop by and sample our Greek Yogurts.	50	 50th between 6th and 7th  	f	up	\N	1397221789	1397221789	Mediterranean		4db8bcd790a0e3f61d601888	\N
yougotsmoked	You Got Smoked	yougotsmoked	http://yougotsmoked.com/	\N	\N	\N	\N	\N	\N	1391042241	\N	BBQ Mexican	\N	52b1d83a498e60c55497bea0	\N
phils0	Phil's Steaks Big Jawn	philssteaks	http://www.philssteaks.com/	It's Phil's Phriday! \nOG Jawn: 51st n Park\nBig Jawn: 41st btw 6th n 7th\nGet Your Phil!	41	 41st btw 6th n 7th 	f	up	big( jawn)?( in|:| ?-| is on| on) (.*?)(\\n|$|!|\\.)	1397219336	1387554094	American		4f15b382e4b0725660ea9f31	\N
gorilla2	Gorilla Cheese 2	gcnyc1	http://t.co/4ZDqfwSH5f	Happy Thursday\nG1- Fidi. . Hanover water / pearl. \nG2- 49th / 6\nComeToTheCheeseYo	49	 49th / 6 	f	up	g2(.*?)(\\n|$|#)	1397246194	1397138049	American		4dc2d3e352b1c1fb37f1e945	\N
valduccis	Valduccis	valduccis	http://valduccis.com	50th&6th \nCome check out the panini !delicious !	50	50th & 6th  	f	up	\N	1397334860	1397144673	Pizza		4df7e1aad4c02ad734170b21	\N
mamuthai	Mamu Thai Noodle	mamuthainoodle	https://www.facebook.com/MamuThaiNoodle	WFC North End! It's spring again! Noodles for lunch?! Get it hot&fresh! 11-3 @BrookfieldPLNY @downtownlunch	WFC	WFC	f	none	\N	1397162610	1397054935	Thai		5126a10ae4b0af674c85f353	\N
treats	The Treats Truck	thetreatstruck	http://www.treatstruck.com	!!! Sat, April 12th no truck today! Our shop open 8am-7pm w/food & treats!! 521 Court st carrollgardens brooklyn treats !!!	12	 12th no truck ! Our shop open 8	f	mid	\N	1397302287	1397302287	Sweets		49e65021f964a52035641fe3	\N
steelcart	The Steel Cart	thesteelcart	http://www.thesteelcart.com/	The Weekends opening ceremonies under way here on Front & Jay with Mushroom Barley, Navy Bean & Cream of Broccoli soup. @DUMBOFoodTrucks	Front & Jay	 Front & Jay 	f	bkl	\N	1397224097	1397224097	French		511d3abee4b0e188895f3697	\N
domo	Domo Taco	domotaco	http://www.domotaco.com	Its a gorgeous day and we're open on 49th and 6th for your Friday taco fix!	49	 49th and 6th 	f	up	\N	1397250950	1397229300	Asian Fusion		4ed90a2e77c8274efb746d83	\N
polish	Old Traditional Polish Cuisine	polishcuisine	https://www.facebook.com/pages/Old-Traditional-Polish-Cuisine/315496671902708	Rockin' the pierogi truck on 5th avenue & 21st street - ready for lunch pierogitime @nycfoodtruck	21	 5th avenue & 21st str	f	mid	\N	1397329981	1397228554	Polish		51435df4e4b0823a398ebc8a	\N
dels	Del's	delsnyc	http://instagram.com/delsnyc	RT @DUMBOFoodTrucks: You may have seen the @delsnyc truck around DUMBO this summer - help them raise $ for another one on @kickstarter! htt...	DUMBO	Dumbo	t	bkl	\N	1393515511	1383928941	Sweets		519bb56b498ed2dfa950ace2	\N
hh3	Habachi Heaven 3	hibachiheaven	http://www.hibachiheaven.com/	@midtownlunch HH3 is on 47st & Park Ave. @downtownlunch HH2 is on Varick & Charlton tribeca Get ur YumYum & Enjoy ur Weekend	47	 47st & Park Ave  	f	up	\N	1397314070	1397224666	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	hh3
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
Phil's Phriday is here Once Again like the Roots! Make it memorable and get yourself a steak from the jawn. 41st and 6th til 2!	1397219336	454596964211253249	f	philssteaks
The jawn is open at W. 4th and Greene - slangin steaks til 8, come thru!	1397157396	454337169176682496	f	philssteaks
Morning kids! Got a hunger today that can only be tamed by delicious cheesesteaks? No problemo! 52nd and 6th - Breakfast til 11, lunch til 2	1397135109	454243688282333184	f	philssteaks
RT @ChoiceEats: Met up with @PhilsSteaks earlier. It's a great day when you eat a gorgeous piece of meat from a truck. http://t.co/pzehd6ig...	1397106076	454121915909955584	f	philssteaks
Steaks are in session! W. 4th and Greene til 8	1397072768	453982212795662337	f	philssteaks
@626carmel 41st and 6th til 2 then W.4th and Greene 3-8	1397063097	453941646900887553	f	philssteaks
RT @FoodtoEat: Sun &amp; Steak = Amazing. Get some Phils today .@PhilsSteaks in #Midtown. Click here to preorder online: http://t.co/Hyn6Yu4VPV...	1397058849	453923831032590336	f	philssteaks
RT @magoon: For an awesome breakfast, order a "Whiz Wit" -- authentic philly cheesesteak w/ 2 eggs! @PhilsSteaks	1397058805	453923646864904192	f	philssteaks
Sorry for the late post! This whiz Wednesday you'll find the jawn on 41st and 6th til 2. Get your Phil!	1397056935	453915805202530304	f	philssteaks
Celebrate the spring weather with steaks from the jawn. W. 4th and Greene til 8pm!	1396985585	453616537581391872	f	philssteaks
RT @starrett601: Stop by @PhilsSteaks on 26th St. for breakfast &amp; lunch today. This week's line up at http://t.co/IcPJlHNQR7	1396968963	453546819822579713	f	philssteaks
Hey Starrett-Lehigh we are back! Come down to the jawn for mouthwatering steaks and twice-fried fries! 26th and 11th til 2! @starrett601	1396966420	453536157843087361	f	philssteaks
RT @bigbo1975: @PhilsSteaks what because I'm a big dude I'm gonna add you lol Damn right I am! Food looks great! I looooves me some steak n...	1396913159	453312761028952065	f	philssteaks
41st and 6th today. Breakfast til 11 and lunch til 2!	1396876250	453157953479401472	f	philssteaks
Spring is back and so is the @prospect_park #foodtruckralley !!! Grand Army Plaza today 11-5. #brooklyn @dispatchny #getyourphil	1396790584	452798644887257089	f	philssteaks
@danishmarie @beamer87 was getting very crowded with other trucks where we parked and there is more demand in midtown	1396619823	452082422323372032	f	philssteaks
@RedskinsST21 41st and 6th til 2!	1396619703	452081917643718656	f	philssteaks
Happy Phil's Phriday NYC! The jawn is on 41st and 6th slanging steaks til 2. Come get your Phil!	1396619168	452079674643218433	f	philssteaks
@Sdizzle87 glad we can give you a little piece of home with our slang. Come by soon so you can taste home!	1396562858	451843495683432449	f	philssteaks
RT @Sdizzle87: @PhilsSteaks I appreciate your use of the word jawn. I miss hearing it daily. I heard your steaks are awesome. Can't wait to...	1396562790	451843206863663104	f	philssteaks
Friday: varick and king until 3p. Try our chipotle chicken sandwich http://t.co/ylOBAPkF3H	1397220303	454601017309409281	f	eddiespizzany
Chipotle #chicken #hero Friday: varick and king http://t.co/GjwXVwylv7	1397220102	454600173411639296	f	eddiespizzany
Happy Thursday: we are near 10 Hanover downtown. #fidi http://t.co/pWWFDDg6Ho	1397137936	454255544295903232	f	eddiespizzany
Happy Thursday: we are near 10 Hanover downtown. #fidi http://t.co/oY4AMIAGeR	1397137931	454255526273372160	f	eddiespizzany
Eddies got the #1 spot in the 5 best meals ever had at a bar!!!!! http://t.co/pWzxehnAfC	1397059048	453924666692739073	f	eddiespizzany
Baked ziti pizza special this week. Wednesday: 46th between 5th and 6th http://t.co/I4BVDhzm5g	1397052739	453898203243364352	f	eddiespizzany
Baked ziti pizza special this week. Wednesday: 46th between 5th and 6th http://t.co/zjRiEK6JEf	1397052735	453898189197025280	f	eddiespizzany
Tuesday: World financial center north end ave roasted portobello #sandwich http://t.co/VwRgbiGSJ7	1396962829	453521092268027904	f	eddiespizzany
Tuesday: World financial center north end ave roasted portobello #sandwich @ Brookfield Place New York http://t.co/s9pzav3EPL	1396962827	453521083791331329	f	eddiespizzany
This Weeks Schedule (April 7-April 11) - Lunch 11AM-3PM\nMonday: 26th btwn 11th/12th \nTuesday: Brookfield Place -... http://t.co/4r9FscjCfZ	1396827117	452951877345640448	f	eddiespizzany
RT @TakumiTacoNY: Come visit us today at smorgasburg pier 5 @ Brooklyn Bridge Park (Pier 5) http://t.co/pRlQ3NI5bb	1396800268	452839264129409024	f	eddiespizzany
Thursday: near 10 Hanover downtown. #fidi http://t.co/A3tPA9TD0p	1396537587	451737501011423232	f	eddiespizzany
Thursday: near 10 Hanover downtown. #fidi http://t.co/O0VZZD5dQG	1396537583	451737483626434560	f	eddiespizzany
Wednesday: 46th between 5th and 6th. #eddiespizzany http://t.co/FPDA2xASYg	1396453066	451382992972550145	f	eddiespizzany
Wednesday: 46th between 5th and 6th. #eddiespizzany http://t.co/FFOgLaH8M6	1396453063	451382981723426817	f	eddiespizzany
World financial center TUESDAY until 3p http://t.co/OujZIFY5Hr	1396366097	451018220477362177	f	eddiespizzany
World financial center TUESDAY until 3p @ Brookfield Place New York http://t.co/tcoOBvGDGJ	1396366096	451018214856986624	f	eddiespizzany
Weekly special: white pie with shortrib, onions, peppers, and chipotle aioli http://t.co/eOJmM5VVSv	1396279417	450654654909919232	f	eddiespizzany
Weekly special: white pie with shortrib, onions, peppers, and chipotle aioli @ Starrett-Lehigh http://t.co/CX40CHM1O8	1396279413	450654641286836224	f	eddiespizzany
This Weeks Schedule (March 31-April 4) - Lunch 11AM-3PM\nMonday: 26th btwn 11th/12th \nTuesday: Brookfield Place -... http://t.co/fQSSxebKoN	1396217082	450393203812753408	f	eddiespizzany
Happy Friday NYC. Celebrate the weekend w #lobstah. #bigred is chilling at 46th &amp; 6th. Open at 16 Extra Place 11-9!	1397222556	454610466606948354	f	lobstertruckny
Congratulations to @GuerrillaStreet for winning the Munchies as well as @FojolBros @EastSideKingATX @Biggayicecream, you're all winners!	1397156539	454333574679130112	f	lobstertruckny
Ahoy NYC! The #RedHookLobsterPound's #BigRed will be docked at 55thSt &amp; Broadway for all your crustacean cravings!	1397138113	454256288223219712	f	lobstertruckny
@NYTimes mentions #RedHookLobsterPound's newest lobster pound at 16 Extra Place in Manhattan: http://t.co/6gRrY0FyeU	1397064697	453948360505180160	f	lobstertruckny
Spring has sprung, celebrate like a Mainer with a #RedHookLobsterPound lobster roll! #BigRed is parked on 51st St &amp; Park Avenue	1397051707	453893875904819200	f	lobstertruckny
RT @nycfoodtruck: Yummy NYC Food Trucks: http://t.co/kQ7p7fs6lg via @BuzzFeed &amp; @allysterrr w/ @MilkTruckNYC @LobsterTruckNY @Mexicue @Kelv...	1397047704	453877084512071680	f	lobstertruckny
@Hot97AmShow's @Rosenbergradio enjoys a #RedHookLobsterPound lobster roll. Holla! http://t.co/tZmrGPESVs	1396984426	453611679709138944	f	lobstertruckny
#BigRed has a new spring menu featuring Elote con Langosta! Roasted sweet corn, queso cotija and lobster! http://t.co/Si7AfZCRtG	1396971025	453555471962894336	f	lobstertruckny
#BigRed will be servin' the best lobstah rolls on 50th &amp; 6th Ave, get outside in this beautiful Maine weathah! #RedHookLobster	1396965333	453531594910076928	f	lobstertruckny
Dishing out #crustaceanelation @smorgasburg pier 4 bridge park. Red\nHook Lb Extra place manhattan lobstore &amp; grand army plaza #parkslope	1396800636	452840805271879680	f	lobstertruckny
RT @nycfoodtruck: The Prospect Park Food Truck Rally starts right NOW! Come hang out and enjoy the day with fellow food truck... http://t.c...	1396800432	452839952595054592	f	lobstertruckny
It's the first Prospect Park truck rally of the year. We have lobster rolls and more at Grand Army Plaza today from 11 to 5.	1396799709	452836920083877888	f	lobstertruckny
Lets celebrate spring together w/ a lobster roll @smorasburg http://t.co/pjfSmQZN46	1396794636	452815640467111936	f	lobstertruckny
The #RedHookLobsterPound's #BigRed will be slinging lobster-liciousness @RoyalPalmsClub Saturday night 6:00 - Close	1396728135	452536715639795712	f	lobstertruckny
WHAT A DAY to re-open @bkflea in Ft Green and @smorgasburg in Williamsburg! Open in Red Hook and Manhattan too!! #sunshinedayream...	1396708364	452453789786980352	f	lobstertruckny
#RedHookLobsterPound will kickin' off the spring @smorasburg and @bkflea this weekend http://t.co/pjfSmQZN46 http://t.co/OCy0xpKWfP	1396708276	452453422756007936	f	lobstertruckny
A few more double unders then this lobster is heading to @SMORGASBURG @BKFLEA and our new cafe at 16 Extra Place to celebrate with an...	1396700848	452422264307601409	f	lobstertruckny
RT @nycfoodtruck: The 1st #FOODTRUCK RALLY of 2014 is happening this Sunday, 4/6, at @Prospect_Park's #GrandArmyPlaza! http://t.co/LX09wMJr...	1396700717	452421714795040768	f	lobstertruckny
Are you making your weekend plans yet? Visit us at the @smorgasburg or @bkflea! http://t.co/pjfSmQZN46 http://t.co/OCy0xpKWfP	1396636514	452152428180553728	f	lobstertruckny
Hello NYC! #BigRed will be serving the city's best lobster roll on 46th St &amp; 6th Ave. T.G.I.Lobster!	1396619735	452082053434327040	f	lobstertruckny
Hello FIDI, lunch 2day @ 7 Hanover sq b/t water st &amp; pearl st. Burger of the week THE SMITHLAND preorder 9172929226	1397225253	454621778355429376	f	fritesnmeats
RT @DispatchBP: . @BrookfieldPLNY NORTH Lot | Thurs., 4/10 | 11a-3pm | North End Ave. &amp; Vesey St. | @NuchasNYC @MilkTruckNYC @Palenquefood ...	1397141524	454270596416028672	f	fritesnmeats
RT @DispatchNY: . @BrookfieldPLNY NORTH Lot | Thurs., 4/10 | 11a-3pm | North End Ave. &amp; Vesey St. | @NuchasNYC @MilkTruckNYC @Palenquefood ...	1397141518	454270571917082624	f	fritesnmeats
Lunch 2day @ the wfc food truck lot on north end &amp; vesey. Burger of the week THE SMITHLAND preorder 9172929226	1397140891	454267938825338880	f	fritesnmeats
Hello soho, lunch 2day @ Hudson &amp; king. Burger of the week THE SMITHLAND preorder 9172929226	1397052324	453896464625041409	f	fritesnmeats
Hello FIDI, lunch 2day @ 10 Hanover sq b/t water st &amp; pearl st. Burger of the week THE SMITHLAND preorder 9172929226	1396965921	453534064587583489	f	fritesnmeats
Lunch 2day @ 50th st b/t 6th &amp; 7th av. Burger of the week THE SMITHLAND. Preorder 9172929226 #midtown	1396879454	453171394755715072	f	fritesnmeats
RT @justyniak: Ugh never attached the picture. Here my lunch @fritesnmeats  http://t.co/1wxWe9cczn	1396657057	452238592019271680	f	fritesnmeats
@justyniak it's been a while. Have a great weekend!	1396643671	452182447183364097	f	fritesnmeats
Hello FIDI, lunch 2day @ 7 Hanover sq b/t water st &amp; pearl. Burger of the week THE AO TRUFFLE BURGER. Preorder 9172929226	1396619604	452081503183601664	f	fritesnmeats
Peeps we r off the road today!	1396533825	451721718995111936	f	fritesnmeats
Hello soho, lunch 2day @ Hudson &amp; king. Burger of the week THE AO TRUFFLE BURGER. Preorder 9172929226	1396449163	451366623472271360	f	fritesnmeats
Lunch 2day @ 10 Hanover sq b/t water st &amp; pearl st. Burger of the week THE AO TRUFFLE BURGER preorder 9172929226	1396360577	450995064404471808	f	fritesnmeats
Hello Midtown, lunch 2day @ 50th st b/t 6th &amp; 7th av. Burger of the week THE AO TRUFFLE BURGER preorder 9172929226	1396274199	450632770717777920	f	fritesnmeats
@CpOrenaRecords  sorry for the response. We r off the road sat and Sundays.	1396202219	450330865433071616	f	fritesnmeats
Hello FIDI, lunch 2day @ 7 Hanover sq b/t Water st &amp; pearl st. Burger of the week THE PLOUGHMAN preorder 9172929226	1396013637	449539892922818561	f	fritesnmeats
Lunch 2day @ the WFC food truck lot on north end &amp; vesey st. Burger of the week THE PLOUGHMAN preorder 9172929226	1395930927	449192981296594944	f	fritesnmeats
RT @joeszulee: @fritesnmeats has the best burgers &amp; perfect fries! Perfect for #humpday lunch! http://t.co/Ep1i5LejIT	1395880837	448982891281018880	f	fritesnmeats
Hello soho, lunch 2day @ Hudson &amp; king. Burger of the week THE PLOUGHMAN preorder 9172929226	1395842755	448823162374213633	f	fritesnmeats
@bearjewslava sorry bud, c u Friday.	1395770302	448519271594094592	f	fritesnmeats
RT @JLKNYC: BIG thank you to @thegreenradish1 and #ChefJamesRafferty for the delish lunch!!  #thegreenone #kalequinoia and #todiefor #Donar...	1397272064	454818119975198720	f	thegreenradish1
Serving at 17th&amp;5th From 11:00AM Until 2:00PM EDT\nBlack Bean Burgers with Melted Onions, Avocado, Chipolte Mayo.... http://t.co/3rV9MuVTLf	1397228709	454636275346464768	f	thegreenradish1
Eat the Rainbow @17th&amp;5th #Spicy Tempeh Wrap, red&amp;green marinated cabbage Parsley Dressing @Gap @GayleKing @nypost http://t.co/Qd0skjnVls	1397228390	454634939653554176	f	thegreenradish1
Have you tried the Slaw? You can today @17th&amp;5th, 11to2pm @villagevoice @TimeOutNewYork @nypost @Gothamist @Oprah http://t.co/3rV9MuVTLf	1397212930	454570095415922688	f	thegreenradish1
Hey Downtown (17th&amp;5th) we'll have your #veganlunch tomorrow, Friday, come and show G-Rad some #love. The... http://t.co/GxznulEHza	1397174021	454406897735450624	f	thegreenradish1
RT @BittersweetNJ: Finally got to try the #Donart from the fabulous @thegreenradish1 It's a little slice of heaven! http://t.co/71JP3Qadho	1397170061	454390287792877569	f	thegreenradish1
RT @vrao517: @thegreenradish1 Your Asian BBQ tofu sandwich makes me feel things I never thought a sammie w/o cheese &amp; mayo could make me fe...	1397153969	454322794546077697	f	thegreenradish1
KALE YEAH!!! @bobbinrown @GayleKing @Oprah @rqui @howardstern @nypost @villagevoice  @RollingStone  @TimeOutNewYork http://t.co/8mivNf6dfD	1397138017	454255885511311360	f	thegreenradish1
Have you tried our #Donart ? @GayleKing has @RollingStone @rqui @charlesschwab @creditagricole @ubs @cbs @nypost http://t.co/kvDtYISDRz	1397128873	454217533504376832	f	thegreenradish1
Have you tried the Farmer's Market Salad, "The Classic" Black Bean Burger w/Melted Onions &amp; Chipolte Mayo or the... http://t.co/4kHw4iU7hx	1397127416	454211422478548992	f	thegreenradish1
@PPTCHELSEA Thursday 52&amp;6th Ave. 11to2pm Hope you can make it!	1397126412	454207209321562112	f	thegreenradish1
Another Day, Another Ticket, Food Truck Life... http://t.co/G95Q9nNZOI	1397125933	454205200094728192	f	thegreenradish1
RT @highestyield: @thegreenradish1 that salad is amazing. Hoping you have it again.	1397093265	454068184090693632	f	thegreenradish1
RT @lizziecbuckley: Most delicious lunch ever!! how did I not know about @thegreenradish1 ?! #healthyanddelicious	1397093054	454067298631163905	f	thegreenradish1
RT @pakoonis: Oh hey @thegreenradish1 I'm both thrilled and sorry that I tried your #donarts today. They're (almost) too delicious.	1397093039	454067232759230465	f	thegreenradish1
@rqui Robin-Have you tried our Black Bean Burgers with Melted Onions&amp;Chipolte Mayo? We are #Vegan #Organic #Delish @GayleKing loves #Donarts	1397041792	453852288558571521	f	thegreenradish1
JapaneseTV filming #Donarts today @thegreenradish1 @nypost @villagevoice @NYMag @nytimes @GayleKing @Oprah @rqui @howardstern @robertAbooey	1397041189	453849760072732672	f	thegreenradish1
Kale&amp;Quinoa Salad, Artichoke Pasta w/Fennel Crusted Eggplant, Steamed Broccoli, Spicy Red Pepper&amp;Tomato Sauce #veganlunch 38th@Bway 11to2pm	1397040522	453846960970428416	f	thegreenradish1
Afraid to go back to the Cronut?  Try a #Donart... http://t.co/nP3e0Xx7VS	1396991359	453640757367164928	f	thegreenradish1
RT @dalvarad: "I can taste the vegetables!" -coworker, upon tasting a #vegan donart for the first time. They were a hit, thanks @thegreenra...	1396990935	453638978978082816	f	thegreenradish1
Food truck parade on 50th &amp; 6th! Catch us or the highly acclaimed @biandangnyc in the middle of the stack! http://t.co/XHBGgCfn4g	1397225135	454621283796660225	f	mooshugrill
@Tweat_It Thx, but we just like shouting you out!	1397225019	454620800365371392	f	mooshugrill
Open on 46th &amp; 6th! Listen for the #slowjamz comin off the truck:)	1397143764	454279988364451840	f	mooshugrill
Sorry for the typo we're here on 46th &amp; 6th today!	1397129120	454218568293695488	f	mooshugrill
@phatdo we're back on 45th today but keep an eye out for us there on Friday!	1397127762	454212875276783616	f	mooshugrill
Back at it on 45th &amp; 6th today! @Tweat_It	1397127749	454212820222349313	f	mooshugrill
Slingin it on 45th &amp; 6th on this gorgeous day!	1397053225	453900242174611456	f	mooshugrill
Whew these blocks are hot! Couldn't get our usual spot so we're here on 45th st &amp; 6th ave today! @Tweat_It	1397043217	453858267186614272	f	mooshugrill
50th &amp; 6th today! We brought out extra #porkbelly but something tells me it's still gonna go quick!	1396967471	453540564831850496	f	mooshugrill
It's good to be back in @dumbolot! Catch us on the corner of Jay &amp; Water st today!	1396877953	453165097813540865	f	mooshugrill
The girls from @biandangnyc really know how to dress! #vscocam #swagu #hoodieweather http://t.co/kGhkGrdqSf	1396625225	452105079873880064	f	mooshugrill
Posted up on 50th &amp; 6th behind the cats from @biandangnyc today!	1396623159	452096416010485760	f	mooshugrill
RT @JoeHinden: @mooshugrill This five spice pork rice bowl is killer!! You guys rock!	1396561403	451837392123858945	f	mooshugrill
@TheRakker Every Thursday! Thanks for stopping by!	1396561393	451837348855418880	f	mooshugrill
@MatthewPizzulli thought we were missing someone today! Catch you next week!	1396561342	451837134442610688	f	mooshugrill
All #soldout on 46th &amp; 6th! Thanks for the love nyc that was nuts!	1396548491	451783232561086464	f	mooshugrill
Gearing up for a beautiful day on 46th &amp; 6th!	1396536255	451731914874167296	f	mooshugrill
Gearin up for a beautiful day on 55th &amp; Broadway! @randomfoodtruck @midtownlunch	1396443953	451344771299430401	f	mooshugrill
RT @ChoiceEats: Can't wait to have @LoveMaMak @MooShuGrill @SweetChiliNYC at #ChoiceStreets! We wish you were parked outside our office eve...	1396443890	451344504222924800	f	mooshugrill
It's our man Pat's last day on the truck. Come say peace out on 50th &amp; 6th! #peaceandmooshus http://t.co/yj7XVf6Qqr	1396363466	451007185204826112	f	mooshugrill
RT @FoodtoEat: Our friends at @getnomi couldn't wait to eat so they started unloading themselves! @ParisSandwich #catering #nyc http://t.co...	1396026389	449593380977541121	f	parissandwich
#parissandwich #loveparissandwich http://t.co/M4jqLbaG0J	1394307460	442383667793772544	f	parissandwich
RT @FoodtoEat: @bigdsgrub @ParisSandwich @Porchettanyc The #FoodtoEat #AcademyAwards Presents the Nominees for Best Super Hero http://t.c...	1393255423	437971104314171392	f	parissandwich
http://t.co/1U7R9R66fZ	1389895042	423876645515427840	f	parissandwich
@castingqueenny shoot us an email at parissandwich@gmail.com would love to hear from you. Thank you	1389368638	421668747657490432	f	parissandwich
@seekayou it's one of our new spots we will try to be there every Thursday. Sometime difficult because of law enforcement	1387469525	413703292196491265	f	parissandwich
Come to our Mott st location for a hot bowl of home cooked pho on this chilly day! http://t.co/vXlFwDskGv	1386444643	409404624450621442	f	parissandwich
Come try our Our BBQ Pork sandwich today on our fresh baked baguette baked hourly! http://t.co/L5AO4cJvPG	1384444210	401014198970634240	f	parissandwich
RT @THEOUTNET: New Yorkers, head to one of @AlexanderWangNY's favorite lunch stops @ParisSandwich for a traditional Vietnamese sandwich! #N...	1384282254	400334907878436864	f	parissandwich
@jbakernyc thank you! We will again this week.	1383682286	397818457640943616	f	parissandwich
@thariorising sorry. We will no longer be in dumbo until spring comes in. But if your ever in the neighborhood stop by 213 grand st.	1383682230	397818222592143360	f	parissandwich
Dumbo! Adams and front street today #dumbofoodtrucks @DUMBOFoodTrucks	1382711724	393747628259049473	f	parissandwich
It was a pleasure serving the team at http://t.co/9piXWhPBfb today #loveparissandwich #parissandwiches #fabdotcom... http://t.co/i0xyo8wGmw	1382024489	390865154684243968	f	parissandwich
Great way to celebrate National Boss Day with Paris Sandwich catered lunch! #nationalbossday... http://t.co/jxLqcMpeQT	1381940920	390514642235453442	f	parissandwich
Dumbo! We will be on fronts and Adams today at 12pm for lunch @DUMBOFoodTrucks	1381849863	390132721634508800	f	parissandwich
Stop by our Restaurant @ 113 Mott st for delicious Vietnamese dishes. Beef watercress salad http://t.co/pZnSUOkQiI	1380911903	386198631097061376	f	parissandwich
Dumbo! We will be at Front &amp; Adams at 12PM #dumbofoodtrucks \nNYC! We will be at 47th &amp; Vanderbilt at 12PM today #loveparissandwich	1380296233	383616325769494528	f	parissandwich
Join us as we pair with @hesterstfair to celebrate @linsanitythemovie #linsanity #loveparissandwich #hesternights\n6th Ave and 9th	1380238978	383376180831059969	f	parissandwich
@beejayarr we will be on 56th and broadway today	1380123713	382892722220449792	f	parissandwich
dumbo. @dumbofoodtrucks #dumbofoodtrucks. Adams and front today	1380036930	382528728817209344	f	parissandwich
47th Street &amp; Park Ave serving lunch.  No meat Friday?  We gotcha covered.  #Pea-nocchio  our Chipotle Chickpea... http://t.co/Ze704JkXoS	1397227440	454630954544291840	f	mikenwillies
RT @YouGotSmoked: Check us out today @dumbolot @DUMBOFoodTrucks from 11:00 to 3:00! #slowsmokedpork #applewoodsmokedchicken	1389793800	423452005034901504	f	miamimachinenyc
It's Thursday, gorgeous out and we're in #Midtown 56th St. &amp; Broadway only way for the day to get better is with... http://t.co/9eJPxF0q7m	1397143340	454278210554183680	f	mikenwillies
Mike Mike Mike what day is it today... It's #Humpday #FIDI at our old battleground Old Slip &amp; Front St. With all... http://t.co/eTCZ7WlPc5	1397054854	453907075517939712	f	mikenwillies
RT @ChoiceEats: Welcome back to #ChoiceStreets @hibachiheaven &amp; @mikenwillies http://t.co/j8yQKtQwBn!	1396979734	453591999078465537	f	mikenwillies
Here comes the sun Hudson St &amp; Clarkson St!  Serving your favorite #tacos #sliders and our special cheesy chicken #quesadilla #comegetsome	1396966213	453535289118830592	f	mikenwillies
Happy Monday!! Yeh work sux but at least you get to eat good if you near 22nd St. &amp; 5th Ave #comegetsome	1396879408	453171202648182784	f	mikenwillies
RT @randomfoodtruck: Hey, happy pre-Friday guys! @mactruckny @PolishCuisine @tacobite @TheSteelCart @hibachiheaven @mikenwillies	1396542780	451759282137337856	f	mikenwillies
Just posted a photo http://t.co/QrSpB33tM7	1396534558	451724795303190528	f	mikenwillies
Hello #Midtown\nHope you missed us as much as we missed you. We're Slinging all your favorites at 56th St. &amp;... http://t.co/Gn6JwxX8iZ	1396534488	451724500531707904	f	mikenwillies
Happy Humpday #FIDI even in the rain were here for you Front St &amp; Old Slip today's special Chicken Quesadilla	1396451051	451374541336752128	f	mikenwillies
Got the Mondays Blues? We have the cure!!a delicious &amp; Nutritious Taco, Slider, Burrito or a rice Bowl 5th Ave 22nd St. #comegetsome	1396278229	450649674962460672	f	mikenwillies
Less than a month away.  Looking forward to it.  Show your support for a great cause.  100%of donations go... http://t.co/btZIIOJuO8	1396038777	449645337222066176	f	mikenwillies
@ewbray we were there today doing a private catering.  We are in the NYC area mainly.  Tx for the inquiry!	1396034075	449625617706012672	f	mikenwillies
@VoiceOfTheSoul we will be back with our bells on next Thursday and look forward to seeing our favorite customers!  #comegetsome	1395947945	449264362554142720	f	mikenwillies
RT @VoiceOfTheSoul: @mikenwillies We here at Eagle Rock have been way bummed that you guys haven't been out there lately! We miss you! #wew...	1395947812	449263802560053248	f	mikenwillies
We're at the @VH1SaveTheMusic: 100 W 77th St. A fun filled Family Day event  10a-4pm!  Lots of fun, free... http://t.co/ricopuoQEp	1395502018	447394008399372288	f	mikenwillies
RT @VH1SaveTheMusic: In NYC?! Come to our Family Day event tomorrow from 10a-4pm!  Lots of fun, free activities for the day! http://t.co/BP...	1395445338	447156276234317825	f	mikenwillies
@VH1SaveTheMusic We'll be there!  Looking forward!	1395445326	447156224950534144	f	mikenwillies
RT @toniamd: Yum @VH1SaveTheMusic: Thank you to the food trucks supporting our Family Day event!  @COOLHAUS @EddiesPizzaNY @MollysMilkTruck...	1395426430	447076971017949184	f	mikenwillies
TGIF!! First full Day of spring and it's looking like a nice one 47th St btwn Lexington Ave &amp; Park Ave slinging... http://t.co/GDqp7lrTIx	1395412728	447019499418845184	f	mikenwillies
Major Expansion Coming to #TimesSquare! http://t.co/fTCyAoPYaa via @EaterNY #Mexicue2014 #eeeeeats	1397255870	454750197805879296	f	mexicue
RT @CrainsNewYork: As it plans expansion, @Mexicue bags @rubytuesday founder as an investor (via @LisaFickenscher) http://t.co/IUi3KUXlRK	1397255141	454747140787802112	f	mexicue
Feels like summer! Stop by Mexicue 7th ave &amp; let's celebrate! ($3 Beers, $4 Margaritas, $5 Nachos) until 8 #happyhour http://t.co/YZ2lRGCrT3	1397250891	454729314526040064	f	mexicue
#TBT One of our first days out in the streets of #NYC! @ Mexicue Taco Truck http://t.co/L6f7Q6IA8v	1397161748	454355419314810880	f	mexicue
NYC is Heating up!	1397151234	454311323975680000	f	mexicue
RT @BCDRestaurants: How sweet it is to be loved by you! @mexicue #BCDStrategic http://t.co/s4K6vhPbyA	1397069412	453968136002625536	f	mexicue
See you at Happy Hour.	1396987632	453625126832332800	f	mexicue
RT @octothorpe: @Mexicue everything is awesome.	1396979326	453590286384779266	f	mexicue
Starting off #tacotuesday with our Brisket Breakfast Taco (mexican scramble, smoked brisket, green chili sauce, lime cream, white cheddar)	1396960872	453512883994107904	f	mexicue
Getting our #MeatlessMonday on with a tasty Black Bean Burrito	1396909252	453296374545518592	f	mexicue
Red-Hot Mexican BBQ Goodness, From Brooklyn to Manhattan. #brooklynbridge #nyc #bestofny @ Brooklyn... http://t.co/2z3m2amQNw	1396888474	453209225041543168	f	mexicue
RT @Clouderband: @Mexicue GET IN ME	1396643834	452183131526025216	f	mexicue
GREEN CHILI MAC &amp; CHEESE #mexicue #macandcheese #comfortfood #EEEEEATS #cheese http://t.co/ZT3TUtxUYO	1396632554	452135818829004800	f	mexicue
RT @RickyDricky: Thanks @Mexicue for the early birthday present. Love paying with @theLevelUp app!	1396626574	452110737591521280	f	mexicue
RT @WeAreNewYorkers: @mexicue just catered my office lunch and it was awesome! They set it all up and then we stuffed ourselves! http://t.c...	1396546717	451775793388335104	f	mexicue
Craving Some BBQ'd Brisket Tacos right about now #LunchTime	1396543846	451763753491918849	f	mexicue
Catering to your every need. #officelunch #catering #mexicue #midtownlunch #officeparty #worklunch http://t.co/YjrEGLbuS5	1396540348	451749079840993280	f	mexicue
RT @nycfoodtruck: Yummy NYC Food Trucks: http://t.co/kQ7p7fs6lg via @BuzzFeed &amp; @allysterrr w/ @MilkTruckNYC @LobsterTruckNY @Mexicue @Kelv...	1396538699	451742163165249536	f	mexicue
Quenching Thirst, Mexicue style. #JARRITOS #mexicue #orangesoda #mexicansoda #mexican #soda @ Mexicue http://t.co/NI22KgF0rH	1396463365	451426191384514560	f	mexicue
Community: Yummy Food Trucks In NYC You HAVE To Try http://t.co/UAflaBTZ0S  via @buzzfeeders	1396453301	451383977324986370	f	mexicue
It's cheesesteak Friday scream it from the rooftops! Broadway&amp; 55th 11-3:30 @VictoriasSecret  @randomfoodtruck @UBS @DefJamRecords GOT WHIZ?	1397225382	454622320641208320	f	carlssteaks
@sarahkarpward @Yankees @RedSox @michaelroche we would love to see you guys there tonite!	1397160556	454350421889667072	f	carlssteaks
RT @michaelroche: @sarahkarpward @Yankees @carlssteaks @RedSox I'm going to wear my @Cubs hat!	1397160214	454348988745920512	f	carlssteaks
RT @sarahkarpward: I want to go to @Yankees Stadium just to eat @carlssteaks. I'll wear my @RedSox World Series t, too. (thanx for the remi...	1397160203	454348940549165056	f	carlssteaks
Hey folks TBT and a classic famous Carl's cheesesteak enough said! 10 Hanover square and water st 11-3 30 pre order 917 597 4313 GOT WHIZ?	1397138710	454258794177236994	f	carlssteaks
RT @ackermc: Few things better on a nice day than @carlssteaks	1397077773	454003202611224576	f	carlssteaks
Cheesesteaks for dinner Tribeca Murray st &amp; Greenwich st 5 830 GOT WHIZ? http://t.co/FcwoILS1xh	1397076800	453999122824298496	f	carlssteaks
RT @Tumassi: @carlssteaks yummmmmmmmmm	1397067484	453960047174090754	f	carlssteaks
@hollyyork nope! We take cards!	1396633050	452137901418356736	f	nautimobile
Happy hump day shed the jackets head over to 49th st bet 6th/7th av 11-3 30 for a Carl's famous cheesesteak @SiriusXMNFL @Barclays @UBS	1397055981	453911802163003393	f	carlssteaks
Hey folks it's Tribeca Tuesdays cheesesteaks for dinner Murray st and Greenwich st. 4 30 830 GOT WHIZ? http://t.co/lBMoz6snkj	1396988010	453626711679066112	f	carlssteaks
Hey folks time for the cheesesteak rain dance! Serving up some love in DUMBO Jay st &amp; Water st 11-3 @dumbolot GOT WHIZ?	1396966833	453537887490158592	f	carlssteaks
Happy monday back in SOHO folks Varick and  Charlton st 11-3 30 Opening day at Yankee Stadium so if your there grab a cheesesteak as well	1396881293	453179107896221696	f	carlssteaks
Not to late here till 5 Still serving up our famous cheesesteaks Prospect Park Grand Army Plaza Brooklyn showing us the love GOT WHIZ?	1396811231	452885244082151424	f	carlssteaks
RT @nycfoodtruck: . @BigDsGrub @CarlsSteaks @dubpies etc. are also waiting for you at @Prospect_Park's #GrandArmyPlaza! http://t.co/mlpSIKx...	1396799787	452837246929223680	f	carlssteaks
Hey folks join us at Food Truck Rally Grand Army Plaza Prospect Park 11-5 #foodtruckralley great day for a great Carls cheesesteak GOT WHIZ?	1396796893	452825108999323648	f	carlssteaks
RT @mmanny: @carlssteaks I will be there!  #foodie #NYC	1396723814	452518590986846208	f	carlssteaks
@edwardcorp123 sorry off today	1396723258	452516261579476994	f	carlssteaks
Hey folks come by &amp; come see us SUNDAY 11-5  at PROSPECT PARK GRAND ARMY PLAZA serving up our famous cheesesteak s #foodtruckrally GOT WHIZ?	1396722733	452514058923937792	f	carlssteaks
RT @nycfoodtruck: Public Service Announcement for all our foodies out there! TMRO, 4/6, is the very 1st FOOD TRUCK RALLY of the season! htt...	1396722414	452512719183560705	f	carlssteaks
Its  CHEESESTEAK FRIDAY its CHEESESTEAK FRIDAY yell from rooftops!  Broadway &amp;55th st 11-3 @randomfoodtruck @DefJamRecords @VictoriasSecret	1396620474	452085155172458496	f	carlssteaks
RT @AMLombardo12: @waffletruck Waffles by the fountain! I feel like it's finally spring. http://t.co/AkN5R5zFIp	1397241690	454690722261000192	f	waffletruck
Kotmadam @ Broadway &amp; 17th til 9pm Goesting @ Bway &amp; 66th til 10pm	1397225643	454623415115464704	f	waffletruck
Kotmadam @ Broadway &amp; 17th St til 9pm Goesting @ Bway &amp; 66th til 10pm	1397225563	454623079327866880	f	waffletruck
Vedette @ 60th &amp; 5th ave til 8pm Pagadder @ City Hall Park til 8pm	1397225536	454622967641935872	f	waffletruck
Momma Truck @ 49th &amp; 6th till 4:30p Kastaar @ 40th &amp; Park till 4:31p	1397225526	454622923115200512	f	waffletruck
TGI Friday!\nLe Cafe @ 15 ave B till 2am \nDe Wafel Cabana @ 35th &amp; Broadway til 10p	1397225518	454622893524398080	f	waffletruck
@j_h0rn @CastelliCycling delicious delicious jerseys.	1397196184	454499855483019265	f	waffletruck
@delilahlove214 @win11 this! this!	1397196132	454499639484760066	f	waffletruck
@WINTERSTAR you can!...wait...	1397196107	454499534622961664	f	waffletruck
@SoberChild come back then!	1397196084	454499436719521793	f	waffletruck
RT @FoodtoEat: New Blog Series on #FoodtoEat: Foodies of New York: Anna Hollander loves the .@waffletruck http://t.co/X6dSJNC0G2	1397196063	454499347359891456	f	waffletruck
@SteffieV that's about standard we think.	1397195991	454499048255651840	f	waffletruck
@xashology looks about good to us!	1397195971	454498961118990336	f	waffletruck
@xashology we hope the very same thing for you.	1397195951	454498879279730689	f	waffletruck
@dragon_pool1 we can think of none better certainly.	1397195934	454498806919622656	f	waffletruck
@Kizzbeth so we've been told...by the voices...	1397195911	454498709846634497	f	waffletruck
@TomDoesFood darn, took two? Okay, we'll do better next time.	1397195862	454498503222652929	f	waffletruck
@warholwannabe one should always celebrate tasty wafel Thursday.	1397195828	454498363476828160	f	waffletruck
@lacey_bead think so?	1397195799	454498241108017152	f	waffletruck
@3PegsDown @ik9red yes yes. Fo sho fo sho!	1397195761	454498081816715266	f	waffletruck
Sold out! Have a great weekend !	1397239212	454680329945878528	f	schnitznthings
RT @DispatchBP: . @BrookfieldPLNY NORTH Lot | Fri., 4/11 | 11a-3pm | North End Ave. &amp; Vesey St. | @SchnitznThings @MorrisTruck @ToumNYC @Sh...	1397230329	454643069984727040	f	schnitznthings
Who's ready for some schnitz at Brookfield place? Truck will be on North End &amp; Vesey sts from 11:00-2:30. Preorder 347-772-7341shine on!	1397224482	454618546820374528	f	schnitznthings
TGIF!! Come finish off the week strong at the Schnitzcart! We'll be on 49th st b/w 6th &amp; 7th from 11:00-2:00pm. Hope to see you soon!	1397224366	454618059853299712	f	schnitznthings
Step out of the office and come get your schnitz on at the cart. Parked on 26th st between 12th &amp; 11th from 11-2pm. See ya:) @starrett601	1397141217	454269307657019392	f	schnitznthings
Another gorgeous day for some schnitz! Stop by the truck on 51st between park and madison from 11:30-2:30pm! Preorder 347-772-7341	1397141073	454268703886938113	f	schnitznthings
Glad you enjoyed:)RT @JimWLondon: @schnitznthings thanks for amazing #chickenschnitzel #henhaoche  dreaming of my next one already	1397071210	453975676052578304	f	schnitznthings
@PbodyPhoto we sold out of food very early today. Won't happen again	1397071194	453975608322961408	f	schnitznthings
The Schnitzcart will be at it's usual Wednesday spot on 27th &amp; Park Ave from 11:00-2:00pm.  Come and get schnitz faced!	1397053695	453902213279391744	f	schnitznthings
Happy hump day everyone! The truck will be on 47th between park and Lexington from 11:30-2:30. Stop by or preorder 347-772-7341	1397053553	453901617046515712	f	schnitznthings
@RokhlK doesn't look like the truck is making it out today. Very sorry for the inconvenience:(	1396974403	453569638388224000	f	schnitznthings
Hi guys. Unfortunately the truck is having mechanical issues. We will update you if we will make it out today. Sorry for the inconvenience	1396967539	453540847364370432	f	schnitznthings
The Schnitzcart will be on Greenwich &amp; Park place from 11:00-2pm. Schnitz usually makes the rain go away:) come get some!	1396963784	453525099594137600	f	schnitznthings
Good morning everyone. The truck will be on 52nd between 6th &amp; 7th from 11:30-2:30 today. Stop by for some schnitz! Preorder 347-772-7341	1396963569	453524198917689344	f	schnitznthings
Thx:)!RT @Bauzen: @schnitznthings After years of playing hide &amp; seek through NYC, I finally found you guys today. Lunch was lovely. Thanks!	1396897238	453245985435967488	f	schnitznthings
Just a quick update. The truck found a spot on Charlton between Hudson and Varick. Hope to see you soon!	1396881376	453179454857445376	f	schnitznthings
The Schnitzcart will be on 55th &amp; Broadway from 11:00-2pm. Step out of the office and come have a schnitz! @randomfoodtruck	1396878419	453167050970902528	f	schnitznthings
We know it's Monday but you can always cure the blues with schnitz. Truck will be on Varick and Charlton 11:30-2:30pm. Preorder 347-772-7341	1396878268	453166417740066816	f	schnitznthings
To all our people on 49th between 6th &amp; 7th, the Schnitzcart will be slinging delicious warm cutlets of meat from 12:00-2:00pm. Stop by!	1396618359	452076280125878273	f	schnitznthings
Good morning. The truck will be at Brookfield place on North End and Vesey sts from 11:00-2:30pm. Get your Friday schnitz on:)!	1396618067	452075057956007936	f	schnitznthings
Good Morning Dumbo... We Are here @ Water Str &amp; Jay Str... Come join us for your favorite Arepassss...\n;)\n;)\n;)	1397225675	454623549698101248	f	palenquefood
Good morning Palenque is ready!!!\nCome to North End &amp; Vesey st. http://t.co/Pz7YZWvW7G	1397139332	454261399741820928	f	palenquefood
Right here  http://t.co/D3z8vCfcgE	1397051537	453893164320174080	f	palenquefood
We are ready for your lunch at Varick St &amp; Charlton St. We still have ajiaco soup and All your favorite Arepas! See u here :)	1397051484	453892939056685056	f	palenquefood
@adrirpo12 Hola Adriana, WE are not out today, but tomorrow we will be at Varick st!  where are you located?	1396990475	453637051871531008	f	palenquefood
@adrirpo12 @Palenquefood	1396990430	453636861890555904	f	palenquefood
@Vialet21 hello, we don't have a spot in midtown yet! We will let you know! Thanks!	1396956029	453492570661076992	f	palenquefood
RT @FoodieFindsNYC: #HarlemFoodTruckRally @Palenquefood the costena was RIDICULOUS. So good. http://t.co/q1F7UIgMvj	1396751072	452632919421362176	f	palenquefood
RT @dubpies: #PieTruck will @ Grand Army Plaza #foodtruckrally Sunday: @NuchasNYC @Palenquefood @PhilsSteaks Take it easy on us guys!	1396750913	452632255882485761	f	palenquefood
RT @nycfoodtruck: The 1st #FOODTRUCK RALLY of 2014 is happening this Sunday, 4/6, at @Prospect_Park's #GrandArmyPlaza! http://t.co/W65XbXMc...	1396651917	452217036228546560	f	palenquefood
dumbo friends, Palenque is here To serve you delicious &amp; nutritious Colombian Food!	1396622264	452092661349253120	f	palenquefood
WOOP WOOP HAPPY HUMP DAY\n\nWE ARE HERE...LUNCH TIME...\n\nArepas. AjiacoSoup. Empanadas Beef &amp; Cheese\n\nOff the corner of Varick  &amp; Charlton str	1396454664	451389696212729856	f	palenquefood
Yes Little By Little BYE BYE WINTER ;)\n\nWe Are Here Lovely Customers On VARICK STR &amp; CHARLTON STR\n\nCOME JOIN US FOR. UR FAVORITE AREPASSS	1396449160	451366610486693888	f	palenquefood
Truck is in Wall St waiting for you a delicious and nutritious arepa, ajiaco soup &amp; New arepa burger!	1396277795	450647853283946496	f	palenquefood
RT @MsJazzSoul: Heaven is a @Palenquefood arepa burger with yucca fries.	1396123150	449999226655633408	f	palenquefood
A lil Wet Today, but the temperature is awesome... So Come Join Your Favorite Food Truck by Grand Army Plaza... C U There \n\n;)\n;)\nAREPASSS	1396106078	449927619048640513	f	palenquefood
LUNCH TIME Dumbo Come join your favorite food truck on Jay str &amp; Water str. Yes we are here with your favorite paisa Arepas!!! C u there...	1396014881	449545112671240192	f	palenquefood
Gd Mrng WFC North... We are here today with your favorite Arepas, on this beautiful day ready to make your tummy happy. Come Join Us 4 Lunch	1395932076	449197801109737472	f	palenquefood
Palenque Palenque Palenque We Are Here Ready To Heat Your Bones With Our Lovely Delicios Options... Come Join Us On Varick &amp; Charlton Street	1395843977	448828290263166976	f	palenquefood
A Lil Cold, \nGrab Our Lovely Ajiaco Soup or A Nice Hot Tea (agua panela) Cuz We Are Here On Varick Str &amp; Charlton Str Ready To Make U Happy	1395843852	448827763227893760	f	palenquefood
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
RT @YouGotSmoked: Park Ave btw 33rd St and 32nd St from 11:00 to 3:00 today! New York Aged Cheddar Mac and Cheese! #Delicious #nyc http://t...	1389964561	424168229477826560	f	miamimachinenyc
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
Kasar truck is at 50th street and 6th avenue, happy Friday!!!!	1397237447	454672926092980224	f	chipsykingny
Kasar truck is at 50th street and 6th avenue.	1397143208	454277656855343104	f	chipsykingny
Kasar truck is at 50th street and 6th avenue. Join us!!!	1396974370	453569500109996032	f	chipsykingny
Kasar is in Soho, at broadway and spring street. Happy Sunday !!!	1396791899	452804163399741440	f	chipsykingny
Kasar truck is in Soho, broadway and spring street.	1396720254	452503661139091456	f	chipsykingny
Kasar truck is at 50th and 6th avenue\nJoin us!!!	1396534595	451724952492724225	f	chipsykingny
Kasar truck is at 52nd street and 6th avenue, until 6pm!!!\nJoin us for our famous Belgian frites, and our new additions	1396445853	451352740917043200	f	chipsykingny
Join Kasar truck at 46th street, between 5th and 6th avenues. New menu, surprise !!!	1396371446	451040653711912962	f	chipsykingny
Happy Monday!!! Kasar truck as at 46th and Park avenue all day until 6pm	1395670501	448100676241862657	f	chipsykingny
Kasar truck is in SOHO, Broadway and Spring street, all day until 6pm\nJoin us!!!	1395492681	447354845700177920	f	chipsykingny
Happy Friday!!!\nKasar truck is at Broadway and 55th street, all day until 6pm.	1395404166	446983586483142656	f	chipsykingny
Kasar truck is at 47th and Park avenue, until 6pm, join us!!!	1395327437	446661762901757952	f	chipsykingny
Kasat Truck is on Broadway between 61st and 62nd Street until 6pm	1395253299	446350804530638848	f	chipsykingny
Kasar truck is at Trinity school 91st and Columbus, join us!!!	1395240829	446298502042116096	f	chipsykingny
Excuse us for typo, Kasar truck is at 59th street between 6th and 7th \nHappy St. Patrick's day!!!	1395069782	445581080599752704	f	chipsykingny
Happy St Patrick's day, Kasar truck is at 61st street between 6th and 7th Avenues. Join us!!!	1395068021	445573691293048832	f	chipsykingny
Kasar truck is in Soho, broadway and spring street, until 7 pm. Join us!!!	1394979783	445203596876185601	f	chipsykingny
Kasar truck is in Soho, broadway and spring street, all day until 7 pm\nJoin us!!!	1394890546	444829308909928448	f	chipsykingny
Kasar truck is at Broadway and 55th street, until 6pm \nJoin us!!!\nHappy Friday!!!	1394806827	444478164488978433	f	chipsykingny
Kasar truck is at Wall Street and Williams until 5pm, join us!!!	1394732363	444165840317870080	f	chipsykingny
Hello, Sunshine! Yume is on Broadway&amp;55th and Junior is feeding FIDI on Hanover&amp;Water. Come out and soak up the sun!	1397143389	454278417538899968	f	yumefoodtruck
Come find Yume today at the WFC North End lot. Junior is on Pearl and Whitehall for lunch.	1396969634	453549637384024065	f	yumefoodtruck
@johnlucchini Hi John, today we are over on Broadway and 55th	1396548050	451781386878611456	f	yumefoodtruck
Humpday Locations: Yume is on Broadway&amp;55th for lunch and Junior is on Hanover&amp;Water.	1396452177	451379264030785536	f	yumefoodtruck
RT @DispatchNY: . @BrookfieldPLNY NORTH Lot | Tues. April 1st | 11a-3pm | North End Ave. &amp; Vesey St. @SouvlakiTruck @BigDsGrub @YumeFoodTru...	1396363636	451007895573106688	f	yumefoodtruck
Overcome the Monday Blues with Yume! We are at 10 Hanover Sq &amp; Broadway and 55th today.	1396278376	450650290795335681	f	yumefoodtruck
RT @randomfoodtruck: Happy Friday! @Chefsamirtruck @carlssteaks @CarpeDonutNYC @tacobite @YumeFoodTruck @taipanexpress @thegreenradish1	1396019541	449564659147091968	f	yumefoodtruck
RT @randomfoodtruck: Whatever you want for lunch, it's here: @YumeFoodTruck @mactruckny @tacobite @PolishCuisine @ChipsyKingNY @hibachiheav...	1395934842	449209404593025024	f	yumefoodtruck
Hey, Midtown! Yume will be on Broadway&amp;55th today. FIDI, are you hungry? Junior will be on Hanover and Water for lunch.	1395846096	448837174642106368	f	yumefoodtruck
RT @DispatchBP: . @BrookfieldPLNY NORTH Lot | Tuesday, 3/25 | 11a-3pm | North End Ave. &amp; Vesey St. | @SouvlakiTruck @BigDsGrub @YumeFoodTru...	1395759181	448472627074859008	f	yumefoodtruck
Happy Tuesday! Yume is on Broadway&amp;56th. Junior is at 10 Hanover Sq. And to make today even sweeter- we'll be at the WFC North End Lot, too!	1395759162	448472548700078080	f	yumefoodtruck
47th and Lexington for @domotaco http://t.co/7flqHCrSF7	1397143996	454280961878814721	f	biandangnyc
RT @randomfoodtruck: Monday lineup: @schnitznthings @souvlakitruck @gcnyc1 @hibachiheaven @tacobite @YumeFoodTruck @DiSOSNYC	1395676585	448126195864178688	f	yumefoodtruck
Hey guys.. Yume is in front of Apple on Broadway and 67th until dinner.	1395595853	447787581162655744	f	yumefoodtruck
Catch Yume on 67th and Broadway in front of Apple today!	1395505269	447407643645448192	f	yumefoodtruck
Sunshine all day! Yume is in the WFC South End lot until 3. Junior's location TBA shortly.	1395411953	447016247650418688	f	yumefoodtruck
Yume is on Broadway&amp;56th today - open til 330. Junior hopped boroughs and is serving up teri plates to Queens College until this evening!	1395328853	446667704045670400	f	yumefoodtruck
Yume is on Broadway and 56th until 3 today. Junior is feeding FIDI on Hanover and Water this afternoon.	1395242882	446307113451933696	f	yumefoodtruck
RT @DispatchNY: . @BrookfieldPLNY NORTH Lot | Tuesday, 3/18 | 11a-3pm | North End Ave. &amp; Vesey St. | @SouvlakiTruck @BigDsGrub @YumeFoodTru...	1395154433	445936129431597056	f	yumefoodtruck
Yume is at the WFC Food Truck Lot today on North End&amp;Vesey today from 11-3. Junior is on Hanover&amp;Water for lunch.	1395150804	445920908893765632	f	yumefoodtruck
Grab a teri plate after the parade..we're on Broadway and 56th today! FIDI, we didn't forget about you..Junior is on Hanover&amp;Water today :)	1395066186	445565995265310720	f	yumefoodtruck
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
Come check us out.\n42 st and 6th ave until 11pm                  and 47th st and Broadway until 1 am	1385946162	407313844181409792	f	crafflesnyc
Passover Special! Any sandwich for $10 today. Parked on 46th off 6th.\nHelp us with our Passover cleaning by eating!!	1397231435	454647709245640704	f	grillonwheelsny
Passover Special! Any sandwich for $10 today. Parked on 46th off 6th.\nHelp us with our Passover cleaning by eating!!	1397227289	454630320118444032	f	grillonwheelsny
A beautiful day downtown in the financial district! Come try our shawarma or spicy crazy chicken!! Hanover &amp; Water St- open at 11!	1397141057	454268634584858624	f	grillonwheelsny
Grill on Wheels today on Water street and Hanover St. Open from 11:00-3:00	1397134593	454241522507321345	f	grillonwheelsny
@Drewguy33 financial district	1397071606	453977339559706624	f	grillonwheelsny
Grill on Wheels at 55 st off Broadway!	1397054362	453905010083262464	f	grillonwheelsny
Craving that fresh warm baguette before the matzah? Come over to Grill on wheels for mouth-watering sandwiches. Parked on Park/47th	1396967109	453539043901325314	f	grillonwheelsny
 Parked on 47th off Park Ave today! schnitzel crazy chickenshawarma yummy	1396961841	453516950715781121	f	grillonwheelsny
Parked on 46th off 6th today! \nschnitzel crazy chickencouscous Shawarma  chicken and lamb	1396884644	453193161511550976	f	grillonwheelsny
Happy Monday \nParked on 46th off 6th today!	1396881703	453180827695087616	f	grillonwheelsny
@TheRealEvanS @YeahThatsKosher Thanks for the luv Evan! Shabbat shalom guys!!	1396640359	452168555816300544	f	grillonwheelsny
@YeahThatsKosher Sorry to hear that Dani! That's really a first for us as the crazy chicken is our #1 seller! Hope we can make it up to u.	1396623971	452099820992200704	f	grillonwheelsny
@GrillOnWheelsNY: Parked on 46th off 6th today! \nschnitzel crazy chickencouscous Shawarma  chicken and lamb	1396622922	452095419837726721	f	grillonwheelsny
@TheRealEvanS thanks 4 the luv! C u again soon!! 	1396564496	451850363231272960	f	grillonwheelsny
A beautiful day downtown in the financial district! Come try our shawarma or spicy crazy chicken!! Hanover &amp; Water St- open at 11!	1396535207	451727515552215042	f	grillonwheelsny
Grill on Wheels today on Water street and Hanover St. Open from 11:00-3:00	1396531650	451712598027677697	f	grillonwheelsny
To all our Grill on Wheels fans- we will be in the financial district tomorrow!!  Location tba in the morning!	1396476142	451479781637648384	f	grillonwheelsny
Grill on Wheels at 55 st off Broadway!	1396460463	451414018830651392	f	grillonwheelsny
Come try our couscous topped with cooked vegetables platter, with your choice of meat! 55st off broadway today	1396451227	451375281492590592	f	grillonwheelsny
Grill on Wheels at 55 st off Broadway!	1396444485	451347002996314113	f	grillonwheelsny
@downtownlunch correction we are on king&amp;varick today. The word of the day is "amore" for ur free upgrade. #SoHo get ur #deliheaven on	1392220340	433629653711212545	f	deliheaventruck
@downtownlunch DH is on varick&amp;charlton today. The word of the day is "amore" for ur free upgrade. #SoHo get ur #deliheaven today	1392217592	433618126148993024	f	deliheaventruck
@midtownlunch Today is the Day!! Grand Opening on Broadway &amp; 55st. Rotisserie chicken, pastrami @ corn beef sandwiches New York Style	1392131026	433255045355036672	f	deliheaventruck
We are on old slip and front st!!	1396886404	453200543159422977	f	chefsamirtruck
@midtownlunch HH3 is on 46 st &amp; 6 Ave. HH2 is on Park Ave &amp; 33st. Word of the day is "Peyton" for your free upgrade. #midtown get ur #YumYum	1391178361	429259276079861760	f	deliheaventruck
WFC North---North End Ave &amp; Vesey.  Parked &amp; ready. Cheesesteaks be lookin' good today.	1397231521	454648068806545409	f	shortysnyc
RT @mountypfd: Embracing my inner fat child today.  Just ordered cheesesteaks from @shortysnyc my coworker's first whiz experience	1397231218	454646797055840256	f	shortysnyc
RT @gKape3: it's thursday...@shortysnyc is on park! =) #bestcheesesteakinNYC	1397178693	454426493947768832	f	shortysnyc
47th &amp; Park.	1397144769	454284207742001152	f	shortysnyc
DUMBO.  Jay &amp; Water for lunch. @dumbolot	1397054008	453903526432100352	f	shortysnyc
Meaningful playoff hockey at Shorty's.  We'll take it.	1397010681	453721798069485568	f	shortysnyc
Just added Barrier Icculus Kolsch on tap. http://t.co/RgoTq5xQY5	1396985593	453616571705860096	f	shortysnyc
Just added Barrier Icculus Kolsch on tap. See our full beer menu: http://t.co/diIBX41bgV @BarrierBrewing #BeerMenus	1396985591	453616563774849025	f	shortysnyc
Just added 21st Amendment Hell or High Watermelon Wheat on tap. http://t.co/7s0kuPNiyk	1396985591	453616563426312192	f	shortysnyc
Just added 21st Amendment Hell or High Watermelon Wheat on tap. See our full beer menu: http://t.co/MaRCUPAQre @21stAmendment #BeerMenus	1396985590	453616561765380096	f	shortysnyc
Just added Saranac Pale Ale on tap. http://t.co/pbWW4YMEnb	1396985589	453616558451875841	f	shortysnyc
Just added Saranac Pale Ale on tap. See our full beer menu: http://t.co/diIBX41bgV @saranacbrewery #BeerMenus	1396985589	453616555369439232	f	shortysnyc
RT @FakeAdamLyons: Who wins tonight? Will Titsburgh make it 2 in a row? Will Money Shot bounce back? Tonight 9pm 62 Pearl @shortysnyc http:...	1396974158	453568610083295232	f	shortysnyc
47th &amp; Park.  Come on by.	1396971159	453556033605361664	f	shortysnyc
Just added Ace Apple Honey Cider on tap. http://t.co/g88xsbT3AN	1396967108	453539040059351040	f	shortysnyc
Just added Bronx Pale Ale on tap. http://t.co/6GzwP2TWWy	1396966879	453538081367261184	f	shortysnyc
Just added Allagash Fluxus 2013 on tap. http://t.co/Ifgq1kDdc2	1396966842	453537924811075584	f	shortysnyc
Just added Oskar Blues Ten Fidy on tap. http://t.co/nYjj7Ktefg	1396966819	453537827649646593	f	shortysnyc
Celebrate Spring with 20 beers over 100 whiskeys and specialty cocktails! Get your Wiz on at Shor... http://t.co/diIBX41bgV @beermenus	1396966536	453536641546997760	f	shortysnyc
RT @SixpointNYC: The Finals! @shortysnyc (Pearl St, Hell's Kitchen and Madison Ave) $5 pints of 5 different Sixpoint beers during NCAA Tour...	1396906298	453283983909220352	f	shortysnyc
RT @kunalgulati: @jennygurvich I've just recently discovered @BrooklynPopcorn. Grab yourself a bag, I promise you will never put it down.	1397181369	454437715501940736	f	brooklynpopcorn
RT @DosHig: @BrooklynPopcorn thx for apple/kettle. This &amp; granola are faves #happywife  Request for dill pickle for #happyhusband http://t....	1397013655	453734275616362496	f	brooklynpopcorn
Hello #SOHO we are back.  We have all your favorite #popcorn flavors! Can't wait to see you all!	1396719733	452501476133568512	f	brooklynpopcorn
Book the @BrooklynPopcorn Truck today for your next #CorporateEvent, #Wedding, #Bar/#Bat #Mitzvah, #Birthday,#BabyShower or #BlockParty.	1396705150	452440310820663296	f	brooklynpopcorn
@DosHig Great! For our #1 customers we will have Apple Granola for you guys! Enjoy the weekend and thank you again for your support always!!	1396667850	452283861565988866	f	brooklynpopcorn
RT @DosHig: @BrooklynPopcorn  thanks!  The husband caught you on the way home #weekendfix  Requesting apple granola for Tuesday ##1customers	1396667699	452283227651461120	f	brooklynpopcorn
@DosHig Sorry we miss you today!!We had an event and arrived late this afternoon downtown. We will see you next Tuesday :) Have a great wknd	1396664303	452268983170134016	f	brooklynpopcorn
RT @FreeSampleMomma: Win a $20 Gift Certificate from @BrooklynPopcorn\n\nhttp://t.co/tFEKvRpSeu http://t.co/sMe5RUnyUJ	1396566504	451858788333924352	f	brooklynpopcorn
@kunalgulati Thanks for your support Kunal! Enjoy 2 excellent flavors! We look forward to seeing you again soon :)	1396566490	451858726090440704	f	brooklynpopcorn
RT @kunalgulati: @BrooklynPopcorn Thanks for the heads up. Picked up #Garlicparmesan and #applecinnamon. Till next time #nomnom http://t.co...	1396566434	451858492052480000	f	brooklynpopcorn
@kunalgulati Hi Kunal yes our kernels and all our famous flavors are gluten free!!!! Come on over and say hello  :)	1396539801	451746787771318272	f	brooklynpopcorn
Hello 70th &amp; York we are back! We have our famous Apple Granola Caramel Flavor! A special shout-out to radiology at #NewYorkPresbyterian :)	1396539028	451743542378258432	f	brooklynpopcorn
RT @CatYatesCooking: Want to win some gourmet popcorn all the way from NYC?  Thanks to @BrooklynPopcorn you can! http://t.co/Q10DNhwjPP	1396536896	451734602189910016	f	brooklynpopcorn
RT @DosHig: @BrooklynPopcorn thank you :).  Can't wait for Friday. #neverenough	1396532320	451715408601829376	f	brooklynpopcorn
Happy Wednesday! NewYork-Presbyterian Hospital we are finally here! We are cooking all our famous mouthwatering flavors!See you all soon :)	1396457284	451400685557657600	f	brooklynpopcorn
RT @TheImpeckables: We've tried a lot @BrooklynPopcorn and we like em - original, ranch, garlic parm, cajun, cheddar &amp; chocolate - got reco...	1396447793	451360877263216640	f	brooklynpopcorn
@TheImpeckables Thank you for your support!! Enjoy the Kettle Corn it truly is one of our favorites too!! See you soon :)	1396401384	451166221967581184	f	brooklynpopcorn
@ashleyxyzwtf Thank you for your support Ashley! Enjoy and we look forward to seeing you both soon!	1396401311	451165917247188992	f	brooklynpopcorn
RT @TheImpeckables: We are really enjoying the @BrooklynPopcorn kettle corn! It's one of our favorites!	1396401246	451165643082330112	f	brooklynpopcorn
@xoxoeve111 we were open 11-3!	1397245874	454708269236621312	f	nautimobile
@Q1043 @AndrewFesto @Z100NewYork @1035KTU @Power1051 @iHeartRadio @1067Litefm need a bit more of a heads up!	1397245859	454708207429365760	f	nautimobile
Yesterday was National Siblings Day and everyone was talking about it. Today is National Cheese Fondue Day, but nary a peep. 46th &amp; Park	1397223495	454614407260438528	f	nautimobile
@Anna_at_Mondo yes!	1397148312	454299066030391296	f	nautimobile
Mmmmmmm sun. 23rd and park	1397148303	454299027107237888	f	nautimobile
Yup! 23rd &amp; Park. RT @Anna_at_Mondo: @NautiMobile Are you in Flatiron today?	1397147440	454295406760165377	f	nautimobile
Had some technical difficulties today., so won't be out until tomorrow!	1397052122	453895614976516096	f	nautimobile
@reganfackrell Fredrick Douglas blvd between 116th and 117th!	1396712971	452473112689664000	f	nautimobile
Harlem food festival on Fredrick Douglas btw 116th and 117th. Now until 6!	1396712941	452472986986381312	f	nautimobile
We're thinking about making a "more" casual Friday on the truck. This would probably involve some backwards baseball caps. 46th and Park	1396622932	452095461709467649	f	nautimobile
We're Hiring! We are looking for the perfect fit to join our truck crew! All the info including contact here : http://t.co/u2QQXolW6F	1396560009	451831544865652736	f	nautimobile
Sometimes I think of a great tweet the night before, but totally forget when it's showtime. Today is one of those days. 23rd and Park	1396538214	451740131117260800	f	nautimobile
Back to serious business today after all that April fools horsin' around. 46th and park	1396447482	451359571165347840	f	nautimobile
League night at @RoyalPalmsClub tonight. All the biscuit and tang jokes have been made already I'm sure, so we won't try	1396382974	451089007716614146	f	nautimobile
@HalieKaplan we will be at an event tonight. 46th and park tomorrow	1396376821	451063200080228352	f	nautimobile
Real excited to be serving at league night at the @RoyalPalmsClub tomorrow.  Off today, though. Happy Opening Day Met fans... *crickets*	1396277910	450648336400662529	f	nautimobile
At least it's not snowing.. Right? 67th and Broadway	1396189792	450278741907091458	f	nautimobile
The Harlem food truck rally was postponed for April 5th, so we are at our regular Saturday spot. 67th and Broadway!	1396103620	449917309675900928	f	nautimobile
Has anyone else had enough of these CNN breaking news notifications that tell us nothing? Complaining about not real problems at 46th &amp; Park	1396013540	449539489187508225	f	nautimobile
It's a beautiful Spring Friday. Why not grab a six-pack after work? A Taim six-pack. http://t.co/fi3ryZgUdk	1397238183	454676011737960448	f	taimmobile
@saharloo Oh we know. We miss you too!	1397236233	454667833969238016	f	taimmobile
Thanks 4 the questions fans, currently we're on the street only Wed/Thur. We need to hire 1 more falafel engineer &amp; we'll be out more, soon!	1397231995	454650058055884800	f	taimmobile
RT @LDNSWORLD: Why not think about lunch before breakfast? Visit my friends at @TaimMobile see what I get -&gt; http://t.co/iAVze84OtB http://...	1397222615	454610713773096961	f	taimmobile
RT @NoLeftovers_: The easiest Hebrew word to memorize: Taim . It means delicious) @taimmobile #taim #eeeeeats @... http://t.co/qI5RQv2y...	1397159703	454346843863142400	f	taimmobile
RT @DanStreetman: Flatiron mobbing @TaimMobile today.... http://t.co/W0kprDCLv8	1397159681	454346752507006977	f	taimmobile
RT @samimain: oh is it thursday? good. then it's @TaimMobile ginger lemonade day!	1397146835	454292871278231552	f	taimmobile
@johnpmalone Lovely weather indeed. We are still in need of another employee to build out a full week schedule. Once we hire, we'll be back!	1397145137	454285748817367040	f	taimmobile
@PPTCHELSEA Currently set up as cash only on the truck 	1397144460	454282911110660096	f	taimmobile
We're back on 20th/5th with all your favorites 11-3. PLUS we now have Eggplant Salad and Beet Salad on the truck! #flatironfalafel	1397139985	454264141352804352	f	taimmobile
RT @hoppelpoppels: @TaimMobile Harissa platter rocked my lunch! #sogood #foodcoma	1397070230	453971565982806016	f	taimmobile
The city's best falafel &amp; smoothies are back on the streets today. Stop by the Brookfield Place food truck lot for all your favorites 11-3!	1397055542	453909960720908288	f	taimmobile
RT @DispatchBP: . @BrookfieldPLNY NORTH Lot | Wed., 4/9 | 11a-3pm | North End Ave. &amp; Vesey St. | @MexicoBlvd @MamuThaiNoodle @TaimMobile	1397055448	453909565944643584	f	taimmobile
RT @BalaboostaNYC: Seared scallops, spring onion, beluga lentil, preserved lemon yogurt, now available at Balaboosta http://t.co/7No5X0mwZm	1397052960	453899132105928704	f	taimmobile
It's Mushroom Thyme time at Taim! Falafel balls made w Portobello Mushrooms cooked in white wine &amp; seasoned w thyme, in stores today!	1396967795	453541922087632896	f	taimmobile
Taim and Taim Mobile will close from 4/14 @ 5:00 p.m. to 4/23 @ 11:00 a.m. for Passover. Plan your falafel fix accordingly.	1396963901	453525590076059652	f	taimmobile
RT @firstwefeast: The Complete Guide to Making Falafel at Home, with a little help from @TaimMobile's Einat Admony - http://t.co/J4BtiPW2As	1396962888	453521343242567680	f	taimmobile
RT @iamsprung: @Food52: We want to see your best chickpeas! http://t.co/h6jjFSu5sR boom! #falafel style from @TaimMobile http://t.co/7K38...	1396905652	453281274254602240	f	taimmobile
Thanks for the love yesterday Brooklyn! We underestimated your Taim devotion. Next month we will stock up accordingly  w more of your favs!	1396877904	453164891940356096	f	taimmobile
RT @noeticsound: @TaimMobile at the #foodtruckrally @ Food Truck Rally http://t.co/OK5jfc8uLp	1396832040	452972523962249216	f	taimmobile
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
Come see us we're on 5thave bwtn 22th and 21st! Remember our last day is oct 31 so there only a few weeks left to #TreatYourself	1381422440	388339977010286592	f	blend_express
If you're by 17th st and 5th that where you can find the blend truck! Its our last month so take advantage and #TreatYourself	1381335302	387974494339739649	f	blend_express
Good afternoon hungry ppl! Its lunch time! We're parked on 5th ave betn 21st and 20th st. If you near by, come by to #TreatYourself	1379605125	380717606862589952	f	blend_express
For today were on Park ave between 47th and 48th !!!!  #TreatYourself	1379000902	378183310054547456	f	blend_express
On broadway bwtn 55th and 56th st!! This is the only day of the week u can get it here so come by and #TreatYourself	1378829866	377465933251739649	f	blend_express
Come visit us April 26&amp;27th six flags great adventure http://t.co/dbyuRYfTXE	1397266851	454796253747232768	f	hibachiheaven
Come visit us April 26&amp;27th six flags great adventure http://t.co/IRj2zLmXub	1397266808	454796076449796096	f	hibachiheaven
@midtownlunch HH3 is on 47st &amp; Park Ave. @downtownlunch HH2 is on Varick &amp; Charlton #tribeca Get ur #YumYum &amp; Enjoy ur Weekend	1397224666	454619318668759040	f	hibachiheaven
@Tribeca We had trouble with the truck will be back tomorrow	1397142457	454274508162359296	f	hibachiheaven
@midtownlunch HH3 is on broadway &amp; 55st Get ur #YumYum	1397142350	454274061636739073	f	hibachiheaven
@downtownlunch HH2 is on Broad &amp; Water #FiDi @midtownlunch HH3 is on 46st bet 5 &amp; 6 Ave	1397057172	453916799189655552	f	hibachiheaven
@midtownlunch HH3 is on 47st &amp; Park Ave. HH2 is on Park &amp; 25st #baruchcollege Get ur #YumYum	1396965855	453533786597523456	f	hibachiheaven
@midtownlunch HH3 is on Broadway &amp; 55st. @downtownlunch HH2 is on Varick &amp; King #tribeka Get ur #YumYum	1396878686	453168170879422464	f	hibachiheaven
Still rocking @ harlem food truck festival http://t.co/9bXAjWev3O	1396732870	452556574184460288	f	hibachiheaven
Come celebrate Harlem Food Festival with @hibachiheaven we on Fredrick Douglas Blvd &amp; 117st	1396710073	452460957214969858	f	hibachiheaven
@ForestHillsNYC We are open for Lunch will be here till 5pm	1396709963	452460495958970368	f	hibachiheaven
HH2 will be on Fredrick Douglas Blvd &amp; 117st tom from 10-5 for Harlem Food Festival. Come get ur #YumYum	1396662383	452260930194505728	f	hibachiheaven
@ForestHillsNYC will be on Continental &amp; Queens Blvd from 11-5 tom   Come get ur #YumYum	1396662222	452260258267013120	f	hibachiheaven
@midtownlunch HH3 is on 47st &amp; Park   HH2 is on 5 ave &amp; 21st   Get ur #Yumyum	1396627313	452113836188119040	f	hibachiheaven
@midtownlunch HH3 is on Broadway &amp; 55st. @downtownlunch HH2 is on Varick &amp; King #Tribeca Get ur #YumYum	1396535973	451730728808906754	f	hibachiheaven
@midtownlunch HH3 is on 46st bet 5 &amp; 6 Ave come get ur #YumYum	1396446686	451356232360931328	f	hibachiheaven
@midtownlunch HH2 is on Park &amp; 25st and HH3 is on Broadway &amp; 55st. Come get ur #YumYum	1396360316	450993972593561600	f	hibachiheaven
#Tribeca We Are Here! HH2 is on Varick &amp; King. Get ur #YumYum	1396275458	450638051857797120	f	hibachiheaven
Will be @ColumbiaUniver from 4-8 pm Tonight for Matsuri	1396018895	449561949396025344	f	hibachiheaven
@midtownlunch HH3 is on 47st bet Park &amp; Lex. HH2 is on 5 Ave &amp; 21st. Get ur #YumYum and Have a Great Weekend!	1396018688	449561078864019457	f	hibachiheaven
@radandu @randomfoodtruck yes, the menu is rotating btwn Vietnamese and Thai	1397262382	454777511675969536	f	bigdsgrub
@radandu: @bigdsgrub @randomfoodtruck where's the cart today? The Khao Cart was at Broadway and 55th St., did you get to come by?	1397243271	454697354432888833	f	bigdsgrub
RT @mrsmariataylor: @bigdsgrub Big D's Grub food cart on 7th/55th duck fried rice fried egg! https://t.co/2dslIvY1wj	1397243206	454697081710841856	f	bigdsgrub
RT @mrsmariataylor: Video: @bigdsgrub Big Ds Grub food cart Fried rice Fried egg onion gravy! #whatsnewinny @mrsmariataylor... http://t.co...	1397243203	454697068788195328	f	bigdsgrub
What's for lunch @randomfoodtruck? Big D's Khao cart is here. Check out the menu!! http://t.co/tPHgko4V7R	1397219214	454596449930858496	f	bigdsgrub
@StreetGrubSteve: I'll be on Eat St. tonight at 8PM hanging with the super rad Chef Adam Sobel and Cinnamon Snail! Awesome!	1397170122	454390543884488704	f	bigdsgrub
@mamuthainoodle: Prospect Heights!! We've come back to show you love! Lets have dinner together, noodles are being served! 6pm YES please!	1397165659	454371826123440128	f	bigdsgrub
@914BigD123: @bigdsgrub thank you for the delicious grinder and dumplings glad you enjoyed!	1397158154	454340348547174400	f	bigdsgrub
@roshow: The Loco Moco for @bigdsgrub khao cart is living up to my expectations Moco Loco keeps one sane.. in this loco city!	1397158106	454340143537979392	f	bigdsgrub
RT @roshow: Yes, I think it is. cc: @doitJEFFSTYLE RT @bigdsgrub: It's Moco Loco day!	1397146020	454289453344108544	f	bigdsgrub
@JasonBird80: @bigdsgrub @MatthewPizzulli well the only way to celebrate that holiday is with a grinder! TGIT and you're in #Midtown! Ha!	1397141071	454268697029640193	f	bigdsgrub
@MatthewPizzulli: @bigdsgrub this is a beautiful day...it should be a national holiday! It should be!!	1397138087	454256179179683840	f	bigdsgrub
It's Moco Loco day!	1397137976	454255714165604352	f	bigdsgrub
Its THAT time of the week!\nBig Ds Grub Truck is B2B w/ the Khao Cart at 50th Street btwn 6th and 7th Avenue. 11am to 2:45pm\nLETS GOOOO!!	1397135522	454245422673190912	f	bigdsgrub
Khao Cart is at 50th Street btwn 6th and 7th Avenue. Check out todays menu!! http://t.co/jckO5kXVAt	1397135412	454244958292422656	f	bigdsgrub
RT @PoetrySocietyNY: Shout out to @morristruck and @bigdsgrub, just two of the many amazing food trucks coming to #nycpofest.	1397099063	454092499888668672	f	bigdsgrub
@MatthewPizzulli Loco Moco tomorrow?	1397076498	453997854479384576	f	bigdsgrub
@iamevie Loco Moco tomorrow! (Thursday)	1397076457	453997684190613504	f	bigdsgrub
@justyniak until 230?	1397067061	453958273373175808	f	bigdsgrub
RT @FoodtoEat: Soak in the sun in #FiDi today @bigdsgrub ! Preorder online here to #SkiptheLine: http://t.co/R2ZLXSdae2	1397058637	453922940409880576	f	bigdsgrub
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
#MikeEpps visits #NewEraCap Promo Truck #SuperBowl with #CrystinaPoncher #ESPN\nhttp://t.co/k0PPVYUhBq http://t.co/3MeumAKTUz	1391084755	428866664227024896	f	thecrepestruck
#VictoriaJustice at #Uggs Aulstralia on Madison Ave &amp; 58 Street tonight from 6:30pm-8pm	1383866974	398593095865884674	f	thecrepestruck
Come meet #VictoriaJustice at the #Ugg Store tonight on Madison Ave. We're giving out free coffee and hot chocolate from 5-6pm	1383864158	398581286391918592	f	thecrepestruck
We're on 50 Street btw 6 &amp;7 Ave today until 3pm. Come check out our Portobello Mushroom Crepe.	1378910456	377803953406509056	f	thecrepestruck
Good morning everyone. Start the week off right with a crepe from #TheCrepesTruck. We're on 50th street between 6 &amp; 7 Ave.	1378732102	377055881386393600	f	thecrepestruck
The Crepes Truck at the #MaimiMonkey premiere with #BigAngVH. http://t.co/eOIVPAacOR	1378731825	377054722555146240	f	thecrepestruck
The Crepes Truck at the #MaimiMonkey premiere last night with #BigAngVH1. http://t.co/eDDgsBBfH7	1378731779	377054527796412416	f	thecrepestruck
Cosmo Radio at Sirius, interviewed #CrepesTruck owner Stephen Asaro to talk crepes. We'll let you know when it airs. http://t.co/yLaNCWjkQ6	1374612250	359775969659195394	f	thecrepestruck
#thehub is giving away free ice cream today &amp; tomorrow. Come find the truck. http://t.co/IwCL7FnQJ9	1372260998	349914105789952001	f	thecrepestruck
Softee Xpress giving out free ice cream in Union Square for Citi Bike lauch 11-3pm http://t.co/SpN8kFndSg	1370183760	341201539010023424	f	thecrepestruck
Crepes Truck will be on Broadway &amp; Broome in Soho today from 11-4pm	1370183686	341201226735689728	f	thecrepestruck
Come to the Veuve Cliquot Polo Classic at Liberty State Park tomorrow. We'll have delicious crepes and frozen yogurt from Softee Xpress.	1370033785	340572497982410753	f	thecrepestruck
Crepes Truck will be in Soho tomorrow from 12-5pm on Broadway &amp; Broome. Come check us out.	1362185569	307654694975717376	f	thecrepestruck
We are on 50 street btw 6 and 7 avenua. Come check out our lunch menu.	1361551411	304994842017157120	f	thecrepestruck
The weather is beautiful. Come join us on 50 Street btw 6 &amp; 7 ave for a sweet crepe.	1360946473	302457546575339522	f	thecrepestruck
Brave the cold and get a hot and toasty crepes. We're on 49 Street btw 6 and 7 ave	1360253967	299552968284459009	f	thecrepestruck
We are on 50th Street btw 6 and 7 Avenue today from 12-3pm.	1360169051	299196805038628864	f	thecrepestruck
We're on 49 St bwt 6 &amp;7 ave today from 11-3pm. Come by for a delicious crepe.	1359646471	297004943397752832	f	thecrepestruck
We are on 50 Street bwt 6th &amp; 7th Ave from 11:30am-2:30pm. Come check us out	1358527085	292309901068349440	f	thecrepestruck
Anyone with an imaginary GF or BF gets $1 off their crepe order today.	1358441472	291950811280461824	f	thecrepestruck
Hudson/King St. we call you our home, however a truck at your location is not a home unless you stop by &amp; bring your warm and joy to us.	1397222811	454611536737480705	f	sweeterynyc
RT @Tara_TheTerror: My biggest struggle in the morning is deciding whether I want hot coffee or iced coffee #GiveMeBoth @SweeteryNYC	1397222066	454608414593650689	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/aR2bxOh541	1397216119	454583470040567808	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/aR2bxOh541	1397129705	454221024775909377	f	sweeterynyc
Don't just tweet about it, it's ok 2 yell it out! Sweetery has lots of FREE promotions coming up soon, we lov giving away free deliciousness	1397063699	453944173025300481	f	sweeterynyc
Good morning Hudson/King St. What a terrific day it is outside. Stop by for a little pick me up and take our sunshine inside with you.	1397049227	453883474395799553	f	sweeterynyc
http://t.co/cSP4rPKalZ	1397047504	453876246745989120	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/aR2bxOh541	1397043310	453858657768587264	f	sweeterynyc
@anna_cheng Hi Anna! Unfortunately we are not on Hudson at the moment, but we'll be back tomorrow morning! We'll see you then!!	1396979432	453590733409509377	f	sweeterynyc
@lilygoodspeed alas 	1397330631	455063768100511744	f	waffletruck
@anna_cheng unfortunitly we are not, we'll be back tomorrow. Have a great day just the same!!	1396978746	453587853323567104	f	sweeterynyc
@CorreyHope Keep following and you will have another opportunity to win!! Next time you may be the lucky winner!	1396973532	453565987666026496	f	sweeterynyc
Thank U everyone for participating! Please keep following for the next opportunity to win tickets to the MET! Have a Sweet week!	1396973265	453564865911988224	f	sweeterynyc
@taikob0y Congrats!! You are the winner of tonight's tickets! Have a great night with your Mom! Tweet us a pic of you two at the Opera!	1396972919	453563415102255104	f	sweeterynyc
One last ? Before we choose our winner! Who will you take with you to the Opera if you win free tickets tonight's performance?	1396969510	453549116011085824	f	sweeterynyc
@sarcasmstation I see you're a Hawks fan, are you from Seattle?	1396968515	453544940866641920	f	sweeterynyc
Gd Mrng Sweetery fans! U have 1 last chance to win tickets to tonight's Opera at the Met! Tell us why it should be you and they are yours!	1396967664	453541371828535296	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/aR2bxOh541	1396956904	453496240765149184	f	sweeterynyc
We have 2 orchestra seats 2 Tues. nights performance of Andrea Chenier @ The Metropolitan Opera. If u want them tell us y u really want them	1396912094	453308297563893760	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/aR2bxOh541	1396870505	453133857693655040	f	sweeterynyc
Serving Now at Hudson/King St - 375 Hudson Street New York From 7:30AM Until 3:00PM EDT http://t.co/aR2bxOh541	1396611304	452046692758876160	f	sweeterynyc
@FDNYGIS we are no longer operate on the cart anymore the permit has been expired. Only catering to officeses	1396884033	453190601203515393	f	lovemamak
@pancakesnwhisky, We would love to be a part of it as well! Count us in! Thanks please send us more detail. Erik@lovemamak.com	1396839572	453004115661291520	f	lovemamak
We will be here whole season until November!	1396818905	452917434715222017	f	lovemamak
RT @ChoiceEats: Can't wait to have @LoveMaMak @MooShuGrill @SweetChiliNYC at #ChoiceStreets! We wish you were parked outside our office eve...	1396746432	452613457482096640	f	lovemamak
Yes we are @smorgasburg until 5pm today!	1396717932	452493922846375936	f	lovemamak
RT @pichetong: Many things going on for #songkran #thai #newyear including my @beardfoundation dinner for @LUCKYRICEFEST . @QiNyc http://t....	1396626758	452111508802375680	f	lovemamak
RT @Food52: .@topwithcinnamon shows us how to make the classic British crumpet -- best eaten with your pinkies out: http://t.co/FNihAYab5k	1396624295	452101181092139008	f	lovemamak
Welcome back with new menu and new price! 21st and 5th ave! Stop by, will be here til 2.30pm http://t.co/fJPUFRXenX	1395331564	446679070676635648	f	lovemamak
@pinguswobbin 21st 5th ave tomorrow 11.30am till 2pm	1395198377	446120444006264833	f	lovemamak
@BonyBambix3 awwwww, tomorrow we will be at 21st 5th ave, when the weather fets littlw better we will be back to williamsburg	1395198310	446120165454139392	f	lovemamak
@singhkashminder tomorrow we will be there!! Spread the word pleaseeeeee :)	1395198241	446119875078258688	f	lovemamak
Welcome back! @FlatironNY corner of 21st and 5th ave #malaysianfood	1394722321	444123723579543552	f	lovemamak
@Playmaka34 @djeshin i dont want any shaved ice anymoreeeeee T T	1394559382	443440306261065728	f	lovemamak
@Playmaka34 @djeshin we just mentioned about it last night about going back. Spring is here	1394558932	443438419520552960	f	lovemamak
Many carts and trucks @ Hanover Square! At least our food is different then others! Try it if u havent! #rendang #nasilemak #MalaysianFoods	1394555657	443424681790816256	f	lovemamak
Thx for the shoutout. Come and get'em! @i8and8: Cream filled Malaysian pancakes #Dessert @lovemamak http://t.co/zjbZJrNaUQ	1393613871	439474547902132224	f	lovemamak
Apom Balik (Crispy pancake) with a twist ?! Hazelnut Nutella, King Banana, Brazilan Coffee custard cream! #FREE http://t.co/Bx3PhaQxnq	1393606769	439444758017355776	f	lovemamak
@JoeyCircles 7 Hanover sq	1393270733	438035322719719424	f	lovemamak
@JesseDRodgers @nycfoodtruck glad to hear that! Proud of serving u authentic and welcome to #malaysiakitchen	1393007385	436930759728050176	f	lovemamak
@JesseDRodgers @nycfoodtruck how do u like it ? ^_^ plz tell us ur thought on #yelp	1393006493	436927018023002113	f	lovemamak
The best #foodtruck event of Spring/Summer is back! http://t.co/FQ0cx8Eo3t @DispatchNY @nycfoodtruck	1396966547	453536688875524096	f	getstuffednow
RT @crossroadny: #Teatime 2day! #fresh brewed iced tea  only $2 3-5pm this week. The perfect alternative when u want low dose caffeine! #co...	1396886906	453202649564053504	f	getstuffednow
RT @crossroadny: #ThirstyThursday &amp; the hot weather is just right for some iced coffee Use your @PayPal app and get $5 off your check - fre...	1396533464	451720205648265216	f	getstuffednow
#Wolrdautismawarenessday , read more here and find how u can help! http://t.co/Eo4HwMJj6r	1396454349	451388374939873280	f	getstuffednow
RT @Gov_Island: Google Naps! Just 7 weeks, 3 days, 23 hours, 53 minutes till #GovIsland #hammocknap. http://t.co/5JRf2iZyk0.	1396361327	450998209687875584	f	getstuffednow
RT @ChineseMirch: Its #AprilFoolsDay, did u prank someone ? Tweet us and the coolest one gets a $25 gift card to our restaurants ! and that...	1396361303	450998109083295744	f	getstuffednow
RT @BKBazaar: Photo: Wow! Look who came through tonight @lindsaylohan http://t.co/5K8dCWOkEA	1396189085	450275776014069760	f	getstuffednow
Ok we give up, there are some #food #holidays when we have nothing! National Black Forest Cake Day?? #bizarrefoods	1396015364	449547136473243648	f	getstuffednow
Do you know how to find #Manhattan cross streets? http://t.co/e2OxMYlFiN #tips	1395758822	448471121093206016	f	getstuffednow
If there was a day made for #streetfood it is today! Gorgeous Weather in #Manhattan !	1395410489	447010106790903808	f	getstuffednow
RT @GoVimbly: Big Apple Barbecue (@bigbarbecue) FastPasses are on sale now for June 7 &amp; 8, 2014! http://t.co/fV8LcnTLWC	1395410436	447009885751115776	f	getstuffednow
RT @crossroadny: #freecoffeehour 10:30-11:30! 120 lex , corner of 28th! #coffeerocks #coffeeshop	1395056067	445523554608881664	f	getstuffednow
RT @MobileCuisine: Today's #FoodTruck #QuoteoftheDay comes from Josh Kim of Philly's @Spotburgers http://t.co/DvCPnj7rfw	1394803067	444462395352944640	f	getstuffednow
Is #Jerceycity the new #Brooklyn? http://t.co/J7AiGuk7ew	1394635645	443760175800131584	f	getstuffednow
RT @elGringoPeru: @nycfoodtruck: 5 Tips for New Food Truck Operators courtesy of @GetStuffedNow: http://t.co/NLw7JxKR6G #keepontruckin #fo...	1394574652	443504355355140096	f	getstuffednow
RT @ChineseMirch: #TerrificTuesday weather! Don't forget #NYC location is now open 4 #lunch &amp; #dinner !	1394556730	443429184082563072	f	getstuffednow
We are not there this year but the @ChoiceEats is always our fave! It is literally a #getstuffednow invite!	1394460782	443026748771692544	f	getstuffednow
RT @ChineseMirch: Lost hour of sleep has u cranky ? The best antidote- green tea! Steep some @home or come over 4 a cup at brunch. All loca...	1394375931	442670858763767809	f	getstuffednow
Gorgeous weather #NYC! We want 2 wish our friends @crossroadny best of luck as they gear up 2 open . Follow them 4 #freecoffehour every day!	1394297117	442340286761799680	f	getstuffednow
@themoofoodtruck @nycfoodtruck thx 4 the thumbs up!	1394227732	442049267407257600	f	getstuffednow
Happy Friday!We r @ varick &amp;king st. We just start new menu for spring  summer : daily limited Rice burger. bibimbap burrito. Swingby&amp;EnJoy	1397229980	454641606667542529	f	bobjotruck
BOBJO express open at Hanover sq. and water street . Thank you!	1397144053	454281204268023808	f	bobjotruck
Hello Sunny Flatiron ! We r open at 22nd &amp; 5 th ave. Try our new memu - rice burger and bibimbap burrito . Stop by and enjoy.  :)	1397144003	454280993516830720	f	bobjotruck
Hello NYC ! We r open at Hanover sq. &amp;water st. We set up new menu for spring &amp; summer. - Rice burger &amp; bbb burrito and more.Stop by &amp; enjoy	1396971214	453556263780384768	f	bobjotruck
Hello NYC ! We r open @ varick and king st. Try our ramen noodle soup and rice platter !!  Thank you	1396626227	452109281656340481	f	bobjotruck
Bobjo express will open at water and hanover sq today! \nThanks	1396538874	451742898812633088	f	bobjotruck
Good morning flatiron!\nBobjo truck open at 22st and 5th ave today. We open at 12pm.\nTry our ramen noodle soup and rice platter! \nThanks!	1396538847	451742786145251328	f	bobjotruck
BOBJO express stay @ state And Whitehall st.  Thank you :)	1396367329	451023387910213634	f	bobjotruck
Hello! We r open @ water&amp;Hanover sq. This isn't an April Fools Day joke. 2day very special  platter. Try our ramen noodle soup as well.thx	1396367254	451023072779583488	f	bobjotruck
Bobjo express will open at state st and whitehall st today. \nThanks!	1396280191	450657904144973824	f	bobjotruck
Hello NYC ! We r open at 46th st. between 5th &amp; 6th ave. try our ramen noodle soup and rice platter. Thank you.	1396280156	450657754634797056	f	bobjotruck
Happy Friday !  We r stay at varick and king st.  day with BOBJO noodle soup and rice platter. It'll make u happy! I bet	1396022313	449576282821779456	f	bobjotruck
Hello sunny NYC !! We r stay at 22nd 5th ave !! Try our ramen noodle soup and rice platter	1395938633	449225302594846720	f	bobjotruck
Bobjo express will open at state st and whitehall st today. \nTry our ramen noodle soup!\nThanks!	1395847118	448841464597184513	f	bobjotruck
Bobjo truck open at Broadway btw 55st and 56st today.\nTry our ramen noodle soup and rice platter! Its will make u warm.\nThanks!	1395847011	448841013197832192	f	bobjotruck
Good morning nyy!	1395846932	448840681331904512	f	bobjotruck
Bobjo express will open at State st &amp; whitehall st today. 	1395762387	448486075368222720	f	bobjotruck
Hello sunshine NY. We are open at water st. And Hanover sq. plz try our ramen  noodle soup and rice - - platter thank you.	1395762152	448485091522928640	f	bobjotruck
Bobjo express will open at State st &amp; whitehall st today. Try our ramen noodle soup!	1395674191	448116156218355714	f	bobjotruck
Good morning ny! Bobjo truck open at 46st btw 6ave &amp; 5ave today! Try our ramen noodle soup and rice platter! Its will make u warm.  Thanks!	1395674158	448116017529516032	f	bobjotruck
#TGIF here at @BrookfieldPLNY folks! Open now till 2! #comeEAT	1397231644	454648587776176128	f	morristruck
Today from 12PM-2PM, we'll be serving up #free grilled cheese @CapitalOne360NY! Join us &amp; chomp some cheddar while you save some cheddar.	1397219918	454599401420619776	f	morristruck
Love our grilled cheese &amp; saving $? Stop by @CapitalOne360NY tomorrow from 12PM-2PM as we serve up sandwiches while they serve up saving!	1397158214	454340598666108928	f	morristruck
Hey hungry #midtown cheesers! We're open at 51st btw Mad &amp; Park till 2:30! Come #EAT!	1397143596	454279284707033088	f	morristruck
Hey @DumboNYC @DUMBOFoodTrucks we're on our way! Pearl &amp; Front st 12-3! Come by and we'll tell you the exciting reason why we're late!	1397056350	453913349622099968	f	morristruck
Don't believe the #weatherhype! It's beautiful out! Get some vitamin D while getting some vitamin C(heese) at 29th &amp; Park, 1130-230!	1396969490	453549032041111552	f	morristruck
It's time to get on the #lunchtime #cheesetrain,Midtown! We're at 52nd &amp; 6th from 11:30-2:30, #comeandgetit	1396883228	453187221173321728	f	morristruck
Hey friends! We know you miss us on the weekends- luckily you can get our sandwiches 7 days a week @crossroadny in #Flatiron / #Murrayhill!	1396721585	452509242483048448	f	morristruck
#TGIF at N End &amp; Vesey! It's the perfect day for a gooey grilled cheese &amp; hot tomato bisque! #comfortyourstomach #EAT #cheesinfortheweekend	1396624090	452100319800217600	f	morristruck
Heck yea, sun's out, we're at 51st &amp; Mad, 1130-3, listening to #TheBoss all day. #bestdayever #hungryheart #borntocheese	1396537593	451737524931952640	f	morristruck
Ok, @DumboNYC, get #hungry! We're at Pearl &amp; Front for lunch today, and we wanna FEED YOU. #thebestsandwichesaround	1396450958	451374151543312384	f	morristruck
@radi0head Don't despair! We'll be all over the place once the summer hits. See you soon?	1396376013	451059808058478593	f	morristruck
No jokes here! We're at 29th &amp; Park ave for lunch today! 11:30-3! #bestdayever Current menu here: http://t.co/sAe7htQti5 #HappyApril	1396364642	451012117639200768	f	morristruck
It's Monday &amp; the clouds have cleared! Lucky you, #midtown, we're at 52nd &amp; 6th and ready to feed you lunch from 1130-3. Its your lucky day!	1396278171	450649431185297409	f	morristruck
Come end your week/start your weekend off right with #shuffleboard @RoyalPalmsClub and grilled cheese from us! #cheesingfortheweekend	1396046488	449677681236652032	f	morristruck
Feeling Springy? Get your tickets now to the @StoneBarns Sheep Shearing Fest, May 3rd! Tickets here: http://t.co/N1mAA7oENn	1396029656	449607082934013952	f	morristruck
Forget the #weather, #TGIF is all that matters! Get yourself out to @BrookfieldPLNY @DispatchBP truck lot at N. End &amp; Vesey for lunch!!	1396018874	449561860661329920	f	morristruck
Thursday! We made it! Now make grilled cheese your lunch choice and get over to 51st nr Madison for melted goodness! #cheese #warmsthesoul	1395933032	449201811829043200	f	morristruck
Hope you're hungry @DumboNYC @DUMBOFoodTrucks, cause we're making you lunch today! Pearl &amp; Front, 1130-3! #EAT #cheese	1395846426	448838559508987904	f	morristruck
We missed you @DumboNYC! Come eat with us at Pearl &amp; Front today like good ol times!	1395844108	448828836197990400	f	morristruck
RT @DispatchNY: . @BrookfieldPLNY NORTH Lot | Fri., 4/11 | 11a-3pm | North End Ave. &amp; Vesey St. | @SchnitznThings @MorrisTruck @ToumNYC @Sh...	1397232551	454652390734454785	f	toumnyc
RT @FoodtoEat: Lunchtime! .@ToumNYC is at #WFC today. Preorder delicious Lebanese online to #SkiptheLine: http://t.co/iNRckg588w	1397232534	454652319691309057	f	toumnyc
Happy #MeatlessFriday! Try our #vegan platter on North End &amp; Vesey St until 3pm! #FoodTruckFriday #LebaneseLunch http://t.co/wx97QFMTuM	1397222739	454611235741245440	f	toumnyc
Hello #Dumbo! Try our #Vegan special Moujadara (rice &amp; lentils w/ caramelized onions) Get yours on Jay &amp; Water today! http://t.co/nFLTuAbsum	1397136169	454248134726918144	f	toumnyc
Grilled kafta gets them every time :) Check out Jacqueline Y.'s review of Toum on @yelp http://t.co/96ZA7huDTA	1397061220	453933776238702592	f	toumnyc
Happy #HumpDay #MidtownEast! We've got makanek galore on 47th btwn Park &amp; Lex. Come on down for a tasty platter! http://t.co/opbLOzGgSc	1397049828	453885996367892480	f	toumnyc
@DaisyMaxey Great photo! So happy you enjoyed :)	1396981001	453597311093178368	f	toumnyc
RT @DaisyMaxey: Toum lunch: Mmmmm, Veggie platter; truck is at 46th between 5th &amp; 6th today -The Best! @ToumNYC http://t.co/cAQ2RPgUw2	1396980968	453597175852068864	f	toumnyc
It's tabbouleh Tuesday's and we're making it fresh right now! Get some today on 46th btwn 5th &amp; 6th! #yummy #healthy http://t.co/uPKrFU99Ic	1396964850	453529569606533120	f	toumnyc
Got the Monday blues? We have the cure! A delicious #LebaneseLunch will turn that frown upside down. Come on over to Jay &amp; Water in #DUMBO	1396877427	453162891819380737	f	toumnyc
RT @nycfoodtruck: . @NuchasNYC @ToumNYC @CoolHausNY @GCNYC1 etc. are waiting for you at @Prospect_Park's #GrandArmyPlaza! http://t.co/35XcR...	1396798128	452830286276231168	f	toumnyc
The @prospect_park #FoodTruckRally is back on starting today at Grand Army Plaza &amp; the weather couldn't be more perfect! Join us from 11-5 	1396790364	452797724099117056	f	toumnyc
@leonardbenardo1 Thank you! We love hearing from happy customers  What did you have today?	1396734925	452565196461322240	f	toumnyc
RT @leonardbenardo1: Toum, garlic in Arabic, is the first Lebanese food-truck in NYC.  Excellent too! http://t.co/nDK2nY6Vcc	1396734869	452564958631706625	f	toumnyc
@ivanahumpsalot Hi!! Were in Brooklyn today at the soccer Parade Grounds in Prospect Park! Hope to see and feed you soon 	1396710498	452462739932594176	f	toumnyc
It's a gorgeous #Saturday in @prospect_park at the #ParadeGround. Come on by for delicious #LebaneseEats. We'll be here until 5pm 	1396709764	452459664278843392	f	toumnyc
RT @nycfoodtruck: The 1st #FOODTRUCK RALLY of 2014 is happening this Sunday, 4/6, at @Prospect_Park's #GrandArmyPlaza! http://t.co/JpLjXK83...	1396628836	452120225069019137	f	toumnyc
It's gloomy outside, but that shouldn't stop you from having a #LebaneseLunch so pre-order at 917-TOUM-350 &amp; pick up on North End &amp; Vesey :)	1396619312	452080278643953664	f	toumnyc
RT @dumbolot: What's happening #DUMBO:) we got @ToumNYC @MexicoBlvd and @mausamnyc  today!	1396539024	451743525994905600	f	toumnyc
Nothing like sinking your teeth into a juicy beef kabab. Get yours today on Jay &amp; Water in #DUMBO #LebaneseLunch http://t.co/k7lAc26Eez	1396533507	451720388334997504	f	toumnyc
http://t.co/ALilf8rjGX	1396807699	452870433306861569	f	funbunsnyc
RT @FoodtoEat: @ETRAVAGANZA @funbunsnyc @NuchasNYC @ToumNYC @SnapTruck 5 Superfood Combos That Will Give You #Olympic Strength http://t.co/...	1391455990	430423736454774784	f	funbunsnyc
Please vote for our homies @mooshugrill  !!!  http://t.co/Cy1hnmtC00	1387580633	414169311516033025	f	funbunsnyc
RT @FoodtoEat: Today's answer to #12DaysofFoodTrucks is @funbunsnyc ! Thx to all those who played and tune in Monday 12/23 for the LAST day!	1387576969	414153945398128640	f	funbunsnyc
@petermgates We were there till 2:30 p.m. Sorry for the late response.	1383427654	396750454551756800	f	funbunsnyc
47th st btwn Park and Madison ! Our last day of the season. Grab some funbunsnyc before we're gone for the year !	1383226631	395907303398211584	f	funbunsnyc
@toastmonsternyc  Hey hey since when you do mushroom buns...	1383146209	395569989115457536	f	funbunsnyc
Good Morning Midtown ! We are on 50th st btwn 6th and 7th ave today! We've got roast pork, roast duck, mushroom buns today ! #deliciousness	1383138436	395537385834172416	f	funbunsnyc
@SMKahn2  We are in Dumbo brooklyn today!  On front st and Adams st till 2:30pm	1383064270	395226311092101120	f	funbunsnyc
We've got roastpork, duck, mushroom buns today !	1383061696	395215514332823552	f	funbunsnyc
Hey peeps we're back in Dumbo, Brooklynnn today ! Corner of Front st and Adams st ! @DUMBOFoodTrucks	1383056983	395195746854916096	f	funbunsnyc
Heads up @DUMBOFoodTrucks we'll be heading to dumbo tomorrow (Tuesday) for lunch !	1383002181	394965890510630912	f	funbunsnyc
@fabianluque This is actually our last week of our season. Catch us on 50th st btwn 6 &amp;7ave. Mon-Thurs	1382968189	394823317808775168	f	funbunsnyc
50th st btwn 6&amp;7ave ! Our last day of the season is Thursday.	1382966733	394817212131057665	f	funbunsnyc
RT @dudesoup: @funbunsnyc the Duck I had yesterday was amazing	1382720076	393782658515611648	f	funbunsnyc
@biandangnyc  Spank ya	1382719776	393781401348476928	f	funbunsnyc
RT @biandangnyc: @funbunsnyc yours. ;)	1382719744	393781264568025088	f	funbunsnyc
What's your favorite bun ?	1382717261	393770849284935680	f	funbunsnyc
Funky Fresh Friday Funbunsnyc on 50th st btwn 6th and 7th Ave :p  This will be our last Friday of the season, so come Friday peepS !	1382706171	393724335997071361	f	funbunsnyc
There's tons of vendors out here on 50th btwn 6th and 7th ave, but there's only one Funbunsnyc ! #holla@yaboi	1382620308	393364198895652864	f	funbunsnyc
#TGIF! Which handheld delicious empanada will you be starting the weekend with?	1397250308	454726867460059137	f	nuchasnyc
RT @MonsieurBobo: Cash buys tasty empanadas (C.B.T.E!) get the money, etc. (@ Nuchas Artisan Empanadas - @nuchasnyc) http://t.co/PaCW0wYg6Y	1397241979	454691935694118912	f	nuchasnyc
Fridays were meant for #empanadas! What's better than handheld lunch? #regram @iluvfoodtrucks1 http://t.co/0bTVM5Nxkm	1397241690	454690722151944193	f	nuchasnyc
Our fearless leader Ariel is traveling around Ecuador!\nThese empanadas are from a restaurant called Patria Cocina... http://t.co/5AUzuwmd2q	1397239201	454680282767974400	f	nuchasnyc
#FF @HuffPostFood @grubstreet @foodandwine @bonappetit @Food52 @seriouseatsny @nytimesfood @EaterNY @TastingTableNYC @nycfoodtruck	1397233215	454655176990007296	f	nuchasnyc
Help us out! Please nominate Nuchas for a 2014 NYC @vendyawards and then read this: We love you. http://t.co/nkeRceHslb	1397167230	454378415656034304	f	nuchasnyc
@InItforthePerks we look forward to seeing you soon!	1397153646	454321437202194432	f	nuchasnyc
RT @InItforthePerks: @NuchasNYC they're delish! I will be back ASAP!	1397153636	454321398245502976	f	nuchasnyc
Nuchas CATERING! It's Nuchas where you need it, when you want it!\n\nIt's simple, just email your catering needs to... http://t.co/5DyjaKYuPl	1397152802	454317896580096000	f	nuchasnyc
@InItforthePerks Thanks for checking in! We hope you enjoy your empanadas!	1397148570	454300149343592449	f	nuchasnyc
Come get your #biandang fix for we will not be here on 53rd and park tomorrow.	1397150125	454306668751249408	f	biandangnyc
RT @DispatchBP: . @BrookfieldPLNY NORTH Lot | Thurs., 4/10 | 11a-3pm | North End Ave. &amp; Vesey St. | @NuchasNYC @MilkTruckNYC @Palenquefood ...	1397141319	454269734134235136	f	nuchasnyc
German is busy in the kitchen making a new flavor of Nuchas! What is it!? http://t.co/tljrM8m90z	1397075128	453992111944114176	f	nuchasnyc
Nuchas truck is located on Verick st between Kings and Charlton! #MuchasNuchas http://t.co/H4oy6oyJY6	1397051035	453891056652648449	f	nuchasnyc
Truck is at Varick &amp; King for lunch.  Great day to eat outside!!!  See you soon. #empanadas #muchasnuchas	1397049672	453885339539877888	f	nuchasnyc
RT @34thStNYC: Happy #NationalEmpanadaDay! Our favorite empanada spot - @NuchasNYC kiosk at #GreeleySquare. Open til 9pm today. http://t.co...	1396983655	453608445753978880	f	nuchasnyc
@lorimccaskill We're sorry to hear! Please email amy@nuchas.com to help right this wrong	1396979886	453592634863652864	f	nuchasnyc
@chris_quartly Thanks for celebrating with us!	1396979809	453592314758594560	f	nuchasnyc
@springwaves45 Great to hear!	1396979800	453592276812701696	f	nuchasnyc
RT @springwaves45: @NuchasNYC 1st time having the Argentine empanada- good food #awesome	1396979794	453592252456382464	f	nuchasnyc
RT @Chris_Quartly: Celebrated #NationalEmpanadaDay by having three empanadas from @NuchasNYC food truck.	1396979749	453592063289069568	f	nuchasnyc
@ItsMaddieYoung: @MexicoBlvd I owe you guys $3, don't worry I'll be back. Thanks for the excellent quesadilla. :)	1397230169	454642399219040256	f	mexicoblvd
It's a sun-shiney day, #DUMBO Sunshiny? Nosotros no sabemos. It doesn't matter. Come eat with us in the Water &amp; Jay St lot for lunch today:)	1397143247	454277823482843136	f	mexicoblvd
RT @SGregg11: Thank you@mexicoblvd for making my day with this torta http://t.co/S0CICgyoVf	1397143083	454277135633772544	f	mexicoblvd
Thank you for enjoying the sunshine with us today, #WFC! Now to continue the party over to #Astoria! See you for dinner :) 31st &amp; Ditmars	1397076630	453998409545166848	f	mexicoblvd
RT @j_mosk: @MexicoBlvd Tacos! http://t.co/LXabRHeRkQ	1397076532	453997999174455296	f	mexicoblvd
@HenryWilliams74: If I was being executed, my last meal would be 6 MexicoBlvd tacos, some guac&amp;chips, and a 22oz Dos Equis Amber. #tacoluv	1397076510	453997908543959041	f	mexicoblvd
We're at #WFC North End Ave &amp; Vesey St lot til 2:30ish. Come get your groove on, food truck lovers. Preorder http://t.co/oQXMKijgpg #tacoluv	1397054522	453905682123980800	f	mexicoblvd
@procopy: @MexicoBlvd My first experience today... not only delicious, but extraordinarily delicious. I ate. I enjoyed. I'll come back!	1396987682	453625333745332224	f	mexicoblvd
RT @cbsymonds: a colleague told me today that if I never did anything else of note in my life I could rest easy knowing I introduced him to...	1396987561	453624827740295168	f	mexicoblvd
Parked and open at 46th between 6th &amp; 7th! Come on down for some #tacolove	1396971470	453557337761251329	f	mexicoblvd
Happy Monday #DUMBO ! We're on Jay &amp; Water St til 2:30ish today ready with an awesome lunch for you :) see you soon	1396881290	453179094604468224	f	mexicoblvd
#Astoria til ten pm Ditmars &amp; 31st #letsgo	1396647791	452199726856040449	f	mexicoblvd
Hola #Brooklyn beauties. We will see you in the lot on Jay &amp; Water St for lunch (til 2:30ish) then for dinner 514 Union St @RoyalPalmsClub	1396530461	451707612963561472	f	mexicoblvd
RT @DispatchBP: . @BrookfieldPLNY NORTH Lot | April 2nd until 3pm | North End Ave. &amp; Vesey St. | @MexicoBlvd @MamuThaiNoodle @mausamnyc &amp; @...	1396459477	451409883016232960	f	mexicoblvd
RT @DispatchNY: . @BrookfieldPLNY NORTH Lot | April 2nd | 11a-3pm | North End Ave. &amp; Vesey St. | @MexicoBlvd @MamuThaiNoodle @mausamnyc &amp; @...	1396459475	451409875466485760	f	mexicoblvd
Ready &amp; waiting to serve you a delicious lunch today, #Midtown on 46th St btwn 6th &amp; 7th Aves :) we'll be here til 2:30ish	1396367479	451024013784281088	f	mexicoblvd
Good morning, #Midtown! Preordering is available on our website http://t.co/aAbStR7e8W until 1pm! Hope to see you on 46th btwn 6th &amp; 7th Ave	1396357880	450983751829712897	f	mexicoblvd
We are coming home to you for dinner tonight, #Astoria. We look forward to hearing how much you missed us this weekend ;) Ditmars &amp; 31st	1396292715	450710430592552960	f	mexicoblvd
Monday. Lunes. Lunch. Almuerzo. Delicious. Delicioso. Don't miss this authentic Mexican goodness, #DUMBO. We'll be on Jay &amp; Water til 245ish	1396275953	450640125706645504	f	mexicoblvd
See you soon for dinner #Astoria! Ditmars &amp; 31st as per usual :) #sorryicantihaveadatewithmyfoodtruck	1396036241	449634703910666240	f	mexicoblvd
Come get your fresh donuts now on 55th and Broadway, we're here till 1:30pm today!	1397214398	454576249361674240	f	carpedonutnyc
Excuse our last tweet. We're at 51st and Park! Come get yours before we leave at 5:30!	1397143751	454279936057298944	f	carpedonutnyc
Open @ 51st and Broadway	1397129963	454222104565932032	f	carpedonutnyc
Open at 23rd and Park	1397043182	453858121044488193	f	carpedonutnyc
We're at court and Bergen slinging donuts until 5:30pm	1396785444	452777087515230208	f	carpedonutnyc
Come to Bergen and Court and get your donuts!  We will be here until 530pm.	1396695458	452399658728701953	f	carpedonutnyc
55th and Broadway until 5:30pm. Come and get it!!!	1396612230	452050575325396992	f	carpedonutnyc
@lauradreyfuss hi Laura! We're usually not out on Mon and Tues. We stay in for cleaning and maintainace. But we'll tweet if we're out!	1396525162	451685386759458816	f	carpedonutnyc
Now open at 51st and Park until 5:30pm	1396525049	451684911603548161	f	carpedonutnyc
Open @ 23rd and Park, will be staying late through 8 today, so if you ever had an evening donut fix, fulfill it today!	1396471974	451462298390249472	f	carpedonutnyc
Now open at court and Bergen until 5:30!	1396177426	450226875982700544	f	carpedonutnyc
Open @ Bergen and Court, Come!	1396093506	449874888673992704	f	carpedonutnyc
@FatEnglishman a pleasure to meet you this morning. Come back anytime! #stayhip	1396015792	449548931509542912	f	carpedonutnyc
Seize your donut at 55th and Broadway until 5:30pm!	1396007697	449514981521113088	f	carpedonutnyc
Open @ 51st and Park!	1395833685	448785120829661184	f	carpedonutnyc
Open @ Bergen and Court!	1395576065	447704585717940224	f	carpedonutnyc
Now open at court and Bergen we'll be here til 5:30!	1395488476	447337208413175808	f	carpedonutnyc
Now open at 55th and Broadway until 5:30pm!	1395403353	446980177831424000	f	carpedonutnyc
Open at 55th and Broadway! Sorry Park-avers we will try and be there tomorrow.	1395314593	446607891441922048	f	carpedonutnyc
Open @ 23rd and park!	1395229766	446252100432187392	f	carpedonutnyc
Parked on 50th btwn 6/7th with Moo Shu Grill! http://t.co/zI638sQv7O	1397218725	454594397649117184	f	biandangnyc
We are heading to the west side tomorrow... 50th and 6th! No parking at our usual spot.	1397167267	454378568173105152	f	biandangnyc
Putting our sunscreen on at 53rd &amp; Park!	1397141707	454271362903728128	f	biandangnyc
Out of pork belly!	1397062605	453939585936936961	f	biandangnyc
Delivery option available on Seamless. Check it out!	1397057227	453917028529606656	f	biandangnyc
53rd and park! We have Dong Po pork belly with baby boy choy today as our special!	1397054329	453904872782307328	f	biandangnyc
Sold out of pork belly!	1396976128	453576876015890432	f	biandangnyc
linky for the lazy: http://t.co/rnDKs5Ckw2 #seamless... http://t.co/4D7dD5tEru	1396976068	453576622755426304	f	biandangnyc
RT @TAP_NY: Whoa! NYC's Taiwanese @biandangnyc making movies - featured in the Taipei Times @TT_Features http://t.co/PxXd1mXFAQ #taiwanesef...	1396973131	453564304365989888	f	biandangnyc
We are live on seamless with delivery from our trucks! #nomnomnom	1396972419	453561316473438209	f	biandangnyc
53rd &amp; park on this beautiful day with #porkbelly!	1396970016	453551238513049600	f	biandangnyc
~ you can read more about us on Tuesday's article on #TaipeiTimes !... http://t.co/z0hWlVcPiu	1396887936	453206970351112192	f	biandangnyc
Back at it on 53rd &amp; Park!	1396878101	453165719681646593	f	biandangnyc
RT @mooshugrill: The girls from @biandangnyc really know how to dress! #vscocam #swagu #hoodieweather http://t.co/kGhkGrdqSf	1396625388	452105762681393152	f	biandangnyc
#freshtodeath #msg #nomsgtho http://t.co/55ESmTt8rQ	1396625330	452105518610280449	f	biandangnyc
50th btwn 6/7th today!!!!! Yesss we are on the west side!!!	1396619794	452082302974042112	f	biandangnyc
To all our fans on the west side you're in a treat today:)	1396611685	452048288213004288	f	biandangnyc
want to rock the bian dang tee? order here: http://t.co/t3LTAXj52u / $10 off limited qty #promocode: FANCYTEA http://t.co/JbkxNTlML4	1396553873	451805810209746944	f	biandangnyc
Its FiDi Friday! Front &amp; Gouverneu ready by 12!	1397231461	454647818888945664	f	korillabbq
TGIF lunch served at @DUMBOFoodTrucks Front and Jay and FiDi's Front &amp; Gouveneur	1397226327	454626283960684544	f	korillabbq
Open at CU! (116th &amp; Amsterdam)	1397163465	454362621689757696	f	korillabbq
@TheChainsmokers come through!  we need to take this #selfie	1397154778	454326186836234240	f	korillabbq
We have another half hour at 47 and Park!	1397153156	454319384518205440	f	korillabbq
Going for another half hour at at CU!	1397084301	454030582797045761	f	korillabbq
Sick set at Ultra from @TheChainsmokers #nyc hustle get it!	1397080470	454014514565238784	f	korillabbq
Done in FiDi! Headed uptown to 116th &amp; Amsterdam	1397070453	453972500700229632	f	korillabbq
Sorry FiDi. Running a lil late. Front &amp; Gouverneur ready at 12!	1397057468	453918039508287488	f	korillabbq
RIP #taco was real http://t.co/w821y1zwFT	1397016404	453745801832202240	f	korillabbq
Dinner starts at 5:00 116th &amp; Amsterdam!	1396986056	453618516998889472	f	korillabbq
Catch us for lunch today at SoHos Varick &amp; Vandam	1396966668	453537194087821312	f	korillabbq
Open at Columbia! 116th and Amsterdam!	1396887661	453205816355471361	f	korillabbq
Catch us today for lunch at 116th &amp; Amsterdam	1396878989	453169444957995008	f	korillabbq
FiDi Friday! We're back! Front &amp; gouverneu ready by 12	1396624828	452103416480038912	f	korillabbq
Catch us for lunch today at @DUMBOFoodTrucks Front &amp; Jay in BK and FiDi's Front &amp; Gouveneur	1396622509	452093687041101824	f	korillabbq
Open at CU (116th and Amsterdam)!	1396561222	451836633986637825	f	korillabbq
Open at 47th and Park!	1396540435	451749443860451328	f	korillabbq
Done for the night! Catch us tomm	1396483392	451510188760387584	f	korillabbq
We're ready for ya CU! 116th &amp; Amsterdam NOW!	1396472987	451466548817825793	f	korillabbq
We're closing shop after 10 years and parking our truck fleet after 7! Thanks for your &lt;3 in our shops + on the street! We will miss you!	1386710979	410521720231981056	f	rickshawtruck
Winter starts we say / goodbye to you and dumplings / spring follows the snow	1386710716	410520614353399808	f	rickshawtruck
Starrett! You are in luck! Danny is on his way to make your dumpling day! 26+11av	1384441694	401003647510650880	f	rickshawtruck
RT @nycfoodtruck: "These pockets pack a lot of flavor and offer a tasty and filling meal..." w/ @losanno @RickshawTruck #guestblogger #dump...	1384441640	401003419999432704	f	rickshawtruck
WFC! Get out your shades and come see the truck fun-ness N.End+Vesey	1384359621	400659410269122561	f	rickshawtruck
50+6av we heart you come out in this #sunnycold day!	1383929754	398856415374086144	f	rickshawtruck
Thursday: Starrett LEhigh 601 West 26th Street Chelsea!	1383837531	398469604390866944	f	rickshawtruck
It's Pie Time. When is it Dumpling time???? http://t.co/hRl2iiYGFk @damiencorrell	1383837502	398469484014338048	f	rickshawtruck
This S#$T is B-A-N-A-N-A-S http://t.co/3HLKPz19xR	1383755891	398127182439936000	f	rickshawtruck
heyguys: midtown is gettin crowded! 50+6av woohoo!	1383749955	398102285022003200	f	rickshawtruck
Tuesday MIdtown 45+6av old school	1383662044	397733558174769152	f	rickshawtruck
Bring it ON, Autumn! Days like this and you will be my S.B.F. Season Best Friend!	1383419728	396717210091405312	f	rickshawtruck
Thursday: Westside: Starrett Lehigh Building: 601w26 +11av	1383230615	395924013022605312	f	rickshawtruck
RT @Farm2me: #SandyUnites #SandyRelief Event: 2nd Sustainable Halloween "Truck or Treat Food PopUp" @RickshawTruck @Palenquefood https://t....	1383153276	395599631566245888	f	rickshawtruck
HUMPDAY HUMPDAY gotta get dumplings on HUMPDAY: Midtown: 50+6av and WFC:N.End+Vesey	1383143774	395559777104695297	f	rickshawtruck
FYI wasn't Cindy Sherman the original #selfie ???  @MuseumModernArt	1383065317	395230703748513792	f	rickshawtruck
Dumplings at W4th and Greene! Back at NYU and it feels so good! @SternUC @NYUStern @NYUTischSchool @nyulaw	1383055480	395189445873242113	f	rickshawtruck
Autumn Friday parked / 57th and 8th and / 50th an 6th.  #haiku	1382714104	393757609242927104	f	rickshawtruck
Thursday: Starrett Lehigh: 601w26th&amp;11av and also Wall Street 11a-3p Woohoo!	1382626381	393389671192875009	f	rickshawtruck
Thursdays are for dancing and prepping for friday. Watch this girl dance it out and own it! http://t.co/v8kFJTWbSH	1382626352	393389549373517824	f	rickshawtruck
We are on Broadway at the corner of 55st	1397229796	454640835624443904	f	chefsamirtruck
We are on 47 St between park av and Lexington av!!	1397143756	454279955082665984	f	chefsamirtruck
2014 Village Voice Choice Streets http://t.co/FhKmnv90Fl	1397104743	454116324772700160	f	chefsamirtruck
Extra! Extra! Village Voice 3rd Annual Choice Streets Food Truck Event - New York - Free Stuff http://t.co/XVRikrarg7	1397104371	454114765149700096	f	chefsamirtruck
We are on 52st and park av!	1397057935	453919995446456321	f	chefsamirtruck
We are on 36st and Broadway	1396973251	453564806260609024	f	chefsamirtruck
Amazing Mommy &amp; Me ITALIAN class today @yogaharlem!\n@Harlem4Kids http://t.co/XziXJESsMv	1396843996	453022670800814080	f	chefsamirtruck
RT @nycfoodtruck: . @chefsamirtruck @PhilsSteak @Palenquefood &amp; BklynOrganicCoffee are serving NOW at @Prospect_Park's #GrandArmyPlaza! htt...	1396802150	452847156320550913	f	chefsamirtruck
#foodtruckrally, @DispatchNY http://t.co/mczgdIgZBC	1396800908	452841949893251072	f	chefsamirtruck
RT @nycfoodtruck: The Prospect Park Food Truck Rally starts right NOW! Come hang out and enjoy the day with fellow food truck... http://t.c...	1396800364	452839664194715649	f	chefsamirtruck
We are at grand army plaza, Brooklyn, 11am to 5pm	1396799953	452837941141078016	f	chefsamirtruck
It's a beautiful day Brooklyn!\nToday it's the first day @ Grand Army Plaza, PROSPECT PARK!\n#foodtruckrally http://t.co/bBTEtv0fQp	1396797774	452828804411838464	f	chefsamirtruck
Is at Grand Army Plaza today, PROSPECT PARK!\n@prospect_park, @dispatchny, #foodtruckrally	1396797675	452828385887412225	f	chefsamirtruck
We are on Broadway at the corner of 55st	1396624938	452103874518994944	f	chefsamirtruck
We are on 47 St between park av and Lexington!	1396539952	451747419177639936	f	chefsamirtruck
http://t.co/PS8ZFi8bm9	1396418380	451237509964783616	f	chefsamirtruck
RT @ChoiceEats: We're excited to announce 10 food trucks back board for #ChoiceStreets with new ones &amp; old. Welcome @Chefsamirtruck @bigdsg...	1396394612	451137819214233600	f	chefsamirtruck
We are on 36st and Broadway! !	1396367355	451023494240014336	f	chefsamirtruck
We are on old slip and water st	1396280421	450658867681460224	f	chefsamirtruck
RT @HeluvaGood: It's #GrilledCheeseMonth &amp; we're featuring @gcnyc1. Share your recipes on FB to #win: http://t.co/hGIFYr7tMH http://t.co/AJ...	1397246194	454709611820769280	f	gcnyc1
RT @DrKatERuzh: @gcnyc1 just ate my lunch and it was heavenly! #cheese #gorillacheese	1397246011	454708844498010113	f	gcnyc1
Happy Friday Yo....\nG1- 46 5/6\nG2- Rockin a Film Shoot.\nTurkey, Muenster, Tots Bacon Gravey Melts... http://t.co/hEQDlX1jEU	1397223632	454614979703214081	f	gcnyc1
# NYU \n#COMETOTHECHEESEYO	1397163901	454364449370300417	f	gcnyc1
Happy Thursday\nG1- Fidi. . Hanover water / pearl. \nG2- 49th / 6\n#ComeToTheCheeseYo	1397138049	454256017925500928	f	gcnyc1
NYU #ComeToTheCheeseYo	1397073735	453986268570218498	f	gcnyc1
G1 - 26 11/12 @starrett601\nG2 - 36th/6\n#ComeToTheCheeseYo	1397060646	453931367181860864	f	gcnyc1
Rain is over by 12 Noon.\nG1- Varick &amp; Charlton\nG2- 49/6th\nTurkey, Muenster,  Tots, Bacon &amp; Gravey Melts\n#WeDoItEveryDay\n#ComeToTheCheeseYo	1396960063	453509490684747776	f	gcnyc1
G1 - 5th Ave.  @ 20th street\nG2- Broadway @ 55th st.\nTurkey melts w/Muenster ,Tots, Bacon &amp; Gravey\n#YourBrainsWillFallOut\n#ComeToTheCheeseYo	1396883922	453190134050344960	f	gcnyc1
#ComeToTheCheeseYo\n#YourBrainsWillFallOut http://t.co/YDHuV8M0x0	1396804834	452858416919490560	f	gcnyc1
RT @THE_EnglishNerd: I finally ate a @gcnyc1 sandwich. Wow, I'm definitely seeing them again tomorrow	1396799809	452837338054660096	f	gcnyc1
RT @nycfoodtruck: . @NuchasNYC @ToumNYC @CoolHausNY @GCNYC1 etc. are waiting for you at @Prospect_Park's #GrandArmyPlaza! http://t.co/35XcR...	1396799764	452837151789813760	f	gcnyc1
Rockin Prospect Park Food Truck Rally- 11-5pm Grand Army Plaza \n(Flatbush/Union/Eastern Parkway)\n#ComeToTheCheeseYo &amp; 15 Other Trucks Too	1396794241	452813986493239296	f	gcnyc1
RT @NY_Observer: @dekekdavis @gcnyc1 looks yummy	1396721204	452507643933130754	f	gcnyc1
RT @COOLHAUS: NYC's finest food trucks are all meeting up this SUNDAY 4/6 11A-5P ! The gang's all here! @prospect_park @dispatchny @gcnyc1 ...	1396721192	452507596285829121	f	gcnyc1
RT @_JHelium: I should have tried ALL their grilled cheese sandwiches.. #dangerouslycheesey @gcnyc1 collaboration w/ @PYJAMAGROUP http://t...	1396721171	452507508415143936	f	gcnyc1
RT @nycfoodtruck: Just your friendly reminder that the Harlem Food Truck Rally is today from 11a-3pm and Nuchas, Wafels &amp; Dinges,... http:/...	1396713763	452476436100968449	f	gcnyc1
RT @HarlemEats: Harlem Food Truck Rally happening now! Palenque, Mr Nice Guy, Luke's Lobster, Shorty's, Gorilla Grilled Cheese,... http://t...	1396713760	452476421945167872	f	gcnyc1
RT @kbkwhat: This summer at  @prospect_park, cure your hunger with @philssteaks, @gcnyc1, @MexicoBlvd, @AndysItalianIce &amp; more: http://t.co...	1396709753	452459616623144960	f	gcnyc1
Rockin it today @HarlemEats \n11-5 pm\nFREDERICK DOUGLAS BLVD 117/118\n#WEDOITEVERYDAY\n#NATIONALGRILLEDCHEESEMONTH\n#COMETOTHECHEESEYO	1396709710	452459437090164737	f	gcnyc1
@RachelChang We totally advocate taco intimidation. Work it.	1397239766	454682653544185856	f	kimchitruck
RT @ba_maca: @rachelpaularpa: It's @KimchiTruck day! @monique_meneses @Travycakes @Gwen_UsBeauty my mouth is on fireee  http://t.co/OScT...	1397239714	454682432953126913	f	kimchitruck
Good grief. Everyone needs to be out sunning &amp; taco-ing. 55th St. bet. 6th &amp; 7th Ave.	1397238732	454678315878866944	f	kimchitruck
Boootiful day for a stroll. We're over a few blocks on 55th St. bet. 6th &amp; 7th Ave.	1397233283	454655459010813954	f	kimchitruck
@rachelpaularpa We wish. Someone truck-blocked us.	1397229873	454641155700178944	f	kimchitruck
Blocked on our usual spot. We're at 55th St. bet. 6th &amp; 7th Ave instead.	1397227381	454630703851130880	f	kimchitruck
Good ole' Fridays. We never get sick of you. 52nd St. bet. 6th &amp; 7th Ave. 11:30am - 2:30pm	1397224719	454619541570846720	f	kimchitruck
RT @ThisIsSTONE: Man people going cray for this but line moving fast. (@ Kimchi Taco Truck - @kimchitruck w/ 4 others) http://t.co/aTIR0bB4...	1397150920	454310003084894208	f	kimchitruck
Tacos, sun, almost weekend. Varick St. corner of Charlton st. 11:30am - 2:30pm	1397137891	454255358572503040	f	kimchitruck
RT @joshuafeder: @zipbow @KimchiTruck @KorillaBBQ @kogibbq it's a great choice (yummers) but not quite NYC Try @KorillaBBQ AND @KimchiTruck...	1397137631	454254267617263616	f	kimchitruck
Need a pm pick me up? Roman may be even more munchable than our tacos.\nhttp://t.co/rTtVvtfc4S @mashupamerican	1397069937	453970337869619200	f	kimchitruck
RT @iluvfoodtrucks1: We just wrote about @KimchiTruck on our blog!  Check out what we posted at http://t.co/qz5pRYw8Bw	1397060743	453931774406852610	f	kimchitruck
Sweet Spring, there you are. 55th St. bet. 6th &amp; 7th Ave. 11:30am - 2:30pm	1397052069	453895391818559488	f	kimchitruck
RT @MarkL3883: About to enjoy @KimchiTruck	1396976069	453576626480365568	f	kimchitruck
On our way to @dumbolot Jay &amp; Water St. 11:30am - 2:30pm	1396964539	453528265794551808	f	kimchitruck
Start yer week off w/ yum. N. End Ave &amp; Vesey St. @BrookfieldPLNY	1396881160	453178549684682752	f	kimchitruck
It's ON! First #FoodtruckRally of the season @prospect_park Under the Arch 11-5	1396794631	452815620602863616	f	kimchitruck
Spending this gorgeous day w/ @Dubpies Hudson River Park's Pier 40 West St, Houston St. 11-6pm	1396708263	452453364773568512	f	kimchitruck
RT @dubpies: #PieTruck will be @ #LittleLeague Opening Day, Saturday.With @KimchiTruck. Thanks @HudsonRiverPark (Pier 40) @DispatchNY	1396652103	452217815530213376	f	kimchitruck
@RachelChang Whaa? What are you saying about us? We won't tell  ;)	1396636774	452153520767373312	f	kimchitruck
Never rat on your friends.. And always keep your mouth shut.	1397257333	454756332403314689	f	disosnyc
@StreetGrubSteve sounds good Steve! Grazi!	1397238529	454677463604682752	f	disosnyc
Open for lunch.. Wall and water st.\n\nCall in orders to: 917-756-4145	1397230507	454643817698713600	f	disosnyc
Lunch on wall and water st today.\n\nGet your call in orders in: 917-756-4145	1397220868	454603387037032450	f	disosnyc
@StreetGrubSteve we hope to see you at the truck.. Come down for nyc best Italian deli on wheels!	1397218084	454591709574619137	f	disosnyc
Open for breakfast on our wall and water location..\n\n- Italian lox on bagel\n- potato and eggs\n- Brocrolli rabe... http://t.co/1ErGUQ9LqZ	1397217010	454587204732350464	f	disosnyc
RT @beccc: Attn attendees! We also have @DiSOSNYC sandwiches! MT @nakisnakis Looking fwd to sharing story of @PipelineFellows @newscorp #lu...	1397152135	454315099130703873	f	disosnyc
Prepping for lunch.. 47th between park and lex today.\n\nCall in orders to: 917-756-4145	1397137477	454253618963972096	f	disosnyc
We're serving breakfast until 9:30. Menu includes\n\n- Italian style lox on bagel\n- peppers and eggs\n- eggs in... http://t.co/tI734BZNRB	1397131261	454227547648049152	f	disosnyc
Breakfast being served today at 47th bet park and lex.\n\nFree coffee with any breakfast purchase	1397123040	454193068778864640	f	disosnyc
And remember kids..! Disos will be holding Thursday morning breakfast meeting tomorrow. 6am- 9:30am\n\n**47th between park and Lex.**	1397083742	454028239761965056	f	disosnyc
@HudsonGiles thanks Matt, welcome to the society. We are at this location every Wednesday.	1397067478	453960022666399744	f	disosnyc
RT @HudsonGiles: Just finished my first Tony Cheeks from @DiSOSNYC -- delicious! Here's to hoping the truck comes to Canal Street more ofte...	1397067451	453959909382438912	f	disosnyc
@HudsonGiles usually lunch runs from 11-230, or until we sell out before that.	1397054248	453904534020960256	f	disosnyc
Come see us about that thing.. \n\nCorner of varick and charlton st.\n\nCall in orders to: 917-756-4145	1397052735	453898185782886400	f	disosnyc
Lunch at 48th bet 6 and 7 ave. today\n\nCall in orders to: 917-756-4145	1396966771	453537626310836225	f	disosnyc
Come check out our Italian style breakfast this morning on 48th between 6 and 7 ave.	1396951773	453474722261389312	f	disosnyc
** Disos will be rolling out our Italian breakfast tomorrow at our 48th and 6 ave location. \n\nMenu items will... http://t.co/xRozqOX2qU	1396903297	453271397045792768	f	disosnyc
Lunch time! Open for biz..\n\n56th and Broadway\n\nCall in orders: 917-756-4145	1396883021	453186355225325568	f	disosnyc
Lunch today 56th and Broadway..\n\nCall in orders to: 917-756-4145	1396874924	453152393274748929	f	disosnyc
Good morning Broadway!!! Between 55/56 for your lunch time pleasure!!	1397133656	454237592733896704	f	mactruckny
29st and Park ave South today for lunch. #herecomesthesun 	1397054111	453903957614927872	f	mactruckny
@randizzle15 cheat days should always be #cheesy	1396979816	453592344403918848	f	mactruckny
RT @randizzle15: THAT IS WHAT IM TALKIN ABOUT! @mactruckny for the win! http://t.co/NsWz80cbQQ	1396979784	453592208659476480	f	mactruckny
RT @HerNameWasNicki: Happy Birthday, Dom. T-minus 1 hour @mactruckny !!!!! 	1396969136	453547546770960384	f	mactruckny
@Lobsterhut not this year jim, see you at the Belmont.	1396963471	453523785917140992	f	mactruckny
Good morning 47st. Celebrating my 30th Birthday at my favorite lunch time haunt!!! Between Park and Lex	1396962854	453521199046598657	f	mactruckny
Good morning WFC North End and Vessey for Lunch today.	1396881750	453181022566641664	f	mactruckny
Good morning racing fans!!! 1st day for the #macattack on the horse racing circuit at Aqueduct on this fine day. #woodmemorial	1396709558	452458797488164864	f	mactruckny
RT @karmasuperman: Oh, wait and the mac and cheese! @mactruckny http://t.co/vIns4PlEHn	1396550578	451791989844242432	f	mactruckny
@HerNameWasNicki #blondtourage i was there on tuesday!!! Ill be back next tuesday. Come see meeeeee!!!!	1396550150	451790192861773824	f	mactruckny
Just another day at the office.  http://t.co/cy4RfuhBjQ	1396531515	451712030366765056	f	mactruckny
Top O'the mornin to ya Broadway!! Between 55/56 streets for lunch today.	1396523798	451679664004952064	f	mactruckny
29st and Park Ave South for lunch	1396451429	451376126712360960	f	mactruckny
RT @dugpound: After a long, cold winter, thank you to @mactruckny for coming back to our hood today!  (I will now slip into a post-lunch co...	1396388515	451112244949315584	f	mactruckny
Good morning Dearest 47st, between Park and Lex today for Lunch. Come get Someee 	1396356023	450975966891085824	f	mactruckny
RT @DispatchBP: . @BrookfieldPLNY NORTH Lot | Monday, 3/31/14 | 11a-3pm | North End Ave. &amp; Vesey St. | @MacTruckNY @KimchiTruck @ShortysNYC...	1396281036	450661448222789632	f	mactruckny
RT @SSDESTO: @mactruckny Had ur Bacon mac b4 &amp; tried your BBQ mac 'n' cheese today and man was it so cheesy and savory DELICIOUS!  #DiedIn...	1395963198	449328338793156608	f	mactruckny
Good morning broadway!! Between 55/56 for lunch.	1395922275	449156694866526208	f	mactruckny
RT @BurnTheHerb: need to get to new york just so i can try @mactruckny i've heard nothing but good things	1395888171	449013652465922048	f	mactruckny
Another update! We are still pushing to get a sticker for our new truck. We miss all our amazing fans! Don't give up on us :) #keepontruckin	1397232393	454651725774061568	f	sweetchilinyc
@TheSteelCart thanks guys!  The new truck is pretty sexy, if I do say so myself;)	1397232324	454651437356965888	f	sweetchilinyc
@DanielPrecel We miss @dumbolot more than words can say!!!  We are working hard to get this situation resolved ASAP:)	1397232293	454651309065781248	f	sweetchilinyc
@_DavidBerman  we are working hard on this! we miss everyone too!!	1397232248	454651117218308096	f	sweetchilinyc
@aep211 will do!!	1396624400	452101618520309760	f	sweetchilinyc
We have a city advocate &amp; the @nycfoodtruck helping us to get the health department to come up with a solution to their mistake! Stay tuned	1396624364	452101470482337792	f	sweetchilinyc
@_DavidBerman we are trying!! the health department is out of stickers so we cant get our new truck on the streets yet:( thanks health dept!	1396624175	452100678195101696	f	sweetchilinyc
the health department says they have no stickers for permits. so we cant use our new truck. pretty nuts right? they don't have a solution...	1396485344	451518377430110209	f	sweetchilinyc
@DirtyEMU @SweetChiliNYC we are waiting for our new truck to be finished.  Hopefully be back soon!	1396136533	450055356262408192	f	sweetchilinyc
Happy Monday! We are ready to feed you at\n51st street between Park and Madison !	1392044717	432893038168641536	f	seoulfoodnyc
Status update! Our new truck will be done next week, but the Department of Health says they are out of permit stickers!!  Stay tuned...	1396093507	449874894101413888	f	sweetchilinyc
RT @THERAINBOWTABLE: Trucks we're loving this week include @Mexicue &amp; @SweetChiliNYC Did you know they cater as well...even hitch them when...	1395587533	447752682485583872	f	sweetchilinyc
@steelsblade @SweetChiliNYC not sure yet but we will keep you all posted!	1395274872	446441287806636033	f	sweetchilinyc
Our truck is officially retired.  But don't worry,  our new truck is almost ready!  Stay tuned for updates! #thaietnamese	1395238842	446290168602189824	f	sweetchilinyc
Don't click on the link posted by @shanghaisogo it's malicious	1395167712	445991829390233600	f	sweetchilinyc
Come say goodbye to our truck betty!  Jay and Water till 3 ish http://t.co/yyN2RHTaQe	1395155679	445941356754894848	f	sweetchilinyc
RT @dumbolot: #DUMBO ITS SO NICE OUT! @carlssteaks @SweetChiliNYC &amp; @KimchiTruck today! Oh, I guess the weather's nice too	1395155345	445939954695536641	f	sweetchilinyc
Today is betty's last day! Come say goodbye at jay &amp; Water @dumbolot today for lunch! #thaietnamese #keepontruckin	1395155326	445939877017055233	f	sweetchilinyc
RT @randomfoodtruck: For those in the office instead of parading or drinking... @bobjoTruck @souvlakitruck @SweetChiliNYC @gcnyc1 @hibachih...	1395076127	445607693756428288	f	sweetchilinyc
#HappyStPatricksDay #happyMonday we are at broadway &amp; 56 today 11-3! Last Monday out with Betty so come say goodbye! #thaietnamese	1395067489	445571460799946752	f	sweetchilinyc
RT @DheaZasmasya: "@SweetChiliNYC Green mango salad w jicama, chili salt, nuoc chom http://t.co/uULPTRnCK4"	1394980053	445204726939144192	f	sweetchilinyc
RT\nServing Lunch today on \n47th st bet Park &amp; Lex\nCall in advance for pickup \n@ 347~70T~BiTE	1397230007	454641721180438529	f	tacobite
RT @randomfoodtruck: Picnic weather! @lobstertruckny @hibachiheaven @PolishCuisine @tacobite @mactruckny @YumeFoodTruck @TheSteelCart	1397145703	454288124064305152	f	tacobite
Serving Lunch today on\nBroadway bet 55th &amp; 56th str\nCall in advance for pick-up\n@ 347-70T-Bite	1397144201	454281825398292480	f	tacobite
A bit crazy on 47th str today!! http://t.co/quPCiNhCkY	1397070051	453970815898632192	f	tacobite
Happy hump day!!\nToday serving Lunch on\n47th st \nBet Park / lex \nCall in advance for pick-up\n@ 347-70T-Bite	1397057161	453916750422482944	f	tacobite
Happy hump day, today we are serving lunch on \n47th st Bet Park / Lexington Av. \nCall in advance for pick-up @ 347-70T-Bite	1397055597	453910190086422529	f	tacobite
@randomfoodtruck RT gorgeous day!\nserving lunch on \nBroadway bet 55th/56th street\nCall in advance for pickup\n@347-70T-BiTE or @347-708-2483	1396974226	453568894796824577	f	tacobite
Serving lunch w/@souvlakitruck \non Broadway bet 55/56th st.\nCall in advance for pick up\n@347-70T-BiTE	1396883886	453189982245888000	f	tacobite
@Gusburger nice! To be back, hope to see u Wednesday on 47th st.	1396794820	452816414551064576	f	tacobite
Happy Saturday!!\nServing it up on \n67th st &amp; Broadway \nIn front of the "APPLE STORE"\nCall in advance for pick-up\n@347-70T-BiTE	1396714248	452478470254526464	f	tacobite
55th &amp; Broadway\n@randomfoodtruck @Chefsamirtruck @CarpeDonutNYC @bobjoTruck @taipanexpress @thegreenradish1 @carlssteaks @souvlakitruck	1396626755	452111495749709826	f	tacobite
Serving Lunch Bet\n55th/ 56th &amp; Broadway\nCall in advance for\npick-up @ 347-70T-Bite	1396626069	452108620252336129	f	tacobite
Serving Lunch on \n55th/56th st &amp; Broadway @randomfoodtruck @mactruckny @PolishCuisine @TheSteelCart @hibachiheaven @mikenwillies	1396540235	451748606731902976	f	tacobite
Serving Lunch on \nBroadway bet. 55th &amp; 56th St.\nToday's Special "TORTA"\ncall in advance for pick-up\n@347.70T.BiTE	1396539794	451746755290611712	f	tacobite
Serving Lunch on 47TH St\nBet Park Av / Lexington Av\nCall in advance for pick-up @ 347-70T-Bite\nTODAY's SPECIAL... http://t.co/xqQQ8fdU9L	1396456630	451397942885494784	f	tacobite
Serving Lunch \non 47TH St. Bet\nPark Av. / Lexington Av. \nCall in advance for pickup\nat 347-70T-BITE ;-)	1396452297	451379768047710208	f	tacobite
Serving it up today on\n55th st &amp; Broadway \nCall in advance for pick-up\n    @347-70T-BiTE	1396368468	451028162206765056	f	tacobite
Serving lunch on \n55th st &amp; Broadway\nCall in advance for pick up\n@ 347-70T-BiTE	1396281956	450665306219098112	f	tacobite
On 55th street &amp; Broadway.... @randomfoodtruck @gcnyc1 @YumeFoodTruck @souvlakitruck @DiSOSNYC	1396280383	450658708960587776	f	tacobite
Happy SUNDAY!!\nToday again on \n67th Street &amp; Broadway\nFrom 11 til 6:30pm\nCall in advance for pick-up\n@ 347-70T-BiTE	1396187623	450269645833256960	f	tacobite
.@RoyalPalmsClub 12-6pm, then Bedford/N6 MT @pleiseo: .@dubpies @eaemileeanne let's eat them these pies. @dubpies where r u on Saturday?	1397263454	454782005520388096	f	dubpies
Sunday! &amp; @royalpalmsclub on Sat. MT @CalicoAvenger: @dubpies Didn't get to GAP last Sun.... you on 7th Ave either this Saturday or Sunday?	1397260769	454770744464261120	f	dubpies
Sorry about that! RT @SunnyinSyracuse: @dubpies We've a Hanover Square in #Syracuse. Got momentarily ecstatic...then sad. Love me some pies!	1397260531	454769745435561984	f	dubpies
#PieTruck is in Hanover Square serving savory pies, sweets and flat whites until 2.30pm #FinancialDistrict	1397227542	454631379524128768	f	dubpies
#pietruck is parked at Bedford and North 6 until late tonight! #Williamsburg	1397184461	454450685795647488	f	dubpies
RT @lovejackpearl: News From The Always Tasty @dubpies-- Anzac Day, Cold Brew Season, New Pie Flavours http://t.co/s4aVNpo5Pm  #Brooklyn  #...	1397177289	454420604582912000	f	dubpies
Wanna know where the #PieTruck is in advance? Our monthly newsletter! Also has pie discounts! http://t.co/XQeZo5mXJI	1397146630	454292009692712961	f	dubpies
Serving Now at Grand Central - Park Ave and E 47th St New York From 10:30AM Until 2:30PM EDT http://t.co/bnUZq7Fg9B	1397140506	454266324618084352	f	dubpies
#PieTruck's @ 47th St and Park Ave. Serving flat whites &amp; hot pies. We'll be here until 2.30pm http://t.co/8hlprESnMv	1397139401	454261692210630656	f	dubpies
RT @jbakernyc: Looking forward to seeing Sponsor @dubpies at #PiePartyGE again this year! They're making life better, one pie at a time....	1397076069	453996057920565248	f	dubpies
That's a Lamington! http://t.co/jiE3vs31cK RT @JVB: don't know the cake's name from @dubpies, but damn it's yummy! http://t.co/LXImo45lDC	1397067244	453959041682014208	f	dubpies
Cheers guys! RT @vllg: Delicious Thai Chicken Curry pie for lunch, thanks to @dubpies Yummy as.	1396979473	453590902297346048	f	dubpies
If not. Close by. We only post planned locations in our newsletter. RT @baileymichelle: @dubpies Will you come back to 55th/Bway? Please?	1396976580	453578768523997184	f	dubpies
Yes, yes it does RT @liang: @dubpies hello! does your truck take credit cards?	1396976235	453577324282531840	f	dubpies
RT @liang: @dubpies hello! does your truck take credit cards?	1396976222	453577269056143360	f	dubpies
Ready to get smoked with our new menu? http://t.co/4ehQVCO40w	1389031599	420255102658572288	f	yougotsmoked
RT @ChoiceEats: Can't wait to try the new #ChoiceStreets trucks @dubpies &amp; @PizzaByLuzzos. Pizza #pie, savory pie, we love it all http://t....	1396969024	453547076836945921	f	dubpies
RT @dumbolot: It's gonna be live at the lot today with @carlssteaks @dubpies and @KimchiTruck!	1396969015	453547038500986880	f	dubpies
#PieTruck is back @DumboLot today. 11am to 3pm. Jay St and Water St http://t.co/zAeb7SpVLH	1396965917	453534047512580096	f	dubpies
RT @bookoisseur: The fresh coffee and smiles I got at @dubpies this morning almost make up for my early call time. Off to work!	1396958426	453502626366521344	f	dubpies
RT @cmoeser: Let the face stuffing begin! @nycfoodtruck @prospect_park #foodtrucks http://t.co/GoWnWMxklB	1396888515	453209396995432448	f	dubpies
@EricLDavid we've been on a winter break! We'll make sure to give you a head's up when we're back on the road.	1396028457	449602052554252288	f	goburger
classic RT @lfriedman5 @GOBurger you've got a friend #love #caroleking	1395881146	448984188117843968	f	goburger
What's your favorite Carol King song? Let us know in the comments and you could win 2 tickets to Friday night's... http://t.co/2Qa0cMwtYL	1395875529	448960627885998080	f	goburger
St. Patty's Day is around the corner - what will you be drinking? http://t.co/KtUIbTxv7F	1394727264	444144452794212352	f	goburger
Buckle down with an Olympic Burger from BLT Burger New York or GO Burger New York and watch this.... http://t.co/s8IsMyC2Ci	1391810155	431909214433599488	f	goburger
We're not on the road, but your burger fix doesn't end here. BLT Burger New York and GO Burger New York both have... http://t.co/CyDPZC9J3o	1391544696	430795798407045121	f	goburger
You should probably try one of these Big Game celebration burgers from BLT Burger New York and GO Burger New York. http://t.co/qGlVQis784	1390587467	426780886189621248	f	goburger
@harlemsmover the truck is getting a little facelift for the winter. We'll tell Will you say hi!	1389995572	424298301228609536	f	goburger
@stevenshawnyc :( have you ever ordered from our sister restaurant @CasaNonnaNY? They're on seamless and in your delivery zone!	1389710384	423102135711309825	f	goburger
Taking a break for tune-ups over the next few weeks. We'll be back! Stop by BLT Burger New York or GO Burger New York for your burger fix!	1389632429	422775167274995712	f	goburger
We're on 88th and Broadway for dinner tonight!	1389390276	421759504435273728	f	goburger
Hello Flatiron! We're on 20th and 5th for lunch!	1389287328	421327711144255488	f	goburger
The temp is rising; it's practically summer out here! Ok, not exactly, but if you're near Varick and Vandam stop by for a burger and shake!	1389198360	420954551647084544	f	goburger
We're on 21st and 5th!	1389110753	420587101277540353	f	goburger
We're on Houston and Broadway!	1389043197	420303751660843008	f	goburger
We're on 27th street between Park and Madison!	1389024342	420224664837709824	f	goburger
RT @eaterny: It snowed last night, so restaurants are offering deals.  Here's a map:  http://t.co/bAUEo3Ay9v	1388774896	419178411811405824	f	goburger
Snow Day Special! We're not around, but GO Burger New York &amp; BLT Burger New York have $2 sliders / $1 Hot Choc... http://t.co/6Ef49H0aIE	1388773701	419173401740464128	f	goburger
We're on Houston and Broadway!	1388698113	418856364329689088	f	goburger
We're on 21st between Broadway and 5th!	1388511405	418073251425050627	f	goburger
@MilanoSchool thanks for the shout out!	1397166119	454373752844087297	f	snowdaytruck
.@dvill004 @RoyalPalmsClub Thank you! We're so glad you enjoyed it and hope to see you soon!	1397149479	454303962808999936	f	snowdaytruck
Find us next in DUMBO this Friday from 5 - 8:30pm at Jay and Water St! #dumbonyc #dumbofoodtrucks #nycfoodtrucks http://t.co/BuYJWdL7VT	1397140234	454265186585956354	f	snowdaytruck
.@DumboNYC We wont be in the lot today but we will see you tomorrow night! Come grab an after work snack or dinner from @SnowDayTruck	1397126727	454208532653821952	f	snowdaytruck
What an AMAZING first week! THANK YOU to @RoyalPalmsClub &amp; @DispatchNY for making this first week of service so special!	1397098341	454089472008003584	f	snowdaytruck
Thanks to Joe &amp; all of the @HuffingtonPost crew for featuring us! http://t.co/ctYIm7UkEv  -get your maple w/ a side of social justice	1397097716	454086852971331584	f	snowdaytruck
Thank you @HuffingtonPost for spreading the word about our food and mission http://t.co/8iEpPfFKkY!	1397074496	453989458401325056	f	snowdaytruck
RT @hhawk: @SnowDayTruck helps make people happy and help people too! @DriveChangeNYC http://t.co/P4hcpJUxeB @HuffingtonPost	1397072570	453981382109577216	f	snowdaytruck
@SWTgeneration thanks! George ordered a cupcake, BTW :-)	1397002049	453685593374208000	f	snowdaytruck
We were thrilled for the chance to serve @mariobalotelli and @georgestephanoupolos lunch today at @RoyalPalmsClub!! http://t.co/OUI2doM0gf	1397001663	453683977657024512	f	snowdaytruck
We cannot wait to meet @Mariobatali and @GStephanopoulos today @RoyalPalmsClub - maple, shuffleboard &amp; crocs = a winning combo!	1396966346	453535845124177920	f	snowdaytruck
Great night @RoyalPalmsClub! Thanks to all who came out - we will be back at 514 Union tomorrow!	1396937487	453414803055587328	f	snowdaytruck
See you tonight on the (shuffleboard) court! @RoyalPalmsClub we will be serving it up maple style from 6pm-close.	1396886825	453202312186851328	f	snowdaytruck
PLAY SHUFFLEBOARD AND EAT MAPLE GOODNESS ALL AT ONCE! Come to @RoyalPalmsClub tonight 4/7 and tom 4/8 6pm-close http://t.co/xOq2Yb4sXN	1396874110	453148976896675840	f	snowdaytruck
Before service AB &amp; FC talk about our social mission to folks from the Center for Community Alternatives #drivechange http://t.co/Ab05GyvSdF	1396842612	453016864117882880	f	snowdaytruck
We are honored to work with the AMAZING folks @VerticalWater - they DONATE all of their amazing new product to us - http://t.co/ilE0MYE1Pu	1396818134	452914198453178368	f	snowdaytruck
What goes GREAT with maple syrup??? Well, shuffleboard of course! See you tomorrow night 4/7 @RoyalPalmsClub !!! #leaguenight	1396818085	452913994735837184	f	snowdaytruck
RT @crownmaple: Come and visit Madava Farms, the home of @crownmaple! http://t.co/lrIDhw1IG8	1396646314	452193535371251712	f	snowdaytruck
.@TYTHEdesign @DriveChangeNYC @dumbolot thanks for the post but we're not out tonight due to weather - find us @RoyalPalmsClub on Monday!	1396640533	452169286292086784	f	snowdaytruck
*IMPORTANT UPDATE: due to weather we will NOT be going out in Dumbo tonight - find us @RoyalPalmsClub Mon and Tues Night!	1396632750	452136643953446912	f	snowdaytruck
Come to 51st street, between Park and Madison - it's lunch time!!	1392220033	433628363769798656	f	seoulfoodnyc
It is almost time to plan for dinner! We ate at West 4th and Greene NYU!	1392150901	433338403933794304	f	seoulfoodnyc
Is it lunchtime yet?\nWe are ready to feed you!\nWe are at 46th street between 5th and 6th !	1392128245	433243381087879168	f	seoulfoodnyc
We have landed! West 4th and Greene	1392074122	433016370708496384	f	seoulfoodnyc
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
It's TACO TUESDAY at 97st and Columbus Ave #tacotuesday #tacotruck	1396383521	451091298980999169	f	elpasotruck
We are here at 97th &amp; Columbus ave, come get your tacos, burritos, enchiladas and quesadillas :) #tacotruck #tacos #burritos #mexicanfood	1396297901	450732185688223744	f	elpasotruck
@CHD_Expert_US  We are at 72nd &amp; York ave we will be arriving to 97st and Columbus Ave around 4:30pm	1396021100	449571196276047872	f	elpasotruck
We are here at 97st and Columbus!!! #TacoTuesday #WestSide #columbusave	1395783837	448576043155456001	f	elpasotruck
It's almost #StPatricksDay . Stop by #ElPasoTruck and get tacos. #weekend #tacotruck #uppertweetsiders	1394901539	444875418450288640	f	elpasotruck
Come to 97th and Columbus Ave. #tacotruck #FoodFri  #FoodieFriday	1394835237	444597325147942912	f	elpasotruck
Beautiful afternoon we have. Come get your tacos here at 97th st and Columbus Ave @wholefoodsnyc @NYCFoodieFinder @truckfoodnyc	1394570373	443486406317731840	f	elpasotruck
We are here at 72nd st &amp; York Ave.	1394467680	443055681101656065	f	elpasotruck
Come get your tacos. We are on 97st and Columbus! @wholefoodsnyc  @NYCFoodieFinder	1394301172	442357297218859008	f	elpasotruck
We are on 97th st &amp; Columbus Ave. @upperwestsiders @nystfood @wholefoodsnyc @NYCFoodieFinder	1394226968	442046062703169537	f	elpasotruck
Come try our Burrito Bowls! We are here at 97st &amp; Columbus @upperwestsiders  @NYCFoodieFinder @nystfood @wholefoodsnyc	1394141361	441687001214255104	f	elpasotruck
Come have lunch with us at 72nd &amp; York Ave @nystfood	1394124452	441616078905827328	f	elpasotruck
RT @elpasony: #Mexico vs Nigeria!  Pantalla Gigante, Hoy 8:00pm Draught #beer $4.oo\nhttp://t.co/oPeW4fK24V http://t.co/jR6mPkdHph	1394057437	441334997564534784	f	elpasotruck
We are here at 97st &amp; Columbus! Come get your tacos :) @upperwestsiders	1394055311	441326077789868032	f	elpasotruck
We are delivering, Call us: (646)506-8754 or\n@Seamless http://t.co/dipnRAwnC4  @wholefoodsnyc @upperwestsiders @nystfood	1393976935	440997346814332928	f	elpasotruck
We are on 97th St. &amp; Columbus ave. @upperwestsiders @nystfood	1390251431	425371449889914880	f	elpasotruck
Do you need a catering from a truck ??let us know ! #cateringnyc	1387402008	413420105528508417	f	elpasotruck
Come try our delicious food with beers from all over the country @ http://t.co/wkarzbKk2R #craftbeer #weekend @nystfood @NYCFoodieFinder	1385149925	403974183614308352	f	elpasotruck
Come try our food with delicious beers from all over the country @NYCCraftbeerfest.com #craftbeer #weekend @nystfood @NYCFoodieFinder	1385149262	403971404145491968	f	elpasotruck
RT @NYCraftBeerFest: @MorrisTruck, @Carlssteaks, @GoodfellasUSA, @ElPasoTruck Happy to have you at http://t.co/LO9vwmSaGn - Winter Harvest ...	1385149068	403970587984658432	f	elpasotruck
Herros! Toast Monster sightings have been circulating. Spot and footage the elusive Toast Monster for grand prizes!	1396724832	452522863149731840	f	toastmonsternyc
@Liv3LearnLaugh Herros Luke! Toast Monster is closed for the season but you can rent Toast Monster for a small or large size party. Rawr!	1392618609	435300114698338304	f	toastmonsternyc
This just in: Toast Monster spotted in your heart. @foodtoeat @midtownlunch @StreetGrubSteve @DNAinfo @nystfood @truckfoodnyc @nycfoodtruck	1392377791	434290051904983040	f	toastmonsternyc
Happy Vday NY! Toast Monster would like to give a special RAWR to the moon. #bowchickawowow #icanshowyoutheworld #shiningshimmeringsplendid	1392375112	434278815876251648	f	toastmonsternyc
Hope your superbowl dreams come true "@cammcm: @toastmonsternyc Can my Super Bowl dreams get a #RT http://t.co/PbJdcuY1FL".	1390576702	426735737313460224	f	toastmonsternyc
#JuliaChild: People who love to eat are always the best people. Thank y'all for making 2013 for us. Cheers #bestof13 #HappyNewYear	1388514079	418084469481148418	f	toastmonsternyc
If u've resources/footage/witnessed the assault: need all help we can get!  Thanks friends/fans who'v reached out #protectsmallbusiness tm	1388085250	416285830638882816	f	toastmonsternyc
Wishing all a safe&amp;healthy holiday. Sad news: TM is closed bc last Wed. Gary was harassed then assaulted by 2cops unprovoked on our corner.	1388085020	416284865277882368	f	toastmonsternyc
Happy holidays @midtown. Last week before the holidays!	1387386789	413356272894087168	f	toastmonsternyc
RT @kaijustreetfood: Miso soup with beef or chicken teriyaki rice bowl for $8!	1386864884	411167242383269888	f	toastmonsternyc
Hello Rice bowl fans. Have your beef or chicken teriyaki rice bowl with a miso soup for only $8!! #stopplaying #notplaying #forreal 50th/6th	1386864511	411165677526220800	f	toastmonsternyc
Hi @midtownlunch, 50th and 6th, if you like monsters then check out @kaijustreetfood for beef and chicken teriyaki rice bowls. #rice #nice	1386352309	409017349376049152	f	toastmonsternyc
Hey New York, check out Kaiju at http://t.co/8PPs2SJjgX. For tweets and location http://t.co/dVNFBhQwX5	1385488135	405392739182706689	f	toastmonsternyc
Good afternoon New York!	1385403556	405037989627449344	f	toastmonsternyc
Toast Monster spotted @5pointznyc. @alneuhauser #5pointz http://t.co/gu3UG0XDt7	1385055153	403576679576375296	f	toastmonsternyc
whoever threw out @c__sull 's toastmonster sammie, please don't do it again.	1384559366	401497199818711040	f	toastmonsternyc
@c__sull . It's true. #true #kaitrue	1384535123	401395515193303040	f	toastmonsternyc
RT @alneuhauser: .@toastmonsternyc to transform into Kaiju next week, serve Japanese rice balls &amp; bowls instead of sandwiches http://t.co/1...	1384533727	401389662671212544	f	toastmonsternyc
Herro 50th and 6th, New York. Today is Toast Monster's last day of the year. Stay toastie! Keep it breezy! Rawr!	1384529054	401370061837201408	f	toastmonsternyc
Last week for Toast Monster 50th and 6th. It's been toasty.	1384442434	401006753124737024	f	toastmonsternyc
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
@StreetGrubSteve: I'll be on Eat St. tonight at 8PM hanging with the super rad Chef Adam Sobel and Cinnamon Snail! Awesome!	1397263739	454783203245817856	f	veganlunchtruck
@ELifeRestaurant omg guys.  That looks so freaking good.  I want it in bathtub quantity. 	1397260666	454770314237734912	f	veganlunchtruck
@johndelsignore @veganshopup sad but true.  Next week dropping a kickstarter to help us w/ our plight.  Hope you can help us spread the word	1397260561	454769870857834496	f	veganlunchtruck
RT @TurnstileTours: @VeganLunchTruck: "The police can't stop us from being yummy." #tothestreets	1397229599	454640009988276224	f	veganlunchtruck
I'll be speaking this morning at the Murphy Institute along with members of the Street Vendor Project, Make the... http://t.co/XZd3b8KBH6	1397214388	454576209322467328	f	veganlunchtruck
@kimbermyers we are going to need a lot of help with a kickstarter soon. Both funding it and promoting it.  Hope to be back in action soon	1397140868	454267842519912449	f	veganlunchtruck
The snail is having a rough time.  Want to do something to show us some love? Nominate us for the 2014 @vendyawards!\nhttp://t.co/YmBKGs15Nc	1397050732	453889786135449601	f	veganlunchtruck
RT @SkeeterNYC: Awesome filming w Adam from @VeganLunchTruck today. Look for his fundraiser to get The Cinnamon Snail back on the road! He'...	1396981366	453598843742203904	f	veganlunchtruck
A friend is looking for a home for a very sweet affectionate cat. If you are interested, email simplyathos at gmail http://t.co/T7mhnOmdtx	1396909494	453297389332226048	f	veganlunchtruck
Snipe your place in class before it sells out!\n\nI'll also be teaching 5 other cooking classes this summer at the... http://t.co/8T6ToWmV5P	1396895691	453239494838611968	f	veganlunchtruck
RT @VendorPower: Come talk good food and good jobs in public space this Friday 4/11 w/ @MMViverito @foodchainworker @VeganLunchTruck https:...	1396893366	453229743962603520	f	veganlunchtruck
@MLukeThompson starting Mother's Day weekend when the farmers market season begins	1396747119	452616341632331776	f	veganlunchtruck
Not going to be out this coming week.  We will miss you folks a lot.  :(\n\nIf you want to do something wonderful... http://t.co/Ht5QmAXmET	1396744784	452606545361391617	f	veganlunchtruck
@malward314 not open today	1396710431	452462459073200128	f	veganlunchtruck
@kc_todd we aren't out today	1396632052	452133712936058880	f	veganlunchtruck
@amywilson it's coming!	1396617211	452071465719197696	f	veganlunchtruck
@77klg7 no.  This never happened to us before.	1396606174	452025172670025728	f	veganlunchtruck
@johndelsignore I cried for you especially when this crap happened today.  We will prioritize a visit to your hood.  I promise.	1396579563	451913561099739137	f	veganlunchtruck
Some crappy news.\n\nToday at the end of lunch, we had a surprise inspection.   It turned out our vehicle... http://t.co/Wzwa6RiXkt	1396576965	451902662888669184	f	veganlunchtruck
Had a super fun time today shooting a #vegan tv show today with superstar chef @saramoulton \n http://t.co/G1Y0QECJX3	1396561534	451837938809470978	f	veganlunchtruck
#SliderNation http://t.co/XrCggSJXDZ	1397239877	454683118482755584	f	mrniceguytruck
#SliderNation http://t.co/EKGLVVrSkV	1397239464	454681387204096000	f	mrniceguytruck
RT @MitchieGadgets: Spring is officially here now! @MrNiceGuyTruck is back and in front of my office! #soexcited	1397239392	454681084882874368	f	mrniceguytruck
#SliderNation http://t.co/SfFnLpIwJz	1397229670	454640306651009024	f	mrniceguytruck
#SliderNation http://t.co/SgHOKBdgsd	1397229665	454640284954296320	f	mrniceguytruck
.  by lamayu_rn " lleiaaaaaaa! #mrniceguytruck #fattymcfatty #Ididntgotothegymtoday #ohwell" http://t.co/TcRefeemWJ	1397168096	454382047612923905	f	mrniceguytruck
I posted a new photo to Facebook http://t.co/gqvC3yZkAq	1397141142	454268993839190016	f	mrniceguytruck
 http://t.co/4KplCXwW4S	1397141138	454268977821544448	f	mrniceguytruck
@dyckmanbar nice job http://t.co/tcYraMJDsm	1397096568	454082034328035328	f	mrniceguytruck
@dyckmanbar nice job http://t.co/AoI9t7gW7a	1397096566	454082026283741184	f	mrniceguytruck
@officialDannyT great show on @OandAshow Today And thanks for stopping by our truck!	1397079871	454012005016678400	f	mrniceguytruck
@WoodlawnConserv email mrniceguytruck@gmail.com	1397058360	453921781313990657	f	mrniceguytruck
I posted a new photo to Facebook http://t.co/jZEuP4qiud	1397043762	453860552448548866	f	mrniceguytruck
 http://t.co/9AmyQ2pW8l	1397043758	453860534304378880	f	mrniceguytruck
Your favorite sliders n fries are back on the block today. 47th n Park Ave. Stop by for lunch. Windows up at... http://t.co/61c5jBt4NC	1396960331	453510616515215360	f	mrniceguytruck
Your favorite sliders n fries are back on the block today. 47th n Park Ave. Stop by for lunch. Windows... http://t.co/a4LqlltPtl	1396960329	453510608944889856	f	mrniceguytruck
RT @incrediblelili: What are you doing to me #mrniceguy?! #friedoreos  (@ Mr.NiceGuy) http://t.co/kXBH2FSHzy http://t.co/pjJT96iOPv	1396826353	452948674218561536	f	mrniceguytruck
RT @DyckmanBar: U about this 'Mosa life or nah? Which is ur fave? #selfiesundays #teamdb #liquidbrunch http://t.co/g79yxWZYQ6	1396817596	452911944174141440	f	mrniceguytruck
RT @HarlemEats: BIG shout out to our GREAT vendors @shortysnyc @gcnyc1 @TheCrepeTruck @hibachiheaven @JerkShack1 @Palenquefood @MrNiceGuyTr...	1396762915	452682593419689984	f	mrniceguytruck
RT @kitson: #HarlemFoodTruckRally seemed massively popular.\r@MrNiceGuyTruck\r@palenquefood\r@gcnycl\r@ShortysOnWheels\r@HibachiHeaven http://t....	1396751973	452636701165641728	f	mrniceguytruck
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
Cash only today!	1397231924	454649759719251969	f	neaexpress
We are open for lunch on 52nd and park!	1397230198	454642520505737216	f	neaexpress
It's Friday! Need plans for the weekend? http://t.co/hqu5cwkDSC	1397218838	454594875317846016	f	neaexpress
Here's a new, advanced way to post selfies on twitter. http://t.co/I6gkLWXHfd	1397165424	454370841015615488	f	neaexpress
Check us out in this spring's Fuel Fix! http://t.co/cWQDK2Mqdl	1397156748	454334447551537153	f	neaexpress
It's #nationalsiblingday ! Celebrate by reading these 15 quotes about the power of sibling relationships. http://t.co/TvTWd0KxoM	1397151020	454310425665216513	f	neaexpress
Hey @Prem97 ! We are running today on 52nd and Park until 4pm!	1397143644	454279487690399746	f	neaexpress
Good morning! Would you take a bite of this monster alphabet sandwich? http://t.co/EnBBmM5ft0	1397135449	454245112697339904	f	neaexpress
Who doesn't love seeing a grandma ride a roller coaster?! http://t.co/3qYGUlbv3L	1397067687	453960901859999744	f	neaexpress
Good morning! Here the top 25 travel destinations of 2014. http://t.co/ZaeoUs04v4	1397045794	453869075727654912	f	neaexpress
RT @BuzzFeed: Just a rat on the NYC subway https://t.co/wyOpEqCiaz	1396982411	453603225753890817	f	neaexpress
13% of Americans eat pizza everyday. Are you one of them? http://t.co/p2jypeJr3m	1396973476	453565749735739392	f	neaexpress
Check out the trailer for the new movie "Chef" coming out on May 9th! http://t.co/WGjFkd9VRl	1396959071	453505331222818816	f	neaexpress
Having a long day? Take a moment to look up at the sky... http://t.co/Xcf3HhwX6v	1396897806	453248369558036480	f	neaexpress
If you're a pizza lover, you need these 10 tools for your home! http://t.co/ID7Jd6f12s	1396886760	453202039284465664	f	neaexpress
What's a better way to start off the week than learning about the evolution of pizza?! http://t.co/p8xWuZZPpC	1396872551	453142439642279936	f	neaexpress
Happy Sunday! The early bird always catches the worm, but waking up early can also improve your health. http://t.co/4XAvh6gw4F	1396788330	452789193740402689	f	neaexpress
Good morning! Looking for something to do this weekend in NYC? Check out the Art Expo! http://t.co/hjilLSzc51	1396701082	452423246785552386	f	neaexpress
90s kids, how many of these ten websites do you remember? http://t.co/9CAJk0ejhA	1396637413	452156201095401475	f	neaexpress
Facebook could recognize your face well in pictures before, but with "Deepface", it has a 97.25% recognition accuracy http://t.co/tSwEK9mv8E	1396627469	452114493653659648	f	neaexpress
RT @TheRestylists: Our Top 5 Off-the-clock Spring leather jackets http://t.co/uGlAJgOe9P Top 5 off-the-clock leather jackets  http://t.co/h...	1397242905	454695816415154176	f	milktrucknyc
no. way. do not recognize that crooked number. http://t.co/TeMfR2aYub	1397237377	454672632416190464	f	milktrucknyc
Bessie's at Wall &amp; William, call (646) 504-6455 to pre-order. Sandwich menu always @houstonhallnyc	1397223004	454612348976648192	f	milktrucknyc
Bessie's at North End Ave &amp; Vesey, call (646) 504-6455 to pre-order. Sandwich menu always @houstonhallnyc	1397136602	454249952453992450	f	milktrucknyc
RT @ae_jones: SAMMICH time (@ Milk Truck Grilled Cheese - @milktrucknyc w/ 2 others) http://t.co/gUFEpZrfDg	1397066711	453956805975355392	f	milktrucknyc
RT @katie_honan: A breakfast sandwich with potatoes, chorizo and bread that's dipped in hot sauce before frying.(!) http://t.co/aw51fAqZnI ...	1397064598	453947944329560064	f	milktrucknyc
Bessie's at 58th, b/w Mad &amp; 5th. Call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always @houstonhallnyc	1397056398	453913549661024256	f	milktrucknyc
RT @JimWLondon: @milktrucknyc @morristruck #grilledcheese #macandcheese f#eichanghaoche	1397004484	453695805673988096	f	milktrucknyc
RT @DrinkBunna: Vendrs unite! #OneTripOrDie @smorgasburg @chickpeanolive @Lumpiashack @MonksMeats @milktrucknyc @SchnitzNYC @chedbred http:...	1396977801	453583890335412224	f	milktrucknyc
RT @nycfoodtruck: Yummy NYC Food Trucks: http://t.co/kQ7p7fs6lg via @BuzzFeed &amp; @allysterrr w/ @MilkTruckNYC @LobsterTruckNY @Mexicue @Kelv...	1396977791	453583849390608384	f	milktrucknyc
folks we're actually a couple of blocks up today at 27th &amp; park. call ahead at 646 504 6455	1396977628	453583166943797248	f	milktrucknyc
Bessie's at @Columbia, 116th &amp; Amsterdam. Call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich  menu always @houstonhallnyc	1396877431	453162907086229506	f	milktrucknyc
Beautiful day to stop by our @smorgasburg stand at Brooklyn Bridge Park Pier 5, see you there!	1396791029	452800511909957632	f	milktrucknyc
we be outdoors!! @smorgasburg @bkflea ft. greene and bessie in tribeca. yay yay yay!!!	1396706560	452446224625700864	f	milktrucknyc
Come to Day 1 of @smorgasburg outdoor market, 90 Kent Ave at North 7th! Also catch our stand at Fort Greene @bkflea, 176 Lafayette.	1396704627	452438117534793729	f	milktrucknyc
Bessie's at TriBeCa, Chambers &amp; Greenwich. Call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always @houstonhallnyc	1396704627	452438117132546048	f	milktrucknyc
RT @maryjoyb: Realized I only have Twitter to find my bus sched &amp; food trucks! @milktrucknyc @NuchasNYC @UrbanLobster @NautiMobile #foodtru...	1396633646	452140400585613312	f	milktrucknyc
RT @kathrynmichael: In the mood 2 celebrate #GrilledCheeseMonth? @cheapchicas heads 2 @milktrucknyc @LittleMuenster &amp; @empiredinernyc 2day ...	1396633610	452140251322916864	f	milktrucknyc
Bessie's at Wall &amp; William, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always at @houstonhallnyc	1396618226	452075723671343104	f	milktrucknyc
RT @stacylondon: If you have 10 bucks, donate to this kid's kickstarter project.  He's only 17 and he already has a beautiful eye. https://...	1396617732	452073653581000704	f	milktrucknyc
Happy Friday flatiron! Open at 22nd &amp; 5th ave. Friday lunch done right with Shanghai Sogo (THE FIRST "Asian Tapas Truck" in NYC)	1397230995	454645865056317442	f	shanghaisogo
#NYC &amp; #flatiron heating up! Love this coming #sakura &amp; #foodtruck season? Enjoy it w. Shanghai Sogo (THE FIRST "Asian Tapas Truck" in NYC)	1397230589	454644159929135104	f	shanghaisogo
Good morning,!Shanghai Sogo @ 22nd st &amp; 5th ave. . Come out! Come out before your dumpling sold out again.	1397226766	454628124459040769	f	shanghaisogo
Serving hot and delicious dinner @ColumbiaUniver Catch Asian Tapas Truck @Amsterdam ave &amp; 116th st &gt;&gt; #ColumbiaUniversity &lt;&lt;..4~8pm :-)	1397161835	454355786047561728	f	shanghaisogo
What a amazing day sunshine. SS come back @46th. with more dumpling, noodle &amp; sesame sandwich. Thank u for help us sold out &lt;2pm yesterday!	1397143799	454280136133578754	f	shanghaisogo
#Midtownlunch @46th st &amp; 5~6th ave. Serving hot &amp;llpdelicious Asian Tapas until 3pm. #Vegan #Organic #ChivesPorkDumpling   #BeefNoodlesSoup	1397140213	454265095560769536	f	shanghaisogo
RT @ShanghaiMKS: Guys, we're excited, because with this beautiful weather, it's definitely turning into food truck season! Where have you s...	1397077578	454002385891778560	f	shanghaisogo
BRAISED DUCK is available tonight! Come one, come all catch Shanghai Sogo @Amsterdam ave &amp; 116th st &gt;&gt;#CU &lt;&lt;..... 4~8pm.	1397073636	453985850506739712	f	shanghaisogo
Sizzling &amp; steaming Asian tapas is here! Cook-to-order from Shanghai Sogo! You can trust the House-make food. http://t.co/UM7Qilq8oG	1397073494	453985257776111616	f	shanghaisogo
Sun is out! It is nice day to be out for the food truck. get ur Asian tapas. Make-to-order. So it is hot &amp; delicious. SOGO for it!!!	1397057456	453917989436272640	f	shanghaisogo
Wednesday lunch? Catch us @46th bet 5~6th ave. #Vegan#Organic #ChivesPorkDumpling   #BeefNoodlesSoup #HibachiChicken #RoastBeef #BraisedDuck	1397054168	453904197784989696	f	shanghaisogo
Serving dinner @CU COME OUT! COME OUT @Amsterdam ave &amp; 116th st &gt;&gt;#CU &lt;&lt;..... 4~8pm.	1396986030	453618408139923456	f	shanghaisogo
@randomfoodtruck @midtownlunch. COOK-TO-ORDER Asian Tapas from SHANGHAI SOGO @broadway &amp; 55~56th st. 11~3pm.	1396974557	453570284348784640	f	shanghaisogo
What a beautiful weather in NYC! get out of ur office &amp; get ur Asian tapas from Shanghai Sogo Truck. Such a good idea to enjoy the day :-))	1396970733	453554245191880704	f	shanghaisogo
NYU, We missing u so much. swing by get ur Asian Tapas from Shanghai Sogo @west 4th &amp; Greene until 8.	1396896475	453242783583567872	f	shanghaisogo
Monday lunch idea? Catch your Asian Tapas Truck @King st &amp; houson. Until 2:30pm.	1396885718	453197666046857218	f	shanghaisogo
Had to move to Varick At and Vandam St sorry!	1387560054	414082995990331392	f	yougotsmoked
Shanghai Sogo Truck is at Hudson/ King St today. 11am to 2:30pm. Get your Asian tapas &amp; beat the Monday blue. Sogo for it!	1396883332	453187661281251328	f	shanghaisogo
RT @Starbucks: Iced Green Tea Latte + 1 pump vanilla = Spring in a cup. #ProTip http://t.co/qeCx1ThL7D	1396730920	452548395207757824	f	shanghaisogo
#parkslope the suns coming out so come see us @7th ave &amp; president st. we have some great dumpling that will make your HAPPY MEAL!	1396715234	452482606039588864	f	shanghaisogo
#parkslope Get ur meal @7th ave &amp; president st.#Vegan#Organic #ChivesPorkDumpling   #BeefNoodlesSoup #HibachiChicken #RoastBeef #BraisedDuck	1396714851	452481000837488640	f	shanghaisogo
#Happy Friday #Mausam #curry #king @55 Str and\nBway. No one beats our #authentic Indian flavors	1397225956	454624728955633664	f	mausamnyc
Back to #dumbofoodtrucks for some curries and bites	1397143111	454277253560799233	f	mausamnyc
#Curry #Mausam #Authentic #Indian #Cuisine @Dumbo. #beautiful #sunny day for our #Delicious #meals	1396530569	451708065000087555	f	mausamnyc
RT @DispatchNY: . @BrookfieldPLNY NORTH Lot | April 2nd | 11a-3pm | North End Ave. &amp; Vesey St. | @MexicoBlvd @MamuThaiNoodle @mausamnyc &amp; @...	1396450372	451371692884250624	f	mausamnyc
#WFC #North End #Mausam #best #Authentic #Indian #Cuisine #biryani #vegan #delicious #Curries #spice up yr #tastebuds with #Curry N Bites	1396442439	451338418035773440	f	mausamnyc
#Mausam @ 47st n Park Ave. #Delicious #Curries #biryani #garlic n #chili #roti #mango lassie. Enjoy this #beautiful day	1396364325	451010784454139904	f	mausamnyc
Back with curries at 47th and park @midtownlunch @nycfoodtruck @FoodtoEat	1396364242	451010438625775616	f	mausamnyc
#Curry N Bites for this perfect #spring day @55 st &amp; Bway. Great way to start yr week. Our #Delicious #spicy #flavors	1396274925	450635814469251074	f	mausamnyc
 Gm #Mausam #Curry #King@Dumbo #celebrate this sunny day with our #delicious #indian #cuisine	1395920266	449148266777571328	f	mausamnyc
#Mausam #indian #cuisine #WFC #north end #curries #biryani #roti #salad #chutney #vegan #vegetarian #chicken #mango lassie. Don't miss out	1395835971	448794709389893632	f	mausamnyc
Beautiful day #Mausam #Indian #Curries @Dumbofoodtruck #Chicken #Tikka #masala #paneer #samosas #kati rolls #salad #chutney #mango lassie	1395314599	446607917366534144	f	mausamnyc
#WFC #North End Ave #Mausam #Indian #Delicious #Curries #Makhani #Tikka #Palak #vindaloo #biryani #samosas #Alu tikki #chutney	1395230827	446256551083245568	f	mausamnyc
@Chris_Quartly thank you for feedback yeah just ask us for more curry and you will get more !!!	1395189113	446081588364062721	f	mausamnyc
#BrookfieldPLNY #WFC #Curry N Bites @South End #samosas #biryani #vegan #mango lassie #curries #salads #Mausam #Indian #Flavors	1395143162	445888856286449665	f	mausamnyc
@Chris_Quartly @BrookfieldPLNY sorry truck had smoke issue so getting it fixed. We missed you guys too !!!	1394665731	443886364820770816	f	mausamnyc
@DispatchBP #wfc @BrookfieldPLNY thank you for amazing welcome!! Yes will be back just fixing the smoke issue.	1394571645	443491741401112576	f	mausamnyc
@miniburb yes we will be there !!!	1394571539	443491297756991489	f	mausamnyc
Hello #WFC #Curry N Bites #Indian #Cuisine @South End Ave. #Mausam is #proud to be #serving our many #authentic flavors	1394539839	443358337032142848	f	mausamnyc
Happy Friday! This is #Mausam weather for our #Curry N Bites. #curries to spice up yr moods for the weekend @47str bet Park and Lex.	1394207206	441963173575266306	f	mausamnyc
 #Indian #cuisine #Curry N Bites @dumbofoodtrucks #Mausam many #tasty #spicy flavors #vegetarians &amp; non vegetarian.	1394111864	441563281208004609	f	mausamnyc
Located on 50th between 6th and 7th.  Stop by and sample our Greek Yogurts.	1397221789	454607249441587200	f	thepocketful
Sunshine on 50th between 6th and 7th. Hope to see you today. It's a beautiful day!!	1397132349	454232113177702400	f	thepocketful
Located on 50th, between 6th and 7th.	1397048413	453880060475637760	f	thepocketful
Located on 49th between 6th and 7th.	1396971178	453556113594916865	f	thepocketful
Located on 49th, between 6th and 7th.	1396621833	452090852715032576	f	thepocketful
Located on 50th, between 6th and 7th. Now open and serving Greek Yogurt for breakfast	1396527406	451694797108285440	f	thepocketful
Located in 53rd between Park and Madison	1396448740	451364847788519424	f	thepocketful
Located on 49th between 6th and 7th	1396361638	450999515513114624	f	thepocketful
Located on Hudson and  King streets	1396275331	450637520188223489	f	thepocketful
Located on 50th, between 6th and 7th	1396016561	449552156891557888	f	thepocketful
Located on 49th between 6th and 7th	1395930386	449190713826492416	f	thepocketful
Located on 53rd between Park and Madison.	1395844326	448829752804397057	f	thepocketful
Located today in 50th, between 6th and 7th.	1395758671	448470489355534336	f	thepocketful
Located on Hudson and. King	1395671629	448105409325563904	f	thepocketful
Located on 49th, between 6th and 7th.	1395416828	447036695666778112	f	thepocketful
Located on 50th between 6th and 7th	1395326269	446656864986865667	f	thepocketful
Located on 53rd between Park and Madison.	1395239916	446294675113381888	f	thepocketful
Located on 49th, between 6th and 7th. Come on out!!!!	1395156550	445945010526367744	f	thepocketful
Happy Saint Patrick, join us on Hudson and King for a traditional Irish falafel!!!	1395066551	445567529050988544	f	thepocketful
Located on 49th between 6th and 7th, in front of McGraw Hill building	1394807354	444480374929121280	f	thepocketful
I can code Ruby/Python/Node.JS &amp; Go apps on Nitrous.IO! Sign Up now and get 250MB free space: https://t.co/EzrZQM4XEl	1391042241	428688350007291904	f	yougotsmoked
Park Ave btw 33rd St and 32nd St from 11:00 to 3:00 today! New York Aged Cheddar Mac and Cheese! #Delicious #nyc http://t.co/Gf6QWDPKcv	1389964535	424168119977132032	f	yougotsmoked
Thank you so much! @gregdotgilbert glad you enjoyed it and hope you see you back soon!!!	1389921522	423987711750717440	f	yougotsmoked
RT @gregdotgilbert: Today's awesome lunch was courtesy of @YouGotSmoked. Thanks for coming down to fidi!	1389921410	423987241946726400	f	yougotsmoked
Today we are on Water St and Wall St from 11:00 to 3:00! #comegetsmoked #fidi	1389891274	423860842850177024	f	yougotsmoked
Hey @thisismydesign we apologize for the inconvenience Today. Next time you come by, your meal is on us, Sorry again...	1389819861	423561314326577152	f	yougotsmoked
Check us out today @dumbolot @DUMBOFoodTrucks from 11:00 to 3:00! #slowsmokedpork #applewoodsmokedchicken	1389793785	423451943378644992	f	yougotsmoked
Today we are on Water St and Wall St from 11:00 to 3:00!	1389373670	421689855509549056	f	yougotsmoked
Check us out today on Wall St and Water St in #fidi from 11:00 to 3:00! #followthesmoke See you then!!! http://t.co/6LUz80yDss	1389282332	421306753998131200	f	yougotsmoked
We are back! @dumbolot 11:00 to 3:00!	1389186820	420906148381077504	f	yougotsmoked
#tribeca get ready to be smoked! ( by BBQ that is ) check us out today for the first time on Varick St and Charlton St from 11:30 to 2:30!	1387549189	414037428048232448	f	yougotsmoked
Shredded Barbecue Skirt Steak - Arugula / Tabasco Onion Strings / YGS Signature BBQ Sauce / #comeandgetit http://t.co/RrW1VKbr9A	1387470510	413707422910652416	f	yougotsmoked
Attention #fidi we are back! Wall St and Water St from 11:30 to 2:30 with some Amazing BBQ! See you then!	1387469978	413705190010023936	f	yougotsmoked
Check us out today @dumbolot on the the Corner of Jay St and Water St from 11:30 to 2:30! See you then!!!	1387381955	413335997045547008	f	yougotsmoked
Not yet @meggerz04 sorry	1387381860	413335597949136896	f	yougotsmoked
RT @eatsleepwebcom: @YouGotSmoked That looks so delicious! I can't wait to have it today for lunch! @DUMBOFoodTrucks @dumbolot	1387377420	413316972819271681	f	yougotsmoked
RT @dumbolot: Lot vets @DomoTaco and @shortysnyc on jay &amp; water along with a new addition! Welcome to the lot @YouGotSmoked! @DUMBOFoodTruc...	1387377413	413316943698210816	f	yougotsmoked
Smoked Portobello Mushroom-Texas Toast/Arugula/Tomato/Caramelized Onions/Sliced Avocado/Sweet and Smokey Vinaigrette http://t.co/nkY5nZpk1k	1387317610	413066113388666880	f	yougotsmoked
RT @Runner_Nattie: @Valduccis @gofooda ooooh that looks phenomenal	1397226126	454625441824141312	f	valduccis
Pizza Delivery thru @gofooda @cater2me @foodtoEat http://t.co/7AQuYvF9n9	1397215977	454582873023320064	f	valduccis
Antipasti !  Mangia Mangia !          @gofooda http://t.co/rsaGRwyryH	1397215638	454581452538384384	f	valduccis
RT @JulieFarin: .@Valduccis food truck on W. 50th St. claims "the Best Sicilian Pizza in NYC," but that would be my mom's. Am I right, @ang...	1397153089	454319102019268608	f	valduccis
RT @UncleGussys: Get exclusive access to our contests, giveaways, and coupons http://t.co/oFq2EfDtpj	1397148488	454299802415939584	f	valduccis
RT @greenboxny: Drooling!!! @Valduccis Valducci's Big Boy Sicilian and @greenboxny save the planet one box at a time http://t.co/nncKx4TTAA	1397145612	454287740742680576	f	valduccis
RT @randomfoodtruck: Out front on this sunny Wednesday: @bobjoTruck @ChipsyKingNY @Valduccis @GrillOnWheelsNY @DeliNDogzTruck @schnitznthin...	1397145599	454287687525367808	f	valduccis
RT @89thandbroke: RT @Valduccis: Free Zeppoli  50st 6ave #bestpizza @gofooda @greenboxny http://t.co/Jj1MVWfWkr	1397145576	454287588531372032	f	valduccis
50th&amp;6th \nCome check out the panini !#delicious !	1397144673	454283801279991808	f	valduccis
Free Zeppoli  50st 6ave #bestpizza @gofooda @greenboxny http://t.co/AMQvdPUcXu	1397136272	454248565163175936	f	valduccis
RT @FoodtoEat: #FreeFood alert .@Valduccis Get a free zeppoli! Order #pizza online here to #SkiptheLine: http://t.co/lEn4RiKLCz	1397070917	453974448501432320	f	valduccis
Free Zeppoli 55 and Broadway http://t.co/2jTY8HN5KD	1397056079	453912212764364800	f	valduccis
NYC best food http://t.co/XljYDvnLDO	1397036666	453830787247648768	f	valduccis
Valducci's Big Boy Sicilian and @greenboxny save the planet one box at a time http://t.co/xZngfvQYnu	1397029495	453800713551089664	f	valduccis
RT @Giovannini8: @Valduccis grazie e benvenuto:):)	1396979448	453590797888548864	f	valduccis
RT @KatiaSignorini: @Valduccis grazie:))	1396979369	453590468732133376	f	valduccis
Corporate Catering Valducci's Style !!! http://t.co/YDAAkuziE5	1396979267	453590041538101249	f	valduccis
RT @jamescabrera: Just went in on some @Valduccis at work for lunch. Good stuff, but I definitely need to go for a run later.	1396978950	453588711801122816	f	valduccis
Valducci's is at @SAY media chicken Parm @gofooda http://t.co/raTQ4ebDTw	1396967941	453542534015627265	f	valduccis
Free Zeppoli today 50st 6ave #best pizza	1396956402	453494136025665536	f	valduccis
Prospect Heights!! We've come back to show you love! Lets have dinner together, noodles are being served! 6pm	1397162610	454359034926477312	f	mamuthainoodle
WFC North End! It's spring again! Noodles for lunch?! Get it hot&amp;fresh! 11-3 @BrookfieldPLNY @downtownlunch	1397054935	453907416447721472	f	mamuthainoodle
1st dinner service of the spring! Astoria, truck is here for your noodle needs! Steinway btwn Broadway&amp;31st ave. now - 8:30pm	1396996082	453660567568658432	f	mamuthainoodle
Special appearance today at WFC north End&amp;Vesey. Come by for your noodle needs!	1396885180	453195409180348416	f	mamuthainoodle
RT @JVB: Lunch time. @mamuthainoodle	1396550367	451791102690209792	f	mamuthainoodle
WFC North Noodle lovers! Ready by noon! Come and get your mid week noodle fix! @BrookfieldPLNY @downtownlunch	1396451520	451376510172426240	f	mamuthainoodle
It's Friday! Dumbo, you what that means. Noodles! 11:30-3pm. @DUMBOFoodTrucks @dumbolot @blankslatedumbo	1396020118	449567079239516161	f	mamuthainoodle
RT @jefferyhaines: .@heyalissatt &amp; @mamuthainoodle - Amazing noodles today. I would eat pad siew for breakfast if I could! Can't wait for y...	1395799982	448643760466178049	f	mamuthainoodle
@Aigoo were you at WFC south End&amp;Liberty? We've been there since 10:30am! You sure you went to South end not North end?	1395686297	448166931389231104	f	mamuthainoodle
Cure your Monday blues with us at WFC South End&amp;Liberty! 11-3pm @downtownlunch @BrookfieldPLNY	1395672710	448109943796015104	f	mamuthainoodle
Dumbo! Spring is here for today and so are we. Thai iced tea is back! @dumbolot @DUMBOFoodTrucks 11-3pm	1395412523	447018637476761600	f	mamuthainoodle
Spring is in the air. So is the smell of fresh noodles on a hot wok! Hope you're ready Thursday spot.	1395323377	446644734334095360	f	mamuthainoodle
Hello WFC South End&amp;Liberty today!Lots of traffic this morning. People wearing green. What's up? ;) 11:30-3p @downtownlunch @BrookfieldPLNY	1395068683	445576467997802496	f	mamuthainoodle
RT @KateBonelli: Wahoo! Mamu Thai Noodle food truck is here today. #myfavorite #tofuyumminessoverload (@ DUMBO Food Truck Lot) http://t.co/...	1394849246	444656086214524928	f	mamuthainoodle
Sorry folks, the truck is hibernating today. See you next time. When is spring happening?	1394717757	444104580516048897	f	mamuthainoodle
WFC North End&amp;Vesey! We are here for your noodle needs! Specials: khao soi or green curry. Ready @11:30 @downtownlunch @DispatchBP til 3pm	1394636198	443762496697270272	f	mamuthainoodle
Hello Tuesday noodle people! We are leaving at 2pm today for an event later this evening. Come by &amp; get your lunch before we go!	1394552617	443411930846597120	f	mamuthainoodle
You want noodles?! WFC South End&amp;Liberty today 11-3pm @BrookfieldPLNY @downtownlunch	1394463944	443040009902641152	f	mamuthainoodle
Sorry, late tweet! We are @dumbolot today! Come join us! @DUMBOFoodTrucks	1394212514	441985435393622016	f	mamuthainoodle
WFC North End! It's been a while! Come join us for lunch today! 11-3pm	1394034320	441238035150417920	f	mamuthainoodle
4:30-7pm 18th st &amp; 7th ave!!!	1397248481	454719203430662144	f	thetreatstruck
!!! Fri, April 11th 12-3:30 45th &amp; 6th, then 4:30-7pm 18th st &amp; 7th ave!!!	1397231407	454647591398297600	f	thetreatstruck
Hooray for Friday! We'll post our spots soon!!!	1397230520	454643870148870144	f	thetreatstruck
Bway (86 &amp; 87th) 'til 7pm tonight!!!	1397161106	454352726290624512	f	thetreatstruck
!!! April 10th Bway (86 &amp; 87th) 3:30pm until...we are not sure yet! Usually we're here 'til 7pm. We'll update soon!	1397157311	454336809674477569	f	thetreatstruck
We love Thursday! Why? All our regulars on the UWS make it a special day. We'll post hours later this morn!!!	1397129717	454221073547268096	f	thetreatstruck
4:30-7pm 18th st &amp; 7th ave!!!	1397074912	453991206222315521	f	thetreatstruck
!!! Wed, April 9th 12-3:30 45th &amp; 6th, then 4:30-7pm 18th st &amp; 7th ave!!!	1397052817	453898532676988928	f	thetreatstruck
Wed, April 9th, beautiful day!!! We're heading to our spots for the day! We'll let you know when we're set up!	1397044465	453863498737790976	f	thetreatstruck
!!! Tues, April 8th 12-4:30pm 5th ave (17th &amp; 18th st)!!!	1396973963	453567793620066304	f	thetreatstruck
Happy Sunday! Our shop open 8am-6pm w/food &amp; treats! Pancakes! BLTS! Sandwiches, salads &amp; soups, Treats !!! 521 Court st, Bklyn	1396783694	452769748993179648	f	thetreatstruck
!!! Sat, April 5th our shop open 8:30-7pm with food, #counterculturecoffee, Treats, and treeeats!!! 521 Court st #carrollgardens	1396701307	452424189249867776	f	thetreatstruck
We'll update as soon as we can!!!	1396698189	452411112328527872	f	thetreatstruck
Sat, April 5th our truck is off this weekend. Our shop is open with food &amp; treats! Slight delay today - our metal gate is stuck!	1396698176	452411059174121472	f	thetreatstruck
4:30-6:30 or 7pm @ 18th st &amp; 7th ave!! If the weather holds up, we'll stay 'til 7!  We'll let you know if we need to close early!	1396641409	452172960586268672	f	thetreatstruck
!!! Fri, April 4th 12-3:30 45th &amp; 6th Ave, then 18th st &amp; 7th ave late afternoon, we hope! We'll keep an eye on the rain &amp; see!	1396622089	452091926020648960	f	thetreatstruck
Rainy days definitely need treats! We'll let you know our Friday spots later this morning!!!	1396611513	452047567007002624	f	thetreatstruck
!!! Thurs, April 3rd UWS today! 2:30-3:30 Columbus &amp; 91st, then 4-7pm Bway (86 &amp; 87th)!!!	1396541690	451754708940898305	f	thetreatstruck
On 18th st &amp; 7th ave 'til 7pm!!!	1396471049	451458420420661249	f	thetreatstruck
Hooray, Coconut Mitch! Lemony Lemon cookies! Espresso brownies! Choc chip Macaroons! Ice Cream Cone Cupcakes! Hooray for treats!	1396457416	451401236471099392	f	thetreatstruck
"The Weekends" opening ceremonies under way here on Front &amp; Jay with Mushroom Barley, Navy Bean &amp; Cream of Broccoli soup. @DUMBOFoodTrucks	1397224097	454616929605812224	f	thesteelcart
@SweetChiliNYC Nice new truck! Love the piggy.	1397165203	454369913617252352	f	thesteelcart
RT @vllg: @TheSteelCart Nobody puts Baby in the corner. Unless it's the corner of Front &amp; Jay, in which case, somebody puts Baby in the cor...	1397142125	454273115691159553	f	thesteelcart
@vllg Baby never forgets her roots!	1397140894	454267954440728576	f	thesteelcart
A Steel Cart, the Musical! Now playing on 56th &amp; Broadway starring Navy Bean, Organic Lentil and Cream of Broccoli as the soups.	1397139272	454261149530611712	f	thesteelcart
Here for the common Dumboan. Front &amp; Jay through lunch with Cream of Broccoli, Organic Lentil and Split Pea Soup. @DUMBOFoodTrucks	1397048270	453879459331182594	f	thesteelcart
It's 56th &amp; Broadway this sleepy Tuesday. The soups are Split Pea &amp; Ham + Organic Lentil (vegan)	1396964966	453530056397451264	f	thesteelcart
It's Front &amp; Jay this Monday with Creamy Corn Chowder &amp; Yellow Split Pea. @DUMBOFoodTrucks	1396879832	453172980190044160	f	thesteelcart
Free Advice Friday! Stop by Front &amp; Jay in #Dumbo for some good food and strong pointers. @DUMBOFoodTrucks	1396615040	452062362766696448	f	thesteelcart
RT @karmasuperman: Excited to try the spicy black bean! @TheSteelCart http://t.co/Wm49fZtugi	1396548328	451782549116055552	f	thesteelcart
Hot stuff on 56th &amp; Broadway! Soups are Spicy Black Bean &amp; Split Pea.	1396534611	451725019517706241	f	thesteelcart
@steinsie Dumbo Friday! 	1396533947	451722233296482304	f	thesteelcart
"Let's call it #DUMBO!" Front &amp; Jay through lunch with Split Pea, Creamy Potato &amp; Mushroom Barley. @vllg  @DUMBOFoodTrucks	1396449433	451367755103862784	f	thesteelcart
No foolin' 56th &amp; Broadway. Serving till 2:00. Creamy Potato &amp; Mushroom Barley be the soups.	1396356282	450977049545814017	f	thesteelcart
For The Great @mrmet and all who bear his symbol, free coffee this morning! #OpeningDay #LetsGoMets	1396273704	450630693220261888	f	thesteelcart
Quit playing with those rain sticks &amp; come have breakfast! Front &amp; Jay through lunch w/ Creamy Potato &amp; Chicken Noodle. @DUMBOFoodTrucks	1396271439	450621193109123072	f	thesteelcart
This still exists... and it's as fantastic as it looks. Just add couch + television. #amazing @Quaker http://t.co/SgIX3Ykt65	1396111281	449949442586984448	f	thesteelcart
Check out this fork we found! #hellyes #metalrules - Have a great weekend! http://t.co/uXudf2IOpo	1396040193	449651276838879232	f	thesteelcart
@JayeRose13 Sorry Jaye, Staying close to home today. We'll be back on 56th Tuesday. ;)	1396013454	449539125436493826	f	thesteelcart
@vllg We love the Dumbo long time.	1396013289	449538435221848064	f	thesteelcart
RT @EmilyARupp: Couldn't even handle the deliciousness from my lunch @DomoTaco. That falafal is SO DOPE.	1397250950	454729562505891840	f	domotaco
@WinnieeYuen be sure to come back next week! We're at DumboLot every Wednesday!	1397238247	454676280844492800	f	domotaco
@EmilyARupp thanks for showing the love, come back anytime, we have dope falafels for days!	1397238063	454675509109338112	f	domotaco
Its a gorgeous day and we're open on 49th and 6th for your Friday taco fix!	1397229300	454638756113285120	f	domotaco
49th btwn 6/7th!	1397218828	454594833365999616	f	domotaco
RT @WinnieeYuen: Just what I needed! #fishtacos @DomoTaco @DUMBOFoodTrucks http://t.co/rY1L3A3vID	1397152340	454315958694592512	f	domotaco
We're back on the (far) east side on 47th &amp; Lexington! Come try a #kimchifalafel ball on the house!	1397141668	454271197090291712	f	domotaco
We're at DumboLot today with good food, good vibes and good tunes! Retweet and show this tweet for a free #KimchiFalafel with your order!	1397053476	453901296840347648	f	domotaco
Just had a #PorkBelly rice bowl from our buddies at @mooshugrill and it was Beyond amazing! Beyond with a capital "B"!  #SucculentPorkbelly	1396973862	453567371568226304	f	domotaco
We're back on 55th abd Broadway for #TacoTuesdays! Slinging tacos and smiles till 2:30!!	1396969244	453548000447451137	f	domotaco
Why wait for other trucks to be open at 11:30 or 12:00 while we're already open now? Come brighten up your post... http://t.co/JfBiAARROx	1396883929	453190164257308674	f	domotaco
50th btwn  6th and 7th ! #comegetsome	1396879134	453170053521739776	f	domotaco
@sabrinanjanz ave B &amp; 2nd St or 35th &amp; Broadway.	1397330688	455064006102114305	f	waffletruck
RT @CoryTownes: Just had @Domotaco for lunch. If you're in Midtown, you gotta hit this up. Korean-Mexican fusion?! Fire.	1396648051	452200819925192704	f	domotaco
@CoryTownes Thanks for the love man, come through again next week! We got Shrimp Tempura Burritos for days!	1396637448	452156346671308800	f	domotaco
#TGIF! 49th &amp; 6th, come by for #FalafelFridays!! Complimentary piece of falafel with every order! Open by 11:30.	1396620992	452087324143136768	f	domotaco
53rd &amp; Park, we're back for your Thursday #DomoTaco fix! Be sure to try our new item, the #CurryChickenEmpanada!... http://t.co/Cah9j9NMvv	1396533482	451720280411361283	f	domotaco
Hello #NYC!	1396527529	451695312617631744	f	domotaco
Gearin up for a busy day in DUMBOlot! If youre one of the lucky few that get to try the limited supply... http://t.co/9NJzmFCcjn	1396443760	451343958992355329	f	domotaco
@AgentM April fools:)	1396382135	451085487189798913	f	domotaco
@AgentM thanks for the love! Next tacos on us if you introduce us to #wonderwoman	1396381699	451083659656040448	f	domotaco
Proud to be catering for the Queens Council on the Arts: a moveable feast: The Art of Ghost Dumplings! http://t.co/sGSdG4C38Q	1397266021	454792774253285376	f	polishcuisine
Catering? If you need us to send an email to your lunch coordinator - we will! drop us an email: OldTraditionalPolishCuisine@yahoo.com	1397242019	454692100173336577	f	polishcuisine
thanks for coming everyone! enjoy the weekend! #pierogistyle	1397241984	454691956715978753	f	polishcuisine
RT @NYCWingnut: @PolishCuisine Thanks for the YUMMY lunch! #pierogitime	1397236987	454670996432515072	f	polishcuisine
RT @kippolerno: Hangin on 5th ave @PolishCuisine food truck Fleetwood on the pod getting a little nyc sun feels gooooood, Friday	1397236977	454670955638714369	f	polishcuisine
@NYCWingnut thanks for stopping by in this great weather! happy friday!	1397236963	454670894028587010	f	polishcuisine
RT @Alannabean: .@catesish @PolishCuisine!!!	1397231694	454648796128215040	f	polishcuisine
Rockin' the pierogi truck on 5th avenue &amp; 21st street - ready for lunch #pierogitime @nycfoodtruck	1397228554	454635626722504704	f	polishcuisine
I posted a new photo to Facebook http://t.co/4D7NBIaNdv	1397227067	454629389120978945	f	polishcuisine
I posted a new photo to Facebook http://t.co/Vs4EIGHKJi	1397226941	454628859573702656	f	polishcuisine
I posted a new photo to Facebook http://t.co/jm9d9Cy5yb	1397226869	454628558049402880	f	polishcuisine
I posted a new photo to Facebook http://t.co/O3aiOXxuSB	1397226785	454628204570234880	f	polishcuisine
5th Ave and 21st street today - great options, great food! @nycfoodtruck #therealdeal	1397221089	454604315785981952	f	polishcuisine
Succulent delicious smokin' hot off the grill ridiculous Kielbasa #catering http://t.co/MdtpQKmS1i	1397179900	454431556980183040	f	polishcuisine
We'll be in Flatiron tomorrow loaded with potato &amp; cheese, meat, kraut &amp; mushroom, spinach &amp; cheese pierogi! # yum #pierogitime	1397178426	454425374991343616	f	polishcuisine
RT @alhernandez76: @PolishCuisine a great lunch today! Best in NYC :)	1397172557	454400757996216320	f	polishcuisine
Thanks for coming!- don't forget to order your Easter delights or email us for our catering menu!	1397157561	454337859370385409	f	polishcuisine
RT @randomfoodtruck: Picnic weather! @lobstertruckny @hibachiheaven @PolishCuisine @tacobite @mactruckny @YumeFoodTruck @TheSteelCart	1397143355	454278276304084992	f	polishcuisine
We are open on 55th and Broadway- get your kielbasa while it lasts! @nycfoodtruck	1397142884	454276297741844481	f	polishcuisine
You know the drill- we are on 55th and Broadway today #broadwaythursdays	1397138075	454256127723978752	f	polishcuisine
It's still cold, but not too early to start gearing up for our 2nd season! Excited to introduce something that... http://t.co/RgJoeJoAI0	1393515511	439061994394894336	f	delsnyc
We know it's hard to think about Del's when it's predicted to snow tomorrow...but we're in NYC and it's all about... http://t.co/JtTuqdtrTW	1384186749	399934332309372928	f	delsnyc
@woodlandalyssa thanks for the support!	1383930597	398859952267476992	f	delsnyc
RT @DUMBOFoodTrucks: You may have seen the @delsnyc truck around DUMBO this summer - help them raise $ for another one on @kickstarter! htt...	1383928941	398853003425615872	f	delsnyc
@VLAIC thought you guys might like our new video! Hope you could help spread the word! http://t.co/SVY2NdibIr	1383928804	398852430609125376	f	delsnyc
@jpmorgan I know you guys have a lot of Del's fans in midtown! Might be worth it to invest in some office catering! http://t.co/SVY2NdibIr	1383928648	398851778378096640	f	delsnyc
@WeWork Hey guys! Hope you saw our Kickstarter page for the chance to get super discounted Del's for next season! http://t.co/SVY2NdibIr	1383928482	398851080848539648	f	delsnyc
@INTERMIX thought you guys might be interested in our catering rewards for next summer! Please help support! http://t.co/SVY2NdibIr	1383928279	398850227202834432	f	delsnyc
@BrooksBrothers tho it's hard to think about it now...I know you guys would be interested in our "On-Demand" reward! http://t.co/SVY2NdibIr	1383928168	398849762520096768	f	delsnyc
@DumboNYC @DUMBOBID Help us get the word out! We want a 2nd truck to make stops in DUMBO during the week! http://t.co/SVY2NdibIr	1383928018	398849133353500672	f	delsnyc
More exciting news! Our friends in Melbourne, Australia are launching Del's Frozen Lemonade Australia in December 2013!	1383873653	398621110159552512	f	delsnyc
Thanks to all our Kickstarter backers thus far! We've got a ways to go so keep spreading the word! Private catering only $500!	1383837878	398471061412794368	f	delsnyc
Thanks Complex Mag for all the support throughout our 1st season!... http://t.co/RKUVSRdSyA	1383677868	397799926924869633	f	delsnyc
@ComplexGuide Thanks for all the support!	1383677817	397799714025787392	f	delsnyc
RT @ComplexGuide: .@DelsNYC wants to introduce a second truck next year. Find out how you can help make that happen. http://t.co/Tytce2LAn9	1383676295	397793332195495937	f	delsnyc
@ange1b1aze help spread the word!	1383614324	397533405006815232	f	delsnyc
RT @ange1b1aze: @DelsNYC I moved to NYC from Pawtucket, and my mind is blown! Didn't know you were here, too. Can't wait to get some Del's ...	1383614308	397533337109417984	f	delsnyc
Thanks Jen Carlson and Gothamist for all the support! http://t.co/MO3Uxo1tnD http://t.co/xGWW5YJeLX	1383608573	397509282721439745	f	delsnyc
RT @Gothamist: Help Del's Lemonade Bring A 2nd Truck To The Streets Of NYC\nhttp://t.co/Fc9GqE9fwL (@delsnyc)	1383603575	397488323352358912	f	delsnyc
RT @leahperrotti: Help support @delsNYC, the world's favorite frozen lemonade from RI, buy a new truck! http://t.co/UlUId63XVx	1383603558	397488251323555840	f	delsnyc
great day in Dumbo last night - thank you to all who came out to support us - #maplelove	1397299728	454934151343636480	f	snowdaytruck
We are at Bergen and Court streets in Brooklyn until 5:30pm.	1397300825	454938751442354176	f	carpedonutnyc
We've got mad maple love for @DUMBOBID	1397302953	454947679588843520	f	snowdaytruck
We're excited to participate in @cooperunion's Founder's Day tomorrow! Our designers @SITUSTUDIO are CU grads so it's extra special for us!	1397302860	454947285487849472	f	snowdaytruck
!!! Sat, April 12th no truck today! Our shop open 8am-7pm w/food &amp; treats!! 521 Court st #carrollgardens #brooklyn #treats !!!	1397302287	454944882931810304	f	thetreatstruck
RT @DriveChangeNYC: We're honored to be featured in @HuffPostFood http://t.co/06UzcX87Y8 - our first week on @SnowDayTruck was a massive su...	1397303152	454948513882058752	f	snowdaytruck
Yay! RT @DavinaLum: @dubpies Made it yesterday. I was the only Kiwi in the house! Steak &amp; mushroom was gone in 2 mins http://t.co/haBTNNwJrO	1397304743	454955184540880896	f	dubpies
RT @guerrillastreet: @lobstertruckny @fojolbros @EastSideKingATX @biggayicecream It was an honor being nominated among such talented food t...	1397307553	454966972128567296	f	lobstertruckny
RT @ChineseMirch: Going 2 #TFF2014 ? Then buy tkts 2 @GeneralTsoMovie ! We have a cameo 2 in this fascinating movie on #Chinese #food! http...	1397307370	454966204147703808	f	getstuffednow
Stop by our stands out at Williamsburg @smorgasburg and Fort Greene @bkflea. Sandwich menu always @houstonhallnyc	1397309406	454974743486021634	f	milktrucknyc
Bessie's at TriBeCa, Chambers &amp; Greenwich. Call (646) 504-6455 to pre-order or #skiptheline at @FoodtoEat.com	1397309406	454974742273855493	f	milktrucknyc
#RedHookLobster will be rocking the @SMORGASBURG today 11:00-6:00, East River State Park (90 Kent Ave at North 7th).	1397310927	454981124121718784	f	lobstertruckny
Vedette @ 60th &amp; 5th ave til 8pm Kotmadam @ Great Lawn in Central Park til 7:30pm\nGoesting @ Bway &amp; 66th til 10pm	1397310474	454979221145010176	f	waffletruck
Momma Truck @ 7th &amp; Carroll in Park Slope, BK til 4:30p	1397310447	454979109278732288	f	waffletruck
Splendid Saturday!  \nLe Cafe @ 15 ave B till 2am \nDe Wafel Cabana @ 35th &amp; Broadway til 10p	1397310428	454979031637958656	f	waffletruck
The #RedHookLobster will be slinging the best #lobstah rolls at @bkflea in Fort Greene, 176 Lafayette Ave bt Clermont&amp;Vanderbilt Ave.	1397313102	454990244161814528	f	lobstertruckny
Wafeloons! Spring is here! Join us for a fun wafeltastic day! #dinges	1397313325	454991179424489472	f	waffletruck
#HappyNewYear to our #Thai #Cambodian and #Laos friends!!!\n#Songkran	1397311228	454982386091298816	f	bigdsgrub
@Citi Stop by Manhassat branch 11:30am - 2:30pm today for a free lunch (one per), The branch has been relocated!" http://t.co/fh8xkZE7OF	1397313470	454991788621955073	f	disosnyc
Stop by Manhassat branch 11:30am - 2:30pm today for a free lunch ( while supplies last / one per person ), The... http://t.co/XL1EJPU8K9	1397313000	454989818104381440	f	disosnyc
Wafeloons! Spring is here! Join us for a fun wafeltastic day! #dinges http://t.co/2YM7YMzLUx	1397314630	454996652475314177	f	waffletruck
@ForestHillsNYC we are on Continental &amp; Queens Blvd from 11-6 today come get ur #Yumyum	1397314070	454994306806591488	f	hibachiheaven
nat'l grilled cheese day! come celebrate. @smorgasburg @bkflea ft. greene. bessie at chambers &amp; greenwich. always @houstonhallnyc.	1397313948	454993795453820928	f	milktrucknyc
At the Lincoln center apple store..  More like craypple store.. Amiright? Just kidding we run off apple products, we apologize lord jobs.	1397314815	454997431663726592	f	nautimobile
RT @crossroadny: #NationalGrilledCheeseDay! We have you covered with @morristruck sandwiches - the classic, green machine, croque monsieur ...	1397315868	455001845631823873	f	morristruck
It's always #NationalGrilledCheeseDay for us, but happy day nonetheless! We're @StJohnsU for a private event today, but cheese up, cheesers!	1397315833	455001701330984960	f	morristruck
Call in advance for pickup today!!!\n@ 347-70T-BiTE	1397316223	455003334542635009	f	tacobite
@souvlakitruck @LukesLobster\n67th str &amp; Broadway \nIn front of the APPLE store!!!\nBest TACOS!  Best Souvlakia! \nBest Lobster rolls in NYC!!!!	1397315865	455001835280289794	f	tacobite
Iced Coffee season! Come try our delicious Brooklyn Roasting Cold Brew iced coffee at all our locations! #icedcoffee http://t.co/UnDP5542tK	1397317567	455008972865822720	f	waffletruck
LUNCH TIME!!! We Are Here, Right By Grand Army Plaza...\n\nWHERE PLAZA STR WEST  &amp; UNION STR MEET AT\n\nCOME N ENJOY UR FAVORITE AREPAS...	1397317789	455009905943252992	f	palenquefood
Just sold our first FroDo of the season! #spring #finally	1397317862	455010211070509057	f	carpedonutnyc
@JivamuktiJersey yay!  Just took a slammin jiva class in red bank this morning.  Love you guys 	1397317936	455010519075008513	f	veganlunchtruck
Its a beautiful day in the neighborhood,  it's a beautiful day in the neighborhood! ! UWS 67TH ST &amp; Broadway cheesesteaks for all\nTill 8	1397319008	455015016488792064	f	carlssteaks
RT @VeganLunchTruck: We are launching a kickstarter in the next couple days.  We will need everyone's support to get back on the street. Ho...	1397320961	455023208560078848	f	taimmobile
RT @TasteTrekkers: .@BalaboostaNYC fried olives are a must-try for foodies celebrating Passover! Listen to our podcast on Kosher dining htt...	1397320926	455023063290368000	f	taimmobile
We are launching a kickstarter in the next couple days.  We will need everyone's support to get back on the street. Hope y'all can help us	1397320670	455021986922897408	f	veganlunchtruck
@UndrgrndDonuts It's our donut ice cream sandwich! An apple cider donut cut in half and filled with organic vanilla ice cream goodness.	1397321232	455024346130821120	f	carpedonutnyc
@Deniselovexo cabana at 35th and 6th Ave. Flagship at Ave B and 2nd St.	1397323575	455034170432307201	f	waffletruck
RT @ColumbiaComDev: Don't go hungry while at #throwbacchanal. Enjoy some @KorillaBBQ &amp; some @elpasony. Yummmm!!!!	1397322951	455031556747571201	f	korillabbq
The Belgian king needs your help. He wants to know how his flagship cafe is doing in NYC. Tell him what you think! http://t.co/i7YwQUzNhx	1397325553	455042469387071488	f	waffletruck
Hello NYC  http://t.co/iUIYXlE7bm	1397325662	455042926092230656	f	mexicue
RT @PotlickerKtchn: Who makes the best #NYC grilled cheese? .@morristruck!! Happy #GrilledCheeseSandwichDay	1397325838	455043662117089281	f	morristruck
Nuchas truck at spring &amp; broadway until 10pm! Come get your empanada fix http://t.co/xbL1gV0gF6	1397325659	455042913417039872	f	nuchasnyc
We here at #throwbacchanal with @TheChainsmokers and @LupeFisco. Grab a bite while you enjoy this dope ass day!	1397329127	455057457732386816	f	korillabbq
#Park Slope, Asian Tapas Truck @ 7th ave &amp; President st, BK til 4:30p, you know how good it is!	1397329026	455057034606411776	f	shanghaisogo
The #RedHookLobster is still enjoy the spring weather @SMORGASBURG today. We'll be at the East River State Park until 6:00!	1397331056	455065549333360640	f	lobstertruckny
The #RedHookLobster is still slinging the best #lobstah rolls until 6:00 at @bkflea in Fort Greene, 176 Lafayette Ave.	1397330107	455061568297115648	f	lobstertruckny
@joedelucia yes! Great Lawn near the turtle pond	1397330710	455064099370848256	f	waffletruck
Our clever/funny/artistic baristas strike again on the outdoor blackboards with a Spielberg theme: http://t.co/ZnADGKraLx (4 or 4)	1397331354	455066801437941760	f	dubpies
Our clever/funny/artistic baristas strike again on the outdoor blackboards with a Spielberg theme:  http://t.co/xqW9fGXkuL (3 of 4)	1397331286	455066514962800640	f	dubpies
Our clever/funny/artistic baristas strike again on the outdoor blackboards with a Spielberg theme:  http://t.co/X5dtlAOIyX (2 of 4)	1397331258	455066397652303872	f	dubpies
Our clever/funny/artistic baristas strike again on the outdoor blackboards with a Spielberg theme:  http://t.co/ja9HqjdXw2 (1 of 4)	1397331206	455066178755780608	f	dubpies
Which should come back first: strawberry or blueberry pierogi? #harddecision #yum http://t.co/QdsSD3IC7g	1397329981	455061041584410624	f	polishcuisine
Warm weather = favorite strawberry pierogi coming back soon! #yum #morepierogi http://t.co/qScXcvevX3	1397329884	455060632568872960	f	polishcuisine
@JivamuktiJersey @_graceandglory_ heck yes!	1397332555	455071839094853632	f	veganlunchtruck
#ivyleaguers get it all! lupefiasco and @thechainsmokers #studyhard http://t.co/mfcIzC7uf9	1397335138	455082669790220288	f	korillabbq
@SKOrmsby lol!! :-(sorry we don't deliver...but you can call inadvance for pick up.	1397334602	455080423350366208	f	tacobite
Very good!  ;-) RT @bryng: @dubpies just when you thought it was safe to go back in the warmer...	1397333912	455077530383708161	f	dubpies
http://t.co/feAh5u2aBY	1397334860	455081504620953600	f	valduccis
Meatball is the best http://t.co/7DuMYL5xhL	1397334682	455080756826877952	f	valduccis
RT @Puffah0ntas: Lmaooo http://t.co/W1psxdNRZZ	1397334562	455080254391189504	f	valduccis
#RedHookLobster will be kickin's Miami style @RoyalPalmsClub tonight 6:00pm - close!	1397336495	455088364698730496	f	lobstertruckny
So you've had waffles... but have you had WAFELS? #dinges http://t.co/19ESuUkhaR	1397338264	455095784351227905	f	waffletruck
RT @VeganLunchTruck: We are launching a kickstarter in the next couple days.  We will need everyone's support to get back on the street. Ho...	1397337216	455091386053066752	f	sweetchilinyc
RT @ChoiceEats: Did you know that the head chef of @SweetChiliNYC iNYC Lisa, was a finalist in Top Chef Season 4?! See what they whip up at...	1397337172	455091202678067200	f	sweetchilinyc
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

