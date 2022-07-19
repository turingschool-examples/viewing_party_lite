class User < ApplicationRecord
  has_many :viewing_parties
  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password_digest
  has_secure_password 
end
