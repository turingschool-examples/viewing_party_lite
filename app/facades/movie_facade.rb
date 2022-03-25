class MovieFacade
  def self.making_objects(data)
    data[:results].map do |movie|
      Movie.new(movie)
    end
  end

  def self.top_movies
    data = MovieService.find_top_movies

    making_objects(data)
  end

  def self.lookup(keyword)
    data = MovieService.search_movies(keyword)
    making_objects(data)
  end

  def self.details(id)
    movie_details_data = MovieService.get_details(id)
    movie_credits_data = MovieService.get_cast(id)
    movie_review_data = MovieService.get_reviews(id)
    MovieDeets.new(movie_details_data, movie_credits_data, movie_review_data)
  end
end
