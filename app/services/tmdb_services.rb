require 'httparty'

class TmdbService
  def top_rated
    get_url("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV["tmdb_api_key"]}")
  end

  def search_movies(query)
    get_url("https://api.themoviedb.org/3/search/movie?api_key=#{ENV["tmdb_api_key"]}&language=en-US&query=#{query}&page=1&include_adult=false")
  end

  def get_movie(movie_id)
    get_url("https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{ENV["tmdb_api_key"]}&language=en-US")
  end

  def get_url(url)
    response = HTTParty.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
