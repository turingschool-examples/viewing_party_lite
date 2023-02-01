class MovieService
  def initialize
    # @conn = Faraday.new(url: "https://api.themoviedb.org/3")
  end

  def movie(id)
    conn = Faraday.new(url: "https://api.themoviedb.org/3")
    response = conn.get("/3/movie/#{id}?api_key=#{ENV['movie_api_key']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  # def image(poster_path)
  #   Faraday.get("https://image.tmdb.org/t/p/w200#{poster_path}")
  #   conn = Faraday.new(url: "https://image.tmdb.org")
  #   response = conn.get("/t/p/w200#{poster_path}",
  #   "Content-Type" => "image/jpeg").body
  # end
end
