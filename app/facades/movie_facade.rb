class MovieFacade
  def self.top_rated
    json = MovieService.top_rated
    json[:results].map do |movie_data|
      Movie.new(movie_data)
    end[0...20]
  end

  def self.search(string)
    json = MovieService.search(string)
    json[:results].map do |movie_data|
      Movie.new(movie_data)
    end[0...20]
  end

  def self.details(movie_id)
    json = MovieService.movie(movie_id)
    Movie.new(json)
  end

  def self.cast(movie_id)
    json = MovieService.cast(movie_id)
    json[:cast].map do |cast_data|
      Cast.new(cast_data)
    end[0...10]
  end

  def self.reviews(movie_id)
    json = MovieService.reviews(movie_id)
    json[:results].map do |review_data|
      Review.new(review_data)
    end[0...10]
  end
end
