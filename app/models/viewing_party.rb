class ViewingParty < ApplicationRecord
  has_many :user_viewing_party
  has_many :users, through: :user_viewing_party

  validates_presence_of :movie_id, :duration, :date, :start_time
end
