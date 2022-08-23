class MoviesController < ApplicationController

  # def search
  #   conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      
  #     faraday.params["api_key"] = ENV['movie_api_key']
      
  #   end
    
  #   response = conn.get("/3/movie/top_rated")

  #   data = JSON.parse(response.body, symbolize_names: true)
  #   require 'pry'; binding.pry 
  # end

  def search
    movie = params[:movie]
    @movie = MovieFacade.get_a_movie(movie)
  end


end