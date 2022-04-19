# frozen_string_literal: true

FactoryBot.define do
  factory :viewing_party do
    movie_id { Faker::Number.number(digits: 3) }
    duration { Faker::Number.between(from: 100, to: 200) }
    date { Faker::Date.forward(days: 60) }
    start_time { Faker::Time.forward(format: :short) }
  end
end
