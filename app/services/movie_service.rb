class MovieService
  def self.find_top_rated
    conn = Faraday.new(url: 'https://api.themoviedb.org')
    response = conn.get('/3/movie/top_rated') do |f|
      f.params['api_key'] = ENV['moviedb_api_key']
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end