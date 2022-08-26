class ViewingPartiesController < ApplicationController

  def new
    # binding.pry
    @users = User.where("id != ?", params[:user])
    @user = User.find(params[:user])
    @movie = Movie.new(@search.find_movie_basic(params[:movie]), @search.find_movie_cast(params[:movie]), @search.find_movie_review(params[:movie]))
  end

  def create
    # binding.pry
    if params[:Duration_of_Party].to_i < params[:movie_runtime].to_i
     redirect_to request.referrer, notice: "Error: Runtime must be longer than the movie length"
   elsif params[:Date] == ""
     redirect_to request.referrer, notice: "Error: Date cannot be blank"
   elsif params[:Start_Time] == ""
     redirect_to request.referrer, notice: "Error: Time cannot be blank"
   else
     ViewingParty.create!(title: params[:movie_title], date: params[:Date], duration: params[:Duration_of_Party], user_id: params[:host_id], movie_id: params[:movie_id])
     params[:user_ids].each do |id|
       ViewingPartyUser.create!(viewing_party_id: ViewingParty.last.id, user_id: id)
     end
   end
   redirect_to user_path(params[:host_id])
 end


end
