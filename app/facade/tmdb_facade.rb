require 'pry'
require './app/poros/movie'
require './app/services/tmdb_service'

class TMDBFacade
  def self.top_rated_movies
    json = TmdbService.top_rated_movies
    json.map do |data|
      Movie.new(data)
    end 
  end

  def self.keyword(search_term)
    json = TmdbService.keyword(search_term)
    json.map do |data|
      Movie.new(data)
    end     
  end
end 