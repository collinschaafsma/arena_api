module BattlePets
  class Pet
    attr_reader :id, :name, :strength, :speed, :intelligence, :integrity

    def initialize(attributes)
      @id = attributes['id']
      @name = attributes['name']
      @strength = attributes['strength']
      @speed = attributes['speed']
      @intelligence = attributes['intelligence']
      @integrity = attributes['integrity']
    end

  end
end
