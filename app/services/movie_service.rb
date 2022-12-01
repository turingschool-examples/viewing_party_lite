class MovieService
  def self.find_movie_by_id(id)
    response = conn.get("/3/movie/#{id}/external_ids?-US")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_top_rated
    response = conn.get('/3/movie/top_rated?-US')
    JSON.parse(response.body, symbolize_names: true)[:results][0..19]
  end

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
      faraday.params['language'] = ['en']
      faraday.adapter Faraday.default_adapter
    end
  end
end
