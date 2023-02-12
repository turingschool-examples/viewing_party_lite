class MovieFacade
  def self.top_rated_movies
    data = MovieService.top_rated_movies_response
    data[:results].map do |movie_information|
      Movie.new(movie_information)
    end
  end

  def self.search_results(search_params)
    data = MovieService.search_results_response(search_params)
    data[:results].map do |movie_information|
      Movie.new(movie_information)
    end.sort_by do |movie|
      movie.vote_average
    end.reverse
  end

  def self.find_movie(movie_id)
    data = MovieService.find_movie_response(movie_id)
    ShowMovie.new(data)
  end

  def self.find_cast(movie_id)
    data = MovieService.find_cast_response(movie_id)
    data[:cast].map do |actor_information|
      if actor_information[:known_for_department] == "Acting"
        MovieActor.new(actor_information)
      end
    end.compact
  end

  def self.cast_by_popularity(movie_id)
    find_cast(movie_id).sort_by do |actor|
      actor.popularity
    end.reverse[0..9]
  end

  def self.find_reviews(movie_id)
    data = MovieService.find_reviews_response(movie_id)
    data[:results].map do |review_information|
      MovieReview.new(review_information)
    end
  end
end