class MoviesController < ApplicationController 

  def index  
    @user = User.find(params[:user_id])
    connection = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
    faraday.params["api_key"] = ENV['movies_api_key']
    end
    if params[:q] 
      response = connection.get("/3/movie/top_rated")
      json_body = response.body 
      # require 'pry'; binding.pry
      parsed_response = JSON.parse(json_body, symbolize_names: true)
      @results = parsed_response[:results]
    end
    if params[:keyword]

    end

   
  end

  # def search 
  #   connection = Faraday.new(url: "https://api.themoviedb.org/3") do |faraday|
  #     faraday.params["api_key"] = ENV['movies_api_key']
  #     end
     
  #     response = connection.get("/discover/movie?sort_by=popularity.desc")
  # end
end

