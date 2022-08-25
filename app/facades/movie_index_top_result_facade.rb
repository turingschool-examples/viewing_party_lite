class MovieIndexTopResultFacade

    def self.service
        data = MovieService.top_movies
 
        @movies = data.map do |movie|
            MovieIndexResult.new(movie)
        end   
    end 
end 