class User < ApplicationRecord
  has_many :viewing_party_users
  has_many :viewing_parties, through: :viewing_party_users

  validates_presence_of :name, :email, required: true
  validates :email, uniqueness: true
  validates_presence_of :password_digest, required: true
  has_secure_password

end
