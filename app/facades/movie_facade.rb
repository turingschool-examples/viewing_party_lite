class MovieFacade

  def self.top_rated_movies
    parsed = MovieService.top_rated
    parsed[:results].map do |data|
      Movie.new(data)
    end
  end
end