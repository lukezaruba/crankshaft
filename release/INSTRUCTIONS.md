# Crankshaft Installation

Notes: Using PostgreSQL 15 on MacOS

1. Using Stack Builder, Install the Language Pack & PostGIS
2. In PostgreSQL, run the following commands: `CREATE EXTENSION plpython3u;` and `CREATE EXTENSION postgis;`
3. Copy the `config.json` and `install.sh` scripts from the GitHub repo locally into the same directory
4. Change any necessary parameters in the `config.json` (NOTE: Do not change the ordering of the lines!)
5. In Bash/Zsh, from the same directory where `config.json` and `install.sh` are saved, run `source install.sh`
6. Enter in any passwords necessary to run sudo commands and access your database
7. Open up PGAdmin (or any other tool, e.g., DBeaver) and navigate to the database where you installed Crankshaft and look for a schema called "crankshaft" - there should be several new functions located in that schema, ready for use!
