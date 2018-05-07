class ContestPet < ApplicationRecord
  belongs_to :contest
  validates :pet_uid, presence: true
end
