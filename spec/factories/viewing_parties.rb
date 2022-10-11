FactoryBot.define do
  factory :viewing_party do
    start_time { Faker::Time.forward(days: 14, period: :evening) }
    duration { Faker::Number.between(from: 90, to: 240)}
  end
end