module Arena
  module ContestType
    class SpeedEating < ContestTypeBase

      CONTEST_DESC = 'How fast can they eat bacon?!'

      attr_reader :pets

      def initialize(pets)
        @pets = pets
        super(pets, strategy)
      end

      def strategy
        {
          strength: 20, #it takes a little strength to force down food
          speed: 60, #you gotta be fast
          intelligence: 10, #helps if your not that smart
          integrity: 10, #don't want too much of this either
        }
      end

      def self.desc
        CONTEST_DESC
      end
    end
  end
end
