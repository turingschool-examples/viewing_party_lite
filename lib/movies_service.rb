require 'pry'
require 'faraday'

class MoviesService
  def top_rated
    conn = Faraday.new(url: 'https://api.themoviedb.org', params: {api_key: ENV['movie_api_key']}) 
      # params: {api_key: 'fcffd3018e92893c2d9bde84c969cedc'}) 
  
    response = conn.get('/3/movie/100')

    json_body = response.body
    parsed_response = JSON.parse(json_body, symbolize_names: true)
  end
end

