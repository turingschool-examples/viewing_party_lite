class User < ApplicationRecord
  has_many :invitees
  has_many :viewing_parties, through: :invitees
  validates_presence_of :name, :email
  validates_uniqueness_of :email

  def host?(vp_id)
    Invitee.where('viewing_party_id = ?', vp_id).where('user_id = ?', self.id)[0].host
  end

  def hosting_viewing_parties
    vps = []
    self.viewing_parties.each do |vp|
      if self.host?(vp.id)
        vps.push(vp)
      end
    end
    vps
  end

  def not_hosting_viewing_parties
    vps = []
    self.viewing_parties.each do |vp|
      if !self.host?(vp.id)
        vps.push(vp)
      end
    end
    vps
  end
end
