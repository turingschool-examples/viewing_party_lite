require 'faraday'
require 'json'

class MovieService

  def self.get_movie_data(movie_id)
    response = self.conn.get("3/movie/#{movie_id}")
    parse(response)
  end

  def self.get_cast_data(movie_id)
    response = self.conn.get("3/movie/#{movie_id}/credits")
    parse(response)
  end

  def self.get_review_data(movie_id)
    response = self.conn.get("3/movie/#{movie_id}/reviews")
    parse(response)
  end

  private

  def self.conn
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end