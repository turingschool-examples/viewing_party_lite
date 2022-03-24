class ViewingPartyController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = Movie.new(id: 22, title: "Pirates of the Caribbean: The Curse of the Black Pearl", runtime: 102, vote_average: 10)

  end
end
