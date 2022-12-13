FactoryBot.define do
  factory :party do
    duration { Faker::Number.within(range: 120..430)}
    day { Faker::Date.between(from: '2022-12-25', to: '2024-12-25') }
    start_time { Faker::Time.forward(days: 365, period: :evening, format: :short)}
    movie_title { Faker::Movie.title }
  end
end