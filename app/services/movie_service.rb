require 'faraday'
require 'json'

class MovieService
  def self.get_movie_data(movie_id)
    conn = Faraday.new(url: 'https://api.themoviedb.org')

    response = conn.get("/3/movie/#{movie_id}?api_key=#{Figaro.env.tmdb_api_key}&append_to_response=images,credits,reviews")

    data = JSON.parse(response.body, symbolize_names: true)

  end
end 