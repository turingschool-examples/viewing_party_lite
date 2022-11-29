# frozen_string_literal: true

FactoryBot.define do
  factory :viewing_party_user do
    host { Faker::Boolean.boolean }
  end
end
