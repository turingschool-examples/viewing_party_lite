class MovieService
  def self.connect
      Faraday.new(url: "https://api.themoviedb.org") do |faraday|
          faraday.params["api_key"] = ENV['moviedb_api_key']
      end
  end

  def self.search_movies(movie_search)
      response = connect.get("/3/search/movie?query=#{movie_search}")
      json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.top_movies
      response = connect.get("/3/movie/top_rated?api_key=#{ENV['moviedb_api_key']}")
      json = JSON.parse(response.body, symbolize_names: true)
  end

end
