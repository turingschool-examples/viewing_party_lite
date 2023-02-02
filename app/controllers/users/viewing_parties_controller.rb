module Users
  class ViewingPartiesController < ApplicationController
    def new
      @viewing_party = ViewingParty.new
      set_user

      conn = Faraday.new(url: "https://api.themoviedb.org/3")
      response = conn.get("movie/#{params[:movie_id]}?api_key=#{ENV['movie_api_key']}&language=en-US")
      @movie = Movie.new(JSON.parse(response.body, symbolize_names: true))
    end

    def create
      viewing_party = ViewingParty.new(viewing_party_params)
      set_user

      if viewing_party.save
        redirect_to user_path(user)
      else 
        flash[:error] = viewing_party.errors.full_messages
      end
      
    end

    private

    def set_user
      @user = User.find(params[:user_id])
      @users = User.all
    end

    def viewing_party_params
      params.require(:viewing_party).permit(:duration, :start_time, :date, :movie_id)
    end
  end
end