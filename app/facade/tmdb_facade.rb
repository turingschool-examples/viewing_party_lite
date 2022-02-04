require 'pry'
require './app/poros/movie'
require './app/services/tmdb_service'

class TmdbFacade
  def self.top_rated_movies
    page_1 = TmdbService.top_rated_movies(1)[:results]
    page_2 = TmdbService.top_rated_movies(2)[:results]
    
    json = page_1 + page_2

    json.map do |data|
      Movie.new(data)
    end 
  end

  def self.keyword(search_term)
    page_1 = TmdbService.keyword(search_term)[:results]
    page_2 = TmdbService.keyword(search_term, 2)[:results]
    
    json = page_1 + page_2

    json.map do |data|
      Movie.new(data)
    end     
  end

  def self.reviews(movie_id) 
    json = TmdbService.reviews(movie_id)
    json[:results].map do |data|
      Review.new(data)
    end
  end
end 