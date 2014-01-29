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
526fef71498e92d1ace459d9	https://irs0.4sqi.net/img/general/	/60805368_eCRrBwapYrNL8fM9tmIaLCfnlhQYb9ASU-ZkaR1Og54.jpg	public	mamuthainoodle
4fb29dc4e4b0e08c1e225555	https://irs2.4sqi.net/img/general/	/ckjwTj4Fd2cRoZvDQZw_1jYdwuBF4BsfV4ZWc5oElFo.jpg	public	eddiespizzany
5249c4bb498ecd25dde27c5e	https://irs2.4sqi.net/img/general/	/764670_x0RdEOs5TL4SEe2zGgpkzPFBFmlFV7-6UQiVtoFeHaY.jpg	public	goburger
5182ad6b498ef6cb59d48783	https://irs2.4sqi.net/img/general/	/39425123_zPh6ih4GAAygbhRJ-pyPdCr5TI3rXafgKyIEEK4HpHY.jpg	public	goburger
51af7257498e0c7f8979c05d	https://irs3.4sqi.net/img/general/	/752258_nUJpoSxZ8p9BBJMG5ISetpo3DDLzycLT_gT3z9fvJmI.jpg	public	getstuffednow
523c8b2a498e959b87f8ded2	https://irs0.4sqi.net/img/general/	/39707564_-WCsPSk2ExKeZ8q06DtUQrpt_vcWG9-AzvFoToSdQqY.jpg	public	getstuffednow
50ca356fe4b05b0bb93edc40	https://irs0.4sqi.net/img/general/	/1590381_NyRIp7fXJtGoJoXp25IcMmufNufPxxvLEj3TVYXRo5g.jpg	public	getstuffednow
52013fe1498e5f476bfdcf83	https://irs3.4sqi.net/img/general/	/30611522_DHhazmY8dyNAbmijjHX7jyyfVBEiugL5-GJcTLuYjS4.jpg	public	getstuffednow
4f7deaf5e4b0ffb6a3f2008e	https://irs1.4sqi.net/img/general/	/Xho5Xq8BtpNhEQvH0KRI3yX4kUstFRwTxEDj6QoawcM.jpg	public	palenquefood
521cdbc611d2549cf41dcf9c	https://irs1.4sqi.net/img/general/	/926357_0BYLrfqHavxLIHQNkWupu34ImE55HTUVGGDJjycyOVM.jpg	public	seoulfoodnyc
51c213db498e0748ab0dca3c	https://irs0.4sqi.net/img/general/	/53641916_5aNKp9fdHx3i_Pi15Z_X6pE3fAsTX35YBQ0nlmZGfaA.jpg	public	morristruck
519fa37b498e7adf7e8ebce3	https://irs2.4sqi.net/img/general/	/47170230_A9xVWAtkJBP-vVqUF1q2WlK8yuZTf1CVQz0JcPrHGY0.jpg	public	taimmobile
4dfa4a9840a3542ff44549df	https://irs3.4sqi.net/img/general/	/VBAJNQCBWDMP2WKDXJ5QHQ0WYF1MKHZSLUAZZJXKDBDLDUWG.jpg	public	taimmobile
4fa814d1e4b0d607baf8bd9d	https://irs1.4sqi.net/img/general/	/2drHnu4mqj-uzpwwcJa3MatYGD7KFuxjE472rButWlM.jpg	public	taimmobile
51cb2c41498e9851cecdd49a	https://irs2.4sqi.net/img/general/	/5728350_vuJ4ORu0wHhd-B-f4FTNfsoIhfHgtJRMJc-QEeiYmNQ.jpg	public	taimmobile
51ab89bb498e83fced4cefd6	https://irs1.4sqi.net/img/general/	/66074_8dLzCKmVRde0Uvtx_NSl9SKROFh0kat1IQgcAvU4J3M.jpg	public	delsnyc
512161e0ebca7d20d6a70104	https://irs0.4sqi.net/img/general/	/4574_ZC6mf3ha1jNXmFUDgtNsN3zIf-NHyqgxA3WkUkOl4mY.jpg	public	biandangnyc
525b3a3711d2040fdcbd6fee	https://irs3.4sqi.net/img/general/	/52031712_DN0C9vfm3iv1geUuFX92Pt0jwgl8NhbGokLj_o0Ebjg.jpg	public	mooshugrill
529fe66b498e1fd14afe696f	https://irs1.4sqi.net/img/general/	/68150_h0wbg6xbNwrEjXD6uaE12ZDZYF_h55LN99Es520nMBI.jpg	public	mooshugrill
5213a7c011d27a56f99dfba3	https://irs3.4sqi.net/img/general/	/11074699_K2ka1_NxiELyTqgjvY3oMN70IUxIlADqRIAb5QpzsLM.jpg	public	mooshugrill
516d98b8e4b0b059e50ff5ad	https://irs2.4sqi.net/img/general/	/117715_BoNkQJO4jPWEtg_ef4-URb7IseoIXnYiP5vkvWJtezg.jpg	public	toumnyc
516452a5e4b0e1b216fdbaa4	https://irs1.4sqi.net/img/general/	/26263584_5wpEOb9FygNRBFQySA-pE1t1q_E9jVM_4mx2mnw5fAU.jpg	public	toumnyc
51716b5f498e03d8bc252c48	https://irs1.4sqi.net/img/general/	/11709298_S8klPxq0yPyZw2X9-_0IZyk6TFTn9xi5SWd_6BGCeVM.jpg	public	toumnyc
5033cee6e4b03e64bc749ee7	https://irs0.4sqi.net/img/general/	/tIyy6IAKcw2SSiX5JSPBCURstZZisntK_46plgrfdJ0.jpg	public	blend_express
519babe8498e355d9d35fca0	https://irs2.4sqi.net/img/general/	/65817_6p9jSMaQMqP9QGn3KOIyuDOG15jaLxIPvsdrpZGWdj8.jpg	public	blend_express
52407581498e6271e84d0d20	https://irs3.4sqi.net/img/general/	/663291_BQuSIJb2d0ODso7gvZiRLuvYbp3sg4FwHG2u0kAwsmE.jpg	public	gcnyc1
51eae36e498e58d50e5683ba	https://irs1.4sqi.net/img/general/	/331066_SArUzXa_cz_-YMQco1rwYAfU8a99TZCHJX9a2WA3fHg.jpg	public	gcnyc1
507b0648e4b0109f3656e2d2	https://irs3.4sqi.net/img/general/	/76137_7JNe3m0dO2MZ7a9rkqa_DTlnrw0LyNitqksFG7_5IC8.jpg	public	lobstertruckny
5203bd51498ed50247ee01dd	https://irs0.4sqi.net/img/general/	/60805368_HlIeqCMjY2I5md2mzI5crKizc9wVPUZo_sBmC6zrPEA.jpg	public	mamuthainoodle
516ee142e4b04f28d58be309	https://irs0.4sqi.net/img/general/	/36812449_DjR1ynMnMpwj-KmiWPZQldmGQwJ2IEzjSwwmGevqe3U.jpg	public	sweeterynyc
5107e09be4b047c08ade6bf6	https://irs3.4sqi.net/img/general/	/760350_ZaalKVnOYdVAGoQEdugu-1Lws1LubyJBOVpZvJJD1V0.jpg	public	sweeterynyc
50188a43e4b0d35e6d8035b4	https://irs0.4sqi.net/img/general/	/b-fKh6mx2WxCybNQkr9ovk_jv4x7bwJPVFM9RF3M5T4.jpg	public	sweeterynyc
4fd79157e4b071eb33a9c810	https://irs3.4sqi.net/img/general/	/8zrcTIejD5EBiOJzSobql1_PQWr-i2KmRfgMCYmbK-M.jpg	public	eddiespizzany
501d4734e4b0af03cf473287	https://irs3.4sqi.net/img/general/	/6BUHUmEyYTTh3a2SRjSYRklUlTfQBNbFnnk_hfEojYs.jpg	public	goburger
51b8a845498e8ebdef064e0c	https://irs0.4sqi.net/img/general/	/761163_j9ai1NfaIpK2TLN8JzXbTwyIhVzuZevNHBV5EpQ7Fh0.jpg	public	palenquefood
51435e1de4b07d53cf71fd7a	https://irs1.4sqi.net/img/general/	/4486_lUhkecOFThYlMHKai4wDp4lXXiQSPLTq3Nno5WMIz7E.jpg	public	palenquefood
4e6513efc65b2dc8a0bfff6d	https://irs2.4sqi.net/img/general/	/TUQTIKBJPOALJKHN54QRKGISWMQDDOW3WTAECOGJ4FOJTPXI.jpg	public	palenquefood
501fe830e4b0bbddce992f90	https://irs1.4sqi.net/img/general/	/fFBOGONZt5Zr77Vc5g8adoAiBht0f-MBut7GqorVEjo.jpg	public	mexicue
4f67b0d4e4b08559c4c60149	https://irs0.4sqi.net/img/general/	/SdNxRS0joKXurf0FEv8_SRg-GeR9lGCN098_ZB2tijA.jpg	public	mexicue
50784742498ec6be8cd3f88e	https://irs2.4sqi.net/img/general/	/155927_ebZApDyXpTKTmvOQHdBTxNc2wJrsZV2QASmpYTNAVJM.jpg	public	mexicue
507efae0e4b09a52c022ec3a	https://irs0.4sqi.net/img/general/	/39213_nH-zcqfLCJqMvG0Nco0LWE4QuRuoL6unlEXJlJbTEF4.jpg	public	mexicue
526e8aee11d299d16e74b447	https://irs3.4sqi.net/img/general/	/67629862_ZPeS1alTFabw1hPqq8PCcGF1SRFynqA23OgkKg8yc00.jpg	public	lovemamak
521b83c411d29ec0512f89b3	https://irs0.4sqi.net/img/general/	/255980_1U9yRWzBKuIDLReBhmBs45qJ0mtHu7pzL_Fv4T9gTss.jpg	public	lovemamak
520e673a11d25d1282a44199	https://irs2.4sqi.net/img/general/	/117715_KjwJnc6idBB7TuMKhGboHDg8IYjlGcr6h3I6_fJECmM.jpg	public	delsnyc
51fd732d498e415eeb8b9881	https://irs3.4sqi.net/img/general/	/8839239_mAp7_MVmWbbK42Xq3-W-1zmegy-MNx8NzB0P5Brf-Pw.jpg	public	delsnyc
508abe69e4b01ff7516d118b	https://irs2.4sqi.net/img/general/	/8029486_9wt2tO9BnY5d11Ef0mpAgHAqfK1QMmSvLXglU4fj6Xw.jpg	public	lobstertruckny
500ecc9ce4b0a6d209804d9e	https://irs3.4sqi.net/img/general/	/d2yG6CtTrc8TQAXoEGN68UYAv3DiJIqJvKU65-ApcaU.jpg	public	lobstertruckny
5245c7a1498e0eb9bc097723	https://irs0.4sqi.net/img/general/	/1727660_xLZtYmqATL4pckN_IhgIj0AgUbDAJxywzqbf5PKEooM.jpg	public	lobstertruckny
4fee068ce4b0f9bd2b4041f7	https://irs3.4sqi.net/img/general/	/UQwqaF9knSdh4LFRzAhnh7hcl6_dSjDTg1phtqTe_7Y.jpg	public	milktrucknyc
4f749b3fe4b0f06c04ae2440	https://irs3.4sqi.net/img/general/	/rA31cWGMm0G8EuZFYZBxb3y2OrW3oEo7vCj1L2XR3AM.jpg	public	milktrucknyc
5281221811d21e907e460e00	https://irs2.4sqi.net/img/general/	/4195495_akELCvAQ7aY-bfTfHk93g5g5_qcJnQJV7h_gH0FlKUA.jpg	public	milktrucknyc
52052ef211d22b8ed81dd96b	https://irs1.4sqi.net/img/general/	/36360429_am9ha8rSYxAvCaSMU9ya6lI9MzIgcpR62DH6HS1b-uY.jpg	public	milktrucknyc
5244712a11d295d581384a17	https://irs1.4sqi.net/img/general/	/22780_QXd0BtJcOWXZwSm_ZG3oXyaNj6Qw5-p8hWQzzH121fY.jpg	public	polishcuisine
5192873e498e63958610c2eb	https://irs1.4sqi.net/img/general/	/117715_Jf2pdeF9ztory7puWsPaFE26jmMzPEzjOfPopvTzSjA.jpg	public	polishcuisine
5109aed2e4b01d2a5b69b022	https://irs3.4sqi.net/img/general/	/117715_0jgrjk5IsUFppNAL0NtebyMYoz1JMdzrnWAIjrLMHZw.jpg	public	schnitznthings
516ef5ece4b0d1c83382c12f	https://irs0.4sqi.net/img/general/	/117715_Gt3J4FMusC7YQjSfEup4O7bAO10z8J4gxmnd0xKnZuQ.jpg	public	veganlunchtruck
505348ffe4b0669212770040	https://irs3.4sqi.net/img/general/	/30736334_CliHgKVfq-ToaH03Q0rISwFXpeOJXQvCidaefhyLfFA.jpg	private	veganlunchtruck
519a7e33498e6e4ea6ff66f1	https://irs2.4sqi.net/img/general/	/3354_e_1JMupbEA8VtOBVXgLHAvtJGQwcpHvY2JyFESXYSjo.jpg	public	thesteelcart
5254357b498ec4662e20c654	https://irs2.4sqi.net/img/general/	/2620660_kMXeinZ_B6lOrHRQnheIHMBr7p81ZxcUblWl0SQ1vEs.jpg	public	thesteelcart
506dcb8be4b0748e0467de78	https://irs0.4sqi.net/img/general/	/157259_PdYI3Fpzhcz_LoGnBeymaSAZaZCiVVw43c4xaYQQIDY.jpg	public	mikenwillies
51117858e4b0e14064917adb	https://irs2.4sqi.net/img/general/	/263293_EvgjxXJqOivd94q0mbPR_AxkRXuzkFtjOBcOWnXuyQU.jpg	public	mikenwillies
5135022ee4b0592185aa975e	https://irs1.4sqi.net/img/general/	/2660256_0rdKd0P0tCYzLf5j7-_3b8HbPNDVCW6S0hHdJGW47Wo.jpg	public	mikenwillies
4f9c18b0e4b0b38d2f554383	https://irs3.4sqi.net/img/general/	/AQEKYbyPrQt5uMWhy4r4ODm2vSMCqPseJyMhcg55mtY.jpg	public	eddiespizzany
4da8977840a3582fb8c49316	https://irs2.4sqi.net/img/general/	/MCGIPRA0XR15JNG4O2YZJQBCRMK05UVTC4T14TOQWRTNMQFZ.jpg	public	eddiespizzany
5286645011d228bbd12f9880	https://irs0.4sqi.net/img/general/	/1353667_2qCG26N4ikz7mbvEGkrFkcNLagGqrzRuNyeQ35CCDE8.jpg	public	korillabbq
528e451f11d2a93e4361f565	https://irs3.4sqi.net/img/general/	/977282_wEw3nDjN0NbjC4CgQ00ON0YjdtnMocrfAjXDM4UH63Q.jpg	public	korillabbq
5231f54311d26e8da5827f3b	https://irs1.4sqi.net/img/general/	/977282_AToQDrlKW5PTNbNGQcB24_BeJNsRMgZTeYmC9P-or38.jpg	public	korillabbq
52a0bef911d299250c89f9c7	https://irs1.4sqi.net/img/general/	/349672_Cg8dtcrfQ0WZeSo7BJR61YBG6VzsiMltZP8XIqyHiu0.jpg	public	mrniceguytruck
5203e16e498e9e8e0a93b61a	https://irs3.4sqi.net/img/general/	/702028_Fog-6PEF03KateivIPP-hx87Qn6gi7PwnaJv-wTFv3I.jpg	public	carlssteaks
4fe65d6fe4b09198fde5842a	https://irs3.4sqi.net/img/general/	/nVmhJloDitdcBPFceYT8ajqQqgXBpB_w5GoPWse33Ks.jpg	public	valduccis
5008051fe4b0974c844d5003	https://irs3.4sqi.net/img/general/	/oNy0_bsWPyVmjrduzJXpbrAPHjQS0PVbyOCfoRSD9xE.jpg	public	shortysnyc
51a4ee69abd87ea53396c979	https://irs2.4sqi.net/img/general/	/4083549_jMzaCPEId80kWmAaq2oQ9APKf4bLvdeHhy40qPeB9j8.jpg	public	shortysnyc
50045b1be4b0004dbf67c977	https://irs1.4sqi.net/img/general/	/MDweBG1fBnF_fZ1tOghWyHS9qUxGNiJeOrOpoA-fBrY.jpg	public	shortysnyc
529ccbc511d21047117cdea2	https://irs2.4sqi.net/img/general/	/68150__CRf8sW9KvXZTkcAQEc4EsnYPgqXA2trmMxy-_AzobY.jpg	public	mrniceguytruck
5161e794e4b02525dbd064d7	https://irs3.4sqi.net/img/general/	/310577_h_ww6Za5XojCZcGVq7-gZluC_YvRnT1EOXY4hwV7KJ8.jpg	public	seoulfoodnyc
5012d0d5e4b06fc7ce735a68	https://irs1.4sqi.net/img/general/	/7J2g1YLtx4ma57g4A4CerJJ66OwudjGhFI67JaNl1Qw.jpg	public	seoulfoodnyc
521f754c498ee4d6fbe8a778	https://irs2.4sqi.net/img/general/	/22491899_EEPqf4HeJFaaFjYabKyScGZ8symjXEgMjPUEkfpJsJk.jpg	public	morristruck
51856452498e6f602088cbe1	https://irs2.4sqi.net/img/general/	/232510_pLk3QUUWFOu82-4SX-ObtA8bw2ZPf61QBOeIuL50T-o.jpg	public	morristruck
505c9776e4b0643aba1071c7	https://irs0.4sqi.net/img/general/	/5568483_yQrtG73dbug7q06p9IASJmTFnOVgGprIZKbfHjQRcso.jpg	public	biandangnyc
5106b878e4b05ec869ad8b34	https://irs3.4sqi.net/img/general/	/814104_blIawoImaEcqf-Mg89W5A-nEHiZ5jx76BEYHVzz8dnA.jpg	public	biandangnyc
527d2c2711d2c984e85cb11b	https://irs2.4sqi.net/img/general/	/4179871_5FQ2eCC5ZeizUVRLh4tadgEAO1BnJjVQ7pSEvSDwIfQ.jpg	public	biandangnyc
5079a745e4b00277f33e4836	https://irs3.4sqi.net/img/general/	/34723233_tCoDnWhdhZj61xi_e00MNwJoK_UcfDXCQQ7Weat8pBM.jpg	public	valduccis
521e9e4511d2d8ddc5c69dbd	https://irs3.4sqi.net/img/general/	/117715_r7cpzyXCpOthqHouR5gdqIMX8k0TZ2KWHFun5wh-EYk.jpg	public	valduccis
5267fa9611d2688bdc4587a2	https://irs0.4sqi.net/img/general/	/2136029_bvqot1MnMJ9IGYsYJkamqTiE_lL96OcfilWMxskhdU8.jpg	public	mooshugrill
507dacb0e4b0d8cafc9601e0	https://irs3.4sqi.net/img/general/	/2361939_S3NwwSNVZD-2tAhc3bwAvsYgk9tXwYv0T0yq9ci-ihE.jpg	public	toumnyc
501c284be4b07d0ab63e08be	https://irs1.4sqi.net/img/general/	/vQv8P8_hFNwHMmpR7k6-arr8zqYmmgoSG_aAPJuz-ws.jpg	public	itizyicecream
51e83b4a498e0a1c64e62828	https://irs1.4sqi.net/img/general/	/26624_AGoljLki5SS-GJGKaAGB75mloHKRBkJ1Qj5BQCRP1_Y.jpg	public	itizyicecream
51dd9efb498ebbc846c11c03	https://irs2.4sqi.net/img/general/	/13001992_b9dLXH02o0ZX8hyUZVtpgGW6sDyzAl23vmEl-0Hj0jY.jpg	public	itizyicecream
5012e555e4b0dd18ec16bd37	https://irs2.4sqi.net/img/general/	/mZQAOCmv5lnRZ1qOUTwDXk-MLC-X-p01AfECgfLJC2I.jpg	public	schnitznthings
51105b22e4b0a7b61fac854b	https://irs2.4sqi.net/img/general/	/117715_vKu0po70jlTD3qN9mXsdNiE6V5Od1hmYMVlUY9xSIP8.jpg	public	veganlunchtruck
526e782b11d2a15e6fb663f3	https://irs3.4sqi.net/img/general/	/8761552_XH612BVbFNOBD2jJVEMDzyawnGF45FygNA3TtdKo6UE.jpg	public	veganlunchtruck
51dc0e71498e8db4f9a8106e	https://irs0.4sqi.net/img/general/	/4456614_ZWvsB80ogvwYkoKIyVf6q5RfcDXwuKI4t0XJJhyLQ_I.jpg	public	thesteelcart
4e09f3fca12d09aa881a769f	https://irs0.4sqi.net/img/general/	/NTSOFYDIBYVWGE4RYQTBBNIAQESPZ1LLW3Q4TC3TGMROSJPH.jpg	public	nautimobile
5022f267011cfeafe81dab9a	https://irs1.4sqi.net/img/general/	/7EPnN8ReXYQWoZYxzqkH9AQlOe8vFPtVP_60n65i9U4.jpg	public	nautimobile
5245c79c498e057f7d5ff65d	https://irs0.4sqi.net/img/general/	/117715_CEghvDHaxkALy5RxQCAVW-kyM0TAZo2-fIT4e6veJeo.jpg	public	neaexpress
5176cceb498efe500552cc9e	https://irs0.4sqi.net/img/general/	/21735785_zaQs-7anNinrrQlobBV2AjNxquTXs5g8ZY0NxvoxvHo.jpg	public	steaksncrepes
523b2edc11d265bf373f82a0	https://irs0.4sqi.net/img/general/	/8853695_cjpq3trk4bFpcU1oHWwj4XxwwD9ZI169sNncUyOQoM8.jpg	public	steaksncrepes
4e4e92c7b0fb088f3c0f14d5	https://irs2.4sqi.net/img/general/	/HTLXSW2D30RGIEYPI0JGR22LUCS5BTXQ0LXDWAOHH4PCVHM4.jpg	public	bigdsgrub
51dd9ddc498efb9a3437e123	https://irs3.4sqi.net/img/general/	/4501533_djr9d2BEP8dg7E48xJjJTa_Yjk0Iy-MmBG6hgIQBLUs.jpg	public	bigdsgrub
4e70e35c52b140871b6fa35f	https://irs1.4sqi.net/img/general/	/1TB5ROKJY5NF0GAVS4YS3WZTFCUXXHTPLLBUIK4BU0XD0QA5.jpg	public	nautimobile
51ccc251498e028212e9b1e3	https://irs0.4sqi.net/img/general/	/117715_ozxp6K6iPGwKCzQDARR3BgMcisplkTt0x4LEKDJdBMk.jpg	public	nautimobile
50ad186ae4b0b639ca7ca234	https://irs3.4sqi.net/img/general/	/295161_qCQYG0XjW1Ji0pSDxM7fWRzxTZRbcYyZbsbPNJo12hw.jpg	public	toastmonsternyc
521649b811d2913e20a1ae87	https://irs0.4sqi.net/img/general/	/5568483_RtMp5aDM_JtBZOI1u48Jy3om4Z672obezdu1uA_UWd0.jpg	public	toastmonsternyc
518a82c9498e068718057964	https://irs1.4sqi.net/img/general/	/25979758_bGWQQ7W2SJI4v7KmU891VcYZGitov6qbSNAnIEt8HTo.jpg	public	toastmonsternyc
4e42f5ecaeb7f6be72c39c70	https://irs3.4sqi.net/img/general/	/JC5VO3Z50HMMMVLCCGWDQPMKF4W01VBXP1QS2LFESR55UHIX.jpg	public	fritesnmeats
506f12efe4b0bb9551703ca6	https://irs3.4sqi.net/img/general/	/2219480_LuuyF3peyimVfdQvb7tj9V-FHAEA0z1KmaSfMf9vKkU.jpg	public	fritesnmeats
4f832947e4b0cd6f644ef74a	https://irs2.4sqi.net/img/general/	/qCgaHGVJ9rFDkC5DFKEKLBBekoxb6PRDRfuWV7neue0.jpg	public	fritesnmeats
4f753600e4b07eec20023ddb	https://irs2.4sqi.net/img/general/	/zUb4OswXiQLnF_k2xnx7AdupnEIl1nuGyIuFcmFWf8Q.jpg	public	thetreatstruck
51c1ea41498e372d91835cf9	https://irs0.4sqi.net/img/general/	/5067950_pSXIZo_RqO8Hh5AuWcomjr0p3q_pXPUMWe99W8hUGTU.jpg	public	burgersandbites
51a79983498e3044671cd784	https://irs0.4sqi.net/img/general/	/1441492_yfySwml4ChzJ_ni5DxTq-8n2UlecWBWjgxR-ygA6pYc.jpg	public	burgersandbites
521cdb8011d2f79883b5be62	https://irs1.4sqi.net/img/general/	/36501880_zzNkJUOscINjy2aiwKSZEwjfQYJPjqmAsa6zS0dakp8.jpg	public	nuchasnyc
5298ff7011d22a38856168e2	https://irs1.4sqi.net/img/general/	/191726_GHXLJD8lsdPciKdqJErekl1SKPjw5k4N2YuNJC6JRTU.jpg	public	nuchasnyc
51118d62e4b063f95c18d16d	https://irs1.4sqi.net/img/general/	/191726_pTyD4DsW_jGt7E3QJJdH1QB-mHP1ZYggLzXtnZ7j3Oc.jpg	public	nuchasnyc
50ce2696e4b0881a7ef3ee67	https://irs2.4sqi.net/img/general/	/263293_lcA30Y_JnQGKaaHhRqFUio2HQ8UQkphCWP9yhW4CE3g.jpg	public	domotaco
5258d3ef11d26d03cc0563a5	https://irs2.4sqi.net/img/general/	/117715_GQ_O1nyBbVlKTaYpRlprc8ZdIEAEftbU4_9hDGjvxsU.jpg	public	brooklynpopcorn
51c8a3c5498e797153ec5629	https://irs1.4sqi.net/img/general/	/46314126_95x6AErCZEGSi1zGZrFCY-EzgsIMyOhgO4G59l-u_Xg.jpg	public	funbunsnyc
5212ec18498e9494b634a94c	https://irs0.4sqi.net/img/general/	/814104_tUkLgiQ8zcYxovra9R8PIx7FckFhBjzNVHmirteXd58.jpg	public	funbunsnyc
4ffda271e4b03bbc7f8fd13a	https://irs1.4sqi.net/img/general/	/6Dtx8fj7IXT6M3O6ZV3rXryb6zKTAqPchjeOM2BJJAs.jpg	public	funbunsnyc
505204d6e4b02dee62bd961a	https://irs1.4sqi.net/img/general/	/dcOYoRoNNeCLMxvoyAN-o9gJObcw5FljMqYpS9cps84.jpg	public	funbunsnyc
5243206b498e78230cd0770a	https://irs0.4sqi.net/img/general/	/54092198_eF4CEteD3zHjOCJzaYssyRXaQElB-GEOy2sqzBFQPm4.jpg	public	thegreenradish1
525ee647498ef229c65969fe	https://irs0.4sqi.net/img/general/	/10045965_ptbEO58Zn5wDz6kgitvMVjFScmxSkkuHNbK-AguCXSM.jpg	public	thegreenradish1
51424d6ce4b0041cb8df9856	https://irs1.4sqi.net/img/general/	/117715_oxR8_TwNSaCL-_gKDA2i2-1YoRfVVnbfT3M9Bfu4nxE.jpg	public	thepocketful
51800af8e4b07a4a57023def	https://irs3.4sqi.net/img/general/	/9548073_erhzj0ShEDKaz8S8DhlDe90fDjJEIWjilIxO4_zjdGE.jpg	public	thepocketful
511a7d64e4b0c6a64118260c	https://irs1.4sqi.net/img/general/	/793192_Dtd9vMRk-pbBJscn1cb7n29zM87iJjZy6rojapRhODk.jpg	public	thepocketful
50a696b4e4b04d062582a95e	https://irs3.4sqi.net/img/general/	/32050404_qo6ZUnU5LQMoqrAR6YoH5Qz-PdUcD1d1jCheEJy7lng.jpg	public	thepocketful
51d31ab97dd28a271207af20	https://irs1.4sqi.net/img/general/	/59958053_5CogfmHgRpBtjkPzVkAgAjK7q9ac0bo8Z1TPwxPIFAw.jpg	public	grillonwheelsny
50ce269de4b07c1547ebfb2c	https://irs3.4sqi.net/img/general/	/263293_qjcLaRmf5itOMyRiq4AyYZuY2UVjVJk04lO3FTA2CMY.jpg	public	domotaco
4ec59ebacc21b428e0de466c	https://irs2.4sqi.net/img/general/	/4AMXSGP5YGTUHEL3TFKTS5ROVIX4HUTU4MU5ZW1OX5E3URDD.jpg	public	domotaco
520912ad11d2f941183dea9f	https://irs3.4sqi.net/img/general/	/13285510_v7K0PTg4FzGI822Jbc9A8K5mUHIxwJPBZB_0xNeEauE.jpg	public	domotaco
5220dc78498ebd10d150f736	https://irs0.4sqi.net/img/general/	/29917892_nMZHXkfxBukc2QfFqtDBTZSJ1xpMkoO7VGBJmGKkwhY.jpg	public	brooklynpopcorn
4fb6bb41e4b066430032e4ca	https://irs1.4sqi.net/img/general/	/HHZWTU3POi_yJE4GU0zI_NjZNerm5y3MjjxddcV5ZMs.jpg	public	rickshawtruck
4f8dc377e4b0ca2accf75652	https://irs0.4sqi.net/img/general/	/EKcue5yGEyaPnBymSd_HtBxWEZl4grYSOXMhw-gqpTs.jpg	public	rickshawtruck
513b9b7de4b04f7024bc158a	https://irs3.4sqi.net/img/general/	/45519738_eDUGOpHYwiR5C3VUps1gQ1YDIq0Di3WMfuirGs2EVBk.jpg	public	rickshawtruck
5180207390e7374e46b6c165	https://irs3.4sqi.net/img/general/	/49563206_uKsSD-Cd2jjy6FMyR9U_--7DdUBJ7ZUxtdlushxyIAg.jpg	public	freshandhearty
513101fce4b006d9c4991bdc	https://irs2.4sqi.net/img/general/	/17248619_XfpmI8dNgmoeHE3BXjV8bL2yuuMTqxU3FqDr4BqX7Ks.jpg	public	bigdsgrub
4fa2d04de4b0489ba3d7936d	https://irs2.4sqi.net/img/general/	/hsPbM0G5l3AsUaI3x6r_VkiSYo4pYlWTKK2S9zqh_KE.jpg	public	bigdsgrub
4fbfe026e4b04422a08a40f6	https://irs3.4sqi.net/img/general/	/Han8Z4R-SQ615pLoN2lRdPfKEFa6UW2yudSOxXmJtts.jpg	public	thetreatstruck
51461b9de4b0bb73a6821e97	https://irs1.4sqi.net/img/general/	/1102787_UDt7OJpexNs8VPrehVDsp9EtfUJnMhKzJ2tTXuof06M.jpg	public	thetreatstruck
4fbfebe9e4b0a3bda0340383	https://irs0.4sqi.net/img/general/	/Brw9_z178IK92xMEXLCSSZrP0-99GXjutCp7dHCi5CQ.jpg	public	thetreatstruck
51dc5fec498e4e9be748eac4	https://irs2.4sqi.net/img/general/	/22801_gX0atVT6Jt_H6FPXuYAqHD4VzO5jAmS4SVid_ZLkk5U.jpg	public	disosnyc
525c259b498ea7548cf31f8e	https://irs3.4sqi.net/img/general/	/769710_ZxOOtsSbFVklHIRhXVmTO7ops0Pm0EybRDTgUvGHrSY.jpg	public	disosnyc
5197cb68498e8d409a89ec1b	https://irs1.4sqi.net/img/general/	/1847096_oRB5R_owQW40gVWlJhNNsh9_0bEq2D8Rt3Zod9HUbUg.jpg	public	disosnyc
51dc5a9e498ebf7ad40223ec	https://irs3.4sqi.net/img/general/	/1328035_Ak3fMs2e36r7NvIE_gIDK5XZ9CwrW1DEJa3g1oobp5E.jpg	public	wingnitnyc
506dc9b9e4b0c21f078c3bb3	https://irs3.4sqi.net/img/general/	/22983_XN2GbKo3a5YsNY_ZpiBcjUHTD2if3TWS8r586Uq4cEk.jpg	public	blend_express
5249b1c511d23e54343ae083	https://irs0.4sqi.net/img/general/	/769710_HUiZ7dJrNbdnPYV-DTQRr1z0zgoxFx9KMC_Y-OQ6O2o.jpg	public	bobjotruck
51378e9ce4b071feb46ef7cc	https://irs3.4sqi.net/img/general/	/18792384_RSm8zhe_6kUOxy91taByfRjTDSLp7stH7PI41aJHOrU.jpg	public	bobjotruck
5249b50c11d2d415e3c6b017	https://irs3.4sqi.net/img/general/	/769710_HOnpTjl0b6qd4-yoPpg9lXZGBy-ZKikqzLlFWw2sQfs.jpg	public	bobjotruck
4fe20639e4b05dcdf7f5737c	https://irs2.4sqi.net/img/general/	/l9UdGGevddtOhDk6scQjcy1-TbVBX-wf8Gf56jBIRIg.jpg	public	bobjotruck
5199097e498ea36447e54093	https://irs1.4sqi.net/img/general/	/40899881_hbjUdavpBfT-sLaBhv3pbZydT1tgs9v-Maw12j9I3Xs.jpg	public	carpedonutnyc
525de1d7498ef4b27ada0847	https://irs1.4sqi.net/img/general/	/31827631_CApIgPWaXupe3toLi7iJLb6NxIyn2IDTOjAG0qw-PIk.jpg	public	mexicoblvd
5140cc96e4b0ef29f4802508	https://irs1.4sqi.net/img/general/	/4886503_z36ZXtYKGVIHcNLCR18ZdUWtpStRrbf33rInxsr2p1Q.jpg	public	mexicoblvd
50e71f82e4b07154c72fdc22	https://irs2.4sqi.net/img/general/	/275165_az4RUZ2U7-4cfdnQA1FlMrDLaxwCMriWtlhS_pddjEc.jpg	public	mexicoblvd
4e3da652d4c058f9dc087a6c	https://irs2.4sqi.net/img/general/	/QEOIS2W35WLTHYK00QC04LKKX4X1SYW3DDI45X30HSKTJENQ.jpg	public	kimchitruck
4e00e61aa12db1129557e99c	https://irs0.4sqi.net/img/general/	/WSUNYIB0YFVRCTXB13UCRCTANZUG0DO0X2FWCUYYILU4TCGB.jpg	public	kimchitruck
5197fe76498e1c056c96d21b	https://irs1.4sqi.net/img/general/	/117715_m462oAqyqBN12xyWCOyzYR6-1gtYrUa8BiX9r9OybE8.jpg	public	kimchitruck
501975c5e4b092f6a51ef338	https://irs2.4sqi.net/img/general/	/bI7RrGcK_moyn-kJICa1OCciBVuYYykwCMGlea6mcxg.jpg	public	kimchitruck
50f99bcee4b08ca132377f78	https://irs3.4sqi.net/img/general/	/4611139_CEH3eveI6uxlRVQLet5Fpa_sNfJwAzfheMTYSBplO5Q.jpg	public	thecrepestruck
4fd0f054e4b0757383b97c0f	https://irs0.4sqi.net/img/general/	/MbR1inb3VKXu0PQMsCkHkHGftYq0E8CDbYG3BLRRGaE.jpg	public	thecrepestruck
50883301e4b0904987088a20	https://irs3.4sqi.net/img/general/	/2361939_J2zcgauqqGFC_PZPyvkfEDoSufdDe5qE7gi_NkS1P1U.jpg	public	mactruckny
519bb23b498e208a0b81b7fa	https://irs1.4sqi.net/img/general/	/9285455_LZiJ4FLH7NOWjNUsXO9jxDRFAgLygBSB8SmSIW0z9kM.jpg	public	mactruckny
5165924de4b093be3bc5cd57	https://irs2.4sqi.net/img/general/	/2159706_uFl3RYgA1z4EiDNp8PtjjG2HHWhTiiXDLNzJtFWPHS8.jpg	public	mactruckny
5151c82de4b024888079c5ea	https://irs0.4sqi.net/img/general/	/5003144_g8kbTzyfr6gL9vIRpMBbXz4TqBUk5EgkqIPlBP9DtsA.jpg	public	mactruckny
51645882e4b0bcb0cb0c7ef3	https://irs2.4sqi.net/img/general/	/7511393_dEJJLGO8ljFPMA_kFidoz1wpWZ-k6mHpqYnuRwoBpRg.jpg	public	philssteaks
507071bfe4b06e882e74b445	https://irs1.4sqi.net/img/general/	/1112203_qnT5k-31-4cRKDz00cUpp7Ia7HG3YTjhsC9Udo90RDI.jpg	public	philssteaks
512bbfebe4b0b8faa466c796	https://irs0.4sqi.net/img/general/	/1425622_4wp7wCuj7Ci1dl_FVH9syKmrJwQavMhL9uqww1b0m1o.jpg	public	philssteaks
527e77d111d2e66fa6a871b3	https://irs3.4sqi.net/img/general/	/649454_HIWthX8nL3SZAOwyMlKj9Y7ju9GCiN4OEV-wZR6IKC0.jpg	public	philssteaks
5086e523e4b02ca59cae7bd4	https://irs3.4sqi.net/img/general/	/2361939_1JvatS0wOUdQQIaTmd4Vmk8bgr7aFYOR7LaMkRio0X8.jpg	public	mausamnyc
513f646ce4b0b1892aaae1bc	https://irs2.4sqi.net/img/general/	/13285510_LmdJLKoCS9fSwm3wy96lcieTczjsLuxAEUnU3FlZDlo.jpg	public	mausamnyc
51194bbae4b0cd237850b223	https://irs1.4sqi.net/img/general/	/793192_FQUO1SFGyLkg5NRz6VUYl3_zmFgfy0Mh8gL1unO8ijM.jpg	public	mausamnyc
520538a611d2b476431ac7f9	https://irs1.4sqi.net/img/general/	/117715_GMdoseCn4baUtTX9kN6_PAAfHaGIlUpjxzAitpqLAOY.jpg	public	chefsamirtruck
5294e76b11d2879d5217bd00	https://irs0.4sqi.net/img/general/	/47558447_v1SwJZbLSZ2etlJXOF9qw4H3vErpdTiVIqXxULSVTSU.jpg	public	chefsamirtruck
5189442c498e765ce62d5924	https://irs3.4sqi.net/img/general/	/2432527_5nUa0fTfy4rzjXpiIUIlkguBa2kdqFSZIG-PLvkKu2Y.jpg	public	chefsamirtruck
4fd0d80de4b062589043211f	https://irs2.4sqi.net/img/general/	/hZjMDK5KKgxjMhmOGBtaRjx_ga0SWHwppqfLfqw20Tg.jpg	public	chefsamirtruck
50e719c2e4b0e263423e547e	https://irs3.4sqi.net/img/general/	/15471_4uN0tddGW5orNGh02xhxbiAOGUpAAy3rIWEotoRgB_M.jpg	public	tacobite
5239ddce11d2ab4765d5cc7f	https://irs3.4sqi.net/img/general/	/5568483_alwOH7sfGU8-pKfLmurfe9rt3pk2G6p90KwFyC6hq1A.jpg	public	sweetchilinyc
5208f543498eaeeaaad3ce52	https://irs2.4sqi.net/img/general/	/15629_P_UAUr_S-OO0R12wNp8LDPwr-ZbfPiWeG0Q0rrjW6Ww.jpg	public	sweetchilinyc
527e823311d2db75dd831ee0	https://irs0.4sqi.net/img/general/	/22419482_1rrrm4nhOKXQsXN25ApmVsGDw4t2J3GyjhfeQPEbClU.jpg	public	waffletruck
4fd400ffe4b02d3b87199713	https://irs3.4sqi.net/img/general/	/hxqXK1dS5WiSz4AUwkzvl8s8oy4Y26e1px0MLW4ICuw.jpg	private	waffletruck
51f4589a498e97316d307dab	https://irs1.4sqi.net/img/general/	/186827_ilvLMlb3AFqgXUQJ43S7IjsLNPxYP3Pw5LEjrqhp6wI.jpg	public	chipsykingny
514e42c7e4b0ec8b7e400875	https://irs3.4sqi.net/img/general/	/48992751_ibL8tx_7JPvV3aQmnEevrdibtLP0jWytaChkCdRuhG8.jpg	public	crafflesnyc
514e42a8e4b0d91e975b3db9	https://irs1.4sqi.net/img/general/	/48992751_womoOVd5bv-2KopmWjWEHA_WsyoWQITjAyXBuM4Ciz8.jpg	public	crafflesnyc
51f15b4d498ee58fec420a7c	https://irs3.4sqi.net/img/general/	/13285510_Q-SBXKFpfroSwQ-QJdezzrh1KaHfHAmLyicy8d5S1jU.jpg	public	parissandwich
5243126c498ea77b19b3a444	https://irs0.4sqi.net/img/general/	/65506790_31Qpx9E-ZjuNve-izmDY6vVxUCMrhgGsnOLn4-fusp4.jpg	public	parissandwich
51b22a0a498ec00d1c45726c	https://irs1.4sqi.net/img/general/	/390807_y2oeK6xR54wk9b1Sfm82Ek09Auv2lNkRTpJOzos3xjU.jpg	public	parissandwich
51f2be1f498e71235db5b61b	https://irs3.4sqi.net/img/general/	/117715_mGfGU0UGjUMhgqgwrDPf2f44NZtfMrobqJMF8ahsrjY.jpg	public	sweetchilinyc
5280c18811d2e4df572063db	https://irs0.4sqi.net/img/general/	/5354893_5EtQmcwzMnTRFz9qbxjkt9FguCAC4xfW5xwUCyYIrbQ.jpg	public	waffletruck
522245cd498e08037d275e1a	https://irs0.4sqi.net/img/general/	/1290097_g0wekB0Kkci5H6u618gI7WxvHlKAan1kUpaRIuTl2IM.jpg	private	waffletruck
\.


--
-- Data for Name: trucks; Type: TABLE DATA; Schema: public; Owner: pepp
--

COPY trucks (id, name, twitname, weburl, tweet, street, location, retweeted, region, regex, lasttweet, lastupdate, type, about, foursquare, matcher) FROM stdin;
mexicue	Mexicue	mexicue	http://mexicueny.com	45th and 6th!	45	45th and 6th	f	up	\N	1391016918	1390842720	Mexican		4c51a6a71c67ef3ba6b61ab9	\N
elpaso	El Paso Truck	elpasotruck	http://elpasony.com/	\N	\N	\N	\N	\N	\N	1390251431	\N	Mexican	\N	523c911f04937624937304c5	\N
yougotsmoked	You Got Smoked	yougotsmoked	http://yougotsmoked.com/	\N	\N	\N	\N	\N	\N	1389964535	\N	BBQ Mexican	\N	52b1d83a498e60c55497bea0	\N
schnitzelcart	Schnitzel & Things Cart	schnitznthings	http://schnitzelandthings.com	Happy Friday:) the schnitzcart will be on 49th st between 6th & 7th aves from 11:00-2pm. It's a perfect day for a warm delicious schnitz:)	49	 49th st between 6th & 7th 	f	up	\N	1391009832	1389971080	German	\N	4a6640b3f964a5204cc81fe3	schnitzcart
mamak	Mamak	lovemamak	http://www.lovemamak.com/	We are at 7 Hanover square & everyone can order delivery service tru seamless web if it is too messy to get out from office!	Hanover	Hanover square	f	none	\N	1390931652	1390321357	Asian		51c4cffa498ec876f564a0b4	\N
snowday	Snowday	snowdaytruck	http://snowdayfoodtruck.com/	\N	\N	\N	\N	\N	\N	1390971706	\N	Comfort	\N		\N
hh3	Habachi Heaven 3	hibachiheaven	http://www.hibachiheaven.com/	@midtownlunch HH3 is on park&47th today. The word of the day is "tgif" for ur free upgrade. midtown get ur yumyum on today	47	 park & 47th   	f	up	\N	1390846693	1390576694	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	hh3
mamuthai	Mamu Thai Noodle	mamuthainoodle	https://www.facebook.com/MamuThaiNoodle	Sorry folks @ WFC, can't make it today. :( See you soon!	WFC	WFC	f	none	\N	1390837355	1390837355	Thai		5126a10ae4b0af674c85f353	\N
sweetery	Sweetery	sweeterynyc	http://sweeterynyc.com	Happy Wed. fans of Sweetery. It;s a little warmer today, but the real warmth is on Hudson/King St. where you know Sweetery will be.	none	 Hudson / King St  	f	none	\N	1391002559	1391002559	Sweets		4a28d919f964a52056951fe3	\N
mikenwillie	Mike n Willie's	mikenwillies	http://www.mikenwillies.com	Happy taco Tuesday Midtown!!! 46th St . Btwn 5th & 6th Ave Tacos Sliders Burritos comegetsome have you tried... http://t.co/US6AwCIGtp	46	 46th St   Btwn 5th & 6th 	f	up	\N	1390924318	1390924318	TexMex		4f205f0ee4b0294b35a1178b	\N
goburger	GO Burger	goburger	http://www.goburger.com	We're on 88th and Broadway for dinner tonight!	88	 88th and Broad	f	up	\N	1390587467	1389390276	American		4c06b3eccf8c76b0a4eb3a65	\N
shortys	Shortys	shortysnyc	http://www.shortysnyc.com	Where are you watching the Super Bowl? shortysnyc Check out one of our locations! 576 9th Ave / 66 Madison Ave /... http://t.co/omfJJhoK9H	66	 576 9th Ave / 66 Mad	f	up	\N	1390926447	1390490446	American		4faea2cce4b08a88c5dc5d05	\N
hh2	Habachi Heaven 2	hibachiheaven	http://www.hibachiheaven.com/	@midtownlunch HH2 is on park&33rd today. The word of the is "tgif" for ur free upgrade. midtown get ur yumyum on today	33	 park & 33rd   	f	mid	\N	1390846693	1390575816	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	hh2
eddiespizza	Eddie's Pizza	eddiespizzany	http://www.eddiespizzany.com/	Found a spot on varick and king. Call ahead 917 439 7522	varick	 varick and king  	f	none	\N	1390940734	1390587105	Pizza		4c0cf412b4c6d13ae4850c30	\N
getstuffed	Momos & Buns	getstuffednow	http://www.chinesemirch.com	snowdayNYC we will freeze our buns 2 bring u the buns u love @BKBazaar ! Its a date at 7pm!	none	 2 bring u the buns u love @BKBazaar ! Its a date at 7	f	none	\N	1391015539	1388785130	Chinese Fusion		4fa016cbe4b05d0fc11262c5	\N
wingit	Wing'n It	wingnitnyc	http://www.wingnitnyc.com/	Out here on 23rd and 5th come and grab some wings for lunch today. We will be open from 10am to 3pm. See you guys at lunch.	23	 23rd and 5th 	f	mid	\N	1390923947	1387549355	American		519ffd2b498ededbeef3c073	\N
valduccis	Valduccis	valduccis	http://valduccis.com	RT @nycfoodtruck: RT @starrett601: Hungry? Food event TMRO at starrettlehigh w/ @Valduccis, @TakumiTacoNY, @gcnyc1, @juicepirate, etc. htt...	starrettlehigh	starrettlehigh	t	none	\N	1391015817	1391015569	Pizza		4df7e1aad4c02ad734170b21	\N
palenque	Palenque	palenquefood	http://www.palenquehomemadecolombianfood.com	It is freeze but Palenque is here Water st & Jay st ( Dumbo)	Water st & Jay	 Water st & Jay st   	f	bkl	\N	1390748436	1390581860	Colombian Fusion		4e84f424dab45bbd2617dc62	\N
korilla	Korilla BBQ	korillabbq	http://korillabbq.com	Gmorning FiDi! We're ready for ya @Front & Gouverneur!	none	@Front & Gouverneur	f	none	\N	1391012938	1391012938	Korean Fusion		4cc701aa01fb236ab070baba	\N
mrnice	Mr Nice Guy	mrniceguytruck	http://mrniceguynyc.com	SliderWingNation. by @dyckmanbar "Super Bowl live at DB SUN 2/2 mrniceguytruck on site for those... http://t.co/AaLfKazsyG	none	 2 / 2 	f	none	\N	1390577295	1390242002	American		520bbbb211d26afae232ec59	\N
seoul	Seoul Food	seoulfoodnyc	http://www.seoulfoodnyc.com	We are already to serve you lunch!!\nWe are On 51st between Park and Madison avenues!	51	 51st between Park and Mad	f	up	\N	1391003673	1391003673	Asian		4e74afad88775d593d9a7eb5	\N
carls	Carl's Steaks	carlssteaks	http://carlssteaks.com/home/	Hey folks 49th st 6/7th ave 11- 2:30 grab a piping hot carls cheesesteak to stay warm @SiriusXMNFL @SIRIUSXM @Barclays order 917 597 4313	49	 49th st 6 / 7th ave   	f	up	\N	1391008711	1391008336	American		51a78330498e3fc1f22d771e	\N
biandang	Bian Dang	biandangnyc	http://www.biandangnyc.com/	53rd and park! humpday  wednesday	53	53rd and park	f	up	\N	1391008633	1391008633	Taiwanese		4d712874722ef04d04160d9c	\N
taim	Taim Mobile	taimmobile	http://www.taimmobile.com/	Butternut Squash is the soup du...how do you say last soup of the season? Get yours now on Varick/Vandam	Varick	 Varick / Vandam	f	none	\N	1387809097	1387556931	Mediterranean		4cf2c5321d18a143951b5cec	\N
dels	Del's	delsnyc	http://instagram.com/delsnyc	RT @DUMBOFoodTrucks: You may have seen the @delsnyc truck around DUMBO this summer - help them raise $ for another one on @kickstarter! htt...	DUMBO	Dumbo	t	bkl	\N	1384186749	1383928941	Sweets		519bb56b498ed2dfa950ace2	\N
gorilla2	Gorilla Cheese 2	gcnyc1	http://t.co/4ZDqfwSH5f	G1- 7 Hanover Square  fidi\nG2- 26 11/12 starrettlehigh	26	 26 11 / 12 sta	f	mid	g2(.*?)(\\n|$|#)	1391015203	1391015203	American		4dc2d3e352b1c1fb37f1e945	\N
neapolitan	Neapolitan Express	neaexpress	http://neapolitanexpress.com/	The NY Times highlights Columbia U's new park: http://t.co/XiP0OoUrcr		Columbia	f	up	\N	1391015719	1390230920	Pizza		51c8864c498e0ac96c14433e	\N
phils0	Phil's Steaks Big Jawn	philssteaks	http://www.philssteaks.com/	It's Phil's Phriday! \nOG Jawn: 51st n Park\nBig Jawn: 41st btw 6th n 7th\nGet Your Phil!	41	 41st btw 6th n 7th 	f	up	big( jawn)?( in|:| ?-| is on| on) (.*?)(\\n|$|!|\\.)	1391008653	1387554094	American		4f15b382e4b0725660ea9f31	\N
morris	Morris Grilled Cheese	morristruck	http://morrisgrilledcheese.com/	No @BrookfieldPLNY lot today, sorry folks! seeyounextweek	brookfieldplny	brookfieldplny	f	none	\N	1391009211	1390581560	American		4e0e0b3caeb7a5b33ee5dac1	\N
grillwheels	Grill On Wheels	grillonwheelsny	#	55th off Broadway today! Open for lunch at 11-3:00!	55	55th off Broad	f	up	\N	1391008280	1391008280	Kosher		51b0bf31498e9b68db75612c	\N
domo	Domo Taco	domotaco	http://www.domotaco.com	49th and 6th today for lunch! Come by for a free kimchi fried rice upgrade on bowls and burritos!	49	49th and 6th 	f	up	\N	1390834086	1390834086	Asian Fusion		4ed90a2e77c8274efb746d83	\N
milktruck	Milk Truck	milktrucknyc	http://www.milktrucknyc.com	Bessie's at 58th & Mad, call (646) 504-6455 to pre-order or http://t.co/IwkqcCHPzF. Sandwich menu always at @houstonhallnyc	58	 58th & Mad  	f	up	\N	1391007650	1391007650	American		4e823c0229c2dbb2b7043972	\N
mooshu	Moo Shu	mooshugrill	http://www.mooshugrill.com	Back at it on Jay & Water for a double dose of @dumbolot this week! porkbelly comfortfood ytotheum	Jay & Water	 Jay & Water 	f	bkl	\N	1391010002	1391010002	Chinese	Moo Shu grill is a slight twist on typical Chinese <a href="https://en.wikipedia.org/wiki/Moo_shu" target="_blank">moo shu</a> The three Moo Shus option is enough for lunch and you can pick and choose a different protein for each. In my opinion the chicken is the best but it is dark meat. </p><p>It's easy to order as there is one window for ordering and for picking up when your name is called.	52090e45498e5500a6bd41fb	\N
gorilla1	Gorilla Cheese 1	gcnyc1	http://www.gorillacheesenyc.com/	G1- 7 Hanover Square  fidi\nG2- 26 11/12 starrettlehigh	Hanover	Hanover Square	f	none	g1(.*?)(\\n|g2)	1391015203	1391015203	American		4dc2d3e352b1c1fb37f1e945	\N
miamifood	Miami Food Machine	miamimachinenyc	http://www.miamifoodmachinenyc.com/	RT @YouGotSmoked: Park Ave btw 33rd St and 32nd St from 11:00 to 3:00 today! New York Aged Cheddar Mac and Cheese! Delicious nyc http://t...	33	 Park Ave btw 33rd St and 32nd 	t	mid	\N	1389964561	1389964561	Mexican		514b53aee4b00c3e98ec25e9	\N
polish	Old Traditional Polish Cuisine	polishcuisine	https://www.facebook.com/pages/Old-Traditional-Polish-Cuisine/315496671902708	Lunch is ready! Varick b/w King & Charlton - smokin' grilled kielbasa and our top pierogi await you! pierogitime	Varick	 Varick b / w King & Charlton 	f	none	\N	1391011266	1391011266	Polish		51435df4e4b0823a398ebc8a	\N
itizy	Itizy Ice Cream	itizyicecream	http://www.itizy.com/	Likely our last three hours at Columbia this year! Come grab a scoop of your favorite flavor before it runs out!	none	Columbia	f	none	\N	1382307419	1382122482	Sweets		4fcbdcaae4b00a0e855124dd	\N
toum	Toum NYC	toumnyc	https://www.facebook.com/ToumNYC	Hello MidtownEast ! We're on 47th btwn Park & Lexington getting ready to serve up mouthwatering chicken shawarma http://t.co/UNJy3p1dXf	47	 47th btwn Park & Lex	f	up	\N	1391004183	1391004183	Lebanese		500eedb0e4b062ee00577957	\N
blend	Blend	blend_express	http://blen02.wix.com/blendnyc	We will not be parking on HUDSON and KING anymore ....   Hopefully only at least for this year	none	 parking on HUDSON and KING an	f	none	\N	1383317024	1383316855	Latin Fusion		4fa94528e4b0f8fbf13317e6	\N
lobstertruck	Red Hook Lobster	lobstertruckny	http://redhooklobster.com/	bigred is kickin it on 47th between Park & 3rd. lobsterforlunch! Drop business card for chance 2 win freelobsterroll. crustaceanelation	47	 47th between Park & 3rd  	f	up	\N	1391007307	1391007307	\N		4dc597c57d8b14fb462ed076	\N
steaksncrepes	Steaks N Crepes	steaksncrepes	http://steaksncrepes.com	50 st bet 6 & 7 ave for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	50	50 st bet 6 & 7 ave for lu	f	up	\N	1374766188	1374766188	American		50f44167e4b0af5bf46321ce	\N
brooklynpopcorn	Brooklyn Popcorn	brooklynpopcorn	http://brooklynpopcorn.com/	RT @InfiniteMidnite: Enter to Win a $20 E-Gift Card to Shop at @BrooklynPopcorn on @TwoClassyChics Blog Ends 2/04 Giveaways ad http://t.c...	none	 2 / 04 	t	none	\N	1390963799	1390878370	Popcorn!		514a0737e4b09c3e77279d83	\N
bigds	Big D's	bigdsgrub	http://bigdsgrub.com/	Let us warm you up at Broadway and 56th Street for lunch.  Beat the cold and preorder for pickup by calling 646-543-BIGD @randomfoodtruck	56	Broadway and 56th Street 	f	up	\N	1391007679	1391007679	Korean Fusion		4c968b907605199c2eaec2a3	\N
schnitzel	Schnitzel & Things	schnitznthings	http://schnitzelandthings.com	The schnitztruck will be on 47th street between Park & Lex from 11:30-2pm. We've missed you guys. Come grab some warm schnitz! See ya:)	47	 47th street between Park & Lex 	f	up		1391009832	1391009832	German		4a6640b3f964a5204cc81fe3	schnitztruck
cinnamonsnail	The Cinnamon Snail	veganlunchtruck	http://www.cinnamonsnail.com/	At its hight the line was 1 1/2 blocks long. Thanks for the love NYC!\n\nMT @kmexvx: So many people queuing in the rain http://t.co/019Fhw8WPv	none	 1 1 / 2 	f	none	\N	1390947639	1387826665	Vegan		4c263af6a852c9287537e66c	\N
steelcart	The Steel Cart	thesteelcart	http://www.thesteelcart.com/	56th & Broadway through lunch. Soups are Organic Lentil + Split Pea & ham.	56	56th & Broad	f	up	\N	1391005895	1390922636	French		511d3abee4b0e188895f3697	\N
frites	Frites 'N Meats	fritesnmeats	http://www.fritesnmeats.com/	Hello soho, lunch 2day. @ Hudson & king. Burger of the week THE MARITAL BLISS preorder. 9172929226	none	 Hudson & king  	f	none	\N	1391007875	1391007875	American	This is a good burger but this truck is interesting because of the many toppings they carry and their burger of the week. 	4ae9d217f964a520bcb621e3	\N
rickshaw	Rickshaw Truck	rickshawtruck	http://www.rickshawdumplings.com/	Starrett! You are in luck! Danny is on his way to make your dumpling day! 26+11av	26	 26 + 11av	f	mid	\N	1386710979	1384441694	Asian		43fc8419f964a520ed2f1fe3	\N
funbuns	Fun Buns	funbunsnyc	http://j24f.com/funbuns/	RT @FoodtoEat: Today's answer to 12DaysofFoodTrucks is @funbunsnyc ! Thx to all those who played and tune in Monday 12/23 for the LAST day!	12	 12 / 23 	t	mid	\N	1387580633	1387576969	Asian		4f8d9663e4b021137aa2bdde	\N
pocketful	The Pocketful	thepocketful	http://thepocketful.com/	Located in. 52nd between 6th and 7th. Free delivery at http://t.co/6h7IrKccpj	52	 52nd between 6th and 7th  	f	up	\N	1390573368	1389971810	Mediterranean		4db8bcd790a0e3f61d601888	\N
lukeslobster	Luke's Lobster	nautimobile	http://lukeslobster.com/	46th and park today, then we are in Nj for Super Bowl festivities for the rest of the week!	46	46th and park   	f	up	\N	1391007328	1391007328	Seafood		4dc81239b0fb5556cd2f3023	\N
freshhearty	Fresh and Hearty	freshandhearty	http://freshandheartynyc.com/	Get your Soup & Panini on with Fresh and Hearty! We parked on 46st btw 5th & 6th ave from 11am to 3pm. Call now 4 free delivery! @3474402467	46	 46st btw 5th & 6th 	f	up	\N	1390493878	1390493878	Soup/Salad/Sandwich		51801f7a90e7374e46b6239f	\N
toastmonster	Toast Monster	toastmonsternyc	http://www.toastmonsternyc.com/	Hello Rice bowl fans. Have your beef or chicken teriyaki rice bowl with a miso soup for only $8!! stopplaying notplaying forreal 50th/6th	50	 50th / 6th	f	up	\N	1390576702	1386864511	American		50ad1829e4b087613d696bc4	\N
greenradish	The Green Radish	thegreenradish1	http://www.thegreenradish.com/	RT @nycfoodtruck: Who says this weather & food trucks don't mix? Catch 30, incl. @thegreenradish1, at the winterblast 1/30-2/1! http://t.c...	none	 30  incl  @thegreenradish1  at the winterblast 1/ /1	t	none	\N	1390950290	1390853812	Vegan		5229feab11d2edde794d385c	\N
phils3	Phil's Steaks	philssteaks	http://www.philssteaks.com	Happy Whiz Wednesday! Back at our old stomping grounds today - 47 btw Park n Madison now til 2!	47	 47 btw Park n Mad	f	up		1391008653	1391000946	American		4f15b382e4b0725660ea9f31	\N
wafelKastaar	Wafels & Dinges Kastaar	waffletruck	http://www.wafelsanddinges.com/	Kastaar is at Brooklyn College til 10pm \nMomma Truck is at Trinity School, 91st & Columbus, til 4:31pm	Brooklyn	Brooklyn College	f	bkl	kastaar( truck)? (.*?)(all day|till?|until|\\n)	1391012826	1390924953	Belgian		4a416369f964a52036a51fe3	\N
bobjo	BobJo	bobjotruck	http://www.bobjo.net	Bobjo express stay at 47 and park!\nThanks!	47	 47 and park	f	up	\N	1391012792	1391012792	\N		4e3add0c88772c3bf12772da	\N
shanghai	Shanghai Sogo	shanghaisogo	http://www.shanghaisogo.com/	Lunch Time? Shanghai Sogo @116th & Amsterdam here all day until 8pm&gt;&gt;SOGO FOR IT &lt;&lt;......	116	@116th & Amsterdam 	f	up	\N	1391019039	1391015465	Asian		5258369d498e13def2bef2cb	\N
treats	The Treats Truck	thetreatstruck	http://www.treatstruck.com	!!! Tues, Jan 28th 12:30-2:30 17th st near 5th ave!!!	17	 17th st near 5th ave	f	mid	\N	1391013122	1390927732	Sweets		49e65021f964a52035641fe3	\N
burgersn	Trusty Burgers & Bites	burgersandbites	http://www.burgersandbites.com/	Ready to rock in dumbo! Burger Thursday all day on water and jay! @Carrot @_TommyDee_ @Bklyneats @Brokelyn @DUMBOFoodTrucks @EaterWire yum	water and jay	 water and jay	f	bkl	\N	1390930958	1383232098	American		5170143a498e802b42628e48	\N
disos	DiSO's	disosnyc	http://www.disosnyc.com/	The society is open and accepting new applicants.\n\nSoho varick and charlton st.\n\nCall in orders: 917-756-4145	varick	 varick and charlton st   	f	none	\N	1391018244	1391011384	Italian Sandwiches	These might be typical italian sandwiches but the ingredients are high quality. You need to get there early because the line can get long and they will run out of some breads. I believe the focaccia half is a normal portion for lunch while their half and hero sizes are pretty big.	519523d6498eeaa6200aad03	\N
nuchas	Nuchas	nuchasnyc	http://www.nuchas.com	RT @NYNJSuperBowl: SBBLVD is now officially open on Broadway between 34th & 47th streets! http://t.co/VUawW6JM8e	34	 Broadway between 34th & 47th 	t	up	\N	1391019274	1391019274	Mexican		4ebd2a9bb8f7b504a754c130	\N
carpedonut	Carpe Donut	carpedonutnyc	http://carpedonutnyc.com/	Open on 23rd and Park. Start your day with a coffee and donut, or if your feeling adventurous, a steamy hot apple cider!!!!	23	 23rd and Park  	f	mid	\N	1391003429	1391003429	Sweets	They only server one kind of donut here, the apple cider, but it's a pretty good one. They are fresh and still hot when you get them. They have donut ice cream sandwiches but you should know the entire thing is in the freezer so you will get a frozen donut as well.	5169892c498e0522481eea97	\N
kimchitaco	Kimchi Taco	kimchitruck	http://kimchitacotruck.com/	We're baack & we've got a spicy Mexican chicken & rice soup today Slurp'sUp  52nd St. bet. 6th & 7th Ave. 11:30-2:30	52	 52nd St  bet  6th & 7th Ave   	f	up	\N	1391007598	1390575125	Korean Fusion		4d6ee122b45b59417c6a6778	\N
mexicoblvd	Mexico Blvd.	mexicoblvd	http://mexicoblvd.com	Parked in our usual Astoria spot all day today! Ditmars & 31st (last stop on the NQ Queens bound subway) Preorder on http://t.co/EIrGC8j9wt	Astoria	 Ditmars & 31st  	f	qns	\N	1391014861	1391014861	Mexican		4f4e55aee4b04c96fba5b149	\N
crepestruck	Crepes Truck	thecrepestruck	https://www.facebook.com/thecrepestruck	VictoriaJustice at Uggs Aulstralia on Madison Ave & 58 Street tonight from 6:30pm-8pm	58	 Madison Ave & 58 Str	f	up	\N	1383866974	1383866974	Crepes		4dfb854918386e743d9869e3	\N
mactruck	MacTruck	mactruckny	http://MacTruckNYC.com	Park ave between 27/28 for lunch	27	Park ave between 27 / 28 	f	mid	\N	1389991894	1389976473	American	Looking to take a nap after lunch? This truck is great and the owner is incredibly friendly. Feel free to chat it up while you watch him prepare your food.  Not listed on the menu are the many condiments\\n you can get on your macaroni. The regular size is a good portion for a normal lunch.	50575ab8e4b04ed4f2197dac	\N
chefsamir	Comme Ci, Comme Ca	chefsamirtruck	http://www.chefsamirtruck.com	We are on 52st and park av!!	52	 52st and park av	f	up	\N	1391015194	1391015194	Moroccan		4c3c85e3a9509c74b52e395b	\N
mausam	Mausam	mausamnyc	http://www.mausamnyc.com	Yr favourite food truckBway bet 55 & 56 Str. All platter served with parata & samosa. Ideal for this weather	55	 55 & 56 Str  	f	up	\N	1391010857	1390313752	Indian		50730eebe4b0f3224431dc5d	\N
phils1	Phil's Steaks Lil Jawn	philssteaks	http://www.philssteaks.com	2 jawns out today!\\n\\nBig Jawn - 41st btw 6th n B'Way til 2. \\n\\nLil Jawn - North End Ave n Vesey St til 2.	Vesey	 North End Ave n Vesey St 	f	none	lil jawn( in|:| -) (.*?)(\\n|$)	1391008653	1383670328	American		4f15b382e4b0725660ea9f31	\N
wafelMomma	Wafels & Dinges Momma	waffletruck	http://www.wafelsanddinges.com/	Momma Truck is at Wall St till 4:30p	Wall	at Wall St	f	none	momma( truck)? (.*?)(all day|till?|until|\\n|!)	1391012826	1391012633	Belgian		4a416369f964a52036a51fe3	\N
tacobite	Taco Bite	tacobite	http://www.tacobite.com/	Today Serving Lunch on\n47th st\nBet Park/Lexington Av. \nCall in advance for\npick-up\n@ 347-70T-Bite	47	 47th st Bet Park / Lex	f	up	\N	1389801699	1389801699	Mexican		503ba49ae4b0fad35eb7a8dc	\N
sweetchili	Sweet Chili	sweetchilinyc	http://sweetchilinyc.com/	It's lunch time at Broadway and 56th street. Free coffee samples to anyone who asks! Here till 3	56	 Broadway and 56th str	f	up	\N	1391013543	1391013504	Asian		51a8c802498e2165ca855a19	\N
chipsy	Chipsy King	chipsykingny	http://chipsykingny.com/	TGIF!!! Kasar truck is at Broadway and 55th street all day until 8pm. Join us	55	 Broadway and 55th str	f	up	\N	1390574849	1390574849	Fries		51bb5c43498ee06e13d0d31f	\N
craffels	Craffles	crafflesnyc	http://www.craffles.com/	Happy holidays!!!\nMake ur holidays sweet with our delicious crepe or waffles. Our location for today. Hunter college and union square.	none	union sq	f	none	\N	1389385233	1388428190	Crepes		514e426ce4b05bcb261d910e	\N
paris	Paris Sandwich	parissandwich	http://www.parissandwiches.com/	Dumbo! Adams and front street today dumbofoodtrucks @DUMBOFoodTrucks	none	 Adams and front str	f	none	\N	1389895042	1382711724	French/Vietnamese		519e4ed0498e4f27e64c177a	\N
\.


--
-- Data for Name: tweets; Type: TABLE DATA; Schema: public; Owner: pepp
--

COPY tweets (contents, "time", id, retweeted, twitname) FROM stdin;
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
WFC South End&amp;Liberty! If you're at work, we're at work! Come down to get your holiday noodle! @BrookfieldPLNY @downtownlunch @DispatchBP	1387811957	415139553851478016	f	mamuthainoodle
It's spring again? Dumbo, today is your day! Hot/fresh Thai noodles await you @dumbolot @DUMBOFoodTrucks now-3pm	1387558421	414076147937599488	f	mamuthainoodle
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
@GMA, now that we shared some chocolate love this AM, how about being our new best friend on Twitter with a follow. #WeLoveGMA	1389799350	423475283736264704	f	sweeterynyc
Thank you @GMA, love being todays special guest!	1389793294	423449883408748544	f	sweeterynyc
RT @TheBeils: I see you on @GMA @SweeteryNYC ... I forgive you for not being at Hudson/King today!	1389793215	423449555271577600	f	sweeterynyc
So nice to see Sweetery on Good Morning America, making many happy with or beyond special hot chocolate.	1389792986	423448591055585280	f	sweeterynyc
Sweetery is serving our amazing hot chocolate on Good Morning America this AM #HotChocolateForAll http://t.co/nrDhkvBVz6	1389791367	423441802482302976	f	sweeterynyc
Sweetery is making a special appearance on Good Morning America this AM, our incredible hot chocolate for all!	1389791028	423440381380808704	f	sweeterynyc
I posted a new photo to Facebook http://t.co/Rg2aL5KmOt	1389791028	423440378411630592	f	sweeterynyc
I posted a new photo to Facebook http://t.co/j4GbSuAPIK	1389791027	423440377387810816	f	sweeterynyc
Hudson/King St. apologies that we won't be on location until later, we r making an appearance on Good Morning America http://t.co/4APrTSjhD9	1389790678	423438911214321664	f	sweeterynyc
After todays regular Hudson St. service, Sweetery will be making yet another a return appearance @OITNBNews, see you guys later.	1389370417	421676211824115712	f	sweeterynyc
TGIF!!! End the week with the right meal 47th St. &amp;  Park Ave  #Tacos #Burritos #Sliders #Ricebowls #comegetsome	1390578181	426741940881588224	f	mikenwillies
RT @cammcm: @mikenwillies Can my Super Bowl dreams get a #RT    http://t.co/XUwm2u53nK	1390577783	426740271804866561	f	mikenwillies
Last day at the @javitscenter for the @ahrexpo today. tomorrow back to 47th St. &amp; Park Ave  #comegetsome #staywarm	1390492365	426382002124640256	f	mikenwillies
RT @villadh: Yo @cpow56 check out @mikenwillies if you are at @javitscenter today through Thursday for @ahrexpo	1390320489	425661102241116160	f	mikenwillies
We're at @javitscenter today through Thursday for @ahrexpo #comegetsome	1390318126	425651191595278336	f	mikenwillies
RT @NYClifeyy: @mikenwillies beatiful food!! Highly recommended :)	1390152762	424957604025335808	f	mikenwillies
TGIF!!! End the week right 47th &amp; Park Ave #Tacos #Sliders #Burritos #Ricebowls #comegetsome	1389979256	424229864556613632	f	mikenwillies
RT @cammcm: @hibachiheaven Can my Super Bowl dreams get a #RT  http://t.co/XUwm2u53nK	1390619663	426915929453518848	f	hibachiheaven
RT @ohlivvyuh: Happiest girl in the world. @mactruckny and @mikenwillies for lunch! Supporting small and mobile business is fun! @nycfoodtr...	1389899246	423894280248500224	f	mikenwillies
RT @spaceywaceyjflo: @mikenwillies Hear, hear!!  "@ZaraAhmadPost: Mike n Willies! The best food truck and the best dudes. http://t.co/bh2tt...	1389899243	423894266902228993	f	mikenwillies
RT @randomfoodtruck: Food truck party! @lobstertruckny @CarpeDonutNYC @mactruckny @PolishCuisine @mikenwillies @TheSteelCart	1389887445	423844781970948096	f	mikenwillies
Our favorite spot &amp; customers 56th Street &amp; Broadway #comegetsome #tacos #sliders #burittos @randomfoodtruck	1389884602	423832859418574848	f	mikenwillies
RT @davidbivins: @mikenwillies are the spot for lunch at #NRF14 ! Check them out in the truck outside Javits 4 sliders and tacos!	1389734494	423203258262650880	f	mikenwillies
@davidbivins glad you enjoyed!!	1389734492	423203249353949184	f	mikenwillies
Happy Monday!! Were at @javitscenter today and tomorrow for the @RetailBIGShow be back at our regular spots next week	1389629268	422761911168409600	f	mikenwillies
Happy Friday!  47th Street &amp; Park Ave serving your favorite #tacos #sliders #comegetsome	1389370100	421674881215119361	f	mikenwillies
Beautiful day for 56th Street &amp; Broadway #tacos #sliders #favoritepeeps #comegetsome @randomfoodtruck	1389279347	421294235988815872	f	mikenwillies
RT @BrookfieldPLNY: @mamuthainoodle and @mikenwillies are at the North End lot. Get some grub! #foodtrucks #lunch	1389204923	420982078772350976	f	mikenwillies
#WFC N. End &amp; Vesey St We are here to warm you up!!  #tacos #sliders #hotsauce #comegetsome preorder 917-995-5170	1389196224	420945593419444224	f	mikenwillies
@WereTeamUSA tx for looking for us.  Off the road til Monday.  Hope to see you next week!!	1388691841	418830053989175296	f	mikenwillies
#FiDi today Old Slip &amp; Front Street end the year with a happy belly #tacos #sliders #burritos #comegetsome	1388417320	417678630756446208	f	mikenwillies
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
@tsalogub52 none off the menu but try our hot chicken pizza with Panko breaded chicken, hot cherry peppers, garlic and franks	1389308327	421415784251158528	f	eddiespizzany
@ginovea upper east side 73 and 3	1389302904	421393039169695744	f	eddiespizzany
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
@midtownlunch HH2 is on broadway btwn 55&amp;56 today. The word of the day is "rain delay" for ur free upgrade. #midtown get ur #yumyum on today	1389710333	423101920958758912	f	hibachiheaven
We are on 14th and 3rd ave for dinner tonight infront of trader joes. #unionsquare get ur #yumyum on today	1389646131	422832638312083456	f	hibachiheaven
@DispatchBP HH3 is @BrookfieldPLNY n.end&amp;vesey today. The word of the day is "extreme" for ur free upgrade. #wfc get ur #yumyum on today	1389622207	422732294386765824	f	hibachiheaven
@DUMBOFoodTrucks HH2 is @dumbolot jay&amp;water today. The word of the day is "extreme" for ur free upgrade. @DumboNYC get ur #yumyum on today	1389622088	422731796703629312	f	hibachiheaven
@MatthewPizzulli next week Matt. This week has been brutally cold :(	1390580853	426753147697397760	f	schnitznthings
Morning everyone! Still a bit cold for us to come out today:( can't wait for this bitter cold to go away. We miss you. Hope 2 b out tomorrow	1390490155	426372730767048704	f	schnitznthings
Good morning guys. The weather is keeping the truck and the cart in today and possibly tomorrow. Hope to be out on Friday. Stay warm!	1390405047	426015763074666496	f	schnitznthings
Good morning guys. The truck and cart are staying in today due to the weather. We hope to be back out tomorrow. Stay warm and dry	1390317667	425649264854056960	f	schnitznthings
Good morning guys! Today the cart is off the road. Only the truck will be out serving schnitz on Varick &amp; Charlton sts 11:30-2. C u out:)	1390228065	425273448139857920	f	schnitznthings
RT @DispatchNY: . @BrookfieldPLNY NORTH Lot | Friday, 1/17, 11a-3pm | North End Ave. &amp; Vesey St. | @Mexicue @SchnitznThings @ToumNYC | #nyc...	1389971250	424196286246846464	f	schnitznthings
RT @DispatchBP: . @BrookfieldPLNY NORTH Lot | Friday, 1/17, 11a-3pm | North End Ave. &amp; Vesey St. | @Mexicue @SchnitznThings @ToumNYC | #nyc...	1389971244	424196259810140161	f	schnitznthings
The truck will be at @BrookfieldPLNY at North End &amp; Vesey streets from 11-3pm. Finish the week with some schnitz! Preorder 347-772-7341	1389971234	424196219012120576	f	schnitznthings
Happy Friday:) the #schnitzcart will be on 49th st between 6th &amp; 7th aves from 11:00-2pm. It's a perfect day for a warm delicious schnitz:)	1389971080	424195573617790976	f	schnitznthings
The #schnitztruck will be on 51st street b/w park and madison from 11:30-2pm. Perfect schnitz weather. Preorder 347-772-7341. See ya:)	1389885980	423838639479881728	f	schnitznthings
Good morning Greenwich st &amp; Park place. The #schnitzcart is coming your way:) 11:00-2pm you can get your schnitz on. Hope to see you!	1389884745	423833456544849920	f	schnitznthings
The #schnitztruck will be on 47th &amp; lex from 11:30-2pm. Come get some! If you'd like to preorder just call 347-772-7341. Hope to see u:)	1389799517	423475984700940289	f	schnitznthings
Morning guys. The #schnitzcart is on 27th &amp; Park from 11:00-2pm. Looks like the sun is coming out:) perfect weather for Schnitzification!	1389799388	423475445070168065	f	schnitznthings
the truck and cart are running a little late. Some mechanical problems. We will try to be open by 12:00. If we will open earlier will update	1389712841	423112442160615424	f	schnitznthings
The #schnitzcart will make an encore appearance on 55th &amp; broadway today from 11:00-2pm. Hope to see you guys out. @randomfoodtruck	1389710109	423100982172872704	f	schnitznthings
Don't let the rain stop you from getting your schnitz on. The #schnitztruck will be on 52nd b/w 6th &amp; 7th 11:30-2pm. Preorder 347-772-7341	1389709866	423099961304416256	f	schnitznthings
The #schnitztruck is on Varick and Charlton for our for Hudson and King schnitz fans from 11:30-2pm. Come by or preorder 347-772-7341	1389628278	422757758833000448	f	schnitznthings
Hey guys the #schnitzcart is on corner of 55th &amp; broadway. New location for us. @randomfoodtruck come by for some schnitz:) 11:30-2pm	1389626287	422749406916800512	f	schnitznthings
@MatthewPizzulli glad you enjoyed it Matt! We will continue to bring it on board just for you :)	1389381738	421723691731677184	f	schnitznthings
Hi guys. The #schnitzcart is on 49th between 6th &amp; 7th aves from 11-2pm. Finish off the week strong with some delicious warm schnitzel:)	1389369948	421674243827707905	f	schnitznthings
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
RT @ChineseMirch: #HappyNewYear ! #snowstorm - be home, stay warm &amp; stock up some soup from us this afternoon.	1388685976	418805457080557568	f	getstuffednow
#2013WasGreatBecause you all gave us so much love on the streets of #NewYork ! #BringItOn2014 !	1388520271	418110439047053312	f	getstuffednow
RT @ChineseMirch: #fridayflavors- spice , spice &amp; more spice! Worth trying- our crisp chicken lollipops, favorited by @nytimesfood &amp; @julia...	1388173526	416656084427112449	f	getstuffednow
RT @ChineseMirch: #MerryChristmas ! All our locations are open - we look forward to celebrating today with your families:) http://t.co/HSrj...	1387981820	415852011620671488	f	getstuffednow
RT @ChineseMirch: #happyholidays ! Time to eat, drink &amp; be merry!	1387910439	415552618166255617	f	getstuffednow
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
Serving delicious and nutritious lunch: soup, rice platter &amp; Arepas! Enjoy it!	1387560265	414083880845852672	f	palenquefood
RT @DispatchNY: . @BrookfieldPlNY NORTH Lot | Thurs 12/19, 11a-3p | N. End Ave./Vesey | @FritesnMeats @SweetChiliNYC @Palenquefood @MilkTru...	1387470296	413706524029374464	f	palenquefood
@DispatchNY @BrookfieldPLNY @fritesnmeats @sweetchilinyc @milktrucknyc @TaimMobile	1387470291	413706503787663360	f	palenquefood
Here we are WFC, with soup, rice &amp; beans and Arepas! North end &amp; Vesey st!	1387468768	413700115036401664	f	palenquefood
@dkj104 indeed	1390581153	426754405321682944	f	mexicue
@wfc today! Vesey and North end!	1390581124	426754281346441216	f	mexicue
RT @whatupnature: Are we all in agreement that the guys on the @Mexicue truck are just goddamn american heroes?	1390501476	426420216864968704	f	mexicue
RT @FSNYC: Chili &amp; beer...the perfect snow diet! #NYChiliFest is Sun! Can't wait to try @Mexicue's chili!! Get yer tix http://t.co/HY2sk0nMMA	1390501311	426419522942533632	f	mexicue
MexicueCatering will be obsessing about all things wedding at the Martha Stewart Wedding Party this Sat @Gotham Hall! http://t.co/WWT9eNVIAp	1390498423	426407408345579521	f	mexicue
Water and broad!	1390492875	426384140926468096	f	mexicue
The truck is staying home and sipping hot cocoa today but please visit us at our midtown west location!	1390407100	426024374098227200	f	mexicue
Corner of Starret Lehigh and winter wonderland!	1390320780	425662322036994049	f	mexicue
Thats right, we're running FiDi! Front &amp; Gouverneur ready by noon!	1390408486	426030188137566208	f	korillabbq
We're very honored to have our Burnt Ends Chili included on Food &amp; Wine's list of the Best Chili in the U.S.! http://t.co/DpyzWBPvZi	1390241040	425327866814148610	f	mexicue
@AlmostMedia Our pleasure!	1389987656	424265096777703424	f	mexicue
@WFC TGIF FTW...north end and veset	1389974657	424210576337031168	f	mexicue
RT @DispatchNY: . @BrookfieldPLNY NORTH Lot | Friday, 1/17, 11a-3pm | North End Ave. &amp; Vesey St. | @Mexicue @SchnitznThings @ToumNYC | #nyc...	1389974616	424210403607195648	f	mexicue
Break your Resolution: BBQ Nachos with Burnt Ends Chili. Come on... you deserve it.	1389896059	423880912389300224	f	mexicue
Keep your Resolution: Brown Rice n Greens Bowl. Stay strong... we believe in you. http://t.co/90yf8h9g5f	1389896037	423880819238010881	f	mexicue
@AlmostMedia Yes! Water &amp; Broad!!	1389890716	423858502080421888	f	mexicue
Water and broad!	1389890670	423858307749920768	f	mexicue
18th and 5th...a nice day to break your New Years resolution with our burnt end chili burrito.	1389801979	423486313401442304	f	mexicue
RT @axelroote: @GuyGourmet @Mexicue by far.  The Alabama Chicken tacos are amazing. #FoodFight	1389730401	423186094449254400	f	mexicue
Starret Lehigh...we missed you guys and your rice bowl eating ways...12-230 today!	1389714978	423121404125798400	f	mexicue
RT @starrett601: Green Chili Mac &amp; Cheese anyone?? @Mexicue shares their killer recipe with #starrettlehigh.http://t.co/wEs4Rs3wA9	1389642189	422816105481379840	f	mexicue
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
@iamvhinasyhah as soon as the new year approached, Jan 2 !!	1387599623	414248961357414400	f	lovemamak
@iamvhinasyhah won't be back till next year.... Uh noooo lol	1387599387	414247973506519040	f	lovemamak
@WPNYC77 @Playmaka34 we are only at 7 Hanover Sq for today	1387560757	414085946012102656	f	lovemamak
@Playmaka34 thanks u too	1387554145	414058214087725056	f	lovemamak
Our last day of the season. Grab some #rendang #curry before we're gone for the year !	1387551330	414046407033905154	f	lovemamak
RT @i8and8: Mushroom and bamboo shoots steamed Dumprings at @LoveMamak #Dericious http://t.co/dJiwRjd0Ju	1386963030	411578898804391936	f	lovemamak
@WPNYC77 @MaMakRendang we are open !! :)	1386871078	411193221713506304	f	lovemamak
@zacharymexico not tonight, we will be back on bedford Monday with new menu	1386714212	410535278873690112	f	lovemamak
Just added Unibroue La Fin Du Monde on tap. http://t.co/0M8zJsyJtj	1390496369	426398793123528704	f	shortysnyc
Just added Schlafly Export IPA on tap. http://t.co/8kKzgarCTc	1390496318	426398581810290688	f	shortysnyc
Just added Goose Island Ten Hills Pale Ale on tap. http://t.co/Eznz14Rwwt	1390496318	426398579234594816	f	shortysnyc
Just added Greenport Harbor Other Side IPA on tap. http://t.co/lL5txspmnS	1390496316	426398573518143488	f	shortysnyc
Just added Schlafly Export IPA on tap. http://t.co/eRzhEBYrIr	1390496314	426398565162688512	f	shortysnyc
Just added Virtue Cider The Mitten Bourbon Barrel Aged on tap. http://t.co/3lLIORDKZL	1390496312	426398555423903745	f	shortysnyc
Just added Unibroue La Fin Du Monde cans. http://t.co/Vm4wbhJ0yi	1390496112	426397718018134016	f	shortysnyc
Just added Cigar City Florida Cracker White cans. http://t.co/1ZjWlk9Kaw	1390496078	426397574438744064	f	shortysnyc
Where are you watching the Super Bowl? #shortysnyc Check out one of our locations! 576 9th Ave / 66 Madison Ave /... http://t.co/omfJJhoK9H	1390490446	426373953423433728	f	shortysnyc
Where are you watching the Super Bowl? #shortysnyc #20beersontap #3locations http://t.co/ulBwswKno4	1390446195	426188348940902400	f	shortysnyc
Dumbo.  Jay &amp; Water.	1389801579	423484635285581824	f	shortysnyc
@UncleDoctorDuck email us details at info@shortysnyc. how many people, which day, etc?  if we can we will:)	1389735178	423206127086862337	f	shortysnyc
Just added Ommegang Gnomegang on tap. See our full beer menu: http://t.co/qan6zoyf3g @BreweryOmmegang #BeerMenus	1389726545	423169920613236738	f	shortysnyc
Just added Ommegang Gnomegang on tap. http://t.co/MG6f4rtckK	1389726545	423169919207739392	f	shortysnyc
Just added Dogfish Head Piercing Pils on tap. http://t.co/7GYfLc5nSk	1389726306	423168914793984000	f	shortysnyc
Just added Dogfish Head Piercing Pils on tap. See our full beer menu: http://t.co/qan6zoyf3g @dogfishbeer #BeerMenus	1389726305	423168913292410880	f	shortysnyc
Just added Dogfish Head Olde School Barleywine on tap. http://t.co/jbZl7XYTg7	1389716374	423127258417475584	f	shortysnyc
Just added Lagunitas Hairy Eyeball on tap. http://t.co/QO3j4eAcrs	1389712849	423112475064549376	f	shortysnyc
Dreary day. Head over to 47th &amp; Park. A whiz wit' will cheer you right up!	1389712271	423110049297616897	f	shortysnyc
WFC for lunch-- North End and Vesey.	1389629318	422762120472580097	f	shortysnyc
Sorry! one block south of our normal spot on Front &amp; Gold st. Not Front and Jay	1390587473	426780912463147008	f	korillabbq
Just up the block from our regular spot Parked on Front &amp; Jay st ready at 11:45!	1390579801	426748732764594176	f	korillabbq
Headed to Fidi Front St &amp; Gouveneur Ln!	1390575590	426731073570353152	f	korillabbq
Headed to FiDi. Front &amp; Gouveneur for lunch. See you soon	1390575464	426730544492449792	f	korillabbq
Sorry guys. Done for the day.	1390504040	426430969483382784	f	korillabbq
Sorry Midtown, truck 2's frozen over. We'll have to see you next week :(	1390495794	426396384028557312	f	korillabbq
We here DUMBO! Water &amp; Jay ready @12pm!	1390495717	426396058772860928	f	korillabbq
Done in FiDi! Thanks to all those that come out and braved thru the cold!	1390419025	426074389151768576	f	korillabbq
Done for the day! Stay warm yall	1390333277	425714738610585600	f	korillabbq
SoHo we here! 12:45 Varick &amp; Vandam	1390324779	425679096111435776	f	korillabbq
It's snowing but we're still on the way SoHo. Varick &amp; Vandam keep posted for opening time	1390317982	425650585506152448	f	korillabbq
Done @ Dumbo Lot. Have a great weekend guys!	1389987908	424266153381601280	f	korillabbq
Ready for everyone at fidi, front and gouverneur!!	1389977559	424222749817454592	f	korillabbq
We back DUMBO! Water &amp; Jay ready by noon!	1389977178	424221151829979136	f	korillabbq
Done in DUMBO! Catch us again tomm!	1389900592	423899923709710336	f	korillabbq
Open at 47th &amp; Park!	1389889503	423853412720316416	f	korillabbq
DUMBO LOT! Water st &amp; Jay st ready by 11:30!	1389888964	423851155349708800	f	korillabbq
Headed to @DUMBOFoodTrucks Jay &amp; Water St and Midtown's 47th &amp; Park!	1389882900	423825718506962944	f	korillabbq
Open at fidi front and gouverneur by 1130!!	1389801801	423485565372080128	f	korillabbq
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
We just arrived on 51st street between Park and Madison!\nCome an get it!!	1389800950	423481994350444544	f	seoulfoodnyc
What's poppin? Getting ready for lunch already! We are on We are on 51st between Park and Madison Avenues- see you later!	1389702172	423067692057493504	f	seoulfoodnyc
How can you study, with an empty tummy?\nWr are at NYU WEST 4th at Green in front of NYU SCHOOL OF BUSINESS!	1389648947	422844447919833088	f	seoulfoodnyc
Boom- we are on 51st street and Park ave!!!!	1389621317	422728559401373696	f	seoulfoodnyc
The sun is not even up and we are already stationed at 51st at the corner of Park Ave for your lunch;)	1389355043	421611728066318336	f	seoulfoodnyc
We just rolled up to 68th and Broadway! Let's do this!	1389302604	421391783780950017	f	seoulfoodnyc
It feels like summer!!!\nCome have lunch with us On 51st between Park and Madison Avenue!!	1389273787	421270913812672512	f	seoulfoodnyc
It is lunch time!!!\nWe are at 51st between Park and Madison!!!	1389028238	420241007809024000	f	seoulfoodnyc
Don't let a little rain get you down! We are at 67th and Broadway in the front door of Apple Store !! Come and get your food on!!	1388939845	419870259135643648	f	seoulfoodnyc
Gothamist asks the tough question: What's the best bite on a pizza? http://t.co/RaN48aAE5o	1390599650	426831986523901952	f	neaexpress
Cheaper, cleaner trains? Sounds like a deal. http://t.co/ysmQkO7449	1390596037	426816832813957120	f	neaexpress
Coke with real sugar goes with everything. It's a law.	1390588514	426785280478425088	f	neaexpress
It's almost Super Bowl party season! Come spend it with us at The 50 Yard Lounge: http://t.co/gxcZ5B30Km	1390577597	426739489193877505	f	neaexpress
A jazz musician turns to sculpting in Manhattan: http://t.co/shrKX3fNRh	1390569989	426707579054858240	f	neaexpress
Rise and shine! Or stay in, we won't judge.	1390569475	426705423954362368	f	neaexpress
We'll be at The 50 Yard Line's "From Paris to Rome" next Thursday! Come make an evening of it with us. http://t.co/KCfE5G7WvR	1390514116	426473232930471936	f	neaexpress
The Motley Fool explains CNG's recent momentum: http://t.co/caPpuuCAK1	1390507336	426444795289276418	f	neaexpress
We're at the 50 Yard Lounge's parties next weekend, here's a glimpse of what to look forward to: http://t.co/oHo1QBPaRH	1390503966	426430659641765888	f	neaexpress
NYC's new sustainability plan makes it's debut: http://t.co/A1rRh3F3Ic	1390496785	426400541019996160	f	neaexpress
What do you call a pizza without the extra virgin olive oil? We're not sure either.	1390494086	426389217447784448	f	neaexpress
Kickoff with us next Friday at the 50 Yard Lounge! http://t.co/gxcZ5B30Km	1390490595	426374578404065280	f	neaexpress
"Three reasons NYC made environmental history in 2013": http://t.co/db7hTX9bc1	1390423321	426092407630086144	f	neaexpress
Love us? Football? Both? The 50 Yard Line's "Around the World" event was made for you: http://t.co/ZzdhEa0pJi	1390418190	426070886987595776	f	neaexpress
Half of Utah's state fleet may be headed towards CNG: http://t.co/lDi53yFHI6	1390411223	426041668257988608	f	neaexpress
The snow looks fantastic, once it's done messing with traffic.	1390407657	426026709637660673	f	neaexpress
We'll be at The 50 Yard Line next Friday! Go "Around the World" without leaving NY: http://t.co/bbiubTtMSF	1390403745	426010303663710208	f	neaexpress
Good morning! The sun's making a cameo appearance.	1390401519	426000964504793088	f	neaexpress
The GMO labeling debate picks up speed in Oregon: http://t.co/dSQJNtkmEs	1390334125	425718296387018752	f	neaexpress
An LA Times editorial takes the direct approach: "Stop the foot-dragging on climate change." http://t.co/sVGP6OZJ4c	1390330539	425703253725425664	f	neaexpress
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
We're off the streets for a private event today &amp; tomorrow, sorry for the inconvenience, folks!	1389886983	423842843958853632	f	morristruck
@abmansfield @morristruck: @abmansfield Ugh, sorry Abigail! Next week, we'll shower you with cheese. #makeitrain	1389885828	423838002469928960	f	morristruck
@mollylafferty Count on it!	1389885435	423836350060969984	f	morristruck
@radi0head We're missing your cute face and love of gluten big time	1389885169	423835238218096640	f	morristruck
Dear @DumboNYC, \nYou know those days when you just can't catch a break? That's today for us. We're closed for lunch, and so sorry about it!	1389799485	423475853079502848	f	morristruck
RT @sim1_castillo: @morristruck Gouda Sandwich + a cup of my homemade chili = perfection on a rainy NYC day	1389730749	423187552401887232	f	morristruck
Open at 29th &amp; Park! #lunchtime #cheesetime	1389718447	423135953545605122	f	morristruck
It's a beautiful day in the neighborhood! #Midtown today at 52nd &amp; 6th, come eat and start the week off on the right stomach! #goodfood	1389629441	422762636518772736	f	morristruck
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
Happy New Year! We r on 46th off 6th today!	1388504928	418046087635947520	f	grillonwheelsny
Open from 11-3:00 today on 46th bet 5/6th.\nCall for p/u or delivery! 718-564-9991	1388414497	417666790232428544	f	grillonwheelsny
Open for dinner on Broadway &amp; 77th street	1388092388	416315767064653824	f	grillonwheelsny
on 46th (bet 5/6th) open for lunch at 11:00.... Dinner location tba	1388071465	416228011353329664	f	grillonwheelsny
Grill on Wheels is on 46th (bet 5/6th) open for lunch at 11:00.... Dinner location tba	1388071301	416227323713970176	f	grillonwheelsny
Grill on Wheels will be at the JSpace event tonight located at The Finale! 199 Bowery	1387936231	415660798963646464	f	grillonwheelsny
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
Sigh...monday ): 50th and 6th for lunch! Cheer yourself up with some warm burritos and bowls.	1387201769	412580242671157249	f	domotaco
49th and 6th for lunch!! DOMO TACO. Eat a taco and it'll give you super powers and hopes..and happiness... do i... http://t.co/9L3TEfT5sQ	1386950526	411526453474238465	f	domotaco
53rd and park SW corner! Come thru! Will be here till 2:30	1386863669	411162145133322241	f	domotaco
Wooohooo half way there til the weekend!! Come by water and jay st for some yummy tacos, burritos and bowl!... http://t.co/mtW27d7RGR	1386775900	410794017454964736	f	domotaco
RT @mooshugrill: We're making our debut on 46th &amp; 6th! @midtownlunch #holidayduck #ChristmasShus #nyc	1386775125	410790768400691200	f	domotaco
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
RT @chayapathi: Congrats @taimmobile, @calexico and @VeganLunchTruck - you guy are the best http://t.co/w8D15EEZlh via @itsashleyperez	1387809097	415127559290896384	f	taimmobile
RT @therevajm: Eating here so much, I just might turn #yummy @TaimMobile	1387634696	414396068747804672	f	taimmobile
@Bel_botum_JRome Likewise! Thanks for always stopping by, see you soon.	1387571995	414133081449451520	f	taimmobile
@niftinessafoot Sorry Matthew. I guess the lesson here is, always squirrel away falafel.	1387557471	414072165160718336	f	taimmobile
@pepperknit Great call. Home lunch is for suckers.	1387557150	414070817853820929	f	taimmobile
Butternut Squash is the soup du...how do you say last soup of the season? Get yours now on Varick/Vandam	1387556931	414069897418014720	f	taimmobile
Back to feed the masses for dinnetn61st and Broadway till 9 grab a cheesesteak \nGOT WHIZ? http://t.co/KFolo9kmIn	1389910371	423940941880508416	f	carlssteaks
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
Wow it may be a snowy Super Bowl folks!! http://t.co/pug5MWCsRR	1390613212	426888868366135296	f	carlssteaks
Getting ready for Rangers Devils Sunday come by grab a carls famous cheesesteak\nGOT WHIZ? http://t.co/11avGYKHWo	1390596210	426817557925203969	f	carlssteaks
RT @AllyeZoop: @carlssteaks @randomfoodtruck oh man.. I miss Carlssteaks! @carlssteaks	1390579352	426746851900272640	f	carlssteaks
@AllyeZoop @randomfoodtruck and we miss you too !! Come on by	1390579347	426746829108441088	f	carlssteaks
Holy crap cold buts its Friday and that's CHEESESTEAK DAY Broadway&amp; 55th st 11-3 @randomfoodtruck @VictoriasSecret @Barclays @DefJamRecords	1390576063	426733055018283008	f	carlssteaks
Holy crap cold!10 Hanover square &amp; water st 11-3 serving up piping hot cheesesteaks perfect day to add CHICKEN AND DUMPLING SOUP GOT WHIZ?	1390489948	426371864727150592	f	carlssteaks
Sorry folks takin a snow day crazy cold day stay warm see you all tomorrow GOT WHIZ?	1390403356	426008670120734721	f	carlssteaks
RT @dumbolot: We got @YouGotSmoked and @carlssteaks on Jay &amp; water &amp; snow today!	1390332302	425710646035230720	f	carlssteaks
Hey folks snow blow we still need to feed the masses jay st and water st 11-30 3 @DUMBOFoodTrucks @dumbolot GOT WHIZ 917 597 4313 ORDER	1390319211	425655739869569024	f	carlssteaks
Happy MLK DAY Serving up our famous cheesesteak s front of home depot on 23rd st bet 5th &amp; 6th st GOT WHIZ?	1390236945	425310692166893568	f	carlssteaks
Happy Saturday folks serving up our famous cheesesteaks till 9pm on Broadway and 67th st front of the Apple store GOT WHIZ?	1390064943	424589264165548032	f	carlssteaks
RT @iNewsReporter: @carlssteaks BEST cheesesteaks on this side of #Philly	1389976599	424218721234993152	f	carlssteaks
Scream from the rooftops its CHEESESTEAK FRIDAY folks 55th &amp; broadway11-3 @DefJamRecords  @VictoriasSecret @Barclays @DefJamRecord GOT WHIZ?	1389971848	424198793987637249	f	carlssteaks
Back in FiDi 7 Hanover Square&amp; water st 11-3 come by create your perfect cheesesteak and dont forget our BEER BATTERED ONION RINGS GOT WHIZ?	1389887088	423843284877058050	f	carlssteaks
Hey UWS back for cheesesteak nite broadway and 61ST ST Till 9 your creation awaits GOT WHIZ?	1389823296	423575721907605504	f	carlssteaks
Cheesesteak hump day baby!!! 49th st 6/7th ave 11-3 @SiriusXMNFL @SIRIUSXM @Barclays @FoxNews BEER BATTERED ONION RINGS GOT WHIZ?	1389799033	423473954486251521	f	carlssteaks
Hey folks lets not have rain stop you UWS dinner Broadway and 61st till 9 cheesesteaks for all!! GOT WHIZ?	1389737371	423215326797783040	f	carlssteaks
@josh2262 @dumbolot @Datalot sorry mechanical issues last minute we will be back next week	1389736643	423212274539839488	f	carlssteaks
Seems like Tuesday's are officially rain day @dumbolot late start truck getting fixed water &amp;jayst 12-3 so come by for your fix GOT WHIZ?	1389713395	423114762634149888	f	carlssteaks
#tgif 53rd and park! stay warm	1390578397	426742845811073025	f	biandangnyc
53rd and park. Stay warm nyc	1390493269	426385792345190400	f	biandangnyc
53rd and park! Brrr. Stay warm #nyc!	1390492261	426381564683902976	f	biandangnyc
dont let a lil snow stop you from trying out our #pigtrotters special! 53rd and park!	1390317928	425650360577847297	f	biandangnyc
Tuesdays special: braised #pigstrotters with lily flower! #nyc #taiwan #pork http://t.co/P2RwG5Lw9c	1390260294	425408626635726848	f	biandangnyc
Tuesday's Special: Braised #pigstrotters with lily flowers. #comegetsome http://t.co/3nCeELQWDa	1390250825	425368907159842816	f	biandangnyc
Serving lunch and dinner on 8th ave btwn 61st/62nd street in brooklyn!	1390236931	425310632229883904	f	biandangnyc
#tgif 53rd and park! Enjoy your 3-day weekend!	1389971626	424197864617549824	f	biandangnyc
53rf and PArk!	1389889951	423855295547183104	f	biandangnyc
53rd and park! #humpday	1389799939	423477755859070977	f	biandangnyc
lil dreezy can't stop us. come by 53rd and park!	1389716468	423127653080526849	f	biandangnyc
53rd and park. Enjoy the sunny weather!	1389627227	422753350954647552	f	biandangnyc
53rd and park	1389372174	421683580662992896	f	biandangnyc
#FF @mooshugrill @domotaco @dumbolot #followfriday	1389370677	421677299197816833	f	biandangnyc
#tgif 53rd and park!	1389368832	421669561901916160	f	biandangnyc
53rd and park... again. Just like yesterday... And the day before and the day after. 11:30-2:30 #nyc	1389281431	421302976041324544	f	biandangnyc
#humpday #wednesday 53rd and park. Brrrr~ #staywarm! #bundleup	1389193329	420933448061038592	f	biandangnyc
stay warm new york! we will not be out today!	1389114034	420600861241257984	f	biandangnyc
53rd and park on this rainy day! 11:30-2:30! Let's go!	1389020702	420209398175129600	f	biandangnyc
RT @Lux_Escapes: We chose @biandangnyc and @morristruck as some of the best food trucks to track down in NYC. See why: http://t.co/38s6Y8Wo...	1388682813	418792187871367168	f	biandangnyc
It's cold out there but it's hot hot hot @WebsterHall with Valduccis in the sports bar!  #Bestpizza	1390621980	426925646573756416	f	valduccis
RT @cammcm: @Valduccis Can my Super Bowl dreams get a #RT       http://t.co/XUwm2u53nK	1390574736	426727491265650689	f	valduccis
@SophiaVergara Valduccis #Meatballs are the #Best! #Delicious!	1390485441	426352960809861122	f	valduccis
We are an OfficialCellPhoneForSoldiers drop off site! Help a soldier call home! SupportYourTroops! #BestPizza	1390484594	426349408343441410	f	valduccis
Hosting a #SuperBowl Party? Let us cater! http://t.co/hbnPiDhZIf Appetizers, Heros, Pasta! Whatever you like! #Caterig #BestPizza	1390484493	426348984454488064	f	valduccis
The Sub zero weather keeps us off the streets today! We miss you #NYC! #BestPizza	1390484380	426348509520859136	f	valduccis
Want to impress your guests? #Rent our truck for your #SuperBowl Bash! #BestPizza #Zepolle	1390421492	426084738973962240	f	valduccis
Hosting #SuperBowl? Let us cater for you! http://t.co/hbnPiDhZIf 3-6ft heroes,pasta,pizza,appetizers We've got it all http://t.co/UKLEiJgyQ2	1390420462	426080416101978112	f	valduccis
Dear Faithful Followers,\nPlease, like my new and updated facebook page!\nhttps://t.co/RnNFxb2kET\nYours,\nPizza Lover	1390414904	426057106890838016	f	valduccis
Best pizza in Jersey and NYC? Forget those lame lists and listen to someone who knows his dough http://t.co/pbbjTzh97t	1390404021	426011459873550336	f	valduccis
The #snow is keeping us off the streets! Stay safe and warm today #NYC! #SnowSucks #BestPizza!	1390320888	425662772399972353	f	valduccis
The #Snow keeps us off the streets today #NYC! Be sake and warm! #BestPizza	1390319501	425656958738116609	f	valduccis
RT @WebsterHall: Who is ready for @moguai at @britenites this Saturday??\n\n&gt;&gt; TIX: http://t.co/3BnQo3Z9A7 / http://t.co/ySGEcLmjL1	1389985489	424256010854072320	f	valduccis
Thinking about #Lunch? 26th&amp;11th @starrett601 Nice fresh Sausage&amp;PepperRolls ChickenParmRolls besides the #BestPizza! http://t.co/xPgNDYJgSC	1389978131	424225148552503296	f	valduccis
@starrett601 today 26th &amp;11th #Delicious #Lunch awaits you! #BestPizza #Foodies	1389972443	424201291695259648	f	valduccis
RT @julietcat67: @Valduccis Had the BEST lunch today!! Loved my pizza :)	1389969184	424187619178995712	f	valduccis
#HappyFriday #NYC @starrett601 today 26th&amp;11th! #BestPizza #Foodies	1389967266	424179576772628480	f	valduccis
@julietcat67 We are so glad! Thanks for sharing we love it when customers let us know it's great!	1389927268	424011812070490112	f	valduccis
#delicious ChickenParmRolls today plus the usual #BestPizza 50th &amp; 6th! Retweet for 6 #Free Zepolle!	1389889823	423854757451550720	f	valduccis
Drop off your old cell phones Support the Troops! OfficialCellPhoneForSoldiersDropOffSite 50th&amp;6th Retweet for 6#Free Zepolle!	1389889116	423851792351260672	f	valduccis
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
Gorilla staying in today...cold	1389111815	420591552705339392	f	gcnyc1
G1 Broadway/55\nG2 Columbus/91 @trinity\n#ComeToTheCheeseYo	1389026206	420232484551688192	f	gcnyc1
Pee storm cheese:\nG1 5th Ave /20\nG2 50TH /6\n#ComeToTheCheeseYo	1388683976	418797066945835009	f	gcnyc1
G1- 46 5/6\nG2 - 49/6\n#comtothecheeseyo	1387551227	414045972063608833	f	gcnyc1
This week's\nVege Melt:\nSteamed mixed vegetables, caramelized onions, Tomato, Lemon Horseradish sauce, Swiss &amp; Muenster. ..\n#comtothecheeseyo	1387466368	413690050602627072	f	gcnyc1
G1- 5th Ave / 20th\nG2- 50th/ 6\n#comtothecheeseyo	1387466286	413689704400560128	f	gcnyc1
RT @bigjulzz: Shout to @PhilsSteaks for that banging steak and eggs	1390586059	426774982791036928	f	philssteaks
No parking on 41st until Feb 4th so we moved Phil's Phriday to 51st n Park. Breakfast til 11. Lunch til 2!	1390572312	426717323828150272	f	philssteaks
Its lunchtime and your belly is screaming for a cheesesteak from the jawn! 52nd and 6th til 2. Get your Phil!	1390494574	426391267015421952	f	philssteaks
52nd and 6th for breakfast til 11 and lunch til 2 today!	1390486107	426355751045832704	f	philssteaks
@justyniak not today :( and there is no parking on 41st for 2 weeks so we will put out a new schedule. Tomorrow on 52nd n 6th 6am-lunch	1390402304	426004256857260032	f	philssteaks
Snow day today for the jawn pholks. We be shoveling! Stay warm NYC see u tomorrow	1390402200	426003819986964480	f	philssteaks
We're on 41st btw 6th n BWay cookin' up steak n eggs - come warm up with us before the storm hits!	1390307823	425607974011559936	f	philssteaks
Happy MLK Day! We're off the road today - back out tomorrow NYC	1390229278	425278535100792832	f	philssteaks
Phil's Phriday in phull ephizzect! 41st btw 6th n BWay till 2. Come get it! #PP	1389974743	424210937072349184	f	philssteaks
Sorry for the late post - but come get a late breakfast! 41st n 6th is the spot. Breakfast til 11. Lunch til 2!	1389969095	424187249232605185	f	philssteaks
Throwback Thursday in full effect! Rockin' classic hip hop and serving mouthwatering steaks! 52nd n 6th til 3	1389887366	423844450456985600	f	philssteaks
Find us this morning on 52nd n 6th for a proper American breakfast - steak n eggs baby! OG Jawn has got it going on	1389877092	423801360199712768	f	philssteaks
RT @HoneyChrome: @PhilsSteaks om nom nommmm, come sell at @BKBazaar !!!	1389826790	423590377795620864	f	philssteaks
RT @DoodlebugDoo: That looks so delicious @WinstonWanders!! I wish it was here in #Toronto ;) @nycfoodtruck @PhilsSteaks #PhillySteakSun	1389826780	423590337140236288	f	philssteaks
RT @WinstonWanders: A Real Cheesesteak without the Drive to Philly at @PhilsSteaks in NYC http://t.co/x7IDEBA2iw http://t.co/RrZ8KfibAQ	1389814014	423536790939521024	f	philssteaks
It's almost lunchtime!!!! Come get your Phil at 41st btw 6th n BWay - rocking until 3 today so you have no excuse not to!	1389801689	423485097560375296	f	philssteaks
Good morning NYC! Breakfast is served on 41st btw 6th n BWay - start your day the Phil's way!	1389789953	423435871459631104	f	philssteaks
What's up pholks? Tonight we're at @RoyalPalmsClub for their soft opening. Come grab a cheesesteak &amp; a beer and... http://t.co/mdKITDQ8ea	1389732870	423196448105041920	f	philssteaks
What's up pholks? Tonight we're at @RoyalPalmsClub for their soft opening. Come grab a cheesesteak &amp; a beer and get your shuffle on!	1389732806	423196180168708096	f	philssteaks
RT @RoyalPalmsClub: Might wanna come hungry to our soft opening event tonight...we'll be hosting Phil's Cheesesteaks in our Food Truck bay!	1389732657	423195553896607745	f	philssteaks
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
Finishing up our first week back on 49th &amp; 6th ave! Swing by if you missed us, the #stickyrice is extra sticky! #pekingduck is extra ducky!	1389358887	421627849318346752	f	mooshugrill
@alhernandez76 @randomfoodtruck @midtownlunch @cheap_eats nice strategy!	1389322763	421476336210034688	f	mooshugrill
45th &amp; 6th ave today! Running a little late but will be open by 12!	1389279160	421293448868921344	f	mooshugrill
#Lucky8 (degrees) on 55th &amp; Broadway today! Lunch AND dinner covered! @randomfoodtruck @midtownlunch @cheap_eats http://t.co/AYatGVBGPr	1389188217	420912007425294336	f	mooshugrill
Stay toasty #nyc!	1389113053	420596746583285760	f	mooshugrill
Sup #DUMBO:) back at it in @dumbolot today! @DUMBOFoodTrucks @DumboNYC	1389018796	420201404603858945	f	mooshugrill
@matthewpizzulli glad to have #fans like you! http://t.co/JUpO4QBDNC	1388701330	418869853945348097	f	mooshugrill
The WFC food truck lot is closed today due to frigid temperatures, so our truck is sleeping in. See y'all on Monday in #Dumbo #Isitspringyet	1390572646	426718724130086912	f	toumnyc
It's bitter cold, but we made it into #Dumbo ! Join us on Jay &amp; Water for a hot makanek sandwich that will surely warm you up!	1390489177	426368628343463936	f	toumnyc
We're snowed in again today folks  We hope to be in #Dumbo tomorrow! Be safe and keep warm!	1390403798	426010523814342656	f	toumnyc
Good morning #LebaneseLunchers! We're off the road due to the snow. Hopefully we'll be back tomorrow to satisfy your #shawarma cravings!	1390311945	425625266661376000	f	toumnyc
@myklee_tweet We really wish we could but parking is impossible lately. We do offer catering if your office would like a Lebanese lunch :)	1389979244	424229814854512640	f	toumnyc
RT @DispatchBP: . @BrookfieldPLNY NORTH Lot | Friday, 1/17, 11a-3pm | North End Ave. &amp; Vesey St. | @Mexicue @SchnitznThings @ToumNYC | #nyc...	1389974814	424211235455107072	f	toumnyc
We're back in #FiDi on North End &amp; Vesey St until 3pm. Get your #LebaneseLunch fix on! Your beef kabab awaits. #Yum http://t.co/LLrFvciE2u	1389967325	424179825457512448	f	toumnyc
@Jbliss1 We miss our spot on Water &amp; Wall too, but it hasn't been easy to park. However on Friday's were in FiDi on North End &amp; Vesey St :)	1389921363	423987043568726016	f	toumnyc
@linalovesit sounds great :)	1389901882	423905334340902912	f	toumnyc
@linalovesit oh noooooooo!!!  So so sorry about that, we'll make it up to you next week with lunch on us!	1389901769	423904860350988289	f	toumnyc
RT @MexicoBlvd: #DUMBO love today with @ToumNYC back in the lot with us! Come fill your belly, Brooklyn. #xxxspicy #fresh #goooood	1389892148	423864510336995329	f	toumnyc
@dumbolot Aww gee thanks! We're blushing 	1389887284	423844106084032513	f	toumnyc
RT @dumbolot: and please welcome back Lebanese fav: @ToumNYC #applause	1389887029	423843036934975489	f	toumnyc
We love #Dumbo Thursday's on Jay &amp; Water St! Stop by and try our endless #vegan options. Mmm #Falafel #platter http://t.co/zPNvSxbVOP	1389881483	423819776151261184	f	toumnyc
Wednesday's in #MidtownEast are back in full effect! Join us for a grilled kafta sandwich on 47th btwn Park &amp; Lex! http://t.co/WrONUB0KMR	1389795580	423459474146619392	f	toumnyc
It may be raining but that won't stop us from bringing you the #LebaneseLunch you've been craving! Join us on Jay &amp; Water in #Dumbo today!	1389708441	423093983389032449	f	toumnyc
RT @FoodtoEat: @NuchasNYC @ToumNYC @TheSqueezeTruck @KimchiTruck @UncleGussys @DesiFoodTruck 6 Ways to Do Meatless Monday Right http://t.co...	1389632405	422775068817903616	f	toumnyc
It feels so good to be back &amp; even better to be at @globalFEST_NYC at @WebsterHall until midnight tonight! #shawarma #falafel #yumminess	1389561387	422477196490711040	f	toumnyc
Wishing everyone a happy &amp; healthy New Year! We miss you all &amp; look forward to being on the road again on Jan 12th :)	1388504101	418042617168138240	f	toumnyc
@DaisyMaxey Aww! We'll be back before you know it :) Jan 12th is our first day back on the streets. One month away :)	1386867819	411179553659183104	f	toumnyc
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
NEW YORK CITY!! come get yo #lobster on at 46th &amp; 6th. Warm #CT roll w/ lemon &amp; butter please,  a side of #clamchowder &amp; some #macncheese	1390575352	426730075141464064	f	lobstertruckny
Closing at 6pm Tonight.	1390515951	426480929440542720	f	lobstertruckny
WIN #hookup (lobster roll, chips, soda)its easy, like us on FB &amp; subscribe to our email list on http://t.co/JRG1Oh8Nes. drawing every month!	1390509360	426453281523904512	f	lobstertruckny
Too much snow for the lady #bigred today. Our #lobster condolences. But come check us in #redhook noon-8. #clawsup	1390488917	426367539183378432	f	lobstertruckny
the #pound in #redhook is closing at 5pm tonight. Come early for $20 #lobsterdinner and warm #clamchowder #lobsterMacnCheese	1390416302	426062968464613378	f	lobstertruckny
#bigred is sledding today BUT $20 #lobsterdinner TONIGHT in #redhook @redhooklobster \nCOME  get it. #crustaceanelation #clawsup	1390412924	426048802165096448	f	lobstertruckny
#BIGRED is staying warm inside today! We are open in #redhook at noon! Enjoy the snow. #crustaceanelation #clawsup #chowdason	1390402520	426005162071977984	f	lobstertruckny
HOWDY #lobsterlovers the LB in #redhook closing at 5 today! SNOW DAY!	1390328325	425693967716716544	f	lobstertruckny
We're blowing outta here NYC. Its too #snowy for #bigred, Come see us in #redhook. #happysledding	1390319563	425657215295688704	f	lobstertruckny
#bigred is hanging for now on 50th &amp; 6th... until we get snowed out! @redhooklobster open in #redhook at noon!	1390316472	425644251733848064	f	lobstertruckny
#bigred is CHILLING in the snow on 50th &amp; 6th #heartychowder #warmlobster w/ lemon &amp; butter, #clawsup #lobsterinjanuary!	1390316110	425642732095565825	f	lobstertruckny
Our #lobstermen &amp; #sternmen are enjoying a day off, honoring Dr. MLK Jr TODAY AND EVERYDAY! #riseup	1390229307	425278656634970112	f	lobstertruckny
RT @timmyshirley: Follow @Redhooklobster @lobstertruckny for lobster love and fooking great food!	1390146612	424931809806524417	f	lobstertruckny
Serving up #lobsterlove @bkflea N5 &amp; Wythe till 6pm AND @redhooklobster #redhook till 8. Come and get yo fix. LOBSTER SUNDAY - woot woot!	1390146443	424931100503580672	f	lobstertruckny
Good morning #tribeca. bigred is kicking it on the corner of Chambers and Greenwich. #lobstahforlunch #macNcheese #clamchowda c u soon!	1390056919	424555609414205440	f	lobstertruckny
GOOD MORNING NEW YORK. #bigred is #chillin on 46th &amp; 6th today. #lobstahforlunch #clamchowder #lobsterBLT. Come see us #oldfriends	1389970521	424193227416408066	f	lobstertruckny
#bigred is rockin out on the corner of 55th &amp; Bway. #lobstahforlunch #uknowuwantit We now accept CC's!	1389884136	423830904956784641	f	lobstertruckny
#bigred is heading home for the day. $20 #lobsterdinner tonight till 8pm #redhook @Redhooklobster see you there #crustaceanelation	1389814098	423537144234143744	f	lobstertruckny
#bigred is sitting pretty 50th &amp; 6th, beautiful day today - come on out and treat yourself. Now accepting credit cards. #lobstaforlunch	1389797743	423468546002530305	f	lobstertruckny
#bigred is heading home for the day. check us tomorrow for our whereabouts. still open @Redhooklobster #redhook till 8!	1389724343	423160681853366273	f	lobstertruckny
RT @HaveSippy: Delicious Gourmet Popcorn from Brooklyn Popcorn http://t.co/OMzdMx79Vt via @TwoClassyChics	1390603408	426847748302729216	f	brooklynpopcorn
@Chris_NicoleX @sav_simonetti We'll be there again this weekend	1390603384	426847648046276608	f	brooklynpopcorn
#gourmet #popcorn #giveaway FREE Popcorn if you guess who will win the SuperBowl https://t.co/ccJAQwuAMF	1390603259	426847122168639489	f	brooklynpopcorn
RT @sweetsavoryeats: Still time to enter my Brooklyn Popcorn Giveaway!  I'll be picking a winner tomorrow morning.  Good luck!... http://t....	1390579925	426749255152189441	f	brooklynpopcorn
@Macrotots @lovemykids009 Hi Henri - we got you covered, we ship to Seattle!	1390578148	426741800380821506	f	brooklynpopcorn
RT @Shockinglydlish: #GIVEAWAY of 1-gal tub of best gourmet #popcorn you ever tasted, from @brooklynpopcorn. Choose your fave flavors! http...	1390517277	426486491426979840	f	brooklynpopcorn
RT @TwoClassyChics: Enter to Win a $20 E-Gift Card to Shop at @BrooklynPopcorn on @TwoClassyChics Blog http://t.co/7DzGeZRLzv Ends 2/04 #Gi...	1390517270	426486458275221504	f	brooklynpopcorn
RT @dearlove_angel: Looking for a twist on a old time favorite #snack ? @BrooklynPopcorn has just what your looking for! #win http://t.co/O...	1390517263	426486431607828480	f	brooklynpopcorn
RT @1froglegs: Looking for a twist on a old time favorite #snack ? @BrooklynPopcorn has just what your looking for! #win http://t.co/4QiKiL...	1390517228	426486282559057920	f	brooklynpopcorn
RT @dfral: Enter to Win a $20 E-Gift Card to Shop at @BrooklynPopcorn on @TwoClassyChics Blog Ends 2/04 #Giveaways #ad http://t.co/PO3g97qM...	1390517222	426486259100295169	f	brooklynpopcorn
@x0alessandra we will make our way back in the area next week!! We sell Tall bags on our website all favorite flavors too!! see you soon!	1390505819	426438432919797760	f	brooklynpopcorn
Have you had some Kettle Corn popcorn yet? its crazy delicious!!	1390502697	426425335156965376	f	brooklynpopcorn
@x0alessandra We had an event this morning and we are on E.70th and York Street for today cooking all the favorite flavors!	1390501996	426422395826475008	f	brooklynpopcorn
Hey NYC, Brooklyn Popcorn Truck is parked on E.70th St. &amp; York Ave. We smell hot fresh Kettle Corn, Caramel &amp; Chocolate!! See you soon!	1390496883	426400949687418880	f	brooklynpopcorn
RT @lahappybelle: Feel like I reached another level of sophistication today after eating @BrooklynPopcorn with a spoon.	1390429830	426119710514884610	f	brooklynpopcorn
RT @sweetums82: Looking for a twist on a old time favorite #snack ? @BrooklynPopcorn has just what your looking for! #win http://t.co/CcWtX...	1390417165	426066590090940416	f	brooklynpopcorn
Good morning NYC we are at Beaver and Broad Street today, cooking up all delicious flavors!! Come by and get your favorite flavors!	1390412799	426048278208081920	f	brooklynpopcorn
RT @lovemykids009: Who loves popcorn? I'm giving away 1 Gallon Bucket of @BrooklynPopcorn 20+ flavors on Facebook  http://t.co/Hl7KlARaNr	1390410507	426038663240093698	f	brooklynpopcorn
RT @C__Boggs: Looking for a twist on a old time favorite #snack ? @BrooklynPopcorn has just what your looking for! #win http://t.co/fsKDjtR...	1390410464	426038483941982208	f	brooklynpopcorn
@BrooklynPopcorn #gourmet popcorn is now Gluten Free!	1390326922	425688081912434688	f	brooklynpopcorn
RT @NikaIsaGoddess: @milktrucknyc @houstonhallnyc yassssssss	1390586029	426774856706048000	f	milktrucknyc
Bessie's at Wall &amp; William, call (646) 504-6455 to pre-order or http://t.co/IwkqcCHPzF. Sandwich menu always at @houstonhallnyc	1390575642	426731291174653953	f	milktrucknyc
RT @FoodtoEat: Click to preorder: http://t.co/gGURUn0OAP RT @milktrucknyc:u can preorder today. then rockpaperscissors to see who goes to p...	1390494887	426392577282428928	f	milktrucknyc
RT @mariamilito: It's Thursday and @milktrucknyc is coming to @Q1043 @Z100NewYork @1035KTU @1067Litefm &amp; @Power1051 to serve up lunch!!! #g...	1390494883	426392561448943617	f	milktrucknyc
you can preorder today at 6465046455 or o/l @ http://t.co/psDZsxYjzF. then rockpaperscissors to see who goes to pick up the goods!!	1390489516	426370051240120320	f	milktrucknyc
we're on church &amp; lispenard feeding @Q1043 @Power1051 @1035KTU @1067Litefm @Z100NewYork folks &amp; anybody else! call 6465046455 to preorder!	1390489392	426369529330274304	f	milktrucknyc
Bessie's at Church &amp; Lispenard, call (646) 504-6455 to pre-order or http://t.co/IwkqcCHPzF. Sandwich menu always at @houstonhallnyc	1390489241	426368897168592898	f	milktrucknyc
nice. http://t.co/GRNCS7cbW1	1390408880	426031837694009344	f	milktrucknyc
RT @bkflea: Check out Seattle-based blog @emeraldpalate's list of must-see Flea &amp; Smorg vendors. http://t.co/WnpSAzvopg	1390408855	426031736481677312	f	milktrucknyc
we're @ 58th &amp; madison today folks!  if you don't want to brave the wind chill! call 6465046455 or http://t.co/IwkqcCHPzF free hot choc too!	1390408820	426031589592551424	f	milktrucknyc
sorry folks. snow keeping us from columbia after all.  out tomorrow at 58/mad giving away free hot choc!	1390322231	425668408844496896	f	milktrucknyc
hey columbia, welcome back!  come by for the antidote to Janus.  classic combo is antifreeze for any temperature. 6465046455 to preorder.	1390319901	425658635427917824	f	milktrucknyc
on this MLK day, if you are working or just walking around, you'll find us at 58th &amp; mad. call 6465046455 to preorder.	1390229026	425277478685245440	f	milktrucknyc
@dianholton ;) thanks.	1390228860	425276782200508416	f	milktrucknyc
RT @dianholton: OMG @milktrucknyc is delicious. Why oh why haven't I stopped by before. Oh I know... It's addicting.	1390150228	424946976158146560	f	milktrucknyc
Indoor stand at @bkflea @smorgasburg winter market, North 5th &amp; Wythe. Sandwich menu always at @houstonhallnyc	1390143634	424919318850068481	f	milktrucknyc
our new website is up and looks very stripped down, in a good way. time to lose the tattersall background on this account now. yep.	1390075332	424632839749898240	f	milktrucknyc
Find our indoor stand at @bkflea  @smorgasburg winter market, North 5th &amp; Wythe. Sandwich menu always at @houstonhallnyc	1390057233	424556924244201477	f	milktrucknyc
Bessie's at TriBeCa, b/w Chambers &amp; Greenwich. Call (646) 504-6455 to pre-order or http://t.co/IwkqcCHPzF	1390057233	424556924244197381	f	milktrucknyc
sunny and 41 by noon. perfect weather for some mac &amp; cheese, grilled cheese,  3 cheese	1390056922	424555622311292928	f	milktrucknyc
RT @babifeat: Amazing food truck find today!!  @PolishCuisine	1390595940	426816425974837248	f	polishcuisine
Have a great weekend everyone!!!	1390593012	426804144834637824	f	polishcuisine
Lunch is still available - we are here until 2 on 47th b/w park and lex	1390585749	426773682904506369	f	polishcuisine
Lunch still available! We are here until 2 on 47th b/w park and lex:)	1390585690	426773432752041984	f	polishcuisine
I posted a new photo to Facebook http://t.co/4BDyaaLsJ9	1390579633	426748027890847744	f	polishcuisine
I posted a new photo to Facebook http://t.co/WaC845boQR	1390579491	426747435101077505	f	polishcuisine
Happy Friday! We are on 47th b/w park and Lex open from 11:10-2:00 @midtownlunch	1390573190	426721004463718400	f	polishcuisine
we are closed! thanks for braving the weather! stay warm!	1390505881	426438689997455362	f	polishcuisine
RT @randomfoodtruck: Trucks back from hibernation! Yawn, stretch, eat. @PolishCuisine @TheSteelCart @hibachiheaven	1390495915	426396890180386817	f	polishcuisine
We will be open for lunch on 55th and Broadway from 11:10 - 2:30  - Special PACZKI onboard today!	1390490244	426373105385107457	f	polishcuisine
Good Morning! Make lunch plans on 55th and Broadway with our truck! @randomfoodtruck @midtownlunch	1390486923	426359173853765632	f	polishcuisine
We are off today - slippery roads out there are not safe - becareful!	1390405248	426016606926684160	f	polishcuisine
We are closed - stay warm and get home safe!	1390331958	425709206516551680	f	polishcuisine
We are only open until 2:00 today - a delicious heart warming lunch is awaiting you! 52nd b/w 6th and 7th @midtownlunch	1390325171	425680737254539266	f	polishcuisine
We are open and ready to roll on 52nd b/w 6th and 7th - Smokin' grilled kielbasa + pierogi = great winter lunch!	1390322130	425667983709859840	f	polishcuisine
Hope everyone had a great weekend and Martin Luther King Jr. Day yesterday! We are back on 52nd b/w 6th and 7th... http://t.co/AsXTexFfSr	1390315871	425641733050073089	f	polishcuisine
We are open from 11:15-2:30 on 47th bw park and lex!!!!	1389976205	424217070809513984	f	polishcuisine
Open from 11:15-2:30 on 47th b/w park and lex!	1389976163	424216893705445376	f	polishcuisine
Happy Friday! We are on 47th b/w Park and Lex - will be rockin for lunch!	1389964750	424169023237263360	f	polishcuisine
Hope you had an incredible lunch! thanks for coming!	1389903393	423911674840494080	f	polishcuisine
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
Please vote for our homies @mooshugrill  !!!  http://t.co/Cy1hnmtC00	1387580633	414169311516033025	f	funbunsnyc
RT @FoodtoEat: Today's answer to #12DaysofFoodTrucks is @funbunsnyc ! Thx to all those who played and tune in Monday 12/23 for the LAST day!	1387576969	414153945398128640	f	funbunsnyc
@petermgates We were there till 2:30 p.m. Sorry for the late response.	1383427654	396750454551756800	f	funbunsnyc
Come get your donuts at 55th and Broadway!	1389013272	420178237294411776	f	carpedonutnyc
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
Brave the Cold next week and meet us at the Pre SuperBowl WinterBlast...http://t.co/vSyvQyBDEe	1390600823	426836908023353344	f	thegreenradish1
@sharpguys101 yes, off Friday as well......Sorry!	1390445238	426184335700422656	f	thegreenradish1
@sharpguys101 Sorry, we're off road...	1390409371	426033897416052736	f	thegreenradish1
RT @vegucated: Thanks for following us @SunnySoCalGal @OnlineHealthMag @thegreenradish1 @ddgeekgrrl @PirjoSundqvist @sarahlrailton @CheleyF...	1390056137	424552327396466689	f	thegreenradish1
Where have you Bean all my life? http://t.co/V14x7zzSxm	1389978989	424228746070343680	f	thegreenradish1
RT @randomfoodtruck: Hello, long weekend! I'll kick you off with a tasty lunch. @souvlakitruck @carlssteaks @CarpeDonutNYC @thegreenradish1...	1389976819	424219644791369728	f	thegreenradish1
RT @nycfoodtruck: Your love for food trucks is dwarfed only by their love for you. http://t.co/mbNETmpoh0 #KeepTruckin #NYC #truelove	1389975635	424214679536541698	f	thegreenradish1
#veganlunch 56&amp;BWAY 11to2pm @VictoriasSecret @randomhouse @UniversalMG @nypost @nytimes #midtownlunch @Johnny_Marr @peta @BobbiBrown #vegan	1389967551	424180769792094208	f	thegreenradish1
RT @nycfoodtruck: Great service and a smile to start your day oof right... http://t.co/Q1bK6ridRD #foodtrucks #keepontruckin	1389963754	424164844963905536	f	thegreenradish1
#TGIF Get RADish! 56&amp;BWay, 11to2pm, Oven Baked Beans and Brown Rice Wrap with Sherry and Pumpkin Seed Dressing... http://t.co/NSCz3DiqqA	1389963117	424162175888793600	f	thegreenradish1
Bob fileting #blackbeanburgers http://t.co/XHwEreG7kc	1389962364	424159016554475520	f	thegreenradish1
Serving Smiles! http://t.co/IeATzV8fUl	1389925958	424006317909348352	f	thegreenradish1
Serving Smiles! http://t.co/QouIHd7Fh6	1389889637	423853975180685312	f	thegreenradish1
Vegy Clean Radish! http://t.co/uQHOVdcipU	1389888284	423848302741061632	f	thegreenradish1
RT @johnleesandiego: @RyanNewYork Hoboken and Montclair have hopping food truck scenes including @hungerconstruct  and @thegreenradish1	1389887016	423842984036413440	f	thegreenradish1
Get Some Radish Today! 52&amp;6, #tasty #vegan #organic @ubs @CreditAgricole @RollingStone @AtlanticRecords @cbs @nypost @nytimes @Johnny_Marr	1389877374	423802543794188288	f	thegreenradish1
#veganlunch Today, Thursday, 52&amp;6thAve, 11to2pm, Glazed Tofu Wrap w/Stir Fry Veg, Roasted Tomato and Quinoa Soup... http://t.co/LgBOHsA2oT	1389872826	423783464131776512	f	thegreenradish1
RT @laurakeefe: Thank you @thegreenradish1! Amazing vegan carrot cake w/ my hot chocolate. #midtown #veganlunch	1389814178	423537480558592000	f	thegreenradish1
RT @ExposureNJ: @ExposureNJ #winterblast! @Aroy_D @EmpanadaGuy1 @TFQfoodtruck @oinkandmoobbq @LukesLobsterNY @hungerconstruct @thegreenradi...	1389801430	423484008958541824	f	thegreenradish1
#VeganLunch is on 38&amp;BWAY Today, Wed, 11to2pm Glazed Tofu Wrap Creamy Sesame Dressing..Carrot Cake! @nypost @nytimes @rickygervais @peta	1389788844	423431220320407552	f	thegreenradish1
Sorry, we have been closed due to the deep freeze. Lets hope the weather gets warmer, so we can open again soon.	1390573368	426721751083806720	f	thepocketful
Located in. 52nd between 6th and 7th. Free delivery at http://t.co/6h7IrKccpj	1389971810	424198636428615680	f	thepocketful
Located on 49th between 6th and 7th. Online at http://t.co/6h7IrKccpj	1389887668	423845718261239808	f	thepocketful
Located on 53rd between Park and Madison. Online at http://t.co/6h7IrKccpj	1389801343	423483645039751168	f	thepocketful
Located on 49th between 6th and 7th. Online at http://t.co/6h7IrKccpj	1389713381	423114704345915392	f	thepocketful
Located on Hudson and King!	1389631253	422770236157612032	f	thepocketful
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
Located on 49th between 6th and 7th	1385480434	405360440492175361	f	thepocketful
Loathed on Hudson and King streets. Online at http://t.co/6h7IrKccpj	1385397722	405013519214850048	f	thepocketful
Located on 55th street, between 6th and 7th and online at http://t.co/6h7IrKccpj	1385135166	403912281622593536	f	thepocketful
We couldn't park on 50, so we are on 49th between 6th and 7th.	1385050540	403557332183154688	f	thepocketful
Beat the cold and preorder lunch 646-543-BIGD. 50th Street btwn 6th and 7th Avenue. 11am to 2:30pm! #TGIF	1390577340	426738410137874432	f	bigdsgrub
@CambodianCowboy we're here today!	1390576093	426733181593980928	f	bigdsgrub
RT @nystfood: Hey Everybody! New York Street Food 2.0 Is Coming Soon. Spread The Word. http://t.co/GuMpNFicbj	1390576035	426732939662344192	f	bigdsgrub
Come n' Grub w/ us at 50th Street btwn 6th and 7th Avenue today.  Preorders call 646-543-BIGD #TGIF	1390573616	426722792961478656	f	bigdsgrub
@CambodianCowboy: It is a sad, sad day when your favorite food truck isn't close enough for lunch :( @bigdsgrub Tomorrow!!	1390508304	426448853525860352	f	bigdsgrub
Come n' Grub @Starrett601, we're ready for ya right out front! Preorders call 646-543-BIGD #StarrettLehigh	1390495705	426396011976982528	f	bigdsgrub
Join us today at @Starrett601 for lunch\n26th Street btwn 11th and 12th Avenue\nPreorders call 646-543-BIGD\n#StarrettLehigh	1390485800	426354463830720512	f	bigdsgrub
@starrett601 we'll be serving lunch from 11am to 2:45pm at the front door of the building	1390434211	426138085173522432	f	bigdsgrub
@1337Ryan We'll be there on Friday!	1390430987	426124561562996737	f	bigdsgrub
Which NYC trains do you think suck? http://t.co/t5IMWPAvgO	1390430709	426123398792896512	f	bigdsgrub
Join us tomorrow at @StarrettLehigh for lunch and then #MidtownWest on Friday.	1390430241	426121434650640384	f	bigdsgrub
Check out this wedding we catered, as featured in @WellWed magazine https://t.co/kLBY5nRr5z	1390418339	426071511741763584	f	bigdsgrub
RT @NYClifeyy: Beautiful food @bigdsgrub http://t.co/6Mt56r13Kh	1390373843	425884881898729472	f	bigdsgrub
Closed tomorrow due to the LOVELY weather we're having! Be safe...stay warm!	1390356423	425811819601862657	f	bigdsgrub
Closed today due to weather. Stay safe and warm!	1390318949	425654643189100546	f	bigdsgrub
If we were to celebrate birthdays, Big D's Grub is now 3yrs old today	1390224647	425259110813429760	f	bigdsgrub
@leahdlc: Must. Start. Following food trucks! Yes!	1389909162	423935869956153344	f	bigdsgrub
Lunch is ready! 50th Street 6th and 7th Avenue, now till' 2:30pm. Get those preorders in by calling 646-543-BIGD	1389889098	423851715788808192	f	bigdsgrub
It's THAT time of the week #MidtownWest! Come n' Grub at 50th Street btwn 6th and 7th Avenue, 11am to 2:30pm. Preorders call 646-543-BIGD	1389881658	423820511374999552	f	bigdsgrub
RT @ShanghaiMKS: Tacos, grinders and dumplings... oh my! @bigdsgrub has it all! Find them today on Broadway and 56th St in #NYC!	1389809211	423516646230474752	f	bigdsgrub
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
Our friend Ayinde is trying to start a vegan food truck on the west coast.  We can attest to the yumminess of his... http://t.co/UnVckD6eP8	1389810171	423520670417702912	f	veganlunchtruck
@arthuresque we are on winter break for a few more weeks	1389734901	423204967307296768	f	veganlunchtruck
@fieldshimself only during the summer on Sundays when the farmers market is happening. Mother's Day-thanksgiving.	1389477340	422124678334144512	f	veganlunchtruck
https://t.co/xqRlRIfvkC http://t.co/3hmvJWxvsE	1389441492	421974320127430656	f	veganlunchtruck
@eatmypies awwwww shucks.  Glad you loved it 	1389309705	421421567261044736	f	veganlunchtruck
Leaving tomorrow night to be in Paris with my dad who I love a lot.  \n\nAny vegan restaurants, or yoga spots I should definitely hit?	1389280113	421297448372674560	f	veganlunchtruck
@benapplegate nah- that's what it's like in the fall.  Now its 30 inside instead of 15	1389193629	420934708835672064	f	veganlunchtruck
@MonikaNYC sure.  But they really aren't very processed.  Look them up.  Totally natural and not bad for you.	1389115309	420606208450379776	f	veganlunchtruck
We already miss you so much perry.  NYSF was one blog I read daily. RT @nystfood: Thank you and goodbye! http://t.co/RbiNWB9tZp	1389102765	420553595290144768	f	veganlunchtruck
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
A snowy surprise Tuesday in #DUMBO! Soups are Rustic Chicken Noodle and Organic Lentil. - Front St &amp; Jay through lunch. @DUMBOFoodTrucks	1390311760	425624489024831488	f	thesteelcart
@liang Thank you!! We use whole rolled oats. Be sure to put some good stuff on top!	1390272363	425459244373397504	f	thesteelcart
DUMBO, we will be closed today for the holiday.	1390229228	425278323527540736	f	thesteelcart
Donuts all day at Court and Bergen!	1388926468	419814153571041280	f	carpedonutnyc
This is a real bummer. One of the best burgers in BK. = RT @Gothamist: Brooklyn Public House Rumored To Have Closed http://t.co/IroeifDTox	1390088607	424688518531911680	f	thesteelcart
All for you #DUMBO. It's Jay &amp; Front through lunch. Lentil soup's on board. @DUMBOFoodTrucks	1389966396	424175927757901824	f	thesteelcart
RT @CityStitchette: @TheSteelCart The oatmeal (w/fruit &amp; nuts) hit the spot this morning, as usual.	1389887590	423845390891642880	f	thesteelcart
56th &amp; Broadway work for you? New soup is Sweet Potato Sage. It's quite tasty.	1389882988	423826089597612032	f	thesteelcart
@elizwgreen Monday &amp; Friday are Dumbo days.	1389879690	423812256204611584	f	thesteelcart
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
Jill P. ! You left something important at the truck! Call us! 917-881-7866	1389982401	424243055143964672	f	nautimobile
@justintravis we take card!	1389982307	424242663567937537	f	nautimobile
Governors ball lineup is set, and we"ll be there! Hope it's not a sloppy mudfest like last year.. For today we are at 46th and park.	1389976319	424217548843126784	f	nautimobile
@amberralertt just opened at 46th and park!	1389975135	424212582732677120	f	nautimobile
@arcade127 although we disagree with your opinion, we will defend to the death your right to have it	1389889193	423852116365824000	f	nautimobile
We are grateful that Creed are no longer a band/thing that exists. Join us in thanks at 23rd and park.	1389887814	423846331854372864	f	nautimobile
Thinkin' bout you Hoboken... Those romantic summer sunsets on the Hudson....	1389836704	423631960679137280	f	nautimobile
The fog this morning was like driving through a dirty marshmallow. 46th and park	1389801916	423486049760063489	f	nautimobile
@ChoiceFashionNY you have noo idea. We have dreams about it	1389801762	423485403224866816	f	nautimobile
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
Toast Monster spotted @5pointznyc. @alneuhauser #5pointz http://t.co/gu3UG0XDt7	1385055153	403576679576375296	f	toastmonsternyc
whoever threw out @c__sull 's toastmonster sammie, please don't do it again.	1384559366	401497199818711040	f	toastmonsternyc
@c__sull . It's true. #true #kaitrue	1384535123	401395515193303040	f	toastmonsternyc
RT @alneuhauser: .@toastmonsternyc to transform into Kaiju next week, serve Japanese rice balls &amp; bowls instead of sandwiches http://t.co/1...	1384533727	401389662671212544	f	toastmonsternyc
Herro 50th and 6th, New York. Today is Toast Monster's last day of the year. Stay toastie! Keep it breezy! Rawr!	1384529054	401370061837201408	f	toastmonsternyc
Last week for Toast Monster 50th and 6th. It's been toasty.	1384442434	401006753124737024	f	toastmonsternyc
Rawr! 47th and Park.	1384362059	400669632513593344	f	toastmonsternyc
Toast Monster spotted somewhere in Midtown. #midtown #lunch #toastmonster	1384358200	400653448120508418	f	toastmonsternyc
50th and 6th, find Toast Monster making new friends in front of chase bank.	1383921298	398820947849129985	f	toastmonsternyc
Hello FIDI peeps, lunch 2day @ 7 Hanover sq b/t water st &amp; pearl. Burger of the week THE MARITAL BLIS preorder 9172929226	1390575326	426729964994842624	f	fritesnmeats
@larsericsson braving the cold!! We r not going anywhere :) #soholove	1390494753	426392017820999680	f	fritesnmeats
Hello soho peeps, lunch 2day @ Hudson &amp; king. Burger of the week THE MARITAL BLISS preorder 9172929226	1390489337	426369299604058112	f	fritesnmeats
Soho Peeps, due to the weather we r off the road 2day:( BUT we will be there tomo:)	1390405367	426017106103369728	f	fritesnmeats
@GenFranklnKirby sorry bud, due to the weather we r off the road today	1390405272	426016705018875904	f	fritesnmeats
Hello FIDI, lunch 2day @ 7 Hanover sq b/t water st &amp; pearl. Burger of the week THE SMITHLAND  preorder 9172929226	1389971462	424197177536417792	f	fritesnmeats
Hello wfc peeps. Lunch 2day @ wfc food truck lot on north end &amp; vesey st. Burger of the week THE SMITHLAND preorder 9172929226	1389885930	423838429294895104	f	fritesnmeats
RT @DispatchBP: . @BrookfieldPLNY NORTH Lot | Thursday, 1/16, 11a-3pm | North End Ave. &amp; Vesey St. | @FritesnMeats @PalenqueFood @MilkTruck...	1389885829	423838006337085440	f	fritesnmeats
Hello soho. Lunch 2day @ Hudson &amp; king. Burger of the week THE SMITHLAND preorder 9172929226	1389799101	423474240328048640	f	fritesnmeats
@DJvinSANITY sorry guys. We will be there on Friday	1389723828	423158521962975232	f	fritesnmeats
FIDI peeps, we r off the road 2day:(	1389713996	423117283826085889	f	fritesnmeats
Hello midtown peeps, lunch 2day @ 50th st b/t 6th &amp; 7th av. Burger of the week THE SMITHLAND preorder. 9172929226	1389625416	422745754055479296	f	fritesnmeats
RT @AquariusGiants1: @fritesnmeats \nHappy New Year to my favorite food truck!	1389380856	421719993215381504	f	fritesnmeats
@AquariusGiants1 aww thx, happy new year:)	1389380848	421719960369778688	f	fritesnmeats
Hello FIDI peeps, lunch 2day @ 7 Hanover sq b/t water st &amp; pearl st. burger of the week THE PLOUGHMAN preorder 9172929226	1389366613	421660256306225152	f	fritesnmeats
Hello peeps, lunch 2day @ the wfc food truck lot @ north end &amp; vesey st. Burger of the week THE PLOUGHMAN preorder 9172929226	1389279822	421296226118942720	f	fritesnmeats
Hello soho! We r back @ Hudson &amp; king. Burger of the week THE PLOUGHMAN preorder 9172929226	1389192616	420930459200421888	f	fritesnmeats
Peeps, we r off the road today	1389109113	420580220710973442	f	fritesnmeats
Hello midtown peeps, lunch 2day. @ 50th st b/t 6th &amp; 7th av. Burger of the week THE PLOUGHMAN preorder 9172929226	1389019441	420204112089993216	f	fritesnmeats
FIDI Peeps due to the snow we will be off the road today	1388764571	419135108541472768	f	fritesnmeats
@CostumeContume no truck today! We wish we could, but our pipes &amp; water tanks on the truck are frozen! Hope to be back soon!	1390580885	426753282124824576	f	thetreatstruck
Wed, Jan 22nd, no truck today because of the cold! We'll see you all soon! Have a great day, and keep warm!!!	1390404870	426015022385758208	f	thetreatstruck
...we deliver, too! Call or email if you'd like treats brought to your door!!!	1390331811	425708588863336448	f	thetreatstruck
Snow day!!! We're not sure if we'll be able to take our truck out this week because of the snow &amp; cold, so we'll let you know!	1390331710	425708165536415744	f	thetreatstruck
Martin Luther King Jr. Day! No truck today; Our shop open 7:30am-8pm w/food &amp; treats! 521 Court St #Brooklyn Have a great day!!!	1390225159	425261256820678656	f	thetreatstruck
No truck this weekend! Our shop warm and cozy w/grilled cheese, soup, hot choc, treats!!! 521 Court st #brooklyn  Sat 8am-7pm!!!	1390056357	424553251594575873	f	thetreatstruck
Lots of specials today! (though all treats are special...) Peanut Butter Brownies, Espresso Brownies, Kitchen Sink Crispys!!!	1389977993	424224568157671425	f	thetreatstruck
!!! Fri, Jan 17th 12-3:30 45th &amp; 6th, then 4:30-7pm 18th st &amp; 7th ave!!!	1389972635	424202094556770305	f	thetreatstruck
Headed to the UWS this afternoon! First Columbus &amp; 91st around 2:30-3:30, then Bway (86 &amp; 87th) 4-7pm!!!	1389880709	423816530816950272	f	thetreatstruck
!!! Wed,Jan 15th 11:30-3:30 45th &amp; 6th Ave, then 4:30-7pm 18th st &amp; 7th ave!!!	1389797670	423468238790725632	f	thetreatstruck
This week our truck will be at our spots Wed, Thurs &amp; Fri! Hope to see you then!!!	1389624098	422740226579365888	f	thetreatstruck
Happy Sunday! Our shop open 8am-6pm w/food &amp; treeeats &amp; gingerbread houses! Gingerbread in January, yes...!!! (no truck today!)	1389534596	422364824929337344	f	thetreatstruck
!!! Happy weekend, everyone! No truck this weekend. Our shop open Sat 8am-7pm &amp; Sun 8am-6pm!!!	1389451432	422016012209254400	f	thetreatstruck
Decided to close early today, but we'll be back on 18th &amp; 7th next Wednesday!	1389388739	421753058503450624	f	thetreatstruck
Opening late on 18th &amp; 7th! Still circling for our spot	1389388371	421751513858703360	f	thetreatstruck
!!! Fri, Jan 10th 12-3:30 45th &amp; 6th, then 4-6 or 7pm (we'll see how the weather holds up &amp; let you know!) at 18th &amp; 7th ave!	1389367963	421665918213980160	f	thetreatstruck
Friday Jan 10th...fixing a busted water pipe on our truck! As soon as we can, we'll head to our spot &amp; let you know!	1389361746	421639842561536000	f	thetreatstruck
!!! Thurs, Jan 9th 12-3:30 Columbus &amp; 91st st, then 4-7pm Bway (86 &amp; 87th)!!!	1389286197	421322967550013440	f	thetreatstruck
Headed to the UWS today!!!	1389274784	421275096943431680	f	thetreatstruck
Wed, Jan 8th still too cold for the truck, so we'll wait 'til tomorrow! Our shop open today 7:30am-8pm! 521 Court st, Brooklyn	1389186356	420904201708126208	f	thetreatstruck
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
Put in your Super Bowl orders now! Heros, rice balls, toasted ravilois, caprese salads, and more!\n\nWe'll make... http://t.co/vFggN7JZkq	1390602115	426842325826822144	f	disosnyc
Get your fill before the weekend.. Wall and water st\n\nCall in ur order: 917-756-4145	1390582610	426760517680918528	f	disosnyc
Disos located on wall and water st today. Please call in any large orders early for pick up..\n\nCall it in : 917-756-4145	1390574172	426725123320979456	f	disosnyc
Open for lunch.. 47 bet park and lex \n\nCall ins: 917-756-4145	1390492397	426382135973650433	f	disosnyc
We're back! 47th bet Park and Lexington ave.. \n\nCall in orders: 917-756-4145	1390485430	426352912676442112	f	disosnyc
Disos is snowed in and off today.. See you back on the streets tomorrow!	1390405713	426018557218918401	f	disosnyc
Delivery? Sure why not.. 3 block radius from 48 bet 6 and 7 ave. \n\nMin order $100. \n\nCall it in: 917-756-4145	1390318115	425651144774664192	f	disosnyc
Snowed in on 48th bet 6 and 7 ave.\n\nCall your order in for pick up: 917-756-4145	1390316766	425645486117494785	f	disosnyc
We are OFF the street today back Tom.\n\nTues: 48th bet 6 and 7 ave\nWed: soho, varick and charlton\nThursday: 47 and... http://t.co/NO88YiST6p	1390233261	425295239817859072	f	disosnyc
Are people working Monday (holiday)? We're taking a census wether to go out or not. \n\nPlease hit LIKE if you are... http://t.co/osPpCfR8zG	1390009055	424354851397451776	f	disosnyc
It's Friday, and you know the drill.. \n\nLocation: wall and water st\n\nOpen time: 11am\n\nCall in number: 917-756-4145	1389967680	424181312581550080	f	disosnyc
Come meet us on 47th bet Park and Lexington ave for lunch.\n\nCall in your order at: 917-756-4145	1389880164	423814243436085248	f	disosnyc
Soho varick and charlton for lunch.\n\nCall in your order: 917-756-4145	1389802235	423487386887012352	f	disosnyc
The society is now open. \n\n48th between 6 and 7 ave\n\nCall in preorders for pick up: 917-756-4145	1389712719	423111930161557505	f	disosnyc
Lefty louie, Joey shakes, or Mickey scars??\n\nCome to 48th bet 6th and 7th ave today. We're having a sit down... http://t.co/TEMBDAmZ6z	1389706461	423085680164470784	f	disosnyc
Schedule for the week:\n\nTues: 48th bet 6 and 7 ave\nWed: soho, varick and charlton corner\nThursday: 47th bet Park... http://t.co/CFwZCKNZhh	1389662412	422900926018367488	f	disosnyc
We want to thank each and every member of the society who has gotten us this far. We are now at 698 followers on... http://t.co/ea4KbfSTnP	1389655850	422873401045172224	f	disosnyc
Disos open for lunch.. Catch us on 47th st bet park and lex ave\n\nCall in your order for pick up: 917-756-4145	1389629000	422760783932436481	f	disosnyc
Rustic, Ciabatta, or Focaccia, What's your bread??\n\n47th bet Park and Lexington Ave today.\n\nCall in your order for pick up: 917-756-4145	1389620088	422723404706230273	f	disosnyc
Wall and water st today.. We have coverage for the rain no worries..\n\nCall your order in for pick ups: 917-756-4145	1389368157	421666730356662272	f	disosnyc
#Seahawks vs #Broncos who are you rooting for? #NuchasSuperFan http://t.co/HbdbesqzB4	1390606285	426859815277965313	f	nuchasnyc
@mayamcar @CityGirl940 best of luck! Thanks for entering	1390598438	426826903040032768	f	nuchasnyc
Planning on throwing a #SuperBowl party? Enter our #NuchasSuperFan contest and you could win food for your #fiesta http://t.co/HbdbesqzB4	1390594536	426810537528541186	f	nuchasnyc
Whos up for Nuchas and a movie? http://t.co/YHcyILOr03	1390590002	426791519748902912	f	nuchasnyc
#warm #empanadas to fill up your belly on 50th &amp; 6th.  #keepwarm	1390584322	426767697955655680	f	nuchasnyc
#NuchasSuperFan contest is still going on! Enter here and show us your fandom! http://t.co/HbdbesqzB4 #Superbowl #empanadas #NYC #foodtruck	1390581990	426757914343518208	f	nuchasnyc
Hey #NuchasSuperFan 's you have ONE WEEK  to enter our contest! What are you waiting for? http://t.co/HbdbesqzB4  #handheldfoods #SuperBowl	1390515021	426477027404054529	f	nuchasnyc
Did you know we're having a contest? Become a #NuchasSuperFan here http://t.co/HbdbesqzB4	1390510214	426456866747850752	f	nuchasnyc
Calling all #NuchasSuperFan's we're having a contest and think you should enter it! Here's the link! http://t.co/HbdbesqzB4	1390505502	426437102952542208	f	nuchasnyc
We caught this Minion causing trouble at our Times Square kiosk! \n\nPhoto via Melody C. on Foursquare http://t.co/ldh84sBJVK	1390505400	426436675825582081	f	nuchasnyc
Show your #Superbowl fandom by entering our #NuchasSuperFan contest! http://t.co/HbdbesqzB4 #empanadas #handheldfoods #NYC #football	1390495554	426395376875503616	f	nuchasnyc
Have you entered our #NuchasSuperFan contest? If you haven't then follow the link here http://t.co/HbdbesqzB4 #empanadas #Superbowl	1390439734	426161249278509056	f	nuchasnyc
Let us cater your #Superbowl Party! Enter our #NuchasSuperFan contest now! http://t.co/HbdbesqzB4	1390433129	426133547305664512	f	nuchasnyc
Are you a #NuchasSuperFan? Show us by entering our contest! http://t.co/HbdbesqzB4 #Superbowl #NYC #empanadas	1390426540	426105911623831552	f	nuchasnyc
The #Superbowl is only a few days away, do you have your party food? Enter our #NuchasSuperFan contest http://t.co/HbdbesqzB4 and get food!	1390421768	426085896145084416	f	nuchasnyc
A sneak peek in to our oven as we bake fresh #medialunas! http://t.co/BJwsu8aiaI	1390420738	426081574904684545	f	nuchasnyc
Help us help you! Enter our #NuchasSuperFan contest and you could win a catered #SuperBowl fiesta on us! http://t.co/HbdbesqzB4	1390414838	426056828418797568	f	nuchasnyc
#crazyweather out!, so we stayed in! All Nuchas location are closed. Hasta Manana &amp; stay warm! #buenasnuchas	1390413765	426052328370606080	f	nuchasnyc
Is your favorite team playing in the #Superbowl? Celebrate by entering #NuchasSuperFan contest and get free food! http://t.co/HbdbesqzB4	1390403444	426009039198511104	f	nuchasnyc
Do you love #empanadas and #football? Enter our #NuchasSuperFan contest and win a catered party on us! http://t.co/HbdbesqzB4 #SuperBowl	1390346718	425771112510021632	f	nuchasnyc
Bobjo express open at 47 st&amp; park ave today. \nThanks!	1390581102	426754190086377473	f	bobjotruck
Still freezing ny! But happy friday!\nBobjo truck open at varick st &amp; king st today. Try our rice platter and hot ramen noodle soup.\nTry!\nThk	1390581055	426753991872364544	f	bobjotruck
Bobjo express stay at water st. and  Hanover sq. THANK YOU!	1390494982	426392977670676480	f	bobjotruck
No truck today. We'll be back soon!	1389710082	423100867139497984	f	kimchitruck
Hello flatiron! Bobjo truck open at 22nd and 5th ave. We have hot ramen noodle soup : it'll make you warm. :) thank you	1390494743	426391976133816320	f	bobjotruck
BOBJO express open at 47st and park ave. thank you.	1390409988	426036485692076033	f	bobjotruck
Hello New York .  BOBJO truck open at varick st and king st today. Try our hot ramen noodle soup!\nThanks!	1390409164	426033032689377281	f	bobjotruck
Freezing, ny!\nBobjo truck open at Water &amp; Hanover sq today! We server hot ramen noodle soup.\nTry our soup! It's will make u warm today!\nThk!	1390322677	425670276551278592	f	bobjotruck
Hello, flatiron!\nBobjo truck open at 5th ave and 22st today!\nTry our rice platter and ramen noodle soup. It's will make u warm.\nThanks!	1390235742	425305644804345857	f	bobjotruck
Hello new york happy friday!  Bobjo truck open varick and king st. Try our ramen noodle soup!  Bob jo express open  @ 47st and park.	1389977732	424223474509307904	f	bobjotruck
Bobjo express stay at water and hanover sq.	1389897032	423884993992331266	f	bobjotruck
Bobjo truck open at 22st &amp; 5th ave today!\nSorry late update.\nThanks!	1389896893	423884411764240384	f	bobjotruck
Bobjo truck at Varick and king st today!	1389806254	423504243182804993	f	bobjotruck
Bobjo express stay at 47 st and park.\nTry our platter and ramen!\nThanks!	1389804678	423497631235858433	f	bobjotruck
Beautiful sunny day!\nBobjo truck open at vrick st &amp; king st today!\nTry our rice platter and ramen noodle soup.\nThanks ny!	1389804607	423497335189295104	f	bobjotruck
Bobjo express will stay at State st &amp; Whitehall st. Thanks!	1389719030	423138397595922433	f	bobjotruck
Hello New york!! We r open 46st.  Beween 5th and 6th ave.  Bobjo express open at  state st &amp; Whitehall st . Try our ramen noodle soup!!Thax!	1389630966	422769029783494656	f	bobjotruck
Bobjo express open at 47 &amp; park ave today!	1389370888	421678184565080064	f	bobjotruck
Raining ny,But happy friday!\nBobjo truck located in Varick &amp; king st today. \nWe server hot ramen noodle soup! Try and make u warm and happy.	1389370814	421677874455003136	f	bobjotruck
Bobjo express at hanover sq and water st today#	1389285333	421319341951680512	f	bobjotruck
Hello, flatiron!\nBobjo truck open at 22st &amp; 5th ave today.\nTry our ramen noodle soup! Its will make u warm and happy!\nThanks!	1389285294	421319177585303552	f	bobjotruck
Yes, we are back to you--CU. http://t.co/kgsBpzzSdS	1390511671	426462977236434946	f	shanghaisogo
RT @KingsDreamer: @shanghaisogo Be safe!!!	1390505856	426438586289111040	f	shanghaisogo
Yeah! We are back! Come out &amp; Beat the cold with us. Shanghai Sogo is serving you lunch @46th st &amp; 5~6 ave,12~3pm. See u all later.	1390503202	426427456720216064	f	shanghaisogo
Sorry! NYC. we won't be back on the street today.	1390401530	426001010960924672	f	shanghaisogo
Good morning We're off the road due to the snow.	1390313768	425632910948196353	f	shanghaisogo
We take a day off the road. Will be out tomorrow. Have a safe holiday.	1390231129	425286296450646016	f	shanghaisogo
RT @CierraPrincess: Happy Martin Luther King Jr. Day. http://t.co/MTTnhpnd0l	1390230425	425283346613432320	f	shanghaisogo
RT @coach_Doyle: Martin Luther King had many great quotes. This is my favorite.\n#MLKDay #impact #legacy http://t.co/O0QVDXmKfh	1390230385	425283178396663808	f	shanghaisogo
RT @CarterWisdom: Happy Martin Luther King day everybody. Reflect on what greatness a dream truly can become... http://t.co/bSBiyOWZkt	1390230349	425283027703726080	f	shanghaisogo
RT @grubstreet: Seinfeld was filming a Super Bowl commercial at Tom's Restaurant: http://t.co/dcGaX8OvJG	1389983319	424246906551013377	f	shanghaisogo
Enjoy the sunshine with Shanghai Sogo. It is beautiful Friday, you can feel the spring in the air. http://t.co/LOYpr3OKDc	1389983109	424246028301500416	f	shanghaisogo
RT @VendorPower: Archana Dittakavi speaking about need to abolish the #NYPD Peddler Squad @UJC_PROP event @UJCSexWorkers @changethenypd @Bi...	1389977737	424223495724490752	f	shanghaisogo
RT @USAFoodTruck: TGIF?  TGTYDDISC - thank god that Yankee Doodle dandys is serving chicken.  We're at 47th and Madison today.  Come and ge...	1389977724	424223440879755264	f	shanghaisogo
Friday Lunch Time!!! FLATIRON, Shanghai Sogo is @ 22nd st &amp; 5th ave. until 3:30pm&gt;&gt;SOGO FOR IT &lt;&lt;......	1389977635	424223067825782784	f	shanghaisogo
shanghai SOGO will serve ur lunch @ 22nd st &amp; 5th ave. 11am~3pm. See you all later SOGO FOR IT!!	1389971549	424197538330472448	f	shanghaisogo
WILLIAMSBURG! we are here to serve your dinner from 5~8pm at Metropolitan &amp; Bedford! Free soup samples available! http://t.co/g6ZQzEk2Ox	1389911173	423944305842335744	f	shanghaisogo
Sesame Sandwich &amp; "Grilled Enoki Mushroom" with vegan oyster sauce! That is my health lunch today. HaHaHa,.. http://t.co/NpEVwhwx0D	1389899528	423895461200932864	f	shanghaisogo
RT @MitchSimon: @shanghaisogo how am I just learning about you? You need to come to 53/Park corner! Everything on the menu sounds amazing!	1389898088	423889422174932992	f	shanghaisogo
@MitchSimon love to come &amp; see ya all there one day.	1389898083	423889403002753024	f	shanghaisogo
Lunch time! Try our mouthwatering Asian Tapas @47&amp;park ave. "MEAL DEAL"{any$6 item+sesame sandwich w.hibachi chicken+free drink} only $12	1389891216	423860597328199680	f	shanghaisogo
Good Morning Donut People we are at 55th and Broadway until 5pm today!  Come see us!	1390572431	426717821502889986	f	carpedonutnyc
We're back on 51st and Park and ready for business. Open 'till 5:30 pm!	1390483063	426342987640356864	f	carpedonutnyc
Another lovely day for donuts at Bergen and Court streets. Open 'till 4:00.	1390136573	424889701284458496	f	carpedonutnyc
Now open at court and Bergen until 4:30pm	1390049949	424526375002050560	f	carpedonutnyc
@baileymichelle Thanks! We couldn't agree with you any more.	1389981650	424239907729850368	f	carpedonutnyc
@TreppWire We meant to set up there this week! But boy has it been difficult finding an open spot. #foodtruckproblems	1389981592	424239665437474816	f	carpedonutnyc
Now open at 55th and Broadway. Come check out the party! #foodtruckMecca	1389963771	424164916300218368	f	carpedonutnyc
@mactruckny I'm thinking about making the worlds first Mac-and-cheese donut sandwich later... #FoodTruckLove	1389878096	423805571104784384	f	carpedonutnyc
Now open at 55th and Broadway!	1389877941	423804921394511872	f	carpedonutnyc
23rd and Park today. Come and get em!	1389790932	423439975984926720	f	carpedonutnyc
@eminencess Thanks! Stop by any time	1389531482	422351767699857408	f	carpedonutnyc
Donuts at Court and Bergen today until 4:30!	1389531368	422351285900550144	f	carpedonutnyc
Court and Bergen today! #seizeyourdonut	1389448123	422002133643563008	f	carpedonutnyc
Friday donuts at 51st and Park!	1389358578	421626554247290880	f	carpedonutnyc
55th and Broadway, donuts all day!	1389272464	421265363347980288	f	carpedonutnyc
23rd and Park! Little known fact: eating donuts slows the #articvortex	1389188663	420913880047828992	f	carpedonutnyc
A record cold day calls for a record delicious donut! Come get yours at Court and Bergen	1388846524	419478845042200576	f	carpedonutnyc
51st and Park today. Last chance for donuts in 2013!	1388408422	417641308631867392	f	carpedonutnyc
@jessbesack this post is too good.	1390594590	426810764792705024	f	mexicoblvd
RT @jessbesack: Free idea: milk chapstick for when your lips are burning because of extra spicy tacos from @MexicoBlvd	1390594565	426810660627169280	f	mexicoblvd
We are here, midtown! Pick up your lunch on 46th St btwn 6th&amp;7th Avenues. Pre order your lunch via our website http://t.co/aAbStQP4UO :)	1390580744	426752688299458561	f	mexicoblvd
We are at 46th btw. 6th &amp; 7th! The battle of the cold vs. taco crave	1390580033	426749705562120192	f	mexicoblvd
RT @YelpQueens: #FFx2 @HornBlowerNY @MezzePlace @ONeillsQueens @TezLaRoe @KadieBlackstein @NCFAC @IamMCJin @MexicoBlvd @WeHeartAstoria @LIC...	1390578117	426741670450069504	f	mexicoblvd
RT @nycfoodtruck: I would eat here everyday if I could. #mexicanfood #foodtruck RT @MexicoBlvd: We are on #Yelp ! http://t.co/NVH05HhyPB	1390504462	426432740045914112	f	mexicoblvd
Sorry for the short lunch today, DUMBO! We will be back next week, friends! #gimmetacos #xxxspicy #pleaseee	1390500937	426417955212378112	f	mexicoblvd
RT @dumbolot: Welcome back @ToumNYC and @MexicoBlvd in the lot today!	1390495657	426395810142879744	f	mexicoblvd
No truck today guys :( lot closed down at the WFC	1390408350	426029617053716480	f	mexicoblvd
@stellarball yes we are! 46th between 6th &amp; 7th every Tuesday &amp; Friday	1390408318	426029482370412544	f	mexicoblvd
20 minutes per block #nyc #gridlock at its best. Bronx bound we will arrive tomorrow at noon.	1390338278	425735715235061762	f	mexicoblvd
Let it snow...tacos http://t.co/X3YV8LA2TA	1390328532	425694834750664704	f	mexicoblvd
Preorder your lunch!! http://t.co/aAbStQP4UO	1390324448	425677707784224768	f	mexicoblvd
THE SNOW WON'T STOP US, MIDTOWN! Preorder: http://t.co/EIrGC8j9wt Pickup: 46th St btwn 6th &amp; 7th Avenues #limes #horchata #ignorethecold	1390319295	425656091322875904	f	mexicoblvd
RT @pluckypea: mexicoblvd is in the house tonight for our Monday Night League Orientation!! @ The Royal Palms... http://t.co/TDDFr9Us4X	1390270446	425451204957990912	f	mexicoblvd
RT @RoyalPalmsClub: @MexicoBlvd is in the house tonight for our Monday Night League Orientation!! http://t.co/cnDilTypEn	1390253730	425381094058635265	f	mexicoblvd
Have you ever wanted to enjoy our food inside? Or with a fully stocked bar next to us perhaps? WELL TONIGHT IS YOUR CHANCE! Stay tuned...	1390236582	425309168007139328	f	mexicoblvd
Hola Brooklyn :) Come stuff your face with delicious food in the @dumbolot on Jay &amp; Water St this fine afternoon! We will be there til 2:30!	1390232989	425294099013705728	f	mexicoblvd
RT @YelpQueens: @mexicoblvd (@ Mexico Blvd) on #Yelp http://t.co/NMaMY2yXEK	1390007995	424350404831621120	f	mexicoblvd
Midtown!!!! 46th street between 6th &amp; 7th avenues :)	1389981566	424239553919340544	f	mexicoblvd
@mcvities11 a fine combination if we've ever heard it.	1390634197	426976885789040640	f	waffletruck
@BeckTheKidd us too!	1390634173	426976785855561729	f	waffletruck
@Rogueish we go to 7th &amp; Christopher every week. That ain't too far.	1390634161	426976737772068865	f	waffletruck
@numero1shithead more	1390634138	426976639877017600	f	waffletruck
@ninabot5000 wafelshake...hmmmm....	1390634126	426976589109145600	f	waffletruck
@LaryssaSmith1 a darn fine choice, we say.	1390634088	426976431386546177	f	waffletruck
@nysviolet @owen_stefania ours too! Also, New York.	1390634070	426976356488855552	f	waffletruck
It may be chilly out there but it's chili in here! Come try our Chili con Corne at our EV Cafe @ Ave B &amp; 2nd St. http://t.co/OzdRxBbK5n	1390615501	426898469480321024	f	waffletruck
Kotmadam is at Astor Pl till late! Allez!	1390606219	426859538612891648	f	waffletruck
Wafels at night!  \nLe Cafe @ Ave B &amp; 2nd St is open till 2am De Wafel Cabana @ 35th &amp; Broadway till 10p	1390606206	426859485500436480	f	waffletruck
This one never gets old!  http://t.co/LjkdfcIeOS	1390593123	426804609630220288	f	waffletruck
RT @BrooklynBased: A 35 yo man on welfare in Ghent skipped out on 100 restaurant bills &amp; was murdered &amp; you're welcome for the book idea ht...	1390589228	426788274586546178	f	waffletruck
Goesting @ Broadway &amp; 66th till 9p \nVedette @ 60th &amp; 5th till 6p \nKotmadam @ 23rd &amp; Broadway till 3p	1390582133	426758515625963520	f	waffletruck
Momma Truck is at 40th &amp; Park till 4:30	1390582120	426758459271307265	f	waffletruck
Frrrreeeezzzzing Friday\nLe Cafe @ Ave B &amp; 2nd St open till 2a \nDe Wafel Cabana @ 35th &amp; Broadway till 9p	1390582113	426758430934577152	f	waffletruck
RT @fourwheelfoodie: Forbes' Coolest Trucks http://t.co/9HRHajZdHF New York scored top spots! Congrats to @KorillaBBQ @waffletruck @ricksha...	1390577505	426739102281895937	f	waffletruck
@hamptonsmedia we shall see what we can do about that.	1390577402	426738671870820352	f	waffletruck
@EmmaRuthSmith86 you haven't visited us on 43 &amp; 6?	1390577360	426738495949123584	f	waffletruck
@Nikkiblp open now! Come on down!	1390577312	426738296644202496	f	waffletruck
@numero1shithead far too long	1390577257	426738064485273600	f	waffletruck
RT @empress718: Fridays are officially Kimchi Fridays. @KimchiTruck, I love you!	1390596076	426816998291832832	f	kimchitruck
Ultimate Polar Vortex remedy- 1 part shuffleboard, 2 parts tacos. Find us at @RoyalPalmsClub tonight 7pm to wheneves	1390583920	426766010989826048	f	kimchitruck
Bring it, Polar Vortex Redux! We'll raise you a hot spicy Mexican chix &amp; rice soup.	1390581258	426754846612389888	f	kimchitruck
We're baack &amp; we've got a spicy Mexican chicken &amp; rice soup today #Slurp'sUp  52nd St. bet. 6th &amp; 7th Ave. 11:30-2:30	1390575125	426729121721221121	f	kimchitruck
@grosalsky Good things come to those who wait :)	1390493263	426385765954625537	f	kimchitruck
Back in full force tomorrow. Hang in there, kids.	1390487538	426361753744584705	f	kimchitruck
RT @bloghill: @KimchiTruck WE LOVE YOU KIMCHI TACO!!!	1390407561	426026306837688320	f	kimchitruck
@bloghill Whoa, loving the love!!	1390407559	426026297286864896	f	kimchitruck
It's still too dangerous out there for this ole' truck. We'll see you tomorrow.	1390406863	426023381129908225	f	kimchitruck
Keeping off the snowy, snowy streets today. See y'all tomorrow!	1390314943	425637840509075456	f	kimchitruck
We're off the streets today. Happy #MLKDay	1390227753	425272138858106880	f	kimchitruck
#YouDeserveATacoFriday, 52nd St. bet. 6th &amp; 7th Ave. 11:30am - 2:30pm	1389968972	424186731101822977	f	kimchitruck
We'll take fog over rain any day. Varick St. corner of Charlton st. 11:30am - 2:30pm	1389883399	423827810537324544	f	kimchitruck
Whoa, fog city. Headed to 55th St. bet. 6th &amp; 7th Ave. 11:30am - 2:30pm	1389796101	423461660037107712	f	kimchitruck
It's a glorious day for a taco. On our way  to N. End Ave &amp; Vesey St.	1389623647	422738331919589376	f	kimchitruck
RT @BajaTacoTruck: @KimchiTruck Well done! :-)	1389364525	421651496280023040	f	kimchitruck
Snow, sleet, rain? Tucking in for the day. We'll see ya next week.	1389364039	421649460674822144	f	kimchitruck
RT @SusannaKno: Awesome tacos from @KimchiTruck at the @shapeways new year party!!!!!	1389363730	421648163154690048	f	kimchitruck
You'll have to miss us just a bit longer. We'll be back next week :)	1389277692	421287293467361280	f	kimchitruck
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
Countdown begins for #winterblast #secaucus let's go @Seahawks @Broncos @pepsi get some curry and bites	1390601562	426840005517250561	f	mausamnyc
don't let the weather stop U from yr delicious lunch. We're here47str &amp; Park ave. All plattersserved with parata &amp; samosa	1390496800	426400601677639680	f	mausamnyc
RT @NYClifeyy: Indian cuisine in New York City @mausamnyc http://t.co/gXDXzUcb3Y	1390452636	426215366713671681	f	mausamnyc
Forget this Winterblast #winterblast #secaucus is coming r u ready@Broncos @Seahawks	1390432979	426132917711306752	f	mausamnyc
RT @randomfoodtruck: Let's ignore the snow until it goes away and focus on lunch instead. @souvlakitruck @hibachiheaven @mausamnyc @DomoTac...	1390319263	425655959005200384	f	mausamnyc
Yr favourite food truckBway bet 55 &amp; 56 Str. All platter served with parata &amp; samosa. Ideal for this weather	1390313752	425632843646398464	f	mausamnyc
Join us for the #SuperBowlXLVIII  event #winterblast #exposure #secaucus #Broncos #Seahawks fans http://t.co/GwvWTSEn3r	1390265593	425430851414134784	f	mausamnyc
Mausam's vindaloo flavor is exactly what U need for this weather! Dinner is ready to be  served@location	1390252883	425377540270608384	f	mausamnyc
Happy Monday!  Curry N Bites welcome U @ Bway &amp; 67 Str next to  store. All platter comes with parata &amp; samosa	1390224756	425259569409822720	f	mausamnyc
RT @Sizzla11: @mausamnyc your chapatis were to die for!	1390003781	424332732127518720	f	mausamnyc
I was in little India today. Food music ppl aroma great experience. Highly recommend the best food I ever had downtown	1389988326	424267908760338432	f	mausamnyc
our lunchplattersare going fast make sure to get yr favourite dish	1389982613	424243944445050880	f	mausamnyc
great great great !!!! Food n serv	1389982490	424243431649443841	f	mausamnyc
HappyFridaygreat weather! Yr favourite foodtruck Curry N Bites downtown Water &amp; Broad Str. Create yr own platteryr style	1389961786	424156592586498048	f	mausamnyc
Delicious samosas and excellent mint sauce not to spicy but very tasty	1389915489	423962408504135680	f	mausamnyc
The red truck is here I'm getting the best samosa chaat ever. Clean truck great price and service nobody can beat them	1389914892	423959902160044032	f	mausamnyc
Best chicken Kati roll and palak saag	1389913195	423952785751539712	f	mausamnyc
Our dinneris hotand ready to be served. Get yr mango lassieU'll definately be back.	1389913135	423952532331700224	f	mausamnyc
don't let the cloudy day stop U. Our meals is just what U needtasty and delicious	1389890316	423856823263690752	f	mausamnyc
Hello downtownlunch @ Hanover bet Pearl &amp; Water Str. Our delicious Curry N Bites to satisfy yr taste buds any style	1389877071	423801270827098112	f	mausamnyc
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
Feeling cold NY! Stop by for a FREE HOT Moroccan Mint Tea!	1389199722	420960262040993792	f	chefsamirtruck
Is on 52nd St @ Park Ave today!	1389199637	420959906574131200	f	chefsamirtruck
We are close today for  truck maintenance!!	1389025672	420230243837018112	f	chefsamirtruck
Wow New York! What a new year!\n Way to start!\n Stay tuned for some good old fashion FREE Moroccan mint tea!	1388795955	419266740841766912	f	chefsamirtruck
May you all be happy &amp; healthy by eating the BEST COUS COUS IN TOWN! (ours!)	1388588527	418396724768415744	f	chefsamirtruck
We look forward to this 2014 to bring us all some magical time and new, happy &amp; creative ways to keep on spreading the LOVE with our food!	1388588492	418396580740231168	f	chefsamirtruck
Thank You NY for last year you've been kind to us most of the times. You've been a bit naughty too sometimes but that's part of the game!	1388588400	418396194717433856	f	chefsamirtruck
HAPPY NEW YEAR!	1388588315	418395834489659392	f	chefsamirtruck
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
Happy Friday, TacoBiters!!\nLunch being served on \n47th str \nbet Park Av/ Lexington Av\nPlace your order in advance for pick-up. \n347-70T-Bite	1389370024	421674562456399872	f	tacobite
Hate to tell everyone but we won't be back on the street until Monday due to the weather:(	1390397536	425984260244135936	f	sweetchilinyc
@mooshugrill @midtownlunch thanks guys! Your food rocks!	1389978152	424225237027545089	f	sweetchilinyc
@Temple_Pharmacy something like that.	1390716701	427322932839190529	f	waffletruck
RT @mooshugrill: Big ups to @sweetchilinyc for winning @midtownlunch's best new truck poll! (http://t.co/WxQkH3fgFA) And thx Brian, you're ...	1389977153	424221043582959617	f	sweetchilinyc
Betty is still sick:( we won't be back until a week from today. Sorry!! #keepontruckin	1389834841	423624144883036160	f	sweetchilinyc
@HdsnSqFoodTruck we can't make it today the truck broke down last night:(	1389798508	423471754779299840	f	sweetchilinyc
@SaveNYCFoodTrux @BrookfieldPLNY @ESTacoTruck we aren't coming today the truck is down:(	1389798468	423471584788365313	f	sweetchilinyc
Won't be headed out today, the truck is down for the count. Sorry!! :(	1389798269	423470749731790848	f	sweetchilinyc
RT @dumbolot: Happy Tuesday! @sweetchilinyc @KimchiTruck and @carlssteaks on jay &amp; water! @DUMBOFoodTrucks	1389715144	423122099713363968	f	sweetchilinyc
Lunch time @dumbolot Jay &amp; water till 3! http://t.co/6eJ9EWlrll	1389715077	423121820339142656	f	sweetchilinyc
Hey @dumbolot we missed you!  It may be raining but we are back today from 11-3 at Jay &amp; Water! Free coffee samples to brighten up this day!	1389702528	423069183861981184	f	sweetchilinyc
Best new truck of 2013 midtown lunch! http://t.co/XPYyPvSLOv	1389631647	422771886473625600	f	sweetchilinyc
Lunch time at Broadway btw 55 &amp; 56! Come get some! http://t.co/Zim9OKThqa	1389629895	422764539361640448	f	sweetchilinyc
#HappyMonday @midtownlunch midtown we are hanging at Broadway &amp; 56 cooking up Sweet Heat 11-3! Free coffee samples, just ask...or dance!	1389621064	422727499454631936	f	sweetchilinyc
Just posted a photo http://t.co/xvywcyyxPb	1389470410	422095610561695744	f	sweetchilinyc
Looking for chicken wings for your super bowl party?? Look no further! http://t.co/Zq82w18QxN	1389452849	422021953554481152	f	sweetchilinyc
Looking for AMAZING chicken wings for your Super Bowl party? Look no further! #chickenwings #SuperBowl #Sriracha http://t.co/9a51mafL8e	1389452540	422020659426762753	f	sweetchilinyc
@DoreneL1 sure! it will most likely be all winter long! But its only a small cup:)	1389452104	422018829862965248	f	sweetchilinyc
Today's specials! Get your sweet heat on! http://t.co/n7MPCZtRSX	1389372313	421684163658649600	f	sweetchilinyc
It's lunch time at north end and vesey till 3! Free coffee to anyone who asks for it! #thaietnamese #sriracha	1389370644	421677161972785152	f	sweetchilinyc
Back tomorrow @BrookfieldPLNY north end and vesey to make up for missing today! See you there :-) #foodtruck	1389310202	421423650617970689	f	sweetchilinyc
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
The best part of Saturday morning? Skipping it.	1390658721	427079748670726144	f	neaexpress
Sat, Jan 25th, no truck this weekend! Our shop open w/food&amp;treats&amp;hotchoc&amp; #counterculturecoffee! 8am-7pm 521 court st, Bklyn	1390659764	427084122016972800	f	thetreatstruck
For one free dinges tell us the name of Tin Tin's dog! http://t.co/fDjRoOCbAF	1390660069	427085401728118784	f	waffletruck
Come find our Kastaar truck at Winter Jam in Central Park 11am till 3pm! More details right here:\n\nhttp://t.co/N8P5qzb8lp	1390659846	427084468478701568	f	waffletruck
Kotmadam is in Williamsburg N 5th &amp; Bedford all day	1390659779	427084184318795776	f	waffletruck
Momma Truck is at 7th &amp; Carroll till 4:33pm\n\nGoesting is at Broadway &amp; 66th till 9pm\nVedette is at 60th &amp; 5th till 6pm	1390659772	427084157840154624	f	waffletruck
Saturday is here!\n\nDe Wafel Cabana at 35th &amp; Broadway open til 10pm\nLe Cafe at 15 Ave B open til 2am	1390659762	427084113539891201	f	waffletruck
#bigred is kicking it @celebrateREDHOOK today @Faiway 480 Van Brunt 11-3 #besthood #clawsup @bkflea N5 &amp; Wythe 10-6 @redhooklobster 12-8	1390661707	427092271448985600	f	lobstertruckny
The next generation of cleaner trains - http://t.co/YaAwS3Lhwu	1390662321	427094847506632705	f	neaexpress
Indoor stand at @bkflea @smorgasburg winter market, North 5th &amp; Wythe. Sandwich menu always at @houstonhallnyc	1390662044	427093685256208386	f	milktrucknyc
Bessie's at Chambers &amp; Greenwich, call (646) 504-6455 to pre-order or http://t.co/IwkqcCHPzF.	1390662043	427093684224393217	f	milktrucknyc
Good morning New York City! Come have your morning coffee with us (and maybe a wafel too!) in our East Village Cafe! http://t.co/Fe4hMy26ct	1390662025	427093605455773696	f	waffletruck
The Superbowl is coming!!! No better place to Enjoy craft beer and the big game on 13 TV's!!! 3 L... http://t.co/qan6zoyf3g @beermenus	1390665557	427108422518329345	f	shortysnyc
Chilling #celebrateredhook @fairway 480 VanBrunt till 3. #bkflea N5 &amp; Wythe till 6. at the LB @redhooklobster 12-8. #lobsterBLT #clamchowder	1390665308	427107375024447488	f	lobstertruckny
Just added Sixpoint Resin cans. http://t.co/H3BVCaxaq5	1390666029	427110401440890880	f	shortysnyc
Just added Captain Lawrence Freshchester Pale on tap. http://t.co/1L5IpItDGk	1390666027	427110391974359040	f	shortysnyc
Just added Kuka Chocolate Cheyenne Stout on tap. http://t.co/cg0mU1AR0q	1390666022	427110371611406336	f	shortysnyc
Just added SingleCut Eric More Cowbell! Milk Stout Nitro on tap. http://t.co/vqC0J1kXEG	1390665786	427109383009337344	f	shortysnyc
Just added Shipyard Monkey Fist IPA on tap. http://t.co/acWBbdlYwC	1390665766	427109296476651520	f	shortysnyc
Just added Sam Adams Rebel IPA on tap. http://t.co/VbUBecO4nL	1390665744	427109206450130944	f	shortysnyc
Channel your inner cheerleader and show us your level of fandom for Nuchas! Enter our #NuchasSuperFan contest here http://t.co/HbdbesqzB4	1390666832	427113769521909761	f	nuchasnyc
RT @mayamcar: My sis and I are the ultimate #NuchasSuperfan. Vote for Marielle @NuchasNYC @CityGirl940! http://t.co/tlzc2sdO51	1390666635	427112940291260416	f	nuchasnyc
Court and Bergen street today, brave the #arcticvortex and be rewarded with delicious donuts!	1390665978	427110186273492993	f	carpedonutnyc
@JoshGorfain We did! ...back in July last year 	1390667215	427115376254910464	f	waffletruck
@Ms__Random tomorrow 	1390666512	427112427667591169	f	waffletruck
67th and Broadway. Don't mind the Brazilian TV crew filming us today. We're getting used to the limelight, but gotta keep our egos in check	1390668462	427120605809217536	f	nautimobile
@Ahna_Banana @ABC7NY is it not always?	1390716663	427322776945319936	f	waffletruck
What better for a cold day than an ajiaco and an arepa on the side! @BrooklynFlea N5 btw Berry and Whythe http://t.co/57NDygIRK8	1390670394	427128707783086080	f	palenquefood
Beer, Bourbon, and BBQ festival is today at The Tunnel! Literally the 3 best things on earth. Now if we can just get them to add Bon Bons..	1390671437	427133083130011648	f	mexicue
Happy Saturday in front of the Apple Store till 9, broadway &amp; 67th st come by for a famous Carls CHEESESTEAK\n GOT WHIZ?	1390671200	427132090535399425	f	carlssteaks
De 2nd Street Salmon Special: it's like having a piece of art for breakfast. http://t.co/KwsrRPrbFy	1390669228	427123818701029376	f	waffletruck
Time to #muchasnuchas. You have exactly 3 days to enter and win our #NuchasSuperfan contest! http://t.co/L7iPJPlnt3	1390672773	427138685264752640	f	nuchasnyc
:-) It's THAT time of the week #ParkSlope Come n' Sogo at 7th Avenue &amp; Carroll St 11am to 4:30pm. Preorders call 484-469-7646 / 484-4NY-SOGO	1390672449	427137327744290817	f	shanghaisogo
@BrooklynFlea It's Saturday come to Brooklyn Paola 	1390673846	427143188672151553	f	palenquefood
tomato soup. turkey chili. bacon cheddar blue. mac &amp; cheese. take that, deep freeze. @bkflea, @houstonhallnyc and on truck in tribeca today.	1390675212	427148917684576257	f	milktrucknyc
#Superbowl fans of #NYC enter our #NuchasSuperFan contest! http://t.co/HbdbesqzB4 #empanadas #handheldfoods #foodtrucks	1390675843	427151562717540352	f	nuchasnyc
Creative students get grants for sustainability projects: http://t.co/NOa8BBYQvr	1390677030	427156543369662464	f	neaexpress
Great interview and wonderfully written article by reporter Przemyslaw Cebula in Nowy Dziennik (Polish Daily... http://t.co/A3fAKQwJ2Q	1390677496	427158497755922432	f	polishcuisine
Wafels bring happiness! #fact http://t.co/JRLLJkP4aE	1390676764	427155426103529472	f	waffletruck
RT @NowyDziennik: Polska karczma na kokach podbija Manhattan http://t.co/TjJxtmzaVc	1390679361	427166320720093185	f	polishcuisine
Soto Ayam, a soup to remember http://t.co/VyxhSRZ0jp	1390682575	427179800931733504	f	getstuffednow
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
@greggfly what part Gregg?	1390681738	427176289213370368	f	carlssteaks
@damaster9 section 107,223 and 311 stop by	1390681708	427176161639428096	f	carlssteaks
SOLD OUT!!!!  Come see us tomorrow.	1390680049	427169203393921024	f	carpedonutnyc
She almost ate the box! #dinges #basedonatruestory #maybe http://t.co/wJZ6jWtJoY	1390683613	427184154238005248	f	waffletruck
@JoshGorfain on the corner of ave B &amp; 2nd St in the East Village.	1390682733	427180463091097600	f	waffletruck
#NFL SUPER BOWL XLVIII  tickets on sale @ http://t.co/ieULG53ESP	1390686620	427196766266482688	f	mausamnyc
We're celebrating Super Bowl weekend with The 50 Yard Lounge, starting Thursday! Don't miss out.- http://t.co/z2KmVT9jcj	1390688413	427204284422553600	f	neaexpress
Just added Lion Stout on tap. See our full beer menu: http://t.co/qan6zoyf3g @LionBrewery #BeerMenus	1390701824	427260536242573312	f	shortysnyc
Just added Lion Stout on tap. http://t.co/WU6563ZdFR	1390701823	427260532039905280	f	shortysnyc
Hey folks nothing cooler than renting Carl's Steaks Food truck for your Super Bowl party! We can make it happen give us a call 917 597 4313	1390690008	427210975545413632	f	carlssteaks
RT @IVIich4eL: Real grilled Polish sausage in #NYC from @PolishCuisine Its not that computer made Kielbasy you buy at local super market al...	1390691016	427215202778877952	f	polishcuisine
Chocolate Chunk w/Chia Seeds &amp; Walnuts...#yum http://t.co/f0pRBRsTIa	1390699498	427250780622848000	f	thegreenradish1
@ange_cho we are closed right now for winter break, but watch our twitter.  We usually have 2-3 midtown stops per week.	1390708309	427287737583271936	f	veganlunchtruck
((( NEW LOCATION ALERT )))\n\nDisos will be on wall and water Monday, round 2!	1390691444	427216999274409984	f	disosnyc
There's only 4 days left to enter our #NuchasSuperFan contest! Winner gets a catered party for free! http://t.co/HbdbesqzB4	1390690921	427214806849167360	f	nuchasnyc
RT @bedbow: Shuffleboard, anyone? @RoyalPalmsClub now OPEN in Gowanus, with tacos by @MexicoBlvd. http://t.co/5NtW0U3RkL	1390702070	427261567672254465	f	mexicoblvd
Join us for some tacos, drinks and shuffling at the Royal Palms Shuffle board Club in #gowanus #brooklyn http://t.co/C4kkC4L7El	1390700549	427255189478072320	f	mexicoblvd
Open for business tonight, #Brooklyn! Come join us for drinks, good food, and shuffleboard at the @RoyalPalmsClub 514 Union St til 10pm :)	1390690869	427214587273183232	f	mexicoblvd
RT @jessbesack: @MexicoBlvd your tacos are too good!! Really wish milk chapstick was a thing, though.	1390690714	427213936451416064	f	mexicoblvd
@JoshGorfain sho nuf! Ave B and 2nd St	1390716780	427323264319246336	f	waffletruck
@madtrumpetsltd coincidence? we think not!	1390716760	427323183109132289	f	waffletruck
@onacasiP @Lifeisgood tru  dat.	1390716742	427323105363492865	f	waffletruck
RT @onacasiP: @Lifeisgood #Happiness is a hot wafel from @waffletruck in #NYC.  Try one  - your life will never be the same.	1390716735	427323075181674496	f	waffletruck
@passingfair or something.	1390716719	427323009137786880	f	waffletruck
@hilaryfwhite Goesting is right up on 66th and Broadway. Ain't so much of a walk.	1390716637	427322667578822657	f	waffletruck
@jeremybnyc Sundays.	1390716591	427322472774377472	f	waffletruck
@EmmaRuthSmith86 understood	1390716558	427322332730769409	f	waffletruck
@33_CoffeeNerd hope we did.	1390715280	427316972838088705	f	waffletruck
De Wafel Cabana @ 35th &amp; Broadway open till 10p\nEtttt Le Cafe @ Ave B &amp; 2nd St is open till 2am\n\nStay warm out there!	1390691251	427216191019839488	f	waffletruck
Good ol' Kotmadam is hanging tight in Williamsburg @ Bedford &amp; N 5th till midnight!	1390691237	427216132324745216	f	waffletruck
Wafels at night!\n\nMomma Truck @ 7th &amp; Christopher till 1am\nKastaar at Astor pl till 1am	1390691223	427216071943520256	f	waffletruck
RT @OneGreenPlanet: Being #Vegan has it's Perks! Like Anti-Aging Benefits! http://t.co/65M8IhgEtd #AntiAging #health	1390741280	427426024314634240	f	thegreenradish1
@DanaSaylor in manhattan most weekdays. Mon 20th and 5th, wed 23rd and park, Thur 51st and park, fri 55th and broadway. Check back here	1390742456	427430956874874882	f	carpedonutnyc
You know what they say... Cold hands + hot donut = #Happiness. Court and Bergen until 4:30pm!	1390742210	427429925055119360	f	carpedonutnyc
Very excited to be live on Fox with our friends @BarkHotDogs and @EatMeaty! Just talkin' #chilifest NBD.	1390744636	427440104307949568	f	morristruck
RT @Migakalypse: @shortysnyc just bought a shirt and ill be representing it back in California. Ill miss u guys.	1390746670	427448633618096128	f	shortysnyc
Momma Truck in Brooklyn!\nCome see us at the corner of Smith &amp; Wyckoff.  Get excited!!! http://t.co/b9plwHaHrO	1390746638	427448500922884096	f	waffletruck
CELEBRATE RED HOOK @fairway 480 Van Brunt #redhook #lobster #fun #sun-well, heated tent. \n@bkflea N5 &amp; wythe 10-6 @redhooklobster noon-7	1390748125	427454734212300800	f	lobstertruckny
Goesting is at Broadway &amp; 66th till 9pm Vedette is at 60th &amp; 5th till 6pm \nKotmadam is at Broadway &amp; 17th all day!	1390747661	427452791292846081	f	waffletruck
Kastaar is at Forest Hills at 71st Ave &amp; Continental Ave til 10pm \nMomma is at Smith &amp; Wyckoff in Brooklyn all day!	1390747644	427452719196938240	f	waffletruck
Sunday wafel Sunday!  \nDe Wafel Cabana at Herald Sq open til 9pm Le Cafe at 15 Ave B open til 11pm	1390747627	427452648191569921	f	waffletruck
It's cold outside but hot inside here at smorsgarburg! Come and try our delicious home made food! N5 &amp; Whythe http://t.co/Od8VcgrMEf	1390748436	427456041413259264	f	palenquefood
We have arrived!\nOutside The Apple Store on 67th and broadway!! Come and get it!	1390749648	427461124083425280	f	seoulfoodnyc
Stand at @bkflea @smorgasburg indoor winter market, North 5th &amp; Wythe. Sandwich menu always at @houstonhallnyc	1390748445	427456078184341506	f	milktrucknyc
Sun, Jan 26th our shop open 8am-6pm w/food &amp; treats!!!	1390749293	427459636275707904	f	thetreatstruck
Good morning NYC from Grand Army Plaza in Central Park! Come by before your stroll for a warm wafel &amp; a hot cocoa! http://t.co/SSqktkvKGK	1390750089	427462972899065857	f	waffletruck
@STONECOLDFOX we wish your bed was on 35th and Broadway.	1390750014	427462660112670720	f	waffletruck
@keykeyvictoria we'll be back one day. Probably when the weather is better.	1390749993	427462572120342528	f	waffletruck
@dsandfia a fine question. It remains to be seen at the moment.	1390749954	427462407368085504	f	waffletruck
@BonniesVoice very sorry. We'll get on it.	1390749910	427462223795978241	f	waffletruck
@jjustthoughts agreed. Such wafel.	1390749860	427462014957391873	f	waffletruck
@The_Quacker every chance.	1390749816	427461830479335424	f	waffletruck
@chelskennedy21 @keeganprosser we also demand this thing.	1390749788	427461710539018240	f	waffletruck
@alsyde223 @xoxoamymarie yes yes. Do this.	1390749725	427461445945540610	f	waffletruck
Prepping #porkbelly for @mooshugrill! Check them out at http://t.co/AI9go4ka6F! #taiwanese #wuhuarou http://t.co/Bay4kX7XXt	1390753828	427478656261185536	f	biandangnyc
LOBSTER MAC n CHEESE @celebrateREDHOOK #fairway 480 Van Brunt till 3. #besthood #represent #crustaceanelation #clawsup	1390752120	427471493321482240	f	lobstertruckny
RT @Domenickdjm: Nico says this is Adam Sobel and the Cinnamon Snail. Yes, we are all going through Snail withdrawal. http://t.co/10dByooXHJ	1390752990	427475141514502144	f	veganlunchtruck
@Domenickdjm that's actually ANAZING	1390752986	427475123990700032	f	veganlunchtruck
According to royal ordinance IV.I decreed in 1831 by King Leopold I, King of all Belgians: Sunday is WAFEL DAY! http://t.co/4wGLSuVUyC	1390752912	427474814199431168	f	waffletruck
Unlike the horrendous Chilly Fest NYC is enduring this weekend...today's #NYChiliFest promises to warm you up with the ultimate...	1390755692	427486473546637312	f	mexicue
Dessert? Great. Dessert pizza with Italian Nutella? Perfect.	1390757109	427492417248698368	f	neaexpress
A picture of me and the truckt from one of our youngest, favey fans!  The Snail &lt;3 &lt;3 &lt;3 NICO! http://t.co/eKR4401PNQ	1390757058	427492205763522560	f	veganlunchtruck
New location Monday.. Wall and Water st.	1390756744	427490886671286273	f	disosnyc
It's brunch time! Come in for a hot cocoa, WMD and de NEW and IMPROVED Chili Con Corne! http://t.co/YIWuLvpMgt	1390757408	427493671806959616	f	waffletruck
Lobster grilled cheese's are sellin' like hot cakes over here at 67th and broadway. Some would say they're the cat's pajamas.	1390758345	427497603270725632	f	nautimobile
Hey #SuperBowl fanatics! Enter our #NuchasSuperFan contest and you could win a catered fiesta on us! http://t.co/HbdbesqzB4 #empanadas	1390758338	427497571167518720	f	nuchasnyc
RT @Cursedinferno: 2 cheese steaks with onions and extra wiz. Awesome (at @CarlsSteaks) [pic]: http://t.co/ub1FaM94c2	1390760361	427506056517152768	f	carlssteaks
historic hockey game at Yankee Stadium today feeding the fans stay warm &amp; grab a piping hot cheesesteak GOT WHIZ? http://t.co/3UACDXzdQn	1390760312	427505854133592064	f	carlssteaks
Join our Nuchas eating game during the Grammys tonight. \n\nTake an empanada bite every time: \n- Camera pans to... http://t.co/bSGi3u7xfF	1390762800	427516289515814912	f	nuchasnyc
RT @fqw102: It's not even 11am and I want a cheesesteak from @shortysnyc. Now if only I could get out of bed... #hangover #hungry #cheesest...	1390763586	427519582849744896	f	shortysnyc
@MrTmomma thank YOU!!! Happy Bday, Tate! Hooray for birthdays &amp; cupcakes &amp; decorating cookies w/friends! It was so much fun!	1390764835	427524822537871360	f	thetreatstruck
One wafel, two wafel, three wafel more!\nFive wafel, six wafel, seven wafel, floor! http://t.co/8pEWl6CUYf	1390764634	427523981282119680	f	waffletruck
3 days left to enter our #NuchasSuperFan contest! Show your fandom to us by entering here http://t.co/HbdbesqzB4	1390766718	427532720349396992	f	nuchasnyc
RT @TheSteelCart: Happy Birthday lil Steel Cart! \nWe're officially one year old today. Endless thanks to our wonderful patrons... http://t....	1390769667	427545090404257793	f	nautimobile
10/10 would eat the Chili con Corne everyday (even penguins!) http://t.co/vk0coR1x7K	1390770009	427546524659499008	f	waffletruck
What's for lunch tomorrow? #TGIM	1390773405	427560766771048448	f	bigdsgrub
Here's our schedule for the week.. \n\nMonday: wall/ water st\nTuesday: 48 bet 6 and 7 ave\nWed: soho/ varick and... http://t.co/bKcCCHIsJO	1390775310	427568760409436160	f	disosnyc
One week to kickoff are you ready for some curry #winterblast #secaucus #bergen #exposure	1390774198	427564092573118464	f	mausamnyc
Serving #threecupchicken, aka #basilchicken tomorrow! #comegetsome #taiwanese # #sanbeiji #nyc http://t.co/lDDimOAKre	1390789456	427628091926532096	f	biandangnyc
Serving #threecupchicken, aka #basilchicken tomorrow! #comegetsome #taiwanese # #sanbeiji #nyc http://t.co/ks3CQhWhAj	1390789419	427627937622265856	f	biandangnyc
what's left of a tasty braise with white beans and roasted carrots. http://t.co/Kp8Jx0WVNh	1390784222	427606138654576640	f	milktrucknyc
Sorry NYC, we are in the Garden State this week for pre SuperBowl... http://t.co/9ukbdFkmP3	1390790680	427633226740297728	f	thegreenradish1
RT @GillesVanAcker: @thegreenradish1 : thanks for your time and the helpful tips! #bestfoodtruck in #NYC. Great food and great people. http...	1390776634	427574311751544832	f	thegreenradish1
RT @veganjobs: Cinnamon Snail @VeganLunchTruck is hiring full and part-time positions! Details: http://t.co/GKqz9ApRFH	1390786688	427616481711771648	f	veganlunchtruck
Become a #NuchasSuperFan by entering our contest! Win a catered #Superbowl fiesta on us! http://t.co/HbdbesqzB4	1390778134	427580603052359680	f	nuchasnyc
Don't worry about the monday blues. We're bringing in a SPECialist to take over your work day tomorrow. http://t.co/rjIL7c9T9L	1390784444	427607067634184192	f	waffletruck
For a free dinges: give us one New Year's resolution you've already given up on!	1390777262	427576947372486656	f	waffletruck
Goesting is at Broadway &amp; 66th till 9pm\nKotmadam is at Broadway &amp; 17th all day!	1390777239	427576847246053376	f	waffletruck
Kastaar is at Forest Hills at 71st Ave &amp; Continental Ave til 10pm\nMomma is at Smith &amp; Wyckoff in Brooklyn all day!	1390777239	427576847128616960	f	waffletruck
Sunday night wafels!\n\nDe Wafel Cabana at Herald Sq open til 9pm\nLe Cafe at 15 Ave B open til 11pm	1390777227	427576799766515712	f	waffletruck
Season of football with @Broncos @Seahawks #shrimps at Mausam Secaucus http://t.co/HESdQkHrJR	1390794405	427648847733866496	f	mausamnyc
It's Super Bowl week which means parking is a nightmare! Today we're on 48th n Park now til 230.	1390828899	427793527494299650	f	philssteaks
@ wall and water st.\n\nCall in orders for pick up: 917-756-4145	1390830096	427798546373283841	f	disosnyc
Is it lunch time already??\nWe are at 51st street, between Park and Madison!	1390831076	427802657798225921	f	seoulfoodnyc
Good morning! Ready to challenge the week?	1390830914	427801977276608512	f	neaexpress
Hello from Dumbo! Breakfast and Lunch on Jay &amp; Front.\nSoups: Rustic Chicken Noodle / Creamy Potato / Split Pea &amp; Ham. @DUMBOFoodTrucks	1390830861	427801756761067520	f	thesteelcart
Midtown peeps, due to a private event we will be off the road today:(	1390831596	427804840639864832	f	fritesnmeats
Hey folks 49th &amp; 6/7th ave 11-3 its like a HEAT WAVE TODAY!! Cheesesteaks for all\n@SiriusXMNFL @SIRIUSXM @Barclays @FoxNews GOT WHIZ?	1390832139	427807114640515072	f	carlssteaks
We're in our new Monday spot at the Dumbo lot on Water &amp; Jay, but don't worry we'll still be there on Thursday's as well! #LebaneseLunch	1390832330	427807916238716928	f	toumnyc
RT @nycfoodtruck: Who says food trucks aren't classy?! @BigDsGrub served guests at this #belvederemansion refined soiree just last wk! http...	1390832982	427810653471252480	f	bigdsgrub
Come n' Grub today at 50th Street btwn 6th and 7th Avenue, 11am to 2:30pm. Preorders call 646-543-BIGD	1390832424	427808312621821952	f	bigdsgrub
Food Truck Court closed today. Till the digits climb again, we'll be missing you.	1390833144	427811332461588480	f	kimchitruck
49th and 6th today for lunch! Come by for a free kimchi fried rice upgrade on bowls and burritos!	1390834086	427815283135221761	f	domotaco
#threecupchicken aka #basilchicken aka #sanbeiji today at 53rd/park from 11:30-2:30 for $6!!!	1390834370	427816474539864064	f	biandangnyc
53rd and park!!! who's got the mondays?!? remember, we have the #basilchicken #threecupchicken #sanbeiji special today for... $6!	1390834202	427815771113148416	f	biandangnyc
G1- 5th ave/20\nG2- Broadway/55\n#ComeToTheCheeseYo	1390834444	427816785526919168	f	gcnyc1
Our #lobstermen r off today! b the star of ur #superbowl party w/ DIY #LOBSTERroll kit, 8 rolls=$125, bringing #superbowl food up a notch	1390834528	427817134761463808	f	lobstertruckny
Happy Monday - we are on 47th b/w Park and Lex today -	1390834601	427817442120040448	f	polishcuisine
Morning guys. #schnitztruck will be on Varick and Charlton from 11:30-2pm. Hope to see you guys there.	1390835360	427820625324150784	f	schnitznthings
Off the streets today, sorry folks! But hey, on the bright side, @gladysnybk is open for dinner! #youcanstilleatwell	1390835445	427820984830136320	f	morristruck
Catch us at @dumbolot on Jay &amp; Water today! No #stickycrabrice today but we got a limited edition #srirachafriedrice for ya:D	1390835698	427822042831151105	f	mooshugrill
Bessie back at @Columbia, call (646) 504-6455 to pre-order or http://t.co/IwkqcCHPzF. Sandwich menu always @houstonhallnyc	1390834846	427818471817097220	f	milktrucknyc
@JJNYCBK Agree. But they closed the lot, so what can ya do?	1390835586	427821573945307136	f	kimchitruck
Feels like summer is just around the corner! Yet it's only 38 degrees today	1390836572	427825709047111681	f	bigdsgrub
We are back! Broadway btw 55 &amp; 56 11-3!  We missed you!!	1390836301	427824573246341120	f	sweetchilinyc
Sorry folks @ WFC, can't make it today. :( See you soon!	1390837355	427828995846316032	f	mamuthainoodle
@Chris_Quartly Hi Chris! Our truck is at the mechanic getting some TLC. Can't go out today :( hope to see you next week!	1390837210	427828387709984769	f	mamuthainoodle
RT @dumbolot: We got @ToumNYC in the lot to kick off Monday along with @MexicoBlvd and @mooshugrill!	1390837996	427831681140011009	f	toumnyc
It's almost lunch time - find us on 47th b/w Park &amp; Lex for the real Polish deal! @midtownlunch @nystfood @nycfoodtruck	1390838175	427832434290618368	f	polishcuisine
NEW LOCATION TODAY.. Wall and water st.\n\nCall your order for pick up: 917-756-4145	1390837752	427830658858516480	f	disosnyc
Kotmadam is at Broadway &amp; 23rd all day! Pagadder is at Brooklyn Bridge/City Hall Park till 5pm	1390838257	427832778659360768	f	waffletruck
Goesting is at Broadway &amp; 66th till 9pm Vedette is at 60th &amp; 5th till 6pm	1390838248	427832739975290880	f	waffletruck
Kastaar is at NYU Stern on W 4th &amp; Greene till 10pm	1390838238	427832696853630976	f	waffletruck
Monday!  \nDe Wafel Cabana at Herald Sq open til 9pm Le Cafe at 15 Ave B open til 11pm	1390838225	427832644974297089	f	waffletruck
Only 2 days left to enter our #NuchasSuperFan contest! Hurry up! http://t.co/HbdbesqzB4 #empanadas #handheldfoods #NYC #SuperBowl	1390838581	427834137031213056	f	nuchasnyc
116th &amp; Amsterdam here all day come get some!	1390839500	427837991311405056	f	korillabbq
It's WAY too nice out to stay in today. Let's Grub at 50th Street btwn 6th and 7th Avenue, now till' 2:30pm. Preorders call 646-543-BIGD	1390840151	427840720918302720	f	bigdsgrub
On Tues, our truck will be open. We miss our regulars! The cold weather cut back our days, but soon we'll add them all back!	1390839644	427838593655390208	f	thetreatstruck
For a free dinges: tell us your favorite performance at the Grammy's yesterday	1390839475	427837886889615361	f	waffletruck
we are open from 11:20 - 2:30 on 47th b/w Park and Lex with Smokin' grilled kielbasa and our signature pierogi! #pierogitime #letsdothis	1390840218	427841002368667648	f	polishcuisine
Bobjo express will open at State st &amp; whitehall st today! Try our Bi-bim-bowl and vege tumbling. \nThanks!	1390840630	427842728282832896	f	bobjotruck
Hello, flatiron! Bobjo truck open at 5th ave &amp; 22st today. Try our rice platter and ramen noodle soup.  Thanks and see u!	1390840509	427842223393492992	f	bobjotruck
Paprika-infused sausage? Our attack against the January frost.	1390841762	427847478009147392	f	neaexpress
we spread #LOBSTERLOVE. like us on FB &amp; sign up 4 emails http://t.co/JRG1Oh8Nes 2 win FREE HOOK-UP (lobsterroll-chips-drink) drawing friday	1390841764	427847488390041600	f	lobstertruckny
45th and 6th!	1390842720	427851495741358081	f	mexicue
RT @Cheap_eats: BKLYN IN THE HOUSE!! @dumbolot: We got @ToumNYC in the lot to kick off Monday along with @MexicoBlvd and @mooshugrill!	1390842907	427852281779089408	f	mexicoblvd
We are on old slip at the corner of water st!!	1390842818	427851905780707328	f	chefsamirtruck
nice day yay! come celebrate it. we're @columbia on amsterdam/117th. call ahead 6465046455 or http://t.co/IwkqcCHPzF.	1390843474	427854658271342592	f	milktrucknyc
@cammcm good luck!	1390843222	427853600208203776	f	burgersandbites
RT @cammcm: @burgersandbites Can my Super Bowl dreams get a #RT  http://t.co/XUwm2u53nK	1390843210	427853549549395968	f	burgersandbites
@HenryWilliams74 we will hopefully see you this Wednesday! They keep shutting down the lot on us :(	1390843077	427852991870562304	f	mexicoblvd
Tell the truth now, how many other than our friend @mjsmith4700 knew that today is Chocolate Cake Day, &amp; to that we say YUM!!!	1390845226	427862006884888576	f	sweeterynyc
Hey @SashaLamb, we aren't sure, but you'll be the first to know when we're back!	1390844942	427860817745559552	f	milktrucknyc
RT @lch142: @milktrucknyc @Columbia @houstonhallnyc @SlamHenderson i could go for a grilled cheese today and some tomato soup	1390844796	427860205507215361	f	milktrucknyc
Yeees!! Ask for your free hot mint tea with rose water	1390845951	427865046128287744	f	chefsamirtruck
http://t.co/4DPFdAwvzY	1390846693	427868159576932352	f	hibachiheaven
http://t.co/1b7XsbPyQR	1390846960	427869282211745792	f	shanghaisogo
Only 1 &amp; already a foodie. Thx Avery for letting us cater your Dol. Is this cutie rocking her hanbok or what?! http://t.co/RrnTkIFMVk	1390846679	427868100705271808	f	kimchitruck
@malanconnelly hope you came out and enjoyed the food	1390848782	427876920743960576	f	schnitznthings
RT @malanconnelly: .@schnitznthings is outside my office @schnitznthings is outside my office @schnitznthings is outside my office @schnitz...	1390848738	427876739172564993	f	schnitznthings
What's your favorite topping?	1390848918	427877492150792192	f	neaexpress
@ClemSchmitt @dumbolot we're on Jay &amp; Water :)	1390848894	427877392598958080	f	toumnyc
Courtesy of our former team member now traveling around the world, Vidas360! \n\nCheck out this food truck in Peru! http://t.co/QgXKddNv7g	1390848982	427877762771451904	f	nuchasnyc
@TeeEss unfortunately, I think we'll be closed tomorrow because of the cold. Can't wait for this weather to end. B back next week for sure!	1390850300	427883287135399936	f	schnitznthings
@malanconnelly glad you enjoyed it:)	1390850230	427882997107679233	f	schnitznthings
RT @garriguscarraig: Delicious #basilchicken from @biandangnyc ; there's still time!	1390851583	427888672160370688	f	biandangnyc
@square I need help with online square market. Please have someone email me at diana@biandangnyc.com! Thanks.	1390851562	427888584402534402	f	biandangnyc
RT @irenachoistern: Just discovered @milktrucknyc thanks to J-School classmate Abby Beshkin. Grilled cheese and tomato soup on Mondays, CU ...	1390851589	427888694469861376	f	milktrucknyc
RT @jonthescott: @milktrucknyc sooooo glad you're back at Columbia today! that bacon cheddar blue (plus choc shake) was the best!	1390851585	427888678871240705	f	milktrucknyc
We are closed - thanks for coming and enjoy this great weather!	1390851591	427888703969955840	f	polishcuisine
RT @AhoyNewYork: The Best Street Food in New York City http://t.co/nen3oSrTO2 | Featuring our fav shish kabob, @NuchasNYC &amp; more!	1390852235	427891405634437120	f	nuchasnyc
@ahoynewyork Thanks for mentioning us!	1390852231	427891389582835712	f	nuchasnyc
@irenachoistern :)	1390854571	427901204954234880	f	milktrucknyc
RT @nycfoodtruck: Who says this weather &amp; food trucks don't mix? Catch 30, incl. @thegreenradish1, at the #winterblast 1/30-2/1! http://t.c...	1390853812	427898018646736896	f	thegreenradish1
RT @nycfoodtruck: RT @Cursedinferno: 2 cheese steaks with onions and extra wiz. Awesome (at @carlssteaks) [pic]: http://t.co/EPGPro84MV	1390854975	427902899256311808	f	carlssteaks
RT @SarahEmilyShah: @carlssteaks thanks for the delicious and hot cheesesteak today at the game!	1390854899	427902579579027456	f	carlssteaks
@SarahEmilyShah our pleasure hope to see you again soon	1390854895	427902561770024960	f	carlssteaks
@jonthescott thanks!!! glad to be back.	1390854692	427901712150454272	f	milktrucknyc
The photos from this year's Idiotarod shopping cart race are out! Colorful as usual. http://t.co/nwr9GKrNwp	1390855518	427905176536879106	f	neaexpress
Check out who has the best pizza in NY &amp; NJForget those lame lists and listen to someone who knows his dough http://t.co/pbbjTzh97t	1390857961	427915421975445505	f	valduccis
Best pizza in Jersey and NYC? Forget those lame lists and listen to someone who knows his dough http://t.co/pbbjTzh97t	1390857780	427914661011263488	f	valduccis
Don't forget to enter our #NuchasSuperFan contest! Only a few days left to show us your fandom! http://t.co/HbdbesqzB4 #NYC #Superbowl	1390857928	427915283542835200	f	nuchasnyc
Open for dinner at 116th &amp; Amsterdam	1390859060	427920029750165505	f	korillabbq
We made it. RT@Kal_Hassan: Y'all good now? @KorillaBBQ http://t.co/ryAaCb1oAb	1390859848	427923337588006912	f	korillabbq
Bring your appetite to Super Bowl weekend this year: http://t.co/gxcZ5B30Km	1390863926	427940441783549952	f	neaexpress
TOO cold for the lady #bigred  but come see us at the POUND in #redhook 12-7. \n#clawsup	1390920920	428179490234449920	f	lobstertruckny
RT @starrett601: Hungry? Food event this Wed. at #starrettlehigh from @Valduccis, @TakumiTacoNY, @gcnyc1, @juicepirate &amp; @gofooda. http://t...	1390863657	427939313293467648	f	valduccis
#Superbowl and #Empanadas whats not to #love? Enter our #NuchasSuperFan contest today! http://t.co/HbdbesqzB4	1390864221	427941679933693953	f	nuchasnyc
@brianna__marie we're taking off tomorrow because of the freezing cold, but we'll be back on Wednesday on 47th btwn Park &amp; Lexington :)	1390876136	427991652725456896	f	toumnyc
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
@DeuceLutui Organic, Vegan Lunch in NJ. Winter Blast Secaucus, @thegreenradish1 #veganlunch #SuperBowl #Seattle #DenverBroncos #vegetarian	1390883183	428021212610957313	f	thegreenradish1
Your lunch is on us, Deuce Lutui!!! http://t.co/PjMDswOV52	1390881527	428014266772226048	f	thegreenradish1
Super Party! http://t.co/tiyvJkLgF5	1390878746	428002601951834112	f	thegreenradish1
@jrcamposf well, we got Pagadder over by the entrance to the Brooklyn bridge every day.	1390890944	428053763987750912	f	waffletruck
@viviansli we cannot help but tempt. It is our nature. And we've had 2 for quite some time now.	1390890912	428053628599803904	f	waffletruck
@jesspinto17 and which school would that be?	1390890869	428053447384907776	f	waffletruck
@Final_Eleven we are we are!	1390890852	428053374873776128	f	waffletruck
@E_Glo you tell em!	1390890839	428053321115398145	f	waffletruck
@jesspinto17 sho nuf!	1390890812	428053207583952896	f	waffletruck
@generalwasabi her dancing to Kendrick?	1390890802	428053166572068864	f	waffletruck
@BasilioCasado dinges are toppings...	1390890772	428053042756218880	f	waffletruck
@MissBridge so we've heard.	1390890748	428052938712305664	f	waffletruck
@heathaaalynn that was a fine decision you made. A fine decision indeed.	1390890728	428052858345230336	f	waffletruck
@NBarkley6 the most romantic proposal we've heard.	1390890690	428052699087515648	f	waffletruck
@soviet_reunion or just save it for later. Or give it to a friend or an enemy or a frenemy.	1390890623	428052416282361856	f	waffletruck
@E_Glo hopefully the resistance was futile.	1390890584	428052252259909632	f	waffletruck
@Scibs_1 real Belgium chocolate from Belgiumland. You can find it in Belgium.	1390890558	428052143715532801	f	waffletruck
@michaelhsamuels @WesPhillips we applaud the effort! Making them things ain't easy.	1390890527	428052011536248832	f	waffletruck
@merppanda no need to kill, just come on down!	1390890487	428051847404736513	f	waffletruck
@claenen81 not at the moment unfortunately. Maybe you could try to enlist some people on the streets...?	1390890470	428051775296245760	f	waffletruck
@mmmikaelasantos there we are!	1390890408	428051513810763776	f	waffletruck
@MamaMeryl sounds about good to us.	1390890382	428051405589331969	f	waffletruck
@helenaoftroy very important tweet!	1390890349	428051268615946240	f	waffletruck
RT @FSNYC: #NYChiliFest2014 winners! Judges Choice @LosTacosNo1 &amp; Peoples Choice @Mexicue Thx to all chefs &amp; @eatmeaty @GreenTableNYC @Chel...	1390912388	428143703845523456	f	mexicue
No parking on the west side this week so we're in midtown east again! 48 n Park now til 2!	1390913409	428147987911823360	f	philssteaks
Time to wake up and smell the coffee.	1390914644	428153165989830656	f	neaexpress
It may be a little chilly outside, but Hudson/King St. Sweetery has a very warm spot just for you.	1390916339	428160278232973313	f	sweeterynyc
@DeuceLutui Have a #VeganLunch at #winterblast in Secaucus, NJ #superbowl #Seahawks #DenverBroncos Black Bean Burgers with Melted Onions	1390917391	428164690179399680	f	thegreenradish1
Hey @dumbolot! Jay &amp; water 11-3 today. Hot Vietnamese coffee samples to keep you warm! #thaietnamese #spicy	1390917361	428164563021070336	f	sweetchilinyc
RT @Cheap_eats: @SweeteryNYC: It may be a little chilly outside, but Hudson/King St. Sweetery has a very warm spot just for you.	1390918194	428168055944781825	f	sweeterynyc
Morning folks! We're keeping our truck warm today, just a tad too cold to be out  We'll be back out tomorrow in #MidtownEast #Toodamncold	1390918321	428168587962896384	f	toumnyc
Closed today due to the excessive heat wave. One could wish right? Stay warm NYC!	1390917858	428166648731033600	f	bigdsgrub
@linhieta Wednesdays!	1390918788	428170549177896960	f	korillabbq
we are at 46th street between 5th and 6th Ave	1390918631	428169888146800640	f	seoulfoodnyc
Food sustainability takes center stage at WTCE: http://t.co/rFdIc7dRLZ	1390918815	428170660264038400	f	neaexpress
Don't let the cold  get u down, Grill on Wheels is in Midtown! Parked on 47th off Park Ave today! #schnitzel #crazy chicken	1390920087	428175996370829312	f	grillonwheelsny
Change of plan today - we are on 55th and Broadway! streets closed on 52nd! @midtownlunch @nystfood @randomfoodtruck	1390920096	428176035210067969	f	polishcuisine
The society is posted on 48th bet 6 and 7 today.\n\nCall ins accepted: 917-756-4145	1390919746	428174565060382720	f	disosnyc
Come try our couscous topped with cooked vegetables platter, with your choice of meat!	1390920473	428177616622071808	f	grillonwheelsny
53rd and park. come try our #basilchicken #taiwan!	1390921180	428180582913175552	f	biandangnyc
FIDI peeps, we r off the road 2day. C u guys Friday!	1390921089	428180200120004608	f	fritesnmeats
No lunch today, but come check us out @RoyalPalmsClub tonight for #shuffleboard and #cheese! #grillyerbiscuits	1390921502	428181932854509568	f	morristruck
Our horror film pitch: A world without D.O.P. mozzarella. Have potential?	1390922439	428185861482881024	f	neaexpress
G1 - Hudson &amp; King\nG2 - 50/6\n#ComeToTheCheeseYo	1390922459	428185947147345920	f	gcnyc1
HAPPY 28th New York! Catch the #Lucky8 promo on 49th &amp; 6th today and get a free ricebowl with the purchase of any entree! #Bringyomom	1390922133	428184580731199488	f	mooshugrill
@holyshityouguys We missed you yesterday! Will be back in Dumbo Friday at the latest. Sooner if the weathers garbage.	1390922790	428187334287585280	f	thesteelcart
@holyshityouguys Broadway &amp; 56th sir.	1390922712	428187005689036800	f	thesteelcart
56th &amp; Broadway through lunch. Soups are Organic Lentil + Split Pea &amp; ham.	1390922636	428186687542681600	f	thesteelcart
Headed to SoHo's Varick &amp; Vandam!	1390923071	428188514032037888	f	korillabbq
RT @dumbolot: Heating up in the dumbolot with @sweetchilinyc @carlssteaks and @KimchiTruck today! @DUMBOFoodTrucks	1390923902	428191996571041792	f	carlssteaks
BbbbbRrrrrr it's cold out there - a satisfying warm lunch will do the trick! 55th and Broadway from 11:20 - 2:30! #pierogitime	1390923826	428191680651853826	f	polishcuisine
@holyshityouguys Does Uber pick up cereals? We'll  be back in the hood soon.	1390923205	428189074726584320	f	thesteelcart
Happy taco Tuesday Midtown!!! 46th St . Btwn 5th &amp; 6th Ave #Tacos #Sliders #Burritos #comegetsome have you tried... http://t.co/US6AwCIGtp	1390924318	428193744391659521	f	mikenwillies
SoHo's Varick &amp; Vandam ready at 11:30	1390924696	428195327074897920	f	korillabbq
@rachelbrill Fastest way to lose weight, burn fat and stop fat production http://t.co/zhkQ2MX5wk	1390923947	428192185209454592	f	wingnitnyc
@PolishCuisine Fastest way to lose weight, burn fat and stop fat production http://t.co/3PzF9KWyTQ	1390923944	428192175373828096	f	wingnitnyc
@bertones666 Fastest way to lose weight, burn fat and stop fat production http://t.co/whTuJBvo4v	1390923942	428192165047447553	f	wingnitnyc
@CDIdiamond Fastest way to lose weight, burn fat and stop fat production http://t.co/HVyv1Us20E	1390923939	428192154708504576	f	wingnitnyc
Polar vortex,snowstorms who cares we need to show our LOVE to @dumbolot @DUMBOFoodTrucks grab a hot cheesesteak 11-3 Webrooklyn GOT WHIZ?	1390924167	428193108711735296	f	carlssteaks
48th and Park today til 2 -warm up with hot cheesesteaks and fries from the jawn!	1390923937	428192144583438337	f	philssteaks
Today is the LAST day to enter our #NuchasSuperFan contest!  You could win a catered party on us! #SuperBowl #NYC http://t.co/HbdbesqzB4	1390923991	428192372133232640	f	nuchasnyc
No truck today. Hasta la manana!	1390924671	428195224553541632	f	kimchitruck
we're at wall &amp; william today fidi!! preorder at 6465046455 or http://t.co/psDZsxYjzF. classic combo anyone?	1390925708	428199574252310528	f	milktrucknyc
I posted a new photo to Facebook http://t.co/P6cPpTloGs	1390925663	428199383344361472	f	polishcuisine
We are at 46th btw. 6th &amp; 7th Polar Vortex vs. crispy cheese taco crave round 2.	1390925521	428198790877949952	f	mexicoblvd
Midtown! Preorder on our website &amp; pick up on 46th St btwn 6&amp;7th Aves :) http://t.co/aAbStQP4UO	1390925417	428198353885999104	f	mexicoblvd
For one free dinges, what is your Super Bowl ritual??	1390924980	428196519372521473	f	waffletruck
Goesting is at Broadway &amp; 66th till 9pm \nKotmadam is at 5th Ave &amp; 23rd all day!	1390924967	428196463311458304	f	waffletruck
Kastaar is at Brooklyn College til 10pm \nMomma Truck is at Trinity School, 91st &amp; Columbus, til 4:31pm	1390924953	428196404905791489	f	waffletruck
And Tuesday for the win!  \nDe Wafel Cabana at Herald Sq open til 9pm \nLe Cafe at 15 Ave B open til 11pm	1390924904	428196199250669568	f	waffletruck
We are on 47st at the corner of park av!!	1390925467	428198560816201730	f	chefsamirtruck
Just added Breckenridge Ophelia Hoppy Wheat Ale on tap. http://t.co/So8On7u9PY	1390926447	428202674614325248	f	shortysnyc
"Cooking is like love. It should be entered into with abandon or not at all."  Harriet van Horne #foodie	1390926058	428201040882970624	f	neaexpress
I posted a new photo to Facebook http://t.co/rEnJ6KjEw8	1390925770	428199834437570560	f	polishcuisine
Bobjo express stay at State st &amp; whitehall st. \nThanks!	1390926025	428200901019709440	f	bobjotruck
Good morning ny!\nBobjo truck open at Water &amp; Hanover sq today. Today is best time for bobjo ramen noodle soup. And we serve rice platter too	1390925945	428200567488663553	f	bobjotruck
#SUPERBOWL XLVIII QB duel Peton Manning VS Russell Wilson get tickets @ http://t.co/d29fXZJHyr	1390927463	428206936014589952	f	mausamnyc
open until 2:30 on 55th and Broadway - #warmyourbelly #pierogitime	1390928292	428210412472262656	f	polishcuisine
!!! Tues, Jan 28th 12:30-2:30 17th st near 5th ave!!!	1390927732	428208061116084225	f	thetreatstruck
Tomorrow: Well be partying with the @Super Bowl @BudLight Hotel! Stay tuned for updates all week\nhttp://t.co/0Zw71HtZRC	1390929159	428214049613295616	f	nuchasnyc
New CNG options for Texas: http://t.co/gUbPBov4ha	1390929925	428217259681939456	f	neaexpress
We are no longer on hudson &amp; king...the police kindly asked us to mosey on...New spot to be announced shortly	1390929348	428214839040016384	f	gcnyc1
G1 park 25/26\nG2 50/6	1390930411	428219299535544320	f	gcnyc1
RT @EatStTweet: Food trucks are bringing jobs, flavour and a friendly urban vibe to Portland http://t.co/KSDHf67NQw	1390930958	428221595388502016	f	burgersandbites
@EatStTweet follow suit nyc!	1390930956	428221584353284097	f	burgersandbites
116st&amp;Amsterdam AVE from12pm-8pm,please come and get some food	1390930685	428220449466900481	f	shanghaisogo
We know it's cold out there today, free hot mint tea with rise water	1390930680	428220426981232640	f	chefsamirtruck
@dookdookdook Hey we're actually doing a private event today	1390931669	428224573914763264	f	mexicue
@chazelton331 7 Hanover square	1390931652	428224505035886592	f	lovemamak
#New crab cake slider ready to be showcased at private event this wednesday- the old bay coleslaw turned out 2 be the winner!	1390932684	428228831993167872	f	getstuffednow
Thanks everyone at #NYChiliFest2014 for an awesome event. Congrats to winner @LosTacosNo1 We're honored to take home People's Choice Award!	1390932708	428228933507510273	f	mexicue
Like keeping things basic? Try a Marinara.	1390932276	428227121702772736	f	neaexpress
Any suggestions where we should park for lunch tomorrow? WFC lot is closed due to construction :(	1390933466	428232111611740160	f	mexicoblvd
@linalovesit We are at the Dumbo Lot every Monday and Thursday.	1390934194	428235165656432640	f	toumnyc
Today we are on Water St and Wall St from 11:00 to 3:00!	1389373670	421689855509549056	f	yougotsmoked
Don't miss out on our #NuchasSuperFan contest! Enter now for your chance to win a catered event on us! http://t.co/HbdbesqzB4 #empanadas#NYC	1390934136	428234924773343232	f	nuchasnyc
Super Bowl Party Secret Weapon: Mexicue Burnt Ends Chili Box! Our award winning chili ready to heat and eat! Call 646-543-6394 to reserve!	1390935063	428238811479695361	f	mexicue
RT @SSDESTO: @PolishCuisine u guys r #8 on my food truck hunt! Can't wait to dig into some pierogies!	1390935441	428240394280001536	f	polishcuisine
RT @DosHig: I think my household keeps the popcorn industry in business. But @BrooklynPopcorn in particular. #addicts  #garliccheddarmix	1390936741	428245849605279744	f	brooklynpopcorn
RT @KumaBaity: Kuma's Take on Brooklyn Popcorn Co. http://t.co/lfg2FH1KU5	1390936713	428245732584194048	f	brooklynpopcorn
Thanks for battling the cold! see you soon:)	1390938211	428252016138530816	f	polishcuisine
@FunZachUniverse thanks for braving the cold. We'll make u a made man soon.	1390937686	428249812958732288	f	disosnyc
today's special http://t.co/wTp8IIDy5f	1390937635	428249597967101952	f	shanghaisogo
RT @FunZachUniverse: Thanks for the sandwich dudes @DiSOSNYC. Very delicious. Definitely worth that 10 minutes in the cold. http://t.co/Qps...	1390938424	428252906534744064	f	disosnyc
@justintravis we are usually off Monday and Tuesdays. 46th and park tomorrow, the nj for the rest of the week for Super Bowl festivities!	1390939410	428257041686487041	f	nautimobile
RT @w0nglette: Deliiiiiicious avocado torta from @MexicoBlvd. I'll definitely be back again.	1390940078	428259844660154368	f	mexicoblvd
@katttastic closed today but back on 46th tomorrow	1390940734	428262597780316160	f	eddiespizzany
Pizza boxes are a bit more reliable than Christmas gifts. You never find a tacky sweater inside.	1390940481	428261537607086080	f	neaexpress
RT @EdgeStudio: @MexicoBlvd thanks for yet another delicious #tacotuesday - @EdgeStudio @ItsMeLeanne can't wait till next week! http://t.co...	1390940584	428261968278204416	f	mexicoblvd
http://t.co/r4X5X6TB	1359646681	297005824084176896	f	thecrepestruck
Omg it's cold,,,but our food is so yummy! We are on west 4th and Greene street for dinner tonight!	1390945290	428281705880096768	f	seoulfoodnyc
Polar Vertex whateverUWS dinner 61st &amp; broadway 5- 9pm@nyit grab a piping hot cheesesteak before or after class way home from work\nGOT WHIZ?	1390945033	428280626551062528	f	carlssteaks
Making GMO-free lunches makes the week worthwhile.	1390943761	428275292034322432	f	neaexpress
RT @WebsterHall: Next Friday at @GirlsnBoysNYC- @DJGREENLANTERN + @BranchezBeats. Get your tix today!\n&gt;&gt; TIX: http://t.co/rjWjWo9tUB / http...	1390944858	428279895509061632	f	valduccis
Hey Astoria! You can find us on Ditmars &amp; 31st (last stop on the NQ) tonight until 9:30 and tomorrow from 11:30am until 9:30pm! :) #tacolove	1390946495	428286759966097408	f	mexicoblvd
Free Thursday, or busy and easily swayed? Visit us at The 50 Yard Lounge to start Super Bowl celebrations right. http://t.co/gxcZ5B30Km	1390947317	428290206413107200	f	neaexpress
RT @veganjobs: The @VeganLunchTruck is looking for Line Cooks, Night Time Bakers and Prep Cooks! Apply: http://t.co/GKqz9ApRFH	1390947639	428291557905924096	f	veganlunchtruck
RT @nycfoodtruck: . @thegreenradish1 would love to see you this wknd at the #winterblast! Check out the details here and join them: http://...	1390950290	428302678557732864	f	thegreenradish1
RT @JoshRitt: @Mexicue Green chilli Mac and cheese. A stroke of genius #SuperBowlXLVIII	1390959695	428342125936533504	f	mexicue
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
Park Ave btw 33rd St and 32nd St from 11:00 to 3:00 today! New York Aged Cheddar Mac and Cheese! #Delicious #nyc http://t.co/Gf6QWDPKcv	1389964535	424168119977132032	f	yougotsmoked
Thank you so much! @gregdotgilbert glad you enjoyed it and hope you see you back soon!!!	1389921522	423987711750717440	f	yougotsmoked
RT @gregdotgilbert: Today's awesome lunch was courtesy of @YouGotSmoked. Thanks for coming down to fidi!	1389921410	423987241946726400	f	yougotsmoked
Today we are on Water St and Wall St from 11:00 to 3:00! #comegetsmoked #fidi	1389891274	423860842850177024	f	yougotsmoked
Hey @thisismydesign we apologize for the inconvenience Today. Next time you come by, your meal is on us, Sorry again...	1389819861	423561314326577152	f	yougotsmoked
Check us out today @dumbolot @DUMBOFoodTrucks from 11:00 to 3:00! #slowsmokedpork #applewoodsmokedchicken	1389793785	423451943378644992	f	yougotsmoked
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
@DUMBOFoodTrucks Here we come! Check us out for lunch tomorrow @dumbolot for some bad a#% BBQ! See you then!!	1387317345	413065002023927808	f	yougotsmoked
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
RT @DiscoverSelf: Popcorn Lovers here?\nWe're having a $20 Gift Card to Brooklyn Popcorn as part of this HUGE $250 giveaway prize!... http:/...	1390963799	428359339586633728	f	brooklynpopcorn
RT @Seamless: Bok choy is sometimes called a soup spoon because of the shape of its leaves. #TheMoreYouKnow http://t.co/udAmKjdZAf	1390952495	428311927786582016	f	shanghaisogo
Happy Whiz Wednesday! Back at our old stomping grounds today - 47 btw Park n Madison now til 2!	1391000946	428515145988308993	f	philssteaks
Happy Wed. fans of Sweetery. It;s a little warmer today, but the real warmth is on Hudson/King St. where you know Sweetery will be.	1391002559	428521908657602561	f	sweeterynyc
We'll post spots later this morning. We won't be on 45th this week because of the Super Bowl events Midtown, but we can deliver!!	1391002264	428520672844083200	f	thetreatstruck
We are already to serve you lunch!!\nWe are On 51st between Park and Madison avenues!	1391003673	428526584220250112	f	seoulfoodnyc
Open on 23rd and Park. Start your day with a coffee and donut, or if your feeling adventurous, a steamy hot apple cider!!!!	1391003429	428525560256798720	f	carpedonutnyc
Hello #MidtownEast ! We're on 47th btwn Park &amp; Lexington getting ready to serve up mouthwatering #chicken #shawarma http://t.co/UNJy3p1dXf	1391004183	428528721969303552	f	toumnyc
@mineisforever @redhooklobster still looking for parking. Superbowl XLVIII excitement is holding us up, #LOBSTER shall prevail. #staytuned	1391004911	428531773606494208	f	lobstertruckny
The Eco-choice Awards winners are out: http://t.co/TJ6tmtRKaM	1391005754	428535309882896384	f	neaexpress
Soho bound. Corner of Varick and Charlton street..\n\nCall in orders for pick up: 917-756-4145	1391005159	428532813135368192	f	disosnyc
RT @jennstuvwxyz: @StephAndTheGoat !! RT @TheUniverse1981: "'Goat Aurora Over Greenland' Image:  http://t.co/OjXD900t8G via #NASA_App http:...	1391005718	428535159282229248	f	sweetchilinyc
Happy hump day! Join us at 56 &amp; Broadway 11-3! http://t.co/VPFs5dzZ63	1391005594	428534639784112128	f	sweetchilinyc
Off catering today. Will return to 47th next week. Keep warm!	1391005895	428535903360147457	f	thesteelcart
Headed to FiDi's Front St &amp; Gouveneur Ln!	1391007431	428542344905117696	f	korillabbq
#bigred is kickin it on 47th between Park &amp; 3rd. #lobsterforlunch! Drop business card for chance 2 win #freelobsterroll. #crustaceanelation	1391007307	428541822223523840	f	lobstertruckny
46th and park today, then we are in Nj for Super Bowl festivities for the rest of the week!	1391007328	428541912799531008	f	nautimobile
Sorry folks, still off the road. Patience, patience.	1391007598	428543046750195713	f	kimchitruck
Hey folks 49th st 6/7th ave 11- 2:30 grab a piping hot carls cheesesteak to stay warm @SiriusXMNFL @SIRIUSXM @Barclays order 917 597 4313	1391008336	428546140318208000	f	carlssteaks
55th off Broadway today! Open for lunch at 11-3:00!	1391008280	428545907215589376	f	grillonwheelsny
Bessie's at 58th &amp; Mad, call (646) 504-6455 to pre-order or http://t.co/IwkqcCHPzF. Sandwich menu always at @houstonhallnyc	1391007650	428543261423071236	f	milktrucknyc
Happy Hump Day! We are on Varick b/w King &amp; Charlton (closer to King) @downtownlunch @nycfoodtruck	1391007871	428544188901519360	f	polishcuisine
Hello soho, lunch 2day. @ Hudson &amp; king. Burger of the week THE MARITAL BLISS preorder. 9172929226	1391007875	428544207142526976	f	fritesnmeats
Let us warm you up at Broadway and 56th Street for lunch.  Beat the cold and preorder for pickup by calling 646-543-BIGD @randomfoodtruck	1391007679	428543385520312320	f	bigdsgrub
Morning guys. The cart is back out today on 27th st &amp; Park ave from 11:00-2pm. Warm yourself up with a delicious schnitz:) hope to see you!	1391008796	428548067978387456	f	schnitznthings
@7BOOMERESIASON thanks for being a fan of ours if you &amp; Gunner @ game tonight email us carlssteaks@gmail.com for a few cheesesteaks no wait	1391008711	428547715103227904	f	carlssteaks
53rd and park! #humpday # wednesday	1391008633	428547385040461824	f	biandangnyc
@dgkendrick we like your style don!	1391008653	428547469002424320	f	philssteaks
RT @dgkendrick: @PhilsSteaks already here... Listening to good music in chilly temps getting good food!!	1391008621	428547336198160384	f	philssteaks
There's something tragic about a homeless pizza.	1391008524	428546927400337409	f	neaexpress
It's almost #SuperBowl time! We're going to be at the #BudLightHotel today till Saturday, we'll see you there or see you after #XLVIII!	1391009211	428549810656776192	f	morristruck
The #schnitztruck will be on 47th street between Park &amp; Lex from 11:30-2pm. We've missed you guys. Come grab some warm schnitz! See ya:)	1391009832	428552413231190016	f	schnitznthings
Back at it on Jay &amp; Water for a double dose of @dumbolot this week! #porkbelly #comfortfood #ytotheum	1391010002	428553127500197888	f	mooshugrill
@Sessahhh we shall, but in the meantime, the cabana is on 35th and broadway.	1391009797	428552268049158144	f	waffletruck
@EmmaClarkin fine suggestions!	1391009680	428551776749359105	f	waffletruck
@emi_jooo we shall take you!	1391009641	428551614677254144	f	waffletruck
@CrimsonDragon5 preach!	1391009614	428551502227988480	f	waffletruck
RT @CrimsonDragon5: If you've never had a waffle from the @waffletruck then you haven't lived. That is all.	1391009596	428551426118541312	f	waffletruck
RT @thatguyahmed: have you ever eaten a waffle so good you cried because shout out to @waffletruck for making that possible	1391009582	428551368266481664	f	waffletruck
@bootytai a tough yet rewarding conquest.	1391009566	428551298862948352	f	waffletruck
@MichelleScalia @BelieveItAmigo we wish that same thing for you.	1391009449	428550807022088192	f	waffletruck
@WillieKRobinson what else would one do?	1391009427	428550717343678466	f	waffletruck
#winterblast #secaucus #Super Bowl XLVIII  #1 offense VS #1 defense #Peyton Manning VS #Russell Wilson @northjersey.com/winterblast	1391010857	428556715496177664	f	mausamnyc
Lunch is ready! Varick b/w King &amp; Charlton - smokin' grilled kielbasa and our top pierogi await you! #pierogitime	1391011266	428558431029841921	f	polishcuisine
The society is open and accepting new applicants.\n\nSoho varick and charlton st.\n\nCall in orders: 917-756-4145	1391011384	428558925969883136	f	disosnyc
Gmorning FiDi! We're ready for ya @Front &amp; Gouverneur!	1391012938	428565440651345921	f	korillabbq
A modern guide to cutting pizza: http://t.co/B2lCsX3yZy	1391012128	428562043617431552	f	neaexpress
Bobjo express stay at 47 and park!\nThanks!	1391012792	428564830338174977	f	bobjotruck
Bobjo truck open at king st &amp; Varick st today. Try our ramen noodle soup. It's will make u warm and happy. Also we serve rice platter too!	1391012761	428564700737961984	f	bobjotruck
For one free dinges: Tell us the BENEFITS of cold weather!	1391012826	428564971488677888	f	waffletruck
Vedette is at 60th &amp; 5th till 6pm \nPagadder is at Brooklyn Bridge/City Hall Park till 5pm	1391012652	428564243755982850	f	waffletruck
Goesting is at Broadway &amp; 66th till 9p Kotmadam is at 5th Ave &amp; 23rd til 7p	1391012641	428564197979336704	f	waffletruck
Momma Truck is at Wall St till 4:30p	1391012633	428564163028217856	f	waffletruck
Wednesday!\nLe Cafe @ Ave B &amp; 2nd St is open till 11p \nDe Wafel Cabana @ 35th &amp; Broadway till 9p	1391012617	428564096401698816	f	waffletruck
We're going to open later than usual today. Our truck needed a quick adjustment &amp; our prince of a mechanic is fixing it now!	1391013122	428566214924050432	f	thetreatstruck
RT @randomfoodtruck: Happy hump day! Truck party with @bigdsgrub, @sweetchilinyc, Katz &amp; Dogs, and @GrillOnWheelsNY (glatt kosher, if that'...	1391013543	428567978494681088	f	sweetchilinyc
It's lunch time at Broadway and 56th street. Free coffee samples to anyone who asks! Here till 3	1391013504	428567815021690880	f	sweetchilinyc
FREE HOT Moroccan mint tea with rose water! Uhmmmm!	1391014612	428572464638345216	f	chefsamirtruck
Is on 52nd St @ Park Ave today!	1391014547	428572191442337792	f	chefsamirtruck
Whats on your plate for #LunarNewYear ? We are selling out of peking duck sliders at a private event!	1391015539	428576352514883585	f	getstuffednow
RT @nycfoodtruck: RT @starrett601: Hungry? Food event TMRO at #starrettlehigh w/ @Valduccis, @TakumiTacoNY, @gcnyc1, @juicepirate, etc. htt...	1391015569	428576479442501632	f	valduccis
RT @starrett601: .@Valduccis owner, Mike, making sure the penne vodka sauce is top notch for today's food event at noon! See u soon. http:/...	1391015540	428576357241483264	f	valduccis
G1- 7 Hanover Square  fidi\nG2- 26 11/12 #starrettlehigh	1391015203	428574942452789248	f	gcnyc1
Lunch Time? Shanghai Sogo @116th &amp; Amsterdam here all day until 8pm&gt;&gt;SOGO FOR IT &lt;&lt;......	1391015465	428576042350313472	f	shanghaisogo
Parked in our usual #Astoria spot all day today! Ditmars &amp; 31st (last stop on the NQ Queens bound subway) Preorder on http://t.co/EIrGC8j9wt	1391014861	428573506553806848	f	mexicoblvd
We are on 52st and park av!!	1391015194	428574906859917312	f	chefsamirtruck
Check us out @starrett601 food pop up! Penne vodka is on the menu!	1391015817	428577516119273473	f	valduccis
Counting the minutes until halftime? Why not wait witih us this Saturday at The 50 Yard Lounge? http://t.co/gxcZ5B30Km	1391015719	428577106399076352	f	neaexpress
Yes, We have it!! Because soooo many of you asking for it!! http://t.co/gR9zzVLPsu	1391015795	428577425501732864	f	shanghaisogo
@mikeyslice we didn't bail, just switched up our Mondays. We'll be there tomorrow, every Thursday.	1391016606	428580827073888256	f	disosnyc
@restaurantbuzz1 Thanks for the mention! We're glad to hear you enjoy our empanadas!	1391015986	428578225514885120	f	nuchasnyc
Our Nuchas Truck is getting wrapped and ready for Super Bowl XLVIII at the #budlighthotel http://t.co/vyQwqutQXM	1391015813	428577502169014272	f	nuchasnyc
Break your Resolution: The Mexicue Steak &amp; Cheese with Smoked Mushrooms &amp; Queso. Come on...you deserve it. http://t.co/EXwC7KyYyb	1391016918	428582135394734080	f	mexicue
Keep your Resolution: Breakfast Huevos Cup with Black Beans &amp; Fresh Pico. Stay strong...we believe in you. http://t.co/6is6KZAw7q	1391016851	428581854921641984	f	mexicue
RT @andymorris: Insane breakfast from @Mexicue! @ #OpenCommunications @ The Firehouse http://t.co/GS7jmNNVAq	1391016786	428581580438011904	f	mexicue
We're doing big Super Bowl parties, please get your orders in now for Sunday.. Thanks!	1391018244	428587698249420800	f	disosnyc
RT @JoshOchs: "Keep in mind what makes you feel good when youre a customer, and use that in turn with your customers."  http://t.co/6Un02p...	1391019039	428591029915508736	f	shanghaisogo
RT @NYNJSuperBowl: #SBBLVD is now officially open on Broadway between 34th &amp; 47th streets! http://t.co/VUawW6JM8e	1391019274	428592017879597056	f	nuchasnyc
RT @NYNJSuperBowl: The Toboggan Run is a must on #SBBLVD Engineered by @ThisIsGMC! http://t.co/g100JOj6VZ	1391019234	428591850359103488	f	nuchasnyc
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

