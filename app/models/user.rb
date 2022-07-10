class User < ApplicationRecord
  validates_presence_of  :name
  validates_presence_of  :email 
  validates_uniqueness_of :email
  has_many :party_users
  has_many :parties, through: :party_users
end
