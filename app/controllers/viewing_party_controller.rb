class ViewingPartyController < ApplicationController
  def new
    # require "pry"; binding.pry
    @user = User.find(params[:user_id])
    @movie = Movie.new(id: 22, title: "Pirates of the Caribbean: The Curse of the Black Pearl", runtime: 102, vote_average: 10)
    # # @movie = Movie.find(params[:movie_id])
    # @movie = Movie.new.search(params[:movie_id])
  end
end
