require "./app/poros/movie"
require "./app/services/tmdb_service"

class MovieSearch
  def movie_details(id)
    data = service.movie(id)
    Movie.new(data)
  end

  def service 
    TmdbService.new
  end
end