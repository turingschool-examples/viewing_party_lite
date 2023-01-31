FactoryBot.define do
  factory :viewing_party do
    date_time { Faker::Time.between(from: DateTime.now - 30, to: DateTime.now + 30) }
    host { User.all.shuffle.shuffle.first.id }
    duration { Faker::Number.within(range: 60..240)}
  end
end