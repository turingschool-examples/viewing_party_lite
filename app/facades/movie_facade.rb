class MovieFacade 

    def self.search_movies(movie)
        json = MovieService.search_movies_by_title(movie)
        @movies =json[:results].map do |movie_data|
            Movie.new(movie_data)
        end 
    end 
end 