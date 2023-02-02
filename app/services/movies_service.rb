class MoviesService
  def self.conn
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params['api_key'] = ENV['tmdb_api']
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_data(title)
    response = conn.get("/3/search/movie?query=#{title}")
    parse_json(response)
  end

  def self.top_rated
    response = conn.get("/3/movie/top_rated")
    parse_json(response)
  end
end