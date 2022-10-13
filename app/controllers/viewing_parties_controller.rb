class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:id])
    @movie = MovieDbFacade.find_by_movie_id(params[:movie_id])
    @other_users = User.all.where.not(id: params[:id])
  end

  def create
    user = User.find(params[:id])
    movie = MovieDbFacade.find_by_movie_id(params[:movie_id])

    if params[:length].to_i > movie.runtime
      new_view_party = ViewingParty.create(movie_title: movie.title, start_time: params[:start_time], date: params[:date], length: params[:length])
      ViewingPartyUser.create(viewing_party_id: new_view_party.id, user_id: user.id, status: 0)

      added_users = params[:user].select{ |user| user != "0" }
      added_users.each { |usr| ViewingPartyUser.create(viewing_party_id: new_view_party.id, user_id: usr, status: 1) }
      redirect_to "/users/#{user.id}"
    else
      flash[:alert] = "Party Length Cannot Be Shorter Than The Movie Runtime"
      return
    end
  end

end
