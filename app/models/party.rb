class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  validates_numericality_of :duration
  validates_presence_of :movie_title, :day, :start_time
  validates :duration, comparison: { greater_than: :start_time }
end