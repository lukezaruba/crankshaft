#!/bin/bash

wd=$(pwd)

# Combining SQL functions to single file
touch release/crankshaft.sql
cd src/pg/sql
cat *.sql > ../../../release/crankshaft.sql

cd ../../..