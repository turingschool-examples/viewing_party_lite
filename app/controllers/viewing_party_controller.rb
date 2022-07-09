class ViewingPartyController < ApplicationController
    def new
      @host = User.find(params[:user_id])
      @users = User.where("id != #{@host.id}")
      @movie = MoviesFacade.get_details(params[:movie_id])
    end
end
