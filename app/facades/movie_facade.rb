class MovieFacade
  def self.making_objects(data)
    data[:results].map do |movie|
      Movie.new(movie)
    end
  end

  def self.top_movies
    data = MovieService.find_top_movies

    making_objects(data)
    # grab the data
    # pass data to top movies
  end

  def self.lookup(keyword)
    data = MovieService.search_movies(keyword)
    making_objects(data)
  end

  def self.details(id)
    movie_details_data = MovieService.get_details(id)
    movie_credits_data = MovieService.get_cast(id)
    movie_review_data = MovieService.get_reviews(id)
binding.pry
    movie_detail_hash = "poro stuff"
  end
end
