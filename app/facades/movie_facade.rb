require_relative '../services/movie_service'
require_relative '../poros/min_movie'

class MovieFacade

  def self.movie_card(movie_id)
    MinMovie.new(MovieService.movie_details(movie_id))
  end

  def self.top_rated(page = 1)
    movies = []
    MovieService.top_rated(page)[:results]
                .each { |result| movies << MinMovie.new(result) }
    movies
  end

  def self.search(query, page = 1)
    movies = []
    MovieService.search(query, page)[:results]
                .each { |result| movies << MinMovie.new(result) }
    movies
  end


  def self.new_movie_details(movie_id)
    movie_details = MovieService.movie_details(movie_id)
    movie_reviews = MovieService.movie_reviews(movie_id)
    movie_credits = MovieService.movie_credits(movie_id)
    Movie.new(movie_details, movie_reviews, movie_credits)
  end
end

