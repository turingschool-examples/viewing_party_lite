class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties

  validates_numericality_of :duration
  validates_presence_of :date, :duration, :movie_id, :start_time
end
