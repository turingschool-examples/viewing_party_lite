class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    connection = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV['movies_api_key']
    end
    if params[:top_movies]
      response = connection.get("/3/movie/top_rated")
      data = JSON.parse(response.body, symbolize_names: true)
      @movie_titles = Hash.new
      data[:results].each { |movie| @movie_titles[movie[:title]] = movie[:vote_average] }
    elsif params[:search]
      response = connection.get("/3/search/movie?query=#{params[:search]}")
      data = JSON.parse(response.body, symbolize_names: true)
      @movie_titles = Hash.new
      data[:results].each { |movie| @movie_titles[movie[:title]] = movie[:vote_average] }
    end
  end
end