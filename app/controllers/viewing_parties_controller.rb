class ViewingPartiesController < ApplicationController
  def new
    @users = User.where('id != ?', params[:user_id])
    @user = User.find(params[:user_id])
    @movie = params[:movie_id]
    @runtime = params[:runtime]
  end

  def create
    viewing_party = ViewingParty.new(viewing_party_params)
    @users = User.where('id != ?', params[:user_id])
    @user = User.find(params[:user_id])
    @movie = params[:movie_id]
    

    if viewing_party.duration && viewing_party.duration < params[:runtime].to_i
      flash[:notice] = "Error: Duration must be equal to or greater than the movie runtime"
      @runtime = params[:runtime]
      redirect_to new_user_movie_viewing_party_path(params[:user_id], params[:movie_id], params: {runtime: @runtime})
    elsif viewing_party.save(viewing_party_params)
      Invitee.create!(user_id: params[:user_id], viewing_party_id: viewing_party.id, host: true)
      @users.each do |user|
        if params[user.email] == '1'
          Invitee.create!(user_id: user.id, viewing_party_id: viewing_party.id, host: false)
        end
      end
      redirect_to user_dashboard_index_path(params[:user_id])
    else
      flash[:notice] = "Error: All fields must be completed"
      @runtime = params[:runtime]
      redirect_to new_user_movie_viewing_party_path(params[:user_id], params[:movie_id], params: {runtime: @runtime})
    end
  end

  private
  def viewing_party_params
    params.permit(:duration, :when, :start_time)
  end
end
