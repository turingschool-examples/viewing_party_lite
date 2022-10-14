class Party < ApplicationRecord
  validates_presence_of :duration
  validates_presence_of :date
  validates_presence_of :start_time
  validates_presence_of :movie_id

  validates_numericality_of :duration

  has_many :user_parties
  has_many :users, through: :user_parties

  def movie(movie_id)
    MoviesFacade.movie_details(movie_id)
  end
end
