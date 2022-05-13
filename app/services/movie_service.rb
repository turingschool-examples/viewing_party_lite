class MovieService
  def self.conn
    Faraday.new("https://api.themoviedb.org")
  end

  def self.movie_titles_by_rating
    response = conn.get("/3/movie/popular") do |faraday|
      faraday.params['api_key'] = ENV['tmdb_api_key']
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_by_keyword(query)
    response = conn.get("/3/search/movie?query=#{query}") do |faraday|
      faraday.params['api_key'] = ENV['tmdb_api_key']
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
