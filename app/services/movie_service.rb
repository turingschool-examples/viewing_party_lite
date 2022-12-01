class MovieService
  def self.top_movies
    response = connection.get("/3/movie/top_rated")
    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.search_movie(search)
    response = connection.get("/3/search/movie?query=#{search}")
    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.connection
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV['movies_api_key']
    end
  end
end