#!/bin/bash

# Check if character sheet YAML file is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <character_sheet.yaml>"
  exit 1
fi

# Load the provided character sheet YAML file
CHARACTER_SHEET=$1

# Ensure yq is installed
if ! command -v yq &> /dev/null; then
  echo "yq could not be found. Please install yq to use this script."
  exit 1
fi

# Update the character sheet in the technical directory
yq e '.' $CHARACTER_SHEET > technical/character_sheet.yaml

echo "Character sheet updated successfully."
