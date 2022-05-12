class ViewingPartiesController < ApplicationController
  before_action :all_users, only: [:new]

  def new
    @user = User.find(params[:user_id])
  end

  def create
binding.pry

    user = User.find(params[:id])
#    user.viewing_parties.create!(viewing_party_params)
  user.viewing_parties.create!( duration: params[:duration],
    date: "#{params["date(1i)"]}/#{params["date(2i)"]}/#{params["date(3i)"]}",
    start_time: "#{params["time(4i)"]}:#{params["time(5i)"]}",
    movie_title: params[:movie_title])
    redirect_to user_path(user)
  end

  private
    def all_users
      @users = User.all.compact
      @users.keep_if {|user| user.id != params[:user_id]}
    end
end
