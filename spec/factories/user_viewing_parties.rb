FactoryBot.define do
  factory :user_viewing_party do
    viewing_party { ViewingParty.all.shuffle.sample }
    user_id do
      user = User.all.shuffle.sample
      if user.find_user_viewing_party(viewing_party)
        (User.all - [user]).shuffle.sample.id
      else
        user.id
      end
    end
    hosting { !UserViewingParty.exists?(viewing_party_id: viewing_party.id) }
  end
end
