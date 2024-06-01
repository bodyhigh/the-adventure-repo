#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
  echo "Usage: $0 <location_name> <description> <npcs>"
  exit 1
fi

LOCATION=$1
DESCRIPTION=$2
NPCS=$3

yq e ".locations += [{\"name\": \"$LOCATION\", \"description\": \"$DESCRIPTION\", \"npcs\": [$(echo $NPCS | sed 's/, /", "/g')], \"events\": []}]" -i technical/locations.yaml
