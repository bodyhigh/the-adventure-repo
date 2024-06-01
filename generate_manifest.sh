#!/bin/bash

# Check if directory name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <directory_name>"
  exit 1
fi

# Create manifest file
cat <<EOL > $1/manifest.yaml
manifest:
  journal_directory: "journal"
  character_sheet: "technical/character_sheet.yaml"
  experiences: "technical/experiences.yaml"
  locations: "technical/locations.yaml"
  people: "technical/people.yaml"
  missions: "technical/missions.yaml"
  images_directory: "images"
schemas:
  character_sheet:
    description: "Schema for character_sheet.yaml"
    format:
      character:
        name: "String"
        class: "String"
        level: "Integer"
        race: "String"
        background: "String"
        alignment: "String"
        abilityScores:
          strength: "Integer"
          dexterity: "Integer"
          constitution: "Integer"
          intelligence: "Integer"
          wisdom: "Integer"
          charisma: "Integer"
        modifiers:
          strength: "Integer"
          dexterity: "Integer"
          constitution: "Integer"
          intelligence: "Integer"
          wisdom: "Integer"
          charisma: "Integer"
        savingThrows:
          strength: "Integer"
          dexterity: "Integer"
          constitution: "Integer"
          intelligence: "Integer"
          wisdom: "Integer"
          charisma: "Integer"
        skills:
          acrobatics: "Integer"
          animalHandling: "Integer"
          arcana: "Integer"
          athletics: "Integer"
          deception: "Integer"
          history: "Integer"
          insight: "Integer"
          intimidation: "Integer"
          investigation: "Integer"
          medicine: "Integer"
          nature: "Integer"
          perception: "Integer"
          performance: "Integer"
          persuasion: "Integer"
          religion: "Integer"
          sleightOfHand: "Integer"
          stealth: "Integer"
          survival: "Integer"
        proficiencyBonus: "Integer"
        hitPoints: "Integer"
        armorClass: "Integer"
        initiative: "Integer"
        speed: "Integer"
        features:
          race: "List of Strings"
          class: "List of Strings"
          background: "List of Strings"
        spells:
          cantrips: "List of Strings"
          spellSlots:
            1st: "Integer"
            2nd: "Integer"
            3rd: "Integer"
            4th: "Integer"
        equipment:
          armor: "String"
          weapons: "List of Strings"
          shield: "String"
          adventuringGear: "List of Strings"
          magicalItems: "List of Strings"
          miscellaneousItems: "List of Strings"
          otherItems: "List of Strings"
        proficienciesAndLanguages:
          armor: "List of Strings"
          weapons: "List of Strings"
          tools: "List of Strings"
          languages: "List of Strings"
        spellcastingDetails:
          spellcastingAbility: "String"
          spellSaveDC: "Integer"
          spellAttackBonus: "Integer"
  experiences:
    description: "Schema for experiences.yaml"
    format:
      sessions:
        - session_id: "Integer"
          date: "String (YYYY-MM-DD)"
          title: "String"
          description: "String"
          events: "List of Strings"
  locations:
    description: "Schema for locations.yaml"
    format:
      locations:
        - name: "String"
          description: "String"
  people:
    description: "Schema for people.yaml"
    format:
      people:
        - name: "String"
          description: "String"
  missions:
    description: "Schema for missions.yaml"
    format:
      short_term:
        - mission: "String"
          status: "String"
          objectives: "List of Strings"
      long_term:
        - mission: "String"
          status: "String"
          objectives: "List of Strings"
EOL

echo "manifest.yaml generated successfully."
