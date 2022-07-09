class User < ApplicationRecord
  has_secure_password

  has_many :party_users
  has_many :viewing_parties, through: :party_users

  validates :email, presence: true
end
