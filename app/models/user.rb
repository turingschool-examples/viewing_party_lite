class User < ApplicationRecord

  has_many :user_parties
  has_many :parties, through: :user_parties
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email
  validates_presence_of :password_digest, require: true

end
