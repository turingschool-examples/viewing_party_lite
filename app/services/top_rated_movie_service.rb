class TopRatedMovieService
  def self.movies
    JSON.parse(conn.get.body)
  end

  private

  def self.conn
    Faraday.new(
      url: "https://api.themoviedb.org/3/movie/top_rated",
      params: {api_key: ENV['MOVIE_DB_KEY'] }
    )
  end
  
end