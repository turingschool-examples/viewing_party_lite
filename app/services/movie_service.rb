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
end
