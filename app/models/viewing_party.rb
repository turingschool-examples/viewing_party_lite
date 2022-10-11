class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties

  validates :movie_id, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :duration, presence: true
end
