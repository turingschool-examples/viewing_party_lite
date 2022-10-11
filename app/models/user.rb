class User < ApplicationRecord
  validates_presence_of :email
  validates_presence_of :name

  has_many :user_parties
  has_many :parties, through: :user_parties
  
end