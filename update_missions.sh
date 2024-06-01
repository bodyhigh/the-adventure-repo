#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ] || [ -z "$4" ]; then
  echo "Usage: $0 <mission_type> <mission_description> <status> <objectives>"
  exit 1
fi

TYPE=$1
DESCRIPTION=$2
STATUS=$3
OBJECTIVES=$4

yq e ".${TYPE} += [{\"mission\": \"$DESCRIPTION\", \"status\": \"$STATUS\", \"objectives\": [$(echo $OBJECTIVES | sed 's/, /", "/g')]}]" -i technical/missions.yaml
