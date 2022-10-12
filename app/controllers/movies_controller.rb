class MoviesController < ApplicationController
  def index
    if params[:q] == 'top_rated'
      'some fucking jibberish'
    else params[:q]
      'some fucking jibberish'
    end
  end
end