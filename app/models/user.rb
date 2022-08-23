class User < ApplicationRecord
  has_many :user_parties
  has_many :parties, through: :user_parties
  validates_presence_of :name, presence: true
  validates_presence_of :email, presence: true, uniqueness: true
end