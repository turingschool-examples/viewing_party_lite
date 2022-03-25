class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:q] == 'top%20rated'
      @results = MovieFacade.top_twenty
    else
      @results = MovieFacade.search(params[:search])
      @search = params[:search]
    end
  end
end
