class MoviesService
  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['api_key']
    end
  end

  def self.search_by_title(title)
    response = conn.get('/3/search/movie', { query: title })
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.top_rated
    response = conn.get('/3/movie/top_rated')
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_details(movie_id)
    response = conn.get("/3/movie/#{movie_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_credits(movie_id)
    response = conn.get("3/movie/#{movie_id}/credits")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_reviews(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews")
    JSON.parse(response.body, symbolize_names: true)
  end
end

