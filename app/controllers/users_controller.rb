# frozen_string_literal: true
require 'faraday'

class UsersController < ApplicationController
  def new; end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
    else
      flash[:alert] = 'User could not be created'
      redirect_to '/register'
    end
  end

  def discover
    @user = User.find(params[:id])
  end

  def movies
    @user = User.find(params[:id])
    if params[:q] == "top_40_movies"
      @movies = MovieService.top_40
    elsif !params[:find_movie].nil?
      @movies = MovieService.find(params[:find_movie].downcase)
    else
      redirect_to "/users/#{params[:id]}/discover"
      binding.pry
      # flash "please select a valid input"
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
