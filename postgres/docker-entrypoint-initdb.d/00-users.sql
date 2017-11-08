-- Writers

CREATE ROLE kl_writers WITH
  NOLOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

CREATE USER kl_decoder WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION
  PASSWORD 'KlD3c0d3r';

GRANT kl_writers TO kl_decoder;

CREATE USER kl_nodered WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION
  PASSWORD 'KlN0d3r3d';

GRANT kl_writers TO kl_nodered;

-- Readers

CREATE ROLE kl_readers WITH
  NOLOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

CREATE USER kl_grafana WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION
  PASSWORD 'KlGr4f4n4';

GRANT kl_readers TO kl_grafana;