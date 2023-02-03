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
    user = User.find(params[:id])
    viewing_party = user.viewing_parties.create(duration: params[:duration].to_i, event_date: params[:day], start_time: params[:time])
    # viewing_party.user_viewing_parties.create(guests)
    redirect_to user_path(user)
  end
end
