class MovieService
  def self.conn
    Faraday.new('https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV.fetch('api_key', nil)
    end
  end

  def self.top_rated
    response = conn.get('/3/movie/top_rated')
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search(movie_title)
    response = conn.get('/3/search/movie', query: movie_title)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_details(movie_id)
    response = conn.get("/3/movie/#{movie_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_reviews(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_credits(movie_id)
    response = conn.get("/3/movie/#{movie_id}/credits")
    JSON.parse(response.body, symbolize_names: true)
  end
end
