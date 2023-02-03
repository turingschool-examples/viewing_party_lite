FactoryBot.define do
  factory :viewing_party_user do
    association :user
    association :viewing_party
  end
end