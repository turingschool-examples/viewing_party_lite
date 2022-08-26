class MovieFacade
  def self.get_top_movies #being called from movies controller
    movies = MovieService.top_rated_movies #calls into movie service class top rated movies method
    movies[:results][0..39].map do |movie| 
      Movie.new(movie) #time for some ruby objects from the movie poros
    end
  end

  # def service
  #   MovieService.new
  # end
  
  def self.get_movie_search_facade(keyword) #being called from movies controller with params[:search]
    # binding.pry
    # service.movie_searching_service(keyword)
    movies = MovieService.movie_searching_service(keyword) #facade grabs the service with endpoint while sending param to service
    # binding.pry
    movies[:results].map do |movie| 
      Movie.new(movie) #time for some ruby objects from the movie poros
    end
  end
  
end