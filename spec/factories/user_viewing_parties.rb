FactoryBot.define do
  factory :user_viewing_party do
    viewing_party { ViewingParty.all.shuffle.shuffle.first }
    user_id {
      user = User.all.shuffle.shuffle.first
      unless user.find_user_viewing_party(viewing_party)
        user.id
      else
        (User.all - [user]).shuffle.shuffle.first.id
      end
    }
    hosting { !UserViewingParty.exists?(viewing_party_id: viewing_party.id) }
  end
end