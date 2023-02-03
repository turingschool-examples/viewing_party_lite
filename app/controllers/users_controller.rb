class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @viewing_parties = @user.viewing_parties
    # @movie = MovieFacade.get_movie()

    # # require 'pry'; binding.pry
    # @parties_info = []
    # @viewing_parties.each do |party|
    #   require 'pry'; binding.pry
    #   # @movie = MovieFacade.get_movie(party.movie_id)
    #   host = User.find(party.host_id)
    #   party_info = {
    #     # image: @movie.image_url,
    #     # title: @movie.title,
    #     date: party.party_date,
    #     time: party.party_time,
    #     host: host
    #   }
    #   @parties_info << party_info
    # end

  end
  
  def discover_movies
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    user = User.new(name: params[:name], email: params[:email])
    if user.save(user_params)
      flash.notice = 'User has been created!'
      redirect_to user_path(user)
    else
      flash.alert = 'Cannot use existing email'
      redirect_to register_path
    end
  end
  
  private
    def user_params
      params.permit(:name, :email)
    end
end