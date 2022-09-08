require 'faker'

FactoryBot.define do
  factory :viewing_party_user do
    user_id {}
    viewing_party_id {}
    status {}
  end
end