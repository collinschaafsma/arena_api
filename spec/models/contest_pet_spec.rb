require 'rails_helper'

RSpec.describe ContestPet, type: :model do
  subject { ContestPet.new }

  context 'validations' do
    it { is_expected.to validate_presence_of :pet_uid }
  end

  context 'associations' do
    it { is_expected.to belong_to(:contest) }
  end

  context 'columns' do
    it { is_expected.to have_db_column(:contest_id).of_type(:integer) }
    it { is_expected.to have_db_column(:pet_uid).of_type(:string) }
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
