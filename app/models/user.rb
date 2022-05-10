class User < ApplicationRecord
  has_many :invitations
  has_many :parties, through: :invitations
  validates_presence_of :name
  validates_presence_of :email
  validates :email, uniqueness: true
end
