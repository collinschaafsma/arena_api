require './app/services/contest_service'

describe ContestService do
  subject { described_class.new({}) }

  it 'should accept any Class' do
    MyClass = Class.new
    service = ContestService.new(MyClass)
    expect(service.contest.name).to eq("MyClass")
  end

  context 'Public Instance methods' do
    it 'should have a #all method' do
      expect(subject).to respond_to(:all)
    end

    it 'should have a #find method' do
      expect(subject).to respond_to(:find)
    end

    it 'should have a #create method' do
      expect(subject).to respond_to(:create)
    end

    it 'should have a #battle method' do
      expect(subject).to respond_to(:battle)
    end
  end

  context 'Private Instance methods' do
    it 'should have a #fetch_pets_to_battle method' do
      expect(subject).not_to respond_to(:fetch_pets_to_battle)
    end

    it 'should have a #update_winner method' do
      expect(subject).not_to respond_to(:update_winner)
    end
  end
end
