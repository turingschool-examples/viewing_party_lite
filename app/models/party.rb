class Party < ApplicationRecord
  has_many :party_users
  has_many :users, through: :party_users
  validates_numericality_of :movie_id
  validates_presence_of :start_time
  validates_numericality_of :duration
end