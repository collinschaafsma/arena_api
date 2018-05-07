class ContestSerializer < ActiveModel::Serializer
  attributes :id, :status, :contest_type, :winner_id, :finished_at, :created_at
  has_many :contest_pets, serializer: ContestPetSerializer
end
