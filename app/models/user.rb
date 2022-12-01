class User < ApplicationRecord
  has_many :party_users
  has_many :parties, through: :party_users

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def parties_invited_to
    parties.where('party_users.host = ?', false)
  end
end
