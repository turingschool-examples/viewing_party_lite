class Party < ApplicationRecord
  validates_presence_of :movie_id
  validates_presence_of :duration
  validates_presence_of :date
  validates_presence_of :start_time

  validates_numericality_of :movie_id, only_integer: true, greater_than: 0
  validates_numericality_of :duration, only_integer: true, greater_than: 0

  has_many :user_parties
  has_many :users, through: :user_parties
  
end