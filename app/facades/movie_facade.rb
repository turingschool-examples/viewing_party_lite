class MovieFacade
  def self.top_rated
    data = MovieService.top_rated_movies
    limit_20 = data[0..20]
    limit_20.map { |movie| Movie.new(movie) }
  end

  def self.search_movies(keyword)
    data = MovieService.movie_search(keyword)
    limit_20 = data[0..20]
    limit_20.map { |movie| Movie.new(movie) }
  end

  def self.movie_id(id)
    data = MovieService.search_by_movie_id(id)
    movie = Movie.new(data)
  end
end

