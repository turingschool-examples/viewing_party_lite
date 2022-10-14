class ViewingPartiesController < ApplicationController
  
  def new
    @user = User.find(params[:user_id])
    @users = User.all.where.not(name: @user.name)
    @movie = MovieFacade.details_poro(params[:movie_id])
  end

  def create
    @user = User.find(params[:user_id])
    @movie = MovieFacade.details_poro(params[:movie_id])
    @users = User.all.where.not(name: @user.name)

    if params[:duration].to_i > @movie.runtime.to_i
      party = ViewingParty.create(duration: params[:duration], date: params[:date], time: params[:time], host_id: @user.id, movie_id: params[:movie_id] )
    else
      flash[:notice] = "Party duration must be greater than movie runtime "
     render :new
    end

    # if party.save!
    #   flash.alert = party.errors.full_messages.to_sentence
    #   render :new
    # else 
    #   flash.notice = "Yay ptay was scheduled"
    # end

    invited_users = params[:user].select do |user_id|
      user_id != "0"
    end
    test = ViewingPartyUser.create(viewing_party_id: party.id, user_id: invited_users )
    redirect_to user_path(@user)
  end

  def viewing_party_params
    params.permit(:duration, :date, :time, :movie_id)
  end
end
