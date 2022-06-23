class PartiesController < ApplicationController
  before_action :duration_vs_runtime, only: [:create]

  def new
    if current_user.nil?
      redirect_to "/movies/#{params[:movie_id]}"
      flash[:notice] = "You must be log in or register to create a viewing party"
    else
      @movie = MovieFacade.find_movie(params[:movie_id])
      @users = User.all_except_host(current_user.id)
    end
  end

  def create
    @movie = MovieFacade.find_movie(params[:movie_id])
    new_party = Party.new(party_params)
    if new_party.save
      if params[:users].present?
        params[:users].each do |user|
          PartyUser.create(user_id: user, party: new_party, host: false)
        end
      end
      PartyUser.create(user_id: params[:host] , party: new_party, host: true)
      redirect_to "/dashboard"
    else
      render :new
    end
  end

  def destroy
    Party.destroy(params[:id])
    redirect_to "/dashboard"
  end

private
    def party_params
      params.permit(:id, :duration, :date, :time, :host, :movie_id)
    end

    def duration_vs_runtime
      @movie = MovieFacade.find_movie(params[:movie_id])
      new_party = Party.new(party_params)
      if new_party.duration < @movie.runtime
        flash[:notice] = "Party cannot be shorter than movie's duration!"
        redirect_to "/movies/#{@movie.id}/viewing_party/new"
      end
    end
end
