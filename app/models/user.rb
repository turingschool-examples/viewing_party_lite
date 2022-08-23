class User < ApplicationRecord
    validates :email, uniqueness: true
    validates_presence_of :name

    has_many :party_users
    has_many :viewing_parties, through: :party_users
  end