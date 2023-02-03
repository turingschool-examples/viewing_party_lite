class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
   
    view_parties = @user.view_parties
    movie_ids = view_parties.map do |party|
      party[:movie_id]
    end

    party_guest_ids = view_parties.map do |party|
      party.party_guests.pluck(:guest_id)
    end.flatten

    @party_guests = party_guest_ids.map do |guest|
      User.find(guest).name
    end

    @movies = movie_ids.map do |movie_id|
      TMDBService.get_movie_by_id(movie_id)
    end
  end
  
  def new
    User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    elsif @user.name == "" || @user.email == "" 
      redirect_to new_user_path, notice: "Field can't be blank."
    else 
      redirect_to new_user_path, notice: "Enter valid name and email."
    end
  end

  private
  
  def user_params
    params.permit(:name, :email)
  end
end