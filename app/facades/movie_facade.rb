class MovieFacade

   def self.top_rated
    movies = MovieService.get_top_rated
    movies[:results].map do |movie|
      Movie.new(movie)
    end
   end

   def self.find_movie(id)
     movie = MovieService.movie_details(id)
     Movie.new(movie)
   end

   def self.search_by_title(search)
     movies = MovieService.search(search)
     movies[:results].map do |movie|
       Movie.new(movie)
     end
   end
end
