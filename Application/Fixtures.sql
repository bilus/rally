

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

ALTER TABLE public.users DISABLE TRIGGER ALL;

INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts) VALUES ('11a55bf0-2d0a-4b6c-a1c0-f99df97ab037', 'gyamtso@gmail.com', 'sha256|17|anaQmkP0CXDvZGCKIvbi1Q==|3wfseh7rKGjfp9mjWapaonbnaUP8ZiDCm7O2POvNGXQ=', NULL, 0);


ALTER TABLE public.users ENABLE TRIGGER ALL;


ALTER TABLE public.ideas DISABLE TRIGGER ALL;



ALTER TABLE public.ideas ENABLE TRIGGER ALL;


