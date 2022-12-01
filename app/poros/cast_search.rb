require './app/poros/actor'
require './app/services/tmdb_service'

class CastSearch
  def cast(id)
    service.movie_cast(id)[:cast].take(10).map do |data|
      Actor.new(data)
    end
  end

  def service
    TmdbService.new
  end
end
