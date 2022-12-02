class ViewingPartiesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @users = User.where.not("id = #{params[:user_id]}")
    @movie = MovieFacade.movie_id(params[:movie_id])
    @party= @user.viewing_parties.new
  end

  def create
    user = User.find(params[:user_id])
    @party = user.viewing_parties.new(party_params)
  end

  private

  def party_params
    binding.pry
  end
end 