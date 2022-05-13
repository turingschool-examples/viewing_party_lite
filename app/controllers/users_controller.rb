class UsersController < ApplicationController
  def dashboard
    @user = User.find(params[:id])
    @parties = @user.parties
    @movies = @parties.map {|party| MovieFacade.single_movie(party.name)}
    @images = @parties.map {|party| MovieFacade.single_movie_image(party.name)}
  end

  def create
    new_user = User.new(user_params)
    if new_user[:name] == "" || new_user[:email] == ""
      flash[:notice] = "Please fill out all fields."
      redirect_to '/register'
    elsif User.email_list.include?(new_user[:email])
      flash[:notice] = "Sorry. That email address is not available."
      redirect_to '/register'
    else
      new_user.save
      redirect_to "/users/#{new_user.id}"
    end
  end

  def discover
    @user = User.find(params[:id])
  end

  def results
    @movie_list = MovieFacade.movie_list(params[:q])
  end

  def details
    @movie_details = MovieFacade.single_movie(params[:id])
    @single_movie_credits = MovieFacade.single_movie_credits(params[:id])
    @single_movie_reviews = MovieFacade.single_movie_reviews(params[:id])
  end

  private
  def user_params
    params.permit(:name, :email)
  end
end
