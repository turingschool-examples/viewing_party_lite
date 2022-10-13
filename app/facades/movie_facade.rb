class MovieFacade < MovieService
  
  def self.top_rated_poro
    MoviesTopRated.new(top_rated)
  end

  def self.credits_poro(movie_id)
    Credits.new(credits(movie_id))
  end

  def self.reviews_poro(movie_id)
    Reviews.new(reviews(movie_id))
  end

  def self.details_poro(movie_id)
    Details.new(details(movie_id))
  end

  def self.search_poro(keyword)
    Search.new(search(keyword))
  end

end