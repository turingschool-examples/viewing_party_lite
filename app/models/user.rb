class User < ApplicationRecord
  validates_presence_of :user_name, :password_digest, :email
  validates :email, uniqueness: true

  has_many :viewing_party_users
  has_many :viewing_parties, through: :viewing_party_users
end
