class User < ApplicationRecord
  has_many :viewing_party_users
  has_many :viewing_parties, through: :viewing_party_users

  validates_presence_of :name, :email
  validates_uniqueness_of :email

  def friends
    User.where.not(id: self.id)
  end

  #takes a boolean argument true if hosting, false if invited
  def parties(is_host)
    ViewingParty.joins(:viewing_party_users).
      where(viewing_party_users: {
         user_id: self.id, 
         hosting: is_host }
    )
  end

  def movie_ids
    viewing_parties.map { |party| party.movie_id }
  end

  def set_host(viewing_party)
    viewing_party_user = viewing_party_users.where(viewing_party_id: viewing_party.id)
    viewing_party_user.update(hosting: true)
  end

  def self.invited_users(param_hash)
    User.all.filter_map do |user|
      if param_hash[user.id.to_s] == "1"
        user
      end
    end
  end
end
