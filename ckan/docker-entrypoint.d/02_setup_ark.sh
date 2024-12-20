#!/bin/bash

# Create DB tables if not there
ckan -c $CKAN_INI ark initdb
