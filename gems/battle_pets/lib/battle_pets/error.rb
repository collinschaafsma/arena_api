module BattlePets
  class Error
    attr_reader :status, :phrase

    def initialize(status, phrase)
      @status = status
      @phrase = phrase
    end
    
  end
end
