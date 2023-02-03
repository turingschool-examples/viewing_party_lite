class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:id])

    conn = Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['movie_api_key']
    end
    response = conn.get("/3/movie/#{params[:movie_id]}?")

    @movie = JSON.parse(response.body, symbolize_names: true)
    @users = User.all
  end

  def create
    host = User.find(params[:id])
    viewing_party = host.viewing_parties.create(duration: params[:duration].to_i, event_date: params[:day], start_time: params[:time])
    # viewing_party.user_viewing_parties.create(guests)
    User.all.each do |user|
      next if user == host
      if params[user.name] == "1"
        UserViewingParty.create(user_id: user.id, viewing_party_id: viewing_party.id)
        # require 'pry'; binding.pry
      end
    end
    redirect_to user_path(host)
  end
end
