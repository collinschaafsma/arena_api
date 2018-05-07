module BattlePets
  class << self
    attr_accessor :configuration
  end

  # Store the Configuration object on the BattlePets module, oh Ruby!
  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :api_url
    attr_accessor :api_key

    def initialize
      @api_url = 'http://localhost:9000'
      @api_key = 'changeme'
    end
  end
end
