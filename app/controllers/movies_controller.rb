class MoviesController < ApplicationController 
  def index 
    @user = User.find(params[:user_id])
  end
  def top_rated 
    connection = Faraday.new(url: "https://api.themoviedb.org/3") do |faraday|
    faraday.params["api_key"] = ENV['movies_api_key']
    end
   
    response = connection.get("/discover/movie?sort_by=popularity.desc")
    json_body = response.body 
    parsed_response = JSON.parse(json_body, symbolize_names: true)
    @popular = parsed_response[:results][0][:original_title]
  

   
  end
end

