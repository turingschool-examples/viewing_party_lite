module Users
  class ViewingPartiesController < ApplicationController
    def new
      @viewing_party = ViewingParty.new
      set_user
      @movie = MovieFacade.find_movie("movie/#{params[:movie_id]}?api_key=#{ENV['movie_api_key']}&language=en-US")
    end

    def create
      @viewing_party = ViewingParty.new(viewing_party_params)
      set_user

      if @viewing_party.save
        redirect_to user_path(@user)
      else
        flash[:error] = @viewing_party.errors.full_messages
        redirect_to new_user_movie_viewing_party_path(@user, params[:movie_id])
      end

      create_user_viewing_parties
    end

    private

    def create_user_viewing_parties
      UserViewingParty.create({user_id: @user.id, viewing_party_id: @viewing_party.id, hosting: true})
      params[:viewing_party].each do |key, value|
        if value == '1' && key != :movie_id
          UserViewingParty.create({user_id: key, viewing_party_id: @viewing_party.id})
        end
      end
    end

    def set_user
      @user = User.find(params[:user_id])
      @users = User.all
    end

    def viewing_party_params
      params[:viewing_party][:movie_id] = params[:movie_id]
      params.require(:viewing_party).permit(:duration, :start_time, :date, :movie_id)
    end
  end
end