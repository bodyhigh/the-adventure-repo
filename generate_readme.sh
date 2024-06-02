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
    \`\`\`
    Please rehydrate our ongoing DnD adventure by scanning the repository using the \`manifest.yaml\` file to extract the current state. Follow these steps:
    a. **Read the Latest Journal Entry**:
        - Scan the directory listed under \`journal_directory\` in \`manifest.yaml\` for the latest markdown file to understand the most recent events.
    b. **Update Character Sheet**:
        - Read the file listed under \`character_sheet\` in \`manifest.yaml\` to get the current character stats and details.
    c. **Update Technical Files**:
        - Read the files listed under \`experiences\`, \`locations\`, \`people\`, and \`missions\` in \`manifest.yaml\` to understand the current state of the adventure.
        - Refer to the \`manifest.yaml\` file for schema hints and formatting guidelines.

    Thank you!
    \`\`\`

3. **End of Session Tasks**
    \`\`\`
    Please generate the end-of-session updates based on the following information:
    
    a. **Journal Entry**:
       - **Session Title:** [Insert Session Title Here]
       - **Overview:** [Provide a detailed summary of the session.]
       - **Journey Log:** [Detailed account of the adventures and experiences.]
       - **Notable Events:** [List key events]
       - **Learnings and Reflections:** [Provide insights and reflections.]
       - **Next Steps:** [Outline plans and objectives.]
       - **Experience Gained:** Total experience points earned: [Insert Experience Points Here]
       - **Images:** [Describe images to be included]
    
    b. **Character Sheet Update**:
       - **Character Information:** [Provide updated character details]
    
    c. **Technical Files Update**:
       - **Experiences:** [Provide new experiences in the format: { "session_id": X, "date": "YYYY-MM-DD", "title": "Title", "description": "Description", "events": ["Event1", "Event2"] }]
       - **Locations:** [Provide new locations in the format: { "name": "Location Name", "description": "Description" }]
       - **People:** [Provide new people met in the format: { "name": "Person Name", "description": "Description" }]
       - **Missions:** [Provide updates on missions in the format: { "short_term": [{ "mission": "Mission Name", "status": "Status", "objectives": ["Objective1", "Objective2"] }], "long_term": [{ "mission": "Mission Name", "status": "Status", "objectives": ["Objective1", "Objective2"] }] }]
       - Refer to the \`manifest.yaml\` file for schema hints and formatting guidelines.
    
    Thank you!
    \`\`\`

    Please generate a bash script that performs the following tasks:
    - Creates a markdown file in the \`/journal\` folder with the filename format \`Session_[timestamp].md\`.
    - Uses the content generated from the provided journal prompt.
    - Generates and saves the image files referenced in the journal in the \`/images\` folder, including any battle maps (rendered post-battle with fallen victims).

    Here is the journal prompt:
    \"""
    Please generate a personal, narrative-style journal entry for our DnD adventure from Cindor's perspective, and reflect the tone of the session. The entry should be in markdown format, with images, and include the following sections:

    1. **Session Title:** Catchy title based on the summary
    2. **Overview:** Detailed summary of the session
    3. **Journey Log:** Detailed account of the adventures and experiences
    4. **Notable Events:** List key events
    5. **Learnings and Reflections:** Insights and reflections
    6. **Next Steps:** Plans and objectives
    7. **Experience Gained:** Total experience points earned
    8. **Images:** Describe images to be included

    **Format:**
    \```markdown
    # [Catchy Title]

    ## Overview
    [Detailed summary]

    ## Journey Log
    Today was a day filled with both peril and discovery. As we ventured through [location], we encountered [describe notable encounters].

    ### Notable Events
    - **Event 1:** [Describe event]
    - **Event 2:** [Describe event]

    ### Learnings and Reflections
    Reflecting on the day's events, I realize [insights and reflections]. The challenges we faced have taught me [lessons learned].

    ### Next Steps
    With the new information and resources we've gathered, our next steps will be to [outline plans and objectives].

    ### Experience Gained
    Total experience points earned: [Insert Experience Points Here]

    ## Images
    Include the following images:
    - ![Description of Image 1](images/[session_title]_image1.png)
    - ![Description of Image 2](images/[session_title]_image2.png)
    \```
    \"""

## Adventure Narrative
The narrative of the campaign, titled "The Lost Forge of the Spellsmith," is detailed below. This adventure involves the quest to find an ancient forge of immense power, hidden within the ruins of an ancient city and guarded by a fanatical cult. The adventurers must gather knowledge and allies, face political tensions, navigate treacherous terrain, and overcome formidable foes to uncover the forge’s secrets.

For the full adventure details, see the [The Lost Forge of the Spellsmith README](./sample-adventures/the-lost-forge-of-the-spellsmith/README.md).

EOL

echo "README.md generated successfully."
