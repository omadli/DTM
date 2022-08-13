--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: abiturients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.abiturients (
    id integer NOT NULL,
    abtid bigint NOT NULL,
    name character varying(255) NOT NULL,
    langid integer NOT NULL,
    grantpriority boolean DEFAULT true,
    ball real
);


ALTER TABLE public.abiturients OWNER TO postgres;

--
-- Name: abiturients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.abiturients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abiturients_id_seq OWNER TO postgres;

--
-- Name: abiturients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.abiturients_id_seq OWNED BY public.abiturients.id;


--
-- Name: bloks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bloks (
    id integer NOT NULL,
    main character varying(255) NOT NULL,
    second character varying(255) NOT NULL,
    langid integer NOT NULL
);


ALTER TABLE public.bloks OWNER TO postgres;

--
-- Name: bloks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bloks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bloks_id_seq OWNER TO postgres;

--
-- Name: bloks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bloks_id_seq OWNED BY public.bloks.id;


--
-- Name: choices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.choices (
    id integer NOT NULL,
    abtid bigint NOT NULL,
    selectionid integer NOT NULL,
    number integer NOT NULL,
    CONSTRAINT valid_number CHECK (((number <= 10) AND (number >= 1)))
);


ALTER TABLE public.choices OWNER TO postgres;

--
-- Name: choices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.choices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.choices_id_seq OWNER TO postgres;

--
-- Name: choices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.choices_id_seq OWNED BY public.choices.id;


--
-- Name: faculties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faculties (
    id integer NOT NULL,
    uncode integer NOT NULL,
    shifr character varying(50) NOT NULL,
    name character varying(255) NOT NULL,
    blokid integer
);


ALTER TABLE public.faculties OWNER TO postgres;

--
-- Name: faculties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.faculties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faculties_id_seq OWNER TO postgres;

--
-- Name: faculties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.faculties_id_seq OWNED BY public.faculties.id;


--
-- Name: facultyshifres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facultyshifres (
    id integer NOT NULL,
    shifr character varying(50) NOT NULL,
    name character varying(255) NOT NULL,
    blokid integer
);


ALTER TABLE public.facultyshifres OWNER TO postgres;

--
-- Name: facultyshifres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facultyshifres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facultyshifres_id_seq OWNER TO postgres;

--
-- Name: facultyshifres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facultyshifres_id_seq OWNED BY public.facultyshifres.id;


--
-- Name: fullchoices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fullchoices (
    id integer NOT NULL,
    abtid bigint NOT NULL,
    f1 integer,
    f2 integer,
    f3 integer,
    f4 integer,
    f5 integer,
    f6 integer,
    f7 integer,
    f8 integer,
    f9 integer,
    f10 integer
);


ALTER TABLE public.fullchoices OWNER TO postgres;

--
-- Name: fullchoices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fullchoices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fullchoices_id_seq OWNER TO postgres;

--
-- Name: fullchoices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fullchoices_id_seq OWNED BY public.fullchoices.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.languages (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.languages OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.languages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.languages_id_seq OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.languages_id_seq OWNED BY public.languages.id;


--
-- Name: modes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modes (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.modes OWNER TO postgres;

--
-- Name: modes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modes_id_seq OWNER TO postgres;

--
-- Name: modes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modes_id_seq OWNED BY public.modes.id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regions (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.regions OWNER TO postgres;

--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.regions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regions_id_seq OWNER TO postgres;

--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.regions_id_seq OWNED BY public.regions.id;


--
-- Name: scores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scores (
    id integer NOT NULL,
    abtid bigint NOT NULL,
    ball real NOT NULL,
    blok1 integer NOT NULL,
    blok2 integer NOT NULL,
    blok3 integer NOT NULL,
    blok4 integer NOT NULL,
    blok5 integer NOT NULL,
    blokid integer NOT NULL
);


ALTER TABLE public.scores OWNER TO postgres;

--
-- Name: scores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.scores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scores_id_seq OWNER TO postgres;

--
-- Name: scores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.scores_id_seq OWNED BY public.scores.id;


--
-- Name: selections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.selections (
    id integer NOT NULL,
    uncode integer NOT NULL,
    facultyid integer NOT NULL,
    langid integer NOT NULL,
    mode integer NOT NULL,
    budget integer,
    cantrak integer
);


ALTER TABLE public.selections OWNER TO postgres;

--
-- Name: selections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.selections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.selections_id_seq OWNER TO postgres;

--
-- Name: selections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.selections_id_seq OWNED BY public.selections.id;


--
-- Name: universities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.universities (
    id integer NOT NULL,
    code integer NOT NULL,
    name character varying(255) NOT NULL,
    regionid integer
);


ALTER TABLE public.universities OWNER TO postgres;

--
-- Name: universities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.universities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universities_id_seq OWNER TO postgres;

--
-- Name: universities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.universities_id_seq OWNED BY public.universities.id;


--
-- Name: abiturients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abiturients ALTER COLUMN id SET DEFAULT nextval('public.abiturients_id_seq'::regclass);


--
-- Name: bloks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bloks ALTER COLUMN id SET DEFAULT nextval('public.bloks_id_seq'::regclass);


--
-- Name: choices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.choices ALTER COLUMN id SET DEFAULT nextval('public.choices_id_seq'::regclass);


--
-- Name: faculties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculties ALTER COLUMN id SET DEFAULT nextval('public.faculties_id_seq'::regclass);


--
-- Name: facultyshifres id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facultyshifres ALTER COLUMN id SET DEFAULT nextval('public.facultyshifres_id_seq'::regclass);


--
-- Name: fullchoices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fullchoices ALTER COLUMN id SET DEFAULT nextval('public.fullchoices_id_seq'::regclass);


--
-- Name: languages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages ALTER COLUMN id SET DEFAULT nextval('public.languages_id_seq'::regclass);


--
-- Name: modes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modes ALTER COLUMN id SET DEFAULT nextval('public.modes_id_seq'::regclass);


--
-- Name: regions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions ALTER COLUMN id SET DEFAULT nextval('public.regions_id_seq'::regclass);


--
-- Name: scores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores ALTER COLUMN id SET DEFAULT nextval('public.scores_id_seq'::regclass);


--
-- Name: selections id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.selections ALTER COLUMN id SET DEFAULT nextval('public.selections_id_seq'::regclass);


--
-- Name: universities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universities ALTER COLUMN id SET DEFAULT nextval('public.universities_id_seq'::regclass);


--
-- Data for Name: abiturients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.abiturients (id, abtid, name, langid, grantpriority, ball) FROM stdin;
\.


--
-- Data for Name: bloks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bloks (id, main, second, langid) FROM stdin;
\.


--
-- Data for Name: choices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.choices (id, abtid, selectionid, number) FROM stdin;
\.


--
-- Data for Name: faculties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faculties (id, uncode, shifr, name, blokid) FROM stdin;
1	301	60540200	Amaliy matematika	\N
2	301	60320300	Arxivshunoslik	\N
3	301	60510102	Biologiya (turlari bo‘yicha)	\N
4	301	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
5	301	60230104	Filologiya va tillarni o‘qitish: o‘zbek tili	\N
6	301	60530901	Fizika	\N
7	301	60530400	Geografiya	\N
8	301	61010505	Gid hamrohligi va tarjimonlik faoliyati: ingliz tili	\N
9	301	60411400	Inson resurslarini boshqarish	\N
10	301	60530100	Kimyo (turlari bo‘yicha)	\N
11	301	60610100	Kompyuter ilmlari va dasturlash texnologiyalari (yo‘nalishlar bo‘yicha)	\N
12	301	60610501	Kompyuter injiniringi: “Kompyuter injiniringi”	\N
13	301	60610504	Kompyuter injiniringi: AT-Servis	\N
14	301	60540100	Matematika	\N
15	301	61010100	Mehmonxona xo‘jaligini tashkil etish va boshqarish	\N
16	301	60531000	Mexanika va matematik modellashtirish	\N
17	301	60711001	Muqobil energiya manbalari (turlari bo‘yicha)	\N
18	301	60720100	Oziq-ovqat texnologiyasi (mahsulot turlari bo‘yicha)	\N
19	301	60310901	Psixologiya: amaliy psixologiya	\N
20	301	60311000	Sotsiologiya	\N
21	301	61010341	Sport faoliyati: boks	\N
22	301	61010304	Sport faoliyati: futbol	\N
23	301	61010342	Sport faoliyati: kurash	\N
24	301	60220307	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)	\N
25	301	61010401	Turizm (faoliyat yo‘nalishlari bo‘yicha )	\N
26	302	60230700	Amaliy filologiya	\N
27	302	60230104	Filologiya va tillarni o‘qitish: o‘zbek tili	\N
28	302	60230900	Folklorshunoslik va shevashunoslik	\N
29	302	60230800	Kompyuter lingvistikasi 	\N
30	302	60230302	Matnshunoslik va adabiy manbashunoslik: o‘zbek tili	\N
31	302	60230600	Noshirlik ishi	\N
32	302	60111400	O‘zbek tili va adabiyoti	\N
33	302	60111601	O‘zga tilli guruhlarda o‘zbek tili (rus guruhlari uchun)	\N
34	302	60311000	Sotsiologiya	\N
35	302	60230204	Tarjima nazariyasi va amaliyoti: fransuz tili	\N
36	302	60230203	Tarjima nazariyasi va amaliyoti: ingliz tili	\N
37	302	60230206	Tarjima nazariyasi va amaliyoti: nemis tili	\N
38	302	60230202	Tarjima nazariyasi va amaliyoti: rus tili	\N
39	303	61040400	Avtomobil servisi	\N
40	303	60712400	Avtomobilsozlik va traktorsozlik	\N
41	303	60610204	Axborot tizimlari va texnologiyalari (tarmoqlar va sohalar bo‘yicha)	\N
42	303	60410500	Bank ishi va auditi	\N
43	303	60711800	Biotibbiyot muhandisligi	\N
44	303	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
45	303	60710602	Elektr energetikasi (tarmoqlar va yo‘nalishlar bo‘yicha)	\N
46	303	60710702	Elektr texnikasi, elektr mexanikasi va elektr texnologiyalari (tarmoqlar bo‘yicha)	\N
47	303	60711102	Energiya mashinasozligi (tarmoqlar bo‘yicha)	\N
48	303	60710900	Energiya tejamkorligi va energoaudit	\N
49	303	60711602	Intellektual muhandislik tizimlari (tarmoqlar va sohalar bo‘yicha)	\N
50	303	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
51	303	60720800	Mashinasozlik texnologiyasi, mashinasozlik ishlab chiqarishini jihozlash va avtomatlashtirish	\N
52	303	60720601	Materialshunoslik va yangi materiallar texnologiyasi (tarmoqlar bo‘yicha)	\N
53	303	61020201	Mehnat muhofazasi va texnika xavfsizligi (tarmoqlar bo‘yicha)	\N
54	303	60411212	Menejment (tarmoqlar va sohalar bo‘yicha)	\N
55	303	60712300	Metallar texnologiyalari (jarayon turlari bo‘yicha)	\N
56	303	60711303	Metrologiya, standartlashtirish va mahsulot sifati menejmenti (tarmoqlar bo‘yicha)	\N
57	303	60711500	Mexatronika va robototexnika	\N
58	303	60410400	Moliya va moliyaviy texnologiyalar	\N
59	303	60711001	Muqobil energiya manbalari (turlari bo‘yicha)	\N
60	303	60610700	Sun’iy intellekt 	\N
61	303	60721300	Tabiiy tolalarni dastlabki ishlash texnologiyasi (xomashyo va jarayon turlari bo‘yicha)	\N
62	303	60711402	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (tarmoqlar bo‘yicha)	\N
63	303	60720701	Texnologik mashinalar va jihozlar (tarmoqlar bo‘yicha)	\N
64	303	61040101	Transport logistikasi (transport turlari bo‘yicha)	\N
65	303	60712503	Transport vositalari muhandisligi (turlari bo‘yicha)	\N
66	303	60721204	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi (ishlab chiqarish turlari bo‘yicha)	\N
67	303	61040300	Yo‘l harakatini tashkil etish	\N
68	303	60730804	Yo‘l muhandisligi (sohalar va faoliyat turlari bo‘yicha)	\N
69	304	60412400	Agrobiznes va investitsion faoliyat	\N
70	304	60810700	Agrokimyo va agrotuproqshunoslik	\N
71	304	60810904	Agronomiya (dehqonchilik mahsulotlari turlari bo‘yicha)	\N
72	304	60540200	Amaliy matematika	\N
73	304	60220400	Arxeologiya	\N
74	304	60610204	Axborot tizimlari va texnologiyalari (tarmoqlar va sohalar bo‘yicha)	\N
75	304	60320200	Axborot xizmati va jamoatchilik bilan aloqalar	\N
76	304	60410500	Bank ishi va auditi	\N
77	304	60510102	Biologiya (turlari bo‘yicha)	\N
78	304	60710200	Biotexnologiya (tarmoqlar bo‘yicha)	\N
79	304	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
80	304	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
81	304	60711200	Elektronika va asbobsozlik (tarmoqlar bo‘yicha)	\N
82	304	60230103	Filologiya va tillarni o‘qitish: fransuz tili	\N
83	304	60230101	Filologiya va tillarni o‘qitish: ingliz tili	\N
84	304	60230119	Filologiya va tillarni o‘qitish: nemis tili	\N
85	304	60230104	Filologiya va tillarni o‘qitish: o‘zbek tili	\N
86	304	60230107	Filologiya va tillarni o‘qitish: rus tili	\N
87	304	60230106	Filologiya va tillarni o‘qitish: tojik tili	\N
88	304	60530901	Fizika	\N
89	304	60530400	Geografiya	\N
90	304	61010504	Gid hamrohligi va tarjimonlik faoliyati: fransuz tili	\N
91	304	61010505	Gid hamrohligi va tarjimonlik faoliyati: ingliz tili	\N
92	304	61010503	Gid hamrohligi va tarjimonlik faoliyati: nemis tili	\N
93	304	60920103	Ijtimoiy ish: oila va bolalar bilan ishlash	\N
94	304	60920103005	Ijtimoiy ish: oila va bolalar bilan ishlash-Buxoro viloyati	\N
95	304	60920103001	Ijtimoiy ish: oila va bolalar bilan ishlash-Qoraqalpog‘iston Respublikasi	\N
96	304	60920103006	Ijtimoiy ish: oila va bolalar bilan ishlash-Xorazm viloyati	\N
97	304	60411400	Inson resurslarini boshqarish	\N
98	304	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
99	304	60812000	Issiqxona xo‘jaligini tashkil etish va yuritish	\N
100	304	60320102	Jurnalistika: bosma ommaviy axborot vositalari jurnalistikasi	\N
101	304	60530100	Kimyo (turlari bo‘yicha)	\N
102	304	60710101	Kimyoviy texnologiya (ishlab chiqarish turlari bo‘yicha)	\N
103	304	60610100	Kompyuter ilmlari va dasturlash texnologiyalari (yo‘nalishlar bo‘yicha)	\N
104	304	60411701	Logistika (agrologistika)	\N
105	304	60412505	Marketing (tarmoqlar va sohalar bo‘yicha)	\N
106	304	60540100	Matematika	\N
107	304	60230302	Matnshunoslik va adabiy manbashunoslik: o‘zbek tili	\N
108	304	61010100	Mehmonxona xo‘jaligini tashkil etish va boshqarish	\N
109	304	60411212	Menejment (tarmoqlar va sohalar bo‘yicha)	\N
110	304	60811800	Mevachilik va uzumchilik	\N
111	304	60531000	Mexanika va matematik modellashtirish	\N
112	304	60711001	Muqobil energiya manbalari (turlari bo‘yicha)	\N
113	304	60720900	Neftgazkimyo sanoati texnologiyasi	\N
114	304	60811001	O‘simliklarni himoya qilish (ekin turlari bo‘yicha)	\N
115	304	60310901	Psixologiya: amaliy psixologiya	\N
116	304	60310906	Psixologiya: oila psixologiyasi	\N
117	304	60310904	Psixologiya: sport psixologiyasi	\N
118	304	60811301	Qishloq xo‘jalik mahsulotlarini saqlash va dastlabki ishlash texnologiyasi (mahsulotlar turlari bo‘yicha)	\N
119	304	60310502	Raqamli iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
120	304	60811900	Sabzavotchilik, polizchilik va kartoshkachilik	\N
121	304	60310700	Siyosatshunoslik	\N
122	304	60311000	Sotsiologiya	\N
123	304	61010328	Sport faoliyati: basketbol	\N
124	304	61010341	Sport faoliyati: boks	\N
125	304	61010348	Sport faoliyati: dzyudo	\N
126	304	61010320	Sport faoliyati: erkin kurash	\N
127	304	61010304	Sport faoliyati: futbol	\N
128	304	61010342	Sport faoliyati: kurash	\N
129	304	61010350	Sport faoliyati: qo‘l to‘pi	\N
130	304	61010343	Sport faoliyati: stol tennisi	\N
131	304	61010332	Sport faoliyati: voleybol	\N
132	304	61010347	Sport faoliyati: yengil atletika	\N
133	304	60410800	Statistika (tarmoqlar va sohalar bo‘yicha)	\N
134	304	60220308	Tarix (islom tarixi va manbashunosligi)	\N
135	304	60220307	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)	\N
136	304	60230203	Tarjima nazariyasi va amaliyoti: ingliz tili	\N
137	304	60230206	Tarjima nazariyasi va amaliyoti: nemis tili	\N
138	304	61010401	Turizm (faoliyat yo‘nalishlari bo‘yicha )	\N
139	304	60420107	Yurisprudensiya (faoliyat turlari bo‘yicha)	\N
140	305	61010200	Aholi va turistlarning ovqatlanishini tashkil etish servisi	\N
141	305	60730102	Arxitektura (turlari bo‘yicha)	\N
142	305	60610204	Axborot tizimlari va texnologiyalari (tarmoqlar va sohalar bo‘yicha)	\N
143	305	60210409	Dizayn: (milliy kostyum)	\N
144	305	60210405	Dizayn: libos va gazlamalar	\N
145	305	60210407	Dizayn: poyabzal va aksessuarlar dizayni	\N
146	305	60710602	Elektr energetikasi (tarmoqlar va yo‘nalishlar bo‘yicha)	\N
147	305	60710702	Elektr texnikasi, elektr mexanikasi va elektr texnologiyalari (tarmoqlar bo‘yicha)	\N
148	305	60710500	Energetika (tarmoqlar bo‘yicha)	\N
149	305	60710900	Energiya tejamkorligi va energoaudit	\N
150	305	60720500	Funksional ovqatlanish va bolalar mahsulotlari texnologiyasi	\N
151	305	60721000	Gazni chuqur qayta ishlash texnologiyasi 	\N
152	305	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
153	305	60710101	Kimyoviy texnologiya (ishlab chiqarish turlari bo‘yicha)	\N
154	305	60720400	Konservalash texnologiyasi	\N
155	305	60412505	Marketing (tarmoqlar va sohalar bo‘yicha)	\N
156	305	60720800	Mashinasozlik texnologiyasi, mashinasozlik ishlab chiqarishini jihozlash va avtomatlashtirish	\N
157	305	60710300	Matbaa va qadoqlash jarayonlari texnologiyasi 	\N
158	305	60720603	Materialshunoslik va yangi materiallar texnologiyasi (qurilish) 	\N
159	305	60720604	Materialshunoslik va yangi materiallar texnologiyasi: mashinasozlik	\N
160	305	61020201	Mehnat muhofazasi va texnika xavfsizligi (tarmoqlar bo‘yicha)	\N
161	305	60411212	Menejment (tarmoqlar va sohalar bo‘yicha)	\N
162	305	60711303	Metrologiya, standartlashtirish va mahsulot sifati menejmenti (tarmoqlar bo‘yicha)	\N
163	305	60811800	Mevachilik va uzumchilik	\N
164	305	60711001	Muqobil energiya manbalari (turlari bo‘yicha)	\N
165	305	60721800	Neft va gaz ishi (faoliyat turlari bo‘yicha)	\N
166	305	60721100	Neft va neft-gazni qayta ishlash texnologiyasi	\N
167	305	60720900	Neftgazkimyo sanoati texnologiyasi	\N
168	305	60720100	Oziq-ovqat texnologiyasi (mahsulot turlari bo‘yicha)	\N
169	305	60810100	Qishloq xo‘jaligini mexanizatsiyalashtirish	\N
170	305	60811301	Qishloq xo‘jalik mahsulotlarini saqlash va dastlabki ishlash texnologiyasi (mahsulotlar turlari bo‘yicha)	\N
171	305	60730305	Qurilish muhandisligi: bino va inshootlar qurilishi	\N
172	305	60730302	Qurilish muhandisligi: devorbop va pardozbop qurilish materiallari texnologiyasi	\N
173	305	60730303	Qurilish muhandisligi: qurilish materiallari, buyumlari va konstruksiyalarini ishlab chiqarish	\N
174	305	60730500	Suv ta’minoti va kanalizatsiya tizimlarini loyihalashtirish va ekspluatatsiyasi	\N
175	305	60721300	Tabiiy tolalarni dastlabki ishlash texnologiyasi (xomashyo va jarayon turlari bo‘yicha)	\N
176	305	60711900	Texnologik jarayonlarni boshqarishning axborot-kommunikatsiya tizimlari	\N
177	305	60720701	Texnologik mashinalar va jihozlar (tarmoqlar bo‘yicha)	\N
178	305	60712503	Transport vositalari muhandisligi (turlari bo‘yicha)	\N
179	305	60720300	Vinochilik texnologiyasi, bijg‘ish mahsulotlari va alkogolsiz ichimliklar texnologiyasi	\N
180	305	60721204	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi (ishlab chiqarish turlari bo‘yicha)	\N
181	305	60721400	Yengil sanoat texnologiyalari va jihozlari (ishlab chiqarish turlari bo‘yicha)	\N
182	305	60720200	Yog‘lar, efir moylari va parfumeriya-kosmetika mahsulotlari texnologiyasi	\N
183	306	60610400	Axborot xavfsizligini boshqarish	\N
184	306	60220100	Dinshunoslik	\N
185	306	60230113	Filologiya va tillarni o‘qitish: arab tili	\N
186	306	60411100	Islom iqtisodiyoti va moliyasi	\N
187	306	60220201	Islomshunoslik (qur'onshunoslik, hadisshunoslik, islom huquqi, aqida va tasavvuf, islom tarixi va manbashunosligi)	\N
188	306	60220202	Islomshunoslik (yo‘nalishlar bo‘yicha)	\N
189	306	60411900	Jahon iqtisodiyoti va xalqaro iqtisodiy munosabatlar (mintaqalar va faoliyat turlari bo‘yicha)	\N
190	306	60320101	Jurnalistika: xalqaro jurnalistika	\N
191	306	60610503	"Kompyuter injiniringi (""Kompyuter injiniringi"", ""AT-servis"", ""Axborot xavfsizligi"", ""Multimedia texnologiyalari"")"	\N
192	306	60230303	Matnshunoslik va adabiy manbashunoslik: arab tili	\N
193	306	60310903	Psixologiya (din sotsiopsixologiyasi)	\N
194	306	60220308	Tarix (islom tarixi va manbashunosligi)	\N
195	306	61010402	Turizm (ziyorat turizmi)	\N
196	306	60310800	Xalqaro munosabatlar	\N
197	306	60420108	Yurisprudensiya (islom huquqi)	\N
198	307	60810700	Agrokimyo va agrotuproqshunoslik	\N
199	307	60810903	Agronomiya: anorchilik	\N
200	307	60540200	Amaliy matematika	\N
201	307	60510102	Biologiya (turlari bo‘yicha)	\N
202	307	60710200	Biotexnologiya (tarmoqlar bo‘yicha)	\N
203	307	60411301	Biznesni boshqarish (tarmoqlar bo‘yicha)	\N
204	307	60110500	Boshlang‘ich ta’lim	\N
205	307	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
206	307	60910200	Davolash ishi	\N
207	307	60910200012	Davolash ishi-Sirdaryo viloyati	\N
208	307	60812100	Dorivor o‘simliklarni yetishtirish va qayta ishlash texnologiyasi	\N
209	307	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
210	307	60230104	Filologiya va tillarni o‘qitish: o‘zbek tili	\N
211	307	60230107	Filologiya va tillarni o‘qitish: rus tili	\N
212	307	60530901	Fizika	\N
213	307	60110700	Fizika va astronomiya	\N
214	307	60111000	Geografiya va iqtisodiy bilim asoslari	\N
215	307	60920101	Ijtimoiy ish (fuqarolarning o‘z-o‘zini boshqarish organlari)	\N
216	307	60920103	Ijtimoiy ish: oila va bolalar bilan ishlash	\N
217	307	60920103009	Ijtimoiy ish: oila va bolalar bilan ishlash-Jizzax viloyati	\N
218	307	60920103012	Ijtimoiy ish: oila va bolalar bilan ishlash-Sirdaryo viloyati	\N
219	307	60920103013	Ijtimoiy ish: oila va bolalar bilan ishlash-Toshkent viloyati	\N
220	307	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
221	307	60812000	Issiqxona xo‘jaligini tashkil etish va yuritish	\N
222	307	60112200	Jismoniy madaniyat	\N
223	307	60112201	Jismoniy madaniyat (xotin-qizlar sporti yo‘nalishi bo‘yicha)	\N
224	307	60530100	Kimyo (turlari bo‘yicha)	\N
225	307	60110200	Maktabgacha ta’lim	\N
226	307	60540100	Matematika	\N
227	307	60110600	Matematika va informatika	\N
228	307	60411212	Menejment (tarmoqlar va sohalar bo‘yicha)	\N
229	307	60811800	Mevachilik va uzumchilik	\N
230	307	60112100	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi	\N
231	307	60111300	Musiqa ta'limi	\N
232	307	60111400	O‘zbek tili va adabiyoti	\N
233	307	60111701	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)	\N
234	307	60111504	Ona tili va adabiyot: qozoq tili va adabiyot	\N
235	307	60720100	Oziq-ovqat texnologiyasi (mahsulot turlari bo‘yicha)	\N
236	307	60110100	Pedagogika	\N
237	307	60910300	Pediatriya ishi	\N
238	307	60910300012	Pediatriya ishi-Sirdaryo viloyati	\N
239	307	60310901	Psixologiya: amaliy psixologiya	\N
240	307	60810100	Qishloq xo‘jaligini mexanizatsiyalashtirish	\N
241	307	60811301	Qishloq xo‘jalik mahsulotlarini saqlash va dastlabki ishlash texnologiyasi (mahsulotlar turlari bo‘yicha)	\N
242	307	60811900	Sabzavotchilik, polizchilik va kartoshkachilik	\N
243	307	61010342	Sport faoliyati: kurash	\N
244	307	60721300	Tabiiy tolalarni dastlabki ishlash texnologiyasi (xomashyo va jarayon turlari bo‘yicha)	\N
245	307	60220307	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)	\N
246	307	60111200	Tasviriy san'at va muhandislik grafikasi  	\N
247	307	60112300	Texnologik ta’lim	\N
248	307	60111804	Xorijiy til va adabiyoti: ingliz tili	\N
249	307	60721204	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi (ishlab chiqarish turlari bo‘yicha)	\N
250	308	60730102	Arxitektura (turlari bo‘yicha)	\N
251	308	60712400	Avtomobilsozlik va traktorsozlik	\N
252	308	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
253	308	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
254	308	60710602	Elektr energetikasi (tarmoqlar va yo‘nalishlar bo‘yicha)	\N
255	308	60710702	Elektr texnikasi, elektr mexanikasi va elektr texnologiyalari (tarmoqlar bo‘yicha)	\N
256	308	60711200	Elektronika va asbobsozlik (tarmoqlar bo‘yicha)	\N
257	308	60710500	Energetika (tarmoqlar bo‘yicha)	\N
258	308	60710101	Kimyoviy texnologiya (ishlab chiqarish turlari bo‘yicha)	\N
1109	341	60111300	Musiqa ta'limi	\N
259	308	60720800	Mashinasozlik texnologiyasi, mashinasozlik ishlab chiqarishini jihozlash va avtomatlashtirish	\N
260	308	60720603	Materialshunoslik va yangi materiallar texnologiyasi (qurilish) 	\N
261	308	61020201	Mehnat muhofazasi va texnika xavfsizligi (tarmoqlar bo‘yicha)	\N
262	308	60411212	Menejment (tarmoqlar va sohalar bo‘yicha)	\N
263	308	60711303	Metrologiya, standartlashtirish va mahsulot sifati menejmenti (tarmoqlar bo‘yicha)	\N
264	308	60730402	Muhandislik kommunikatsiyalari qurilishi va montaji (turlari bo‘yicha)	\N
265	308	60721100	Neft va neft-gazni qayta ishlash texnologiyasi	\N
266	308	60720100	Oziq-ovqat texnologiyasi (mahsulot turlari bo‘yicha)	\N
267	308	60112403	Professional ta’lim: transport vositalari muhandisligi (avtotransport)	\N
268	308	60810100	Qishloq xo‘jaligini mexanizatsiyalashtirish	\N
269	308	60811301	Qishloq xo‘jalik mahsulotlarini saqlash va dastlabki ishlash texnologiyasi (mahsulotlar turlari bo‘yicha)	\N
270	308	60730305	Qurilish muhandisligi: bino va inshootlar qurilishi	\N
271	308	60730302	Qurilish muhandisligi: devorbop va pardozbop qurilish materiallari texnologiyasi	\N
272	308	60730303	Qurilish muhandisligi: qurilish materiallari, buyumlari va konstruksiyalarini ishlab chiqarish	\N
273	308	60611503	Radioelektron qurilmalar va tizimlar (tarmoqlar bo‘yicha)	\N
274	308	60730500	Suv ta’minoti va kanalizatsiya tizimlarini loyihalashtirish va ekspluatatsiyasi	\N
275	308	60721300	Tabiiy tolalarni dastlabki ishlash texnologiyasi (xomashyo va jarayon turlari bo‘yicha)	\N
276	308	60711402	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (tarmoqlar bo‘yicha)	\N
277	308	60720701	Texnologik mashinalar va jihozlar (tarmoqlar bo‘yicha)	\N
278	308	61040101	Transport logistikasi (transport turlari bo‘yicha)	\N
279	308	60712503	Transport vositalari muhandisligi (turlari bo‘yicha)	\N
280	308	60721204	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi (ishlab chiqarish turlari bo‘yicha)	\N
281	308	60730804	Yo‘l muhandisligi (sohalar va faoliyat turlari bo‘yicha)	\N
282	309	60810904	Agronomiya (dehqonchilik mahsulotlari turlari bo‘yicha)	\N
283	309	60230700	Amaliy filologiya	\N
284	309	60540200	Amaliy matematika	\N
285	309	60220400	Arxeologiya	\N
286	309	60320300	Arxivshunoslik	\N
287	309	60610204	Axborot tizimlari va texnologiyalari (tarmoqlar va sohalar bo‘yicha)	\N
288	309	60510102	Biologiya (turlari bo‘yicha)	\N
289	309	60710200	Biotexnologiya (tarmoqlar bo‘yicha)	\N
290	309	60411301	Biznesni boshqarish (tarmoqlar bo‘yicha)	\N
291	309	60110500	Boshlang‘ich ta’lim	\N
292	309	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
293	309	60910200	Davolash ishi	\N
294	309	60910200003	Davolash ishi-Namangan viloyati	\N
295	309	60812100	Dorivor o‘simliklarni yetishtirish va qayta ishlash texnologiyasi	\N
296	309	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
297	309	60910700	Farmatsiya (turlari bo‘yicha)	\N
298	309	60230101	Filologiya va tillarni o‘qitish: ingliz tili	\N
299	309	60230119	Filologiya va tillarni o‘qitish: nemis tili	\N
300	309	60230104	Filologiya va tillarni o‘qitish: o‘zbek tili	\N
301	309	60230107	Filologiya va tillarni o‘qitish: rus tili	\N
302	309	60530901	Fizika	\N
303	309	60720500	Funksional ovqatlanish va bolalar mahsulotlari texnologiyasi	\N
304	309	60530400	Geografiya	\N
305	309	60111000	Geografiya va iqtisodiy bilim asoslari	\N
306	309	61020100	Hayotiy faoliyat xavfsizligi	\N
307	309	60920101	Ijtimoiy ish (fuqarolarning o‘z-o‘zini boshqarish organlari)	\N
308	309	60920103	Ijtimoiy ish: oila va bolalar bilan ishlash	\N
309	309	60920103003	Ijtimoiy ish: oila va bolalar bilan ishlash-Namangan viloyati	\N
310	309	60310400	Iqtisodiy xavfsizlik	\N
311	309	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
312	309	60812000	Issiqxona xo‘jaligini tashkil etish va yuritish	\N
313	309	60112200	Jismoniy madaniyat	\N
314	309	60110800	Kimyo	\N
315	309	60530100	Kimyo (turlari bo‘yicha)	\N
316	309	60320400	Kutubxona-axborot faoliyati (faoliyat turlari bo‘yicha)	\N
317	309	60411703	Logistika (yo‘nalishlar bo‘yicha)	\N
318	309	60110200	Maktabgacha ta’lim	\N
319	309	60111900	Maktabgacha va boshlang‘ich ta'limda jismoniy tarbiya va sport	\N
320	309	60112600	Maktabgacha va boshlang‘ich ta’limda xorijiy til (ingliz tili)	\N
321	309	60540100	Matematika	\N
322	309	60112702	Maxsus pedagogika : logopediya	\N
323	309	61010100	Mehmonxona xo‘jaligini tashkil etish va boshqarish	\N
324	309	60411212	Menejment (tarmoqlar va sohalar bo‘yicha)	\N
325	309	60520200	Meteorologiya va iqlimshunoslik  	\N
326	309	60811800	Mevachilik va uzumchilik	\N
327	309	60112100	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi	\N
328	309	60412200	Moliya sohasida boshqaruv	\N
329	309	60111300	Musiqa ta'limi	\N
330	309	60812201	O'simlikshunoslik (gulchilik)	\N
331	309	60111701	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)	\N
332	309	60720100	Oziq-ovqat texnologiyasi (mahsulot turlari bo‘yicha)	\N
333	309	60110100	Pedagogika	\N
334	309	60910300	Pediatriya ishi	\N
335	309	60910300003	Pediatriya ishi-Namangan viloyati	\N
336	309	60310901	Psixologiya: amaliy psixologiya	\N
337	309	60811900	Sabzavotchilik, polizchilik va kartoshkachilik	\N
338	309	60311000	Sotsiologiya	\N
339	309	61010324	Sport faoliyati (xotin-qizlar sporti yo‘nalishi bo‘yicha)	\N
340	309	61010342	Sport faoliyati: kurash	\N
341	309	61010332	Sport faoliyati: voleybol	\N
342	309	60220307	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)	\N
343	309	60111200	Tasviriy san'at va muhandislik grafikasi  	\N
344	309	60112300	Texnologik ta’lim	\N
345	309	61010401	Turizm (faoliyat yo‘nalishlari bo‘yicha )	\N
346	309	60111804	Xorijiy til va adabiyoti: ingliz tili	\N
347	309	60420107	Yurisprudensiya (faoliyat turlari bo‘yicha)	\N
348	309	60811501	Zooinjeneriya: baliqchilik	\N
349	310	60730102	Arxitektura (turlari bo‘yicha)	\N
350	310	61040400	Avtomobil servisi	\N
351	310	60712400	Avtomobilsozlik va traktorsozlik	\N
352	310	60610204	Axborot tizimlari va texnologiyalari (tarmoqlar va sohalar bo‘yicha)	\N
353	310	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
354	310	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
355	310	60710602	Elektr energetikasi (tarmoqlar va yo‘nalishlar bo‘yicha)	\N
356	310	60721601	Foydali qazilma konlari geologiyasi, qidiruv va razvedkasi (kon turlari bo‘yicha)	\N
357	310	60720500	Funksional ovqatlanish va bolalar mahsulotlari texnologiyasi	\N
358	310	60812500	Gidrotexnika inshootlari va nasos stansiyalaridan foydalanish	\N
359	310	60730902	Gidrotexnika qurilishi (turlari bo‘yicha)	\N
360	310	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
361	310	60710101	Kimyoviy texnologiya (ishlab chiqarish turlari bo‘yicha)	\N
362	310	60720400	Konservalash texnologiyasi	\N
363	310	60411600	Korporativ boshqaruv	\N
364	310	60720800	Mashinasozlik texnologiyasi, mashinasozlik ishlab chiqarishini jihozlash va avtomatlashtirish	\N
365	310	60720601	Materialshunoslik va yangi materiallar texnologiyasi (tarmoqlar bo‘yicha)	\N
366	310	61020201	Mehnat muhofazasi va texnika xavfsizligi (tarmoqlar bo‘yicha)	\N
367	310	60411212	Menejment (tarmoqlar va sohalar bo‘yicha)	\N
368	310	60712300	Metallar texnologiyalari (jarayon turlari bo‘yicha)	\N
369	310	60711303	Metrologiya, standartlashtirish va mahsulot sifati menejmenti (tarmoqlar bo‘yicha)	\N
370	310	60730402	Muhandislik kommunikatsiyalari qurilishi va montaji (turlari bo‘yicha)	\N
371	310	60711001	Muqobil energiya manbalari (turlari bo‘yicha)	\N
372	310	60721100	Neft va neft-gazni qayta ishlash texnologiyasi	\N
373	310	60720100	Oziq-ovqat texnologiyasi (mahsulot turlari bo‘yicha)	\N
374	310	60810300	Qishloq va suv xo‘jaligida texnik servis	\N
375	310	60810400	Qishloq xo‘jaligida innovatsion texnika va texnologiyalarni qo‘llash	\N
376	310	60810100	Qishloq xo‘jaligini mexanizatsiyalashtirish	\N
377	310	60730305	Qurilish muhandisligi: bino va inshootlar qurilishi	\N
378	310	60730303	Qurilish muhandisligi: qurilish materiallari, buyumlari va konstruksiyalarini ishlab chiqarish	\N
379	310	60730200	Shahar qurilishi hamda kommunal infratuzilmani tashkil etish va boshqarish	\N
380	310	60720701	Texnologik mashinalar va jihozlar (tarmoqlar bo‘yicha)	\N
381	310	61040101	Transport logistikasi (transport turlari bo‘yicha)	\N
382	310	60712503	Transport vositalari muhandisligi (turlari bo‘yicha)	\N
383	310	61040300	Yo‘l harakatini tashkil etish	\N
384	310	60730804	Yo‘l muhandisligi (sohalar va faoliyat turlari bo‘yicha)	\N
385	311	60610204	Axborot tizimlari va texnologiyalari (tarmoqlar va sohalar bo‘yicha)	\N
386	311	60710200	Biotexnologiya (tarmoqlar bo‘yicha)	\N
387	311	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
388	311	60210406	Dizayn: kostyum dizayni	\N
389	311	60710602	Elektr energetikasi (tarmoqlar va yo‘nalishlar bo‘yicha)	\N
390	311	60710500	Energetika (tarmoqlar bo‘yicha)	\N
391	311	60711602	Intellektual muhandislik tizimlari (tarmoqlar va sohalar bo‘yicha)	\N
392	311	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
393	311	60710101	Kimyoviy texnologiya (ishlab chiqarish turlari bo‘yicha)	\N
394	311	60720400	Konservalash texnologiyasi	\N
395	311	60820200	Manzarali bog‘dorchilik va ko‘kalamzorlashtirish	\N
396	311	60412505	Marketing (tarmoqlar va sohalar bo‘yicha)	\N
397	311	60710300	Matbaa va qadoqlash jarayonlari texnologiyasi 	\N
398	311	60720601	Materialshunoslik va yangi materiallar texnologiyasi (tarmoqlar bo‘yicha)	\N
399	311	60411212	Menejment (tarmoqlar va sohalar bo‘yicha)	\N
400	311	60711303	Metrologiya, standartlashtirish va mahsulot sifati menejmenti (tarmoqlar bo‘yicha)	\N
401	311	60711500	Mexatronika va robototexnika	\N
402	311	60720100	Oziq-ovqat texnologiyasi (mahsulot turlari bo‘yicha)	\N
403	311	60811301	Qishloq xo‘jalik mahsulotlarini saqlash va dastlabki ishlash texnologiyasi (mahsulotlar turlari bo‘yicha)	\N
404	311	60721300	Tabiiy tolalarni dastlabki ishlash texnologiyasi (xomashyo va jarayon turlari bo‘yicha)	\N
405	311	60711402	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (tarmoqlar bo‘yicha)	\N
406	311	60711900	Texnologik jarayonlarni boshqarishning axborot-kommunikatsiya tizimlari	\N
407	311	60720701	Texnologik mashinalar va jihozlar (tarmoqlar bo‘yicha)	\N
408	311	60721204	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi (ishlab chiqarish turlari bo‘yicha)	\N
409	311	60721400	Yengil sanoat texnologiyalari va jihozlari (ishlab chiqarish turlari bo‘yicha)	\N
410	312	60412400	Agrobiznes va investitsion faoliyat	\N
411	312	60540200	Amaliy matematika	\N
412	312	60220400	Arxeologiya	\N
413	312	60410500	Bank ishi va auditi	\N
414	312	60510102	Biologiya (turlari bo‘yicha)	\N
415	312	60510102218	Biologiya (turlari bo‘yicha)-Kattaqo'rg'on tumani	\N
416	312	60510102220	Biologiya (turlari bo‘yicha)-Nurobod tumani	\N
417	312	60510102224	Biologiya (turlari bo‘yicha)-Payariq tumani	\N
418	312	60510102228	Biologiya (turlari bo‘yicha)-Urgut tumani	\N
419	312	60710200	Biotexnologiya (tarmoqlar bo‘yicha)	\N
420	312	60610600	Dasturiy injiniring	\N
421	312	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
422	312	60220502	Falsafa (yo‘nalishlar bo‘yicha)	\N
423	312	60230104	Filologiya va tillarni o‘qitish: o‘zbek tili	\N
424	312	60230104216	Filologiya va tillarni o‘qitish: o‘zbek tili-Ishtixon tumani	\N
425	312	60230104218	Filologiya va tillarni o‘qitish: o‘zbek tili-Kattaqo'rg'on tumani	\N
426	312	60230104220	Filologiya va tillarni o‘qitish: o‘zbek tili-Nurobod tumani	\N
427	312	60230104223	Filologiya va tillarni o‘qitish: o‘zbek tili-Paxtachi tumani	\N
428	312	60230104224	Filologiya va tillarni o‘qitish: o‘zbek tili-Payariq tumani	\N
429	312	60230104228	Filologiya va tillarni o‘qitish: o‘zbek tili-Urgut tumani	\N
430	312	60230107	Filologiya va tillarni o‘qitish: rus tili	\N
431	312	60230107220	Filologiya va tillarni o‘qitish: rus tili-Nurobod tumani	\N
432	312	60230106	Filologiya va tillarni o‘qitish: tojik tili	\N
433	312	60530901	Fizika	\N
434	312	60530901219	Fizika-Narpay tumani	\N
435	312	60530901220	Fizika-Nurobod tumani	\N
436	312	60530901228	Fizika-Urgut tumani	\N
437	312	60530400	Geografiya	\N
438	312	60530400218	Geografiya-Kattaqo'rg'on tumani	\N
439	312	60530400220	Geografiya-Nurobod tumani	\N
440	312	60530400225	Geografiya-Qo'shrabot tumani	\N
441	312	60530502	Geologiya (faoliyat sohasi bo‘yicha)	\N
442	312	60520100	Gidrometeorologiya	\N
443	312	60920103	Ijtimoiy ish: oila va bolalar bilan ishlash	\N
444	312	60920103010	Ijtimoiy ish: oila va bolalar bilan ishlash-Navoiy viloyati	\N
445	312	60920103008	Ijtimoiy ish: oila va bolalar bilan ishlash-Qashqadaryo viloyati	\N
446	312	60920103011	Ijtimoiy ish: oila va bolalar bilan ishlash-Samarqand viloyati	\N
447	312	60920103007	Ijtimoiy ish: oila va bolalar bilan ishlash-Surxondaryo viloyati	\N
448	312	60411400	Inson resurslarini boshqarish	\N
449	312	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
450	312	60530100	Kimyo (turlari bo‘yicha)	\N
451	312	60530100216	Kimyo (turlari bo‘yicha)-Ishtixon tumani	\N
452	312	60530100218	Kimyo (turlari bo‘yicha)-Kattaqo'rg'on tumani	\N
453	312	60530100220	Kimyo (turlari bo‘yicha)-Nurobod tumani	\N
454	312	60530100224	Kimyo (turlari bo‘yicha)-Payariq tumani	\N
455	312	60530100225	Kimyo (turlari bo‘yicha)-Qo'shrabot tumani	\N
456	312	60710101	Kimyoviy texnologiya (ishlab chiqarish turlari bo‘yicha)	\N
457	312	60610100	Kompyuter ilmlari va dasturlash texnologiyalari (yo‘nalishlar bo‘yicha)	\N
458	312	60540302	Matematik injiniring (ishlab chiqarish sohalari bo‘yicha)	\N
459	312	60540100	Matematika	\N
460	312	60540100220	Matematika-Nurobod tumani	\N
461	312	60540100223	Matematika-Paxtachi tumani	\N
462	312	60540100224	Matematika-Payariq tumani	\N
463	312	60540100225	Matematika-Qo'shrabot tumani	\N
464	312	60540100228	Matematika-Urgut tumani	\N
465	312	60720601	Materialshunoslik va yangi materiallar texnologiyasi (tarmoqlar bo‘yicha)	\N
466	312	60230600	Noshirlik ishi	\N
467	312	60310901	Psixologiya: amaliy psixologiya	\N
468	312	60310502	Raqamli iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
469	312	60311000	Sotsiologiya	\N
470	312	60610700	Sun’iy intellekt 	\N
471	312	60220307	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)	\N
472	312	60220307218	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)-Kattaqo'rg'on tumani	\N
473	312	60220307220	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)-Nurobod tumani	\N
474	312	60420107	Yurisprudensiya (faoliyat turlari bo‘yicha)	\N
475	313	60730102	Arxitektura (turlari bo‘yicha)	\N
476	313	60731100	Arxitektura yodgorliklari rekonstruktsiyasi va restavratsiyasi	\N
477	313	60411301	Biznesni boshqarish (tarmoqlar bo‘yicha)	\N
478	313	60210401	Dizayn: interyerni loyihalash 	\N
479	313	60210411	Dizayn: landshaft dizayni	\N
480	313	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
481	313	60722500	Geodeziya, kartografiya va kadastr (funksiyalari bo‘yicha)	\N
482	313	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
483	313	60722803	Kadastr (ko‘chmas mulk kadastri)	\N
484	313	60212200	Madaniy meros obyektlarini asrash 	\N
485	313	61020201	Mehnat muhofazasi va texnika xavfsizligi (tarmoqlar bo‘yicha)	\N
486	313	60730402	Muhandislik kommunikatsiyalari qurilishi va montaji (turlari bo‘yicha)	\N
487	313	60112404	Professional ta'lim: iqtisodiyot	\N
488	313	60112407	Professional ta'lim: muhandislik kommunikatsiyalari qurilishi va montaji	\N
489	313	60112416	Professional ta'lim: qurilish muhandisligi (bino va inshootlar qurilishi)	\N
490	313	60731000	Qiymat injiniringi va ko‘chmas mulk ekspertizasi	\N
491	313	60730301	Qurilish muhandisligi (faoliyat turlari bo‘yicha)	\N
492	313	60730305	Qurilish muhandisligi: bino va inshootlar qurilishi	\N
493	313	60730200	Shahar qurilishi hamda kommunal infratuzilmani tashkil etish va boshqarish	\N
494	313	60730500	Suv ta’minoti va kanalizatsiya tizimlarini loyihalashtirish va ekspluatatsiyasi	\N
495	313	60730804	Yo‘l muhandisligi (sohalar va faoliyat turlari bo‘yicha)	\N
496	314	60810700	Agrokimyo va agrotuproqshunoslik	\N
497	314	60220600	Amaliy etika	\N
498	314	60540200	Amaliy matematika	\N
499	314	60230500	Antropologiya va etnologiya	\N
500	314	60220400	Arxeologiya	\N
501	314	60320300	Arxivshunoslik	\N
502	314	60531100	Astronomiya	\N
503	314	60610204	Axborot tizimlari va texnologiyalari (tarmoqlar va sohalar bo‘yicha)	\N
504	314	60610300	Axborot xavfsizligi (sohalar bo‘yicha)	\N
505	314	60320200	Axborot xizmati va jamoatchilik bilan aloqalar	\N
506	314	60410500	Bank ishi va auditi	\N
507	314	60510101	Biologiya (matematik biologiya)	\N
508	314	60510102	Biologiya (turlari bo‘yicha)	\N
509	314	60710200	Biotexnologiya (tarmoqlar bo‘yicha)	\N
510	314	60410700	Budjet nazorati va g‘aznachiligi	\N
511	314	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
512	314	60310200	Ekonometrika	\N
1372	345	60540100	Matematika	\N
513	314	60220503	Falsafa (tizimli tahlil va mantiq)	\N
514	314	60220502	Falsafa (yo‘nalishlar bo‘yicha)	\N
515	314	60230103	Filologiya va tillarni o‘qitish: fransuz tili	\N
516	314	60230101	Filologiya va tillarni o‘qitish: ingliz tili	\N
517	314	60230119	Filologiya va tillarni o‘qitish: nemis tili	\N
518	314	60230104	Filologiya va tillarni o‘qitish: o‘zbek tili	\N
519	314	60230107	Filologiya va tillarni o‘qitish: rus tili	\N
520	314	60530901	Fizika	\N
521	314	60530902	Fizika (matematik fizika)	\N
522	314	60722500	Geodeziya, kartografiya va kadastr (funksiyalari bo‘yicha)	\N
523	314	60530400	Geografiya	\N
524	314	60530502	Geologiya (faoliyat sohasi bo‘yicha)	\N
525	314	60530802	Gidrologiya (tarmoqlar bo‘yicha)	\N
526	314	60520100	Gidrometeorologiya	\N
527	314	61020100	Hayotiy faoliyat xavfsizligi	\N
528	314	60920101	Ijtimoiy ish (fuqarolarning o‘z-o‘zini boshqarish organlari)	\N
529	314	60920103	Ijtimoiy ish: oila va bolalar bilan ishlash	\N
530	314	60920103014	Ijtimoiy ish: oila va bolalar bilan ishlash-Toshkent shahri	\N
531	314	60411400	Inson resurslarini boshqarish	\N
532	314	60310103	Iqtisodiyot (matematika iqtisodiyoti)	\N
533	314	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
534	314	60411900	Jahon iqtisodiyoti va xalqaro iqtisodiy munosabatlar (mintaqalar va faoliyat turlari bo‘yicha)	\N
535	314	60320102	Jurnalistika: bosma ommaviy axborot vositalari jurnalistikasi	\N
536	314	60320104	Jurnalistika: internet jurnalistika	\N
537	314	60530100	Kimyo (turlari bo‘yicha)	\N
538	314	60610100	Kompyuter ilmlari va dasturlash texnologiyalari (yo‘nalishlar bo‘yicha)	\N
539	314	60723000	Mahsulotlarning kimyoviy tahlili (oziq-ovqat mahsulotlari)	\N
540	314	60540302	Matematik injiniring (ishlab chiqarish sohalari bo‘yicha)	\N
541	314	60540100	Matematika	\N
542	314	60230302	Matnshunoslik va adabiy manbashunoslik: o‘zbek tili	\N
543	314	60411211	Menejment (sport tadbirlarini tashkil etish va boshqarish)	\N
544	314	60411212	Menejment (tarmoqlar va sohalar bo‘yicha)	\N
545	314	60520200	Meteorologiya va iqlimshunoslik  	\N
546	314	60531000	Mexanika va matematik modellashtirish	\N
547	314	60112100	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi	\N
548	314	60310300	Mintaqaviy iqtisodiyot	\N
549	314	60410400	Moliya va moliyaviy texnologiyalar	\N
550	314	60530200	Neft va gaz kimyosi	\N
551	314	60111701	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)	\N
552	314	60421100	Patentshunoslik	\N
553	314	60310901	Psixologiya: amaliy psixologiya	\N
554	314	60310906	Psixologiya: oila psixologiyasi	\N
555	314	60310902	Psixologiya: yoshlar psixologiyasi	\N
556	314	60531300	Seysmologiya va seysmometriya	\N
557	314	60310700	Siyosatshunoslik	\N
558	314	60311000	Sotsiologiya	\N
559	314	61010348	Sport faoliyati: dzyudo	\N
560	314	61010342	Sport faoliyati: kurash	\N
561	314	61010337	Sport faoliyati: regbi	\N
562	314	61010309	Sport faoliyati: taekvondo WTF	\N
563	314	60410600	Sug‘urta ishi	\N
564	314	60610700	Sun’iy intellekt 	\N
565	314	60530300	Tabiiy va fiziologik faol birikmalar kimyosi	\N
566	314	60220307	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)	\N
567	314	60230204	Tarjima nazariyasi va amaliyoti: fransuz tili	\N
568	314	60230203	Tarjima nazariyasi va amaliyoti: ingliz tili	\N
569	314	60230206	Tarjima nazariyasi va amaliyoti: nemis tili	\N
570	314	60531200	Tibbiyot fizikasi	\N
571	314	60111804	Xorijiy til va adabiyoti: ingliz tili	\N
572	314	60420104	Yurisprudensiya : biznes huquqi	\N
573	315	60712400	Avtomobilsozlik va traktorsozlik	\N
574	315	60610204	Axborot tizimlari va texnologiyalari (tarmoqlar va sohalar bo‘yicha)	\N
575	315	60710200	Biotexnologiya (tarmoqlar bo‘yicha)	\N
576	315	60711800	Biotibbiyot muhandisligi	\N
577	315	60210408	Dizayn: sanoat dizayni	\N
578	315	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
579	315	60710602	Elektr energetikasi (tarmoqlar va yo‘nalishlar bo‘yicha)	\N
580	315	60710702	Elektr texnikasi, elektr mexanikasi va elektr texnologiyalari (tarmoqlar bo‘yicha)	\N
581	315	60712000	Elektron apparaturalar ishlab chiqarish texnologiyasi	\N
582	315	60711200	Elektronika va asbobsozlik (tarmoqlar bo‘yicha)	\N
583	315	60710500	Energetika (tarmoqlar bo‘yicha)	\N
584	315	60711102	Energiya mashinasozligi (tarmoqlar bo‘yicha)	\N
585	315	60710900	Energiya tejamkorligi va energoaudit	\N
586	315	60721601	Foydali qazilma konlari geologiyasi, qidiruv va razvedkasi (kon turlari bo‘yicha)	\N
587	315	60721602	Foydali qazilma konlari geologiyasi, qidiruv va razvedkasi (mis konlari)	\N
588	315	60713000	Gaz jihozlaridan foydalanish va ularga xizmat ko‘rsatish	\N
589	315	60722500	Geodeziya, kartografiya va kadastr (funksiyalari bo‘yicha)	\N
590	315	60710800	Gidroenergetika	\N
591	315	60721700	Gidrogeologiya va muhandislik geologiyasi	\N
592	315	61020100	Hayotiy faoliyat xavfsizligi	\N
593	315	60711602	Intellektual muhandislik tizimlari (tarmoqlar va sohalar bo‘yicha)	\N
594	315	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
595	315	60721900	Konchilik elektr mexanikasi	\N
596	315	60721501	Konchilik ishi (faoliyat turlari bo‘yicha)	\N
597	315	60721502	Konchilik ishi (mis rudalarini boyitish)	\N
598	315	60411600	Korporativ boshqaruv	\N
599	315	60711700	Lazer-yorug‘lik texnologiyalari va optoelektronika	\N
600	315	60722000	Marksheyderlik ishi	\N
601	315	60720800	Mashinasozlik texnologiyasi, mashinasozlik ishlab chiqarishini jihozlash va avtomatlashtirish	\N
602	315	60720601	Materialshunoslik va yangi materiallar texnologiyasi (tarmoqlar bo‘yicha)	\N
603	315	61020201	Mehnat muhofazasi va texnika xavfsizligi (tarmoqlar bo‘yicha)	\N
604	315	60411208	Menejment (sanoat korxonalarida innovatsion loyihalar boshqaruvi)	\N
605	315	60712300	Metallar texnologiyalari (jarayon turlari bo‘yicha)	\N
606	315	60712101	Metallurgiya (metall turlari bo‘yicha)	\N
607	315	60712102	Metallurgiya (mis va noyob metallar)	\N
608	315	60711303	Metrologiya, standartlashtirish va mahsulot sifati menejmenti (tarmoqlar bo‘yicha)	\N
609	315	60711500	Mexatronika va robototexnika	\N
610	315	60711003	Muqobil energiya manbalari (quyosh va shamol energiyasi texnologiyalari)	\N
611	315	60711001	Muqobil energiya manbalari (turlari bo‘yicha)	\N
612	315	60711002	Muqobil energiya manbalari (vodorod energiyasi texnologiyalari)	\N
613	315	60721800	Neft va gaz ishi (faoliyat turlari bo‘yicha)	\N
614	315	60720900	Neftgazkimyo sanoati texnologiyasi	\N
615	315	60712200	Payvandlash texnologiyasi va jihozlari	\N
616	315	60112430	Professional ta’lim: mexatronika va robototexnika	\N
617	315	60112403	Professional ta’lim: transport vositalari muhandisligi (avtotransport)	\N
618	315	60730304	Qurilish muhandisligi: neft-gazni qayta ishlash sanoati obyektlari qurilishi	\N
619	315	60611503	Radioelektron qurilmalar va tizimlar (tarmoqlar bo‘yicha)	\N
620	315	60610700	Sun’iy intellekt 	\N
621	315	60711402	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (tarmoqlar bo‘yicha)	\N
622	315	60720701	Texnologik mashinalar va jihozlar (tarmoqlar bo‘yicha)	\N
623	315	60712503	Transport vositalari muhandisligi (turlari bo‘yicha)	\N
624	317	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
625	317	60710602	Elektr energetikasi (tarmoqlar va yo‘nalishlar bo‘yicha)	\N
626	317	60710101	Kimyoviy texnologiya (ishlab chiqarish turlari bo‘yicha)	\N
627	317	60721900	Konchilik elektr mexanikasi	\N
628	317	60721501	Konchilik ishi (faoliyat turlari bo‘yicha)	\N
629	317	60720800	Mashinasozlik texnologiyasi, mashinasozlik ishlab chiqarishini jihozlash va avtomatlashtirish	\N
630	317	60712101	Metallurgiya (metall turlari bo‘yicha)	\N
631	317	60711402	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (tarmoqlar bo‘yicha)	\N
632	318	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
633	318	60721601	Foydali qazilma konlari geologiyasi, qidiruv va razvedkasi (kon turlari bo‘yicha)	\N
634	318	60530502	Geologiya (faoliyat sohasi bo‘yicha)	\N
635	318	60530501	Geologiya (neft va gaz geofizikasi)	\N
636	318	60721700	Gidrogeologiya va muhandislik geologiyasi	\N
637	318	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
638	319	60710200	Biotexnologiya (tarmoqlar bo‘yicha)	\N
639	319	60710602	Elektr energetikasi (tarmoqlar va yo‘nalishlar bo‘yicha)	\N
640	319	60710500	Energetika (tarmoqlar bo‘yicha)	\N
641	319	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
642	319	60710101	Kimyoviy texnologiya (ishlab chiqarish turlari bo‘yicha)	\N
643	319	60721900	Konchilik elektr mexanikasi	\N
644	319	60721501	Konchilik ishi (faoliyat turlari bo‘yicha)	\N
645	319	60720800	Mashinasozlik texnologiyasi, mashinasozlik ishlab chiqarishini jihozlash va avtomatlashtirish	\N
646	319	60720601	Materialshunoslik va yangi materiallar texnologiyasi (tarmoqlar bo‘yicha)	\N
647	319	61020201	Mehnat muhofazasi va texnika xavfsizligi (tarmoqlar bo‘yicha)	\N
648	319	60712101	Metallurgiya (metall turlari bo‘yicha)	\N
649	319	60711303	Metrologiya, standartlashtirish va mahsulot sifati menejmenti (tarmoqlar bo‘yicha)	\N
650	319	60722400	Noyob va radioaktiv metallar rudalarini qazib olish, qayta ishlash texnikasi va texnologiyasi	\N
651	319	60711402	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (tarmoqlar bo‘yicha)	\N
652	319	60720701	Texnologik mashinalar va jihozlar (tarmoqlar bo‘yicha)	\N
653	320	60412400	Agrobiznes va investitsion faoliyat	\N
654	320	60810700	Agrokimyo va agrotuproqshunoslik	\N
655	320	60810904	Agronomiya (dehqonchilik mahsulotlari turlari bo‘yicha)	\N
656	320	60610202	Axborot tizimlari va texnologiyalari (qishloq xo‘jaligida raqamli texnologiyalar)	\N
657	320	60410105	Buxgalteriya hisobi va audit (qishloq xo‘jaligida)	\N
658	320	60812100	Dorivor o‘simliklarni yetishtirish va qayta ishlash texnologiyasi	\N
659	320	60310105	Iqtisodiyot: qishloq xo‘jaligi iqtisodiyoti	\N
660	320	60812000	Issiqxona xo‘jaligini tashkil etish va yuritish	\N
661	320	60411701	Logistika (agrologistika)	\N
662	320	60811800	Mevachilik va uzumchilik	\N
663	320	60811102	O‘simliklar va qishloq xo‘jalik mahsulotlari karantini	\N
664	320	60811001	O‘simliklarni himoya qilish (ekin turlari bo‘yicha)	\N
665	320	60811200	Qishloq xo‘jaligi ekinlari seleksiyasi va urug‘chiligi (ekin turlari bo‘yicha)	\N
666	320	60810100	Qishloq xo‘jaligini mexanizatsiyalashtirish	\N
667	320	60811301	Qishloq xo‘jalik mahsulotlarini saqlash va dastlabki ishlash texnologiyasi (mahsulotlar turlari bo‘yicha)	\N
668	320	60811900	Sabzavotchilik, polizchilik va kartoshkachilik	\N
669	320	61010405	Turizm (agroturizm)	\N
670	320	60811505	Zooinjeneriya: qorako‘lchilik	\N
671	322	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
672	322	60310901	Psixologiya: amaliy psixologiya	\N
673	322	60420107	Yurisprudensiya (faoliyat turlari bo‘yicha)	\N
674	323	60730102	Arxitektura (turlari bo‘yicha)	\N
675	323	60410500	Bank ishi va auditi	\N
676	323	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
677	323	60730902	Gidrotexnika qurilishi (turlari bo‘yicha)	\N
678	323	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
679	323	60730305	Qurilish muhandisligi: bino va inshootlar qurilishi	\N
680	323	60730303	Qurilish muhandisligi: qurilish materiallari, buyumlari va konstruksiyalarini ishlab chiqarish	\N
1461	346	60311000	Sotsiologiya	\N
681	324	60610204	Axborot tizimlari va texnologiyalari (tarmoqlar va sohalar bo‘yicha)	\N
682	324	60410500	Bank ishi va auditi	\N
683	324	60411500	Biznes-tahlil	\N
684	324	60411301	Biznesni boshqarish (tarmoqlar bo‘yicha)	\N
685	324	60410700	Budjet nazorati va g‘aznachiligi	\N
686	324	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
687	324	60310200	Ekonometrika	\N
688	324	60411400	Inson resurslarini boshqarish	\N
689	324	60310400	Iqtisodiy xavfsizlik	\N
690	324	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
691	324	60411900	Jahon iqtisodiyoti va xalqaro iqtisodiy munosabatlar (mintaqalar va faoliyat turlari bo‘yicha)	\N
692	324	60411600	Korporativ boshqaruv	\N
693	324	60411703	Logistika (yo‘nalishlar bo‘yicha)	\N
694	324	60412504	Marketing (reklama ishi)	\N
695	324	60412505	Marketing (tarmoqlar va sohalar bo‘yicha)	\N
696	324	61010100	Mehmonxona xo‘jaligini tashkil etish va boshqarish	\N
697	324	60411212	Menejment (tarmoqlar va sohalar bo‘yicha)	\N
698	324	60411203	Menejment: turizm biznesini boshqarish	\N
699	324	60310300	Mintaqaviy iqtisodiyot	\N
700	324	60410400	Moliya va moliyaviy texnologiyalar	\N
701	324	60112404	Professional ta'lim: iqtisodiyot	\N
702	324	60310502	Raqamli iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
703	324	60412600	Savdo ishi (turlari bo‘yicha)	\N
704	324	60410200	Soliqlar va soliqqa tortish	\N
705	324	60410800	Statistika (tarmoqlar va sohalar bo‘yicha)	\N
706	324	60410600	Sug‘urta ishi	\N
707	324	61010401	Turizm (faoliyat yo‘nalishlari bo‘yicha )	\N
708	325	60112428	Professional ta'lim: xoreografiya	\N
709	325	60211006	San'atshunoslik: xoreografiya	\N
710	325	60211602	Xoreografiya (turlari bo‘yicha)	\N
711	325	60211601	Xoreografiya: zamonaviy raqs	\N
712	326	60320200	Axborot xizmati va jamoatchilik bilan aloqalar	\N
713	326	60230113	Filologiya va tillarni o‘qitish: arab tili	\N
714	326	60230103	Filologiya va tillarni o‘qitish: fransuz tili	\N
715	326	60230101	Filologiya va tillarni o‘qitish: ingliz tili	\N
716	326	60230112	Filologiya va tillarni o‘qitish: ispan tili	\N
717	326	60230108	Filologiya va tillarni o‘qitish: koreys tili	\N
718	326	60230119	Filologiya va tillarni o‘qitish: nemis tili	\N
719	326	60230107	Filologiya va tillarni o‘qitish: rus tili	\N
720	326	60230102	Filologiya va tillarni o‘qitish: xitoy tili	\N
721	326	60230117	Filologiya va tillarni o‘qitish: yapon tili	\N
722	326	61010505	Gid hamrohligi va tarjimonlik faoliyati: ingliz tili	\N
723	326	60320101	Jurnalistika: xalqaro jurnalistika	\N
724	326	60111701	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)	\N
725	326	60310700	Siyosatshunoslik	\N
726	326	60230205	Tarjima nazariyasi va amaliyoti: arab tili	\N
727	326	60230204	Tarjima nazariyasi va amaliyoti: fransuz tili	\N
728	326	60230203	Tarjima nazariyasi va amaliyoti: ingliz tili	\N
729	326	60230201	Tarjima nazariyasi va amaliyoti: italyan tili	\N
730	326	60230206	Tarjima nazariyasi va amaliyoti: nemis tili	\N
731	326	60111804	Xorijiy til va adabiyoti: ingliz tili	\N
732	327	60230500	Antropologiya va etnologiya	\N
733	327	60220501	Falsafa (sharq falsafasi va madaniyati) 	\N
734	327	60230113	Filologiya va tillarni o‘qitish: arab tili	\N
735	327	60230116	Filologiya va tillarni o‘qitish: dariy tili	\N
736	327	60230121	Filologiya va tillarni o‘qitish: fors tili	\N
737	327	60230114	Filologiya va tillarni o‘qitish: hind tili	\N
738	327	60230108	Filologiya va tillarni o‘qitish: koreys tili	\N
739	327	60230115	Filologiya va tillarni o‘qitish: mumtoz sharq tillari (arab tili)	\N
740	327	60230109	Filologiya va tillarni o‘qitish: pushtu tili	\N
741	327	60230118	Filologiya va tillarni o‘qitish: turk tili	\N
742	327	60230120	Filologiya va tillarni o‘qitish: urdu tili	\N
743	327	60230111	Filologiya va tillarni o‘qitish: uyg‘ur tili	\N
744	327	60230102	Filologiya va tillarni o‘qitish: xitoy tili	\N
745	327	60230117	Filologiya va tillarni o‘qitish: yapon tili	\N
746	327	61010502	Gid hamrohligi va tarjimonlik faoliyati: fors tili	\N
747	327	61010501	Gid hamrohligi va tarjimonlik faoliyati: turk tili	\N
748	327	60411900	Jahon iqtisodiyoti va xalqaro iqtisodiy munosabatlar (mintaqalar va faoliyat turlari bo‘yicha)	\N
749	327	60320101	Jurnalistika: xalqaro jurnalistika	\N
750	327	60230303	Matnshunoslik va adabiy manbashunoslik: arab tili	\N
751	327	60230301	Matnshunoslik va adabiy manbashunoslik: fors tili	\N
752	327	60220301	Tarix: Afg‘oniston tarixi	\N
753	327	60220302	Tarix: arab mamlakatlari tarixi	\N
754	327	60220303	Tarix: Eron tarixi	\N
755	327	60220310	Tarix: Koreya tarixi	\N
756	327	60220304	Tarix: Markaziy Osiyo xalqlari tarixi	\N
757	327	60220306	Tarix: Turkiya tarixi	\N
758	327	60220309	Tarix: Xitoy tarixi	\N
759	327	60220305	Tarix: Yaponiya tarixi	\N
760	327	60230205	Tarjima nazariyasi va amaliyoti: arab tili	\N
761	327	60230207	Tarjima nazariyasi va amaliyoti: urdu tili	\N
762	327	61010401	Turizm (faoliyat yo‘nalishlari bo‘yicha )	\N
763	327	60310800	Xalqaro munosabatlar	\N
764	327	60411802	Xorijiy mamlakatlar iqtisodiyoti va mamlakatshunoslik: Eron	\N
765	327	60411806	Xorijiy mamlakatlar iqtisodiyoti va mamlakatshunoslik: Malayziya	\N
766	327	60411801	Xorijiy mamlakatlar iqtisodiyoti va mamlakatshunoslik: Turkiya	\N
767	327	60411804	Xorijiy mamlakatlar iqtisodiyoti va mamlakatshunoslik: Xitoy	\N
768	327	60411803	Xorijiy mamlakatlar iqtisodiyoti va mamlakatshunoslik: Yaponiya	\N
769	328	60730102	Arxitektura (turlari bo‘yicha)	\N
770	328	60731100	Arxitektura yodgorliklari rekonstruktsiyasi va restavratsiyasi	\N
771	328	60210410	Dizayn: arxitekturaviy muhit dizayni	\N
772	328	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
773	328	60722500	Geodeziya, kartografiya va kadastr (funksiyalari bo‘yicha)	\N
774	328	60730902	Gidrotexnika qurilishi (turlari bo‘yicha)	\N
775	328	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
776	328	60212200	Madaniy meros obyektlarini asrash 	\N
777	328	60720603	Materialshunoslik va yangi materiallar texnologiyasi (qurilish) 	\N
778	328	60411212	Menejment (tarmoqlar va sohalar bo‘yicha)	\N
779	328	60711303	Metrologiya, standartlashtirish va mahsulot sifati menejmenti (tarmoqlar bo‘yicha)	\N
780	328	60730402	Muhandislik kommunikatsiyalari qurilishi va montaji (turlari bo‘yicha)	\N
781	328	60112407	Professional ta'lim: muhandislik kommunikatsiyalari qurilishi va montaji	\N
782	328	60112416	Professional ta'lim: qurilish muhandisligi (bino va inshootlar qurilishi)	\N
783	328	60731000	Qiymat injiniringi va ko‘chmas mulk ekspertizasi	\N
784	328	60730305	Qurilish muhandisligi: bino va inshootlar qurilishi	\N
785	328	60730302	Qurilish muhandisligi: devorbop va pardozbop qurilish materiallari texnologiyasi	\N
786	328	60730304	Qurilish muhandisligi: neft-gazni qayta ishlash sanoati obyektlari qurilishi	\N
787	328	60730303	Qurilish muhandisligi: qurilish materiallari, buyumlari va konstruksiyalarini ishlab chiqarish	\N
788	328	60730200	Shahar qurilishi hamda kommunal infratuzilmani tashkil etish va boshqarish	\N
789	328	60730500	Suv ta’minoti va kanalizatsiya tizimlarini loyihalashtirish va ekspluatatsiyasi	\N
790	329	60210801	Amaliy san'at: amaliy san'at asarlarini ta'mirlash	\N
791	329	60210802	Amaliy san'at: badiiy kulolchilik	\N
792	329	60210804	Amaliy san'at: badiiy zargarlik	\N
793	329	60210803	Amaliy san'at: me'moriy yodgorliklar bezagini ta'mirlash	\N
794	329	60210401	Dizayn: interyerni loyihalash 	\N
795	329	60210404	Dizayn: kompyuter grafikasi va badiiy foto	\N
796	329	60210405	Dizayn: libos va gazlamalar	\N
797	329	60210402	Dizayn: reklama va amaliy grafika	\N
798	329	60210408	Dizayn: sanoat dizayni	\N
799	329	60210601	Grafika: dastgoh va kitob grafikasi	\N
800	329	60210602	Grafika: xattotlik va miniatyura	\N
801	329	60210702	Haykaltaroshlik: mahobatli	\N
802	329	60210701	Haykaltaroshlik: mayda plastika	\N
803	329	60411206	Menejment (art menejment va galereya ishi)	\N
804	329	60212102	Muzeyshunoslik: muzey menejmenti va madaniy turizm	\N
805	329	60212103	Muzeyshunoslik: muzey predmetlari ekspertizasi, konservatsiyalash va ta’mirlash	\N
806	329	60112426	Professional ta'lim: amaliy san'at (amaliy san'at asarlarini ta'mirlash)	\N
807	329	60112422	Professional ta'lim: dizayn (interyerni loyihalash)	\N
808	329	60112429	Professional ta'lim: dizayn (libos va gazlamalar)	\N
809	329	60112424	Professional ta'lim: rangtasvir (dastgohli)	\N
810	329	60212300	Qadimiy yozma manbalar konservatsiyasi va restavratsiyasi	\N
811	329	60210501	Rangtasvir: dastgohli	\N
812	329	60210505	Rangtasvir: filmning tasviriy yechimi	\N
813	329	60210502	Rangtasvir: mahobatli rangtasvir	\N
814	329	60210503	Rangtasvir: multfilm va kompyuter multiplikatsiyasi	\N
815	329	60210504	Rangtasvir: teatr-bezak rangtasvir	\N
816	329	60211004	San'atshunoslik: tasviriy va amaliy san'at	\N
817	331	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
818	331	60210406	Dizayn: kostyum dizayni	\N
819	331	60210407	Dizayn: poyabzal va aksessuarlar dizayni	\N
820	331	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
821	331	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
822	331	60710101	Kimyoviy texnologiya (ishlab chiqarish turlari bo‘yicha)	\N
823	331	60412505	Marketing (tarmoqlar va sohalar bo‘yicha)	\N
824	331	60710300	Matbaa va qadoqlash jarayonlari texnologiyasi 	\N
825	331	60720601	Materialshunoslik va yangi materiallar texnologiyasi (tarmoqlar bo‘yicha)	\N
826	331	61020201	Mehnat muhofazasi va texnika xavfsizligi (tarmoqlar bo‘yicha)	\N
827	331	60711303	Metrologiya, standartlashtirish va mahsulot sifati menejmenti (tarmoqlar bo‘yicha)	\N
828	331	60721300	Tabiiy tolalarni dastlabki ishlash texnologiyasi (xomashyo va jarayon turlari bo‘yicha)	\N
829	331	60711402	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (tarmoqlar bo‘yicha)	\N
830	331	60720701	Texnologik mashinalar va jihozlar (tarmoqlar bo‘yicha)	\N
831	331	60721208	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: charm buyumlari texnologiyasi	\N
832	331	60721202	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: charm va mo‘yna texnologiyasi	\N
833	331	60721206	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: gilamchilik	\N
834	331	60721214	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: ipak mahsulotlari ishlab chiqarish	\N
835	331	60721212	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: noto‘qima materiallar texnologiyasi	\N
836	331	60721207	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: shaxsiy buyurtma asosida kiyim tayyorlash	\N
837	331	60721211	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: tikuv buyumlari texnologiyasi	\N
838	331	60721209	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: to‘qima	\N
839	331	60721210	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: trikotaj	\N
840	331	60721213	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: yigirilgan ip ishlab chiqarish	\N
841	331	60721401	Yengil sanoat texnologiyalari va jihozlari: charm va mo‘ynani qayta ishlash  va jihozlari	\N
842	331	60721402	Yengil sanoat texnologiyalari va jihozlari: poyabzal, charm-attorlik buyumlari ishlab chiqarish va jihozlari	\N
843	331	60721403	Yengil sanoat texnologiyalari va jihozlari: tikuvchilik sanoatida kreativ loyihalash va innovatsion texnologiyalar	\N
844	334	60712900	Amaliy kosmik texnologiyalar	\N
845	334	60712803	Aviatsiya injiniringi (aviasozlik)	\N
846	334	60712802	Aviatsiya injiniringi (uchuvchisiz uchish apparatlari aviatsiya majmualari)	\N
847	334	61040400	Avtomobil servisi	\N
848	334	60610201	Axborot tizimlari va texnologiyalari (temir yo‘l transporti)	\N
849	334	60411302	Biznesni boshqarish (transport)	\N
850	334	60410101	Buxgalteriya hisobi va audit (avtomobil transporti)	\N
851	334	60410102	Buxgalteriya hisobi va audit (temir yo‘l transporti)	\N
852	334	60610600	Dasturiy injiniring	\N
853	334	60710401	Ekologiya va atrof-muhit muhofazasi (avtomobil transporti)	\N
854	334	60710601	Elektr energetikasi (temir yo‘l transporti)	\N
855	334	60710701	Elektr texnikasi, elektr mexanikasi va elektr texnologiyalari (temir yo‘l transporti)	\N
856	334	60712600	Havo kemalarining texnik ekspluatatsiyasi	\N
857	334	61040200	Havodagi harakatni boshqarish 	\N
858	334	60711601	Intellektual muhandislik tizimlari (avtomobil transporti)	\N
859	334	60310101	Iqtisodiyot (avtomobil transporti)	\N
860	334	60310103	Iqtisodiyot (matematika iqtisodiyoti)	\N
861	334	60310102	Iqtisodiyot (temir yo‘l transporti)	\N
862	334	61010700	Kommunal infratuzilma va uy-joy kommunal xo'jaligini tashkil etish va boshqarish 	\N
863	334	60411600	Korporativ boshqaruv	\N
864	334	60412501	Marketing (avtomobil transporti)	\N
865	334	60412503	Marketing (temir yo‘l transporti)	\N
866	334	60720800	Mashinasozlik texnologiyasi, mashinasozlik ishlab chiqarishini jihozlash va avtomatlashtirish	\N
867	334	60540301	Matematik injiniring (transport)	\N
868	334	60720602	Materialshunoslik va yangi materiallar texnologiyasi (temir yo‘l transporti)	\N
869	334	61020203	Mehnat muhofazasi va texnika xavfsizligi (transport)	\N
870	334	60411213	Menejment (transport sohasida loyihalar boshqaruvi)	\N
871	334	60711302	Metrologiya, standartlashtirish va mahsulot sifati menejmenti (avtomobil transporti va yo‘l qurilishi mashinalari)	\N
872	334	60730401	Muhandislik kommunikatsiyalari qurilishi va montaji (transport tizimlarida suv ta'minoti va kanalizatsiya)	\N
873	334	60730305	Qurilish muhandisligi: bino va inshootlar qurilishi	\N
874	334	60611502	Radioelektron qurilmalar va tizimlar (aviatsiya transporti)	\N
875	334	60611501	Radoielektron qurilmalar va tizimlar (temir yo‘l transporti)	\N
876	334	60310501	Raqamli iqtisodiyot (transport)	\N
877	334	60310700	Siyosatshunoslik	\N
878	334	60311000	Sotsiologiya	\N
879	334	60230203	Tarjima nazariyasi va amaliyoti: ingliz tili	\N
880	334	60230202	Tarjima nazariyasi va amaliyoti: rus tili	\N
881	334	60711403	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (temir yo‘l transporti)	\N
882	334	60720702	Texnologik masinalar va jihozlar (temir yo‘l transporti)	\N
883	334	61040102	Transport logistikasi (avtomobil transporti)	\N
884	334	60712508	Transport vositalari muhandisligi: avtomobil transporti	\N
885	334	60712504	Transport vositalari muhandisligi: elektr transporti	\N
886	334	60712509	Transport vositalari muhandisligi: elektromobil transporti	\N
887	334	60712506	Transport vositalari muhandisligi: ixtisoslashtirilgan transport vositalari	\N
888	334	60712505	Transport vositalari muhandisligi: ko‘tarish-tashish, yo‘l va qurilish mashinalari	\N
889	334	60712501	Transport vositalari muhandisligi: lokomotivlar	\N
890	334	60712502	Transport vositalari muhandisligi: metropoliten	\N
891	334	60712507	Transport vositalari muhandisligi: vagonlar	\N
892	334	60713200	Transportda tashishni tashkil etish va boshqarish (temir yo‘l transporti)	\N
893	334	61040300	Yo‘l harakatini tashkil etish	\N
894	334	60730807	Yo‘l muhandisligi: avtomobil yo‘llari ekspluatatsiyasi	\N
895	334	60730810	Yo‘l muhandisligi: avtomobil yo‘llaridagi sun'iy inshootlar	\N
896	334	60730805	Yo‘l muhandisligi: avtomobil yo‘llarini arxitektura-landshaft konstruktsiyalash	\N
897	334	60730802	Yo‘l muhandisligi: avtomobil yo‘llarini loyihalash	\N
898	334	60730809	Yo‘l muhandisligi: avtomobil yo‘llarini qurish	\N
899	334	60730801	Yo‘l muhandisligi: ko‘priklar va tonellar	\N
900	334	60730806	Yo‘l muhandisligi: shahar yo‘llari va ko‘chalar	\N
901	334	60730803	Yo‘l muhandisligi: temir yo‘l ekspluatatsiyasi	\N
902	334	60730808	Yo‘l muhandisligi: temir yo‘l qurilishi	\N
903	334	60420111	Yurisprudensiya (xalqaro transport huquqi)	\N
904	335	60720500	Funksional ovqatlanish va bolalar mahsulotlari texnologiyasi	\N
905	335	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
906	335	60710101	Kimyoviy texnologiya (ishlab chiqarish turlari bo‘yicha)	\N
907	335	60711303	Metrologiya, standartlashtirish va mahsulot sifati menejmenti (tarmoqlar bo‘yicha)	\N
908	335	60720100	Oziq-ovqat texnologiyasi (mahsulot turlari bo‘yicha)	\N
909	335	60711402	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (tarmoqlar bo‘yicha)	\N
910	335	60720701	Texnologik mashinalar va jihozlar (tarmoqlar bo‘yicha)	\N
911	335	60720300	Vinochilik texnologiyasi, bijg‘ish mahsulotlari va alkogolsiz ichimliklar texnologiyasi	\N
912	336	60610203	Axborot tizimlari va texnologiyalari (moliya-bank tizimida)	\N
913	336	60412700	Baholash ishi	\N
914	336	60410500	Bank ishi va auditi	\N
915	336	60410900	Birja ishi	\N
916	336	60411500	Biznes-tahlil	\N
917	336	60410700	Budjet nazorati va g‘aznachiligi	\N
918	336	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
919	336	60412800	Elektron tijorat	\N
920	336	60411000	Investitsion loyihalarga xizmat ko‘rsatish va moliyalashtirish	\N
921	336	60310400	Iqtisodiy xavfsizlik	\N
922	336	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
923	336	60411212	Menejment (tarmoqlar va sohalar bo‘yicha)	\N
924	336	60410400	Moliya va moliyaviy texnologiyalar	\N
925	336	60410200	Soliqlar va soliqqa tortish	\N
926	336	60410800	Statistika (tarmoqlar va sohalar bo‘yicha)	\N
927	336	60410600	Sug‘urta ishi	\N
928	336	60412100	Xalqaro valuta-kredit munosabatlari	\N
929	337	61010200	Aholi va turistlarning ovqatlanishini tashkil etish servisi	\N
930	337	60710200	Biotexnologiya (tarmoqlar bo‘yicha)	\N
931	337	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
932	337	60710500	Energetika (tarmoqlar bo‘yicha)	\N
933	337	60720500	Funksional ovqatlanish va bolalar mahsulotlari texnologiyasi	\N
934	337	60721000	Gazni chuqur qayta ishlash texnologiyasi 	\N
935	337	60710101	Kimyoviy texnologiya (ishlab chiqarish turlari bo‘yicha)	\N
936	337	60710102	Kimyoviy texnologiya (selluloza-qog‘oz ishlab chiqarish kimyoviy texnologiyasi)	\N
937	337	60720400	Konservalash texnologiyasi	\N
938	337	60412505	Marketing (tarmoqlar va sohalar bo‘yicha)	\N
939	337	60720601	Materialshunoslik va yangi materiallar texnologiyasi (tarmoqlar bo‘yicha)	\N
940	337	61020201	Mehnat muhofazasi va texnika xavfsizligi (tarmoqlar bo‘yicha)	\N
941	337	60411212	Menejment (tarmoqlar va sohalar bo‘yicha)	\N
942	337	60711303	Metrologiya, standartlashtirish va mahsulot sifati menejmenti (tarmoqlar bo‘yicha)	\N
943	337	60721100	Neft va neft-gazni qayta ishlash texnologiyasi	\N
944	337	60720900	Neftgazkimyo sanoati texnologiyasi	\N
945	337	60720100	Oziq-ovqat texnologiyasi (mahsulot turlari bo‘yicha)	\N
946	337	60112415	Professional ta'lim: kimyoviy texnologiya	\N
947	337	60711402	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (tarmoqlar bo‘yicha)	\N
948	337	60720701	Texnologik mashinalar va jihozlar (tarmoqlar bo‘yicha)	\N
949	337	60720300	Vinochilik texnologiyasi, bijg‘ish mahsulotlari va alkogolsiz ichimliklar texnologiyasi	\N
950	337	60720200	Yog‘lar, efir moylari va parfumeriya-kosmetika mahsulotlari texnologiyasi	\N
951	338	60910200	Davolash ishi	\N
952	338	60910200091	Davolash ishi-Amudaryo tumani	\N
953	338	60910200092	Davolash ishi-Beruniy tumani	\N
954	338	60910200157	Davolash ishi-Bog'ot tumani	\N
955	338	60910200158	Davolash ishi-Gurlan tumani	\N
956	338	60910200163	Davolash ishi-Hazorasp tumani	\N
957	338	60910200031	Davolash ishi-Nukus shahri	\N
958	338	60910200065	Davolash ishi-Pitnak shahri	\N
959	338	60910200160	Davolash ishi-Qo'shko'pir tumani	\N
960	338	60910200161	Davolash ishi-Shovot tumani	\N
961	338	60910200302	Davolash ishi-Tuproqqal'a massivi	\N
962	338	60910200261	Davolash ishi-Tuproqqal'a tumani	\N
963	338	60910200045	Davolash ishi-Urganch shahri	\N
964	338	60910200162	Davolash ishi-Urganch tumani	\N
965	338	60910200046	Davolash ishi-Xiva shahri	\N
966	338	60910200164	Davolash ishi-Xiva tumani	\N
967	338	60910200165	Davolash ishi-Xonqa tumani	\N
968	338	60910200166	Davolash ishi-Yangiariq tumani	\N
969	338	60910200167	Davolash ishi-Yangibozor tumani	\N
970	338	60910700	Farmatsiya (turlari bo‘yicha)	\N
971	338	60911200	Oliy hamshiralik ishi	\N
972	338	60910300	Pediatriya ishi	\N
973	338	60910300196	Pediatriya ishi-Baxmal tumani	\N
974	338	60910300157	Pediatriya ishi-Bog'ot tumani	\N
975	338	60910300197	Pediatriya ishi-Do'stlik tumani	\N
976	338	60910300199	Pediatriya ishi-G'allaorol tumani	\N
977	338	60910300158	Pediatriya ishi-Gurlan tumani	\N
978	338	60910300163	Pediatriya ishi-Hazorasp tumani	\N
979	338	60910300050	Pediatriya ishi-Jizzax shahri	\N
980	338	60910300243	Pediatriya ishi-O'rtachirchiq tumani	\N
981	338	60910300202	Pediatriya ishi-Paxtakor tumani	\N
982	338	60910300160	Pediatriya ishi-Qo'shko'pir tumani	\N
983	338	60910300200	Pediatriya ishi-Sharof Rashidov tumani	\N
984	338	60910300161	Pediatriya ishi-Shovot tumani	\N
985	338	60910300045	Pediatriya ishi-Urganch shahri	\N
986	338	60910300162	Pediatriya ishi-Urganch tumani	\N
987	338	60910300166	Pediatriya ishi-Yangiariq tumani	\N
988	338	60910300167	Pediatriya ishi-Yangibozor tumani	\N
989	338	60910300250	Pediatriya ishi-Yuqorichirchiq tumani	\N
990	338	60910300204	Pediatriya ishi-Zafarobod tumani	\N
991	338	60910300205	Pediatriya ishi-Zarbdor tumani	\N
992	338	60910300206	Pediatriya ishi-Zomin tumani	\N
993	338	60910100	Stomatologiya (yo‘nalishlar bo‘yicha) 	\N
994	338	60910400	Tibbiy profilaktika ishi	\N
995	338	60910400182	Tibbiy profilaktika ishi-Chiroqchi tumani	\N
996	338	60910400171	Tibbiy profilaktika ishi-Denov tumani	\N
997	338	60910400163	Tibbiy profilaktika ishi-Hazorasp tumani	\N
998	338	60910400185	Tibbiy profilaktika ishi-Kasbi tumani	\N
999	338	60910400263	Tibbiy profilaktika ishi-Kukdala tumani	\N
1000	338	60910400173	Tibbiy profilaktika ishi-Muzrabot tumani	\N
1001	338	60910400174	Tibbiy profilaktika ishi-Oltinsoy tumani	\N
1002	338	60910400175	Tibbiy profilaktika ishi-Qiziriq tumani	\N
1003	338	60910400253	Tibbiy profilaktika ishi-Shahrisabz shahri	\N
1004	338	60910400193	Tibbiy profilaktika ishi-Shahrisabz tumani	\N
1005	338	60910400161	Tibbiy profilaktika ishi-Shovot tumani	\N
1006	338	60910400261	Tibbiy profilaktika ishi-Tuproqqal'a tumani	\N
1007	338	60910400046	Tibbiy profilaktika ishi-Xiva shahri	\N
1008	338	60910400164	Tibbiy profilaktika ishi-Xiva tumani	\N
1009	338	60910400194	Tibbiy profilaktika ishi-Yakkabog' tumani	\N
1010	340	60230700	Amaliy filologiya	\N
1011	340	60540200	Amaliy matematika	\N
1012	340	60220400	Arxeologiya	\N
1013	340	60510102	Biologiya (turlari bo‘yicha)	\N
1014	340	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
1015	340	60210409	Dizayn: (milliy kostyum)	\N
1016	340	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
1017	340	60230103	Filologiya va tillarni o‘qitish: fransuz tili	\N
1018	340	60230101	Filologiya va tillarni o‘qitish: ingliz tili	\N
1019	340	60230104	Filologiya va tillarni o‘qitish: o‘zbek tili	\N
1020	340	60230107	Filologiya va tillarni o‘qitish: rus tili	\N
1021	340	60230106	Filologiya va tillarni o‘qitish: tojik tili	\N
1022	340	60530901	Fizika	\N
1023	340	60530901301	Fizika-Bobotog' hududi	\N
1024	340	60530901171	Fizika-Denov tumani	\N
1025	340	60530901173	Fizika-Muzrabot tumani	\N
1026	340	60530901174	Fizika-Oltinsoy tumani	\N
1027	340	60530901178	Fizika-Sherobod tumani	\N
1028	340	60530901179	Fizika-Sho'rchi tumani	\N
1029	340	60530901181	Fizika-Uzun tumani	\N
1030	340	60530400	Geografiya	\N
1031	340	61010505	Gid hamrohligi va tarjimonlik faoliyati: ingliz tili	\N
1032	340	60411400	Inson resurslarini boshqarish	\N
1033	340	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
1034	340	60530100	Kimyo (turlari bo‘yicha)	\N
1035	340	60530100301	Kimyo (turlari bo‘yicha)-Bobotog' hududi	\N
1036	340	60530100171	Kimyo (turlari bo‘yicha)-Denov tumani	\N
1037	340	60530100174	Kimyo (turlari bo‘yicha)-Oltinsoy tumani	\N
1038	340	60530100176	Kimyo (turlari bo‘yicha)-Qumqo'rg'on tumani	\N
1039	340	60530100177	Kimyo (turlari bo‘yicha)-Sariosiyo tumani	\N
1040	340	60530100178	Kimyo (turlari bo‘yicha)-Sherobod tumani	\N
1041	340	60530100181	Kimyo (turlari bo‘yicha)-Uzun tumani	\N
1042	340	60610100	Kompyuter ilmlari va dasturlash texnologiyalari (yo‘nalishlar bo‘yicha)	\N
1043	340	60320400	Kutubxona-axborot faoliyati (faoliyat turlari bo‘yicha)	\N
1044	340	60723000	Mahsulotlarning kimyoviy tahlili (oziq-ovqat mahsulotlari)	\N
1045	340	60540100	Matematika	\N
1046	340	60540100301	Matematika-Bobotog' hududi	\N
1047	340	60540100170	Matematika-Boysun tumani	\N
1048	340	60540100171	Matematika-Denov tumani	\N
1049	340	60540100173	Matematika-Muzrabot tumani	\N
1050	340	60540100174	Matematika-Oltinsoy tumani	\N
1051	340	60540100177	Matematika-Sariosiyo tumani	\N
1052	340	60540100181	Matematika-Uzun tumani	\N
1053	340	60720601	Materialshunoslik va yangi materiallar texnologiyasi (tarmoqlar bo‘yicha)	\N
1054	340	61010100	Mehmonxona xo‘jaligini tashkil etish va boshqarish	\N
1055	340	60410400	Moliya va moliyaviy texnologiyalar	\N
1056	340	60530200	Neft va gaz kimyosi	\N
1057	340	60112419	Professional ta'lim: axborot tizimlari va texnologiyalari	\N
1058	340	60112410	Professional ta'lim: qishloq xo‘jalik mahsulotlarini saqlash va dastlabki ishlash texnologiyasi	\N
1059	340	60112413	Professional ta’lim: qishloq xo‘jaligini mexanizatsiyalashtirish	\N
1060	340	60310901	Psixologiya: amaliy psixologiya	\N
1061	340	61010342	Sport faoliyati: kurash	\N
1062	340	60530300	Tabiiy va fiziologik faol birikmalar kimyosi	\N
1063	340	60220307	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)	\N
1064	340	60230203	Tarjima nazariyasi va amaliyoti: ingliz tili	\N
1065	340	60530700	Tuproqshunoslik	\N
1066	340	61010401	Turizm (faoliyat yo‘nalishlari bo‘yicha )	\N
1067	340	60721203	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi (milliy tikuv buyumlari)	\N
1068	340	60420107	Yurisprudensiya (faoliyat turlari bo‘yicha)	\N
1069	341	60810901	Agronomiya (sabzavotchilik va polizchilik)	\N
1070	341	60230700	Amaliy filologiya	\N
1071	341	60540200	Amaliy matematika	\N
1072	341	60730102	Arxitektura (turlari bo‘yicha)	\N
1073	341	60712400	Avtomobilsozlik va traktorsozlik	\N
1074	341	60510102	Biologiya (turlari bo‘yicha)	\N
1075	341	60710200	Biotexnologiya (tarmoqlar bo‘yicha)	\N
1076	341	60110500	Boshlang‘ich ta’lim	\N
1077	341	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
1078	341	60812100	Dorivor o‘simliklarni yetishtirish va qayta ishlash texnologiyasi	\N
1079	341	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
1080	341	60710602	Elektr energetikasi (tarmoqlar va yo‘nalishlar bo‘yicha)	\N
1081	341	60710702	Elektr texnikasi, elektr mexanikasi va elektr texnologiyalari (tarmoqlar bo‘yicha)	\N
1082	341	60230103	Filologiya va tillarni o‘qitish: fransuz tili	\N
1083	341	60230101	Filologiya va tillarni o‘qitish: ingliz tili	\N
1084	341	60230119	Filologiya va tillarni o‘qitish: nemis tili	\N
1085	341	60230104	Filologiya va tillarni o‘qitish: o‘zbek tili	\N
1086	341	60230107	Filologiya va tillarni o‘qitish: rus tili	\N
1087	341	60530901	Fizika	\N
1088	341	60722500	Geodeziya, kartografiya va kadastr (funksiyalari bo‘yicha)	\N
1089	341	60530400	Geografiya	\N
1090	341	61010505	Gid hamrohligi va tarjimonlik faoliyati: ingliz tili	\N
1091	341	60920101	Ijtimoiy ish (fuqarolarning o‘z-o‘zini boshqarish organlari)	\N
1092	341	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
1093	341	60812000	Issiqxona xo‘jaligini tashkil etish va yuritish	\N
1094	341	60112200	Jismoniy madaniyat	\N
1095	341	60530100	Kimyo (turlari bo‘yicha)	\N
1096	341	60710101	Kimyoviy texnologiya (ishlab chiqarish turlari bo‘yicha)	\N
1097	341	60610100	Kompyuter ilmlari va dasturlash texnologiyalari (yo‘nalishlar bo‘yicha)	\N
1098	341	60212200	Madaniy meros obyektlarini asrash 	\N
1099	341	60110200	Maktabgacha ta’lim	\N
1100	341	60412505	Marketing (tarmoqlar va sohalar bo‘yicha)	\N
1101	341	60540302	Matematik injiniring (ishlab chiqarish sohalari bo‘yicha)	\N
1102	341	60540100	Matematika	\N
1103	341	61010100	Mehmonxona xo‘jaligini tashkil etish va boshqarish	\N
1104	341	60411209	Menejment: madaniy merosni boshqarish	\N
1105	341	60411203	Menejment: turizm biznesini boshqarish	\N
1106	341	60811800	Mevachilik va uzumchilik	\N
1107	341	60531000	Mexanika va matematik modellashtirish	\N
1108	341	60112100	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi	\N
1110	341	60811001	O‘simliklarni himoya qilish (ekin turlari bo‘yicha)	\N
1111	341	60111400	O‘zbek tili va adabiyoti	\N
1112	341	60111701	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)	\N
1113	341	60720100	Oziq-ovqat texnologiyasi (mahsulot turlari bo‘yicha)	\N
1114	341	60110100	Pedagogika	\N
1115	341	60310901	Psixologiya: amaliy psixologiya	\N
1116	341	60811301	Qishloq xo‘jalik mahsulotlarini saqlash va dastlabki ishlash texnologiyasi (mahsulotlar turlari bo‘yicha)	\N
1117	341	60730305	Qurilish muhandisligi: bino va inshootlar qurilishi	\N
1118	341	60730303	Qurilish muhandisligi: qurilish materiallari, buyumlari va konstruksiyalarini ishlab chiqarish	\N
1119	341	60310502	Raqamli iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
1120	341	60811900	Sabzavotchilik, polizchilik va kartoshkachilik	\N
1121	341	60730200	Shahar qurilishi hamda kommunal infratuzilmani tashkil etish va boshqarish	\N
1122	341	61010324	Sport faoliyati (xotin-qizlar sporti yo‘nalishi bo‘yicha)	\N
1123	341	61010304	Sport faoliyati: futbol	\N
1124	341	61010342	Sport faoliyati: kurash	\N
1125	341	60220307	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)	\N
1126	341	60230203	Tarjima nazariyasi va amaliyoti: ingliz tili	\N
1127	341	60111200	Tasviriy san'at va muhandislik grafikasi  	\N
1128	341	60112300	Texnologik ta’lim	\N
1129	341	60712503	Transport vositalari muhandisligi (turlari bo‘yicha)	\N
1130	341	60530700	Tuproqshunoslik	\N
1131	341	61010401	Turizm (faoliyat yo‘nalishlari bo‘yicha )	\N
1132	341	60111804	Xorijiy til va adabiyoti: ingliz tili	\N
1133	341	60721204	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi (ishlab chiqarish turlari bo‘yicha)	\N
1134	341	60721400	Yengil sanoat texnologiyalari va jihozlari (ishlab chiqarish turlari bo‘yicha)	\N
1135	342	60810903	Agronomiya: anorchilik	\N
1136	342	60540200	Amaliy matematika	\N
1137	342	60220400	Arxeologiya	\N
1138	342	60320300	Arxivshunoslik	\N
1139	342	60610204	Axborot tizimlari va texnologiyalari (tarmoqlar va sohalar bo‘yicha)	\N
1140	342	60510102	Biologiya (turlari bo‘yicha)	\N
1141	342	60110500	Boshlang‘ich ta’lim	\N
1142	342	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
1143	342	60112000	Chaqiriqqacha harbiy ta’lim	\N
1144	342	60812100	Dorivor o‘simliklarni yetishtirish va qayta ishlash texnologiyasi	\N
1145	342	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
1146	342	60230101	Filologiya va tillarni o‘qitish: ingliz tili	\N
1147	342	60230104	Filologiya va tillarni o‘qitish: o‘zbek tili	\N
1148	342	60230107	Filologiya va tillarni o‘qitish: rus tili	\N
1149	342	60230106	Filologiya va tillarni o‘qitish: tojik tili	\N
1150	342	60530901	Fizika	\N
1151	342	60530400	Geografiya	\N
1152	342	61010505	Gid hamrohligi va tarjimonlik faoliyati: ingliz tili	\N
1153	342	60920101	Ijtimoiy ish (fuqarolarning o‘z-o‘zini boshqarish organlari)	\N
1154	342	60920103	Ijtimoiy ish: oila va bolalar bilan ishlash	\N
1155	342	60920103002	Ijtimoiy ish: oila va bolalar bilan ishlash-Andijon viloyati	\N
1156	342	60920103004	Ijtimoiy ish: oila va bolalar bilan ishlash-Farg‘ona viloyati	\N
1157	342	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
1158	342	60812000	Issiqxona xo‘jaligini tashkil etish va yuritish	\N
1159	342	60411900	Jahon iqtisodiyoti va xalqaro iqtisodiy munosabatlar (mintaqalar va faoliyat turlari bo‘yicha)	\N
1160	342	60112200	Jismoniy madaniyat	\N
1161	342	60112201	Jismoniy madaniyat (xotin-qizlar sporti yo‘nalishi bo‘yicha)	\N
1162	342	60530100	Kimyo (turlari bo‘yicha)	\N
1163	342	60610100	Kompyuter ilmlari va dasturlash texnologiyalari (yo‘nalishlar bo‘yicha)	\N
1164	342	60110200	Maktabgacha ta’lim	\N
1165	342	60111900	Maktabgacha va boshlang‘ich ta'limda jismoniy tarbiya va sport	\N
1166	342	60540100	Matematika	\N
1167	342	60112702	Maxsus pedagogika : logopediya	\N
1168	342	61010100	Mehmonxona xo‘jaligini tashkil etish va boshqarish	\N
1169	342	60811800	Mevachilik va uzumchilik	\N
1170	342	60112100	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi	\N
1171	342	60310300	Mintaqaviy iqtisodiyot	\N
1172	342	60410400	Moliya va moliyaviy texnologiyalar	\N
1173	342	60111300	Musiqa ta'limi	\N
1174	342	60111701	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)	\N
1175	342	60110100	Pedagogika	\N
1176	342	60310901	Psixologiya: amaliy psixologiya	\N
1177	342	60811900	Sabzavotchilik, polizchilik va kartoshkachilik	\N
1178	342	60311000	Sotsiologiya	\N
1179	342	61010304	Sport faoliyati: futbol	\N
1180	342	61010342	Sport faoliyati: kurash	\N
1181	342	60410600	Sug‘urta ishi	\N
1182	342	60220307	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)	\N
1183	342	60111200	Tasviriy san'at va muhandislik grafikasi  	\N
1184	342	60112300	Texnologik ta’lim	\N
1185	342	60530700	Tuproqshunoslik	\N
1186	342	60111801	Xorijiy til va adabiyoti: fransuz tili	\N
1187	342	60111804	Xorijiy til va adabiyoti: ingliz tili	\N
1188	342	60111803	Xorijiy til va adabiyoti: nemis tili	\N
1189	342	60420107	Yurisprudensiya (faoliyat turlari bo‘yicha)	\N
1190	342	60811503	Zooinjeneriya: asalarichilik	\N
1191	343	60730102	Arxitektura (turlari bo‘yicha)	\N
1192	343	60610204	Axborot tizimlari va texnologiyalari (tarmoqlar va sohalar bo‘yicha)	\N
1193	343	60410500	Bank ishi va auditi	\N
1194	343	60711800	Biotibbiyot muhandisligi	\N
1195	343	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
1196	343	60710602	Elektr energetikasi (tarmoqlar va yo‘nalishlar bo‘yicha)	\N
1197	343	60710702	Elektr texnikasi, elektr mexanikasi va elektr texnologiyalari (tarmoqlar bo‘yicha)	\N
1198	343	60712000	Elektron apparaturalar ishlab chiqarish texnologiyasi	\N
1199	343	60711200	Elektronika va asbobsozlik (tarmoqlar bo‘yicha)	\N
1200	343	60710500	Energetika (tarmoqlar bo‘yicha)	\N
1201	343	60710900	Energiya tejamkorligi va energoaudit	\N
1202	343	60720500	Funksional ovqatlanish va bolalar mahsulotlari texnologiyasi	\N
1203	343	60722500	Geodeziya, kartografiya va kadastr (funksiyalari bo‘yicha)	\N
1204	343	60711602	Intellektual muhandislik tizimlari (tarmoqlar va sohalar bo‘yicha)	\N
1205	343	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
1206	343	60710101	Kimyoviy texnologiya (ishlab chiqarish turlari bo‘yicha)	\N
1207	343	60720800	Mashinasozlik texnologiyasi, mashinasozlik ishlab chiqarishini jihozlash va avtomatlashtirish	\N
1208	343	60720603	Materialshunoslik va yangi materiallar texnologiyasi (qurilish) 	\N
1209	343	60720604	Materialshunoslik va yangi materiallar texnologiyasi: mashinasozlik	\N
1210	343	61020201	Mehnat muhofazasi va texnika xavfsizligi (tarmoqlar bo‘yicha)	\N
1211	343	60411212	Menejment (tarmoqlar va sohalar bo‘yicha)	\N
1212	343	60711303	Metrologiya, standartlashtirish va mahsulot sifati menejmenti (tarmoqlar bo‘yicha)	\N
1213	343	60711500	Mexatronika va robototexnika	\N
1214	343	60410400	Moliya va moliyaviy texnologiyalar	\N
1215	343	60730402	Muhandislik kommunikatsiyalari qurilishi va montaji (turlari bo‘yicha)	\N
1216	343	60711001	Muqobil energiya manbalari (turlari bo‘yicha)	\N
1217	343	60721100	Neft va neft-gazni qayta ishlash texnologiyasi	\N
1218	343	60720100	Oziq-ovqat texnologiyasi (mahsulot turlari bo‘yicha)	\N
1219	343	60112417	Professional ta'lim: elektr texnikasi, elektr mexanikasi va elektr texnologiyalari	\N
1220	343	60810100	Qishloq xo‘jaligini mexanizatsiyalashtirish	\N
1221	343	60811301	Qishloq xo‘jalik mahsulotlarini saqlash va dastlabki ishlash texnologiyasi (mahsulotlar turlari bo‘yicha)	\N
1222	343	60730305	Qurilish muhandisligi: bino va inshootlar qurilishi	\N
1223	343	60730303	Qurilish muhandisligi: qurilish materiallari, buyumlari va konstruksiyalarini ishlab chiqarish	\N
1224	343	60310502	Raqamli iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
1225	343	60610700	Sun’iy intellekt 	\N
1226	343	60721300	Tabiiy tolalarni dastlabki ishlash texnologiyasi (xomashyo va jarayon turlari bo‘yicha)	\N
1227	343	60611001	Telekommunikatsiya texnologiyalari (“Telekommunikatsiyalar”)	\N
1228	343	60711402	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (tarmoqlar bo‘yicha)	\N
1229	343	60711900	Texnologik jarayonlarni boshqarishning axborot-kommunikatsiya tizimlari	\N
1230	343	60720703	Texnologik mashinalar va jihozlar (elektronika sanoati)	\N
1231	343	60720701	Texnologik mashinalar va jihozlar (tarmoqlar bo‘yicha)	\N
1232	343	61040101	Transport logistikasi (transport turlari bo‘yicha)	\N
1233	343	60712503	Transport vositalari muhandisligi (turlari bo‘yicha)	\N
1234	343	60721201	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi (charm buyumlari texnologiyasi)	\N
1235	343	60721211	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: tikuv buyumlari texnologiyasi	\N
1236	343	60721400	Yengil sanoat texnologiyalari va jihozlari (ishlab chiqarish turlari bo‘yicha)	\N
1237	343	61040300	Yo‘l harakatini tashkil etish	\N
1238	344	60711800	Biotibbiyot muhandisligi	\N
1239	344	60910200	Davolash ishi	\N
1240	344	60910200130	Davolash ishi-Beshariq tumani	\N
1241	344	60910200131	Davolash ishi-Bog'dod tumani	\N
1242	344	60910200132	Davolash ishi-Buvayda tumani	\N
1243	344	60910200133	Davolash ishi-Dang'ara tumani	\N
1244	344	60910200039	Davolash ishi-Farg'ona shahri	\N
1245	344	60910200134	Davolash ishi-Farg'ona tumani	\N
1246	344	60910200135	Davolash ishi-Furqat tumani	\N
1247	344	60910200040	Davolash ishi-Marg'ilon shahri	\N
1248	344	60910200139	Davolash ishi-O'zbekiston tumani	\N
1249	344	60910200137	Davolash ishi-Oltiariq tumani	\N
1250	344	60910200041	Davolash ishi-Qo'qon shahri	\N
1251	344	60910200252	Davolash ishi-Qo'shtepa tumani	\N
1252	344	60910200140	Davolash ishi-Quva tumani	\N
1253	344	60910200042	Davolash ishi-Quvasoy shahri	\N
1254	344	60910200141	Davolash ishi-Rishton tumani	\N
1255	344	60910200142	Davolash ishi-So'x tumani	\N
1256	344	60910200143	Davolash ishi-Toshloq tumani	\N
1257	344	60910200144	Davolash ishi-Uchko'prik tumani	\N
1258	344	60910200145	Davolash ishi-Yozyovon tumani	\N
1259	344	60910700	Farmatsiya (turlari bo‘yicha)	\N
1260	344	60911200	Oliy hamshiralik ishi	\N
1261	344	60910300	Pediatriya ishi	\N
1262	344	60910300130	Pediatriya ishi-Beshariq tumani	\N
1263	344	60910300131	Pediatriya ishi-Bog'dod tumani	\N
1264	344	60910300132	Pediatriya ishi-Buvayda tumani	\N
1265	344	60910300133	Pediatriya ishi-Dang'ara tumani	\N
1266	344	60910300039	Pediatriya ishi-Farg'ona shahri	\N
1267	344	60910300134	Pediatriya ishi-Farg'ona tumani	\N
1268	344	60910300135	Pediatriya ishi-Furqat tumani	\N
1269	344	60910300040	Pediatriya ishi-Marg'ilon shahri	\N
1270	344	60910300139	Pediatriya ishi-O'zbekiston tumani	\N
1271	344	60910300137	Pediatriya ishi-Oltiariq tumani	\N
1272	344	60910300041	Pediatriya ishi-Qo'qon shahri	\N
1273	344	60910300252	Pediatriya ishi-Qo'shtepa tumani	\N
1274	344	60910300140	Pediatriya ishi-Quva tumani	\N
1275	344	60910300042	Pediatriya ishi-Quvasoy shahri	\N
1276	344	60910300141	Pediatriya ishi-Rishton tumani	\N
1277	344	60910300142	Pediatriya ishi-So'x tumani	\N
1278	344	60910300143	Pediatriya ishi-Toshloq tumani	\N
1279	344	60910300144	Pediatriya ishi-Uchko'prik tumani	\N
1280	344	60910300145	Pediatriya ishi-Yozyovon tumani	\N
1281	344	60910100	Stomatologiya (yo‘nalishlar bo‘yicha) 	\N
1282	344	60910400	Tibbiy profilaktika ishi	\N
1283	344	60910400130	Tibbiy profilaktika ishi-Beshariq tumani	\N
1284	344	60910400131	Tibbiy profilaktika ishi-Bog'dod tumani	\N
1285	344	60910400132	Tibbiy profilaktika ishi-Buvayda tumani	\N
1286	344	60910400133	Tibbiy profilaktika ishi-Dang'ara tumani	\N
1287	344	60910400039	Tibbiy profilaktika ishi-Farg'ona shahri	\N
1288	344	60910400134	Tibbiy profilaktika ishi-Farg'ona tumani	\N
1289	344	60910400135	Tibbiy profilaktika ishi-Furqat tumani	\N
1290	344	60910400040	Tibbiy profilaktika ishi-Marg'ilon shahri	\N
1291	344	60910400139	Tibbiy profilaktika ishi-O'zbekiston tumani	\N
1292	344	60910400137	Tibbiy profilaktika ishi-Oltiariq tumani	\N
1293	344	60910400041	Tibbiy profilaktika ishi-Qo'qon shahri	\N
1294	344	60910400252	Tibbiy profilaktika ishi-Qo'shtepa tumani	\N
1295	344	60910400140	Tibbiy profilaktika ishi-Quva tumani	\N
1296	344	60910400042	Tibbiy profilaktika ishi-Quvasoy shahri	\N
1297	344	60910400141	Tibbiy profilaktika ishi-Rishton tumani	\N
1298	344	60910400142	Tibbiy profilaktika ishi-So'x tumani	\N
1299	344	60910400143	Tibbiy profilaktika ishi-Toshloq tumani	\N
1300	344	60910400144	Tibbiy profilaktika ishi-Uchko'prik tumani	\N
1301	344	60910400145	Tibbiy profilaktika ishi-Yozyovon tumani	\N
1302	344	60911100	Xalq tabobati 	\N
1303	345	60810700	Agrokimyo va agrotuproqshunoslik	\N
1304	345	60230700	Amaliy filologiya	\N
1305	345	60540200	Amaliy matematika	\N
1306	345	60540200182	Amaliy matematika-Chiroqchi tumani	\N
1307	345	60540200183	Amaliy matematika-Dehqonobod tumani	\N
1308	345	60540200185	Amaliy matematika-Kasbi tumani	\N
1309	345	60540200186	Amaliy matematika-Kitob tumani	\N
1310	345	60540200188	Amaliy matematika-Mirishkor tumani	\N
1311	345	60540200190	Amaliy matematika-Nishon tumani	\N
1312	345	60540200194	Amaliy matematika-Yakkabog' tumani	\N
1313	345	60510102	Biologiya (turlari bo‘yicha)	\N
1314	345	60510102194	Biologiya (turlari bo‘yicha)-Yakkabog' tumani	\N
1315	345	60710200	Biotexnologiya (tarmoqlar bo‘yicha)	\N
1316	345	60910200	Davolash ishi	\N
1317	345	60910200182	Davolash ishi-Chiroqchi tumani	\N
1318	345	60910200183	Davolash ishi-Dehqonobod tumani	\N
1319	345	60910200184	Davolash ishi-G'uzor tumani	\N
1320	345	60910200185	Davolash ishi-Kasbi tumani	\N
1321	345	60910200186	Davolash ishi-Kitob tumani	\N
1322	345	60910200187	Davolash ishi-Koson tumani	\N
1323	345	60910200188	Davolash ishi-Mirishkor tumani	\N
1324	345	60910200191	Davolash ishi-Qamashi tumani	\N
1325	345	60910200192	Davolash ishi-Qarshi tumani	\N
1326	345	60210405	Dizayn: libos va gazlamalar	\N
1327	345	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
1328	345	60230103	Filologiya va tillarni o‘qitish: fransuz tili	\N
1329	345	60230101	Filologiya va tillarni o‘qitish: ingliz tili	\N
1330	345	60230101183	Filologiya va tillarni o‘qitish: ingliz tili-Dehqonobod tumani	\N
1331	345	60230101185	Filologiya va tillarni o‘qitish: ingliz tili-Kasbi tumani	\N
1332	345	60230101187	Filologiya va tillarni o‘qitish: ingliz tili-Koson tumani	\N
1333	345	60230101188	Filologiya va tillarni o‘qitish: ingliz tili-Mirishkor tumani	\N
1334	345	60230101190	Filologiya va tillarni o‘qitish: ingliz tili-Nishon tumani	\N
1335	345	60230119	Filologiya va tillarni o‘qitish: nemis tili	\N
1336	345	60230104	Filologiya va tillarni o‘qitish: o‘zbek tili	\N
1337	345	60230104182	Filologiya va tillarni o‘qitish: o‘zbek tili-Chiroqchi tumani	\N
1338	345	60230104183	Filologiya va tillarni o‘qitish: o‘zbek tili-Dehqonobod tumani	\N
1339	345	60230104186	Filologiya va tillarni o‘qitish: o‘zbek tili-Kitob tumani	\N
1340	345	60230104188	Filologiya va tillarni o‘qitish: o‘zbek tili-Mirishkor tumani	\N
1341	345	60230104190	Filologiya va tillarni o‘qitish: o‘zbek tili-Nishon tumani	\N
1342	345	60230104193	Filologiya va tillarni o‘qitish: o‘zbek tili-Shahrisabz tumani	\N
1343	345	60230104194	Filologiya va tillarni o‘qitish: o‘zbek tili-Yakkabog' tumani	\N
1344	345	60230107	Filologiya va tillarni o‘qitish: rus tili	\N
1345	345	60230107182	Filologiya va tillarni o‘qitish: rus tili-Chiroqchi tumani	\N
1346	345	60230107183	Filologiya va tillarni o‘qitish: rus tili-Dehqonobod tumani	\N
1347	345	60230107185	Filologiya va tillarni o‘qitish: rus tili-Kasbi tumani	\N
1348	345	60230107187	Filologiya va tillarni o‘qitish: rus tili-Koson tumani	\N
1349	345	60230107188	Filologiya va tillarni o‘qitish: rus tili-Mirishkor tumani	\N
1350	345	60230107190	Filologiya va tillarni o‘qitish: rus tili-Nishon tumani	\N
1351	345	60530901	Fizika	\N
1352	345	60530901185	Fizika-Kasbi tumani	\N
1353	345	60530901190	Fizika-Nishon tumani	\N
1354	345	60530901193	Fizika-Shahrisabz tumani	\N
1355	345	60530901194	Fizika-Yakkabog' tumani	\N
1356	345	60230900	Folklorshunoslik va shevashunoslik	\N
1357	345	60530400	Geografiya	\N
1358	345	60530400185	Geografiya-Kasbi tumani	\N
1359	345	60530400194	Geografiya-Yakkabog' tumani	\N
1360	345	60411400	Inson resurslarini boshqarish	\N
1361	345	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
1362	345	60812000	Issiqxona xo‘jaligini tashkil etish va yuritish	\N
1363	345	60530100	Kimyo (turlari bo‘yicha)	\N
1364	345	60530100186	Kimyo (turlari bo‘yicha)-Kitob tumani	\N
1365	345	60530100193	Kimyo (turlari bo‘yicha)-Shahrisabz tumani	\N
1366	345	60530100194	Kimyo (turlari bo‘yicha)-Yakkabog' tumani	\N
1367	345	60610100	Kompyuter ilmlari va dasturlash texnologiyalari (yo‘nalishlar bo‘yicha)	\N
1368	345	60610100182	Kompyuter ilmlari va dasturlash texnologiyalari (yo‘nalishlar bo‘yicha)-Chiroqchi tumani	\N
1369	345	60610100194	Kompyuter ilmlari va dasturlash texnologiyalari (yo‘nalishlar bo‘yicha)-Yakkabog' tumani	\N
1370	345	60320400	Kutubxona-axborot faoliyati (faoliyat turlari bo‘yicha)	\N
1371	345	60412505	Marketing (tarmoqlar va sohalar bo‘yicha)	\N
1373	345	60540100182	Matematika-Chiroqchi tumani	\N
1374	345	60540100185	Matematika-Kasbi tumani	\N
1375	345	60540100188	Matematika-Mirishkor tumani	\N
1376	345	60540100190	Matematika-Nishon tumani	\N
1377	345	60540100194	Matematika-Yakkabog' tumani	\N
1378	345	61010100	Mehmonxona xo‘jaligini tashkil etish va boshqarish	\N
1379	345	61020201	Mehnat muhofazasi va texnika xavfsizligi (tarmoqlar bo‘yicha)	\N
1380	345	60811800	Mevachilik va uzumchilik	\N
1381	345	60711001	Muqobil energiya manbalari (turlari bo‘yicha)	\N
1382	345	60910300	Pediatriya ishi	\N
1383	345	60910300182	Pediatriya ishi-Chiroqchi tumani	\N
1384	345	60910300183	Pediatriya ishi-Dehqonobod tumani	\N
1385	345	60910300184	Pediatriya ishi-G'uzor tumani	\N
1386	345	60910300185	Pediatriya ishi-Kasbi tumani	\N
1387	345	60910300186	Pediatriya ishi-Kitob tumani	\N
1388	345	60910300187	Pediatriya ishi-Koson tumani	\N
1389	345	60910300188	Pediatriya ishi-Mirishkor tumani	\N
1390	345	60910300191	Pediatriya ishi-Qamashi tumani	\N
1391	345	60910300192	Pediatriya ishi-Qarshi tumani	\N
1392	345	60310901	Psixologiya: amaliy psixologiya	\N
1393	345	60811900	Sabzavotchilik, polizchilik va kartoshkachilik	\N
1394	345	60412600	Savdo ishi (turlari bo‘yicha)	\N
1395	345	61010348	Sport faoliyati: dzyudo	\N
1396	345	61010304	Sport faoliyati: futbol	\N
1397	345	61010342	Sport faoliyati: kurash	\N
1398	345	61010332	Sport faoliyati: voleybol	\N
1399	345	61010347	Sport faoliyati: yengil atletika	\N
1400	345	60220307	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)	\N
1401	345	60220307186	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)-Kitob tumani	\N
1402	345	60220307193	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)-Shahrisabz tumani	\N
1403	345	60220307194	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)-Yakkabog' tumani	\N
1404	345	61040101	Transport logistikasi (transport turlari bo‘yicha)	\N
1405	345	61010401	Turizm (faoliyat yo‘nalishlari bo‘yicha )	\N
1406	345	60721204	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi (ishlab chiqarish turlari bo‘yicha)	\N
1407	346	60540200	Amaliy matematika	\N
1408	346	60210802	Amaliy san'at: badiiy kulolchilik	\N
1409	346	60220400	Arxeologiya	\N
1410	346	60730102	Arxitektura (turlari bo‘yicha)	\N
1411	346	60320200	Axborot xizmati va jamoatchilik bilan aloqalar	\N
1412	346	60510102	Biologiya (turlari bo‘yicha)	\N
1413	346	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
1414	346	60210411	Dizayn: landshaft dizayni	\N
1415	346	60812100	Dorivor o‘simliklarni yetishtirish va qayta ishlash texnologiyasi	\N
1416	346	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
1417	346	60310200	Ekonometrika	\N
1418	346	60710602	Elektr energetikasi (tarmoqlar va yo‘nalishlar bo‘yicha)	\N
1419	346	60710702	Elektr texnikasi, elektr mexanikasi va elektr texnologiyalari (tarmoqlar bo‘yicha)	\N
1420	346	60710500	Energetika (tarmoqlar bo‘yicha)	\N
1421	346	60220502	Falsafa (yo‘nalishlar bo‘yicha)	\N
1422	346	60230101	Filologiya va tillarni o‘qitish: ingliz tili	\N
1423	346	60230119	Filologiya va tillarni o‘qitish: nemis tili	\N
1424	346	60230104	Filologiya va tillarni o‘qitish: o‘zbek tili	\N
1425	346	60230123	Filologiya va tillarni o‘qitish: qoraqalpoq tili	\N
1426	346	60230110	Filologiya va tillarni o‘qitish: qozoq tili	\N
1427	346	60230107	Filologiya va tillarni o‘qitish: rus tili	\N
1428	346	60230105	Filologiya va tillarni o‘qitish: turkman tili	\N
1429	346	60530901	Fizika	\N
1430	346	60722500	Geodeziya, kartografiya va kadastr (funksiyalari bo‘yicha)	\N
1431	346	60530400	Geografiya	\N
1432	346	60530502	Geologiya (faoliyat sohasi bo‘yicha)	\N
1433	346	61010505	Gid hamrohligi va tarjimonlik faoliyati: ingliz tili	\N
1434	346	60520100	Gidrometeorologiya	\N
1435	346	60920101	Ijtimoiy ish (fuqarolarning o‘z-o‘zini boshqarish organlari)	\N
1436	346	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
1437	346	60112200	Jismoniy madaniyat	\N
1438	346	60112201	Jismoniy madaniyat (xotin-qizlar sporti yo‘nalishi bo‘yicha)	\N
1439	346	60320104	Jurnalistika: internet jurnalistika	\N
1440	346	60320110	Jurnalistika: sport jurnalistikasi	\N
1441	346	60320107	Jurnalistika: teleradio jurnalistikasi	\N
1442	346	60530100	Kimyo (turlari bo‘yicha)	\N
1443	346	60710101	Kimyoviy texnologiya (ishlab chiqarish turlari bo‘yicha)	\N
1444	346	60610100	Kompyuter ilmlari va dasturlash texnologiyalari (yo‘nalishlar bo‘yicha)	\N
1445	346	60212000	Madaniyat va san’at muassasalarini tashkil etish hamda boshqarish	\N
1446	346	60540100	Matematika	\N
1447	346	60411212	Menejment (tarmoqlar va sohalar bo‘yicha)	\N
1448	346	60711303	Metrologiya, standartlashtirish va mahsulot sifati menejmenti (tarmoqlar bo‘yicha)	\N
1449	346	60112100	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi	\N
1450	346	60410400	Moliya va moliyaviy texnologiyalar	\N
1451	346	60730402	Muhandislik kommunikatsiyalari qurilishi va montaji (turlari bo‘yicha)	\N
1452	346	60721800	Neft va gaz ishi (faoliyat turlari bo‘yicha)	\N
1453	346	60721100	Neft va neft-gazni qayta ishlash texnologiyasi	\N
1454	346	60230600	Noshirlik ishi	\N
1455	346	60720100	Oziq-ovqat texnologiyasi (mahsulot turlari bo‘yicha)	\N
1456	346	60310901	Psixologiya: amaliy psixologiya	\N
1457	346	60730305	Qurilish muhandisligi: bino va inshootlar qurilishi	\N
1458	346	60730302	Qurilish muhandisligi: devorbop va pardozbop qurilish materiallari texnologiyasi	\N
1459	346	60730303	Qurilish muhandisligi: qurilish materiallari, buyumlari va konstruksiyalarini ishlab chiqarish	\N
1460	346	60730200	Shahar qurilishi hamda kommunal infratuzilmani tashkil etish va boshqarish	\N
1462	346	61010304	Sport faoliyati: futbol	\N
1463	346	61010342	Sport faoliyati: kurash	\N
1464	346	60410800	Statistika (tarmoqlar va sohalar bo‘yicha)	\N
1465	346	60220307	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)	\N
1466	346	60230203	Tarjima nazariyasi va amaliyoti: ingliz tili	\N
1467	346	60720701	Texnologik mashinalar va jihozlar (tarmoqlar bo‘yicha)	\N
1468	346	61040102	Transport logistikasi (avtomobil transporti)	\N
1469	346	60530700	Tuproqshunoslik	\N
1470	346	61010401	Turizm (faoliyat yo‘nalishlari bo‘yicha )	\N
1471	346	60111804	Xorijiy til va adabiyoti: ingliz tili	\N
1472	346	60721204	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi (ishlab chiqarish turlari bo‘yicha)	\N
1473	346	61040300	Yo‘l harakatini tashkil etish	\N
1474	346	60730804	Yo‘l muhandisligi (sohalar va faoliyat turlari bo‘yicha)	\N
1475	346	60420107	Yurisprudensiya (faoliyat turlari bo‘yicha)	\N
1476	347	60230113	Filologiya va tillarni o‘qitish: arab tili	\N
1477	347	60230103	Filologiya va tillarni o‘qitish: fransuz tili	\N
1478	347	60230101	Filologiya va tillarni o‘qitish: ingliz tili	\N
1479	347	60230112	Filologiya va tillarni o‘qitish: ispan tili	\N
1480	347	60230122	Filologiya va tillarni o‘qitish: italyan tili	\N
1481	347	60230108	Filologiya va tillarni o‘qitish: koreys tili	\N
1482	347	60230119	Filologiya va tillarni o‘qitish: nemis tili	\N
1483	347	60230107	Filologiya va tillarni o‘qitish: rus tili	\N
1484	347	60230102	Filologiya va tillarni o‘qitish: xitoy tili	\N
1485	347	60230117	Filologiya va tillarni o‘qitish: yapon tili	\N
1486	347	61010505	Gid hamrohligi va tarjimonlik faoliyati: ingliz tili	\N
1487	347	60320101	Jurnalistika: xalqaro jurnalistika	\N
1488	347	60230800	Kompyuter lingvistikasi 	\N
1489	347	60112600	Maktabgacha va boshlang‘ich ta’limda xorijiy til (ingliz tili)	\N
1490	347	60111400	O‘zbek tili va adabiyoti	\N
1491	347	60230203	Tarjima nazariyasi va amaliyoti: ingliz tili	\N
1492	347	60111804	Xorijiy til va adabiyoti: ingliz tili	\N
1493	347	60111804216	Xorijiy til va adabiyoti: ingliz tili-Ishtixon tumani	\N
1494	347	60111804218	Xorijiy til va adabiyoti: ingliz tili-Kattaqo'rg'on tumani	\N
1495	347	60111804219	Xorijiy til va adabiyoti: ingliz tili-Narpay tumani	\N
1496	347	60111804220	Xorijiy til va adabiyoti: ingliz tili-Nurobod tumani	\N
1497	347	60111804223	Xorijiy til va adabiyoti: ingliz tili-Paxtachi tumani	\N
1498	347	60111804224	Xorijiy til va adabiyoti: ingliz tili-Payariq tumani	\N
1499	347	60111804225	Xorijiy til va adabiyoti: ingliz tili-Qo'shrabot tumani	\N
1500	347	60111804228	Xorijiy til va adabiyoti: ingliz tili-Urgut tumani	\N
1501	348	60410500	Bank ishi va auditi	\N
1502	348	60510102	Biologiya (turlari bo‘yicha)	\N
1503	348	60411301	Biznesni boshqarish (tarmoqlar bo‘yicha)	\N
1504	348	60110500	Boshlang‘ich ta’lim	\N
1505	348	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
1506	348	60230104	Filologiya va tillarni o‘qitish: o‘zbek tili	\N
1507	348	60230104301	Filologiya va tillarni o‘qitish: o‘zbek tili-Bobotog' hududi	\N
1508	348	60230104171	Filologiya va tillarni o‘qitish: o‘zbek tili-Denov tumani	\N
1509	348	60230104174	Filologiya va tillarni o‘qitish: o‘zbek tili-Oltinsoy tumani	\N
1510	348	60230104181	Filologiya va tillarni o‘qitish: o‘zbek tili-Uzun tumani	\N
1511	348	60530901	Fizika	\N
1512	348	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
1513	348	60112200	Jismoniy madaniyat	\N
1514	348	60530100	Kimyo (turlari bo‘yicha)	\N
1515	348	60710101	Kimyoviy texnologiya (ishlab chiqarish turlari bo‘yicha)	\N
1516	348	60610503	"Kompyuter injiniringi (""Kompyuter injiniringi"", ""AT-servis"", ""Axborot xavfsizligi"", ""Multimedia texnologiyalari"")"	\N
1517	348	60110200	Maktabgacha ta’lim	\N
1518	348	60540100	Matematika	\N
1519	348	60110600	Matematika va informatika	\N
1520	348	60410400	Moliya va moliyaviy texnologiyalar	\N
1521	348	60111300	Musiqa ta'limi	\N
1522	348	60111701	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)	\N
1523	348	60111701171	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Denov tumani	\N
1524	348	60111701177	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Sariosiyo tumani	\N
1525	348	60111701181	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Uzun tumani	\N
1526	348	60110100	Pedagogika	\N
1527	348	60811301	Qishloq xo‘jalik mahsulotlarini saqlash va dastlabki ishlash texnologiyasi (mahsulotlar turlari bo‘yicha)	\N
1528	348	60730305	Qurilish muhandisligi: bino va inshootlar qurilishi	\N
1529	348	60220307	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)	\N
1530	348	61010401	Turizm (faoliyat yo‘nalishlari bo‘yicha )	\N
1531	348	60111804	Xorijiy til va adabiyoti: ingliz tili	\N
1532	348	60111804301	Xorijiy til va adabiyoti: ingliz tili-Bobotog' hududi	\N
1533	348	60111804171	Xorijiy til va adabiyoti: ingliz tili-Denov tumani	\N
1534	348	60111804177	Xorijiy til va adabiyoti: ingliz tili-Sariosiyo tumani	\N
1535	349	60910200	Davolash ishi	\N
1536	349	60910200092	Davolash ishi-Beruniy tumani	\N
1537	349	60910200093	Davolash ishi-Chimboy tumani	\N
1538	349	60910200094	Davolash ishi-Ellikqal'a tumani	\N
1539	349	60910200095	Davolash ishi-Kegeyli tumani	\N
1540	349	60910200096	Davolash ishi-Mo'ynoq tumani	\N
1541	349	60910200031	Davolash ishi-Nukus shahri	\N
1542	349	60910200097	Davolash ishi-Nukus tumani	\N
1543	349	60910200098	Davolash ishi-Qanliko'l tumani	\N
1544	349	60910200100	Davolash ishi-Qo'ng'irot tumani	\N
1545	349	60910200099	Davolash ishi-Qorao'zak tumani	\N
1546	349	60910200101	Davolash ishi-Shumanay tumani	\N
1547	349	60910200032	Davolash ishi-Taxiatosh tumani	\N
1548	349	60910200102	Davolash ishi-Taxtako'pir tumani	\N
1549	349	60910200103	Davolash ishi-To'rtko'l tumani	\N
1550	349	60910200104	Davolash ishi-Xo'jayli tumani	\N
1551	349	60910700	Farmatsiya (turlari bo‘yicha)	\N
1552	349	60911200	Oliy hamshiralik ishi	\N
1553	349	60910300	Pediatriya ishi	\N
1554	349	60910300091	Pediatriya ishi-Amudaryo tumani	\N
1555	349	60910300092	Pediatriya ishi-Beruniy tumani	\N
1556	349	60910300258	Pediatriya ishi-Bo‘zatov tumani	\N
1557	349	60910300093	Pediatriya ishi-Chimboy tumani	\N
1558	349	60910300094	Pediatriya ishi-Ellikqal'a tumani	\N
1559	349	60910300095	Pediatriya ishi-Kegeyli tumani	\N
1560	349	60910300096	Pediatriya ishi-Mo'ynoq tumani	\N
1561	349	60910300031	Pediatriya ishi-Nukus shahri	\N
1562	349	60910300097	Pediatriya ishi-Nukus tumani	\N
1563	349	60910300098	Pediatriya ishi-Qanliko'l tumani	\N
1564	349	60910300100	Pediatriya ishi-Qo'ng'irot tumani	\N
1565	349	60910300099	Pediatriya ishi-Qorao'zak tumani	\N
1566	349	60910300101	Pediatriya ishi-Shumanay tumani	\N
1567	349	60910300032	Pediatriya ishi-Taxiatosh tumani	\N
1568	349	60910300102	Pediatriya ishi-Taxtako'pir tumani	\N
1569	349	60910300103	Pediatriya ishi-To'rtko'l tumani	\N
1570	349	60910300104	Pediatriya ishi-Xo'jayli tumani	\N
1571	349	60910100	Stomatologiya (yo‘nalishlar bo‘yicha) 	\N
1572	349	60910600	Tibbiy-biologik ish	\N
1573	349	60910600092	Tibbiy-biologik ish-Beruniy tumani	\N
1574	349	60910600258	Tibbiy-biologik ish-Bo‘zatov tumani	\N
1575	349	60910600094	Tibbiy-biologik ish-Ellikqal'a tumani	\N
1576	349	60910600096	Tibbiy-biologik ish-Mo'ynoq tumani	\N
1577	349	60910600031	Tibbiy-biologik ish-Nukus shahri	\N
1578	349	60910600099	Tibbiy-biologik ish-Qorao'zak tumani	\N
1579	349	60910600101	Tibbiy-biologik ish-Shumanay tumani	\N
1580	349	60910600103	Tibbiy-biologik ish-To'rtko'l tumani	\N
1581	349	60910600104	Tibbiy-biologik ish-Xo'jayli tumani	\N
1582	349	60910400	Tibbiy profilaktika ishi	\N
1583	349	60910400258	Tibbiy profilaktika ishi-Bo‘zatov tumani	\N
1584	349	60910400102	Tibbiy profilaktika ishi-Taxtako'pir tumani	\N
1585	349	60911100	Xalq tabobati 	\N
1586	350	60310700	Siyosatshunoslik	\N
1587	350	60412000	Xalqaro iqtisodiyot va menejment (mintaqalar va faoliyat yo‘nalishlari bo‘yicha)	\N
1588	350	60310800	Xalqaro munosabatlar	\N
1589	350	60420103	Yurisprudensiya (xalqaro huquqiy faoliyat)	\N
1590	351	60110900	Biologiya	\N
1591	351	60110900198	Biologiya-Forish tumani	\N
1592	351	60110500	Boshlang‘ich ta’lim	\N
1593	351	60110500196	Boshlang‘ich ta’lim-Baxmal tumani	\N
1594	351	60110500198	Boshlang‘ich ta’lim-Forish tumani	\N
1595	351	60110500199	Boshlang‘ich ta’lim-G'allaorol tumani	\N
1596	351	60910200	Davolash ishi	\N
1597	351	60910200197	Davolash ishi-Do'stlik tumani	\N
1598	351	60910200199	Davolash ishi-G'allaorol tumani	\N
1599	351	60910200204	Davolash ishi-Zafarobod tumani	\N
1600	351	60910200205	Davolash ishi-Zarbdor tumani	\N
1601	351	60910200206	Davolash ishi-Zomin tumani	\N
1602	351	60110700	Fizika va astronomiya	\N
1603	351	60110700198	Fizika va astronomiya-Forish tumani	\N
1604	351	60110700199	Fizika va astronomiya-G'allaorol tumani	\N
1605	351	60111000	Geografiya va iqtisodiy bilim asoslari	\N
1606	351	60111000198	Geografiya va iqtisodiy bilim asoslari-Forish tumani	\N
1607	351	60112200	Jismoniy madaniyat	\N
1608	351	60112201	Jismoniy madaniyat (xotin-qizlar sporti yo‘nalishi bo‘yicha)	\N
1609	351	60110800	Kimyo	\N
1610	351	60110800198	Kimyo-Forish tumani	\N
1611	351	60112500	Maktab menejmenti	\N
1612	351	60110200	Maktabgacha ta’lim	\N
1613	351	60111900	Maktabgacha va boshlang‘ich ta'limda jismoniy tarbiya va sport	\N
1614	351	60112600	Maktabgacha va boshlang‘ich ta’limda xorijiy til (ingliz tili)	\N
1615	351	60110600	Matematika va informatika	\N
1616	351	60110600196	Matematika va informatika-Baxmal tumani	\N
1617	351	60110600198	Matematika va informatika-Forish tumani	\N
1618	351	60110600199	Matematika va informatika-G'allaorol tumani	\N
1619	351	60110600200	Matematika va informatika-Sharof Rashidov tumani	\N
1620	351	60112702	Maxsus pedagogika : logopediya	\N
1621	351	60112704	Maxsus pedagogika : oligofrenopedagogika	\N
1622	351	60112703	Maxsus pedagogika : supdopedagogika	\N
1623	351	60112100	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi	\N
1624	351	60112100199	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi-G'allaorol tumani	\N
1625	351	60111300	Musiqa ta'limi	\N
1626	351	60111400	O‘zbek tili va adabiyoti	\N
1627	351	60111400198	O‘zbek tili va adabiyoti-Forish tumani	\N
1628	351	60111701	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)	\N
1629	351	60111701196	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Baxmal tumani	\N
1630	351	60111701199	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-G'allaorol tumani	\N
1631	351	60111701200	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Sharof Rashidov tumani	\N
1632	351	60111507	Ona tili va adabiyot: rus tili va adabiyot	\N
1633	351	60110100	Pedagogika	\N
1634	351	60910300	Pediatriya ishi	\N
1635	351	60910300195	Pediatriya ishi-Arnasoy tumani	\N
1636	351	60910300196	Pediatriya ishi-Baxmal tumani	\N
1637	351	60910300201	Pediatriya ishi-Mirzacho'l tumani	\N
1638	351	60910300202	Pediatriya ishi-Paxtakor tumani	\N
1639	351	60910300203	Pediatriya ishi-Yangiobod tumani	\N
1640	351	61010342	Sport faoliyati: kurash	\N
1641	351	61010332	Sport faoliyati: voleybol	\N
1642	351	60111100	Tarix	\N
1643	351	60111100198	Tarix-Forish tumani	\N
1644	351	60111200	Tasviriy san'at va muhandislik grafikasi  	\N
1645	351	60112300	Texnologik ta’lim	\N
1646	351	60111804	Xorijiy til va adabiyoti: ingliz tili	\N
1647	351	60111804196	Xorijiy til va adabiyoti: ingliz tili-Baxmal tumani	\N
1648	351	60111804198	Xorijiy til va adabiyoti: ingliz tili-Forish tumani	\N
1649	351	60111804199	Xorijiy til va adabiyoti: ingliz tili-G'allaorol tumani	\N
1650	351	60111804200	Xorijiy til va adabiyoti: ingliz tili-Sharof Rashidov tumani	\N
1651	352	60110900	Biologiya	\N
1652	352	60110900094	Biologiya-Ellikqal'a tumani	\N
1653	352	60110900103	Biologiya-To'rtko'l tumani	\N
1654	352	60110500	Boshlang‘ich ta’lim	\N
1655	352	60110500102	Boshlang‘ich ta’lim-Taxtako'pir tumani	\N
1656	352	60110700	Fizika va astronomiya	\N
1657	352	60110700258	Fizika va astronomiya-Bo‘zatov tumani	\N
1658	352	60110700094	Fizika va astronomiya-Ellikqal'a tumani	\N
1659	352	60110700102	Fizika va astronomiya-Taxtako'pir tumani	\N
1660	352	60110700103	Fizika va astronomiya-To'rtko'l tumani	\N
1661	352	60111000	Geografiya va iqtisodiy bilim asoslari	\N
1662	352	60111000096	Geografiya va iqtisodiy bilim asoslari-Mo'ynoq tumani	\N
1663	352	60111000102	Geografiya va iqtisodiy bilim asoslari-Taxtako'pir tumani	\N
1664	352	60111000103	Geografiya va iqtisodiy bilim asoslari-To'rtko'l tumani	\N
1665	352	60112200	Jismoniy madaniyat	\N
1666	352	60112201	Jismoniy madaniyat (xotin-qizlar sporti yo‘nalishi bo‘yicha)	\N
1667	352	60110800	Kimyo	\N
1668	352	60110800094	Kimyo-Ellikqal'a tumani	\N
1669	352	60110800102	Kimyo-Taxtako'pir tumani	\N
1670	352	60112500	Maktab menejmenti	\N
1671	352	60110200	Maktabgacha ta’lim	\N
1672	352	60110600	Matematika va informatika	\N
1673	352	60110600094	Matematika va informatika-Ellikqal'a tumani	\N
1674	352	60110600096	Matematika va informatika-Mo'ynoq tumani	\N
1675	352	60110600102	Matematika va informatika-Taxtako'pir tumani	\N
1676	352	60110600103	Matematika va informatika-To'rtko'l tumani	\N
1677	352	60112702	Maxsus pedagogika : logopediya	\N
1678	352	60112100	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi	\N
1679	352	60112100094	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi-Ellikqal'a tumani	\N
1680	352	60112100096	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi-Mo'ynoq tumani	\N
1681	352	60111300	Musiqa ta'limi	\N
1682	352	60111400	O‘zbek tili va adabiyoti	\N
1683	352	60111601	O‘zga tilli guruhlarda o‘zbek tili (rus guruhlari uchun)	\N
1684	352	60111701	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)	\N
1685	352	60111702	O‘zga tilli guruhlarda rus tili (qoraqalpoq guruhlari uchun)	\N
1686	352	60111505	Ona tili va adabiyot: qoraqalpoq tili va adabiyot	\N
1687	352	60111505258	Ona tili va adabiyot: qoraqalpoq tili va adabiyot-Bo‘zatov tumani	\N
1688	352	60111505103	Ona tili va adabiyot: qoraqalpoq tili va adabiyot-To'rtko'l tumani	\N
1689	352	60111504	Ona tili va adabiyot: qozoq tili va adabiyot	\N
1690	352	60111507	Ona tili va adabiyot: rus tili va adabiyot	\N
1691	352	60111507094	Ona tili va adabiyot: rus tili va adabiyot-Ellikqal'a tumani	\N
1692	352	60111507096	Ona tili va adabiyot: rus tili va adabiyot-Mo'ynoq tumani	\N
1693	352	60111507102	Ona tili va adabiyot: rus tili va adabiyot-Taxtako'pir tumani	\N
1694	352	60111507103	Ona tili va adabiyot: rus tili va adabiyot-To'rtko'l tumani	\N
1695	352	60111501	Ona tili va adabiyot: turkman tili va adabiyot	\N
1696	352	60110100	Pedagogika	\N
1697	352	60111100	Tarix	\N
1698	352	60111100094	Tarix-Ellikqal'a tumani	\N
1699	352	60111100096	Tarix-Mo'ynoq tumani	\N
1700	352	60111100102	Tarix-Taxtako'pir tumani	\N
1701	352	60111100103	Tarix-To'rtko'l tumani	\N
1702	352	60111200	Tasviriy san'at va muhandislik grafikasi  	\N
1703	352	60112300	Texnologik ta’lim	\N
1704	352	60111804	Xorijiy til va adabiyoti: ingliz tili	\N
1705	352	60111804094	Xorijiy til va adabiyoti: ingliz tili-Ellikqal'a tumani	\N
1706	352	60111804096	Xorijiy til va adabiyoti: ingliz tili-Mo'ynoq tumani	\N
1707	352	60111804102	Xorijiy til va adabiyoti: ingliz tili-Taxtako'pir tumani	\N
1708	353	60110900	Biologiya	\N
1709	353	60110900210	Biologiya-Nurota tumani	\N
1710	353	60110500	Boshlang‘ich ta’lim	\N
1711	353	60110500208	Boshlang‘ich ta’lim-Konimex tumani	\N
1712	353	60110500210	Boshlang‘ich ta’lim-Nurota tumani	\N
1713	353	60110500212	Boshlang‘ich ta’lim-Tomdi tumani	\N
1714	353	60110500213	Boshlang‘ich ta’lim-Uchquduq tumani	\N
1715	353	60910200	Davolash ishi	\N
1716	353	60910200010	Davolash ishi-Navoiy viloyati	\N
1717	353	60110700	Fizika va astronomiya	\N
1718	353	60110700208	Fizika va astronomiya-Konimex tumani	\N
1719	353	60110700210	Fizika va astronomiya-Nurota tumani	\N
1720	353	60110700214	Fizika va astronomiya-Xatirchi tumani	\N
1721	353	60111000	Geografiya va iqtisodiy bilim asoslari	\N
1722	353	60111000210	Geografiya va iqtisodiy bilim asoslari-Nurota tumani	\N
1723	353	60111000214	Geografiya va iqtisodiy bilim asoslari-Xatirchi tumani	\N
1724	353	60920101	Ijtimoiy ish (fuqarolarning o‘z-o‘zini boshqarish organlari)	\N
1725	353	60112200	Jismoniy madaniyat	\N
1726	353	60112201	Jismoniy madaniyat (xotin-qizlar sporti yo‘nalishi bo‘yicha)	\N
1727	353	60110800	Kimyo	\N
1728	353	60110800208	Kimyo-Konimex tumani	\N
1729	353	60110800210	Kimyo-Nurota tumani	\N
1730	353	60110800213	Kimyo-Uchquduq tumani	\N
1731	353	60110800214	Kimyo-Xatirchi tumani	\N
1732	353	60112500	Maktab menejmenti	\N
1733	353	60110200	Maktabgacha ta’lim	\N
1734	353	60110600	Matematika va informatika	\N
1735	353	60110600210	Matematika va informatika-Nurota tumani	\N
1736	353	60110600213	Matematika va informatika-Uchquduq tumani	\N
1737	353	60110600214	Matematika va informatika-Xatirchi tumani	\N
1738	353	60112702	Maxsus pedagogika : logopediya	\N
1739	353	60112100	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi	\N
1740	353	60112100214	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi-Xatirchi tumani	\N
1741	353	60111300	Musiqa ta'limi	\N
1742	353	60111400	O‘zbek tili va adabiyoti	\N
1743	353	60111400208	O‘zbek tili va adabiyoti-Konimex tumani	\N
1744	353	60111400210	O‘zbek tili va adabiyoti-Nurota tumani	\N
1745	353	60111701	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)	\N
1746	353	60111701208	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Konimex tumani	\N
1747	353	60111701210	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Nurota tumani	\N
1748	353	60111701213	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Uchquduq tumani	\N
1749	353	60111701214	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Xatirchi tumani	\N
1750	353	60111505	Ona tili va adabiyot: qoraqalpoq tili va adabiyot	\N
1751	353	60111504	Ona tili va adabiyot: qozoq tili va adabiyot	\N
1752	353	60111507	Ona tili va adabiyot: rus tili va adabiyot	\N
1753	353	60110100	Pedagogika	\N
1754	353	60910300	Pediatriya ishi	\N
1755	353	60910300010	Pediatriya ishi-Navoiy viloyati	\N
1756	353	60112419	Professional ta'lim: axborot tizimlari va texnologiyalari	\N
1757	353	60112401	Professional ta'lim: cholg‘u ijrochiligi (turlari bo‘yicha)	\N
1758	353	60112429	Professional ta'lim: dizayn (libos va gazlamalar)	\N
1759	353	60112424	Professional ta'lim: rangtasvir (dastgohli)	\N
1760	353	60112414	Professional ta'lim: vokal san'ati (turlari bo'yicha)	\N
1761	353	61010342	Sport faoliyati: kurash	\N
1762	353	60111100	Tarix	\N
1763	353	60111100213	Tarix-Uchquduq tumani	\N
1764	353	60111100214	Tarix-Xatirchi tumani	\N
1765	353	60111200	Tasviriy san'at va muhandislik grafikasi  	\N
1766	353	60112300	Texnologik ta’lim	\N
1767	353	60111804	Xorijiy til va adabiyoti: ingliz tili	\N
1768	353	60111804208	Xorijiy til va adabiyoti: ingliz tili-Konimex tumani	\N
1769	353	60111804210	Xorijiy til va adabiyoti: ingliz tili-Nurota tumani	\N
1770	353	60111804212	Xorijiy til va adabiyoti: ingliz tili-Tomdi tumani	\N
1771	353	60111804213	Xorijiy til va adabiyoti: ingliz tili-Uchquduq tumani	\N
1772	353	60111804214	Xorijiy til va adabiyoti: ingliz tili-Xatirchi tumani	\N
1773	354	60110900	Biologiya	\N
1774	354	60110900058	Biologiya-Angren shahri	\N
1775	354	60110900242	Biologiya-Oqqo'rg'on tumani	\N
1776	354	60110500	Boshlang‘ich ta’lim	\N
1777	354	60110500247	Boshlang‘ich ta’lim-Quyichirchiq tumani	\N
1778	354	60110700	Fizika va astronomiya	\N
1779	354	60110700237	Fizika va astronomiya-Bekobod tumani	\N
1780	354	60110700239	Fizika va astronomiya-Bo'stonliq tumani	\N
1781	354	60110700240	Fizika va astronomiya-Chinoz tumani	\N
1782	354	60110700241	Fizika va astronomiya-Ohangaron tumani	\N
1783	354	60110700242	Fizika va astronomiya-Oqqo'rg'on tumani	\N
1784	354	60110700247	Fizika va astronomiya-Quyichirchiq tumani	\N
1785	354	60111000	Geografiya va iqtisodiy bilim asoslari	\N
1786	354	60111000058	Geografiya va iqtisodiy bilim asoslari-Angren shahri	\N
1787	354	60111000241	Geografiya va iqtisodiy bilim asoslari-Ohangaron tumani	\N
1788	354	60111000247	Geografiya va iqtisodiy bilim asoslari-Quyichirchiq tumani	\N
1789	354	61010505	Gid hamrohligi va tarjimonlik faoliyati: ingliz tili	\N
1790	354	60920101	Ijtimoiy ish (fuqarolarning o‘z-o‘zini boshqarish organlari)	\N
1791	354	60112200	Jismoniy madaniyat	\N
1792	354	60112201	Jismoniy madaniyat (xotin-qizlar sporti yo‘nalishi bo‘yicha)	\N
1793	354	60110800	Kimyo	\N
1794	354	60110800237	Kimyo-Bekobod tumani	\N
1795	354	60110800241	Kimyo-Ohangaron tumani	\N
1796	354	60110800242	Kimyo-Oqqo'rg'on tumani	\N
1797	354	60110800247	Kimyo-Quyichirchiq tumani	\N
1798	354	60112500	Maktab menejmenti	\N
1799	354	60110200	Maktabgacha ta’lim	\N
1800	354	60111900	Maktabgacha va boshlang‘ich ta'limda jismoniy tarbiya va sport	\N
1801	354	60112600	Maktabgacha va boshlang‘ich ta’limda xorijiy til (ingliz tili)	\N
1802	354	60110600	Matematika va informatika	\N
1803	354	60110600058	Matematika va informatika-Angren shahri	\N
1804	354	60110600237	Matematika va informatika-Bekobod tumani	\N
1805	354	60110600238	Matematika va informatika-Bo'ka tumani	\N
1806	354	60110600242	Matematika va informatika-Oqqo'rg'on tumani	\N
1807	354	60110600247	Matematika va informatika-Quyichirchiq tumani	\N
1808	354	60112702	Maxsus pedagogika : logopediya	\N
1809	354	60112703	Maxsus pedagogika : supdopedagogika	\N
1810	354	60112701	Maxsus pedagogika : tiflopedagogika	\N
1811	354	61010100	Mehmonxona xo‘jaligini tashkil etish va boshqarish	\N
1812	354	60112100	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi	\N
1813	354	60112100237	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi-Bekobod tumani	\N
1814	354	60112100247	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi-Quyichirchiq tumani	\N
1815	354	60111300	Musiqa ta'limi	\N
1816	354	60111400	O‘zbek tili va adabiyoti	\N
1817	354	60111400237	O‘zbek tili va adabiyoti-Bekobod tumani	\N
1818	354	60111400242	O‘zbek tili va adabiyoti-Oqqo'rg'on tumani	\N
1819	354	60111400247	O‘zbek tili va adabiyoti-Quyichirchiq tumani	\N
1820	354	60111701	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)	\N
1821	354	60111701238	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Bo'ka tumani	\N
1822	354	60111701242	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Oqqo'rg'on tumani	\N
1915	356	60111507	Ona tili va adabiyot: rus tili va adabiyot	\N
1823	354	60111701247	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Quyichirchiq tumani	\N
1824	354	60111504	Ona tili va adabiyot: qozoq tili va adabiyot	\N
1825	354	60111507	Ona tili va adabiyot: rus tili va adabiyot	\N
1826	354	60111507058	Ona tili va adabiyot: rus tili va adabiyot-Angren shahri	\N
1827	354	60111507237	Ona tili va adabiyot: rus tili va adabiyot-Bekobod tumani	\N
1828	354	60111507238	Ona tili va adabiyot: rus tili va adabiyot-Bo'ka tumani	\N
1829	354	60111507242	Ona tili va adabiyot: rus tili va adabiyot-Oqqo'rg'on tumani	\N
1830	354	60111507247	Ona tili va adabiyot: rus tili va adabiyot-Quyichirchiq tumani	\N
1831	354	60111502	Ona tili va adabiyot: tojik tili va adabiyot	\N
1832	354	60110100	Pedagogika	\N
1833	354	60111100	Tarix	\N
1834	354	60111100058	Tarix-Angren shahri	\N
1835	354	60111100237	Tarix-Bekobod tumani	\N
1836	354	60111100239	Tarix-Bo'stonliq tumani	\N
1837	354	60111100240	Tarix-Chinoz tumani	\N
1838	354	60111100241	Tarix-Ohangaron tumani	\N
1839	354	60111100247	Tarix-Quyichirchiq tumani	\N
1840	354	60111200	Tasviriy san'at va muhandislik grafikasi  	\N
1841	354	60112300	Texnologik ta’lim	\N
1842	354	61010401	Turizm (faoliyat yo‘nalishlari bo‘yicha )	\N
1843	354	61010404	Turizm (turizm sohasida xizmatlar texnologiyasi va ularni tashkil etish)	\N
1844	354	60111804	Xorijiy til va adabiyoti: ingliz tili	\N
1845	354	60111804058	Xorijiy til va adabiyoti: ingliz tili-Angren shahri	\N
1846	354	60111804237	Xorijiy til va adabiyoti: ingliz tili-Bekobod tumani	\N
1847	354	60111804238	Xorijiy til va adabiyoti: ingliz tili-Bo'ka tumani	\N
1848	354	60111804239	Xorijiy til va adabiyoti: ingliz tili-Bo'stonliq tumani	\N
1849	354	60111804242	Xorijiy til va adabiyoti: ingliz tili-Oqqo'rg'on tumani	\N
1850	354	60111804247	Xorijiy til va adabiyoti: ingliz tili-Quyichirchiq tumani	\N
1851	354	60111803	Xorijiy til va adabiyoti: nemis tili	\N
1852	355	60110900	Biologiya	\N
1853	355	60110500	Boshlang‘ich ta’lim	\N
1854	355	60112000	Chaqiriqqacha harbiy ta’lim	\N
1855	355	60110700	Fizika va astronomiya	\N
1856	355	60111000	Geografiya va iqtisodiy bilim asoslari	\N
1857	355	60112200	Jismoniy madaniyat	\N
1858	355	60112201	Jismoniy madaniyat (xotin-qizlar sporti yo‘nalishi bo‘yicha)	\N
1859	355	60110800	Kimyo	\N
1860	355	60112500	Maktab menejmenti	\N
1861	355	60110200	Maktabgacha ta’lim	\N
1862	355	60110300	Maktabgacha ta’lim psixologiyasi va pedagogikasi	\N
1863	355	60110600	Matematika va informatika	\N
1864	355	60112702	Maxsus pedagogika : logopediya	\N
1865	355	60112704	Maxsus pedagogika : oligofrenopedagogika	\N
1866	355	60112703	Maxsus pedagogika : supdopedagogika	\N
1867	355	60112100	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi	\N
1868	355	60111300	Musiqa ta'limi	\N
1869	355	60111400	O‘zbek tili va adabiyoti	\N
1870	355	60111701	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)	\N
1871	355	60111506	Ona tili va adabiyot: koreys tili va adabiyot	\N
1872	355	60111504	Ona tili va adabiyot: qozoq tili va adabiyot	\N
1873	355	60111507	Ona tili va adabiyot: rus tili va adabiyot	\N
1874	355	60110100	Pedagogika	\N
1875	355	60112419	Professional ta'lim: axborot tizimlari va texnologiyalari	\N
1876	355	60112406	Professional ta'lim: texnologik mashinalar va jihozlar	\N
1877	355	60310901	Psixologiya: amaliy psixologiya	\N
1878	355	60111100	Tarix	\N
1879	355	60111200	Tasviriy san'at va muhandislik grafikasi  	\N
1880	355	60112300	Texnologik ta’lim	\N
1881	355	60111804	Xorijiy til va adabiyoti: ingliz tili	\N
1882	355	60111803	Xorijiy til va adabiyoti: nemis tili	\N
1883	356	60110900	Biologiya	\N
1884	356	60110500	Boshlang‘ich ta’lim	\N
1885	356	60110500134	Boshlang‘ich ta’lim-Farg'ona tumani	\N
1886	356	60110500142	Boshlang‘ich ta’lim-So'x tumani	\N
1887	356	60110700	Fizika va astronomiya	\N
1888	356	60110700134	Fizika va astronomiya-Farg'ona tumani	\N
1889	356	60110700141	Fizika va astronomiya-Rishton tumani	\N
1890	356	60111000	Geografiya va iqtisodiy bilim asoslari	\N
1891	356	60111000134	Geografiya va iqtisodiy bilim asoslari-Farg'ona tumani	\N
1892	356	60111000141	Geografiya va iqtisodiy bilim asoslari-Rishton tumani	\N
1893	356	60112200	Jismoniy madaniyat	\N
1894	356	60112201	Jismoniy madaniyat (xotin-qizlar sporti yo‘nalishi bo‘yicha)	\N
1895	356	60110800	Kimyo	\N
1896	356	60112500	Maktab menejmenti	\N
1897	356	60110200	Maktabgacha ta’lim	\N
1898	356	60110300	Maktabgacha ta’lim psixologiyasi va pedagogikasi	\N
1899	356	60112600	Maktabgacha va boshlang‘ich ta’limda xorijiy til (ingliz tili)	\N
1900	356	60110600	Matematika va informatika	\N
1901	356	60110600134	Matematika va informatika-Farg'ona tumani	\N
1902	356	60110600141	Matematika va informatika-Rishton tumani	\N
1903	356	60110600142	Matematika va informatika-So'x tumani	\N
1904	356	60112702	Maxsus pedagogika : logopediya	\N
1905	356	60112704	Maxsus pedagogika : oligofrenopedagogika	\N
1906	356	60112703	Maxsus pedagogika : supdopedagogika	\N
1907	356	60112100	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi	\N
1908	356	60112100142	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi-So'x tumani	\N
1909	356	60111300	Musiqa ta'limi	\N
1910	356	60111400	O‘zbek tili va adabiyoti	\N
1911	356	60111400142	O‘zbek tili va adabiyoti-So'x tumani	\N
1912	356	60111701	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)	\N
1913	356	60111701141	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Rishton tumani	\N
1914	356	60111701142	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-So'x tumani	\N
1916	356	60110100	Pedagogika	\N
1917	356	60310901	Psixologiya: amaliy psixologiya	\N
1918	356	60111100	Tarix	\N
1919	356	60111100142	Tarix-So'x tumani	\N
1920	356	60111200	Tasviriy san'at va muhandislik grafikasi  	\N
1921	356	60112300	Texnologik ta’lim	\N
1922	356	60111804	Xorijiy til va adabiyoti: ingliz tili	\N
1923	356	60111804134	Xorijiy til va adabiyoti: ingliz tili-Farg'ona tumani	\N
1924	356	60111804142	Xorijiy til va adabiyoti: ingliz tili-So'x tumani	\N
1925	357	60110900	Biologiya	\N
1926	357	60110900301	Biologiya-Bobotog' hududi	\N
1927	357	60110900170	Biologiya-Boysun tumani	\N
1928	357	60110900174	Biologiya-Oltinsoy tumani	\N
1929	357	60110900178	Biologiya-Sherobod tumani	\N
1930	357	60110500	Boshlang‘ich ta’lim	\N
1931	357	60110500301	Boshlang‘ich ta’lim-Bobotog' hududi	\N
1932	357	60110500170	Boshlang‘ich ta’lim-Boysun tumani	\N
1933	357	60110500171	Boshlang‘ich ta’lim-Denov tumani	\N
1934	357	60110500178	Boshlang‘ich ta’lim-Sherobod tumani	\N
1935	357	60110700	Fizika va astronomiya	\N
1936	357	60111000	Geografiya va iqtisodiy bilim asoslari	\N
1937	357	60111000301	Geografiya va iqtisodiy bilim asoslari-Bobotog' hududi	\N
1938	357	60111000171	Geografiya va iqtisodiy bilim asoslari-Denov tumani	\N
1939	357	60111000176	Geografiya va iqtisodiy bilim asoslari-Qumqo'rg'on tumani	\N
1940	357	60111000178	Geografiya va iqtisodiy bilim asoslari-Sherobod tumani	\N
1941	357	60111000181	Geografiya va iqtisodiy bilim asoslari-Uzun tumani	\N
1942	357	60112200	Jismoniy madaniyat	\N
1943	357	60112201	Jismoniy madaniyat (xotin-qizlar sporti yo‘nalishi bo‘yicha)	\N
1944	357	60110200	Maktabgacha ta’lim	\N
1945	357	60110300	Maktabgacha ta’lim psixologiyasi va pedagogikasi	\N
1946	357	60112600	Maktabgacha va boshlang‘ich ta’limda xorijiy til (ingliz tili)	\N
1947	357	60110600	Matematika va informatika	\N
1948	357	60110600301	Matematika va informatika-Bobotog' hududi	\N
1949	357	60110600170	Matematika va informatika-Boysun tumani	\N
1950	357	60110600171	Matematika va informatika-Denov tumani	\N
1951	357	60110600174	Matematika va informatika-Oltinsoy tumani	\N
1952	357	60110600178	Matematika va informatika-Sherobod tumani	\N
1953	357	60110600181	Matematika va informatika-Uzun tumani	\N
1954	357	60112100	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi	\N
1955	357	60112100171	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi-Denov tumani	\N
1956	357	60112100174	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi-Oltinsoy tumani	\N
1957	357	60112100178	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi-Sherobod tumani	\N
1958	357	60111300	Musiqa ta'limi	\N
1959	357	60111400	O‘zbek tili va adabiyoti	\N
1960	357	60111400170	O‘zbek tili va adabiyoti-Boysun tumani	\N
1961	357	60111400176	O‘zbek tili va adabiyoti-Qumqo'rg'on tumani	\N
1962	357	60111400178	O‘zbek tili va adabiyoti-Sherobod tumani	\N
1963	357	60111701	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)	\N
1964	357	60111701170	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Boysun tumani	\N
1965	357	60111701173	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Muzrabot tumani	\N
1966	357	60111701174	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Oltinsoy tumani	\N
1967	357	60111701176	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Qumqo'rg'on tumani	\N
1968	357	60111701178	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Sherobod tumani	\N
1969	357	60111701179	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Sho'rchi tumani	\N
1970	357	60110100	Pedagogika	\N
1971	357	60111100	Tarix	\N
1972	357	60111100301	Tarix-Bobotog' hududi	\N
1973	357	60111100170	Tarix-Boysun tumani	\N
1974	357	60111100171	Tarix-Denov tumani	\N
1975	357	60111100174	Tarix-Oltinsoy tumani	\N
1976	357	60111100181	Tarix-Uzun tumani	\N
1977	357	60111200	Tasviriy san'at va muhandislik grafikasi  	\N
1978	357	60112300	Texnologik ta’lim	\N
1979	357	60111804	Xorijiy til va adabiyoti: ingliz tili	\N
1980	357	60111804170	Xorijiy til va adabiyoti: ingliz tili-Boysun tumani	\N
1981	357	60111804174	Xorijiy til va adabiyoti: ingliz tili-Oltinsoy tumani	\N
1982	357	60111804176	Xorijiy til va adabiyoti: ingliz tili-Qumqo'rg'on tumani	\N
1983	357	60111804178	Xorijiy til va adabiyoti: ingliz tili-Sherobod tumani	\N
1984	357	60111804179	Xorijiy til va adabiyoti: ingliz tili-Sho'rchi tumani	\N
1985	357	60111804180	Xorijiy til va adabiyoti: ingliz tili-Termiz tumani	\N
1986	357	60111804181	Xorijiy til va adabiyoti: ingliz tili-Uzun tumani	\N
1987	357	60111803	Xorijiy til va adabiyoti: nemis tili	\N
1988	358	60610204	Axborot tizimlari va texnologiyalari (tarmoqlar va sohalar bo‘yicha)	\N
1989	358	60410500	Bank ishi va auditi	\N
1990	358	60110900	Biologiya	\N
1991	358	60411301	Biznesni boshqarish (tarmoqlar bo‘yicha)	\N
1992	358	60110500	Boshlang‘ich ta’lim	\N
1993	358	60410103	Buxgalteriya hisobi va audit	\N
1994	358	60110800	Kimyo	\N
1995	358	60110200	Maktabgacha ta’lim	\N
1996	358	60110600	Matematika va informatika	\N
1997	358	60111400	O‘zbek tili va adabiyoti	\N
1998	358	60111701	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)	\N
1999	358	60111804	Xorijiy til va adabiyoti: ingliz tili	\N
2000	360	60412400	Agrobiznes va investitsion faoliyat	\N
2001	360	60410500	Bank ishi va auditi	\N
2002	360	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
2003	360	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
2004	360	60310106	Iqtisodiyot: oziq-ovqat va resurslar iqtisodiyoti	\N
2005	360	60310105	Iqtisodiyot: qishloq xo‘jaligi iqtisodiyoti	\N
2006	360	60310502	Raqamli iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
2007	360	60410200	Soliqlar va soliqqa tortish	\N
2008	360	60410800	Statistika (tarmoqlar va sohalar bo‘yicha)	\N
2009	360	60410600	Sug‘urta ishi	\N
2010	361	60910200	Davolash ishi	\N
2011	361	60910200033	Davolash ishi-Andijon shahri	\N
2012	361	60910200105	Davolash ishi-Andijon tumani	\N
2013	361	60910200106	Davolash ishi-Asaka tumani	\N
2014	361	60910200107	Davolash ishi-Baliqchi tumani	\N
2015	361	60910200130	Davolash ishi-Beshariq tumani	\N
2016	361	60910200257	Davolash ishi-Bo'ston tumani	\N
2017	361	60910200131	Davolash ishi-Bog'dod tumani	\N
2018	361	60910200109	Davolash ishi-Buloqboshi tumani	\N
2019	361	60910200133	Davolash ishi-Dang'ara tumani	\N
2020	361	60910200134	Davolash ishi-Farg'ona tumani	\N
2021	361	60910200135	Davolash ishi-Furqat tumani	\N
2022	361	60910200110	Davolash ishi-Izboskan tumani	\N
2023	361	60910200111	Davolash ishi-Jalaquduq tumani	\N
2024	361	60910200121	Davolash ishi-Kosonsoy tumani	\N
2025	361	60910200040	Davolash ishi-Marg'ilon shahri	\N
2026	361	60910200112	Davolash ishi-Marxamat tumani	\N
2027	361	60910200139	Davolash ishi-O'zbekiston tumani	\N
2028	361	60910200137	Davolash ishi-Oltiariq tumani	\N
2029	361	60910200113	Davolash ishi-Oltinko'l tumani	\N
2030	361	60910200114	Davolash ishi-Paxtaobod tumani	\N
2031	361	60910200041	Davolash ishi-Qo'qon shahri	\N
2032	361	60910200115	Davolash ishi-Qo'rg'ontepa tumani	\N
2033	361	60910200252	Davolash ishi-Qo'shtepa tumani	\N
2034	361	60910200260	Davolash ishi-Qorasuv shahri	\N
2035	361	60910200140	Davolash ishi-Quva tumani	\N
2036	361	60910200042	Davolash ishi-Quvasoy shahri	\N
2037	361	60910200141	Davolash ishi-Rishton tumani	\N
2038	361	60910200116	Davolash ishi-Shaxrixon tumani	\N
2039	361	60910200142	Davolash ishi-So'x tumani	\N
2040	361	60910200143	Davolash ishi-Toshloq tumani	\N
2041	361	60910200144	Davolash ishi-Uchko'prik tumani	\N
2042	361	60910200117	Davolash ishi-Ulug'nor tumani	\N
2043	361	60910200128	Davolash ishi-Uychi tumani	\N
2044	361	60910200118	Davolash ishi-Xo'jaobod tumani	\N
2045	361	60910200037	Davolash ishi-Xonobod shahri	\N
2046	361	60910200145	Davolash ishi-Yozyovon tumani	\N
2047	361	60910700	Farmatsiya (turlari bo‘yicha)	\N
2048	361	60911200	Oliy hamshiralik ishi	\N
2049	361	60910300	Pediatriya ishi	\N
2050	361	60910300033	Pediatriya ishi-Andijon shahri	\N
2051	361	60910300105	Pediatriya ishi-Andijon tumani	\N
2052	361	60910300106	Pediatriya ishi-Asaka tumani	\N
2053	361	60910300107	Pediatriya ishi-Baliqchi tumani	\N
2054	361	60910300257	Pediatriya ishi-Bo'ston tumani	\N
2055	361	60910300131	Pediatriya ishi-Bog'dod tumani	\N
2056	361	60910300109	Pediatriya ishi-Buloqboshi tumani	\N
2057	361	60910300132	Pediatriya ishi-Buvayda tumani	\N
2058	361	60910300133	Pediatriya ishi-Dang'ara tumani	\N
2059	361	60910300039	Pediatriya ishi-Farg'ona shahri	\N
2060	361	60910300134	Pediatriya ishi-Farg'ona tumani	\N
2061	361	60910300135	Pediatriya ishi-Furqat tumani	\N
2062	361	60910300110	Pediatriya ishi-Izboskan tumani	\N
2063	361	60910300111	Pediatriya ishi-Jalaquduq tumani	\N
2064	361	60910300040	Pediatriya ishi-Marg'ilon shahri	\N
2065	361	60910300112	Pediatriya ishi-Marxamat tumani	\N
2066	361	60910300038	Pediatriya ishi-Namangan shahri	\N
2067	361	60910300139	Pediatriya ishi-O'zbekiston tumani	\N
2068	361	60910300137	Pediatriya ishi-Oltiariq tumani	\N
2069	361	60910300113	Pediatriya ishi-Oltinko'l tumani	\N
2070	361	60910300114	Pediatriya ishi-Paxtaobod tumani	\N
2071	361	60910300041	Pediatriya ishi-Qo'qon shahri	\N
2072	361	60910300115	Pediatriya ishi-Qo'rg'ontepa tumani	\N
2073	361	60910300252	Pediatriya ishi-Qo'shtepa tumani	\N
2074	361	60910300260	Pediatriya ishi-Qorasuv shahri	\N
2075	361	60910300140	Pediatriya ishi-Quva tumani	\N
2076	361	60910300042	Pediatriya ishi-Quvasoy shahri	\N
2077	361	60910300141	Pediatriya ishi-Rishton tumani	\N
2078	361	60910300116	Pediatriya ishi-Shaxrixon tumani	\N
2079	361	60910300143	Pediatriya ishi-Toshloq tumani	\N
2080	361	60910300117	Pediatriya ishi-Ulug'nor tumani	\N
2081	361	60910300118	Pediatriya ishi-Xo'jaobod tumani	\N
2082	361	60910300037	Pediatriya ishi-Xonobod shahri	\N
2083	361	60910300145	Pediatriya ishi-Yozyovon tumani	\N
2084	361	60910800	Sanoat farmatsiyasi (turlari bo‘yicha)	\N
2085	361	60910100	Stomatologiya (yo‘nalishlar bo‘yicha) 	\N
2086	361	60910400	Tibbiy profilaktika ishi	\N
2087	361	60910400105	Tibbiy profilaktika ishi-Andijon tumani	\N
2088	361	60910400106	Tibbiy profilaktika ishi-Asaka tumani	\N
2089	361	60910400107	Tibbiy profilaktika ishi-Baliqchi tumani	\N
2090	361	60910400257	Tibbiy profilaktika ishi-Bo'ston tumani	\N
2091	361	60910400131	Tibbiy profilaktika ishi-Bog'dod tumani	\N
2092	361	60910400109	Tibbiy profilaktika ishi-Buloqboshi tumani	\N
2093	361	60910400133	Tibbiy profilaktika ishi-Dang'ara tumani	\N
2094	361	60910400110	Tibbiy profilaktika ishi-Izboskan tumani	\N
2095	361	60910400121	Tibbiy profilaktika ishi-Kosonsoy tumani	\N
2096	361	60910400112	Tibbiy profilaktika ishi-Marxamat tumani	\N
2097	361	60910400123	Tibbiy profilaktika ishi-Namangan tumani	\N
2098	361	60910400115	Tibbiy profilaktika ishi-Qo'rg'ontepa tumani	\N
2099	361	60910400252	Tibbiy profilaktika ishi-Qo'shtepa tumani	\N
2100	361	60910400260	Tibbiy profilaktika ishi-Qorasuv shahri	\N
2101	361	60910400116	Tibbiy profilaktika ishi-Shaxrixon tumani	\N
2102	361	60910400142	Tibbiy profilaktika ishi-So'x tumani	\N
2736	377	60210200	Kino-teleoperatorlik	\N
2103	361	60910400127	Tibbiy profilaktika ishi-Uchqo'rg'on tumani	\N
2104	361	60910400117	Tibbiy profilaktika ishi-Ulug'nor tumani	\N
2105	361	60910400128	Tibbiy profilaktika ishi-Uychi tumani	\N
2106	361	60910400118	Tibbiy profilaktika ishi-Xo'jaobod tumani	\N
2107	361	60910400037	Tibbiy profilaktika ishi-Xonobod shahri	\N
2108	361	60911100	Xalq tabobati 	\N
2109	362	60910200	Davolash ishi	\N
2110	362	60910200043	Davolash ishi-Buxoro shahri	\N
2111	362	60910200146	Davolash ishi-Buxoro tumani	\N
2112	362	60910200147	Davolash ishi-G'ijduvon tumani	\N
2113	362	60910200064	Davolash ishi-G'ozg'on shahri	\N
2114	362	60910200148	Davolash ishi-Jondor tumani	\N
2115	362	60910200207	Davolash ishi-Karmana tumani	\N
2116	362	60910200044	Davolash ishi-Kogon shahri	\N
2117	362	60910200149	Davolash ishi-Kogon tumani	\N
2118	362	60910200208	Davolash ishi-Konimex tumani	\N
2119	362	60910200209	Davolash ishi-Navbahor tumani	\N
2120	362	60910200210	Davolash ishi-Nurota tumani	\N
2121	362	60910200150	Davolash ishi-Olot tumani	\N
2122	362	60910200151	Davolash ishi-Peshku tumani	\N
2123	362	60910200211	Davolash ishi-Qiziltepa tumani	\N
2124	362	60910200152	Davolash ishi-Qorako'l tumani	\N
2125	362	60910200153	Davolash ishi-Qorovulbozor tumani	\N
2126	362	60910200154	Davolash ishi-Romitan tumani	\N
2127	362	60910200155	Davolash ishi-Shofirkon tumani	\N
2128	362	60910200156	Davolash ishi-Vobkent tumani	\N
2129	362	60910200214	Davolash ishi-Xatirchi tumani	\N
2130	362	60910200052	Davolash ishi-Zarafshon shahri	\N
2131	362	60910700	Farmatsiya (turlari bo‘yicha)	\N
2132	362	60911200	Oliy hamshiralik ishi	\N
2133	362	60910300	Pediatriya ishi	\N
2134	362	60910300043	Pediatriya ishi-Buxoro shahri	\N
2135	362	60910300146	Pediatriya ishi-Buxoro tumani	\N
2136	362	60910300147	Pediatriya ishi-G'ijduvon tumani	\N
2137	362	60910300148	Pediatriya ishi-Jondor tumani	\N
2138	362	60910300044	Pediatriya ishi-Kogon shahri	\N
2139	362	60910300149	Pediatriya ishi-Kogon tumani	\N
2140	362	60910300150	Pediatriya ishi-Olot tumani	\N
2141	362	60910300151	Pediatriya ishi-Peshku tumani	\N
2142	362	60910300152	Pediatriya ishi-Qorako'l tumani	\N
2143	362	60910300153	Pediatriya ishi-Qorovulbozor tumani	\N
2144	362	60910300154	Pediatriya ishi-Romitan tumani	\N
2145	362	60910300155	Pediatriya ishi-Shofirkon tumani	\N
2146	362	60910300156	Pediatriya ishi-Vobkent tumani	\N
2147	362	60910100	Stomatologiya (yo‘nalishlar bo‘yicha) 	\N
2148	362	60910600	Tibbiy-biologik ish	\N
2149	362	60910600043	Tibbiy-biologik ish-Buxoro shahri	\N
2150	362	60910600147	Tibbiy-biologik ish-G'ijduvon tumani	\N
2151	362	60910600148	Tibbiy-biologik ish-Jondor tumani	\N
2152	362	60910600207	Tibbiy-biologik ish-Karmana tumani	\N
2153	362	60910600149	Tibbiy-biologik ish-Kogon tumani	\N
2154	362	60910600051	Tibbiy-biologik ish-Navoiy shahri	\N
2155	362	60910600210	Tibbiy-biologik ish-Nurota tumani	\N
2156	362	60910600150	Tibbiy-biologik ish-Olot tumani	\N
2157	362	60910600211	Tibbiy-biologik ish-Qiziltepa tumani	\N
2158	362	60910600152	Tibbiy-biologik ish-Qorako'l tumani	\N
2159	362	60910600154	Tibbiy-biologik ish-Romitan tumani	\N
2160	362	60910600155	Tibbiy-biologik ish-Shofirkon tumani	\N
2161	362	60910400	Tibbiy profilaktika ishi	\N
2162	362	60910400043	Tibbiy profilaktika ishi-Buxoro shahri	\N
2163	362	60910400147	Tibbiy profilaktika ishi-G'ijduvon tumani	\N
2164	362	60910400148	Tibbiy profilaktika ishi-Jondor tumani	\N
2165	362	60910400207	Tibbiy profilaktika ishi-Karmana tumani	\N
2166	362	60910400149	Tibbiy profilaktika ishi-Kogon tumani	\N
2167	362	60910400051	Tibbiy profilaktika ishi-Navoiy shahri	\N
2168	362	60910400211	Tibbiy profilaktika ishi-Qiziltepa tumani	\N
2169	362	60910400152	Tibbiy profilaktika ishi-Qorako'l tumani	\N
2170	362	60910400214	Tibbiy profilaktika ishi-Xatirchi tumani	\N
2171	362	60911100	Xalq tabobati 	\N
2172	363	60910200	Davolash ishi	\N
2173	363	60910200215	Davolash ishi-Bulung'ur tumani	\N
2174	363	60910200182	Davolash ishi-Chiroqchi tumani	\N
2175	363	60910200183	Davolash ishi-Dehqonobod tumani	\N
2176	363	60910200184	Davolash ishi-G'uzor tumani	\N
2177	363	60910200216	Davolash ishi-Ishtixon tumani	\N
2178	363	60910200217	Davolash ishi-Jomboy tumani	\N
2179	363	60910200185	Davolash ishi-Kasbi tumani	\N
2180	363	60910200053	Davolash ishi-Kattaqo'rg'on shahri	\N
2181	363	60910200218	Davolash ishi-Kattaqo'rg'on tumani	\N
2182	363	60910200186	Davolash ishi-Kitob tumani	\N
2183	363	60910200187	Davolash ishi-Koson tumani	\N
2184	363	60910200263	Davolash ishi-Kukdala tumani	\N
2185	363	60910200188	Davolash ishi-Mirishkor tumani	\N
2186	363	60910200219	Davolash ishi-Narpay tumani	\N
2187	363	60910200190	Davolash ishi-Nishon tumani	\N
2188	363	60910200220	Davolash ishi-Nurobod tumani	\N
2189	363	60910200221	Davolash ishi-Oqdaryo tumani	\N
2190	363	60910200222	Davolash ishi-Pastdarg'om tumani	\N
2191	363	60910200223	Davolash ishi-Paxtachi tumani	\N
2192	363	60910200224	Davolash ishi-Payariq tumani	\N
2193	363	60910200191	Davolash ishi-Qamashi tumani	\N
2194	363	60910200048	Davolash ishi-Qarshi shahri	\N
2195	363	60910200192	Davolash ishi-Qarshi tumani	\N
2196	363	60910200054	Davolash ishi-Samarqand shahri	\N
2197	363	60910200226	Davolash ishi-Samarqand tumani	\N
2198	363	60910200253	Davolash ishi-Shahrisabz shahri	\N
2199	363	60910200227	Davolash ishi-Tayloq tumani	\N
2200	363	60910200228	Davolash ishi-Urgut tumani	\N
2201	363	60910200194	Davolash ishi-Yakkabog' tumani	\N
2202	363	60910700	Farmatsiya (turlari bo‘yicha)	\N
2203	363	60911200	Oliy hamshiralik ishi	\N
2204	363	60910300	Pediatriya ishi	\N
2205	363	60910300255	Pediatriya ishi-Bandixon tumani	\N
2206	363	60910300182	Pediatriya ishi-Chiroqchi tumani	\N
2207	363	60910300171	Pediatriya ishi-Denov tumani	\N
2208	363	60910300064	Pediatriya ishi-G'ozg'on shahri	\N
2209	363	60910300184	Pediatriya ishi-G'uzor tumani	\N
2210	363	60910300216	Pediatriya ishi-Ishtixon tumani	\N
2211	363	60910300207	Pediatriya ishi-Karmana tumani	\N
2212	363	60910300185	Pediatriya ishi-Kasbi tumani	\N
2213	363	60910300218	Pediatriya ishi-Kattaqo'rg'on tumani	\N
2214	363	60910300186	Pediatriya ishi-Kitob tumani	\N
2215	363	60910300187	Pediatriya ishi-Koson tumani	\N
2216	363	60910300263	Pediatriya ishi-Kukdala tumani	\N
2217	363	60910300189	Pediatriya ishi-Muborak tumani	\N
2218	363	60910300219	Pediatriya ishi-Narpay tumani	\N
2219	363	60910300209	Pediatriya ishi-Navbahor tumani	\N
2220	363	60910300051	Pediatriya ishi-Navoiy shahri	\N
2221	363	60910300190	Pediatriya ishi-Nishon tumani	\N
2222	363	60910300220	Pediatriya ishi-Nurobod tumani	\N
2223	363	60910300210	Pediatriya ishi-Nurota tumani	\N
2224	363	60910300174	Pediatriya ishi-Oltinsoy tumani	\N
2225	363	60910300221	Pediatriya ishi-Oqdaryo tumani	\N
2226	363	60910300223	Pediatriya ishi-Paxtachi tumani	\N
2227	363	60910300224	Pediatriya ishi-Payariq tumani	\N
2228	363	60910300191	Pediatriya ishi-Qamashi tumani	\N
2229	363	60910300048	Pediatriya ishi-Qarshi shahri	\N
2230	363	60910300192	Pediatriya ishi-Qarshi tumani	\N
2231	363	60910300211	Pediatriya ishi-Qiziltepa tumani	\N
2232	363	60910300175	Pediatriya ishi-Qiziriq tumani	\N
2233	363	60910300225	Pediatriya ishi-Qo'shrabot tumani	\N
2234	363	60910300054	Pediatriya ishi-Samarqand shahri	\N
2235	363	60910300253	Pediatriya ishi-Shahrisabz shahri	\N
2236	363	60910300193	Pediatriya ishi-Shahrisabz tumani	\N
2237	363	60910300047	Pediatriya ishi-Termiz shahri	\N
2238	363	60910300228	Pediatriya ishi-Urgut tumani	\N
2239	363	60910300214	Pediatriya ishi-Xatirchi tumani	\N
2240	363	60910300194	Pediatriya ishi-Yakkabog' tumani	\N
2241	363	60910300052	Pediatriya ishi-Zarafshon shahri	\N
2242	363	60910100	Stomatologiya (yo‘nalishlar bo‘yicha) 	\N
2243	363	60910600	Tibbiy-biologik ish	\N
2244	363	60910600224	Tibbiy-biologik ish-Payariq tumani	\N
2245	363	60910600225	Tibbiy-biologik ish-Qo'shrabot tumani	\N
2246	363	60910600226	Tibbiy-biologik ish-Samarqand tumani	\N
2247	363	60910400	Tibbiy profilaktika ishi	\N
2248	363	60911100	Xalq tabobati 	\N
2249	364	60711800	Biotibbiyot muhandisligi	\N
2250	364	60910200	Davolash ishi	\N
2251	364	60910200195	Davolash ishi-Arnasoy tumani	\N
2252	364	60910200196	Davolash ishi-Baxmal tumani	\N
2253	364	60910200130	Davolash ishi-Beshariq tumani	\N
2254	364	60910200131	Davolash ishi-Bog'dod tumani	\N
2255	364	60910200229	Davolash ishi-Boyovut tumani	\N
2256	364	60910200182	Davolash ishi-Chiroqchi tumani	\N
2257	364	60910200119	Davolash ishi-Chortoq tumani	\N
2258	364	60910200120	Davolash ishi-Chust tumani	\N
2259	364	60910200133	Davolash ishi-Dang'ara tumani	\N
2260	364	60910200183	Davolash ishi-Dehqonobod tumani	\N
2261	364	60910200197	Davolash ishi-Do'stlik tumani	\N
2262	364	60910200134	Davolash ishi-Farg'ona tumani	\N
2263	364	60910200198	Davolash ishi-Forish tumani	\N
2264	364	60910200199	Davolash ishi-G'allaorol tumani	\N
2265	364	60910200055	Davolash ishi-Guliston shahri	\N
2266	364	60910200230	Davolash ishi-Guliston tumani	\N
2267	364	60910200172	Davolash ishi-Jarqo'rg'on tumani	\N
2268	364	60910200050	Davolash ishi-Jizzax shahri	\N
2269	364	60910200185	Davolash ishi-Kasbi tumani	\N
2270	364	60910200186	Davolash ishi-Kitob tumani	\N
2271	364	60910200187	Davolash ishi-Koson tumani	\N
2272	364	60910200121	Davolash ishi-Kosonsoy tumani	\N
2273	364	60910200263	Davolash ishi-Kukdala tumani	\N
2274	364	60910200040	Davolash ishi-Marg'ilon shahri	\N
2275	364	60910200122	Davolash ishi-Mingbuloq tumani	\N
2276	364	60910200201	Davolash ishi-Mirzacho'l tumani	\N
2277	364	60910200231	Davolash ishi-Mirzaobod tumani	\N
2278	364	60910200038	Davolash ishi-Namangan shahri	\N
2279	364	60910200123	Davolash ishi-Namangan tumani	\N
2280	364	60910200124	Davolash ishi-Norin tumani	\N
2281	364	60910200031	Davolash ishi-Nukus shahri	\N
2282	364	60910200139	Davolash ishi-O'zbekiston tumani	\N
2283	364	60910200137	Davolash ishi-Oltiariq tumani	\N
2284	364	60910200232	Davolash ishi-Oqoltin tumani	\N
2285	364	60910200202	Davolash ishi-Paxtakor tumani	\N
2286	364	60910200125	Davolash ishi-Pop tumani	\N
2287	364	60910200191	Davolash ishi-Qamashi tumani	\N
2288	364	60910200048	Davolash ishi-Qarshi shahri	\N
2289	364	60910200192	Davolash ishi-Qarshi tumani	\N
2290	364	60910200041	Davolash ishi-Qo'qon shahri	\N
2291	364	60910200252	Davolash ishi-Qo'shtepa tumani	\N
2292	364	60910200140	Davolash ishi-Quva tumani	\N
2293	364	60910200141	Davolash ishi-Rishton tumani	\N
2294	364	60910200233	Davolash ishi-Sardoba tumani	\N
2295	364	60910200234	Davolash ishi-Sayxunobod tumani	\N
2296	364	60910200200	Davolash ishi-Sharof Rashidov tumani	\N
2297	364	60910200056	Davolash ishi-Shirin shahri	\N
2298	364	60910200235	Davolash ishi-Sirdaryo tumani	\N
2299	364	60910200047	Davolash ishi-Termiz shahri	\N
2300	364	60910200126	Davolash ishi-To'raqo'rg'on tumani	\N
2301	364	60910200014	Davolash ishi-Toshkent shahri	\N
2302	364	60910200144	Davolash ishi-Uchko'prik tumani	\N
2303	364	60910200127	Davolash ishi-Uchqo'rg'on tumani	\N
2304	364	60910200128	Davolash ishi-Uychi tumani	\N
2305	364	60910200236	Davolash ishi-Xovos tumani	\N
2306	364	60910200203	Davolash ishi-Yangiobod tumani	\N
2307	364	60910200129	Davolash ishi-Yangiqo'rg'on tumani	\N
2308	364	60910200057	Davolash ishi-Yangiyer shahri	\N
2309	364	60910200145	Davolash ishi-Yozyovon tumani	\N
2310	364	60910200204	Davolash ishi-Zafarobod tumani	\N
2311	364	60910200205	Davolash ishi-Zarbdor tumani	\N
2312	364	60910200206	Davolash ishi-Zomin tumani	\N
2313	364	60910700	Farmatsiya (turlari bo‘yicha)	\N
2314	364	60411201	Menejment : sog'liqni saqlash menejmenti 	\N
2315	364	60911200	Oliy hamshiralik ishi	\N
2316	364	60910300	Pediatriya ishi	\N
2317	364	60910100	Stomatologiya (yo‘nalishlar bo‘yicha) 	\N
2318	364	60910600	Tibbiy-biologik ish	\N
2319	364	60910600171	Tibbiy-biologik ish-Denov tumani	\N
2320	364	60910600039	Tibbiy-biologik ish-Farg'ona shahri	\N
2321	364	60910600134	Tibbiy-biologik ish-Farg'ona tumani	\N
2322	364	60910600055	Tibbiy-biologik ish-Guliston shahri	\N
2323	364	60910600172	Tibbiy-biologik ish-Jarqo'rg'on tumani	\N
2324	364	60910600040	Tibbiy-biologik ish-Marg'ilon shahri	\N
2325	364	60910600173	Tibbiy-biologik ish-Muzrabot tumani	\N
2326	364	60910600038	Tibbiy-biologik ish-Namangan shahri	\N
2327	364	60910600123	Tibbiy-biologik ish-Namangan tumani	\N
2328	364	60910600174	Tibbiy-biologik ish-Oltinsoy tumani	\N
2329	364	60910600175	Tibbiy-biologik ish-Qiziriq tumani	\N
2330	364	60910600041	Tibbiy-biologik ish-Qo'qon shahri	\N
2331	364	60910600252	Tibbiy-biologik ish-Qo'shtepa tumani	\N
2332	364	60910600176	Tibbiy-biologik ish-Qumqo'rg'on tumani	\N
2333	364	60910600140	Tibbiy-biologik ish-Quva tumani	\N
2334	364	60910600178	Tibbiy-biologik ish-Sherobod tumani	\N
2335	364	60910600047	Tibbiy-biologik ish-Termiz shahri	\N
2336	364	60910600014	Tibbiy-biologik ish-Toshkent shahri	\N
2337	364	60910600127	Tibbiy-biologik ish-Uchqo'rg'on tumani	\N
2338	364	60910600128	Tibbiy-biologik ish-Uychi tumani	\N
2339	364	60910600181	Tibbiy-biologik ish-Uzun tumani	\N
2340	364	60910600129	Tibbiy-biologik ish-Yangiqo'rg'on tumani	\N
2341	364	60910400	Tibbiy profilaktika ishi	\N
2342	364	60910400168	Tibbiy profilaktika ishi-Angor tumani	\N
2343	364	60910400255	Tibbiy profilaktika ishi-Bandixon tumani	\N
2344	364	60910400196	Tibbiy profilaktika ishi-Baxmal tumani	\N
2345	364	60910400170	Tibbiy profilaktika ishi-Boysun tumani	\N
2346	364	60910400171	Tibbiy profilaktika ishi-Denov tumani	\N
2347	364	60910400197	Tibbiy profilaktika ishi-Do'stlik tumani	\N
2348	364	60910400198	Tibbiy profilaktika ishi-Forish tumani	\N
2349	364	60910400199	Tibbiy profilaktika ishi-G'allaorol tumani	\N
2350	364	60910400172	Tibbiy profilaktika ishi-Jarqo'rg'on tumani	\N
2351	364	60910400050	Tibbiy profilaktika ishi-Jizzax shahri	\N
2352	364	60910400201	Tibbiy profilaktika ishi-Mirzacho'l tumani	\N
2353	364	60910400231	Tibbiy profilaktika ishi-Mirzaobod tumani	\N
2354	364	60910400173	Tibbiy profilaktika ishi-Muzrabot tumani	\N
2355	364	60910400243	Tibbiy profilaktika ishi-O'rtachirchiq tumani	\N
2356	364	60910400174	Tibbiy profilaktika ishi-Oltinsoy tumani	\N
2357	364	60910400202	Tibbiy profilaktika ishi-Paxtakor tumani	\N
2358	364	60910400245	Tibbiy profilaktika ishi-Piskent tumani	\N
2359	364	60910400175	Tibbiy profilaktika ishi-Qiziriq tumani	\N
2360	364	60910400176	Tibbiy profilaktika ishi-Qumqo'rg'on tumani	\N
2361	364	60910400177	Tibbiy profilaktika ishi-Sariosiyo tumani	\N
2362	364	60910400178	Tibbiy profilaktika ishi-Sherobod tumani	\N
2363	364	60910400179	Tibbiy profilaktika ishi-Sho'rchi tumani	\N
2364	364	60910400235	Tibbiy profilaktika ishi-Sirdaryo tumani	\N
2365	364	60910400047	Tibbiy profilaktika ishi-Termiz shahri	\N
2366	364	60910400180	Tibbiy profilaktika ishi-Termiz tumani	\N
2367	364	60910400014	Tibbiy profilaktika ishi-Toshkent shahri	\N
2368	364	60910400181	Tibbiy profilaktika ishi-Uzun tumani	\N
2369	364	60910400203	Tibbiy profilaktika ishi-Yangiobod tumani	\N
2370	364	60910400250	Tibbiy profilaktika ishi-Yuqorichirchiq tumani	\N
2371	364	60910400204	Tibbiy profilaktika ishi-Zafarobod tumani	\N
2372	364	60910400205	Tibbiy profilaktika ishi-Zarbdor tumani	\N
2373	364	60910400206	Tibbiy profilaktika ishi-Zomin tumani	\N
2374	364	60911100	Xalq tabobati 	\N
2375	365	60710702	Elektr texnikasi, elektr mexanikasi va elektr texnologiyalari (tarmoqlar bo‘yicha)	\N
2376	365	60710101	Kimyoviy texnologiya (ishlab chiqarish turlari bo‘yicha)	\N
2377	365	60721900	Konchilik elektr mexanikasi	\N
2378	365	60721501	Konchilik ishi (faoliyat turlari bo‘yicha)	\N
2379	365	60720800	Mashinasozlik texnologiyasi, mashinasozlik ishlab chiqarishini jihozlash va avtomatlashtirish	\N
2380	365	60712101	Metallurgiya (metall turlari bo‘yicha)	\N
2381	365	60720701	Texnologik mashinalar va jihozlar (tarmoqlar bo‘yicha)	\N
2382	366	60910200	Davolash ishi	\N
2383	366	60910100	Stomatologiya (yo‘nalishlar bo‘yicha) 	\N
2384	366	60911100	Xalq tabobati 	\N
2385	367	60910200	Davolash ishi	\N
2386	367	60910200240	Davolash ishi-Chinoz tumani	\N
2387	367	60910200119	Davolash ishi-Chortoq tumani	\N
2388	367	60910200120	Davolash ishi-Chust tumani	\N
2389	367	60910200242	Davolash ishi-Oqqo'rg'on tumani	\N
2390	367	60910200125	Davolash ishi-Pop tumani	\N
2391	367	60910200126	Davolash ishi-To'raqo'rg'on tumani	\N
2392	367	60910200014	Davolash ishi-Toshkent shahri	\N
2393	367	60910200248	Davolash ishi-Toshkent tumani	\N
2394	367	60910200249	Davolash ishi-Yangiyo'l tumani	\N
2395	367	60911200	Oliy hamshiralik ishi	\N
2396	367	60910300	Pediatriya ishi	\N
2397	367	60910300058	Pediatriya ishi-Angren shahri	\N
2398	367	60910300059	Pediatriya ishi-Bekobod shahri	\N
2399	367	60910300237	Pediatriya ishi-Bekobod tumani	\N
2400	367	60910300238	Pediatriya ishi-Bo'ka tumani	\N
2401	367	60910300239	Pediatriya ishi-Bo'stonliq tumani	\N
2402	367	60910300229	Pediatriya ishi-Boyovut tumani	\N
2403	367	60910300240	Pediatriya ishi-Chinoz tumani	\N
2404	367	60910300060	Pediatriya ishi-Chirchiq shahri	\N
2405	367	60910300055	Pediatriya ishi-Guliston shahri	\N
2406	367	60910300230	Pediatriya ishi-Guliston tumani	\N
2407	367	60910300231	Pediatriya ishi-Mirzaobod tumani	\N
2408	367	60910300254	Pediatriya ishi-Nurafshon shahri	\N
2409	367	60910300243	Pediatriya ishi-O'rtachirchiq tumani	\N
2410	367	60910300061	Pediatriya ishi-Ohangaron shahri	\N
2411	367	60910300241	Pediatriya ishi-Ohangaron tumani	\N
2412	367	60910300062	Pediatriya ishi-Olmaliq shahri	\N
2413	367	60910300232	Pediatriya ishi-Oqoltin tumani	\N
2414	367	60910300242	Pediatriya ishi-Oqqo'rg'on tumani	\N
2415	367	60910300244	Pediatriya ishi-Parkent tumani	\N
2416	367	60910300245	Pediatriya ishi-Piskent tumani	\N
2417	367	60910300246	Pediatriya ishi-Qibray tumani	\N
2418	367	60910300247	Pediatriya ishi-Quyichirchiq tumani	\N
2419	367	60910300234	Pediatriya ishi-Sayxunobod tumani	\N
2420	367	60910300056	Pediatriya ishi-Shirin shahri	\N
2421	367	60910300235	Pediatriya ishi-Sirdaryo tumani	\N
2422	367	60910300014	Pediatriya ishi-Toshkent shahri	\N
2423	367	60910300248	Pediatriya ishi-Toshkent tumani	\N
2424	367	60910300057	Pediatriya ishi-Yangiyer shahri	\N
2425	367	60910300249	Pediatriya ishi-Yangiyo'l tumani	\N
2426	367	60910300250	Pediatriya ishi-Yuqorichirchiq tumani	\N
2427	367	60910300251	Pediatriya ishi-Zangiota tumani	\N
2428	367	60910600	Tibbiy-biologik ish	\N
2429	367	60910600195	Tibbiy-biologik ish-Arnasoy tumani	\N
2430	367	60910600237	Tibbiy-biologik ish-Bekobod tumani	\N
2431	367	60910600238	Tibbiy-biologik ish-Bo'ka tumani	\N
2432	367	60910600239	Tibbiy-biologik ish-Bo'stonliq tumani	\N
2433	367	60910600240	Tibbiy-biologik ish-Chinoz tumani	\N
2434	367	60910600199	Tibbiy-biologik ish-G'allaorol tumani	\N
2435	367	60910600241	Tibbiy-biologik ish-Ohangaron tumani	\N
2436	367	60910600062	Tibbiy-biologik ish-Olmaliq shahri	\N
2437	367	60910600232	Tibbiy-biologik ish-Oqoltin tumani	\N
2438	367	60910600242	Tibbiy-biologik ish-Oqqo'rg'on tumani	\N
2439	367	60910600247	Tibbiy-biologik ish-Quyichirchiq tumani	\N
2440	367	60910600249	Tibbiy-biologik ish-Yangiyo'l tumani	\N
2441	367	60910600250	Tibbiy-biologik ish-Yuqorichirchiq tumani	\N
2442	367	60911100	Xalq tabobati 	\N
2443	368	60910200	Davolash ishi	\N
2444	368	60910200168	Davolash ishi-Angor tumani	\N
2445	368	60910200255	Davolash ishi-Bandixon tumani	\N
2446	368	60910200301	Davolash ishi-Bobotog' hududi	\N
2447	368	60910200170	Davolash ishi-Boysun tumani	\N
2448	368	60910200182	Davolash ishi-Chiroqchi tumani	\N
2449	368	60910200183	Davolash ishi-Dehqonobod tumani	\N
2450	368	60910200171	Davolash ishi-Denov tumani	\N
2451	368	60910200184	Davolash ishi-G'uzor tumani	\N
2452	368	60910200172	Davolash ishi-Jarqo'rg'on tumani	\N
2453	368	60910200185	Davolash ishi-Kasbi tumani	\N
2454	368	60910200186	Davolash ishi-Kitob tumani	\N
2455	368	60910200187	Davolash ishi-Koson tumani	\N
2456	368	60910200263	Davolash ishi-Kukdala tumani	\N
2457	368	60910200188	Davolash ishi-Mirishkor tumani	\N
2458	368	60910200189	Davolash ishi-Muborak tumani	\N
2459	368	60910200173	Davolash ishi-Muzrabot tumani	\N
2460	368	60910200190	Davolash ishi-Nishon tumani	\N
2461	368	60910200174	Davolash ishi-Oltinsoy tumani	\N
2462	368	60910200191	Davolash ishi-Qamashi tumani	\N
2463	368	60910200192	Davolash ishi-Qarshi tumani	\N
2464	368	60910200175	Davolash ishi-Qiziriq tumani	\N
2465	368	60910200176	Davolash ishi-Qumqo'rg'on tumani	\N
2466	368	60910200177	Davolash ishi-Sariosiyo tumani	\N
2467	368	60910200193	Davolash ishi-Shahrisabz tumani	\N
2468	368	60910200178	Davolash ishi-Sherobod tumani	\N
2469	368	60910200179	Davolash ishi-Sho'rchi tumani	\N
2470	368	60910200047	Davolash ishi-Termiz shahri	\N
2471	368	60910200180	Davolash ishi-Termiz tumani	\N
2472	368	60910200181	Davolash ishi-Uzun tumani	\N
2473	368	60910200194	Davolash ishi-Yakkabog' tumani	\N
2474	368	60910300	Pediatriya ishi	\N
2475	368	60910300168	Pediatriya ishi-Angor tumani	\N
2476	368	60910300255	Pediatriya ishi-Bandixon tumani	\N
2477	368	60910300170	Pediatriya ishi-Boysun tumani	\N
2478	368	60910300171	Pediatriya ishi-Denov tumani	\N
2479	368	60910300172	Pediatriya ishi-Jarqo'rg'on tumani	\N
2480	368	60910300173	Pediatriya ishi-Muzrabot tumani	\N
2481	368	60910300174	Pediatriya ishi-Oltinsoy tumani	\N
2482	368	60910300175	Pediatriya ishi-Qiziriq tumani	\N
2483	368	60910300176	Pediatriya ishi-Qumqo'rg'on tumani	\N
2484	368	60910300177	Pediatriya ishi-Sariosiyo tumani	\N
2485	368	60910300178	Pediatriya ishi-Sherobod tumani	\N
2486	368	60910300179	Pediatriya ishi-Sho'rchi tumani	\N
2487	368	60910300047	Pediatriya ishi-Termiz shahri	\N
2488	368	60910300180	Pediatriya ishi-Termiz tumani	\N
2489	368	60910300181	Pediatriya ishi-Uzun tumani	\N
2490	368	60911100	Xalq tabobati 	\N
2491	369	60911000	Dori vositalarini standartlashtirish, sertifikatsiyalash va sifat menejmenti	\N
2492	369	60910900	Farmatsevtik biotexnologiya	\N
2493	369	60910700	Farmatsiya (turlari bo‘yicha)	\N
2494	369	60910800	Sanoat farmatsiyasi (turlari bo‘yicha)	\N
2495	370	60710702	Elektr texnikasi, elektr mexanikasi va elektr texnologiyalari (tarmoqlar bo‘yicha)	\N
2496	370	60712000	Elektron apparaturalar ishlab chiqarish texnologiyasi	\N
2497	370	60711200	Elektronika va asbobsozlik (tarmoqlar bo‘yicha)	\N
2498	370	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
2499	370	60710101	Kimyoviy texnologiya (ishlab chiqarish turlari bo‘yicha)	\N
2500	370	60720601	Materialshunoslik va yangi materiallar texnologiyasi (tarmoqlar bo‘yicha)	\N
2501	370	60720701	Texnologik mashinalar va jihozlar (tarmoqlar bo‘yicha)	\N
2502	370	60712503	Transport vositalari muhandisligi (turlari bo‘yicha)	\N
2503	371	60412400	Agrobiznes va investitsion faoliyat	\N
2504	371	60810700	Agrokimyo va agrotuproqshunoslik	\N
2505	371	60810904	Agronomiya (dehqonchilik mahsulotlari turlari bo‘yicha)	\N
2506	371	60710200	Biotexnologiya (tarmoqlar bo‘yicha)	\N
2507	371	60410105	Buxgalteriya hisobi va audit (qishloq xo‘jaligida)	\N
2508	371	60812100	Dorivor o‘simliklarni yetishtirish va qayta ishlash texnologiyasi	\N
2509	371	60710404	Ekologiya va atrof-muhit muhofazasi (qishloq xo‘jaligida)	\N
2510	371	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
2511	371	60812500	Gidrotexnika inshootlari va nasos stansiyalaridan foydalanish	\N
2512	371	60811700	Ipakchilik va tutchilik	\N
2513	371	60310105	Iqtisodiyot: qishloq xo‘jaligi iqtisodiyoti	\N
2514	371	60812000	Issiqxona xo‘jaligini tashkil etish va yuritish	\N
2515	371	60411701	Logistika (agrologistika)	\N
2516	371	60820200	Manzarali bog‘dorchilik va ko‘kalamzorlashtirish	\N
2517	371	60412507	Marketing (qishloq xo‘jaligida)	\N
2518	371	60811800	Mevachilik va uzumchilik	\N
2519	371	60820101	O‘rmonchilik	\N
2520	371	60820102	O‘rmonchilik (o‘rmonchilar va ularning farzandlari uchun)	\N
2521	371	60811102	O‘simliklar va qishloq xo‘jalik mahsulotlari karantini	\N
2522	371	60811001	O‘simliklarni himoya qilish (ekin turlari bo‘yicha)	\N
2523	371	60811400	Organik qishloq xo'jaligi mahsulotlarini yetishtirish, saqlash va qayta ishlash 	\N
2524	371	60112408	Professional ta'lim: agronomiya	\N
2525	371	60810500	Qishloq va suv xo‘jaligida energiya ta’minoti	\N
2526	371	60810300	Qishloq va suv xo‘jaligida texnik servis	\N
2527	371	60811200	Qishloq xo‘jaligi ekinlari seleksiyasi va urug‘chiligi (ekin turlari bo‘yicha)	\N
2528	371	60810200	Qishloq xo‘jaligini elektrlashtirish va avtomatlashtirish	\N
2529	371	60810100	Qishloq xo‘jaligini mexanizatsiyalashtirish	\N
2530	371	60811301	Qishloq xo‘jalik mahsulotlarini saqlash va dastlabki ishlash texnologiyasi (mahsulotlar turlari bo‘yicha)	\N
2531	371	60310502	Raqamli iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
2532	371	60811900	Sabzavotchilik, polizchilik va kartoshkachilik	\N
2533	371	60410600	Sug‘urta ishi	\N
2534	371	60812300	Suv xo‘jaligi va melioratsiya	\N
2535	371	60812400	Suv xo‘jaligi va melioratsiya ishlarini mexanizatsiyalashtirish	\N
2536	371	60711401	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (qishloq xo‘jaligida)	\N
2537	371	60810800	Tuproq bonitirovkasi va yer resurslaridan foydalanish 	\N
2538	371	61010405	Turizm (agroturizm)	\N
2539	371	60840102	Veterinariya meditsinasi (faoliyat turlari bo‘yicha)	\N
2540	371	60810600	Yer kadastri va yerdan foydalanish	\N
2541	371	60420110	Yurisprudensiya (qishloq xo‘jaligi huquqi)	\N
2542	371	60811500	Zooinjeneriya (turlari bo‘yicha)	\N
2543	371	60811503	Zooinjeneriya: asalarichilik	\N
2544	371	60811501	Zooinjeneriya: baliqchilik	\N
2545	372	60810902	Agronomiya (yem-xashak ekinlari)	\N
2546	372	60710200	Biotexnologiya (tarmoqlar bo‘yicha)	\N
2547	372	60410105	Buxgalteriya hisobi va audit (qishloq xo‘jaligida)	\N
2548	372	60811600	Chorvachilik mahsulotlarini qayta ishlash texnologiyasi	\N
2549	372	60812100	Dorivor o‘simliklarni yetishtirish va qayta ishlash texnologiyasi	\N
2550	372	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
2551	372	60811700	Ipakchilik va tutchilik	\N
2552	372	60310105	Iqtisodiyot: qishloq xo‘jaligi iqtisodiyoti	\N
2553	372	60820101	O‘rmonchilik	\N
2554	372	60812202	O‘simlikshunoslik (yaylov cho‘l o‘simlikshunosligi)	\N
2555	372	60811200	Qishloq xo‘jaligi ekinlari seleksiyasi va urug‘chiligi (ekin turlari bo‘yicha)	\N
2556	372	60810100	Qishloq xo‘jaligini mexanizatsiyalashtirish	\N
2557	372	60811301	Qishloq xo‘jalik mahsulotlarini saqlash va dastlabki ishlash texnologiyasi (mahsulotlar turlari bo‘yicha)	\N
2558	372	60711401	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (qishloq xo‘jaligida)	\N
2559	372	60711402	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (tarmoqlar bo‘yicha)	\N
2560	372	60840500	Veterinariya biotexnologiyasi	\N
2561	372	60840300	Veterinariya diagnostikasi va laboratoriya ishlari	\N
2562	372	60840200	Veterinariya farmatsevtikasi	\N
2563	372	60840102	Veterinariya meditsinasi (faoliyat turlari bo‘yicha)	\N
2564	372	60840102005	Veterinariya meditsinasi (faoliyat turlari bo‘yicha)-Buxoro viloyati	\N
2565	372	60840102009	Veterinariya meditsinasi (faoliyat turlari bo‘yicha)-Jizzax viloyati	\N
2566	372	60840102010	Veterinariya meditsinasi (faoliyat turlari bo‘yicha)-Navoiy viloyati	\N
2567	372	60840102008	Veterinariya meditsinasi (faoliyat turlari bo‘yicha)-Qashqadaryo viloyati	\N
2568	372	60840102012	Veterinariya meditsinasi (faoliyat turlari bo‘yicha)-Sirdaryo viloyati	\N
2569	372	60840102007	Veterinariya meditsinasi (faoliyat turlari bo‘yicha)-Surxondaryo viloyati	\N
2570	372	60840400	Veterinariya sanitariya ekspertizasi 	\N
2571	372	60811500	Zooinjeneriya (turlari bo‘yicha)	\N
3253	406	60410500	Bank ishi va auditi	\N
2572	372	60811500005	Zooinjeneriya (turlari bo‘yicha)-Buxoro viloyati	\N
2573	372	60811500009	Zooinjeneriya (turlari bo‘yicha)-Jizzax viloyati	\N
2574	372	60811500010	Zooinjeneriya (turlari bo‘yicha)-Navoiy viloyati	\N
2575	372	60811500008	Zooinjeneriya (turlari bo‘yicha)-Qashqadaryo viloyati	\N
2576	372	60811500012	Zooinjeneriya (turlari bo‘yicha)-Sirdaryo viloyati	\N
2577	372	60811500007	Zooinjeneriya (turlari bo‘yicha)-Surxondaryo viloyati	\N
2578	372	60811505	Zooinjeneriya: qorako‘lchilik	\N
2579	372	60811506	Zooinjeneriya: yilqichilik va tuyachilik	\N
2580	373	60412400	Agrobiznes va investitsion faoliyat	\N
2581	373	60810700	Agrokimyo va agrotuproqshunoslik	\N
2582	373	60810904	Agronomiya (dehqonchilik mahsulotlari turlari bo‘yicha)	\N
2583	373	60610202	Axborot tizimlari va texnologiyalari (qishloq xo‘jaligida raqamli texnologiyalar)	\N
2584	373	60710200	Biotexnologiya (tarmoqlar bo‘yicha)	\N
2585	373	60410105	Buxgalteriya hisobi va audit (qishloq xo‘jaligida)	\N
2586	373	60812100	Dorivor o‘simliklarni yetishtirish va qayta ishlash texnologiyasi	\N
2587	373	60710404	Ekologiya va atrof-muhit muhofazasi (qishloq xo‘jaligida)	\N
2588	373	60811700	Ipakchilik va tutchilik	\N
2589	373	60310105	Iqtisodiyot: qishloq xo‘jaligi iqtisodiyoti	\N
2590	373	60812000	Issiqxona xo‘jaligini tashkil etish va yuritish	\N
2591	373	60411600	Korporativ boshqaruv	\N
2592	373	60411701	Logistika (agrologistika)	\N
2593	373	60820200	Manzarali bog‘dorchilik va ko‘kalamzorlashtirish	\N
2594	373	60412507	Marketing (qishloq xo‘jaligida)	\N
2595	373	60711303	Metrologiya, standartlashtirish va mahsulot sifati menejmenti (tarmoqlar bo‘yicha)	\N
2596	373	60811800	Mevachilik va uzumchilik	\N
2597	373	60711001	Muqobil energiya manbalari (turlari bo‘yicha)	\N
2598	373	60820101	O‘rmonchilik	\N
2599	373	60820102	O‘rmonchilik (o‘rmonchilar va ularning farzandlari uchun)	\N
2600	373	60811102	O‘simliklar va qishloq xo‘jalik mahsulotlari karantini	\N
2601	373	60811001	O‘simliklarni himoya qilish (ekin turlari bo‘yicha)	\N
2602	373	60811400	Organik qishloq xo'jaligi mahsulotlarini yetishtirish, saqlash va qayta ishlash 	\N
2603	373	60720100	Oziq-ovqat texnologiyasi (mahsulot turlari bo‘yicha)	\N
2604	373	60112408	Professional ta'lim: agronomiya	\N
2605	373	60112409	Professional ta'lim: o‘rmonchilik	\N
2606	373	60112412	Professional ta'lim: o‘simliklarni himoya qilish	\N
2607	373	60112410	Professional ta'lim: qishloq xo‘jalik mahsulotlarini saqlash va dastlabki ishlash texnologiyasi	\N
2608	373	60112411	Professional ta'lim: tuproq bonitirovkasi va yer resurslaridan foydalanish	\N
2609	373	60811200	Qishloq xo‘jaligi ekinlari seleksiyasi va urug‘chiligi (ekin turlari bo‘yicha)	\N
2610	373	60810400	Qishloq xo‘jaligida innovatsion texnika va texnologiyalarni qo‘llash	\N
2611	373	60811301	Qishloq xo‘jalik mahsulotlarini saqlash va dastlabki ishlash texnologiyasi (mahsulotlar turlari bo‘yicha)	\N
2612	373	60310502	Raqamli iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
2613	373	60811900	Sabzavotchilik, polizchilik va kartoshkachilik	\N
2614	373	60830100	Suv bioresurslari va akvakultura	\N
2615	373	60711401	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (qishloq xo‘jaligida)	\N
2616	373	60810800	Tuproq bonitirovkasi va yer resurslaridan foydalanish 	\N
2617	373	61010405	Turizm (agroturizm)	\N
2618	373	60840102	Veterinariya meditsinasi (faoliyat turlari bo‘yicha)	\N
2619	373	60420110	Yurisprudensiya (qishloq xo‘jaligi huquqi)	\N
2620	373	60811502	Zooinjeneriya (parrandachilik)	\N
2621	373	60811504	Zooinjeneriya (qoramolchilik)	\N
2622	373	60811503	Zooinjeneriya: asalarichilik	\N
2623	373	60811501	Zooinjeneriya: baliqchilik	\N
2624	373	60811505	Zooinjeneriya: qorako‘lchilik	\N
2625	374	60412400	Agrobiznes va investitsion faoliyat	\N
2626	374	60810700	Agrokimyo va agrotuproqshunoslik	\N
2627	374	60810904	Agronomiya (dehqonchilik mahsulotlari turlari bo‘yicha)	\N
2628	374	60810903	Agronomiya: anorchilik	\N
2629	374	60410105	Buxgalteriya hisobi va audit (qishloq xo‘jaligida)	\N
2630	374	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
2631	374	60812100	Dorivor o‘simliklarni yetishtirish va qayta ishlash texnologiyasi	\N
2632	374	60811700	Ipakchilik va tutchilik	\N
2633	374	60310105	Iqtisodiyot: qishloq xo‘jaligi iqtisodiyoti	\N
2634	374	60812000	Issiqxona xo‘jaligini tashkil etish va yuritish	\N
2635	374	60820200	Manzarali bog‘dorchilik va ko‘kalamzorlashtirish	\N
2636	374	60811800	Mevachilik va uzumchilik	\N
2637	374	60820101	O‘rmonchilik	\N
2638	374	60820102	O‘rmonchilik (o‘rmonchilar va ularning farzandlari uchun)	\N
2639	374	60811102	O‘simliklar va qishloq xo‘jalik mahsulotlari karantini	\N
2640	374	60811001	O‘simliklarni himoya qilish (ekin turlari bo‘yicha)	\N
2641	374	60812203	O‘simlikshunoslik (ekin turlari bo‘yicha)	\N
2642	374	60811200	Qishloq xo‘jaligi ekinlari seleksiyasi va urug‘chiligi (ekin turlari bo‘yicha)	\N
2643	374	60810100	Qishloq xo‘jaligini mexanizatsiyalashtirish	\N
2644	374	60811301	Qishloq xo‘jalik mahsulotlarini saqlash va dastlabki ishlash texnologiyasi (mahsulotlar turlari bo‘yicha)	\N
2645	374	60310502	Raqamli iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
2646	374	60811900	Sabzavotchilik, polizchilik va kartoshkachilik	\N
2647	374	60810800	Tuproq bonitirovkasi va yer resurslaridan foydalanish 	\N
2648	374	60840200	Veterinariya farmatsevtikasi	\N
2649	374	60840102	Veterinariya meditsinasi (faoliyat turlari bo‘yicha)	\N
2650	374	60811500	Zooinjeneriya (turlari bo‘yicha)	\N
2651	375	60712400	Avtomobilsozlik va traktorsozlik	\N
2652	375	60410500	Bank ishi va auditi	\N
2653	375	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
2654	375	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
2655	375	60710602	Elektr energetikasi (tarmoqlar va yo‘nalishlar bo‘yicha)	\N
2656	375	60710702	Elektr texnikasi, elektr mexanikasi va elektr texnologiyalari (tarmoqlar bo‘yicha)	\N
2657	375	60711200	Elektronika va asbobsozlik (tarmoqlar bo‘yicha)	\N
2658	375	60710500	Energetika (tarmoqlar bo‘yicha)	\N
2659	375	60710900	Energiya tejamkorligi va energoaudit	\N
2660	375	60721601	Foydali qazilma konlari geologiyasi, qidiruv va razvedkasi (kon turlari bo‘yicha)	\N
2661	375	60722500	Geodeziya, kartografiya va kadastr (funksiyalari bo‘yicha)	\N
2662	375	60710800	Gidroenergetika	\N
2663	375	60530802	Gidrologiya (tarmoqlar bo‘yicha)	\N
2664	375	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
2665	375	60722803	Kadastr (ko‘chmas mulk kadastri)	\N
2666	375	60710101	Kimyoviy texnologiya (ishlab chiqarish turlari bo‘yicha)	\N
2667	375	60721501	Konchilik ishi (faoliyat turlari bo‘yicha)	\N
2668	375	60411701	Logistika (agrologistika)	\N
2669	375	60722000	Marksheyderlik ishi	\N
2670	375	60720601	Materialshunoslik va yangi materiallar texnologiyasi (tarmoqlar bo‘yicha)	\N
2671	375	61020201	Mehnat muhofazasi va texnika xavfsizligi (tarmoqlar bo‘yicha)	\N
2672	375	60411212	Menejment (tarmoqlar va sohalar bo‘yicha)	\N
2673	375	60711303	Metrologiya, standartlashtirish va mahsulot sifati menejmenti (tarmoqlar bo‘yicha)	\N
2674	375	60711500	Mexatronika va robototexnika	\N
2675	375	60410400	Moliya va moliyaviy texnologiyalar	\N
2676	375	60711001	Muqobil energiya manbalari (turlari bo‘yicha)	\N
2677	375	60721800	Neft va gaz ishi (faoliyat turlari bo‘yicha)	\N
2678	375	60721100	Neft va neft-gazni qayta ishlash texnologiyasi	\N
2679	375	60720900	Neftgazkimyo sanoati texnologiyasi	\N
2680	375	60720100	Oziq-ovqat texnologiyasi (mahsulot turlari bo‘yicha)	\N
2681	375	60112413	Professional ta’lim: qishloq xo‘jaligini mexanizatsiyalashtirish	\N
2682	375	60810400	Qishloq xo‘jaligida innovatsion texnika va texnologiyalarni qo‘llash	\N
2683	375	60810100	Qishloq xo‘jaligini mexanizatsiyalashtirish	\N
2684	375	60811301	Qishloq xo‘jalik mahsulotlarini saqlash va dastlabki ishlash texnologiyasi (mahsulotlar turlari bo‘yicha)	\N
2685	375	60730305	Qurilish muhandisligi: bino va inshootlar qurilishi	\N
2686	375	60730304	Qurilish muhandisligi: neft-gazni qayta ishlash sanoati obyektlari qurilishi	\N
2687	375	60730500	Suv ta’minoti va kanalizatsiya tizimlarini loyihalashtirish va ekspluatatsiyasi	\N
2688	375	60711402	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (tarmoqlar bo‘yicha)	\N
2689	375	60720701	Texnologik mashinalar va jihozlar (tarmoqlar bo‘yicha)	\N
2690	375	60712503	Transport vositalari muhandisligi (turlari bo‘yicha)	\N
2691	376	60610204	Axborot tizimlari va texnologiyalari (tarmoqlar va sohalar bo‘yicha)	\N
2692	376	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
2693	376	60710402	Ekologiya va atrof-muhit muhofazasi (suv xo‘jaligida)	\N
2694	376	60710602	Elektr energetikasi (tarmoqlar va yo‘nalishlar bo‘yicha)	\N
2695	376	60230101	Filologiya va tillarni o‘qitish: ingliz tili	\N
2696	376	60722600	Geodeziya va geoinformatika	\N
2697	376	60710800	Gidroenergetika	\N
2698	376	60530801	Gidrologiya (daryo va suv omborlari gidrologiyasi)	\N
2699	376	60812500	Gidrotexnika inshootlari va nasos stansiyalaridan foydalanish	\N
2700	376	60730901	Gidrotexnika qurilishi (suv xo‘jaligida)	\N
2701	376	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
2702	376	60812700	Irrigatsiya tizimlarida gidroenergetika obyektlari	\N
2703	376	60722802	Kadastr (hududlar davlat kadastri)	\N
2704	376	60720601	Materialshunoslik va yangi materiallar texnologiyasi (tarmoqlar bo‘yicha)	\N
2705	376	61020202	Mehnat muhofazasi va texnika xavfsizligi (suv xo‘jaligida)	\N
2706	376	60812600	Meliorativ gidrogeologiya	\N
2707	376	60711301	Metrologiya, standartlashtirish va mahsulot sifati menejmenti (qishloq va suv xo‘jaligida)	\N
2708	376	60531000	Mexanika va matematik modellashtirish	\N
2709	376	60711500	Mexatronika va robototexnika	\N
2710	376	60711001	Muqobil energiya manbalari (turlari bo‘yicha)	\N
2711	376	60112418	Professional ta'lim: yer kadastri va yer tuzish	\N
2712	376	60112405	Professional ta’lim: suv xo‘jaligi va melioratsiya	\N
2713	376	60810500	Qishloq va suv xo‘jaligida energiya ta’minoti	\N
2714	376	60810300	Qishloq va suv xo‘jaligida texnik servis	\N
2715	376	60810400	Qishloq xo‘jaligida innovatsion texnika va texnologiyalarni qo‘llash	\N
2716	376	60810100	Qishloq xo‘jaligini mexanizatsiyalashtirish	\N
2717	376	60811302	Qishloq xo‘jalik mahsulotlarini saqlash va dastlabki ishlash texnologiyasi (meva-sabzavot)	\N
2718	376	60410800	Statistika (tarmoqlar va sohalar bo‘yicha)	\N
2719	376	60610700	Sun’iy intellekt 	\N
2720	376	60812900	Suv ta’minoti muhandislik tizimlari	\N
2721	376	60812300	Suv xo‘jaligi va melioratsiya	\N
2722	376	60812400	Suv xo‘jaligi va melioratsiya ishlarini mexanizatsiyalashtirish	\N
2723	376	60813000	Suv xo‘jaligida innovatsion texnologiyalar va ulardan foydalanish	\N
2724	376	60722900	Texnika va texnologiyalarning texnik ekspertizasi va marketingi (turlari bo‘yicha)	\N
2725	376	60711404	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (suv xo‘jaligida)	\N
2726	376	61010401	Turizm (faoliyat yo‘nalishlari bo‘yicha )	\N
2727	376	60813100	Yer kadastri va yer tuzish	\N
2728	376	60722700	Yerni masofaviy zondlashda innovatsion texnologiyalar 	\N
2729	376	60420113	Yurisprudensiya: transchegaraviy suv munosabatlari	\N
2730	376	60420112	Yurisprudensiya: yer munosabatlari	\N
2731	377	60211102	Aktyorlik san'ati: dramatik teatr va kino aktyorligi	\N
2732	377	60211103	Aktyorlik san'ati: estrada aktyorligi	\N
2733	377	60211104	Aktyorlik san'ati: musiqali teatr aktyorligi	\N
2734	377	60211101	Aktyorlik san'ati: qo‘g‘irchoq teatri aktyorligi	\N
2735	377	60211700	Grim san'ati	\N
2737	377	60320400	Kutubxona-axborot faoliyati (faoliyat turlari bo‘yicha)	\N
2738	377	60212000	Madaniyat va san’at muassasalarini tashkil etish hamda boshqarish	\N
2739	377	60411205	Menejment: madaniyat va san'at sohasi menejmenti	\N
2740	377	60411204	Menejment: ommaviy tadbirlar menejmenti	\N
2741	377	60112427	Professional ta'lim: xalq ijodiyoti (chog‘u ijrochiligi)	\N
2742	377	60112425	Professional ta'lim: xalq ijodiyoti (vokal ijrochiligi)	\N
2743	377	60723101	Qo'g'irchoqlar ishlab chiqarish texnologiyasi 	\N
2744	377	60211203	Rejissorlik (musiqali teatr rejissorligi)	\N
2745	377	60211205	Rejissorlik: dramatik teatr rejissorligi 	\N
2746	377	60211204	Rejissorlik: estrada va ommaviy tomoshalar rejissorligi	\N
2747	377	60211201	Rejissorlik: kino va televideniye rejissorligi	\N
2748	377	60211202	Rejissorlik: qo‘g‘irchoq teatri rejissorligi	\N
2749	377	60210300	San'atda animatsiyaviy va multimediyaviy loyihalash	\N
2750	377	60211001	San'atshunoslik: kino san'ati tanqidi va tahlili	\N
2751	377	60211003	San'atshunoslik: sahna va ekran san'ati dramaturgiyasi	\N
2752	377	60211005	San'atshunoslik: teatrshunoslik	\N
2753	377	60211800	San’at sohasida prodyuserlik	\N
2754	377	60210101	Texnogen san'at: kino, televideniye va radio ovoz rejissorligi	\N
2755	377	60211901	Xalq ijodiyoti: ashula va raqs	\N
2756	377	60211903	Xalq ijodiyoti: folklor va etnografiya	\N
2757	378	60210900	Bastakorlik san'ati	\N
2758	378	60211520	Cholg‘u ijrochiligi: fortepiano (organ)	\N
2759	378	60211513	Cholg‘u ijrochiligi: puflama va zarbli cholg‘ular (fleyta, goboy)	\N
2760	378	60211524	Cholg‘u ijrochiligi: puflama va zarbli cholg‘ular (klarnet, fagot)	\N
2761	378	60211515	Cholg‘u ijrochiligi: puflama va zarbli cholg‘ular (trombon, tuba)	\N
2762	378	60211518	Cholg‘u ijrochiligi: puflama va zarbli cholg‘ular (valtorna, truba)	\N
2763	378	60211517	Cholg‘u ijrochiligi: puflama va zarbli cholg‘ular (zarbli cholg‘ular)	\N
2764	378	60211502	Cholg‘u ijrochiligi: torli cholg‘ular (skripka, alt)	\N
2765	378	60211521	Cholg‘u ijrochiligi: torli cholg‘ular (violonchel, kontrabas)	\N
2766	378	60211504	Cholg‘u ijrochiligi: Xalq cholg‘ulari (chang)	\N
2767	378	60211507	Cholg‘u ijrochiligi: xalq cholg‘ulari (dutor, dutor bas, dutor kontrabas, tanbur)	\N
2768	378	60211511	Cholg‘u ijrochiligi: xalq cholg‘ulari (g‘ijjak qobus bas, g‘ijjak qobus-kontrabas)	\N
2769	378	60211509	Cholg‘u ijrochiligi: xalq cholg‘ulari (g‘ijjak, g‘ijjak al't)	\N
2770	378	60211505	Cholg‘u ijrochiligi: xalq cholg‘ulari (nay-qo‘shnay, bayan-akkordeyon)	\N
2771	378	60211516	Cholg‘u ijrochiligi: xalq cholg‘ulari (rubob prima, qashqar va afg‘on rubobi)	\N
2772	378	60211506	Cholg‘u ijrochiligi: xalq cholg‘ulari (zarbli cholg‘ular)	\N
2773	378	60211304	Dirijyorlik: akademik xor dirijyorligi	\N
2774	378	60211305	Dirijyorlik: harbiy (damli) orkestr dirijyorligi	\N
2775	378	60211301	Dirijyorlik: opera-simfoniya dirijyorligi	\N
2776	378	60211303	Dirijyorlik: xalq cholg‘ulari orkestri dirijyorligi	\N
2777	378	60112401	Professional ta'lim: cholg‘u ijrochiligi (turlari bo‘yicha)	\N
2778	378	60112414	Professional ta'lim: vokal san'ati (turlari bo'yicha)	\N
2779	378	60211002	San'atshunoslik: musiqashunoslik	\N
2780	378	60210102	Texnogen san'at: musiqiy ovoz rejissorligi	\N
2781	378	60211402	Vokal san'ati: akademik xonandalik	\N
2782	379	60730102	Arxitektura (turlari bo‘yicha)	\N
2783	379	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
2784	379	60710602	Elektr energetikasi (tarmoqlar va yo‘nalishlar bo‘yicha)	\N
2785	379	60710702	Elektr texnikasi, elektr mexanikasi va elektr texnologiyalari (tarmoqlar bo‘yicha)	\N
2786	379	60721601	Foydali qazilma konlari geologiyasi, qidiruv va razvedkasi (kon turlari bo‘yicha)	\N
2787	379	60722500	Geodeziya, kartografiya va kadastr (funksiyalari bo‘yicha)	\N
2788	379	60812500	Gidrotexnika inshootlari va nasos stansiyalaridan foydalanish	\N
2789	379	61020100	Hayotiy faoliyat xavfsizligi	\N
2790	379	60812700	Irrigatsiya tizimlarida gidroenergetika obyektlari	\N
2791	379	60710101	Kimyoviy texnologiya (ishlab chiqarish turlari bo‘yicha)	\N
2792	379	60721900	Konchilik elektr mexanikasi	\N
2793	379	60721501	Konchilik ishi (faoliyat turlari bo‘yicha)	\N
2794	379	60722000	Marksheyderlik ishi	\N
2795	379	60711303	Metrologiya, standartlashtirish va mahsulot sifati menejmenti (tarmoqlar bo‘yicha)	\N
2796	379	60721800	Neft va gaz ishi (faoliyat turlari bo‘yicha)	\N
2797	379	60720100	Oziq-ovqat texnologiyasi (mahsulot turlari bo‘yicha)	\N
2798	379	60730305	Qurilish muhandisligi: bino va inshootlar qurilishi	\N
2799	379	60730303	Qurilish muhandisligi: qurilish materiallari, buyumlari va konstruksiyalarini ishlab chiqarish	\N
2800	379	60812300	Suv xo‘jaligi va melioratsiya	\N
2801	379	60721300	Tabiiy tolalarni dastlabki ishlash texnologiyasi (xomashyo va jarayon turlari bo‘yicha)	\N
2802	379	60711402	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (tarmoqlar bo‘yicha)	\N
2803	379	60720701	Texnologik mashinalar va jihozlar (tarmoqlar bo‘yicha)	\N
2804	379	61040102	Transport logistikasi (avtomobil transporti)	\N
2805	379	60712503	Transport vositalari muhandisligi (turlari bo‘yicha)	\N
2806	379	60721204	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi (ishlab chiqarish turlari bo‘yicha)	\N
2807	379	61040300	Yo‘l harakatini tashkil etish	\N
2808	379	60730804	Yo‘l muhandisligi (sohalar va faoliyat turlari bo‘yicha)	\N
2809	380	60611200	Axborot-kommunikatsiya texnologiyalari sohasida iqtisodiyot va menejment	\N
2810	380	60611300	Axborot-kommunikatsiya texnologiyalari sohasida kasb ta’limi	\N
2811	380	60610300	Axborot xavfsizligi (sohalar bo‘yicha)	\N
2812	380	60610600	Dasturiy injiniring	\N
2813	380	60710602	Elektr energetikasi (tarmoqlar va yo‘nalishlar bo‘yicha)	\N
2814	380	60412800	Elektron tijorat	\N
3254	406	60110900	Biologiya	\N
2815	380	60612000	Infokommunikatsiya injiniringi 	\N
2816	380	60612100	Kiberxavfsizlik injiniringi 	\N
2817	380	60610503	"Kompyuter injiniringi (""Kompyuter injiniringi"", ""AT-servis"", ""Axborot xavfsizligi"", ""Multimedia texnologiyalari"")"	\N
2818	380	60610505	"Kompyuter injiniringi (""Kompyuter injiniringi"", ""AT-servis"", ""Multimedia texnologiyalari"")"	\N
2819	380	60320400	Kutubxona-axborot faoliyati (faoliyat turlari bo‘yicha)	\N
2820	380	60540302	Matematik injiniring (ishlab chiqarish sohalari bo‘yicha)	\N
2821	380	60711500	Mexatronika va robototexnika	\N
2822	380	60611400	Pochta aloqa texnologiyasi	\N
2823	380	60611503	Radioelektron qurilmalar va tizimlar (tarmoqlar bo‘yicha)	\N
2824	380	60310502	Raqamli iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
2825	380	60610700	Sun’iy intellekt 	\N
2826	380	60611002	"Telekommunikatsiya texnologiyalari (“Telekommunikatsiyalar”, ""Teleradioeshittirish"", ""Mobil tizimlar"")"	\N
2827	380	60611100	"Televizion texnologiyalar (""Audiovizual texnologiyalar"", ""Telestudiya tizimlari va ilovalari"")"	\N
2828	381	60211102	Aktyorlik san'ati: dramatik teatr va kino aktyorligi	\N
2829	381	60211104	Aktyorlik san'ati: musiqali teatr aktyorligi	\N
2830	381	60211101	Aktyorlik san'ati: qo‘g‘irchoq teatri aktyorligi	\N
2831	381	60211520	Cholg‘u ijrochiligi: fortepiano (organ)	\N
2832	381	60320400	Kutubxona-axborot faoliyati (faoliyat turlari bo‘yicha)	\N
2833	381	60112427	Professional ta'lim: xalq ijodiyoti (chog‘u ijrochiligi)	\N
2834	381	60723101	Qo'g'irchoqlar ishlab chiqarish texnologiyasi 	\N
2835	381	60211401	Vokal san'ati: an'anaviy xonandalik	\N
2836	381	60211901	Xalq ijodiyoti: ashula va raqs	\N
2837	381	60211602	Xoreografiya (turlari bo‘yicha)	\N
2838	382	60910200	Davolash ishi	\N
2839	382	60910200058	Davolash ishi-Angren shahri	\N
2840	382	60910200059	Davolash ishi-Bekobod shahri	\N
2841	382	60910200237	Davolash ishi-Bekobod tumani	\N
2842	382	60910200238	Davolash ishi-Bo'ka tumani	\N
2843	382	60910200239	Davolash ishi-Bo'stonliq tumani	\N
2844	382	60910200240	Davolash ishi-Chinoz tumani	\N
2845	382	60910200060	Davolash ishi-Chirchiq shahri	\N
2846	382	60910200254	Davolash ishi-Nurafshon shahri	\N
2847	382	60910200243	Davolash ishi-O'rtachirchiq tumani	\N
2848	382	60910200061	Davolash ishi-Ohangaron shahri	\N
2849	382	60910200241	Davolash ishi-Ohangaron tumani	\N
2850	382	60910200062	Davolash ishi-Olmaliq shahri	\N
2851	382	60910200242	Davolash ishi-Oqqo'rg'on tumani	\N
2852	382	60910200244	Davolash ishi-Parkent tumani	\N
2853	382	60910200245	Davolash ishi-Piskent tumani	\N
2854	382	60910200246	Davolash ishi-Qibray tumani	\N
2855	382	60910200247	Davolash ishi-Quyichirchiq tumani	\N
2856	382	60910200248	Davolash ishi-Toshkent tumani	\N
2857	382	60910200063	Davolash ishi-Yangiyo'l shahri	\N
2858	382	60910200249	Davolash ishi-Yangiyo'l tumani	\N
2859	382	60910200250	Davolash ishi-Yuqorichirchiq tumani	\N
2860	382	60910200251	Davolash ishi-Zangiota tumani	\N
2861	382	60111900	Maktabgacha va boshlang‘ich ta'limda jismoniy tarbiya va sport	\N
2862	382	60412506	Marketing (sport marketingi)	\N
2863	382	60411210	Menejment (jismoniy tarbiya va sport menejmenti)	\N
2864	382	60411211	Menejment (sport tadbirlarini tashkil etish va boshqarish)	\N
2865	382	60310904	Psixologiya: sport psixologiyasi	\N
2866	382	61010334	Sport faoliyati: badiiy gimnastika	\N
2867	382	61010329	Sport faoliyati: badminton	\N
2868	382	61010328	Sport faoliyati: basketbol	\N
2869	382	61010327	Sport faoliyati: belbog‘li kurash	\N
2870	382	61010326	Sport faoliyati: biatlon	\N
2871	382	61010341	Sport faoliyati: boks	\N
2872	382	61010318	Sport faoliyati: chim ustida xokkey	\N
2873	382	61010348	Sport faoliyati: dzyudo	\N
2874	382	61010320	Sport faoliyati: erkin kurash	\N
2875	382	61010321	Sport faoliyati: eshkak eshish	\N
2876	382	61010305	Sport faoliyati: figurali uchish	\N
2877	382	61010304	Sport faoliyati: futbol	\N
2878	382	61010349	Sport faoliyati: gimnastika	\N
2879	382	61010346	Sport faoliyati: kamondan otish	\N
2880	382	61010345	Sport faoliyati: karate VKF	\N
2881	382	61010344	Sport faoliyati: kikboksing	\N
2882	382	61010342	Sport faoliyati: kurash	\N
2883	382	61010340	Sport faoliyati: minifutbol	\N
2884	382	61010339	Sport faoliyati: og‘ir atletika	\N
2885	382	61010338	Sport faoliyati: ot sporti	\N
2886	382	61010335	Sport faoliyati: qilichbozlik	\N
2887	382	61010350	Sport faoliyati: qo‘l to‘pi	\N
2888	382	61010337	Sport faoliyati: regbi	\N
2889	382	61010336	Sport faoliyati: sambo	\N
2890	382	61010319	Sport faoliyati: shaxmat	\N
2891	382	61010317	Sport faoliyati: sinxron suzish	\N
2892	382	61010343	Sport faoliyati: stol tennisi	\N
2893	382	61010325	Sport faoliyati: suzish	\N
2894	382	61010309	Sport faoliyati: taekvondo WTF	\N
2895	382	61010311	Sport faoliyati: tennis	\N
2896	382	61010307	Sport faoliyati: tog‘ chang‘isi	\N
2897	382	61010306	Sport faoliyati: triatlon	\N
2898	382	61010330	Sport faoliyati: velosport	\N
2899	382	61010332	Sport faoliyati: voleybol	\N
2900	382	61010303	Sport faoliyati: xokkey	\N
2901	382	61010302	Sport faoliyati: xotin-qizlar sportini rivojlantirish (boks)	\N
2902	382	61010301	Sport faoliyati: xotin-qizlar sportini rivojlantirish (dzyudo)	\N
2903	382	61010316	Sport faoliyati: xotin-qizlar sportini rivojlantirish (futbol)	\N
2904	382	61010312	Sport faoliyati: xotin-qizlar sportini rivojlantirish (karate VKF)	\N
2905	382	61010313	Sport faoliyati: xotin-qizlar sportini rivojlantirish (kurash)	\N
2906	382	61010310	Sport faoliyati: xotin-qizlar sportini rivojlantirish (shaxmat)	\N
2907	382	61010314	Sport faoliyati: xotin-qizlar sportini rivojlantirish (stol tennisi)	\N
2908	382	61010315	Sport faoliyati: xotin-qizlar sportini rivojlantirish (taekvondo WTF)	\N
2909	382	61010323	Sport faoliyati: xotin-qizlar sportini rivojlantirish (tennis)	\N
2910	382	61010308	Sport faoliyati: xotin-qizlar sportini rivojlantirish (yengil atletika)	\N
2911	382	61010347	Sport faoliyati: yengil atletika	\N
2912	382	61010322	Sport faoliyati: yunon-rum kurashi	\N
2913	382	61010403	Turizm (sport turizmi)	\N
2914	384	60421200	Davlat boshqaruvi 	\N
2915	384	60420107	Yurisprudensiya (faoliyat turlari bo‘yicha)	\N
2916	384	60420104	Yurisprudensiya : biznes huquqi	\N
2917	384	60420105	Yurisprudensiya: davlat-huquqiy faoliyat	\N
2918	384	60420106	Yurisprudensiya: jinoyat-huquqiy faoliyat	\N
2919	384	60420109	Yurisprudensiya: xalqaro huquq va qiyosiy huquqshunoslik	\N
2920	385	61010200	Aholi va turistlarning ovqatlanishini tashkil etish servisi	\N
2921	385	60412700	Baholash ishi	\N
2922	385	60410500	Bank ishi va auditi	\N
2923	385	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
2924	385	60411400	Inson resurslarini boshqarish	\N
2925	385	60310400	Iqtisodiy xavfsizlik	\N
2926	385	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
2927	385	60411703	Logistika (yo‘nalishlar bo‘yicha)	\N
2928	385	60412505	Marketing (tarmoqlar va sohalar bo‘yicha)	\N
2929	385	61010100	Mehmonxona xo‘jaligini tashkil etish va boshqarish	\N
2930	385	60411212	Menejment (tarmoqlar va sohalar bo‘yicha)	\N
2931	385	60410400	Moliya va moliyaviy texnologiyalar	\N
2932	385	61010401	Turizm (faoliyat yo‘nalishlari bo‘yicha )	\N
2933	386	60412400	Agrobiznes va investitsion faoliyat	\N
2934	386	60810700	Agrokimyo va agrotuproqshunoslik	\N
2935	386	60810904	Agronomiya (dehqonchilik mahsulotlari turlari bo‘yicha)	\N
2936	386	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
2937	386	60812100	Dorivor o‘simliklarni yetishtirish va qayta ishlash texnologiyasi	\N
2938	386	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
2939	386	60812500	Gidrotexnika inshootlari va nasos stansiyalaridan foydalanish	\N
2940	386	60811700	Ipakchilik va tutchilik	\N
2941	386	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
2942	386	60812000	Issiqxona xo‘jaligini tashkil etish va yuritish	\N
2943	386	60411701	Logistika (agrologistika)	\N
2944	386	60820200	Manzarali bog‘dorchilik va ko‘kalamzorlashtirish	\N
2945	386	60412507	Marketing (qishloq xo‘jaligida)	\N
2946	386	60811800	Mevachilik va uzumchilik	\N
2947	386	60820101	O‘rmonchilik	\N
2948	386	60820102	O‘rmonchilik (o‘rmonchilar va ularning farzandlari uchun)	\N
2949	386	60811102	O‘simliklar va qishloq xo‘jalik mahsulotlari karantini	\N
2950	386	60811001	O‘simliklarni himoya qilish (ekin turlari bo‘yicha)	\N
2951	386	60811200	Qishloq xo‘jaligi ekinlari seleksiyasi va urug‘chiligi (ekin turlari bo‘yicha)	\N
2952	386	60810100	Qishloq xo‘jaligini mexanizatsiyalashtirish	\N
2953	386	60811301	Qishloq xo‘jalik mahsulotlarini saqlash va dastlabki ishlash texnologiyasi (mahsulotlar turlari bo‘yicha)	\N
2954	386	60811900	Sabzavotchilik, polizchilik va kartoshkachilik	\N
2955	386	60812300	Suv xo‘jaligi va melioratsiya	\N
2956	386	60711401	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (qishloq xo‘jaligida)	\N
2957	386	60840101	Veterinariya meditsinasi (yirik shoxli mollar kasalliklari)	\N
2958	386	60810600	Yer kadastri va yerdan foydalanish	\N
2959	386	60420110	Yurisprudensiya (qishloq xo‘jaligi huquqi)	\N
2960	386	60811500	Zooinjeneriya (turlari bo‘yicha)	\N
2961	386	60811501	Zooinjeneriya: baliqchilik	\N
2962	386	60811505	Zooinjeneriya: qorako‘lchilik	\N
2963	386	60811506	Zooinjeneriya: yilqichilik va tuyachilik	\N
2964	387	60810902	Agronomiya (yem-xashak ekinlari)	\N
2965	387	60710200	Biotexnologiya (tarmoqlar bo‘yicha)	\N
2966	387	60410105	Buxgalteriya hisobi va audit (qishloq xo‘jaligida)	\N
2967	387	60811600	Chorvachilik mahsulotlarini qayta ishlash texnologiyasi	\N
2968	387	60812100	Dorivor o‘simliklarni yetishtirish va qayta ishlash texnologiyasi	\N
2969	387	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
2970	387	60811700	Ipakchilik va tutchilik	\N
2971	387	60310105	Iqtisodiyot: qishloq xo‘jaligi iqtisodiyoti	\N
2972	387	60820101	O‘rmonchilik	\N
2973	387	60812202	O‘simlikshunoslik (yaylov cho‘l o‘simlikshunosligi)	\N
2974	387	60811200	Qishloq xo‘jaligi ekinlari seleksiyasi va urug‘chiligi (ekin turlari bo‘yicha)	\N
2975	387	60840300	Veterinariya diagnostikasi va laboratoriya ishlari	\N
2976	387	60840200	Veterinariya farmatsevtikasi	\N
2977	387	60840102	Veterinariya meditsinasi (faoliyat turlari bo‘yicha)	\N
2978	387	60840400	Veterinariya sanitariya ekspertizasi 	\N
2979	387	60811500	Zooinjeneriya (turlari bo‘yicha)	\N
2980	387	60811506	Zooinjeneriya: yilqichilik va tuyachilik	\N
2981	388	60611300	Axborot-kommunikatsiya texnologiyalari sohasida kasb ta’limi	\N
2982	388	60610300	Axborot xavfsizligi (sohalar bo‘yicha)	\N
2983	388	60610600	Dasturiy injiniring	\N
2984	388	60610503	"Kompyuter injiniringi (""Kompyuter injiniringi"", ""AT-servis"", ""Axborot xavfsizligi"", ""Multimedia texnologiyalari"")"	\N
2985	388	60610505	"Kompyuter injiniringi (""Kompyuter injiniringi"", ""AT-servis"", ""Multimedia texnologiyalari"")"	\N
2986	388	60610501	Kompyuter injiniringi: “Kompyuter injiniringi”	\N
2987	388	60610504	Kompyuter injiniringi: AT-Servis	\N
2988	388	60610502	Kompyuter injiniringi: multimedia texnologiyalari	\N
2989	388	60320400	Kutubxona-axborot faoliyati (faoliyat turlari bo‘yicha)	\N
2990	388	60611400	Pochta aloqa texnologiyasi	\N
2991	388	60310502	Raqamli iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
2992	388	60611002	"Telekommunikatsiya texnologiyalari (“Telekommunikatsiyalar”, ""Teleradioeshittirish"", ""Mobil tizimlar"")"	\N
2993	389	60611300	Axborot-kommunikatsiya texnologiyalari sohasida kasb ta’limi	\N
2994	389	60610300	Axborot xavfsizligi (sohalar bo‘yicha)	\N
2995	389	60610600	Dasturiy injiniring	\N
2996	389	60610503	"Kompyuter injiniringi (""Kompyuter injiniringi"", ""AT-servis"", ""Axborot xavfsizligi"", ""Multimedia texnologiyalari"")"	\N
2997	389	60611400	Pochta aloqa texnologiyasi	\N
2998	389	60310502	Raqamli iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
2999	389	60611002	"Telekommunikatsiya texnologiyalari (“Telekommunikatsiyalar”, ""Teleradioeshittirish"", ""Mobil tizimlar"")"	\N
3000	390	60611300	Axborot-kommunikatsiya texnologiyalari sohasida kasb ta’limi	\N
3001	390	60610300	Axborot xavfsizligi (sohalar bo‘yicha)	\N
3002	390	60610600	Dasturiy injiniring	\N
3003	390	60610503	"Kompyuter injiniringi (""Kompyuter injiniringi"", ""AT-servis"", ""Axborot xavfsizligi"", ""Multimedia texnologiyalari"")"	\N
3004	390	60320400	Kutubxona-axborot faoliyati (faoliyat turlari bo‘yicha)	\N
3005	390	60611400	Pochta aloqa texnologiyasi	\N
3006	390	60611002	"Telekommunikatsiya texnologiyalari (“Telekommunikatsiyalar”, ""Teleradioeshittirish"", ""Mobil tizimlar"")"	\N
3007	391	60611300	Axborot-kommunikatsiya texnologiyalari sohasida kasb ta’limi	\N
3008	391	60610300	Axborot xavfsizligi (sohalar bo‘yicha)	\N
3009	391	60610600	Dasturiy injiniring	\N
3010	391	60610503	"Kompyuter injiniringi (""Kompyuter injiniringi"", ""AT-servis"", ""Axborot xavfsizligi"", ""Multimedia texnologiyalari"")"	\N
3011	391	60610501	Kompyuter injiniringi: “Kompyuter injiniringi”	\N
3012	391	60610504	Kompyuter injiniringi: AT-Servis	\N
3013	391	60610502	Kompyuter injiniringi: multimedia texnologiyalari	\N
3014	391	60310502	Raqamli iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
3015	391	60611001	Telekommunikatsiya texnologiyalari (“Telekommunikatsiyalar”)	\N
3016	391	60611002	"Telekommunikatsiya texnologiyalari (“Telekommunikatsiyalar”, ""Teleradioeshittirish"", ""Mobil tizimlar"")"	\N
3017	392	60611300	Axborot-kommunikatsiya texnologiyalari sohasida kasb ta’limi	\N
3018	392	60610300	Axborot xavfsizligi (sohalar bo‘yicha)	\N
3019	392	60610600	Dasturiy injiniring	\N
3020	392	60610501	Kompyuter injiniringi: “Kompyuter injiniringi”	\N
3021	392	60610504	Kompyuter injiniringi: AT-Servis	\N
3022	392	60611400	Pochta aloqa texnologiyasi	\N
3023	392	60310502	Raqamli iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
3024	392	60611001	Telekommunikatsiya texnologiyalari (“Telekommunikatsiyalar”)	\N
3025	393	60211103	Aktyorlik san'ati: estrada aktyorligi	\N
3026	393	60211104	Aktyorlik san'ati: musiqali teatr aktyorligi	\N
3027	393	60211101	Aktyorlik san'ati: qo‘g‘irchoq teatri aktyorligi	\N
3028	393	60320400	Kutubxona-axborot faoliyati (faoliyat turlari bo‘yicha)	\N
3029	393	60212000	Madaniyat va san’at muassasalarini tashkil etish hamda boshqarish	\N
3030	393	60112427	Professional ta'lim: xalq ijodiyoti (chog‘u ijrochiligi)	\N
3031	393	60112425	Professional ta'lim: xalq ijodiyoti (vokal ijrochiligi)	\N
3032	393	60211204	Rejissorlik: estrada va ommaviy tomoshalar rejissorligi	\N
3033	393	60211003	San'atshunoslik: sahna va ekran san'ati dramaturgiyasi	\N
3034	393	60211005	San'atshunoslik: teatrshunoslik	\N
3035	393	60210101	Texnogen san'at: kino, televideniye va radio ovoz rejissorligi	\N
3036	393	60211902	Xalq ijodiyoti (baxshichilik va dostonchilik)	\N
3037	393	60211901	Xalq ijodiyoti: ashula va raqs	\N
3038	393	60211903	Xalq ijodiyoti: folklor va etnografiya	\N
3039	394	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
3040	394	60710602	Elektr energetikasi (tarmoqlar va yo‘nalishlar bo‘yicha)	\N
3041	394	60722600	Geodeziya va geoinformatika	\N
3042	394	60530801	Gidrologiya (daryo va suv omborlari gidrologiyasi)	\N
3043	394	60812500	Gidrotexnika inshootlari va nasos stansiyalaridan foydalanish	\N
3044	394	60730901	Gidrotexnika qurilishi (suv xo‘jaligida)	\N
3045	394	60730902	Gidrotexnika qurilishi (turlari bo‘yicha)	\N
3046	394	60812600	Meliorativ gidrogeologiya	\N
3047	394	60810100	Qishloq xo‘jaligini mexanizatsiyalashtirish	\N
3048	394	60812900	Suv ta’minoti muhandislik tizimlari	\N
3049	394	60812300	Suv xo‘jaligi va melioratsiya	\N
3050	394	60812400	Suv xo‘jaligi va melioratsiya ishlarini mexanizatsiyalashtirish	\N
3051	394	60813000	Suv xo‘jaligida innovatsion texnologiyalar va ulardan foydalanish	\N
3052	394	60711402	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (tarmoqlar bo‘yicha)	\N
3053	394	60813100	Yer kadastri va yer tuzish	\N
3054	395	60320200	Axborot xizmati va jamoatchilik bilan aloqalar	\N
3055	395	60210403	Dizayn: (mediadizayn)	\N
3056	395	60320102	Jurnalistika: bosma ommaviy axborot vositalari jurnalistikasi	\N
3057	395	60320109	Jurnalistika: harbiy jurnalistika	\N
3058	395	60320104	Jurnalistika: internet jurnalistika	\N
3059	395	60320103	Jurnalistika: iqtisodiy jurnalistika	\N
3060	395	60320106	Jurnalistika: san'at jurnalistikasi	\N
3061	395	60320105	Jurnalistika: sayohat jurnalistikasi	\N
3062	395	60320110	Jurnalistika: sport jurnalistikasi	\N
3063	395	60320107	Jurnalistika: teleradio jurnalistikasi	\N
3064	395	60320101	Jurnalistika: xalqaro jurnalistika	\N
3065	395	60412502	Marketing (mediamarketing va reklama)	\N
3066	395	60411207	Menejment (mediamenejment)	\N
3067	395	60310901	Psixologiya: amaliy psixologiya	\N
3068	395	60310700	Siyosatshunoslik	\N
3069	395	60311000	Sotsiologiya	\N
3070	395	60310800	Xalqaro munosabatlar	\N
3071	396	60220400	Arxeologiya	\N
3072	396	61010505	Gid hamrohligi va tarjimonlik faoliyati: ingliz tili	\N
3073	396	60411702	Logistika (turizm logistikasi)	\N
3074	396	60212200	Madaniy meros obyektlarini asrash 	\N
3075	396	61010100	Mehmonxona xo‘jaligini tashkil etish va boshqarish	\N
3076	396	60411212	Menejment (tarmoqlar va sohalar bo‘yicha)	\N
3077	396	60411202	Menejment: mehmonxonalarni boshqarish	\N
3078	396	60411204	Menejment: ommaviy tadbirlar menejmenti	\N
3079	396	60411203	Menejment: turizm biznesini boshqarish	\N
3080	396	60212101	Muzeyshunoslik (turlari bo‘yicha)	\N
3081	396	61010401	Turizm (faoliyat yo‘nalishlari bo‘yicha )	\N
3082	397	60811600	Chorvachilik mahsulotlarini qayta ishlash texnologiyasi	\N
3083	397	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
3084	397	60710602	Elektr energetikasi (tarmoqlar va yo‘nalishlar bo‘yicha)	\N
3085	397	60722600	Geodeziya va geoinformatika	\N
3086	397	60812500	Gidrotexnika inshootlari va nasos stansiyalaridan foydalanish	\N
3087	397	60730902	Gidrotexnika qurilishi (turlari bo‘yicha)	\N
3088	397	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
3089	397	60112418	Professional ta'lim: yer kadastri va yer tuzish	\N
3090	397	60112405	Professional ta’lim: suv xo‘jaligi va melioratsiya	\N
3091	397	60810100	Qishloq xo‘jaligini mexanizatsiyalashtirish	\N
3092	397	60811301	Qishloq xo‘jalik mahsulotlarini saqlash va dastlabki ishlash texnologiyasi (mahsulotlar turlari bo‘yicha)	\N
3093	397	60812300	Suv xo‘jaligi va melioratsiya	\N
3094	397	60711402	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (tarmoqlar bo‘yicha)	\N
3095	397	60813100	Yer kadastri va yer tuzish	\N
3096	398	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
3097	398	60840300	Veterinariya diagnostikasi va laboratoriya ishlari	\N
3098	398	60840200	Veterinariya farmatsevtikasi	\N
3099	398	60840102	Veterinariya meditsinasi (faoliyat turlari bo‘yicha)	\N
3100	398	60840400	Veterinariya sanitariya ekspertizasi 	\N
3101	398	60811500	Zooinjeneriya (turlari bo‘yicha)	\N
3102	398	60811505	Zooinjeneriya: qorako‘lchilik	\N
3103	398	60811506	Zooinjeneriya: yilqichilik va tuyachilik	\N
3104	399	60111900	Maktabgacha va boshlang‘ich ta'limda jismoniy tarbiya va sport	\N
3105	399	60310904	Psixologiya: sport psixologiyasi	\N
3106	399	61010334	Sport faoliyati: badiiy gimnastika	\N
3107	399	61010329	Sport faoliyati: badminton	\N
3108	399	61010328	Sport faoliyati: basketbol	\N
3109	399	61010341	Sport faoliyati: boks	\N
3110	399	61010348	Sport faoliyati: dzyudo	\N
3111	399	61010320	Sport faoliyati: erkin kurash	\N
3112	399	61010321	Sport faoliyati: eshkak eshish	\N
3113	399	61010304	Sport faoliyati: futbol	\N
3114	399	61010342	Sport faoliyati: kurash	\N
3115	399	61010339	Sport faoliyati: og‘ir atletika	\N
3116	399	61010335	Sport faoliyati: qilichbozlik	\N
3117	399	61010350	Sport faoliyati: qo‘l to‘pi	\N
3118	399	61010319	Sport faoliyati: shaxmat	\N
3119	399	61010325	Sport faoliyati: suzish	\N
3120	399	61010330	Sport faoliyati: velosport	\N
3121	399	61010332	Sport faoliyati: voleybol	\N
3122	399	61010347	Sport faoliyati: yengil atletika	\N
3123	399	61010322	Sport faoliyati: yunon-rum kurashi	\N
3124	400	60420102	Yurisprudensiya (huquqbuzarliklar profilaktikasi va jamoat xavfsizligini ta'minlash) - ayollar uchun	\N
3125	400	60420101	Yurisprudensiya (huquqbuzarliklar profilaktikasi va jamoat xavfsizligini ta'minlash) - erkaklar uchun	\N
3126	401	60540200	Amaliy matematika	\N
3127	401	60610204	Axborot tizimlari va texnologiyalari (tarmoqlar va sohalar bo‘yicha)	\N
3128	401	60610300	Axborot xavfsizligi (sohalar bo‘yicha)	\N
3129	401	60710200	Biotexnologiya (tarmoqlar bo‘yicha)	\N
3130	401	60230101	Filologiya va tillarni o‘qitish: ingliz tili	\N
3131	401	60920101	Ijtimoiy ish (fuqarolarning o‘z-o‘zini boshqarish organlari)	\N
3132	401	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
3133	401	60610100	Kompyuter ilmlari va dasturlash texnologiyalari (yo‘nalishlar bo‘yicha)	\N
3134	401	60310901	Psixologiya: amaliy psixologiya	\N
3135	401	60310906	Psixologiya: oila psixologiyasi	\N
3136	401	60310902	Psixologiya: yoshlar psixologiyasi	\N
3137	402	60710602	Elektr energetikasi (tarmoqlar va yo‘nalishlar bo‘yicha)	\N
3138	402	60710101	Kimyoviy texnologiya (ishlab chiqarish turlari bo‘yicha)	\N
3139	402	60710104	Kimyoviy texnologiya: noorganik moddalar kimyoviy texnologiyasi	\N
3140	402	60710103	Kimyoviy texnologiya: qurilish materiallari kimyoviy texnologiyasi	\N
3141	402	60720400	Konservalash texnologiyasi	\N
3142	402	60411212	Menejment (tarmoqlar va sohalar bo‘yicha)	\N
3143	402	60720900	Neftgazkimyo sanoati texnologiyasi	\N
3144	402	60720100	Oziq-ovqat texnologiyasi (mahsulot turlari bo‘yicha)	\N
3145	402	60711402	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (tarmoqlar bo‘yicha)	\N
3146	402	60720701	Texnologik mashinalar va jihozlar (tarmoqlar bo‘yicha)	\N
3147	403	60110900	Biologiya	\N
3148	403	60110500	Boshlang‘ich ta’lim	\N
3149	403	60110700	Fizika va astronomiya	\N
3150	403	60111000	Geografiya va iqtisodiy bilim asoslari	\N
3151	403	60112200	Jismoniy madaniyat	\N
3152	403	60112201	Jismoniy madaniyat (xotin-qizlar sporti yo‘nalishi bo‘yicha)	\N
3153	403	60110800	Kimyo	\N
3154	403	60110200	Maktabgacha ta’lim	\N
3155	403	60110300	Maktabgacha ta’lim psixologiyasi va pedagogikasi	\N
3156	403	60111900	Maktabgacha va boshlang‘ich ta'limda jismoniy tarbiya va sport	\N
3157	403	60110600	Matematika va informatika	\N
3158	403	60112100	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi	\N
3159	403	60111300	Musiqa ta'limi	\N
3160	403	60111400	O‘zbek tili va adabiyoti	\N
3161	403	60111503	Ona tili va adabiyot: qirg‘iz tili va adabiyot	\N
3162	403	60110100	Pedagogika	\N
3163	403	60111100	Tarix	\N
3164	403	60111200	Tasviriy san'at va muhandislik grafikasi  	\N
3165	403	60112300	Texnologik ta’lim	\N
3166	404	60110900	Biologiya	\N
3167	404	60110900147	Biologiya-G'ijduvon tumani	\N
3168	404	60110900154	Biologiya-Romitan tumani	\N
3169	404	60110500	Boshlang‘ich ta’lim	\N
3170	404	60110500154	Boshlang‘ich ta’lim-Romitan tumani	\N
3171	404	60110500155	Boshlang‘ich ta’lim-Shofirkon tumani	\N
3172	404	60112000	Chaqiriqqacha harbiy ta’lim	\N
3173	404	60112000154	Chaqiriqqacha harbiy ta’lim-Romitan tumani	\N
3174	404	60110700	Fizika va astronomiya	\N
3175	404	60110700154	Fizika va astronomiya-Romitan tumani	\N
3176	404	60110700155	Fizika va astronomiya-Shofirkon tumani	\N
3177	404	60111000	Geografiya va iqtisodiy bilim asoslari	\N
3178	404	60111000154	Geografiya va iqtisodiy bilim asoslari-Romitan tumani	\N
3179	404	60111000155	Geografiya va iqtisodiy bilim asoslari-Shofirkon tumani	\N
3180	404	60112200	Jismoniy madaniyat	\N
3181	404	60112201	Jismoniy madaniyat (xotin-qizlar sporti yo‘nalishi bo‘yicha)	\N
3182	404	60110800	Kimyo	\N
3183	404	60110800147	Kimyo-G'ijduvon tumani	\N
3184	404	60110800154	Kimyo-Romitan tumani	\N
3185	404	60110800155	Kimyo-Shofirkon tumani	\N
3186	404	60110200	Maktabgacha ta’lim	\N
3187	404	60110300	Maktabgacha ta’lim psixologiyasi va pedagogikasi	\N
3188	404	60111900	Maktabgacha va boshlang‘ich ta'limda jismoniy tarbiya va sport	\N
3189	404	60112600	Maktabgacha va boshlang‘ich ta’limda xorijiy til (ingliz tili)	\N
3190	404	60110600	Matematika va informatika	\N
3191	404	60110600154	Matematika va informatika-Romitan tumani	\N
3192	404	60110600155	Matematika va informatika-Shofirkon tumani	\N
3193	404	60112100	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi	\N
3194	404	60112100154	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi-Romitan tumani	\N
3195	404	60111300	Musiqa ta'limi	\N
3196	404	60111400	O‘zbek tili va adabiyoti	\N
3197	404	60111400155	O‘zbek tili va adabiyoti-Shofirkon tumani	\N
3198	404	60111701	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)	\N
3199	404	60111701147	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-G'ijduvon tumani	\N
3200	404	60111701151	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Peshku tumani	\N
3201	404	60111701154	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Romitan tumani	\N
3202	404	60111701155	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Shofirkon tumani	\N
3203	404	60110100	Pedagogika	\N
3204	404	60111100	Tarix	\N
3205	404	60111100147	Tarix-G'ijduvon tumani	\N
3206	404	60111100155	Tarix-Shofirkon tumani	\N
3207	404	60111200	Tasviriy san'at va muhandislik grafikasi  	\N
3208	404	60112300	Texnologik ta’lim	\N
3209	404	60111804	Xorijiy til va adabiyoti: ingliz tili	\N
3210	404	60111804147	Xorijiy til va adabiyoti: ingliz tili-G'ijduvon tumani	\N
3211	404	60111804151	Xorijiy til va adabiyoti: ingliz tili-Peshku tumani	\N
3212	404	60111804154	Xorijiy til va adabiyoti: ingliz tili-Romitan tumani	\N
3213	404	60111804155	Xorijiy til va adabiyoti: ingliz tili-Shofirkon tumani	\N
3214	405	60110900	Biologiya	\N
3215	405	60110500	Boshlang‘ich ta’lim	\N
3216	405	60110500185	Boshlang‘ich ta’lim-Kasbi tumani	\N
3217	405	60110500186	Boshlang‘ich ta’lim-Kitob tumani	\N
3218	405	60110500188	Boshlang‘ich ta’lim-Mirishkor tumani	\N
3219	405	60110500190	Boshlang‘ich ta’lim-Nishon tumani	\N
3220	405	60110500193	Boshlang‘ich ta’lim-Shahrisabz tumani	\N
3221	405	60110500194	Boshlang‘ich ta’lim-Yakkabog' tumani	\N
3222	405	60110700	Fizika va astronomiya	\N
3223	405	60111000	Geografiya va iqtisodiy bilim asoslari	\N
3224	405	60111000186	Geografiya va iqtisodiy bilim asoslari-Kitob tumani	\N
3225	405	60111000194	Geografiya va iqtisodiy bilim asoslari-Yakkabog' tumani	\N
3226	405	60112200	Jismoniy madaniyat	\N
3227	405	60112201	Jismoniy madaniyat (xotin-qizlar sporti yo‘nalishi bo‘yicha)	\N
3228	405	60110200	Maktabgacha ta’lim	\N
3229	405	60110600	Matematika va informatika	\N
3230	405	60110600182	Matematika va informatika-Chiroqchi tumani	\N
3231	405	60110600193	Matematika va informatika-Shahrisabz tumani	\N
3232	405	60110600194	Matematika va informatika-Yakkabog' tumani	\N
3233	405	60112100	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi	\N
3234	405	60112100193	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi-Shahrisabz tumani	\N
3235	405	60111300	Musiqa ta'limi	\N
3236	405	60111400	O‘zbek tili va adabiyoti	\N
3237	405	60111701	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)	\N
3238	405	60111701182	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Chiroqchi tumani	\N
3239	405	60111701186	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Kitob tumani	\N
3240	405	60111701193	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Shahrisabz tumani	\N
3241	405	60111701194	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Yakkabog' tumani	\N
3242	405	60110100	Pedagogika	\N
3243	405	60111100	Tarix	\N
3244	405	60111200	Tasviriy san'at va muhandislik grafikasi  	\N
3245	405	60112300	Texnologik ta’lim	\N
3246	405	60111804	Xorijiy til va adabiyoti: ingliz tili	\N
3247	405	60111804182	Xorijiy til va adabiyoti: ingliz tili-Chiroqchi tumani	\N
3248	405	60111804186	Xorijiy til va adabiyoti: ingliz tili-Kitob tumani	\N
3249	405	60111804188	Xorijiy til va adabiyoti: ingliz tili-Mirishkor tumani	\N
3250	405	60111804193	Xorijiy til va adabiyoti: ingliz tili-Shahrisabz tumani	\N
3251	405	60111804194	Xorijiy til va adabiyoti: ingliz tili-Yakkabog' tumani	\N
3252	406	60610204	Axborot tizimlari va texnologiyalari (tarmoqlar va sohalar bo‘yicha)	\N
3255	406	60411301	Biznesni boshqarish (tarmoqlar bo‘yicha)	\N
3256	406	60110500	Boshlang‘ich ta’lim	\N
3257	406	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
3258	406	60230104	Filologiya va tillarni o‘qitish: o‘zbek tili	\N
3259	406	60110800	Kimyo	\N
3260	406	60110200	Maktabgacha ta’lim	\N
3261	406	60540100	Matematika	\N
3262	406	60111701	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)	\N
3263	406	60111804	Xorijiy til va adabiyoti: ingliz tili	\N
3264	407	60210900	Bastakorlik san'ati	\N
3265	407	60211519	Cholg‘u ijrochiligi: an'anaviy cholg‘ular	\N
3266	407	60112423	Professional ta'lim: cholg‘u ijrochiligi (an'anaviy cholg‘ular)	\N
3267	407	60112420	Professional ta'lim: vokal san'ati (an'anaviy xonandalik)	\N
3268	407	60211002	San'atshunoslik: musiqashunoslik	\N
3269	407	60211401	Vokal san'ati: an'anaviy xonandalik	\N
3270	407	60211902	Xalq ijodiyoti (baxshichilik va dostonchilik)	\N
3271	408	60211520	Cholg‘u ijrochiligi: fortepiano (organ)	\N
3272	408	60211513	Cholg‘u ijrochiligi: puflama va zarbli cholg‘ular (fleyta, goboy)	\N
3273	408	60211524	Cholg‘u ijrochiligi: puflama va zarbli cholg‘ular (klarnet, fagot)	\N
3274	408	60211515	Cholg‘u ijrochiligi: puflama va zarbli cholg‘ular (trombon, truba)	\N
3275	408	60211518	Cholg‘u ijrochiligi: puflama va zarbli cholg‘ular (valtorna, truba)	\N
3276	408	60211517	Cholg‘u ijrochiligi: puflama va zarbli cholg‘ular (zarbli cholg‘ular)	\N
3277	408	60211502	Cholg‘u ijrochiligi: torli cholg‘ular (skripka, alt)	\N
3278	408	60211521	Cholg‘u ijrochiligi: torli cholg‘ular (violonchel, kontrabas)	\N
3279	408	60211504	Cholg‘u ijrochiligi: Xalq cholg‘ulari (chang)	\N
3280	408	60211508	Cholg‘u ijrochiligi: xalq cholg‘ulari (dutor, dutor bas, dutor kontrabas, dombira)	\N
3281	408	60211510	Cholg‘u ijrochiligi: xalq cholg‘ulari (g‘ijjak qobus bas, g‘ijjak qobus-kontrabas, g‘ijjak alt)	\N
3282	408	60211509	Cholg‘u ijrochiligi: xalq cholg‘ulari (g‘ijjak, g‘ijjak al't)	\N
3283	408	60211505	Cholg‘u ijrochiligi: xalq cholg‘ulari (nay-qo‘shnay, bayan-akkordeyon)	\N
3284	408	60211516	Cholg‘u ijrochiligi: xalq cholg‘ulari (rubob prima, qashqar va afg‘on rubobi)	\N
3285	408	60211506	Cholg‘u ijrochiligi: xalq cholg‘ulari (zarbli cholg‘ular)	\N
3286	408	60211304	Dirijyorlik: akademik xor dirijyorligi	\N
3287	408	60112401	Professional ta'lim: cholg‘u ijrochiligi (turlari bo‘yicha)	\N
3288	408	60112414	Professional ta'lim: vokal san'ati (turlari bo'yicha)	\N
3289	408	60211002	San'atshunoslik: musiqashunoslik	\N
3290	408	60211402	Vokal san'ati: akademik xonandalik	\N
3291	409	60211602	Xoreografiya (turlari bo‘yicha)	\N
3292	410	60611300	Axborot-kommunikatsiya texnologiyalari sohasida kasb ta’limi	\N
3293	410	60610300	Axborot xavfsizligi (sohalar bo‘yicha)	\N
3294	410	60610600	Dasturiy injiniring	\N
3295	410	60612100	Kiberxavfsizlik injiniringi 	\N
3296	410	60610503	"Kompyuter injiniringi (""Kompyuter injiniringi"", ""AT-servis"", ""Axborot xavfsizligi"", ""Multimedia texnologiyalari"")"	\N
3297	410	60611400	Pochta aloqa texnologiyasi	\N
3298	410	60611002	"Telekommunikatsiya texnologiyalari (“Telekommunikatsiyalar”, ""Teleradioeshittirish"", ""Mobil tizimlar"")"	\N
3299	411	60111900	Maktabgacha va boshlang‘ich ta'limda jismoniy tarbiya va sport	\N
3300	411	60310904	Psixologiya: sport psixologiyasi	\N
3301	411	61010334	Sport faoliyati: badiiy gimnastika	\N
3302	411	61010329	Sport faoliyati: badminton	\N
3303	411	61010327	Sport faoliyati: belbog‘li kurash	\N
3304	411	61010341	Sport faoliyati: boks	\N
3305	411	61010348	Sport faoliyati: dzyudo	\N
3306	411	61010304	Sport faoliyati: futbol	\N
3307	411	61010342	Sport faoliyati: kurash	\N
3308	411	61010339	Sport faoliyati: og‘ir atletika	\N
3309	411	61010350	Sport faoliyati: qo‘l to‘pi	\N
3310	411	61010319	Sport faoliyati: shaxmat	\N
3311	411	61010325	Sport faoliyati: suzish	\N
3312	411	61010309	Sport faoliyati: taekvondo WTF	\N
3313	411	61010330	Sport faoliyati: velosport	\N
3314	411	61010332	Sport faoliyati: voleybol	\N
3315	411	61010347	Sport faoliyati: yengil atletika	\N
3316	412	60610204	Axborot tizimlari va texnologiyalari (tarmoqlar va sohalar bo‘yicha)	\N
3317	412	60410500	Bank ishi va auditi	\N
3318	412	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
3319	412	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
3320	412	60410400	Moliya va moliyaviy texnologiyalar	\N
3321	412	60410200	Soliqlar va soliqqa tortish	\N
3322	413	60112600	Maktabgacha va boshlang‘ich ta’limda xorijiy til (ingliz tili)	\N
3323	413	60111804	Xorijiy til va adabiyoti: ingliz tili	\N
3324	414	60112600	Maktabgacha va boshlang‘ich ta’limda xorijiy til (ingliz tili)	\N
3325	414	60111804	Xorijiy til va adabiyoti: ingliz tili	\N
3326	415	60110900	Biologiya	\N
3327	415	60110500	Boshlang‘ich ta’lim	\N
3328	415	60110500216	Boshlang‘ich ta’lim-Ishtixon tumani	\N
3329	415	60110500218	Boshlang‘ich ta’lim-Kattaqo'rg'on tumani	\N
3330	415	60110500220	Boshlang‘ich ta’lim-Nurobod tumani	\N
3331	415	60110500224	Boshlang‘ich ta’lim-Payariq tumani	\N
3332	415	60110500225	Boshlang‘ich ta’lim-Qo'shrabot tumani	\N
3333	415	60110500228	Boshlang‘ich ta’lim-Urgut tumani	\N
3334	415	60110700	Fizika va astronomiya	\N
3335	415	60111000	Geografiya va iqtisodiy bilim asoslari	\N
3336	415	60112200	Jismoniy madaniyat	\N
3337	415	60110800	Kimyo	\N
3338	415	60110200	Maktabgacha ta’lim	\N
3339	415	60111900	Maktabgacha va boshlang‘ich ta'limda jismoniy tarbiya va sport	\N
3340	415	60110600	Matematika va informatika	\N
3341	415	60110600219	Matematika va informatika-Narpay tumani	\N
3342	415	60110600220	Matematika va informatika-Nurobod tumani	\N
3343	415	60110600224	Matematika va informatika-Payariq tumani	\N
3344	415	60110600228	Matematika va informatika-Urgut tumani	\N
3345	415	60111300	Musiqa ta'limi	\N
3346	415	60111400	O‘zbek tili va adabiyoti	\N
3347	415	60111701	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)	\N
3348	415	60111701216	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Ishtixon tumani	\N
3349	415	60111701218	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Kattaqo'rg'on tumani	\N
3350	415	60111701219	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Narpay tumani	\N
3351	415	60111701223	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Paxtachi tumani	\N
3352	415	60111701224	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Payariq tumani	\N
3353	415	60111701225	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Qo'shrabot tumani	\N
3354	415	60111701228	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Urgut tumani	\N
3355	415	61010304	Sport faoliyati: futbol	\N
3356	415	61010342	Sport faoliyati: kurash	\N
3357	415	61010319	Sport faoliyati: shaxmat	\N
3358	415	61010332	Sport faoliyati: voleybol	\N
3359	415	60111100	Tarix	\N
3360	415	60111100224	Tarix-Payariq tumani	\N
3361	415	60111100225	Tarix-Qo'shrabot tumani	\N
3362	415	60111200	Tasviriy san'at va muhandislik grafikasi  	\N
3363	415	60112300	Texnologik ta’lim	\N
3364	415	60111804	Xorijiy til va adabiyoti: ingliz tili	\N
3365	416	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
3366	416	99999999	Ma'lumotlar ilmi(Data Science)	\N
3367	416	60310502	Raqamli iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
3368	416	60410200	Soliqlar va soliqqa tortish	\N
3369	417	60810700	Agrokimyo va agrotuproqshunoslik	\N
3370	417	60812100	Dorivor o‘simliklarni yetishtirish va qayta ishlash texnologiyasi	\N
3371	417	60812000	Issiqxona xo‘jaligini tashkil etish va yuritish	\N
3372	417	60811800	Mevachilik va uzumchilik	\N
3373	417	60811001	O‘simliklarni himoya qilish (ekin turlari bo‘yicha)	\N
3374	417	60811200	Qishloq xo‘jaligi ekinlari seleksiyasi va urug‘chiligi (ekin turlari bo‘yicha)	\N
3375	417	60811900	Sabzavotchilik, polizchilik va kartoshkachilik	\N
3376	417	60811501	Zooinjeneriya: baliqchilik	\N
3377	418	60712000	Elektron apparaturalar ishlab chiqarish texnologiyasi	\N
3378	418	60711200	Elektronika va asbobsozlik (tarmoqlar bo‘yicha)	\N
3379	418	60711602	Intellektual muhandislik tizimlari (tarmoqlar va sohalar bo‘yicha)	\N
3380	418	60720800	Mashinasozlik texnologiyasi, mashinasozlik ishlab chiqarishini jihozlash va avtomatlashtirish	\N
3381	418	60531000	Mexanika va matematik modellashtirish	\N
3382	418	60531200	Tibbiyot fizikasi	\N
3383	419	60230103	Filologiya va tillarni o‘qitish: fransuz tili	\N
3384	419	60230101	Filologiya va tillarni o‘qitish: ingliz tili	\N
3385	419	60230119	Filologiya va tillarni o‘qitish: nemis tili	\N
3386	419	60230107	Filologiya va tillarni o‘qitish: rus tili	\N
3387	419	61010505	Gid hamrohligi va tarjimonlik faoliyati: ingliz tili	\N
3388	419	60112600	Maktabgacha va boshlang‘ich ta’limda xorijiy til (ingliz tili)	\N
3389	419	60111701	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)	\N
3390	419	60230203	Tarjima nazariyasi va amaliyoti: ingliz tili	\N
3391	419	60111804	Xorijiy til va adabiyoti: ingliz tili	\N
3392	420	60230103	Filologiya va tillarni o‘qitish: fransuz tili	\N
3393	420	60230101	Filologiya va tillarni o‘qitish: ingliz tili	\N
3394	420	60230119	Filologiya va tillarni o‘qitish: nemis tili	\N
3395	420	60230107	Filologiya va tillarni o‘qitish: rus tili	\N
3396	420	61010505	Gid hamrohligi va tarjimonlik faoliyati: ingliz tili	\N
3397	420	60230203	Tarjima nazariyasi va amaliyoti: ingliz tili	\N
3398	420	60230202	Tarjima nazariyasi va amaliyoti: rus tili	\N
3399	420	60111804	Xorijiy til va adabiyoti: ingliz tili	\N
3400	420	60111802	Xorijiy til va adabiyoti: rus tili	\N
3401	421	60210900	Bastakorlik san'ati	\N
3402	421	60211503	Cholg‘u ijrochiligi: estrada cholg‘ulari (fortepiano)	\N
3403	421	60211512	Cholg‘u ijrochiligi: estrada cholg‘ulari (gitara bas)	\N
3404	421	60211525	Cholg‘u ijrochiligi: estrada cholg‘ulari (gitara)	\N
3405	421	60211526	Cholg‘u ijrochiligi: estrada cholg‘ulari (saksofon)	\N
3406	421	60211514	Cholg‘u ijrochiligi: estrada cholg‘ulari (trombon)	\N
3407	421	60211501	Cholg‘u ijrochiligi: estrada cholg‘ulari (truba)	\N
3408	421	60211523	Cholg‘u ijrochiligi: estrada cholg‘ulari (zarbli cholg‘ular)	\N
3409	421	60211302	Dirijyorlik: estrada orkestri dirijyorligi	\N
3410	421	60112402	Professional ta'lim: cholg‘u ijrochiligi (estrada cholg‘ulari)	\N
3411	421	60112421	Professional ta'lim: vokal san'ati (estrada xonandaligi)	\N
3412	421	60211002	San'atshunoslik: musiqashunoslik	\N
3413	421	60210102	Texnogen san'at: musiqiy ovoz rejissorligi	\N
3414	421	60211403	Vokal san'ati: estrada xonandaligi	\N
3415	422	60230123	Filologiya va tillarni o‘qitish: qoraqalpoq tili	\N
3416	422	60540100	Matematika	\N
3417	422	60310901	Psixologiya: amaliy psixologiya	\N
3418	422	60111804	Xorijiy til va adabiyoti: ingliz tili	\N
\.


--
-- Data for Name: facultyshifres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facultyshifres (id, shifr, name, blokid) FROM stdin;
1	60540200	Amaliy matematika	\N
2	60320300	Arxivshunoslik	\N
3	60510102	Biologiya (turlari bo‘yicha)	\N
4	60710403	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	\N
5	60230104	Filologiya va tillarni o‘qitish: o‘zbek tili	\N
6	60530901	Fizika	\N
7	60530400	Geografiya	\N
8	61010505	Gid hamrohligi va tarjimonlik faoliyati: ingliz tili	\N
9	60411400	Inson resurslarini boshqarish	\N
10	60530100	Kimyo (turlari bo‘yicha)	\N
11	60610100	Kompyuter ilmlari va dasturlash texnologiyalari (yo‘nalishlar bo‘yicha)	\N
12	60610501	Kompyuter injiniringi: “Kompyuter injiniringi”	\N
13	60610504	Kompyuter injiniringi: AT-Servis	\N
14	60540100	Matematika	\N
15	61010100	Mehmonxona xo‘jaligini tashkil etish va boshqarish	\N
16	60531000	Mexanika va matematik modellashtirish	\N
17	60711001	Muqobil energiya manbalari (turlari bo‘yicha)	\N
18	60720100	Oziq-ovqat texnologiyasi (mahsulot turlari bo‘yicha)	\N
19	60310901	Psixologiya: amaliy psixologiya	\N
20	60311000	Sotsiologiya	\N
21	61010341	Sport faoliyati: boks	\N
22	61010304	Sport faoliyati: futbol	\N
23	61010342	Sport faoliyati: kurash	\N
24	60220307	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)	\N
25	61010401	Turizm (faoliyat yo‘nalishlari bo‘yicha )	\N
26	60230700	Amaliy filologiya	\N
27	60230900	Folklorshunoslik va shevashunoslik	\N
28	60230800	Kompyuter lingvistikasi 	\N
29	60230302	Matnshunoslik va adabiy manbashunoslik: o‘zbek tili	\N
30	60230600	Noshirlik ishi	\N
31	60111400	O‘zbek tili va adabiyoti	\N
32	60111601	O‘zga tilli guruhlarda o‘zbek tili (rus guruhlari uchun)	\N
33	60230204	Tarjima nazariyasi va amaliyoti: fransuz tili	\N
34	60230203	Tarjima nazariyasi va amaliyoti: ingliz tili	\N
35	60230206	Tarjima nazariyasi va amaliyoti: nemis tili	\N
36	60230202	Tarjima nazariyasi va amaliyoti: rus tili	\N
37	61040400	Avtomobil servisi	\N
38	60712400	Avtomobilsozlik va traktorsozlik	\N
39	60610204	Axborot tizimlari va texnologiyalari (tarmoqlar va sohalar bo‘yicha)	\N
40	60410500	Bank ishi va auditi	\N
41	60711800	Biotibbiyot muhandisligi	\N
42	60410104	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	\N
43	60710602	Elektr energetikasi (tarmoqlar va yo‘nalishlar bo‘yicha)	\N
44	60710702	Elektr texnikasi, elektr mexanikasi va elektr texnologiyalari (tarmoqlar bo‘yicha)	\N
45	60711102	Energiya mashinasozligi (tarmoqlar bo‘yicha)	\N
46	60710900	Energiya tejamkorligi va energoaudit	\N
47	60711602	Intellektual muhandislik tizimlari (tarmoqlar va sohalar bo‘yicha)	\N
48	60310104	Iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
49	60720800	Mashinasozlik texnologiyasi, mashinasozlik ishlab chiqarishini jihozlash va avtomatlashtirish	\N
50	60720601	Materialshunoslik va yangi materiallar texnologiyasi (tarmoqlar bo‘yicha)	\N
51	61020201	Mehnat muhofazasi va texnika xavfsizligi (tarmoqlar bo‘yicha)	\N
52	60411212	Menejment (tarmoqlar va sohalar bo‘yicha)	\N
53	60712300	Metallar texnologiyalari (jarayon turlari bo‘yicha)	\N
54	60711303	Metrologiya, standartlashtirish va mahsulot sifati menejmenti (tarmoqlar bo‘yicha)	\N
55	60711500	Mexatronika va robototexnika	\N
56	60410400	Moliya va moliyaviy texnologiyalar	\N
57	60610700	Sun’iy intellekt 	\N
58	60721300	Tabiiy tolalarni dastlabki ishlash texnologiyasi (xomashyo va jarayon turlari bo‘yicha)	\N
59	60711402	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (tarmoqlar bo‘yicha)	\N
60	60720701	Texnologik mashinalar va jihozlar (tarmoqlar bo‘yicha)	\N
61	61040101	Transport logistikasi (transport turlari bo‘yicha)	\N
62	60712503	Transport vositalari muhandisligi (turlari bo‘yicha)	\N
63	60721204	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi (ishlab chiqarish turlari bo‘yicha)	\N
64	61040300	Yo‘l harakatini tashkil etish	\N
65	60730804	Yo‘l muhandisligi (sohalar va faoliyat turlari bo‘yicha)	\N
66	60412400	Agrobiznes va investitsion faoliyat	\N
67	60810700	Agrokimyo va agrotuproqshunoslik	\N
68	60810904	Agronomiya (dehqonchilik mahsulotlari turlari bo‘yicha)	\N
69	60220400	Arxeologiya	\N
70	60320200	Axborot xizmati va jamoatchilik bilan aloqalar	\N
71	60710200	Biotexnologiya (tarmoqlar bo‘yicha)	\N
72	60711200	Elektronika va asbobsozlik (tarmoqlar bo‘yicha)	\N
73	60230103	Filologiya va tillarni o‘qitish: fransuz tili	\N
74	60230101	Filologiya va tillarni o‘qitish: ingliz tili	\N
75	60230119	Filologiya va tillarni o‘qitish: nemis tili	\N
76	60230107	Filologiya va tillarni o‘qitish: rus tili	\N
77	60230106	Filologiya va tillarni o‘qitish: tojik tili	\N
78	61010504	Gid hamrohligi va tarjimonlik faoliyati: fransuz tili	\N
79	61010503	Gid hamrohligi va tarjimonlik faoliyati: nemis tili	\N
80	60920103	Ijtimoiy ish: oila va bolalar bilan ishlash	\N
81	60920103005	Ijtimoiy ish: oila va bolalar bilan ishlash-Buxoro viloyati	\N
82	60920103001	Ijtimoiy ish: oila va bolalar bilan ishlash-Qoraqalpog‘iston Respublikasi	\N
83	60920103006	Ijtimoiy ish: oila va bolalar bilan ishlash-Xorazm viloyati	\N
84	60812000	Issiqxona xo‘jaligini tashkil etish va yuritish	\N
85	60320102	Jurnalistika: bosma ommaviy axborot vositalari jurnalistikasi	\N
86	60710101	Kimyoviy texnologiya (ishlab chiqarish turlari bo‘yicha)	\N
87	60411701	Logistika (agrologistika)	\N
88	60412505	Marketing (tarmoqlar va sohalar bo‘yicha)	\N
89	60811800	Mevachilik va uzumchilik	\N
90	60720900	Neftgazkimyo sanoati texnologiyasi	\N
91	60811001	O‘simliklarni himoya qilish (ekin turlari bo‘yicha)	\N
92	60310906	Psixologiya: oila psixologiyasi	\N
93	60310904	Psixologiya: sport psixologiyasi	\N
94	60811301	Qishloq xo‘jalik mahsulotlarini saqlash va dastlabki ishlash texnologiyasi (mahsulotlar turlari bo‘yicha)	\N
95	60310502	Raqamli iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	\N
96	60811900	Sabzavotchilik, polizchilik va kartoshkachilik	\N
97	60310700	Siyosatshunoslik	\N
98	61010328	Sport faoliyati: basketbol	\N
99	61010348	Sport faoliyati: dzyudo	\N
100	61010320	Sport faoliyati: erkin kurash	\N
101	61010350	Sport faoliyati: qo‘l to‘pi	\N
102	61010343	Sport faoliyati: stol tennisi	\N
103	61010332	Sport faoliyati: voleybol	\N
104	61010347	Sport faoliyati: yengil atletika	\N
105	60410800	Statistika (tarmoqlar va sohalar bo‘yicha)	\N
106	60220308	Tarix (islom tarixi va manbashunosligi)	\N
107	60420107	Yurisprudensiya (faoliyat turlari bo‘yicha)	\N
108	61010200	Aholi va turistlarning ovqatlanishini tashkil etish servisi	\N
109	60730102	Arxitektura (turlari bo‘yicha)	\N
110	60210409	Dizayn: (milliy kostyum)	\N
111	60210405	Dizayn: libos va gazlamalar	\N
112	60210407	Dizayn: poyabzal va aksessuarlar dizayni	\N
113	60710500	Energetika (tarmoqlar bo‘yicha)	\N
114	60720500	Funksional ovqatlanish va bolalar mahsulotlari texnologiyasi	\N
115	60721000	Gazni chuqur qayta ishlash texnologiyasi 	\N
116	60720400	Konservalash texnologiyasi	\N
117	60710300	Matbaa va qadoqlash jarayonlari texnologiyasi 	\N
118	60720603	Materialshunoslik va yangi materiallar texnologiyasi (qurilish) 	\N
119	60720604	Materialshunoslik va yangi materiallar texnologiyasi: mashinasozlik	\N
120	60721800	Neft va gaz ishi (faoliyat turlari bo‘yicha)	\N
121	60721100	Neft va neft-gazni qayta ishlash texnologiyasi	\N
122	60810100	Qishloq xo‘jaligini mexanizatsiyalashtirish	\N
123	60730305	Qurilish muhandisligi: bino va inshootlar qurilishi	\N
124	60730302	Qurilish muhandisligi: devorbop va pardozbop qurilish materiallari texnologiyasi	\N
125	60730303	Qurilish muhandisligi: qurilish materiallari, buyumlari va konstruksiyalarini ishlab chiqarish	\N
126	60730500	Suv ta’minoti va kanalizatsiya tizimlarini loyihalashtirish va ekspluatatsiyasi	\N
127	60711900	Texnologik jarayonlarni boshqarishning axborot-kommunikatsiya tizimlari	\N
128	60720300	Vinochilik texnologiyasi, bijg‘ish mahsulotlari va alkogolsiz ichimliklar texnologiyasi	\N
129	60721400	Yengil sanoat texnologiyalari va jihozlari (ishlab chiqarish turlari bo‘yicha)	\N
130	60720200	Yog‘lar, efir moylari va parfumeriya-kosmetika mahsulotlari texnologiyasi	\N
131	60610400	Axborot xavfsizligini boshqarish	\N
132	60220100	Dinshunoslik	\N
133	60230113	Filologiya va tillarni o‘qitish: arab tili	\N
134	60411100	Islom iqtisodiyoti va moliyasi	\N
135	60220201	Islomshunoslik (qur'onshunoslik, hadisshunoslik, islom huquqi, aqida va tasavvuf, islom tarixi va manbashunosligi)	\N
136	60220202	Islomshunoslik (yo‘nalishlar bo‘yicha)	\N
137	60411900	Jahon iqtisodiyoti va xalqaro iqtisodiy munosabatlar (mintaqalar va faoliyat turlari bo‘yicha)	\N
138	60320101	Jurnalistika: xalqaro jurnalistika	\N
139	60610503	"Kompyuter injiniringi (""Kompyuter injiniringi"", ""AT-servis"", ""Axborot xavfsizligi"", ""Multimedia texnologiyalari"")"	\N
140	60230303	Matnshunoslik va adabiy manbashunoslik: arab tili	\N
141	60310903	Psixologiya (din sotsiopsixologiyasi)	\N
142	61010402	Turizm (ziyorat turizmi)	\N
143	60310800	Xalqaro munosabatlar	\N
144	60420108	Yurisprudensiya (islom huquqi)	\N
145	60810903	Agronomiya: anorchilik	\N
146	60411301	Biznesni boshqarish (tarmoqlar bo‘yicha)	\N
147	60110500	Boshlang‘ich ta’lim	\N
148	60910200	Davolash ishi	\N
149	60910200012	Davolash ishi-Sirdaryo viloyati	\N
150	60812100	Dorivor o‘simliklarni yetishtirish va qayta ishlash texnologiyasi	\N
151	60110700	Fizika va astronomiya	\N
152	60111000	Geografiya va iqtisodiy bilim asoslari	\N
153	60920101	Ijtimoiy ish (fuqarolarning o‘z-o‘zini boshqarish organlari)	\N
154	60920103009	Ijtimoiy ish: oila va bolalar bilan ishlash-Jizzax viloyati	\N
155	60920103012	Ijtimoiy ish: oila va bolalar bilan ishlash-Sirdaryo viloyati	\N
156	60920103013	Ijtimoiy ish: oila va bolalar bilan ishlash-Toshkent viloyati	\N
157	60112200	Jismoniy madaniyat	\N
158	60112201	Jismoniy madaniyat (xotin-qizlar sporti yo‘nalishi bo‘yicha)	\N
159	60110200	Maktabgacha ta’lim	\N
160	60110600	Matematika va informatika	\N
161	60112100	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi	\N
162	60111300	Musiqa ta'limi	\N
163	60111701	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)	\N
164	60111504	Ona tili va adabiyot: qozoq tili va adabiyot	\N
165	60110100	Pedagogika	\N
166	60910300	Pediatriya ishi	\N
167	60910300012	Pediatriya ishi-Sirdaryo viloyati	\N
168	60111200	Tasviriy san'at va muhandislik grafikasi  	\N
169	60112300	Texnologik ta’lim	\N
170	60111804	Xorijiy til va adabiyoti: ingliz tili	\N
171	60730402	Muhandislik kommunikatsiyalari qurilishi va montaji (turlari bo‘yicha)	\N
172	60112403	Professional ta’lim: transport vositalari muhandisligi (avtotransport)	\N
173	60611503	Radioelektron qurilmalar va tizimlar (tarmoqlar bo‘yicha)	\N
174	60910200003	Davolash ishi-Namangan viloyati	\N
175	60910700	Farmatsiya (turlari bo‘yicha)	\N
176	61020100	Hayotiy faoliyat xavfsizligi	\N
177	60920103003	Ijtimoiy ish: oila va bolalar bilan ishlash-Namangan viloyati	\N
178	60310400	Iqtisodiy xavfsizlik	\N
179	60110800	Kimyo	\N
180	60320400	Kutubxona-axborot faoliyati (faoliyat turlari bo‘yicha)	\N
181	60411703	Logistika (yo‘nalishlar bo‘yicha)	\N
182	60111900	Maktabgacha va boshlang‘ich ta'limda jismoniy tarbiya va sport	\N
183	60112600	Maktabgacha va boshlang‘ich ta’limda xorijiy til (ingliz tili)	\N
184	60112702	Maxsus pedagogika : logopediya	\N
185	60520200	Meteorologiya va iqlimshunoslik  	\N
186	60412200	Moliya sohasida boshqaruv	\N
187	60812201	O'simlikshunoslik (gulchilik)	\N
188	60910300003	Pediatriya ishi-Namangan viloyati	\N
189	61010324	Sport faoliyati (xotin-qizlar sporti yo‘nalishi bo‘yicha)	\N
190	60811501	Zooinjeneriya: baliqchilik	\N
191	60721601	Foydali qazilma konlari geologiyasi, qidiruv va razvedkasi (kon turlari bo‘yicha)	\N
192	60812500	Gidrotexnika inshootlari va nasos stansiyalaridan foydalanish	\N
193	60730902	Gidrotexnika qurilishi (turlari bo‘yicha)	\N
194	60411600	Korporativ boshqaruv	\N
195	60810300	Qishloq va suv xo‘jaligida texnik servis	\N
196	60810400	Qishloq xo‘jaligida innovatsion texnika va texnologiyalarni qo‘llash	\N
197	60730200	Shahar qurilishi hamda kommunal infratuzilmani tashkil etish va boshqarish	\N
198	60210406	Dizayn: kostyum dizayni	\N
199	60820200	Manzarali bog‘dorchilik va ko‘kalamzorlashtirish	\N
200	60510102218	Biologiya (turlari bo‘yicha)-Kattaqo'rg'on tumani	\N
201	60510102220	Biologiya (turlari bo‘yicha)-Nurobod tumani	\N
202	60510102224	Biologiya (turlari bo‘yicha)-Payariq tumani	\N
203	60510102228	Biologiya (turlari bo‘yicha)-Urgut tumani	\N
204	60610600	Dasturiy injiniring	\N
205	60220502	Falsafa (yo‘nalishlar bo‘yicha)	\N
206	60230104216	Filologiya va tillarni o‘qitish: o‘zbek tili-Ishtixon tumani	\N
207	60230104218	Filologiya va tillarni o‘qitish: o‘zbek tili-Kattaqo'rg'on tumani	\N
208	60230104220	Filologiya va tillarni o‘qitish: o‘zbek tili-Nurobod tumani	\N
209	60230104223	Filologiya va tillarni o‘qitish: o‘zbek tili-Paxtachi tumani	\N
210	60230104224	Filologiya va tillarni o‘qitish: o‘zbek tili-Payariq tumani	\N
211	60230104228	Filologiya va tillarni o‘qitish: o‘zbek tili-Urgut tumani	\N
212	60230107220	Filologiya va tillarni o‘qitish: rus tili-Nurobod tumani	\N
213	60530901219	Fizika-Narpay tumani	\N
214	60530901220	Fizika-Nurobod tumani	\N
215	60530901228	Fizika-Urgut tumani	\N
216	60530400218	Geografiya-Kattaqo'rg'on tumani	\N
217	60530400220	Geografiya-Nurobod tumani	\N
218	60530400225	Geografiya-Qo'shrabot tumani	\N
219	60530502	Geologiya (faoliyat sohasi bo‘yicha)	\N
220	60520100	Gidrometeorologiya	\N
221	60920103010	Ijtimoiy ish: oila va bolalar bilan ishlash-Navoiy viloyati	\N
222	60920103008	Ijtimoiy ish: oila va bolalar bilan ishlash-Qashqadaryo viloyati	\N
223	60920103011	Ijtimoiy ish: oila va bolalar bilan ishlash-Samarqand viloyati	\N
224	60920103007	Ijtimoiy ish: oila va bolalar bilan ishlash-Surxondaryo viloyati	\N
225	60530100216	Kimyo (turlari bo‘yicha)-Ishtixon tumani	\N
226	60530100218	Kimyo (turlari bo‘yicha)-Kattaqo'rg'on tumani	\N
227	60530100220	Kimyo (turlari bo‘yicha)-Nurobod tumani	\N
228	60530100224	Kimyo (turlari bo‘yicha)-Payariq tumani	\N
229	60530100225	Kimyo (turlari bo‘yicha)-Qo'shrabot tumani	\N
230	60540302	Matematik injiniring (ishlab chiqarish sohalari bo‘yicha)	\N
231	60540100220	Matematika-Nurobod tumani	\N
232	60540100223	Matematika-Paxtachi tumani	\N
233	60540100224	Matematika-Payariq tumani	\N
234	60540100225	Matematika-Qo'shrabot tumani	\N
235	60540100228	Matematika-Urgut tumani	\N
236	60220307218	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)-Kattaqo'rg'on tumani	\N
237	60220307220	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)-Nurobod tumani	\N
238	60731100	Arxitektura yodgorliklari rekonstruktsiyasi va restavratsiyasi	\N
239	60210401	Dizayn: interyerni loyihalash 	\N
240	60210411	Dizayn: landshaft dizayni	\N
241	60722500	Geodeziya, kartografiya va kadastr (funksiyalari bo‘yicha)	\N
242	60722803	Kadastr (ko‘chmas mulk kadastri)	\N
243	60212200	Madaniy meros obyektlarini asrash 	\N
244	60112404	Professional ta'lim: iqtisodiyot	\N
245	60112407	Professional ta'lim: muhandislik kommunikatsiyalari qurilishi va montaji	\N
246	60112416	Professional ta'lim: qurilish muhandisligi (bino va inshootlar qurilishi)	\N
247	60731000	Qiymat injiniringi va ko‘chmas mulk ekspertizasi	\N
248	60730301	Qurilish muhandisligi (faoliyat turlari bo‘yicha)	\N
249	60220600	Amaliy etika	\N
250	60230500	Antropologiya va etnologiya	\N
251	60531100	Astronomiya	\N
252	60610300	Axborot xavfsizligi (sohalar bo‘yicha)	\N
253	60510101	Biologiya (matematik biologiya)	\N
254	60410700	Budjet nazorati va g‘aznachiligi	\N
255	60310200	Ekonometrika	\N
256	60220503	Falsafa (tizimli tahlil va mantiq)	\N
257	60530902	Fizika (matematik fizika)	\N
258	60530802	Gidrologiya (tarmoqlar bo‘yicha)	\N
259	60920103014	Ijtimoiy ish: oila va bolalar bilan ishlash-Toshkent shahri	\N
260	60310103	Iqtisodiyot (matematika iqtisodiyoti)	\N
261	60320104	Jurnalistika: internet jurnalistika	\N
262	60723000	Mahsulotlarning kimyoviy tahlili (oziq-ovqat mahsulotlari)	\N
263	60411211	Menejment (sport tadbirlarini tashkil etish va boshqarish)	\N
264	60310300	Mintaqaviy iqtisodiyot	\N
265	60530200	Neft va gaz kimyosi	\N
266	60421100	Patentshunoslik	\N
267	60310902	Psixologiya: yoshlar psixologiyasi	\N
268	60531300	Seysmologiya va seysmometriya	\N
269	61010337	Sport faoliyati: regbi	\N
270	61010309	Sport faoliyati: taekvondo WTF	\N
271	60410600	Sug‘urta ishi	\N
272	60530300	Tabiiy va fiziologik faol birikmalar kimyosi	\N
273	60531200	Tibbiyot fizikasi	\N
274	60420104	Yurisprudensiya : biznes huquqi	\N
275	60210408	Dizayn: sanoat dizayni	\N
276	60712000	Elektron apparaturalar ishlab chiqarish texnologiyasi	\N
277	60721602	Foydali qazilma konlari geologiyasi, qidiruv va razvedkasi (mis konlari)	\N
278	60713000	Gaz jihozlaridan foydalanish va ularga xizmat ko‘rsatish	\N
279	60710800	Gidroenergetika	\N
280	60721700	Gidrogeologiya va muhandislik geologiyasi	\N
281	60721900	Konchilik elektr mexanikasi	\N
282	60721501	Konchilik ishi (faoliyat turlari bo‘yicha)	\N
283	60721502	Konchilik ishi (mis rudalarini boyitish)	\N
284	60711700	Lazer-yorug‘lik texnologiyalari va optoelektronika	\N
285	60722000	Marksheyderlik ishi	\N
286	60411208	Menejment (sanoat korxonalarida innovatsion loyihalar boshqaruvi)	\N
287	60712101	Metallurgiya (metall turlari bo‘yicha)	\N
288	60712102	Metallurgiya (mis va noyob metallar)	\N
289	60711003	Muqobil energiya manbalari (quyosh va shamol energiyasi texnologiyalari)	\N
290	60711002	Muqobil energiya manbalari (vodorod energiyasi texnologiyalari)	\N
291	60712200	Payvandlash texnologiyasi va jihozlari	\N
292	60112430	Professional ta’lim: mexatronika va robototexnika	\N
293	60730304	Qurilish muhandisligi: neft-gazni qayta ishlash sanoati obyektlari qurilishi	\N
294	60530501	Geologiya (neft va gaz geofizikasi)	\N
295	60722400	Noyob va radioaktiv metallar rudalarini qazib olish, qayta ishlash texnikasi va texnologiyasi	\N
296	60610202	Axborot tizimlari va texnologiyalari (qishloq xo‘jaligida raqamli texnologiyalar)	\N
297	60410105	Buxgalteriya hisobi va audit (qishloq xo‘jaligida)	\N
298	60310105	Iqtisodiyot: qishloq xo‘jaligi iqtisodiyoti	\N
299	60811102	O‘simliklar va qishloq xo‘jalik mahsulotlari karantini	\N
300	60811200	Qishloq xo‘jaligi ekinlari seleksiyasi va urug‘chiligi (ekin turlari bo‘yicha)	\N
301	61010405	Turizm (agroturizm)	\N
302	60811505	Zooinjeneriya: qorako‘lchilik	\N
303	60411500	Biznes-tahlil	\N
304	60412504	Marketing (reklama ishi)	\N
305	60411203	Menejment: turizm biznesini boshqarish	\N
306	60412600	Savdo ishi (turlari bo‘yicha)	\N
307	60410200	Soliqlar va soliqqa tortish	\N
308	60112428	Professional ta'lim: xoreografiya	\N
309	60211006	San'atshunoslik: xoreografiya	\N
310	60211602	Xoreografiya (turlari bo‘yicha)	\N
311	60211601	Xoreografiya: zamonaviy raqs	\N
312	60230112	Filologiya va tillarni o‘qitish: ispan tili	\N
313	60230108	Filologiya va tillarni o‘qitish: koreys tili	\N
314	60230102	Filologiya va tillarni o‘qitish: xitoy tili	\N
315	60230117	Filologiya va tillarni o‘qitish: yapon tili	\N
316	60230205	Tarjima nazariyasi va amaliyoti: arab tili	\N
317	60230201	Tarjima nazariyasi va amaliyoti: italyan tili	\N
318	60220501	Falsafa (sharq falsafasi va madaniyati) 	\N
319	60230116	Filologiya va tillarni o‘qitish: dariy tili	\N
320	60230121	Filologiya va tillarni o‘qitish: fors tili	\N
321	60230114	Filologiya va tillarni o‘qitish: hind tili	\N
322	60230115	Filologiya va tillarni o‘qitish: mumtoz sharq tillari (arab tili)	\N
323	60230109	Filologiya va tillarni o‘qitish: pushtu tili	\N
324	60230118	Filologiya va tillarni o‘qitish: turk tili	\N
325	60230120	Filologiya va tillarni o‘qitish: urdu tili	\N
326	60230111	Filologiya va tillarni o‘qitish: uyg‘ur tili	\N
327	61010502	Gid hamrohligi va tarjimonlik faoliyati: fors tili	\N
328	61010501	Gid hamrohligi va tarjimonlik faoliyati: turk tili	\N
329	60230301	Matnshunoslik va adabiy manbashunoslik: fors tili	\N
330	60220301	Tarix: Afg‘oniston tarixi	\N
331	60220302	Tarix: arab mamlakatlari tarixi	\N
332	60220303	Tarix: Eron tarixi	\N
333	60220310	Tarix: Koreya tarixi	\N
334	60220304	Tarix: Markaziy Osiyo xalqlari tarixi	\N
335	60220306	Tarix: Turkiya tarixi	\N
336	60220309	Tarix: Xitoy tarixi	\N
337	60220305	Tarix: Yaponiya tarixi	\N
338	60230207	Tarjima nazariyasi va amaliyoti: urdu tili	\N
339	60411802	Xorijiy mamlakatlar iqtisodiyoti va mamlakatshunoslik: Eron	\N
340	60411806	Xorijiy mamlakatlar iqtisodiyoti va mamlakatshunoslik: Malayziya	\N
341	60411801	Xorijiy mamlakatlar iqtisodiyoti va mamlakatshunoslik: Turkiya	\N
342	60411804	Xorijiy mamlakatlar iqtisodiyoti va mamlakatshunoslik: Xitoy	\N
343	60411803	Xorijiy mamlakatlar iqtisodiyoti va mamlakatshunoslik: Yaponiya	\N
344	60210410	Dizayn: arxitekturaviy muhit dizayni	\N
345	60210801	Amaliy san'at: amaliy san'at asarlarini ta'mirlash	\N
346	60210802	Amaliy san'at: badiiy kulolchilik	\N
347	60210804	Amaliy san'at: badiiy zargarlik	\N
348	60210803	Amaliy san'at: me'moriy yodgorliklar bezagini ta'mirlash	\N
349	60210404	Dizayn: kompyuter grafikasi va badiiy foto	\N
350	60210402	Dizayn: reklama va amaliy grafika	\N
351	60210601	Grafika: dastgoh va kitob grafikasi	\N
352	60210602	Grafika: xattotlik va miniatyura	\N
353	60210702	Haykaltaroshlik: mahobatli	\N
354	60210701	Haykaltaroshlik: mayda plastika	\N
355	60411206	Menejment (art menejment va galereya ishi)	\N
356	60212102	Muzeyshunoslik: muzey menejmenti va madaniy turizm	\N
357	60212103	Muzeyshunoslik: muzey predmetlari ekspertizasi, konservatsiyalash va ta’mirlash	\N
358	60112426	Professional ta'lim: amaliy san'at (amaliy san'at asarlarini ta'mirlash)	\N
359	60112422	Professional ta'lim: dizayn (interyerni loyihalash)	\N
360	60112429	Professional ta'lim: dizayn (libos va gazlamalar)	\N
361	60112424	Professional ta'lim: rangtasvir (dastgohli)	\N
362	60212300	Qadimiy yozma manbalar konservatsiyasi va restavratsiyasi	\N
363	60210501	Rangtasvir: dastgohli	\N
364	60210505	Rangtasvir: filmning tasviriy yechimi	\N
365	60210502	Rangtasvir: mahobatli rangtasvir	\N
366	60210503	Rangtasvir: multfilm va kompyuter multiplikatsiyasi	\N
367	60210504	Rangtasvir: teatr-bezak rangtasvir	\N
368	60211004	San'atshunoslik: tasviriy va amaliy san'at	\N
369	60721208	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: charm buyumlari texnologiyasi	\N
370	60721202	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: charm va mo‘yna texnologiyasi	\N
371	60721206	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: gilamchilik	\N
372	60721214	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: ipak mahsulotlari ishlab chiqarish	\N
373	60721212	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: noto‘qima materiallar texnologiyasi	\N
374	60721207	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: shaxsiy buyurtma asosida kiyim tayyorlash	\N
375	60721211	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: tikuv buyumlari texnologiyasi	\N
376	60721209	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: to‘qima	\N
377	60721210	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: trikotaj	\N
378	60721213	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: yigirilgan ip ishlab chiqarish	\N
379	60721401	Yengil sanoat texnologiyalari va jihozlari: charm va mo‘ynani qayta ishlash  va jihozlari	\N
380	60721402	Yengil sanoat texnologiyalari va jihozlari: poyabzal, charm-attorlik buyumlari ishlab chiqarish va jihozlari	\N
381	60721403	Yengil sanoat texnologiyalari va jihozlari: tikuvchilik sanoatida kreativ loyihalash va innovatsion texnologiyalar	\N
382	60712900	Amaliy kosmik texnologiyalar	\N
383	60712803	Aviatsiya injiniringi (aviasozlik)	\N
384	60712802	Aviatsiya injiniringi (uchuvchisiz uchish apparatlari aviatsiya majmualari)	\N
385	60610201	Axborot tizimlari va texnologiyalari (temir yo‘l transporti)	\N
386	60411302	Biznesni boshqarish (transport)	\N
387	60410101	Buxgalteriya hisobi va audit (avtomobil transporti)	\N
388	60410102	Buxgalteriya hisobi va audit (temir yo‘l transporti)	\N
389	60710401	Ekologiya va atrof-muhit muhofazasi (avtomobil transporti)	\N
390	60710601	Elektr energetikasi (temir yo‘l transporti)	\N
391	60710701	Elektr texnikasi, elektr mexanikasi va elektr texnologiyalari (temir yo‘l transporti)	\N
392	60712600	Havo kemalarining texnik ekspluatatsiyasi	\N
393	61040200	Havodagi harakatni boshqarish 	\N
394	60711601	Intellektual muhandislik tizimlari (avtomobil transporti)	\N
395	60310101	Iqtisodiyot (avtomobil transporti)	\N
396	60310102	Iqtisodiyot (temir yo‘l transporti)	\N
397	61010700	Kommunal infratuzilma va uy-joy kommunal xo'jaligini tashkil etish va boshqarish 	\N
398	60412501	Marketing (avtomobil transporti)	\N
399	60412503	Marketing (temir yo‘l transporti)	\N
400	60540301	Matematik injiniring (transport)	\N
401	60720602	Materialshunoslik va yangi materiallar texnologiyasi (temir yo‘l transporti)	\N
402	61020203	Mehnat muhofazasi va texnika xavfsizligi (transport)	\N
403	60411213	Menejment (transport sohasida loyihalar boshqaruvi)	\N
404	60711302	Metrologiya, standartlashtirish va mahsulot sifati menejmenti (avtomobil transporti va yo‘l qurilishi mashinalari)	\N
405	60730401	Muhandislik kommunikatsiyalari qurilishi va montaji (transport tizimlarida suv ta'minoti va kanalizatsiya)	\N
406	60611502	Radioelektron qurilmalar va tizimlar (aviatsiya transporti)	\N
407	60611501	Radoielektron qurilmalar va tizimlar (temir yo‘l transporti)	\N
408	60310501	Raqamli iqtisodiyot (transport)	\N
409	60711403	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (temir yo‘l transporti)	\N
410	60720702	Texnologik masinalar va jihozlar (temir yo‘l transporti)	\N
411	61040102	Transport logistikasi (avtomobil transporti)	\N
412	60712508	Transport vositalari muhandisligi: avtomobil transporti	\N
413	60712504	Transport vositalari muhandisligi: elektr transporti	\N
414	60712509	Transport vositalari muhandisligi: elektromobil transporti	\N
415	60712506	Transport vositalari muhandisligi: ixtisoslashtirilgan transport vositalari	\N
416	60712505	Transport vositalari muhandisligi: ko‘tarish-tashish, yo‘l va qurilish mashinalari	\N
417	60712501	Transport vositalari muhandisligi: lokomotivlar	\N
418	60712502	Transport vositalari muhandisligi: metropoliten	\N
419	60712507	Transport vositalari muhandisligi: vagonlar	\N
420	60713200	Transportda tashishni tashkil etish va boshqarish (temir yo‘l transporti)	\N
421	60730807	Yo‘l muhandisligi: avtomobil yo‘llari ekspluatatsiyasi	\N
422	60730810	Yo‘l muhandisligi: avtomobil yo‘llaridagi sun'iy inshootlar	\N
423	60730805	Yo‘l muhandisligi: avtomobil yo‘llarini arxitektura-landshaft konstruktsiyalash	\N
424	60730802	Yo‘l muhandisligi: avtomobil yo‘llarini loyihalash	\N
425	60730809	Yo‘l muhandisligi: avtomobil yo‘llarini qurish	\N
426	60730801	Yo‘l muhandisligi: ko‘priklar va tonellar	\N
427	60730806	Yo‘l muhandisligi: shahar yo‘llari va ko‘chalar	\N
428	60730803	Yo‘l muhandisligi: temir yo‘l ekspluatatsiyasi	\N
429	60730808	Yo‘l muhandisligi: temir yo‘l qurilishi	\N
430	60420111	Yurisprudensiya (xalqaro transport huquqi)	\N
431	60610203	Axborot tizimlari va texnologiyalari (moliya-bank tizimida)	\N
432	60412700	Baholash ishi	\N
433	60410900	Birja ishi	\N
434	60412800	Elektron tijorat	\N
435	60411000	Investitsion loyihalarga xizmat ko‘rsatish va moliyalashtirish	\N
436	60412100	Xalqaro valuta-kredit munosabatlari	\N
437	60710102	Kimyoviy texnologiya (selluloza-qog‘oz ishlab chiqarish kimyoviy texnologiyasi)	\N
438	60112415	Professional ta'lim: kimyoviy texnologiya	\N
439	60910200091	Davolash ishi-Amudaryo tumani	\N
440	60910200092	Davolash ishi-Beruniy tumani	\N
441	60910200157	Davolash ishi-Bog'ot tumani	\N
442	60910200158	Davolash ishi-Gurlan tumani	\N
443	60910200163	Davolash ishi-Hazorasp tumani	\N
444	60910200031	Davolash ishi-Nukus shahri	\N
445	60910200065	Davolash ishi-Pitnak shahri	\N
446	60910200160	Davolash ishi-Qo'shko'pir tumani	\N
447	60910200161	Davolash ishi-Shovot tumani	\N
448	60910200302	Davolash ishi-Tuproqqal'a massivi	\N
449	60910200261	Davolash ishi-Tuproqqal'a tumani	\N
450	60910200045	Davolash ishi-Urganch shahri	\N
451	60910200162	Davolash ishi-Urganch tumani	\N
452	60910200046	Davolash ishi-Xiva shahri	\N
453	60910200164	Davolash ishi-Xiva tumani	\N
454	60910200165	Davolash ishi-Xonqa tumani	\N
455	60910200166	Davolash ishi-Yangiariq tumani	\N
456	60910200167	Davolash ishi-Yangibozor tumani	\N
457	60911200	Oliy hamshiralik ishi	\N
458	60910300196	Pediatriya ishi-Baxmal tumani	\N
459	60910300157	Pediatriya ishi-Bog'ot tumani	\N
460	60910300197	Pediatriya ishi-Do'stlik tumani	\N
461	60910300199	Pediatriya ishi-G'allaorol tumani	\N
462	60910300158	Pediatriya ishi-Gurlan tumani	\N
463	60910300163	Pediatriya ishi-Hazorasp tumani	\N
464	60910300050	Pediatriya ishi-Jizzax shahri	\N
465	60910300243	Pediatriya ishi-O'rtachirchiq tumani	\N
466	60910300202	Pediatriya ishi-Paxtakor tumani	\N
467	60910300160	Pediatriya ishi-Qo'shko'pir tumani	\N
468	60910300200	Pediatriya ishi-Sharof Rashidov tumani	\N
469	60910300161	Pediatriya ishi-Shovot tumani	\N
470	60910300045	Pediatriya ishi-Urganch shahri	\N
471	60910300162	Pediatriya ishi-Urganch tumani	\N
472	60910300166	Pediatriya ishi-Yangiariq tumani	\N
473	60910300167	Pediatriya ishi-Yangibozor tumani	\N
474	60910300250	Pediatriya ishi-Yuqorichirchiq tumani	\N
475	60910300204	Pediatriya ishi-Zafarobod tumani	\N
476	60910300205	Pediatriya ishi-Zarbdor tumani	\N
477	60910300206	Pediatriya ishi-Zomin tumani	\N
478	60910100	Stomatologiya (yo‘nalishlar bo‘yicha) 	\N
479	60910400	Tibbiy profilaktika ishi	\N
480	60910400182	Tibbiy profilaktika ishi-Chiroqchi tumani	\N
481	60910400171	Tibbiy profilaktika ishi-Denov tumani	\N
482	60910400163	Tibbiy profilaktika ishi-Hazorasp tumani	\N
483	60910400185	Tibbiy profilaktika ishi-Kasbi tumani	\N
484	60910400263	Tibbiy profilaktika ishi-Kukdala tumani	\N
485	60910400173	Tibbiy profilaktika ishi-Muzrabot tumani	\N
486	60910400174	Tibbiy profilaktika ishi-Oltinsoy tumani	\N
487	60910400175	Tibbiy profilaktika ishi-Qiziriq tumani	\N
488	60910400253	Tibbiy profilaktika ishi-Shahrisabz shahri	\N
489	60910400193	Tibbiy profilaktika ishi-Shahrisabz tumani	\N
490	60910400161	Tibbiy profilaktika ishi-Shovot tumani	\N
491	60910400261	Tibbiy profilaktika ishi-Tuproqqal'a tumani	\N
492	60910400046	Tibbiy profilaktika ishi-Xiva shahri	\N
493	60910400164	Tibbiy profilaktika ishi-Xiva tumani	\N
494	60910400194	Tibbiy profilaktika ishi-Yakkabog' tumani	\N
495	60530901301	Fizika-Bobotog' hududi	\N
496	60530901171	Fizika-Denov tumani	\N
497	60530901173	Fizika-Muzrabot tumani	\N
498	60530901174	Fizika-Oltinsoy tumani	\N
499	60530901178	Fizika-Sherobod tumani	\N
500	60530901179	Fizika-Sho'rchi tumani	\N
501	60530901181	Fizika-Uzun tumani	\N
502	60530100301	Kimyo (turlari bo‘yicha)-Bobotog' hududi	\N
503	60530100171	Kimyo (turlari bo‘yicha)-Denov tumani	\N
504	60530100174	Kimyo (turlari bo‘yicha)-Oltinsoy tumani	\N
505	60530100176	Kimyo (turlari bo‘yicha)-Qumqo'rg'on tumani	\N
506	60530100177	Kimyo (turlari bo‘yicha)-Sariosiyo tumani	\N
507	60530100178	Kimyo (turlari bo‘yicha)-Sherobod tumani	\N
508	60530100181	Kimyo (turlari bo‘yicha)-Uzun tumani	\N
509	60540100301	Matematika-Bobotog' hududi	\N
510	60540100170	Matematika-Boysun tumani	\N
511	60540100171	Matematika-Denov tumani	\N
512	60540100173	Matematika-Muzrabot tumani	\N
513	60540100174	Matematika-Oltinsoy tumani	\N
514	60540100177	Matematika-Sariosiyo tumani	\N
515	60540100181	Matematika-Uzun tumani	\N
516	60112419	Professional ta'lim: axborot tizimlari va texnologiyalari	\N
517	60112410	Professional ta'lim: qishloq xo‘jalik mahsulotlarini saqlash va dastlabki ishlash texnologiyasi	\N
518	60112413	Professional ta’lim: qishloq xo‘jaligini mexanizatsiyalashtirish	\N
519	60530700	Tuproqshunoslik	\N
520	60721203	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi (milliy tikuv buyumlari)	\N
521	60810901	Agronomiya (sabzavotchilik va polizchilik)	\N
522	60411209	Menejment: madaniy merosni boshqarish	\N
523	60112000	Chaqiriqqacha harbiy ta’lim	\N
524	60920103002	Ijtimoiy ish: oila va bolalar bilan ishlash-Andijon viloyati	\N
525	60920103004	Ijtimoiy ish: oila va bolalar bilan ishlash-Farg‘ona viloyati	\N
526	60111801	Xorijiy til va adabiyoti: fransuz tili	\N
527	60111803	Xorijiy til va adabiyoti: nemis tili	\N
528	60811503	Zooinjeneriya: asalarichilik	\N
529	60112417	Professional ta'lim: elektr texnikasi, elektr mexanikasi va elektr texnologiyalari	\N
530	60611001	Telekommunikatsiya texnologiyalari (“Telekommunikatsiyalar”)	\N
531	60720703	Texnologik mashinalar va jihozlar (elektronika sanoati)	\N
532	60721201	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi (charm buyumlari texnologiyasi)	\N
533	60910200130	Davolash ishi-Beshariq tumani	\N
534	60910200131	Davolash ishi-Bog'dod tumani	\N
535	60910200132	Davolash ishi-Buvayda tumani	\N
536	60910200133	Davolash ishi-Dang'ara tumani	\N
537	60910200039	Davolash ishi-Farg'ona shahri	\N
538	60910200134	Davolash ishi-Farg'ona tumani	\N
539	60910200135	Davolash ishi-Furqat tumani	\N
540	60910200040	Davolash ishi-Marg'ilon shahri	\N
541	60910200139	Davolash ishi-O'zbekiston tumani	\N
542	60910200137	Davolash ishi-Oltiariq tumani	\N
543	60910200041	Davolash ishi-Qo'qon shahri	\N
544	60910200252	Davolash ishi-Qo'shtepa tumani	\N
545	60910200140	Davolash ishi-Quva tumani	\N
546	60910200042	Davolash ishi-Quvasoy shahri	\N
547	60910200141	Davolash ishi-Rishton tumani	\N
548	60910200142	Davolash ishi-So'x tumani	\N
549	60910200143	Davolash ishi-Toshloq tumani	\N
550	60910200144	Davolash ishi-Uchko'prik tumani	\N
551	60910200145	Davolash ishi-Yozyovon tumani	\N
552	60910300130	Pediatriya ishi-Beshariq tumani	\N
553	60910300131	Pediatriya ishi-Bog'dod tumani	\N
554	60910300132	Pediatriya ishi-Buvayda tumani	\N
555	60910300133	Pediatriya ishi-Dang'ara tumani	\N
556	60910300039	Pediatriya ishi-Farg'ona shahri	\N
557	60910300134	Pediatriya ishi-Farg'ona tumani	\N
558	60910300135	Pediatriya ishi-Furqat tumani	\N
559	60910300040	Pediatriya ishi-Marg'ilon shahri	\N
560	60910300139	Pediatriya ishi-O'zbekiston tumani	\N
561	60910300137	Pediatriya ishi-Oltiariq tumani	\N
562	60910300041	Pediatriya ishi-Qo'qon shahri	\N
563	60910300252	Pediatriya ishi-Qo'shtepa tumani	\N
564	60910300140	Pediatriya ishi-Quva tumani	\N
565	60910300042	Pediatriya ishi-Quvasoy shahri	\N
566	60910300141	Pediatriya ishi-Rishton tumani	\N
567	60910300142	Pediatriya ishi-So'x tumani	\N
568	60910300143	Pediatriya ishi-Toshloq tumani	\N
569	60910300144	Pediatriya ishi-Uchko'prik tumani	\N
570	60910300145	Pediatriya ishi-Yozyovon tumani	\N
571	60910400130	Tibbiy profilaktika ishi-Beshariq tumani	\N
572	60910400131	Tibbiy profilaktika ishi-Bog'dod tumani	\N
573	60910400132	Tibbiy profilaktika ishi-Buvayda tumani	\N
574	60910400133	Tibbiy profilaktika ishi-Dang'ara tumani	\N
575	60910400039	Tibbiy profilaktika ishi-Farg'ona shahri	\N
576	60910400134	Tibbiy profilaktika ishi-Farg'ona tumani	\N
577	60910400135	Tibbiy profilaktika ishi-Furqat tumani	\N
578	60910400040	Tibbiy profilaktika ishi-Marg'ilon shahri	\N
579	60910400139	Tibbiy profilaktika ishi-O'zbekiston tumani	\N
580	60910400137	Tibbiy profilaktika ishi-Oltiariq tumani	\N
581	60910400041	Tibbiy profilaktika ishi-Qo'qon shahri	\N
582	60910400252	Tibbiy profilaktika ishi-Qo'shtepa tumani	\N
583	60910400140	Tibbiy profilaktika ishi-Quva tumani	\N
584	60910400042	Tibbiy profilaktika ishi-Quvasoy shahri	\N
585	60910400141	Tibbiy profilaktika ishi-Rishton tumani	\N
586	60910400142	Tibbiy profilaktika ishi-So'x tumani	\N
587	60910400143	Tibbiy profilaktika ishi-Toshloq tumani	\N
588	60910400144	Tibbiy profilaktika ishi-Uchko'prik tumani	\N
589	60910400145	Tibbiy profilaktika ishi-Yozyovon tumani	\N
590	60911100	Xalq tabobati 	\N
591	60540200182	Amaliy matematika-Chiroqchi tumani	\N
592	60540200183	Amaliy matematika-Dehqonobod tumani	\N
593	60540200185	Amaliy matematika-Kasbi tumani	\N
594	60540200186	Amaliy matematika-Kitob tumani	\N
595	60540200188	Amaliy matematika-Mirishkor tumani	\N
596	60540200190	Amaliy matematika-Nishon tumani	\N
597	60540200194	Amaliy matematika-Yakkabog' tumani	\N
598	60510102194	Biologiya (turlari bo‘yicha)-Yakkabog' tumani	\N
599	60910200182	Davolash ishi-Chiroqchi tumani	\N
600	60910200183	Davolash ishi-Dehqonobod tumani	\N
601	60910200184	Davolash ishi-G'uzor tumani	\N
602	60910200185	Davolash ishi-Kasbi tumani	\N
603	60910200186	Davolash ishi-Kitob tumani	\N
604	60910200187	Davolash ishi-Koson tumani	\N
605	60910200188	Davolash ishi-Mirishkor tumani	\N
606	60910200191	Davolash ishi-Qamashi tumani	\N
607	60910200192	Davolash ishi-Qarshi tumani	\N
608	60230101183	Filologiya va tillarni o‘qitish: ingliz tili-Dehqonobod tumani	\N
609	60230101185	Filologiya va tillarni o‘qitish: ingliz tili-Kasbi tumani	\N
610	60230101187	Filologiya va tillarni o‘qitish: ingliz tili-Koson tumani	\N
611	60230101188	Filologiya va tillarni o‘qitish: ingliz tili-Mirishkor tumani	\N
612	60230101190	Filologiya va tillarni o‘qitish: ingliz tili-Nishon tumani	\N
613	60230104182	Filologiya va tillarni o‘qitish: o‘zbek tili-Chiroqchi tumani	\N
614	60230104183	Filologiya va tillarni o‘qitish: o‘zbek tili-Dehqonobod tumani	\N
615	60230104186	Filologiya va tillarni o‘qitish: o‘zbek tili-Kitob tumani	\N
616	60230104188	Filologiya va tillarni o‘qitish: o‘zbek tili-Mirishkor tumani	\N
617	60230104190	Filologiya va tillarni o‘qitish: o‘zbek tili-Nishon tumani	\N
618	60230104193	Filologiya va tillarni o‘qitish: o‘zbek tili-Shahrisabz tumani	\N
619	60230104194	Filologiya va tillarni o‘qitish: o‘zbek tili-Yakkabog' tumani	\N
620	60230107182	Filologiya va tillarni o‘qitish: rus tili-Chiroqchi tumani	\N
621	60230107183	Filologiya va tillarni o‘qitish: rus tili-Dehqonobod tumani	\N
622	60230107185	Filologiya va tillarni o‘qitish: rus tili-Kasbi tumani	\N
623	60230107187	Filologiya va tillarni o‘qitish: rus tili-Koson tumani	\N
624	60230107188	Filologiya va tillarni o‘qitish: rus tili-Mirishkor tumani	\N
625	60230107190	Filologiya va tillarni o‘qitish: rus tili-Nishon tumani	\N
626	60530901185	Fizika-Kasbi tumani	\N
627	60530901190	Fizika-Nishon tumani	\N
628	60530901193	Fizika-Shahrisabz tumani	\N
629	60530901194	Fizika-Yakkabog' tumani	\N
630	60530400185	Geografiya-Kasbi tumani	\N
631	60530400194	Geografiya-Yakkabog' tumani	\N
632	60530100186	Kimyo (turlari bo‘yicha)-Kitob tumani	\N
633	60530100193	Kimyo (turlari bo‘yicha)-Shahrisabz tumani	\N
634	60530100194	Kimyo (turlari bo‘yicha)-Yakkabog' tumani	\N
635	60610100182	Kompyuter ilmlari va dasturlash texnologiyalari (yo‘nalishlar bo‘yicha)-Chiroqchi tumani	\N
636	60610100194	Kompyuter ilmlari va dasturlash texnologiyalari (yo‘nalishlar bo‘yicha)-Yakkabog' tumani	\N
637	60540100182	Matematika-Chiroqchi tumani	\N
638	60540100185	Matematika-Kasbi tumani	\N
639	60540100188	Matematika-Mirishkor tumani	\N
640	60540100190	Matematika-Nishon tumani	\N
641	60540100194	Matematika-Yakkabog' tumani	\N
642	60910300182	Pediatriya ishi-Chiroqchi tumani	\N
643	60910300183	Pediatriya ishi-Dehqonobod tumani	\N
644	60910300184	Pediatriya ishi-G'uzor tumani	\N
645	60910300185	Pediatriya ishi-Kasbi tumani	\N
646	60910300186	Pediatriya ishi-Kitob tumani	\N
647	60910300187	Pediatriya ishi-Koson tumani	\N
648	60910300188	Pediatriya ishi-Mirishkor tumani	\N
649	60910300191	Pediatriya ishi-Qamashi tumani	\N
650	60910300192	Pediatriya ishi-Qarshi tumani	\N
651	60220307186	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)-Kitob tumani	\N
652	60220307193	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)-Shahrisabz tumani	\N
653	60220307194	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)-Yakkabog' tumani	\N
654	60230123	Filologiya va tillarni o‘qitish: qoraqalpoq tili	\N
655	60230110	Filologiya va tillarni o‘qitish: qozoq tili	\N
656	60230105	Filologiya va tillarni o‘qitish: turkman tili	\N
657	60320110	Jurnalistika: sport jurnalistikasi	\N
658	60320107	Jurnalistika: teleradio jurnalistikasi	\N
659	60212000	Madaniyat va san’at muassasalarini tashkil etish hamda boshqarish	\N
660	60230122	Filologiya va tillarni o‘qitish: italyan tili	\N
661	60111804216	Xorijiy til va adabiyoti: ingliz tili-Ishtixon tumani	\N
662	60111804218	Xorijiy til va adabiyoti: ingliz tili-Kattaqo'rg'on tumani	\N
663	60111804219	Xorijiy til va adabiyoti: ingliz tili-Narpay tumani	\N
664	60111804220	Xorijiy til va adabiyoti: ingliz tili-Nurobod tumani	\N
665	60111804223	Xorijiy til va adabiyoti: ingliz tili-Paxtachi tumani	\N
666	60111804224	Xorijiy til va adabiyoti: ingliz tili-Payariq tumani	\N
667	60111804225	Xorijiy til va adabiyoti: ingliz tili-Qo'shrabot tumani	\N
668	60111804228	Xorijiy til va adabiyoti: ingliz tili-Urgut tumani	\N
669	60230104301	Filologiya va tillarni o‘qitish: o‘zbek tili-Bobotog' hududi	\N
670	60230104171	Filologiya va tillarni o‘qitish: o‘zbek tili-Denov tumani	\N
671	60230104174	Filologiya va tillarni o‘qitish: o‘zbek tili-Oltinsoy tumani	\N
672	60230104181	Filologiya va tillarni o‘qitish: o‘zbek tili-Uzun tumani	\N
673	60111701171	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Denov tumani	\N
674	60111701177	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Sariosiyo tumani	\N
675	60111701181	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Uzun tumani	\N
676	60111804301	Xorijiy til va adabiyoti: ingliz tili-Bobotog' hududi	\N
677	60111804171	Xorijiy til va adabiyoti: ingliz tili-Denov tumani	\N
678	60111804177	Xorijiy til va adabiyoti: ingliz tili-Sariosiyo tumani	\N
679	60910200093	Davolash ishi-Chimboy tumani	\N
680	60910200094	Davolash ishi-Ellikqal'a tumani	\N
681	60910200095	Davolash ishi-Kegeyli tumani	\N
682	60910200096	Davolash ishi-Mo'ynoq tumani	\N
683	60910200097	Davolash ishi-Nukus tumani	\N
684	60910200098	Davolash ishi-Qanliko'l tumani	\N
685	60910200100	Davolash ishi-Qo'ng'irot tumani	\N
686	60910200099	Davolash ishi-Qorao'zak tumani	\N
687	60910200101	Davolash ishi-Shumanay tumani	\N
688	60910200032	Davolash ishi-Taxiatosh tumani	\N
689	60910200102	Davolash ishi-Taxtako'pir tumani	\N
690	60910200103	Davolash ishi-To'rtko'l tumani	\N
691	60910200104	Davolash ishi-Xo'jayli tumani	\N
692	60910300091	Pediatriya ishi-Amudaryo tumani	\N
693	60910300092	Pediatriya ishi-Beruniy tumani	\N
694	60910300258	Pediatriya ishi-Bo‘zatov tumani	\N
695	60910300093	Pediatriya ishi-Chimboy tumani	\N
696	60910300094	Pediatriya ishi-Ellikqal'a tumani	\N
697	60910300095	Pediatriya ishi-Kegeyli tumani	\N
698	60910300096	Pediatriya ishi-Mo'ynoq tumani	\N
699	60910300031	Pediatriya ishi-Nukus shahri	\N
700	60910300097	Pediatriya ishi-Nukus tumani	\N
701	60910300098	Pediatriya ishi-Qanliko'l tumani	\N
702	60910300100	Pediatriya ishi-Qo'ng'irot tumani	\N
703	60910300099	Pediatriya ishi-Qorao'zak tumani	\N
704	60910300101	Pediatriya ishi-Shumanay tumani	\N
705	60910300032	Pediatriya ishi-Taxiatosh tumani	\N
706	60910300102	Pediatriya ishi-Taxtako'pir tumani	\N
707	60910300103	Pediatriya ishi-To'rtko'l tumani	\N
708	60910300104	Pediatriya ishi-Xo'jayli tumani	\N
709	60910600	Tibbiy-biologik ish	\N
710	60910600092	Tibbiy-biologik ish-Beruniy tumani	\N
711	60910600258	Tibbiy-biologik ish-Bo‘zatov tumani	\N
712	60910600094	Tibbiy-biologik ish-Ellikqal'a tumani	\N
713	60910600096	Tibbiy-biologik ish-Mo'ynoq tumani	\N
714	60910600031	Tibbiy-biologik ish-Nukus shahri	\N
715	60910600099	Tibbiy-biologik ish-Qorao'zak tumani	\N
716	60910600101	Tibbiy-biologik ish-Shumanay tumani	\N
717	60910600103	Tibbiy-biologik ish-To'rtko'l tumani	\N
718	60910600104	Tibbiy-biologik ish-Xo'jayli tumani	\N
719	60910400258	Tibbiy profilaktika ishi-Bo‘zatov tumani	\N
720	60910400102	Tibbiy profilaktika ishi-Taxtako'pir tumani	\N
721	60412000	Xalqaro iqtisodiyot va menejment (mintaqalar va faoliyat yo‘nalishlari bo‘yicha)	\N
722	60420103	Yurisprudensiya (xalqaro huquqiy faoliyat)	\N
723	60110900	Biologiya	\N
724	60110900198	Biologiya-Forish tumani	\N
725	60110500196	Boshlang‘ich ta’lim-Baxmal tumani	\N
726	60110500198	Boshlang‘ich ta’lim-Forish tumani	\N
727	60110500199	Boshlang‘ich ta’lim-G'allaorol tumani	\N
728	60910200197	Davolash ishi-Do'stlik tumani	\N
729	60910200199	Davolash ishi-G'allaorol tumani	\N
730	60910200204	Davolash ishi-Zafarobod tumani	\N
731	60910200205	Davolash ishi-Zarbdor tumani	\N
732	60910200206	Davolash ishi-Zomin tumani	\N
733	60110700198	Fizika va astronomiya-Forish tumani	\N
734	60110700199	Fizika va astronomiya-G'allaorol tumani	\N
735	60111000198	Geografiya va iqtisodiy bilim asoslari-Forish tumani	\N
736	60110800198	Kimyo-Forish tumani	\N
737	60112500	Maktab menejmenti	\N
738	60110600196	Matematika va informatika-Baxmal tumani	\N
739	60110600198	Matematika va informatika-Forish tumani	\N
740	60110600199	Matematika va informatika-G'allaorol tumani	\N
741	60110600200	Matematika va informatika-Sharof Rashidov tumani	\N
742	60112704	Maxsus pedagogika : oligofrenopedagogika	\N
743	60112703	Maxsus pedagogika : supdopedagogika	\N
744	60112100199	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi-G'allaorol tumani	\N
745	60111400198	O‘zbek tili va adabiyoti-Forish tumani	\N
746	60111701196	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Baxmal tumani	\N
747	60111701199	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-G'allaorol tumani	\N
748	60111701200	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Sharof Rashidov tumani	\N
749	60111507	Ona tili va adabiyot: rus tili va adabiyot	\N
750	60910300195	Pediatriya ishi-Arnasoy tumani	\N
751	60910300201	Pediatriya ishi-Mirzacho'l tumani	\N
752	60910300203	Pediatriya ishi-Yangiobod tumani	\N
753	60111100	Tarix	\N
754	60111100198	Tarix-Forish tumani	\N
755	60111804196	Xorijiy til va adabiyoti: ingliz tili-Baxmal tumani	\N
756	60111804198	Xorijiy til va adabiyoti: ingliz tili-Forish tumani	\N
757	60111804199	Xorijiy til va adabiyoti: ingliz tili-G'allaorol tumani	\N
758	60111804200	Xorijiy til va adabiyoti: ingliz tili-Sharof Rashidov tumani	\N
759	60110900094	Biologiya-Ellikqal'a tumani	\N
760	60110900103	Biologiya-To'rtko'l tumani	\N
761	60110500102	Boshlang‘ich ta’lim-Taxtako'pir tumani	\N
762	60110700258	Fizika va astronomiya-Bo‘zatov tumani	\N
763	60110700094	Fizika va astronomiya-Ellikqal'a tumani	\N
764	60110700102	Fizika va astronomiya-Taxtako'pir tumani	\N
765	60110700103	Fizika va astronomiya-To'rtko'l tumani	\N
766	60111000096	Geografiya va iqtisodiy bilim asoslari-Mo'ynoq tumani	\N
767	60111000102	Geografiya va iqtisodiy bilim asoslari-Taxtako'pir tumani	\N
768	60111000103	Geografiya va iqtisodiy bilim asoslari-To'rtko'l tumani	\N
769	60110800094	Kimyo-Ellikqal'a tumani	\N
770	60110800102	Kimyo-Taxtako'pir tumani	\N
771	60110600094	Matematika va informatika-Ellikqal'a tumani	\N
772	60110600096	Matematika va informatika-Mo'ynoq tumani	\N
773	60110600102	Matematika va informatika-Taxtako'pir tumani	\N
774	60110600103	Matematika va informatika-To'rtko'l tumani	\N
775	60112100094	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi-Ellikqal'a tumani	\N
776	60112100096	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi-Mo'ynoq tumani	\N
777	60111702	O‘zga tilli guruhlarda rus tili (qoraqalpoq guruhlari uchun)	\N
778	60111505	Ona tili va adabiyot: qoraqalpoq tili va adabiyot	\N
779	60111505258	Ona tili va adabiyot: qoraqalpoq tili va adabiyot-Bo‘zatov tumani	\N
780	60111505103	Ona tili va adabiyot: qoraqalpoq tili va adabiyot-To'rtko'l tumani	\N
781	60111507094	Ona tili va adabiyot: rus tili va adabiyot-Ellikqal'a tumani	\N
782	60111507096	Ona tili va adabiyot: rus tili va adabiyot-Mo'ynoq tumani	\N
783	60111507102	Ona tili va adabiyot: rus tili va adabiyot-Taxtako'pir tumani	\N
784	60111507103	Ona tili va adabiyot: rus tili va adabiyot-To'rtko'l tumani	\N
785	60111501	Ona tili va adabiyot: turkman tili va adabiyot	\N
786	60111100094	Tarix-Ellikqal'a tumani	\N
787	60111100096	Tarix-Mo'ynoq tumani	\N
788	60111100102	Tarix-Taxtako'pir tumani	\N
789	60111100103	Tarix-To'rtko'l tumani	\N
790	60111804094	Xorijiy til va adabiyoti: ingliz tili-Ellikqal'a tumani	\N
791	60111804096	Xorijiy til va adabiyoti: ingliz tili-Mo'ynoq tumani	\N
792	60111804102	Xorijiy til va adabiyoti: ingliz tili-Taxtako'pir tumani	\N
793	60110900210	Biologiya-Nurota tumani	\N
794	60110500208	Boshlang‘ich ta’lim-Konimex tumani	\N
795	60110500210	Boshlang‘ich ta’lim-Nurota tumani	\N
796	60110500212	Boshlang‘ich ta’lim-Tomdi tumani	\N
797	60110500213	Boshlang‘ich ta’lim-Uchquduq tumani	\N
798	60910200010	Davolash ishi-Navoiy viloyati	\N
799	60110700208	Fizika va astronomiya-Konimex tumani	\N
800	60110700210	Fizika va astronomiya-Nurota tumani	\N
801	60110700214	Fizika va astronomiya-Xatirchi tumani	\N
802	60111000210	Geografiya va iqtisodiy bilim asoslari-Nurota tumani	\N
803	60111000214	Geografiya va iqtisodiy bilim asoslari-Xatirchi tumani	\N
804	60110800208	Kimyo-Konimex tumani	\N
805	60110800210	Kimyo-Nurota tumani	\N
806	60110800213	Kimyo-Uchquduq tumani	\N
807	60110800214	Kimyo-Xatirchi tumani	\N
808	60110600210	Matematika va informatika-Nurota tumani	\N
809	60110600213	Matematika va informatika-Uchquduq tumani	\N
810	60110600214	Matematika va informatika-Xatirchi tumani	\N
811	60112100214	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi-Xatirchi tumani	\N
812	60111400208	O‘zbek tili va adabiyoti-Konimex tumani	\N
813	60111400210	O‘zbek tili va adabiyoti-Nurota tumani	\N
814	60111701208	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Konimex tumani	\N
815	60111701210	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Nurota tumani	\N
904	60111000301	Geografiya va iqtisodiy bilim asoslari-Bobotog' hududi	\N
816	60111701213	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Uchquduq tumani	\N
817	60111701214	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Xatirchi tumani	\N
818	60910300010	Pediatriya ishi-Navoiy viloyati	\N
819	60112401	Professional ta'lim: cholg‘u ijrochiligi (turlari bo‘yicha)	\N
820	60112414	Professional ta'lim: vokal san'ati (turlari bo'yicha)	\N
821	60111100213	Tarix-Uchquduq tumani	\N
822	60111100214	Tarix-Xatirchi tumani	\N
823	60111804208	Xorijiy til va adabiyoti: ingliz tili-Konimex tumani	\N
824	60111804210	Xorijiy til va adabiyoti: ingliz tili-Nurota tumani	\N
825	60111804212	Xorijiy til va adabiyoti: ingliz tili-Tomdi tumani	\N
826	60111804213	Xorijiy til va adabiyoti: ingliz tili-Uchquduq tumani	\N
827	60111804214	Xorijiy til va adabiyoti: ingliz tili-Xatirchi tumani	\N
828	60110900058	Biologiya-Angren shahri	\N
829	60110900242	Biologiya-Oqqo'rg'on tumani	\N
830	60110500247	Boshlang‘ich ta’lim-Quyichirchiq tumani	\N
831	60110700237	Fizika va astronomiya-Bekobod tumani	\N
832	60110700239	Fizika va astronomiya-Bo'stonliq tumani	\N
833	60110700240	Fizika va astronomiya-Chinoz tumani	\N
834	60110700241	Fizika va astronomiya-Ohangaron tumani	\N
835	60110700242	Fizika va astronomiya-Oqqo'rg'on tumani	\N
836	60110700247	Fizika va astronomiya-Quyichirchiq tumani	\N
837	60111000058	Geografiya va iqtisodiy bilim asoslari-Angren shahri	\N
838	60111000241	Geografiya va iqtisodiy bilim asoslari-Ohangaron tumani	\N
839	60111000247	Geografiya va iqtisodiy bilim asoslari-Quyichirchiq tumani	\N
840	60110800237	Kimyo-Bekobod tumani	\N
841	60110800241	Kimyo-Ohangaron tumani	\N
842	60110800242	Kimyo-Oqqo'rg'on tumani	\N
843	60110800247	Kimyo-Quyichirchiq tumani	\N
844	60110600058	Matematika va informatika-Angren shahri	\N
845	60110600237	Matematika va informatika-Bekobod tumani	\N
846	60110600238	Matematika va informatika-Bo'ka tumani	\N
847	60110600242	Matematika va informatika-Oqqo'rg'on tumani	\N
848	60110600247	Matematika va informatika-Quyichirchiq tumani	\N
849	60112701	Maxsus pedagogika : tiflopedagogika	\N
850	60112100237	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi-Bekobod tumani	\N
851	60112100247	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi-Quyichirchiq tumani	\N
852	60111400237	O‘zbek tili va adabiyoti-Bekobod tumani	\N
853	60111400242	O‘zbek tili va adabiyoti-Oqqo'rg'on tumani	\N
854	60111400247	O‘zbek tili va adabiyoti-Quyichirchiq tumani	\N
855	60111701238	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Bo'ka tumani	\N
856	60111701242	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Oqqo'rg'on tumani	\N
857	60111701247	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Quyichirchiq tumani	\N
858	60111507058	Ona tili va adabiyot: rus tili va adabiyot-Angren shahri	\N
859	60111507237	Ona tili va adabiyot: rus tili va adabiyot-Bekobod tumani	\N
860	60111507238	Ona tili va adabiyot: rus tili va adabiyot-Bo'ka tumani	\N
861	60111507242	Ona tili va adabiyot: rus tili va adabiyot-Oqqo'rg'on tumani	\N
862	60111507247	Ona tili va adabiyot: rus tili va adabiyot-Quyichirchiq tumani	\N
863	60111502	Ona tili va adabiyot: tojik tili va adabiyot	\N
864	60111100058	Tarix-Angren shahri	\N
865	60111100237	Tarix-Bekobod tumani	\N
866	60111100239	Tarix-Bo'stonliq tumani	\N
867	60111100240	Tarix-Chinoz tumani	\N
868	60111100241	Tarix-Ohangaron tumani	\N
869	60111100247	Tarix-Quyichirchiq tumani	\N
870	61010404	Turizm (turizm sohasida xizmatlar texnologiyasi va ularni tashkil etish)	\N
871	60111804058	Xorijiy til va adabiyoti: ingliz tili-Angren shahri	\N
872	60111804237	Xorijiy til va adabiyoti: ingliz tili-Bekobod tumani	\N
873	60111804238	Xorijiy til va adabiyoti: ingliz tili-Bo'ka tumani	\N
874	60111804239	Xorijiy til va adabiyoti: ingliz tili-Bo'stonliq tumani	\N
875	60111804242	Xorijiy til va adabiyoti: ingliz tili-Oqqo'rg'on tumani	\N
876	60111804247	Xorijiy til va adabiyoti: ingliz tili-Quyichirchiq tumani	\N
877	60110300	Maktabgacha ta’lim psixologiyasi va pedagogikasi	\N
878	60111506	Ona tili va adabiyot: koreys tili va adabiyot	\N
879	60112406	Professional ta'lim: texnologik mashinalar va jihozlar	\N
880	60110500134	Boshlang‘ich ta’lim-Farg'ona tumani	\N
881	60110500142	Boshlang‘ich ta’lim-So'x tumani	\N
882	60110700134	Fizika va astronomiya-Farg'ona tumani	\N
883	60110700141	Fizika va astronomiya-Rishton tumani	\N
884	60111000134	Geografiya va iqtisodiy bilim asoslari-Farg'ona tumani	\N
885	60111000141	Geografiya va iqtisodiy bilim asoslari-Rishton tumani	\N
886	60110600134	Matematika va informatika-Farg'ona tumani	\N
887	60110600141	Matematika va informatika-Rishton tumani	\N
888	60110600142	Matematika va informatika-So'x tumani	\N
889	60112100142	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi-So'x tumani	\N
890	60111400142	O‘zbek tili va adabiyoti-So'x tumani	\N
891	60111701141	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Rishton tumani	\N
892	60111701142	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-So'x tumani	\N
893	60111100142	Tarix-So'x tumani	\N
894	60111804134	Xorijiy til va adabiyoti: ingliz tili-Farg'ona tumani	\N
895	60111804142	Xorijiy til va adabiyoti: ingliz tili-So'x tumani	\N
896	60110900301	Biologiya-Bobotog' hududi	\N
897	60110900170	Biologiya-Boysun tumani	\N
898	60110900174	Biologiya-Oltinsoy tumani	\N
899	60110900178	Biologiya-Sherobod tumani	\N
900	60110500301	Boshlang‘ich ta’lim-Bobotog' hududi	\N
901	60110500170	Boshlang‘ich ta’lim-Boysun tumani	\N
902	60110500171	Boshlang‘ich ta’lim-Denov tumani	\N
903	60110500178	Boshlang‘ich ta’lim-Sherobod tumani	\N
905	60111000171	Geografiya va iqtisodiy bilim asoslari-Denov tumani	\N
906	60111000176	Geografiya va iqtisodiy bilim asoslari-Qumqo'rg'on tumani	\N
907	60111000178	Geografiya va iqtisodiy bilim asoslari-Sherobod tumani	\N
908	60111000181	Geografiya va iqtisodiy bilim asoslari-Uzun tumani	\N
909	60110600301	Matematika va informatika-Bobotog' hududi	\N
910	60110600170	Matematika va informatika-Boysun tumani	\N
911	60110600171	Matematika va informatika-Denov tumani	\N
912	60110600174	Matematika va informatika-Oltinsoy tumani	\N
913	60110600178	Matematika va informatika-Sherobod tumani	\N
914	60110600181	Matematika va informatika-Uzun tumani	\N
915	60112100171	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi-Denov tumani	\N
916	60112100174	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi-Oltinsoy tumani	\N
917	60112100178	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi-Sherobod tumani	\N
918	60111400170	O‘zbek tili va adabiyoti-Boysun tumani	\N
919	60111400176	O‘zbek tili va adabiyoti-Qumqo'rg'on tumani	\N
920	60111400178	O‘zbek tili va adabiyoti-Sherobod tumani	\N
921	60111701170	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Boysun tumani	\N
922	60111701173	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Muzrabot tumani	\N
923	60111701174	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Oltinsoy tumani	\N
924	60111701176	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Qumqo'rg'on tumani	\N
925	60111701178	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Sherobod tumani	\N
926	60111701179	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Sho'rchi tumani	\N
927	60111100301	Tarix-Bobotog' hududi	\N
928	60111100170	Tarix-Boysun tumani	\N
929	60111100171	Tarix-Denov tumani	\N
930	60111100174	Tarix-Oltinsoy tumani	\N
931	60111100181	Tarix-Uzun tumani	\N
932	60111804170	Xorijiy til va adabiyoti: ingliz tili-Boysun tumani	\N
933	60111804174	Xorijiy til va adabiyoti: ingliz tili-Oltinsoy tumani	\N
934	60111804176	Xorijiy til va adabiyoti: ingliz tili-Qumqo'rg'on tumani	\N
935	60111804178	Xorijiy til va adabiyoti: ingliz tili-Sherobod tumani	\N
936	60111804179	Xorijiy til va adabiyoti: ingliz tili-Sho'rchi tumani	\N
937	60111804180	Xorijiy til va adabiyoti: ingliz tili-Termiz tumani	\N
938	60111804181	Xorijiy til va adabiyoti: ingliz tili-Uzun tumani	\N
939	60410103	Buxgalteriya hisobi va audit	\N
940	60310106	Iqtisodiyot: oziq-ovqat va resurslar iqtisodiyoti	\N
941	60910200033	Davolash ishi-Andijon shahri	\N
942	60910200105	Davolash ishi-Andijon tumani	\N
943	60910200106	Davolash ishi-Asaka tumani	\N
944	60910200107	Davolash ishi-Baliqchi tumani	\N
945	60910200257	Davolash ishi-Bo'ston tumani	\N
946	60910200109	Davolash ishi-Buloqboshi tumani	\N
947	60910200110	Davolash ishi-Izboskan tumani	\N
948	60910200111	Davolash ishi-Jalaquduq tumani	\N
949	60910200121	Davolash ishi-Kosonsoy tumani	\N
950	60910200112	Davolash ishi-Marxamat tumani	\N
951	60910200113	Davolash ishi-Oltinko'l tumani	\N
952	60910200114	Davolash ishi-Paxtaobod tumani	\N
953	60910200115	Davolash ishi-Qo'rg'ontepa tumani	\N
954	60910200260	Davolash ishi-Qorasuv shahri	\N
955	60910200116	Davolash ishi-Shaxrixon tumani	\N
956	60910200117	Davolash ishi-Ulug'nor tumani	\N
957	60910200128	Davolash ishi-Uychi tumani	\N
958	60910200118	Davolash ishi-Xo'jaobod tumani	\N
959	60910200037	Davolash ishi-Xonobod shahri	\N
960	60910300033	Pediatriya ishi-Andijon shahri	\N
961	60910300105	Pediatriya ishi-Andijon tumani	\N
962	60910300106	Pediatriya ishi-Asaka tumani	\N
963	60910300107	Pediatriya ishi-Baliqchi tumani	\N
964	60910300257	Pediatriya ishi-Bo'ston tumani	\N
965	60910300109	Pediatriya ishi-Buloqboshi tumani	\N
966	60910300110	Pediatriya ishi-Izboskan tumani	\N
967	60910300111	Pediatriya ishi-Jalaquduq tumani	\N
968	60910300112	Pediatriya ishi-Marxamat tumani	\N
969	60910300038	Pediatriya ishi-Namangan shahri	\N
970	60910300113	Pediatriya ishi-Oltinko'l tumani	\N
971	60910300114	Pediatriya ishi-Paxtaobod tumani	\N
972	60910300115	Pediatriya ishi-Qo'rg'ontepa tumani	\N
973	60910300260	Pediatriya ishi-Qorasuv shahri	\N
974	60910300116	Pediatriya ishi-Shaxrixon tumani	\N
975	60910300117	Pediatriya ishi-Ulug'nor tumani	\N
976	60910300118	Pediatriya ishi-Xo'jaobod tumani	\N
977	60910300037	Pediatriya ishi-Xonobod shahri	\N
978	60910800	Sanoat farmatsiyasi (turlari bo‘yicha)	\N
979	60910400105	Tibbiy profilaktika ishi-Andijon tumani	\N
980	60910400106	Tibbiy profilaktika ishi-Asaka tumani	\N
981	60910400107	Tibbiy profilaktika ishi-Baliqchi tumani	\N
982	60910400257	Tibbiy profilaktika ishi-Bo'ston tumani	\N
983	60910400109	Tibbiy profilaktika ishi-Buloqboshi tumani	\N
984	60910400110	Tibbiy profilaktika ishi-Izboskan tumani	\N
985	60910400121	Tibbiy profilaktika ishi-Kosonsoy tumani	\N
986	60910400112	Tibbiy profilaktika ishi-Marxamat tumani	\N
987	60910400123	Tibbiy profilaktika ishi-Namangan tumani	\N
988	60910400115	Tibbiy profilaktika ishi-Qo'rg'ontepa tumani	\N
989	60910400260	Tibbiy profilaktika ishi-Qorasuv shahri	\N
990	60910400116	Tibbiy profilaktika ishi-Shaxrixon tumani	\N
991	60910400127	Tibbiy profilaktika ishi-Uchqo'rg'on tumani	\N
992	60910400117	Tibbiy profilaktika ishi-Ulug'nor tumani	\N
993	60910400128	Tibbiy profilaktika ishi-Uychi tumani	\N
994	60910400118	Tibbiy profilaktika ishi-Xo'jaobod tumani	\N
995	60910400037	Tibbiy profilaktika ishi-Xonobod shahri	\N
996	60910200043	Davolash ishi-Buxoro shahri	\N
997	60910200146	Davolash ishi-Buxoro tumani	\N
998	60910200147	Davolash ishi-G'ijduvon tumani	\N
999	60910200064	Davolash ishi-G'ozg'on shahri	\N
1000	60910200148	Davolash ishi-Jondor tumani	\N
1001	60910200207	Davolash ishi-Karmana tumani	\N
1002	60910200044	Davolash ishi-Kogon shahri	\N
1003	60910200149	Davolash ishi-Kogon tumani	\N
1004	60910200208	Davolash ishi-Konimex tumani	\N
1005	60910200209	Davolash ishi-Navbahor tumani	\N
1006	60910200210	Davolash ishi-Nurota tumani	\N
1007	60910200150	Davolash ishi-Olot tumani	\N
1008	60910200151	Davolash ishi-Peshku tumani	\N
1009	60910200211	Davolash ishi-Qiziltepa tumani	\N
1010	60910200152	Davolash ishi-Qorako'l tumani	\N
1011	60910200153	Davolash ishi-Qorovulbozor tumani	\N
1012	60910200154	Davolash ishi-Romitan tumani	\N
1013	60910200155	Davolash ishi-Shofirkon tumani	\N
1014	60910200156	Davolash ishi-Vobkent tumani	\N
1015	60910200214	Davolash ishi-Xatirchi tumani	\N
1016	60910200052	Davolash ishi-Zarafshon shahri	\N
1017	60910300043	Pediatriya ishi-Buxoro shahri	\N
1018	60910300146	Pediatriya ishi-Buxoro tumani	\N
1019	60910300147	Pediatriya ishi-G'ijduvon tumani	\N
1020	60910300148	Pediatriya ishi-Jondor tumani	\N
1021	60910300044	Pediatriya ishi-Kogon shahri	\N
1022	60910300149	Pediatriya ishi-Kogon tumani	\N
1023	60910300150	Pediatriya ishi-Olot tumani	\N
1024	60910300151	Pediatriya ishi-Peshku tumani	\N
1025	60910300152	Pediatriya ishi-Qorako'l tumani	\N
1026	60910300153	Pediatriya ishi-Qorovulbozor tumani	\N
1027	60910300154	Pediatriya ishi-Romitan tumani	\N
1028	60910300155	Pediatriya ishi-Shofirkon tumani	\N
1029	60910300156	Pediatriya ishi-Vobkent tumani	\N
1030	60910600043	Tibbiy-biologik ish-Buxoro shahri	\N
1031	60910600147	Tibbiy-biologik ish-G'ijduvon tumani	\N
1032	60910600148	Tibbiy-biologik ish-Jondor tumani	\N
1033	60910600207	Tibbiy-biologik ish-Karmana tumani	\N
1034	60910600149	Tibbiy-biologik ish-Kogon tumani	\N
1035	60910600051	Tibbiy-biologik ish-Navoiy shahri	\N
1036	60910600210	Tibbiy-biologik ish-Nurota tumani	\N
1037	60910600150	Tibbiy-biologik ish-Olot tumani	\N
1038	60910600211	Tibbiy-biologik ish-Qiziltepa tumani	\N
1039	60910600152	Tibbiy-biologik ish-Qorako'l tumani	\N
1040	60910600154	Tibbiy-biologik ish-Romitan tumani	\N
1041	60910600155	Tibbiy-biologik ish-Shofirkon tumani	\N
1042	60910400043	Tibbiy profilaktika ishi-Buxoro shahri	\N
1043	60910400147	Tibbiy profilaktika ishi-G'ijduvon tumani	\N
1044	60910400148	Tibbiy profilaktika ishi-Jondor tumani	\N
1045	60910400207	Tibbiy profilaktika ishi-Karmana tumani	\N
1046	60910400149	Tibbiy profilaktika ishi-Kogon tumani	\N
1047	60910400051	Tibbiy profilaktika ishi-Navoiy shahri	\N
1048	60910400211	Tibbiy profilaktika ishi-Qiziltepa tumani	\N
1049	60910400152	Tibbiy profilaktika ishi-Qorako'l tumani	\N
1050	60910400214	Tibbiy profilaktika ishi-Xatirchi tumani	\N
1051	60910200215	Davolash ishi-Bulung'ur tumani	\N
1052	60910200216	Davolash ishi-Ishtixon tumani	\N
1053	60910200217	Davolash ishi-Jomboy tumani	\N
1054	60910200053	Davolash ishi-Kattaqo'rg'on shahri	\N
1055	60910200218	Davolash ishi-Kattaqo'rg'on tumani	\N
1056	60910200263	Davolash ishi-Kukdala tumani	\N
1057	60910200219	Davolash ishi-Narpay tumani	\N
1058	60910200190	Davolash ishi-Nishon tumani	\N
1059	60910200220	Davolash ishi-Nurobod tumani	\N
1060	60910200221	Davolash ishi-Oqdaryo tumani	\N
1061	60910200222	Davolash ishi-Pastdarg'om tumani	\N
1062	60910200223	Davolash ishi-Paxtachi tumani	\N
1063	60910200224	Davolash ishi-Payariq tumani	\N
1064	60910200048	Davolash ishi-Qarshi shahri	\N
1065	60910200054	Davolash ishi-Samarqand shahri	\N
1066	60910200226	Davolash ishi-Samarqand tumani	\N
1067	60910200253	Davolash ishi-Shahrisabz shahri	\N
1068	60910200227	Davolash ishi-Tayloq tumani	\N
1069	60910200228	Davolash ishi-Urgut tumani	\N
1070	60910200194	Davolash ishi-Yakkabog' tumani	\N
1071	60910300255	Pediatriya ishi-Bandixon tumani	\N
1072	60910300171	Pediatriya ishi-Denov tumani	\N
1073	60910300064	Pediatriya ishi-G'ozg'on shahri	\N
1074	60910300216	Pediatriya ishi-Ishtixon tumani	\N
1075	60910300207	Pediatriya ishi-Karmana tumani	\N
1076	60910300218	Pediatriya ishi-Kattaqo'rg'on tumani	\N
1077	60910300263	Pediatriya ishi-Kukdala tumani	\N
1078	60910300189	Pediatriya ishi-Muborak tumani	\N
1079	60910300219	Pediatriya ishi-Narpay tumani	\N
1080	60910300209	Pediatriya ishi-Navbahor tumani	\N
1081	60910300051	Pediatriya ishi-Navoiy shahri	\N
1082	60910300190	Pediatriya ishi-Nishon tumani	\N
1083	60910300220	Pediatriya ishi-Nurobod tumani	\N
1084	60910300210	Pediatriya ishi-Nurota tumani	\N
1085	60910300174	Pediatriya ishi-Oltinsoy tumani	\N
1086	60910300221	Pediatriya ishi-Oqdaryo tumani	\N
1087	60910300223	Pediatriya ishi-Paxtachi tumani	\N
1088	60910300224	Pediatriya ishi-Payariq tumani	\N
1089	60910300048	Pediatriya ishi-Qarshi shahri	\N
1090	60910300211	Pediatriya ishi-Qiziltepa tumani	\N
1091	60910300175	Pediatriya ishi-Qiziriq tumani	\N
1092	60910300225	Pediatriya ishi-Qo'shrabot tumani	\N
1093	60910300054	Pediatriya ishi-Samarqand shahri	\N
1094	60910300253	Pediatriya ishi-Shahrisabz shahri	\N
1095	60910300193	Pediatriya ishi-Shahrisabz tumani	\N
1096	60910300047	Pediatriya ishi-Termiz shahri	\N
1097	60910300228	Pediatriya ishi-Urgut tumani	\N
1098	60910300214	Pediatriya ishi-Xatirchi tumani	\N
1099	60910300194	Pediatriya ishi-Yakkabog' tumani	\N
1100	60910300052	Pediatriya ishi-Zarafshon shahri	\N
1101	60910600224	Tibbiy-biologik ish-Payariq tumani	\N
1102	60910600225	Tibbiy-biologik ish-Qo'shrabot tumani	\N
1103	60910600226	Tibbiy-biologik ish-Samarqand tumani	\N
1104	60910200195	Davolash ishi-Arnasoy tumani	\N
1105	60910200196	Davolash ishi-Baxmal tumani	\N
1106	60910200229	Davolash ishi-Boyovut tumani	\N
1107	60910200119	Davolash ishi-Chortoq tumani	\N
1108	60910200120	Davolash ishi-Chust tumani	\N
1109	60910200198	Davolash ishi-Forish tumani	\N
1110	60910200055	Davolash ishi-Guliston shahri	\N
1111	60910200230	Davolash ishi-Guliston tumani	\N
1112	60910200172	Davolash ishi-Jarqo'rg'on tumani	\N
1113	60910200050	Davolash ishi-Jizzax shahri	\N
1114	60910200122	Davolash ishi-Mingbuloq tumani	\N
1115	60910200201	Davolash ishi-Mirzacho'l tumani	\N
1116	60910200231	Davolash ishi-Mirzaobod tumani	\N
1117	60910200038	Davolash ishi-Namangan shahri	\N
1118	60910200123	Davolash ishi-Namangan tumani	\N
1119	60910200124	Davolash ishi-Norin tumani	\N
1120	60910200232	Davolash ishi-Oqoltin tumani	\N
1121	60910200202	Davolash ishi-Paxtakor tumani	\N
1122	60910200125	Davolash ishi-Pop tumani	\N
1123	60910200233	Davolash ishi-Sardoba tumani	\N
1124	60910200234	Davolash ishi-Sayxunobod tumani	\N
1125	60910200200	Davolash ishi-Sharof Rashidov tumani	\N
1126	60910200056	Davolash ishi-Shirin shahri	\N
1127	60910200235	Davolash ishi-Sirdaryo tumani	\N
1128	60910200047	Davolash ishi-Termiz shahri	\N
1129	60910200126	Davolash ishi-To'raqo'rg'on tumani	\N
1130	60910200014	Davolash ishi-Toshkent shahri	\N
1131	60910200127	Davolash ishi-Uchqo'rg'on tumani	\N
1132	60910200236	Davolash ishi-Xovos tumani	\N
1133	60910200203	Davolash ishi-Yangiobod tumani	\N
1134	60910200129	Davolash ishi-Yangiqo'rg'on tumani	\N
1135	60910200057	Davolash ishi-Yangiyer shahri	\N
1136	60411201	Menejment : sog'liqni saqlash menejmenti 	\N
1137	60910600171	Tibbiy-biologik ish-Denov tumani	\N
1138	60910600039	Tibbiy-biologik ish-Farg'ona shahri	\N
1139	60910600134	Tibbiy-biologik ish-Farg'ona tumani	\N
1140	60910600055	Tibbiy-biologik ish-Guliston shahri	\N
1141	60910600172	Tibbiy-biologik ish-Jarqo'rg'on tumani	\N
1142	60910600040	Tibbiy-biologik ish-Marg'ilon shahri	\N
1143	60910600173	Tibbiy-biologik ish-Muzrabot tumani	\N
1144	60910600038	Tibbiy-biologik ish-Namangan shahri	\N
1145	60910600123	Tibbiy-biologik ish-Namangan tumani	\N
1146	60910600174	Tibbiy-biologik ish-Oltinsoy tumani	\N
1147	60910600175	Tibbiy-biologik ish-Qiziriq tumani	\N
1148	60910600041	Tibbiy-biologik ish-Qo'qon shahri	\N
1149	60910600252	Tibbiy-biologik ish-Qo'shtepa tumani	\N
1150	60910600176	Tibbiy-biologik ish-Qumqo'rg'on tumani	\N
1151	60910600140	Tibbiy-biologik ish-Quva tumani	\N
1152	60910600178	Tibbiy-biologik ish-Sherobod tumani	\N
1153	60910600047	Tibbiy-biologik ish-Termiz shahri	\N
1154	60910600014	Tibbiy-biologik ish-Toshkent shahri	\N
1155	60910600127	Tibbiy-biologik ish-Uchqo'rg'on tumani	\N
1156	60910600128	Tibbiy-biologik ish-Uychi tumani	\N
1157	60910600181	Tibbiy-biologik ish-Uzun tumani	\N
1158	60910600129	Tibbiy-biologik ish-Yangiqo'rg'on tumani	\N
1159	60910400168	Tibbiy profilaktika ishi-Angor tumani	\N
1160	60910400255	Tibbiy profilaktika ishi-Bandixon tumani	\N
1161	60910400196	Tibbiy profilaktika ishi-Baxmal tumani	\N
1162	60910400170	Tibbiy profilaktika ishi-Boysun tumani	\N
1163	60910400197	Tibbiy profilaktika ishi-Do'stlik tumani	\N
1164	60910400198	Tibbiy profilaktika ishi-Forish tumani	\N
1165	60910400199	Tibbiy profilaktika ishi-G'allaorol tumani	\N
1166	60910400172	Tibbiy profilaktika ishi-Jarqo'rg'on tumani	\N
1167	60910400050	Tibbiy profilaktika ishi-Jizzax shahri	\N
1168	60910400201	Tibbiy profilaktika ishi-Mirzacho'l tumani	\N
1169	60910400231	Tibbiy profilaktika ishi-Mirzaobod tumani	\N
1170	60910400243	Tibbiy profilaktika ishi-O'rtachirchiq tumani	\N
1171	60910400202	Tibbiy profilaktika ishi-Paxtakor tumani	\N
1172	60910400245	Tibbiy profilaktika ishi-Piskent tumani	\N
1173	60910400176	Tibbiy profilaktika ishi-Qumqo'rg'on tumani	\N
1174	60910400177	Tibbiy profilaktika ishi-Sariosiyo tumani	\N
1175	60910400178	Tibbiy profilaktika ishi-Sherobod tumani	\N
1176	60910400179	Tibbiy profilaktika ishi-Sho'rchi tumani	\N
1177	60910400235	Tibbiy profilaktika ishi-Sirdaryo tumani	\N
1178	60910400047	Tibbiy profilaktika ishi-Termiz shahri	\N
1179	60910400180	Tibbiy profilaktika ishi-Termiz tumani	\N
1180	60910400014	Tibbiy profilaktika ishi-Toshkent shahri	\N
1181	60910400181	Tibbiy profilaktika ishi-Uzun tumani	\N
1182	60910400203	Tibbiy profilaktika ishi-Yangiobod tumani	\N
1183	60910400250	Tibbiy profilaktika ishi-Yuqorichirchiq tumani	\N
1184	60910400204	Tibbiy profilaktika ishi-Zafarobod tumani	\N
1185	60910400205	Tibbiy profilaktika ishi-Zarbdor tumani	\N
1186	60910400206	Tibbiy profilaktika ishi-Zomin tumani	\N
1187	60910200240	Davolash ishi-Chinoz tumani	\N
1188	60910200242	Davolash ishi-Oqqo'rg'on tumani	\N
1189	60910200248	Davolash ishi-Toshkent tumani	\N
1190	60910200249	Davolash ishi-Yangiyo'l tumani	\N
1191	60910300058	Pediatriya ishi-Angren shahri	\N
1192	60910300059	Pediatriya ishi-Bekobod shahri	\N
1193	60910300237	Pediatriya ishi-Bekobod tumani	\N
1194	60910300238	Pediatriya ishi-Bo'ka tumani	\N
1195	60910300239	Pediatriya ishi-Bo'stonliq tumani	\N
1196	60910300229	Pediatriya ishi-Boyovut tumani	\N
1197	60910300240	Pediatriya ishi-Chinoz tumani	\N
1198	60910300060	Pediatriya ishi-Chirchiq shahri	\N
1199	60910300055	Pediatriya ishi-Guliston shahri	\N
1200	60910300230	Pediatriya ishi-Guliston tumani	\N
1201	60910300231	Pediatriya ishi-Mirzaobod tumani	\N
1202	60910300254	Pediatriya ishi-Nurafshon shahri	\N
1203	60910300061	Pediatriya ishi-Ohangaron shahri	\N
1204	60910300241	Pediatriya ishi-Ohangaron tumani	\N
1205	60910300062	Pediatriya ishi-Olmaliq shahri	\N
1206	60910300232	Pediatriya ishi-Oqoltin tumani	\N
1207	60910300242	Pediatriya ishi-Oqqo'rg'on tumani	\N
1208	60910300244	Pediatriya ishi-Parkent tumani	\N
1209	60910300245	Pediatriya ishi-Piskent tumani	\N
1210	60910300246	Pediatriya ishi-Qibray tumani	\N
1211	60910300247	Pediatriya ishi-Quyichirchiq tumani	\N
1212	60910300234	Pediatriya ishi-Sayxunobod tumani	\N
1213	60910300056	Pediatriya ishi-Shirin shahri	\N
1214	60910300235	Pediatriya ishi-Sirdaryo tumani	\N
1215	60910300014	Pediatriya ishi-Toshkent shahri	\N
1216	60910300248	Pediatriya ishi-Toshkent tumani	\N
1217	60910300057	Pediatriya ishi-Yangiyer shahri	\N
1218	60910300249	Pediatriya ishi-Yangiyo'l tumani	\N
1219	60910300251	Pediatriya ishi-Zangiota tumani	\N
1220	60910600195	Tibbiy-biologik ish-Arnasoy tumani	\N
1221	60910600237	Tibbiy-biologik ish-Bekobod tumani	\N
1222	60910600238	Tibbiy-biologik ish-Bo'ka tumani	\N
1223	60910600239	Tibbiy-biologik ish-Bo'stonliq tumani	\N
1224	60910600240	Tibbiy-biologik ish-Chinoz tumani	\N
1225	60910600199	Tibbiy-biologik ish-G'allaorol tumani	\N
1226	60910600241	Tibbiy-biologik ish-Ohangaron tumani	\N
1227	60910600062	Tibbiy-biologik ish-Olmaliq shahri	\N
1228	60910600232	Tibbiy-biologik ish-Oqoltin tumani	\N
1229	60910600242	Tibbiy-biologik ish-Oqqo'rg'on tumani	\N
1230	60910600247	Tibbiy-biologik ish-Quyichirchiq tumani	\N
1231	60910600249	Tibbiy-biologik ish-Yangiyo'l tumani	\N
1232	60910600250	Tibbiy-biologik ish-Yuqorichirchiq tumani	\N
1233	60910200168	Davolash ishi-Angor tumani	\N
1234	60910200255	Davolash ishi-Bandixon tumani	\N
1235	60910200301	Davolash ishi-Bobotog' hududi	\N
1236	60910200170	Davolash ishi-Boysun tumani	\N
1237	60910200171	Davolash ishi-Denov tumani	\N
1238	60910200189	Davolash ishi-Muborak tumani	\N
1239	60910200173	Davolash ishi-Muzrabot tumani	\N
1240	60910200174	Davolash ishi-Oltinsoy tumani	\N
1241	60910200175	Davolash ishi-Qiziriq tumani	\N
1242	60910200176	Davolash ishi-Qumqo'rg'on tumani	\N
1243	60910200177	Davolash ishi-Sariosiyo tumani	\N
1244	60910200193	Davolash ishi-Shahrisabz tumani	\N
1245	60910200178	Davolash ishi-Sherobod tumani	\N
1246	60910200179	Davolash ishi-Sho'rchi tumani	\N
1247	60910200180	Davolash ishi-Termiz tumani	\N
1248	60910200181	Davolash ishi-Uzun tumani	\N
1249	60910300168	Pediatriya ishi-Angor tumani	\N
1250	60910300170	Pediatriya ishi-Boysun tumani	\N
1251	60910300172	Pediatriya ishi-Jarqo'rg'on tumani	\N
1252	60910300173	Pediatriya ishi-Muzrabot tumani	\N
1253	60910300176	Pediatriya ishi-Qumqo'rg'on tumani	\N
1254	60910300177	Pediatriya ishi-Sariosiyo tumani	\N
1255	60910300178	Pediatriya ishi-Sherobod tumani	\N
1256	60910300179	Pediatriya ishi-Sho'rchi tumani	\N
1257	60910300180	Pediatriya ishi-Termiz tumani	\N
1258	60910300181	Pediatriya ishi-Uzun tumani	\N
1259	60911000	Dori vositalarini standartlashtirish, sertifikatsiyalash va sifat menejmenti	\N
1260	60910900	Farmatsevtik biotexnologiya	\N
1261	60710404	Ekologiya va atrof-muhit muhofazasi (qishloq xo‘jaligida)	\N
1262	60811700	Ipakchilik va tutchilik	\N
1263	60412507	Marketing (qishloq xo‘jaligida)	\N
1264	60820101	O‘rmonchilik	\N
1265	60820102	O‘rmonchilik (o‘rmonchilar va ularning farzandlari uchun)	\N
1266	60811400	Organik qishloq xo'jaligi mahsulotlarini yetishtirish, saqlash va qayta ishlash 	\N
1267	60112408	Professional ta'lim: agronomiya	\N
1268	60810500	Qishloq va suv xo‘jaligida energiya ta’minoti	\N
1269	60810200	Qishloq xo‘jaligini elektrlashtirish va avtomatlashtirish	\N
1270	60812300	Suv xo‘jaligi va melioratsiya	\N
1271	60812400	Suv xo‘jaligi va melioratsiya ishlarini mexanizatsiyalashtirish	\N
1272	60711401	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (qishloq xo‘jaligida)	\N
1273	60810800	Tuproq bonitirovkasi va yer resurslaridan foydalanish 	\N
1274	60840102	Veterinariya meditsinasi (faoliyat turlari bo‘yicha)	\N
1275	60810600	Yer kadastri va yerdan foydalanish	\N
1276	60420110	Yurisprudensiya (qishloq xo‘jaligi huquqi)	\N
1277	60811500	Zooinjeneriya (turlari bo‘yicha)	\N
1278	60810902	Agronomiya (yem-xashak ekinlari)	\N
1279	60811600	Chorvachilik mahsulotlarini qayta ishlash texnologiyasi	\N
1280	60812202	O‘simlikshunoslik (yaylov cho‘l o‘simlikshunosligi)	\N
1281	60840500	Veterinariya biotexnologiyasi	\N
1282	60840300	Veterinariya diagnostikasi va laboratoriya ishlari	\N
1283	60840200	Veterinariya farmatsevtikasi	\N
1284	60840102005	Veterinariya meditsinasi (faoliyat turlari bo‘yicha)-Buxoro viloyati	\N
1285	60840102009	Veterinariya meditsinasi (faoliyat turlari bo‘yicha)-Jizzax viloyati	\N
1286	60840102010	Veterinariya meditsinasi (faoliyat turlari bo‘yicha)-Navoiy viloyati	\N
1287	60840102008	Veterinariya meditsinasi (faoliyat turlari bo‘yicha)-Qashqadaryo viloyati	\N
1288	60840102012	Veterinariya meditsinasi (faoliyat turlari bo‘yicha)-Sirdaryo viloyati	\N
1289	60840102007	Veterinariya meditsinasi (faoliyat turlari bo‘yicha)-Surxondaryo viloyati	\N
1290	60840400	Veterinariya sanitariya ekspertizasi 	\N
1291	60811500005	Zooinjeneriya (turlari bo‘yicha)-Buxoro viloyati	\N
1292	60811500009	Zooinjeneriya (turlari bo‘yicha)-Jizzax viloyati	\N
1293	60811500010	Zooinjeneriya (turlari bo‘yicha)-Navoiy viloyati	\N
1294	60811500008	Zooinjeneriya (turlari bo‘yicha)-Qashqadaryo viloyati	\N
1295	60811500012	Zooinjeneriya (turlari bo‘yicha)-Sirdaryo viloyati	\N
1296	60811500007	Zooinjeneriya (turlari bo‘yicha)-Surxondaryo viloyati	\N
1297	60811506	Zooinjeneriya: yilqichilik va tuyachilik	\N
1298	60112409	Professional ta'lim: o‘rmonchilik	\N
1299	60112412	Professional ta'lim: o‘simliklarni himoya qilish	\N
1300	60112411	Professional ta'lim: tuproq bonitirovkasi va yer resurslaridan foydalanish	\N
1301	60830100	Suv bioresurslari va akvakultura	\N
1302	60811502	Zooinjeneriya (parrandachilik)	\N
1303	60811504	Zooinjeneriya (qoramolchilik)	\N
1304	60812203	O‘simlikshunoslik (ekin turlari bo‘yicha)	\N
1305	60710402	Ekologiya va atrof-muhit muhofazasi (suv xo‘jaligida)	\N
1306	60722600	Geodeziya va geoinformatika	\N
1307	60530801	Gidrologiya (daryo va suv omborlari gidrologiyasi)	\N
1308	60730901	Gidrotexnika qurilishi (suv xo‘jaligida)	\N
1309	60812700	Irrigatsiya tizimlarida gidroenergetika obyektlari	\N
1310	60722802	Kadastr (hududlar davlat kadastri)	\N
1311	61020202	Mehnat muhofazasi va texnika xavfsizligi (suv xo‘jaligida)	\N
1312	60812600	Meliorativ gidrogeologiya	\N
1313	60711301	Metrologiya, standartlashtirish va mahsulot sifati menejmenti (qishloq va suv xo‘jaligida)	\N
1314	60112418	Professional ta'lim: yer kadastri va yer tuzish	\N
1315	60112405	Professional ta’lim: suv xo‘jaligi va melioratsiya	\N
1316	60811302	Qishloq xo‘jalik mahsulotlarini saqlash va dastlabki ishlash texnologiyasi (meva-sabzavot)	\N
1317	60812900	Suv ta’minoti muhandislik tizimlari	\N
1318	60813000	Suv xo‘jaligida innovatsion texnologiyalar va ulardan foydalanish	\N
1319	60722900	Texnika va texnologiyalarning texnik ekspertizasi va marketingi (turlari bo‘yicha)	\N
1320	60711404	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (suv xo‘jaligida)	\N
1321	60813100	Yer kadastri va yer tuzish	\N
1322	60722700	Yerni masofaviy zondlashda innovatsion texnologiyalar 	\N
1323	60420113	Yurisprudensiya: transchegaraviy suv munosabatlari	\N
1324	60420112	Yurisprudensiya: yer munosabatlari	\N
1325	60211102	Aktyorlik san'ati: dramatik teatr va kino aktyorligi	\N
1326	60211103	Aktyorlik san'ati: estrada aktyorligi	\N
1327	60211104	Aktyorlik san'ati: musiqali teatr aktyorligi	\N
1328	60211101	Aktyorlik san'ati: qo‘g‘irchoq teatri aktyorligi	\N
1329	60211700	Grim san'ati	\N
1330	60210200	Kino-teleoperatorlik	\N
1331	60411205	Menejment: madaniyat va san'at sohasi menejmenti	\N
1332	60411204	Menejment: ommaviy tadbirlar menejmenti	\N
1333	60112427	Professional ta'lim: xalq ijodiyoti (chog‘u ijrochiligi)	\N
1334	60112425	Professional ta'lim: xalq ijodiyoti (vokal ijrochiligi)	\N
1335	60723101	Qo'g'irchoqlar ishlab chiqarish texnologiyasi 	\N
1336	60211203	Rejissorlik (musiqali teatr rejissorligi)	\N
1337	60211205	Rejissorlik: dramatik teatr rejissorligi 	\N
1338	60211204	Rejissorlik: estrada va ommaviy tomoshalar rejissorligi	\N
1339	60211201	Rejissorlik: kino va televideniye rejissorligi	\N
1340	60211202	Rejissorlik: qo‘g‘irchoq teatri rejissorligi	\N
1341	60210300	San'atda animatsiyaviy va multimediyaviy loyihalash	\N
1342	60211001	San'atshunoslik: kino san'ati tanqidi va tahlili	\N
1343	60211003	San'atshunoslik: sahna va ekran san'ati dramaturgiyasi	\N
1344	60211005	San'atshunoslik: teatrshunoslik	\N
1345	60211800	San’at sohasida prodyuserlik	\N
1346	60210101	Texnogen san'at: kino, televideniye va radio ovoz rejissorligi	\N
1347	60211901	Xalq ijodiyoti: ashula va raqs	\N
1348	60211903	Xalq ijodiyoti: folklor va etnografiya	\N
1349	60210900	Bastakorlik san'ati	\N
1350	60211520	Cholg‘u ijrochiligi: fortepiano (organ)	\N
1351	60211513	Cholg‘u ijrochiligi: puflama va zarbli cholg‘ular (fleyta, goboy)	\N
1352	60211524	Cholg‘u ijrochiligi: puflama va zarbli cholg‘ular (klarnet, fagot)	\N
1353	60211515	Cholg‘u ijrochiligi: puflama va zarbli cholg‘ular (trombon, tuba)	\N
1354	60211518	Cholg‘u ijrochiligi: puflama va zarbli cholg‘ular (valtorna, truba)	\N
1355	60211517	Cholg‘u ijrochiligi: puflama va zarbli cholg‘ular (zarbli cholg‘ular)	\N
1356	60211502	Cholg‘u ijrochiligi: torli cholg‘ular (skripka, alt)	\N
1357	60211521	Cholg‘u ijrochiligi: torli cholg‘ular (violonchel, kontrabas)	\N
1358	60211504	Cholg‘u ijrochiligi: Xalq cholg‘ulari (chang)	\N
1359	60211507	Cholg‘u ijrochiligi: xalq cholg‘ulari (dutor, dutor bas, dutor kontrabas, tanbur)	\N
1360	60211511	Cholg‘u ijrochiligi: xalq cholg‘ulari (g‘ijjak qobus bas, g‘ijjak qobus-kontrabas)	\N
1361	60211509	Cholg‘u ijrochiligi: xalq cholg‘ulari (g‘ijjak, g‘ijjak al't)	\N
1362	60211505	Cholg‘u ijrochiligi: xalq cholg‘ulari (nay-qo‘shnay, bayan-akkordeyon)	\N
1363	60211516	Cholg‘u ijrochiligi: xalq cholg‘ulari (rubob prima, qashqar va afg‘on rubobi)	\N
1364	60211506	Cholg‘u ijrochiligi: xalq cholg‘ulari (zarbli cholg‘ular)	\N
1365	60211304	Dirijyorlik: akademik xor dirijyorligi	\N
1366	60211305	Dirijyorlik: harbiy (damli) orkestr dirijyorligi	\N
1367	60211301	Dirijyorlik: opera-simfoniya dirijyorligi	\N
1368	60211303	Dirijyorlik: xalq cholg‘ulari orkestri dirijyorligi	\N
1369	60211002	San'atshunoslik: musiqashunoslik	\N
1370	60210102	Texnogen san'at: musiqiy ovoz rejissorligi	\N
1371	60211402	Vokal san'ati: akademik xonandalik	\N
1372	60611200	Axborot-kommunikatsiya texnologiyalari sohasida iqtisodiyot va menejment	\N
1373	60611300	Axborot-kommunikatsiya texnologiyalari sohasida kasb ta’limi	\N
1374	60612000	Infokommunikatsiya injiniringi 	\N
1375	60612100	Kiberxavfsizlik injiniringi 	\N
1376	60610505	"Kompyuter injiniringi (""Kompyuter injiniringi"", ""AT-servis"", ""Multimedia texnologiyalari"")"	\N
1377	60611400	Pochta aloqa texnologiyasi	\N
1378	60611002	"Telekommunikatsiya texnologiyalari (“Telekommunikatsiyalar”, ""Teleradioeshittirish"", ""Mobil tizimlar"")"	\N
1379	60611100	"Televizion texnologiyalar (""Audiovizual texnologiyalar"", ""Telestudiya tizimlari va ilovalari"")"	\N
1380	60211401	Vokal san'ati: an'anaviy xonandalik	\N
1381	60910200058	Davolash ishi-Angren shahri	\N
1382	60910200059	Davolash ishi-Bekobod shahri	\N
1383	60910200237	Davolash ishi-Bekobod tumani	\N
1384	60910200238	Davolash ishi-Bo'ka tumani	\N
1385	60910200239	Davolash ishi-Bo'stonliq tumani	\N
1386	60910200060	Davolash ishi-Chirchiq shahri	\N
1387	60910200254	Davolash ishi-Nurafshon shahri	\N
1388	60910200243	Davolash ishi-O'rtachirchiq tumani	\N
1389	60910200061	Davolash ishi-Ohangaron shahri	\N
1390	60910200241	Davolash ishi-Ohangaron tumani	\N
1391	60910200062	Davolash ishi-Olmaliq shahri	\N
1392	60910200244	Davolash ishi-Parkent tumani	\N
1393	60910200245	Davolash ishi-Piskent tumani	\N
1394	60910200246	Davolash ishi-Qibray tumani	\N
1395	60910200247	Davolash ishi-Quyichirchiq tumani	\N
1396	60910200063	Davolash ishi-Yangiyo'l shahri	\N
1397	60910200250	Davolash ishi-Yuqorichirchiq tumani	\N
1398	60910200251	Davolash ishi-Zangiota tumani	\N
1399	60412506	Marketing (sport marketingi)	\N
1400	60411210	Menejment (jismoniy tarbiya va sport menejmenti)	\N
1401	61010334	Sport faoliyati: badiiy gimnastika	\N
1402	61010329	Sport faoliyati: badminton	\N
1403	61010327	Sport faoliyati: belbog‘li kurash	\N
1404	61010326	Sport faoliyati: biatlon	\N
1405	61010318	Sport faoliyati: chim ustida xokkey	\N
1406	61010321	Sport faoliyati: eshkak eshish	\N
1407	61010305	Sport faoliyati: figurali uchish	\N
1408	61010349	Sport faoliyati: gimnastika	\N
1409	61010346	Sport faoliyati: kamondan otish	\N
1410	61010345	Sport faoliyati: karate VKF	\N
1411	61010344	Sport faoliyati: kikboksing	\N
1412	61010340	Sport faoliyati: minifutbol	\N
1413	61010339	Sport faoliyati: og‘ir atletika	\N
1414	61010338	Sport faoliyati: ot sporti	\N
1415	61010335	Sport faoliyati: qilichbozlik	\N
1416	61010336	Sport faoliyati: sambo	\N
1417	61010319	Sport faoliyati: shaxmat	\N
1418	61010317	Sport faoliyati: sinxron suzish	\N
1419	61010325	Sport faoliyati: suzish	\N
1420	61010311	Sport faoliyati: tennis	\N
1421	61010307	Sport faoliyati: tog‘ chang‘isi	\N
1422	61010306	Sport faoliyati: triatlon	\N
1423	61010330	Sport faoliyati: velosport	\N
1424	61010303	Sport faoliyati: xokkey	\N
1425	61010302	Sport faoliyati: xotin-qizlar sportini rivojlantirish (boks)	\N
1426	61010301	Sport faoliyati: xotin-qizlar sportini rivojlantirish (dzyudo)	\N
1427	61010316	Sport faoliyati: xotin-qizlar sportini rivojlantirish (futbol)	\N
1428	61010312	Sport faoliyati: xotin-qizlar sportini rivojlantirish (karate VKF)	\N
1429	61010313	Sport faoliyati: xotin-qizlar sportini rivojlantirish (kurash)	\N
1430	61010310	Sport faoliyati: xotin-qizlar sportini rivojlantirish (shaxmat)	\N
1431	61010314	Sport faoliyati: xotin-qizlar sportini rivojlantirish (stol tennisi)	\N
1432	61010315	Sport faoliyati: xotin-qizlar sportini rivojlantirish (taekvondo WTF)	\N
1433	61010323	Sport faoliyati: xotin-qizlar sportini rivojlantirish (tennis)	\N
1434	61010308	Sport faoliyati: xotin-qizlar sportini rivojlantirish (yengil atletika)	\N
1435	61010322	Sport faoliyati: yunon-rum kurashi	\N
1436	61010403	Turizm (sport turizmi)	\N
1437	60421200	Davlat boshqaruvi 	\N
1438	60420105	Yurisprudensiya: davlat-huquqiy faoliyat	\N
1439	60420106	Yurisprudensiya: jinoyat-huquqiy faoliyat	\N
1440	60420109	Yurisprudensiya: xalqaro huquq va qiyosiy huquqshunoslik	\N
1441	60840101	Veterinariya meditsinasi (yirik shoxli mollar kasalliklari)	\N
1442	60610502	Kompyuter injiniringi: multimedia texnologiyalari	\N
1443	60211902	Xalq ijodiyoti (baxshichilik va dostonchilik)	\N
1444	60210403	Dizayn: (mediadizayn)	\N
1445	60320109	Jurnalistika: harbiy jurnalistika	\N
1446	60320103	Jurnalistika: iqtisodiy jurnalistika	\N
1447	60320106	Jurnalistika: san'at jurnalistikasi	\N
1448	60320105	Jurnalistika: sayohat jurnalistikasi	\N
1449	60412502	Marketing (mediamarketing va reklama)	\N
1450	60411207	Menejment (mediamenejment)	\N
1451	60411702	Logistika (turizm logistikasi)	\N
1452	60411202	Menejment: mehmonxonalarni boshqarish	\N
1453	60212101	Muzeyshunoslik (turlari bo‘yicha)	\N
1454	60420102	Yurisprudensiya (huquqbuzarliklar profilaktikasi va jamoat xavfsizligini ta'minlash) - ayollar uchun	\N
1455	60420101	Yurisprudensiya (huquqbuzarliklar profilaktikasi va jamoat xavfsizligini ta'minlash) - erkaklar uchun	\N
1456	60710104	Kimyoviy texnologiya: noorganik moddalar kimyoviy texnologiyasi	\N
1457	60710103	Kimyoviy texnologiya: qurilish materiallari kimyoviy texnologiyasi	\N
1458	60111503	Ona tili va adabiyot: qirg‘iz tili va adabiyot	\N
1459	60110900147	Biologiya-G'ijduvon tumani	\N
1460	60110900154	Biologiya-Romitan tumani	\N
1461	60110500154	Boshlang‘ich ta’lim-Romitan tumani	\N
1462	60110500155	Boshlang‘ich ta’lim-Shofirkon tumani	\N
1463	60112000154	Chaqiriqqacha harbiy ta’lim-Romitan tumani	\N
1464	60110700154	Fizika va astronomiya-Romitan tumani	\N
1465	60110700155	Fizika va astronomiya-Shofirkon tumani	\N
1466	60111000154	Geografiya va iqtisodiy bilim asoslari-Romitan tumani	\N
1467	60111000155	Geografiya va iqtisodiy bilim asoslari-Shofirkon tumani	\N
1468	60110800147	Kimyo-G'ijduvon tumani	\N
1469	60110800154	Kimyo-Romitan tumani	\N
1470	60110800155	Kimyo-Shofirkon tumani	\N
1471	60110600154	Matematika va informatika-Romitan tumani	\N
1472	60110600155	Matematika va informatika-Shofirkon tumani	\N
1473	60112100154	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi-Romitan tumani	\N
1474	60111400155	O‘zbek tili va adabiyoti-Shofirkon tumani	\N
1475	60111701147	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-G'ijduvon tumani	\N
1476	60111701151	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Peshku tumani	\N
1477	60111701154	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Romitan tumani	\N
1478	60111701155	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Shofirkon tumani	\N
1479	60111100147	Tarix-G'ijduvon tumani	\N
1480	60111100155	Tarix-Shofirkon tumani	\N
1481	60111804147	Xorijiy til va adabiyoti: ingliz tili-G'ijduvon tumani	\N
1482	60111804151	Xorijiy til va adabiyoti: ingliz tili-Peshku tumani	\N
1483	60111804154	Xorijiy til va adabiyoti: ingliz tili-Romitan tumani	\N
1484	60111804155	Xorijiy til va adabiyoti: ingliz tili-Shofirkon tumani	\N
1485	60110500185	Boshlang‘ich ta’lim-Kasbi tumani	\N
1486	60110500186	Boshlang‘ich ta’lim-Kitob tumani	\N
1487	60110500188	Boshlang‘ich ta’lim-Mirishkor tumani	\N
1488	60110500190	Boshlang‘ich ta’lim-Nishon tumani	\N
1489	60110500193	Boshlang‘ich ta’lim-Shahrisabz tumani	\N
1490	60110500194	Boshlang‘ich ta’lim-Yakkabog' tumani	\N
1491	60111000186	Geografiya va iqtisodiy bilim asoslari-Kitob tumani	\N
1492	60111000194	Geografiya va iqtisodiy bilim asoslari-Yakkabog' tumani	\N
1493	60110600182	Matematika va informatika-Chiroqchi tumani	\N
1494	60110600193	Matematika va informatika-Shahrisabz tumani	\N
1495	60110600194	Matematika va informatika-Yakkabog' tumani	\N
1496	60112100193	Milliy g‘oya, ma’naviyat asoslari va huquq ta’limi-Shahrisabz tumani	\N
1497	60111701182	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Chiroqchi tumani	\N
1498	60111701186	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Kitob tumani	\N
1499	60111701193	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Shahrisabz tumani	\N
1500	60111701194	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Yakkabog' tumani	\N
1501	60111804182	Xorijiy til va adabiyoti: ingliz tili-Chiroqchi tumani	\N
1502	60111804186	Xorijiy til va adabiyoti: ingliz tili-Kitob tumani	\N
1503	60111804188	Xorijiy til va adabiyoti: ingliz tili-Mirishkor tumani	\N
1504	60111804193	Xorijiy til va adabiyoti: ingliz tili-Shahrisabz tumani	\N
1505	60111804194	Xorijiy til va adabiyoti: ingliz tili-Yakkabog' tumani	\N
1506	60211519	Cholg‘u ijrochiligi: an'anaviy cholg‘ular	\N
1507	60112423	Professional ta'lim: cholg‘u ijrochiligi (an'anaviy cholg‘ular)	\N
1508	60112420	Professional ta'lim: vokal san'ati (an'anaviy xonandalik)	\N
1509	60211508	Cholg‘u ijrochiligi: xalq cholg‘ulari (dutor, dutor bas, dutor kontrabas, dombira)	\N
1510	60211510	Cholg‘u ijrochiligi: xalq cholg‘ulari (g‘ijjak qobus bas, g‘ijjak qobus-kontrabas, g‘ijjak alt)	\N
1511	60110500216	Boshlang‘ich ta’lim-Ishtixon tumani	\N
1512	60110500218	Boshlang‘ich ta’lim-Kattaqo'rg'on tumani	\N
1513	60110500220	Boshlang‘ich ta’lim-Nurobod tumani	\N
1514	60110500224	Boshlang‘ich ta’lim-Payariq tumani	\N
1515	60110500225	Boshlang‘ich ta’lim-Qo'shrabot tumani	\N
1516	60110500228	Boshlang‘ich ta’lim-Urgut tumani	\N
1517	60110600219	Matematika va informatika-Narpay tumani	\N
1518	60110600220	Matematika va informatika-Nurobod tumani	\N
1519	60110600224	Matematika va informatika-Payariq tumani	\N
1520	60110600228	Matematika va informatika-Urgut tumani	\N
1521	60111701216	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Ishtixon tumani	\N
1522	60111701218	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Kattaqo'rg'on tumani	\N
1523	60111701219	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Narpay tumani	\N
1524	60111701223	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Paxtachi tumani	\N
1525	60111701224	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Payariq tumani	\N
1526	60111701225	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Qo'shrabot tumani	\N
1527	60111701228	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Urgut tumani	\N
1528	60111100224	Tarix-Payariq tumani	\N
1529	60111100225	Tarix-Qo'shrabot tumani	\N
1530	99999999	Ma'lumotlar ilmi(Data Science)	\N
1531	60111802	Xorijiy til va adabiyoti: rus tili	\N
1532	60211503	Cholg‘u ijrochiligi: estrada cholg‘ulari (fortepiano)	\N
1533	60211512	Cholg‘u ijrochiligi: estrada cholg‘ulari (gitara bas)	\N
1534	60211525	Cholg‘u ijrochiligi: estrada cholg‘ulari (gitara)	\N
1535	60211526	Cholg‘u ijrochiligi: estrada cholg‘ulari (saksofon)	\N
1536	60211514	Cholg‘u ijrochiligi: estrada cholg‘ulari (trombon)	\N
1537	60211501	Cholg‘u ijrochiligi: estrada cholg‘ulari (truba)	\N
1538	60211523	Cholg‘u ijrochiligi: estrada cholg‘ulari (zarbli cholg‘ular)	\N
1539	60211302	Dirijyorlik: estrada orkestri dirijyorligi	\N
1540	60112402	Professional ta'lim: cholg‘u ijrochiligi (estrada cholg‘ulari)	\N
1541	60112421	Professional ta'lim: vokal san'ati (estrada xonandaligi)	\N
1542	60211403	Vokal san'ati: estrada xonandaligi	\N
\.


--
-- Data for Name: fullchoices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fullchoices (id, abtid, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10) FROM stdin;
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.languages (id, name) FROM stdin;
1	O`zbek
2	Rus
3	Qoraqalpoq
4	Tadjik
5	Qozoq
6	Turkman
7	Qirgiz
\.


--
-- Data for Name: modes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modes (id, name) FROM stdin;
1	Kunduzgi
2	Sirtqi
3	Kechki
4	Masofaviy
\.


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.regions (id, name) FROM stdin;
1	Qoraqalpog‘iston Respublikasi
2	Andijon viloyati
3	Namangan viloyati
4	Farg‘ona viloyati
5	Buxoro viloyati
6	Xorazm viloyati
7	Surxondaryo viloyati
8	Qashqadaryo viloyati
9	Jizzax viloyati
10	Navoiy viloyati
11	Samarqand viloyati
12	Sirdaryo viloyati
13	Toshkent viloyati
14	Toshkent shahri
\.


--
-- Data for Name: scores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scores (id, abtid, ball, blok1, blok2, blok3, blok4, blok5, blokid) FROM stdin;
\.


--
-- Data for Name: selections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.selections (id, uncode, facultyid, langid, mode, budget, cantrak) FROM stdin;
1	301	24	1	1	\N	\N
2	301	24	1	2	0	\N
3	301	24	2	1	\N	\N
4	301	5	1	1	\N	\N
5	301	5	1	2	0	\N
6	301	19	1	1	\N	\N
7	301	19	1	2	0	\N
8	301	20	1	1	\N	\N
9	301	2	1	1	\N	\N
10	301	9	1	1	\N	\N
11	301	9	1	2	0	\N
12	301	3	1	1	\N	\N
13	301	3	1	2	0	\N
14	301	3	2	1	\N	\N
15	301	10	1	1	\N	\N
16	301	10	2	1	\N	\N
17	301	7	1	1	\N	\N
18	301	7	1	2	0	\N
19	301	7	2	1	\N	\N
20	301	6	1	1	\N	\N
21	301	6	2	1	\N	\N
22	301	16	1	1	\N	\N
23	301	14	1	1	\N	\N
24	301	14	2	1	\N	\N
25	301	1	1	1	\N	\N
26	301	11	1	1	\N	\N
27	301	12	1	1	\N	\N
28	301	12	1	4	0	\N
29	301	13	1	1	\N	\N
30	301	13	1	2	0	\N
31	301	13	1	4	0	\N
32	301	4	1	1	\N	\N
33	301	17	1	1	\N	\N
34	301	18	1	1	\N	\N
35	301	15	1	1	\N	\N
36	301	22	1	1	\N	\N
37	301	22	1	2	0	\N
38	301	21	1	1	\N	\N
39	301	21	1	2	0	\N
40	301	23	1	1	\N	\N
41	301	25	1	1	\N	\N
42	301	8	1	1	\N	\N
43	302	32	1	1	\N	\N
44	302	32	1	2	0	\N
45	302	32	1	3	0	\N
46	302	33	2	1	\N	\N
47	302	27	1	1	\N	\N
48	302	38	2	1	\N	\N
49	302	36	1	1	\N	\N
50	302	35	1	1	\N	\N
51	302	37	1	1	\N	\N
52	302	30	1	1	\N	\N
53	302	31	1	1	\N	\N
54	302	26	1	1	\N	\N
55	302	29	1	1	\N	\N
56	302	28	1	1	\N	\N
57	302	34	1	1	\N	\N
58	303	50	1	1	\N	\N
59	303	50	1	2	0	\N
60	303	50	2	2	0	\N
61	303	44	1	1	\N	\N
62	303	44	1	2	0	\N
63	303	58	1	1	\N	\N
64	303	58	1	2	0	\N
65	303	42	1	1	\N	\N
66	303	42	1	2	0	\N
67	303	54	1	1	\N	\N
68	303	54	1	2	0	\N
69	303	41	1	1	\N	\N
70	303	41	1	2	0	\N
71	303	60	1	1	\N	\N
72	303	60	1	2	0	\N
73	303	45	1	1	\N	\N
74	303	45	1	2	0	\N
75	303	46	1	1	\N	\N
76	303	46	1	2	0	\N
77	303	48	1	1	\N	\N
78	303	48	1	2	0	\N
79	303	59	1	1	\N	\N
80	303	59	1	2	0	\N
81	303	47	1	1	\N	\N
82	303	47	1	2	0	\N
83	303	56	1	1	\N	\N
84	303	56	1	2	0	\N
85	303	62	1	1	\N	\N
86	303	62	1	2	0	\N
87	303	57	1	1	\N	\N
88	303	57	1	2	0	\N
89	303	49	1	1	\N	\N
90	303	49	1	2	0	\N
91	303	43	1	1	\N	\N
92	303	55	1	1	\N	\N
93	303	55	1	2	0	\N
94	303	40	1	1	\N	\N
95	303	40	1	2	0	\N
96	303	65	1	1	\N	\N
97	303	65	1	2	0	\N
98	303	52	1	1	\N	\N
99	303	52	1	2	0	\N
100	303	63	1	1	\N	\N
101	303	63	1	2	0	\N
102	303	51	1	1	\N	\N
103	303	51	1	2	0	\N
104	303	51	2	2	0	\N
105	303	66	1	1	\N	\N
106	303	66	1	2	0	\N
107	303	61	1	1	\N	\N
108	303	61	1	2	0	\N
109	303	68	1	1	\N	\N
110	303	68	1	2	0	\N
111	303	53	1	1	\N	\N
112	303	53	1	2	0	\N
113	303	64	1	1	\N	\N
114	303	64	1	2	0	\N
115	303	64	2	2	0	\N
116	303	67	1	1	\N	\N
117	303	67	1	2	0	\N
118	303	39	1	1	\N	\N
119	303	39	1	2	0	\N
120	304	135	1	1	\N	\N
121	304	135	1	2	0	\N
122	304	134	1	1	\N	\N
123	304	73	1	1	\N	\N
124	304	83	1	1	\N	\N
125	304	83	1	3	0	\N
126	304	83	2	1	\N	\N
127	304	82	1	1	\N	\N
128	304	85	1	1	\N	\N
129	304	85	1	2	0	\N
130	304	85	1	3	0	\N
131	304	87	4	1	\N	\N
132	304	86	2	1	\N	\N
133	304	84	1	1	\N	\N
134	304	136	1	1	\N	\N
135	304	136	2	1	\N	\N
136	304	137	1	1	\N	\N
137	304	107	1	1	\N	\N
138	304	98	1	1	\N	\N
139	304	98	1	2	0	\N
140	304	98	1	3	0	\N
141	304	98	2	1	\N	\N
142	304	98	2	2	0	\N
143	304	119	1	1	\N	\N
144	304	121	1	1	\N	\N
145	304	115	1	1	\N	\N
146	304	115	1	2	0	\N
147	304	115	2	1	\N	\N
148	304	115	2	2	0	\N
149	304	117	1	1	\N	\N
150	304	116	1	1	\N	\N
151	304	122	1	1	\N	\N
152	304	100	1	1	\N	\N
153	304	100	1	2	0	\N
154	304	75	1	1	\N	\N
155	304	75	1	2	0	\N
156	304	79	1	1	\N	\N
157	304	79	1	2	0	\N
158	304	79	1	3	0	\N
159	304	79	2	1	\N	\N
160	304	79	2	2	0	\N
161	304	76	1	2	0	\N
162	304	76	1	3	0	\N
163	304	133	1	1	\N	\N
164	304	109	1	1	\N	\N
165	304	109	1	2	0	\N
166	304	97	1	1	\N	\N
167	304	97	1	2	0	\N
168	304	104	1	1	\N	\N
169	304	69	1	1	\N	\N
170	304	105	1	1	\N	\N
171	304	105	1	2	0	\N
172	304	105	1	3	0	\N
173	304	139	1	1	\N	\N
174	304	139	1	2	0	\N
175	304	139	1	3	0	\N
176	304	77	1	1	\N	\N
177	304	77	1	2	0	\N
178	304	77	2	1	\N	\N
179	304	101	1	1	\N	\N
180	304	101	2	1	\N	\N
181	304	89	1	1	\N	\N
182	304	89	1	2	0	\N
183	304	88	1	1	\N	\N
184	304	88	2	1	\N	\N
185	304	111	1	1	\N	\N
186	304	106	1	1	\N	\N
187	304	106	1	2	0	\N
188	304	106	2	1	\N	\N
189	304	72	1	1	\N	\N
190	304	72	1	3	0	\N
191	304	72	2	1	\N	\N
192	304	103	1	1	\N	\N
193	304	103	1	2	0	\N
194	304	103	1	4	0	\N
195	304	74	1	1	\N	\N
196	304	74	1	4	0	\N
197	304	102	1	1	\N	\N
198	304	78	1	1	\N	\N
199	304	80	1	1	\N	\N
200	304	80	1	3	0	\N
201	304	112	1	1	\N	\N
202	304	81	1	1	\N	\N
203	304	113	1	1	\N	\N
204	304	70	1	1	\N	\N
205	304	71	1	1	\N	\N
206	304	71	1	2	0	\N
207	304	114	1	1	\N	\N
208	304	114	1	3	0	\N
209	304	118	1	1	\N	\N
210	304	110	1	1	\N	\N
211	304	120	1	1	\N	\N
212	304	99	1	1	\N	\N
213	304	93	1	1	\N	\N
214	304	93	1	2	0	\N
215	304	93	2	1	\N	\N
216	304	108	1	1	\N	\N
217	304	108	1	2	0	\N
218	304	108	1	3	0	\N
219	304	108	2	1	\N	\N
220	304	127	1	2	0	\N
221	304	127	1	3	0	\N
222	304	126	1	1	\N	\N
223	304	126	1	2	0	\N
224	304	123	1	1	\N	\N
225	304	131	1	1	\N	\N
226	304	124	1	1	\N	\N
227	304	124	1	2	0	\N
228	304	128	1	1	\N	\N
229	304	130	1	2	0	\N
230	304	132	1	3	0	\N
231	304	125	1	2	0	\N
232	304	129	1	3	0	\N
233	304	138	1	1	\N	\N
234	304	138	1	2	0	\N
235	304	138	1	3	0	\N
236	304	92	1	1	\N	\N
237	304	90	1	1	\N	\N
238	304	91	1	1	\N	\N
239	304	95	1	1	\N	\N
240	304	94	1	1	\N	\N
241	304	96	1	1	\N	\N
242	305	144	1	1	\N	\N
243	305	145	1	1	\N	\N
244	305	143	1	1	\N	\N
245	305	152	1	1	\N	\N
246	305	152	1	2	0	\N
247	305	152	1	3	0	\N
248	305	161	1	1	\N	\N
249	305	161	1	2	0	\N
250	305	161	1	3	0	\N
251	305	161	2	1	\N	\N
252	305	155	1	1	\N	\N
253	305	142	1	1	\N	\N
254	305	142	1	2	0	\N
255	305	142	1	3	0	\N
256	305	153	1	1	\N	\N
257	305	153	1	2	0	\N
258	305	153	2	1	\N	\N
259	305	157	1	1	\N	\N
260	305	148	1	1	\N	\N
261	305	148	1	2	0	\N
262	305	146	1	1	\N	\N
263	305	147	1	1	\N	\N
264	305	147	1	2	0	\N
265	305	147	2	1	\N	\N
266	305	149	1	1	\N	\N
267	305	149	1	2	0	\N
268	305	149	2	1	\N	\N
269	305	164	1	1	\N	\N
270	305	164	1	2	0	\N
271	305	162	1	1	\N	\N
272	305	162	1	2	0	\N
273	305	176	1	1	\N	\N
274	305	176	1	2	0	\N
275	305	176	1	3	0	\N
276	305	176	2	1	\N	\N
277	305	178	1	1	\N	\N
278	305	178	1	2	0	\N
279	305	168	1	1	\N	\N
280	305	168	1	2	0	\N
281	305	168	2	1	\N	\N
282	305	182	1	1	\N	\N
283	305	179	1	1	\N	\N
284	305	154	1	1	\N	\N
285	305	150	1	1	\N	\N
286	305	150	1	2	0	\N
287	305	150	2	1	\N	\N
288	305	158	1	1	\N	\N
289	305	158	1	2	0	\N
290	305	159	1	1	\N	\N
291	305	177	1	1	\N	\N
292	305	177	1	2	0	\N
293	305	156	1	1	\N	\N
294	305	156	1	2	0	\N
295	305	156	1	3	0	\N
296	305	167	1	1	\N	\N
297	305	167	1	2	0	\N
298	305	167	1	3	0	\N
299	305	167	2	1	\N	\N
300	305	151	1	1	\N	\N
301	305	166	1	1	\N	\N
302	305	180	1	1	\N	\N
303	305	180	1	2	0	\N
304	305	180	2	1	\N	\N
305	305	175	1	1	\N	\N
306	305	175	1	2	0	\N
307	305	181	1	1	\N	\N
308	305	181	1	2	0	\N
309	305	181	2	1	\N	\N
310	305	165	1	1	\N	\N
311	305	165	1	2	0	\N
312	305	165	2	1	\N	\N
313	305	141	1	1	\N	\N
314	305	141	1	3	0	\N
315	305	172	1	1	\N	\N
316	305	172	1	2	0	\N
317	305	173	1	1	\N	\N
318	305	173	1	2	0	\N
319	305	171	1	1	\N	\N
320	305	171	1	2	0	\N
321	305	174	1	1	\N	\N
322	305	169	1	1	\N	\N
323	305	169	1	2	0	\N
324	305	170	1	1	\N	\N
325	305	163	1	1	\N	\N
326	305	140	1	1	\N	\N
327	305	140	1	2	0	\N
328	305	140	2	1	\N	\N
329	305	160	1	1	\N	\N
330	305	160	1	2	0	\N
331	306	184	1	1	\N	\N
332	306	184	1	2	0	\N
333	306	184	1	3	0	\N
334	306	184	2	1	\N	\N
335	306	187	1	1	\N	\N
336	306	187	1	4	0	\N
337	306	187	2	1	\N	\N
338	306	188	1	3	0	\N
339	306	194	1	1	\N	\N
340	306	194	1	3	0	\N
341	306	185	1	1	\N	\N
342	306	192	1	1	\N	\N
343	306	196	1	1	\N	\N
344	306	196	2	1	\N	\N
345	306	193	1	1	\N	\N
346	306	193	1	3	0	\N
347	306	193	2	1	\N	\N
348	306	190	1	1	\N	\N
349	306	190	1	2	0	\N
350	306	186	1	1	\N	\N
351	306	186	1	3	0	\N
352	306	186	1	4	0	\N
353	306	189	1	1	\N	\N
354	306	189	1	2	0	\N
355	306	197	1	1	\N	\N
356	306	183	1	1	\N	\N
357	306	183	1	2	0	\N
358	306	191	1	1	\N	\N
359	306	191	1	4	0	\N
360	306	195	1	1	\N	\N
361	306	195	1	2	0	\N
362	307	236	1	1	\N	\N
363	307	236	1	2	0	\N
364	307	225	1	1	\N	\N
365	307	225	1	2	0	\N
366	307	225	2	1	\N	\N
367	307	225	2	2	0	\N
368	307	204	1	1	\N	\N
369	307	204	1	2	0	\N
370	307	204	2	1	\N	\N
371	307	204	2	2	0	\N
372	307	227	1	1	\N	\N
373	307	227	1	2	0	\N
374	307	213	1	1	\N	\N
375	307	214	1	1	\N	\N
376	307	214	1	2	0	\N
377	307	246	1	1	\N	\N
378	307	246	1	2	0	\N
379	307	231	1	1	\N	\N
380	307	231	1	2	0	\N
381	307	232	1	1	\N	\N
382	307	234	5	1	\N	\N
383	307	233	2	1	\N	\N
384	307	248	1	1	\N	\N
385	307	248	2	1	\N	\N
386	307	230	1	1	\N	\N
387	307	222	1	1	\N	\N
388	307	222	1	2	0	\N
389	307	223	1	1	\N	\N
390	307	247	1	1	\N	\N
391	307	247	1	2	0	\N
392	307	245	1	1	\N	\N
393	307	245	1	2	0	\N
394	307	210	1	1	\N	\N
395	307	210	1	2	0	\N
396	307	211	2	1	\N	\N
397	307	220	1	1	\N	\N
398	307	220	1	2	0	\N
399	307	239	1	1	\N	\N
400	307	239	1	2	0	\N
401	307	205	1	1	\N	\N
402	307	205	1	2	0	\N
403	307	228	1	1	\N	\N
404	307	203	1	1	\N	\N
405	307	203	1	2	0	\N
406	307	201	1	1	\N	\N
407	307	201	1	2	0	\N
408	307	224	1	1	\N	\N
409	307	212	1	1	\N	\N
410	307	226	1	1	\N	\N
411	307	226	1	2	0	\N
412	307	200	1	1	\N	\N
413	307	202	1	1	\N	\N
414	307	202	1	2	0	\N
415	307	209	1	1	\N	\N
416	307	235	1	1	\N	\N
417	307	249	1	1	\N	\N
418	307	249	1	2	0	\N
419	307	244	1	1	\N	\N
420	307	240	1	1	\N	\N
421	307	240	1	2	0	\N
422	307	198	1	1	\N	\N
423	307	198	1	2	0	\N
424	307	199	1	1	\N	\N
425	307	241	1	1	\N	\N
426	307	229	1	1	\N	\N
427	307	242	1	1	\N	\N
428	307	221	1	1	\N	\N
429	307	208	1	1	\N	\N
430	307	206	1	1	\N	\N
431	307	237	1	1	\N	\N
432	307	215	1	2	0	\N
433	307	216	1	1	\N	\N
434	307	243	1	1	\N	\N
435	307	207	1	1	\N	\N
436	307	238	1	1	\N	\N
437	307	217	1	1	\N	\N
438	307	218	1	1	\N	\N
439	307	219	1	1	\N	\N
440	308	267	1	1	\N	\N
441	308	252	1	1	\N	\N
442	308	262	1	1	\N	\N
443	308	262	1	2	0	\N
444	308	262	2	1	\N	\N
445	308	273	1	1	\N	\N
446	308	273	2	1	\N	\N
447	308	258	1	1	\N	\N
448	308	258	1	2	0	\N
449	308	258	2	1	\N	\N
450	308	253	1	1	\N	\N
451	308	257	1	1	\N	\N
452	308	254	1	1	\N	\N
453	308	254	1	2	0	\N
454	308	254	2	1	\N	\N
455	308	255	1	1	\N	\N
456	308	255	1	2	0	\N
457	308	256	1	1	\N	\N
458	308	263	1	1	\N	\N
459	308	263	1	2	0	\N
460	308	276	1	1	\N	\N
461	308	251	1	1	\N	\N
462	308	279	1	1	\N	\N
463	308	279	1	2	0	\N
464	308	279	2	1	\N	\N
465	308	266	1	1	\N	\N
466	308	266	1	2	0	\N
467	308	260	1	1	\N	\N
468	308	277	1	1	\N	\N
469	308	259	1	1	\N	\N
470	308	265	1	1	\N	\N
471	308	280	1	1	\N	\N
472	308	280	1	2	0	\N
473	308	280	2	1	\N	\N
474	308	275	1	1	\N	\N
475	308	275	1	2	0	\N
476	308	250	1	1	\N	\N
477	308	271	1	1	\N	\N
478	308	271	1	2	0	\N
479	308	272	1	1	\N	\N
480	308	272	1	2	0	\N
481	308	272	2	1	\N	\N
482	308	270	1	1	\N	\N
483	308	270	1	2	0	\N
484	308	270	2	1	\N	\N
485	308	264	1	1	\N	\N
486	308	264	1	2	0	\N
487	308	274	1	1	\N	\N
488	308	281	1	1	\N	\N
489	308	281	1	2	0	\N
490	308	281	2	1	\N	\N
491	308	268	1	1	\N	\N
492	308	268	1	2	0	\N
493	308	269	1	1	\N	\N
494	308	261	1	1	\N	\N
495	308	278	1	1	\N	\N
496	308	278	1	2	0	\N
497	308	278	2	1	\N	\N
498	309	333	1	1	\N	\N
499	309	333	1	2	0	\N
500	309	333	2	1	\N	\N
501	309	318	1	1	\N	\N
502	309	318	1	2	0	\N
503	309	318	2	1	\N	\N
504	309	318	2	2	0	\N
505	309	291	1	1	\N	\N
506	309	291	1	2	0	\N
507	309	291	2	1	\N	\N
508	309	291	2	2	0	\N
509	309	314	1	1	\N	\N
510	309	305	1	1	\N	\N
511	309	343	1	1	\N	\N
512	309	343	1	2	0	\N
513	309	343	2	1	\N	\N
514	309	329	1	1	\N	\N
515	309	329	1	2	0	\N
516	309	331	2	1	\N	\N
517	309	331	2	3	0	\N
518	309	346	1	1	\N	\N
519	309	346	1	3	0	\N
520	309	346	2	1	\N	\N
521	309	346	2	3	0	\N
522	309	319	1	2	0	\N
523	309	327	1	1	\N	\N
524	309	313	1	1	\N	\N
525	309	313	1	2	0	\N
526	309	313	2	1	\N	\N
527	309	344	1	1	\N	\N
528	309	344	1	2	0	\N
529	309	320	1	1	\N	\N
530	309	320	1	3	0	\N
531	309	322	1	1	\N	\N
532	309	342	1	1	\N	\N
533	309	342	1	2	0	\N
534	309	342	2	1	\N	\N
535	309	285	1	1	\N	\N
536	309	298	1	1	\N	\N
537	309	298	2	1	\N	\N
538	309	300	1	1	\N	\N
539	309	300	1	2	0	\N
540	309	301	2	1	\N	\N
541	309	301	2	2	0	\N
542	309	299	1	1	\N	\N
543	309	283	1	1	\N	\N
544	309	311	1	1	\N	\N
545	309	311	1	2	0	\N
546	309	311	1	3	0	\N
547	309	310	1	1	\N	\N
548	309	310	1	2	0	\N
549	309	336	1	1	\N	\N
550	309	336	1	2	0	\N
551	309	338	1	1	\N	\N
552	309	286	1	1	\N	\N
553	309	316	1	1	\N	\N
554	309	292	1	2	0	\N
555	309	324	1	1	\N	\N
556	309	290	1	1	\N	\N
557	309	317	1	1	\N	\N
558	309	328	1	1	\N	\N
559	309	347	1	1	\N	\N
560	309	347	1	2	0	\N
561	309	347	2	1	\N	\N
562	309	288	1	1	\N	\N
563	309	288	1	3	0	\N
564	309	288	2	1	\N	\N
565	309	325	1	1	\N	\N
566	309	315	1	1	\N	\N
567	309	315	1	3	0	\N
568	309	315	2	1	\N	\N
569	309	304	1	1	\N	\N
570	309	302	1	1	\N	\N
571	309	302	1	3	0	\N
572	309	302	2	1	\N	\N
573	309	321	1	1	\N	\N
574	309	321	1	2	0	\N
575	309	321	1	3	0	\N
576	309	321	2	1	\N	\N
577	309	284	1	1	\N	\N
578	309	284	1	2	0	\N
579	309	287	1	3	0	\N
580	309	289	1	1	\N	\N
581	309	296	1	1	\N	\N
582	309	332	1	1	\N	\N
583	309	303	1	1	\N	\N
584	309	282	1	1	\N	\N
585	309	348	1	1	\N	\N
586	309	326	1	1	\N	\N
587	309	337	1	1	\N	\N
588	309	312	1	1	\N	\N
589	309	295	1	1	\N	\N
590	309	295	1	2	0	\N
591	309	330	1	1	\N	\N
592	309	293	1	1	\N	\N
593	309	293	2	1	\N	\N
594	309	334	1	1	\N	\N
595	309	334	2	1	\N	\N
596	309	297	1	1	\N	\N
597	309	307	1	2	0	\N
598	309	308	1	1	\N	\N
599	309	308	1	3	0	\N
600	309	323	1	1	\N	\N
601	309	323	1	2	0	\N
602	309	339	1	1	\N	\N
603	309	341	1	1	\N	\N
604	309	340	1	1	\N	\N
605	309	345	1	1	\N	\N
606	309	306	1	1	\N	\N
607	309	294	1	1	\N	\N
608	309	294	2	1	\N	\N
609	309	335	1	1	\N	\N
610	309	335	2	1	\N	\N
611	309	309	1	1	\N	\N
612	310	360	1	1	\N	\N
613	310	360	1	2	0	\N
614	310	353	1	1	\N	\N
615	310	353	1	2	0	\N
616	310	353	2	1	\N	\N
617	310	367	1	1	\N	\N
618	310	363	1	1	\N	\N
619	310	352	1	1	\N	\N
620	310	352	1	2	0	\N
621	310	352	2	1	\N	\N
622	310	361	1	1	\N	\N
623	310	354	1	1	\N	\N
624	310	355	1	1	\N	\N
625	310	355	1	2	0	\N
626	310	371	1	1	\N	\N
627	310	371	1	2	0	\N
628	310	369	1	1	\N	\N
629	310	369	1	2	0	\N
630	310	368	1	1	\N	\N
631	310	368	2	1	\N	\N
632	310	351	1	1	\N	\N
633	310	382	1	1	\N	\N
634	310	382	2	1	\N	\N
635	310	373	1	1	\N	\N
636	310	362	1	1	\N	\N
637	310	357	1	1	\N	\N
638	310	365	1	1	\N	\N
639	310	380	1	1	\N	\N
640	310	380	1	2	0	\N
641	310	364	1	1	\N	\N
642	310	364	1	2	0	\N
643	310	372	1	1	\N	\N
644	310	356	1	1	\N	\N
645	310	349	1	1	\N	\N
646	310	379	1	1	\N	\N
647	310	378	1	1	\N	\N
648	310	378	1	2	0	\N
649	310	378	2	1	\N	\N
650	310	377	1	1	\N	\N
651	310	377	1	2	0	\N
652	310	370	1	1	\N	\N
653	310	370	1	2	0	\N
654	310	384	1	1	\N	\N
655	310	384	1	2	0	\N
656	310	359	1	1	\N	\N
657	310	359	1	2	0	\N
658	310	376	1	1	\N	\N
659	310	374	1	1	\N	\N
660	310	375	1	1	\N	\N
661	310	358	1	2	0	\N
662	310	366	1	1	\N	\N
663	310	381	1	1	\N	\N
664	310	383	1	1	\N	\N
665	310	350	1	1	\N	\N
666	311	388	1	1	\N	\N
667	311	392	1	1	\N	\N
668	311	392	1	2	0	\N
669	311	387	1	1	\N	\N
670	311	387	1	2	0	\N
671	311	387	2	1	\N	\N
672	311	387	2	2	0	\N
673	311	399	1	1	\N	\N
674	311	399	1	2	0	\N
675	311	396	1	1	\N	\N
676	311	396	1	2	0	\N
677	311	385	1	1	\N	\N
678	311	385	1	2	0	\N
679	311	393	1	1	\N	\N
680	311	386	1	1	\N	\N
681	311	397	1	1	\N	\N
682	311	390	1	1	\N	\N
683	311	389	1	1	\N	\N
684	311	389	1	2	0	\N
685	311	400	1	1	\N	\N
686	311	400	1	2	0	\N
687	311	405	1	1	\N	\N
688	311	405	1	2	0	\N
689	311	401	1	1	\N	\N
690	311	391	1	1	\N	\N
691	311	406	1	1	\N	\N
692	311	402	1	1	\N	\N
693	311	402	1	2	0	\N
694	311	394	1	1	\N	\N
695	311	398	1	1	\N	\N
696	311	407	1	1	\N	\N
697	311	407	1	2	0	\N
698	311	407	2	1	\N	\N
699	311	408	1	1	\N	\N
700	311	408	1	2	0	\N
701	311	408	2	2	0	\N
702	311	404	1	1	\N	\N
703	311	404	1	2	0	\N
704	311	409	1	1	\N	\N
705	311	403	1	1	\N	\N
706	311	403	1	2	0	\N
707	311	395	1	1	\N	\N
708	312	471	1	1	\N	\N
709	312	412	1	1	\N	\N
710	312	422	1	1	\N	\N
711	312	423	1	1	\N	\N
712	312	423	1	2	0	\N
713	312	423	1	3	0	\N
714	312	432	4	1	\N	\N
715	312	432	4	2	0	\N
716	312	432	4	3	0	\N
717	312	430	2	1	\N	\N
718	312	430	2	2	0	\N
719	312	430	2	3	0	\N
720	312	466	1	1	\N	\N
721	312	449	1	1	\N	\N
722	312	449	1	2	0	\N
723	312	468	1	1	\N	\N
724	312	468	1	2	0	\N
725	312	467	1	1	\N	\N
726	312	467	2	1	\N	\N
727	312	469	1	1	\N	\N
728	312	413	1	1	\N	\N
729	312	448	1	1	\N	\N
730	312	410	1	1	\N	\N
731	312	410	1	3	0	\N
732	312	474	1	1	\N	\N
733	312	474	1	2	0	\N
734	312	474	1	3	0	\N
735	312	414	1	1	\N	\N
736	312	414	1	3	0	\N
737	312	414	2	1	\N	\N
738	312	442	1	1	\N	\N
739	312	450	1	1	\N	\N
740	312	450	1	3	0	\N
741	312	450	2	1	\N	\N
742	312	437	1	1	\N	\N
743	312	437	1	3	0	\N
744	312	441	1	1	\N	\N
745	312	433	1	1	\N	\N
746	312	433	1	3	0	\N
747	312	433	2	1	\N	\N
748	312	459	1	1	\N	\N
749	312	459	1	2	0	\N
750	312	459	1	3	0	\N
751	312	459	2	1	\N	\N
752	312	411	1	1	\N	\N
753	312	411	1	2	0	\N
754	312	411	1	3	0	\N
755	312	411	2	1	\N	\N
756	312	458	1	1	\N	\N
757	312	457	1	1	\N	\N
758	312	420	1	1	\N	\N
759	312	420	2	1	\N	\N
760	312	470	1	1	\N	\N
761	312	456	1	1	\N	\N
762	312	419	1	1	\N	\N
763	312	421	1	1	\N	\N
764	312	465	1	1	\N	\N
765	312	443	1	1	\N	\N
766	312	472	1	1	\N	\N
767	312	473	1	1	\N	\N
768	312	424	1	1	\N	\N
769	312	425	1	1	\N	\N
770	312	426	1	1	\N	\N
771	312	427	1	1	\N	\N
772	312	428	1	1	\N	\N
773	312	429	1	1	\N	\N
774	312	431	2	1	\N	\N
775	312	415	1	1	\N	\N
776	312	416	1	1	\N	\N
777	312	417	1	1	\N	\N
778	312	418	1	1	\N	\N
779	312	451	1	1	\N	\N
780	312	452	1	1	\N	\N
781	312	453	1	1	\N	\N
782	312	454	1	1	\N	\N
783	312	455	1	1	\N	\N
784	312	438	1	1	\N	\N
785	312	439	1	1	\N	\N
786	312	440	1	1	\N	\N
787	312	434	1	1	\N	\N
788	312	435	1	1	\N	\N
789	312	436	1	1	\N	\N
790	312	460	1	1	\N	\N
791	312	461	1	1	\N	\N
792	312	462	1	1	\N	\N
793	312	463	1	1	\N	\N
794	312	464	1	1	\N	\N
795	312	447	1	1	\N	\N
796	312	445	1	1	\N	\N
797	312	444	1	1	\N	\N
798	312	446	1	1	\N	\N
799	313	487	1	2	0	\N
800	313	488	1	1	\N	\N
801	313	489	1	1	\N	\N
802	313	478	1	1	\N	\N
803	313	479	1	1	\N	\N
804	313	484	1	1	\N	\N
805	313	482	1	1	\N	\N
806	313	482	1	2	0	\N
807	313	477	1	1	\N	\N
808	313	477	1	2	0	\N
809	313	477	2	1	\N	\N
810	313	480	1	1	\N	\N
811	313	481	1	1	\N	\N
812	313	481	1	2	0	\N
813	313	481	2	1	\N	\N
814	313	483	1	1	\N	\N
815	313	475	1	1	\N	\N
816	313	475	2	1	\N	\N
817	313	493	1	1	\N	\N
818	313	491	1	1	\N	\N
819	313	491	2	1	\N	\N
820	313	492	1	2	0	\N
821	313	486	1	1	\N	\N
822	313	486	1	2	0	\N
823	313	486	2	1	\N	\N
824	313	494	1	1	\N	\N
825	313	494	1	2	0	\N
826	313	494	2	1	\N	\N
827	313	495	1	1	\N	\N
828	313	495	1	2	0	\N
829	313	490	1	1	\N	\N
830	313	476	1	1	\N	\N
831	313	485	1	1	\N	\N
832	314	551	2	1	\N	\N
833	314	571	1	1	\N	\N
834	314	571	2	1	\N	\N
835	314	547	1	1	\N	\N
836	314	547	1	2	0	\N
837	314	566	1	1	\N	\N
838	314	566	1	2	0	\N
839	314	566	1	3	0	\N
840	314	566	2	1	\N	\N
841	314	566	2	2	0	\N
842	314	566	2	3	0	\N
843	314	500	1	1	\N	\N
844	314	500	1	3	0	\N
845	314	500	2	3	0	\N
846	314	514	1	1	\N	\N
847	314	514	1	2	0	\N
848	314	513	1	1	\N	\N
849	314	497	1	1	\N	\N
850	314	516	1	1	\N	\N
851	314	516	1	3	0	\N
852	314	516	2	1	\N	\N
853	314	516	2	3	0	\N
854	314	515	1	1	\N	\N
855	314	515	2	1	\N	\N
856	314	518	1	1	\N	\N
857	314	518	1	2	0	\N
858	314	518	1	3	0	\N
859	314	519	2	1	\N	\N
860	314	519	2	3	0	\N
861	314	517	1	1	\N	\N
862	314	517	2	1	\N	\N
863	314	568	1	1	\N	\N
864	314	568	2	1	\N	\N
865	314	567	1	1	\N	\N
866	314	569	1	1	\N	\N
867	314	542	1	1	\N	\N
868	314	499	1	1	\N	\N
869	314	532	1	1	\N	\N
870	314	533	1	1	\N	\N
871	314	533	1	2	0	\N
872	314	533	1	3	0	\N
873	314	533	1	4	0	\N
874	314	533	2	1	\N	\N
875	314	533	2	3	0	\N
876	314	533	2	4	0	\N
877	314	512	1	1	\N	\N
878	314	548	1	1	\N	\N
879	314	557	1	1	\N	\N
880	314	553	1	1	\N	\N
881	314	553	1	2	0	\N
882	314	553	1	3	0	\N
883	314	553	2	1	\N	\N
884	314	553	2	2	0	\N
885	314	553	2	3	0	\N
886	314	555	1	1	\N	\N
887	314	555	2	1	\N	\N
888	314	554	1	1	\N	\N
889	314	554	2	1	\N	\N
890	314	558	1	1	\N	\N
891	314	558	1	2	0	\N
892	314	558	2	1	\N	\N
893	314	558	2	2	0	\N
894	314	535	1	1	\N	\N
895	314	535	1	2	0	\N
896	314	535	2	1	\N	\N
897	314	536	1	1	\N	\N
898	314	536	1	2	0	\N
899	314	536	2	1	\N	\N
900	314	505	1	1	\N	\N
901	314	505	2	1	\N	\N
902	314	501	1	1	\N	\N
903	314	501	1	2	0	\N
904	314	549	1	1	\N	\N
905	314	506	1	1	\N	\N
906	314	506	1	2	0	\N
907	314	506	2	2	0	\N
908	314	563	1	1	\N	\N
909	314	510	1	1	\N	\N
910	314	510	1	2	0	\N
911	314	543	1	1	\N	\N
912	314	543	1	2	0	\N
913	314	544	1	1	\N	\N
914	314	544	1	4	0	\N
915	314	544	2	1	\N	\N
916	314	544	2	4	0	\N
917	314	531	1	1	\N	\N
918	314	534	1	1	\N	\N
919	314	534	1	2	0	\N
920	314	534	2	1	\N	\N
921	314	534	2	2	0	\N
922	314	572	1	1	\N	\N
923	314	572	1	2	0	\N
924	314	552	1	1	\N	\N
925	314	507	1	1	\N	\N
926	314	508	1	1	\N	\N
927	314	508	1	2	0	\N
928	314	508	1	3	0	\N
929	314	508	2	1	\N	\N
930	314	508	2	2	0	\N
931	314	508	2	3	0	\N
932	314	526	1	1	\N	\N
933	314	526	1	2	0	\N
934	314	545	1	1	\N	\N
935	314	537	1	1	\N	\N
936	314	537	1	3	0	\N
937	314	537	2	1	\N	\N
938	314	550	1	1	\N	\N
939	314	565	1	1	\N	\N
940	314	523	1	1	\N	\N
941	314	523	1	2	0	\N
942	314	523	1	3	0	\N
943	314	523	2	1	\N	\N
944	314	523	2	2	0	\N
945	314	523	2	3	0	\N
946	314	524	1	1	\N	\N
947	314	524	1	2	0	\N
948	314	524	1	3	0	\N
949	314	524	2	1	\N	\N
950	314	524	2	2	0	\N
951	314	525	1	1	\N	\N
952	314	525	1	2	0	\N
953	314	525	2	1	\N	\N
954	314	520	1	1	\N	\N
955	314	520	1	3	0	\N
956	314	520	2	1	\N	\N
957	314	520	2	3	0	\N
958	314	521	1	1	\N	\N
959	314	546	1	1	\N	\N
960	314	502	1	1	\N	\N
961	314	570	1	1	\N	\N
962	314	556	1	1	\N	\N
963	314	541	1	1	\N	\N
964	314	541	1	3	0	\N
965	314	541	2	1	\N	\N
966	314	498	1	1	\N	\N
967	314	498	1	3	0	\N
968	314	498	2	1	\N	\N
969	314	540	1	1	\N	\N
970	314	538	1	1	\N	\N
971	314	538	1	4	0	\N
972	314	538	2	1	\N	\N
973	314	538	2	4	0	\N
974	314	503	1	1	\N	\N
975	314	503	1	3	0	\N
976	314	503	1	4	0	\N
977	314	503	2	4	0	\N
978	314	504	1	1	\N	\N
979	314	564	1	1	\N	\N
980	314	509	1	1	\N	\N
981	314	511	1	1	\N	\N
982	314	511	1	2	0	\N
983	314	511	2	1	\N	\N
984	314	511	2	2	0	\N
985	314	522	1	1	\N	\N
986	314	522	1	2	0	\N
987	314	522	1	3	0	\N
988	314	522	2	1	\N	\N
989	314	522	2	2	0	\N
990	314	539	1	1	\N	\N
991	314	496	1	1	\N	\N
992	314	496	1	2	0	\N
993	314	528	1	2	0	\N
994	314	529	1	1	\N	\N
995	314	529	1	2	0	\N
996	314	529	2	1	\N	\N
997	314	562	1	1	\N	\N
998	314	562	1	2	0	\N
999	314	562	2	1	\N	\N
1000	314	561	1	1	\N	\N
1001	314	561	2	1	\N	\N
1002	314	560	1	1	\N	\N
1003	314	559	1	1	\N	\N
1004	314	559	1	2	0	\N
1005	314	527	1	1	\N	\N
1006	314	527	1	2	0	\N
1007	314	530	1	1	\N	\N
1008	315	617	1	1	\N	\N
1009	315	616	1	1	\N	\N
1010	315	616	2	1	\N	\N
1011	315	577	1	1	\N	\N
1012	315	577	2	1	\N	\N
1013	315	594	1	1	\N	\N
1014	315	594	1	2	0	\N
1015	315	594	2	1	\N	\N
1016	315	594	2	2	0	\N
1017	315	604	1	1	\N	\N
1018	315	604	2	1	\N	\N
1019	315	598	1	1	\N	\N
1020	315	598	2	1	\N	\N
1021	315	574	1	1	\N	\N
1022	315	574	1	2	0	\N
1023	315	574	1	3	0	\N
1024	315	574	2	1	\N	\N
1025	315	574	2	2	0	\N
1026	315	574	2	3	0	\N
1027	315	620	1	1	\N	\N
1028	315	620	2	1	\N	\N
1029	315	619	1	1	\N	\N
1030	315	619	1	2	0	\N
1031	315	619	1	3	0	\N
1032	315	619	2	1	\N	\N
1033	315	619	2	2	0	\N
1034	315	575	1	1	\N	\N
1035	315	575	2	1	\N	\N
1036	315	578	1	1	\N	\N
1037	315	578	2	1	\N	\N
1038	315	583	1	1	\N	\N
1039	315	583	1	2	0	\N
1040	315	583	2	1	\N	\N
1041	315	583	2	2	0	\N
1042	315	579	1	1	\N	\N
1043	315	579	1	2	0	\N
1044	315	579	1	3	0	\N
1045	315	579	2	1	\N	\N
1046	315	579	2	2	0	\N
1047	315	579	2	3	0	\N
1048	315	580	1	1	\N	\N
1049	315	580	1	2	0	\N
1050	315	580	2	1	\N	\N
1051	315	580	2	2	0	\N
1052	315	590	1	1	\N	\N
1053	315	590	1	2	0	\N
1054	315	590	2	1	\N	\N
1055	315	585	1	1	\N	\N
1056	315	585	2	1	\N	\N
1057	315	611	1	2	0	\N
1058	315	611	1	3	0	\N
1059	315	612	1	1	\N	\N
1060	315	612	2	1	\N	\N
1061	315	610	1	1	\N	\N
1062	315	610	2	1	\N	\N
1063	315	584	1	1	\N	\N
1064	315	584	2	1	\N	\N
1065	315	582	1	1	\N	\N
1066	315	582	1	2	0	\N
1067	315	582	2	1	\N	\N
1068	315	608	1	1	\N	\N
1069	315	608	1	2	0	\N
1070	315	608	2	1	\N	\N
1071	315	608	2	2	0	\N
1072	315	621	1	1	\N	\N
1073	315	621	1	2	0	\N
1074	315	621	2	1	\N	\N
1075	315	621	2	2	0	\N
1076	315	609	1	1	\N	\N
1077	315	609	1	3	0	\N
1078	315	609	2	1	\N	\N
1079	315	593	1	1	\N	\N
1080	315	593	1	2	0	\N
1081	315	593	1	3	0	\N
1082	315	593	2	1	\N	\N
1083	315	593	2	2	0	\N
1084	315	599	1	1	\N	\N
1085	315	599	2	1	\N	\N
1086	315	576	1	1	\N	\N
1087	315	576	2	1	\N	\N
1088	315	581	1	1	\N	\N
1089	315	581	2	1	\N	\N
1090	315	606	1	1	\N	\N
1091	315	606	1	3	0	\N
1092	315	606	2	1	\N	\N
1093	315	607	1	1	\N	\N
1094	315	607	2	1	\N	\N
1095	315	615	1	1	\N	\N
1096	315	615	2	1	\N	\N
1097	315	605	1	1	\N	\N
1098	315	605	1	2	0	\N
1099	315	605	2	1	\N	\N
1100	315	605	2	2	0	\N
1101	315	573	1	1	\N	\N
1102	315	573	2	1	\N	\N
1103	315	623	1	1	\N	\N
1104	315	623	2	1	\N	\N
1105	315	588	1	1	\N	\N
1106	315	588	2	1	\N	\N
1107	315	602	1	1	\N	\N
1108	315	602	1	2	0	\N
1109	315	602	2	1	\N	\N
1110	315	622	1	1	\N	\N
1111	315	622	1	2	0	\N
1112	315	622	2	1	\N	\N
1113	315	622	2	2	0	\N
1114	315	601	1	1	\N	\N
1115	315	601	1	2	0	\N
1116	315	601	1	3	0	\N
1117	315	601	2	1	\N	\N
1118	315	601	2	2	0	\N
1119	315	601	2	3	0	\N
1120	315	614	1	1	\N	\N
1121	315	614	2	1	\N	\N
1122	315	596	1	1	\N	\N
1123	315	596	1	2	0	\N
1124	315	596	1	3	0	\N
1125	315	596	2	1	\N	\N
1126	315	596	2	2	0	\N
1127	315	596	2	3	0	\N
1128	315	597	1	1	\N	\N
1129	315	597	2	1	\N	\N
1130	315	586	1	1	\N	\N
1131	315	586	1	2	0	\N
1132	315	586	2	1	\N	\N
1133	315	586	2	2	0	\N
1134	315	587	1	1	\N	\N
1135	315	587	2	1	\N	\N
1136	315	591	1	1	\N	\N
1137	315	591	2	1	\N	\N
1138	315	613	1	1	\N	\N
1139	315	613	1	2	0	\N
1140	315	613	2	1	\N	\N
1141	315	613	2	2	0	\N
1142	315	595	1	1	\N	\N
1143	315	595	2	1	\N	\N
1144	315	600	1	1	\N	\N
1145	315	600	2	1	\N	\N
1146	315	589	1	1	\N	\N
1147	315	589	1	2	0	\N
1148	315	589	2	1	\N	\N
1149	315	618	1	1	\N	\N
1150	315	618	2	1	\N	\N
1151	315	592	1	1	\N	\N
1152	315	592	2	1	\N	\N
1153	315	603	1	1	\N	\N
1154	315	603	1	2	0	\N
1155	315	603	2	1	\N	\N
1156	317	626	1	1	\N	\N
1157	317	626	3	1	\N	\N
1158	317	626	3	2	0	\N
1159	317	624	1	1	\N	\N
1160	317	624	3	1	\N	\N
1161	317	625	1	1	\N	\N
1162	317	625	3	1	\N	\N
1163	317	625	3	2	0	\N
1164	317	631	1	1	\N	\N
1165	317	631	3	1	\N	\N
1166	317	631	3	2	0	\N
1167	317	630	1	1	\N	\N
1168	317	630	3	1	\N	\N
1169	317	629	1	1	\N	\N
1170	317	629	3	1	\N	\N
1171	317	629	3	2	0	\N
1172	317	628	1	1	\N	\N
1173	317	628	3	1	\N	\N
1174	317	628	3	2	0	\N
1175	317	627	1	1	\N	\N
1176	317	627	3	1	\N	\N
1177	318	637	1	1	\N	\N
1178	318	637	1	2	0	\N
1179	318	637	2	1	\N	\N
1180	318	637	2	2	0	\N
1181	318	635	1	1	\N	\N
1182	318	635	2	1	\N	\N
1183	318	634	1	1	\N	\N
1184	318	634	1	2	0	\N
1185	318	634	2	1	\N	\N
1186	318	634	2	2	0	\N
1187	318	632	1	1	\N	\N
1188	318	632	1	2	0	\N
1189	318	633	1	1	\N	\N
1190	318	633	1	2	0	\N
1191	318	633	2	2	0	\N
1192	318	636	1	1	\N	\N
1193	318	636	1	2	0	\N
1194	319	641	1	1	\N	\N
1195	319	641	1	2	0	\N
1196	319	641	2	1	\N	\N
1197	319	641	2	2	0	\N
1198	319	642	1	1	\N	\N
1199	319	642	1	2	0	\N
1200	319	642	2	1	\N	\N
1201	319	642	2	2	0	\N
1202	319	638	1	1	\N	\N
1203	319	638	1	2	0	\N
1204	319	638	2	1	\N	\N
1205	319	640	1	1	\N	\N
1206	319	640	1	2	0	\N
1207	319	640	2	2	0	\N
1208	319	639	1	1	\N	\N
1209	319	639	1	2	0	\N
1210	319	639	2	1	\N	\N
1211	319	639	2	2	0	\N
1212	319	649	1	1	\N	\N
1213	319	651	1	1	\N	\N
1214	319	651	1	2	0	\N
1215	319	651	2	1	\N	\N
1216	319	651	2	2	0	\N
1217	319	648	1	1	\N	\N
1218	319	648	1	2	0	\N
1219	319	648	2	1	\N	\N
1220	319	648	2	2	0	\N
1221	319	646	1	1	\N	\N
1222	319	646	1	2	0	\N
1223	319	652	1	1	\N	\N
1224	319	652	1	2	0	\N
1225	319	652	2	1	\N	\N
1226	319	652	2	2	0	\N
1227	319	645	1	1	\N	\N
1228	319	645	1	2	0	\N
1229	319	645	2	1	\N	\N
1230	319	645	2	2	0	\N
1231	319	644	1	1	\N	\N
1232	319	644	1	2	0	\N
1233	319	644	2	1	\N	\N
1234	319	644	2	2	0	\N
1235	319	643	1	1	\N	\N
1236	319	643	1	2	0	\N
1237	319	643	2	1	\N	\N
1238	319	643	2	2	0	\N
1239	319	650	1	1	\N	\N
1240	319	650	1	2	0	\N
1241	319	650	2	1	\N	\N
1242	319	650	2	2	0	\N
1243	319	647	1	1	\N	\N
1244	319	647	1	2	0	\N
1245	320	659	1	1	\N	\N
1246	320	659	1	2	0	\N
1247	320	657	1	1	\N	\N
1248	320	657	1	2	0	\N
1249	320	661	1	1	\N	\N
1250	320	653	1	1	\N	\N
1251	320	656	1	1	\N	\N
1252	320	666	1	1	\N	\N
1253	320	654	1	1	\N	\N
1254	320	655	1	1	\N	\N
1255	320	655	1	2	0	\N
1256	320	664	1	1	\N	\N
1257	320	663	1	1	\N	\N
1258	320	665	1	1	\N	\N
1259	320	667	1	1	\N	\N
1260	320	667	1	2	0	\N
1261	320	670	1	1	\N	\N
1262	320	662	1	1	\N	\N
1263	320	668	1	1	\N	\N
1264	320	660	1	1	\N	\N
1265	320	658	1	1	\N	\N
1266	320	669	1	1	\N	\N
1267	322	671	1	1	\N	\N
1268	322	672	1	1	\N	\N
1269	322	673	1	1	\N	\N
1270	323	678	1	1	\N	\N
1271	323	678	1	2	0	\N
1272	323	678	1	3	0	\N
1273	323	676	1	1	\N	\N
1274	323	676	1	2	0	\N
1275	323	676	1	3	0	\N
1276	323	675	1	1	\N	\N
1277	323	675	1	2	0	\N
1278	323	674	1	1	\N	\N
1279	323	674	1	2	0	\N
1280	323	680	1	1	\N	\N
1281	323	680	1	2	0	\N
1282	323	679	1	1	\N	\N
1283	323	679	1	2	0	\N
1284	323	677	1	1	\N	\N
1285	323	677	1	2	0	\N
1286	324	701	1	1	\N	\N
1287	324	690	1	1	\N	\N
1288	324	690	1	2	0	\N
1289	324	690	1	4	0	\N
1290	324	690	2	1	\N	\N
1291	324	690	2	2	0	\N
1292	324	690	2	4	0	\N
1293	324	687	1	1	\N	\N
1294	324	687	1	2	0	\N
1295	324	699	1	1	\N	\N
1296	324	699	1	2	0	\N
1297	324	689	1	1	\N	\N
1298	324	689	1	2	0	\N
1299	324	689	2	1	\N	\N
1300	324	702	1	1	\N	\N
1301	324	702	1	2	0	\N
1302	324	686	1	1	\N	\N
1303	324	686	1	2	0	\N
1304	324	686	1	4	0	\N
1305	324	686	2	1	\N	\N
1306	324	686	2	2	0	\N
1307	324	686	2	4	0	\N
1308	324	704	1	1	\N	\N
1309	324	704	1	2	0	\N
1310	324	704	2	1	\N	\N
1311	324	704	2	2	0	\N
1312	324	700	1	1	\N	\N
1313	324	700	1	2	0	\N
1314	324	700	2	1	\N	\N
1315	324	682	1	1	\N	\N
1316	324	682	1	2	0	\N
1317	324	682	2	1	\N	\N
1318	324	682	2	2	0	\N
1319	324	706	1	1	\N	\N
1320	324	706	1	2	0	\N
1321	324	706	2	1	\N	\N
1322	324	685	1	1	\N	\N
1323	324	685	1	2	0	\N
1324	324	705	1	1	\N	\N
1325	324	705	1	2	0	\N
1326	324	698	1	1	\N	\N
1327	324	697	1	1	\N	\N
1328	324	697	1	2	0	\N
1329	324	697	2	1	\N	\N
1330	324	697	2	2	0	\N
1331	324	684	1	1	\N	\N
1332	324	684	1	2	0	\N
1333	324	688	1	1	\N	\N
1334	324	688	1	2	0	\N
1335	324	688	2	1	\N	\N
1336	324	683	1	1	\N	\N
1337	324	692	1	1	\N	\N
1338	324	692	1	2	0	\N
1339	324	693	1	1	\N	\N
1340	324	693	1	2	0	\N
1341	324	693	2	1	\N	\N
1342	324	691	1	1	\N	\N
1343	324	691	1	2	0	\N
1344	324	691	2	1	\N	\N
1345	324	694	1	1	\N	\N
1346	324	695	1	1	\N	\N
1347	324	695	1	2	0	\N
1348	324	695	1	4	0	\N
1349	324	695	2	1	\N	\N
1350	324	695	2	2	0	\N
1351	324	695	2	4	0	\N
1352	324	703	1	1	\N	\N
1353	324	703	1	2	0	\N
1354	324	681	1	1	\N	\N
1355	324	681	1	2	0	\N
1356	324	681	2	1	\N	\N
1357	324	696	1	1	\N	\N
1358	324	696	1	2	0	\N
1359	324	696	2	1	\N	\N
1360	324	707	1	1	\N	\N
1361	324	707	1	2	0	\N
1362	324	707	2	2	0	\N
1363	325	708	1	1	\N	\N
1364	325	708	2	1	\N	\N
1365	325	709	1	1	\N	\N
1366	325	711	2	1	\N	\N
1367	325	710	1	1	\N	\N
1368	325	710	1	2	0	\N
1369	325	710	2	1	\N	\N
1370	325	710	2	2	0	\N
1371	326	724	2	1	\N	\N
1372	326	731	1	1	\N	\N
1373	326	731	1	3	0	\N
1374	326	731	2	1	\N	\N
1375	326	731	2	3	0	\N
1376	326	715	1	1	\N	\N
1377	326	715	1	3	0	\N
1378	326	715	2	1	\N	\N
1379	326	715	2	3	0	\N
1380	326	720	1	1	\N	\N
1381	326	720	1	3	0	\N
1382	326	720	2	1	\N	\N
1383	326	720	2	3	0	\N
1384	326	714	1	1	\N	\N
1385	326	714	1	3	0	\N
1386	326	714	2	1	\N	\N
1387	326	714	2	3	0	\N
1388	326	719	2	1	\N	\N
1389	326	719	2	3	0	\N
1390	326	717	1	1	\N	\N
1391	326	717	1	3	0	\N
1392	326	717	2	1	\N	\N
1393	326	717	2	3	0	\N
1394	326	716	1	1	\N	\N
1395	326	716	1	3	0	\N
1396	326	716	2	1	\N	\N
1397	326	716	2	3	0	\N
1398	326	713	1	1	\N	\N
1399	326	721	1	1	\N	\N
1400	326	721	1	3	0	\N
1401	326	721	2	1	\N	\N
1402	326	721	2	3	0	\N
1403	326	718	1	1	\N	\N
1404	326	718	1	3	0	\N
1405	326	718	2	1	\N	\N
1406	326	718	2	3	0	\N
1407	326	729	1	1	\N	\N
1408	326	729	2	1	\N	\N
1409	326	728	1	1	\N	\N
1410	326	728	1	3	0	\N
1411	326	728	2	1	\N	\N
1412	326	728	2	3	0	\N
1413	326	727	1	1	\N	\N
1414	326	727	2	1	\N	\N
1415	326	726	1	1	\N	\N
1416	326	730	1	1	\N	\N
1417	326	730	2	1	\N	\N
1418	326	725	1	1	\N	\N
1419	326	725	1	2	0	\N
1420	326	725	1	3	0	\N
1421	326	725	2	1	\N	\N
1422	326	725	2	2	0	\N
1423	326	725	2	3	0	\N
1424	326	723	1	1	\N	\N
1425	326	723	1	2	0	\N
1426	326	723	1	3	0	\N
1427	326	723	2	1	\N	\N
1428	326	723	2	2	0	\N
1429	326	723	2	3	0	\N
1430	326	712	1	1	\N	\N
1431	326	712	1	2	0	\N
1432	326	712	1	3	0	\N
1433	326	712	2	1	\N	\N
1434	326	712	2	2	0	\N
1435	326	712	2	3	0	\N
1436	326	722	1	1	\N	\N
1437	326	722	2	1	\N	\N
1438	327	752	1	1	\N	\N
1439	327	753	1	1	\N	\N
1440	327	754	1	3	0	\N
1441	327	756	1	1	\N	\N
1442	327	759	1	1	\N	\N
1443	327	757	1	2	0	\N
1444	327	757	1	3	0	\N
1445	327	757	2	2	0	\N
1446	327	758	2	1	\N	\N
1447	327	755	2	1	\N	\N
1448	327	733	1	1	\N	\N
1449	327	733	1	2	0	\N
1450	327	733	2	1	\N	\N
1451	327	733	2	2	0	\N
1452	327	744	1	1	\N	\N
1453	327	744	1	3	0	\N
1454	327	744	2	1	\N	\N
1455	327	738	1	1	\N	\N
1456	327	738	2	1	\N	\N
1457	327	740	1	1	\N	\N
1458	327	743	1	3	0	\N
1459	327	734	1	1	\N	\N
1460	327	734	1	3	0	\N
1461	327	734	2	1	\N	\N
1462	327	737	1	1	\N	\N
1463	327	739	1	1	\N	\N
1464	327	735	1	1	\N	\N
1465	327	745	1	1	\N	\N
1466	327	745	1	3	0	\N
1467	327	745	2	1	\N	\N
1468	327	741	1	1	\N	\N
1469	327	741	1	3	0	\N
1470	327	741	2	1	\N	\N
1471	327	742	1	1	\N	\N
1472	327	736	1	1	\N	\N
1473	327	760	1	1	\N	\N
1474	327	761	1	1	\N	\N
1475	327	751	1	1	\N	\N
1476	327	750	1	1	\N	\N
1477	327	732	1	1	\N	\N
1478	327	763	1	1	\N	\N
1479	327	763	1	2	0	\N
1480	327	763	2	1	\N	\N
1481	327	763	2	2	0	\N
1482	327	749	1	1	\N	\N
1483	327	766	1	1	\N	\N
1484	327	766	1	2	0	\N
1485	327	766	2	2	0	\N
1486	327	764	2	1	\N	\N
1487	327	768	2	1	\N	\N
1488	327	767	1	1	\N	\N
1489	327	765	1	1	\N	\N
1490	327	748	1	1	\N	\N
1491	327	748	1	2	0	\N
1492	327	748	2	1	\N	\N
1493	327	748	2	2	0	\N
1494	327	762	1	1	\N	\N
1495	327	762	1	2	0	\N
1496	327	762	1	3	0	\N
1497	327	762	2	1	\N	\N
1498	327	762	2	2	0	\N
1499	327	747	1	1	\N	\N
1500	327	746	1	1	\N	\N
1501	328	781	1	1	\N	\N
1502	328	782	1	1	\N	\N
1503	328	782	1	2	0	\N
1504	328	771	1	1	\N	\N
1505	328	771	2	1	\N	\N
1506	328	776	1	1	\N	\N
1507	328	775	1	1	\N	\N
1508	328	775	2	1	\N	\N
1509	328	778	1	1	\N	\N
1510	328	778	1	4	0	\N
1511	328	772	1	1	\N	\N
1512	328	779	1	1	\N	\N
1513	328	779	2	1	\N	\N
1514	328	777	1	1	\N	\N
1515	328	777	2	1	\N	\N
1516	328	773	1	1	\N	\N
1517	328	773	1	2	0	\N
1518	328	773	2	1	\N	\N
1519	328	773	2	2	0	\N
1520	328	769	1	1	\N	\N
1521	328	769	2	1	\N	\N
1522	328	788	1	1	\N	\N
1523	328	788	1	2	0	\N
1524	328	788	2	1	\N	\N
1525	328	785	1	1	\N	\N
1526	328	785	1	2	0	\N
1527	328	785	2	1	\N	\N
1528	328	787	1	1	\N	\N
1529	328	787	1	2	0	\N
1530	328	787	2	1	\N	\N
1531	328	787	2	2	0	\N
1532	328	786	1	1	\N	\N
1533	328	786	2	1	\N	\N
1534	328	784	1	1	\N	\N
1535	328	784	1	2	0	\N
1536	328	784	2	1	\N	\N
1537	328	784	2	2	0	\N
1538	328	780	1	1	\N	\N
1539	328	780	1	2	0	\N
1540	328	780	2	1	\N	\N
1541	328	780	2	2	0	\N
1542	328	789	1	1	\N	\N
1543	328	789	2	1	\N	\N
1544	328	774	1	1	\N	\N
1545	328	774	1	2	0	\N
1546	328	774	2	1	\N	\N
1547	328	783	1	1	\N	\N
1548	328	783	1	2	0	\N
1549	328	783	2	1	\N	\N
1550	328	783	2	2	0	\N
1551	328	770	1	1	\N	\N
1552	328	770	2	1	\N	\N
1553	329	807	1	1	\N	\N
1554	329	807	2	1	\N	\N
1555	329	809	1	1	\N	\N
1556	329	806	1	1	\N	\N
1557	329	806	1	2	0	\N
1558	329	808	1	1	\N	\N
1559	329	808	1	2	0	\N
1560	329	808	2	1	\N	\N
1561	329	808	2	2	0	\N
1562	329	794	1	1	\N	\N
1563	329	794	2	1	\N	\N
1564	329	797	1	1	\N	\N
1565	329	797	2	1	\N	\N
1566	329	795	1	1	\N	\N
1567	329	795	2	1	\N	\N
1568	329	796	1	1	\N	\N
1569	329	796	2	1	\N	\N
1570	329	798	1	1	\N	\N
1571	329	798	2	1	\N	\N
1572	329	811	1	1	\N	\N
1573	329	811	2	1	\N	\N
1574	329	813	1	1	\N	\N
1575	329	813	2	1	\N	\N
1576	329	814	1	1	\N	\N
1577	329	814	2	1	\N	\N
1578	329	815	1	1	\N	\N
1579	329	815	2	1	\N	\N
1580	329	812	1	1	\N	\N
1581	329	812	2	1	\N	\N
1582	329	799	1	1	\N	\N
1583	329	799	2	1	\N	\N
1584	329	800	1	1	\N	\N
1585	329	802	1	1	\N	\N
1586	329	802	2	1	\N	\N
1587	329	801	1	1	\N	\N
1588	329	801	2	1	\N	\N
1589	329	790	1	1	\N	\N
1590	329	791	1	1	\N	\N
1591	329	793	1	1	\N	\N
1592	329	792	1	1	\N	\N
1593	329	816	1	1	\N	\N
1594	329	816	1	2	0	\N
1595	329	816	2	1	\N	\N
1596	329	816	2	2	0	\N
1597	329	804	1	1	\N	\N
1598	329	804	1	2	0	\N
1599	329	804	2	1	\N	\N
1600	329	804	2	2	0	\N
1601	329	805	1	1	\N	\N
1602	329	805	2	1	\N	\N
1603	329	810	1	1	\N	\N
1604	329	803	1	1	\N	\N
1605	329	803	1	2	0	\N
1606	329	803	2	1	\N	\N
1607	329	803	2	2	0	\N
1608	331	818	1	1	\N	\N
1609	331	818	2	1	\N	\N
1610	331	819	1	1	\N	\N
1611	331	819	2	1	\N	\N
1612	331	821	1	1	\N	\N
1613	331	821	2	1	\N	\N
1614	331	817	1	1	\N	\N
1615	331	817	2	1	\N	\N
1616	331	823	1	1	\N	\N
1617	331	823	2	1	\N	\N
1618	331	822	1	1	\N	\N
1619	331	822	1	2	0	\N
1620	331	822	2	1	\N	\N
1621	331	822	2	2	0	\N
1622	331	824	1	1	\N	\N
1623	331	824	1	2	0	\N
1624	331	824	2	1	\N	\N
1625	331	824	2	2	0	\N
1626	331	820	1	1	\N	\N
1627	331	827	1	1	\N	\N
1628	331	827	1	2	0	\N
1629	331	827	2	1	\N	\N
1630	331	827	2	2	0	\N
1631	331	829	1	1	\N	\N
1632	331	829	1	2	0	\N
1633	331	829	2	1	\N	\N
1634	331	829	2	2	0	\N
1635	331	825	1	1	\N	\N
1636	331	830	1	1	\N	\N
1637	331	830	1	2	0	\N
1638	331	830	2	1	\N	\N
1639	331	830	2	2	0	\N
1640	331	832	1	1	\N	\N
1641	331	833	1	1	\N	\N
1642	331	836	1	1	\N	\N
1643	331	831	1	1	\N	\N
1644	331	831	1	2	0	\N
1645	331	831	2	1	\N	\N
1646	331	838	1	1	\N	\N
1647	331	838	1	2	0	\N
1648	331	838	2	1	\N	\N
1649	331	838	2	2	0	\N
1650	331	839	1	1	\N	\N
1651	331	839	1	2	0	\N
1652	331	839	2	1	\N	\N
1653	331	839	2	2	0	\N
1654	331	837	1	1	\N	\N
1655	331	837	1	2	0	\N
1656	331	837	2	1	\N	\N
1657	331	837	2	2	0	\N
1658	331	835	1	1	\N	\N
1659	331	840	1	1	\N	\N
1660	331	840	1	2	0	\N
1661	331	840	2	1	\N	\N
1662	331	840	2	2	0	\N
1663	331	834	1	1	\N	\N
1664	331	834	1	2	0	\N
1665	331	828	1	1	\N	\N
1666	331	828	1	2	0	\N
1667	331	828	2	1	\N	\N
1668	331	828	2	2	0	\N
1669	331	841	1	1	\N	\N
1670	331	841	1	2	0	\N
1671	331	841	2	1	\N	\N
1672	331	842	1	1	\N	\N
1673	331	842	1	2	0	\N
1674	331	843	1	1	\N	\N
1675	331	826	1	1	\N	\N
1676	334	880	2	1	\N	\N
1677	334	879	1	1	\N	\N
1678	334	859	1	1	\N	\N
1679	334	861	1	1	\N	\N
1680	334	861	1	2	0	\N
1681	334	860	2	1	\N	\N
1682	334	876	2	1	\N	\N
1683	334	877	1	1	\N	\N
1684	334	878	1	1	\N	\N
1685	334	850	1	1	\N	\N
1686	334	850	1	2	0	\N
1687	334	850	1	4	0	\N
1688	334	850	2	4	0	\N
1689	334	851	1	1	\N	\N
1690	334	851	1	2	0	\N
1691	334	851	1	4	0	\N
1692	334	851	2	4	0	\N
1693	334	870	1	1	\N	\N
1694	334	870	1	4	0	\N
1695	334	870	2	4	0	\N
1696	334	849	2	1	\N	\N
1697	334	863	1	1	\N	\N
1698	334	864	1	1	\N	\N
1699	334	865	2	1	\N	\N
1700	334	903	1	1	\N	\N
1701	334	903	2	1	\N	\N
1702	334	867	1	1	\N	\N
1703	334	848	1	1	\N	\N
1704	334	848	1	2	0	\N
1705	334	848	1	4	0	\N
1706	334	848	2	1	\N	\N
1707	334	848	2	4	0	\N
1708	334	852	1	1	\N	\N
1709	334	852	1	4	0	\N
1710	334	852	2	4	0	\N
1711	334	875	1	1	\N	\N
1712	334	875	1	2	0	\N
1713	334	875	2	1	\N	\N
1714	334	874	1	1	\N	\N
1715	334	874	2	2	0	\N
1716	334	853	1	1	\N	\N
1717	334	854	1	1	\N	\N
1718	334	854	1	2	0	\N
1719	334	854	2	1	\N	\N
1720	334	854	2	2	0	\N
1721	334	855	1	1	\N	\N
1722	334	855	1	2	0	\N
1723	334	855	2	2	0	\N
1724	334	871	1	1	\N	\N
1725	334	881	1	1	\N	\N
1726	334	881	1	2	0	\N
1727	334	881	2	1	\N	\N
1728	334	881	2	2	0	\N
1729	334	858	1	1	\N	\N
1730	334	889	1	1	\N	\N
1731	334	889	1	2	0	\N
1732	334	889	2	1	\N	\N
1733	334	889	2	2	0	\N
1734	334	890	1	1	\N	\N
1735	334	890	1	2	0	\N
1736	334	885	1	1	\N	\N
1737	334	888	1	1	\N	\N
1738	334	887	1	1	\N	\N
1739	334	887	2	1	\N	\N
1740	334	891	1	1	\N	\N
1741	334	891	1	2	0	\N
1742	334	891	2	1	\N	\N
1743	334	891	2	2	0	\N
1744	334	884	1	1	\N	\N
1745	334	884	1	2	0	\N
1746	334	884	2	1	\N	\N
1747	334	884	2	2	0	\N
1748	334	886	1	1	\N	\N
1749	334	856	1	1	\N	\N
1750	334	856	1	2	0	\N
1751	334	856	2	1	\N	\N
1752	334	856	2	2	0	\N
1753	334	846	1	1	\N	\N
1754	334	845	1	1	\N	\N
1755	334	845	1	2	0	\N
1756	334	845	2	1	\N	\N
1757	334	845	2	2	0	\N
1758	334	844	1	1	\N	\N
1759	334	892	1	1	\N	\N
1760	334	892	1	2	0	\N
1761	334	892	2	1	\N	\N
1762	334	892	2	2	0	\N
1763	334	868	1	1	\N	\N
1764	334	868	1	2	0	\N
1765	334	882	1	1	\N	\N
1766	334	866	1	1	\N	\N
1767	334	866	1	2	0	\N
1768	334	873	1	1	\N	\N
1769	334	873	1	2	0	\N
1770	334	873	2	1	\N	\N
1771	334	872	1	1	\N	\N
1772	334	872	1	2	0	\N
1773	334	872	2	1	\N	\N
1774	334	899	1	1	\N	\N
1775	334	899	1	2	0	\N
1776	334	899	2	1	\N	\N
1777	334	897	1	1	\N	\N
1778	334	897	1	2	0	\N
1779	334	897	2	1	\N	\N
1780	334	901	1	1	\N	\N
1781	334	901	1	2	0	\N
1782	334	901	2	1	\N	\N
1783	334	896	1	1	\N	\N
1784	334	900	1	1	\N	\N
1785	334	894	1	1	\N	\N
1786	334	894	1	2	0	\N
1787	334	894	2	1	\N	\N
1788	334	902	1	1	\N	\N
1789	334	902	1	2	0	\N
1790	334	898	1	1	\N	\N
1791	334	898	1	2	0	\N
1792	334	898	2	1	\N	\N
1793	334	895	1	1	\N	\N
1794	334	862	1	1	\N	\N
1795	334	869	1	1	\N	\N
1796	334	869	1	2	0	\N
1797	334	883	1	1	\N	\N
1798	334	883	1	2	0	\N
1799	334	883	2	1	\N	\N
1800	334	857	1	1	\N	\N
1801	334	857	1	2	0	\N
1802	334	893	1	1	\N	\N
1803	334	893	1	2	0	\N
1804	334	893	2	1	\N	\N
1805	334	893	2	2	0	\N
1806	334	847	1	1	\N	\N
1807	335	905	1	1	\N	\N
1808	335	905	1	2	0	\N
1809	335	906	1	1	\N	\N
1810	335	906	1	2	0	\N
1811	335	907	1	1	\N	\N
1812	335	909	1	1	\N	\N
1813	335	909	1	2	0	\N
1814	335	908	1	1	\N	\N
1815	335	908	1	2	0	\N
1816	335	911	1	1	\N	\N
1817	335	911	1	2	0	\N
1818	335	904	1	1	\N	\N
1819	335	910	1	1	\N	\N
1820	335	910	1	2	0	\N
1821	335	910	2	1	\N	\N
1822	336	922	1	1	\N	\N
1823	336	922	1	2	0	\N
1824	336	922	1	3	0	\N
1825	336	922	1	4	0	\N
1826	336	922	2	1	\N	\N
1827	336	922	2	2	0	\N
1828	336	922	2	3	0	\N
1829	336	922	2	4	0	\N
1830	336	921	1	1	\N	\N
1831	336	918	1	1	\N	\N
1832	336	918	1	2	0	\N
1833	336	918	1	3	0	\N
1834	336	918	1	4	0	\N
1835	336	918	2	1	\N	\N
1836	336	918	2	2	0	\N
1837	336	918	2	3	0	\N
1838	336	918	2	4	0	\N
1839	336	925	1	1	\N	\N
1840	336	925	1	2	0	\N
1841	336	925	2	1	\N	\N
1842	336	924	1	1	\N	\N
1843	336	924	1	2	0	\N
1844	336	924	1	3	0	\N
1845	336	924	2	1	\N	\N
1846	336	924	2	2	0	\N
1847	336	924	2	3	0	\N
1848	336	914	1	1	\N	\N
1849	336	914	1	2	0	\N
1850	336	914	1	3	0	\N
1851	336	914	2	1	\N	\N
1852	336	914	2	2	0	\N
1853	336	914	2	3	0	\N
1854	336	927	1	1	\N	\N
1855	336	927	1	2	0	\N
1856	336	927	2	1	\N	\N
1857	336	927	2	2	0	\N
1858	336	917	1	1	\N	\N
1859	336	917	2	1	\N	\N
1860	336	926	1	1	\N	\N
1861	336	915	1	1	\N	\N
1862	336	920	1	1	\N	\N
1863	336	920	1	2	0	\N
1864	336	920	2	1	\N	\N
1865	336	920	2	2	0	\N
1866	336	923	1	1	\N	\N
1867	336	923	1	2	0	\N
1868	336	923	2	1	\N	\N
1869	336	923	2	2	0	\N
1870	336	916	1	1	\N	\N
1871	336	928	1	1	\N	\N
1872	336	928	1	2	0	\N
1873	336	928	2	1	\N	\N
1874	336	928	2	2	0	\N
1875	336	913	1	1	\N	\N
1876	336	919	1	1	\N	\N
1877	336	912	1	1	\N	\N
1878	336	912	1	3	0	\N
1879	336	912	2	1	\N	\N
1880	337	946	1	1	\N	\N
1881	337	946	1	2	0	\N
1882	337	941	1	1	\N	\N
1883	337	941	1	2	0	\N
1884	337	938	1	1	\N	\N
1885	337	938	1	2	0	\N
1886	337	935	1	1	\N	\N
1887	337	935	1	2	0	\N
1888	337	935	2	1	\N	\N
1889	337	936	1	1	\N	\N
1890	337	930	1	1	\N	\N
1891	337	931	1	1	\N	\N
1892	337	932	1	1	\N	\N
1893	337	942	1	1	\N	\N
1894	337	942	1	2	0	\N
1895	337	947	1	1	\N	\N
1896	337	945	1	1	\N	\N
1897	337	945	1	2	0	\N
1898	337	945	2	1	\N	\N
1899	337	950	1	1	\N	\N
1900	337	949	1	1	\N	\N
1901	337	937	1	1	\N	\N
1902	337	933	1	1	\N	\N
1903	337	939	1	1	\N	\N
1904	337	948	1	1	\N	\N
1905	337	948	1	2	0	\N
1906	337	944	1	1	\N	\N
1907	337	944	1	2	0	\N
1908	337	934	1	1	\N	\N
1909	337	934	1	2	0	\N
1910	337	943	1	1	\N	\N
1911	337	943	1	2	0	\N
1912	337	929	1	1	\N	\N
1913	337	929	1	2	0	\N
1914	337	940	1	1	\N	\N
1915	338	993	1	1	\N	\N
1916	338	993	2	1	\N	\N
1917	338	951	1	1	\N	\N
1918	338	951	2	1	\N	\N
1919	338	972	1	1	\N	\N
1920	338	972	2	1	\N	\N
1921	338	994	1	1	\N	\N
1922	338	994	2	1	\N	\N
1923	338	970	1	1	\N	\N
1924	338	970	2	1	\N	\N
1925	338	971	1	1	\N	\N
1926	338	957	1	1	\N	\N
1927	338	963	1	1	\N	\N
1928	338	963	2	1	\N	\N
1929	338	965	1	1	\N	\N
1930	338	965	2	1	\N	\N
1931	338	958	1	1	\N	\N
1932	338	958	2	1	\N	\N
1933	338	952	1	1	\N	\N
1934	338	953	1	1	\N	\N
1935	338	954	1	1	\N	\N
1936	338	954	2	1	\N	\N
1937	338	955	1	1	\N	\N
1938	338	955	2	1	\N	\N
1939	338	959	1	1	\N	\N
1940	338	960	1	1	\N	\N
1941	338	960	2	1	\N	\N
1942	338	964	1	1	\N	\N
1943	338	964	2	1	\N	\N
1944	338	956	1	1	\N	\N
1945	338	956	2	1	\N	\N
1946	338	966	1	1	\N	\N
1947	338	966	2	1	\N	\N
1948	338	967	1	1	\N	\N
1949	338	967	2	1	\N	\N
1950	338	968	1	1	\N	\N
1951	338	969	1	1	\N	\N
1952	338	962	1	1	\N	\N
1953	338	961	1	1	\N	\N
1954	338	985	1	1	\N	\N
1955	338	985	2	1	\N	\N
1956	338	979	1	1	\N	\N
1957	338	979	2	1	\N	\N
1958	338	974	1	1	\N	\N
1959	338	977	1	1	\N	\N
1960	338	982	1	1	\N	\N
1961	338	984	1	1	\N	\N
1962	338	986	1	1	\N	\N
1963	338	978	1	1	\N	\N
1964	338	987	1	1	\N	\N
1965	338	988	1	1	\N	\N
1966	338	973	1	1	\N	\N
1967	338	975	1	1	\N	\N
1968	338	976	1	1	\N	\N
1969	338	983	1	1	\N	\N
1970	338	981	1	1	\N	\N
1971	338	990	1	1	\N	\N
1972	338	991	1	1	\N	\N
1973	338	992	1	1	\N	\N
1974	338	980	1	1	\N	\N
1975	338	980	2	1	\N	\N
1976	338	989	1	1	\N	\N
1977	338	989	2	1	\N	\N
1978	338	1007	1	1	\N	\N
1979	338	1007	2	1	\N	\N
1980	338	1005	1	1	\N	\N
1981	338	997	1	1	\N	\N
1982	338	1008	1	1	\N	\N
1983	338	996	1	1	\N	\N
1984	338	1000	1	1	\N	\N
1985	338	1001	1	1	\N	\N
1986	338	1002	1	1	\N	\N
1987	338	995	1	1	\N	\N
1988	338	998	1	1	\N	\N
1989	338	1004	1	1	\N	\N
1990	338	1004	2	1	\N	\N
1991	338	1009	1	1	\N	\N
1992	338	1009	2	1	\N	\N
1993	338	1003	1	1	\N	\N
1994	338	1003	2	1	\N	\N
1995	338	1006	1	1	\N	\N
1996	338	999	1	1	\N	\N
1997	340	1058	1	1	\N	\N
1998	340	1059	1	1	\N	\N
1999	340	1057	1	1	\N	\N
2000	340	1015	1	1	\N	\N
2001	340	1063	1	1	\N	\N
2002	340	1063	1	2	0	\N
2003	340	1012	1	1	\N	\N
2004	340	1018	1	1	\N	\N
2005	340	1017	1	1	\N	\N
2006	340	1019	1	1	\N	\N
2007	340	1019	1	2	0	\N
2008	340	1021	4	1	\N	\N
2009	340	1020	2	1	\N	\N
2010	340	1064	1	1	\N	\N
2011	340	1010	1	1	\N	\N
2012	340	1033	1	1	\N	\N
2013	340	1033	1	2	0	\N
2014	340	1060	1	1	\N	\N
2015	340	1043	1	1	\N	\N
2016	340	1014	1	1	\N	\N
2017	340	1014	1	2	0	\N
2018	340	1055	1	1	\N	\N
2019	340	1055	1	2	0	\N
2020	340	1032	1	1	\N	\N
2021	340	1068	1	1	\N	\N
2022	340	1068	1	2	0	\N
2023	340	1013	1	1	\N	\N
2024	340	1013	1	2	0	\N
2025	340	1013	1	3	0	\N
2026	340	1034	1	1	\N	\N
2027	340	1034	1	3	0	\N
2028	340	1056	1	1	\N	\N
2029	340	1062	1	1	\N	\N
2030	340	1030	1	1	\N	\N
2031	340	1030	1	2	0	\N
2032	340	1065	1	1	\N	\N
2033	340	1022	1	1	\N	\N
2034	340	1022	1	3	0	\N
2035	340	1045	1	1	\N	\N
2036	340	1045	1	2	0	\N
2037	340	1011	1	1	\N	\N
2038	340	1042	1	1	\N	\N
2039	340	1016	1	1	\N	\N
2040	340	1053	1	1	\N	\N
2041	340	1067	1	1	\N	\N
2042	340	1044	1	1	\N	\N
2043	340	1054	1	1	\N	\N
2044	340	1061	1	1	\N	\N
2045	340	1066	1	1	\N	\N
2046	340	1066	1	2	0	\N
2047	340	1031	1	1	\N	\N
2048	340	1036	1	1	\N	\N
2049	340	1037	1	1	\N	\N
2050	340	1038	1	1	\N	\N
2051	340	1039	1	1	\N	\N
2052	340	1040	1	1	\N	\N
2053	340	1041	1	1	\N	\N
2054	340	1035	1	1	\N	\N
2055	340	1024	1	1	\N	\N
2056	340	1025	1	1	\N	\N
2057	340	1026	1	1	\N	\N
2058	340	1027	1	1	\N	\N
2059	340	1028	1	1	\N	\N
2060	340	1029	1	1	\N	\N
2061	340	1023	1	1	\N	\N
2062	340	1047	1	1	\N	\N
2063	340	1048	1	1	\N	\N
2064	340	1049	1	1	\N	\N
2065	340	1050	1	1	\N	\N
2066	340	1051	1	1	\N	\N
2067	340	1052	1	1	\N	\N
2068	340	1046	1	1	\N	\N
2069	341	1114	1	1	\N	\N
2070	341	1114	1	2	0	\N
2071	341	1099	1	1	\N	\N
2072	341	1099	1	2	0	\N
2073	341	1099	2	1	\N	\N
2074	341	1099	2	2	0	\N
2075	341	1076	1	1	\N	\N
2076	341	1076	1	2	0	\N
2077	341	1076	2	1	\N	\N
2078	341	1076	2	2	0	\N
2079	341	1127	1	1	\N	\N
2080	341	1127	1	2	0	\N
2081	341	1109	1	1	\N	\N
2082	341	1109	1	2	0	\N
2083	341	1111	1	1	\N	\N
2084	341	1111	1	2	0	\N
2085	341	1112	2	1	\N	\N
2086	341	1132	1	1	\N	\N
2087	341	1132	2	1	\N	\N
2088	341	1108	1	1	\N	\N
2089	341	1094	1	1	\N	\N
2090	341	1094	1	2	0	\N
2091	341	1128	1	1	\N	\N
2092	341	1128	1	2	0	\N
2093	341	1098	1	1	\N	\N
2094	341	1125	1	1	\N	\N
2095	341	1125	1	2	0	\N
2096	341	1125	2	1	\N	\N
2097	341	1083	1	1	\N	\N
2098	341	1082	1	1	\N	\N
2099	341	1085	1	1	\N	\N
2100	341	1085	1	2	0	\N
2101	341	1086	2	1	\N	\N
2102	341	1084	1	1	\N	\N
2103	341	1126	1	1	\N	\N
2104	341	1070	1	1	\N	\N
2105	341	1092	1	1	\N	\N
2106	341	1092	1	2	0	\N
2107	341	1092	2	1	\N	\N
2108	341	1119	1	1	\N	\N
2109	341	1115	1	1	\N	\N
2110	341	1115	1	2	0	\N
2111	341	1115	2	1	\N	\N
2112	341	1077	1	1	\N	\N
2113	341	1077	1	2	0	\N
2114	341	1105	1	1	\N	\N
2115	341	1104	1	1	\N	\N
2116	341	1100	1	1	\N	\N
2117	341	1074	1	1	\N	\N
2118	341	1074	1	2	0	\N
2119	341	1074	2	1	\N	\N
2120	341	1095	1	1	\N	\N
2121	341	1095	2	1	\N	\N
2122	341	1089	1	1	\N	\N
2123	341	1089	1	2	0	\N
2124	341	1130	1	1	\N	\N
2125	341	1130	1	2	0	\N
2126	341	1087	1	1	\N	\N
2127	341	1087	2	1	\N	\N
2128	341	1107	1	1	\N	\N
2129	341	1102	1	1	\N	\N
2130	341	1102	1	2	0	\N
2131	341	1102	2	1	\N	\N
2132	341	1071	1	1	\N	\N
2133	341	1101	1	1	\N	\N
2134	341	1097	1	1	\N	\N
2135	341	1097	1	4	0	\N
2136	341	1097	2	1	\N	\N
2137	341	1097	2	4	0	\N
2138	341	1096	1	1	\N	\N
2139	341	1096	1	2	0	\N
2140	341	1096	2	1	\N	\N
2141	341	1075	1	1	\N	\N
2142	341	1079	1	1	\N	\N
2143	341	1080	1	1	\N	\N
2144	341	1081	1	1	\N	\N
2145	341	1073	1	1	\N	\N
2146	341	1129	1	1	\N	\N
2147	341	1113	1	1	\N	\N
2148	341	1113	1	2	0	\N
2149	341	1113	2	1	\N	\N
2150	341	1133	1	1	\N	\N
2151	341	1133	1	2	0	\N
2152	341	1134	1	1	\N	\N
2153	341	1088	1	1	\N	\N
2154	341	1088	1	2	0	\N
2155	341	1072	1	1	\N	\N
2156	341	1072	2	1	\N	\N
2157	341	1121	1	1	\N	\N
2158	341	1118	1	1	\N	\N
2159	341	1117	1	1	\N	\N
2160	341	1069	1	1	\N	\N
2161	341	1110	1	1	\N	\N
2162	341	1116	1	1	\N	\N
2163	341	1106	1	1	\N	\N
2164	341	1120	1	1	\N	\N
2165	341	1093	1	1	\N	\N
2166	341	1078	1	1	\N	\N
2167	341	1091	1	2	0	\N
2168	341	1103	1	1	\N	\N
2169	341	1103	1	2	0	\N
2170	341	1123	1	1	\N	\N
2171	341	1122	1	1	\N	\N
2172	341	1122	1	2	0	\N
2173	341	1124	1	1	\N	\N
2174	341	1131	1	1	\N	\N
2175	341	1131	1	2	0	\N
2176	341	1090	1	1	\N	\N
2177	342	1175	1	1	\N	\N
2178	342	1164	1	1	\N	\N
2179	342	1164	1	2	0	\N
2180	342	1164	2	1	\N	\N
2181	342	1141	1	1	\N	\N
2182	342	1141	1	2	0	\N
2183	342	1141	2	1	\N	\N
2184	342	1183	1	1	\N	\N
2185	342	1183	1	2	0	\N
2186	342	1173	1	1	\N	\N
2187	342	1173	1	2	0	\N
2188	342	1174	2	1	\N	\N
2189	342	1174	2	2	0	\N
2190	342	1186	1	1	\N	\N
2191	342	1188	1	1	\N	\N
2192	342	1187	1	1	\N	\N
2193	342	1187	2	1	\N	\N
2194	342	1165	1	1	\N	\N
2195	342	1143	1	1	\N	\N
2196	342	1170	1	1	\N	\N
2197	342	1170	1	2	0	\N
2198	342	1160	1	1	\N	\N
2199	342	1160	1	2	0	\N
2200	342	1160	2	1	\N	\N
2201	342	1161	1	1	\N	\N
2202	342	1161	1	2	0	\N
2203	342	1184	1	1	\N	\N
2204	342	1184	1	2	0	\N
2205	342	1167	1	1	\N	\N
2206	342	1182	1	1	\N	\N
2207	342	1182	1	2	0	\N
2208	342	1137	1	1	\N	\N
2209	342	1146	1	1	\N	\N
2210	342	1146	2	1	\N	\N
2211	342	1147	1	1	\N	\N
2212	342	1147	1	2	0	\N
2213	342	1149	4	1	\N	\N
2214	342	1148	2	1	\N	\N
2215	342	1148	2	2	0	\N
2216	342	1157	1	1	\N	\N
2217	342	1157	1	2	0	\N
2218	342	1171	1	1	\N	\N
2219	342	1176	1	1	\N	\N
2220	342	1176	1	2	0	\N
2221	342	1178	1	1	\N	\N
2222	342	1138	1	1	\N	\N
2223	342	1142	1	1	\N	\N
2224	342	1142	1	2	0	\N
2225	342	1172	1	1	\N	\N
2226	342	1181	1	1	\N	\N
2227	342	1159	1	1	\N	\N
2228	342	1189	1	1	\N	\N
2229	342	1189	1	2	0	\N
2230	342	1140	1	1	\N	\N
2231	342	1140	1	2	0	\N
2232	342	1162	1	1	\N	\N
2233	342	1162	2	1	\N	\N
2234	342	1151	1	1	\N	\N
2235	342	1151	1	2	0	\N
2236	342	1185	1	1	\N	\N
2237	342	1150	1	1	\N	\N
2238	342	1150	2	1	\N	\N
2239	342	1166	1	1	\N	\N
2240	342	1166	2	1	\N	\N
2241	342	1136	1	1	\N	\N
2242	342	1163	1	1	\N	\N
2243	342	1139	1	1	\N	\N
2244	342	1145	1	1	\N	\N
2245	342	1135	1	1	\N	\N
2246	342	1190	1	1	\N	\N
2247	342	1169	1	1	\N	\N
2248	342	1177	1	1	\N	\N
2249	342	1158	1	1	\N	\N
2250	342	1144	1	1	\N	\N
2251	342	1153	1	2	0	\N
2252	342	1154	1	1	\N	\N
2253	342	1168	1	1	\N	\N
2254	342	1179	1	1	\N	\N
2255	342	1180	1	1	\N	\N
2256	342	1152	1	1	\N	\N
2257	342	1155	1	1	\N	\N
2258	342	1156	1	1	\N	\N
2259	343	1219	1	1	\N	\N
2260	343	1205	1	1	\N	\N
2261	343	1205	2	1	\N	\N
2262	343	1224	1	1	\N	\N
2263	343	1195	1	1	\N	\N
2264	343	1195	1	2	0	\N
2265	343	1195	2	1	\N	\N
2266	343	1195	2	2	0	\N
2267	343	1214	1	1	\N	\N
2268	343	1214	1	2	0	\N
2269	343	1193	1	1	\N	\N
2270	343	1211	1	1	\N	\N
2271	343	1211	2	1	\N	\N
2272	343	1192	1	1	\N	\N
2273	343	1225	1	1	\N	\N
2274	343	1227	1	1	\N	\N
2275	343	1206	1	1	\N	\N
2276	343	1206	2	1	\N	\N
2277	343	1200	1	1	\N	\N
2278	343	1196	1	1	\N	\N
2279	343	1196	1	2	0	\N
2280	343	1196	2	2	0	\N
2281	343	1197	1	1	\N	\N
2282	343	1201	1	1	\N	\N
2283	343	1216	1	1	\N	\N
2284	343	1199	1	1	\N	\N
2285	343	1212	1	1	\N	\N
2286	343	1228	1	1	\N	\N
2287	343	1228	2	1	\N	\N
2288	343	1213	1	1	\N	\N
2289	343	1204	1	1	\N	\N
2290	343	1194	1	1	\N	\N
2291	343	1229	1	1	\N	\N
2292	343	1198	1	1	\N	\N
2293	343	1233	1	1	\N	\N
2294	343	1233	1	2	0	\N
2295	343	1218	1	1	\N	\N
2296	343	1218	1	2	0	\N
2297	343	1202	1	1	\N	\N
2298	343	1208	1	1	\N	\N
2299	343	1209	1	1	\N	\N
2300	343	1231	1	1	\N	\N
2301	343	1231	1	2	0	\N
2302	343	1231	2	1	\N	\N
2303	343	1230	1	1	\N	\N
2304	343	1207	1	1	\N	\N
2305	343	1207	2	1	\N	\N
2306	343	1217	1	1	\N	\N
2307	343	1234	1	1	\N	\N
2308	343	1234	1	2	0	\N
2309	343	1235	1	1	\N	\N
2310	343	1235	1	2	0	\N
2311	343	1235	2	1	\N	\N
2312	343	1226	1	1	\N	\N
2313	343	1226	1	2	0	\N
2314	343	1236	1	1	\N	\N
2315	343	1236	1	2	0	\N
2316	343	1236	2	1	\N	\N
2317	343	1203	1	1	\N	\N
2318	343	1203	1	2	0	\N
2319	343	1191	1	1	\N	\N
2320	343	1223	1	1	\N	\N
2321	343	1223	1	2	0	\N
2322	343	1222	1	1	\N	\N
2323	343	1222	1	2	0	\N
2324	343	1222	2	2	0	\N
2325	343	1215	1	1	\N	\N
2326	343	1220	1	1	\N	\N
2327	343	1221	1	1	\N	\N
2328	343	1210	1	1	\N	\N
2329	343	1232	1	1	\N	\N
2330	343	1237	1	1	\N	\N
2331	344	1238	1	1	\N	\N
2332	344	1281	1	1	\N	\N
2333	344	1281	2	1	\N	\N
2334	344	1239	1	1	\N	\N
2335	344	1239	2	1	\N	\N
2336	344	1261	1	1	\N	\N
2337	344	1261	2	1	\N	\N
2338	344	1282	1	1	\N	\N
2339	344	1282	2	1	\N	\N
2340	344	1259	1	1	\N	\N
2341	344	1302	1	1	\N	\N
2342	344	1260	1	1	\N	\N
2343	344	1260	2	1	\N	\N
2344	344	1244	1	1	\N	\N
2345	344	1244	2	1	\N	\N
2346	344	1247	1	1	\N	\N
2347	344	1247	2	1	\N	\N
2348	344	1250	1	1	\N	\N
2349	344	1250	2	1	\N	\N
2350	344	1253	1	1	\N	\N
2351	344	1253	2	1	\N	\N
2352	344	1240	1	1	\N	\N
2353	344	1241	1	1	\N	\N
2354	344	1242	1	1	\N	\N
2355	344	1243	1	1	\N	\N
2356	344	1245	1	1	\N	\N
2357	344	1246	1	1	\N	\N
2358	344	1249	1	1	\N	\N
2359	344	1248	1	1	\N	\N
2360	344	1252	1	1	\N	\N
2361	344	1254	1	1	\N	\N
2362	344	1255	1	1	\N	\N
2363	344	1256	1	1	\N	\N
2364	344	1257	1	1	\N	\N
2365	344	1258	1	1	\N	\N
2366	344	1251	1	1	\N	\N
2367	344	1266	2	1	\N	\N
2368	344	1269	1	1	\N	\N
2369	344	1272	1	1	\N	\N
2370	344	1275	1	1	\N	\N
2371	344	1262	1	1	\N	\N
2372	344	1263	1	1	\N	\N
2373	344	1264	1	1	\N	\N
2374	344	1265	1	1	\N	\N
2375	344	1267	1	1	\N	\N
2376	344	1268	1	1	\N	\N
2377	344	1271	1	1	\N	\N
2378	344	1270	1	1	\N	\N
2379	344	1274	1	1	\N	\N
2380	344	1276	1	1	\N	\N
2381	344	1277	1	1	\N	\N
2382	344	1278	1	1	\N	\N
2383	344	1279	1	1	\N	\N
2384	344	1280	1	1	\N	\N
2385	344	1273	1	1	\N	\N
2386	344	1287	1	1	\N	\N
2387	344	1287	2	1	\N	\N
2388	344	1290	1	1	\N	\N
2389	344	1290	2	1	\N	\N
2390	344	1293	1	1	\N	\N
2391	344	1293	2	1	\N	\N
2392	344	1296	1	1	\N	\N
2393	344	1283	1	1	\N	\N
2394	344	1284	1	1	\N	\N
2395	344	1285	1	1	\N	\N
2396	344	1286	1	1	\N	\N
2397	344	1288	1	1	\N	\N
2398	344	1288	2	1	\N	\N
2399	344	1289	1	1	\N	\N
2400	344	1292	1	1	\N	\N
2401	344	1291	1	1	\N	\N
2402	344	1295	1	1	\N	\N
2403	344	1297	1	1	\N	\N
2404	344	1298	1	1	\N	\N
2405	344	1299	1	1	\N	\N
2406	344	1300	1	1	\N	\N
2407	344	1301	1	1	\N	\N
2408	344	1294	1	1	\N	\N
2409	345	1326	1	1	\N	\N
2410	345	1400	1	1	\N	\N
2411	345	1400	1	2	0	\N
2412	345	1329	1	1	\N	\N
2413	345	1328	1	1	\N	\N
2414	345	1336	1	1	\N	\N
2415	345	1336	1	2	0	\N
2416	345	1344	2	1	\N	\N
2417	345	1335	1	1	\N	\N
2418	345	1304	1	1	\N	\N
2419	345	1356	1	1	\N	\N
2420	345	1361	1	1	\N	\N
2421	345	1361	1	2	0	\N
2422	345	1392	1	1	\N	\N
2423	345	1392	1	2	0	\N
2424	345	1370	1	1	\N	\N
2425	345	1360	1	1	\N	\N
2426	345	1360	1	2	0	\N
2427	345	1371	1	1	\N	\N
2428	345	1371	1	2	0	\N
2429	345	1394	1	1	\N	\N
2430	345	1313	1	1	\N	\N
2431	345	1313	1	2	0	\N
2432	345	1363	1	1	\N	\N
2433	345	1357	1	1	\N	\N
2434	345	1357	1	2	0	\N
2435	345	1351	1	1	\N	\N
2436	345	1372	1	1	\N	\N
2437	345	1305	1	1	\N	\N
2438	345	1367	1	1	\N	\N
2439	345	1315	1	1	\N	\N
2440	345	1327	1	1	\N	\N
2441	345	1327	1	2	0	\N
2442	345	1381	1	1	\N	\N
2443	345	1406	1	1	\N	\N
2444	345	1303	1	1	\N	\N
2445	345	1303	1	2	0	\N
2446	345	1380	1	1	\N	\N
2447	345	1380	1	2	0	\N
2448	345	1393	1	1	\N	\N
2449	345	1393	1	2	0	\N
2450	345	1362	1	1	\N	\N
2451	345	1362	1	2	0	\N
2452	345	1316	1	1	\N	\N
2453	345	1382	1	1	\N	\N
2454	345	1378	1	1	\N	\N
2455	345	1396	1	1	\N	\N
2456	345	1396	1	2	0	\N
2457	345	1398	1	1	\N	\N
2458	345	1398	1	2	0	\N
2459	345	1397	1	1	\N	\N
2460	345	1397	1	2	0	\N
2461	345	1399	1	1	\N	\N
2462	345	1399	1	2	0	\N
2463	345	1395	1	1	\N	\N
2464	345	1395	1	2	0	\N
2465	345	1405	1	1	\N	\N
2466	345	1405	1	2	0	\N
2467	345	1379	1	1	\N	\N
2468	345	1379	1	2	0	\N
2469	345	1404	1	1	\N	\N
2470	345	1401	1	1	\N	\N
2471	345	1402	1	1	\N	\N
2472	345	1403	1	1	\N	\N
2473	345	1330	1	1	\N	\N
2474	345	1331	1	1	\N	\N
2475	345	1332	1	1	\N	\N
2476	345	1333	1	1	\N	\N
2477	345	1334	1	1	\N	\N
2478	345	1337	1	1	\N	\N
2479	345	1338	1	1	\N	\N
2480	345	1339	1	1	\N	\N
2481	345	1340	1	1	\N	\N
2482	345	1341	1	1	\N	\N
2483	345	1342	1	1	\N	\N
2484	345	1343	1	1	\N	\N
2485	345	1345	2	1	\N	\N
2486	345	1346	2	1	\N	\N
2487	345	1347	2	1	\N	\N
2488	345	1348	2	1	\N	\N
2489	345	1349	2	1	\N	\N
2490	345	1350	2	1	\N	\N
2491	345	1314	1	1	\N	\N
2492	345	1364	1	1	\N	\N
2493	345	1365	1	1	\N	\N
2494	345	1366	1	1	\N	\N
2495	345	1358	1	1	\N	\N
2496	345	1359	1	1	\N	\N
2497	345	1352	1	1	\N	\N
2498	345	1353	1	1	\N	\N
2499	345	1354	1	1	\N	\N
2500	345	1355	1	1	\N	\N
2501	345	1373	1	1	\N	\N
2502	345	1374	1	1	\N	\N
2503	345	1375	1	1	\N	\N
2504	345	1376	1	1	\N	\N
2505	345	1377	1	1	\N	\N
2506	345	1306	1	1	\N	\N
2507	345	1307	1	1	\N	\N
2508	345	1308	1	1	\N	\N
2509	345	1309	1	1	\N	\N
2510	345	1310	1	1	\N	\N
2511	345	1311	1	1	\N	\N
2512	345	1312	1	1	\N	\N
2513	345	1368	1	1	\N	\N
2514	345	1369	1	1	\N	\N
2515	345	1317	1	1	\N	\N
2516	345	1318	1	1	\N	\N
2517	345	1319	1	1	\N	\N
2518	345	1320	1	1	\N	\N
2519	345	1321	1	1	\N	\N
2520	345	1322	1	1	\N	\N
2521	345	1323	1	1	\N	\N
2522	345	1324	1	1	\N	\N
2523	345	1325	1	1	\N	\N
2524	345	1383	1	1	\N	\N
2525	345	1384	1	1	\N	\N
2526	345	1385	1	1	\N	\N
2527	345	1386	1	1	\N	\N
2528	345	1387	1	1	\N	\N
2529	345	1388	1	1	\N	\N
2530	345	1389	1	1	\N	\N
2531	345	1390	1	1	\N	\N
2532	345	1391	1	1	\N	\N
2533	346	1471	1	1	\N	\N
2534	346	1471	2	1	\N	\N
2535	346	1471	3	1	\N	\N
2536	346	1449	3	1	\N	\N
2537	346	1437	1	1	\N	\N
2538	346	1437	1	2	0	\N
2539	346	1437	2	1	\N	\N
2540	346	1437	3	1	\N	\N
2541	346	1437	3	2	0	\N
2542	346	1438	3	1	\N	\N
2543	346	1414	3	1	\N	\N
2544	346	1408	3	1	\N	\N
2545	346	1445	3	1	\N	\N
2546	346	1465	1	1	\N	\N
2547	346	1465	1	2	0	\N
2548	346	1465	2	1	\N	\N
2549	346	1465	3	1	\N	\N
2550	346	1465	3	2	0	\N
2551	346	1409	3	1	\N	\N
2552	346	1421	3	1	\N	\N
2553	346	1422	1	1	\N	\N
2554	346	1422	2	1	\N	\N
2555	346	1422	3	1	\N	\N
2556	346	1424	1	1	\N	\N
2557	346	1424	1	2	0	\N
2558	346	1428	6	1	\N	\N
2559	346	1427	2	1	\N	\N
2560	346	1426	5	1	\N	\N
2561	346	1423	1	1	\N	\N
2562	346	1423	3	1	\N	\N
2563	346	1425	3	1	\N	\N
2564	346	1425	3	2	0	\N
2565	346	1466	3	1	\N	\N
2566	346	1454	3	1	\N	\N
2567	346	1436	1	1	\N	\N
2568	346	1436	1	2	0	\N
2569	346	1436	1	4	0	\N
2570	346	1436	2	1	\N	\N
2571	346	1436	3	1	\N	\N
2572	346	1436	3	2	0	\N
2573	346	1436	3	4	0	\N
2574	346	1417	3	1	\N	\N
2575	346	1456	1	1	\N	\N
2576	346	1456	1	2	0	\N
2577	346	1456	2	1	\N	\N
2578	346	1456	3	1	\N	\N
2579	346	1456	3	2	0	\N
2580	346	1461	3	1	\N	\N
2581	346	1439	1	1	\N	\N
2582	346	1439	1	2	0	\N
2583	346	1439	3	2	0	\N
2584	346	1441	3	1	\N	\N
2585	346	1440	3	1	\N	\N
2586	346	1411	1	1	\N	\N
2587	346	1411	2	1	\N	\N
2588	346	1411	3	1	\N	\N
2589	346	1413	1	1	\N	\N
2590	346	1413	1	2	0	\N
2591	346	1413	2	1	\N	\N
2592	346	1413	3	1	\N	\N
2593	346	1413	3	2	0	\N
2594	346	1450	1	1	\N	\N
2595	346	1450	2	1	\N	\N
2596	346	1450	3	1	\N	\N
2597	346	1464	3	1	\N	\N
2598	346	1447	1	1	\N	\N
2599	346	1447	2	1	\N	\N
2600	346	1447	3	1	\N	\N
2601	346	1475	1	1	\N	\N
2602	346	1475	1	2	0	\N
2603	346	1475	1	3	0	\N
2604	346	1475	1	4	0	\N
2605	346	1475	2	1	\N	\N
2606	346	1475	3	1	\N	\N
2607	346	1475	3	2	0	\N
2608	346	1475	3	3	0	\N
2609	346	1475	3	4	0	\N
2610	346	1412	1	1	\N	\N
2611	346	1412	1	2	0	\N
2612	346	1412	1	3	0	\N
2613	346	1412	2	1	\N	\N
2614	346	1412	3	1	\N	\N
2615	346	1412	3	2	0	\N
2616	346	1412	3	3	0	\N
2617	346	1434	3	1	\N	\N
2618	346	1442	1	1	\N	\N
2619	346	1442	1	3	0	\N
2620	346	1442	2	1	\N	\N
2621	346	1442	3	1	\N	\N
2622	346	1442	3	3	0	\N
2623	346	1431	1	1	\N	\N
2624	346	1431	1	2	0	\N
2625	346	1431	3	1	\N	\N
2626	346	1431	3	2	0	\N
2627	346	1432	3	1	\N	\N
2628	346	1469	1	1	\N	\N
2629	346	1469	3	1	\N	\N
2630	346	1429	1	1	\N	\N
2631	346	1429	1	3	0	\N
2632	346	1429	2	1	\N	\N
2633	346	1429	3	1	\N	\N
2634	346	1429	3	3	0	\N
2635	346	1446	1	1	\N	\N
2636	346	1446	1	2	0	\N
2637	346	1446	1	3	0	\N
2638	346	1446	2	1	\N	\N
2639	346	1446	3	1	\N	\N
2640	346	1446	3	2	0	\N
2641	346	1446	3	3	0	\N
2642	346	1407	1	1	\N	\N
2643	346	1407	2	1	\N	\N
2644	346	1407	3	1	\N	\N
2645	346	1444	1	1	\N	\N
2646	346	1444	1	4	0	\N
2647	346	1444	2	4	0	\N
2648	346	1444	3	1	\N	\N
2649	346	1444	3	4	0	\N
2650	346	1443	1	1	\N	\N
2651	346	1443	3	1	\N	\N
2652	346	1416	1	1	\N	\N
2653	346	1416	1	2	0	\N
2654	346	1416	3	1	\N	\N
2655	346	1416	3	2	0	\N
2656	346	1420	1	1	\N	\N
2657	346	1420	3	1	\N	\N
2658	346	1418	1	1	\N	\N
2659	346	1418	1	2	0	\N
2660	346	1418	3	1	\N	\N
2661	346	1418	3	2	0	\N
2662	346	1419	1	2	0	\N
2663	346	1419	2	1	\N	\N
2664	346	1419	3	1	\N	\N
2665	346	1419	3	2	0	\N
2666	346	1448	1	1	\N	\N
2667	346	1448	3	1	\N	\N
2668	346	1455	1	1	\N	\N
2669	346	1455	3	1	\N	\N
2670	346	1467	3	1	\N	\N
2671	346	1453	1	1	\N	\N
2672	346	1453	3	1	\N	\N
2673	346	1472	1	1	\N	\N
2674	346	1472	2	1	\N	\N
2675	346	1472	3	1	\N	\N
2676	346	1452	1	1	\N	\N
2677	346	1452	3	1	\N	\N
2678	346	1430	1	1	\N	\N
2679	346	1430	1	2	0	\N
2680	346	1430	3	1	\N	\N
2681	346	1430	3	2	0	\N
2682	346	1410	1	1	\N	\N
2683	346	1410	2	1	\N	\N
2684	346	1410	3	1	\N	\N
2685	346	1460	1	1	\N	\N
2686	346	1460	3	1	\N	\N
2687	346	1458	1	1	\N	\N
2688	346	1458	3	1	\N	\N
2689	346	1459	1	1	\N	\N
2690	346	1459	3	1	\N	\N
2691	346	1457	1	1	\N	\N
2692	346	1457	2	1	\N	\N
2693	346	1457	3	1	\N	\N
2694	346	1451	1	1	\N	\N
2695	346	1451	2	1	\N	\N
2696	346	1451	3	1	\N	\N
2697	346	1474	1	1	\N	\N
2698	346	1474	3	1	\N	\N
2699	346	1415	1	1	\N	\N
2700	346	1415	3	1	\N	\N
2701	346	1435	1	2	0	\N
2702	346	1435	3	2	0	\N
2703	346	1462	3	1	\N	\N
2704	346	1463	3	1	\N	\N
2705	346	1470	1	1	\N	\N
2706	346	1470	3	1	\N	\N
2707	346	1433	3	1	\N	\N
2708	346	1468	3	1	\N	\N
2709	346	1473	1	1	\N	\N
2710	346	1473	3	1	\N	\N
2711	347	1490	1	1	\N	\N
2712	347	1492	1	1	\N	\N
2713	347	1492	1	3	0	\N
2714	347	1492	2	1	\N	\N
2715	347	1492	2	3	0	\N
2716	347	1489	1	1	\N	\N
2717	347	1489	1	3	0	\N
2718	347	1489	2	1	\N	\N
2719	347	1489	2	3	0	\N
2720	347	1478	1	1	\N	\N
2721	347	1478	1	3	0	\N
2722	347	1478	2	1	\N	\N
2723	347	1478	2	3	0	\N
2724	347	1484	1	1	\N	\N
2725	347	1484	1	3	0	\N
2726	347	1484	2	1	\N	\N
2727	347	1477	1	1	\N	\N
2728	347	1477	1	3	0	\N
2729	347	1477	2	1	\N	\N
2730	347	1483	2	1	\N	\N
2731	347	1481	1	1	\N	\N
2732	347	1481	1	3	0	\N
2733	347	1481	2	1	\N	\N
2734	347	1479	1	1	\N	\N
2735	347	1479	1	3	0	\N
2736	347	1479	2	1	\N	\N
2737	347	1476	1	1	\N	\N
2738	347	1485	1	1	\N	\N
2739	347	1485	1	3	0	\N
2740	347	1485	2	1	\N	\N
2741	347	1482	1	1	\N	\N
2742	347	1482	1	3	0	\N
2743	347	1482	2	1	\N	\N
2744	347	1480	1	1	\N	\N
2745	347	1480	2	1	\N	\N
2746	347	1491	1	1	\N	\N
2747	347	1491	1	3	0	\N
2748	347	1491	2	1	\N	\N
2749	347	1488	1	1	\N	\N
2750	347	1487	1	1	\N	\N
2751	347	1486	1	1	\N	\N
2752	347	1486	2	1	\N	\N
2753	347	1493	1	1	\N	\N
2754	347	1494	1	1	\N	\N
2755	347	1495	1	1	\N	\N
2756	347	1496	1	1	\N	\N
2757	347	1497	1	1	\N	\N
2758	347	1498	1	1	\N	\N
2759	347	1499	1	1	\N	\N
2760	347	1500	1	1	\N	\N
2761	348	1526	1	1	\N	\N
2762	348	1517	1	1	\N	\N
2763	348	1517	1	2	0	\N
2764	348	1517	4	1	\N	\N
2765	348	1517	4	2	0	\N
2766	348	1504	1	1	\N	\N
2767	348	1504	1	2	0	\N
2768	348	1504	4	1	\N	\N
2769	348	1504	4	2	0	\N
2770	348	1519	1	1	\N	\N
2771	348	1519	1	2	0	\N
2772	348	1519	4	1	\N	\N
2773	348	1519	4	2	0	\N
2774	348	1521	1	1	\N	\N
2775	348	1522	2	1	\N	\N
2776	348	1531	1	1	\N	\N
2777	348	1513	1	1	\N	\N
2778	348	1529	1	1	\N	\N
2779	348	1529	1	2	0	\N
2780	348	1506	1	1	\N	\N
2781	348	1512	1	1	\N	\N
2782	348	1512	1	2	0	\N
2783	348	1505	1	1	\N	\N
2784	348	1505	1	2	0	\N
2785	348	1520	1	1	\N	\N
2786	348	1501	1	1	\N	\N
2787	348	1503	1	1	\N	\N
2788	348	1502	1	1	\N	\N
2789	348	1502	1	2	0	\N
2790	348	1502	4	1	\N	\N
2791	348	1514	1	1	\N	\N
2792	348	1511	1	1	\N	\N
2793	348	1518	1	1	\N	\N
2794	348	1516	1	1	\N	\N
2795	348	1515	1	1	\N	\N
2796	348	1528	1	1	\N	\N
2797	348	1527	1	1	\N	\N
2798	348	1530	1	1	\N	\N
2799	348	1523	2	1	\N	\N
2800	348	1524	2	1	\N	\N
2801	348	1525	2	1	\N	\N
2802	348	1533	1	1	\N	\N
2803	348	1534	1	1	\N	\N
2804	348	1532	1	1	\N	\N
2805	348	1508	1	1	\N	\N
2806	348	1509	1	1	\N	\N
2807	348	1510	1	1	\N	\N
2808	348	1507	1	1	\N	\N
2809	349	1571	1	1	\N	\N
2810	349	1571	2	1	\N	\N
2811	349	1571	3	1	\N	\N
2812	349	1535	1	1	\N	\N
2813	349	1535	2	1	\N	\N
2814	349	1535	3	1	\N	\N
2815	349	1553	1	1	\N	\N
2816	349	1553	2	1	\N	\N
2817	349	1553	3	1	\N	\N
2818	349	1582	1	1	\N	\N
2819	349	1582	2	1	\N	\N
2820	349	1582	3	1	\N	\N
2821	349	1572	2	1	\N	\N
2822	349	1572	3	1	\N	\N
2823	349	1551	1	1	\N	\N
2824	349	1551	2	1	\N	\N
2825	349	1551	3	1	\N	\N
2826	349	1585	2	1	\N	\N
2827	349	1585	3	1	\N	\N
2828	349	1552	3	1	\N	\N
2829	349	1541	1	1	\N	\N
2830	349	1541	2	1	\N	\N
2831	349	1541	3	1	\N	\N
2832	349	1547	3	1	\N	\N
2833	349	1536	3	1	\N	\N
2834	349	1537	1	1	\N	\N
2835	349	1537	3	1	\N	\N
2836	349	1538	1	1	\N	\N
2837	349	1538	3	1	\N	\N
2838	349	1539	3	1	\N	\N
2839	349	1540	3	1	\N	\N
2840	349	1542	3	1	\N	\N
2841	349	1543	3	1	\N	\N
2842	349	1545	3	1	\N	\N
2843	349	1544	3	1	\N	\N
2844	349	1546	3	1	\N	\N
2845	349	1548	3	1	\N	\N
2846	349	1549	1	1	\N	\N
2847	349	1549	3	1	\N	\N
2848	349	1550	3	1	\N	\N
2849	349	1561	1	1	\N	\N
2850	349	1561	2	1	\N	\N
2851	349	1561	3	1	\N	\N
2852	349	1567	3	1	\N	\N
2853	349	1554	3	1	\N	\N
2854	349	1555	3	1	\N	\N
2855	349	1557	1	1	\N	\N
2856	349	1557	3	1	\N	\N
2857	349	1558	1	1	\N	\N
2858	349	1558	3	1	\N	\N
2859	349	1559	3	1	\N	\N
2860	349	1560	3	1	\N	\N
2861	349	1562	3	1	\N	\N
2862	349	1563	3	1	\N	\N
2863	349	1565	3	1	\N	\N
2864	349	1564	3	1	\N	\N
2865	349	1566	3	1	\N	\N
2866	349	1568	3	1	\N	\N
2867	349	1569	1	1	\N	\N
2868	349	1569	3	1	\N	\N
2869	349	1570	3	1	\N	\N
2870	349	1556	3	1	\N	\N
2871	349	1584	3	1	\N	\N
2872	349	1583	3	1	\N	\N
2873	349	1577	2	1	\N	\N
2874	349	1573	3	1	\N	\N
2875	349	1575	2	1	\N	\N
2876	349	1576	3	1	\N	\N
2877	349	1578	3	1	\N	\N
2878	349	1579	3	1	\N	\N
2879	349	1580	2	1	\N	\N
2880	349	1581	3	1	\N	\N
2881	349	1574	3	1	\N	\N
2882	350	1586	1	1	\N	\N
2883	350	1586	2	1	\N	\N
2884	350	1588	1	1	\N	\N
2885	350	1588	2	1	\N	\N
2886	350	1587	1	1	\N	\N
2887	350	1587	2	1	\N	\N
2888	350	1589	1	1	\N	\N
2889	350	1589	2	1	\N	\N
2890	351	1633	1	1	\N	\N
2891	351	1633	1	2	0	\N
2892	351	1612	1	1	\N	\N
2893	351	1612	1	2	0	\N
2894	351	1612	1	3	0	\N
2895	351	1612	2	1	\N	\N
2896	351	1592	1	1	\N	\N
2897	351	1592	1	2	0	\N
2898	351	1592	2	1	\N	\N
2899	351	1615	1	1	\N	\N
2900	351	1615	1	2	0	\N
2901	351	1602	1	1	\N	\N
2902	351	1609	1	1	\N	\N
2903	351	1590	1	1	\N	\N
2904	351	1590	1	2	0	\N
2905	351	1605	1	1	\N	\N
2906	351	1642	1	1	\N	\N
2907	351	1642	1	2	0	\N
2908	351	1642	2	1	\N	\N
2909	351	1644	1	1	\N	\N
2910	351	1644	1	2	0	\N
2911	351	1625	1	1	\N	\N
2912	351	1625	1	2	0	\N
2913	351	1626	1	1	\N	\N
2914	351	1626	1	2	0	\N
2915	351	1632	2	1	\N	\N
2916	351	1628	2	1	\N	\N
2917	351	1646	1	1	\N	\N
2918	351	1646	2	1	\N	\N
2919	351	1613	1	1	\N	\N
2920	351	1623	1	1	\N	\N
2921	351	1607	1	1	\N	\N
2922	351	1607	1	2	0	\N
2923	351	1608	1	1	\N	\N
2924	351	1645	1	1	\N	\N
2925	351	1645	1	2	0	\N
2926	351	1611	1	1	\N	\N
2927	351	1614	1	1	\N	\N
2928	351	1620	1	1	\N	\N
2929	351	1622	1	1	\N	\N
2930	351	1621	1	1	\N	\N
2931	351	1596	1	1	\N	\N
2932	351	1634	1	1	\N	\N
2933	351	1641	1	1	\N	\N
2934	351	1640	1	1	\N	\N
2935	351	1593	1	1	\N	\N
2936	351	1594	1	1	\N	\N
2937	351	1595	1	1	\N	\N
2938	351	1616	1	1	\N	\N
2939	351	1617	1	1	\N	\N
2940	351	1618	1	1	\N	\N
2941	351	1619	1	1	\N	\N
2942	351	1603	1	1	\N	\N
2943	351	1604	1	1	\N	\N
2944	351	1610	1	1	\N	\N
2945	351	1591	1	1	\N	\N
2946	351	1606	1	1	\N	\N
2947	351	1643	1	1	\N	\N
2948	351	1627	1	1	\N	\N
2949	351	1629	2	1	\N	\N
2950	351	1630	2	1	\N	\N
2951	351	1631	2	1	\N	\N
2952	351	1647	1	1	\N	\N
2953	351	1648	1	1	\N	\N
2954	351	1649	1	1	\N	\N
2955	351	1650	1	1	\N	\N
2956	351	1624	1	1	\N	\N
2957	351	1597	1	1	\N	\N
2958	351	1598	1	1	\N	\N
2959	351	1599	1	1	\N	\N
2960	351	1600	1	1	\N	\N
2961	351	1601	1	1	\N	\N
2962	351	1635	1	1	\N	\N
2963	351	1636	1	1	\N	\N
2964	351	1637	1	1	\N	\N
2965	351	1638	1	1	\N	\N
2966	351	1639	1	1	\N	\N
2967	352	1696	1	1	\N	\N
2968	352	1696	1	2	0	\N
2969	352	1696	2	1	\N	\N
2970	352	1696	3	1	\N	\N
2971	352	1696	3	2	0	\N
2972	352	1671	1	1	\N	\N
2973	352	1671	1	2	0	\N
2974	352	1671	2	1	\N	\N
2975	352	1671	2	2	0	\N
2976	352	1671	3	1	\N	\N
2977	352	1671	3	2	0	\N
2978	352	1671	5	2	0	\N
2979	352	1671	6	2	0	\N
2980	352	1654	1	1	\N	\N
2981	352	1654	1	2	0	\N
2982	352	1654	2	1	\N	\N
2983	352	1654	3	1	\N	\N
2984	352	1654	3	2	0	\N
2985	352	1654	5	1	\N	\N
2986	352	1654	5	2	0	\N
2987	352	1654	6	1	\N	\N
2988	352	1654	6	2	0	\N
2989	352	1672	1	1	\N	\N
2990	352	1672	1	2	0	\N
2991	352	1672	2	1	\N	\N
2992	352	1672	3	1	\N	\N
2993	352	1672	3	2	0	\N
2994	352	1672	3	3	0	\N
2995	352	1672	5	1	\N	\N
2996	352	1656	1	1	\N	\N
2997	352	1656	2	1	\N	\N
2998	352	1656	3	1	\N	\N
2999	352	1656	3	3	0	\N
3000	352	1667	1	1	\N	\N
3001	352	1667	2	1	\N	\N
3002	352	1667	3	1	\N	\N
3003	352	1667	3	3	0	\N
3004	352	1651	1	1	\N	\N
3005	352	1651	1	2	0	\N
3006	352	1651	2	1	\N	\N
3007	352	1651	3	1	\N	\N
3008	352	1651	3	2	0	\N
3009	352	1651	3	3	0	\N
3010	352	1661	1	1	\N	\N
3011	352	1661	1	2	0	\N
3012	352	1661	2	1	\N	\N
3013	352	1661	3	1	\N	\N
3014	352	1661	3	2	0	\N
3015	352	1697	1	1	\N	\N
3016	352	1697	1	2	0	\N
3017	352	1697	2	1	\N	\N
3018	352	1697	3	1	\N	\N
3019	352	1697	3	2	0	\N
3020	352	1702	1	1	\N	\N
3021	352	1702	3	1	\N	\N
3022	352	1702	3	2	0	\N
3023	352	1681	1	1	\N	\N
3024	352	1681	1	2	0	\N
3025	352	1681	3	1	\N	\N
3026	352	1681	3	2	0	\N
3027	352	1682	1	1	\N	\N
3028	352	1682	1	2	0	\N
3029	352	1695	6	1	\N	\N
3030	352	1689	5	1	\N	\N
3031	352	1686	3	1	\N	\N
3032	352	1686	3	2	0	\N
3033	352	1690	2	1	\N	\N
3034	352	1683	2	1	\N	\N
3035	352	1684	2	1	\N	\N
3036	352	1684	2	2	0	\N
3037	352	1685	2	1	\N	\N
3038	352	1685	2	2	0	\N
3039	352	1704	1	1	\N	\N
3040	352	1704	2	1	\N	\N
3041	352	1704	3	1	\N	\N
3042	352	1678	1	1	\N	\N
3043	352	1678	1	2	0	\N
3044	352	1678	3	1	\N	\N
3045	352	1678	3	2	0	\N
3046	352	1665	1	1	\N	\N
3047	352	1665	1	2	0	\N
3048	352	1665	2	1	\N	\N
3049	352	1665	3	1	\N	\N
3050	352	1665	3	2	0	\N
3051	352	1666	1	1	\N	\N
3052	352	1666	2	1	\N	\N
3053	352	1666	3	1	\N	\N
3054	352	1703	1	1	\N	\N
3055	352	1703	1	2	0	\N
3056	352	1703	2	1	\N	\N
3057	352	1703	3	1	\N	\N
3058	352	1703	3	2	0	\N
3059	352	1670	1	1	\N	\N
3060	352	1670	3	1	\N	\N
3061	352	1677	1	1	\N	\N
3062	352	1677	2	1	\N	\N
3063	352	1677	3	1	\N	\N
3064	352	1655	3	1	\N	\N
3065	352	1673	3	1	\N	\N
3066	352	1674	3	1	\N	\N
3067	352	1675	3	1	\N	\N
3068	352	1676	3	1	\N	\N
3069	352	1658	3	1	\N	\N
3070	352	1659	3	1	\N	\N
3071	352	1660	3	1	\N	\N
3072	352	1657	3	1	\N	\N
3073	352	1668	3	1	\N	\N
3074	352	1669	3	1	\N	\N
3075	352	1652	3	1	\N	\N
3076	352	1653	3	1	\N	\N
3077	352	1662	3	1	\N	\N
3078	352	1663	3	1	\N	\N
3079	352	1664	3	1	\N	\N
3080	352	1698	3	1	\N	\N
3081	352	1699	3	1	\N	\N
3082	352	1700	3	1	\N	\N
3083	352	1701	3	1	\N	\N
3084	352	1688	3	1	\N	\N
3085	352	1687	3	1	\N	\N
3086	352	1691	2	1	\N	\N
3087	352	1692	2	1	\N	\N
3088	352	1693	2	1	\N	\N
3089	352	1694	2	1	\N	\N
3090	352	1705	3	1	\N	\N
3091	352	1706	3	1	\N	\N
3092	352	1707	3	1	\N	\N
3093	352	1679	3	1	\N	\N
3094	352	1680	3	1	\N	\N
3095	353	1753	1	1	\N	\N
3096	353	1753	1	2	0	\N
3097	353	1753	1	3	0	\N
3098	353	1753	5	1	\N	\N
3099	353	1733	1	1	\N	\N
3100	353	1733	1	2	0	\N
3101	353	1733	1	3	0	\N
3102	353	1733	2	1	\N	\N
3103	353	1733	2	2	0	\N
3104	353	1710	1	1	\N	\N
3105	353	1710	1	2	0	\N
3106	353	1710	2	1	\N	\N
3107	353	1710	2	2	0	\N
3108	353	1710	5	1	\N	\N
3109	353	1734	1	1	\N	\N
3110	353	1734	1	2	0	\N
3111	353	1734	1	3	0	\N
3112	353	1734	2	1	\N	\N
3113	353	1734	2	2	0	\N
3114	353	1734	2	3	0	\N
3115	353	1734	5	1	\N	\N
3116	353	1717	1	1	\N	\N
3117	353	1717	1	3	0	\N
3118	353	1717	2	1	\N	\N
3119	353	1717	5	1	\N	\N
3120	353	1727	1	1	\N	\N
3121	353	1727	1	3	0	\N
3122	353	1727	2	1	\N	\N
3123	353	1708	1	1	\N	\N
3124	353	1708	1	2	0	\N
3125	353	1708	5	1	\N	\N
3126	353	1721	1	1	\N	\N
3127	353	1721	1	2	0	\N
3128	353	1721	2	1	\N	\N
3129	353	1762	1	1	\N	\N
3130	353	1762	1	2	0	\N
3131	353	1762	2	1	\N	\N
3132	353	1765	1	1	\N	\N
3133	353	1765	1	2	0	\N
3134	353	1741	1	1	\N	\N
3135	353	1741	1	2	0	\N
3136	353	1742	1	1	\N	\N
3137	353	1742	1	2	0	\N
3138	353	1751	5	1	\N	\N
3139	353	1750	3	1	\N	\N
3140	353	1752	2	1	\N	\N
3141	353	1745	2	1	\N	\N
3142	353	1745	2	3	0	\N
3143	353	1767	1	1	\N	\N
3144	353	1767	1	3	0	\N
3145	353	1767	2	1	\N	\N
3146	353	1739	1	1	\N	\N
3147	353	1739	1	2	0	\N
3148	353	1725	1	1	\N	\N
3149	353	1725	1	2	0	\N
3150	353	1725	2	1	\N	\N
3151	353	1725	2	2	0	\N
3152	353	1726	1	1	\N	\N
3153	353	1726	2	1	\N	\N
3154	353	1766	1	1	\N	\N
3155	353	1766	1	2	0	\N
3156	353	1757	1	1	\N	\N
3157	353	1760	1	1	\N	\N
3158	353	1756	1	1	\N	\N
3159	353	1759	1	1	\N	\N
3160	353	1758	1	1	\N	\N
3161	353	1732	1	1	\N	\N
3162	353	1738	1	3	0	\N
3163	353	1715	1	1	\N	\N
3164	353	1754	1	1	\N	\N
3165	353	1724	1	2	0	\N
3166	353	1724	2	2	0	\N
3167	353	1761	1	1	\N	\N
3168	353	1711	1	1	\N	\N
3169	353	1712	1	1	\N	\N
3170	353	1713	1	1	\N	\N
3171	353	1714	1	1	\N	\N
3172	353	1735	1	1	\N	\N
3173	353	1736	1	1	\N	\N
3174	353	1737	1	1	\N	\N
3175	353	1718	1	1	\N	\N
3176	353	1719	1	1	\N	\N
3177	353	1720	1	1	\N	\N
3178	353	1728	1	1	\N	\N
3179	353	1729	1	1	\N	\N
3180	353	1730	1	1	\N	\N
3181	353	1731	1	1	\N	\N
3182	353	1709	1	1	\N	\N
3183	353	1722	1	1	\N	\N
3184	353	1723	1	1	\N	\N
3185	353	1763	1	1	\N	\N
3186	353	1764	1	1	\N	\N
3187	353	1743	1	1	\N	\N
3188	353	1744	1	1	\N	\N
3189	353	1746	2	1	\N	\N
3190	353	1747	2	1	\N	\N
3191	353	1748	2	1	\N	\N
3192	353	1749	2	1	\N	\N
3193	353	1768	1	1	\N	\N
3194	353	1769	1	1	\N	\N
3195	353	1770	1	1	\N	\N
3196	353	1771	1	1	\N	\N
3197	353	1772	1	1	\N	\N
3198	353	1740	1	1	\N	\N
3199	353	1716	1	1	\N	\N
3200	353	1755	1	1	\N	\N
3201	354	1832	1	1	\N	\N
3202	354	1832	1	2	0	\N
3203	354	1832	2	2	0	\N
3204	354	1799	1	1	\N	\N
3205	354	1799	1	2	0	\N
3206	354	1799	1	3	0	\N
3207	354	1799	2	1	\N	\N
3208	354	1799	2	2	0	\N
3209	354	1799	4	1	\N	\N
3210	354	1799	4	2	0	\N
3211	354	1799	5	1	\N	\N
3212	354	1799	5	2	0	\N
3213	354	1776	1	1	\N	\N
3214	354	1776	1	2	0	\N
3215	354	1776	1	3	0	\N
3216	354	1776	2	1	\N	\N
3217	354	1776	2	2	0	\N
3218	354	1776	2	3	0	\N
3219	354	1776	4	1	\N	\N
3220	354	1776	4	2	0	\N
3221	354	1776	5	1	\N	\N
3222	354	1776	5	2	0	\N
3223	354	1802	1	1	\N	\N
3224	354	1802	1	2	0	\N
3225	354	1802	1	3	0	\N
3226	354	1802	2	1	\N	\N
3227	354	1802	2	2	0	\N
3228	354	1778	1	1	\N	\N
3229	354	1778	1	3	0	\N
3230	354	1778	2	1	\N	\N
3231	354	1793	1	1	\N	\N
3232	354	1793	1	3	0	\N
3233	354	1793	2	1	\N	\N
3234	354	1773	1	1	\N	\N
3235	354	1773	1	2	0	\N
3236	354	1773	1	3	0	\N
3237	354	1773	2	1	\N	\N
3238	354	1785	1	1	\N	\N
3239	354	1833	1	1	\N	\N
3240	354	1833	1	2	0	\N
3241	354	1833	2	1	\N	\N
3242	354	1833	2	2	0	\N
3243	354	1840	1	1	\N	\N
3244	354	1840	1	2	0	\N
3245	354	1840	1	3	0	\N
3246	354	1815	1	1	\N	\N
3247	354	1815	1	2	0	\N
3248	354	1816	1	1	\N	\N
3249	354	1816	1	2	0	\N
3250	354	1831	4	1	\N	\N
3251	354	1824	5	1	\N	\N
3252	354	1825	2	1	\N	\N
3253	354	1820	2	1	\N	\N
3254	354	1851	1	1	\N	\N
3255	354	1844	1	1	\N	\N
3256	354	1844	1	3	0	\N
3257	354	1844	2	1	\N	\N
3258	354	1800	1	1	\N	\N
3259	354	1800	1	2	0	\N
3260	354	1800	1	3	0	\N
3261	354	1812	1	1	\N	\N
3262	354	1812	1	2	0	\N
3263	354	1791	1	1	\N	\N
3264	354	1791	1	2	0	\N
3265	354	1791	2	2	0	\N
3266	354	1792	1	1	\N	\N
3267	354	1841	1	1	\N	\N
3268	354	1841	1	2	0	\N
3269	354	1798	1	1	\N	\N
3270	354	1801	1	1	\N	\N
3271	354	1810	1	1	\N	\N
3272	354	1808	2	1	\N	\N
3273	354	1809	1	1	\N	\N
3274	354	1790	1	2	0	\N
3275	354	1811	1	1	\N	\N
3276	354	1842	1	1	\N	\N
3277	354	1842	1	2	0	\N
3278	354	1843	1	1	\N	\N
3279	354	1789	1	1	\N	\N
3280	354	1777	1	1	\N	\N
3281	354	1803	1	1	\N	\N
3282	354	1804	1	1	\N	\N
3283	354	1805	1	1	\N	\N
3284	354	1806	1	1	\N	\N
3285	354	1807	1	1	\N	\N
3286	354	1779	1	1	\N	\N
3287	354	1780	1	1	\N	\N
3288	354	1781	1	1	\N	\N
3289	354	1782	1	1	\N	\N
3290	354	1783	1	1	\N	\N
3291	354	1784	1	1	\N	\N
3292	354	1794	1	1	\N	\N
3293	354	1795	1	1	\N	\N
3294	354	1796	1	1	\N	\N
3295	354	1797	1	1	\N	\N
3296	354	1774	1	1	\N	\N
3297	354	1775	1	1	\N	\N
3298	354	1786	1	1	\N	\N
3299	354	1787	1	1	\N	\N
3300	354	1788	1	1	\N	\N
3301	354	1834	1	1	\N	\N
3302	354	1835	1	1	\N	\N
3303	354	1836	1	1	\N	\N
3304	354	1837	1	1	\N	\N
3305	354	1838	1	1	\N	\N
3306	354	1839	1	1	\N	\N
3307	354	1817	1	1	\N	\N
3308	354	1818	1	1	\N	\N
3309	354	1819	1	1	\N	\N
3310	354	1826	2	1	\N	\N
3311	354	1827	2	1	\N	\N
3312	354	1828	2	1	\N	\N
3313	354	1829	2	1	\N	\N
3314	354	1830	2	1	\N	\N
3315	354	1821	2	1	\N	\N
3316	354	1822	2	1	\N	\N
3317	354	1823	2	1	\N	\N
3318	354	1845	1	1	\N	\N
3319	354	1846	1	1	\N	\N
3320	354	1847	1	1	\N	\N
3321	354	1848	1	1	\N	\N
3322	354	1849	1	1	\N	\N
3323	354	1850	1	1	\N	\N
3324	354	1813	1	1	\N	\N
3325	354	1814	1	1	\N	\N
3326	355	1874	1	1	\N	\N
3327	355	1874	1	2	0	\N
3328	355	1874	1	3	0	\N
3329	355	1874	2	1	\N	\N
3330	355	1861	1	1	\N	\N
3331	355	1861	1	2	0	\N
3332	355	1861	2	1	\N	\N
3333	355	1861	2	2	0	\N
3334	355	1862	1	1	\N	\N
3335	355	1862	2	1	\N	\N
3336	355	1853	1	1	\N	\N
3337	355	1853	1	2	0	\N
3338	355	1853	1	3	0	\N
3339	355	1853	2	1	\N	\N
3340	355	1853	2	2	0	\N
3341	355	1853	2	3	0	\N
3342	355	1853	5	1	\N	\N
3343	355	1863	1	1	\N	\N
3344	355	1863	1	2	0	\N
3345	355	1863	1	3	0	\N
3346	355	1863	2	1	\N	\N
3347	355	1863	2	2	0	\N
3348	355	1855	1	1	\N	\N
3349	355	1855	1	3	0	\N
3350	355	1855	2	1	\N	\N
3351	355	1859	1	1	\N	\N
3352	355	1859	1	3	0	\N
3353	355	1859	2	1	\N	\N
3354	355	1852	1	1	\N	\N
3355	355	1852	1	2	0	\N
3356	355	1852	1	3	0	\N
3357	355	1852	2	1	\N	\N
3358	355	1852	2	2	0	\N
3359	355	1852	2	3	0	\N
3360	355	1856	1	1	\N	\N
3361	355	1856	1	2	0	\N
3362	355	1856	1	3	0	\N
3363	355	1856	2	1	\N	\N
3364	355	1878	1	1	\N	\N
3365	355	1878	1	2	0	\N
3366	355	1878	1	3	0	\N
3367	355	1878	2	1	\N	\N
3368	355	1878	2	2	0	\N
3369	355	1878	2	3	0	\N
3370	355	1879	1	1	\N	\N
3371	355	1879	1	2	0	\N
3372	355	1868	1	1	\N	\N
3373	355	1868	1	2	0	\N
3374	355	1869	1	1	\N	\N
3375	355	1872	5	1	\N	\N
3376	355	1871	2	1	\N	\N
3377	355	1873	2	1	\N	\N
3378	355	1870	2	1	\N	\N
3379	355	1882	1	1	\N	\N
3380	355	1881	1	1	\N	\N
3381	355	1881	2	1	\N	\N
3382	355	1854	1	1	\N	\N
3383	355	1854	2	1	\N	\N
3384	355	1867	1	1	\N	\N
3385	355	1867	2	1	\N	\N
3386	355	1857	1	1	\N	\N
3387	355	1857	1	2	0	\N
3388	355	1858	1	1	\N	\N
3389	355	1880	1	1	\N	\N
3390	355	1880	1	2	0	\N
3391	355	1880	2	2	0	\N
3392	355	1876	1	1	\N	\N
3393	355	1875	1	1	\N	\N
3394	355	1875	2	1	\N	\N
3395	355	1860	1	1	\N	\N
3396	355	1864	1	1	\N	\N
3397	355	1864	1	3	0	\N
3398	355	1864	2	1	\N	\N
3399	355	1864	2	3	0	\N
3400	355	1866	1	1	\N	\N
3401	355	1866	1	3	0	\N
3402	355	1866	2	1	\N	\N
3403	355	1865	1	1	\N	\N
3404	355	1865	1	3	0	\N
3405	355	1865	2	1	\N	\N
3406	355	1877	1	1	\N	\N
3407	355	1877	1	2	0	\N
3408	355	1877	2	1	\N	\N
3409	355	1877	2	2	0	\N
3410	356	1916	1	1	\N	\N
3411	356	1916	1	2	0	\N
3412	356	1897	1	1	\N	\N
3413	356	1897	1	2	0	\N
3414	356	1898	1	1	\N	\N
3415	356	1884	1	1	\N	\N
3416	356	1884	1	2	0	\N
3417	356	1884	2	1	\N	\N
3418	356	1884	2	2	0	\N
3419	356	1900	1	1	\N	\N
3420	356	1900	1	2	0	\N
3421	356	1900	2	1	\N	\N
3422	356	1887	1	1	\N	\N
3423	356	1887	2	1	\N	\N
3424	356	1895	1	1	\N	\N
3425	356	1895	2	1	\N	\N
3426	356	1883	1	1	\N	\N
3427	356	1883	1	2	0	\N
3428	356	1883	2	1	\N	\N
3429	356	1890	1	1	\N	\N
3430	356	1890	2	1	\N	\N
3431	356	1918	1	1	\N	\N
3432	356	1918	1	2	0	\N
3433	356	1918	2	1	\N	\N
3434	356	1920	1	1	\N	\N
3435	356	1920	1	2	0	\N
3436	356	1909	1	1	\N	\N
3437	356	1909	1	2	0	\N
3438	356	1910	1	1	\N	\N
3439	356	1910	1	2	0	\N
3440	356	1915	2	1	\N	\N
3441	356	1912	2	1	\N	\N
3442	356	1922	1	1	\N	\N
3443	356	1922	2	1	\N	\N
3444	356	1907	1	1	\N	\N
3445	356	1893	1	1	\N	\N
3446	356	1893	1	2	0	\N
3447	356	1894	1	1	\N	\N
3448	356	1921	1	1	\N	\N
3449	356	1921	1	2	0	\N
3450	356	1896	1	1	\N	\N
3451	356	1899	1	1	\N	\N
3452	356	1904	1	1	\N	\N
3453	356	1906	1	1	\N	\N
3454	356	1905	1	1	\N	\N
3455	356	1917	1	1	\N	\N
3456	356	1885	1	1	\N	\N
3457	356	1886	1	1	\N	\N
3458	356	1901	1	1	\N	\N
3459	356	1902	1	1	\N	\N
3460	356	1903	1	1	\N	\N
3461	356	1888	1	1	\N	\N
3462	356	1889	1	1	\N	\N
3463	356	1891	1	1	\N	\N
3464	356	1892	1	1	\N	\N
3465	356	1919	1	1	\N	\N
3466	356	1911	1	1	\N	\N
3467	356	1913	2	1	\N	\N
3468	356	1914	2	1	\N	\N
3469	356	1923	1	1	\N	\N
3470	356	1924	1	1	\N	\N
3471	356	1908	1	1	\N	\N
3472	357	1970	1	1	\N	\N
3473	357	1944	1	1	\N	\N
3474	357	1944	1	2	0	\N
3475	357	1944	1	3	0	\N
3476	357	1945	1	1	\N	\N
3477	357	1930	1	1	\N	\N
3478	357	1930	1	2	0	\N
3479	357	1930	2	1	\N	\N
3480	357	1930	4	1	\N	\N
3481	357	1947	1	1	\N	\N
3482	357	1947	1	2	0	\N
3483	357	1935	1	1	\N	\N
3484	357	1925	1	1	\N	\N
3485	357	1936	1	1	\N	\N
3486	357	1971	1	1	\N	\N
3487	357	1977	1	1	\N	\N
3488	357	1977	1	2	0	\N
3489	357	1958	1	1	\N	\N
3490	357	1958	1	2	0	\N
3491	357	1959	1	1	\N	\N
3492	357	1963	2	1	\N	\N
3493	357	1987	1	1	\N	\N
3494	357	1979	1	1	\N	\N
3495	357	1954	1	1	\N	\N
3496	357	1942	1	1	\N	\N
3497	357	1942	1	2	0	\N
3498	357	1943	1	1	\N	\N
3499	357	1978	1	1	\N	\N
3500	357	1978	1	2	0	\N
3501	357	1946	1	1	\N	\N
3502	357	1932	1	1	\N	\N
3503	357	1933	1	1	\N	\N
3504	357	1934	1	1	\N	\N
3505	357	1931	1	1	\N	\N
3506	357	1949	1	1	\N	\N
3507	357	1950	1	1	\N	\N
3508	357	1951	1	1	\N	\N
3509	357	1952	1	1	\N	\N
3510	357	1953	1	1	\N	\N
3511	357	1948	1	1	\N	\N
3512	357	1927	1	1	\N	\N
3513	357	1928	1	1	\N	\N
3514	357	1929	1	1	\N	\N
3515	357	1926	1	1	\N	\N
3516	357	1938	1	1	\N	\N
3517	357	1939	1	1	\N	\N
3518	357	1940	1	1	\N	\N
3519	357	1941	1	1	\N	\N
3520	357	1937	1	1	\N	\N
3521	357	1973	1	1	\N	\N
3522	357	1974	1	1	\N	\N
3523	357	1975	1	1	\N	\N
3524	357	1976	1	1	\N	\N
3525	357	1972	1	1	\N	\N
3526	357	1960	1	1	\N	\N
3527	357	1961	1	1	\N	\N
3528	357	1962	1	1	\N	\N
3529	357	1964	2	1	\N	\N
3530	357	1965	2	1	\N	\N
3531	357	1966	2	1	\N	\N
3532	357	1967	2	1	\N	\N
3533	357	1968	2	1	\N	\N
3534	357	1969	2	1	\N	\N
3535	357	1980	1	1	\N	\N
3536	357	1981	1	1	\N	\N
3537	357	1982	1	1	\N	\N
3538	357	1983	1	1	\N	\N
3539	357	1984	1	1	\N	\N
3540	357	1985	1	1	\N	\N
3541	357	1986	1	1	\N	\N
3542	357	1955	1	1	\N	\N
3543	357	1956	1	1	\N	\N
3544	357	1957	1	1	\N	\N
3545	358	1995	1	1	\N	\N
3546	358	1992	1	1	\N	\N
3547	358	1996	1	1	\N	\N
3548	358	1994	1	1	\N	\N
3549	358	1990	1	1	\N	\N
3550	358	1997	1	1	\N	\N
3551	358	1998	2	1	\N	\N
3552	358	1999	1	1	\N	\N
3553	358	1993	1	1	\N	\N
3554	358	1989	1	1	\N	\N
3555	358	1991	1	1	\N	\N
3556	358	1988	1	1	\N	\N
3557	360	2003	1	1	\N	\N
3558	360	2003	1	2	0	\N
3559	360	2003	2	1	\N	\N
3560	360	2005	1	1	\N	\N
3561	360	2004	1	1	\N	\N
3562	360	2006	1	1	\N	\N
3563	360	2002	1	1	\N	\N
3564	360	2002	1	2	0	\N
3565	360	2007	1	1	\N	\N
3566	360	2007	1	2	0	\N
3567	360	2001	1	1	\N	\N
3568	360	2001	1	2	0	\N
3569	360	2009	1	2	0	\N
3570	360	2008	1	1	\N	\N
3571	360	2000	1	1	\N	\N
3572	361	2085	1	1	\N	\N
3573	361	2085	2	1	\N	\N
3574	361	2010	1	1	\N	\N
3575	361	2010	2	1	\N	\N
3576	361	2049	1	1	\N	\N
3577	361	2049	2	1	\N	\N
3578	361	2086	1	1	\N	\N
3579	361	2086	2	1	\N	\N
3580	361	2047	1	1	\N	\N
3581	361	2047	2	1	\N	\N
3582	361	2084	1	1	\N	\N
3583	361	2084	2	1	\N	\N
3584	361	2108	1	1	\N	\N
3585	361	2048	1	1	\N	\N
3586	361	2011	1	1	\N	\N
3587	361	2011	2	1	\N	\N
3588	361	2045	1	1	\N	\N
3589	361	2045	2	1	\N	\N
3590	361	2025	1	1	\N	\N
3591	361	2025	2	1	\N	\N
3592	361	2031	1	1	\N	\N
3593	361	2031	2	1	\N	\N
3594	361	2036	1	1	\N	\N
3595	361	2036	2	1	\N	\N
3596	361	2012	1	1	\N	\N
3597	361	2013	1	1	\N	\N
3598	361	2013	2	1	\N	\N
3599	361	2014	1	1	\N	\N
3600	361	2018	1	1	\N	\N
3601	361	2022	1	1	\N	\N
3602	361	2023	1	1	\N	\N
3603	361	2026	1	1	\N	\N
3604	361	2029	1	1	\N	\N
3605	361	2030	1	1	\N	\N
3606	361	2032	1	1	\N	\N
3607	361	2038	1	1	\N	\N
3608	361	2042	1	1	\N	\N
3609	361	2042	2	1	\N	\N
3610	361	2044	1	1	\N	\N
3611	361	2024	1	1	\N	\N
3612	361	2043	1	1	\N	\N
3613	361	2015	1	1	\N	\N
3614	361	2017	1	1	\N	\N
3615	361	2019	1	1	\N	\N
3616	361	2020	1	1	\N	\N
3617	361	2021	1	1	\N	\N
3618	361	2028	1	1	\N	\N
3619	361	2027	1	1	\N	\N
3620	361	2035	1	1	\N	\N
3621	361	2037	1	1	\N	\N
3622	361	2039	1	1	\N	\N
3623	361	2040	1	1	\N	\N
3624	361	2041	1	1	\N	\N
3625	361	2046	1	1	\N	\N
3626	361	2033	1	1	\N	\N
3627	361	2016	1	1	\N	\N
3628	361	2034	1	1	\N	\N
3629	361	2050	1	1	\N	\N
3630	361	2050	2	1	\N	\N
3631	361	2082	1	1	\N	\N
3632	361	2066	1	1	\N	\N
3633	361	2059	1	1	\N	\N
3634	361	2064	1	1	\N	\N
3635	361	2064	2	1	\N	\N
3636	361	2071	1	1	\N	\N
3637	361	2076	1	1	\N	\N
3638	361	2076	2	1	\N	\N
3639	361	2051	1	1	\N	\N
3640	361	2052	1	1	\N	\N
3641	361	2053	1	1	\N	\N
3642	361	2056	1	1	\N	\N
3643	361	2062	1	1	\N	\N
3644	361	2063	1	1	\N	\N
3645	361	2065	1	1	\N	\N
3646	361	2069	1	1	\N	\N
3647	361	2070	1	1	\N	\N
3648	361	2072	1	1	\N	\N
3649	361	2078	1	1	\N	\N
3650	361	2080	1	1	\N	\N
3651	361	2081	1	1	\N	\N
3652	361	2055	1	1	\N	\N
3653	361	2057	1	1	\N	\N
3654	361	2058	1	1	\N	\N
3655	361	2060	1	1	\N	\N
3656	361	2061	1	1	\N	\N
3657	361	2068	1	1	\N	\N
3658	361	2067	1	1	\N	\N
3659	361	2075	1	1	\N	\N
3660	361	2077	1	1	\N	\N
3661	361	2079	1	1	\N	\N
3662	361	2083	1	1	\N	\N
3663	361	2073	1	1	\N	\N
3664	361	2054	1	1	\N	\N
3665	361	2074	1	1	\N	\N
3666	361	2074	2	1	\N	\N
3667	361	2107	2	1	\N	\N
3668	361	2087	2	1	\N	\N
3669	361	2088	2	1	\N	\N
3670	361	2089	1	1	\N	\N
3671	361	2092	2	1	\N	\N
3672	361	2094	1	1	\N	\N
3673	361	2096	2	1	\N	\N
3674	361	2098	2	1	\N	\N
3675	361	2101	1	1	\N	\N
3676	361	2104	1	1	\N	\N
3677	361	2106	1	1	\N	\N
3678	361	2095	1	1	\N	\N
3679	361	2097	2	1	\N	\N
3680	361	2103	1	1	\N	\N
3681	361	2105	1	1	\N	\N
3682	361	2091	1	1	\N	\N
3683	361	2093	1	1	\N	\N
3684	361	2102	1	1	\N	\N
3685	361	2099	1	1	\N	\N
3686	361	2090	1	1	\N	\N
3687	361	2100	2	1	\N	\N
3688	362	2147	1	1	\N	\N
3689	362	2147	2	1	\N	\N
3690	362	2109	1	1	\N	\N
3691	362	2109	2	1	\N	\N
3692	362	2133	1	1	\N	\N
3693	362	2133	2	1	\N	\N
3694	362	2161	1	1	\N	\N
3695	362	2161	2	1	\N	\N
3696	362	2148	1	1	\N	\N
3697	362	2148	2	1	\N	\N
3698	362	2131	1	1	\N	\N
3699	362	2131	2	1	\N	\N
3700	362	2171	1	1	\N	\N
3701	362	2171	2	1	\N	\N
3702	362	2132	1	1	\N	\N
3703	362	2132	2	1	\N	\N
3704	362	2110	1	1	\N	\N
3705	362	2110	2	1	\N	\N
3706	362	2116	1	1	\N	\N
3707	362	2116	2	1	\N	\N
3708	362	2130	1	1	\N	\N
3709	362	2130	2	1	\N	\N
3710	362	2113	1	1	\N	\N
3711	362	2111	1	1	\N	\N
3712	362	2111	2	1	\N	\N
3713	362	2112	1	1	\N	\N
3714	362	2112	2	1	\N	\N
3715	362	2114	1	1	\N	\N
3716	362	2117	1	1	\N	\N
3717	362	2121	1	1	\N	\N
3718	362	2122	1	1	\N	\N
3719	362	2124	1	1	\N	\N
3720	362	2125	1	1	\N	\N
3721	362	2126	1	1	\N	\N
3722	362	2127	1	1	\N	\N
3723	362	2128	1	1	\N	\N
3724	362	2115	1	1	\N	\N
3725	362	2118	1	1	\N	\N
3726	362	2119	1	1	\N	\N
3727	362	2120	1	1	\N	\N
3728	362	2123	1	1	\N	\N
3729	362	2129	1	1	\N	\N
3730	362	2134	1	1	\N	\N
3731	362	2134	2	1	\N	\N
3732	362	2138	1	1	\N	\N
3733	362	2138	2	1	\N	\N
3734	362	2135	1	1	\N	\N
3735	362	2136	1	1	\N	\N
3736	362	2136	2	1	\N	\N
3737	362	2137	1	1	\N	\N
3738	362	2139	1	1	\N	\N
3739	362	2140	1	1	\N	\N
3740	362	2141	1	1	\N	\N
3741	362	2142	1	1	\N	\N
3742	362	2143	1	1	\N	\N
3743	362	2144	1	1	\N	\N
3744	362	2145	1	1	\N	\N
3745	362	2146	1	1	\N	\N
3746	362	2162	1	1	\N	\N
3747	362	2162	2	1	\N	\N
3748	362	2167	1	1	\N	\N
3749	362	2167	2	1	\N	\N
3750	362	2163	1	1	\N	\N
3751	362	2164	1	1	\N	\N
3752	362	2166	1	1	\N	\N
3753	362	2169	1	1	\N	\N
3754	362	2165	1	1	\N	\N
3755	362	2168	1	1	\N	\N
3756	362	2170	1	1	\N	\N
3757	362	2149	1	1	\N	\N
3758	362	2149	2	1	\N	\N
3759	362	2154	1	1	\N	\N
3760	362	2154	2	1	\N	\N
3761	362	2150	1	1	\N	\N
3762	362	2151	1	1	\N	\N
3763	362	2153	2	1	\N	\N
3764	362	2156	1	1	\N	\N
3765	362	2158	1	1	\N	\N
3766	362	2159	1	1	\N	\N
3767	362	2160	1	1	\N	\N
3768	362	2152	1	1	\N	\N
3769	362	2155	1	1	\N	\N
3770	362	2157	1	1	\N	\N
3771	363	2242	1	1	\N	\N
3772	363	2242	2	1	\N	\N
3773	363	2172	1	1	\N	\N
3774	363	2172	2	1	\N	\N
3775	363	2204	1	1	\N	\N
3776	363	2204	2	1	\N	\N
3777	363	2247	1	1	\N	\N
3778	363	2247	2	1	\N	\N
3779	363	2243	1	1	\N	\N
3780	363	2202	1	1	\N	\N
3781	363	2202	2	1	\N	\N
3782	363	2248	1	1	\N	\N
3783	363	2203	1	1	\N	\N
3784	363	2194	1	1	\N	\N
3785	363	2194	2	1	\N	\N
3786	363	2180	1	1	\N	\N
3787	363	2196	1	1	\N	\N
3788	363	2196	2	1	\N	\N
3789	363	2174	1	1	\N	\N
3790	363	2175	1	1	\N	\N
3791	363	2176	1	1	\N	\N
3792	363	2179	1	1	\N	\N
3793	363	2182	1	1	\N	\N
3794	363	2183	1	1	\N	\N
3795	363	2185	1	1	\N	\N
3796	363	2187	1	1	\N	\N
3797	363	2193	1	1	\N	\N
3798	363	2195	1	1	\N	\N
3799	363	2201	1	1	\N	\N
3800	363	2173	1	1	\N	\N
3801	363	2177	1	1	\N	\N
3802	363	2178	1	1	\N	\N
3803	363	2181	1	1	\N	\N
3804	363	2186	1	1	\N	\N
3805	363	2188	1	1	\N	\N
3806	363	2189	1	1	\N	\N
3807	363	2190	1	1	\N	\N
3808	363	2191	1	1	\N	\N
3809	363	2192	1	1	\N	\N
3810	363	2197	1	1	\N	\N
3811	363	2199	1	1	\N	\N
3812	363	2200	1	1	\N	\N
3813	363	2198	1	1	\N	\N
3814	363	2198	2	1	\N	\N
3815	363	2184	1	1	\N	\N
3816	363	2237	1	1	\N	\N
3817	363	2237	2	1	\N	\N
3818	363	2229	1	1	\N	\N
3819	363	2220	1	1	\N	\N
3820	363	2220	2	1	\N	\N
3821	363	2241	1	1	\N	\N
3822	363	2234	1	1	\N	\N
3823	363	2234	2	1	\N	\N
3824	363	2208	1	1	\N	\N
3825	363	2207	1	1	\N	\N
3826	363	2224	1	1	\N	\N
3827	363	2232	1	1	\N	\N
3828	363	2206	1	1	\N	\N
3829	363	2209	1	1	\N	\N
3830	363	2212	1	1	\N	\N
3831	363	2214	1	1	\N	\N
3832	363	2215	1	1	\N	\N
3833	363	2217	1	1	\N	\N
3834	363	2221	1	1	\N	\N
3835	363	2228	1	1	\N	\N
3836	363	2230	1	1	\N	\N
3837	363	2230	2	1	\N	\N
3838	363	2236	1	1	\N	\N
3839	363	2236	2	1	\N	\N
3840	363	2240	1	1	\N	\N
3841	363	2211	1	1	\N	\N
3842	363	2219	1	1	\N	\N
3843	363	2223	1	1	\N	\N
3844	363	2231	1	1	\N	\N
3845	363	2239	1	1	\N	\N
3846	363	2210	1	1	\N	\N
3847	363	2213	1	1	\N	\N
3848	363	2218	1	1	\N	\N
3849	363	2222	1	1	\N	\N
3850	363	2225	1	1	\N	\N
3851	363	2226	1	1	\N	\N
3852	363	2227	1	1	\N	\N
3853	363	2233	1	1	\N	\N
3854	363	2238	1	1	\N	\N
3855	363	2235	1	1	\N	\N
3856	363	2235	2	1	\N	\N
3857	363	2205	1	1	\N	\N
3858	363	2216	1	1	\N	\N
3859	363	2244	1	1	\N	\N
3860	363	2245	1	1	\N	\N
3861	363	2246	1	1	\N	\N
3862	364	2314	1	1	\N	\N
3863	364	2314	2	1	\N	\N
3864	364	2249	1	1	\N	\N
3865	364	2317	1	1	\N	\N
3866	364	2317	2	1	\N	\N
3867	364	2250	1	1	\N	\N
3868	364	2250	2	1	\N	\N
3869	364	2316	1	1	\N	\N
3870	364	2316	2	1	\N	\N
3871	364	2341	1	1	\N	\N
3872	364	2341	2	1	\N	\N
3873	364	2318	1	1	\N	\N
3874	364	2318	2	1	\N	\N
3875	364	2313	1	1	\N	\N
3876	364	2313	2	1	\N	\N
3877	364	2374	1	1	\N	\N
3878	364	2315	1	1	\N	\N
3879	364	2315	2	1	\N	\N
3880	364	2301	1	1	\N	\N
3881	364	2301	2	1	\N	\N
3882	364	2281	1	1	\N	\N
3883	364	2281	2	1	\N	\N
3884	364	2278	1	1	\N	\N
3885	364	2274	1	1	\N	\N
3886	364	2290	1	1	\N	\N
3887	364	2299	1	1	\N	\N
3888	364	2288	1	1	\N	\N
3889	364	2288	2	1	\N	\N
3890	364	2268	1	1	\N	\N
3891	364	2268	2	1	\N	\N
3892	364	2265	1	1	\N	\N
3893	364	2297	1	1	\N	\N
3894	364	2308	1	1	\N	\N
3895	364	2257	1	1	\N	\N
3896	364	2258	1	1	\N	\N
3897	364	2272	1	1	\N	\N
3898	364	2275	1	1	\N	\N
3899	364	2279	1	1	\N	\N
3900	364	2280	1	1	\N	\N
3901	364	2286	1	1	\N	\N
3902	364	2286	2	1	\N	\N
3903	364	2300	1	1	\N	\N
3904	364	2303	1	1	\N	\N
3905	364	2304	1	1	\N	\N
3906	364	2307	1	1	\N	\N
3907	364	2307	2	1	\N	\N
3908	364	2253	1	1	\N	\N
3909	364	2254	1	1	\N	\N
3910	364	2259	1	1	\N	\N
3911	364	2262	1	1	\N	\N
3912	364	2283	1	1	\N	\N
3913	364	2282	1	1	\N	\N
3914	364	2292	1	1	\N	\N
3915	364	2293	1	1	\N	\N
3916	364	2302	1	1	\N	\N
3917	364	2309	1	1	\N	\N
3918	364	2267	1	1	\N	\N
3919	364	2256	1	1	\N	\N
3920	364	2260	1	1	\N	\N
3921	364	2269	1	1	\N	\N
3922	364	2270	1	1	\N	\N
3923	364	2271	1	1	\N	\N
3924	364	2287	1	1	\N	\N
3925	364	2289	1	1	\N	\N
3926	364	2251	1	1	\N	\N
3927	364	2252	1	1	\N	\N
3928	364	2261	1	1	\N	\N
3929	364	2263	1	1	\N	\N
3930	364	2264	1	1	\N	\N
3931	364	2264	2	1	\N	\N
3932	364	2296	1	1	\N	\N
3933	364	2276	1	1	\N	\N
3934	364	2285	1	1	\N	\N
3935	364	2306	1	1	\N	\N
3936	364	2310	1	1	\N	\N
3937	364	2311	1	1	\N	\N
3938	364	2312	1	1	\N	\N
3939	364	2255	1	1	\N	\N
3940	364	2266	1	1	\N	\N
3941	364	2277	1	1	\N	\N
3942	364	2284	1	1	\N	\N
3943	364	2294	1	1	\N	\N
3944	364	2295	1	1	\N	\N
3945	364	2298	1	1	\N	\N
3946	364	2298	2	1	\N	\N
3947	364	2305	1	1	\N	\N
3948	364	2305	2	1	\N	\N
3949	364	2291	1	1	\N	\N
3950	364	2273	1	1	\N	\N
3951	364	2367	1	1	\N	\N
3952	364	2367	2	1	\N	\N
3953	364	2365	1	1	\N	\N
3954	364	2365	2	1	\N	\N
3955	364	2351	1	1	\N	\N
3956	364	2342	1	1	\N	\N
3957	364	2345	1	1	\N	\N
3958	364	2346	1	1	\N	\N
3959	364	2350	1	1	\N	\N
3960	364	2354	1	1	\N	\N
3961	364	2356	1	1	\N	\N
3962	364	2359	1	1	\N	\N
3963	364	2360	1	1	\N	\N
3964	364	2361	1	1	\N	\N
3965	364	2362	1	1	\N	\N
3966	364	2363	1	1	\N	\N
3967	364	2366	1	1	\N	\N
3968	364	2368	1	1	\N	\N
3969	364	2344	1	1	\N	\N
3970	364	2347	1	1	\N	\N
3971	364	2348	1	1	\N	\N
3972	364	2349	1	1	\N	\N
3973	364	2352	1	1	\N	\N
3974	364	2357	1	1	\N	\N
3975	364	2369	1	1	\N	\N
3976	364	2371	1	1	\N	\N
3977	364	2372	1	1	\N	\N
3978	364	2373	1	1	\N	\N
3979	364	2353	1	1	\N	\N
3980	364	2364	1	1	\N	\N
3981	364	2355	1	1	\N	\N
3982	364	2358	1	1	\N	\N
3983	364	2370	1	1	\N	\N
3984	364	2343	1	1	\N	\N
3985	364	2336	1	1	\N	\N
3986	364	2326	1	1	\N	\N
3987	364	2320	1	1	\N	\N
3988	364	2324	1	1	\N	\N
3989	364	2330	1	1	\N	\N
3990	364	2335	1	1	\N	\N
3991	364	2322	1	1	\N	\N
3992	364	2327	1	1	\N	\N
3993	364	2337	1	1	\N	\N
3994	364	2338	1	1	\N	\N
3995	364	2340	1	1	\N	\N
3996	364	2321	1	1	\N	\N
3997	364	2333	1	1	\N	\N
3998	364	2319	1	1	\N	\N
3999	364	2323	1	1	\N	\N
4000	364	2325	1	1	\N	\N
4001	364	2328	1	1	\N	\N
4002	364	2329	1	1	\N	\N
4003	364	2332	1	1	\N	\N
4004	364	2334	1	1	\N	\N
4005	364	2339	1	1	\N	\N
4006	364	2331	1	1	\N	\N
4007	365	2376	1	1	\N	\N
4008	365	2376	1	2	0	\N
4009	365	2376	1	3	0	\N
4010	365	2376	2	1	\N	\N
4011	365	2376	2	2	0	\N
4012	365	2375	1	1	\N	\N
4013	365	2375	1	2	0	\N
4014	365	2375	1	3	0	\N
4015	365	2375	2	1	\N	\N
4016	365	2375	2	2	0	\N
4017	365	2380	1	1	\N	\N
4018	365	2380	1	2	0	\N
4019	365	2380	1	3	0	\N
4020	365	2380	2	1	\N	\N
4021	365	2380	2	2	0	\N
4022	365	2381	1	1	\N	\N
4023	365	2381	1	2	0	\N
4024	365	2381	1	3	0	\N
4025	365	2381	2	1	\N	\N
4026	365	2381	2	2	0	\N
4027	365	2379	1	1	\N	\N
4028	365	2379	1	2	0	\N
4029	365	2379	1	3	0	\N
4030	365	2379	2	1	\N	\N
4031	365	2379	2	2	0	\N
4032	365	2378	1	1	\N	\N
4033	365	2378	1	2	0	\N
4034	365	2378	1	3	0	\N
4035	365	2378	2	1	\N	\N
4036	365	2378	2	2	0	\N
4037	365	2377	1	1	\N	\N
4038	365	2377	1	2	0	\N
4039	365	2377	1	3	0	\N
4040	365	2377	2	1	\N	\N
4041	365	2377	2	2	0	\N
4042	366	2383	1	1	\N	\N
4043	366	2383	2	1	\N	\N
4044	366	2382	1	1	\N	\N
4045	366	2382	2	1	\N	\N
4046	366	2384	1	1	\N	\N
4047	367	2385	1	1	\N	\N
4048	367	2385	2	1	\N	\N
4049	367	2396	1	1	\N	\N
4050	367	2396	2	1	\N	\N
4051	367	2428	1	1	\N	\N
4052	367	2428	2	1	\N	\N
4053	367	2442	1	1	\N	\N
4054	367	2395	1	1	\N	\N
4055	367	2395	2	1	\N	\N
4056	367	2392	1	1	\N	\N
4057	367	2392	2	1	\N	\N
4058	367	2387	1	1	\N	\N
4059	367	2388	1	1	\N	\N
4060	367	2390	1	1	\N	\N
4061	367	2391	1	1	\N	\N
4062	367	2386	1	1	\N	\N
4063	367	2386	2	1	\N	\N
4064	367	2389	1	1	\N	\N
4065	367	2393	1	1	\N	\N
4066	367	2393	2	1	\N	\N
4067	367	2394	1	1	\N	\N
4068	367	2394	2	1	\N	\N
4069	367	2422	1	1	\N	\N
4070	367	2422	2	1	\N	\N
4071	367	2405	1	1	\N	\N
4072	367	2405	2	1	\N	\N
4073	367	2420	1	1	\N	\N
4074	367	2424	1	1	\N	\N
4075	367	2397	1	1	\N	\N
4076	367	2397	2	1	\N	\N
4077	367	2398	1	1	\N	\N
4078	367	2398	2	1	\N	\N
4079	367	2404	1	1	\N	\N
4080	367	2404	2	1	\N	\N
4081	367	2410	1	1	\N	\N
4082	367	2412	1	1	\N	\N
4083	367	2412	2	1	\N	\N
4084	367	2402	1	1	\N	\N
4085	367	2406	1	1	\N	\N
4086	367	2407	1	1	\N	\N
4087	367	2413	1	1	\N	\N
4088	367	2419	1	1	\N	\N
4089	367	2421	1	1	\N	\N
4090	367	2399	1	1	\N	\N
4091	367	2400	1	1	\N	\N
4092	367	2401	1	1	\N	\N
4093	367	2403	1	1	\N	\N
4094	367	2411	1	1	\N	\N
4095	367	2414	1	1	\N	\N
4096	367	2409	1	1	\N	\N
4097	367	2415	1	1	\N	\N
4098	367	2416	1	1	\N	\N
4099	367	2417	1	1	\N	\N
4100	367	2418	1	1	\N	\N
4101	367	2423	1	1	\N	\N
4102	367	2425	1	1	\N	\N
4103	367	2426	1	1	\N	\N
4104	367	2427	1	1	\N	\N
4105	367	2408	1	1	\N	\N
4106	367	2436	1	1	\N	\N
4107	367	2429	1	1	\N	\N
4108	367	2434	1	1	\N	\N
4109	367	2437	1	1	\N	\N
4110	367	2430	1	1	\N	\N
4111	367	2431	1	1	\N	\N
4112	367	2432	1	1	\N	\N
4113	367	2433	1	1	\N	\N
4114	367	2435	1	1	\N	\N
4115	367	2438	1	1	\N	\N
4116	367	2439	1	1	\N	\N
4117	367	2440	1	1	\N	\N
4118	367	2441	1	1	\N	\N
4119	368	2443	1	1	\N	\N
4120	368	2443	2	1	\N	\N
4121	368	2474	1	1	\N	\N
4122	368	2474	2	1	\N	\N
4123	368	2490	1	1	\N	\N
4124	368	2470	1	1	\N	\N
4125	368	2444	1	1	\N	\N
4126	368	2447	1	1	\N	\N
4127	368	2447	2	1	\N	\N
4128	368	2450	1	1	\N	\N
4129	368	2450	2	1	\N	\N
4130	368	2452	1	1	\N	\N
4131	368	2459	1	1	\N	\N
4132	368	2461	1	1	\N	\N
4133	368	2464	1	1	\N	\N
4134	368	2465	1	1	\N	\N
4135	368	2465	2	1	\N	\N
4136	368	2466	1	1	\N	\N
4137	368	2468	1	1	\N	\N
4138	368	2468	2	1	\N	\N
4139	368	2469	1	1	\N	\N
4140	368	2469	2	1	\N	\N
4141	368	2471	1	1	\N	\N
4142	368	2472	1	1	\N	\N
4143	368	2472	2	1	\N	\N
4144	368	2448	1	1	\N	\N
4145	368	2449	1	1	\N	\N
4146	368	2451	1	1	\N	\N
4147	368	2453	1	1	\N	\N
4148	368	2454	1	1	\N	\N
4149	368	2455	1	1	\N	\N
4150	368	2457	1	1	\N	\N
4151	368	2458	1	1	\N	\N
4152	368	2460	1	1	\N	\N
4153	368	2462	1	1	\N	\N
4154	368	2463	1	1	\N	\N
4155	368	2467	1	1	\N	\N
4156	368	2467	2	1	\N	\N
4157	368	2473	1	1	\N	\N
4158	368	2445	1	1	\N	\N
4159	368	2456	1	1	\N	\N
4160	368	2446	1	1	\N	\N
4161	368	2487	1	1	\N	\N
4162	368	2487	2	1	\N	\N
4163	368	2475	1	1	\N	\N
4164	368	2477	1	1	\N	\N
4165	368	2478	1	1	\N	\N
4166	368	2478	2	1	\N	\N
4167	368	2479	1	1	\N	\N
4168	368	2480	1	1	\N	\N
4169	368	2481	1	1	\N	\N
4170	368	2482	1	1	\N	\N
4171	368	2483	1	1	\N	\N
4172	368	2484	1	1	\N	\N
4173	368	2485	1	1	\N	\N
4174	368	2486	1	1	\N	\N
4175	368	2488	1	1	\N	\N
4176	368	2489	1	1	\N	\N
4177	368	2476	1	1	\N	\N
4178	369	2493	1	1	\N	\N
4179	369	2493	2	1	\N	\N
4180	369	2494	1	1	\N	\N
4181	369	2494	2	1	\N	\N
4182	369	2492	1	1	\N	\N
4183	369	2491	1	1	\N	\N
4184	370	2498	1	1	\N	\N
4185	370	2498	1	2	0	\N
4186	370	2499	1	1	\N	\N
4187	370	2499	1	2	0	\N
4188	370	2495	1	1	\N	\N
4189	370	2495	1	2	0	\N
4190	370	2495	2	1	\N	\N
4191	370	2495	2	2	0	\N
4192	370	2497	1	1	\N	\N
4193	370	2497	1	2	0	\N
4194	370	2496	1	1	\N	\N
4195	370	2496	1	2	0	\N
4196	370	2502	1	1	\N	\N
4197	370	2502	1	2	0	\N
4198	370	2500	1	1	\N	\N
4199	370	2500	1	2	0	\N
4200	370	2501	1	1	\N	\N
4201	370	2501	1	2	0	\N
4202	370	2501	2	1	\N	\N
4203	370	2501	2	2	0	\N
4204	371	2524	1	1	\N	\N
4205	371	2513	1	1	\N	\N
4206	371	2513	1	2	0	\N
4207	371	2531	1	1	\N	\N
4208	371	2531	1	2	0	\N
4209	371	2507	1	1	\N	\N
4210	371	2507	1	2	0	\N
4211	371	2533	1	1	\N	\N
4212	371	2533	1	2	0	\N
4213	371	2515	1	1	\N	\N
4214	371	2515	1	2	0	\N
4215	371	2503	1	1	\N	\N
4216	371	2503	1	2	0	\N
4217	371	2517	1	1	\N	\N
4218	371	2517	1	2	0	\N
4219	371	2541	1	1	\N	\N
4220	371	2506	1	1	\N	\N
4221	371	2506	1	2	0	\N
4222	371	2510	1	1	\N	\N
4223	371	2509	1	2	0	\N
4224	371	2536	1	1	\N	\N
4225	371	2536	1	2	0	\N
4226	371	2529	1	1	\N	\N
4227	371	2529	1	2	0	\N
4228	371	2528	1	2	0	\N
4229	371	2526	1	1	\N	\N
4230	371	2526	1	2	0	\N
4231	371	2525	1	1	\N	\N
4232	371	2525	1	2	0	\N
4233	371	2540	1	2	0	\N
4234	371	2504	1	1	\N	\N
4235	371	2537	1	1	\N	\N
4236	371	2505	1	1	\N	\N
4237	371	2505	1	2	0	\N
4238	371	2522	1	1	\N	\N
4239	371	2522	1	2	0	\N
4240	371	2521	1	1	\N	\N
4241	371	2527	1	1	\N	\N
4242	371	2527	1	2	0	\N
4243	371	2530	1	1	\N	\N
4244	371	2530	1	2	0	\N
4245	371	2523	1	1	\N	\N
4246	371	2542	1	1	\N	\N
4247	371	2544	1	1	\N	\N
4248	371	2544	1	2	0	\N
4249	371	2543	1	1	\N	\N
4250	371	2512	1	1	\N	\N
4251	371	2512	1	2	0	\N
4252	371	2518	1	1	\N	\N
4253	371	2518	1	2	0	\N
4254	371	2532	1	1	\N	\N
4255	371	2532	1	2	0	\N
4256	371	2514	1	1	\N	\N
4257	371	2508	1	1	\N	\N
4258	371	2508	1	2	0	\N
4259	371	2534	1	1	\N	\N
4260	371	2534	1	2	0	\N
4261	371	2535	1	1	\N	\N
4262	371	2535	1	2	0	\N
4263	371	2511	1	1	\N	\N
4264	371	2511	1	2	0	\N
4265	371	2519	1	1	\N	\N
4266	371	2519	1	2	0	\N
4267	371	2520	1	1	\N	\N
4268	371	2516	1	1	\N	\N
4269	371	2539	1	1	\N	\N
4270	371	2539	1	2	0	\N
4271	371	2538	1	1	\N	\N
4272	371	2538	1	2	0	\N
4273	372	2552	1	1	\N	\N
4274	372	2552	1	2	0	\N
4275	372	2547	1	1	\N	\N
4276	372	2547	1	2	0	\N
4277	372	2546	1	1	\N	\N
4278	372	2546	1	2	0	\N
4279	372	2550	1	1	\N	\N
4280	372	2550	1	2	0	\N
4281	372	2558	1	1	\N	\N
4282	372	2559	1	2	0	\N
4283	372	2556	1	1	\N	\N
4284	372	2545	1	1	\N	\N
4285	372	2545	1	2	0	\N
4286	372	2555	1	1	\N	\N
4287	372	2557	1	1	\N	\N
4288	372	2557	1	2	0	\N
4289	372	2557	2	1	\N	\N
4290	372	2571	1	1	\N	\N
4291	372	2571	1	2	0	\N
4292	372	2578	1	1	\N	\N
4293	372	2578	1	2	0	\N
4294	372	2579	1	1	\N	\N
4295	372	2548	1	1	\N	\N
4296	372	2548	1	2	0	\N
4297	372	2551	1	1	\N	\N
4298	372	2549	1	1	\N	\N
4299	372	2554	1	1	\N	\N
4300	372	2554	1	2	0	\N
4301	372	2553	1	1	\N	\N
4302	372	2563	1	1	\N	\N
4303	372	2563	2	1	\N	\N
4304	372	2562	1	1	\N	\N
4305	372	2562	1	2	0	\N
4306	372	2561	1	1	\N	\N
4307	372	2561	1	2	0	\N
4308	372	2561	2	1	\N	\N
4309	372	2570	1	1	\N	\N
4310	372	2570	1	2	0	\N
4311	372	2570	2	1	\N	\N
4312	372	2560	1	1	\N	\N
4313	372	2572	1	1	\N	\N
4314	372	2577	1	1	\N	\N
4315	372	2575	1	1	\N	\N
4316	372	2573	1	1	\N	\N
4317	372	2574	1	1	\N	\N
4318	372	2576	1	1	\N	\N
4319	372	2564	1	1	\N	\N
4320	372	2564	2	1	\N	\N
4321	372	2569	1	1	\N	\N
4322	372	2567	1	1	\N	\N
4323	372	2565	1	1	\N	\N
4324	372	2566	1	1	\N	\N
4325	372	2566	2	1	\N	\N
4326	372	2568	1	1	\N	\N
4327	373	2604	1	1	\N	\N
4328	373	2605	1	1	\N	\N
4329	373	2607	1	1	\N	\N
4330	373	2608	1	1	\N	\N
4331	373	2606	1	1	\N	\N
4332	373	2589	1	1	\N	\N
4333	373	2589	1	2	0	\N
4334	373	2589	2	1	\N	\N
4335	373	2589	2	2	0	\N
4336	373	2612	1	1	\N	\N
4337	373	2585	1	1	\N	\N
4338	373	2585	1	2	0	\N
4339	373	2585	2	1	\N	\N
4340	373	2585	2	2	0	\N
4341	373	2591	1	1	\N	\N
4342	373	2592	1	1	\N	\N
4343	373	2592	1	2	0	\N
4344	373	2580	1	1	\N	\N
4345	373	2580	1	2	0	\N
4346	373	2580	2	1	\N	\N
4347	373	2594	1	1	\N	\N
4348	373	2594	1	2	0	\N
4349	373	2619	1	1	\N	\N
4350	373	2583	1	1	\N	\N
4351	373	2583	1	2	0	\N
4352	373	2583	2	1	\N	\N
4353	373	2584	1	1	\N	\N
4354	373	2587	1	1	\N	\N
4355	373	2587	1	2	0	\N
4356	373	2597	1	1	\N	\N
4357	373	2595	1	1	\N	\N
4358	373	2615	1	1	\N	\N
4359	373	2615	1	2	0	\N
4360	373	2615	2	1	\N	\N
4361	373	2603	1	1	\N	\N
4362	373	2603	1	2	0	\N
4363	373	2610	1	1	\N	\N
4364	373	2581	1	1	\N	\N
4365	373	2581	1	2	0	\N
4366	373	2616	1	1	\N	\N
4367	373	2616	1	2	0	\N
4368	373	2582	1	1	\N	\N
4369	373	2582	1	2	0	\N
4370	373	2601	1	1	\N	\N
4371	373	2601	1	2	0	\N
4372	373	2600	1	1	\N	\N
4373	373	2600	1	2	0	\N
4374	373	2600	2	1	\N	\N
4375	373	2609	1	1	\N	\N
4376	373	2611	1	1	\N	\N
4377	373	2611	1	2	0	\N
4378	373	2602	1	1	\N	\N
4379	373	2623	1	1	\N	\N
4380	373	2623	1	2	0	\N
4381	373	2620	1	1	\N	\N
4382	373	2622	1	1	\N	\N
4383	373	2622	1	2	0	\N
4384	373	2621	1	1	\N	\N
4385	373	2621	1	2	0	\N
4386	373	2624	1	1	\N	\N
4387	373	2624	1	2	0	\N
4388	373	2588	1	1	\N	\N
4389	373	2588	1	2	0	\N
4390	373	2596	1	1	\N	\N
4391	373	2596	1	2	0	\N
4392	373	2613	1	1	\N	\N
4393	373	2613	1	2	0	\N
4394	373	2590	1	1	\N	\N
4395	373	2590	1	2	0	\N
4396	373	2586	1	1	\N	\N
4397	373	2586	1	2	0	\N
4398	373	2598	1	1	\N	\N
4399	373	2598	1	2	0	\N
4400	373	2598	2	1	\N	\N
4401	373	2599	1	1	\N	\N
4402	373	2593	1	1	\N	\N
4403	373	2593	1	2	0	\N
4404	373	2614	1	1	\N	\N
4405	373	2618	1	1	\N	\N
4406	373	2618	1	2	0	\N
4407	373	2618	2	1	\N	\N
4408	373	2618	2	2	0	\N
4409	373	2617	1	1	\N	\N
4410	373	2617	1	2	0	\N
4411	374	2633	1	1	\N	\N
4412	374	2633	1	2	0	\N
4413	374	2645	1	1	\N	\N
4414	374	2645	1	3	0	\N
4415	374	2630	1	2	0	\N
4416	374	2629	1	1	\N	\N
4417	374	2625	1	1	\N	\N
4418	374	2643	1	1	\N	\N
4419	374	2643	1	2	0	\N
4420	374	2626	1	1	\N	\N
4421	374	2647	1	1	\N	\N
4422	374	2647	1	3	0	\N
4423	374	2628	1	1	\N	\N
4424	374	2627	1	1	\N	\N
4425	374	2627	1	2	0	\N
4426	374	2640	1	1	\N	\N
4427	374	2639	1	1	\N	\N
4428	374	2642	1	1	\N	\N
4429	374	2644	1	1	\N	\N
4430	374	2644	1	2	0	\N
4431	374	2650	1	1	\N	\N
4432	374	2650	1	2	0	\N
4433	374	2632	1	1	\N	\N
4434	374	2632	1	2	0	\N
4435	374	2636	1	1	\N	\N
4436	374	2646	1	1	\N	\N
4437	374	2646	1	2	0	\N
4438	374	2634	1	1	\N	\N
4439	374	2631	1	1	\N	\N
4440	374	2641	1	1	\N	\N
4441	374	2637	1	1	\N	\N
4442	374	2637	1	2	0	\N
4443	374	2638	1	1	\N	\N
4444	374	2635	1	1	\N	\N
4445	374	2649	1	1	\N	\N
4446	374	2649	1	2	0	\N
4447	374	2648	1	1	\N	\N
4448	375	2681	1	1	\N	\N
4449	375	2664	1	1	\N	\N
4450	375	2664	1	2	0	\N
4451	375	2653	1	1	\N	\N
4452	375	2653	1	2	0	\N
4453	375	2675	1	1	\N	\N
4454	375	2675	1	2	0	\N
4455	375	2652	1	1	\N	\N
4456	375	2652	1	2	0	\N
4457	375	2672	1	1	\N	\N
4458	375	2668	1	1	\N	\N
4459	375	2663	1	1	\N	\N
4460	375	2663	1	2	0	\N
4461	375	2666	1	1	\N	\N
4462	375	2666	1	2	0	\N
4463	375	2654	1	1	\N	\N
4464	375	2658	1	1	\N	\N
4465	375	2658	1	2	0	\N
4466	375	2658	2	1	\N	\N
4467	375	2655	1	1	\N	\N
4468	375	2655	1	2	0	\N
4469	375	2655	2	1	\N	\N
4470	375	2656	1	1	\N	\N
4471	375	2662	1	1	\N	\N
4472	375	2659	1	1	\N	\N
4473	375	2676	1	1	\N	\N
4474	375	2657	1	1	\N	\N
4475	375	2673	1	1	\N	\N
4476	375	2688	1	1	\N	\N
4477	375	2674	1	1	\N	\N
4478	375	2651	1	1	\N	\N
4479	375	2690	1	1	\N	\N
4480	375	2690	1	2	0	\N
4481	375	2680	1	1	\N	\N
4482	375	2680	1	2	0	\N
4483	375	2670	1	1	\N	\N
4484	375	2689	1	1	\N	\N
4485	375	2689	1	2	0	\N
4486	375	2689	2	1	\N	\N
4487	375	2679	1	1	\N	\N
4488	375	2678	1	1	\N	\N
4489	375	2678	1	2	0	\N
4490	375	2667	1	1	\N	\N
4491	375	2660	1	1	\N	\N
4492	375	2660	1	2	0	\N
4493	375	2677	1	1	\N	\N
4494	375	2677	1	2	0	\N
4495	375	2677	2	1	\N	\N
4496	375	2669	1	1	\N	\N
4497	375	2661	1	1	\N	\N
4498	375	2661	1	2	0	\N
4499	375	2665	1	1	\N	\N
4500	375	2686	1	1	\N	\N
4501	375	2685	1	1	\N	\N
4502	375	2687	1	1	\N	\N
4503	375	2687	1	2	0	\N
4504	375	2683	1	1	\N	\N
4505	375	2682	1	1	\N	\N
4506	375	2684	1	1	\N	\N
4507	375	2684	1	2	0	\N
4508	375	2671	1	1	\N	\N
4509	375	2671	1	2	0	\N
4510	376	2712	1	1	\N	\N
4511	376	2711	1	1	\N	\N
4512	376	2695	1	1	\N	\N
4513	376	2695	2	1	\N	\N
4514	376	2701	1	1	\N	\N
4515	376	2701	1	2	0	\N
4516	376	2701	2	1	\N	\N
4517	376	2701	2	2	0	\N
4518	376	2692	1	1	\N	\N
4519	376	2692	1	2	0	\N
4520	376	2692	2	1	\N	\N
4521	376	2692	2	2	0	\N
4522	376	2718	1	1	\N	\N
4523	376	2718	2	1	\N	\N
4524	376	2730	1	1	\N	\N
4525	376	2729	1	1	\N	\N
4526	376	2698	1	1	\N	\N
4527	376	2698	1	2	0	\N
4528	376	2708	1	1	\N	\N
4529	376	2691	1	1	\N	\N
4530	376	2719	1	1	\N	\N
4531	376	2693	1	1	\N	\N
4532	376	2693	1	2	0	\N
4533	376	2693	2	1	\N	\N
4534	376	2694	1	1	\N	\N
4535	376	2694	1	2	0	\N
4536	376	2694	2	1	\N	\N
4537	376	2694	2	2	0	\N
4538	376	2697	1	1	\N	\N
4539	376	2697	1	2	0	\N
4540	376	2697	2	2	0	\N
4541	376	2710	1	1	\N	\N
4542	376	2710	1	2	0	\N
4543	376	2707	1	1	\N	\N
4544	376	2725	1	1	\N	\N
4545	376	2725	1	2	0	\N
4546	376	2725	2	1	\N	\N
4547	376	2725	2	2	0	\N
4548	376	2709	1	1	\N	\N
4549	376	2704	1	1	\N	\N
4550	376	2696	1	1	\N	\N
4551	376	2696	1	2	0	\N
4552	376	2696	2	1	\N	\N
4553	376	2728	1	1	\N	\N
4554	376	2703	1	1	\N	\N
4555	376	2724	1	1	\N	\N
4556	376	2700	1	1	\N	\N
4557	376	2700	1	2	0	\N
4558	376	2700	2	1	\N	\N
4559	376	2716	1	1	\N	\N
4560	376	2716	1	2	0	\N
4561	376	2716	2	1	\N	\N
4562	376	2716	2	2	0	\N
4563	376	2714	1	1	\N	\N
4564	376	2715	1	1	\N	\N
4565	376	2713	1	1	\N	\N
4566	376	2713	1	2	0	\N
4567	376	2717	1	1	\N	\N
4568	376	2721	1	1	\N	\N
4569	376	2721	1	2	0	\N
4570	376	2721	2	1	\N	\N
4571	376	2721	2	2	0	\N
4572	376	2722	1	1	\N	\N
4573	376	2722	1	2	0	\N
4574	376	2722	2	1	\N	\N
4575	376	2722	2	2	0	\N
4576	376	2699	1	1	\N	\N
4577	376	2699	1	2	0	\N
4578	376	2699	2	1	\N	\N
4579	376	2706	1	1	\N	\N
4580	376	2702	1	1	\N	\N
4581	376	2702	2	1	\N	\N
4582	376	2720	1	1	\N	\N
4583	376	2723	1	1	\N	\N
4584	376	2727	1	1	\N	\N
4585	376	2727	1	2	0	\N
4586	376	2727	2	1	\N	\N
4587	376	2727	2	2	0	\N
4588	376	2726	1	1	\N	\N
4589	376	2726	2	1	\N	\N
4590	376	2705	1	1	\N	\N
4591	376	2705	1	2	0	\N
4592	377	2742	1	1	\N	\N
4593	377	2742	2	1	\N	\N
4594	377	2741	1	1	\N	\N
4595	377	2754	1	1	\N	\N
4596	377	2754	1	2	0	\N
4597	377	2736	1	1	\N	\N
4598	377	2736	1	2	0	\N
4599	377	2749	1	1	\N	\N
4600	377	2750	1	1	\N	\N
4601	377	2750	1	2	0	\N
4602	377	2751	1	1	\N	\N
4603	377	2751	1	2	0	\N
4604	377	2752	1	1	\N	\N
4605	377	2734	1	1	\N	\N
4606	377	2734	1	2	0	\N
4607	377	2731	1	1	\N	\N
4608	377	2732	1	1	\N	\N
4609	377	2732	2	1	\N	\N
4610	377	2733	1	1	\N	\N
4611	377	2733	1	2	0	\N
4612	377	2747	1	1	\N	\N
4613	377	2747	1	2	0	\N
4614	377	2747	2	1	\N	\N
4615	377	2748	1	1	\N	\N
4616	377	2748	1	2	0	\N
4617	377	2744	1	1	\N	\N
4618	377	2746	1	1	\N	\N
4619	377	2745	1	2	0	\N
4620	377	2735	1	1	\N	\N
4621	377	2753	1	1	\N	\N
4622	377	2755	1	1	\N	\N
4623	377	2755	1	2	0	\N
4624	377	2756	1	1	\N	\N
4625	377	2756	1	2	0	\N
4626	377	2738	1	1	\N	\N
4627	377	2738	1	2	0	\N
4628	377	2737	1	1	\N	\N
4629	377	2737	1	2	0	\N
4630	377	2737	2	1	\N	\N
4631	377	2737	2	2	0	\N
4632	377	2740	1	1	\N	\N
4633	377	2739	1	1	\N	\N
4634	377	2743	1	1	\N	\N
4635	378	2777	1	1	\N	\N
4636	378	2777	2	1	\N	\N
4637	378	2778	1	1	\N	\N
4638	378	2778	2	1	\N	\N
4639	378	2780	1	1	\N	\N
4640	378	2780	2	1	\N	\N
4641	378	2757	1	1	\N	\N
4642	378	2757	2	1	\N	\N
4643	378	2779	1	1	\N	\N
4644	378	2779	2	1	\N	\N
4645	378	2775	1	1	\N	\N
4646	378	2776	1	1	\N	\N
4647	378	2773	1	1	\N	\N
4648	378	2773	2	1	\N	\N
4649	378	2774	1	1	\N	\N
4650	378	2781	1	1	\N	\N
4651	378	2781	2	1	\N	\N
4652	378	2764	1	1	\N	\N
4653	378	2764	2	1	\N	\N
4654	378	2766	1	1	\N	\N
4655	378	2770	1	1	\N	\N
4656	378	2770	2	1	\N	\N
4657	378	2772	1	1	\N	\N
4658	378	2767	1	1	\N	\N
4659	378	2769	1	1	\N	\N
4660	378	2768	1	1	\N	\N
4661	378	2759	1	1	\N	\N
4662	378	2759	2	1	\N	\N
4663	378	2761	1	1	\N	\N
4664	378	2761	2	1	\N	\N
4665	378	2771	1	1	\N	\N
4666	378	2763	1	1	\N	\N
4667	378	2763	2	1	\N	\N
4668	378	2762	1	1	\N	\N
4669	378	2762	2	1	\N	\N
4670	378	2758	1	1	\N	\N
4671	378	2758	2	1	\N	\N
4672	378	2765	1	1	\N	\N
4673	378	2765	2	1	\N	\N
4674	378	2760	1	1	\N	\N
4675	378	2760	2	1	\N	\N
4676	379	2791	1	1	\N	\N
4677	379	2791	1	2	0	\N
4678	379	2783	1	1	\N	\N
4679	379	2783	1	2	0	\N
4680	379	2784	1	1	\N	\N
4681	379	2784	1	2	0	\N
4682	379	2785	1	1	\N	\N
4683	379	2785	1	2	0	\N
4684	379	2795	1	1	\N	\N
4685	379	2802	1	1	\N	\N
4686	379	2802	1	2	0	\N
4687	379	2805	1	1	\N	\N
4688	379	2805	1	2	0	\N
4689	379	2797	1	1	\N	\N
4690	379	2797	1	2	0	\N
4691	379	2803	1	1	\N	\N
4692	379	2806	1	1	\N	\N
4693	379	2806	1	2	0	\N
4694	379	2801	1	1	\N	\N
4695	379	2793	1	1	\N	\N
4696	379	2793	1	2	0	\N
4697	379	2786	1	1	\N	\N
4698	379	2796	1	1	\N	\N
4699	379	2796	1	2	0	\N
4700	379	2792	1	1	\N	\N
4701	379	2792	1	2	0	\N
4702	379	2794	1	1	\N	\N
4703	379	2787	1	1	\N	\N
4704	379	2782	1	1	\N	\N
4705	379	2799	1	1	\N	\N
4706	379	2798	1	1	\N	\N
4707	379	2798	1	2	0	\N
4708	379	2808	1	1	\N	\N
4709	379	2808	1	2	0	\N
4710	379	2800	1	1	\N	\N
4711	379	2788	1	1	\N	\N
4712	379	2790	1	1	\N	\N
4713	379	2789	1	1	\N	\N
4714	379	2789	1	2	0	\N
4715	379	2804	1	1	\N	\N
4716	379	2807	1	1	\N	\N
4717	380	2824	1	1	\N	\N
4718	380	2824	1	2	0	\N
4719	380	2824	2	1	\N	\N
4720	380	2824	2	2	0	\N
4721	380	2819	1	1	\N	\N
4722	380	2819	1	2	0	\N
4723	380	2819	2	1	\N	\N
4724	380	2819	2	2	0	\N
4725	380	2814	1	1	\N	\N
4726	380	2814	1	2	0	\N
4727	380	2814	2	1	\N	\N
4728	380	2814	2	2	0	\N
4729	380	2820	1	1	\N	\N
4730	380	2820	2	1	\N	\N
4731	380	2811	1	1	\N	\N
4732	380	2811	1	2	0	\N
4733	380	2811	2	1	\N	\N
4734	380	2811	2	2	0	\N
4735	380	2817	1	1	\N	\N
4736	380	2817	1	2	0	\N
4737	380	2817	2	1	\N	\N
4738	380	2817	2	2	0	\N
4739	380	2818	1	4	0	\N
4740	380	2818	2	4	0	\N
4741	380	2812	1	1	\N	\N
4742	380	2812	1	2	0	\N
4743	380	2812	1	4	0	\N
4744	380	2812	2	1	\N	\N
4745	380	2812	2	2	0	\N
4746	380	2812	2	4	0	\N
4747	380	2825	1	1	\N	\N
4748	380	2825	2	1	\N	\N
4749	380	2826	1	1	\N	\N
4750	380	2826	1	2	0	\N
4751	380	2826	2	1	\N	\N
4752	380	2826	2	2	0	\N
4753	380	2827	1	1	\N	\N
4754	380	2827	1	2	0	\N
4755	380	2827	2	1	\N	\N
4756	380	2827	2	2	0	\N
4757	380	2809	1	1	\N	\N
4758	380	2809	1	2	0	\N
4759	380	2809	2	1	\N	\N
4760	380	2809	2	2	0	\N
4761	380	2810	1	1	\N	\N
4762	380	2810	1	2	0	\N
4763	380	2810	2	1	\N	\N
4764	380	2810	2	2	0	\N
4765	380	2822	1	1	\N	\N
4766	380	2822	2	1	\N	\N
4767	380	2823	1	1	\N	\N
4768	380	2823	2	1	\N	\N
4769	380	2815	1	1	\N	\N
4770	380	2815	2	1	\N	\N
4771	380	2816	1	1	\N	\N
4772	380	2816	1	2	0	\N
4773	380	2816	2	1	\N	\N
4774	380	2816	2	2	0	\N
4775	380	2813	1	1	\N	\N
4776	380	2813	2	1	\N	\N
4777	380	2821	1	1	\N	\N
4778	380	2821	2	1	\N	\N
4779	381	2833	1	1	\N	\N
4780	381	2833	1	2	0	\N
4781	381	2830	1	1	\N	\N
4782	381	2830	1	2	0	\N
4783	381	2828	1	1	\N	\N
4784	381	2829	1	1	\N	\N
4785	381	2829	1	2	0	\N
4786	381	2835	1	1	\N	\N
4787	381	2835	1	2	0	\N
4788	381	2831	1	2	0	\N
4789	381	2837	1	1	\N	\N
4790	381	2836	1	1	\N	\N
4791	381	2832	1	1	\N	\N
4792	381	2832	1	2	0	\N
4793	381	2834	1	1	\N	\N
4794	382	2861	1	1	\N	\N
4795	382	2861	2	1	\N	\N
4796	382	2865	1	1	\N	\N
4797	382	2865	2	1	\N	\N
4798	382	2863	1	1	\N	\N
4799	382	2863	2	1	\N	\N
4800	382	2864	1	1	\N	\N
4801	382	2864	2	1	\N	\N
4802	382	2862	1	1	\N	\N
4803	382	2862	2	1	\N	\N
4804	382	2838	1	1	\N	\N
4805	382	2838	2	1	\N	\N
4806	382	2902	1	1	\N	\N
4807	382	2902	2	1	\N	\N
4808	382	2901	1	1	\N	\N
4809	382	2901	2	1	\N	\N
4810	382	2900	1	1	\N	\N
4811	382	2900	1	2	0	\N
4812	382	2900	2	1	\N	\N
4813	382	2900	2	2	0	\N
4814	382	2877	1	1	\N	\N
4815	382	2877	1	2	0	\N
4816	382	2877	2	1	\N	\N
4817	382	2877	2	2	0	\N
4818	382	2876	1	1	\N	\N
4819	382	2876	1	2	0	\N
4820	382	2876	2	1	\N	\N
4821	382	2876	2	2	0	\N
4822	382	2897	1	1	\N	\N
4823	382	2897	1	2	0	\N
4824	382	2897	2	1	\N	\N
4825	382	2897	2	2	0	\N
4826	382	2896	1	1	\N	\N
4827	382	2896	1	2	0	\N
4828	382	2896	2	1	\N	\N
4829	382	2896	2	2	0	\N
4830	382	2910	1	1	\N	\N
4831	382	2910	2	1	\N	\N
4832	382	2894	1	1	\N	\N
4833	382	2894	1	2	0	\N
4834	382	2894	2	1	\N	\N
4835	382	2894	2	2	0	\N
4836	382	2906	1	1	\N	\N
4837	382	2906	2	1	\N	\N
4838	382	2895	1	1	\N	\N
4839	382	2895	1	2	0	\N
4840	382	2895	2	1	\N	\N
4841	382	2895	2	2	0	\N
4842	382	2904	1	1	\N	\N
4843	382	2904	2	1	\N	\N
4844	382	2905	1	1	\N	\N
4845	382	2907	1	1	\N	\N
4846	382	2907	2	1	\N	\N
4847	382	2908	1	1	\N	\N
4848	382	2908	2	1	\N	\N
4849	382	2903	1	1	\N	\N
4850	382	2903	2	1	\N	\N
4851	382	2891	1	1	\N	\N
4852	382	2891	1	2	0	\N
4853	382	2891	2	1	\N	\N
4854	382	2891	2	2	0	\N
4855	382	2872	1	1	\N	\N
4856	382	2872	1	2	0	\N
4857	382	2872	2	1	\N	\N
4858	382	2872	2	2	0	\N
4859	382	2890	1	1	\N	\N
4860	382	2890	1	2	0	\N
4861	382	2890	2	1	\N	\N
4862	382	2890	2	2	0	\N
4863	382	2874	1	1	\N	\N
4864	382	2874	1	2	0	\N
4865	382	2874	2	1	\N	\N
4866	382	2874	2	2	0	\N
4867	382	2875	1	1	\N	\N
4868	382	2875	1	2	0	\N
4869	382	2875	2	1	\N	\N
4870	382	2875	2	2	0	\N
4871	382	2912	1	1	\N	\N
4872	382	2912	1	2	0	\N
4873	382	2912	2	1	\N	\N
4874	382	2912	2	2	0	\N
4875	382	2909	1	1	\N	\N
4876	382	2909	2	1	\N	\N
4877	382	2893	1	1	\N	\N
4878	382	2893	1	2	0	\N
4879	382	2893	2	1	\N	\N
4880	382	2893	2	2	0	\N
4881	382	2870	1	1	\N	\N
4882	382	2870	1	2	0	\N
4883	382	2870	2	1	\N	\N
4884	382	2870	2	2	0	\N
4885	382	2869	1	1	\N	\N
4886	382	2869	1	2	0	\N
4887	382	2869	2	1	\N	\N
4888	382	2868	1	1	\N	\N
4889	382	2868	1	2	0	\N
4890	382	2868	2	1	\N	\N
4891	382	2868	2	2	0	\N
4892	382	2867	1	1	\N	\N
4893	382	2867	1	2	0	\N
4894	382	2867	2	1	\N	\N
4895	382	2867	2	2	0	\N
4896	382	2898	1	1	\N	\N
4897	382	2898	1	2	0	\N
4898	382	2898	2	1	\N	\N
4899	382	2898	2	2	0	\N
4900	382	2899	1	1	\N	\N
4901	382	2899	1	2	0	\N
4902	382	2899	2	1	\N	\N
4903	382	2899	2	2	0	\N
4904	382	2866	1	1	\N	\N
4905	382	2866	1	2	0	\N
4906	382	2866	2	1	\N	\N
4907	382	2866	2	2	0	\N
4908	382	2886	1	1	\N	\N
4909	382	2886	1	2	0	\N
4910	382	2886	2	1	\N	\N
4911	382	2886	2	2	0	\N
4912	382	2889	1	1	\N	\N
4913	382	2889	1	2	0	\N
4914	382	2889	2	1	\N	\N
4915	382	2889	2	2	0	\N
4916	382	2888	1	1	\N	\N
4917	382	2888	1	2	0	\N
4918	382	2888	2	1	\N	\N
4919	382	2888	2	2	0	\N
4920	382	2885	1	1	\N	\N
4921	382	2885	1	2	0	\N
4922	382	2885	2	1	\N	\N
4923	382	2885	2	2	0	\N
4924	382	2884	1	1	\N	\N
4925	382	2884	1	2	0	\N
4926	382	2884	2	1	\N	\N
4927	382	2884	2	2	0	\N
4928	382	2883	1	1	\N	\N
4929	382	2883	1	2	0	\N
4930	382	2883	2	1	\N	\N
4931	382	2883	2	2	0	\N
4932	382	2871	1	1	\N	\N
4933	382	2871	1	2	0	\N
4934	382	2871	2	1	\N	\N
4935	382	2871	2	2	0	\N
4936	382	2882	1	1	\N	\N
4937	382	2882	1	2	0	\N
4938	382	2892	1	1	\N	\N
4939	382	2892	1	2	0	\N
4940	382	2892	2	1	\N	\N
4941	382	2892	2	2	0	\N
4942	382	2881	1	1	\N	\N
4943	382	2881	1	2	0	\N
4944	382	2881	2	1	\N	\N
4945	382	2881	2	2	0	\N
4946	382	2880	1	1	\N	\N
4947	382	2880	1	2	0	\N
4948	382	2880	2	1	\N	\N
4949	382	2880	2	2	0	\N
4950	382	2879	1	1	\N	\N
4951	382	2879	2	1	\N	\N
4952	382	2911	1	1	\N	\N
4953	382	2911	1	2	0	\N
4954	382	2911	2	1	\N	\N
4955	382	2911	2	2	0	\N
4956	382	2873	1	1	\N	\N
4957	382	2873	1	2	0	\N
4958	382	2873	2	1	\N	\N
4959	382	2873	2	2	0	\N
4960	382	2878	1	1	\N	\N
4961	382	2878	1	2	0	\N
4962	382	2878	2	1	\N	\N
4963	382	2878	2	2	0	\N
4964	382	2887	1	1	\N	\N
4965	382	2887	1	2	0	\N
4966	382	2887	2	1	\N	\N
4967	382	2887	2	2	0	\N
4968	382	2913	1	1	\N	\N
4969	382	2913	2	1	\N	\N
4970	382	2839	1	1	\N	\N
4971	382	2839	2	1	\N	\N
4972	382	2840	1	1	\N	\N
4973	382	2840	2	1	\N	\N
4974	382	2845	1	1	\N	\N
4975	382	2845	2	1	\N	\N
4976	382	2848	1	1	\N	\N
4977	382	2850	1	1	\N	\N
4978	382	2850	2	1	\N	\N
4979	382	2857	1	1	\N	\N
4980	382	2841	1	1	\N	\N
4981	382	2841	2	1	\N	\N
4982	382	2842	1	1	\N	\N
4983	382	2842	2	1	\N	\N
4984	382	2843	1	1	\N	\N
4985	382	2843	2	1	\N	\N
4986	382	2844	1	1	\N	\N
4987	382	2849	1	1	\N	\N
4988	382	2851	1	1	\N	\N
4989	382	2847	1	1	\N	\N
4990	382	2847	2	1	\N	\N
4991	382	2852	1	1	\N	\N
4992	382	2853	1	1	\N	\N
4993	382	2854	1	1	\N	\N
4994	382	2855	1	1	\N	\N
4995	382	2856	1	1	\N	\N
4996	382	2858	1	1	\N	\N
4997	382	2859	1	1	\N	\N
4998	382	2859	2	1	\N	\N
4999	382	2860	1	1	\N	\N
5000	382	2846	1	1	\N	\N
5001	384	2916	1	1	\N	\N
5002	384	2916	2	1	\N	\N
5003	384	2917	1	1	\N	\N
5004	384	2917	2	1	\N	\N
5005	384	2918	1	1	\N	\N
5006	384	2918	2	1	\N	\N
5007	384	2915	1	2	0	\N
5008	384	2915	1	4	0	\N
5009	384	2915	2	2	0	\N
5010	384	2915	2	4	0	\N
5011	384	2919	1	1	\N	\N
5012	384	2919	2	1	\N	\N
5013	384	2914	1	1	\N	\N
5014	384	2914	2	1	\N	\N
5015	385	2926	1	1	\N	\N
5016	385	2926	1	2	0	\N
5017	385	2926	1	3	0	\N
5018	385	2926	2	1	\N	\N
5019	385	2926	2	2	0	\N
5020	385	2926	2	3	0	\N
5021	385	2925	1	1	\N	\N
5022	385	2925	1	2	0	\N
5023	385	2925	1	3	0	\N
5024	385	2923	1	1	\N	\N
5025	385	2923	1	2	0	\N
5026	385	2923	1	3	0	\N
5027	385	2923	2	1	\N	\N
5028	385	2923	2	2	0	\N
5029	385	2923	2	3	0	\N
5030	385	2931	1	1	\N	\N
5031	385	2931	1	2	0	\N
5032	385	2931	1	3	0	\N
5033	385	2931	2	1	\N	\N
5034	385	2931	2	2	0	\N
5035	385	2931	2	3	0	\N
5036	385	2922	1	1	\N	\N
5037	385	2922	1	2	0	\N
5038	385	2922	1	3	0	\N
5039	385	2922	2	1	\N	\N
5040	385	2922	2	2	0	\N
5041	385	2922	2	3	0	\N
5042	385	2930	1	1	\N	\N
5043	385	2930	1	2	0	\N
5044	385	2930	1	3	0	\N
5045	385	2930	2	1	\N	\N
5046	385	2930	2	3	0	\N
5047	385	2924	1	1	\N	\N
5048	385	2924	1	2	0	\N
5049	385	2924	1	3	0	\N
5050	385	2924	2	1	\N	\N
5051	385	2924	2	3	0	\N
5052	385	2927	1	1	\N	\N
5053	385	2927	1	2	0	\N
5054	385	2927	1	3	0	\N
5055	385	2928	1	1	\N	\N
5056	385	2928	1	2	0	\N
5057	385	2928	1	3	0	\N
5058	385	2928	2	1	\N	\N
5059	385	2928	2	3	0	\N
5060	385	2921	1	1	\N	\N
5061	385	2921	1	2	0	\N
5062	385	2921	1	3	0	\N
5063	385	2929	1	1	\N	\N
5064	385	2929	1	2	0	\N
5065	385	2929	1	3	0	\N
5066	385	2929	2	1	\N	\N
5067	385	2929	2	3	0	\N
5068	385	2920	1	1	\N	\N
5069	385	2920	1	2	0	\N
5070	385	2920	1	3	0	\N
5071	385	2920	2	1	\N	\N
5072	385	2920	2	3	0	\N
5073	385	2932	1	1	\N	\N
5074	385	2932	1	2	0	\N
5075	385	2932	1	3	0	\N
5076	385	2932	2	1	\N	\N
5077	385	2932	2	2	0	\N
5078	385	2932	2	3	0	\N
5079	386	2941	3	1	\N	\N
5080	386	2936	3	2	0	\N
5081	386	2943	1	1	\N	\N
5082	386	2933	3	1	\N	\N
5083	386	2945	3	1	\N	\N
5084	386	2959	3	1	\N	\N
5085	386	2938	3	1	\N	\N
5086	386	2956	1	1	\N	\N
5087	386	2952	3	1	\N	\N
5088	386	2952	3	2	0	\N
5089	386	2958	3	1	\N	\N
5090	386	2934	1	1	\N	\N
5091	386	2934	3	1	\N	\N
5092	386	2935	1	2	0	\N
5093	386	2935	3	1	\N	\N
5094	386	2950	1	1	\N	\N
5095	386	2949	3	1	\N	\N
5096	386	2951	1	1	\N	\N
5097	386	2951	3	1	\N	\N
5098	386	2953	1	1	\N	\N
5099	386	2953	3	1	\N	\N
5100	386	2960	1	2	0	\N
5101	386	2961	3	1	\N	\N
5102	386	2961	3	2	0	\N
5103	386	2962	1	1	\N	\N
5104	386	2963	3	1	\N	\N
5105	386	2940	3	1	\N	\N
5106	386	2946	3	1	\N	\N
5107	386	2954	3	1	\N	\N
5108	386	2942	1	1	\N	\N
5109	386	2937	3	1	\N	\N
5110	386	2937	3	2	0	\N
5111	386	2955	1	2	0	\N
5112	386	2955	3	1	\N	\N
5113	386	2939	1	1	\N	\N
5114	386	2947	3	1	\N	\N
5115	386	2947	3	2	0	\N
5116	386	2948	3	1	\N	\N
5117	386	2944	1	1	\N	\N
5118	386	2957	3	1	\N	\N
5119	387	2971	1	1	\N	\N
5120	387	2971	1	2	0	\N
5121	387	2966	1	1	\N	\N
5122	387	2966	1	2	0	\N
5123	387	2965	1	1	\N	\N
5124	387	2969	1	1	\N	\N
5125	387	2964	1	1	\N	\N
5126	387	2964	1	2	0	\N
5127	387	2974	1	1	\N	\N
5128	387	2979	1	1	\N	\N
5129	387	2979	1	2	0	\N
5130	387	2980	1	1	\N	\N
5131	387	2967	1	2	0	\N
5132	387	2970	1	1	\N	\N
5133	387	2970	1	2	0	\N
5134	387	2968	1	1	\N	\N
5135	387	2968	1	2	0	\N
5136	387	2973	1	1	\N	\N
5137	387	2973	1	2	0	\N
5138	387	2972	1	1	\N	\N
5139	387	2977	1	1	\N	\N
5140	387	2976	1	1	\N	\N
5141	387	2976	1	2	0	\N
5142	387	2975	1	1	\N	\N
5143	387	2975	1	2	0	\N
5144	387	2978	1	1	\N	\N
5145	387	2978	1	2	0	\N
5146	388	2991	1	1	\N	\N
5147	388	2991	2	1	\N	\N
5148	388	2989	1	2	0	\N
5149	388	2982	1	1	\N	\N
5150	388	2982	2	1	\N	\N
5151	388	2986	1	1	\N	\N
5152	388	2986	2	1	\N	\N
5153	388	2988	1	1	\N	\N
5154	388	2988	2	1	\N	\N
5155	388	2984	1	2	0	\N
5156	388	2984	2	2	0	\N
5157	388	2987	1	1	\N	\N
5158	388	2987	2	1	\N	\N
5159	388	2985	1	4	0	\N
5160	388	2985	2	4	0	\N
5161	388	2983	1	1	\N	\N
5162	388	2983	1	4	0	\N
5163	388	2983	2	1	\N	\N
5164	388	2983	2	4	0	\N
5165	388	2992	1	1	\N	\N
5166	388	2992	1	2	0	\N
5167	388	2992	2	1	\N	\N
5168	388	2992	2	2	0	\N
5169	388	2981	1	1	\N	\N
5170	388	2981	1	2	0	\N
5171	388	2981	2	1	\N	\N
5172	388	2981	2	2	0	\N
5173	388	2990	1	1	\N	\N
5174	388	2990	2	1	\N	\N
5175	389	2998	1	1	\N	\N
5176	389	2994	1	1	\N	\N
5177	389	2996	1	1	\N	\N
5178	389	2996	1	2	0	\N
5179	389	2996	2	1	\N	\N
5180	389	2996	2	2	0	\N
5181	389	2995	1	1	\N	\N
5182	389	2995	2	1	\N	\N
5183	389	2999	1	1	\N	\N
5184	389	2999	1	2	0	\N
5185	389	2999	2	1	\N	\N
5186	389	2999	2	2	0	\N
5187	389	2993	1	1	\N	\N
5188	389	2997	1	1	\N	\N
5189	390	3004	1	2	0	\N
5190	390	3001	1	1	\N	\N
5191	390	3003	1	1	\N	\N
5192	390	3003	1	2	0	\N
5193	390	3003	2	1	\N	\N
5194	390	3002	1	1	\N	\N
5195	390	3006	1	1	\N	\N
5196	390	3006	1	2	0	\N
5197	390	3000	1	1	\N	\N
5198	390	3005	1	1	\N	\N
5199	390	3005	1	2	0	\N
5200	391	3014	1	1	\N	\N
5201	391	3014	2	1	\N	\N
5202	391	3014	3	1	\N	\N
5203	391	3008	1	1	\N	\N
5204	391	3008	2	1	\N	\N
5205	391	3008	3	1	\N	\N
5206	391	3011	1	1	\N	\N
5207	391	3011	2	1	\N	\N
5208	391	3011	3	1	\N	\N
5209	391	3013	1	1	\N	\N
5210	391	3013	2	1	\N	\N
5211	391	3013	3	1	\N	\N
5212	391	3010	1	2	0	\N
5213	391	3010	2	2	0	\N
5214	391	3010	3	2	0	\N
5215	391	3012	1	1	\N	\N
5216	391	3012	1	4	0	\N
5217	391	3012	2	1	\N	\N
5218	391	3012	3	1	\N	\N
5219	391	3012	3	4	0	\N
5220	391	3009	1	1	\N	\N
5221	391	3009	1	4	0	\N
5222	391	3009	2	1	\N	\N
5223	391	3009	3	1	\N	\N
5224	391	3009	3	4	0	\N
5225	391	3015	1	1	\N	\N
5226	391	3015	2	1	\N	\N
5227	391	3015	3	1	\N	\N
5228	391	3016	1	2	0	\N
5229	391	3016	2	2	0	\N
5230	391	3016	3	2	0	\N
5231	391	3007	1	1	\N	\N
5232	391	3007	2	1	\N	\N
5233	391	3007	3	1	\N	\N
5234	392	3023	1	1	\N	\N
5235	392	3018	1	1	\N	\N
5236	392	3018	1	2	0	\N
5237	392	3020	1	1	\N	\N
5238	392	3020	1	2	0	\N
5239	392	3020	1	4	0	\N
5240	392	3020	2	1	\N	\N
5241	392	3020	2	2	0	\N
5242	392	3021	1	1	\N	\N
5243	392	3021	1	2	0	\N
5244	392	3021	2	1	\N	\N
5245	392	3019	1	1	\N	\N
5246	392	3019	1	2	0	\N
5247	392	3019	1	4	0	\N
5248	392	3019	2	1	\N	\N
5249	392	3024	1	1	\N	\N
5250	392	3024	1	2	0	\N
5251	392	3024	2	1	\N	\N
5252	392	3024	2	2	0	\N
5253	392	3017	1	1	\N	\N
5254	392	3017	2	1	\N	\N
5255	392	3022	1	1	\N	\N
5256	392	3022	1	2	0	\N
5257	393	3031	1	1	\N	\N
5258	393	3031	3	1	\N	\N
5259	393	3030	3	1	\N	\N
5260	393	3035	1	1	\N	\N
5261	393	3035	3	1	\N	\N
5262	393	3033	3	1	\N	\N
5263	393	3033	3	2	0	\N
5264	393	3034	3	1	\N	\N
5265	393	3034	3	2	0	\N
5266	393	3027	3	1	\N	\N
5267	393	3025	3	1	\N	\N
5268	393	3026	3	1	\N	\N
5269	393	3032	1	1	\N	\N
5270	393	3032	3	1	\N	\N
5271	393	3037	1	1	\N	\N
5272	393	3037	1	2	0	\N
5273	393	3037	3	1	\N	\N
5274	393	3037	3	2	0	\N
5275	393	3036	3	1	\N	\N
5276	393	3038	3	2	0	\N
5277	393	3029	1	1	\N	\N
5278	393	3029	1	2	0	\N
5279	393	3029	3	1	\N	\N
5280	393	3029	3	2	0	\N
5281	393	3028	1	1	\N	\N
5282	393	3028	1	2	0	\N
5283	393	3028	3	1	\N	\N
5284	393	3028	3	2	0	\N
5285	394	3042	1	1	\N	\N
5286	394	3039	1	1	\N	\N
5287	394	3040	1	1	\N	\N
5288	394	3040	1	2	0	\N
5289	394	3052	1	1	\N	\N
5290	394	3052	1	2	0	\N
5291	394	3041	1	1	\N	\N
5292	394	3044	1	1	\N	\N
5293	394	3045	1	2	0	\N
5294	394	3047	1	1	\N	\N
5295	394	3049	1	1	\N	\N
5296	394	3049	1	2	0	\N
5297	394	3050	1	1	\N	\N
5298	394	3050	1	2	0	\N
5299	394	3043	1	1	\N	\N
5300	394	3043	1	2	0	\N
5301	394	3046	1	1	\N	\N
5302	394	3048	1	1	\N	\N
5303	394	3048	1	2	0	\N
5304	394	3051	1	1	\N	\N
5305	394	3053	1	1	\N	\N
5306	394	3053	1	2	0	\N
5307	395	3055	1	1	\N	\N
5308	395	3055	1	3	0	\N
5309	395	3068	1	1	\N	\N
5310	395	3070	1	1	\N	\N
5311	395	3067	1	1	\N	\N
5312	395	3067	1	2	0	\N
5313	395	3069	1	1	\N	\N
5314	395	3069	1	2	0	\N
5315	395	3064	1	1	\N	\N
5316	395	3064	1	2	0	\N
5317	395	3064	1	3	0	\N
5318	395	3064	2	1	\N	\N
5319	395	3064	2	2	0	\N
5320	395	3056	1	1	\N	\N
5321	395	3056	1	2	0	\N
5322	395	3056	1	3	0	\N
5323	395	3056	2	1	\N	\N
5324	395	3056	2	2	0	\N
5325	395	3059	1	1	\N	\N
5326	395	3059	1	2	0	\N
5327	395	3058	1	1	\N	\N
5328	395	3058	1	2	0	\N
5329	395	3058	1	3	0	\N
5330	395	3058	2	1	\N	\N
5331	395	3058	2	2	0	\N
5332	395	3061	1	1	\N	\N
5333	395	3061	1	2	0	\N
5334	395	3060	1	1	\N	\N
5335	395	3060	1	2	0	\N
5336	395	3063	1	1	\N	\N
5337	395	3063	1	2	0	\N
5338	395	3063	1	3	0	\N
5339	395	3063	2	1	\N	\N
5340	395	3063	2	2	0	\N
5341	395	3057	1	1	\N	\N
5342	395	3057	1	2	0	\N
5343	395	3062	1	1	\N	\N
5344	395	3062	1	2	0	\N
5345	395	3062	1	3	0	\N
5346	395	3062	2	1	\N	\N
5347	395	3054	1	1	\N	\N
5348	395	3054	1	2	0	\N
5349	395	3054	1	3	0	\N
5350	395	3054	2	1	\N	\N
5351	395	3054	2	2	0	\N
5352	395	3066	1	1	\N	\N
5353	395	3066	1	2	0	\N
5354	395	3065	1	1	\N	\N
5355	395	3065	1	2	0	\N
5356	396	3080	1	1	\N	\N
5357	396	3080	2	1	\N	\N
5358	396	3074	1	1	\N	\N
5359	396	3074	2	1	\N	\N
5360	396	3071	1	1	\N	\N
5361	396	3071	2	1	\N	\N
5362	396	3077	1	2	0	\N
5363	396	3077	2	2	0	\N
5364	396	3079	1	2	0	\N
5365	396	3079	2	2	0	\N
5366	396	3078	1	2	0	\N
5367	396	3078	2	2	0	\N
5368	396	3076	1	1	\N	\N
5369	396	3076	2	1	\N	\N
5370	396	3073	1	1	\N	\N
5371	396	3073	2	1	\N	\N
5372	396	3075	1	1	\N	\N
5373	396	3075	2	1	\N	\N
5374	396	3081	1	1	\N	\N
5375	396	3081	1	2	0	\N
5376	396	3081	2	1	\N	\N
5377	396	3081	2	2	0	\N
5378	396	3072	1	1	\N	\N
5379	396	3072	2	1	\N	\N
5380	397	3090	1	1	\N	\N
5381	397	3089	1	1	\N	\N
5382	397	3088	1	1	\N	\N
5383	397	3088	1	2	0	\N
5384	397	3083	1	1	\N	\N
5385	397	3084	1	1	\N	\N
5386	397	3084	1	2	0	\N
5387	397	3094	1	1	\N	\N
5388	397	3094	1	2	0	\N
5389	397	3085	1	1	\N	\N
5390	397	3085	1	2	0	\N
5391	397	3087	1	1	\N	\N
5392	397	3087	1	2	0	\N
5393	397	3091	1	1	\N	\N
5394	397	3091	1	2	0	\N
5395	397	3092	1	1	\N	\N
5396	397	3092	1	2	0	\N
5397	397	3082	1	1	\N	\N
5398	397	3093	1	1	\N	\N
5399	397	3093	1	2	0	\N
5400	397	3086	1	1	\N	\N
5401	397	3086	1	2	0	\N
5402	397	3095	1	1	\N	\N
5403	397	3095	1	2	0	\N
5404	398	3096	3	1	\N	\N
5405	398	3101	1	2	0	\N
5406	398	3101	3	1	\N	\N
5407	398	3102	3	1	\N	\N
5408	398	3103	1	1	\N	\N
5409	398	3099	1	1	\N	\N
5410	398	3099	3	1	\N	\N
5411	398	3098	3	1	\N	\N
5412	398	3098	3	2	0	\N
5413	398	3097	1	2	0	\N
5414	398	3097	3	1	\N	\N
5415	398	3100	1	1	\N	\N
5416	398	3100	3	2	0	\N
5417	399	3104	1	1	\N	\N
5418	399	3104	3	1	\N	\N
5419	399	3105	1	1	\N	\N
5420	399	3105	3	1	\N	\N
5421	399	3113	1	1	\N	\N
5422	399	3113	1	2	0	\N
5423	399	3113	3	1	\N	\N
5424	399	3113	3	2	0	\N
5425	399	3118	1	1	\N	\N
5426	399	3118	1	2	0	\N
5427	399	3118	3	1	\N	\N
5428	399	3118	3	2	0	\N
5429	399	3111	1	1	\N	\N
5430	399	3111	1	2	0	\N
5431	399	3111	3	1	\N	\N
5432	399	3111	3	2	0	\N
5433	399	3112	1	1	\N	\N
5434	399	3112	1	2	0	\N
5435	399	3112	3	1	\N	\N
5436	399	3112	3	2	0	\N
5437	399	3123	1	1	\N	\N
5438	399	3123	1	2	0	\N
5439	399	3123	3	1	\N	\N
5440	399	3123	3	2	0	\N
5441	399	3119	1	1	\N	\N
5442	399	3119	1	2	0	\N
5443	399	3119	3	1	\N	\N
5444	399	3119	3	2	0	\N
5445	399	3108	1	1	\N	\N
5446	399	3108	1	2	0	\N
5447	399	3108	3	1	\N	\N
5448	399	3108	3	2	0	\N
5449	399	3107	1	2	0	\N
5450	399	3107	3	1	\N	\N
5451	399	3107	3	2	0	\N
5452	399	3120	1	1	\N	\N
5453	399	3120	1	2	0	\N
5454	399	3120	3	1	\N	\N
5455	399	3120	3	2	0	\N
5456	399	3121	1	1	\N	\N
5457	399	3121	1	2	0	\N
5458	399	3121	3	1	\N	\N
5459	399	3121	3	2	0	\N
5460	399	3106	1	1	\N	\N
5461	399	3106	1	2	0	\N
5462	399	3106	3	1	\N	\N
5463	399	3106	3	2	0	\N
5464	399	3116	1	2	0	\N
5465	399	3116	3	1	\N	\N
5466	399	3116	3	2	0	\N
5467	399	3115	1	1	\N	\N
5468	399	3115	1	2	0	\N
5469	399	3115	3	1	\N	\N
5470	399	3115	3	2	0	\N
5471	399	3109	1	1	\N	\N
5472	399	3109	1	2	0	\N
5473	399	3109	3	1	\N	\N
5474	399	3109	3	2	0	\N
5475	399	3114	1	1	\N	\N
5476	399	3114	1	2	0	\N
5477	399	3114	3	1	\N	\N
5478	399	3114	3	2	0	\N
5479	399	3122	1	1	\N	\N
5480	399	3122	1	2	0	\N
5481	399	3122	3	1	\N	\N
5482	399	3122	3	2	0	\N
5483	399	3110	1	1	\N	\N
5484	399	3110	1	2	0	\N
5485	399	3110	3	1	\N	\N
5486	399	3110	3	2	0	\N
5487	399	3117	1	1	\N	\N
5488	399	3117	1	2	0	\N
5489	399	3117	3	1	\N	\N
5490	399	3117	3	2	0	\N
5491	400	3125	1	1	\N	\N
5492	400	3125	2	1	\N	\N
5493	400	3124	1	1	\N	\N
5494	400	3124	2	1	\N	\N
5495	401	3130	1	1	\N	\N
5496	401	3132	1	1	\N	\N
5497	401	3132	1	2	0	\N
5498	401	3132	2	2	0	\N
5499	401	3134	1	2	0	\N
5500	401	3136	1	1	\N	\N
5501	401	3135	1	1	\N	\N
5502	401	3126	1	1	\N	\N
5503	401	3133	1	1	\N	\N
5504	401	3133	1	2	0	\N
5505	401	3127	1	1	\N	\N
5506	401	3127	1	2	0	\N
5507	401	3128	1	1	\N	\N
5508	401	3128	1	2	0	\N
5509	401	3129	1	1	\N	\N
5510	401	3131	1	2	0	\N
5511	402	3142	1	1	\N	\N
5512	402	3142	1	2	0	\N
5513	402	3142	2	1	\N	\N
5514	402	3138	1	2	0	\N
5515	402	3140	1	1	\N	\N
5516	402	3140	2	1	\N	\N
5517	402	3139	1	1	\N	\N
5518	402	3139	2	1	\N	\N
5519	402	3137	1	1	\N	\N
5520	402	3137	1	2	0	\N
5521	402	3137	2	1	\N	\N
5522	402	3145	1	1	\N	\N
5523	402	3145	2	1	\N	\N
5524	402	3144	1	1	\N	\N
5525	402	3144	1	2	0	\N
5526	402	3144	2	1	\N	\N
5527	402	3141	1	1	\N	\N
5528	402	3141	1	2	0	\N
5529	402	3141	2	1	\N	\N
5530	402	3146	1	1	\N	\N
5531	402	3146	1	2	0	\N
5532	402	3146	2	1	\N	\N
5533	402	3143	1	1	\N	\N
5534	402	3143	1	2	0	\N
5535	402	3143	2	1	\N	\N
5536	403	3162	1	1	\N	\N
5537	403	3162	1	2	0	\N
5538	403	3162	1	3	0	\N
5539	403	3154	1	1	\N	\N
5540	403	3154	1	2	0	\N
5541	403	3154	1	3	0	\N
5542	403	3154	2	1	\N	\N
5543	403	3154	2	2	0	\N
5544	403	3155	1	1	\N	\N
5545	403	3148	1	1	\N	\N
5546	403	3148	1	2	0	\N
5547	403	3148	1	3	0	\N
5548	403	3148	2	1	\N	\N
5549	403	3148	2	2	0	\N
5550	403	3157	1	1	\N	\N
5551	403	3157	1	2	0	\N
5552	403	3157	1	3	0	\N
5553	403	3149	1	1	\N	\N
5554	403	3153	1	1	\N	\N
5555	403	3153	1	3	0	\N
5556	403	3147	1	1	\N	\N
5557	403	3147	1	2	0	\N
5558	403	3147	1	3	0	\N
5559	403	3150	1	1	\N	\N
5560	403	3163	1	1	\N	\N
5561	403	3164	1	1	\N	\N
5562	403	3164	1	2	0	\N
5563	403	3159	1	1	\N	\N
5564	403	3159	1	2	0	\N
5565	403	3160	1	1	\N	\N
5566	403	3160	1	2	0	\N
5567	403	3161	7	1	\N	\N
5568	403	3156	1	1	\N	\N
5569	403	3156	1	2	0	\N
5570	403	3158	1	1	\N	\N
5571	403	3158	1	2	0	\N
5572	403	3151	1	1	\N	\N
5573	403	3151	1	2	0	\N
5574	403	3152	1	1	\N	\N
5575	403	3165	1	1	\N	\N
5576	403	3165	1	2	0	\N
5577	404	3203	1	1	\N	\N
5578	404	3203	1	2	0	\N
5579	404	3186	1	1	\N	\N
5580	404	3186	1	2	0	\N
5581	404	3186	1	3	0	\N
5582	404	3186	2	1	\N	\N
5583	404	3186	2	2	0	\N
5584	404	3187	1	1	\N	\N
5585	404	3169	1	1	\N	\N
5586	404	3169	1	2	0	\N
5587	404	3169	1	3	0	\N
5588	404	3169	2	1	\N	\N
5589	404	3169	2	2	0	\N
5590	404	3190	1	1	\N	\N
5591	404	3190	1	2	0	\N
5592	404	3174	1	1	\N	\N
5593	404	3182	1	1	\N	\N
5594	404	3166	1	1	\N	\N
5595	404	3166	1	2	0	\N
5596	404	3166	2	1	\N	\N
5597	404	3177	1	1	\N	\N
5598	404	3177	1	2	0	\N
5599	404	3204	1	1	\N	\N
5600	404	3207	1	1	\N	\N
5601	404	3207	1	2	0	\N
5602	404	3195	1	1	\N	\N
5603	404	3195	1	2	0	\N
5604	404	3196	1	1	\N	\N
5605	404	3196	1	2	0	\N
5606	404	3196	1	3	0	\N
5607	404	3198	2	1	\N	\N
5608	404	3209	1	1	\N	\N
5609	404	3209	2	1	\N	\N
5610	404	3188	1	1	\N	\N
5611	404	3172	1	1	\N	\N
5612	404	3193	1	1	\N	\N
5613	404	3180	1	1	\N	\N
5614	404	3180	1	2	0	\N
5615	404	3180	1	3	0	\N
5616	404	3180	2	2	0	\N
5617	404	3181	1	1	\N	\N
5618	404	3208	1	1	\N	\N
5619	404	3208	1	2	0	\N
5620	404	3189	1	1	\N	\N
5621	404	3170	1	1	\N	\N
5622	404	3171	1	1	\N	\N
5623	404	3191	1	1	\N	\N
5624	404	3192	1	1	\N	\N
5625	404	3175	1	1	\N	\N
5626	404	3176	1	1	\N	\N
5627	404	3183	1	1	\N	\N
5628	404	3184	1	1	\N	\N
5629	404	3185	1	1	\N	\N
5630	404	3167	1	1	\N	\N
5631	404	3168	1	1	\N	\N
5632	404	3178	1	1	\N	\N
5633	404	3179	1	1	\N	\N
5634	404	3205	1	1	\N	\N
5635	404	3206	1	1	\N	\N
5636	404	3197	1	1	\N	\N
5637	404	3199	2	1	\N	\N
5638	404	3200	2	1	\N	\N
5639	404	3201	2	1	\N	\N
5640	404	3202	2	1	\N	\N
5641	404	3210	1	1	\N	\N
5642	404	3211	1	1	\N	\N
5643	404	3212	1	1	\N	\N
5644	404	3213	1	1	\N	\N
5645	404	3173	1	1	\N	\N
5646	404	3194	1	1	\N	\N
5647	405	3242	1	1	\N	\N
5648	405	3242	1	2	0	\N
5649	405	3228	1	1	\N	\N
5650	405	3228	1	2	0	\N
5651	405	3215	1	1	\N	\N
5652	405	3215	1	2	0	\N
5653	405	3215	2	1	\N	\N
5654	405	3229	1	1	\N	\N
5655	405	3229	1	2	0	\N
5656	405	3222	1	1	\N	\N
5657	405	3214	1	1	\N	\N
5658	405	3214	1	2	0	\N
5659	405	3223	1	1	\N	\N
5660	405	3243	1	1	\N	\N
5661	405	3243	1	2	0	\N
5662	405	3244	1	1	\N	\N
5663	405	3244	1	2	0	\N
5664	405	3235	1	1	\N	\N
5665	405	3235	1	2	0	\N
5666	405	3236	1	1	\N	\N
5667	405	3236	1	2	0	\N
5668	405	3237	2	1	\N	\N
5669	405	3246	1	1	\N	\N
5670	405	3233	1	1	\N	\N
5671	405	3226	1	1	\N	\N
5672	405	3226	1	2	0	\N
5673	405	3227	1	1	\N	\N
5674	405	3245	1	1	\N	\N
5675	405	3245	1	2	0	\N
5676	405	3216	1	1	\N	\N
5677	405	3217	1	1	\N	\N
5678	405	3218	1	1	\N	\N
5679	405	3219	1	1	\N	\N
5680	405	3220	1	1	\N	\N
5681	405	3221	1	1	\N	\N
5682	405	3230	1	1	\N	\N
5683	405	3231	1	1	\N	\N
5684	405	3232	1	1	\N	\N
5685	405	3224	1	1	\N	\N
5686	405	3225	1	1	\N	\N
5687	405	3238	2	1	\N	\N
5688	405	3239	2	1	\N	\N
5689	405	3240	2	1	\N	\N
5690	405	3241	2	1	\N	\N
5691	405	3247	1	1	\N	\N
5692	405	3248	1	1	\N	\N
5693	405	3249	1	1	\N	\N
5694	405	3250	1	1	\N	\N
5695	405	3251	1	1	\N	\N
5696	405	3234	1	1	\N	\N
5697	406	3260	1	1	\N	\N
5698	406	3260	1	2	0	\N
5699	406	3256	1	1	\N	\N
5700	406	3259	1	1	\N	\N
5701	406	3254	1	1	\N	\N
5702	406	3262	2	1	\N	\N
5703	406	3263	1	1	\N	\N
5704	406	3258	1	1	\N	\N
5705	406	3257	1	1	\N	\N
5706	406	3253	1	1	\N	\N
5707	406	3255	1	1	\N	\N
5708	406	3261	1	1	\N	\N
5709	406	3252	1	1	\N	\N
5710	407	3267	1	1	\N	\N
5711	407	3267	1	2	0	\N
5712	407	3266	1	1	\N	\N
5713	407	3266	1	2	0	\N
5714	407	3264	1	1	\N	\N
5715	407	3268	1	1	\N	\N
5716	407	3269	1	1	\N	\N
5717	407	3265	1	1	\N	\N
5718	407	3270	1	1	\N	\N
5719	408	3287	1	1	\N	\N
5720	408	3287	2	1	\N	\N
5721	408	3287	3	1	\N	\N
5722	408	3288	1	1	\N	\N
5723	408	3288	3	1	\N	\N
5724	408	3289	1	1	\N	\N
5725	408	3289	2	1	\N	\N
5726	408	3289	3	1	\N	\N
5727	408	3286	1	1	\N	\N
5728	408	3286	2	1	\N	\N
5729	408	3286	3	1	\N	\N
5730	408	3290	1	1	\N	\N
5731	408	3290	2	1	\N	\N
5732	408	3290	3	1	\N	\N
5733	408	3277	1	1	\N	\N
5734	408	3277	2	1	\N	\N
5735	408	3277	3	1	\N	\N
5736	408	3279	1	1	\N	\N
5737	408	3279	3	1	\N	\N
5738	408	3283	1	1	\N	\N
5739	408	3283	3	1	\N	\N
5740	408	3285	1	1	\N	\N
5741	408	3285	3	1	\N	\N
5742	408	3280	1	1	\N	\N
5743	408	3280	3	1	\N	\N
5744	408	3282	1	1	\N	\N
5745	408	3282	3	1	\N	\N
5746	408	3281	1	1	\N	\N
5747	408	3281	3	1	\N	\N
5748	408	3272	1	1	\N	\N
5749	408	3272	2	1	\N	\N
5750	408	3274	1	1	\N	\N
5751	408	3274	2	1	\N	\N
5752	408	3274	3	1	\N	\N
5753	408	3284	1	1	\N	\N
5754	408	3284	3	1	\N	\N
5755	408	3276	1	1	\N	\N
5756	408	3276	2	1	\N	\N
5757	408	3275	1	1	\N	\N
5758	408	3275	2	1	\N	\N
5759	408	3275	3	1	\N	\N
5760	408	3271	1	1	\N	\N
5761	408	3271	2	1	\N	\N
5762	408	3271	3	1	\N	\N
5763	408	3278	1	1	\N	\N
5764	408	3278	2	1	\N	\N
5765	408	3278	3	1	\N	\N
5766	408	3273	2	1	\N	\N
5767	408	3273	3	1	\N	\N
5768	409	3291	1	1	\N	\N
5769	409	3291	1	2	0	\N
5770	409	3291	2	1	\N	\N
5771	410	3293	1	1	\N	\N
5772	410	3296	1	1	\N	\N
5773	410	3296	1	2	0	\N
5774	410	3296	2	1	\N	\N
5775	410	3296	2	2	0	\N
5776	410	3294	1	1	\N	\N
5777	410	3294	2	1	\N	\N
5778	410	3298	1	1	\N	\N
5779	410	3298	1	2	0	\N
5780	410	3298	2	1	\N	\N
5781	410	3298	2	2	0	\N
5782	410	3292	1	1	\N	\N
5783	410	3297	1	2	0	\N
5784	410	3297	2	2	0	\N
5785	410	3295	1	1	\N	\N
5786	411	3299	1	1	\N	\N
5787	411	3299	2	1	\N	\N
5788	411	3300	1	1	\N	\N
5789	411	3300	2	1	\N	\N
5790	411	3306	1	1	\N	\N
5791	411	3306	1	2	0	\N
5792	411	3306	2	1	\N	\N
5793	411	3306	2	2	0	\N
5794	411	3312	1	1	\N	\N
5795	411	3312	1	2	0	\N
5796	411	3312	2	1	\N	\N
5797	411	3312	2	2	0	\N
5798	411	3310	1	1	\N	\N
5799	411	3310	1	2	0	\N
5800	411	3310	2	1	\N	\N
5801	411	3310	2	2	0	\N
5802	411	3311	1	1	\N	\N
5803	411	3311	1	2	0	\N
5804	411	3311	2	1	\N	\N
5805	411	3311	2	2	0	\N
5806	411	3303	1	1	\N	\N
5807	411	3303	1	2	0	\N
5808	411	3302	1	1	\N	\N
5809	411	3302	1	2	0	\N
5810	411	3302	2	1	\N	\N
5811	411	3302	2	2	0	\N
5812	411	3313	1	1	\N	\N
5813	411	3313	1	2	0	\N
5814	411	3313	2	1	\N	\N
5815	411	3313	2	2	0	\N
5816	411	3314	1	1	\N	\N
5817	411	3314	1	2	0	\N
5818	411	3314	2	1	\N	\N
5819	411	3314	2	2	0	\N
5820	411	3301	1	1	\N	\N
5821	411	3301	1	2	0	\N
5822	411	3301	2	1	\N	\N
5823	411	3301	2	2	0	\N
5824	411	3308	1	1	\N	\N
5825	411	3308	1	2	0	\N
5826	411	3308	2	1	\N	\N
5827	411	3308	2	2	0	\N
5828	411	3304	1	1	\N	\N
5829	411	3304	1	2	0	\N
5830	411	3304	2	1	\N	\N
5831	411	3304	2	2	0	\N
5832	411	3307	1	1	\N	\N
5833	411	3307	1	2	0	\N
5834	411	3315	1	1	\N	\N
5835	411	3315	1	2	0	\N
5836	411	3315	2	1	\N	\N
5837	411	3315	2	2	0	\N
5838	411	3305	1	1	\N	\N
5839	411	3305	1	2	0	\N
5840	411	3305	2	1	\N	\N
5841	411	3305	2	2	0	\N
5842	411	3309	1	1	\N	\N
5843	411	3309	1	2	0	\N
5844	411	3309	2	1	\N	\N
5845	411	3309	2	2	0	\N
5846	412	3319	1	1	\N	\N
5847	412	3318	1	1	\N	\N
5848	412	3321	1	1	\N	\N
5849	412	3320	1	1	\N	\N
5850	412	3317	1	1	\N	\N
5851	412	3316	1	1	\N	\N
5852	413	3323	1	1	\N	\N
5853	413	3322	1	1	\N	\N
5854	414	3325	1	1	\N	\N
5855	414	3324	1	1	\N	\N
5856	415	3338	1	1	\N	\N
5857	415	3338	1	3	0	\N
5858	415	3338	2	1	\N	\N
5859	415	3338	2	3	0	\N
5860	415	3338	4	1	\N	\N
5861	415	3327	1	1	\N	\N
5862	415	3327	1	3	0	\N
5863	415	3327	2	1	\N	\N
5864	415	3327	2	3	0	\N
5865	415	3327	4	1	\N	\N
5866	415	3340	1	1	\N	\N
5867	415	3340	1	3	0	\N
5868	415	3340	2	1	\N	\N
5869	415	3340	4	1	\N	\N
5870	415	3334	1	1	\N	\N
5871	415	3334	1	3	0	\N
5872	415	3334	2	1	\N	\N
5873	415	3334	4	1	\N	\N
5874	415	3337	1	1	\N	\N
5875	415	3337	1	3	0	\N
5876	415	3337	2	1	\N	\N
5877	415	3337	4	1	\N	\N
5878	415	3326	1	1	\N	\N
5879	415	3326	1	3	0	\N
5880	415	3326	2	1	\N	\N
5881	415	3326	4	1	\N	\N
5882	415	3335	1	1	\N	\N
5883	415	3335	1	3	0	\N
5884	415	3335	2	1	\N	\N
5885	415	3359	1	1	\N	\N
5886	415	3359	1	3	0	\N
5887	415	3362	1	1	\N	\N
5888	415	3362	1	3	0	\N
5889	415	3362	2	1	\N	\N
5890	415	3345	1	1	\N	\N
5891	415	3345	1	3	0	\N
5892	415	3346	1	1	\N	\N
5893	415	3347	2	1	\N	\N
5894	415	3364	1	1	\N	\N
5895	415	3339	1	1	\N	\N
5896	415	3339	1	3	0	\N
5897	415	3336	1	1	\N	\N
5898	415	3336	1	3	0	\N
5899	415	3363	1	1	\N	\N
5900	415	3363	1	3	0	\N
5901	415	3363	4	1	\N	\N
5902	415	3355	1	1	\N	\N
5903	415	3357	1	1	\N	\N
5904	415	3358	1	1	\N	\N
5905	415	3356	1	1	\N	\N
5906	415	3356	1	3	0	\N
5907	415	3328	1	1	\N	\N
5908	415	3329	1	1	\N	\N
5909	415	3330	1	1	\N	\N
5910	415	3331	1	1	\N	\N
5911	415	3332	1	1	\N	\N
5912	415	3333	1	1	\N	\N
5913	415	3341	1	1	\N	\N
5914	415	3342	1	1	\N	\N
5915	415	3343	1	1	\N	\N
5916	415	3344	1	1	\N	\N
5917	415	3360	1	1	\N	\N
5918	415	3361	1	1	\N	\N
5919	415	3348	2	1	\N	\N
5920	415	3349	2	1	\N	\N
5921	415	3350	2	1	\N	\N
5922	415	3351	2	1	\N	\N
5923	415	3352	2	1	\N	\N
5924	415	3353	2	1	\N	\N
5925	415	3354	2	1	\N	\N
5926	416	3367	1	1	\N	\N
5927	416	3367	2	1	\N	\N
5928	416	3365	1	1	\N	\N
5929	416	3365	1	2	0	\N
5930	416	3365	2	1	\N	\N
5931	416	3365	2	2	0	\N
5932	416	3368	1	1	\N	\N
5933	416	3368	1	2	0	\N
5934	416	3368	2	1	\N	\N
5935	416	3368	2	2	0	\N
5936	416	3366	1	1	\N	\N
5937	416	3366	2	1	\N	\N
5938	417	3369	1	1	\N	\N
5939	417	3373	1	1	\N	\N
5940	417	3374	1	1	\N	\N
5941	417	3376	1	1	\N	\N
5942	417	3376	1	2	0	\N
5943	417	3372	1	1	\N	\N
5944	417	3372	1	2	0	\N
5945	417	3375	1	1	\N	\N
5946	417	3375	1	2	0	\N
5947	417	3371	1	1	\N	\N
5948	417	3371	1	2	0	\N
5949	417	3370	1	1	\N	\N
5950	418	3381	1	1	\N	\N
5951	418	3382	1	1	\N	\N
5952	418	3378	1	1	\N	\N
5953	418	3379	1	1	\N	\N
5954	418	3377	1	1	\N	\N
5955	418	3380	1	1	\N	\N
5956	419	3389	2	1	\N	\N
5957	419	3391	1	1	\N	\N
5958	419	3388	1	1	\N	\N
5959	419	3384	1	1	\N	\N
5960	419	3383	1	1	\N	\N
5961	419	3386	2	1	\N	\N
5962	419	3385	1	1	\N	\N
5963	419	3390	1	1	\N	\N
5964	419	3387	1	1	\N	\N
5965	420	3400	2	1	\N	\N
5966	420	3399	1	1	\N	\N
5967	420	3393	1	1	\N	\N
5968	420	3392	1	1	\N	\N
5969	420	3395	2	1	\N	\N
5970	420	3394	1	1	\N	\N
5971	420	3398	2	1	\N	\N
5972	420	3397	1	1	\N	\N
5973	420	3396	1	1	\N	\N
5974	421	3410	1	1	\N	\N
5975	421	3410	2	1	\N	\N
5976	421	3411	1	1	\N	\N
5977	421	3411	2	1	\N	\N
5978	421	3413	1	1	\N	\N
5979	421	3413	2	1	\N	\N
5980	421	3401	1	1	\N	\N
5981	421	3401	2	1	\N	\N
5982	421	3412	1	1	\N	\N
5983	421	3412	2	1	\N	\N
5984	421	3409	1	1	\N	\N
5985	421	3409	2	1	\N	\N
5986	421	3414	1	1	\N	\N
5987	421	3414	2	1	\N	\N
5988	421	3407	1	1	\N	\N
5989	421	3407	2	1	\N	\N
5990	421	3402	1	1	\N	\N
5991	421	3402	2	1	\N	\N
5992	421	3403	1	1	\N	\N
5993	421	3403	2	1	\N	\N
5994	421	3406	1	1	\N	\N
5995	421	3406	2	1	\N	\N
5996	421	3408	1	1	\N	\N
5997	421	3408	2	1	\N	\N
5998	421	3404	1	1	\N	\N
5999	421	3404	2	1	\N	\N
6000	421	3405	1	1	\N	\N
6001	421	3405	2	1	\N	\N
6002	422	3418	3	1	\N	\N
6003	422	3415	3	1	\N	\N
6004	422	3417	3	1	\N	\N
6005	422	3416	3	1	\N	\N
\.


--
-- Data for Name: universities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.universities (id, code, name, regionid) FROM stdin;
1	352	Nukus davlat pedagogika instituti	1
2	317	Nukus konchilik instituti	1
3	408	O‘zbekiston davlat konservatoriyasi Nukus filiali	1
4	393	O‘zbekiston davlat sanʼat va madaniyat instituti Nukus filiali	1
5	399	Oʻzbekiston  davlat jismoniy tarbiya va sport universiteti Nukus filiali	1
6	386	Qoraqalpog‘iston qishloq xo‘jaligi va agrotexnologiyalar instituti	1
7	349	Qoraqalpog‘iston tibbiyot instituti	1
8	346	Qoraqalpoq davlat universiteti	1
9	422	Qoraqalpoq davlat universiteti Chimboy  fakulʼteti	1
10	398	Samarqand veterinariya meditsinasi, chorvachilik va biotexnologiyalar universiteti Nukus filiali	1
11	391	Toshkent axborot texnologiyalari universiteti Nukus filiali	1
12	412	Toshkent davlat iqtisodiyot universiteti To‘rtko‘l fakulʼteti	1
13	420	Andijon davlat chet tillari instituti	2
14	361	Andijon davlat tibbiyot instituti	2
15	301	Andijon davlat universiteti	2
16	403	Andijon davlat universitetining Pedagogika instituti	2
17	323	Andijon iqtisodiyot va qurilish instituti	2
18	303	Andijon mashinasozlik instituti	2
19	371	Andijon qishloq xo‘jaligi va agrotexnologiyalar instituti	2
20	419	Namangan davlat chet tillari instituti	3
21	309	Namangan davlat universiteti	3
22	310	Namangan muhandislik-qurilish instituti	3
23	311	Namangan muhandislik-texnologiya instituti	3
24	342	Farg‘ona davlat universiteti	4
25	344	Farg‘ona jamoat salomatligi tibbiyot instituti	4
26	343	Farg‘ona politexnika instituti	4
27	411	O‘zbekiston davlat jismoniy tarbiya va sport universiteti Farg‘ona filiali	4
28	381	O‘zbekiston davlat sanʼat va madaniyat instituti  Farg‘ona mintaqaviy filiali	4
29	356	Qo‘qon davlat pedagogika instituti	4
30	392	Toshkent axborot texnologiyalari universiteti Farg‘ona filiali	4
31	370	Toshkent davlat texnika universiteti Qoʻqon filiali	4
32	304	Buxoro davlat universiteti	5
33	404	Buxoro davlat universitetining Pedagogika instituti	5
34	305	Buxoro muhandislik-texnologiya instituti	5
35	394	Buxoro tabiiy resurslarni boshqarish instituti	5
36	362	Buxoro tibbiyot instituti	5
37	409	O‘zbekiston davlat xoreografiya akademiyasi Urganch filiali	6
38	390	Toshkent axborot texnologiyalari universiteti Urganch filiali	6
39	338	Toshkent tibbiyot akademiyasi Urganch filiali	6
40	341	Urganch davlat universiteti	6
41	348	Denov tadbirkorlik va pedagogika instituti	7
42	374	Termiz agrotexnologiyalar va innovatsion rivojlanish instituti	7
43	340	Termiz davlat universiteti	7
44	357	Termiz davlat universitetining Pedagogika instituti	7
45	379	Toshkent davlat texnika universiteti Termiz filiali	7
46	368	Toshkent tibbiyot akademiyasi Termiz filiali	7
47	339	O'zbekiston Respublikasi aviatsiya bilim yurti	8
48	345	Qarshi davlat universiteti	8
49	405	Qarshi davlat universitetining Pedagogika instituti	8
50	397	Qarshi irrigatsiya va agrotexnologiyalar instituti	8
51	375	Qarshi muhandislik - iqtisodiyot instituti	8
52	389	Toshkent axborot texnologiyalari universiteti Qarshi filiali	8
53	335	Toshkent kimyo-texnologiya instituti Shahrisabz filiali	8
54	351	Jizzax davlat pedagogika instituti	9
55	308	Jizzax politexnika instituti	9
56	401	O‘zbekiston Milliy universiteti Jizzax filiali	9
57	319	Navoiy davlat konchilik va texnologiyalar universiteti	10
58	353	Navoiy davlat pedagogika instituti	10
59	396	"Ipak yo‘li" turizm va madaniy meros xalqaro universiteti	11
60	313	Samarqand davlat arxitektura-qurilish instituti	11
61	347	Samarqand davlat chet tillar instituti	11
62	413	Samarqand davlat chet tillar instituti Narpay "Xorijiy tillar" fakulʼteti	11
63	414	Samarqand davlat chet tillar instituti Payariq "Xorijiy tillar" fakulʼteti	11
64	312	Samarqand davlat universiteti	11
65	417	Samarqand davlat universiteti Agrobiotexnologiyalar va oziq-ovqat xavfsizligi instituti	11
66	406	Samarqand davlat universiteti Kattaqo‘rg‘on filiali	11
67	418	Samarqand davlat universiteti Muhandislari fizikasi instituti	11
68	358	Samarqand davlat universiteti Urgut filiali	11
69	415	Samarqand davlat universitetining O‘zbekiston-Finlyandiya pedagogika instituti	11
70	385	Samarqand iqtisodiyot va servis instituti	11
71	372	Samarqand veterinariya meditsinasi, chorvachilik va biotexnologiyalar universiteti	11
72	388	Toshkent axborot texnologiyalari universiteti Samarqand filiali	11
73	320	Toshkent davlat agrar universiteti Samarqand  filiali	11
74	360	Toshkent davlat iqtisodiyot universiteti Samarqand filiali	11
75	363	Самарқанд давлат тиббиёт университети	11
76	307	Guliston davlat universiteti	12
77	402	Toshkent kimyo-texnologiya instituti Yangiyer filiali	12
78	333	Chirchiq oliy tank-qo'mondon muhandislik bilim yurti	13
79	382	O‘zbekiston  davlat jismoniy tarbiya va sport universiteti	13
80	410	Toshkent axborot texnologiyalari universiteti Nurafshon filiali	13
81	373	Toshkent davlat agrar universiteti	13
82	365	Toshkent davlat texnika universiteti Olmaliq filiali	13
83	354	Toshkent viloyati Chirchiq davlat pedagogika instituti	13
84	376	"Toshkent irrigatsiya va qishloq xo‘jaligini mexanizatsiyalash muhandislari instituti" milliy tadqiqotlar universiteti	14
85	359	Davlat bojxona qo'mitasining bojxona instituti	14
86	416	Davlat soliq qomitasi huzuridagi Fiskal instituti	14
87	316	Davlat xavfsizlik xizmati akademiyasi	14
88	318	Geologiya fanlari universiteti	14
89	350	Jahon iqtisodiyoti va diplomatiya universiteti	14
90	322	Jamoat xavfsizligi universiteti	14
91	421	Milliy estrada san'ati instituti	14
92	329	Milliy rassomlik va dizayn instituti	14
93	321	O'zbekiston Respublikasi Favqulodda vaziyatlat vazirligi akademiyasi	14
94	330	O'zbekiston Respublikasi Qurolli Kuchlar akademiyasi	14
95	407	O‘zbek milliy musiqa sanʼati instituti	14
96	378	O‘zbekiston  davlat konservatoriyasi	14
97	326	O‘zbekiston davlat jahon tillari universiteti	14
98	377	O‘zbekiston davlat sanʼat va madaniyat instituti	14
99	325	O‘zbekiston davlat xoreografiya akademiyasi	14
100	395	O‘zbekiston jurnalistika va ommaviy kommunikatsiyalar universiteti	14
101	314	O‘zbekiston Milliy universiteti	14
102	306	O‘zbekiston xalqaro islom akademiyasi	14
103	387	Samarqand veterinariya meditsinasi, chorvachilik va biotexnologiyalar universiteti Toshkent filiali	14
104	367	Toshkent  pediatriya tibbiyot instituti	14
105	328	Toshkent arxitektura-qurilish instituti	14
106	380	Toshkent axborot texnologiyalari universiteti	14
107	324	Toshkent davlat iqtisodiyot universiteti	14
108	302	Toshkent davlat o‘zbek tili va adabiyoti universiteti	14
109	355	Toshkent davlat pedagogika universiteti	14
110	327	Toshkent davlat sharqshunoslik universiteti	14
111	366	Toshkent davlat stomatologiya instituti	14
112	315	Toshkent davlat texnika universiteti	14
113	334	Toshkent davlat transport universiteti	14
114	384	Toshkent davlat yuridik universiteti	14
115	400	Toshkent davlat yuridik universiteti Ixtisoslashtirilgan filiali	14
116	369	Toshkent farmatsevtika instituti	14
117	337	Toshkent kimyo-texnologiya instituti	14
118	336	Toshkent moliya instituti	14
119	364	Toshkent tibbiyot akademiyasi	14
120	331	Toshkent to‘qimachilik va yengil sanoat instituti	14
\.


--
-- Name: abiturients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.abiturients_id_seq', 1, false);


--
-- Name: bloks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bloks_id_seq', 1, false);


--
-- Name: choices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.choices_id_seq', 1, false);


--
-- Name: faculties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faculties_id_seq', 3418, true);


--
-- Name: facultyshifres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facultyshifres_id_seq', 1542, true);


--
-- Name: fullchoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fullchoices_id_seq', 1, false);


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.languages_id_seq', 7, true);


--
-- Name: modes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modes_id_seq', 4, true);


--
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.regions_id_seq', 14, true);


--
-- Name: scores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.scores_id_seq', 1, false);


--
-- Name: selections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.selections_id_seq', 6005, true);


--
-- Name: universities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.universities_id_seq', 120, true);


--
-- Name: abiturients abiturients_abtid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abiturients
    ADD CONSTRAINT abiturients_abtid_key UNIQUE (abtid);


--
-- Name: abiturients abiturients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abiturients
    ADD CONSTRAINT abiturients_pkey PRIMARY KEY (id);


--
-- Name: bloks bloks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bloks
    ADD CONSTRAINT bloks_pkey PRIMARY KEY (id);


--
-- Name: choices choices_abtid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.choices
    ADD CONSTRAINT choices_abtid_key UNIQUE (abtid);


--
-- Name: choices choices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.choices
    ADD CONSTRAINT choices_pkey PRIMARY KEY (id);


--
-- Name: faculties faculties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculties
    ADD CONSTRAINT faculties_pkey PRIMARY KEY (id);


--
-- Name: facultyshifres facultyshifres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facultyshifres
    ADD CONSTRAINT facultyshifres_pkey PRIMARY KEY (id);


--
-- Name: facultyshifres facultyshifres_shifr_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facultyshifres
    ADD CONSTRAINT facultyshifres_shifr_key UNIQUE (shifr);


--
-- Name: fullchoices fullchoices_abtid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fullchoices
    ADD CONSTRAINT fullchoices_abtid_key UNIQUE (abtid);


--
-- Name: fullchoices fullchoices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fullchoices
    ADD CONSTRAINT fullchoices_pkey PRIMARY KEY (id);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: modes modes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modes
    ADD CONSTRAINT modes_pkey PRIMARY KEY (id);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: scores scores_abtid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_abtid_key UNIQUE (abtid);


--
-- Name: scores scores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_pkey PRIMARY KEY (id);


--
-- Name: selections selections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.selections
    ADD CONSTRAINT selections_pkey PRIMARY KEY (id);


--
-- Name: universities universities_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universities
    ADD CONSTRAINT universities_code_key UNIQUE (code);


--
-- Name: universities universities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universities
    ADD CONSTRAINT universities_pkey PRIMARY KEY (id);


--
-- Name: abiturients abiturients_langid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abiturients
    ADD CONSTRAINT abiturients_langid_fkey FOREIGN KEY (langid) REFERENCES public.languages(id);


--
-- Name: bloks bloks_langid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bloks
    ADD CONSTRAINT bloks_langid_fkey FOREIGN KEY (langid) REFERENCES public.languages(id);


--
-- Name: choices choices_abtid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.choices
    ADD CONSTRAINT choices_abtid_fkey FOREIGN KEY (abtid) REFERENCES public.abiturients(abtid);


--
-- Name: choices choices_selectionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.choices
    ADD CONSTRAINT choices_selectionid_fkey FOREIGN KEY (selectionid) REFERENCES public.selections(id);


--
-- Name: faculties faculties_blokid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculties
    ADD CONSTRAINT faculties_blokid_fkey FOREIGN KEY (blokid) REFERENCES public.bloks(id);


--
-- Name: faculties faculties_uncode_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculties
    ADD CONSTRAINT faculties_uncode_fkey FOREIGN KEY (uncode) REFERENCES public.universities(code);


--
-- Name: facultyshifres facultyshifres_blokid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facultyshifres
    ADD CONSTRAINT facultyshifres_blokid_fkey FOREIGN KEY (blokid) REFERENCES public.bloks(id);


--
-- Name: fullchoices fullchoices_abtid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fullchoices
    ADD CONSTRAINT fullchoices_abtid_fkey FOREIGN KEY (abtid) REFERENCES public.abiturients(abtid);


--
-- Name: fullchoices fullchoices_f10_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fullchoices
    ADD CONSTRAINT fullchoices_f10_fkey FOREIGN KEY (f10) REFERENCES public.selections(id);


--
-- Name: fullchoices fullchoices_f1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fullchoices
    ADD CONSTRAINT fullchoices_f1_fkey FOREIGN KEY (f1) REFERENCES public.selections(id);


--
-- Name: fullchoices fullchoices_f2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fullchoices
    ADD CONSTRAINT fullchoices_f2_fkey FOREIGN KEY (f2) REFERENCES public.selections(id);


--
-- Name: fullchoices fullchoices_f3_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fullchoices
    ADD CONSTRAINT fullchoices_f3_fkey FOREIGN KEY (f3) REFERENCES public.selections(id);


--
-- Name: fullchoices fullchoices_f4_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fullchoices
    ADD CONSTRAINT fullchoices_f4_fkey FOREIGN KEY (f4) REFERENCES public.selections(id);


--
-- Name: fullchoices fullchoices_f5_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fullchoices
    ADD CONSTRAINT fullchoices_f5_fkey FOREIGN KEY (f5) REFERENCES public.selections(id);


--
-- Name: fullchoices fullchoices_f6_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fullchoices
    ADD CONSTRAINT fullchoices_f6_fkey FOREIGN KEY (f6) REFERENCES public.selections(id);


--
-- Name: fullchoices fullchoices_f7_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fullchoices
    ADD CONSTRAINT fullchoices_f7_fkey FOREIGN KEY (f7) REFERENCES public.selections(id);


--
-- Name: fullchoices fullchoices_f8_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fullchoices
    ADD CONSTRAINT fullchoices_f8_fkey FOREIGN KEY (f8) REFERENCES public.selections(id);


--
-- Name: fullchoices fullchoices_f9_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fullchoices
    ADD CONSTRAINT fullchoices_f9_fkey FOREIGN KEY (f9) REFERENCES public.selections(id);


--
-- Name: scores scores_abtid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_abtid_fkey FOREIGN KEY (abtid) REFERENCES public.abiturients(abtid);


--
-- Name: scores scores_blokid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_blokid_fkey FOREIGN KEY (blokid) REFERENCES public.bloks(id);


--
-- Name: selections selections_facultyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.selections
    ADD CONSTRAINT selections_facultyid_fkey FOREIGN KEY (facultyid) REFERENCES public.faculties(id);


--
-- Name: selections selections_langid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.selections
    ADD CONSTRAINT selections_langid_fkey FOREIGN KEY (langid) REFERENCES public.languages(id);


--
-- Name: selections selections_mode_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.selections
    ADD CONSTRAINT selections_mode_fkey FOREIGN KEY (mode) REFERENCES public.modes(id);


--
-- Name: selections selections_uncode_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.selections
    ADD CONSTRAINT selections_uncode_fkey FOREIGN KEY (uncode) REFERENCES public.universities(code);


--
-- Name: universities universities_regionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universities
    ADD CONSTRAINT universities_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.regions(id);


--
-- PostgreSQL database dump complete
--

