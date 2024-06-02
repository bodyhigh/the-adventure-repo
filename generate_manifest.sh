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
      name: string
      class: string
      level: integer
      race: string
      background: string
      alignment: string
      abilityScores:
        strength: integer
        dexterity: integer
        constitution: integer
        intelligence: integer
        wisdom: integer
        charisma: integer
      modifiers:
        strength: integer
        dexterity: integer
        constitution: integer
        intelligence: integer
        wisdom: integer
        charisma: integer
      savingThrows:
        strength: integer
        dexterity: integer
        constitution: integer
        intelligence: integer
        wisdom: integer
        charisma: integer
      skills:
        acrobatics: integer
        animalHandling: integer
        arcana: integer
        athletics: integer
        deception: integer
        history: integer
        insight: integer
        intimidation: integer
        investigation: integer
        medicine: integer
        nature: integer
        perception: integer
        performance: integer
        persuasion: integer
        religion: integer
        sleightOfHand: integer
        stealth: integer
        survival: integer
      combat:
        proficiencyBonus: integer
        hitPoints: integer
        armorClass: integer
        initiative: integer
        speed: integer
        attacksAndSpellcasting:
          - name: string
            attackBonus: integer
            damage: string
      features:
        race: list of strings
        class: list of strings
        background: list of strings
      spellcasting:
        spellcastingAbility: string
        spellSaveDC: integer
        spellAttackBonus: integer
        cantrips: list of strings
        spellSlots:
          1st: integer
          2nd: integer
          3rd: integer
          4th: integer
        knownSpells: list of strings
        availableSpells: list of objects with { name: string, chosen: boolean }
      equipment:
        armor: string
        weapons: list of strings
        shield: string
        adventuringGear: list of strings
        magicalItems: list of strings
        miscellaneousItems: list of strings
        otherItems: list of strings
      proficienciesAndLanguages:
        armor: list of strings
        weapons: list of strings
        tools: list of strings
        languages: list of strings
      personality:
        traits: string
        ideals: string
        bonds: string
        flaws: string
      backstory: string
      notableQuests: list of objects with { name: string, description: string }
      passivePerception: integer
      experiencePoints: integer
      featuresAndTraitsDescription: list of objects with { name: string, description: string }
EOL

echo "Manifest file generated successfully."
