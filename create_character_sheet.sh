#!/bin/bash

# Create character sheet
cat <<EOL > $1/technical/character_sheet.yaml
character:
  name: "Cindor"
  class: "Fighter (Eldritch Knight)"
  level: 2
  race: "Fire Genasi"
  background: "Guild Artisan (Smith)"
  alignment: "Neutral Good"
  
  abilityScores:
    strength: 18
    dexterity: 12
    constitution: 16
    intelligence: 15
    wisdom: 12
    charisma: 13
  
  modifiers:
    strength: 4
    dexterity: 1
    constitution: 3
    intelligence: 2
    wisdom: 1
    charisma: 1
  
  savingThrows:
    strength: 6
    dexterity: 1
    constitution: 5
    intelligence: 4
    wisdom: 1
    charisma: 1
  
  skills:
    acrobatics: 1
    animalHandling: 1
    arcana: 4
    athletics: 6
    deception: 1
    history: 2
    insight: 1
    intimidation: 1
    investigation: 4
    medicine: 1
    nature: 2
    perception: 1
    performance: 1
    persuasion: 1
    religion: 2
    sleightOfHand: 1
    stealth: 1
    survival: 1

  combat:
    proficiencyBonus: 2
    hitPoints: 25
    armorClass: 18
    initiative: 1
    speed: 30
    attacksAndSpellcasting:
      - name: "Elemental Blade of Prometheus"
        attackBonus: 6
        damage: "1d8+4 slashing"
      - name: "Fire Bolt"
        attackBonus: 4
        damage: "1d10 fire"
  
  features:
    race:
      - "Darkvision (60 feet)"
      - "Fire Resistance"
      - "Reach to the Blaze (Produce Flame cantrip, Constitution as spellcasting ability)"
    class:
      - "Fighting Style: Defense"
      - "Second Wind"
      - "Action Surge (1 use)"
    background:
      - "Guild Membership"
  
  spellcasting:
    spellcastingAbility: "Intelligence"
    spellSaveDC: 12
    spellAttackBonus: 4
    cantrips:
      - "Fire Bolt"
      - "Mage Hand"
    spellSlots:
      1st: 2
      2nd: 0
      3rd: 0
      4th: 0
    knownSpells:
      - "Shield"
      - "Burning Hands"
      - "Magic Missile"
    availableSpells:
      1stLevel:
        - name: "Absorb Elements"
          chosen: false
        - name: "Burning Hands"
          chosen: true
        - name: "Charm Person"
          chosen: false
        - name: "Chromatic Orb"
          chosen: false
        - name: "Color Spray"
          chosen: false
        - name: "Detect Magic"
          chosen: false
        - name: "Disguise Self"
          chosen: false
        - name: "Expeditious Retreat"
          chosen: false
        - name: "False Life"
          chosen: false
        - name: "Feather Fall"
          chosen: false
        -Here's the refactored `setup_structure.sh` script and the separated `create_character_sheet.sh` script for better manageability.

### Updated `setup_structure.sh`

```bash
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
