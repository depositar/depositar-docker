#!/bin/bash

export PATH=$PATH:/srv/app/.local/bin

cd /srv/app/sample-data

ckanapi load organizations -I organizations.jsonl
ckanapi load datasets -I datasets.jsonl

ckanapi batch -I upload-files.jsonl --local-files
