class MovieService

  def self.get_top_rated_movies
    conn = Faraday.new(url: "https://api.themoviedb.org")
    response = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}")
    data = JSON.parse(response.body, symbolize_names: true)
    data[:results]
  end
end
