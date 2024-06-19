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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    asteroid_type character varying(30) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    size integer,
    distance_from_earth integer,
    diameter numeric,
    name character varying(30) NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    description text,
    galaxy_type character varying(30),
    has_life boolean,
    is_spherical boolean,
    distance_from_earth integer,
    size integer,
    name character varying(30) NOT NULL,
    diameter numeric
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
    name character varying(30),
    moon_type character varying(30),
    has_life boolean,
    is_spherical boolean,
    radius integer,
    size numeric,
    diameter integer,
    description text NOT NULL,
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
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years numeric,
    distance_from_earth integer,
    planet_type character varying(30),
    size integer,
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
    name character varying(30) NOT NULL,
    has_life boolean,
    description text,
    radius integer,
    temperature numeric,
    size integer,
    star_type character varying(30),
    is_spherical boolean,
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'C-type', 'Carbonaceous asteroid', false, true, 243, 12456, 35.6, 'Ceres');
INSERT INTO public.asteroid VALUES (2, 'S-type', 'Silicaceous asteroid', false, true, 30, 22790, 17.2, 'Vesta');
INSERT INTO public.asteroid VALUES (3, 'M-type', 'Metallic asteroid', false, true, 97, 7783, 22.5, 'Psyche');
INSERT INTO public.asteroid VALUES (4, 'C-type', 'Carbonaceous asteroid', false, true, 87, 14270, 18.4, 'Pallas');
INSERT INTO public.asteroid VALUES (5, 'S-type', 'Silicaceous asteroid', false, true, 15, 28710, 12.8, 'Hygiea');
INSERT INTO public.asteroid VALUES (6, 'M-type', 'Metallic asteroid', false, true, 42, 44971, 15.6, 'Lutetia');
INSERT INTO public.asteroid VALUES (7, 'C-type', 'Carbonaceous asteroid', false, true, 64, 5791, 20.2, 'Davida');
INSERT INTO public.asteroid VALUES (8, 'S-type', 'Silicaceous asteroid', false, true, 29, 10820, 16.9, 'Interamnia');
INSERT INTO public.asteroid VALUES (9, 'M-type', 'Metallic asteroid', false, true, 53, 6200, 19.3, 'Eunomia');
INSERT INTO public.asteroid VALUES (10, 'C-type', 'Carbonaceous asteroid', false, true, 78, 8000, 21.7, 'Herculina');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Our home galaxy', 'Spiral', true, true, 0, 100000, 'Milky Way', 100000);
INSERT INTO public.galaxy VALUES (2, 'Nearest spiral galaxy', 'Spiral', false, true, 2537000, 200000, 'Andromeda', 150000);
INSERT INTO public.galaxy VALUES (3, 'Small irregular galaxy', 'Irregular', false, false, 200000, 50000, 'Small Magellanic Cloud', 30000);
INSERT INTO public.galaxy VALUES (4, 'Large spiral galaxy', 'Spiral', false, true, 11700000, 300000, 'Messier 81', 200000);
INSERT INTO public.galaxy VALUES (5, 'Satellite galaxy', 'Irregular', false, false, 163000, 40000, 'Large Magellanic Cloud', 25000);
INSERT INTO public.galaxy VALUES (6, 'Triangulum Galaxy', 'Spiral', false, true, 3000000, 180000, 'Triangulum', 120000);
INSERT INTO public.galaxy VALUES (7, 'Elliptical galaxy', 'Elliptical', false, true, 15000000, 500000, 'Centaurus A', 350000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Luna', 'Natural satellite', false, true, 1737, 0.0123, 3474, 'Earth''s only natural satellite', 1);
INSERT INTO public.moon VALUES (22, 'Phobos', 'Natural satellite', false, true, 11, 0.000015, 22, 'Moon of Mars', 2);
INSERT INTO public.moon VALUES (23, 'Deimos', 'Natural satellite', false, true, 6, 0.000003, 12, 'Second moon of Mars', 2);
INSERT INTO public.moon VALUES (24, 'Io', 'Natural satellite', false, true, 1821, 0.015, 3660, 'Moon of Jupiter', 3);
INSERT INTO public.moon VALUES (25, 'Europa', 'Natural satellite', false, true, 1560, 0.008, 3121, 'Moon of Jupiter', 3);
INSERT INTO public.moon VALUES (26, 'Ganymede', 'Natural satellite', false, true, 2634, 0.024, 5262, 'Largest moon of Jupiter', 3);
INSERT INTO public.moon VALUES (27, 'Callisto', 'Natural satellite', false, true, 2408, 0.018, 4821, 'Second-largest moon of Jupiter', 3);
INSERT INTO public.moon VALUES (28, 'Titan', 'Natural satellite', false, true, 2575, 0.022, 5150, 'Largest moon of Saturn', 4);
INSERT INTO public.moon VALUES (29, 'Rhea', 'Natural satellite', false, true, 764, 0.004, 1527, 'Second-largest moon of Saturn', 4);
INSERT INTO public.moon VALUES (30, 'Iapetus', 'Natural satellite', false, true, 735, 0.003, 1470, 'Third-largest moon of Saturn', 4);
INSERT INTO public.moon VALUES (31, 'Charon', 'Natural satellite', false, true, 606, 0.002, 1212, 'Moon of Pluto', 5);
INSERT INTO public.moon VALUES (32, 'Triton', 'Natural satellite', false, true, 1353, 0.006, 2706, 'Largest moon of Neptune', 6);
INSERT INTO public.moon VALUES (33, 'Proteus', 'Natural satellite', false, true, 210, 0.001, 420, 'Moon of Neptune', 6);
INSERT INTO public.moon VALUES (34, 'Miranda', 'Natural satellite', false, true, 235, 0.001, 470, 'Moon of Uranus', 7);
INSERT INTO public.moon VALUES (35, 'Umbriel', 'Natural satellite', false, true, 584, 0.002, 1168, 'Moon of Uranus', 7);
INSERT INTO public.moon VALUES (36, 'Ariel', 'Natural satellite', false, true, 578, 0.002, 1156, 'Moon of Uranus', 7);
INSERT INTO public.moon VALUES (37, 'Dione', 'Natural satellite', false, true, 561, 0.002, 1122, 'Moon of Saturn', 4);
INSERT INTO public.moon VALUES (38, 'Enceladus', 'Natural satellite', false, true, 252, 0.001, 504, 'Moon of Saturn', 4);
INSERT INTO public.moon VALUES (39, 'Mimas', 'Natural satellite', false, true, 198, 0.001, 396, 'Moon of Saturn', 4);
INSERT INTO public.moon VALUES (40, 'Phoebe', 'Natural satellite', false, true, 107, 0.0005, 213, 'Irregular moon of Saturn', 4);
INSERT INTO public.moon VALUES (41, 'Hyperion', 'Natural satellite', false, true, 135, 0.0007, 270, 'Moon of Saturn', 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Third planet from the Sun', true, true, 4.5, 14960, 'Terrestrial', 12756, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Fourth planet from the Sun', false, true, 3.5, 22790, 'Terrestrial', 6779, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Fifth planet from the Sun', false, false, 4.6, 77830, 'Gas giant', 139820, 2);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Sixth planet from the Sun', false, false, 4.3, 142700, 'Gas giant', 116460, 2);
INSERT INTO public.planet VALUES (5, 'Uranus', 'Seventh planet from the Sun', false, true, 4.2, 287100, 'Ice giant', 50724, 1);
INSERT INTO public.planet VALUES (6, 'Neptune', 'Eighth planet from the Sun', false, true, 4.1, 449710, 'Ice giant', 49244, 1);
INSERT INTO public.planet VALUES (7, 'Mercury', 'Closest planet to the Sun', false, true, 4.0, 5791, 'Terrestrial', 4879, 1);
INSERT INTO public.planet VALUES (8, 'Venus', 'Second planet from the Sun', false, true, 4.2, 10820, 'Terrestrial', 12104, 1);
INSERT INTO public.planet VALUES (9, 'Ganymede', 'Largest moon of Jupiter', false, true, 0.0045, NULL, 'Moon', 5262, 2);
INSERT INTO public.planet VALUES (10, 'Titan', 'Largest moon of Saturn', false, true, 0.004, NULL, 'Moon', 5150, 2);
INSERT INTO public.planet VALUES (11, 'Callisto', 'Second-largest moon of Jupiter', false, true, 0.0043, NULL, 'Moon', 4821, 2);
INSERT INTO public.planet VALUES (12, 'Europa', 'Fourth-largest moon of Jupiter', false, true, 0.0041, NULL, 'Moon', 3121, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', true, 'Our solar system''s star', 696340, 5778, 109, 'G-type main-sequence', true, 1);
INSERT INTO public.star VALUES (2, 'Sirius', false, 'Brightest star in the night sky', 167, 9940, 25, 'A-type main-sequence', true, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', false, 'Red supergiant in Orion constellation', 887000, 3600, 600, 'M-type supergiant', false, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', false, 'Closest star system to Earth', 1183000, 5790, 110, 'G-type main-sequence', true, 2);
INSERT INTO public.star VALUES (5, 'Alpha Centauri B', false, 'Closest star system to Earth', 884000, 5260, 90, 'K-type main-sequence', true, 2);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', false, 'Closest known star to the Sun', 118700, 3042, 14, 'M-type main-sequence', false, 2);
INSERT INTO public.star VALUES (7, 'Vega', false, 'Bright star in the constellation Lyra', 23700, 9602, 2, 'A-type main-sequence', true, 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 41, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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
-- PostgreSQL database dump complete
--

