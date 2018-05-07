# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
contest = Contest.create({ status: 0, contest_type: 'speed_eating', winner_id: '40e7f251-8bb0-479b-b590-e6c45446c059'})
ContestPet.create([
  { contest_id: contest.id, pet_uid: '40e7f251-8bb0-479b-b590-e6c45446c059'},
  { contest_id: contest.id, pet_uid: '4318d44f-2217-4c5d-a5db-37309db7797a'}
])
