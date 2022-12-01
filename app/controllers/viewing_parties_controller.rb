class ViewingPartiesController < ApplicationController
    def new
     @user = User.find(params[:user_id])
     @movie = MovieDetailsSearch.new.movie(params[:movie_id])
     @users = User.where.not(id: params[:user_id])
    end
    def create
       
    end


end