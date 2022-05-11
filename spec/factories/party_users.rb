FactoryBot.define do
  factory :party_user do
    user { nil }
    party { nil }
    is_host { false }
  end
end
