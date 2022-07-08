class MovieService
  
  def self.conn
    Faraday.new("https://api.themoviedb.org")
  end

  def self.api_key
    ENV["movies_api_key"]
  end

  def self.get_top_movies
    response = conn.get("/3/movie/top_rated?api_key=#{api_key}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
