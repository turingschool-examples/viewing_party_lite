class MovieService
  def self.get_movie(id)
    response = connection.get("movie/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  
  def self.connection
    Faraday.new( 
      url: "https://api.themoviedb.org/3/",
      params: { api_key: ENV['MOVIE_DB_KEY'] }
    )
  end
end