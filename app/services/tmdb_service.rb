require 'faraday' 
require 'pry'

class TmdbService
  def self.get_url(url)
    Faraday.new(url)
  end

  def self.top_rated_movies
    json_pages = []
    conn = get_url("https://api.themoviedb.org")
    response = conn.get("/3/movie/top_rated?api_key=#{ENV['tmdb_key']}")
    response_2 = conn.get("/3/movie/top_rated?api_key=#{ENV['tmdb_key']}&page=2")
    json = JSON.parse(response.body, symbolize_names: true)
    json_2 = JSON.parse(response_2.body, symbolize_names: true)
    json_pages << json[:results] 
    json_pages << json_2[:results]
    json_pages.flatten
  end
end
