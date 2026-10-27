-- Schema
--
-- PostgreSQL database dump
--

-- Dumped from database version 17.11 (11592b3)
-- Dumped by pg_dump version 17.11 (11592b3)

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
-- Name: gallery; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.gallery (
    id integer NOT NULL,
    image_url text NOT NULL,
    caption text DEFAULT ''::text,
    trip_date date,
    yacht_name text DEFAULT ''::text,
    category text DEFAULT ''::text,
    is_active boolean DEFAULT true,
    sort_order integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.gallery OWNER TO neondb_owner;

--
-- Name: gallery_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.gallery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gallery_id_seq OWNER TO neondb_owner;

--
-- Name: gallery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.gallery_id_seq OWNED BY public.gallery.id;


--
-- Name: inquiries; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.inquiries (
    id integer NOT NULL,
    name text NOT NULL,
    phone text NOT NULL,
    email text,
    date date,
    guests integer,
    occasion text,
    yacht_id text,
    message text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    preferred_time text,
    adults integer,
    kids integer DEFAULT 0,
    additional_notes text,
    hours text,
    num_people integer
);


ALTER TABLE public.inquiries OWNER TO neondb_owner;

--
-- Name: inquiries_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.inquiries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inquiries_id_seq OWNER TO neondb_owner;

--
-- Name: inquiries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.inquiries_id_seq OWNED BY public.inquiries.id;


--
-- Name: site_config; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.site_config (
    key text NOT NULL,
    value text DEFAULT ''::text NOT NULL,
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.site_config OWNER TO neondb_owner;

--
-- Name: yacht_amenities; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.yacht_amenities (
    id integer NOT NULL,
    yacht_id text NOT NULL,
    name text NOT NULL,
    description text DEFAULT ''::text NOT NULL,
    icon text DEFAULT '✨'::text NOT NULL,
    enabled boolean DEFAULT true,
    sort_order integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.yacht_amenities OWNER TO neondb_owner;

--
-- Name: yacht_amenities_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.yacht_amenities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.yacht_amenities_id_seq OWNER TO neondb_owner;

--
-- Name: yacht_amenities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.yacht_amenities_id_seq OWNED BY public.yacht_amenities.id;


--
-- Name: yachts_master; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.yachts_master (
    id text NOT NULL,
    name text NOT NULL,
    description text DEFAULT ''::text,
    why_choose text DEFAULT ''::text,
    type text DEFAULT ''::text,
    capacity integer DEFAULT 0,
    duration text DEFAULT '1–4 Hours'::text,
    sailing_price integer DEFAULT 0,
    sailing_price_2hr integer DEFAULT 0,
    anchorage_price integer DEFAULT 0,
    banner_image text DEFAULT ''::text,
    images jsonb DEFAULT '[]'::jsonb,
    inclusions jsonb DEFAULT '[]'::jsonb,
    exclusions jsonb DEFAULT '[]'::jsonb,
    best_for jsonb DEFAULT '[]'::jsonb,
    promo_label text DEFAULT ''::text,
    reel_url text DEFAULT ''::text,
    live_video_url text DEFAULT ''::text,
    is_active boolean DEFAULT true,
    sort_order integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.yachts_master OWNER TO neondb_owner;

--
-- Name: gallery id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.gallery ALTER COLUMN id SET DEFAULT nextval('public.gallery_id_seq'::regclass);


--
-- Name: inquiries id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.inquiries ALTER COLUMN id SET DEFAULT nextval('public.inquiries_id_seq'::regclass);


--
-- Name: yacht_amenities id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.yacht_amenities ALTER COLUMN id SET DEFAULT nextval('public.yacht_amenities_id_seq'::regclass);


--
-- Name: gallery gallery_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.gallery
    ADD CONSTRAINT gallery_pkey PRIMARY KEY (id);


--
-- Name: inquiries inquiries_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.inquiries
    ADD CONSTRAINT inquiries_pkey PRIMARY KEY (id);


--
-- Name: site_config site_config_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.site_config
    ADD CONSTRAINT site_config_pkey PRIMARY KEY (key);


--
-- Name: yacht_amenities yacht_amenities_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.yacht_amenities
    ADD CONSTRAINT yacht_amenities_pkey PRIMARY KEY (id);


--
-- Name: yachts_master yachts_master_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.yachts_master
    ADD CONSTRAINT yachts_master_pkey PRIMARY KEY (id);


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO neon_superuser WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON TABLES TO neon_superuser WITH GRANT OPTION;


--
-- PostgreSQL database dump complete
--



-- Data
COPY "site_config" FROM stdin;
address	Panjim Jetty, Goa, India	2026-10-05 09:16:19.312052+00
admin_password	admin123	2026-10-05 09:16:19.345207+00
business_hours	Everyday: 9:00 AM – 8:00 PM	2026-10-05 09:16:19.377623+00
contact_email	goayachtworld@gmail.com	2026-10-05 09:16:19.409577+00
experiences_items	[{"id":"birthdays","title":"Birthday Celebrations","description":"Celebrate another year surrounded by the sea, your favourite people, and unforgettable views.","image":"https://images.unsplash.com/photo-1464349095431-e9a21285b5f3?q=80&w=1973&auto=format&fit=crop","emoji":"🎂"},{"id":"sunsets","title":"Sunset Cruises","description":"Slow down and enjoy Goa's beautiful waters as the sky turns golden.","image":"https://images.unsplash.com/photo-1534313314376-a72289b6181e?q=80&w=1974&auto=format&fit=crop","emoji":"🌅"},{"id":"couples","title":"Couple Experiences","description":"A private escape designed for romance, from quiet cruises to special celebrations.","image":"https://images.unsplash.com/photo-1516589174184-c68d8e5ffe5e?q=80&w=1974&auto=format&fit=crop","emoji":"💑"},{"id":"corporate","title":"Corporate Events","description":"Take your team meetings or networking out to sea for a fresh perspective.","image":"https://images.unsplash.com/photo-1521737604893-d14cc237f11d?q=80&w=2084&auto=format&fit=crop","emoji":"💼"}]	2026-10-05 09:16:19.441427+00
experiences_section_heading	More Than a Cruise. It's Your Moment.	2026-10-05 09:16:19.471263+00
experiences_section_subheading	Whether it's a quiet sunset or a grand celebration, we curate every detail for an extraordinary experience.	2026-10-05 09:16:19.505058+00
experiences_section_title	Our Experiences	2026-10-05 09:16:19.536283+00
facebook_url		2026-10-05 09:16:19.569603+00
google_url		2026-10-05 09:16:19.60112+00
instagram_url		2026-10-05 09:16:19.634172+00
notification_email	Goayachtworld@gmail.com	2026-10-05 09:16:19.667128+00
phone	+918446225985	2026-10-05 09:16:19.699478+00
show_live_video_button	true	2026-10-05 09:16:19.730907+00
show_reel_button	true	2026-10-05 09:16:19.762238+00
whatsapp_number	8446225985	2026-10-05 09:16:19.792062+00
why_features	[{"icon":"shield","title":"Trusted & Licensed","description":"All our yachts are fully insured, certified, and operated by licensed professionals."},{"icon":"anchor","title":"Premium Fleet","description":"From sport cruisers to luxury flybridge yachts — curated for every occasion."},{"icon":"star","title":"5-Star Experience","description":"From booking to boarding, every detail is handled with care and precision."},{"icon":"zap","title":"Instant Confirmation","description":"Flexible packages, transparent pricing, and same-day confirmation."}]	2026-10-05 09:16:19.830544+00
youtube_url		2026-10-05 09:16:19.861515+00

\.

COPY "yacht_amenities" FROM stdin;
1	majesty-66	Drone Videography	Professional aerial drone footage of your experience on the water — perfect for reels and memories.	🚁	t	1	2026-09-16 04:31:12.621549+00
6	fairline-targa	Drone Videography	Professional aerial drone footage of your experience on the water.	🚁	t	1	2026-09-16 04:31:12.621549+00
7	fairline-targa	DSLR Photography	A professional photographer capturing your most memorable moments.	📷	f	2	2026-09-16 04:31:12.621549+00
10	fairline-targa	Fishing Activity	Fishing rods and bait provided with a guided fishing session.	🎣	f	5	2026-09-16 04:31:12.621549+00
11	sea-ray-330	Drone Videography	Professional aerial drone footage of your trip.	🚁	f	1	2026-09-16 04:31:12.621549+00
13	sea-ray-330	Live DJ	DJ on deck for a lively atmosphere.	🎧	f	3	2026-09-16 04:31:12.621549+00
14	sea-ray-330	Yacht Decoration	Personalized decorations for your special occasion.	🎀	f	4	2026-09-16 04:31:12.621549+00
15	sea-ray-330	Fishing Activity	Fishing rods and bait with a guided session.	🎣	t	5	2026-09-16 04:31:12.621549+00
2	majesty-66	DSLR Photography	A professional photographer on board capturing candid and posed shots throughout your trip.	📷	f	2	2026-09-16 04:31:12.621549+00
4	majesty-66	Yacht Decoration	Floral arrangements, balloon setups, and themed decoration tailored to your occasion.	🎀	f	4	2026-09-16 04:31:12.621549+00
5	majesty-66	Fishing Activity	Fishing rods and bait provided. Try your luck on the open waters with a guided fishing session.	🎣	f	5	2026-09-16 04:31:12.621549+00
12	sea-ray-330	DSLR Photography	Professional photographer capturing your memories.	📷	f	2	2026-09-16 04:31:12.621549+00
3	majesty-66	Live DJ	A live DJ on deck keeping the vibe going with your preferred music playlist.	🎧	f	3	2026-09-16 04:31:12.621549+00
8	fairline-targa	Live DJ	Live DJ on deck keeping the vibe going with your preferred music.	🎧	f	3	2026-09-16 04:31:12.621549+00
9	fairline-targa	Yacht Decoration	Custom decorations for birthdays, anniversaries, and proposals.	🎀	f	4	2026-09-16 04:31:12.621549+00

\.

COPY "yachts_master" FROM stdin;
fairline-targa	Fairline Targa 43	The Fairline Targa 43 combines speed with sophistication. Ideal for intimate groups and sunset cruises, it features a sleek profile and comfortable open cockpit.	The Fairline Targa 43 is the perfect balance of performance and luxury. Its sleek lines cut through the water effortlessly, while the spacious cockpit ensures your guests are always comfortable.	Performance Cruiser	12	1–4 Hours	35000	60000	0	https://images.unsplash.com/photo-1605281317010-fe5ffe798156?q=80&w=2044&auto=format&fit=crop	["https://images.unsplash.com/photo-1605281317010-fe5ffe798156?q=80&w=2044&auto=format&fit=crop", "https://images.unsplash.com/photo-1540946484620-20ef24484177?q=80&w=2070&auto=format&fit=crop"]	["Experienced Captain", "Chilled Water Bottles", "Bluetooth Music System", "Sunbathing Deck Access", "Life Jackets for All Guests"]	["Catering & Food", "Alcoholic Beverages", "Decoration (available as add-on)", "Photography (available as add-on)"]	["Couples", "Small Families", "Anniversaries"]	Free DJ			t	2	2026-09-25 17:43:51.171051+00
sea-ray-330	Sea Ray 330	Compact yet luxurious, the Sea Ray 330 is perfect for quick getaways and private proposals. Enjoy the breeze and beautiful Goa waters on this agile sport cruiser.	The Sea Ray 330 is the most intimate yacht in our fleet, ideal for proposals and romantic escapes.	Sport Cruiser	8	1–2 Hours	25000	42000	0	https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?q=80&w=2069&auto=format&fit=crop	["https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?q=80&w=2069&auto=format&fit=crop", "https://images.unsplash.com/photo-1563299446-24e050986753?q=80&w=2070&auto=format&fit=crop"]	["Experienced Captain", "Chilled Water Bottles", "Bluetooth Music System", "Life Jackets for All Guests", "Ice Box"]	["Catering & Food", "Alcoholic Beverages", "Decoration (available as add-on)", "Photography (available as add-on)"]	["Proposals", "Friends", "Small Groups"]				t	3	2026-09-25 17:43:51.171051+00
princess-v39	Princess V39	The Princess V39 is a sleek cabin cruiser that blends sport and luxury. Ideal for small groups seeking a private and intimate experience on Goa's stunning coastline.	With elegant lines and powerful performance, the Princess V39 is perfect for those who want a truly private experience without compromising on comfort.	Luxury Cabin Cruiser	6	1–3 Hours	20000	34000	0	https://images.unsplash.com/photo-1605281317010-fe5ffe798156?q=80&w=2044&auto=format&fit=crop	["https://images.unsplash.com/photo-1605281317010-fe5ffe798156?q=80&w=2044&auto=format&fit=crop", "https://images.unsplash.com/photo-1563299446-24e050986753?q=80&w=2070&auto=format&fit=crop"]	["Experienced Captain", "Chilled Water & Soft Drinks", "Bluetooth Music System", "Life Jackets for All Guests", "Sunbathing Deck"]	["Catering & Food", "Alcoholic Beverages", "Decoration (available as add-on)", "Photography (available as add-on)"]	["Small Families", "Couples", "Friends"]	Free Beer			t	4	2026-09-25 17:43:51.171051+00
azimut-55	Azimut 55	The Azimut 55 is a masterpiece of Italian design — spacious, powerful, and refined. With a full flybridge and generous outdoor deck, it is built for memorable group experiences.	The Azimut 55 combines Italian elegance with powerful sea performance. Its flybridge offers 360° panoramic views, making it the ultimate platform for celebrations.	Flybridge Yacht	16	2–5 Hours	55000	95000	0	https://images.unsplash.com/photo-1621275079535-dd5df048427b?q=80&w=1935&auto=format&fit=crop	["https://images.unsplash.com/photo-1621275079535-dd5df048427b?q=80&w=1935&auto=format&fit=crop", "https://images.unsplash.com/photo-1569263979104-865ab7cd8d13?q=80&w=1974&auto=format&fit=crop"]	["Professional Captain & Crew", "Chilled Water & Soft Drinks", "Premium Sound System", "Life Jackets for All Guests", "Flybridge Access"]	["Catering & Food", "Alcoholic Beverages", "Decoration (available as add-on)", "DJ (available as add-on)"]	["Corporate", "Large Groups", "Parties"]	Free Decoration			t	5	2026-09-25 17:43:51.171051+00
sunseeker-predator	Sunseeker Predator 50	The Sunseeker Predator 50 is the definition of performance luxury. Its aggressive styling, powerful engines, and superbly finished interior make it a head-turner on the water.	If you want speed, style, and excitement combined with luxury, the Sunseeker Predator 50 is your ideal choice for an adrenaline-filled ride along Goa's coast.	Sport Motor Yacht	10	1–4 Hours	30000	52000	0	https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?q=80&w=2069&auto=format&fit=crop	["https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?q=80&w=2069&auto=format&fit=crop", "https://images.unsplash.com/photo-1567899378494-47b22a2ae96a?q=80&w=2070&auto=format&fit=crop"]	["Experienced Captain", "Chilled Water & Soft Drinks", "Bluetooth Music System", "Life Jackets for All Guests", "Open Cockpit Seating"]	["Catering & Food", "Alcoholic Beverages", "Decoration (available as add-on)", "Photography (available as add-on)"]	["Friends", "Thrill Seekers", "Groups"]				t	6	2026-09-25 17:43:51.171051+00
majesty-66	Majesty 66 	Experience ultimate luxury on the Majesty 66. This premium yacht offers spacious decks, a flybridge with panoramic views, and elegant interiors perfect for high-end celebrations.	The Majesty 66 stands out for its sheer scale and sophistication. With a fully equipped flybridge, panoramic sea views, and a professional crew, it transforms any occasion into an extraordinary event.	Luxury Motor Yacht	28	2Hrs	45000	75000	25000	https://images.unsplash.com/photo-1567899378494-47b22a2ae96a?q=80&w=2070&auto=format&fit=crop	["https://images.unsplash.com/photo-1567899378494-47b22a2ae96a?q=80&w=2070&auto=format&fit=crop", "https://images.unsplash.com/photo-1569263979104-865ab7cd8d13?q=80&w=1974&auto=format&fit=crop", "https://images.unsplash.com/photo-1621275079535-dd5df048427b?q=80&w=1935&auto=format&fit=crop"]	["Experienced Captain & Crew", "Chilled Water Bottles", "Bluetooth Music System", "Life Jackets for All Guests", "Cleaning & Deck Setup", "Water bottles"]	["Catering & Food", "Alcoholic Beverages", "Decoration (available as add-on)", "Photography (available as add-on)"]	["Corporate", "Large Groups", "Birthdays", "Corporate Party"]	Free Drone	https://www.instagram.com/p/Dcfz7zKObg5/?hl=en	https://youtu.be/qZN6LQfrIyM?si=enaysVzHYM3o3FVr	t	1	2026-09-25 17:43:51.171051+00

\.

COPY "inquiries" FROM stdin;
1	Sunil kumar	9673244860	goayachtworld@gmail.com	2026-10-27	4	\N	\N		2026-10-26 05:18:16.472483+00	Sunset (4 PM – 7 PM)	4	1		\N	\N

\.

COPY "gallery" FROM stdin;
1	https://images.unsplash.com/photo-1464349095431-e9a21285b5f3?q=80&w=1973&auto=format&fit=crop	Birthday at sea 🎂	2026-09-10	Majesty 66	Birthday Party	t	0	2026-10-06 18:17:00.012645+00
2	https://images.unsplash.com/photo-1534313314376-a72289b6181e?q=80&w=1974&auto=format&fit=crop	Golden hour on the water 🌅	2026-09-14	Fairline Targa 43	Sunset Cruise	t	0	2026-10-06 18:17:00.012645+00
3	https://images.unsplash.com/photo-1516589174184-c68d8e5ffe5e?q=80&w=1974&auto=format&fit=crop	Romantic escape 💑	2026-09-18	Sea Ray 330	Couple Experience	t	0	2026-10-06 18:17:00.012645+00
4	https://images.unsplash.com/photo-1521737604893-d14cc237f11d?q=80&w=2084&auto=format&fit=crop	Corporate offsite on the waves 💼	2026-09-22	Azimut 55	Corporate Event	t	0	2026-10-06 18:17:00.012645+00
5	https://images.unsplash.com/photo-1569263979104-865ab7cd8d13?q=80&w=1974&auto=format&fit=crop	Proposal moment 💍	2026-09-25	Princess V39	Proposal	t	0	2026-10-06 18:17:00.012645+00
6	https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?q=80&w=2069&auto=format&fit=crop	Friends trip! 🎉	2026-09-28	Sunseeker Predator 50	Friends Outing	t	0	2026-10-06 18:17:00.012645+00
7	https://images.unsplash.com/photo-1567899378494-47b22a2ae96a?q=80&w=2070&auto=format&fit=crop	Anchored in paradise ⚓	2026-10-01	Majesty 66	Sunset Cruise	t	0	2026-10-06 18:17:00.012645+00
8	https://images.unsplash.com/photo-1563299446-24e050986753?q=80&w=2070&auto=format&fit=crop	Anniversary special ❤️	2026-10-03	Fairline Targa 43	Couple Experience	t	0	2026-10-06 18:17:00.012645+00

\.
