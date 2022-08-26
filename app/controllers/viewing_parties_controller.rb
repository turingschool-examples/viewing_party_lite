class ViewingPartiesController < ApplicationController

  def new
    @users = User.all
    @movie = MovieFacade.find_movie_details(params[:movie_id])
  end

  def create
    invited = []
    params.each do |k,v|
      if k.to_i != 0 && v == '1'
        invited << k
      end
    end
    a = Party.create!(date: params[:date], start_time: params[:start_time], movie_id: params[:movie_id])
    binding.pry
    invited.each do |id|

    end

  end
end
