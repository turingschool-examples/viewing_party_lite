class ViewingPartyController < ApplicationController

  def new
    @movie = MovieFacade.movie_id_search(params[:movie_id])
    # @movie_id = params[:movie_id]
    @user_id = params[:user_id].to_i
    @users = User.all
  end

  def create
    users = User.all
    host_id = params[:user_id].to_i
    movie = MovieFacade.movie_id_search(params[:movie_id])

    if params[:duration].to_i < movie.runtime.to_i
      flash[:notice] = "Please enter a duration that is longer than the movie runtime"
      redirect_to new_user_movie_viewing_party_path(host_id, movie.id)
    else
      viewing_party = ViewingParty.create!(movie_id: params[:movie_id],
                                            duration: params[:duration],
                                            date: "#{params['date(1i)']}-#{params['date(2i)']}-#{params['date(3i)']}",
                                            start_time: "#{params['start_time(4i)']}:#{params['start_time(5i)']}")
      users.each do |user|
        if host_id != user.id && params[user.name.to_sym] == '1'
          UserViewingParty.create!(user_id: user.id, viewing_party_id: viewing_party.id, host: false)
        else
          UserViewingParty.create!(user_id: host_id, viewing_party_id: viewing_party.id, host: true)
        end
      end
      redirect_to user_path(host_id)
    end
  end
end
