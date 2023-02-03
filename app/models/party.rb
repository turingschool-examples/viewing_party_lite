class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  validates_presence_of :duration, :start_time

  def movie
    MovieFacade.find_movie(self.movie_id)
  end
end
