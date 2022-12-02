require_relative '../services/movie_service'

class MovieFacade
  def self.movie_title(movie_id)
    MovieService.movie_details(movie_id)[:title]
  end

  def self.movie_image(movie_id)
    MovieService.movie_details(movie_id)[:poster_path]
  end

  def self.vote_average(movie_id)
    MovieService.movie_details(movie_id)[:vote_average]
  end
end