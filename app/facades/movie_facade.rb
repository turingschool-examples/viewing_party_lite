class MovieFacade
  def self.top_movies
    data = MovieService.top_rated_movies

    data[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.keywords(keyword)
    data = MovieService.movie_keywords(keyword)

    data[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end