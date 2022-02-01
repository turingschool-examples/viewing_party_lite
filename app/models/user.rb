class User < ApplicationRecord 
  validates_presence_of :name,
  :email,
  :status
  
  has_many :user_parties
  has_many :parties, through: :user_parties 
  
  enum status: {
    host: 0,
    guest: 1
  }
end
