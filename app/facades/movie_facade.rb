class MovieFacade
  def self.top_rated
    @top_movies = MovieService.top_rated_movies.map do |info|
      Movie.new(info)
    end
  end

  def self.search(keyword_string)
    @searched_movies = MovieService.movie_search(keyword_string).map do |info|
      Movie.new(info)
    end
    @searched_movies.sort_by(&:rating).reverse
  end
end