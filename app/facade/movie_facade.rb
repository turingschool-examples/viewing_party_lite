class MovieFacade
  def self.movie_data(movie_id)
    get_repo_data = MovieService.get_movie_data(movie_id)
    MovieInfo.new(get_repo_data)
  end

  def self.top_rated
   MovieService.get_top_rated[:results].map do |data|
      TopMovie.new(data)
    end
  end

  def self.movies_search(keyword)
    search_results = MovieService.get_movies_search(keyword)
    search_results[:results].map do |data|
      TopMovie.new(data)
    end
  end
end
