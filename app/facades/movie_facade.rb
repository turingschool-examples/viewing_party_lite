class MovieFacade
  attr_reader :movie_service

  def initialize
  end

  def get_movie(id)
    movie_info = MovieService.get_movie(id)  
    movie_detail = MovieDetail.new(movie_info)
  end
  
  def self.top_cast(id)
    # binding.pry
    cast = TopCastService.get_cast(id)[:cast][0..9]
    cast.map do |data|
      # binding.pry
      Actor.new(data)
    end
  end

  def self.top_rated
    TopRatedMovieService.movies["results"]
  end

  def self.movie_search(query)
    MovieSearchService.search(query)["results"]
  end
end