class MoviesController < ApplicationController
  def index 
    conn = Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.params['api_key'] = ENV["movie_api_key"]
    end
    response = conn.get("movie/top_rated")
    json = JSON.parse(response.body, symbolize_names: true)
    @top_rated = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end