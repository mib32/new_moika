--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: banners_configs; Type: TABLE; Schema: public; Owner: moika; Tablespace: 
--

-- CREATE TABLE banners_configs (
--     id integer NOT NULL,
--     place character varying(255),
--     mode character varying(255),
--     created_at timestamp without time zone,
--     updated_at timestamp without time zone,
--     banner_id integer,
--     uploader_version character varying(255)
-- );


-- ALTER TABLE public.banners_configs OWNER TO moika;

--
-- Name: banners_configs_id_seq; Type: SEQUENCE; Schema: public; Owner: moika
--

-- CREATE SEQUENCE banners_configs_id_seq
--     START WITH 1
--     INCREMENT BY 1
--     NO MINVALUE
--     NO MAXVALUE
--     CACHE 1;


-- ALTER TABLE public.banners_configs_id_seq OWNER TO moika;

--
-- Name: banners_configs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: moika
--

-- ALTER SEQUENCE banners_configs_id_seq OWNED BY banners_configs.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: moika
--

-- ALTER TABLE ONLY banners_configs ALTER COLUMN id SET DEFAULT nextval('banners_configs_id_seq'::regclass);


--
-- Data for Name: banners_configs; Type: TABLE DATA; Schema: public; Owner: moika
--

COPY banners_configs (id, place, mode, created_at, updated_at, banner_id, uploader_version) FROM stdin;
16	top_1	\N	2014-04-20 18:51:52.053021	2014-04-20 18:51:52.053021	9022	b_385_220
18	top_3	\N	2014-04-20 18:51:52.117918	2014-04-20 18:51:52.117918	9032	b_385_220
20	bottom_1	\N	2014-04-20 18:51:52.179929	2014-04-20 18:51:52.179929	9041	b_385_220
21	bottom_2	\N	2014-04-20 18:51:52.209903	2014-04-20 18:51:52.209903	9042	b_385_220
22	bottom_3	\N	2014-04-20 18:51:52.239635	2014-04-20 18:51:52.239635	9048	b_385_220
23	bottom_4	\N	2014-04-20 18:51:52.271229	2014-04-20 18:51:52.271229	9050	b_385_220
24	left_1	\N	2014-04-20 18:51:52.302878	2014-04-20 18:51:52.302878	9055	b_190_160
25	left_2	\N	2014-04-20 18:51:52.3334	2014-04-20 18:51:52.3334	9059	b_190_280
26	left_3	\N	2014-04-20 18:51:52.363163	2014-04-20 18:51:52.363163	9063	b_190_160
27	comments_1	\N	2014-04-20 18:51:52.393639	2014-04-20 18:51:52.393639	9067	b_385_220
28	comments_2	\N	2014-04-20 18:51:52.430814	2014-04-20 18:51:52.430814	9071	b_385_220
29	requests_1	\N	2014-04-20 18:51:52.461738	2014-04-20 18:51:52.461738	9075	b_385_220
30	requests_2	\N	2014-04-20 18:51:52.490968	2014-04-20 18:51:52.490968	9079	b_385_220
19	top_4	\N	2014-04-20 18:51:52.147719	2014-04-21 15:07:02.356585	9034	b_385_220
17	top_2	\N	2014-04-20 18:51:52.087887	2014-05-18 12:55:55.333572	9027	b_385_220
\.


--
-- Name: banners_configs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: moika
--

-- SELECT pg_catalog.setval('banners_configs_id_seq', 30, true);


--
-- Name: banners_configs_pkey; Type: CONSTRAINT; Schema: public; Owner: moika; Tablespace: 
--

-- ALTER TABLE ONLY banners_configs
--     ADD CONSTRAINT banners_configs_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

