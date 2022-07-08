class MovieFacade
  def self.top_rated
    top_movies = []
    top_movies_1 = MovieService.get_top_rated(1)
    top_movies_2 = MovieService.get_top_rated(2)
    top_movies_1[:results].each do |movie|
      top_movies << movie
    end
    top_movies_2[:results].each do |movie|
      top_movies << movie
    end
    top_movie_poros = []
    top_movies.each do |movie|
      top_movie_poros << Movie.new(movie)
    end
    return top_movie_poros
  end
end
