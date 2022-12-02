class MovieFacade
  def self.top_rated
    MovieService.get_top_rated.map do |movie|
      Movie.new(movie)
    end
  end

  def self.movie_by_id(id)
    Movie.new(MovieService.get_movie_by_id(id))
  end

  def self.movie_search(search)
    MovieService.get_movie_search(search).map do |movie|
      Movie.new(movie)
    end
  end

end
