

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

ALTER TABLE public.posts DISABLE TRIGGER ALL;

INSERT INTO public.posts (id, title, body, created_at, weight) VALUES ('4ef48ade-e7f0-4afb-b4d9-5d4d1f7b9b86', 'Hello World!', 'Lorem ipsum *dolor sit amet*, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam. **This is the IHP Blog Demo App**.

Lorem ipsum *dolor sit amet*, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam', '2020-06-07 14:10:04.340407+03', 0);
INSERT INTO public.posts (id, title, body, created_at, weight) VALUES ('bf9a4977-dea6-4e9c-97ef-649a723c4d56', 'Hi there, 2nd one', 'Very nice', '2021-10-21 21:21:30.669849+03', 1);
INSERT INTO public.posts (id, title, body, created_at, weight) VALUES ('a234ce3e-1a9a-4043-8627-c739a1f433a2', '3rd one', '123', '2021-10-21 21:21:35.605099+03', 2);


ALTER TABLE public.posts ENABLE TRIGGER ALL;


ALTER TABLE public.comments DISABLE TRIGGER ALL;

INSERT INTO public.comments (id, post_id, author, body, created_at) VALUES ('1de9007a-b690-4f2d-a76e-d08cc7d8e308', '4ef48ade-e7f0-4afb-b4d9-5d4d1f7b9b86', 'Marc', 'This is the first comment!', '2020-06-07 14:11:22.07897+03');
INSERT INTO public.comments (id, post_id, author, body, created_at) VALUES ('7386928d-a6fc-4f20-ada9-333c32345453', '4ef48ade-e7f0-4afb-b4d9-5d4d1f7b9b86', 'Marc', 'This is a second comment!', '2020-06-07 14:11:30.718887+03');


ALTER TABLE public.comments ENABLE TRIGGER ALL;


