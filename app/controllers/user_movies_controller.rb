# frozen_string_literal: true

class UserMoviesController < ApplicationController
  def details
    if session[:user_id]
      @user = User.find(session[:user_id])
      if params[:q] == 'top rated'
        @top_rated = MovieFacade.top_rated
      elsif params[:search] && params[:search] != (nil || '')
        @search_results = MovieFacade.movie_search(params[:search])
        if @search_results == []
          redirect_to "/discover"
          flash.alert = 'No Results Found'
        end
      else
        redirect_to "/discover"
        flash.alert = 'No Results Found'
      end
    end
  end
end
