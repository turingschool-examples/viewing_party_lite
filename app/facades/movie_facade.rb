class MovieFacade

  def self.movie_list(query)
    json = MovieService.movie_results(query)
    json[:results].map do |result|
      Movie.new(result)
    end
  end

  def self.single_movie(id)
    json = MovieService.find_with_id(id)
    Movie.new(json)
  end

  def self.single_movie_credits(id)
    json = MovieService.find_credits_with_id(id)
    Movie.new(json)
  end

  def self.single_movie_reviews(id)
    json = MovieService.find_reviews_with_id(id)
    json[:results].map do |result|
      Movie.new(result)
    end
  end

  def self.single_movie_image(id)
    json = MovieService.find_images_with_id(id)
    Image.new(json)
  end
end
