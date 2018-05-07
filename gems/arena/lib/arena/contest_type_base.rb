# Base class for all contest types
module Arena
  class ContestTypeBase
    attr_reader :pets, :strategy

    def initialize(pets, strategy = nil)
      @pets = pets
      @strategy = strategy ||= default_strategy
    end

    # Make sure we have at least one pet. We could support more
    # than two pets and have a real brawl if we want
    def pets?
      pets.is_a?(Enumerable) && pets.count > 1
    end

    def determine_winner
      if pets?
        battle
      else
        "No pets!"
      end
    end

    def battle
      scores = {}
      pets.each do |pet|
        scores[pet.id] = determine_score(pet)
      end
      # Return the highest score, if there is a tie, the first item in the
      # hash is the winner, in other words the first pet that steps into the arena
      scores.max_by(&:last).first
    end

    # Default strategy to determine winner
    # In this case we value integrity by 60%
    def default_strategy
      {
        strength: 10,
        speed: 20,
        intelligence: 10,
        integrity: 60,
      }
    end

    def determine_score(pet)
      score = 0
      pet.instance_variables.map do |var|
        if strategy.keys.include?(var[1..-1].to_sym)
          score += (pet.instance_variable_get(var) * strategy[var[1..-1].to_sym])
        end
      end
      score
    end
  end
end
