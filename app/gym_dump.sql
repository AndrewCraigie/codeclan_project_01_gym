--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
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
-- Name: gym_class_categories; Type: TABLE; Schema: public; Owner: andrew
--

CREATE TABLE public.gym_class_categories (
    id bigint NOT NULL,
    name character varying(255),
    description character varying(255)
);


ALTER TABLE public.gym_class_categories OWNER TO andrew;

--
-- Name: gym_class_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: andrew
--

CREATE SEQUENCE public.gym_class_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gym_class_categories_id_seq OWNER TO andrew;

--
-- Name: gym_class_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrew
--

ALTER SEQUENCE public.gym_class_categories_id_seq OWNED BY public.gym_class_categories.id;


--
-- Name: gym_classes; Type: TABLE; Schema: public; Owner: andrew
--

CREATE TABLE public.gym_classes (
    id bigint NOT NULL,
    name character varying(255),
    description text,
    intensity_id integer
);


ALTER TABLE public.gym_classes OWNER TO andrew;

--
-- Name: gym_classes_categories; Type: TABLE; Schema: public; Owner: andrew
--

CREATE TABLE public.gym_classes_categories (
    id bigint NOT NULL,
    class_id integer,
    gym_class_category_id integer
);


ALTER TABLE public.gym_classes_categories OWNER TO andrew;

--
-- Name: gym_classes_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: andrew
--

CREATE SEQUENCE public.gym_classes_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gym_classes_categories_id_seq OWNER TO andrew;

--
-- Name: gym_classes_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrew
--

ALTER SEQUENCE public.gym_classes_categories_id_seq OWNED BY public.gym_classes_categories.id;


--
-- Name: gym_classes_id_seq; Type: SEQUENCE; Schema: public; Owner: andrew
--

CREATE SEQUENCE public.gym_classes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gym_classes_id_seq OWNER TO andrew;

--
-- Name: gym_classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrew
--

ALTER SEQUENCE public.gym_classes_id_seq OWNED BY public.gym_classes.id;


--
-- Name: intensities; Type: TABLE; Schema: public; Owner: andrew
--

CREATE TABLE public.intensities (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.intensities OWNER TO andrew;

--
-- Name: intensities_id_seq; Type: SEQUENCE; Schema: public; Owner: andrew
--

CREATE SEQUENCE public.intensities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.intensities_id_seq OWNER TO andrew;

--
-- Name: intensities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrew
--

ALTER SEQUENCE public.intensities_id_seq OWNED BY public.intensities.id;


--
-- Name: membership_types; Type: TABLE; Schema: public; Owner: andrew
--

CREATE TABLE public.membership_types (
    id bigint NOT NULL,
    name character varying(255),
    description character varying(255)
);


ALTER TABLE public.membership_types OWNER TO andrew;

--
-- Name: membership_types_id_seq; Type: SEQUENCE; Schema: public; Owner: andrew
--

CREATE SEQUENCE public.membership_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.membership_types_id_seq OWNER TO andrew;

--
-- Name: membership_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrew
--

ALTER SEQUENCE public.membership_types_id_seq OWNED BY public.membership_types.id;


--
-- Name: memberships; Type: TABLE; Schema: public; Owner: andrew
--

CREATE TABLE public.memberships (
    id bigint NOT NULL,
    membership_number integer,
    start_date date,
    end_date date,
    membership_type_id integer
);


ALTER TABLE public.memberships OWNER TO andrew;

--
-- Name: memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: andrew
--

CREATE SEQUENCE public.memberships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.memberships_id_seq OWNER TO andrew;

--
-- Name: memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrew
--

ALTER SEQUENCE public.memberships_id_seq OWNED BY public.memberships.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: andrew
--

CREATE TABLE public.messages (
    id bigint NOT NULL,
    message text,
    date_time_added timestamp without time zone,
    person_id integer
);


ALTER TABLE public.messages OWNER TO andrew;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: andrew
--

CREATE SEQUENCE public.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO andrew;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrew
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: andrew
--

CREATE TABLE public.payments (
    id bigint NOT NULL,
    description character varying(255),
    amount numeric,
    person_id integer
);


ALTER TABLE public.payments OWNER TO andrew;

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: andrew
--

CREATE SEQUENCE public.payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_id_seq OWNER TO andrew;

--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrew
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- Name: persons; Type: TABLE; Schema: public; Owner: andrew
--

CREATE TABLE public.persons (
    id bigint NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    street_address character varying(255),
    city character varying(255),
    postcode character varying(255),
    telephone_number character varying(255),
    mobile_number character varying(255),
    email_address character varying(255),
    photo_url character varying(255),
    role_id integer
);


ALTER TABLE public.persons OWNER TO andrew;

--
-- Name: persons_id_seq; Type: SEQUENCE; Schema: public; Owner: andrew
--

CREATE SEQUENCE public.persons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persons_id_seq OWNER TO andrew;

--
-- Name: persons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrew
--

ALTER SEQUENCE public.persons_id_seq OWNED BY public.persons.id;


--
-- Name: persons_memberships; Type: TABLE; Schema: public; Owner: andrew
--

CREATE TABLE public.persons_memberships (
    id bigint NOT NULL,
    person_id integer,
    membership_id integer
);


ALTER TABLE public.persons_memberships OWNER TO andrew;

--
-- Name: persons_memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: andrew
--

CREATE SEQUENCE public.persons_memberships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persons_memberships_id_seq OWNER TO andrew;

--
-- Name: persons_memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrew
--

ALTER SEQUENCE public.persons_memberships_id_seq OWNED BY public.persons_memberships.id;


--
-- Name: persons_sessions; Type: TABLE; Schema: public; Owner: andrew
--

CREATE TABLE public.persons_sessions (
    id bigint NOT NULL,
    date_time_added timestamp without time zone,
    reserve boolean,
    person_id integer,
    session_id integer
);


ALTER TABLE public.persons_sessions OWNER TO andrew;

--
-- Name: persons_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: andrew
--

CREATE SEQUENCE public.persons_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persons_sessions_id_seq OWNER TO andrew;

--
-- Name: persons_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrew
--

ALTER SEQUENCE public.persons_sessions_id_seq OWNED BY public.persons_sessions.id;


--
-- Name: playlist_songs; Type: TABLE; Schema: public; Owner: andrew
--

CREATE TABLE public.playlist_songs (
    id bigint NOT NULL,
    gym_class_id integer,
    song_id integer
);


ALTER TABLE public.playlist_songs OWNER TO andrew;

--
-- Name: playlist_songs_id_seq; Type: SEQUENCE; Schema: public; Owner: andrew
--

CREATE SEQUENCE public.playlist_songs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.playlist_songs_id_seq OWNER TO andrew;

--
-- Name: playlist_songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrew
--

ALTER SEQUENCE public.playlist_songs_id_seq OWNED BY public.playlist_songs.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: andrew
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.roles OWNER TO andrew;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: andrew
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO andrew;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrew
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: andrew
--

CREATE TABLE public.rooms (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.rooms OWNER TO andrew;

--
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: andrew
--

CREATE SEQUENCE public.rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_id_seq OWNER TO andrew;

--
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrew
--

ALTER SEQUENCE public.rooms_id_seq OWNED BY public.rooms.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: andrew
--

CREATE TABLE public.sessions (
    id bigint NOT NULL,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    capacity integer,
    gym_class_id integer,
    instructor_id integer,
    room_id integer
);


ALTER TABLE public.sessions OWNER TO andrew;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: andrew
--

CREATE SEQUENCE public.sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO andrew;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrew
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: songs; Type: TABLE; Schema: public; Owner: andrew
--

CREATE TABLE public.songs (
    id bigint NOT NULL,
    name character varying(255),
    artist character varying(255),
    duration interval
);


ALTER TABLE public.songs OWNER TO andrew;

--
-- Name: songs_id_seq; Type: SEQUENCE; Schema: public; Owner: andrew
--

CREATE SEQUENCE public.songs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.songs_id_seq OWNER TO andrew;

--
-- Name: songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrew
--

ALTER SEQUENCE public.songs_id_seq OWNED BY public.songs.id;


--
-- Name: gym_class_categories id; Type: DEFAULT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.gym_class_categories ALTER COLUMN id SET DEFAULT nextval('public.gym_class_categories_id_seq'::regclass);


--
-- Name: gym_classes id; Type: DEFAULT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.gym_classes ALTER COLUMN id SET DEFAULT nextval('public.gym_classes_id_seq'::regclass);


--
-- Name: gym_classes_categories id; Type: DEFAULT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.gym_classes_categories ALTER COLUMN id SET DEFAULT nextval('public.gym_classes_categories_id_seq'::regclass);


--
-- Name: intensities id; Type: DEFAULT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.intensities ALTER COLUMN id SET DEFAULT nextval('public.intensities_id_seq'::regclass);


--
-- Name: membership_types id; Type: DEFAULT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.membership_types ALTER COLUMN id SET DEFAULT nextval('public.membership_types_id_seq'::regclass);


--
-- Name: memberships id; Type: DEFAULT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.memberships ALTER COLUMN id SET DEFAULT nextval('public.memberships_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- Name: persons id; Type: DEFAULT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.persons ALTER COLUMN id SET DEFAULT nextval('public.persons_id_seq'::regclass);


--
-- Name: persons_memberships id; Type: DEFAULT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.persons_memberships ALTER COLUMN id SET DEFAULT nextval('public.persons_memberships_id_seq'::regclass);


--
-- Name: persons_sessions id; Type: DEFAULT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.persons_sessions ALTER COLUMN id SET DEFAULT nextval('public.persons_sessions_id_seq'::regclass);


--
-- Name: playlist_songs id; Type: DEFAULT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.playlist_songs ALTER COLUMN id SET DEFAULT nextval('public.playlist_songs_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: rooms id; Type: DEFAULT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.rooms ALTER COLUMN id SET DEFAULT nextval('public.rooms_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: songs id; Type: DEFAULT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.songs ALTER COLUMN id SET DEFAULT nextval('public.songs_id_seq'::regclass);


--
-- Data for Name: gym_class_categories; Type: TABLE DATA; Schema: public; Owner: andrew
--

COPY public.gym_class_categories (id, name, description) FROM stdin;
1	Cardio	Get your heart beating
2	Strength	Build those muscles
3	Tone	For a sleek and lean body
4	Flexibility	Get supple and bendy
5	Wellbeing	Taking care of your inner and outer self
6	Combat	Get FITTING fit
\.


--
-- Data for Name: gym_classes; Type: TABLE DATA; Schema: public; Owner: andrew
--

COPY public.gym_classes (id, name, description, intensity_id) FROM stdin;
1	Meta Fit	Metafit is a high-intensity workout including a series of body-weight exercises with interval style training, designed to keep your body burning calories long after your training session is complete.\n\n  Designed by a former marine, this is a class you can be sure to push your limits in.\n\n  It’s only thirty minutes long, but you will train hard the entire time. It’s suitable for everyone and you can adjust the exercises to suit your own abilities.	2
2	Body Pump	Using weights and repetitions, Body Pump is designed to sculpt, tone and strengthen.\n\n  If you're feeling out of shape, this class will challenge and change your body for the better.\n\n  This dynamic resistance training class gets all the muscle groups working, building strength and conditioning your body. Squat, lift and curl to music that will lift your spirits as you lift those weights.	3
\.


--
-- Data for Name: gym_classes_categories; Type: TABLE DATA; Schema: public; Owner: andrew
--

COPY public.gym_classes_categories (id, class_id, gym_class_category_id) FROM stdin;
1	1	1
2	1	4
3	2	1
4	2	6
\.


--
-- Data for Name: intensities; Type: TABLE DATA; Schema: public; Owner: andrew
--

COPY public.intensities (id, name) FROM stdin;
1	Beginner
2	Intermediate
3	Advanced
\.


--
-- Data for Name: membership_types; Type: TABLE DATA; Schema: public; Owner: andrew
--

COPY public.membership_types (id, name, description) FROM stdin;
1	standard	Standard memberhip
2	premium	Premium memberhip
3	employee	Staff memberhip
\.


--
-- Data for Name: memberships; Type: TABLE DATA; Schema: public; Owner: andrew
--

COPY public.memberships (id, membership_number, start_date, end_date, membership_type_id) FROM stdin;
1	1	2016-09-10	2017-09-09	1
2	2	2017-06-21	2018-06-20	2
3	3	2017-06-21	2018-06-20	3
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: andrew
--

COPY public.messages (id, message, date_time_added, person_id) FROM stdin;
1	You have been booked in to Meta Fit	2018-08-15 12:48:41	1
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: andrew
--

COPY public.payments (id, description, amount, person_id) FROM stdin;
1	Priority booking supplement for Meta Fit	2.5	3
\.


--
-- Data for Name: persons; Type: TABLE DATA; Schema: public; Owner: andrew
--

COPY public.persons (id, first_name, last_name, street_address, city, postcode, telephone_number, mobile_number, email_address, photo_url, role_id) FROM stdin;
1	Helen	Bruce	123 Brown Street	Glasgow	G42 8PU	0141 424 1234	07743662806	h.bruce@gmail.com	0001.jpg	1
2	Oiver	Maxwell	18 Thistle Place	Glasgow	G41 9PD	0141 420 1234	07543677780	olivermax23@btinternet.com	0002.jpg	2
3	Steven	Adams	9 Stewart Crescent	Glasgow	G12 0ES	0141 214 1234	07544677780	sadams@sadams.co.uk	0003.jpg	1
\.


--
-- Data for Name: persons_memberships; Type: TABLE DATA; Schema: public; Owner: andrew
--

COPY public.persons_memberships (id, person_id, membership_id) FROM stdin;
1	1	1
2	3	2
3	2	3
\.


--
-- Data for Name: persons_sessions; Type: TABLE DATA; Schema: public; Owner: andrew
--

COPY public.persons_sessions (id, date_time_added, reserve, person_id, session_id) FROM stdin;
1	2018-08-15 12:48:41	f	1	1
\.


--
-- Data for Name: playlist_songs; Type: TABLE DATA; Schema: public; Owner: andrew
--

COPY public.playlist_songs (id, gym_class_id, song_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	7
7	1	7
8	1	8
9	1	9
10	1	10
11	1	11
12	2	2
13	2	3
14	2	4
15	2	5
16	2	7
17	2	7
18	2	8
19	2	9
20	2	10
21	2	11
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: andrew
--

COPY public.roles (id, name) FROM stdin;
1	customer
2	employee
\.


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: andrew
--

COPY public.rooms (id, name) FROM stdin;
1	Studio 1
2	Studio 2
3	Studio 3
4	Studio 4
5	Gym Hall 1
6	Gym Hall 2
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: andrew
--

COPY public.sessions (id, start_time, end_time, capacity, gym_class_id, instructor_id, room_id) FROM stdin;
1	2018-08-12 15:30:00	2018-08-12 16:20:00	20	2	2	1
2	2018-10-10 10:10:00	2018-10-10 11:00:00	2	1	2	1
\.


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: andrew
--

COPY public.songs (id, name, artist, duration) FROM stdin;
1	Till I Collapse	Eminem (ft.Nate Dogg)	00:04:57
2	Rockstar	Post Malone (ft. 21 Savage)	00:03:38
3	Lose Yourself	Eminem	00:05:26
4	HUMBLE	Kendrick Lamar	00:02:57
5	More Than You Know	Axwell Ingrosso	00:03:23
6	Mi Gente	J Balvin (ft. Beyonce)	00:03:29
7	Havana	Camila Cabello	00:03:37
8	You Don't Know Me	Jax Jones (Radio edit)	00:03:33
9	New Rules	Dua Lipa (Initial Talk remix)	00:03:44
10	POWER	Kanye West	00:04:52
11	Raise Your Hands	Ummet Ozcan	00:04:26
\.


--
-- Name: gym_class_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrew
--

SELECT pg_catalog.setval('public.gym_class_categories_id_seq', 6, true);


--
-- Name: gym_classes_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrew
--

SELECT pg_catalog.setval('public.gym_classes_categories_id_seq', 4, true);


--
-- Name: gym_classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrew
--

SELECT pg_catalog.setval('public.gym_classes_id_seq', 2, true);


--
-- Name: intensities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrew
--

SELECT pg_catalog.setval('public.intensities_id_seq', 3, true);


--
-- Name: membership_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrew
--

SELECT pg_catalog.setval('public.membership_types_id_seq', 3, true);


--
-- Name: memberships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrew
--

SELECT pg_catalog.setval('public.memberships_id_seq', 3, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrew
--

SELECT pg_catalog.setval('public.messages_id_seq', 1, true);


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrew
--

SELECT pg_catalog.setval('public.payments_id_seq', 1, true);


--
-- Name: persons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrew
--

SELECT pg_catalog.setval('public.persons_id_seq', 3, true);


--
-- Name: persons_memberships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrew
--

SELECT pg_catalog.setval('public.persons_memberships_id_seq', 3, true);


--
-- Name: persons_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrew
--

SELECT pg_catalog.setval('public.persons_sessions_id_seq', 6, true);


--
-- Name: playlist_songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrew
--

SELECT pg_catalog.setval('public.playlist_songs_id_seq', 21, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrew
--

SELECT pg_catalog.setval('public.roles_id_seq', 2, true);


--
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrew
--

SELECT pg_catalog.setval('public.rooms_id_seq', 6, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrew
--

SELECT pg_catalog.setval('public.sessions_id_seq', 2, true);


--
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrew
--

SELECT pg_catalog.setval('public.songs_id_seq', 11, true);


--
-- Name: gym_class_categories gym_class_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.gym_class_categories
    ADD CONSTRAINT gym_class_categories_pkey PRIMARY KEY (id);


--
-- Name: gym_classes_categories gym_classes_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.gym_classes_categories
    ADD CONSTRAINT gym_classes_categories_pkey PRIMARY KEY (id);


--
-- Name: gym_classes gym_classes_pkey; Type: CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.gym_classes
    ADD CONSTRAINT gym_classes_pkey PRIMARY KEY (id);


--
-- Name: intensities intensities_pkey; Type: CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.intensities
    ADD CONSTRAINT intensities_pkey PRIMARY KEY (id);


--
-- Name: membership_types membership_types_pkey; Type: CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.membership_types
    ADD CONSTRAINT membership_types_pkey PRIMARY KEY (id);


--
-- Name: memberships memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.memberships
    ADD CONSTRAINT memberships_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: persons_memberships persons_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.persons_memberships
    ADD CONSTRAINT persons_memberships_pkey PRIMARY KEY (id);


--
-- Name: persons persons_pkey; Type: CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_pkey PRIMARY KEY (id);


--
-- Name: persons_sessions persons_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.persons_sessions
    ADD CONSTRAINT persons_sessions_pkey PRIMARY KEY (id);


--
-- Name: playlist_songs playlist_songs_pkey; Type: CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.playlist_songs
    ADD CONSTRAINT playlist_songs_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (id);


--
-- Name: gym_classes_categories gym_classes_categories_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.gym_classes_categories
    ADD CONSTRAINT gym_classes_categories_class_id_fkey FOREIGN KEY (class_id) REFERENCES public.gym_classes(id) ON DELETE CASCADE;


--
-- Name: gym_classes_categories gym_classes_categories_gym_class_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.gym_classes_categories
    ADD CONSTRAINT gym_classes_categories_gym_class_category_id_fkey FOREIGN KEY (gym_class_category_id) REFERENCES public.gym_class_categories(id) ON DELETE CASCADE;


--
-- Name: gym_classes gym_classes_intensity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.gym_classes
    ADD CONSTRAINT gym_classes_intensity_id_fkey FOREIGN KEY (intensity_id) REFERENCES public.intensities(id) ON DELETE CASCADE;


--
-- Name: memberships memberships_membership_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.memberships
    ADD CONSTRAINT memberships_membership_type_id_fkey FOREIGN KEY (membership_type_id) REFERENCES public.membership_types(id) ON DELETE CASCADE;


--
-- Name: messages messages_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.persons(id) ON DELETE CASCADE;


--
-- Name: payments payments_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.persons(id) ON DELETE CASCADE;


--
-- Name: persons_memberships persons_memberships_membership_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.persons_memberships
    ADD CONSTRAINT persons_memberships_membership_id_fkey FOREIGN KEY (membership_id) REFERENCES public.memberships(id) ON DELETE CASCADE;


--
-- Name: persons_memberships persons_memberships_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.persons_memberships
    ADD CONSTRAINT persons_memberships_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.persons(id) ON DELETE CASCADE;


--
-- Name: persons persons_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: persons_sessions persons_sessions_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.persons_sessions
    ADD CONSTRAINT persons_sessions_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.persons(id) ON DELETE CASCADE;


--
-- Name: persons_sessions persons_sessions_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.persons_sessions
    ADD CONSTRAINT persons_sessions_session_id_fkey FOREIGN KEY (session_id) REFERENCES public.sessions(id) ON DELETE CASCADE;


--
-- Name: playlist_songs playlist_songs_gym_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.playlist_songs
    ADD CONSTRAINT playlist_songs_gym_class_id_fkey FOREIGN KEY (gym_class_id) REFERENCES public.gym_classes(id) ON DELETE CASCADE;


--
-- Name: playlist_songs playlist_songs_song_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.playlist_songs
    ADD CONSTRAINT playlist_songs_song_id_fkey FOREIGN KEY (song_id) REFERENCES public.songs(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_gym_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_gym_class_id_fkey FOREIGN KEY (gym_class_id) REFERENCES public.gym_classes(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_instructor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_instructor_id_fkey FOREIGN KEY (instructor_id) REFERENCES public.persons(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

