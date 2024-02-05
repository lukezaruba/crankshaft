-------------------------------------------------
--             Crankshaft v 0.10.0             --
-------------------------------------------------

CREATE SCHEMA IF NOT EXISTS crankshaft;

-------------------------------------------------

CREATE OR REPLACE FUNCTION crankshaft.Version()
RETURNS text AS $$
  SELECT '@VERSION';
$$ language 'sql' STABLE STRICT PARALLEL SAFE;

-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
