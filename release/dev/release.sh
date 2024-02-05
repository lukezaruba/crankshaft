#!/bin/bash

wd=$(pwd)


# Combining SQL functions to single file
touch release/crankshaft--0.10.0.sql
cd src/pg/sql
cat *.sql > ../../../release/crankshaft--0.10.0.sql

sed -i '' 's/@VERSION/0.10.0/g' ../../../release/crankshaft--0.10.0.sql
sed -i '' "s|@ENV|$envPython|g" ../../../release/crankshaft--0.10.0.sql

cd ../../..