require 'faraday'

class MovieService
  def self.movie_details(movie_id)
    conn = Faraday.new(url: "https://api.themoviedb.org/3") do |faraday|
      # faraday.headers["api_key"] = ENV["moviedb_api_key"]
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/movies/#{movie_id}?api_key=#{ENV["moviedb_api_key"]}")
    json = JSON.parse(response.body, symbolize_names: true)
  end
end