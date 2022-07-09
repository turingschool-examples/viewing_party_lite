# frozen_string_literal: true

class PartiesController < ApplicationController
  def new
    @party = Party.new
    @movie = MovieFacade.movie_details(params[:movie_id])
  end

  private

  def party_params
    # params.permit(:name, :email)
  end
end
