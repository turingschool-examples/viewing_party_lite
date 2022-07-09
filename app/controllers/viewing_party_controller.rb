class ViewingPartyController < ApplicationController
    def new
      @host = User.find(params[:user_id])
      @users = User.where("id != #{@host.id}")
      @movie = MoviesFacade.get_details(params[:movie_id])
    end

    def create
      @host = User.find(params[:user_id])
      @movie = MoviesFacade.get_details(params[:movie_id])
      @users = User.where("id != #{@host.id}")
      
      
      if params[:duration] > params[:movie_runtime]
        party = Party.create!(party_params)
        
        # turn into model method
        PartyUser.create(party_id: party.id, user_id: @host.id)
        @users.each do |user|
          if params[user.email.to_sym] == "1"
            PartyUser.create(party_id: party.id, user_id: user.id)
          end
        end
        redirect_to user_path(@host.id)
      else
        redirect_to new_user_movie_viewing_party_path(@host.id, @movie.id)
        flash[:notice] = "Party duration too short, try again."
      end
    end

    private

    def party_params
      params.permit(:host, :movie_name, :movie_id, :date, :start_time, :duration)
    end
    
    
end
