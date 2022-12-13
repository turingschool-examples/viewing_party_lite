class MovieService
  def self.get_movie_by_id(id)
    response = conn.get("/3/movie/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_top_rated
    response = conn.get('/3/movie/top_rated?')
    JSON.parse(response.body, symbolize_names: true)[:results][0..19]
  end

  def self.get_movie_search(movie_string)
    response = conn.get("/3/search/movie?query=#{movie_string}")
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
      faraday.params['language'] = ['en-US']
      faraday.adapter Faraday.default_adapter
    end
  end
end
