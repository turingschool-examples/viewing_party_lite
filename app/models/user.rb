class User < ApplicationRecord
  validates_presence_of :name, :email
  validates_uniqueness_of :email

  has_many :user_parties
  has_many :viewing_parties, through: :user_parties
end