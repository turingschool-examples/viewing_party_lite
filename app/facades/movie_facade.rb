class MovieFacade

    def self.service(movie_id)
        data1 = MovieService.movie_data(movie_id)
        data2 = MovieService.cast_data(movie_id)
        data3 = MovieService.review_data(movie_id)

        @movie = Movie.new(data1, data2, data3)
    end 

end 