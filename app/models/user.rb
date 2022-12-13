class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: true

  has_many :user_parties
  has_many :viewing_parties, through: :user_parties

  enum role: { default: 0, manager: 1, admin: 2 }
  has_secure_password
end
