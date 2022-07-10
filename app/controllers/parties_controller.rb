class PartiesController < ApplicationController

    def new
        @user = User.find(params[:user_id])
        @movie = MovieFacade.search_movie(params[:movie_id])
        @viewing_party = Party.new
        @all_users = User.all
    end

    def create 
        viewing_party = Party.new(viewing_params)
    end



    def viewing_params
        params.permit(:duration, :date, :time, :user_id, :movie_id, :user_name)
    end
end