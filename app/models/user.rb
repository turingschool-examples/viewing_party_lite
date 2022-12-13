class User < ApplicationRecord
  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties

  validates :name, presence: true 
  validates :email, presence: true, uniqueness: true 
  validates_presence_of :password, confirmation: true
  validates :password_confirmation, presence: true

  has_secure_password
end