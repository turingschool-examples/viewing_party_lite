class MoviesService
  def self.movie_search
    parse_data(conn.get('/3/discover/movie?'))
  end

  def self.top_rated
    parse_data(conn.get('/3/movie/top_rated?'))
  end

  def self.find_movie_details(movie)
    parse_data(conn.get("/3/movie/#{movie}?"))
  end

  def self.find_movie_credits(movie) 
    parse_data(conn.get("/3/movie/#{movie}/credits?"))
  end

  def self.find_movie_reviews(movie)
    parse_data(conn.get("/3/movie/#{movie}/reviews?"))
  end

  def self.parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn 
    Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['movie_api_key']
    end
  end
end
