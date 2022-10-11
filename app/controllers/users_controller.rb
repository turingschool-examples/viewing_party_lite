class UsersController < ApplicationController

  def welcome
    @users = User.all
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/register'
      flash[:alert] = "Error: #{@user.errors.full_messages.first}"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def discover
    @user = User.find(params[:id])
  end

  def results
    @user = User.find(params[:id])
    title = params["Search by Movie Title"]
    conn = Faraday.new(url: "https://api.themoviedb.org")    

    response = conn.get("/3/search/movie?api_key=#{ENV["movies_api_key"]}&query=#{title}")

    json = JSON.parse(response.body, symbolize_names: true)
    @movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end    

  end

  private 
  def user_params
    params.permit(:email, :name, :password)
  end

  def set_user
    @user = current_user
  end
end
