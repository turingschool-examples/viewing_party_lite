FactoryBot.define do
  factory :party do
    duration { Faker::Number.within(range: 120..430)}
    day { Faker::Date.between(from: '2022-12-25', to: '2024-12-25') }
    start_time { Faker::Time.between(from: DateTime.now, to: DateTime.now + 1).strftime("%H:%M:%S") }
    movie_title { Faker::Movie.title }
  end
end