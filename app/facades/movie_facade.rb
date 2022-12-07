# frozen_string_literal: true

class MovieFacade
  def self.top_rated
    json = MovieService.top_rated_movies
    top_rated_movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.searched_movies(keyword)
    json = MovieService.search(keyword)
    json[:results]&.map { |movie_data| Movie.new(movie_data) }
  end

  def self.movie_by_id(id)
    json = MovieService.find_by_id(id)
    Movie.new(json)
  end

  def self.cast(id)
    json = MovieService.find_movie_cast(id)
    MovieCast.new(json).cast
  end

  def self.reviews(id)
    json = MovieService.find_movie_reviews(id)
    MovieReviews.new(json).reviews
  end
end
