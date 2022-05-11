class MovieFacade
  def movies
    service = MovieService.get_top_movies.map { |data| Movie.new(data) }
  end
end
