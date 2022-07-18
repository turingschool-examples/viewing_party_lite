class User < ApplicationRecord
  has_many :party_users
  has_many :parties, through: :party_users

  validates_presence_of :name, :email
  validates :email, uniqueness: true
  validates_presence_of :password_digest
  validates :username, uniqueness: true, presence: true
end