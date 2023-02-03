class User < ApplicationRecord
  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties

  validates_presence_of :name
  validates_presence_of :email
  validates :email, uniqueness: true
end
