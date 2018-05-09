require './app/services/contest_type_service'

describe ContestTypeService do
  subject { described_class}

  context 'Public class methods' do
    it 'has a #all method' do
      expect(subject).to respond_to(:all)
    end
  end
end
