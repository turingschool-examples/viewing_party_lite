FactoryBot.define do
  factory :user_viewing_party do
    viewing_party_id { ViewingParty.all.shuffle.shuffle.first.id }
    user_id {
      user = User.all.shuffle.shuffle.first
      unless UserViewingParty.exists?(user_id: user.id, viewing_party_id: viewing_party_id)
        user.id
      else
        (User.all - [user]).shuffle.shuffle.first.id
      end
    }
    hosting { user_id == User.first.id }
  end
end