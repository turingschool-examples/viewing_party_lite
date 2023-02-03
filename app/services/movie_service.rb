class MovieService
  def self.get_movie(id)
    JSON.parse(conn.get("movie/#{id}").body, symbolize_names: true)
  end

   def self.top_rated_movies
    JSON.parse(conn.get("movie/top_rated").body, symbolize_names: true)
  end

  def self.get_cast(id)
    JSON.parse(conn.get("movie/#{id}/credits").body, symbolize_names: true)
  end

  def self.search(query)
    JSON.parse(conn.get("search/movie?query=#{query}").body, symbolize_names: true)
  end
  
  def self.get_reviews(id)
    JSON.parse(conn.get("movie/#{id}/reviews").body, symbolize_names: true)
  end
  
  private
  
  def self.conn
    Faraday.new( 
      url: "https://api.themoviedb.org/3/",
      params: { api_key: ENV['MOVIE_DB_KEY'] }
    )
  end
end