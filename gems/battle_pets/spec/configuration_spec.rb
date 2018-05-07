require "spec_helper"

describe BattlePets::Configuration do
  it 'gets the correct value for api_key' do
    BattlePets.configure { |config| config.api_key = 'mykey' }
    expect(BattlePets.configuration.api_key).to eq 'mykey'
  end

  it 'gets the correct value for api_url' do
    BattlePets.configure { |config| config.api_url = 'myurl' }
    expect(BattlePets.configuration.api_url).to eq 'myurl'
  end
end
