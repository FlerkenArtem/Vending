--
-- PostgreSQL database dump
--

\restrict KOIyyso2oSRvgB8nGRfkeK1JeK5qMY8Wfx9bcihcaIafs1CsgXO2lj9kAav27RM

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-10-15 15:48:07

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 220 (class 1259 OID 19751)
-- Name: buying; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buying (
    id bigint NOT NULL,
    vending bigint NOT NULL,
    product bigint NOT NULL,
    buying_price numeric(10,2) NOT NULL,
    quantity integer NOT NULL,
    buying_date_time timestamp with time zone NOT NULL,
    payment_method bigint NOT NULL
);


ALTER TABLE public.buying OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 19750)
-- Name: buying_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.buying_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.buying_id_seq OWNER TO postgres;

--
-- TOC entry 5156 (class 0 OID 0)
-- Dependencies: 219
-- Name: buying_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.buying_id_seq OWNED BY public.buying.id;


--
-- TOC entry 222 (class 1259 OID 19765)
-- Name: buying_payment_method; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buying_payment_method (
    id bigint NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.buying_payment_method OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 19764)
-- Name: buying_payment_method_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.buying_payment_method_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.buying_payment_method_id_seq OWNER TO postgres;

--
-- TOC entry 5157 (class 0 OID 0)
-- Dependencies: 221
-- Name: buying_payment_method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.buying_payment_method_id_seq OWNED BY public.buying_payment_method.id;


--
-- TOC entry 224 (class 1259 OID 19776)
-- Name: maintenance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maintenance (
    id bigint NOT NULL,
    vending bigint NOT NULL,
    maintenance_datetime timestamp with time zone NOT NULL,
    work_info text NOT NULL,
    problem_info text,
    worker bigint NOT NULL
);


ALTER TABLE public.maintenance OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 19775)
-- Name: maintenance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maintenance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.maintenance_id_seq OWNER TO postgres;

--
-- TOC entry 5158 (class 0 OID 0)
-- Dependencies: 223
-- Name: maintenance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maintenance_id_seq OWNED BY public.maintenance.id;


--
-- TOC entry 226 (class 1259 OID 19790)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id bigint NOT NULL,
    name character varying NOT NULL,
    info text,
    price numeric(10,2) NOT NULL,
    quantity integer NOT NULL,
    min_quantity integer NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 19789)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 5159 (class 0 OID 0)
-- Dependencies: 225
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 228 (class 1259 OID 19804)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id bigint NOT NULL,
    surname character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    patronymic character varying(100),
    email character varying(255) NOT NULL,
    phone_num character(12) NOT NULL,
    role bigint NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 19803)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 5160 (class 0 OID 0)
-- Dependencies: 227
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 230 (class 1259 OID 19823)
-- Name: user_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_role (
    id bigint NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.user_role OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 19822)
-- Name: user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_role_id_seq OWNER TO postgres;

--
-- TOC entry 5161 (class 0 OID 0)
-- Dependencies: 229
-- Name: user_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_role_id_seq OWNED BY public.user_role.id;


--
-- TOC entry 232 (class 1259 OID 19834)
-- Name: vending; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vending (
    id bigint NOT NULL,
    location text NOT NULL,
    model bigint NOT NULL,
    type bigint NOT NULL,
    serial_num character varying(20) NOT NULL,
    inv_num character varying(20) NOT NULL,
    manufacturer bigint NOT NULL,
    modem integer NOT NULL,
    manufacture_date timestamp with time zone NOT NULL,
    added_to_work timestamp with time zone NOT NULL,
    last_verification_date timestamp with time zone NOT NULL,
    verification_interval integer NOT NULL,
    resource integer NOT NULL,
    service_duration smallint NOT NULL,
    status bigint NOT NULL,
    country bigint NOT NULL
);


ALTER TABLE public.vending OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 19863)
-- Name: vending_country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vending_country (
    id bigint NOT NULL,
    name character varying(100)
);


ALTER TABLE public.vending_country OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 19862)
-- Name: vending_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vending_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vending_country_id_seq OWNER TO postgres;

--
-- TOC entry 5162 (class 0 OID 0)
-- Dependencies: 233
-- Name: vending_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vending_country_id_seq OWNED BY public.vending_country.id;


--
-- TOC entry 231 (class 1259 OID 19833)
-- Name: vending_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vending_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vending_id_seq OWNER TO postgres;

--
-- TOC entry 5163 (class 0 OID 0)
-- Dependencies: 231
-- Name: vending_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vending_id_seq OWNED BY public.vending.id;


--
-- TOC entry 236 (class 1259 OID 19873)
-- Name: vending_manufacturer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vending_manufacturer (
    id bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.vending_manufacturer OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 19872)
-- Name: vending_manufacturer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vending_manufacturer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vending_manufacturer_id_seq OWNER TO postgres;

--
-- TOC entry 5164 (class 0 OID 0)
-- Dependencies: 235
-- Name: vending_manufacturer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vending_manufacturer_id_seq OWNED BY public.vending_manufacturer.id;


--
-- TOC entry 238 (class 1259 OID 19886)
-- Name: vending_model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vending_model (
    id bigint NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.vending_model OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 19885)
-- Name: vending_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vending_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vending_model_id_seq OWNER TO postgres;

--
-- TOC entry 5165 (class 0 OID 0)
-- Dependencies: 237
-- Name: vending_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vending_model_id_seq OWNED BY public.vending_model.id;


--
-- TOC entry 240 (class 1259 OID 19897)
-- Name: vending_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vending_status (
    id bigint NOT NULL,
    status character varying(100) NOT NULL
);


ALTER TABLE public.vending_status OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 19896)
-- Name: vending_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vending_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vending_status_id_seq OWNER TO postgres;

--
-- TOC entry 5166 (class 0 OID 0)
-- Dependencies: 239
-- Name: vending_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vending_status_id_seq OWNED BY public.vending_status.id;


--
-- TOC entry 242 (class 1259 OID 19908)
-- Name: vending_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vending_type (
    id bigint NOT NULL,
    type character varying NOT NULL
);


ALTER TABLE public.vending_type OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 19907)
-- Name: vending_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vending_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vending_type_id_seq OWNER TO postgres;

--
-- TOC entry 5167 (class 0 OID 0)
-- Dependencies: 241
-- Name: vending_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vending_type_id_seq OWNED BY public.vending_type.id;


--
-- TOC entry 4911 (class 2604 OID 19754)
-- Name: buying id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buying ALTER COLUMN id SET DEFAULT nextval('public.buying_id_seq'::regclass);


--
-- TOC entry 4912 (class 2604 OID 19768)
-- Name: buying_payment_method id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buying_payment_method ALTER COLUMN id SET DEFAULT nextval('public.buying_payment_method_id_seq'::regclass);


--
-- TOC entry 4913 (class 2604 OID 19779)
-- Name: maintenance id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance ALTER COLUMN id SET DEFAULT nextval('public.maintenance_id_seq'::regclass);


--
-- TOC entry 4914 (class 2604 OID 19793)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 4915 (class 2604 OID 19807)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 4916 (class 2604 OID 19826)
-- Name: user_role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role ALTER COLUMN id SET DEFAULT nextval('public.user_role_id_seq'::regclass);


--
-- TOC entry 4917 (class 2604 OID 19837)
-- Name: vending id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vending ALTER COLUMN id SET DEFAULT nextval('public.vending_id_seq'::regclass);


--
-- TOC entry 4918 (class 2604 OID 19866)
-- Name: vending_country id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vending_country ALTER COLUMN id SET DEFAULT nextval('public.vending_country_id_seq'::regclass);


--
-- TOC entry 4919 (class 2604 OID 19876)
-- Name: vending_manufacturer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vending_manufacturer ALTER COLUMN id SET DEFAULT nextval('public.vending_manufacturer_id_seq'::regclass);


--
-- TOC entry 4920 (class 2604 OID 19889)
-- Name: vending_model id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vending_model ALTER COLUMN id SET DEFAULT nextval('public.vending_model_id_seq'::regclass);


--
-- TOC entry 4921 (class 2604 OID 19900)
-- Name: vending_status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vending_status ALTER COLUMN id SET DEFAULT nextval('public.vending_status_id_seq'::regclass);


--
-- TOC entry 4922 (class 2604 OID 19911)
-- Name: vending_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vending_type ALTER COLUMN id SET DEFAULT nextval('public.vending_type_id_seq'::regclass);


--
-- TOC entry 5128 (class 0 OID 19751)
-- Dependencies: 220
-- Data for Name: buying; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.buying (id, vending, product, buying_price, quantity, buying_date_time, payment_method) FROM stdin;
2001	14	1014	88.00	4	2026-10-04 16:10:00+03	1
2002	27	1027	73.50	4	2026-10-02 14:20:00+03	2
2003	40	1040	75.00	4	2026-10-01 16:20:00+03	2
2004	53	1053	81.00	3	2026-10-03 21:45:00+03	3
2005	66	1066	108.00	2	2026-10-10 13:00:00+03	1
2006	79	1079	85.00	4	2026-10-13 10:45:00+03	1
2007	92	1092	94.50	3	2026-10-11 17:10:00+03	3
2008	105	1105	99.00	4	2026-10-10 09:00:00+03	3
2009	118	1118	99.75	1	2026-10-06 21:30:00+03	3
2010	11	1131	190.00	3	2026-10-03 18:10:00+03	1
2011	24	1144	165.00	2	2026-10-13 15:00:00+03	1
2012	37	1157	198.00	3	2026-10-06 08:50:00+03	1
2013	10	1010	68.25	4	2026-10-08 21:20:00+03	1
2014	23	1023	135.00	3	2026-10-07 17:40:00+03	2
2015	36	1036	90.00	1	2026-10-04 08:30:00+03	3
2016	49	1049	144.00	1	2026-10-09 08:10:00+03	1
2017	62	1062	72.00	3	2026-10-13 21:10:00+03	2
2018	75	1075	70.00	1	2026-10-05 13:45:00+03	1
2019	88	1088	78.75	3	2026-10-15 19:20:00+03	3
2020	101	1101	81.00	1	2026-10-09 19:50:00+03	1
2021	114	1114	126.00	4	2026-10-10 07:15:00+03	2
2022	7	1127	89.25	4	2026-10-01 11:30:00+03	2
2023	20	1140	94.50	1	2026-10-13 14:40:00+03	3
2024	33	1153	121.00	4	2026-10-05 07:30:00+03	2
2025	6	1006	85.50	2	2026-10-01 12:10:00+03	1
2026	19	1019	199.50	1	2026-10-14 13:10:00+03	2
2027	32	1032	135.00	4	2026-10-06 09:10:00+03	2
2028	45	1045	220.00	1	2026-10-08 12:50:00+03	1
2029	58	1058	71.50	3	2026-10-14 17:45:00+03	2
2030	71	1071	141.75	1	2026-10-06 17:10:00+03	1
2031	84	1084	100.00	4	2026-10-11 16:50:00+03	3
2032	97	1097	144.00	1	2026-10-02 08:15:00+03	3
2033	110	1110	84.00	1	2026-10-02 07:15:00+03	3
2034	3	1123	63.00	4	2026-10-06 07:00:00+03	3
2035	16	1136	75.00	4	2026-10-01 14:20:00+03	3
2036	29	1149	99.00	1	2026-10-14 09:10:00+03	1
2037	2	1002	108.00	3	2026-10-14 15:40:00+03	2
2038	15	1015	85.00	4	2026-10-09 17:10:00+03	2
2039	28	1028	105.00	3	2026-10-02 18:50:00+03	2
2040	41	1041	115.50	4	2026-10-08 17:15:00+03	2
2041	54	1054	95.00	4	2026-10-04 16:00:00+03	3
2042	67	1067	209.00	3	2026-10-06 17:45:00+03	2
2043	80	1080	135.00	1	2026-10-12 10:15:00+03	1
2044	93	1093	198.00	4	2026-10-11 07:20:00+03	3
2045	106	1106	68.25	4	2026-10-06 08:10:00+03	1
2046	119	1119	121.50	4	2026-10-04 09:10:00+03	2
2047	12	1132	100.00	4	2026-10-04 08:30:00+03	1
2048	25	1145	176.00	2	2026-10-06 15:30:00+03	1
2049	38	1158	84.00	2	2026-10-07 14:00:00+03	3
2050	11	1011	77.00	1	2026-10-01 12:40:00+03	1
2051	24	1024	78.75	4	2026-10-06 17:10:00+03	3
2052	37	1037	81.00	3	2026-10-10 16:15:00+03	3
2053	50	1050	120.00	2	2026-10-06 19:30:00+03	1
2054	63	1063	89.25	1	2026-10-04 07:20:00+03	1
2055	76	1076	94.50	1	2026-10-10 14:40:00+03	3
2056	89	1089	121.00	2	2026-10-05 17:50:00+03	1
2057	102	1102	95.00	1	2026-10-12 18:30:00+03	2
2058	115	1115	209.00	3	2026-10-13 08:40:00+03	1
2059	8	1128	150.00	3	2026-10-09 14:40:00+03	3
2060	21	1141	242.00	4	2026-10-07 08:45:00+03	2
2061	34	1154	68.25	1	2026-10-07 13:00:00+03	2
2062	7	1007	135.00	2	2026-10-06 18:00:00+03	3
2063	20	1020	105.00	2	2026-10-11 09:40:00+03	1
2064	33	1033	144.00	1	2026-10-03 21:15:00+03	3
2065	46	1046	88.00	1	2026-10-04 07:00:00+03	1
2066	59	1059	70.00	1	2026-10-02 17:00:00+03	1
2067	72	1072	78.75	1	2026-10-11 21:30:00+03	2
2068	85	1085	90.00	4	2026-10-11 09:30:00+03	3
2069	98	1098	120.00	2	2026-10-04 21:10:00+03	2
2070	111	1111	89.25	2	2026-10-08 19:10:00+03	1
2071	4	1124	115.50	3	2026-10-13 12:50:00+03	1
2072	17	1137	99.00	3	2026-10-11 18:45:00+03	3
2073	30	1150	85.50	1	2026-10-13 10:40:00+03	1
2074	3	1003	199.50	3	2026-10-04 21:20:00+03	1
2075	16	1016	135.00	2	2026-10-09 14:20:00+03	1
2076	29	1029	231.00	3	2026-10-11 09:15:00+03	1
2077	42	1042	65.00	3	2026-10-06 07:00:00+03	1
2078	55	1055	148.50	1	2026-10-14 12:10:00+03	3
2079	68	1068	105.00	1	2026-10-09 18:15:00+03	3
2080	81	1081	176.00	4	2026-10-14 16:40:00+03	3
2081	94	1094	80.00	4	2026-10-14 11:00:00+03	2
2082	107	1107	63.00	4	2026-10-14 10:50:00+03	2
2083	120	1120	67.50	2	2026-10-02 19:10:00+03	2
2084	13	1133	94.50	2	2026-10-02 20:15:00+03	3
2085	26	1146	126.00	4	2026-10-07 11:20:00+03	3
2086	39	1159	85.00	2	2026-10-03 14:10:00+03	2
2087	12	1012	94.50	3	2026-10-01 08:10:00+03	2
2088	25	1025	110.00	2	2026-10-13 17:30:00+03	1
2089	38	1038	95.00	3	2026-10-15 07:30:00+03	1
2090	51	1051	171.00	4	2026-10-09 16:15:00+03	1
2091	64	1064	165.00	1	2026-10-04 11:00:00+03	1
2092	77	1077	198.00	1	2026-10-05 20:40:00+03	1
2093	90	1090	68.25	4	2026-10-11 12:50:00+03	2
2094	103	1103	141.75	2	2026-10-08 19:40:00+03	2
2095	116	1116	90.00	2	2026-10-11 14:40:00+03	2
2096	9	1129	160.00	2	2026-10-05 15:50:00+03	2
2097	22	1142	88.00	4	2026-10-06 07:20:00+03	1
2098	35	1155	77.00	4	2026-10-15 07:40:00+03	1
2099	8	1008	75.00	1	2026-10-08 14:45:00+03	2
2100	21	1021	94.50	2	2026-10-08 08:15:00+03	1
2101	34	1034	108.00	4	2026-10-06 16:10:00+03	1
2102	47	1047	76.50	4	2026-10-06 10:50:00+03	3
2103	60	1060	115.50	4	2026-10-08 12:40:00+03	1
2104	73	1073	110.00	2	2026-10-05 12:45:00+03	3
2105	86	1086	95.00	1	2026-10-09 16:45:00+03	3
2106	99	1099	190.00	2	2026-10-15 10:30:00+03	3
2107	112	1112	150.00	4	2026-10-02 18:15:00+03	2
2108	5	1125	198.00	2	2026-10-04 09:20:00+03	2
2109	18	1138	65.00	2	2026-10-15 12:50:00+03	3
2110	31	1151	135.00	1	2026-10-08 19:15:00+03	2
2111	4	1004	90.00	3	2026-10-06 07:45:00+03	3
2112	17	1017	176.00	4	2026-10-12 21:00:00+03	3
2113	30	1030	84.00	2	2026-10-13 14:15:00+03	2
2114	43	1043	73.50	3	2026-10-01 16:10:00+03	2
2115	56	1056	82.50	3	2026-10-14 11:10:00+03	1
2116	69	1069	90.00	4	2026-10-02 15:10:00+03	3
2117	82	1082	120.00	2	2026-10-12 10:50:00+03	1
2118	95	1095	76.50	3	2026-10-15 14:50:00+03	2
2119	108	1108	110.25	3	2026-10-12 10:20:00+03	3
2120	1	1121	110.00	4	2026-10-06 20:00:00+03	1
2121	14	1134	95.00	4	2026-10-08 17:10:00+03	2
2122	27	1147	190.00	3	2026-10-07 08:30:00+03	1
2123	40	1160	150.00	1	2026-10-11 12:10:00+03	1
2124	13	1013	220.00	2	2026-10-10 10:10:00+03	1
2125	26	1026	58.50	1	2026-10-06 14:00:00+03	2
2126	39	1039	141.75	3	2026-10-01 14:45:00+03	2
2127	52	1052	90.00	3	2026-10-09 17:30:00+03	1
2128	65	1065	160.00	1	2026-10-07 19:10:00+03	2
2129	78	1078	80.00	2	2026-10-10 20:50:00+03	2
2130	91	1091	70.00	2	2026-10-05 19:45:00+03	3
2131	104	1104	82.50	2	2026-10-12 20:40:00+03	2
2132	117	1117	94.50	1	2026-10-01 17:45:00+03	3
2133	10	1130	108.00	4	2026-10-04 15:50:00+03	2
2134	23	1143	85.00	3	2026-10-03 09:40:00+03	1
2135	36	1156	94.50	3	2026-10-07 09:10:00+03	1
2136	9	1009	115.50	3	2026-10-07 10:00:00+03	3
2137	22	1022	85.50	2	2026-10-08 16:15:00+03	3
2138	35	1035	199.50	4	2026-10-05 12:45:00+03	2
2139	48	1048	150.00	1	2026-10-06 08:50:00+03	1
2140	61	1061	220.00	4	2026-10-11 21:15:00+03	3
2141	74	1074	68.25	3	2026-10-04 11:20:00+03	3
2142	87	1087	135.00	4	2026-10-01 21:20:00+03	1
2143	100	1100	110.00	2	2026-10-06 16:15:00+03	2
2144	113	1113	160.00	4	2026-10-12 13:50:00+03	2
2145	6	1126	72.00	4	2026-10-02 15:15:00+03	2
2146	19	1139	70.00	1	2026-10-01 08:15:00+03	1
2147	32	1152	75.00	4	2026-10-08 12:20:00+03	3
2148	5	1005	81.00	2	2026-10-11 19:00:00+03	1
2149	18	1018	120.00	3	2026-10-02 15:00:00+03	2
2150	31	1031	85.00	1	2026-10-01 19:50:00+03	1
2151	44	1044	94.50	1	2026-10-04 11:30:00+03	3
2152	57	1057	99.00	2	2026-10-02 15:20:00+03	3
2153	70	1070	95.00	3	2026-10-11 13:45:00+03	2
2154	83	1083	190.00	3	2026-10-03 18:30:00+03	3
2155	96	1096	150.00	4	2026-10-06 18:30:00+03	1
2156	109	1109	198.00	4	2026-10-07 09:10:00+03	3
2157	2	1122	68.25	3	2026-10-08 18:30:00+03	2
2158	15	1135	135.00	2	2026-10-10 20:10:00+03	2
2159	28	1148	90.00	3	2026-10-01 19:00:00+03	2
2160	1	1001	144.00	3	2026-10-05 20:40:00+03	3
2161	14	1014	88.00	4	2026-10-15 11:50:00+03	1
2162	27	1027	73.50	2	2026-10-04 17:10:00+03	3
2163	40	1040	75.00	2	2026-10-08 14:10:00+03	2
2164	53	1053	81.00	1	2026-10-15 15:20:00+03	3
2165	66	1066	108.00	2	2026-10-08 19:10:00+03	3
2166	79	1079	85.00	3	2026-10-14 09:00:00+03	1
2167	92	1092	94.50	2	2026-10-11 16:30:00+03	3
2168	105	1105	99.00	2	2026-10-01 13:00:00+03	3
2169	118	1118	99.75	4	2026-10-06 16:30:00+03	3
2170	11	1131	190.00	1	2026-10-12 19:10:00+03	2
2171	24	1144	165.00	2	2026-10-05 19:20:00+03	1
2172	37	1157	198.00	2	2026-10-11 15:20:00+03	3
2173	10	1010	68.25	1	2026-10-09 19:15:00+03	2
2174	23	1023	135.00	3	2026-10-08 10:10:00+03	1
2175	36	1036	90.00	3	2026-10-01 14:20:00+03	2
2176	49	1049	144.00	4	2026-10-14 12:15:00+03	1
2177	62	1062	72.00	3	2026-10-06 12:20:00+03	1
2178	75	1075	70.00	2	2026-10-12 12:45:00+03	1
2179	88	1088	78.75	2	2026-10-01 17:10:00+03	1
2180	101	1101	81.00	1	2026-10-01 18:10:00+03	2
2181	114	1114	126.00	2	2026-10-09 10:20:00+03	2
2182	7	1127	89.25	1	2026-10-15 16:00:00+03	1
2183	20	1140	94.50	4	2026-10-06 12:40:00+03	3
2184	33	1153	121.00	1	2026-10-11 11:10:00+03	3
2185	6	1006	85.50	4	2026-10-02 19:45:00+03	2
2186	19	1019	199.50	1	2026-10-13 12:30:00+03	2
2187	32	1032	135.00	2	2026-10-06 08:00:00+03	2
2188	45	1045	220.00	4	2026-10-05 17:45:00+03	3
2189	58	1058	71.50	4	2026-10-12 19:40:00+03	3
2190	71	1071	141.75	4	2026-10-08 19:15:00+03	2
2191	84	1084	100.00	1	2026-10-15 08:00:00+03	2
2192	97	1097	144.00	3	2026-10-08 07:30:00+03	2
2193	110	1110	84.00	3	2026-10-07 14:00:00+03	1
2194	3	1123	63.00	1	2026-10-05 15:20:00+03	3
2195	16	1136	75.00	1	2026-10-04 19:10:00+03	3
2196	29	1149	99.00	2	2026-10-07 11:40:00+03	2
2197	2	1002	108.00	1	2026-10-15 21:00:00+03	3
2198	15	1015	85.00	2	2026-10-02 09:45:00+03	2
2199	28	1028	105.00	1	2026-10-03 15:15:00+03	1
2200	41	1041	115.50	3	2026-10-01 15:15:00+03	3
2201	54	1054	95.00	3	2026-10-15 10:30:00+03	3
2202	67	1067	209.00	2	2026-10-13 09:30:00+03	1
2203	80	1080	135.00	1	2026-10-12 15:10:00+03	2
2204	93	1093	198.00	1	2026-10-02 20:40:00+03	1
2205	106	1106	68.25	2	2026-10-09 15:10:00+03	1
2206	119	1119	121.50	4	2026-10-11 21:45:00+03	3
2207	12	1132	100.00	2	2026-10-04 11:15:00+03	3
2208	25	1145	176.00	2	2026-10-01 10:30:00+03	1
2209	38	1158	84.00	4	2026-10-09 17:20:00+03	1
2210	11	1011	77.00	4	2026-10-01 21:30:00+03	2
2211	24	1024	78.75	2	2026-10-05 12:40:00+03	1
2212	37	1037	81.00	4	2026-10-15 16:10:00+03	3
2213	50	1050	120.00	3	2026-10-04 17:10:00+03	2
2214	63	1063	89.25	2	2026-10-10 17:50:00+03	2
2215	76	1076	94.50	1	2026-10-01 09:20:00+03	2
2216	89	1089	121.00	4	2026-10-15 17:10:00+03	1
2217	102	1102	95.00	4	2026-10-07 17:00:00+03	1
2218	115	1115	209.00	3	2026-10-03 17:45:00+03	1
2219	8	1128	150.00	4	2026-10-10 10:50:00+03	2
2220	21	1141	242.00	2	2026-10-12 18:50:00+03	1
\.


--
-- TOC entry 5130 (class 0 OID 19765)
-- Dependencies: 222
-- Data for Name: buying_payment_method; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.buying_payment_method (id, name) FROM stdin;
1	Карта
2	Наличные
3	QR-код
\.


--
-- TOC entry 5132 (class 0 OID 19776)
-- Dependencies: 224
-- Data for Name: maintenance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maintenance (id, vending, maintenance_datetime, work_info, problem_info, worker) FROM stdin;
3001	17	2025-04-17 00:00:00+03	Плановая диагностика и очистка	Замечаний не выявлено	7
3002	34	2025-01-21 00:00:00+03	Проверка платёжного терминала	Иногда не считывается карта	14
3003	51	2026-10-08 00:00:00+03	Очистка системы выдачи товара	Обнаружены загрязнения механизма	21
3004	68	2025-04-23 00:00:00+03	Замена фильтра и санитарная обработка	Расходный элемент заменён по регламенту	28
3005	85	2025-01-17 00:00:00+03	Проверка модема и тестирование связи	Кратковременные потери связи	35
3006	102	2025-02-25 00:00:00+03	Диагностика электропитания	Нестабильное напряжение питания	42
3007	119	2025-07-01 00:00:00+03	Проверка холодильного блока	Температура отклонялась от заданной	49
3008	16	2026-04-29 00:00:00+03	Проверка нагревательного блока	Требуется дополнительная диагностика	56
3009	33	2025-09-15 00:00:00+03	Обновление программного обеспечения	Ошибок после обновления нет	63
3010	50	2026-04-02 00:00:00+03	Проверка датчиков и калибровка	Показания датчиков скорректированы	70
3011	67	2025-01-14 00:00:00+03	Плановая диагностика и очистка	Замечаний не выявлено	77
3012	84	2026-07-16 00:00:00+03	Проверка платёжного терминала	Иногда не считывается карта	84
3013	101	2025-10-28 00:00:00+03	Очистка системы выдачи товара	Обнаружены загрязнения механизма	91
3014	118	2026-01-11 00:00:00+03	Замена фильтра и санитарная обработка	Расходный элемент заменён по регламенту	98
3015	15	2025-09-15 00:00:00+03	Проверка модема и тестирование связи	Кратковременные потери связи	105
3016	32	2026-02-04 00:00:00+03	Диагностика электропитания	Нестабильное напряжение питания	112
3017	49	2025-10-08 00:00:00+03	Проверка холодильного блока	Температура отклонялась от заданной	119
3018	66	2025-10-19 00:00:00+03	Проверка нагревательного блока	Требуется дополнительная диагностика	126
3019	83	2026-05-03 00:00:00+03	Обновление программного обеспечения	Ошибок после обновления нет	133
3020	100	2025-06-02 00:00:00+03	Проверка датчиков и калибровка	Показания датчиков скорректированы	140
3021	117	2026-01-13 00:00:00+03	Плановая диагностика и очистка	Замечаний не выявлено	147
3022	14	2026-07-09 00:00:00+03	Проверка платёжного терминала	Иногда не считывается карта	4
3023	31	2026-04-04 00:00:00+03	Очистка системы выдачи товара	Обнаружены загрязнения механизма	11
3024	48	2026-01-12 00:00:00+03	Замена фильтра и санитарная обработка	Расходный элемент заменён по регламенту	18
3025	65	2026-06-05 00:00:00+03	Проверка модема и тестирование связи	Кратковременные потери связи	25
3026	82	2026-09-12 00:00:00+03	Диагностика электропитания	Нестабильное напряжение питания	32
3027	99	2026-10-07 00:00:00+03	Проверка холодильного блока	Температура отклонялась от заданной	39
3028	116	2026-04-14 00:00:00+03	Проверка нагревательного блока	Требуется дополнительная диагностика	46
3029	13	2025-11-07 00:00:00+03	Обновление программного обеспечения	Ошибок после обновления нет	53
3030	30	2026-08-23 00:00:00+03	Проверка датчиков и калибровка	Показания датчиков скорректированы	60
3031	47	2025-05-12 00:00:00+03	Плановая диагностика и очистка	Замечаний не выявлено	67
3032	64	2025-09-19 00:00:00+03	Проверка платёжного терминала	Иногда не считывается карта	74
3033	81	2026-03-08 00:00:00+03	Очистка системы выдачи товара	Обнаружены загрязнения механизма	81
3034	98	2026-07-15 00:00:00+03	Замена фильтра и санитарная обработка	Расходный элемент заменён по регламенту	88
3035	115	2025-10-05 00:00:00+03	Проверка модема и тестирование связи	Кратковременные потери связи	95
3036	12	2026-07-12 00:00:00+03	Диагностика электропитания	Нестабильное напряжение питания	102
3037	29	2025-06-30 00:00:00+03	Проверка холодильного блока	Температура отклонялась от заданной	109
3038	46	2026-02-07 00:00:00+03	Проверка нагревательного блока	Требуется дополнительная диагностика	116
3039	63	2025-07-17 00:00:00+03	Обновление программного обеспечения	Ошибок после обновления нет	123
3040	80	2025-06-03 00:00:00+03	Проверка датчиков и калибровка	Показания датчиков скорректированы	130
3041	97	2025-08-07 00:00:00+03	Плановая диагностика и очистка	Замечаний не выявлено	137
3042	114	2026-07-18 00:00:00+03	Проверка платёжного терминала	Иногда не считывается карта	144
3043	11	2026-05-14 00:00:00+03	Очистка системы выдачи товара	Обнаружены загрязнения механизма	1
3044	28	2025-06-22 00:00:00+03	Замена фильтра и санитарная обработка	Расходный элемент заменён по регламенту	8
3045	45	2025-11-17 00:00:00+03	Проверка модема и тестирование связи	Кратковременные потери связи	15
3046	62	2025-05-13 00:00:00+03	Диагностика электропитания	Нестабильное напряжение питания	22
3047	79	2026-01-01 00:00:00+03	Проверка холодильного блока	Температура отклонялась от заданной	29
3048	96	2025-08-24 00:00:00+03	Проверка нагревательного блока	Требуется дополнительная диагностика	36
3049	113	2025-09-28 00:00:00+03	Обновление программного обеспечения	Ошибок после обновления нет	43
3050	10	2025-01-29 00:00:00+03	Проверка датчиков и калибровка	Показания датчиков скорректированы	50
3051	27	2025-05-29 00:00:00+03	Плановая диагностика и очистка	Замечаний не выявлено	57
3052	44	2026-09-04 00:00:00+03	Проверка платёжного терминала	Иногда не считывается карта	64
3053	61	2026-01-28 00:00:00+03	Очистка системы выдачи товара	Обнаружены загрязнения механизма	71
3054	78	2025-06-18 00:00:00+03	Замена фильтра и санитарная обработка	Расходный элемент заменён по регламенту	78
3055	95	2026-07-31 00:00:00+03	Проверка модема и тестирование связи	Кратковременные потери связи	85
3056	112	2026-10-13 00:00:00+03	Диагностика электропитания	Нестабильное напряжение питания	92
3057	9	2026-04-17 00:00:00+03	Проверка холодильного блока	Температура отклонялась от заданной	99
3058	26	2026-03-12 00:00:00+03	Проверка нагревательного блока	Требуется дополнительная диагностика	106
3059	43	2026-01-29 00:00:00+03	Обновление программного обеспечения	Ошибок после обновления нет	113
3060	60	2026-07-11 00:00:00+03	Проверка датчиков и калибровка	Показания датчиков скорректированы	120
3061	77	2025-02-18 00:00:00+03	Плановая диагностика и очистка	Замечаний не выявлено	127
3062	94	2026-07-20 00:00:00+03	Проверка платёжного терминала	Иногда не считывается карта	134
3063	111	2025-11-19 00:00:00+03	Очистка системы выдачи товара	Обнаружены загрязнения механизма	141
3064	8	2025-06-08 00:00:00+03	Замена фильтра и санитарная обработка	Расходный элемент заменён по регламенту	148
3065	25	2025-09-16 00:00:00+03	Проверка модема и тестирование связи	Кратковременные потери связи	5
3066	42	2025-01-03 00:00:00+03	Диагностика электропитания	Нестабильное напряжение питания	12
3067	59	2025-09-08 00:00:00+03	Проверка холодильного блока	Температура отклонялась от заданной	19
3068	76	2026-05-25 00:00:00+03	Проверка нагревательного блока	Требуется дополнительная диагностика	26
3069	93	2026-09-20 00:00:00+03	Обновление программного обеспечения	Ошибок после обновления нет	33
3070	110	2026-04-21 00:00:00+03	Проверка датчиков и калибровка	Показания датчиков скорректированы	40
3071	7	2026-10-13 00:00:00+03	Плановая диагностика и очистка	Замечаний не выявлено	47
3072	24	2026-01-31 00:00:00+03	Проверка платёжного терминала	Иногда не считывается карта	54
3073	41	2026-04-09 00:00:00+03	Очистка системы выдачи товара	Обнаружены загрязнения механизма	61
3074	58	2025-10-05 00:00:00+03	Замена фильтра и санитарная обработка	Расходный элемент заменён по регламенту	68
3075	75	2025-09-07 00:00:00+03	Проверка модема и тестирование связи	Кратковременные потери связи	75
3076	92	2025-01-21 00:00:00+03	Диагностика электропитания	Нестабильное напряжение питания	82
3077	109	2026-06-25 00:00:00+03	Проверка холодильного блока	Температура отклонялась от заданной	89
3078	6	2026-04-11 00:00:00+03	Проверка нагревательного блока	Требуется дополнительная диагностика	96
3079	23	2026-05-06 00:00:00+03	Обновление программного обеспечения	Ошибок после обновления нет	103
3080	40	2026-03-01 00:00:00+03	Проверка датчиков и калибровка	Показания датчиков скорректированы	110
3081	57	2025-05-25 00:00:00+03	Плановая диагностика и очистка	Замечаний не выявлено	117
3082	74	2025-09-21 00:00:00+03	Проверка платёжного терминала	Иногда не считывается карта	124
3083	91	2025-12-28 00:00:00+03	Очистка системы выдачи товара	Обнаружены загрязнения механизма	131
3084	108	2025-02-16 00:00:00+03	Замена фильтра и санитарная обработка	Расходный элемент заменён по регламенту	138
3085	5	2026-04-12 00:00:00+03	Проверка модема и тестирование связи	Кратковременные потери связи	145
3086	22	2025-12-07 00:00:00+03	Диагностика электропитания	Нестабильное напряжение питания	2
3087	39	2025-02-24 00:00:00+03	Проверка холодильного блока	Температура отклонялась от заданной	9
3088	56	2026-04-19 00:00:00+03	Проверка нагревательного блока	Требуется дополнительная диагностика	16
3089	73	2025-10-15 00:00:00+03	Обновление программного обеспечения	Ошибок после обновления нет	23
3090	90	2026-02-21 00:00:00+03	Проверка датчиков и калибровка	Показания датчиков скорректированы	30
3091	107	2025-01-14 00:00:00+03	Плановая диагностика и очистка	Замечаний не выявлено	37
3092	4	2025-03-01 00:00:00+03	Проверка платёжного терминала	Иногда не считывается карта	44
3093	21	2025-02-08 00:00:00+03	Очистка системы выдачи товара	Обнаружены загрязнения механизма	51
3094	38	2025-12-13 00:00:00+03	Замена фильтра и санитарная обработка	Расходный элемент заменён по регламенту	58
3095	55	2025-06-15 00:00:00+03	Проверка модема и тестирование связи	Кратковременные потери связи	65
3096	72	2026-06-28 00:00:00+03	Диагностика электропитания	Нестабильное напряжение питания	72
3097	89	2025-02-13 00:00:00+03	Проверка холодильного блока	Температура отклонялась от заданной	79
3098	106	2025-07-29 00:00:00+03	Проверка нагревательного блока	Требуется дополнительная диагностика	86
3099	3	2025-02-06 00:00:00+03	Обновление программного обеспечения	Ошибок после обновления нет	93
3100	20	2026-06-16 00:00:00+03	Проверка датчиков и калибровка	Показания датчиков скорректированы	100
3101	37	2025-03-30 00:00:00+03	Плановая диагностика и очистка	Замечаний не выявлено	107
3102	54	2026-05-28 00:00:00+03	Проверка платёжного терминала	Иногда не считывается карта	114
3103	71	2025-05-09 00:00:00+03	Очистка системы выдачи товара	Обнаружены загрязнения механизма	121
3104	88	2025-02-13 00:00:00+03	Замена фильтра и санитарная обработка	Расходный элемент заменён по регламенту	128
3105	105	2026-08-16 00:00:00+03	Проверка модема и тестирование связи	Кратковременные потери связи	135
3106	2	2025-07-28 00:00:00+03	Диагностика электропитания	Нестабильное напряжение питания	142
3107	19	2025-09-13 00:00:00+03	Проверка холодильного блока	Температура отклонялась от заданной	149
3108	36	2025-05-23 00:00:00+03	Проверка нагревательного блока	Требуется дополнительная диагностика	6
3109	53	2025-09-07 00:00:00+03	Обновление программного обеспечения	Ошибок после обновления нет	13
3110	70	2026-09-23 00:00:00+03	Проверка датчиков и калибровка	Показания датчиков скорректированы	20
3111	87	2025-07-22 00:00:00+03	Плановая диагностика и очистка	Замечаний не выявлено	27
3112	104	2026-01-28 00:00:00+03	Проверка платёжного терминала	Иногда не считывается карта	34
3113	1	2026-06-30 00:00:00+03	Очистка системы выдачи товара	Обнаружены загрязнения механизма	41
3114	18	2025-08-28 00:00:00+03	Замена фильтра и санитарная обработка	Расходный элемент заменён по регламенту	48
3115	35	2026-08-03 00:00:00+03	Проверка модема и тестирование связи	Кратковременные потери связи	55
3116	52	2026-06-11 00:00:00+03	Диагностика электропитания	Нестабильное напряжение питания	62
3117	69	2026-06-27 00:00:00+03	Проверка холодильного блока	Температура отклонялась от заданной	69
3118	86	2026-09-30 00:00:00+03	Проверка нагревательного блока	Требуется дополнительная диагностика	76
3119	103	2026-09-30 00:00:00+03	Обновление программного обеспечения	Ошибок после обновления нет	83
3120	120	2026-01-20 00:00:00+03	Проверка датчиков и калибровка	Показания датчиков скорректированы	90
3121	17	2026-08-17 00:00:00+03	Плановая диагностика и очистка	Замечаний не выявлено	97
3122	34	2025-10-01 00:00:00+03	Проверка платёжного терминала	Иногда не считывается карта	104
3123	51	2025-09-22 00:00:00+03	Очистка системы выдачи товара	Обнаружены загрязнения механизма	111
3124	68	2025-01-15 00:00:00+03	Замена фильтра и санитарная обработка	Расходный элемент заменён по регламенту	118
3125	85	2026-02-03 00:00:00+03	Проверка модема и тестирование связи	Кратковременные потери связи	125
3126	102	2026-05-18 00:00:00+03	Диагностика электропитания	Нестабильное напряжение питания	132
3127	119	2026-09-17 00:00:00+03	Проверка холодильного блока	Температура отклонялась от заданной	139
3128	16	2025-06-27 00:00:00+03	Проверка нагревательного блока	Требуется дополнительная диагностика	146
3129	33	2026-09-30 00:00:00+03	Обновление программного обеспечения	Ошибок после обновления нет	3
3130	50	2025-06-16 00:00:00+03	Проверка датчиков и калибровка	Показания датчиков скорректированы	10
3131	67	2026-10-06 00:00:00+03	Плановая диагностика и очистка	Замечаний не выявлено	17
3132	84	2025-03-18 00:00:00+03	Проверка платёжного терминала	Иногда не считывается карта	24
3133	101	2025-12-04 00:00:00+03	Очистка системы выдачи товара	Обнаружены загрязнения механизма	31
3134	118	2025-03-29 00:00:00+03	Замена фильтра и санитарная обработка	Расходный элемент заменён по регламенту	38
3135	15	2026-08-29 00:00:00+03	Проверка модема и тестирование связи	Кратковременные потери связи	45
3136	32	2025-08-27 00:00:00+03	Диагностика электропитания	Нестабильное напряжение питания	52
3137	49	2025-07-15 00:00:00+03	Проверка холодильного блока	Температура отклонялась от заданной	59
3138	66	2025-01-19 00:00:00+03	Проверка нагревательного блока	Требуется дополнительная диагностика	66
3139	83	2025-02-15 00:00:00+03	Обновление программного обеспечения	Ошибок после обновления нет	73
3140	100	2025-01-05 00:00:00+03	Проверка датчиков и калибровка	Показания датчиков скорректированы	80
\.


--
-- TOC entry 5134 (class 0 OID 19790)
-- Dependencies: 226
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, name, info, price, quantity, min_quantity) FROM stdin;
1001	Капучино 250 мл	Кофейный напиток, стакан 250 мл	144.00	58	12
1002	Американо 250 мл	Чёрный кофе, стакан 250 мл	108.00	1	10
1003	Латте 300 мл	Кофейный напиток с молоком, 300 мл	199.50	43	15
1004	Эспрессо	Кофейный напиток, порция 50 мл	90.00	14	12
1005	Чай чёрный 250 мл	Чёрный чай, стакан 250 мл	81.00	60	10
1006	Шоколадный батончик	Батончик молочного шоколада, 50 г	85.50	9	13
1007	Ореховый микс	Смесь орехов, упаковка 40 г	135.00	30	11
1008	Печенье овсяное	Порционная упаковка 60 г	75.00	24	9
1009	Чипсы классические	Картофельные чипсы, 70 г	115.50	15	9
1010	Вода негазированная 0,5 л	Питьевая вода без газа, 0,5 л	68.25	2	12
1011	Вода газированная 0,5 л	Питьевая вода с газом, 0,5 л	77.00	55	14
1012	Сок апельсиновый 0,3 л	Апельсиновый сок, упаковка 300 мл	94.50	20	14
1013	Сэндвич с курицей	Охлаждённый сэндвич, 180 г	220.00	57	9
1014	Батончик мюсли	Злаковый батончик, 35 г	88.00	35	15
1015	Крекеры солёные	Крекеры, упаковка 50 г	85.00	42	7
1016	Энергетический напиток 0,25 л	Безалкогольный энергетический напиток, 250 мл	135.00	30	14
1017	Капучино 250 мл	Кофейный напиток, стакан 250 мл	176.00	45	7
1018	Американо 250 мл	Чёрный кофе, стакан 250 мл	120.00	2	8
1019	Латте 300 мл	Кофейный напиток с молоком, 300 мл	199.50	29	5
1020	Эспрессо	Кофейный напиток, порция 50 мл	105.00	32	12
1021	Чай чёрный 250 мл	Чёрный чай, стакан 250 мл	94.50	42	12
1022	Шоколадный батончик	Батончик молочного шоколада, 50 г	85.50	20	15
1023	Ореховый микс	Смесь орехов, упаковка 40 г	135.00	36	5
1024	Печенье овсяное	Порционная упаковка 60 г	78.75	34	14
1025	Чипсы классические	Картофельные чипсы, 70 г	110.00	3	7
1026	Вода негазированная 0,5 л	Питьевая вода без газа, 0,5 л	58.50	8	14
1027	Вода газированная 0,5 л	Питьевая вода с газом, 0,5 л	73.50	30	11
1028	Сок апельсиновый 0,3 л	Апельсиновый сок, упаковка 300 мл	105.00	14	12
1029	Сэндвич с курицей	Охлаждённый сэндвич, 180 г	231.00	24	14
1030	Батончик мюсли	Злаковый батончик, 35 г	84.00	53	6
1031	Крекеры солёные	Крекеры, упаковка 50 г	85.00	41	8
1032	Энергетический напиток 0,25 л	Безалкогольный энергетический напиток, 250 мл	135.00	31	10
1033	Капучино 250 мл	Кофейный напиток, стакан 250 мл	144.00	15	15
1034	Американо 250 мл	Чёрный кофе, стакан 250 мл	108.00	36	5
1035	Латте 300 мл	Кофейный напиток с молоком, 300 мл	199.50	4	13
1036	Эспрессо	Кофейный напиток, порция 50 мл	90.00	38	12
1037	Чай чёрный 250 мл	Чёрный чай, стакан 250 мл	81.00	47	11
1038	Шоколадный батончик	Батончик молочного шоколада, 50 г	95.00	35	5
1039	Ореховый микс	Смесь орехов, упаковка 40 г	141.75	14	6
1040	Печенье овсяное	Порционная упаковка 60 г	75.00	43	15
1041	Чипсы классические	Картофельные чипсы, 70 г	115.50	34	13
1042	Вода негазированная 0,5 л	Питьевая вода без газа, 0,5 л	65.00	50	12
1043	Вода газированная 0,5 л	Питьевая вода с газом, 0,5 л	73.50	52	9
1044	Сок апельсиновый 0,3 л	Апельсиновый сок, упаковка 300 мл	94.50	14	5
1045	Сэндвич с курицей	Охлаждённый сэндвич, 180 г	220.00	50	10
1046	Батончик мюсли	Злаковый батончик, 35 г	88.00	0	8
1047	Крекеры солёные	Крекеры, упаковка 50 г	76.50	14	7
1048	Энергетический напиток 0,25 л	Безалкогольный энергетический напиток, 250 мл	150.00	29	8
1049	Капучино 250 мл	Кофейный напиток, стакан 250 мл	144.00	56	12
1050	Американо 250 мл	Чёрный кофе, стакан 250 мл	120.00	7	5
1051	Латте 300 мл	Кофейный напиток с молоком, 300 мл	171.00	51	15
1052	Эспрессо	Кофейный напиток, порция 50 мл	90.00	9	7
1053	Чай чёрный 250 мл	Чёрный чай, стакан 250 мл	81.00	2	7
1054	Шоколадный батончик	Батончик молочного шоколада, 50 г	95.00	30	5
1055	Ореховый микс	Смесь орехов, упаковка 40 г	148.50	7	13
1056	Печенье овсяное	Порционная упаковка 60 г	82.50	45	6
1057	Чипсы классические	Картофельные чипсы, 70 г	99.00	20	7
1058	Вода негазированная 0,5 л	Питьевая вода без газа, 0,5 л	71.50	53	12
1059	Вода газированная 0,5 л	Питьевая вода с газом, 0,5 л	70.00	22	10
1060	Сок апельсиновый 0,3 л	Апельсиновый сок, упаковка 300 мл	115.50	45	6
1061	Сэндвич с курицей	Охлаждённый сэндвич, 180 г	220.00	16	11
1062	Батончик мюсли	Злаковый батончик, 35 г	72.00	23	12
1063	Крекеры солёные	Крекеры, упаковка 50 г	89.25	7	9
1064	Энергетический напиток 0,25 л	Безалкогольный энергетический напиток, 250 мл	165.00	15	11
1065	Капучино 250 мл	Кофейный напиток, стакан 250 мл	160.00	52	10
1066	Американо 250 мл	Чёрный кофе, стакан 250 мл	108.00	41	14
1067	Латте 300 мл	Кофейный напиток с молоком, 300 мл	209.00	45	11
1068	Эспрессо	Кофейный напиток, порция 50 мл	105.00	21	11
1069	Чай чёрный 250 мл	Чёрный чай, стакан 250 мл	90.00	49	10
1070	Шоколадный батончик	Батончик молочного шоколада, 50 г	95.00	3	6
1071	Ореховый микс	Смесь орехов, упаковка 40 г	141.75	47	6
1072	Печенье овсяное	Порционная упаковка 60 г	78.75	43	8
1073	Чипсы классические	Картофельные чипсы, 70 г	110.00	56	12
1074	Вода негазированная 0,5 л	Питьевая вода без газа, 0,5 л	68.25	60	15
1075	Вода газированная 0,5 л	Питьевая вода с газом, 0,5 л	70.00	51	14
1076	Сок апельсиновый 0,3 л	Апельсиновый сок, упаковка 300 мл	94.50	59	5
1077	Сэндвич с курицей	Охлаждённый сэндвич, 180 г	198.00	47	14
1078	Батончик мюсли	Злаковый батончик, 35 г	80.00	38	14
1079	Крекеры солёные	Крекеры, упаковка 50 г	85.00	17	10
1080	Энергетический напиток 0,25 л	Безалкогольный энергетический напиток, 250 мл	135.00	44	14
1081	Капучино 250 мл	Кофейный напиток, стакан 250 мл	176.00	27	14
1082	Американо 250 мл	Чёрный кофе, стакан 250 мл	120.00	55	8
1083	Латте 300 мл	Кофейный напиток с молоком, 300 мл	190.00	13	10
1084	Эспрессо	Кофейный напиток, порция 50 мл	100.00	46	14
1085	Чай чёрный 250 мл	Чёрный чай, стакан 250 мл	90.00	40	9
1086	Шоколадный батончик	Батончик молочного шоколада, 50 г	95.00	31	9
1087	Ореховый микс	Смесь орехов, упаковка 40 г	135.00	8	10
1088	Печенье овсяное	Порционная упаковка 60 г	78.75	49	8
1089	Чипсы классические	Картофельные чипсы, 70 г	121.00	45	9
1090	Вода негазированная 0,5 л	Питьевая вода без газа, 0,5 л	68.25	46	10
1091	Вода газированная 0,5 л	Питьевая вода с газом, 0,5 л	70.00	31	15
1092	Сок апельсиновый 0,3 л	Апельсиновый сок, упаковка 300 мл	94.50	19	7
1093	Сэндвич с курицей	Охлаждённый сэндвич, 180 г	198.00	4	7
1094	Батончик мюсли	Злаковый батончик, 35 г	80.00	4	13
1095	Крекеры солёные	Крекеры, упаковка 50 г	76.50	10	5
1096	Энергетический напиток 0,25 л	Безалкогольный энергетический напиток, 250 мл	150.00	58	10
1097	Капучино 250 мл	Кофейный напиток, стакан 250 мл	144.00	34	14
1098	Американо 250 мл	Чёрный кофе, стакан 250 мл	120.00	48	7
1099	Латте 300 мл	Кофейный напиток с молоком, 300 мл	190.00	52	7
1100	Эспрессо	Кофейный напиток, порция 50 мл	110.00	24	8
1101	Чай чёрный 250 мл	Чёрный чай, стакан 250 мл	81.00	41	11
1102	Шоколадный батончик	Батончик молочного шоколада, 50 г	95.00	51	11
1103	Ореховый микс	Смесь орехов, упаковка 40 г	141.75	14	10
1104	Печенье овсяное	Порционная упаковка 60 г	82.50	3	6
1105	Чипсы классические	Картофельные чипсы, 70 г	99.00	53	5
1106	Вода негазированная 0,5 л	Питьевая вода без газа, 0,5 л	68.25	47	13
1107	Вода газированная 0,5 л	Питьевая вода с газом, 0,5 л	63.00	58	10
1108	Сок апельсиновый 0,3 л	Апельсиновый сок, упаковка 300 мл	110.25	2	6
1109	Сэндвич с курицей	Охлаждённый сэндвич, 180 г	198.00	20	12
1110	Батончик мюсли	Злаковый батончик, 35 г	84.00	46	11
1111	Крекеры солёные	Крекеры, упаковка 50 г	89.25	4	7
1112	Энергетический напиток 0,25 л	Безалкогольный энергетический напиток, 250 мл	150.00	28	8
1113	Капучино 250 мл	Кофейный напиток, стакан 250 мл	160.00	23	5
1114	Американо 250 мл	Чёрный кофе, стакан 250 мл	126.00	40	8
1115	Латте 300 мл	Кофейный напиток с молоком, 300 мл	209.00	10	6
1116	Эспрессо	Кофейный напиток, порция 50 мл	90.00	54	6
1117	Чай чёрный 250 мл	Чёрный чай, стакан 250 мл	94.50	33	11
1118	Шоколадный батончик	Батончик молочного шоколада, 50 г	99.75	11	9
1119	Ореховый микс	Смесь орехов, упаковка 40 г	121.50	51	6
1120	Печенье овсяное	Порционная упаковка 60 г	67.50	6	8
1121	Чипсы классические	Картофельные чипсы, 70 г	110.00	44	6
1122	Вода негазированная 0,5 л	Питьевая вода без газа, 0,5 л	68.25	10	13
1123	Вода газированная 0,5 л	Питьевая вода с газом, 0,5 л	63.00	0	11
1124	Сок апельсиновый 0,3 л	Апельсиновый сок, упаковка 300 мл	115.50	8	11
1125	Сэндвич с курицей	Охлаждённый сэндвич, 180 г	198.00	33	13
1126	Батончик мюсли	Злаковый батончик, 35 г	72.00	55	7
1127	Крекеры солёные	Крекеры, упаковка 50 г	89.25	20	10
1128	Энергетический напиток 0,25 л	Безалкогольный энергетический напиток, 250 мл	150.00	9	13
1129	Капучино 250 мл	Кофейный напиток, стакан 250 мл	160.00	2	5
1130	Американо 250 мл	Чёрный кофе, стакан 250 мл	108.00	11	11
1131	Латте 300 мл	Кофейный напиток с молоком, 300 мл	190.00	19	13
1132	Эспрессо	Кофейный напиток, порция 50 мл	100.00	29	5
1133	Чай чёрный 250 мл	Чёрный чай, стакан 250 мл	94.50	1	10
1134	Шоколадный батончик	Батончик молочного шоколада, 50 г	95.00	24	10
1135	Ореховый микс	Смесь орехов, упаковка 40 г	135.00	29	14
1136	Печенье овсяное	Порционная упаковка 60 г	75.00	49	7
1137	Чипсы классические	Картофельные чипсы, 70 г	99.00	11	11
1138	Вода негазированная 0,5 л	Питьевая вода без газа, 0,5 л	65.00	10	5
1139	Вода газированная 0,5 л	Питьевая вода с газом, 0,5 л	70.00	20	7
1140	Сок апельсиновый 0,3 л	Апельсиновый сок, упаковка 300 мл	94.50	58	14
1141	Сэндвич с курицей	Охлаждённый сэндвич, 180 г	242.00	36	7
1142	Батончик мюсли	Злаковый батончик, 35 г	88.00	31	10
1143	Крекеры солёные	Крекеры, упаковка 50 г	85.00	11	8
1144	Энергетический напиток 0,25 л	Безалкогольный энергетический напиток, 250 мл	165.00	36	8
1145	Капучино 250 мл	Кофейный напиток, стакан 250 мл	176.00	11	11
1146	Американо 250 мл	Чёрный кофе, стакан 250 мл	126.00	37	6
1147	Латте 300 мл	Кофейный напиток с молоком, 300 мл	190.00	44	12
1148	Эспрессо	Кофейный напиток, порция 50 мл	90.00	22	10
1149	Чай чёрный 250 мл	Чёрный чай, стакан 250 мл	99.00	45	9
1150	Шоколадный батончик	Батончик молочного шоколада, 50 г	85.50	17	10
1151	Ореховый микс	Смесь орехов, упаковка 40 г	135.00	3	7
1152	Печенье овсяное	Порционная упаковка 60 г	75.00	58	14
1153	Чипсы классические	Картофельные чипсы, 70 г	121.00	45	6
1154	Вода негазированная 0,5 л	Питьевая вода без газа, 0,5 л	68.25	43	5
1155	Вода газированная 0,5 л	Питьевая вода с газом, 0,5 л	77.00	9	11
1156	Сок апельсиновый 0,3 л	Апельсиновый сок, упаковка 300 мл	94.50	47	13
1157	Сэндвич с курицей	Охлаждённый сэндвич, 180 г	198.00	31	9
1158	Батончик мюсли	Злаковый батончик, 35 г	84.00	28	6
1159	Крекеры солёные	Крекеры, упаковка 50 г	85.00	59	13
1160	Энергетический напиток 0,25 л	Безалкогольный энергетический напиток, 250 мл	150.00	60	6
\.


--
-- TOC entry 5136 (class 0 OID 19804)
-- Dependencies: 228
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, surname, name, patronymic, email, phone_num, role) FROM stdin;
1	Иванов	Ольга	Викторовна	user001@example.com	+79990000001	1
2	Петрова	Максим	Олегович	user002@example.com	+79990000002	2
3	Смирнов	Дарья	Ильинична	user003@example.com	+79990000003	3
4	Кузнецова	Елена	Сергеевич	user004@example.com	+79990000004	4
5	Волков	Михаил	Дмитриевна	user005@example.com	+79990000005	1
6	Соколова	Светлана	Павлович	user006@example.com	+79990000006	2
7	Морозов	Артём	Андреевна	user007@example.com	+79990000007	3
8	Попова	Иван	Игоревич	user008@example.com	+79990000008	4
9	Лебедев	Ирина	Михайловна	user009@example.com	+79990000009	1
10	Новикова	Владимир	Алексеевич	user010@example.com	+79990000010	2
11	Фёдоров	Дмитрий	Викторовна	user011@example.com	+79990000011	3
12	Михайлова	Наталья	Олегович	user012@example.com	+79990000012	4
13	Орлов	Роман	Ильинична	user013@example.com	+79990000013	1
14	Васильева	Полина	Сергеевич	user014@example.com	+79990000014	2
15	Зайцев	Анна	Дмитриевна	user015@example.com	+79990000015	3
16	Павлова	Андрей	Павлович	user016@example.com	+79990000016	4
17	Семёнов	Юлия	Андреевна	user017@example.com	+79990000017	1
18	Голубева	Мария	Игоревич	user018@example.com	+79990000018	2
19	Виноградов	Сергей	Михайловна	user019@example.com	+79990000019	3
20	Беляева	Татьяна	Алексеевич	user020@example.com	+79990000020	4
21	Иванов	Кирилл	Викторовна	user021@example.com	+79990000021	1
22	Петрова	Павел	Олегович	user022@example.com	+79990000022	2
23	Смирнов	Екатерина	Ильинична	user023@example.com	+79990000023	3
24	Кузнецова	Никита	Сергеевич	user024@example.com	+79990000024	4
25	Волков	Алексей	Дмитриевна	user025@example.com	+79990000025	1
26	Соколова	Ольга	Павлович	user026@example.com	+79990000026	2
27	Морозов	Максим	Андреевна	user027@example.com	+79990000027	3
28	Попова	Дарья	Игоревич	user028@example.com	+79990000028	4
29	Лебедев	Елена	Михайловна	user029@example.com	+79990000029	1
30	Новикова	Михаил	Алексеевич	user030@example.com	+79990000030	2
31	Фёдоров	Светлана	Викторовна	user031@example.com	+79990000031	3
32	Михайлова	Артём	Олегович	user032@example.com	+79990000032	4
33	Орлов	Иван	Ильинична	user033@example.com	+79990000033	1
34	Васильева	Ирина	Сергеевич	user034@example.com	+79990000034	2
35	Зайцев	Владимир	Дмитриевна	user035@example.com	+79990000035	3
36	Павлова	Дмитрий	Павлович	user036@example.com	+79990000036	4
37	Семёнов	Наталья	Андреевна	user037@example.com	+79990000037	1
38	Голубева	Роман	Игоревич	user038@example.com	+79990000038	2
39	Виноградов	Полина	Михайловна	user039@example.com	+79990000039	3
40	Беляева	Анна	Алексеевич	user040@example.com	+79990000040	4
41	Иванов	Андрей	Викторовна	user041@example.com	+79990000041	1
42	Петрова	Юлия	Олегович	user042@example.com	+79990000042	2
43	Смирнов	Мария	Ильинична	user043@example.com	+79990000043	3
44	Кузнецова	Сергей	Сергеевич	user044@example.com	+79990000044	4
45	Волков	Татьяна	Дмитриевна	user045@example.com	+79990000045	1
46	Соколова	Кирилл	Павлович	user046@example.com	+79990000046	2
47	Морозов	Павел	Андреевна	user047@example.com	+79990000047	3
48	Попова	Екатерина	Игоревич	user048@example.com	+79990000048	4
49	Лебедев	Никита	Михайловна	user049@example.com	+79990000049	1
50	Новикова	Алексей	Алексеевич	user050@example.com	+79990000050	2
51	Фёдоров	Ольга	Викторовна	user051@example.com	+79990000051	3
52	Михайлова	Максим	Олегович	user052@example.com	+79990000052	4
53	Орлов	Дарья	Ильинична	user053@example.com	+79990000053	1
54	Васильева	Елена	Сергеевич	user054@example.com	+79990000054	2
55	Зайцев	Михаил	Дмитриевна	user055@example.com	+79990000055	3
56	Павлова	Светлана	Павлович	user056@example.com	+79990000056	4
57	Семёнов	Артём	Андреевна	user057@example.com	+79990000057	1
58	Голубева	Иван	Игоревич	user058@example.com	+79990000058	2
59	Виноградов	Ирина	Михайловна	user059@example.com	+79990000059	3
60	Беляева	Владимир	Алексеевич	user060@example.com	+79990000060	4
61	Иванов	Дмитрий	Викторовна	user061@example.com	+79990000061	1
62	Петрова	Наталья	Олегович	user062@example.com	+79990000062	2
63	Смирнов	Роман	Ильинична	user063@example.com	+79990000063	3
64	Кузнецова	Полина	Сергеевич	user064@example.com	+79990000064	4
65	Волков	Анна	Дмитриевна	user065@example.com	+79990000065	1
66	Соколова	Андрей	Павлович	user066@example.com	+79990000066	2
67	Морозов	Юлия	Андреевна	user067@example.com	+79990000067	3
68	Попова	Мария	Игоревич	user068@example.com	+79990000068	4
69	Лебедев	Сергей	Михайловна	user069@example.com	+79990000069	1
70	Новикова	Татьяна	Алексеевич	user070@example.com	+79990000070	2
71	Фёдоров	Кирилл	Викторовна	user071@example.com	+79990000071	3
72	Михайлова	Павел	Олегович	user072@example.com	+79990000072	4
73	Орлов	Екатерина	Ильинична	user073@example.com	+79990000073	1
74	Васильева	Никита	Сергеевич	user074@example.com	+79990000074	2
75	Зайцев	Алексей	Дмитриевна	user075@example.com	+79990000075	3
76	Павлова	Ольга	Павлович	user076@example.com	+79990000076	4
77	Семёнов	Максим	Андреевна	user077@example.com	+79990000077	1
78	Голубева	Дарья	Игоревич	user078@example.com	+79990000078	2
79	Виноградов	Елена	Михайловна	user079@example.com	+79990000079	3
80	Беляева	Михаил	Алексеевич	user080@example.com	+79990000080	4
81	Иванов	Светлана	Викторовна	user081@example.com	+79990000081	1
82	Петрова	Артём	Олегович	user082@example.com	+79990000082	2
83	Смирнов	Иван	Ильинична	user083@example.com	+79990000083	3
84	Кузнецова	Ирина	Сергеевич	user084@example.com	+79990000084	4
85	Волков	Владимир	Дмитриевна	user085@example.com	+79990000085	1
86	Соколова	Дмитрий	Павлович	user086@example.com	+79990000086	2
87	Морозов	Наталья	Андреевна	user087@example.com	+79990000087	3
88	Попова	Роман	Игоревич	user088@example.com	+79990000088	4
89	Лебедев	Полина	Михайловна	user089@example.com	+79990000089	1
90	Новикова	Анна	Алексеевич	user090@example.com	+79990000090	2
91	Фёдоров	Андрей	Викторовна	user091@example.com	+79990000091	3
92	Михайлова	Юлия	Олегович	user092@example.com	+79990000092	4
93	Орлов	Мария	Ильинична	user093@example.com	+79990000093	1
94	Васильева	Сергей	Сергеевич	user094@example.com	+79990000094	2
95	Зайцев	Татьяна	Дмитриевна	user095@example.com	+79990000095	3
96	Павлова	Кирилл	Павлович	user096@example.com	+79990000096	4
97	Семёнов	Павел	Андреевна	user097@example.com	+79990000097	1
98	Голубева	Екатерина	Игоревич	user098@example.com	+79990000098	2
99	Виноградов	Никита	Михайловна	user099@example.com	+79990000099	3
100	Беляева	Алексей	Алексеевич	user100@example.com	+79990000100	4
101	Иванов	Ольга	Викторовна	user101@example.com	+79990000101	1
102	Петрова	Максим	Олегович	user102@example.com	+79990000102	2
103	Смирнов	Дарья	Ильинична	user103@example.com	+79990000103	3
104	Кузнецова	Елена	Сергеевич	user104@example.com	+79990000104	4
105	Волков	Михаил	Дмитриевна	user105@example.com	+79990000105	1
106	Соколова	Светлана	Павлович	user106@example.com	+79990000106	2
107	Морозов	Артём	Андреевна	user107@example.com	+79990000107	3
108	Попова	Иван	Игоревич	user108@example.com	+79990000108	4
109	Лебедев	Ирина	Михайловна	user109@example.com	+79990000109	1
110	Новикова	Владимир	Алексеевич	user110@example.com	+79990000110	2
111	Фёдоров	Дмитрий	Викторовна	user111@example.com	+79990000111	3
112	Михайлова	Наталья	Олегович	user112@example.com	+79990000112	4
113	Орлов	Роман	Ильинична	user113@example.com	+79990000113	1
114	Васильева	Полина	Сергеевич	user114@example.com	+79990000114	2
115	Зайцев	Анна	Дмитриевна	user115@example.com	+79990000115	3
116	Павлова	Андрей	Павлович	user116@example.com	+79990000116	4
117	Семёнов	Юлия	Андреевна	user117@example.com	+79990000117	1
118	Голубева	Мария	Игоревич	user118@example.com	+79990000118	2
119	Виноградов	Сергей	Михайловна	user119@example.com	+79990000119	3
120	Беляева	Татьяна	Алексеевич	user120@example.com	+79990000120	4
121	Иванов	Кирилл	Викторовна	user121@example.com	+79990000121	1
122	Петрова	Павел	Олегович	user122@example.com	+79990000122	2
123	Смирнов	Екатерина	Ильинична	user123@example.com	+79990000123	3
124	Кузнецова	Никита	Сергеевич	user124@example.com	+79990000124	4
125	Волков	Алексей	Дмитриевна	user125@example.com	+79990000125	1
126	Соколова	Ольга	Павлович	user126@example.com	+79990000126	2
127	Морозов	Максим	Андреевна	user127@example.com	+79990000127	3
128	Попова	Дарья	Игоревич	user128@example.com	+79990000128	4
129	Лебедев	Елена	Михайловна	user129@example.com	+79990000129	1
130	Новикова	Михаил	Алексеевич	user130@example.com	+79990000130	2
131	Фёдоров	Светлана	Викторовна	user131@example.com	+79990000131	3
132	Михайлова	Артём	Олегович	user132@example.com	+79990000132	4
133	Орлов	Иван	Ильинична	user133@example.com	+79990000133	1
134	Васильева	Ирина	Сергеевич	user134@example.com	+79990000134	2
135	Зайцев	Владимир	Дмитриевна	user135@example.com	+79990000135	3
136	Павлова	Дмитрий	Павлович	user136@example.com	+79990000136	4
137	Семёнов	Наталья	Андреевна	user137@example.com	+79990000137	1
138	Голубева	Роман	Игоревич	user138@example.com	+79990000138	2
139	Виноградов	Полина	Михайловна	user139@example.com	+79990000139	3
140	Беляева	Анна	Алексеевич	user140@example.com	+79990000140	4
141	Иванов	Андрей	Викторовна	user141@example.com	+79990000141	1
142	Петрова	Юлия	Олегович	user142@example.com	+79990000142	2
143	Смирнов	Мария	Ильинична	user143@example.com	+79990000143	3
144	Кузнецова	Сергей	Сергеевич	user144@example.com	+79990000144	4
145	Волков	Татьяна	Дмитриевна	user145@example.com	+79990000145	1
146	Соколова	Кирилл	Павлович	user146@example.com	+79990000146	2
147	Морозов	Павел	Андреевна	user147@example.com	+79990000147	3
148	Попова	Екатерина	Игоревич	user148@example.com	+79990000148	4
149	Лебедев	Никита	Михайловна	user149@example.com	+79990000149	1
150	Новикова	Алексей	Алексеевич	user150@example.com	+79990000150	2
\.


--
-- TOC entry 5138 (class 0 OID 19823)
-- Dependencies: 230
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_role (id, name) FROM stdin;
1	Администратор
2	Оператор
3	Техник
4	Менеджер
\.


--
-- TOC entry 5140 (class 0 OID 19834)
-- Dependencies: 232
-- Data for Name: vending; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vending (id, location, model, type, serial_num, inv_num, manufacturer, modem, manufacture_date, added_to_work, last_verification_date, verification_interval, resource, service_duration, status, country) FROM stdin;
1	г. Москва, ТЦ Центральный, 1 этаж	1	1	SN-CO-2019-0001	INV-000001	1	7901	2019-04-07 00:00:00+03	2019-06-12 00:00:00+03	2026-05-08 00:00:00+03	6	4958	20	1	1
2	г. Москва, БЦ Север, холл	2	2	SN-SN-2020-0002	INV-000002	2	7902	2020-09-14 00:00:00+03	2020-11-13 00:00:00+03	2026-08-10 00:00:00+03	24	35614	2	1	2
3	г. Санкт-Петербург, университет, корпус А	3	3	SN-AQ-2021-0003	INV-000003	3	7903	2021-09-06 00:00:00+03	2021-09-23 00:00:00+03	2025-10-05 00:00:00+03	6	18591	9	2	3
4	г. Казань, ТЦ Меридиан, 2 этаж	4	1	SN-FR-2022-0004	INV-000004	4	7904	2022-07-06 00:00:00+03	2022-07-19 00:00:00+03	2025-02-16 00:00:00+03	6	31809	14	1	4
5	г. Нижний Новгород, вокзал, зал ожидания	5	2	SN-VE-2023-0005	INV-000005	5	7905	2023-01-21 00:00:00+03	2023-04-19 00:00:00+03	2026-04-02 00:00:00+03	24	10493	3	1	5
6	г. Екатеринбург, бизнес-центр Восток, 1 этаж	6	3	SN-CO-2024-0006	INV-000006	1	7906	2024-09-02 00:00:00+03	2024-11-07 00:00:00+03	2026-07-26 00:00:00+03	12	4203	15	2	1
7	г. Новосибирск, аэропорт, зал вылета	7	1	SN-SN-2025-0007	INV-000007	2	7907	2025-03-19 00:00:00+03	2025-05-02 00:00:00+03	2025-09-11 00:00:00+03	24	11731	4	1	2
8	г. Самара, бизнес-парк Волга, корпус 2	8	2	SN-AQ-2019-0008	INV-000008	3	7908	2019-01-02 00:00:00+03	2019-03-02 00:00:00+03	2026-06-11 00:00:00+03	12	30075	20	3	3
9	г. Краснодар, ТЦ Южный, 3 этаж	1	3	SN-FR-2020-0009	INV-000009	4	7909	2020-08-24 00:00:00+03	2020-09-04 00:00:00+03	2025-10-30 00:00:00+03	12	22767	5	1	4
10	г. Пермь, поликлиника № 4, холл	2	1	SN-VE-2021-0010	INV-000010	5	7910	2021-08-21 00:00:00+03	2021-11-28 00:00:00+03	2026-03-30 00:00:00+03	24	19036	19	1	5
11	г. Воронеж, университет, библиотека	3	2	SN-CO-2022-0011	INV-000011	1	7911	2022-07-22 00:00:00+03	2022-08-02 00:00:00+03	2026-03-09 00:00:00+03	6	34137	18	1	1
12	г. Ростов-на-Дону, ТЦ Дон, 1 этаж	4	3	SN-SN-2023-0012	INV-000012	2	7912	2023-04-04 00:00:00+03	2023-06-04 00:00:00+03	2025-12-28 00:00:00+03	12	6118	2	1	2
13	г. Уфа, бизнес-центр Башня, холл	5	1	SN-AQ-2024-0013	INV-000013	3	7913	2024-10-03 00:00:00+03	2024-10-15 00:00:00+03	2025-07-06 00:00:00+03	12	27422	11	1	3
14	г. Калининград, вокзал, зал ожидания	6	2	SN-FR-2025-0014	INV-000014	4	7914	2025-02-05 00:00:00+03	2025-05-06 00:00:00+03	2025-10-29 00:00:00+03	6	19672	10	3	4
15	г. Тула, спортивный комплекс, фойе	7	3	SN-VE-2019-0015	INV-000015	5	7915	2019-10-11 00:00:00+03	2020-01-01 00:00:00+03	2026-04-26 00:00:00+03	6	27198	11	1	5
16	г. Ярославль, ТЦ Волга, 2 этаж	8	1	SN-CO-2020-0016	INV-000016	1	7916	2020-04-21 00:00:00+03	2020-05-10 00:00:00+03	2025-05-27 00:00:00+03	12	13409	13	1	1
17	г. Москва, ТЦ Центральный, 1 этаж	1	2	SN-SN-2021-0017	INV-000017	2	7917	2021-03-05 00:00:00+03	2021-05-21 00:00:00+03	2025-02-06 00:00:00+03	12	31450	10	1	2
18	г. Москва, БЦ Север, холл	2	3	SN-AQ-2022-0018	INV-000018	3	7918	2022-02-02 00:00:00+03	2022-04-25 00:00:00+03	2025-07-02 00:00:00+03	12	33222	12	1	3
19	г. Санкт-Петербург, университет, корпус А	3	1	SN-FR-2023-0019	INV-000019	4	7919	2023-07-14 00:00:00+03	2023-07-26 00:00:00+03	2026-02-08 00:00:00+03	12	6521	17	1	4
20	г. Казань, ТЦ Меридиан, 2 этаж	4	2	SN-VE-2024-0020	INV-000020	5	7920	2024-10-22 00:00:00+03	2025-01-19 00:00:00+03	2025-03-10 00:00:00+03	24	19829	7	2	5
21	г. Нижний Новгород, вокзал, зал ожидания	5	3	SN-CO-2025-0021	INV-000021	1	7921	2025-02-13 00:00:00+03	2025-03-02 00:00:00+03	2025-07-26 00:00:00+03	6	7104	10	3	1
22	г. Екатеринбург, бизнес-центр Восток, 1 этаж	6	1	SN-SN-2019-0022	INV-000022	2	7922	2019-04-04 00:00:00+03	2019-06-27 00:00:00+03	2026-07-12 00:00:00+03	6	22424	5	1	2
23	г. Новосибирск, аэропорт, зал вылета	7	2	SN-AQ-2020-0023	INV-000023	3	7923	2020-03-18 00:00:00+03	2020-05-30 00:00:00+03	2026-08-03 00:00:00+03	12	8271	1	2	3
24	г. Самара, бизнес-парк Волга, корпус 2	8	3	SN-FR-2021-0024	INV-000024	4	7924	2021-04-24 00:00:00+03	2021-07-03 00:00:00+03	2025-11-09 00:00:00+03	6	30081	2	1	4
25	г. Краснодар, ТЦ Южный, 3 этаж	1	1	SN-VE-2022-0025	INV-000025	5	7925	2022-09-05 00:00:00+03	2022-10-18 00:00:00+03	2025-03-08 00:00:00+03	24	15771	19	3	5
26	г. Пермь, поликлиника № 4, холл	2	2	SN-CO-2023-0026	INV-000026	1	7926	2023-08-12 00:00:00+03	2023-08-30 00:00:00+03	2026-08-06 00:00:00+03	12	22267	13	1	1
27	г. Воронеж, университет, библиотека	3	3	SN-SN-2024-0027	INV-000027	2	7927	2024-05-19 00:00:00+03	2024-07-22 00:00:00+03	2026-08-13 00:00:00+03	12	13562	12	2	2
28	г. Ростов-на-Дону, ТЦ Дон, 1 этаж	4	1	SN-AQ-2025-0028	INV-000028	3	7928	2025-02-06 00:00:00+03	2025-04-11 00:00:00+03	2025-08-31 00:00:00+03	12	25813	8	2	3
29	г. Уфа, бизнес-центр Башня, холл	5	2	SN-FR-2019-0029	INV-000029	4	7929	2019-02-11 00:00:00+03	2019-03-23 00:00:00+03	2025-07-09 00:00:00+03	24	22994	5	1	4
30	г. Калининград, вокзал, зал ожидания	6	3	SN-VE-2020-0030	INV-000030	5	7930	2020-06-02 00:00:00+03	2020-08-25 00:00:00+03	2025-07-04 00:00:00+03	6	29488	3	1	5
31	г. Тула, спортивный комплекс, фойе	7	1	SN-CO-2021-0031	INV-000031	1	7931	2021-11-12 00:00:00+03	2022-02-07 00:00:00+03	2026-08-13 00:00:00+03	24	16332	13	1	1
32	г. Ярославль, ТЦ Волга, 2 этаж	8	2	SN-SN-2022-0032	INV-000032	2	7932	2022-12-19 00:00:00+03	2023-01-08 00:00:00+03	2026-03-26 00:00:00+03	24	10196	8	3	2
33	г. Москва, ТЦ Центральный, 1 этаж	1	3	SN-AQ-2023-0033	INV-000033	3	7933	2023-09-19 00:00:00+03	2023-10-25 00:00:00+03	2025-11-05 00:00:00+03	6	20575	20	3	3
34	г. Москва, БЦ Север, холл	2	1	SN-FR-2024-0034	INV-000034	4	7934	2024-12-03 00:00:00+03	2025-02-21 00:00:00+03	2025-03-05 00:00:00+03	12	28359	20	1	4
35	г. Санкт-Петербург, университет, корпус А	3	2	SN-VE-2025-0035	INV-000035	5	7935	2025-08-18 00:00:00+03	2025-09-28 00:00:00+03	2026-06-12 00:00:00+03	12	7712	2	1	5
36	г. Казань, ТЦ Меридиан, 2 этаж	4	3	SN-CO-2019-0036	INV-000036	1	7936	2019-11-06 00:00:00+03	2020-02-10 00:00:00+03	2025-07-10 00:00:00+03	6	5633	1	2	1
37	г. Нижний Новгород, вокзал, зал ожидания	5	1	SN-SN-2020-0037	INV-000037	2	7937	2020-04-17 00:00:00+03	2020-04-29 00:00:00+03	2025-05-22 00:00:00+03	24	31995	17	1	2
38	г. Екатеринбург, бизнес-центр Восток, 1 этаж	6	2	SN-AQ-2021-0038	INV-000038	3	7938	2021-06-24 00:00:00+03	2021-07-23 00:00:00+03	2026-04-28 00:00:00+03	24	29677	7	1	3
39	г. Новосибирск, аэропорт, зал вылета	7	3	SN-FR-2022-0039	INV-000039	4	7939	2022-05-12 00:00:00+03	2022-07-15 00:00:00+03	2025-06-05 00:00:00+03	24	5374	10	3	4
40	г. Самара, бизнес-парк Волга, корпус 2	8	1	SN-VE-2023-0040	INV-000040	5	7940	2023-03-18 00:00:00+03	2023-06-20 00:00:00+03	2025-11-20 00:00:00+03	6	31267	20	3	5
41	г. Краснодар, ТЦ Южный, 3 этаж	1	2	SN-CO-2024-0041	INV-000041	1	7941	2024-08-24 00:00:00+03	2024-09-04 00:00:00+03	2026-04-19 00:00:00+03	12	23810	20	1	1
42	г. Пермь, поликлиника № 4, холл	2	3	SN-SN-2025-0042	INV-000042	2	7942	2025-01-14 00:00:00+03	2025-02-25 00:00:00+03	2025-06-06 00:00:00+03	24	19465	18	1	2
43	г. Воронеж, университет, библиотека	3	1	SN-AQ-2019-0043	INV-000043	3	7943	2019-02-04 00:00:00+03	2019-04-04 00:00:00+03	2025-01-02 00:00:00+03	6	38705	14	1	3
44	г. Ростов-на-Дону, ТЦ Дон, 1 этаж	4	2	SN-FR-2020-0044	INV-000044	4	7944	2020-06-14 00:00:00+03	2020-07-07 00:00:00+03	2026-02-16 00:00:00+03	6	30171	11	3	4
45	г. Уфа, бизнес-центр Башня, холл	5	3	SN-VE-2021-0045	INV-000045	5	7945	2021-01-18 00:00:00+03	2021-04-14 00:00:00+03	2026-09-06 00:00:00+03	24	37325	7	2	5
46	г. Калининград, вокзал, зал ожидания	6	1	SN-CO-2022-0046	INV-000046	1	7946	2022-05-12 00:00:00+03	2022-07-18 00:00:00+03	2025-02-20 00:00:00+03	12	12731	5	1	1
47	г. Тула, спортивный комплекс, фойе	7	2	SN-SN-2023-0047	INV-000047	2	7947	2023-12-05 00:00:00+03	2024-01-04 00:00:00+03	2026-06-10 00:00:00+03	12	4149	4	3	2
48	г. Ярославль, ТЦ Волга, 2 этаж	8	3	SN-AQ-2024-0048	INV-000048	3	7948	2024-06-21 00:00:00+03	2024-09-08 00:00:00+03	2025-09-19 00:00:00+03	6	32393	11	2	3
49	г. Москва, ТЦ Центральный, 1 этаж	1	1	SN-FR-2025-0049	INV-000049	4	7949	2025-04-21 00:00:00+03	2025-07-06 00:00:00+03	2025-07-06 00:00:00+03	12	17295	19	1	4
50	г. Москва, БЦ Север, холл	2	2	SN-VE-2019-0050	INV-000050	5	7950	2019-06-03 00:00:00+03	2019-07-02 00:00:00+03	2025-10-21 00:00:00+03	6	7572	14	1	5
51	г. Санкт-Петербург, университет, корпус А	3	3	SN-CO-2020-0051	INV-000051	1	7951	2020-09-10 00:00:00+03	2020-12-14 00:00:00+03	2025-01-09 00:00:00+03	12	32143	9	1	1
52	г. Казань, ТЦ Меридиан, 2 этаж	4	1	SN-SN-2021-0052	INV-000052	2	7952	2021-06-02 00:00:00+03	2021-06-15 00:00:00+03	2026-03-09 00:00:00+03	12	4813	17	3	2
53	г. Нижний Новгород, вокзал, зал ожидания	5	2	SN-AQ-2022-0053	INV-000053	3	7953	2022-02-15 00:00:00+03	2022-04-07 00:00:00+03	2026-08-19 00:00:00+03	24	23617	18	1	3
54	г. Екатеринбург, бизнес-центр Восток, 1 этаж	6	3	SN-FR-2023-0054	INV-000054	4	7954	2023-06-13 00:00:00+03	2023-06-27 00:00:00+03	2025-04-23 00:00:00+03	12	6782	9	2	4
55	г. Новосибирск, аэропорт, зал вылета	7	1	SN-VE-2024-0055	INV-000055	5	7955	2024-12-13 00:00:00+03	2025-01-21 00:00:00+03	2025-02-06 00:00:00+03	12	22596	7	3	5
56	г. Самара, бизнес-парк Волга, корпус 2	8	2	SN-CO-2025-0056	INV-000056	1	7956	2025-12-07 00:00:00+03	2026-02-25 00:00:00+03	2026-02-25 00:00:00+03	24	4991	16	1	1
57	г. Краснодар, ТЦ Южный, 3 этаж	1	3	SN-SN-2019-0057	INV-000057	2	7957	2019-01-20 00:00:00+03	2019-04-30 00:00:00+03	2026-05-22 00:00:00+03	6	31538	10	2	2
58	г. Пермь, поликлиника № 4, холл	2	1	SN-AQ-2020-0058	INV-000058	3	7958	2020-09-03 00:00:00+03	2020-10-12 00:00:00+03	2026-02-10 00:00:00+03	12	24607	19	3	3
59	г. Воронеж, университет, библиотека	3	2	SN-FR-2021-0059	INV-000059	4	7959	2021-03-13 00:00:00+03	2021-06-03 00:00:00+03	2025-06-09 00:00:00+03	12	8530	11	1	4
60	г. Ростов-на-Дону, ТЦ Дон, 1 этаж	4	3	SN-VE-2022-0060	INV-000060	5	7960	2022-10-07 00:00:00+03	2022-11-29 00:00:00+03	2026-05-23 00:00:00+03	6	11093	14	2	5
61	г. Уфа, бизнес-центр Башня, холл	5	1	SN-CO-2023-0061	INV-000061	1	7961	2023-11-24 00:00:00+03	2023-12-18 00:00:00+03	2025-02-22 00:00:00+03	12	33005	18	1	1
62	г. Калининград, вокзал, зал ожидания	6	2	SN-SN-2024-0062	INV-000062	2	7962	2024-02-17 00:00:00+03	2024-05-17 00:00:00+03	2025-08-21 00:00:00+03	6	15078	15	1	2
63	г. Тула, спортивный комплекс, фойе	7	3	SN-AQ-2025-0063	INV-000063	3	7963	2025-12-16 00:00:00+03	2026-02-28 00:00:00+03	2026-02-28 00:00:00+03	24	15067	3	1	3
64	г. Ярославль, ТЦ Волга, 2 этаж	8	1	SN-FR-2019-0064	INV-000064	4	7964	2019-06-21 00:00:00+03	2019-08-28 00:00:00+03	2026-04-19 00:00:00+03	6	26014	3	1	4
65	г. Москва, ТЦ Центральный, 1 этаж	1	2	SN-VE-2020-0065	INV-000065	5	7965	2020-11-08 00:00:00+03	2021-01-14 00:00:00+03	2025-06-30 00:00:00+03	12	20555	9	1	5
66	г. Москва, БЦ Север, холл	2	3	SN-CO-2021-0066	INV-000066	1	7966	2021-10-14 00:00:00+03	2021-12-25 00:00:00+03	2026-06-25 00:00:00+03	6	13570	13	1	1
67	г. Санкт-Петербург, университет, корпус А	3	1	SN-SN-2022-0067	INV-000067	2	7967	2022-01-05 00:00:00+03	2022-03-07 00:00:00+03	2026-07-06 00:00:00+03	12	11630	6	1	2
68	г. Казань, ТЦ Меридиан, 2 этаж	4	2	SN-AQ-2023-0068	INV-000068	3	7968	2023-07-01 00:00:00+03	2023-07-11 00:00:00+03	2026-02-02 00:00:00+03	12	7394	2	2	3
69	г. Нижний Новгород, вокзал, зал ожидания	5	3	SN-FR-2024-0069	INV-000069	4	7969	2024-08-14 00:00:00+03	2024-09-08 00:00:00+03	2026-08-29 00:00:00+03	12	19667	19	2	4
70	г. Екатеринбург, бизнес-центр Восток, 1 этаж	6	1	SN-VE-2025-0070	INV-000070	5	7970	2025-06-15 00:00:00+03	2025-07-24 00:00:00+03	2025-09-20 00:00:00+03	12	33851	6	1	5
71	г. Новосибирск, аэропорт, зал вылета	7	2	SN-CO-2019-0071	INV-000071	1	7971	2019-12-12 00:00:00+03	2020-03-13 00:00:00+03	2026-06-25 00:00:00+03	12	31345	1	3	1
72	г. Самара, бизнес-парк Волга, корпус 2	8	3	SN-SN-2020-0072	INV-000072	2	7972	2020-08-22 00:00:00+03	2020-10-05 00:00:00+03	2026-02-14 00:00:00+03	12	36047	4	1	2
73	г. Краснодар, ТЦ Южный, 3 этаж	1	1	SN-AQ-2021-0073	INV-000073	3	7973	2021-12-19 00:00:00+03	2022-01-21 00:00:00+03	2026-01-04 00:00:00+03	12	36309	10	2	3
74	г. Пермь, поликлиника № 4, холл	2	2	SN-FR-2022-0074	INV-000074	4	7974	2022-11-11 00:00:00+03	2022-12-21 00:00:00+03	2025-05-22 00:00:00+03	6	8230	15	2	4
75	г. Воронеж, университет, библиотека	3	3	SN-VE-2023-0075	INV-000075	5	7975	2023-09-03 00:00:00+03	2023-10-03 00:00:00+03	2026-07-22 00:00:00+03	12	9630	14	1	5
76	г. Ростов-на-Дону, ТЦ Дон, 1 этаж	4	1	SN-CO-2024-0076	INV-000076	1	7976	2024-06-20 00:00:00+03	2024-07-11 00:00:00+03	2025-09-04 00:00:00+03	24	5335	9	1	1
77	г. Уфа, бизнес-центр Башня, холл	5	2	SN-SN-2025-0077	INV-000077	2	7977	2025-11-23 00:00:00+03	2026-01-15 00:00:00+03	2026-01-15 00:00:00+03	12	26340	18	1	2
78	г. Калининград, вокзал, зал ожидания	6	3	SN-AQ-2019-0078	INV-000078	3	7978	2019-01-19 00:00:00+03	2019-04-24 00:00:00+03	2025-04-03 00:00:00+03	6	31223	11	2	3
79	г. Тула, спортивный комплекс, фойе	7	1	SN-FR-2020-0079	INV-000079	4	7979	2020-02-06 00:00:00+03	2020-02-27 00:00:00+03	2025-09-10 00:00:00+03	6	9084	16	1	4
80	г. Ярославль, ТЦ Волга, 2 этаж	8	2	SN-VE-2021-0080	INV-000080	5	7980	2021-01-11 00:00:00+03	2021-03-24 00:00:00+03	2025-06-25 00:00:00+03	12	30152	9	3	5
81	г. Москва, ТЦ Центральный, 1 этаж	1	3	SN-CO-2022-0081	INV-000081	1	7981	2022-04-23 00:00:00+03	2022-05-28 00:00:00+03	2025-07-20 00:00:00+03	6	27711	20	1	1
82	г. Москва, БЦ Север, холл	2	1	SN-SN-2023-0082	INV-000082	2	7982	2023-06-18 00:00:00+03	2023-08-30 00:00:00+03	2026-01-24 00:00:00+03	6	17826	13	1	2
83	г. Санкт-Петербург, университет, корпус А	3	2	SN-AQ-2024-0083	INV-000083	3	7983	2024-06-10 00:00:00+03	2024-08-26 00:00:00+03	2026-01-19 00:00:00+03	12	5566	9	2	3
84	г. Казань, ТЦ Меридиан, 2 этаж	4	3	SN-FR-2025-0084	INV-000084	4	7984	2025-01-12 00:00:00+03	2025-02-15 00:00:00+03	2026-06-06 00:00:00+03	12	21095	9	1	4
85	г. Нижний Новгород, вокзал, зал ожидания	5	1	SN-VE-2019-0085	INV-000085	5	7985	2019-09-21 00:00:00+03	2019-10-15 00:00:00+03	2025-04-30 00:00:00+03	6	7132	8	3	5
86	г. Екатеринбург, бизнес-центр Восток, 1 этаж	6	2	SN-CO-2020-0086	INV-000086	1	7986	2020-07-09 00:00:00+03	2020-09-12 00:00:00+03	2026-01-18 00:00:00+03	24	22451	15	2	1
87	г. Новосибирск, аэропорт, зал вылета	7	3	SN-SN-2021-0087	INV-000087	2	7987	2021-11-11 00:00:00+03	2022-01-05 00:00:00+03	2025-03-08 00:00:00+03	12	14936	9	1	2
88	г. Самара, бизнес-парк Волга, корпус 2	8	1	SN-AQ-2022-0088	INV-000088	3	7988	2022-08-07 00:00:00+03	2022-09-19 00:00:00+03	2026-08-24 00:00:00+03	24	21832	5	2	3
89	г. Краснодар, ТЦ Южный, 3 этаж	1	2	SN-FR-2023-0089	INV-000089	4	7989	2023-10-17 00:00:00+03	2023-10-27 00:00:00+03	2026-07-31 00:00:00+03	24	10110	5	1	4
90	г. Пермь, поликлиника № 4, холл	2	3	SN-VE-2024-0090	INV-000090	5	7990	2024-05-01 00:00:00+03	2024-07-08 00:00:00+03	2026-08-05 00:00:00+03	12	21165	16	1	5
91	г. Воронеж, университет, библиотека	3	1	SN-CO-2025-0091	INV-000091	1	7991	2025-05-08 00:00:00+03	2025-06-25 00:00:00+03	2025-06-25 00:00:00+03	12	18007	11	1	1
92	г. Ростов-на-Дону, ТЦ Дон, 1 этаж	4	2	SN-SN-2019-0092	INV-000092	2	7992	2019-04-04 00:00:00+03	2019-06-25 00:00:00+03	2026-08-15 00:00:00+03	6	30088	10	1	2
93	г. Уфа, бизнес-центр Башня, холл	5	3	SN-AQ-2020-0093	INV-000093	3	7993	2020-04-13 00:00:00+03	2020-05-15 00:00:00+03	2025-12-27 00:00:00+03	12	17358	11	1	3
94	г. Калининград, вокзал, зал ожидания	6	1	SN-FR-2021-0094	INV-000094	4	7994	2021-12-01 00:00:00+03	2021-12-20 00:00:00+03	2025-08-25 00:00:00+03	6	34778	10	1	4
95	г. Тула, спортивный комплекс, фойе	7	2	SN-VE-2022-0095	INV-000095	5	7995	2022-06-11 00:00:00+03	2022-08-23 00:00:00+03	2025-04-05 00:00:00+03	6	33243	18	1	5
96	г. Ярославль, ТЦ Волга, 2 этаж	8	3	SN-CO-2023-0096	INV-000096	1	7996	2023-05-15 00:00:00+03	2023-06-20 00:00:00+03	2026-09-09 00:00:00+03	24	4718	20	1	1
97	г. Москва, ТЦ Центральный, 1 этаж	1	1	SN-SN-2024-0097	INV-000097	2	7997	2024-11-02 00:00:00+03	2025-01-14 00:00:00+03	2026-04-12 00:00:00+03	24	30992	7	2	2
98	г. Москва, БЦ Север, холл	2	2	SN-AQ-2025-0098	INV-000098	3	7998	2025-10-20 00:00:00+03	2025-12-15 00:00:00+03	2026-06-26 00:00:00+03	6	21395	16	1	3
99	г. Санкт-Петербург, университет, корпус А	3	3	SN-FR-2019-0099	INV-000099	4	7999	2019-02-06 00:00:00+03	2019-04-14 00:00:00+03	2025-04-16 00:00:00+03	12	6712	1	1	4
100	г. Казань, ТЦ Меридиан, 2 этаж	4	1	SN-VE-2020-0100	INV-000100	5	8000	2020-08-18 00:00:00+03	2020-09-09 00:00:00+03	2025-04-13 00:00:00+03	6	29950	17	1	5
101	г. Нижний Новгород, вокзал, зал ожидания	5	2	SN-CO-2021-0101	INV-000101	1	8001	2021-09-13 00:00:00+03	2021-10-26 00:00:00+03	2025-09-08 00:00:00+03	12	32204	19	1	1
102	г. Екатеринбург, бизнес-центр Восток, 1 этаж	6	3	SN-SN-2022-0102	INV-000102	2	8002	2022-10-13 00:00:00+03	2022-11-20 00:00:00+03	2026-05-08 00:00:00+03	24	30370	9	3	2
103	г. Новосибирск, аэропорт, зал вылета	7	1	SN-AQ-2023-0103	INV-000103	3	8003	2023-01-06 00:00:00+03	2023-02-16 00:00:00+03	2026-08-07 00:00:00+03	24	24035	5	1	3
104	г. Самара, бизнес-парк Волга, корпус 2	8	2	SN-FR-2024-0104	INV-000104	4	8004	2024-09-14 00:00:00+03	2024-10-01 00:00:00+03	2026-05-28 00:00:00+03	6	26836	3	3	4
105	г. Краснодар, ТЦ Южный, 3 этаж	1	3	SN-VE-2025-0105	INV-000105	5	8005	2025-08-17 00:00:00+03	2025-09-25 00:00:00+03	2025-09-25 00:00:00+03	6	3833	19	2	5
106	г. Пермь, поликлиника № 4, холл	2	1	SN-CO-2019-0106	INV-000106	1	8006	2019-05-08 00:00:00+03	2019-08-11 00:00:00+03	2025-01-20 00:00:00+03	12	12044	10	1	1
107	г. Воронеж, университет, библиотека	3	2	SN-SN-2020-0107	INV-000107	2	8007	2020-05-08 00:00:00+03	2020-06-01 00:00:00+03	2025-04-28 00:00:00+03	24	29848	7	1	2
108	г. Ростов-на-Дону, ТЦ Дон, 1 этаж	4	3	SN-AQ-2021-0108	INV-000108	3	8008	2021-04-24 00:00:00+03	2021-05-22 00:00:00+03	2025-09-07 00:00:00+03	12	34700	11	1	3
109	г. Уфа, бизнес-центр Башня, холл	5	1	SN-FR-2022-0109	INV-000109	4	8009	2022-01-19 00:00:00+03	2022-02-27 00:00:00+03	2025-04-30 00:00:00+03	12	28036	11	1	4
110	г. Калининград, вокзал, зал ожидания	6	2	SN-VE-2023-0110	INV-000110	5	8010	2023-01-11 00:00:00+03	2023-04-16 00:00:00+03	2026-05-18 00:00:00+03	6	11951	17	1	5
111	г. Тула, спортивный комплекс, фойе	7	3	SN-CO-2024-0111	INV-000111	1	8011	2024-06-16 00:00:00+03	2024-07-26 00:00:00+03	2025-05-13 00:00:00+03	6	22006	14	1	1
112	г. Ярославль, ТЦ Волга, 2 этаж	8	1	SN-SN-2025-0112	INV-000112	2	8012	2025-02-11 00:00:00+03	2025-03-27 00:00:00+03	2025-11-27 00:00:00+03	6	38366	4	1	2
113	г. Москва, ТЦ Центральный, 1 этаж	1	2	SN-AQ-2019-0113	INV-000113	3	8013	2019-10-14 00:00:00+03	2019-11-30 00:00:00+03	2025-05-10 00:00:00+03	6	20769	16	2	3
114	г. Москва, БЦ Север, холл	2	3	SN-FR-2020-0114	INV-000114	4	8014	2020-08-23 00:00:00+03	2020-11-18 00:00:00+03	2025-10-06 00:00:00+03	24	3002	19	2	4
115	г. Санкт-Петербург, университет, корпус А	3	1	SN-VE-2021-0115	INV-000115	5	8015	2021-07-14 00:00:00+03	2021-09-28 00:00:00+03	2025-01-17 00:00:00+03	12	31133	8	1	5
116	г. Казань, ТЦ Меридиан, 2 этаж	4	2	SN-CO-2022-0116	INV-000116	1	8016	2022-12-14 00:00:00+03	2022-12-25 00:00:00+03	2026-02-24 00:00:00+03	24	36292	19	1	1
117	г. Нижний Новгород, вокзал, зал ожидания	5	3	SN-SN-2023-0117	INV-000117	2	8017	2023-12-20 00:00:00+03	2024-03-05 00:00:00+03	2026-04-08 00:00:00+03	6	30759	8	1	2
118	г. Екатеринбург, бизнес-центр Восток, 1 этаж	6	1	SN-AQ-2024-0118	INV-000118	3	8018	2024-03-11 00:00:00+03	2024-05-02 00:00:00+03	2025-09-01 00:00:00+03	12	27246	18	3	3
119	г. Новосибирск, аэропорт, зал вылета	7	2	SN-FR-2025-0119	INV-000119	4	8019	2025-06-05 00:00:00+03	2025-06-25 00:00:00+03	2026-08-19 00:00:00+03	6	26449	14	1	4
120	г. Самара, бизнес-парк Волга, корпус 2	8	3	SN-VE-2019-0120	INV-000120	5	8020	2019-04-12 00:00:00+03	2019-06-22 00:00:00+03	2026-03-15 00:00:00+03	12	5081	4	1	5
\.


--
-- TOC entry 5142 (class 0 OID 19863)
-- Dependencies: 234
-- Data for Name: vending_country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vending_country (id, name) FROM stdin;
1	Россия
2	Китай
3	Италия
4	Германия
5	Турция
\.


--
-- TOC entry 5144 (class 0 OID 19873)
-- Dependencies: 236
-- Data for Name: vending_manufacturer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vending_manufacturer (id, name) FROM stdin;
1	CoffeePro
2	SnackMaster
3	AquaVend
4	FreshBox
5	VendTech
\.


--
-- TOC entry 5146 (class 0 OID 19886)
-- Dependencies: 238
-- Data for Name: vending_model; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vending_model (id, name) FROM stdin;
1	CoffeePro X2
2	CoffeePro Mini
3	SnackMaster 500
4	SnackMaster 700
5	AquaVend 300
6	FreshBox Mini
7	FreshBox Plus
8	ComboVend 900
\.


--
-- TOC entry 5148 (class 0 OID 19897)
-- Dependencies: 240
-- Data for Name: vending_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vending_status (id, status) FROM stdin;
1	Работает
2	В ремонте/на обслуживании
3	Вышел из строя
\.


--
-- TOC entry 5150 (class 0 OID 19908)
-- Dependencies: 242
-- Data for Name: vending_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vending_type (id, type) FROM stdin;
1	Наличные
2	Карта
3	Смешанный
\.


--
-- TOC entry 5168 (class 0 OID 0)
-- Dependencies: 219
-- Name: buying_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.buying_id_seq', 1, false);


--
-- TOC entry 5169 (class 0 OID 0)
-- Dependencies: 221
-- Name: buying_payment_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.buying_payment_method_id_seq', 1, false);


--
-- TOC entry 5170 (class 0 OID 0)
-- Dependencies: 223
-- Name: maintenance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maintenance_id_seq', 1, false);


--
-- TOC entry 5171 (class 0 OID 0)
-- Dependencies: 225
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 1, false);


--
-- TOC entry 5172 (class 0 OID 0)
-- Dependencies: 227
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- TOC entry 5173 (class 0 OID 0)
-- Dependencies: 229
-- Name: user_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_role_id_seq', 1, false);


--
-- TOC entry 5174 (class 0 OID 0)
-- Dependencies: 233
-- Name: vending_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vending_country_id_seq', 1, false);


--
-- TOC entry 5175 (class 0 OID 0)
-- Dependencies: 231
-- Name: vending_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vending_id_seq', 1, false);


--
-- TOC entry 5176 (class 0 OID 0)
-- Dependencies: 235
-- Name: vending_manufacturer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vending_manufacturer_id_seq', 1, false);


--
-- TOC entry 5177 (class 0 OID 0)
-- Dependencies: 237
-- Name: vending_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vending_model_id_seq', 1, false);


--
-- TOC entry 5178 (class 0 OID 0)
-- Dependencies: 239
-- Name: vending_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vending_status_id_seq', 1, false);


--
-- TOC entry 5179 (class 0 OID 0)
-- Dependencies: 241
-- Name: vending_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vending_type_id_seq', 1, false);


--
-- TOC entry 4926 (class 2606 OID 19774)
-- Name: buying_payment_method buying_payment_method_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buying_payment_method
    ADD CONSTRAINT buying_payment_method_name_key UNIQUE (name);


--
-- TOC entry 4928 (class 2606 OID 19772)
-- Name: buying_payment_method buying_payment_method_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buying_payment_method
    ADD CONSTRAINT buying_payment_method_pkey PRIMARY KEY (id);


--
-- TOC entry 4924 (class 2606 OID 19763)
-- Name: buying buying_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buying
    ADD CONSTRAINT buying_pkey PRIMARY KEY (id);


--
-- TOC entry 4930 (class 2606 OID 19788)
-- Name: maintenance maintenance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance
    ADD CONSTRAINT maintenance_pkey PRIMARY KEY (id);


--
-- TOC entry 4932 (class 2606 OID 19802)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 4934 (class 2606 OID 19819)
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- TOC entry 4936 (class 2606 OID 19821)
-- Name: user user_phone_num_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_num_key UNIQUE (phone_num);


--
-- TOC entry 4938 (class 2606 OID 19817)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 4940 (class 2606 OID 19832)
-- Name: user_role user_role_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_name_key UNIQUE (name);


--
-- TOC entry 4942 (class 2606 OID 19830)
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (id);


--
-- TOC entry 4950 (class 2606 OID 19871)
-- Name: vending_country vending_country_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vending_country
    ADD CONSTRAINT vending_country_name_key UNIQUE (name);


--
-- TOC entry 4952 (class 2606 OID 19869)
-- Name: vending_country vending_country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vending_country
    ADD CONSTRAINT vending_country_pkey PRIMARY KEY (id);


--
-- TOC entry 4944 (class 2606 OID 19859)
-- Name: vending vending_inv_num_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vending
    ADD CONSTRAINT vending_inv_num_key UNIQUE (inv_num);


--
-- TOC entry 4954 (class 2606 OID 19884)
-- Name: vending_manufacturer vending_manufacturer_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vending_manufacturer
    ADD CONSTRAINT vending_manufacturer_name_key UNIQUE (name);


--
-- TOC entry 4956 (class 2606 OID 19882)
-- Name: vending_manufacturer vending_manufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vending_manufacturer
    ADD CONSTRAINT vending_manufacturer_pkey PRIMARY KEY (id);


--
-- TOC entry 4958 (class 2606 OID 19895)
-- Name: vending_model vending_model_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vending_model
    ADD CONSTRAINT vending_model_name_key UNIQUE (name);


--
-- TOC entry 4960 (class 2606 OID 19893)
-- Name: vending_model vending_model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vending_model
    ADD CONSTRAINT vending_model_pkey PRIMARY KEY (id);


--
-- TOC entry 4946 (class 2606 OID 19857)
-- Name: vending vending_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vending
    ADD CONSTRAINT vending_pkey PRIMARY KEY (id);


--
-- TOC entry 4948 (class 2606 OID 19861)
-- Name: vending vending_serial_num_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vending
    ADD CONSTRAINT vending_serial_num_key UNIQUE (serial_num);


--
-- TOC entry 4962 (class 2606 OID 19904)
-- Name: vending_status vending_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vending_status
    ADD CONSTRAINT vending_status_pkey PRIMARY KEY (id);


--
-- TOC entry 4964 (class 2606 OID 19906)
-- Name: vending_status vending_status_status_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vending_status
    ADD CONSTRAINT vending_status_status_key UNIQUE (status);


--
-- TOC entry 4966 (class 2606 OID 19917)
-- Name: vending_type vending_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vending_type
    ADD CONSTRAINT vending_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4968 (class 2606 OID 19919)
-- Name: vending_type vending_type_type_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vending_type
    ADD CONSTRAINT vending_type_type_key UNIQUE (type);


--
-- TOC entry 4969 (class 2606 OID 19920)
-- Name: buying buying_payment_method_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buying
    ADD CONSTRAINT buying_payment_method_fkey FOREIGN KEY (payment_method) REFERENCES public.buying_payment_method(id);


--
-- TOC entry 4970 (class 2606 OID 19925)
-- Name: buying buying_product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buying
    ADD CONSTRAINT buying_product_fkey FOREIGN KEY (product) REFERENCES public.product(id);


--
-- TOC entry 4971 (class 2606 OID 19930)
-- Name: buying buying_vending_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buying
    ADD CONSTRAINT buying_vending_fkey FOREIGN KEY (vending) REFERENCES public.vending(id);


--
-- TOC entry 4972 (class 2606 OID 19935)
-- Name: maintenance maintenance_vending_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance
    ADD CONSTRAINT maintenance_vending_fkey FOREIGN KEY (vending) REFERENCES public.vending(id);


--
-- TOC entry 4973 (class 2606 OID 19940)
-- Name: maintenance maintenance_worker_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance
    ADD CONSTRAINT maintenance_worker_fkey FOREIGN KEY (worker) REFERENCES public."user"(id);


--
-- TOC entry 4974 (class 2606 OID 19945)
-- Name: user user_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_role_fkey FOREIGN KEY (role) REFERENCES public.user_role(id);


--
-- TOC entry 4975 (class 2606 OID 19950)
-- Name: vending vending_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vending
    ADD CONSTRAINT vending_country_fkey FOREIGN KEY (country) REFERENCES public.vending_country(id);


--
-- TOC entry 4976 (class 2606 OID 19955)
-- Name: vending vending_manufacturer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vending
    ADD CONSTRAINT vending_manufacturer_fkey FOREIGN KEY (manufacturer) REFERENCES public.vending_manufacturer(id);


--
-- TOC entry 4977 (class 2606 OID 19960)
-- Name: vending vending_model_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vending
    ADD CONSTRAINT vending_model_fkey FOREIGN KEY (model) REFERENCES public.vending_model(id);


--
-- TOC entry 4978 (class 2606 OID 19965)
-- Name: vending vending_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vending
    ADD CONSTRAINT vending_status_fkey FOREIGN KEY (status) REFERENCES public.vending_status(id);


--
-- TOC entry 4979 (class 2606 OID 19970)
-- Name: vending vending_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vending
    ADD CONSTRAINT vending_type_fkey FOREIGN KEY (type) REFERENCES public.vending_type(id);


-- Completed on 2026-10-15 15:48:08

--
-- PostgreSQL database dump complete
--

\unrestrict KOIyyso2oSRvgB8nGRfkeK1JeK5qMY8Wfx9bcihcaIafs1CsgXO2lj9kAav27RM

