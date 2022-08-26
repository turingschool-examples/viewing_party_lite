class ViewingParty < ApplicationRecord
  validates_presence_of :movie_id, :host_id
  validates :duration, presence: true, numericality: true
  validates :eventdate, presence: true
  validates :starttime, presence: true

  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties
end
