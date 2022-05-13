class MovieFacade

  def self.top_rated
      conn = Faraday.new(url: "https://api.themoviedb.org") 
      response = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_db_key']}")
      data = JSON.parse(response.body, symbolize_names: true)
      movies = []
      data[:results].each do |movie|
        movies << Movie.new(movie)
      end 
      movies
  end
  

end 