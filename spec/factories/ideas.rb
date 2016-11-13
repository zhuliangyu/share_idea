FactoryGirl.define do
  factory :idea do
    title Faker::Lorem.sentence #=> "Dolore illum animi et neque accusantium."
    body Faker::Lorem.sentence #=> "Dolore illum animi et neque accusantium."
    association :user, factory: :user

  end
end
