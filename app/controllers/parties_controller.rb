class PartiesController < ApplicationController
  def new
    @users = User.all
    @host = User.find(params[:user_id])
    @movie = MovieFacade.search_by_id(params[:movie_id])
  end

  def create
    host = User.find(params[:user_id])
    party = Party.create({host_id: host.id,
                        movie_id: params[:movie_id],
                        date: params[:date],
                        start_time: params[:start_time],
                        length: params[:length]})
    binding.pry
    redirect_to "/users/#{host.id}"
  end

  private
    def party_params
      params.permit(:movie_id, :date, :start_time, :length)
    end
end
