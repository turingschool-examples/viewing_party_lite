require "./app/poros/movie"
require "./app/services/tmdb_service"

class MoviesSearch
  def movies
    service.top_rated_movies[:results].map do |data| 
     Movie.new(data)
    end
  end

  def service 
    TmdbService.new
  end
end