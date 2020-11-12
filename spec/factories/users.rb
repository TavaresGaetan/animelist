FactoryBot.define do
  factory :user do
    name { Faker::Lorem.word }
    password { Faker::Lorem.word }
    rights { Faker::Number.number(10) }
  end
end
