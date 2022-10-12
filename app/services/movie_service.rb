class MovieService
  def self.conn
    Faraday.new('https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV.fetch('api_key', nil)
    end
  end

  def self.top_rated
    response = conn.get('/3/movie/top_rated')
    json = JSON.parse(response.body, symbolize_names: true)
  end
end
