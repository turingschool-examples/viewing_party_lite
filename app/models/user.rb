class User < ApplicationRecord
  has_secure_password

  has_many :party_users
  has_many :viewing_parties, through: :party_users

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password_digest, presence: true

  enum role: %w[default manager admin]
end
