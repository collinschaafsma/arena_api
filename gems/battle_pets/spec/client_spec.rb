require "spec_helper"

describe BattlePets::Client do
  before(:each) do
    BattlePets.configure do |config|
      config.api_key = 'changeme'
      config.api_url = 'http://localhost:9000'
    end
  end

  let(:client) {BattlePets::Client.new}
  let(:pet_uid) {'40e7f251-8bb0-479b-b590-e6c45446c059'}
  let(:post_req) {
    { name: 'Bone Crusher', strength: 98, intelligence: 2, speed: 10, integrity: 26 }
  }

  it 'instantiates with a Faraday::Connection @conn' do
    expect(client.conn).to be_kind_of(Faraday::Connection)
  end

  it 'has a #all method' do
    expect(client).to respond_to(:all)
  end

  it 'has a #find method' do
    expect(client).to respond_to(:find)
  end

  it 'has a #create method' do
    expect(client).to respond_to(:create)
  end

  describe '/pets/:id' do
    context 'GET' do
      it 'finds a pet' do
        VCR.use_cassette('pet') do
          pet = client.find(pet_uid)
          expect(pet).to be_kind_of(BattlePets::Pet)
        end
      end

      it 'has a name of Fluffy' do
        VCR.use_cassette('pet') do
          pet = client.find(pet_uid)
          expect(pet.name).to eq('Fluffy')
        end
      end
    end
  end

  describe '/pets' do
    context 'GET' do
      it 'finds all pets' do
        VCR.use_cassette('pets') do
          pets = client.all
          expect(pets.is_a?(Array)).to eq true
        end
      end

      it 'has a pet by the name of Fluffy' do
        VCR.use_cassette('pets') do
          pets = client.all
          expect(pets[0].name).to eq 'Fluffy'
        end
      end
    end
  end

  describe '/pets' do
    context 'POST' do
      it 'creates a new pet' do
        VCR.use_cassette('pet_created') do
          pet = client.create(post_req)
          expect(pet.name).to eq 'Bone Crusher'
        end
      end
    end
  end

end
