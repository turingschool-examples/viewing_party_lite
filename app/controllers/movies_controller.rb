class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if(params[:keyword])
      conn = Faraday.get("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['api_key']}&language=en-US&query=#{params[:keyword]}&page=1&include_adult=false")
    else
      conn = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['api_key']}&language=en-US&page=1")
    end
    data = JSON.parse(conn.body, symbolize_names: true)
    @movies = data[:results]
  end
end