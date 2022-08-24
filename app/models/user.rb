class User < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :viewing_parties, dependent: :destroy
  has_many :viewing_party_users
  has_many :viewing_parties, through: :viewing_party_users


end
