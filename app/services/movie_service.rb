require 'pry'
require 'faraday'
require 'figaro'

class MovieService

  def conn
    conn = Faraday.new(
      url: 'https://api.themoviedb.org',
      params: {api_key: ENV["movies_api_key"]})
  end

  def get_movie(api_id)
    response = conn.get("/3/movie/#{api_id}")
    attrs = JSON.parse(response.body, symbolize_names: true)
    Movie.new(attrs)
  end
end
