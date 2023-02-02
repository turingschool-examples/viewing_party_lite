class MovieService 

  #TODO: Inject default?
  def initialize(url = '')
    @url = url
  end

  def get_top_movies
    response = service.get('/3/movie/top_rated')
    
    build_movie_objects(response)
  end

  def search_movies(search_query)
    response = service.get('/3/search/movie') do |request|
      request.params["query"] = search_query
    end

    build_movie_objects(response)
  end

  def movie
    service.get("/3/movie/#{@url}").body
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
      params: {api_key: ENV["moviedb_key"],
      language: "en-US"}
    }
  end

  def build_movie_objects(response)
    JSON.parse(response.body)["results"].map do |movie|
      Movie.new(movie)
    end
  end
end
