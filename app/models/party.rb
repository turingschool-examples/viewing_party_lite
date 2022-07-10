class Party < ApplicationRecord
  has_many :party_users
  has_many :users, through: :party_users

  validates_presence_of :duration, :date, :time, :user_id, :movie_id, :user_name
end