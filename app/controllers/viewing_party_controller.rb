
class ViewingPartyController < ApplicationController 

  def show 
    @party = ViewingParty.find(params[:id])
  end
  
  def new 
     @user = User.find(params[:user_id])
     @movie_id = (params[:movie_id]).to_i 
  end

#   def create 
#     # party = ViewingParty.find(params[:id])
#     # if party 
#     # # if User.exists?(params[:email])
#     #   flash[:alert] = "That email address is already registered."
#     #   redirect_to "/register"
#     # else
#     #   party = ViewingParty.create!(user_params)
#     #   # require 'pry'; binding.pry 
#     #   redirect_to "/users/#{@party.id}"
#     # end
#   end
end