--
-- PostgreSQL database dump
--

\connect template1

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: sensor_types; Type: TABLE DATA; Schema: public; Owner: kl_writers
--

COPY sensor_types (id, name, meta, type) FROM stdin;
2e9e5330-5bde-4f5b-9c1f-52c96d73a05e	DHT11_Temperature	{"max": 50, "min": 0}	temperature
d9508fcb-9061-41b6-a112-6849dd7c5739	DHT22_Humidity	{"max": 100, "min": 0}	humidity
8b4f41b0-48ef-4004-b30c-8560b52cd3b7	Generic	{}	generic
ae2f0f47-1e6d-4bbd-908b-d204857ba1bd	DHT22_Temperature	{"max": 125, "min": -40}	temperature
47cbfb77-d56a-4ade-b8b4-0860bdbfedd3	BME280_Temperature	{"max": 85, "min": -40}	temperature
af23a956-1622-441c-9e6d-509c96adc76c	BME280_Humidity	{"max": 100, "min": 0}	humidity
cd1f1dd1-8447-4372-a8c5-edb3f173346a	BME280_Pressure	{"max": 1100, "min": 300}	pressure
8c83e60b-dce2-4e8d-83b4-cbf633a31c6d	Generic_milliVolts	{}	voltage
6d2504fd-6a10-4295-aa9c-0b4d615941e2	DHT11_Humidity	{"max": 80, "min": 20}	humidity
f0548111-be7f-49db-a01c-ad8037d4a601	MKRFOX_Battery	{"max": 5000, "min": 0}	voltage
eab4c8d2-7d00-46f3-9492-92525bb3c67d	Generic_Temperature	{}	temperature
0cf155e9-f380-45ea-8392-b9fd6c589781	ATA8520_Temperature	{"max": 60, "min": -60}	temperature
\.

--
-- Data for Name: conversions; Type: TABLE DATA; Schema: public; Owner: kl_writers
--

COPY conversions (id, fun) FROM stdin;
0c57d818-f542-45ff-b710-eae777124aed	float_to_int16
a31dbdaa-1d56-4bc3-8ee6-facb2a9ada55	float_to_uint16
5b635746-c7aa-4604-8f8d-0066fe84a5a2	id
1fe37862-08d4-42a9-a74f-d890e36049ce	x10
6b398b67-9767-4c45-8ac1-d6f71424019a	x100
f8600146-8591-406f-bc0b-73d52ed5b7e0	x1000
e792ccb9-cef3-44a1-914d-b93b141e2f68	float_to_int8
d450ead7-92a5-4391-8bf8-9e7c45ceba80	float_to_uint8
\.


--
-- PostgreSQL database dump complete
--
