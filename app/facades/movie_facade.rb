class MovieFacade
  def self.movie_details(search_id)
    data = MovieService.movie_by_id(search_id)
    Movie.new(data)
  end
end