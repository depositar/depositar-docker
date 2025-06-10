#!/bin/bash

export PATH=$PATH:/srv/app/.local/bin

cd /srv/app/sample-data

ckan user add demo email=demo@localhost password=demo1234

ckanapi load organizations -I organizations.jsonl -u demo --upload-logo

ckanapi load datasets -I datasets.jsonl -u demo

ckanapi batch -I upload-files.jsonl --local-files
