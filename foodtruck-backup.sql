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
    foursquare text
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
4f67b0d4e4b08559c4c60149	https://irs0.4sqi.net/img/general/	/SdNxRS0joKXurf0FEv8_SRg-GeR9lGCN098_ZB2tijA.jpg	public	mexicue
50784742498ec6be8cd3f88e	https://irs2.4sqi.net/img/general/	/155927_ebZApDyXpTKTmvOQHdBTxNc2wJrsZV2QASmpYTNAVJM.jpg	public	mexicue
507efae0e4b09a52c022ec3a	https://irs0.4sqi.net/img/general/	/39213_nH-zcqfLCJqMvG0Nco0LWE4QuRuoL6unlEXJlJbTEF4.jpg	public	mexicue
501fe830e4b0bbddce992f90	https://irs1.4sqi.net/img/general/	/fFBOGONZt5Zr77Vc5g8adoAiBht0f-MBut7GqorVEjo.jpg	public	mexicue
51af7257498e0c7f8979c05d	https://irs3.4sqi.net/img/general/	/752258_nUJpoSxZ8p9BBJMG5ISetpo3DDLzycLT_gT3z9fvJmI.jpg	public	getstuffednow
523c8b2a498e959b87f8ded2	https://irs0.4sqi.net/img/general/	/39707564_-WCsPSk2ExKeZ8q06DtUQrpt_vcWG9-AzvFoToSdQqY.jpg	public	getstuffednow
50ca356fe4b05b0bb93edc40	https://irs0.4sqi.net/img/general/	/1590381_NyRIp7fXJtGoJoXp25IcMmufNufPxxvLEj3TVYXRo5g.jpg	public	getstuffednow
52013fe1498e5f476bfdcf83	https://irs3.4sqi.net/img/general/	/30611522_DHhazmY8dyNAbmijjHX7jyyfVBEiugL5-GJcTLuYjS4.jpg	public	getstuffednow
4f7deaf5e4b0ffb6a3f2008e	https://irs1.4sqi.net/img/general/	/Xho5Xq8BtpNhEQvH0KRI3yX4kUstFRwTxEDj6QoawcM.jpg	public	palenquefood
51b8a845498e8ebdef064e0c	https://irs0.4sqi.net/img/general/	/761163_j9ai1NfaIpK2TLN8JzXbTwyIhVzuZevNHBV5EpQ7Fh0.jpg	public	palenquefood
51435e1de4b07d53cf71fd7a	https://irs1.4sqi.net/img/general/	/4486_lUhkecOFThYlMHKai4wDp4lXXiQSPLTq3Nno5WMIz7E.jpg	public	palenquefood
4e6513efc65b2dc8a0bfff6d	https://irs2.4sqi.net/img/general/	/TUQTIKBJPOALJKHN54QRKGISWMQDDOW3WTAECOGJ4FOJTPXI.jpg	public	palenquefood
516ee142e4b04f28d58be309	https://irs0.4sqi.net/img/general/	/36812449_DjR1ynMnMpwj-KmiWPZQldmGQwJ2IEzjSwwmGevqe3U.jpg	public	sweeterynyc
5107e09be4b047c08ade6bf6	https://irs3.4sqi.net/img/general/	/760350_ZaalKVnOYdVAGoQEdugu-1Lws1LubyJBOVpZvJJD1V0.jpg	public	sweeterynyc
50188a43e4b0d35e6d8035b4	https://irs0.4sqi.net/img/general/	/b-fKh6mx2WxCybNQkr9ovk_jv4x7bwJPVFM9RF3M5T4.jpg	public	sweeterynyc
5203e16e498e9e8e0a93b61a	https://irs3.4sqi.net/img/general/	/702028_Fog-6PEF03KateivIPP-hx87Qn6gi7PwnaJv-wTFv3I.jpg	public	carlssteaks
506dcb8be4b0748e0467de78	https://irs0.4sqi.net/img/general/	/157259_PdYI3Fpzhcz_LoGnBeymaSAZaZCiVVw43c4xaYQQIDY.jpg	public	mikenwillies
51117858e4b0e14064917adb	https://irs2.4sqi.net/img/general/	/263293_EvgjxXJqOivd94q0mbPR_AxkRXuzkFtjOBcOWnXuyQU.jpg	public	mikenwillies
5135022ee4b0592185aa975e	https://irs1.4sqi.net/img/general/	/2660256_0rdKd0P0tCYzLf5j7-_3b8HbPNDVCW6S0hHdJGW47Wo.jpg	public	mikenwillies
51fd732d498e415eeb8b9881	https://irs3.4sqi.net/img/general/	/8839239_mAp7_MVmWbbK42Xq3-W-1zmegy-MNx8NzB0P5Brf-Pw.jpg	public	delsnyc
51ab89bb498e83fced4cefd6	https://irs1.4sqi.net/img/general/	/66074_8dLzCKmVRde0Uvtx_NSl9SKROFh0kat1IQgcAvU4J3M.jpg	public	delsnyc
520e673a11d25d1282a44199	https://irs2.4sqi.net/img/general/	/117715_KjwJnc6idBB7TuMKhGboHDg8IYjlGcr6h3I6_fJECmM.jpg	public	delsnyc
4fb29dc4e4b0e08c1e225555	https://irs2.4sqi.net/img/general/	/ckjwTj4Fd2cRoZvDQZw_1jYdwuBF4BsfV4ZWc5oElFo.jpg	public	eddiespizzany
4fd79157e4b071eb33a9c810	https://irs3.4sqi.net/img/general/	/8zrcTIejD5EBiOJzSobql1_PQWr-i2KmRfgMCYmbK-M.jpg	public	eddiespizzany
4f9c18b0e4b0b38d2f554383	https://irs3.4sqi.net/img/general/	/AQEKYbyPrQt5uMWhy4r4ODm2vSMCqPseJyMhcg55mtY.jpg	public	eddiespizzany
4da8977840a3582fb8c49316	https://irs2.4sqi.net/img/general/	/MCGIPRA0XR15JNG4O2YZJQBCRMK05UVTC4T14TOQWRTNMQFZ.jpg	public	eddiespizzany
5249c4bb498ecd25dde27c5e	https://irs2.4sqi.net/img/general/	/764670_x0RdEOs5TL4SEe2zGgpkzPFBFmlFV7-6UQiVtoFeHaY.jpg	public	goburger
5182ad6b498ef6cb59d48783	https://irs2.4sqi.net/img/general/	/39425123_zPh6ih4GAAygbhRJ-pyPdCr5TI3rXafgKyIEEK4HpHY.jpg	public	goburger
501d4734e4b0af03cf473287	https://irs3.4sqi.net/img/general/	/6BUHUmEyYTTh3a2SRjSYRklUlTfQBNbFnnk_hfEojYs.jpg	public	goburger
521b83c411d29ec0512f89b3	https://irs0.4sqi.net/img/general/	/255980_1U9yRWzBKuIDLReBhmBs45qJ0mtHu7pzL_Fv4T9gTss.jpg	public	lovemamak
526e8aee11d299d16e74b447	https://irs3.4sqi.net/img/general/	/67629862_ZPeS1alTFabw1hPqq8PCcGF1SRFynqA23OgkKg8yc00.jpg	public	lovemamak
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
529ccbc511d21047117cdea2	https://irs2.4sqi.net/img/general/	/68150__CRf8sW9KvXZTkcAQEc4EsnYPgqXA2trmMxy-_AzobY.jpg	public	mrniceguytruck
4dfa4a9840a3542ff44549df	https://irs3.4sqi.net/img/general/	/VBAJNQCBWDMP2WKDXJ5QHQ0WYF1MKHZSLUAZZJXKDBDLDUWG.jpg	public	taimmobile
519fa37b498e7adf7e8ebce3	https://irs2.4sqi.net/img/general/	/47170230_A9xVWAtkJBP-vVqUF1q2WlK8yuZTf1CVQz0JcPrHGY0.jpg	public	taimmobile
4fa814d1e4b0d607baf8bd9d	https://irs1.4sqi.net/img/general/	/2drHnu4mqj-uzpwwcJa3MatYGD7KFuxjE472rButWlM.jpg	public	taimmobile
51cb2c41498e9851cecdd49a	https://irs2.4sqi.net/img/general/	/5728350_vuJ4ORu0wHhd-B-f4FTNfsoIhfHgtJRMJc-QEeiYmNQ.jpg	public	taimmobile
526fef71498e92d1ace459d9	https://irs0.4sqi.net/img/general/	/60805368_eCRrBwapYrNL8fM9tmIaLCfnlhQYb9ASU-ZkaR1Og54.jpg	public	mamuthainoodle
5203bd51498ed50247ee01dd	https://irs0.4sqi.net/img/general/	/60805368_HlIeqCMjY2I5md2mzI5crKizc9wVPUZo_sBmC6zrPEA.jpg	public	mamuthainoodle
521cdbc611d2549cf41dcf9c	https://irs1.4sqi.net/img/general/	/926357_0BYLrfqHavxLIHQNkWupu34ImE55HTUVGGDJjycyOVM.jpg	public	seoulfoodnyc
5161e794e4b02525dbd064d7	https://irs3.4sqi.net/img/general/	/310577_h_ww6Za5XojCZcGVq7-gZluC_YvRnT1EOXY4hwV7KJ8.jpg	public	seoulfoodnyc
5012d0d5e4b06fc7ce735a68	https://irs1.4sqi.net/img/general/	/7J2g1YLtx4ma57g4A4CerJJ66OwudjGhFI67JaNl1Qw.jpg	public	seoulfoodnyc
5008051fe4b0974c844d5003	https://irs3.4sqi.net/img/general/	/oNy0_bsWPyVmjrduzJXpbrAPHjQS0PVbyOCfoRSD9xE.jpg	public	shortysnyc
51a4ee69abd87ea53396c979	https://irs2.4sqi.net/img/general/	/4083549_jMzaCPEId80kWmAaq2oQ9APKf4bLvdeHhy40qPeB9j8.jpg	public	shortysnyc
50045b1be4b0004dbf67c977	https://irs1.4sqi.net/img/general/	/MDweBG1fBnF_fZ1tOghWyHS9qUxGNiJeOrOpoA-fBrY.jpg	public	shortysnyc
507dacb0e4b0d8cafc9601e0	https://irs3.4sqi.net/img/general/	/2361939_S3NwwSNVZD-2tAhc3bwAvsYgk9tXwYv0T0yq9ci-ihE.jpg	public	toumnyc
516d98b8e4b0b059e50ff5ad	https://irs2.4sqi.net/img/general/	/117715_BoNkQJO4jPWEtg_ef4-URb7IseoIXnYiP5vkvWJtezg.jpg	public	toumnyc
516452a5e4b0e1b216fdbaa4	https://irs1.4sqi.net/img/general/	/26263584_5wpEOb9FygNRBFQySA-pE1t1q_E9jVM_4mx2mnw5fAU.jpg	public	toumnyc
51716b5f498e03d8bc252c48	https://irs1.4sqi.net/img/general/	/11709298_S8klPxq0yPyZw2X9-_0IZyk6TFTn9xi5SWd_6BGCeVM.jpg	public	toumnyc
5079a745e4b00277f33e4836	https://irs3.4sqi.net/img/general/	/34723233_tCoDnWhdhZj61xi_e00MNwJoK_UcfDXCQQ7Weat8pBM.jpg	public	valduccis
521e9e4511d2d8ddc5c69dbd	https://irs3.4sqi.net/img/general/	/117715_r7cpzyXCpOthqHouR5gdqIMX8k0TZ2KWHFun5wh-EYk.jpg	public	valduccis
4fe65d6fe4b09198fde5842a	https://irs3.4sqi.net/img/general/	/nVmhJloDitdcBPFceYT8ajqQqgXBpB_w5GoPWse33Ks.jpg	public	valduccis
512161e0ebca7d20d6a70104	https://irs0.4sqi.net/img/general/	/4574_ZC6mf3ha1jNXmFUDgtNsN3zIf-NHyqgxA3WkUkOl4mY.jpg	public	biandangnyc
505c9776e4b0643aba1071c7	https://irs0.4sqi.net/img/general/	/5568483_yQrtG73dbug7q06p9IASJmTFnOVgGprIZKbfHjQRcso.jpg	public	biandangnyc
5106b878e4b05ec869ad8b34	https://irs3.4sqi.net/img/general/	/814104_blIawoImaEcqf-Mg89W5A-nEHiZ5jx76BEYHVzz8dnA.jpg	public	biandangnyc
527d2c2711d2c984e85cb11b	https://irs2.4sqi.net/img/general/	/4179871_5FQ2eCC5ZeizUVRLh4tadgEAO1BnJjVQ7pSEvSDwIfQ.jpg	public	biandangnyc
501c284be4b07d0ab63e08be	https://irs1.4sqi.net/img/general/	/vQv8P8_hFNwHMmpR7k6-arr8zqYmmgoSG_aAPJuz-ws.jpg	public	itizyicecream
51e83b4a498e0a1c64e62828	https://irs1.4sqi.net/img/general/	/26624_AGoljLki5SS-GJGKaAGB75mloHKRBkJ1Qj5BQCRP1_Y.jpg	public	itizyicecream
51dd9efb498ebbc846c11c03	https://irs2.4sqi.net/img/general/	/13001992_b9dLXH02o0ZX8hyUZVtpgGW6sDyzAl23vmEl-0Hj0jY.jpg	public	itizyicecream
52407581498e6271e84d0d20	https://irs3.4sqi.net/img/general/	/663291_BQuSIJb2d0ODso7gvZiRLuvYbp3sg4FwHG2u0kAwsmE.jpg	public	gcnyc1
51eae36e498e58d50e5683ba	https://irs1.4sqi.net/img/general/	/331066_SArUzXa_cz_-YMQco1rwYAfU8a99TZCHJX9a2WA3fHg.jpg	public	gcnyc1
5267fa9611d2688bdc4587a2	https://irs0.4sqi.net/img/general/	/2136029_bvqot1MnMJ9IGYsYJkamqTiE_lL96OcfilWMxskhdU8.jpg	public	mooshugrill
525b3a3711d2040fdcbd6fee	https://irs3.4sqi.net/img/general/	/52031712_DN0C9vfm3iv1geUuFX92Pt0jwgl8NhbGokLj_o0Ebjg.jpg	public	mooshugrill
529fe66b498e1fd14afe696f	https://irs1.4sqi.net/img/general/	/68150_h0wbg6xbNwrEjXD6uaE12ZDZYF_h55LN99Es520nMBI.jpg	public	mooshugrill
5213a7c011d27a56f99dfba3	https://irs3.4sqi.net/img/general/	/11074699_K2ka1_NxiELyTqgjvY3oMN70IUxIlADqRIAb5QpzsLM.jpg	public	mooshugrill
4e09f3fca12d09aa881a769f	https://irs0.4sqi.net/img/general/	/NTSOFYDIBYVWGE4RYQTBBNIAQESPZ1LLW3Q4TC3TGMROSJPH.jpg	public	nautimobile
4e70e35c52b140871b6fa35f	https://irs1.4sqi.net/img/general/	/1TB5ROKJY5NF0GAVS4YS3WZTFCUXXHTPLLBUIK4BU0XD0QA5.jpg	public	nautimobile
5022f267011cfeafe81dab9a	https://irs1.4sqi.net/img/general/	/7EPnN8ReXYQWoZYxzqkH9AQlOe8vFPtVP_60n65i9U4.jpg	public	nautimobile
51ccc251498e028212e9b1e3	https://irs0.4sqi.net/img/general/	/117715_ozxp6K6iPGwKCzQDARR3BgMcisplkTt0x4LEKDJdBMk.jpg	public	nautimobile
5012e555e4b0dd18ec16bd37	https://irs2.4sqi.net/img/general/	/mZQAOCmv5lnRZ1qOUTwDXk-MLC-X-p01AfECgfLJC2I.jpg	public	schnitznthings
5109aed2e4b01d2a5b69b022	https://irs3.4sqi.net/img/general/	/117715_0jgrjk5IsUFppNAL0NtebyMYoz1JMdzrnWAIjrLMHZw.jpg	public	schnitznthings
516ef5ece4b0d1c83382c12f	https://irs0.4sqi.net/img/general/	/117715_Gt3J4FMusC7YQjSfEup4O7bAO10z8J4gxmnd0xKnZuQ.jpg	public	veganlunchtruck
505348ffe4b0669212770040	https://irs3.4sqi.net/img/general/	/30736334_CliHgKVfq-ToaH03Q0rISwFXpeOJXQvCidaefhyLfFA.jpg	public	veganlunchtruck
51105b22e4b0a7b61fac854b	https://irs2.4sqi.net/img/general/	/117715_vKu0po70jlTD3qN9mXsdNiE6V5Od1hmYMVlUY9xSIP8.jpg	public	veganlunchtruck
526e782b11d2a15e6fb663f3	https://irs3.4sqi.net/img/general/	/8761552_XH612BVbFNOBD2jJVEMDzyawnGF45FygNA3TtdKo6UE.jpg	public	veganlunchtruck
50ad186ae4b0b639ca7ca234	https://irs3.4sqi.net/img/general/	/295161_qCQYG0XjW1Ji0pSDxM7fWRzxTZRbcYyZbsbPNJo12hw.jpg	public	toastmonsternyc
521649b811d2913e20a1ae87	https://irs0.4sqi.net/img/general/	/5568483_RtMp5aDM_JtBZOI1u48Jy3om4Z672obezdu1uA_UWd0.jpg	public	toastmonsternyc
518a82c9498e068718057964	https://irs1.4sqi.net/img/general/	/25979758_bGWQQ7W2SJI4v7KmU891VcYZGitov6qbSNAnIEt8HTo.jpg	public	toastmonsternyc
5176cceb498efe500552cc9e	https://irs0.4sqi.net/img/general/	/21735785_zaQs-7anNinrrQlobBV2AjNxquTXs5g8ZY0NxvoxvHo.jpg	public	steaksncrepes
523b2edc11d265bf373f82a0	https://irs0.4sqi.net/img/general/	/8853695_cjpq3trk4bFpcU1oHWwj4XxwwD9ZI169sNncUyOQoM8.jpg	public	steaksncrepes
5243206b498e78230cd0770a	https://irs0.4sqi.net/img/general/	/54092198_eF4CEteD3zHjOCJzaYssyRXaQElB-GEOy2sqzBFQPm4.jpg	public	thegreenradish1
525ee647498ef229c65969fe	https://irs0.4sqi.net/img/general/	/10045965_ptbEO58Zn5wDz6kgitvMVjFScmxSkkuHNbK-AguCXSM.jpg	public	thegreenradish1
51c8a3c5498e797153ec5629	https://irs1.4sqi.net/img/general/	/46314126_95x6AErCZEGSi1zGZrFCY-EzgsIMyOhgO4G59l-u_Xg.jpg	public	funbunsnyc
5212ec18498e9494b634a94c	https://irs0.4sqi.net/img/general/	/814104_tUkLgiQ8zcYxovra9R8PIx7FckFhBjzNVHmirteXd58.jpg	public	funbunsnyc
4ffda271e4b03bbc7f8fd13a	https://irs1.4sqi.net/img/general/	/6Dtx8fj7IXT6M3O6ZV3rXryb6zKTAqPchjeOM2BJJAs.jpg	public	funbunsnyc
505204d6e4b02dee62bd961a	https://irs1.4sqi.net/img/general/	/dcOYoRoNNeCLMxvoyAN-o9gJObcw5FljMqYpS9cps84.jpg	public	funbunsnyc
51424d6ce4b0041cb8df9856	https://irs1.4sqi.net/img/general/	/117715_oxR8_TwNSaCL-_gKDA2i2-1YoRfVVnbfT3M9Bfu4nxE.jpg	public	thepocketful
51800af8e4b07a4a57023def	https://irs3.4sqi.net/img/general/	/9548073_erhzj0ShEDKaz8S8DhlDe90fDjJEIWjilIxO4_zjdGE.jpg	public	thepocketful
511a7d64e4b0c6a64118260c	https://irs1.4sqi.net/img/general/	/793192_Dtd9vMRk-pbBJscn1cb7n29zM87iJjZy6rojapRhODk.jpg	public	thepocketful
50a696b4e4b04d062582a95e	https://irs3.4sqi.net/img/general/	/32050404_qo6ZUnU5LQMoqrAR6YoH5Qz-PdUcD1d1jCheEJy7lng.jpg	public	thepocketful
519a7e33498e6e4ea6ff66f1	https://irs2.4sqi.net/img/general/	/3354_e_1JMupbEA8VtOBVXgLHAvtJGQwcpHvY2JyFESXYSjo.jpg	public	thesteelcart
5254357b498ec4662e20c654	https://irs2.4sqi.net/img/general/	/2620660_kMXeinZ_B6lOrHRQnheIHMBr7p81ZxcUblWl0SQ1vEs.jpg	public	thesteelcart
51dc0e71498e8db4f9a8106e	https://irs0.4sqi.net/img/general/	/4456614_ZWvsB80ogvwYkoKIyVf6q5RfcDXwuKI4t0XJJhyLQ_I.jpg	public	thesteelcart
4f753600e4b07eec20023ddb	https://irs2.4sqi.net/img/general/	/zUb4OswXiQLnF_k2xnx7AdupnEIl1nuGyIuFcmFWf8Q.jpg	public	thetreatstruck
4fbfe026e4b04422a08a40f6	https://irs3.4sqi.net/img/general/	/Han8Z4R-SQ615pLoN2lRdPfKEFa6UW2yudSOxXmJtts.jpg	public	thetreatstruck
51461b9de4b0bb73a6821e97	https://irs1.4sqi.net/img/general/	/1102787_UDt7OJpexNs8VPrehVDsp9EtfUJnMhKzJ2tTXuof06M.jpg	public	thetreatstruck
4fbfebe9e4b0a3bda0340383	https://irs0.4sqi.net/img/general/	/Brw9_z178IK92xMEXLCSSZrP0-99GXjutCp7dHCi5CQ.jpg	public	thetreatstruck
4fa2d04de4b0489ba3d7936d	https://irs2.4sqi.net/img/general/	/hsPbM0G5l3AsUaI3x6r_VkiSYo4pYlWTKK2S9zqh_KE.jpg	public	bigdsgrub
4e4e92c7b0fb088f3c0f14d5	https://irs2.4sqi.net/img/general/	/HTLXSW2D30RGIEYPI0JGR22LUCS5BTXQ0LXDWAOHH4PCVHM4.jpg	public	bigdsgrub
51dd9ddc498efb9a3437e123	https://irs3.4sqi.net/img/general/	/4501533_djr9d2BEP8dg7E48xJjJTa_Yjk0Iy-MmBG6hgIQBLUs.jpg	public	bigdsgrub
513101fce4b006d9c4991bdc	https://irs2.4sqi.net/img/general/	/17248619_XfpmI8dNgmoeHE3BXjV8bL2yuuMTqxU3FqDr4BqX7Ks.jpg	public	bigdsgrub
4fb6bb41e4b066430032e4ca	https://irs1.4sqi.net/img/general/	/HHZWTU3POi_yJE4GU0zI_NjZNerm5y3MjjxddcV5ZMs.jpg	public	rickshawtruck
4f8dc377e4b0ca2accf75652	https://irs0.4sqi.net/img/general/	/EKcue5yGEyaPnBymSd_HtBxWEZl4grYSOXMhw-gqpTs.jpg	public	rickshawtruck
513b9b7de4b04f7024bc158a	https://irs3.4sqi.net/img/general/	/45519738_eDUGOpHYwiR5C3VUps1gQ1YDIq0Di3WMfuirGs2EVBk.jpg	public	rickshawtruck
50ce2696e4b0881a7ef3ee67	https://irs2.4sqi.net/img/general/	/263293_lcA30Y_JnQGKaaHhRqFUio2HQ8UQkphCWP9yhW4CE3g.jpg	public	domotaco
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
5197fe76498e1c056c96d21b	https://irs1.4sqi.net/img/general/	/117715_m462oAqyqBN12xyWCOyzYR6-1gtYrUa8BiX9r9OybE8.jpg	public	kimchitruck
521f754c498ee4d6fbe8a778	https://irs2.4sqi.net/img/general/	/22491899_EEPqf4HeJFaaFjYabKyScGZ8symjXEgMjPUEkfpJsJk.jpg	public	morristruck
51856452498e6f602088cbe1	https://irs2.4sqi.net/img/general/	/232510_pLk3QUUWFOu82-4SX-ObtA8bw2ZPf61QBOeIuL50T-o.jpg	public	morristruck
51c213db498e0748ab0dca3c	https://irs0.4sqi.net/img/general/	/53641916_5aNKp9fdHx3i_Pi15Z_X6pE3fAsTX35YBQ0nlmZGfaA.jpg	public	morristruck
5180207390e7374e46b6c165	https://irs3.4sqi.net/img/general/	/49563206_uKsSD-Cd2jjy6FMyR9U_--7DdUBJ7ZUxtdlushxyIAg.jpg	public	freshandhearty
4e42f5ecaeb7f6be72c39c70	https://irs3.4sqi.net/img/general/	/JC5VO3Z50HMMMVLCCGWDQPMKF4W01VBXP1QS2LFESR55UHIX.jpg	public	fritesnmeats
506f12efe4b0bb9551703ca6	https://irs3.4sqi.net/img/general/	/2219480_LuuyF3peyimVfdQvb7tj9V-FHAEA0z1KmaSfMf9vKkU.jpg	public	fritesnmeats
4f832947e4b0cd6f644ef74a	https://irs2.4sqi.net/img/general/	/qCgaHGVJ9rFDkC5DFKEKLBBekoxb6PRDRfuWV7neue0.jpg	public	fritesnmeats
51a79983498e3044671cd784	https://irs0.4sqi.net/img/general/	/1441492_yfySwml4ChzJ_ni5DxTq-8n2UlecWBWjgxR-ygA6pYc.jpg	public	burgersandbites
51c1ea41498e372d91835cf9	https://irs0.4sqi.net/img/general/	/5067950_pSXIZo_RqO8Hh5AuWcomjr0p3q_pXPUMWe99W8hUGTU.jpg	public	burgersandbites
5220dc78498ebd10d150f736	https://irs0.4sqi.net/img/general/	/29917892_nMZHXkfxBukc2QfFqtDBTZSJ1xpMkoO7VGBJmGKkwhY.jpg	public	brooklynpopcorn
5258d3ef11d26d03cc0563a5	https://irs2.4sqi.net/img/general/	/117715_GQ_O1nyBbVlKTaYpRlprc8ZdIEAEftbU4_9hDGjvxsU.jpg	public	brooklynpopcorn
51dc5a9e498ebf7ad40223ec	https://irs3.4sqi.net/img/general/	/1328035_Ak3fMs2e36r7NvIE_gIDK5XZ9CwrW1DEJa3g1oobp5E.jpg	public	wingnitnyc
519babe8498e355d9d35fca0	https://irs2.4sqi.net/img/general/	/65817_6p9jSMaQMqP9QGn3KOIyuDOG15jaLxIPvsdrpZGWdj8.jpg	public	blend_express
5033cee6e4b03e64bc749ee7	https://irs0.4sqi.net/img/general/	/tIyy6IAKcw2SSiX5JSPBCURstZZisntK_46plgrfdJ0.jpg	public	blend_express
506dc9b9e4b0c21f078c3bb3	https://irs3.4sqi.net/img/general/	/22983_XN2GbKo3a5YsNY_ZpiBcjUHTD2if3TWS8r586Uq4cEk.jpg	public	blend_express
4fe20639e4b05dcdf7f5737c	https://irs2.4sqi.net/img/general/	/l9UdGGevddtOhDk6scQjcy1-TbVBX-wf8Gf56jBIRIg.jpg	public	bobjotruck
5249b1c511d23e54343ae083	https://irs0.4sqi.net/img/general/	/769710_HUiZ7dJrNbdnPYV-DTQRr1z0zgoxFx9KMC_Y-OQ6O2o.jpg	public	bobjotruck
5249b50c11d2d415e3c6b017	https://irs3.4sqi.net/img/general/	/769710_HOnpTjl0b6qd4-yoPpg9lXZGBy-ZKikqzLlFWw2sQfs.jpg	public	bobjotruck
51378e9ce4b071feb46ef7cc	https://irs3.4sqi.net/img/general/	/18792384_RSm8zhe_6kUOxy91taByfRjTDSLp7stH7PI41aJHOrU.jpg	public	bobjotruck
5199097e498ea36447e54093	https://irs1.4sqi.net/img/general/	/40899881_hbjUdavpBfT-sLaBhv3pbZydT1tgs9v-Maw12j9I3Xs.jpg	public	carpedonutnyc
5140cc96e4b0ef29f4802508	https://irs1.4sqi.net/img/general/	/4886503_z36ZXtYKGVIHcNLCR18ZdUWtpStRrbf33rInxsr2p1Q.jpg	public	mexicoblvd
525de1d7498ef4b27ada0847	https://irs1.4sqi.net/img/general/	/31827631_CApIgPWaXupe3toLi7iJLb6NxIyn2IDTOjAG0qw-PIk.jpg	public	mexicoblvd
50e71f82e4b07154c72fdc22	https://irs2.4sqi.net/img/general/	/275165_az4RUZ2U7-4cfdnQA1FlMrDLaxwCMriWtlhS_pddjEc.jpg	public	mexicoblvd
5245c79c498e057f7d5ff65d	https://irs0.4sqi.net/img/general/	/117715_CEghvDHaxkALy5RxQCAVW-kyM0TAZo2-fIT4e6veJeo.jpg	public	neaexpress
5298ff7011d22a38856168e2	https://irs1.4sqi.net/img/general/	/191726_GHXLJD8lsdPciKdqJErekl1SKPjw5k4N2YuNJC6JRTU.jpg	public	nuchasnyc
51118d62e4b063f95c18d16d	https://irs1.4sqi.net/img/general/	/191726_pTyD4DsW_jGt7E3QJJdH1QB-mHP1ZYggLzXtnZ7j3Oc.jpg	public	nuchasnyc
521cdb8011d2f79883b5be62	https://irs1.4sqi.net/img/general/	/36501880_zzNkJUOscINjy2aiwKSZEwjfQYJPjqmAsa6zS0dakp8.jpg	public	nuchasnyc
512bbfebe4b0b8faa466c796	https://irs0.4sqi.net/img/general/	/1425622_4wp7wCuj7Ci1dl_FVH9syKmrJwQavMhL9uqww1b0m1o.jpg	public	philssteaks
51645882e4b0bcb0cb0c7ef3	https://irs2.4sqi.net/img/general/	/7511393_dEJJLGO8ljFPMA_kFidoz1wpWZ-k6mHpqYnuRwoBpRg.jpg	public	philssteaks
527e77d111d2e66fa6a871b3	https://irs3.4sqi.net/img/general/	/649454_HIWthX8nL3SZAOwyMlKj9Y7ju9GCiN4OEV-wZR6IKC0.jpg	public	philssteaks
507071bfe4b06e882e74b445	https://irs1.4sqi.net/img/general/	/1112203_qnT5k-31-4cRKDz00cUpp7Ia7HG3YTjhsC9Udo90RDI.jpg	public	philssteaks
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
51194bbae4b0cd237850b223	https://irs1.4sqi.net/img/general/	/793192_FQUO1SFGyLkg5NRz6VUYl3_zmFgfy0Mh8gL1unO8ijM.jpg	public	mausamnyc
5086e523e4b02ca59cae7bd4	https://irs3.4sqi.net/img/general/	/2361939_1JvatS0wOUdQQIaTmd4Vmk8bgr7aFYOR7LaMkRio0X8.jpg	public	mausamnyc
513f646ce4b0b1892aaae1bc	https://irs2.4sqi.net/img/general/	/13285510_LmdJLKoCS9fSwm3wy96lcieTczjsLuxAEUnU3FlZDlo.jpg	public	mausamnyc
51f15b4d498ee58fec420a7c	https://irs3.4sqi.net/img/general/	/13285510_Q-SBXKFpfroSwQ-QJdezzrh1KaHfHAmLyicy8d5S1jU.jpg	public	parissandwich
5243126c498ea77b19b3a444	https://irs0.4sqi.net/img/general/	/65506790_31Qpx9E-ZjuNve-izmDY6vVxUCMrhgGsnOLn4-fusp4.jpg	public	parissandwich
51b22a0a498ec00d1c45726c	https://irs1.4sqi.net/img/general/	/390807_y2oeK6xR54wk9b1Sfm82Ek09Auv2lNkRTpJOzos3xjU.jpg	public	parissandwich
5239ddce11d2ab4765d5cc7f	https://irs3.4sqi.net/img/general/	/5568483_alwOH7sfGU8-pKfLmurfe9rt3pk2G6p90KwFyC6hq1A.jpg	public	sweetchilinyc
5208f543498eaeeaaad3ce52	https://irs2.4sqi.net/img/general/	/15629_P_UAUr_S-OO0R12wNp8LDPwr-ZbfPiWeG0Q0rrjW6Ww.jpg	public	sweetchilinyc
51f2be1f498e71235db5b61b	https://irs3.4sqi.net/img/general/	/117715_mGfGU0UGjUMhgqgwrDPf2f44NZtfMrobqJMF8ahsrjY.jpg	public	sweetchilinyc
50e719c2e4b0e263423e547e	https://irs3.4sqi.net/img/general/	/15471_4uN0tddGW5orNGh02xhxbiAOGUpAAy3rIWEotoRgB_M.jpg	public	tacobite
522245cd498e08037d275e1a	https://irs0.4sqi.net/img/general/	/1290097_g0wekB0Kkci5H6u618gI7WxvHlKAan1kUpaRIuTl2IM.jpg	public	waffletruck
4fd400ffe4b02d3b87199713	https://irs3.4sqi.net/img/general/	/hxqXK1dS5WiSz4AUwkzvl8s8oy4Y26e1px0MLW4ICuw.jpg	public	waffletruck
5280c18811d2e4df572063db	https://irs0.4sqi.net/img/general/	/5354893_5EtQmcwzMnTRFz9qbxjkt9FguCAC4xfW5xwUCyYIrbQ.jpg	public	waffletruck
527e823311d2db75dd831ee0	https://irs0.4sqi.net/img/general/	/22419482_1rrrm4nhOKXQsXN25ApmVsGDw4t2J3GyjhfeQPEbClU.jpg	public	waffletruck
51f4589a498e97316d307dab	https://irs1.4sqi.net/img/general/	/186827_ilvLMlb3AFqgXUQJ43S7IjsLNPxYP3Pw5LEjrqhp6wI.jpg	public	chipsykingny
514e42c7e4b0ec8b7e400875	https://irs3.4sqi.net/img/general/	/48992751_ibL8tx_7JPvV3aQmnEevrdibtLP0jWytaChkCdRuhG8.jpg	public	crafflesnyc
514e42a8e4b0d91e975b3db9	https://irs1.4sqi.net/img/general/	/48992751_womoOVd5bv-2KopmWjWEHA_WsyoWQITjAyXBuM4Ciz8.jpg	public	crafflesnyc
\.


--
-- Data for Name: trucks; Type: TABLE DATA; Schema: public; Owner: pepp
--

COPY trucks (id, name, twitname, weburl, tweet, street, location, retweeted, region, regex, lasttweet, lastupdate, type, about, foursquare) FROM stdin;
gorilla1	Gorilla Cheese 1	gcnyc1	http://www.gorillacheesenyc.com/	G1-36/6\nG2 - 26th 11/12\nCheesy Mac & Rib Melt:\nCheddar, pulled pork , mac & cheese , caramelized onions, bbq.\ncomtothecheeseyo	36	 36 / 6 	f	up	g1(.*?)(\\n|g2)	1386177458	1386177458	American		4dc2d3e352b1c1fb37f1e945
taim	Taim Mobile	taimmobile	http://www.taimmobile.com/	Spinach Jalapeno falafel is back by request on 20th/5th. Hot Black Bean soup is in the pot. And sufganiyots are available for the last time.	20	 20th / 5th  	f	mid	\N	1386198209	1386175049	Mediterranean		4cf2c5321d18a143951b5cec
mamuthai	Mamu Thai Noodle	mamuthainoodle	https://www.facebook.com/MamuThaiNoodle	Rain or shine, we are here to feed you Dumbo! Come for your noodle fix! @DUMBOFoodTrucks @dumbolot 11-3pm Jay&Water eatthainoodles	DUMBO	DUMBOFoodTrucks	f	bkl	\N	1386179480	1385133950	Thai		5126a10ae4b0af674c85f353
mexicue	Mexicue	mexicue	http://mexicueny.com	18th and 5th...we are here to get you through the holiday gap!	18	18th and 5th   	f	mid	\N	1386208814	1386172503	Mexican		4c51a6a71c67ef3ba6b61ab9
getstuffed	Momos & Buns	getstuffednow	http://www.chinesemirch.com	Our last time this year @BrookfieldPLNY , pls come , get your lunchbowl & say 'see u soon' 'cause we never say goodbye !	brookfieldplny	brookfieldplny	f	none	\N	1385861073	1384795878	Chinese Fusion		4fa016cbe4b05d0fc11262c5
palenque	Palenque	palenquefood	http://www.palenquehomemadecolombianfood.com	Soup Of the day is "beef sancocho" comento wall at and hanover to get it! Yummmmm	wall	 wall at and hanover 	f	none	\N	1386203244	1386089035	Colombian Fusion		4e84f424dab45bbd2617dc62
sweetery	Sweetery	sweeterynyc	http://sweeterynyc.com	Final location on @FoodNetworkMagPromo Sweetery truck tour, Broadway btw 53rd& 52ndSt, we are open 2 give away free gingerbread cookies NOW!	53	 Broadway btw 53rd& 52nd	f	up	\N	1386200861	1386191292	Sweets		4a28d919f964a52056951fe3
carls	Carl's Steaks	carlssteaks	http://carlssteaks.com/home/	Happy HUMMMP DAY! 49th st bet 6/7th ave 11-3 cheesesteaks for the masses!  @FoxNews @Barclays @MHEducation @MHFI  GOT WHIZ?	49	 49th st bet 6 / 7th 	f	up	\N	1386169259	1386169259	American		51a78330498e3fc1f22d771e
mikenwillie	Mike n Willie's	mikenwillies	http://www.mikenwillies.com	Surprise Midtown we are on 56th Street & Broadway get your fix before Turkey Day!  tacos sliders burritos comegetsome	56	 56th Street & Broad	f	up	\N	1385652245	1385479481	TexMex		4f205f0ee4b0294b35a1178b
dels	Del's	delsnyc	http://instagram.com/delsnyc	RT @DUMBOFoodTrucks: You may have seen the @delsnyc truck around DUMBO this summer - help them raise $ for another one on @kickstarter! htt...	DUMBO	DUMBOFoodTrucks	t	bkl	\N	1384186749	1383928941	Sweets		519bb56b498ed2dfa950ace2
eddiespizza	Eddie's Pizza	eddiespizzany	http://www.eddiespizzany.com/	If you are going to the tree lighting tonight come and see us for dinner. We are Park d on 43st between 5th&6th... http://t.co/SP6g2J9k7W	43	 Park d on 43st between 5th & 6th	f	up	\N	1386185597	1386185597	Pizza		4c0cf412b4c6d13ae4850c30
goburger	GO Burger	goburger	http://www.goburger.com	We've moved to East 4th and Broadway for dinner!	none	 4th and Broad	f	none	\N	1386194309	1386194309	American		4c06b3eccf8c76b0a4eb3a65
mamak	Mamak	lovemamak	http://www.lovemamak.com/	We are at 7 Hanover Square and 21st and 5th Ave hungry	Hanover	 7 Hanover Square and 21st and 5th 	f	none	\N	1386183667	1385484073	Asian		51c4cffa498ec876f564a0b4
lobstertruck	Red Hook Lobster	lobstertruckny	http://redhooklobster.com/	BigRed just got kicked outta 52nd & 6th and is on the prowl for a new home. Stay tuned! lifeofafoodtruck	52	 52nd & 6th and 	f	up	\N	1386177895	1386175952	\N		4dc597c57d8b14fb462ed076
korilla	Korilla BBQ	korillabbq	http://korillabbq.com	We're ready for you DUMBO @Water st & Jay st! Sorry no tofu today!	Water st & Jay	@Water st & Jay st! 	f	bkl	\N	1386195456	1385140021	Korean Fusion		4cc701aa01fb236ab070baba
milktruck	Milk Truck	milktrucknyc	http://www.milktrucknyc.com	Bessie's at 58th & Mad, call (646) 504-6455 to pre-order. Sandwich menu always at @HoustonHall_NY	58	 58th & Mad  	f	up	\N	1386176655	1386169236	American		4e823c0229c2dbb2b7043972
polish	Old Traditional Polish Cuisine	polishcuisine	https://www.facebook.com/pages/Old-Traditional-Polish-Cuisine/315496671902708	We are back on the block! Broadway b/w 55th and 56th street - ready by 11:20! @midtownlunch	55	 Broadway b / w 55th and 56th str	f	up	\N	1386187454	1386170539	Polish		51435df4e4b0823a398ebc8a
mrnice	Mr Nice Guy	mrniceguytruck	http://mrniceguynyc.com	49th N 6th with your favorite sliders today!	49	49th N 6th 	f	up	\N	1386082311	1386082311	American		520bbbb211d26afae232ec59
seoul	Seoul Food	seoulfoodnyc	http://www.seoulfoodnyc.com	I know you are already thinking about lunch! We are already at 46th between 5th & 6th.....sneak out of your office... http://t.co/7NWuyuV6ZN	46	 46th between 5th & 6th	f	up	\N	1380282677	1380282677	Asian		4e74afad88775d593d9a7eb5
shortys	Shortys	shortysnyc	http://www.shortysnyc.com	86th & Lex.  Ready for dinner!	86	86th & Lex   	f	up	\N	1386215995	1386195252	American		4faea2cce4b08a88c5dc5d05
toum	Toum NYC	toumnyc	https://www.facebook.com/ToumNYC	Find us Dec. 6th & 7th at BeerFest! Chase a beer with shawarma goodness. Get your tickets here: http://t.co/isK5WuK5i6 LSBeerFest tapthis	none	 6th & 7th at 	f	none	\N	1386194702	1386194702	Lebanese		500eedb0e4b062ee00577957
valduccis	Valduccis	valduccis	http://valduccis.com	HappyHumpDay @DritaDavanzo @MobWives mobwivesnewblood Eat @Valduccis 49th&6th Free Zepolle http://t.co/XkHJidKTnA	49	 49th & 6th 	f	up	\N	1386180045	1386180045	Pizza		4df7e1aad4c02ad734170b21
biandang	Bian Dang	biandangnyc	http://www.biandangnyc.com/	RT @mooshugrill: Have you heard the goodnews? MSG is back on 53rd&park! nomsgtho midtown homecoming @midtownlunch @nystfood	53	53rd street between Park and Lexington avenue	t	up	\N	1386212678	1386174094	Taiwanese		4d712874722ef04d04160d9c
itizy	Itizy Ice Cream	itizyicecream	http://www.itizy.com/	Likely our last three hours at Columbia this year! Come grab a scoop of your favorite flavor before it runs out!	none	Columbia	f	none	\N	1382307419	1382122482	Sweets		4fcbdcaae4b00a0e855124dd
gorilla2	Gorilla Cheese 2	gcnyc1	http://t.co/4ZDqfwSH5f	G1-36/6\nG2 - 26th 11/12\nCheesy Mac & Rib Melt:\nCheddar, pulled pork , mac & cheese , caramelized onions, bbq.\ncomtothecheeseyo	26	 26th 11 / 12 	f	mid	g2(.*?)(\\n|$|#)	1386177458	1386177458	American		4dc2d3e352b1c1fb37f1e945
mooshu	Moo Shu	mooshugrill	http://www.mooshugrill.com	Have you heard the goodnews? MSG is back on 53rd&park! nomsgtho midtown homecoming @midtownlunch @nystfood	53	 53rd & park	f	up	\N	1386173342	1386170563	Chinese	Moo Shu grill is a slight twist on typical Chinese <a href="https://en.wikipedia.org/wiki/Moo_shu" target="_blank">moo shu</a> The three Moo Shus option is enough for lunch and you can pick and choose a different protein for each. In my opinion the chicken is the best but it is dark meat. </p><p>It's easy to order as there is one window for ordering and for picking up when your name is called.	52090e45498e5500a6bd41fb
lukeslobster	Luke's Lobster	nautimobile	http://lukeslobster.com/	What should we get our moms for Christmas? We have a hippy, a nerd, and a wildcard. Bring your ideas to 46th and park today!	46	 46th and park 	f	up	\N	1386203035	1385996697	Seafood		4dc81239b0fb5556cd2f3023
miamifood	Miami Food Machine	miamimachinenyc	http://www.miamifoodmachinenyc.com/	RT @DispatchBP: . @BrookfieldPLNY NORTH Lot 11/07/13: @fritesnmeats @MiamiMachineNYC @Palenquefood @milktrucknyc @TaimMobile - N. End Ave. ...	brookfieldplny	brookfieldplny	t	none	\N	1385561777	1383837070	Mexican		514b53aee4b00c3e98ec25e9
schnitzel	Schnitzel & Things	schnitznthings	http://schnitzelandthings.com	Had a difficult time finding parking for the truck!ALERT we are on 55th street & 6th avenue from 11:45-2pm Schnitztruck 55th & 6th	55	 55th street & 6th aven	f	up	\N	1386173994	1386173994	German		4a6640b3f964a5204cc81fe3
cinnamonsnail	The Cinnamon Snail	veganlunchtruck	http://www.cinnamonsnail.com/	Parked on 55th and Broadway from 9am to 3pm\n\nWe have Red Curry Grilled Tofu Bahn Mi with pickled onions and... http://t.co/8aOQz763tF	55	 55th and Broad	f	up	\N	1386196290	1386163726	Vegan		4c263af6a852c9287537e66c
toastmonster	Toast Monster	toastmonsternyc	http://www.toastmonsternyc.com/	Herro 50th and 6th, New York. Today is Toast Monster's last day of the year. Stay toastie! Keep it breezy! Rawr!	50	 50th and 6th    	f	up	\N	1385488135	1384529054	American		50ad1829e4b087613d696bc4
steaksncrepes	Steaks N Crepes	steaksncrepes	http://steaksncrepes.com	50 st bet 6 & 7 ave for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	50	50 st bet 6 & 7 ave for lu	f	up	\N	1374766188	1374766188	American		50f44167e4b0af5bf46321ce
greenradish	The Green Radish	thegreenradish1	http://www.thegreenradish.com/	TGR Loves NYC!  Find Us Today, Wed, @38th&Bway, 11to2pm, govegan, veganlunch, @anntaylor, @tartecosmetics,... http://t.co/AWGGzesLn0	38	@38th & Bway  11	f	up	\N	1386215394	1386163627	Vegan		5229feab11d2edde794d385c
funbuns	Fun Buns	funbunsnyc	http://j24f.com/funbuns/	47th st btwn Park and Madison ! Our last day of the season. Grab some funbunsnyc before we're gone for the year !	47	47th st btwn Park and Mad	f	up	\N	1383427654	1383226631	Asian		4f8d9663e4b021137aa2bdde
pocketful	The Pocketful	thepocketful	http://thepocketful.com/	Located on Hudson and King streets. Online at http://t.co/6h7IrKccpj	none	 Hudson and King str	f	none	\N	1386004676	1386004676	Mediterranean		4db8bcd790a0e3f61d601888
steelcart	The Steel Cart	thesteelcart	http://www.thesteelcart.com/	Friends of Park & 47th, we're here through lunch. (Close to Vanderbilt.) The soup is a Creamy Corn Chowder.	47	 Park & 47th  	f	up	\N	1386170693	1386170693	French		511d3abee4b0e188895f3697
treats	The Treats Truck	thetreatstruck	http://www.treatstruck.com	!!! Wed, Dec 4th 3:30-7pm 18th st & 7th ave! Happy last night of Hanukkah!!!	18	 4th 3:  18th st & 7th ave	f	mid	\N	1386189173	1386189173	Sweets		49e65021f964a52035641fe3
bigds	Big D's	bigdsgrub	http://bigdsgrub.com/	Lunchtime Grub awaits you at 55th Street and Broadway, now till' 2:30pm. Preorders call 646-543-BIGD	55	 55th Street and Broad	f	up	\N	1386210276	1386174559	Korean Fusion		4c968b907605199c2eaec2a3
rickshaw	Rickshaw Truck	rickshawtruck	http://www.rickshawdumplings.com/	Starrett! You are in luck! Danny is on his way to make your dumpling day! 26+11av	26	 26 + 11av	f	mid	\N	1384441694	1384441694	Asian		43fc8419f964a520ed2f1fe3
domo	Domo Taco	domotaco	http://www.domotaco.com	DUMBO today @dumbolot. @dumbofoodtrucks @dumbonyc	dumbo	dumbolot	f	bkl	\N	1386207837	1386171222	Asian Fusion		4ed90a2e77c8274efb746d83
disos	DiSO's	disosnyc	http://www.disosnyc.com/	Soho lunch today! Varick and Charlton corner spot.\n\nCall it in to pick up: 917-756-4145\n\nCiao	Varick	 Varick and Charlton 	f	none	\N	1386173580	1386167764	Italian Sandwiches	These might be typical italian sandwiches but the ingredients are high quality. You need to get there early because the line can get long and they will run out of some breads. I believe the focaccia half is a normal portion for lunch while their half and hero sizes are pretty big.	519523d6498eeaa6200aad03
grillwheels	Grill On Wheels	grillonwheelsny	#	Giving our employees 8 days of holiday is the best way of saying THANKS! And a BIG THANK U 2 U!\nSee u all in 8 days! Happy Thanksgivukkah!	none	 8 days of holiday is the best way of saying THANKS! And a BIG THANK U 2 U! See u all in 8 	f	none	\N	1385563623	1385563623	Kosher		51b0bf31498e9b68db75612c
phils0	Phil's Steaks Big Jawn	philssteaks	http://www.philssteaks.com/	Morning NYC! 2 locations serving hot delicious breakfast today: \n\nOG Jawn: Water & Wall \n\nBIG Jawn: 41st btwn 6th... http://t.co/PjE7yImLyK	41	 41st btwn 6th 	f	up	big( jawn)?( in|:| ?-| is on| on) (.*?)(\\n|$|!|\\.)	1386207720	1386164367	American		4f15b382e4b0725660ea9f31
kimchitaco	Kimchi Taco	kimchitruck	http://kimchitacotruck.com/	Another boootiful day. Spend it w/ us at 55th St. bet. 6th & 7th Ave. 11:30-2:30	55	 55th St  bet  6th & 7th Ave   	f	up	\N	1386178840	1386166660	Korean Fusion		4d6ee122b45b59417c6a6778
morris	Morris Grilled Cheese	morristruck	http://morrisgrilledcheese.com/	OY, DUMBO! Come over to Pearl & Front- we've got delicious grilled cheeses and crisp cider. Eat your heart out! WeKnowCPR	Pearl & Front	 Pearl & Front	f	bkl	\N	1386208895	1386178832	American		4e0e0b3caeb7a5b33ee5dac1
freshhearty	Fresh and Hearty	freshandhearty	http://freshandheartynyc.com/	Fresh and Hearty serving lunch in Flatiron on 5th ave btw 17st & 18st from 11:30am to 3pm paninis soups salads wraps @midtownlunch	17	 5th ave btw 17st & 18st 	f	mid	\N	1386173982	1386173982	Soup/Salad/Sandwich		51801f7a90e7374e46b6239f
frites	Frites 'N Meats	fritesnmeats	http://www.fritesnmeats.com/	Hello soho! Lunch 2day @ Hudson & king burger of the week THE AO TRUFFLE BURGER preorder 9172929226	none	 Hudson & king 	f	none	\N	1386169767	1386169767	American	This is a good burger but this truck is interesting because of the many toppings they carry and their burger of the week. 	4ae9d217f964a520bcb621e3
burgersn	Trusty Burgers & Bites	burgersandbites	http://www.burgersandbites.com/	Ready to rock in dumbo! Burger Thursday all day on water and jay! @Carrot @_TommyDee_ @Bklyneats @Brokelyn @DUMBOFoodTrucks @EaterWire yum	water and jay	 water and jay	f	bkl	\N	1385050796	1383232098	American		5170143a498e802b42628e48
brooklynpopcorn	Brooklyn Popcorn	brooklynpopcorn	http://brooklynpopcorn.com/	Brooklyn Popcorn Truck on 39 and broadway are new flavor Ranch is crazy	39	 39 and broad	f	up	\N	1386181820	1386181820	Popcorn!		514a0737e4b09c3e77279d83
wingit	Wing'n It	wingnitnyc	http://www.wingnitnyc.com/	Out here on 47th between Park and Lexington. Come get some wings for lunch today.	47	 47th between Park and Lex	f	up	\N	1386160771	1385476363	American		519ffd2b498ededbeef3c073
blend	Blend	blend_express	http://blen02.wix.com/blendnyc	We will not be parking on HUDSON and KING anymore ....   Hopefully only at least for this year	none	 parking on HUDSON and KING an	f	none	\N	1383317024	1383316855	Latin Fusion		4fa94528e4b0f8fbf13317e6
bobjo	BobJo	bobjotruck	http://www.bobjo.net	Bobjo express will open at 49st & 3rd ave.\nThanks!	49	 49st & 3rd ave  	f	up	\N	1386177191	1386176968	\N		4e3add0c88772c3bf12772da
carpedonut	Carpe Donut	carpedonutnyc	http://carpedonutnyc.com/	Hooray for donuts!  23rd and Park until 5:30pm.	23	 23rd and Park 	f	mid	\N	1386159822	1386159822	Sweets	They only server one kind of donut here, the apple cider, but it's a pretty good one. They are fresh and still hot when you get them. They have donut ice cream sandwiches but you should know the entire thing is in the freezer so you will get a frozen donut as well.	5169892c498e0522481eea97
mexicoblvd	Mexico Blvd.	mexicoblvd	http://mexicoblvd.com	RT @DispatchBP: . @BrookfieldPlNY NORTH Lot | Dec. 4th | @MexicoBlvd @MikeNWillies @MamuThaiNoodle | N. End Ave. & Vesey | 11a-3pm.	brookfieldplny	brookfieldplny	t	none	\N	1386173612	1386173612	Mexican		4f4e55aee4b04c96fba5b149
shanghai	Shanghai Sogo	shanghaisogo	http://www.shanghaisogo.com/	Midtown west. The weather is beautiful. Come get ur Asian tapas from us. We r @ 55~56th st & broadway.11~3pm. Come out one. Come out all.	55	 55 56th st & broad	f	up	\N	1386175528	1386166904	Asian		5258369d498e13def2bef2cb
wafelKastaar	Wafels & Dinges Kastaar	waffletruck	http://www.wafelsanddinges.com/	Tasty Tuesday!  \nMomma Truck is at Columbus & 91st till 4:31p! \nKastaar is at NYU Stern at W 4th & Greene till 10p	none	 4th & Greene 	f	none	kastaar( truck)? (.*?)(all day|till?|until|\\n)	1386214246	1386085490	Belgian		4a416369f964a52036a51fe3
phils3	Phil's Steaks OG Jawn	philssteaks	http://www.philssteaks.com	Morning NYC! 2 locations serving hot delicious breakfast today: \n\nOG Jawn: Water & Wall \n\nBIG Jawn: 41st btwn 6th... http://t.co/PjE7yImLyK	Wall	 Water & Wall  	f	none	og( jawn)?( in|:| ?-| is on| on) (.*?)(\\n|$|!|\\.)	1386207720	1386164367	American		4f15b382e4b0725660ea9f31
neapolitan	Neapolitan Express	neaexpress	http://neapolitanexpress.com/	49th & 6th! Ready for some authentic flavor?	49	49th & 6th	f	up	\N	1386199835	1386180141	Pizza		51c8864c498e0ac96c14433e
nuchas	Nuchas	nuchasnyc	http://www.nuchas.com	hey flatiron munchies, we just parked on 21st & 5th ave! for lunch.  luckyspot luckyyou empanadas	21	 21st & 5th ave	f	mid	\N	1386211019	1386179211	Mexican		4ebd2a9bb8f7b504a754c130
phils1	Phil's Steaks Lil Jawn	philssteaks	http://www.philssteaks.com	2 jawns out today!\\n\\nBig Jawn - 41st btw 6th n B'Way til 2. \\n\\nLil Jawn - North End Ave n Vesey St til 2.	Vesey	 North End Ave n Vesey St 	f	none	lil jawn( in|:| -) (.*?)(\\n|$)	1386207720	1383670328	American		4f15b382e4b0725660ea9f31
chefsamir	Comme Ci, Comme Ca	chefsamirtruck	http://www.chefsamirtruck.com	On 52 st and park av!!!	52	 52 st and park av	f	up	\N	1386178269	1386178269	Moroccan		4c3c85e3a9509c74b52e395b
crepestruck	Crepes Truck	thecrepestruck	https://www.facebook.com/thecrepestruck	VictoriaJustice at Uggs Aulstralia on Madison Ave & 58 Street tonight from 6:30pm-8pm	58	 Madison Ave & 58 Str	f	up	\N	1383866974	1383866974	Crepes		4dfb854918386e743d9869e3
mactruck	MacTruck	mactruckny	http://MacTruckNYC.com	RT @DispatchBP: . @BrookfieldPlNY SOUTH Lot | Dec. 3rd | @MacTruckNY | S. End Ave. & Liberty St. | 11a-3pm.	brookfieldplny	brookfieldplny	t	none	\N	1386097693	1386086230	American	Looking to take a nap after lunch? This truck is great and the owner is incredibly friendly. Feel free to chat it up while you watch him prepare your food.  Not listed on the menu are the many condiments\\n you can get on your macaroni. The regular size is a good portion for a normal lunch.	50575ab8e4b04ed4f2197dac
mausam	Mausam	mausamnyc	http://www.mausamnyc.com	We r serving lunch on 47st between park and madison.have a nice day thnku	47	 47st between park and mad	f	up	\N	1386175459	1386175459	Indian		50730eebe4b0f3224431dc5d
paris	Paris Sandwich	parissandwich	http://www.parissandwiches.com/	Dumbo! Adams and front street today dumbofoodtrucks @DUMBOFoodTrucks	none	 Adams and front str	f	none	\N	1384444210	1382711724	French/Vietnamese		519e4ed0498e4f27e64c177a
sweetchili	Sweet Chili	sweetchilinyc	http://sweetchilinyc.com/	RT @DispatchBP: . @BrookfieldPlNY SOUTH Lot | Dec. 4th | @SweetChiliNYC & @ESTacoTruck | S. End Ave. & Liberty St. | Serving 11a-3pm. | fo...	brookfieldplny	brookfieldplny	t	none	\N	1386211031	1386170638	Asian		51a8c802498e2165ca855a19
tacobite	Taco Bite	tacobite	http://www.tacobite.com/	Serving Lunch on 46th st\nBet Park Av/Madison Av\nOn Vanderbilt Av	46	 46th st Bet Park Av / Mad	f	up	\N	1386187043	1386176203	Mexican		503ba49ae4b0fad35eb7a8dc
wafelMomma	Wafels & Dinges Momma	waffletruck	http://www.wafelsanddinges.com/	Wafel Wednesday!  \nMomma Truck is at 60 Wall St till 4:01p Goesting @ Broadway & 66th til 9pm	Wall	60 Wall	f	none	momma( truck)? (.*?)(all day|till?|until|\\n)	1386214246	1386168625	Belgian		4a416369f964a52036a51fe3
chipsy	Chipsy King	chipsykingny	http://chipsykingny.com/	Happy Wednesday \nKasar truck is at 91st and Columbus \nJoin us	91	 91st and Columbus  	f	up	\N	1386177376	1386177376	Fries		51bb5c43498ee06e13d0d31f
craffels	Craffles	crafflesnyc	http://www.craffles.com/	Come check us out.\n42 st and 6th ave until 11pm                  and 47th st and Broadway until 1 am	42	 42 st and 6th ave 	f	up	\N	1385946162	1385946162	Crepes		514e426ce4b05bcb261d910e
\.


--
-- Data for Name: tweets; Type: TABLE DATA; Schema: public; Owner: pepp
--

COPY tweets (contents, "time", id, retweeted, twitname) FROM stdin;
RT @fourwheelfoodie: FWFave: Mexican and Asian influences combine to make @bigdsgrub an easy favorite for anyone with an adventurous palate	1386122152	408052001084567552	f	bigdsgrub
Hudson Street and West Houston	1386089530	407915173878714368	f	bigdsgrub
RT @12BarsNYC: @bigdsgrub Please RT for #GivingTuesday! Support @FoodBank4NYC at Saurday's 12 Bars of Xmas charity bar crawl. http://t.co/U...	1386088569	407911143110615040	f	bigdsgrub
Lunchtime Grub is ready #SoHo / #WestVillage! LET'S GOOOOO!!! Preorders call 646-543-BIGD	1386087892	407908301838774272	f	bigdsgrub
@CambodianCowboy @tridizzay you guys are #HARDCORE!! http://t.co/p8AkUyJJ1Z	1386084656	407894729163300864	f	bigdsgrub
Hello #SoHo! #SoHoTuesday #TacoTuesday	1386080514	407877358293897216	f	bigdsgrub
RT @CambodianCowboy: New rule: check @bigdsgrub twitter feed BEFORE heading out into the cold.  They're on 56th and Broadway.  Success!! Wi...	1386080418	407876953132507136	f	bigdsgrub
Lunchtime Grub awaits you at Broadway and 56th Street, now till' 2:30pm. Preorders call 646-543-BIGD #MidtownWest #TGIM LET'S GOOO!!	1386002545	407550331682570242	f	bigdsgrub
Welcome back to work! Come n' Grub today at Broadway and 55th Street. Preorders call 646-543-BIGD #MidtownWest	1385993806	407513675009110017	f	bigdsgrub
What's up Grubbers?	1385740545	406451423648677888	f	bigdsgrub
We're thankful for our fans and your business. Happy Thanksgiving everyone, it's turkey....until Monday! http://t.co/cH5UhRT1Xr	1385651570	406078236243030016	f	bigdsgrub
Gooble Gooble! We're off the road until Monday...so "Turkey" will have to do until then.  Be dry, be safe... #Thankful	1385567044	405723707622322176	f	bigdsgrub
Be different this #Thanksgiving and try our Spicy #Pork! http://t.co/CBdGB6QFXr	1385484555	405377724484960256	f	bigdsgrub
Join us today at 50th street btwn 6th and 7th Ave for lunch, 11am to 2:30pm. Beat the cold and call 646-543-BIGD to preorder!! #MidtownWest	1385474838	405336968688447488	f	bigdsgrub
Thanks Ryan..our pleasure! RT @1337Ryan: Best part about the first day back to work is @bigdsgrub for lunch.  So damn good.	1385409100	405061240827150337	f	bigdsgrub
Free Old Bay fries w/ any taco trio, grinder or rice bowl today if you check in on Yelp!	1385399039	405019041926246400	f	bigdsgrub
Come warm up with us at 49th Street btwn 6th and 7th Ave, 11am to 2:30pm Preorders 646-543-BIGD #TGIM http://t.co/9lO0dJqDZw	1385389497	404979020485632001	f	bigdsgrub
Lunchtime Grub awaits you #MidtownWest. 50th Street btwn 6th and 7th Avenue, now till' 2:45pm. Preorders call 646-543-BIGD	1385049937	403554802925596672	f	bigdsgrub
You know the drill... It's THAT time of the week.  50th Street btwn 6th and 7th Avenue. 11am to 2:45pm. Preorders call 646-543-BIGD	1385042621	403524119284965376	f	bigdsgrub
It's something important to us RT @behindfoodcarts: @bigdsgrub @ChefArtSmith @NYDailyNews Love this initiative of diabetes friendly dishes!	1385042436	403523344039170048	f	bigdsgrub
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
we are located today on park avenue between 26th and 27th street. Call ahead your order for a 270 calorie bar pie! 917-439-7522	1386079545	407873292779810816	f	eddiespizzany
601 west 26th st for lunch until 3p. Call ahead your order 917 439 7522	1386001756	407547020182708224	f	eddiespizzany
46th between 5th and 6th for lunch until 3. Call ahead your order 917 439 7522 http://t.co/0r6OMLTYbA	1385567351	405724994594144256	f	eddiespizzany
World financial center until 3p today. Call ahead 917 439 7522	1385481975	405366902559485953	f	eddiespizzany
RT @EaterNY: @smorgasburg is getting a giant winter location and going year-round. Guest appearances by Pat LaFrieda and more: http://t.co/...	1385481836	405366320461803520	f	eddiespizzany
Unless you have an army of flying monkeys you have no reason why this rain should keep you from getting your... http://t.co/PxqrXkmh1K	1385131859	403898408890425345	f	eddiespizzany
Its dinner time. We are parked on 71st &amp; 3rd Ave. Treat yourself or your family to some Eddie's Pizza tonight. http://t.co/WHJGh3pqhR	1385068760	403633753886453760	f	eddiespizzany
Chicken Bacon Bleu Yummiest http://t.co/xsQIwCUvRa	1383224916	395900108979830784	f	gcnyc1
Come see us and get a hot and fresh pizza or sandwich. We are parked in front of 10 Hanover Square. Looking forward to seeing you.	1385051396	403560924331528194	f	eddiespizzany
46th between 5 and 6 for lunch today. Call ahead 917 439 7522. No dinner tonight.	1384969663	403218111509192704	f	eddiespizzany
RT @smorgasburg: What's that you say? Only one more weekend outdoors? And then Smorg and The Flea combine forces under one roof?! http://t....	1384911501	402974159581364224	f	eddiespizzany
I posted a new photo to Facebook http://t.co/69DZoV8RTP	1384531813	401381633321754624	f	eddiespizzany
You know what time it is.DINNER TIME! 71st and 3rd!	1384463894	401096759847694336	f	eddiespizzany
Correction: Eddies will be between Front and Water for lunch!	1384441160	401001406167273472	f	eddiespizzany
I posted a new photo to Facebook http://t.co/HldEFyG2qh	1384438787	400991455386537985	f	eddiespizzany
71St and 3rd for dinner!	1384379500	400742785776902144	f	eddiespizzany
Hot &amp; Fresh	1384374667	400722515539918848	f	eddiespizzany
46 between 5 and 6 for lunch today until 3. Dinner tonight on UES	1384364551	400680085847425024	f	eddiespizzany
Lunch today on 26th and 12th!	1384187090	399935759068962816	f	eddiespizzany
Have a hot pizza or hot hero from Eddie's Pizza on Varick and Charleston today!	1383928106	398849501202350080	f	eddiespizzany
VARICK AND CHARLTON today for lunch. Until 3p. Call ahead your order 917 439 7522	1383920550	398817811445067776	f	eddiespizzany
RT @i8and8: Brisk weather definitely calls for some @lovemamak comfort food. #FeedYourSoul http://t.co/VJeV6J1Eku	1386006319	407566159215886336	f	lovemamak
@mitchelltoga Monday- Friday only	1385836948	406855767099469825	f	lovemamak
We are at 7 Hanover Square and 21st and 5th Ave #hungry	1385484073	405375701337268224	f	lovemamak
Only at 21st and 5th Ave today until 3.30pm	1385396842	405009829057798144	f	lovemamak
@viverswong @MaMakRendang yes	1385388124	404973263128109056	f	lovemamak
RT @HBOboxing: Final @CompuBox numbers: @MannyPacquiao - 281/790 @Brandon_Rios1 138/502 #PacRios	1385271143	404482606936621056	f	lovemamak
@trboxing @MannyPacquiao job done!! $ in the bank!	1385271112	404482477018062849	f	lovemamak
RT @trboxing: @MannyPacquiao wins by Unanimous Decision. Scores: 120-108, 119-109, 118-110. #PacRios	1385271066	404482284981850112	f	lovemamak
RT @michaeljosh: Football superstar David Beckham flew to Macau to cheer on Pacquiao.  #PacRios #RStream http://t.co/nd3Xh629r7	1385270248	404478855987343360	f	lovemamak
@derthere yes we are	1385156684	404002532839948288	f	lovemamak
7 Hanover sq lunch as well! Come by!	1385140152	403933193352802304	f	lovemamak
Yes we are back at 21st and 5th ave! Same spot!! How's was the #Rendang Crave ^_^	1385137720	403922990486024192	f	lovemamak
@williamsburg ?	1385135135	403912150336696320	f	lovemamak
@MrKwon sorry can't do nothing dinner not open tonight....	1385082047	403689482928816128	f	lovemamak
We are at 7 Hanover Square for lunch next to the Thai cart, Incase you don't see us. #rendang	1384966004	403202764383465472	f	lovemamak
@derthere sorry no, cart still fixing, hopefully tomorrow we will be back, mechanic been delaying us. Sorry	1384901241	402931126224044032	f	lovemamak
@pritpaulbains not yet still making deal!!! :(	1384795821	402488961907843072	f	lovemamak
@mitchelltoga we are unable to make it to Fidi today, tomorrow will be back in schedule. Sorry	1384790084	402464899974328320	f	lovemamak
@mitchelltoga tomorrow by 11.30am- 2.30pm	1384722225	402180277814173696	f	lovemamak
RT @i8and8: It's been a blast w/ @LoveMamak!  Til next time  @DavidYurman #Catering #Fooda http://t.co/cdIL5x31gk	1384540386	401417591711076352	f	lovemamak
RT @whatupnature: No @Mexicue truck in midtown today. The world is a black desolate wasteland and my heart has forgotten the meaning of joy	1386104617	407978450033856512	f	mexicue
One word: Smoked-Brisket-Breakfast-Burrito. Introducing Mexicue Breakfast, featuring Tacos, Sandwich http://t.co/sHdh55mCOZ	1386093124	407930248660254720	f	mexicue
Truck is having a spa/repair day today...	1386089534	407915191100129280	f	mexicue
Truck is catering a private event today, give us a shout at catering@mexicueny.com if you want the truck at your holiday party this year!	1385999931	407539366769467392	f	mexicue
...In the meantime, spice up your Thanksgiving recipes with our Chipotle Cheddar Mashers and Chorizo Stuffing. http://t.co/4DyjR5YsTB	1385649212	406068345772191744	f	mexicue
Happy Thanksgiving from all of us at Mexicue! We will see you Monday with plenty of leftovers to make our Thanksgiving Sandwich!	1385649026	406067564536950784	f	mexicue
The truck is doing a private event today...see you guys Monday!	1385567171	405724240541777920	f	mexicue
Our truck is hunting wild turkey so no lunch today...\n#inthewoodsorliquorstore?	1385482701	405369947834294272	f	mexicue
RT @starrett601: Guess why we love Tuesdays?! @Mexicue out front #starrettlehigh 12-3pm.	1385479062	405354683482796032	f	mexicue
RT @AlmostMedia: Two out of my last three tweets are about walking long distances to @Mexicue huh. I blame delicious brisket &amp; @fitbit	1385428362	405142031791824896	f	mexicue
RT @OhSmileForMe: No one ever says "so long chipotle" RT @HelloIamMikaela: So long chipotle hellloooo @Mexicue. Mexican BBQ sauce. Divine!	1385419836	405106271688613888	f	mexicue
RT @HelloIamMikaela: I love @Mexicue my new lunch fave... This Alabama chicken burrito is everything!!!!!!	1385409391	405062461902295041	f	mexicue
45th and 6th!	1385399486	405020917689901056	f	mexicue
RT @thomaskelly: Mexicue Thanksgiving Sandwich Recipe - People seem to really dig our Thanksgiving leftovers inspired... http://t.co/mLiEFG...	1385151666	403981485952479232	f	mexicue
WFC at north end and vesey...all things considered...a nice day to get out before we enter the frigid zone this weekend.\n#halffull	1385138096	403924569113001984	f	mexicue
RT @DispatchNY: . @BrookfieldPLNY NORTH Lot 11/22/13: @MorrisTruck @ESTacoTruck @Mexicue @SchnitznThings &amp; @ToumNYC - N. End Ave./Vesey, 11...	1385137850	403923538698330113	f	mexicue
Water and broad...In this day in 1789 North Carolina became the 12th state....and America gained one of the great BBQ states. Pulled pork?	1385049338	403552290784944128	f	mexicue
18th &amp; 5th...don't show up to thanksgiving with a tiny stomach, you'll offend your aunt by not eating her yam stuffing. Training starts now!	1384962656	403188719358070784	f	mexicue
RT @UrbanSpaceNYC: @EatMyWordsBlog1 We're all about @mexicue's Thanksgiving Sandwich, @jicamanyc's Hot Drinking Chocolate and @poffertjesma...	1384880309	402843333237960705	f	mexicue
RT @nystfood: Street Eats: Thanksgiving Sandwich from @Mexicue at Broadway Bites. http://t.co/KetUstQhzX @UrbanSpaceNYC http://t.co/VZKfXqr...	1384880276	402843193156583424	f	mexicue
49th N 6th with your favorite sliders today!	1386082311	407884892878692352	f	mrniceguytruck
56th n Bway for lunch.. Windows up!	1386002479	407550056209059840	f	mrniceguytruck
I'll have more for you.	1384571709	401548967994880000	f	sweeterynyc
RT @randomfoodtruck: No point in slowing down now--keep the feast going with @MrNiceGuyTruck @bigdsgrub @sweetchilinyc @gcnyc1	1386002462	407549983383375872	f	mrniceguytruck
Sat shopping with the Nice Guys. Prince n Bway #SohoFlow http://t.co/oap4Bn4AQw	1385832047	406835210379333632	f	mrniceguytruck
Window's open! 50th &amp; 6th! Get your shop on then grub on! #sliders #fries #chimmi #classic #turkey... http://t.co/tkAlEUsjCV	1385742981	406461638985142272	f	mrniceguytruck
Chillin with these good folks tomorrow! http://t.co/AcLiT4U1rD	1385515889	405509146906066944	f	mrniceguytruck
56th n Bway for lunch. Warm yourself up with a Chimi Slider!	1385387889	404972275713458176	f	mrniceguytruck
RT @DyckmanBar: #dbladiesnight baileysus Vanilla Cinnamon - 3 specials for the fall/winter. Get a shot or a martini!... http://t.co/c5C9u3z8h2	1385165838	404040929512026113	f	mrniceguytruck
#Slidernation http://t.co/jKSQJOt3oE	1385138007	403924197501857792	f	mrniceguytruck
50th n 6th for lunch today. Friday is here!	1385124434	403867268620488704	f	mrniceguytruck
#NP @djquiz #GotDemBeatz mixtape Boomin Out the system. 67th n Bway Slingin Sliders http://t.co/e7N1iGx9ys	1385068254	403631631459966976	f	mrniceguytruck
#SliderNation we are at 67th n Bway for a few in front of the Apple store. #LincolnCenter #Apple... http://t.co/eeCp8C6yse	1385064125	403614311433928705	f	mrniceguytruck
Lunch support from the legend @djclarkkent #MNG #slidernation #NewEra #Marianorivera http://t.co/tH21GgKCmt	1385058681	403591479744278528	f	mrniceguytruck
Grab your favorite sliders at the New Era Store for that limited Mariano Rivera 42 Fitted. E 3rd n... http://t.co/RfjCG26pJZ	1385050278	403556233296478208	f	mrniceguytruck
49th and 6th for lunch today - come see us #SliderNation	1384969782	403218608090001408	f	mrniceguytruck
52nd and 6th ave for lunch today!	1384866794	402786646762192897	f	mrniceguytruck
56th n Bway doin the lunch thang today. Stop by for some sliders n fries	1384782563	402433356627214336	f	mrniceguytruck
50th n 6th doin the lunch thang today! Stop by for some sliders	1384518958	401327714789249024	f	mrniceguytruck
Brrrrr is a cold day,  let our $2 turkey slider special warm you up.  49th and 6th	1384447532	401028131722891264	f	mrniceguytruck
Your favorite sliders at 49th N 6th ave for lunch today!	1384431785	400962086219808769	f	mrniceguytruck
@thesporkful @CookingChannel It looks amazing! Keep us posted on your web series, we're getting hungry!	1386102407	407969183256039425	f	taimmobile
RT @thesporkful: Behold the Waffle Falafel Sandwich, made on a falafel waffle w/ @taimmobile for my new @CookingChannel web series. http://...	1386102330	407968859212496896	f	taimmobile
RT @ezagroba: My inexorable patronage of @TaimMobile has finally paid off! I won their cookbook! http://t.co/El7ZKnGM8N You guys are the be...	1386097011	407946548988104705	f	taimmobile
Closing at 2:30 to finish our repairs, only 30 minutes left at 20th/5th	1386096996	407946488560758784	f	taimmobile
We're back, back in the Taim groove on 20th/5th with special Green Olive Falafel Lentil soup, sufganiyots and all your favorites	1386088170	407909468459266049	f	taimmobile
Homemade sufganiyots for a limited time at Taim and Taim Mobile #Hanukkah #nyc #yum http://t.co/DBbnQfI5oF	1386088092	407909140280127489	f	taimmobile
@ElenaLaMalfa Lentil soup served up hot in Nolita	1386007786	407572313492971520	f	taimmobile
Cook from your kindle your Taim and Balaboosta favorites for just $15 bucks! http://t.co/HbvhyJyr72	1386004323	407557787414437889	f	taimmobile
Bad news falafel fans, Murphy's Law strikes again. We are in the shop today 4 repairs. Try our restaurants 4 ur fix, hopefully back 2morrow	1385998638	407533944985616384	f	taimmobile
Taim Mobile is closed for this #falafelfriday but our West Village and Nolita stores are still serving up all your favorites	1385745323	406471462917115904	f	taimmobile
Thanks to Aaron from @firstround for braving the cold to pick up lunch, today's #TaimOfficeHero	1385405326	405045411385470976	f	taimmobile
Order homemade Taim soufganiots for Hanukkah at or the office. Available for pickup at the truck or restaurants...info@taimmobile.com	1385403497	405037740456431616	f	taimmobile
Hot Black-Eyed Pea soup at NOLITA and on the truck @ 18th/5th #vegan http://t.co/ksfRN3C7MX	1385397060	405010743789359104	f	taimmobile
@niftinessafoot Opening now!	1385397000	405010490226933760	f	taimmobile
Hot deal today on 5th/18th: Hot Black Eyed Pea Soup and Falafel Sandwich for just $9.50. Hey, your intern has a coat. #pickupfortheoffice	1385396606	405008840280014848	f	taimmobile
homemade #soufganiots! order them by email and pick up at Taim or the truck on tuesday! limited production..info@taimfalafel.com	1385348854	404808551882698753	f	taimmobile
@dumbolot What days do you have available?	1385212844	404238083912368128	f	taimmobile
Need help w Thanksgivukkuh recipes? Chef @EinatAdmony has you covered: http://t.co/OM8BJSbM30	1385158495	404010127290032128	f	taimmobile
We've got Red Beet, we've got Red Beet we've got Red Beet. Ya, we've got Red Beet! Falafel! Catch the beet @ Varick/Vandam #FalafelFriday	1385136594	403918268295282688	f	taimmobile
@milktrucknyc Any time guys. We know you'd do the same. Send us one of your delicious malts next time we see you and we'll call it even!	1385074023	403655825417596928	f	taimmobile
G1 - broadway /55\nG2 - Columbus / 91\n#comtothecheeseyo	1385999126	407535990623186944	f	gcnyc1
Gorilla is taking a break until Monday\nHave a happy Turkey day....\n#comtothecheeseyo	1385521611	405533147536052224	f	gcnyc1
G1 - broadway/55\nG2 - Columbus/91\n#comtothecheeseyo	1385398122	405015197179723778	f	gcnyc1
Little rain ain't gonna melt ya....\nG1 - 45 5/6 \nG2 - 49th/6\n#comtothecheeseyo	1385138240	403925175047323648	f	gcnyc1
Hey now.   Beautiful day....\n#midtown\n36 broadway / 6\n50th/6\n#comtothecheeseyo	1385047909	403546295526506496	f	gcnyc1
G1 - park/47\nGo - 26th 11/12\n#comtothecheeseyo	1384963443	403192020694753281	f	gcnyc1
G1 - broadway/52\nG1 - Columbus/91\n#comtothecheeseyo	1384790619	402467143347752960	f	gcnyc1
Good Crisp Morning. ..Love it ?\nGood Cheesey Weather, Tomato Soup Yaaa\nG1-Park/47\nG2-26 11/12\n#cometothecheeseyo	1384351836	400626754286809088	f	gcnyc1
G1-46th 5/6\nG2-49th/6\n#Chicken Bacon Bleu w/Muenster &amp; bbq\n#cometothecheeseyo	1384269596	400281815539544064	f	gcnyc1
G1 - 5th Ave 20/21\nG2 - Broadway/55\n#VeteransDay \n#cometothecheeseyo	1384177931	399897346492076032	f	gcnyc1
@JFXXXVI send me an email.....what happened...	1384093712	399544103165521921	f	gcnyc1
G1-47/Park\nG2-49th 6/7\nChicken,Bacon,Bleu Melts w/Muenster &amp; BBQ\n#COMETOTHECHEESEYO	1383833584	398453047418191873	f	gcnyc1
G1-47/park\nG2-26th 11/12\nChicken Bacon Bleu Melts yummy\n#cometothecheeseyo	1383750023	398102570243485696	f	gcnyc1
G1 on Broadway/52\nG2 on Columbus/91\nChicken Bacon Bleu Melts yummy\n#cometothecheeseyo	1383581454	397395541354872832	f	gcnyc1
G1 - Broadway/55\nG2 - Columbus/91\n#cometothecheeseyo	1383578596	397383550850588672	f	gcnyc1
G1 hudson &amp; king\nG2 50/6 \n#ChickenBaconBleuMelts w/Muenster &amp; Bbq...\n#tasty\n#nyc\n#cometothecheeseyo	1383224865	395899898044108800	f	gcnyc1
G1 Park/48th\nG2 Broadway /55\n#Chicken Bacon Bleu Melts w/Muenster and Bbq....\n#cometothecheeseyo	1383142334	395553738364313600	f	gcnyc1
RT @DispatchNY: From 11a-2pm, you'll find @GCNYC1 serving while you #shoptilyoudrop at @FactoryFloorBK! http://t.co/9QUr2YHpn2 @IndustryCit...	1382890887	394499089465081856	f	gcnyc1
G2 rockin cheese @ pier26 Kids Halloween Festival #hudsonriverpark.org \nG1 rockin #Brooklyn @FactoryFloor 36th/2nd\n #cometothecheeseyo	1382885989	394478549518000128	f	gcnyc1
Hey folks UWS BROADWAY AND 61ST @nyit grab your cheesesteaks before and after class here till 9 GOT WHIZ?	1386108646	407995350470119424	f	carlssteaks
RT @dumbolot: .@sweetchilinyc @KimchiTruck and new addition @carlssteaks today! Don't believe? Check out @Datalot's lot stream! http://t.co...	1386085359	407897677335375872	f	carlssteaks
HELLO BROOKLYN!!! cheesesteaks and DUMBO perfect match come by @dumbolot 11-3 try our BEER BATTERED ONION RINGS w CHIPOLTE MAYO!! GOT WHIZ?	1386084125	407892500347887616	f	carlssteaks
Hey folks sorry for late start we will be opem at 12 on 45th st 5/6th ave so grab @FoxNews @barclaysbank your post thanksgiving cheesesteak	1386001475	407545842397351937	f	carlssteaks
Sunday cheesesteaks football!  23rd st a bet 5/6th ave till 6	1385918135	407196290188328961	f	carlssteaks
Shopping and cheesesteaks perfect together Broadway and 61st till 9 GOT WHIZ?	1385748707	406485658577145856	f	carlssteaks
Happy Thanksgiving to all from our family to yours enjoy!!	1385658239	406106206257033216	f	carlssteaks
Back in biz baby!! Rain or shine pre thanksgiving cheesesteaks!! 49th 6/7th  Late start 12- 3 30 @SIRIUSXM @FoxNews @Barclays @MHEducation	1385565511	405717275741003776	f	carlssteaks
Sorry folks trucks still getting a face lift looking good for tomorrow!!! GOT WHIZ?	1385398475	405016679392239616	f	carlssteaks
RT @NYCraftBeerFest: Amazing food from @MorrisTruck @ElPasoTruck @coopersnyc @Carlssteaks @Pinchusa @66Smokehouse at today's http://t.co/4M...	1385314277	404663525723111424	f	carlssteaks
Serving up our famous cheesesteaks at NYC Craft Beer Fest at the Armory on lexington amd 26thst till 930 and back... http://t.co/uzcNWbbBJH	1385248966	404389592927059968	f	carlssteaks
Serving up our famous cheesesteaks @nyccraftbeerfest over 175 different craft beers next session 6-930 and tomorrow afternoon GOT WHIZ?	1385244458	404370685746634752	f	carlssteaks
RT @NYCraftBeerFest: @morristruck, @coopersnyc, @carlssteaks, @ElPasoTruck HUNGRY at http://t.co/LO9vwmSaGn - Winter Harvest -Sunday Tix st...	1385221192	404273098910081024	f	carlssteaks
Sorry folks off the road truck getting fixed stay tuned	1384965451	403200444945932288	f	carlssteaks
CHEESESTEAK FRIDAY CHEESESTEAK FRIDAY ENOUGH SAID!! Broadway and 55th 11-2 30 come down @VictoriasSecret @DefJamRecords @randomfoodtruck	1384528491	401367699303178240	f	carlssteaks
Gooood morning FiDi Old Slip ans front st 11-3 come by stay warm w a piping hot carls cheesesteak GOT WHIZ?	1384443767	401012344253587456	f	carlssteaks
Happy hump day movie shoot on 49th 6/7th no worries right across the lobby on 50th 6/7th av 11-3 @FoxNews @barclaysbank GOT WHIZ?	1384358369	400654157478371328	f	carlssteaks
UWS Broadway 61st stay warm w a famous carls cheesesteak also CHILI CHEESE FRIES!! @nyit COMW ON DOWN BEFORE CLASS OR AFTER HERE TILL 9	1384295548	400390668683862016	f	carlssteaks
RT @NYCraftBeerFest: .@MorrisTruck @Carlssteaks @coopersnyc @ElPasoTruck  Delic. with #CraftBeer ...just 12 days http://t.co/gtQKuZGCZR.  I...	1384271789	400291012251512832	f	carlssteaks
Hey SOHO stay nice an warm w a carls famous cheesesteak and HOT CHILI CHEESE FRIES Hudson st / king st 11-3 @saatchionline @FinancialTimes	1384271189	400288497673977856	f	carlssteaks
RT @ChineseMirch: #ShopSmall going strong 2day! Show your support and join us for dinner at any of our 4 locations! #saturdaynight	1385861073	406956952594284544	f	getstuffednow
RT @ChineseMirch: #ShopSmall , all our locations would love 2 see you come out &amp; support us!	1385827231	406815010568957953	f	getstuffednow
RT @ChineseMirch: Huge thanks to all of those begging our chefs to show off &amp; bring on the spice! #MoreHeat! More Heat! #Thanksgiving	1385591768	405827405467885568	f	getstuffednow
Let's take a moment to be thankful for the first guy to ever decide a pig looked delicious enough to eat. #PorkBuns #Thanksgiving	1385591236	405825177901989888	f	getstuffednow
@nycfoodtruck: RT @UncleGussys: Got inspected by health dept. Comments "This might be the cleanest truck in #NYC". Great job buddy!	1385568985	405731848686665728	f	getstuffednow
RT @ChineseMirch: #ShopSmall with us @ChineseMirch on #SmallBusinessSaturday for Chinese Food &amp; Indian Flavors. #Nov30 #LocalBusiness http:...	1385471345	405322315086708736	f	getstuffednow
@DispatchNY @BrookfieldPLNY @KimchiTruck @hibachiheaven @shortysnyc @NuchasNYC miss hanging out with u all!	1385399184	405019651165683712	f	getstuffednow
RT @ChineseMirch: #ColdWeather is here grrrr, #superfood 2 fight it "garlic" ! The common ingredient in all our dishes- "garlic"! Get the d...	1385312339	404655395119312896	f	getstuffednow
RT @ChineseMirch: Ready 2 see family over #Thanksgiving ? A good weekend with friends will make it easier!	1385173330	404072352671350784	f	getstuffednow
#soho we will miss u, see you in Spring ! #TGIF	1385135075	403911899311800320	f	getstuffednow
#missit! The roads of #NYC , the morning hustle 2 grab our spot, the lines...#hibernation till March 2014!	1385050672	403557884975665152	f	getstuffednow
RT @KP_Kelly: I am not a product of my circumstances. I am a product of my decisions. http://t.co/fhxDiFBUHY	1385048870	403550329037664257	f	getstuffednow
@dumbolot , our VERY LAST time this year, stop by and get your fix NOW!	1384968616	403213719658037248	f	getstuffednow
53rd &amp; Park #midtown our last time this year, get your fix between 11-3pm!	1384876461	402827193103179776	f	getstuffednow
#foodtruck is feeling cold and asking 4 #hibernationplease ! So we"ll be off the road till 'Spring . Catch us on our last few days out!	1384870896	402803852753510400	f	getstuffednow
Our last time this year @BrookfieldPLNY , pls come , get your #lunchbowl &amp; say "see u soon" 'cause we never say #goodbye !	1384795878	402489200760848384	f	getstuffednow
RT @DispatchNY: . @BrookfieldPlNY NORTH Lot, 11/18/13: @Getstuffednow @KimchiTruck @HibachiHeaven @ShortysNYC &amp; @NuchasNYC! N. End Ave./Ves...	1384787194	402452777559138304	f	getstuffednow
RT @ChineseMirch: Feeling lazy? Worry not ,we deliver thru @Seamless ,@FoodtoEat or our website powered by @foodexposure or good old phone ...	1384726533	402198347853086720	f	getstuffednow
RT @ChineseMirch: #familysunday, "growing up, our favorite memory was dinners out on Sunday at a restaurant with Mom &amp; Dad ". continue the ...	1384701136	402091827022823424	f	getstuffednow
#soho Charlton &amp; Varick is the place for a hot bowl #winteriscoming ! 11-3pm	1384528091	401366021329940480	f	getstuffednow
@FromMyMellin nice try! Lol	1385999125	407535986537930752	f	fritesnmeats
Happy Thanksgiving!  Wishing you all plenty of great food, great company and lots to be thankful for.  From our... http://t.co/Nu3qoBPMJI	1385652245	406081066072436737	f	mikenwillies
Off the road today - it is horrible out there!  Safe travels to all.  #GobbleGobble	1385564618	405713533188313088	f	mikenwillies
@lobotims_tan we #LOVE our customers tx for the shout out!  #comegetsome	1385487752	405391134723436544	f	mikenwillies
RT @lobotims_tan: Shout out to @mikenwillies for remembering my name as I walked by. Awesome food, even better customer service #woody	1385487669	405390785245634560	f	mikenwillies
Surprise #Midtown we are on 56th Street &amp; Broadway get your fix before #Turkey Day!  #tacos #sliders #burritos #comegetsome	1385479481	405356442104127488	f	mikenwillies
@luisneiman tx for the feedback!  We are adjusting to the 20 degree temps.  Properly heated tortilla guaranteed next week #comegetsome	1385404675	405042682923589632	f	mikenwillies
#Midtown today 45th Street &amp; 6th Ave 11:30 - 2:30 with your favorite #tacos #sliders #burritos #comegetsome	1385393562	404996072525004800	f	mikenwillies
#MurrayHill 29th Street &amp; Park Ave #preorder so no waiting 917-995-5170 #tacos #sliders #burritos #comegetsome	1385134380	403908982617935872	f	mikenwillies
#Midtown today 56th Street &amp; Broadway try our new #burritos or stick with your favorites #tacos &amp; #sliders #comegetsome @randomfoodtruck	1385046484	403540319310184448	f	mikenwillies
Burritos taking over!! #comegetsome http://t.co/OGQfDmMNeq http://t.co/SXGv6NmwRT	1384968504	403213247337095168	f	mikenwillies
RT @nystfood: Street Eats: Fried Fish Burrito from @mikenwillies #foodtrucks http://t.co/r4TtpCpge3 http://t.co/OmrIH3dgq5	1384967749	403210081229365248	f	mikenwillies
@mavcubero Tx for the interest!  We'll be @29th &amp; Park this Fri, 45th &amp; 6th Fridays starting week after Txgiving #comegetsome	1384965985	403202683022364672	f	mikenwillies
Off the road today, see you tomorrow #Midtown	1384961949	403185756468170752	f	mikenwillies
Off the road today getting truck serviced see you tomorrow WFC	1384876436	402827085796114432	f	mikenwillies
#Midtown #Monday 45th Street btwn 5th &amp; 6th Ave with your favorite #tacos #sliders #burritos #comegetsome	1384786309	402449065931444224	f	mikenwillies
A beautiful day in #NYC 14th Street &amp; 9th Ave outside the #AppleStore #tacos #sliders #burritos #comegetsome	1384622172	401760626764443648	f	mikenwillies
#MurrayHill today 29th Street &amp; Park Avenue we are here with your favorite #tacos #sliders #comegetsome	1384531368	401379765858603008	f	mikenwillies
New special buttermilk fried boneless chicken taco topped with lettuce &amp; chipotle crema #comegetsome http://t.co/VwKmNyanDn	1384450389	401040116711718912	f	mikenwillies
What a wonderful day for #Midtown 56th Street &amp; Broadway serving your favorite #tacos #sliders #burritos #comegetsome @ramdomfoodtruck	1384442902	401008714792321025	f	mikenwillies
@BrookfieldPLNY N End Ave &amp; Vesey St 11 - 3 warm up with our #burrito + #butternutsquash soup combo $10 #comegetsome	1384355973	400644106608975872	f	mikenwillies
We are very thankful for you all! Happy Thanksgiving!	1385664669	406133177955414017	f	mamuthainoodle
@JVB @DanCiccNYC so sorry, we're not out today! Have a great thanksgiving!	1385486892	405387527093514240	f	mamuthainoodle
Rain or shine, we are here to feed you Dumbo! Come for your noodle fix! @DUMBOFoodTrucks @dumbolot 11-3pm Jay&amp;Water #eatthainoodles	1385133950	403907181206306816	f	mamuthainoodle
What's better than hot noodles off a burning hot wok on a cold day? I don't know. WFC North End&amp;Vesey 11-3p @BrookfieldPLNY @downtownlunch	1384956521	403162990188707840	f	mamuthainoodle
@gogobot: Thirteen unique #NYC food trucks continued http://t.co/pPWzigAoYH cc @mamuthainoodle Thanks for the mention!	1384913773	402983690504257536	f	mamuthainoodle
Beautiful day! WFC South End&amp;Liberty! Join us for lunch! Yummy noodles hot&amp;fresh! 11-3p @BrookfieldPLNY @downtownlunch @DispatchBP	1384786505	402449887687872512	f	mamuthainoodle
@SlumBeautyful truck is getting some TLC at the truck spa today... Hope to see you next week! Have a great weekend!	1384631297	401798898806972416	f	mamuthainoodle
Dumbo! We have a truck full of fresh noodles for you! Soup as well! Lunch w/us on a beautiful day! Jay&amp;Water st. @DUMBOFoodTrucks @dumbolot	1384526828	401360725748506624	f	mamuthainoodle
WFC North End&amp;Vesey! Fight the cold weather today w/hot hot noodles! Perhaps Tom Kha soup?! 11-3 @BrookfieldPLNY @downtownlunch @DispatchBP	1384353338	400633054370484225	f	mamuthainoodle
RT @spiceninja: Need your help! Just launched @FlavorPlease for booking awesome #foodtrucks can you share/retweet with your foodie friends?	1384192529	399958574740164608	f	mamuthainoodle
WFC South! South End&amp;Liberty. We are here for your noodle needs! Swing by for hot &amp; fresh noodles! @BrookfieldPLNY @DispatchBP	1384187863	399939003472158720	f	mamuthainoodle
Dumbo, no matter what it's like outside, we're here to serve you Thai noodles hot &amp; fresh! Now til 3pm same place. @DUMBOFoodTrucks	1383927884	398848570159558656	f	mamuthainoodle
RT @JVB: Nothing like @mamuthainoodle on a rainy day.	1383849854	398521291147575296	f	mamuthainoodle
Fidi WFC North&amp;Vesey! Join us on this beautiful Fall day. Thai Noodles for lunch! 11-3pm @BrookfieldPLNY @downtownlunch #eatthainoodles	1383749005	398098300957917184	f	mamuthainoodle
WFC South End&amp;Liberty! Stay warm by eating hot noodles or tom kha soup! Today 11-3p @BrookfieldPLNY @downtownlunch @DispatchBP	1383580174	397390172125683713	f	mamuthainoodle
@questlove Please come checkout our truck sometime! We got oodles &amp; oodles of noodles for you!	1383430345	396761741243469825	f	mamuthainoodle
RT @MasterChefNYC: NYC Mayoral Candidates Think More Food Truck Regs Are Needed http://t.co/O75ykIeIQS #streetfood #foodtruck #foodie wha...	1383396558	396620027686031360	f	mamuthainoodle
Dumbo, cure your Halloween hangover w/hot fresh Thai noodles! gonna need to get up for this wknd's parties! @DUMBOFoodTrucks @dumbolot 11-3	1383312551	396267679365201920	f	mamuthainoodle
WFC North! We bring noodles for you! Have lunch w/us! Our spicy curry special will keep you toasty! @BrookfieldPLNY @downtownlunch 11-3pm	1383140383	395545552177598464	f	mamuthainoodle
FiDi WFC South End&amp;Liberty today 11-3p! Join us on this perfect Autumn day for Thai noodles! Hot &amp; fresh. @BrookfieldPLNY @downtownlunch	1382968032	394822660645191680	f	mamuthainoodle
I know you are already thinking about lunch! We are already at 46th between 5th &amp; 6th.....sneak out of your office... http://t.co/7NWuyuV6ZN	1380282677	383559465553129472	f	seoulfoodnyc
and away we go.....we at 46st between 6th an 5th avenue...\n#GOODLIFE #GOODEATS! http://t.co/i38EG546lO	1380197695	383203025017262080	f	seoulfoodnyc
What better way to celebrate HUMP DAY than to come and eat our yummy food- We are already on 46th street, between... http://t.co/IVsdUEYeSv	1380107038	382822781731098624	f	seoulfoodnyc
We are on Cristopher street and Seventh avenue South- Ready to feed the world~~~	1379952651	382175236394721280	f	seoulfoodnyc
Is your tummy rumbling with hunger pains???  We are on 10th street and Seventh ave! Holla!	1379873830	381844636597112832	f	seoulfoodnyc
Omg omg omg our food is so good! Get your tuckus over here to 10th st and Seventh ave!!	1379791564	381499590064996352	f	seoulfoodnyc
We are on west 10th and seventh ave, Twerking and Werking!	1379715991	381182611366088705	f	seoulfoodnyc
We are in position to serve some delish food today! Our location is~51st between Park and Madiosn.....	1379677980	381023182540390401	f	seoulfoodnyc
We just had our first food truck war over a parking space.! Only in nyc!	1379197247	379006840962838528	f	seoulfoodnyc
Everybody needs a little Seoul!! Come and get it! We are on Christopher street and Seventh ave. Our high heels are on;)	1379175558	378915873060577280	f	seoulfoodnyc
Just got paid, it's Friday night! Woohoo! Come to Seventh ave and West 10th street..say hello and eat, eat, eat!!!	1379108794	378635842837049344	f	seoulfoodnyc
we just rolled up to Fifth avenue and 18th street~ Hurry!	1379098543	378592846703366144	f	seoulfoodnyc
YO YO YO- come and get your tummy filled for lunch! We are at 47th street, between Park and Madison!!!	1379085214	378536941475475457	f	seoulfoodnyc
It is a "Freedom" kind of day. Let's celebrate! See you later at the parade. We will be bringing some yummy eats... http://t.co/FHO82bMv25	1372591737	351301326401048576	f	seoulfoodnyc
Good morning hungry friends! We are already in our kitchen prepping for a "PRIDE" celebration and listening to... http://t.co/cxaaz5p7A6	1372497195	350904789481168896	f	seoulfoodnyc
If you're walking on 5th Avenue between 20th and 21st Streets and wonder what those amazing aromas are . . . it's us!	1372432592	350633821881896961	f	seoulfoodnyc
Let's all meet at the truck today and get our groove on!\nToday is all about "PRIDE" and Kimchi\nKimchi, also... http://t.co/7MHEKUp5Bl	1372412745	350550579635949569	f	seoulfoodnyc
We are on Fifth ave and 20th street! Hurry!	1372349143	350283811575169027	f	seoulfoodnyc
Time to Kick off "Pride" weekend!!!! Let's go! http://t.co/9DbRqGyyIm	1372333596	350218605469769728	f	seoulfoodnyc
This just in...we are parked on Fifth ave Between 18th and 19th streets right now...what are you waiting for? We will fill your tummy!	1372262773	349921549459005440	f	seoulfoodnyc
In Park Slope @ The Gate on 5th Ave (btw 3rd &amp; 4th St)	1386111759	408008409444007937	f	shortysnyc
In Park Slope @ Gate Bar on 5th Ave btw	1386111681	408008079939100672	f	shortysnyc
Just added Breckenridge Vanilla Porter Nitro on tap. http://t.co/l7ayB3zT2x	1386085300	407897430068187136	f	shortysnyc
Just added Allagash White on tap. http://t.co/uNmRaTAjbn	1386085069	407896463176658944	f	shortysnyc
Just added Lion Stout on tap. http://t.co/EIYgLdT0BE	1386085052	407896390258655232	f	shortysnyc
Just added Spider Bite First Bite Pale Ale on tap. http://t.co/D1KyFsL75n	1386084940	407895921322500096	f	shortysnyc
Just added Smuttynose Rhye IPA 2013 on tap. http://t.co/3PUxgHpYD4	1386084935	407895901248565248	f	shortysnyc
Just added Lion Stout bottles. http://t.co/aYfjsSGrTA	1386084933	407895890524110849	f	shortysnyc
Just added Allagash White bottles. http://t.co/IvVWWoUh9z	1386084930	407895879752757248	f	shortysnyc
Just added Spider Bite First Bite Pale Ale bottles. http://t.co/FGQ2DEjvcI	1386084709	407894952048599040	f	shortysnyc
Just added Smuttynose Rhye IPA 2013 bottles. http://t.co/TxxZCJjwjE	1386084627	407894608560283648	f	shortysnyc
Back at 47th &amp; Park.\n#wizwit	1386083740	407890887893479424	f	shortysnyc
@shakrates glad you liked. some ppl freak out that it's too spicy but we hear you.	1386002880	407551736480817152	f	shortysnyc
WFC for lunch---North end and Vesey.	1385999812	407538869161459712	f	shortysnyc
It's Eagles Sunday. Where are you watching the game? #shortysnyc http://t.co/ICZq0QMNmi	1385921433	407210121010626561	f	shortysnyc
Have a great Thanksgiving everyone!	1385642830	406041576884813825	f	shortysnyc
RT @andynieves13: @shortysnyc 9th ave.  Thank you for having PumpKing on draft!	1385642753	406041255429554176	f	shortysnyc
98 deliveries at Pearl St. yesterday.. We can do more.\nFREE DELIVERY at all 3 locations! http://t.co/AfbO0ChkqQ	1385569975	405736003027349504	f	shortysnyc
Get your cheesesteak fix before the turkey. DUMBO-- Jay &amp; Water St.	1385563770	405709973071884288	f	shortysnyc
Get your cheesesteak fix before	1385563725	405709785188032512	f	shortysnyc
Already many of u want 2 know where tomorrows spl holiday @FoodNetwork @Sweetery FREE cookie truck will b, all locations to b posted shortly	1386100405	407960785726361600	f	sweeterynyc
Who's got the coolest looking gingerbread snowflake FREE cookie give away going on 2morrow, our grt partners @FoodNetwork Magazine &amp;Sweetery	1386098911	407954517615853568	f	sweeterynyc
Oh @LGUS on 2 of our walls we admire u everyday, &amp;we say, TV TV on the wall who's the finest of them all. C u 2morrow when we come 2 u 2play	1386097649	407949225821876224	f	sweeterynyc
RT @francescaleite: Free @SweeteryNYC &amp; @GTownCupcake, a chinchilla, and horse &amp; carriage on campus today. #HolidayFair #MerryChrismas #For...	1386096975	407946397116166144	f	sweeterynyc
If you work @LGUS in NJ, tomorrow will b one of your sweetest days, because SweeteryNYC is coming your way, almost as loaded as Santa's slay	1386091169	407922045268140032	f	sweeterynyc
Tomorrow @FoodNetwork &amp; Sweetery will have a very special truck heading to four manhattan locations, with delicious FREE snowflake cookies.	1386090993	407921308513488897	f	sweeterynyc
Hey @FordhamUnivers, if you're at your uptown campus, there's a big blue truck loaded with treats just for you! See you soon!	1386090054	407917370326274049	f	sweeterynyc
Join our singing bakers for some holiday carols and Thanksgiving savings! @LordandTaylor http://t.co/iH3F2X5gfa	1385653443	406086093097168896	f	sweeterynyc
Stop by @LordandTaylor for a free treat and Thanksgiving savings with @SweeteryNYC! We'll see you there! http://t.co/9ZRGyPJMT8	1385652971	406084111397580800	f	sweeterynyc
Happy Thanksgiving! Find the @LordandTaylor special cart giving away free L&amp;T cookies. Find us at 40th and 5th and 42nd and 5th!	1385647562	406061422389776384	f	sweeterynyc
Heading 2the Thanksgiving Day Parade on Thur? Look 4 our @LordandTaylor Sweetery pushcarts w/singing bakers giving away 1000s of spl cookies	1385484823	405378846616064001	f	sweeterynyc
Good morning Hudson/King St. Sweetery is on location serving the best coffee and breakfast items on wheels in Hudson Sq. you will find!	1385473080	405329593155850240	f	sweeterynyc
Come to the special @Sweetery trk &amp; our partners @Macys @TCM @34thStNYC will treat u to FREE hot chocolate &amp; hot apple cider til 9p tonight,	1385153059	403987328646922240	f	sweeterynyc
Good morning! Today we team up with @Macys and @tcm for a day of movies and free hot chocolate and cider. We'll see you in Herald Square!	1385133049	403903401731567616	f	sweeterynyc
@lwsourpatch Unfortunately not this week. This week we are on Hudson St, but we do make deliveries	1384973692	403235008090869760	f	sweeterynyc
Good morning Hudson/King St. For those who are luck to be at work today, Sweetery is right by ur side, providing a reason to be glad you are	1384180426	399907811775098880	f	sweeterynyc
Thank u to all veterans &amp; their families who have made huge sacrifices, in many cases the ultimate sacrifice to help protect our grt country	1384174189	399881650357542914	f	sweeterynyc
RT @MissAnnShe: Awesome hot chocolate from @SweeteryNYC to keep me toasty. #humanizingwork http://t.co/alEl40tf7K	1384020860	399238542964310017	f	sweeterynyc
RT @RedeemerCFW: Giving our #humanizingwork conference attendees an NYC food truck experience from @SweeteryNYC http://t.co/yhCZBBfu9L	1384020837	399238443907440640	f	sweeterynyc
We're on the UWS tonight at 88th and Broadway!	1386108014	407992700290740224	f	goburger
We're on 88th and Broadway now! @NYCfitBlonde	1386107823	407991897157038080	f	goburger
Holiday shopping tonight? We're here to keep you satiated at W 4th &amp; Mercer!	1386017758	407614138622283777	f	goburger
Happy Monday! We're parked in Gramercy for lunch at 26th &amp; Park.	1386000003	407539667936874496	f	goburger
Time for a fuel up during holiday shopping! Burgers at 56th and broadway!	1385741962	406457367292030976	f	goburger
We've moved to 88th and Broadway for dinner!	1385506207	405468538397138944	f	goburger
this is your 2 hour warning @stevenshawnyc @tcappy84	1385479348	405355883380871169	f	goburger
We're on 28th and 11th today!	1385479281	405355600668028928	f	goburger
We've moved to West 4th and Mercer for dinner!	1385162397	404026493275471874	f	goburger
@stevenshawnyc head's up! We're on 28th! Do a little dance - http://t.co/iByyUW7Ube	1385138212	403925053752217600	f	goburger
@tcappy84 psst. we're here today.	1385137980	403924082531786753	f	goburger
#TGIF! We're on 28th and 11av for lunch today. May the burgers be ever in your favor.	1385137961	403924002672242688	f	goburger
Grab dinner at 88th and Broadway! (hint: we're here)	1385075251	403660979038605312	f	goburger
We're on 20th and 5th Ave	1385055621	403578644637184000	f	goburger
Warm up with a tasty burger! We've moved uptown to Broadway and 76th for dinner.	1384987238	403291823575416833	f	goburger
We're on Varick and Vandam for lunch today!	1384966796	403206083218776064	f	goburger
@tcappy84 we're usually there once or twice a week. We'll let you know when we're back!	1384966756	403205915564064768	f	goburger
@stevenshawnyc tell em to come onnn dowwwn! (Price is Right voice)	1384889743	402882902310260736	f	goburger
We're on 28th and 11th this afternoon. See you soon!	1384881980	402850341466935297	f	goburger
@stevenshawnyc you can let them know that we'll be here waiting...	1384881941	402850178757320704	f	goburger
RIP Judy Rogers one of the great, great chefs and teachers.	1386093180	407930483071152128	f	milktrucknyc
Bessie's moved to 22nd &amp; Park. Call (646) 504-6455 to pre-order!	1386092114	407926009162244096	f	milktrucknyc
LC supposed to be the one towing, not being towed. #blownclutch http://t.co/VLvbxF32fV	1386090776	407920397615919104	f	milktrucknyc
@pete_wells me too. zuni cafe cookbook is the one i go to when i need to understand something about the technique--not just the how but why	1386088905	407912552342228992	f	milktrucknyc
RT @pete_wells: I learned more from the Zuni Cafe Cookbook than any other cookbook; Judy Rogers studied technique deeply and knew why she d...	1386088804	407912128491061248	f	milktrucknyc
Bessie's at 40th &amp; 5th, call (646) 504-6455 to pre-order. Sandwich menu always at @houstonhallnyc	1386082664	407886375992573952	f	milktrucknyc
Bessie's at @Columbia, call (646) 504-6455 to pre-order. Sandwich menu always at @houstonhallnyc	1386001574	407546256961966080	f	milktrucknyc
RT @fritesnmeats: As we go out and shop don't 4get to #ShopSmall.  We'll B @ThisIsStory sat morning dishing out goods w/@milktrucknyc	1385811661	406749704354287616	f	milktrucknyc
RT @ThisIsStory: Opening early 10 AM for SMALL BUSINESS SATURDAY w/ @milktrucknyc @Vosges @fritesnmeats Will you be there? #ShopSmall  http...	1385763178	406546353658286080	f	milktrucknyc
RT @ThisIsStory: Traveling #Homefortheholidays? Meet 6 businesses that get it http://t.co/vkc0TYb0Dp @micielomicielo @BtwnWindWater @ILLUME...	1385751466	406497229978218496	f	milktrucknyc
RT @ShopSmall: Happy Thanksgiving! We hope you are enjoying the holiday &amp; prepping for the big day. It's just TWO days away! http://t.co/gq...	1385751454	406497180837769216	f	milktrucknyc
RT @BCakeNY: TOY DRIVE! We are one of the drop off locations for the asistershand annual toy drive. Please drop... http://t.co/gEqZnzXkg8	1385750840	406494604612362240	f	milktrucknyc
@triplethreatmom of course! best part of thanksgiving.	1385750672	406493899104854016	f	milktrucknyc
@robicellis nice!	1385750609	406493633836097536	f	milktrucknyc
this week we move inside to new @bkflea at N. 5th &amp; Wythe! same set up serving grilled sammies, #1 best in ny mac&amp;cheese &amp; milk shakes!	1385750091	406491461652213760	f	milktrucknyc
@ramcheer55 thanks! we're taking our show inside this week @bkflea N. 5th &amp; Wythe. same set up only inside and a lot warmer!	1385749904	406490678214946816	f	milktrucknyc
we're giving out sammies &amp; soup Sat 11/30, courtesy of @ThisIsStory 19th st &amp; 10th ave.  11:30--til they run out!  come support #ShopSmall	1385749732	406489955607650305	f	milktrucknyc
Happy Thanksgiving! Bessie's off the road today and tomorrow, stuffing her face with turkey.	1385650817	406075076111384576	f	milktrucknyc
RT @ramcheer55: @milktrucknyc I &lt;3 your stand when I was at @bkflea 2 wks ago.  I had a dreamed about mac 'n cheese w. carmelized onions la...	1385577310	405766768045883392	f	milktrucknyc
Bessie's at Wall &amp; William until 2pm, find her in TriBeCa until 5/6pm. Call (646) 504-6455 to pre-order. Always at @houstonhallnyc	1385564489	405712992236765184	f	milktrucknyc
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
#midtown did you miss us as much as we missed you? Tell us in person on 50th &amp; 6th! #msg #fix #nomsgtho @nystfood @midtownlunch	1386084981	407896094782525440	f	mooshugrill
@dogboki noted. recent batch may have been braised for too long. #sorry	1386045164	407729086736650240	f	mooshugrill
@dogboki So sorry to hear that. We try and taste test everything but you may have missed a batch. Come back next week for a bowl on us!	1386019348	407620806579990528	f	mooshugrill
Welcome back #NYC! Catch us in @dumbolot today along with @MexicoBlvd if you ate through all your #leftovers already! @DUMBOFoodTrucks	1385997829	407530548819922944	f	mooshugrill
Winding down #thanksgiving week at 55th &amp; Broadway! #thankful for good books to read over the long wknd @randomfoodtruck	1385558872	405689431925223424	f	mooshugrill
#shoutout to the good people with the massive order at @ketchumpr #nyc office we're truly #flattered!	1385488238	405393171108356096	f	mooshugrill
#thankful for our fans and fam on 50th &amp;6th! Swing by for that pre-thanksgiving #pekingduck and #porkbelly	1385474047	405333650147135488	f	mooshugrill
Like #thanksgiving comfort food? We got you. @dumbolot on jay &amp; water today for that slow braised #porkbelly!	1385394220	404998830841921536	f	mooshugrill
Mmm. Pork belly for breakfast. We gots it today! http://t.co/QOBDirr7I4	1385390877	404984807803092992	f	mooshugrill
Open on 50th&amp;6th!	1385135491	403913641604685824	f	mooshugrill
Turkey on #thanksgiving is for the birds! Come to 50th &amp; 6th and celebrate the right way #pekingduck #taiwanesebasilchicken	1385126779	403877102136885248	f	mooshugrill
http://t.co/e5hReGRvyg @nystfood reviews us! @midtownlunch	1385069076	403635076107632640	f	mooshugrill
Nothing bumps productivity like a solid lunch! #MSG just a couple of short blocks south of @wework on Howard &amp; Lafayette! @WeWorkLabs	1385052199	403564289233276928	f	mooshugrill
Open on Lafayette &amp; Howard st!	1385050545	403557352546508802	f	mooshugrill
@ownworseenemy sorry but we're trying to spread the mooshu love in other hoods as well! We'll be back!	1385047864	403546108942893056	f	mooshugrill
Correction that's Lafayette &amp; Howard st! These street signs are all #chinese to me:)	1385047142	403543078998671360	f	mooshugrill
Where's the 1 place in #chinatown you'd be glad to find #MSG? Crosby &amp; Lafayette with $7 #ricebowls yo! @downtownlunch @nystfood @Gothamist	1385041266	403518435579408384	f	mooshugrill
Open on 55th &amp; Broadway along with @VeganLunchTruck and @shanghaisogo!	1384964661	403197128501362688	f	mooshugrill
Wdup #randomhouse! To celebrate our debut on 55th &amp; Broadway it's $7 ricebowl day! #duck #porkbelly @randomfoodtruck http://t.co/IaW2nt7wqf	1384955748	403159745387044864	f	mooshugrill
#TGITF! That's #ThankGodItsTuesdayFriday for those of y'all that don't know cus #MSG is on 50th &amp; 6th!	1384868891	402795439877271552	f	mooshugrill
RT @TracyGWhite: @thegreenradish1 TY! possibly the best squash soup I've ever had!  #nyc #foodtrucks	1386126995	408072313251569664	f	thegreenradish1
Try our Stir Fried Veg Wrap, Spiced Tempeh, Broccoli, Shitakes, Kale and Soy-Sesame Dressing, Today, Tuesday,... http://t.co/ITkucuoLWM	1386075634	407856888781762560	f	thegreenradish1
Good Week to #govegan @thegreenradish1 #midtownlunch #veganlunch Get Rad!\nTues-51st&amp;Park\nWed-38th&amp;Bway... http://t.co/r11flcO4CS	1386062313	407801016277405696	f	thegreenradish1
@TheEllenShow Ellen, We love you too! your #veganlunch awaits @thegreenradish1 http://t.co/Ni4Pprlxv7 #govegan #gogreenradish	1385955605	407353449315975168	f	thegreenradish1
Can't wait to read Eat Like You Care by Gary Francione... http://t.co/4Bf6saEbdu	1385655531	406094850560253952	f	thegreenradish1
The Green Radish | Vegan Organic http://t.co/oCsMpn9qgk	1385649454	406069362093613056	f	thegreenradish1
More Vegans=Better Planet...#govegan, http://t.co/v9BT9Pk2Pv	1385604713	405881703593304064	f	thegreenradish1
RT @garylfrancione: A new Abolitionist Approach poster #vegan #veganism #govegan #adopt #foster http://t.co/06eqEYLqhl	1385601821	405869570956992512	f	thegreenradish1
G-Rad preparing for ThanksLiving Festivities, See You On Tuesday...Happy Holidays to All!!! http://t.co/qCto7kEy16	1385561561	405700710727053314	f	thegreenradish1
G-Rad @NYPalace, 51st btwn Park/Radison, #veganlunch, #midtownlunch, Save a Turkey #GoVegan, Eat to Live, #GetRad! http://t.co/4SRGLfd2ax	1385482104	405367444598190080	f	thegreenradish1
#Today, #Tuesday, G-Rad serving #Organic Roasted Butternut Squash Soup, 11to2pm, 51st Between Park&amp;RADison....	1385468506	405310409596354561	f	thegreenradish1
RT @peta: Hope for the future, courtesy of Leonardo da Vinci. #Vegetarian #FriendsNotFood http://t.co/Ww4Axujazg	1385426729	405135183059628032	f	thegreenradish1
#JerseyStrong, Team G-Rad, @MontclairNow, #GoVegan, #VeganLunch, @montclairFarmersMarket, today/Saturday,... http://t.co/w5FgsMtQM5	1385223404	404282375531532288	f	thegreenradish1
RT @slowswimmer: Got #Chia? If not, you should! Chia seeds are a great addition to anyone's diet, #vegan or not. http://t.co/YsKD4iWH4x	1385210475	404228147929178113	f	thegreenradish1
Hey Montclair Farmer's Market, see u tomorrow, Saturday,11to2pm, #GoVegan, @Montclair, #VeganLunch, Get RAD!	1385147432	403963725893226496	f	thegreenradish1
Organic Tuscan Kale, get some now @ 56th&amp;Bway http://t.co/0f6tlZu1DX	1385139259	403929448967196673	f	thegreenradish1
Happy ThanksLiving NO Turkey Wrap with Spicy Tempeh, Toasted Cornbread, Walnut-Cranberry Relish, Kale &amp; Creamy... http://t.co/nUG9ehl48m	1385129391	403888057373294592	f	thegreenradish1
BlackBeanBurgers with Melted Onions and Chipolte Mayo, #govegan, #veganlunch, on 52nd&amp;6th Today, Thursday,... http://t.co/zoGdFKva1N	1385036437	403498181851623424	f	thegreenradish1
Try G-Rad's NO Turkey Wrap Today@38th&amp;Bway, #govegan, #veganlunch, @peta, @bittman, @nymetro, #midtownlunch	1384952761	403147218246721536	f	thegreenradish1
Try our ThanksLiving  NO Turkey Wrap Today, Spiced Tempeh, Walnut-Cranberry Relish, Grilled Yam, Toasted... http://t.co/oZMyNDf665	1384951666	403142624531738625	f	thegreenradish1
@linhieta tomorrow	1385481804	405366183358369792	f	korillabbq
#stickers #sanrio #hellokitty http://t.co/U6DUrsPGeD	1385439083	405187000946663424	f	korillabbq
@KevCogs @MexicoBlvd @burgersandbites @mamuthainoodle @dumbolot @DUMBOFoodTrucks dumb lot	1385234205	404327679044104192	f	korillabbq
It's a celebration, bitches!!! #korilla #bbkings #nyc #newyork http://t.co/k7gdqFaEj9	1385182162	404109393681469440	f	korillabbq
RT @dumbfoundead: NYC BOUND	1385159904	404016036460380160	f	korillabbq
RT @livelifeny: Tonight we rage! @KorillaBBQ anniversary party @BBKingBluesNYC you don't want to miss out!	1385151054	403978920145735681	f	korillabbq
Done in DUMBO! See you tonight @BBKING times square!	1385150804	403977871557160960	f	korillabbq
We're ready for you DUMBO @Water st &amp; Jay st! Sorry no tofu today!	1385140021	403932642451914753	f	korillabbq
Our anniversary #tees by @krsp_life Thank you!!  Happy anniversary to us! Three years strong! Grab... http://t.co/pQX8cAJ3c2	1385129453	403888318368477184	f	korillabbq
Open at CU!	1385071191	403643949363261441	f	korillabbq
RT @lobstertruckny: Woohoo! MT @fourwheelfoodie: Forbes' Coolest Trucks http://t.co/yyTOxDXuBD Congrats @KorillaBBQ @waffletruck @RickshawT...	1385069044	403634945866076160	f	korillabbq
Now serving at the DUMBO lot!	1385052698	403566383004659712	f	korillabbq
Ready at 47th Park-Lex by 11:30!	1385049695	403553790244433920	f	korillabbq
Lunch today at DUMBO and 47th and Park!	1385045587	403536558709821440	f	korillabbq
Now serving at CU!	1384988146	403295633718931457	f	korillabbq
RT @livelifeny: This Friday @KorillaBBQ will be providing free food and gear to our guest @BBKingBluesNYC Dont miss out #livelifeLL http://...	1384988117	403295512843272192	f	korillabbq
Serving FiDi today!	1384961337	403183189436678144	f	korillabbq
Headed to Midtown's 53rd and park!	1384870817	402803519880970240	f	korillabbq
@listen2KRISTIN #cashonly	1384819075	402586499130359810	f	korillabbq
Now serving at Columbia!	1384812147	402557440400822272	f	korillabbq
Located on Hudson and King streets. Online at http://t.co/6h7IrKccpj	1386004676	407559270369345536	f	thepocketful
Located on 49th between 6th and 7th	1385480434	405360440492175361	f	thepocketful
Loathed on Hudson and King streets. Online at http://t.co/6h7IrKccpj	1385397722	405013519214850048	f	thepocketful
Located on 55th street, between 6th and 7th and online at http://t.co/6h7IrKccpj	1385135166	403912281622593536	f	thepocketful
We couldn't park on 50, so we are on 49th between 6th and 7th.	1385050540	403557332183154688	f	thepocketful
Located on 53rd and PARK AVE. online at http://t.co/6h7IrKccpj	1384964715	403197358349221888	f	thepocketful
Located on 49th, between 6th and 7th. Order online at http://t.co/6h7IrKccpj	1384877320	402830794114482176	f	thepocketful
Beautiful day. Meet us on Hudson and King	1384794354	402482809547542528	f	thepocketful
Located on 55th, between 6th and 7th.	1384529082	401370178426257408	f	thepocketful
Located on. 50th, between  6th and 7th. Online at http://t.co/6h7IrKccpj	1384441920	401004594098356224	f	thepocketful
Located on corner of 53rd and Park. Order on line at  http://t.co/6h7IrKccpj  and your lunch will be waiting for you	1384360184	400661770488254464	f	thepocketful
Located on 49th, between 6th and 7th. Online at http://t.co/6h7IrKccpj	1384271088	400288072866496512	f	thepocketful
Located on Hudson and King street	1384192888	399960077777793025	f	thepocketful
Located on 55th, between 6th and 7th.	1383927828	398848336725573632	f	thepocketful
Located on 50th, between 6th and 7th.	1383841856	398487746039529472	f	thepocketful
Located on 53rd BETWEEN Park and Madison.	1383753093	398115444068220929	f	thepocketful
Located on 49th, between 6th and 7th. Order online at http://t.co/6h7IrKccpj	1383665474	397747946051362817	f	thepocketful
Located on Hudson and King street	1383587242	397419817864798208	f	thepocketful
Located on 49th, between 6/7and online at http://t.co/6h7IrKccpj	1383316211	396283029704179712	f	thepocketful
jeffisawesome sporting the colors http://t.co/XrXiBbtmA5	1383238439	395956830687744000	f	thepocketful
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
Humpday! Dumpling trucks stationed at 50&amp;6av as well as wfc!!!	1382538905	393022773591035904	f	rickshawtruck
Learn to make dumplings! http://t.co/cijOlZC8t7 @thebklynkitchen	1382455599	392673359776845824	f	rickshawtruck
@calenna we will be on 53rd and park everyday. There are no lines Monday thru wednesday if you do decide to walk across town.	1386082379	407885178145890304	f	biandangnyc
53rd and park! #comegetsome #nyc	1386081941	407883343099727872	f	biandangnyc
53rd and park! 1130-2:30! #taiwan	1385996066	407523154223828992	f	biandangnyc
don't let the little rain scare you! 53 and park!	1385572477	405746493270679552	f	biandangnyc
53rd and park. we are here 5 days a week now! except this week due to thxgiving. you #welcome!	1385475935	405341570620084225	f	biandangnyc
@calenna trying to make 53rd and park a permanent spot. stay tuned.	1385434565	405168050053611520	f	biandangnyc
53rd and park!	1385403932	405039564114243584	f	biandangnyc
53rd and park. #gobblegobble	1385399414	405020615565770752	f	biandangnyc
53rd and park from 11:30-2:30 #tgif	1385132544	403901283108544512	f	biandangnyc
RT @mooshugrill: Nothing bumps productivity like a solid lunch! #MSG just a couple of short blocks south of @wework on Howard &amp; Lafayette! ...	1385053905	403571444929794048	f	biandangnyc
RT @FlavorPlease: @biandangnyc STOKED for our interview today!! #lunchboxfans tweet us one tasty question you'd like to ask and we'll menti...	1385052213	403564351556452353	f	biandangnyc
53rd and park! 11:30-2:30. #alldayeveryday	1385042443	403523372182536192	f	biandangnyc
RT @mooshugrill: Where's the 1 place in #chinatown you'd be glad to find #MSG? Crosby &amp; Lafayette with $7 #ricebowls yo! @downtownlunch @ny...	1385041335	403518722469810177	f	biandangnyc
Good Morning NEW YORK! http://t.co/VwCIE8QcL9	1385035454	403494058955259905	f	biandangnyc
53rd and park from 11:30-2:30. #humpday	1384960331	403178969174130688	f	biandangnyc
#wfc north end and vesey for #lunch. #comegetsome #nyc!	1384873029	402812798184333312	f	biandangnyc
RT @fhatkow: @biandangnyc Pork over rice is that FLAME http://t.co/JsZlRQZA1v	1384869766	402799110212026368	f	biandangnyc
53rd and park! Yes, its Monday. Ready by 11:30-2:30. Check out @domotaco on 50th/6th.	1384789169	402461063410491392	f	biandangnyc
RT @mooshugrill: #LUCKy8 tomorrow get hyped! #RT #BringaFriend #OrTheCuteGirlFromTwoCubesAway @DUMBOFoodTrucks @dumbolot @dumbobid http://t...	1384745760	402278993980030976	f	biandangnyc
53rd and park #tgif from 11:30-2:30	1384529713	401372825874739200	f	biandangnyc
RT @HolidayShop2013: Great Food @STUFF321, the PS 321 Holiday Shop..@lobstertruckny, @homefrite, @rickshawbar, @DanandJohns!!!! Come shop a...	1386121198	408047998003064832	f	lobstertruckny
Eep! Too much #lobstah on the brain. @HolidayShop2013 at PS321 Sat 12/7 NOT 12/9! We'll be there w/ plenty of lobstah http://t.co/fmWsEB4g9L	1386101379	407964871708651520	f	lobstertruckny
BEAUTIFUL day for #LOBSTAH. Big Red is chillin' at 50th&amp;6th. #bethere #clawsup http://t.co/hhve8Tq8GD	1386083626	407890407960637440	f	lobstertruckny
Shopping to do? @HolidayShop2013 has you covered: PS321 Sat 12/9 10-5 PLUS #BIGRED will be dishin' #LOBSTAH! #bethere http://t.co/3FJ104ma5L	1386012439	407591828800950272	f	lobstertruckny
@PhilipN_CAP Be sure to check day of! Trucks battle for spots daily and sometimes we get kicked out or moved. #Clawsup #CrustaceanElation	1385994813	407517898597752833	f	lobstertruckny
@PhilipN_CAP @OliviaGauch Catch us on 50th and 6th on TUESDAY	1385918620	407198325931118592	f	lobstertruckny
@bkflea @smorgasburg indoors is amazing. Shop and eat til ya drop! Lobster 'blt 4 u! Wyeth and N 5th St! 10-7	1385905148	407141817142874112	f	lobstertruckny
Winter @bkflea time! TODAY AND SUNDAY! And every weekend til March. North 5th &amp; Wythe in Williamsburg 10-7pm #clawsup #bethere #lobstahfix	1385870505	406996515652382720	f	lobstertruckny
Too much turkey and lot enough lobster? Get to Park Slope @bkflea ASAP! #Lobstah Breakfast Sandwich! #BigRed 7th&amp;1st 10-1. #bethere...	1385820129	406785221921886208	f	lobstertruckny
Too much turkey and lot enough lobster? Get to Park Slope @bkflea ASAP! #Lobstah! #BigRed 7th&amp;1st	1385816782	406771185788420096	f	lobstertruckny
@_malopez_ we're off the rest of the week but at the park slope flea Sat 7th at 1st st. Including lobster breakfast sandwiches!	1385688764	406234237072076800	f	lobstertruckny
Happy Thanksgiving! Check out some fun #thanksgiving facts including the real menu w/ #lobstah http://t.co/Yuccg1Pd6d	1385665380	406136158239064064	f	lobstertruckny
Don't forget your #thanksgiving #lobstah! We got them in Red Hook til 8pm #getsome #worthit #crustaceanelation	1385582760	405789625383673856	f	lobstertruckny
#BigRed has the rest of the week off but we've got plenty of #LOBSTAH in Red Hook! Today til 8pm, CLOSED THANKSGIVING. Fri/Sat 12-9pm,...	1385574785	405756173833740289	f	lobstertruckny
RT @karaburritt: What are #BK chefs from @BarkHotDogs @RedHookLobster &amp; more grateful for this Thxgiving? http://t.co/R2DazfVVKk via @brook...	1385511799	405491991573585920	f	lobstertruckny
@carnan75 Truck is at 50th and 6th until around 2:30pm today. The Pound in Red Hook is open today and Wed 12-8, Fri/Sat 12-9, Sun 12-8	1385480599	405361130702647296	f	lobstertruckny
Today's the ONLY day #BigRed will be out this week so get your #LOBSTAH while you can! 50th and 6th. #getsome #thanksgivingcountdown	1385478926	405354113418141696	f	lobstertruckny
#FunFact--The first #thanksgiving had no turkey but rabbit fish and #LOBSTAH! Don't worry, we got ya covered! #clawsup #belikethepilgrims	1385423409	405121257773207552	f	lobstertruckny
Weekend #Lobstah craving? 3x the fill w/ Park Slope @bkflea @smorgasburg &amp; @bwaybites #getsome #clawsup	1385230824	404313499863900160	f	lobstertruckny
RT @BubblesMcF: #BESTlunchinParkSlope @lobstertruckny @bkflea 7th n1st. Wife n me hav a 12:45 date! LobMac MaineRolls Chowdah Bisque Bberry...	1385228438	404303489620533248	f	lobstertruckny
@redkitten13 boo.. We'll miss u.	1386098430	407952503570198528	f	thesteelcart
RT @MrWesleyTS: Thank you @TheSteelCart for the Creamy Pumpkin Sweet Potato Soup; Amazing! Love when you're in this hood @ 56 &amp; Bway. #favo...	1386092684	407928402919055361	f	thesteelcart
Yep. It's 56th &amp; Broadway. Soup? Creamy Pumpkin Sweet Potato!	1386084591	407894458697777152	f	thesteelcart
@redkitten13 Creamy Pumpkin Sweet Potato &amp; Kale/White Bean.	1386083005	407887805755707392	f	thesteelcart
Get your online shopping sustenance on Front St &amp; Jay. The soups are Organic Lentil &amp; White Bean/Kale w/Ham. #dumbo @DUMBOFoodTrucks	1385993021	407510384837660672	f	thesteelcart
No thanks, Nor'easter. We're staying home today. Safe travels everyone!	1385559440	405691814268518400	f	kimchitruck
The Cart will not be leaving the couch today. Stay dry, travel safe, and have a Happy Thanksgiving!	1385566119	405719828541227009	f	thesteelcart
Tis' 56th &amp; Broadway. Eat well before ye olde nor'easter!	1385478534	405352467715883008	f	thesteelcart
And Creamy Pumpkin Sweet Potato Soup, because... you know.	1385397449	405012375965028352	f	thesteelcart
Winter is coming... We love winter! Stop by Front &amp; Jay for hot soup &amp; toasty sandwiches! #DUMBO http://t.co/Q8d0yubZG1	1385394633	405000563185950720	f	thesteelcart
http://t.co/mztk4g8Kic	1385140728	403935607141191681	f	thesteelcart
RT @TeresaSabatine: It's one thing for food trucks to have delicious food it's another when owners are awesome check out @TheSteelCart http...	1385134842	403910919195230208	f	thesteelcart
I say Front &amp; Jay! #DUMBO @DUMBOFoodTrucks	1385134576	403909804554330112	f	thesteelcart
@redkitten13 yes the soup is actually Vegan! (w/o cheese &amp; sour cream of course.)	1385061324	403602565428174848	f	thesteelcart
Brunch/Lunch Bonanza on 56th &amp; Broadway! The soup today is a beautiful black bean.	1385045837	403537606199476224	f	thesteelcart
@ownworseenemy Yes! For another few minutes.	1384974607	403238847817187328	f	thesteelcart
Whoa, it's cold.. Rustic Chicken Noodle Soup Activate!   47th &amp; Park through lunch.	1384961524	403183973297553410	f	thesteelcart
Correction - The Steel Cart is on 56th &amp; Broadway.	1384876914	402829090597928960	f	thesteelcart
Tis a fine Fall Tuesday on 56th &amp; Park!  In accordance we've brought hot sandwiches, grits, and a rustic chicken noodle soup.	1384873658	402815434363535360	f	thesteelcart
@redkitten13 Thank you! It's Chicken Noodle today.	1384872503	402810591246823424	f	thesteelcart
Back to the rat race! We're on Front St &amp; Jay through lunch with our Rustic Chicken soup &amp; Creamy Corn Chowder. #DUMBO	1384784675	402442213789302784	f	thesteelcart
No truck today (Tues), Have a great day! We're starting to make gingerbread bread cookies and gingerbread houses...we love them!	1386085684	407899039917953025	f	thetreatstruck
!!! Sat, Nov 30th no truck this weekend! Our shop, The Treats Truck Stop, is open w/food &amp; treats! Sat 8am-7pm &amp; Sun 8am-6pm!	1385815611	406766272396140544	f	thetreatstruck
!!! Fri, Nov 29th no truck today! Our shop is open 7:30am-8pm w/food, @counterculture coffee, hot chocolate &amp; cider &amp; treats!	1385728365	406400336010936322	f	thetreatstruck
Wishing everyone safe travels (bring snacks!) and a very happy holiday!!! Happy Hanukkah! Happy Thanksgiving!	1385555176	405673928485388288	f	thetreatstruck
Closing at 6:30 @ Bway (86 &amp; 87th)!!!	1385504898	405463046505508864	f	thetreatstruck
4-6:30 or 7pm, depending on the rain! Bway (86 &amp; 87th)!!!	1385500168	405443210425561088	f	thetreatstruck
!!! Tues, Nov 26th 11:30-3pm 45th &amp; 6th, then 4-6:30 or 7pm depending on the rain, Bway (86 &amp; 87th)! Happy holidays!!!	1385478333	405351627282186240	f	thetreatstruck
!!! Mon, Nov 25th no truck today! Tomorrow we'll look to park on 45th &amp; 6th for lunchtime and Bway &amp; 86th for the late afternoon!	1385386388	404965981644414976	f	thetreatstruck
Have a great weekend, everyone! Our truck is taking the weekend off! Our shop is open Sat 8am-7pm &amp; Sun 8am-6pm w/food &amp; treats!	1385217364	404257041315012608	f	thetreatstruck
!!! Well...we didn't have luck getting parking @ 45th,  so we decided to set up at our 2nd spot early! 3-7pm 18th st &amp; 7th ave!!!	1385150203	403975350033866753	f	thetreatstruck
!!! Fri, Nov 22nd on our way to our spot! Our mechanic just finished, so we'll be a little later than usual! We'll let you know!	1385134554	403909711915139073	f	thetreatstruck
@kylabaquir our regular spots on Fri are 45th &amp; 6th and 18th &amp; 7th ave. We're planning to go to Bway &amp; 86th next Tues!	1384994312	403321496539381760	f	thetreatstruck
Time for Jr. Pies! And holiday sugar cookies for Thanksgiving and Hannukah!!!	1384993737	403319082184744960	f	thetreatstruck
Our truck is getting a few repairs (we were hit recently!) but our truck Sugar is almost all fixed up! See you on Friday!!!	1384993015	403316056543866880	f	thetreatstruck
!!! We'd, Nov 20th our truck is still in the shop, getting all fixed up from when we got hit. We'll be back on Friday!!!	1384964338	403195774114476032	f	thetreatstruck
Banana chocolate chip pancakes, Bacon cheddar chive scone sandwich, the I Am Special salad, Sloppy Joes,#counterculturecoffee !!!	1384614515	401728510764781568	f	thetreatstruck
!!! Sat, Nov 16th no truck today! Come to The Treats Truck Stop #brooklyn! 521 court st (9th st). 8am-7pm w/food &amp; treats!!!	1384614295	401727589209079808	f	thetreatstruck
!!! Fri, Nov 15th no truck today! We were hit by another truck last month &amp; are finally getting all fixed up!	1384530874	401377693750812672	f	thetreatstruck
@jeffreyjwade we're on Bway (86 &amp; 87th) 4-7pm!!!	1384463061	401093266776391681	f	thetreatstruck
!!! Wed,Nov 13th film shoot on 45th, so we are not there today! We're on 17th st &amp; 5th ave 1-3pm! Then 4-7pm 18th st &amp; 7th ave!!!	1384365487	400684011426938880	f	thetreatstruck
50th &amp; 6th Still Going! #HolidayCatering !\nCome by for a slice	1386101979	407967387875438592	f	valduccis
50th&amp;6th today  #free zepolle all day #bestPizza	1386096034	407942453891571712	f	valduccis
Fryed calzones 50st 6ave bestpizza Free Zeppoli http://t.co/7EIlX6ZAKL	1386086273	407901512539451393	f	valduccis
Free Zepolli all day 50st 6ave	1386086133	407900922585833472	f	valduccis
Hey #Midtown 50th&amp;6th today! Enjoy the outdoors while you still can! Lovely day for the #BestPizza! #HolidayCatering #AfterParties	1386078422	407868580168867841	f	valduccis
Wat a day 50st and 6ave #bestpizza http://t.co/SZLXdpFzyu	1386071990	407841604439773184	f	valduccis
Come and Get It! #Pizza and a #Free #zepolle ! Mmmm Mmm Good! #catering We're not just pizza! http://t.co/hbnPiDhZIf	1386010208	407582472822468609	f	valduccis
#Lunch isn't over yet! 49th &amp; 6th! #Free #Zepolle today! #Catering #Afterparties Call for delivery 212 470 8476	1386008677	407576048599973888	f	valduccis
#Lunch is upon us ! 49th &amp; 6th! Call for delivery 212 470-8476 #free Zepolle! #BestPizza #Catering http://t.co/qdEhz0jacu	1386002751	407551195440357377	f	valduccis
@DritaDavanzo Eating @Valduccis on 49th St! How was the pizza? #BestPizza #mobwivesnewblood http://t.co/vh4fE40Ipa	1386001885	407547563655430144	f	valduccis
49th &amp; 6th today! Call ahead for pick up or delivery! 212 470 8476 #HappyMonday! #Catering #AfterParties #BestPizza #Zepolle Free all day	1385999997	407539643995803648	f	valduccis
#HappyMonday #NYC 49th&amp;6th today Movie shoot on 50th! Call ahead for #Delivery or PickUp 212 470-8476 #Free Zepolle all day!	1385993037	407510451405062144	f	valduccis
#AfterPaties are our specialty! #Holiday #Catering !	1385992226	407507050906648576	f	valduccis
#holidaysarecoming who will #Cater your office party! @Valduccis is your #1 choice! Check us out http://t.co/hbnPiDhZIf!	1385992146	407506715567853568	f	valduccis
#best Thanksgiving Party @Websterhall	1385587138	405807987367100417	f	valduccis
Off today! #HappyThangsgiving!!! Be back on Monday!!!! BE Safe, Be Thankful! #BestPizza #afterparty  #HolidayCatering	1385563172	405707465703952384	f	valduccis
Off today #NYC! Stay safe and warm! #HappyHoliday!	1385475548	405339944601649152	f	valduccis
RT @FoodtoEat: #Free Zeppolis from @Valduccis today on 50th &amp; 6th ave! Pre-Order your #pizza now: http://t.co/ekOCFs9cM3 #SkiptheLine #Food...	1385418920	405102431325138944	f	valduccis
#lunch isn't over yet! 50th &amp; 6th! #Free zepolle all day! #BestPizza #HolidayCatering experts!	1385404805	405043225838108672	f	valduccis
Did you know you can order from us through @Seamless ! 50th &amp; 6th today! Happy COLD Monday #midtown #NYC	1385388610	404975303010680833	f	valduccis
After a nice long break, we're back on the road in #MidtownWest today! Join us on 46th btwn 5th &amp; 6th for a yummy #LebaneseLunch	1386078183	407867579764850688	f	toumnyc
@FBachalany hehe I'm assuming autocorrect is to blame, and you meant shawarma?!	1385832102	406835441162534912	f	toumnyc
We're starting our Thanksgiving break from today. We'll be back on the road next Tuesday. Hope everyone has a great gobble gobble!	1385560597	405696665195405312	f	toumnyc
Deciding on lunch just got easier! We're on 46th btwn 5th &amp; 6th today &amp; the #shawarma is roasting! Pre-ordering is available at 917-TOUM-350	1385475496	405339726582132736	f	toumnyc
@NormaNorteg4 @FoodBank4NYC You are most welcome. It was truly our pleasure!	1385470327	405318048321929216	f	toumnyc
Today was a great success! Happy to be a part of something that helps so many! @FoodBank4NYC http://t.co/PucnLkrvSB	1385416740	405093286974849024	f	toumnyc
@FoodBank4NYC It was our pleasure :)	1385416590	405092658135461888	f	toumnyc
We're working with the @FoodBank4NYC today, handing out 1000 free hot meals all over #NYC #givingback #NoPlaceLikeNY #StayWarm	1385389198	404977768624316417	f	toumnyc
@FlavorPlease We won't unfortunately. Hope to see you on the streets though!	1385320112	404687999411429376	f	toumnyc
RT @DispatchNY: . @BrookfieldPLNY NORTH Lot 11/22/13: @MorrisTruck @ESTacoTruck @Mexicue @SchnitznThings &amp; @ToumNYC - N. End Ave./Vesey, 11...	1385135790	403914895634497536	f	toumnyc
It might be gloomy &amp; rainy outside, but that shouldn't stand in the way of a yummy lunch! We're on N. End &amp; Vesey, pre-order @ 917-TOUM-350	1385132259	403900085635137536	f	toumnyc
RT @dumbolot: .@MexicoBlvd and @ToumNYC on jay and water today!	1385056066	403580508811976704	f	toumnyc
You know what makes our #Falafel sandwich extra yummy? Our turnip pickles! Get yours today on Jay &amp; Water in #Dumbo http://t.co/dsdRUDiWcu	1385045346	403535546326077440	f	toumnyc
It's a #LebaneseLunch kind of day. Join us on 47th btwn Park &amp; Lex and give our #vegan lentil soup a try to make you nice and warm 	1384956414	403162541066436610	f	toumnyc
RT @steve_coleman: @toumNYC great Kafka!!! Thank you #foodTruck #NYC	1384892744	402895489416593408	f	toumnyc
@steve_coleman you are so very welcome! Thanks for lunching with us :)	1384892741	402895475327913984	f	toumnyc
Good morning #MidtownWest ! Your chicken #shawarma awaits on 46th btwn 5th &amp; 6th. Don't deny your rumbling tummy  http://t.co/4wl2zsGqat	1384871683	402807151032532992	f	toumnyc
RT @VendorPower: 2013 @vendyawards Rookie Finalist @ToumNYC rocked the kofta on @WPIX this morning:  http://t.co/O6u9HBpEEl	1384807137	402536424962265088	f	toumnyc
@VendorPower @vendyawards @WPIX Thank you!! We're blushing 	1384807134	402536415697059840	f	toumnyc
Toum food truck serving up delicious Lebanese food http://t.co/2RBwoYwFO6 via @WPIX	1384796985	402493845318803456	f	toumnyc
Catering now available! 908 591 4972 miamifoodmachine@gmail.com http://t.co/WujQdHZOUx	1385561777	405701616080531456	f	miamimachinenyc
Contact us to Cater your next Party or Event! Check out our Menu! #cubanfoood miamifoodmachine@gmail.com 908 591 4972 http://t.co/9Gg04o4jKG	1385053469	403569615844147200	f	miamimachinenyc
Check us out on @EatStTweet tonight! 8:00 PM Cooking Channel! Formerly known as @bongobros #deliciouscubanfood #miamifoodmachine	1385053167	403568350233907200	f	miamimachinenyc
Check out our Brand New Catering Menu! http://t.co/HRxxJhtMuV http://t.co/PRqbwOl0cP	1384525987	401357198309486592	f	miamimachinenyc
RT @bongobros: Catering Now Available! Call 908 591 4972 or Email miamifoodmachine@gmail.com for details http://t.co/vsHPD5PCs2	1384452084	401047226291855360	f	miamimachinenyc
Catering Now Available! Call 908 591 4972 or Email miamifoodmachine@gmail.com for details http://t.co/gjyuYENKg8	1384441885	401004449772347392	f	miamimachinenyc
Catering Now Available! Call 908-591-5972 or Email miamifoodmachine@gmail.com for details http://t.co/npC7ELfEYw	1384373440	400717369690968064	f	miamimachinenyc
RT @DispatchBP: . @BrookfieldPLNY NORTH Lot 11/07/13: @fritesnmeats @MiamiMachineNYC @Palenquefood @milktrucknyc @TaimMobile - N. End Ave. ...	1383837070	398467670947135488	f	miamimachinenyc
Happy hump day!! Celebrate midweek with the help of the one, the only Miami food machine at south end ave and liberty st @brookfieldplny	1383755350	398124910507491328	f	miamimachinenyc
RT @DispatchBP: . @BrookfieldPLNY SOUTH Lot, 11/06/13: @MiamiMachineNYC - South End Ave. &amp; Liberty St. until 3pm. #NYCfoodtrucks	1383750798	398105821600817152	f	miamimachinenyc
Cold weather got u down?Come down and grab a taste of Miami to warm your bones! We'll be at 33rd and park(11-2:30)	1383667836	397757851114176513	f	miamimachinenyc
Today we are on Hudson St and Charlton St from 11:30 to 2:30! #miamifoodmachine	1383581446	397395506613465088	f	miamimachinenyc
Ill try to find a spot around that area next Friday @CVillafane	1383338824	396377877362794496	f	miamimachinenyc
RT @CVillafane: @MiamiMachineNYC COME TO ROCK CENTER!!!	1383338749	396377561250660352	f	miamimachinenyc
Today we are on Park Ave btw 33rd St and 32nd St from 11:30 to 2:30! #miamfoodmachine	1383316421	396283912366092288	f	miamimachinenyc
Today we are at Brookfield Place World Financial Center North End from 11:30 to 2:30! #miamifoodmachine	1383225457	395902381134995456	f	miamimachinenyc
RT @nycfoodtruck: "Would I go back to @MiamiMachineNYC? Absolutely." RT @SnackFixation: C/o one of #NYC's newest food trucks  http://t.co/...	1383161436	395633858252931072	f	miamimachinenyc
Today we are at the World Financial Center South End from 11:30 to 2:30! #miamifoodmachine http://t.co/xOIDg6DVv0	1383140402	395545633006030848	f	miamimachinenyc
RT @richpellosie: Thanks for the killer lunch @MiamiMachineNYC! #foodtruck #cuban http://t.co/DjIHYe68Aw	1383080074	395292599390846976	f	miamimachinenyc
Today we are in Park Ave btw 33rd St and 32nd St from 11:30 to 2:30! Todays Special ((( Cuban Sandwich )))	1383059182	395204972880879617	f	miamimachinenyc
Hello fidi peeps, lunch 2day @ 10 Hanover sq b/t water st &amp; pearl st. Burger of the week THE AO TRUFFLE BIRGER. Preorder 9172929226	1386082092	407883973768253440	f	fritesnmeats
@sperodawn sorry for the late response, we r only located in the city. U can check out our loc @ schedule on http://t.co/KNYATgHmUA	1386035371	407688013800833024	f	fritesnmeats
Peeps due to a movie shoot we will NOT be on 50th st today. We will be serving it up @ 49th st b/t 6th &amp; 7th av.	1385996855	407526465459482624	f	fritesnmeats
Hello midtown peeps, Lunch 2day @ 49st b/t 6th &amp; 7th av. Burger of the week THE AO TRUFFLE BURGER. Preorder 9172929226	1385996768	407526100437581824	f	fritesnmeats
@AquariusGiants1 #brooklyn	1385866083	406977969266384896	f	fritesnmeats
RT @AquariusGiants1: @fritesnmeats \nSaw the truck this morning at a gas station on 3rd avenue.\nBK stand up!	1385866055	406977852220125184	f	fritesnmeats
Peeps - we are @ThisIsStory come on down and don't 4get to #ShopSmall	1385834638	406846077649047552	f	fritesnmeats
RT @ThisIsStory: Opening early 10 AM for SMALL BUSINESS SATURDAY w/ @milktrucknyc @Vosges @fritesnmeats Will you be there? #ShopSmall  http...	1385820332	406786074657431553	f	fritesnmeats
As we go out and shop don't 4get to #ShopSmall.  We'll B @ThisIsStory sat morning dishing out goods w/@milktrucknyc	1385780019	406616990699098112	f	fritesnmeats
Peeps-Hope U all had a great Holiday. Hope 2 C U Saturday morning @ThisIsStory https://t.co/Gij2BtkKXG #ShopSmall	1385779918	406616567200231425	f	fritesnmeats
@llDohnutsll not today bud.	1385746306	406475585159184385	f	fritesnmeats
Peeps we r off the road today	1385741240	406454337398112256	f	fritesnmeats
RT @newyorkeventsco: We want to wish everyone a happy #Thanksgivukkah. An abundance of gratitude to our followers- #Twitter wouldn't be the...	1385660950	406117579460460544	f	fritesnmeats
Eat drink &amp; be thankful. Happy #thanksgiving tweeps!!	1385660937	406117524229873664	f	fritesnmeats
Peeps we will be off the road today. Have a happy thanks giving:)	1385569552	405734224839593984	f	fritesnmeats
Hello fidi peeps, lunch 2day @ 10 Hanover sq b/t water st &amp; pearl. Burger of the week THE LATIN TWIST. Preorder 9172929226	1385478169	405350938275500032	f	fritesnmeats
Sorry peeps, we will not be serving lunch 2day :(	1385396383	405007905394806784	f	fritesnmeats
Hello midtown peeps, lunch 2day @ 50th st b/t 6th &amp; 7th av. Burger of the week THE LATIN TWIST preorder 9172929226	1385391986	404989461106544640	f	fritesnmeats
Hello fidi peeps, lunch 2day @ 10 Hanover sq b/t water st and pearl st. Burger of the week THE LATIN TWIST. Preorder 9172929226 #burgerlife	1385131435	403896630120042496	f	fritesnmeats
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
Wawr! http://t.co/NpvBsCVCw6 ahh... retreat!	1383839594	398478258091487232	f	toastmonsternyc
Herro 50th and 6th, find Toast Monster sandwiched between a phillycrepecheese and Big D.	1383837677	398470218491523074	f	toastmonsternyc
50th and 6th, Toast Monster is about ready to head to the moon. Last few days to get some toast. #operationghost	1383668278	397759706485501952	f	toastmonsternyc
http://t.co/b97mAohCra	1383591096	397435982423007232	f	toastmonsternyc
Hello Midtown peeps lunch 2day @ 50th b/t 6th &amp; 7th ave. Looking like everybody's enjoying Frite's meats! #yum #hashtag #realgood	1383590588	397433848151429121	f	toastmonsternyc
Happy Monday 50th and 6th! Celebrate your favorite day of the week with something that taste real good in your mouth. #realgood #inyourmouth	1383576302	397373931713478656	f	toastmonsternyc
I said happy Halloween!! Rawr!	1383322390	396308945511657473	f	toastmonsternyc
Happy Halloween 50th and 6th! Toast Monster favorite holidays of the millenniums. #hashtag #halloweenforever #word	1383315396	396279609467363328	f	toastmonsternyc
@funbunsnyc Hey hey keep your mushrooms away from my buns... I mean toast. #word	1383146886	395572829485166592	f	toastmonsternyc
Good Morning NYC! We are serving lunch today on 26st btw 11th &amp; 12th Ave from 11:30am to 3pm. So #comegetsome #soups #salads #paninis #wraps	1386081914	407883229044015104	f	freshandhearty
Your favorite lunch truck is back! #Comegetsome #Paninis #Soups #Salads #Wraps	1386003341	407553668259803137	f	freshandhearty
nYc we are back! Catch us on 47st btw Park ave &amp; Lexginton ave today for lunch serving your favorite Paninis, Soups, Salads &amp; Wraps.	1385995925	407522565230690304	f	freshandhearty
@Jayz3510 @bxlea Sorry guys we are still out of commission. We r redesigning our truck in order to serve u better. Thank you 4 supporting!	1385142244	403941966985314304	f	freshandhearty
@bxlea We are back! We going to be on the road tomorrow. We don't know where but keep an eye out for our tweet. Thank you for supporting us!	1384879120	402838343987523585	f	freshandhearty
Fresh and Hearty is still closed due to our power generator in shop for repair. Sorry folks we are going to be closed for few more days. =(	1384186109	399931644364070912	f	freshandhearty
@Jayz3510 We will be back in action next week. Sorry for the inconvenience...	1383674145	397784312244088832	f	freshandhearty
RT @Jayz3510: @FreshandHearty Come back to Old Slip!!  Going thru panini withdrawal!	1383673943	397783467528040449	f	freshandhearty
@bxlea Thank you!  =)	1383660835	397728488796745729	f	freshandhearty
Fresh and Hearty truck is out this week due to power issue with our generator. We will be back on the road next week. Sorry! =(	1383585975	397414501160460288	f	freshandhearty
TGiF! Fresh and Hearty is doing a venue on South St/Pier 36. So come out and enjoy your Friday with Fresh and Hearty on Pier 36 #comegetsome	1383318172	396291253706715137	f	freshandhearty
Fresh and Hearty is doing a venue on South St/Pier 36 BasketBall City. So come out and enjoy your day with Fresh and Hearty on Pier 36.	1383225615	395903044329951232	f	freshandhearty
Checkout our Lunch specials and Combo deals starting from $5! We offer wide variety of flavors to accommodate your taste buds. Check it out!	1383146063	395569378382856193	f	freshandhearty
Open at 11:00am	1383666038	397750311051599872	f	grillonwheelsny
Place your order for pickup now by calling 347-440-2467. Check our menu on http://t.co/yu5oSxjLEw &amp;order now #Soups #Salads #Paninis #Wraps	1383145925	395568799694745600	f	freshandhearty
Good Morning Fresh and Hearty Lovers! We serving lunch today on 47st btw Park Ave &amp; Lexington Ave from 11:30am to 3pm.	1383145760	395568107986894848	f	freshandhearty
Update! We serving lunch on Broadway btw 52st &amp; 53st from 11:30am to 3pm. So don't wait get your order in now! To order call us 3474402467	1383058336	395201423371403264	f	freshandhearty
Good Morning NYC! We serving lunch on Broadway btw 56st &amp; 57st from 11:30am to 3pm. So don't wait get your order in now! Call us 3474402467	1383056975	395195716013797377	f	freshandhearty
RT @bxlea: @FreshandHearty YAY!! Lol thanks ! Happy Friday !	1382715435	393763192213868544	f	freshandhearty
RT @bxlea: @FreshandHearty could we be lucky enough to have you in this area again ?  (47 th &amp; park)	1382715428	393763161306058753	f	freshandhearty
RT @bxlea: @FreshandHearty Hi !! Where are you today ??	1382715418	393763122529697792	f	freshandhearty
Greenwich st &amp; Park place, the #Schnitzcart is posted up from 11:00-2pm for your schnitzy pleasures:) preorder 917-575-4377. Hope 2 c u out!	1386084029	407892100823670785	f	schnitznthings
Morning guys:) the weather outside calls for a schnitz! #Schnitztruck will be on 52nd st b/w 6th &amp; 7th ave 11:30-2pm.Preorder not avail 2day	1386083860	407891391881416704	f	schnitznthings
 means a lot! RT @justyniak: @schnitznthings I can't breathe/move. So full !!! Loved every forkful 	1386003848	407555798223826945	f	schnitznthings
:) Enjoy!RT @justyniak: Lunch @schnitznthings. Pork schnitzel. Mmm ...  #nyc #tribeca #foodtrucks http://t.co/fq9phy9sjd	1386002402	407549729565061121	f	schnitznthings
@justyniak I had to!	1386002367	407549583229980672	f	schnitznthings
Thanks to the always lovely @justyniak for bringing us this incredible cake! You're the best! Love ya! http://t.co/YVTK4seQfd	1386001872	407547508685307904	f	schnitznthings
The #Schnitzcart will be on Greenwich st &amp; Park pl 11AM-2PM. Hope u had a great holiday weekend.  preorder 917-575-4377	1385988876	407492999816298497	f	schnitznthings
The #Schnitztruck will be heading to Varick and Charlton sts today from 11:30-2pm.  Come get some warm delicious schnitz:)	1385988675	407492155733577728	f	schnitznthings
Hey guys, hope you had an amazing holiday weekend :) Here's the schedule for the week http://t.co/GPzWZbfFSC Hope you missed us:)	1385988534	407491562734485505	f	schnitznthings
Bitte! RT @ReneeStephanie_: Eating #SCHNITZEL for the first time since being back from  #Germany.. #omg SO GUT.. Danke @schnitznthings	1385492914	405412785674518528	f	schnitznthings
Morning guys. The #Schnitztruck will be on 52nd st b/ 6th &amp; 7th aves from 11:30-2pm. Get ur pre thanksgiving schnitz! Preorder 347-772-7341	1385477829	405349510953848832	f	schnitznthings
#Schnitzcart will be on Greenwich st &amp; Park Pl from 11:00-2pm.  This will be our only day out this week with the cart so come by 4 schnitz	1385382005	404947597112008704	f	schnitznthings
The #Schnitztruck will be on Varick and Charlton from 11:30-2pm.  To our hudson &amp; KIng peeps, come by a lil later! preorder 347-772-7341	1385381907	404947185864675328	f	schnitznthings
Hi guys,  here's this weeks schedule http://t.co/GPzWZbfFSC  It will be a short week so if you want ur schnitz get it early:)	1385381789	404946692153147393	f	schnitznthings
RT @DispatchBP: . @BrookfieldPLNY NORTH Lot 11/22/13: @MorrisTruck @ESTacoTruck @Mexicue @SchnitznThings &amp; @ToumNYC - N. End Ave./Vesey, 11...	1385133434	403905015540383744	f	schnitznthings
This goes out 2 the WFC people yearning for schnitz! The #Schnitztruck will b there from 11:00-3pm. MMM warm schnitz:) preorder 347-772-7341	1385122350	403858526071963648	f	schnitznthings
TGIF! remember the #schnitzcart will be on 49th st b/ 6th &amp; 7th today from 11:30-2:00pm. Come by and have a schnitz! Preorder 917-575-4377	1385122189	403857850004676609	f	schnitznthings
No YOU'RE AWESOME!RT @thatjaydigger: Finally got my @schnitznthings fix. You guys are awesome!	1385059623	403595430715723776	f	schnitznthings
TY:)RT @valuhree_color: May or may not have taken the subway during lunch so I could get @schnitznthings today. SO worth it. I've missed it.	1385059596	403595315011661826	f	schnitznthings
51st between park and madison we hope you're ready for ur Thursday schnitz:) #Schnitztruck will b there 11:30-2pm. Preorder 347-772-7341 Cya	1385040243	403514144626061312	f	schnitznthings
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
We've got those hot buns on 50th btwn 6th and 7th ave! Two weeks (10/31) left till the end of our season.	1382361264	392277693422903296	f	funbunsnyc
Friday morning on 50th st btwn 6th and 7th ave !	1382101616	391188649725161472	f	funbunsnyc
Cinnamon Snail LOVES pigs in a blanket http://t.co/mj5BluXEOW	1386115321	408023347617099776	f	veganlunchtruck
@HaggsBoson glad ya loved it!  If you have a chance, love up the snaily here: http://t.co/Jp1ucj96aJ	1386114064	408018074701692928	f	veganlunchtruck
Chilling out at home tonight in the mood for a life changing film?\n\nIf you haven't seen it already, you NEED to... http://t.co/glIUzdvfF0	1386108487	407994684108455936	f	veganlunchtruck
Thanks for showing us what for in FiDi today. We love our wall st peeps!\n(Pic by our twitter follower @franklanguage) http://t.co/q7qrZj60Ae	1386100211	407959971008348160	f	veganlunchtruck
@sisiwei glad you loved it!	1386099965	407958941617115136	f	veganlunchtruck
@VeganMos thanks &lt;3 we are honored	1386095925	407941995366465536	f	veganlunchtruck
RT @VeganMos: Congratulations to Adam and the entire team @VeganLunchTruck for winning the @VegNews poll for best Street Cart/Food Truck! B...	1386095913	407941945261314048	f	veganlunchtruck
On Wall &amp; Water til 3:00\n\nWe have chipotle breakfast burritos, kbbq seitan, winter hulk donuts, pumpkin pie donuts &amp; coffee streusel twists	1386080013	407875256695934977	f	veganlunchtruck
#Vegan NYC REPRESENT!\n\n@VeganLunchTruck @SWEETandSARA \n@BabyCakesNYC &amp; @candle79 all take top honors in the 2013 @vegnews #veggieawards	1386044063	407724468304633856	f	veganlunchtruck
@doorsixteen is your fave still the coconut Thai basil glazed?	1386028736	407660185264873473	f	veganlunchtruck
RT @VegNews: Buyer beware: @Kohls is selling rabbit fur clothing accessories as faux on its website.	1386025273	407645659974881280	f	veganlunchtruck
Loved the Thanksgiving food you got from us? Share your love for Snaily!\n\nThe word of mouth is greatly appreciated. \n\nhttp://t.co/x7NF1FGRrm	1386015664	407605356106637312	f	veganlunchtruck
@xmszmandi hope you found us.  We were on 48th between 6th-7th 9:00-3:00	1386014865	407602005365256192	f	veganlunchtruck
Looking for a wilderness-moose to cook upon our truck!\nWill help you obtain licenses from NYC Moose Dept. \nEmail\nthecinnamonsnail@gmail.com	1386012021	407590078106861568	f	veganlunchtruck
@PowerCutJewelry @veggiefixation hope ya loved everything! 	1386010812	407585005981171712	f	veganlunchtruck
@sweetntasteme snuggling with my doggy  http://t.co/Hwyl9RQY4Y	1386010785	407584890272894976	f	veganlunchtruck
PLEASE RT:\nParked @ 48th &amp; 6th until 3\nWe have Red Curry Grilled Tofu Banh Mi with pickled onions and basil, kimchi, arugula &amp; sriracha mayo	1385995021	407518773466652672	f	veganlunchtruck
@quarrygirl you are just a beast with a camera.	1385918425	407197507689938944	f	veganlunchtruck
Looking for a gift for a snail fan you know?\n\nOur @Etsy shop is stocked w/ CS shirts, hoodies &amp; gift certificates\n\nhttp://t.co/lq07xhlgf8	1385911992	407170524356542464	f	veganlunchtruck
THIS WEEK's SCHEDULE:\n\nMon: 48th &amp; 6th\nTues: wall st &amp; water\nWed: 55th &amp; Broadway\nThurs: 21st &amp; 5th (11:00-3:00),... http://t.co/Q5i9NsmVZv	1385910152	407162805964767232	f	veganlunchtruck
@shazanam off today, back at 46th and park tomorrow!	1386095740	407941218396811265	f	nautimobile
@Karlamalia 23rd and park on Thursday	1386095726	407941161920520193	f	nautimobile
@sorceresssoul we do. We are also huge Jennifer Lawrence fans	1386009879	407581090568994816	f	nautimobile
What should we get our moms for Christmas? We have a hippy, a nerd, and a wildcard. Bring your ideas to 46th and park today!	1385996697	407525804483309569	f	nautimobile
"A Very Ja Rule Christmas" happening over here at 67th and broadway today. Serving HOT chowder.	1385823990	406801415303340033	f	nautimobile
67th and broadway for your Black Friday eats.	1385740323	406450493725368320	f	nautimobile
We just ate so much we need a new pair of dungarees. Up early tomorrow in Lincoln square with you guys for Black Friday!	1385690171	406240139342774272	f	nautimobile
@heymikewaskom Golden Corral?	1385673060	406168371215216641	f	nautimobile
Change of plans! Due to weather and a lot of you being out of town, we will not be out today! We will be in midtown west all weekend though!	1385532549	405579025818857472	f	nautimobile
We WILL be in midtown tomorrow for lunch!	1385499233	405439286666723328	f	nautimobile
@JamesSpier not today! In midtown tomorrow though!	1385498216	405435020908580864	f	nautimobile
A special Monday visit to 46th and broadway. Prime your guttyworks for thanksgiving with some lobster..mmm	1385399061	405019136553910272	f	nautimobile
46th and park tomorrow. We won't be there Friday after thanksgiving so we are making it up now!	1385343672	404786816131534848	f	nautimobile
67th and broadway today. Shove your frozen fingers in a hot clam chowder, or eat it.	1385314479	404664373547130880	f	nautimobile
@toucy not quite yet!	1385229722	404308874930692096	f	nautimobile
Shopping? All the consumerism making you hungry? Well we are at 67th and broadway infront of the apple store!	1385225101	404289493366501376	f	nautimobile
Did you know cheese has opiate like qualities? Come feed your addictions at 46th and park with a lobster grilled cheese #gettinhighoncheese	1385132131	403899550945247232	f	nautimobile
I just bought a pound of cheese at a deli. When I paid they gave me a fork &amp; some napkins. Come enjoy the comedy of life with us,23rd &amp; park	1385052120	403563960177549312	f	nautimobile
@randomfoodtruck too crowded there these days! We couldn't :/	1384961705	403184730117779456	f	nautimobile
Change of plans! We are back at 46th and park today. Sorry 55th your food truck party was full!	1384961676	403184610420719616	f	nautimobile
@a_felBEAST our apologies, come to the truck next time.. Show us ur tweet and ur sandwich will be on us.	1386101493	407965347355320321	f	disosnyc
@Mr_Milhouse no excuse for that, our sandwiches are more respectable than that. If you choose to come back to us we got you..	1386101240	407964286812979200	f	disosnyc
Specials for today: Hot roast beef with au jus, fresh mozzarella or provolone, with or without grilled onions.\n\n-... http://t.co/Xy84p9yxlA	1386081167	407880094892703744	f	disosnyc
We are posted up on 48th between 6th and 7th ave today.. Open at 11\n\nCalls in for pick ups welcome: 917-756-4145\n\nThanks,\n\n-the society	1386080811	407878603729543168	f	disosnyc
Open for business: 47th between Park and Lex\n\nCall ins welcome: 917-756-4145\n\nToday's special: hot roast beef... http://t.co/NPU024noKk	1386002044	407548229627432960	f	disosnyc
Posted up on 47th between park and Lexington today.. \n\nToday's special: hot roast beef with au jus, fresh... http://t.co/rSsOBG6Qnx	1385996684	407525747021324288	f	disosnyc
Here's our schedule for the week:\n\nMon: 47 and park ave\nTues: 48 bet 6 and 7 ave\nWed: soho- varick and charlton... http://t.co/Pla8lIwEhB	1385937959	407279435793305600	f	disosnyc
Disos roast beef sandwich special this week. Home cooked prime roast beef, with au jus. Ready for tomorrow lunch.. http://t.co/8jdhnt6DWZ	1385933210	407259518633254912	f	disosnyc
We're hangin on 37th and 7th ave..	1385581641	405784932162605057	f	disosnyc
RT @iambobbystern: Welcome home we missed you! @DiSOSNYC #varick #charlton #bestherosinnyc #birthdaylunch http://t.co/D6BGWezduA	1385577616	405768050559168512	f	disosnyc
@iambobbystern hey man happy birthday! Should have let us known.. Would have given you the bday discount..	1385577598	405767972490575873	f	disosnyc
BREAKING WEATHER REPORT!!! It's drizzling and 60 out..\n\nOpen at 11.  Or call it in 917-756-4145	1385567512	405725669419937792	f	disosnyc
Soho, we at the spot on that corner..\n\nCall in pick up orders, we got you covered like a blanket.\n\n917-756-4145	1385563171	405707462533480448	f	disosnyc
RT @gracebalances: @DiSOSNYC we. are. so. EXCITED. to. see. YOU!!!	1385506007	405467699808960512	f	disosnyc
RT @CourtneyPollack: #FoodTruckFind: @DiSOSNYC! #MickeyScars #MoltoBene   @nycfoodtruck http://t.co/raAHgABfuu	1385495029	405421655981178881	f	disosnyc
RT @NYK_NYR_USA: @DiSOSNYC Always on point. 'Jimmy Two Times'. http://t.co/V6FOPvXf3Z	1385491317	405406087417167872	f	disosnyc
Out of bread. Closed.	1385490035	405400707844407296	f	disosnyc
48th between 6th and 7th ave.. We're here now.. \n\nTaking call in orders all day: 917-756-4145 http://t.co/mcQG2qO8t4	1385477947	405350005885902848	f	disosnyc
Wow it's like we never left! 47th and Park.. Hitting it hard first day back on the streets! Thanks everyone,... http://t.co/AqqWqgMakm	1385403416	405037401484959744	f	disosnyc
First day back, open for lunch!	1385396741	405009403985682432	f	disosnyc
we are closed for today - thanks for coming!:)	1386100375	407960659390107648	f	polishcuisine
Reminder: We are on 52nd b/w 6th and 7th - closer to 6th @midtownlunch	1386088641	407911442625486848	f	polishcuisine
Lunch ready from 11:30 - 2:30 - Follow the Smoke from our Smokin' grilled kielbasa, potato &amp; cheese, meat, kraut... http://t.co/p3RtzVhV3l	1386088617	407911342071627776	f	polishcuisine
We are back on 52nd b/w 6th and 7th - closer to 6th with the freshest pierogi you can get!	1386084634	407894637941379072	f	polishcuisine
@maxmamis at some point... Not sure exactly when	1386038069	407699330813161472	f	polishcuisine
RT @annieswit: @PolishCuisine come to Chelsea! RT "@Jay2338: @annieswit Rogies for lunch sucka http://t.co/oBBpt6AsS7	1386008115	407573691330211840	f	polishcuisine
We are on 33rd and Park - merry with Smokin grilled kielbasa, potato &amp; cheese, meat, kraut &amp; mushroom + PACZKI... http://t.co/lcIlX7WaPf	1385999769	407538689401950208	f	polishcuisine
Hope everyone had a great thanksgiving week! We are back on the street - 33rd and Park - see you soon!	1385998126	407531794397810688	f	polishcuisine
real hand-made leather kids booties\nhttp://t.co/nMR24WxdQC http://t.co/qGPhyLLPl8	1385672785	406167219216076800	f	polishcuisine
Happy Thanksgiving everyone!!! Hope it's wonderful!	1385668710	406150127586672641	f	polishcuisine
In keeping with our culture and tradition, we are happy to introduce our new website:\nhttp://t.co/nNChWdsu1u	1385502295	405452130888081408	f	polishcuisine
RT @RateThatTruck: We took a trip back to the Old Country to try some kielbasa and pierogis from @PolishCuisine. Very satisfying meal. http...	1385493125	405413666817716224	f	polishcuisine
Hi everyone- we are off the road this week. Wishing everyone a happy and safe Thanksgiving week!	1385399199	405019714227019777	f	polishcuisine
Hi everyone- we are off the road this week! Wishing everyone a happy and safe Thanksgiving week! #pierogitime #savethecravings	1385398863	405018305750003712	f	polishcuisine
Change of plans for today: we are on Park Ave b/w 32nd and 33rd- happy Paczki Friday!	1385130280	403891785979920384	f	polishcuisine
closing up for today!	1385062918	403609250703757312	f	polishcuisine
http://t.co/XBIOnjSDMq	1385058994	403592792162963456	f	polishcuisine
RT @randomfoodtruck: Solid Thursday crew: @TheSteelCart @PolishCuisine @wingnitnyc @mactruckny @mikenwillies. Stay warm guys!	1385058267	403589740735496194	f	polishcuisine
I posted a new photo to Facebook http://t.co/V7q8frpoQ9	1385050900	403558842799505408	f	polishcuisine
http://t.co/XEIQrNvLCl	1385050552	403557384963899392	f	polishcuisine
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
46th off 6th ave today. Open	1383666021	397750240457281536	f	grillonwheelsny
46 &amp; 6 ave for lunch till 03:30. come for the best old style cheesesteaks in #nyc. combo w/ fries &amp; drink $10 only. #midtown #lunch	1370962868	344469353183449088	f	steaksncrepes
50 st bet 6 &amp; 7 ave for lunch till 03:30. come for the best old style cheesesteaks in #nyc. combo w/ fries &amp; drink $10 only. #midtown #lunch	1370877243	344110215957995522	f	steaksncrepes
RT @mike_cbsradio: Back to back steak sandwiches! Today @BigMikeCBS dives into a 12 incher &amp; fries from @steaksNcrepes #SamturLunch http://...	1370614388	343007724520472576	f	steaksncrepes
RT @stayinalivemoma: It's Dec 1 - time to think about #christmastrees #presents and @BrooklynPopcorn mmmmmm http://t.co/UI3s2UByGy	1385993248	407511335161692161	f	brooklynpopcorn
35% OFF Everything - CYBER MONDAY SALE	1385993193	407511106563739648	f	brooklynpopcorn
RT @EjLiz79: @BklynSquint @Anth3aG @cecimartin LOL Elena make sure she gets that Brooklyn popcorn ;-)	1385922164	407213187726323712	f	brooklynpopcorn
RT @echosmith: Cajun popcorn! Plus this dude gave me a large for the price of a small. @BrooklynPopcorn http://t.co/LyyQwc7FhV	1385918905	407199517784952832	f	brooklynpopcorn
RT @heyitsaprilsay: @echosmith @BrooklynPopcorn oooo look at you sweet talking your way into getting larger food portions \n\nI'm so proud	1385918900	407199500399554560	f	brooklynpopcorn
@echosmith Happy Holidays - glad  to hear you loved our popcorn :)	1385918887	407199443692171264	f	brooklynpopcorn
@EjLiz79 @Anth3aG @BklynSquint @cecimartin - Thank you - now you can get it at 35% off Black Friday Sale - one day only - @BrooklynPopcorn	1385731881	406415084437528576	f	brooklynpopcorn
BLACK FRIDAY SALE!!! - 35% OFF EVERYTHING!  BIGGEST Sale of the year! ONE DAY ONLY!!!	1385731773	406414630739644416	f	brooklynpopcorn
Brooklyn Popcorn Truck will be on Prince and Broadway after 11:30am today Happy Thanksgiving Everyone!!!!!	1385669185	406152116906897408	f	brooklynpopcorn
@Brooklyn_Taneil Right here Brooklyn - @BrooklynPopcorn	1385484218	405376311821991936	f	brooklynpopcorn
@JGallo02 She should have gotten a bag of @BrooklynPopcorn	1385484192	405376199104286720	f	brooklynpopcorn
@goodsam1112 Hi Samantha, we're on 46th and park today	1385484126	405375922984869888	f	brooklynpopcorn
@sodevious Hi, we're on 46th and park today	1385484113	405375869746556928	f	brooklynpopcorn
@BrooklynPopcorn Truck on 46th and Park ave come by we're cooking all your favorite flavors!!!!!!!!!	1385484091	405375775303426048	f	brooklynpopcorn
RT @kakea107: @BrooklynPopcorn thanks! Every Thursday? :-)	1385350174	404814089148694528	f	brooklynpopcorn
RT @chefanthony2: @BrooklynPopcorn http://t.co/W39avCvQRl	1385350145	404813965014097920	f	brooklynpopcorn
@kakea107 55th and 5th ave	1385060432	403598822045020161	f	brooklynpopcorn
@UberFacts some of them come to @BrooklynPopcorn for their cravings	1384971374	403225287116066816	f	brooklynpopcorn
@BrooklynPopcorn Forgettaboutit! http://t.co/47kWBmBrL4	1384971236	403224708314722304	f	brooklynpopcorn
@itsOneO Does Brooklyn eat @BrooklynPopcorn ?	1384971135	403224284803244032	f	brooklynpopcorn
We are back on 38th and #Broadway! #comegetsome #nyc for some #tacos #burritos #ricebowls ! Will be here till 2:30!	1386082263	407884691652362240	f	domotaco
49th and 6th for lunch!!!	1385998543	407533545356537856	f	domotaco
DUMBO today!!! @dumbolot @dumbonyc @dumbofoodtrucks	1385569028	405732030907838464	f	domotaco
sorry got kicked out. we're on 47th btwn 1st and 2nd ave! tell your peeps! #newnew	1385485598	405382096337649664	f	domotaco
@rearnakedchoke @jbluft @laura_palumbo that's today!! on 38 and bway	1385480198	405359448665100288	f	domotaco
38th and broadway for lunch today!!!	1385479469	405356390652592131	f	domotaco
RT @Laura_Palumbo: my first @DomoTaco didn't disappoint. This pork is AMAZING. Thank you!	1385404413	405041584628310016	f	domotaco
Late post...50th and 6th today for lunch.	1385404005	405039872362033152	f	domotaco
49th ad 6th today for lunch!!!	1385132572	403901397739241472	f	domotaco
RT @mooshugrill: Nothing bumps productivity like a solid lunch! #MSG just a couple of short blocks south of @wework on Howard &amp; Lafayette! ...	1385053927	403571539754635264	f	domotaco
53rd and Park today for lunch!!!  We're on 53rd.	1385045548	403536395014537216	f	domotaco
RT @mooshugrill: Where's the 1 place in #chinatown you'd be glad to find #MSG? Crosby &amp; Lafayette with $7 #ricebowls yo! @downtownlunch @ny...	1385041340	403518746238939136	f	domotaco
We're in DUMBO today for lunch @dumbolot (jay and water) @dumbofoodtrucks @dumbonyc	1384959413	403175120296214528	f	domotaco
RT @jackierisser: man alive, @DomoTaco. you made my life today.	1384925969	403034841903816704	f	domotaco
We're back on 38th and broadway!!! Ready at 11:30!	1384872997	402812665258868736	f	domotaco
50th and 6th today for lunch!!!	1384787198	402452795066187776	f	domotaco
RT @Anika_NYC: @domotaco isn't your avg Chipotle @jcimino12... #foodtruckfriday plz @tomblacknyc http://t.co/80DhtlXnaw	1384629061	401789522197102592	f	domotaco
#tacos and #nachotots for lunch today on 49th and 6th!!!	1384526343	401358691565568000	f	domotaco
@thebigcherndog you know we try! thanks!	1384462117	401089307244785664	f	domotaco
53rd and park for lunch today!!!	1384443858	401012724853133312	f	domotaco
@adamreiner @dumbolot Never forget!!	1386103368	407973215000989696	f	kimchitruck
RT @dogboki: today's lunch: short rib burrito (extra spicy, multi-grain rice) from @KimchiTruck. Delicious. @DUMBOFoodTrucks	1386094383	407935526369767424	f	kimchitruck
You sure could use a juicy Korean bbq short rib burrito now, couldn'tja? Well what do ya know? No lines! @dumbolot	1386090255	407918214304112640	f	kimchitruck
RT @dumbolot: .@sweetchilinyc @KimchiTruck and new addition @carlssteaks today! Don't believe? Check out @Datalot's lot stream! http://t.co...	1386085313	407897483202007040	f	kimchitruck
Today &amp; more Tuesdays to come, we're hitting up @dumbolot #Dumbo we're back! 11:30am - 2:30pm	1386083563	407890146764132352	f	kimchitruck
@HoracioSeis Done for today, but we're going to be at @dumbolot tmrw. \nJay &amp; Water St. 11:30 - 2:30	1386020536	407625792479174656	f	kimchitruck
RT @tjmmachine: Yum yum yum yum yum yum yum! Hooray for @KimchiTruck	1386010704	407584551603830784	f	kimchitruck
Our sister resto @KimchiGrill is looking for rockstar cashiers. Know someone? Send them this way!	1386005097	407561033679507456	f	kimchitruck
Turkey-ed out? Make it a taco Monday. N. End Ave &amp; Vesey St.	1385997009	407527109309894657	f	kimchitruck
We're staying in today on account of our massive food coma. See y'all Monday!	1385734405	406425670470737921	f	kimchitruck
RT @ChocolateSoleil: Kimchi turkey  @KimchiTruck: Cramming our bellies full of kimchi turkey today. Happy #Thanksgivukkah. Thankful for ...	1385734354	406425454841970688	f	kimchitruck
Cramming our bellies full of kimchi turkey today. Happy #Thanksgivukkah. Thankful for our fans!	1385649360	406068965904228352	f	kimchitruck
Park Ave &amp; 47!!	1383577283	397378045050630145	f	grillonwheelsny
@dumbolot @sweetchilinyc Sorry for our turkey brain. Making it a @dumbolot Tuesday!	1385478815	405353647954874368	f	kimchitruck
@KimchiTruck Change of plans. We're hitting up @DumboLot today. See y'all in Brooklyn.	1385478658	405352991076528128	f	kimchitruck
Make it a #TacoTuesday. Varick &amp; Charlton St. 11:30am - 2:30pm	1385477119	405346535350620160	f	kimchitruck
@laurablagys Agreed! Feel better!	1385420711	405109942249455616	f	kimchitruck
@deee_soares Sorry, we're cash only	1385398252	405015741105049601	f	kimchitruck
RT @HenryWilliams74: @KimchiTruck By the way, LOVE your tacos. Would push my own brother down a flight of steps for a few short rib (fyi, m...	1385397181	405011250356420608	f	kimchitruck
@HenryWilliams74 Sorry. It looks like the lot actually opens at 11:30.	1385394128	404998446320320512	f	kimchitruck
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
@BMP326 water and wall Monday and Wednesday. I know it's a hike from there but let us know if you're coming so we can look out!	1386122771	408054594783424512	f	philssteaks
@LucastheLions we still love you, but we took Lil Jawn off the road for the winter and won't be back to WFC til spring.	1386118156	408035236975738880	f	philssteaks
@BMP326 won't be there this winter my man. Hope to be back in April. Sorry to leave you craving	1386118073	408034892568887296	f	philssteaks
RT @MichaelAVillena: Dropped all my work, headed to NYU for @PhilsSteaks Philly cheesesteaks are priorities	1386117979	408034496077115392	f	philssteaks
See you this Friday &amp; Saturday at BeerFest. Grab your tickets here: \n\nhttp://t.co/N43y6kkTQ0	1386116615	408028775083806721	f	philssteaks
Cheesesteaks. They're what's for dinner. Come down to W. 4th n Greene to get your Phil's phix! Serving til 8	1386102802	407970838622007296	f	philssteaks
RT @12BarsNYC: @PhilsSteaks Please RT for #GivingTuesday! Support @FoodBank4NYC at Saurday's 12 Bars of Xmas charity bar crawl. http://t.co...	1386086142	407900961634779137	f	philssteaks
Beautiful December Tuesday. Get outside for lunch! Locations:\n\nBig: 41st n 6th til 2\nOG: 52nd n 6th til 3	1386086112	407900834714763265	f	philssteaks
RT @SLPnyu: Yum!!! Can't wait to taste your Philly cheesesteak! Will you be on campus tomorrow? RT @PhilsSteaks: Dinner at NYU - W. 4th and...	1386034356	407683754455760896	f	philssteaks
RT @StreetShakes: @PhilsSteaks cool trucks.	1386034349	407683725791875072	f	philssteaks
@chefesp1975 thank you good sir!	1386034321	407683609810972672	f	philssteaks
@SLPnyu we will be there! 3 - 8 pm	1386034281	407683443158679553	f	philssteaks
RT @Foodtruckstars_: S/o to @PhilsSteaks  for following! Way to be the first in #foodtruckstars from Newyork !! Good things comin your way....	1386027251	407653954752118784	f	philssteaks
RT @FoodtoEat: This Fri&amp;Sat some of our #FoodTrucks @PhilsSteaks @NuchasNYC will be @LivingSocial BeerFest at Skylight One Hanson ! http://...	1386027219	407653823172587520	f	philssteaks
Dinner at NYU stern! W. 4th and Greene til 8. Get your Phil!	1386019146	407619959129657344	f	philssteaks
Dinner at NYU - W. 4th and Greene til 8!	1386019014	407619407968350208	f	philssteaks
@TatianaKing we love your dedication! Thanks Tatiana!	1386009809	407580798897119233	f	philssteaks
RT @TatianaKing: Hopped on the subway just to pick up a juicy cheesesteak from @PhilsSteaks truck! Yessss gawd!!! #BigJawn	1386009764	407580607594917888	f	philssteaks
RT @joMarshprincess: O yeah o yeah can't wait for @PhilsSteaks 	1386005590	407563100611936256	f	philssteaks
You don't want to miss out on this one pholks! BeerFest is in 5 days!!! Get your tickets today! #LSBeerFest... http://t.co/rtjR4WRQV5	1386004300	407557690576371712	f	philssteaks
RT @gladyssandwich: SHORT RIBS w/\nPanisse, Purple Potatoes, Roasted Carrots, Beef Jus\n#BeefItsWhatsForDinner	1386110747	408004162329538560	f	morristruck
RT @RockPublicity: How is it possible for grilled cheese to be so good? 'Murica, f-yeah! @morristruck http://t.co/Dbp43YIDtT	1386110718	408004040464039936	f	morristruck
@thecresh Find us outside @LivingSocial's Beerfest in Brooklyn!	1386110706	408003990019141632	f	morristruck
29th &amp; Park Tuesdays! Try our Raclette + Garam Masala Brown Butter + Roasted Squash grilled cheese. It's #sogood cc: @katespadeny	1386093490	407931780109725696	f	morristruck
#crispycheesecrave	1385792873	406670904525987840	f	mexicoblvd
29th &amp; Park is the place to be on Tuesdays! Get yourself over here, hot cheese and hot cider await you! Open for lunch 1130-3! #hothothot	1386087164	407905248598966272	f	morristruck
RT @jwarach: It's Tuesday? That means the @morristruck is in my 'hood. Yay! Oh wait, I brought lunch today. Drat. It'll prob keep in the fr...	1386083266	407888898124427264	f	morristruck
52nd &amp; 6th! Ease out of your Thanksgiving food hangover with a expertly grilled cheese. #MondayFunDay	1386005948	407564604328673280	f	morristruck
Alright 52nd &amp; 6th folks! Lets get this month going on the right foot- we're open at 12 and wanna feed you! #habanerochicken #hotnspicy	1386000120	407540160922791936	f	morristruck
Alright #midtown folks- the week has begun and we're headed your way!	1385994572	407516890504781824	f	morristruck
Hey folks, we're still off the street this weekend, but will be back in full force on Monday at 52nd &amp; 6th!	1385816559	406770248269189120	f	morristruck
Happy #Turkey Day, Grilled #Cheese Lovers! We're so #thankful for you all.	1385658643	406107902970449921	f	morristruck
RT @jwarach: @morristruck I got the Gouda. 'Twas awesome. A coworker got the Sweet Mascarpone and said it was amazeballs.	1385514256	405502296772976642	f	morristruck
@jwarach Thanks, Jeremy!! What'd you get?	1385502621	405453496020774912	f	morristruck
29th &amp; Park, 29th &amp; Park! O how we love 29th &amp; Park! We're slingin' and singin' till 3, y'all! #getcheese #hotcider	1385487510	405390119508910080	f	morristruck
We're at 29th &amp; Park with some amazing sandwiches to get that appetite going in preparation for the big day! #turducken #wildboar #hotcider	1385482088	405367374146060288	f	morristruck
Coming your way, 29th &amp; Park! #grilledcheeseforlunch	1385476361	405343355674304512	f	morristruck
@LariBerry23 LOVE the picstitch, girlfriend!	1385437204	405179120688324608	f	morristruck
RT @viktute: Oh look, lunch just pulled up. Gouda &amp; bacon, yes please. #midtownlove @morristruck @kevinmelhuish... http://t.co/HUEa8N5TGR	1385437163	405178945810997248	f	morristruck
SHORT WEEK! Come celebrate with a wild boar sausage grilled cheese + hot cider on 52nd &amp; 6th! #MidtownLove	1385400710	405026051577094144	f	morristruck
It's Monday but the weeks already almost over! Come celebrate with a grilled cheese and hot cider on 52nd &amp; 6th!	1385395731	405005170209468416	f	morristruck
I funded a project on RocketHub https://t.co/WcQBN3jTJm	1386093387	407931349446582272	f	palenquefood
Soup Of the day is "beef sancocho" comento wall at and hanover to get it! Yummmmm	1386089035	407913096200876032	f	palenquefood
Good Morning New Yorkers Come Enjoy Our Lovely Arepas Glutton Free On Your  Favorite Food Truck PALENQUE!!! On Wall Street &amp; Hanover... Chao	1386085480	407898186930720768	f	palenquefood
Today delicious beef sancocho soup, We are at World Financial Center\nS End Ave New York, NY  10007	1386006764	407568025433673728	f	palenquefood
We are at smorgasburg on N5 Btw berry and Whyte! Truck is gran Army plaza prospect park!	1385829858	406826030486552576	f	palenquefood
Good morning , Brooklyn , like every Saturday PALENQUE is happy to be @ Grand army plaza and serve you the best, hope see you there.	1385828312	406819542925455360	f	palenquefood
RT @DirectionalDine: enjoying an afternoon arepa from @Palenquefood http://t.co/XKKwi1r8kk	1385409037	405060978535964672	f	palenquefood
http://t.co/JZufs81SAl	1385407704	405055386849251328	f	palenquefood
A lil Cold Today, I bet a nice Chicken Soup will be great for ur tummy, join us @ WALL STREET, between Hanover &amp; Pearl street... AREPASSS	1385393808	404997102180528128	f	palenquefood
RT @rentafoodtruck: Can't wait to try some @palenquefood in #nyc	1385333905	404745850511179776	f	palenquefood
Good morning everybody, if you like to start your day at the farmers market @ GRAND ARMY PLAZA, stop by PALENQUE &amp; get a delicious arepas.	1385224173	404285600364527616	f	palenquefood
Hi friends , you can find PALENQUE @ Bedford Ave &amp; N 4 St.	1385071993	403647315137036288	f	palenquefood
Good Day Newyorkers today your favorite food truck finds itself On Varick str and Charlton str... Come enjoy our Delicious Hot Ajiaco Soup!	1384963636	403192832846221312	f	palenquefood
Palenque producing quinoa and multigrain arepas for NY to eat better http://t.co/UwoG80wptK via @sharethis	1384866113	402783790625325056	f	palenquefood
We are @ Brooklyn bridge park @ Smorgasburg  come to have a delicious arepa http://t.co/dVUTF0IHls	1384707665	402119211230953472	f	palenquefood
Is a beautiful day.\nSmorgasburg North 7 &amp; Kent ave.\nDelicious ajiaco soup, Arepas and for dessert "cocadas"	1384620077	401751840423182336	f	palenquefood
Good morning Brooklyn , like every Saturday PALENQUE food truck is happy to be at grand army plaza.	1384619937	401751252717289473	f	palenquefood
Win dumbo http://t.co/UYw31ooJyH	1384538102	401408010842828800	f	palenquefood
Hello dumbo your arepa truck is back in the neighborhood! Palenque is in Jay and water st. Waiting for you! W/ korilla and mamut .	1384532613	401384988043931648	f	palenquefood
RT @DispatchBP: . @BrookfieldPlNY NORTH LOT 11/14/13: @FritesnMeats @SweetChiliNYC @Palenquefood @MilkTruckNYC @TaimMobile -N. End Ave./Ves...	1384445479	401019522771353601	f	palenquefood
Giving our employees 8 days of holiday is the best way of saying THANKS! And a BIG THANK U 2 U!\nSee u all in 8 days! Happy Thanksgivukkah!	1385563623	405709357674807298	f	grillonwheelsny
46th off 6th today. Open for lunch until 3pm!!	1385479120	405354926253309952	f	grillonwheelsny
46th off 6th today. Open for lunch until 3pm!!	1385392657	404992273492230144	f	grillonwheelsny
46th off 6th today #kosher #shawarma #schnitzel #yummy	1385048432	403548491219501056	f	grillonwheelsny
Free order of fries with any sandwich when you say "GRILL IT" at the window!!!\nOn 46th bet 5th &amp; 6th today.	1384789161	402461029348945920	f	grillonwheelsny
Today on 47th Street between Park Ave and Lexington!!	1384534414	401392543344386048	f	grillonwheelsny
On 46th of 6th today!!	1384443574	401011532655763456	f	grillonwheelsny
Today on 47th Street between Park Ave and Lexington!!	1384355729	400643084817403907	f	grillonwheelsny
46 between 5th &amp; 6th!	1384270846	400287060512505856	f	grillonwheelsny
Come try our couscous topped with cooked vegetables platter, with your choice of meat!	1384182108	399914863553556481	f	grillonwheelsny
46th off 6th today! Open from 11:00 to 3:00 pm!	1384181933	399914130611908608	f	grillonwheelsny
Sausages are here!! On 46th off 6th today. Open from 10:30 to 2:00 today!!	1383921600	398822214835118080	f	grillonwheelsny
Say "rain rain go away" at the window and get any sandwich for $8.00	1383843869	398496186816286720	f	grillonwheelsny
Good morning NY! We are on 47th bet Park &amp; Lex today!	1383837676	398470211588087808	f	grillonwheelsny
On Park Ave and 47th today!	1383751272	398107806001545216	f	grillonwheelsny
Come try our couscous topped with cooked vegetables platter, with your choice of meat!	1383671165	397771813075558400	f	grillonwheelsny
46th off 6th today!! \nCouscous and vegetables!!\nShabbat shalom!	1383320479	396300932738461696	f	grillonwheelsny
Back on Bergen and Court streets in Brooklyn! Stop by before we close at 3:30pm today.	1385903188	407133597641236480	f	carpedonutnyc
Rise and shine - it's donut time! At Bergen and Court streets until 3:30 pm. Get 'em while you can!	1385816495	406769980429307905	f	carpedonutnyc
Who's ready for a little Black Friday shopping break? Do it with donuts on 20th street and 5th avenue. We're here till 4pm so come on by!	1385731119	406411888852230144	f	carpedonutnyc
Come see us at 51st and Park, we will be here until 5:30pm. We are off the road for the next two days so stock up today!	1385469426	405314268700352512	f	carpedonutnyc
Get your donut on at 20th street and 5th ave. We'll be here until 5:30pm so come stop by!	1385390484	404983160611819520	f	carpedonutnyc
Burrrrr!  Warm up with hot cider and donuts. We will be at Bergen and Court until 5:30pm.	1385297604	404593594700693504	f	carpedonutnyc
Rise and shine, it's donut time. Come see us at Court Street and Bergen. We will be here until 5:30pm.	1385207783	404216856229470208	f	carpedonutnyc
Don't let the rain get ya down. Fresh donuts and hot cider are waiting for you at 55th and Broadway.	1385125134	403870200522866688	f	carpedonutnyc
Last call the donut king is getting ready to close up hurry	1385070887	403642674231930880	f	carpedonutnyc
We're ready. Are you? 51st and Park until 5:30pm today.	1385036636	403499015779926016	f	carpedonutnyc
Here on 23rd and Park until 5:30 pm	1384951395	403141487493672960	f	carpedonutnyc
Come and get'em!!!!!  Court and Bergen until 5:3pm.	1384691934	402053228487262209	f	carpedonutnyc
Wake up Cobble Hill and smell the donuts!  We are at Bergen and Court until 5:30pm today. Come see us.	1384604235	401685391901999104	f	carpedonutnyc
Here on 55th and Broadway until 5:30 pm.	1384519840	401331415054569472	f	carpedonutnyc
We are closed no more donuts NYC	1384468624	401116601833259008	f	carpedonutnyc
Last call donuts going fast 51st and park ave don't miss out	1384466198	401106423935172608	f	carpedonutnyc
Good morning, midtown! We'll be  serving up some delicious donut goodness at 51st and Park until 5:30 pm.	1384432776	400966243509084160	f	carpedonutnyc
23rd and Park Avenue until 5:30pm today. Come see us!	1384347230	400607438644445185	f	carpedonutnyc
Good morning Cobble Hill. Hot apple cider and freshly made donuts at Bergen and Court Street until 5:30pm today.	1384088727	399523194744606720	f	carpedonutnyc
Bergen and Court Street until 5:30pm today.	1384006436	399178043094478848	f	carpedonutnyc
Sorry everyone, we aren't out today. See you guys tomorrow.	1386081285	407880590243803137	f	wingnitnyc
Happy Thanksgiving Everyone! http://t.co/u7HYUz1MyA	1385666299	406140011419955200	f	wingnitnyc
Happy Thanksgiving Everyone! http://t.co/yTrps7tc4O	1385666235	406139743098142720	f	wingnitnyc
RT @MobileCuisine: Food Cart Vendors Face Fines and Arrests for Selling Snacks - http://t.co/Oh2k939USu	1385525761	405550553155252224	f	wingnitnyc
RT @EstaFiestaPR: @Carnegro U just discovered @WingNItNYC? I LOVE that place!!	1385489857	405399959727779840	f	wingnitnyc
RT @Carnegro: So I found a wings food truck though. I wish I was hungry. Apricot Maple Whiskey wings sound amazing. @WingNItNYC	1385489851	405399938588483585	f	wingnitnyc
Out here on 47th between Park and Lexington. Come get some wings for lunch today.	1385476363	405343363248816128	f	wingnitnyc
At our Monday spot. Don't wait in the cold pre-order 917 740 1765. Have a good day everyone.	1385390579	404983559879786497	f	wingnitnyc
@alexandrak no problem Alexandra, that's what we do.	1385338554	404765350065360896	f	wingnitnyc
RT @alexandrak: @wingnitnyc thanks for the wings y'all! Such a happy belly!	1385338099	404763444270075904	f	wingnitnyc
RT @alexandrak: Chomping down on so many @wingnitnyc wings. So delicious!	1385336982	404758758632738816	f	wingnitnyc
Out here on Bushwick Ave and Anslie St. Come get some wings and watch the game @MattTorreys bar.	1385324236	404705298423615488	f	wingnitnyc
Were at a brand new spot today on 30th and 1st Ave. Come and wing it with us. #bellevuehospital #nyumedicalschool	1385132052	403899218793734145	f	wingnitnyc
RT @randomfoodtruck: Solid Thursday crew: @TheSteelCart @PolishCuisine @wingnitnyc @mactruckny @mikenwillies. Stay warm guys!	1385064461	403615721231761408	f	wingnitnyc
RT @iAM_JES: Finally.   @wingnitnyc http://t.co/vudTJqvmvn	1385064309	403615083148083201	f	wingnitnyc
Wing'n It Thursdays on 56th and Broadway. Get some wings for lunch today. For pre-orders please call 917 740 1765.... http://t.co/EshQbN9dWI	1385045568	403536480326270976	f	wingnitnyc
Wing'n It at out Wednesday spot. Don't wait in the cold,  give us a call and pre-order 917 740 1765. #wingnitnyc #humpday	1384959559	403175731754045441	f	wingnitnyc
On 51st between Park and Lexington. We are now open.	1384878557	402835981746708480	f	wingnitnyc
Sorry guys but we couldn't stay on the corner or 51st and Park. We are looking for a spot right now. We will keep... http://t.co/TIHIUJrWTh	1384877005	402829473742999552	f	wingnitnyc
On 51st and Park today.	1384873280	402813849813798912	f	wingnitnyc
RT @katazcona: @MexicoBlvd when in midtown is officially my new favorite lunch spot. their flavorful tortas are to die for!! #foodie #foodt...	1386098468	407952661242466304	f	mexicoblvd
RT @EdgeStudio: @voicesdotcom - http://t.co/3VtSCUDH0r - Less foodies and more loyalists! For example... it is always #TacoTuesdays! We &lt;3 ...	1386096382	407943911534264320	f	mexicoblvd
RT @floresdelnoche: @ItsMeLeanne @MexicoBlvd I heart Mexico Blvd!!! Best. Lunch. Ever.	1386096030	407942433792851968	f	mexicoblvd
RT @EdgeStudio: @ItsMeLeanne @MexicoBlvd @floresdelnoche - It seems that we @EdgeStudio love our tacos!	1386091523	407923531121713152	f	mexicoblvd
Weekly Truck Schedule on our new&amp;improved website! http://t.co/aAbStQP4UO :) Preorder available every day #xxxspicy	1386091363	407922861073235969	f	mexicoblvd
RT @12BarsNYC: @MexicoBlvd Please RT for #GivingTuesday! Support @FoodBank4NYC at Saurday's 12 Bars of Xmas charity bar crawl. http://t.co/...	1386090400	407918823288111104	f	mexicoblvd
Common down #Midtown your tacos &amp; tortas await!  @ 46th st between 6th &amp; 7th! Pre order online http://t.co/8LOue5MCSE	1386090347	407918599047626752	f	mexicoblvd
RT @ItsMeLeanne: At our favorite lunch spot @MexicoBlvd in NYC with @floresdelnoche! #tacotuesday #getinmybelly http://t.co/EeRbXGIphV	1386089832	407916438322970625	f	mexicoblvd
#AstoriaLove	1386033487	407680112180854784	f	mexicoblvd
Open at the DUMBO lot on Jay &amp; Water streets in #brooklyn 11:30-3:00 !	1386001897	407547612099645440	f	mexicoblvd
RT @dumbolot: Welcome back #DUMBO! @mooshugrill &amp; @MexicoBlvd today if you're back at work, godspeed to all the rest of you still sleeping ...	1385998299	407532521396916224	f	mexicoblvd
Did anybody try to make a leftover turkey torta this weekend? Come have a nice(r) lunch with us this week, NYC. ((Schedule on our website!))	1385998219	407532185785470976	f	mexicoblvd
@JP_Harmon :(	1385752432	406501281487134721	f	mexicoblvd
No truck til Monday 12/7! We will miss you, NYC! #turkeytaco #turkeytorta #turkeyday #crispycheesecrave	1385571079	405740632075169793	f	mexicoblvd
It's our last night out this week! Come &amp; get your fix, #Astoria 530-830pm We hope you all have un buen fin de semena con tu familia 	1385502091	405451276705472512	f	mexicoblvd
RT @floresdelnoche: @MexicoBlvd It's taco Tuesday!!! My favorite day of the week. Yay!! http://t.co/9gLjvt1Saa	1385488423	405393945121013760	f	mexicoblvd
Fight the cold by doing your taco dance while you wait for your food! #xxxspicy	1385401603	405029797371604992	f	mexicoblvd
11/25/13-12/01/13  http://t.co/MbmFzSuRLc	1385395211	405002988689043456	f	mexicoblvd
#latenightcrispycheesecrave	1385185935	404125220640157696	f	mexicoblvd
Great food comes from great ingredients. That's why we reach for the best local and DOP ingredients. It's worth the extra mile.	1386111926	408009108093423616	f	neaexpress
"So long as you have food in your mouth, you have solved all questions for the time being."\n Franz Kafka	1386108050	407992850430066688	f	neaexpress
We'd like to thank our fans for supporting us throughout the year. We look forward to serving you even more next year.	1386105645	407982765272219648	f	neaexpress
A holiday shopping event with a bit less trampling and a bit more eco-consciousness: http://t.co/PeCRD55fKC	1386100873	407962748015083520	f	neaexpress
"All sorrows are less with bread." Miguel de Cervantes #foodie	1386097386	407948123454316544	f	neaexpress
Since lunch doesn't serve itself, we're giving it a hand at 49th St between 6th and 7th Ave.	1386093808	407933116754722816	f	neaexpress
Ramping up green education in high schools: http://t.co/OGi7U2RKnm	1386092128	407926070735040512	f	neaexpress
A best-quality pizza tastes even better when you share it.	1386090392	407918789976948736	f	neaexpress
@marichal28 We're at 49th between 6th and 7th Ave for lunch! We couldn't stay away for long.	1386088922	407912623184027648	f	neaexpress
@marichal28 We'll know in just a bit.	1386087191	407905360423698432	f	neaexpress
Great food is the best form of stress therapy around.	1386085216	407897076505509888	f	neaexpress
It's better to think of every day as Earth Day.	1386083751	407890934970736640	f	neaexpress
It's Giving Tuesday! Reach out and lend someone a hand. http://t.co/Ndx8d48r1K	1386081785	407882686024646656	f	neaexpress
8 new CNG Ford cars are on the way in 2014: http://t.co/v6hE4BVo3I	1386010980	407585709441449984	f	neaexpress
Green landscaping in NYC (several steps above grey concrete, in our opinion): http://t.co/Sp4FDChqlZ	1386007255	407570085600309248	f	neaexpress
CBS' assigned reading for the sustainability-minded: http://t.co/9LJwYqAlrS	1386003644	407554941210071040	f	neaexpress
Any plans for giving back this month? Now it's festive.	1386000362	407541173189083136	f	neaexpress
RT @Gothamist: Gothamist Winter Guide: 20 Cool Things To Do In December http://t.co/m1w4YEEAUI	1385998114	407531745714925568	f	neaexpress
Good morning, NY! Back to the grind?	1385994916	407518331630280704	f	neaexpress
This month, see if you can get a look at the skyline from a distance. It changes your perspective.	1385931039	407250411788460033	f	neaexpress
#foodtruck is parked. 14th &amp; 3rd. It's looking at you now... #empanadas #backtoschool	1386109002	407996845823385601	f	nuchasnyc
All smiles when you've got a #Nuchas empanada in hand! http://t.co/RhBTvxSpzM	1386098820	407954137746530304	f	nuchasnyc
See you this Friday &amp; Saturday at BeerFest. Grab your tickets here: http://t.co/MYhimyrc2J	1386095144	407938720961404928	f	nuchasnyc
meet us on 46th &amp; 6th ave.  one #delicious #empanada at a time...  #bonapetit	1386080834	407878700655734784	f	nuchasnyc
@Lizzzagna We're glad to hear! Thank you	1386026177	407649451353071616	f	nuchasnyc
RT @Lizzzagna: @NuchasNYC Thanks for the Greeley Square location! Just what i needed for lunch :)	1386026166	407649402590089216	f	nuchasnyc
RT @FoodtoEat: This Fri&amp;Sat some of our #FoodTrucks @PhilsSteaks @NuchasNYC will be @LivingSocial BeerFest at Skylight One Hanson ! http://...	1386026162	407649388149100544	f	nuchasnyc
Nuchas food truck parked on 13th and 3rd ave. #traderjoes #unionsquare	1386023951	407640116287787008	f	nuchasnyc
Get our awesome #empanadas this week at Skylight One Hanson #LSBeerFest. Tickets are $39 here: http://t.co/MYhimyrc2J	1386004850	407559997577768960	f	nuchasnyc
Meet our Truck on North End Ave./Vesey, 11a-3pm. @BrookfieldPLNY NORTH #empanadas #yum #tasty #WFC	1385997314	407528390569517056	f	nuchasnyc
@thuc saturday we open at 9am.	1385987578	407487555605917696	f	nuchasnyc
The word is out about our gourmet empanadas. Get your fix at Time Square, Greeley Square or our truck! http://t.co/nFCp3x4OW9	1385921965	407212352770416640	f	nuchasnyc
Back in SOHO. Broadway &amp; Prince st. Breakfast with our yummy medialunas! #tasty #viva #empanadas	1385911933	407170276133470208	f	nuchasnyc
Find us Dec. 6th &amp; 7th at BeerFest! Chase a beer with a few empanadas! Get your tickets here: http://t.co/MYhimyrc2J	1385843126	406881677471150080	f	nuchasnyc
Looking out from the inside of #NuchasGreeley! http://t.co/bgbyhhWqFf	1385836105	406852231980670976	f	nuchasnyc
@NewYorkHabitat @CarolACain @TimesSquareNYC thank you!! #muchasnuchas	1385828776	406821490391539712	f	nuchasnyc
RT @CarolACain: My favorite bites in #TimesSquare! Nom nom nom nuchasnyc @ Nuchas Artisan Empanadas http://t.co/cd7kvCzNjD	1385828751	406821385320026113	f	nuchasnyc
RT @VeedLeon: @NuchasNYC Nuchas de nada! Quick bite with the parents was delicious and the hot chocolate warmed us up on a really cold afte...	1385828729	406821292416172032	f	nuchasnyc
RT @NewYorkHabitat: @CarolACain @NuchasNYC Delicioso! Friday night empenadas in @TimesSquareNYC, doesn't get any better than this! And Happ...	1385828713	406821226024542208	f	nuchasnyc
RT @RockPublicity: Thank you @NuchasNYC! http://t.co/RdOJ53QfyZ	1385828696	406821156873060352	f	nuchasnyc
Bobjo truck open at water &amp; hanover sq. Try our ramen noodle soup! New menu is galbi steak burger.\nBobjo express will open at 47 &amp; park ave.	1386090206	407918008322232322	f	bobjotruck
Thanks! Dan. See u again!	1386045794	407731731031392256	f	bobjotruck
Bobjo truck have a new Gal-bi steak Burger! Try our new menu.	1385998982	407535385494188032	f	bobjotruck
Good morning! Bobjo truck open at 46 &amp; btw 5,6ave.\nBobjo Express open at 47 &amp; park ave.\nTry our ramen noodle soup!	1385998955	407535272382173184	f	bobjotruck
Bobjo express located in 47st &amp; park ave.\nTry our ramen noodles soup!	1385483060	405371451404189696	f	bobjotruck
Good morning! We are open at water and hanover sq today. Try our ramen noodle soup. Its will make u warm.	1385482939	405370946078253056	f	bobjotruck
Good Morning Varick &amp; King.. Serving up some yummy soul warming Ramen today.. Bob Jo Express @ 47th &amp; Park. Rramen outside #theartielangshow	1385130966	403894664958595072	f	bobjotruck
Goood Morning Ramen Lovers. Today we are @ 22nd &amp; 5th.. Bob Jo Express @ 47th &amp; Park. Great day for RrrrrAaaMeeeNnn	1385047096	403542887239258112	f	bobjotruck
Good morning, NY! Bobjo truck open at Varick st &amp; king st also Bobjo express at 49 st &amp; 3 ave. Bobjo ramen noodle soup make u warm today!	1384961791	403185093617143808	f	bobjotruck
Good morning! Bobjo truck in downtown water and Hanover sq.\nTry our ramen noodle soup!!!\n\nBobjo Express located on 47st &amp; Park ave!	1384875391	402822703776030720	f	bobjotruck
Everyday is a great day for Ramen. Today I'm thinkin its a pork Ramen Kinda Day@bianx615	1384783253	402436248775954432	f	bobjotruck
46Th Between 5th &amp; 6th.. RrrrrAaaaaMmmeeeNnnnnn... Bob Jo Express 47th &amp; Park	1384783187	402435971280809984	f	bobjotruck
RRAAMMEENN.. 47th &amp; Vanderbilt ...RRAAMMEENN... Bob Jo Express...RRAAMMEENN...47TH &amp; PARK..RRRAAAMMMMMEEEEEENNNNNNNNNN... #MMHHMMMMHHMM	1384523982	401348788071444480	f	bobjotruck
Correction Bob Jo Express is @ Hanover and Water.... Rrrrrrraaammmmeeeennnnn	1384441904	401004527035629568	f	bobjotruck
Rrrrraaaaammmmmeeennnnn...... Good Morning NYC... Flatiron.. 22nd &amp; 5th... Bob Jo Express @ 47th &amp; Park. Come Warm Up with RrAaMmEn...mhmhm	1384435818	400979000925102080	f	bobjotruck
Goood Morning NYC... Ramen is Back AND BETTER THEN EVER. Come warm up @Varick&amp;King. Express @47th &amp; Park.. Hot Ramen..mmhmmhhmmmmmmm	1384352200	400628284058529793	f	bobjotruck
ITS FINALLY HERE. RAMEN SOUP..Water &amp; Hanover.. Bob Jo Express @ 47th &amp; Park.. THE WAIT IS OVER..SOUUUUPPPP	1384265734	400265616395091968	f	bobjotruck
Happy Friday NYC... Today we are @ Charlston &amp; Hudson.... U can catch Bob Jp Express @47th and Park.. Tell them Shaun said Hi...	1383919351	398812781354696704	f	bobjotruck
Goooood Mornning NYC ... Today we are @22ND &amp; 5TH.. Flatiron.... Bob Jo Express for all you DownTowners. Hanover and Water...#Namaste	1383827992	398429593998483456	f	bobjotruck
Gooodd Moorrrnnniinnngggg Korean Fusion Lovers..... @#varick&amp;king .... Bob Jo Express @#49&amp;3RD...#YUMNOMNOM	1383745064	398081768068489216	f	bobjotruck
@shanghaisogo: Midtown! Come and get SS's Asian tapas &amp; "vegan mushroom tofu soup"at 46~47th &amp; Park! SOGO FOR IT!	1385998420	407533030736404480	f	shanghaisogo
RT @Seamless: Today would be a great day to be a soup dumpling - surrounded by friends and filled with soup. http://t.co/pDpNLbiJZT	1385570738	405739202614411264	f	shanghaisogo
@Seamless that is what we having for my thanksgiving family meal tomorrow.	1385570681	405738961941037056	f	shanghaisogo
Midtown West, SS is here for ur "Pre-Thanksgiving Meal" swing by @Broadway &amp; 55~56th st. Who's hungry? SOGO FOR IT	1385565541	405717404812337152	f	shanghaisogo
Midtown West! are u ready for ur Asian Tapas Tomorrow? We will be at our usual Wednesday spot @Broadway &amp; 55~56th st. Foodies! SOGO FOR IT	1385502337	405452307938037760	f	shanghaisogo
RT @nystfood: Street Eats: #Vegan Mushroom Soup &amp; Salad from @shanghaisogo http://t.co/iiTmsLTINB http://t.co/NKgGB7sjPi	1385482190	405367802284228608	f	shanghaisogo
Happy ThanksLiving! Check us out @46th (Btwn 5th/6th Ave) 11~3pm. Hot Soup, Noodles, Dumpling, Sesame Sandwich...Who's hungry? CU all later!	1385478661	405353002967789568	f	shanghaisogo
Happy ThanksLiving, midtown! It is cold out there! Is it any better idea than a bowl of hot soup on ur hands? http://t.co/WEZxJcJg9K	1385397243	405011509962899456	f	shanghaisogo
Good morning, Midtown East. The cold can't beat us. We r serve @46~47th&amp;park. 11am~3pm. So many options to warming u up from SS. Sogo for it	1385387190	404969346583494656	f	shanghaisogo
@UrbanSpaceNYC is there any food truck as well?	1385219692	404266808641064960	f	shanghaisogo
@dumbolot please call our TEL: 4844697646	1385164963	404037256459350017	f	shanghaisogo
Flatiron. SS is ready for u! Come &amp; get ur Asian tapas from us! SOGO FOR IT!	1385141373	403938312010088448	f	shanghaisogo
@shanghaisogo: Headed to . Flatiron. Come and get your Asian tapas,@shanghaisogo: Good Morning Flatiron.	1385128597	403884726672715776	f	shanghaisogo
http://t.co/zKjo1uZitA	1385073116	403652023318773760	f	shanghaisogo
Catering and Private Events? Call us, email us. http://t.co/NsucETHRPg	1385073074	403651845111156736	f	shanghaisogo
Midtown! Come and get SS's Asian tapas &amp; "vegan mushroom tofu soup"at 46~47th &amp; Park! SOGO FOR IT!	1385049197	403551700612829185	f	shanghaisogo
Headed to midtown. Come and get SS's Asian tapas at 47th &amp; Park!	1385042454	403523416579649536	f	shanghaisogo
Wednesday's lunch idea? Come out &amp; try SS~Shanghai Sogo @Broadway btw 55th &amp; 56th st 11~3pm	1384960047	403177779023577088	f	shanghaisogo
http://t.co/HyXuoFn6zY	1384875618	402823656575107072	f	shanghaisogo
http://t.co/lHQfuCDhya	1384875599	402823575952183296	f	shanghaisogo
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
@waffletruck alas, midtown.	1386125420	408065708183273472	f	waffletruck
@CaressaCrawford we're open at 10a	1386125314	408065261963841536	f	waffletruck
RT @dgtclassy: @waffletruck made my headache bearable today. For this I thank you. Hahaha #mondayblues	1386125280	408065117377806336	f	waffletruck
Have you discovered the Best Holiday decorations (and gifts) south of 49th Street yet?? Ave B &amp; E2nd... http://t.co/mlsWpla9iG	1386124404	408061442647412736	f	waffletruck
Wafels at night!  \nKastaar @ NYU Stern till 10p \nMomma @ Broadway &amp; 62nd till 11p  Allez!	1386117258	408031470213533697	f	waffletruck
@mborda15 what then? Once you've climbed Everest...	1386113579	408016040354775040	f	waffletruck
@loverach a sad thing indeed.	1386113531	408015839040774144	f	waffletruck
@theAmberShow we'll get through it together.	1386113494	408015682874249216	f	waffletruck
@rcopico far as we can tell, you can amend up until the day.	1386113469	408015578268332033	f	waffletruck
@50Wrds4Laughter @shwebbey we're certainly ready.	1386113426	408015399020556290	f	waffletruck
@SamanMarji we couldn't agree more.	1386113407	408015321966972929	f	waffletruck
@ThatsJoeyNYC @UrbanSpaceNYC darn tootin!	1386113379	408015200772567040	f	waffletruck
@RockPublicity the #belgian way...?	1386113352	408015090026160128	f	waffletruck
@sw33tnes501 Sho nuf!	1386113284	408014803064471552	f	waffletruck
@dgtclassy you are more than welcome.	1386113265	408014725197217792	f	waffletruck
@alexnz @34thStNYC you saw? You conquered?	1386113245	408014640879108096	f	waffletruck
@chrisndeleon we accept both answers.	1386113169	408014321566769152	f	waffletruck
Beat the heat(?!) Have you tried our delicious spekuloos ice cream? Available everywhere! #yum #dinges http://t.co/v7FVVKOgeb	1386095130	407938659996798976	f	waffletruck
@ponyace hmm touche	1386094848	407937478037745664	f	waffletruck
Come warm up with one of these bad boys @ our East Village Cafe on Ave B &amp; 2nd St Best Hot Chocolate in town! #dinges http://t.co/Qyw08StCqE	1386092660	407928300493746177	f	waffletruck
@jasondanielhood 	1386097693	407949410585563136	f	mactruckny
RT @DispatchBP: . @BrookfieldPlNY SOUTH Lot | Dec. 3rd | @MacTruckNY | S. End Ave. &amp; Liberty St. | 11a-3pm.	1386086230	407901329508827136	f	mactruckny
Good morning world financial SOUTH END!!!! here till 3	1386086219	407901286945005568	f	mactruckny
RT @bowlerdave817: Delicious buffalo Mac n cheese today from @mactruckny . Tried to take a picture of it but I ate it too fast 	1386013232	407595155269910528	f	mactruckny
RT @AhoyNewYork: The Best Mac and Cheese in New York City http://t.co/aKPw6SvQqK  | @ArtisanalBistro @BlueSmokeNYC @mactruckny &amp; more!	1386013220	407595104795631617	f	mactruckny
@Pancakesjo jo I'm at world financial Monday tuesday, i may be able to swing park ave wednesday. Ill keep you posted.	1385999753	407538618484662272	f	mactruckny
Good morning World Financial!!!! Serving lunch on North End till 3.	1385998773	407534510067449856	f	mactruckny
RT @jasondanielhood: my #Southern #BakedMacAndCheese... threw some parmesan on for @mactruckny http://t.co/7QeA6XU6Ed	1385705476	406304332230197248	f	mactruckny
@jasondanielhood that looks incredible!!!! Great even crisp on top. Southern #macguru	1385674928	406176203771756544	f	mactruckny
@strollerincity @PiccoliniNYC the pleasure was all mine, we worked Alex to the bone!!!!	1385518637	405520674615492608	f	mactruckny
RT @Mmurray130: @mactruckny best lunch in the world! Pulled pork mac &amp; cheese. Thanks Dom	1385492336	405410357453524992	f	mactruckny
RT @DKinskeyLebeda: It's been too long, @mactruckny but damn, was that some good Maker's Mark Pulled Pork over Mac n Cheese!	1385492328	405410324343717888	f	mactruckny
RT @DispatchBP: . @BrookfieldPLNY SOUTH Lot 11/26/13: @MacTruckNY - South End Ave. &amp; Liberty St. in #BatteryParkCity, 11a-3pm.	1385481462	405364748457619456	f	mactruckny
Good morning FIDI!!! World Financial Center. South End Ave and Liberty st. Till 3pm	1385477770	405349264353943552	f	mactruckny
@Mmurray130 see you there buddy.	1385407138	405053014656163840	f	mactruckny
Tomorrow the 26th, we'll be at the World Financial Centers south end lot for lunch.	1385402742	405034576206385152	f	mactruckny
@SoBendito love your post	1385176778	404086812853145600	f	mactruckny
Good morning Park ave. if you're lookin for that tasty Mac on this dismal day... Im between 29th and 30th till 2	1385131325	403896167605760000	f	mactruckny
RT @bowlerdave817: Once again visited my favorite #foodtruck @mactruckny for the best Mac n cheese today!! It's a must go for everyone. Dom...	1385131258	403895886209908736	f	mactruckny
#VictoriaJustice at #Uggs Aulstralia on Madison Ave &amp; 58 Street tonight from 6:30pm-8pm	1383866974	398593095865884674	f	thecrepestruck
Come meet #VictoriaJustice at the #Ugg Store tonight on Madison Ave. We're giving out free coffee and hot chocolate from 5-6pm	1383864158	398581286391918592	f	thecrepestruck
We're on 50 Street btw 6 &amp;7 Ave today until 3pm. Come check out our Portobello Mushroom Crepe.	1378910456	377803953406509056	f	thecrepestruck
Good morning everyone. Start the week off right with a crepe from #TheCrepesTruck. We're on 50th street between 6 &amp; 7 Ave.	1378732102	377055881386393600	f	thecrepestruck
The Crepes Truck at the #MaimiMonkey premiere with #BigAngVH. http://t.co/eOIVPAacOR	1378731825	377054722555146240	f	thecrepestruck
The Crepes Truck at the #MaimiMonkey premiere last night with #BigAngVH1. http://t.co/eDDgsBBfH7	1378731779	377054527796412416	f	thecrepestruck
Cosmo Radio at Sirius, interviewed #CrepesTruck owner Stephen Asaro to talk crepes. We'll let you know when it airs. http://t.co/yLaNCWjkQ6	1374612250	359775969659195394	f	thecrepestruck
#thehub is giving away free ice cream today &amp; tomorrow. Come find the truck. http://t.co/IwCL7FnQJ9	1372260998	349914105789952001	f	thecrepestruck
Softee Xpress giving out free ice cream in Union Square for Citi Bike lauch 11-3pm http://t.co/SpN8kFndSg	1370183760	341201539010023424	f	thecrepestruck
"Warmth inside its pages" @nytimesfood  http://t.co/2D5chc6lFz	1386181817	408302250843721728	f	taimmobile
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
Serving on Broadway btw 55 St. &amp; 56 St	1386084404	407893673842868224	f	mausamnyc
Serving lunch 47 st B park &amp; Lix	1386001716	407546854818082816	f	mausamnyc
Serving lanch between lex &amp; park 47 st	1385732710	406418562338013184	f	mausamnyc
Going to 47 between park &amp; lexington avenue.have a good holiday #Thanksgiving	1385574851	405756454059401216	f	mausamnyc
Serving lunch @ 52nd St. &amp; 6 Ave. Happy Thanksgiving &amp; enjoy the rest of your weekend!	1385568281	405728895762456576	f	mausamnyc
Will be serving lunch on Broadway btw 55th St. &amp; 56th St. Have a nice day!	1385475107	405338096826593280	f	mausamnyc
Will be serving lunch on 38th St. &amp; Broadway. Enjoy your day!	1385395043	405002283781742592	f	mausamnyc
Happy Friday! Toaday serving lunch @ Old Slip &amp; water St	1385129960	403890442770849793	f	mausamnyc
Serving lunch today 47th St. Btw Park Ave &amp; Lexington Ave.	1385042016	403521579361267712	f	mausamnyc
Goodmorning! Serving lunch @ 52nd &amp; 6 Ave. Have a bless day	1384956049	403161008371675136	f	mausamnyc
For the dinr i wlbe n y u w 4 st	1384807963	402539888903741440	f	mausamnyc
Happy monday! We are @ 38th St. &amp;Broadway. God bless, have nice week	1384780355	402424095989854208	f	mausamnyc
We will be on 47 between park and lexington,have a bless day and gud weekend guyz.u can follow us on facebook to.thnku	1384487069	401193964768067585	f	mausamnyc
Happy Monday to all #FoodtoEat #FoodTrucks #midtownlunch curries at 47 &amp; park	1381160412	387240953700159488	f	mausamnyc
At 47 &amp; park today #LetUsEatLocal	1380816829	385799862098620417	f	mausamnyc
Serving curries on 55 and broadway	1380636444	385043271317479424	f	mausamnyc
Get ur fresh curry n bites by 55th st &amp; broadway	1380209215	383251345756913664	f	mausamnyc
@obijuan77 3 pm	1380129284	382916089283624960	f	mausamnyc
Today lunch 38th st &amp; 6 ave	1380127694	382909418452840448	f	mausamnyc
Tuesday lunch by 55th st &amp; broadway @midtownlunch #nysfta	1380036706	382527787703500800	f	mausamnyc
Beautiful weather yeahhh!! We are on 36st and broadway	1386091374	407922907810385920	f	chefsamirtruck
Is on Water St @ Old Slip today!	1386003794	407555570787692544	f	chefsamirtruck
Is on 52nd St @ Park Ave today!	1385568603	405730246533861377	f	chefsamirtruck
Is on 36th St @ Broadway today!	1385481285	405364006183260161	f	chefsamirtruck
Is on Water St @ Old Slip today!	1385394257	404998986077331456	f	chefsamirtruck
Is on Broadway btwn 55th &amp; 56th St today!	1385139060	403928611889360896	f	chefsamirtruck
Is on 47th btwn Park &amp; Lex today!	1385052787	403566755916034048	f	chefsamirtruck
Is on 52nd St @ Park Ave today!	1384966797	403206089023688705	f	chefsamirtruck
Is on 36th St @ Broadway today!	1384875903	402824852572082177	f	chefsamirtruck
Is on Water St @ Old Slip today!	1384793494	402479202609676288	f	chefsamirtruck
Is on Broadway bywn 55th &amp; 56th St today!	1384530739	401377127976951808	f	chefsamirtruck
Is on 47th St btwn Park &amp; Lex today!	1384446484	401023739636506624	f	chefsamirtruck
Is on 52nd St @ Park today!	1384356093	400644611498323968	f	chefsamirtruck
We are on 36st and broadway!!	1384276815	400312094752784385	f	chefsamirtruck
Is on Water St @ Old Slip today!	1384273867	400299731425165312	f	chefsamirtruck
We are close for veterans day	1384192372	399957915169091584	f	chefsamirtruck
shared a link http://t.co/zVd5MEHIib	1384059769	399401736202231808	f	chefsamirtruck
Anna! https://t.co/dnSizfPlAk	1384022965	399247372019978240	f	chefsamirtruck
Is on Broadway btwn 55th &amp; 56th St today!	1383924572	398834679668695040	f	chefsamirtruck
Our truck is at the mechanic shop for maintenance , we will be close today !!!see yiu tomorrow	1383841125	398484679210577920	f	chefsamirtruck
Its time for Betty White (our food truck) to retire! http://t.co/gZtZEjJ0MY via @kickstarter Make a donation for some great rewards!	1386122204	408052218210693120	f	sweetchilinyc
@dumbolot @Datalot we can't see the video feed...can someone send us a screenshot so we know where to give our blue steel looks! #zoolander	1386090774	407920389315395585	f	sweetchilinyc
Lunch time @dumbolot starts today at 1130! Check out our specials and our new kickstarter page!	1386086729	407903424966324224	f	sweetchilinyc
RT @dumbolot: .@sweetchilinyc @KimchiTruck and new addition @carlssteaks today! Don't believe? Check out @Datalot's lot stream! http://t.co...	1386086230	407901330507055104	f	sweetchilinyc
Its time for Betty White (our food truck) to retire! by Lisa Fernandes http://t.co/gZtZEjJ0MY via @kickstarter Make a donation today!	1386073948	407849815129612288	f	sweetchilinyc
Its time for Betty White (our food truck) to retire! by Lisa Fernandes http://t.co/gZtZEjJ0MY via @kickstarter	1386040204	407708282279583744	f	sweetchilinyc
Help us out!  We need to raise some funds!! Donate now for great rewards!  http://t.co/VrHXMi5b9B	1386034890	407685994423390208	f	sweetchilinyc
@purplejong yup our usual spot bway &amp; 56	1386001731	407546918857084928	f	sweetchilinyc
RT @randomfoodtruck: No point in slowing down now--keep the feast going with @MrNiceGuyTruck @bigdsgrub @sweetchilinyc @gcnyc1	1386001692	407546753823817728	f	sweetchilinyc
Sorry we won't be out on the streets today!  Betty needs another truck spa day.  Have a #HappyThanksgiving and we will see you Monday!	1385569782	405735191714349056	f	sweetchilinyc
It's a special day today! We are giving huge portions of salads today to show thanks to our loyal customers!! Jay &amp; water till 3! @dumbolot	1385484305	405376673400758273	f	sweetchilinyc
Happy tuesday! Come check us out @dumbolot today 11-3!  Hot coffee, spicy food, shrimp chips..oh my! Hungry yet? http://t.co/RIWPlBu9im	1385468737	405311376597348353	f	sweetchilinyc
#HappyMonday you know where to find us today! Serving up spicy food, hot coffee and shrimp chips! Get your lunch on! http://t.co/RYP3CJ2Cmm	1385385668	404962959719669760	f	sweetchilinyc
Looking for a holiday party caterer? Look no further...email info@sweetchilinyc.com for details!	1385242147	404360988616839168	f	sweetchilinyc
#TGIF it may be raining but we can cheer up your day with some sweet heat! 11-3 on 52 &amp; 6th! Inquire about our holiday catering today!	1385130752	403893765079072768	f	sweetchilinyc
RT @VendorPower: See us this morning on @wpix with @vendyawards finalist @sweetchilinyc, run by Top Chef Lisa Fernandes? http://t.co/MKvKrL...	1385086035	403706207938301952	f	sweetchilinyc
@ThinkinBoutWhat thank you! That makes our day so much brighter!	1385062604	403607931226435586	f	sweetchilinyc
RT @DispatchBP: . @BrookfieldPLNY NORTH Lot 11/21/13: @FritesnMeats @SweetChiliNYC @Palenquefood @MilkTruckNYC &amp; @TaimMobile - N. End Ave./...	1385054416	403573589087367169	f	sweetchilinyc
RT @DispatchNY: . @BrookfieldPLNY NORTH Lot 11/21/13: @FritesnMeats @SweetChiliNYC @Palenquefood @MilkTruckNYC &amp; @TaimMobile - N. End Ave./...	1385047558	403544823179018240	f	sweetchilinyc
RT @marysolcastro: So much fun, such a full belly thanks to @sweetchilinyc and foodtruck. Follow her on twitter and down the street. http:/...	1385045918	403537945778749440	f	sweetchilinyc
Happy Tuesday!!!\nJoin Kasar truck at broadway and 56th street, all day until 6pm.	1386081762	407882592709390337	f	chipsykingny
Kasar truck is at 91st and Columbus all day until 6pm\nHappy Monday !!!	1386004391	407558073453015040	f	chipsykingny
Happy Sunday!!!\nKasar truck is at broadway and spring street in Soho, all day until 8 pm.	1385893138	407091444768194560	f	chipsykingny
Kasar truck is in soho all day until 9pm and at 7th and Christopher until 4 am\nSorry for late posting\nHappy Black Friday !!!	1385774281	406592924135071745	f	chipsykingny
Happy Thanksgiving!!!\nKasar truck is at 5th avenue and 49th street until 5pm.	1385653103	406084664466882560	f	chipsykingny
Kasar truck is at 46th street between 5th and 6th avenues until 5pm\nHappy Wednesday!!!	1385560894	405697912220286976	f	chipsykingny
Kasar truck is at queens college, 65th avenue and kissena blvd all day until 8pm\nHappy Monday everyone!!!	1385388176	404973480036147200	f	chipsykingny
Kasar truck is at spring street off broadway until 7 pm, and 7th and Christopher until 4 am	1385239859	404351394380914688	f	chipsykingny
Kasar truck is at Broadway and 56th street, until 6 pm.\nFrom 6:30pm to 3am at 7th and Christopher \n\nTGIF!!!	1385126567	403876212033867776	f	chipsykingny
Kasar truck is at Columbia, 125th and Broadway. Happy Thursday !!!	1385041562	403519676946194432	f	chipsykingny
Kasar truck is at 91st street and Columbus avenue. All day until 10 pm. \nFrom 10:30 to 3am at 7th and Christopher. \nHappy Wednesday !!!	1384958141	403169782989471744	f	chipsykingny
Kasar truck is at broadway and 56th street, all day until 7pm, and at 7th and Christopher until 3am. Happy Tuesday!!!	1384873187	402813458732703745	f	chipsykingny
Kasar truck is at 46th street between 5th and 6th Avenues\nHappy Monday everyone!!!	1384787022	402452057245765632	f	chipsykingny
Kasar truck is in Soho\nBroadway and Spring street until 8pm. Join us	1384705746	402111161451040768	f	chipsykingny
Kasat truck is in SOHO, Broadway and Spring Street all day until 9pm	1384629681	401792123927678976	f	chipsykingny
Kasar truck is at Broadway between 56&amp;57th street all day until 5pm. And 5:30 to 3am at Christopher street and 7\nJoin us	1384527551	401363757340717056	f	chipsykingny
Kasar truck is at NYU, green street and w4th all day, until 10pm	1384441519	401002913348063232	f	chipsykingny
Kasar truck is at 46th street between 5th and 6th avenues\nUntil 7pm\nJoin us	1384268290	400276336675012608	f	chipsykingny
Kasar truck is Broadway between 56th and 57th street until 5pm, and will be at Astor Place until 3 am!!! Join us	1383934619	398876818708500480	f	chipsykingny
Kasar truck is in SOHO, Broadway and Spring street. Join us	1383414724	396696221068193792	f	chipsykingny
Come check us out.\n42 st and 6th ave until 11pm                  and 47th st and Broadway until 1 am	1385946162	407313844181409792	f	crafflesnyc
We are still open. Come visit us!!!\n7th ave and 40th street	1385875482	407017391949119488	f	crafflesnyc
#crafflesnyc#craffles #movienight http://t.co/wBpO0rnhay	1385867207	406982681445269504	f	crafflesnyc
#crafflesnyc#craffles http://t.co/KMboZTt72I	1385834725	406846443652390912	f	crafflesnyc
#craffles#crafflesnyc http://t.co/LFHQVjfIcx	1385833554	406841532894179328	f	crafflesnyc
#crafflesnyc#craffles#thanksgivingday!#macysparade#wafflesnyc#crepes#crepesny#waffles http://t.co/xrUKJ3UfXH	1385697184	406269556077121537	f	crafflesnyc
We are only 1 block away from Macy's Parade!!!\n#crafflesnyc#craffles http://t.co/vfUcmXAGHM	1385661679	406120636109828096	f	crafflesnyc
Happy Thanksgiving !!! #crafflesnyc#craffles http://t.co/vsgm62XyLY	1385661309	406119085194620928	f	crafflesnyc
Prospectpark#crafflesnyc#craffles#crafflestruck#crafflescart http://t.co/KCf7zzegov	1385270756	404480986928664577	f	crafflesnyc
Ciao Bella!!!thanks a lot for our friends from Italy.#crafflesnyc http://t.co/P1HvjxCxPc	1385258232	404428457687666688	f	crafflesnyc
Prospectpark#crafflesnyc#craffles http://t.co/dpSC3f1Nzw	1385246742	404380263398256640	f	crafflesnyc
@SubahAhmed thank you, that's our pleasure	1385191458	404148383868547072	f	crafflesnyc
megmcgrail's photo http://t.co/Y2F0IaLQjF	1385185305	404122578341888000	f	crafflesnyc
@crafflesnyc #craffles #crafflestruck #nutellacrepe #nutellawaffle #yummy #nutella http://t.co/DHm2a076ih	1385185219	404122218382516224	f	crafflesnyc
Hunter college, thank you for excepting us in your location on our first day. See you all Monday	1385172329	404068151878774784	f	crafflesnyc
Just posted a photo http://t.co/b7sDXL2IlN	1385095702	403746756523200512	f	crafflesnyc
Anybody around NYU right now? @ NYU Stern School of Business http://t.co/H1mwuwVLgD	1385092628	403733861479485440	f	crafflesnyc
#nyu#crafflesnyc#foodnyc#crepetruck#crafflestruck http://t.co/CvYK3rO1O1	1385079402	403678387463794688	f	crafflesnyc
#crafflesnyc#craffles#foodtruck#foodtrucknyc#belgianwaffles#frenchcrepes#wafflesnyc#waffles#wafflesandc... http://t.co/naeGx9aRI6	1385061254	403602268496617472	f	crafflesnyc
#craffles#crafflesnyc http://t.co/KQPFuuRfQm	1385012910	403399502914002944	f	crafflesnyc
Serving Lunch on \n46th street bet\nPark Av./Madison Av.\nOn Vanderbilt Av.\nCall or text your Order for Pick-up @ (347) 70T-Bite	1386089355	407914437090480128	f	tacobite
Serving Lunch on 46th street\nBet Park Av/Madison Av\nOn Vanderbilt Av.\nCall or Text your order for Pick-up\n(347) 70T-Bite	1386088449	407910638930124800	f	tacobite
Happy Saturday\nToday serving it up on\n67th Street &amp; Broadway\nIn front of the "APPLE" store	1385225382	404290673006084096	f	tacobite
Happy Friday! \nToday Serving Lunch on \n46th street\nBet. Park/Madison Av.\nOn Vanderbilt Av.	1385138515	403926325595242496	f	tacobite
@AROD Loko, pasa por aqui a comer tacos de lunch, en la calle 46 entre park av y Madison. Y suerte en tu caso. Ya tu sabe Da Le'. LOL!	1385052311	403564762531106816	f	tacobite
Today Serving Lunch on\n46th Street\nBet. Park Av./Madison Av.\nOn Vanderbilt Av.	1385052052	403563675996655616	f	tacobite
Today Lunch on \n46th street\nBet. Park Av/Madison Av\nOn Vanderbilt Av.	1384965719	403201568608378880	f	tacobite
Serving lunch on 46th street\nBet Park/Madison Av.\nOn Vanderbilt Av.	1384879593	402840328396603393	f	tacobite
Today Serving Lunch on 46th Street\nBet Park Av/Madison Av\nOn Vanderbilt Av.	1384792356	402474431584694272	f	tacobite
Happy Saturday!!\nServing today on \n67th Street &amp; Broadway.\nIn front of the APPLE store.	1384619447	401749195788648449	f	tacobite
Happy Friday\nToday Serving Lunch on 46th Street\nBet Park Av/Madison Av\nOn Vanderbilt Av.	1384531378	401379809814908928	f	tacobite
Serving Lunch on 46th street\nBet. Park Av./Madison Av.\nOn Vanderbilt Av.	1384446242	401022725185359872	f	tacobite
Serving Lunch on 46th Street\nBet. Park Av./Madison Av.\nOn Vanderbilt Av.	1384274599	400302799202050048	f	tacobite
Serving Lunch on 46th St.\nBet. Park Av/Madison Av.\nOn Vanderbilt Av.	1384187548	399937680936816640	f	tacobite
Happy Saturday!\nServing on\n67th street &amp; Broadway\nIn front of the Apple Store.	1384016290	399219375603200000	f	tacobite
@UndrcvrMother thank u, Gina. U have a great weekend too.	1384015982	399218079856881664	f	tacobite
Happy Friday\nServing Lunch on 46th street\nBet. Park Av/Madison Av\nOn Vanderbilt Av.	1383929311	398854558015029248	f	tacobite
@Codstaman89 hi just inboxed u.	1383842434	398490170380779520	f	tacobite
Serving Lunch on 46th street\nBet. Park/Madison Av.\nOn Vanderbilt Av.	1383842299	398489604275572736	f	tacobite
Serving Lunch on 46th Street\nBet. Park Av/Madison Av.\nOn Vanderbilt Av.	1383756259	398128723188535296	f	tacobite
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
Dumbo we're back on Adams and front. #dumbofoodtrucks	1379431345	379988720088530944	f	parissandwich
Dumbo we will be on fronts and Adams st today! @DUMBOFoodTrucks	1379086660	378543006808567808	f	parissandwich
@jenchung we are there	1378832390	377476522468454400	f	parissandwich
@Playmaka34 u r the #1 fan at Bedford spot now :)	1386131549	408091413440897024	f	lovemamak
Did anyone say Holiday Party Catering!? You know where to find us!! FoodToEat and Cater2Me! #pierogitime	1386131079	408089439819534336	f	polishcuisine
We're at ________! Don't let the pizza get lonely.	1386129671	408083534361165825	f	neaexpress
RT @Jewelitaa: Today I'm thankful for @waffletruck for putting a smile on my face as I write my paper!	1386131309	408090405184737280	f	waffletruck
Sorry for the...watchucallit...lack of social media? My fingers were too fat from tday feasting. Back on the streets tomm better than ever!	1386142996	408139423243833344	f	korillabbq
All jokes aside we missed the streets, get ready NY we here to make your holidays delicious!	1386143549	408141745676099584	f	korillabbq
Sufganiyot on the truck today on 55th/broadway 9:00-until we sell out. \n\nFilled with lavender raspberry jam and... http://t.co/HJKFRosh3m	1386157606	408200705049378816	f	veganlunchtruck
Hooray for donuts!  23rd and Park until 5:30pm.	1386159822	408209999694147584	f	carpedonutnyc
We have been going through some issues at our commissary and due to these issues we are unfortunately not able to... http://t.co/8hzi0hlGy4	1386160771	408213977030615041	f	wingnitnyc
49st 6ave #Free Zeppoli all day They are lighting the tree today #Midtown West Rock Center	1386161381	408216537330630656	f	valduccis
43rd st at 5th ave due to a film shoot in our regular location.  Call ahead 917 439 7522	1386162334	408220536641056768	f	eddiespizzany
Parked on 55th and Broadway from 9am to 3pm\n\nWe have Red Curry Grilled Tofu Bahn Mi with pickled onions and... http://t.co/8aOQz763tF	1386163726	408226371782344704	f	veganlunchtruck
TGR Loves NYC!  Find Us Today, Wed, @38th&amp;Bway, 11to2pm, #govegan, #veganlunch, @anntaylor, @tartecosmetics,... http://t.co/AWGGzesLn0	1386163627	408225957497942016	f	thegreenradish1
RPO-Radish Parking Only outside our new #kitchen where we'll #cookvegan and #share the #goodness #GoG-Rad http://t.co/AQ45dq6Uyh	1386164597	408230024630640640	f	thegreenradish1
Morning NYC! 2 locations serving hot delicious breakfast today: \n\nOG Jawn: Water &amp; Wall \n\nBIG Jawn: 41st btwn 6th... http://t.co/PjE7yImLyK	1386164367	408229059844669440	f	philssteaks
Midweek blues can be cured at 55th Street and Broadway. Come n' Grub w/ us 11am to 2:30pm today. Preorders call 646-543-BIGD #MidtownWest	1386165560	408234066480467968	f	bigdsgrub
WALL ST - you asked &amp; we're back! Come get breakfast with us! http://t.co/067lQbSATA	1386164869	408231167100715008	f	philssteaks
Gd morning Hudson/King St, sad news to report today, our main Sweetery truck is off on spl assignment today but will be back tomorrow.	1386166368	408237456417230849	f	sweeterynyc
Sweetery has teamed up with @FoodNetMagPromo to share it's December edition featured cookies! Join us from 11-1pm @ Madison &amp; 42nd!	1386166281	408237091609653248	f	sweeterynyc
Come meet us on Hudson b/w King &amp; W. Houston from 8:30-10:30 with @FoodNetMagPromo for a delicious gingerbread snowflake from Sweetery! Cya!	1386166161	408236584967081984	f	sweeterynyc
Download our free app for promotions and rewards! Check us out for #holiday #catering! #afterParties 49th &amp; 6th today for lunch #FreeZepolle	1386166282	408237093878374401	f	valduccis
Like us on #Facebook! Who wouldn't like someone who gives you a #free zeppole while you wait? 49th &amp; 6th	1386166149	408236536979664896	f	valduccis
#HappyHumpDay! #Midtown! 49th &amp; 6th #Free #Zepolle all day! Mmm Mmm Good! #AfterPaties #HolidayCatering! Tree Lighting today!	1386165885	408235427074564096	f	valduccis
Good morning! Ready to win the day?	1386165680	408234567582384128	f	neaexpress
@LGUS we are happy to be with your NJ team today! Enjoy a treat from Sweetery, you deserve it! Get those cookies while they last!!	1386167329	408241483528282112	f	sweeterynyc
Before you head home today find us on Broadway b/w 52/53 for a FREE treat compliments of @FoodNetMagPromo and Sweetery from 4-5:30pm!!	1386167086	408240464668950529	f	sweeterynyc
If you're looking for a sweet treat after lunch, find us on 7th b/w 36/37 for a free @FoodNetMagPromo gingerbread cookie from 1:30-3:30pm!	1386166860	408239520174579712	f	sweeterynyc
FREE cookie give away alert! Find the spl @FoodNetMagPromo @SweeteryNYC trk giving away free cookies all day, now @ Hudson/King St til10:30	1386166668	408238714280624128	f	sweeterynyc
Another boootiful day. Spend it w/ us at 55th St. bet. 6th &amp; 7th Ave. 11:30-2:30	1386166660	408238679497244673	f	kimchitruck
Midtown west. The weather is beautiful. Come get ur Asian tapas from us. We r @ 55~56th st &amp; broadway.11~3pm. Come out one. Come out all.	1386166904	408239703151099905	f	shanghaisogo
gorgeous day! ... for an empanada. Meet us on 52nd &amp; 6th ave today, for lunch. #munch #midtown	1386167146	408240717799391232	f	nuchasnyc
#humpday #wednesday 53rd and park for #biandang.	1386168154	408244946827608064	f	biandangnyc
Hot Roast Beef sandwich being served today, with fresh mozz or provolone, au jus, with or without grilled onions.	1386167832	408243596014268416	f	disosnyc
Soho lunch today! Varick and Charlton corner spot.\n\nCall it in to pick up: 917-756-4145\n\nCiao	1386167764	408243311682416640	f	disosnyc
What is "SOGO" mean? Yes! We r serve from the street. And we have to keep on MOVING &amp; SERVING! SOGO FOR IT:--))) http://t.co/u5zCcQR2oE	1386167443	408241965340565505	f	shanghaisogo
Wafel Cabana @ 35th &amp; Broadway open till 9p!	1386168660	408247066813415424	f	waffletruck
Holiday Markets! \nUnion Sq is open till 8pm\nBryant Park open till 9pm Columbus Circle open till 8p	1386168653	408247038975823872	f	waffletruck
Vedette @ 60th &amp; 5th til 6pm\nPagadder @ the Brooklyn Bridge/City Hall Park til 7pm	1386168636	408246966766669824	f	waffletruck
Wafel Wednesday!  \nMomma Truck is at 60 Wall St till 4:01p Goesting @ Broadway &amp; 66th til 9pm	1386168625	408246920172150784	f	waffletruck
Happy #HumpDay we are @BrookfieldPLNY south end and liberty serving lunch 11-3! Don't forget to check out our specials and kickstarter page!	1386168854	408247880059994112	f	sweetchilinyc
Happy HUMMMP DAY! 49th st bet 6/7th ave 11-3 cheesesteaks for the masses!  @FoxNews @Barclays @MHEducation @MHFI  GOT WHIZ?	1386169259	408249578551791616	f	carlssteaks
Bessie's at 58th &amp; Mad, call (646) 504-6455 to pre-order. Sandwich menu always at @HoustonHall_NY	1386169236	408249484829667328	f	milktrucknyc
Sorry #MidtownEast, they're filming a movie on our usual block today, so we moved to #Flatiron on 5th Ave &amp; 18th St. #LebaneseLunch	1386169759	408251679319273472	f	toumnyc
Another gorgeous day perfect for #lobstahlovin. Stop by at 52nd &amp; 6th and grab a roll or 2 from #BigRed	1386169978	408252596487733248	f	lobstertruckny
Hello soho! Lunch 2day @ Hudson &amp; king burger of the week THE AO TRUFFLE BURGER preorder 9172929226	1386169767	408251712307494912	f	fritesnmeats
If you missed the sufganiyot sellout yesterday, we brought back twice as many today. Your last chance to enjoy them is @ 20th/5th	1386170460	408254615831187457	f	taimmobile
Your last chance to enjoy homemade sufganiyots at Taim and Taim Mobile #hanukkah #nyc #foodtruck http://t.co/FHDfVe8c5s	1386170381	408254288293814272	f	taimmobile
We are back on the block! Broadway b/w 55th and 56th street - ready by 11:20! @midtownlunch	1386170539	408254950494703617	f	polishcuisine
DUMBOHHHHHHH.  jay &amp; water.	1386170190	408253485776244736	f	shortysnyc
Have you heard the #goodnews? #MSG is back on 53rd&amp;park! #nomsgtho #midtown #homecoming @midtownlunch @nystfood	1386170563	408255048679161856	f	mooshugrill
Hey guys. What a beautiful day! Time 4 schnitz:) 48th b/w 6th &amp; 7th the #Schnitztruck is coming your way 11:30-2pm preorder 347-772-7341	1386170276	408253843827613696	f	schnitznthings
RT @12BarsNYC: @schnitznthings Please RT for #GivingTuesday! Support @FoodBank4NYC at Saurday's 12 Bars of Xmas charity bar crawl. http://t...	1386170157	408253345183580161	f	schnitznthings
Friends of Park &amp; 47th, we're here through lunch. (Close to Vanderbilt.) The soup is a Creamy Corn Chowder.	1386170693	408255594295218176	f	thesteelcart
RT @DispatchBP: . @BrookfieldPlNY SOUTH Lot | Dec. 4th | @SweetChiliNYC &amp; @ESTacoTruck | S. End Ave. &amp; Liberty St. | Serving 11a-3pm. | #fo...	1386170638	408255364606722049	f	sweetchilinyc
DUMBO today @dumbolot. @dumbofoodtrucks @dumbonyc	1386171222	408257814097039360	f	domotaco
Spinach Jalapeno falafel is back by request on 20th/5th. Hot Black Bean soup is in the pot. And sufganiyots are available for the last time.	1386175049	408273863873929216	f	taimmobile
@castromadrigal @dumbolot It is a very real possibility, we are scouting the scene today!	1386174952	408273458385420288	f	taimmobile
@sugarpond Sorry, today is the last day for all our locations	1386174898	408273231117049856	f	taimmobile
18th and 5th...we are here to get you through the holiday gap!	1386172503	408263186719469568	f	mexicue
The spl @FoodNetworkMagPromo Sweetery trk is giving away FREE delish gingerbread cookies on Madison Av&amp;42St http://t.co/x3oMamoyfY	1386174515	408271626426261504	f	sweeterynyc
We're having a party, lots of love in the air @LGUS NJ Headquarters, you gadget guys know how do it right!	1386173118	408265766782255105	f	sweeterynyc
RT @FoodtoEat: It's the perfect day for a nice warm #grilledcheese from @milktrucknyc! Pre-Order now: http://t.co/XCTeukFrWQ #skiptheline	1386174392	408271110128795648	f	milktrucknyc
RT @randomfoodtruck: Today's lunch brought to you by Katz &amp; Dogs @PolishCuisine @VeganLunchTruck @shanghaisogo and @bigdsgrub	1386174213	408270359801397248	f	polishcuisine
11:20  - 2:30 - get your Smokin' grilled kielbasa, potato &amp; cheese, meat, kraut &amp; mushroom pierogi + PACZKI @randomfoodtruck @nystfood	1386173324	408266629642846208	f	polishcuisine
Here I am with Elvis Duran and his crew  .  They Loved it #bestpizza #bestradiostation http://t.co/I2bci8b7aP	1386172190	408261873235025921	f	valduccis
RT @mooshugrill: Have you heard the #goodnews? #MSG is back on 53rd&amp;park! #nomsgtho #midtown #homecoming @midtownlunch @nystfood	1386174094	408269857923530752	f	biandangnyc
#BigRed just got kicked outta 52nd &amp; 6th and is on the prowl for a new home. Stay tuned! #lifeofafoodtruck	1386175952	408277652286734336	f	lobstertruckny
@RandallSawyer round 2 on Friday come early!	1386173342	408266705698566144	f	mooshugrill
Had a difficult time finding parking for the truck!ALERT we are on 55th street &amp; 6th avenue from 11:45-2pm #Schnitztruck 55th &amp; 6th	1386173994	408269438606401536	f	schnitznthings
The #Schnitzcart will be slinging delicious meat cutlets on 27th and Park ave 11:00-2pm. It's schnitz weather:) preorder 917-575-4377	1386173928	408269163313266688	f	schnitznthings
@JairoC @lilpimpsocks we have made it then!  We are right by there once a week. Wall st / water every Tuesday #goldmansnacks #vegan	1386172986	408265210391433216	f	veganlunchtruck
Lunchtime Grub awaits you at 55th Street and Broadway, now till' 2:30pm. Preorders call 646-543-BIGD	1386174559	408271807956144128	f	bigdsgrub
@Mr_Milhouse present ur tweet to us next time, and ur sandwich is on us..	1386173580	408267704785993728	f	disosnyc
11:11 we're open!	1386173523	408267463781261313	f	disosnyc
Big Jawn 41st n 6th til 145\nOG Jawn Water n Wall til 3	1386175789	408276970582331392	f	philssteaks
@RedskinsST21 41st btw 6th n Bway til 145	1386175055	408273889136246784	f	philssteaks
Another beautiful December day means another chance to grab your favorite cheesesteak for lunch! Celebrate Whiz... http://t.co/qc4sw6mLCz	1386172440	408262920569888768	f	philssteaks
It's about #lunchtime, @DumboNYC @DUMBOFoodTrucks! Eat your favorite grilled cheese &amp; celebrate this beautiful day! Pearl &amp; Front till 3!	1386173242	408266284393304064	f	morristruck
Fresh and Hearty serving lunch in #Flatiron on 5th ave btw 17st &amp; 18st from 11:30am to 3pm #paninis #soups #salads #wraps @midtownlunch	1386173982	408269391760220160	f	freshandhearty
Choice of dressing: lemon orange, creamy ginger or peanut cilantro. http://t.co/cwjuwgnfkj	1386175528	408275874094800896	f	shanghaisogo
Today's special: braised duck thigh, 5 spiced egg &amp; shanghai tamale. Serve with vegan &amp; organic mushroom tofu soup. http://t.co/JqgKH6RQyh	1386175503	408275769136541696	f	shanghaisogo
Clock circle: 5 spiced egg, carrot relish,  Sichuan kimchi, spicy sour cucumber. Kelp seaweed salad (middle). http://t.co/idiWp4d3Hq	1386175474	408275645744312320	f	shanghaisogo
Open for lunch on 49th &amp; 6th!	1386175529	408275877718659072	f	neaexpress
RT @DispatchBP: . @BrookfieldPlNY NORTH Lot | Dec. 4th | @MexicoBlvd @MikeNWillies @MamuThaiNoodle | N. End Ave. &amp; Vesey | 11a-3pm.	1386173612	408267837128839168	f	mexicoblvd
RT @DispatchNY: . @BrookfieldPlNY NORTH Lot | Dec. 4th | @MexicoBlvd @MikeNWillies @MamuThaiNoodle | N. End Ave. &amp; Vesey | 11a-3pm.	1386173606	408267814135693313	f	mexicoblvd
We are on 52st and broadway!!	1386175879	408277345385340928	f	chefsamirtruck
We r serving lunch on 47st between park and madison.have a nice day #thnku	1386175459	408275583429541888	f	mausamnyc
Serving Lunch on 46th st\nBet Park Av/Madison Av\nOn Vanderbilt Av	1386176203	408278705954623488	f	tacobite
Serving Lunch on 46th st.\nBet Park/Madison Av\nOn Vanderbilt Av.	1386176106	408278300591935488	f	tacobite
G1-36/6\nG2 - 26th 11/12\nCheesy Mac &amp; Rib Melt:\nCheddar, pulled pork , mac &amp; cheese , caramelized onions, bbq.\n#comtothecheeseyo	1386177458	408283969726472192	f	gcnyc1
RT @dmota25: Time to lunch @milktrucknyc #Manhattan	1386176655	408280600932401152	f	milktrucknyc
Looks like it'll be a lobsterless day in Manhattan. No room for #BigRed today. Don't fret--out again tomorrow and open in #RedHook til 8pm	1386177895	408285803857838080	f	lobstertruckny
@DrewDown91 @jwallett13 oopsies :)	1386178840	408289767759962112	f	kimchitruck
OY, DUMBO! Come over to Pearl &amp; Front- we've got delicious grilled cheeses and crisp cider. Eat your heart out! #WeKnowCPR	1386178832	408289731894841344	f	morristruck
RT @RichardMyrick: Top 10 Most Influential Food Trucks: 2013 - http://t.co/wUJc5SSBT6 .@biggayicecream .@waffletruck .@COOLHAUS	1386178115	408286726361456642	f	waffletruck
MRT @climatedesk "JayZ &amp; Beyonce going vegan http://t.co/UH3YHlAV6o via @grist" He may have 99 problems but a vegan pizza ain't 1! #Marinara	1386176874	408281520622034944	f	neaexpress
the Police moved us out of our lunch spot. Stay tuned to where we park next!  ... thx!	1386177986	408286182934867968	f	nuchasnyc
New galbi steak burger! http://t.co/b4utLGKWO0	1386177191	408282848852844544	f	bobjotruck
BBB IS READY! http://t.co/D4Yno1GAwo	1386177048	408282251382644736	f	bobjotruck
Bobjo express will open at 49st &amp; 3rd ave.\nThanks!	1386176968	408281912692592640	f	bobjotruck
Bobjo truck open at Varick st and king st. Hot ramen noodle soup make u worm. Try our new gali bi strak burger.	1386176941	408281802151710720	f	bobjotruck
On 52 st and park av!!!	1386178269	408287369377611776	f	chefsamirtruck
@BMP326 rice cakes or shrimp and radish cakes. Or shrimp chips!!	1386178265	408287354076798976	f	sweetchilinyc
Happy Wednesday \nKasar truck is at 91st and Columbus \nJoin us	1386177376	408283626397126656	f	chipsykingny
@ElenaLaMalfa Lentil for lunch and Black Bean for dinner	1386179811	408293837246038017	f	taimmobile
Sorry we have been m.i.a. Having major truck issues. Hope to be back on the street soon! We will keep you posted.	1386179480	408292449510232064	f	mamuthainoodle
Oh"r	1386179548	408292734491836416	f	sweeterynyc
What a gorgeous day! Stop by the truck at Varick and Vandam for some burger treats!	1386179407	408292145628708865	f	goburger
Cinnamon Snail named one of the top 5 most influential food trucks of 2013!... http://t.co/Seny8xdi3D	1386179889	408294166008188928	f	veganlunchtruck
We're going to our late afternoon spot today, so we'll post hours for 18th st &amp; 7th ave later today!	1386179253	408291498057560064	f	thetreatstruck
hey #flatiron munchies, we just parked on 21st &amp; 5th ave! for lunch.  #luckyspot #luckyyou #empanadas	1386179211	408291323163467776	f	nuchasnyc
Ok 7th Ave btw 37th &amp; 36th St. It's your turn!! FREE Delicious gingerbread cookies courtesy of @FoodNetworkMagPromo &amp; @SweeteryNYC till3:30p	1386181839	408302342518210560	f	sweeterynyc
#HappyHumpDay @DritaDavanzo @MobWives #mobwivesnewblood Eat @Valduccis 49th&amp;6th Free Zepolle http://t.co/XkHJidKTnA	1386180045	408294819803303936	f	valduccis
Heck yes! \n\nWe have been named on of @MobileCuisine's Top 5 Most Influential #FoodTrucks of 2013\n\nhttp://t.co/5jDeQV7hGU	1386180156	408295286185132032	f	veganlunchtruck
Brooklyn Popcorn Truck on 39 and broadway are new flavor Ranch is crazy	1386181820	408302263875039233	f	brooklynpopcorn
49th &amp; 6th! Ready for some authentic flavor?	1386180141	408295221961969664	f	neaexpress
http://t.co/J18u7IzMgA check out our kickstarter page! We need help getting a new truck! Contributions get you awesome rewards!!	1386182950	408307005884231680	f	sweetchilinyc
RT @StefanieHarvey2: @thesporkful @TaimMobile @CookingChannel That's fun to say! Falafel Waffle!!	1386184281	408312585021587456	f	taimmobile
@IPOwines representing again with today's #TaimOfficeHero, Lindsey. What a selfless staff!	1386184270	408312542399057921	f	taimmobile
If you are going to the tree lighting tonight come and see us for dinner. We are Park d on 43st between 5th&amp;6th... http://t.co/SP6g2J9k7W	1386185597	408318105924808704	f	eddiespizzany
Curry Laksa at Bedford tonight!!	1386183667	408310010721337344	f	lovemamak
RT @TheBillMarchant: @PhilsSteaks The intern aka the "Vir-Jawn" ordering his first steak. http://t.co/JADmvHXgQs	1386185117	408316093623971840	f	philssteaks
RT @KatherineKLin: Provolone steak with fried onions and fries.  Yum. (at @PhilsSteaks w/ 2 others) http://t.co/GCNfWhaGue	1386185108	408316056076550144	f	philssteaks
RT @maevej1: @PhilsSteaks The fries are perfection. Yum.	1386185100	408316020957646848	f	philssteaks
@UnknownFilms very sorry. Lots on the plate. You'll hear soon.	1386184595	408313905820073984	f	waffletruck
@LizFunes right?!	1386184485	408313444723478528	f	waffletruck
@estherabigailMD tis our distinct pleasure!	1386184473	408313391992668160	f	waffletruck
Tomorrow is Thursday...you know what that means!!! #MidtownWest	1386186409	408321514082402305	f	bigdsgrub
Shut Down Taco Bite addicts see you tomorrow.	1386187043	408324172784627713	f	tacobite
RT @IPOwines: @TaimMobile Thanks for the delicious grub! it made our day. Cheers!	1386188941	408332132860588032	f	taimmobile
Happy hump day! Thanks for coming!	1386187454	408325895997652992	f	polishcuisine
The Cinnamon Snail won the 2013 @Vegnews #Veggieawards for best #foodtruck! \nThanks to our fans who voted for us \nhttp://t.co/X6IQNPUNXL	1386188001	408328188637741056	f	veganlunchtruck
@awesomeboris no.  And we close at 3:00	1386187719	408327008473845761	f	veganlunchtruck
!!! Wed, Dec 4th 3:30-7pm 18th st &amp; 7th ave! Happy last night of Hanukkah!!!	1386189173	408333105943310336	f	thetreatstruck
Take a break from the books NYU and GET YOUR PHIL! Big Jawn serving dinner until 8:00.	1386188201	408329027498573825	f	philssteaks
Get over #humpday with a few empanadas! http://t.co/qnHpLexh0W	1386187813	408327399563354113	f	nuchasnyc
"Warmth inside its pages" #balaboosta @EinatAdmony @nytimes http://t.co/2D5chc6lFz	1386198209	408371007024812032	f	taimmobile
@theskint how about a follow?	1386200861	408382129832083456	f	sweeterynyc
Final location on @FoodNetworkMagPromo Sweetery truck tour, Broadway btw 53rd&amp; 52ndSt, we are open 2 give away free gingerbread cookies NOW!	1386191292	408341993291382784	f	sweeterynyc
We've moved to East 4th and Broadway for dinner!	1386194309	408354648051838977	f	goburger
Sorry world, closed til Friday. Apologies to those who came by FiDi today!!	1386195456	408359459883589632	f	korillabbq
86th &amp; Lex.  Ready for dinner!	1386195252	408358602332995584	f	shortysnyc
Find us Dec. 6th &amp; 7th at BeerFest! Chase a beer with shawarma goodness. Get your tickets here: http://t.co/isK5WuK5i6 #LSBeerFest #tapthis	1386194702	408356294761140225	f	toumnyc
Red Bank customers, we need your help:\n\nJust got the word that we aren't going to be allowed to operate the truck... http://t.co/2XUhBAb53Q	1386196290	408362954468626433	f	veganlunchtruck
RT @rachaelkeh: Can I just eat @waffletruck Waffles &amp; Dinges for dinner every night though? #delicious	1386198711	408373111697190912	f	waffletruck
"If you really want to make a friend, go to someone's house and eat with him... the people who give you their food give you their heart."...	1386199835	408377824844996610	f	neaexpress
A well-done piece on farmers' relationship with the environment: http://t.co/6O2CmMp6bC	1386194498	408355439060189184	f	neaexpress
@jenyen1 Love it!!! Bring us some next time you come to NY.  Love to try them.	1386200482	408380540471869440	f	nuchasnyc
Pls donate. Palenque producing quinoa and multigrain arepas for NY to eat better http://t.co/lzvaT55wcr via @sharethis	1386203244	408392124342603776	f	palenquefood
RT @dorothyfriedman: @ilkandcookies @rickasken @shortysnyc #Cheesesteak rules	1386203926	408394983818149888	f	shortysnyc
RT @LukesLobsterNY: Yours truly will be slinging lobster, crab &amp; shrimp rolls all Fri/Sat for #LSBeerFest!	1386203035	408391247821570049	f	nautimobile
What are you up to this Friday night &amp; Saturday? Come hang with us at #LSBeerFest. Cheesesteaks &amp; craft brews.... http://t.co/8CgyQY3RRz	1386204117	408395783877439488	f	philssteaks
This just in! Momma Truck is at Astor Pl till 11p! Allez!	1386203423	408392876444618752	f	waffletruck
Hi, how are you :) RT @christinajoyyy: First wafel from @waffletruck of the season! #hellooldfriend	1386202028	408387023612170240	f	waffletruck
@50Wrds4Laughter False! Come find us at Herald Sq til 9, 49th &amp; Park til 10 or our Cafe at Ave B &amp; 2nd St til 11!	1386201889	408386440175681536	f	waffletruck
RT @linalovesit: Japanese teriyaki steak taco and nacho tater tots WERK BITCH @DomoTaco	1386204734	408398372979372032	f	domotaco
@christopherjee sorry about that. Come by next week and lunch is on us.	1386207837	408411387283927040	f	domotaco
RT @fourwheelfoodie: Thanks @Thrillist for these great truck recommendations! Love those @PhilsSteaks, and @KelvinSlush for dessert! http:/...	1386207720	408410895552106496	f	philssteaks
RT @BoutDatHipHopLi: @KatherineKLin @PhilsSteaks umm hope it has the green pepper in it! lol #oundGood I*m so HONGRY #BestSandwichEver @Bou...	1386207684	408410744838189056	f	philssteaks
RT @keithepetri: Nothing would make me happier right now.  Then you @Mexicue! #SmokedBrisketBreakfastBurrito http://t.co/GFc1UTid6F	1386208814	408415487274782720	f	mexicue
RT @ohhleary: May have only gone to @bigdsgrub because their sandwich is a "grinder" and I felt a little more at home. #newenglandpride	1386210276	408421618948788224	f	bigdsgrub
@sarahkkatt Pray to the bacon gods! #oinkoink	1386208895	408415826715615232	f	morristruck
@NatalieKristal @waffletruck we are ready for you.	1386211019	408424735731888128	f	nuchasnyc
http://t.co/r4X5X6TB	1359646681	297005824084176896	f	thecrepestruck
We are retiring our current truck to get one that runs! Make a contribution for some great rewards! http://t.co/gZtZEjJ0MY via @kickstarter	1386211031	408424784297336833	f	sweetchilinyc
@fahshion miss you too. Come visit soon!	1386212678	408431693943803904	f	biandangnyc
@onacasiP some lucky dinges.	1386214246	408438268863475712	f	waffletruck
@drelly sure thing!	1386214195	408438055365013504	f	waffletruck
@smchickbigdeals happily, for catering. The trucks are only permitted in NY for street business.	1386214081	408437575687610368	f	waffletruck
@CarlFJr one day it shall be!	1386213924	408436918641491968	f	waffletruck
@TheQueenBlogger preach!	1386213875	408436712395010049	f	waffletruck
@NatalieKristal @NuchasNYC we count the minutes.	1386213826	408436507394187265	f	waffletruck
@rvblkr a fine dream. A fine dream indeed.	1386213790	408436354729918464	f	waffletruck
Just added Lion Stout on tap. http://t.co/miAUtvHjbH	1386215995	408445603245744128	f	shortysnyc
Just added Lion Stout on tap. See our full beer menu: http://t.co/qan6zoyf3g @LionBrewery #BeerMenus	1386215994	408445601467346944	f	shortysnyc
Just added Stone 17th Anniversary Gotterdammerung IPA on tap. See our full beer menu: http://t.co/qan6zoyf3g @StoneBrewingCo #BeerMenus	1386215992	408445593699512321	f	shortysnyc
Just added Stone 17th Anniversary Gotterdammerung IPA on tap. http://t.co/y8ovKt455A	1386215992	408445591350702081	f	shortysnyc
RT @RollingStone: Jay Z is celebrating his birthday with a new diet: he's gone vegan: http://t.co/iG6nS6Kbiw	1386215394	408443086160027648	f	thegreenradish1
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

