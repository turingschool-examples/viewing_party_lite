class MoviesController < ApplicationController
  def index
    conn = Faraday.new(url: "https://api.themoviedb.org") do |f| 
      f.headers["api_key"] = ENV["movie_api_key"]
    end  

    response = conn.get("/3/movie/top_rated?")

    data = JSON.parse(response.body, symbolize_names: true)

    @top_20 = data[:results].first(20)
  end
end