class Party < ApplicationRecord
  validates :start_time, :duration, :movie_title, presence: true
  has_many :party_users
  has_many :users, through: :party_users
end
