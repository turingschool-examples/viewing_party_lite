class MoviesFacade
  def self.get_movie(movie_id)
    movie_details = MoviesService.movie_details(movie_id)
    movie_images = MoviesService.movie_images(movie_id)
    movie_credits = MoviesService.movie_credits(movie_id)
    movie_reviews = MoviesService.movie_reviews(movie_id)

    Movie.new(movie_details, movie_images, movie_credits, movie_reviews)
  end

  def self.get_top_20_movies

  end

  def self.get_search_results_movies(search_query)

  end
end