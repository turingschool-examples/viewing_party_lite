class MovieIndexSearchResultFacade

    def self.service(search_string)
        data = MovieService.movie_search(search_string)
 
        @movies = data.map do |movie|
            MovieIndexResult.new(movie)
        end 
        
    end 

end 