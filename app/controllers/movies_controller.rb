class MoviesController < ApplicationController 

  def index 
    movie = params[:movie]

    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["x-api-key"] = ENV['api_key']
    end

    response = conn.get("/3/search/movie?api_key=#{ENV['api_key']}&query=#{movie}&page=1")

    data = JSON.parse(response.body, symbolize_names: true)
  end 
end 
