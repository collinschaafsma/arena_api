module Arena
  class << self
    attr_accessor :configuration
  end

  # Store the Configuration object on the Arena module, oh Ruby!
  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :contest_types

    def initialize
      @contest_types = []
    end
  end
end
