# require "battle_pets/pet", this just makes it easier to stub out our pets object we get
# back from the battle-pets client. If this moved into its own repo we could just make
# battle pets a dep for the test env.
$LOAD_PATH.unshift File.expand_path("../../../battle_pets/lib/", __FILE__)
require "battle_pets/pet"

FactoryBot.define do
  factory :pet, class: BattlePets::Pet do

      id '1234'
      name 'Fido'
      strength 10
      speed 30
      intelligence 40
      integrity 10

      # BattlePets::Pet gets instantiated by a json object so we need to
      # mimic that here
      initialize_with {
        new(
          {
            'id' => id,
            'name' => name,
            'strength' => strength,
            'speed' => speed,
            'intelligence' => intelligence,
            'integrity' => integrity
          }
        )
      }

  end
end
