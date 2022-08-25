class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    if params[:q] == "top_rated"
      conn = Faraday.new(url: "https://api.themoviedb.org") do |f|
        f.params["api_key"] = ENV['api_key']
      end
      response = conn.get("/3/movie/top_rated")
      data = JSON.parse(response.body, symbolize_names: true)
      @movies = data[:results]
    else
      conn = Faraday.new(url: "https://api.themoviedb.org") do |f|
        f.params["api_key"] = ENV['api_key']
      end
      query = params[:search]
      response = conn.get("/3/search/movie?query={#{query}}")
      data = JSON.parse(response.body, symbolize_names: true)
      @movies = data[:results]
    end
    render "movies/index"
  end
end
