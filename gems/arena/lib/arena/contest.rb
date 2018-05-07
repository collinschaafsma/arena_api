require_relative 'contest_type/speed_eating'
require_relative 'contest_type/napping'

module Arena
  class Contest
    def self.determine_winner(contest_type, pets)
      # Make sure we have a ContestType that matches up in our rails config
      if Arena.configuration.contest_types.include?(contest_type)
        klass = contest_type_klass(contest_type)
        klass ? klass.new(pets).determine_winner : undefined_contest_type
      else
        # We dont have that contest_type set in our config
        undefined_contest_type
      end
    end

    def self.contest_type_klass(contest_type)
      begin
        klass = "Arena::ContestType::#{contest_type.classify}".constantize
      rescue NameError
        nil
      end
    end

    def self.undefined_contest_type
      'Undefined contest type. Sorry'
    end

    private_class_method :contest_type_klass, :undefined_contest_type
  end
end
