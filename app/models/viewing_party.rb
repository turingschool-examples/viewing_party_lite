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

  def formatted_date
    date.strftime("%b %-d, %Y")
  end

  def movie_title
    movie = MovieFacade.movie_id_search(movie_id)
    movie.title
  end

  def poster_path
    movie = MovieFacade.movie_id_search(movie_id)
    movie.poster
  end
end
