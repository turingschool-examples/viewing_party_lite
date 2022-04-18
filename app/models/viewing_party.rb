class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties

  validates_presence_of :movie_id
  validates_presence_of :host_id
  validates_presence_of :duration
  validates_presence_of :start_time
  validates_presence_of :date_time
end
