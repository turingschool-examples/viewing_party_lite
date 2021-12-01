class MovieService
  def self.popular_movies

    conn = Faraday.new("https://api.themoviedb.org")
    response = conn.get("3/movie/popular?api_key=#{ENV['movie_api_key']}&language=en-US&page=1")

    json = JSON.parse(response.body, symbolize_names: true)

    @movies = json[:results]
    require "pry"; binding.pry
  end
end
