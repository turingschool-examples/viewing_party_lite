class PartiesController < ApplicationController
  before_action :set_user, only: [:new]
  before_action :set_movie, only: [:new]
  before_action :set_users, only: [:new]

  def new;end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_movie
      @movie = MovieFacade.get_movie(params[:movie_id])
    end

    def set_users
      binding.pry
      @users = User.all
    end
end
