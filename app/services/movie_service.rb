class MovieService 
  def movie_details(id)
    get_url("https://api.themoviedb.org/3/movie/#{id}?api_key=#{ENV['tmdb_key']}&language=en-US")
  end

  def top_rated_movies
    get_url("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['tmdb_key']}&language=en-US&page=1")
  end

  def config_base_path
    get_url("https://api.themoviedb.org/3/configuration?api_key=#{ENV['tmdb_key']}")
  end

  def movies_keyword(params)
    get_url("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['tmdb_key']}&language=en-US&page=1&include_adult=false&query=#{params}")
  end

  def movie_cast(id)
    get_url("https://api.themoviedb.org/3/movie/#{id}/credits?api_key=#{ENV['tmdb_key']}&language=en-US")
  end

  def movie_reviews(id)
    get_url("https://api.themoviedb.org/3/movie/#{id}/reviews?api_key=#{ENV['tmdb_key']}&language=en-US&page=1")
  end

  def get_url(url)
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end