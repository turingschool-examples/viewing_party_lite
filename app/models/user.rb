class User < ApplicationRecord
  has_many :viewing_party_users
  has_many :viewing_parties, through: :viewing_party_users
  validates_presence_of :name, :email, :password_digest
  validates_uniqueness_of :email
  has_secure_password

  enum role: %w(default manager admin)

  def friends
    User.where.not(id: id)
  end

  def parties(is_host)
    ViewingParty.joins(:viewing_party_users)
                .where(viewing_party_users: {
                         user_id: id,
                         hosting: is_host
                       })
  end

  def movie_ids
    viewing_parties.map(&:movie_id)
  end

  def set_host(viewing_party)
    viewing_party_user = viewing_party_users.where(viewing_party_id: viewing_party.id)
    viewing_party_user.update(hosting: true)
  end

  def self.invited_users(param_hash)
    User.all.filter_map do |user|
      user if param_hash[user.id.to_s] == '1'
    end
  end
end
