class MovieFacade 
    def self.top_movies
        top_movies = MovieService.get_top_movies
        binding.pry
        top_movies.map do |data|
            TopMovie.new(data)
        end
    end
    
    def self.movie(id)
        movie = MoviceService.get_movie(id)
        Movie.new(movie)
    end

    def service 
        MovieService.new
    end
end