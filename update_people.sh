#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ] || [ -z "$4" ]; then
  echo "Usage: $0 <person_name> <relationship> <session_number> <details>"
  exit 1
fi

PERSON=$1
RELATIONSHIP=$2
SESSION=$3
DETAILS=$4

yq e ".people += [{\"name\": \"$PERSON\", \"relationship\": \"$RELATIONSHIP\", \"events\": [{\"session\": $SESSION, \"details\": \"$DETAILS\"}]}]" -i technical/people.yaml
