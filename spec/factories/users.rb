FactoryBot.define do
  factory :user do
    name { Faker::Lorem.word }
    password_digest { Faker::Lorem.word }
    rights { Faker::Number.number(10) }
  end
end
