class ViewingParty < ApplicationRecord
  validates :movie_id, numericality: true
  validates :duration, numericality: true
  validates_date :date
  validates_time :start_time

  has_many :viewing_party_users
  has_many :users, through: :viewing_party_users
end