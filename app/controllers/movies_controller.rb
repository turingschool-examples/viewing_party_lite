class MoviesController < ApplicationController
  before_action :set_user
  def index
    @movies = MovieFacade.top20 if params[:q] == 'top rated'
    if params[:keyword]
      @movies = MovieFacade.search(params[:keyword])
      @keyword = params[:keyword]
      if @movies.instance_of?(String)
        redirect_to "/users/#{@user.id}/discover"
        flash[:alert] = "Error: #{@movies}, please try again!."
      end
    end
  end


  def show
    @data = MovieFacade.movie_data(params[:id])
  end



  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
