require 'json'

class MoviesService
  def self.top_rated
    conn = Faraday.new(url: "https://api.themoviedb.org")
    response = conn.get("/3/movie/top_rated?api_key=#{ENV['tmdb-api']}")

    JSON.parse(response.body, symbolize_names: true)
  end
end