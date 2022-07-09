# frozen_string_literal: true

class MovieFacade
  def self.top_20_movies
    movie_data = MovieService.top_20_movies

    movie_data.map do |movie_json|
      Movie.new(movie_json)
    end
  end

  def self.movie_by_keyword(keyword)
    movie_data = MovieService.movie_by_keyword(keyword)

    movie_data.map do |movie_json|
      Movie.new(movie_json)
    end
  end

  def self.movie_details(id)
    movie_data = MovieService.movie_details(id)
    Movie.new(movie_data)
  end

  def self.movie_cast(id)
    cast_data = MovieService.movie_cast(id).first(10)
    cast_data.map do |person|
      person[:name]
    end
  end

  def self.movie_reviews(id)
    review_data = MovieService.movie_reviews(id)
    review_data.map do |review|
      Movie.new(review)
    end
  end
end
