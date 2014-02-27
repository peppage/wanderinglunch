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

COPY images (id, suffix, visibility, twitname, menu) FROM stdin;
4fb29dc4e4b0e08c1e225555	ckjwTj4Fd2cRoZvDQZw_1jYdwuBF4BsfV4ZWc5oElFo.jpg	public	eddiespizzany	\N
4da8977840a3582fb8c49316	MCGIPRA0XR15JNG4O2YZJQBCRMK05UVTC4T14TOQWRTNMQFZ.jpg	public	eddiespizzany	\N
5249c4bb498ecd25dde27c5e	764670_x0RdEOs5TL4SEe2zGgpkzPFBFmlFV7-6UQiVtoFeHaY.jpg	public	goburger	\N
5182ad6b498ef6cb59d48783	39425123_zPh6ih4GAAygbhRJ-pyPdCr5TI3rXafgKyIEEK4HpHY.jpg	public	goburger	\N
526fef71498e92d1ace459d9	60805368_eCRrBwapYrNL8fM9tmIaLCfnlhQYb9ASU-ZkaR1Og54.jpg	public	mamuthainoodle	\N
51c1ea41498e372d91835cf9	5067950_pSXIZo_RqO8Hh5AuWcomjr0p3q_pXPUMWe99W8hUGTU.jpg	public	burgersandbites	\N
51a79983498e3044671cd784	1441492_yfySwml4ChzJ_ni5DxTq-8n2UlecWBWjgxR-ygA6pYc.jpg	public	burgersandbites	\N
5192873e498e63958610c2eb	117715_Jf2pdeF9ztory7puWsPaFE26jmMzPEzjOfPopvTzSjA.jpg	public	polishcuisine	\N
5244712a11d295d581384a17	22780_QXd0BtJcOWXZwSm_ZG3oXyaNj6Qw5-p8hWQzzH121fY.jpg	public	polishcuisine	\N
5203e16e498e9e8e0a93b61a	702028_Fog-6PEF03KateivIPP-hx87Qn6gi7PwnaJv-wTFv3I.jpg	public	carlssteaks	\N
4f7deaf5e4b0ffb6a3f2008e	Xho5Xq8BtpNhEQvH0KRI3yX4kUstFRwTxEDj6QoawcM.jpg	public	palenquefood	\N
51b8a845498e8ebdef064e0c	761163_j9ai1NfaIpK2TLN8JzXbTwyIhVzuZevNHBV5EpQ7Fh0.jpg	public	palenquefood	\N
51435e1de4b07d53cf71fd7a	4486_lUhkecOFThYlMHKai4wDp4lXXiQSPLTq3Nno5WMIz7E.jpg	public	palenquefood	\N
4e6513efc65b2dc8a0bfff6d	TUQTIKBJPOALJKHN54QRKGISWMQDDOW3WTAECOGJ4FOJTPXI.jpg	public	palenquefood	\N
52407581498e6271e84d0d20	663291_BQuSIJb2d0ODso7gvZiRLuvYbp3sg4FwHG2u0kAwsmE.jpg	public	gcnyc1	\N
51eae36e498e58d50e5683ba	331066_SArUzXa_cz_-YMQco1rwYAfU8a99TZCHJX9a2WA3fHg.jpg	public	gcnyc1	\N
521cdbc611d2549cf41dcf9c	926357_0BYLrfqHavxLIHQNkWupu34ImE55HTUVGGDJjycyOVM.jpg	public	seoulfoodnyc	\N
520912ad11d2f941183dea9f	13285510_v7K0PTg4FzGI822Jbc9A8K5mUHIxwJPBZB_0xNeEauE.jpg	public	domotaco	\N
50ce269de4b07c1547ebfb2c	263293_qjcLaRmf5itOMyRiq4AyYZuY2UVjVJk04lO3FTA2CMY.jpg	public	domotaco	\N
4ec59ebacc21b428e0de466c	4AMXSGP5YGTUHEL3TFKTS5ROVIX4HUTU4MU5ZW1OX5E3URDD.jpg	public	domotaco	\N
51d31ab97dd28a271207af20	59958053_5CogfmHgRpBtjkPzVkAgAjK7q9ac0bo8Z1TPwxPIFAw.jpg	public	grillonwheelsny	\N
516ee142e4b04f28d58be309	36812449_DjR1ynMnMpwj-KmiWPZQldmGQwJ2IEzjSwwmGevqe3U.jpg	public	sweeterynyc	\N
5107e09be4b047c08ade6bf6	760350_ZaalKVnOYdVAGoQEdugu-1Lws1LubyJBOVpZvJJD1V0.jpg	public	sweeterynyc	\N
50188a43e4b0d35e6d8035b4	b-fKh6mx2WxCybNQkr9ovk_jv4x7bwJPVFM9RF3M5T4.jpg	public	sweeterynyc	\N
4fd79157e4b071eb33a9c810	8zrcTIejD5EBiOJzSobql1_PQWr-i2KmRfgMCYmbK-M.jpg	public	eddiespizzany	\N
526e8aee11d299d16e74b447	67629862_ZPeS1alTFabw1hPqq8PCcGF1SRFynqA23OgkKg8yc00.jpg	public	lovemamak	\N
521b83c411d29ec0512f89b3	255980_1U9yRWzBKuIDLReBhmBs45qJ0mtHu7pzL_Fv4T9gTss.jpg	public	lovemamak	\N
501d4734e4b0af03cf473287	6BUHUmEyYTTh3a2SRjSYRklUlTfQBNbFnnk_hfEojYs.jpg	public	goburger	\N
501fe830e4b0bbddce992f90	fFBOGONZt5Zr77Vc5g8adoAiBht0f-MBut7GqorVEjo.jpg	public	mexicue	\N
4f67b0d4e4b08559c4c60149	SdNxRS0joKXurf0FEv8_SRg-GeR9lGCN098_ZB2tijA.jpg	public	mexicue	\N
50784742498ec6be8cd3f88e	155927_ebZApDyXpTKTmvOQHdBTxNc2wJrsZV2QASmpYTNAVJM.jpg	public	mexicue	\N
507efae0e4b09a52c022ec3a	39213_nH-zcqfLCJqMvG0Nco0LWE4QuRuoL6unlEXJlJbTEF4.jpg	public	mexicue	\N
5203bd51498ed50247ee01dd	60805368_HlIeqCMjY2I5md2mzI5crKizc9wVPUZo_sBmC6zrPEA.jpg	public	mamuthainoodle	\N
52a0bef911d299250c89f9c7	349672_Cg8dtcrfQ0WZeSo7BJR61YBG6VzsiMltZP8XIqyHiu0.jpg	public	mrniceguytruck	\N
5180207390e7374e46b6c165	49563206_uKsSD-Cd2jjy6FMyR9U_--7DdUBJ7ZUxtdlushxyIAg.jpg	public	freshandhearty	\N
5281221811d21e907e460e00	4195495_akELCvAQ7aY-bfTfHk93g5g5_qcJnQJV7h_gH0FlKUA.jpg	public	milktrucknyc	\N
52052ef211d22b8ed81dd96b	36360429_am9ha8rSYxAvCaSMU9ya6lI9MzIgcpR62DH6HS1b-uY.jpg	public	milktrucknyc	\N
4f749b3fe4b0f06c04ae2440	rA31cWGMm0G8EuZFYZBxb3y2OrW3oEo7vCj1L2XR3AM.jpg	public	milktrucknyc	\N
4f9c18b0e4b0b38d2f554383	AQEKYbyPrQt5uMWhy4r4ODm2vSMCqPseJyMhcg55mtY.jpg	public	eddiespizzany	\N
507b0648e4b0109f3656e2d2	76137_7JNe3m0dO2MZ7a9rkqa_DTlnrw0LyNitqksFG7_5IC8.jpg	public	lobstertruckny	\N
508abe69e4b01ff7516d118b	8029486_9wt2tO9BnY5d11Ef0mpAgHAqfK1QMmSvLXglU4fj6Xw.jpg	public	lobstertruckny	\N
500ecc9ce4b0a6d209804d9e	d2yG6CtTrc8TQAXoEGN68UYAv3DiJIqJvKU65-ApcaU.jpg	public	lobstertruckny	\N
5245c7a1498e0eb9bc097723	1727660_xLZtYmqATL4pckN_IhgIj0AgUbDAJxywzqbf5PKEooM.jpg	public	lobstertruckny	\N
506dcb8be4b0748e0467de78	157259_PdYI3Fpzhcz_LoGnBeymaSAZaZCiVVw43c4xaYQQIDY.jpg	public	mikenwillies	\N
51117858e4b0e14064917adb	263293_EvgjxXJqOivd94q0mbPR_AxkRXuzkFtjOBcOWnXuyQU.jpg	public	mikenwillies	\N
5135022ee4b0592185aa975e	2660256_0rdKd0P0tCYzLf5j7-_3b8HbPNDVCW6S0hHdJGW47Wo.jpg	public	mikenwillies	\N
51dc5a9e498ebf7ad40223ec	1328035_Ak3fMs2e36r7NvIE_gIDK5XZ9CwrW1DEJa3g1oobp5E.jpg	public	wingnitnyc	\N
51c213db498e0748ab0dca3c	53641916_5aNKp9fdHx3i_Pi15Z_X6pE3fAsTX35YBQ0nlmZGfaA.jpg	public	morristruck	\N
5220dc78498ebd10d150f736	29917892_nMZHXkfxBukc2QfFqtDBTZSJ1xpMkoO7VGBJmGKkwhY.jpg	public	brooklynpopcorn	\N
4fee068ce4b0f9bd2b4041f7	UQwqaF9knSdh4LFRzAhnh7hcl6_dSjDTg1phtqTe_7Y.jpg	public	milktrucknyc	\N
5199097e498ea36447e54093	40899881_hbjUdavpBfT-sLaBhv3pbZydT1tgs9v-Maw12j9I3Xs.jpg	public	carpedonutnyc	\N
4fe65d6fe4b09198fde5842a	nVmhJloDitdcBPFceYT8ajqQqgXBpB_w5GoPWse33Ks.jpg	public	valduccis	\N
506dc9b9e4b0c21f078c3bb3	22983_XN2GbKo3a5YsNY_ZpiBcjUHTD2if3TWS8r586Uq4cEk.jpg	public	blend_express	\N
5033cee6e4b03e64bc749ee7	tIyy6IAKcw2SSiX5JSPBCURstZZisntK_46plgrfdJ0.jpg	public	blend_express	\N
519babe8498e355d9d35fca0	65817_6p9jSMaQMqP9QGn3KOIyuDOG15jaLxIPvsdrpZGWdj8.jpg	public	blend_express	\N
50e71f82e4b07154c72fdc22	275165_az4RUZ2U7-4cfdnQA1FlMrDLaxwCMriWtlhS_pddjEc.jpg	public	mexicoblvd	\N
525de1d7498ef4b27ada0847	31827631_CApIgPWaXupe3toLi7iJLb6NxIyn2IDTOjAG0qw-PIk.jpg	public	mexicoblvd	\N
5140cc96e4b0ef29f4802508	4886503_z36ZXtYKGVIHcNLCR18ZdUWtpStRrbf33rInxsr2p1Q.jpg	public	mexicoblvd	\N
521cdb8011d2f79883b5be62	36501880_zzNkJUOscINjy2aiwKSZEwjfQYJPjqmAsa6zS0dakp8.jpg	public	nuchasnyc	\N
5008051fe4b0974c844d5003	oNy0_bsWPyVmjrduzJXpbrAPHjQS0PVbyOCfoRSD9xE.jpg	public	shortysnyc	\N
51a4ee69abd87ea53396c979	4083549_jMzaCPEId80kWmAaq2oQ9APKf4bLvdeHhy40qPeB9j8.jpg	public	shortysnyc	\N
50045b1be4b0004dbf67c977	MDweBG1fBnF_fZ1tOghWyHS9qUxGNiJeOrOpoA-fBrY.jpg	public	shortysnyc	\N
5161e794e4b02525dbd064d7	310577_h_ww6Za5XojCZcGVq7-gZluC_YvRnT1EOXY4hwV7KJ8.jpg	public	seoulfoodnyc	\N
5012d0d5e4b06fc7ce735a68	7J2g1YLtx4ma57g4A4CerJJ66OwudjGhFI67JaNl1Qw.jpg	public	seoulfoodnyc	\N
501c284be4b07d0ab63e08be	vQv8P8_hFNwHMmpR7k6-arr8zqYmmgoSG_aAPJuz-ws.jpg	public	itizyicecream	\N
51e83b4a498e0a1c64e62828	26624_AGoljLki5SS-GJGKaAGB75mloHKRBkJ1Qj5BQCRP1_Y.jpg	public	itizyicecream	\N
51dd9efb498ebbc846c11c03	13001992_b9dLXH02o0ZX8hyUZVtpgGW6sDyzAl23vmEl-0Hj0jY.jpg	public	itizyicecream	\N
529ccbc511d21047117cdea2	68150__CRf8sW9KvXZTkcAQEc4EsnYPgqXA2trmMxy-_AzobY.jpg	public	mrniceguytruck	\N
521f754c498ee4d6fbe8a778	22491899_EEPqf4HeJFaaFjYabKyScGZ8symjXEgMjPUEkfpJsJk.jpg	public	morristruck	\N
51856452498e6f602088cbe1	232510_pLk3QUUWFOu82-4SX-ObtA8bw2ZPf61QBOeIuL50T-o.jpg	public	morristruck	\N
516d98b8e4b0b059e50ff5ad	117715_BoNkQJO4jPWEtg_ef4-URb7IseoIXnYiP5vkvWJtezg.jpg	public	toumnyc	\N
516452a5e4b0e1b216fdbaa4	26263584_5wpEOb9FygNRBFQySA-pE1t1q_E9jVM_4mx2mnw5fAU.jpg	public	toumnyc	\N
51716b5f498e03d8bc252c48	11709298_S8klPxq0yPyZw2X9-_0IZyk6TFTn9xi5SWd_6BGCeVM.jpg	public	toumnyc	\N
507dacb0e4b0d8cafc9601e0	2361939_S3NwwSNVZD-2tAhc3bwAvsYgk9tXwYv0T0yq9ci-ihE.jpg	public	toumnyc	\N
5079a745e4b00277f33e4836	34723233_tCoDnWhdhZj61xi_e00MNwJoK_UcfDXCQQ7Weat8pBM.jpg	public	valduccis	\N
521e9e4511d2d8ddc5c69dbd	117715_r7cpzyXCpOthqHouR5gdqIMX8k0TZ2KWHFun5wh-EYk.jpg	public	valduccis	\N
513101fce4b006d9c4991bdc	17248619_XfpmI8dNgmoeHE3BXjV8bL2yuuMTqxU3FqDr4BqX7Ks.jpg	public	bigdsgrub	\N
4fa2d04de4b0489ba3d7936d	hsPbM0G5l3AsUaI3x6r_VkiSYo4pYlWTKK2S9zqh_KE.jpg	public	bigdsgrub	\N
5298ff7011d22a38856168e2	191726_GHXLJD8lsdPciKdqJErekl1SKPjw5k4N2YuNJC6JRTU.jpg	public	nuchasnyc	\N
51118d62e4b063f95c18d16d	191726_pTyD4DsW_jGt7E3QJJdH1QB-mHP1ZYggLzXtnZ7j3Oc.jpg	public	nuchasnyc	\N
4fa814d1e4b0d607baf8bd9d	2drHnu4mqj-uzpwwcJa3MatYGD7KFuxjE472rButWlM.jpg	public	taimmobile	\N
51800af8e4b07a4a57023def	9548073_erhzj0ShEDKaz8S8DhlDe90fDjJEIWjilIxO4_zjdGE.jpg	public	thepocketful	\N
51424d6ce4b0041cb8df9856	117715_oxR8_TwNSaCL-_gKDA2i2-1YoRfVVnbfT3M9Bfu4nxE.jpg	public	thepocketful	\N
511a7d64e4b0c6a64118260c	793192_Dtd9vMRk-pbBJscn1cb7n29zM87iJjZy6rojapRhODk.jpg	public	thepocketful	\N
50a696b4e4b04d062582a95e	32050404_qo6ZUnU5LQMoqrAR6YoH5Qz-PdUcD1d1jCheEJy7lng.jpg	public	thepocketful	\N
5245c79c498e057f7d5ff65d	117715_CEghvDHaxkALy5RxQCAVW-kyM0TAZo2-fIT4e6veJeo.jpg	public	neaexpress	\N
4e09f3fca12d09aa881a769f	NTSOFYDIBYVWGE4RYQTBBNIAQESPZ1LLW3Q4TC3TGMROSJPH.jpg	public	nautimobile	\N
5022f267011cfeafe81dab9a	7EPnN8ReXYQWoZYxzqkH9AQlOe8vFPtVP_60n65i9U4.jpg	public	nautimobile	\N
4e70e35c52b140871b6fa35f	1TB5ROKJY5NF0GAVS4YS3WZTFCUXXHTPLLBUIK4BU0XD0QA5.jpg	public	nautimobile	\N
51ccc251498e028212e9b1e3	117715_ozxp6K6iPGwKCzQDARR3BgMcisplkTt0x4LEKDJdBMk.jpg	public	nautimobile	\N
5176cceb498efe500552cc9e	21735785_zaQs-7anNinrrQlobBV2AjNxquTXs5g8ZY0NxvoxvHo.jpg	public	steaksncrepes	\N
523b2edc11d265bf373f82a0	8853695_cjpq3trk4bFpcU1oHWwj4XxwwD9ZI169sNncUyOQoM8.jpg	public	steaksncrepes	\N
50ad186ae4b0b639ca7ca234	295161_qCQYG0XjW1Ji0pSDxM7fWRzxTZRbcYyZbsbPNJo12hw.jpg	public	toastmonsternyc	\N
521649b811d2913e20a1ae87	5568483_RtMp5aDM_JtBZOI1u48Jy3om4Z672obezdu1uA_UWd0.jpg	public	toastmonsternyc	\N
518a82c9498e068718057964	25979758_bGWQQ7W2SJI4v7KmU891VcYZGitov6qbSNAnIEt8HTo.jpg	public	toastmonsternyc	\N
4e4e92c7b0fb088f3c0f14d5	HTLXSW2D30RGIEYPI0JGR22LUCS5BTXQ0LXDWAOHH4PCVHM4.jpg	public	bigdsgrub	\N
51dd9ddc498efb9a3437e123	4501533_djr9d2BEP8dg7E48xJjJTa_Yjk0Iy-MmBG6hgIQBLUs.jpg	public	bigdsgrub	\N
519fa37b498e7adf7e8ebce3	47170230_A9xVWAtkJBP-vVqUF1q2WlK8yuZTf1CVQz0JcPrHGY0.jpg	public	taimmobile	\N
4dfa4a9840a3542ff44549df	VBAJNQCBWDMP2WKDXJ5QHQ0WYF1MKHZSLUAZZJXKDBDLDUWG.jpg	public	taimmobile	\N
51cb2c41498e9851cecdd49a	5728350_vuJ4ORu0wHhd-B-f4FTNfsoIhfHgtJRMJc-QEeiYmNQ.jpg	public	taimmobile	\N
51af7257498e0c7f8979c05d	752258_nUJpoSxZ8p9BBJMG5ISetpo3DDLzycLT_gT3z9fvJmI.jpg	public	getstuffednow	\N
50ca356fe4b05b0bb93edc40	1590381_NyRIp7fXJtGoJoXp25IcMmufNufPxxvLEj3TVYXRo5g.jpg	public	getstuffednow	\N
52013fe1498e5f476bfdcf83	30611522_DHhazmY8dyNAbmijjHX7jyyfVBEiugL5-GJcTLuYjS4.jpg	public	getstuffednow	\N
523c8b2a498e959b87f8ded2	39707564_-WCsPSk2ExKeZ8q06DtUQrpt_vcWG9-AzvFoToSdQqY.jpg	public	getstuffednow	\N
51ab89bb498e83fced4cefd6	66074_8dLzCKmVRde0Uvtx_NSl9SKROFh0kat1IQgcAvU4J3M.jpg	public	delsnyc	\N
50ce2696e4b0881a7ef3ee67	263293_lcA30Y_JnQGKaaHhRqFUio2HQ8UQkphCWP9yhW4CE3g.jpg	public	domotaco	\N
5249b1c511d23e54343ae083	769710_HUiZ7dJrNbdnPYV-DTQRr1z0zgoxFx9KMC_Y-OQ6O2o.jpg	public	bobjotruck	\N
51378e9ce4b071feb46ef7cc	18792384_RSm8zhe_6kUOxy91taByfRjTDSLp7stH7PI41aJHOrU.jpg	public	bobjotruck	\N
5249b50c11d2d415e3c6b017	769710_HOnpTjl0b6qd4-yoPpg9lXZGBy-ZKikqzLlFWw2sQfs.jpg	public	bobjotruck	\N
4fe20639e4b05dcdf7f5737c	l9UdGGevddtOhDk6scQjcy1-TbVBX-wf8Gf56jBIRIg.jpg	public	bobjotruck	\N
5258d3ef11d26d03cc0563a5	117715_GQ_O1nyBbVlKTaYpRlprc8ZdIEAEftbU4_9hDGjvxsU.jpg	public	brooklynpopcorn	\N
51c8a3c5498e797153ec5629	46314126_95x6AErCZEGSi1zGZrFCY-EzgsIMyOhgO4G59l-u_Xg.jpg	public	funbunsnyc	\N
5212ec18498e9494b634a94c	814104_tUkLgiQ8zcYxovra9R8PIx7FckFhBjzNVHmirteXd58.jpg	public	funbunsnyc	\N
4ffda271e4b03bbc7f8fd13a	6Dtx8fj7IXT6M3O6ZV3rXryb6zKTAqPchjeOM2BJJAs.jpg	public	funbunsnyc	\N
505204d6e4b02dee62bd961a	dcOYoRoNNeCLMxvoyAN-o9gJObcw5FljMqYpS9cps84.jpg	public	funbunsnyc	\N
4f753600e4b07eec20023ddb	zUb4OswXiQLnF_k2xnx7AdupnEIl1nuGyIuFcmFWf8Q.jpg	public	thetreatstruck	\N
4fbfe026e4b04422a08a40f6	Han8Z4R-SQ615pLoN2lRdPfKEFa6UW2yudSOxXmJtts.jpg	public	thetreatstruck	\N
51461b9de4b0bb73a6821e97	1102787_UDt7OJpexNs8VPrehVDsp9EtfUJnMhKzJ2tTXuof06M.jpg	public	thetreatstruck	\N
4fbfebe9e4b0a3bda0340383	Brw9_z178IK92xMEXLCSSZrP0-99GXjutCp7dHCi5CQ.jpg	public	thetreatstruck	\N
51fd732d498e415eeb8b9881	8839239_mAp7_MVmWbbK42Xq3-W-1zmegy-MNx8NzB0P5Brf-Pw.jpg	public	delsnyc	\N
520e673a11d25d1282a44199	117715_KjwJnc6idBB7TuMKhGboHDg8IYjlGcr6h3I6_fJECmM.jpg	public	delsnyc	\N
5197fe76498e1c056c96d21b	117715_m462oAqyqBN12xyWCOyzYR6-1gtYrUa8BiX9r9OybE8.jpg	public	kimchitruck	\N
4e3da652d4c058f9dc087a6c	QEOIS2W35WLTHYK00QC04LKKX4X1SYW3DDI45X30HSKTJENQ.jpg	public	kimchitruck	\N
501975c5e4b092f6a51ef338	bI7RrGcK_moyn-kJICa1OCciBVuYYykwCMGlea6mcxg.jpg	public	kimchitruck	\N
4e00e61aa12db1129557e99c	WSUNYIB0YFVRCTXB13UCRCTANZUG0DO0X2FWCUYYILU4TCGB.jpg	public	kimchitruck	\N
528e451f11d2a93e4361f565	977282_wEw3nDjN0NbjC4CgQ00ON0YjdtnMocrfAjXDM4UH63Q.jpg	public	korillabbq	\N
5286645011d228bbd12f9880	1353667_2qCG26N4ikz7mbvEGkrFkcNLagGqrzRuNyeQ35CCDE8.jpg	public	korillabbq	\N
5231f54311d26e8da5827f3b	977282_AToQDrlKW5PTNbNGQcB24_BeJNsRMgZTeYmC9P-or38.jpg	public	korillabbq	\N
525b3a3711d2040fdcbd6fee	52031712_DN0C9vfm3iv1geUuFX92Pt0jwgl8NhbGokLj_o0Ebjg.jpg	public	mooshugrill	\N
529fe66b498e1fd14afe696f	68150_h0wbg6xbNwrEjXD6uaE12ZDZYF_h55LN99Es520nMBI.jpg	public	mooshugrill	\N
5267fa9611d2688bdc4587a2	2136029_bvqot1MnMJ9IGYsYJkamqTiE_lL96OcfilWMxskhdU8.jpg	public	mooshugrill	\N
5213a7c011d27a56f99dfba3	11074699_K2ka1_NxiELyTqgjvY3oMN70IUxIlADqRIAb5QpzsLM.jpg	public	mooshugrill	\N
527d2c2711d2c984e85cb11b	4179871_5FQ2eCC5ZeizUVRLh4tadgEAO1BnJjVQ7pSEvSDwIfQ.jpg	public	biandangnyc	\N
512161e0ebca7d20d6a70104	4574_ZC6mf3ha1jNXmFUDgtNsN3zIf-NHyqgxA3WkUkOl4mY.jpg	public	biandangnyc	\N
505c9776e4b0643aba1071c7	5568483_yQrtG73dbug7q06p9IASJmTFnOVgGprIZKbfHjQRcso.jpg	public	biandangnyc	\N
5106b878e4b05ec869ad8b34	814104_blIawoImaEcqf-Mg89W5A-nEHiZ5jx76BEYHVzz8dnA.jpg	public	biandangnyc	\N
519a7e33498e6e4ea6ff66f1	3354_e_1JMupbEA8VtOBVXgLHAvtJGQwcpHvY2JyFESXYSjo.jpg	public	thesteelcart	\N
5254357b498ec4662e20c654	2620660_kMXeinZ_B6lOrHRQnheIHMBr7p81ZxcUblWl0SQ1vEs.jpg	public	thesteelcart	\N
51dc0e71498e8db4f9a8106e	4456614_ZWvsB80ogvwYkoKIyVf6q5RfcDXwuKI4t0XJJhyLQ_I.jpg	public	thesteelcart	\N
4e42f5ecaeb7f6be72c39c70	JC5VO3Z50HMMMVLCCGWDQPMKF4W01VBXP1QS2LFESR55UHIX.jpg	public	fritesnmeats	\N
506f12efe4b0bb9551703ca6	2219480_LuuyF3peyimVfdQvb7tj9V-FHAEA0z1KmaSfMf9vKkU.jpg	public	fritesnmeats	\N
4f832947e4b0cd6f644ef74a	qCgaHGVJ9rFDkC5DFKEKLBBekoxb6PRDRfuWV7neue0.jpg	public	fritesnmeats	\N
513b9b7de4b04f7024bc158a	45519738_eDUGOpHYwiR5C3VUps1gQ1YDIq0Di3WMfuirGs2EVBk.jpg	public	rickshawtruck	\N
4f8dc377e4b0ca2accf75652	EKcue5yGEyaPnBymSd_HtBxWEZl4grYSOXMhw-gqpTs.jpg	public	rickshawtruck	\N
4fb6bb41e4b066430032e4ca	HHZWTU3POi_yJE4GU0zI_NjZNerm5y3MjjxddcV5ZMs.jpg	public	rickshawtruck	\N
5243206b498e78230cd0770a	54092198_eF4CEteD3zHjOCJzaYssyRXaQElB-GEOy2sqzBFQPm4.jpg	public	thegreenradish1	\N
525ee647498ef229c65969fe	10045965_ptbEO58Zn5wDz6kgitvMVjFScmxSkkuHNbK-AguCXSM.jpg	public	thegreenradish1	\N
5109aed2e4b01d2a5b69b022	117715_0jgrjk5IsUFppNAL0NtebyMYoz1JMdzrnWAIjrLMHZw.jpg	public	schnitznthings	\N
5012e555e4b0dd18ec16bd37	mZQAOCmv5lnRZ1qOUTwDXk-MLC-X-p01AfECgfLJC2I.jpg	public	schnitznthings	\N
51dc48a3498efe9483d8417a	117715_dlhUlP8z_jVejqRlWaCzsJBqg0eoP6rRSjOLpszFA0Q.jpg	public	veganlunchtruck	\N
52ade258498e293fae46e684	68150_s7DCORg1dB6IJWWdj_e_pZMg4zKZs3S_Tjkff_px7kw.jpg	public	veganlunchtruck	\N
516ef5ece4b0d1c83382c12f	117715_Gt3J4FMusC7YQjSfEup4O7bAO10z8J4gxmnd0xKnZuQ.jpg	public	veganlunchtruck	\N
51105b22e4b0a7b61fac854b	117715_vKu0po70jlTD3qN9mXsdNiE6V5Od1hmYMVlUY9xSIP8.jpg	public	veganlunchtruck	\N
526e782b11d2a15e6fb663f3	8761552_XH612BVbFNOBD2jJVEMDzyawnGF45FygNA3TtdKo6UE.jpg	public	veganlunchtruck	\N
507071bfe4b06e882e74b445	1112203_qnT5k-31-4cRKDz00cUpp7Ia7HG3YTjhsC9Udo90RDI.jpg	public	philssteaks	\N
512bbfebe4b0b8faa466c796	1425622_4wp7wCuj7Ci1dl_FVH9syKmrJwQavMhL9uqww1b0m1o.jpg	public	philssteaks	\N
527e77d111d2e66fa6a871b3	649454_HIWthX8nL3SZAOwyMlKj9Y7ju9GCiN4OEV-wZR6IKC0.jpg	public	philssteaks	\N
51645882e4b0bcb0cb0c7ef3	7511393_dEJJLGO8ljFPMA_kFidoz1wpWZ-k6mHpqYnuRwoBpRg.jpg	public	philssteaks	\N
525c259b498ea7548cf31f8e	769710_ZxOOtsSbFVklHIRhXVmTO7ops0Pm0EybRDTgUvGHrSY.jpg	public	disosnyc	\N
5197cb68498e8d409a89ec1b	1847096_oRB5R_owQW40gVWlJhNNsh9_0bEq2D8Rt3Zod9HUbUg.jpg	public	disosnyc	\N
51dc5fec498e4e9be748eac4	22801_gX0atVT6Jt_H6FPXuYAqHD4VzO5jAmS4SVid_ZLkk5U.jpg	public	disosnyc	\N
50f99bcee4b08ca132377f78	4611139_CEH3eveI6uxlRVQLet5Fpa_sNfJwAzfheMTYSBplO5Q.jpg	public	thecrepestruck	\N
4fd0f054e4b0757383b97c0f	MbR1inb3VKXu0PQMsCkHkHGftYq0E8CDbYG3BLRRGaE.jpg	public	thecrepestruck	\N
50883301e4b0904987088a20	2361939_J2zcgauqqGFC_PZPyvkfEDoSufdDe5qE7gi_NkS1P1U.jpg	public	mactruckny	\N
519bb23b498e208a0b81b7fa	9285455_LZiJ4FLH7NOWjNUsXO9jxDRFAgLygBSB8SmSIW0z9kM.jpg	public	mactruckny	\N
5165924de4b093be3bc5cd57	2159706_uFl3RYgA1z4EiDNp8PtjjG2HHWhTiiXDLNzJtFWPHS8.jpg	public	mactruckny	\N
5151c82de4b024888079c5ea	5003144_g8kbTzyfr6gL9vIRpMBbXz4TqBUk5EgkqIPlBP9DtsA.jpg	public	mactruckny	\N
5086e523e4b02ca59cae7bd4	2361939_1JvatS0wOUdQQIaTmd4Vmk8bgr7aFYOR7LaMkRio0X8.jpg	public	mausamnyc	\N
513f646ce4b0b1892aaae1bc	13285510_LmdJLKoCS9fSwm3wy96lcieTczjsLuxAEUnU3FlZDlo.jpg	public	mausamnyc	\N
51194bbae4b0cd237850b223	793192_FQUO1SFGyLkg5NRz6VUYl3_zmFgfy0Mh8gL1unO8ijM.jpg	public	mausamnyc	\N
520538a611d2b476431ac7f9	117715_GMdoseCn4baUtTX9kN6_PAAfHaGIlUpjxzAitpqLAOY.jpg	public	chefsamirtruck	\N
5294e76b11d2879d5217bd00	47558447_v1SwJZbLSZ2etlJXOF9qw4H3vErpdTiVIqXxULSVTSU.jpg	public	chefsamirtruck	\N
5189442c498e765ce62d5924	2432527_5nUa0fTfy4rzjXpiIUIlkguBa2kdqFSZIG-PLvkKu2Y.jpg	public	chefsamirtruck	\N
4fd0d80de4b062589043211f	hZjMDK5KKgxjMhmOGBtaRjx_ga0SWHwppqfLfqw20Tg.jpg	public	chefsamirtruck	\N
51f4589a498e97316d307dab	186827_ilvLMlb3AFqgXUQJ43S7IjsLNPxYP3Pw5LEjrqhp6wI.jpg	public	chipsykingny	\N
514e42c7e4b0ec8b7e400875	48992751_ibL8tx_7JPvV3aQmnEevrdibtLP0jWytaChkCdRuhG8.jpg	public	crafflesnyc	\N
514e42a8e4b0d91e975b3db9	48992751_womoOVd5bv-2KopmWjWEHA_WsyoWQITjAyXBuM4Ciz8.jpg	public	crafflesnyc	\N
51f15b4d498ee58fec420a7c	13285510_Q-SBXKFpfroSwQ-QJdezzrh1KaHfHAmLyicy8d5S1jU.jpg	public	parissandwich	\N
5243126c498ea77b19b3a444	65506790_31Qpx9E-ZjuNve-izmDY6vVxUCMrhgGsnOLn4-fusp4.jpg	public	parissandwich	\N
51b22a0a498ec00d1c45726c	390807_y2oeK6xR54wk9b1Sfm82Ek09Auv2lNkRTpJOzos3xjU.jpg	public	parissandwich	\N
4f733c44e4b039d898ce1409	PQ9G-O3CAtCW6ixkiwHhICEaRn0L3Lz1F95zKcl_GdI.jpg	public	waffletruck	\N
4fd26038e4b06145dfb72894	zUVUqzIwbwoFsRrRenEhtDmBSbK2Ry9lzqeuYnmnHG0.jpg	public	waffletruck	\N
5239ddce11d2ab4765d5cc7f	5568483_alwOH7sfGU8-pKfLmurfe9rt3pk2G6p90KwFyC6hq1A.jpg	public	sweetchilinyc	\N
5208f543498eaeeaaad3ce52	15629_P_UAUr_S-OO0R12wNp8LDPwr-ZbfPiWeG0Q0rrjW6Ww.jpg	public	sweetchilinyc	\N
50e719c2e4b0e263423e547e	15471_4uN0tddGW5orNGh02xhxbiAOGUpAAy3rIWEotoRgB_M.jpg	public	tacobite	\N
527e823311d2db75dd831ee0	22419482_1rrrm4nhOKXQsXN25ApmVsGDw4t2J3GyjhfeQPEbClU.jpg	public	waffletruck	\N
5280c18811d2e4df572063db	5354893_5EtQmcwzMnTRFz9qbxjkt9FguCAC4xfW5xwUCyYIrbQ.jpg	public	waffletruck	\N
51f2be1f498e71235db5b61b	117715_mGfGU0UGjUMhgqgwrDPf2f44NZtfMrobqJMF8ahsrjY.jpg	public	sweetchilinyc	\N
\.


--
-- Data for Name: trucks; Type: TABLE DATA; Schema: public; Owner: pepp
--

COPY trucks (id, name, twitname, weburl, tweet, street, location, retweeted, region, regex, lasttweet, lastupdate, type, about, foursquare, matcher) FROM stdin;
sweetery	Sweetery	sweeterynyc	http://sweeterynyc.com	Most don't care for Monday's, but we do, mostly because it connects Sweetery back w/all of u! Hudson/King till the cows come home, or till3p	none	 Hudson / King 	f	none	\N	1393445293	1393251269	Sweets		4a28d919f964a52056951fe3	\N
eddiespizza	Eddie's Pizza	eddiespizzany	http://www.eddiespizzany.com/	WE are parked today on old slip and front street in the financial district. Come grab a pie! Try one of our 25... http://t.co/4GpRejcbCb	old slip	 old slip and front str	f	none	\N	1393261896	1392906526	Pizza		4c0cf412b4c6d13ae4850c30	\N
snowday	Snowday	snowdaytruck	http://snowdayfoodtruck.com/	\N	\N	\N	\N	\N	\N	1392337153	\N	Comfort	\N		\N
shortys	Shortys	shortysnyc	http://www.shortysnyc.com	RT @JeDiKiD117: @shortysnyc Trucks back in DUMBO. Jay & Water St. cheesesteakforlunch dumbonyc shortysnyc cheesefries get there 4 me ...	Jay & Water	 Jay & Water St  	t	bkl	\N	1393432757	1393432757	American		4faea2cce4b08a88c5dc5d05	\N
hh3	Habachi Heaven 3	hibachiheaven	http://www.hibachiheaven.com/	@midtownlunch HH3 is on 46st bet 5&6 Ave @downtownlunch HH2 is in FIDI on Broad & Water. Word of the day is Snow for ur free upgrade	46	 46st bet 5 & 6 	f	up	\N	1393426718	1393426718	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	hh3
elpaso	El Paso Truck	elpasotruck	http://elpasony.com/	\N	\N	\N	\N	\N	\N	1390251431	\N	Mexican	\N	523c911f04937624937304c5	\N
yougotsmoked	You Got Smoked	yougotsmoked	http://yougotsmoked.com/	\N	\N	\N	\N	\N	\N	1391042241	\N	BBQ Mexican	\N	52b1d83a498e60c55497bea0	\N
deliheaven	Deli Heaven	deliheaventruck		@downtownlunch correction we are on king&varick today. The word of the day is amore for ur free upgrade. SoHo get ur deliheaven on	varick	 king & varick   	f	none	\N	1392220340	1392220340	Deli	\N		
mamak	Mamak	lovemamak	http://www.lovemamak.com/	We are at 7 Hanover square, will stay until sold out, quick !!	Hanover	Hanover square	f	none	\N	1393270733	1392914561	Asian		51c4cffa498ec876f564a0b4	\N
lobstertruck	Red Hook Lobster	lobstertruckny	http://redhooklobster.com/	Don't let a couple of snow flakes keep you from your lobster fix! Come visit Big Red at 50th&6th Ave for a lobster roll. RedHookLobsterRoll	50	 50th & 6th Ave 	f	up	\N	1393445419	1393426523	\N		4dc597c57d8b14fb462ed076	\N
mikenwillie	Mike n Willie's	mikenwillies	http://www.mikenwillies.com	Hello midtown Time to come out of hibernation and enjoy this heatwave 56th St. & Broadway comegetsome	56	 56th St  & Broad	f	up	\N	1392998300	1392912097	TexMex		4f205f0ee4b0294b35a1178b	\N
goburger	GO Burger	goburger	http://www.goburger.com	We're on 88th and Broadway for dinner tonight!	88	 88th and Broad	f	up	\N	1391810155	1389390276	American		4c06b3eccf8c76b0a4eb3a65	\N
mexicue	Mexicue	mexicue	http://mexicueny.com	Water and broad...warm and beautiful.	Water and broad	Water and broad    and 	f	none	\N	1393447618	1392910859	Mexican		4c51a6a71c67ef3ba6b61ab9	\N
lagringa	La Gringa	lagringatruck	http://gringataqueria.com/welcome/	La gringas is at 51st and park ave come get your tasty hot burritos!!	51	 51st and park ave 	f	up	\N	1391618320	1391618320	Mexican	\N		
hh2	Habachi Heaven 2	hibachiheaven	http://www.hibachiheaven.com/	@midtownlunch HH3 is on 46st bet 5&6 Ave @downtownlunch HH2 is in FIDI on Broad & Water. Word of the day is Snow for ur free upgrade	46	 46st bet 5 & 6 	f	up	\N	1393426718	1393426718	Jabanese BBQ	\N	4fda0cd2e4b0318de7d3c85d	hh2
mamuthai	Mamu Thai Noodle	mamuthainoodle	https://www.facebook.com/MamuThaiNoodle	Sorry WFC north, our truck will not be there today. Hope to see you next week! Stay warm.	WFC	WFC	f	none	\N	1393452822	1393435015	Thai		5126a10ae4b0af674c85f353	\N
phils0	Phil's Steaks Big Jawn	philssteaks	http://www.philssteaks.com/	It's Phil's Phriday! \nOG Jawn: 51st n Park\nBig Jawn: 41st btw 6th n 7th\nGet Your Phil!	41	 41st btw 6th n 7th 	f	up	big( jawn)?( in|:| ?-| is on| on) (.*?)(\\n|$|!|\\.)	1393456673	1387554094	American		4f15b382e4b0725660ea9f31	\N
burgersn	Trusty Burgers & Bites	burgersandbites	http://www.burgersandbites.com/	West 29th & 11th for a quick breakfast and the lunch we have all grown to love! 6am-2pm let's grow this neighborhood together!	29	 29th & 11th 	f	mid	\N	1393004953	1392895105	American		5170143a498e802b42628e48	\N
polish	Old Traditional Polish Cuisine	polishcuisine	https://www.facebook.com/pages/Old-Traditional-Polish-Cuisine/315496671902708	open now until 2:20 on 47th b/w park & lex - special veggie combo's and poppyseed cake await you! @nycfoodtruck @midtownlunch	47	 47th b / w park & lex 	f	up	\N	1393445020	1393431195	Polish		51435df4e4b0823a398ebc8a	\N
schnitzelcart	Schnitzel & Things Cart	schnitznthings	http://schnitzelandthings.com	Hi guys, unfortunately the truck is having mechanical issues and won't be out today. The cart is on 27th & Park from 11:00-2pm. Hope 2 c u!	27	 27th & Park 	f	mid	\N	1393428048	1393428048	German	\N	4a6640b3f964a5204cc81fe3	(schnitzcart|the cart)
carls	Carl's Steaks	carlssteaks	http://carlssteaks.com/home/	Hello all, snow What snow? Still serving up our famous piping hot cheesesteaks 49th st bet 6th & 7th ave11-3 @SiriusXMNFL @SIRIUS @Barclays	49	 49th st bet 6th & 7th 	f	up	\N	1393426994	1393426994	American		51a78330498e3fc1f22d771e	\N
palenque	Palenque	palenquefood	http://www.palenquehomemadecolombianfood.com	LUNCH TIME Dumbo Come join your favorite food truck on Jay str & Water str. Yes we are back. Try Our Yummy Ajiaco Soup Of The Day. C U HERE	Jay str & Water	 Jay str & Water str  	f	bkl	\N	1393429438	1393000714	Colombian Fusion		4e84f424dab45bbd2617dc62	\N
gorilla1	Gorilla Cheese 1	gcnyc1	http://www.gorillacheesenyc.com/	Enuf with the snow, ComeToTheCheeseYo\nG1 - 36th 6/Broadway\nG1 - 26th 11/12th \nstarrettlehigh\nSteak & Potatoe Melt w/swiss, onions, gravey	36	 36th 6 / Broad	f	up	g1(.*?)(\\n|g2)	1393426823	1393426823	American		4dc2d3e352b1c1fb37f1e945	\N
gorilla2	Gorilla Cheese 2	gcnyc1	http://t.co/4ZDqfwSH5f	G1- Varick & Charlton\nG2- 60/5\nCome get cheesey goodness\nComeToTheCheeseYo	60	 60 / 5 	f	up	g2(.*?)(\\n|$|#)	1393426823	1393344218	American		4dc2d3e352b1c1fb37f1e945	\N
pocketful	The Pocketful	thepocketful	http://thepocketful.com/	Located on 53rd, between PARK & MADISON	53	 53rd  between PARK & MAD	f	up	\N	1393428316	1393428316	Mediterranean		4db8bcd790a0e3f61d601888	\N
seoul	Seoul Food	seoulfoodnyc	http://www.seoulfoodnyc.com	Come to 51st street, between Park and Madison - it's lunch time!!	51	 51st street  between Park and Mad	f	up	\N	1392220033	1392220033	Asian		4e74afad88775d593d9a7eb5	\N
domo	Domo Taco	domotaco	http://www.domotaco.com	Catch us in the DUMBOlot on Jay & Water today! realfood madefromscratch aintnohalfsteppin	DUMBO	DUMBOlot	f	bkl	\N	1393429411	1393429411	Asian Fusion		4ed90a2e77c8274efb746d83	\N
grillwheels	Grill On Wheels	grillonwheelsny	#	Grill on Wheels is in Midtown! Parked on 47th off Park Ave today! schnitzel crazy chickenfalafel	47	 47th off Park Ave 	f	up	\N	1393429269	1393343353	Kosher		51b0bf31498e9b68db75612c	\N
funbuns	Fun Buns	funbunsnyc	http://j24f.com/funbuns/	RT @FoodtoEat: Today's answer to 12DaysofFoodTrucks is @funbunsnyc ! Thx to all those who played and tune in Monday 12/23 for the LAST day!	12	 12 / 23 	t	mid	\N	1391455990	1387576969	Asian		4f8d9663e4b021137aa2bdde	\N
steaksncrepes	Steaks N Crepes	steaksncrepes	http://steaksncrepes.com	50 st bet 6 & 7 ave for lunch till 03:30. come for the best old style cheesesteaks in nyc. combo w/ fries & drink $10 only. midtown lunch	50	50 st bet 6 & 7 ave for lu	f	up	\N	1374766188	1374766188	American		50f44167e4b0af5bf46321ce	\N
freshhearty	Fresh and Hearty	freshandhearty	http://freshandheartynyc.com/	Get your Soup & Panini on with Fresh and Hearty! We parked on 46st btw 5th & 6th ave from 11am to 3pm. Call now 4 free delivery! @3474402467	46	 46st btw 5th & 6th 	f	up	\N	1393432849	1390493878	Soup/Salad/Sandwich		51801f7a90e7374e46b6239f	\N
toastmonster	Toast Monster	toastmonsternyc	http://www.toastmonsternyc.com/	Hello Rice bowl fans. Have your beef or chicken teriyaki rice bowl with a miso soup for only $8!! stopplaying notplaying forreal 50th/6th	50	 50th / 6th	f	up	\N	1392618609	1386864511	American		50ad1829e4b087613d696bc4	\N
itizy	Itizy Ice Cream	itizyicecream	http://www.itizy.com/	Likely our last three hours at Columbia this year! Come grab a scoop of your favorite flavor before it runs out!	none	Columbia	f	none	\N	1382307419	1382122482	Sweets		4fcbdcaae4b00a0e855124dd	\N
cinnamonsnail	The Cinnamon Snail	veganlunchtruck	http://www.cinnamonsnail.com/	Offering 4 courses of vegan valentines bliss next week in NJ @SeedtoSproutNJ call em before 2/13 to reserve a spot! http://t.co/FJwqMjwIPX	13	 4 courses of vegan valentines bliss next week in NJ @SeedtoSprNJ call em before 2 / 13 	f	mid	\N	1393454942	1391800828	Vegan		4c263af6a852c9287537e66c	\N
mrnice	Mr Nice Guy	mrniceguytruck	http://mrniceguynyc.com	SliderWingNation. by @dyckmanbar "Super Bowl live at DB SUN 2/2 mrniceguytruck on site for those... http://t.co/AaLfKazsyG	none	 2 / 2 	f	none	\N	1393435854	1390242002	American		520bbbb211d26afae232ec59	\N
wingit	Wing'n It	wingnitnyc	http://www.wingnitnyc.com/	Out here on 23rd and 5th come and grab some wings for lunch today. We will be open from 10am to 3pm. See you guys at lunch.	23	 23rd and 5th 	f	mid	\N	1390923947	1387549355	American		519ffd2b498ededbeef3c073	\N
neapolitan	Neapolitan Express	neaexpress	http://neapolitanexpress.com/	ANNOUNCING: Our first brick and mortar location in Trumps 40 Wall Street! @PMQpizzamag http://t.co/BbF7xyHaqE pizza neaexpress wallstreet	Wall	Wall St	f	none	\N	1393437984	1393362126	Pizza		51c8864c498e0ac96c14433e	\N
bobjo	BobJo	bobjotruck	http://www.bobjo.net	Good morning New York! We are stay at Broadway and 55th st between 56th st. Try our ramen noodle soup and rice platter. Thanks!!	55	 Broadway and 55th st between 56th 	f	up	\N	1393430784	1393430691	\N		4e3add0c88772c3bf12772da	\N
morris	Morris Grilled Cheese	morristruck	http://morrisgrilledcheese.com/	Hey @DumboNYC @DUMBOFoodTrucks we won't let this winter weather get us down. Come to Adams near Front st for soul warming goodness! EAT	DUMBO	DUMBOFoodTrucks	f	bkl	\N	1393428817	1393428817	American		4e0e0b3caeb7a5b33ee5dac1	\N
toum	Toum NYC	toumnyc	https://www.facebook.com/ToumNYC	We made it to MidtownEast despite the snowy weather. Join us on 47th btwn Park & Lexington Ave for Healthy Yummy LebaneseLunch	47	 47th btwn Park & Lex	f	up	\N	1393426321	1393426321	Lebanese		500eedb0e4b062ee00577957	\N
brooklynpopcorn	Brooklyn Popcorn	brooklynpopcorn	http://brooklynpopcorn.com/	Hello 55th & 6 Avenue! We brought you our newiest flavor Coconut Kettle Corn popcorn plus all our other amazing flavors. See you soon !!	55	 55th & 6 Aven	f	up	\N	1393202408	1393006318	Popcorn!		514a0737e4b09c3e77279d83	\N
lukeslobster	Luke's Lobster	nautimobile	http://lukeslobster.com/	We will be at a special event at the @RoyalPalmsClub tomorrow, but back to 23rd and Park on Thursday!	23	 23rd and Park 	f	mid	\N	1393345435	1393345435	Seafood		4dc81239b0fb5556cd2f3023	\N
milktruck	Milk Truck	milktrucknyc	http://www.milktrucknyc.com	Bessie's at 58th & Mad, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always at @houstonhallnyc	58	 58th & Mad  	f	up	\N	1393445959	1393425031	American		4e823c0229c2dbb2b7043972	\N
treats	The Treats Truck	thetreatstruck	http://www.treatstruck.com	!!!Sunday, Feb 23rd, no truck today! Our shop open 8am-6pm w/food & treats!!!	23	 23rd  no truck ! Our shop open 8	f	mid	\N	1393331825	1393162778	Sweets		49e65021f964a52035641fe3	\N
carpedonut	Carpe Donut	carpedonutnyc	http://carpedonutnyc.com/	51st and Park, We're open!	51	51st and Park  	f	up	\N	1393243846	1393243846	Sweets	They only server one kind of donut here, the apple cider, but it's a pretty good one. They are fresh and still hot when you get them. They have donut ice cream sandwiches but you should know the entire thing is in the freezer so you will get a frozen donut as well.	5169892c498e0522481eea97	\N
valduccis	Valduccis	valduccis	http://valduccis.com	RT @LaBellaTorte: Fat Tuesday is March 4. Don't forget to order your Kings cake call us at 347-435-4570 or respond in the comments section	none	 4  Don't forget to order your Kings cake call us at 3  570 	t	none	\N	1393435612	1393364114	Pizza		4df7e1aad4c02ad734170b21	\N
blend	Blend	blend_express	http://blen02.wix.com/blendnyc	We will not be parking on HUDSON and KING anymore ....   Hopefully only at least for this year	none	 parking on HUDSON and KING an	f	none	\N	1383317024	1383316855	Latin Fusion		4fa94528e4b0f8fbf13317e6	\N
bigds	Big D's	bigdsgrub	http://bigdsgrub.com/	Sun's out! Let's Grub at Broadway and 56th Street, now till' 2:30pm. Preorders call 646-543-BIGD	56	Broadway & 56th Street 	f	up	\N	1393447488	1393432039	Korean Fusion		4c968b907605199c2eaec2a3	\N
phils3	Phil's Steaks	philssteaks	http://www.philssteaks.com	Nice little whiz Wednesday sell out pholks. Shutting it down at NYU. See you tomorrow at 52nd and 6th for breakfast and lunch til 2!	52	 52nd and 6th 	f	up		1393456673	1393456673	American		4f15b382e4b0725660ea9f31	\N
mexicoblvd	Mexico Blvd.	mexicoblvd	http://mexicoblvd.com	RT @DispatchNY: . @BrookfieldPLNY NORTH Lot | Wednesday, 2/26 | 11a-3pm | North End Ave. & Vesey | @MexicoBlvd nycfoodtruck lunchtime	brookfieldplny	brookfieldplny	t	none	\N	1393432133	1393432133	Mexican		4f4e55aee4b04c96fba5b149	\N
nuchas	Nuchas	nuchasnyc	http://www.nuchas.com	The NUCHAS truck is located on 50th street & 6 ave! Midtown @radiocity! http://t.co/Q5uIlAl9a1	50	 50th street & 6 ave	f	up	\N	1393444828	1393424670	Mexican		4ebd2a9bb8f7b504a754c130	\N
taim	Taim Mobile	taimmobile	http://www.taimmobile.com/	Butternut Squash is the soup du...how do you say last soup of the season? Get yours now on Varick/Vandam	Varick	 Varick / Vandam	f	none	\N	1393428251	1387556931	Mediterranean		4cf2c5321d18a143951b5cec	\N
getstuffed	Momos & Buns	getstuffednow	http://www.chinesemirch.com	snowdayNYC we will freeze our buns 2 bring u the buns u love @BKBazaar ! Its a date at 7pm!	none	 2 bring u the buns u love @BKBazaar ! Its a date at 7	f	none	\N	1393431246	1388785130	Chinese Fusion		4fa016cbe4b05d0fc11262c5	\N
dels	Del's	delsnyc	http://instagram.com/delsnyc	RT @DUMBOFoodTrucks: You may have seen the @delsnyc truck around DUMBO this summer - help them raise $ for another one on @kickstarter! htt...	DUMBO	Dumbo	t	bkl	\N	1384186749	1383928941	Sweets		519bb56b498ed2dfa950ace2	\N
korilla	Korilla BBQ	korillabbq	http://korillabbq.com	DUMBO! We ready for ya @Water & Jay!	Water & Jay	@Water & Jay	f	bkl	\N	1393446067	1393432541	Korean Fusion		4cc701aa01fb236ab070baba	\N
mooshu	Moo Shu	mooshugrill	http://www.mooshugrill.com	It's coooold out here on the streets but we're here for you midtown! catch us on 49th & 6th ave slinging NYC's finest mooshu!	49	 49th & 6th ave 	f	up	\N	1393428723	1393338350	Chinese	Moo Shu grill is a slight twist on typical Chinese <a href="https://en.wikipedia.org/wiki/Moo_shu" target="_blank">moo shu</a> The three Moo Shus option is enough for lunch and you can pick and choose a different protein for each. In my opinion the chicken is the best but it is dark meat. </p><p>It's easy to order as there is one window for ordering and for picking up when your name is called.	52090e45498e5500a6bd41fb	\N
biandang	Bian Dang	biandangnyc	http://www.biandangnyc.com/	Baby it's cold outside... which makes it a perfect day to try our preorder system at http://t.co/PaquryCPau! Pickup at 53rd & Park	53	 53rd & Park	f	up	\N	1393429759	1393429759	Taiwanese		4d712874722ef04d04160d9c	\N
miamifood	Miami Food Machine	miamimachinenyc	http://www.miamifoodmachinenyc.com/	RT @YouGotSmoked: Park Ave btw 33rd St and 32nd St from 11:00 to 3:00 today! New York Aged Cheddar Mac and Cheese! Delicious nyc http://t...	33	 Park Ave btw 33rd St and 32nd 	t	mid	\N	1389964561	1389964561	Mexican		514b53aee4b00c3e98ec25e9	\N
steelcart	The Steel Cart	thesteelcart	http://www.thesteelcart.com/	Somewhere in the flurries on 47th St between Park & Madison. - Soups are Creamy Corn Chowder / Vegetable Minestrone / Yellow Split Pea & Ham	47	 47th St between Park & Mad	f	up	\N	1393439811	1393424761	French		511d3abee4b0e188895f3697	\N
frites	Frites 'N Meats	fritesnmeats	http://www.fritesnmeats.com/	Hello soho, lunch. 2day @ Hudson & king. Burger of the week THE GUACAMOLE BLAST. Preorder 9172929226	none	 Hudson & king  	f	none	\N	1393427246	1393427246	American	This is a good burger but this truck is interesting because of the many toppings they carry and their burger of the week. 	4ae9d217f964a520bcb621e3	\N
rickshaw	Rickshaw Truck	rickshawtruck	http://www.rickshawdumplings.com/	Starrett! You are in luck! Danny is on his way to make your dumpling day! 26+11av	26	 26 + 11av	f	mid	\N	1386710979	1384441694	Asian		43fc8419f964a520ed2f1fe3	\N
greenradish	The Green Radish	thegreenradish1	http://www.thegreenradish.com/	RT @nycfoodtruck: Who says this weather & food trucks don't mix? Catch 30, incl. @thegreenradish1, at the winterblast 1/30-2/1! http://t.c...	none	 30  incl  @thegreenradish1  at the winterblast 1/ /1	t	none	\N	1393457149	1390853812	Vegan		5229feab11d2edde794d385c	\N
schnitzel	Schnitzel & Things	schnitznthings	http://schnitzelandthings.com	Hi guys, unfortunately the truck is having mechanical issues and won't be out today. The cart is on 27th & Park from 11:00-2pm. Hope 2 c u!	27	 27th & Park 	f	mid		1393428048	1393428048	German		4a6640b3f964a5204cc81fe3	(schnitztruck|the truck)
kimchitaco	Kimchi Taco	kimchitruck	http://kimchitacotruck.com/	Tell us this is the last snow of the season. 55th St. bet. 6th & 7th Ave. 11:30am - 2:30pm	55	 55th St  bet  6th & 7th Ave  11	f	up	\N	1393433644	1393425636	Korean Fusion		4d6ee122b45b59417c6a6778	\N
mausam	Mausam	mausamnyc	http://www.mausamnyc.com	Yes!!get yr fresh CURRY N BITES 52nd & 6th Ave. Our vindaloo spicy flavor is ideal for today.	52	 52nd & 6th Ave  	f	up	\N	1393431071	1393431071	Indian		50730eebe4b0f3224431dc5d	\N
shanghai	Shanghai Sogo	shanghaisogo	http://www.shanghaisogo.com/	Just arrived CU. dinner at Amsterdam ave & 116th st til 8pm. Sogo for it!! &gt;&gt;CU &lt;&lt;.....	116	 Amsterdam ave & 116th st 	f	up	\N	1393446193	1393446193	Asian		5258369d498e13def2bef2cb	\N
chefsamir	Comme Ci, Comme Ca	chefsamirtruck	http://www.chefsamirtruck.com	We are on 52st and park av!!	52	 52st and park av	f	up	\N	1393432073	1393432073	Moroccan		4c3c85e3a9509c74b52e395b	\N
phils1	Phil's Steaks Lil Jawn	philssteaks	http://www.philssteaks.com	2 jawns out today!\\n\\nBig Jawn - 41st btw 6th n B'Way til 2. \\n\\nLil Jawn - North End Ave n Vesey St til 2.	Vesey	 North End Ave n Vesey St 	f	none	lil jawn( in|:| -) (.*?)(\\n|$)	1393456673	1383670328	American		4f15b382e4b0725660ea9f31	\N
disos	DiSO's	disosnyc	http://www.disosnyc.com/	Open for lunch, 48th bet 6 and 7 ave\n\nCall it in: 917-756-4145	48	 48th bet 6 and 7 	f	up	\N	1393433050	1393345639	Italian Sandwiches	These might be typical italian sandwiches but the ingredients are high quality. You need to get there early because the line can get long and they will run out of some breads. I believe the focaccia half is a normal portion for lunch while their half and hero sizes are pretty big.	519523d6498eeaa6200aad03	\N
crepestruck	Crepes Truck	thecrepestruck	https://www.facebook.com/thecrepestruck	VictoriaJustice at Uggs Aulstralia on Madison Ave & 58 Street tonight from 6:30pm-8pm	58	 Madison Ave & 58 Str	f	up	\N	1391084755	1383866974	Crepes		4dfb854918386e743d9869e3	\N
mactruck	MacTruck	mactruckny	http://MacTruckNYC.com	Good morning WFC!!! North End Ave today for lunch!!! Come get sommmmee!!!	WFC	WFC	f	none	\N	1393256708	1393256708	American	Looking to take a nap after lunch? This truck is great and the owner is incredibly friendly. Feel free to chat it up while you watch him prepare your food.  Not listed on the menu are the many condiments\\n you can get on your macaroni. The regular size is a good portion for a normal lunch.	50575ab8e4b04ed4f2197dac	\N
wafelKastaar	Wafels & Dinges Kastaar	waffletruck	http://www.wafelsanddinges.com/	Momma Truck @ Trinity School 91st & Columbus Ave all day! \nKastaar @ NYU Stern at W 4th & Greene till 10p	none	 4th & Greene 	f	none	kastaar( truck)? (.*?)(all day|till?|until|\\n)	1393456216	1393342518	Belgian		4a416369f964a52036a51fe3	\N
chipsy	Chipsy King	chipsykingny	http://chipsykingny.com/	Kasar truck is at Wall Street and Williams street all day until 6 pm\nHappy Wednesday!!!	Wall	 Wall Street and William	f	none	\N	1393340974	1393340974	Fries		51bb5c43498ee06e13d0d31f	\N
craffels	Craffles	crafflesnyc	http://www.craffles.com/	Happy holidays!!!\nMake ur holidays sweet with our delicious crepe or waffles. Our location for today. Hunter college and union square.	none	union sq	f	none	\N	1391926650	1388428190	Crepes		514e426ce4b05bcb261d910e	\N
paris	Paris Sandwich	parissandwich	http://www.parissandwiches.com/	Dumbo! Adams and front street today dumbofoodtrucks @DUMBOFoodTrucks	none	 Adams and front str	f	none	\N	1393255423	1382711724	French/Vietnamese		519e4ed0498e4f27e64c177a	\N
wafelMomma	Wafels & Dinges Momma	waffletruck	http://www.wafelsanddinges.com/	Momma Truck @ 60 Wall St till 4p	Wall	60 Wall	f	none	momma( truck)? (.*?)(all day|till?|until|\\n|!)	1393456216	1393426127	Belgian		4a416369f964a52036a51fe3	
sweetchili	Sweet Chili	sweetchilinyc	http://sweetchilinyc.com/	RT @DispatchNY: . @BrookfieldPLNY SOUTH Lot | Wednesday, 2/26 | Open until 3pm | South End Ave. & Liberty St. | @SweetChiliNYC nycfoodtruc...	brookfieldplny	brookfieldplny	t	none	\N	1393447739	1393438128	Asian		51a8c802498e2165ca855a19	\N
tacobite	Taco Bite	tacobite	http://www.tacobite.com/	Today Serving Lunch on\n47th st\nBet Park/Lexington Av. \nCall in advance for\npick-up\n@ 347-70T-Bite	47	 47th st Bet Park / Lex	f	up	\N	1392397897	1389801699	Mexican		503ba49ae4b0fad35eb7a8dc	\N
\.


--
-- Data for Name: tweets; Type: TABLE DATA; Schema: public; Owner: pepp
--

COPY tweets (contents, "time", id, retweeted, twitname) FROM stdin;
Looking 4 a new approach to 1to1 marketing? ROI is important, but ROR, Return on Relashionship is more so. Talk 1 us abt our mobile approach	1393007585	436931596772712450	f	sweeterynyc
We have it on good authority that today is Sticky Buns Day, to which we say hip hip hooray, for one of our favorite days!	1392994377	436876201530253313	f	sweeterynyc
Not the nicest of days, but as always Sweetery will bring sunshine when and where it's need most, Hudson/King St. we're here for you!	1392990355	436859329082556416	f	sweeterynyc
RT @FreshpetTruck: Hey @SweeteryNYC, were looking forward to seeing you in Tribeca today!	1392912838	436534202138255360	f	sweeterynyc
Hudson/King St Life is grand when u extend ur hand 2the man in our big blue van who will pass u anything but bland, step rt up &amp;join theband	1392906416	436507265861165056	f	sweeterynyc
Good morning Hudson/King St. shaping up to be an awesome day, we hope to share that with you.	1392816252	436129089057861633	f	sweeterynyc
Happy Presidents Day 2 all, especially all that r off 2day. Sweetery is off as well, but is looking 2get back in the swing of things 2morrow	1392645745	435413929825542144	f	sweeterynyc
Disappointing news out of Sweetery headquarters, our main truck Chopper wont be out to play today, we're sad and blue as we know you are too	1392385323	434321640801837056	f	sweeterynyc
Happy Valentine's Day to all!	1392385201	434321130845773824	f	sweeterynyc
Snow way were out today, tomorrow we'll come out to play for a little Valentines Day roll in the snowy hay.	1392299973	433963658251493377	f	sweeterynyc
Need a mid-winter pick me up, u can find just that on Hudson/King St in the form of a big blue truck w/lots of words on it, YUM says it all!	1392212429	433596472072757248	f	sweeterynyc
RT @nystfood: On Monday (2/17) @nystfood 2.0 will be returning for all your street food needs. Spread the word!	1392145012	433313705200459776	f	sweeterynyc
RT @Valduccis: Congrats to @sweetchilinyc for being named best new foodtrucks in NYC check out results !!!!! http://t.co/7dWpsiGf44	1392143747	433308401087819777	f	sweeterynyc
Good morning Hudson/King St. Sweetery is here, are you. If you're not, you are missing out on pure heaven, come grab deliciousness on the go	1392129132	433247099556098048	f	sweeterynyc
RT @CherryRed23: Round#2 trying the lemon loaf from @SweeteryNYC super yummy! #foodie #lemonloaf http://t.co/8oCPhXUUWJ	1392128928	433246242538143745	f	sweeterynyc
Good morning Hudson/King St. Happy Mon. to u. Just to let u know, Sweetery is in the same old same old waiting to serve you! Have a grt day	1392040184	432874024633253890	f	sweeterynyc
Again it proves that @wafeltruck 1 of the biggest hypocrites &amp; the one who speaks of proper food trk etiquette does not follow his own creed	1391781668	431789728812126208	f	sweeterynyc
Not certain y @wafeltruck would park on the same St. as us, especially since we have parked there for 4 yrs, u would think they know better?	1391781058	431787173008777216	f	sweeterynyc
Hudson/King St.Happy Friday! Sweetery is in place 2 severe u deliciousness, we've even brought the sunshine w/us, all 4 ur culinary pleasure	1391780894	431786481640681472	f	sweeterynyc
No joy in Mudville today, sad to learn of Ralph Kiner's passing, grew up listening to Ralph, Lindsey Nelson, &amp; Bob Murphy, the end of an era	1391720859	431534680060346368	f	sweeterynyc
WE are parked today on old slip and front street in the financial district. Come grab a pie! Try one of our 25... http://t.co/4GpRejcbCb	1392906526	436507724772564992	f	eddiespizzany
Lunch is being served today on 46th and 6th. Call ahead your order to 917.439.7522	1392821733	436152077774249985	f	eddiespizzany
RT @nystfood: Next week @nystfood will be back with news and reviews.  Please RT	1392425873	434491719522852864	f	eddiespizzany
Happy Valentines Day on Varick and King for lunch! http://t.co/2rasVKl2Sr	1392399529	434381224786657280	f	eddiespizzany
Sorry to say, but we are closed today! Happy SNOW DAY!	1392303498	433978443730927616	f	eddiespizzany
Lunch today on 46th btwn 5th/6th. Come try at 270 10 inch bar pie, with one topping, a side and a drink for $10!	1392225609	433651753930616832	f	eddiespizzany
We will be off the streets today for maintenance and back on the road tomorow.	1392126012	433234012828884993	f	eddiespizzany
Lunch is being served today on 26th and 12th. call ahead your order to 917-439-7522	1392049665	432913789974224896	f	eddiespizzany
RT @leslie_cottle: I will be eating a lot more @EddiesPizzaNY with only 270 cals for a whole pizza. #CelebrateWithABite or the whole thing!	1391808151	431900809031614464	f	eddiespizzany
Come on over to Varick and King for a deliciously cost efficient lunch. Lunch special is a 1 topping... http://t.co/AgetvmZDKQ	1391786353	431809381865254912	f	eddiespizzany
Come on over to Varick and King today for a delicious cost efficient lunch.Lunch special is a 1 topping... http://t.co/A9w9BaIiVa	1391786170	431808612906713088	f	eddiespizzany
Old Slip and Front today for lunch.Stop by and try our Pumpkin Spice Bisque	1391705600	431470678437396480	f	eddiespizzany
@starrett601 we will be serving lunch today on 26th and 12th. Call ahead your order to 9174397522	1391438964	430352324041908224	f	eddiespizzany
Varick and king today until 3pm	1391179419	429263715998126080	f	eddiespizzany
@katttastic closed today but back on 46th tomorrow	1390940734	428262597780316160	f	eddiespizzany
Found a spot on varick and king. Call ahead 917 439 7522	1390587105	426779368846024704	f	eddiespizzany
Got kicked out of Hudson and king. We wish we could stay. Sorry!	1390586480	426776749079162880	f	eddiespizzany
Hudson and king until 3 today. Call ahead your order 917 439 7522	1390584533	426768580735021056	f	eddiespizzany
Happy Thursday. Old slip and water for lunch. Call ahead your order 917 439 7522	1390498384	426407247842115584	f	eddiespizzany
@jakelipman we do not.	1390414360	426054822748782592	f	eddiespizzany
RT @csiSL: Edible's cover is being chosen by a vote and @csisl's Jordyn Lexton of @DriveChange is one of the choices (#11). http://t.co/Wpz...	1392337153	434119600994021376	f	snowdaytruck
SNOW ART - poems sleep in the snow (courtesy of Shelly Jackson) \n#snowdaycreative #snowdayartsandcrafts http://t.co/IfV1J4TKMq	1392322303	434057316191592448	f	snowdaytruck
Got second on this #snowday? Vote for #11 to be the COVER of @EdibleManhattan - that's the @DriveChangeNYC Founder!\n\nhttp://t.co/STQ9yPTC9D	1392317508	434037203652448256	f	snowdaytruck
Snow = story. Shelly Jackson knows there's nothing better than a #snowday #Writeasnowday http://t.co/nylmIFD4vt\nhttp://t.co/6g2oL2f4eS	1392317275	434036226975203329	f	snowdaytruck
RT @DriveChangeNYC: Spinning more than our @SnowDayTruck's wheels at @SITUSTUDIO in the BK Navy Yard. Thanks DJ Jess! #justtrucks http://t....	1392004849	432725818461401088	f	snowdaytruck
RT today &amp; your first sugar on snow is FREE: We're looking for private property for @SnowDayTruck to vend - Do you own a lot/space in NYC?	1391890582	432246549389660160	f	snowdaytruck
Our friends @SWTgeneration are gonna make maple-inspired cupcakes like these for the truck! Come get em! #GOODfood http://t.co/5zXGGmIk8T	1391889249	432240957686173697	f	snowdaytruck
.@CRPRestaurant Thank you for the support! We will DM you, we'd love to find ways to collaborate. #collectiveimpact #justtrucks	1391888732	432238787813326848	f	snowdaytruck
Thanks for the RT @ManhattanEats - see you soon! Can't wait to share a meal with you!	1391888669	432238525430259712	f	snowdaytruck
The masters that created @SnowDayTruck Mike from @SITUSTUDIO &amp; Ernie from @ShanghaiMKS - together we BUILD greatness. http://t.co/lOe8N7KtTh	1391888260	432236806407340033	f	snowdaytruck
RT @EdibleManhattan: @drivechangenyc is NYC's first food truck for social justice. Read about the initiative here! @CCabellMorris http://t....	1391882855	432214137859739648	f	snowdaytruck
A big time thank you to the folks @GrowNYC @NYCGreenmarkets we cannot wait to work with you! #mapletrending #local #collectiveimpact	1391817139	431938506047238145	f	snowdaytruck
Looks like @Brownstoner has picked up the @EdibleManhattan story. Thank you! Cant wait to share a meal with you!\nhttp://t.co/9Jhd1a5XNF	1391817051	431938136428400640	f	snowdaytruck
We're so honored to be featured in @EdibleManhattan - gratitude seeps from our tap holes #maple #justtrucks \nhttp://t.co/FHjcd67kPc	1391814205	431926200236122112	f	snowdaytruck
RT @EdibleManhattan: There's soon to be a new food truck in town. @SnowDayTruck hits the street in a few weeks with a... http://t.co/gpZ16lCJ...	1391788247	431817324916899840	f	snowdaytruck
RT @ShanghaiMKS: @SnowDayTruck Thank you for the shout out!	1391724841	431551378960687104	f	snowdaytruck
Thank you to our growing community! \n@DriveChangeNYC @EdibleManhattan @csiSL @SITUSTUDIO @ShanghaiMKS @TheDoeFund \nhttp://t.co/FHjcd67kPc	1391697775	431437856377012225	f	snowdaytruck
Feeling chilled (and not in the good way) by this NYC rain/snow/ice situation? Grab a cup of @BklynRoasting and add a dash of maple syrup!	1391620384	431113254262169600	f	snowdaytruck
.@harrytalksgood @UnionSquareNY We hope so! 3 weeks and counting until our launch - cannot wait to share a meal with you. #Snowdaybliss	1391551944	430826197862187009	f	snowdaytruck
RT @harrytalksgood: .@SnowDayTruck can't wait to try your signature sugar on snow pops! Coming to @UnionSquareNY soon? http://t.co/v0x5LSES...	1391551898	430826004735852544	f	snowdaytruck
Friday lunch @ Shorty's. USA vs Canada at noon. Game w/ sound at all locations. #usausa #sochi2014 #shortysnyc... http://t.co/JZVhYWQQVz	1393000252	436900840713240576	f	shortysnyc
Lunch @ Shorty's. USA vs Canada at noon. Game w/ sound at all locations. #usausa #sochi2014... http://t.co/FQcz5HUNeZ	1393000159	436900451846725633	f	shortysnyc
WFC South for lunch - South End Ave &amp; Liberty.	1392997813	436890610000076802	f	shortysnyc
NYC Craft Beer Week!!! $5 Select NY based Drafts and $10 Beer Flights at all 3 Shorty's Locations... http://t.co/qan6zoyf3g @beermenus	1392931758	436613557074284545	f	shortysnyc
We've missed you! Back at 47th &amp; Park for lunch. #foodtruck #wizwit #shortysnyc	1392912653	436533426196590592	f	shortysnyc
Just added Breckenridge Ophelia Hoppy Wheat Ale on tap. http://t.co/df3JzbDFHv	1392856320	436297145608843264	f	shortysnyc
Just added Bronx Brewery Black Pale Ale on tap. http://t.co/J1hGm1gow9	1392856092	436296189349466112	f	shortysnyc
Just added Badass Pear Cider on tap. http://t.co/MxVqRpwwFT	1392856009	436295844170440704	f	shortysnyc
Just added Spider Bite Boris the Spider on tap. http://t.co/qYpd0UZ5zO	1392855972	436295685508313088	f	shortysnyc
Just added Heavy Seas Siren Noire Bourbon Barrel on tap. http://t.co/TwlS15cYe6	1392855939	436295547562246144	f	shortysnyc
USA! USA! Have a patriotic lunch with us @ Shorty's. Hockey game sound on at all locations. 12pm. #olympics... http://t.co/nOCQPKEsIh	1392824733	436164663261560832	f	shortysnyc
USA! USA! Have a patriotic lunch @ Shorty's today. Hockey game sound on at all locations. 12pm.... http://t.co/YM7PLAz3WZ	1392824526	436163795212591104	f	shortysnyc
It feels good to be back. DUMBO lot. Jay &amp; Water St. #dumbonyc	1392823698	436160318322921473	f	shortysnyc
Just added Bell's Two Hearted Ale on tap. http://t.co/nMNOvgHrzW	1392754734	435871064061915137	f	shortysnyc
Just added Bell's Two Hearted Ale on tap. See our full beer menu: http://t.co/qan6zoyf3g @bellsbrewery #BeerMenus	1392754734	435871062510039040	f	shortysnyc
Just added Bell's Midwestern Pale Ale on tap. http://t.co/gk7rSWfrhz	1392754698	435870912991084544	f	shortysnyc
Just added Bell's Midwestern Pale Ale on tap. See our full beer menu: http://t.co/qan6zoyf3g @bellsbrewery #BeerMenus	1392754693	435870892397432832	f	shortysnyc
Shorty's Special--Cheesesteak &amp; select draft $12-&gt;11am-7pm &amp; 11pm-close #cheesesteaknbeer #getyourfix #shortysnyc http://t.co/7iWwAhlZRZ	1392746819	435837868431273984	f	shortysnyc
#shortysnyc http://t.co/x7JKuLmcXn	1392746378	435836017632116736	f	shortysnyc
Just added Bell's Two Hearted Ale on tap. http://t.co/tDf0YHZ9Zg	1392738905	435804672461254656	f	shortysnyc
@midtownlunch HH3 is on 47st bet Park &amp; Lex HH2 is on Park Ave bet 32 &amp; 33st Word of the day is "TGIF" for ur free upgrade. Get ur #YumYum	1392994919	436878474008334336	f	hibachiheaven
@downtownlunch HH2 is in #tribeca Varick &amp; King @midtownlunch HH3 is on 47st &amp; Park. Word of the day is "SunnY" for ur free upgrade #YumYum	1392908890	436517643307458560	f	hibachiheaven
@downtownlunch HH2 is in #FIDI on Broad &amp; Water @midtownlunch HH3 is on 46st bet 5&amp;6 Ave. Word of the day is "HumP DaY" for ur free upgrade	1392820330	436146194046550016	f	hibachiheaven
@midtownlunch HH2 is on 5ave &amp; 21st. HH3 is on Broadway &amp; 55st. Word of the day is "President" for your free upgrade. Get ur #YumYum	1392647476	435421192871485440	f	hibachiheaven
@midtownlunch HH2 is on Park Ave &amp; 33st. word of the day "Hugs&amp;Kisses" for your free upgrade. Happy Valentiness Day!	1392388891	434336609635676161	f	hibachiheaven
Our new truck @DeliHeaventruck is in king&amp;varick today. The word of the day is "amore" for ur free upgrade. @downtownlunch check it out	1392220427	433630019152523264	f	hibachiheaven
@midtownlunch HH3 is on 46th btwn 6&amp;5 today. The word of the day is "amore" for ur free upgrade. #Midtown get ur #yumyum on today	1392217711	433618625011146752	f	hibachiheaven
@downtownlunch HH2 is on water&amp;broad today. The word of the day is "amore" for ur free upgrade. #FiDi get ur #yumyum on today	1392217651	433618373516476416	f	hibachiheaven
check out our New truck @DeliHeaventruck      Grand Opening today on Broadway@55	1392130502	433252846021386240	f	hibachiheaven
@midtownlunch HH3 is on Broadway &amp; 55st. word of the day is Yum	1392130379	433252328511385600	f	hibachiheaven
@downtownlunch HH2 is on Varick&amp;Charlton @midtownlunch HH3 is on 47st@Park. Word of the day is Fashion" for ur free upgrade. Get ur #YumYum	1392043201	432886678580383744	f	hibachiheaven
@midtownlunch HH2 is on Park&amp;33st. HH3 is on Broadway bet 56&amp;57st. The word of the day is "TGIF" for your free upgrade. Get ur #YumYum	1391785655	431806454056902656	f	hibachiheaven
@downtownlunch HH2 is on Varick &amp; King today. The word of the day is "Heaven" for your free upgrade. Get ur #YumYum	1391700153	431447828997898240	f	hibachiheaven
@midtownlunch HH3 is on 46st &amp; 6 ave. HH2 is on Park Ave &amp; 33st. Word of the day is "Peyton for ur free upgrade. #midtown get ur #YumYum	1391179137	429262532864647169	f	hibachiheaven
@midtownlunch HH3 is on broadway&amp;55 today. The word of the day is "broncos" for ur free upgrade. #midtown get ur #yumyum on today	1391094347	428906895924293632	f	hibachiheaven
@downtownlunch HH2 is on varick&amp;charlton today. The word of the day is "broncos" for ur free upgrade. #SoHo get ur #yumyum in today	1391094137	428906016353558528	f	hibachiheaven
http://t.co/4DPFdAwvzY	1390846693	427868159576932352	f	hibachiheaven
RT @cammcm: @hibachiheaven Can my Super Bowl dreams get a #RT  http://t.co/XUwm2u53nK	1390619663	426915929453518848	f	hibachiheaven
@deliheaventruck http://t.co/VXmnvmAMfA	1390606545	426860906937864192	f	hibachiheaven
@midtownlunch HH3 is on park&amp;47th today. The word of the day is "tgif" for ur free upgrade. #midtown get ur #yumyum on today	1390576694	426735702593011713	f	hibachiheaven
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
@downtownlunch correction we are on king&amp;varick today. The word of the day is "amore" for ur free upgrade. #SoHo get ur #deliheaven on	1392220340	433629653711212545	f	deliheaventruck
@downtownlunch DH is on varick&amp;charlton today. The word of the day is "amore" for ur free upgrade. #SoHo get ur #deliheaven today	1392217592	433618126148993024	f	deliheaventruck
@midtownlunch Today is the Day!! Grand Opening on Broadway &amp; 55st. Rotisserie chicken, pastrami @ corn beef sandwiches New York Style	1392131026	433255045355036672	f	deliheaventruck
@midtownlunch HH3 is on 46 st &amp; 6 Ave. HH2 is on Park Ave &amp; 33st. Word of the day is "Peyton" for your free upgrade. #midtown get ur #YumYum	1391178361	429259276079861760	f	deliheaventruck
@JesseDRodgers @nycfoodtruck glad to hear that! Proud of serving u authentic and welcome to #malaysiakitchen	1393007385	436930759728050176	f	lovemamak
@JesseDRodgers @nycfoodtruck how do u like it ? ^_^ plz tell us ur thought on #yelp	1393006493	436927018023002113	f	lovemamak
@yeobites not on winter night really cold out there.... But we do private event for night time, if u have any party going on!	1393002418	436909924598444032	f	lovemamak
@yeobites @ 7hanover sq	1393002363	436909696763846657	f	lovemamak
@yeobites LIKE us on Facebook!!!! :) #thatwaseasy	1393002229	436909131942076416	f	lovemamak
We are giving out curry puff today! #askushow	1393001927	436907867673997312	f	lovemamak
We have new batch of food for today again! @7 Hanover Sq #lunchtime #fidi #nomnomnom	1393001405	436905677764972544	f	lovemamak
@EthanTony @2pm aiyaya.... Come 15 mins early, u could get the full experience. :(	1392933936	436622692763324416	f	lovemamak
We are at 7 Hanover square, will stay until sold out, quick !!	1392914561	436541426290409472	f	lovemamak
@EthanTony due to the weather this morning, unable to bring the cart out, if the weather is good tomorrow, we will be out again	1392751242	435856419607560192	f	lovemamak
@shanti will do!	1392741743	435816574113820672	f	lovemamak
@Playmaka34 I know Peter! Too cold to stay out!!!	1392689945	435599321393037312	f	lovemamak
Currry Laksa http://t.co/YFMM2YFYpW	1392687902	435590752216023040	f	lovemamak
Customize menu to match your event ? NO PROBLEM, just ask us! http://t.co/0Ih5dU1UtG	1392685519	435580754769498112	f	lovemamak
Private event @shanti gourmet kitchen #birthday #privatechef #kitchen #Malaysia #singapore http://t.co/qdMlWIEKDL	1392685283	435579765328998401	f	lovemamak
RT @ZeeAvi: Remember, being single just means you're dating yourself for awhile. So make it the best relationship.	1392577539	435127854557167617	f	lovemamak
@dorkasaurus_rex no at lunch time in he city	1392139611	433291051189927936	f	lovemamak
we are at 7 Hanover square.	1392054925	432935854626324480	f	lovemamak
@EthanTony thank you, tomorrow we will be there if u around!	1391733211	431586488237981696	f	lovemamak
@EthanTony sorry, we are not here, due to customers booked us for private event	1391707018	431476625310748672	f	lovemamak
TGIF!  Lets have a crustacean celebration with a lobster roll!  Big Red will be parked around 46th &amp; 6th Avenue.	1392994508	436876751420280832	f	lobstertruckny
OMG It's beautiful outside! What would be better than a walk in the sunshine and a lobster roll?! Big Red will be parked at 56th &amp; Broadway!	1392908112	436514377605578753	f	lobstertruckny
#bigred is waiting for you on 50th &amp; 6th! come and get it NYC...she'll be there till 2:30. #clawsup. \n#lobsterforlunch	1392829388	436184187482415104	f	lobstertruckny
Hurry!  Come grab a delicious lobster roll before the rain gets here!  We're at 50th &amp; 6th Ave waiting!	1392826187	436170760819048448	f	lobstertruckny
Get out in the warm weather and visit Big Red for some crustacean elation!  Our lobster truck will be parked around 50th &amp; 6th Ave.	1392821721	436152028625395712	f	lobstertruckny
Big Red our lobster truck will not be on the sloppy roads today, so for all your lobster needs visit us in Red Hook at the lobster pound.	1392735302	435789561961410560	f	lobstertruckny
IT's MONDAY- We're closed! SAD FACES all around! #lobstahlovahs... Let's hope for a beautiful week!	1392649524	435429781900128257	f	lobstertruckny
Late lunch = Lobster rolls @bkflea till 6pm. Early dinner= fresh steamed lobstah w/ EXTRA buttah @Redhooklobster till 7pm.	1392579028	435134100744458240	f	lobstertruckny
ITS SUNDAY- A GREAT DAY FOR LOBSTER. ( but hey thats everyday- we are biased) @bkflea till 6. @Redhooklobster till 7. #CLAWSUP	1392563116	435067359733506048	f	lobstertruckny
bored-nothing to do, come eat some #lobster @bkflea till 6 @Redhooklobster till 8. LOBSTER CURES ALL. Come get yo fix.	1392484237	434736515676372992	f	lobstertruckny
#bigred is off the road today. OPEN @bkflea N5 &amp; Wythe 10-6. OPEN in #redhook @redhooklobster 12-8. #clawsup	1392472848	434688746760732672	f	lobstertruckny
Lobsters r Red, Violets r Blue, come 2 #redhooklobster pound w/ your special boo. #happyvalentinesday @redhooklobster #redhook till 8pm	1392404401	434401660606349312	f	lobstertruckny
@EAEChicago Lizzy!! I'm here!! Follow us and we can DM..	1392392962	434353681392488449	f	lobstertruckny
Don't forget #lobstah for yo' #lover today... in #redhook @Redhooklobster 12-8pm. #bigred is figuring what shoes 2 wear tonight. #offtheroad	1392391349	434346917678813185	f	lobstertruckny
@EAEChicago Hi Lizzie, call the pound and we'll coordinate: 718.858.7650 X4	1392390565	434343629172539392	f	lobstertruckny
Because of the icy, sloppy roads, our lobster truck Big Red will not be out today but the lobster pound in Red Hook will be open 12:00-8:00.	1392389716	434340068585906176	f	lobstertruckny
Big Red will not be out today, she will be taking shelter from this nor'easter at home in Red Hook.	1392303320	433977697748807680	f	lobstertruckny
RT @amykeefe: @cnbenton1 @gcnyc1 @lobstertruckny thats two votes for RHLP! mmm lobstahhzzzz	1392235551	433693452531142656	f	lobstertruckny
Big Red has been blown off course!  Our lobster truck will now be at 50th Street &amp; 6th Avenue. @sexyfoodtrucks Thanks for the retweet!	1392217449	433617526610997248	f	lobstertruckny
50th Street is closed so Big Red will now dock at 47th&amp;Park for all your lobster needs.  Come and join us for lunch.	1392131693	433257840581832704	f	lobstertruckny
TGIF!! We will be spending this wet day indoors for a corporate dining events we everybody next	1392998300	436892652420612097	f	mikenwillies
RT @ohlivvyuh: ALSO got spoiled at @mikenwillies today too! Loved the guac!!!!	1392922399	436574303119998976	f	mikenwillies
Hello midtown Time to come out of hibernation and enjoy this #heatwave 56th St. &amp; Broadway #comegetsome	1392912097	436531090686504960	f	mikenwillies
Off the road today for private corporate dining we'll be out tomorrow at #Midtown 56th and Broadway #comegetsome	1392825339	436167202740666368	f	mikenwillies
Happy Taco Tuesday!! 45th St. Btwn 5th &amp; 6th Ave #Tacos #Sliders #Burritos #Ricebowls #comegetsome	1392130982	433254860684009472	f	mikenwillies
Off the road again today hoping to be out tomorrow at 47th st and Park Ave see you then stay warm	1391703600	431462288307257345	f	mikenwillies
Off the road today - stay safe - when does #Spring begin???	1391441407	430362572634595328	f	mikenwillies
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
Is it time to have a burger yet? Yes, always yes. We're on 27th and Park for those that want to indulge in their good habits.	1388421772	417697305433632768	f	goburger
Hey folks, we moved to 76th and Broadway!	1388181396	416689095872901120	f	goburger
@starrett601 28th and 11th!	1388163198	416612767983218688	f	goburger
@stevenshawnyc for the next few hours until we leave to stock up for dinner service!	1388160796	416602692153540608	f	goburger
Break your Resolution: Chorizo Breakfast Burrito w Mex Scramble, Chorizo, Queso &amp; jalapenos. Come on...you deserve it.. http://t.co/dQM7e7L56m	1392917978	436555758172246016	f	mexicue
Keep your Resolution: Brisket BBQ Ranch Salad with Tomatillos &amp; BBQ Ranch Dressing. Stay strong...we believe in you. http://t.co/wLHV0lfojl	1392917910	436555473303511040	f	mexicue
Water and broad...warm and beautiful.	1392910859	436525898633068545	f	mexicue
18th and 5th....heat wave! Cool down with a Mexican coke...	1392821909	436152816584118272	f	mexicue
Starret Lehigh...hot and snowy.	1392739503	435807181515288577	f	mexicue
No truck today...back tomorrow along with some warmer weather.	1392661259	435479003026444288	f	mexicue
No truck service this week...we will be back up and at it next Monday!	1392051491	432921451407372289	f	mexicue
@yourboyblue2 polar vortex...polar vortex	1391720186	431531856044240896	f	mexicue
@AMajORevolution we would love to get over there...maybe when the weather warms up a bit	1391720150	431531705892347905	f	mexicue
No truck today, we decided take advantage of the nice weather with a trip to the beach!	1391616957	431098881892679680	f	mexicue
RT @starrett601: Out front today 12-3pm! RT @Mexicue Starret Lehigh...back at it today...a little snow never hurt anyone.	1391538779	430770977501638656	f	mexicue
RT @EdibleManhattan: Not your mama's chili: @mexicue's burnt ends and smoked chorizo chili with lime crema, house pickled... http://t.co/b4W4...	1391538569	430770098367135744	f	mexicue
Starret Lehigh...back at it today...a little snow never hurt anyone.	1391531905	430742147978260480	f	mexicue
RT @BCDRestaurants: Check out our client @Mexicue featured in @FoodAndWineMag list for best #Chili in the #US #BCDStrategic http://t.co/x5v...	1391479112	430520719928467456	f	mexicue
Truck is doing a private event today - back out on Monday. Have a good weekend all!	1391185573	429289524057751553	f	mexicue
@AlmostMedia  Sorry we have a private truck event today!	1391185518	429289296328003585	f	mexicue
RT @BCDRestaurants: @mexicue has a sauce that no one else does and it is so delicious! #CrackSauce #BCDStrategic #MustTry	1391182779	429277806863085569	f	mexicue
RT @krosaen: Optimized my NYC morning to stop by @PortsNYC for cup of joe and then @Mexicue for brisket breakfast burrito on the way to @Fo...	1391182768	429277760226619392	f	mexicue
RT @RorySacks: Breakfast. Lunch. Dinner. @mexicue http://t.co/iSSit0Oed0	1391125635	429038129262370816	f	mexicue
@RorySacks love it!!	1391125631	429038112036384769	f	mexicue
La gringas is at 51st and park ave come get your tasty hot burritos!!	1391618320	431104598120861696	f	lagringatruck
La gringa food truck @ 51st&amp;park ave till 4pm come beat the cold with a 1 1/2 pound burrito tacos 3 for $10 nachos and much more see you	1391511828	430657940459384832	f	lagringatruck
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
@thearize thanks for the add.. Follow us on the burrito journey : )	1385481971	405366886101442560	f	lagringatruck
http://t.co/zwwmAJUuOT	1385467895	405307846419423232	f	lagringatruck
Our brooklyn brick and mortar location is open and pumping out burriots/tacos at an alarming rate!	1385387954	404972549546586113	f	lagringatruck
la gringa food truck launch date has been moved to 12/10..	1385387922	404972414703902721	f	lagringatruck
1yr ago today that Mamu Thai Noodle hit the streets of NYC. Before then, the truck was a figment in the imagination. #liveyourdream #yolo	1393002439	436910016021680128	f	mamuthainoodle
@dumbolot: Happy birthday @mamuthainoodle! What a crazy 1st year! 2014 is only gonna get crazier! Thank you @dumbolot for the support!	1393001222	436904908659650561	f	mamuthainoodle
Fog &amp; drizzle gonna stop you from getting your noodle on? Dumbo we are here @dumbolot ! 1yr ago today, Mamu Thai noodle made its debut!	1393000128	436900321613606913	f	mamuthainoodle
Well you didn't win Powerball, but you can have lunch with us!	1392913717	436537885907779585	f	mamuthainoodle
WFC North! We're running late because of crazy traffic on the west side. Ready at noon!	1392828257	436179442076221440	f	mamuthainoodle
Again, winter will not let up. :( we will not be out today. See you soon. Stay warm!	1392727858	435758338283159552	f	mamuthainoodle
Dumbo today! We dug deep and now we are ready for you! Red curry special as well as Tom Kha soup! @DUMBOFoodTrucks till 3pm or sold out.	1392395899	434366003360047104	f	mamuthainoodle
We're staying indoors. Hope you are too! #ihatewinter	1392306047	433989136534749184	f	mamuthainoodle
To the good ppl of @BrookfieldPLNY &amp; WFC North, our truck is having engine problems and cannot make it today. Stay warm everyone. :(	1392225097	433649606522851328	f	mamuthainoodle
@Enigma0280 we're sorry, truck is having mechanical troubles and cannot make it today. :(	1392224970	433649073070301184	f	mamuthainoodle
Sorry Tuesday spot, truck cannot make it today. :( hope to see you next week!	1392130291	433251961321062401	f	mamuthainoodle
RT @DispatchNY: . @BrookfieldPLNY SOUTH Lot | Monday, Feb. 10th | South End Ave. &amp; Liberty St. | 11a-3pm | @MamuThaiNoodle | #batteryparkci...	1392050212	432916084833132544	f	mamuthainoodle
WFC South End&amp;Liberty! 2 weeks since we've brought you hot/fresh noodles! Blame winter for it. Today 11-3pm. @BrookfieldPLNY @downtownlunch	1392044586	432892486605103104	f	mamuthainoodle
RT @UnderEggWill: Pad see ew for lunch from @mamuthainoodle with chili flakes so hot they use them to clear the snow in Dumbo. Delicious lu...	1391811718	431915767094067200	f	mamuthainoodle
RT @CarlyWeil: I'm dying without @mamuthainoodle! @DispatchBP: Sorry, folks! @BrookfieldPLNY Food Truck Lots are closed today due to the w...	1391628021	431145286367731712	f	mamuthainoodle
Sorry FiDi &amp; WFC, no truck today. Stay warm!	1391435761	430338891640733696	f	mamuthainoodle
Sorry folks @ WFC, can't make it today. :( See you soon!	1390837355	427828995846316032	f	mamuthainoodle
@Chris_Quartly Hi Chris! Our truck is at the mechanic getting some TLC. Can't go out today :( hope to see you next week!	1390837210	427828387709984769	f	mamuthainoodle
Sorry noodle lovers, no truck today. Stay warm NYC!	1390402666	426005774452948992	f	mamuthainoodle
Studies show that most ppl need more noodle in their lives, let us help you with that! @DUMBOFoodTrucks 11-3. Get it hot/fresh! @dumbolot	1389970970	424195112378580992	f	mamuthainoodle
41st and 6th on this Phil's Phriday! Breakfast til 11 and lunch til 2.	1392992493	436868299071049731	f	philssteaks
RT @Triguenaaa: Thanks for lunch @PhilsSteaks!	1392991764	436865240001949696	f	philssteaks
RT @jimivins: I don't wait outside in the cold for many things, but I will wait in the cold for a cheesesteak #FatKidProblems @PhilsSteaks	1392991753	436865193822654464	f	philssteaks
What up BK?  Tonight we're at @RoyalPalmsClub in Gowanis serving up the good stuff.  Come grab a cheesesteak &amp; beer and get your shuffle on!	1392944550	436667210904657920	f	philssteaks
Throwback Thursday is back in effect. We're at 52nd and 6th serving up the goodness until 2 so come get it!	1392913952	436538871896350720	f	philssteaks
52nd and 6th we are back! No snow, no Super Bowl, just steak goodness. Breakfast til 11 and lunch til 2. Get your Phil!	1392903113	436493411462696960	f	philssteaks
NYU dinner at W. 4th and Greene til 8. Get your Phil!	1392842272	436238225049260032	f	philssteaks
Lunchtime! 41st btw 6th and BWay til 2	1392828968	436182423207165953	f	philssteaks
Cheese, Steak n' Eggs on an Amoroso's Roll w a Hashbrown patty (on it or on the side). Howz that sound?!\n\n41st btwn 6th &amp; Broadway \n\n#jawn	1392819217	436141525870051328	f	philssteaks
NYU dinner at W. 4th and Greene til 730!	1392760926	435897035620093953	f	philssteaks
The griddles are heating up to get ready for some hot cheesesteak action. 51st and Park is the spot. Lunch til 2	1392734770	435787331300495360	f	philssteaks
Happy Presidents Day Pholks! We're off the road but we'll be back tomorrow!	1392647827	435422664413691904	f	philssteaks
@shannboogie real love indeed! Happy valentines!	1392392359	434351153619689472	f	philssteaks
RT @shannboogie: a v-day kiss to the first person who brings me a @PhilsSteaks to the office for lunch. that's real love.	1392392314	434350966503395328	f	philssteaks
Happy Valentines Pholks! Bring your special someone by the jawn for a gooey lunch! 41st btw 6th n BWay 11-3	1392391201	434346298150764544	f	philssteaks
@melendezlou starting at 11 today. Had to dig out this morning	1392391130	434346000514564096	f	philssteaks
@TheRoungeTable we will be on 41st n 6th today 11-3. Come by!	1392391110	434345912912343040	f	philssteaks
Nothing says I love you like cheesesteaks from the jawn. Bring your valentine for lunch. show that special... http://t.co/C8628XA7cd	1392391062	434345715486052352	f	philssteaks
Too crazy out there today - the jawn is staying off the roads! be safe and enjoy the snow day pholks! #pax	1392295338	433944216906235904	f	philssteaks
RT @ThePatBrady: The worst part about moving to a job in Hoboken is that I miss all my favorite food trucks. Especially @PhilsSteaks and @M...	1392242408	433722214173900800	f	philssteaks
RT @EatStTweet: Food truck operators are giving a big thumbs up to Vancouver's progressive new bylaws\n http://t.co/L478dWiapG	1393004953	436920559746969600	f	burgersandbites
RT @feedyourhole: Burgers + Bitches + Leather + Art + Denim = theoldnyway #life #Irideharleys #harleydavidson... http://t.co/UHASdHYhxO	1393004923	436920432609226752	f	burgersandbites
@bittman: Is That Sausage Worth This? http://t.co/fG6jzN84Cg (Spoiler: gross.) say no to bad food !	1392897699	436470703748296704	f	burgersandbites
West 29th &amp; 11th for a quick breakfast and the lunch we have all grown to love! 6am-2pm let's grow this neighborhood together!	1392895105	436459823891496960	f	burgersandbites
@brunog @tmilewski @adamcjonas nooooo! We are gonna have to devise a way to get him a burger	1391529602	430732486885531648	f	burgersandbites
@tmilewski we hope to get back as soon as the weather gets better	1391527144	430722177273724928	f	burgersandbites
Hello again twitter friends! Chelsea lets do breakfast and lunch w. 30 and 11th!	1391519534	430690262034427904	f	burgersandbites
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
We are off the road today! (Thursday)	1392901484	436486577083383809	f	polishcuisine
Happy to say that we catered dinner for "Watch what happens live" w/Andy Cohen! #pierogitime #grilledkielbasa #yum	1392901424	436486326607941633	f	polishcuisine
@Andy hope your enjoying our smokin' hot grilled kielbasa with a side of traditional pierogi ! #yum #pierogitime	1392863214	436326063430717440	f	polishcuisine
Change of plans today- the rain detoured us!	1392830945	436190715631398912	f	polishcuisine
Planning to be around Hudson Square tomorrow #pierogitimeisback! #nomoresnowdays	1392772988	435947627008364544	f	polishcuisine
@Valduccis once we are rolling out and fully firing the grill- we'll send it express! Don't forget to send us your delicious pizza!	1392760854	435896731574992897	f	polishcuisine
RT @Valduccis: This is what I'm craving for lunch! Can you deliver it to Staten Island @polishcuisine? #deicious http://t.co/4DD6AS4pna	1392760705	435896106548199424	f	polishcuisine
Off the road today#snowday	1392731498	435773604546895872	f	polishcuisine
@CarolinePahl hi! Please be sure to check our postings as with this weather it's really hard to tell......#nomoresnow	1392731281	435772693808685056	f	polishcuisine
Lots of slippery roads! We will see you next week! Happy valentines day!!!!! #snowday	1392391406	434347154451099648	f	polishcuisine
We are gearing to be on east 47th tomorrow..... Weather allowing	1392342036	434140083437178880	f	polishcuisine
we are closed and heading safely home - becareful out there!	1392320483	434049684802633729	f	polishcuisine
@cruisinwithddub no - we braved it on 55th and Broadway #pierogitime	1392308922	434001194344644609	f	polishcuisine
We are here and ready to roll on 55th and Broadway! #pierogitime #getmybellywarm @randomfoodtruck	1392308764	434000530281865216	f	polishcuisine
I posted a new photo to Facebook http://t.co/XgYrAtIdqt	1392304611	433983112444653568	f	polishcuisine
I posted a new photo to Facebook http://t.co/Z0nwmNvj6d	1392304521	433982732398759936	f	polishcuisine
I posted a new photo to Facebook http://t.co/xKGe8wDrBD	1392302590	433974635672399872	f	polishcuisine
RT @pooh05bear: Whoa nyc! So glad I'm not there this week! #snow RT @PolishCuisine: http://t.co/uk5A8arJKo	1392301855	433971551550320642	f	polishcuisine
http://t.co/sLAL5D9Qvg	1392300821	433967216271589376	f	polishcuisine
http://t.co/bP557rHNi0	1392299624	433962194238464000	f	polishcuisine
The cart is headed to 49th st between 6th &amp; 7th aves from 11:00-2pm. Don't let a little rain stop you from getting schnitz faced!:)	1392995937	436882741872054274	f	schnitznthings
Good morning guys. The truck will be at @BrookfieldPLNY on North End and Vesey sts slinging warm schnitz. Come get some grub!	1392995830	436882292938911745	f	schnitznthings
Greenwich &amp; Park place we are coming for you. The Schnitzcart is there from 11:00-2:00pm. We've missed you guys. Hope to see you.	1392911555	436528818015453184	f	schnitznthings
A beautiful day out:) the truck will be on 51st between park and madison from 11:30-2pm. Step out of the office and come by for lunch!	1392911352	436527969017016320	f	schnitznthings
The truck is on 47th between park and lex 11:30-2pm. Its the perfect schnitz weather. We hope the cold and snow stay away for good.	1392827695	436177085200334848	f	schnitznthings
Good morning guys! Glad we are able to serve you again:) the #schnitzcart is on 27th street and Park avenue from 11:00-2pm. Hope to see you!	1392825035	436165928804687872	f	schnitznthings
Morning guys. The truck will be out today on 52nd st b/w 6th &amp; 7th from 11:30-2pm. The cart is staying in however. Come get some schnitz!	1392736302	435793752893186050	f	schnitznthings
Hi guys. Happy Presidents' Day! We are off the road today. We'll see you all tomorrow:)	1392647417	435420945575321601	f	schnitznthings
Morning guys, unfortunately the cart won't be making it out today. The truck will be on 51st b/w park and mad 11:30-2. Preorder 347-772-7341	1392392229	434350608892829696	f	schnitznthings
@mollyyeh @ultrateg she won fair and square ;)	1392241612	433718872827777025	f	schnitznthings
27th &amp; park the cart is there to serve your schnitz needs:) 11-2pm we are parked and ready to sling some schnitzel! Hope to see you.	1392221368	433633963534725120	f	schnitznthings
Hi guys. Get your schnitz before yet another snow storm:( Schnitztruck on 47th &amp; park 11:30-2pm. Preorder 347-772-7341. Hope to see you soon	1392221246	433633453792563200	f	schnitznthings
The #schnitzcart is heading back to 55th &amp; broadway today. We'll be open from 11:15-2pm. Stop by and grab a warm schnitz!	1392131064	433255201542533120	f	schnitznthings
Good morning guys. The truck will be on 52nd b/w 6th &amp; 7th from 11:30-2pm. If you'd like to preorder please call 347-772-7341. Cya:)	1392130963	433254778899271680	f	schnitznthings
To our customers on Varick &amp; Charlton please call (202) 538-3906 if you would like to place a preorder. Thanks:)	1392049796	432914338463371265	f	schnitznthings
#schnitzcart will be on 55th &amp; Broadway from 11:30-2pm. Come schnitz with us for lunch! Nothing like a delicious warm cutlet on a cold day	1392046356	432899910342819840	f	schnitznthings
Good morning everyone:) hope you had a good weekend. Come get some schnitz on Varick &amp; Charlton. #schnitztruck will b there from 11:30-2pm	1392046200	432899259412021248	f	schnitznthings
Hey guys. #schnitzcart couldn't find a spot on 49th so we are on 50th st b/w 6th &amp; 7th ave from 11:15-2pm. Come get some schnitz! TGIF:)	1391787691	431814991948574720	f	schnitznthings
The #schnitztruck will be at usual thurs spot on 51st b/w park and madison 11:30-2pm. For preorders call  (202) 538-3906. Schnitz ya lata:)	1391695395	431427874860855296	f	schnitznthings
Morning guys, it's a bit cold but we're back:))! The #schnitzcart will be on Greenwich st &amp; Park pl from 11-2pm. Git ur schnitz on!	1391695250	431427265315217408	f	schnitznthings
CHEESESTEAK FRIDAY CHEESESTEAK FRIDAY! ! Broadway &amp;55th st 11-3 @randomfoodtruck @VictoriasSecret @Barclays @DefJamRecords GOT WHIZ?	1392995981	436882925871960064	f	carlssteaks
Days not over for Carl's steaks UWS 61ST ans Broadway till 8 come by for an awesome wiz wit!!	1392933321	436620110540066817	f	carlssteaks
Hey folks its ok to come outside ! 10 Hanover square &amp; water st 11-3 come by grab a Carl's famous cheesesteak GOT WHIZ?	1392908253	436514969375756288	f	carlssteaks
Hey folks union sq west 14th st 3rd / 4th ave 5-9 p	1392845927	436253553846657024	f	carlssteaks
Rain rain so what still serving up cheesesteaks 49th st bet 6/7th ave 11-3 pre order 917 596 33036th @Barclays @SIRIUSXM GOT WHIZ?	1392830636	436189421726359552	f	carlssteaks
Good morning BROOKLYN we you all @DUMBOFoodTrucks @dumbolot 11-3 grab a cheesesteak and dont forget our awesome chicken and dumplings soup	1392735851	435791864739135488	f	carlssteaks
Happy President s Day hanging UWS 68TH AND BROADWAY 11-3 celebrate today w  Carl's famous cheesesteak GOT WHIZ?	1392656261	435458039878270976	f	carlssteaks
Gotta watch the GEICO CHEESESTEAK Shuffle !! https://t.co/LaA97QpO60	1392611783	435271485918572544	f	carlssteaks
Saturdays UWS broadway and 68th st till 8 pm stop by a carls famous cheesesteak dont forget BEER BATTERED ONION RINGS !!! GOT WHIZ?	1392486228	434744869735903233	f	carlssteaks
@AlliChasesBliss yes 67th broadway on saturday 11-8 hope to see you	1392428654	434503386697048064	f	carlssteaks
Hey happy Friday! Broadway &amp; 55th st 11-3 come by for a Valentine's day cheesesteak @VictoriasSecret @randomfoodtruck http://t.co/kelhZLwixZ	1392391458	434347374216245248	f	carlssteaks
No need to explain folks ,sorry we will see you tomorrow stay warm and safe	1392306030	433989061918076928	f	carlssteaks
Wow its cold!Warm up with a piping hot Carl's cheesesteak 49th st bet 6/7th ave11-3 @Barclays @SiriusXMNFL @SIRIUSXM http://t.co/BjJynCDLBf	1392216585	433613903638331392	f	carlssteaks
Hello BROOKLYN @dumbolot @DUMBOFoodTrucks 11-3 warm up w a piping HOT famous Carl's Cheesesteak dont forget our BEER BATTERED ONION RINGS	1392133199	433264158944268288	f	carlssteaks
Good morning Midtown East! 47th st &amp; corner of park ave 11-3 stop by get warm grab a piping hot cheesesteak @MLB @jpmorgan GOT WHIZ? #whiz	1392044287	432891233120559104	f	carlssteaks
Good morning UWS broadway &amp;67th st front of Apple store 11-9 stop by say hi grab a Carl's piping hot cheesesteak and make it a WHIZ day	1391874561	432179350998646784	f	carlssteaks
RT @letjo78: @carlssteaks @randomfoodtruck ah I can finally catch this marvelous truck again- this is how you start the weekend!	1391836064	432017883087241216	f	carlssteaks
Scream it from the rooftops CHEESESTEAK FRIDAY CHEESESTEAK FRIDAY!55th &amp; broadway 11-3 @randomfoodtruck @VictoriasSecret @DefJamRecords	1391786266	431809015589662721	f	carlssteaks
COLD ENOUGH??? http://t.co/CTYcEer2cQ	1391726511	431558385159659520	f	carlssteaks
Hey folks another cold one stop by 10 Hanover sq and Water st for a piping hot Carl's cheesesteak 11-3 GOT WHIZ?	1391702364	431457104118177792	f	carlssteaks
LUNCH TIME Dumbo Come join your favorite food truck on Jay str &amp; Water str. Yes we are back. Try Our Yummy Ajiaco Soup Of The Day. C U HERE	1393000714	436902777751863296	f	palenquefood
Good Mrng WFC South, Your Favorite Food Truck Is Here And Ready To Fill Your Tummy... Try Our All New Arepa Burger !!! And Burger Combo!!!	1392910982	436526417472671744	f	palenquefood
Today @ smorgasburg with arepa burger! Yummmmm http://t.co/l56nFL9JsV	1392573250	435109866571845632	f	palenquefood
@Palenquefood	1392393683	434356707708649472	f	palenquefood
Happy valentines day, we are here yo serve you with delicious quinoa and multigrain Arepas! Or get a hoy ajiaco for your lover! :)	1392393451	434355734944702464	f	palenquefood
Gd Mrng Dumbo Come join your favorite food truck on Jay str &amp; Water str. Yes we are back... Try Our Yummy Ajiaco Soup Of The Day... C U HERE	1392392781	434352921917292544	f	palenquefood
RT @HarlemFTR: @Palenquefood will be serving delicious columbian foods with eco-friendly ingredients at the @HarlemFTR February 15! http://...	1392160597	433379071268253696	f	palenquefood
Palenque will be at he Harlem food truck rally this Saturday Feb 15  http://t.co/cpYlp2MSuO	1392069388	432996516534304769	f	palenquefood
We are at smorgasburg with soups and gluten free Arepas, come yo N5 &amp; Whyte! Delicious &amp; Nutritious! :) until 6 pm	1391964260	432555574497411072	f	palenquefood
We are at smorgasburg on N5 and Whyte , ajiaco, sancocho and lentil soups. Also delicious gluten free arepas! Until 5 pm!	1391877859	432193184253636608	f	palenquefood
Gd Mrng Dumbo Come join your favorite food truck on Jay str &amp; Water str. Yes we are back... Try Our Yummy Ajiaco Soup Of The Day... C U HERE	1391783073	431795624280088576	f	palenquefood
Here we are WFC, with Ajiaco Soups and the best Arepas! North end &amp; Vesey st! Come Join Us, For A Delightful Lunch Paisa... See you here !!!	1391700717	431450195642302464	f	palenquefood
Hello New Yorkers Today Ur favorite food truck is parked @ WFC South... Come enjoy our lovely Hot Soups &amp; Ur Favorite Paisa Arepas...	1391527370	430723125622611968	f	palenquefood
Feel the beautiful weather. Today in Smorgasrburg!!!	1391356928	430008239691169792	f	palenquefood
SunnyYork today and we are in Williamsburg! Come &amp; Enjoy your favorite kind of 'arepa' &amp; all the options we have for you :) Hurry up!	1391356836	430007855165739008	f	palenquefood
Finally Brooklyn Some Very Beautiful Weather And Ur Favorite Food Truck Is Out Here Right By Grand Army Plaza.... Come Join Us!!!! Arepas!!!	1391274604	429662947003351040	f	palenquefood
It's a beautiful day. Williamsburg!!!\nCome today and taste your favorite arepa and soup. North 5 btw Berry &amp; Whythe http://t.co/m4NWuNKjEr	1391274193	429661227175141376	f	palenquefood
Good Morning Grand Army Plaza. Come Enjoy Your Favorite Food Truck Palenque!!!  We Are Here Arepa Lovers. We Also Have AJIACO (chicken soup)	1391264700	429621409078587392	f	palenquefood
Gd Mrng Dumbo Come join your favorite food truck on Jay str &amp; Water str. Yes we are back... Try Our Yummy Ajiaco Soup Of The Day... C U HERE	1391178938	429261695597678592	f	palenquefood
It's cold outside but hot inside here at smorsgarburg! Come and try our delicious home made food! N5 &amp; Whythe http://t.co/Od8VcgrMEf	1390748436	427456041413259264	f	palenquefood
G1 - 46TH 5/6\nG2 - Flatiron 25th@Park/Lex\n#ComeToTheCheeseYo	1393001411	436905703836766208	f	gcnyc1
Rockin the Cheese:\nG1 - 7 Hanover water/pearl\nG2 - 50/6\nSmoked Salmon Melts #tasty\n#ComeToTheCheeseYo	1392906601	436508040574287872	f	gcnyc1
@theRickYoung \nSmoked Turkey thingy stuff???	1392824318	436162921781927936	f	gcnyc1
G1- 36th 6/Broadway\nG2- 26th 11/12\nSmoked Salmon Melts #tasty\n#starrettlehigh\n#ComeToTheCheeseYo	1392824189	436162378976485376	f	gcnyc1
OMG, Gorilla taking another snow day......\nSorry for the inconvenience. .. http://t.co/DFgUUPxszb	1392732777	435778970030989312	f	gcnyc1
@cpmuoio awesome personalities, ,, best dog I ever had,,, loves everything and everyone,  8 years old ....still a puppy	1392649904	435431377132355584	f	gcnyc1
@Cravethetruck1 love it....Let's chat	1392597718	435212490579140608	f	gcnyc1
@cpmuoio \nYeas a welshie....Hez the best...just had a haircut http://t.co/LxB5BQUCwx	1392597716	435212483662721024	f	gcnyc1
@theRickYoung \nFakin yo	1392597617	435212066434318336	f	gcnyc1
Sorry forgot to tweet....\nG1- 46 5/6\nG2- 50/6\nSmoked Salmon Melts w/Caramelized Onions,  Tomato,  Muenster&amp;Chipotle Aioli\n#COMETOTHECHEESEYO	1392401490	434389452568686592	f	gcnyc1
My daughter watches nothing but food shows....She says look Dad ur on tv.... http://t.co/RGVzevoLva	1392343444	434145988341936128	f	gcnyc1
Bernie &amp; Ernie	1392342876	434143608430940160	f	gcnyc1
After http://t.co/DXhvFfURpv	1392342856	434143524435812352	f	gcnyc1
Before http://t.co/dmlYEkv6cS	1392342833	434143427119579137	f	gcnyc1
Turkey bacon for the non porkers,,, needs more fat for my liking http://t.co/9EJtAhQ1vz	1392342384	434141542367105024	f	gcnyc1
Nice igloo yaaa? # igloo http://t.co/mhGSSeFssm	1392342323	434141288796266496	f	gcnyc1
"@nystfood: On the train today, a guy chatted up a girl with "I'm in the culinary arts. Heading to an interview to be on a food truck crew".	1392342226	434140879524470785	f	gcnyc1
Rocked the cheese in Jersey City Last night ....yaaa http://t.co/F6XHWb8v72	1392301629	433970602312228864	f	gcnyc1
Gorilla is NOT rockin the cheese today,,,, wickety wack out there.......\nC u all 2morro. ....\nStay warm dry and safe..	1392301565	433970334573035520	f	gcnyc1
G1 36th 6/Broadway\nG2 26 11/12\nSmoked Salmon Melts # yummy\n#ComeToTheCheeseYo\n#starrettlehigh	1392221611	433634986194141184	f	gcnyc1
Located on. 50th, between 6th and 7th	1392996158	436883670746800128	f	thepocketful
President Clinton took our spot on 50th, so we are headed to 49th between 6/7.	1392909748	436521238656471040	f	thepocketful
WE R BACK!!! 53rd between PARK AND MADISON!!!!	1392824542	436163859364462592	f	thepocketful
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
Come to 51st street, between Park and Madison - it's lunch time!!	1392220033	433628363769798656	f	seoulfoodnyc
It is almost time to plan for dinner! We ate at West 4th and Greene NYU!	1392150901	433338403933794304	f	seoulfoodnyc
Is it lunchtime yet?\nWe are ready to feed you!\nWe are at 46th street between 5th and 6th !	1392128245	433243381087879168	f	seoulfoodnyc
We have landed! West 4th and Greene	1392074122	433016370708496384	f	seoulfoodnyc
Happy Monday! We are ready to feed you at\n51st street between Park and Madison !	1392044717	432893038168641536	f	seoulfoodnyc
Just added Delirium Tremens on tap. http://t.co/LoncaAACTY	1393272728	438043690016468993	f	shortysnyc
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
Friday at 49th and 6th ave is the best way to wrap up the week!	1392998254	436892462770970625	f	domotaco
Wdup #midtown! We got your #taco and #burrito needs covered on 53rd &amp; Park today!	1392911221	436527417415327744	f	domotaco
Catch us on the corner of Jay &amp; Water st slinging #fishtacos!	1392823176	436158132415246336	f	domotaco
Oh heeeeey we're on 55th &amp; B'way today!	1392735174	435789021743022081	f	domotaco
Sorry about the late post...we're on 49th and 6th for lunch!!!	1392399062	434379268613619712	f	domotaco
We will be staying in today. #snowday	1392307429	433994930541707264	f	domotaco
Back in @dumbolot today with tacos, burritos, bowls and #nachotots. @dumbonyc @dumbofoodtrucks	1392220906	433632026353086464	f	domotaco
55th and Broadway for lunch today!	1392135375	433273284407222273	f	domotaco
ready in 20 minutes at 49th and 6th! #fireinthehole	1392048089	432907181487173633	f	domotaco
49th and 6th today for lunch!!! Great weather for a #burrito and #nachotots	1392044690	432892924632629248	f	domotaco
56th and broadway for lunch!  Come by and try the new tonkatsu curry rice.  #japanesecurry #madefromscratch	1391787519	431814272638001153	f	domotaco
@RebeccaShap sorry. Try cater@luckmgmt.com	1391783652	431798051817422848	f	domotaco
RT @mooshugrill: We missed 55th &amp; Broadway so much we shoveled out a spot to park! #msg &lt;3 #nyc #midtown @midtownlunch #nomsgtho #vsco http...	1391780670	431785541810802688	f	domotaco
RT @AlexaRayC: The Domo Taco truck does tonkatsu curry now... Be still my heart... RT @DomoTaco Pork tonkatsu curry rice http://t.co/ebo8YT...	1391780610	431785292140261376	f	domotaco
@RebeccaShap yup. Send us an email at events@domotaco.com	1391735861	431597601470021632	f	domotaco
sorry @dumbolot but we will not be coming out. stay warm!	1391612304	431079365577674753	f	domotaco
Pork tonkatsu curry rice http://t.co/fc0nXobkK4	1391531626	430740976865247232	f	domotaco
New menu item today on 55th and broadway...Tonkatsu curry rice!  #madefromscratch #realcurry #notcurryroux	1391517495	430681706249461760	f	domotaco
Snow...again?! We will be back on the streets tomorrow! Stay tune...	1391436923	430343764901494784	f	domotaco
@CDIdiamond where are you located?	1391196407	429334969253916672	f	domotaco
Grill on Wheels on 46th off 6th Ave today!! Open for lunch 	1392997320	436888541730459648	f	grillonwheelsny
Grill on Wheels at 36 st off Broadway! Open from 11:00-3:00crazy chickenbaby chickenlamb burgercouscous kofta kabab	1392909814	436521515157569537	f	grillonwheelsny
55th off Broadway today! Open for lunch at 11-3:00!	1392823084	436157746447400961	f	grillonwheelsny
Surprise, surprise! We're off the road today This weather bites!!	1392735014	435788351766282240	f	grillonwheelsny
Grill on Wheels on 46th off 6th Ave today!! Open for lunch 	1392651192	435436778800308224	f	grillonwheelsny
Happy valentines day to all\ngrill on wheels is off today see u all on  Monday 	1392388853	434336448003969024	f	grillonwheelsny
Grill on wheels off the road today \nBecause weather condition	1392305052	433984963101597696	f	grillonwheelsny
55th off Broadway today! Open for lunch at 11-3:00!	1392219314	433625348530782208	f	grillonwheelsny
Grill on Wheels is in Midtown! Parked on 47th off Park Ave today! #schnitzel #crazy chicken#falafel	1392133557	433265659577774080	f	grillonwheelsny
Parked on 46th off 6th today! Open for lunch at 11:00am!	1392045630	432896865366188032	f	grillonwheelsny
55th off Broadway today! Open for lunch at 11-3:00!	1391785161	431804380967231490	f	grillonwheelsny
schnitzel crazy chickensausagecouscous	1391699390	431444632115761152	f	grillonwheelsny
Grill on Wheels at 36 st off Broadway! Open from 11:00-3:00	1391698770	431442032301596674	f	grillonwheelsny
Grill on wheels off the road today \nBecause weather condition	1391611110	431074358115991552	f	grillonwheelsny
Grill on Wheels is in Midtown! Parked on 47th off Park Ave today! #schnitzel #crazy chicken#sausage	1391528519	430727943942590464	f	grillonwheelsny
Grill on Wheels will not be out today due to weather conditions.	1391432458	430325037678489600	f	grillonwheelsny
55th off Broadway today! Open for lunch at 11-3:00!	1391181441	429272196461367297	f	grillonwheelsny
46th off 6th today #shawarma #schnitzel #yummy	1391095273	428910782341189633	f	grillonwheelsny
@YeahThatsKosher yes that's the plan for our regular schedule. This week there may be changes because of the closures for Super Bowl week.	1391039345	428676199515435008	f	grillonwheelsny
55th off Broadway today! Open for lunch at 11-3:00!	1391008280	428545907215589376	f	grillonwheelsny
Officially sold out of ice cream! Thank you everyone for a great season!! #closed	1382307419	392051847542079488	f	itizyicecream
Greenwich and jay st TriBeCa is where we're at!	1382288993	391974563716030466	f	itizyicecream
Last day of the season!  Stop by for hazelnut ice cram and sorbets!  Sorbet pints on sale.  Limited quantity left, here til we sell out	1382288637	391973070702792704	f	itizyicecream
Final day in LIC!  Blowout sale on sorbet pints ($6.50) and ice cream pops ($1.50).   Stop by 47th rd and center blvd til 6:30 today.	1382201646	391608204112957440	f	itizyicecream
@rihannaftmalik land of blueberries!	1393347632	438357858275831808	f	waffletruck
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
Come get lunch @BrookfieldPLNY today from 1130-3!	1392999668	436898393945014273	f	morristruck
Hey! #Midtown! We're #BACK! 51st btw Park &amp; Mad for the most beautiful lunch you've had since the last time we served you a grilled cheese!	1392911867	436530127271649280	f	morristruck
Hey @DumboNYC, we're back! Come #EAT lunch at Front nr Washington! #missedyouguys	1392823975	436161480820797440	f	morristruck
No lunch today (can this be the last snow day, please?), but we'll see you in @DumboNYC tomorrow for lunch! #wereback	1392744281	435827221253849089	f	morristruck
No lunch today for #PresidentsDay, but we will be grilling cheese tonight @RoyalPalmsClub for #LeagueNight #PartyCheeseShuffle	1392652129	435440709462544384	f	morristruck
Got a sweet write up from our friends over @guruenergy, check it out! http://t.co/WqIMOLtC6R	1392408508	434418887174524928	f	morristruck
No @BrookfieldPLNY lot today, sorry folks! Have a great weekend!	1392393822	434357289919602688	f	morristruck
It might be #snowmageddon outside (no truck today, sorry!), but we braved the storm and made it to our pop-up in the @starrett601 building!	1392305593	433987231636668416	f	morristruck
Hey folks, we're doing a pop-up @DavidYurman HQ today, see you there! #staywarm	1392221111	433632888903319552	f	morristruck
@drinkofthevine Next week! We've missed you too!	1392145969	433317717991366656	f	morristruck
Come check us out today @NBCUniversal in Englewood, NJ! We'll be there from 11-3 #bigtimecheesin	1392134591	433269995875753984	f	morristruck
We're doing a pop-up in the #360i office today in TriBeCa. See ya there!	1392044529	432892250285424640	f	morristruck
@kellygiammanco @RollBrian @ItsFoodPorn YUM! Yeah we should!	1391879091	432198351803908096	f	morristruck
@radi0head Stay tuned!	1391795820	431849088808943616	f	morristruck
@aashi_123 We won't be, sorry! Stay tuned though, we'll be back in the hood very soon!	1391707115	431477030962880513	f	morristruck
@timetravelbeat: Taking another day off today for maintenance, sorry #midtown folks!	1391706392	431474000506925057	f	morristruck
Another crappy day, sorry @DumboNYC. We're just as bummed as you are- we miss you guys!	1391616046	431095059279134721	f	morristruck
Sorry folks, the roads are a bit better but still too much for this cheesy beast of a vehicle. Stay tuned for our next lunch service!	1391540367	430777638429278208	f	morristruck
No lunch today due to the weather- starting to worry that all these #snowdays are going to cut into our summer vacation!	1391441991	430365021504163842	f	morristruck
Last day of the #BudLightHotel! #PartyOn #EatCheese #itssuperbowltime	1391273466	429658176682983425	f	morristruck
RT @DispatchBP: . @BrookfieldPLNY SOUTH Lot | Fri., 2/21/14 | 11a-3pm | South End Ave. &amp; Vesey St. | @ToumNYC #foodtrucks #tgif	1393000225	436900727139893248	f	toumnyc
It's #FalafelFriday on South End Ave &amp; Vesey St! #vegan #falafel #LebaneseLunch #PleaseStopRaining http://t.co/VJtLD1oCJk	1392995516	436880977877807104	f	toumnyc
@MeganDo that looks delish! Bravo!!	1392995242	436879826973376513	f	toumnyc
@MeganDo Good job!! 	1392942209	436657392101904384	f	toumnyc
Deciding on lunch has never been easier! Join us at the @dumbolot on Jay &amp; Water for that #LebaneseLunch your tastebuds have been craving!	1392905163	436502007730696192	f	toumnyc
42 degrees?!? It feels like Spring to me... We'll take it! Join us for a #LebaneseLunch in #MidtownEast on 47th btwn Park &amp; Lexington 	1392822310	436154497174622208	f	toumnyc
@MeganDo yes exactly. Raw kefta on the pita and while it's grilling we add the veggies. Send us a pic of your masterpiece 	1392783461	435991553367355392	f	toumnyc
Sorry folks, where off the road yet again due to the weather. We hope to be back in #MidtownEast tomorrow! #30DaysUntilSpring	1392737559	435799026290933760	f	toumnyc
The WFC food truck lot is closed today, so we're going to enjoy an extra long weekend. See y'all on Tuesday. #HappyValentinesDay	1392387960	434332701475102721	f	toumnyc
@DaisyMaxey I hope it leaves and doesn't come back until 2015 :)	1392324438	434066270632570880	f	toumnyc
@DaisyMaxey we wish we could have made it out today :( we'll see you on Monday for sure!	1392321745	434054977498382336	f	toumnyc
We're snowed in today folks.... Will it ever stop snowing?!?! #MissingSpring	1392301947	433971939380826112	f	toumnyc
Don't let the burrrr stand in your way of a delicious lunch. Pre-order via 917-TOUM-350 &amp; pick up on 47th btwn Park &amp; Lexington!	1392226300	433654653407219712	f	toumnyc
The chicken #shawarma is getting ready for you in #MidtownWest on 46th btwn 5th &amp; 6th! @midtownlunch #LebaneseLunch http://t.co/HRqDVHXIqD	1392127308	433239449464745984	f	toumnyc
RT @nycfoodtruck: TY for sharing this list of easy ways to go deliciously meatless tnt @FoodToEat! @Nuchas @ToumNYC @TheSqueezeTruck @Kimch...	1392068503	432992804240121856	f	toumnyc
RT @dumbolot: Monday #funday with @ToumNYC @MexicoBlvd and @mooshugrill! @DUMBOFoodTrucks @DUMBOBID @DumboNYC	1392054115	432932455864356864	f	toumnyc
Start the week off right with a #LebaneseLunch! Join us on Jay &amp; Water St in #Dumbo #Brooklyn... 38 days until #Spring!	1392043386	432887456669913089	f	toumnyc
#FoodTruckFriday is in full effect in #FiDi on North End &amp; Vesey St. So is our catering! #Hummus  #CateredLunch http://t.co/21TYxROdEF	1391781404	431788622371880960	f	toumnyc
RT @dumbolot: #Slushtravaganza is over in the DUMBOlot and we got @MexicoBlvd and @ToumNYC to celebrate!	1391702235	431456563107495936	f	toumnyc
It's #ThirstyThursday in @DUMBOBID on Jay &amp; Water St. Come by to get a #free soda or water with every purchase of $10 or more  #Brooklyn	1391695402	431427903340154880	f	toumnyc
RT @serenityspeaks: Looking for a twist on a old time favorite #snack ? @BrooklynPopcorn has just what your looking for! #win http://t.co/G...	1393020997	436987854020182018	f	brooklynpopcorn
@omgstef we will have our new flavors for you to try when we return downtown !! They are delicious and NYC is loving them!	1393020834	436987167068672000	f	brooklynpopcorn
@omgstef Stefanie sorry we missed you!! We are in Midtown today. Follow us daily on Twitter/ Facebook for our location. See you soon! :)	1393020744	436986792244682752	f	brooklynpopcorn
RT @AmandaRipsam: @valmg @BrooklynPopcorn I love popcorn with lot's of sweet on it. I prefer kettle corn	1393016349	436968356692758528	f	brooklynpopcorn
RT @SearchWithVonni: Brooklyn Popcorn Giveaway | $20 Gift Card http://t.co/m78MYX7QOB #giveaways #foods #free #giftcards #giveaways	1393016296	436968133467713536	f	brooklynpopcorn
RT @valmg: How do you like your popcorn? Review of @BrooklynPopcorn Gourmet Flavored Popcorn http://t.co/YZZiLIKOzG http://t.co/vu7Ghq35QD	1393016276	436968051137712128	f	brooklynpopcorn
RT @TheWaytoHisHear: @BrooklynPopcorn That sounds delicious!	1393006990	436929100477775872	f	brooklynpopcorn
Hello 55th &amp; 6 Avenue! We brought you our newiest flavor Coconut Kettle Corn #popcorn plus all our other amazing flavors. See you soon !!	1393006318	436926284342755328	f	brooklynpopcorn
RT @BuddyDooRoo: Looking for a twist on a old time favorite #snack ? @BrooklynPopcorn has just what your looking for! #win http://t.co/ad9z...	1392994687	436877501306916865	f	brooklynpopcorn
RT @mirandaleigh81: #WIN a gift card to try out one of 16 different flavored @brooklynpopcorn tins of popcorn! http://t.co/uirJSKLCtJ	1392994681	436877473653874689	f	brooklynpopcorn
RT @SearchWithVonni: Traditional / unique flavored popcorn @BrooklynPopcorn! Delicious! #review #giftidea #movie http://t.co/2jqblRvVXq htt...	1392994670	436877429034848256	f	brooklynpopcorn
RT @SavyMommyMoment: Crunch, crunch! That's the sound of delicious @BrooklynPopcorn! #Giveaway! http://t.co/H758v4IRT2	1392821750	436152149513207809	f	brooklynpopcorn
RT @cheyenne_logan: If you love me you will find the @BrooklynPopcorn truck and bring me a can!! I'm craving their popcorn!!	1392821712	436151989009793025	f	brooklynpopcorn
Happy Tuesday #popcorn #truck is @ Beaver &amp; Broad St NYC. We are making Chocolate &amp; Caramel Coconut &amp; of course popular request KettleCorn!	1392744007	435826072433606656	f	brooklynpopcorn
Book your next Corporate Event, Baby Shower,Birthday Party or Festival.Get your party poppin' with Brooklyn Popcorn! http://t.co/TkhEPl29tj	1392678631	435551863186804737	f	brooklynpopcorn
Can you smell the Kettle corn #popcorn flavor yummy!!! Our #truck is making it fresh and everyone is loving it in SOHO!!	1392676958	435544848691499009	f	brooklynpopcorn
We just made a new flavor Chocolate Caramel Coconut WOW. Come and get it!!!!!....At Prince &amp; Broadway in SOHO!!	1392676756	435544000984907776	f	brooklynpopcorn
Happy Presidents Day NYC our #popcorn #truck is parked on Prince &amp; Broadway in SOHO today!! Come get your favorite flavor!! See you soon :)	1392654329	435449935836626944	f	brooklynpopcorn
Good morning NYC our #popcorn #truck is parked on Prince and Broadway in SOHO today Sunday! See you soon!	1392574428	435114808120053760	f	brooklynpopcorn
Happy Valentines Day NYC! We are on 55th &amp; 6th Avenue today! #popcorn #truck. See you soon!!	1392404084	434400333263937536	f	brooklynpopcorn
46th and park, right where the final battle in the Avengers movie happened.	1392998166	436892091864866816	f	nautimobile
Finally got a spot back at 23rd and Park! Celebrity guest on staff today if you are very, very easily impressed. Guess who?	1392913409	436536596784226304	f	nautimobile
@heymikewaskom real talk	1392776901	435964039404204032	f	nautimobile
Btw guys, we were kidding, Subway is inedible rubbish. For real, just goto @TheSteelCart , but you knew that already #plzdonteatfresh	1392776703	435963210777526272	f	nautimobile
@TheSteelCart yeaa! Actually subway is the worst. We just learned they put yoga mat rubber in their bread.	1392776501	435962360059400192	f	nautimobile
We are off tomorrow for an event, back to 23rd &amp; park on Thurs. Might we suggest taking advantage of FebruAny in our absence? #eatfresh	1392771909	435943099614117888	f	nautimobile
If you haven't heard about @RoyalPalmsClub yet, check this out http://t.co/PgLvZRNdTV	1392685270	435579711876784128	f	nautimobile
How excited are we to be serving at the grand opening of the @RoyalPalmsClub in Brooklyn this Wednesday night? Pretty darn... Prettty darn	1392685136	435579147809980416	f	nautimobile
Excited for the big @RondaRousey fight this Saturday? Us truck people sure are. Talkin' girl fights on Broadway btw Spring and Prince	1392572895	435108375459020800	f	nautimobile
@smacks222 yep! 11-4	1392499396	434800100624588802	f	nautimobile
@smacks222 ayeee! We won't be here on Monday but we will be on weekends!	1392492850	434772643800444929	f	nautimobile
@benwietmarschen thanks man, means a lot, appreciate it, thank you.	1392492794	434772407422046209	f	nautimobile
@justintravis let's say 4:30ish?	1392492778	434772342494203904	f	nautimobile
@NautiMobile	1392482103	434727567229472769	f	nautimobile
Broadway between Prince and Spring today. Those are all very handsome sounding street names.	1392473588	434691853120577536	f	nautimobile
@sosaleydi we're here! And we will be here until 3!	1392395227	434363183433007104	f	nautimobile
1 truck, 3 hearts..They beat as one;bound by their interminable love of seafood sandwich service. A very special Valentines Day at 46th&amp;Park	1392395191	434363030106030081	f	nautimobile
We're still on for 46th and park tomorrow, weather be damned	1392344678	434151165635604480	f	nautimobile
@DBorgesJr Seriously! This winter is killing us!	1392313982	434022416315342851	f	nautimobile
Technical difficulties got the best of us today, and looks like we are off for snow tomorrow. Back at 46th and park Friday!	1392226879	433657079736565760	f	nautimobile
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
50th st btwn 6th and 7th ave is where you want to be for some hot buns today !	1382536034	393010731006058496	f	funbunsnyc
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
Rawr! 47th and Park.	1384362059	400669632513593344	f	toastmonsternyc
BEAT THE RAIN!  Give us a call for p/up or Deliveries from Yonkers location. 914-457-4324. 634 McLean Ave,... http://t.co/BZgMzOzYLQ	1392830075	436187066913677312	f	mrniceguytruck
BEAT THE RAIN!  Give us a call for p/up or Deliveries from Yonkers location. 914-457-4324. 634 McLean... http://t.co/PywOXhbI9o	1392830071	436187049759363073	f	mrniceguytruck
by @sana_ny "After a long ass weekend of moving in a #snowstorm we decided to treat ourselves to the... http://t.co/uDBvG2wxHN	1392593858	435196302218235904	f	mrniceguytruck
BOTH!&gt;&gt;&gt;@TezzaNYM: @MrNiceGuyTruck You on @Seamless  or @GrubHub?	1392579860	435137589914636288	f	mrniceguytruck
RT @TezzaNYM: About to murder these! Thanks @MrNiceGuyTruck #SoGood http://t.co/kLgZXty4Yg	1392579845	435137525829484544	f	mrniceguytruck
RT @HarboringHearts: Big thanks to @KINDsnacks, @GoGoSqueeZ, @MrNiceGuyTruck for making yesterday's party @Montefiore delicious and fun! ht...	1392579833	435137478388092928	f	mrniceguytruck
by jules1280 "mrniceguytruck time, with some #Imperial &amp;#sexandthecity marathon  #puravida #sliders... http://t.co/aaKMmp8U7W	1392579771	435137214406987776	f	mrniceguytruck
#JokeOfTheDay Q: When a pizza goes to a club, what mixed drink does it order? A: A Neapolitan!	1392923103	436577256476270592	f	neaexpress
by @dyckmanbar "by kennyskitchen "No artificial coloring. #nofilter" cheffin up that home made slaw" http://t.co/LlHpCiNZft	1392573656	435111566221279232	f	mrniceguytruck
Slider Nation! We are open for your Sunday slider, wing, &amp; fries, fix! Check us on grub hub &amp; seamless... http://t.co/oQk1zmoTD8	1392571678	435103271888650241	f	mrniceguytruck
Delivery till 8pm tonight. Call ahead for pickups and takeout. 914-457-4324	1392142281	433302251986501632	f	mrniceguytruck
It's not too late to get your Super Bowl orders in for pick up or delivery.  Don't miss kick off waiting for... http://t.co/1YvaWFn70W	1391274349	429661881574621184	f	mrniceguytruck
Open everyday for lunch and dinner at 634 McLean Avenue in Yonkers - stop in or give us a call at: (914) 457-4324... http://t.co/l1bQOlWwjP	1390577295	426738222505267200	f	mrniceguytruck
Check out our full Menu - Call us and we'll deliver your favorite Sliders: 914-457-4324 http://t.co/CqKdp97kAO	1390436040	426145756920442880	f	mrniceguytruck
Spicy Buffalo wings and Fries with Sracha-up dipping sauce will definitely keep you warm today!  Call... http://t.co/9GKvXQ3EKJ	1390322130	425667981990178816	f	mrniceguytruck
#SliderWingNation. by @dyckmanbar "Super Bowl live at DB SUN 2/2 mrniceguytruck on site for those... http://t.co/AaLfKazsyG	1390242002	425331903466835968	f	mrniceguytruck
#MNG SuperBowl Catering. Pre-order today! Free delivery. Call us at 914-457-4324 or email... http://t.co/eINktL0KGR	1390183743	425087546553823232	f	mrniceguytruck
Check us out today. 634 McLean Ave Yonkers NY. Sliders Wings and Fries on the menu. Call us for p/u or... http://t.co/3X5UpEFCN1	1390064172	424586028704595968	f	mrniceguytruck
634 McLean Ave Yonerks NY. Come check us out. Sliders Wings Fries. 914-457-4324 for p/u and delivery http://t.co/itOSNiGf6Z	1390063698	424584043142057984	f	mrniceguytruck
Mr Nice Guy Proudly serving Freshly Baked Brioche buns Daily!  Get some today on the truck at 50th N... http://t.co/V7AgDab30E	1389973927	424207516441272320	f	mrniceguytruck
RT @ShanghaiMKS: If these descriptions of @MrNiceGuyTruck's food doesn't get your hungry, we don't know what will! http://t.co/lqGpaldnGC	1389937487	424054674896195584	f	mrniceguytruck
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
@drateberry you can contact us, we would love to talk to you! Email us at franchise@neapolitanexpress.com @boonepickens	1393034986	437046527677448193	f	neaexpress
Check out this video of us a year ago today! #timeflies http://t.co/JQsoqRZ2vZ	1393029053	437021641454141441	f	neaexpress
#DidYouKnow the emissions we reduced this year are equal to taking 49 vehicles off the road #oneyear	1393021214	436988763852775424	f	neaexpress
Thank you @greenaltsystems !	1393012605	436952653214793729	f	neaexpress
If you share the same #birthday as us, then you can hop on these b-day freebies right now! http://t.co/rTttrqex0q	1393009351	436939007164153856	f	neaexpress
#DidYouKnow in our year on the road we were able to displace over 159 tons of #GreenhouseGas emissions? #CleanAir for #NYC	1393007433	436930960538763264	f	neaexpress
Thank you @heidelindgren !	1393002194	436908985288249344	f	neaexpress
RT @heidelindgren: Gotta take a little break from my social media hiatus to congratulate the amazing @CrespoMax and @NeaExpress on 1 YEAR!!...	1393001343	436905418678607872	f	neaexpress
#DidYouKnow our year of operating with #cleanenergy is equal to planting over 6,000 trees? @CE_NatGas	1392992150	436866859284312065	f	neaexpress
#FBF to our launch with @MikeBloomberg , @boonepickens &amp; @CE_NatGas one year ago today! http://t.co/GTwesoIz30	1392984925	436836554133479424	f	neaexpress
Miss the Olympics last night? Get all the up to date news from @nytimes http://t.co/LlQO6qI7WK	1392941731	436655386574479360	f	neaexpress
It's beer week in #NYC! Check out the @ThrillistNYC matrix on the spots to hit http://t.co/yKGYFo4MeJ	1392931219	436611294561845248	f	neaexpress
Watch out for flooding. It's happening all over thawing cities #NewYork #snow http://t.co/3khl27G5aY	1392926570	436591797050281984	f	neaexpress
Come work for us! We are hiring. Contact us at work@neapolitanexpress.com	1392920706	436567201198641152	f	neaexpress
Open for business at 52nd and Park	1392916050	436547673601355776	f	neaexpress
RT @Gothamist: Skyscraper Shadows Will Not Harm Central Park, Developer Promises http://t.co/3Nda7s3nQx	1392911952	436530484089462784	f	neaexpress
It's a beautiful day in #NYC ! Enjoy the #sun while it lasts 	1392905224	436502266817040384	f	neaexpress
Some people got very creative on their #snow days http://t.co/Hg5EQrLbyK	1392854460	436289345717555200	f	neaexpress
Looking to invest? Why you should add #NaturalGas to your portfolio http://t.co/I2uxmYt9Ix	1392849913	436270275001593856	f	neaexpress
Happy friday!\nBobjo truck open at Varick and king st today!\nTry our ramen noodle soup! \nBobjo express open at 47&amp;park. \nTHANKS!	1393003842	436915897098579968	f	bobjotruck
Bobjo express will stay at watet and hanover sq today!\nThanks!	1392917289	436552867764113408	f	bobjotruck
Hello flatiron!\nBobjo truck open at 22sy &amp; 5th ave today!\nTry our rice platter and ramen noodle soup.\nThanks!	1392917224	436552595088220160	f	bobjotruck
Hello ny, happy friday!\nBobjo truck open at varick and king st today.\nTry our ramen noodle soup and rice platter.\nExpress stay at park&amp; 47.	1392396730	434369486771470337	f	bobjotruck
Good morning nyc ! We are stay at Broadway and 55th st between 56th st. Try our ramen noodle soup and rice platter. Thanks!!	1392223897	433644574607544320	f	bobjotruck
Bobjo express open at State st &amp; whitehall st today. \nThanks!	1392137427	433281890515419136	f	bobjotruck
Good morning ny!\nBobjo truck open at water st&amp;Hanover sq today!\nTry our ramen noodle soup and rice platter. It's will make u warm and happy!	1392137358	433281599661015041	f	bobjotruck
Bobjo express stay at State st &amp; whitehall st today thx!! :)	1392051785	432922683333152768	f	bobjotruck
GooD morning NYC ! Bob Jo truck at 46th st and 6thave between 5th ave. Try our ramen noodle soup and platter !thank you.	1392051659	432922152451727360	f	bobjotruck
Bobjo express stay at park &amp; 47st today!\nThanks ny!	1391791425	431830653043089410	f	bobjotruck
Welcome to friday!\nBobjo truck open at Varick st &amp; King st today.\nHot ramen noodle soup will make u warm and try our fresh cook dumpling.	1391791383	431830478367096832	f	bobjotruck
Bobjo express at water and hanover sq.\nThanks#	1391705324	431469521464213504	f	bobjotruck
Hello, flatiron!\nBobjo truck open at 5ave &amp; 22st today!\nWe serve hot ramen noodle soup and rice platter!\nMake u warm today!\nThanks!	1391705285	431469354434441216	f	bobjotruck
And Bobjo express stay at State st &amp; whitehall st today. \nThanks!	1391531220	430739274812887040	f	bobjotruck
Hello,ny! \nWe are open at downtown today. \nLocated in Water st&amp;Hanover sq.\nTry our ramen noodle and rice platter with fresh cook dumpling!	1391531129	430738890958577664	f	bobjotruck
Bobjo express stay at State st &amp; whitehall st.\nTry our ramen and platter!\nThanks!	1391445992	430381803216863232	f	bobjotruck
Good morning new york !!! We r stay at 46th between 5th ave. And 6th ave. Try our ramen noodle soup. Thanks :)	1391445575	430380052887662592	f	bobjotruck
BOBJO express ? : park ave. and 47st. - -Catch me if u hungry.	1391186855	429294904381308928	f	bobjotruck
Hello New York , happy Friday ! Bobjo truck stay at varick and king. Plz stop by try our ramen noodle soup and rice platter. Thank you!!	1391186628	429293951221522433	f	bobjotruck
Bobjo express at watet and hanover sq today!\nThanks!	1391103188	428943977837248512	f	bobjotruck
Hear hear! RT @LauraPorterHaub: @milktrucknyc makes a Friday even better!	1393004934	436920480290070528	f	milktrucknyc
Bessie's at Wall &amp; William, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always at @houstonhallnyc	1392998592	436893879670165505	f	milktrucknyc
Bessie's at North End Ave &amp; Vesey, call (646) 504-6455 to pre-order or http://t.co/IwkqcCHPzF. Sandwich menu always at @houstonhallnyc	1392906623	436508130990518273	f	milktrucknyc
bessie's going strong to 58th &amp; madison. pre-order @ 6465056455 or http://t.co/IwkqcCHPzF. sandwich menus always @houstonhallnyc	1392820881	436148503304105985	f	milktrucknyc
snow man with boy hands #warbyparkersnowkit http://t.co/OGvpDCG0GM	1392736533	435794724273025025	f	milktrucknyc
snow or no, bessie's headed to 25th &amp; PAS. pre-order @ 6465056455 or http://t.co/IwkqcCHPzF\nsandwich menu always @houstonhallnyc	1392734299	435785353673191425	f	milktrucknyc
truck is headed to columbia today. pre order at 6465046455 or http://t.co/psDZsxYjzF. sandwich menu always @houstonhallnyc	1392652877	435443846336741376	f	milktrucknyc
Indoor stand at @bkflea @smorgasburg winter market, North 5th &amp; Wythe. Sandwich menu always at @houstonhallnyc	1392561017	435058555096272897	f	milktrucknyc
Indoor stand at @bkflea @smorgasburg winter market, North 5th &amp; Wythe. Sandwich menu always at @houstonhallnyc	1392474615	434696159529947137	f	milktrucknyc
Bessie's at TriBeCa, Greenwich &amp; Chambers. Call (646) 504-6455 to pre-order or @FoodtoEat.com to #skiptheline	1392474615	434696158745620484	f	milktrucknyc
RT @nycfoodtruck: "The History of the Grilled Cheese Sandwich": http://t.co/8HzrMeHXie via @TLC cc: @GCNYC1 @MorrisTruck @MilkTruckNYC #gri...	1392406964	434412410133569536	f	milktrucknyc
Happy V-Day! Bessie's at Wall &amp; William, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always at @houstonhallnyc	1392388214	434333766761209859	f	milktrucknyc
Bessie's taking a snow day today and will off the road, hope everyone's staying warm!	1392301812	433971371891118080	f	milktrucknyc
@Cheerios47 sorry, we left for the day. hours are usually 10am-3pm. catch us next week!	1392242301	433721766062882818	f	milktrucknyc
Bessie's at 58th &amp; Mad, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always at @houstonhallnyc	1392215410	433608977381728258	f	milktrucknyc
@jbakernyc yes during the school year.	1392137838	433283613619408897	f	milktrucknyc
@jbakernyc think next mon. is prez. day. not sure we'll be there.	1392129362	433248064808054784	f	milktrucknyc
Bessie's at 25th &amp; Park, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always at @houstonhallnyc	1392129009	433246584491364354	f	milktrucknyc
Happy Monday! Bessie's back at @Columbia. Call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always at @houstonhallnyc	1392042608	432884192209145856	f	milktrucknyc
Indoor stand at @bkflea @smorgasburg winter market, North 5th &amp; Wythe. Sandwich menu always at @houstonhallnyc	1391956206	432521794801524738	f	milktrucknyc
Check us out on Grub Street!!!  RT  101 amazing American doughnut shops with serious street cred: http://t.co/P2jQDU4KMs	1393001830	436907462059626496	f	carpedonutnyc
Slinging donuts left and right at 55th and Broadway. Stop by before we close at 5:30pm.	1393001368	436905520893812736	f	carpedonutnyc
RT @grubstreet: 101 amazing American doughnut shops with serious street cred: http://t.co/Rj2omIGXkY	1392928505	436599914043559936	f	carpedonutnyc
@KathleenMassara we're planning on being at 51st and park tomorrow and 55th and Broadway on Friday! See you there?	1392843167	436241978700070913	f	carpedonutnyc
We know it's been a while since we were last in the city, but we're back in action! Located at 23rd and Park until 5:30 pm today.	1392813603	436117980041461760	f	carpedonutnyc
If there's a Mr. Gunnarsson reading this, please come back to the truck. You left something here!	1392669683	435514336111779841	f	carpedonutnyc
Now open at Court and Bergen! Recover from your mini hibernation with a hot fresh donut. Here until 5:30	1392644166	435407306961199104	f	carpedonutnyc
We're ready for you, Flatiron. Laugh in Mother Nature's face with a hot donut in hand. At 23rd and Park until 5:30 today.	1392209525	433584290384072704	f	carpedonutnyc
We're wrapping up here in Williamsburg, but you still have time to head on over to @CityReliquary for their lovely donut exhibit! Do it!	1391981365	432627318050553857	f	carpedonutnyc
Trying a new place today, corner of Metropolitan and Havemeyer, come for hot donuts and coffee, if your in Williamsburg you have in excuse!	1391951103	432500391352475648	f	carpedonutnyc
Trying a new place today, corner of Metropolitan and Havemeyer	1391950837	432499275940245505	f	carpedonutnyc
Hey, guys! It's donut time at Bergen and Court. Closing at 4:30 pm, plus we might not be back here tomorrow so get your fill today!	1391875126	432181721799618560	f	carpedonutnyc
@lovelynitemusic You are VERY welcome!	1391873885	432176517553352704	f	carpedonutnyc
Now open at 51stand Park, you have until 5:30pm to get yourself a delicious donut!	1391777689	431773038749966336	f	carpedonutnyc
Fresh hot donuts at 55th and Broadway. Open till 5:30!	1391693155	431418479963799552	f	carpedonutnyc
Fun fact: Cider donuts make an excellent Super Bowl snack. Open at Bergen and Court today until 3pm !	1391361854	430028903630270464	f	carpedonutnyc
@goodgirlvenice Until 5:30 today! But come earlier in case we run out.	1391289739	429726430843641856	f	carpedonutnyc
If today's not perfect donut weather, I don't know what is. Come on by at Bergen and Court streets in BK!	1391279092	429681773875040256	f	carpedonutnyc
@AndrewS653 Yes, sir!	1391276885	429672518367334400	f	carpedonutnyc
Come by 55th and Broadway for some hot donuts, hot coffee, and hot cider! Or brave the cold without something to warm you up. Your choice.	1391173993	429240957125816320	f	carpedonutnyc
See you tonight @WebsterHall Valduccis and "Rhye with Ricky Eat Acid" music and pizza!	1393031556	437032137968324608	f	valduccis
@starrett601  sorry we couldn't make it today. Next week try one free http://t.co/hnUvYPKSWi	1393001007	436904008452931584	f	valduccis
RT @starrett601: Fill up on tacos, sliders, sushi, soups &amp; salads for lunch. No @Valduccis today - updated food schedule &amp; menus at http://...	1393000773	436903027308765184	f	valduccis
This is the year of the horse! #horse #2014 http://t.co/tDrbH5dGtW	1392939749	436647071849119744	f	valduccis
Making some sauce #food porn http://t.co/EaY6NkxuRi	1392905877	436505003331964928	f	valduccis
This weather is a Joke er http://t.co/jQFJOQESEo	1392840092	436229082981105664	f	valduccis
RT @john1966olsen: @Valduccis Wauu....cute store ! :-) Parma ham...namnam...have a good day too NY :-)	1392823000	436157391370203136	f	valduccis
My family started in a little store in the Brooklyn Navy Yards http://t.co/L6Eay9zASV	1392822899	436156969133809664	f	valduccis
RT @KingsDreamer: @Valduccis Hahaha,,,that was funny when all the Stars kept comming out with the $100 they owed him for the bets he made l...	1392813823	436118899508391936	f	valduccis
Mike Tyson should of had a meatball sandwich ! http://t.co/npVU7JkjDe	1392782435	435987251416563712	f	valduccis
http://t.co/r8YQwjljIH	1392782312	435986734682497024	f	valduccis
RT @PolishCuisine: @Valduccis once we are rolling out and fully firing the grill- we'll send it express! Don't forget to send us your delic...	1392762945	435905503768903680	f	valduccis
RT @grubstreet: Here's the cover for @LuckyPeach's 'Street Food' Issue: http://t.co/AS0S94TZno http://t.co/bZ1YOvuh6l	1392758869	435888407278272512	f	valduccis
@nycfoodtruck @EddiesPizzaNY In @Valduccis opinion nothing beats a NYPizza, thincrust,sicilian, or grandma,NYPizza is original and delicious	1392750951	435855196350980096	f	valduccis
The Tonight Show was great last night @jimmyfallon @ladygaga! http://t.co/fWpYMv3MzQ	1392743160	435822520961597441	f	valduccis
This is what I'm craving for lunch! Can you deliver it to Staten Island @polishcuisine? #deicious http://t.co/4DD6AS4pna	1392740349	435810730273939456	f	valduccis
Mr NY Derek Jeter http://t.co/3AWEHfrYo5	1392734603	435786630168068096	f	valduccis
Happy Presidents' Day  be safe and warm	1392649392	435429226314219520	f	valduccis
RT @ElvisDuranShow: Good Morning Everyone! Happy Presidents Day!	1392649249	435428627820605441	f	valduccis
@Valduccis @allthingschina After wedding parties are our specialty! Pizza, Zepolle, Candy Apples! We do it all! http://t.co/MA9we3Tf1Y	1392561576	435060899900956673	f	valduccis
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
Midtown! It's happening. 46th St btwn 6th &amp; 7th Aves. See you there for lunch &lt;3	1392997733	436890276549120000	f	mexicoblvd
Listen up! Blend truck is on the corner of 55th and broadway! Only 1 more week after this one =( hurry up and #TreatYourself	1382458468	392685393621291009	f	blend_express
55th and broadway!!! Come one come all!!	1382029993	390888242075418624	f	blend_express
We here on 21st and 5th avenue Our last month come and TREAT YOURSELF !	1381855922	390158135572582400	f	blend_express
Come see us we're on 5thave bwtn 22th and 21st! Remember our last day is oct 31 so there only a few weeks left to #TreatYourself	1381422440	388339977010286592	f	blend_express
If you're by 17th st and 5th that where you can find the blend truck! Its our last month so take advantage and #TreatYourself	1381335302	387974494339739649	f	blend_express
Good afternoon hungry ppl! Its lunch time! We're parked on 5th ave betn 21st and 20th st. If you near by, come by to #TreatYourself	1379605125	380717606862589952	f	blend_express
For today were on Park ave between 47th and 48th !!!!  #TreatYourself	1379000902	378183310054547456	f	blend_express
On broadway bwtn 55th and 56th st!! This is the only day of the week u can get it here so come by and #TreatYourself	1378829866	377465933251739649	f	blend_express
Come feel the heat on this most beautiful day today! 50th Street btwn 6th and 7th Avenue, 11a-2:30p. Preorders call 646-543-BIGD	1392910055	436522526928539648	f	bigdsgrub
Lunch will be served at 50th Street btwn 6th and 7th Avenue today! Preorders call 646-543-BIGD #MidtownWest	1392907036	436509863553015808	f	bigdsgrub
@rippleintime17: @bigdsgrub I'm still coming! YAY! Rain ain't got nuttin' on YOU!! Preorders call 646-543-BIGD	1392831793	436194272346640385	f	bigdsgrub
Don't let the rain come between you and what you crave!	1392829715	436185558516514816	f	bigdsgrub
Come n' Grub at 50th Street btwn 6th and 7th Avenue, now till' 2:30pm. Preorders call 646-543-BIGD. Operators are standing by!	1392827014	436174227855921152	f	bigdsgrub
We've landed on 50th Street btwn 6th and 7th Avenue today for lunch! #MidtownWest #RingOFireChili	1392820129	436145351595409408	f	bigdsgrub
This is a steal on Plum District: "Only $139! 2 Round-Trip Airfare + Tickets to #Disneyland or #DisneyWorld" http://t.co/nu25M6FAj5	1392818225	436137363291774976	f	bigdsgrub
RT @NomWah: Pork buns. Pork buns. Pork. Buns.  #chasiubao #kitchenprep #dimsum #chinatown #newyork http://t.co/sfE9WJOXbi http://t.co/7kTKC...	1392733714	435782899636633601	f	bigdsgrub
Mo' snow...Mo' problems!\nNo truck today, stay safe &amp; warm NYC.\n#AintNobodyGotTimeForSnow	1392728924	435762808756920320	f	bigdsgrub
No more #snow....PLEASE!!!	1392676404	435542523738877952	f	bigdsgrub
RT @NomWah: This long weekend @ChinatownNYC has a great initiative! Click through for details: http://t.co/wctD54HNBj #chinatown http://t.c...	1392405929	434408071176392704	f	bigdsgrub
RT @nystfood: Next week @nystfood will be back with news and reviews.  Please RT	1392392229	434350609622638592	f	bigdsgrub
Such a beautiful day today\n#Love MUST be in the air!\n#HappyValentinesDay!!! \n#TGIF	1392389361	434338578324520960	f	bigdsgrub
Happy Valentines Day!! #HappyValentinesDay http://t.co/ktSedkSXW3	1392387611	434331240469368833	f	bigdsgrub
RT @nycfoodtruck: Mad respect! RT @FoodtoEat: These Eye-Opening Facts Will Give You a New Respect for #FoodTrucks http://t.co/st2ytBIK3y vi...	1392315586	434029145358860288	f	bigdsgrub
Closed due to bad driving conditions. Be safe and stay warm!!	1392307299	433994384351457280	f	bigdsgrub
RT @backstagekid: @bigdsgrub whew that chili burns.....so good!	1392242336	433721910036557824	f	bigdsgrub
#ValentinesDay came early today! Much love, thank you!!! http://t.co/jiKn7ftCTk	1392232526	433680765734625281	f	bigdsgrub
@bxirishmomo4: @bigdsgrub chili is slam min' and those chips-genius! #lunchlove #hhd YAY! #nom 	1392232399	433680233863323648	f	bigdsgrub
RT @FoodtoEat: Preorder w/ #FoodtoEat: http://t.co/mClUBQLKqe RT @bigdsgrub Meet me for lunch today, 50th St b/t 6&amp;7 Ave, 11-2:30pm #RingOF...	1392223820	433644251428450305	f	bigdsgrub
Our truck ran into a pothole on Wednesday night, and we're still trying to fix it. Oy! No truck today!!!	1392988779	436852719446663168	f	thetreatstruck
Last night our truck drove over a pothole and now has a limp, our mechanic is on the case! Sorry, we'll miss our spots today.	1392920949	436568222528045057	f	thetreatstruck
!!! Wed, Feb 19th our truck going to a private event, but we'll be back to our regular spots tomorrow! Have a great day!!!	1392823297	436158639066591232	f	thetreatstruck
!!! Snow! No truck today...we'll be back tomorrow! our shop open today 7:30am-8pm w/food &amp; treats &amp; hot choc!!!	1392726761	435753739002327040	f	thetreatstruck
!!! Monday, Feb 17th no truck today! Our shop open 7:30am-8pm w/food &amp; treats &amp; plenty of crayons &amp; stickers, hooray!!!	1392639575	435388052002058240	f	thetreatstruck
Sun, Feb 16th no truck today! Our shop #brooklyn 521 Court st #carrollgardens 8am-6pm w/food &amp; treats!!!	1392557100	435042126876143616	f	thetreatstruck
Sat, Feb 15th no truck today! Our shop in Brooklyn open 8am-7pm tonight w/food, #counterculturecoffee, hot chocolate &amp; treats!!!	1392467326	434665586619334656	f	thetreatstruck
Just opened at 18th st &amp; 7th ave!!! Valentine's Day cookies and lots of treats! Here 'til 6:30pm! Have a great Valentine's Day!!!	1392412846	434437080283086849	f	thetreatstruck
!!! Fri, Feb 14th 12:30-3:30 45th &amp; 6th, then 18th st &amp; 7th ave 4:30-6:30! Happy Valentine's Day!!!	1392397452	434372516371775490	f	thetreatstruck
We'll post our spots a little later this morning!	1392385472	434322266504310784	f	thetreatstruck
Happy Valentine's Day! The city looks like it is covered in powdered sugar and the sun is shining! Hooray!!!	1392385445	434322155959242752	f	thetreatstruck
Waiting to see how the snow and rain look towards afternoon...oooo, will our truck be able to go to our UWS spot?!!!	1392306563	433991300338425856	f	thetreatstruck
Valentine's Day cookies! Coconut Mitch cookies! Chocolate chippers! Brownies, crispies! Lots of treats! Hooray!	1392225955	433653205604786176	f	thetreatstruck
!!! Wed,Feb 12th 12-3:30 45th &amp; 6th, then 4:15-7pm 18th st &amp; 7th ave!!!	1392219158	433624697662889984	f	thetreatstruck
!!! Tues, Feb 11th 12:30-2:30 17th st &amp; 5th ave!!!	1392140170	433293397512556544	f	thetreatstruck
We're loading up and on our way to a lunch time spot! We'll let you know soon!!!	1392136400	433277582209859584	f	thetreatstruck
Valentine's Day treats this week at the truck and the shop! You can also place special orders for pick up or delivery!!!	1392069263	432995992573870080	f	thetreatstruck
Happy Sunday! Our shop open 8am-6pm today!!!	1391953715	432511347054891008	f	thetreatstruck
!!! No truck this weekend. Our shop open Sat 8am-7pm &amp; Sun 8am-6pm w/food &amp; #counterculturecoffee &amp; treats!!! 521 Court St Bklyn!	1391869231	432156993802207232	f	thetreatstruck
4-7pm 18th st &amp; 7th ave!!!	1391807359	431897486576607232	f	thetreatstruck
Preorder is still available via our lovely website :) http://t.co/aAbStQP4UO Come pick it up &amp; say hi #Midtown 46th &amp; 6th	1393000078	436900113177673728	f	mexicoblvd
You know what would make this nice day nicer, #DUMBO? If you came and joined us for lunch today on Jay &amp; Water St We'll be here til 2:30 :)	1392914736	436542159974830080	f	mexicoblvd
RT @RoamingHunger: Gluten free &amp; Mexican food is NOT an oxymoron for Mexican Blvd. truck &amp; lucky New Yorkers! @MexicoBlvd @nycfoodtruck htt...	1392857163	436300684619952129	f	mexicoblvd
RT @DispatchNY: . @BrookfieldPlNY NORTH Lot | Wed., 2/19/14 | Open until 3pm. | North End Ave/Vesey St. | @MexicoBlvd &amp; @MamuThaiNoodle #bp...	1392833627	436201966155628545	f	mexicoblvd
We are at the world financial center! 1 north end ave &amp; vesey street.\n\n12:00-2:30	1392828762	436181560283242497	f	mexicoblvd
RT @DispatchBP: . @BrookfieldPlNY NORTH Lot | Wed., 2/19/14 | 11a-3pm | North End Ave. &amp; Vesey St. | @MexicoBlvd &amp; @MamuThaiNoodle #battery...	1392827939	436178108698603520	f	mexicoblvd
RT @DispatchNY: . @BrookfieldPlNY NORTH Lot | Wed., 2/19/14 | 11a-3pm | North End Ave. &amp; Vesey St. | @MexicoBlvd &amp; @MamuThaiNoodle #battery...	1392827934	436178089266405377	f	mexicoblvd
Tonight you can find us at the @RoyalPalmsClub #Shuffleboard court :) 514 Union St #Brooklyn  6-11:30pm	1392759979	435893065300328448	f	mexicoblvd
@CarnivoreGal no :( we will be back tomorrow. We are at the Brooklyn shuffle board club tonight	1392758513	435886914290601984	f	mexicoblvd
Come treat yourself to a good meal :) #Midtown on 46th St btwn 6th &amp; 7th Avenues! #getinmybelly #sofresh #muydelicioso	1392741280	435814635384864768	f	mexicoblvd
No truck today :( sorry #brooklyn #DUMBO	1392655073	435453053899399171	f	mexicoblvd
Come down to #tacolovetruck and get your office crush some crispy cheese! 46th btw. 6th &amp; 7th!	1392396871	434370076306075648	f	mexicoblvd
Don't wait In the cold! Order online at http://t.co/aAbStQP4UO or. Call us! (646) 678-0976 we will have it ready for you!	1392396814	434369840955293696	f	mexicoblvd
@luisneiman yes you can!	1392396747	434369556514344960	f	mexicoblvd
We shoveled the sidewalk for you, loves! Come enjoy a romantic lunch with us, your valentine, on 46th St btwn 6th &amp; 7th Aves #xxxspicy	1392388677	434335708648865793	f	mexicoblvd
Do not worry #midtown this weather is not stopping us from feeding you! Parked at 46th btw. 6th &amp; 7th	1392378746	434294056207015936	f	mexicoblvd
Snow snow snow no truck :(	1392309691	434004417046913024	f	mexicoblvd
RT @MarioWilkowski: @MexicoBlvd Cold weather can't stop u. Thx for coming back to WFC! Thx u weatherman for delaying snowstorm til Thurs!. ...	1392254009	433770870998585344	f	mexicoblvd
@MarioWilkowski srsly... Tis was too long without our beloved WFC crew	1392254006	433770857786523648	f	mexicoblvd
@crimsong19 Thanks for stopping by!	1393014818	436961937289916416	f	nuchasnyc
RT @crimsong19: In the city for a few things, so I treated myself to some @nuchasnyc. It's been months since I've had empanadas! #hungryfoo...	1393014809	436961896965885952	f	nuchasnyc
How To Make #Empanadas - Photo Gallery | SAVEUR http://t.co/Wn9QSVHTHt via @saveurmag	1393013410	436956028929052672	f	nuchasnyc
@SaintJamestown thanks for stopping by!	1393009084	436937884424486912	f	nuchasnyc
RT @SaintJamestown: Just grabbed lunch on-the-fly, a delicious mushroom empanada from @NuchasNYC and it was SO GOOD. Exactly what I wanted....	1393009070	436937825708437504	f	nuchasnyc
@AppNexus Enjoy! And don't forget to send us photos!	1393006484	436926979057917953	f	nuchasnyc
RT @AppNexus: No need to hit the food truck today, .@NuchasNYC is coming to us! #FamilyLunch	1393006458	436926873265012736	f	nuchasnyc
Raise your empanadas for #TeamArgentina Were proud of you! http://t.co/pZEy08a36R	1393000301	436901046049591296	f	nuchasnyc
@AppNexus Can't wait to see you all there.  Thank's for having us, literally!!!	1392994038	436874777366917120	f	nuchasnyc
RT @FoodtoEat: Preorder ur #empanada dinner online here: http://t.co/QKdV9736Dt RT @NuchasNYC Who's ready for #dinner? We're parked on 14th...	1392935388	436628781860933633	f	nuchasnyc
Who's ready for #dinner? We're parked on 14th &amp; 3rd #UnionSquare	1392929101	436602413462851584	f	nuchasnyc
@dooley_noted_ Thanks! We love hearing great things	1392926690	436592301901893632	f	nuchasnyc
RT @dooley_noted_: . @NuchasNYC certainly did not disappoint today 	1392926679	436592255261233153	f	nuchasnyc
In honor of The Naked Cowboy getting married last week, this #ThrowbackThursday goes out to him! http://t.co/qdN88GtltW	1392922802	436575993697165312	f	nuchasnyc
Come find the truck at at 54th and 6th! #empanadas #nyc #foodtruck	1392910120	436522802166779904	f	nuchasnyc
We're having dinner in #UnionSquare on 14th &amp; 3rd from 4pm - 9pm!	1392841833	436236385360838656	f	nuchasnyc
@ardavie We are sorry to hear your experience was less than perfect. Please contact amy@nuchas.com, so we can right this wrong.	1392840774	436231941625761792	f	nuchasnyc
@shopopop The truck will be on 14th &amp; 3rd from 4pm - 9pm!	1392839209	436225378466934784	f	nuchasnyc
Hey #Midtown, who's hungry? Come find the truck on 50th street and 6th ave http://t.co/OFLWoUrlNP	1392817719	436135243922571264	f	nuchasnyc
@34thStNYC @waffletruck thanks for the mention!	1392771390	435940925446307840	f	nuchasnyc
RT @ChineseMirch: #ItsShowtime we r open again in NY looking fwd 2 seeing u again!	1393004537	436918813234569216	f	getstuffednow
Today's warm temperature calls 4 street eating, which #FoodTruck r u headed 2 today? #fridayfeeling	1392987325	436846622245654528	f	getstuffednow
@TheWilliamNYC yes, it was a pigalicious one!	1392846940	436257803473518593	f	getstuffednow
Whoa, sold out of #hickory smoked pulled pork slider at a cafetaria event in half hour! #foodhappiness	1392846684	436256731216502784	f	getstuffednow
Is #frost14 behind us? Today feels like summer!	1392822494	436155268918161409	f	getstuffednow
Happy #PresidentsDay, ever wondered what the #foodie #Presidents fav food was? http://t.co/dvxyptkEu7 via @delishcom	1392649642	435430276907278336	f	getstuffednow
It was so fun being @BKBazaar , #duck #slider sold out in 2 hours! C u all back there soon!	1392565252	435076317407899648	f	getstuffednow
Our last night this month @BKBazaar - come 2 get your fill of peking duck #sliders! #foodanddrink heaven!	1392486870	434747559220113408	f	getstuffednow
#HappyValentinesDay keep on loving!	1392388677	434335709755760641	f	getstuffednow
#throwbackthursday , we first hit the streets in 2012 as @ChineseMirch #foodtruck before we discovered our alter ego! http://t.co/OykT0NHDO0	1392301151	433968599837839360	f	getstuffednow
RT @BKBazaar: Ready for this weekend? Love is in the air @oaxacatacos @MayhemAndStout @Getstuffednow @CrifDogs	1392238411	433705450341957632	f	getstuffednow
#valentines #photooftheday contest! Tweet the pic of street food that you love the most &amp; the most unusual one gets a $25 gift card!	1392212043	433594854111576064	f	getstuffednow
#privateevent , taking our super successful #hickory smoked #pulledpork sliders to it, nom nom!	1392129426	433248332022968321	f	getstuffednow
Happy new years @biandangnyc!	1391177687	429256451664916480	f	mooshugrill
@bbellnyc @BKBazaar good news, we"ll  be back with more of the same this weekend!  #valentine	1392049226	432911950281207808	f	getstuffednow
Encore @BKBazaar , same great vibe, same great food, #saturday night is going 2 rock !	1391898979	432281766079246338	f	getstuffednow
Are street eats best on the streets or equally enjoyed in #restaurants? http://t.co/535mggOWNQ	1391898008	432277696366645248	f	getstuffednow
Excited 2 be back at @BKBazaar this weekend with e new menu addition - #hickory smoked pulled pork &amp; #sriracha tamarind slider. #food #love	1391780960	431786760431861761	f	getstuffednow
This weekend's blog post on Indian #streeteats stay tuned !	1391780855	431786320256434176	f	getstuffednow
Do they have street food in #sochi? Send us some pics of what would be popular there,#icakacaang we think not!	1391693742	431420940094676994	f	getstuffednow
Another #street find of #LunarNewYear that we love, 3 for $1, #partysnaps! http://t.co/b2hiJL8nwT	1391613199	431083119945326593	f	getstuffednow
@OCEANCHICKEN Not the first life we've saved, won't be the last, but glad to help!	1392934659	436625723747741697	f	taimmobile
RT @OCEANCHICKEN: @TaimMobile thank you for the harissa falafel sandwich i just ate ~ it saved my day, and probably my life.	1392934625	436625579908272128	f	taimmobile
What are the latest NYC food trends? Well, count @BalaboostaNYC's Yemenite Pizza in: http://t.co/IWxDQNgYAF	1392921519	436570610081472512	f	taimmobile
@Columbia:We're joining @TaglitBRI to launch registration for Summer Trips! Find us on campus + apply at:http://t.co/pD5HiOAyTS #HelloIsrael	1392907982	436513832643866624	f	taimmobile
@MorgasarMorgan No, not yet. We're still down for normal winter business, but available for catering and events. Hopefully back soon!	1392907852	436513288084799488	f	taimmobile
Hey #Columbia, we're coming to campus tomorrow from 12-5 with @taglitBRI, stop out for falafel and say #HelloIsrael!	1392864391	436331000239755264	f	taimmobile
RT @orlimajor: #helloisrael #falafel #happiness #yumyumyum #sisterpride @TaglitBRI @TaimMobile http://t.co/HUeGJsejBl	1392846073	436254167838257152	f	taimmobile
Hey #NYU we are on 8th/University with @taglitBRI today to kickoff the #birthright registration. Stop by for falafel and say #HelloIsrael	1392831914	436194780297854977	f	taimmobile
#NYU: Were teaming up w/@TaglitBRI to kickoff Summer Trip registration! @ 8th/University  http://t.co/pD5HiOAyTS #HelloIsrael	1392821682	436151865689251840	f	taimmobile
#NYU: Were teaming up w/@TaglitBRI to kickoff Summer Trip registration! Find us on campus + apply here: http://t.co/pD5HiOAyTS #HelloIsrael	1392816700	436130969016631296	f	taimmobile
@sarma @oneluckypuppy It's a date!	1392777419	435966213576196096	f	taimmobile
@sarma We miss you too! We are still geared down for the winter weather, so you'll have to stop by Nolita or the West Village for your fix.	1392754311	435869288726265857	f	taimmobile
Congrats to @BalaboostaNYC for being announced as a 2014 IACP Award Finalist: http://t.co/AiyZhKNdN4	1392753670	435866601276313600	f	taimmobile
Hot Corn Jalapeno soup and Sun Dried Tomato Basil falafel specials @ both stores today. Kind of makes the weather seem less crappy. Kind of.	1392740377	435810847899017216	f	taimmobile
RT @RickBudo: The lady in RED! #NYC @EverythingNYC http://t.co/bsxuwMxoWT	1392422869	434479121037803521	f	taimmobile
RT @maxfalkowitz: YOU TOO can make great vegan ice cream. Here's how: http://t.co/EiA0l0l5GG	1392399735	434382092538232832	f	taimmobile
I think they're trying to tell you something...\nBook your #Valentines Date at @BalaboostaNYC for a memorable night http://t.co/KBnhA9ICbx	1392387074	434328985401851904	f	taimmobile
I think they're trying to tell you something...\nBook your #Valentines Date at @BalaboostaNYC for a memorable night http://t.co/tmXAv3U8nc	1392325228	434069584933449729	f	taimmobile
@annmlee We are looking into investing in a snow plow, but unfortunately we're not quite there yet!	1392314545	434024777536536576	f	taimmobile
Stuck inside? We can deliver our hot Moroccan Vegetable soup and special Portobello Mushroom falafel to lower Manhattan	1392310064	434005984785477632	f	taimmobile
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
We know you're not going to let a little drizzle get in the way of your taco fix. 52nd bet. 6th &amp; 7th Ave. 11:30-2:30	1392994142	436875214316904448	f	kimchitruck
@TheDLife Yes Charlton corner of Varick	1392918269	436556978773827584	f	kimchitruck
Perfect food truck lunchin' weather! Varick St. corner of Charlton st. 11:30am - 2:30pm	1392906843	436509053737766912	f	kimchitruck
On our way to 55th St. bet. 6th &amp; 7th Ave. 11:30am - 2:30pm	1392821532	436151234949427201	f	kimchitruck
@johndelsignore Throw in a couple of 'em just in case	1392746462	435836368581701632	f	kimchitruck
@amandaspurlock @johndelsignore Thanks ma. What do you say? BFF?	1392746397	435836095134052353	f	kimchitruck
@johndelsignore Ouchie. We had every intention of feeding you, but truck god had other plans :(	1392746215	435835331401637888	f	kimchitruck
We are so, so sorry, but we have some maintenance issues and won't be able to make it today. #KimchiRaincheck	1392744179	435826795254792192	f	kimchitruck
Sorry folks. We are tardy today.	1392742563	435820015187529728	f	kimchitruck
RT @SamMushman: Literally the only reason I still have a twitter is to check where @KimchiTruck will be today. #foodporn #ipreferrealporn #...	1392742497	435819739542474752	f	kimchitruck
Sorry, kimchi lovers. Running behind this morning. We're working on it!	1392740345	435810714356183040	f	kimchitruck
Only 2 inches of snow? We got this. @dumbolot Jay &amp; Water St. 11:30 - 2:30	1392735066	435788571711008768	f	kimchitruck
Lot is closed today, but we'll be delivering the goods in Brooklyn, @KimchiGrill	1392647429	435420993859751937	f	kimchitruck
Too icy out there. We'll be cozying up w/ our garage today. Happy Valentine's Day!	1392388116	434333358722539522	f	kimchitruck
Major case of jealousies at seeing kiddos being pulled by sled to school. Anyone want to pull this ole truck to work? #NoTacoDay	1392301713	433970955736453120	f	kimchitruck
Happy Humpity Hump Day. Find us at 55th St. bet. 6th &amp; 7th Ave. 11:30am - 2:30pm	1392216524	433613649895112704	f	kimchitruck
DUMBO, here we come. Lunching at Jay &amp; Water St. 11:30am - 2:30pm	1392130037	433250896575623168	f	kimchitruck
Is that the sun we spy? Soak it in at N. End Ave &amp; Vesey St.	1392044192	432890835063947264	f	kimchitruck
RT @sshekinah18: @KimchiTruck Go Kimchi!!	1391785630	431806345688678400	f	kimchitruck
Get em before the snow comes again. 52nd St. bet. 6th &amp; 7th Ave. 11:30am - 2:30pm	1391784887	431803229501153280	f	kimchitruck
Done in DUMBO! Good weekend yall	1393012224	436951056535519232	f	korillabbq
We ready for ya DUMBO! Front &amp; Water NOW!	1393001382	436905581149192192	f	korillabbq
Headed to @DUMBOFoodTrucks Jay and Water and FiDi's Front St &amp; Gouveneur Ln!	1392996139	436883588408418304	f	korillabbq
Serving up dinner at Columbia! We ready	1392935796	436630493350477824	f	korillabbq
Open for lunch at 47th and Park!	1392914743	436542192078061568	f	korillabbq
Done in DUMBO! Good day yall	1392836839	436215439635386368	f	korillabbq
DUMBOs wrapping it up at 2pm! So come get some while you can!!!	1392833136	436199905103577088	f	korillabbq
We're here DUMBO! Jay &amp; Water ready at noon! A lil never killed nobody	1392828203	436179216359374848	f	korillabbq
Lunch is served. @DUMBOFoodTrucks  Front &amp; Jay or FiDi's Front &amp; Gouveneur	1392823721	436160418130960384	f	korillabbq
Parked a block down from our regular spot. Catch us on Varick between Vandam &amp; Spring	1392740538	435811522745733120	f	korillabbq
Catch us for lunch today at SoHo's Varick &amp; Vandam	1392736929	435796386635071488	f	korillabbq
Serving lunch and dinner today at Columbia U. (116th &amp; Amsterdam)	1392655348	435454210176729088	f	korillabbq
COTDAMN is nice out! Come catch us at @DUMBOFoodTrucks Jay St and water and FiDi's Front St and Gouveneur Ln.	1392390468	434343223373623296	f	korillabbq
Catch us for dinner at 116th &amp; Amsterdam	1392239609	433710475122319360	f	korillabbq
Done in DUMBO! Stay warm yall	1392233849	433686315688009728	f	korillabbq
We ready for you DUMBO! Come through to Front &amp; Jay	1392224314	433646322806423552	f	korillabbq
Catch us in FiDi's Front St &amp; Gouveneur Ln too!	1392216342	433612882631483392	f	korillabbq
Headed to @DUMBOFoodTrucks Jay st &amp; Water St today!	1392216321	433612794731458562	f	korillabbq
Thanks for coming out in the cold SoHo! Catch us for dinner at 116th &amp; Amsterdam @ 5:00	1392148666	433329030750683137	f	korillabbq
SoHos Varick &amp; Vandam open now!	1392136227	433276857900097536	f	korillabbq
@jonnycottone experimenting on deliveries but discontinued til further notice! In the meantime any suggestions on dinner spot for our truck?	1393002845	436911717323657217	f	mooshugrill
The #MSG #springcollection #hoodie is here! Stay tuned to see how you can win one for #FREE! #nomsgtho #nyfw #fashion http://t.co/S9uIMZFqsE	1393001657	436906735526490112	f	mooshugrill
Rounding out the week at 50th &amp; 6th ave!	1392996222	436883937257078784	f	mooshugrill
Whew you wiped us out #midtown thanks for the &lt;3! #soldout	1392923354	436578309116526592	f	mooshugrill
#fullmenu on 46th &amp; 6th ave today! #porkbelly #pekingduck #basilchicken #xosteak #fivespicepork #panfriedtofu oh my...	1392912364	436532212125958145	f	mooshugrill
Wduuup @randomhouse! We're simmerin up the #porkbelly on 55th &amp; Broadway today!	1392820946	436148777033158656	f	mooshugrill
Snow came and left but we're still here on 50th &amp; 6th ave today! #nomsgtho	1392735276	435789450694496256	f	mooshugrill
Happy friday #midtown! Back on the grind at 50th &amp; 6th ave! @midtownlunch #nomsgtho	1392395129	434362773553041409	f	mooshugrill
Sup y'all. We're on 55th &amp; Broadway slinging #mooshus to the masses today! #nomsgtho @randomfoodtruck	1392216186	433612229511221248	f	mooshugrill
What's happening midtown? Posted up on 49th &amp; 6th today come n get it!	1392134652	433270253737771008	f	mooshugrill
Our truck finally took a shower! Come by @dumbolot and check it out! #sofreshsoclean on Jay st &amp; Water st	1392050388	432916824070823936	f	mooshugrill
"@DomoTaco: 56th and broadway for lunch!  Come by and try the new tonkatsu curry rice.  #japanesecurry #madefromscratch" can't wait to #swap	1391787978	431816195051102208	f	mooshugrill
We missed 55th &amp; Broadway so much we shoveled out a spot to park! #msg &lt;3 #nyc #midtown @midtownlunch #nomsgtho #vsco http://t.co/THCH3oUK8Q	1391779352	431780016951939072	f	mooshugrill
Sup #midtown! Haven't been back to 46th &amp; 6th in awhile so we thought we'd roll on by! #porkbelly #MSG #nomsgtho @midtownlunch	1391692381	431415234801434624	f	mooshugrill
"@DomoTaco: New menu item today on 55th and broadway...Tonkatsu curry rice!  #madefromscratch #realcurry #notcurryroux" hey wanna trade?	1391522827	430704071675486209	f	mooshugrill
Finally done with #ChineseNewYear leftovers? Continue the feast with #MSG on 50th &amp; 6th today! #nomsgtho	1391522714	430703598281166848	f	mooshugrill
Stay warm ny!	1391450724	430401651170869248	f	mooshugrill
Feeling hoarse? #MSG got your #ChineseNewYear lunch covered on 50th &amp; 6th! #GongXiFaCai #HongBaoNaLai #allredeverything #nomsgtho	1391173999	429240981129822208	f	mooshugrill
@SSDESTO Dope bro hope you enjoyed!	1391173639	429239471008382977	f	mooshugrill
@sqsupport is it possible to change business EIN?	1393014602	436961029428617216	f	biandangnyc
@_natma @lizfell we'll have it monday!	1393009931	436941436995784704	f	biandangnyc
Follow @mooshugrill to #win a #free hoodie! #notorious http://t.co/od4ifvW51u	1393002354	436909659320905730	f	biandangnyc
@SqSupport looks like the embed.js script doesn't work for mkt items.	1392999970	436899657357094912	f	biandangnyc
Opening up soon on 53rd &amp; park!	1392998188	436892185531650049	f	biandangnyc
Brighten the gloomy day with some Bian Dang at 53rd and Park!	1392993719	436873441845575680	f	biandangnyc
Patacon Con Todo http://t.co/TMH9gA6m1x	1392946780	436676565489827841	f	biandangnyc
@sqsupport Sent!	1392924476	436583012663586816	f	biandangnyc
@SqSupport @Square  how can I edit my market link?	1392923635	436579487124570112	f	biandangnyc
It's been a long winter but it's finally warm again! Check out the cherry blossoms blooming on the side of the truck at 53rd &amp; Park!	1392910921	436526160097189889	f	biandangnyc
53rd and Park. #whatwhat	1392910703	436525246553018368	f	biandangnyc
Now accepting credit cards!	1392831209	436191825247109120	f	biandangnyc
Did you hear the good news? Joanna and Nick are handing out free smiles on 53rd &amp; Park today!	1392823505	436159509388488705	f	biandangnyc
Happy Tuesday! come to 53rd &amp; Park for pipin hot #porkchops #dumplings and #buns today!	1392736020	435792570661093376	f	biandangnyc
@IrisShenyt if you can get a group of people to order take out from us, we would definitely consider delivering it to you!	1392433246	434522644990672896	f	biandangnyc
@MCWoodside we are only open from 11:30-2:30 on weekdays for lunch.	1392411348	434430797781929986	f	biandangnyc
Dan: it was so hard for me to find something gluten free.\nJo: I'm not gluten free, I'm dairy free. \n\nHaha. Thanks... http://t.co/TWl1TXw7HL	1392406246	434409397893492736	f	biandangnyc
We have #saltandpepper #chicken again today!	1392399551	434381318952980480	f	biandangnyc
53rd and park! Since yesterday, we had over 800+ likes on #Facebook. Thanks #Taiwan! #tgif #valentinesday #lanternfestival	1392391859	434349058031759360	f	biandangnyc
http://t.co/MhuYV5u8Ly The english translation of this article is quite amusing. http://t.co/WsYmcN5MGu	1392343574	434146533043212288	f	biandangnyc
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
@marcmaron Hulk paint	1393022562	436994416461758464	f	thesteelcart
Maid of the Mist is my middle name! Front &amp; Jay in #Dumbo. Soups: Cream of Spinach / Red Lentil / Pink Bean + Kale &amp; Ham - @DUMBOFoodTrucks	1392991325	436863399226769408	f	thesteelcart
RT @Kerryann125: Heaven on a spoon!  @TheSteelCart #BestGritsEver  http://t.co/7Zz4ATwbH6	1392923775	436580072917835777	f	thesteelcart
@JayeRose13 pink bean + ham &amp; kale / red lentil	1392916207	436548333071765504	f	thesteelcart
The soups today are Sweet Ham &amp; Pink Bean + Kale / Red Lentil (vegan)	1392914459	436541000106795008	f	thesteelcart
56th &amp; Broadway, it's picnic time! Swing by for soups &amp; sandwiches in the sun before we get Polar Vortexed.	1392910036	436522449262612480	f	thesteelcart
Freezing rain not your thing? Call ahead! 917-971-8071.	1392827884	436177879253389312	f	thesteelcart
@chrupertr finally made it! Soups today are Sweet Ham + Pink Bean &amp; Kale / Red Lentil	1392822182	436153960882524160	f	thesteelcart
It's true! - 47th St between Park &amp; Madison for your soup &amp; sandwich needs.	1392821787	436152303674859521	f	thesteelcart
@NautiMobile Mmmm... yoga mat sandwich.	1392777031	435964585385136128	f	thesteelcart
Barring unforeseen climatic nonsense, we will be on 47th &amp; Park tomorrow through lunch.	1392772402	435945168769142784	f	thesteelcart
@NautiMobile Subway?! We'll miss you guys.	1392772277	435944645206749184	f	thesteelcart
Off the road today. The Cart will be back in midtown tomorrow.	1392729184	435763900039331840	f	thesteelcart
Midtown, doesn't look like it's gonna happen. #snowday http://t.co/bktR8D8bZz	1392306747	433992070538096640	f	thesteelcart
@greenoodle It's been way too long. We'll be back on a regular 47th St schedule within the next few days, &amp; your next Egg Tosti's on us.	1392244919	433732746721374208	f	thesteelcart
@franklinshepard Sorry Mark, cold won out today. But we should be back on schedule very soon.	1392223240	433641817163444224	f	thesteelcart
@chrupertr Hi Rupert,  having some issues with the cold today, we hope to be back on schedule after this week with many soups.	1392223077	433641132799832064	f	thesteelcart
Don't let this weather get the best of you. We've got Split Pea &amp; Ham, Red Lentil (vegan) and a fantastic Cream of Spinach soup today.	1392134656	433270270183612416	f	thesteelcart
The Steel Igloo will be on 56th &amp; Broadway through lunch.	1392126981	433238078887456768	f	thesteelcart
RT @Kerryann125: The Steel Cart on #Yelp: The most amazing sandwich you will ever eat...Bird of a feather from @TheSteelCart - #PERFE... http...	1392079899	433040601882578944	f	thesteelcart
Hello FIDI. Lunch 2day @ 7 Hanover sq b/t water st &amp; pearl st. Burger of the week THE EL CUBANO. Preorder 9172929226	1392994997	436878801839325186	f	fritesnmeats
RT @BrookfieldPLNY: . @BrookfieldPLNY NORTH Lot | Thurs, 2/20/14 | Open until 3pm. | North End Ave/Vesey St. | @sweetchilinyc @fritesnmeats...	1392914057	436539313875324928	f	fritesnmeats
Hello wfc peeps, lunch 2day @ the wfc food truck lot on north end &amp; vesey st. Burger of the week THE EL CUBANO. Preorder 9172929226	1392909792	436521424657063936	f	fritesnmeats
Hello soho, lunch 2day @ Hudson st &amp; king. Burger of the week THE EL CUBANO preorder 9172929226	1392820569	436147197168865280	f	fritesnmeats
Hello FIDI peeps, lunch 2day @ 10 Hanover sq b/t water st &amp; pearl st. Burger of the week THE ELCUBANO preorder 9172929226	1392735933	435792206696579072	f	fritesnmeats
Hello FIDI, lunch 2day @ 7 Hanover sq b/t water st &amp; pearl st. burger of the week THE BYMARK preorder 9172929226	1392390004	434341274666401793	f	fritesnmeats
Sorry folks, another snow day. No lunch 2day:(	1392303081	433976694215806976	f	fritesnmeats
Hello soho! Lunch 2day @ Hudson st &amp; king st. Burger of the week THE BYMARK preorder 9172929226	1392217092	433616031719104512	f	fritesnmeats
Hello FIDI, lunch 2day @ 10 Hanover sq b/t water st &amp; pearl st. Burger of the week THE BYMARK preorder 9172929226 #burgeralert	1392131018	433255008273190912	f	fritesnmeats
Peeps we will be off the road 2day	1392044327	432891402155225088	f	fritesnmeats
Hello FIDI, lunch 2day @ 7 Hanover sq b/t water st &amp; pearl st. Burger of the week THE CHEVRE TRUFFLE BURGER preorder 9172929226 #burgerlife	1391785494	431805777087827968	f	fritesnmeats
@markh314 we will be back at the wfc lot next week bud.	1391703135	431460337746190338	f	fritesnmeats
Hello soho!! Lunch  2day. @ Hudson &amp; king. Burger of the week THE CHEVRE TRUFFLE BURGER. Preorder 9172929226	1391698730	431441863753891840	f	fritesnmeats
@gesher sorry bud. This weather is killing us!! But we will be there tomo :)	1391616964	431098909394739201	f	fritesnmeats
Hello soho peeps, due to the weather we r off the road:( but will be there tomo	1391611044	431074081799421953	f	fritesnmeats
Hello FIDI, lunch today @ 10 Hanover sq b/t water st &amp; pearl st. Burger of the week THE CHEVRE TRUFFLE BURGER preorder 9172929226	1391526854	430720963911880704	f	fritesnmeats
Peeps, due to the weather we r off the road today	1391438303	430349551346913280	f	fritesnmeats
Hello FIDI peeps, lunch 2day @ 7 Hanover sq b/t water st &amp; pearl st. Burger of the week THE MARITAL BLISS preorder 9172929226	1391179919	429265812692942848	f	fritesnmeats
Gmorning peeps, lunch 2day @ 27th st &amp; park av. Burger of the week THE MARITAL BLISS preorder 9172929226	1391094340	428906867851800576	f	fritesnmeats
Hello soho, lunch 2day. @ Hudson &amp; king. Burger of the week THE MARITAL BLISS preorder. 9172929226	1391007875	428544207142526976	f	fritesnmeats
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
@dooley_noted_ Soon, with a New Yummy Menu. TLT still on!	1392775803	435959432099684352	f	thegreenradish1
@PamelaRivers @ABC @mcharlesworth7 @RobNelsonABC7 yay!	1393176335	437639386247995392	f	waffletruck
RT @dooley_noted_: But in all seriousness, I'm craving a TLT. When are you back on the road @thegreenradish1?!	1392775368	435957611142610944	f	thegreenradish1
@modcupcoffee Your Coffee is like a Fine Burgundy, time stopping!  Hope our paths cross soon, Mod Cup!	1392694728	435619381251301376	f	thegreenradish1
More #DONARTS from @thegreenradish1... http://t.co/ZEFo1AjZAR	1392597674	435212305660272641	f	thegreenradish1
RT @NJ_Munchmobile: @thegreenradish1 @AmandaBananasNJ @waffledelys @theoutslider among top dishes in Ultimate Jersey Food Truck Showdown ht...	1392572951	435108611539222528	f	thegreenradish1
@NJ_Munchmobile Pete-Thanks for including the green radish! Stop by soon for a DONART...https://t.co/H1L7D7Icvw	1392572935	435108542459031552	f	thegreenradish1
Boys and  their DONARTS....Cinnamon Chocolate Vanilla Swirl.... http://t.co/q8aagjPNfR	1392563395	435068528979243008	f	thegreenradish1
Not quite a Donut, Not quite a Tart...Its a DONART.  And its BAKED...Coming Soon to The Green Radish........ http://t.co/eH625tXYi9	1392551109	435016997969985536	f	thegreenradish1
Snowed In, working on new menu. yummy #vegangrilledcheese coming soon......	1392304445	433982414541438976	f	thegreenradish1
@DaniB127 Sorry, still on break...Back soon!	1392261943	433804147079389184	f	thegreenradish1
MEANT TO BE\n\nWe had closed the truck after lunch when the knock shook the back door. " Hey, you guys open? Just... http://t.co/Js85hXnSup	1392209740	433585192393912320	f	thegreenradish1
Proud to  be part of Maxs TOP TEN ORGANIC picks... http://t.co/ed8Qb3kgjN	1391631563	431160141892034560	f	thegreenradish1
RT @foodtrucksin: @aroy_d @shortysnyc @njwrapstar @modcupcoffee @thegreenradish1 @waffledelys Thank You! Pay It Food Truck Forward http://t...	1391575090	430923280577744896	f	thegreenradish1
LivingMaxwell is TheGreenRadishs go to #Organic Guru...Shine on, Max!!!! http://t.co/ed8Qb3kgjN	1391567532	430891579872915456	f	thegreenradish1
WE'RE IN GOOD COMPANY....... so happy to be part of the TOP TEN NYC veggie... http://t.co/I1QaHEBJsj	1391563774	430875817262866432	f	thegreenradish1
RT @livingmaxwell: My Favorite Organic Restaurants in NYC http://t.co/yfSrYUps2G #organic #nyc #restaurants	1391563247	430873605879390208	f	thegreenradish1
Hey All,\n\nThe Radish is taking a winter snooze and cant wait to come back STRONG with our DELICIOUS NEW MENU...Will keep you posted!	1391445302	430378907502518272	f	thegreenradish1
Best Coffee, Best Service Period!!! http://t.co/TzzFDPgFTX	1391372646	430074167195869184	f	thegreenradish1
Food Truck #SuperBowl is on!!!...http://t.co/v4ryJcfKeq http://t.co/CuiXguZ0nw	1391230412	429477594505822208	f	thegreenradish1
RT @nycfoodtruck: The #winterblast has arrived and @thegreenradish1 invites you to join them at it! http://t.co/bw6onsbnH8 Jan. 30th-Feb. 1...	1391228857	429471070962597888	f	thegreenradish1
@jenist probably yes. 	1392916941	436551409912528897	f	veganlunchtruck
Just waiting to put a few final touches on our new "home base" kitchen in Brooklyn, and then pass our... http://t.co/Z9xdHSn5Da	1392916753	436550622561984512	f	veganlunchtruck
Still on winter break for a little bit.   Coming back really strong and more awesome than ever soon!\n\nUntil then,... http://t.co/g8NX0gGKgQ	1392668234	435508255515631616	f	veganlunchtruck
So awesome to attend @veganshopup JUST AS EATERS! Yummy goods from @lagusta @DrinkBunna and yeah dog! We will be back w/ the snail soon	1392574158	435113674337173504	f	veganlunchtruck
Our friends @DrinkBunna are trying to raise $ to start NYCs 1st all veg Ethiopian paradise! HELP MAKE THIS HAPPEN!\n\nhttp://t.co/aB3Cj5Ekr1	1392396995	434370597431549952	f	veganlunchtruck
Four years ago today, 8:30 AM, I was scrambling to prepare to open our doors for the first time.  \n\nSo Valentines... http://t.co/VM5XmlAfAs	1392384854	434319676743905281	f	veganlunchtruck
@quarrygirl all of Vegas' horribleness is made up for by the apple fritters from Ronald's.	1392244010	433728934602371072	f	veganlunchtruck
Still on winter break for a little while longer.   Don't worry.  We will be back and better than ever soon! @GreenOwl_Hedi @manhattan_manic	1392165262	433398640829534208	f	veganlunchtruck
Seeing superstar juice gal Deb from @juicepirate on the road today made me so happy. If you haven't had her GREAT juice yet, wait no longer!	1392084322	433059153175904256	f	veganlunchtruck
@seandlr only as a guest chef for valentines night at @SeedtoSproutNJ  Otherwise, we are on winter break for a couple more weeks. Sorry	1392004782	432725536407027712	f	veganlunchtruck
Thanks Alex Klee, for being our 22,000th fan on Facebook!\nMay your life be filled with fresh, yummy donuts and such stuff &lt;3	1391973993	432596399218114562	f	veganlunchtruck
Offering 4 courses of #vegan valentines bliss next week in NJ @SeedtoSproutNJ call em before 2/13 to reserve a spot! http://t.co/FJwqMjwIPX	1391800828	431870091924627456	f	veganlunchtruck
We launched the Cinnamon Snail on Valentines Day 2010.\nTo celebrate our 4th anniversary, we are offering a 4... http://t.co/NpKBvKiL1m	1391791676	431831706237018112	f	veganlunchtruck
The Snail is planning something exciting in NJ for Valentines Day!\nMore info about that coming later today...	1391784706	431802472412495872	f	veganlunchtruck
RT @seriouseatsny: What's your favorite vegan food in New York? http://t.co/vJmyuzEgFa	1391721423	431537043983052800	f	veganlunchtruck
Still hiring lots of positions, in preparation for our most rad year yet!\n\nAll the deets are here:... http://t.co/IWIxAz4Q6F	1391608138	431061893625942016	f	veganlunchtruck
@TheVeganKitchen reading SALT by Mark Kurlansky right now.  It's fascinating.	1391196668	429336063681626114	f	veganlunchtruck
@Kelc_OBrien I wish.  Still on break for a few weeks	1391177223	429254502039158784	f	veganlunchtruck
RT @veganjobs: The @VeganLunchTruck is looking for Line Cooks, Night Time Bakers and Prep Cooks! Details and application: http://t.co/GKqz9...	1391097301	428919287118831616	f	veganlunchtruck
RT @veganjobs: The @VeganLunchTruck is looking for Line Cooks, Night Time Bakers and Prep Cooks! Apply: http://t.co/GKqz9ApRFH	1390947639	428291557905924096	f	veganlunchtruck
RT @dhulser: @mactruckny were coming to you! Save the buff chick for us!	1392937486	436637580323749888	f	mactruckny
RT @bmiles33: The Mac is Back! @mactruckny http://t.co/LEVJl7JKG8	1392937466	436637499746955264	f	mactruckny
Good morning broadway!!! Between 55/56 for lunch today, and what a beautiful day it is.	1392902631	436491390705733632	f	mactruckny
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
Goesting @ Broadway &amp; 66th til 9pm Kotmadam @ 23rd &amp; 5th ave til 8p	1393028489	437019275170414593	f	waffletruck
Kastaar @ Astor Pl till 1am \nMomma Truck @ 7th &amp; Christopher till 1am	1393028482	437019245525090304	f	waffletruck
Wafels into the night!  \nDe Wafel Cabana at 35th &amp; Broadway open til 10pm \nLe Cafe at 15 Ave B open til 2am	1393028471	437019202118234112	f	waffletruck
Lunchtime! Try our Chili Con Corne Wafel! Available at both of our trucks and le Cafe! Time is running out! Quick! http://t.co/q6hCT08QqZ	1393006115	436925433313898496	f	waffletruck
Update!   Vedette has been relocated to 6th Ave &amp; Central Park South!	1393003775	436915618546462720	f	waffletruck
@warholwannabe ...we're usually on a pretty tight schedule...	1393001011	436904025532145664	f	waffletruck
@jrodbx we feel ya. There's just so many trucks already over there.	1393000986	436903919525314560	f	waffletruck
@MaxMorrison13 a fine choice. The king would be proud.	1393000920	436903644412534785	f	waffletruck
@NatalieeJordann consider our breath held until you arrive.	1393000890	436903515878080512	f	waffletruck
@JimeGarciaMon we'll wait for you forever.	1393000863	436903403214884864	f	waffletruck
@lyso1 Oh no! We'll tell our people to go easy on the cinnamon.	1393000815	436903204379693057	f	waffletruck
@DFried615 @espngolic yes yes. Do this.	1393000773	436903024930594816	f	waffletruck
@ElenaBerezovsky @MarinaInTheCity we're excited too!	1393000756	436902957062569984	f	waffletruck
@janiey_x isn't it though?	1393000723	436902815127314432	f	waffletruck
@niecy_christie don't drown!	1393000699	436902717412605952	f	waffletruck
RT @JerlissaPaulino: @waffletruck thank you!!! You guys are the best and do the best. #cousinbirthday #happybirthdaygirl #happycousin  h...	1393000664	436902568955248640	f	waffletruck
Vedette @ 60th &amp; 5th til 7pm\nKotmadam @ 23rd &amp; 5th ave til 8p	1392994705	436877575928160256	f	waffletruck
Goesting @ Broadway &amp; 66th til 9pm Pagadder @ Brooklyn Bridge till 6pm	1392994694	436877529564336130	f	waffletruck
Momma Truck @ 91st &amp; Columbus Ave till 4:31p Kastaar @ 40th &amp; Park Ave till 4:32p	1392994687	436877500535537664	f	waffletruck
Friday is here!  \nDe Wafel Cabana at 35th &amp; Broadway open til 10pm \nLe Cafe at 15 Ave B open til 2am	1392994681	436877474258239488	f	waffletruck
We are on 55st and broadway!!	1392999761	436898782798938112	f	chefsamirtruck
"@NinaZoppi: just had the most delicious food from @Chefsamirtruck tonight! tasted like home. #nyc #foodtruck #moroccan"	1392942993	436660679802904577	f	chefsamirtruck
We are on 47st between park av and Lexington av!!	1392916462	436549402594123776	f	chefsamirtruck
We are on 52st and park av	1392831366	436192483098517505	f	chefsamirtruck
"@CollinMedford: @Chefsamirtruck best lunch I've had in NYC this winter. The chicken cous cous hit the spot."	1392754899	435871754998005760	f	chefsamirtruck
"@pocketaces718: @Chefsamirtruck chicken and rice , delicious as always! #tgit"	1392754883	435871687566163968	f	chefsamirtruck
We are on 36st and broadway!!	1392744733	435829117586796544	f	chefsamirtruck
We will be close today due to severe weather conditions!!! Stay warm everyone	1392305087	433985106462900224	f	chefsamirtruck
We are on 52st and park av!!	1392222457	433638532750770176	f	chefsamirtruck
Free hot mint tea with rose water!!	1392054196	432932796626370560	f	chefsamirtruck
We are on old slip and water st!!	1392054159	432932640707334144	f	chefsamirtruck
We are on 47st between park av and Lexington!!	1391703300	431461029537939456	f	chefsamirtruck
We are close today!!	1391622088	431120403969630208	f	chefsamirtruck
We are on 36st and broadway!!	1391532782	430745824583512064	f	chefsamirtruck
We are giving free mint tea with rose water	1391446264	430382942352052225	f	chefsamirtruck
We are on water st and old slip!!	1391446219	430382754820542465	f	chefsamirtruck
We are on 55st and broadway!	1391187754	429298675182227456	f	chefsamirtruck
We are on 52st and park av!!	1391015194	428574906859917312	f	chefsamirtruck
FREE HOT Moroccan mint tea with rose water! Uhmmmm!	1391014612	428572464638345216	f	chefsamirtruck
Is on 52nd St @ Park Ave today!	1391014547	428572191442337792	f	chefsamirtruck
Yes we r back! Mausam means season spring is coming @ 47str corner of Park &amp; Lex get yr fresh curry n bites	1392994965	436878666723639297	f	mausamnyc
TGIF ... And we are serving curries at 47 park and lex	1392994666	436877411465297920	f	mausamnyc
Big thank you @DUMBOFoodTrucks @dumbolot	1392994591	436877099081924608	f	mausamnyc
RT @DUMBOFoodTrucks: NEW FOOD TRUCK ALERT!!! RT @mausamnyc: All set for curry and bites @dumbolot #dumbofoodtrucks	1392913611	436537442498527232	f	mausamnyc
@WinnieeYuen @dumbolot yes	1392913588	436537344746082304	f	mausamnyc
All set for curry and bites @dumbolot #dumbofoodtrucks	1392908294	436515143573569536	f	mausamnyc
Yea lots of curry and bites coming to @dumbolot #dumbofoodtrucks	1392828987	436182505914654720	f	mausamnyc
Dinner at  Bway &amp; 67str. Fresh Curry N Bites. 	1391725725	431555087345782784	f	mausamnyc
Come and enjoy our Curry N Bites  47str &amp; Park ave. Great day for our vindaloo flavor. All platters comes with parata  &amp; samosa	1391695507	431428342890258432	f	mausamnyc
#NYU here we come West 4th Str! Yr mouthwatering #samosas and Kati rolls.	1391544946	430796847129825281	f	mausamnyc
beautiful sunny day! Curry N Bites Bway bet 55 &amp; 56str. Come get yr favourite fresh lunch plattersall served with samosa and parata	1391518041	430683999736848385	f	mausamnyc
Yes dinner will be served! Bway &amp; 67str next to  Curry N Bites got yr delicious platters for all taste buds.	1391459263	430437464067432448	f	mausamnyc
Happy Monday! We r here46 Str bet 5 &amp; 6 ave. Fresh Curry N Bitesfor this day. All platters servedwith parata &amp; samosa	1391433957	430331322750365696	f	mausamnyc
Congrats @Seahawks #SB48	1391396853	430175699509719040	f	mausamnyc
#SB48 with some Desi wings let's go broncos and Seahawks http://t.co/v5fzdEvstF	1391374057	430080086017335296	f	mausamnyc
#pix11bowl let's go @broncos and @Seahawks and celebrate win with some curries and bites	1391367736	430053574564126720	f	mausamnyc
RT @KellyKOMO4: Jersey restaurant has #sb48 food: Seahawks Shrimp &amp; Seattle Score (drink). All green, DEN SEA blues cancel http://t.co/sWNc...	1391198889	429345377792557056	f	mausamnyc
Join us for some Seahawks palak paneer #winterblast #secaucus @komonews @Seahawks http://t.co/yPNv7GXNCD	1391192230	429317446005436416	f	mausamnyc
@AC360 up for some curries in freezing temp join us at #winterblast #secaucus	1391124037	429031426969698304	f	mausamnyc
#winterblast #secaucus @Broncos @Seahawks @Giants @nyjets #Super Sunday http://t.co/rjCJPtjKVH	1391115999	428997711275499521	f	mausamnyc
RT @GoVimbly: The best #free activities in NYC this weekend! Food tours, live music, photography, belly dancing + more. http://t.co/mvIuvAt...	1393003487	436914410607869952	f	shanghaisogo
Is it lunch time yet? YES, Shanghai Sogo Truck is ready for ya all! Come &amp; enjoy your Asian tapas @22nd st &amp; 5th ave until 3pm.	1392999982	436899709853368320	f	shanghaisogo
RT @ShanghaiMKS: Looking to branch out and start up a food truck? We've worked on some famous NYC trucks and can help with yours.	1392999593	436898079305138177	f	shanghaisogo
RT @ShanghaiMKS: Whatever you're in the mood for, one of our food trucks is bound to satisfy your craving!	1392999558	436897930298286080	f	shanghaisogo
Foodies from FLATIRON! Cheer up your Friday with us @ 22th st &amp; 5th ave until 4pm.don't let the weatherprevent U from yr favourite truck.	1392986598	436843570444914688	f	shanghaisogo
DINNER is ready to serve @Columbia University. Get ur happy meal from Shanghai Sogo!!! Come n' Sogo @116th &amp; Amsterdam until 8pm.	1392933718	436621775943004160	f	shanghaisogo
Hey NYers!#Spring is just 4 weeks away! That will be great season for food trucks. Are you all ready for it?!	1392912699	436533617838542848	f	shanghaisogo
Hey, Shanghai Sogo followers, The sun is out, feel like spring! Catch us @46th st &amp; 5~6th ave. 11am~3pm. #foodtruck #midtown @midtowncatch	1392910896	436526055923679232	f	shanghaisogo
Geller of the Southern California Mobile Food Vendors Association says it succinctly: Restaurants have customers. Food trucks have followers	1392910470	436524266730053632	f	shanghaisogo
http://t.co/ETzMfyUpDP	1392872056	436363149219221504	f	shanghaisogo
CU dinner at 116th st  and Amsterdam ave til 8. Sogo for it!!	1392847311	436259358750818304	f	shanghaisogo
Yes, shanghai Sogo is back #midtown. catch us @46th st bet.5~6ave until 3pm, We got what u need. @midtownlunch @asian	1392824352	436163062048235520	f	shanghaisogo
Mostly Sunny! feeling  like spring is coming soon. We got what u WANT @46th st &amp; 5~6 ave until 3pm!  &gt;&gt;SOGO FOR IT &lt;&lt;.....	1392816504	436130148426219520	f	shanghaisogo
RT @nycfoodtruck: We've got what you need. We've got what you want. Let's eat, NYC! http://t.co/fImXg62mkw	1392815929	436127735883530240	f	shanghaisogo
RT @bigdsgrub: Mo' snow...Mo' problems!\nNo truck today, stay safe &amp; warm NYC.\n#AintNobodyGotTimeForSnow	1392732492	435777776701177856	f	shanghaisogo
RT @RoamingHunger: Our hearts go out to the family of Atlantas @happybellytruck co-founder Terry Hall http://t.co/6mtIgquC3I	1392683356	435571683475591168	f	shanghaisogo
Shanghai Sogo Truck @ 7th ave &amp; Carroll st  #ParkSlope, BROOKLYN till 4:30pm	1392661063	435478181660069888	f	shanghaisogo
RT @nycfoodtruck: FOOD TRUCK FOR PRESIDENT! Just kidding, guys- We'd never be able to leave our beloved city. =) Come out &amp; grub! http://t....	1392660805	435477097105358848	f	shanghaisogo
Good Morning Everyone! Happy Presidents Day!	1392651449	435437854551199744	f	shanghaisogo
Happy Friday, Serve @Columbia University. It's DINNER time of the DAY!!! Come n' Sogo @116th &amp; Amsterdam until 8pm.	1392411148	434429959206371328	f	shanghaisogo
RT @VMan925: @BobbyG56 @DiSOSNYC couldn't agree more with the RB! Like butta!	1393030946	437029579950419968	f	disosnyc
RT @BobbyG56: @DiSOSNYC , the RB special was OTH! The cannoli is a MUST, needs to be on menu. Redonkulos!	1393020363	436985193623474176	f	disosnyc
Wall st, Today's specials:\n\n- Disos famous homemade roast beef in au jus, prov, grilled onions, glazed balsamic... http://t.co/LpwaI8KTB0	1392996540	436885274224627712	f	disosnyc
Wall and water st today\n\nCall it in: 917-756-4145	1392994242	436875633709154304	f	disosnyc
On water and wall st today for lunch..\n\nCall ins accepted: 917-757-4145	1392994146	436875229269225472	f	disosnyc
@Chefsamirtruck @NinaZoppi so did we! had the lamb kofta today from chef Samir and it was delicious..!	1392943726	436663755045605376	f	disosnyc
Today's specials include:\n\n- hot roast beef, mozz/ prov, grilled onions, glazed balsamic drizzle\n\n- toasted ravioli with marinara sauce	1392907137	436510286909300736	f	disosnyc
On 47th bet park and Lexington today.\n\nCall in orders to: 917-756-4145	1392907044	436509899187830785	f	disosnyc
I posted a new photo to Facebook http://t.co/fHFOVLiMtf	1392830746	436189880687685634	f	disosnyc
I posted a new photo to Facebook http://t.co/GHe9XMoAPK	1392830746	436189880033353728	f	disosnyc
I posted a new photo to Facebook http://t.co/VRCsG77lHY	1392830745	436189879341711360	f	disosnyc
Roast beef special, au jus, grilled onions, glazed balsamic \n\nAdd ons: broc rabe, peppers, etc	1392830745	436189878879940609	f	disosnyc
Btw, the roast beef in au jus came out amazing..\n\nBest batch yet..	1392825183	436166550257926144	f	disosnyc
Off the menu specials today:\n\n- hot roast beef sandwich special \n\n- toasted breaded raviolis with marinara sauce	1392819080	436140952936534016	f	disosnyc
Soho location today, varick and charlton corner..\n\nCall ins: 917-756-4145	1392819007	436140644751667200	f	disosnyc
Toasted raviolis on special today..\n\n@ 48th bet 6 and 7 ave\n\nCall ins: 917-756-4145	1392738034	435801021429075968	f	disosnyc
On 48th st. Bet 6 and 7 ave. today\n\nCall in your orders: 917-756-4145	1392730928	435771214662230016	f	disosnyc
Off today.. Happy Presidents Day!	1392651225	435436917752999936	f	disosnyc
@JeffMauro we're calling out the sandwich king.. The society is accepting new members daily, come by the truck one day for THE Italian hero.	1392496844	434789396072902656	f	disosnyc
Are most people/ companies closed Monday for Presidents' Day? Hit like for yes, thanks	1392493724	434776308657033216	f	disosnyc
@melissalauram and we love being there.	1393176309	437639279251292160	f	waffletruck
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
@UndrcvrMother awwe, thank u so much. We should be back on 47th soon. Happy Valentine's 	1392397897	434374381276778496	f	tacobite
RT @TenchyRod: Esta tarde estaremos hablando del Super Bowl #48 Y la victoria de Seattle Seahawks. En @impactodeporti @Elreydelaradio.	1391452866	430410633436467200	f	tacobite
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
TGIF!!! Kasar truck is at broadway and 55th street all day until 6pm. Happy friday!	1393001349	436905443747958784	f	chipsykingny
Kasar truck is at broadway and 55th street\nAll day until 6 pm	1392830316	436188078873780224	f	chipsykingny
Kasar truck is at broadway and spring street, all day until 6pm\nJoin us	1392659000	435469528873828352	f	chipsykingny
Happy Valentine's Day!!!\nKasar truck is at 46th street between 5th and 6th avenues, all day until 6pm.	1392390467	434343218197856256	f	chipsykingny
Kasar truck is at Broadway and 55th street all day until 6pm\nJoin us!!!  Happy Wednesday!!!	1392219314	433625349537398785	f	chipsykingny
Free Mix Download!! http://t.co/4Z22OPAy3u	1391277498	429675088921653249	f	chipsykingny
TGIF!!! Kasar truck is at Broadway and 55th street all day until 8pm. Join us	1390574849	426727963145420800	f	chipsykingny
Kasar truck is in Soho, broadway and spring street, until 6pm tonight. Join us. Happy Sunday!!!	1390141118	424908763544293376	f	chipsykingny
Kasar truck is at broadway and spring street in SOHO until 9pm and all night until 5am at 7th and Christopher. Happy Saturday!!!	1390065530	424591724996882432	f	chipsykingny
Kasar truck is at broadway and 55th street until 7pm and all night until 5am at 7th and Christopher. TGIF. Happy Friday	1389996884	424303802356088834	f	chipsykingny
@monique_elise @ABC7 bad luck to ignore signs.	1393176277	437639145486557184	f	waffletruck
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
RT @AmyCBryant: @sweetchilinyc Just picked up lunch for the first time. KILLER tofu (And I don't even love tofu)!	1393031236	437030796671856641	f	sweetchilinyc
#HappyFriday come to Broadway btw Houston &amp; Bleeker 11-3! Lots of great specials to kick off your weekend! Rice pudding with mango cream!!	1392998164	436892083690164224	f	sweetchilinyc
Bean sprout salad + Vietnamese coffee + rainy day = happiness!! Broadway between Houston and Bleeker... http://t.co/QsirhsRzjk	1392997416	436888945130209283	f	sweetchilinyc
@TamaniG oh, we know you're sweet.	1393176228	437638938178904065	f	waffletruck
Did you try our new black Thai rice pudding yet?? Come get it at north end and vesey till 3!! http://t.co/fedC77zQ45	1392912954	436534687335739392	f	sweetchilinyc
It's lunch time at north end &amp; vesey till 3! We have iced coffee today! Also check out our newest dessert special! http://t.co/FWaGNr8b8r	1392912710	436533663623573505	f	sweetchilinyc
RT @DispatchNY: . @BrookfieldPLNY NORTH Lot | Thurs, 2/20/14 | North End Ave. &amp; Vesey St. | 11a-3pm | @SweetChiliNYC @FritesnMeats @MilkTru...	1392912567	436533065289330688	f	sweetchilinyc
It's not gonna snow or rain for at least the next 6 hours, YAY! Come outside for lunch today! WFC North end ave &amp; Vesey 11-3! #SunnyDay	1392899168	436476863410884608	f	sweetchilinyc
warm Black Thai rice pudding with mango cream and crispy taro! South end and liberty open at noon! http://t.co/guUKVKzMvu	1392828790	436181679640965120	f	sweetchilinyc
We won't be open till noon. Sorry guys!	1392825787	436169082287960064	f	sweetchilinyc
Well...since the west side highway is closed it's looking like we are going to be opening late today. Stay tuned...	1392822072	436153499827855360	f	sweetchilinyc
We are at south end &amp; liberty today 11-3. Make your #HumpDay a little brighter with our new warm black Thai rice pudding with mango cream!	1392819681	436143470366167040	f	sweetchilinyc
RT @dumbolot: Like it when the week starts off on a Tuesday! Love it when @KimchiTruck @sweetchilinyc &amp; @carlssteaks are in the lot!	1392738349	435802339270987777	f	sweetchilinyc
Happy Monday!  We won't be out today...Sorry! See you tomorrow DUMBO!	1392655286	435453950633209856	f	sweetchilinyc
Wont be going out today, taking a #snowday. have a great #ValentinesDay day everyone! See you after the weekend!	1392391272	434346595098689536	f	sweetchilinyc
RT @amykeefe: @alexislamster @saidchelsea @MexicoBlvd @waffletruck @sweetchilinyc @KELVINSLUSH @hibachiheaven ahh those all sound great. go...	1392299288	433960785111687168	f	sweetchilinyc
http://t.co/46x5i4InNC voted as one of the 10 sexiest foods alive!! ;) http://t.co/bsjSTY5w9O	1392239132	433708471725592576	f	sweetchilinyc
RT @FoodtoEat: @bigdsgrub @sweetchilinyc @tacobite FoodtoEat's 10 Sexiest Foods Alive for Valentine's Day - All Under $10 http://t.co/P8fDT...	1392238387	433705349049487360	f	sweetchilinyc
RT @DispatchNY: . @BrookfieldPLNY SOUTH Lot | Wed., 2/12 | South End Ave. &amp; Liberty St. | 11a-3pm | @SweetChiliNYC &amp; @ESTacoTruck | #foodtr...	1392222617	433639204783128576	f	sweetchilinyc
It's #HumpDay! Looks like the last of this week to get your sweet heat on! WFC south end &amp; liberty 11-3. Warm up with coffee and spicy food!	1392211658	433593238428336128	f	sweetchilinyc
RT @dumbolot: Things heating up on Jay &amp; Water with @carlssteaks @sweetchilinyc and @KimchiTruck today!	1392139069	433288779487776768	f	sweetchilinyc
Now open at court and Bergen! Donuts til 5:30pm	1393071699	437200511104995329	f	carpedonutnyc
Sat, Feb 22 - No truck today! Our shop open w/food &amp; treats 8am-6pm tonight! (closing early for private event). Have a great day!	1393071382	437199182370451456	f	thetreatstruck
Indoor stand at @bkflea @smorgasburg, North 5th &amp; Wythe. Sandwich menu always at @houstonhallnyc	1393079426	437232919325585409	f	milktrucknyc
Bessie's at Greenwich &amp; Chambers today, call (646) 504-6455 to pre-order or @FoodtoEat.com.	1393079425	437232918734200832	f	milktrucknyc
Breakfast is served! 2nd Street Salmon Special and the Baconana available for pick up at Le Cafe 15 Ave B. http://t.co/OaVanmfvB9	1393081208	437240395563827202	f	waffletruck
For one free dinges tell us the names of the stone lions statues at New York Public Library!	1393080656	437238082350645249	f	waffletruck
Vedette at Central Park South &amp; 6th Ave til 7pm Pagadder at BK Bridge/City Hall til 6pm	1393080544	437237612282400768	f	waffletruck
Kotmadam is in Williamsburg at Bedford &amp; N 5th til 12am Goesting is at Broadway &amp; 66th til 9pm V	1393080539	437237589083713537	f	waffletruck
Sunny saturday!  Kastaar is at Smith and Wyckoff til noon Momma is in Park Slope at 7th &amp; Carroll til 4:30pm	1393080530	437237553054625792	f	waffletruck
We're in SoHo, where the Duane Reade's have endless makeup sections and no pharmacys. You guys all look beautiful though . Bway and Prince	1393082391	437245358813749248	f	nautimobile
Pssssst - don't forget Le Cafe at 15 Ave B and Wafel Cabana at Herald Square! Open til 2am and 10pm, respectivaly.	1393081527	437241733903294464	f	waffletruck
Kasar truck is in Soho, Broadway and Spring street, all day until 8pm\nJoin us!!!	1393083463	437249855531282432	f	chipsykingny
@joestella7 yep it's our sandwiches with eggs, or you can get as platters with hash brown patties on the side. Mmmmmmmmm	1393084224	437253044942934016	f	philssteaks
Beautiful day for a cheesesteak. Truck's parked at 86th &amp; Lex until 5pm. #foodtruck #italianfries #wizwit #uppereast #shortysnyc	1393086712	437263479922098177	f	shortysnyc
#RedHookLobsterPound will be rocking the #BrooklynFlea N5th &amp; Wythe 10:00 -  6:00.  Claws up my crustaceans!	1393085122	437256812874985472	f	lobstertruckny
@SkeeterNYC thanks for the follow! We love your work! Our good friends @LandhausNYC speaks very highly of you. Hope to meet you one day...	1393085667	437259100028940288	f	mamuthainoodle
Some of the menu item will take another 30mins to be ready. #Soup #dumpling #sandwich #NoodlesSoup #TaroCake #tamale #chicken #beef #duck	1393085147	437256917195702272	f	shanghaisogo
Sunny Satauday! feeling  like spring is coming soon. We got what u WANT @president st &amp; 7th ave until 4:30pm!  &gt;&gt;#ParkSlope &lt;&lt;.....	1393084904	437255895945592832	f	shanghaisogo
The weekend is here, enjoy this beautiful day!	1393087765	437267896667213824	f	neaexpress
50 degrees out? REJOICE REJOICE! It's spekuloos ice cream season! http://t.co/UFOvYfVami	1393088412	437270609379483648	f	waffletruck
Hey Brooklyn , how is EVERYONE! Lovely day :) :) :) ...PALENQUE N ITS WONDERFUL AREPAS ARE BACK. Come join us now by prospect park residence	1393088830	437272363655495680	f	palenquefood
Slider Nation is a go! $5 off on ur @grubhub order! Use code wk5468! #sliders #wings #fries http://t.co/4FDQynopsm	1393090105	437277710382292992	f	mrniceguytruck
Check out Starrett Lehigh's new lobby! @starrett601 http://t.co/5TcUA4hRqC	1393090755	437280439808847872	f	valduccis
RT @JosiahRyan: No better place to get your Israeli fix in the city than @TaimMobile in soho	1393089780	437276347057311745	f	taimmobile
RT @USAFoodTruck: 59th street and 5th ave is where we're at today!  Right by Central Park and the apple store.  get the perfect picnic food...	1393088549	437271186830290944	f	shanghaisogo
@justin cohen here is one of our best pies! Mmmm Mmmm Good! http://t.co/H0h1TWhQKK	1393091330	437282850900287488	f	valduccis
RT @ChineseMirch: You heard right! We are open at #NYC after our makeover , even the menu got one! Stop by 4 a fun saturday out with  #frie...	1393092498	437287750128386049	f	getstuffednow
@alligonz as soon as the pier is open. We can't wait	1393096276	437303594552164352	f	nautimobile
Momma Truck St. John's University till 10p	1393255183	437970098540666881	f	waffletruck
It's a wafel party at Pagadder due to the perfect Brooklyn-Bridge-Walking-Weather (try to say that 10 times fast)! http://t.co/KJPNgN0OAM	1393095640	437300927280992256	f	waffletruck
@DigitalSuzy we're on spring and broadway	1393102788	437330908522115072	f	brooklynpopcorn
@websterhall http://t.co/SCGXD7Qoqv	1393103233	437332775755341825	f	valduccis
Hello lover #dinges http://t.co/7mVWH7eLCY	1393102853	437331180619579392	f	waffletruck
Tonight 7-12 Big Red will be playing shuffleboard at the #RoyalPalms. Come join us for a beer and a lobster roll! #RedHookLobsterPound	1393107316	437349901727711232	f	lobstertruckny
@drateberry Great! We look forward to hearing from you	1393107251	437349626124177408	f	neaexpress
Have a peak at some of the lobster-liciousness we'll be serving at the #RoyalPalms tonight 7:00-12:00. #RedHookLobsterPound...	1393113915	437377578522136576	f	lobstertruckny
Brunch at the @RoyalPalmsClub tomorrow, 2-6. We could get used to this!	1393121128	437407832854765568	f	nautimobile
@deejum not sure. We sent it to everybody in the burg.	1393143466	437501524332535808	f	waffletruck
@FIVEballs happy to oblige!	1393143416	437501314424389633	f	waffletruck
@TakdiraRahman we hear ya.	1393143375	437501143644925952	f	waffletruck
@WFOSponsors sho nuf!	1393143351	437501042541219840	f	waffletruck
@jvongrassamy sounds right.	1393143314	437500886215327744	f	waffletruck
RT @amyin613: Chili con corne wafels at @waffletruck. YUM. #LES #nyc http://t.co/ZtG8p9vgvj	1393143281	437500748646342656	f	waffletruck
@alyssejacobs @AmyFreeze7 yes yes. Do these things.	1393143265	437500680090443776	f	waffletruck
@VanDiesel24 we suuuurrree are.	1393143223	437500506593042432	f	waffletruck
@itsflourchild we do too!	1393143168	437500273041620992	f	waffletruck
@RIPLEYTHEBAND we love you too!	1393143142	437500167424868352	f	waffletruck
@TamaniG what you should feel is super excited to try it.	1393143108	437500024415870977	f	waffletruck
@MichaelMajoue apologies. Sunday is a busy day for us.	1393143055	437499801723498496	f	waffletruck
@LockwoodLiz @drantbradley soon soon hopefully.	1393142965	437499422097039361	f	waffletruck
Wafels in to de night!\n\nKastaar is at Astor Place til 1am\nMomma is in 7th &amp; Christopher til 1am	1393113634	437376399708794880	f	waffletruck
Kotmadam is in Williamsburg at Bedford &amp; N 5th til 12am\nGoesting is at Broadway &amp; 66th til 9pm	1393113621	437376343853248512	f	waffletruck
Have you tried our sundaes yet? #15aveB http://t.co/ksycMmmRXV	1393110035	437361305625051138	f	waffletruck
!!!Sunday, Feb 23rd, no truck today! Our shop open 8am-6pm w/food &amp; treats!!!	1393162778	437582525880627200	f	thetreatstruck
Yesterday was #margarita day,made us flashback 2 @jerseycity @DowntownHDSID event where we sold spicy margaritas! http://t.co/RvJxX0w9h7	1393163770	437586686458224640	f	getstuffednow
Indoor stand at @bkflea @smorgasburg, North 5th &amp; Wythe. Sandwich menu always at @houstonhallnyc	1393165827	437595313423933441	f	milktrucknyc
Back in #Dumbo. Front St &amp; Jay till 2:30.  @DUMBOFoodTrucks http://t.co/JMs5Trb3Zm	1392046472	432900396106121216	f	thesteelcart
@Punx5570 well, the idea of the free dinges came about before we even had savory waffles. So maybe ask for double  cheddar ??	1393169996	437612797745459201	f	waffletruck
Order like Kermit the Frog/Miss Piggy for a free dinges!	1393168638	437607102497169408	f	waffletruck
Momma Truck @ York &amp; 79th til 10pm\nKastaar in Forest Hills @ Continental ave &amp; Austin St till 10p	1393167965	437604281689309185	f	waffletruck
Pagadder @ BK Bridge til 6p\nVedette @ Central Park South &amp; 6th ave til 7p\nKotmadam @ Bway &amp; 17th st til 8p\nGoesting @ Bway &amp; 66th til 8p	1393167840	437603754670825473	f	waffletruck
Super Sunday!  \n\nLe Cafe @ 15 ave B til 11p\nDe Wafel Cabana @ 35th &amp; Broadway til 10p	1393167797	437603577000124416	f	waffletruck
RT @FoodChefMe: Brooklyn Popcorn and a Food Gal Giveaway http://t.co/YB2lZxaAG6 #Food	1393170897	437616579757752320	f	brooklynpopcorn
RT @caminobp: @BrooklynPopcorn caught you on Broadway ! Your clasic cheddar are epic ! http://t.co/qlIqWJZbq3	1393170811	437616219404128256	f	brooklynpopcorn
@PamelaRivers @ABC @mcharlesworth7 @RobNelsonABC7 What did we do to deserve this !!??	1393170957	437616829327220736	f	waffletruck
Come join us at our East Village Cafe @ Ave B &amp; 2nd St. Wafels for everybody! #dinges http://t.co/LJSRz9Ftug	1393170491	437614876207640576	f	waffletruck
Hey Brooklyn, We Are Back On 7ave &amp; Carroll Str. Next to Key Food. \nCome Join Us For Our Delicious Paisa Chicken Or Beef Arepas \n;)\n;)\n;)\n;)	1393171527	437619221611417600	f	palenquefood
Frank and Sammy http://t.co/Y1f05lfw78	1393171973	437621089792196608	f	valduccis
Afternoon Delight ! http://t.co/w3m7b4SAfa	1393171907	437620814247362561	f	valduccis
RT @crimsong19: @NuchasNYC You're quite welcome! You guys make good stuff!	1393172655	437623950236196864	f	nuchasnyc
RT @FoodtoEat: Are u hungry in #unionsquare? Get some @NuchasNYC ! Preorder on http://t.co/gR0d2xGugp http://t.co/Oe6Wd03s0x	1393172652	437623938227904512	f	nuchasnyc
Apple  @ 67th st &amp; broadway! We are here! Come get your Asian tapas from Shanghai Sogo. http://t.co/RLOZHyVX2s	1393172816	437624628911935488	f	shanghaisogo
Another top review for best sandwich in NYC..\n\nhttp://t.co/ABB2tQpybv	1393174642	437632285983006723	f	disosnyc
RT @lolotari: @shortysnyc Best night in NY. TY SO MUCH CHRIS. http://t.co/9tYlrTaXM2	1393174985	437633723329433600	f	shortysnyc
Hey folks enjoy the weather stop by SOHO  for a Carl's famous cheesesteak Broadway and Prince till 8 GOT WHIZ?	1393175719	437636805337571329	f	carlssteaks
@teenvanruak we want you to want us!	1393176953	437641980974497792	f	waffletruck
@TheInfamousDanR unfortunately not.	1393176912	437641805451243520	f	waffletruck
RT @TVRobNelson: Food on set is always a beautiful thing. Many thanks to the @waffletruck. Delicious!!! http://t.co/A8wSzH6V6b	1393176804	437641352843886593	f	waffletruck
@mieletpiment you should get one and tie it to a stick on your head and run toward it	1393176790	437641295679750144	f	waffletruck
@sammyhage @JoeTran19 come together!	1393176696	437640903172579328	f	waffletruck
RT @SephoraSlave07: The most delicious hot chocolate I have ever tasted! @waffletruck http://t.co/hs8FBlQx9P	1393176607	437640527362949120	f	waffletruck
@laurakazam YOU'RE the best thing ever.	1393176593	437640468684611584	f	waffletruck
@Punx5570 ...Cole slaw?	1393176561	437640336274636803	f	waffletruck
Hear that? Forever. RT @vivian_baa: If someone brought me @waffletruck right now I'd love you forever. I'm in need of spekuloos 	1393176517	437640149481316352	f	waffletruck
@JohnChetram heck yes!	1393176483	437640008405893120	f	waffletruck
@bam_its_nikki we be on 5th ave and 60th st. Short walk!	1393176447	437639856081371136	f	waffletruck
@feste30 @mcharlesworth7 @AmyFreeze7 sounds about good to us.	1393176402	437639666876297216	f	waffletruck
@PetiteAbeilleNY @ABCNetwork yay Belgian things!	1393176375	437639554989051904	f	waffletruck
@AmyFreeze7 @alyssejacobs like they had just been pressed in a wafel iron.	1393176111	437638448607158272	f	waffletruck
@Rice_Ball @minrix a pleasure having you.	1393176052	437638199582949376	f	waffletruck
@fabiolaloves_ sounds about right to us.	1393176008	437638016983900161	f	waffletruck
Tops...\n\nhttp://t.co/ABB2tQpybv http://t.co/NH5YFVUm8L	1393175479	437635794874814464	f	disosnyc
Lobster tank malfunction means you get a deal !! 20 dollar lobster dinners all day today and lobster at 10 per pound !	1393178047	437646568930693120	f	lobstertruckny
We hope you're having a lovely day!!! 	1393181227	437659905827545088	f	mexicoblvd
We're slingin' biscuits at the @RoyalPalmsClub in Gowanus today from 2-6.  We're learning the shuffleboard jargon, no big deal.	1393184285	437672732634140672	f	nautimobile
Sunday wouldn't be the same without Sliders!  Stop by or give us a call at 914-457-4324.\n\nAlso find us in... http://t.co/7y3VKgRQjh	1393183899	437671111677841409	f	mrniceguytruck
Spring is in the air! Come get your favorite treat at one of our locations! Did anybody say #icecream #spring #dinges http://t.co/TzIRHVZ23j	1393184219	437672452613615616	f	waffletruck
@MrSergioTheVega 6th Ave &amp; 59	1393188177	437689054679683072	f	waffletruck
@cheyenne_logan Hi Cheyenne we are in SOHO Prince &amp; Broadway! :)	1393202408	437748745342423040	f	brooklynpopcorn
Oh snap!\nThe Cinnamon Snail is #2 nationwide in Grub Street's list of 101 best donut spots in the country. \n\nROCK... http://t.co/S7Ri8GgIDz	1393199285	437735647403835392	f	veganlunchtruck
@cyclingflanders @PeterBols2 we bet you do!	1393225043	437843683312816128	f	waffletruck
@FIVEballs come back!!	1393224996	437843487505936384	f	waffletruck
@lkflavin touche	1393224976	437843402046967808	f	waffletruck
@MisterDanCheung well done!	1393224937	437843237055643648	f	waffletruck
@ericmaz @CarmineLoMonaco we eagerly await the live performance.	1393224897	437843071389016064	f	waffletruck
Monday is almost here...so is Polar Vortex III. Come and get one of these bad boys while it still makes sense. http://t.co/hPtZQpO2RL	1393203903	437755016188026880	f	waffletruck
Vedette @ Central Park South &amp; 6th ave til 7p \nKotmadam @ Bway &amp; 17th st till 8p Goesting @ Bway &amp; 66th til 8p	1393196570	437724257502511104	f	waffletruck
Kastaar in Forest Hills @ 71st Ave &amp; Queens Blvd till 10p  Momma Truck @ York Ave &amp; 79th St till 10p	1393196544	437724149092343808	f	waffletruck
Wafels at night!  \nLe Cafe @ 15 ave B til 11p \nDe Wafel Cabana @ 35th &amp; Broadway til 10p	1393196534	437724107577118720	f	waffletruck
@shellephoto: So worth the 2 hour hike feon Jersey! @waffletruck  #wafels #dinges #notgrumpyanymore http://t.co/uq19lix1Dy	1393196053	437722090469617664	f	waffletruck
RT @steph_NA: @shanghaisogo these spicy noodles are great! thanks for warming me up :)	1393195682	437720533351026689	f	shanghaisogo
((( NEW LOCATION ALERT )))\n\nMonday (tomorrow)- flatiron, 23 and 5th ave corner	1393195605	437720211425222656	f	disosnyc
Happy #Monday! Hope everyone enjoyed the taste of spring we got this weekend	1393243998	437923188123914240	f	neaexpress
51st and Park, We're open!	1393243846	437922548618379264	f	carpedonutnyc
Gooood morning, NYers! Shanghai Sogo park on Varick &amp; King for lunch until 3pm! create  any MEAL DEAL only $12 .	1393246385	437933199059353600	f	shanghaisogo
Come and Grub w/ us at 7 Hanover Square today for lunch. Preorders call 646-543-BIGD #FiDi	1393247177	437936519853387776	f	bigdsgrub
Is that any thing you wanna say about Shanghai Sogo? Please let us HEAR your voice, it is how we learn from the best! http://t.co/6L5rC7Fke6	1393248776	437943225404628992	f	shanghaisogo
Frank and Sammy would have loved Valduccis Pizza http://t.co/ymTElUdozs	1393250344	437949801624535040	f	valduccis
RT @BeautifulPuglia: Irish friends coming for dinner. Will they like it? @Valduccis @foodloverkathy @DublinFoodie @DublinFoodGirl http://t....	1393250107	437948808258146304	f	valduccis
Most don't care for Monday's, but we do, mostly because it connects Sweetery back w/all of u! Hudson/King till the cows come home, or till3p	1393251269	437953682617819136	f	sweeterynyc
Morning NYC! The jawn is on 41st between 6th and Broadway serving up breakfast til 11 and lunch til 2.	1393251223	437953492162842624	f	philssteaks
Frank and Sammy would have loved Valduccis Pizza http://t.co/5CnRgwfOii	1393250486	437950399983919104	f	valduccis
Rise &amp; shine! The truck is parked on Hudson &amp; Charlton st in #soho #westside http://t.co/Z6oby97iJc	1393250617	437950948934426625	f	nuchasnyc
We know it's Monday, but #KeepCalmAndShawarmaOn! Join us in #Brooklyn on Jay &amp; Water and order a shirt with lunch  http://t.co/Stoepr4XxE	1393251741	437955664867241984	f	toumnyc
Bessie's at @Columbia, 118th &amp; Amsterdam. Call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always at @houstonhallnyc	1393252229	437957708054941696	f	milktrucknyc
Sun and fun in the forecast. N. End Ave &amp; Vesey St.	1393252559	437959094184325120	f	kimchitruck
Located in flatiron today, 23rd st and 5th ave.. \n\nCall it in: 917-756-4145	1393253111	437961407167225856	f	disosnyc
It's Monday and we're closed but no need for a sad face, we'll be open again tomorrow and Big Red will be on the road for your lobster fix!	1393253722	437963973213052928	f	lobstertruckny
The cart will be on 55th &amp; Broadway from 11:00-2pm. Hope to see you out. @randomfoodtruck	1393253879	437964631379038208	f	schnitznthings
Morning guys. The truck will be on Varick and Charlton sts from 11:30-2pm. Come by for some schnitz and enjoy the sun. Preorder 347-772-7341	1393253787	437964244282527744	f	schnitznthings
Resuscitating the weekend on Front &amp; Jay.. Soups are Yellow Split Pea / Vegetable Minestrone (vegan) / Cream of Spinach @DUMBOFoodTrucks	1393253381	437962542703706112	f	thesteelcart
Hello midtown peeps, lunch 2day @ 50th st b/t 6th &amp; 7th av. Burger of the week THE GUACAMOLE BLAST. Preorder 9172929226	1393253961	437964975001600000	f	fritesnmeats
We are out and about on Varick &amp; King today! special VEGGIE combo's and special PACZKi for dessert! happy monday!	1393254726	437968183107268608	f	polishcuisine
Happy Monday hanging on 36th st bet 6th ave &amp;Broadway 11-3 nothing like cheesesteak weather gotta love it GOT WHIZ?	1393254813	437968546577260544	f	carlssteaks
We are back on Hudson and King. We look forward to seeing you!	1393255702	437972276395659264	f	thepocketful
50th and 6th today for lunch!!!	1393255590	437971806721277952	f	domotaco
Let's meet for lunch today!!\nWater Street and Hanover Square\n11am to 2:30pm\nPreorders call 646-543-BIGD\n#FiDi #TGIM	1393255447	437971207024279552	f	bigdsgrub
RT @FoodtoEat: @bigdsgrub @ParisSandwich @Porchettanyc The #FoodtoEat #AcademyAwards Presents the Nominees for Best Super Hero http://t.c...	1393255223	437970269127602176	f	bigdsgrub
Goesting @ Bway &amp; 66th til 8p\n Pagadder @ BK Bridge till 6pm	1393255216	437970236097048576	f	waffletruck
Vedette @ Central Park South &amp; 6th ave til 7p \nKotmadam @ 23rd &amp; 5th ave st till 8p	1393255205	437970192765710337	f	waffletruck
Manic Monday! \nLe Cafe @ 15 ave B til 11p \nDe Wafel Cabana @ 35th &amp; Broadway til 10p	1393255174	437970063836995584	f	waffletruck
RT @FoodtoEat: @bigdsgrub @ParisSandwich @Porchettanyc The #FoodtoEat #AcademyAwards Presents the Nominees for Best Super Hero http://t.c...	1393255423	437971104314171392	f	parissandwich
#HappyMonday catch us on Broadway &amp; 56 today 11-3! Rice cakes, pickled bean sprouts, radish cakes &amp; our new black Thai rice pudding! #yum	1393255207	437970199065944064	f	sweetchilinyc
RT @GenFoodTruck: @sweetchilinyc Plz RT New App Link for The World's Largest Food Truck Festival Ever! Part II: http://t.co/k5HSR3fpqc\nAll ...	1393255086	437969692104597504	f	sweetchilinyc
Start your week off right with a cheesesteak for lunch. Truck's parked at WFC--North End Ave &amp; Vesey.	1393256475	437975517330157568	f	shortysnyc
G1 - 5th Ave @20th Street\nG2 - Broadway &amp; 55\nSTEAK &amp; POTATOE MELT:\nSwiss, Sliced Steak,Tater Tots &amp; Brown Gravey. #ComeToTheCheeseYo	1393256055	437973757567967232	f	gcnyc1
Grill on Wheels @46th st off 6th ave! Open from 11:00-3:00crazy chickenbaby chickenlamb burgercouscous kofta kabab	1393255857	437972927309701120	f	grillonwheelsny
RT @BalaboostaNYC: Behind the scenes at Chef Einat's new restaurant Bar Balonat, opening in 3 weeks! http://t.co/oJ4QPsytUr	1393256554	437975848034258944	f	taimmobile
#polarvortex 3.0 on the way but enjoy the sun and the Shu's at @dumbolot in the meantime! @DUMBOFoodTrucks	1393256648	437976245964664832	f	mooshugrill
Good morning WFC!!! North End Ave today for lunch!!! Come get sommmmee!!!	1393256708	437976494334541824	f	mactruckny
RT @bowlerdave817: @mactruckny you are the man Dom! Thank you so much, my week home from work is awesome now! I really appreciate it	1393256376	437975102333132800	f	mactruckny
For one free dinges: What was the last Belgian town to host the Olympics?	1393256547	437975821840420865	f	waffletruck
Hello WFC South End&amp;Liberty! We have hot &amp; fresh Thai noodles for you today. Come n' get some! 11-3pm @downtownlunch @BrookfieldPLNY	1393256913	437977356637319168	f	mamuthainoodle
I posted a new photo to Facebook http://t.co/D6VKyjEaMu	1393257538	437979976722579456	f	polishcuisine
I posted a new photo to Facebook http://t.co/bS19jDSWUR	1393257270	437978853311410176	f	polishcuisine
I posted a new photo to Facebook http://t.co/7iCmHud5S2	1393257064	437977988584706048	f	polishcuisine
I posted a new photo to Facebook http://t.co/WsPhkeWXZD	1393257028	437977839258722304	f	polishcuisine
RT @dumbolot: Today's lot lineup includes such crowd favorites as @MexicoBlvd @ToumNYC and @mooshugrill!	1393257349	437979184498225153	f	toumnyc
Happy Monday! Meet us @Varick &amp; King for lunch  ComeCome get some #Asian Tapas. #Soup #Dumpling #Noodles #TaroCake #Tamale  #BraisedDuck	1393257575	437980133656653824	f	shanghaisogo
Happy Monday! Come get some warm black Thai rice pudding with mango cream and crispy taro today at 56... http://t.co/5LpCvloEBy	1393256905	437977320549519360	f	sweetchilinyc
Lunchtime is near. Hunger stands no chance when cheesesteaks are on the menu. 41st and 6th til 2. Get your Phil!	1393257897	437981481940815872	f	philssteaks
It's ok #Midtown, we know that Mondays have been hard without us lately- lets make this right and get down to cheesy business. 52 &amp; 6th!	1393257968	437981782542004224	f	morristruck
Join Kasar truck at 91st street and Columbus avenue. Happy Monday!!!	1393258401	437983597065404416	f	chipsykingny
We are ready on Varick &amp; King with some awesome lunch options! #pierogitime	1393258752	437985068314005504	f	polishcuisine
We can't believe the Olympics are over! Here are some of the best pics from the games to reminisce over http://t.co/skymIKt9Ex	1393259103	437986542100176897	f	neaexpress
RT @FoodtoEat: Heads up Brooklyn! Pre-order lunch from #mexicoblvd at Dumbo food truck lot! #linessuck http://t.co/RW6rSnmv	1393259405	437987807051927552	f	mexicoblvd
We'll be in #DUMBO til 3 today serving many delicious lunch choices &amp; taking requests for our truck playlist See you soon! #MB4E #tacolove	1393259305	437987386895896578	f	mexicoblvd
Back to the #cold. At least we're here on 53rd and Park with a new pick up order system by Square. #wut tell us what you think!	1393258673	437984737592737792	f	biandangnyc
Open for lunch.. 23rd st and 5 ave corner\n\nCall in your orders: 917-756-4145	1393258861	437985524402618368	f	disosnyc
Bobjo express open at State st &amp; whitehall st today. Thanks!	1393259837	437989618445979650	f	bobjotruck
Good morning!!! New York.  Bobjo  truck open @ 46st between 5th and 6th ave. Try our rice platter and ramen noodle soup! Thank you.	1393259745	437989235606704128	f	bobjotruck
@HHReynolds Enjoy :)	1393260562	437992662835404800	f	toumnyc
In honor of the ending of Sochi today's special features what else...VODKA. Chicken with vodka sauce pizza come... http://t.co/LIZEBlzxNu	1393261896	437998256074018816	f	eddiespizzany
Another angle\n#ComeToTheCheeseYo http://t.co/KxSyiOWMlG	1393262643	438001389667889152	f	gcnyc1
#ComeToTheCheeseYo http://t.co/Trsoi5Q2H5	1393262554	438001016915886080	f	gcnyc1
Steak &amp; Potatoe Melt \n#ComeToTheCheeseYo http://t.co/xOLOxp1TD9	1393262530	438000915279519744	f	gcnyc1
We are on old slip and water st	1393262206	437999557486862336	f	chefsamirtruck
RT @nycfoodtruck: RT @RoamingHunger: Gluten free &amp; Mexican food is NOT an oxymoron for Mexican Blvd. truck &amp; lucky NYers! @MexicoBlvd http:...	1393263406	438004590022492160	f	mexicoblvd
Enjoy our delicious Portobello mushrooms mixed with spinach, onion, mozzarella, and fresh herbs baked inside... http://t.co/vqVOmgOLHY	1393264803	438010448382660608	f	nuchasnyc
@Blim11 we're on Water St @ Old Slip	1393264318	438008416196239360	f	chefsamirtruck
Hosting The academy awards? From roasts to pizza,we cater it all Or rent the truck to your door! http://t.co/wf1RtVM2Cc	1393265334	438012677592735744	f	valduccis
@adrirena no problem!	1393265475	438013265419853824	f	mexicoblvd
@adrirena Received! Pick up on Jay &amp; Water St #DUMBO lot 	1393265241	438012284263497728	f	mexicoblvd
@HeyChristianD: @nycfoodtruck @MexicoBlvd @RoamingHunger WHAT IS THIS CREATION? One of our delicious tortas :)	1393264965	438011127814160384	f	mexicoblvd
@tjmmachine We're open. Stop by!	1393265830	438014756247465984	f	kimchitruck
Looking for a #job? We are looking to hire! Email us at work@neapolitanexpress.com for more info	1393266654	438018211972661249	f	neaexpress
@adrirena not a problem! If we end up making too many tacos we'll just eat them ourselves 	1393267232	438020637727391746	f	mexicoblvd
@ NYU stern on west 4th and Greene st.. Come get some\n\n- The society	1393269806	438031432179785729	f	disosnyc
@JoeyCircles 7 Hanover sq	1393270733	438035322719719424	f	lovemamak
closed for the day - thanks for coming in this beautiful sunny weather!	1393270735	438035328868556800	f	polishcuisine
@jimmykimmel works on his #pizza making skills for @Oprah this weekend #pizzalovers http://t.co/FdAtFCEgRz	1393271116	438036929498865665	f	neaexpress
Just added Barrier Medulla IPA Dry Hopped on tap. http://t.co/1nbz4mpALC	1393272692	438043538605879296	f	shortysnyc
Just added Flying Dog Single Hop Imperial IPA (El Dorado) on tap. http://t.co/DrTo5N5eqT	1393272596	438043135357505536	f	shortysnyc
We're stayin open ALL day @CU! Find us on Amsterdam &amp; 116th till 8	1393272758	438043815363215360	f	korillabbq
Need to take the edge off this work week? Add a little play to your work with these tips :) http://t.co/XwEPuQzYpn	1393273513	438046979927834624	f	neaexpress
Innovative technology with @ATT to make the car of the future http://t.co/mNY2kf3y0p	1393276217	438058324161216512	f	neaexpress
Cure the #MondayBlues with Nuchas for dinner. We're parked on 14th &amp; 3rd in #UnionSq ... maybe grab a bottle of... http://t.co/3JAsHLNL6m	1393276363	438058933236670464	f	nuchasnyc
Cure the #MondayBlues with Nuchas for dinner! We're parked on 14th &amp; 3rd in #UnionSq	1393276200	438058250635067392	f	nuchasnyc
RT @FoodtoEat: Never too early to start thinking bout #dinner. Preorder here: http://t.co/wE3LS94MN1  RT @NuchasNYC Cure the #MondayBlues w...	1393276825	438060873262043137	f	nuchasnyc
Night shift at W. 4th and Greene til 8!	1393278026	438065911337988096	f	philssteaks
RT @trullozippo: @BeautifulPuglia @Valduccis @foodloverkathy @DublinFoodie @DublinFoodGirl surely if washed down with lots of #guiness	1393278045	438065989037875200	f	valduccis
@shanghaisogo: CU dinner at 116th st  and Amsterdam ave til 8. Sogo for it!!	1393279705	438072953440595969	f	shanghaisogo
@RoyalPalmsClub: Were happily hosting @MexicoBlvd for league night tonight. Come hungry, its forking delicious. 	1393281415	438080125499092992	f	mexicoblvd
Brooklyn! We are parked inside at the @RoyalPalmsClub tonight! Shuffle on over for dinner &amp; drinks with us :)	1393281350	438079850239508480	f	mexicoblvd
How the Olympics effected Sochi's #environment http://t.co/5cI1Zrpnuu	1393283118	438087267916476417	f	neaexpress
Goesting @ Bway &amp; 66th til 8p\nPagadder @ BK Bridge till 6pm	1393283141	438087363504656384	f	waffletruck
Vedette @ Central Park South &amp; 6th ave til 6:30p\nKotmadam @ 23rd &amp; 5th till 8p	1393283130	438087318126460929	f	waffletruck
Momma Truck @ St John's University till 10p	1393283119	438087273364856832	f	waffletruck
Le Cafe @ 15 ave B til 11p \nDe Wafel Cabana @ 35th &amp; Broadway til 10p	1393283107	438087223209373696	f	waffletruck
making rounds on 52nd b/w 6th and 7th tomorrow - get ready midtown - special surprise dessert!	1393293167	438129416406073344	f	polishcuisine
making rounds on 52nd b/w 6th and 7th tomorrow - get ready midtown!	1393293136	438129286026121216	f	polishcuisine
USA Today called us one of NYs top ten best food trucks. How very nice of them. http://t.co/LyxXbDGPa4	1393300001	438158079776292864	f	nautimobile
Can I have a sip of your delicious soft drink http://t.co/BIjyWWd980	1393286483	438101381371920388	f	valduccis
Come in soon homemade drinks http://t.co/m4zl1h7rDY	1393286211	438100240101806081	f	valduccis
@Hiramcamillo you must not know about #juggalos and #bronies	1393298896	438153445514960896	f	veganlunchtruck
Our mechanic is hopefully almost done fixing up our truck! We'll update about Wed as soon as we know! Our shop open 7:30am-8pm!!!	1393331825	438291560493379584	f	thetreatstruck
I posted a new photo to Facebook http://t.co/aFMKVhswG3	1393332595	438294786987266048	f	polishcuisine
I posted a new photo to Facebook http://t.co/UytLh0AM1O	1393332546	438294584251387904	f	polishcuisine
I posted a new photo to Facebook http://t.co/Zx00NOehi9	1393332484	438294321918648320	f	polishcuisine
I posted a new photo to Facebook http://t.co/uAq1diQWTW	1393332448	438294172928573440	f	polishcuisine
MidtownLunch for Tuesday. Shanghai Sogo will be serve @ w46th st &amp; 5~6th ave. Come get ur Asian tapas fixed. Love to see your all later! :-)	1393332342	438293727183142912	f	shanghaisogo
Coming soon homemade soft drinks http://t.co/iZLOERLAx4	1393333429	438298288799121408	f	valduccis
Hey everyone, like our Facebook page ! ValduccisPizza!	1393335806	438308258991071233	f	valduccis
Check out the USA Today's Top 10 Food Trucks http://t.co/Smfx6ko7yP	1393336233	438310047035424768	f	taimmobile
@ 48th st between 6 and 7 ave today.\n\nCall ins welcome: 917-756-4145	1393336486	438311108873846784	f	disosnyc
Sadly, winter is back. Stay warm today!	1393338022	438317551953518592	f	neaexpress
Come n' Grub w/ us at @BrookfieldPLNY today! Vesey Street and North End Avenue. Preorders call 646-543-BIGD	1393338140	438318045497655296	f	bigdsgrub
It's coooold out here on the streets but we're here for you #midtown! catch us on 49th &amp; 6th ave slinging #NYC's finest #mooshu!	1393338350	438318925701722112	f	mooshugrill
Heating up the block on 53rd &amp; Park! I mean like fryers tho not like #raymondfelton	1393338086	438317819214565376	f	biandangnyc
If there was a gold medal for fastest taco assembly it'd have to go to the Canadian on the truck today. See for yourself on 55th &amp; Broadway!	1393338906	438321258233479169	f	domotaco
Hellllooo #MidtownWest! We've got all the kafta your heart desires on 46th btwn 5th &amp; 6th! #LebaneseLunch http://t.co/B8YkgoKUvl	1393338819	438320892620570624	f	toumnyc
My Momma absolutely Loves Valduccis Pizza http://t.co/QcC2Pbeu4N	1393339077	438321978043559936	f	valduccis
http://t.co/Hi2oaoMaXs	1393339011	438321700229640192	f	valduccis
Hey #midtown! NUCHAS Truck is located on 52nd street &amp; 6 ave http://t.co/1BKbb4UkEg	1393338871	438321113203212288	f	nuchasnyc
RT @Trucksome: 10 Best #foodtrucks in #NYC\n\nhttp://t.co/mtTytaSCGm\n\n@VLAIC @KorillaBBQ @LukesLobster @NautiMobile @milktrucknyc @elolomega ...	1393339451	438323544565362688	f	milktrucknyc
Bessie's at 25th &amp; Park, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always at @houstonhallnyc	1393338630	438320100597186561	f	milktrucknyc
@tjmmachine &lt;3 &lt;3 &lt;3	1393339320	438322996177281024	f	kimchitruck
RT @tjmmachine: .@KimchiTruck you guys are the best! I love you and your food and your super friendly staff! THANK YOU!	1393339257	438322731999043584	f	kimchitruck
Cold enough to get some hot curry and bites at 55 &amp; Broadway #foodtruck @midtownlunch #SpicyFood	1393339511	438323794852454400	f	mausamnyc
No truck today.  With all the warm weather coming our way, Big Red is dolling up for spring. #RedHookLobster	1393340110	438326308649857024	f	lobstertruckny
RT @OMGItzJR: @carlssteaks Just bought an awesome steak! http://t.co/C160z6lIXT	1393339967	438325707866120192	f	carlssteaks
Today's specials:\n\n- hot roast beef sandwich\n\n- breaded zucchini sticks with marinara sauce\n\n- breaded toasted raviolis with marinara sauce	1393340132	438326403055255552	f	disosnyc
@midtownlunch HH2 is on Park Ave bet 32 &amp; 33st word of the day is "Heavenly" for ur free upgrade. Get ur #YumYum on	1393340521	438328031653163008	f	hibachiheaven
Located on 49th, between 6th and 7th.	1393341137	438330616573345792	f	thepocketful
Headed to SoHo's Varick and Vandam!	1393341215	438330944530173952	f	korillabbq
Yep! 56th &amp; Broadway. Yellow Split Pea &amp; Ham + Vegetable Minestrone on board.	1393340852	438329421133385728	f	thesteelcart
Hello FIDI, lunch 2day @ 10 Hanover sq b/t water st &amp; pearl st. Burger of the week THE GUACAMOLE BLAST preorder 9172929226	1393340596	438328349526855682	f	fritesnmeats
Kasar truck is at Wall Street and Williams street all day until 6 pm\nHappy Wednesday!!!	1393340974	438329934876913664	f	chipsykingny
Just added Coney Island Mermaid Pilsner on tap. http://t.co/sUIKGm0XPY	1393341759	438333224788697089	f	shortysnyc
Just added Oskar Blues Ten Fidy 2013 on tap. http://t.co/6dKm4ZYxyF	1393341683	438332908554952704	f	shortysnyc
Lunch today at 51st and Park 11-2!	1393341867	438333678775988224	f	philssteaks
Reminder that this Thursday is FAT THURSDAY! you can pre-order PACZKI w/rose jam by Wednesday 3:00. Truck will be... http://t.co/RTbO6yEjCv	1393341331	438331429676544000	f	polishcuisine
Tuesday =BROOKLYN  @dumbolot water &amp; jay st 11-3 cheesesteaks for all Don't forget our BEER BATTERED ONION RINGS http://t.co/XleMbjpNg5	1393341648	438332759120293888	f	carlssteaks
In the immortal words of Jean Paul Sartre, Au revoir, gopher. Jay &amp; Water St. 11:30-2:30	1393341531	438332267598217216	f	kimchitruck
Get ready DUMBO! We are at Jay &amp; water @dumbolot 11-3 with killer specials! Rice cakes, Thai rice pudding and more! http://t.co/WNpFObiYUs	1393341584	438332492580671488	f	sweetchilinyc
RT @dumbolot: The spice is alright in the lot today with @carlssteaks @sweetchilinyc and @KimchiTruck!	1393341491	438332099930902528	f	sweetchilinyc
Just added Cigar City Jai Alai IPA cans. http://t.co/obvGrjKyTK	1393342923	438338107277340672	f	shortysnyc
No lunch plans? No problem! we are on 52nd b/w 6th and 7th with special POPPYSEED CAKE today! @Midtownlunch @nystfood	1393342706	438337196316446720	f	polishcuisine
Goesting @ Bway &amp; 66th til 8p \nPagadder @ BK Bridge till 6pm	1393342536	438336483964223488	f	waffletruck
Vedette @ Central Park South &amp; 6th ave til 6:30p \nKotmadam @ 23rd &amp; 5th till 8p	1393342528	438336451986866176	f	waffletruck
Momma Truck @ Trinity School 91st &amp; Columbus Ave all day! \nKastaar @ NYU Stern at W 4th &amp; Greene till 10p	1393342518	438336407858577408	f	waffletruck
Tasty Tuesday!\nLe Cafe @ 15 Ave B till 11p \nDe Wafel Cabana @ 35th &amp; Broadway till 10p	1393342508	438336367048028161	f	waffletruck
Hey! Who is hungry? SS will be serve ya lunch @46th st &amp; 5~6th ave 11~3pm. #Rice #Noodles #Dumpling #HibachiChicken #RoastBeef #BrasiedDuck	1393342317	438335566955159552	f	shanghaisogo
Hi guys, the truck will be on 52nd &amp; 6th ave from 11:30-2pm. Come get schnitzed with us. Preorder 347-772-7341	1393343222	438339363089694720	f	schnitznthings
Making a quinoa w/ cheese arepa @ smorgasburg in Williamsburg every Saturdays And sundays! See u there! http://t.co/lAFdkkRrKD	1393343870	438342078641475584	f	palenquefood
Grill on Wheels is in Midtown! Parked on 47th off Park Ave today! #schnitzel #crazy chicken#falafel	1393343353	438339912421900288	f	grillonwheelsny
RT @SFATW_official: Awesome #mexican #streetfood #tacos from @MexicoBlvd ! @nystfood  #newyorkcity #yummy  #delicious http://t.co/KzEArJQcVb	1393343756	438341603137425408	f	mexicoblvd
#Midtown we are so excited, we will be delivering soon from 18th street to 40th street on the eastside! #happycustomers!	1393343292	438339656514818049	f	getstuffednow
For one free dinges: which state has borders with only one other state?	1393343324	438339788954144768	f	waffletruck
The cart is making another appearance on 55th &amp; broadway today from 11-2pm. Hope to see you guys	1393344350	438344092834357249	f	schnitznthings
G1- Varick &amp; Charlton\nG2- 60/5\nCome get cheesey goodness\n#ComeToTheCheeseYo	1393344218	438343538263465984	f	gcnyc1
Lunchtime Grub is ready @BrookfieldPLNY! Do you smell the goodness coming out of this truck? http://t.co/O6uYFzVXLO	1393344527	438344837184884736	f	bigdsgrub
Manhattan, we promise we won't tell anyone if you order one of each. With cheese. See you on 46th St. We're parked between 6th and 7th Ave.	1393344892	438346366222622720	f	mexicoblvd
(( #Preorder your meal(s) http://t.co/aAbStQP4UO )) (( Pick up today #46th St btwn #6th &amp; #7th Aves ))	1393344836	438346129932300288	f	mexicoblvd
We will be at a special event at the @RoyalPalmsClub tomorrow, but back to 23rd and Park on Thursday!	1393345435	438348645675859968	f	nautimobile
Do you smell the goodness coming out of this truck? #bulgogi #daejibulgogi #tacos @BrookfieldPLNY http://t.co/aATQsgtINh	1393345419	438348577371594752	f	bigdsgrub
We are on 36st and broadway	1393345412	438348546027569154	f	chefsamirtruck
Open for lunch, 48th bet 6 and 7 ave\n\nCall it in: 917-756-4145	1393345639	438349498730176512	f	disosnyc
Open and ready on 52nd b/w 6th and 7th (closer to 6th) - #pierogitime	1393346376	438352591903137792	f	polishcuisine
SoHo- G1 - Have some Electric issues. ..\nShutting down and going to the Truck Doctor...\nSorry	1393345936	438350744010653696	f	gcnyc1
Ready in 5 but gots some bad news. Fryer's on the fritz, so nothing fried today.	1393346321	438352359291645954	f	kimchitruck
RT @newyorkeventsco: @lobstertruckny see you in a few weeks. #RedHookLobster :-)	1393347049	438355415232151553	f	lobstertruckny
@StarkIngenuity the state of Canada?	1393347602	438357731456847873	f	waffletruck
@thatbeastmarlon we feel you're just the right amount of excited actually.	1393347569	438357595213275136	f	waffletruck
@AyariMakeOvers mayhaps we will, mayhaps we will.	1393347544	438357489160318976	f	waffletruck
@Lann730 heck yes! We love Queens!	1393347366	438356741487861760	f	waffletruck
@evyanh2o a wafel...with spekuloos.	1393347337	438356623162343424	f	waffletruck
@RupenRao we served one of those! Weird.	1393347320	438356551171334145	f	waffletruck
@shellephoto thanks for making the trek!	1393347299	438356461656498176	f	waffletruck
whoa.  congrats everyone. this is cool!! 10 best food trucks in New York City http://t.co/sOkjjCrUAG via @usatoday	1393348419	438361159125577728	f	milktrucknyc
RT @souvlakitruck: Honored to be mentioned in @USATODAY 10 Best NYC Food trucks with @milktrucknyc @LukesLobster @KorillaBBQ @NautiMobile @...	1393348295	438360638684160000	f	milktrucknyc
RT @34thStNYC: .@KELVINSLUSH rated 1 of 10 best food trucks in NYC by @USATODAY. Their slushes avail at @NuchasNYC in Greeley Sq too http:/...	1393348220	438360324249763840	f	nuchasnyc
RT @jenist: the weekly Tweets between @johndelsignore and @KimchiTruck make lunch time more fun https://t.co/AXujaRK7AU https://t.co/SWyAQX...	1393348070	438359694814765056	f	kimchitruck
@xfthhxk Sadly, no	1393348013	438359458297937920	f	kimchitruck
@johndelsignore I'm a god, not thee God	1393347888	438358932751646720	f	kimchitruck
RT @Twoby: Many thanks to @thesteelcart. Not only is their food delicious, look: http://t.co/4Cit5qRnQQ	1393348181	438360162081177600	f	thesteelcart
@teenvanruak @Sonisukhi we stand prepared!	1393347671	438358024139571200	f	waffletruck
@teenvanruak of course we love you!	1393347660	438357976190300160	f	waffletruck
Howdy all u lovely NY'ers! We are open in #redhook from noon-7. come get yo' #lobstah on!	1393349414	438365331317596160	f	lobstertruckny
RT @KELVINSLUSH: 10 best food trucks in New York City http://t.co/c9PlZrBT00 via @usatoday	1393350022	438367884319162368	f	valduccis
@originalhowardp We hope to bring falafel your way soon, working on logistics right now.	1393351087	438372349289963520	f	taimmobile
Bobjo truck open at water &amp; hanoversq today! Try our ramen.	1393352543	438378458369261568	f	bobjotruck
@conalicious yes!	1393353574	438382780909887488	f	chefsamirtruck
@thebigmistry lol awesome! Thanks priya :)	1393356517	438395126709497856	f	disosnyc
RT @janawinter: @AdamShawNY @Karl_de_Vries You guys are missing sandwiches from @DiSOSNYC truck right now. Prosciutto, mozzarella sun dried...	1393356481	438394974116147201	f	disosnyc
We have fans too! Disos 48th st today! http://t.co/7IQAd8CCIb	1393357147	438397768265371648	f	disosnyc
closed for the day - we'll be in midtown east 47th street tomorrow. Don't forget to pre-order PACZKI for FAT THURSDAY! #yum	1393357830	438400634077708288	f	polishcuisine
Thank u all for coming today, wish you a wonderful day, Be happy &amp; enjoy Shanghai SogoLicious.	1393358480	438403360191152128	f	shanghaisogo
RT @LebaneseProblem: #WhatIsPeace \nShawarma + Toum =  Peace 	1393359722	438408566702370816	f	toumnyc
Afternoon snack? Early dinner? Both? W. 4th and Greene is the spot. Come to the jawn! Now til 8	1393361580	438416362143490048	f	philssteaks
CU dinner at Amsterdam ave &amp; 116th st til 8pm. Sogo for it!! &gt;&gt;#CU &lt;&lt;.....	1393362010	438418164095803393	f	shanghaisogo
ANNOUNCING: Our first brick and mortar location in Trumps 40 Wall Street! @PMQpizzamag http://t.co/BbF7xyHaqE #pizza #neaexpress #wallstreet	1393362126	438418648919977985	f	neaexpress
RT @nystfood: Correction to last tweet about @bigdsgrub new cart. It is not exclusively Thai but will feature many different types of asian...	1393363273	438423459988008960	f	bigdsgrub
RT @LaBellaTorte: Fat Tuesday is March 4. Don't forget to order your Kings cake call us at 347-435-4570 or respond in the comments section	1393364114	438426989071200256	f	valduccis
@deeCuisine We'll be back soon!	1393368922	438447155138035713	f	nuchasnyc
@JerriReid We'll be back soon!	1393368918	438447139015122944	f	nuchasnyc
Hanging @RoyalPalmsClub tonight from 6-11! Get your shuffleboard and sweet heat on!	1393369413	438449214281236480	f	sweetchilinyc
RT @steph_sisco: I don't care that it's freezing, I'm in need of this @SweeteryNYC iced coffee! @ChelseaLRenaud !! http://t.co/awbuniyyCz	1393371606	438458412645351424	f	sweeterynyc
Reminder: FAT THURSDAY is in 2 days! pre-order your PACZKI w/special rose jam by 3:00 Wednesday! email us:... http://t.co/dWDg5jdDvf	1393381326	438499179946856448	f	polishcuisine
RT @PMQpizzamag: PMQ Exclusive: @NeaExpress goes brick and mortar http://t.co/rwC4swM2FU	1393379575	438491838400708608	f	neaexpress
@brianragan @seamless @grubhub @mry @uxprinciples Enjoy!!	1393373858	438467857786368001	f	nuchasnyc
RT @BrianRagan: @Seamless @GrubHub Thanks for sponsoring @NuchasNYC tonight! Mmm...empanadas. cc @MRY @uxprinciples	1393373852	438467833883021312	f	nuchasnyc
Donarts (half Tart, half Donut) are coming @thegreenradish1 http://t.co/2lRLjsXmRr	1393374008	438468485916934144	f	thegreenradish1
The DONARTS are coming...	1393372054	438460292054282240	f	thegreenradish1
I posted a new photo to Facebook http://t.co/wryG7unNUr	1393372053	438460288510066688	f	thegreenradish1
I posted a new photo to Facebook http://t.co/3sNjezEGJ5	1393372052	438460284785532928	f	thegreenradish1
http://t.co/r4X5X6TB	1359646681	297005824084176896	f	thecrepestruck
Kotmadam @ 23rd &amp; 5th till 8p \nGoesting @ Bway &amp; 66th til 8p	1393372466	438462018602139649	f	waffletruck
Momma Truck @ Trinity School 91st &amp; Columbus Ave all day! \nKastaar @ NYU Stern at W 4th &amp; Greene till 10p	1393372457	438461981742624768	f	waffletruck
Le Cafe @ 15 Ave B till 11p \nDe Wafel Cabana @ 35th &amp; Broadway till 10p	1393372448	438461942676856832	f	waffletruck
Headed to FiDi's Front St &amp; Gouveneur Ln + @DUMBOFoodTrucks Jay St &amp; Water St.	1393421747	438668721453010945	f	korillabbq
@carolinacadillo not today . We will be in the city Thursday and Friday. Please follow us as we cannot send you a direct message!	1393424619	438680766248402944	f	valduccis
The NUCHAS truck is located on 50th street &amp; 6 ave! #Midtown @radiocity! http://t.co/Q5uIlAl9a1	1393424670	438680977591005184	f	nuchasnyc
Somewhere in the flurries on 47th St between Park &amp; Madison. - Soups are Creamy Corn Chowder / Vegetable Minestrone / Yellow Split Pea &amp; Ham	1393424761	438681361776250880	f	thesteelcart
@whiiterox as soon as we are back from winter break.  We  our FiDi peeps	1393424702	438681113423511554	f	veganlunchtruck
Bessie's at 58th &amp; Mad, call (646) 504-6455 to pre-order or @FoodtoEat.com. Sandwich menu always at @houstonhallnyc	1393425031	438682495781847040	f	milktrucknyc
Hey #Midtown! Beat the cold today with some sizzling hot BBQ--find us on 55th Street and Broadway! Preorders call 646-543-BIGD	1393425062	438682622156619776	f	bigdsgrub
Tell us this is the last snow of the season. 55th St. bet. 6th &amp; 7th Ave. 11:30am - 2:30pm	1393425636	438685030639218688	f	kimchitruck
@midtownlunch HH3 is on 46st bet 5&amp;6 Ave @downtownlunch HH2 is in #FIDI on Broad &amp; Water. Word of the day is "Snow" for ur free upgrade	1393426718	438689568691609600	f	hibachiheaven
Don't let a couple of snow flakes keep you from your lobster fix! Come visit Big Red at 50th&amp;6th Ave for a lobster roll. #RedHookLobsterRoll	1393426523	438688752626843648	f	lobstertruckny
Hey steakers! The jawn is on 41st btw 6th and BWay on this Whiz Wednesday. Rocking until 2 and then heading to NYU. Get your Phil!	1393426690	438689451888230400	f	philssteaks
We made it to #MidtownEast despite the snowy weather. Join us on 47th btwn Park &amp; Lexington Ave for #Healthy #Yummy #LebaneseLunch	1393426321	438687903578091520	f	toumnyc
Thursday night @WebsterHall  @MayerHawehorne  performs Everybody eats @valduccis pizza come and have fun http://t.co/z3M70vp1eq	1393426677	438689395668176897	f	valduccis
Midtown get your pizza fix tomorrow  Thursday http://t.co/I3NsqZgNdz	1393426151	438687189296500736	f	valduccis
@ soho today, corner of varick and charlton st\n\nCall in orders: 917-756-4145	1393426482	438688581084012544	f	disosnyc
Give us the only English word that ends with the letters "mt" for a free dinges! Good luck!	1393426522	438688748365430784	f	waffletruck
Vedette &amp; Pagadder decided to stay in and watch movies.	1393426144	438687164071948288	f	waffletruck
Kotmadam @ 23rd &amp; 5th till 8p\nGoesting @ Bway &amp; 66th till 8p	1393426137	438687132178448384	f	waffletruck
Momma Truck @ 60 Wall St till 4p	1393426127	438687089417519104	f	waffletruck
Snowy Wednesday (seriously?)  \nLe Cafe @ 15 Ave B till 11p \nDe Wafel Cabana @ 35th &amp; Broadway till 10p	1393426119	438687058262253569	f	waffletruck
Hello all, snow What snow? Still serving up our famous piping hot cheesesteaks 49th st bet 6th &amp; 7th ave11-3 @SiriusXMNFL @SIRIUS @Barclays	1393426994	438690728898994177	f	carlssteaks
Enuf with the snow, #ComeToTheCheeseYo\nG1 - 36th 6/Broadway\nG1 - 26th 11/12th \n#starrettlehigh\nSteak &amp; Potatoe Melt w/swiss, onions, gravey	1393426823	438690008263045120	f	gcnyc1
Happy Wednesday! Hopefully your day ends up as well as this couple! http://t.co/2YAqattagn	1393427268	438691876414439424	f	neaexpress
@PizzaCuz  and @Valduccis says New York is the best	1393427597	438693255698710528	f	valduccis
@PizzaCuz  rocking in on @RachaelRayShow	1393427501	438692854601637888	f	valduccis
Hello soho, lunch. 2day @ Hudson &amp; king. Burger of the week THE GUACAMOLE BLAST. Preorder 9172929226	1393427246	438691782596251648	f	fritesnmeats
Let it snow, let it snow. Come out &amp; best the cold with Shanghai Sogo @46th st &amp; 5~6th ave 11~3pm. #VeganSoup #Rice #Noodles #Dumpling	1393427625	438693375814807552	f	shanghaisogo
It's another snowy #HumpDay south end &amp; liberty 1130-3. Don't forget to ask for a free coffee sample to warm you up! @BrookfieldPLNY #coffee	1393427138	438691329116491776	f	sweetchilinyc
We are on 47th b/w Park &amp; Lexington (closer to park) today! Special Poppyseed cake is definitely on board!	1393428447	438696821490466816	f	polishcuisine
Hi guys, unfortunately the truck is having mechanical issues and won't be out today. The cart is on 27th &amp; Park from 11:00-2pm. Hope 2 c u!	1393428048	438695148084801537	f	schnitznthings
Located on 53rd, between PARK &amp; MADISON	1393428316	438696273362034688	f	thepocketful
@PizzaCuz and @Valduccis says NewYork Pizza is the best!	1393428254	438696010991554560	f	valduccis
Snow is back, but our Black Bean soup in Nolita and Lentil soup in the West Village are here for you. It's gonna be ok.	1393428251	438695999188795392	f	taimmobile
Truck's back at DUMBO--Jay &amp; Water St #cheesesteakforlunch #dumbonyc #cheesefries #shortysnyc #foodtrucknyc	1393429250	438700190405373953	f	shortysnyc
Trucks back in DUMBO--Jay &amp; Water St. #cheesesteakforlunch #dumbonyc #shortysnyc #cheesefries	1393429117	438699631774822400	f	shortysnyc
Arepa love @ smorgasburg Feb 2014 http://t.co/2tgYg54roF	1393429438	438700976774844416	f	palenquefood
Catch us in the DUMBOlot on Jay &amp; Water today! #realfood #madefromscratch #aintnohalfsteppin	1393429411	438700865457635328	f	domotaco
Don't let the cold  get u down, Grill on Wheels today on 55th st Broadway! Join us for kosher grill!!! Open from 11:00-3:00	1393429269	438700270026248192	f	grillonwheelsny
Hey @DumboNYC @DUMBOFoodTrucks we won't let this winter weather get us down. Come to Adams near Front st for soul warming goodness! #EAT	1393428817	438698374267936768	f	morristruck
Secret #snowday location:D follow the smell of #mooshu!	1393428723	438697978648608768	f	mooshugrill
Check out what THE GOTHAMIST has to say about our  DONARTS!!!... http://t.co/GLLMcwUEKS	1393428753	438698103609114624	f	thegreenradish1
Valduccis agrees with @PizzaCuz  PollyO Mozzerella is the Best !!!	1393430079	438703664551956480	f	valduccis
Baby it's cold outside... which makes it a perfect day to try our preorder system at http://t.co/PaquryCPau! Pickup at 53rd &amp; Park	1393429759	438702324786016256	f	biandangnyc
RT @Gothamist: Donarts Are Coming! That's Half Donut, Half Tart http://t.co/FTOBoB6R9H (from @thegreenradish1)	1393430408	438705045757259777	f	thegreenradish1
open now until 2:20 on 47th b/w park &amp; lex - special veggie combo's and poppyseed cake await you! @nycfoodtruck @midtownlunch	1393431195	438708346657316864	f	polishcuisine
Love! RT@grist Best kitchen utensil ever lets you combine your two main loves: bikes and pizza http://t.co/X8mWNhA57s http://t.co/o3Crqxl3Rd	1393431126	438708057200398336	f	neaexpress
Bob Jo express open at park ave. 47th st. Thx	1393430784	438706624698785792	f	bobjotruck
Good morning New York! We are stay at Broadway and 55th st between 56th st. Try our ramen noodle soup and rice platter. Thanks!!	1393430691	438706235563839488	f	bobjotruck
Hey. Don't leave your belly out in the cold. Come warm it up. North End &amp; Vesey St lot. Preorder via http://t.co/aAbStQP4UO. You're welcome.	1393430508	438705466987003904	f	mexicoblvd
#snowday again?	1393431246	438708560567214080	f	getstuffednow
Yes!!get yr fresh #CURRY N BITES 52nd &amp; 6th Ave. Our #vindaloo spicy flavor is ideal for today.	1393431071	438707828874678272	f	mausamnyc
Arizona , are you kidding me? Denying #Gay patrons at restaurants because of your religious views?#TheView #unconstitutional	1393431589	438710001096740864	f	valduccis
Sun's out! Let's Grub at Broadway and 56th Street, now till' 2:30pm. Preorders call 646-543-BIGD	1393432039	438711888369950721	f	bigdsgrub
RT @randomfoodtruck: Our snazzy Wednesday lineup: @tacobite @bobjoTruck @GrillOnWheelsNY @KatzNDogzTruck @bigdsgrub	1393431867	438711166198882304	f	bigdsgrub
RT @DispatchNY: . @BrookfieldPLNY NORTH Lot | Wednesday, 2/26 | 11a-3pm | North End Ave. &amp; Vesey | @MexicoBlvd #nycfoodtruck #lunchtime	1393432133	438712281149743104	f	mexicoblvd
We are Open at the WFC lot on north end ave &amp; Vessey street!\n\nCome and get some	1393432034	438711868371521536	f	mexicoblvd
Open at the WFC LOT!!!	1393432013	438711779875880960	f	mexicoblvd
These are the 21 best food trucks in America @Thrillist http://t.co/X21Y6tXres	1393431738	438710624508329986	f	korillabbq
RT @AngelicaSaidSo: Breakfast on the mind? Goodbye, cronut. Hello, donart! @thegreenradish1 http://t.co/ZZI6o6MTzn #food #trend #vegan	1393431524	438709727221268480	f	thegreenradish1
We are on 52st and park av!!	1393432073	438712030137430016	f	chefsamirtruck
RT @JeDiKiD117: @shortysnyc Trucks back in DUMBO. Jay &amp; Water St. #cheesesteakforlunch #dumbonyc #shortysnyc #cheesefries get there 4 me ...	1393432757	438714898324135936	f	shortysnyc
@gcnyc1 best grilled cheese in town...	1393432849	438715283231211520	f	freshandhearty
DUMBO! We ready for ya @Water &amp; Jay!	1393432541	438713994376142848	f	korillabbq
And don't forget! We do...\n\nAll types of events, lunches, weddings, festivals, shows.. http://t.co/2vmtKF71OU	1393433050	438716126974181376	f	disosnyc
Maybe being #green for a moment will give us a break from all this snow! What are your favorite #greentips!?	1393433839	438719437576085505	f	neaexpress
RT @RokhlK: @KimchiTruck the truck can't open soon enough. #HungryAlready	1393433644	438718620135587840	f	kimchitruck
@artichokepizza @Valduccis @PizzaCuz one of the two best pizzas in the world!	1393434626	438722736979197952	f	valduccis
Sorry WFC north, our truck will not be there today. Hope to see you next week! Stay warm.	1393435015	438724370257965056	f	mamuthainoodle
@iamevie We do! We're running on a limited schedule due to weather, a busy events calendar and preparing our new location in #Trump !	1393435176	438725046312644608	f	neaexpress
RT @artichokepizza: @Valduccis @PizzaCuz  that's right!!! #statenisland  #nycpizza #verrazzanobridge #realnyc	1393435612	438726873833807872	f	valduccis
OPEN FOR BUSINESS. Your favorite Wings Sliders N Fries are being cheffed up!  Call for p/up or delivery at 634... http://t.co/DHwdwCqEom	1393435854	438727889559617536	f	mrniceguytruck
OPEN FOR BUSINESS. Your favorite Wings Sliders N Fries are being cheffed up!  Call for p/up or... http://t.co/m51W4iqrch	1393435849	438727866298417152	f	mrniceguytruck
S-un is O-ut, G-uns O-ut! SOGO FOR IT @ 46th st bet 5~6th ave until 3pm. See ya all later. We have #NoodlesSoup #VeganOrganicMushroomSoup.	1393436188	438729291015004160	f	shanghaisogo
Check out our staff being trained by the experts at @lacolombecoffee! http://t.co/zyfdlEwaDK	1393436912	438732326164381696	f	nuchasnyc
RT @BrianRagan: @lkantor, thanks for coming...Shout out to @NuchasNYC.	1393436804	438731873414815745	f	nuchasnyc
RT @Seamless: @BrianRagan @GrubHub @NuchasNYC @MRY @uxprinciples Glad to help, we have no doubt it will be a huge success!	1393436800	438731856947994624	f	nuchasnyc
RT @uxprinciples: Ditto! RT @BrianRagan: @Seamless @GrubHub Thanks for sponsoring @NuchasNYC tonight! Mmm...empanadas. cc @MRY @uxprinciples	1393436799	438731850807521280	f	nuchasnyc
@iamevie Will do!	1393437984	438736821070340098	f	neaexpress
RT @DispatchNY: . @BrookfieldPLNY SOUTH Lot | Wednesday, 2/26 | Open until 3pm | South End Ave. &amp; Liberty St. | @SweetChiliNYC #nycfoodtruc...	1393438128	438737428208439296	f	sweetchilinyc
@greenoodle We serve a side of roasted potatoes with the hole in one, but nothing potato-focused... Except the Creamy Potato Soup!	1393439811	438744487163363329	f	thesteelcart
RT @NewYorkObserver: Join us in welcoming NYC's newest Franken-pastry: the Donart http://t.co/xslw0a6GEe	1393443008	438757895120105473	f	thegreenradish1
Donarts are coming... http://t.co/i8A1ttV6jM	1393442990	438757820818026496	f	thegreenradish1
NYObserver on Donarts... http://t.co/i8A1tuc9lM	1393443444	438759722553184256	f	thegreenradish1
Done in DUMBO! Good day yall	1393444464	438763999539494912	f	korillabbq
RT @catviccer: Delish desserts at meeting here in NYC provided by @SweeteryNYC Thanks for the treats! http://t.co/0mKw7Chi0U	1393445293	438767477636354048	f	sweeterynyc
Lobster Lovers! Summer is coming so the #RedHookLobsterPound will be hiring for all positions. Join our awesome team! http://t.co/4fbg2S4Dqs	1393445419	438768007306043394	f	lobstertruckny
thanks for coming! just a reminder tomorrow is FAT THURSDAY - if you want to pre-order PACZKI - let us know by... http://t.co/zQ12OYahK8	1393445020	438766332025122816	f	polishcuisine
Bring the kids to Kids Night on Broadway  and enjoy our delicious empanadas!  http://t.co/NjvcEwjRYN @timessquarenyc	1393444828	438765527121793027	f	nuchasnyc
Donarts are coming... http://t.co/mRGDeX1HiD	1393445262	438767348062113792	f	thegreenradish1
thanks!! @LAFoodFest @KorillaBBQ @VLAIC @LukesLobster @souvlakitruck @NautiMobile @elolomega	1393445959	438770269935923201	f	milktrucknyc
RT @LAFoodFest: best trucks in NY! http://t.co/gjg2iDgtLD Congrats to @milktrucknyc @KorillaBBQ @VLAIC @LukesLobster @souvlakitruck @NautiM...	1393446067	438770723394703360	f	korillabbq
More DONARTS Please... http://t.co/i8A1ttV6jM	1393446398	438772112002916352	f	thegreenradish1
Just arrived CU. dinner at Amsterdam ave &amp; 116th st til 8pm. Sogo for it!! &gt;&gt;#CU &lt;&lt;.....	1393446193	438771255555391488	f	shanghaisogo
@nystfood sure!	1393447488	438776683429396480	f	bigdsgrub
RT @unpianistique: can't wait!! #vegan #desserts #donart RT @thegreenradish1: More DONARTS Please... http://t.co/ijjbCvllpV	1393446947	438774416034783232	f	thegreenradish1
RT @eatwhatever: Looking forward to DONARTS! http://t.co/iUvKUlFOK1  #vegan #hybridpastry @thegreenradish1 @Gothamist	1393446782	438773722842144769	f	thegreenradish1
New special at 7th ave: Smoky Shrooms Taco...vegetarian compliant and still delicious.	1393447618	438777228667920385	f	mexicue
Hey NYU - We're here to supply you with the best cheesesteaks around! W 4th &amp; Greene until 8.	1393447579	438777064922308608	f	philssteaks
RT @nystfood: Food Truck Owners: People contact us regularly looking for trucks for events like weddings/parties. Are you interested in the...	1393447739	438777739202813953	f	sweetchilinyc
@nystfood oh yeah! We love parties!	1393448603	438781362083221504	f	mamuthainoodle
Cinnamon Snail #vegan #foodtruck named one of the top 5 best places OF ANY KIND to eat in the entire country by @Yelp\nhttp://t.co/Nbepz8OCQV	1393448945	438782797860573184	f	veganlunchtruck
@nystfood sometimes yes, sometimes no. That's the nature of the beast.	1393452822	438799059651145728	f	mamuthainoodle
RT @Yelp: Yelp data reveals top 100 places to eat! Warning: may result in stomach growling http://t.co/Y4RkGZeTPs	1393451872	438795074466742272	f	veganlunchtruck
RT @colorpirate: I have to admit @GreenbergJeff is right: a waffle isn't really a lunch. that's why I got two waffles. @waffletruck #waffle...	1393451960	438795441120215040	f	waffletruck
RT @SamitSarkar: Persuaded @hamburger to get @PhilsSteaks for lunch with me, aww yeah. ONE OF US.	1393453931	438803709423017985	f	philssteaks
@GuyForgetOPT darn it.  No, but later next week yes.  This is crappy luck.  I'm sorry.  I need to overnight you some snacks!	1393454389	438805630233886720	f	veganlunchtruck
@laylaschlack @raphael_brion we have been the #1 best of yelp NYC spot for a couple years now.  Maybe come eat snacks sometime...?	1393454942	438807949663027201	f	veganlunchtruck
@GuyForgetOPT its a date! #forgetaboutit	1393454879	438807684155191296	f	veganlunchtruck
Nice little whiz Wednesday sell out pholks. Shutting it down at NYU. See you tomorrow at 52nd and 6th for breakfast and lunch til 2!	1393456673	438815209344348160	f	philssteaks
RT @RoamingHunger: New franken-pastry donart is the cronuts healthier successor from NY's @thegreenradish1 http://t.co/CEOxZ8PogH http:/...	1393457149	438817205007179776	f	thegreenradish1
Momma Truck @ Astor Pl till midnight!  Kotmadam @ 23rd &amp; 5th till 8p \nGoesting @ Bway &amp; 66th till 8p	1393456216	438813293210509312	f	waffletruck
Wafels at night! \nLe Cafe @ 15 Ave B till 11p \nDe Wafel Cabana @ 35th &amp; Broadway till 10p	1393456203	438813237296259072	f	waffletruck
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

