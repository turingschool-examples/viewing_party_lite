FactoryBot.define do
  factory :user_viewing_party do
    viewing_party_id { ViewingParty.all.shuffle.shuffle.first.id }
    user_id { User.all.shuffle.shuffle.first.id }
  end
end