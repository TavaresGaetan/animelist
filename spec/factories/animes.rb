FactoryBot.define do
    factory :anime do
      title { Faker::StarWars.character }
      author { Faker::StarWars.character }
      type { Faker::StarWars.character }
      rating { Faker::Number.number(10) }
      releasedate { Faker::Date.between(from: '2014-09-23', to: '2014-09-25') }
      episodenumber { Faker::Number.number(12) }
      image { Faker::StarWars.character }
      user_id nil
    end
  end