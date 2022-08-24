class MoviesController < ApplicationController 
  def search 
    conn = Faraday.new("https://api.themoviedb.org") 
      
    response = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}")
    top_rated = JSON.parse(response.body, symbolize_names: true)
    # require 'pry'; binding.pry 
  end
end