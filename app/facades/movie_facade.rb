class MovieFacade
  def self.top_movie
    results = MovieService.get_top_movie
    results.map do |result|
      Movie.new(result)
    end
  end

  def self.search(params)
    results = MovieService.get_search_movie(params)
    results.map do |result|
      Movie.new(result)
    end
  end

  def self.movie_details(movie_id)
    movie_details = MovieService.get_movie_details(movie_id)
    movie_cast = MovieService.get_cast(movie_id)
    movie_reviews = MovieService.get_reviews(movie_id)
    MovieDetail.new(movie_details, movie_cast, movie_reviews)
  end
end
