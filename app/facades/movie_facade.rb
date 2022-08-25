  class MovieFacade
    def self.create_top_movies  
      movies = MovieService.get_top_rated
      movies[0..39].map do |movie|
        Movie.new(movie)
      end
    end
  end