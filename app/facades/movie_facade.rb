require './app/poros/movie'
class MovieFacade

  def self.top_movies
    MovieService.top_rated.map do |movie|
      MoviePoro.new(movie)
    end
  end

  def self.search(query)
    MovieService.search_movie(query).map do |movie|
      MoviePoro.new(movie)
    end
  end

end
