class MoviesFacade
  def self.top_rated
    top_movies = MoviesService.get_top_rated

    top_movies[0..39].map do |movie|
      Movie.new(movie)
    end
  end

  def self.search(keyword)
    search_results = MoviesService.find_movies(keyword)

    search_results[0..39].map do |movie|
      Movie.new(movie)
    end
  end

  def self.movie(id)
    movie = MoviesService.get_movie(id)
    Movie.new(movie)
  end

  def movie_reviews; end
end
