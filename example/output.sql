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

INSERT INTO public.users (id, created_at, updated_at, email, password, onboarding_state, deleted_at, activated, days_online, user_avatar) VALUES ('b16a0c48-77e1-492e-8c1a-a357848edde1', '2019-10-07 03:13:17.01177+00', '2019-10-07 03:13:17.01177+00', Lucile_Gleichner@gmail.com, '$2a$12$ru4Yd7lU0p6eBKMlGl7HSeMl7CRSNDjWiA9IUkBCVqgajB0yjS1DW', '', '2019-10-07 03:13:17.01177+00', true, 59601, 'https://s3.amazonaws.com/uifaces/faces/twitter/nessoila/128.jpg')
INSERT INTO public.users (id, created_at, updated_at, email, password, onboarding_state, deleted_at, activated, days_online, user_avatar) VALUES ('13286188-e618-4e76-b2af-d64b0fef06fc', '2019-10-07 03:18:08.89563+00', '2019-10-07 03:18:08.89563+00', Favian_Crooks6@yahoo.com, '$2a$12$ZxyfblvO4exvI.XffdjlS.CCz7ruTUHlryE6ODUHxolPWDfKPPZku', '', NULL, true, 77615, 'https://s3.amazonaws.com/uifaces/faces/twitter/buryaknick/128.jpg')
INSERT INTO public.users (id, created_at, updated_at, email, password, onboarding_state, deleted_at, activated, days_online, user_avatar) VALUES ('8622620f-9d85-4106-87dc-17abdc26e77e', '2019-10-10 01:19:08.992745+00', '2019-10-10 01:19:08.992745+00', Isabella_Boyle@yahoo.com, '$2a$12$9bIptXJiKM/AXTMOHspK9OXL8HYPdOJyzj/oGPNbGmQJgZP9jENxm', '', NULL, true, 23815, 'https://s3.amazonaws.com/uifaces/faces/twitter/ahmadajmi/128.jpg')
INSERT INTO public.users (id, created_at, updated_at, email, password, onboarding_state, deleted_at, activated, days_online, user_avatar) VALUES ('00000000-0000-0000-0000-000000000002', '2019-10-07 01:38:44.189809+00', '2019-10-28 20:22:15.940933+00', Eriberto_Skiles54@yahoo.com, '$2a$10$m7NgUXWaENZ8dY7j5c6jh.fhEhRWHbhuCb0Gaq0BXfr3J0Tu59x36', '', NULL, true, 27228, 'https://s3.amazonaws.com/uifaces/faces/twitter/maximseshuk/128.jpg')
INSERT INTO public.users (id, created_at, updated_at, email, password, onboarding_state, deleted_at, activated, days_online, user_avatar) VALUES ('00000000-0000-0000-0000-000000000003', '2019-10-07 01:38:44.189809+00', '2019-10-28 20:22:15.940933+00', Retha.Lynch@gmail.com, '$2a$12$CApHMRtLroIP1aWo4VKSTOvMMlkyrAIL8KqRSG0sdK07G7LYHxw.e', '', NULL, true, 48567, 'https://s3.amazonaws.com/uifaces/faces/twitter/d_kobelyatsky/128.jpg')
INSERT INTO public.users (id, created_at, updated_at, email, password, onboarding_state, deleted_at, activated, days_online, user_avatar) VALUES ('00000000-0000-0000-0000-000000000001', '2019-10-07 01:38:44.189809+00', '2019-10-28 20:22:15.940933+00', Roslyn80@hotmail.com, '$2a$10$RpiNQzGCh5CfSMO/qYmEAu3zZ7RLJn4b3Nr5FWiEp4QDsECMGh62K', '', NULL, true, 29995, 'https://s3.amazonaws.com/uifaces/faces/twitter/bryan_topham/128.jpg')


--
-- PostgreSQL database dump complete
--
