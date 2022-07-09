class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties

  validates_presence_of :movie_id, 
                        :duration,
                        :date,
                        :start_time

  def formatted_time
    start_time.strftime("%l:%M %p")
  end

  def movie_title
    # binding.pry
    movie = MovieFacade.movie_id_search(movie_id)
    movie.title
  end
end
