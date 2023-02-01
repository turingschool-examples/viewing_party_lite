class MovieService
  def initialize
    @conn = Faraday.new(url: "https://api.themoviedb.org/3")
  end

  def movie(id)
    response = @conn.get("/3/movie/#{id}?api_key=#{ENV['movie_api_key']}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
