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
    prefix text NOT NULL,
    suffix text NOT NULL,
    visibility text NOT NULL,
    twitname text NOT NULL
);


ALTER TABLE public.images OWNER TO pepp;

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
    matcher character varying(18)
);


ALTER TABLE public.trucks OWNER TO pepp;

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

COPY images (id, prefix, suffix, visibility, twitname) FROM stdin;
520e673a11d25d1282a44199	https://irs2.4sqi.net/img/general/	/117715_KjwJnc6idBB7TuMKhGboHDg8IYjlGcr6h3I6_fJECmM.jpg	public	delsnyc
51af7257498e0c7f8979c05d	https://irs3.4sqi.net/img/general/	/752258_nUJpoSxZ8p9BBJMG5ISetpo3DDLzycLT_gT3z9fvJmI.jpg	public	getstuffednow
523c8b2a498e959b87f8ded2	https://irs0.4sqi.net/img/general/	/39707564_-WCsPSk2ExKeZ8q06DtUQrpt_vcWG9-AzvFoToSdQqY.jpg	public	getstuffednow
50ca356fe4b05b0bb93edc40	https://irs0.4sqi.net/img/general/	/1590381_NyRIp7fXJtGoJoXp25IcMmufNufPxxvLEj3TVYXRo5g.jpg	public	getstuffednow
52013fe1498e5f476bfdcf83	https://irs3.4sqi.net/img/general/	/30611522_DHhazmY8dyNAbmijjHX7jyyfVBEiugL5-GJcTLuYjS4.jpg	public	getstuffednow
4f7deaf5e4b0ffb6a3f2008e	https://irs1.4sqi.net/img/general/	/Xho5Xq8BtpNhEQvH0KRI3yX4kUstFRwTxEDj6QoawcM.jpg	public	palenquefood
4fb29dc4e4b0e08c1e225555	https://irs2.4sqi.net/img/general/	/ckjwTj4Fd2cRoZvDQZw_1jYdwuBF4BsfV4ZWc5oElFo.jpg	public	eddiespizzany
5249c4bb498ecd25dde27c5e	https://irs2.4sqi.net/img/general/	/764670_x0RdEOs5TL4SEe2zGgpkzPFBFmlFV7-6UQiVtoFeHaY.jpg	public	goburger
5182ad6b498ef6cb59d48783	https://irs2.4sqi.net/img/general/	/39425123_zPh6ih4GAAygbhRJ-pyPdCr5TI3rXafgKyIEEK4HpHY.jpg	public	goburger
526fef71498e92d1ace459d9	https://irs0.4sqi.net/img/general/	/60805368_eCRrBwapYrNL8fM9tmIaLCfnlhQYb9ASU-ZkaR1Og54.jpg	public	mamuthainoodle
507b0648e4b0109f3656e2d2	https://irs3.4sqi.net/img/general/	/76137_7JNe3m0dO2MZ7a9rkqa_DTlnrw0LyNitqksFG7_5IC8.jpg	public	lobstertruckny
508abe69e4b01ff7516d118b	https://irs2.4sqi.net/img/general/	/8029486_9wt2tO9BnY5d11Ef0mpAgHAqfK1QMmSvLXglU4fj6Xw.jpg	public	lobstertruckny
500ecc9ce4b0a6d209804d9e	https://irs3.4sqi.net/img/general/	/d2yG6CtTrc8TQAXoEGN68UYAv3DiJIqJvKU65-ApcaU.jpg	public	lobstertruckny
5245c7a1498e0eb9bc097723	https://irs0.4sqi.net/img/general/	/1727660_xLZtYmqATL4pckN_IhgIj0AgUbDAJxywzqbf5PKEooM.jpg	public	lobstertruckny
5231f54311d26e8da5827f3b	https://irs1.4sqi.net/img/general/	/977282_AToQDrlKW5PTNbNGQcB24_BeJNsRMgZTeYmC9P-or38.jpg	public	korillabbq
5286645011d228bbd12f9880	https://irs0.4sqi.net/img/general/	/1353667_2qCG26N4ikz7mbvEGkrFkcNLagGqrzRuNyeQ35CCDE8.jpg	public	korillabbq
528e451f11d2a93e4361f565	https://irs3.4sqi.net/img/general/	/977282_wEw3nDjN0NbjC4CgQ00ON0YjdtnMocrfAjXDM4UH63Q.jpg	public	korillabbq
4fee068ce4b0f9bd2b4041f7	https://irs3.4sqi.net/img/general/	/UQwqaF9knSdh4LFRzAhnh7hcl6_dSjDTg1phtqTe_7Y.jpg	public	milktrucknyc
4f749b3fe4b0f06c04ae2440	https://irs3.4sqi.net/img/general/	/rA31cWGMm0G8EuZFYZBxb3y2OrW3oEo7vCj1L2XR3AM.jpg	public	milktrucknyc
5281221811d21e907e460e00	https://irs2.4sqi.net/img/general/	/4195495_akELCvAQ7aY-bfTfHk93g5g5_qcJnQJV7h_gH0FlKUA.jpg	public	milktrucknyc
52052ef211d22b8ed81dd96b	https://irs1.4sqi.net/img/general/	/36360429_am9ha8rSYxAvCaSMU9ya6lI9MzIgcpR62DH6HS1b-uY.jpg	public	milktrucknyc
5244712a11d295d581384a17	https://irs1.4sqi.net/img/general/	/22780_QXd0BtJcOWXZwSm_ZG3oXyaNj6Qw5-p8hWQzzH121fY.jpg	public	polishcuisine
5192873e498e63958610c2eb	https://irs1.4sqi.net/img/general/	/117715_Jf2pdeF9ztory7puWsPaFE26jmMzPEzjOfPopvTzSjA.jpg	public	polishcuisine
52a0bef911d299250c89f9c7	https://irs1.4sqi.net/img/general/	/349672_Cg8dtcrfQ0WZeSo7BJR61YBG6VzsiMltZP8XIqyHiu0.jpg	public	mrniceguytruck
521cdbc611d2549cf41dcf9c	https://irs1.4sqi.net/img/general/	/926357_0BYLrfqHavxLIHQNkWupu34ImE55HTUVGGDJjycyOVM.jpg	public	seoulfoodnyc
525b3a3711d2040fdcbd6fee	https://irs3.4sqi.net/img/general/	/52031712_DN0C9vfm3iv1geUuFX92Pt0jwgl8NhbGokLj_o0Ebjg.jpg	public	mooshugrill
529fe66b498e1fd14afe696f	https://irs1.4sqi.net/img/general/	/68150_h0wbg6xbNwrEjXD6uaE12ZDZYF_h55LN99Es520nMBI.jpg	public	mooshugrill
5213a7c011d27a56f99dfba3	https://irs3.4sqi.net/img/general/	/11074699_K2ka1_NxiELyTqgjvY3oMN70IUxIlADqRIAb5QpzsLM.jpg	public	mooshugrill
516d98b8e4b0b059e50ff5ad	https://irs2.4sqi.net/img/general/	/117715_BoNkQJO4jPWEtg_ef4-URb7IseoIXnYiP5vkvWJtezg.jpg	public	toumnyc
516452a5e4b0e1b216fdbaa4	https://irs1.4sqi.net/img/general/	/26263584_5wpEOb9FygNRBFQySA-pE1t1q_E9jVM_4mx2mnw5fAU.jpg	public	toumnyc
51716b5f498e03d8bc252c48	https://irs1.4sqi.net/img/general/	/11709298_S8klPxq0yPyZw2X9-_0IZyk6TFTn9xi5SWd_6BGCeVM.jpg	public	toumnyc
5109aed2e4b01d2a5b69b022	https://irs3.4sqi.net/img/general/	/117715_0jgrjk5IsUFppNAL0NtebyMYoz1JMdzrnWAIjrLMHZw.jpg	public	schnitznthings
516ef5ece4b0d1c83382c12f	https://irs0.4sqi.net/img/general/	/117715_Gt3J4FMusC7YQjSfEup4O7bAO10z8J4gxmnd0xKnZuQ.jpg	public	veganlunchtruck
505348ffe4b0669212770040	https://irs3.4sqi.net/img/general/	/30736334_CliHgKVfq-ToaH03Q0rISwFXpeOJXQvCidaefhyLfFA.jpg	private	veganlunchtruck
4e09f3fca12d09aa881a769f	https://irs0.4sqi.net/img/general/	/NTSOFYDIBYVWGE4RYQTBBNIAQESPZ1LLW3Q4TC3TGMROSJPH.jpg	public	nautimobile
5022f267011cfeafe81dab9a	https://irs1.4sqi.net/img/general/	/7EPnN8ReXYQWoZYxzqkH9AQlOe8vFPtVP_60n65i9U4.jpg	public	nautimobile
4e70e35c52b140871b6fa35f	https://irs1.4sqi.net/img/general/	/1TB5ROKJY5NF0GAVS4YS3WZTFCUXXHTPLLBUIK4BU0XD0QA5.jpg	public	nautimobile
51b8a845498e8ebdef064e0c	https://irs0.4sqi.net/img/general/	/761163_j9ai1NfaIpK2TLN8JzXbTwyIhVzuZevNHBV5EpQ7Fh0.jpg	public	palenquefood
51435e1de4b07d53cf71fd7a	https://irs1.4sqi.net/img/general/	/4486_lUhkecOFThYlMHKai4wDp4lXXiQSPLTq3Nno5WMIz7E.jpg	public	palenquefood
4e6513efc65b2dc8a0bfff6d	https://irs2.4sqi.net/img/general/	/TUQTIKBJPOALJKHN54QRKGISWMQDDOW3WTAECOGJ4FOJTPXI.jpg	public	palenquefood
516ee142e4b04f28d58be309	https://irs0.4sqi.net/img/general/	/36812449_DjR1ynMnMpwj-KmiWPZQldmGQwJ2IEzjSwwmGevqe3U.jpg	public	sweeterynyc
5107e09be4b047c08ade6bf6	https://irs3.4sqi.net/img/general/	/760350_ZaalKVnOYdVAGoQEdugu-1Lws1LubyJBOVpZvJJD1V0.jpg	public	sweeterynyc
50188a43e4b0d35e6d8035b4	https://irs0.4sqi.net/img/general/	/b-fKh6mx2WxCybNQkr9ovk_jv4x7bwJPVFM9RF3M5T4.jpg	public	sweeterynyc
4fd79157e4b071eb33a9c810	https://irs3.4sqi.net/img/general/	/8zrcTIejD5EBiOJzSobql1_PQWr-i2KmRfgMCYmbK-M.jpg	public	eddiespizzany
501d4734e4b0af03cf473287	https://irs3.4sqi.net/img/general/	/6BUHUmEyYTTh3a2SRjSYRklUlTfQBNbFnnk_hfEojYs.jpg	public	goburger
501fe830e4b0bbddce992f90	https://irs1.4sqi.net/img/general/	/fFBOGONZt5Zr77Vc5g8adoAiBht0f-MBut7GqorVEjo.jpg	public	mexicue
4f67b0d4e4b08559c4c60149	https://irs0.4sqi.net/img/general/	/SdNxRS0joKXurf0FEv8_SRg-GeR9lGCN098_ZB2tijA.jpg	public	mexicue
50784742498ec6be8cd3f88e	https://irs2.4sqi.net/img/general/	/155927_ebZApDyXpTKTmvOQHdBTxNc2wJrsZV2QASmpYTNAVJM.jpg	public	mexicue
507efae0e4b09a52c022ec3a	https://irs0.4sqi.net/img/general/	/39213_nH-zcqfLCJqMvG0Nco0LWE4QuRuoL6unlEXJlJbTEF4.jpg	public	mexicue
526e8aee11d299d16e74b447	https://irs3.4sqi.net/img/general/	/67629862_ZPeS1alTFabw1hPqq8PCcGF1SRFynqA23OgkKg8yc00.jpg	public	lovemamak
521b83c411d29ec0512f89b3	https://irs0.4sqi.net/img/general/	/255980_1U9yRWzBKuIDLReBhmBs45qJ0mtHu7pzL_Fv4T9gTss.jpg	public	lovemamak
5203bd51498ed50247ee01dd	https://irs0.4sqi.net/img/general/	/60805368_HlIeqCMjY2I5md2mzI5crKizc9wVPUZo_sBmC6zrPEA.jpg	public	mamuthainoodle
4fa814d1e4b0d607baf8bd9d	https://irs1.4sqi.net/img/general/	/2drHnu4mqj-uzpwwcJa3MatYGD7KFuxjE472rButWlM.jpg	public	taimmobile
51cb2c41498e9851cecdd49a	https://irs2.4sqi.net/img/general/	/5728350_vuJ4ORu0wHhd-B-f4FTNfsoIhfHgtJRMJc-QEeiYmNQ.jpg	public	taimmobile
4dfa4a9840a3542ff44549df	https://irs3.4sqi.net/img/general/	/VBAJNQCBWDMP2WKDXJ5QHQ0WYF1MKHZSLUAZZJXKDBDLDUWG.jpg	public	taimmobile
519fa37b498e7adf7e8ebce3	https://irs2.4sqi.net/img/general/	/47170230_A9xVWAtkJBP-vVqUF1q2WlK8yuZTf1CVQz0JcPrHGY0.jpg	public	taimmobile
512161e0ebca7d20d6a70104	https://irs0.4sqi.net/img/general/	/4574_ZC6mf3ha1jNXmFUDgtNsN3zIf-NHyqgxA3WkUkOl4mY.jpg	public	biandangnyc
4fe65d6fe4b09198fde5842a	https://irs3.4sqi.net/img/general/	/nVmhJloDitdcBPFceYT8ajqQqgXBpB_w5GoPWse33Ks.jpg	public	valduccis
52407581498e6271e84d0d20	https://irs3.4sqi.net/img/general/	/663291_BQuSIJb2d0ODso7gvZiRLuvYbp3sg4FwHG2u0kAwsmE.jpg	public	gcnyc1
51c213db498e0748ab0dca3c	https://irs0.4sqi.net/img/general/	/53641916_5aNKp9fdHx3i_Pi15Z_X6pE3fAsTX35YBQ0nlmZGfaA.jpg	public	morristruck
521f754c498ee4d6fbe8a778	https://irs2.4sqi.net/img/general/	/22491899_EEPqf4HeJFaaFjYabKyScGZ8symjXEgMjPUEkfpJsJk.jpg	public	morristruck
51fd732d498e415eeb8b9881	https://irs3.4sqi.net/img/general/	/8839239_mAp7_MVmWbbK42Xq3-W-1zmegy-MNx8NzB0P5Brf-Pw.jpg	public	delsnyc
51ab89bb498e83fced4cefd6	https://irs1.4sqi.net/img/general/	/66074_8dLzCKmVRde0Uvtx_NSl9SKROFh0kat1IQgcAvU4J3M.jpg	public	delsnyc
5203e16e498e9e8e0a93b61a	https://irs3.4sqi.net/img/general/	/702028_Fog-6PEF03KateivIPP-hx87Qn6gi7PwnaJv-wTFv3I.jpg	public	carlssteaks
506dcb8be4b0748e0467de78	https://irs0.4sqi.net/img/general/	/157259_PdYI3Fpzhcz_LoGnBeymaSAZaZCiVVw43c4xaYQQIDY.jpg	public	mikenwillies
51117858e4b0e14064917adb	https://irs2.4sqi.net/img/general/	/263293_EvgjxXJqOivd94q0mbPR_AxkRXuzkFtjOBcOWnXuyQU.jpg	public	mikenwillies
5135022ee4b0592185aa975e	https://irs1.4sqi.net/img/general/	/2660256_0rdKd0P0tCYzLf5j7-_3b8HbPNDVCW6S0hHdJGW47Wo.jpg	public	mikenwillies
4f9c18b0e4b0b38d2f554383	https://irs3.4sqi.net/img/general/	/AQEKYbyPrQt5uMWhy4r4ODm2vSMCqPseJyMhcg55mtY.jpg	public	eddiespizzany
4da8977840a3582fb8c49316	https://irs2.4sqi.net/img/general/	/MCGIPRA0XR15JNG4O2YZJQBCRMK05UVTC4T14TOQWRTNMQFZ.jpg	public	eddiespizzany
51eae36e498e58d50e5683ba	https://irs1.4sqi.net/img/general/	/331066_SArUzXa_cz_-YMQco1rwYAfU8a99TZCHJX9a2WA3fHg.jpg	public	gcnyc1
505c9776e4b0643aba1071c7	https://irs0.4sqi.net/img/general/	/5568483_yQrtG73dbug7q06p9IASJmTFnOVgGprIZKbfHjQRcso.jpg	public	biandangnyc
5106b878e4b05ec869ad8b34	https://irs3.4sqi.net/img/general/	/814104_blIawoImaEcqf-Mg89W5A-nEHiZ5jx76BEYHVzz8dnA.jpg	public	biandangnyc
527d2c2711d2c984e85cb11b	https://irs2.4sqi.net/img/general/	/4179871_5FQ2eCC5ZeizUVRLh4tadgEAO1BnJjVQ7pSEvSDwIfQ.jpg	public	biandangnyc
5079a745e4b00277f33e4836	https://irs3.4sqi.net/img/general/	/34723233_tCoDnWhdhZj61xi_e00MNwJoK_UcfDXCQQ7Weat8pBM.jpg	public	valduccis
521e9e4511d2d8ddc5c69dbd	https://irs3.4sqi.net/img/general/	/117715_r7cpzyXCpOthqHouR5gdqIMX8k0TZ2KWHFun5wh-EYk.jpg	public	valduccis
529ccbc511d21047117cdea2	https://irs2.4sqi.net/img/general/	/68150__CRf8sW9KvXZTkcAQEc4EsnYPgqXA2trmMxy-_AzobY.jpg	public	mrniceguytruck
5161e794e4b02525dbd064d7	https://irs3.4sqi.net/img/general/	/310577_h_ww6Za5XojCZcGVq7-gZluC_YvRnT1EOXY4hwV7KJ8.jpg	public	seoulfoodnyc
5012d0d5e4b06fc7ce735a68	https://irs1.4sqi.net/img/general/	/7J2g1YLtx4ma57g4A4CerJJ66OwudjGhFI67JaNl1Qw.jpg	public	seoulfoodnyc
5267fa9611d2688bdc4587a2	https://irs0.4sqi.net/img/general/	/2136029_bvqot1MnMJ9IGYsYJkamqTiE_lL96OcfilWMxskhdU8.jpg	public	mooshugrill
5008051fe4b0974c844d5003	https://irs3.4sqi.net/img/general/	/oNy0_bsWPyVmjrduzJXpbrAPHjQS0PVbyOCfoRSD9xE.jpg	public	shortysnyc
51a4ee69abd87ea53396c979	https://irs2.4sqi.net/img/general/	/4083549_jMzaCPEId80kWmAaq2oQ9APKf4bLvdeHhy40qPeB9j8.jpg	public	shortysnyc
50045b1be4b0004dbf67c977	https://irs1.4sqi.net/img/general/	/MDweBG1fBnF_fZ1tOghWyHS9qUxGNiJeOrOpoA-fBrY.jpg	public	shortysnyc
507dacb0e4b0d8cafc9601e0	https://irs3.4sqi.net/img/general/	/2361939_S3NwwSNVZD-2tAhc3bwAvsYgk9tXwYv0T0yq9ci-ihE.jpg	public	toumnyc
501c284be4b07d0ab63e08be	https://irs1.4sqi.net/img/general/	/vQv8P8_hFNwHMmpR7k6-arr8zqYmmgoSG_aAPJuz-ws.jpg	public	itizyicecream
51e83b4a498e0a1c64e62828	https://irs1.4sqi.net/img/general/	/26624_AGoljLki5SS-GJGKaAGB75mloHKRBkJ1Qj5BQCRP1_Y.jpg	public	itizyicecream
51dd9efb498ebbc846c11c03	https://irs2.4sqi.net/img/general/	/13001992_b9dLXH02o0ZX8hyUZVtpgGW6sDyzAl23vmEl-0Hj0jY.jpg	public	itizyicecream
5012e555e4b0dd18ec16bd37	https://irs2.4sqi.net/img/general/	/mZQAOCmv5lnRZ1qOUTwDXk-MLC-X-p01AfECgfLJC2I.jpg	public	schnitznthings
51105b22e4b0a7b61fac854b	https://irs2.4sqi.net/img/general/	/117715_vKu0po70jlTD3qN9mXsdNiE6V5Od1hmYMVlUY9xSIP8.jpg	public	veganlunchtruck
526e782b11d2a15e6fb663f3	https://irs3.4sqi.net/img/general/	/8761552_XH612BVbFNOBD2jJVEMDzyawnGF45FygNA3TtdKo6UE.jpg	public	veganlunchtruck
51ccc251498e028212e9b1e3	https://irs0.4sqi.net/img/general/	/117715_ozxp6K6iPGwKCzQDARR3BgMcisplkTt0x4LEKDJdBMk.jpg	public	nautimobile
4e42f5ecaeb7f6be72c39c70	https://irs3.4sqi.net/img/general/	/JC5VO3Z50HMMMVLCCGWDQPMKF4W01VBXP1QS2LFESR55UHIX.jpg	public	fritesnmeats
51856452498e6f602088cbe1	https://irs2.4sqi.net/img/general/	/232510_pLk3QUUWFOu82-4SX-ObtA8bw2ZPf61QBOeIuL50T-o.jpg	public	morristruck
5197fe76498e1c056c96d21b	https://irs1.4sqi.net/img/general/	/117715_m462oAqyqBN12xyWCOyzYR6-1gtYrUa8BiX9r9OybE8.jpg	public	kimchitruck
4e4e92c7b0fb088f3c0f14d5	https://irs2.4sqi.net/img/general/	/HTLXSW2D30RGIEYPI0JGR22LUCS5BTXQ0LXDWAOHH4PCVHM4.jpg	public	bigdsgrub
51dd9ddc498efb9a3437e123	https://irs3.4sqi.net/img/general/	/4501533_djr9d2BEP8dg7E48xJjJTa_Yjk0Iy-MmBG6hgIQBLUs.jpg	public	bigdsgrub
50ad186ae4b0b639ca7ca234	https://irs3.4sqi.net/img/general/	/295161_qCQYG0XjW1Ji0pSDxM7fWRzxTZRbcYyZbsbPNJo12hw.jpg	public	toastmonsternyc
521649b811d2913e20a1ae87	https://irs0.4sqi.net/img/general/	/5568483_RtMp5aDM_JtBZOI1u48Jy3om4Z672obezdu1uA_UWd0.jpg	public	toastmonsternyc
518a82c9498e068718057964	https://irs1.4sqi.net/img/general/	/25979758_bGWQQ7W2SJI4v7KmU891VcYZGitov6qbSNAnIEt8HTo.jpg	public	toastmonsternyc
5176cceb498efe500552cc9e	https://irs0.4sqi.net/img/general/	/21735785_zaQs-7anNinrrQlobBV2AjNxquTXs5g8ZY0NxvoxvHo.jpg	public	steaksncrepes
523b2edc11d265bf373f82a0	https://irs0.4sqi.net/img/general/	/8853695_cjpq3trk4bFpcU1oHWwj4XxwwD9ZI169sNncUyOQoM8.jpg	public	steaksncrepes
506f12efe4b0bb9551703ca6	https://irs3.4sqi.net/img/general/	/2219480_LuuyF3peyimVfdQvb7tj9V-FHAEA0z1KmaSfMf9vKkU.jpg	public	fritesnmeats
4f832947e4b0cd6f644ef74a	https://irs2.4sqi.net/img/general/	/qCgaHGVJ9rFDkC5DFKEKLBBekoxb6PRDRfuWV7neue0.jpg	public	fritesnmeats
51a79983498e3044671cd784	https://irs0.4sqi.net/img/general/	/1441492_yfySwml4ChzJ_ni5DxTq-8n2UlecWBWjgxR-ygA6pYc.jpg	public	burgersandbites
51c1ea41498e372d91835cf9	https://irs0.4sqi.net/img/general/	/5067950_pSXIZo_RqO8Hh5AuWcomjr0p3q_pXPUMWe99W8hUGTU.jpg	public	burgersandbites
5243206b498e78230cd0770a	https://irs0.4sqi.net/img/general/	/54092198_eF4CEteD3zHjOCJzaYssyRXaQElB-GEOy2sqzBFQPm4.jpg	public	thegreenradish1
525ee647498ef229c65969fe	https://irs0.4sqi.net/img/general/	/10045965_ptbEO58Zn5wDz6kgitvMVjFScmxSkkuHNbK-AguCXSM.jpg	public	thegreenradish1
51424d6ce4b0041cb8df9856	https://irs1.4sqi.net/img/general/	/117715_oxR8_TwNSaCL-_gKDA2i2-1YoRfVVnbfT3M9Bfu4nxE.jpg	public	thepocketful
51800af8e4b07a4a57023def	https://irs3.4sqi.net/img/general/	/9548073_erhzj0ShEDKaz8S8DhlDe90fDjJEIWjilIxO4_zjdGE.jpg	public	thepocketful
511a7d64e4b0c6a64118260c	https://irs1.4sqi.net/img/general/	/793192_Dtd9vMRk-pbBJscn1cb7n29zM87iJjZy6rojapRhODk.jpg	public	thepocketful
50a696b4e4b04d062582a95e	https://irs3.4sqi.net/img/general/	/32050404_qo6ZUnU5LQMoqrAR6YoH5Qz-PdUcD1d1jCheEJy7lng.jpg	public	thepocketful
519a7e33498e6e4ea6ff66f1	https://irs2.4sqi.net/img/general/	/3354_e_1JMupbEA8VtOBVXgLHAvtJGQwcpHvY2JyFESXYSjo.jpg	public	thesteelcart
5254357b498ec4662e20c654	https://irs2.4sqi.net/img/general/	/2620660_kMXeinZ_B6lOrHRQnheIHMBr7p81ZxcUblWl0SQ1vEs.jpg	public	thesteelcart
51dc0e71498e8db4f9a8106e	https://irs0.4sqi.net/img/general/	/4456614_ZWvsB80ogvwYkoKIyVf6q5RfcDXwuKI4t0XJJhyLQ_I.jpg	public	thesteelcart
51c8a3c5498e797153ec5629	https://irs1.4sqi.net/img/general/	/46314126_95x6AErCZEGSi1zGZrFCY-EzgsIMyOhgO4G59l-u_Xg.jpg	public	funbunsnyc
5212ec18498e9494b634a94c	https://irs0.4sqi.net/img/general/	/814104_tUkLgiQ8zcYxovra9R8PIx7FckFhBjzNVHmirteXd58.jpg	public	funbunsnyc
4ffda271e4b03bbc7f8fd13a	https://irs1.4sqi.net/img/general/	/6Dtx8fj7IXT6M3O6ZV3rXryb6zKTAqPchjeOM2BJJAs.jpg	public	funbunsnyc
505204d6e4b02dee62bd961a	https://irs1.4sqi.net/img/general/	/dcOYoRoNNeCLMxvoyAN-o9gJObcw5FljMqYpS9cps84.jpg	public	funbunsnyc
5258d3ef11d26d03cc0563a5	https://irs2.4sqi.net/img/general/	/117715_GQ_O1nyBbVlKTaYpRlprc8ZdIEAEftbU4_9hDGjvxsU.jpg	public	brooklynpopcorn
4f753600e4b07eec20023ddb	https://irs2.4sqi.net/img/general/	/zUb4OswXiQLnF_k2xnx7AdupnEIl1nuGyIuFcmFWf8Q.jpg	public	thetreatstruck
50ce2696e4b0881a7ef3ee67	https://irs2.4sqi.net/img/general/	/263293_lcA30Y_JnQGKaaHhRqFUio2HQ8UQkphCWP9yhW4CE3g.jpg	public	domotaco
51378e9ce4b071feb46ef7cc	https://irs3.4sqi.net/img/general/	/18792384_RSm8zhe_6kUOxy91taByfRjTDSLp7stH7PI41aJHOrU.jpg	public	bobjotruck
5249b50c11d2d415e3c6b017	https://irs3.4sqi.net/img/general/	/769710_HOnpTjl0b6qd4-yoPpg9lXZGBy-ZKikqzLlFWw2sQfs.jpg	public	bobjotruck
5199097e498ea36447e54093	https://irs1.4sqi.net/img/general/	/40899881_hbjUdavpBfT-sLaBhv3pbZydT1tgs9v-Maw12j9I3Xs.jpg	public	carpedonutnyc
50e71f82e4b07154c72fdc22	https://irs2.4sqi.net/img/general/	/275165_az4RUZ2U7-4cfdnQA1FlMrDLaxwCMriWtlhS_pddjEc.jpg	public	mexicoblvd
513101fce4b006d9c4991bdc	https://irs2.4sqi.net/img/general/	/17248619_XfpmI8dNgmoeHE3BXjV8bL2yuuMTqxU3FqDr4BqX7Ks.jpg	public	bigdsgrub
4fa2d04de4b0489ba3d7936d	https://irs2.4sqi.net/img/general/	/hsPbM0G5l3AsUaI3x6r_VkiSYo4pYlWTKK2S9zqh_KE.jpg	public	bigdsgrub
4fb6bb41e4b066430032e4ca	https://irs1.4sqi.net/img/general/	/HHZWTU3POi_yJE4GU0zI_NjZNerm5y3MjjxddcV5ZMs.jpg	public	rickshawtruck
4f8dc377e4b0ca2accf75652	https://irs0.4sqi.net/img/general/	/EKcue5yGEyaPnBymSd_HtBxWEZl4grYSOXMhw-gqpTs.jpg	public	rickshawtruck
513b9b7de4b04f7024bc158a	https://irs3.4sqi.net/img/general/	/45519738_eDUGOpHYwiR5C3VUps1gQ1YDIq0Di3WMfuirGs2EVBk.jpg	public	rickshawtruck
5220dc78498ebd10d150f736	https://irs0.4sqi.net/img/general/	/29917892_nMZHXkfxBukc2QfFqtDBTZSJ1xpMkoO7VGBJmGKkwhY.jpg	public	brooklynpopcorn
4fbfe026e4b04422a08a40f6	https://irs3.4sqi.net/img/general/	/Han8Z4R-SQ615pLoN2lRdPfKEFa6UW2yudSOxXmJtts.jpg	public	thetreatstruck
51461b9de4b0bb73a6821e97	https://irs1.4sqi.net/img/general/	/1102787_UDt7OJpexNs8VPrehVDsp9EtfUJnMhKzJ2tTXuof06M.jpg	public	thetreatstruck
4fbfebe9e4b0a3bda0340383	https://irs0.4sqi.net/img/general/	/Brw9_z178IK92xMEXLCSSZrP0-99GXjutCp7dHCi5CQ.jpg	public	thetreatstruck
5180207390e7374e46b6c165	https://irs3.4sqi.net/img/general/	/49563206_uKsSD-Cd2jjy6FMyR9U_--7DdUBJ7ZUxtdlushxyIAg.jpg	public	freshandhearty
50ce269de4b07c1547ebfb2c	https://irs3.4sqi.net/img/general/	/263293_qjcLaRmf5itOMyRiq4AyYZuY2UVjVJk04lO3FTA2CMY.jpg	public	domotaco
4ec59ebacc21b428e0de466c	https://irs2.4sqi.net/img/general/	/4AMXSGP5YGTUHEL3TFKTS5ROVIX4HUTU4MU5ZW1OX5E3URDD.jpg	public	domotaco
520912ad11d2f941183dea9f	https://irs3.4sqi.net/img/general/	/13285510_v7K0PTg4FzGI822Jbc9A8K5mUHIxwJPBZB_0xNeEauE.jpg	public	domotaco
51dc5fec498e4e9be748eac4	https://irs2.4sqi.net/img/general/	/22801_gX0atVT6Jt_H6FPXuYAqHD4VzO5jAmS4SVid_ZLkk5U.jpg	public	disosnyc
525c259b498ea7548cf31f8e	https://irs3.4sqi.net/img/general/	/769710_ZxOOtsSbFVklHIRhXVmTO7ops0Pm0EybRDTgUvGHrSY.jpg	public	disosnyc
5197cb68498e8d409a89ec1b	https://irs1.4sqi.net/img/general/	/1847096_oRB5R_owQW40gVWlJhNNsh9_0bEq2D8Rt3Zod9HUbUg.jpg	public	disosnyc
51d31ab97dd28a271207af20	https://irs1.4sqi.net/img/general/	/59958053_5CogfmHgRpBtjkPzVkAgAjK7q9ac0bo8Z1TPwxPIFAw.jpg	public	grillonwheelsny
4e3da652d4c058f9dc087a6c	https://irs2.4sqi.net/img/general/	/QEOIS2W35WLTHYK00QC04LKKX4X1SYW3DDI45X30HSKTJENQ.jpg	public	kimchitruck
501975c5e4b092f6a51ef338	https://irs2.4sqi.net/img/general/	/bI7RrGcK_moyn-kJICa1OCciBVuYYykwCMGlea6mcxg.jpg	public	kimchitruck
4e00e61aa12db1129557e99c	https://irs0.4sqi.net/img/general/	/WSUNYIB0YFVRCTXB13UCRCTANZUG0DO0X2FWCUYYILU4TCGB.jpg	public	kimchitruck
5140cc96e4b0ef29f4802508	https://irs1.4sqi.net/img/general/	/4886503_z36ZXtYKGVIHcNLCR18ZdUWtpStRrbf33rInxsr2p1Q.jpg	public	mexicoblvd
5245c79c498e057f7d5ff65d	https://irs0.4sqi.net/img/general/	/117715_CEghvDHaxkALy5RxQCAVW-kyM0TAZo2-fIT4e6veJeo.jpg	public	neaexpress
51645882e4b0bcb0cb0c7ef3	https://irs2.4sqi.net/img/general/	/7511393_dEJJLGO8ljFPMA_kFidoz1wpWZ-k6mHpqYnuRwoBpRg.jpg	public	philssteaks
527e77d111d2e66fa6a871b3	https://irs3.4sqi.net/img/general/	/649454_HIWthX8nL3SZAOwyMlKj9Y7ju9GCiN4OEV-wZR6IKC0.jpg	public	philssteaks
507071bfe4b06e882e74b445	https://irs1.4sqi.net/img/general/	/1112203_qnT5k-31-4cRKDz00cUpp7Ia7HG3YTjhsC9Udo90RDI.jpg	public	philssteaks
5249b1c511d23e54343ae083	https://irs0.4sqi.net/img/general/	/769710_HUiZ7dJrNbdnPYV-DTQRr1z0zgoxFx9KMC_Y-OQ6O2o.jpg	public	bobjotruck
4fe20639e4b05dcdf7f5737c	https://irs2.4sqi.net/img/general/	/l9UdGGevddtOhDk6scQjcy1-TbVBX-wf8Gf56jBIRIg.jpg	public	bobjotruck
525de1d7498ef4b27ada0847	https://irs1.4sqi.net/img/general/	/31827631_CApIgPWaXupe3toLi7iJLb6NxIyn2IDTOjAG0qw-PIk.jpg	public	mexicoblvd
512bbfebe4b0b8faa466c796	https://irs0.4sqi.net/img/general/	/1425622_4wp7wCuj7Ci1dl_FVH9syKmrJwQavMhL9uqww1b0m1o.jpg	public	philssteaks
51dc5a9e498ebf7ad40223ec	https://irs3.4sqi.net/img/general/	/1328035_Ak3fMs2e36r7NvIE_gIDK5XZ9CwrW1DEJa3g1oobp5E.jpg	public	wingnitnyc
506dc9b9e4b0c21f078c3bb3	https://irs3.4sqi.net/img/general/	/22983_XN2GbKo3a5YsNY_ZpiBcjUHTD2if3TWS8r586Uq4cEk.jpg	public	blend_express
519babe8498e355d9d35fca0	https://irs2.4sqi.net/img/general/	/65817_6p9jSMaQMqP9QGn3KOIyuDOG15jaLxIPvsdrpZGWdj8.jpg	public	blend_express
5033cee6e4b03e64bc749ee7	https://irs0.4sqi.net/img/general/	/tIyy6IAKcw2SSiX5JSPBCURstZZisntK_46plgrfdJ0.jpg	public	blend_express
521cdb8011d2f79883b5be62	https://irs1.4sqi.net/img/general/	/36501880_zzNkJUOscINjy2aiwKSZEwjfQYJPjqmAsa6zS0dakp8.jpg	public	nuchasnyc
5298ff7011d22a38856168e2	https://irs1.4sqi.net/img/general/	/191726_GHXLJD8lsdPciKdqJErekl1SKPjw5k4N2YuNJC6JRTU.jpg	public	nuchasnyc
51118d62e4b063f95c18d16d	https://irs1.4sqi.net/img/general/	/191726_pTyD4DsW_jGt7E3QJJdH1QB-mHP1ZYggLzXtnZ7j3Oc.jpg	public	nuchasnyc
5086e523e4b02ca59cae7bd4	https://irs3.4sqi.net/img/general/	/2361939_1JvatS0wOUdQQIaTmd4Vmk8bgr7aFYOR7LaMkRio0X8.jpg	public	mausamnyc
513f646ce4b0b1892aaae1bc	https://irs2.4sqi.net/img/general/	/13285510_LmdJLKoCS9fSwm3wy96lcieTczjsLuxAEUnU3FlZDlo.jpg	public	mausamnyc
51194bbae4b0cd237850b223	https://irs1.4sqi.net/img/general/	/793192_FQUO1SFGyLkg5NRz6VUYl3_zmFgfy0Mh8gL1unO8ijM.jpg	public	mausamnyc
520538a611d2b476431ac7f9	https://irs1.4sqi.net/img/general/	/117715_GMdoseCn4baUtTX9kN6_PAAfHaGIlUpjxzAitpqLAOY.jpg	public	chefsamirtruck
5294e76b11d2879d5217bd00	https://irs0.4sqi.net/img/general/	/47558447_v1SwJZbLSZ2etlJXOF9qw4H3vErpdTiVIqXxULSVTSU.jpg	public	chefsamirtruck
5189442c498e765ce62d5924	https://irs3.4sqi.net/img/general/	/2432527_5nUa0fTfy4rzjXpiIUIlkguBa2kdqFSZIG-PLvkKu2Y.jpg	public	chefsamirtruck
4fd0d80de4b062589043211f	https://irs2.4sqi.net/img/general/	/hZjMDK5KKgxjMhmOGBtaRjx_ga0SWHwppqfLfqw20Tg.jpg	public	chefsamirtruck
50f99bcee4b08ca132377f78	https://irs3.4sqi.net/img/general/	/4611139_CEH3eveI6uxlRVQLet5Fpa_sNfJwAzfheMTYSBplO5Q.jpg	public	thecrepestruck
4fd0f054e4b0757383b97c0f	https://irs0.4sqi.net/img/general/	/MbR1inb3VKXu0PQMsCkHkHGftYq0E8CDbYG3BLRRGaE.jpg	public	thecrepestruck
50883301e4b0904987088a20	https://irs3.4sqi.net/img/general/	/2361939_J2zcgauqqGFC_PZPyvkfEDoSufdDe5qE7gi_NkS1P1U.jpg	public	mactruckny
519bb23b498e208a0b81b7fa	https://irs1.4sqi.net/img/general/	/9285455_LZiJ4FLH7NOWjNUsXO9jxDRFAgLygBSB8SmSIW0z9kM.jpg	public	mactruckny
5165924de4b093be3bc5cd57	https://irs2.4sqi.net/img/general/	/2159706_uFl3RYgA1z4EiDNp8PtjjG2HHWhTiiXDLNzJtFWPHS8.jpg	public	mactruckny
5151c82de4b024888079c5ea	https://irs0.4sqi.net/img/general/	/5003144_g8kbTzyfr6gL9vIRpMBbXz4TqBUk5EgkqIPlBP9DtsA.jpg	public	mactruckny
51f4589a498e97316d307dab	https://irs1.4sqi.net/img/general/	/186827_ilvLMlb3AFqgXUQJ43S7IjsLNPxYP3Pw5LEjrqhp6wI.jpg	public	chipsykingny
514e42c7e4b0ec8b7e400875	https://irs3.4sqi.net/img/general/	/48992751_ibL8tx_7JPvV3aQmnEevrdibtLP0jWytaChkCdRuhG8.jpg	public	crafflesnyc
514e42a8e4b0d91e975b3db9	https://irs1.4sqi.net/img/general/	/48992751_womoOVd5bv-2KopmWjWEHA_WsyoWQITjAyXBuM4Ciz8.jpg	public	crafflesnyc
51f15b4d498ee58fec420a7c	https://irs3.4sqi.net/img/general/	/13285510_Q-SBXKFpfroSwQ-QJdezzrh1KaHfHAmLyicy8d5S1jU.jpg	public	parissandwich
5243126c498ea77b19b3a444	https://irs0.4sqi.net/img/general/	/65506790_31Qpx9E-ZjuNve-izmDY6vVxUCMrhgGsnOLn4-fusp4.jpg	public	parissandwich
51b22a0a498ec00d1c45726c	https://irs1.4sqi.net/img/general/	/390807_y2oeK6xR54wk9b1Sfm82Ek09Auv2lNkRTpJOzos3xjU.jpg	public	parissandwich
50e719c2e4b0e263423e547e	https://irs3.4sqi.net/img/general/	/15471_4uN0tddGW5orNGh02xhxbiAOGUpAAy3rIWEotoRgB_M.jpg	public	tacobite
5239ddce11d2ab4765d5cc7f	https://irs3.4sqi.net/img/general/	/5568483_alwOH7sfGU8-pKfLmurfe9rt3pk2G6p90KwFyC6hq1A.jpg	public	sweetchilinyc
5208f543498eaeeaaad3ce52	https://irs2.4sqi.net/img/general/	/15629_P_UAUr_S-OO0R12wNp8LDPwr-ZbfPiWeG0Q0rrjW6Ww.jpg	public	sweetchilinyc
527e823311d2db75dd831ee0	https://irs0.4sqi.net/img/general/	/22419482_1rrrm4nhOKXQsXN25ApmVsGDw4t2J3GyjhfeQPEbClU.jpg	public	waffletruck
4fd400ffe4b02d3b87199713	https://irs3.4sqi.net/img/general/	/hxqXK1dS5WiSz4AUwkzvl8s8oy4Y26e1px0MLW4ICuw.jpg	private	waffletruck
5280c18811d2e4df572063db	https://irs0.4sqi.net/img/general/	/5354893_5EtQmcwzMnTRFz9qbxjkt9FguCAC4xfW5xwUCyYIrbQ.jpg	public	waffletruck
51f2be1f498e71235db5b61b	https://irs3.4sqi.net/img/general/	/117715_mGfGU0UGjUMhgqgwrDPf2f44NZtfMrobqJMF8ahsrjY.jpg	public	sweetchilinyc
522245cd498e08037d275e1a	https://irs0.4sqi.net/img/general/	/1290097_g0wekB0Kkci5H6u618gI7WxvHlKAan1kUpaRIuTl2IM.jpg	private	waffletruck
\.


--
-- Data for Name: trucks; Type: TABLE DATA; Schema: public; Owner: pepp
--

COPY trucks (id, name, twitname, weburl, tweet, street, location, retweeted, region, regex, lasttweet, lastupdate, type, about, foursquare, matcher) FROM stdin;
schnitzelcart	Schnitzel & Things Cart	schnitznthings	http://schnitzelandthings.com	Good morning Greenwich st & Park place. The schnitzcart is coming your way:) 11:00-2pm you can get your schnitz on. Hope to see you!	none	 Greenwich st & Park 	f	none	\N	1389885980	1389884745	German	\N	4a6640b3f964a5204cc81fe3	schnitzcart
getstuffed	Momos & Buns	getstuffednow	http://www.chinesemirch.com	snowdayNYC we will freeze our buns 2 bring u the buns u love @BKBazaar ! Its a date at 7pm!	none	 2 bring u the buns u love @BKBazaar ! Its a date at 7	f	none	\N	1389802718	1388785130	Chinese Fusion		4fa016cbe4b05d0fc11262c5	\N
palenque	Palenque	palenquefood	http://www.palenquehomemadecolombianfood.com	Here we are WFC, with soup, rice & beans and Arepas! North end & Vesey st! Come Join Us, For A Delightful Lunch Paisa...	WFC	WFC	f	none	\N	1389887323	1389887323	Colombian Fusion		4e84f424dab45bbd2617dc62	\N
sweetery	Sweetery	sweeterynyc	http://sweeterynyc.com	RT @TheBeils: I see you on @GMA @SweeteryNYC ... I forgive you for not being at Hudson/King today!	none	 Hudson / King 	t	none	\N	1389819365	1389793215	Sweets		4a28d919f964a52056951fe3	\N
mikenwillie	Mike n Willie's	mikenwillies	http://www.mikenwillies.com	Our favorite spot & customers 56th Street & Broadway comegetsome tacos sliders burittos @randomfoodtruck	56	 56th Street & Broad	f	up	\N	1389899246	1389884602	TexMex		4f205f0ee4b0294b35a1178b	\N
eddiespizza	Eddie's Pizza	eddiespizzany	http://www.eddiespizzany.com/	Lunch is being served on W46st. & 6th Ave. Call ahead your order 917-439-7522. Looking forward to serving you.	46	W46st  & 6th Ave  	f	up	\N	1389887061	1389799770	Pizza		4c0cf412b4c6d13ae4850c30	\N
goburger	GO Burger	goburger	http://www.goburger.com	We're on 88th and Broadway for dinner tonight!	88	 88th and Broad	f	up	\N	1389710384	1389390276	American		4c06b3eccf8c76b0a4eb3a65	\N
mexicue	Mexicue	mexicue	http://mexicueny.com	Water and broad!	Water and broad	Water and broad	f	none	\N	1389896059	1389890670	Mexican		4c51a6a71c67ef3ba6b61ab9	\N
mamak	Mamak	lovemamak	http://www.lovemamak.com/	We will be @FlatironNY 21st and 5th ave and @Fidi 7 Hanover Sq 11.45am - 2.30pm. Rendang malaysianfood Thaifood	21	 21st and 5th ave and @	f	mid	\N	1389622922	1386691775	Asian		51c4cffa498ec876f564a0b4	\N
mamuthai	Mamu Thai Noodle	mamuthainoodle	https://www.facebook.com/MamuThaiNoodle	FiDi/WFC North End&Vesey! Thru the fog you'll find sunshine. Also,there are noodles! Join us for lunch! 11-3 @BrookfieldPLNY @downtownlunch	WFC	WFC	f	none	\N	1389796683	1389796683	Thai		5126a10ae4b0af674c85f353	\N
gorilla1	Gorilla Cheese 1	gcnyc1	http://www.gorillacheesenyc.com/	G2 starrettlehigh 26th 11/2\nG1 36th 6/Broadway\n starrett601\nComeToTheCheeseYo	36	 36th 6 / Broad	f	up	g1(.*?)(\\n|g2)	1389892885	1389802112	American		4dc2d3e352b1c1fb37f1e945	\N
taim	Taim Mobile	taimmobile	http://www.taimmobile.com/	Butternut Squash is the soup du...how do you say last soup of the season? Get yours now on Varick/Vandam	Varick	 Varick / Vandam	f	none	\N	1387809097	1387556931	Mediterranean		4cf2c5321d18a143951b5cec	\N
dels	Del's	delsnyc	http://instagram.com/delsnyc	RT @DUMBOFoodTrucks: You may have seen the @delsnyc truck around DUMBO this summer - help them raise $ for another one on @kickstarter! htt...	DUMBO	Dumbo	t	bkl	\N	1384186749	1383928941	Sweets		519bb56b498ed2dfa950ace2	\N
carls	Carl's Steaks	carlssteaks	http://carlssteaks.com/home/	Back in FiDi 7 Hanover Square& water st 11-3 come by create your perfect cheesesteak and dont forget our BEER BATTERED ONION RINGS GOT WHIZ?	Hanover	 7 Hanover Square& water st   	f	none	\N	1389887088	1389887088	American		51a78330498e3fc1f22d771e	\N
biandang	Bian Dang	biandangnyc	http://www.biandangnyc.com/	53rf and PArk!	53	53rd street between Park and Lexington avenue	f	up	\N	1389889951	1389889951	Taiwanese		4d712874722ef04d04160d9c	\N
valduccis	Valduccis	valduccis	http://valduccis.com	50th&6th delicious rolls today as well as the bestpizza! http://t.co/fsZzUT57YI	50	50th & 6th  	f	up	\N	1389900291	1389900291	Pizza		4df7e1aad4c02ad734170b21	\N
gorilla2	Gorilla Cheese 2	gcnyc1	http://t.co/4ZDqfwSH5f	G1 getting repairs\nG2 50/6	50	 50 / 6	f	up	g2(.*?)(\\n|$|#)	1389892885	1389892885	American		4dc2d3e352b1c1fb37f1e945	\N
lobstertruck	Red Hook Lobster	lobstertruckny	http://redhooklobster.com/	bigred is rockin out on the corner of 55th & Bway. lobstahforlunch uknowuwantit We now accept CC's!	55	 55th & Bway  	f	up	\N	1389884136	1389884136	\N		4dc597c57d8b14fb462ed076	\N
korilla	Korilla BBQ	korillabbq	http://korillabbq.com	Open at 47th & Park!	47	 47th & Park	f	up	\N	1389900592	1389889503	Korean Fusion		4cc701aa01fb236ab070baba	\N
milktruck	Milk Truck	milktrucknyc	http://www.milktrucknyc.com	RT @DispatchNY: . @BrookfieldPLNY NORTH Lot | Thursday, 1/16, 11a-3pm | North End Ave. & Vesey St. | @FritesnMeats @PalenqueFood @MilkTruck...	brookfieldplny	brookfieldplny	t	none	\N	1389898321	1389885159	American		4e823c0229c2dbb2b7043972	\N
polish	Old Traditional Polish Cuisine	polishcuisine	https://www.facebook.com/pages/Old-Traditional-Polish-Cuisine/315496671902708	ready to serve an awesome lunch on 55th and broadway! Smokin' grilled kielbasa, potato & cheese, meat, kraut &... http://t.co/zfmFR2g02g	55	 55th and broad	f	up	\N	1389888729	1389888591	Polish		51435df4e4b0823a398ebc8a	\N
mrnice	Mr Nice Guy	mrniceguytruck	http://mrniceguynyc.com	Back at it for lunch on a Friday. 50th n 6th with some yummy sliders n fries. Slidernation report	50	 50th n 6th 	f	up	\N	1389739197	1389371412	American		520bbbb211d26afae232ec59	\N
seoul	Seoul Food	seoulfoodnyc	http://www.seoulfoodnyc.com	Is it lunch time yet??\nWe are already on 46th between 5th and 6th!!! See ya real soon!	46	 46th between 5th and 6th	f	up	\N	1389878641	1389878641	Asian		4e74afad88775d593d9a7eb5	\N
mooshu	Moo Shu	mooshugrill	http://www.mooshugrill.com	whoopsie! 45th and 6th ave! sorry guys	45	 45th and 6th ave	f	up	\N	1389899470	1389899470	Chinese	Moo Shu grill is a slight twist on typical Chinese <a href="https://en.wikipedia.org/wiki/Moo_shu" target="_blank">moo shu</a> The three Moo Shus option is enough for lunch and you can pick and choose a different protein for each. In my opinion the chicken is the best but it is dark meat. </p><p>It's easy to order as there is one window for ordering and for picking up when your name is called.	52090e45498e5500a6bd41fb	\N
shortys	Shortys	shortysnyc	http://www.shortysnyc.com	Dumbo.  Jay & Water.	Jay & Water	 Jay & Water 	f	bkl	\N	1389801579	1389801579	American		4faea2cce4b08a88c5dc5d05	\N
toum	Toum NYC	toumnyc	https://www.facebook.com/ToumNYC	@dumbolot Aww gee thanks! We're blushing 	dumbo	dumbolot	f	bkl	\N	1389892148	1389887284	Lebanese		500eedb0e4b062ee00577957	\N
itizy	Itizy Ice Cream	itizyicecream	http://www.itizy.com/	Likely our last three hours at Columbia this year! Come grab a scoop of your favorite flavor before it runs out!	none	Columbia	f	none	\N	1382307419	1382122482	Sweets		4fcbdcaae4b00a0e855124dd	\N
steaksncrepes	Steaks N Crepes	steaksncrepes	http://steaksncrepes.com	50 st bet 6 & 7 ave for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	50	50 st bet 6 & 7 ave for lu	f	up	\N	1374766188	1374766188	American		50f44167e4b0af5bf46321ce	\N
funbuns	Fun Buns	funbunsnyc	http://j24f.com/funbuns/	RT @FoodtoEat: Today's answer to 12DaysofFoodTrucks is @funbunsnyc ! Thx to all those who played and tune in Monday 12/23 for the LAST day!	12	 12 / 23 	t	mid	\N	1387580633	1387576969	Asian		4f8d9663e4b021137aa2bdde	\N
schnitzel	Schnitzel & Things	schnitznthings	http://schnitzelandthings.com	The schnitztruck will be on 51st street b/w park and madison from 11:30-2pm. Perfect schnitz weather. Preorder 347-772-7341. See ya:)	51	 51st street b / w park and mad	f	up	schnitztruck will be on .*	1389885980	1389885980	German		4a6640b3f964a5204cc81fe3	schnitztruck
rickshaw	Rickshaw Truck	rickshawtruck	http://www.rickshawdumplings.com/	Starrett! You are in luck! Danny is on his way to make your dumpling day! 26+11av	26	 26 + 11av	f	mid	\N	1386710979	1384441694	Asian		43fc8419f964a520ed2f1fe3	\N
greenradish	The Green Radish	thegreenradish1	http://www.thegreenradish.com/	Get Some Radish Today! 52&6, tasty vegan organic @ubs @CreditAgricole @RollingStone @AtlanticRecords @cbs @nypost @nytimes @Johnny_Marr	52	 52 & 6  	f	up	\N	1389889637	1389877374	Vegan		5229feab11d2edde794d385c	\N
pocketful	The Pocketful	thepocketful	http://thepocketful.com/	Located on 49th between 6th and 7th. Online at http://t.co/6h7IrKccpj	49	 49th between 6th and 7th  	f	up	\N	1389887668	1389887668	Mediterranean		4db8bcd790a0e3f61d601888	\N
bigds	Big D's	bigdsgrub	http://bigdsgrub.com/	Lunch is ready! 50th Street 6th and 7th Avenue, now till' 2:30pm. Get those preorders in by calling 646-543-BIGD	50	 50th Street 6th and 7th Aven	f	up	\N	1389889098	1389889098	Korean Fusion		4c968b907605199c2eaec2a3	\N
cinnamonsnail	The Cinnamon Snail	veganlunchtruck	http://www.cinnamonsnail.com/	At its hight the line was 1 1/2 blocks long. Thanks for the love NYC!\n\nMT @kmexvx: So many people queuing in the rain http://t.co/019Fhw8WPv	none	 1 1 / 2 	f	none	\N	1389872182	1387826665	Vegan		4c263af6a852c9287537e66c	\N
lukeslobster	Luke's Lobster	nautimobile	http://lukeslobster.com/	We are grateful that Creed are no longer a band/thing that exists. Join us in thanks at 23rd and park.	23	 23rd and park 	f	mid	\N	1389889193	1389887814	Seafood		4dc81239b0fb5556cd2f3023	\N
miamifood	Miami Food Machine	miamimachinenyc	http://www.miamifoodmachinenyc.com/	RT @YouGotSmoked: Check us out today @dumbolot @DUMBOFoodTrucks from 11:00 to 3:00! slowsmokedpork applewoodsmokedchicken	dumbo	dumbolot	t	bkl	\N	1389793800	1389793800	Mexican		514b53aee4b00c3e98ec25e9	\N
steelcart	The Steel Cart	thesteelcart	http://www.thesteelcart.com/	56th & Broadway work for you? New soup is Sweet Potato Sage. It's quite tasty.	56	56th & Broad	f	up	\N	1389887590	1389882988	French		511d3abee4b0e188895f3697	\N
toastmonster	Toast Monster	toastmonsternyc	http://www.toastmonsternyc.com/	Hello Rice bowl fans. Have your beef or chicken teriyaki rice bowl with a miso soup for only $8!! stopplaying notplaying forreal 50th/6th	50	 50th / 6th	f	up	\N	1388514079	1386864511	American		50ad1829e4b087613d696bc4	\N
frites	Frites 'N Meats	fritesnmeats	http://www.fritesnmeats.com/	Hello wfc peeps. Lunch 2day @ wfc food truck lot on north end & vesey st. Burger of the week THE SMITHLAND preorder 9172929226	wfc	wfc	f	none	\N	1389885930	1389885930	American	This is a good burger but this truck is interesting because of the many toppings they carry and their burger of the week. 	4ae9d217f964a520bcb621e3	\N
morris	Morris Grilled Cheese	morristruck	http://morrisgrilledcheese.com/	Open at 29th & Park! lunchtime cheesetime	29	 29th & Park	f	mid	\N	1389886983	1389718447	American		4e0e0b3caeb7a5b33ee5dac1	\N
treats	The Treats Truck	thetreatstruck	http://www.treatstruck.com	Headed to the UWS this afternoon! First Columbus & 91st around 2:30-3:30, then Bway (86 & 87th) 4-7pm!!!	91	 Columbus & 91st 	f	up	\N	1389880709	1389880709	Sweets		49e65021f964a52035641fe3	\N
burgersn	Trusty Burgers & Bites	burgersandbites	http://www.burgersandbites.com/	Ready to rock in dumbo! Burger Thursday all day on water and jay! @Carrot @_TommyDee_ @Bklyneats @Brokelyn @DUMBOFoodTrucks @EaterWire yum	water and jay	 water and jay	f	bkl	\N	1385050796	1383232098	American		5170143a498e802b42628e48	\N
freshhearty	Fresh and Hearty	freshandhearty	http://freshandheartynyc.com/	Good Morning nYc! We are serving lunch on 46st btw 5th ave & 6th ave.Free Delivery 4 everyone!Order now 3474402467 or http://t.co/yJtXVzeOH7	46	 46st btw 5th ave & 6th 	f	up	\N	1389800694	1389800694	Soup/Salad/Sandwich		51801f7a90e7374e46b6239f	\N
domo	Domo Taco	domotaco	http://www.domotaco.com	We are back!! 50th and 6th today, come by for some taco fix! :)	50	 50th and 6th   	f	up	\N	1389889012	1389610783	Asian Fusion		4ed90a2e77c8274efb746d83	\N
disos	DiSO's	disosnyc	http://www.disosnyc.com/	Come meet us on 47th bet Park and Lexington ave for lunch.\n\nCall in your order at: 917-756-4145	47	 47th bet Park and Lex	f	up	\N	1389880164	1389880164	Italian Sandwiches	These might be typical italian sandwiches but the ingredients are high quality. You need to get there early because the line can get long and they will run out of some breads. I believe the focaccia half is a normal portion for lunch while their half and hero sizes are pretty big.	519523d6498eeaa6200aad03	\N
grillwheels	Grill On Wheels	grillonwheelsny	#	Grill on Wheels at 36 st off Broadway! Join us for some mouth-watering kosher grill!!! Open from 11:00-3:00	36	 36 st off Broad	f	up	\N	1389882029	1389881947	Kosher		51b0bf31498e9b68db75612c	\N
kimchitaco	Kimchi Taco	kimchitruck	http://kimchitacotruck.com/	Whoa, fog city. Headed to 55th St. bet. 6th & 7th Ave. 11:30am - 2:30pm	55	 55th St  bet  6th & 7th Ave  11	f	up	\N	1389883399	1389796101	Korean Fusion		4d6ee122b45b59417c6a6778	\N
phils0	Phil's Steaks Big Jawn	philssteaks	http://www.philssteaks.com/	It's Phil's Phriday! \nOG Jawn: 51st n Park\nBig Jawn: 41st btw 6th n 7th\nGet Your Phil!	41	 41st btw 6th n 7th 	f	up	big( jawn)?( in|:| ?-| is on| on) (.*?)(\\n|$|!|\\.)	1389887366	1387554094	American		4f15b382e4b0725660ea9f31	\N
brooklynpopcorn	Brooklyn Popcorn	brooklynpopcorn	http://brooklynpopcorn.com/	Hey NYC our Brooklyn Popcorn Truck is parked on East 70th Street & York Avenue today.We are cooking all your favorite flavors today!!	70	 70th Street & York Aven	f	up	\N	1389894333	1389893197	Popcorn!		514a0737e4b09c3e77279d83	\N
carpedonut	Carpe Donut	carpedonutnyc	http://carpedonutnyc.com/	Now open at 55th and Broadway!	55	 55th and Broad	f	up	\N	1389878096	1389877941	Sweets	They only server one kind of donut here, the apple cider, but it's a pretty good one. They are fresh and still hot when you get them. They have donut ice cream sandwiches but you should know the entire thing is in the freezer so you will get a frozen donut as well.	5169892c498e0522481eea97	\N
mexicoblvd	Mexico Blvd.	mexicoblvd	http://mexicoblvd.com	We're here, Midtown. You better come see us on 46th St btwn 6th&7th Aves... Or else! (Or else you don't get any crispy cheese that's what)	46	 46th St btwn 6th & 7th 	f	up	\N	1389888407	1389715771	Mexican		4f4e55aee4b04c96fba5b149	\N
wafelKastaar	Wafels & Dinges Kastaar	waffletruck	http://www.wafelsanddinges.com/	Momma at 46th & 6th Ave til 4:31pm Kastaar is at Sterrit Lehigh at 26th and 11th Ave til 4:29pm \nKotmadam is at 23rd and broadway til 7pm	26	 26th and 11th Ave 	f	mid	kastaar( truck)? (.*?)(all day|till?|until|\\n)	1389898973	1389888223	Belgian		4a416369f964a52036a51fe3	\N
neapolitan	Neapolitan Express	neaexpress	http://neapolitanexpress.com/	We're still down at 52nd and Park! Ready for lunch?	52	 52nd and Park	f	up	\N	1389895519	1389895519	Pizza		51c8864c498e0ac96c14433e	\N
phils1	Phil's Steaks Lil Jawn	philssteaks	http://www.philssteaks.com	2 jawns out today!\\n\\nBig Jawn - 41st btw 6th n B'Way til 2. \\n\\nLil Jawn - North End Ave n Vesey St til 2.	Vesey	 North End Ave n Vesey St 	f	none	lil jawn( in|:| -) (.*?)(\\n|$)	1389887366	1383670328	American		4f15b382e4b0725660ea9f31	\N
wingit	Wing'n It	wingnitnyc	http://www.wingnitnyc.com/	Out here on 23rd and 5th come and grab some wings for lunch today. We will be open from 10am to 3pm. See you guys at lunch.	23	 23rd and 5th 	f	mid	\N	1388012013	1387549355	American		519ffd2b498ededbeef3c073	\N
blend	Blend	blend_express	http://blen02.wix.com/blendnyc	We will not be parking on HUDSON and KING anymore ....   Hopefully only at least for this year	none	 parking on HUDSON and KING an	f	none	\N	1383317024	1383316855	Latin Fusion		4fa94528e4b0f8fbf13317e6	\N
nuchas	Nuchas	nuchasnyc	http://www.nuchas.com	what's the secret to a good healthy lunch? meet me at 56th & 6th, and i'll tell you!  empanadas handheldfoods foodtruck	56	 56th & 6th  and 	f	up	\N	1389891602	1389799871	Mexican		4ebd2a9bb8f7b504a754c130	\N
phils3	Phil's Steaks OG Jawn	philssteaks	http://www.philssteaks.com	Help us send the articvortex away. The more steak we grill, the faster it warms up! OG Jawn is on 41st btw 6th n... http://t.co/Y6tMXsGQ3q	41	 41st btw 6th n 	f	up	og( jawn)?( in|:| ?-| is on| on) (.*?)(\\n|$|!|\\.)	1389887366	1389182377	American		4f15b382e4b0725660ea9f31	\N
bobjo	BobJo	bobjotruck	http://www.bobjo.net	Bobjo express stay at water and hanover sq.	hanover	 water and hanover 	f	none	\N	1389897032	1389897032	\N		4e3add0c88772c3bf12772da	\N
shanghai	Shanghai Sogo	shanghaisogo	http://www.shanghaisogo.com/	RT @MitchSimon: @shanghaisogo how am I just learning about you? You need to come to 53/Park corner! Everything on the menu sounds amazing!	53	 53 / Park 	t	up	\N	1389899528	1389898088	Asian		5258369d498e13def2bef2cb	\N
mausam	Mausam	mausamnyc	http://www.mausamnyc.com	Hello downtownlunch @ Hanover bet Pearl & Water Str. Our delicious Curry N Bites to satisfy yr taste buds any style	Hanover	 Hanover bet Pearl & Water 	f	none	\N	1389890316	1389877071	Indian		50730eebe4b0f3224431dc5d	\N
chefsamir	Comme Ci, Comme Ca	chefsamirtruck	http://www.chefsamirtruck.com	We are on 47st between park av and Lexington av!!	47	 47st between park av and Lex	f	up	\N	1389892047	1389892047	Moroccan		4c3c85e3a9509c74b52e395b	\N
crepestruck	Crepes Truck	thecrepestruck	https://www.facebook.com/thecrepestruck	VictoriaJustice at Uggs Aulstralia on Madison Ave & 58 Street tonight from 6:30pm-8pm	58	 Madison Ave & 58 Str	f	up	\N	1383866974	1383866974	Crepes		4dfb854918386e743d9869e3	\N
mactruck	MacTruck	mactruckny	http://MacTruckNYC.com	Good morning broadway!! Between 55/56 for lunch today!	55	 broadway!! Between 55 / 56 	f	up	\N	1389880199	1389880199	American	Looking to take a nap after lunch? This truck is great and the owner is incredibly friendly. Feel free to chat it up while you watch him prepare your food.  Not listed on the menu are the many condiments\\n you can get on your macaroni. The regular size is a good portion for a normal lunch.	50575ab8e4b04ed4f2197dac	\N
chipsy	Chipsy King	chipsykingny	http://chipsykingny.com/	Kasar truck is at 46th street between 5th and 6th avenues until 6pm.\nAll night at 7th and Christopher.\nHappy Thursday!!!	46	 46th street between 5th and 6th 	f	up	\N	1389885465	1389885465	Fries		51bb5c43498ee06e13d0d31f	\N
craffels	Craffles	crafflesnyc	http://www.craffles.com/	Happy holidays!!!\nMake ur holidays sweet with our delicious crepe or waffles. Our location for today. Hunter college and union square.	none	union sq	f	none	\N	1389385233	1388428190	Crepes		514e426ce4b05bcb261d910e	\N
paris	Paris Sandwich	parissandwich	http://www.parissandwiches.com/	Dumbo! Adams and front street today dumbofoodtrucks @DUMBOFoodTrucks	none	 Adams and front str	f	none	\N	1389895042	1382711724	French/Vietnamese		519e4ed0498e4f27e64c177a	\N
tacobite	Taco Bite	tacobite	http://www.tacobite.com/	Today Serving Lunch on\n47th st\nBet Park/Lexington Av. \nCall in advance for\npick-up\n@ 347-70T-Bite	47	 47th st Bet Park / Lex	f	up	\N	1389801699	1389801699	Mexican		503ba49ae4b0fad35eb7a8dc	\N
sweetchili	Sweet Chili	sweetchilinyc	http://sweetchilinyc.com/	RT @dumbolot: Happy Tuesday! @sweetchilinyc @KimchiTruck and @carlssteaks on jay & water! @DUMBOFoodTrucks	dumbo	dumbolot	t	bkl	\N	1389834841	1389715144	Asian		51a8c802498e2165ca855a19	\N
wafelMomma	Wafels & Dinges Momma	waffletruck	http://www.wafelsanddinges.com/	Momma at 46th & 6th Ave til 4:31pm Kastaar is at Sterrit Lehigh at 26th and 11th Ave til 4:29pm \nKotmadam is at 23rd and broadway til 7pm	46	 46th & 6th Ave 	f	up	momma( truck)? (.*?)(all day|till?|until|\\n|!)	1389898973	1389888223	Belgian		4a416369f964a52036a51fe3	\N
\.


--
-- Data for Name: tweets; Type: TABLE DATA; Schema: public; Owner: pepp
--

COPY tweets (contents, "time", id, retweeted, twitname) FROM stdin;
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
@hideindoors amazing!!!! Thank you so much! We will absolutely make it out	1383603397	397487574736183296	f	delsnyc
#tgif - time 2 party with us @BKBazaar , trust us-we've got the best spot right by the stage!	1389385514	421739529465524224	f	getstuffednow
RT @ChineseMirch: #NY location closed 2 day! Can't feel our toes &amp; fingers- not a day 2 be near cleavers! #frostbite! http://t.co/CqbVW28S7I	1389106743	420570281326166016	f	getstuffednow
RT @ChineseMirch: First #Sunday of the year &amp; struggling with yr rez to eat well? Worry not - our  tofu #stirfry &amp; brown rice packs flavor ...	1388955764	419937029938765824	f	getstuffednow
RT @ChineseMirch: #t's 2014 and cold out there but in here its warm n toasty with the kitchen cranking pipin hot food! http://t.co/R3dsyGwW...	1388858241	419527989848981505	f	getstuffednow
#snowdayNYC we will freeze our buns 2 bring u the buns u love @BKBazaar ! Its a date at 7pm!	1388785130	419221337656537088	f	getstuffednow
RT @ChineseMirch: #HappyNewYear ! #snowstorm - be home, stay warm &amp; stock up some soup from us this afternoon.	1388685976	418805457080557568	f	getstuffednow
#2013WasGreatBecause you all gave us so much love on the streets of #NewYork ! #BringItOn2014 !	1388520271	418110439047053312	f	getstuffednow
RT @ChineseMirch: #fridayflavors- spice , spice &amp; more spice! Worth trying- our crisp chicken lollipops, favorited by @nytimesfood &amp; @julia...	1388173526	416656084427112449	f	getstuffednow
RT @ChineseMirch: #MerryChristmas ! All our locations are open - we look forward to celebrating today with your families:) http://t.co/HSrj...	1387981820	415852011620671488	f	getstuffednow
RT @ChineseMirch: #happyholidays ! Time to eat, drink &amp; be merry!	1387910439	415552618166255617	f	getstuffednow
Wishing #HappyHolidays &amp; Good Fortune from the entire crew at Momos &amp; Buns! Looking forward to another great year. http://t.co/HfM8b2wElC	1387822410	415183398844383232	f	getstuffednow
RT @ChineseMirch: #saturdaynightdinner we r cooking spicy food &amp; the surprise warm weather calls 4 @KingfisherBeer or @harpoon_brewery IPA,...	1387666222	414528300091211776	f	getstuffednow
@BKBazaar -Get your duck, brisket, tofu or pork steamed sliders TONIGHT! You wont be able to pick just one. #bunsbunsbuns #Brooklyn	1387565594	414106234883547136	f	getstuffednow
Getting in on the fun @BKBazaar Friday &amp; Saturday night from 6pm-12am &amp; going all out w/ our steamed bao sliders! #bunsbunsbuns #brooklyn	1387471865	413713105248452608	f	getstuffednow
Eat, shop, look &amp; listen this Fri &amp; Sat @BKBazaar. Weve got just the slider for you! #livemusic #goodeats	1387227528	412688283844349952	f	getstuffednow
Hungover from fun @BKBazaar ! http://t.co/BJoKxjv5Hw	1387127030	412266762965889024	f	getstuffednow
RT @BKBazaar: Come @Getstuffednow with MOMO &amp; Buns in the back of the bazaar. http://t.co/jJDeAIH3ge	1387063187	411998987160666112	f	getstuffednow
Hey #BKBazaar, weve got spicy #vegan tofu steamed bao sliders that will make even our non-vegan friends weak in the knees @BKBazaar	1387040903	411905519884853250	f	getstuffednow
Have you missed us? We told you we'd be back! Find us at @BKBazaar tonight &amp; get a load of your fave steamed bao sliders! #Brooklyn #foodie	1386958486	411559837395214336	f	getstuffednow
Get your M&amp;B fix this Fri &amp; Sat from 6 pm-12 am @BKBazaar. STEAMED BAO SLIDERS....mmmmmmm #Brooklyn	1386885233	411252592149143552	f	getstuffednow
Gd Mrng Dumbo Come join your favorite food truck on Jay str &amp; Water str. Yes we are back... try our Famous Colombian Soups &amp; Rice Platters..	1389368329	421667454151327745	f	palenquefood
Good Morning NY, Come join your favorite food truck @ WFC  yes we are back... try our Famous Colombian Soups &amp; Rice Platters...	1389279990	421296932854968320	f	palenquefood
Good Morning NYC, We Are Back!!! Ur Favorite Arepas are back on the corner of Varick Str. &amp; Charlton Str... It's Cold, But our food is Hot!!	1389191621	420926284743868416	f	palenquefood
Lindos palenqueros@ smorgasburg with quinoa chipotle chorizo arepa! http://t.co/kDra9XLXBj	1387746486	414864948523978752	f	palenquefood
Good Morning Grand Army Plaza. Come Enjoy Your Favorite Food Truck Palenque!!!  We Are Here Arepa Lovers. Merry Christmas &amp; A Happy New Year	1387638440	414411771253125120	f	palenquefood
Serving delicious and nutritious lunch: soup, rice platter &amp; Arepas! Enjoy it!	1387560265	414083880845852672	f	palenquefood
RT @DispatchNY: . @BrookfieldPlNY NORTH Lot | Thurs 12/19, 11a-3p | N. End Ave./Vesey | @FritesnMeats @SweetChiliNYC @Palenquefood @MilkTru...	1387470296	413706524029374464	f	palenquefood
@DispatchNY @BrookfieldPLNY @fritesnmeats @sweetchilinyc @milktrucknyc @TaimMobile	1387470291	413706503787663360	f	palenquefood
Here we are WFC, with soup, rice &amp; beans and Arepas! North end &amp; Vesey st!	1387468768	413700115036401664	f	palenquefood
Today we are on Varick street and Charlton street with your favorite AREPAS!!! Come enjoy our lovely soups too... Good Day Folks	1387383254	413341444494331904	f	palenquefood
@FoodtoEat @nycfoodtruck @nystfood yes, this a a shrimp arpea from palenque! :)	1387224999	412677676441141248	f	palenquefood
Palenque @ smorgasburg "lentil soup" http://t.co/IdonsfQEpU	1387131301	412284676347531264	f	palenquefood
love with yuca arepa http://t.co/5zeAIoyN0A	1387064720	412005417842008065	f	palenquefood
Hi Williamsburg, Palenque is at smorgasburg to warm you up with hot soups and delicious arepas! N5 btw Whyte &amp; Berry	1387042872	411913780319109120	f	palenquefood
@dumbolot @DUMBOFoodTrucks palenque is here to prepare your lunch: soup, rice platter and arepas! Jay st &amp; Water	1386945724	411506310493257728	f	palenquefood
Good morning Dumbo! Palenque is here to give you a hoy beef sancocho soup! Delicious &amp; Nutritious Jay st &amp; Water	1386944921	411502941741522944	f	palenquefood
Palenque is here @ WFC to warm u up with a beef sancocho soup! Rice platter with meat or vegetarian! North End &amp; Vesey!	1386861517	411153122678280193	f	palenquefood
RT @cindykins48: Today, @palenquefood made my day. Nothing like some Colombian food to make me happy #parceros	1386790832	410856644739096576	f	palenquefood
@cindykins48  we are there for your happyness	1386790799	410856507404587008	f	palenquefood
@Stadiafile :)	1386786495	410838454415544320	f	palenquefood
After todays regular Hudson St. service, Sweetery will be making yet another a return appearance @OITNBNews, see you guys later.	1389370417	421676211824115712	f	sweeterynyc
@MelissaGoldman Hi Mel. R u planning an event @ Seventeen, our backgrounds r adv. marketing &amp;brand building we have tons of experience pub's	1389287388	421327963011817472	f	sweeterynyc
Planning a corp. marketing event, or a personal celebration, SweeteryNYC is outstanding @ producing events, it's what we do best(212)8886633	1389287046	421326526051647489	f	sweeterynyc
Hudson/KIng, it's down right balmy out, &amp;when that groundhog comes out of his lil tunnel soon, he'll be wearing a Speedo, we're here, r u?	1389277637	421287060591230976	f	sweeterynyc
Hey Hudson/King St. u know what time it is, is't the"sweetest" time of the day, stop by our mobile bake shop &amp;say hey, we'll be here all day	1389188497	420913181947486208	f	sweeterynyc
Thank u Viacom for having The Sweetery Singing Bakers in to welcome ur world back to work after the holidays http://t.co/Pbau3a4sY8	1389020066	420206732862701568	f	sweeterynyc
A sweet start to the new year, The Sweetery singing bakers up at MTV Viacom offices serving treats and belting... http://t.co/6g41lpcuam	1389018480	420200079912620032	f	sweeterynyc
Up at MTV Viacom offices with the Sweetery singing bakers, serving treats &amp; belting out tunes #HappyNewYear! http://t.co/dYswtDwDev	1389018205	420198924901556226	f	sweeterynyc
Happy "Sweet" New Year to all!	1388552887	418247241896570880	f	sweeterynyc
So long 2013, wishing all an extraordinary 2014!	1388538561	418187152577421312	f	sweeterynyc
Missing all of our "sweet" fans this week, but not missing NYC cold temps. Sent with love from the shores of Mexico. http://t.co/xIM5FHh8o3	1388257783	417009486118006784	f	sweeterynyc
RT @brandedcarter: A recap of the @outbrain @SweeteryNYC dessert truck that hit the mean streets of NY yesterday http://t.co/FMoZujcKoU #di...	1387569562	414122874912272384	f	sweeterynyc
Gd morning Hudson/King St. Stop by so that we can wish you a warm/happy holiday, for after today we are heading out for some fun, sand &amp; sun	1387546983	414028173823598592	f	sweeterynyc
RT @Outbrain: Next stop for our #holidaytreats @SweeteryNYC truck: Broadway btw 53rd and 52nd, swing on by #coffeebreak #BrainFood http://t...	1387481560	413753770422439937	f	sweeterynyc
Reply to @garsleat because it is a private event, our client hired Sweetery to cater to their client.	1387478195	413739656027447296	f	sweeterynyc
@garsleat come back and ask for Grant and I will take care of you!	1387475956	413730266650132480	f	sweeterynyc
RT @Outbrain: Lunchtime! @mindshare @GroupMWorlwide love our @SweeteryNYC #BrainFood http://t.co/3RVP4dCEOv	1387475000	413726252818632704	f	sweeterynyc
The winner of tonights tickets is @melmerbay8 Thank you to everyone who participated!	1387472064	413713938883178496	f	sweeterynyc
The movie The Secret Life of Walter Mitty is based on a story written by which author? First correct answer wins tickets to tonight's show!	1387471793	413712802919243776	f	sweeterynyc
The first person to answer the following ? correctly will win a pair of tickets to tonight's showing of The Secret Life of Walter Mitty...	1387471675	413712310663135232	f	sweeterynyc
We are back UWS !!! Broadway and 61st now till 9 start weekend off w a Carl's famous cheesesteak and our BEER BATTERED ONION RINGS GOT WHIZ?	1389393507	421773056466771968	f	carlssteaks
CHEESESTEAK FRIDAY CHEESESTEAK FRIDAY! ! broadway&amp;55th st 11-3 @randomfoodtruck @VictoriasSecret @barclays order 917 597 4313 GOT WHIZ?	1389366343	421659120354480129	f	carlssteaks
HOLY HEAT WAVE!! Venture out 40th st Park Ave 11-3 for a famous Carl's cheesesteak and don't forget our beer battered onion rings GOT WHIZ?	1389280640	421299659915948032	f	carlssteaks
POLAR WHAT? Can't keep a good cheesesteak down 49th st&amp;6th/7th av 11-3\nWe are back @SIRIUSXM @Barclays  @FoxNews order917 597 4313 GOT WHIZ?	1389194101	420936687704109056	f	carlssteaks
Holy crap  -15 below with wind chill !!! Off road today back in full force tomorrow STAY WARM.  GOT WHIZ?	1389107841	420574884486721536	f	carlssteaks
RT @jstander: Attention!! @carlssteaks has BEEN HACKED. Do not enter your Twitter password in the link they DM you.	1389073455	420430662420922368	f	carlssteaks
@jstander yes we were hacked sorry folks we will correct	1389073451	420430644364464128	f	carlssteaks
RT @DizzysHotsauce: @carlssteaks  it was an unsafe website you sent.  were you hacked?	1389073406	420430454492499968	f	carlssteaks
Hey start off your week with our famous cheesesteaks 11-3 45th st bet 5th/6th ave order 917 597 4313 GOT WHIZ? @FoxNews @SIRIUSXM @Barclays	1389022357	420216342076489728	f	carlssteaks
@jimmyfallon history of rap is a classic!!! Freaking hysterical	1388980386	420040299432660993	f	carlssteaks
Hey folks had to move 23rd st between 5th /6th ave front of home depot till 7	1388863952	419551942520885248	f	carlssteaks
We're on 88th and Broadway for dinner tonight!	1389390276	421759504435273728	f	goburger
Hello Flatiron! We're on 20th and 5th for lunch!	1389287328	421327711144255488	f	goburger
Hey folks SOHO Saturdays are back! Broadway bet Spring st&amp; Prince St 12-7 stay warm HOT CHICKEN &amp;DUMPLING SOUP &amp;Carls famous cheesesteaks	1388852203	419502661902553088	f	carlssteaks
Hey folks we are taking a snow day!!! Hope you enjoy the snow time to go sledding GOT WHIZ?	1388762668	419127124105363456	f	carlssteaks
HOT HOT CHICKEN AND DUMPING SOUP!!	1388682076	418789100431634432	f	carlssteaks
start off 2014 the right way w a Carls famous cheesesteak! 40th st &amp; Park Ave 11-3 pre order 9175974313 try our beer battered onion rings	1388675840	418762943413895168	f	carlssteaks
Hey folks Ringing in 2014 serving up our famous cheesesteaks tonite with @Alesso  at #pier94 #alesso till 4 am GOT WHIZ?	1388537627	418183237597683712	f	carlssteaks
Hey folks serving up our famous cheese steaks today 49th &amp;6/7th ave 11-3 come on by @Barclays @SIRIUSXM @SiriusXMNFL GOT WHIZ?	1388417815	417680708937990144	f	carlssteaks
@carlssteaks serving up our famous cheesesteaks at electric dance music rave till 4 am AWESOME DJS PERFORMING GOT WHIZ?	1388201499	416773413781245954	f	carlssteaks
"@PinstripeBowl: Saturday @NDFootball vs. @RFootball #YankeeStadium http://t.co/8KIeYCJBpG"STOP BY FOR A CARL'S STEAK	1388161543	416605825860661248	f	carlssteaks
CHEESESTEAK FRIDAY CHEESESTEAK FRIDAY! 56th &amp; broadway 11-3 come by @randomfoodtruck @VictoriasSecret @Barclays @FoxNews ORDER 917 597 4313	1388159782	416598440656011264	f	carlssteaks
Happy Friday!  47th Street &amp; Park Ave serving your favorite #tacos #sliders #comegetsome	1389370100	421674881215119361	f	mikenwillies
Beautiful day for 56th Street &amp; Broadway #tacos #sliders #favoritepeeps #comegetsome @randomfoodtruck	1389279347	421294235988815872	f	mikenwillies
RT @BrookfieldPLNY: @mamuthainoodle and @mikenwillies are at the North End lot. Get some grub! #foodtrucks #lunch	1389204923	420982078772350976	f	mikenwillies
#WFC N. End &amp; Vesey St We are here to warm you up!!  #tacos #sliders #hotsauce #comegetsome preorder 917-995-5170	1389196224	420945593419444224	f	mikenwillies
@WereTeamUSA tx for looking for us.  Off the road til Monday.  Hope to see you next week!!	1388691841	418830053989175296	f	mikenwillies
#FiDi today Old Slip &amp; Front Street end the year with a happy belly #tacos #sliders #burritos #comegetsome	1388417320	417678630756446208	f	mikenwillies
Merry Christmas!  Wishing you all a great day with family, joy and of course delicious food!	1387989894	415885875030282240	f	mikenwillies
Happy Monday!!! Varick St. and King St.  today for lunch #tacos #sliders #Burritos #comegetsome grab a taco while... http://t.co/SQAgd6RlSY	1387814734	415151200674148354	f	mikenwillies
#TGIF 46th Street &amp; Park Ave serving our scrumptious #tacos #sliders #burritos #comegetsome	1387553405	414055109900124162	f	mikenwillies
@lobotims_tan right back at ya Woody, Happy and Healthy!	1387488349	413782246311886849	f	mikenwillies
@SSDESTO much appreciated and glad you enjoyed the short rib	1387488286	413781980128747520	f	mikenwillies
RT @SSDESTO: @mikenwillies Digging into son short ribs/rice bowl with a side of chipsNdips! U guys r GREAT! http://t.co/eKQ0MCTdCL	1387488217	413781691044737024	f	mikenwillies
Hello Midtown!! 56th St &amp; Broadway with all your favorites #Tacos #Sliders #Burritos #Quesedillas. too cold to wait? Preorder 917-995-5170	1387470684	413708150282272768	f	mikenwillies
Humpday blues? We got the cure... #Tacos #Sliders #Burritos #Quesedillas WFC Today N. End Ave &amp; Vesey St. @BrookfieldPINY @DispatchNY	1387384908	413348382933917696	f	mikenwillies
#Midtown 46th Street &amp; 6th Ave 11:30-3 warm up with our #tacos #sliders #burritos #comegetsome	1387293234	412963872769732610	f	mikenwillies
@mikesut tx!  We think the same of our customers!	1387226332	412683267398467584	f	mikenwillies
RT @mikesut: @mikenwillies you da best	1387226304	412683148246675456	f	mikenwillies
Happy Monday!!! #FIDI back to our old Stomping grounds corner of wall St &amp; Front St #tacos #sliders #burritos... http://t.co/CdlIaF3XE2	1387211512	412621104151142402	f	mikenwillies
#TGIF the 13th!  47th St &amp; Park Ave with your favorites #tacos #sliders #quesedillas #burritos #comegetsome	1386949814	411523466056048641	f	mikenwillies
Hello Midtown!!! 56th St &amp; Broadway. Warm up today with our New chipotle Chicken quesadilla or your regular... http://t.co/GuryEgXxNz	1386865876	411171403262484480	f	mikenwillies
Please help by rating us on https://t.co/ph6XW6VtOf http://t.co/KRQ3Yr9wxE	1389388476	421751955615399936	f	eddiespizzany
Varick and king today until 3	1389377155	421704473195855872	f	eddiespizzany
Hudson and varick today until 3	1389374690	421694131107147776	f	eddiespizzany
@tsalogub52 none off the menu but try our hot chicken pizza with Panko breaded chicken, hot cherry peppers, garlic and franks	1389308327	421415784251158528	f	eddiespizzany
@ginovea upper east side 73 and 3	1389302904	421393039169695744	f	eddiespizzany
We have hot soup and sandwiches tonight for dinner.	1389302172	421389969010462720	f	eddiespizzany
Dinner is being served tonight on 3rd Ave between 73rd &amp; 74th street. We are giving free garlic bread with every... http://t.co/4oeJkIm7KP	1389301682	421387913998245888	f	eddiespizzany
Check out some of the awesome videos from our gallery.\nhttp://t.co/sycYjaPLQE http://t.co/IK4FvLY6PH	1389224454	421063995680755712	f	eddiespizzany
Dinner is served! We are parked on 3rd Ave between 73rd &amp; 74th street in front of Duane Reade. Tonight we are... http://t.co/VEd6teY6od	1389214474	421022137454174209	f	eddiespizzany
46Th bet 5-6 today..beat the cold and call ahead your order.917-439-7522	1389196838	420948166943719425	f	eddiespizzany
Lunch will be served on West 48st between 6th &amp; 7th Ave. We are in front of FOX news studios. Don't wait in the... http://t.co/Cb5zhbwPTQ	1389111646	420590844198928385	f	eddiespizzany
Come brave the cold and grab a pizza and creamy tomato soup. We are on 48th between 6th and 7th. Call ahead your order to 9174397522	1389102265	420551501090926592	f	eddiespizzany
Lunch will be served today on 26th between 11th and 12th. Call ahead your order to 917-439-7522	1389014851	420184858846302208	f	eddiespizzany
We will be off the road today and back out there on Monday. Have a happy Friday! http://t.co/DvdgWQKqK0	1388754824	419094224668483584	f	eddiespizzany
We want to wish all our wonderful customers and clients a very Happy New Year!	1388606805	418473388135710721	f	eddiespizzany
Its lunch time. We are parked on W.26st between 11th &amp; 12th Ave.	1388419623	417688291807596544	f	eddiespizzany
We are serving lunch today on 26th and 12th in front of starrett lehigh building! We will be closed tomorow... http://t.co/2gangG3kvu	1388406664	417633935615483904	f	eddiespizzany
Its dinner time. We are parked on 3rd Ave between 73rd &amp; 74th streets in front of Duane Reade.	1388092310	416315441854681088	f	eddiespizzany
Lunch is being served on West 26st between 11th &amp; 12th Ave. http://t.co/zy3CK38Gpe	1387812369	415141283040993280	f	eddiespizzany
Check out @TakumiTacoNY @smorgasburg on Saturdays and Sundays in Williamsburg! Best spicy tuna taco in nyc! http://t.co/XoazH81yPe	1387729132	414792160160907265	f	eddiespizzany
The temp is rising; it's practically summer out here! Ok, not exactly, but if you're near Varick and Vandam stop by for a burger and shake!	1389198360	420954551647084544	f	goburger
We're on 21st and 5th!	1389110753	420587101277540353	f	goburger
We're on Houston and Broadway!	1389043197	420303751660843008	f	goburger
We're on 27th street between Park and Madison!	1389024342	420224664837709824	f	goburger
RT @eaterny: It snowed last night, so restaurants are offering deals.  Here's a map:  http://t.co/bAUEo3Ay9v	1388774896	419178411811405824	f	goburger
Snow Day Special! We're not around, but GO Burger New York &amp; BLT Burger New York have $2 sliders / $1 Hot Choc... http://t.co/6Ef49H0aIE	1388773701	419173401740464128	f	goburger
We're on Houston and Broadway!	1388698113	418856364329689088	f	goburger
We're on 21st between Broadway and 5th!	1388511405	418073251425050627	f	goburger
Is it time to have a burger yet? Yes, always yes. We're on 27th and Park for those that want to indulge in their good habits.	1388421772	417697305433632768	f	goburger
Hey folks, we moved to 76th and Broadway!	1388181396	416689095872901120	f	goburger
@starrett601 28th and 11th!	1388163198	416612767983218688	f	goburger
@stevenshawnyc for the next few hours until we leave to stock up for dinner service!	1388160796	416602692153540608	f	goburger
@starrett601 @stevenshawnyc head's up. We're in the hood!	1388160600	416601871529562112	f	goburger
We're on 28th and 11th!	1388160559	416601698841686016	f	goburger
@starrett601 yes, we'll let you know!	1388101072	416352191566594048	f	goburger
We're on 88th and Broadway!	1388095417	416328472265777152	f	goburger
We're on 56th and Broadway!	1388073868	416238088025669632	f	goburger
we're on broadway and 69th!	1387651542	414466725816840192	f	goburger
@ChristaSully what would u like we can deliver it to u if u are near Williamsburg. We are hosting a private event near by with the food ^_^	1389299955	421380669777141760	f	lovemamak
@WPNYC77 @singhkashminder not yet guys, we wish we can be there for u all!	1389289017	421334791683072000	f	lovemamak
@WPNYC77 only at  for now 7 Hanover square	1389288821	421333973424685056	f	lovemamak
@WPNYC77 @singhkashminder Not sure when. He is taking a break back no replacement to cover his shift.	1389029065	420244474397474816	f	lovemamak
@singhkashminder tomorrow at Hanover square having private catering today. Under staff	1389025974	420231510625878016	f	lovemamak
@pinkykittyrroww we are not open today because of the weather l...	1388684206	418798031807729664	f	lovemamak
@iamvhinasyhah you too!	1387599754	414249512824496128	f	lovemamak
@iamvhinasyhah as soon as the new year approached, Jan 2 !!	1387599623	414248961357414400	f	lovemamak
@iamvhinasyhah won't be back till next year.... Uh noooo lol	1387599387	414247973506519040	f	lovemamak
@WPNYC77 @Playmaka34 we are only at 7 Hanover Sq for today	1387560757	414085946012102656	f	lovemamak
@Playmaka34 thanks u too	1387554145	414058214087725056	f	lovemamak
Our last day of the season. Grab some #rendang #curry before we're gone for the year !	1387551330	414046407033905154	f	lovemamak
RT @i8and8: Mushroom and bamboo shoots steamed Dumprings at @LoveMamak #Dericious http://t.co/dJiwRjd0Ju	1386963030	411578898804391936	f	lovemamak
@WPNYC77 @MaMakRendang we are open !! :)	1386871078	411193221713506304	f	lovemamak
@zacharymexico not tonight, we will be back on bedford Monday with new menu	1386714212	410535278873690112	f	lovemamak
We will be @FlatironNY 21st and 5th ave and @Fidi 7 Hanover Sq 11.45am - 2.30pm. #Rendang #malaysianfood #Thaifood	1386691775	410441170943475712	f	lovemamak
RT @smorgasburg: We got a 27 for Food in the new @ZagatNYC! http://t.co/vN20vUkcuT	1386396793	409203928585494528	f	lovemamak
RT @KELVINSLUSH: Looking forward to the indoor @smorgasburg this weekend! Winter slush here we go.	1386396762	409203797769334784	f	lovemamak
RT @smorgasburg: Who says you have to go thirsty in the name of vintage, artisan, and handmade? #smorgasbar  http://t.co/clMfq2KiXD	1386396744	409203721785339904	f	lovemamak
RT @BKoysterparty: Hand painted signs for @smorgasburg tmrw. We'll be shucking #oysters all day 10AM-7PM. 80 N. 5th St. in W'burg! http://t...	1386396725	409203640176742400	f	lovemamak
Dumbo, nothing is going to stop us from being @dumbolot today. Don't let it stop you! Last week was snow, this week nothing but noodles!	1389364986	421653429778669568	f	mamuthainoodle
WFC North End&amp;Vesey! We are here to feed your noodle craving! Preorder&amp;pickup: 917-676-5299 @BrookfieldPLNY @downtownlunch	1389198198	420953869766893568	f	mamuthainoodle
Sorry everyone, no truck today. Stay warm!!	1389108803	420578919352655872	f	mamuthainoodle
@LaSpiaggia: Currently enjoying some tom yum soup from @mamuthainoodle truck. Hot and delicious! Thanks for stopping by!	1389032419	420258545599524864	f	mamuthainoodle
WFC SouthEnd&amp;Liberty! What rain? for preorder&amp;pickup: 917 676-5299 Thai noodles are what you need! 11-3p @BrookfieldPLNY @downtownlunch	1389020984	420210582164615168	f	mamuthainoodle
We are in effect at our Thursday spot. Get your 1st noodle of the year!	1388678972	418776081211351040	f	mamuthainoodle
Happy new year to all our friends old &amp; new! 2014 is here! To health, wealth &amp; happiness!	1388554177	418252649373634560	f	mamuthainoodle
Yes we are at our usual Tuesday spot. Come out for the final noodle of the year!	1388501983	418033732302692353	f	mamuthainoodle
Today's menu @ WFC South: http://t.co/eSM1Bo2OLm	1388422075	417698574130900992	f	mamuthainoodle
FiDi! WFC South End&amp;Liberty! Come get your end of the year Thai noodles! Today's special: Khao Soi! 11-3pm @BrookfieldPLNY @downtownlunch	1388414753	417667866687963136	f	mamuthainoodle
@jefferyhaines yes we will be there. Same time/place!	1388246279	416961234081431552	f	mamuthainoodle
Dumbo! We are @dumbolot today to serve you hot noodles! 11-3pm. @DUMBOFoodTrucks end the last weekend of the year with lunch from us!	1388159771	416598393214214144	f	mamuthainoodle
@jefferyhaines sorry, we are off until Friday. Happy holidays to you!	1387930284	415635855026696192	f	mamuthainoodle
WFC South End&amp;Liberty! If you're at work, we're at work! Come down to get your holiday noodle! @BrookfieldPLNY @downtownlunch @DispatchBP	1387811957	415139553851478016	f	mamuthainoodle
It's spring again? Dumbo, today is your day! Hot/fresh Thai noodles await you @dumbolot @DUMBOFoodTrucks now-3pm	1387558421	414076147937599488	f	mamuthainoodle
WFC North! We will be ready at noon today. Having some mechanical issues. Apologies to our noodle lovers! @BrookfieldPLNY @downtownlunch	1387382352	413337662591082496	f	mamuthainoodle
Call ahead &amp; pickup your order: (917)-676-5299 today's menu: @BrookfieldPLNY @downtownlunch http://t.co/lUywMM759c	1387211057	412619199618744320	f	mamuthainoodle
WFC South! Cure the winter Monday blues w/ hot&amp;fresh Thai noodles! Pre-order for pickup: (917)676-5299 @BrookfieldPLNY @downtownlunch 11-3pm	1387205590	412596266443767808	f	mamuthainoodle
RT @linalovesit: Thnx @mamuthainoodle http://t.co/7yJqUhkEbC	1386960882	411569886679531520	f	mamuthainoodle
Late tweet! Dumbo, it's cold but not too cold for hot noodles! @dumbolot till 3pm! @DUMBOFoodTrucks	1386953080	411537161977352192	f	mamuthainoodle
Rockin the cheese today....\n26th 11/12\n#ComeToTheCheeseYo	1389198974	420957126123868162	f	gcnyc1
Gorilla staying in today...cold	1389111815	420591552705339392	f	gcnyc1
G1 Broadway/55\nG2 Columbus/91 @trinity\n#ComeToTheCheeseYo	1389026206	420232484551688192	f	gcnyc1
Pee storm cheese:\nG1 5th Ave /20\nG2 50TH /6\n#ComeToTheCheeseYo	1388683976	418797066945835009	f	gcnyc1
G1- 46 5/6\nG2 - 49/6\n#comtothecheeseyo	1387551227	414045972063608833	f	gcnyc1
This week's\nVege Melt:\nSteamed mixed vegetables, caramelized onions, Tomato, Lemon Horseradish sauce, Swiss &amp; Muenster. ..\n#comtothecheeseyo	1387466368	413690050602627072	f	gcnyc1
G1- 5th Ave / 20th\nG2- 50th/ 6\n#comtothecheeseyo	1387466286	413689704400560128	f	gcnyc1
RT @weddingchicks: Evening ceremony w/ sparkers! @manoloblahnik @gcnyc1 @verawanggang @momomilkbar @hamiltonfarmgc @ivyllc @hermes_paris ht...	1387388384	413362961479393281	f	gcnyc1
G1- 36/Broadway\nG2- 26th 11/12\n#comtothecheeseyo	1387388311	413362656335368193	f	gcnyc1
G1 - soho hudson &amp; king\nG2 - midtown 49th/6\n#comtothecheeseyo	1387292667	412961496734629889	f	gcnyc1
G1 - 5th Ave &amp; 20th Street\nG2 - Broadway &amp; 55th\n#comtothecheeseyo	1387204988	412593740973625344	f	gcnyc1
G1- 46 5/6\nG2- 49/6\n#comtothecheeseyo	1386950636	411526913405251586	f	gcnyc1
G1 - 5th Ave. 20/21\nG2 - 50/6 \n#comtothecheeseyo	1386862068	411155430241742848	f	gcnyc1
RT @Krissy2713: @gcnyc1 So good!! Cheddar was delicious!! Cant wait for you to come back!!	1386861870	411154601107542017	f	gcnyc1
RT @makerbot: RT TONIGHT! @riverheadbooks &amp; @flavorwire celebrate @PENamerican at @brooklynbrewery, 8PM w/ @makerbot &amp; @gcnyc1. http://t.co...	1386861840	411154477010649088	f	gcnyc1
G1-36th Broadway/6\nG2 -26 th 11/12\n#comtothecheeseyo	1386776125	410794961979060224	f	gcnyc1
Ya mon....It's a snowing. ..Gorilla Got ur Back\nG1 - 47 Park/Mad\nG2 - 49th/6	1386688739	410428438018007041	f	gcnyc1
"@Steffi_NYC: @gcnyc1 lovin that hashtag"\nWe're lovin that ur lovin out #..that's hot	1386609069	410094277784772608	f	gcnyc1
Good Day for some Grilled Cheese &amp; Hot Tomato Soup.... # yummy\nG1- Broadway /55th\nG2- Columbus /91st\n#comtothecheeseyo	1386602014	410064686609338368	f	gcnyc1
RT @flavorwire: Clear your calendar Dec. 12th. @riverheadbooks + @flavorwire are throwing a holiday party for @PENamerican, feat. @makerbot...	1386423555	409316174741393408	f	gcnyc1
RT @chayapathi: Congrats @taimmobile, @calexico and @VeganLunchTruck - you guy are the best http://t.co/w8D15EEZlh via @itsashleyperez	1387809097	415127559290896384	f	taimmobile
RT @therevajm: Eating here so much, I just might turn #yummy @TaimMobile	1387634696	414396068747804672	f	taimmobile
@Bel_botum_JRome Likewise! Thanks for always stopping by, see you soon.	1387571995	414133081449451520	f	taimmobile
@niftinessafoot Sorry Matthew. I guess the lesson here is, always squirrel away falafel.	1387557471	414072165160718336	f	taimmobile
@pepperknit Great call. Home lunch is for suckers.	1387557150	414070817853820929	f	taimmobile
Butternut Squash is the soup du...how do you say last soup of the season? Get yours now on Varick/Vandam	1387556931	414069897418014720	f	taimmobile
RT @mattsief: Hey @TaimMobile fans, didnt know we were closing til last night. If I didnt say bye, have a great winter. Cheers &amp; all the ...	1387556877	414069672116776960	f	taimmobile
@sarma It bums us out too :( But we will emerge from hibernation like a bear, stronger than ever. And tastier. :)	1387556715	414068993583230976	f	taimmobile
@iamcaseface We are indeed, last #falafelfriday until the Spring!	1387556651	414068722165645312	f	taimmobile
@PeteSpande Sorry Pete, stop by out Nolita and West Village shops in the mean time and we will see you soon.	1387556631	414068640443801600	f	taimmobile
Last Spinach-Jalepeno falafel, last fries w saffron aioli, last Date Lime Banana, last Ginger Mint Lemonade....Varick/Vanadam #falafelfriday	1387556565	414068363342929920	f	taimmobile
Make this #falafelfriday count, it will be the last one for a few months! @ Varick/Vandam til 3	1387556488	414068041019039744	f	taimmobile
Sad news friends, Taim Mobile is closing down for the winter after today. We'll emerge in the spring tastier than ever. #lastfalafelfriday	1387556383	414067598696140801	f	taimmobile
RT @efong93: Trip to NYC for Falafels at @taimmobile with @gabec94  #prime #xoxo #lifestyle http://t.co/imR69Jbwm4	1387546073	414024357942661122	f	taimmobile
RT @DispatchBP: . @BrookfieldPlNY NORTH Lot | Thurs 12/19, 11a-3p | N. End Ave./Vesey | @FritesnMeats @SweetChiliNYC @Palenquefood @MilkTru...	1387465569	413686699513094145	f	taimmobile
@ezagroba @saharloo You can learn tasty recipes and then make food for the office: win/win!	1387399638	413410165585879040	f	taimmobile
Reflections from one of our favorite customers @MerJohnston http://t.co/5Q2fKUqURs	1387399570	413409879689539585	f	taimmobile
RT @toddjolmstead: Making my last week in Flatiron count. This morning: @ChozaTaqueria breakfast. Now: @TaimMobile falafel.	1387392919	413381980290830336	f	taimmobile
@MerJohnston We're waiting!	1387386316	413354287574839297	f	taimmobile
Taim falafel + @LABurdickNY hot chocolate = lunchtime heaven on 20th/5th http://t.co/vWgasWD3WQ	1387383110	413340840929787904	f	taimmobile
RT @BCDRestaurants: #NowCraving some #BBQGoodness and you know that means we want lunch from our client @Mexicue! #JamBurrito	1389311159	421427665753882624	f	mexicue
@upstatehick We're doing a private event today - sorry!	1389199078	420957563770114048	f	mexicue
@EatMeaty can't wait!	1389035634	420272028219109379	f	mexicue
RT @EatMeaty: Psyched to hear @CafeCluny and @Mexicue will be joining our awesome teams this years #nychilifest 2014 on Jan 26th! http://t....	1389035611	420271933150986240	f	mexicue
Water and broad!	1388677534	418770047201714176	f	mexicue
Happy NY from your friends at Mexicue! Indulge tonight because tomorrow resolutions begin. We'll be here to help you make or break them.	1388516328	418093900562464768	f	mexicue
North corner of 5th and 17th...mixing it up for the Xmas/New Years gap.	1388423119	417702955207249920	f	mexicue
Just east of 5th ave on 52nd st!	1387817831	415164192233390080	f	mexicue
@wfc today at vesey and north end!	1387557506	414072309906165760	f	mexicue
Broadway and 52nd street today for lunch! It's a balmy 40 degrees outside...we have ice cold Mexican coke to help cool you down!	1387469568	413703469951119360	f	mexicue
18th and 5th...this is your last chance to grab hot burritos for stocking stuffers!	1387381645	413334694407974912	f	mexicue
At 390 greenwich st and open to the public!	1387302796	413003979706990592	f	mexicue
@AlmostMedia 45th &amp; 6th	1387214410	412633260108566529	f	mexicue
45th and 6th...cold weather makes food taste better	1387211536	412621208434515968	f	mexicue
RT @PeterBlairHenry: Simplify your own #holidayparty w/food delivery @Seamless (@jasonfinger) @Mexicue (@thomaskelly) &amp; @milkmade (@dihard)...	1386855567	411128163604135937	f	mexicue
The truck is doing a private event all week long, see you next monday!	1386605605	410079746945335296	f	mexicue
RT @Reverie_MT: Thank you @Mexicue for having great customer service!! I'll miss your food when I'm back in Chicago!	1386446872	409413973457768448	f	mexicue
RT @ManhattanTwist: Just enjoyed steak tips with @thechililab Pequin Salt paired with @sterlingwines. It's a good night #TGIF	1386372399	409101609957089280	f	mexicue
Is beer better with mexican or bbq? The answer is: Both. Find us Dec. 6th &amp; 7th at BeerFest! Get your tickets here: http://t.co/Rk1jzoggOm	1386359194	409046224012984320	f	mexicue
RT @DispatchBP: . @BrookfieldPlNY NORTH Lot | Dec. 6th | @MorrisTruck @BigDsGrub @Mexicue @SchnitznThings @ToumNYC | N. End Ave. &amp; Vesey | ...	1386346716	408993888113029121	f	mexicue
53rd and park	1389372174	421683580662992896	f	biandangnyc
#FF @mooshugrill @domotaco @dumbolot #followfriday	1389370677	421677299197816833	f	biandangnyc
#tgif 53rd and park!	1389368832	421669561901916160	f	biandangnyc
53rd and park... again. Just like yesterday... And the day before and the day after. 11:30-2:30 #nyc	1389281431	421302976041324544	f	biandangnyc
#humpday #wednesday 53rd and park. Brrrr~ #staywarm! #bundleup	1389193329	420933448061038592	f	biandangnyc
stay warm new york! we will not be out today!	1389114034	420600861241257984	f	biandangnyc
53rd and park on this rainy day! 11:30-2:30! Let's go!	1389020702	420209398175129600	f	biandangnyc
RT @Lux_Escapes: We chose @biandangnyc and @morristruck as some of the best food trucks to track down in NYC. See why: http://t.co/38s6Y8Wo...	1388682813	418792187871367168	f	biandangnyc
I hope you all had a wild and safe #nye! We are working the truck today on 53rd/park! Hope to see you all!	1388674696	418758144479592449	f	biandangnyc
53rd/park for lunch from 53rd/park. come by and say hi to Nick and @streetgrubsteve! can you believe 2013 is almost over?! stay safe!	1388416066	417673372898562048	f	biandangnyc
The truck will be out on 53rd and park tomorrow! Get ready!!!	1388363308	417452089359347712	f	biandangnyc
@_natma sorry, closed til 1/2	1388086134	416289538496270336	f	biandangnyc
Truck is down for maintenance. Happy Holidays!	1387806649	415117293446643713	f	biandangnyc
MSG! MSG! MSG! http://t.co/zlNjDSRGzu	1387578944	414162226782560260	f	biandangnyc
More goodies!!! Thanks Dan!!! http://t.co/SfWxpMYG9P	1387566534	414110174946017280	f	biandangnyc
We really do have the best customers!!! Thanks Debbie!!! Have a great one. Will most likely be back on January... http://t.co/bmubY5D1Mb	1387560752	414085923404406784	f	biandangnyc
Vote for your favorite new food truck! http://t.co/J2vxh3chQh	1387553136	414053979874529281	f	biandangnyc
53rd and park! #tgif is anyone working over the holiday break? 12/23, 12/24, 12/26, 12/27? Any feedback would be great!	1387551328	414046397810221056	f	biandangnyc
53rd and park! #biandang #nyc #taiwnese	1387465282	413685494069723136	f	biandangnyc
http://t.co/tAjwsJsjHh\n\nMooShu grill needs ya vote!!!	1387395111	413391178143240192	f	biandangnyc
RT @starrett601: It's pizza time! @Valduccis Hi #NYC @starrett601 26th &amp; 11th, Come and Get It!	1389383430	421730791706869760	f	valduccis
RT @stevenshawnyc: The @valduccis truck redeemed far west Chelsea today http://t.co/drzyuSQanc	1389383420	421730746479706112	f	valduccis
HI #NYC @starrett601 26th &amp; 11th Come and Get It !	1389365077	421653810625277953	f	valduccis
Off the streets today! Keep sake and warm! Are you missing us? #BestPizza #Foodies	1389275503	421278110118457345	f	valduccis
Off the cold streets today! Stay warm and safe #NYC!	1389188684	420913966513008641	f	valduccis
Stay warm #NYC! Off today! Be back with the warmer weather! #BestPizza! #Foodies	1389100926	420545882442842112	f	valduccis
Off today! Stay dry #NYC! #BestPizza	1389019161	420202934278701056	f	valduccis
Come and see us @WebsterHall #bestpizza #foodies https://t.co/kma99NKggv	1388902786	419714824864808960	f	valduccis
RT @WebsterHall: The energy is palpable. @borgeousmusic is INSANE!!  #websterhall britenitesnyc @ Webster Hall http://t.co/AZqWU8mpMv	1388902653	419714264782614528	f	valduccis
Come see us @WebsterHall for Girls and Boys night out featuring DJ Sliink #BestPizza	1388795673	419265560296554496	f	valduccis
RT @NuchasNYC: @foodtoeat @cupcakestop @milktrucknyc @coolhausny @philssteaks @valduccis Thanks for the mention. We're in great company!	1388787007	419229209215918080	f	valduccis
RT @starrett601: Stay safe &amp; warm today! If at #starrettlehigh, @Valduccis won't be out front today but will be back next Friday.	1388763755	419131685192888320	f	valduccis
Tweet tweet we are off the street! Be safe and warm today #NYC ! We will be in @WebsterHall tonight and tomorrow! #best pizza	1388761734	419123207657250816	f	valduccis
Happy New year #NYC Off today! Keep safe in the bad weather! #BestPizza!	1388671119	418743143463276544	f	valduccis
Happy 2014! @Valduccis @WebsterHall http://t.co/PuXaH4cKwB	1388553138	418248293571784705	f	valduccis
Going to 6am @WebsterHall!  Crazy night #2014WithYou http://t.co/lHEv1Sk5IZ	1388546693	418221261039599617	f	valduccis
It's Raining, Stay In ,We Are! See you tomorrow #Midtown #HappyHolidays #RockefellerCenter #RadioCity #BestPizza http://t.co/D1yysL4yrU	1388338498	417348026139553792	f	valduccis
@Valduccis is an official CellPhonesForSoldiers drop off site Give us your old phones Help a soldier call home!#HoHo http://t.co/d4nhNSXPCl	1388337338	417343162168791040	f	valduccis
The jelly apples are flying@Webster hall http://t.co/y2ikWUbvl0	1388290299	417145868547276800	f	valduccis
@Valduccis is a cell phone for soldiers drop off site!Give us your old phonesHelp a soldier call home!SupportTheTroops!\n50th&amp;6th! #holidays	1388251905	416984832267149313	f	valduccis
We're chilling on 46th &amp; 6th today. Come early! #lobstahforlunch #clamchowda #lobstamacNcheese #uknowuwantit	1389366574	421660093240070144	f	lobstertruckny
... And by today we meant tomorrow. 46th &amp; 6th Friday January 10th. #whoopsie	1389320658	421467507640532992	f	lobstertruckny
46th &amp; 6th is where you'll find the girl of your dreams today. #bigred is waiting! #clamchowda #lobster rolls #lobster Mac\n@redhooklobster	1389320445	421466611665891328	f	lobstertruckny
She's Back! #bigred is prowling the corner of 56th &amp; Bway! #lobstah for lunch today &amp; Mac-n-Chz for dessert!! #clawsup @redhooklobster	1389279338	421294198877597696	f	lobstertruckny
#bigred is sitting pretty on a film shoot today. We plan on getting her back on the streets soon. stay tuned. Pound open today #redhook...	1389194642	420938956742873088	f	lobstertruckny
Thanks @PeterDavisNYC: glad to know you are lobstericious!  #JefferyDeitch = rent is too damn high :)	1389132062	420676476027949057	f	lobstertruckny
Closing at 6:30 tonight!!!! Its FREEZING out there, Stay warm #lobstahlovers. See you tomorrow at the POUND 12-8. @Redhooklobster	1389130696	420670746076401664	f	lobstertruckny
brrrrrrr....its too cold out for #bigred, but don't fret OPEN @redhooklobster #redhook 12-8. #chowder is ready #LOBSTAH too Come and get it!	1389106543	420569442779926528	f	lobstertruckny
rain rain go away. closed @redhooklobster today #redhook. #bigred is still sleeping. stay dry #lobstahlovahs. see you tomorrow. #clawsup	1389019075	420202576509145089	f	lobstertruckny
Come get yo' #lobstah fix @redhooklobsterpound #redhook 12-8 AND @bkflea N5 &amp; Wythe 10-6. Have a #lobsterrific Sunday! #clawsup	1388933418	419843302528397312	f	lobstertruckny
We are BACK in action. Lobstericiousness at the POUND 12-9 and @smorgasburg @bkflea Wyeth and N 5th 11-7 #clawsup	1388853757	419509182090334209	f	lobstertruckny
Happy Snow Day! see you @Redhooklobster in #redhook and @bkflea N5th &amp; Wythe on Saturday. #crustaceancelebration continues 4 2014 #clawsup	1388767711	419148277742075904	f	lobstertruckny
Happy New Year. Closed in #redhook till Saturday! #clawsup for 2014.	1388620487	418530774531710976	f	lobstertruckny
here's to a #lobsterrific NEW YEAR. open at #redhook LB 11-6. Fresh Live Maine #lobstah \n#crustaceancelebration See you soon! #clawsup	1388502296	418035047258947584	f	lobstertruckny
NYE is tomorrow. Open in #RedHook tmrw 11-6. Come &amp; get yo' #LOBSTAH fix #crustaceancelebration ?'s email cater@redhooklobster.com	1388415768	417672121167650817	f	lobstertruckny
#crustaceancelebration @bkflea N5 &amp; Wythe till 6pm see you there! #clawsup #bigred still on vacay! NYE orders cater@redhooklobster.com	1388331384	417318188725338112	f	lobstertruckny
#bigred still skiing #crustaceancelebration till 6pm @bkflea N5 &amp; Wythe NYE orders cater@redhooklobster.com #happynewyear	1388255860	417001421071220736	f	lobstertruckny
Get 'yo #lobstah  fix @bkflea N5 &amp; Wythe ALL DAY today 10-6 #crustaceancelebration #clawsup #bkflea	1388242908	416947095216873472	f	lobstertruckny
#bigred stopped to visit the #alpacas. back in the city on 1/7. #crustaceancelebration @bkflea N5 &amp; Wythe sat/sun 10-6. #clawup...	1388156677	416585415312019456	f	lobstertruckny
#bigred is up in #maine #shreddingthegnar for a couple of weeks she'll be back Jan. 7th Find us @bkflea N5th/Wythe sat &amp; sun 10-6. #clawsup	1388070080	416222200325476352	f	lobstertruckny
We are open an Front &amp; Old Slip one Block SOUTH of our original spot. Thanks guy who corrected us	1389373089	421687418748928000	f	korillabbq
At Front &amp; Slip just one block north of our original spot. Come catch us for lunch at 11:45	1389370471	421676438132359168	f	korillabbq
Lunch at FiDi's Front &amp; Gouverneur get ready!	1389362195	421641725577539584	f	korillabbq
Done at DUMBO! Catch us tomm yall	1389295693	421362793833857024	f	korillabbq
Dumbo! Jay &amp; Water ready @11:40!	1389284156	421314404874219520	f	korillabbq
Done for the day. Keep warm guys!	1389209532	421001408381739009	f	korillabbq
Catch is today for lunch at FiDi's Front &amp; Gouverneur	1389195861	420944069016428544	f	korillabbq
We here! On the corner of Charlton and Varick! Shout out to the homies at #weworksohowest	1389109172	420580470553075712	f	korillabbq
Come in bundles cuz we out here in SoHo! It's hot on the Korilla truck @WeWork	1389107661	420574131546234880	f	korillabbq
Headed to soho for lunch get ready y'all	1389105456	420564884611682304	f	korillabbq
Done for the day. Get them long coats ready for tomm!	1389037154	420278402931650560	f	korillabbq
Flatiron! 25th &amp; Bway ready at 12!	1389025999	420231618255937536	f	korillabbq
Headed to Flatiron's 25th &amp; broadway come hang out under the canopy!	1389020623	420209066477375488	f	korillabbq
Done for the day! Stay warm yall!!!	1388689771	418821375584120832	f	korillabbq
Midtown! 47th &amp; Park ready by 11:30!	1388679731	418779261282299904	f	korillabbq
DUMBO lot! Water st &amp; Jay st ready by 11:30! Closed tomm so get ur fill today!	1388679705	418779154394652672	f	korillabbq
@MDK5ADAY @tudorcity whereabouts exactly?	1388674208	418756096330039296	f	korillabbq
Headed to 47th &amp; Park and @DUMBOFoodTrucks Jay &amp; Water St!	1388674080	418755562919444481	f	korillabbq
Done for the day! Happy New Years yall	1388432810	417743599502360576	f	korillabbq
Flatiron! 25th &amp; Bway ready @11:30	1388419884	417689387405934592	f	korillabbq
new item on the menu ( not a moment too soon). turkey chili! a bumped up version of mom's with a little more kick. on the truck only 4 now.	1389378535	421710257912442880	f	milktrucknyc
Bessie's at Wall &amp; William, call (646) 504-6455 to pre-order or http://t.co/IwkqcCHPzF. Sandwich menu always at @HoustonHall_NY	1389366021	421657773424668673	f	milktrucknyc
RT @ThisIsStory: #TBT to when @bitterandesters decided to just brew it (in our store!) Check out their home brewing kit (or a class!) http:...	1389301849	421388616091578368	f	milktrucknyc
Bessie's at North End Ave &amp; Vesey, call (646) 504-6455 to pre-order or http://t.co/IwkqcCHPzF. Sandwich menu always at @HoustonHall_NY	1389279619	421295377715691521	f	milktrucknyc
Bessie's at 58th &amp; Mad, call (646) 504-6455 to pre-order or http://t.co/IwkqcCHPzF. Sandwich menu always at @HoustonHall_NY	1389193218	420932982333927424	f	milktrucknyc
correction:  we've kept the truck off the road today--but you can dine inside @houstonhallnyc hall &amp; have a sammie. out tom. @ 58th &amp; mad.	1389114178	420601466600976384	f	milktrucknyc
Bessie's at 22nd &amp; Park, call (646) 504-6455 to pre-order or http://t.co/IwkqcCHPzF. Sandwich menu always at @HoustonHall_NY	1389106816	420570588092985345	f	milktrucknyc
@Rosamapose hey rose, we're going to be at 22nd &amp; park tomorrow!	1389041457	420296449797013505	f	milktrucknyc
@Rosamapose we'll be at 22nd &amp; park tomorrow!	1389038007	420281982514233344	f	milktrucknyc
happy mooday! bessie's @ church &amp; lispenard for this fine grilled cheese &amp; soup weather. pre-order at 6465046455 or http://t.co/psDZsxYjzF.	1389020019	420206535542079488	f	milktrucknyc
truck out in tribeca today folks. 646 5046455 to preorder. stand w/mac bar &amp; grilled sammies running @bkflea 80 n. 5th (wythe) in w'burg!	1388853378	419507592051052544	f	milktrucknyc
10pm thurs from our roof. http://t.co/8AQTKzJbm5	1388784038	419216757895995392	f	milktrucknyc
staying in today--trying to keep our crew safe! bessie back out tom. in tribeca and stands @bkflea 80 N. 5th both sat/sun 10-6. stay warm!!	1388761287	419121333482823680	f	milktrucknyc
Bessie's at 58th &amp; Mad, call (646) 504-6455 to pre-order. Sandwich menu always at @HoustonHall_NY	1388415604	417671431967633408	f	milktrucknyc
Indoor stand at @bkflea @smorgasburg North 5th &amp; Wythe. Sandwich menu always at @HoustonHall_NY	1388329202	417309037097537536	f	milktrucknyc
smorgasburg http://t.co/7tD77PJPYo	1388263349	417032831194652672	f	milktrucknyc
Located on 49th between 6th and 7th	1385480434	405360440492175361	f	thepocketful
Find our indoor stand at @bkflea @smorgasburg North 5th &amp; Wythe. Sandwich menu always at @HoustonHall_NY	1388242801	416946645897474048	f	milktrucknyc
Bessie's back on the road at 58th &amp; Mad, call (646) 504-6455 to pre-order. Sandwich menu always at @HoustonHall_NY	1388156460	416584503356715009	f	milktrucknyc
Happy Holidays! Bessie's at home, resting up with her fam. Hope you all are, too!.	1387983656	415859714623148033	f	milktrucknyc
we're handing out free cups of hot chocolate in front of Trader Joes in BK @ Atlantic &amp; Court. Happy Holidays and Thank You Everyone!!!	1387907707	415541159990001664	f	milktrucknyc
Have a fantastic weekend! Thanks for the love FiDi!	1389382542	421727067596935168	f	polishcuisine
you have a fantastic weekend!!! thanks for the love downtown!	1389382513	421726944283987968	f	polishcuisine
Catch us on Water st b/w Maiden Ln and Pine! Spinach &amp; cheese pierogi on the truck today! Open until 2:30...	1389371807	421682041667989505	f	polishcuisine
Happy Friday! WE"RE BACK!!!! water street b/w Maiden Ln and Pine! OH YEAH! @downtownlunch	1389363047	421645296490532864	f	polishcuisine
happy thursday and thanks for coming! enjoy the rest of your day!	1389298453	421374371500810240	f	polishcuisine
We are open and ready to go at 55th and Broadway! #pierogitime	1389285869	421321590295388160	f	polishcuisine
RT @randomfoodtruck: Abundance of trucks must mean it's getting warmer! @PolishCuisine @CarpeDonutNYC @mikenwillies @Redhooklobster @TheSte...	1389282283	421306548158492672	f	polishcuisine
We are back on Broadway and 55th today! @midtownlunch @nystfood  @randomfoodtruck	1389278719	421291602297245696	f	polishcuisine
wrapping it up! thanks so much for coming!	1389208891	420998722596909057	f	polishcuisine
awesome lunch found on corner of 47th and Park (heading towards lexington ave) -	1389200110	420961891880796160	f	polishcuisine
I posted a new photo to Facebook http://t.co/zptqq3Gy45	1389199056	420957469897400320	f	polishcuisine
I posted a new photo to Facebook http://t.co/B9a58EYMfR	1389198740	420956145402916864	f	polishcuisine
Come one, come ALL - we are OPEN! corner of 47th and Park Ave @midtownlunch if your stomach is happy, you are happy:)	1389197983	420952970164178944	f	polishcuisine
Hello Midtown East - we are back on 47th and Park today!	1389192490	420929930952966144	f	polishcuisine
thanks for coming! stay warm!	1389124861	420646274388729856	f	polishcuisine
@randyyeip Thanks for battling winter and stopping by for lunch!\nstay warm #pierogitime	1389124827	420646132188864512	f	polishcuisine
RT @randyyeip: Not even polar vortex could keep me from kielbasa and pierogi. Thanks @PolishCuisine!	1389124796	420646002010640384	f	polishcuisine
layer up OR....stay warm with our Smokin' hot grilled kielbasa and pierogi on 52nd b/w 6th and 7th! @midtownlunch #pierogi	1389112700	420595265222230016	f	polishcuisine
Throw back this cold with us on 52nd b/w 6th and 7th - did anyone say ggggrrrriiiillllleeeedddd kielbasa?	1389105664	420565756552966145	f	polishcuisine
We miss our fans but heavy rain is a bad combo - hope to be back on the road tomorrow! stay dry!	1389022577	420217263430840323	f	polishcuisine
Back at it for lunch on a Friday. 50th n 6th with some yummy sliders n fries. #Slidernation report	1389371412	421680383500238848	f	mrniceguytruck
Testing 123	1388235518	416916099721351168	f	mrniceguytruck
50th n 6th for lunch with your favorite sliders!	1388160612	416601920200265728	f	mrniceguytruck
@24hrLU: Bodega Bamz looks back on 2013 via @remezcla http://t.co/1l4XuCz7jk #Tanboys	1387922979	415605214054739968	f	mrniceguytruck
 http://t.co/p4FNmCixUE	1387471574	413711887193624577	f	mrniceguytruck
 http://t.co/8OgaY94jnA	1387381249	413333032767348736	f	mrniceguytruck
Back at it. 49th n 6th for lunch today. #Sliders #Fries	1387381157	413332650100023297	f	mrniceguytruck
 http://t.co/Qkp5GxSKPR	1386863509	411161475575971840	f	mrniceguytruck
Your favorite sliders n fries today on 47th n Park. Beat the cold and call in your orders 917-532-2347	1386861262	411152049200721921	f	mrniceguytruck
RT @ErikNoren: Trying out the sliders and fries from @MrNiceGuyTruck today. The Classic and the Bacon &amp; Cheese sliders are awesome! http://...	1386799116	410891391674621952	f	mrniceguytruck
Back at it. 49th N 6Th for lunch rush	1386772837	410781169991831552	f	mrniceguytruck
@LIVINGPROOFNYLA need a contact Email or #  Email addy on site says mailbox full	1386336713	408951933987471360	f	mrniceguytruck
 http://t.co/H6jjOt0ueN	1386255668	408612005751574529	f	mrniceguytruck
Out for lunch today. 47th n Park ave.	1386255504	408611318372261888	f	mrniceguytruck
49th N 6th with your favorite sliders today!	1386082311	407884892878692352	f	mrniceguytruck
56th n Bway for lunch.. Windows up!	1386002479	407550056209059840	f	mrniceguytruck
RT @randomfoodtruck: No point in slowing down now--keep the feast going with @MrNiceGuyTruck @bigdsgrub @sweetchilinyc @gcnyc1	1386002462	407549983383375872	f	mrniceguytruck
Sat shopping with the Nice Guys. Prince n Bway #SohoFlow http://t.co/oap4Bn4AQw	1385832047	406835210379333632	f	mrniceguytruck
Window's open! 50th &amp; 6th! Get your shop on then grub on! #sliders #fries #chimmi #classic #turkey... http://t.co/tkAlEUsjCV	1385742981	406461638985142272	f	mrniceguytruck
Chillin with these good folks tomorrow! http://t.co/AcLiT4U1rD	1385515889	405509146906066944	f	mrniceguytruck
The sun is not even up and we are already stationed at 51st at the corner of Park Ave for your lunch;)	1389355043	421611728066318336	f	seoulfoodnyc
We just rolled up to 68th and Broadway! Let's do this!	1389302604	421391783780950017	f	seoulfoodnyc
It feels like summer!!!\nCome have lunch with us On 51st between Park and Madison Avenue!!	1389273787	421270913812672512	f	seoulfoodnyc
It is lunch time!!!\nWe are at 51st between Park and Madison!!!	1389028238	420241007809024000	f	seoulfoodnyc
Don't let a little rain get you down! We are at 67th and Broadway in the front door of Apple Store !! Come and get your food on!!	1388939845	419870259135643648	f	seoulfoodnyc
We just landed !! We are in front of the apple store at 67 and broadway! Come and warm up with some delish food!	1388852326	419503179655823360	f	seoulfoodnyc
What day is today?\nAll I know is we are ready to serve you at 67th and Broadway , in front of the Apple store!!	1388700226	418865226831106048	f	seoulfoodnyc
Your tummy is empty?\nTime to head over to 51st between Park and Madison Avenues for some delicious Seoul Food!!!	1388674360	418756733603807233	f	seoulfoodnyc
Get some chow, before you get your drink on!!\nTruck is at 68th and Broadway, Outside the theatre across from the... http://t.co/oOUdGSnRTE	1388519678	418107954060337152	f	seoulfoodnyc
We just landed in front of the Apple store at Broadway and 68th! Skip on over here an have some delicious food!	1388441629	417780591841804288	f	seoulfoodnyc
Our food truck is at 19th and 5th avenue ....BOOM! http://t.co/F5Yez0w68Y	1388413897	417664272676573184	f	seoulfoodnyc
@threefour that's why it's sad :(	1388681277	418785748012531712	f	veganlunchtruck
Our Truck is at 51st street between Park Ave and Madison Ave ....\nWhat are you waiting for???? http://t.co/vzhkcuL0uk	1388160035	416599501403852800	f	seoulfoodnyc
Buy an IPhone and eat some yummy food!\nWe are parked on the Corner 67th and Broadway outside Apple Store and Lincoln Square Cinema	1388091635	416312610208747520	f	seoulfoodnyc
It is lunch time and we are at 46th street between 5th and 6th!!! If you are gonna eat, you might as well eat yummy food!!!	1388074482	416240663462559745	f	seoulfoodnyc
Yummy food on the UWS #now! We are at the Corner of 75th and Amsterdam Ave by the BeaconTheatre !!!!	1387735811	414820175402528768	f	seoulfoodnyc
I bet you want us to tell you where we are right now????\n7th ave south at Christopher Street !! Come and get it!	1387642844	414430243005284352	f	seoulfoodnyc
Our truck is begging for Santa to do a drive by! http://t.co/HDSBZVIXJJ	1387584878	414187118374580224	f	seoulfoodnyc
How can you have any pudding, if you don't eat your meat???\nWe are at NYU on West 4th Street and Mercer Street right now and for din din!!	1387574587	414143952732712961	f	seoulfoodnyc
This just in;\nCops and Con Edison made us move truck.\nWe are on 52nd at the corner of Madison Ave now open for business	1387555284	414062990846341120	f	seoulfoodnyc
TgIF!!!!\nCome and get your lunch on!\nWe are at 51st and Madison Ave !!!	1387550560	414043174718668800	f	seoulfoodnyc
#FF @biandangnyc  @domotaco @dumbolot #followfriday	1389370700	421677398808338432	f	mooshugrill
Finishing up our first week back on 49th &amp; 6th ave! Swing by if you missed us, the #stickyrice is extra sticky! #pekingduck is extra ducky!	1389358887	421627849318346752	f	mooshugrill
@alhernandez76 @randomfoodtruck @midtownlunch @cheap_eats nice strategy!	1389322763	421476336210034688	f	mooshugrill
45th &amp; 6th ave today! Running a little late but will be open by 12!	1389279160	421293448868921344	f	mooshugrill
#Lucky8 (degrees) on 55th &amp; Broadway today! Lunch AND dinner covered! @randomfoodtruck @midtownlunch @cheap_eats http://t.co/AYatGVBGPr	1389188217	420912007425294336	f	mooshugrill
Stay toasty #nyc!	1389113053	420596746583285760	f	mooshugrill
Sup #DUMBO:) back at it in @dumbolot today! @DUMBOFoodTrucks @DumboNYC	1389018796	420201404603858945	f	mooshugrill
@matthewpizzulli glad to have #fans like you! http://t.co/JUpO4QBDNC	1388701330	418869853945348097	f	mooshugrill
RT @JerryTauber: @srubenfeld @MrDavidGordon Five spice pork at MOO-SHU is delicious dish @mooshugrill	1388689313	418819452776759296	f	mooshugrill
Happy New Years! We're on the streets for the first time since last year on 45th &amp; 6th! #cornyjokes #everyNYE @midtownlunch	1388664800	418716639652495360	f	mooshugrill
Last chance to get #MSG this year on jay &amp; water! @dumbolot @DUMBOFoodTrucks @DumboNYC @DUMBOBID	1388416059	417673342649647104	f	mooshugrill
RT @EatThisNY: 5 meat dishes that kept me carnivorous #100Best list http://t.co/Y69tlm8z6t @mooshugrill @mulberryandvine @delaneybbq @Empel...	1387839311	415254283928764417	f	mooshugrill
"@biandangnyc: MSG! MSG! MSG! http://t.co/q2q4mK0wcg" thanks for the support! #bigsis	1387589139	414204987376672768	f	mooshugrill
The @notoriousmsg we gotta do some sort of collabo the possibilities are endless!	1387581228	414171805738631170	f	mooshugrill
"@funbunsnyc: Please vote for our homies @mooshugrill  !!!  http://t.co/XGWo5nn7SS" thanks for the love homes!	1387581117	414171340917448704	f	mooshugrill
@baileymichelle and peking ducks as well!	1387557027	414070303031959552	f	mooshugrill
Show some love and vote #MSG on @midtownlunch's best new food truck poll! Voted already? Then can I get a #RT :) http://t.co/FQvz0b8dm0	1387551207	414045888399831040	f	mooshugrill
It's positively balmy on 55th &amp; Broadway today! Come out and enjoy the beautiful weather with #mooshu! @randomfoodtruck @midtownlunch	1387546931	414027954981990400	f	mooshugrill
#fans &amp; #fam please vote for #MooShuGrill on @midtownlunch's best new #foodtruck of 2013 poll! http://t.co/FQvz0b8dm0 #nyc #RT #electionday	1387480850	413750791280001024	f	mooshugrill
@thelisareid and #pokemon cards as well as long as they're holographic!	1387480030	413747354169532416	f	mooshugrill
Just added Cigar City Jai Alai IPA on tap. http://t.co/PHJDSLq1gg	1389398644	421794604237979649	f	shortysnyc
47th &amp; Park for lunch.	1389285983	421322068928790528	f	shortysnyc
RT @unbuttoningpnts: Tried @shortysnyc today and we are scared it might become a habit...already thinking about what to order next time!  #...	1389212715	421014759216275456	f	shortysnyc
DUMBO! Were at Jay and Water St. #dumbonyc	1389196847	420948205291859968	f	shortysnyc
Just added Virtue RedStreak Cider on tap. http://t.co/aq2NmsNHhb	1389141690	420716858128355328	f	shortysnyc
Just added Virtue RedStreak Cider on tap. See our full beer menu: http://t.co/qan6zoyf3g @VirtueCider #BeerMenus	1389141688	420716853070417921	f	shortysnyc
Just added Cigar City Jai Alai IPA on tap. http://t.co/M6Z0j7SrJT	1389141651	420716697343889408	f	shortysnyc
Just added Cigar City Jai Alai IPA on tap. See our full beer menu: http://t.co/qan6zoyf3g @CigarCityBeer #BeerMenus	1389141651	420716695180029952	f	shortysnyc
Just added Victory Winter Cheers on tap. http://t.co/wnUwyUzWaX	1389141577	420716386801840128	f	shortysnyc
Just added Victory Winter Cheers on tap. See our full beer menu: http://t.co/qan6zoyf3g @victorybeer #BeerMenus	1389141577	420716384033984512	f	shortysnyc
Just added Sam Adams Rebel IPA on tap. See our full beer menu: http://t.co/qan6zoyf3g @ SamuelAdamsBeer #BeerMenus	1389141559	420716308674924544	f	shortysnyc
Just added Sam Adams Rebel IPA on tap. http://t.co/GJfbbQrLWk	1389141557	420716300210405376	f	shortysnyc
Just added Delirium Tremens on tap. http://t.co/l0S4xpPJ8X	1389141547	420716260326776832	f	shortysnyc
Just added Delirium Tremens on tap. See our full beer menu: http://t.co/qan6zoyf3g @Deliriumbrewery #BeerMenus	1389141546	420716255126249472	f	shortysnyc
Just added Smuttynose Winter Ale on tap. http://t.co/e8NfoCcyi8	1389141545	420716249270996993	f	shortysnyc
Just added Smuttynose Winter Ale on tap. See our full beer menu: http://t.co/qan6zoyf3g @smuttynosebeer #BeerMenus	1389141544	420716245940727808	f	shortysnyc
Just added Boulder Honey Of A Saison on tap. See our full beer menu: http://t.co/qan6zoyf3g #BeerMenus	1389141540	420716230992211968	f	shortysnyc
Just added Boulder Honey Of A Saison on tap. http://t.co/E7KMT5bsYQ	1389141539	420716226546262016	f	shortysnyc
Just added Troegs Hopback Amber Ale on tap. See our full beer menu: http://t.co/qan6zoyf3g @TroegsBeer #BeerMenus	1389141278	420715133380591616	f	shortysnyc
Just added Troegs Hopback Amber Ale on tap. http://t.co/NulcqYuvOI	1389141278	420715131354361856	f	shortysnyc
Wishing everyone a happy &amp; healthy New Year! We miss you all &amp; look forward to being on the road again on Jan 12th :)	1388504101	418042617168138240	f	toumnyc
@DaisyMaxey Aww! We'll be back before you know it :) Jan 12th is our first day back on the streets. One month away :)	1386867819	411179553659183104	f	toumnyc
We may not be around, but that doesn't mean you shouldn't have a delicious virtual beef kabab! See you in January :) http://t.co/9HK5isb7X0	1386862206	411156011450257409	f	toumnyc
Happy hump day! We miss lunching with you #MidtownEast ! We'll be back before you know it :)	1386773174	410782583182880768	f	toumnyc
Join us on our last day before our holiday break through January 12th. We're hanging with the snowflakes on 46th btwn 5th &amp; 6th until 3pm :)	1386686269	410418077038546944	f	toumnyc
Were at #BeerFest today at Skylight One Hanson in #Brooklyn! Plenty of pours and #shawarma to go around.. Join us until 11pm!	1386431526	409349607714750464	f	toumnyc
RT @DispatchBP: . @BrookfieldPlNY NORTH Lot | Dec. 6th | @MorrisTruck @BigDsGrub @Mexicue @SchnitznThings @ToumNYC | N. End Ave. &amp; Vesey | ...	1386343735	408981387346444288	f	toumnyc
It's #FalafelFriday on North End &amp; Vesey St until 3pm then off to BeerFest at Skylight One Hanson! Get tickets here: http://t.co/isK5WuK5i6	1386342553	408976428597006336	f	toumnyc
RT @dumbolot: We got @ToumNYC @MexicoBlvd in the lot today, see for yourself on @Datalot's new webstream! http://t.co/XC7S3zNuCr	1386257445	408619460845895680	f	toumnyc
Don't let a little fog stand in the way of your #LebaneseLunch! Join us on Jay &amp; Water St in @DumboNYC &amp; get that kafta you've been craving!	1386254743	408608125336702976	f	toumnyc
Find us Dec. 6th &amp; 7th at BeerFest! Chase a beer with shawarma goodness. Get your tickets here: http://t.co/isK5WuK5i6 #LSBeerFest #tapthis	1386194702	408356294761140225	f	toumnyc
Sorry #MidtownEast, they're filming a movie on our usual block today, so we moved to #Flatiron on 5th Ave &amp; 18th St. #LebaneseLunch	1386169759	408251679319273472	f	toumnyc
After a nice long break, we're back on the road in #MidtownWest today! Join us on 46th btwn 5th &amp; 6th for a yummy #LebaneseLunch	1386078183	407867579764850688	f	toumnyc
@FBachalany hehe I'm assuming autocorrect is to blame, and you meant shawarma?!	1385832102	406835441162534912	f	toumnyc
We're starting our Thanksgiving break from today. We'll be back on the road next Tuesday. Hope everyone has a great gobble gobble!	1385560597	405696665195405312	f	toumnyc
Deciding on lunch just got easier! We're on 46th btwn 5th &amp; 6th today &amp; the #shawarma is roasting! Pre-ordering is available at 917-TOUM-350	1385475496	405339726582132736	f	toumnyc
@NormaNorteg4 @FoodBank4NYC You are most welcome. It was truly our pleasure!	1385470327	405318048321929216	f	toumnyc
Today was a great success! Happy to be a part of something that helps so many! @FoodBank4NYC http://t.co/PucnLkrvSB	1385416740	405093286974849024	f	toumnyc
@FoodBank4NYC It was our pleasure :)	1385416590	405092658135461888	f	toumnyc
We're working with the @FoodBank4NYC today, handing out 1000 free hot meals all over #NYC #givingback #NoPlaceLikeNY #StayWarm	1385389198	404977768624316417	f	toumnyc
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
Located on 49th between 6th and 7th. Free delivery at http://t.co/6h7IrKccpj	1389367240	421662885539233792	f	thepocketful
Located on 50th between 7th and 7th.\nOnline at http://t.co/6h7IrKccpj	1389280910	421300791618842624	f	thepocketful
We are open on 53rd between  Park and Madison. Free delivery at http://t.co/6h7IrKccpj	1389196741	420947758821179392	f	thepocketful
Happy Holidays to all. We will be closed I until next week	1388074223	416239577377296385	f	thepocketful
Located on 50th between 6th and 7th. Free delivery at http://t.co/6h7IrKccpj	1387467972	413696776408154112	f	thepocketful
We are closed today. Enjoy the snow and b safe.	1387302990	413004794484514817	f	thepocketful
Located on 55th between 6th and 7th. Online at http://t.co/6h7IrKccpj	1386948334	411517259463798784	f	thepocketful
Located on 50th between 6th and 7th. Online at http://t.co/6h7IrKccpj	1386861941	411154898852790272	f	thepocketful
Located on 53rd and Park Avenue, online ordering is available at http://t.co/gpHpwErWcG	1386780838	410814727862775810	f	thepocketful
Located on Hudson and King streets. Online at http://t.co/6h7IrKccpj	1386004676	407559270369345536	f	thepocketful
Loathed on Hudson and King streets. Online at http://t.co/6h7IrKccpj	1385397722	405013519214850048	f	thepocketful
Located on 55th street, between 6th and 7th and online at http://t.co/6h7IrKccpj	1385135166	403912281622593536	f	thepocketful
We couldn't park on 50, so we are on 49th between 6th and 7th.	1385050540	403557332183154688	f	thepocketful
Located on 53rd and PARK AVE. online at http://t.co/6h7IrKccpj	1384964715	403197358349221888	f	thepocketful
Located on 49th, between 6th and 7th. Order online at http://t.co/6h7IrKccpj	1384877320	402830794114482176	f	thepocketful
Beautiful day. Meet us on Hudson and King	1384794354	402482809547542528	f	thepocketful
Located on 55th, between 6th and 7th.	1384529082	401370178426257408	f	thepocketful
Located on. 50th, between  6th and 7th. Online at http://t.co/6h7IrKccpj	1384441920	401004594098356224	f	thepocketful
Located on corner of 53rd and Park. Order on line at  http://t.co/6h7IrKccpj  and your lunch will be waiting for you	1384360184	400661770488254464	f	thepocketful
@MatthewPizzulli glad you enjoyed it Matt! We will continue to bring it on board just for you :)	1389381738	421723691731677184	f	schnitznthings
Hi guys. The #schnitzcart is on 49th between 6th &amp; 7th aves from 11-2pm. Finish off the week strong with some delicious warm schnitzel:)	1389369948	421674243827707905	f	schnitznthings
RT @DispatchBP: . @BrookfieldPLNY NORTH Lot | Friday 1/10/14, 11a-3pm | North End Ave. &amp; Vesey St. | @MorrisTruck @Mexicue @SchnitznThings ...	1389368575	421668485052522496	f	schnitznthings
Greenwich st &amp; Park place it's a bit warmer today so come by for some schnitz. The cart is on location from 11-2pm. Hope to see you out	1389283188	421310345060581376	f	schnitznthings
Morning guys. 51st between park and madison the truck is coming to serve you guys from 11:30-2pm. You can preorder at 347-772-7341	1389282993	421309527234215936	f	schnitznthings
I know Jason! Ruined our day as well:(RT @hockeyfisch: @schnitznthings #ruinedmyday	1389138243	420702402988494848	f	schnitznthings
@NY_Observer yeah the cold weather messed the truck up:( we'll be back soon though	1389138194	420702197308203009	f	schnitznthings
Hope everyone is staying warm. The truck is still in the shop and won't be out tomorrow. The cart however, will be on 27th &amp; park as usual:)	1389137019	420697266153095168	f	schnitznthings
Guys, the truck had a mechanical breakdown so we won't be out today. Taking it to the mechanic right now. Hope to be out tomorrow!	1389109925	420583626016043009	f	schnitznthings
52nd between 6th &amp; 7th the truck is coming to sling warm schnitzel! It's cold and windy out but you can preorder at 347-772-7341! 11:30-2pm	1389107289	420572570078154752	f	schnitznthings
Get through this cold weather with some schnitz! The cart is on Greenwich st &amp; Park place. Come by and warm up with us 11-2pm	1389107052	420571578368548864	f	schnitznthings
Hi guys, the #schnitztruck is parked on Charlton and Varick sts from 11:30-2pm. This goes out to all of our Hudson and King peeps. Come by!	1389024790	420226545832427520	f	schnitznthings
Morning guys. We've missed you. #schnitzcart will be on Greenwich st &amp; Park place from 11-2pm. Nothing better than schnitzin in the rain:)	1389021810	420214047116910592	f	schnitznthings
@MaximoLopezMay greetings from cold NYC!! It was indeed great fun, and because of your show, we've had so many people come from Argentina!:)	1388881084	419623799152459776	f	schnitznthings
RT @MaximoLopezMay: @schnitznthings greetings &amp; happy new year from Argentina! I still remember the great time we had while filming a tv sh...	1388881022	419623539743137792	f	schnitznthings
Get some schnitz before the storm. Only the truck will be out today. Cart is off. Truck is on 51st b/w park &amp; mad. Preorder 347-720-9184	1388674912	418759049875038208	f	schnitznthings
We hope everyone has a safe and happy New Years Eve tonight!	1388504459	418044118187520000	f	schnitznthings
@RachelMapstone we usually keep the same locations week to week. Please check our website and click the blog link for weekly schedule:)	1388504382	418043797013291008	f	schnitznthings
Hi Terry, the truck should be there today RT @terrymakes: @schnitznthings Is the truck trekking out to SoHo today?	1388422861	417701872078970880	f	schnitznthings
Truck is on Hudson &amp; King. Cart on Greenwich &amp; park place RT @Cachakate: @schnitznthings where a u guys going to be today?	1388422834	417701760787288065	f	schnitznthings
@eatmypies awwwww shucks.  Glad you loved it 	1389309705	421421567261044736	f	veganlunchtruck
Leaving tomorrow night to be in Paris with my dad who I love a lot.  \n\nAny vegan restaurants, or yoga spots I should definitely hit?	1389280113	421297448372674560	f	veganlunchtruck
@benapplegate nah- that's what it's like in the fall.  Now its 30 inside instead of 15	1389193629	420934708835672064	f	veganlunchtruck
@MonikaNYC sure.  But they really aren't very processed.  Look them up.  Totally natural and not bad for you.	1389115309	420606208450379776	f	veganlunchtruck
We already miss you so much perry.  NYSF was one blog I read daily. RT @nystfood: Thank you and goodbye! http://t.co/RbiNWB9tZp	1389102765	420553595290144768	f	veganlunchtruck
@CleanBurnCandle its in there.  With a few fun variations too	1389069795	420415309833842689	f	veganlunchtruck
As per popular request, here's a breakfast recipe from the cook book I'm currently working on!\n\nBOURBON PECAN... http://t.co/bQyFF84dsc	1389049926	420331974801510401	f	veganlunchtruck
Can anyone recommend a commercial dishwasher repair tech in NYC?	1389013894	420180843936874496	f	veganlunchtruck
Thinking about sharing a recipe from the cookbook I'm working, just for fun.\n\nWhat would you guys want the most:... http://t.co/xQbTQem0m9	1388883120	419632338012631040	f	veganlunchtruck
This is what "free range" looks like.\n\nIt's 2014. Time to start eating plants folks. http://t.co/JqJjl4Ln1s	1388863766	419551162824937473	f	veganlunchtruck
Spent New Years camping in the woods with my fam.  Always a nice time to unplug, reflect &amp; eat @SWEETandSARA s'mores http://t.co/Rf9pJek1i6	1388851478	419499621111836672	f	veganlunchtruck
@veganCLEF email your resume to thecinnamonsnail at gmail	1388797303	419272393744744448	f	veganlunchtruck
We are on break for another month or so. Follow us here or at http://t.co/wou6lkma5l for locations\n\n@andregodfrey21 @FuckinPoe	1388797251	419272178228809728	f	veganlunchtruck
We are looking for some passionate vegan cooks, and aspiring cooks for rock the streets of NYC in 2014.\n\nWe can... http://t.co/c6QS81NevL	1388706380	418891038984392705	f	veganlunchtruck
RT @thelittleidiot: i guess this is the big question: is supporting the meat industry in line with your values, your ethics, and how you se...	1388704116	418881539439886337	f	veganlunchtruck
@cestmoi15 @midtownlunch i agree. @TaimMobile is my fave place to eat in ANY part of NYC -or earth in general	1388697375	418853268983648256	f	veganlunchtruck
Wtf @midtownlunch when are we going to see a "best vegetarian"?	1388685609	418803917338992640	f	veganlunchtruck
Dear Thursday:\nI walked by this yesterday.  \n\nWhat is this picture, and why is it sad?  http://t.co/5LNsTJjxac	1388677052	418768026713214976	f	veganlunchtruck
So excited to be making better vegan food than ever before, for more people, in more neighborhoods in 2014!\n\n2013... http://t.co/CLXupQWq5a	1388588449	418396398833659905	f	veganlunchtruck
RT @EmilyARupp: Yucca fries &amp; spicy pork was on POINT today @bigdsgrub! Always perks my day to get lunch from you guys!	1389301595	421387549891117056	f	bigdsgrub
Free yucca fries today!! LET'S GOOOO!!!!	1389288000	421330527913013248	f	bigdsgrub
50th Street btwn 6th and 7th Avenue, but you already knew! Preorders call 646-543-BIGD #MidtownWest	1389276939	421284133445595136	f	bigdsgrub
Get those Preorders in for pickup!! 646-543-BIGD @randomfoodtruck	1389198192	420953845402198016	f	bigdsgrub
It's #MidtownWest Wednesdays at Broadway and 55th Street! Join us or beat the cold and Preorder for pickup 646-543-BIGD @randomfoodtruck	1389190639	420922165559832576	f	bigdsgrub
Join us in #MidtownWest tomorrow for lunch! Yes, operators will be standing by..	1389138353	420702864307388416	f	bigdsgrub
We're hibernating today...stay warm #NYC!  Back out manana!	1389103628	420557213825257472	f	bigdsgrub
@cheaptriathlete this is new news to me. I hope nobody got hurt today!	1389072051	420424772418555904	f	bigdsgrub
@cheaptriathlete WHOA!! Come again?	1389045937	420315244079366145	f	bigdsgrub
Keeping people literally sane maybe? RT @cheaptriathlete: @bigdsgrub what's going on out there?	1389037679	420280607596617728	f	bigdsgrub
@villadh @Jbliss1 it's was written and you predicted it!!	1389037580	420280190435356672	f	bigdsgrub
RT @broelaine: tacos from @bigdsgrub very literally just brought me down from the edge of a full blown panic attack. in top form today, gen...	1389034848	420268733433937922	f	bigdsgrub
@1337Ryan here today	1389032747	420259920731451392	f	bigdsgrub
Lunchtime Grub awaits you #MidtownWest! We've got what you need at 50th Street btwn 6th and 7th Ave, now till' 2:30pm Preorders 646-543-BIGD	1389027111	420236280484864000	f	bigdsgrub
Change of plans... Join us at 50th Street btwn 6th and 7th Avenue. Preorders call 646-543-BIGD #MidtownWest	1389022775	420218095308128257	f	bigdsgrub
Come n' Grub today at 55th Street and Broadway. 11am to 2:30pm. Preorder lunch for pickup call 646-543-BIGD #MidtownWest @randomfoodtruck	1389016223	420190612718358528	f	bigdsgrub
@SeanTyas making Sunday more enjoyable w/ #TytaniumSessions #asos @SIRIUSXM	1388949431	419910467050799105	f	bigdsgrub
CLOSED today due to a LITTLE snow. See you Monday? Be safe and have a wonderful weekend!	1388767006	419145320648679424	f	bigdsgrub
@1337Ryan They lied!	1388677371	418769364469702656	f	bigdsgrub
RT @1337Ryan: @bigdsgrub *Shaking fists angrily at the heavens*	1388677226	418768754097803264	f	bigdsgrub
@JannaDG we've tried a few times, but that neighborhood is one tough cookie. Might try again sometime	1389378430	421709817070518272	f	nautimobile
[tweet about weather] .. Over it... Don't give in, come out for the best meal of food you will ever taste. 46th and park.	1389364480	421651310287810560	f	nautimobile
Don't you miss 90's band names like "Toad the Wet Sprocket"... and others? Us too. 23rd and park	1389281490	421303222079590401	f	nautimobile
If you close your eyes it feels like you are at the North Pole.  No matter, 46th and Vanderbilt today	1389192758	420931052870565888	f	nautimobile
Back to normal this week. 46th and park Wednesday &amp; Friday. 23rd and park Thursday!	1389042991	420302885352902656	f	nautimobile
@JamesSpier Wednesday!	1389041487	420296576977092608	f	nautimobile
Icicles are falling off of the apple store here at 67th and broadway. Potential free iPads for the brave.	1388946569	419898464437551104	f	nautimobile
Steamy soothing clam chowder.. Hot melty grilled cheese. Friendly handsome crew. 67th and broadway. #adjectives	1388849082	419489570502475777	f	nautimobile
All weekend at 67th and broadway! Ready to get back on the road.	1388785677	419223632330907648	f	nautimobile
We do love playing in the snow, but this is going to be too much on our poor Nauti. We are going to take one more day off tomorrow :(	1388715323	418928544610537472	f	nautimobile
Happy New Years friends. We will be back at 46th and park this Friday! Miss you xoxo	1388517211	418097604095123456	f	nautimobile
@sorceresssoul after the new year. We will tweet exact date and location next week!	1388191927	416733263739494400	f	nautimobile
Nauti is taking a break until 2014. Thanks to everyone for making this year what it was. We honestly appreciate it more than we can say.	1387854407	415317604753215488	f	nautimobile
Does this freakishly warm weather give anyone else an extreme sense of impending doom? Talkin' geopolitics at 67th and broadway	1387731037	414800153338732544	f	nautimobile
RT @TheGrayMatter: @NautiMobile Even cold my Lobster Roll was #awesomeness!!! http://t.co/Ml1S98Nwm7	1387686719	414614266910892032	f	nautimobile
67th and broadway today and tomorrow, lunch and dinner.. Get fed up during your last minute holiday shopping	1387639946	414418089879797761	f	nautimobile
Wow everything's comin up milhouse for us this morning @GregorysCoffee: First ever truck to win Coffee Movie Trivia!	1387554224	414058545475518464	f	nautimobile
Take a peek in the background of the trailer for the new Cameron Diaz flick.. Signing autographs at 46th and park http://t.co/pv4QacxT8M	1387554107	414058054762905600	f	nautimobile
@GregorysCoffee That would be Harry and Marv from home alone, up to no good as per usual	1387553936	414057338002472960	f	nautimobile
We are melting butter and toasting buns in anticipation for your arrival at 23rd and park. We can't wait to see you.	1387468324	413698255806283776	f	nautimobile
RT @YouGotSmoked: Today we are on Water St and Wall St from 11:00 to 3:00!	1389374143	421691837116866560	f	miamimachinenyc
RT @YouGotSmoked: Check us out today on Wall St and Water St in #fidi from 11:00 to 3:00! #followthesmoke See you then!!! http://t.co/6LUz8...	1389286859	421325742107283456	f	miamimachinenyc
RT @YouGotSmoked: We are back! @dumbolot 11:00 to 3:00!	1389186845	420906253154799616	f	miamimachinenyc
RT @YouGotSmoked: Ready to get smoked with our new menu? http://t.co/4ehQVCO40w	1389037615	420280336954974208	f	miamimachinenyc
RT @YouGotSmoked: Had to move to Varick At and Vandam St sorry!	1387560066	414083048008060930	f	miamimachinenyc
RT @YouGotSmoked: #tribeca get ready to be smoked! ( by BBQ that is ) check us out today for the first time on Varick St and Charlton St fr...	1387549231	414037602782969856	f	miamimachinenyc
RT @YouGotSmoked: Attention #fidi we are back! Wall St and Water St from 11:30 to 2:30 with some Amazing BBQ! See you then!	1387470752	413708435767955458	f	miamimachinenyc
RT @YouGotSmoked: Shredded Barbecue Skirt Steak - Arugula / Tabasco Onion Strings / YGS Signature BBQ Sauce / #comeandgetit http://t.co/RrW...	1387470746	413708413974376448	f	miamimachinenyc
Herro 50th and 6th, New York. Today is Toast Monster's last day of the year. Stay toastie! Keep it breezy! Rawr!	1384529054	401370061837201408	f	toastmonsternyc
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
RT @DispatchBP: . @BrookfieldPLNY NORTH Lot 11/07/13: @fritesnmeats @MiamiMachineNYC @Palenquefood @milktrucknyc @TaimMobile - N. End Ave. ...	1383837070	398467670947135488	f	miamimachinenyc
Happy hump day!! Celebrate midweek with the help of the one, the only Miami food machine at south end ave and liberty st @brookfieldplny	1383755350	398124910507491328	f	miamimachinenyc
Oh January... Soups today are Potato Leek and Rustic Chicken. Serving through lunch on Front St &amp; Jay in #DUMBO @DUMBOFoodTrucks	1389367051	421662093965021184	f	thesteelcart
56th &amp; Broadway, finally! Treat yourself to a Potato Leek soup on this balmy 30 degree Thursday! @randomfoodtruck	1389276021	421280282676051968	f	thesteelcart
@chrupertr Hi Rupert! We should be back next week, weather permitting.	1389217183	421033500918415360	f	thesteelcart
My goodness it's cold. You need soup! Spicy Black Bean / Split Pea with Ham / Mushroom Barley.  - Front St &amp; Jay in Brooklyn today.	1389194106	420936708612702209	f	thesteelcart
@JayeRose13 Sorry Jaye, weather today's a bit dangerous. Hope to see you on Thursday.	1389110056	420584177562836992	f	thesteelcart
9 degrees is just slightly past our threshold. Sorry Broadway/56th, we'll see you on Thursday. @randomfoodtruck	1389109927	420583635398717440	f	thesteelcart
RT @TheOnion: For the toastiest spot in the house, head to the fireplace and crawl under burning logs | Tips For Keeping Warm http://t.co/2...	1389064821	420394448405946368	f	thesteelcart
RT @aatunke: @TheSteelCart is too good. http://t.co/YGTmRGe26Y	1389026172	420232341664301056	f	thesteelcart
We're open in #Dumbo. Soups are Split Pea w/ham &amp; Organic Mushroom Barley.\n@DUMBOFoodTrucks	1389020222	420207385584873473	f	thesteelcart
This barrage of Boxing Days and blizzards has to end at some point.. The Cart will be back out as soon Mr. Plow shows.	1388767020	419145380320641024	f	thesteelcart
@JayeRose13 Miss you too! We'll be back to our regular schedule Tuesday.	1388687283	418810938259931136	f	thesteelcart
RT @biggayicecream: Thinking so much about what I hope 2014 has in store for each of you... I summed it up with a graphic. http://t.co/fCkW...	1388625732	418552776101474304	f	thesteelcart
@Derek__Jay Had to shut down today. Sorry. Will be back in DUMBO later this week.	1388420253	417690934164615168	f	thesteelcart
RT @heyalissatt: @TheSteelCart that ham, egg and cheese sandwich was eye-crossingly good!! Thank you so much!!	1388165193	416621134113964032	f	thesteelcart
@heyalissatt Thanks for stopping by! We're loven' the drunken' noodle.	1388165173	416621051876220928	f	thesteelcart
In case you didn't get enough holiday ham, we've got you covered on Front St &amp; Jay in #DUMBO . @DUMBOFoodTrucks	1388156305	416583856243105792	f	thesteelcart
This lil Xmas Cart will be on Front St &amp; Jay today through lunch. Soups?! Organic Vegetable Barley &amp; Split Pea w/ham. @DUMBOFoodTrucks	1387808095	415123355038408704	f	thesteelcart
Tis the start of a happy holiday on Front Street &amp; Jay. Soups today are Split Pea+ham &amp; Organic Lentil (vegan). @DUMBOFoodTrucks #DUMBO	1387552573	414051620939644929	f	thesteelcart
Street cafes in Sweden clearly put our Christmas spirit to shame. Next year we promise to have more lights. ;) http://t.co/UT2sijhgL1	1387510197	413873881594601472	f	thesteelcart
We're on! - 56th &amp; Broadway.	1387464771	413683351094968321	f	thesteelcart
#JuliaChild: People who love to eat are always the best people. Thank y'all for making 2013 for us. Cheers #bestof13 #HappyNewYear	1388514079	418084469481148418	f	toastmonsternyc
TM closed still, apologies! Prep for new year = fighting false NYPD charges. Thanks #nypd #nyfinest #HappyNewYear http://t.co/2Dyqr9ZiW8	1388426836	417718542083956736	f	toastmonsternyc
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
Last week for Toast Monster 50th and 6th. It's been toasty.	1384442434	401006753124737024	f	toastmonsternyc
Rawr! 47th and Park.	1384362059	400669632513593344	f	toastmonsternyc
Toast Monster spotted somewhere in Midtown. #midtown #lunch #toastmonster	1384358200	400653448120508418	f	toastmonsternyc
50th and 6th, find Toast Monster making new friends in front of chase bank.	1383921298	398820947849129985	f	toastmonsternyc
Wawr! http://t.co/NpvBsCVCw6 ahh... retreat!	1383839594	398478258091487232	f	toastmonsternyc
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
RT @mike_cbsradio: Back to back steak sandwiches! Today @BigMikeCBS dives into a 12 incher &amp; fries from @steaksNcrepes #SamturLunch http://...	1370614388	343007724520472576	f	steaksncrepes
Check out our Winter Menu@ http://t.co/Ni4Pprlxv7 #tassty #veganlunch @billclinton @theellenshow @unclerush http://t.co/CAFEvS8U7I	1389372407	421684554932318209	f	thegreenradish1
Catch our New Vegan Mac and Cheese before it sells out today....@nymetro @nytimes @UncleRUSH  @BobbiBrown  @TheEllenShow @UniversalMG	1389356881	421619435091144705	f	thegreenradish1
Your #organic #veganlunch is on 56th&amp;Bway Today, Friday, 11to2pm, #midtownlunch @victoriassecret @randomhouse	1389353906	421606958416678912	f	thegreenradish1
RT @DaniB127: Thanks @thegreenradish1 for my yummy lunch. I devoured my black bean burger. Can't wait to try more. Hope you keep visiting m...	1389298946	421376440220020736	f	thegreenradish1
RT @peacedumpling: Nobel Prize Winning Economist Predicts Rise of #Veganism in 2014 http://t.co/YsZAeQS4V9	1389272616	421266000777318400	f	thegreenradish1
New Vegan Mac&amp;Cheese Today! @nymetro @nytimes @theellenshow @rickygervais @UncleRUSH @BobbiBrown @RollingStone @AtlanticRecords @peta	1389270926	421258914726821889	f	thegreenradish1
G-Rad in NYC today, Thursday, #tasty #veganlunch 52nd&amp;6th Ave. 11am to 2pm #govegan	1389270402	421256715485458432	f	thegreenradish1
@thegreenradish1 Frozen Radish, truck wouldnt start today, Wednesday, #sorry 38th!  Weather permitting, still... http://t.co/LRO4Z9r3Gu	1389180350	420879011741323264	f	thegreenradish1
RT @VegetarianZen: Oh how I love food trucks and ESPECIALLY a vegan one! http://t.co/labIJkgSlO	1389173748	420851319705182208	f	thegreenradish1
@fakelifeLarry we sold on Saturday's @montclair farmer's market, will be there in the spring...presently, just in nyc during the week....	1389145046	420730934476812289	f	thegreenradish1
Catch G-Rad @ The Pre Super Bowl Party, Winter Blast...http://t.co/vSyvQyBDEe http://t.co/nZQHABk8a5	1389099469	420539773648785408	f	thegreenradish1
@rangerjoe80 Hopefully soon...It's on our G-RADar...	1389068882	420411479192379392	f	thegreenradish1
..Get Rad in 2014!!! #veganlunch #midtownlunch @nymetro @nytimes @theellenshow @BobbiBrown @grubstreet	1389064557	420393339070849024	f	thegreenradish1
@thegreenradish1 will be serving #veganlunch \nWed-38th&amp;BWAY\nThurs-52nd&amp;6thAve\nFriday-56th&amp;Bway\nAll days 11am to... http://t.co/ocRDjqxTz9	1389064183	420391769574895617	f	thegreenradish1
@livingmaxwell says...http://t.co/x8Jn228Cbi http://t.co/XUHCUn3Rs6	1388861646	419542268115046400	f	thegreenradish1
@CleanPlates says...http://t.co/CbWmtKnGSn http://t.co/TRCzifAOrI	1388861447	419541434736197632	f	thegreenradish1
RT @livingmaxwell: If you love #vegan #organic food, you have to check out this FANTASTIC food truck in #NYC called The Green Radish http:/...	1388859800	419534528768909312	f	thegreenradish1
@TheEllenShow try our #tasty #vegan #organic #lunch http://t.co/Ni4Pprlxv7	1388625731	418552769910292480	f	thegreenradish1
@HealthyWay2Cook Sweet, Thanks!!! @HealthyWay2Cook	1388624464	418547454703714304	f	thegreenradish1
http://t.co/IhNzjytWze... http://t.co/BXTgAI2J73	1388624105	418545948608847873	f	thegreenradish1
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
50th st btwn 6th and 7th ave is where you want to be for some hot buns today !	1382536034	393010731006058496	f	funbunsnyc
50th st btwn 6th and 7th ave ! Get your buns on !	1382447628	392639930280984576	f	funbunsnyc
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
RT @AquariusGiants1: @fritesnmeats \nHappy New Year to my favorite food truck!	1389380856	421719993215381504	f	fritesnmeats
@AquariusGiants1 aww thx, happy new year:)	1389380848	421719960369778688	f	fritesnmeats
Hello FIDI peeps, lunch 2day @ 7 Hanover sq b/t water st &amp; pearl st. burger of the week THE PLOUGHMAN preorder 9172929226	1389366613	421660256306225152	f	fritesnmeats
Hello peeps, lunch 2day @ the wfc food truck lot @ north end &amp; vesey st. Burger of the week THE PLOUGHMAN preorder 9172929226	1389279822	421296226118942720	f	fritesnmeats
Hello soho! We r back @ Hudson &amp; king. Burger of the week THE PLOUGHMAN preorder 9172929226	1389192616	420930459200421888	f	fritesnmeats
Peeps, we r off the road today	1389109113	420580220710973442	f	fritesnmeats
Hello midtown peeps, lunch 2day. @ 50th st b/t 6th &amp; 7th av. Burger of the week THE PLOUGHMAN preorder 9172929226	1389019441	420204112089993216	f	fritesnmeats
FIDI Peeps due to the snow we will be off the road today	1388764571	419135108541472768	f	fritesnmeats
Peeps we will be off the road today	1388673090	418751408008343552	f	fritesnmeats
Happy New Year! A blessed 2014!! http://t.co/CMu82Xs9T5	1388553205	418248575823269888	f	fritesnmeats
Wishing all of our fabulous followers a happy new year. #BringItOn2014	1388516664	418095312419708930	f	fritesnmeats
Peeps - hope u are all getting ready to enjoy ringing in 2014 this evening. Here's to happy and joyous celebration!	1388495859	418008047337107456	f	fritesnmeats
RT @BenoitMB: @fritesnmeats \nNooooooo, I went my Friday super heroes burger ;)\nHave a nice Holiyday guys!\nTeddy	1388168445	416634773185232896	f	fritesnmeats
Fidi peeps, we r off the road until jan 2nd #HappyHolidays	1388154732	416577255947923456	f	fritesnmeats
Merry Christmas All!	1388013572	415985190759317504	f	fritesnmeats
Thanks @eatnycstreet for great review  http://t.co/Bc3mkcNI41	1389414746	421862137493852160	f	brooklynpopcorn
@justyniak @UncleGussys @bigdsgrub @schnitznthings @souvlakitruck @biggayicecream @PhilsSteaks hope every1 was good this yr!  Merry Xmas!	1387925608	415616242121445376	f	fritesnmeats
Wishing every1 a great Christmas Eve.  Hope u get what u want for Xmas tomorrow morning. #MerryChristmas	1387925406	415615396298104833	f	fritesnmeats
Hello midtown peeps, lunch 2day @ 50th st b/t 6th &amp; 7th av. Burger of the week THE SOUTHWEST FUSION. Preorder 9172929226 #happyholidays	1387809010	415127195334750208	f	fritesnmeats
Hello FIDI, lunch 2day @ 7 Hanover sq. b/t water &amp; pearl. burger of the week THE SOUTHWEST FUSION preorder 9172929226	1387551661	414047795495325696	f	fritesnmeats
Lunch 2day @ the wfc food truck lot on northend &amp; vesey st. Burger of the week THE SOUTHWEST FUSION BURGER preorder 9172929226	1387466675	413691338178428928	f	fritesnmeats
RT @DispatchBP: . @BrookfieldPLNY NORTH Lot | Friday 1/10/14 until 3pm | North End Ave. &amp; Vesey St. | @MorrisTruck @Mexicue @SchnitznThings...	1389376806	421703008804937728	f	morristruck
#TGIF baby! We're @BrookfieldPLNY for lunch from 1130-3! And if you work @DavidYurman we're in your office serving up a delicious lunch!	1389369777	421673524567093249	f	morristruck
Gosh, it's almost like summer out here, #midtown! Come rejoice in this reasonable weather at 51st &amp; Mad with a grilled cheese! 1130-3!	1389283510	421311695676399616	f	morristruck
We spoke too soon @DumboNYC! We're taking today off, but will return to satiate your grilled cheese cravings! #noonelikesfrozenplumbing	1389192563	420930237828845568	f	morristruck
We're keeping the truck out of this #polarvortex for the day, stay warm out there! Back in @DumboNYC tomorrow!	1389110109	420584400846594048	f	morristruck
#Midtown, baby! We're at 52nd &amp; 6th locked, loaded, and ready to feed you. Borrow your co-worker's 'brella and come see us.	1389030923	420252270769754112	f	morristruck
Alright #midtown, time to get into the 2014 routine! We're at 52nd &amp; 6th ready to feed you! #noumbrellanoproblem #scaffoldingsgotyoucovered	1389024280	420224404946030593	f	morristruck
We might be off the street till Monday, but you can get your good food fix @gladyssandwich all weekend! #eatgoodfood	1388773331	419171849583353857	f	morristruck
We're taking a snow day today as well, folks! Have a great weekend, and we'll see you Monday at 52nd &amp; 6th!	1388763266	419129633695473667	f	morristruck
We're at 51st between Park &amp; Madison today and oh, how we've missed thee. Come and get your first #cheese of 2014!	1388687497	418811835769683968	f	morristruck
First cheese of the year cometh! We're at 51st btw Park &amp; Mad ready to kick the new year into gear with some new sandwiches. Come get it!	1388678660	418774768846778368	f	morristruck
Last cheese of 2013 folks! Come ring in the new year with some new sandwiches at 29th &amp; Park from 1130-3! #HappyChewYear	1388505465	418048338651799552	f	morristruck
Weeeeeeeeee're back! Come celebrate the last days of 2013 with your favorite grilled cheesers at 52nd &amp; 6th ave! Open 1130-3 #cheesetime	1388419663	417688460552445952	f	morristruck
Just a heads up- the truck might be off, but you can still find our sandwiches at Doris Bar in BedStuy (Fulton &amp;Classon)! #boozeandcheese	1387725351	414776305075249152	f	morristruck
Hey folks, we're off the streets for the next week, back at next Monday the 30th in #midtown. #HappyHolidays!	1387724992	414774795528454144	f	morristruck
RT @DispatchNY: . @BrookfieldPlNY NORTH Lot | Friday 12/20 until 3p | N. End Ave./Vesey | @MorrisTruck @Mexicue @SchnitznThings @MacTruckNY...	1387563869	414098998036037632	f	morristruck
Friday, Friday, gotta eat cheese on Friday. See what it's all about over @BrookfieldPLNY @DispatchBP! We're open till 230, come eat! #TGIF	1387555267	414062917122670592	f	morristruck
Last cheese of 2013, #midtown! Come and eat it up, folks! We'll be on 51st nr Madison till 3 and wanna feed you. #hotcheeseandbread!	1387468897	413700658068328448	f	morristruck
@anoddsuperhero YUM! #moneyshot	1387400678	413414525132886016	f	morristruck
@laudt123 No! Why would we do that?! Next time you come by, please tell us your tragic story!	1387400640	413414368135892993	f	morristruck
Decided to close early today, but we'll be back on 18th &amp; 7th next Wednesday!	1389388739	421753058503450624	f	thetreatstruck
Opening late on 18th &amp; 7th! Still circling for our spot	1389388371	421751513858703360	f	thetreatstruck
!!! Fri, Jan 10th 12-3:30 45th &amp; 6th, then 4-6 or 7pm (we'll see how the weather holds up &amp; let you know!) at 18th &amp; 7th ave!	1389367963	421665918213980160	f	thetreatstruck
Friday Jan 10th...fixing a busted water pipe on our truck! As soon as we can, we'll head to our spot &amp; let you know!	1389361746	421639842561536000	f	thetreatstruck
!!! Thurs, Jan 9th 12-3:30 Columbus &amp; 91st st, then 4-7pm Bway (86 &amp; 87th)!!!	1389286197	421322967550013440	f	thetreatstruck
Headed to the UWS today!!!	1389274784	421275096943431680	f	thetreatstruck
Wed, Jan 8th still too cold for the truck, so we'll wait 'til tomorrow! Our shop open today 7:30am-8pm! 521 Court st, Brooklyn	1389186356	420904201708126208	f	thetreatstruck
!!! Tues, Jan 7th No truck today! Holy moly, so cold! Stay warm everyone! Our shop open 7:30am-8pm, 521 Court St, Brooklyn	1389100979	420546104049274880	f	thetreatstruck
!!! Mon, Jan 6th no truck today &amp; Tuesday! Our shop open 7:30am-8pm w/food &amp; treats! Have a great day!!!	1389023139	420219619459493888	f	thetreatstruck
Come help decorate our gingerbread house! We think we'll make gingerbread in January a tradition!	1388931042	419833338979815424	f	thetreatstruck
!!! Sun, Jan 5th our shop open 8am-6pm!!! And we're decorating a gingerbread house for the shop! A January gingerbread house!	1388930268	419830092395970560	f	thetreatstruck
!!! Sat, Jan 4th no truck this weekend! Our shop is open today 8am-7pm @ 521 Court st, Carroll Gardens, Brooklyn w/food &amp; treats!	1388840664	419454264277467136	f	thetreatstruck
!!! Thurs, Jan 2nd our truck is on vacation the week! Our shop is open 7:30am-8pm w/food &amp; treats @ 521 Court st, Brooklyn!!!	1388637298	418601285860880384	f	thetreatstruck
Happy New Year!!! Our shop is open today until 6pm!!!	1388611603	418493514482061312	f	thetreatstruck
Happy holidays! Our truck is on vacation this week. Our shop, The Treats Truck Stop is open! 521 Court st, Carroll Gardens, Bklyn	1388437405	417762875592409088	f	thetreatstruck
Rainy day! Good day to cozy up at home and bake!!! (no truck today!)	1388336827	417341017508311041	f	thetreatstruck
!!! Sat, Dec 28th no truck today! Our shop open 8am-7pm w/food &amp; treats!!! Happy weekend, everyone!!!	1388237979	416926418699026432	f	thetreatstruck
!!! Fri, Dec 27th our shop open 7:30am-8pm! 521 Court St, Brooklyn! Our truck may have an afternoon spot, we'll let you know!	1388147954	416548827462909952	f	thetreatstruck
!!! Thurs, Dec 26th both our truck &amp; shop are closed today and will be open tomorrow! Have a great day!!!	1388079644	416262317383647233	f	thetreatstruck
@SDJoeyB @rhouser @dianahynes Thank you Joe	1389414190	421859807205666817	f	brooklynpopcorn
Happy holidays!!! Our shop is open until 5pm, then we'll be closed until Friday. Wishing everyone a wonderful holiday!	1387920411	415594445535330305	f	thetreatstruck
@brunog @adamcjonas @dumbolot @MexicoBlvd no goodbyes, just a see you later, an oppourtunity to improve and really bring the thunder	1385050796	403558405853290496	f	burgersandbites
@adamcjonas @dumbolot @brunog @MexicoBlvd guus bad news, we are closing for winter and working on our re launch in february. We'll miss you!	1385050521	403557251425648640	f	burgersandbites
To all our loyal friends, we will be closing our lunch service for the winter. We will.see everyone in february with our new menu!	1385050412	403556795584499712	f	burgersandbites
@brunog @adamcjonas no no...no no	1384443893	401012869439188992	f	burgersandbites
@brunog @adamcjonas you really gave into the.commercial devil?! I knew it...but all is forgiven	1384443858	401012725570351104	f	burgersandbites
@brunog @adamcjonas lol we love all of you! No more sad animal.pics they made me cry...we are real!	1384443823	401012575498145792	f	burgersandbites
@brunog @adamcjonas no starving! Just know we love you all!	1384443774	401012371743059968	f	burgersandbites
@antrants although only mildly dissapointed, we will make sure to.make you extra happy soon	1384443737	401012217128448000	f	burgersandbites
@brunog @adamcjonas no excuses on our part guys...as aleays we will do something shocking to make you feel extra special!	1384443686	401012001490878465	f	burgersandbites
Due to a private event we will not be in the lot today. We cant wait to see you again dumbo!	1384440037	400996699105005569	f	burgersandbites
@brunog thats the most beautiful creature...we are now sorrier	1383838698	398474498871406592	f	burgersandbites
http://t.co/w7xJVzXWV8 @brunog	1383838578	398473996397993985	f	burgersandbites
@brunog @tmilewski @adamcjonas after the storm always comes the sunlight! We will make it up to you!	1383838192	398472376410972160	f	burgersandbites
@brunog @tmilewski @adamcjonas we will surely make up our absence even if we have to hand deliver your food!	1383838026	398471680722739201	f	burgersandbites
@brunog @tmilewski @adamcjonas guys please.dont be depressed, when your sad we are sad, but we have a special event today and will be off	1383837951	398471366716162048	f	burgersandbites
@Arts_Courtney we will be back next week with our burgers bites and fries just for you!	1383245924	395988223941697536	f	burgersandbites
@brunog @thisismydesign @antrants yesssssssss!!!!!!	1383244795	395983491156164608	f	burgersandbites
@thisismydesign she makes a solid point	1383232967	395933879192002560	f	burgersandbites
@brunog @antrants donut vs doughnut?	1383232438	395931658245115904	f	burgersandbites
@brunog @antrants I have to re-read the laws of supply and demand but I promise in due time we will all have the burgers we have dreamed of!	1383232417	395931573079777280	f	burgersandbites
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
Hope everyone had a wonderful Christmas! We are serving Lunch on Charlton st &amp; corner of Varick st from 11:30am to 3pm. #OrderOnlineNow	1388074894	416242393227464704	f	freshandhearty
Happy Holidays to everyone! Hope everyone have a safe and jolly Christmas! We are closed for holidays and will be back on the streets Dec 26	1387905662	415532580813807616	f	freshandhearty
Rain Rain go away come back another day! We are serving Lunch on 46st btw 5th &amp; 6th ave from 11:30am to 3pm. #Soups #Salads #Paninis #Wraps	1387808620	415125558968987648	f	freshandhearty
GM nYc! Why wait in the rain? Order via online, email or phone to pickup your lunch. Go to http://t.co/IHpsS9AEHV and order now! #NoWait	1387808473	415124940258836480	f	freshandhearty
Happy Friday! We are serving lunch today on Broadway &amp; 55st from 11:30am to 3pm. Order online and pick up #NoWait http://t.co/IHpsS9AEHV	1387554531	414059830887088128	f	freshandhearty
Today we are serving lunch on Old Slip btw Water st &amp; Front st from 11:30am to 3pm. Now you can order online for pickup! Why wait? Order now	1387463963	413679964459118592	f	freshandhearty
GM nYc! Why wait on line in his cold weather order online, email or via phone to pickup your lunch. Go to http://t.co/IHpsS9AEHV order now.	1387463824	413679379756351488	f	freshandhearty
Today we are serving lunch on 46st btw 5th &amp; 6th ave from 11:30am to 3pm. Order now thru http://t.co/IHpsS9AEHV and pickup by noon #ordernow	1387375574	413309230809354240	f	freshandhearty
Good morning nYc! Why wait order now and pick up your lunch btw 11:30 &amp; 12. Order now via 3474402467 or freshandhearty@gmail.com	1387375326	413308192152911872	f	freshandhearty
#FF @mooshugrill @biandangnyc  @dumbolot #followfriday	1389370689	421677350380908544	f	domotaco
@laura_palumbo not yet. hopefully by next week!	1389370389	421676092840493056	f	domotaco
@iamcolossus yes. we are still doing maintenance! sorry	1389322728	421476187828137984	f	domotaco
Truck has mechanical issues and won't be out today. #sadface have a happy holiday!	1387805894	415114125027446784	f	domotaco
49th and 6th!!! Our last week here til after the new years !! Come grab some yummmy food before the holidays!!... http://t.co/vxH9DgHqht	1387542658	414010033685295104	f	domotaco
53rd and park !!!! BUY one burrito for the price of TWO and get one FREE !! LOLOL  winkwink *	1387467290	413693915531718656	f	domotaco
@ryankanno we are at the @dumbolot	1387390405	413371439337984000	f	domotaco
New spot today! Don't let the cold weather stop you from coming by King and Varrick. The warm, yummy and mouth... http://t.co/l7KHujCboV	1387287192	412938530868838401	f	domotaco
Sigh...monday ): 50th and 6th for lunch! Cheer yourself up with some warm burritos and bowls.	1387201769	412580242671157249	f	domotaco
49th and 6th for lunch!! DOMO TACO. Eat a taco and it'll give you super powers and hopes..and happiness... do i... http://t.co/9L3TEfT5sQ	1386950526	411526453474238465	f	domotaco
53rd and park SW corner! Come thru! Will be here till 2:30	1386863669	411162145133322241	f	domotaco
Wooohooo half way there til the weekend!! Come by water and jay st for some yummy tacos, burritos and bowl!... http://t.co/mtW27d7RGR	1386775900	410794017454964736	f	domotaco
RT @mooshugrill: We're making our debut on 46th &amp; 6th! @midtownlunch #holidayduck #ChristmasShus #nyc	1386775125	410790768400691200	f	domotaco
Serving #tacos #bowls and #burritos on 38th and Broadway! #ohmy  #nyc #snow	1386688000	410425335851675648	f	domotaco
sorry folks! truck down for maintenance today. #wompwomp	1386611956	410106387633815552	f	domotaco
@Laura_Palumbo sorry, truck maintenance today!	1386611931	410106282516156416	f	domotaco
49th and 6th today!! TGIF! Come get some warm, delicious tacos and have a great weekend everyone :)!	1386337908	408956945324720128	f	domotaco
@moxieingreen not yet. we're working on it though.	1386266490	408657398203961345	f	domotaco
We're on 53rd and park today for lunch on 53rd!!!	1386257910	408621409254899712	f	domotaco
@grahamrock you have to round up more friends to convince the #overlords	1386253105	408601254135603200	f	domotaco
Wall and water st today.. We have coverage for the rain no worries..\n\nCall your order in for pick ups: 917-756-4145	1389368157	421666730356662272	f	disosnyc
@nycfoodtruck @DiSOSNYC	1389367231	421662845412343809	f	disosnyc
Wall and water street today.. Open at 11.\n\nCall in your orders for pick up: 917-756-4145	1389359464	421630270396039168	f	disosnyc
Disos open for lunch..\n\n47th between park and Lex\n\nCall in your preorder: 917-756-4145	1389284353	421315231780847616	f	disosnyc
Corporate lunches? Yea we do that too.. Call or email for details and get your lunch catered by THE society of... http://t.co/Bn9wFEhBir	1389280302	421298241893040131	f	disosnyc
The society is posted up on 47th between Park and Lexington ave.\n\nCall in for pick up orders: 917-756-4145	1389280166	421297671307939841	f	disosnyc
Yea it's that time again. Corner of Varick and Charlton st. \n\nCall in your orders for pick up, no line wait!\n\n917-756-4145	1389192924	420931748512661504	f	disosnyc
Here's our schedule for the rest of the week:\n\nWed: soho, varick and charlton\nThursday: 47th and Park\nFriday: wall st.	1389134592	420687086379741184	f	disosnyc
Hot roast beef sandwich\nHot chicken parm\nHot chicken with eggplant\nHot veggies\nHot\nHot\nHot\n\nCall in your order: 917-756-4145	1389114463	420602662879776768	f	disosnyc
RT @mherrera465: @DiSOSNYC Hell ya!!! I don't care how cold it is I'm coming for your delicious sandwiches	1389108970	420579623609860096	f	disosnyc
@gracebalances The society never closes.. We're here!	1389106124	420567686654205952	f	disosnyc
Yea it's cold, but someone's gotta make the sangwiches!\n\n48th between 6 and 7 ave.\n\nCall in your order today: 917-756-4145	1389104506	420560896550002688	f	disosnyc
Open for lunch @ 47th bet Park and Lexington.\n\nCall it in: 917-756-4145	1389024055	420223460502016001	f	disosnyc
Back on the 47th st and park location today.\n\nCall in your order: 917-756-4145\n\nCiao	1389019381	420203860032880640	f	disosnyc
Off today..	1388758998	419111734238916608	f	disosnyc
... And we're open.\n\n47th bet Park and Lex.\n\nHot roast beef, chicken, veggies all around. \n\n917-756-4145	1388679792	418779520775512064	f	disosnyc
First working day of 2014 and we're here with you. \n\n47th between Park and Lexington ave.\n\nCall in ur order if... http://t.co/VrezfhtGHs	1388674377	418756806962589696	f	disosnyc
We will be on the corner of 48th and 6 ave today. \n\nCall in your orders: 917-756-4145	1388503150	418038627089010688	f	disosnyc
((( NEW SPOT ALERT )))\n\nCorner of 48th and 6 Ave.\n\nCorner of 48th and 6 Ave.	1388497682	418015692302979073	f	disosnyc
Open for biz.. 47th and Park ave. \n\nCall it in for pick up: 917-756-4145\n\nHot roast beef sandwiches all day!	1388421764	417697270893920256	f	disosnyc
Shabbat shalom! C u on Monday BH'	1389366485	421659716637691904	f	grillonwheelsny
Due to the weather conditions, Grill on Wheels will not be on the road today!	1389017206	420194733819166720	f	grillonwheelsny
Come try our couscous topped with cooked vegetables platter, with your choice of meat!	1388676648	418766333065834496	f	grillonwheelsny
46th off 6th today #shawarma #schnitzel #yummy	1388676604	418766146385772544	f	grillonwheelsny
Happy New Year! We r on 22th and 5th today!	1388519550	418107415331344384	f	grillonwheelsny
Happy New Year! We r on 46th off 6th today!	1388504928	418046087635947520	f	grillonwheelsny
Open from 11-3:00 today on 46th bet 5/6th.\nCall for p/u or delivery! 718-564-9991	1388414497	417666790232428544	f	grillonwheelsny
Open for dinner on Broadway &amp; 77th street	1388092388	416315767064653824	f	grillonwheelsny
on 46th (bet 5/6th) open for lunch at 11:00.... Dinner location tba	1388071465	416228011353329664	f	grillonwheelsny
Grill on Wheels is on 46th (bet 5/6th) open for lunch at 11:00.... Dinner location tba	1388071301	416227323713970176	f	grillonwheelsny
Grill on Wheels will be at the JSpace event tonight located at The Finale! 199 Bowery	1387936231	415660798963646464	f	grillonwheelsny
Grill on Wheels is off today and tomorrow. Wishing all celebrating a happy holiday!	1387901500	415515126113243137	f	grillonwheelsny
Call for p/u or delivery! 718-564-9991	1387810182	415132111755300864	f	grillonwheelsny
On 46th between 5th &amp; 6th today!! C u 4 lunch!!	1387810109	415131805126107136	f	grillonwheelsny
TGIF!! Open from 11-2:00 today on 46th bet 5/6th. Don't wait in the cold.. Call for p/u or delivery! 718-564-9991\nShabbat shalom!	1387548969	414036502063357952	f	grillonwheelsny
On 46th between 5th &amp; 6th today!! C u 4 lunch!!	1387473207	413718736101978112	f	grillonwheelsny
Happy Hump Day! We are on 47th off Park Ave today open from 11:00 to 3:00.. Call us for delivery or pickup 718-564-9991	1387375617	413309411709710336	f	grillonwheelsny
@theburack thank you! .....Oh.. And we do care...	1387331356	413123766538215424	f	grillonwheelsny
Good morning midtown! We are on 47th off Park Ave today open from 11:00 to 3:00.. Call us for delivery or pickup 718-564-9991	1387294402	412968771620712449	f	grillonwheelsny
Free Delivery!! 718-564-9991	1387212445	412625019123286016	f	grillonwheelsny
Thanks @restorsea for great review http://t.co/5AS5sFAAjj via @restorsea	1389415460	421865134902870016	f	brooklynpopcorn
@allthattweet @BrooklynTours we're on 55th and 6th now until 7ish	1389380970	421720473496346624	f	brooklynpopcorn
@rhouser @dianahynes we're on 55th and 6th	1389380947	421720377903951872	f	brooklynpopcorn
@dianahynes @rhouser 55h and 6th stop by	1389380934	421720322035830784	f	brooklynpopcorn
@rhouser @dianahynes 55th and 6th	1389380916	421720244931936256	f	brooklynpopcorn
@reesayspieces Hi Marie,we're on 55th and 6th today in midtown	1389380905	421720197808926721	f	brooklynpopcorn
RT @rhouser: @BrooklynPopcorn caramel corn on a Friday... best day ever! See you then. cc: @dianahynes	1389301951	421389042501308417	f	brooklynpopcorn
@rhouser @dianahynes Renee we will be in Midtown tomorrow. See you then!!	1389301670	421387862899056640	f	brooklynpopcorn
@_Anchorman wet popcorn looks better	1389300530	421383083732918272	f	brooklynpopcorn
@sammm_boothe Wow this is a cool mix, we should add it to our #gourmet menu	1389300457	421382777070563328	f	brooklynpopcorn
@ChrisLallyDaily Have you smelled fresh cooked caramel #gourmet #popcorn :)	1389300416	421382606484041728	f	brooklynpopcorn
@djcarnage Jesus loved #gourmet #popcorn	1389300349	421382323024572416	f	brooklynpopcorn
@FemaleB00K how about feeding them spicy firing hot #popcorn	1389300293	421382090299428864	f	brooklynpopcorn
@BigFatDaddys @tumblr can't blame them Wayne - our #gourmet #popcorn is addictive	1389300185	421381635032899584	f	brooklynpopcorn
@NoahShachtman rush order of #gourmet #popcorn coming right up :)	1389300127	421381393105436672	f	brooklynpopcorn
@Kristenpetersn leave the #popcorn making to the pros of popcorn! you just sit back and enjoy ordering and munchin )	1389300067	421381142193795072	f	brooklynpopcorn
@allthattweet @BrooklynTours until 6-7pm	1389298437	421374302525468672	f	brooklynpopcorn
Hey NYC we are #popcorn #truck on East 70th Street &amp; York Avenue. Cooking all your favorite #gourmet #popcorn flavors today!!	1389295392	421361530559422464	f	brooklynpopcorn
RT @BajaTacoTruck: @KimchiTruck Well done! :-)	1389364525	421651496280023040	f	kimchitruck
Snow, sleet, rain? Tucking in for the day. We'll see ya next week.	1389364039	421649460674822144	f	kimchitruck
RT @SusannaKno: Awesome tacos from @KimchiTruck at the @shapeways new year party!!!!!	1389363730	421648163154690048	f	kimchitruck
You'll have to miss us just a bit longer. We'll be back next week :)	1389277692	421287293467361280	f	kimchitruck
RT @laurablagys: It's a taco kind of night - @KimchiTruck be there in 40. #longcommute #normalspicy #fishtacos	1389277439	421286232136876032	f	kimchitruck
RT @lizzwinstead: @KimchiGrill @KimchiTruck @Kimberly124 / deal! you will know me. ill be the brave one!	1389195071	420940756585840640	f	kimchitruck
We'll be spending Hump Day in a garage. Hopefully back on the road soon. Miss you!	1389191594	420926174022217728	f	kimchitruck
Sorry folks, no truck today. Stay warm!	1389106656	420569914508730368	f	kimchitruck
@Kimberly124 @lizzwinstead Sure do @KimchiGrill	1389106625	420569784971849728	f	kimchitruck
Fog &amp; rain may come and go, but tacos are forever. @BrookfieldPLNY, N. End Ave &amp; Vesey St	1389018677	420200904562724864	f	kimchitruck
Staying safe &amp; cozy today. Will be truckin back to service on Monday.	1388760430	419117738863230977	f	kimchitruck
Miss us? We're at Varick &amp; the corner of Charlton St until 2:30pm today	1388686226	418806505761017858	f	kimchitruck
Tacos taste even better in 2014. Varick St. corner of Charlton st. 11:30am - 2:30pm	1388680061	418780648409530368	f	kimchitruck
We're baack! Happy New Year, y'all! Varick St. corner of Charlton st. 11:30am - 2:30pm	1388673414	418752768296239104	f	kimchitruck
This truck is on vacay. If you've got a kimchi craving, swing on by to our Brklyn shop, @KimchiGrill Happy holidays!	1387810444	415133207634259968	f	kimchitruck
We're going on a lil vacay after today. Get your tacos while you can. 52nd St. bet. 6th &amp; 7th Ave. 11:30 - 2:30	1387548707	414035406418497536	f	kimchitruck
On our way to Varick St &amp; corner of Charlton 11:30am - 2:30pm	1387464003	413680128397287424	f	kimchitruck
We're coming for ya, midtown. 55th St. bet. 6th &amp; 7th Ave. 11:30am - 2:30pm	1387376465	413312968588152832	f	kimchitruck
Braving snow &amp; cold in the name of taco love @dumbolot Jay &amp; Water St. 11:30am - 2:30pm	1387292491	412960758062792704	f	kimchitruck
RT @dumbolot: Oh the weather outside is frightful... but the lot on Jay &amp; Water is poppin off with @sweetchilinyc @carlssteaks and @KimchiT...	1387292358	412960199348346880	f	kimchitruck
@justyniak sorry Justyna no we are off for the wknd. Is your friend around Monday?	1389396027	421783624611274752	f	philssteaks
Phil's Phriday lunch time! 41st &amp; 6th til 3! Come n GET YOUR PHIL!	1389373530	421689266117550080	f	philssteaks
Get your Phil this morning - cheesesteak n eggs sammy with a hash brown patty on top! 41st btw 6th n BWay	1389360340	421633944694841344	f	philssteaks
@4LeggedBarkery thanks we love to hear that!	1389309699	421421541570904065	f	philssteaks
RT @4LeggedBarkery: @PhilsSteaks awesome!! Best food truck in midtown	1389309659	421421372494315520	f	philssteaks
No dinner shift tonight. back on 41st n 6th tomorrow for breakfast n lunch starting at 7. It's the Phirst Phil's Phriday of 2014!	1389301130	421385600663842817	f	philssteaks
@JonathanLedee 52nd and 6th til 2! We'll be waiting!	1389286387	421323762328674304	f	philssteaks
Mornin' pholks! Just 1 jawn out today for lunch. 52nd and 6th from 11-2. Stay tuned for dinner location.	1389279799	421296131222798336	f	philssteaks
Dinner at W. 4th n Greene for winter session students and New Yorkers in the area. Don't fear the cold - cheesesteaks warm your soul!	1389210836	421006877624107009	f	philssteaks
Alan Richman rates his 10 best Philly Cheesesteaks via @GQMagazine http://t.co/WPFiNDOei1.  You guys think he missed any?	1389199411	420958957281103872	f	philssteaks
RT @fourwheelfoodie: Thanks @Thrillist for these great truck recommendations! Love those @PhilsSteaks, and @KelvinSlush for dessert! http:/...	1389196168	420945358098034688	f	philssteaks
Lunch is calling, no matter how cold it is. Come warm up with hot cheesesteaks and twice-fried fries! 41st n 6th til 2!	1389196128	420945186999791617	f	philssteaks
Help us send the #articvortex away. The more steak we grill, the faster it warms up! OG Jawn is on 41st btw 6th n... http://t.co/Y6tMXsGQ3q	1389182377	420887514770313216	f	philssteaks
@bpetti1 no jawns were out today but 1 will be tomorrow. Look for OG on 41st btw 6th and BWay from 7am - 2pm	1389128774	420662686364741632	f	philssteaks
Happy new year pholks!!! Have fun tonight! See you in '14  	1388540324	418194546145513472	f	philssteaks
@Sergio_Leone81 not back out til Monday jan 6. Enjoy your time time in NYC!	1388539930	418192893107769344	f	philssteaks
@justyniak @UncleGussys @bigdsgrub @schnitznthings @souvlakitruck @biggayicecream @fritesnmeats same to all of you! Merry Christmas 	1387979882	415843882191298560	f	philssteaks
Court and Bergen today! #seizeyourdonut	1389448123	422002133643563008	f	carpedonutnyc
RT @justyniak: @UncleGussys @bigdsgrub @schnitznthings @souvlakitruck @biggayicecream @PhilsSteaks @fritesnmeats HAPPY HOLIDAYS y'all ! 	1387911699	415557901554823168	f	philssteaks
Dreaming of a Whiz Christmas? Get it started with lunch from Big Jawn. Jingle Steaks til 2! 41st btw 6th n BWay	1387903695	415524333188964352	f	philssteaks
Ho ho ho! Merry Christmas! We're slangin' steaks til 2. Get yours before Santa does. \n\n41st btwn Broadway &amp; 6th. \n\nHappy holidays pholks!	1387894957	415487683272916992	f	philssteaks
Bobjo express open at 47 &amp; park ave today!	1389370888	421678184565080064	f	bobjotruck
Raining ny,But happy friday!\nBobjo truck located in Varick &amp; king st today. \nWe server hot ramen noodle soup! Try and make u warm and happy.	1389370814	421677874455003136	f	bobjotruck
Bobjo express at hanover sq and water st today#	1389285333	421319341951680512	f	bobjotruck
Hello, flatiron!\nBobjo truck open at 22st &amp; 5th ave today.\nTry our ramen noodle soup! Its will make u warm and happy!\nThanks!	1389285294	421319177585303552	f	bobjotruck
Bobjo express stay at 47 st and park ave today!\nTry our ramen noodle soup today!	1389199745	420960357696688129	f	bobjotruck
Still freezing ny!\nWe open at varick st &amp; King st today.\nBobjo truck serve hot ramen noodle soup today! Try and make u warm!\nThanks!	1389199692	420960138015801344	f	bobjotruck
Bobjo express will open at 47st and park ave today!	1389111215	420589038035537920	f	bobjotruck
Freezing ny! Bobjo truck serve hot ramen noodle soup at Water st &amp; Hanover sq today.  Try ramen! Its will make u warm!\nThanks!	1389111179	420588885698433024	f	bobjotruck
Hello, NY!\nBobjo truck open on 46th st btw 5 &amp; 6 ave today. Bobjo ramen make u warm today.\nBobjo express stay at watet and hanover sq!\nThks!	1389026078	420231949387829248	f	bobjotruck
Good morning flatiron!! We r open 22nd and fifth ave.  /  Bobjo express :: hanover sq and water st.  Try our ramen noodle soup !  Thax!!	1388681031	418784715538452480	f	bobjotruck
Bobjo truck open at 46st btw 5 &amp; 6 ave today. Try our ramen noodle. \nBobjo express stay at 47st &amp; park ave.\n\nThanks!	1388420490	417691925576421376	f	bobjotruck
Bobjo Truck open at 46st btw 5th &amp;6th ave today.\nBobjo express stay at 47st and park ave.\nTry our hot ramen noodle soup today. \nThanks#	1387817107	415161154810707968	f	bobjotruck
Happy friday!\nBobjo truck stay st varicks and king st today! Try our ramen noodle soup will make u warm. \nBobjo express at 47&amp;park ave!\nThk!	1387558000	414074380143308800	f	bobjotruck
@becksinthecity_ Thank you!	1387474970	413726127463858176	f	bobjotruck
@DTrAiNn718 Yeah Bobjo express in Water st!	1387474852	413725633546817536	f	bobjotruck
Bobjo Express will stay at water &amp; hanover sq! Try our vegetable dumpling. \nThanks!	1387471723	413712508760109059	f	bobjotruck
Hello, flatiron!\nBobjo truck open at 22st &amp; 5th ave today!\nTry our ramen noodle soup and rice platter!\nIts will be make u happy!\n Thanks!	1387471661	413712251305332736	f	bobjotruck
Bobjo Express will stay 47st &amp; Park ave.\nTry our vegetable dumpling!\nThanks! http://t.co/BUf8HkiJPp	1387383948	413344356108890112	f	bobjotruck
Bobjo truck at Varick and King st today!\nWe serve ramen noodle soup. Will make u warm today! Try bobjo truck today! http://t.co/V6W2HAwuIp	1387383855	413343963811446784	f	bobjotruck
Bobjo ramen noodle soup!! http://t.co/wafvjUAV98	1387300767	412995470823546880	f	bobjotruck
RT @grubstreet: 6 things we just learned about MTV's new food reality show House of Food: http://t.co/J3b6t2bIC8	1389392589	421769206586421248	f	shanghaisogo
FLATIRON FRIDAY! We have coverage for the rain &amp; Call for pick ups: 917-686-8571. @ 22nd st &amp; 5th ave. 11am~3pm. SOGO FOR IT &lt;&lt;...	1389370313	421675772823474176	f	shanghaisogo
FLATIRONshanghai SOGO will serve ur lunch @ 22nd st &amp; 5th ave. 11am~3pm. See you all later SOGO FOR IT!!	1389362496	421642987022843904	f	shanghaisogo
Flatiron!! tomorrow will be serving your meal @ 22th st &amp; 5th ave. From11~3pm. See you all tomorrow.  SOGO FOR IT!!	1389317467	421454121334755328	f	shanghaisogo
Midtown West! We r @ 46th st &amp; 5~6 ave 11~3pm. Try our VEGAN ORGANIC MUSHROOM SOUP! It will Warm u up for sure. http://t.co/n5XakaGk5w	1389285721	421320968926408704	f	shanghaisogo
@laclabra thanks very much, c u soon again.	1389277526	421286597011996672	f	shanghaisogo
RT @laclabra: Corey brought home dumplings today from the @shanghaisogo truck. And I fell in love with him all over again.	1389277450	421286276349038592	f	shanghaisogo
Midtown West! We r @ 46th st &amp; 5~6 ave 11~3pm. Eating right is important in this coughs season. Beat the cough!!! http://t.co/ZuriII2BIs	1389274035	421271955376185344	f	shanghaisogo
Midtown West! We r @ 46th st &amp; 5~6 ave 11~3pm. Eating right is important in this coughs season. Beat the cough!!! http://t.co/75hjcg9oZN	1389273847	421271167056756736	f	shanghaisogo
Cough Relief menu items is available now. Cure the cough with right food&amp;drink from Shanghai Sogo. Sogo for it!!! http://t.co/eKuNgbwCkS	1389272986	421267555396108288	f	shanghaisogo
Still freezing cold out there. Come get ur lunch from Shanghai Sogo &amp; warm u up with it. SOGO FOR IT!!!	1389203570	420976401152749568	f	shanghaisogo
: Sun is out. The weather is beautiful now. Come out get some fresh air. We r @ 55th st &amp; broadway until 3pm.	1389190303	420920756487598080	f	shanghaisogo
The schedule for the rest of the week:\n\nWed: Midtown West. Broadway &amp; 55~56st.\nThursday: 46st &amp; 5~6 ave.\nFriday: 21~22 st &amp; 5th ave.	1389143560	420724704581017600	f	shanghaisogo
Cold + Wind + Snow = Stay warm.	1389071729	420423421680685057	f	shanghaisogo
Happy new year 2014. Have a amazing night!     	1388541497	418199466400047104	f	shanghaisogo
What a delicious meal! She is enjoying it. http://t.co/iLlrHtTbS4	1388431020	417736093342380032	f	shanghaisogo
Happy new year 2014 #midtown! Come out &amp; get yr Asian tapas from SS. @park ave &amp; 47th st( front of people's united bank)11~3pm    	1388418751	417684632529039360	f	shanghaisogo
The shanghaisogo truck will be @47th st &amp; park tomorrow. 11~3pm. C u all	1388368757	417474941584703488	f	shanghaisogo
Shanghai Sogo are serving lunch on 46th st &amp; 5~6th ave from 11:00am to 3pm. Come out find us because we miss u.	1388071813	416229470300020736	f	shanghaisogo
Merry Christmas Eve everyone, Shanghai Sogo is take day off today and tomorrow.	1387901658	415515788280598528	f	shanghaisogo
Friday donuts at 51st and Park!	1389358578	421626554247290880	f	carpedonutnyc
55th and Broadway, donuts all day!	1389272464	421265363347980288	f	carpedonutnyc
23rd and Park! Little known fact: eating donuts slows the #articvortex	1389188663	420913880047828992	f	carpedonutnyc
Come get your donuts at 55th and Broadway!	1389013272	420178237294411776	f	carpedonutnyc
Donuts all day at Court and Bergen!	1388926468	419814153571041280	f	carpedonutnyc
A record cold day calls for a record delicious donut! Come get yours at Court and Bergen	1388846524	419478845042200576	f	carpedonutnyc
51st and Park today. Last chance for donuts in 2013!	1388408422	417641308631867392	f	carpedonutnyc
Another beautiful day at Bergen and Court. Take some time out of your day to stop and smell the donuts.	1388324218	417288135199195136	f	carpedonutnyc
We're back in Cobble Hill for the last weekend of 2013!! Located at Court and Bergen streets until 3pm today.	1388237741	416925422270812160	f	carpedonutnyc
55th and Broadway #donuttime until 4:30pm!	1387545836	414023364462641152	f	carpedonutnyc
51st and Park today until 4:30!	1387372840	413297764756635648	f	carpedonutnyc
Come thaw out with DONUTS at Court &amp; Bergen until 4:30pm	1387112855	412207306697625602	f	carpedonutnyc
Here on Bergen and Court streets in BK until 2:30pm. You know you want it!	1387026333	411844410079735808	f	carpedonutnyc
Cold day?  Hot donuts!  We are at 55th and Broadway until 5:30pm today.	1386940001	411482307888168960	f	carpedonutnyc
Sorry, guys! We're sold out and closing earlier than expected today :(	1386879380	411228044058447872	f	carpedonutnyc
Ready for all your donut and hot beverage needs! We're located on 51st and Park and open until 5pm today.	1386852150	411113831528931328	f	carpedonutnyc
@kinnary_desai We're planning on hitting up our usual Thursday and Friday midtown spots this week. Stay tuned for any updates!	1386767072	410756991007875073	f	carpedonutnyc
You know the drill. Fresh donuts, hot spiced cider, and fair trade coffee at 23rd and Park. Open 'till 5pm today.	1386766012	410752545607651329	f	carpedonutnyc
@DylanStilin Unfortunately we're still planning on closing at 3:30 today. We hope you can make it!	1386618341	410133165807009792	f	carpedonutnyc
@thedave1022 We haven't. But suggestions are always welcome!	1386617923	410131412130754561	f	carpedonutnyc
Midtown lunch til 3! Astoria starting at 5:30pm :)	1389379688	421715094817751040	f	mexicoblvd
It's not even that cold out today, @dumbolot ! We'll see you for lunch today on Jay &amp; Water Streets, #Brooklyn :) #tacotacotaco	1389283873	421313219874283521	f	mexicoblvd
@BMarsalise bundle up and come enjoy some MB goodness :) we'll be here til 2:30	1389197472	420950827512381440	f	mexicoblvd
Happy Wednesday! Avoid the cold &amp; preorder via our website http://t.co/EIrGC8j9wt :) Pick up lunch at WFC North End &amp; Vesey St Lot #xxxspicy	1389197226	420949794337865729	f	mexicoblvd
RT @mattmday: Heroic work by the folks at @MexicoBlvd, braving the cold to dispense delicious tacos.	1389196972	420948730360385537	f	mexicoblvd
Stay warmer longer &amp; preorder via our website: http://t.co/EIrGC8j9wt :) Pick up at Midtown on 46th St between 6th &amp; 7th Ave #tacotime	1389106373	420568729374973952	f	mexicoblvd
RT @dumbofoodbot: I spy with my little eye a @hibachiheaven @mooshugrill @MexicoBlvd in the @dumbolot.	1389033593	420263469150400512	f	mexicoblvd
RT @Cheap_eats: Pondering what's for lunch? @dumbolot: For a good time come see @mooshugrill @MexicoBlvd @hibachiheaven in the lot today!	1389026930	420235520577634305	f	mexicoblvd
Hello NYC! So happy to be back on our normal schedule. Complete list is on our website :) DUMBO today &amp; Astoria tonight! #tacolove	1389018757	420201240338137089	f	mexicoblvd
@TigerTesh80 unfortunately we just took the decision to shut down tomorrow. Sorry for the inconvenience	1388706004	418889460235784193	f	mexicoblvd
RT @rickyrobinett: .@dumbofoodbot is amazing. Love that it's open source too: https://t.co/mIVxOUtvF2	1388686973	418809640152236032	f	mexicoblvd
Back in action! WE are parked in DUMBO on (jay &amp; water) streets #open from 11:30-3:00 come and fill your new year taco crave!	1388675077	418759741460865024	f	mexicoblvd
12/30/13-1/5/14  http://t.co/7uhDAQWsSc	1388415614	417671474104008704	f	mexicoblvd
NYC we miss you! Feliz Navidad y feliz ano nuevo! See you on Jan 2nd 	1387916962	415579977988718592	f	mexicoblvd
@Grandenchilada THANK YOU so so much! We can't wait to get back on Jan 2nd &amp; feed nyc in 2014 	1387916348	415577404607041536	f	mexicoblvd
No truck today. Happy holidays!!	1387904901	415529392375627776	f	mexicoblvd
We are in the #DUMBO lot on jay and water streets! 11:30-3:00! Come and get your tacos before the holidays!	1387815769	415155545398870016	f	mexicoblvd
RT @FoodtoEat: Thx to all who played #12DaysofFoodTrucks today! @MexicoBlvd is the truck w/ the torta pastor. Tune in tmrw - Day10! http://...	1387755826	414904124829085696	f	mexicoblvd
Last call for your Mexico Blvd taco love until 2014!!! #taco We are on 46th &amp; 6th	1387557310	414071489600565248	f	mexicoblvd
Happy Holidays to all! \n@MexicoBlvd will be back in January 2014 @BrookfieldPLNY lot. \nCome and get your yummy tacos and tortas!	1387388645	413364056389476352	f	mexicoblvd
For one free dinges tell us where this picture was taken! http://t.co/7gcWVf46u2	1389398829	421795378435207168	f	waffletruck
Wafels on de move! Kastaar is at Astor Place til 1am! Momma is at 7th &amp; Christopher til 1am! Allez!	1389398595	421794397488152577	f	waffletruck
Please, always share wafels with the ones you love! http://t.co/dTRM4omNNz	1389387722	421748794385252352	f	waffletruck
Have you visited our brand new Wafel Cabana? Well hurry up! We've been waiting for you! Located in lovely Herald Sq. http://t.co/ySyJlWYcWI	1389380537	421718658331987968	f	waffletruck
Thumbs up! Another satisfied customer of De Wafel Factory Tour! Find out more here: http://t.co/2uF9SufZ9y http://t.co/1U5tkexvCh	1389373369	421688589622476800	f	waffletruck
@blendersports @foodiePrints and wafels!	1389372817	421686276853469184	f	waffletruck
@mcausi @MusicPub @NKCoverGrrl man, we hope so. Also, diets are bad for you.	1389372776	421686102487887873	f	waffletruck
@NotSoDorky some walking is involved.	1389372750	421685993607950336	f	waffletruck
@jez_gold it certainly is up there.	1389372718	421685860879179776	f	waffletruck
@Vanillasky1222 is there another Coney Island?	1389372691	421685748203388928	f	waffletruck
@nrock302 a fine guess.	1389372674	421685675570651136	f	waffletruck
@Lynn_TopChoice woohoo!!	1389372639	421685530309320704	f	waffletruck
@mintywong touche	1389372607	421685396586504192	f	waffletruck
@katmosays we shall count the minutes.	1389372597	421685353666191360	f	waffletruck
@penntopaper and we've never been more honored to answer.	1389372569	421685234745085952	f	waffletruck
De Wake Up Grumpy. Goes well with hot cocoa, coffee, a friend or a newspaper. http://t.co/KdqdAhtqlR	1389368659	421668837097226240	f	waffletruck
Goesting @ Broadway &amp; 66th til 9pm Vedette @ 60th &amp; 5th til 6pm \nPagadder @ City Hall Park/BK Bridge til 5pm \nKotmadam @ 23rd &amp; 6th til 8pm	1389368247	421667107219070977	f	waffletruck
De Wafel Cabana at 35th &amp; Broadway is open till 10pm today!  \nMomma Truck @ 43rd &amp; 6th until 4:31pm Kastaar @ 40th &amp; Parkth til 4:33pm	1389368232	421667044501618688	f	waffletruck
Friday! Friday! Time to celebrate the weekend. \nLe Cafe @ Ave B &amp; 2nd St is open til 2am	1389368221	421666998838259712	f	waffletruck
For one free dinges tell us where this picture was taken! http://t.co/qzjxr08vKe	1389368191	421666874430988288	f	waffletruck
Delicious samisas	1389487680	422168045394485248	f	mausamnyc
Good mozzarella worth the extra mile. The best D.O.P. mozzarella is worth the extra hundred.	1389393645	421773636509646848	f	neaexpress
Lately Frozen's felt a bit more fact than fiction.	1389387926	421749649318641664	f	neaexpress
Outkast is making their first live reappearance in NYC: http://t.co/6avPnjo0BR	1389384653	421735919184797696	f	neaexpress
We can't turn lead to gold, but we can turn waste to fuel: http://t.co/rVVTmZjjFB	1389380733	421719480415576064	f	neaexpress
Clean tech experts are gathering in the city next week: http://t.co/oaJdu6zvvO	1389373855	421690628482023424	f	neaexpress
Alf-fuel trucks join Phoenix's green efforts: http://t.co/Apc2cvMlr9	1389369869	421673910011445248	f	neaexpress
Gothamist makes their best defense of New York winter: http://t.co/XXCgMKzJTV	1389366325	421659048531226624	f	neaexpress
@cjannace Fantastic! We're glad the kale stood out. See you again soon?	1389363913	421648932109045760	f	neaexpress
Glad you enjoyed it @cjannace!	1389361734	421639792619577344	f	neaexpress
Good morning NYC! What's on the morning menu?	1389360308	421633807952142336	f	neaexpress
Two green design leaders give their thoughts to Huffington Post: http://t.co/RISGylXr4p	1389306657	421408781806092288	f	neaexpress
Share a slice every now and then. Everyone appreciates it.	1389301546	421387342516326402	f	neaexpress
It's National Pizza Week! Though it's hard to notice the difference in New York.	1389297947	421372250756251648	f	neaexpress
At 49th and 6th? So are we, small world!	1389290476	421340915111043072	f	neaexpress
Non-GMO means keeping Doctor Frankenstein out of the kitchen.	1389287143	421326932794695680	f	neaexpress
49th and 6th: We're ready and waiting.	1389285805	421321322216423424	f	neaexpress
Another set of alt-fuel recycling trucks: http://t.co/bhg7CpQYFu	1389285047	421318140375470080	f	neaexpress
The best part of our day? Serving the first pizza. The worst? Driving there.	1389279904	421296571243053056	f	neaexpress
Comedian Steve Rannazzisi (tries to) get a pizza: http://t.co/xzXjjeLH51	1389276827	421283666070081536	f	neaexpress
Lowest US CO2 emissions since 1994? Not bad. http://t.co/3gNrBsCpd2	1389214293	421021378528411648	f	neaexpress
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
RT @EstaFiestaPR: @Carnegro U just discovered @WingNItNYC? I LOVE that place!!	1385489857	405399959727779840	f	wingnitnyc
RT @Carnegro: So I found a wings food truck though. I wish I was hungry. Apricot Maple Whiskey wings sound amazing. @WingNItNYC	1385489851	405399938588483585	f	wingnitnyc
Out here on 47th between Park and Lexington. Come get some wings for lunch today.	1385476363	405343363248816128	f	wingnitnyc
At our Monday spot. Don't wait in the cold pre-order 917 740 1765. Have a good day everyone.	1385390579	404983559879786497	f	wingnitnyc
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
Pleasant service great prices and quanrity	1389486019	422161080568147968	f	mausamnyc
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
How do you feel today: Savory or Sweet? http://t.co/cWYziK38s9	1389387603	421748292054450176	f	nuchasnyc
see it, eat it! Nuchas #foodtruck on 50th &amp; 6th ave, for an #empanada lunch, at your service!  #muchasnuchas #midtown	1389371752	421681807386370049	f	nuchasnyc
@hilary_she @melissagoldman @sweeterynyc @waffletruck @domotaco @gcnyc1 @mud_truck @eddiespizzany Thanks for the mention!	1389297290	421369494851055616	f	nuchasnyc
#tbt a snowy evening in @timessquarenyc circa 1940! #regram http://t.co/xgxOZ03GXz	1389289656	421337475135836160	f	nuchasnyc
RT @Snuggle_Bear: Oooh @NuchasNYC sounds yum! Do you have honey? *hee hee* #snuggleinthecity #lovesnuggle	1389280253	421298034736365568	f	nuchasnyc
Hey @Snuggle_Bear! Stop by our Times Square kiosk today! #SnuggleintheCity	1389277843	421287928409907200	f	nuchasnyc
Who are you hoping to see win at the @peopleschoice? Tune in tonight 9 pm EST on @CBS	1389228033	421079008244424704	f	nuchasnyc
Is it weird that we voted for #Sharknado? #PeoplesChoice	1389222059	421053952193732608	f	nuchasnyc
RT if you're watching @PeoplesChoice tonight! If so, who you voting for #PeoplesChoice	1389219909	421044934666649601	f	nuchasnyc
@34thStNYC @Twit_RodCouto thanks for spreading the word!	1389219749	421044262672031744	f	nuchasnyc
RT @TimesSquareNYC: Don't Miss: Water Panics in the Sea, film by Laleh Khorramian 11:57pm-12am all month long http://t.co/Y1GznxSGN6 w/ @...	1389217908	421036541923045376	f	nuchasnyc
RT @34thStNYC: Herald Square covered in a blanket of snow  http://t.co/WJIJtNGW1o	1389217743	421035848566833152	f	nuchasnyc
Grab a late lunch at Greeley Square or Time Square! http://t.co/7bOHwn6Sha	1389212024	421011862252437504	f	nuchasnyc
Our truck is not out today but visit our kiosk at Greeley Square &amp; Time Square!	1389203420	420975775295488001	f	nuchasnyc
@twit_rodcouto Our truck is not out today but our kiosks at Greeley Sq &amp; Time Sq are open!	1389200737	420964520727961601	f	nuchasnyc
Bundle up! It's cold out here, our empanadas will help keep you warm. http://t.co/Wc6ayrz0x6	1389126904	420654843540553728	f	nuchasnyc
RT @34thStNYC: DYK @NuchasNYC &amp; @waffletruck were both on @Buzzfeed 25 Most Popular Food Trucks of 2013 list: http://t.co/qn9Gbg0XbW	1389122006	420634297398476800	f	nuchasnyc
Whether you're craving a taste from New Orleans or some chocolate hazelnut spread from Italia, Nuchas has you... http://t.co/4b5AfoRJn6	1389036873	420277225615654912	f	nuchasnyc
RT @ShanghaiMKS: #Foodtrucks are taking over the #FlatIron district! Head on down to enjoy some spicy #kimchi tacos or @NuchasNYC's #empana...	1389035212	420270258537373696	f	nuchasnyc
back to school!! Meet our #foodtruck on 21st and 5th ave #flatiron, for #lunch of some warm #empanadas.  #enjoy!	1389023726	420222084162150401	f	nuchasnyc
Delicious food unbeatable price for quantity and service. Great unique twitting I look forward to it each day	1389393183	421771696563949568	f	mausamnyc
Best lunch platter I had for the longest time. Price was unbelievable service most pleasant and the truck was super clean	1389390006	421758370173812737	f	mausamnyc
Happy Friday! We r downtown Broad &amp; Water Str. All platte comes with parata &amp; samosa only $11	1389351645	421597475548307456	f	mausamnyc
tomorrow will be servinglunch  downtown @ Hanover Sq between Pearl &amp; Water Str.	1389317059	421452409529831424	f	mausamnyc
truck need some TLCafter Tuesday's brutal temperature.will be back tmrw bystore Bway &amp; 67str	1389316616	421450552719847424	f	mausamnyc
Oh no the truck is not here again!  My wife was looking forward for her Indian vegetarian dinner tonight. Guys where r u	1389314182	421440344056528896	f	mausamnyc
Will be back @ dinner location Bway &amp; 67str next to apple store Friday 10th	1389237375	421118189687169024	f	mausamnyc
Was looking forward for samosas	1389229372	421084626191261696	f	mausamnyc
No red truck don't  no what to eat.	1389226884	421074189550764032	f	mausamnyc
Missed dinner today	1389226187	421071265550454784	f	mausamnyc
Went to the  carpet Party NYE 2014 Food was Delicious	1389146854	420738519737188352	f	mausamnyc
Tks for yr % support on such a cold bitter day. Because of U we also make% the sacrifice on these terrible  days.	1389138792	420704704021032960	f	mausamnyc
Chicken Curry was great.\nExcellent service will def  back soon	1389132419	420677975751655424	f	mausamnyc
Enjoyed the samosas did not even need any chutney they were delicious and price was great only $5	1389132173	420676944363941888	f	mausamnyc
Delicious chicken tikka masala	1389131114	420672500737921025	f	mausamnyc
In the mood for spicy delicious food? Try our vindaloo flavor U'll love It	1389126018	420651127625904128	f	mausamnyc
dinner @ Bway &amp; 67str next to Apple store. All dinner platter comes with parata &amp; samosa for only $11	1389125873	420650516381564928	f	mausamnyc
Best chic Kati roll n samosa	1389121486	420632117479878656	f	mausamnyc
get our delicious mango lassie. Will satisfy yr taste buds &amp; keep U full longer	1389111083	420588484546396160	f	mausamnyc
Will be back for chic vindaloo it was great . I need spicy for this cold day	1389110367	420585479377932288	f	mausamnyc
We are on 55st and broadway, its not bad outside , we give mint tea anyway:)	1389378322	421709366161866752	f	chefsamirtruck
Ww are on 47st between park av and Lexington av	1389287172	421327055830396928	f	chefsamirtruck
Feeling cold NY! Stop by for a FREE HOT Moroccan Mint Tea!	1389199722	420960262040993792	f	chefsamirtruck
Is on 52nd St @ Park Ave today!	1389199637	420959906574131200	f	chefsamirtruck
We are close today for  truck maintenance!!	1389025672	420230243837018112	f	chefsamirtruck
Wow New York! What a new year!\n Way to start!\n Stay tuned for some good old fashion FREE Moroccan mint tea!	1388795955	419266740841766912	f	chefsamirtruck
May you all be happy &amp; healthy by eating the BEST COUS COUS IN TOWN! (ours!)	1388588527	418396724768415744	f	chefsamirtruck
We look forward to this 2014 to bring us all some magical time and new, happy &amp; creative ways to keep on spreading the LOVE with our food!	1388588492	418396580740231168	f	chefsamirtruck
Thank You NY for last year you've been kind to us most of the times. You've been a bit naughty too sometimes but that's part of the game!	1388588400	418396194717433856	f	chefsamirtruck
HAPPY NEW YEAR!	1388588315	418395834489659392	f	chefsamirtruck
We are on water st and old slip	1388420597	417692375046455296	f	chefsamirtruck
We are on water st and old slip!!!	1387818096	415165303547760640	f	chefsamirtruck
We are on w55st and broadway!!	1387558281	414075561062178816	f	chefsamirtruck
We are on 47st between park av and Lexington av, free hot mint tea today	1387471917	413713321825959936	f	chefsamirtruck
We are on 47 st between park av and Lexington	1387465214	413685211314937856	f	chefsamirtruck
is on 52nd St @ Park Ave today!	1387382305	413337462933434368	f	chefsamirtruck
We are on 36st and broadway, its cold , get your food with a free mint hot tea	1387304090	413009404578263040	f	chefsamirtruck
We are on W4 st , between mercer st and green st for dinner, it's our first time, so we say hello with free mint tea!##	1387225424	412679455833079809	f	chefsamirtruck
We are on at the corner of water st and old slip!! Its cold out there, but get your free mint tea while you are waiting for your order:))	1387211915	412622794623827968	f	chefsamirtruck
Is on old slip @ water St. Today!	1387209758	412613750152511488	f	chefsamirtruck
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
We are back on the streets. Lunch today on 49 Street bwt 6th &amp;7th ave http://t.co/T8GPYUfE	1358435836	291927166667595776	f	thecrepestruck
RT @fourwheelfoodie: While @kraftfoods EZ Mac isnit bad, weill take the @mactruckny alternative any day. Their superbly cheesy truck doesni...	1389361650	421639440336191488	f	mactruckny
@katie_pierce @kbsp_agency i miss my #macheads on varick!!!	1389302712	421392233523580928	f	mactruckny
@castingqueenny my email is dom@mactrucknyc.com	1389302656	421391999682772993	f	mactruckny
@msamandarush thank you, always a pleasure seeing you at my window 	1389302559	421391594101944320	f	mactruckny
29th st and Park Ave until 2:30 today.	1389280424	421298753212260352	f	mactruckny
@ItalianPizzaVan the pizzas look great.  hope to make it across the pond for a slice #yum #pizza	1388990125	420081149692506112	f	mactruckny
@franklinshepard absolutely	1388679283	418777382615801857	f	mactruckny
@franklinshepard i miss 47th more than you know. Havent found a consistent spot since.	1388679037	418776354050813952	f	mactruckny
@dhulser hahaha, ill wait it out today.	1388677911	418771631319056384	f	mactruckny
On Broadway between 55/56 for lunch. I'm the only truck here... I guess i didnt get the memo.	1388675871	418763074288746496	f	mactruckny
RT @DispatchBP: . @BrookfieldPlNY NORTH Lot | Monday, Dec. 30th, 2013 | North End Ave. &amp; Vesey St. | 11a-3pm | @MacTruckNY &amp; @ShortysNYC #N...	1388420108	417690325801787392	f	mactruckny
@ohlivvyuh the  has a christmas hangover  probably not getting out of bed till 2014	1388073962	416238482152230912	f	mactruckny
Good morning North End Ave. serving lunch and Christmas Cheer till 3	1387814257	415149200603877376	f	mactruckny
RT @DispatchBP: . @BrookfieldPlNY NORTH Lot | Friday 12/20 until 3p | N. End Ave./Vesey | @MorrisTruck @Mexicue @SchnitznThings @MacTruckNY...	1387559110	414079037716586496	f	mactruckny
@ohlivvyuh looks like ill have to set my alarm earlier to be there!!!	1387557177	414070929762025472	f	mactruckny
Gonna be at North End Ave and Vessey St. To finish out the week. WFC	1387545568	414022236698189824	f	mactruckny
@jasondanielhood thanks Jason!!! Always a pleasure seeing you. Hope you enjoy the holidays. 	1387544530	414017883606630400	f	mactruckny
RT @jasondanielhood: bacon on the bottom. mac&amp;cheese in the middle. more bacon on top. some bread crumbs. pure: @mactruckny http://t.co/so6...	1387544463	414017602537947136	f	mactruckny
RT @ChrisStripe: @mactruckny missing that pulled pork mac and cheese at the Saratoga race track. Counting down the days	1387544456	414017574389960704	f	mactruckny
@megannwhitneyy connoisseur you say? I'm gonna need to see some credentials please . I'll be at North End Ave tomorrow. World financial.	1387503936	413847619644178432	f	mactruckny
Kasar truck is in SOHO at Broadway and Spring Street.	1388859333	419532569311735808	f	chipsykingny
Kasar truck is at 46th street between 5th and 6th avenues until 5 pm. Happy new year!!!	1388674920	418759082867056640	f	chipsykingny
Happy new year!!! All the warmest and kindest wishes from all of us at Chipsy King family.\nKasar truck will... http://t.co/AdCNcs6zmg	1388490518	417985645844246528	f	chipsykingny
Kasar truck is at Broadway and prince  street until 9 pm. Happy   Monday!!!	1388424278	417707816615702529	f	chipsykingny
Kasar truck is in Soho at broadway and spring street all day until 8pm. Happy Sunday !!!	1388315302	417250735063977984	f	chipsykingny
Kasar truck is in Soho, broadway and spring street until 9pm, and all night until 4am at 7th and Christopher.\nHappy Saturday!!!!	1388240487	416936941112659968	f	chipsykingny
I posted a new photo to Facebook http://t.co/76IaZjpkNQ	1388182645	416694333098950656	f	chipsykingny
Happy Friday !!!\nKasar truck is at Christopher street and 7th avenue all day and night until 4 am.  Keep warm and enjoy hot belgian fries.	1388182535	416693872451125248	f	chipsykingny
Kasar truck is in Soho, broadway and spring street until 8pm. Happy Thursday!!!	1388074705	416241601812238336	f	chipsykingny
Merry Christmas !!!\nAll the warmest wishes.\nKasar truck is ice skating at Rockefeller center, at 49th street... http://t.co/hvMiTcTF1C	1387978212	415836879427092480	f	chipsykingny
Happy Tuesday!!! Kasar truck is at Broadway and spring street all day until 8pm, join him for the last days of... http://t.co/Dg49gnB9Pj	1387880841	415428475885854721	f	chipsykingny
Happy Sunday, join us in Soho today, Broadway and Spring street. All day until 9pm.	1387715743	414736003824238592	f	chipsykingny
Broadway and Spring street :: typo.	1387651848	414468008115843072	f	chipsykingny
Kasar truck is at broadway and sprig street in Soho\nAll day until 8pm\nJoin us!!!	1387651810	414467849873141761	f	chipsykingny
TGIF!!! Kasar truck is at broadway and 56th all day until 6 pm.	1387539222	413995623197577217	f	chipsykingny
Peace Fries http://t.co/mSo0OMD7Uo	1387477120	413735147738247168	f	chipsykingny
Kasar truck is at Columbus and 91street all day until 6pm\nHappy Thursday!!!	1387457779	413654026387857408	f	chipsykingny
Kasar truck is at Brooklyn college all day until 8pm\nJoin us. Happy Wednesday!!!!	1387380657	413330551999713280	f	chipsykingny
Kasar truck is at Wall Street and Williams all day until 6pm\nHappy Monday!!!	1387194270	412548789044387840	f	chipsykingny
Kasar truck is in Soho\nBroadway and Spring street\nAll day until 7pm\nJoin us	1387114468	412214075779600384	f	chipsykingny
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
We are still open. Come visit us!!!\n7th ave and 40th street	1385875482	407017391949119488	f	crafflesnyc
#crafflesnyc#craffles #movienight http://t.co/wBpO0rnhay	1385867207	406982681445269504	f	crafflesnyc
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
@ducky_krupnik sorry about that.  Hope the sandwich was good tho. Thank you your patience	1379952427	382174295944089600	f	parissandwich
@ducky_krupnik sorry was this at the book fair?	1379947749	382154675094839296	f	parissandwich
Hey midtown we will be on 56th and broadway today	1379947620	382154133341757440	f	parissandwich
Come to our Mott st location to try our street style Vietnamese banh xeo (savory crepe) http://t.co/CX8m447ddF	1379610178	380738800994893826	f	parissandwich
@JAMNYC1 place I had mentioned to you @PulperiaNY  exquisito!	1389410610	421844793317400577	f	tacobite
@nycfoodtruck @FoodtoEat place to be PULPERIA on ESSEX @PulperiaNY, L.E.S. Exquisite Tapas,Wine/Beer selection &amp; Hospitality!    ATREVETE'	1389406447	421827329464467456	f	tacobite
TacoBiters!! The place to be is this Giant piece of SPAIN in the L.E.S. PULPERIA ON ESSEX, Exquisite... http://t.co/3eKbRAtXS6	1389399967	421800151725129728	f	tacobite
Giant piece of SPAIN in the L.E.S. PULPERIA ON ESSEX, Exquisite Tapas,Wine/Beer selection &amp; hospitality! Atrevete' http://t.co/ar8ZXswJDi	1389399157	421796755760775168	f	tacobite
Rain/snow tacobiters still out to get their dose.... http://t.co/DifwkcMOQm	1389375310	421696732263903232	f	tacobite
Happy Friday, TacoBiters!!\nLunch being served on \n47th str \nbet Park Av/ Lexington Av\nPlace your order in advance for pick-up. \n347-70T-Bite	1389370024	421674562456399872	f	tacobite
@thomassilvera LOL! Right now we are short staffed but working on being out there on Sundays too.:-))	1389318283	421457544515960833	f	tacobite
Serving Lunch on 47th str\nbet park Av / Lexington Av\nCall in advance for pick-up @ 347-70T-Bite	1389288548	421332827645702144	f	tacobite
Today servings Lunch on \n47th str \nbet. Park Av / Lexington Av\nCall in advance @ 347-70T-Bite\nfor pick-up	1389284411	421315474581127168	f	tacobite
We are off the road \n:-( today due to the freezing weather, stay warm &amp; we will be back out tomorrow.	1389113073	420596830217719808	f	tacobite
Serving Lunch on 47TH STREET BET PARK AVE / Lexington Av. \nCall @ 347-70T-Bite for pick-up	1389026600	420234138529320960	f	tacobite
Serving Lunch today on 47th St. \nBet Park Av / Lexington Av\nCall @ 347-70T-Bite \n&amp; pre order for pick-up.	1389026514	420233777013854208	f	tacobite
@jsqfunk yes we are, lunch today on 47th bet park/lex	1389026283	420232807991222273	f	tacobite
@UndrcvrMother thank u, u too.	1388854036	419510349705248768	f	tacobite
:-( due to mechanical issues, we will not be on 67th street and broadway today.	1388854006	419510223842607104	f	tacobite
@Teamcap84 :-( no we won't, we confronted mechanical issues this morning &amp; now trying to get it fixed.	1388853908	419509814717591552	f	tacobite
Serving it up today on the last day of the year 2013!!\nWe're on the corner of 67th street &amp; Broadway. \nTo the... http://t.co/20FOBbF4ek	1388508231	418059939756912640	f	tacobite
Emily, Thank u!!! fot the shout out on twitter. http://t.co/ZtivD4HZvr	1388434630	417751234519764992	f	tacobite
@EmilyARupp thank u!!!! For the shout out..	1388433447	417746273786421248	f	tacobite
Correction. ..\nToday serving Lunch on\n47TH street\nBet\nPark Av / Lexington Av\nCall in advance for pick-up\n@ 347-70T-Bite	1388421272	417695206889500672	f	tacobite
Today's specials! Get your sweet heat on! http://t.co/n7MPCZtRSX	1389372313	421684163658649600	f	sweetchilinyc
It's lunch time at north end and vesey till 3! Free coffee to anyone who asks for it! #thaietnamese #sriracha	1389370644	421677161972785152	f	sweetchilinyc
Back tomorrow @BrookfieldPLNY north end and vesey to make up for missing today! See you there :-) #foodtruck	1389310202	421423650617970689	f	sweetchilinyc
The movie showing at jury duty is The Fugitive! #ironic #really	1389286038	421322298415931392	f	sweetchilinyc
@DispatchBP @BrookfieldPLNY @fritesnmeats @Palenquefood @milktrucknyc @ESTacoTruck sweet chili won't be there today. Jury duty!	1389281403	421302857871400960	f	sweetchilinyc
Just posted a photo @ Queens County Civil Court http://t.co/5KJ5NlLFcC	1389279973	421296859391725569	f	sweetchilinyc
we wont be going out today with the truck.  I have jury duty!  Sorry!	1389271230	421260190634086400	f	sweetchilinyc
Hanging at south end and liberty till 3 today! Ask for a free sample of our coffee while you wait! We will rock your food out fast all day!	1389196787	420947954552537088	f	sweetchilinyc
It's not every day someone writes a poem about our truck! Our fans are amazing!! http://t.co/PIVAuHxM6a	1389105595	420565466533613568	f	sweetchilinyc
not headed out today with the truck, no heat + 4 degrees = bad idea :( stay warm everyone!! #coldweather	1389104319	420560115498905602	f	sweetchilinyc
@alhernandez76 @midtownlunch glad you enjoyed! Stay warm today!!	1389104254	420559840151216128	f	sweetchilinyc
We are hanging at Broadway &amp; 56 from 11-3! We missed our fans in midtown! @midtownlunch #thaietnamese #sriracha #rainyday	1389015704	420188435769339904	f	sweetchilinyc
#HappyMonday It's good to be back! A little rain isn't so bad right? At least it's melting the snow:) #nyc #foodtruck	1389007007	420151957055995904	f	sweetchilinyc
Small truck issues  today had to leave early. Sorry!	1388690458	418824253950423040	f	sweetchilinyc
It's lunch time at north end and vesey! Here till 3! #thaietnamese warm up with some sweet heat!	1388679804	418779567256768512	f	sweetchilinyc
RT @DispatchBP: . @BrookfieldPlNY NORTH Lot | Thurs., Jan. 2nd | 11a-3pm | North End Ave. &amp; Vesey St. | @SweetChiliNYC | #nycfoodtrucks #th...	1388675167	418760119082811392	f	sweetchilinyc
we are back! north end &amp; vesey 11-3! Free cups of coffee to anyone who wants it! stay warm today with some Sweet Heat! #thaietnamese	1388666938	418725605329235969	f	sweetchilinyc
#Happy2014 from the @sweetchilinyc team! Our @kickstarter campaign ends tonight!  Help us fund a small portion of our new truck building!	1388600374	418446417166733312	f	sweetchilinyc
#happyMonday we wont be going out today or tomorrow due to the truck having some issues once again:( We are hoping Thursday we will be out!	1388419551	417687987804053505	f	sweetchilinyc
@purplejong no I'm sorry we cant go out for a few days.  The truck needs a quick doctors appointment:(	1388419493	417687745587187712	f	sweetchilinyc
https://t.co/xqRlRIfvkC http://t.co/3hmvJWxvsE	1389441492	421974320127430656	f	veganlunchtruck
#RP  http://t.co/AxzStZftgH	1389446812	421996634768437248	f	mrniceguytruck
Morning!! NYC. We Will be serve the lunch @ 7th &amp; Carroll in Park Slope til 4:30pm. Wish u a wonderful weekend.	1389448470	422003586059763712	f	shanghaisogo
kooky warm day. come celebrate climate change. truck-greenwich/chambers in tribeca. stand @bkflea 80 N 5th. &amp; sandwich menu @houstonhallnyc	1389449404	422007506488283136	f	milktrucknyc
!!! Happy weekend, everyone! No truck this weekend. Our shop open Sat 8am-7pm &amp; Sun 8am-6pm!!!	1389451432	422016012209254400	f	thetreatstruck
De Wake Up Grumpy is served. Come have yours at 15 Ave B: Le Wafel Cafe. http://t.co/iOiL8I1fY0	1389451193	422015009456418816	f	waffletruck
Pagadder is at Brooklyn Bridge/City Hall Park until 5pm\nKotmadam is in Williamsburg N 5th &amp; Bedford all day!	1389450986	422014142816735232	f	waffletruck
Goesting is at Broadway &amp; 66th till 9p\nVedette is at 60th &amp; 5th till 6pm	1389450977	422014101364424704	f	waffletruck
Momma Truck is at 7th &amp; Carroll till 4:33 pm\nKastaar is In Soho at Prince &amp; Greene till 9pm	1389450928	422013899014422528	f	waffletruck
Saturday! Who's ready for some brunch?\n\nDe Wafel Cabana at Herald Sq open til 10pm\nLe Cafe at 15 Ave B open til 2am	1389450899	422013776167440384	f	waffletruck
#bigred is staying dry inside today. @redhooklobster #redhook open 12-9 @bkflea N5 &amp; Wythe 10-6. #lobstahforlunch #crustaceanelation	1389451808	422017588361986048	f	lobstertruckny
@DoreneL1 sure! it will most likely be all winter long! But its only a small cup:)	1389452104	422018829862965248	f	sweetchilinyc
Bessie's at Tribeca b/w Chambers &amp; Greenwich, call (646) 504-6455 to pre-order or http://t.co/IwkqcCHPzF.	1389452423	422020166432473091	f	milktrucknyc
Find our indoor stand at @bkflea @smorgasburg winter market, North 5th &amp; Wythe. Sandwich menu always at @HoustonHall_NY	1389452422	422020165304213504	f	milktrucknyc
"Measure twice, cut once" goes double for cooking well.	1389454806	422030162595938304	f	neaexpress
Looking for chicken wings for your super bowl party?? Look no further! http://t.co/Zq82w18QxN	1389452849	422021953554481152	f	sweetchilinyc
Looking for AMAZING chicken wings for your Super Bowl party? Look no further! #chickenwings #SuperBowl #Sriracha http://t.co/9a51mafL8e	1389452540	422020659426762753	f	sweetchilinyc
Anyone wanna share their spotify playlist with us? Promise we'll play it all day at 67th and broadway (must be Ke$ha-less)	1389455773	422034218638913536	f	nautimobile
No weather will prevent us from serving U today. Our famoustruck @ Bway &amp; 67 Str . For lunch &amp; dinner	1389455749	422034118856040448	f	mausamnyc
We will be catering for Super Bowl!! Call for more info! 914.457.4324! http://t.co/ItVzLIMl1g	1389457640	422042051208036352	f	mrniceguytruck
@miichaelson got this on blast now	1389457447	422041238800728065	f	nautimobile
Park slope, are u hungry yet? Get ur Asian tapas from us. We Will be serve the lunch @7th &amp; Carroll til 4:30pm. SOGO FOR IT &lt;&lt;...	1389458047	422043756641402880	f	shanghaisogo
We bring our Mausam's kitchen to U.347-206-1539 place yr order and it'll be ready for U No waiting on line	1389456753	422038329937244160	f	mausamnyc
Treat yr family with our delicious mealswe have platters to satisfy vegan/vegetarians/non vegetarians spicy mild flavors for all	1389456156	422035825707085824	f	mausamnyc
Come to Smorsgasburg and enjoy a delicious Colombian hot soup! (Ajiaco, sancocho and lentil soup)\nNorth 5 btw Berry and Wythe.	1389459347	422049208309645312	f	palenquefood
Happy Saturday!!\nToday serving on \n67th St. &amp; Broadway\nIn front of the \n" APPLE " store\nCall in advance for pick-up @ 347-70T-Bite	1389459528	422049968514691072	f	tacobite
Looks like the Mayor's catching some flak for using a fork. Personally, we say to each his own. http://t.co/F4Gqr57e4K	1389462040	422060506061758464	f	neaexpress
Thank you @CBSnewyork for visiting us! - NYC Food Truck Lunch: Empanadas &amp; Soup from the New Nuchas Stand http://t.co/l6bEEcOrWr	1389459932	422051662631809024	f	nuchasnyc
@thomassilvera tomorrow sunday we will be on 67th street!! :-)) hope to see u	1389462376	422061913712111616	f	tacobite
We're excited to feature breakfast on our catering menu! Looking to cater? contact us! OldTraditionalPolishCuisine@yahoo.com	1389465860	422076527145385985	f	polishcuisine
#foodtruck parked on #broadway &amp; prince st. Your #empanadas for the day #muchasnuchas.	1389463516	422066694371020800	f	nuchasnyc
We're excited to feature a Traditional Polish-style breakfast to our catering menu! Looking to cater? Contact us:... http://t.co/8JvvzXcFEk	1389465993	422077084950089730	f	polishcuisine
@earl_penney this one is on queue, looks promising.	1389467832	422084799365672960	f	nautimobile
@benwietmarschen us, we are #poppinoff	1389467780	422084581731614720	f	nautimobile
@heymikewaskom these are fresh	1389467759	422084491260489728	f	nautimobile
The cure for a gray day? Hot cocoa with whipped cream! Available at all of our locations. http://t.co/YbXb6txjkN	1389467781	422084582692122624	f	waffletruck
Delicious chicken tikka masala n samosa excellent pleasant service . Will be back for dinner and will take yr recommendation	1389469069	422089984644886528	f	mausamnyc
warm up with our spicy vindaloo flavordon't let the weatherprevent U from yr favourite dinner.347-206-1539 place yr order	1389468852	422089076452233216	f	mausamnyc
A shot of our truck snuck into this TheWeek article: http://t.co/lGPWavCk5n	1389469845	422093239681032193	f	neaexpress
Just posted a photo http://t.co/xvywcyyxPb	1389470410	422095610561695744	f	sweetchilinyc
Fresh baked #medialunas! #regram @filthyrichmra http://t.co/ByCDqXX5Gj	1389472274	422103427192074240	f	nuchasnyc
#saturdaynightdinner @BKBazaar with @MayhemAndStout, @SnapTruck @oaxacatacos, us &amp; much more, what else do u need? #foodporn	1389474086	422111030266044417	f	getstuffednow
If only we could make doggie safe De Boms! http://t.co/bWRAxuCYcz	1389476023	422119153802424320	f	waffletruck
RT @SirFenimore: Thank god there's a @NuchasNYC truck outside CSC today.	1389475590	422117337345847296	f	nuchasnyc
Prepare for #NFLSundays! Who's ready to enjoy #muchasnuchas during the game?	1389474321	422112015277387776	f	nuchasnyc
@fieldshimself only during the summer on Sundays when the farmers market is happening. Mother's Day-thanksgiving.	1389477340	422124678334144512	f	veganlunchtruck
Dinner time soon! We are here  to serve our mouthwatering platters create  any combo only $11 	1389478229	422128405874626560	f	mausamnyc
Uready!  DaLe'''\nFlipping It Baby! \n#flipagram made with @flipagram \nMusic: Pablo Fierro - Djambo \nhttp://t.co/dpZAmgEvTw	1389479904	422135430159798273	f	tacobite
RT @anakiya: @thegreenradish1 this is what it's all about. Paying it forward.	1389494546	422196846141116416	f	thegreenradish1
PAY IT FORWARD: \n\nReceived an email from a young Frenchmen interested in starting a food truck in the south of... http://t.co/PJ3tR0yXX3	1389485323	422158159113768960	f	thegreenradish1
Wafels into the night!\nMomma is at 7th &amp; Christopher until 1am!\nKastaar is at Astor Place until 1am!\nCome get those late night wafels.	1389485009	422156845055500288	f	waffletruck
Grab #MuchasNuchas before watching Water Panics in the Sea, film by Laleh Khorramian 11:57pm-12am all month long in @timessquarenyc!	1389493846	422193909490786304	f	nuchasnyc
@eminencess Thanks! Stop by any time	1389531482	422351767699857408	f	carpedonutnyc
Donuts at Court and Bergen today until 4:30!	1389531368	422351285900550144	f	carpedonutnyc
Just setting up here in Le Cafe. Come grab your morning coffee, breakfast or brunch with us this sleepy Sunday. http://t.co/CoF84MWIlR	1389533985	422362263333265410	f	waffletruck
For one free dinges tell us how the Golden Globes got their name!	1389533772	422361369657487360	f	waffletruck
Vedette is at 60th &amp; 5th till 6pm\nPagadder is at Brooklyn Bridge/City Hall Park until 5pm	1389533685	422361006393012225	f	waffletruck
Momma at Forest Hills at 71st Ave &amp; Continental Ave til 10pm\nGoesting is at Broadway &amp; 66th till 9pm	1389533675	422360965066530816	f	waffletruck
Sunday wafel Sunday!\n\nDe Wafel Cabana at Herald Sq open til 10pm\nLe Cafe at 15 Ave B open til 2am	1389533656	422360883126603776	f	waffletruck
Happy Sunday! Our shop open 8am-6pm w/food &amp; treeeats &amp; gingerbread houses! Gingerbread in January, yes...!!! (no truck today!)	1389534596	422364824929337344	f	thetreatstruck
Today Sunday we will be on\n67th st &amp; Broadway!!\nIn front of the \n"APPLE" store	1389538482	422381127756972032	f	tacobite
@oaxacatacos ooh! sounds delicious, will definitely try, thanks!!	1389540471	422389468331778048	f	getstuffednow
Working on a #homemade crab cake bun slider, need a new sauce idea other than mango salsa, anyone?	1389539088	422383669589065728	f	getstuffednow
RT @JussCakes: Trying the Bacon Cheddar Blue and Arnie Palmer! #mylunch #tribecaisbetter #goodeats (at @milktrucknyc) [pic]: http://t.co/6n...	1389539941	422387244230782976	f	milktrucknyc
RT @martins4xf: @Sharipep @milktrucknyc drooling here!!!	1389539926	422387181290663936	f	milktrucknyc
Indoor stand at @bkflea @smorgasburg winter market, North 5th &amp; Wythe. Sandwich menu always at @HoustonHall_NY	1389538824	422382559356407808	f	milktrucknyc
#bigred is catching some beauty sleep. @redhooklobster #redhook 12-8 &amp; @bkflea #bkflea 10-6 N5 &amp; Wythe. #crustaceanelation #lobstahforlunch	1389541976	422395781577183233	f	lobstertruckny
Right back at it.               634 McLean Ave. Yonkers.   Sliders fries Wings. Grab a Super Bowl menu... http://t.co/1zymsIkiYw	1389544771	422407502312251392	f	mrniceguytruck
We are @ Bway bet 62 &amp; 63 Str. 4 blocks from store. Will  servinglunch &amp; dinner	1389544001	422404274379694081	f	mausamnyc
Hey all @FortDixNJ serving up our famous cheesesteaks to the troops&amp; their families for MilitaryAppreciationDay #JBMDL #Huddletour GOT WHIZ?	1389547601	422419372687519744	f	carlssteaks
Park Slope. We are back for u! @ caroll St &amp; 7th ave. Shanghai Sogo Will servinglunch until 4pm. SG/SOGO FOR IT! C U ALLLLL LATER!!!	1389547863	422420473272860673	f	shanghaisogo
Yes!!TacoBite addicts...today we are here on \n67th St &amp; Broadway\nIn front of the \n APPLE store	1389548016	422421115873804288	f	tacobite
Happy SUNDAY!!!\nServing it up on \n67th street &amp; Broadway. \nBeat the long line by \ncalling in advance \n@ 347-70T-Bite\n for pick-up!!!!	1389549601	422427763103240192	f	tacobite
Try our wings! BBQ, Sweet Teriyaki, Garlci Chili, Mild, Hot Buffalo! #mrniceguy #wings #sliders #fries http://t.co/skpxQKx7ng	1389553214	422442917790490624	f	mrniceguytruck
Afternoon snack a la Le Cafe. 15 Ave B! http://t.co/KK1AWhVdkD	1389555840	422453931768578048	f	waffletruck
Replace one word in a song title with empanada. Go!	1389555906	422454207560810496	f	nuchasnyc
The besssst chicken curry n service delicous	1389556543	422456878522580992	f	mausamnyc
@benwietmarschen @heymikewaskom last propane tank in questionable shape. Trying to avoid self destruct mode.	1389558815	422466406773694464	f	nautimobile
Had to shut down today early at 67th and broadway due to technical difficulties :(	1389557078	422459123155091457	f	nautimobile
Comin' soon Taco Bite addicts rewards card....	1389557514	422460953427738624	f	tacobite
Big shout out to all the Taco Bite addicts who are using our 347-70T-Bite hotline.....why wait when we can have... http://t.co/8AqsHd7XOc	1389557411	422460519111753729	f	tacobite
Will be visiting yr Montclair restaurant with my family for dinner today.	1389560217	422472290664579072	f	mausamnyc
@WebsterHall   6 pm Biggggg party	1389562039	422479931898359808	f	valduccis
MNG Garlic Chili Wings. Now taking orders for Super Bowl. 914-457-4324 or email... http://t.co/Heqwulvem3	1389561396	422477234365288449	f	mrniceguytruck
It feels so good to be back &amp; even better to be at @globalFEST_NYC at @WebsterHall until midnight tonight! #shawarma #falafel #yumminess	1389561387	422477196490711040	f	toumnyc
Busy protecting our borders today... http://t.co/iRTocjshob	1389563872	422487618798882816	f	waffletruck
We are zzz getting dinner ready to serve  all taste buds. 	1389563697	422486886314029056	f	mausamnyc
Check us out tonight #globalfest @WebsterHall ! Look for our #delicious  #pizza in the Sports Bar!	1389566424	422498324542140416	f	valduccis
Wafeling is more fun when you do it with a friend! http://t.co/oxASUSbbmU	1389565259	422493435107762176	f	waffletruck
U create yr own combosno limits on items for yr platters. We r here to satisfy yr apptite	1389564415	422489895840382977	f	mausamnyc
347-206-1539 we are taking phone orders. No waiting on line yr meals will be ready waiting for U 	1389564108	422488610114269185	f	mausamnyc
GOT WHIZ? http://t.co/y6Hma5ytPp	1389582840	422567177162870784	f	carlssteaks
I posted a new photo to Facebook http://t.co/m8DdCSFywV	1389575335	422535699674304512	f	carlssteaks
I posted a new photo to Facebook http://t.co/pAxRoGWbc0	1389575335	422535698210492417	f	carlssteaks
I posted a new photo to Facebook http://t.co/EmGGgJ4zxc	1389575335	422535697904701440	f	carlssteaks
@carlssteaks awesome day serving our troops special thanks to the Super Bowl Host Committe for including... http://t.co/GeJWIyUMR5	1389575335	422535697312915456	f	carlssteaks
@Punx5570 tell them extra spicy we can make it happen.	1389573231	422526873747619840	f	shortysnyc
This week's schedule: http://t.co/3vMGOuEvqS	1389582844	422567193499672576	f	bigdsgrub
We are back!! 50th and 6th today, come by for some taco fix! :)	1389610783	422684378100015104	f	domotaco
RT @TheWaytoHisHear: Check out the blog tomorrow for a giveaway from @BrooklynPopcorn  #giveaway #cheddarpopcorn	1389583929	422571746185973760	f	brooklynpopcorn
Sunday night Sundae (on a wafel!) Come join us at Le Cafe at 15 Ave B. http://t.co/llQLnnREZi	1389576709	422541459947270144	f	waffletruck
@CatDaddy_24 she be waiting for ya.	1389567830	422504222064529408	f	waffletruck
@dreamingly precisely.	1389567813	422504149008146432	f	waffletruck
@charlotteNPD we do try.	1389567799	422504090489208832	f	waffletruck
@KeilinHuang anytime really	1389567755	422503903549087744	f	waffletruck
@brieholla Bryant Park market is over, but the Cabana on 35th and Broadway is always there for you.	1389567725	422503779376697344	f	waffletruck
@V_Bizzarro right?!	1389567680	422503590737870848	f	waffletruck
@CozzyQuiverLips got some for ya!	1389567664	422503522202951680	f	waffletruck
@melman101 @EnemyNanner yes yes, these things.	1389567638	422503413302059008	f	waffletruck
@davnel78 @Abbieprime @nearperfectmess and you didn't tell him?!	1389567606	422503279881252864	f	waffletruck
RT @Rice_Ball: @waffletruck boxes of happiness! http://t.co/a21LF5iKhO	1389567559	422503082506088448	f	waffletruck
@khutchinson thanks!	1389567532	422502971310473216	f	waffletruck
@KaijaLD come on down!	1389567517	422502908928598017	f	waffletruck
@momentoftru @ABC7NY how was our hair?	1389567491	422502797175574528	f	waffletruck
@tom_schober supposed to be. We'll have a talk.	1389567476	422502735427010560	f	waffletruck
@MichaelTerwindt why would you ever want to?	1389567450	422502626731626496	f	waffletruck
RT @dhuybrechts: A visit to #NewYorkCity would not be complete without some Belgium waffles in their from the new shop @waffletruck http://...	1389567428	422502533773664256	f	waffletruck
@warholwannabe show and a treat sounds like a good evening to us.	1389567415	422502479163424768	f	waffletruck
@_nananadia we know such pain. All too well.	1389567394	422502390634278912	f	waffletruck
@KaeleighMcCone we feel for you.	1389567372	422502300188291072	f	waffletruck
Welcome back from the wknd. We are @ 46str bet 5 &amp; 6 ave.Come &amp; Enjoy our famous Curry N bites 	1389617848	422714012791369728	f	mausamnyc
I posted a new photo to Facebook http://t.co/Sm6QhOmMzZ	1389618521	422716832772939776	f	polishcuisine
I posted a new photo to Facebook http://t.co/0h0C2kTIH1	1389618440	422716494716628992	f	polishcuisine
Rustic, Ciabatta, or Focaccia, What's your bread??\n\n47th bet Park and Lexington Ave today.\n\nCall in your order for pick up: 917-756-4145	1389620088	422723404706230273	f	disosnyc
Good morning! If you turn back now, you can pretend it's still the weekend.	1389620128	422723574919884800	f	neaexpress
What a beautiful day! We are on 48th b/w Patk and Lex (closer to park...)- we will be here for lunch!	1389620872	422726693179371520	f	polishcuisine
Boom- we are on 51st street and Park ave!!!!	1389621317	422728559401373696	f	seoulfoodnyc
HappyMonday @midtownlunch midtown we are hanging at Park ave &amp; 46~47 st. 11~3pm. Get ur Asian tapas for the day &gt;&gt;SOGO FOR IT &lt;&lt;...	1389621586	422729691121061888	f	shanghaisogo
#HappyMonday @midtownlunch midtown we are hanging at Broadway &amp; 56 cooking up Sweet Heat 11-3! Free coffee samples, just ask...or dance!	1389621064	422727499454631936	f	sweetchilinyc
This week @thegreenradish1 \nTuesday-51&amp;Park\nWednesday-38&amp;Bway\nThursday-52&amp;6ave\nFriday-56&amp;Bway\n#tasty #veganlunch #midtownlunch	1389622249	422732470178422784	f	thegreenradish1
@Arkij yes we will be	1389622922	422735292660211713	f	lovemamak
WFC South End&amp;Liberty! It's a beautiful day for noodles! Join us for lunch! @BrookfieldPLNY @downtownlunch 11-3pm	1389623364	422737145632415744	f	mamuthainoodle
#HappyMonday #NYC 50th&amp;6th today! It's going to be nice, come by for #lunch ! #BestPizza #Foodies	1389623366	422737155148890112	f	valduccis
Craving schnitzel? or maybe shawarma?\nParked on 46th between 5/6th ave today!  Open for lunch from 11-3:00.	1389623333	422737017756483584	f	grillonwheelsny
Vedette is at 60th &amp; 5th till 6pm\nPagadder is at Brooklyn Bridge/City Hall Park until 5pm	1389623267	422736739606994944	f	waffletruck
Kastaar is at NYU Stern til 9:59pm\nKotmadam 23rd and broadway til 7pm\nGoesting is at Broadway &amp; 66th till 9pm	1389623255	422736690990825473	f	waffletruck
De Wafel Cabana at Herald Sq open til 10pm\nLe Cafe at 15 Ave B open til 2am\n\nMomma at 43rd &amp; 6th til 4:31pm	1389623215	422736520576245760	f	waffletruck
Great Crisp Morning :)\nG1 5th Ave. @ 20th Street\nG1 Broadway @ 55th\nRocking the mixed vege melts...\n#ComeToTheCheeseYo	1389623713	422738610371444737	f	gcnyc1
Broadway and 55th Street, 11am to 2:30pm\nPreorders call 646-543-BIGD\nSee you for lunch today\n#MidtownWest	1389623825	422739081060442112	f	bigdsgrub
This week our truck will be at our spots Wed, Thurs &amp; Fri! Hope to see you then!!!	1389624098	422740226579365888	f	thetreatstruck
It's a glorious day for a taco. On our way  to N. End Ave &amp; Vesey St.	1389623647	422738331919589376	f	kimchitruck
Bananas and Nutella on a liege wafel. A well balanced breakfast! http://t.co/92JdJ8vgOA	1389623590	422738096120422400	f	waffletruck
Catch us on the corner of jay &amp; water! @dumbolot @DUMBOFoodTrucks	1389624553	422742135180636160	f	mooshugrill
Good Morning nYc! We are parked on 47st btw Park ave &amp; Lexington ave.Free delivery! Place ur order http://t.co/ZQROfAbNSb or call 3474403467	1389624493	422741881672724480	f	freshandhearty
Hey heat wave is on! 49thst bet 6/7th av 11-3 for Carl's famous cheesesteak @Barclays @FoxNews @SIRIUSXM GOT WHIZ? http://t.co/tumZCa2d0Z	1389625441	422745858044866560	f	carlssteaks
Our #lobstermen #sternmen #bigred and all our #bait are taking it easy today. Check us out tomorrow.	1389625339	422745429517021184	f	lobstertruckny
Bessie's at 22nd &amp; Park, call (646$ 504-6455 to pre-order or http://t.co/psDZsxYjzF. Sandwich menu always at @houstonhallnyc	1389625714	422747002397798400	f	milktrucknyc
bessie's out today @ 22nd &amp; park. preorder at 6465046455 or online @FoodtoEat	1389625659	422746771606208512	f	milktrucknyc
Hello midtown peeps, lunch 2day @ 50th st b/t 6th &amp; 7th av. Burger of the week THE SMITHLAND preorder. 9172929226	1389625416	422745754055479296	f	fritesnmeats
Improv Everywhere's annual No Pants Subway Ride came and went yesterday. See anything?	1389625556	422746340150755330	f	neaexpress
Lunch is being served on W26st between 11th &amp; 12th Ave. Looking forward to serving you. Thank you.	1389626673	422751026933170176	f	eddiespizzany
Catch us at 55th &amp; Brosdway today!	1389626305	422749480421953536	f	korillabbq
I posted a new photo to Facebook http://t.co/mRzJADWemx	1389626678	422751048051482624	f	polishcuisine
I posted a new photo to Facebook http://t.co/pBh06oC6ru	1389626585	422750655665954816	f	polishcuisine
Hey guys the #schnitzcart is on corner of 55th &amp; broadway. New location for us. @randomfoodtruck come by for some schnitz:) 11:30-2pm	1389626287	422749406916800512	f	schnitznthings
Sorry guys trucks not on the road today. We'll be back on the street tomorrow servin' up the goods.	1389626174	422748931248771072	f	philssteaks
Is on Old Slip @ Water St today!	1389626504	422750314723569664	f	chefsamirtruck
53rd and park. Enjoy the sunny weather!	1389627227	422753350954647552	f	biandangnyc
Who's thinking about lunch? 50th &amp; 6th!  Come and get it! #PIzza #Midtown #NYC #delicious #lunchtime http://t.co/lmxbOf1aCS	1389627737	422755485884760064	f	valduccis
Come to the Valducci's truck for a beautiful meatball and ricotta slice! #bestpizza# http://t.co/vGB5JNRqgl	1389628760	422759779895750656	f	valduccis
Drop off your old cell phones! #SupportTheTroops Cell Phone For Soldiers Drop Off Site! 50th&amp;6th! http://t.co/jjFAy3EbEc	1389628221	422757519987970050	f	valduccis
Ready at 55th &amp; Broadway by 11:30	1389628530	422758814027636736	f	korillabbq
The #schnitztruck is on Varick and Charlton for our for Hudson and King schnitz fans from 11:30-2pm. Come by or preorder 347-772-7341	1389628278	422757758833000448	f	schnitznthings
Come n' Grub today at 55th Street and Broadway. 11am to 2:30pm. Preorder lunch for pickup call 646-543-BIGD #MidtownWest @randomfoodtruck	1389628784	422759878432944128	f	bigdsgrub
It's a Front St &amp; Jay Monday. Soups are Spicy Chicken Chowder + Navy Bean &amp; Kale (vegan).\n@DUMBOFoodTrucks	1389628359	422758095379783680	f	thesteelcart
Happy Monday!! Were at @javitscenter today and tomorrow for the @RetailBIGShow be back at our regular spots next week	1389629268	422761911168409600	f	mikenwillies
WFC for lunch-- North End and Vesey.	1389629318	422762120472580097	f	shortysnyc
It's a beautiful day in the neighborhood! #Midtown today at 52nd &amp; 6th, come eat and start the week off on the right stomach! #goodfood	1389629441	422762636518772736	f	morristruck
Disos open for lunch.. Catch us on 47th st bet park and lex ave\n\nCall in your order for pick up: 917-756-4145	1389629000	422760783932436481	f	disosnyc
Happy Monday! Taco Bite addicts. ..\nToday serving it up on \n47th St Bet \nPark Av / Lexington Av. \nCall in advance... http://t.co/3yJQ5ptx1Y	1389629482	422762805826441216	f	tacobite
It's so lovely out, DUMBO! Come enjoy lunch with us on Water &amp; Jay in the @dumbolot :) #avocadooverload	1389630089	422765355233447936	f	mexicoblvd
Lunch time at Broadway btw 55 &amp; 56! Come get some! http://t.co/Zim9OKThqa	1389629895	422764539361640448	f	sweetchilinyc
Are you following us on Twitter? Make sure to follow @goburger to know our location in real time!	1389630875	422768650928402432	f	goburger
45th and 6th!	1389630670	422767788277891072	f	mexicue
Open until 2:30 on 48th b/w Park &amp; Lex - Smokin' grilled kielbasa, potato &amp; cheese, meat, spinach &amp; cheese pierogi today! #yum #pierogitime	1389630950	422768965375782912	f	polishcuisine
Located on Hudson and King!	1389631253	422770236157612032	f	thepocketful
Hello New york!! We r open 46st.  Beween 5th and 6th ave.  Bobjo express open at  state st &amp; Whitehall st . Try our ramen noodle soup!!Thax!	1389630966	422769029783494656	f	bobjotruck
RT @FoodtoEat: @NuchasNYC @ToumNYC @TheSqueezeTruck @KimchiTruck @UncleGussys @DesiFoodTruck 6 Ways to Do Meatless Monday Right http://t.co...	1389632405	422775068817903616	f	toumnyc
@m_longas @roseemaariee we're free.	1389632316	422774695499268096	f	waffletruck
@FeelinPChi dear wafel eater. You are special.	1389632294	422774601702072320	f	waffletruck
@Jackie_Rabbit_ come get this!	1389632255	422774439642537985	f	waffletruck
@WeAreNewYorkers preach!	1389632242	422774383929602048	f	waffletruck
@kylepjennings @dissonantyellie yes, yes you do. Also, http://t.co/EU3C3XI9Gh	1389632219	422774285850013696	f	waffletruck
@evicky145 no judgement here.	1389632156	422774021105528833	f	waffletruck
@ranjodhd RESISTANCE IS FUTILE!	1389632123	422773884031492098	f	waffletruck
Meet our #foodtruck on 55th &amp; 6th today for back to school #empanadas!	1389631874	422772838303416320	f	nuchasnyc
Best new truck of 2013 midtown lunch! http://t.co/XPYyPvSLOv	1389631647	422771886473625600	f	sweetchilinyc
Taking a break for tune-ups over the next few weeks. We'll be back! Stop by BLT Burger New York or GO Burger New York for your burger fix!	1389632429	422775167274995712	f	goburger
We are open now @ 47th st &amp; park ave. Until 3pm. Come &amp; get ur Asian tapas.	1389632870	422777017437020160	f	shanghaisogo
@thomassilvera omg! Thank u...always a delight to see u guys....	1389632623	422775982186315776	f	tacobite
@Enigma0280 sorry, no Ba Mee Hang today. :( just our yummy Tom Yum soup! Come by and say hello!	1389633750	422780709687025664	f	mamuthainoodle
It's #lunchtime ! 50th &amp; 6th ! Come and Get It! #BestPizza! #Midtown! http://t.co/wUeeKq6tnq	1389634625	422784377060204545	f	valduccis
Kick the Monday blues with a cup of La Colombe Torrefaction! http://t.co/5PfpsduTl4	1389634974	422785841610911744	f	nuchasnyc
De BBQ Pulled Pork Wafel. It really is as delicious as it sounds. Available at our trucks and Le Cafe. http://t.co/UoRNJDx5VQ	1389635185	422786727590514688	f	waffletruck
RT @nycfoodtruck: Go big or go home! RT @bigdsgrub: This week's schedule: http://t.co/Ck8lW8g8Jy	1389636121	422790653933019137	f	bigdsgrub
The a Diavolo's heat is a good way to pretend that its June.	1389639328	422804102457085952	f	neaexpress
Thanks for coming! We will be on 52nd street tomorrow (Tuesday) ; around varick/vandam on Wednesday.....	1389641130	422811662924529665	f	polishcuisine
RT @starrett601: Green Chili Mac &amp; Cheese anyone?? @Mexicue shares their killer recipe with #starrettlehigh.http://t.co/wEs4Rs3wA9	1389642189	422816105481379840	f	mexicue
Give us your old cell phones! #SupportTheTroops #OfficialCellPhonesForSoldiersDropOffSite 50th&amp;6th! #BestPizza #food http://t.co/jDLRybb8qH	1389642118	422815807739924480	f	valduccis
That's all folks! Catch us tomorrow as we make our back to @BrookfieldPLNY for lunch! #WFC	1389641813	422814526883766272	f	bigdsgrub
@nycfoodtruck @laulaurlaurie aah yes, the horseradish will be the zinger, thx!	1389642831	422818795343052800	f	getstuffednow
@pelzerspretzels @nycfoodtruck we always forget how nifty old bay is- thx for the tip!	1389642713	422818300419395584	f	getstuffednow
The subway's a different world in slow motion: http://t.co/hwnMeWriVb	1389645645	422830598563311616	f	neaexpress
How can you study, with an empty tummy?\nWr are at NYU WEST 4th at Green in front of NYU SCHOOL OF BUSINESS!	1389648947	422844447919833088	f	seoulfoodnyc
Astoria ! Dinner ! Tacos ! Tortas ! Flautas ! Guacamole ! 31st &amp; Ditmars !!!!!!!!	1389650006	422848892624183296	f	mexicoblvd
When we think there's enough veggies on a Verde, we slip a few more in to be sure.	1389653712	422864436387663872	f	neaexpress
NOW is the time to book your 2014 parties! Email Debbie@EddiesPizzany.com for more info!\nBirthday, Corporate,... http://t.co/4Dnm1BNgcN	1389654063	422865909070721024	f	eddiespizzany
Schedule for the week:\n\nTues: 48th bet 6 and 7 ave\nWed: soho, varick and charlton corner\nThursday: 47th bet Park... http://t.co/CFwZCKNZhh	1389662412	422900926018367488	f	disosnyc
We want to thank each and every member of the society who has gotten us this far. We are now at 698 followers on... http://t.co/ea4KbfSTnP	1389655850	422873401045172224	f	disosnyc
@TheWaytoHisHear Thank you Meaghan for your awesome review.	1389659968	422890676578025472	f	brooklynpopcorn
RT @TheWaytoHisHear: {new} Brooklyn Popcorn Review &amp; Giveaway! http://t.co/AobGLuh9SO	1389659457	422888531178958848	f	brooklynpopcorn
Wafel trucks on de move!\n\nKastaar is at NYU Stern until 10pm!\nMomma is 14th and 1st until 10pm!\n\nAllez allez!	1389660190	422891606770200578	f	waffletruck
RT @joe14850: @mactruckny love the #buffalochicMAC #NRF14 http://t.co/1gm95XyvKj	1389660390	422892442942443520	f	mactruckny
RT @dudleyjoshua: Im in front of javitz center where @mactruckny is parked with the engine running. Wheres my mac and cheese?	1389660383	422892415469760512	f	mactruckny
I really look forward 4 your unique tweets and samosas	1389658830	422885901572661248	f	mausamnyc
beautiful weather on this dinner night for two	1389658646	422885130105913344	f	mausamnyc
our meals are freshly prepared while U wait or call. The aroma will make yr mouth water	1389658313	422883732962287616	f	mausamnyc
Most Delicious mango lassie I had so far	1389657970	422882295293280256	f	mausamnyc
no waiting on linecall347-206-1539yr order will be ready before U get here	1389657850	422881790592704513	f	mausamnyc
try our chicken Mughlai finger licking deliciousguaranty U'll have it again	1389657690	422881120288395264	f	mausamnyc
dinner@bway &amp; 67strnext to  store. Delicious platters with samosas &amp; parata only $11	1389657076	422878544763437056	f	mausamnyc
RT @fourwheelfoodie: .@veganlunchtruck has a huge following, but have you tried @thegreenradish1? Their Black Bean Burger is #MINDBLOWING	1389699554	423056709003640832	f	thegreenradish1
#veganlunch @thegreenradish1 Today, Tuesday, 51btwnPark/Radison 11to2pm Try the Glazed Tofu Wrap with Cast Iron... http://t.co/yunWqVDjfk	1389700502	423060687745597440	f	thegreenradish1
What's poppin? Getting ready for lunch already! We are on We are on 51st between Park and Madison Avenues- see you later!	1389702172	423067692057493504	f	seoulfoodnyc
Hey @dumbolot we missed you!  It may be raining but we are back today from 11-3 at Jay &amp; Water! Free coffee samples to brighten up this day!	1389702528	423069183861981184	f	sweetchilinyc
Hey 51St..Try #vegan Special Glazed Tofu Wrap,Gluten Free Choc Chunk Cookies @blackrock @nymetro @nytimes @TheEllenShow @rickygervais @peta	1389705250	423080602967875584	f	thegreenradish1
Hey 51St.. Try #vegan Special Glazed Tofu Wrap, GlutenFree Choc Chunk Cookies @blackrock @nypost @nytimes @theellenshow @rickygervais @peta	1389705542	423081825083211777	f	thegreenradish1
@gfreefun @gfbird @chickpeanolive . All we have @ smorgasburg is gluten free, but the organic chipotle chorizo! Come and try it! :)	1389706503	423085857294548992	f	palenquefood
Lefty louie, Joey shakes, or Mickey scars??\n\nCome to 48th bet 6th and 7th ave today. We're having a sit down... http://t.co/TEMBDAmZ6z	1389706461	423085680164470784	f	disosnyc
Morning! NYC @46th st &amp; 5~6 ave until 3pm! Why not start the day with an authentic Asian tapas from Shanghai SOGO&gt;&gt;SOGO FOR IT &lt;&lt;......	1389707027	423088055726374912	f	shanghaisogo
It may be raining but that won't stop us from bringing you the #LebaneseLunch you've been craving! Join us on Jay &amp; Water in #Dumbo today!	1389708441	423093983389032449	f	toumnyc
Guess who's back @BrookfieldPLNY!? Come n' Grub at #WFC today. Vesey St and North End Avenue, 11:15am to 2:30pm. Preorders call 646-543-BIGD	1389709749	423099472877735936	f	bigdsgrub
Crazy for crazy chicken? Come to 47th off Park today! Open from 11-3:00 http://t.co/o4HTvuofSM	1389709287	423097532273922049	f	grillonwheelsny
Cater your SuperBowl Party with #gourmet #popcorn - SAVE 20% on ALL TINS!. Use coupon code: bowl2014 at check	1389709714	423099325602738176	f	brooklynpopcorn
don't let the weatherprevent U from yr favourite meal. Just ask for"Free Soup Samples" to brighten up this day! http://t.co/q0ta8LpGI5	1389709721	423099353679818752	f	shanghaisogo
RAIN OR SHINE! We are here @ 46th st &amp; 5~6 ave until 3pm!FREE SOUP SAMPLE  While u waiting......also, we have coverage for the rain.	1389709032	423096466362859520	f	shanghaisogo
Good morning! Miss the sun?	1389709318	423097662876180480	f	neaexpress
@stevenshawnyc :( have you ever ordered from our sister restaurant @CasaNonnaNY? They're on seamless and in your delivery zone!	1389710384	423102135711309825	f	goburger
The #schnitzcart will make an encore appearance on 55th &amp; broadway today from 11:00-2pm. Hope to see you guys out. @randomfoodtruck	1389710109	423100982172872704	f	schnitznthings
Don't let the rain stop you from getting your schnitz on. The #schnitztruck will be on 52nd b/w 6th &amp; 7th 11:30-2pm. Preorder 347-772-7341	1389709866	423099961304416256	f	schnitznthings
No truck today. We'll be back soon!	1389710082	423100867139497984	f	kimchitruck
Mornin' NYC! No breakfast today but we're rockin' lunch on 41st n 6th from 11-230. See you there!	1389710067	423100807437770752	f	philssteaks
For one free dinges answer this question: a jar of what is sold every 2.5 seconds?	1389710703	423103472041353216	f	waffletruck
Kastaar is at Hanover Square til 4:29p\nKotmadam 23rd and broadway til 7p\nGoesting is at B'way &amp; 66th til 9p \nVedette is at 60th &amp; 5th til 6p	1389710462	423102461658664960	f	waffletruck
Tasty tuesday!  \nDe Wafel Cabana at Herald Sq open til 9pm \nLe Cafe at 15 Ave B open til 11pm  \nMomma at 91st &amp; Columbus til 4:31pm	1389710426	423102312723128321	f	waffletruck
Headed to SoHo's Varick and Vandam!	1389711191	423105521890377728	f	korillabbq
RT @mariamilito: Thank U @milktrucknyc for coming for lunch today @Q1043 @Power1051 @1035KTU @1067Litefm @Z100NewYork !!	1389711316	423106042352791552	f	milktrucknyc
Lunch is served! We are parked on W48st in front of FOX news studios. Don't wait in the rain call ahead your order... http://t.co/oNODoivPJb	1389712163	423109596761563136	f	eddiespizzany
#bigred is prowlin the corner of 50th &amp; 6th. Come and get yo #lobster fix #NYC. We've got it all today #chowder #lobsterMac #lobsterrolls	1389711642	423107409687900160	f	lobstertruckny
Bessie's at Church &amp; Lispenard, call (646) 504-6455 to pre-order or http://t.co/IwkqcCHPzF. Sandwich menu always at @HoustonHall_NY	1389711627	423107348660355072	f	milktrucknyc
Dreary day. Head over to 47th &amp; Park. A whiz wit' will cheer you right up!	1389712271	423110049297616897	f	shortysnyc
Our new years resolution of serving even more amazing wafels is going great! How about yours? http://t.co/eTsRSQm8gu	1389711623	423107333766778880	f	waffletruck
EY highlights 2014's top sustainability issues: http://t.co/X0B5eELNA2	1389712206	423109778374922240	f	neaexpress
We are getting yr lunchready @ bwaybet 55 &amp; 56 Str. All platters comes with parata &amp; samosa for only $11	1389711844	423108260288147456	f	mausamnyc
Seems like Tuesday's are officially rain day @dumbolot late start truck getting fixed water &amp;jayst 12-3 so come by for your fix GOT WHIZ?	1389713395	423114762634149888	f	carlssteaks
Rain? What rain - follow the kielbasa aroma! We are on 52nd b/w 6th and 7th (closer to 6th) - open from 11:15 until 2 today!	1389712761	423112103570833409	f	polishcuisine
Just added Lagunitas Hairy Eyeball on tap. http://t.co/QO3j4eAcrs	1389712849	423112475064549376	f	shortysnyc
Located on 49th between 6th and 7th. Online at http://t.co/6h7IrKccpj	1389713381	423114704345915392	f	thepocketful
the truck and cart are running a little late. Some mechanical problems. We will try to be open by 12:00. If we will open earlier will update	1389712841	423112442160615424	f	schnitznthings
56th &amp; Broadway - Full menu available for takeout! Soups today are Navy Bean &amp; Kale + Spicy Chicken Corn Chowder.	1389712761	423112106502676480	f	thesteelcart
Located on 49th between 6th and 7th. Online at http://t.co/6h7IrKccpj	1389887668	423845718261239808	f	thepocketful
The society is now open. \n\n48th between 6 and 7 ave\n\nCall in preorders for pick up: 917-756-4145	1389712719	423111930161557505	f	disosnyc
A lil Wet Today, I bet a nice Soup will be great for ur tummy, join us @ WALL STREET, between Hanover &amp; Pearl street... AREPAS come join us	1389713769	423116332608290817	f	palenquefood
FIDI peeps, we r off the road 2day:(	1389713996	423117283826085889	f	fritesnmeats
Starret Lehigh...we missed you guys and your rice bowl eating ways...12-230 today!	1389714978	423121404125798400	f	mexicue
RT @dumbolot: Happy Tuesday! @sweetchilinyc @KimchiTruck and @carlssteaks on jay &amp; water! @DUMBOFoodTrucks	1389715144	423122099713363968	f	sweetchilinyc
Lunch time @dumbolot Jay &amp; water till 3! http://t.co/6eJ9EWlrll	1389715077	423121820339142656	f	sweetchilinyc
BACK on 50th &amp; 6th! Miss us? Extra #porkbelly and #pekingduck for y'all!	1389715253	423122558037524480	f	mooshugrill
We're here, Midtown. You better come see us on 46th St btwn 6th&amp;7th Aves... Or else! (Or else you don't get any crispy cheese that's what)	1389715771	423124728812154880	f	mexicoblvd
De Chili Con Corne has made its way back from an extended vacation! Come and get it at our trucks and le cafe! http://t.co/LrKP9y97DW	1389715326	423122863202516992	f	waffletruck
#handheld things we love! http://t.co/bkGOCQgtqS	1389715392	423123139158376448	f	nuchasnyc
G1 soho Hudson &amp; King\nG2 fidi Water &amp; Wall\n#ComeToTheCheeseYo	1389716280	423126866031947776	f	gcnyc1
@bmciaap water &amp; wall today...\n#ComeToTheCheeseYo	1389716233	423126666043731968	f	gcnyc1
lil dreezy can't stop us. come by 53rd and park!	1389716468	423127653080526849	f	biandangnyc
Open at SoHos Varick &amp; Vandam	1389716964	423129734105825280	f	korillabbq
Just added Dogfish Head Olde School Barleywine on tap. http://t.co/jbZl7XYTg7	1389716374	423127258417475584	f	shortysnyc
The only thing better than good food is sharing it. Well, that and winning the lottery.	1389716203	423126543423270912	f	neaexpress
At the Javits today for lunch. 37st and 11th ave.	1389716599	423128200513081344	f	mactruckny
Today Tuesday serving Lunch \non 47th st \nBet Park Av / Lexington Av\nCall in advance for pick-up \n@ 347-70T-Bite	1389716832	423129181913096192	f	tacobite
Serving Lunch today on 47th st\nBet Park Av / Lexington Av Call in advance for pick-up @ 347-70T-Bite	1389716281	423126868276310016	f	tacobite
Are you ready for lunch?? we are! 52nd b/w 6th and 7th - home of the kielbasa and pierogi!!! #pierogitime @midtownlunch @nystfood	1389717091	423130265888620544	f	polishcuisine
Lunchtime Grub is ready @BrookfieldPLNY! Vesey Street and North End Avenue, now till' 2:30pm. Preorders call 646-543-BIGD #WFC	1389717067	423130165657735168	f	bigdsgrub
Lentil soup on the menu today! ;-)-	1389717914	423133717314666496	f	grillonwheelsny
Is on 36th St @ Broadway today!	1389717883	423133588184252416	f	chefsamirtruck
Open at 29th &amp; Park! #lunchtime #cheesetime	1389718447	423135953545605122	f	morristruck
We serving lunch on Park ave btw 33st &amp;32st. Free delivery!Call 3474402467 for free delivery or visit http://t.co/yJtXVzeOH7 to order online	1389718699	423137012032348161	f	freshandhearty
It's lunchtime! We're on 41st btw 6th Ave and Broadway. Only staying til 145 today so hurry up and Get Your Phil!	1389719014	423138333028388865	f	philssteaks
Bobjo express will stay at State st &amp; Whitehall st. Thanks!	1389719030	423138397595922433	f	bobjotruck
Bring us to your party! We love parties! Contact us at events@dedinges.com or fill out an inquiry on our website! http://t.co/02M1FnPl2x	1389718942	423138029977743360	f	waffletruck
A familiar truck's in this article's lead: http://t.co/VfreV89CYk	1389719159	423138941571981312	f	neaexpress
47th st \nPark Av/Lexington Av\nCall in advance for\npick-up\n@ 347-70T-Bite. ...	1389719217	423139184967438336	f	tacobite
On that note, what do you think of using a knife and fork?	1389720657	423145221787246592	f	neaexpress
46th and park tomorrow!	1389722652	423153590229028864	f	nautimobile
"So long as you have food in your mouth, you have solved all questions for the time being."\n Franz Kafka #foodie	1389722783	423154139053703168	f	neaexpress
@DJvinSANITY sorry guys. We will be there on Friday	1389723828	423158521962975232	f	fritesnmeats
#bigred is heading home for the day. check us tomorrow for our whereabouts. still open @Redhooklobster #redhook till 8!	1389724343	423160681853366273	f	lobstertruckny
Our catering schedule is booking up fast for 2014! Email catering@bigdsgrub.com for our catering menu/pricing. Weddings etc..	1389725056	423163673549733889	f	bigdsgrub
We are closed! Thanks for coming - hope you enjoyed your traditional lunch:) We will be near Hudson Square... http://t.co/hwgIlBYK7T	1389725992	423167600411947008	f	polishcuisine
Just added Ommegang Gnomegang on tap. See our full beer menu: http://t.co/qan6zoyf3g @BreweryOmmegang #BeerMenus	1389726545	423169920613236738	f	shortysnyc
Just added Ommegang Gnomegang on tap. http://t.co/MG6f4rtckK	1389726545	423169919207739392	f	shortysnyc
Just added Dogfish Head Piercing Pils on tap. http://t.co/7GYfLc5nSk	1389726306	423168914793984000	f	shortysnyc
Just added Dogfish Head Piercing Pils on tap. See our full beer menu: http://t.co/qan6zoyf3g @dogfishbeer #BeerMenus	1389726305	423168913292410880	f	shortysnyc
RT @Jbliss1: @shanghaisogo You ever come down to FIDI? I would love me some vegan soup in this cold weather! I'll come to you! #Wall&amp;Water ...	1389726188	423168420553953281	f	shanghaisogo
RT @KingsDreamer: @shanghaisogo Yuuuuuuuuum!	1389726162	423168312470958080	f	shanghaisogo
The culinary art of huaiyang cuisine. http://t.co/YxgCpBNOZi	1389726046	423167824694349824	f	shanghaisogo
De Chili con Corne is BACK! A cornbread wafel topped with chili, cheddar, sour cream and cilantro! http://t.co/hhR92pkrhX	1389726101	423168056945569793	f	waffletruck
CNG stations take a step forward in Utah: http://t.co/ThLZujxVf5	1389726615	423170214575218688	f	neaexpress
It's great to be back #WFC! Join us tomorrow for lunch in #MidtownWest	1389727804	423175199195148291	f	bigdsgrub
RT @Boca_Foods: "@NuchasNYC: #handheld things we love! http://t.co/4iP2xKwrUA" We sure do #empanada appreciation!	1389728846	423179570431688704	f	nuchasnyc
RT @axelroote: @GuyGourmet @Mexicue by far.  The Alabama Chicken tacos are amazing. #FoodFight	1389730401	423186094449254400	f	mexicue
@iamevie Great perspective.	1389729739	423183317643833346	f	neaexpress
RT @sim1_castillo: @morristruck Gouda Sandwich + a cup of my homemade chili = perfection on a rainy NYC day	1389730749	423187552401887232	f	morristruck
What's up pholks? Tonight we're at @RoyalPalmsClub for their soft opening. Come grab a cheesesteak &amp; a beer and... http://t.co/mdKITDQ8ea	1389732870	423196448105041920	f	philssteaks
What's up pholks? Tonight we're at @RoyalPalmsClub for their soft opening. Come grab a cheesesteak &amp; a beer and get your shuffle on!	1389732806	423196180168708096	f	philssteaks
RT @RoyalPalmsClub: Might wanna come hungry to our soft opening event tonight...we'll be hosting Phil's Cheesesteaks in our Food Truck bay!	1389732657	423195553896607745	f	philssteaks
We are getting dinnerready@ Bway &amp; 67 Strtry our vindaloo flavor for this weather	1389732919	423196652891947008	f	mausamnyc
Ever wondered what happens at a wafel factory? Click here to find out: http://t.co/vicKbZ0NS7 http://t.co/TJLDdc4nJ9	1389733314	423198311173341184	f	waffletruck
The Guardian doesn't pull punches: "Sustainability must join health and safety as a core business value" Sus http://t.co/CGfdxIPafJ	1389733533	423199227251273728	f	neaexpress
RT @davidbivins: @mikenwillies are the spot for lunch at #NRF14 ! Check them out in the truck outside Javits 4 sliders and tacos!	1389734494	423203258262650880	f	mikenwillies
@davidbivins glad you enjoyed!!	1389734492	423203249353949184	f	mikenwillies
@arthuresque we are on winter break for a few more weeks	1389734901	423204967307296768	f	veganlunchtruck
@UncleDoctorDuck email us details at info@shortysnyc. how many people, which day, etc?  if we can we will:)	1389735178	423206127086862337	f	shortysnyc
@josh2262 @dumbolot @Datalot sorry mechanical issues last minute we will be back next week	1389736643	423212274539839488	f	carlssteaks
Hey folks lets not have rain stop you UWS dinner Broadway and 61st till 9 cheesesteaks for all!! GOT WHIZ?	1389737371	423215326797783040	f	carlssteaks
90% less emissions with 100% of the flavor? Not a bad deal.	1389736905	423213372214345728	f	neaexpress
http://t.co/r4X5X6TB	1359646681	297005824084176896	f	thecrepestruck
Check us out in store all week.  634 Mclean Ave, Yonkers NY\nWith your Favorite Sliders, Wings, and Fries.  \nGet... http://t.co/eSVC8wE0tn	1389739197	423222983881424897	f	mrniceguytruck
@rawrmelii if you nuke the jar it drizzles #spekuloosprotip	1389765722	423334239921111040	f	waffletruck
RT @rawrmelii: Perfect snack :] @waffletruck http://t.co/EqdfkXKWOc	1389765682	423334072665276416	f	waffletruck
@al_gretina closest one would be the cabana at 35th.	1389765667	423334009494437888	f	waffletruck
@50Wrds4Laughter @shwebbey @alherzog44 yuuuuuup!	1389765636	423333880607670272	f	waffletruck
@melman101 don't knock it til you try it.	1389765624	423333827205791744	f	waffletruck
@Punx5570 we feel about the same.	1389765598	423333720196542464	f	waffletruck
@iamclue we dream of one day being united.	1389765573	423333614135177216	f	waffletruck
@sugoodsweets and what a good decision all those people make.	1389765513	423333361579343872	f	waffletruck
@SuburbanSnob who's mother? Our mother? We don't know how to feel about this.	1389765490	423333266939072512	f	waffletruck
RT @UrbanAdventures: .@BB_1088 Lots of food spots on our #NYC app: http://t.co/GMJF0ikuZT For cheap eats, check out the food trucks such as...	1389765458	423333133799673856	f	waffletruck
@ShanePatton88 safe flight!	1389765361	423332725064359936	f	waffletruck
@MegBerryQ @peter_joseph_ we got that to give.	1389765343	423332647775920128	f	waffletruck
@carolinaisabel not yet, but we're hoping.	1389765328	423332585486290944	f	waffletruck
@AndreaHoheb a fine guess, we feel.	1389765296	423332452661092353	f	waffletruck
@gcheitman @courtneymarmon something like that.	1389765286	423332410164383744	f	waffletruck
@OTR_elementary @CEchipare your guess is pretty good.	1389765275	423332362571612161	f	waffletruck
@starpadilla a fine answer if we've ever heard one.	1389765260	423332300378484736	f	waffletruck
@vitalydotn not the answer we were searching for, but wouldn't surprise us.	1389765235	423332195680264193	f	waffletruck
@Parisi2274 could also be accurate, but we'd have to check the facts on that.	1389765212	423332098280140800	f	waffletruck
@CEchipare a cousin to such.	1389765184	423331981170970624	f	waffletruck
Grab #MuchasNuchas before watching Water Panics in the Sea, film by Laleh Khorramian 11:57pm-12am all month long in @timessquarenyc!	1389751526	423274697560969216	f	nuchasnyc
Had to have my samosas n paneer Kati roll for dinner forgot to get a mango lassie	1389749008	423264137754320896	f	mausamnyc
#VeganLunch is on 38&amp;BWAY Today, Wed, 11to2pm Glazed Tofu Wrap Creamy Sesame Dressing..Carrot Cake! @nypost @nytimes @rickygervais @peta	1389788844	423431220320407552	f	thegreenradish1
Today, WEDnesday, 38&amp;BWAY, 11to2pm, Glazed Tofu Wrap Stir Fried Cabbage, Bok Choy, Scallions, Creamy Sesame... http://t.co/Pbj6LsEBQc	1389788323	423429035218051072	f	thegreenradish1
Hudson/King St. apologies that we won't be on location until later, we r making an appearance on Good Morning America http://t.co/4APrTSjhD9	1389790678	423438911214321664	f	sweeterynyc
Good morning NYC! Breakfast is served on 41st btw 6th n BWay - start your day the Phil's way!	1389789953	423435871459631104	f	philssteaks
Sweetery is serving our amazing hot chocolate on Good Morning America this AM #HotChocolateForAll http://t.co/nrDhkvBVz6	1389791367	423441802482302976	f	sweeterynyc
Sweetery is making a special appearance on Good Morning America this AM, our incredible hot chocolate for all!	1389791028	423440381380808704	f	sweeterynyc
I posted a new photo to Facebook http://t.co/Rg2aL5KmOt	1389791028	423440378411630592	f	sweeterynyc
I posted a new photo to Facebook http://t.co/j4GbSuAPIK	1389791027	423440377387810816	f	sweeterynyc
23rd and Park today. Come and get em!	1389790932	423439975984926720	f	carpedonutnyc
55th off Broadway today! Open for lunch at 11-3:00!	1389792373	423446023617662976	f	grillonwheelsny
Thank you @GMA, love being todays special guest!	1389793294	423449883408748544	f	sweeterynyc
RT @TheBeils: I see you on @GMA @SweeteryNYC ... I forgive you for not being at Hudson/King today!	1389793215	423449555271577600	f	sweeterynyc
So nice to see Sweetery on Good Morning America, making many happy with or beyond special hot chocolate.	1389792986	423448591055585280	f	sweeterynyc
Come n' Grub at Broadway and 56th Street. 11am to 2:31pm. Preorders call 646-543-BIGD #MidtownWest #tacos #dumplings #spicychicken	1389794277	423454006800048128	f	bigdsgrub
RT @YouGotSmoked: Check us out today @dumbolot @DUMBOFoodTrucks from 11:00 to 3:00! #slowsmokedpork #applewoodsmokedchicken	1389793800	423452005034901504	f	miamimachinenyc
Sorry #NYC Working a private birthday party on Candlewood Lake! See you tomorrow for some pizza delicioso!	1389794412	423454572154073088	f	valduccis
Firing up the grill on 55th &amp; Broadway! @randomfoodtruck @midtownlunch	1389794475	423454837192527872	f	mooshugrill
For one FREE dinges: tell us what day is the most common for people to give up their new years resolutions.	1389795030	423457165681377280	f	waffletruck
Momma at 47th &amp; Vanderbilt til 4:31pm\nKastaar is at 60 Wall St til 4:29pm	1389794513	423454999243669505	f	waffletruck
Kotmadam is at 23rd and broadway til 7pm\nGoesting is at Broadway &amp; 66th till 9pm\nVedette is at 60th &amp; 5th till 6pm	1389794493	423454912924893185	f	waffletruck
It's Wafel Wednesday!\n\nDe Wafel Cabana at Herald Sq open til 9pm\nLe Cafe at 15 Ave B open til 11pm	1389794458	423454767793598464	f	waffletruck
Wednesday's in #MidtownEast are back in full effect! Join us for a grilled kafta sandwich on 47th btwn Park &amp; Lex! http://t.co/WrONUB0KMR	1389795580	423459474146619392	f	toumnyc
@bxlea today we are on 46 st between 5 and 6 ave	1389795912	423460864881352704	f	freshandhearty
Whoa, fog city. Headed to 55th St. bet. 6th &amp; 7th Ave. 11:30am - 2:30pm	1389796101	423461660037107712	f	kimchitruck
MIDTOWN WEST! Shanghai Sogo are here to serve our mouthwatering ASIAN TAPAS @55th st &amp; broadway until 3:30pm&gt;&gt;SOGO FOR IT &lt;&lt;......	1389795840	423460562572296192	f	shanghaisogo
Good morning on this sunny day. Our Curry N Bites @ 52nd bet 6 &amp; 7Ave. Create any combo also it comes with parata &amp; samosa	1389795435	423458864105660417	f	mausamnyc
FiDi/WFC North End&amp;Vesey! Thru the fog you'll find sunshine. Also,there are noodles! Join us for lunch! 11-3 @BrookfieldPLNY @downtownlunch	1389796683	423464098928803841	f	mamuthainoodle
We are back on 47th &amp; Park through lunch.	1389797083	423465775601426432	f	thesteelcart
Today we are on Varick street and Charlton street with your favorite AREPAS!!! Come enjoy our lovely soups too... Good Beautiful Day Folks	1389797776	423468683034652672	f	palenquefood
#bigred is sitting pretty 50th &amp; 6th, beautiful day today - come on out and treat yourself. Now accepting credit cards. #lobstaforlunch	1389797743	423468546002530305	f	lobstertruckny
!!! Wed,Jan 15th 11:30-3:30 45th &amp; 6th Ave, then 4:30-7pm 18th st &amp; 7th ave!!!	1389797670	423468238790725632	f	thetreatstruck
Headed to FiDi's Front St &amp; Gouveneur Ln!	1389798413	423471357280538624	f	korillabbq
Bessie's at 58th &amp; Mad, call (646) 504-6455 to pre-order or http://t.co/IwkqcCHPzF. Sandwich menu always at @HoustonHall_NY	1389798029	423469743073271808	f	milktrucknyc
RT @fourwheelfoodie: Mexican and Asian influences combine to make @bigdsgrub an easy favorite for anyone with an adventurous palate. #stree...	1389798566	423471995742085120	f	bigdsgrub
Wafeloons! Wafelonnes! We have heard de cries of de people. One of your favorite wafels IS BACK! De Chili Con Corne! http://t.co/q3oJYGcE0F	1389798120	423470126168821760	f	waffletruck
@HdsnSqFoodTruck we can't make it today the truck broke down last night:(	1389798508	423471754779299840	f	sweetchilinyc
@SaveNYCFoodTrux @BrookfieldPLNY @ESTacoTruck we aren't coming today the truck is down:(	1389798468	423471584788365313	f	sweetchilinyc
Won't be headed out today, the truck is down for the count. Sorry!! :(	1389798269	423470749731790848	f	sweetchilinyc
Cheesesteak hump day baby!!! 49th st 6/7th ave 11-3 @SiriusXMNFL @SIRIUSXM @Barclays @FoxNews BEER BATTERED ONION RINGS GOT WHIZ?	1389799033	423473954486251521	f	carlssteaks
@Clorox Think about how much fun it would be to do a Clorox experiential marketing event on our interactive mobile glass truck, interested?	1389799543	423476095862587393	f	sweeterynyc
@GMA, now that we shared some chocolate love this AM, how about being our new best friend on Twitter with a follow. #WeLoveGMA	1389799350	423475283736264704	f	sweeterynyc
Lunch is being served on W46st. &amp; 6th Ave. Call ahead your order 917-439-7522. Looking forward to serving you.	1389799770	423477048544624640	f	eddiespizzany
We are on the corner of Varick and Vandam today - fully ready at 12:00 #pierogitime @downtownlunch	1389799266	423474932849205248	f	polishcuisine
The #schnitztruck will be on 47th &amp; lex from 11:30-2pm. Come get some! If you'd like to preorder just call 347-772-7341. Hope to see u:)	1389799517	423475984700940289	f	schnitznthings
Morning guys. The #schnitzcart is on 27th &amp; Park from 11:00-2pm. Looks like the sun is coming out:) perfect weather for Schnitzification!	1389799388	423475445070168065	f	schnitznthings
Hello soho. Lunch 2day @ Hudson &amp; king. Burger of the week THE SMITHLAND preorder 9172929226	1389799101	423474240328048640	f	fritesnmeats
Dear @DumboNYC, \nYou know those days when you just can't catch a break? That's today for us. We're closed for lunch, and so sorry about it!	1389799485	423475853079502848	f	morristruck
Having breakfast at the bar this morning. Yes, we have a bar .. Don't ask :) http://t.co/QJCjZWN0lj	1389799041	423473988070019072	f	nuchasnyc
53rd and park! #humpday	1389799939	423477755859070977	f	biandangnyc
Good Morning nYc! We are serving lunch on 46st btw 5th ave &amp; 6th ave.Free Delivery 4 everyone!Order now 3474402467 or http://t.co/yJtXVzeOH7	1389800694	423480921153486848	f	freshandhearty
what's the secret to a good healthy lunch? meet me at 56th &amp; 6th, and i'll tell you!  #empanadas #handheldfoods #foodtruck	1389799871	423477469539102722	f	nuchasnyc
We just arrived on 51st street between Park and Madison!\nCome an get it!!	1389800950	423481994350444544	f	seoulfoodnyc
Dumbo.  Jay &amp; Water.	1389801579	423484635285581824	f	shortysnyc
Located on 53rd between Park and Madison. Online at http://t.co/6h7IrKccpj	1389801343	423483645039751168	f	thepocketful
RT @ExposureNJ: @ExposureNJ #winterblast! @Aroy_D @EmpanadaGuy1 @TFQfoodtruck @oinkandmoobbq @LukesLobsterNY @hungerconstruct @thegreenradi...	1389801430	423484008958541824	f	thegreenradish1
18th and 5th...a nice day to break your New Years resolution with our burnt end chili burrito.	1389801979	423486313401442304	f	mexicue
G2 #starrettlehigh 26th 11/2\nG1 36th 6/Broadway\n# starrett601\n#ComeToTheCheeseYo	1389802112	423486869478072320	f	gcnyc1
Open at fidi front and gouverneur by 1130!!	1389801801	423485565372080128	f	korillabbq
The fog this morning was like driving through a dirty marshmallow. 46th and park	1389801916	423486049760063489	f	nautimobile
@ChoiceFashionNY you have noo idea. We have dreams about it	1389801762	423485403224866816	f	nautimobile
Soho varick and charlton for lunch.\n\nCall in your order: 917-756-4145	1389802235	423487386887012352	f	disosnyc
It's almost lunchtime!!!! Come get your Phil at 41st btw 6th n BWay - rocking until 3 today so you have no excuse not to!	1389801689	423485097560375296	f	philssteaks
Open for business at 49th and 6th!	1389801985	423486338718240768	f	neaexpress
Is on 52nd St @ Park Ave today!	1389801960	423486231209463808	f	chefsamirtruck
Today Serving Lunch on\n47th st\nBet Park/Lexington Av. \nCall in advance for\npick-up\n@ 347-70T-Bite	1389801699	423485136572022785	f	tacobite
We drove in this fog 2 our corporate gig 2day!  #customerservice http://t.co/Stdsb0fgDv	1389802718	423489410424766465	f	getstuffednow
Get your tacos, grinders or dumplings at Broadway and 56th street, now till' 2:30pm. preorders call 646-543-BIGD @randomfoodtruck	1389803035	423490740791291904	f	bigdsgrub
@superhuman_ryan we cannot wait for same.	1389802752	423489553815445504	f	waffletruck
@JetMosley something like that.	1389802725	423489440787349504	f	waffletruck
@SoggySquash1 ye of little faith.	1389802667	423489198922805248	f	waffletruck
@jfbydesign glad we could inspire you.	1389802631	423489045050576896	f	waffletruck
RT @randomfoodtruck: I spy through the fog some delicious options for lunch: @shanghaisogo @mooshugrill @GrillOnWheelsNY @bigdsgrub Katz &amp; ...	1389804167	423495489993334784	f	shanghaisogo
ASIAN TAPAS #4 "CHIVE PORK DUMPLING"  Does it make you mouthwatering?&gt;&gt;SOGO FOR IT &lt;&lt;...... http://t.co/iDvhKKbA2s	1389804155	423495438436532226	f	shanghaisogo
Bobjo express stay at 47 st and park.\nTry our platter and ramen!\nThanks!	1389804678	423497631235858433	f	bobjotruck
Beautiful sunny day!\nBobjo truck open at vrick st &amp; king st today!\nTry our rice platter and ramen noodle soup.\nThanks ny!	1389804607	423497335189295104	f	bobjotruck
Chili con Corne lovers - REJOICE! De Chili con Corne is BACK! A cornbread wafel topped with chili, cheddar, sour cre... http://t.co/rIsTlsGHDL	1389805341	423500414701830144	f	waffletruck
On Varick &amp; Vandam - we are fully open with smokin' grilled kielbasa and our delicious pierogi! @downtownlunch	1389806693	423506086298017792	f	polishcuisine
Bobjo truck at Varick and king st today!	1389806254	423504243182804993	f	bobjotruck
RT @KingsDreamer: @shanghaisogo All of your food pivs look good!	1389807632	423510024120713216	f	shanghaisogo
RT @ShanghaiMKS: Tacos, grinders and dumplings... oh my! @bigdsgrub has it all! Find them today on Broadway and 56th St in #NYC!	1389809211	423516646230474752	f	bigdsgrub
Planning a Superbowl party? Need food? Enter our #NuchasSuperFan contest and win a catered Superbowl party on us! http://t.co/HbdbesqzB4	1389808938	423515499306438656	f	nuchasnyc
Our friend Ayinde is trying to start a vegan food truck on the west coast.  We can attest to the yumminess of his... http://t.co/UnVckD6eP8	1389810171	423520670417702912	f	veganlunchtruck
The perfect lunch/brunch combination. A 2nd Street Salmon Special and a Baconana. Available only at Le Cafe. 15 Ave ... http://t.co/vQlppke3Ah	1389812524	423530541745332224	f	waffletruck
#bigred is heading home for the day. $20 #lobsterdinner tonight till 8pm #redhook @Redhooklobster see you there #crustaceanelation	1389814098	423537144234143744	f	lobstertruckny
RT @laurakeefe: Thank you @thegreenradish1! Amazing vegan carrot cake w/ my hot chocolate. #midtown #veganlunch	1389814178	423537480558592000	f	thegreenradish1
RT @WinstonWanders: A Real Cheesesteak without the Drive to Philly at @PhilsSteaks in NYC http://t.co/x7IDEBA2iw http://t.co/RrZ8KfibAQ	1389814014	423536790939521024	f	philssteaks
delicious mango lassie	1389813798	423535883606691841	f	mausamnyc
we are closed! great to see you and thanks for coming!:)	1389814224	423537669486825472	f	polishcuisine
We specialize in the best pizza held back by traffic jams.	1389815711	423543906467184640	f	neaexpress
Top of the list of disgusting co. is @StateFarm ripping off an 80 yr old of over $2000 a yr charging $3000 4 insurance when Geico is @ $1000	1389819365	423559236346322945	f	sweeterynyc
Some people say Twitter's bad for your attention span, but there's something shiny beside you.	1389819048	423557905007534080	f	neaexpress
Planning a Superbowl party? Need food? Enter our #NuchasSuperFan contest and win a catered Superbowl party on us!... http://t.co/t7ziPeRbCx	1389818886	423557226955931648	f	nuchasnyc
You know what W&amp;D must really stand for? Wafels &amp; Dogs. We can't get enough of these wafel lust pictures! http://t.co/Qq7HTRPOUV	1389819714	423560696295858176	f	waffletruck
We dont serve apples, but we do serve great food!\nWe are at 67th and broadway right outside Apple Store	1389820882	423565596434120704	f	seoulfoodnyc
http://t.co/s4siW6Mdos	1389822953	423574284770889728	f	polishcuisine
I posted a new photo to Facebook http://t.co/8SHyWNpEPR	1389822734	423573364037652480	f	polishcuisine
Traditional Smokin' grilled kielbasa by Chef Greg for today's lunch catering!! http://t.co/deGbIpaSZ7	1389822641	423572976353947648	f	polishcuisine
Special dill pickle salad by chef Mek create for today's lunch catering.. http://t.co/vIng2Cy93f	1389822374	423571854499278848	f	polishcuisine
Life's easier on a full stomach.	1389822927	423574176021356544	f	neaexpress
Hey UWS back for cheesesteak nite broadway and 61ST ST Till 9 your creation awaits GOT WHIZ?	1389823296	423575721907605504	f	carlssteaks
Dinner time@ Bway &amp; 67str next to store	1389824263	423579778025664512	f	mausamnyc
Alex of @BlondieBrownie spotted in French supermarket end cap.  I knew you were living a double life!  http://t.co/yo8Dd5Wc3D	1389825890	423586601902829569	f	veganlunchtruck
RT @HoneyChrome: @PhilsSteaks om nom nommmm, come sell at @BKBazaar !!!	1389826790	423590377795620864	f	philssteaks
RT @DoodlebugDoo: That looks so delicious @WinstonWanders!! I wish it was here in #Toronto ;) @nycfoodtruck @PhilsSteaks #PhillySteakSun	1389826780	423590337140236288	f	philssteaks
Good evening! WILLIAMSBURG! we missed you!  we are back today from 5~8pm at Metropolitan &amp; Bedford ! Free soup samples to warm up ur night!	1389827490	423593314550808576	f	shanghaisogo
Want to see mouthwatering pictures all day long? Follow us on Instagram @wafelsanddinges and be sure to tag us in yo... http://t.co/uyXjTT6vdi	1389826900	423590840037302272	f	waffletruck
You can add "terrifying animatronic babies" to your list of things to look out for in NYC: http://t.co/GANrziLnDu	1389827122	423591769935458304	f	neaexpress
Learn to love your email again http://t.co/2exEMoD71i	1389838354	423638880743862272	f	milktrucknyc
Thinkin' bout you Hoboken... Those romantic summer sunsets on the Hudson....	1389836704	423631960679137280	f	nautimobile
RT @ClassyChicShel: I seriously need to plan another trip up to #NYC and visit @BrooklynPopcorn OMG...this popcorn ROCKS MY WORLD http://t....	1389844102	423662988822732801	f	brooklynpopcorn
RT @TheImpeckables: Thanks @BrooklynPopcorn for the great #popcorn tonight. Tried the #cajun and it was delicious!	1389844094	423662957147340800	f	brooklynpopcorn
@lovemykids009 Thank you Irina for your review!	1389844077	423662882757152768	f	brooklynpopcorn
RT @lovemykids009: @BrooklynPopcorn review #popcorn #newyork mix YUM http://t.co/h8KHqoGhtt	1389844004	423662579399917568	f	brooklynpopcorn
Don't forget that today is the first day to enter our #NuchasSuperFan contest! http://t.co/HbdbesqzB4 #SuperBowl	1389834338	423622034305085441	f	nuchasnyc
Best dinner palak saag for my vegetarian fiance and delicious mango lassie. She loved it and cost me a fraction of a fancy restaurant	1389832516	423614393868222464	f	mausamnyc
Betty is still sick:( we won't be back until a week from today. Sorry!! #keepontruckin	1389834841	423624144883036160	f	sweetchilinyc
@JayminTae sometime mid February.  Have you checked out @TerriRestaurant yet?  We miss our FiDi peeps and can't wait to be back!	1389872182	423780765017841664	f	veganlunchtruck
#veganlunch Today, Thursday, 52&amp;6thAve, 11to2pm, Glazed Tofu Wrap w/Stir Fry Veg, Roasted Tomato and Quinoa Soup... http://t.co/LgBOHsA2oT	1389872826	423783464131776512	f	thegreenradish1
Find us this morning on 52nd n 6th for a proper American breakfast - steak n eggs baby! OG Jawn has got it going on	1389877092	423801360199712768	f	philssteaks
Buckwheat Noodles with Sichuan pickle, Oshinko &amp; carrot relish, seaweed &amp; spicy sour cucumber. with Sesame sauce. http://t.co/0CFrNxW00o	1389877052	423801191089602560	f	shanghaisogo
Vermicelli Noodles with Korean Kimchi, Sichuan pickle, Sichuan radish &amp; carrot relish. Come with spicy noodles sauce http://t.co/3jzzW00IMw	1389876653	423799517688135680	f	shanghaisogo
Hello downtownlunch @ Hanover bet Pearl &amp; Water Str. Our delicious Curry N Bites to satisfy yr taste buds any style	1389877071	423801270827098112	f	mausamnyc
Get Some Radish Today! 52&amp;6, #tasty #vegan #organic @ubs @CreditAgricole @RollingStone @AtlanticRecords @cbs @nypost @nytimes @Johnny_Marr	1389877374	423802543794188288	f	thegreenradish1
@mactruckny I'm thinking about making the worlds first Mac-and-cheese donut sandwich later... #FoodTruckLove	1389878096	423805571104784384	f	carpedonutnyc
Now open at 55th and Broadway!	1389877941	423804921394511872	f	carpedonutnyc
@CarpeDonutNYC  tasty donuts from these guys http://t.co/BjUatXkUk3	1389877679	423803822793031680	f	mactruckny
Happy #Thursday #NYC 50th &amp; 6th today! Delicious #Lunch awaits you! Retweet this and receive 6 #Free Zepolle! #Midtown #BestPizza	1389878258	423806250820718594	f	valduccis
Is it lunch time yet??\nWe are already on 46th between 5th and 6th!!! See ya real soon!	1389878641	423807857713487872	f	seoulfoodnyc
@elizwgreen Monday &amp; Friday are Dumbo days.	1389879690	423812256204611584	f	thesteelcart
@elizwgreen Hi Elizabeth! We are on 56th &amp; Broadway today. We will be back in Dumbo on Front &amp; Jay St tomorrow.	1389879585	423811814074634240	f	thesteelcart
Headed to the UWS this afternoon! First Columbus &amp; 91st around 2:30-3:30, then Bway (86 &amp; 87th) 4-7pm!!!	1389880709	423816530816950272	f	thetreatstruck
Come meet us on 47th bet Park and Lexington ave for lunch.\n\nCall in your order at: 917-756-4145	1389880164	423814243436085248	f	disosnyc
Good morning broadway!! Between 55/56 for lunch today!	1389880199	423814389880586240	f	mactruckny
@CarpeDonutNYC donut mac... Interesting concept.. Let me know how that works out. 	1389880112	423814026926493696	f	mactruckny
We love #Dumbo Thursday's on Jay &amp; Water St! Stop by and try our endless #vegan options. Mmm #Falafel #platter http://t.co/zPNvSxbVOP	1389881483	423819776151261184	f	toumnyc
It's THAT time of the week #MidtownWest! Come n' Grub at 50th Street btwn 6th and 7th Avenue, 11am to 2:30pm. Preorders call 646-543-BIGD	1389881658	423820511374999552	f	bigdsgrub
50th&amp;6th today! We are making fresh chicken parm rolls right now! #lunch Retweet this and get 6 zepolle #free! #Midtown #BestPizza #Foodies	1389882004	423821959403552768	f	valduccis
@TheRealTaz thanks for the love! Next week same day!!	1389882029	423822064689352704	f	grillonwheelsny
Grill on Wheels at 36 st off Broadway! Join us for some mouth-watering kosher grill!!! Open from 11:00-3:00	1389881947	423821723478532096	f	grillonwheelsny
Headed to @DUMBOFoodTrucks Jay &amp; Water St and Midtown's 47th &amp; Park!	1389882900	423825718506962944	f	korillabbq
56th &amp; Broadway work for you? New soup is Sweet Potato Sage. It's quite tasty.	1389882988	423826089597612032	f	thesteelcart
We'll take fog over rain any day. Varick St. corner of Charlton st. 11:30am - 2:30pm	1389883399	423827810537324544	f	kimchitruck
#bigred is rockin out on the corner of 55th &amp; Bway. #lobstahforlunch #uknowuwantit We now accept CC's!	1389884136	423830904956784641	f	lobstertruckny
Happy Thursday! we are on 55th and Broadway with special PACZKI today @midtownlunch @nystfood @randomfoodtruck	1389884018	423830407637774337	f	polishcuisine
Alt fuel takes a bite out of air emissions: http://t.co/WXFaVKwnAD	1389884029	423830455193194496	f	neaexpress
Our favorite spot &amp; customers 56th Street &amp; Broadway #comegetsome #tacos #sliders #burittos @randomfoodtruck	1389884602	423832859418574848	f	mikenwillies
RT @DispatchNY: . @BrookfieldPLNY NORTH Lot | Thursday, 1/16, 11a-3pm | North End Ave. &amp; Vesey St. | @FritesnMeats @PalenqueFood @MilkTruck...	1389885159	423835194639269888	f	milktrucknyc
Bessie's at North End Ave &amp; Vesey, call (646) 504-6455 to pre-order or http://t.co/IwkqcCHPzF. Sandwich menu always at @HoustonHall_NY	1389884430	423832136714444802	f	milktrucknyc
Good morning Greenwich st &amp; Park place. The #schnitzcart is coming your way:) 11:00-2pm you can get your schnitz on. Hope to see you!	1389884745	423833456544849920	f	schnitznthings
@radi0head We're missing your cute face and love of gluten big time	1389885169	423835238218096640	f	morristruck
45th &amp; 5th ave for lunch today!	1389886108	423839173439913985	f	mooshugrill
The #schnitztruck will be on 51st street b/w park and madison from 11:30-2pm. Perfect schnitz weather. Preorder 347-772-7341. See ya:)	1389885980	423838639479881728	f	schnitznthings
Hello wfc peeps. Lunch 2day @ wfc food truck lot on north end &amp; vesey st. Burger of the week THE SMITHLAND preorder 9172929226	1389885930	423838429294895104	f	fritesnmeats
RT @DispatchBP: . @BrookfieldPLNY NORTH Lot | Thursday, 1/16, 11a-3pm | North End Ave. &amp; Vesey St. | @FritesnMeats @PalenqueFood @MilkTruck...	1389885829	423838006337085440	f	fritesnmeats
@abmansfield @morristruck: @abmansfield Ugh, sorry Abigail! Next week, we'll shower you with cheese. #makeitrain	1389885828	423838002469928960	f	morristruck
@mollylafferty Count on it!	1389885435	423836350060969984	f	morristruck
Is it lunch time yet?? We are already on 47th between park &amp; Lexington ave!!! See ya real soon!	1389886146	423839335415578625	f	shanghaisogo
Kasar truck is at 46th street between 5th and 6th avenues until 6pm.\nAll night at 7th and Christopher.\nHappy Thursday!!!	1389885465	423836478951522304	f	chipsykingny
Back in FiDi 7 Hanover Square&amp; water st 11-3 come by create your perfect cheesesteak and dont forget our BEER BATTERED ONION RINGS GOT WHIZ?	1389887088	423843284877058050	f	carlssteaks
Lunch is served! We are parked on the corner of Water St., right next to 10 Hanover. Don't feel like waiting,... http://t.co/NUJOb4a18k	1389887061	423843173627342848	f	eddiespizzany
RT @dumbolot: and please welcome back Lebanese fav: @ToumNYC #applause	1389887029	423843036934975489	f	toumnyc
RT @johnleesandiego: @RyanNewYork Hoboken and Montclair have hopping food truck scenes including @hungerconstruct  and @thegreenradish1	1389887016	423842984036413440	f	thegreenradish1
We're off the streets for a private event today &amp; tomorrow, sorry for the inconvenience, folks!	1389886983	423842843958853632	f	morristruck
Here we are WFC, with soup, rice &amp; beans and Arepas! North end &amp; Vesey st! Come Join Us, For A Delightful Lunch Paisa...	1389887323	423844270366552064	f	palenquefood
RT @randomfoodtruck: Food truck party! @lobstertruckny @CarpeDonutNYC @mactruckny @PolishCuisine @mikenwillies @TheSteelCart	1389887445	423844781970948096	f	mikenwillies
RT @randomfoodtruck: Food truck party! @lobstertruckny @CarpeDonutNYC @mactruckny @PolishCuisine @mikenwillies @TheSteelCart	1389887482	423844935839019008	f	polishcuisine
@dumbolot Aww gee thanks! We're blushing 	1389887284	423844106084032513	f	toumnyc
We are grateful that Creed are no longer a band/thing that exists. Join us in thanks at 23rd and park.	1389887814	423846331854372864	f	nautimobile
RT @CityStitchette: @TheSteelCart The oatmeal (w/fruit &amp; nuts) hit the spot this morning, as usual.	1389887590	423845390891642880	f	thesteelcart
Throwback Thursday in full effect! Rockin' classic hip hop and serving mouthwatering steaks! 52nd n 6th til 3	1389887366	423844450456985600	f	philssteaks
#Lunch is upon us! #Delicious Chicken Parm Rolls today, besides the #BestPizza! Retweet for 6 #Free zepolle! 50th&amp;6th!	1389888344	423848551609692160	f	valduccis
I posted a new photo to Facebook http://t.co/UsSGh9qewP	1389888729	423850167658643456	f	polishcuisine
ready to serve an awesome lunch on 55th and broadway! Smokin' grilled kielbasa, potato &amp; cheese, meat, kraut &amp;... http://t.co/zfmFR2g02g	1389888591	423849588295204864	f	polishcuisine
Vegy Clean Radish! http://t.co/uQHOVdcipU	1389888284	423848302741061632	f	thegreenradish1
#DUMBO love today with @ToumNYC back in the lot with us! Come fill your belly, Brooklyn. #xxxspicy #fresh #goooood	1389888407	423848817193406464	f	mexicoblvd
For one free dinges tell us how many ways there are to make change for one U.S. dollar!	1389888275	423848264668966912	f	waffletruck
Goesting is at Broadway &amp; 66th till 9pm Vedette is at 60th &amp; 5th till 6pm	1389888232	423848082795544576	f	waffletruck
Momma at 46th &amp; 6th Ave til 4:31pm Kastaar is at Sterrit Lehigh at 26th and 11th Ave til 4:29pm \nKotmadam is at 23rd and broadway til 7pm	1389888223	423848047764713472	f	waffletruck
Thirsty (for hot cocoa) Thursday!  \nDe Wafel Cabana at Herald Sq open til 9pm Le Cafe at 15 Ave B open til 11pm	1389888200	423847950268116992	f	waffletruck
52nd and Park: guess who's back?	1389888319	423848447998164992	f	neaexpress
Drop off your old cell phones Support the Troops! OfficialCellPhoneForSoldiersDropOffSite 50th&amp;6th Retweet for 6#Free Zepolle!	1389889116	423851792351260672	f	valduccis
Open at 47th &amp; Park!	1389889503	423853412720316416	f	korillabbq
DUMBO LOT! Water st &amp; Jay st ready by 11:30!	1389888964	423851155349708800	f	korillabbq
Serving Smiles! http://t.co/QouIHd7Fh6	1389889637	423853975180685312	f	thegreenradish1
Lunch is ready! 50th Street 6th and 7th Avenue, now till' 2:30pm. Get those preorders in by calling 646-543-BIGD	1389889098	423851715788808192	f	bigdsgrub
@arcade127 although we disagree with your opinion, we will defend to the death your right to have it	1389889193	423852116365824000	f	nautimobile
@grardb we will be back soon enough!	1389889012	423851356915773440	f	domotaco
Water and broad!	1389890670	423858307749920768	f	mexicue
53rf and PArk!	1389889951	423855295547183104	f	biandangnyc
Thinking about #Lunch? Fresh Sausage&amp;Pepper and ChickenParm Rolls today! 50th&amp;6th! Retweet for 6 #Free Zepolle! http://t.co/vGeGJAeDuJ	1389890567	423857875585208320	f	valduccis
#delicious ChickenParmRolls today plus the usual #BestPizza 50th &amp; 6th! Retweet for 6 #Free Zepolle!	1389889823	423854757451550720	f	valduccis
don't let the cloudy day stop U. Our meals is just what U needtasty and delicious	1389890316	423856823263690752	f	mausamnyc
Is on 47th St btwn Park Ave &amp; Lex today!	1389890111	423855964110852096	f	chefsamirtruck
@AlmostMedia Yes! Water &amp; Broad!!	1389890716	423858502080421888	f	mexicue
50th&amp;6th! Mmm Mmm Good! Sausage&amp;PepperRolls ChickenParmRolls! Retweet for 6 #Free Zepolle! http://t.co/kkN2EQSOzT	1389891189	423860485788667905	f	valduccis
50th&amp;6th Today! Sausage&amp;PepperRolls! ChickenParmRolls! Plus the #BestPizza! Retweet for 6 #Free zepolle! http://t.co/dF8XjuhLzI	1389890856	423859087927812096	f	valduccis
@CPRmediasvcs Thank you! You won't be disappointed.	1389891345	423861142252191745	f	neaexpress
Like if you could go for a hot chocolate right now. http://t.co/lugbqqvNRJ	1389891602	423862217327792128	f	nuchasnyc
Lunch time! Try our mouthwatering Asian Tapas @47&amp;park ave. "MEAL DEAL"{any$6 item+sesame sandwich w.hibachi chicken+free drink} only $12	1389891216	423860597328199680	f	shanghaisogo
50th&amp;6th ChickenParmRolls, Sausage&amp;PepperRolls, Plus the #BestPizza Ever! Retweet for 6 #Free Zepolle! http://t.co/WtnRP4PC0W	1389892023	423863985553674240	f	valduccis
RT @MexicoBlvd: #DUMBO love today with @ToumNYC back in the lot with us! Come fill your belly, Brooklyn. #xxxspicy #fresh #goooood	1389892148	423864510336995329	f	toumnyc
A review from Fredrick Beondo, W&amp;D lover, about the return Chili con Corne : "Oh, it was GLORIOUS!!!" Well said, Fre... http://t.co/Exi7XhAPjx	1389891773	423862936239894528	f	waffletruck
We are on 47st between park av and Lexington av!!	1389892047	423864083885330432	f	chefsamirtruck
G1 getting repairs\nG2 50/6	1389892885	423867600666648576	f	gcnyc1
What's for #Lunch 50th&amp;6th ChickenParmRolls Sausage&amp;PepperRolls plus the #BestPizza Ever! http://t.co/XlOZ2wmAT9	1389893318	423869415315083264	f	valduccis
Hey NYC our Brooklyn Popcorn Truck is parked on East 70th Street &amp; York Avenue today.We are cooking all your favorite flavors today!!	1389893197	423868907158384640	f	brooklynpopcorn
@DigitalSuzy Suzanne we will be visiting midtown Friday! See you then!	1389893999	423872274060431361	f	brooklynpopcorn
RT @TheWaytoHisHear: Congratulations Kendra! Check your email, you've won the @BrooklynPopcorn Popcorn giveaway! #giveaway	1389894333	423873674333392898	f	brooklynpopcorn
http://t.co/1U7R9R66fZ	1389895042	423876645515427840	f	parissandwich
Break your Resolution: BBQ Nachos with Burnt Ends Chili. Come on... you deserve it.	1389896059	423880912389300224	f	mexicue
Keep your Resolution: Brown Rice n Greens Bowl. Stay strong... we believe in you. http://t.co/90yf8h9g5f	1389896037	423880819238010881	f	mexicue
We're still down at 52nd and Park! Ready for lunch?	1389895519	423878646408167425	f	neaexpress
#Lunch isn't over yet! 50th&amp;6th! Freshly baked ChickenParmRolls and Sausage&amp;PepperRolls! Who can resist! http://t.co/knRZ8RYdYA	1389896668	423883465147158528	f	valduccis
Bobjo express stay at water and hanover sq.	1389897032	423884993992331266	f	bobjotruck
Bobjo truck open at 22st &amp; 5th ave today!\nSorry late update.\nThanks!	1389896893	423884411764240384	f	bobjotruck
Four years in business today!  Thanks @bkflea, thanks awesome crews past &amp; present and most of all, thanks to ALL of you!! here's to 4 more!	1389898321	423890399686434816	f	milktrucknyc
RT @ssj_park: Also the best grilled cheeses! @bkflea @milktrucknyc @villagevoice #BaconCheddarBlue #ClassicWithATwist	1389898229	423890014175784960	f	milktrucknyc
RT @MitchSimon: @shanghaisogo how am I just learning about you? You need to come to 53/Park corner! Everything on the menu sounds amazing!	1389898088	423889422174932992	f	shanghaisogo
@MitchSimon love to come &amp; see ya all there one day.	1389898083	423889403002753024	f	shanghaisogo
RT @ohlivvyuh: Happiest girl in the world. @mactruckny and @mikenwillies for lunch! Supporting small and mobile business is fun! @nycfoodtr...	1389899246	423894280248500224	f	mikenwillies
RT @spaceywaceyjflo: @mikenwillies Hear, hear!!  "@ZaraAhmadPost: Mike n Willies! The best food truck and the best dudes. http://t.co/bh2tt...	1389899243	423894266902228993	f	mikenwillies
#whoopsie! 45th and 6th ave! sorry guys	1389899470	423895220368199680	f	mooshugrill
"I have no excuse except to say that I was young and foolish and the waffle was Belgian"- @jlasala2112 http://t.co/f8eFEcMwl5	1389898973	423893135044149248	f	waffletruck
Sesame Sandwich &amp; "Grilled Enoki Mushroom" with vegan oyster sauce! That is my health lunch today. HaHaHa,.. http://t.co/NpEVwhwx0D	1389899528	423895461200932864	f	shanghaisogo
50th&amp;6th #delicious rolls today as well as the #bestpizza! http://t.co/fsZzUT57YI	1389900291	423898660905050112	f	valduccis
Done in DUMBO! Catch us again tomm!	1389900592	423899923709710336	f	korillabbq
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

