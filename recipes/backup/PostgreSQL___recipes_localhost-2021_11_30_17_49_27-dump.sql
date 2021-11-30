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

SET default_tablespace = '';

SET default_table_access_method = heap;

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
-- Name: shopping_cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart ALTER COLUMN id SET DEFAULT nextval('public.shopping_cart_id_seq'::regclass);


--
-- Name: shopping_cart_detail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart_detail ALTER COLUMN id SET DEFAULT nextval('public.shopping_cart_detail_id_seq'::regclass);


--
-- Data for Name: shopping_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopping_cart (id, username, shoping_date, eat_time, recipe_id) FROM stdin;
2	andyzhangff	2021-11-29	dinner	54
9	zoez	2021-11-30	breakfast	68
12	zoez	2021-11-30	breakfast	47
7	maolao	2021-11-29	lauch	43
11	andyzhangff	2021-11-29	dinner	64
8	andyzhangff	2021-11-29	dinner	40
5	andyzhangff	2021-11-29	dinner	51
10	maolao	2021-11-29	lauch	66
6	zoez	2021-11-30	breakfast	61
3	zoez	2021-11-30	breakfast	58
1	maolao	2021-11-29	lauch	41
4	maolao	2021-11-29	lauch	50
\.


--
-- Data for Name: shopping_cart_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopping_cart_detail (id, username, ingredient_name, ingredient_quantity, recipe_id, ingredient_image, ingredient_price, container) FROM stdin;
\.


--
-- Name: shopping_cart_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopping_cart_detail_id_seq', 8, true);


--
-- Name: shopping_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopping_cart_id_seq', 12, true);


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
-- Name: shopping_cart_detail_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX shopping_cart_detail_id_uindex ON public.shopping_cart_detail USING btree (id);


--
-- Name: shopping_cart_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX shopping_cart_id_uindex ON public.shopping_cart USING btree (id);


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
-- PostgreSQL database dump complete
--

