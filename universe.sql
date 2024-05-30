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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    orbit_period numeric NOT NULL,
    is_active boolean NOT NULL,
    discovered_year integer,
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    age numeric NOT NULL,
    is_special boolean NOT NULL,
    distance_from_earth integer
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    diameter integer NOT NULL,
    has_water boolean NOT NULL,
    description text
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
    name character varying(255) NOT NULL,
    star_id integer,
    mass numeric NOT NULL,
    has_life boolean NOT NULL,
    radius integer NOT NULL,
    atmosphere_composition text
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
    name character varying(255) NOT NULL,
    galaxy_id integer,
    luminosity numeric NOT NULL,
    is_main_sequence boolean NOT NULL,
    age integer NOT NULL,
    spectral_type text NOT NULL
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halleys Comet', 75.3, true, 1705, 'One of the most famous comets');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 2533.0, false, 1995, 'Great comet of 1997');
INSERT INTO public.comet VALUES (3, 'Hyakutake', 17000.0, false, 1996, 'Great comet of 1996');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 13.51, true, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest spiral galaxy', 10.0, true, 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral galaxy in the Local Group', 12.0, true, 3000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Famous for its spiral structure', 8.0, true, 23000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Known for its bright nucleus', 9.0, false, 31000000);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 'Named for its dark band of dust', 11.0, true, 17000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, true, 'Earths only natural satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, false, 'One of Mars moons');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, false, 'One of Mars moons');
INSERT INTO public.moon VALUES (4, 'Europa', 3, 3121, true, 'One of Jupiters moons');
INSERT INTO public.moon VALUES (5, 'Ganymede', 3, 5262, true, 'Largest moon in the Solar System');
INSERT INTO public.moon VALUES (6, 'Io', 3, 3643, false, 'Most volcanically active body in the Solar System');
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 4821, true, 'One of Jupiters moons');
INSERT INTO public.moon VALUES (8, 'Titan', 4, 5149, true, 'Largest moon of Saturn');
INSERT INTO public.moon VALUES (9, 'Rhea', 4, 1528, false, 'One of Saturns moons');
INSERT INTO public.moon VALUES (10, 'Iapetus', 4, 1469, false, 'One of Saturns moons');
INSERT INTO public.moon VALUES (11, 'Proxima Centauri b Moon 1', 5, 1000, false, 'A moon of Proxima Centauri b');
INSERT INTO public.moon VALUES (12, 'Proxima Centauri b Moon 2', 5, 1200, false, 'A moon of Proxima Centauri b');
INSERT INTO public.moon VALUES (13, 'Alpha Centauri Bb Moon 1', 6, 1100, false, 'A moon of Alpha Centauri Bb');
INSERT INTO public.moon VALUES (14, 'Sirius b Moon 1', 7, 1300, false, 'A moon of Sirius b');
INSERT INTO public.moon VALUES (15, 'Betelgeuse b Moon 1', 8, 1400, false, 'A moon of Betelgeuse b');
INSERT INTO public.moon VALUES (16, 'Betelgeuse b Moon 2', 8, 1500, false, 'A moon of Betelgeuse b');
INSERT INTO public.moon VALUES (17, 'Andromeda planet 1 Moon 1', 9, 1600, false, 'A moon of Andromeda planet 1');
INSERT INTO public.moon VALUES (18, 'Andromeda planet 2 Moon 1', 10, 1700, false, 'A moon of Andromeda planet 2');
INSERT INTO public.moon VALUES (19, 'Triangulum planet 1 Moon 1', 11, 1800, false, 'A moon of Triangulum planet 1');
INSERT INTO public.moon VALUES (20, 'Whirlpool planet 1 Moon 1', 12, 1900, false, 'A moon of Whirlpool planet 1');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1.0, true, 6371, 'Nitrogen, Oxygen');
INSERT INTO public.planet VALUES (2, 'Mars', 1, 0.107, false, 3389, 'Carbon Dioxide, Nitrogen');
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 318, false, 69911, 'Hydrogen, Helium');
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 95, false, 58232, 'Hydrogen, Helium');
INSERT INTO public.planet VALUES (5, 'Proxima Centauri b', 2, 1.17, false, 6491, 'Unknown');
INSERT INTO public.planet VALUES (6, 'Alpha Centauri Bb', 4, 1.1, false, 7000, 'Unknown');
INSERT INTO public.planet VALUES (7, 'Sirius b', 3, 1.02, false, 12320, 'Hydrogen, Helium');
INSERT INTO public.planet VALUES (8, 'Betelgeuse b', 6, 5.0, false, 45000, 'Unknown');
INSERT INTO public.planet VALUES (9, 'Andromeda planet 1', 2, 2.5, false, 7000, 'Hydrogen, Helium');
INSERT INTO public.planet VALUES (10, 'Andromeda planet 2', 2, 3.1, false, 8000, 'Hydrogen, Helium');
INSERT INTO public.planet VALUES (11, 'Triangulum planet 1', 3, 4.0, false, 9000, 'Hydrogen, Helium');
INSERT INTO public.planet VALUES (12, 'Whirlpool planet 1', 4, 5.5, false, 10000, 'Hydrogen, Helium');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.0, true, 5, 'G2V');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 0.0017, true, 5, 'M5.5V');
INSERT INTO public.star VALUES (3, 'Sirius', 2, 25.4, true, 0, 'A1V');
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 2, 1.519, true, 5, 'G2V');
INSERT INTO public.star VALUES (5, 'Alpha Centauri B', 2, 0.500, true, 5, 'K1V');
INSERT INTO public.star VALUES (6, 'Betelgeuse', 1, 126000, false, 8, 'M2Iab');


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


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
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

