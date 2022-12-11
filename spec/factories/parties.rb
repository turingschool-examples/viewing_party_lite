FactoryBot.define do
  factory :party do
    date { Faker::Date.in_date_period }
    start_time { "#{rand(1..24)}:00" }
    movie_title { Faker::Movie.title }
    duration { rand(240..269) }
  end
end
