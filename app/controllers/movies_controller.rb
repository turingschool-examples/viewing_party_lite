class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])

    if params[:q] == "top_rated"
      conn = Faraday.new(url: "https://api.themoviedb.org") do |f|
        f.params["api_key"] = ENV['api_key']
      end
      response = conn.get("/3/movie/top_rated")
      data = JSON.parse(response.body, symbolize_names: true)

      @movies = data[:results].map do |movie_data|
        Movie.new(movie_data)
      end
    else
      conn = Faraday.new(url: "https://api.themoviedb.org") do |f|
        f.params["api_key"] = ENV['api_key']
      end
      @query = params[:search]
      response = conn.get("/3/search/movie?page=1&query={#{@query}}")
      response2 = conn.get("/3/search/movie?page=2&query={#{@query}}")

      data = JSON.parse(response.body, symbolize_names: true)
      data2 = JSON.parse(response2.body, symbolize_names: true)

      @movies1 = data[:results].map do |movie_data|
        Movie.new(movie_data)
      end

      @movies2 = data2[:results].map do |movie_data|
        Movie.new(movie_data)
      end
    end
    render "movies/index"
  end
end
