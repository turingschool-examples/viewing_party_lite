require 'faraday' 

class TmdbService
  def self.get_url(url)
    Faraday.new(url)
  end

  def self.top_rated_movies 
    conn = get_url("https://api.themoviedb.org")

    response = conn.get("/3/movie/top_rated?api_key=#{ENV['tmdb_key']}")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results]
  end
end