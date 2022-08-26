class MovieService

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end
  end

  def self.top_rated
    response = conn.get('/3/movie/top_rated')
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.movies_by_keyword(keyword)
    response = conn.get("/3/search/movie?query=#{keyword}")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_details(id)
    response = conn.get("/3/movie/#{id}") 
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_cast(id)
    response = conn.get("/3/movie/#{id}/credits") 
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_movie_reviews(id)
    response = conn.get("/3/movie/#{id}/reviews")
    json = JSON.parse(response.body, symbolize_names: true)
  end
end