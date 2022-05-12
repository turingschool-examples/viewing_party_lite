class MovieFacade
  def top_movies
    MovieService.get_top_movies.map { |data| Movie.new(data) }
  end

  def search(params)
    # cant figure out how to pass/get params here
    MovieService.get_search(params).map { |data| Movie.new(data) }
  end
end
