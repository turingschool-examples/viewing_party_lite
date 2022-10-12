class DiscoverController < ApplicationController
  def index
    @movie = MovieFacade
  end
end