require 'faraday'
require 'faraday/net_http'

class MovieService
  def self.top_rated_movies
    top_rated_movies = '/3/movie/top_rated'
    response = conn.get(top_rated_movies)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['api_key']
    end
  end


  def self.top_rated_movies_list
    top_rated_movies[:results].map do |movie|
      Movie.new(movie)
    end
  end
end
