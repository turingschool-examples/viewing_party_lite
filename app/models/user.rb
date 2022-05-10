class User < ApplicationRecord
  validates_presence_of :name, :email
  validates_uniqueness_of :email

  has_many :attendees
  has_many :parties
  has_many :parties, through: :attendees
end 