class ViewingParty < ApplicationRecord
  validates_presence_of :movie_title, :duration, :date, :start_time
  validates_numericality_of :duration, greater_than: 0

  has_many :user_parties
  has_many :users, through: :user_parties
end
