class MovieFacade < MovieService
# **Original method below**
  # def self.top_rated_poro
  #   MoviesTopRated.new(top_rated)
  # end

  def self.top_rated_poro
    top_rated[:results].map do |movie|
      MoviesTopRated.new(movie)
    end
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
    search(keyword)[:results].map do |movie|
      Search.new(movie)
    end
  end
end
