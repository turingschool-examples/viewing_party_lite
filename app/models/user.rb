class User < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  validates_presence_of :name, :email
  validates :email, uniqueness: true
  validates :username, uniqueness: true, presence: true

  #needed to allow bcrypt to create a passowrd_digest from password input
  has_secure_password
end
