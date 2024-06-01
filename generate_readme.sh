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
2. **Start of Session Tasks**
   - Find a strategy to prompt the AI to scan the repo in github to rehydrate our ongoing adventure where we left off
3. **End of Session Tasks**
    \`\`\`
    Please generate the end-of-session updates based on the following information:
    
    a. **Journal Entry**:
       - **Session Title:** [Insert Session Title Here]
       - **Overview:** [Provide a brief summary of the session.]
       - **Journey Log:** [Detailed account of the adventures and experiences.]
       - **Notable Events:** [List key events]
       - **Learnings and Reflections:** [Provide insights and reflections.]
       - **Next Steps:** [Outline plans and objectives.]
       - **Experience Gained:** Total experience points earned: [Insert Experience Points Here]
       - **Images:** [Describe images to be included]
    
    b. **Character Sheet Update**:
       - **Character Information:** [Provide updated character details]
    
    c. **Technical Files Update**:
       - **Experiences:** [Provide new experiences]
       - **Locations:** [Provide new locations]
       - **People:** [Provide new people met]
       - **Missions:** [Provide updates on missions]
    
    Thank you!
    \`\`\`

## Adventure Narrative
The narrative of the campaign, titled "The Lost Forge of the Spellsmith," is detailed below. This section captures the essence of the adventure, its key scenes, and the characters involved.

### Act 1: Rumors and Preparation

*Insert details of Act 1 here...*

### Act 2: Journey to the Ruins

*Insert details of Act 2 here...*

### Act 3: Infiltration and Discovery

*Insert details of Act 3 here...*

### Act 4: The Forge and the Showdown

*Insert details of Act 4 here...*

### Act 5: Legacy and Future Adventures

*Insert details of Act 5 here...*

EOL

echo "README.md generated successfully."
