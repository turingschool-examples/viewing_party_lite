# frozen_string_literal: true

class MovieFacade
  def self.create_top_20_movies
    movies = MovieService.get_top_rated
    movies.map do |movie_data|
      Movies.new(movie_data)
    end
  end

  def self.movie_search(search_param)
    movies = MovieService.get_movie_search(search_param)
    movies.map do |movie_data|
      Movies.new(movie_data)
    end
  end

  def self.create_individual_movie(id)
    response = MovieService.get_indvidual_movie(id)
    Movie.new(response)
  end

  def self.create_cast(id)
    response = MovieService.get_cast(id)[:cast].map do |member|
      name = member[:name]
      character = member[:character]
      "#{name} - #{character}"
    end
  end

  def self.create_reviews(id)
    response = MovieService.get_reviews(id)[:results].map do |review|
      author= review[:author]
      content = review[:content]
      "#{author} - #{content}"
    end
  end
end
