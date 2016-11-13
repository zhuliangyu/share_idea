FactoryGirl.define do
  factory :user do
    first_name Faker::Name.name
    last_name Faker::Name.name
    # email SecureRandom.uuid+"@126.COM"

    sequence(:email) do |n|
      SecureRandom.uuid+n.to_s+"@126.COM"
    end

    password "123456"


  end
end
