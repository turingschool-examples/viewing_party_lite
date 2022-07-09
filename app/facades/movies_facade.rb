class MoviesFacade
  def self.top_rated
    top_movies = MoviesService.get_top_rated

    top_movies[0..39].map do |movie|
      Movie.new(movie)
    end
  end

  def self.search(keyword)
    search_results = MoviesService.find_movies(keyword)

    search_results[0..39].map do |movie|
      Movie.new(movie)
    end
  end

  def self.movie(id)
    movie = MoviesService.get_movie(id)
    Movie.new(movie)
  end

  def self.movie_reviews(movie_id)
    review_array = []
    movie_reviews = MoviesService.get_movie_reviews(movie_id)
    movie_reviews.each do |result|
      review_array << MovieReview.new(result)
    end
    review_array
  end

  def self.ten_movie_cast(movie_id)
    movie_cast = MoviesService.get_movie_cast(movie_id)
    movie_cast.map do |member|
      MovieCastMember.new(member)
    end[0..9]
  end
end
