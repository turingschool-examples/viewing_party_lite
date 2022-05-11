require "pry"

class MovieService
  def self.get_top_movies
    response = conn.get("/3/movie/top_rated?api_key=b0fe2ee18134887b543f4c27638b2b64")
    wip = JSON.parse(response.body, symbolize_names: true)
    result = wip[:results]
  end

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org")
  end

  def self.api_key
    ENV["movie_api_key"]
  end
end
