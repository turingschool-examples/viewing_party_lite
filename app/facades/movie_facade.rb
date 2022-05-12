class MovieFacade
  def self.service
    MovieService.new
  end

  def self.top_rated
    service.top_movies.map { |details| Movie.new(details) }
  end

  def self.find_movies(query)
    service.movies_by_query(query).map { |details| Movie.new(details) }
  end
end
