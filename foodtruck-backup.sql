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
    matcher text
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
5249c4bb498ecd25dde27c5e	https://irs2.4sqi.net/img/general/	/764670_x0RdEOs5TL4SEe2zGgpkzPFBFmlFV7-6UQiVtoFeHaY.jpg	public	goburger
5182ad6b498ef6cb59d48783	https://irs2.4sqi.net/img/general/	/39425123_zPh6ih4GAAygbhRJ-pyPdCr5TI3rXafgKyIEEK4HpHY.jpg	public	goburger
4fb29dc4e4b0e08c1e225555	https://irs2.4sqi.net/img/general/	/ckjwTj4Fd2cRoZvDQZw_1jYdwuBF4BsfV4ZWc5oElFo.jpg	public	eddiespizzany
4da8977840a3582fb8c49316	https://irs2.4sqi.net/img/general/	/MCGIPRA0XR15JNG4O2YZJQBCRMK05UVTC4T14TOQWRTNMQFZ.jpg	public	eddiespizzany
526fef71498e92d1ace459d9	https://irs0.4sqi.net/img/general/	/60805368_eCRrBwapYrNL8fM9tmIaLCfnlhQYb9ASU-ZkaR1Og54.jpg	public	mamuthainoodle
52a0bef911d299250c89f9c7	https://irs1.4sqi.net/img/general/	/349672_Cg8dtcrfQ0WZeSo7BJR61YBG6VzsiMltZP8XIqyHiu0.jpg	public	mrniceguytruck
521cdbc611d2549cf41dcf9c	https://irs1.4sqi.net/img/general/	/926357_0BYLrfqHavxLIHQNkWupu34ImE55HTUVGGDJjycyOVM.jpg	public	seoulfoodnyc
5203e16e498e9e8e0a93b61a	https://irs3.4sqi.net/img/general/	/702028_Fog-6PEF03KateivIPP-hx87Qn6gi7PwnaJv-wTFv3I.jpg	public	carlssteaks
519babe8498e355d9d35fca0	https://irs2.4sqi.net/img/general/	/65817_6p9jSMaQMqP9QGn3KOIyuDOG15jaLxIPvsdrpZGWdj8.jpg	public	blend_express
51af7257498e0c7f8979c05d	https://irs3.4sqi.net/img/general/	/752258_nUJpoSxZ8p9BBJMG5ISetpo3DDLzycLT_gT3z9fvJmI.jpg	public	getstuffednow
523c8b2a498e959b87f8ded2	https://irs0.4sqi.net/img/general/	/39707564_-WCsPSk2ExKeZ8q06DtUQrpt_vcWG9-AzvFoToSdQqY.jpg	public	getstuffednow
50ca356fe4b05b0bb93edc40	https://irs0.4sqi.net/img/general/	/1590381_NyRIp7fXJtGoJoXp25IcMmufNufPxxvLEj3TVYXRo5g.jpg	public	getstuffednow
52013fe1498e5f476bfdcf83	https://irs3.4sqi.net/img/general/	/30611522_DHhazmY8dyNAbmijjHX7jyyfVBEiugL5-GJcTLuYjS4.jpg	public	getstuffednow
51c213db498e0748ab0dca3c	https://irs0.4sqi.net/img/general/	/53641916_5aNKp9fdHx3i_Pi15Z_X6pE3fAsTX35YBQ0nlmZGfaA.jpg	public	morristruck
4fe65d6fe4b09198fde5842a	https://irs3.4sqi.net/img/general/	/nVmhJloDitdcBPFceYT8ajqQqgXBpB_w5GoPWse33Ks.jpg	public	valduccis
4f7deaf5e4b0ffb6a3f2008e	https://irs1.4sqi.net/img/general/	/Xho5Xq8BtpNhEQvH0KRI3yX4kUstFRwTxEDj6QoawcM.jpg	public	palenquefood
51b8a845498e8ebdef064e0c	https://irs0.4sqi.net/img/general/	/761163_j9ai1NfaIpK2TLN8JzXbTwyIhVzuZevNHBV5EpQ7Fh0.jpg	public	palenquefood
51435e1de4b07d53cf71fd7a	https://irs1.4sqi.net/img/general/	/4486_lUhkecOFThYlMHKai4wDp4lXXiQSPLTq3Nno5WMIz7E.jpg	public	palenquefood
4e6513efc65b2dc8a0bfff6d	https://irs2.4sqi.net/img/general/	/TUQTIKBJPOALJKHN54QRKGISWMQDDOW3WTAECOGJ4FOJTPXI.jpg	public	palenquefood
5286645011d228bbd12f9880	https://irs0.4sqi.net/img/general/	/1353667_2qCG26N4ikz7mbvEGkrFkcNLagGqrzRuNyeQ35CCDE8.jpg	public	korillabbq
528e451f11d2a93e4361f565	https://irs3.4sqi.net/img/general/	/977282_wEw3nDjN0NbjC4CgQ00ON0YjdtnMocrfAjXDM4UH63Q.jpg	public	korillabbq
5231f54311d26e8da5827f3b	https://irs1.4sqi.net/img/general/	/977282_AToQDrlKW5PTNbNGQcB24_BeJNsRMgZTeYmC9P-or38.jpg	public	korillabbq
516d98b8e4b0b059e50ff5ad	https://irs2.4sqi.net/img/general/	/117715_BoNkQJO4jPWEtg_ef4-URb7IseoIXnYiP5vkvWJtezg.jpg	public	toumnyc
516452a5e4b0e1b216fdbaa4	https://irs1.4sqi.net/img/general/	/26263584_5wpEOb9FygNRBFQySA-pE1t1q_E9jVM_4mx2mnw5fAU.jpg	public	toumnyc
51716b5f498e03d8bc252c48	https://irs1.4sqi.net/img/general/	/11709298_S8klPxq0yPyZw2X9-_0IZyk6TFTn9xi5SWd_6BGCeVM.jpg	public	toumnyc
512161e0ebca7d20d6a70104	https://irs0.4sqi.net/img/general/	/4574_ZC6mf3ha1jNXmFUDgtNsN3zIf-NHyqgxA3WkUkOl4mY.jpg	public	biandangnyc
519fa37b498e7adf7e8ebce3	https://irs2.4sqi.net/img/general/	/47170230_A9xVWAtkJBP-vVqUF1q2WlK8yuZTf1CVQz0JcPrHGY0.jpg	public	taimmobile
4dfa4a9840a3542ff44549df	https://irs3.4sqi.net/img/general/	/VBAJNQCBWDMP2WKDXJ5QHQ0WYF1MKHZSLUAZZJXKDBDLDUWG.jpg	public	taimmobile
4fa814d1e4b0d607baf8bd9d	https://irs1.4sqi.net/img/general/	/2drHnu4mqj-uzpwwcJa3MatYGD7KFuxjE472rButWlM.jpg	public	taimmobile
501d4734e4b0af03cf473287	https://irs3.4sqi.net/img/general/	/6BUHUmEyYTTh3a2SRjSYRklUlTfQBNbFnnk_hfEojYs.jpg	public	goburger
501fe830e4b0bbddce992f90	https://irs1.4sqi.net/img/general/	/fFBOGONZt5Zr77Vc5g8adoAiBht0f-MBut7GqorVEjo.jpg	public	mexicue
4f67b0d4e4b08559c4c60149	https://irs0.4sqi.net/img/general/	/SdNxRS0joKXurf0FEv8_SRg-GeR9lGCN098_ZB2tijA.jpg	public	mexicue
50784742498ec6be8cd3f88e	https://irs2.4sqi.net/img/general/	/155927_ebZApDyXpTKTmvOQHdBTxNc2wJrsZV2QASmpYTNAVJM.jpg	public	mexicue
507efae0e4b09a52c022ec3a	https://irs0.4sqi.net/img/general/	/39213_nH-zcqfLCJqMvG0Nco0LWE4QuRuoL6unlEXJlJbTEF4.jpg	public	mexicue
4fd79157e4b071eb33a9c810	https://irs3.4sqi.net/img/general/	/8zrcTIejD5EBiOJzSobql1_PQWr-i2KmRfgMCYmbK-M.jpg	public	eddiespizzany
516ee142e4b04f28d58be309	https://irs0.4sqi.net/img/general/	/36812449_DjR1ynMnMpwj-KmiWPZQldmGQwJ2IEzjSwwmGevqe3U.jpg	public	sweeterynyc
5107e09be4b047c08ade6bf6	https://irs3.4sqi.net/img/general/	/760350_ZaalKVnOYdVAGoQEdugu-1Lws1LubyJBOVpZvJJD1V0.jpg	public	sweeterynyc
50188a43e4b0d35e6d8035b4	https://irs0.4sqi.net/img/general/	/b-fKh6mx2WxCybNQkr9ovk_jv4x7bwJPVFM9RF3M5T4.jpg	public	sweeterynyc
526e8aee11d299d16e74b447	https://irs3.4sqi.net/img/general/	/67629862_ZPeS1alTFabw1hPqq8PCcGF1SRFynqA23OgkKg8yc00.jpg	public	lovemamak
521b83c411d29ec0512f89b3	https://irs0.4sqi.net/img/general/	/255980_1U9yRWzBKuIDLReBhmBs45qJ0mtHu7pzL_Fv4T9gTss.jpg	public	lovemamak
5203bd51498ed50247ee01dd	https://irs0.4sqi.net/img/general/	/60805368_HlIeqCMjY2I5md2mzI5crKizc9wVPUZo_sBmC6zrPEA.jpg	public	mamuthainoodle
5033cee6e4b03e64bc749ee7	https://irs0.4sqi.net/img/general/	/tIyy6IAKcw2SSiX5JSPBCURstZZisntK_46plgrfdJ0.jpg	public	blend_express
51cb2c41498e9851cecdd49a	https://irs2.4sqi.net/img/general/	/5728350_vuJ4ORu0wHhd-B-f4FTNfsoIhfHgtJRMJc-QEeiYmNQ.jpg	public	taimmobile
51ab89bb498e83fced4cefd6	https://irs1.4sqi.net/img/general/	/66074_8dLzCKmVRde0Uvtx_NSl9SKROFh0kat1IQgcAvU4J3M.jpg	public	delsnyc
51fd732d498e415eeb8b9881	https://irs3.4sqi.net/img/general/	/8839239_mAp7_MVmWbbK42Xq3-W-1zmegy-MNx8NzB0P5Brf-Pw.jpg	public	delsnyc
520e673a11d25d1282a44199	https://irs2.4sqi.net/img/general/	/117715_KjwJnc6idBB7TuMKhGboHDg8IYjlGcr6h3I6_fJECmM.jpg	public	delsnyc
4fee068ce4b0f9bd2b4041f7	https://irs3.4sqi.net/img/general/	/UQwqaF9knSdh4LFRzAhnh7hcl6_dSjDTg1phtqTe_7Y.jpg	public	milktrucknyc
4f749b3fe4b0f06c04ae2440	https://irs3.4sqi.net/img/general/	/rA31cWGMm0G8EuZFYZBxb3y2OrW3oEo7vCj1L2XR3AM.jpg	public	milktrucknyc
5281221811d21e907e460e00	https://irs2.4sqi.net/img/general/	/4195495_akELCvAQ7aY-bfTfHk93g5g5_qcJnQJV7h_gH0FlKUA.jpg	public	milktrucknyc
52052ef211d22b8ed81dd96b	https://irs1.4sqi.net/img/general/	/36360429_am9ha8rSYxAvCaSMU9ya6lI9MzIgcpR62DH6HS1b-uY.jpg	public	milktrucknyc
525b3a3711d2040fdcbd6fee	https://irs3.4sqi.net/img/general/	/52031712_DN0C9vfm3iv1geUuFX92Pt0jwgl8NhbGokLj_o0Ebjg.jpg	public	mooshugrill
529fe66b498e1fd14afe696f	https://irs1.4sqi.net/img/general/	/68150_h0wbg6xbNwrEjXD6uaE12ZDZYF_h55LN99Es520nMBI.jpg	public	mooshugrill
5213a7c011d27a56f99dfba3	https://irs3.4sqi.net/img/general/	/11074699_K2ka1_NxiELyTqgjvY3oMN70IUxIlADqRIAb5QpzsLM.jpg	public	mooshugrill
51eae36e498e58d50e5683ba	https://irs1.4sqi.net/img/general/	/331066_SArUzXa_cz_-YMQco1rwYAfU8a99TZCHJX9a2WA3fHg.jpg	public	gcnyc1
52407581498e6271e84d0d20	https://irs3.4sqi.net/img/general/	/663291_BQuSIJb2d0ODso7gvZiRLuvYbp3sg4FwHG2u0kAwsmE.jpg	public	gcnyc1
5244712a11d295d581384a17	https://irs1.4sqi.net/img/general/	/22780_QXd0BtJcOWXZwSm_ZG3oXyaNj6Qw5-p8hWQzzH121fY.jpg	public	polishcuisine
5192873e498e63958610c2eb	https://irs1.4sqi.net/img/general/	/117715_Jf2pdeF9ztory7puWsPaFE26jmMzPEzjOfPopvTzSjA.jpg	public	polishcuisine
516ef5ece4b0d1c83382c12f	https://irs0.4sqi.net/img/general/	/117715_Gt3J4FMusC7YQjSfEup4O7bAO10z8J4gxmnd0xKnZuQ.jpg	public	veganlunchtruck
505348ffe4b0669212770040	https://irs3.4sqi.net/img/general/	/30736334_CliHgKVfq-ToaH03Q0rISwFXpeOJXQvCidaefhyLfFA.jpg	private	veganlunchtruck
519a7e33498e6e4ea6ff66f1	https://irs2.4sqi.net/img/general/	/3354_e_1JMupbEA8VtOBVXgLHAvtJGQwcpHvY2JyFESXYSjo.jpg	public	thesteelcart
5254357b498ec4662e20c654	https://irs2.4sqi.net/img/general/	/2620660_kMXeinZ_B6lOrHRQnheIHMBr7p81ZxcUblWl0SQ1vEs.jpg	public	thesteelcart
513b9b7de4b04f7024bc158a	https://irs3.4sqi.net/img/general/	/45519738_eDUGOpHYwiR5C3VUps1gQ1YDIq0Di3WMfuirGs2EVBk.jpg	public	rickshawtruck
506dcb8be4b0748e0467de78	https://irs0.4sqi.net/img/general/	/157259_PdYI3Fpzhcz_LoGnBeymaSAZaZCiVVw43c4xaYQQIDY.jpg	public	mikenwillies
51117858e4b0e14064917adb	https://irs2.4sqi.net/img/general/	/263293_EvgjxXJqOivd94q0mbPR_AxkRXuzkFtjOBcOWnXuyQU.jpg	public	mikenwillies
5135022ee4b0592185aa975e	https://irs1.4sqi.net/img/general/	/2660256_0rdKd0P0tCYzLf5j7-_3b8HbPNDVCW6S0hHdJGW47Wo.jpg	public	mikenwillies
507b0648e4b0109f3656e2d2	https://irs3.4sqi.net/img/general/	/76137_7JNe3m0dO2MZ7a9rkqa_DTlnrw0LyNitqksFG7_5IC8.jpg	public	lobstertruckny
508abe69e4b01ff7516d118b	https://irs2.4sqi.net/img/general/	/8029486_9wt2tO9BnY5d11Ef0mpAgHAqfK1QMmSvLXglU4fj6Xw.jpg	public	lobstertruckny
500ecc9ce4b0a6d209804d9e	https://irs3.4sqi.net/img/general/	/d2yG6CtTrc8TQAXoEGN68UYAv3DiJIqJvKU65-ApcaU.jpg	public	lobstertruckny
5245c7a1498e0eb9bc097723	https://irs0.4sqi.net/img/general/	/1727660_xLZtYmqATL4pckN_IhgIj0AgUbDAJxywzqbf5PKEooM.jpg	public	lobstertruckny
4f9c18b0e4b0b38d2f554383	https://irs3.4sqi.net/img/general/	/AQEKYbyPrQt5uMWhy4r4ODm2vSMCqPseJyMhcg55mtY.jpg	public	eddiespizzany
5008051fe4b0974c844d5003	https://irs3.4sqi.net/img/general/	/oNy0_bsWPyVmjrduzJXpbrAPHjQS0PVbyOCfoRSD9xE.jpg	public	shortysnyc
51a4ee69abd87ea53396c979	https://irs2.4sqi.net/img/general/	/4083549_jMzaCPEId80kWmAaq2oQ9APKf4bLvdeHhy40qPeB9j8.jpg	public	shortysnyc
50045b1be4b0004dbf67c977	https://irs1.4sqi.net/img/general/	/MDweBG1fBnF_fZ1tOghWyHS9qUxGNiJeOrOpoA-fBrY.jpg	public	shortysnyc
529ccbc511d21047117cdea2	https://irs2.4sqi.net/img/general/	/68150__CRf8sW9KvXZTkcAQEc4EsnYPgqXA2trmMxy-_AzobY.jpg	public	mrniceguytruck
501c284be4b07d0ab63e08be	https://irs1.4sqi.net/img/general/	/vQv8P8_hFNwHMmpR7k6-arr8zqYmmgoSG_aAPJuz-ws.jpg	public	itizyicecream
51e83b4a498e0a1c64e62828	https://irs1.4sqi.net/img/general/	/26624_AGoljLki5SS-GJGKaAGB75mloHKRBkJ1Qj5BQCRP1_Y.jpg	public	itizyicecream
51dd9efb498ebbc846c11c03	https://irs2.4sqi.net/img/general/	/13001992_b9dLXH02o0ZX8hyUZVtpgGW6sDyzAl23vmEl-0Hj0jY.jpg	public	itizyicecream
5161e794e4b02525dbd064d7	https://irs3.4sqi.net/img/general/	/310577_h_ww6Za5XojCZcGVq7-gZluC_YvRnT1EOXY4hwV7KJ8.jpg	public	seoulfoodnyc
5012d0d5e4b06fc7ce735a68	https://irs1.4sqi.net/img/general/	/7J2g1YLtx4ma57g4A4CerJJ66OwudjGhFI67JaNl1Qw.jpg	public	seoulfoodnyc
521f754c498ee4d6fbe8a778	https://irs2.4sqi.net/img/general/	/22491899_EEPqf4HeJFaaFjYabKyScGZ8symjXEgMjPUEkfpJsJk.jpg	public	morristruck
51856452498e6f602088cbe1	https://irs2.4sqi.net/img/general/	/232510_pLk3QUUWFOu82-4SX-ObtA8bw2ZPf61QBOeIuL50T-o.jpg	public	morristruck
5079a745e4b00277f33e4836	https://irs3.4sqi.net/img/general/	/34723233_tCoDnWhdhZj61xi_e00MNwJoK_UcfDXCQQ7Weat8pBM.jpg	public	valduccis
521e9e4511d2d8ddc5c69dbd	https://irs3.4sqi.net/img/general/	/117715_r7cpzyXCpOthqHouR5gdqIMX8k0TZ2KWHFun5wh-EYk.jpg	public	valduccis
507dacb0e4b0d8cafc9601e0	https://irs3.4sqi.net/img/general/	/2361939_S3NwwSNVZD-2tAhc3bwAvsYgk9tXwYv0T0yq9ci-ihE.jpg	public	toumnyc
505c9776e4b0643aba1071c7	https://irs0.4sqi.net/img/general/	/5568483_yQrtG73dbug7q06p9IASJmTFnOVgGprIZKbfHjQRcso.jpg	public	biandangnyc
5106b878e4b05ec869ad8b34	https://irs3.4sqi.net/img/general/	/814104_blIawoImaEcqf-Mg89W5A-nEHiZ5jx76BEYHVzz8dnA.jpg	public	biandangnyc
527d2c2711d2c984e85cb11b	https://irs2.4sqi.net/img/general/	/4179871_5FQ2eCC5ZeizUVRLh4tadgEAO1BnJjVQ7pSEvSDwIfQ.jpg	public	biandangnyc
5267fa9611d2688bdc4587a2	https://irs0.4sqi.net/img/general/	/2136029_bvqot1MnMJ9IGYsYJkamqTiE_lL96OcfilWMxskhdU8.jpg	public	mooshugrill
51105b22e4b0a7b61fac854b	https://irs2.4sqi.net/img/general/	/117715_vKu0po70jlTD3qN9mXsdNiE6V5Od1hmYMVlUY9xSIP8.jpg	public	veganlunchtruck
526e782b11d2a15e6fb663f3	https://irs3.4sqi.net/img/general/	/8761552_XH612BVbFNOBD2jJVEMDzyawnGF45FygNA3TtdKo6UE.jpg	public	veganlunchtruck
51dc0e71498e8db4f9a8106e	https://irs0.4sqi.net/img/general/	/4456614_ZWvsB80ogvwYkoKIyVf6q5RfcDXwuKI4t0XJJhyLQ_I.jpg	public	thesteelcart
5109aed2e4b01d2a5b69b022	https://irs3.4sqi.net/img/general/	/117715_0jgrjk5IsUFppNAL0NtebyMYoz1JMdzrnWAIjrLMHZw.jpg	public	schnitznthings
5012e555e4b0dd18ec16bd37	https://irs2.4sqi.net/img/general/	/mZQAOCmv5lnRZ1qOUTwDXk-MLC-X-p01AfECgfLJC2I.jpg	public	schnitznthings
5176cceb498efe500552cc9e	https://irs0.4sqi.net/img/general/	/21735785_zaQs-7anNinrrQlobBV2AjNxquTXs5g8ZY0NxvoxvHo.jpg	public	steaksncrepes
523b2edc11d265bf373f82a0	https://irs0.4sqi.net/img/general/	/8853695_cjpq3trk4bFpcU1oHWwj4XxwwD9ZI169sNncUyOQoM8.jpg	public	steaksncrepes
5245c79c498e057f7d5ff65d	https://irs0.4sqi.net/img/general/	/117715_CEghvDHaxkALy5RxQCAVW-kyM0TAZo2-fIT4e6veJeo.jpg	public	neaexpress
50ad186ae4b0b639ca7ca234	https://irs3.4sqi.net/img/general/	/295161_qCQYG0XjW1Ji0pSDxM7fWRzxTZRbcYyZbsbPNJo12hw.jpg	public	toastmonsternyc
521649b811d2913e20a1ae87	https://irs0.4sqi.net/img/general/	/5568483_RtMp5aDM_JtBZOI1u48Jy3om4Z672obezdu1uA_UWd0.jpg	public	toastmonsternyc
518a82c9498e068718057964	https://irs1.4sqi.net/img/general/	/25979758_bGWQQ7W2SJI4v7KmU891VcYZGitov6qbSNAnIEt8HTo.jpg	public	toastmonsternyc
4e4e92c7b0fb088f3c0f14d5	https://irs2.4sqi.net/img/general/	/HTLXSW2D30RGIEYPI0JGR22LUCS5BTXQ0LXDWAOHH4PCVHM4.jpg	public	bigdsgrub
51dd9ddc498efb9a3437e123	https://irs3.4sqi.net/img/general/	/4501533_djr9d2BEP8dg7E48xJjJTa_Yjk0Iy-MmBG6hgIQBLUs.jpg	public	bigdsgrub
4e42f5ecaeb7f6be72c39c70	https://irs3.4sqi.net/img/general/	/JC5VO3Z50HMMMVLCCGWDQPMKF4W01VBXP1QS2LFESR55UHIX.jpg	public	fritesnmeats
506f12efe4b0bb9551703ca6	https://irs3.4sqi.net/img/general/	/2219480_LuuyF3peyimVfdQvb7tj9V-FHAEA0z1KmaSfMf9vKkU.jpg	public	fritesnmeats
4f832947e4b0cd6f644ef74a	https://irs2.4sqi.net/img/general/	/qCgaHGVJ9rFDkC5DFKEKLBBekoxb6PRDRfuWV7neue0.jpg	public	fritesnmeats
51800af8e4b07a4a57023def	https://irs3.4sqi.net/img/general/	/9548073_erhzj0ShEDKaz8S8DhlDe90fDjJEIWjilIxO4_zjdGE.jpg	public	thepocketful
51424d6ce4b0041cb8df9856	https://irs1.4sqi.net/img/general/	/117715_oxR8_TwNSaCL-_gKDA2i2-1YoRfVVnbfT3M9Bfu4nxE.jpg	public	thepocketful
511a7d64e4b0c6a64118260c	https://irs1.4sqi.net/img/general/	/793192_Dtd9vMRk-pbBJscn1cb7n29zM87iJjZy6rojapRhODk.jpg	public	thepocketful
50a696b4e4b04d062582a95e	https://irs3.4sqi.net/img/general/	/32050404_qo6ZUnU5LQMoqrAR6YoH5Qz-PdUcD1d1jCheEJy7lng.jpg	public	thepocketful
4e09f3fca12d09aa881a769f	https://irs0.4sqi.net/img/general/	/NTSOFYDIBYVWGE4RYQTBBNIAQESPZ1LLW3Q4TC3TGMROSJPH.jpg	public	nautimobile
5022f267011cfeafe81dab9a	https://irs1.4sqi.net/img/general/	/7EPnN8ReXYQWoZYxzqkH9AQlOe8vFPtVP_60n65i9U4.jpg	public	nautimobile
4e70e35c52b140871b6fa35f	https://irs1.4sqi.net/img/general/	/1TB5ROKJY5NF0GAVS4YS3WZTFCUXXHTPLLBUIK4BU0XD0QA5.jpg	public	nautimobile
51ccc251498e028212e9b1e3	https://irs0.4sqi.net/img/general/	/117715_ozxp6K6iPGwKCzQDARR3BgMcisplkTt0x4LEKDJdBMk.jpg	public	nautimobile
525c259b498ea7548cf31f8e	https://irs3.4sqi.net/img/general/	/769710_ZxOOtsSbFVklHIRhXVmTO7ops0Pm0EybRDTgUvGHrSY.jpg	public	disosnyc
5197cb68498e8d409a89ec1b	https://irs1.4sqi.net/img/general/	/1847096_oRB5R_owQW40gVWlJhNNsh9_0bEq2D8Rt3Zod9HUbUg.jpg	public	disosnyc
51dc5fec498e4e9be748eac4	https://irs2.4sqi.net/img/general/	/22801_gX0atVT6Jt_H6FPXuYAqHD4VzO5jAmS4SVid_ZLkk5U.jpg	public	disosnyc
51c1ea41498e372d91835cf9	https://irs0.4sqi.net/img/general/	/5067950_pSXIZo_RqO8Hh5AuWcomjr0p3q_pXPUMWe99W8hUGTU.jpg	public	burgersandbites
51a79983498e3044671cd784	https://irs0.4sqi.net/img/general/	/1441492_yfySwml4ChzJ_ni5DxTq-8n2UlecWBWjgxR-ygA6pYc.jpg	public	burgersandbites
525de1d7498ef4b27ada0847	https://irs1.4sqi.net/img/general/	/31827631_CApIgPWaXupe3toLi7iJLb6NxIyn2IDTOjAG0qw-PIk.jpg	public	mexicoblvd
50ce2696e4b0881a7ef3ee67	https://irs2.4sqi.net/img/general/	/263293_lcA30Y_JnQGKaaHhRqFUio2HQ8UQkphCWP9yhW4CE3g.jpg	public	domotaco
5258d3ef11d26d03cc0563a5	https://irs2.4sqi.net/img/general/	/117715_GQ_O1nyBbVlKTaYpRlprc8ZdIEAEftbU4_9hDGjvxsU.jpg	public	brooklynpopcorn
5243206b498e78230cd0770a	https://irs0.4sqi.net/img/general/	/54092198_eF4CEteD3zHjOCJzaYssyRXaQElB-GEOy2sqzBFQPm4.jpg	public	thegreenradish1
525ee647498ef229c65969fe	https://irs0.4sqi.net/img/general/	/10045965_ptbEO58Zn5wDz6kgitvMVjFScmxSkkuHNbK-AguCXSM.jpg	public	thegreenradish1
51c8a3c5498e797153ec5629	https://irs1.4sqi.net/img/general/	/46314126_95x6AErCZEGSi1zGZrFCY-EzgsIMyOhgO4G59l-u_Xg.jpg	public	funbunsnyc
5212ec18498e9494b634a94c	https://irs0.4sqi.net/img/general/	/814104_tUkLgiQ8zcYxovra9R8PIx7FckFhBjzNVHmirteXd58.jpg	public	funbunsnyc
4ffda271e4b03bbc7f8fd13a	https://irs1.4sqi.net/img/general/	/6Dtx8fj7IXT6M3O6ZV3rXryb6zKTAqPchjeOM2BJJAs.jpg	public	funbunsnyc
505204d6e4b02dee62bd961a	https://irs1.4sqi.net/img/general/	/dcOYoRoNNeCLMxvoyAN-o9gJObcw5FljMqYpS9cps84.jpg	public	funbunsnyc
4f753600e4b07eec20023ddb	https://irs2.4sqi.net/img/general/	/zUb4OswXiQLnF_k2xnx7AdupnEIl1nuGyIuFcmFWf8Q.jpg	public	thetreatstruck
4fbfe026e4b04422a08a40f6	https://irs3.4sqi.net/img/general/	/Han8Z4R-SQ615pLoN2lRdPfKEFa6UW2yudSOxXmJtts.jpg	public	thetreatstruck
51461b9de4b0bb73a6821e97	https://irs1.4sqi.net/img/general/	/1102787_UDt7OJpexNs8VPrehVDsp9EtfUJnMhKzJ2tTXuof06M.jpg	public	thetreatstruck
4fbfebe9e4b0a3bda0340383	https://irs0.4sqi.net/img/general/	/Brw9_z178IK92xMEXLCSSZrP0-99GXjutCp7dHCi5CQ.jpg	public	thetreatstruck
51d31ab97dd28a271207af20	https://irs1.4sqi.net/img/general/	/59958053_5CogfmHgRpBtjkPzVkAgAjK7q9ac0bo8Z1TPwxPIFAw.jpg	public	grillonwheelsny
50ce269de4b07c1547ebfb2c	https://irs3.4sqi.net/img/general/	/263293_qjcLaRmf5itOMyRiq4AyYZuY2UVjVJk04lO3FTA2CMY.jpg	public	domotaco
4ec59ebacc21b428e0de466c	https://irs2.4sqi.net/img/general/	/4AMXSGP5YGTUHEL3TFKTS5ROVIX4HUTU4MU5ZW1OX5E3URDD.jpg	public	domotaco
520912ad11d2f941183dea9f	https://irs3.4sqi.net/img/general/	/13285510_v7K0PTg4FzGI822Jbc9A8K5mUHIxwJPBZB_0xNeEauE.jpg	public	domotaco
5220dc78498ebd10d150f736	https://irs0.4sqi.net/img/general/	/29917892_nMZHXkfxBukc2QfFqtDBTZSJ1xpMkoO7VGBJmGKkwhY.jpg	public	brooklynpopcorn
5180207390e7374e46b6c165	https://irs3.4sqi.net/img/general/	/49563206_uKsSD-Cd2jjy6FMyR9U_--7DdUBJ7ZUxtdlushxyIAg.jpg	public	freshandhearty
513101fce4b006d9c4991bdc	https://irs2.4sqi.net/img/general/	/17248619_XfpmI8dNgmoeHE3BXjV8bL2yuuMTqxU3FqDr4BqX7Ks.jpg	public	bigdsgrub
4fa2d04de4b0489ba3d7936d	https://irs2.4sqi.net/img/general/	/hsPbM0G5l3AsUaI3x6r_VkiSYo4pYlWTKK2S9zqh_KE.jpg	public	bigdsgrub
4fb6bb41e4b066430032e4ca	https://irs1.4sqi.net/img/general/	/HHZWTU3POi_yJE4GU0zI_NjZNerm5y3MjjxddcV5ZMs.jpg	public	rickshawtruck
4f8dc377e4b0ca2accf75652	https://irs0.4sqi.net/img/general/	/EKcue5yGEyaPnBymSd_HtBxWEZl4grYSOXMhw-gqpTs.jpg	public	rickshawtruck
506dc9b9e4b0c21f078c3bb3	https://irs3.4sqi.net/img/general/	/22983_XN2GbKo3a5YsNY_ZpiBcjUHTD2if3TWS8r586Uq4cEk.jpg	public	blend_express
51dc5a9e498ebf7ad40223ec	https://irs3.4sqi.net/img/general/	/1328035_Ak3fMs2e36r7NvIE_gIDK5XZ9CwrW1DEJa3g1oobp5E.jpg	public	wingnitnyc
5140cc96e4b0ef29f4802508	https://irs1.4sqi.net/img/general/	/4886503_z36ZXtYKGVIHcNLCR18ZdUWtpStRrbf33rInxsr2p1Q.jpg	public	mexicoblvd
50e71f82e4b07154c72fdc22	https://irs2.4sqi.net/img/general/	/275165_az4RUZ2U7-4cfdnQA1FlMrDLaxwCMriWtlhS_pddjEc.jpg	public	mexicoblvd
521cdb8011d2f79883b5be62	https://irs1.4sqi.net/img/general/	/36501880_zzNkJUOscINjy2aiwKSZEwjfQYJPjqmAsa6zS0dakp8.jpg	public	nuchasnyc
5298ff7011d22a38856168e2	https://irs1.4sqi.net/img/general/	/191726_GHXLJD8lsdPciKdqJErekl1SKPjw5k4N2YuNJC6JRTU.jpg	public	nuchasnyc
51118d62e4b063f95c18d16d	https://irs1.4sqi.net/img/general/	/191726_pTyD4DsW_jGt7E3QJJdH1QB-mHP1ZYggLzXtnZ7j3Oc.jpg	public	nuchasnyc
5249b1c511d23e54343ae083	https://irs0.4sqi.net/img/general/	/769710_HUiZ7dJrNbdnPYV-DTQRr1z0zgoxFx9KMC_Y-OQ6O2o.jpg	public	bobjotruck
51378e9ce4b071feb46ef7cc	https://irs3.4sqi.net/img/general/	/18792384_RSm8zhe_6kUOxy91taByfRjTDSLp7stH7PI41aJHOrU.jpg	public	bobjotruck
5249b50c11d2d415e3c6b017	https://irs3.4sqi.net/img/general/	/769710_HOnpTjl0b6qd4-yoPpg9lXZGBy-ZKikqzLlFWw2sQfs.jpg	public	bobjotruck
4fe20639e4b05dcdf7f5737c	https://irs2.4sqi.net/img/general/	/l9UdGGevddtOhDk6scQjcy1-TbVBX-wf8Gf56jBIRIg.jpg	public	bobjotruck
5199097e498ea36447e54093	https://irs1.4sqi.net/img/general/	/40899881_hbjUdavpBfT-sLaBhv3pbZydT1tgs9v-Maw12j9I3Xs.jpg	public	carpedonutnyc
4e00e61aa12db1129557e99c	https://irs0.4sqi.net/img/general/	/WSUNYIB0YFVRCTXB13UCRCTANZUG0DO0X2FWCUYYILU4TCGB.jpg	public	kimchitruck
5197fe76498e1c056c96d21b	https://irs1.4sqi.net/img/general/	/117715_m462oAqyqBN12xyWCOyzYR6-1gtYrUa8BiX9r9OybE8.jpg	public	kimchitruck
4e3da652d4c058f9dc087a6c	https://irs2.4sqi.net/img/general/	/QEOIS2W35WLTHYK00QC04LKKX4X1SYW3DDI45X30HSKTJENQ.jpg	public	kimchitruck
501975c5e4b092f6a51ef338	https://irs2.4sqi.net/img/general/	/bI7RrGcK_moyn-kJICa1OCciBVuYYykwCMGlea6mcxg.jpg	public	kimchitruck
50f99bcee4b08ca132377f78	https://irs3.4sqi.net/img/general/	/4611139_CEH3eveI6uxlRVQLet5Fpa_sNfJwAzfheMTYSBplO5Q.jpg	public	thecrepestruck
4fd0f054e4b0757383b97c0f	https://irs0.4sqi.net/img/general/	/MbR1inb3VKXu0PQMsCkHkHGftYq0E8CDbYG3BLRRGaE.jpg	public	thecrepestruck
50883301e4b0904987088a20	https://irs3.4sqi.net/img/general/	/2361939_J2zcgauqqGFC_PZPyvkfEDoSufdDe5qE7gi_NkS1P1U.jpg	public	mactruckny
519bb23b498e208a0b81b7fa	https://irs1.4sqi.net/img/general/	/9285455_LZiJ4FLH7NOWjNUsXO9jxDRFAgLygBSB8SmSIW0z9kM.jpg	public	mactruckny
5165924de4b093be3bc5cd57	https://irs2.4sqi.net/img/general/	/2159706_uFl3RYgA1z4EiDNp8PtjjG2HHWhTiiXDLNzJtFWPHS8.jpg	public	mactruckny
5151c82de4b024888079c5ea	https://irs0.4sqi.net/img/general/	/5003144_g8kbTzyfr6gL9vIRpMBbXz4TqBUk5EgkqIPlBP9DtsA.jpg	public	mactruckny
520538a611d2b476431ac7f9	https://irs1.4sqi.net/img/general/	/117715_GMdoseCn4baUtTX9kN6_PAAfHaGIlUpjxzAitpqLAOY.jpg	public	chefsamirtruck
5294e76b11d2879d5217bd00	https://irs0.4sqi.net/img/general/	/47558447_v1SwJZbLSZ2etlJXOF9qw4H3vErpdTiVIqXxULSVTSU.jpg	public	chefsamirtruck
5189442c498e765ce62d5924	https://irs3.4sqi.net/img/general/	/2432527_5nUa0fTfy4rzjXpiIUIlkguBa2kdqFSZIG-PLvkKu2Y.jpg	public	chefsamirtruck
4fd0d80de4b062589043211f	https://irs2.4sqi.net/img/general/	/hZjMDK5KKgxjMhmOGBtaRjx_ga0SWHwppqfLfqw20Tg.jpg	public	chefsamirtruck
5086e523e4b02ca59cae7bd4	https://irs3.4sqi.net/img/general/	/2361939_1JvatS0wOUdQQIaTmd4Vmk8bgr7aFYOR7LaMkRio0X8.jpg	public	mausamnyc
513f646ce4b0b1892aaae1bc	https://irs2.4sqi.net/img/general/	/13285510_LmdJLKoCS9fSwm3wy96lcieTczjsLuxAEUnU3FlZDlo.jpg	public	mausamnyc
51194bbae4b0cd237850b223	https://irs1.4sqi.net/img/general/	/793192_FQUO1SFGyLkg5NRz6VUYl3_zmFgfy0Mh8gL1unO8ijM.jpg	public	mausamnyc
507071bfe4b06e882e74b445	https://irs1.4sqi.net/img/general/	/1112203_qnT5k-31-4cRKDz00cUpp7Ia7HG3YTjhsC9Udo90RDI.jpg	public	philssteaks
512bbfebe4b0b8faa466c796	https://irs0.4sqi.net/img/general/	/1425622_4wp7wCuj7Ci1dl_FVH9syKmrJwQavMhL9uqww1b0m1o.jpg	public	philssteaks
527e77d111d2e66fa6a871b3	https://irs3.4sqi.net/img/general/	/649454_HIWthX8nL3SZAOwyMlKj9Y7ju9GCiN4OEV-wZR6IKC0.jpg	public	philssteaks
51645882e4b0bcb0cb0c7ef3	https://irs2.4sqi.net/img/general/	/7511393_dEJJLGO8ljFPMA_kFidoz1wpWZ-k6mHpqYnuRwoBpRg.jpg	public	philssteaks
4fd400ffe4b02d3b87199713	https://irs3.4sqi.net/img/general/	/hxqXK1dS5WiSz4AUwkzvl8s8oy4Y26e1px0MLW4ICuw.jpg	private	waffletruck
527e823311d2db75dd831ee0	https://irs0.4sqi.net/img/general/	/22419482_1rrrm4nhOKXQsXN25ApmVsGDw4t2J3GyjhfeQPEbClU.jpg	public	waffletruck
50e719c2e4b0e263423e547e	https://irs3.4sqi.net/img/general/	/15471_4uN0tddGW5orNGh02xhxbiAOGUpAAy3rIWEotoRgB_M.jpg	public	tacobite
5239ddce11d2ab4765d5cc7f	https://irs3.4sqi.net/img/general/	/5568483_alwOH7sfGU8-pKfLmurfe9rt3pk2G6p90KwFyC6hq1A.jpg	public	sweetchilinyc
5208f543498eaeeaaad3ce52	https://irs2.4sqi.net/img/general/	/15629_P_UAUr_S-OO0R12wNp8LDPwr-ZbfPiWeG0Q0rrjW6Ww.jpg	public	sweetchilinyc
51f4589a498e97316d307dab	https://irs1.4sqi.net/img/general/	/186827_ilvLMlb3AFqgXUQJ43S7IjsLNPxYP3Pw5LEjrqhp6wI.jpg	public	chipsykingny
514e42c7e4b0ec8b7e400875	https://irs3.4sqi.net/img/general/	/48992751_ibL8tx_7JPvV3aQmnEevrdibtLP0jWytaChkCdRuhG8.jpg	public	crafflesnyc
514e42a8e4b0d91e975b3db9	https://irs1.4sqi.net/img/general/	/48992751_womoOVd5bv-2KopmWjWEHA_WsyoWQITjAyXBuM4Ciz8.jpg	public	crafflesnyc
51f15b4d498ee58fec420a7c	https://irs3.4sqi.net/img/general/	/13285510_Q-SBXKFpfroSwQ-QJdezzrh1KaHfHAmLyicy8d5S1jU.jpg	public	parissandwich
5243126c498ea77b19b3a444	https://irs0.4sqi.net/img/general/	/65506790_31Qpx9E-ZjuNve-izmDY6vVxUCMrhgGsnOLn4-fusp4.jpg	public	parissandwich
51b22a0a498ec00d1c45726c	https://irs1.4sqi.net/img/general/	/390807_y2oeK6xR54wk9b1Sfm82Ek09Auv2lNkRTpJOzos3xjU.jpg	public	parissandwich
5280c18811d2e4df572063db	https://irs0.4sqi.net/img/general/	/5354893_5EtQmcwzMnTRFz9qbxjkt9FguCAC4xfW5xwUCyYIrbQ.jpg	public	waffletruck
522245cd498e08037d275e1a	https://irs0.4sqi.net/img/general/	/1290097_g0wekB0Kkci5H6u618gI7WxvHlKAan1kUpaRIuTl2IM.jpg	private	waffletruck
51f2be1f498e71235db5b61b	https://irs3.4sqi.net/img/general/	/117715_mGfGU0UGjUMhgqgwrDPf2f44NZtfMrobqJMF8ahsrjY.jpg	public	sweetchilinyc
\.


--
-- Data for Name: trucks; Type: TABLE DATA; Schema: public; Owner: pepp
--

COPY trucks (id, name, twitname, weburl, tweet, street, location, retweeted, region, regex, lasttweet, lastupdate, type, about, foursquare, matcher) FROM stdin;
mikenwillie	Mike n Willie's	mikenwillies	http://www.mikenwillies.com	TGIF 47th Street & Park tacos sliders burritos comegetsome	47	 47th Street & Park 	f	up	\N	1391441407	1391182169	TexMex		4f205f0ee4b0294b35a1178b	\N
goburger	GO Burger	goburger	http://www.goburger.com	We're on 88th and Broadway for dinner tonight!	88	 88th and Broad	f	up	\N	1390587467	1389390276	American		4c06b3eccf8c76b0a4eb3a65	\N
lobstertruck	Red Hook Lobster	lobstertruckny	http://redhooklobster.com/	Happy Chinese New Year, Year of the Lobster! CrustacianCelebration for lunch! Big Red will be docked at 46th&6th Avenue today.	46	 46th & 6th Aven	f	up	\N	1391525726	1391180103	\N		4dc597c57d8b14fb462ed076	\N
mexicue	Mexicue	mexicue	http://mexicueny.com	Starret Lehigh...back at it today...a little snow never hurt anyone.	Starret Lehigh	Starret Lehigh	f	none	\N	1391531905	1391531905	Mexican		4c51a6a71c67ef3ba6b61ab9	\N
lagringa	La Gringa	lagringatruck	http://gringataqueria.com/welcome/	La gringa food truck @ 51st&park ave till 4pm come beat the cold with a 1 1/2 pound burrito tacos 3 for $10 nachos and much more see you	51	 51st & park ave 	f	up	\N	1391511828	1391511828	Mexican	\N		
eddiespizza	Eddie's Pizza	eddiespizzany	http://www.eddiespizzany.com/	Varick and king today until 3pm	Varick	Varick and king 	f	none	\N	1391438964	1391179419	Pizza		4c0cf412b4c6d13ae4850c30	\N
elpaso	El Paso Truck	elpasotruck	http://elpasony.com/	\N	\N	\N	\N	\N	\N	1390251431	\N	Mexican	\N	523c911f04937624937304c5	\N
yougotsmoked	You Got Smoked	yougotsmoked	http://yougotsmoked.com/	\N	\N	\N	\N	\N	\N	1391042241	\N	BBQ Mexican	\N	52b1d83a498e60c55497bea0	\N
sweetery	Sweetery	sweeterynyc	http://sweeterynyc.com	Oh Hudson/KIng St. how we love to play with you. We're out here playing in the snow, waiting and hoping that you will come play with us too.	none	 Hudson / KIng St  	f	none	\N	1391524020	1391439559	Sweets		4a28d919f964a52056951fe3	\N
mamak	Mamak	lovemamak	http://www.lovemamak.com/	We are at 7 Hanover square & everyone can order delivery service tru seamless web if it is too messy to get out from office!	Hanover	Hanover square	f	none	\N	1391455436	1390321357	Asian		51c4cffa498ec876f564a0b4	\N
snowday	Snowday	snowdaytruck	http://snowdayfoodtruck.com/	\N	\N	\N	\N	\N	\N	1391462062	\N	Comfort	\N		\N
shortys	Shortys	shortysnyc	http://www.shortysnyc.com	Super Bowl Sunday @ Shorty's. 576 9th Ave / 66 Madison ave/ 62 Pearl St http://t.co/Of6Wcd6TGb	66	 576 9th Ave / 66 Mad	f	up	\N	1391535746	1391375412	American		4faea2cce4b08a88c5dc5d05	\N
hh3	Habachi Heaven 3	hibachiheaven	http://www.hibachiheaven.com/	@midtownlunch HH3 is on 46st & 6 ave. HH2 is on Park Ave & 33st. Word of the day is "Peyton for ur free upgrade. midtown get ur YumYum	46	 46st & 6 ave  	f	up	\N	1391179137	1391179137	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	hh3
mamuthai	Mamu Thai Noodle	mamuthainoodle	https://www.facebook.com/MamuThaiNoodle	Sorry FiDi & WFC, no truck today. Stay warm!	WFC	WFC	f	none	\N	1391435761	1391435761	Thai		5126a10ae4b0af674c85f353	\N
hh2	Habachi Heaven 2	hibachiheaven	http://www.hibachiheaven.com/	@midtownlunch HH3 is on 46st & 6 ave. HH2 is on Park Ave & 33st. Word of the day is "Peyton for ur free upgrade. midtown get ur YumYum	46	 46st & 6 ave  	f	up	\N	1391179137	1391179137	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	hh2
schnitzelcart	Schnitzel & Things Cart	schnitznthings	http://schnitzelandthings.com	The cart will be on 55th & broadway from 11:00-2pm. We missed you last week, so we hope that you'll come get some schnitz today:) see ya!	55	 55th & broad	f	up	\N	1391534837	1391525558	German	\N	4a6640b3f964a5204cc81fe3	(schnitzcart|the cart)
mrnice	Mr Nice Guy	mrniceguytruck	http://mrniceguynyc.com	SliderWingNation. by @dyckmanbar "Super Bowl live at DB SUN 2/2 mrniceguytruck on site for those... http://t.co/AaLfKazsyG	none	 2 / 2 	f	none	\N	1391274349	1390242002	American		520bbbb211d26afae232ec59	\N
itizy	Itizy Ice Cream	itizyicecream	http://www.itizy.com/	Likely our last three hours at Columbia this year! Come grab a scoop of your favorite flavor before it runs out!	none	Columbia	f	none	\N	1382307419	1382122482	Sweets		4fcbdcaae4b00a0e855124dd	\N
seoul	Seoul Food	seoulfoodnyc	http://www.seoulfoodnyc.com	Holla Back!! We are On 51st between Park and Madison!	51	 51st between Park and Mad	f	up	\N	1391523816	1391523816	Asian		4e74afad88775d593d9a7eb5	\N
carls	Carl's Steaks	carlssteaks	http://carlssteaks.com/home/	RT @dumbolot: We got @sweetchilinyc @KimchiTruck and @carlssteaks doing their dumbolot thang today!	dumbo	dumbolot	t	bkl	\N	1391528709	1391528709	American		51a78330498e3fc1f22d771e	\N
blend	Blend	blend_express	http://blen02.wix.com/blendnyc	We will not be parking on HUDSON and KING anymore ....   Hopefully only at least for this year	none	 parking on HUDSON and KING an	f	none	\N	1383317024	1383316855	Latin Fusion		4fa94528e4b0f8fbf13317e6	\N
getstuffed	Momos & Buns	getstuffednow	http://www.chinesemirch.com	snowdayNYC we will freeze our buns 2 bring u the buns u love @BKBazaar ! Its a date at 7pm!	none	 2 bring u the buns u love @BKBazaar ! Its a date at 7	f	none	\N	1391529630	1388785130	Chinese Fusion		4fa016cbe4b05d0fc11262c5	\N
steaksncrepes	Steaks N Crepes	steaksncrepes	http://steaksncrepes.com	50 st bet 6 & 7 ave for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	50	50 st bet 6 & 7 ave for lu	f	up	\N	1374766188	1374766188	American		50f44167e4b0af5bf46321ce	\N
gorilla2	Gorilla Cheese 2	gcnyc1	http://t.co/4ZDqfwSH5f	G1- 7 Hanover Square  fidi\nG2- 26 11/12 starrettlehigh	26	 26 11 / 12 sta	f	mid	g2(.*?)(\\n|$|#)	1391101632	1391015203	American		4dc2d3e352b1c1fb37f1e945	\N
neapolitan	Neapolitan Express	neaexpress	http://neapolitanexpress.com/	New Location! We are now on 8th ave between 35th and 36th	35	 8th ave between 35th and 36th	f	up	\N	1391533642	1391103710	Pizza		51c8864c498e0ac96c14433e	\N
grillwheels	Grill On Wheels	grillonwheelsny	#	Grill on Wheels is in Midtown! Parked on 47th off Park Ave today! schnitzel crazy chickensausage	47	 47th off Park Ave 	f	up	\N	1391528519	1391528519	Kosher		51b0bf31498e9b68db75612c	\N
domo	Domo Taco	domotaco	http://www.domotaco.com	New menu item today on 55th and broadway...Tonkatsu curry rice!  madefromscratch realcurry notcurryroux	55	 55th and broad	f	up	\N	1391531626	1391517495	Asian Fusion		4ed90a2e77c8274efb746d83	\N
wingit	Wing'n It	wingnitnyc	http://www.wingnitnyc.com/	Out here on 23rd and 5th come and grab some wings for lunch today. We will be open from 10am to 3pm. See you guys at lunch.	23	 23rd and 5th 	f	mid	\N	1390923947	1387549355	American		519ffd2b498ededbeef3c073	\N
morris	Morris Grilled Cheese	morristruck	http://morrisgrilledcheese.com/	No @BrookfieldPLNY lot today, sorry folks! seeyounextweek	brookfieldplny	brookfieldplny	f	none	\N	1391441991	1390581560	American		4e0e0b3caeb7a5b33ee5dac1	\N
valduccis	Valduccis	valduccis	http://valduccis.com	RT @SweeteryNYC: Oh Hudson/KIng St. how we love to play with you. We're out here playing in the snow, waiting and hoping that you will come...	none	 Hudson / KIng St  	t	none	\N	1391534317	1391441934	Pizza		4df7e1aad4c02ad734170b21	\N
palenque	Palenque	palenquefood	http://www.palenquehomemadecolombianfood.com	Hello New Yorkers Today Ur favorite food truck is parked @ WFC South... Come enjoy our lovely Hot Soups & Ur Favorite Paisa Arepas...	WFC	WFC	f	none	\N	1391527370	1391527370	Colombian Fusion		4e84f424dab45bbd2617dc62	\N
korilla	Korilla BBQ	korillabbq	http://korillabbq.com	Catch us for lunch today at SoHo's Varick & Vandam	Varick	 Varick & Vandam	f	none	\N	1391524253	1391524253	Korean Fusion		4cc701aa01fb236ab070baba	\N
toum	Toum NYC	toumnyc	https://www.facebook.com/ToumNYC	Hellooo MidtownWest! We've missed feeding you! Come on by to 46th btwn 5th & 6th for a delicious beef kabab! yummy http://t.co/5iQXoj2n9w	46	 46th btwn 5th & 6th 	f	up	\N	1391523315	1391523315	Lebanese		500eedb0e4b062ee00577957	\N
biandang	Bian Dang	biandangnyc	http://www.biandangnyc.com/	53rd and park! taiwanese biandang nyc foodtruck	53	53rd and park	f	up	\N	1391526805	1391526805	Taiwanese		4d712874722ef04d04160d9c	\N
taim	Taim Mobile	taimmobile	http://www.taimmobile.com/	Butternut Squash is the soup du...how do you say last soup of the season? Get yours now on Varick/Vandam	Varick	 Varick / Vandam	f	none	\N	1387809097	1387556931	Mediterranean		4cf2c5321d18a143951b5cec	\N
dels	Del's	delsnyc	http://instagram.com/delsnyc	RT @DUMBOFoodTrucks: You may have seen the @delsnyc truck around DUMBO this summer - help them raise $ for another one on @kickstarter! htt...	DUMBO	Dumbo	t	bkl	\N	1384186749	1383928941	Sweets		519bb56b498ed2dfa950ace2	\N
brooklynpopcorn	Brooklyn Popcorn	brooklynpopcorn	http://brooklynpopcorn.com/	RT @InfiniteMidnite: Enter to Win a $20 E-Gift Card to Shop at @BrooklynPopcorn on @TwoClassyChics Blog Ends 2/04 Giveaways ad http://t.c...	none	 2 / 04 	t	none	\N	1391441819	1390878370	Popcorn!		514a0737e4b09c3e77279d83	\N
phils0	Phil's Steaks Big Jawn	philssteaks	http://www.philssteaks.com/	It's Phil's Phriday! \nOG Jawn: 51st n Park\nBig Jawn: 41st btw 6th n 7th\nGet Your Phil!	41	 41st btw 6th n 7th 	f	up	big( jawn)?( in|:| ?-| is on| on) (.*?)(\\n|$|!|\\.)	1391524574	1387554094	American		4f15b382e4b0725660ea9f31	\N
milktruck	Milk Truck	milktrucknyc	http://www.milktrucknyc.com	Bessie's at 25th & Park, call (646) 504-6455 to pre-order or http://t.co/IwkqcCHPzF. Sandwich menu always at @houstonhallnyc	25	 25th & Park  	f	mid	\N	1391526059	1391526059	American		4e823c0229c2dbb2b7043972	\N
mooshu	Moo Shu	mooshugrill	http://www.mooshugrill.com	"@DomoTaco: New menu item today on 55th and broadway...Tonkatsu curry rice!  madefromscratch realcurry notcurryroux" hey wanna trade?	55	 55th and broad	f	up	\N	1391522827	1391522827	Chinese	Moo Shu grill is a slight twist on typical Chinese <a href="https://en.wikipedia.org/wiki/Moo_shu" target="_blank">moo shu</a> The three Moo Shus option is enough for lunch and you can pick and choose a different protein for each. In my opinion the chicken is the best but it is dark meat. </p><p>It's easy to order as there is one window for ordering and for picking up when your name is called.	52090e45498e5500a6bd41fb	\N
gorilla1	Gorilla Cheese 1	gcnyc1	http://www.gorillacheesenyc.com/	G1- 7 Hanover Square  fidi\nG2- 26 11/12 starrettlehigh	Hanover	Hanover Square	f	none	g1(.*?)(\\n|g2)	1391101632	1391015203	American		4dc2d3e352b1c1fb37f1e945	\N
miamifood	Miami Food Machine	miamimachinenyc	http://www.miamifoodmachinenyc.com/	RT @YouGotSmoked: Park Ave btw 33rd St and 32nd St from 11:00 to 3:00 today! New York Aged Cheddar Mac and Cheese! Delicious nyc http://t...	33	 Park Ave btw 33rd St and 32nd 	t	mid	\N	1389964561	1389964561	Mexican		514b53aee4b00c3e98ec25e9	\N
polish	Old Traditional Polish Cuisine	polishcuisine	https://www.facebook.com/pages/Old-Traditional-Polish-Cuisine/315496671902708	We are open on 55th and Broadway with special PACZKI for dessert today! pierogitime @midtownlunch @nystfood @randomfoodtruck	55	 55th and Broad	f	up	\N	1391533255	1391530076	Polish		51435df4e4b0823a398ebc8a	\N
freshhearty	Fresh and Hearty	freshandhearty	http://freshandheartynyc.com/	Get your Soup & Panini on with Fresh and Hearty! We parked on 46st btw 5th & 6th ave from 11am to 3pm. Call now 4 free delivery! @3474402467	46	 46st btw 5th & 6th 	f	up	\N	1390493878	1390493878	Soup/Salad/Sandwich		51801f7a90e7374e46b6239f	\N
toastmonster	Toast Monster	toastmonsternyc	http://www.toastmonsternyc.com/	Hello Rice bowl fans. Have your beef or chicken teriyaki rice bowl with a miso soup for only $8!! stopplaying notplaying forreal 50th/6th	50	 50th / 6th	f	up	\N	1390576702	1386864511	American		50ad1829e4b087613d696bc4	\N
greenradish	The Green Radish	thegreenradish1	http://www.thegreenradish.com/	RT @nycfoodtruck: Who says this weather & food trucks don't mix? Catch 30, incl. @thegreenradish1, at the winterblast 1/30-2/1! http://t.c...	none	 30  incl  @thegreenradish1  at the winterblast 1/ /1	t	none	\N	1391445302	1390853812	Vegan		5229feab11d2edde794d385c	\N
schnitzel	Schnitzel & Things	schnitznthings	http://schnitzelandthings.com	We are back:)! The truck will be on 52nd b/w 6th & 7th aves from 11:30-2pm. We've missed you. Schnitzification in full effect!	52	 52nd b / w 6th & 7th ave	f	up		1391534837	1391525431	German		4a6640b3f964a5204cc81fe3	(schnitztruck|the truck)
bigds	Big D's	bigdsgrub	http://bigdsgrub.com/	It's TacoTuesday at @BrookfieldPLNY today! Vesey Street and North End Avenue, 11a-2:30p. Preorder for pickup by calling 646-543-BIGD WFC	WFC	WFC - Brookfield 	f	none	\N	1391534152	1391520357	Korean Fusion		4c968b907605199c2eaec2a3	\N
cinnamonsnail	The Cinnamon Snail	veganlunchtruck	http://www.cinnamonsnail.com/	At its hight the line was 1 1/2 blocks long. Thanks for the love NYC!\n\nMT @kmexvx: So many people queuing in the rain http://t.co/019Fhw8WPv	none	 1 1 / 2 	f	none	\N	1391196668	1387826665	Vegan		4c263af6a852c9287537e66c	\N
steelcart	The Steel Cart	thesteelcart	http://www.thesteelcart.com/	Snowed in Brooklyn. Jay & Front through lunch. Spicy Chicken Chili & Mushroom Barley Soup on board.	Jay & Front	 Jay & Front 	f	bkl	\N	1391537144	1391526159	French		511d3abee4b0e188895f3697	\N
frites	Frites 'N Meats	fritesnmeats	http://www.fritesnmeats.com/	Hello FIDI, lunch today @ 10 Hanover sq b/t water st & pearl st. Burger of the week THE CHEVRE TRUFFLE BURGER preorder 9172929226	Hanover	 10 Hanover sq b / t water st & pearl st  	f	none	\N	1391526854	1391526854	American	This is a good burger but this truck is interesting because of the many toppings they carry and their burger of the week. 	4ae9d217f964a520bcb621e3	\N
rickshaw	Rickshaw Truck	rickshawtruck	http://www.rickshawdumplings.com/	Starrett! You are in luck! Danny is on his way to make your dumpling day! 26+11av	26	 26 + 11av	f	mid	\N	1386710979	1384441694	Asian		43fc8419f964a520ed2f1fe3	\N
funbuns	Fun Buns	funbunsnyc	http://j24f.com/funbuns/	RT @FoodtoEat: Today's answer to 12DaysofFoodTrucks is @funbunsnyc ! Thx to all those who played and tune in Monday 12/23 for the LAST day!	12	 12 / 23 	t	mid	\N	1391455990	1387576969	Asian		4f8d9663e4b021137aa2bdde	\N
pocketful	The Pocketful	thepocketful	http://thepocketful.com/	Located in. 52nd between 6th and 7th. Free delivery at http://t.co/6h7IrKccpj	52	 52nd between 6th and 7th  	f	up	\N	1390573368	1389971810	Mediterranean		4db8bcd790a0e3f61d601888	\N
lukeslobster	Luke's Lobster	nautimobile	http://lukeslobster.com/	46th and park today, then we are in Nj for Super Bowl festivities for the rest of the week!	46	46th and park   	f	up	\N	1391272495	1391007328	Seafood		4dc81239b0fb5556cd2f3023	\N
kimchitaco	Kimchi Taco	kimchitruck	http://kimchitacotruck.com/	RT @dumbolot: We got @sweetchilinyc @KimchiTruck and @carlssteaks doing their dumbolot thang today!	dumbo	dumbolot	t	bkl	\N	1391529760	1391529760	Korean Fusion		4d6ee122b45b59417c6a6778	\N
wafelKastaar	Wafels & Dinges Kastaar	waffletruck	http://www.wafelsanddinges.com/	Momma Truck is at the BudLightHotel Kastaar is at 40th & Park Ave till 4:30p	40	 40th & Park Ave 	f	up	kastaar( truck)? (.*?)(all day|till?|until|\\n)	1391441209	1391182320	Belgian		4a416369f964a52036a51fe3	\N
phils3	Phil's Steaks	philssteaks	http://www.philssteaks.com	Midtown West is still a super mess so we're on 48th and Park this morn. Breakfast til 11. Lunch til 2	48	 48th and Park 	f	up		1391524574	1391524574	American		4f15b382e4b0725660ea9f31	\N
shanghai	Shanghai Sogo	shanghaisogo	http://www.shanghaisogo.com/	RT @USAFoodTruck: Hey everyone.  Weather is turning bad but were at 22nd and 5th in Flatiron for our last day in a while. isitsspringyet?	22	 22nd and 5th 	t	mid	\N	1391534951	1391534951	Asian		5258369d498e13def2bef2cb	\N
treats	The Treats Truck	thetreatstruck	http://www.treatstruck.com	!!! Tues, Feb 4th Hey 45thers! Since we missed seeing you last week, we're here today!!!12-3:30 45th & 6th!!!	45	 45th & 6th	f	up	\N	1391529216	1391529216	Sweets		49e65021f964a52035641fe3	\N
disos	DiSO's	disosnyc	http://www.disosnyc.com/	Disos at our Tuesday spot, 48th between 6 and 7 ave\n\nCall in your orders here: 917-756-4145	48	 48th between 6 and 7 	f	up	\N	1391531687	1391520874	Italian Sandwiches	These might be typical italian sandwiches but the ingredients are high quality. You need to get there early because the line can get long and they will run out of some breads. I believe the focaccia half is a normal portion for lunch while their half and hero sizes are pretty big.	519523d6498eeaa6200aad03	\N
burgersn	Trusty Burgers & Bites	burgersandbites	http://www.burgersandbites.com/	Hello again twitter friends! Chelsea lets do breakfast and lunch w. 30 and 11th!	11	 30 and 11th	f	mid	\N	1391529602	1391519534	American		5170143a498e802b42628e48	\N
mexicoblvd	Mexico Blvd.	mexicoblvd	http://mexicoblvd.com	Buenos Dias! Parked and ready to go at 46th between 6th & 7th!! tacotime	46	 46th between 6th & 7th	f	up	\N	1391531352	1391531352	Mexican		4f4e55aee4b04c96fba5b149	\N
nuchas	Nuchas	nuchasnyc	http://www.nuchas.com	RT @NYNJSuperBowl: SBBLVD is now officially open on Broadway between 34th & 47th streets! http://t.co/VUawW6JM8e	34	 Broadway between 34th & 47th 	t	up	\N	1391469042	1391019274	Mexican		4ebd2a9bb8f7b504a754c130	\N
bobjo	BobJo	bobjotruck	http://www.bobjo.net	Hello,ny! \nWe are open at downtown today. \nLocated in Water st&Hanover sq.\nTry our ramen noodle and rice platter with fresh cook dumpling!	Hanover	 Water st & Hanover 	f	none	\N	1391531220	1391531129	\N		4e3add0c88772c3bf12772da	\N
carpedonut	Carpe Donut	carpedonutnyc	http://carpedonutnyc.com/	Come by 55th and Broadway for some hot donuts, hot coffee, and hot cider! Or brave the cold without something to warm you up. Your choice.	55	 55th and Broad	f	up	\N	1391361854	1391173993	Sweets	They only server one kind of donut here, the apple cider, but it's a pretty good one. They are fresh and still hot when you get them. They have donut ice cream sandwiches but you should know the entire thing is in the freezer so you will get a frozen donut as well.	5169892c498e0522481eea97	\N
crepestruck	Crepes Truck	thecrepestruck	https://www.facebook.com/thecrepestruck	VictoriaJustice at Uggs Aulstralia on Madison Ave & 58 Street tonight from 6:30pm-8pm	58	 Madison Ave & 58 Str	f	up	\N	1391084755	1383866974	Crepes		4dfb854918386e743d9869e3	\N
mactruck	MacTruck	mactruckny	http://MacTruckNYC.com	Park ave between 27/28 for lunch	27	Park ave between 27 / 28 	f	mid	\N	1389991894	1389976473	American	Looking to take a nap after lunch? This truck is great and the owner is incredibly friendly. Feel free to chat it up while you watch him prepare your food.  Not listed on the menu are the many condiments\\n you can get on your macaroni. The regular size is a good portion for a normal lunch.	50575ab8e4b04ed4f2197dac	\N
chefsamir	Comme Ci, Comme Ca	chefsamirtruck	http://www.chefsamirtruck.com	We are on 36st and broadway!!	36	 36st and broad	f	up	\N	1391532782	1391532782	Moroccan		4c3c85e3a9509c74b52e395b	\N
mausam	Mausam	mausamnyc	http://www.mausamnyc.com	beautiful sunny day! Curry N Bites Bway bet 55 & 56str. Come get yr favourite fresh lunch plattersall served with samosa and parata	55	 Bway bet 55 & 56st	f	up	\N	1391518041	1391518041	Indian		50730eebe4b0f3224431dc5d	\N
phils1	Phil's Steaks Lil Jawn	philssteaks	http://www.philssteaks.com	2 jawns out today!\\n\\nBig Jawn - 41st btw 6th n B'Way til 2. \\n\\nLil Jawn - North End Ave n Vesey St til 2.	Vesey	 North End Ave n Vesey St 	f	none	lil jawn( in|:| -) (.*?)(\\n|$)	1391524574	1383670328	American		4f15b382e4b0725660ea9f31	\N
tacobite	Taco Bite	tacobite	http://www.tacobite.com/	Today Serving Lunch on\n47th st\nBet Park/Lexington Av. \nCall in advance for\npick-up\n@ 347-70T-Bite	47	 47th st Bet Park / Lex	f	up	\N	1391452866	1389801699	Mexican		503ba49ae4b0fad35eb7a8dc	\N
sweetchili	Sweet Chili	sweetchilinyc	http://sweetchilinyc.com/	RT @dumbolot: We got @sweetchilinyc @KimchiTruck and @carlssteaks doing their dumbolot thang today!	dumbo	dumbolot	t	bkl	\N	1391528708	1391528708	Asian		51a8c802498e2165ca855a19	\N
chipsy	Chipsy King	chipsykingny	http://chipsykingny.com/	TGIF!!! Kasar truck is at Broadway and 55th street all day until 8pm. Join us	55	 Broadway and 55th str	f	up	\N	1391277498	1390574849	Fries		51bb5c43498ee06e13d0d31f	\N
craffels	Craffles	crafflesnyc	http://www.craffles.com/	Happy holidays!!!\nMake ur holidays sweet with our delicious crepe or waffles. Our location for today. Hunter college and union square.	none	union sq	f	none	\N	1389385233	1388428190	Crepes		514e426ce4b05bcb261d910e	\N
paris	Paris Sandwich	parissandwich	http://www.parissandwiches.com/	Dumbo! Adams and front street today dumbofoodtrucks @DUMBOFoodTrucks	none	 Adams and front str	f	none	\N	1389895042	1382711724	French/Vietnamese		519e4ed0498e4f27e64c177a	\N
wafelMomma	Wafels & Dinges Momma	waffletruck	http://www.wafelsanddinges.com/	Momma Truck is at the BudLightHotel Kastaar is at 40th & Park Ave till 4:30p	40	 40th & Park Ave 	f	up	momma( truck)? (.*?)(all day|till?|until|\\n|!)	1391441209	1391103662	Belgian		4a416369f964a52036a51fe3	
\.


--
-- Data for Name: tweets; Type: TABLE DATA; Schema: public; Owner: pepp
--

COPY tweets (contents, "time", id, retweeted, twitname) FROM stdin;
#TGIF 47th Street &amp; Park #tacos #sliders #burritos #comegetsome	1391182169	429275247515541504	f	mikenwillies
@spaceywaceyjflo @ZaraAhmadPost Glad you like the new menu!  #comegetsome	1391114998	428993512223539200	f	mikenwillies
RT @spaceywaceyjflo: @mikenwillies @ZaraAhmadPost and I love that all of our favourite items are now officially official! http://t.co/oXejm...	1391114201	428990170579632128	f	mikenwillies
@ohlivvyuh We appreciate it and glad you enjoyed!!\n@#comegetsome	1391108649	428966882415484928	f	mikenwillies
RT @ohlivvyuh: Another Successful Food Truck Thursday! @nycfoodtruck @mikenwillies @hibachiheaven  The office relies on me to get food truc...	1391108595	428966658494193664	f	mikenwillies
New Menu...same delish food!  #comegetsome http://t.co/qamTOZiPi9	1391095391	428911277155840000	f	mikenwillies
Favorite Spot today 56th Street &amp; Broadway warm up with our delicious #tacos #sliders #burritos #comegetsome @randomfoodtrucks	1391095039	428909797724139520	f	mikenwillies
Happy taco Tuesday Midtown!!! 46th St . Btwn 5th &amp; 6th Ave #Tacos #Sliders #Burritos #comegetsome have you tried... http://t.co/US6AwCIGtp	1390924318	428193744391659521	f	mikenwillies
TGIF!!! End the week with the right meal 47th St. &amp;  Park Ave  #Tacos #Burritos #Sliders #Ricebowls #comegetsome	1390578181	426741940881588224	f	mikenwillies
RT @cammcm: @mikenwillies Can my Super Bowl dreams get a #RT    http://t.co/XUwm2u53nK	1390577783	426740271804866561	f	mikenwillies
Last day at the @javitscenter for the @ahrexpo today. tomorrow back to 47th St. &amp; Park Ave  #comegetsome #staywarm	1390492365	426382002124640256	f	mikenwillies
RT @villadh: Yo @cpow56 check out @mikenwillies if you are at @javitscenter today through Thursday for @ahrexpo	1390320489	425661102241116160	f	mikenwillies
We're at @javitscenter today through Thursday for @ahrexpo #comegetsome	1390318126	425651191595278336	f	mikenwillies
RT @NYClifeyy: @mikenwillies beatiful food!! Highly recommended :)	1390152762	424957604025335808	f	mikenwillies
TGIF!!! End the week right 47th &amp; Park Ave #Tacos #Sliders #Burritos #Ricebowls #comegetsome	1389979256	424229864556613632	f	mikenwillies
RT @ohlivvyuh: Happiest girl in the world. @mactruckny and @mikenwillies for lunch! Supporting small and mobile business is fun! @nycfoodtr...	1389899246	423894280248500224	f	mikenwillies
RT @spaceywaceyjflo: @mikenwillies Hear, hear!!  "@ZaraAhmadPost: Mike n Willies! The best food truck and the best dudes. http://t.co/bh2tt...	1389899243	423894266902228993	f	mikenwillies
RT @randomfoodtruck: Food truck party! @lobstertruckny @CarpeDonutNYC @mactruckny @PolishCuisine @mikenwillies @TheSteelCart	1389887445	423844781970948096	f	mikenwillies
Our favorite spot &amp; customers 56th Street &amp; Broadway #comegetsome #tacos #sliders #burittos @randomfoodtruck	1389884602	423832859418574848	f	mikenwillies
RT @davidbivins: @mikenwillies are the spot for lunch at #NRF14 ! Check them out in the truck outside Javits 4 sliders and tacos!	1389734494	423203258262650880	f	mikenwillies
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
Is it time to have a burger yet? Yes, always yes. We're on 27th and Park for those that want to indulge in their good habits.	1388421772	417697305433632768	f	goburger
Hey folks, we moved to 76th and Broadway!	1388181396	416689095872901120	f	goburger
@starrett601 28th and 11th!	1388163198	416612767983218688	f	goburger
@stevenshawnyc for the next few hours until we leave to stock up for dinner service!	1388160796	416602692153540608	f	goburger
@starrett601 @stevenshawnyc head's up. We're in the hood!	1388160600	416601871529562112	f	goburger
We're on 28th and 11th!	1388160559	416601698841686016	f	goburger
Happy Chinese New Year, Year of the Lobster! #CrustacianCelebration for lunch! Big Red will be docked at 46th&amp;6th Avenue today.	1391180103	429266584155463680	f	lobstertruckny
It feels as cold as Maine outside, doesn't that just make you crave lobster? #BigRedLobsterTruck is at 55th&amp;Broadway for your lunch!	1391101507	428936929523290112	f	lobstertruckny
Today #BigRed with be serving yummy lobster at 55th&amp;Broadway!  #crustacianelation!	1391093705	428904204405841920	f	lobstertruckny
Tonight #lobsta dinner special $20 w/ potato salad, coleslaw and corn @Redhooklobster. Come see our lobsterettes here till 7:00. Butta on us	1391025213	428616928417284096	f	lobstertruckny
#bigred is kickin it on 47th between Park &amp; 3rd. #lobsterforlunch! Drop business card for chance 2 win #freelobsterroll. #crustaceanelation	1391007307	428541822223523840	f	lobstertruckny
@mineisforever @redhooklobster still looking for parking. Superbowl XLVIII excitement is holding us up, #LOBSTER shall prevail. #staytuned	1391004911	428531773606494208	f	lobstertruckny
TOO cold for the lady #bigred  but come see us at the POUND in #redhook 12-7. \n#clawsup	1390920920	428179490234449920	f	lobstertruckny
we spread #LOBSTERLOVE. like us on FB &amp; sign up 4 emails http://t.co/JRG1Oh8Nes 2 win FREE HOOK-UP (lobsterroll-chips-drink) drawing friday	1390841764	427847488390041600	f	lobstertruckny
Our #lobstermen r off today! b the star of ur #superbowl party w/ DIY #LOBSTERroll kit, 8 rolls=$125, bringing #superbowl food up a notch	1390834528	427817134761463808	f	lobstertruckny
@iamvhinasyhah as soon as the new year approached, Jan 2 !!	1387599623	414248961357414400	f	lovemamak
LOBSTER MAC n CHEESE @celebrateREDHOOK #fairway 480 Van Brunt till 3. #besthood #represent #crustaceanelation #clawsup	1390752120	427471493321482240	f	lobstertruckny
CELEBRATE RED HOOK @fairway 480 Van Brunt #redhook #lobster #fun #sun-well, heated tent. \n@bkflea N5 &amp; wythe 10-6 @redhooklobster noon-7	1390748125	427454734212300800	f	lobstertruckny
Chilling #celebrateredhook @fairway 480 VanBrunt till 3. #bkflea N5 &amp; Wythe till 6. at the LB @redhooklobster 12-8. #lobsterBLT #clamchowder	1390665308	427107375024447488	f	lobstertruckny
#bigred is kicking it @celebrateREDHOOK today @Faiway 480 Van Brunt 11-3 #besthood #clawsup @bkflea N5 &amp; Wythe 10-6 @redhooklobster 12-8	1390661707	427092271448985600	f	lobstertruckny
NEW YORK CITY!! come get yo #lobster on at 46th &amp; 6th. Warm #CT roll w/ lemon &amp; butter please,  a side of #clamchowder &amp; some #macncheese	1390575352	426730075141464064	f	lobstertruckny
Closing at 6pm Tonight.	1390515951	426480929440542720	f	lobstertruckny
WIN #hookup (lobster roll, chips, soda)its easy, like us on FB &amp; subscribe to our email list on http://t.co/JRG1Oh8Nes. drawing every month!	1390509360	426453281523904512	f	lobstertruckny
Too much snow for the lady #bigred today. Our #lobster condolences. But come check us in #redhook noon-8. #clawsup	1390488917	426367539183378432	f	lobstertruckny
the #pound in #redhook is closing at 5pm tonight. Come early for $20 #lobsterdinner and warm #clamchowder #lobsterMacnCheese	1390416302	426062968464613378	f	lobstertruckny
#bigred is sledding today BUT $20 #lobsterdinner TONIGHT in #redhook @redhooklobster \nCOME  get it. #crustaceanelation #clawsup	1390412924	426048802165096448	f	lobstertruckny
#BIGRED is staying warm inside today! We are open in #redhook at noon! Enjoy the snow. #crustaceanelation #clawsup #chowdason	1390402520	426005162071977984	f	lobstertruckny
RT @DispatchNY: See you for lunch! @BrookfieldPlNY NORTH Lot | North End Ave. &amp; Vesey St. | 11a-3pm | @MorrisTruck @ToumNYC @Schnitznthings...	1391184038	429283087223365632	f	schnitznthings
Morning everyone:) the #schnitzcart will be on 49th between 6th &amp; 7th slinging delicious discs of meat;)! Hope to see you guys. 11:00-2pm	1391180968	429270209409847296	f	schnitznthings
RT @JoseSPiano: A TV producer just recognized me from the @schnitznthings episode of @EatStTweet while I was at @BleeckerStPizza #andywarho...	1391180861	429269762842312705	f	schnitznthings
RT @BrookfieldPLNY: Food trucks return tomorrow! @morristruck @toumnyc &amp; @schnitznthings at N. End &amp; Vesey. And @ESTacoTruck at S. End &amp; Li...	1391112967	428984992640024576	f	schnitznthings
Thanks to @starrett601 for having us. We hope you enjoyed the food! We'd love to come back:)	1391111365	428978274182909952	f	schnitznthings
Hey guys if you want to preorder from the truck please call 202-538-3906 sorry for the inconvenience. This is for our 51st street peeps	1391097485	428920059856437248	f	schnitznthings
51st between park and madison we've missed you! The truck will be there from 11:30-2pm. Come warm up with a schnitz! Preorder 347-772-7341	1391092619	428899648234078208	f	schnitznthings
Morning guys. The #schnitzcart will be @starrett601 #starrettlehigh from 11:00-2pm serving up warm schnitz:) 26th b/w 11th/12th. Hope 2 c u!	1391091587	428895322333798400	f	schnitznthings
RT @starrett601: Visit @schnitznthings out front #starrettlehigh today 9.30am-2pm. @waffletruck returns next Thurs. Food schedule at http:/...	1391088749	428883417300996096	f	schnitznthings
The #schnitztruck will be on 47th street between Park &amp; Lex from 11:30-2pm. We've missed you guys. Come grab some warm schnitz! See ya:)	1391009832	428552413231190016	f	schnitznthings
Morning guys. The cart is back out today on 27th st &amp; Park ave from 11:00-2pm. Warm yourself up with a delicious schnitz:) hope to see you!	1391008796	428548067978387456	f	schnitznthings
@TeeEss unfortunately, I think we'll be closed tomorrow because of the cold. Can't wait for this weather to end. B back next week for sure!	1390850300	427883287135399936	f	schnitznthings
@malanconnelly glad you enjoyed it:)	1390850230	427882997107679233	f	schnitznthings
@malanconnelly hope you came out and enjoyed the food	1390848782	427876920743960576	f	schnitznthings
RT @malanconnelly: .@schnitznthings is outside my office @schnitznthings is outside my office @schnitznthings is outside my office @schnitz...	1390848738	427876739172564993	f	schnitznthings
Morning guys. #schnitztruck will be on Varick and Charlton from 11:30-2pm. Hope to see you guys there.	1390835360	427820625324150784	f	schnitznthings
@MatthewPizzulli next week Matt. This week has been brutally cold :(	1390580853	426753147697397760	f	schnitznthings
Morning everyone! Still a bit cold for us to come out today:( can't wait for this bitter cold to go away. We miss you. Hope 2 b out tomorrow	1390490155	426372730767048704	f	schnitznthings
Good morning guys. The weather is keeping the truck and the cart in today and possibly tomorrow. Hope to be out on Friday. Stay warm!	1390405047	426015763074666496	f	schnitznthings
Good morning guys. The truck and cart are staying in today due to the weather. We hope to be back out tomorrow. Stay warm and dry	1390317667	425649264854056960	f	schnitznthings
Truck is doing a private event today - back out on Monday. Have a good weekend all!	1391185573	429289524057751553	f	mexicue
@AlmostMedia  Sorry we have a private truck event today!	1391185518	429289296328003585	f	mexicue
RT @BCDRestaurants: @mexicue has a sauce that no one else does and it is so delicious! #CrackSauce #BCDStrategic #MustTry	1391182779	429277806863085569	f	mexicue
RT @krosaen: Optimized my NYC morning to stop by @PortsNYC for cup of joe and then @Mexicue for brisket breakfast burrito on the way to @Fo...	1391182768	429277760226619392	f	mexicue
RT @RorySacks: Breakfast. Lunch. Dinner. @mexicue http://t.co/iSSit0Oed0	1391125635	429038129262370816	f	mexicue
@RorySacks love it!!	1391125631	429038112036384769	f	mexicue
Break your Resolution: The Mexicue Steak &amp; Cheese with Smoked Mushrooms &amp; Queso. Come on...you deserve it. http://t.co/EXwC7KyYyb	1391016918	428582135394734080	f	mexicue
Keep your Resolution: Breakfast Huevos Cup with Black Beans &amp; Fresh Pico. Stay strong...we believe in you. http://t.co/6is6KZAw7q	1391016851	428581854921641984	f	mexicue
RT @andymorris: Insane breakfast from @Mexicue! @ #OpenCommunications @ The Firehouse http://t.co/GS7jmNNVAq	1391016786	428581580438011904	f	mexicue
RT @JoshRitt: @Mexicue Green chilli Mac and cheese. A stroke of genius #SuperBowlXLVIII	1390959695	428342125936533504	f	mexicue
Super Bowl Party Secret Weapon: Mexicue Burnt Ends Chili Box! Our award winning chili ready to heat and eat! Call 646-543-6394 to reserve!	1390935063	428238811479695361	f	mexicue
Thanks everyone at #NYChiliFest2014 for an awesome event. Congrats to winner @LosTacosNo1 We're honored to take home People's Choice Award!	1390932708	428228933507510273	f	mexicue
@dookdookdook Hey we're actually doing a private event today	1390931669	428224573914763264	f	mexicue
RT @FSNYC: #NYChiliFest2014 winners! Judges Choice @LosTacosNo1 &amp; Peoples Choice @Mexicue Thx to all chefs &amp; @eatmeaty @GreenTableNYC @Chel...	1390912388	428143703845523456	f	mexicue
45th and 6th!	1390842720	427851495741358081	f	mexicue
Unlike the horrendous Chilly Fest NYC is enduring this weekend...today's #NYChiliFest promises to warm you up with the ultimate...	1390755692	427486473546637312	f	mexicue
Beer, Bourbon, and BBQ festival is today at The Tunnel! Literally the 3 best things on earth. Now if we can just get them to add Bon Bons..	1390671437	427133083130011648	f	mexicue
@dkj104 indeed	1390581153	426754405321682944	f	mexicue
@wfc today! Vesey and North end!	1390581124	426754281346441216	f	mexicue
RT @whatupnature: Are we all in agreement that the guys on the @Mexicue truck are just goddamn american heroes?	1390501476	426420216864968704	f	mexicue
Varick and king today until 3pm	1391179419	429263715998126080	f	eddiespizzany
@katttastic closed today but back on 46th tomorrow	1390940734	428262597780316160	f	eddiespizzany
Found a spot on varick and king. Call ahead 917 439 7522	1390587105	426779368846024704	f	eddiespizzany
Got kicked out of Hudson and king. We wish we could stay. Sorry!	1390586480	426776749079162880	f	eddiespizzany
Hudson and king until 3 today. Call ahead your order 917 439 7522	1390584533	426768580735021056	f	eddiespizzany
Happy Thursday. Old slip and water for lunch. Call ahead your order 917 439 7522	1390498384	426407247842115584	f	eddiespizzany
@jakelipman we do not.	1390414360	426054822748782592	f	eddiespizzany
Come brave the cold and join us for lunch on 46th and 6th. Call ahead your order to 9174397522 http://t.co/r5l3zP1QVU	1390408678	426030990826684416	f	eddiespizzany
We WILL Be open today on 46th and 6th. Come brave the weather and get two free additional toppings on any pizza... http://t.co/hQ1YKdh492	1390399028	425990518053818368	f	eddiespizzany
Hey Everyone, we wont be out today due to the weather but we will plan on getting out there tomorow. Stay safe and warm!	1390397858	425985610416156672	f	eddiespizzany
We will be closed tomorow and tuesday for maintenance. See you all back on the streets on wednesday.	1390175096	425051276783521792	f	eddiespizzany
Lunch is served ladies and gentlemen! We are parked on the corner of Hudson and King street. Don't want to wait,... http://t.co/oq58Gtmxg1	1389973619	424206222242217984	f	eddiespizzany
Lunch is served! We are parked on the corner of Water St., right next to 10 Hanover. Don't feel like waiting,... http://t.co/NUJOb4a18k	1389887061	423843173627342848	f	eddiespizzany
Lunch is being served on W46st. &amp; 6th Ave. Call ahead your order 917-439-7522. Looking forward to serving you.	1389799770	423477048544624640	f	eddiespizzany
Lunch is served! We are parked on W48st in front of FOX news studios. Don't wait in the rain call ahead your order... http://t.co/oNODoivPJb	1389712163	423109596761563136	f	eddiespizzany
NOW is the time to book your 2014 parties! Email Debbie@EddiesPizzany.com for more info!\nBirthday, Corporate,... http://t.co/4Dnm1BNgcN	1389654063	422865909070721024	f	eddiespizzany
Lunch is being served on W26st between 11th &amp; 12th Ave. Looking forward to serving you. Thank you.	1389626673	422751026933170176	f	eddiespizzany
Please help by rating us on https://t.co/ph6XW6VtOf http://t.co/KRQ3Yr9wxE	1389388476	421751955615399936	f	eddiespizzany
Varick and king today until 3	1389377155	421704473195855872	f	eddiespizzany
Hudson and varick today until 3	1389374690	421694131107147776	f	eddiespizzany
We are on 97th St. &amp; Columbus ave. @upperwestsiders @nystfood	1390251431	425371449889914880	f	elpasotruck
Do you need a catering from a truck ??let us know ! #cateringnyc	1387402008	413420105528508417	f	elpasotruck
Come try our delicious food with beers from all over the country @ http://t.co/wkarzbKk2R #craftbeer #weekend @nystfood @NYCFoodieFinder	1385149925	403974183614308352	f	elpasotruck
Come try our food with delicious beers from all over the country @NYCCraftbeerfest.com #craftbeer #weekend @nystfood @NYCFoodieFinder	1385149262	403971404145491968	f	elpasotruck
RT @NYCraftBeerFest: @MorrisTruck, @Carlssteaks, @GoodfellasUSA, @ElPasoTruck Happy to have you at http://t.co/LO9vwmSaGn - Winter Harvest ...	1385149068	403970587984658432	f	elpasotruck
RT @MemesMexico: Soy tan buena persona que no madrugo para que Dios ayude a otro.	1383360941	396470640691384320	f	elpasotruck
@NYCFoodieFinder we would like to invite you to our restaurant. http://t.co/g851MmSo1C	1383072765	395261942803083265	f	elpasotruck
@BestOfCBSNY @FoodNetwork @ZagatNYC @villagevoice @NYCFoodieFinder @juliamoskin @JeffGordinier send us a private message for invitation!	1383072496	395260814178803713	f	elpasotruck
@BestOfCBSNY @FoodNetwork @ZagatNYC @villagevoice @NYCFoodieFinder @juliamoskin @JeffGordinier http://t.co/g851MmSo1C http://t.co/LMPdXJr8vB	1383072311	395260036076691457	f	elpasotruck
RT @Zachats: @ElPasoTruck is legit flavorful. Vibrant salsas and awesome selection.	1382017424	390835523436412928	f	elpasotruck
Hello! We are located on Broadway &amp; Spring !!  @nystfood @I_LOVE_NY #ColumbusDay #tacos	1381777399	389828782653460480	f	elpasotruck
@NYCraftBeerFest happy to be there ! See you soon.	1381030320	386695306714554368	f	elpasotruck
@MC4Adriana tequila !	1380741446	385483683949330433	f	elpasotruck
@MultifariouSam thank you!!	1380643227	385071721021468672	f	elpasotruck
Hello!! @Sothebys @nystfood @InNYCsite @BestOfCBSNY  #tacosnow #lunchtime  @nyphospital  @NYHospitals  72nd &amp; York ave now	1380643204	385071627710767104	f	elpasotruck
@jillmeisner @Refinery29 Thank you guys !!	1380603886	384906714530971648	f	elpasotruck
RT @jillmeisner: Yum! #R29MixMasters @elpasotruck @refinery29 @ Kinfolk Studios http://t.co/lpqmGq1ubs	1380603828	384906472435773440	f	elpasotruck
RT @DarinBresnitz: @elpasotruck looking delicious for @refinery29 #mixmasters with @popularnoisemagazine #swoon4r29 http://t.co/9bVUV4LBTr	1380603787	384906297310973952	f	elpasotruck
@sage_foodie not yet! We will be there soon ! Thank you !	1380603765	384906206097469440	f	elpasotruck
@thew23 we are here right now !	1380564858	384743016684355584	f	elpasotruck
I can code Ruby/Python/Node.JS &amp; Go apps on Nitrous.IO! Sign Up now and get 250MB free space: https://t.co/EzrZQM4XEl	1391042241	428688350007291904	f	yougotsmoked
Park Ave btw 33rd St and 32nd St from 11:00 to 3:00 today! New York Aged Cheddar Mac and Cheese! #Delicious #nyc http://t.co/Gf6QWDPKcv	1389964535	424168119977132032	f	yougotsmoked
Thank you so much! @gregdotgilbert glad you enjoyed it and hope you see you back soon!!!	1389921522	423987711750717440	f	yougotsmoked
RT @gregdotgilbert: Today's awesome lunch was courtesy of @YouGotSmoked. Thanks for coming down to fidi!	1389921410	423987241946726400	f	yougotsmoked
Today we are on Water St and Wall St from 11:00 to 3:00! #comegetsmoked #fidi	1389891274	423860842850177024	f	yougotsmoked
@iamvhinasyhah won't be back till next year.... Uh noooo lol	1387599387	414247973506519040	f	lovemamak
Hey @thisismydesign we apologize for the inconvenience Today. Next time you come by, your meal is on us, Sorry again...	1389819861	423561314326577152	f	yougotsmoked
Check us out today @dumbolot @DUMBOFoodTrucks from 11:00 to 3:00! #slowsmokedpork #applewoodsmokedchicken	1389793785	423451943378644992	f	yougotsmoked
Today we are on Water St and Wall St from 11:00 to 3:00!	1389373670	421689855509549056	f	yougotsmoked
Check us out today on Wall St and Water St in #fidi from 11:00 to 3:00! #followthesmoke See you then!!! http://t.co/6LUz80yDss	1389282332	421306753998131200	f	yougotsmoked
We are back! @dumbolot 11:00 to 3:00!	1389186820	420906148381077504	f	yougotsmoked
Ready to get smoked with our new menu? http://t.co/4ehQVCO40w	1389031599	420255102658572288	f	yougotsmoked
Had to move to Varick At and Vandam St sorry!	1387560054	414082995990331392	f	yougotsmoked
#tribeca get ready to be smoked! ( by BBQ that is ) check us out today for the first time on Varick St and Charlton St from 11:30 to 2:30!	1387549189	414037428048232448	f	yougotsmoked
Shredded Barbecue Skirt Steak - Arugula / Tabasco Onion Strings / YGS Signature BBQ Sauce / #comeandgetit http://t.co/RrW1VKbr9A	1387470510	413707422910652416	f	yougotsmoked
Attention #fidi we are back! Wall St and Water St from 11:30 to 2:30 with some Amazing BBQ! See you then!	1387469978	413705190010023936	f	yougotsmoked
Check us out today @dumbolot on the the Corner of Jay St and Water St from 11:30 to 2:30! See you then!!!	1387381955	413335997045547008	f	yougotsmoked
Not yet @meggerz04 sorry	1387381860	413335597949136896	f	yougotsmoked
RT @eatsleepwebcom: @YouGotSmoked That looks so delicious! I can't wait to have it today for lunch! @DUMBOFoodTrucks @dumbolot	1387377420	413316972819271681	f	yougotsmoked
RT @dumbolot: Lot vets @DomoTaco and @shortysnyc on jay &amp; water along with a new addition! Welcome to the lot @YouGotSmoked! @DUMBOFoodTruc...	1387377413	413316943698210816	f	yougotsmoked
Smoked Portobello Mushroom-Texas Toast/Arugula/Tomato/Caramelized Onions/Sliced Avocado/Sweet and Smokey Vinaigrette http://t.co/nkY5nZpk1k	1387317610	413066113388666880	f	yougotsmoked
Coming up on 7500 Tweets. Never has so much been said, that meant so lil, 2 so many peeps. Here's 2 getting to 10,000 w/a lil more substance	1391180736	429269238839128066	f	sweeterynyc
Oh, not to be left behind in the barn, it's the Year of The Horse, Happy Chinese New Year!	1391179349	429263422836862976	f	sweeterynyc
Gd morning &amp;hap hap Happy Fri! U know the drill, Sweetery is on Hudson/KingSt dishing up sweet delight, so what's ur reason 4not stopping by	1391179168	429262662526967808	f	sweeterynyc
@Dove_Chocolate Hi there! Would love to discuss an experiential marketing event with someone at Dove, can we set up a brief call?	1391115137	428994095193681920	f	sweeterynyc
RT @Valduccis: Check out who has the best pizza in NY &amp; NJForget those lame lists and listen to someone who knows his dough http://t.co/pbb...	1391098660	428924986787909632	f	sweeterynyc
We are told by our man in the know @MJSmith4700 that today is 1 of our favorite days, its Croissant Day, So come &amp; get 'em Hudson/King St.	1391088798	428883620900524033	f	sweeterynyc
Happy Wed. fans of Sweetery. It;s a little warmer today, but the real warmth is on Hudson/King St. where you know Sweetery will be.	1391002559	428521908657602561	f	sweeterynyc
RT @Cheap_eats: @SweeteryNYC: It may be a little chilly outside, but Hudson/King St. Sweetery has a very warm spot just for you.	1390918194	428168055944781825	f	sweeterynyc
It may be a little chilly outside, but Hudson/King St. Sweetery has a very warm spot just for you.	1390916339	428160278232973313	f	sweeterynyc
Tell the truth now, how many other than our friend @mjsmith4700 knew that today is Chocolate Cake Day, &amp; to that we say YUM!!!	1390845226	427862006884888576	f	sweeterynyc
RT @PetSpeakArt: @SweeteryNYC When I see your Sweetery-mobile, I smile.	1390573993	426724374796697600	f	sweeterynyc
@mjsmith4700 we've missed ur daily updates, &amp;now that we know today's Blondie/Brownie Day u brought a smile 2 our faces &amp;delight 2 our heart	1390415847	426061059665829888	f	sweeterynyc
Sorry Sweetery fans, the big chill has got us down. As much as we know u need us 2 provide warmth 2 u, some times u can't fight the elements	1390402053	426003203105116160	f	sweeterynyc
RT @KleverBeats: MY BEATS ARE LIKE SEX IN YOUR EARS  --&gt;   http://t.co/6pgIwZ0d6W	1390344336	425761122256703488	f	sweeterynyc
Happy MLK Day. The Sweetery mobile bake shop will be off the road today, we'll see everyone tomorrow. Have a great day!	1390226570	425267175293603840	f	sweeterynyc
Great, you get The Four Seasons and we got to\nspend two weeks \n With a lizard in the room	1389994230	424292673172680704	f	sweeterynyc
RT @FyreBooks: @ColleenLindsay @SweeteryNYC They make your day don't they :)	1389901228	423902594163961856	f	sweeterynyc
RT @ColleenLindsay: Every day, rain or shine, the guys working the @SweeteryNYC truck serve up coffee and pastries with a smile. Thank you!...	1389901185	423902411833344000	f	sweeterynyc
Top of the list of disgusting co. is @StateFarm ripping off an 80 yr old of over $2000 a yr charging $3000 4 insurance when Geico is @ $1000	1389819365	423559236346322945	f	sweeterynyc
@Clorox Think about how much fun it would be to do a Clorox experiential marketing event on our interactive mobile glass truck, interested?	1389799543	423476095862587393	f	sweeterynyc
@ckinyc I'm so sorry about that!! Come back for tomorrow to change a new one.  Sorry for the convenient.....	1391128751	429051196075438080	f	lovemamak
We are at 10 Hanover Sq! (Cross of the street) #lunchtime #currypuff #malaysian&amp;thai	1391097839	428921544661024768	f	lovemamak
@chazelton331 7 Hanover square	1390931652	428224505035886592	f	lovemamak
We are at 7 Hanover square &amp; everyone can order delivery service tru seamless web if it is too messy to get out from office!	1390321357	425664739637993472	f	lovemamak
@Playmaka34 @djeshin thanks how u all been? Heavy snow today gosh	1390320483	425661076437745664	f	lovemamak
@Playmaka34 @djeshin yes sir, :)	1390320196	425659872034979840	f	lovemamak
@singhkashminder not yet kashminder, I couldn't make it happen yet.	1390245042	425344652171309056	f	lovemamak
@Arkij yes we will be	1389622922	422735292660211713	f	lovemamak
@ChristaSully what would u like we can deliver it to u if u are near Williamsburg. We are hosting a private event near by with the food ^_^	1389299955	421380669777141760	f	lovemamak
@WPNYC77 @singhkashminder not yet guys, we wish we can be there for u all!	1389289017	421334791683072000	f	lovemamak
@WPNYC77 only at  for now 7 Hanover square	1389288821	421333973424685056	f	lovemamak
@WPNYC77 @singhkashminder Not sure when. He is taking a break back no replacement to cover his shift.	1389029065	420244474397474816	f	lovemamak
@singhkashminder tomorrow at Hanover square having private catering today. Under staff	1389025974	420231510625878016	f	lovemamak
@pinkykittyrroww we are not open today because of the weather l...	1388684206	418798031807729664	f	lovemamak
@iamvhinasyhah you too!	1387599754	414249512824496128	f	lovemamak
@WPNYC77 @Playmaka34 we are only at 7 Hanover Sq for today	1387560757	414085946012102656	f	lovemamak
@Playmaka34 thanks u too	1387554145	414058214087725056	f	lovemamak
Our last day of the season. Grab some #rendang #curry before we're gone for the year !	1387551330	414046407033905154	f	lovemamak
RT @DriveChangeNYC: Eat well, do good @SnowDayTruck - coming to your corner, and belly, soon. \nFor more info follow @SnowDayTruck #justtruc...	1390971706	428392504137097216	f	snowdaytruck
RT @DriveChangeNYC: Hey @csiSL let's take President Obama's words to heart - "Let's make this a year of action." You in? #collectiveimpact ...	1390971688	428392429100998656	f	snowdaytruck
RT @DriveChangeNYC: How do you spell @ChipotleTweets? \nS-U-S-T-A-I-N-A-B-L-E \nO-R-G-A-N-I-C \nI-N-T-E-G-R-I-T-Y \nFind out how they do it: ht...	1390971679	428392389729058816	f	snowdaytruck
.@JoshDComp We will be out within 3 weeks...we're looking forward to sharing a meal with you!	1390946493	428286753221255169	f	snowdaytruck
RT @levanityproject: We're here with @DriveChangeNYC revealing their new food truck, Snowday! French Canadian maple themed deliciousness ht...	1390945664	428283273039839232	f	snowdaytruck
(wooden) nuts and bolts - The process of building @SnowDayTruck \n@jeyhoun @SITUSTUDIO \n#itsinthedetails #craft http://t.co/bgExk9vyeh	1390941261	428264806101946369	f	snowdaytruck
.@crownmaple thanks for sharing...NYers love sugar on snow! #sweetlife #collectiveimpact	1389127751	420658395880755200	f	snowdaytruck
RT @crownmaple: One of the upsides to the snow blanketing much of the country? Maple Snow! So easy, it's impossible to mess up: http://t.co...	1389127705	420658201802334208	f	snowdaytruck
.@MarcusCooks Drive Change with us! Support NY(C) producers/farmers &amp; help reentry of formerly incarcerated youth! http://t.co/hN2tRnizg5	1389032899	420260556537229312	f	snowdaytruck
.@rachaelray join us! Support local NY farmers/maple syrup producers and drive (social) change all in one bite! http://t.co/hN2tRnizg5	1389032593	420259272383922176	f	snowdaytruck
RT @NYCParks: Great news! Tomorrow is a snow day! A site in each borough will have free hot cocoa, sledding, &amp; more. Visit http://t.co/tZwc...	1388779440	419197473195036672	f	snowdaytruck
RT @crownmaple: Enjoying a #snowday today? If you're like us, that means there's plenty of time to cook! Here's some inspiration: http://t....	1388779429	419197425178644480	f	snowdaytruck
Love the @HuffingtonPost wintery anthem-albulm http://t.co/CU09W1gT9j sound track? Let it snow...Let it snow...Let it snow!	1388778993	419195597040537601	f	snowdaytruck
COOL! Snowday truck 2? @fastcompany "To Nobody's Surprise, The Canadians Built a Drivable Truck Made From Ice http://t.co/KE3DDadDXZ	1388778726	419194476041490433	f	snowdaytruck
.@TheBIGLiveTV SUGAR ON SNOW! #duh #Snowday365 http://t.co/oErjVoqxDo	1388778161	419192108881166336	f	snowdaytruck
RT @DriveChangeNYC: Thank you for the heads-up @thatbetsylady we're excited to apply for @bkflea !! Can't wait to share goodies from @SnowD...	1388778067	419191715707510785	f	snowdaytruck
RT @DriveChangeNYC: HAPPY SNOW-DAY EVERYONE! - Make every day a snow-day @SnowDayTruck - is there anything more delicious? #snowdaybliss	1388778062	419191694975062016	f	snowdaytruck
How are you celebrating your snow day???! #makeeverydayasnowday http://t.co/qUZW1DWNgd	1388777485	419189273246441472	f	snowdaytruck
SNOW DAY!!!!!!! have fun out there! #makeeverydayasnowday	1388777421	419189006383845376	f	snowdaytruck
Have a sweet and savory new year!\n#maplelove\n#mapleisthenewblack	1388523519	418124063794401280	f	snowdaytruck
Just added Breckenridge Ophelia Hoppy Wheat Ale on tap. http://t.co/So8On7u9PY	1390926447	428202674614325248	f	shortysnyc
RT @fqw102: It's not even 11am and I want a cheesesteak from @shortysnyc. Now if only I could get out of bed... #hangover #hungry #cheesest...	1390763586	427519582849744896	f	shortysnyc
RT @Migakalypse: @shortysnyc just bought a shirt and ill be representing it back in California. Ill miss u guys.	1390746670	427448633618096128	f	shortysnyc
Just added Lion Stout on tap. See our full beer menu: http://t.co/qan6zoyf3g @LionBrewery #BeerMenus	1390701824	427260536242573312	f	shortysnyc
Just added Lion Stout on tap. http://t.co/WU6563ZdFR	1390701823	427260532039905280	f	shortysnyc
Just added Lagunitas IPA on tap. http://t.co/ifETW8CDGS	1390680683	427171864385826816	f	shortysnyc
Just added Blue Point Sour Cherry Imperial Stout on tap. http://t.co/zQ8Gz7s1P2	1390680683	427171862875893761	f	shortysnyc
Just added Lagunitas IPA on tap. See our full beer menu: http://t.co/MaRCUPiHd6 @lagunitasbruhws #BeerMenus	1390680683	427171862615838720	f	shortysnyc
Just added Blue Point Sour Cherry Imperial Stout on tap. See our full beer menu: http://t.co/qan6zoyf3g @BluePointBrewer #BeerMenus	1390680681	427171856635133952	f	shortysnyc
Just added Breckenridge Trademark Pale Ale (Mosaic) on tap. http://t.co/cUplI2L3yE	1390680681	427171855678832640	f	shortysnyc
Just added Breckenridge Trademark Pale Ale (Mosaic) on tap. See our full beer menu: http://t.co/qan6zoyf3g @BreckBrew #BeerMenus	1390680680	427171852013023232	f	shortysnyc
Just added Green Flash West Coast IPA on tap. http://t.co/YduONsUiTT	1390680679	427171849005723648	f	shortysnyc
Just added Green Flash West Coast IPA on tap. See our full beer menu: http://t.co/qan6zoyf3g @Greenflashbeer #BeerMenus	1390680679	427171847013425152	f	shortysnyc
Just added Badass Pear Cider on tap. http://t.co/8A9lPteK8X	1390680445	427170865050972160	f	shortysnyc
Just added Badass Pear Cider on tap. See our full beer menu: http://t.co/qan6zoyf3g #BeerMenus	1390680443	427170858260758528	f	shortysnyc
Just added Ballast Point Wahoo Wheat on tap. See our full beer menu: http://t.co/qan6zoyf3g @bpbrewing #BeerMenus	1390680356	427170491196264449	f	shortysnyc
Just added Ballast Point Wahoo Wheat on tap. http://t.co/YLhWCN6sbz	1390680354	427170484414054400	f	shortysnyc
Just added Great Divide Lasso IPA on tap. See our full beer menu: http://t.co/qan6zoyf3g @greatdividebrew #BeerMenus	1390680315	427170321977077760	f	shortysnyc
Just added Great Divide Lasso IPA on tap. http://t.co/InOtxRkkUA	1390680315	427170320412581888	f	shortysnyc
Just added Sixpoint Resin cans. http://t.co/H3BVCaxaq5	1390666029	427110401440890880	f	shortysnyc
@midtownlunch HH3 is on 46st &amp; 6 ave. HH2 is on Park Ave &amp; 33st. Word of the day is "Peyton for ur free upgrade. #midtown get ur #YumYum	1391179137	429262532864647169	f	hibachiheaven
@midtownlunch HH3 is on broadway&amp;55 today. The word of the day is "broncos" for ur free upgrade. #midtown get ur #yumyum on today	1391094347	428906895924293632	f	hibachiheaven
@downtownlunch HH2 is on varick&amp;charlton today. The word of the day is "broncos" for ur free upgrade. #SoHo get ur #yumyum in today	1391094137	428906016353558528	f	hibachiheaven
http://t.co/4DPFdAwvzY	1390846693	427868159576932352	f	hibachiheaven
RT @cammcm: @hibachiheaven Can my Super Bowl dreams get a #RT  http://t.co/XUwm2u53nK	1390619663	426915929453518848	f	hibachiheaven
@deliheaventruck http://t.co/VXmnvmAMfA	1390606545	426860906937864192	f	hibachiheaven
@midtownlunch HH3 is on park&amp;47th today. The word of the day is "tgif" for ur free upgrade. #midtown get ur #yumyum on today	1390576694	426735702593011713	f	hibachiheaven
@midtownlunch HH2 is on park&amp;33rd today. The word of the is "tgif" for ur free upgrade. #midtown get ur #yumyum on today	1390575816	426732019251695617	f	hibachiheaven
@downtownlunch correction Hh2 is on varick&amp;charlton. The word of the day is "icicle" for ur free upgrade.	1390500128	426414562729279488	f	hibachiheaven
@midtownlunch HH3 is on broadway&amp;55th today. The word of the day is "icicle" for ur free upgrade. #midtown get ur #yumyum on today	1390487096	426359899438997505	f	hibachiheaven
@downtownlunch HH2 is on hudson&amp;king today. The word of the day is "icicle" for ur free upgrade. #SoHo get ur #yumyum on today	1390487020	426359581099696128	f	hibachiheaven
@midtownlunch HH2 is on park&amp;33 today. The word of the day is "blizzard" for ur free upgrade. #midtown get ur#yumyum on today	1390319027	425654969350758400	f	hibachiheaven
@midtownlunch HH3 is on broadway&amp;55 today. The word of the day is "blizzard" for ur free upgrade. #midtown get ur #yumyum on today	1390318318	425651996331626496	f	hibachiheaven
@midtownlunch HH2 is on 47th btwn park&amp;lex today. The word of the day is "weekend" for ur free upgrade. #midtown get ur #yumyum on today	1389970693	424193951336513536	f	hibachiheaven
@midtownlunch HH2 is on broadway&amp;55 today. The word of the day is "rock out" for ur free upgrade. #midtown get ur #yumyum on today	1389883150	423826769255206912	f	hibachiheaven
@downtownlunch HH3 is on hudson&amp;king today. The word of the day is "rock out" for ur free upgrade. #SoHo get ur #yumyum on today	1389883106	423826582843973632	f	hibachiheaven
@LaGringaBklyn good luck on your first day out on the streets today. Check them out on park&amp;51	1389883048	423826338404122624	f	hibachiheaven
@downtownlunch Hh2 is on water&amp;broad st today. The word of the day is "fun" for ur free upgrade. #FiDi get ur #yumyum on today	1389802725	423489441823334400	f	hibachiheaven
@midtownlunch HH3 is on 46 btwn 6&amp;5 today. The word of the day is "fun" for ur free upgrade. #midtown get ut #yumyum on today	1389800529	423480228678074368	f	hibachiheaven
@midtownlunch HH3 is on 47th btwn park&amp;lex today. The word of the day is "rain delay" for ur free upgrade. #midtown get ur #yumyum on today	1389710513	423102675929288704	f	hibachiheaven
Sorry folks @ WFC, can't make it today. :( See you soon!	1390837355	427828995846316032	f	mamuthainoodle
@Chris_Quartly Hi Chris! Our truck is at the mechanic getting some TLC. Can't go out today :( hope to see you next week!	1390837210	427828387709984769	f	mamuthainoodle
Sorry noodle lovers, no truck today. Stay warm NYC!	1390402666	426005774452948992	f	mamuthainoodle
Studies show that most ppl need more noodle in their lives, let us help you with that! @DUMBOFoodTrucks 11-3. Get it hot/fresh! @dumbolot	1389970970	424195112378580992	f	mamuthainoodle
FiDi/WFC North End&amp;Vesey! Thru the fog you'll find sunshine. Also,there are noodles! Join us for lunch! 11-3 @BrookfieldPLNY @downtownlunch	1389796683	423464098928803841	f	mamuthainoodle
@Enigma0280 sorry, no Ba Mee Hang today. :( just our yummy Tom Yum soup! Come by and say hello!	1389633750	422780709687025664	f	mamuthainoodle
WFC South End&amp;Liberty! It's a beautiful day for noodles! Join us for lunch! @BrookfieldPLNY @downtownlunch 11-3pm	1389623364	422737145632415744	f	mamuthainoodle
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
Open everyday for lunch and dinner at 634 McLean Avenue in Yonkers - stop in or give us a call at: (914) 457-4324... http://t.co/l1bQOlWwjP	1390577295	426738222505267200	f	mrniceguytruck
Check out our full Menu - Call us and we'll deliver your favorite Sliders: 914-457-4324 http://t.co/CqKdp97kAO	1390436040	426145756920442880	f	mrniceguytruck
Spicy Buffalo wings and Fries with Sracha-up dipping sauce will definitely keep you warm today!  Call... http://t.co/9GKvXQ3EKJ	1390322130	425667981990178816	f	mrniceguytruck
#SliderWingNation. by @dyckmanbar "Super Bowl live at DB SUN 2/2 mrniceguytruck on site for those... http://t.co/AaLfKazsyG	1390242002	425331903466835968	f	mrniceguytruck
#MNG SuperBowl Catering. Pre-order today! Free delivery. Call us at 914-457-4324 or email... http://t.co/eINktL0KGR	1390183743	425087546553823232	f	mrniceguytruck
Check us out today. 634 McLean Ave Yonkers NY. Sliders Wings and Fries on the menu. Call us for p/u or... http://t.co/3X5UpEFCN1	1390064172	424586028704595968	f	mrniceguytruck
634 McLean Ave Yonerks NY. Come check us out. Sliders Wings Fries. 914-457-4324 for p/u and delivery http://t.co/itOSNiGf6Z	1390063698	424584043142057984	f	mrniceguytruck
Mr Nice Guy Proudly serving Freshly Baked Brioche buns Daily!  Get some today on the truck at 50th N... http://t.co/V7AgDab30E	1389973927	424207516441272320	f	mrniceguytruck
RT @ShanghaiMKS: If these descriptions of @MrNiceGuyTruck's food doesn't get your hungry, we don't know what will! http://t.co/lqGpaldnGC	1389937487	424054674896195584	f	mrniceguytruck
RT @_call_me_don: @MrNiceGuyTruck @_call_me_don: @MrNiceGuyTruck gotta come closer to the 20th and Park! I need some of those yucca fries!	1389937438	424054468339335168	f	mrniceguytruck
Court and Bergen today! #seizeyourdonut	1389448123	422002133643563008	f	carpedonutnyc
RT @PDiamondConnect: No need to go looking for the mobile van anymore! @mrniceguytruck has made its way to #WestchesterCounty! 634... http:...	1389937345	424054080441700352	f	mrniceguytruck
RT @PDiamondConnect: @mrniceguytruck never had a chance to make it home! #slidersmakethebestdrivingsnack! http://t.co/tQe7GaSbjO	1389937331	424054020849025024	f	mrniceguytruck
Check us out in store all week.  634 Mclean Ave, Yonkers NY\nWith your Favorite Sliders, Wings, and Fries.  \nGet... http://t.co/eSVC8wE0tn	1389739197	423222983881424897	f	mrniceguytruck
MNG Garlic Chili Wings. Now taking orders for Super Bowl. 914-457-4324 or email... http://t.co/Heqwulvem3	1389561396	422477234365288449	f	mrniceguytruck
Try our wings! BBQ, Sweet Teriyaki, Garlci Chili, Mild, Hot Buffalo! #mrniceguy #wings #sliders #fries http://t.co/skpxQKx7ng	1389553214	422442917790490624	f	mrniceguytruck
Right back at it.               634 McLean Ave. Yonkers.   Sliders fries Wings. Grab a Super Bowl menu... http://t.co/1zymsIkiYw	1389544771	422407502312251392	f	mrniceguytruck
We will be catering for Super Bowl!! Call for more info! 914.457.4324! http://t.co/ItVzLIMl1g	1389457640	422042051208036352	f	mrniceguytruck
#RP  http://t.co/AxzStZftgH	1389446812	421996634768437248	f	mrniceguytruck
Back at it for lunch on a Friday. 50th n 6th with some yummy sliders n fries. #Slidernation report	1389371412	421680383500238848	f	mrniceguytruck
Testing 123	1388235518	416916099721351168	f	mrniceguytruck
The sun is up an we are already to serve you for lunch!\nWe are at 51st between park and Madison....see ya real soon!	1391171021	429228490248826880	f	seoulfoodnyc
If loving you is wrong....eat!\nWe are at West 4th and Greene Street!!! Come on by and chow!	1391115690	428996417542053888	f	seoulfoodnyc
We are ready to feed you at lunchtime!! Just parked on 51st between Park Avenue and Madison Avenue	1391090268	428889788901371904	f	seoulfoodnyc
We just arrived for dinner time!! West 4th and Greene street	1391028368	428630161693487104	f	seoulfoodnyc
We are already to serve you lunch!!\nWe are On 51st between Park and Madison avenues!	1391003673	428526584220250112	f	seoulfoodnyc
Omg it's cold,,,but our food is so yummy! We are on west 4th and Greene street for dinner tonight!	1390945290	428281705880096768	f	seoulfoodnyc
we are at 46th street between 5th and 6th Ave	1390918631	428169888146800640	f	seoulfoodnyc
Is it lunch time already??\nWe are at 51st street, between Park and Madison!	1390831076	427802657798225921	f	seoulfoodnyc
We have arrived!\nOutside The Apple Store on 67th and broadway!! Come and get it!	1390749648	427461124083425280	f	seoulfoodnyc
You still have to eat when it's cold!!\nWe are at West 4th and Greene streets!	1390596976	426820773354143744	f	seoulfoodnyc
Are you already thinking about lunch? We are!!!\nWe are at 46th street between 5th and 6th	1390574217	426725314187001856	f	seoulfoodnyc
Din din time!!\nWe are at West 4th between Mercer and Greene Streets-	1390512579	426466784070230016	f	seoulfoodnyc
Your as cold as ice!!\nWe are ready to feed you and are on 46th street, between 5th and 6th avenues!!!	1390486985	426359435775463425	f	seoulfoodnyc
MLK day~ time to eat!!!! We are parked on 67th and Broadway outside the Apple store now !!!	1390233422	425295915168313344	f	seoulfoodnyc
Don't you want to eat today?\nWe are In front of the Apple store on Broadway at 67th street -	1390143868	424920299143172096	f	seoulfoodnyc
Parked on 67th and broadway outside Apple store - get over here, now!!	1390060086	424568891688640512	f	seoulfoodnyc
Just got paid, it's Friday night....time to feed my belly!!!\nWe are at West 4th between Mercer and Greene streets	1389995076	424296219050258432	f	seoulfoodnyc
Your already thinking about lunch, aren't you?\nWe are parked  on 46th between Park and Madison for lunch today Friday the 17th!!	1389964879	424169563467825152	f	seoulfoodnyc
Is it lunch time yet??\nWe are already on 46th between 5th and 6th!!! See ya real soon!	1389878641	423807857713487872	f	seoulfoodnyc
We dont serve apples, but we do serve great food!\nWe are at 67th and broadway right outside Apple Store	1389820882	423565596434120704	f	seoulfoodnyc
FRIDAY FRIDAY! Cheesesteaks for all! 56th st &amp; Broadway.11-3 @randomfoodtruck @DefJamRecords @Barclays @VictoriasSecret call us 917 597 4313	1391179739	429265056178929664	f	carlssteaks
@No1male sorry yes we have our food truck now	1391111685	428979617832370176	f	carlssteaks
@JamesCreque sorry we missed you we willmbe back next week till 3	1391111648	428979461925912577	f	carlssteaks
Hey folks 10 Hanover sq &amp;water st 11-3 prefect weather for a piping hot Carl's cheesesteak&amp; our BEER BATTERED ONION RINGS -GOT WHIZ?	1391091821	428896300441296897	f	carlssteaks
WOW Its cold at the stadium but Ranger/ Islander fans grabbing a Carl's cheesesteak before the puck drops \nGOT WHIZ? http://t.co/0LYsMzjILE	1391043477	428693532866772992	f	carlssteaks
@7BOOMERESIASON thanks for being a fan of ours if you &amp; Gunner @ game tonight email us carlssteaks@gmail.com for a few cheesesteaks no wait	1391008711	428547715103227904	f	carlssteaks
Hey folks 49th st 6/7th ave 11- 2:30 grab a piping hot carls cheesesteak to stay warm @SiriusXMNFL @SIRIUSXM @Barclays order 917 597 4313	1391008336	428546140318208000	f	carlssteaks
Polar Vertex whateverUWS dinner 61st &amp; broadway 5- 9pm@nyit grab a piping hot cheesesteak before or after class way home from work\nGOT WHIZ?	1390945033	428280626551062528	f	carlssteaks
Polar vortex,snowstorms who cares we need to show our LOVE to @dumbolot @DUMBOFoodTrucks grab a hot cheesesteak 11-3 Webrooklyn GOT WHIZ?	1390924167	428193108711735296	f	carlssteaks
RT @dumbolot: Heating up in the dumbolot with @sweetchilinyc @carlssteaks and @KimchiTruck today! @DUMBOFoodTrucks	1390923902	428191996571041792	f	carlssteaks
RT @nycfoodtruck: RT @Cursedinferno: 2 cheese steaks with onions and extra wiz. Awesome (at @carlssteaks) [pic]: http://t.co/EPGPro84MV	1390854975	427902899256311808	f	carlssteaks
RT @SarahEmilyShah: @carlssteaks thanks for the delicious and hot cheesesteak today at the game!	1390854899	427902579579027456	f	carlssteaks
@SarahEmilyShah our pleasure hope to see you again soon	1390854895	427902561770024960	f	carlssteaks
Hey folks 49th &amp; 6/7th ave 11-3 its like a HEAT WAVE TODAY!! Cheesesteaks for all\n@SiriusXMNFL @SIRIUSXM @Barclays @FoxNews GOT WHIZ?	1390832139	427807114640515072	f	carlssteaks
RT @Cursedinferno: 2 cheese steaks with onions and extra wiz. Awesome (at @CarlsSteaks) [pic]: http://t.co/ub1FaM94c2	1390760361	427506056517152768	f	carlssteaks
historic hockey game at Yankee Stadium today feeding the fans stay warm &amp; grab a piping hot cheesesteak GOT WHIZ? http://t.co/3UACDXzdQn	1390760312	427505854133592064	f	carlssteaks
Hey folks nothing cooler than renting Carl's Steaks Food truck for your Super Bowl party! We can make it happen give us a call 917 597 4313	1390690008	427210975545413632	f	carlssteaks
@greggfly what part Gregg?	1390681738	427176289213370368	f	carlssteaks
@damaster9 section 107,223 and 311 stop by	1390681708	427176161639428096	f	carlssteaks
Happy Saturday in front of the Apple Store till 9, broadway &amp; 67th st come by for a famous Carls CHEESESTEAK\n GOT WHIZ?	1390671200	427132090535399425	f	carlssteaks
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
test post1 http://t.co/K0QajDL5JJ	1391240135	429518374767308800	f	getstuffednow
test http://t.co/wbAKhzmSpk	1391238545	429511707635888130	f	getstuffednow
Whats on your plate for #LunarNewYear ? We are selling out of peking duck sliders at a private event!	1391015539	428576352514883585	f	getstuffednow
#New crab cake slider ready to be showcased at private event this wednesday- the old bay coleslaw turned out 2 be the winner!	1390932684	428228831993167872	f	getstuffednow
Soto Ayam, a soup to remember http://t.co/VyxhSRZ0jp	1390682575	427179800931733504	f	getstuffednow
Ok, its friday and this cold wave is not going away, spike a shot of brandy with tellicherry black pepper &amp; wildflower honey, then head out!	1390582637	426760627160612864	f	getstuffednow
#snowdayNYC comfort food #recipe- boil frozen dumplings, buckwheat noodles &amp; green veggies in beef broth, add five spice &amp; dash of sriracha	1390409295	426033581006540800	f	getstuffednow
RT @ChineseMirch: #MLKDay2014 we r here today &amp; thriving thanks to you #MartinLutherKing, thank you!	1390242901	425335674473304065	f	getstuffednow
RT @ChineseMirch: Are u ready for #gameday? Not without our #footballsunday favs- chicken lollipops, sticky wings &amp; spring rolls!	1390157928	424979272152129536	f	getstuffednow
We drove in this fog 2 our corporate gig 2day!  #customerservice http://t.co/Stdsb0fgDv	1389802718	423489410424766465	f	getstuffednow
@nycfoodtruck @laulaurlaurie aah yes, the horseradish will be the zinger, thx!	1389642831	422818795343052800	f	getstuffednow
@pelzerspretzels @nycfoodtruck we always forget how nifty old bay is- thx for the tip!	1389642713	422818300419395584	f	getstuffednow
@oaxacatacos ooh! sounds delicious, will definitely try, thanks!!	1389540471	422389468331778048	f	getstuffednow
Working on a #homemade crab cake bun slider, need a new sauce idea other than mango salsa, anyone?	1389539088	422383669589065728	f	getstuffednow
#saturdaynightdinner @BKBazaar with @MayhemAndStout, @SnapTruck @oaxacatacos, us &amp; much more, what else do u need? #foodporn	1389474086	422111030266044417	f	getstuffednow
#tgif - time 2 party with us @BKBazaar , trust us-we've got the best spot right by the stage!	1389385514	421739529465524224	f	getstuffednow
RT @ChineseMirch: #NY location closed 2 day! Can't feel our toes &amp; fingers- not a day 2 be near cleavers! #frostbite! http://t.co/CqbVW28S7I	1389106743	420570281326166016	f	getstuffednow
RT @ChineseMirch: First #Sunday of the year &amp; struggling with yr rez to eat well? Worry not - our  tofu #stirfry &amp; brown rice packs flavor ...	1388955764	419937029938765824	f	getstuffednow
RT @ChineseMirch: #t's 2014 and cold out there but in here its warm n toasty with the kitchen cranking pipin hot food! http://t.co/R3dsyGwW...	1388858241	419527989848981505	f	getstuffednow
#snowdayNYC we will freeze our buns 2 bring u the buns u love @BKBazaar ! Its a date at 7pm!	1388785130	419221337656537088	f	getstuffednow
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
G1- private event\nG2- in #secaucus #NJ for # winterblast	1391101632	428937451584118784	f	gcnyc1
G1- 7 Hanover Square  fidi\nG2- 26 11/12 #starrettlehigh	1391015203	428574942452789248	f	gcnyc1
G1 park 25/26\nG2 50/6	1390930411	428219299535544320	f	gcnyc1
We are no longer on hudson &amp; king...the police kindly asked us to mosey on...New spot to be announced shortly	1390929348	428214839040016384	f	gcnyc1
G1 - Hudson &amp; King\nG2 - 50/6\n#ComeToTheCheeseYo	1390922459	428185947147345920	f	gcnyc1
G1- 5th ave/20\nG2- Broadway/55\n#ComeToTheCheeseYo	1390834444	427816785526919168	f	gcnyc1
Truck phone works call in orders 1646-538-1838	1390585995	426774713982263296	f	gcnyc1
Truck phone is down sorry	1390585379	426772131142467584	f	gcnyc1
46 5/6\n49/6\nCall  your orders for pick up 646-538-1838\n#ComeToTheCheeseYo	1390582557	426760293675712513	f	gcnyc1
Hey now, come brave the cold with #Grilledcheese &amp; # Tomato Soup\nG1 Broadway 36/37\nG2 50th /6\n# tunamelts #vegemelts\n#ComeToTheCheeseYo	1390492720	426383491753074688	f	gcnyc1
Closed today... c u 2morro	1390406171	426020476478300160	f	gcnyc1
Good Morning. ....\nWe came out, we parked and we just called it quits for the day.....\nClosing Due to the Weather. ...	1390314188	425634671310159872	f	gcnyc1
Happy MLK day....\nG1 - 5th Ave @ 20th street\nG2 - Broadway @ 55th st.\n# tunamelts\n#ComeToTheCheeseYo	1390231755	425288925243260928	f	gcnyc1
Yoyoyo....\nG1 - Fixed &amp; Rockin The #Grilledcheese 6 on 46 5/6.\nG2 - Slow and steady on 49th/6\n#ComeToTheCheeseYo	1389980078	424233313659002880	f	gcnyc1
G1 getting repairs\nG2 50/6	1389892885	423867600666648576	f	gcnyc1
G2 #starrettlehigh 26th 11/2\nG1 36th 6/Broadway\n# starrett601\n#ComeToTheCheeseYo	1389802112	423486869478072320	f	gcnyc1
G1 soho Hudson &amp; King\nG2 fidi Water &amp; Wall\n#ComeToTheCheeseYo	1389716280	423126866031947776	f	gcnyc1
@bmciaap water &amp; wall today...\n#ComeToTheCheeseYo	1389716233	423126666043731968	f	gcnyc1
Great Crisp Morning :)\nG1 5th Ave. @ 20th Street\nG1 Broadway @ 55th\nRocking the mixed vege melts...\n#ComeToTheCheeseYo	1389623713	422738610371444737	f	gcnyc1
Rockin the cheese today....\n26th 11/12\n#ComeToTheCheeseYo	1389198974	420957126123868162	f	gcnyc1
There should be an Olympic event for foodies. Think "Competitive Blind Taste-Testing."	1391203986	429366754234486784	f	neaexpress
You still have a chance to catch us today at the 50 Yard Lounge! Don't miss out: http://t.co/gxcZ5B30Km	1391199035	429345990664273920	f	neaexpress
Clean air: because breathing's not optional.	1391196030	429333385358880770	f	neaexpress
Every hotel owner in the tri-state is beaming.	1391191812	429315694082408448	f	neaexpress
Tonight at the 50 Yard Lounge, all the pregame hype and top quality pizza you can handle. http://t.co/ZzdhEa0pJi	1391188536	429301955224436736	f	neaexpress
Trillium CNG picks up a clean fuels award: http://t.co/sDDekFFWm2	1391184615	429285506728603648	f	neaexpress
Any Super Bowl predictions (other than traffic jams)?	1391181039	429270510195986432	f	neaexpress
Good morning! You're one step away from the weekend.	1391176520	429251556085886976	f	neaexpress
Relief is a warm pizza box on a cold day.	1391119852	429013872045875201	f	neaexpress
Hurry! Someone's about to have your pizza: http://t.co/gxcZ5B30Km	1391113534	428987374052589568	f	neaexpress
D.O.P. are our favorite initials.  On the other hand, GMO's a black sheep.	1391105721	428954603905118208	f	neaexpress
New Location! We are now on 8th ave between 35th and 36th	1391103710	428946168065056768	f	neaexpress
Today's our first day at The 50 Yard Lounge! Let's get ready for game day. http://t.co/gxcZ5B30Km	1391101816	428938222635589632	f	neaexpress
33rd St between 7 and 8: come chow down.	1391098800	428925575139713024	f	neaexpress
Commuters, how are you dealing with the Super Bowl traffic bump?	1391094933	428909352846913536	f	neaexpress
Waste management picks their first sustainability challenge winner: http://t.co/Mflx7Wj6vD	1391090729	428891720357793793	f	neaexpress
Good Morning, New York! Noticing the larger crowds yet?	1391086829	428875364044382208	f	neaexpress
We're not at our usual spot, folks. Find us at 55th bet 6th &amp; 7th	1391191673	429315109752557568	f	kimchitruck
Wish Super Bowl parties had Margheritas with the Margaritas? It's your lucky week: http://t.co/gxcZ5B30Km	1391031090	428641576521572352	f	neaexpress
Great food cures hunger, stress, and the common cold (we might have to double-check the last one).	1391026839	428623748867301378	f	neaexpress
Great pizza's an art we have down to a science.	1391022954	428607453409058816	f	neaexpress
55th off Broadway today! Open for lunch at 11-3:00!	1391181441	429272196461367297	f	grillonwheelsny
46th off 6th today #shawarma #schnitzel #yummy	1391095273	428910782341189633	f	grillonwheelsny
@YeahThatsKosher yes that's the plan for our regular schedule. This week there may be changes because of the closures for Super Bowl week.	1391039345	428676199515435008	f	grillonwheelsny
55th off Broadway today! Open for lunch at 11-3:00!	1391008280	428545907215589376	f	grillonwheelsny
Come try our couscous topped with cooked vegetables platter, with your choice of meat!	1390920473	428177616622071808	f	grillonwheelsny
Don't let the cold  get u down, Grill on Wheels is in Midtown! Parked on 47th off Park Ave today! #schnitzel #crazy chicken	1390920087	428175996370829312	f	grillonwheelsny
We are #snowedin today. Hope to see u tomorrow for lunch!	1390404911	426015193936977920	f	grillonwheelsny
Don't let the snow get u down, Grill on Wheels is in Midtown! Parked on 47th off Park Ave today! #schnitzel #crazy chicken	1390315905	425641872208723968	f	grillonwheelsny
Grill on Wheels on 46th off 6th Ave today!! Open for lunch 	1389970284	424192234129727488	f	grillonwheelsny
@TheRealTaz thanks for the love! Next week same day!!	1389882029	423822064689352704	f	grillonwheelsny
Grill on Wheels at 36 st off Broadway! Join us for some mouth-watering kosher grill!!! Open from 11:00-3:00	1389881947	423821723478532096	f	grillonwheelsny
55th off Broadway today! Open for lunch at 11-3:00!	1389792373	423446023617662976	f	grillonwheelsny
Lentil soup on the menu today! ;-)-	1389717914	423133717314666496	f	grillonwheelsny
Crazy for crazy chicken? Come to 47th off Park today! Open from 11-3:00 http://t.co/o4HTvuofSM	1389709287	423097532273922049	f	grillonwheelsny
Craving schnitzel? or maybe shawarma?\nParked on 46th between 5/6th ave today!  Open for lunch from 11-3:00.	1389623333	422737017756483584	f	grillonwheelsny
Shabbat shalom! C u on Monday BH'	1389366485	421659716637691904	f	grillonwheelsny
Due to the weather conditions, Grill on Wheels will not be on the road today!	1389017206	420194733819166720	f	grillonwheelsny
Come try our couscous topped with cooked vegetables platter, with your choice of meat!	1388676648	418766333065834496	f	grillonwheelsny
46th off 6th today #shawarma #schnitzel #yummy	1388676604	418766146385772544	f	grillonwheelsny
Happy New Year! We r on 22th and 5th today!	1388519550	418107415331344384	f	grillonwheelsny
@CDIdiamond where are you located?	1391196407	429334969253916672	f	domotaco
Sorry guys...had to close early courtesy of nypd.  We'll try again next friday. Have a great weekend!	1391194535	429327116920836097	f	domotaco
49th and 6th today for lunch.  Perfect day for #burritos and #nachotots	1391181614	429272922394746880	f	domotaco
53rd and park for tacos, burritos, and bowls. #comegetsome #midtown #nyc	1391096798	428917175517081600	f	domotaco
49th and 6th today for lunch! Come by for a free kimchi fried rice upgrade on bowls and burritos!	1390834086	427815283135221761	f	domotaco
We will not be out today due to the frigid weather! stay warm NYC. See you next week!	1390578374	426742750214512640	f	domotaco
it's been awhile... but w are back on 53rd/park on this freezing day! come out and support us!!! #tacos #burritos #nyc	1390492174	426381199351627776	f	domotaco
we are back on 55th and broadway on this snowy day! #tacos #burritos #ricebowls	1390318655	425653409606156288	f	domotaco
55th Broadway!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!	1390308644	425611420743368705	f	domotaco
Sorry we haven't been out! Now we're back and ready to serve! Come by 49th and 6th for lunch. :) #tgif wooohoooooo	1389971173	424195961775075328	f	domotaco
@grardb we will be back soon enough!	1389889012	423851356915773440	f	domotaco
We are back!! 50th and 6th today, come by for some taco fix! :)	1389610783	422684378100015104	f	domotaco
#FF @mooshugrill @biandangnyc  @dumbolot #followfriday	1389370689	421677350380908544	f	domotaco
@laura_palumbo not yet. hopefully by next week!	1389370389	421676092840493056	f	domotaco
@iamcolossus yes. we are still doing maintenance! sorry	1389322728	421476187828137984	f	domotaco
Truck has mechanical issues and won't be out today. #sadface have a happy holiday!	1387805894	415114125027446784	f	domotaco
49th and 6th!!! Our last week here til after the new years !! Come grab some yummmy food before the holidays!!... http://t.co/vxH9DgHqht	1387542658	414010033685295104	f	domotaco
53rd and park !!!! BUY one burrito for the price of TWO and get one FREE !! LOLOL  winkwink *	1387467290	413693915531718656	f	domotaco
@ryankanno we are at the @dumbolot	1387390405	413371439337984000	f	domotaco
New spot today! Don't let the cold weather stop you from coming by King and Varrick. The warm, yummy and mouth... http://t.co/l7KHujCboV	1387287192	412938530868838401	f	domotaco
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
@34x27 Nah! We cant wait to shower #midtown with cheese next week. We'll see you when this Super Bowl madness is over!	1391194539	429327131743895553	f	morristruck
Another day at the #BudLightHotel #NYSuperBowl #XLVIII #eatmorecheese	1391184137	429283504761757697	f	morristruck
We're at the #BudLightHotel again today, feeding hungry football fans! #NYSuperBowl #XLVIII	1391097934	428921940187701248	f	morristruck
@nellcasey We haven't! So sorry that our January schedule has really screwed up our Wednesdays, but we'll be back soon, promise!	1391036905	428665966252138496	f	morristruck
It's almost #SuperBowl time! We're going to be at the #BudLightHotel today till Saturday, we'll see you there or see you after #XLVIII!	1391009211	428549810656776192	f	morristruck
No lunch today, but come check us out @RoyalPalmsClub tonight for #shuffleboard and #cheese! #grillyerbiscuits	1390921502	428181932854509568	f	morristruck
Off the streets today, sorry folks! But hey, on the bright side, @gladysnybk is open for dinner! #youcanstilleatwell	1390835445	427820984830136320	f	morristruck
Very excited to be live on Fox with our friends @BarkHotDogs and @EatMeaty! Just talkin' #chilifest NBD.	1390744636	427440104307949568	f	morristruck
No @BrookfieldPLNY lot today, sorry folks! #seeyounextweek	1390581560	426756113749393409	f	morristruck
@jameslucas @abmansfield There's not excuse! We dream of our triumphant return to DUMBO. See you soon guys, promise.	1390498824	426409090198155264	f	morristruck
@XTRA__ Jarren, we want this to be in your mouth as much as you do. See you soon, promise. http://t.co/KHi9xNae6y	1390498710	426408612853207040	f	morristruck
Hey folks, we're taking the cold as a sign that it's time to get some mid-winter maintenance. Back on the streets soon!	1390492928	426384362511167488	f	morristruck
@abmansfield Don't lose faith in us, Abigail! Next week, next week.	1390407069	426024245224026112	f	morristruck
It might not be a #snowday for NYC schools, but it is for us! Sorry @DumboNYC!	1390406014	426019818454908928	f	morristruck
Had so much fun flippin' cheese for the @NBCUniversal crew today. You guys are nuts!	1390334098	425718180263497729	f	morristruck
RT @mikenewberg: The Daily Chu, with @TheDomino. Food truck edition, with habanero chicken grilled cheese from @morristruck http://t.co/Lm5...	1390333989	425717724841775105	f	morristruck
Hey folks, we're across the river in Englewood NJ @NBCUniversal for lunch! #bravethesnow #eatcheese	1390320149	425659676819456000	f	morristruck
Apologies to all you big time cheesers- we're closed for a private event today. Stay tuned for the weeks schedule, and come to @gladysnybk !	1390233762	425297339876515840	f	morristruck
@anoddsuperhero We will meet again and again and again and again and again- no fear!	1390076542	424637913872498688	f	morristruck
Day 2 of our private event- no regular lunch today, sorry folks!	1389974504	424209933794418688	f	morristruck
#Lunch is upon us! @starrett601 26&amp;11th Try the vodka sauce today!	1391188822	429303151598907392	f	valduccis
Thinking about #Lunch? #Hungry? Which will you choose? Penne Vodka Too!26th&amp;11th @starrett601 http://t.co/2OZasQumpl	1391181810	429273741663555584	f	valduccis
#GettingMarried? #AfterParties are our specialty! Pizza,Zepolle, CandyApples! Finish your night right! http://t.co/juzggdS6tP	1391181415	429272084951228416	f	valduccis
#HappyFriday #NYC ! 26ht&amp;11th! @starrett601 Pasta/Vodka Sauce!!! AreYouInForATreat! #Lunch!	1391180473	429268134185291777	f	valduccis
#Happy #Friday @starrett601 Pasta with Vodka Sauce! #Pizza! Come and Get It!	1391180213	429267043905331200	f	valduccis
RT @starrett601: Yum, eat up! RT @Valduccis: #HappyFriday @starrett601 Today we are featuring #Pasta with VodkaSauce in addition to our #Pi...	1391175398	429246849191804928	f	valduccis
#HappyFriday @starrett601 Today we are featuring #Pasta with VodkaSauce in addition to our #Pizza menu! Eat up! Enjoy!	1391173950	429240774723522561	f	valduccis
RT @starrett601: One of our favorite tenants from today's food event w/ @gofooda, @TakumiTacoNY, @juicepirate, @Valduccis &amp; @gcnyc1! http:/...	1391114615	428991907004694528	f	valduccis
RT @restaurantbuzz1: Check out @Valduccis for their famous #NYpizza - named best pizza 5 times by @NYDailyNews - they also specialize in de...	1391114578	428991749797990401	f	valduccis
RT @starrett601: Yes!! RT @juicepirate @starrett601 thx 4 organizing yesterday's #giveaway! Let's do it again sometime! @TakumiTacoNY @gofo...	1391114540	428991590842257408	f	valduccis
RT @starrett601: Now that makes our Friday! RT @Valduccis See you tomorrow @starrett601. Prepping those chicken rolls just for you! http://...	1391114531	428991553894612993	f	valduccis
RT @WebsterHall: Kickoff your Superbowl weekend with FUNKMASTER FLEX on Thursday! Ladies FREE all night!! http://t.co/CBBHwK5jYT	1391102062	428939255365505024	f	valduccis
RT @juicepirate: @starrett601 thanks for organizing yesterday's fun #giveaway! Let's do it again sometime! @TakumiTacoNY @fooda @Valduccis ...	1391101820	428938240985276417	f	valduccis
See you tomorrow @starrett601 . Prepping those chicken rolls just for you! http://t.co/URgmTwyRFs	1391097661	428920797030543362	f	valduccis
RT @SavvyMommy: @starrett601 @gofooda @TakumiTacoNY @juicepirate @Valduccis @gcnyc1 love it!!!!	1391049201	428717539003088896	f	valduccis
RT @StomachCakes: Holy freaking chocolate overload ! The goat cheese mascarpone cream filling sends cake to another universe! http://t.co/9...	1391045834	428703417788559360	f	valduccis
RT @dranzino: Free food @starrett601 4th floor today. The @Valduccis Pizza guy's outfit and personality made it... http://t.co/V15H4DEis9	1391023313	428608958425600000	f	valduccis
RT @garriguscarraig: Delicious #basilchicken from @biandangnyc ; there's still time!	1390851583	427888672160370688	f	biandangnyc
RT @starrett601: Digging the powder blue! RT @dranzino Free food @starrett601 today. @Valduccis guy's outfit &amp; personality made it. http://...	1391020493	428597129204879360	f	valduccis
Check us out @starrett601 food pop up! Penne vodka is on the menu!	1391015817	428577516119273473	f	valduccis
RT @nycfoodtruck: RT @starrett601: Hungry? Food event TMRO at #starrettlehigh w/ @Valduccis, @TakumiTacoNY, @gcnyc1, @juicepirate, etc. htt...	1391015569	428576479442501632	f	valduccis
Gd Mrng Dumbo Come join your favorite food truck on Jay str &amp; Water str. Yes we are back... Try Our Yummy Ajiaco Soup Of The Day... C U HERE	1391178938	429261695597678592	f	palenquefood
It's cold outside but hot inside here at smorsgarburg! Come and try our delicious home made food! N5 &amp; Whythe http://t.co/Od8VcgrMEf	1390748436	427456041413259264	f	palenquefood
@BrooklynFlea It's Saturday come to Brooklyn Paola 	1390673846	427143188672151553	f	palenquefood
What better for a cold day than an ajiaco and an arepa on the side! @BrooklynFlea N5 btw Berry and Whythe http://t.co/57NDygIRK8	1390670394	427128707783086080	f	palenquefood
It is freeze but Palenque is here Water st &amp; Jay st ( Dumbo)	1390581860	426757368937185281	f	palenquefood
Today we are on Varick street and Charlton street with your favorite AREPAS!!! Come enjoy our lovely soups too... Good Beautiful Day Folks	1390229511	425279511203430400	f	palenquefood
 Sunny day come to Smorgasburg!!\nHot aguapanela, Honguisa multigrain arepa &amp; Soup mmmm deli!!!! http://t.co/mXT0rn8tfp	1390147473	424935421043556352	f	palenquefood
Hungover? Cold? Come have one of our hot soups and arepas at the @bkflea... N5 and wythe	1390061813	424576135289393152	f	palenquefood
Good Morning Grand Army Plaza. Come Enjoy Your Favorite Food Truck Palenque!!!  We Are Here Arepa Lovers. Snow, Rain or Sun We Are Here...	1390060973	424572611302264832	f	palenquefood
@dumbolot @DUMBOFoodTrucks palenque is here to prepare your lunch: soup, rice platter and arepas! Delicious Paisas come to jay st &amp; Water st	1389969891	424190587584409600	f	palenquefood
Here we are WFC, with soup, rice &amp; beans and Arepas! North end &amp; Vesey st! Come Join Us, For A Delightful Lunch Paisa...	1389887323	423844270366552064	f	palenquefood
Today we are on Varick street and Charlton street with your favorite AREPAS!!! Come enjoy our lovely soups too... Good Beautiful Day Folks	1389797776	423468683034652672	f	palenquefood
A lil Wet Today, I bet a nice Soup will be great for ur tummy, join us @ WALL STREET, between Hanover &amp; Pearl street... AREPAS come join us	1389713769	423116332608290817	f	palenquefood
@gfreefun @gfbird @chickpeanolive . All we have @ smorgasburg is gluten free, but the organic chipotle chorizo! Come and try it! :)	1389706503	423085857294548992	f	palenquefood
Come to Smorsgasburg and enjoy a delicious Colombian hot soup! (Ajiaco, sancocho and lentil soup)\nNorth 5 btw Berry and Wythe.	1389459347	422049208309645312	f	palenquefood
Gd Mrng Dumbo Come join your favorite food truck on Jay str &amp; Water str. Yes we are back... try our Famous Colombian Soups &amp; Rice Platters..	1389368329	421667454151327745	f	palenquefood
Good Morning NY, Come join your favorite food truck @ WFC  yes we are back... try our Famous Colombian Soups &amp; Rice Platters...	1389279990	421296932854968320	f	palenquefood
Good Morning NYC, We Are Back!!! Ur Favorite Arepas are back on the corner of Varick Str. &amp; Charlton Str... It's Cold, But our food is Hot!!	1389191621	420926284743868416	f	palenquefood
Lindos palenqueros@ smorgasburg with quinoa chipotle chorizo arepa! http://t.co/kDra9XLXBj	1387746486	414864948523978752	f	palenquefood
Good Morning Grand Army Plaza. Come Enjoy Your Favorite Food Truck Palenque!!!  We Are Here Arepa Lovers. Merry Christmas &amp; A Happy New Year	1387638440	414411771253125120	f	palenquefood
Done for the day! Good weekend yall	1391198420	429343411192479744	f	korillabbq
RT @sohyunlim: @NikeLA #masterpiece "kobe evolution" http://t.co/A67uMq6cvm	1391185311	429288425750278144	f	korillabbq
Catch us for lunch today at Dumbo lot (Front &amp; Jay St.)!	1391182428	429276336331702272	f	korillabbq
Sold out already! Midtown is a beast	1391107078	428960294606749696	f	korillabbq
47th &amp; park ready at 11:30. Come get some midtown!	1391098523	428924413221015552	f	korillabbq
Done in FiDi! Keep warm guys!	1391025206	428616896297308161	f	korillabbq
Gmorning FiDi! We're ready for ya @Front &amp; Gouverneur!	1391012938	428565440651345921	f	korillabbq
Headed to FiDi's Front St &amp; Gouveneur Ln!	1391007431	428542344905117696	f	korillabbq
SoHo's Varick &amp; Vandam ready at 11:30	1390924696	428195327074897920	f	korillabbq
Headed to SoHo's Varick &amp; Vandam!	1390923071	428188514032037888	f	korillabbq
@linhieta Wednesdays!	1390918788	428170549177896960	f	korillabbq
We made it. RT@Kal_Hassan: Y'all good now? @KorillaBBQ http://t.co/ryAaCb1oAb	1390859848	427923337588006912	f	korillabbq
Open for dinner at 116th &amp; Amsterdam	1390859060	427920029750165505	f	korillabbq
116th &amp; Amsterdam here all day come get some!	1390839500	427837991311405056	f	korillabbq
Sorry! one block south of our normal spot on Front &amp; Gold st. Not Front and Jay	1390587473	426780912463147008	f	korillabbq
Just up the block from our regular spot Parked on Front &amp; Jay st ready at 11:45!	1390579801	426748732764594176	f	korillabbq
Headed to Fidi Front St &amp; Gouveneur Ln!	1390575590	426731073570353152	f	korillabbq
Headed to FiDi. Front &amp; Gouveneur for lunch. See you soon	1390575464	426730544492449792	f	korillabbq
Sorry guys. Done for the day.	1390504040	426430969483382784	f	korillabbq
Sorry Midtown, truck 2's frozen over. We'll have to see you next week :(	1390495794	426396384028557312	f	korillabbq
Oh yeah....happy chinese new year!!! Have a great and prosperous year! #horse #cny #nyc	1391183569	429281121562415104	f	biandangnyc
53rd and park #tgif. No specials today but joanna is here!!!	1391183178	429279481849593856	f	biandangnyc
RT @StreetGrubSteve: Prepping for tonight's feast! 7-midnight @ZuckerBakery http://t.co/XEvsbvWPk5	1391125859	429039069126217729	f	biandangnyc
RT @zontee_hou: Ooh, @biandangnyc is on @Seamless?! Can't wait for my #Taiwanese food... Love it!!	1391113990	428989284809707520	f	biandangnyc
RT @zipbow: Just found out @biandangnyc delivers in Brooklyn! In my giddiness I may have over-estimated my appetite. Great find for the new...	1391113982	428989253570555904	f	biandangnyc
Check out @domotaco ! Here's a #falafel #ricebowl http://t.co/YqXdrAc1SQ	1391105896	428955337928892417	f	biandangnyc
RT @ZhaPanAsian: Celebrate the Lunar New Year with us tonight @ZuckerBakery with a HOT new special! Here's a peek* http://t.co/IUQQjsxdGF	1391095463	428911577551892481	f	biandangnyc
53rd and park! We have #basilchicken!	1391093500	428903342698291201	f	biandangnyc
53rd and park! #humpday # wednesday	1391008633	428547385040461824	f	biandangnyc
53rd and park. come try our #basilchicken #taiwan!	1390921180	428180582913175552	f	biandangnyc
@square I need help with online square market. Please have someone email me at diana@biandangnyc.com! Thanks.	1390851562	427888584402534402	f	biandangnyc
#threecupchicken aka #basilchicken aka #sanbeiji today at 53rd/park from 11:30-2:30 for $6!!!	1390834370	427816474539864064	f	biandangnyc
53rd and park!!! who's got the mondays?!? remember, we have the #basilchicken #threecupchicken #sanbeiji special today for... $6!	1390834202	427815771113148416	f	biandangnyc
Serving #threecupchicken, aka #basilchicken tomorrow! #comegetsome #taiwanese # #sanbeiji #nyc http://t.co/lDDimOAKre	1390789456	427628091926532096	f	biandangnyc
Serving #threecupchicken, aka #basilchicken tomorrow! #comegetsome #taiwanese # #sanbeiji #nyc http://t.co/ks3CQhWhAj	1390789419	427627937622265856	f	biandangnyc
Prepping #porkbelly for @mooshugrill! Check them out at http://t.co/AI9go4ka6F! #taiwanese #wuhuarou http://t.co/Bay4kX7XXt	1390753828	427478656261185536	f	biandangnyc
#tgif 53rd and park! stay warm	1390578397	426742845811073025	f	biandangnyc
53rd and park. Stay warm nyc	1390493269	426385792345190400	f	biandangnyc
53rd and park! Brrr. Stay warm #nyc!	1390492261	426381564683902976	f	biandangnyc
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
RT @DiscoverSelf: Popcorn Lovers here?\nWe're having a $20 Gift Card to Brooklyn Popcorn as part of this HUGE $250 giveaway prize!... http:/...	1390963799	428359339586633728	f	brooklynpopcorn
RT @DosHig: I think my household keeps the popcorn industry in business. But @BrooklynPopcorn in particular. #addicts  #garliccheddarmix	1390936741	428245849605279744	f	brooklynpopcorn
RT @KumaBaity: Kuma's Take on Brooklyn Popcorn Co. http://t.co/lfg2FH1KU5	1390936713	428245732584194048	f	brooklynpopcorn
@superbowl is more exciting when its paired with #groumet #popcorn from @BrooklynPopcorn - enjoy 20% off all flavors	1390879857	428007259990274048	f	brooklynpopcorn
Juan Pablo @Thebachelor should be feed the girls #gourmet #popcorn not octopus	1390878570	428001864051736576	f	brooklynpopcorn
RT @MrsJessicaS: Watching #TheBachelor &amp; snacking on @BrooklynPopcorn that just arrived. #Yum! #ReviewOnBlogSoon #Blogger	1390878515	428001631406669825	f	brooklynpopcorn
RT @Chris_NicoleX: @sav_simonetti you have to try Brooklyn popcorn I had it Monday in soho	1390878461	428001404842938368	f	brooklynpopcorn
RT @jonbonjovious: Brooklyn Popcorn Gourmet Popcorn with Umph!\nhttp://t.co/fsgnT0vj2A\n\nWho wants a giveaway for a tin of this... http://t.c...	1390878445	428001339088834560	f	brooklynpopcorn
@ParentingAuthor Thanks Susan!	1390878428	428001265147076608	f	brooklynpopcorn
@KumaBaity This is awesome thanks Quan	1390878415	428001213385162752	f	brooklynpopcorn
RT @InfiniteMidnite: Enter to Win a $20 E-Gift Card to Shop at @BrooklynPopcorn on @TwoClassyChics Blog Ends 2/04 #Giveaways #ad http://t.c...	1390878370	428001023849164800	f	brooklynpopcorn
RT @DianaS58: Looking for a twist on a old time favorite #snack ? @BrooklynPopcorn has just what your looking for! #win http://t.co/PHBmqMr...	1390878368	428001016362311681	f	brooklynpopcorn
RT @sd4david: Enter to Win a $20 E-Gift Card to Shop at @BrooklynPopcorn on @TwoClassyChics Blog Ends 2/04 #Giveaways #ad http://t.co/PE6y5...	1390878365	428001002642751488	f	brooklynpopcorn
@MrsJessicaS Thats awesome! Who knew the Opera girl would be in Juan Pablo	1390878355	428000959847882752	f	brooklynpopcorn
RT @NatNattyNatalie: #BeMine Valentine #Giveaway ~ Enter to #win a $20 @BrooklynPopcorn Gift Card! Check out their yummy flavors! http://t....	1390878324	428000831762628609	f	brooklynpopcorn
RT @HaveSippy: Delicious Gourmet Popcorn from Brooklyn Popcorn http://t.co/OMzdMx79Vt via @TwoClassyChics	1390603408	426847748302729216	f	brooklynpopcorn
@Chris_NicoleX @sav_simonetti We'll be there again this weekend	1390603384	426847648046276608	f	brooklynpopcorn
#gourmet #popcorn #giveaway FREE Popcorn if you guess who will win the SuperBowl https://t.co/ccJAQwuAMF	1390603259	426847122168639489	f	brooklynpopcorn
RT @sweetsavoryeats: Still time to enter my Brooklyn Popcorn Giveaway!  I'll be picking a winner tomorrow morning.  Good luck!... http://t....	1390579925	426749255152189441	f	brooklynpopcorn
@Macrotots @lovemykids009 Hi Henri - we got you covered, we ship to Seattle!	1390578148	426741800380821506	f	brooklynpopcorn
RT @KeniThacker: @DJDway @Beckster413 @PhilsSteaks #win	1391199878	429349526416408577	f	philssteaks
RT @justyniak: @PhilsSteaks Seems like you have a new fan  yay ! http://t.co/4K68oImwPF	1391199874	429349509429493761	f	philssteaks
RT @TatianaKing: Today just turned into an awesome #cheesesteak day! Thank God for @PhilsSteaks Truck!!!	1391198555	429343977801015296	f	philssteaks
RT @justyniak: @PhilsSteaks Sending a friend over ! It's his first time ! =))	1391186722	429294345003737088	f	philssteaks
@justyniak ooh a phils first-timer! Thx Justyna!	1391186711	429294297457119232	f	philssteaks
@ElTopoUK sounds like a plan!	1391186681	429294171292463104	f	philssteaks
When lunch calls, answer it with cheesesteaks! It's Phil's Phriday - come out to 51st btw Park n Madison til 2!	1391184216	429283832701808641	f	philssteaks
It's Super Bowl wknd! Who do you think is gonna win it? Denver or Seattle? Offense or Defense? Peyton or Beast Mode?	1391182090	429274918438830080	f	philssteaks
51st btw Park n Madison for this Super Phil's Phriday! Breakfast til 11. Lunch til 2. Get your Phil!	1391174117	429241477219491840	f	philssteaks
NYU dinner! W 4th n Greene open now	1391114083	428989675605209088	f	philssteaks
RT @SKankaansyrja: @restaurantbuzz1 @PhilsSteaks See you in a week, can't wait!	1391109545	428970641937948672	f	philssteaks
RT @KeniThacker: When @PhilsSteaks is in your hood bow in the presence of delicious greatness #yumm	1391109529	428970575449821184	f	philssteaks
RT @restaurantbuzz1: go out and try one of @PhilsSteaks classic #cheeseSteaks-- one of the best steaks that NYC has to offer!	1391103225	428944133580156930	f	philssteaks
RT @KeniThacker: @PhilsSteaks #HYFR it's been to long!	1391101662	428937578692476928	f	philssteaks
@Bobby_Moses tomorrow!	1391101466	428936756227215361	f	philssteaks
@franklinshepard love to hear that thanks mark!	1391101354	428936286154788864	f	philssteaks
RT @franklinshepard: @PhilsSteaks Also, that breakfast sandwich yesterday was probably the greatest thing I've ever eaten. So delicious!	1391101341	428936232417390592	f	philssteaks
Moved around the corner to 46 n Vanderbilt - lunch til 2. Where's Chuck D??? We need him - Fight the power!	1391099757	428929586123272192	f	philssteaks
@RawdawgMcgraw yes Booo to that and Booo to the NYPD for making us move from 47th.	1391098796	428925558328926208	f	philssteaks
47th btw Park n Madison today for breakfast til 11 and lunch til 2. Come on midtown east-ers and get your Phil!	1391089727	428887517614444544	f	philssteaks
happy chinese new year! we're at wall &amp; william celebrating (kind of). Gung Hay Fat Choi y'all!	1391186669	429294124668162048	f	milktrucknyc
Bessie's at Wall &amp; William, call (646) 504-6455 to pre-order or http://t.co/IwkqcCHPzF. Sandwich menu always at @houstonhallnyc	1391180452	429268048868945920	f	milktrucknyc
slight change of plans today! bessie's headed to 24th &amp; park ave. flatironers! pre-order 6465046455 or o/l http://t.co/ZuexOpvZJD 11:30--3	1391097999	428922215677972480	f	milktrucknyc
Bessie's at North End Ave &amp; Vesey, call (646) 504-6455 to pre-order. Sandwich menu at @houstonhallnyc	1391094051	428905656574177281	f	milktrucknyc
Bessie's at 58th &amp; Mad, call (646) 504-6455 to pre-order or http://t.co/IwkqcCHPzF. Sandwich menu always at @houstonhallnyc	1391007650	428543261423071236	f	milktrucknyc
we're at wall &amp; william today fidi!! preorder at 6465046455 or http://t.co/psDZsxYjzF. classic combo anyone?	1390925708	428199574252310528	f	milktrucknyc
@jonthescott thanks!!! glad to be back.	1390854692	427901712150454272	f	milktrucknyc
@irenachoistern :)	1390854571	427901204954234880	f	milktrucknyc
RT @irenachoistern: Just discovered @milktrucknyc thanks to J-School classmate Abby Beshkin. Grilled cheese and tomato soup on Mondays, CU ...	1390851589	427888694469861376	f	milktrucknyc
RT @jonthescott: @milktrucknyc sooooo glad you're back at Columbia today! that bacon cheddar blue (plus choc shake) was the best!	1390851585	427888678871240705	f	milktrucknyc
Hey @SashaLamb, we aren't sure, but you'll be the first to know when we're back!	1390844942	427860817745559552	f	milktrucknyc
RT @lch142: @milktrucknyc @Columbia @houstonhallnyc @SlamHenderson i could go for a grilled cheese today and some tomato soup	1390844796	427860205507215361	f	milktrucknyc
nice day yay! come celebrate it. we're @columbia on amsterdam/117th. call ahead 6465046455 or http://t.co/IwkqcCHPzF.	1390843474	427854658271342592	f	milktrucknyc
Bessie back at @Columbia, call (646) 504-6455 to pre-order or http://t.co/IwkqcCHPzF. Sandwich menu always @houstonhallnyc	1390834846	427818471817097220	f	milktrucknyc
what's left of a tasty braise with white beans and roasted carrots. http://t.co/Kp8Jx0WVNh	1390784222	427606138654576640	f	milktrucknyc
Stand at @bkflea @smorgasburg indoor winter market, North 5th &amp; Wythe. Sandwich menu always at @houstonhallnyc	1390748445	427456078184341506	f	milktrucknyc
tomato soup. turkey chili. bacon cheddar blue. mac &amp; cheese. take that, deep freeze. @bkflea, @houstonhallnyc and on truck in tribeca today.	1390675212	427148917684576257	f	milktrucknyc
Indoor stand at @bkflea @smorgasburg winter market, North 5th &amp; Wythe. Sandwich menu always at @houstonhallnyc	1390662044	427093685256208386	f	milktrucknyc
Bessie's at Chambers &amp; Greenwich, call (646) 504-6455 to pre-order or http://t.co/IwkqcCHPzF.	1390662043	427093684224393217	f	milktrucknyc
RT @NikaIsaGoddess: @milktrucknyc @houstonhallnyc yassssssss	1390586029	426774856706048000	f	milktrucknyc
Happy new years @biandangnyc!	1391177687	429256451664916480	f	mooshugrill
Feeling hoarse? #MSG got your #ChineseNewYear lunch covered on 50th &amp; 6th! #GongXiFaCai #HongBaoNaLai #allredeverything #nomsgtho	1391173999	429240981129822208	f	mooshugrill
@SSDESTO Dope bro hope you enjoyed!	1391173639	429239471008382977	f	mooshugrill
S'been awhile @randomfoodtruck! On 55th &amp; B'way slingin #MSG to the masses today! #nomsgtho	1391094053	428905661947478016	f	mooshugrill
Back at it on Jay &amp; Water for a double dose of @dumbolot this week! #porkbelly #comfortfood #ytotheum	1391010002	428553127500197888	f	mooshugrill
HAPPY 28th New York! Catch the #Lucky8 promo on 49th &amp; 6th today and get a free ricebowl with the purchase of any entree! #Bringyomom	1390922133	428184580731199488	f	mooshugrill
Catch us at @dumbolot on Jay &amp; Water today! No #stickycrabrice today but we got a limited edition #srirachafriedrice for ya:D	1390835698	427822042831151105	f	mooshugrill
We won't be out today so wait til Monday for your #MSG fix! In the meantime stay warm and get ready cus #SrirachaFriedRice is coming...	1390578730	426744240857939970	f	mooshugrill
Studies have shown that a hearty bowl of #porkbelly is #dope on a cold day like today! Come to 45th &amp; 6th ave for some independent research!	1390481908	426338142409723904	f	mooshugrill
And here I thought we made it to spring:( in the meantime come check out #MSG on 49th &amp; 6th!	1390309740	425616015532503040	f	mooshugrill
Taking a break for #MLKDay but we'll be back on the streets tomorrow!	1390233918	425297995786358784	f	mooshugrill
Big ups to @sweetchilinyc for winning @midtownlunch's best new truck poll! (http://t.co/WxQkH3fgFA) And thx Brian, you're our pick too:D	1389967041	424178633964793856	f	mooshugrill
Happy Friday y'all! Cooking up that #porkbelly on 50th &amp; 6th today!	1389966599	424176777419042816	f	mooshugrill
Wake me up when it's #hoodieweather again...	1389966501	424176367463591936	f	mooshugrill
#whoopsie! 45th and 6th ave! sorry guys	1389899470	423895220368199680	f	mooshugrill
45th &amp; 5th ave for lunch today!	1389886108	423839173439913985	f	mooshugrill
Firing up the grill on 55th &amp; Broadway! @randomfoodtruck @midtownlunch	1389794475	423454837192527872	f	mooshugrill
BACK on 50th &amp; 6th! Miss us? Extra #porkbelly and #pekingduck for y'all!	1389715253	423122558037524480	f	mooshugrill
Catch us on the corner of jay &amp; water! @dumbolot @DUMBOFoodTrucks	1389624553	422742135180636160	f	mooshugrill
#FF @biandangnyc  @domotaco @dumbolot #followfriday	1389370700	421677398808338432	f	mooshugrill
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
Have a great Super Bowl weekend everyone!	1391196296	429334502478213120	f	polishcuisine
Open for lunch on 47th b/w Park &amp; Lex - highly anticipated awesome PACZKI w/plum jam &amp; poppyseed cake! open until... http://t.co/jSS1ttG9x3	1391184814	429286344234262529	f	polishcuisine
I posted a new photo to Facebook http://t.co/JfnAGDJLrT	1391184684	429285798849286146	f	polishcuisine
RT @GeekGirlJill: I think I'm going to make my way to @PolishCuisine today for lunch. Seeing these picture are making me miss home.	1391183386	429280351979319296	f	polishcuisine
http://t.co/JzqsCgz79r	1391178731	429260829607735296	f	polishcuisine
http://t.co/uP1VT2ct9v	1391178690	429260657247014912	f	polishcuisine
I posted a new photo to Facebook http://t.co/Nsh4GWZnQm	1391176988	429253517782814720	f	polishcuisine
Happy Friday w/ mouthwatering  traditional dessert today- Paczki w/ plum jam and poppyseed cake! 47th b/w park &amp; lex!	1391176794	429252702598864896	f	polishcuisine
Watch out Midtown East - we will be there tomorrow!	1391137012	429085845178425344	f	polishcuisine
hope you have an amazing rest of the day!	1391113885	428988843032051712	f	polishcuisine
RT @randomfoodtruck: Truck parade! @mikenwillies @PolishCuisine @mooshugrill @TheSteelCart @hibachiheaven @Redhooklobster	1391108528	428966373654810624	f	polishcuisine
We are fully open and fully loaded with deliciousness on 55th and Broadway... Today's special: poppyseed cake! @randomfoodtruck #pierogitime	1391099054	428926641168211968	f	polishcuisine
RT @cruisinwithddub: @PolishCuisine Please come back to the Flatiron district.  I need my fix!!!	1391098833	428925711307784192	f	polishcuisine
I posted a new photo to Facebook http://t.co/LukdSCFdGI	1391098430	428924021527572480	f	polishcuisine
I posted a new photo to Facebook http://t.co/yQ3yClG5FJ	1391098340	428923642714816513	f	polishcuisine
I posted a new photo to Facebook http://t.co/AGoRVIoItw	1391098184	428922988470497280	f	polishcuisine
We are on 55th and broadway today with a wonderful fresh poppyseed cake waiting for you!! Oh yeah!	1391090549	428890967463452672	f	polishcuisine
As per our schedule we will be on 55th and Broadway (Thursday)....with a special dessert surprise! Our MEGA combo's will be sure to please!	1391052103	428729714434641920	f	polishcuisine
thanks for coming! have a great day! #wednesday	1391027347	428625877304213504	f	polishcuisine
@Danosaur5 at some point - definitely - will keep you posted:)	1391026818	428623658014085120	f	polishcuisine
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
RT @DispatchBP: See you for lunch! @BrookfieldPlNY NORTH Lot | North End Ave. &amp; Vesey St. | 11a-3pm | @MorrisTruck @ToumNYC @Schnitznthings...	1391182081	429274879808909313	f	toumnyc
It's #FalafelFriday on North End &amp; Vesey St until 3pm! Is your mouth watering yet? #vegan #LebaneseLunch http://t.co/5lZDeoJDyL	1391178370	429259316135481344	f	toumnyc
RT @BrookfieldPLNY: Food trucks return tomorrow! @morristruck @toumnyc &amp; @schnitznthings at N. End &amp; Vesey. And @ESTacoTruck at S. End &amp; Li...	1391114314	428990643172827136	f	toumnyc
@christinehauer @DUMBOFoodTrucks woohoo! Enjoy :)	1391106938	428959708121415681	f	toumnyc
RT @dumbolot: Happy Thursday! @MexicoBlvd @ToumNYC and @sweetchilinyc in the lot today!	1391105885	428955292089733120	f	toumnyc
@christinehauer @DUMBOFoodTrucks Hi there! Yes we do :)	1391105866	428955209323511808	f	toumnyc
@Mayishka We promise to make an effort to go there on a Tuesday in the near future :) We only do events on the weekend... Sorry :(	1391101965	428938846857068544	f	toumnyc
@Mayishka we're usually there until 3pm.. Sometimes 4pm... Depending in the day	1391099537	428928664148131840	f	toumnyc
Located on 50th between 7th and 7th.\nOnline at http://t.co/6h7IrKccpj	1389280910	421300791618842624	f	thepocketful
@Mayishka So I'm guessing 46th btwn 5th &amp; 6th is too far? We're there on Tuesday's...	1391099089	428926784676302848	f	toumnyc
@Mayishka Nooooo don't go crazy!! Your sanity is necessary to find us :) If our truck doesn't make it by your office, we do cater as well :)	1391099036	428926562789236736	f	toumnyc
@Mayishka Hehe! Where on 8th?	1391096918	428917678116708352	f	toumnyc
We've got a #LebaneseLunch that will make this cold #Thursday a warm one! Join us on Jay &amp; Water in #Dumbo, your tastebuds will thank you!	1391090416	428890407511265280	f	toumnyc
Hello #MidtownEast ! We're on 47th btwn Park &amp; Lexington getting ready to serve up mouthwatering #chicken #shawarma http://t.co/UNJy3p1dXf	1391004183	428528721969303552	f	toumnyc
@linalovesit We are at the Dumbo Lot every Monday and Thursday.	1390934194	428235165656432640	f	toumnyc
Morning folks! We're keeping our truck warm today, just a tad too cold to be out  We'll be back out tomorrow in #MidtownEast #Toodamncold	1390918321	428168587962896384	f	toumnyc
@brianna__marie we're taking off tomorrow because of the freezing cold, but we'll be back on Wednesday on 47th btwn Park &amp; Lexington :)	1390876136	427991652725456896	f	toumnyc
@ClemSchmitt @dumbolot we're on Jay &amp; Water :)	1390848894	427877392598958080	f	toumnyc
RT @dumbolot: We got @ToumNYC in the lot to kick off Monday along with @MexicoBlvd and @mooshugrill!	1390837996	427831681140011009	f	toumnyc
We're in our new Monday spot at the Dumbo lot on Water &amp; Jay, but don't worry we'll still be there on Thursday's as well! #LebaneseLunch	1390832330	427807916238716928	f	toumnyc
The WFC food truck lot is closed today due to frigid temperatures, so our truck is sleeping in. See y'all on Monday in #Dumbo #Isitspringyet	1390572646	426718724130086912	f	toumnyc
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
Hope everyone had a wonderful Christmas! We are serving Lunch on Charlton st &amp; corner of Varick st from 11:30am to 3pm. #OrderOnlineNow	1388074894	416242393227464704	f	freshandhearty
Happy Holidays to everyone! Hope everyone have a safe and jolly Christmas! We are closed for holidays and will be back on the streets Dec 26	1387905662	415532580813807616	f	freshandhearty
Rain Rain go away come back another day! We are serving Lunch on 46st btw 5th &amp; 6th ave from 11:30am to 3pm. #Soups #Salads #Paninis #Wraps	1387808620	415125558968987648	f	freshandhearty
Hope your superbowl dreams come true "@cammcm: @toastmonsternyc Can my Super Bowl dreams get a #RT http://t.co/PbJdcuY1FL".	1390576702	426735737313460224	f	toastmonsternyc
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
23rd and Park today. Come and get em!	1389790932	423439975984926720	f	carpedonutnyc
Toast Monster spotted @5pointznyc. @alneuhauser #5pointz http://t.co/gu3UG0XDt7	1385055153	403576679576375296	f	toastmonsternyc
whoever threw out @c__sull 's toastmonster sammie, please don't do it again.	1384559366	401497199818711040	f	toastmonsternyc
@c__sull . It's true. #true #kaitrue	1384535123	401395515193303040	f	toastmonsternyc
RT @alneuhauser: .@toastmonsternyc to transform into Kaiju next week, serve Japanese rice balls &amp; bowls instead of sandwiches http://t.co/1...	1384533727	401389662671212544	f	toastmonsternyc
Herro 50th and 6th, New York. Today is Toast Monster's last day of the year. Stay toastie! Keep it breezy! Rawr!	1384529054	401370061837201408	f	toastmonsternyc
Last week for Toast Monster 50th and 6th. It's been toasty.	1384442434	401006753124737024	f	toastmonsternyc
Rawr! 47th and Park.	1384362059	400669632513593344	f	toastmonsternyc
Toast Monster spotted somewhere in Midtown. #midtown #lunch #toastmonster	1384358200	400653448120508418	f	toastmonsternyc
50th and 6th, find Toast Monster making new friends in front of chase bank.	1383921298	398820947849129985	f	toastmonsternyc
Food Truck #SuperBowl is on!!!...http://t.co/v4ryJcfKeq http://t.co/CuiXguZ0nw	1391230412	429477594505822208	f	thegreenradish1
RT @nycfoodtruck: The #winterblast has arrived and @thegreenradish1 invites you to join them at it! http://t.co/bw6onsbnH8 Jan. 30th-Feb. 1...	1391228857	429471070962597888	f	thegreenradish1
SuperVeganFood before the SuperBowl..Go RADish!!! http://t.co/0CwyrOptls	1391178638	429260436593459200	f	thegreenradish1
RT @nycfoodtruck: . @thegreenradish1 would love to see you this wknd at the #winterblast! Check out the details here and join them: http://...	1391177921	429257431575973888	f	thegreenradish1
#SuperBowl of Food Trucks http://t.co/0CwyrOptls	1391169240	429221018599952385	f	thegreenradish1
#superfood before the #superbowl http://t.co/DHoGnGDiaE	1391168212	429216707983339520	f	thegreenradish1
#SuperFood before the #SuperBowl http://t.co/rIgUEiFe3R	1391166918	429211279858073600	f	thegreenradish1
#jerseystrong #vegan #organic @thegreenradish1 http://t.co/vufVJvtEY8 #superbowl #winterblast @News12NJDesk @nypost http://t.co/0CwyrOptls	1391144059	429115402527178752	f	thegreenradish1
Get RADish @winterblast http://t.co/6OTUmpctn4	1391143628	429113595733868544	f	thegreenradish1
G-Rad is at #winterblast http://t.co/6OTUmpctn4 http://t.co/FoYes7yUmr	1391143323	429112315909115905	f	thegreenradish1
RT @Aroy_D: Don't miss the Super Bowl of Food Trucks!! http://t.co/4L3lgTUuob	1391089113	428884942022803456	f	thegreenradish1
Super Food @superbowl .... http://t.co/fRQeidkzjG	1391086021	428871973532614656	f	thegreenradish1
RT @nycfoodtruck: Bundle up and join @thegreenradish1 at the #winterblast tomorrow through Saturday! http://t.co/zmG0gTbY8o #foodtrucks	1391045319	428701257432563712	f	thegreenradish1
G-Rad is ready for a Super Party, visit us @winterblast... http://t.co/ZNABlUnCCu	1391045125	428700444055990272	f	thegreenradish1
Mountain of Choc Chunk Cookies for #winterblast http://t.co/TumpXmSjmc	1391025974	428620120685301760	f	thegreenradish1
@DeuceLutui Have a #VeganLunch at #winterblast in Secaucus, NJ #superbowl #Seahawks #DenverBroncos Black Bean Burgers with Melted Onions	1390917391	428164690179399680	f	thegreenradish1
Your lunch is on us, Deuce Lutui!!! http://t.co/PjMDswOV52	1390881527	428014266772226048	f	thegreenradish1
Super Party! http://t.co/tiyvJkLgF5	1390878746	428002601951834112	f	thegreenradish1
RT @nycfoodtruck: Who says this weather &amp; food trucks don't mix? Catch 30, incl. @thegreenradish1, at the #winterblast 1/30-2/1! http://t.c...	1390853812	427898018646736896	f	thegreenradish1
Sorry NYC, we are in the Garden State this week for pre SuperBowl... http://t.co/9ukbdFkmP3	1390790680	427633226740297728	f	thegreenradish1
@justyniak: @bigdsgrub Are you at WFC today ? If so - how long ? We're there now on Tuesdays	1391193583	429323121951506432	f	bigdsgrub
Happy Lunar New Year!\nKung Hei Fat Choy\nGong Xi Fa Cai\n\n http://t.co/WzuUIdU1WY	1391183204	429279591417782272	f	bigdsgrub
Thanks for joining us today.  Much love #MidtownWest!	1391111752	428979896615178240	f	bigdsgrub
RT @nycfoodtruck: Getting married soon? Food trucks make great caterers.... Take a look at the recent celebration @BigDsGrub served! http:/...	1391107946	428963934386028545	f	bigdsgrub
Ready\nGet set\nGRUBBB!\n50th Street btwn 6th and 7th Ave\nPreorders call 646-543-BIGD	1391098205	428923079595937792	f	bigdsgrub
It's that time of the week #MidtownWest! Come n' Grub at 50th Street btwn 6th and 7th Avenue, 11a-2:30p.  Preorders call 646-543-BIGD	1391089935	428888390545981440	f	bigdsgrub
Let us warm you up at Broadway and 56th Street for lunch.  Beat the cold and preorder for pickup by calling 646-543-BIGD @randomfoodtruck	1391007679	428543385520312320	f	bigdsgrub
Closed today due to the excessive heat wave. One could wish right? Stay warm NYC!	1390917858	428166648731033600	f	bigdsgrub
It's WAY too nice out to stay in today. Let's Grub at 50th Street btwn 6th and 7th Avenue, now till' 2:30pm. Preorders call 646-543-BIGD	1390840151	427840720918302720	f	bigdsgrub
Feels like summer is just around the corner! Yet it's only 38 degrees today	1390836572	427825709047111681	f	bigdsgrub
RT @nycfoodtruck: Who says food trucks aren't classy?! @BigDsGrub served guests at this #belvederemansion refined soiree just last wk! http...	1390832982	427810653471252480	f	bigdsgrub
Come n' Grub today at 50th Street btwn 6th and 7th Avenue, 11am to 2:30pm. Preorders call 646-543-BIGD	1390832424	427808312621821952	f	bigdsgrub
What's for lunch tomorrow? #TGIM	1390773405	427560766771048448	f	bigdsgrub
Beat the cold and preorder lunch 646-543-BIGD. 50th Street btwn 6th and 7th Avenue. 11am to 2:30pm! #TGIF	1390577340	426738410137874432	f	bigdsgrub
@CambodianCowboy we're here today!	1390576093	426733181593980928	f	bigdsgrub
RT @nystfood: Hey Everybody! New York Street Food 2.0 Is Coming Soon. Spread The Word. http://t.co/GuMpNFicbj	1390576035	426732939662344192	f	bigdsgrub
Come n' Grub w/ us at 50th Street btwn 6th and 7th Avenue today.  Preorders call 646-543-BIGD #TGIF	1390573616	426722792961478656	f	bigdsgrub
@CambodianCowboy: It is a sad, sad day when your favorite food truck isn't close enough for lunch :( @bigdsgrub Tomorrow!!	1390508304	426448853525860352	f	bigdsgrub
Come n' Grub @Starrett601, we're ready for ya right out front! Preorders call 646-543-BIGD #StarrettLehigh	1390495705	426396011976982528	f	bigdsgrub
Join us today at @Starrett601 for lunch\n26th Street btwn 11th and 12th Avenue\nPreorders call 646-543-BIGD\n#StarrettLehigh	1390485800	426354463830720512	f	bigdsgrub
@TheVeganKitchen reading SALT by Mark Kurlansky right now.  It's fascinating.	1391196668	429336063681626114	f	veganlunchtruck
@Kelc_OBrien I wish.  Still on break for a few weeks	1391177223	429254502039158784	f	veganlunchtruck
RT @veganjobs: The @VeganLunchTruck is looking for Line Cooks, Night Time Bakers and Prep Cooks! Details and application: http://t.co/GKqz9...	1391097301	428919287118831616	f	veganlunchtruck
RT @veganjobs: The @VeganLunchTruck is looking for Line Cooks, Night Time Bakers and Prep Cooks! Apply: http://t.co/GKqz9ApRFH	1390947639	428291557905924096	f	veganlunchtruck
RT @veganjobs: Cinnamon Snail @VeganLunchTruck is hiring full and part-time positions! Details: http://t.co/GKqz9ApRFH	1390786688	427616481711771648	f	veganlunchtruck
A picture of me and the truckt from one of our youngest, favey fans!  The Snail &lt;3 &lt;3 &lt;3 NICO! http://t.co/eKR4401PNQ	1390757058	427492205763522560	f	veganlunchtruck
RT @Domenickdjm: Nico says this is Adam Sobel and the Cinnamon Snail. Yes, we are all going through Snail withdrawal. http://t.co/10dByooXHJ	1390752990	427475141514502144	f	veganlunchtruck
@Domenickdjm that's actually ANAZING	1390752986	427475123990700032	f	veganlunchtruck
@ange_cho we are closed right now for winter break, but watch our twitter.  We usually have 2-3 midtown stops per week.	1390708309	427287737583271936	f	veganlunchtruck
@Hiramcamillo or it better be absurdly inexpensive. These are the sacred trinity.	1390600582	426835896403763200	f	veganlunchtruck
RT @behindfoodcarts: Back our @kickstarter Road Trip for our book: http://t.co/qGIm69q4R2 Some of the NY stops will include @VeganLunchTruc...	1390600340	426834878945312769	f	veganlunchtruck
@countrymouseNYC yay! Congrats on a great, liberating, joyful decision! 	1390495218	426393967908126720	f	veganlunchtruck
Snaily is still off the streets for an other few weeks on winter break, but it's an excellent time to get a yummy... http://t.co/6z9ftwdvgI	1390475917	426313014175092736	f	veganlunchtruck
@rj_c awwww.  I wish! We are on winter break for a few more weeks.  Sorry to miss you.	1390427334	426109239703400450	f	veganlunchtruck
@Jezerific nope.  We are on winter break for another few weeks. Can't wait to be back	1390326358	425685717420093440	f	veganlunchtruck
@onemonthrails very occasionally in Hudson square area if that counts.  Otherwise, closest weekly location is wall st	1390299249	425572015668748288	f	veganlunchtruck
Hiring lots of new full/partime Snailployees for the coming season to work on our trucky.   We can help you... http://t.co/DT2qrcsUuG	1390158480	424981585503338497	f	veganlunchtruck
Here's a throwback:\nVENDY AWARDS 2010! Our first year competing, we dressed as "hot cops".  \n\nOUR MENU FOR THE... http://t.co/Di7ZfY6uLx	1390072459	424620787694596096	f	veganlunchtruck
@JayminTae sometime mid February.  Have you checked out @TerriRestaurant yet?  We miss our FiDi peeps and can't wait to be back!	1389872182	423780765017841664	f	veganlunchtruck
Alex of @BlondieBrownie spotted in French supermarket end cap.  I knew you were living a double life!  http://t.co/yo8Dd5Wc3D	1389825890	423586601902829569	f	veganlunchtruck
Front &amp; Jay Friday! Soups are Sweet Potato Sage / Organic Lentil / Creamy Tomato Basil / Split Pea &amp; Ham. @DUMBOFoodTrucks	1391180197	429266977631109120	f	thesteelcart
Proudly freezing our asses off on 56th &amp; Broadway! Soups are Creamy Tomato Basil / Split Pea &amp; Ham / Organic Lentil. @randomfoodtruck	1391092077	428897373528817665	f	thesteelcart
Off catering today. Will return to 47th next week. Keep warm!	1391005895	428535903360147457	f	thesteelcart
@holyshityouguys Does Uber pick up cereals? We'll  be back in the hood soon.	1390923205	428189074726584320	f	thesteelcart
@holyshityouguys We missed you yesterday! Will be back in Dumbo Friday at the latest. Sooner if the weathers garbage.	1390922790	428187334287585280	f	thesteelcart
@holyshityouguys Broadway &amp; 56th sir.	1390922712	428187005689036800	f	thesteelcart
56th &amp; Broadway through lunch. Soups are Organic Lentil + Split Pea &amp; ham.	1390922636	428186687542681600	f	thesteelcart
Hello from Dumbo! Breakfast and Lunch on Jay &amp; Front.\nSoups: Rustic Chicken Noodle / Creamy Potato / Split Pea &amp; Ham. @DUMBOFoodTrucks	1390830861	427801756761067520	f	thesteelcart
@firefishUS Sorry to have missed you. It's been a tough week with the elements.	1390587133	426779485623812096	f	thesteelcart
@holyshityouguys Sorry Dan, equipment was completely frozen.	1390586790	426778048059674625	f	thesteelcart
Frozen solid, The Cart will be staying in today.	1390574164	426725089913360384	f	thesteelcart
Since it's colder in New York than Nome Alaska, soups today are Rustic Chicken Noodle and Creamy Potato.	1390493526	426386870621069312	f	thesteelcart
RT @CityStitchette: @TheSteelCart Thx for braving the cold &amp; supplying me with delicious oatmeal!	1390489004	426367902129090560	f	thesteelcart
It's a winter wasteland!.. But the food's not bad. - 56th &amp; Broadway.	1390486545	426357588481949696	f	thesteelcart
Sorry to miss you Midtown. Travel is dangerous and it's unclear which snowdrift we've parked under. #polarvortex2 #WhereIsMyPlow	1390401938	426002723168067584	f	thesteelcart
Happy Birthday lil Steel Cart! \nWe're officially one year old today. Endless thanks to our wonderful patrons... http://t.co/rRjP5pQyGZ	1390352508	425795396942569473	f	thesteelcart
@CityStitchette We missed you too! It's getting pretty rough out there so we may be off the street tomorrow. Thursday's looking good though	1390342628	425753958381260800	f	thesteelcart
Thank you brave Dumboans for walking in to the blizzard for soups &amp; sandwiches! You're the best! #DUMBO #snowday	1390340461	425744871300026368	f	thesteelcart
@CalexicoNYC Smart.	1390323797	425674974146613248	f	thesteelcart
Sorry Broadway. The Cart's staying in Brooklyn today because of the storm. Hope to see you on Thursday.	1390311993	425625467811794945	f	thesteelcart
Hello FIDI peeps, lunch 2day @ 7 Hanover sq b/t water st &amp; pearl st. Burger of the week THE MARITAL BLISS preorder 9172929226	1391179919	429265812692942848	f	fritesnmeats
Gmorning peeps, lunch 2day @ 27th st &amp; park av. Burger of the week THE MARITAL BLISS preorder 9172929226	1391094340	428906867851800576	f	fritesnmeats
Hello soho, lunch 2day. @ Hudson &amp; king. Burger of the week THE MARITAL BLISS preorder. 9172929226	1391007875	428544207142526976	f	fritesnmeats
FIDI peeps, we r off the road 2day. C u guys Friday!	1390921089	428180200120004608	f	fritesnmeats
Midtown peeps, due to a private event we will be off the road today:(	1390831596	427804840639864832	f	fritesnmeats
Hello FIDI peeps, lunch 2day @ 7 Hanover sq b/t water st &amp; pearl. Burger of the week THE MARITAL BLIS preorder 9172929226	1390575326	426729964994842624	f	fritesnmeats
@larsericsson braving the cold!! We r not going anywhere :) #soholove	1390494753	426392017820999680	f	fritesnmeats
Hello soho peeps, lunch 2day @ Hudson &amp; king. Burger of the week THE MARITAL BLISS preorder 9172929226	1390489337	426369299604058112	f	fritesnmeats
Soho Peeps, due to the weather we r off the road 2day:( BUT we will be there tomo:)	1390405367	426017106103369728	f	fritesnmeats
@GenFranklnKirby sorry bud, due to the weather we r off the road today	1390405272	426016705018875904	f	fritesnmeats
Hello FIDI, lunch 2day @ 7 Hanover sq b/t water st &amp; pearl. Burger of the week THE SMITHLAND  preorder 9172929226	1389971462	424197177536417792	f	fritesnmeats
@eminencess Thanks! Stop by any time	1389531482	422351767699857408	f	carpedonutnyc
Hello wfc peeps. Lunch 2day @ wfc food truck lot on north end &amp; vesey st. Burger of the week THE SMITHLAND preorder 9172929226	1389885930	423838429294895104	f	fritesnmeats
RT @DispatchBP: . @BrookfieldPLNY NORTH Lot | Thursday, 1/16, 11a-3pm | North End Ave. &amp; Vesey St. | @FritesnMeats @PalenqueFood @MilkTruck...	1389885829	423838006337085440	f	fritesnmeats
Hello soho. Lunch 2day @ Hudson &amp; king. Burger of the week THE SMITHLAND preorder 9172929226	1389799101	423474240328048640	f	fritesnmeats
@DJvinSANITY sorry guys. We will be there on Friday	1389723828	423158521962975232	f	fritesnmeats
FIDI peeps, we r off the road 2day:(	1389713996	423117283826085889	f	fritesnmeats
Hello midtown peeps, lunch 2day @ 50th st b/t 6th &amp; 7th av. Burger of the week THE SMITHLAND preorder. 9172929226	1389625416	422745754055479296	f	fritesnmeats
RT @AquariusGiants1: @fritesnmeats \nHappy New Year to my favorite food truck!	1389380856	421719993215381504	f	fritesnmeats
@AquariusGiants1 aww thx, happy new year:)	1389380848	421719960369778688	f	fritesnmeats
Hello FIDI peeps, lunch 2day @ 7 Hanover sq b/t water st &amp; pearl st. burger of the week THE PLOUGHMAN preorder 9172929226	1389366613	421660256306225152	f	fritesnmeats
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
Sorry, we have been closed due to the deep freeze. Lets hope the weather gets warmer, so we can open again soon.	1390573368	426721751083806720	f	thepocketful
Located in. 52nd between 6th and 7th. Free delivery at http://t.co/6h7IrKccpj	1389971810	424198636428615680	f	thepocketful
Located on 49th between 6th and 7th. Online at http://t.co/6h7IrKccpj	1389887668	423845718261239808	f	thepocketful
Located on 53rd between Park and Madison. Online at http://t.co/6h7IrKccpj	1389801343	423483645039751168	f	thepocketful
Located on 49th between 6th and 7th. Online at http://t.co/6h7IrKccpj	1389713381	423114704345915392	f	thepocketful
Located on Hudson and King!	1389631253	422770236157612032	f	thepocketful
Located on 49th between 6th and 7th. Free delivery at http://t.co/6h7IrKccpj	1389367240	421662885539233792	f	thepocketful
We are open on 53rd between  Park and Madison. Free delivery at http://t.co/6h7IrKccpj	1389196741	420947758821179392	f	thepocketful
Happy Holidays to all. We will be closed I until next week	1388074223	416239577377296385	f	thepocketful
Located on 50th between 6th and 7th. Free delivery at http://t.co/6h7IrKccpj	1387467972	413696776408154112	f	thepocketful
We are closed today. Enjoy the snow and b safe.	1387302990	413004794484514817	f	thepocketful
Located on 55th between 6th and 7th. Online at http://t.co/6h7IrKccpj	1386948334	411517259463798784	f	thepocketful
Located on 50th between 6th and 7th. Online at http://t.co/6h7IrKccpj	1386861941	411154898852790272	f	thepocketful
Located on 53rd and Park Avenue, online ordering is available at http://t.co/gpHpwErWcG	1386780838	410814727862775810	f	thepocketful
Located on Hudson and King streets. Online at http://t.co/6h7IrKccpj	1386004676	407559270369345536	f	thepocketful
Located on 49th between 6th and 7th	1385480434	405360440492175361	f	thepocketful
Loathed on Hudson and King streets. Online at http://t.co/6h7IrKccpj	1385397722	405013519214850048	f	thepocketful
Located on 55th street, between 6th and 7th and online at http://t.co/6h7IrKccpj	1385135166	403912281622593536	f	thepocketful
We couldn't park on 50, so we are on 49th between 6th and 7th.	1385050540	403557332183154688	f	thepocketful
Just tried battered fried cheese curds from Philly Vendys People's choice winners @cowandthecurd .. Holy moly, that was delicious	1391211682	429399033774604288	f	nautimobile
WE OUT HERE IN SECAUCUS.. For the NJ pre Super Bowl winter blast! Today through Saturday	1391110851	428976117371121665	f	nautimobile
@DantePecile glad to be your first!	1391025035	428616179146825728	f	nautimobile
RT @DantePecile: Just had a delicious lobster grilled cheese from @nautimobile in NYC!! My first food truck experience!	1391024972	428615915593551873	f	nautimobile
46th and park today, then we are in Nj for Super Bowl festivities for the rest of the week!	1391007328	428541912799531008	f	nautimobile
@justintravis we are usually off Monday and Tuesdays. 46th and park tomorrow, the nj for the rest of the week for Super Bowl festivities!	1390939410	428257041686487041	f	nautimobile
RT @TheSteelCart: Happy Birthday lil Steel Cart! \nWe're officially one year old today. Endless thanks to our wonderful patrons... http://t....	1390769667	427545090404257793	f	nautimobile
Lobster grilled cheese's are sellin' like hot cakes over here at 67th and broadway. Some would say they're the cat's pajamas.	1390758345	427497603270725632	f	nautimobile
67th and Broadway. Don't mind the Brazilian TV crew filming us today. We're getting used to the limelight, but gotta keep our egos in check	1390668462	427120605809217536	f	nautimobile
We're out here all day, no excuse why you can't step out for lunch. 46th and park, consider this a challenge.	1390575132	426729150502535168	f	nautimobile
Vintage soul and funk in this cold, enjoying our time together at 23rd and park	1390495710	426396032541663232	f	nautimobile
@JamesSpier gotta shovel the girl out of a plowed in garage. Plus, she couldn't have made it through this morning. Nauti is sensitive.	1390411443	426042590342176768	f	nautimobile
Warm you hearts on this snowy night with the new video from @greatcaesarband  http://t.co/uxZjod45jA	1390351664	425791857365647360	f	nautimobile
@heymikewaskom hasn't yet this year. Only way to get things done is do it yo'self	1390350944	425788837101850624	f	nautimobile
Nauti's buried in snow, so we will take off tomorrow and see you Thursday at 23rd and park	1390350693	425787786835542016	f	nautimobile
@CaShmereRiz this is a possibility !	1390245543	425346752464834560	f	nautimobile
@NautiMobile: Hey NJ! We miss you! We will be visiting Jan 30th - Feb 1st! More details here http://t.co/KCRtXCL0cb	1390237691	425313819054059520	f	nautimobile
67th and broadway, around the corner from Julliard.. Have your instrument? 10% off for each spontaneous divertimento performed.	1390151706	424953174190198785	f	nautimobile
Come weasel off of the Apple Stores wifi with us at 67th and broadway!	1390067344	424599333460541440	f	nautimobile
RT @LukesLobster: Have a Winter Blast on 1/31-2/1 w/ @NautiMobile @ExposureNJ! Buy tix for a taste of 25 top food trucks at http://t.co/kG5...	1389990517	424277097029578754	f	nautimobile
Goesting @ Broadway &amp; 66th till 9p	1391212233	429401346848997376	f	waffletruck
Momma Truck @ 7th &amp; Christopher till 1a Kastaar @ Astor Pl till 1a	1391212226	429401317488861184	f	waffletruck
Wafels at night!  \nLe Cafe @ 15 ave B open till 2a \nDe Wafel Cabana @ 35th &amp; Broadway open till 10p	1391212219	429401287168229376	f	waffletruck
@logainne pick that mind up!	1391186539	429293579849039872	f	waffletruck
@KMitche88 we do love to distract.	1391186496	429293397094842368	f	waffletruck
RT @KMitche88: I'll admit it. so distracted by @waffletruck deliciousness #eventstaffproblems https://t.co/toGoDQHdyw	1391186485	429293351092101121	f	waffletruck
@nehtaeh waiting patiently to be discovered.	1391186458	429293237207969792	f	waffletruck
@lizsauraa @SheilaIvanova we're so jam!	1391186434	429293138142720000	f	waffletruck
Give us your hard count for a free dinges! Omaha!	1391183220	429279657486073856	f	waffletruck
Vedette is at 60th &amp; 5th till 6pm \nPagadder is at Brooklyn Bridge/City Hall Park till 5pm	1391182341	429275969455525889	f	waffletruck
Goesting is at Broadway &amp; 66th till 9p Kotmadam is at 5th Ave &amp; 23rd til 7p	1391182328	429275914216546305	f	waffletruck
Momma Truck is at the #BudLightHotel Kastaar is at 40th &amp; Park Ave till 4:30p	1391182320	429275883262574592	f	waffletruck
TGI Friday!  \nLe Cafe @ 15 ave B till 2am \nDe Wafel Cabana @ 35th &amp; Broadway till 9p	1391182303	429275810940194817	f	waffletruck
@netty1001 @Tnyc67 @AdriTrigToursPR that thing makes us glad also.	1391144659	429117921743212544	f	waffletruck
@mocha_kissed88 a little frostbite never hurt nobody #intentionaluseofadoublenegative	1391144611	429117717707124736	f	waffletruck
@justyniak @TavernaKyclades wafels and fish, you say? We do have a salmon wafel at de cafe.	1391144557	429117492984680448	f	waffletruck
@staceymolski one of ours as well.	1391144510	429117295726587905	f	waffletruck
@TomWavy we love the happy wafel dance!	1391144497	429117239199944705	f	waffletruck
@SpecsNdCake tastes. even. beter.	1391144473	429117140688326656	f	waffletruck
@slarkpope Saturday in soho.	1391144457	429117071327100928	f	waffletruck
RT @SuperBowl: Coming to NY/NJ for #SB48 and have questions? Tag your posts with #SBQuestions for official answers!	1391208387	429385216386285568	f	shanghaisogo
First day of the CHINESE NEW YEAR! Shanghai Sogo still serving your meal @Columbia University until 8pm. 2014!.... 	1391204551	429369127430414336	f	shanghaisogo
Done @Hudson/King St. Have a wonderful weekend. We are still moving &amp; serving tomorrow @brooklyn #ParkSlope	1391198640	429344330994950144	f	shanghaisogo
Donuts at Court and Bergen today until 4:30!	1389531368	422351285900550144	f	carpedonutnyc
OMG! Sorry, guys, we sold out of the shanghai tamale already!!! But do not worry! we still have others good stuffs. http://t.co/ufqMv8yPZy	1391190298	429309342769491968	f	shanghaisogo
@MitchSimon yes, we will be back next Tuesday @47th st &amp; park ave. See u there then.	1391190005	429308113444151296	f	shanghaisogo
RT @MitchSimon: @shanghaisogo when are you coming to Park Ave near E51/52? I need some tasty food!	1391189928	429307793846583296	f	shanghaisogo
Happy Friday!! Fans of Shanghai Sogo. We are @Hudson/King St. First day with new spot in downtown. We are still moving &amp; serving! Sogo 4 it!	1391179336	429263366151217152	f	shanghaisogo
OMG!!! All the noodles is SOLD OUT!	1391107521	428962154126245888	f	shanghaisogo
HAPPY CHINESE NEW YEAR ~ THE YEAR OF HORSE! 2014!\n   ....  http://t.co/nXD4ECEb6k	1391099559	428928759316901888	f	shanghaisogo
@shanghaisogo: Shanghai Sogo,,,! http://t.co/hbYqls5Hc2	1391099253	428927474039529472	f	shanghaisogo
don't let the cold weatherprevent U from yr favourite meal. Just ask for"Free Soup Samples" to brighten up this day!	1391091294	428894089829171200	f	shanghaisogo
It is a morning call! We are already on 46th between 5&amp;6th ave!!! Serving ya lunch 11~3pm. See ya real soon! &gt;&gt;SOGO FOR IT &lt;&lt;......	1391090206	428889527907024896	f	shanghaisogo
RT @JoshOchs: "Keep in mind what makes you feel good when youre a customer, and use that in turn with your customers."  http://t.co/6Un02p...	1391019039	428591029915508736	f	shanghaisogo
Yes, We have it!! Because soooo many of you asking for it!! http://t.co/gR9zzVLPsu	1391015795	428577425501732864	f	shanghaisogo
Lunch Time? Shanghai Sogo @116th &amp; Amsterdam here all day until 8pm&gt;&gt;SOGO FOR IT &lt;&lt;......	1391015465	428576042350313472	f	shanghaisogo
RT @Seamless: Bok choy is sometimes called a soup spoon because of the shape of its leaves. #TheMoreYouKnow http://t.co/udAmKjdZAf	1390952495	428311927786582016	f	shanghaisogo
116st&amp;Amsterdam AVE from12pm-8pm,please come and get some food	1390930685	428220449466900481	f	shanghaisogo
http://t.co/1b7XsbPyQR	1390846960	427869282211745792	f	shanghaisogo
:-) It's THAT time of the week #ParkSlope Come n' Sogo at 7th Avenue &amp; Carroll St 11am to 4:30pm. Preorders call 484-469-7646 / 484-4NY-SOGO	1390672449	427137327744290817	f	shanghaisogo
Yes, we are back to you--CU. http://t.co/kgsBpzzSdS	1390511671	426462977236434946	f	shanghaisogo
!!! Fri, Jan 31st 3:30-7pm 18th st &amp; 7th ave!!!	1391200646	429352748346535938	f	thetreatstruck
Happy Friday!!! We'll pick a lunchtime spot &amp; let you know! (no 45th today because of the Super Bowl events Midtown).	1391174964	429245030306693120	f	thetreatstruck
!!! Thurs, Jan 30th 3:30-7pm Bway (86 &amp; 87th)!!!	1391111918	428980596615184385	f	thetreatstruck
Closing at 6:30 instead of 7pm tonight!!!	1391036749	428665314210238464	f	thetreatstruck
!!! Wed, Jan 29th 2-3:30 5th ave (w17th &amp; 18th) then 4-7pm 18th st &amp; 7th ave!!!	1391020781	428598340121821184	f	thetreatstruck
We're going to open later than usual today. Our truck needed a quick adjustment &amp; our prince of a mechanic is fixing it now!	1391013122	428566214924050432	f	thetreatstruck
We'll post spots later this morning. We won't be on 45th this week because of the Super Bowl events Midtown, but we can deliver!!	1391002264	428520672844083200	f	thetreatstruck
!!! Tues, Jan 28th 12:30-2:30 17th st near 5th ave!!!	1390927732	428208061116084225	f	thetreatstruck
On Tues, our truck will be open. We miss our regulars! The cold weather cut back our days, but soon we'll add them all back!	1390839644	427838593655390208	f	thetreatstruck
@MrTmomma thank YOU!!! Happy Bday, Tate! Hooray for birthdays &amp; cupcakes &amp; decorating cookies w/friends! It was so much fun!	1390764835	427524822537871360	f	thetreatstruck
Sun, Jan 26th our shop open 8am-6pm w/food &amp; treats!!!	1390749293	427459636275707904	f	thetreatstruck
Sat, Jan 25th, no truck this weekend! Our shop open w/food&amp;treats&amp;hotchoc&amp; #counterculturecoffee! 8am-7pm 521 court st, Bklyn	1390659764	427084122016972800	f	thetreatstruck
@CostumeContume no truck today! We wish we could, but our pipes &amp; water tanks on the truck are frozen! Hope to be back soon!	1390580885	426753282124824576	f	thetreatstruck
Wed, Jan 22nd, no truck today because of the cold! We'll see you all soon! Have a great day, and keep warm!!!	1390404870	426015022385758208	f	thetreatstruck
...we deliver, too! Call or email if you'd like treats brought to your door!!!	1390331811	425708588863336448	f	thetreatstruck
Snow day!!! We're not sure if we'll be able to take our truck out this week because of the snow &amp; cold, so we'll let you know!	1390331710	425708165536415744	f	thetreatstruck
Martin Luther King Jr. Day! No truck today; Our shop open 7:30am-8pm w/food &amp; treats! 521 Court St #Brooklyn Have a great day!!!	1390225159	425261256820678656	f	thetreatstruck
No truck this weekend! Our shop warm and cozy w/grilled cheese, soup, hot choc, treats!!! 521 Court st #brooklyn  Sat 8am-7pm!!!	1390056357	424553251594575873	f	thetreatstruck
Lots of specials today! (though all treats are special...) Peanut Butter Brownies, Espresso Brownies, Kitchen Sink Crispys!!!	1389977993	424224568157671425	f	thetreatstruck
!!! Fri, Jan 17th 12-3:30 45th &amp; 6th, then 4:30-7pm 18th st &amp; 7th ave!!!	1389972635	424202094556770305	f	thetreatstruck
Today, FIDI solidified their positions within the society.. Today, they became made men.\n\nWe thank you,\n\n-The society	1391202199	429359260976156672	f	disosnyc
Wall st. You know the drill.. #sitdownmeetingsfriday\n\nCall in your orders: 917-756-4145	1391178183	429258528889765888	f	disosnyc
We are off today	1391105971	428955649926381569	f	disosnyc
Disos is off today getting some repairs, we will be back on wall st tomorrow..	1391104177	428948124540104704	f	disosnyc
Down for the day lunch at 47th and Park..\n\n#generatorproblems	1391095362	428911152999854081	f	disosnyc
@jfahys unfortunately we won't be there today, we had generator problems, have to get it repaired	1391094693	428908348801826816	f	disosnyc
We're doing big Super Bowl parties, please get your orders in now for Sunday.. Thanks!	1391018244	428587698249420800	f	disosnyc
@mikeyslice we didn't bail, just switched up our Mondays. We'll be there tomorrow, every Thursday.	1391016606	428580827073888256	f	disosnyc
The society is open and accepting new applicants.\n\nSoho varick and charlton st.\n\nCall in orders: 917-756-4145	1391011384	428558925969883136	f	disosnyc
Soho bound. Corner of Varick and Charlton street..\n\nCall in orders for pick up: 917-756-4145	1391005159	428532813135368192	f	disosnyc
RT @FunZachUniverse: Thanks for the sandwich dudes @DiSOSNYC. Very delicious. Definitely worth that 10 minutes in the cold. http://t.co/Qps...	1390938424	428252906534744064	f	disosnyc
@FunZachUniverse thanks for braving the cold. We'll make u a made man soon.	1390937686	428249812958732288	f	disosnyc
The society is posted on 48th bet 6 and 7 today.\n\nCall ins accepted: 917-756-4145	1390919746	428174565060382720	f	disosnyc
NEW LOCATION TODAY.. Wall and water st.\n\nCall your order for pick up: 917-756-4145	1390837752	427830658858516480	f	disosnyc
@ wall and water st.\n\nCall in orders for pick up: 917-756-4145	1390830096	427798546373283841	f	disosnyc
Here's our schedule for the week.. \n\nMonday: wall/ water st\nTuesday: 48 bet 6 and 7 ave\nWed: soho/ varick and... http://t.co/bKcCCHIsJO	1390775310	427568760409436160	f	disosnyc
New location Monday.. Wall and Water st.	1390756744	427490886671286273	f	disosnyc
((( NEW LOCATION ALERT )))\n\nDisos will be on wall and water Monday, round 2!	1390691444	427216999274409984	f	disosnyc
Put in your Super Bowl orders now! Heros, rice balls, toasted ravilois, caprese salads, and more!\n\nWe'll make... http://t.co/vFggN7JZkq	1390602115	426842325826822144	f	disosnyc
Get your fill before the weekend.. Wall and water st\n\nCall in ur order: 917-756-4145	1390582610	426760517680918528	f	disosnyc
RT @EatStTweet: Food trucks are bringing jobs, flavour and a friendly urban vibe to Portland http://t.co/KSDHf67NQw	1390930958	428221595388502016	f	burgersandbites
@EatStTweet follow suit nyc!	1390930956	428221584353284097	f	burgersandbites
@cammcm good luck!	1390843222	427853600208203776	f	burgersandbites
RT @cammcm: @burgersandbites Can my Super Bowl dreams get a #RT  http://t.co/XUwm2u53nK	1390843210	427853549549395968	f	burgersandbites
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
We will be at the Celebrity Beach Bowl tomorrow with @FoodNetwork very own @GuyFieri !!	1391210613	429394550474702848	f	mexicoblvd
RT @FoodNetwork: See @GuyFieri play in @DIRECTV's star-studded #BeachBowl in NYC Feb. 1 at 10a: http://t.co/2deyhXFUuV!	1391210556	429394312292749312	f	mexicoblvd
@sammmmm_x3 yes!	1391210529	429394200543891456	f	mexicoblvd
Preorder always available on our website!	1391188868	429303347146141696	f	mexicoblvd
Parked at 51st street Between Madison &amp; Park!	1391186161	429291994246955008	f	mexicoblvd
RT @veroplane: @MexicoBlvd Help support a #NYC #teacher by donating to my classroom -- http://t.co/FmcciLA4ld Great cause for great kids! P...	1391185957	429291135555887104	f	mexicoblvd
Come find us, #Midtown! East 51st St between Park &amp; Madison (right in front of the New York Palace) #tacocrave #tortalove	1391185530	429289344718094336	f	mexicoblvd
#Midtown west going to be mad. Police moved us because of Super Bowl activities in area. We are at 51st btw park &amp; Madison instead.	1391175047	429245375271432193	f	mexicoblvd
RT @CarnivoreGal: @VoiceStreet @MexicoBlvd yes that was an amazing time	1391117265	429003021301714945	f	mexicoblvd
RT @VoiceStreet: @CarnivoreGal agreed! One of the reasons we loved having @MexicoBlvd at #ChoiceStreets, our food truck foodie fest #omnomn...	1391116991	429001873652469760	f	mexicoblvd
RT @CarnivoreGal: @VoiceStreet I vote @MexicoBlvd - don't care that they're a truck, they are that amazing	1391116783	429001001660469248	f	mexicoblvd
@CarnivoreGal @VoiceStreet You are too kind!!! :)	1391116597	429000221201551360	f	mexicoblvd
Astoria for dinner tonight :) we love you guys	1391112931	428984844664991744	f	mexicoblvd
@joseroverfan Our truck schedule can be found on our website! http://t.co/aAbStQP4UO :)	1391112906	428984737152372736	f	mexicoblvd
RT @dumbolot: Happy Thursday! @MexicoBlvd @ToumNYC and @sweetchilinyc in the lot today!	1391096114	428914306881957888	f	mexicoblvd
Parked in our usual #Astoria spot all day today! Ditmars &amp; 31st (last stop on the NQ Queens bound subway) Preorder on http://t.co/EIrGC8j9wt	1391014861	428573506553806848	f	mexicoblvd
Hey Astoria! You can find us on Ditmars &amp; 31st (last stop on the NQ) tonight until 9:30 and tomorrow from 11:30am until 9:30pm! :) #tacolove	1390946495	428286759966097408	f	mexicoblvd
RT @EdgeStudio: @MexicoBlvd thanks for yet another delicious #tacotuesday - @EdgeStudio @ItsMeLeanne can't wait till next week! http://t.co...	1390940584	428261968278204416	f	mexicoblvd
RT @w0nglette: Deliiiiiicious avocado torta from @MexicoBlvd. I'll definitely be back again.	1390940078	428259844660154368	f	mexicoblvd
Any suggestions where we should park for lunch tomorrow? WFC lot is closed due to construction :(	1390933466	428232111611740160	f	mexicoblvd
RT @JustinDormady: @NuchasNYC @CityGirl940 thanks again. Can't wait till I get my hands on those empanadas :)	1391212284	429401562000400384	f	nuchasnyc
@pjdimalanta Thanks for checking in!	1391212279	429401540953399296	f	nuchasnyc
RT @DrinkLunaSueno: RT @NuchasNYC: Strolling down #SBBLVD? Grab a few #empanadas, they make great hand warmers! http://t.co/kkDjeQdcHE	1391212270	429401500805509121	f	nuchasnyc
#SB48 WEEKEND IS HERE! Happy Friday!	1391211613	429398744166318081	f	nuchasnyc
Congrats to @citygirl940 &amp; @Justindormady for winner our #NuchasSuperFan Contest!	1391200807	429353423008702466	f	nuchasnyc
Strolling down #SBBLVD? Grab a few #empanadas, they make great hand warmers! http://t.co/KY4PwfdZJm	1391199530	429348066530193408	f	nuchasnyc
RT @NYNJSuperBowl: Wondering what to bring to #SB48? Check out our musts here: http://t.co/3NokadnHvO	1391189394	429305553790464000	f	nuchasnyc
Strolling down #SBBLVD? Grab a few #empanadas, they make great hand warmers!	1391189282	429305083286007808	f	nuchasnyc
RT @mayamcar: Do you know why this is empty? I ate it  @NuchasNYC http://t.co/MiufBfswbl	1391188661	429302477427855360	f	nuchasnyc
Few days left to order Nuchas Catering for your #Superbowl Fiesta!	1391114411	428991050271973376	f	nuchasnyc
The Nuchas Intrepid is ready for the #budlighthotel! http://t.co/xJwYUQSTHp	1391105018	428951652234567680	f	nuchasnyc
Heading to #SBBLVD? Keep warm with a few #empanadas	1391027109	428624879848787968	f	nuchasnyc
RT @restaurantbuzz1: @NuchasNYC  anytime love getting the word out there! Cant wait to come back soon!	1391021143	428599856933113856	f	nuchasnyc
RT @NYNJSuperBowl: #SBBLVD is now officially open on Broadway between 34th &amp; 47th streets! http://t.co/VUawW6JM8e	1391019274	428592017879597056	f	nuchasnyc
RT @NYNJSuperBowl: The Toboggan Run is a must on #SBBLVD Engineered by @ThisIsGMC! http://t.co/g100JOj6VZ	1391019234	428591850359103488	f	nuchasnyc
@restaurantbuzz1 Thanks for the mention! We're glad to hear you enjoy our empanadas!	1391015986	428578225514885120	f	nuchasnyc
Our Nuchas Truck is getting wrapped and ready for Super Bowl XLVIII at the #budlighthotel http://t.co/vyQwqutQXM	1391015813	428577502169014272	f	nuchasnyc
Don't miss out on our #NuchasSuperFan contest! Enter now for your chance to win a catered event on us! http://t.co/HbdbesqzB4 #empanadas#NYC	1390934136	428234924773343232	f	nuchasnyc
Tomorrow: Well be partying with the @Super Bowl @BudLight Hotel! Stay tuned for updates all week\nhttp://t.co/0Zw71HtZRC	1390929159	428214049613295616	f	nuchasnyc
Today is the LAST day to enter our #NuchasSuperFan contest!  You could win a catered party on us! #SuperBowl #NYC http://t.co/HbdbesqzB4	1390923991	428192372133232640	f	nuchasnyc
BOBJO express ? : park ave. and 47st. - -Catch me if u hungry.	1391186855	429294904381308928	f	bobjotruck
Hello New York , happy Friday ! Bobjo truck stay at varick and king. Plz stop by try our ramen noodle soup and rice platter. Thank you!!	1391186628	429293951221522433	f	bobjotruck
Bobjo express at watet and hanover sq today!\nThanks!	1391103188	428943977837248512	f	bobjotruck
Hello, flatiron!\nBobjo truck open at 22st and 5th ave today! Try our ramen noodle soup and rice plattet too!\nHave a great day.\nThanks!	1391103144	428943792222511104	f	bobjotruck
Bobjo express stay at 47 and park!\nThanks!	1391012792	428564830338174977	f	bobjotruck
Bobjo truck open at king st &amp; Varick st today. Try our ramen noodle soup. It's will make u warm and happy. Also we serve rice platter too!	1391012761	428564700737961984	f	bobjotruck
Bobjo express stay at State st &amp; whitehall st. \nThanks!	1390926025	428200901019709440	f	bobjotruck
Good morning ny!\nBobjo truck open at Water &amp; Hanover sq today. Today is best time for bobjo ramen noodle soup. And we serve rice platter too	1390925945	428200567488663553	f	bobjotruck
Bobjo express will open at State st &amp; whitehall st today! Try our Bi-bim-bowl and vege tumbling. \nThanks!	1390840630	427842728282832896	f	bobjotruck
Hello, flatiron! Bobjo truck open at 5th ave &amp; 22st today. Try our rice platter and ramen noodle soup.  Thanks and see u!	1390840509	427842223393492992	f	bobjotruck
Bobjo express open at 47 st&amp; park ave today. \nThanks!	1390581102	426754190086377473	f	bobjotruck
Still freezing ny! But happy friday!\nBobjo truck open at varick st &amp; king st today. Try our rice platter and hot ramen noodle soup.\nTry!\nThk	1390581055	426753991872364544	f	bobjotruck
Bobjo express stay at water st. and  Hanover sq. THANK YOU!	1390494982	426392977670676480	f	bobjotruck
Hello flatiron! Bobjo truck open at 22nd and 5th ave. We have hot ramen noodle soup : it'll make you warm. :) thank you	1390494743	426391976133816320	f	bobjotruck
BOBJO express open at 47st and park ave. thank you.	1390409988	426036485692076033	f	bobjotruck
Hello New York .  BOBJO truck open at varick st and king st today. Try our hot ramen noodle soup!\nThanks!	1390409164	426033032689377281	f	bobjotruck
Freezing, ny!\nBobjo truck open at Water &amp; Hanover sq today! We server hot ramen noodle soup.\nTry our soup! It's will make u warm today!\nThk!	1390322677	425670276551278592	f	bobjotruck
Hello, flatiron!\nBobjo truck open at 5th ave and 22st today!\nTry our rice platter and ramen noodle soup. It's will make u warm.\nThanks!	1390235742	425305644804345857	f	bobjotruck
Hello new york happy friday!  Bobjo truck open varick and king st. Try our ramen noodle soup!  Bob jo express open  @ 47st and park.	1389977732	424223474509307904	f	bobjotruck
Bobjo express stay at water and hanover sq.	1389897032	423884993992331266	f	bobjotruck
Come by 55th and Broadway for some hot donuts, hot coffee, and hot cider! Or brave the cold without something to warm you up. Your choice.	1391173993	429240957125816320	f	carpedonutnyc
You know the drill! Donuts. Cider. Coffee. 51st and Park until 5pm today.	1391087892	428879821905887232	f	carpedonutnyc
Open on 23rd and Park. Start your day with a coffee and donut, or if your feeling adventurous, a steamy hot apple cider!!!!	1391003429	428525560256798720	f	carpedonutnyc
@DanaSaylor in manhattan most weekdays. Mon 20th and 5th, wed 23rd and park, Thur 51st and park, fri 55th and broadway. Check back here	1390742456	427430956874874882	f	carpedonutnyc
You know what they say... Cold hands + hot donut = #Happiness. Court and Bergen until 4:30pm!	1390742210	427429925055119360	f	carpedonutnyc
SOLD OUT!!!!  Come see us tomorrow.	1390680049	427169203393921024	f	carpedonutnyc
Court and Bergen street today, brave the #arcticvortex and be rewarded with delicious donuts!	1390665978	427110186273492993	f	carpedonutnyc
Good Morning Donut People we are at 55th and Broadway until 5pm today!  Come see us!	1390572431	426717821502889986	f	carpedonutnyc
We're back on 51st and Park and ready for business. Open 'till 5:30 pm!	1390483063	426342987640356864	f	carpedonutnyc
Another lovely day for donuts at Bergen and Court streets. Open 'till 4:00.	1390136573	424889701284458496	f	carpedonutnyc
Now open at court and Bergen until 4:30pm	1390049949	424526375002050560	f	carpedonutnyc
@baileymichelle Thanks! We couldn't agree with you any more.	1389981650	424239907729850368	f	carpedonutnyc
@TreppWire We meant to set up there this week! But boy has it been difficult finding an open spot. #foodtruckproblems	1389981592	424239665437474816	f	carpedonutnyc
Now open at 55th and Broadway. Come check out the party! #foodtruckMecca	1389963771	424164916300218368	f	carpedonutnyc
@mactruckny I'm thinking about making the worlds first Mac-and-cheese donut sandwich later... #FoodTruckLove	1389878096	423805571104784384	f	carpedonutnyc
Now open at 55th and Broadway!	1389877941	423804921394511872	f	carpedonutnyc
55th St. bet. 6th &amp; 7th Ave, folks. With hot Mexican chicken &amp; rice soup!	1391186130	429291862487085056	f	kimchitruck
No parking, so we've moved. Find us on 55th St. bet. 6th &amp; 7th Ave.	1391184016	429282994772123648	f	kimchitruck
Now accepting Superbowl orders. #KoreanFriedChixWings #NoFoodNoGlory http://t.co/NcsokqSMBF	1391180221	429267079099731969	f	kimchitruck
It's almost balmy today. Come have a taco. 52nd St. bet. 6th &amp; 7th Ave. 11:30am - 2:30pm	1391180015	429266213642829825	f	kimchitruck
We're at Varick &amp; the corner of Charlton for a slurpin' good time. Mexican chicken &amp; rice soup!	1391103471	428945163579191298	f	kimchitruck
Miss us? We've missed you! We'll be at Varick &amp; the corner of Charlton St.	1391094293	428906670274510848	f	kimchitruck
Sorry folks, still off the road. Patience, patience.	1391007598	428543046750195713	f	kimchitruck
No truck today. Hasta la manana!	1390924671	428195224553541632	f	kimchitruck
Only 1 &amp; already a foodie. Thx Avery for letting us cater your Dol. Is this cutie rocking her hanbok or what?! http://t.co/RrnTkIFMVk	1390846679	427868100705271808	f	kimchitruck
@JJNYCBK Agree. But they closed the lot, so what can ya do?	1390835586	427821573945307136	f	kimchitruck
Food Truck Court closed today. Till the digits climb again, we'll be missing you.	1390833144	427811332461588480	f	kimchitruck
RT @empress718: Fridays are officially Kimchi Fridays. @KimchiTruck, I love you!	1390596076	426816998291832832	f	kimchitruck
Ultimate Polar Vortex remedy- 1 part shuffleboard, 2 parts tacos. Find us at @RoyalPalmsClub tonight 7pm to wheneves	1390583920	426766010989826048	f	kimchitruck
Bring it, Polar Vortex Redux! We'll raise you a hot spicy Mexican chix &amp; rice soup.	1390581258	426754846612389888	f	kimchitruck
We're baack &amp; we've got a spicy Mexican chicken &amp; rice soup today #Slurp'sUp  52nd St. bet. 6th &amp; 7th Ave. 11:30-2:30	1390575125	426729121721221121	f	kimchitruck
@grosalsky Good things come to those who wait :)	1390493263	426385765954625537	f	kimchitruck
Back in full force tomorrow. Hang in there, kids.	1390487538	426361753744584705	f	kimchitruck
RT @bloghill: @KimchiTruck WE LOVE YOU KIMCHI TACO!!!	1390407561	426026306837688320	f	kimchitruck
@bloghill Whoa, loving the love!!	1390407559	426026297286864896	f	kimchitruck
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
RT @JonathanBenno: Sous chef Steve Conklin is hard at work keeping up with #mortadella #nduja #pancetta #porchetta... http://t.co/cQsaD7bRyr	1389991894	424282873798328320	f	mactruckny
Park ave between 27/28 for lunch	1389976473	424218192236773376	f	mactruckny
@SSDESTO hahaha thanks bro!!!	1389902687	423908713364467712	f	mactruckny
RT @ohlivvyuh: Gotta love my boy @mactruckny for hooking me up with the dopest mac n cheese in the world.	1389902663	423908612202057728	f	mactruckny
RT @SSDESTO: @mactruckny Cheezy Heaven!  http://t.co/q5RCoQv4Lp	1389902654	423908572775587840	f	mactruckny
RT @ohlivvyuh: Happiest girl in the world. @mactruckny and @mikenwillies for lunch! Supporting small and mobile business is fun! @nycfoodtr...	1389902638	423908507990392832	f	mactruckny
Good morning broadway!! Between 55/56 for lunch today!	1389880199	423814389880586240	f	mactruckny
@CarpeDonutNYC donut mac... Interesting concept.. Let me know how that works out. 	1389880112	423814026926493696	f	mactruckny
@CarpeDonutNYC  tasty donuts from these guys http://t.co/BjUatXkUk3	1389877679	423803822793031680	f	mactruckny
At the Javits today for lunch. 37st and 11th ave.	1389716599	423128200513081344	f	mactruckny
RT @joe14850: @mactruckny love the #buffalochicMAC #NRF14 http://t.co/1gm95XyvKj	1389660390	422892442942443520	f	mactruckny
RT @dudleyjoshua: Im in front of javitz center where @mactruckny is parked with the engine running. Wheres my mac and cheese?	1389660383	422892415469760512	f	mactruckny
RT @fourwheelfoodie: While @kraftfoods EZ Mac isnit bad, weill take the @mactruckny alternative any day. Their superbly cheesy truck doesni...	1389361650	421639440336191488	f	mactruckny
@katie_pierce @kbsp_agency i miss my #macheads on varick!!!	1389302712	421392233523580928	f	mactruckny
@castingqueenny my email is dom@mactrucknyc.com	1389302656	421391999682772993	f	mactruckny
@msamandarush thank you, always a pleasure seeing you at my window 	1389302559	421391594101944320	f	mactruckny
29th st and Park Ave until 2:30 today.	1389280424	421298753212260352	f	mactruckny
@ItalianPizzaVan the pizzas look great.  hope to make it across the pond for a slice #yum #pizza	1388990125	420081149692506112	f	mactruckny
@franklinshepard absolutely	1388679283	418777382615801857	f	mactruckny
@franklinshepard i miss 47th more than you know. Havent found a consistent spot since.	1388679037	418776354050813952	f	mactruckny
We are on 55st and broadway!	1391187754	429298675182227456	f	chefsamirtruck
We are on 52st and park av!!	1391015194	428574906859917312	f	chefsamirtruck
FREE HOT Moroccan mint tea with rose water! Uhmmmm!	1391014612	428572464638345216	f	chefsamirtruck
Is on 52nd St @ Park Ave today!	1391014547	428572191442337792	f	chefsamirtruck
We know it's cold out there today, free hot mint tea with rise water	1390930680	428220426981232640	f	chefsamirtruck
We are on 47st at the corner of park av!!	1390925467	428198560816201730	f	chefsamirtruck
Yeees!! Ask for your free hot mint tea with rose water	1390845951	427865046128287744	f	chefsamirtruck
We are on old slip at the corner of water st!!	1390842818	427851905780707328	f	chefsamirtruck
We are on Broadway at tge corner of 55st! Get your food and get a delicious mint hot tea with rose water	1390581668	426756565006577664	f	chefsamirtruck
We are on 47st between park av and Lexington av, stop by and get a hot mint tea!!!	1390495394	426394706831228928	f	chefsamirtruck
Its freezing out, but we are working, on 36st and broadway!! Pick up your meal and get free hot mint tea	1390324299	425677080769331200	f	chefsamirtruck
We are at the corner of broadway and 55 st!!	1389978085	424224953903611904	f	chefsamirtruck
Is on Broadway btwn 55th &amp; 56th St today!	1389976239	424217210702528512	f	chefsamirtruck
We are on 47st between park av and Lexington av!!	1389892047	423864083885330432	f	chefsamirtruck
Is on 47th St btwn Park Ave &amp; Lex today!	1389890111	423855964110852096	f	chefsamirtruck
Is on 52nd St @ Park Ave today!	1389801960	423486231209463808	f	chefsamirtruck
Is on 36th St @ Broadway today!	1389717883	423133588184252416	f	chefsamirtruck
Is on Old Slip @ Water St today!	1389626504	422750314723569664	f	chefsamirtruck
We are on 55st and broadway, its not bad outside , we give mint tea anyway:)	1389378322	421709366161866752	f	chefsamirtruck
Ww are on 47st between park av and Lexington av	1389287172	421327055830396928	f	chefsamirtruck
RT @KellyKOMO4: Jersey restaurant has #sb48 food: Seahawks Shrimp &amp; Seattle Score (drink). All green, DEN SEA blues cancel http://t.co/sWNc...	1391198889	429345377792557056	f	mausamnyc
Join us for some Seahawks palak paneer #winterblast #secaucus @komonews @Seahawks http://t.co/yPNv7GXNCD	1391192230	429317446005436416	f	mausamnyc
@AC360 up for some curries in freezing temp join us at #winterblast #secaucus	1391124037	429031426969698304	f	mausamnyc
#winterblast #secaucus @Broncos @Seahawks @Giants @nyjets #Super Sunday http://t.co/rjCJPtjKVH	1391115999	428997711275499521	f	mausamnyc
@News12NJ all set for #winterblast #secaucus @MayorGonnelli http://t.co/n3DNNGEdnU	1391115401	428995202972663808	f	mausamnyc
Getting ready for #winterblast #secaucus @njdotcom did u get tickets if not get urs  http://t.co/HPT5OxQSzo http://t.co/gZRpbtudcy	1391047309	428709603871059968	f	mausamnyc
#winterblast #secaucus #Super Bowl XLVIII  #1 offense VS #1 defense #Peyton Manning VS #Russell Wilson @northjersey.com/winterblast	1391010857	428556715496177664	f	mausamnyc
#SUPERBOWL XLVIII QB duel Peton Manning VS Russell Wilson get tickets @ http://t.co/d29fXZJHyr	1390927463	428206936014589952	f	mausamnyc
Season of football with @Broncos @Seahawks #shrimps at Mausam Secaucus http://t.co/HESdQkHrJR	1390794405	427648847733866496	f	mausamnyc
One week to kickoff are you ready for some curry #winterblast #secaucus #bergen #exposure	1390774198	427564092573118464	f	mausamnyc
#NFL SUPER BOWL XLVIII  tickets on sale @ http://t.co/ieULG53ESP	1390686620	427196766266482688	f	mausamnyc
Countdown begins for #winterblast #secaucus let's go @Seahawks @Broncos @pepsi get some curry and bites	1390601562	426840005517250561	f	mausamnyc
don't let the weather stop U from yr delicious lunch. We're here47str &amp; Park ave. All plattersserved with parata &amp; samosa	1390496800	426400601677639680	f	mausamnyc
RT @NYClifeyy: Indian cuisine in New York City @mausamnyc http://t.co/gXDXzUcb3Y	1390452636	426215366713671681	f	mausamnyc
Forget this Winterblast #winterblast #secaucus is coming r u ready@Broncos @Seahawks	1390432979	426132917711306752	f	mausamnyc
RT @randomfoodtruck: Let's ignore the snow until it goes away and focus on lunch instead. @souvlakitruck @hibachiheaven @mausamnyc @DomoTac...	1390319263	425655959005200384	f	mausamnyc
Yr favourite food truckBway bet 55 &amp; 56 Str. All platter served with parata &amp; samosa. Ideal for this weather	1390313752	425632843646398464	f	mausamnyc
Join us for the #SuperBowlXLVIII  event #winterblast #exposure #secaucus #Broncos #Seahawks fans http://t.co/GwvWTSEn3r	1390265593	425430851414134784	f	mausamnyc
Mausam's vindaloo flavor is exactly what U need for this weather! Dinner is ready to be  served@location	1390252883	425377540270608384	f	mausamnyc
Happy Monday!  Curry N Bites welcome U @ Bway &amp; 67 Str next to  store. All platter comes with parata &amp; samosa	1390224756	425259569409822720	f	mausamnyc
http://t.co/PpRZRDSmcq	1391184442	429284782535884800	f	tacobite
Today Serving Lunch on\n47th st\nBet Park/Lexington Av. \nCall in advance for\npick-up\n@ 347-70T-Bite	1389801699	423485136572022785	f	tacobite
47th st \nPark Av/Lexington Av\nCall in advance for\npick-up\n@ 347-70T-Bite. ...	1389719217	423139184967438336	f	tacobite
Today Tuesday serving Lunch \non 47th st \nBet Park Av / Lexington Av\nCall in advance for pick-up \n@ 347-70T-Bite	1389716832	423129181913096192	f	tacobite
Serving Lunch today on 47th st\nBet Park Av / Lexington Av Call in advance for pick-up @ 347-70T-Bite	1389716281	423126868276310016	f	tacobite
@thomassilvera omg! Thank u...always a delight to see u guys....	1389632623	422775982186315776	f	tacobite
Happy Monday! Taco Bite addicts. ..\nToday serving it up on \n47th St Bet \nPark Av / Lexington Av. \nCall in advance... http://t.co/3yJQ5ptx1Y	1389629482	422762805826441216	f	tacobite
Comin' soon Taco Bite addicts rewards card....	1389557514	422460953427738624	f	tacobite
Big shout out to all the Taco Bite addicts who are using our 347-70T-Bite hotline.....why wait when we can have... http://t.co/8AqsHd7XOc	1389557411	422460519111753729	f	tacobite
Happy SUNDAY!!!\nServing it up on \n67th street &amp; Broadway. \nBeat the long line by \ncalling in advance \n@ 347-70T-Bite\n for pick-up!!!!	1389549601	422427763103240192	f	tacobite
Yes!!TacoBite addicts...today we are here on \n67th St &amp; Broadway\nIn front of the \n APPLE store	1389548016	422421115873804288	f	tacobite
Today Sunday we will be on\n67th st &amp; Broadway!!\nIn front of the \n"APPLE" store	1389538482	422381127756972032	f	tacobite
Uready!  DaLe'''\nFlipping It Baby! \n#flipagram made with @flipagram \nMusic: Pablo Fierro - Djambo \nhttp://t.co/dpZAmgEvTw	1389479904	422135430159798273	f	tacobite
@thomassilvera tomorrow sunday we will be on 67th street!! :-)) hope to see u	1389462376	422061913712111616	f	tacobite
Happy Saturday!!\nToday serving on \n67th St. &amp; Broadway\nIn front of the \n" APPLE " store\nCall in advance for pick-up @ 347-70T-Bite	1389459528	422049968514691072	f	tacobite
@JAMNYC1 place I had mentioned to you @PulperiaNY  exquisito!	1389410610	421844793317400577	f	tacobite
@nycfoodtruck @FoodtoEat place to be PULPERIA on ESSEX @PulperiaNY, L.E.S. Exquisite Tapas,Wine/Beer selection &amp; Hospitality!    ATREVETE'	1389406447	421827329464467456	f	tacobite
TacoBiters!! The place to be is this Giant piece of SPAIN in the L.E.S. PULPERIA ON ESSEX, Exquisite... http://t.co/3eKbRAtXS6	1389399967	421800151725129728	f	tacobite
Giant piece of SPAIN in the L.E.S. PULPERIA ON ESSEX, Exquisite Tapas,Wine/Beer selection &amp; hospitality! Atrevete' http://t.co/ar8ZXswJDi	1389399157	421796755760775168	f	tacobite
Rain/snow tacobiters still out to get their dose.... http://t.co/DifwkcMOQm	1389375310	421696732263903232	f	tacobite
Happy #ChineseNewYear! Broadway btw Houston and Bleeker 11-3 with free new year sweet rice cake bites! http://t.co/teCgG8W6VJ	1391175217	429246088756084737	f	sweetchilinyc
Happy #ChineseNewYear we are celebrating at Broadway btw Houston &amp; Bleeker 11-3! Free new year sweet rice cake bites! http://t.co/VV0XzEZUtx	1391175062	429245440161480704	f	sweetchilinyc
@dumbolot @DUMBOFoodTrucks  we are making a guest appearance today at Jay &amp; Water! Lunch 11-3 with free hot coffee samples! #sriracha	1391089462	428886406464036864	f	sweetchilinyc
RT @randomfoodtruck: Happy hump day! Truck party with @bigdsgrub, @sweetchilinyc, Katz &amp; Dogs, and @GrillOnWheelsNY (glatt kosher, if that'...	1391013543	428567978494681088	f	sweetchilinyc
It's lunch time at Broadway and 56th street. Free coffee samples to anyone who asks! Here till 3	1391013504	428567815021690880	f	sweetchilinyc
RT @jennstuvwxyz: @StephAndTheGoat !! RT @TheUniverse1981: "'Goat Aurora Over Greenland' Image:  http://t.co/OjXD900t8G via #NASA_App http:...	1391005718	428535159282229248	f	sweetchilinyc
Happy hump day! Join us at 56 &amp; Broadway 11-3! http://t.co/VPFs5dzZ63	1391005594	428534639784112128	f	sweetchilinyc
Hey @dumbolot! Jay &amp; water 11-3 today. Hot Vietnamese coffee samples to keep you warm! #thaietnamese #spicy	1390917361	428164563021070336	f	sweetchilinyc
We are back! Broadway btw 55 &amp; 56 11-3!  We missed you!!	1390836301	427824573246341120	f	sweetchilinyc
Hate to tell everyone but we won't be back on the street until Monday due to the weather:(	1390397536	425984260244135936	f	sweetchilinyc
@mooshugrill @midtownlunch thanks guys! Your food rocks!	1389978152	424225237027545089	f	sweetchilinyc
RT @mooshugrill: Big ups to @sweetchilinyc for winning @midtownlunch's best new truck poll! (http://t.co/WxQkH3fgFA) And thx Brian, you're ...	1389977153	424221043582959617	f	sweetchilinyc
Betty is still sick:( we won't be back until a week from today. Sorry!! #keepontruckin	1389834841	423624144883036160	f	sweetchilinyc
@HdsnSqFoodTruck we can't make it today the truck broke down last night:(	1389798508	423471754779299840	f	sweetchilinyc
@SaveNYCFoodTrux @BrookfieldPLNY @ESTacoTruck we aren't coming today the truck is down:(	1389798468	423471584788365313	f	sweetchilinyc
Won't be headed out today, the truck is down for the count. Sorry!! :(	1389798269	423470749731790848	f	sweetchilinyc
RT @dumbolot: Happy Tuesday! @sweetchilinyc @KimchiTruck and @carlssteaks on jay &amp; water! @DUMBOFoodTrucks	1389715144	423122099713363968	f	sweetchilinyc
Lunch time @dumbolot Jay &amp; water till 3! http://t.co/6eJ9EWlrll	1389715077	423121820339142656	f	sweetchilinyc
Hey @dumbolot we missed you!  It may be raining but we are back today from 11-3 at Jay &amp; Water! Free coffee samples to brighten up this day!	1389702528	423069183861981184	f	sweetchilinyc
Best new truck of 2013 midtown lunch! http://t.co/XPYyPvSLOv	1389631647	422771886473625600	f	sweetchilinyc
TGIF!!! Kasar truck is at Broadway and 55th street all day until 8pm. Join us	1390574849	426727963145420800	f	chipsykingny
Kasar truck is in Soho, broadway and spring street, until 6pm tonight. Join us. Happy Sunday!!!	1390141118	424908763544293376	f	chipsykingny
Kasar truck is at broadway and spring street in SOHO until 9pm and all night until 5am at 7th and Christopher. Happy Saturday!!!	1390065530	424591724996882432	f	chipsykingny
Kasar truck is at broadway and 55th street until 7pm and all night until 5am at 7th and Christopher. TGIF. Happy Friday	1389996884	424303802356088834	f	chipsykingny
Kasar truck is at 46th street between 5th and 6th avenues until 6pm.\nAll night at 7th and Christopher.\nHappy Thursday!!!	1389885465	423836478951522304	f	chipsykingny
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
@ducky_krupnik sorry about that.  Hope the sandwich was good tho. Thank you your patience	1379952427	382174295944089600	f	parissandwich
@ducky_krupnik sorry was this at the book fair?	1379947749	382154675094839296	f	parissandwich
Hey midtown we will be on 56th and broadway today	1379947620	382154133341757440	f	parissandwich
Sat, Feb 1st, no truck this weekend; our shop The Treats Truck Stop open today 8am-7pm w/food &amp; #counterculturecoffee &amp; treats!!!	1391260586	429604154299125760	f	thetreatstruck
Not-quite artic today.	1391265029	429622787440128001	f	neaexpress
Good Morning Grand Army Plaza. Come Enjoy Your Favorite Food Truck Palenque!!!  We Are Here Arepa Lovers. We Also Have AJIACO (chicken soup)	1391264700	429621409078587392	f	palenquefood
RT @ahorrow: missing philly today in NYC but @PrestonSteve933 podcast and a @PhilsSteaks  definitely made my day better #phillyinnyc	1391264233	429619451336851456	f	philssteaks
Do the Hokey Pokey for a free dinges!	1391263368	429615822144012289	f	waffletruck
Goesting @ Bway &amp; 66th til 9p\nPagadder @ Bklyn Bridge til 5p\nVedette @ 60th &amp; 5th til 6p\nKotmadam in Williamsburg @ N 5th &amp; Bedford til 1am	1391263334	429615678107422720	f	waffletruck
Saturday is here!\n\nDe Wafel Cabana @ 35th &amp; Broadway open til 10pm\nLe Cafe @ 15 Ave B open til 2am\n\nMomma Truck @ 7th &amp; Carroll till 4:33pm	1391263271	429615414885507073	f	waffletruck
Lobster all over Brooklyn! BigRed Celebrates RedHook @fairway and we'll also be at the @bkflea  10-6 at N5th&amp;Wythe. #ClawsUp!	1391266512	429629007454543872	f	lobstertruckny
Come and get it!!!\nWe are at 67th and Broadway outside Apple Store !	1391268060	429635500639408128	f	seoulfoodnyc
Treats of Chinese New Year http://t.co/SD8TeUDaF7	1391268802	429638614423588866	f	getstuffednow
korean-american mash-up @smorgasburg this wknd. @asiadognyc kimchi &amp; mac &amp; cheese. woot!	1391267261	429632151722950656	f	milktrucknyc
Happy February! Bessie's in Tribeca, Chambers &amp; Greenwich, call (646) 504-6455 to pre-order or http://t.co/IwkqcCHPzF.	1391266854	429630441994215425	f	milktrucknyc
Indoor stand at @bkflea @smorgasburg Williamsburg, North 5th &amp; Wythe. Sandwich menu always at @houstonhallnyc	1391266854	429630441532846081	f	milktrucknyc
New York City! Wake up and smell the coffee...seriously. http://t.co/vKQbnPE73C	1391267405	429632755220357120	f	waffletruck
Happy saturday UWS ita a heat wave today !! front of Apple store till 11:30 - 9 pm stop by grab Carl's famous cheesesteak GOT WHIZ?	1391270598	429646146844495872	f	carlssteaks
RT @ChineseMirch: #HappyNewYear ! #snowstorm - be home, stay warm &amp; stock up some soup from us this afternoon.	1388685976	418805457080557568	f	getstuffednow
Making the best pizza on wheels is good. Doing it in under 90 seconds is great.	1391271605	429650370923868160	f	neaexpress
we saw patches in a store--caleb. http://t.co/8xdKlk04tp	1391272749	429655167437266944	f	milktrucknyc
Day 3 in beautiful sunny Secaucus, otherwise known as the "Jewel of the Meadowlands". Super Bowl winter blasting time, on Winter Blast Blvd	1391272495	429654101811822592	f	nautimobile
@GLADforHealth @nycfoodtruck  @VeganLunchTruck	1391271291	429649053765632000	f	waffletruck
#2013WasGreatBecause you all gave us so much love on the streets of #NewYork ! #BringItOn2014 !	1388520271	418110439047053312	f	getstuffednow
Last day of the #BudLightHotel! #PartyOn #EatCheese #itssuperbowltime	1391273466	429658176682983425	f	morristruck
@lHlONOR north 5th &amp; wythe, Williamsburg	1391273158	429656883151261696	f	milktrucknyc
@NomWah: We be ballin' #chinesenewyear #yearofthehorse #sesameballs #dessert #chinatown http://t.co/2fKe8JQ0EQ Ballin' OUT!	1391273830	429659700825976832	f	bigdsgrub
It's a beautiful day in the neighborhood... a beautiful day in the neighborhood...	1391273392	429657866430332928	f	bigdsgrub
It's not too late to get your Super Bowl orders in for pick up or delivery.  Don't miss kick off waiting for... http://t.co/1YvaWFn70W	1391274349	429661881574621184	f	mrniceguytruck
Finally Brooklyn Some Very Beautiful Weather And Ur Favorite Food Truck Is Out Here Right By Grand Army Plaza.... Come Join Us!!!! Arepas!!!	1391274604	429662947003351040	f	palenquefood
It's a beautiful day. Williamsburg!!!\nCome today and taste your favorite arepa and soup. North 5 btw Berry &amp; Whythe http://t.co/m4NWuNKjEr	1391274193	429661227175141376	f	palenquefood
@NomWah: @bigdsgrub I think our use of balls today rivals that of @MEATBALLERS "Nice balls!" 	1391274453	429662316045803521	f	bigdsgrub
It's 43 degrees out there! An absolute scorcher! Spekuloos ice cream anyone? http://t.co/IXwctUBOnx	1391274198	429661245487476736	f	waffletruck
Empanadas &amp; Football. Match made in #Handheld heaven. http://t.co/vScFivrn2b	1391276701	429671745294180352	f	nuchasnyc
@AndrewS653 Yes, sir!	1391276885	429672518367334400	f	carpedonutnyc
Free Mix Download!! http://t.co/4Z22OPAy3u	1391277498	429675088921653249	f	chipsykingny
If today's not perfect donut weather, I don't know what is. Come on by at Bergen and Court streets in BK!	1391279092	429681773875040256	f	carpedonutnyc
Cute #fail https://t.co/p5dFc4QC5G	1391280761	429688771403972609	f	lovemamak
For malnourished youth, A little charity goes a long way. That's why we support No Kid Hungry.	1391281826	429693239449636864	f	neaexpress
De Special of de Week: De Strawberry Short Wafel. Ask your wafeleur or wafelette all about it. #dinges http://t.co/dUOthaDWdH	1391283181	429698923784306688	f	waffletruck
Me http://t.co/LjaL1vxfzU	1391283538	429700419552829440	f	shanghaisogo
RT @thefoodtruckpro: Catch The Food Truck Project tonight at 9p on Fox 17! Also a preview of our Super Bowl Menu! http://t.co/79vTeudpoZ	1391283417	429699915082915841	f	shanghaisogo
RT @VendorPower: Benefits of big public events should flow to all (vendors included) #SuperBowl #NYPD #NYC #publicspace #superbowlblvd http...	1391282991	429698128779161600	f	shanghaisogo
RT @PhilsSteaks: It's Super Bowl wknd! Who do you think is gonna win it? Denver or Seattle? Offense or Defense? Peyton or Beast Mode?	1391282656	429696723272081408	f	shanghaisogo
Broadway bound: Super Bowl Boulevard opens today in New York\n\n http://t.co/AohUeGjPz2	1391286340	429712174840553472	f	shanghaisogo
RT @BlondieBrownie: Kid-made cookies @thetreatstruck. Next up baking then decorating! So fun! #treatstruckstop http://t.co/Xrzk2ZYTkW	1391287433	429716758011084800	f	thetreatstruck
Can't wait any longer? See All The Spots From Super Bowl XLVIII By @FastCoCreate http://t.co/P9Ly9KyCL6 via @FastCoCreate	1391286318	429712081253068800	f	nuchasnyc
@goodgirlvenice Until 5:30 today! But come earlier in case we run out.	1391289739	429726430843641856	f	carpedonutnyc
TOMORROW! Touchdown Throwdown! 12 wafels, jar of spekuloos and a can of whipped cream. $30. Available everywhere! http://t.co/ve3fpK9xkQ	1391291641	429734407550017536	f	waffletruck
@DIRECTV: @MexicoBlvd thank you for coming! It was our pleasure!	1391294326	429745668811657216	f	mexicoblvd
Thanks for the fun, #BeachBowl! :)	1391293990	429744260704129024	f	mexicoblvd
@plovewerler at a super bowl event in jersey sorry	1391324237	429871124621819904	f	shortysnyc
@CutonDime25 shady we love you. come by tomorrow! 27th &amp; madison. philly bar. best chz steaks.	1391323898	429869703834927104	f	shortysnyc
Lesean McCoy shady we love you.  come by tomorrow!  27th &amp; madison.  shorty's---philly heaven.	1391323762	429869131991887872	f	shortysnyc
This thing is sooo good! House-made chili oil! We'll start carrying it on the truck on Monday. And yes...it... http://t.co/6YFHRZafpi	1391307105	429799268313210881	f	biandangnyc
@Danielley_Jelly we shall tell him you said hi!	1391324735	429873214877995008	f	waffletruck
@RicasCloset looks about good to us!	1391324710	429873107470270464	f	waffletruck
@merppanda that's the plan.	1391324649	429872851584159744	f	waffletruck
@RichellaBella oh no! What time?	1391324633	429872785599365120	f	waffletruck
@onacasiP @Lifeisgood of course.	1391324611	429872693496664065	f	waffletruck
@nsj2kx we're sorry/glad to hear it!	1391324591	429872611581902848	f	waffletruck
RT @nsj2kx: Yo @waffletruck! Because of ur waffles last night, I missed my train, was late for my date, &amp; lost my dinner appetite... Twas w...	1391324563	429872493147721728	f	waffletruck
@ZoyaaAlam sounds about fine to us.	1391324551	429872440584306691	f	waffletruck
@allswiech come back!!	1391324534	429872369729933313	f	waffletruck
@mattykiddd truck out. Sorry for the miscommunication!!	1391304249	429787289477480448	f	waffletruck
http://t.co/XHVIwDMu1g	1391301571	429776057252593664	f	waffletruck
#wafeldate http://t.co/w5KnP5Aq5Y	1391300417	429771217818890243	f	waffletruck
Wafels at night!\n\nLe Cafe @ 15 Ave B till 2a\nDe Cabana @ 35th &amp; Bway till 10p	1391296224	429753629428699136	f	waffletruck
Momma Truck is at 7th &amp; Christopher till 1a\n\nGoesting @ Bway &amp; 66th till 9p\nKotmadam @ Bedford &amp; N 5th till 1a\n\nAllez allez!	1391296202	429753539779653632	f	waffletruck
RT @DIRECTV: @MexicoBlvd thank you for coming!	1391302312	429779163315068929	f	mexicoblvd
Feb 2nd, Happy Super Bowl Sunday! Our shop open 8am-6pm w/food &amp; treats!!! 521 Court St, Carroll Gardens #Brooklyn	1391346575	429964818213502976	f	thetreatstruck
Game on.	1391351114	429983853374353408	f	neaexpress
Vedette is at 60th &amp; 5th till 6pm\nKotmadam is in Williamsburg N 5th &amp; Bedford all day!	1391351055	429983608552828928	f	waffletruck
Momma Truck in Forest Hills @ 71st Ave &amp; Queens Blvd till 10p\n\nGoesting is at Broadway &amp; 66th till 9pm\nPagadder @ Brooklyn Bridge till 5pm	1391351049	429983581877051392	f	waffletruck
Super Bowl Sunday!!\n\nLe Cafe @ Ave B &amp; 2nd St open till 11p\nDe Wafel Cabana at 35th &amp; Broadway open til 10pm	1391351001	429983383436148736	f	waffletruck
RedHookLobsterPound is in the house! We're at the @bkflea 10-6 and at the store in RedHook 12-7. Show some #lobsterlove!	1391352920	429991428681629697	f	lobstertruckny
Setting up at the official #SuperBowl Meadowlands #tailgate party - Park Ave, East Rutherford NJ 1130-430 today!	1391353072	429992067079876608	f	philssteaks
RT @HoneyChrome: I would do anything for a real cheesesteak. Can't come close in NYC (except @PhilsSteaks!)  @djgrooves	1391352795	429990905295413248	f	philssteaks
RT @djgrooves: @HoneyChrome @PhilsSteaks is my people....they are the real deal.	1391352784	429990858960961536	f	philssteaks
For one free dinges: do your victory dance after scoring the Super Bowl-winning touchdown.	1391352623	429990185841856512	f	waffletruck
#SB48 Bound? Check out the #MEADOWLANDS #TAILGATE #PARTY in East Rutherford TODAY with #NYC's own @PhilsSteaks https://t.co/bLuAqzUgSO	1391353284	429992955198599168	f	philssteaks
Indoor stand at @bkflea @smorgasburg Williamsburg, North 5th &amp; Wythe. Sandwich menu always at @houstonhallnyc	1391353255	429992836964962306	f	milktrucknyc
Come get yours at our Cafe on the corner of Ave B &amp; 2nd St! #breakfastofchampions http://t.co/CNN4uvYoZQ	1391353635	429994429240598528	f	waffletruck
Super eat Sunday...we are at the Corner of 67th &amp; Broadway in front of Apple Store, open for biz now-	1391356481	430006364795338753	f	seoulfoodnyc
20 point squares @ FiDi location. Good luck! http://t.co/9ORTPlGqTt	1391357731	430011608752857088	f	shortysnyc
Feel the beautiful weather. Today in Smorgasrburg!!!	1391356928	430008239691169792	f	palenquefood
SunnyYork today and we are in Williamsburg! Come &amp; Enjoy your favorite kind of 'arepa' &amp; all the options we have for you :) Hurry up!	1391356836	430007855165739008	f	palenquefood
@allaamerican it's on the corner of Ave B &amp; 2nd st!	1391358872	430016395196518400	f	waffletruck
RT @Matta2309: @waffletruck making an appearance on ESPN Sunday NFL countdown this morning #superbowl #freeadvertising http://t.co/Rw3Ttpwe...	1391358760	430015924964720641	f	waffletruck
RT @sujonuko: @waffletruck representing in the background on @espn @NFLCountdown in #HeraldSquare #NYC #SuperBowl #SuperBowlSunday	1391358747	430015869893500928	f	waffletruck
@chunkynubian thank you!	1391358729	430015795826282496	f	waffletruck
De Touchdown Throwdown! 12 wafels, a jar of spekuloos and a can of whipped cream. $30. Available everywhere! http://t.co/4odU18ChAe	1391357709	430011515044110336	f	waffletruck
PLEASE, LIKE THE OFFICIAL VALDUCCI'S FACEBOOK PAGE:\nhttps://t.co/RnNFxb2kET	1391359572	430019331678674944	f	valduccis
Happy Super Bowl Sunday!!!	1391360869	430024771490021376	f	neaexpress
RT @MadisonBistroNY: Foodies to follow #FF @itsgluttony @Valduccis @AllTheTastesNYC @cwoodfoodies @33_CoffeeNerd @FraichePR @SoCalWineDiva	1391361927	430029206375112704	f	valduccis
Come watch the supper bowl with us @WebsterHall  starting at 4pm	1391361551	430027630516391937	f	valduccis
Fun fact: Cider donuts make an excellent Super Bowl snack. Open at Bergen and Court today until 3pm !	1391361854	430028903630270464	f	carpedonutnyc
Rooting for anyone?	1391364604	430040435546132480	f	neaexpress
RT @sshekinah18: @Valduccis @SweeteryNYC I have to put you guys up for competition against Sal's to show my fiance that there are better pi...	1391364432	430039717003145216	f	valduccis
If you didnt get to try our #porktrotter with lily flowers last time, we have it tomorrow on 53rd/park! # #zhujiao	1391364685	430040776085483520	f	biandangnyc
Nutella by the spatula? #yougotit #dinges http://t.co/LbIM0iKxB3	1391365621	430044702545805313	f	waffletruck
RT @SuperBowl: FIVE. MORE. HOURS. #SB48 http://t.co/YtVP1kI2I0	1391366286	430047489266581505	f	shanghaisogo
Happy Sunday! #SuperBowlSunday we are love to serve @ParkSlope 7th ave &amp; Carroll st. See you all later.	1391364609	430040457679482880	f	shanghaisogo
I posted a new photo to Facebook http://t.co/dy6oSgv9DQ	1391370117	430063557971939328	f	biandangnyc
I posted a new photo to Facebook http://t.co/KBR85uuFSw	1391370117	430063557695115264	f	biandangnyc
#beforeandafter #porktrotters	1391370116	430063557376356352	f	biandangnyc
Prediction time! Whos your Super Bowl pick? http://t.co/jkysGVMaS7	1391369401	430060555848921088	f	nuchasnyc
http://t.co/r4X5X6TB	1359646681	297005824084176896	f	thecrepestruck
#pix11bowl let's go @broncos and @Seahawks and celebrate win with some curries and bites	1391367736	430053574564126720	f	mausamnyc
Best Coffee, Best Service Period!!! http://t.co/TzzFDPgFTX	1391372646	430074167195869184	f	thegreenradish1
Do you know what this is? #prosonly #dinges http://t.co/DKAbwTPUL1	1391371984	430071389060493312	f	waffletruck
#SB48 with some Desi wings let's go broncos and Seahawks http://t.co/v5fzdEvstF	1391374057	430080086017335296	f	mausamnyc
Shorty's 66 Madison Ave http://t.co/uegGZh6QSY	1391376755	430091400294977536	f	shortysnyc
Super Bowl Sunday @ Shorty's. 576 9th Ave / 66 Madison ave/ 62 Pearl St http://t.co/Of6Wcd6TGb	1391375412	430085768883601408	f	shortysnyc
It's great to see this much energy in the city. Good luck to both teams!	1391375825	430087502142373888	f	neaexpress
Be the life of the Superbowl party: 12 wafels, speckuloos &amp; whipped cream. Available at all the #dinges! http://t.co/7YZZES9nLj	1391376005	430088254881538048	f	waffletruck
RT @USAFoodTruck: Super Bowl boulevard y'all.  We're at 7th Ave and 39th street.  What's more American than the Super Bowl?  #yankeedoodled...	1391375901	430087818623606784	f	shanghaisogo
576 9th Ave http://t.co/YteoqOhrD3	1391379282	430102000051965952	f	shortysnyc
Hungry for change? @grassupforgood with @OrganicValley #GOODfood	1391383972	430121669928038400	f	snowdaytruck
Spicy and sweet go great together on Superbowl Sunday - mix it up by adding maple to your wing recipe: http://t.co/RH0Pc3pin8 \n#maplelove	1391383517	430119765210718208	f	snowdaytruck
RT @EatStTweet: Learn how to expand your food truck business http://t.co/BFQtsE3ANZ	1391382759	430116585949634560	f	snowdaytruck
New technology - keep the sweet news flowing... http://t.co/hzgPD62F3n\n#maplenews #sweetnews #maplewater	1391382725	430116441853935616	f	snowdaytruck
Serving at Bebe's Super Bowl viewing party with @NinaAgdal at Provocateur! @bebe_Stores #SuperBowl #pizza	1391388112	430139036154740736	f	neaexpress
Look who loves valduccis pizza http://t.co/cZTmOGjnlV	1391420803	430276153970933760	f	valduccis
RT @holidayChef: @Valduccis nice to meet u! By http://t.co/zqt5y1R5Id :)) http://t.co/89kTD65fCY	1391419467	430270548560863232	f	valduccis
Love will keep us together http://t.co/hkp2Ihe8yB	1391419242	430269605139849216	f	valduccis
@NinaMarietta commercials though...eh?	1391386769	430133404177539072	f	waffletruck
@DanielChartock we feel your pain.	1391386739	430133275857010688	f	waffletruck
@LilMissChynki a real cool person, more like.	1391386719	430133191874461697	f	waffletruck
@Rosemaryrr the best way.	1391386679	430133026920861696	f	waffletruck
Taking your date out for a wafel? #betterthanamovie #goodmoves http://t.co/0KxI795oCO	1391386622	430132788818636800	f	waffletruck
@chrnola no judgement here.	1391386329	430131556397903872	f	waffletruck
@its_me_jonathan @asshleyyyy__ yeah, can we can we?	1391386313	430131492522819584	f	waffletruck
@NaeemDouglas we couldn't agree more. Had to had to.	1391386289	430131389267456000	f	waffletruck
@OriginalSoupMan still alive and well no matter what the economists say.	1391386265	430131289656930305	f	waffletruck
@chrnola lets us not forget the wipe dinges also.	1391386223	430131111222857728	f	waffletruck
@that1Katherine too long, we say.	1391386197	430131005731897344	f	waffletruck
RT @that1Katherine: @waffletruck REUNITED AT LONG LAST. Yes, I am lucky to be in such a committed and loving relationship w/ my waffles. ht...	1391385113	430126458183643136	f	waffletruck
@leebibby1980 well sorted out.	1391385101	430126408942510080	f	waffletruck
@HenryBottjer shhhh...it's a secret.	1391385085	430126339816185856	f	waffletruck
@TKYSK8R you may just.	1391384706	430124749302558720	f	waffletruck
@rizexperience tis only found on the trucks.	1391384693	430124694759833600	f	waffletruck
@AwesomeGrub it's the secret dinges drawer.	1391384666	430124581509398528	f	waffletruck
@nycitygem @nsj2kx right?!	1391384632	430124441654153216	f	waffletruck
@katiealbanese8 ...what would you do for a full size one?	1391384618	430124380128296960	f	waffletruck
@_ChrisDillon @ESPNNFL @AdamSchefter nothing goes better with football than wafels... #exceptmaybebeer	1391384571	430124184661155840	f	waffletruck
RT @nfl: They are who we thought they were! #SB48Champs http://t.co/T09KdlA7OB	1391397748	430179451809595392	f	shanghaisogo
RT @SuperBowl: The sights and snacks of #SB48: https://t.co/THXAfLAdAy	1391394774	430166980273143808	f	shanghaisogo
Congrats @Seahawks #SB48	1391396853	430175699509719040	f	mausamnyc
RT @LikeALocalBklyn: It was so good! RT @asiadognyc: Come by @smorgasburg in Williamsburg today and tomorrow for our kimchi mac n cheese ma...	1391431650	430321646206214144	f	milktrucknyc
@LikeALocalBklyn @asiadognyc @smorgasburg :)	1391431643	430321619622694912	f	milktrucknyc
Seriously?! #snow http://t.co/qF1sp5ywGX	1391431802	430322285992738816	f	thesteelcart
Grill on Wheels will not be out today due to weather conditions.	1391432458	430325037678489600	f	grillonwheelsny
snowy morning!  so change of plan: we're headed to church &amp; lispenard today NOT columbia. preorder at 6465046455 or o/l @foodtoeat.com.	1391433417	430329058002362368	f	milktrucknyc
Happy Monday! We r here46 Str bet 5 &amp; 6 ave. Fresh Curry N Bitesfor this day. All platters servedwith parata &amp; samosa	1391433957	430331322750365696	f	mausamnyc
@valduccis got carried away with making these cupcakes for the supper bowl party http://t.co/mg4eB5WwAb	1391434259	430332592517152768	f	valduccis
Super Bowl hangover + snowstorm = day off for the jawn! We're playing hooky with the rest of you! See you manana	1391434719	430334519393415168	f	philssteaks
@SashaLamb find us today at church &amp; lispenard!	1391434625	430334124516466688	f	milktrucknyc
@joedelucia @SarahSpain @biggayicecream @KatzsDeli all together?...blender?	1391434539	430333763902783488	f	waffletruck
@onacasiP color us impressed!	1391434461	430333440123478016	f	waffletruck
@marivicgirl we'll take it!	1391434434	430333324444594176	f	waffletruck
@merppanda we don't blame you. Hard to take a picture when the camera is covered in whipped cream and chocolate anyways.	1391434411	430333229338726400	f	waffletruck
@_nananadia you'll get no judgement from us.	1391434351	430332976204095489	f	waffletruck
@HenryBottjer suppose we did at that.	1391434306	430332786432827392	f	waffletruck
Good morning everyone. Due to the weather the truck and the cart won't be making it out today. We will see you all tomorrow. Stay warm &amp; dry	1391435156	430336352451043328	f	schnitznthings
Sorry FiDi &amp; WFC, no truck today. Stay warm!	1391435761	430338891640733696	f	mamuthainoodle
Due to the severe winterstorm alert, we will be cancelling service today. Stay warm guys....	1391435294	430336931147563009	f	korillabbq
Alright weather. You win this round... The Cart will be staying in today &amp; watching cat videos. #DUMBO #snowday	1391436001	430339898110132224	f	thesteelcart
staying in today, Betty doesn't like the slippery roads:( have a snow ball fight today!! #snowday back tomorrow @Jay &amp; Water!	1391435394	430337351290597377	f	sweetchilinyc
Good morning NY! Celebrating or disappointed?	1391436126	430340422033227776	f	neaexpress
Sorry all! We will not be out for service today due to the slippery driving condition! #staysafeandwarm	1391436834	430343392006926337	f	biandangnyc
Snow...again?! We will be back on the streets tomorrow! Stay tune...	1391436923	430343764901494784	f	domotaco
@MelissaBobe  Hey Melissa Drita Loves @Valduccis Pizza! http://t.co/m2LsBJFHKL	1391437682	430346947635843072	f	valduccis
RT @elcocotero228: A very white monday to start the the month of love and friendship.Let's have a very productive one.Tonk iu http://t.co/1...	1391437622	430346696078675968	f	shanghaisogo
Sorry folks, we're calling it a snow day for us today. Stay safe and warm everyone!	1391438540	430350548160630784	f	toumnyc
Peeps, due to the weather we r off the road today	1391438303	430349551346913280	f	fritesnmeats
RT @RealJoelIsrael: Seahawks win SuperBowl. In related news, Hell freezes over. http://t.co/cyNcxJQvEC	1391438086	430348640461524993	f	shanghaisogo
#bigred &amp; our #lobstermen have gone skiing today- well, we wish anyway! #clawsup. See ya tomorrow NYC.	1391439184	430353247698952192	f	lobstertruckny
@starrett601 we will be serving lunch today on 26th and 12th. Call ahead your order to 9174397522	1391438964	430352324041908224	f	eddiespizzany
Oh Hudson/KIng St. how we love to play with you. We're out here playing in the snow, waiting and hoping that you will come play with us too.	1391439559	430354821078470657	f	sweeterynyc
Off today.. Snow day	1391439514	430354631143608320	f	disosnyc
#crabcake slider, lemon garlic aioli, old bay slaw- a picture is worth a thousand words! http://t.co/VnEDjMV63F	1391439935	430356394458365952	f	getstuffednow
Bessie's at @Columbia, call (646) 504-6455 to pre-order or http://t.co/IwkqcCHPzF. Sandwich menu always at @houstonhallnyc	1391439657	430355231910547459	f	milktrucknyc
More Snow. What else is new? The lot's closed. We'll see you tomorrow.	1391440181	430357429138632704	f	kimchitruck
Snow- We are at 51st between Park and Madison Ave	1391440953	430360666047000576	f	seoulfoodnyc
Not the easiest commuting day: http://t.co/dpaoZiUEAB	1391440969	430360734229594112	f	neaexpress
NOT at columbia today. snow stopped us. we  ARE at church &amp; lispenard. 646504645( ir http://t.co/psDZsxYjzF.	1391440927	430360556894449664	f	milktrucknyc
Kotmadam @ 23rd &amp; 5th till 7p\nGoesting @ Broadway &amp; 66th till 8p	1391441209	430361739700350976	f	waffletruck
Ugh-more-snow Monday!  \nLe Cafe @ 15 ave B open till 11pm \nDe Cabana @ 35th &amp; Broadway open till 10pm	1391441123	430361381372583937	f	waffletruck
Off the road today - stay safe - when does #Spring begin???	1391441407	430362572634595328	f	mikenwillies
RT @heidisloane: Snow days makes me crave all things off the @SnowDayTruck menu. @DriveChangeNYC  can you park your maple goodness in Bushw...	1391441630	430363505599201280	f	snowdaytruck
No lunch today due to the weather- starting to worry that all these #snowdays are going to cut into our summer vacation!	1391441991	430365021504163842	f	morristruck
RT @SweeteryNYC: Oh Hudson/KIng St. how we love to play with you. We're out here playing in the snow, waiting and hoping that you will come...	1391441934	430364781229654016	f	valduccis
RT @macdrap50: #Win A $20 Coupon To @BrooklynPopcorn &amp; Purchase Delicious Gourmet #Popcorn! Via @MrsJessicaS http://t.co/kY4FXFpxVb	1391441819	430364301245702144	f	brooklynpopcorn
Off the road #Snowday .....stay safe and warm!	1391442920	430368918470160384	f	polishcuisine
Snow! No truck today, so come have tomato soup &amp; grilled cheese &amp; cookies at our shop! Open 'til 8pm, 521 Court st #brooklyn	1391443224	430370190967451648	f	thetreatstruck
Don't mean to rain on your parade, Seahawks, but we're ALL green!	1391443273	430370396287021056	f	neaexpress
@pelukaltwasser Hey Pelu, our schedule is posted every week on our website: http://t.co/YT3PReTIPn. Hope to see y'all soon!	1391444327	430374817620295681	f	milktrucknyc
We are at the DUMBO lot on Jay &amp; Water streets! We have #fish tacos today as a special!	1391444537	430375700982693888	f	mexicoblvd
RT @korda08: Man if I was in NYC right now I'd wonna watch the game in @shortysnyc damn living in the UK!! Someone give me a jobs in NYC pl...	1391445299	430378895792431104	f	shortysnyc
@pelukaltwasser great! we're around from 10am-3pm every day. stay warm!	1391445557	430379978371653632	f	milktrucknyc
Hey All,\n\nThe Radish is taking a winter snooze and cant wait to come back STRONG with our DELICIOUS NEW MENU...Will keep you posted!	1391445302	430378907502518272	f	thegreenradish1
Good morning new york !!! We r stay at 46th between 5th ave. And 6th ave. Try our ramen noodle soup. Thanks :)	1391445575	430380052887662592	f	bobjotruck
RT @FoodtoEat: @ETRAVAGANZA @funbunsnyc @NuchasNYC @ToumNYC @SnapTruck 5 Superfood Combos That Will Give You #Olympic Strength http://t.co/...	1391446541	430384106523086849	f	toumnyc
RT @FoodtoEat: @ETRAVAGANZA @funbunsnyc @NuchasNYC @ToumNYC @SnapTruck 5 Superfood Combos That Will Give You #Olympic Strength http://t.co/...	1391446485	430383871235227648	f	nuchasnyc
Bobjo express stay at State st &amp; whitehall st.\nTry our ramen and platter!\nThanks!	1391445992	430381803216863232	f	bobjotruck
We are giving free mint tea with rose water	1391446264	430382942352052225	f	chefsamirtruck
We are on water st and old slip!!	1391446219	430382754820542465	f	chefsamirtruck
"I let you have your little game, but I need to get back to work. There are lives to ruin!" - The Weather	1391446973	430385915157295104	f	neaexpress
No lunch service today due to the weather, instead we're building a snowman in Central Park!	1391446964	430385878289383424	f	bigdsgrub
Rest in Peace, Phillip Seymour Hoffman. Thank you for all that you gave.	1391448709	430393199325351936	f	neaexpress
Stay warm ny!	1391450724	430401651170869248	f	mooshugrill
@justyniak I was earlier!	1391451189	430403599899054080	f	bigdsgrub
RT @annadercole969: @Valduccis grazie!	1391451917	430406655181082625	f	valduccis
Here are some more things we can learn from the Super Bowl Champion city #Seattle #green #healthylife http://t.co/izYrp1O4cI	1391452231	430407972091875328	f	neaexpress
One of my favorite foods. @polishcuisine http://t.co/ivz2U2tPij	1391452866	430410634266546176	f	valduccis
@justyniak wondering around the winter wonderland?	1391452369	430408551685566464	f	bigdsgrub
@foodtoeat @etravaganza @funbunsnyc @toumnyc @snaptruck Thanks for the mention! We're in good company	1391452247	430408037678215168	f	nuchasnyc
RT @TenchyRod: Esta tarde estaremos hablando del Super Bowl #48 Y la victoria de Seattle Seahawks. En @impactodeporti @Elreydelaradio.	1391452866	430410633436467200	f	tacobite
RT @MzSiMeLater: This sandwich from @shortysnyc is everything right now  http://t.co/4Pwa9pQQLq	1391453406	430412898998169600	f	shortysnyc
RT @Sexyfoodtrucks: @shortysnyc can we get some cheesesteak retweet love @Sexyfoodtrucks	1391453375	430412770417606656	f	shortysnyc
RT @Valduccis: One of my favorite foods. @polishcuisine http://t.co/ivz2U2tPij	1391453132	430411749624676352	f	polishcuisine
@amalster  sorry the weather is really bad	1391455436	430421412000849920	f	lovemamak
RT @katazcona: @MexicoBlvd just wanted to let you know... i like it better when youre at 51st bc youre closer to my heart... and mouth. #fa...	1391455203	430420435495165952	f	mexicoblvd
#DUMBO #fishtacos #love	1391455184	430420356625485824	f	mexicoblvd
RT @FoodtoEat: @ETRAVAGANZA @funbunsnyc @NuchasNYC @ToumNYC @SnapTruck 5 Superfood Combos That Will Give You #Olympic Strength http://t.co/...	1391455990	430423736454774784	f	funbunsnyc
Unlike Ron &amp; Hermione, clean energy and pizza were always meant to be together.	1391456732	430426849383313408	f	neaexpress
The snow is getting crazy! Keep warm and be safe friends!	1391458514	430434325243637760	f	nuchasnyc
Yes dinner will be served! Bway &amp; 67str next to  Curry N Bites got yr delicious platters for all taste buds.	1391459263	430437464067432448	f	mausamnyc
RT @Glangholtz: #snowday, noun: a food truck that serves social justice. learn more in @ediblemanhattan's upcoming profile of @DriveChangeN...	1391462062	430449204851662848	f	snowdaytruck
RT @noahWG: The #snowday is beautifying Queens as we speak: http://t.co/TuzG6nDuQV	1391462041	430449118524502016	f	snowdaytruck
.@bakedbymelissa maple infused cupcakes? Happy #snowday	1391462002	430448953197604864	f	snowdaytruck
Let it snow...Let it snow...Let it snow!\nHappy snow day! Make everyday a snow day with @SnowDayTruck (coming to NYC streets soon!)	1391461885	430448461121855488	f	snowdaytruck
RT @DriveChangeNYC: What are you doing on this lovely NYC snow day? Let us know #snowday and see you soon @SnowDayTruck !! http://t.co/2iml...	1391461750	430447894496559104	f	snowdaytruck
Congratulations to Seattle for proving that birds are better at football than horses	1391462130	430449490240471042	f	neaexpress
Are you hungry? We have arrived- West 4th and Greene street NYU...	1391465917	430465373465366528	f	seoulfoodnyc
RT @TimesSquareNYC: On any given day in #timessquare, there are over 350,000 people. Imagine finding the ONE person for you among them: htt...	1391469042	430478482754514944	f	nuchasnyc
RT @marioandreolini: Times Square 1950's,photo by Andreas Feininger http://t.co/L0Fx6FjMbq	1391469008	430478338701139968	f	nuchasnyc
RT @BCDRestaurants: Check out our client @Mexicue featured in @FoodAndWineMag list for best #Chili in the #US #BCDStrategic http://t.co/x5v...	1391479112	430520719928467456	f	mexicue
RT @CR_FromThe_DR: @carlssteaks  Best Cheesesteak In NYC... No Argument! http://t.co/LzPvMruGTJ	1391471112	430487163298668544	f	carlssteaks
RT @artichokepizza: click and vote SOLO BELLA for Best Pizza in NJ- it's the family so you know its real! http://t.co/aIP5K30AsR	1391472244	430491910047023104	f	valduccis
Korilla Hoodies available. http://t.co/EjsOM8nlEG for more info! http://t.co/uxPntZAS4X	1391472535	430493129905815552	f	korillabbq
RT @Regan_Hofmann: In quickservice food, the golden ticket is figuring out Chipotle's model for other cuisines. @sweetchilinyc's got a good...	1391479637	430522919253737473	f	sweetchilinyc
More snow coming!? Stop the madness!	1391515910	430675059536310272	f	bigdsgrub
The world is perfect http://t.co/p9YbVIRXP4	1391516959	430679461118226433	f	valduccis
New menu item today on 55th and broadway...Tonkatsu curry rice!  #madefromscratch #realcurry #notcurryroux	1391517495	430681706249461760	f	domotaco
beautiful sunny day! Curry N Bites Bway bet 55 &amp; 56str. Come get yr favourite fresh lunch plattersall served with samosa and parata	1391518041	430683999736848385	f	mausamnyc
Hello again twitter friends! Chelsea lets do breakfast and lunch w. 30 and 11th!	1391519534	430690262034427904	f	burgersandbites
It's #TacoTuesday at @BrookfieldPLNY today! Vesey Street and North End Avenue, 11a-2:30p. Preorder for pickup by calling 646-543-BIGD #WFC	1391520357	430693711497146368	f	bigdsgrub
Disos at our Tuesday spot, 48th between 6 and 7 ave\n\nCall in your orders here: 917-756-4145	1391520874	430695881609064448	f	disosnyc
It's @dumbolot day! Jay &amp; water 11-3. Hot coffee + spicy food= internal warmth! #sriracha #toocold #yum	1391520792	430695535377666048	f	sweetchilinyc
"@DomoTaco: New menu item today on 55th and broadway...Tonkatsu curry rice!  #madefromscratch #realcurry #notcurryroux" hey wanna trade?	1391522827	430704071675486209	f	mooshugrill
Finally done with #ChineseNewYear leftovers? Continue the feast with #MSG on 50th &amp; 6th today! #nomsgtho	1391522714	430703598281166848	f	mooshugrill
RT @CherryRed23: @SweeteryNYC I'm in love with your Bacon scone! Perfection! 1st time trying your stuff &amp; I'm a fan! http://t.co/oRiX0PXaHA	1391524020	430709075278430208	f	sweeterynyc
Holla Back!! We are On 51st between Park and Madison!	1391523816	430708222140645376	f	seoulfoodnyc
Hellooo #MidtownWest! We've missed feeding you! Come on by to 46th btwn 5th &amp; 6th for a delicious beef kabab! #yummy http://t.co/5iQXoj2n9w	1391523315	430706116851671040	f	toumnyc
We're on 55th and Broadway today with our traditional grilled kielbasa and yummy pierogi! #Itsnotthatbadout	1391523322	430706147805659136	f	polishcuisine
Specials today are:\n\n- Toasted ravilois\n- homemade penne vodka sauce	1391523718	430707806988419073	f	disosnyc
Catch us for lunch today at SoHo's Varick &amp; Vandam	1391524253	430710053709299712	f	korillabbq
RT @DomoTaco: New menu item today on 55th and broadway...Tonkatsu curry rice!  #madefromscratch #realcurry #notcurryroux	1391524308	430710284081446912	f	biandangnyc
Check them out! http://t.co/UklD2B0ooI	1391524231	430709961799135234	f	biandangnyc
Midtown West is still a super mess so we're on 48th and Park this morn. Breakfast til 11. Lunch til 2	1391524574	430711401187774464	f	philssteaks
Dumbo, we're baack. Slinging tacos at Jay &amp; Water St, @dumbolot 11:30am - 2:30pm	1391524785	430712286206894081	f	kimchitruck
RT @fourwheelfoodie: @Kimchitruck has a beautiful Korean fusion and will be sure to have you bursting with fresh, delicious flavors.	1391524537	430711244840902656	f	kimchitruck
#big red is off the road today. too much weather out there for her tender wheels. OPEN at the LB in #redhook 12-7. #clawsup	1391525726	430716229507375104	f	lobstertruckny
The cart will be on 55th &amp; broadway from 11:00-2pm. We missed you last week, so we hope that you'll come get some schnitz today:) see ya!	1391525558	430715526911115264	f	schnitznthings
We are back:)! The truck will be on 52nd b/w 6th &amp; 7th aves from 11:30-2pm. We've missed you. Schnitzification in full effect!	1391525431	430714995656368129	f	schnitznthings
53rd and park! #taiwanese #biandang #nyc #foodtruck	1391526805	430720758684188673	f	biandangnyc
Bessie's at 25th &amp; Park, call (646) 504-6455 to pre-order or http://t.co/IwkqcCHPzF. Sandwich menu always at @houstonhallnyc	1391526059	430717626231164928	f	milktrucknyc
Snowed in Brooklyn. Jay &amp; Front through lunch. Spicy Chicken Chili &amp; Mushroom Barley Soup on board.	1391526159	430718046211440640	f	thesteelcart
Hello FIDI, lunch today @ 10 Hanover sq b/t water st &amp; pearl st. Burger of the week THE CHEVRE TRUFFLE BURGER preorder 9172929226	1391526854	430720963911880704	f	fritesnmeats
RT @SFATW_Official: Memories from #NYC, "best #schnitzel ever"! Thank you @schnitznthings @ishaigolan #streetfood #sfatw http://t.co/gwc5jq...	1391527450	430723463184400384	f	schnitznthings
Hello New Yorkers Today Ur favorite food truck is parked @ WFC South... Come enjoy our lovely Hot Soups &amp; Ur Favorite Paisa Arepas...	1391527370	430723125622611968	f	palenquefood
@tmilewski we hope to get back as soon as the weather gets better	1391527144	430722177273724928	f	burgersandbites
@SFATW_Official @ishaigolan thank you guys for coming by that time! It was a blast and hope you guys really enjoyed the schnitz:)	1391527949	430725556284694528	f	schnitznthings
Grill on Wheels is in Midtown! Parked on 47th off Park Ave today! #schnitzel #crazy chicken#sausage	1391528519	430727943942590464	f	grillonwheelsny
RT @dumbolot: We got @sweetchilinyc @KimchiTruck and @carlssteaks doing their dumbolot thang today!	1391528708	430728739652382721	f	sweetchilinyc
Just added Brooklyn East India Pale Ale on tap. http://t.co/XNjxrpTGmv	1391529341	430731391882387457	f	shortysnyc
Just added Empire White Aphro on tap. http://t.co/Ft7snSbRKy	1391529335	430731370420125696	f	shortysnyc
Cure the winter blues with craft beer and bourbon! 3 Locations and the best cheesesteaks in NYC! http://t.co/qan6zoyf3g @beermenus	1391529103	430730395936894976	f	shortysnyc
RT @dumbolot: We got @sweetchilinyc @KimchiTruck and @carlssteaks doing their dumbolot thang today!	1391528709	430728742550659072	f	carlssteaks
!!! Tues, Feb 4th Hey 45thers! Since we missed seeing you last week, we're here today!!!12-3:30 45th &amp; 6th!!!	1391529216	430730868127465472	f	thetreatstruck
@brunog @tmilewski @adamcjonas nooooo! We are gonna have to devise a way to get him a burger	1391529602	430732486885531648	f	burgersandbites
Our best buy of the #LunarNewYear in Chinatown? Sugarcane! One stick is $3 , a joy to chew on &amp; get sugar high! http://t.co/sflABCX0iX	1391529630	430732605994979328	f	getstuffednow
The best thing about this weather? It's a perfect excuse to binge watch @netflix	1391529638	430732640178552833	f	neaexpress
We are open on 55th and Broadway with special PACZKI for dessert today! #pierogitime @midtownlunch @nystfood @randomfoodtruck	1391530076	430734477732904960	f	polishcuisine
Check it out for Shanghai Sogo's Today Special: braised beef shank noodles soup. http://t.co/FXG9JHTAWt	1391529957	430733977637625856	f	shanghaisogo
We are already on 46th between 5&amp;6th ave!!! Serving ya lunch 11~3pm. See ya real soon! &gt;&gt;SOGO FOR IT &lt;&lt;......	1391529693	430732871176028160	f	shanghaisogo
RT @dumbolot: We got @sweetchilinyc @KimchiTruck and @carlssteaks doing their dumbolot thang today!	1391529760	430733150525091840	f	kimchitruck
Buenos Dias! Parked and ready to go at 46th between 6th &amp; 7th!! #tacotime	1391531352	430739827643133952	f	mexicoblvd
And Bobjo express stay at State st &amp; whitehall st today. \nThanks!	1391531220	430739274812887040	f	bobjotruck
Hello,ny! \nWe are open at downtown today. \nLocated in Water st&amp;Hanover sq.\nTry our ramen noodle and rice platter with fresh cook dumpling!	1391531129	430738890958577664	f	bobjotruck
Starret Lehigh...back at it today...a little snow never hurt anyone.	1391531905	430742147978260480	f	mexicue
Pork tonkatsu curry rice http://t.co/fc0nXobkK4	1391531626	430740976865247232	f	domotaco
Add toasted ravilois as a topping to any sandwich!! What?!	1391531687	430741235515805696	f	disosnyc
Just added Allagash Fluxus 2013 on tap. See our full beer menu: http://t.co/qan6zoyf3g @allagashbeer #BeerMenus	1391533083	430747087949791232	f	shortysnyc
Just added Allagash Fluxus 2013 on tap. http://t.co/ih0dBisI7A	1391533083	430747087051837440	f	shortysnyc
Just added Ommegang Hop House on tap. See our full beer menu: http://t.co/qan6zoyf3g @BreweryOmmegang  #BeerMenus	1391533032	430746874749124608	f	shortysnyc
Just added Ommegang Hop House on tap. http://t.co/Vwd31pZLVb	1391533031	430746868679589888	f	shortysnyc
Just added Coney Island Mermaid Pilsner on tap. See our full beer menu: http://t.co/qan6zoyf3g @ShmaltzBrewingW #BeerMenus	1391533010	430746783422377985	f	shortysnyc
Just added Coney Island Mermaid Pilsner on tap. http://t.co/QWEXu79JHQ	1391533010	430746781018628097	f	shortysnyc
We are on 36st and broadway!!	1391532782	430745824583512064	f	chefsamirtruck
Just added Oskar Blues G'Knight on tap. http://t.co/1PdF7e4lJB	1391533272	430747882489008128	f	shortysnyc
Just added Shiner Bock on tap. http://t.co/G07dkIJGhc	1391533272	430747881398882304	f	shortysnyc
Just added Shiner Bock on tap. See our full beer menu: http://t.co/qan6zoyf3g @shinerbeer #BeerMenus	1391533272	430747880941715457	f	shortysnyc
Just added Bronx Brewery Black Pale Ale on tap. http://t.co/zPj7DWyqvj	1391533272	430747879758503936	f	shortysnyc
Just added Oskar Blues G'Knight on tap. See our full beer menu: http://t.co/qan6zoyf3g @oskarblues #BeerMenus	1391533270	430747873400352768	f	shortysnyc
Just added Bronx Brewery Black Pale Ale on tap. See our full beer menu: http://t.co/qan6zoyf3g @TheBronxBrewery #BeerMenus	1391533269	430747869319278592	f	shortysnyc
Just added Ace The Joker Hard Cider on tap. http://t.co/LcpY5bqYVr	1391533269	430747866924339200	f	shortysnyc
Just added Ace The Joker Hard Cider on tap. See our full beer menu: http://t.co/qan6zoyf3g @AceCider #BeerMenus	1391533268	430747864353239040	f	shortysnyc
Valentine's Day is coming up. Consider this your friendly reminder to plan something for that someone.	1391533642	430749431320043520	f	neaexpress
RT @randomfoodtruck: Hello, sunshine! Let's soak this up while we can... @DomoTaco @mausamnyc @PolishCuisine	1391533255	430747812100575232	f	polishcuisine
For our customers on 52nd &amp; 6th who would like to place a preorder please call (202) 538-3906 . We apologize for the inconvenience	1391534837	430754447355289600	f	schnitznthings
RT @ilovequotebooks: http://t.co/jiQtk3tV	1391534317	430752266396925952	f	valduccis
It's feedin' time @BrookfieldPLNY! Vesey Street and North End Ave, now till' 2:30pm. Preorders call 646-543-BIGD, operators are standing by!	1391534152	430751572222812161	f	bigdsgrub
RT @USAFoodTruck: Hey everyone.  Weather is turning bad but were at 22nd and 5th in Flatiron for our last day in a while. #isitsspringyet?	1391534951	430754925141065728	f	shanghaisogo
Sun is out, Shanghai Sogo is out! come out get some Asian tapas from us. 46th &amp; 5~6th ave is where it's at.	1391534654	430753679088844800	f	shanghaisogo
@marcjlerman truck will be back on the road next week.	1391535746	430758257012252672	f	shortysnyc
@BaldinBro Sorry Sam, the cart doesn't do so well on messy winter roads. We should be back on Thursday.	1391537144	430764120968011776	f	thesteelcart
La gringa food truck @ 51st&amp;park ave till 4pm come beat the cold with a 1 1/2 pound burrito tacos 3 for $10 nachos and much more see you	1391511828	430657940459384832	f	lagringatruck
http://t.co/8sWkciLIX0	1391484112	430541691091578882	f	lagringatruck
N7 and Bedford tonight till 4am... Come get your burritos!	1391226920	429462946235052033	f	lagringatruck
Lagrina food truck has sold out see you next week	1391201786	429357526334058496	f	lagringatruck
It's cold out today but lagrina food truck has some heat\nHot 1 1/2 pound burritos tacos 3 for $10 we@ w55st&amp;broadway till 3pm\nBurritos	1391174059	429241233719197696	f	lagringatruck
Come for a big fat burrito today located on Bedford ave and N7.. Flava flav is serving up ; )	1391031911	428645020280061952	f	lagringatruck
It cold outside come beat the cold with a burrito taco or nachos\nLa gringa food truck is @51st&amp;park ave here till 4:30pm king of burrito	1390999239	428507986399883264	f	lagringatruck
La gringa food truck is 51st park \nCome get your burritos with sweet plantains\nTacos and much more home of the burrito king	1390920989	428179781885386752	f	lagringatruck
La gringa get your tacos burritos and much much more 51 and park ave till 3 pm	1390846155	427865905604091904	f	lagringatruck
La gringa food truck is @bedford and north 7th\nCome get your burritos	1390687132	427198913683410944	f	lagringatruck
La Gringa truck is parked at 55street and Broadway today. : )	1390309952	425616906033586176	f	lagringatruck
La grina food truck now serving breakfast&amp;lunch\nWe are @ 55th&amp;broadway till 3pm\nCome get your burritos nacho taco and now breakfast burrito	1390309077	425613234536587264	f	lagringatruck
We will be @ bedford and N7.. Come have some burritos or come to la gringa taqueria 800 grand street	1390099956	424736117502803968	f	lagringatruck
Oh man we was so busy I forgot to post a tweet where we are today. 55 broadway	1389988716	424269542261796864	f	lagringatruck
Madness at parkave http://t.co/s7ZqxKVHjO	1389930980	424027383734472704	f	lagringatruck
La Gringa Truck Opens Today.. 51street and Park Avenue (corner) come for lunch!	1389878477	423807168140554240	f	lagringatruck
http://t.co/5P3BEkx0kG	1388732850	419002058201497600	f	lagringatruck
http://t.co/URYMM9MLpe	1388509908	418066975508545536	f	lagringatruck
http://t.co/T58yXae2JH	1388123605	416446703252697088	f	lagringatruck
@KPalmer433 our main store is in east Williamsburg 800 grand street brooklyn ny 11211.. We are rolling out the food truck  soon	1385908270	407154913538764800	f	lagringatruck
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

