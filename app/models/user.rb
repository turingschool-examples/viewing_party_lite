class User < ApplicationRecord
  has_many :party_invitees
  has_many :parties, through: :party_invitees

  validates_presence_of :name
  validates_presence_of :email
end
