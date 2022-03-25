class ViewingPartyController < ApplicationController
  def new
    @users = User.all
    @user = User.find(params[:user_id])
    @movie = MovieFacade.new.details(params[:id])
    @party = Party.new
    # binding.pry
  end

  def create
    # params['time(3i)'] = "#{params['date(2i)']}-#{params['date(3i)']}-#{params['date(1i)']}"
    # params['time(2i)'] = "#{params['time(4i)']}:#{params['time(5i)']}"
    # binding.pry
    @party = Party.create(party_params)
    #   start_date: params['time(3i)'],
    #   start_time: params['time(2i)'],
    #   duration: params["duration"],
    #   movie_id: params["id"],
    #   host_id: params["user_id"]
    # )
    binding.pry

  end
end

private

  def party_params
    params.permit(:start_date, :start_time, :duration, :movie_id, :host_id)
  end
