require 'faraday'
require 'pry'

class MovieService

  def self.request(movie_id = '', path = '', page = '')
    key = '6f974f2eba74445f2915a36f183702b7'
    Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}#{path}?api_key=#{key}&language=en-US#{page}")
  end

end