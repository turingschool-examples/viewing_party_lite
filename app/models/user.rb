class User < ApplicationRecord
  has_many :viewing_party_users, dependent: :destroy
  has_many :viewing_parties, through: :viewing_party_users
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end