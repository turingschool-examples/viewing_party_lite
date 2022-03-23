class UsersMoviesController < ApplicationController
  def index 
  
    @user = User.find(params[:user_id])
    conn = Faraday.new(url: "https://api.themoviedb.org/") do |faraday|
      faraday.params[:api_key] = ENV['movie_api_key']
      # faraday.params['q'] = params[:search]
    end
    
    top_rated_response = conn.get("3/movie/top_rated")
    
    data = JSON.parse(top_rated_response.body, symbolize_names: true)
    
    @movies = data[:results].map do |result|
      Movies.new(result)
    end
  end 

  def show 

  end 
end 