require 'json'

class MoviesService
  # before_action :set_conn, only: [:top_rated, :search]

  def self.top_rated
    conn = Faraday.new(url: "https://api.themoviedb.org")
    response = conn.get("/3/movie/top_rated?api_key=#{ENV['tmdb-api']}")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search(keyword)
    conn = Faraday.new(url: "https://api.themoviedb.org")
    response = conn.get("/3/search/movie?query=#{keyword}&api_key=#{ENV['tmdb-api']}")
    
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def set_conn
    @conn = Faraday.new(url: "https://api.themoviedb.org")
  end
end