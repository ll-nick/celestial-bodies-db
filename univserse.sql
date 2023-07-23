--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    name_meaning text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_consteallation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_consteallation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_consteallation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_consteallation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_consteallation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_in_millions_of_ly numeric(6,3),
    constellation_id integer NOT NULL,
    age_in_millions_of_years integer,
    is_spiral boolean
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
    name character varying(40) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean,
    diameter numeric(10,3)
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
    name character varying(40),
    star_id integer NOT NULL,
    planet_type character varying(50),
    year_of_discovery integer
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
    galaxy_id integer NOT NULL,
    distance_in_millions_of_ly numeric(10,3),
    visibility_magnitude numeric(6,2),
    name character varying(30)
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_consteallation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', 'The name Andromeda is derived from Greek mythology. In the ancient Greek myth, Andromeda was a princess who was chained to a rock as a sacrifice to appease a sea monster sent by Poseidon. She was eventually rescued by the hero Perseus, who defeated the monster and married her.');
INSERT INTO public.constellation VALUES (2, 'Triangulum', 'Triangulum is the Latin word for "triangle." As the name suggests, this constellation is a small triangular-shaped constellation in the northern sky.');
INSERT INTO public.constellation VALUES (3, 'Virgo', 'The name Virgo is Latin for "virgin." In Greek and Roman mythology, Virgo is often associated with the goddess of justice and purity, Astraea, or the harvest goddess Demeter/Ceres.');
INSERT INTO public.constellation VALUES (4, 'Canes Venatici', 'Canes Venatici is Latin for "hunting dogs." The constellation represents the two hunting dogs, Chara and Asterion, belonging to the neighboring constellation Ursa Major (the Great Bear).');
INSERT INTO public.constellation VALUES (5, 'Centaurus', 'The name Centaurus refers to the mythical centaur, a creature from Greek mythology with the upper body of a human and the lower body of a horse. Centaurus is one of the largest constellations and is often depicted as a centaur carrying a spear.');
INSERT INTO public.constellation VALUES (6, 'Ursa Major', 'Ursa Major means "Great Bear" in Latin. The constellation is associated with various bear-related myths across different cultures, such as the Greek myth of Callisto, who was transformed into a bear and placed in the sky by Zeus as Ursa Major.');
INSERT INTO public.constellation VALUES (7, 'Milky Way', 'The galaxy where Earth is located.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (13, 'Milky Way', NULL, 7, NULL, NULL);
INSERT INTO public.galaxy VALUES (7, 'Andromeda Galaxy', 2.537, 1, 4500, true);
INSERT INTO public.galaxy VALUES (10, 'Whirlpool Galaxy (M51)', 23.000, 4, 3500, true);
INSERT INTO public.galaxy VALUES (12, 'Whirlpool Galaxy (M101)', 21.000, 6, 3800, true);
INSERT INTO public.galaxy VALUES (8, 'Triangulum Galaxy', 2.733, 2, 4000, false);
INSERT INTO public.galaxy VALUES (9, 'Sombrero Galaxy', 28.000, 3, 3000, false);
INSERT INTO public.galaxy VALUES (11, 'Centaurus A', 13.000, 5, 6000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, true, 3474.800);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, true, 22.200);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, true, 12.400);
INSERT INTO public.moon VALUES (4, 'Europa', 3, true, 3121.600);
INSERT INTO public.moon VALUES (5, 'Ganymede', 3, true, 5262.400);
INSERT INTO public.moon VALUES (6, 'Io', 3, true, 3637.400);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, true, 4820.600);
INSERT INTO public.moon VALUES (8, 'Titan', 4, true, 5151.000);
INSERT INTO public.moon VALUES (9, 'Enceladus', 4, true, 504.200);
INSERT INTO public.moon VALUES (10, 'Mimas', 4, true, 396.400);
INSERT INTO public.moon VALUES (11, 'Triton', 5, true, 2707.200);
INSERT INTO public.moon VALUES (12, 'Charon', 5, true, 1207.000);
INSERT INTO public.moon VALUES (13, 'Rhea', 6, true, 1529.000);
INSERT INTO public.moon VALUES (14, 'Phoebe', 6, true, 213.000);
INSERT INTO public.moon VALUES (15, 'Ceres', 7, true, 939.400);
INSERT INTO public.moon VALUES (16, 'Pluto', 7, true, 2370.000);
INSERT INTO public.moon VALUES (17, 'Haumea', 7, true, 1960.000);
INSERT INTO public.moon VALUES (18, 'Eris', 7, true, 2326.000);
INSERT INTO public.moon VALUES (19, 'Charon (M101)', 8, true, 1207.000);
INSERT INTO public.moon VALUES (20, 'Sycorax', 8, false, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Kepler-452b', 7, 'Terrestrial', 2015);
INSERT INTO public.planet VALUES (2, 'Jupiter (Andromeda)', 7, 'Gas Giant', 1610);
INSERT INTO public.planet VALUES (3, 'Proxima Centauri b', 8, 'Terrestrial', 2016);
INSERT INTO public.planet VALUES (4, 'Neptune', 8, 'Gas Giant', 1846);
INSERT INTO public.planet VALUES (5, 'Gliese 581g', 9, 'Terrestrial', 2010);
INSERT INTO public.planet VALUES (6, 'Saturn', 9, 'Gas Giant', 1610);
INSERT INTO public.planet VALUES (7, 'Kepler-186f', 10, 'Terrestrial', 2014);
INSERT INTO public.planet VALUES (8, 'Uranus', 10, 'Gas Giant', 1781);
INSERT INTO public.planet VALUES (9, 'Kepler-62f', 11, 'Terrestrial', 2013);
INSERT INTO public.planet VALUES (10, 'Kepler-37b', 11, 'Gas Giant', 2013);
INSERT INTO public.planet VALUES (11, 'Kepler-442b', 12, 'Terrestrial', 2015);
INSERT INTO public.planet VALUES (12, 'Jupiter (M101)', 12, 'Gas Giant', 1610);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (7, 7, 8.600, -1.46, 'Sirius');
INSERT INTO public.star VALUES (8, 8, 640.000, -5.85, 'Betelgeuse');
INSERT INTO public.star VALUES (9, 9, 4.240, 11.13, 'Proxima Centauri');
INSERT INTO public.star VALUES (10, 10, 4.370, 0.01, 'Alpha Centauri A');
INSERT INTO public.star VALUES (11, 11, 65.100, 0.87, 'Aldebaran');
INSERT INTO public.star VALUES (12, 12, 550.000, -0.92, 'Antares');


--
-- Name: constellation_consteallation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_consteallation_id_seq', 7, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 13, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


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

