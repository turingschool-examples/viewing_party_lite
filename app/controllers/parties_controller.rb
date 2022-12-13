
class PartiesController < ApplicationController
  def new
    @users = User.all
    movie_data = MoviesService.new.search(params[:id])
    @title = movie_data[:original_title]
    @runtime = movie_data[:runtime]
    @user_count = 1
    @movie_poster = params[:movie_poster]
  end

  def create
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

    redirect_to "/users/#{params[:user_id]}"
  end
end
