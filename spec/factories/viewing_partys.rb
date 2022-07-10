FactoryBot.define do
  factory :viewing_party do
    movie { Faker::Movie.title }
    date { Faker::Time.forward(days: 1) }
    start_time { Faker::Time.forward(days: 1) }
    duration { Faker::Number.number(digits: 3) }
  end
end
