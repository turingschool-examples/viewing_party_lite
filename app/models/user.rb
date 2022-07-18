# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties
  validates_presence_of :name
  validates_presence_of :password_digest
  validates :email, presence: true, uniqueness: true
  
  has_secure_password
  
  def self.other_users(id)
    User.where.not(id: id)
  end
end
