# frozen_string_literal: true

FactoryBot.define do
  factory :user_party do
    host { ([false, false, false, true]).sample(1)[0] }
    viewing_party
    user
  end
end
