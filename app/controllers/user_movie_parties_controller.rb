class UserMoviePartiesController < ApplicationController

  def new
    movie_id = params[:movie_id].to_i
    @user = User.find(params[:user_id])
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
    end 
    response = conn.get("/3/movie/#{movie_id}?api_key=#{ENV['movie_db_key']}")
    @movie = JSON.parse(response.body, symbolize_names: true)

  end
  

end 