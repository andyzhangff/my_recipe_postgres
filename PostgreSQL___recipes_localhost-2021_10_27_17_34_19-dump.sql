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
    image character varying NOT NULL
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
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

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
    user_id integer NOT NULL,
    recipe_id bigint NOT NULL,
    ratings integer NOT NULL,
    favorite boolean DEFAULT false NOT NULL
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
    ingredient_id integer NOT NULL,
    quantity integer NOT NULL,
    container_id integer NOT NULL,
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
    label_id integer NOT NULL
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
-- Name: recipes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipes (
    id bigint NOT NULL,
    category character varying(255),
    description character varying(255),
    image character varying(255),
    owner_id integer NOT NULL,
    title character varying(255)
);


ALTER TABLE public.recipes OWNER TO postgres;

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
    role_id integer NOT NULL
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
-- Name: role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


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

COPY public.container (id, name, image) FROM stdin;
1	cup	https://i.picsum.photos/id/729/200/200.jpg?hmac=hCw_uurY9O39ITS0MMk7fNNdWPaY20TzXz2NTAkEslU
2	bottle	https://i.picsum.photos/id/223/200/200.jpg?hmac=CNNyWbBcEAJ7TPkTmEEwdGrLFEYkxpTeVwJ7U0LB30Y
3	kilo	https://i.picsum.photos/id/277/200/200.jpg?hmac=zlHjTbiytnfBWurpKXXSvMRzVSmkgW13o4K7Q-08r68
4	spoon	https://i.picsum.photos/id/416/200/200.jpg?hmac=QgMiXqHqKofoCv4h8lkrwRSOkn5Twkh15Dfl9Efvtwo
5	gram	https://i.picsum.photos/id/666/200/200.jpg?hmac=keuaJ7nJC5hkHIEyee1b6jdEMbHBZbozYQ9NClt2_lk
6	pound	https://i.picsum.photos/id/71/200/200.jpg?hmac=TxuNm2jDRRNlSKPRxG7HH5vT63Bl20fD7M81shzv45M
\.


--
-- Data for Name: ingredients_sample; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ingredients_sample (id, description, image) FROM stdin;
1	tomato	https://i.picsum.photos/id/75/200/200.jpg?hmac=iXY_MolS8m8RDrh8BblWo-XCw9TRR_YvkeuRIko1Q1A
2	salt	https://i.picsum.photos/id/118/200/200.jpg?hmac=r_5sQuuYCa3xJmO_wafQe_A_P-F2Kimwk-48579v9uY
3	garlic	https://i.picsum.photos/id/28/200/200.jpg?hmac=eT-kjSvX_wh2uU3SYgAuRWjzo4ndNGimCCiNEaWlnOg
4	rice	https://i.picsum.photos/id/1027/200/200.jpg?hmac=fiXlkLLwYm7JmmU80uRIj9g21XD4q9v_lM_2Z57UhuA
5	sugar	https://i.picsum.photos/id/1022/200/200.jpg?hmac=MjK2sur6luq2UfxMPWBFBuPyvZYyYLYvQH9kCmEGJRY
6	oil	https://i.picsum.photos/id/1051/200/200.jpg?hmac=s6d4ypEjpec8nvA2zqhWzx_6ogXYM2fJ_YJwaOM1CUA
7	pepper	https://i.picsum.photos/id/170/200/200.jpg?hmac=2Xh3j3MMZE07_G7UDPgPRm557LRHzyFrkyeWRXdhdvU
8	beef	https://i.picsum.photos/id/687/200/200.jpg?hmac=U-mrTuk3Y5M3brBJ76mYvaj-bZ3ggY1OD8YOIPw89uI
9	chicken	https://i.picsum.photos/id/351/200/200.jpg?hmac=E2C8OwTRNgbEan5RzifMH73ENtpcsHSr45mGFQk5mPU
10	lamb	https://i.picsum.photos/id/518/200/200.jpg?hmac=nY2cAnZ0_ItWhhAsJ_XL3RsNkDo7_zobodK8FWIoCDM
\.


--
-- Data for Name: labels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.labels (id, name, image) FROM stdin;
1	chicken	https://i.picsum.photos/id/473/200/200.jpg?hmac=lXsJQxtsh73ygSCMmcWA-YqIpQ4FjdxUYkkuLTAPBfM
2	beef	https://i.picsum.photos/id/536/200/200.jpg?hmac=Ncz_gqWPnq2UI5u-tKvEfwaXLLhoc4ryLBjGJ7fjR1c
3	soup	https://i.picsum.photos/id/842/200/200.jpg?hmac=RW9iEgAYLKwoinQWSz_zrZHyOwmVEgqvoZTPebkRGMM
4	spicy	https://i.picsum.photos/id/927/200/200.jpg?hmac=8gJRiqNVrPAFPg0IyGTTYxaPJBSoLOVg4elvGEPV30M
5	noodle	https://i.picsum.photos/id/619/200/200.jpg?hmac=kS8OI8cYlvghz5FZaiYdIx96pUPQ30oF6bIsAg3AOZ4
6	fried	https://i.picsum.photos/id/421/200/200.jpg?hmac=Kix073-H73pkRedH4XJ8fenHLI9Sd9akWlOFjKog0EA
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ratings (id, user_id, recipe_id, ratings, favorite) FROM stdin;
\.


--
-- Data for Name: recipe_ingredients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipe_ingredients (id, ingredient_id, quantity, container_id, recipe_id) FROM stdin;
1	1	3	1	1
2	2	2	2	1
3	3	22	3	1
4	3	22	3	2
5	4	11	4	2
6	5	9	5	2
7	8	99	1	3
8	9	88	3	3
9	10	77	6	3
\.


--
-- Data for Name: recipe_labels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipe_labels (id, recipe_id, label_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
6	6	6
7	7	1
8	8	2
9	9	3
10	10	4
11	11	5
12	12	6
13	13	1
14	14	2
15	15	3
16	16	4
17	17	5
18	18	6
19	19	1
20	20	2
21	21	3
22	22	4
23	23	5
24	24	6
25	25	1
26	26	2
27	27	3
28	28	4
29	29	5
30	30	6
\.


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipes (id, category, description, image, owner_id, title) FROM stdin;
1	noodle	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut risus vel lorem pulvinar vestibulum. Proin eget tincidunt nisl, quis ornare tortor. Sed porta convallis m	https://i.picsum.photos/id/458/250/150.jpg?hmac=QtTVZOFzTujCuGdA0DkjYwznNinWqYbwM1Yu7bphQEY	1	Noodle1
2	noodle	Curabitur viverra convallis est, in rhoncus felis aliquam nec. Fusce vulputate turpis velit, non auctor ex tristique eget. Curabitur pharetra sit amet dui at semper. Cras eleifend sagittis lorem, in iaculis lor	https://i.picsum.photos/id/273/250/150.jpg?hmac=v9j-RTp2NGIbcnfzo1wCMaL0iARYj1bCyb_FdOlS_84	1	Noodle2
3	noodle	In id sem vel sapien blandit porta ut in nisi. Duis consectetur neque metus, eu tempus leo rhoncus in. Aenean dictum quis lectus vitae ullamcorper. Vivamus ultricies risus leo, quis pellentesque	https://i.picsum.photos/id/640/250/150.jpg?hmac=xMXA2zfjFDGXCgvOIc9oUDscYbIsw7RDDxa5XkmrU2Q	1	Noodle3
4	noodle	Phasellus id dapibus magna. Quisque gravida rhoncus dui nec placerat. Donec bibendum nisl quis dignissim semper. Donec cursus placerat ligula scelerisque malesuada. Ve	https://i.picsum.photos/id/696/250/150.jpg?hmac=lV6cSFhOR38MQIFSRZUSzlG4UADhjE55KY83jhMnnpM	1	Noodle4
5	noodle	Sed porttitor ullamcorper ex quis condimentum. Ut nibh nisi, gravida eget nisi id, mollis cursus lectus. Phasellus a massa eleifend, imperdiet eros nec, tristique ligula. Donec co	https://i.picsum.photos/id/942/250/150.jpg?hmac=aaMfer_m_gJt-Tb-kUKPOwWlTyG40p7YBBvtvaspKFA	1	Noodle5
6	noodle	Sed commodo, nibh vel suscipit molestie, sem libero lobortis lorem, eu accumsan leo lorem a arcu. Cras sed felis neque. Orci varius natoque penatibus et magnis dis partu	https://i.picsum.photos/id/864/250/150.jpg?hmac=M5OknDI6p8MDeqriif-TiJVGHJslFVCVjjP4HmTYZgE	1	Noodle6
7	noodle	Sed luctus nibh id ullamcorper facilisis. Aliquam placerat diam enim, non ultrices ex consequat eu. Maecenas fermentum diam leo, eu accumsan mauris tincidunt vitae. Do	https://i.picsum.photos/id/838/250/150.jpg?hmac=6k77YyIc7mFRuNn7f0FpQVqfpnW-LzefuD349sgz2Iw	1	Noodle7
8	noodle	Nunc tempor justo est, at semper ligula venenatis sed. Sed ultrices sem quam, eget ullamcorper sapien semper nec. Praesent bibendum sem a purus tristique, in mal	https://i.picsum.photos/id/873/250/150.jpg?hmac=tu-tIPA9t1_0BG1EYZvtRERbYJsTDgm9or2qslYGFhg	1	Noodle8
9	noodle	Cras sodales, risus non vehicula feugiat, eros augue pharetra justo, eget elementum justo nisi nec ligula. Sed placerat felis sit amet ipsum venenatis sollicitudin. Mauris sit amet mau	https://i.picsum.photos/id/1062/250/150.jpg?hmac=WEDSJ0P4nqcQlh9q_Px68GK74BDqbSUYomRbYnbStIo	1	Noodle9
10	noodle	at blandit ex nisl vitae felis. Sed cursus nec ex non cursus. Suspendisse vitae egestas libero. Fusce laoreet nulla nec lorem mollis ornare. In hac habitasse platea dict	https://i.picsum.photos/id/237/250/150.jpg?hmac=43EMcrOyJ-hIu7amlRAysS8kt4FcDPnf1XDzAjIqy90	1	Noodle10
11	chicken	aecenas hendrerit nisi in condimentum dictum. Nam tincidunt, dui in egestas gravida, mauris sem molestie odio, at tempus lorem est quis velit. Phasellus vitae consequat ips	https://i.picsum.photos/id/607/250/150.jpg?hmac=G_e4CPIDOhukq55HMLlDiR1RjQCkvPiK0Nr-urh3f0g	2	Chicken1
12	chicken	us. Fusce eget fermentum mi. Pellentesque porta commodo leo, in euismod leo ultricies maximus. Curabitur vel accumsan ipsum, rutrum ullamcorper neque. Vestibu	https://i.picsum.photos/id/156/250/150.jpg?hmac=BaD8kY9PKlyuL6kEFS0ua6wC1wWPQbVYxTzkulC0ZeU	2	Chicken2
13	chicken	ellus venenatis nec odio vel tempus. Nam auctor risus lorem, hendrerit ullamcorper lorem dapibus eu. Aenean eget nisi a massa volutpat posuere. Sed tempus eleifend libero vel com	https://i.picsum.photos/id/371/250/150.jpg?hmac=KCvTiKcIQQ1sMcMvbV3ljwEbPk4TL8qvzoiPA1k8yN0	2	Chicken3
14	chicken	on massa ultricies, euismod velit id, laoreet dui. Phasellus et diam eget enim accumsan bibendum. Nulla facilisi. Aliquam posuere ante libero, sed bibendum nibh elemen	https://i.picsum.photos/id/672/250/150.jpg?hmac=oW47T00M0_DmY8znVIqjkhQuZQHEzG4erscGCO6XZyg	2	Chicken4
15	chicken	Etiam id nibh nec ante eleifend condimentum. Praesent eros lacus, imperdiet a nisi non, interdum sollicitudin risus. Vestibulum vehicula iaculis dolor, at bibendum lor	https://i.picsum.photos/id/385/250/150.jpg?hmac=yUYC8W2h5XDhW90N-yVtan6XRIqAwbCX7naI7TFsVPE	2	Chicken5
16	chicken	tae urna at leo vestibulum eleifend vel a leo. Maecenas nec ipsum interdum, blandit orci sit amet, porta justo. Vestibulum sed odio at orci accumsan malesuada vel ut augue. Phasell	https://i.picsum.photos/id/45/250/150.jpg?hmac=EUnK4OS7VdgEPzDqWCEamoOHZSTQTeE6xlQBvDa0wkU	2	Chicken6
17	chicken	ugiat eget eros condimentum porta. Vestibulum egestas mi eget erat lobortis volutpat ut sit amet dui. Vivamus rhoncus quam sit amet libero placerat	https://i.picsum.photos/id/133/250/150.jpg?hmac=n6BxBH1WRPkDDowe2zJXYK_pNtDBVC5BGfJ2qUTYNi8	2	Chicken7
18	chicken	bus. Aliquam ipsum nisl, varius quis elementum vitae, accumsan vel lacus. Sed risus magna, ultrices sit amet varius sed, condimentum eget ligul	https://i.picsum.photos/id/640/250/150.jpg?hmac=xMXA2zfjFDGXCgvOIc9oUDscYbIsw7RDDxa5XkmrU2Q	2	Chicken8
19	chicken	t bibendum. Fusce rutrum, nibh ac facilisis posuere, velit massa aliquet sem, egestas blandit erat dui sit amet neque. Phasellus blandit placerat tincidun	https://i.picsum.photos/id/902/250/150.jpg?hmac=1DvxIkRQodn91LceW0Lz7K8ghKl6xk5CwrYKGMrforw	2	Chicken9
20	chicken	fringilla nisl, eget commodo metus tortor ut nibh. Sed accumsan, nisi sit amet viverra finibus, nisl lectus accumsan dui, posuere rhoncus dolor lacus nec ipsum. Cras va	https://i.picsum.photos/id/473/250/150.jpg?hmac=PTp8-TxgZx4wq2GIvCdPp3OJLPrFZSte9ysP8hSuQnk	2	Chicken10
21	beef	ugiat venenatis. Phasellus nec enim nec augue tincidunt euismod in quis magna. Aenean malesuada m	https://i.picsum.photos/id/886/250/150.jpg?hmac=TDFac04bP0mx20PtICnTUzs_S6NKrNd7SwgMOBg_4W0	3	Beef1
22	beef	nec vestibulum diam convallis eget. Quisque ut pellentesque nunc. In hac habitasse platea dictumst. Etiam vulputate turpis mauris, a suscipit enim porttitor eu.	https://i.picsum.photos/id/39/250/150.jpg?hmac=OUDZAqGkIf2mj18Z4jqRt7fwxp1y7bentfytBCebIq4	3	Beef2
23	beef	odales, urna non efficitur malesuada, ex risus sollicitudin lectus, et rhoncus arcu eros a libero. Cras vestibulum rutrum risus eu efficitur. Maecenas at mollis	https://i.picsum.photos/id/604/250/150.jpg?hmac=n4kx5Ri31WjcpiWuDg68UcPyXzQbhE7s9VY_EB-e0II	3	Beef3
24	beef	Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aenean quam arcu, commodo eu rhoncus eu, pr	https://i.picsum.photos/id/6/250/150.jpg?hmac=HhlpSgw60utnQaFfo6RCiJWst428ZYaWmOPTgocaL_E	3	Beef4
25	beef	am vel magna nunc. Praesent vehicula lorem auctor odio semper, quis mattis ar	https://i.picsum.photos/id/651/250/150.jpg?hmac=-jxzAmTy0B1EzLv4x3s5ZTDCyndrACoq7IiV9vRvVHQ	3	Beef5
26	beef	am vel magna nunc. Praesent vehicula lorem auctor odio semper, quis mattis ar	https://i.picsum.photos/id/992/250/150.jpg?hmac=qzIMVFM4MdgozyKtrJzxq6bFjnwj7MADEPPRyio4uvA	3	Beef6
27	beef	ero velit, et congue risus placerat nec. Praesent non quam molestie, euismod nunc vitae, pharetra nulla. Aenean vitae ultrices neque, nec elementum m	https://i.picsum.photos/id/260/250/150.jpg?hmac=G49upo_hfLexlhljyQUMYRghW5Jo0CLPakAWfuzaEBE	3	Beef7
28	beef	s a aliquet convallis, facilisis eget purus. Etiam vestibulum rhoncus neque, vitae lobortis tortor finibus eu. In porta dui non libero vulputate, at tempor purus maximus.	https://i.picsum.photos/id/213/250/150.jpg?hmac=9nwGSfHAmQ7s6SvNI2mrYAyVml_3XTsdytTb8QJG5bA	3	Beef8
29	beef	Donec at pharetra justo. Sed posuere, mi sit amet fringilla hendrerit, tortor n	https://i.picsum.photos/id/545/250/150.jpg?hmac=ToFk90I6i7nBiou8pBm6KgbgdyVtCjJgX-xQP1quBQQ	3	Beef9
30	beef	bitur nec pulvinar diam. Maecenas rhoncus et sapien a venenatis. Duis commodo tellus at purus pellentesque, nec malesuada libero ultrices. Sed euismod l	https://i.picsum.photos/id/1012/250/150.jpg?hmac=MhWt7YRsrKalhTINzd3G4WTqz_HXpB9Kml9HAeO5-ks	3	Beef10
31	laudantium	voluptate blanditiis quia	http://placeimg.com/640/480	1	quidem
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, name, access) FROM stdin;
1	admin	full
2	user	write
3	tourist	read
\.


--
-- Data for Name: steps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.steps (id, description, image, steps_number, recipe_id) FROM stdin;
1	psum is that it has a more-or-less normal distribution of letters, as opposed to using 'C	https://i.picsum.photos/id/522/200/200.jpg?hmac=-4K81k9CA5C9S2DWiH5kP8rMvaAPk2LByYZHP9ejTjA	1	1
2	el text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Variou	\N	2	1
3	pular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Lati	https://i.picsum.photos/id/305/200/200.jpg?hmac=GAm9fW477iVRZTOeQCdEqLVug4lTf8wnHHzLof8RbFQ	3	1
4	he majority have suffered alteration in some form, by injected humour, or randomised	\N	4	1
5	 of classical Latin literature from 45 BC, making it over 2000 years old. Richard M	https://i.picsum.photos/id/209/200/200.jpg?hmac=hsby8v-4ueyQ64FWn-Eqn4P9AtOM7OCsjA_L8rxOwHM	1	2
6	e Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the 	https://i.picsum.photos/id/679/200/200.jpg?hmac=sPsw4YJPQkWFqo2k5UycejGhY4UXvaDXStGmvJEhFBA	2	2
7	se on the theory of ethics, very popular during the Renaissance. The first line of Lore	\N	3	2
8	going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embar	https://i.picsum.photos/id/211/200/200.jpg?hmac=VJ4wl95YuQJMvM_1O83L3nSfTn20OxaVfWe0wNMZrIc	1	3
9	. It uses a dictionary of over 200 Latin words, combined with a handful 	https://i.picsum.photos/id/1076/200/200.jpg?hmac=KTOq4o7b6rXzwd8kYN0nWrPIeKI97mzxBdWhnn-o-Nc	2	3
10	ate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore 	https://i.picsum.photos/id/426/200/200.jpg?hmac=5auPuax0L2lXSIX0eJ2Qxa3HzmGUHCrGDPIEMAWgw7o	3	3
11	aliquip ex ea commodo co	\N	1	4
12	xplicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione volupta	\N	2	4
13	isci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis	\N	3	4
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email, password, role_id) FROM stdin;
1	andyzhangff	m13816475399@gmail.com	andy@1987	1
2	zoez	zoe@gmail.com	zoe@1988	2
3	maolao	maolao@gmail.com	maolao@1962	3
\.


--
-- Name: container_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.container_id_seq', 6, true);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 31, true);


--
-- Name: ingrediants-sample_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ingrediants-sample_id_seq"', 10, true);


--
-- Name: labels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.labels_id_seq', 6, true);


--
-- Name: ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ratings_id_seq', 1, false);


--
-- Name: recipe-ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."recipe-ingredients_id_seq"', 9, true);


--
-- Name: recipe_labels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recipe_labels_id_seq', 30, true);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 3, true);


--
-- Name: steps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.steps_id_seq', 13, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: container container_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.container
    ADD CONSTRAINT container_pk PRIMARY KEY (id);


--
-- Name: ingredients_sample ingrediants-sample_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients_sample
    ADD CONSTRAINT "ingrediants-sample_pk" PRIMARY KEY (id);


--
-- Name: labels labels_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.labels
    ADD CONSTRAINT labels_pk PRIMARY KEY (id);


--
-- Name: ratings ratings_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pk PRIMARY KEY (id);


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
-- Name: recipes recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (id);


--
-- Name: role role_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pk PRIMARY KEY (id);


--
-- Name: steps steps_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.steps
    ADD CONSTRAINT steps_pk PRIMARY KEY (id);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


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
-- Name: ratings ratings_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: recipe_ingredients recipe_ingredients_container_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe_ingredients
    ADD CONSTRAINT recipe_ingredients_container_id_fk FOREIGN KEY (container_id) REFERENCES public.container(id);


--
-- Name: recipe_ingredients recipe_ingredients_ingredients_sample_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe_ingredients
    ADD CONSTRAINT recipe_ingredients_ingredients_sample_id_fk FOREIGN KEY (ingredient_id) REFERENCES public.ingredients_sample(id);


--
-- Name: recipe_labels recipe_labels_labels_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe_labels
    ADD CONSTRAINT recipe_labels_labels_id_fk FOREIGN KEY (label_id) REFERENCES public.labels(id);


--
-- Name: users users_role_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fk FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- PostgreSQL database dump complete
--

