class ViewingParty < ApplicationRecord
  has_many :viewing_party_users
  has_many :users, through: :viewing_party_users

  validates_presence_of :movie_id, :date, :start_time, :party_duration
  validates_numericality_of :movie_id
  validates_numericality_of :party_duration, greater_than: 1, less_than: 100_000, only_integer: true
end
