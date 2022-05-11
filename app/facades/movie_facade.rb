class MovieFacade

   def self.top_rated

    movies = MovieService.get_top_rated
    movies[:results].map do |movie|
      Movie.new(movie)
    end

   end

end
