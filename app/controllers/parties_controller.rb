class PartiesController < ApplicationController
  before_action :set_user, only: [:new, :create]
  before_action :set_movie, only: [:new, :create]
  before_action :set_users, only: [:new]

  def new
  end

  def create
    @party = Party.create!(
      duration: params[:duration],
      date: params[:date],
      start: params[:start],
      movie_id: create_movie.id,
    )
    set_host
    PartyFacade.invite_users(params[:invited].keys, @party)
    redirect_to user_path(@user)
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_movie
      @movie = MovieFacade.get_movie(params[:movie_id])
    end

    def create_movie
      @new_movie = Movie.create!(api_id: params[:movie_id])
    end

    def set_users
      @users = User.where('users.id != ?', params[:user_id])
    end

    def set_host
      PartyUser.create!(
        user_id: @user.id,
        party_id: @party.id,
        is_host: true
      )
    end
end
