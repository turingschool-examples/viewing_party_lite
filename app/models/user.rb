class User < ApplicationRecord
  validates_presence_of :user_name, :email
  validates :email, uniqueness: true

  has_many :viewing_party_users
  has_many :viewing_parties, through: :viewing_party_users

  def find_invited_parties
    viewing_parties.where.not("host = ?", self.user_name)
  end

  def find_hosted_parties
    viewing_parties.where("host = ?", self.user_name)
  end
end
