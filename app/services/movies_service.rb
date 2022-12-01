require 'pry'
require 'faraday'

class MoviesService
  def search(input)
    conn = Faraday.new(url: 'https://api.themoviedb.org', params: {api_key: ENV['movie_api_key']}) 
  
    response = conn.get("/3/movie/#{input}")

    parsed_response = JSON.parse(response.body, symbolize_names: true)
  end
end

