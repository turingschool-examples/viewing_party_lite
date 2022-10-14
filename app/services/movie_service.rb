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

  def self.get_search_data(search)
    response = self.conn.get("/3/search/movie?query=#{search}")
    parse(response)
  end

  def self.get_top_movie_data
    response = self.conn.get('3/movie/top_rated')
    parse(response)
  end

  def self.get_movie_image(movie_id)
    response = self.conn.get("3/movie/#{movie_id}/images")
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
