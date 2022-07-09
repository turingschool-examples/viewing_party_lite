class MovieFacade

  def self.movie_results(query)
    json = MovieService.movie_query_results(query)
    json[:results].map do |movie_result|
      Movie.new(movie_result)
    end
  end

  def self.create_single_movie(id)
    json = MovieService.get_movie_from_id(id)
    Movie.new(json)
  end

  def self.create_single_movie_credits(id)
    json = MovieService.get_movie_credits_from_id(id)
    Movie.new(json)
  end

  def self.create_single_movie_reviews(id)
    json = MovieService.get_movie_reviews_from_id(id)
    json[:results].map do |movie_result|
      Review.new(movie_result)
    end
  end

  def self.create_single_movie_images(id)
    json = MovieService.get_movie_images_from_id(id)
    Image.new(json)
  end
end
