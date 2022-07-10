class ViewingPartiesController < ApplicationController

  # def index
  #   conn = Faraday.new(url: 'https://api.moviedb.org/3') do |faraday|
  #     faraday.headers['X-API-KEY'] = ENV['api_key']
  #   end

  #   response = conn.get('/movie/top_rated')

  #   data = JSON.parse(response.body, symbolize_names: true)

  #   data.each do |movie|
  #     Movie.new(movie)
  #   end

    # @top_movies = MoviesService.top_movies

  def new
  end
end
