class MovieFacade

  def self.top_rated

      movies = []
      data = MovieService.top_rated_endpoint
      data.each do |movie|
        movies << Movie.new(movie)
      end 
      movies
  end
  

end 