require 'faraday'
require 'json'

module BattlePets
  class Client
    attr_reader :conn

    def initialize
      @conn = Faraday.new(url: BattlePets.configuration.api_url) do |faraday|
        faraday.headers['Content-Type'] = 'application/json'
        faraday.headers['Accept'] = 'application/json'
        faraday.headers['X-Pets-Token'] = BattlePets.configuration.api_key
        faraday.adapter  Faraday.default_adapter
      end
    end

    # In the real world the error handeling we have here would not fly
    def find(pet_uid)
      response = conn.get "/pets/#{pet_uid}"
      if response.status == 200
        Pet.new(JSON.parse(response.body))
      else
        puts "Errrooor: #{response.reason_phrase}"
        puts "For: #{BattlePets.configuration.api_url}"
        puts "Errrooor: #{response.status}"
        Error.new(response.status, response.reason_phrase)
      end
    end

    def all
      response = conn.get '/pets'
      pets = JSON.parse(response.body)
      pets.map { |attributes| Pet.new(attributes) }
    end

    def create(params)
      response = conn.post do |req|
        req.url '/pets'
        req.body = JSON.generate(params)
      end

      if response.status == 201
        Pet.new(JSON.parse(response.body))
      else
        Error.new(response.status, response.reason_phrase)
      end
    end
  end
end
