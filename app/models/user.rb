class User < ApplicationRecord
  has_many :party_users
  has_many :parties, through: :party_users

  validates_presence_of :name
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  has_secure_password
end