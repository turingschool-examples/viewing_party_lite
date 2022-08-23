class Party < ApplicationRecord
  has_many :party_users
  has_many :users, through: :party_users
  validates_presence_of :movie
  validates_presence_of :date
  validates_presence_of :start_time
  validates_numericality_of :duration
end