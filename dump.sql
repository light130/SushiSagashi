--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.17
-- Dumped by pg_dump version 9.6.17

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: comment_favorites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment_favorites (
    id bigint NOT NULL,
    user_id bigint,
    comment_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.comment_favorites OWNER TO postgres;

--
-- Name: comment_favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comment_favorites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_favorites_id_seq OWNER TO postgres;

--
-- Name: comment_favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comment_favorites_id_seq OWNED BY public.comment_favorites.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    content text,
    user_id bigint,
    shop_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: shop_favorites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_favorites (
    id bigint NOT NULL,
    user_id bigint,
    shop_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.shop_favorites OWNER TO postgres;

--
-- Name: shop_favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_favorites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_favorites_id_seq OWNER TO postgres;

--
-- Name: shop_favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_favorites_id_seq OWNED BY public.shop_favorites.id;


--
-- Name: shops; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shops (
    id bigint NOT NULL,
    name character varying NOT NULL,
    address character varying NOT NULL,
    budget_lunch integer,
    opening_hours character varying,
    picture character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    budget_dinner integer,
    day_off character varying,
    phone_number character varying
);


ALTER TABLE public.shops OWNER TO postgres;

--
-- Name: shops_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shops_id_seq OWNER TO postgres;

--
-- Name: shops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shops_id_seq OWNED BY public.shops.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    admin boolean DEFAULT false,
    avatar character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
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
-- Name: comment_favorites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_favorites ALTER COLUMN id SET DEFAULT nextval('public.comment_favorites_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: shop_favorites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_favorites ALTER COLUMN id SET DEFAULT nextval('public.shop_favorites_id_seq'::regclass);


--
-- Name: shops id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shops ALTER COLUMN id SET DEFAULT nextval('public.shops_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2020-03-16 03:37:26.476173	2020-03-16 03:37:26.476173
\.


--
-- Data for Name: comment_favorites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment_favorites (id, user_id, comment_id, created_at, updated_at) FROM stdin;
10	1	1	2020-03-30 04:22:29.605249	2020-03-30 04:22:29.605249
\.


--
-- Name: comment_favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_favorites_id_seq', 42, true);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (id, content, user_id, shop_id, created_at, updated_at) FROM stdin;
1	ああ	1	1	2020-03-19 08:34:07.873003	2020-03-19 08:34:07.873003
2	あいう	2	1	2020-03-24 13:33:55.572641	2020-03-24 13:33:55.572641
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_id_seq', 2, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20190809072858
20190817105255
20190817150001
20190825093736
20190828125136
20190829151322
20190901042801
20190905082216
20190908101903
20190908102219
20190908143720
20190911071607
20190911071656
20190920070943
20191004143207
20191008105255
20191008105358
20191011143233
20191101102750
20191101145230
\.


--
-- Data for Name: shop_favorites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_favorites (id, user_id, shop_id, created_at, updated_at) FROM stdin;
95	2	1	2020-04-01 15:49:43.012293	2020-04-01 15:49:43.012293
\.


--
-- Name: shop_favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_favorites_id_seq', 95, true);


--
-- Data for Name: shops; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shops (id, name, address, budget_lunch, opening_hours, picture, user_id, created_at, updated_at, latitude, longitude, budget_dinner, day_off, phone_number) FROM stdin;
1	鮨 石島 本店	東京都中央区銀座1-24-3	2000	午前12時~午後9時	PPS_aburisa-mon_TP_V4.jpg	1	2020-03-16 04:49:18.310804	2020-03-16 04:49:18.310804	35.6736483500000006	139.770236750310005	20000	日曜日、祝日	03-6228-6539
\.


--
-- Name: shops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shops_id_seq', 5, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, created_at, updated_at, admin, avatar) FROM stdin;
1	admin	admin@example.com	$2a$11$gMTakEmMBkUML6elD5JtFONvj1V.sWccC3QqqXwrFvqZgtfbNQL06	\N	\N	\N	sTtssxfkSGqawuTxARXZ	2020-03-16 04:12:55.815188	2020-03-16 04:12:16.13853	\N	2020-03-16 04:10:58.088102	2020-03-16 04:13:39.175858	t	\N
2	Kosuke	light13silver@gmail.com	$2a$11$KaEpeDs0p1WNIo/it6WHne46at/L04zrrA2VzcSSzeiEWUmv58V0y	\N	\N	\N	ZxW1zQvxjF8teNr_YiL8	2020-03-24 05:51:49.490058	2020-03-24 05:51:30.059399	\N	2020-03-24 05:51:30.059224	2020-03-24 05:51:49.490523	f	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: comment_favorites comment_favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_favorites
    ADD CONSTRAINT comment_favorites_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: shop_favorites shop_favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_favorites
    ADD CONSTRAINT shop_favorites_pkey PRIMARY KEY (id);


--
-- Name: shops shops_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shops
    ADD CONSTRAINT shops_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_comment_favorites_on_comment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_comment_favorites_on_comment_id ON public.comment_favorites USING btree (comment_id);


--
-- Name: index_comment_favorites_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_comment_favorites_on_user_id ON public.comment_favorites USING btree (user_id);


--
-- Name: index_comment_favorites_on_user_id_and_comment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_comment_favorites_on_user_id_and_comment_id ON public.comment_favorites USING btree (user_id, comment_id);


--
-- Name: index_comments_on_shop_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_comments_on_shop_id ON public.comments USING btree (shop_id);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_comments_on_user_id ON public.comments USING btree (user_id);


--
-- Name: index_shop_favorites_on_shop_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_shop_favorites_on_shop_id ON public.shop_favorites USING btree (shop_id);


--
-- Name: index_shop_favorites_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_shop_favorites_on_user_id ON public.shop_favorites USING btree (user_id);


--
-- Name: index_shop_favorites_on_user_id_and_shop_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_shop_favorites_on_user_id_and_shop_id ON public.shop_favorites USING btree (user_id, shop_id);


--
-- Name: index_shops_on_address_and_budget_lunch; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_shops_on_address_and_budget_lunch ON public.shops USING btree (address, budget_lunch);


--
-- Name: index_shops_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_shops_on_user_id ON public.shops USING btree (user_id);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: comments fk_rails_03de2dc08c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_03de2dc08c FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: shop_favorites fk_rails_1e09b5dabf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_favorites
    ADD CONSTRAINT fk_rails_1e09b5dabf FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: comment_favorites fk_rails_88c36f52c3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_favorites
    ADD CONSTRAINT fk_rails_88c36f52c3 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: shop_favorites fk_rails_b28c66d34e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_favorites
    ADD CONSTRAINT fk_rails_b28c66d34e FOREIGN KEY (shop_id) REFERENCES public.shops(id);


--
-- Name: shops fk_rails_bbda09dc47; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shops
    ADD CONSTRAINT fk_rails_bbda09dc47 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: comments fk_rails_ee0ee8967a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_ee0ee8967a FOREIGN KEY (shop_id) REFERENCES public.shops(id);


--
-- Name: comment_favorites fk_rails_f9f3a59165; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_favorites
    ADD CONSTRAINT fk_rails_f9f3a59165 FOREIGN KEY (comment_id) REFERENCES public.comments(id);


--
-- PostgreSQL database dump complete
--

