class User < ApplicationRecord
  validates_presence_of :name,
                        :email,
                        :status, 
                        :password_digest

  validates :email, uniqueness: true
  
  has_many :user_parties
  has_many :parties, through: :user_parties

  has_secure_password 
  
  enum status: {
    host: 0,
    guest: 1
  }
end
