class Party < ApplicationRecord
  has_many :party_users
  has_many :users, through: :party_users

  validates_presence_of :date, :start_time, :host_id, :movie_id
end
