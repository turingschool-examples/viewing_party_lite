class PartiesController < ApplicationController

  def new
    @movie = MovieFacade.find_movie(params[:movie_id])
    @user = User.find(params[:user_id])
    @users = User.all_except_host(params[:user_id])
  end

  def create
    @movie = MovieFacade.find_movie(params[:movie_id])
    new_party = Party.new(party_params)

    if @movie.runtime <= params[:duration].to_i
      if new_party.save
        params[:users].each do |user|
          PartyUser.create(user_id: User.find(user), party: new_party, host: false)
        end
        PartyUser.create(user_id: params[:host] , party: new_party, host: true)
        redirect_to "/users/#{new_party.host}"
      else
        render :new
      end
    end
  end

private

    def party_params
      params.permit(:id, :duration, :date, :time, :host, :movie_id)
    end
end
