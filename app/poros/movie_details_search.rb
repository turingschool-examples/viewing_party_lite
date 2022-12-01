require "./app/poros/movie_details"
require "./app/services/tmdb_service"

class MovieDetailsSearch
  def movie(id)
    data = service.movie_details(id)
    MovieDetails.new(data)
  end

  def service 
    TmdbService.new
  end
end