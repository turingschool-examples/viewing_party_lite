# frozen_string_literal: true

class DiscoverController < ApplicationController
  def search
    @user = User.find(params[:user_id])
    @top_movies = []
    @movies = []
    @search = ""
    if params[:format] == 'top_rated'
      @top_movies = MovieFacade.top_40_movies
    elsif params[:query].present?
      @movies = MovieFacade.search_first_40(params[:query])
      @search = params[:query]
    end
  end

end
