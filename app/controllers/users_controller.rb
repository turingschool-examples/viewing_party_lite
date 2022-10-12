class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      flash[:alert] = "Did NOT save" #flash.alert too
      redirect_to "/register/new"
    end
  end

  def search
    conn = Faraday.new(url: "https://api.themoviedb.org/3/movie") do |faraday|
      faraday.headers["X-API-KEY"] = ENV['movie_key']
    end

    movie_response = conn.get("movie/10")

    data = JSON.parse(response.body, symbolize_names: true)

  end 

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

end
