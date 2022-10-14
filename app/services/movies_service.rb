# frozen_string_literal: true

require 'json'
require 'faraday'

class MoviesService
  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['tmdb-api']
    end
  end

  def self.top_rated
    response = conn.get('/3/movie/top_rated')

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search(keyword)
    response = conn.get("/3/search/movie?query=#{keyword}")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.details(movie_id)
    response = conn.get("/3/movie/#{movie_id}?append_to_response=credits,reviews")

    JSON.parse(response.body, symbolize_names: true)
  end
end
