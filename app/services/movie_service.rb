class MovieService
  def self.get_movies(movie)
    JSON.parse(connection(movie).get.body)
  end

  private
  
  def self.connection
    Faraday.new( 
      url: "https://api.themoviedb.org/3/movie/#{movie}",
      params: { api_key: ENV['MOVIE_DB_KEY'] }
    )
  end
end