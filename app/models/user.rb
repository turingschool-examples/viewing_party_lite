class User < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  # validates_presence_of(:password_digest)}

  has_secure_password

  has_many :viewing_parties, dependent: :destroy
  has_many :viewing_party_users
  has_many :viewing_parties, through: :viewing_party_users


end
