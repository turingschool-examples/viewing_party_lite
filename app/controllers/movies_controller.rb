class MoviesController < ApplicationController
  def top_rated
    conn = Faraday.new(
      url: "https://api.themoviedb.org",
      headers: {'Content-Type' => 'application/json'}
    )

    response = conn.get("/3/movie/top_rated") do |req|
      req.params['api_key'] = ENV['movie_api_key']
    end
    
    
    
    @data = JSON.parse(response.body, symbolize_names: true)
    
    # movies = @data[:results].first(40)

    render user_movies_discover_path(params[:user_id], :q => 'top%20rated')

  end
  def discover 
    @user = User.find(params[:user_id])
  end

  def index
    @user = User.find(params[:user_id])
    @movies = @data[:results].first(40)
  end

end