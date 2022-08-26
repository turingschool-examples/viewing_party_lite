class MovieFacade

  def self.top_rated_movies
    parsed = MovieService.top_rated
    parsed[:results].map do |data|
      Movie.new(data)
    end
  end
  
  def self.movies_keyword_query(keyword)
    parsed = MovieService.movies_by_keyword(keyword)
    parsed[:results].map do |data|
      Movie.new(data)
    end
  end

  def self.get_movie_details(id)
    parsed = MovieService.movie_details(id)
      MovieDetails.new(parsed)
  end

  def self.get_movie_cast(id)
    parsed = MovieService.movie_cast(id)
    parsed[:cast].first(10).map do |actor|
      Actor.new(actor)
    end
  end

  def self.movie_reviews(id)
    parsed = MovieService.get_movie_reviews(id)
    parsed[:results].map do |data|
      MovieReview.new(data)
    end
  end
end