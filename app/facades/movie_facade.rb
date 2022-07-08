# frozen_string_literal: true

class MovieFacade
  def self.top_rated_movies
    json = MovieService.top_rated_movies(1)
    json2 = MovieService.top_rated_movies(2)

    top_40 = json[:results] + json2[:results]

    @movies = top_40.map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.movie_details(id)
    json = MovieService.movie_details(id)
    Movie.new(json)
  end
end
