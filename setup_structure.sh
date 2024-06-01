#!/bin/bash

# Check if directory name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <directory_name>"
  exit 1
fi

# Create main directories
mkdir -p $1/{journal,technical,images,persona,scripts,sample-adventures/the-lost-forge-of-the-spellsmith}

# Create initial technical files with clean setup
cat <<EOL > $1/technical/character_sheet.yaml
character:
  name: Cindor
  class: Fighter (Eldritch Knight)
  level: 2
  race: Fire Genasi
  background: Guild Artisan (Smith)
  alignment: Neutral Good
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
  proficiencyBonus: 2
  hitPoints: 25
  armorClass: 18
  initiative: 1
  speed: 30
  features:
    race:
      - Darkvision (60 feet)
      - Fire Resistance
      - Reach to the Blaze
    class:
      - Fighting Style: Defense
      - Second Wind
      - Action Surge (1 use)
    background:
      - Guild Membership
  spells:
    cantrips:
      - Fire Bolt
      - Mage Hand
    spellSlots:
      1st: 2
      2nd: 0
      3rd: 0
      4th: 0
  equipment:
    armor: Plate Armor
    weapons:
      - Magical Longsword (+1 Longsword, Elemental Strike)
      - Shortbow
      - Quiver of Arrows
    shield: Shield
    adventuringGear:
      - Explorer's Pack
      - Smith's Tools
      - Rations (10 days)
      - Waterskin
      - Tinderbox
      - Torches (10)
      - 50 feet of Hempen Rope
    magicalItems:
      - Signal Whistle
      - Healing Potions (3)
    miscellaneousItems:
      - Coin Pouch (15 gold pieces)
      - Pendant with Guild Symbol
    otherItems:
      - Runed Dagger (magical focus for binding elemental spirits)
      - Ritual Notes and Map
  proficienciesAndLanguages:
    armor:
      - All armor
      - Shields
    weapons:
      - Simple weapons
      - Martial weapons
    tools:
      - Smith's tools
    languages:
      - Common
      - Ignan
  spellcastingDetails:
    spellcastingAbility: Intelligence
    spellSaveDC: 12
    spellAttackBonus: 4
  personalityTraits: "I believe that anything worth doing is worth doing right. I can’t help it—I’m a perfectionist."
  ideals: "Aspiration. I work hard to be the best there is at my craft."
  bonds: "One day I will return to my guild and prove that I am the greatest artisan of them all."
  flaws: "I’ll do anything to get my hands on something rare or priceless."
  attacksAndSpellcasting:
    - name: Longsword
      attackBonus: 6
      damage: "1d8+4 slashing"
    - name: Fire Bolt
      attackBonus: 4
      damage: "1d10 fire"
  passivePerception: 11
  experiencePoints: 750
  featuresAndTraitsDescription:
    - name: Darkvision
      description: "You can see in darkness (shades of gray) up to 60 feet."
    - name: Fire Resistance
      description: "You have resistance to fire damage."
    - name: Reach to the Blaze
      description: "You know the Produce Flame cantrip. Constitution is your spellcasting ability for it."
    - name: Fighting Style: Defense
      description: "While you are wearing armor, you gain a +1 bonus to AC."
    - name: Second Wind
      description: "You have a limited well of stamina that you can draw on to protect yourself from harm. On your turn, you can use a bonus action to regain hit points equal to 1d10 + your fighter level."
    - name: Action Surge
      description: "On your turn, you can take one additional action. This can be used once per short or long rest."
    - name: Guild Membership
      description: "As an established and respected member of aguild, you can rely on certain benefits that membership provides. Your fellow guild members will provide you with lodging and food if necessary, and pay for your funeral if needed. In some cities and towns, a guildhall offers a central place to meet other members of your profession, which can be a good place to meet potential patrons, allies, or hirelings."
EOL

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

# Copy sample adventure files
cp -r sample-adventures/the-lost-forge-of-the-spellsmith $1/sample-adventures/

# Copy update scripts to the scripts directory
cp update_experiences.sh $1/scripts/update_experiences.sh
cp update_locations.sh $1/scripts/update_locations.sh
cp update_people.sh $1/scripts/update_people.sh
cp update_missions.sh $1/scripts/update_missions.sh
cp update_character_sheet.sh $1/scripts/update_character_sheet.sh

# Make scripts executable
chmod +x $1/scripts/*.sh

# Generate manifest.yaml
./generate_manifest.sh $1

# Generate README.md
./generate_readme.sh $1

echo "Setup completed and README.md generated successfully."
