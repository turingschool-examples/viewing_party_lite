# frozen_string_literal: true

class MovieFacade
  # being called from movies controller
  def self.get_top_movies
    movies = MovieService.top_rated_movies # calls into movie service class top rated movies method
    movies[:results][0..39].map do |movie|
      Movie.new(movie) # time for some ruby objects from the movie poros
    end
  end

  # being called from movies controller with params[:search]
  def self.get_movie_search_facade(keyword)
    movies = MovieService.movie_searching_service(keyword) # facade grabs the service with endpoint while sending param to service
    movies[:results].map do |movie|
      Movie.new(movie) # time for some ruby objects from the movie poros
    end
  end
end
