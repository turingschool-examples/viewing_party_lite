class MovieService
  def self.movie_id
    response = conn.get("/3/movie/{movie_id}/external_ids?api_key=#{ENV['movie_api_key']}&language=en-US&page=1")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.top_rated
    response = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&language=en-US&page=1")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
      faraday.adapter Faraday.default_adapter
    end
  end
end
