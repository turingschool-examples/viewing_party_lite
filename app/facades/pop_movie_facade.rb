class PopMovieFacade
  def self.movies
    pop_movies = MovieService.call_api("/discover/movie?api_key=05946dc2dc50df636962153f45926dbe&sort_by=vote_average.desc")

    40.times do
      pop_movies.map do |pop_movie|
        PopMovie.new(pop_movie)
      end
    end

  end
end
