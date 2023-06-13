--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-12 21:47:16

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
-- TOC entry 214 (class 1259 OID 42111)
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 42162)
-- Name: defensas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.defensas (
    id integer NOT NULL,
    defensa character varying(45) NOT NULL
);


ALTER TABLE public.defensas OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 42212)
-- Name: defensas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.defensas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.defensas_id_seq OWNER TO postgres;

--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 225
-- Name: defensas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.defensas_id_seq OWNED BY public.defensas.id;


--
-- TOC entry 222 (class 1259 OID 42157)
-- Name: diplomacias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diplomacias (
    id_reino_1 integer NOT NULL,
    id_reino_2 integer NOT NULL,
    es_aliado boolean NOT NULL
);


ALTER TABLE public.diplomacias OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 42128)
-- Name: karts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.karts (
    id integer NOT NULL,
    modelo character varying(45) NOT NULL,
    color character varying(45) NOT NULL,
    velocidad_maxima integer NOT NULL,
    id_personaje integer
);


ALTER TABLE public.karts OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 42127)
-- Name: karts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.karts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.karts_id_seq OWNER TO postgres;

--
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 217
-- Name: karts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.karts_id_seq OWNED BY public.karts.id;


--
-- TOC entry 228 (class 1259 OID 42278)
-- Name: personaje_habita_reino; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personaje_habita_reino (
    id_personaje integer NOT NULL,
    id_reino integer NOT NULL,
    fecha_registro timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    es_gobernante boolean NOT NULL
);


ALTER TABLE public.personaje_habita_reino OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 42261)
-- Name: personaje_tiene_trabajo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personaje_tiene_trabajo (
    id_trabajo integer NOT NULL,
    id_personaje integer NOT NULL,
    fecha_inicio timestamp(3) without time zone NOT NULL,
    fecha_termino timestamp(3) without time zone
);


ALTER TABLE public.personaje_tiene_trabajo OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 42121)
-- Name: personajes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personajes (
    id integer NOT NULL,
    nombre character varying(45) NOT NULL,
    fuerza integer NOT NULL,
    fecha_nacimiento date NOT NULL,
    objeto character varying(30)
);


ALTER TABLE public.personajes OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 42120)
-- Name: personajes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personajes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personajes_id_seq OWNER TO postgres;

--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 215
-- Name: personajes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personajes_id_seq OWNED BY public.personajes.id;


--
-- TOC entry 224 (class 1259 OID 42167)
-- Name: reino_tiene_defensa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reino_tiene_defensa (
    id_reino integer NOT NULL,
    id_defensa integer NOT NULL,
    cantidad integer NOT NULL
);


ALTER TABLE public.reino_tiene_defensa OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 42146)
-- Name: reinos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reinos (
    id integer NOT NULL,
    nombre character varying(45) NOT NULL,
    ubicacion character varying(45) NOT NULL,
    superficie integer NOT NULL
);


ALTER TABLE public.reinos OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 42276)
-- Name: reinos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reinos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reinos_id_seq OWNER TO postgres;

--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 227
-- Name: reinos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reinos_id_seq OWNED BY public.reinos.id;


--
-- TOC entry 220 (class 1259 OID 42135)
-- Name: trabajos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trabajos (
    id integer NOT NULL,
    descripcion character varying(45),
    sueldo integer NOT NULL
);


ALTER TABLE public.trabajos OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 42134)
-- Name: trabajos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trabajos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trabajos_id_seq OWNER TO postgres;

--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 219
-- Name: trabajos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trabajos_id_seq OWNED BY public.trabajos.id;


--
-- TOC entry 3219 (class 2604 OID 42213)
-- Name: defensas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.defensas ALTER COLUMN id SET DEFAULT nextval('public.defensas_id_seq'::regclass);


--
-- TOC entry 3216 (class 2604 OID 42131)
-- Name: karts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.karts ALTER COLUMN id SET DEFAULT nextval('public.karts_id_seq'::regclass);


--
-- TOC entry 3215 (class 2604 OID 42124)
-- Name: personajes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personajes ALTER COLUMN id SET DEFAULT nextval('public.personajes_id_seq'::regclass);


--
-- TOC entry 3218 (class 2604 OID 42277)
-- Name: reinos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reinos ALTER COLUMN id SET DEFAULT nextval('public.reinos_id_seq'::regclass);


--
-- TOC entry 3217 (class 2604 OID 42138)
-- Name: trabajos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajos ALTER COLUMN id SET DEFAULT nextval('public.trabajos_id_seq'::regclass);


--
-- TOC entry 3392 (class 0 OID 42111)
-- Dependencies: 214
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('b0cf7508-b14c-4761-92e2-3b9ca9721f5f', 'e614a498e0c8df1549871806d95b535dc84a88d24d043950f1e77bf0e61d8e1d', '2023-06-12 21:12:39.26183-04', '20230612001223_init', NULL, NULL, '2023-06-12 21:12:39.235218-04', 1);
INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('6d89a221-3aeb-4cd7-930e-a06764c6be3c', 'f7f6bc14d4a621a0daa32b02f06d07a43bd5f38a1e3a609d68fb20335da1baf9', '2023-06-12 21:12:39.281777-04', '20230612203954_migration', NULL, NULL, '2023-06-12 21:12:39.262473-04', 1);
INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('dfe3e93d-45ec-426f-a33a-7b63650c33b4', '4c956057adfe0fd637a7a7aa445e0a25c12f3975666ee878ddddfc83f26d2c3a', '2023-06-12 21:12:39.285173-04', '20230612211534_migration', NULL, NULL, '2023-06-12 21:12:39.282498-04', 1);
INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('26591ed4-cee5-4f3e-a640-9d4e6493574c', 'b896f49068f96b04ba7e4c57a0f9da73b9b951af62b418f46e9597afb16f0dbb', '2023-06-12 21:12:39.296955-04', '20230612222655_migration', NULL, NULL, '2023-06-12 21:12:39.286003-04', 1);
INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('bfeffc83-4b12-489b-affb-dc20ea465181', 'f6b961332182a284a3d1220457206e5d42a80e619bd394608a23a35873c34bd7', '2023-06-12 21:12:39.301465-04', '20230612230625_migration', NULL, NULL, '2023-06-12 21:12:39.297805-04', 1);
INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('0153124a-a2d9-4d70-832e-44eb727114bc', '792f7ad179e35115f6c79f6d8f01f0d4304d6dc0d2a409bc442c4022fec6825c', '2023-06-12 21:12:39.311164-04', '20230612230920_migration', NULL, NULL, '2023-06-12 21:12:39.302201-04', 1);
INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('f2858730-6631-4936-8bd4-0a4908552927', '8542fe65c8fa113ab466f1c9b90cb03770f39514a3838273d8275c61b02eb61c', '2023-06-12 21:12:39.314648-04', '20230612232846_migration', NULL, NULL, '2023-06-12 21:12:39.31193-04', 1);
INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('8d59b3d5-c1f5-4fde-9126-c58edc63bc4a', '0b3d9152d9b43a797be3d6f8294cca8539aa355b273f698d32b7322ff9dd5774', '2023-06-12 21:12:39.322207-04', '20230612234048_migration', NULL, NULL, '2023-06-12 21:12:39.315463-04', 1);
INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('d755873a-4f86-4c90-b466-a3b96b6a906c', 'b9607c4d9f826614264f956490ac2292d06902d5b04c0f1a83cd279befe2cf22', '2023-06-12 21:12:39.326024-04', '20230612235838_migration', NULL, NULL, '2023-06-12 21:12:39.323099-04', 1);


--
-- TOC entry 3401 (class 0 OID 42162)
-- Dependencies: 223
-- Data for Name: defensas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.defensas (id, defensa) VALUES (1, 'paredes gigantes');
INSERT INTO public.defensas (id, defensa) VALUES (2, 'cañones de acero');
INSERT INTO public.defensas (id, defensa) VALUES (3, 'balas de plata');
INSERT INTO public.defensas (id, defensa) VALUES (4, 'minions voladores');


--
-- TOC entry 3400 (class 0 OID 42157)
-- Dependencies: 222
-- Data for Name: diplomacias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.diplomacias (id_reino_1, id_reino_2, es_aliado) VALUES (1, 2, false);
INSERT INTO public.diplomacias (id_reino_1, id_reino_2, es_aliado) VALUES (1, 3, true);
INSERT INTO public.diplomacias (id_reino_1, id_reino_2, es_aliado) VALUES (1, 4, false);
INSERT INTO public.diplomacias (id_reino_1, id_reino_2, es_aliado) VALUES (3, 2, false);
INSERT INTO public.diplomacias (id_reino_1, id_reino_2, es_aliado) VALUES (3, 4, true);
INSERT INTO public.diplomacias (id_reino_1, id_reino_2, es_aliado) VALUES (1, 5, false);


--
-- TOC entry 3396 (class 0 OID 42128)
-- Dependencies: 218
-- Data for Name: karts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.karts (id, modelo, color, velocidad_maxima, id_personaje) VALUES (1, 'A50', 'verde agua', 400, 2);
INSERT INTO public.karts (id, modelo, color, velocidad_maxima, id_personaje) VALUES (2, 'B45', 'azul rey', 150, NULL);
INSERT INTO public.karts (id, modelo, color, velocidad_maxima, id_personaje) VALUES (3, 'N504', 'magenta', 200, 4);
INSERT INTO public.karts (id, modelo, color, velocidad_maxima, id_personaje) VALUES (4, 'K09', 'amarillo', 530, 2);
INSERT INTO public.karts (id, modelo, color, velocidad_maxima, id_personaje) VALUES (5, 'L2211', 'anaranjado', 390, 7);
INSERT INTO public.karts (id, modelo, color, velocidad_maxima, id_personaje) VALUES (6, 'M2023', 'sandía', 190, 15);
INSERT INTO public.karts (id, modelo, color, velocidad_maxima, id_personaje) VALUES (7, 'K2019', 'vino', 245, 10);


--
-- TOC entry 3406 (class 0 OID 42278)
-- Dependencies: 228
-- Data for Name: personaje_habita_reino; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.personaje_habita_reino (id_personaje, id_reino, fecha_registro, es_gobernante) VALUES (1, 1, '2023-06-12 21:12:46.365-04', true);
INSERT INTO public.personaje_habita_reino (id_personaje, id_reino, fecha_registro, es_gobernante) VALUES (2, 2, '2023-06-12 21:12:46.373-04', true);
INSERT INTO public.personaje_habita_reino (id_personaje, id_reino, fecha_registro, es_gobernante) VALUES (3, 3, '2023-06-12 21:12:46.381-04', true);
INSERT INTO public.personaje_habita_reino (id_personaje, id_reino, fecha_registro, es_gobernante) VALUES (4, 4, '2023-06-12 21:12:46.389-04', true);
INSERT INTO public.personaje_habita_reino (id_personaje, id_reino, fecha_registro, es_gobernante) VALUES (5, 5, '2023-06-12 21:12:46.397-04', true);
INSERT INTO public.personaje_habita_reino (id_personaje, id_reino, fecha_registro, es_gobernante) VALUES (6, 1, '2023-06-12 21:12:46.405-04', false);
INSERT INTO public.personaje_habita_reino (id_personaje, id_reino, fecha_registro, es_gobernante) VALUES (7, 2, '2023-06-12 21:12:46.413-04', false);
INSERT INTO public.personaje_habita_reino (id_personaje, id_reino, fecha_registro, es_gobernante) VALUES (8, 3, '2023-06-12 21:12:46.421-04', false);
INSERT INTO public.personaje_habita_reino (id_personaje, id_reino, fecha_registro, es_gobernante) VALUES (9, 4, '2023-06-12 21:12:46.431-04', false);
INSERT INTO public.personaje_habita_reino (id_personaje, id_reino, fecha_registro, es_gobernante) VALUES (10, 5, '2023-06-12 21:12:46.438-04', false);
INSERT INTO public.personaje_habita_reino (id_personaje, id_reino, fecha_registro, es_gobernante) VALUES (11, 1, '2023-06-12 21:12:46.447-04', false);
INSERT INTO public.personaje_habita_reino (id_personaje, id_reino, fecha_registro, es_gobernante) VALUES (12, 2, '2023-06-12 21:12:46.455-04', false);
INSERT INTO public.personaje_habita_reino (id_personaje, id_reino, fecha_registro, es_gobernante) VALUES (13, 3, '2023-06-12 21:12:46.464-04', false);
INSERT INTO public.personaje_habita_reino (id_personaje, id_reino, fecha_registro, es_gobernante) VALUES (14, 4, '2023-06-12 21:12:46.473-04', false);
INSERT INTO public.personaje_habita_reino (id_personaje, id_reino, fecha_registro, es_gobernante) VALUES (15, 5, '2023-06-12 21:12:46.481-04', false);


--
-- TOC entry 3404 (class 0 OID 42261)
-- Dependencies: 226
-- Data for Name: personaje_tiene_trabajo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.personaje_tiene_trabajo (id_trabajo, id_personaje, fecha_inicio, fecha_termino) VALUES (3, 13, '2023-02-02 00:00:00', NULL);
INSERT INTO public.personaje_tiene_trabajo (id_trabajo, id_personaje, fecha_inicio, fecha_termino) VALUES (3, 14, '2022-03-01 00:00:00', NULL);
INSERT INTO public.personaje_tiene_trabajo (id_trabajo, id_personaje, fecha_inicio, fecha_termino) VALUES (2, 15, '1966-08-29 00:00:00', '2009-06-25 00:00:00');
INSERT INTO public.personaje_tiene_trabajo (id_trabajo, id_personaje, fecha_inicio, fecha_termino) VALUES (3, 9, '2012-09-07 00:00:00', '2013-08-16 00:00:00');
INSERT INTO public.personaje_tiene_trabajo (id_trabajo, id_personaje, fecha_inicio, fecha_termino) VALUES (1, 1, '1956-09-07 00:00:00', '2000-12-15 00:00:00');
INSERT INTO public.personaje_tiene_trabajo (id_trabajo, id_personaje, fecha_inicio, fecha_termino) VALUES (4, 2, '2000-03-12 00:00:00', '2002-09-20 00:00:00');
INSERT INTO public.personaje_tiene_trabajo (id_trabajo, id_personaje, fecha_inicio, fecha_termino) VALUES (5, 7, '1836-10-01 00:00:00', '1900-10-09 00:00:00');


--
-- TOC entry 3394 (class 0 OID 42121)
-- Dependencies: 216
-- Data for Name: personajes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.personajes (id, nombre, fuerza, fecha_nacimiento, objeto) VALUES (1, 'Mario', 250, '1932-01-23', NULL);
INSERT INTO public.personajes (id, nombre, fuerza, fecha_nacimiento, objeto) VALUES (2, 'Marta', 210, '1956-12-20', 'Peluca de fuego');
INSERT INTO public.personajes (id, nombre, fuerza, fecha_nacimiento, objeto) VALUES (3, 'Memo', 50, '2000-03-01', 'Espada dorada');
INSERT INTO public.personajes (id, nombre, fuerza, fecha_nacimiento, objeto) VALUES (4, 'Martin', 25, '1999-11-22', 'Botiquin de curaciones');
INSERT INTO public.personajes (id, nombre, fuerza, fecha_nacimiento, objeto) VALUES (5, 'Melanie', 400, '2010-09-09', 'Zapatos punta de fierro');
INSERT INTO public.personajes (id, nombre, fuerza, fecha_nacimiento, objeto) VALUES (6, 'Marisol', 34, '1920-07-07', NULL);
INSERT INTO public.personajes (id, nombre, fuerza, fecha_nacimiento, objeto) VALUES (7, 'Mercurio', 2500, '1818-01-01', 'Bolsa de oro');
INSERT INTO public.personajes (id, nombre, fuerza, fecha_nacimiento, objeto) VALUES (8, 'Melchor', 190, '1918-04-18', 'Mochila con ruedas');
INSERT INTO public.personajes (id, nombre, fuerza, fecha_nacimiento, objeto) VALUES (9, 'Miles', 1000, '2003-12-14', 'Tela de araña');
INSERT INTO public.personajes (id, nombre, fuerza, fecha_nacimiento, objeto) VALUES (10, 'Milagros', 259, '1998-03-14', 'Capucha roja');
INSERT INTO public.personajes (id, nombre, fuerza, fecha_nacimiento, objeto) VALUES (11, 'Mango', 2500, '1998-09-18', 'Terremotos');
INSERT INTO public.personajes (id, nombre, fuerza, fecha_nacimiento, objeto) VALUES (12, 'Maria', 120, '1968-08-08', NULL);
INSERT INTO public.personajes (id, nombre, fuerza, fecha_nacimiento, objeto) VALUES (13, 'Merlina', 125, '1944-04-14', 'Mano andante');
INSERT INTO public.personajes (id, nombre, fuerza, fecha_nacimiento, objeto) VALUES (14, 'Merida', 3000, '1956-06-26', 'Collar de corazón valiente');
INSERT INTO public.personajes (id, nombre, fuerza, fecha_nacimiento, objeto) VALUES (15, 'Michael', 2050, '1958-08-29', 'Microfono dorado');


--
-- TOC entry 3402 (class 0 OID 42167)
-- Dependencies: 224
-- Data for Name: reino_tiene_defensa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reino_tiene_defensa (id_reino, id_defensa, cantidad) VALUES (1, 1, 5);
INSERT INTO public.reino_tiene_defensa (id_reino, id_defensa, cantidad) VALUES (3, 1, 5);
INSERT INTO public.reino_tiene_defensa (id_reino, id_defensa, cantidad) VALUES (3, 2, 5);
INSERT INTO public.reino_tiene_defensa (id_reino, id_defensa, cantidad) VALUES (3, 3, 5);
INSERT INTO public.reino_tiene_defensa (id_reino, id_defensa, cantidad) VALUES (3, 4, 5);
INSERT INTO public.reino_tiene_defensa (id_reino, id_defensa, cantidad) VALUES (2, 3, 5);
INSERT INTO public.reino_tiene_defensa (id_reino, id_defensa, cantidad) VALUES (4, 4, 5);
INSERT INTO public.reino_tiene_defensa (id_reino, id_defensa, cantidad) VALUES (1, 3, 5);
INSERT INTO public.reino_tiene_defensa (id_reino, id_defensa, cantidad) VALUES (2, 2, 5);
INSERT INTO public.reino_tiene_defensa (id_reino, id_defensa, cantidad) VALUES (5, 2, 5);


--
-- TOC entry 3399 (class 0 OID 42146)
-- Dependencies: 221
-- Data for Name: reinos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reinos (id, nombre, ubicacion, superficie) VALUES (1, 'Muy lejano', 'Talca', 10000);
INSERT INTO public.reinos (id, nombre, ubicacion, superficie) VALUES (2, 'Bajo el mar', 'Antartica', 1000);
INSERT INTO public.reinos (id, nombre, ubicacion, superficie) VALUES (3, 'Sal si puedes', 'Vilches', 20000);
INSERT INTO public.reinos (id, nombre, ubicacion, superficie) VALUES (4, '7 tazas', 'Molina', 500);
INSERT INTO public.reinos (id, nombre, ubicacion, superficie) VALUES (5, 'Estratosfera', 'India', 15000);


--
-- TOC entry 3398 (class 0 OID 42135)
-- Dependencies: 220
-- Data for Name: trabajos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.trabajos (id, descripcion, sueldo) VALUES (1, 'Pasear los perros de personajes', 190000);
INSERT INTO public.trabajos (id, descripcion, sueldo) VALUES (2, 'Realizar shows artisticos', 4000000);
INSERT INTO public.trabajos (id, descripcion, sueldo) VALUES (3, 'Entrenador de habilidades extrañas', 3000001);
INSERT INTO public.trabajos (id, descripcion, sueldo) VALUES (4, 'Cocinar en el comedor popular', 409000);
INSERT INTO public.trabajos (id, descripcion, sueldo) VALUES (5, 'Mecánico automotriz', 560000);


--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 225
-- Name: defensas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.defensas_id_seq', 4, true);


--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 217
-- Name: karts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.karts_id_seq', 7, true);


--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 215
-- Name: personajes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personajes_id_seq', 15, true);


--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 227
-- Name: reinos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reinos_id_seq', 5, true);


--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 219
-- Name: trabajos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trabajos_id_seq', 5, true);


--
-- TOC entry 3222 (class 2606 OID 42119)
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3234 (class 2606 OID 42166)
-- Name: defensas defensas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.defensas
    ADD CONSTRAINT defensas_pkey PRIMARY KEY (id);


--
-- TOC entry 3232 (class 2606 OID 42161)
-- Name: diplomacias diplomacias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diplomacias
    ADD CONSTRAINT diplomacias_pkey PRIMARY KEY (id_reino_1, id_reino_2);


--
-- TOC entry 3226 (class 2606 OID 42133)
-- Name: karts karts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.karts
    ADD CONSTRAINT karts_pkey PRIMARY KEY (id);


--
-- TOC entry 3240 (class 2606 OID 42283)
-- Name: personaje_habita_reino personaje_habita_reino_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personaje_habita_reino
    ADD CONSTRAINT personaje_habita_reino_pkey PRIMARY KEY (id_personaje, id_reino);


--
-- TOC entry 3238 (class 2606 OID 42265)
-- Name: personaje_tiene_trabajo personaje_tiene_trabajo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personaje_tiene_trabajo
    ADD CONSTRAINT personaje_tiene_trabajo_pkey PRIMARY KEY (id_personaje, id_trabajo);


--
-- TOC entry 3224 (class 2606 OID 42126)
-- Name: personajes personajes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personajes
    ADD CONSTRAINT personajes_pkey PRIMARY KEY (id);


--
-- TOC entry 3236 (class 2606 OID 42215)
-- Name: reino_tiene_defensa reino_tiene_defensa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reino_tiene_defensa
    ADD CONSTRAINT reino_tiene_defensa_pkey PRIMARY KEY (id_reino, id_defensa);


--
-- TOC entry 3230 (class 2606 OID 42150)
-- Name: reinos reinos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reinos
    ADD CONSTRAINT reinos_pkey PRIMARY KEY (id);


--
-- TOC entry 3228 (class 2606 OID 42140)
-- Name: trabajos trabajos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajos
    ADD CONSTRAINT trabajos_pkey PRIMARY KEY (id);


--
-- TOC entry 3242 (class 2606 OID 42241)
-- Name: diplomacias diplomacias_id_reino_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diplomacias
    ADD CONSTRAINT diplomacias_id_reino_1_fkey FOREIGN KEY (id_reino_1) REFERENCES public.reinos(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3243 (class 2606 OID 42246)
-- Name: diplomacias diplomacias_id_reino_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diplomacias
    ADD CONSTRAINT diplomacias_id_reino_2_fkey FOREIGN KEY (id_reino_2) REFERENCES public.reinos(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3241 (class 2606 OID 42216)
-- Name: karts karts_id_personaje_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.karts
    ADD CONSTRAINT karts_id_personaje_fkey FOREIGN KEY (id_personaje) REFERENCES public.personajes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3248 (class 2606 OID 42284)
-- Name: personaje_habita_reino personaje_habita_reino_id_personaje_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personaje_habita_reino
    ADD CONSTRAINT personaje_habita_reino_id_personaje_fkey FOREIGN KEY (id_personaje) REFERENCES public.personajes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3249 (class 2606 OID 42289)
-- Name: personaje_habita_reino personaje_habita_reino_id_reino_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personaje_habita_reino
    ADD CONSTRAINT personaje_habita_reino_id_reino_fkey FOREIGN KEY (id_reino) REFERENCES public.reinos(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3246 (class 2606 OID 42271)
-- Name: personaje_tiene_trabajo personaje_tiene_trabajo_id_personaje_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personaje_tiene_trabajo
    ADD CONSTRAINT personaje_tiene_trabajo_id_personaje_fkey FOREIGN KEY (id_personaje) REFERENCES public.personajes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3247 (class 2606 OID 42266)
-- Name: personaje_tiene_trabajo personaje_tiene_trabajo_id_trabajo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personaje_tiene_trabajo
    ADD CONSTRAINT personaje_tiene_trabajo_id_trabajo_fkey FOREIGN KEY (id_trabajo) REFERENCES public.trabajos(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3244 (class 2606 OID 42256)
-- Name: reino_tiene_defensa reino_tiene_defensa_id_defensa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reino_tiene_defensa
    ADD CONSTRAINT reino_tiene_defensa_id_defensa_fkey FOREIGN KEY (id_defensa) REFERENCES public.defensas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3245 (class 2606 OID 42251)
-- Name: reino_tiene_defensa reino_tiene_defensa_id_reino_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reino_tiene_defensa
    ADD CONSTRAINT reino_tiene_defensa_id_reino_fkey FOREIGN KEY (id_reino) REFERENCES public.reinos(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2023-06-12 21:47:17

--
-- PostgreSQL database dump complete
--

