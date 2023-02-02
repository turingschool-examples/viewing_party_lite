class MovieFacade
  def self.get_search_results(search_field)
    data = MovieService.new.search_movies(search_field)
    data.map do |result|
      SearchResult.new(result)
    end
  end

  def self.top_rated_movies
    data = MovieService.new.top_rated_movies
    data.map do |result|
      SearchResult.new(result)
    end
  end

  def self.get_details(movie_id)
    data = MovieService.new.movie_details(movie_id)
    Detail.new(data)
  end
end