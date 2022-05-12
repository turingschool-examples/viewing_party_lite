class MovieFacade
  def self.service
    MovieService.new
  end

  def self.top_rated
    service.top_movies.map { |details| Movie.new(details) }
  end

  def self.find_movies(search)
    service.movies_by_query(search).map { |details| Movie.new(details) }
  end
end
