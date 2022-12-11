class User < ApplicationRecord
  has_many :party_users
  has_many :parties, through: :party_users

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def parties_invited_to
    parties.where('party_users.host = ?', false)
  end

  def parties_hosting
    parties.where('party_users.host = ?', true)
  end

  def other_users
    User.where('id != ?', id)
  end
end
