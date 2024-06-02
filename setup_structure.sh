#!/bin/bash

# Check if directory name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <directory_name>"
  exit 1
fi

# Create main directories
mkdir -p $1/{journal,technical,images,persona,scripts,sample-adventures/the-lost-forge-of-the-spellsmith}

# Create initial technical files with clean setup
cat <<EOL > $1/technical/experiences.yaml
sessions: []
EOL

cat <<EOL > $1/technical/locations.yaml
locations: []
EOL

cat <<EOL > $1/technical/people.yaml
people: []
EOL

cat <<EOL > $1/technical/missions.yaml
short_term: []
long_term: []
EOL

# Create persona file
cat <<EOL > $1/persona/persona_file.yaml
name: DM Persona
style: Critical Role
tasks:
  - Track player progress
  - Assign experience after encounters
  - Notify on leveling up
  - Update character sheet and state files
  - Generate images with consistent styling
  - Incorporate session suggestions and feedback
EOL

# Add sample adventure README and image
cat <<EOL > $1/sample-adventures/the-lost-forge-of-the-spellsmith/README.md
# The Lost Forge of the Spellsmith
![The Lost Forge of the Spellsmith](cover.webp)

### Act 1: Rumors and Preparation
*Insert adventure details here...*
EOL

# Copy the cover image (assuming cover.webp is available in the same directory as this script)
cp cover.webp $1/sample-adventures/the-lost-forge-of-the-spellsmith/

# Copy update scripts to the scripts directory
cp update_experiences.sh $1/scripts/update_experiences.sh
cp update_locations.sh $1/scripts/update_locations.sh
cp update_people.sh $1/scripts/update_people.sh
cp update_missions.sh $1/scripts/update_missions.sh
cp update_character_sheet.sh $1/scripts/update_character_sheet.sh
cp generate_manifest.sh $1/scripts/generate_manifest.sh
cp create_character_sheet.sh $1/scripts/create_character_sheet.sh

# Make scripts executable
chmod +x $1/scripts/*.sh

# Generate README.md
./generate_readme.sh $1

# Generate manifest file
./generate_manifest.sh $1

# Create character sheet
./create_character_sheet.sh $1

echo "Setup completed and README.md generated successfully."
