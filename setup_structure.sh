#!/bin/bash

# Check if directory name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <directory_name>"
  exit 1
fi

# Set up directory name
DIR=$1

# Check if the directory already exists to avoid recursion
if [ -d "$DIR" ]; then
  echo "Directory already exists. Exiting to avoid recursion."
  exit 1
fi

# Create main directories
mkdir -p $DIR/{journal,technical,images,persona,scripts,sample-adventures/the-lost-forge-of-the-spellsmith}

# Create initial technical files with clean setup
cat <<EOL > $DIR/technical/experiences.yaml
sessions: []
EOL

cat <<EOL > $DIR/technical/locations.yaml
locations: []
EOL

cat <<EOL > $DIR/technical/people.yaml
people: []
EOL

cat <<EOL > $DIR/technical/missions.yaml
short_term: []
long_term: []
EOL

# Create persona file
cat <<EOL > $DIR/persona/persona_file.yaml
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
cat <<EOL > $DIR/sample-adventures/the-lost-forge-of-the-spellsmith/README.md
# The Lost Forge of the Spellsmith
![The Lost Forge of the Spellsmith](cover.webp)

### Act 1: Rumors and Preparation
*Insert adventure details here...*
EOL

# Copy the cover image (assuming cover.webp is available in the same directory as this script)
cp cover.webp $DIR/sample-adventures/the-lost-forge-of-the-spellsmith/

# Copy update scripts to the scripts directory
cp update_experiences.sh $DIR/scripts/update_experiences.sh
cp update_locations.sh $DIR/scripts/update_locations.sh
cp update_people.sh $DIR/scripts/update_people.sh
cp update_missions.sh $DIR/scripts/update_missions.sh
cp update_character_sheet.sh $DIR/scripts/update_character_sheet.sh
cp generate_manifest.sh $DIR/scripts/generate_manifest.sh
cp create_character_sheet.sh $DIR/scripts/create_character_sheet.sh

# Make scripts executable
chmod +x $DIR/scripts/*.sh

# Generate README.md
bash $DIR/scripts/generate_readme.sh $DIR

# Generate manifest file
bash $DIR/scripts/generate_manifest.sh $DIR

# Create character sheet
bash $DIR/scripts/create_character_sheet.sh $DIR

echo "Setup completed and README.md generated successfully."
