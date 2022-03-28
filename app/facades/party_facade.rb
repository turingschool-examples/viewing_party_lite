class PartyFacade
  def self.invite_users(users, party)
    users.each do |user_id|
      PartyUser.create!(
        user_id: user_id.to_i,
        party_id: party.id,
        is_host: false
      )
    end
  end
end
