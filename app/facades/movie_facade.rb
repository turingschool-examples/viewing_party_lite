class MovieFacade
  def self.top_movies
    data = MovieService.top_movies
    data[:results].map do |movie_data|
      MovieInfo.new(movie_data)
    end
  end

  def self.search_movie(search)
    data = MovieService.search_movie(search)
    data[:results].map do |movie_data|
      MovieInfo.new(movie_data)
    end
  end

  def self.movie_reviews(movie_id)
    data = MovieService.reviews(movie_id)
    data[:results].map do |movie_data|
      MovieReview.new(movie_data, @id = data[:id], @number_reviews = data[:total_results])
    end
  end

  def self.movie_details(movie_id)
    data = MovieService.movie_details(movie_id)
      MovieDetail.new(data)
  end

  def self.movie_cast(movie_id)
    data = MovieService.cast(movie_id)
    data[:cast].map do |cast_data|
      MovieCast.new(cast_data)
    end
  end
end