class Party < ApplicationRecord
  belongs_to :movie
  has_many :party_users
  has_many :users, through: :party_users

  def find_host
    party_users.where('is_host = ?', true).pluck('user_id').first
  end
end
