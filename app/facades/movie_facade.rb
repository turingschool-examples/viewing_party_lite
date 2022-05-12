class MovieFacade
  def top_movies
    MovieService.get_top_movies.map { |data| Movie.new(data) }
  end
end
