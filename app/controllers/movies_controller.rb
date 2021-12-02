class MoviesController < ApplicationController

  def new
    @user = User.find(params[:id])
  end

  def index
    conn = Faraday.new("https://api.themoviedb.org")
    response = conn.get("3/movie/popular?api_key=#{ENV['movie_api_key']}&language=en-US&page=1")
    json = JSON.parse(response.body, symbolize_names: true)

    @movies = json[:results]
  end
end
