--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: container; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.container (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    image character varying NOT NULL,
    frequency integer
);


ALTER TABLE public.container OWNER TO postgres;

--
-- Name: container_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.container_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.container_id_seq OWNER TO postgres;

--
-- Name: container_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.container_id_seq OWNED BY public.container.id;


--
-- Name: ingredients_sample; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingredients_sample (
    id integer NOT NULL,
    description character varying(255) NOT NULL,
    image character varying NOT NULL
);


ALTER TABLE public.ingredients_sample OWNER TO postgres;

--
-- Name: ingrediants-sample_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ingrediants-sample_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ingrediants-sample_id_seq" OWNER TO postgres;

--
-- Name: ingrediants-sample_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ingrediants-sample_id_seq" OWNED BY public.ingredients_sample.id;


--
-- Name: ingredient_price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingredient_price (
    id integer NOT NULL,
    ingredient character varying(255) NOT NULL,
    container character varying(255) NOT NULL,
    price numeric(2,0) DEFAULT 0 NOT NULL
);


ALTER TABLE public.ingredient_price OWNER TO postgres;

--
-- Name: ingredient_price_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ingredient_price_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredient_price_id_seq OWNER TO postgres;

--
-- Name: ingredient_price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ingredient_price_id_seq OWNED BY public.ingredient_price.id;


--
-- Name: labels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.labels (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    image character varying
);


ALTER TABLE public.labels OWNER TO postgres;

--
-- Name: labels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.labels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.labels_id_seq OWNER TO postgres;

--
-- Name: labels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.labels_id_seq OWNED BY public.labels.id;


--
-- Name: ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ratings (
    id bigint NOT NULL,
    "user" character varying(255) NOT NULL,
    recipe_id bigint NOT NULL,
    ratings integer NOT NULL,
    favorite boolean DEFAULT false NOT NULL,
    CONSTRAINT ratings_ratings_check CHECK (((ratings >= 1) AND (ratings <= 10)))
);


ALTER TABLE public.ratings OWNER TO postgres;

--
-- Name: ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ratings_id_seq OWNER TO postgres;

--
-- Name: ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;


--
-- Name: recipe_ingredients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipe_ingredients (
    id bigint NOT NULL,
    ingredient character varying(255) NOT NULL,
    quantity integer NOT NULL,
    container character varying(255) NOT NULL,
    recipe_id integer NOT NULL
);


ALTER TABLE public.recipe_ingredients OWNER TO postgres;

--
-- Name: recipe-ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."recipe-ingredients_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."recipe-ingredients_id_seq" OWNER TO postgres;

--
-- Name: recipe-ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."recipe-ingredients_id_seq" OWNED BY public.recipe_ingredients.id;


--
-- Name: recipe_labels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipe_labels (
    id integer NOT NULL,
    recipe_id bigint NOT NULL,
    label character varying(255) NOT NULL
);


ALTER TABLE public.recipe_labels OWNER TO postgres;

--
-- Name: recipe_labels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recipe_labels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipe_labels_id_seq OWNER TO postgres;

--
-- Name: recipe_labels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recipe_labels_id_seq OWNED BY public.recipe_labels.id;


--
-- Name: recipes_title; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipes_title (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    description character varying(500),
    category character varying(50) NOT NULL,
    image character varying(255) NOT NULL,
    owner character varying(255) NOT NULL
);


ALTER TABLE public.recipes_title OWNER TO postgres;

--
-- Name: recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recipes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_id_seq OWNER TO postgres;

--
-- Name: recipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recipes_id_seq OWNED BY public.recipes_title.id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    access character varying(100) NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- Name: shopping_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shopping_cart (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    shoping_date date,
    eat_time character varying(255),
    recipe_id integer NOT NULL
);


ALTER TABLE public.shopping_cart OWNER TO postgres;

--
-- Name: shopping_cart_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shopping_cart_detail (
    id integer NOT NULL,
    username character varying NOT NULL,
    ingredient_name character varying NOT NULL,
    ingredient_quantity integer NOT NULL,
    recipe_id integer NOT NULL,
    ingredient_image character varying,
    ingredient_price integer NOT NULL,
    container character varying NOT NULL
);


ALTER TABLE public.shopping_cart_detail OWNER TO postgres;

--
-- Name: shopping_cart_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shopping_cart_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shopping_cart_detail_id_seq OWNER TO postgres;

--
-- Name: shopping_cart_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shopping_cart_detail_id_seq OWNED BY public.shopping_cart_detail.id;


--
-- Name: shopping_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shopping_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shopping_cart_id_seq OWNER TO postgres;

--
-- Name: shopping_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shopping_cart_id_seq OWNED BY public.shopping_cart.id;


--
-- Name: steps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.steps (
    id bigint NOT NULL,
    description character varying(500) NOT NULL,
    image character varying,
    steps_number integer NOT NULL,
    recipe_id bigint NOT NULL
);


ALTER TABLE public.steps OWNER TO postgres;

--
-- Name: steps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.steps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.steps_id_seq OWNER TO postgres;

--
-- Name: steps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.steps_id_seq OWNED BY public.steps.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(100) NOT NULL,
    email character varying NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(255) DEFAULT USER NOT NULL,
    avatar character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: container id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.container ALTER COLUMN id SET DEFAULT nextval('public.container_id_seq'::regclass);


--
-- Name: ingredient_price id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredient_price ALTER COLUMN id SET DEFAULT nextval('public.ingredient_price_id_seq'::regclass);


--
-- Name: ingredients_sample id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients_sample ALTER COLUMN id SET DEFAULT nextval('public."ingrediants-sample_id_seq"'::regclass);


--
-- Name: labels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.labels ALTER COLUMN id SET DEFAULT nextval('public.labels_id_seq'::regclass);


--
-- Name: ratings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);


--
-- Name: recipe_ingredients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe_ingredients ALTER COLUMN id SET DEFAULT nextval('public."recipe-ingredients_id_seq"'::regclass);


--
-- Name: recipe_labels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe_labels ALTER COLUMN id SET DEFAULT nextval('public.recipe_labels_id_seq'::regclass);


--
-- Name: recipes_title id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_title ALTER COLUMN id SET DEFAULT nextval('public.recipes_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- Name: shopping_cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart ALTER COLUMN id SET DEFAULT nextval('public.shopping_cart_id_seq'::regclass);


--
-- Name: shopping_cart_detail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart_detail ALTER COLUMN id SET DEFAULT nextval('public.shopping_cart_detail_id_seq'::regclass);


--
-- Name: steps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.steps ALTER COLUMN id SET DEFAULT nextval('public.steps_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: container; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.container (id, name, image, frequency) FROM stdin;
10	spoon	https://i.picsum.photos/id/416/200/200.jpg?hmac=QgMiXqHqKofoCv4h8lkrwRSOkn5Twkh15Dfl9Efvtwo	4
12	pound	https://i.picsum.photos/id/71/200/200.jpg?hmac=TxuNm2jDRRNlSKPRxG7HH5vT63Bl20fD7M81shzv45M	6
9	kilo	https://i.picsum.photos/id/277/200/200.jpg?hmac=zlHjTbiytnfBWurpKXXSvMRzVSmkgW13o4K7Q-08r68	3
11	gram	https://i.picsum.photos/id/666/200/200.jpg?hmac=keuaJ7nJC5hkHIEyee1b6jdEMbHBZbozYQ9NClt2_lk	5
8	bottle	https://i.picsum.photos/id/223/200/200.jpg?hmac=CNNyWbBcEAJ7TPkTmEEwdGrLFEYkxpTeVwJ7U0LB30Y	2
7	piece	https://i.picsum.photos/id/518/200/200.jpg?hmac=nY2cAnZ0_ItWhhAsJ_XL3RsNkDo7_zobodK8FWIoCDM	1
\.


--
-- Data for Name: ingredient_price; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ingredient_price (id, ingredient, container, price) FROM stdin;
28	beef	pound	6
22	salt	pound	6
30	lamb	kilo	9
29	chicken	kilo	11
21	tomato	spoon	3
26	oil	piece	4
24	rice	gram	8
23	garlic	kilo	3
27	pepper	spoon	6
31	sugar	pound	10
\.


--
-- Data for Name: ingredients_sample; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ingredients_sample (id, description, image) FROM stdin;
11	tomato	https://i.picsum.photos/id/75/200/200.jpg?hmac=iXY_MolS8m8RDrh8BblWo-XCw9TRR_YvkeuRIko1Q1A
12	salt	https://i.picsum.photos/id/118/200/200.jpg?hmac=r_5sQuuYCa3xJmO_wafQe_A_P-F2Kimwk-48579v9uY
13	garlic	https://i.picsum.photos/id/28/200/200.jpg?hmac=eT-kjSvX_wh2uU3SYgAuRWjzo4ndNGimCCiNEaWlnOg
14	rice	https://i.picsum.photos/id/1027/200/200.jpg?hmac=fiXlkLLwYm7JmmU80uRIj9g21XD4q9v_lM_2Z57UhuA
15	sugar	https://i.picsum.photos/id/1022/200/200.jpg?hmac=MjK2sur6luq2UfxMPWBFBuPyvZYyYLYvQH9kCmEGJRY
16	oil	https://i.picsum.photos/id/1051/200/200.jpg?hmac=s6d4ypEjpec8nvA2zqhWzx_6ogXYM2fJ_YJwaOM1CUA
17	pepper	https://i.picsum.photos/id/170/200/200.jpg?hmac=2Xh3j3MMZE07_G7UDPgPRm557LRHzyFrkyeWRXdhdvU
18	beef	https://i.picsum.photos/id/687/200/200.jpg?hmac=U-mrTuk3Y5M3brBJ76mYvaj-bZ3ggY1OD8YOIPw89uI
19	chicken	https://i.picsum.photos/id/351/200/200.jpg?hmac=E2C8OwTRNgbEan5RzifMH73ENtpcsHSr45mGFQk5mPU
20	lamb	https://i.picsum.photos/id/518/200/200.jpg?hmac=nY2cAnZ0_ItWhhAsJ_XL3RsNkDo7_zobodK8FWIoCDM
\.


--
-- Data for Name: labels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.labels (id, name, image) FROM stdin;
7	chicken	https://i.picsum.photos/id/473/200/200.jpg?hmac=lXsJQxtsh73ygSCMmcWA-YqIpQ4FjdxUYkkuLTAPBfM
8	beef	https://i.picsum.photos/id/536/200/200.jpg?hmac=Ncz_gqWPnq2UI5u-tKvEfwaXLLhoc4ryLBjGJ7fjR1c
9	soup	https://i.picsum.photos/id/842/200/200.jpg?hmac=RW9iEgAYLKwoinQWSz_zrZHyOwmVEgqvoZTPebkRGMM
10	spicy	https://i.picsum.photos/id/927/200/200.jpg?hmac=8gJRiqNVrPAFPg0IyGTTYxaPJBSoLOVg4elvGEPV30M
11	noodle	https://i.picsum.photos/id/619/200/200.jpg?hmac=kS8OI8cYlvghz5FZaiYdIx96pUPQ30oF6bIsAg3AOZ4
12	fried	https://i.picsum.photos/id/421/200/200.jpg?hmac=Kix073-H73pkRedH4XJ8fenHLI9Sd9akWlOFjKog0EA
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ratings (id, "user", recipe_id, ratings, favorite) FROM stdin;
27	maolao	50	8	t
30	maolao	43	3	t
32	zoez	68	4	t
33	maolao	66	5	t
34	andyzhangff	64	2	f
35	zoez	47	3	t
37	andyzhangff	42	4	t
38	zoez	46	5	t
39	maolao	64	4	t
31	andyzhangff	40	3	t
36	andyzhangff	45	3	t
\.


--
-- Data for Name: recipe_ingredients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipe_ingredients (id, ingredient, quantity, container, recipe_id) FROM stdin;
281	salt	11	pound	67
263	rice	11	gram	55
292	garlic	99	bottle	56
272	garlic	11	spoon	46
294	sugar	77	pound	54
289	lamb	22	bottle	59
277	beef	3	piece	41
300	tomato	9	bottle	48
268	chicken	3	gram	50
269	lamb	2	pound	49
284	sugar	88	spoon	64
267	beef	77	pound	51
297	beef	22	gram	51
258	chicken	77	piece	60
251	salt	2	pound	67
260	tomato	2	piece	58
256	pepper	99	spoon	62
257	beef	88	bottle	61
273	rice	9	bottle	45
271	salt	22	spoon	47
254	sugar	11	pound	64
290	tomato	11	kilo	58
279	lamb	22	kilo	39
291	salt	9	piece	57
253	rice	22	bottle	65
309	lamb	9	spoon	39
288	chicken	22	kilo	60
301	salt	99	kilo	47
286	pepper	3	kilo	62
299	lamb	11	bottle	49
293	rice	88	kilo	55
266	pepper	88	bottle	52
307	beef	22	spoon	41
306	pepper	22	kilo	42
296	pepper	2	piece	52
275	oil	88	pound	43
283	rice	99	piece	65
295	oil	3	gram	53
270	tomato	22	bottle	48
252	garlic	22	spoon	66
304	sugar	3	bottle	44
280	tomato	22	gram	68
302	garlic	88	piece	46
303	rice	77	piece	45
278	chicken	2	gram	40
298	chicken	22	spoon	50
264	sugar	9	gram	54
308	chicken	11	kilo	40
305	oil	2	kilo	43
250	tomato	3	pound	68
287	beef	2	gram	61
265	oil	99	gram	53
276	pepper	77	gram	42
262	garlic	22	pound	56
274	sugar	99	pound	44
282	garlic	9	spoon	66
259	lamb	3	piece	59
261	salt	22	kilo	57
\.


--
-- Data for Name: recipe_labels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipe_labels (id, recipe_id, label) FROM stdin;
32	40	beef
33	41	soup
44	52	beef
54	62	fried
58	66	spicy
39	47	soup
49	57	chicken
45	53	soup
48	56	fried
34	42	spicy
60	68	fried
40	48	spicy
46	54	spicy
35	43	noodle
36	44	fried
31	39	chicken
42	50	fried
37	45	chicken
53	61	noodle
43	51	chicken
38	46	beef
50	58	beef
59	67	noodle
51	59	soup
57	65	soup
56	64	beef
52	60	spicy
41	49	noodle
47	55	noodle
\.


--
-- Data for Name: recipes_title; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipes_title (id, title, description, category, image, owner) FROM stdin;
41	Noodle3	In id sem vel sapien blandit porta ut in nisi. Duis consectetur neque metus, eu tempus leo rhoncus in. Aenean dictum quis lectus vitae ullamcorper. Vivamus ultricies risus leo, quis pellentesque	noodle	https://i.picsum.photos/id/640/250/150.jpg?hmac=xMXA2zfjFDGXCgvOIc9oUDscYbIsw7RDDxa5XkmrU2Q	andyzhangff
54	Chicken6	tae urna at leo vestibulum eleifend vel a leo. Maecenas nec ipsum interdum, blandit orci sit amet, porta justo. Vestibulum sed odio at orci accumsan malesuada vel ut augue. Phasell	chicken	https://i.picsum.photos/id/45/250/150.jpg?hmac=EUnK4OS7VdgEPzDqWCEamoOHZSTQTeE6xlQBvDa0wkU	maolao
58	Chicken10	fringilla nisl, eget commodo metus tortor ut nibh. Sed accumsan, nisi sit amet viverra finibus, nisl lectus accumsan dui, posuere rhoncus dolor lacus nec ipsum. Cras va	chicken	https://i.picsum.photos/id/473/250/150.jpg?hmac=PTp8-TxgZx4wq2GIvCdPp3OJLPrFZSte9ysP8hSuQnk	zoez
50	Chicken2	us. Fusce eget fermentum mi. Pellentesque porta commodo leo, in euismod leo ultricies maximus. Curabitur vel accumsan ipsum, rutrum ullamcorper neque. Vestibu	chicken	https://i.picsum.photos/id/156/250/150.jpg?hmac=BaD8kY9PKlyuL6kEFS0ua6wC1wWPQbVYxTzkulC0ZeU	maolao
51	Chicken3	ellus venenatis nec odio vel tempus. Nam auctor risus lorem, hendrerit ullamcorper lorem dapibus eu. Aenean eget nisi a massa volutpat posuere. Sed tempus eleifend libero vel com	chicken	https://i.picsum.photos/id/371/250/150.jpg?hmac=KCvTiKcIQQ1sMcMvbV3ljwEbPk4TL8qvzoiPA1k8yN0	andyzhangff
61	Beef3	odales, urna non efficitur malesuada, ex risus sollicitudin lectus, et rhoncus arcu eros a libero. Cras vestibulum rutrum risus eu efficitur. Maecenas at mollis	beef	https://i.picsum.photos/id/604/250/150.jpg?hmac=n4kx5Ri31WjcpiWuDg68UcPyXzQbhE7s9VY_EB-e0II	andyzhangff
43	Noodle5	Sed porttitor ullamcorper ex quis condimentum. Ut nibh nisi, gravida eget nisi id, mollis cursus lectus. Phasellus a massa eleifend, imperdiet eros nec, tristique ligula. Donec co	noodle	https://i.picsum.photos/id/942/250/150.jpg?hmac=aaMfer_m_gJt-Tb-kUKPOwWlTyG40p7YBBvtvaspKFA	andyzhangff
40	Noodle2	Curabitur viverra convallis est, in rhoncus felis aliquam nec. Fusce vulputate turpis velit, non auctor ex tristique eget. Curabitur pharetra sit amet dui at semper. Cras eleifend sagittis lorem, in iaculis lor	noodle	https://i.picsum.photos/id/273/250/150.jpg?hmac=v9j-RTp2NGIbcnfzo1wCMaL0iARYj1bCyb_FdOlS_84	andyzhangff
68	Beef10	bitur nec pulvinar diam. Maecenas rhoncus et sapien a venenatis. Duis commodo tellus at purus pellentesque, nec malesuada libero ultrices. Sed euismod l	beef	https://i.picsum.photos/id/1012/250/150.jpg?hmac=MhWt7YRsrKalhTINzd3G4WTqz_HXpB9Kml9HAeO5-ks	maolao
66	Beef8	s a aliquet convallis, facilisis eget purus. Etiam vestibulum rhoncus neque, vitae lobortis tortor finibus eu. In porta dui non libero vulputate, at tempor purus maximus.	beef	https://i.picsum.photos/id/213/250/150.jpg?hmac=9nwGSfHAmQ7s6SvNI2mrYAyVml_3XTsdytTb8QJG5bA	andyzhangff
64	Beef6	am vel magna nunc. Praesent vehicula lorem auctor odio semper, quis mattis ar	beef	https://i.picsum.photos/id/992/250/150.jpg?hmac=qzIMVFM4MdgozyKtrJzxq6bFjnwj7MADEPPRyio4uvA	andyzhangff
47	Noodle9	Cras sodales, risus non vehicula feugiat, eros augue pharetra justo, eget elementum justo nisi nec ligula. Sed placerat felis sit amet ipsum venenatis sollicitudin. Mauris sit amet mau	noodle	https://i.picsum.photos/id/1062/250/150.jpg?hmac=WEDSJ0P4nqcQlh9q_Px68GK74BDqbSUYomRbYnbStIo	zoez
45	Noodle7	Sed luctus nibh id ullamcorper facilisis. Aliquam placerat diam enim, non ultrices ex consequat eu. Maecenas fermentum diam leo, eu accumsan mauris tincidunt vitae. Do	noodle	https://i.picsum.photos/id/838/250/150.jpg?hmac=6k77YyIc7mFRuNn7f0FpQVqfpnW-LzefuD349sgz2Iw	zoez
46	Noodle8	Nunc tempor justo est, at semper ligula venenatis sed. Sed ultrices sem quam, eget ullamcorper sapien semper nec. Praesent bibendum sem a purus tristique, in mal	noodle	https://i.picsum.photos/id/873/250/150.jpg?hmac=tu-tIPA9t1_0BG1EYZvtRERbYJsTDgm9or2qslYGFhg	andyzhangff
65	Beef7	ero velit, et congue risus placerat nec. Praesent non quam molestie, euismod nunc vitae, pharetra nulla. Aenean vitae ultrices neque, nec elementum m	beef	https://i.picsum.photos/id/260/250/150.jpg?hmac=G49upo_hfLexlhljyQUMYRghW5Jo0CLPakAWfuzaEBE	maolao
62	Beef4	Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aenean quam arcu, commodo eu rhoncus eu, pr	beef	https://i.picsum.photos/id/6/250/150.jpg?hmac=HhlpSgw60utnQaFfo6RCiJWst428ZYaWmOPTgocaL_E	maolao
52	Chicken4	on massa ultricies, euismod velit id, laoreet dui. Phasellus et diam eget enim accumsan bibendum. Nulla facilisi. Aliquam posuere ante libero, sed bibendum nibh elemen	chicken	https://i.picsum.photos/id/672/250/150.jpg?hmac=oW47T00M0_DmY8znVIqjkhQuZQHEzG4erscGCO6XZyg	zoez
53	Chicken5	Etiam id nibh nec ante eleifend condimentum. Praesent eros lacus, imperdiet a nisi non, interdum sollicitudin risus. Vestibulum vehicula iaculis dolor, at bibendum lor	chicken	https://i.picsum.photos/id/385/250/150.jpg?hmac=yUYC8W2h5XDhW90N-yVtan6XRIqAwbCX7naI7TFsVPE	zoez
48	Noodle10	at blandit ex nisl vitae felis. Sed cursus nec ex non cursus. Suspendisse vitae egestas libero. Fusce laoreet nulla nec lorem mollis ornare. In hac habitasse platea dict	noodle	https://i.picsum.photos/id/237/250/150.jpg?hmac=43EMcrOyJ-hIu7amlRAysS8kt4FcDPnf1XDzAjIqy90	zoez
49	Chicken1	aecenas hendrerit nisi in condimentum dictum. Nam tincidunt, dui in egestas gravida, mauris sem molestie odio, at tempus lorem est quis velit. Phasellus vitae consequat ips	chicken	https://i.picsum.photos/id/607/250/150.jpg?hmac=G_e4CPIDOhukq55HMLlDiR1RjQCkvPiK0Nr-urh3f0g	zoez
42	Noodle4	Phasellus id dapibus magna. Quisque gravida rhoncus dui nec placerat. Donec bibendum nisl quis dignissim semper. Donec cursus placerat ligula scelerisque malesuada. Ve	noodle	https://i.picsum.photos/id/696/250/150.jpg?hmac=lV6cSFhOR38MQIFSRZUSzlG4UADhjE55KY83jhMnnpM	andyzhangff
57	Chicken9	t bibendum. Fusce rutrum, nibh ac facilisis posuere, velit massa aliquet sem, egestas blandit erat dui sit amet neque. Phasellus blandit placerat tincidun	chicken	https://i.picsum.photos/id/902/250/150.jpg?hmac=1DvxIkRQodn91LceW0Lz7K8ghKl6xk5CwrYKGMrforw	maolao
60	Beef2	nec vestibulum diam convallis eget. Quisque ut pellentesque nunc. In hac habitasse platea dictumst. Etiam vulputate turpis mauris, a suscipit enim porttitor eu.	beef	https://i.picsum.photos/id/39/250/150.jpg?hmac=OUDZAqGkIf2mj18Z4jqRt7fwxp1y7bentfytBCebIq4	maolao
44	Noodle6	Sed commodo, nibh vel suscipit molestie, sem libero lobortis lorem, eu accumsan leo lorem a arcu. Cras sed felis neque. Orci varius natoque penatibus et magnis dis partu	noodle	https://i.picsum.photos/id/864/250/150.jpg?hmac=M5OknDI6p8MDeqriif-TiJVGHJslFVCVjjP4HmTYZgE	andyzhangff
39	Noodle1	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut risus vel lorem pulvinar vestibulum. Proin eget tincidunt nisl, quis ornare tortor. Sed porta convallis m	noodle	https://i.picsum.photos/id/458/250/150.jpg?hmac=QtTVZOFzTujCuGdA0DkjYwznNinWqYbwM1Yu7bphQEY	maolao
55	Chicken7	ugiat eget eros condimentum porta. Vestibulum egestas mi eget erat lobortis volutpat ut sit amet dui. Vivamus rhoncus quam sit amet libero placerat	chicken	https://i.picsum.photos/id/133/250/150.jpg?hmac=n6BxBH1WRPkDDowe2zJXYK_pNtDBVC5BGfJ2qUTYNi8	andyzhangff
59	Beef1	ugiat venenatis. Phasellus nec enim nec augue tincidunt euismod in quis magna. Aenean malesuada m	beef	https://i.picsum.photos/id/886/250/150.jpg?hmac=TDFac04bP0mx20PtICnTUzs_S6NKrNd7SwgMOBg_4W0	maolao
67	Beef9	Donec at pharetra justo. Sed posuere, mi sit amet fringilla hendrerit, tortor n	beef	https://i.picsum.photos/id/545/250/150.jpg?hmac=ToFk90I6i7nBiou8pBm6KgbgdyVtCjJgX-xQP1quBQQ	zoez
56	Chicken8	bus. Aliquam ipsum nisl, varius quis elementum vitae, accumsan vel lacus. Sed risus magna, ultrices sit amet varius sed, condimentum eget ligul	chicken	https://i.picsum.photos/id/640/250/150.jpg?hmac=xMXA2zfjFDGXCgvOIc9oUDscYbIsw7RDDxa5XkmrU2Q	maolao
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, name, access) FROM stdin;
5	ROLE_USER	WRITE
6	ROLE_TOURIST	READ
4	ROLE_ADMIN	FULL
\.


--
-- Data for Name: shopping_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopping_cart (id, username, shoping_date, eat_time, recipe_id) FROM stdin;
17	andyzhangff	2021-11-30	dinner	51
\.


--
-- Data for Name: shopping_cart_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopping_cart_detail (id, username, ingredient_name, ingredient_quantity, recipe_id, ingredient_image, ingredient_price, container) FROM stdin;
11	andyzhangff	beef	77	51	https://i.picsum.photos/id/687/200/200.jpg?hmac=U-mrTuk3Y5M3brBJ76mYvaj-bZ3ggY1OD8YOIPw89uI	6	pound
12	andyzhangff	beef	22	51	https://i.picsum.photos/id/687/200/200.jpg?hmac=U-mrTuk3Y5M3brBJ76mYvaj-bZ3ggY1OD8YOIPw89uI	6	gram
13	andyzhangff	beef	77	51	https://i.picsum.photos/id/687/200/200.jpg?hmac=U-mrTuk3Y5M3brBJ76mYvaj-bZ3ggY1OD8YOIPw89uI	6	pound
14	andyzhangff	beef	22	51	https://i.picsum.photos/id/687/200/200.jpg?hmac=U-mrTuk3Y5M3brBJ76mYvaj-bZ3ggY1OD8YOIPw89uI	6	gram
\.


--
-- Data for Name: steps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.steps (id, description, image, steps_number, recipe_id) FROM stdin;
14	psum is that it has a more-or-less normal distribution of letters, as opposed to using 'C	https://i.picsum.photos/id/522/200/200.jpg?hmac=-4K81k9CA5C9S2DWiH5kP8rMvaAPk2LByYZHP9ejTjA	1	39
15	el text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Variou	\N	1	40
16	pular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Lati	https://i.picsum.photos/id/305/200/200.jpg?hmac=GAm9fW477iVRZTOeQCdEqLVug4lTf8wnHHzLof8RbFQ	1	41
17	he majority have suffered alteration in some form, by injected humour, or randomised	\N	1	42
18	 of classical Latin literature from 45 BC, making it over 2000 years old. Richard M	https://i.picsum.photos/id/209/200/200.jpg?hmac=hsby8v-4ueyQ64FWn-Eqn4P9AtOM7OCsjA_L8rxOwHM	1	43
19	e Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the 	https://i.picsum.photos/id/679/200/200.jpg?hmac=sPsw4YJPQkWFqo2k5UycejGhY4UXvaDXStGmvJEhFBA	1	44
20	se on the theory of ethics, very popular during the Renaissance. The first line of Lore	\N	1	45
21	going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embar	https://i.picsum.photos/id/211/200/200.jpg?hmac=VJ4wl95YuQJMvM_1O83L3nSfTn20OxaVfWe0wNMZrIc	1	46
22	. It uses a dictionary of over 200 Latin words, combined with a handful 	https://i.picsum.photos/id/1076/200/200.jpg?hmac=KTOq4o7b6rXzwd8kYN0nWrPIeKI97mzxBdWhnn-o-Nc	1	47
23	ate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore 	https://i.picsum.photos/id/426/200/200.jpg?hmac=5auPuax0L2lXSIX0eJ2Qxa3HzmGUHCrGDPIEMAWgw7o	1	48
24	aliquip ex ea commodo co	\N	1	49
25	xplicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione volupta	\N	1	50
26	isci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis	\N	1	51
27	psum is that it has a more-or-less normal distribution of letters, as opposed to using 'C	https://i.picsum.photos/id/522/200/200.jpg?hmac=-4K81k9CA5C9S2DWiH5kP8rMvaAPk2LByYZHP9ejTjA	1	52
28	el text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Variou	\N	1	53
29	pular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Lati	https://i.picsum.photos/id/305/200/200.jpg?hmac=GAm9fW477iVRZTOeQCdEqLVug4lTf8wnHHzLof8RbFQ	1	54
30	he majority have suffered alteration in some form, by injected humour, or randomised	\N	1	55
31	 of classical Latin literature from 45 BC, making it over 2000 years old. Richard M	https://i.picsum.photos/id/209/200/200.jpg?hmac=hsby8v-4ueyQ64FWn-Eqn4P9AtOM7OCsjA_L8rxOwHM	1	56
32	e Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the 	https://i.picsum.photos/id/679/200/200.jpg?hmac=sPsw4YJPQkWFqo2k5UycejGhY4UXvaDXStGmvJEhFBA	1	57
33	se on the theory of ethics, very popular during the Renaissance. The first line of Lore	\N	1	58
34	going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embar	https://i.picsum.photos/id/211/200/200.jpg?hmac=VJ4wl95YuQJMvM_1O83L3nSfTn20OxaVfWe0wNMZrIc	1	59
35	. It uses a dictionary of over 200 Latin words, combined with a handful 	https://i.picsum.photos/id/1076/200/200.jpg?hmac=KTOq4o7b6rXzwd8kYN0nWrPIeKI97mzxBdWhnn-o-Nc	1	60
36	ate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore 	https://i.picsum.photos/id/426/200/200.jpg?hmac=5auPuax0L2lXSIX0eJ2Qxa3HzmGUHCrGDPIEMAWgw7o	1	61
37	aliquip ex ea commodo co	\N	1	62
39	isci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis	\N	1	64
40	psum is that it has a more-or-less normal distribution of letters, as opposed to using 'C	https://i.picsum.photos/id/522/200/200.jpg?hmac=-4K81k9CA5C9S2DWiH5kP8rMvaAPk2LByYZHP9ejTjA	1	65
41	el text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Variou	\N	1	66
42	pular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Lati	https://i.picsum.photos/id/305/200/200.jpg?hmac=GAm9fW477iVRZTOeQCdEqLVug4lTf8wnHHzLof8RbFQ	1	67
43	he majority have suffered alteration in some form, by injected humour, or randomised	\N	1	68
44	 of classical Latin literature from 45 BC, making it over 2000 years old. Richard M	https://i.picsum.photos/id/209/200/200.jpg?hmac=hsby8v-4ueyQ64FWn-Eqn4P9AtOM7OCsjA_L8rxOwHM	2	39
45	e Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the 	https://i.picsum.photos/id/679/200/200.jpg?hmac=sPsw4YJPQkWFqo2k5UycejGhY4UXvaDXStGmvJEhFBA	2	40
46	se on the theory of ethics, very popular during the Renaissance. The first line of Lore	\N	2	41
47	going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embar	https://i.picsum.photos/id/211/200/200.jpg?hmac=VJ4wl95YuQJMvM_1O83L3nSfTn20OxaVfWe0wNMZrIc	2	42
48	. It uses a dictionary of over 200 Latin words, combined with a handful 	https://i.picsum.photos/id/1076/200/200.jpg?hmac=KTOq4o7b6rXzwd8kYN0nWrPIeKI97mzxBdWhnn-o-Nc	2	43
49	ate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore 	https://i.picsum.photos/id/426/200/200.jpg?hmac=5auPuax0L2lXSIX0eJ2Qxa3HzmGUHCrGDPIEMAWgw7o	2	44
50	aliquip ex ea commodo co	\N	2	45
51	xplicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione volupta	\N	2	46
52	isci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis	\N	2	47
53	psum is that it has a more-or-less normal distribution of letters, as opposed to using 'C	https://i.picsum.photos/id/522/200/200.jpg?hmac=-4K81k9CA5C9S2DWiH5kP8rMvaAPk2LByYZHP9ejTjA	2	48
54	el text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Variou	\N	2	49
55	pular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Lati	https://i.picsum.photos/id/305/200/200.jpg?hmac=GAm9fW477iVRZTOeQCdEqLVug4lTf8wnHHzLof8RbFQ	2	50
56	he majority have suffered alteration in some form, by injected humour, or randomised	\N	2	51
57	 of classical Latin literature from 45 BC, making it over 2000 years old. Richard M	https://i.picsum.photos/id/209/200/200.jpg?hmac=hsby8v-4ueyQ64FWn-Eqn4P9AtOM7OCsjA_L8rxOwHM	2	52
58	e Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the 	https://i.picsum.photos/id/679/200/200.jpg?hmac=sPsw4YJPQkWFqo2k5UycejGhY4UXvaDXStGmvJEhFBA	2	53
59	se on the theory of ethics, very popular during the Renaissance. The first line of Lore	\N	2	54
60	going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embar	https://i.picsum.photos/id/211/200/200.jpg?hmac=VJ4wl95YuQJMvM_1O83L3nSfTn20OxaVfWe0wNMZrIc	2	55
61	. It uses a dictionary of over 200 Latin words, combined with a handful 	https://i.picsum.photos/id/1076/200/200.jpg?hmac=KTOq4o7b6rXzwd8kYN0nWrPIeKI97mzxBdWhnn-o-Nc	2	56
62	ate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore 	https://i.picsum.photos/id/426/200/200.jpg?hmac=5auPuax0L2lXSIX0eJ2Qxa3HzmGUHCrGDPIEMAWgw7o	2	57
63	aliquip ex ea commodo co	\N	2	58
64	xplicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione volupta	\N	2	59
65	isci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis	\N	2	60
66	psum is that it has a more-or-less normal distribution of letters, as opposed to using 'C	https://i.picsum.photos/id/522/200/200.jpg?hmac=-4K81k9CA5C9S2DWiH5kP8rMvaAPk2LByYZHP9ejTjA	2	61
67	el text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Variou	\N	2	62
69	he majority have suffered alteration in some form, by injected humour, or randomised	\N	2	64
70	 of classical Latin literature from 45 BC, making it over 2000 years old. Richard M	https://i.picsum.photos/id/209/200/200.jpg?hmac=hsby8v-4ueyQ64FWn-Eqn4P9AtOM7OCsjA_L8rxOwHM	2	65
71	e Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the 	https://i.picsum.photos/id/679/200/200.jpg?hmac=sPsw4YJPQkWFqo2k5UycejGhY4UXvaDXStGmvJEhFBA	2	66
72	se on the theory of ethics, very popular during the Renaissance. The first line of Lore	\N	2	67
73	going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embar	https://i.picsum.photos/id/211/200/200.jpg?hmac=VJ4wl95YuQJMvM_1O83L3nSfTn20OxaVfWe0wNMZrIc	2	68
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email, password, role, avatar) FROM stdin;
15	maolao	maolao@gmail.com	$2a$10$jFCLh18KgHGl5.DLv9.Kyeyl/ftj3Z/LVbQsi1INBTXG31PhIEEYe	ROLE_USER	https://avatars.dicebear.com/v2/female/1c34c7c84bed4df4db76437afc04adfd.svg
13	andyzhangff	m13816475399@gmail.com	$2a$10$a//pzzzsGC4tZRBXVhM.wuAke370II96G9atbkn/dOtHDor7TblcG	ROLE_ADMIN	https://gravatar.com/avatar/1c34c7c84bed4df4db76437afc04adfd?s=400&d=robohash&r=x
14	zoez	zoe@gmail.com	$2a$10$aevElyP0bA8xDshCvxM.Uu2j.LzCJA/nYqrl5JnsA1vj64kKUgXQG	ROLE_USER	https://robohash.org/1c34c7c84bed4df4db76437afc04adfd?set=set4&bgset=&size=400x400
\.


--
-- Name: container_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.container_id_seq', 13, true);


--
-- Name: ingrediants-sample_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ingrediants-sample_id_seq"', 20, true);


--
-- Name: ingredient_price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ingredient_price_id_seq', 36, true);


--
-- Name: labels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.labels_id_seq', 13, true);


--
-- Name: ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ratings_id_seq', 38, true);


--
-- Name: recipe-ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."recipe-ingredients_id_seq"', 309, true);


--
-- Name: recipe_labels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recipe_labels_id_seq', 60, true);


--
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recipes_id_seq', 68, true);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 6, true);


--
-- Name: shopping_cart_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopping_cart_detail_id_seq', 14, true);


--
-- Name: shopping_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopping_cart_id_seq', 18, true);


--
-- Name: steps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.steps_id_seq', 73, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 17, true);


--
-- Name: container container_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.container
    ADD CONSTRAINT container_pk PRIMARY KEY (name);


--
-- Name: ingredient_price ingredient_price_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredient_price
    ADD CONSTRAINT ingredient_price_pk PRIMARY KEY (id);


--
-- Name: ingredients_sample ingredients_sample_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients_sample
    ADD CONSTRAINT ingredients_sample_pk PRIMARY KEY (description);


--
-- Name: labels labels_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.labels
    ADD CONSTRAINT labels_pk PRIMARY KEY (name);


--
-- Name: ratings ratings_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pk PRIMARY KEY ("user", recipe_id);


--
-- Name: recipe_ingredients recipe-ingredients_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe_ingredients
    ADD CONSTRAINT "recipe-ingredients_pk" PRIMARY KEY (id);


--
-- Name: recipe_labels recipe_labels_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe_labels
    ADD CONSTRAINT recipe_labels_pk PRIMARY KEY (id);


--
-- Name: recipes_title recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_title
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (id);


--
-- Name: recipes_title recipes_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_title
    ADD CONSTRAINT recipes_title_key UNIQUE (title);


--
-- Name: role role_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pk PRIMARY KEY (name);


--
-- Name: shopping_cart_detail shopping_cart_detail_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart_detail
    ADD CONSTRAINT shopping_cart_detail_pk PRIMARY KEY (id);


--
-- Name: shopping_cart shopping_cart_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart
    ADD CONSTRAINT shopping_cart_pk PRIMARY KEY (id);


--
-- Name: shopping_cart shopping_cart_username_recipe_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart
    ADD CONSTRAINT shopping_cart_username_recipe_id_key UNIQUE (username, recipe_id);


--
-- Name: steps steps_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.steps
    ADD CONSTRAINT steps_pk PRIMARY KEY (id);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (username);


--
-- Name: container_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX container_id_uindex ON public.container USING btree (id);


--
-- Name: container_name_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX container_name_uindex ON public.container USING btree (name);


--
-- Name: ingrediants-sample_description_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "ingrediants-sample_description_uindex" ON public.ingredients_sample USING btree (description);


--
-- Name: ingrediants-sample_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "ingrediants-sample_id_uindex" ON public.ingredients_sample USING btree (id);


--
-- Name: ingredient_price_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ingredient_price_id_uindex ON public.ingredient_price USING btree (id);


--
-- Name: ingredient_price_ingredient_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ingredient_price_ingredient_uindex ON public.ingredient_price USING btree (ingredient);


--
-- Name: labels_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX labels_id_uindex ON public.labels USING btree (id);


--
-- Name: labels_name_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX labels_name_uindex ON public.labels USING btree (name);


--
-- Name: ratings_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ratings_id_uindex ON public.ratings USING btree (id);


--
-- Name: recipe-ingredients_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "recipe-ingredients_id_uindex" ON public.recipe_ingredients USING btree (id);


--
-- Name: recipe_labels_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX recipe_labels_id_uindex ON public.recipe_labels USING btree (id);


--
-- Name: role_name_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX role_name_uindex ON public.role USING btree (name);


--
-- Name: shopping_cart_detail_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX shopping_cart_detail_id_uindex ON public.shopping_cart_detail USING btree (id);


--
-- Name: shopping_cart_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX shopping_cart_id_uindex ON public.shopping_cart USING btree (id);


--
-- Name: steps_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX steps_id_uindex ON public.steps USING btree (id);


--
-- Name: users_email_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_email_uindex ON public.users USING btree (email);


--
-- Name: users_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_id_uindex ON public.users USING btree (id);


--
-- Name: users_username_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_username_uindex ON public.users USING btree (username);


--
-- Name: ingredient_price ingredient_price_container_name_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredient_price
    ADD CONSTRAINT ingredient_price_container_name_fk FOREIGN KEY (container) REFERENCES public.container(name);


--
-- Name: ingredient_price ingredient_price_ingredients_sample_description_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredient_price
    ADD CONSTRAINT ingredient_price_ingredients_sample_description_fk FOREIGN KEY (ingredient) REFERENCES public.ingredients_sample(description);


--
-- Name: ratings ratings_recipes_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_recipes_id_fk FOREIGN KEY (recipe_id) REFERENCES public.recipes_title(id);


--
-- Name: ratings ratings_users_username_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_users_username_fk FOREIGN KEY ("user") REFERENCES public.users(username);


--
-- Name: recipe_ingredients recipe_ingredients_container_name_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe_ingredients
    ADD CONSTRAINT recipe_ingredients_container_name_fk FOREIGN KEY (container) REFERENCES public.container(name);


--
-- Name: recipe_ingredients recipe_ingredients_ingredients_sample_description_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe_ingredients
    ADD CONSTRAINT recipe_ingredients_ingredients_sample_description_fk FOREIGN KEY (ingredient) REFERENCES public.ingredients_sample(description);


--
-- Name: recipe_ingredients recipe_ingredients_recipes_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe_ingredients
    ADD CONSTRAINT recipe_ingredients_recipes_id_fk FOREIGN KEY (recipe_id) REFERENCES public.recipes_title(id);


--
-- Name: recipe_labels recipe_labels_labels_name_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe_labels
    ADD CONSTRAINT recipe_labels_labels_name_fk FOREIGN KEY (label) REFERENCES public.labels(name);


--
-- Name: recipe_labels recipe_labels_recipes_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe_labels
    ADD CONSTRAINT recipe_labels_recipes_id_fk FOREIGN KEY (recipe_id) REFERENCES public.recipes_title(id);


--
-- Name: shopping_cart_detail shopping_cart_detail_container_name_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart_detail
    ADD CONSTRAINT shopping_cart_detail_container_name_fk FOREIGN KEY (container) REFERENCES public.container(name);


--
-- Name: shopping_cart_detail shopping_cart_detail_ingredients_sample_description_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart_detail
    ADD CONSTRAINT shopping_cart_detail_ingredients_sample_description_fk FOREIGN KEY (ingredient_name) REFERENCES public.ingredients_sample(description);


--
-- Name: shopping_cart_detail shopping_cart_detail_recipes_title_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart_detail
    ADD CONSTRAINT shopping_cart_detail_recipes_title_id_fk FOREIGN KEY (recipe_id) REFERENCES public.recipes_title(id);


--
-- Name: shopping_cart_detail shopping_cart_detail_users_username_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart_detail
    ADD CONSTRAINT shopping_cart_detail_users_username_fk FOREIGN KEY (username) REFERENCES public.users(username);


--
-- Name: shopping_cart shopping_cart_recipes_title_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart
    ADD CONSTRAINT shopping_cart_recipes_title_id_fk FOREIGN KEY (recipe_id) REFERENCES public.recipes_title(id);


--
-- Name: shopping_cart shopping_cart_users_username_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart
    ADD CONSTRAINT shopping_cart_users_username_fk FOREIGN KEY (username) REFERENCES public.users(username);


--
-- Name: steps steps_recipes_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.steps
    ADD CONSTRAINT steps_recipes_id_fk FOREIGN KEY (recipe_id) REFERENCES public.recipes_title(id);


--
-- Name: users users_role_name_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_name_fk FOREIGN KEY (role) REFERENCES public.role(name);


--
-- PostgreSQL database dump complete
--

