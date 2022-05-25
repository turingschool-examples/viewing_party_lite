class User < ApplicationRecord
  has_many :invitations
  has_many :parties, through: :invitations
  validates_presence_of :name
  validates_presence_of :email
  validates :email, uniqueness: true
  validates_presence_of :password, require: true
  has_secure_password

  def invited_parties
    parties.where("parties.user_id != ?", id)
  end

  def hosting_parties
    parties.where("parties.user_id = ?", id)
  end
end
