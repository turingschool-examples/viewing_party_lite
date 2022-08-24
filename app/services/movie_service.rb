class MovieService

  def self.get_conn
    Faraday.new("https://api.themoviedb.org")
  end

  def self.get_top_movies
    data = get_conn.get("/movie/top_rated")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search_movie
    
  end
  
end