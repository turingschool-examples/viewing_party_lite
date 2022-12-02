class ViewingPartiesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @users = User.where.not("id = #{params[:user_id]}")
    @movie = MovieFacade.movie_id(params[:movie_id])
    @viewing_party = @user.viewing_parties.new
  end

end 