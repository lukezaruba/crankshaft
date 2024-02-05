#!/bin/bash

wd=$(pwd)

# Get config JSON
config=$1;

# Read in config data
pgPython=$(sed "2q;d" release/config.json | sed 's/"pgPython": "//g' | sed 's/",//g' | sed 's/ //g')
envName=$(sed "3q;d" release/config.json | sed 's/"envName": "//g' | sed 's/",//g' | sed 's/ //g')
envLoc=$(sed "4q;d" release/config.json | sed 's/"envLoc": "//g' | sed 's/",//g' | sed 's/ //g')
sqlUser=$(sed "5q;d" release/config.json | sed 's/"sqlUser": "//g' | sed 's/",//g' | sed 's/ //g')
sqlDB=$(sed "6q;d" release/config.json | sed 's/"sqlDB": "//g' | sed 's/"//g' | sed 's/ //g')
envPython="$envLoc/$envName/lib/python3.10/site-packages"

# Setup Python env
cd $pgPython

sudo ./bin/python3.10 -m venv $envName

cd $envName

source bin/activate

sudo pip install "git+https://github.com/lukezaruba/crankshaft.git@dev#subdirectory=src/py/crankshaft"

deactivate

cd $wd

# Install Functions with psql
curl -o CRANKSHAFT.sql https://raw.githubusercontent.com/lukezaruba/crankshaft/dev/release/crankshaft--0.10.0.sql

psql -U $sqlUser -d $sqlDB -f CRANKSHAFT.sql

rm CRANKSHAFT.sql