require './app/services/contest_service'

describe ContestService do
  subject { described_class.new({}) }

  it 'accepts any Class' do
    MyClass = Class.new
    service = ContestService.new(MyClass)
    expect(service.contest.name).to eq("MyClass")
  end

  context 'when not initialized' do
    it 'has a #all method' do
      expect(subject).to respond_to(:all)
    end

    it 'has a #find method' do
      expect(subject).to respond_to(:find)
    end

    it 'has a #create method' do
      expect(subject).to respond_to(:create)
    end

    it 'has a #battle method' do
      expect(subject).to respond_to(:battle)
    end
  end

  context 'when initialized' do
    it 'has a #fetch_pets_to_battle method' do
      expect(subject).not_to respond_to(:fetch_pets_to_battle)
    end

    it 'has a #update_winner method' do
      expect(subject).not_to respond_to(:update_winner)
    end
  end
end
