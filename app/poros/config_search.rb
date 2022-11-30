require "./app/poros/movie"
require "./app/services/tmdb_service"

class ConfigSearch
  def base_path
    data = service.config_base_path
    data[:images][:base_url]
  end

  def service 
    TmdbService.new
  end
end