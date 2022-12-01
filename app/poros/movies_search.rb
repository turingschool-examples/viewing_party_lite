require './app/poros/movie'
require './app/services/tmdb_service'

class MoviesSearch
  def top_rated_movies
    service.top_rated_movies[:results].map do |data|
      Movie.new(data)
    end
  end

  def service
    TmdbService.new
  end

  def movies_keyword(params)
    service.movies_keyword(params)[:results].map do |data|
      Movie.new(data)
    end
  end
end
