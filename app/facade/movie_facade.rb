class MovieFacade
  def self.top_rated
    MovieService.get_top_rated.map do |movie|
      Movie.new(movie)
    end
  end

  def self.movie_by_id(id)
    Movie.new(MovieService.get_movie_by_id(id))
  end
end
