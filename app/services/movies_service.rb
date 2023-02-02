class MoviesService
  def self.movie_search
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['movie_api_key']
    end
    self.parse_data(conn.get('/3/discover/movie?'))
  end

  def self.parse_data(response) 
    JSON.parse(response.body, symbolize_names: true)
  end
end
