class UsersController < ApplicationController

  def new
    @user = User.new
  end 

  def show
    @user = User.find(params[:id])
  end

  def create 
    @user = User.create(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end 
  end 

  def discover
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

private 
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
