class User < ApplicationRecord
  has_many :user_parties
  has_many :parties, through: :user_parties

  validates_presence_of :name, :email

  validates :email, uniqueness: true
  validates_presence_of :password_digest, require: true
  has_secure_password
end
