class User < ApplicationRecord
  has_many :party_users
  has_many :parties, through: :party_users

  validates_presence_of :name, :email
  validates :email, uniqueness: true
  validates_presence_of :password

  has_secure_password

  enum role: %w(default manager admin)
end