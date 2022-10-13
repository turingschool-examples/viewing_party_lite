require 'faker'
require 'time'

FactoryBot.define do
  factory :party do
    movie_id { rand(1..20000) }
    duration { rand(1..800) }
    date { Faker::Date.between(from: '2022-10-15', to: '2024-09-25') }
    start_time { rand(Time.parse('12:00 am')..randTime.parse('11:59 pm')) }
  end
end 