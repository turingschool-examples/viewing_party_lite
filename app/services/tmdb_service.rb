class TmdbService 
  def movie_details(id)
    get_url("https://api.themoviedb.org/3/movie/#{id}?api_key=#{ENV['tmdb_key']}&language=en-US")
  end

  def config_base_path
    get_url("https://api.themoviedb.org/3/configuration?api_key=#{ENV['tmdb_key']}")
  end

  def get_url(url)
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end