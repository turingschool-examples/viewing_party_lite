class Party < ApplicationRecord
  validates_presence_of :duration
  validates_presence_of :start_time
  validates_presence_of :host
  validates_presence_of :movie_id

  has_many :party_users
  has_many :users, through: :party_users
end
