class ViewingPartiesController < ApplicationController
    def new
        @user = User.find(params[:id])
        @movie = MovieDbFacade.find_by_movie_id(params[:movie_id])
        @other_users = User.all.where.not(id: params[:id])
        # require 'pry', binding.pry
    end
end
  