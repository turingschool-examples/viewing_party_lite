require 'json'
#limit in the service via params (length, page number, etc)
class MoviesService
  def self.conn
    Faraday.new(url: "https://api.themoviedb.org")
  end

  def self.top_rated
    # conn = Faraday.new(url: "https://api.themoviedb.org")
    response = conn.get("/3/movie/top_rated?api_key=#{ENV['tmdb-api']}")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search(keyword)
    # conn = Faraday.new(url: "https://api.themoviedb.org")
    response = conn.get("/3/search/movie?query=#{keyword}&api_key=#{ENV['tmdb-api']}")
    
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.details(movie_id)
    # conn = Faraday.new(url: "https://api.themoviedb.org")
    response = conn.get("/3/movie/#{movie_id}?api_key=#{ENV['tmdb-api']}&append_to_response=credits,reviews")

    JSON.parse(response.body, symbolize_names: true)
  end
end