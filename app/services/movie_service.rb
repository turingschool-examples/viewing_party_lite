require 'faraday'
require 'json'

class MovieService

  def self.parse(response)
    JSON.parse(response, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params["api_key"] = ENV["tmdb_api_key"]
    end
  end

  def self.get_movie_data(movie_id)
    response = conn.get("/3/movie/#{movie_id}?append_to_response=images,credits,reviews")
    parse(response.body)
  end
end 