class User < ApplicationRecord
  validates :name, :email, :password_digest, :password_confirmation, presence: true
  validates :email, uniqueness: true

  has_many :user_parties
  has_many :viewing_parties, through: :user_parties

  has_secure_password
end
