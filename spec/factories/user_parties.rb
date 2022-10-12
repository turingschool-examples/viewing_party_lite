require 'faker'

FactoryBot.define do
  factory :userParty do
    user_id { Faker::Number.number(digits: 2) }
    party_id { Faker::Number.number(digits: 2) }
    is_host { Faker::Boolean.boolean }
  end
end