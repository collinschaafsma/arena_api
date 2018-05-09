require 'rails_helper'

RSpec.describe Contest, type: :model do
  subject { Contest.new }

  context 'validations' do
    it { should validate_presence_of :contest_type }
  end

  context 'associations' do
    it { should have_many(:contest_pets) }
  end

  context 'columns' do
    it { should have_db_column(:status).of_type(:integer).with_options(default: 'pending') }
    it { should have_db_column(:contest_type).of_type(:string) }
    it { should have_db_column(:winner_id).of_type(:string) }
    it { should have_db_column(:finished_at).of_type(:datetime) }
  end

  context 'attributes' do
    it 'has status' do
      expect(build(:contest, status: 'pending')).to have_attributes(status: 'pending')
    end

    it 'has contest_type' do
      expect(build(:contest, contest_type: 'speed_eating')).to have_attributes(contest_type: 'speed_eating')
    end

    it 'has winner_id' do
      expect(build(:contest, winner_id: 'chicken-dinner')).to have_attributes(winner_id: 'chicken-dinner')
    end

    it 'has finished_at' do
      today = Date.today
      expect(build(:contest, finished_at: Date.today)).to have_attributes(finished_at: today)
    end
  end
end
