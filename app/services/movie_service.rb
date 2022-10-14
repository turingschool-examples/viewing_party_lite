require 'faraday'
class MovieService

  def self.request(movie_id = '', path = '', page = '')
    key = Figaro.env.moviedb_key
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}#{path}?api_key=#{key}&language=en-US#{page}")
    JSON.parse(response.body)
  end

  def self.search(query = '', page = '1')
    key = Figaro.env.moviedb_key
    response = Faraday.get("https://api.themoviedb.org/3/search/movie?api_key=#{key}&language=en-US&query=#{query}&page=#{page}&include_adult=false")
    JSON.parse(response.body)
  end

end