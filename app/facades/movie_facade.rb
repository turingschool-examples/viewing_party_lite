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

    def self.search_movies(search_term)
        movies = MovieService.search_movies
        if data != nil
            movies = data[:results][0][:title]
    
            found_movies = movies.find_all.include?(search_term)
            Movie.new(found_movies)
        else
            nil
        end
    end
end