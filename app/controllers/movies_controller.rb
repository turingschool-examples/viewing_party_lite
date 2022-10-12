class MoviesController < ApplicationController

  def show
    @user = User.find(params[:id])
    @movie_id = params[:movie_id]
    conn = Faraday.new(url: "https://api.themoviedb.org") 
    response = conn.get("/3/movie/#{@movie_id}?api_key=#{ENV["movies_api_key"]}")
    @movie_information  = JSON.parse(response.body, symbolize_names: true)
  end
end