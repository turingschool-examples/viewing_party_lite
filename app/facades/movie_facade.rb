class MovieFacade 

 def self.get_movies(title)
    json = MovieService.get_movies(title)
      @movies = json[:results].map do |movie_data|
        Movie.new(movie_data)
      end 
  end

end