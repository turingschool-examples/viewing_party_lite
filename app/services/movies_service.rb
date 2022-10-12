class MoviesService
  def self.top_movies
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['api_key']
    end

    response = conn.get("/3/movie/top_rated")
    json = JSON.parse(response.body, symbolize_names: true)
  end
end