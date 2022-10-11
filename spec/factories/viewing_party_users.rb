require 'faker'

FactoryBot.define do
  factory :viewing_party_user do
    user
    viewing_party
  end
end 