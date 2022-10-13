# frozen_string_literal: true

class DiscoverController < ApplicationController
  def search
    @user = User.find(params[:user_id])
    @movies = []

    if params[:format] == 'top_rated'
      @movies = MovieFacade.top_40_movies
    end
  end

end
