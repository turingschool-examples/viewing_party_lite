class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  validates_numericality_of :duration, :day, :start_time
  validates_presence_of :movie_title
end