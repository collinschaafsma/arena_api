# Simple configuration for our BattlePets API wrapper gem
BattlePets.configure do |config|
  config.api_url = ENV['BATTLE_PETS_API_URL']
  config.api_key = ENV['BATTLE_PETS_API_KEY']
end
