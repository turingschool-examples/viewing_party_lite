class MoviesController < ApplicationController
  def discover
    @user = User.find(params[:id])
  end

  def index
    @facade = MoviesSearchFacade.new(params[:id], params[:q])
    if @facade.query_params == ""
      flash[:alert] = "Error: You must provide a query"
      redirect_to "/users/#{@facade.user_id}/discover"
    end
  end

  def show 
    @facade = MovieDetailsFacade.new(params[:user_id], params[:id])
  end
end
