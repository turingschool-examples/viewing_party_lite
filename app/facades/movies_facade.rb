class MoviesFacade
  def self.search_results(query)
    data = MoviesService.movie_search
    results = data[:results].find_all do |movie|
      movie[:title].downcase.include?(query.downcase)
    end
    results.map do |movie_result_data|
      MovieResult.new(movie_result_data)
    end
  end

  def self.top_movies 
    data = MoviesService.top_rated
    results = data[:results]
    results.map do |movie_result_data|
      MovieResult.new(movie_result_data)
    end
  end

  def self.movie_details(movie) 
    found_movie = MoviesService.find_movie_details(movie)
    MovieDetail.new(found_movie)
  end

  def self.movie_credits(movie)
    found_credits = MoviesService.find_movie_credits(movie)
    MovieCredit.new(found_credits)
  end

  def self.movie_reviews(movie)
    found_reviews = MoviesService.find_movie_reviews(movie)
    # MovieReview.new(found_reviews)
  end
end
