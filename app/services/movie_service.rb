require "pry"

class MovieService
  def self.get_top_movies
    response1 = conn.get("/3/movie/top_rated?api_key=#{api_key}")
    response2 = conn.get("/3/movie/top_rated?api_key=#{api_key}&page=2")
    parsed1 = JSON.parse(response1.body, symbolize_names: true)
    parsed2 = JSON.parse(response2.body, symbolize_names: true)
    parsed1[:results] + parsed2[:results]
  end

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org")
  end

  def self.api_key
    ENV["movie_api_key"]
  end
end
