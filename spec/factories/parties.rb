require 'faker'

FactoryBot.define do
  factory :party do
    movie_id { rand(1..20000) }
    duration { rand(1..800) }
    date { Faker::Date.between(from: '2022-10-15', to: '2024-09-25') }
    start_time { Faker::Time.between(from: DateTime.now, to: DateTime.now + 700, format: :short) }
  end
end 