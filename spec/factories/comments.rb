FactoryGirl.define do
  factory :comment do

    body Faker::Lorem.sentence #=> "Dolore illum animi et neque accusantium."
    association :idea, factory: :idea
    association :user, factory: :user


    
  end
end
