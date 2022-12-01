class MoviesController < ApplicationController
  def index
    require 'pry'
    binding.pry
  end

  def search
    conn = Faraday.new(url: 'https://api.themoviedb.org/3') do |faraday|
      faraday.headers['api_key'] = ENV['movies_api_key']
    end
  end

  def top_rated
    conn = Faraday.new(url: 'https://api.themoviedb.org/3') do |faraday|
      faraday.headers['api_key'] = ENV['movies_api_key']
    end
    response = conn.get('/movie/top_rated')

    data = JSON.parse(response.body, symbolize_names: true)

    top_rated_movies = data[:results]

    binding.pry
  end
end
