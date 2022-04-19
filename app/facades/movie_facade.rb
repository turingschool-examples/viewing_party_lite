# frozen_string_literal: true

class MovieFacade
  def self.top_rated
    json = MovieService.top_rated

    @top_rated = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.movie_title_search(query)
    json = MovieService.movie_title_search(query)

    @movie_results = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.movie_id_search(id)
    json = MovieService.movie_id_search(id)
    Movie.new(json)
  end
end
