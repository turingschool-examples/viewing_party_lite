class MovieService 

  #TODO: Inject default?
  def initialize(url)
    @url = url
  end

  def get_top_movies
    service.get('/3/movie/top_rated').body["results"].map do |movie|
      Movie.new(movie)
    end
  end

  def movie
    Movie.new(service.get("/3/movie/#{@url}").body)
  end

  private

  def base_uri
    "https://api.themoviedb.org"
  end

  def service 
    Faraday.new(service_params) do |f|
      f.response :json
    end
  end

  def service_params
    {
      url: base_uri,
      params: {api_key: ENV["moviedb_key"],
      language: "en-US"}
    }
  end
end
