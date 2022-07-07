class User < ApplicationRecord
  validates_presence_of :email, uniquness: true
  validates_presence_of :name

  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties
end
