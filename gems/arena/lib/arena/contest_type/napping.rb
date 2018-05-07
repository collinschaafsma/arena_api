module Arena
  module ContestType
    class Napping < ContestTypeBase

      CONTEST_DESC = 'See who can nap the hardest!'

      attr_reader :pets

      def initialize(pets)
        @pets = pets
        super(pets, strategy)
      end

      def strategy
        {
          strength: 1, #doesn't matter
          speed: 1, #doesn't matter
          intelligence: 30, #smart enough to know you need to nap
          integrity: 30, #nothing wrong with napping, but too much might be bad
        }
      end

      def self.desc
        CONTEST_DESC
      end
    end
  end
end
