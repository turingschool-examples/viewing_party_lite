class MovieFacade
  def self.top_movies
    data = MovieService.top_movies
    data[:results].map do |movie_data|
      MovieInfo.new(movie_data)
    end
  end

  def self.search_movie(search)
    data = MovieService.search_movie(search)
    data[:results].map do |movie_data|
      MovieInfo.new(movie_data)
    end
  end
end