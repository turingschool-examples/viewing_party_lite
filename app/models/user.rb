class User < ApplicationRecord
  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def party_host
    viewing_parties.where(user_viewing_parties: {host: true})
  end

  def not_hosting
    viewing_parties.where(user_viewing_parties: {host: false})
  end
end
