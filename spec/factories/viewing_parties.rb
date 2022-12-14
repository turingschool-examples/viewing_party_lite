# frozen_string_literal: true

FactoryBot.define do
  factory :viewing_party do
    movie_id { Faker::Number.non_zero_digit }
    duration { Faker::Number.non_zero_digit }
    date { Faker::Date.forward(days: 14) }
    start_time { Faker::Time.forward(days: 14, period: :evening, format: :long) }
  end
end
