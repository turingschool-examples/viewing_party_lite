class Party < ApplicationRecord
  validates_presence_of :movie_name
  validates_presence_of :movie_id
  validates_presence_of :date
  validates_presence_of :start_time
  validates_presence_of :duration

  has_many :party_users
  has_many :users, through: :party_users
end
