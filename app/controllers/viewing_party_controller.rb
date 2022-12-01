class ViewingPartyController < ApplicationController
   def new
      @user = User.find(params[:user_id])
      @movie_details = MovieFacade.get_movie_details(params[:id])   
   end

   def create
      @user = User.find(params[:user_id])
      @movie_details = MovieFacade.get_movie_details(params[:id])
      # if params[:duration] >= params[:runtime]
      #    party = Party.create!(viewing_party_params)
      #    redirect_to user_path(@user.id)
      # end
   end

   # private

   # def viewing_party_params
   #    params.permit(:id, :title, :duration, :date, :start_time)
   # end

end