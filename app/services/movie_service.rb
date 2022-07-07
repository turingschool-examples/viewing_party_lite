class MovieService

  def self.top_movies
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['api_key'] = ENV['api_key']
    end
    response = conn.get("/3/movie/top_rated?api_key=#{ENV['api_key']}")

    data = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end

end
