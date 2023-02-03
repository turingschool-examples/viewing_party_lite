class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @viewing_parties = @user.viewing_parties
    @parties_info = []
    @viewing_parties.each do |party|
      movie = MovieFacade.get_movie(party.movie_id)
      host = User.find(party.host_id)
      party_info = {
        movie_id: movie.id,
        image: "https://image.tmdb.org/t/p/w500/#{movie.image_url}",
        title: movie.title,
        duration: party.duration,
        date: party.party_date,
        time: party.party_time,
        host: host.name,
        attendees: party.users
      }
      @parties_info << party_info
    end
    
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