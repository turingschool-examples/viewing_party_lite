class MovieFacade 
    def self.top_movies
        top_movies = MovieService.get_top_movies
        top_movies.map do |data|
            TopMovie.new(data)
        end
    end
    
    def self.movie(id)
        movie = MovieService.get_movie(id)
        Movie.new(movie)
    end

    # def service 
    #     MovieService.new
    # end

    def self.search_movies(search_term)
        movies = MovieService.search_movies(search_term)
        if movies != nil
            movies.map do |data|
                TopMovie.new(data)
            end
        else
            nil
            flash[:alert] = "No results found!"
        end
    end
end