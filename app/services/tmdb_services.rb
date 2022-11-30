require 'httparty'

class TmdbService
  def top_rated
    get_url("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV["tmdb_api_key"]}")
  end

  # def team(id)
  #   get_url("")
  # end

  def get_url(url)
    response = HTTParty.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
