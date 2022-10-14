class User::MoviesController < User::BaseController
  def index
    if params[:q] == 'top rated'
      @movies = MovieFacade.popular
    elsif params[:q].present?
      @movies = MovieFacade.search(params[:q])
    else
      redirect_to "/users/#{@user.id}/discover"
      flash[:alert] = 'Something went wrong, please try again'
    end
  end
end
