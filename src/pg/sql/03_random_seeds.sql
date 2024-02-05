-- Internal function.
-- Set the seeds of the RNGs (Random Number Generators)
-- used internally.
CREATE OR REPLACE FUNCTION
crankshaft._random_seeds (seed_value INTEGER) RETURNS VOID
AS $$
  from sys import path
  path.append('@ENV')
  from crankshaft import random_seeds
  random_seeds.set_random_seeds(seed_value)
$$ LANGUAGE plpython3u VOLATILE PARALLEL UNSAFE;

-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
