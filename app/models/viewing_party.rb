class ViewingParty < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  validates_presence_of :movie_id, :duration, :date, :start_time
end