--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.13
-- Dumped by pg_dump version 9.6.13

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
-- Data for Name: users; Type: TABLE DATA;
--

INSERT INTO public.users (id, created_at, updated_at, email, password, onboarding_state, deleted_at, activated, days_online, user_avatar) VALUES ('b16a0c48-77e1-492e-8c1a-a357848edde1', '2019-10-07 03:13:17.01177+00', '2019-10-07 03:13:17.01177+00', 'admin1@ancarrier.com', '$2a$12$ru4Yd7lU0p6eBKMlGl7HSeMl7CRSNDjWiA9IUkBCVqgajB0yjS1DW', '', '2019-10-07 03:13:17.01177+00', TRUE, 100, '');
INSERT INTO public.users (id, created_at, updated_at, email, password, onboarding_state, deleted_at, activated, days_online, user_avatar) VALUES ('13286188-e618-4e76-b2af-d64b0fef06fc', '2019-10-07 03:18:08.89563+00', '2019-10-07 03:18:08.89563+00', 'user1@ancarrier.com', '$2a$12$ZxyfblvO4exvI.XffdjlS.CCz7ruTUHlryE6ODUHxolPWDfKPPZku', '', NULL, TRUE, 200, '');
INSERT INTO public.users (id, created_at, updated_at, email, password, onboarding_state, deleted_at, activated, days_online, user_avatar) VALUES ('8622620f-9d85-4106-87dc-17abdc26e77e', '2019-10-10 01:19:08.992745+00', '2019-10-10 01:19:08.992745+00', 'driver@ancarrier.com', '$2a$12$9bIptXJiKM/AXTMOHspK9OXL8HYPdOJyzj/oGPNbGmQJgZP9jENxm', '', NULL, TRUE, 300, '');
INSERT INTO public.users (id, created_at, updated_at, email, password, onboarding_state, deleted_at, activated, days_online, user_avatar) VALUES ('00000000-0000-0000-0000-000000000002', '2019-10-07 01:38:44.189809+00', '2019-10-28 20:22:15.940933+00', 'john.h@bdcarrier.com', '$2a$10$m7NgUXWaENZ8dY7j5c6jh.fhEhRWHbhuCb0Gaq0BXfr3J0Tu59x36', '', NULL, FALSE, 0, '');
INSERT INTO public.users (id, created_at, updated_at, email, password, onboarding_state, deleted_at, activated, days_online, user_avatar) VALUES ('00000000-0000-0000-0000-000000000003', '2019-10-07 01:38:44.189809+00', '2019-10-28 20:22:15.940933+00', 'lynda.g@bdcarrier.com', '$2a$12$CApHMRtLroIP1aWo4VKSTOvMMlkyrAIL8KqRSG0sdK07G7LYHxw.e', '', NULL, FALSE, 0, '');
INSERT INTO public.users (id, created_at, updated_at, email, password, onboarding_state, deleted_at, activated, days_online, user_avatar) VALUES ('00000000-0000-0000-0000-000000000001', '2019-10-07 01:38:44.189809+00', '2019-10-28 20:22:15.940933+00', 'peter.k@bdcarrier.com', '$2a$10$RpiNQzGCh5CfSMO/qYmEAu3zZ7RLJn4b3Nr5FWiEp4QDsECMGh62K', '', NULL, FALSE, 0, '');


--
-- PostgreSQL database dump complete
--
