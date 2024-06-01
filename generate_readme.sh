#!/bin/bash

# Check if directory name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <directory_name>"
  exit 1
fi

# Create README.md
cat <<EOL > $1/README.md
# DnD Adventure Journal

## Overview
Welcome to the ongoing adventures of Cindor, the Fire Genasi Eldritch Knight. This repository is divided into three main sections:
- **Journal:** Chronicles of Cindor's adventures.
- **Technical Files:** Detailed records of the game state.
- **Adventure Narrative:** The structured narrative of the ongoing campaign.

## Journal
Each session is documented as a new chapter in the journal. The journal entries include summaries, important events, and images from the sessions.

## Technical Files
This section holds structured data about Cindor's character sheet, experiences, locations, people, and missions.

## How to Use
1. **Setting Up a New Adventure:**
   - Clone the repository.
   - Run the setup script to initialize the file structure.
   \`\`\`bash
   bash setup_structure.sh <directory_name>
   \`\`\`

2. **Updating the Journal:**
   - After each session, create a new markdown file in the \`journal\` directory.
   - Add a summary of the session, include generated images, and note the experience gained.

3. **Updating Technical Files:**
   - Use the provided bash scripts to update the YAML files with new experiences, locations, people, and missions.

## Adventure Narrative
The narrative of the campaign, titled "The Lost Forge of the Spellsmith," is detailed below. This section captures the essence of the adventure, its key scenes, and the characters involved.

### Act 1: Rumors and Preparation
...
EOL

echo "README.md generated successfully."
