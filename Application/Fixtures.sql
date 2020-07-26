

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


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.ideas DISABLE TRIGGER ALL;

INSERT INTO public.ideas (id, title, explanation, created_at, votes) VALUES ('90be17e4-79af-45b7-ae51-f0c40417b53a', 'Phasellus non leo commodo, condimentum tortor a, commodo mi.', '', '2020-07-26 14:15:25.048374+02', 17);
INSERT INTO public.ideas (id, title, explanation, created_at, votes) VALUES ('3365be62-d9b7-4c62-ac37-f0af04e34b5d', 'Praesent bibendum arcu eget interdum interdum.', '', '2020-07-26 14:15:28.9382+02', 5);
INSERT INTO public.ideas (id, title, explanation, created_at, votes) VALUES ('681ca02a-d62a-47ae-af07-d4f10213f2c3', 'Lorem ipsum', '', '2020-07-26 14:15:18.551666+02', -5);


ALTER TABLE public.ideas ENABLE TRIGGER ALL;


ALTER TABLE public.users DISABLE TRIGGER ALL;



ALTER TABLE public.users ENABLE TRIGGER ALL;


