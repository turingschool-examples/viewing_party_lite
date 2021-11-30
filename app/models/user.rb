class User < ApplicationRecord
  has_many :parties
  has_many :user_parties
  has_many :parties, through: :user_parties

  validates :email, uniqueness: true

end
