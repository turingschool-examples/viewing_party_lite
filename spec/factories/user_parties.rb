# frozen_string_literal: true

FactoryBot.define do
  factory :user_party do
    user
    viewing_party
  end
end
