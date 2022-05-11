class UserMoviesController < ApplicationController

  def index
    if params[:top_rated]
      conn = Faraday.new(url: "https://api.themoviedb.org") 
      response = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_db_key']}")
      data = JSON.parse(response.body, symbolize_names: true)
      @movies = data[:results]
    end 
  end
  


end 