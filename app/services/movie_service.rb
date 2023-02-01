class MovieService 

  def get_top_movies
    response = service.get('/3/movie/top_rated')
    
    JSON.parse(response.body)["results"].map do |movie|
      Movie.new(movie)
    end
  end

  private

  def base_uri
    "https://api.themoviedb.org"
  end

  def service 
    Faraday.new(service_params)
  end

  def service_params
    {
      url: base_uri,
      params: {api_key: ENV["moviedb_key"]}
    }
  end
end