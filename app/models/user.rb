class User < ApplicationRecord
  has_many :invitations
  has_many :parties, through: :invitations
  validates :email, uniqueness: true
end
