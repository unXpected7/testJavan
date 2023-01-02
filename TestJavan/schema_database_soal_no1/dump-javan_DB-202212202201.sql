--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2022-12-20 22:01:19

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 24751)
-- Name: AsetDetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AsetDetails" (
    id integer NOT NULL,
    "asetId" integer,
    "productId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."AsetDetails" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24750)
-- Name: AsetDetails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."AsetDetails_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AsetDetails_id_seq" OWNER TO postgres;

--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 219
-- Name: AsetDetails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."AsetDetails_id_seq" OWNED BY public."AsetDetails".id;


--
-- TOC entry 218 (class 1259 OID 24744)
-- Name: Asets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Asets" (
    id integer NOT NULL,
    "personId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Asets" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24743)
-- Name: Asets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Asets_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Asets_id_seq" OWNER TO postgres;

--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 217
-- Name: Asets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Asets_id_seq" OWNED BY public."Asets".id;


--
-- TOC entry 216 (class 1259 OID 24735)
-- Name: People; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."People" (
    id integer NOT NULL,
    name character varying(255),
    gender character varying(255),
    "parentId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."People" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24734)
-- Name: People_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."People_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."People_id_seq" OWNER TO postgres;

--
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 215
-- Name: People_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."People_id_seq" OWNED BY public."People".id;


--
-- TOC entry 222 (class 1259 OID 24758)
-- Name: Products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Products" (
    id integer NOT NULL,
    title character varying(255),
    description text,
    price integer,
    "discountPercentage" integer,
    rating integer,
    stock integer,
    brand character varying(255),
    category character varying(255),
    thumbnail character varying(255),
    images text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Products" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24757)
-- Name: Products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Products_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Products_id_seq" OWNER TO postgres;

--
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 221
-- Name: Products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Products_id_seq" OWNED BY public."Products".id;


--
-- TOC entry 214 (class 1259 OID 24729)
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO postgres;

--
-- TOC entry 3194 (class 2604 OID 24754)
-- Name: AsetDetails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AsetDetails" ALTER COLUMN id SET DEFAULT nextval('public."AsetDetails_id_seq"'::regclass);


--
-- TOC entry 3193 (class 2604 OID 24747)
-- Name: Asets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Asets" ALTER COLUMN id SET DEFAULT nextval('public."Asets_id_seq"'::regclass);


--
-- TOC entry 3192 (class 2604 OID 24738)
-- Name: People id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."People" ALTER COLUMN id SET DEFAULT nextval('public."People_id_seq"'::regclass);


--
-- TOC entry 3195 (class 2604 OID 24761)
-- Name: Products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products" ALTER COLUMN id SET DEFAULT nextval('public."Products_id_seq"'::regclass);


--
-- TOC entry 3354 (class 0 OID 24751)
-- Dependencies: 220
-- Data for Name: AsetDetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AsetDetails" (id, "asetId", "productId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 3352 (class 0 OID 24744)
-- Dependencies: 218
-- Data for Name: Asets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Asets" (id, "personId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 3350 (class 0 OID 24735)
-- Dependencies: 216
-- Data for Name: People; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."People" (id, name, gender, "parentId", "createdAt", "updatedAt") FROM stdin;
1	Bani	male	\N	2022-12-20 21:24:25.422+07	2022-12-20 21:24:25.422+07
2	Budi	male	1	2022-12-20 21:24:25.422+07	2022-12-20 21:24:25.422+07
3	Nida	male	1	2022-12-20 21:24:25.422+07	2022-12-20 21:24:25.422+07
4	Andi	male	1	2022-12-20 21:24:25.422+07	2022-12-20 21:24:25.422+07
5	Sigit	male	1	2022-12-20 21:24:25.422+07	2022-12-20 21:24:25.422+07
6	Hari	male	2	2022-12-20 21:24:25.422+07	2022-12-20 21:24:25.422+07
7	Siti	female	2	2022-12-20 21:24:25.422+07	2022-12-20 21:24:25.422+07
8	Bila	female	3	2022-12-20 21:24:25.423+07	2022-12-20 21:24:25.423+07
9	Lesti	female	3	2022-12-20 21:24:25.423+07	2022-12-20 21:24:25.423+07
10	Diki	male	4	2022-12-20 21:24:25.423+07	2022-12-20 21:24:25.423+07
11	Doni	male	5	2022-12-20 21:24:25.423+07	2022-12-20 21:24:25.423+07
12	Toni	male	5	2022-12-20 21:24:25.423+07	2022-12-20 21:24:25.423+07
\.


--
-- TOC entry 3356 (class 0 OID 24758)
-- Dependencies: 222
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Products" (id, title, description, price, "discountPercentage", rating, stock, brand, category, thumbnail, images, "createdAt", "updatedAt") FROM stdin;
1	iPhone 9	An apple mobile which is nothing like apple	549	13	5	94	Apple	smartphones	https://i.dummyjson.com/data/products/1/thumbnail.jpg	{https://i.dummyjson.com/data/products/1/1.jpg,https://i.dummyjson.com/data/products/1/2.jpg,https://i.dummyjson.com/data/products/1/3.jpg,https://i.dummyjson.com/data/products/1/4.jpg,https://i.dummyjson.com/data/products/1/thumbnail.jpg}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
2	iPhone X	SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...	899	18	4	34	Apple	smartphones	https://i.dummyjson.com/data/products/2/thumbnail.jpg	{https://i.dummyjson.com/data/products/2/1.jpg,https://i.dummyjson.com/data/products/2/2.jpg,https://i.dummyjson.com/data/products/2/3.jpg,https://i.dummyjson.com/data/products/2/thumbnail.jpg}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
3	Samsung Universe 9	Samsung's new variant which goes beyond Galaxy to the Universe	1249	15	4	36	Samsung	smartphones	https://i.dummyjson.com/data/products/3/thumbnail.jpg	{https://i.dummyjson.com/data/products/3/1.jpg}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
4	OPPOF19	OPPO F19 is officially announced on April 2021.	280	18	4	123	OPPO	smartphones	https://i.dummyjson.com/data/products/4/thumbnail.jpg	{https://i.dummyjson.com/data/products/4/1.jpg,https://i.dummyjson.com/data/products/4/2.jpg,https://i.dummyjson.com/data/products/4/3.jpg,https://i.dummyjson.com/data/products/4/4.jpg,https://i.dummyjson.com/data/products/4/thumbnail.jpg}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
5	Huawei P30	Huawei’s re-badged P30 Pro New Edition was officially unveiled yesterday in Germany and now the device has made its way to the UK.	499	11	4	32	Huawei	smartphones	https://i.dummyjson.com/data/products/5/thumbnail.jpg	{https://i.dummyjson.com/data/products/5/1.jpg,https://i.dummyjson.com/data/products/5/2.jpg,https://i.dummyjson.com/data/products/5/3.jpg}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
6	MacBook Pro	MacBook Pro 2021 with mini-LED display may launch between September, November	1749	11	5	83	APPle	laptops	https://i.dummyjson.com/data/products/6/thumbnail.png	{https://i.dummyjson.com/data/products/6/1.png,https://i.dummyjson.com/data/products/6/2.jpg,https://i.dummyjson.com/data/products/6/3.png,https://i.dummyjson.com/data/products/6/4.jpg}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
7	Samsung Galaxy Book	Samsung Galaxy Book S (2020) Laptop With Intel Lakefield Chip, 8GB of RAM Launched	1499	4	4	50	Samsung	laptops	https://i.dummyjson.com/data/products/7/thumbnail.jpg	{https://i.dummyjson.com/data/products/7/1.jpg,https://i.dummyjson.com/data/products/7/2.jpg,https://i.dummyjson.com/data/products/7/3.jpg,https://i.dummyjson.com/data/products/7/thumbnail.jpg}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
8	Microsoft Surface Laptop 4	Style and speed. Stand out on HD video calls backed by Studio Mics. Capture ideas on the vibrant touchscreen.	1499	10	4	68	Microsoft Surface	laptops	https://i.dummyjson.com/data/products/8/thumbnail.jpg	{https://i.dummyjson.com/data/products/8/1.jpg,https://i.dummyjson.com/data/products/8/2.jpg,https://i.dummyjson.com/data/products/8/3.jpg,https://i.dummyjson.com/data/products/8/4.jpg,https://i.dummyjson.com/data/products/8/thumbnail.jpg}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
9	Infinix INBOOK	Infinix Inbook X1 Ci3 10th 8GB 256GB 14 Win10 Grey – 1 Year Warranty	1099	12	5	96	Infinix	laptops	https://i.dummyjson.com/data/products/9/thumbnail.jpg	{https://i.dummyjson.com/data/products/9/1.jpg,https://i.dummyjson.com/data/products/9/2.png,https://i.dummyjson.com/data/products/9/3.png,https://i.dummyjson.com/data/products/9/4.jpg,https://i.dummyjson.com/data/products/9/thumbnail.jpg}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
10	HP Pavilion 15-DK1056WM	HP Pavilion 15-DK1056WM Gaming Laptop 10th Gen Core i5, 8GB, 256GB SSD, GTX 1650 4GB, Windows 10	1099	6	4	89	HP Pavilion	laptops	https://i.dummyjson.com/data/products/10/thumbnail.jpeg	{https://i.dummyjson.com/data/products/10/1.jpg,https://i.dummyjson.com/data/products/10/2.jpg,https://i.dummyjson.com/data/products/10/3.jpg,https://i.dummyjson.com/data/products/10/thumbnail.jpeg}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
11	perfume Oil	Mega Discount, Impression of Acqua Di Gio by GiorgioArmani concentrated attar perfume Oil	13	8	4	65	Impression of Acqua Di Gio	fragrances	https://i.dummyjson.com/data/products/11/thumbnail.jpg	{https://i.dummyjson.com/data/products/11/1.jpg,https://i.dummyjson.com/data/products/11/2.jpg,https://i.dummyjson.com/data/products/11/3.jpg,https://i.dummyjson.com/data/products/11/thumbnail.jpg}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
12	Brown Perfume	Royal_Mirage Sport Brown Perfume for Men & Women - 120ml	40	16	4	52	Royal_Mirage	fragrances	https://i.dummyjson.com/data/products/12/thumbnail.jpg	{https://i.dummyjson.com/data/products/12/1.jpg,https://i.dummyjson.com/data/products/12/2.jpg,https://i.dummyjson.com/data/products/12/3.png,https://i.dummyjson.com/data/products/12/4.jpg,https://i.dummyjson.com/data/products/12/thumbnail.jpg}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
13	Fog Scent Xpressio Perfume	Product details of Best Fog Scent Xpressio Perfume 100ml For Men cool long lasting perfumes for Men	13	8	5	61	Fog Scent Xpressio	fragrances	https://i.dummyjson.com/data/products/13/thumbnail.webp	{https://i.dummyjson.com/data/products/13/1.jpg,https://i.dummyjson.com/data/products/13/2.png,https://i.dummyjson.com/data/products/13/3.jpg,https://i.dummyjson.com/data/products/13/4.jpg,https://i.dummyjson.com/data/products/13/thumbnail.webp}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
14	Non-Alcoholic Concentrated Perfume Oil	Original Al Munakh® by Mahal Al Musk | Our Impression of Climate | 6ml Non-Alcoholic Concentrated Perfume Oil	120	16	4	114	Al Munakh	fragrances	https://i.dummyjson.com/data/products/14/thumbnail.jpg	{https://i.dummyjson.com/data/products/14/1.jpg,https://i.dummyjson.com/data/products/14/2.jpg,https://i.dummyjson.com/data/products/14/3.jpg,https://i.dummyjson.com/data/products/14/thumbnail.jpg}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
15	Eau De Perfume Spray	Genuine  Al-Rehab spray perfume from UAE/Saudi Arabia/Yemen High Quality	30	11	5	105	Lord - Al-Rehab	fragrances	https://i.dummyjson.com/data/products/15/thumbnail.jpg	{https://i.dummyjson.com/data/products/15/1.jpg,https://i.dummyjson.com/data/products/15/2.jpg,https://i.dummyjson.com/data/products/15/3.jpg,https://i.dummyjson.com/data/products/15/4.jpg,https://i.dummyjson.com/data/products/15/thumbnail.jpg}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
16	Hyaluronic Acid Serum	L'OrÃ©al Paris introduces Hyaluron Expert Replumping Serum formulated with 1.5% Hyaluronic Acid	19	13	5	110	L'Oreal Paris	skincare	https://i.dummyjson.com/data/products/16/thumbnail.jpg	{https://i.dummyjson.com/data/products/16/1.png,https://i.dummyjson.com/data/products/16/2.webp,https://i.dummyjson.com/data/products/16/3.jpg,https://i.dummyjson.com/data/products/16/4.jpg,https://i.dummyjson.com/data/products/16/thumbnail.jpg}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
17	Tree Oil 30ml	Tea tree oil contains a number of compounds, including terpinen-4-ol, that have been shown to kill certain bacteria,	12	4	5	78	Hemani Tea	skincare	https://i.dummyjson.com/data/products/17/thumbnail.jpg	{https://i.dummyjson.com/data/products/17/1.jpg,https://i.dummyjson.com/data/products/17/2.jpg,https://i.dummyjson.com/data/products/17/3.jpg,https://i.dummyjson.com/data/products/17/thumbnail.jpg}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
18	Oil Free Moisturizer 100ml	Dermive Oil Free Moisturizer with SPF 20 is specifically formulated with ceramides, hyaluronic acid & sunscreen.	40	13	5	88	Dermive	skincare	https://i.dummyjson.com/data/products/18/thumbnail.jpg	{https://i.dummyjson.com/data/products/18/1.jpg,https://i.dummyjson.com/data/products/18/2.jpg,https://i.dummyjson.com/data/products/18/3.jpg,https://i.dummyjson.com/data/products/18/4.jpg,https://i.dummyjson.com/data/products/18/thumbnail.jpg}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
19	Skin Beauty Serum.	Product name: rorec collagen hyaluronic acid white face serum riceNet weight: 15 m	46	11	4	54	ROREC White Rice	skincare	https://i.dummyjson.com/data/products/19/thumbnail.jpg	{https://i.dummyjson.com/data/products/19/1.jpg,https://i.dummyjson.com/data/products/19/2.jpg,https://i.dummyjson.com/data/products/19/3.png,https://i.dummyjson.com/data/products/19/thumbnail.jpg}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
20	Freckle Treatment Cream- 15gm	Fair & Clear is Pakistan's only pure Freckle cream which helpsfade Freckles, Darkspots and pigments. Mercury level is 0%, so there are no side effects.	70	17	4	140	Fair & Clear	skincare	https://i.dummyjson.com/data/products/20/thumbnail.jpg	{https://i.dummyjson.com/data/products/20/1.jpg,https://i.dummyjson.com/data/products/20/2.jpg,https://i.dummyjson.com/data/products/20/3.jpg,https://i.dummyjson.com/data/products/20/4.jpg,https://i.dummyjson.com/data/products/20/thumbnail.jpg}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
21	- Daal Masoor 500 grams	Fine quality Branded Product Keep in a cool and dry place	20	5	4	133	Saaf & Khaas	groceries	https://i.dummyjson.com/data/products/21/thumbnail.png	{https://i.dummyjson.com/data/products/21/1.png,https://i.dummyjson.com/data/products/21/2.jpg,https://i.dummyjson.com/data/products/21/3.jpg}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
22	Elbow Macaroni - 400 gm	Product details of Bake Parlor Big Elbow Macaroni - 400 gm	14	16	5	146	Bake Parlor Big	groceries	https://i.dummyjson.com/data/products/22/thumbnail.jpg	{https://i.dummyjson.com/data/products/22/1.jpg,https://i.dummyjson.com/data/products/22/2.jpg,https://i.dummyjson.com/data/products/22/3.jpg}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
23	Orange Essence Food Flavou	Specifications of Orange Essence Food Flavour For Cakes and Baking Food Item	14	8	5	26	Baking Food Items	groceries	https://i.dummyjson.com/data/products/23/thumbnail.jpg	{https://i.dummyjson.com/data/products/23/1.jpg,https://i.dummyjson.com/data/products/23/2.jpg,https://i.dummyjson.com/data/products/23/3.jpg,https://i.dummyjson.com/data/products/23/4.jpg,https://i.dummyjson.com/data/products/23/thumbnail.jpg}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
24	cereals muesli fruit nuts	original fauji cereal muesli 250gm box pack original fauji cereals muesli fruit nuts flakes breakfast cereal break fast faujicereals cerels cerel foji fouji	46	17	5	113	fauji	groceries	https://i.dummyjson.com/data/products/24/thumbnail.jpg	{https://i.dummyjson.com/data/products/24/1.jpg,https://i.dummyjson.com/data/products/24/2.jpg,https://i.dummyjson.com/data/products/24/3.jpg,https://i.dummyjson.com/data/products/24/4.jpg,https://i.dummyjson.com/data/products/24/thumbnail.jpg}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
25	Gulab Powder 50 Gram	Dry Rose Flower Powder Gulab Powder 50 Gram • Treats Wounds	70	14	5	47	Dry Rose	groceries	https://i.dummyjson.com/data/products/25/thumbnail.jpg	{https://i.dummyjson.com/data/products/25/1.png,https://i.dummyjson.com/data/products/25/2.jpg,https://i.dummyjson.com/data/products/25/3.png,https://i.dummyjson.com/data/products/25/4.jpg,https://i.dummyjson.com/data/products/25/thumbnail.jpg}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
26	Plant Hanger For Home	Boho Decor Plant Hanger For Home Wall Decoration Macrame Wall Hanging Shelf	41	18	4	131	Boho Decor	home-decoration	https://i.dummyjson.com/data/products/26/thumbnail.jpg	{https://i.dummyjson.com/data/products/26/1.jpg,https://i.dummyjson.com/data/products/26/2.jpg,https://i.dummyjson.com/data/products/26/3.jpg,https://i.dummyjson.com/data/products/26/4.jpg,https://i.dummyjson.com/data/products/26/5.jpg,https://i.dummyjson.com/data/products/26/thumbnail.jpg}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
27	Flying Wooden Bird	Package Include 6 Birds with Adhesive Tape Shape: 3D Shaped Wooden Birds Material: Wooden MDF, Laminated 3.5mm	51	16	4	17	Flying Wooden	home-decoration	https://i.dummyjson.com/data/products/27/thumbnail.webp	{https://i.dummyjson.com/data/products/27/1.jpg,https://i.dummyjson.com/data/products/27/2.jpg,https://i.dummyjson.com/data/products/27/3.jpg,https://i.dummyjson.com/data/products/27/4.jpg,https://i.dummyjson.com/data/products/27/thumbnail.webp}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
28	3D Embellishment Art Lamp	3D led lamp sticker Wall sticker 3d wall art light on/off button  cell operated (included)	20	16	5	54	LED Lights	home-decoration	https://i.dummyjson.com/data/products/28/thumbnail.jpg	{https://i.dummyjson.com/data/products/28/1.jpg,https://i.dummyjson.com/data/products/28/2.jpg,https://i.dummyjson.com/data/products/28/3.png,https://i.dummyjson.com/data/products/28/4.jpg,https://i.dummyjson.com/data/products/28/thumbnail.jpg}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
29	Handcraft Chinese style	Handcraft Chinese style art luxury palace hotel villa mansion home decor ceramic vase with brass fruit plate	60	15	4	7	luxury palace	home-decoration	https://i.dummyjson.com/data/products/29/thumbnail.webp	{https://i.dummyjson.com/data/products/29/1.jpg,https://i.dummyjson.com/data/products/29/2.jpg,https://i.dummyjson.com/data/products/29/3.webp,https://i.dummyjson.com/data/products/29/4.webp,https://i.dummyjson.com/data/products/29/thumbnail.webp}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
30	Key Holder	Attractive DesignMetallic materialFour key hooksReliable & DurablePremium Quality	30	3	5	54	Golden	home-decoration	https://i.dummyjson.com/data/products/30/thumbnail.jpg	{https://i.dummyjson.com/data/products/30/1.jpg,https://i.dummyjson.com/data/products/30/2.jpg,https://i.dummyjson.com/data/products/30/3.jpg,https://i.dummyjson.com/data/products/30/thumbnail.jpg}	2022-12-20 21:24:25.439+07	2022-12-20 21:24:25.439+07
\.


--
-- TOC entry 3348 (class 0 OID 24729)
-- Dependencies: 214
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SequelizeMeta" (name) FROM stdin;
20221220070901-create-person.js
20221220082052-create-aset.js
20221220083228-create-aset-detail.js
20221220083847-create-product.js
\.


--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 219
-- Name: AsetDetails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."AsetDetails_id_seq"', 1, false);


--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 217
-- Name: Asets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Asets_id_seq"', 1, false);


--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 215
-- Name: People_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."People_id_seq"', 12, true);


--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 221
-- Name: Products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Products_id_seq"', 1, false);


--
-- TOC entry 3203 (class 2606 OID 24756)
-- Name: AsetDetails AsetDetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AsetDetails"
    ADD CONSTRAINT "AsetDetails_pkey" PRIMARY KEY (id);


--
-- TOC entry 3201 (class 2606 OID 24749)
-- Name: Asets Asets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Asets"
    ADD CONSTRAINT "Asets_pkey" PRIMARY KEY (id);


--
-- TOC entry 3199 (class 2606 OID 24742)
-- Name: People People_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_pkey" PRIMARY KEY (id);


--
-- TOC entry 3205 (class 2606 OID 24765)
-- Name: Products Products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_pkey" PRIMARY KEY (id);


--
-- TOC entry 3197 (class 2606 OID 24733)
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


-- Completed on 2022-12-20 22:01:19

--
-- PostgreSQL database dump complete
--

