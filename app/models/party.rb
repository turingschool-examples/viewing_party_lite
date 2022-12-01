class Party < ApplicationRecord
  has_many :party_users
  has_many :users, through: :party_users

  def invited_users
    users.where('party_users.host = ?', false).pluck(:name)
  end
end
