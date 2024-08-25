--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: user_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_info (
    user_info_id integer NOT NULL,
    username character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.user_info OWNER TO freecodecamp;

--
-- Name: user_info_user_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_info_user_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_info_user_info_id_seq OWNER TO freecodecamp;

--
-- Name: user_info_user_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_info_user_info_id_seq OWNED BY public.user_info.user_info_id;


--
-- Name: user_info user_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info ALTER COLUMN user_info_id SET DEFAULT nextval('public.user_info_user_info_id_seq'::regclass);


--
-- Data for Name: user_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_info VALUES (22, 'user_1724614621411', 2, 305);
INSERT INTO public.user_info VALUES (37, 'user_1724615913596', 2, 712);
INSERT INTO public.user_info VALUES (21, 'user_1724614621412', 5, 1);
INSERT INTO public.user_info VALUES (36, 'user_1724615913597', 5, 282);
INSERT INTO public.user_info VALUES (23, '[B', 1, 2);
INSERT INTO public.user_info VALUES (39, 'user_1724615964968', 2, 852);
INSERT INTO public.user_info VALUES (14, 'user_1724614190265', 2, 166);
INSERT INTO public.user_info VALUES (25, 'user_1724615279344', 2, 267);
INSERT INTO public.user_info VALUES (38, 'user_1724615964969', 5, 6);
INSERT INTO public.user_info VALUES (13, 'user_1724614190266', 5, 1);
INSERT INTO public.user_info VALUES (24, 'user_1724615279345', 5, 101);
INSERT INTO public.user_info VALUES (12, 'Sania', 8, 1);
INSERT INTO public.user_info VALUES (16, 'user_1724614298797', 2, 19);
INSERT INTO public.user_info VALUES (15, 'user_1724614298798', 5, 1);
INSERT INTO public.user_info VALUES (27, 'user_1724615631146', 2, 220);
INSERT INTO public.user_info VALUES (26, 'user_1724615631147', 5, 97);
INSERT INTO public.user_info VALUES (18, 'user_1724614517687', 2, 462);
INSERT INTO public.user_info VALUES (17, 'user_1724614517688', 5, 1);
INSERT INTO public.user_info VALUES (29, 'user_1724615690799', 2, 646);
INSERT INTO public.user_info VALUES (20, 'user_1724614570095', 2, 188);
INSERT INTO public.user_info VALUES (28, 'user_1724615690800', 5, 140);
INSERT INTO public.user_info VALUES (19, 'user_1724614570096', 5, 1);
INSERT INTO public.user_info VALUES (31, 'user_1724615727679', 2, 158);
INSERT INTO public.user_info VALUES (30, 'user_1724615727680', 5, 8);
INSERT INTO public.user_info VALUES (33, 'user_1724615839689', 2, 642);
INSERT INTO public.user_info VALUES (32, 'user_1724615839690', 5, 6);
INSERT INTO public.user_info VALUES (35, 'user_1724615867459', 2, 0);
INSERT INTO public.user_info VALUES (34, 'user_1724615867460', 5, 0);


--
-- Name: user_info_user_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_info_user_info_id_seq', 39, true);


--
-- Name: user_info user_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (user_info_id);


--
-- PostgreSQL database dump complete
--

