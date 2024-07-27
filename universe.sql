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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    distance_g numeric(5,1),
    size_g integer,
    age_g integer NOT NULL,
    description_g text,
    name character varying(30) NOT NULL,
    is_dead boolean,
    is_big boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: inter; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.inter (
    inter_id integer NOT NULL,
    distance_i numeric(5,1),
    sizei integer,
    age_i integer NOT NULL,
    description_i text,
    name character varying(30) NOT NULL,
    is_dead boolean,
    is_big boolean
);


ALTER TABLE public.inter OWNER TO freecodecamp;

--
-- Name: inter_inter_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.inter_inter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inter_inter_id_seq OWNER TO freecodecamp;

--
-- Name: inter_inter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.inter_inter_id_seq OWNED BY public.inter.inter_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    distance_m numeric(5,1),
    size_m integer,
    age_m integer NOT NULL,
    description_m text,
    name character varying(30) NOT NULL,
    is_dead boolean,
    is_big boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    distance_p numeric(5,1),
    size_p integer,
    age_p integer NOT NULL,
    description_p text,
    name character varying(30) NOT NULL,
    is_dead boolean,
    is_big boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    distance_s numeric(5,1),
    size_s integer,
    age_s integer NOT NULL,
    description_s text,
    name character varying(30) NOT NULL,
    is_dead boolean,
    is_big boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: inter inter_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inter ALTER COLUMN inter_id SET DEFAULT nextval('public.inter_inter_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, NULL, NULL, 52, NULL, 'Andromeda', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, NULL, NULL, 98, NULL, 'Milky Way', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, NULL, NULL, 526, NULL, 'Sombrero', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, NULL, NULL, 849, NULL, 'Whirlpool', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, NULL, NULL, 984, NULL, 'Triangulum', NULL, NULL);
INSERT INTO public.galaxy VALUES (7, NULL, NULL, 881, NULL, 'Messier 87', NULL, NULL);


--
-- Data for Name: inter; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.inter VALUES (1, NULL, NULL, 58, NULL, 'aoi', NULL, NULL);
INSERT INTO public.inter VALUES (2, NULL, NULL, 734, NULL, 'zort', NULL, NULL);
INSERT INTO public.inter VALUES (3, NULL, NULL, 7453, NULL, 'futr', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, NULL, NULL, 4558, NULL, 'Selene', NULL, NULL, 5);
INSERT INTO public.moon VALUES (2, NULL, NULL, 445, NULL, 'Callisto', NULL, NULL, 5);
INSERT INTO public.moon VALUES (3, NULL, NULL, 475, NULL, 'Phobos', NULL, NULL, 5);
INSERT INTO public.moon VALUES (4, NULL, NULL, 883, NULL, 'Deimos', NULL, NULL, 5);
INSERT INTO public.moon VALUES (5, NULL, NULL, 455, NULL, 'Io', NULL, NULL, 5);
INSERT INTO public.moon VALUES (6, NULL, NULL, 755, NULL, 'Europa', NULL, NULL, 5);
INSERT INTO public.moon VALUES (7, NULL, NULL, 441, NULL, 'Ganymede', NULL, NULL, 5);
INSERT INTO public.moon VALUES (8, NULL, NULL, 5558, NULL, 'Titan', NULL, NULL, 5);
INSERT INTO public.moon VALUES (9, NULL, NULL, 5545, NULL, 'Rhea', NULL, NULL, 5);
INSERT INTO public.moon VALUES (10, NULL, NULL, 486, NULL, 'Tethys', NULL, NULL, 5);
INSERT INTO public.moon VALUES (11, NULL, NULL, 86864, NULL, 'Dione', NULL, NULL, 5);
INSERT INTO public.moon VALUES (12, NULL, NULL, 6848, NULL, 'Iapetus', NULL, NULL, 5);
INSERT INTO public.moon VALUES (13, NULL, NULL, 5486, NULL, 'Miranda', NULL, NULL, 5);
INSERT INTO public.moon VALUES (14, NULL, NULL, 4865, NULL, 'Oberon', NULL, NULL, 5);
INSERT INTO public.moon VALUES (15, NULL, NULL, 4586, NULL, 'Titania', NULL, NULL, 5);
INSERT INTO public.moon VALUES (16, NULL, NULL, 5578, NULL, 'Ariel', NULL, NULL, 5);
INSERT INTO public.moon VALUES (17, NULL, NULL, 45644, NULL, 'Umbriel', NULL, NULL, 5);
INSERT INTO public.moon VALUES (18, NULL, NULL, 458, NULL, 'Charon', NULL, NULL, 5);
INSERT INTO public.moon VALUES (19, NULL, NULL, 55452, NULL, 'Hydra', NULL, NULL, 5);
INSERT INTO public.moon VALUES (20, NULL, NULL, 85654, NULL, 'Nix', NULL, NULL, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, NULL, NULL, 745785, NULL, 'Xenon', NULL, NULL, 3);
INSERT INTO public.planet VALUES (2, NULL, NULL, 85485, NULL, 'Eldoria', NULL, NULL, 3);
INSERT INTO public.planet VALUES (3, NULL, NULL, 96, NULL, 'Zyphor', NULL, NULL, 3);
INSERT INTO public.planet VALUES (4, NULL, NULL, 58775, NULL, 'Quintara', NULL, NULL, 3);
INSERT INTO public.planet VALUES (5, NULL, NULL, 725578, NULL, 'Aurora', NULL, NULL, 3);
INSERT INTO public.planet VALUES (6, NULL, NULL, 75755, NULL, 'Draconis', NULL, NULL, 3);
INSERT INTO public.planet VALUES (7, NULL, NULL, 5757, NULL, 'Lunara', NULL, NULL, 3);
INSERT INTO public.planet VALUES (8, NULL, NULL, 44755, NULL, 'Thalassa', NULL, NULL, 3);
INSERT INTO public.planet VALUES (9, NULL, NULL, 47452, NULL, 'Vortexia', NULL, NULL, 3);
INSERT INTO public.planet VALUES (10, NULL, NULL, 87575, NULL, 'Nebulon', NULL, NULL, 3);
INSERT INTO public.planet VALUES (11, NULL, NULL, 4242, NULL, 'Astrolis', NULL, NULL, 3);
INSERT INTO public.planet VALUES (12, NULL, NULL, 886, NULL, 'Galanthea', NULL, NULL, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, NULL, NULL, 1563, NULL, 'Sirius', NULL, NULL, 3);
INSERT INTO public.star VALUES (2, NULL, NULL, 14, NULL, 'Betelgeuse', NULL, NULL, 3);
INSERT INTO public.star VALUES (3, NULL, NULL, 14485, NULL, 'Polaris', NULL, NULL, 3);
INSERT INTO public.star VALUES (4, NULL, NULL, 1456, NULL, 'Rigel', NULL, NULL, 3);
INSERT INTO public.star VALUES (5, NULL, NULL, 1876789, NULL, 'Vega', NULL, NULL, 3);
INSERT INTO public.star VALUES (6, NULL, NULL, 1445, NULL, 'Aldebaran', NULL, NULL, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: inter_inter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.inter_inter_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: inter inter_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inter
    ADD CONSTRAINT inter_pkey PRIMARY KEY (inter_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_description; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_description UNIQUE (description_g);


--
-- Name: inter unique_description_i; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inter
    ADD CONSTRAINT unique_description_i UNIQUE (description_i);


--
-- Name: moon unique_description_m; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_description_m UNIQUE (description_m);


--
-- Name: planet unique_description_p; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_description_p UNIQUE (description_p);


--
-- Name: star unique_description_s; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_description_s UNIQUE (description_s);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

