require 'httparty'

class TmdbService
  def top_rated
    get_url("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV["tmdb_api_key"]}")
  end

  def get_movie(movie_id)
    get_url("https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{ENV["tmdb_api_key"]}&language=en-US")
  end

  def get_url(url)
    response = HTTParty.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
