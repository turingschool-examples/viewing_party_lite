class MovieService

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org/") do |faraday|
      faraday.params["api_key"] = ENV["movie_api_key"]
    end
  end

  def self.top_movies
    response = MovieService.conn.get('/3/movie/top_rated')

    JSON.parse(response.body, symbolize_names: true)
  end
end
