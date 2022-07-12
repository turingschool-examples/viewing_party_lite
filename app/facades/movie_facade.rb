class MovieFacade
  def self.top_rated_movies
    top_movies_data = MovieService.get_top_rated_movies
    top_movies_data[:results].map do |top_movie|
      TopMovie.new(top_movie)
    end
  end

  def self.movie_details(movie_id)
    details_data = MovieService.get_movie_details(movie_id)
    MovieDetail.new(details_data)
  end

  def self.movie_reviews(movie_id)
    reviews_data = MovieService.get_movie_reviews(movie_id)
    reviews_data[:results].map do |review|
      MovieReview.new(review)
    end
  end

  def self.movie_credit(movie_id)
    credit_data = MovieService.get_movie_credits(movie_id)
    credit_data[:cast].map do |credit|
      MovieCredit.new(credit)
    end
  end

  def self.movie_search(keyword)
    search_data = MovieService.get_search_movies(keyword)
    search_data[:results].map do |result|
      MovieSearch.new(result)
    end
  end
end
