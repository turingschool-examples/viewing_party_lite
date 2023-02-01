class TopRatedMovieService
  def movies
    JSON.parse(conn.body)
  end

  private

  def conn
    Faraday.new(
      url: "https://api.themoviedb.org/3/movie/top_rated",
      params: {api_key: ENV['MOVIE_DB_KEY'] }
    )
  end
  
end