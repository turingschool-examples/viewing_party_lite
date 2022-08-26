class MovieReverseSearchResultFacade

  def self.service(movie_title)
    data = MovieService.movie_api_id(movie_title)

    MovieReverseSearchResult.new(data)
  end

end