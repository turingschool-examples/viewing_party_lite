class MovieService
  def self.get_movie_data(movie_id)
    response = conn.get("/3/movie/#{movie_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_top_rated
    response = conn.get('/3/movie/top_rated')
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_movies_search(keyword)
    response = conn.get("/3/search/movie?query=#{keyword}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['movie_api_key']
      f.params['language'] = 'en-US'
    end
  end
end
