class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  has_many :party_users
  has_many :parties, through: :party_users
end
