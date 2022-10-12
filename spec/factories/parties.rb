require 'faker'

FactoryBot.define do
  factory :party do
    duration { Faker::Number.number(digits: 3) }
    date { Faker::Time.between(from: DateTime.now, to: DateTime.now + 30) }
    start_time { Faker::Time.between(from: DateTime.now, to: DateTime.now + 30) }
    movie_id { Faker::Number.number(digits: 1) }
  end
end