class MovieService

  def self.conn
    Faraday.new('http://api.themoviedb.org/3/') do |faraday|
      faraday.params["api_key"] = ENV['movie_api_key']
    end
  end

  def self.movie_query_results(query)
    if query == "top%20rated"
      endpoint = "movie/top_rated"
    else
      endpoint = "search/movie?query=#{query}"
    end
    response = conn.get(endpoint)
    json = JSON.parse(response.body, symbolize_names: true)
  end
  # def self.get_top_rated_movies
  #   conn = Faraday.new(url: "https://api.themoviedb.org")
  #   response = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}")
  #   data = JSON.parse(response.body, symbolize_names: true)
  #   data[:results]
  # end
end
