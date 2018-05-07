FactoryBot.define do
  factory :contest_pet do
    sequence(:pet_uid) {|n| "long-pet-uid-#{n}" }
    contest
  end

  factory :contest do
    status 0
    contest_type  "SpeedEating"
    winner_id     ""

    factory :contest_with_contest_pets do
      transient do
        contest_pet_count 2
      end
      after(:create) do |contest, evaluator|
        create_list(:contest_pet, evaluator.contest_pet_count, contest: contest)
      end
    end
  end

  factory :contest_post_request, class:Hash do
    params = {
       contest: {
         contest_type: "speed_eating",
         contest_pets_attributes: [
           {pet_uid: "40e7f251-8bb0-479b-b590-e6c45446c059"},
           {pet_uid: "4318d44f-2217-4c5d-a5db-37309db7797a"}
          ]
       }
    }
    initialize_with{ params.merge(attributes) }
  end
end
