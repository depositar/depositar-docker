#!/bin/bash

if [[ $CKAN__PLUGINS == *"datapackager"* ]]; then
   # Datapackager settings have been configured in the .env file
   # Set API token if necessary
   if [ -z "$CKANEXT__DATAPACKAGER__API_TOKEN" ] ; then
      echo "Set up ckanext.datapackager.api_token in the CKAN config file"
      ckan config-tool $CKAN_INI "ckanext.datapackager.api_token=$(ckan -c $CKAN_INI user token add ckan_admin datapackager | tail -n 1 | tr -d '\t')"
   fi
else
   echo "Not configuring Datapackager"
fi
