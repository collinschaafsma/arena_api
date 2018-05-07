require "spec_helper"

describe Arena::ContestType::Napping do
  subject {described_class}

  let(:contest_type) {described_class.new([build(:pet), build(:pet)])}

  it 'should have a @pets attribute' do
    expect(contest_type.pets.is_a?(Array)).to eq(true)
  end

  it 'inherits base class of Arena::ContestTypeBase' do
    expect(contest_type).to be_kind_of(Arena::ContestTypeBase)
  end

  it 'has a class method #desc' do
    expect(subject).to respond_to(:desc)
  end

  it 'has a instance method #strategy' do
    expect(contest_type).to respond_to(:strategy)
  end

  context 'strategy weights' do

    it 'has a strength weighting of 1' do
      expect(contest_type.strategy[:strength]).to eq(1)
    end

    it 'has a speed weighting of 1' do
      expect(contest_type.strategy[:speed]).to eq(1)
    end

    it 'has a intelligence weighting of 30' do
      expect(contest_type.strategy[:intelligence]).to eq(30)
    end

    it 'has a integrity weighting of 30' do
      expect(contest_type.strategy[:integrity]).to eq(30)
    end
  end
end
