class MovieFacade
  def self.actors(movie_id)
    cast_data = MovieService.actors(movie_id)
    actors = cast_data[:cast].map do |actor_data|
      Actor.new(actor_data)
    end
  end

  def self.movie_details(movie_id)
    Movie.new(MovieService.movie_details(movie_id))
  end

  def self.review_details(movie_id)
    review_data = MovieService.review_details(movie_id)
    review = review_data[:results].map do |review_data|
      Review.new(review_data)
    end
  end

  def self.discover_movie(movie_query)
    movies_data = MovieService.discover_movie(movie_query)
    movies = movies_data[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end