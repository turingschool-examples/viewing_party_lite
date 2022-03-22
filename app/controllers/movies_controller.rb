class MoviesController < ApplicationController
    def show 
        @movie = MovieFacade.new(params[:id]).movie
        @reviews = ReviewFacade.new(params[:id]).reviews
        @cast = CastFacade.new(params[:id]).top_cast
        binding.pry
    end
end