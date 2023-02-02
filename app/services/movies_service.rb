class MoviesService
  def self.movie_search
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['movie_api_key']
    end
    parse_data(conn.get('/3/discover/movie?'))
  end

  def self.parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.top_rated
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['movie_api_key']
    end

    parse_data(conn.get('/3/movie/top_rated?'))
  end

  def self.find_movie_details(movie)
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['movie_api_key']
    end
    parse_data(conn.get("/3/movie/#{movie}?"))
  end
end
