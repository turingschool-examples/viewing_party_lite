class MoviesController < ApplicationController
    def show 
        @movie = MovieFacade.new(params[:id]).movie
        @reviews = ReviewFacade.new(params[:id]).reviews
    end
end