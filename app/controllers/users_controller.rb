class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
    @parties = @user.viewing_parties.all
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
    else
      redirect_to "/register"
      flash[:alert] = "Error: #{error_message(user.errors)}"
    end
  end

  def login_form
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user && user&.authenticate(params[:password])#the & is a null safe operator checking that the user isnt nil so if somehting is itll raise an error
      redirect_to "/users/#{user.id}"
      flash[:success] = "Oh? HI #{user.name}"
    else
      flash[:error] = "I did not, I did not"
      render :login_form
    end
  end

  def movie
    @user = User.find(params[:id])
    if params[:q] == "top rated"
      @top_movies = MovieDBFacade.top_movies
    elsif params[:q] != "top rated" && params[:q].present?
       @movies_matching_keyword = MovieDBFacade.searched_movies(params[:q])[0..39]
    end
  end

  def discover
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
