class MoviesController < ApplicationController
  before_action :set_user

  
  def index
    if (params[:q] == 'top rated' && !params[:commit].present?) || params[:q] == ''
      @movies = MovieFacade.top_rated
      @subtitle = 'Top Rated Movies'
    elsif params[:q].present?
      @movies = MovieFacade.search(params[:q])
      @subtitle = "Movie results for: '#{params[:q]}'"
    # else
    #   redirect_to "/users/#{@user.id}/discover"
    #   flash[:alert] = 'Something went wrong, please try again'
    end
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
end
