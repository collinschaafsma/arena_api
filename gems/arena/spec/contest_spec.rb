require "spec_helper"

describe Arena::Contest do

  before(:each) do
    Arena.configure do |config|
      config.contest_types = %w(speed_eating napping)
    end
  end

  let(:pet1) {
    build(
      :pet, id: '1234', name: 'Captin Chow',
      strength: 40, speed: 40, intelligence: 10, integrity: 10
    )
  }

  let(:pet2) {
    build(
      :pet, id: '5678', name: 'Napster',
      strength: 10, speed: 10, intelligence: 40, integrity: 40
    )
  }

  # pet2 should win in napping, pet1 should win in speed_eating

  it 'will NOT determine a winner if the contest_type has not been configured' do
    contest = Arena::Contest.determine_winner('not_in_config', [pet1, pet2])
    expect(contest).to eq('Undefined contest type. Sorry')
  end

  it 'will NOT determine a winner because we dont have enough pets' do
    contest = Arena::Contest.determine_winner('speed_eating', [pet1])
    expect(contest).to eq('No pets!')
  end

  it 'will determine a winner with contest type speed_eating' do
    contest = Arena::Contest.determine_winner('speed_eating', [pet1, pet2])
    expect(contest).to eq('1234')
  end

  it 'will determine a winner with contest type napping' do
    contest = Arena::Contest.determine_winner('napping', [pet1, pet2])
    expect(contest).to eq('5678')
  end

end
