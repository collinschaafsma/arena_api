require "spec_helper"

describe Arena::Configuration do
  it 'gets the correct value for contest_types' do
    Arena.configure { |config| config.contest_types = ['123', '321'] }
    expect(Arena.configuration.contest_types).to eq ['123', '321']
  end
end
