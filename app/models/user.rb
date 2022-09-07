class User < ApplicationRecord
    validates_presence_of :name
    validates_presence_of :email
    validates :email, uniqueness: true

    validates_presence_of :password_digest
    has_secure_password
    
    has_many :party_users
    has_many :viewing_parties, through: :party_users
  end
