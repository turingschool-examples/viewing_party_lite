require 'bcrypt'

class User < ApplicationRecord
  has_many :user_parties
  has_many :parties, through: :user_parties

  validates_presence_of :name, :email
  validates_uniqueness_of :email

  validates :password_digest, presence: true, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create
 
  has_secure_password
  
  def hosted_parties
    parties.where(host_id: id)
  end

  def invited_parties
    parties.where.not(host_id: id)
  end
end
