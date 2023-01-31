class MovieService
  def initialize
    @conn = Faraday.new(url: "https://api.themoviedb.org/3") do |faraday|
      faraday.headers['api_key'] = ENV['movie_api_key']
    end
  end

  def movie(id)
    response = @conn.get("/movie/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
