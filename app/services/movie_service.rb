class MovieService
  def self.details(movie_id)
    response = conn.get("/3/movie/#{movie_id}")
    status_check(response)
  end

  def self.top_rated
    response = conn.get('/3/movie/top_rated')
    status_check(response)
  end

  def self.search(search_term)
    query = search_term.gsub(' ', '%20')
    response = Faraday.get("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['TMDB_API_KEY']}&language=en-US&query=#{query}&page=1&include_adult=false")
    status_check(response)
  end

  def self.reviews(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews")
    status_check(response)
  end

  def self.credits(movie_id)
    response = conn.get("/3/movie/#{movie_id}/credits")
    status_check(response)
  end

  def self.status_check(response)
    JSON.parse(response.body, symbolize_names: true) if response.status == 200
  end

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org', params: { api_key: ENV['TMDB_API_KEY'] })
  end
end
