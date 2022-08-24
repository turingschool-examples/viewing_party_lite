class MovieFacade

  def self.top_rated_movies
    parsed = MovieService.top_rated
    parsed[:results].map do |data|
      Movie.new(data)
    end
  end

  def self.movies_keyword_query
    parsed = MovieService.movies_by_keyword
    parsed[:results].map do |data|
      Movie.new(data)
    end
  end
end