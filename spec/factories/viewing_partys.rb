FactoryBot.define do
  factory :viewing_party do
    movie { Faker::Movies::Lebowski }
    datetime { Faker::Time.forward(days: 1) }
    duration { Faker::Number.number(digits: 3) }
  end
end
