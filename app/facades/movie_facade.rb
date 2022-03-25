class MovieFacade
  def self.top_movies
    data = MovieService.top_rated_movies

    data[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.keywords(keyword)
    return self.top_movies if keyword == "top_rated"

    data = MovieService.movie_keywords(keyword)

    data[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.get_movie(movie_id)
    data = MovieService.find_movie(movie_id)
    Movie.new(data)
  end

  def self.get_movie_cast(id)
    data = MovieService.find_cast(id)

    data[:cast].map do |cast_member|
      MovieCast.new(cast_member)
    end[0..9]
  end

  def self.get_reviews(id)
    data = MovieService.find_reviews(id)
    MovieReview.new(data) # this has total_results in it 
    data[:results].map do |movie_data|
      MovieReview.new(movie_data)
    end
  end
end
