class MovieFacade

  def self.get_movie(id)
    movie_info = MovieService.get_movie(id)  
    movie_detail = MovieDetail.new(movie_info)
  end
  
  def self.top_cast(id)
    cast = MovieService.get_cast(id)[:cast][0..9]
    cast.map do |data|
      Actor.new(data)
    end
  end

  def self.top_rated
    MovieService.top_rated_movies[:results].map do |movie|
      MovieDetail.new(movie)
    end
  end

  def self.movie_search(query)
    MovieService.search(query)[:results].map do |movie|
      MovieDetail.new(movie)
    end
  end
  
  def self.reviews(id)
    revs = ReviewService.get_reviews(id)
    revs.map do |data|
      Review.new(data)
    end
  end
end