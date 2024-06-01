#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ] || [ -z "$4" ]; then
  echo "Usage: $0 <session_number> <encounter_description> <experience_points> <loot>"
  exit 1
fi

SESSION=$1
ENCOUNTER=$2
EXPERIENCE=$3
LOOT=$4

yq e ".sessions += [{\"session\": $SESSION, \"encounter\": \"$ENCOUNTER\", \"experience\": $EXPERIENCE, \"loot\": [$(echo $LOOT | sed 's/, /", "/g')]}]" -i technical/experiences.yaml
