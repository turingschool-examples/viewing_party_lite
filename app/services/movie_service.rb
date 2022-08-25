class MovieService
  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org/') do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end
  end

  def self.search(query)
    response = MovieService.conn.get("/3/search/movie?&query=#{query}")
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def self.top_rated
    response = MovieService.conn.get('/3/movie/top_rated')
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def self.details(id)
    response = MovieService.conn.get("/3/movie/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.cast(id)
    response = MovieService.conn.get("/3/movie/#{id}/credits")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.reviews(id)
    response = MovieService.conn.get("/3/movie/#{id}/reviews")
    JSON.parse(response.body, symbolize_names: true)
  end
end
