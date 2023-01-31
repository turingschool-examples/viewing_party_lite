FactoryBot.define do
  factory :viewing_party_user do
    user { create(:user) }
    viewing_party { create(:viewing_party) }
  end
end
