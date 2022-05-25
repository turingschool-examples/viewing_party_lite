class PartiesController < ApplicationController

  def new
    if current_user.nil?
      redirect_to "/movies/#{params[:movie_id]}"
      flash[:notice] = "You must be log in or register to create a viewing party"
    else
      @movie = MovieFacade.find_movie(params[:movie_id])
      # @user = current_user
      @users = User.all_except_host(current_user.id)
    end
  end

  def create
    @movie = MovieFacade.find_movie(params[:movie_id])
    new_party = Party.new(party_params)

    if @movie.runtime <= params[:duration].to_i
      if new_party.save && params[:users]
        params[:users].each do |user|
          PartyUser.create(user_id: User.find(user), party: new_party, host: false)
        end
        PartyUser.create(user_id: params[:host] , party: new_party, host: true)
        redirect_to "/dashboard"
      else
        render :new
      end
    else
      @user = current_user
      @users = User.all_except_host(params[:user_id])
      flash[:notice] = "Party cannot be shorter than movie's duration!"
      render :new
    end
  end

private

    def party_params
      params.permit(:id, :duration, :date, :time, :host, :movie_id)
    end

    # def current_user
    #   User.find(session[:user_id])
    # end
end
