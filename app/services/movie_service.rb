class MovieService
  def initialize
    @conn = Faraday.new(url: "https://api.themoviedb.org")
  end

  def movie(id)
    response = @conn.get("/3/movie/#{id}?api_key=#{ENV['movie_api_key']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def top_rated
    response = @conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def image(poster_path)
    "https://image.tmdb.org/t/p/h100#{poster_path}"
  end
end
