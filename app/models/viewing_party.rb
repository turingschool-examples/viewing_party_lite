class ViewingParty < ApplicationRecord
  has_many :viewing_party_users
  has_many :users, through: :viewing_party_users

  validates_presence_of :movie_id, :date, :start_time, :party_duration
  validates_numericality_of :movie_id, :party_duration
end
