class User < ApplicationRecord
  has_many :user_parties
  has_many :parties, through: :user_parties

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
