# frozen_string_literal: true

FactoryBot.define do
  factory :viewing_party do
    duration { Faker::Number.number(digits: 6).to_s }
    party_date { Faker::Date.between(from: 7.days.ago, to: Date.today) }
  end
end
