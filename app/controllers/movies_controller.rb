class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    connection = Faraday.new(    url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV["movies_api_key"]
    end

    if params[:q]
      response = connection.get("/3/movie/top_rated")
      json_body = response.body

      # require 'pry'; binding.pry
      parsed_response = JSON.parse(json_body,       symbolize_names: true)
      @results = parsed_response[:results]
    end

    if params[:keyword]
      response = connection.get("/3/search/movie?query=#{params[:keyword]}")
      json_body = response.body
      parsed_response = JSON.parse(json_body,       symbolize_names: true)
      @results = parsed_response[:results]
    end
  end

  def show 
    @user = User.find(params[:user_id])
    
    connection = Faraday.new(    url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV["movies_api_key"]
    end

    response = connection.get("/3/movie/#{params[:id]}")
    json_body = response.body
    @results = JSON.parse(json_body,       symbolize_names: true)
   
    # @movies = parsed_response[:results].map do |movie_attributes|
    #   Movie.new(movie_attributes)
    # end

    # require 'pry'; binding.pry
  end
end
