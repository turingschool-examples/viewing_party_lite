class PartiesController < ApplicationController

  def new
    @movie = MovieFacade.find_movie(params[:movie_id])
    @user = User.find(params[:user_id])
    @users = User.all
  end

  def create
    @movie = MovieFacade.find_movie(params[:movie_id])
    new_party = Party.new(party_params)

    if @movie.runtime <= params[:duration].to_i
      if new_party.save && params[:users]
        params[:users].each do |user|
          u = User.find(user)
          if u.id == params[:host].to_i
            PartyUser.create(user: u, party: new_party, host: true)
          else
            PartyUser.create(user: u, party: new_party, host: false)
          end
        end
        redirect_to "/users/#{params[:user_id]}"
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
