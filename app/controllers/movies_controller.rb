class MoviesController < ApplicationController
  def search
    @user = User.find(params[:user_id])

    conn = Faraday.new(url: "https://api.themoviedb.org") do |f|
      f.params["api_key"] = ENV['api_key']
    end
    query = params[:search]
    response = conn.get("/3/search/movie?query={#{query}}")

    data = JSON.parse(response.body, symbolize_names: true)

    @movies = data[:results]

    render "users/discover"
  end

  def top_rated
    @user = User.find(params[:user_id])

    conn = Faraday.new(url: "https://api.themoviedb.org") do |f|
      f.params["api_key"] = ENV['api_key']
    end
    response = conn.get("/3/movie/top_rated")
    data = JSON.parse(response.body, symbolize_names: true)

    @movies = data[:results]

    render "movies/top_rated"
  end
end