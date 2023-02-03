class ViewingParty < ApplicationRecord
  has_many :invitees
  has_many :users, through: :invitees

  validates_presence_of :duration, :when, :start_time

  def find_movie
    Movie.where('api_id = ?', self.movie_id)[0]
  end
end
