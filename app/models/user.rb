class User < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :email, 'valid_email_2/email': true

  has_many :user_parties
  has_many :parties, through: :user_parties
end
