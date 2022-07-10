class PartyUser < ApplicationRecord
  belongs_to :user
  belongs_to :viewing_party

  def self.invite_guests(list, viewing_party_id)
    unless list.nil?
      list.each do |user_id|
        PartyUser.create({ user_id: user_id, viewing_party_id: viewing_party_id,
                           host: false })
      end
    end
  end
end
