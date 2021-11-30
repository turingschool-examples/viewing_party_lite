# frozen_string_literal: true

FactoryBot.define do
  factory :viewing_party do
    movie_name { Faker::Ancient.hero }
    duration { Faker::Number.number(digits: 2) }
    start_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    user
  end
end
