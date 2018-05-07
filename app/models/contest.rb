class Contest < ApplicationRecord
  has_many :contest_pets
  accepts_nested_attributes_for :contest_pets
  validates :contest_type, presence: true
  enum status: { pending: 0, batteling: 1, finished: 2 }
end
