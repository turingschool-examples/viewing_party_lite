class MoviesController < ApplicationController
    def show
        @user = User.find(params[:user_id])
        # @movie = double(id: 67, title: "Inglorious Bastards")
    end
end