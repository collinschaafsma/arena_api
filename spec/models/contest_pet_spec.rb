require 'rails_helper'

RSpec.describe ContestPet, type: :model do
  subject { ContestPet.new }

  context 'validations' do
    it { should validate_presence_of :pet_uid }
  end

  context 'associations' do
    it { should belong_to(:contest) }
  end

  context 'columns' do
    it { should have_db_column(:contest_id).of_type(:integer) }
    it { should have_db_column(:pet_uid).of_type(:string) }
  end

  context 'attributes' do
    it 'has contest_id' do
      expect(build(:contest_pet, contest_id: 1)).to have_attributes(contest_id: 1)
    end

    it 'has pet_uid' do
      expect(build(:contest_pet, pet_uid: '1')).to have_attributes(pet_uid: '1')
    end
  end
end
