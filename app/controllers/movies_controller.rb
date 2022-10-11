class MoviesController < ApplicationController
    def show
        @user = User.find(params[:user_id])
        # @movie = Movie.new(id: 67, title: "Inglorious Bastards")
        # movie_data = MovieService.find_by_id(params[:id])
        # @movie = Movie.new(movie_data)
        # @movie = Movie.new()
    end
end