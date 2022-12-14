
class PartiesController < ApplicationController
  before_action :current_user
  def new
    @user = current_user
    if current_user == nil
      # require 'pry'; binding.pry
      flash[:alert] = "Must log in or register to create a viewing party"
      redirect_to "/dashboard/movies/#{params[:id]}"
    else
      @users = User.all
      movie_data = MoviesService.new.search(params[:id])
      @title = movie_data[:original_title]
      @runtime = movie_data[:runtime]
      @user_count = 1
      @movie_poster = params[:movie_poster]
    end
  end

  def create
    @user = current_user
    combined_date = Date.new(params['date(1i)'].to_i, params['date(2i)'].to_i, params['date(3i)'].to_i)
    combined_time = Time.new(params['time(1i)'].to_i, params['time(2i)'].to_i, params['time(3i)'].to_i,
                             params['time(4i)'].to_i, params['time(5i)'].to_i)

    party = Party.create!(movie_title: params[:movie_title], duration: params[:duration], host_id: params[:host_id],
                          date: combined_date, time: combined_time, movie_poster: params[:movie_poster])

    UserParty.create(party_id: party.id, user_id: party.host_id)

    number_of_users = User.all.length

    i = 0

    until i == number_of_users
      UserParty.create(party_id: party.id, user_id: params[i.to_s]) if params[i.to_s].present?
      i += 1
    end

    redirect_to "/dashboard"
  end

  private
  def require_user
    redirect_to '/dashboard/movies/' unless current_user
  end
end
