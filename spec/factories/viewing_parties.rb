FactoryBot.define do
  factory :viewing_party do
    start_time { Faker::Time.between(from: Time.now - 30, to: Time.now + 30) }
    date { Faker::Date.between(from: Date.today, to: 30.days.from_now) }
    duration { Faker::Number.within(range: 175..240)}
    movie_id { [238, 278, 315162].shuffle.shuffle.first }
  end
end