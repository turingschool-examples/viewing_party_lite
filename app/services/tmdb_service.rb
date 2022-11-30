class TmdbService 
  def movie_details(id)
    get_url("https://api.themoviedb.org/3/movie/#{id}?api_key=#{ENV['tmdb_key']}&language=en-US")
  end

  def top_rated_movies
    get_url("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['tmdb_key']}&language=en-US&page=1")
  end

  def config_base_path
    get_url("https://api.themoviedb.org/3/configuration?api_key=#{ENV['tmdb_key']}")
  end

  def get_url(url)
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end