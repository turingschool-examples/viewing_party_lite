class MoviesController < ApplicationController
  def index
    conn = Faraday.new(url: 'https://api.themoviedb.org') 

    response = conn.get("/3/movie/top_rated") do |f|
      f.params['api_key'] = ENV['moviedb_api_key']
    end

    data = JSON.parse(response.body, symbolize_names: true)
    binding.pry
    @top_rated = data[:results]
    # @avg_vote_count = data[:results][:vote_average]
  end
end