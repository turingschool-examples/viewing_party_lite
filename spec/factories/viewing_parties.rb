FactoryBot.define do
  factory :viewing_party do
    movie_id {Faker::Number.between(from: 1, to: 100)}
    duration {Faker::Number.between(from: 3600, to: 10800)}
    date {Faker::Date.forward(days: 30)}
    start_time {Faker::Time.forward(days: 30, period: :day)}
  end
end
