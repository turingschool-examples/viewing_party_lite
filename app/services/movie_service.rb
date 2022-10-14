# frozen_string_literal: true

require 'json'

class MovieService
  def self.conn
    Faraday.new(
      url: 'https://api.themoviedb.org/',
      params: { api_key: ENV['moviebd_api_key'] }
    )
  end

  def self.top_rated
    response = conn.get('/3/movie/top_rated')
    parse(response)
  end

  def self.details(movie_id)
    response = conn.get("/3/movie/#{movie_id}")
    parse(response)
  end

  def self.credits(movie_id)
    response = conn.get("3/movie/#{movie_id}/credits")
    parse(response)
  end

  def self.reviews(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews")
    parse(response)
  end

  def self.search(keyword)
    response = conn.get('/3/search/movie', { query: keyword })
    parse(response)
  end

  def self.parse(api_data)
    JSON.parse(api_data.body, symbolize_names: true)
  end

end
