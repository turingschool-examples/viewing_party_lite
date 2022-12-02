class PartiesController < ApplicationController
  def new
    movie_search = MovieSearch.new
    @movie = movie_search.retrieve_movie(params[:movie_id])
    user = User.find(params[:user_id])
    @other_users = user.other_users
  end

  def create
    user = User.find(params[:user_id])
    movie = MovieSearch.new.retrieve_movie(params[:movie_id])
    new_party = Party.new(party_params)
    new_party[:movie_title] = movie.title

    if (new_party[:duration] >= movie.runtime) && new_party.save
      PartyUser.create(party_id: new_party.id, user_id: user.id, host: true)
      params[:users].each do |id|
        PartyUser.create(party_id: new_party.id, user_id: id.to_i, host: false)
      end
      redirect_to user_path(user)
      redirect_to user_path(user)
    else
      redirect_to new_user_movie_party_path(user, movie.id)
    end
  end

  private

  def party_params
    params.permit(:duration, :date, :start_time)
  end
end
