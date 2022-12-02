# frozen_string_literal: true

class MovieFacade
  def initialize(param)
    @search_param = param
    @service = MovieService.new
  end

  def top_rated
    json = @service.top_rated_movies
    top_rated_movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def searched_movies
    json = @service.search(@search_param)
    json[:results]&.map { |movie_data| Movie.new(movie_data) }
  end

  def movie_by_id
    json = @service.find_by_id(@search_param)
    Movie.new(json)
  end

  def cast
    json = @service.find_movie_cast(@search_param)
    MovieCast.new(json).cast
  end

  def reviews
    json = @service.find_movie_reviews(@search_param)
    MovieReviews.new(json).reviews
  end
end
