class ViewingpartiesController < ApplicationController

  def new 
    @movie = MovieFacade.service(params[:movie_id]) 
    # @users = User.all_without_current_user
  end

end