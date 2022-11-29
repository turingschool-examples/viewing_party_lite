class DiscoverController < ApplicationController
  def index 
    connection = Faraday.new(url: "https://api.themoviedb.org/3") do |faraday|
    faraday.headers["X-API-KEY"] = ENV['api_key']
    end
   
    response = connection.get("/discover/movie?sort_by=popularity.desc")
    json_body = response.body 
    parsed_response = JSON.parse(json_body, symbolize_names: true)

   
  end
end

