# frozen_string_literal: true

class DiscoverController < ApplicationController
  def search
    binding.pry
    @user = User.find(params[:user_id])

    # if params[:format] == 'top_rated'
    #   @movies = MovieService.get_top_rated_movies
    # end
  end

end
