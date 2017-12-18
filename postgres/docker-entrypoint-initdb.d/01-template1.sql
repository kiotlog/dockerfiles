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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: conversions; Type: TABLE; Schema: public; Owner: kl_writers
--

CREATE TABLE conversions (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    fun text DEFAULT 'id'::text NOT NULL
);


ALTER TABLE conversions OWNER TO kl_writers;

--
-- Name: devices; Type: TABLE; Schema: public; Owner: kl_writers
--

CREATE TABLE devices (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    device text NOT NULL,
    meta jsonb DEFAULT '{}'::jsonb NOT NULL,
    auth jsonb DEFAULT '{}'::jsonb NOT NULL,
    frame jsonb DEFAULT '{"bigendian": true, "bitfields": false}'::jsonb NOT NULL
);


ALTER TABLE devices OWNER TO kl_writers;

--
-- Name: points; Type: TABLE; Schema: public; Owner: kl_writers
--

CREATE TABLE points (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    device_id uuid NOT NULL,
    "time" timestamp with time zone DEFAULT now() NOT NULL,
    flags jsonb DEFAULT '{}'::jsonb NOT NULL,
    data jsonb DEFAULT '{}'::jsonb NOT NULL
);


ALTER TABLE points OWNER TO kl_writers;

--
-- Name: sensor_types; Type: TABLE; Schema: public; Owner: kl_writers
--

CREATE TABLE sensor_types (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text DEFAULT 'generic'::text NOT NULL,
    meta jsonb DEFAULT '{}'::jsonb,
    type text DEFAULT 'generic'::text NOT NULL
);


ALTER TABLE sensor_types OWNER TO kl_writers;

--
-- Name: sensors; Type: TABLE; Schema: public; Owner: kl_writers
--

CREATE TABLE sensors (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    meta jsonb DEFAULT '{}'::jsonb NOT NULL,
    fmt jsonb DEFAULT '{}'::jsonb NOT NULL,
    conversion_id uuid,
    sensor_type_id uuid,
    device_id uuid NOT NULL
);


ALTER TABLE sensors OWNER TO kl_writers;

--
-- Name: conversions convertions_pkey; Type: CONSTRAINT; Schema: public; Owner: kl_writers
--

ALTER TABLE ONLY conversions
    ADD CONSTRAINT convertions_pkey PRIMARY KEY (id);


--
-- Name: devices devices_device_key; Type: CONSTRAINT; Schema: public; Owner: kl_writers
--

ALTER TABLE ONLY devices
    ADD CONSTRAINT devices_device_key UNIQUE (device);


--
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: kl_writers
--

ALTER TABLE ONLY devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- Name: points points_pkey; Type: CONSTRAINT; Schema: public; Owner: kl_writers
--

ALTER TABLE ONLY points
    ADD CONSTRAINT points_pkey PRIMARY KEY (id);


--
-- Name: sensor_types sensor_types_name_key; Type: CONSTRAINT; Schema: public; Owner: kl_writers
--

ALTER TABLE ONLY sensor_types
    ADD CONSTRAINT sensor_types_name_key UNIQUE (name);


--
-- Name: sensor_types sensor_types_pkey; Type: CONSTRAINT; Schema: public; Owner: kl_writers
--

ALTER TABLE ONLY sensor_types
    ADD CONSTRAINT sensor_types_pkey PRIMARY KEY (id);


--
-- Name: sensors sensors_pkey; Type: CONSTRAINT; Schema: public; Owner: kl_writers
--

ALTER TABLE ONLY sensors
    ADD CONSTRAINT sensors_pkey PRIMARY KEY (id);


--
-- Name: points points_device_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kl_writers
--

ALTER TABLE ONLY points
    ADD CONSTRAINT points_device_fkey FOREIGN KEY (device_id) REFERENCES devices(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: sensors sensors_conversion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kl_writers
--

ALTER TABLE ONLY sensors
    ADD CONSTRAINT sensors_conversion_fkey FOREIGN KEY (conversion_id) REFERENCES conversions(id) ON UPDATE CASCADE ON DELETE SET DEFAULT;


--
-- Name: sensors sensors_device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kl_writers
--

ALTER TABLE ONLY sensors
    ADD CONSTRAINT sensors_device_id_fkey FOREIGN KEY (device_id) REFERENCES devices(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: sensors sensors_sensor_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kl_writers
--

ALTER TABLE ONLY sensors
    ADD CONSTRAINT sensors_sensor_type_fkey FOREIGN KEY (sensor_type_id) REFERENCES sensor_types(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: conversions; Type: ACL; Schema: public; Owner: kl_writers
--

GRANT SELECT ON TABLE conversions TO kl_readers;


--
-- Name: devices; Type: ACL; Schema: public; Owner: kl_writers
--

GRANT SELECT ON TABLE devices TO kl_readers;


--
-- Name: points; Type: ACL; Schema: public; Owner: kl_writers
--

GRANT ALL ON TABLE points TO kl_writers;
GRANT SELECT ON TABLE points TO kl_readers;


--
-- Name: sensor_types; Type: ACL; Schema: public; Owner: kl_writers
--

GRANT SELECT ON TABLE sensor_types TO kl_readers;


--
-- Name: sensors; Type: ACL; Schema: public; Owner: kl_writers
--

GRANT SELECT ON TABLE sensors TO kl_readers;


--
-- PostgreSQL database dump complete
--

