class PartyMaker
  def self.make_party(user_id, party_id, invitees)
    UserParty.create!(user_id: user_id, party_id: party_id, is_host: true)
    invitees.each do |invited_user_id|
      if invited_user_id != ""
        UserParty.create!(user_id: invited_user_id, party_id: party_id, is_host: false)
      end
    end
  end
end
