FactoryBot.define do
  factory :user_party do
    user
    party
    host { Faker::Boolean.boolean }
  end
end