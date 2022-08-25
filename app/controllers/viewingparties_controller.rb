class ViewingpartiesController < ApplicationController

  def new 
    @movie = MovieFacade.service(params[:movie_id])  
    @users = User.all_without_current_user(params[:user_id])
  end

  def create 
    binding.pry 
  end 

end