class MovieService 
  # can search movie, TV show or person
  def self.movies(title, num)
    response = conn.get do |req|
      req.url("3/search/movie")
      req.params = { api_key: Figaro.env.movie_api_key, query: title, page: num }
    end
    JSON.parse(response.body, symbolize_names: true) 
  end

  # def self.movies(title)
  #   response = conn.get("3/search/movie?query=#{title}&api_key=#{ENV['MOVIES_API_KEY']}")
  #   result = JSON.parse(response.body, symbolize_names: true)
  # end

  def self.trending_movies
    response = conn.get("3/trending/movie/week")
    JSON.parse(response.body, symbolize_names: true) 
  end
    
  private
  def self.conn
    Faraday.new("https://api.themoviedb.org") do |faraday|
      Faraday::FlatParamsEncoder.sort_params = false
      faraday.options.params_encoder = Faraday::FlatParamsEncoder
      faraday.adapter Faraday.default_adapter
    end
  end
end